local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	if CONDITIONS.UseCACBreadCrumbs() then
		assert( f1_arg0.Base )
		assert( f1_arg0.Base.NewItemNotification )
		Cac.SetupBaseWeaponNewNotificationHandlers( f1_arg0, f1_arg1, f1_arg0.Base.NewItemNotification )
	end
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		assert( f1_arg0.QualityIcon )
		local f1_local0 = function ()
			local f2_local0 = f1_arg0:GetDataSource()
			f2_local0 = f2_local0.equippedQuality:GetValue( f1_arg1 )
			local f2_local1 = f1_arg0:GetDataSource()
			if f2_local0 == 0 or not f2_local1.equipped:GetValue( f1_arg1 ) then
				ACTIONS.AnimateSequence( f1_arg0, "HideQuality" )
			else
				ACTIONS.AnimateSequence( f1_arg0, "ShowQuality" )
			end
		end
		
		f1_arg0.QualityIcon:SubscribeToModelThroughElement( f1_arg0, "equippedQuality", f1_local0 )
		f1_arg0.QualityIcon:SubscribeToModelThroughElement( f1_arg0, "equipped", f1_local0 )
		f1_arg0.QualityIcon:SubscribeToModelThroughElement( f1_arg0, "isMk2", function ()
			local f3_local0 = f1_arg0:GetDataSource()
			f3_local0 = f3_local0.isMk2:GetValue( f1_arg1 )
			local f3_local1 = f1_arg0:GetDataSource()
			f3_local1 = f3_local1.equippedQualityImage:GetValue( f1_arg1 )
			if f3_local1 ~= nil then
				f1_arg0.QualityIcon.IconDuplicate:setImage( RegisterMaterial( f3_local1 .. "_mk2" ), 0 )
			end
			if f3_local0 then
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
	end
	if Engine.IsSingleplayer() then
		f1_arg0:addEventHandler( "lose_focus", function ( f4_arg0, f4_arg1 )
			local f4_local0 = f1_arg0:GetDataSource()
			if f4_local0 then
				local f4_local1 = f4_local0.ref:GetValue( f1_arg1 )
				if f4_local0.isScanned:GetValue( f1_arg1 ) then
					DataSources.alwaysLoaded.playerData.SP.spData.weaponsScanned[f4_local1]:SetValue( f1_arg1, Cac.scannedWeaponStates.UNLOCKED )
				end
			end
		end )
	end
	if not f1_arg0.properties then
		f1_arg0.properties = {}
	end
	if Engine.IsPC() then
		f1_arg0:addEventHandler( "button_action", function ( f5_arg0, f5_arg1 )
			f1_arg0:dispatchEventToCurrentMenu( {
				name = "weapon_select_alternate"
			} )
		end )
		f1_arg0:addEventHandler( "button_action_disable", function ( f6_arg0, f6_arg1 )
			f1_arg0:dispatchEventToCurrentMenu( {
				name = "weapon_select_alternate_disable"
			} )
		end )
	end
	f1_arg0.properties.muteAction = true
	if CONDITIONS.IsDraftEnabled() then
		f1_arg0:addEventHandler( "update_drafted", function ()
			local f7_local0 = f1_arg0:GetCurrentMenu()
			local f7_local1 = f1_arg0:GetDataSource()
			local f7_local2 = f7_local1.isItemUnlocked
			local f7_local3 = Cac.GetWeaponIndex( f7_local1.baseWeaponRef )
			local f7_local4 = LoadoutDrafting.GetPlayerXUIDWithWeapon( f1_arg1, f7_local3, 1 )
			local f7_local5 = LoadoutDrafting.GetPlayerXUIDWithWeapon( f1_arg1, f7_local3, 2 )
			local f7_local6 = true
			if not Engine.IsXUIDInvalid( f7_local4 ) or not Engine.IsXUIDInvalid( f7_local5 ) then
				f7_local6 = false
			end
			if f7_local6 then
				f7_local6 = f7_local2
			end
			if f7_local6 ~= f7_local1.isUnlocked:GetValue( f1_arg1 ) then
				f7_local1.isUnlocked:SetValue( f1_arg1, f7_local6 )
			end
		end )
	end
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() and CONDITIONS.IsWeaponLevelShown( f1_arg0 ) then
		f1_arg0.WeaponLevel:SetDataSourceThroughElement( f1_arg0, "ref" )
	end
end

function BaseWeapon( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 250 * _1080p, 0, 133.2 * _1080p )
	self.id = "BaseWeapon"
	self._animationSets = {}
	self._sequences = {}
	local f8_local1 = controller and controller.controllerIndex
	if not f8_local1 and not Engine.InFrontend() then
		f8_local1 = self:getRootController()
	end
	assert( f8_local1 )
	local f8_local2 = self
	self:SubscribeToModelThroughElement( self, "isDisabled", function ()
		local f9_local0 = self:GetDataSource()
		f9_local0 = f9_local0.isDisabled:GetValue( f8_local1 )
		if f9_local0 ~= nil then
			self:SetButtonDisabled( f9_local0 )
		end
	end )
	local Base = nil
	Base = MenuBuilder.BuildRegisteredType( "CaCButtonBaseImage", {
		controllerIndex = f8_local1
	} )
	Base.id = "Base"
	Base.Image:SetLeft( _1080p * -100, 0 )
	Base.Image:SetRight( _1080p * 100, 0 )
	Base.Image:SetTop( _1080p * -102.5, 0 )
	Base.Image:SetBottom( _1080p * -2.5, 0 )
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		Base.Level:setText( "Level: 3", 0 )
	end
	Base.Name:SetAlignment( LUI.Alignment.Left )
	Base:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 250, 0, _1080p * 133.2 )
	Base:SubscribeToModelThroughElement( self, "image", function ()
		local f10_local0 = self:GetDataSource()
		f10_local0 = f10_local0.image:GetValue( f8_local1 )
		if f10_local0 ~= nil then
			Base.Image:setImage( RegisterMaterial( f10_local0 ), 0 )
		end
	end )
	Base:SubscribeToModelThroughElement( self, "name", function ()
		local f11_local0 = self:GetDataSource()
		f11_local0 = f11_local0.name:GetValue( f8_local1 )
		if f11_local0 ~= nil then
			Base.Name:setText( f11_local0, 0 )
		end
	end )
	self:addElement( Base )
	self.Base = Base
	
	local f8_local4 = nil
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		f8_local4 = MenuBuilder.BuildRegisteredType( "QualityIcon", {
			controllerIndex = f8_local1
		} )
		f8_local4.id = "QualityIcon"
		f8_local4.IconShadow:SetAlpha( 0.2, 0 )
		f8_local4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 8, _1080p * 40, _1080p * 98, _1080p * 130 )
		f8_local4:SubscribeToModelThroughElement( self, "equippedQualityImage", function ()
			local f12_local0 = self:GetDataSource()
			f12_local0 = f12_local0.equippedQualityImage:GetValue( f8_local1 )
			if f12_local0 ~= nil then
				f8_local4.IconShadow:setImage( RegisterMaterial( f12_local0 ), 0 )
			end
		end )
		f8_local4:SubscribeToModelThroughElement( self, "equippedQualityColor", function ()
			local f13_local0 = self:GetDataSource()
			f13_local0 = f13_local0.equippedQualityColor:GetValue( f8_local1 )
			if f13_local0 ~= nil then
				f8_local4.Icon:SetRGBFromInt( f13_local0, 0 )
			end
		end )
		f8_local4:SubscribeToModelThroughElement( self, "equippedQualityImage", function ()
			local f14_local0 = self:GetDataSource()
			f14_local0 = f14_local0.equippedQualityImage:GetValue( f8_local1 )
			if f14_local0 ~= nil then
				f8_local4.Icon:setImage( RegisterMaterial( f14_local0 ), 0 )
			end
		end )
		f8_local4:SubscribeToModelThroughElement( self, "equippedQualityColor", function ()
			local f15_local0 = self:GetDataSource()
			f15_local0 = f15_local0.equippedQualityColor:GetValue( f8_local1 )
			if f15_local0 ~= nil then
				f8_local4.IconDuplicate:SetRGBFromInt( f15_local0, 0 )
			end
		end )
		self:addElement( f8_local4 )
		self.QualityIcon = f8_local4
	end
	local f8_local5 = nil
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() and CONDITIONS.IsWeaponLevelShown( self ) then
		f8_local5 = MenuBuilder.BuildRegisteredType( "WeaponButtonLevel", {
			controllerIndex = f8_local1
		} )
		f8_local5.id = "WeaponLevel"
		f8_local5:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -44, _1080p * -2, _1080p * 28, _1080p * 62 )
		self:addElement( f8_local5 )
		self.WeaponLevel = f8_local5
	end
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Base:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Base:SetScale( 0, 100 )
				end
			},
			{
				function ()
					return self.Base:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 335, 0, _1080p * 175, 100 )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			Base:AnimateSequence( "ButtonOver" )
		end
		
		Base:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Base:SetScale( -0.35, 100 )
				end
			},
			{
				function ()
					return self.Base:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -58.63, _1080p * 276.38, _1080p * -30.63, _1080p * 144.38, 100 )
				end
			}
		} )
		self._sequences.ButtonUp = function ()
			Base:AnimateSequence( "ButtonUp" )
		end
		
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
			f8_local4:RegisterAnimationSequence( "ShowQuality", {
				{
					function ()
						return self.QualityIcon:SetAlpha( 1, 0 )
					end
				}
			} )
		end
		self._sequences.ShowQuality = function ()
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
				f8_local4:AnimateSequence( "ShowQuality" )
			end
		end
		
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
			f8_local4:RegisterAnimationSequence( "HideQuality", {
				{
					function ()
						return self.QualityIcon:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		self._sequences.HideQuality = function ()
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
				f8_local4:AnimateSequence( "HideQuality" )
			end
		end
		
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() and CONDITIONS.IsWeaponLevelShown( self ) then
			f8_local5:RegisterAnimationSequence( "HideLevel", {
				{
					function ()
						return self.WeaponLevel:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		self._sequences.HideLevel = function ()
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() and CONDITIONS.IsWeaponLevelShown( self ) then
				f8_local5:AnimateSequence( "HideLevel" )
			end
		end
		
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() and CONDITIONS.IsWeaponLevelShown( self ) then
			f8_local5:RegisterAnimationSequence( "ShowLevel", {
				{
					function ()
						return self.WeaponLevel:SetAlpha( 1, 0 )
					end
				}
			} )
		end
		self._sequences.ShowLevel = function ()
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() and CONDITIONS.IsWeaponLevelShown( self ) then
				f8_local5:AnimateSequence( "ShowLevel" )
			end
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	self:SubscribeToModelThroughElement( self, "isDisabled", function ()
		local f32_local0 = self:GetDataSource()
		if f32_local0.isDisabled:GetValue( f8_local1 ) ~= nil then
			f32_local0 = self:GetDataSource()
			if f32_local0.isDisabled:GetValue( f8_local1 ) == true then
				ACTIONS.AnimateSequenceByElement( self, {
					elementName = "Base",
					sequenceName = "Disabled",
					elementPath = "Base"
				} )
			end
		end
		f32_local0 = self:GetDataSource()
		if f32_local0.isDisabled:GetValue( f8_local1 ) ~= nil then
			f32_local0 = self:GetDataSource()
			if f32_local0.isDisabled:GetValue( f8_local1 ) == false then
				ACTIONS.AnimateSequenceByElement( self, {
					elementName = "Base",
					sequenceName = "Enabled",
					elementPath = "Base"
				} )
			end
		end
	end )
	self:SubscribeToModelThroughElement( self, "equipped", function ()
		local f33_local0 = self:GetDataSource()
		if f33_local0.equipped:GetValue( f8_local1 ) ~= nil then
			f33_local0 = self:GetDataSource()
			if f33_local0.equipped:GetValue( f8_local1 ) == true then
				ACTIONS.AnimateSequenceByElement( self, {
					elementName = "Message",
					sequenceName = "Activate",
					elementPath = "Base.Message"
				} )
			end
		end
		f33_local0 = self:GetDataSource()
		if f33_local0.equipped:GetValue( f8_local1 ) ~= nil then
			f33_local0 = self:GetDataSource()
			if f33_local0.equipped:GetValue( f8_local1 ) == false then
				ACTIONS.AnimateSequenceByElement( self, {
					elementName = "Message",
					sequenceName = "Inactive",
					elementPath = "Base.Message"
				} )
			end
		end
	end )
	self.bindButton:addEventHandler( "button_secondary", function ( f34_arg0, f34_arg1 )
		local f34_local0 = f34_arg1.controller or f8_local1
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
	self:SubscribeToModelThroughElement( self, "isUnlocked", function ()
		local f35_local0 = self:GetDataSource()
		if f35_local0.isUnlocked:GetValue( f8_local1 ) ~= nil then
			f35_local0 = self:GetDataSource()
			if f35_local0.isUnlocked:GetValue( f8_local1 ) == true then
				ACTIONS.AnimateSequenceByElement( self, {
					elementName = "Base",
					sequenceName = "Unlocked",
					elementPath = "Base"
				} )
			end
		end
		f35_local0 = self:GetDataSource()
		if f35_local0.isUnlocked:GetValue( f8_local1 ) ~= nil then
			f35_local0 = self:GetDataSource()
			if f35_local0.isUnlocked:GetValue( f8_local1 ) == false then
				f35_local0 = self:GetDataSource()
				if f35_local0.isScanned:GetValue( f8_local1 ) ~= nil then
					f35_local0 = self:GetDataSource()
					if f35_local0.isScanned:GetValue( f8_local1 ) == false and CONDITIONS.IsSingleplayer( self ) then
						ACTIONS.AnimateSequenceByElement( self, {
							elementName = "Base",
							sequenceName = "Locked",
							elementPath = "Base"
						} )
					end
				end
			end
		end
		f35_local0 = self:GetDataSource()
		if f35_local0.isUnlocked:GetValue( f8_local1 ) ~= nil then
			f35_local0 = self:GetDataSource()
			if f35_local0.isUnlocked:GetValue( f8_local1 ) == false and not CONDITIONS.IsSingleplayer( self ) then
				ACTIONS.AnimateSequenceByElement( self, {
					elementName = "Base",
					sequenceName = "Locked",
					elementPath = "Base"
				} )
			end
		end
		f35_local0 = self:GetDataSource()
		if f35_local0.isUnlocked:GetValue( f8_local1 ) ~= nil then
			f35_local0 = self:GetDataSource()
			if f35_local0.isUnlocked:GetValue( f8_local1 ) == true then
				ACTIONS.AnimateSequence( self, "ShowLevel" )
			end
		end
		f35_local0 = self:GetDataSource()
		if f35_local0.isUnlocked:GetValue( f8_local1 ) ~= nil then
			f35_local0 = self:GetDataSource()
			if f35_local0.isUnlocked:GetValue( f8_local1 ) == false then
				ACTIONS.AnimateSequence( self, "HideLevel" )
			end
		end
	end )
	self:SubscribeToModelThroughElement( self, "isScanned", function ()
		if CONDITIONS.IsSingleplayer( self ) then
			local f36_local0 = self:GetDataSource()
			if f36_local0.isScanned:GetValue( f8_local1 ) ~= nil then
				f36_local0 = self:GetDataSource()
				if f36_local0.isScanned:GetValue( f8_local1 ) == true then
					ACTIONS.AnimateSequenceByElement( self, {
						elementName = "Base",
						sequenceName = "IsNew",
						elementPath = "Base"
					} )
					ACTIONS.AnimateSequenceByElement( self, {
						elementName = "Base",
						sequenceName = "Unlocked",
						elementPath = "Base"
					} )
				end
			end
		end
		if CONDITIONS.IsSingleplayer( self ) then
			local f36_local0 = self:GetDataSource()
			if f36_local0.isScanned:GetValue( f8_local1 ) ~= nil then
				f36_local0 = self:GetDataSource()
				if f36_local0.isScanned:GetValue( f8_local1 ) == false then
					ACTIONS.AnimateSequenceByElement( self, {
						elementName = "Base",
						sequenceName = "IsNotNew",
						elementPath = "Base"
					} )
				end
			end
		end
	end )
	PostLoadFunc( self, f8_local1, controller )
	return self
end

MenuBuilder.registerType( "BaseWeapon", BaseWeapon )
LockTable( _M )
