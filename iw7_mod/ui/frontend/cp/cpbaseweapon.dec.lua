local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	assert( f1_arg0.QualityIcon )
	local f1_local0 = function ()
		local f2_local0 = f1_arg0:GetDataSource()
		if f2_local0.equippedQuality:GetValue( f1_arg1 ) == 0 then
			ACTIONS.AnimateSequence( f1_arg0, "HideQuality" )
		else
			ACTIONS.AnimateSequence( f1_arg0, "ShowQuality" )
		end
	end
	
	ACTIONS.UploadStats( f1_arg0, f1_arg1 )
	f1_arg0.QualityIcon:SubscribeToModelThroughElement( f1_arg0, "equippedQuality", f1_local0 )
	f1_arg0.QualityIcon:SubscribeToModelThroughElement( f1_arg0, "equipped", f1_local0 )
	f1_arg0.bindButton:addEventHandler( "button_action", function ()
		local f3_local0 = f1_arg0:GetDataSource()
		if f3_local0.isDisabled:GetValue( f1_arg1 ) ~= nil then
			f3_local0 = f1_arg0:GetDataSource()
			if f3_local0.isDisabled:GetValue( f1_arg1 ) == false then
				f1_arg0:dispatchEventToCurrentMenu( {
					name = "set_current_weapon"
				} )
			end
		end
	end )
	f1_arg0:addEventHandler( "gain_focus", function ()
		local f4_local0 = ""
		local f4_local1 = f1_arg0:GetCurrentMenu()
		local f4_local2 = f1_arg0:GetDataSource()
		if not f4_local2.isDisabled:GetValue( f1_arg1 ) then
			f4_local0 = Engine.Localize( "LUA_MENU_MP_PERSONALIZE" )
		end
		f1_arg0:AddButtonHelperTextToElement( f4_local1.ButtonHelperBar, {
			helper_text = f4_local0,
			button_ref = "button_alt2",
			side = "left",
			clickable = true,
			priority = 10
		} )
	end )
	f1_arg0.properties = f1_arg0.properties or {}
	f1_arg0.properties.muteAction = true
	f1_arg0.QualityIcon:SubscribeToModelThroughElement( f1_arg0, "isMk2", function ()
		local f5_local0 = f1_arg0:GetDataSource()
		f5_local0 = f5_local0.equippedQualityImage:GetValue( f1_arg1 )
		if f5_local0 ~= nil then
			f1_arg0.QualityIcon.IconDuplicate:setImage( RegisterMaterial( f5_local0 .. "_mk2" ), 0 )
		end
		local f5_local1 = f1_arg0:GetDataSource()
		if f5_local1.isMk2:GetValue( f1_arg1 ) then
			ACTIONS.AnimateSequenceByElement( f1_arg0, {
				elementName = "QualityIcon",
				sequenceName = "LegendaryPulse",
				elementPath = "QualityIcon"
			} )
		else
			f1_arg0.QualityIcon.IconDuplicate:SetAlpha( 0, 0 )
			ACTIONS.AnimateSequenceByElement( f1_arg0, {
				elementName = "QualityIcon",
				sequenceName = "StopPulse",
				elementPath = "QualityIcon"
			} )
		end
	end )
	if CONDITIONS.UseCACBreadCrumbs() then
		assert( f1_arg0.CPButtonBaseimage )
		assert( f1_arg0.CPButtonBaseimage.NewItemNotification )
		Cac.SetupBaseWeaponNewNotificationHandlers( f1_arg0, f1_arg1, f1_arg0.CPButtonBaseimage.NewItemNotification )
	end
end

function CPBaseWeapon( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 250 * _1080p, 0, 140.2 * _1080p )
	self.id = "CPBaseWeapon"
	self._animationSets = {}
	self._sequences = {}
	local f6_local1 = controller and controller.controllerIndex
	if not f6_local1 and not Engine.InFrontend() then
		f6_local1 = self:getRootController()
	end
	assert( f6_local1 )
	local f6_local2 = self
	local CPButtonBaseimage = nil
	CPButtonBaseimage = MenuBuilder.BuildRegisteredType( "CPButtonBaseimage", {
		controllerIndex = f6_local1
	} )
	CPButtonBaseimage.id = "CPButtonBaseimage"
	CPButtonBaseimage.Name:SetAlignment( LUI.Alignment.Left )
	CPButtonBaseimage.Image:SetLeft( _1080p * -100, 0 )
	CPButtonBaseimage.Image:SetRight( _1080p * 100, 0 )
	CPButtonBaseimage.Image:SetTop( _1080p * -102.5, 0 )
	CPButtonBaseimage.Image:SetBottom( _1080p * -2.5, 0 )
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		CPButtonBaseimage.LevelBacker:SetAlpha( 0, 0 )
	end
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		CPButtonBaseimage.LevelFrame:SetAlpha( 0, 0 )
	end
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		CPButtonBaseimage.Level:SetAlpha( 0, 0 )
	end
	CPButtonBaseimage:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 250, _1080p * 3, _1080p * 136.2 )
	CPButtonBaseimage:SubscribeToModelThroughElement( self, "name", function ()
		local f7_local0 = self:GetDataSource()
		f7_local0 = f7_local0.name:GetValue( f6_local1 )
		if f7_local0 ~= nil then
			CPButtonBaseimage.Name:setText( f7_local0, 0 )
		end
	end )
	CPButtonBaseimage:SubscribeToModelThroughElement( self, "image", function ()
		local f8_local0 = self:GetDataSource()
		f8_local0 = f8_local0.image:GetValue( f6_local1 )
		if f8_local0 ~= nil then
			CPButtonBaseimage.Image:setImage( RegisterMaterial( f8_local0 ), 0 )
		end
	end )
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		CPButtonBaseimage:SubscribeToModelThroughElement( self, "weaponLevel", function ()
			local f9_local0 = self:GetDataSource()
			f9_local0 = f9_local0.weaponLevel:GetValue( f6_local1 )
			if f9_local0 ~= nil then
				CPButtonBaseimage.Level:setText( f9_local0, 0 )
			end
		end )
	end
	self:addElement( CPButtonBaseimage )
	self.CPButtonBaseimage = CPButtonBaseimage
	
	local Selected = nil
	
	Selected = MenuBuilder.BuildRegisteredType( "CaCSelectedMessage", {
		controllerIndex = f6_local1
	} )
	Selected.id = "Selected"
	Selected:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 202, _1080p * -2, _1080p * 156, _1080p * 176 )
	Selected:SubscribeToModelThroughElement( self, "equippedAlpha", function ()
		local f10_local0 = self:GetDataSource()
		f10_local0 = f10_local0.equippedAlpha:GetValue( f6_local1 )
		if f10_local0 ~= nil then
			Selected:SetAlpha( f10_local0, 0 )
		end
	end )
	self:addElement( Selected )
	self.Selected = Selected
	
	local QualityIcon = nil
	
	QualityIcon = MenuBuilder.BuildRegisteredType( "QualityIcon", {
		controllerIndex = f6_local1
	} )
	QualityIcon.id = "QualityIcon"
	QualityIcon.IconShadow:SetAlpha( 0.2, 0 )
	QualityIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 8, _1080p * 40, _1080p * 98, _1080p * 130 )
	QualityIcon:SubscribeToModelThroughElement( self, "equippedQualityImage", function ()
		local f11_local0 = self:GetDataSource()
		f11_local0 = f11_local0.equippedQualityImage:GetValue( f6_local1 )
		if f11_local0 ~= nil then
			QualityIcon.IconShadow:setImage( RegisterMaterial( f11_local0 ), 0 )
		end
	end )
	QualityIcon:SubscribeToModelThroughElement( self, "equippedQualityColor", function ()
		local f12_local0 = self:GetDataSource()
		f12_local0 = f12_local0.equippedQualityColor:GetValue( f6_local1 )
		if f12_local0 ~= nil then
			QualityIcon.Icon:SetRGBFromInt( f12_local0, 0 )
		end
	end )
	QualityIcon:SubscribeToModelThroughElement( self, "equippedQualityImage", function ()
		local f13_local0 = self:GetDataSource()
		f13_local0 = f13_local0.equippedQualityImage:GetValue( f6_local1 )
		if f13_local0 ~= nil then
			QualityIcon.Icon:setImage( RegisterMaterial( f13_local0 ), 0 )
		end
	end )
	QualityIcon:SubscribeToModelThroughElement( self, "equippedQualityColor", function ()
		local f14_local0 = self:GetDataSource()
		f14_local0 = f14_local0.equippedQualityColor:GetValue( f6_local1 )
		if f14_local0 ~= nil then
			QualityIcon.IconDuplicate:SetRGBFromInt( f14_local0, 0 )
		end
	end )
	QualityIcon:SubscribeToModelThroughElement( self, "equippedQualityImage", function ()
		local f15_local0 = self:GetDataSource()
		f15_local0 = f15_local0.equippedQualityImage:GetValue( f6_local1 )
		if f15_local0 ~= nil then
			QualityIcon.IconDuplicate:setImage( RegisterMaterial( f15_local0 ), 0 )
		end
	end )
	self:addElement( QualityIcon )
	self.QualityIcon = QualityIcon
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		CPButtonBaseimage:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.CPButtonBaseimage:SetScale( 0, 100 )
				end
			},
			{
				function ()
					return self.CPButtonBaseimage:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 335, 0, _1080p * 175, 100 )
				end
			}
		} )
		Selected:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Selected:SetScale( 0, 100 )
				end
			},
			{
				function ()
					return self.Selected:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 9, _1080p * -9, _1080p * 36, _1080p * 56, 100 )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			CPButtonBaseimage:AnimateSequence( "ButtonOver" )
			Selected:AnimateSequence( "ButtonOver" )
		end
		
		CPButtonBaseimage:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.CPButtonBaseimage:SetScale( -0.35, 100 )
				end
			},
			{
				function ()
					return self.CPButtonBaseimage:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -58.63, _1080p * 276.38, _1080p * -30.63, _1080p * 144.38, 100 )
				end
			}
		} )
		Selected:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Selected:SetScale( -0.35, 100 )
				end
			},
			{
				function ()
					return self.Selected:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * -49.63, _1080p * -67.63, _1080p * 19, _1080p * 39, 100 )
				end
			}
		} )
		self._sequences.ButtonUp = function ()
			CPButtonBaseimage:AnimateSequence( "ButtonUp" )
			Selected:AnimateSequence( "ButtonUp" )
		end
		
		QualityIcon:RegisterAnimationSequence( "ShowQuality", {
			{
				function ()
					return self.QualityIcon:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.ShowQuality = function ()
			QualityIcon:AnimateSequence( "ShowQuality" )
		end
		
		QualityIcon:RegisterAnimationSequence( "HideQuality", {
			{
				function ()
					return self.QualityIcon:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.HideQuality = function ()
			QualityIcon:AnimateSequence( "HideQuality" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	self:SubscribeToModelThroughElement( self, "isDisabled", function ()
		local f32_local0 = self:GetDataSource()
		if f32_local0.isDisabled:GetValue( f6_local1 ) ~= nil then
			f32_local0 = self:GetDataSource()
			if f32_local0.isDisabled:GetValue( f6_local1 ) == true then
				ACTIONS.AnimateSequenceByElement( self, {
					elementName = "CPButtonBaseimage",
					sequenceName = "Locked",
					elementPath = "CPButtonBaseimage"
				} )
			end
		end
		f32_local0 = self:GetDataSource()
		if f32_local0.isDisabled:GetValue( f6_local1 ) ~= nil then
			f32_local0 = self:GetDataSource()
			if f32_local0.isDisabled:GetValue( f6_local1 ) == false then
				ACTIONS.AnimateSequenceByElement( self, {
					elementName = "CPButtonBaseimage",
					sequenceName = "Unlocked",
					elementPath = "CPButtonBaseimage"
				} )
			end
		end
	end )
	self:SubscribeToModelThroughElement( self, "equipped", function ()
		local f33_local0 = self:GetDataSource()
		if f33_local0.equipped:GetValue( f6_local1 ) ~= nil then
			f33_local0 = self:GetDataSource()
			if f33_local0.equipped:GetValue( f6_local1 ) == true then
				ACTIONS.AnimateSequenceByElement( self, {
					elementName = "Selected",
					sequenceName = "Activate",
					elementPath = "Selected"
				} )
			end
		end
	end )
	self.bindButton:addEventHandler( "button_secondary", function ( f34_arg0, f34_arg1 )
		local f34_local0 = f34_arg1.controller or f6_local1
		local f34_local1 = f34_arg0:getParent()
		if #f34_local1:getAllFocusedChildren() <= 0 then
			f34_local1 = f34_arg0:getParent()
			if f34_local1:isInFocus() then
			
			else
				return false
			end
		end
		ACTIONS.LeaveMenu( self )
		return true
	end )
	PostLoadFunc( self, f6_local1, controller )
	return self
end

MenuBuilder.registerType( "CPBaseWeapon", CPBaseWeapon )
LockTable( _M )
