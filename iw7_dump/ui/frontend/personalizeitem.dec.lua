local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.QualityIcon )
	f1_arg0:addEventHandler( "button_action", function ( f2_arg0, f2_arg1 )
		local f2_local0 = f2_arg0:GetCurrentMenu()
		if f2_local0.camoActive then
			local f2_local1 = f1_arg0:GetDataSource()
			if f2_local1.isUnlocked:GetValue( f1_arg1 ) then
				ACTIONS.OnSelectCamo( f1_arg0, f1_arg1 )
				f2_local0.camoActive = false
			else
				return 
			end
		elseif f2_local0.reticleActive then
			local f2_local1 = f1_arg0:GetDataSource()
			if f2_local1.isUnlocked:GetValue( f1_arg1 ) then
				ACTIONS.OnSelectReticle( f1_arg0, f1_arg1 )
				f2_local0.reticleActive = false
			else
				return 
			end
		elseif f2_local0.cosmeticAttachmentActive then
			local f2_local1 = f1_arg0:GetDataSource()
			if f2_local1.isUnlocked:GetValue( f1_arg1 ) then
				ACTIONS.OnSelectCosmeticAttachment( f1_arg0, f1_arg1 )
				f2_local0.cosmeticAttachmentActive = false
			else
				return 
			end
		end
		if CONDITIONS.IsMultiplayer( f1_arg0 ) then
			f1_arg0:dispatchEventToCurrentMenu( {
				name = "close_item_selection",
				controllerIndex = f1_arg1
			} )
		end
	end )
	if Engine.IsAliensMode() then
		f1_arg0.LockImage:setImage( RegisterMaterial( "cp_wepbuild_lock" ), 0 )
	end
	f1_arg0:addEventHandler( "button_over", function ( f3_arg0, f3_arg1 )
		local f3_local0 = f3_arg0:GetCurrentMenu()
		if f3_local0 then
			local f3_local1 = f1_arg0:GetDataSource()
			if f3_local1.isUnlocked:GetValue( f1_arg1 ) then
				if f3_local0.camoActive then
					f3_local1 = Cac.UpdateFrontendWeaponModel
					local f3_local2 = f3_local0.weaponDataSource
					local f3_local3 = {}
					local f3_local4 = f1_arg0:GetDataSource()
					f3_local3.camo = f3_local4.ref:GetValue( f1_arg1 )
					f3_local1( f3_local2, f3_local3, f1_arg1 )
				elseif f3_local0.cosmeticAttachmentActive then
					f3_local1 = Cac.UpdateFrontendWeaponModel
					local f3_local2 = f3_local0.weaponDataSource
					local f3_local3 = {}
					local f3_local4 = f1_arg0:GetDataSource()
					f3_local3.cosmeticAttachment = f3_local4.ref:GetValue( f1_arg1 )
					f3_local1( f3_local2, f3_local3, f1_arg1 )
				end
			elseif f3_local0.camoActive or f3_local0.cosmeticAttachmentActive then
				Cac.UpdateFrontendWeaponModel( f3_local0.weaponDataSource, nil, f1_arg1 )
			end
			f3_arg0:dispatchEventToCurrentMenu( {
				name = "selection_changed",
				newSelection = f3_arg0
			} )
		end
	end )
	f1_arg0:SubscribeToModelThroughElement( f1_arg0, "quality", function ()
		local f4_local0 = f1_arg0:GetDataSource()
		if f4_local0 then
			local f4_local1 = Cac.LowestQuality
			if f4_local0.isUnlocked:GetValue( f1_arg1 ) then
				f4_local1 = f4_local0.quality:GetValue( f1_arg1 )
			end
			f1_arg0.QualityIcon:SetDisplayQuality( f4_local1 )
		end
	end )
end

function PersonalizeItem( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 149 * _1080p, 0, 149 * _1080p )
	self.id = "PersonalizeItem"
	self._animationSets = {}
	self._sequences = {}
	local f5_local1 = controller and controller.controllerIndex
	if not f5_local1 and not Engine.InFrontend() then
		f5_local1 = self:getRootController()
	end
	assert( f5_local1 )
	local f5_local2 = self
	self:setUseStencil( true )
	local GenericItemBackground = nil
	
	GenericItemBackground = MenuBuilder.BuildRegisteredType( "GenericItemBackground", {
		controllerIndex = f5_local1
	} )
	GenericItemBackground.id = "GenericItemBackground"
	GenericItemBackground:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 24, 0 )
	self:addElement( GenericItemBackground )
	self.GenericItemBackground = GenericItemBackground
	
	local lockedbg = nil
	
	lockedbg = LUI.UIImage.new()
	lockedbg.id = "lockedbg"
	lockedbg:SetAlpha( 0, 0 )
	lockedbg:setImage( RegisterMaterial( "widg_disabled" ), 0 )
	lockedbg:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 24, 0 )
	self:addElement( lockedbg )
	self.lockedbg = lockedbg
	
	local LockImage = nil
	
	LockImage = LUI.UIImage.new()
	LockImage.id = "LockImage"
	LockImage:SetRGBFromInt( 13421772, 0 )
	LockImage:SetAlpha( 0, 0 )
	LockImage:setImage( RegisterMaterial( "icon_slot_locked" ), 0 )
	LockImage:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 51.87, _1080p * 97.13, _1080p * 61.7, _1080p * 105.14 )
	self:addElement( LockImage )
	self.LockImage = LockImage
	
	local Camo = nil
	
	Camo = LUI.UIImage.new()
	Camo.id = "Camo"
	Camo:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 14, _1080p * -14, _1080p * 26, _1080p * -2 )
	Camo:SubscribeToModelThroughElement( self, "image", function ()
		local f6_local0 = self:GetDataSource()
		f6_local0 = f6_local0.image:GetValue( f5_local1 )
		if f6_local0 ~= nil then
			Camo:setImage( RegisterMaterial( f6_local0 ), 0 )
		end
	end )
	self:addElement( Camo )
	self.Camo = Camo
	
	local Base = nil
	Base = MenuBuilder.BuildRegisteredType( "CaCButtonBaseImage", {
		controllerIndex = f5_local1
	} )
	Base.id = "Base"
	Base.GenericItemBackground:SetAlpha( 0, 0 )
	Base.Image:SetLeft( _1080p * -64, 0 )
	Base.Image:SetRight( _1080p * 64, 0 )
	Base.Image:SetTop( _1080p * -134, 0 )
	Base.Image:SetBottom( _1080p * -6, 0 )
	Base.Image:SetAlpha( 0, 0 )
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		Base.LevelBacker:SetAlpha( 0, 0 )
	end
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		Base.LevelFrame:SetAlpha( 0, 0 )
	end
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		Base.Level:SetAlpha( 0, 0 )
	end
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		Base.Level:setText( "Level: 3", 0 )
	end
	Base.Name:SetAlignment( LUI.Alignment.Center )
	Base:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	Base:SubscribeToModelThroughElement( self, "name", function ()
		local f7_local0 = self:GetDataSource()
		f7_local0 = f7_local0.name:GetValue( f5_local1 )
		if f7_local0 ~= nil then
			Base.Name:setText( ToUpperCase( LocalizeString( f7_local0 ) ), 0 )
		end
	end )
	self:addElement( Base )
	self.Base = Base
	
	local Message = nil
	
	Message = MenuBuilder.BuildRegisteredType( "CaCSelectedMessage", {
		controllerIndex = f5_local1
	} )
	Message.id = "Message"
	Message:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 14, _1080p * -4, _1080p * 125, _1080p * 145 )
	self:addElement( Message )
	self.Message = Message
	
	local QualityIcon = nil
	
	QualityIcon = MenuBuilder.BuildRegisteredType( "QualityIcon", {
		controllerIndex = f5_local1
	} )
	QualityIcon.id = "QualityIcon"
	QualityIcon:SetAlpha( 0, 0 )
	QualityIcon:SetScale( -0.5, 0 )
	QualityIcon.IconShadow:SetAlpha( 0.2, 0 )
	QualityIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -2.13, _1080p * 61.87, _1080p * 93, _1080p * 157 )
	self:addElement( QualityIcon )
	self.QualityIcon = QualityIcon
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		lockedbg:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.lockedbg:SetAlpha( 0.3, 0 )
				end
			}
		} )
		LockImage:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.LockImage:SetAlpha( 1, 0 )
				end
			}
		} )
		Camo:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.Camo:SetAlpha( 0, 0 )
				end
			}
		} )
		Base:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.Base.Image:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Locked = function ()
			lockedbg:AnimateSequence( "Locked" )
			LockImage:AnimateSequence( "Locked" )
			Camo:AnimateSequence( "Locked" )
			Base:AnimateSequence( "Locked" )
		end
		
		lockedbg:RegisterAnimationSequence( "Unlocked", {
			{
				function ()
					return self.lockedbg:SetAlpha( 0, 0 )
				end
			}
		} )
		LockImage:RegisterAnimationSequence( "Unlocked", {
			{
				function ()
					return self.LockImage:SetAlpha( 0, 0 )
				end
			}
		} )
		Camo:RegisterAnimationSequence( "Unlocked", {
			{
				function ()
					return self.Camo:SetAlpha( 1, 0 )
				end
			}
		} )
		Base:RegisterAnimationSequence( "Unlocked", {
			{
				function ()
					return self.Base:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Base.Image:SetAlpha( 0, 0 )
				end
			}
		} )
		Message:RegisterAnimationSequence( "Unlocked", {
			{
				function ()
					return self.Message:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.Unlocked = function ()
			lockedbg:AnimateSequence( "Unlocked" )
			LockImage:AnimateSequence( "Unlocked" )
			Camo:AnimateSequence( "Unlocked" )
			Base:AnimateSequence( "Unlocked" )
			Message:AnimateSequence( "Unlocked" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModelThroughElement( self, "isSelected", function ()
		local f22_local0 = self:GetDataSource()
		if f22_local0.isSelected:GetValue( f5_local1 ) ~= nil then
			f22_local0 = self:GetDataSource()
			if f22_local0.isSelected:GetValue( f5_local1 ) == true then
				ACTIONS.AnimateSequenceByElement( self, {
					elementName = "Message",
					sequenceName = "Activate",
					elementPath = "Message"
				} )
			end
		end
		f22_local0 = self:GetDataSource()
		if f22_local0.isSelected:GetValue( f5_local1 ) ~= nil then
			f22_local0 = self:GetDataSource()
			if f22_local0.isSelected:GetValue( f5_local1 ) == false then
				ACTIONS.AnimateSequenceByElement( self, {
					elementName = "Message",
					sequenceName = "Inactive",
					elementPath = "Message"
				} )
			end
		end
	end )
	self:SubscribeToModelThroughElement( self, "isUnlocked", function ()
		local f23_local0 = self:GetDataSource()
		if f23_local0.isUnlocked:GetValue( f5_local1 ) ~= nil then
			f23_local0 = self:GetDataSource()
			if f23_local0.isUnlocked:GetValue( f5_local1 ) == true then
				ACTIONS.AnimateSequence( self, "Unlocked" )
			end
		end
		f23_local0 = self:GetDataSource()
		if f23_local0.isUnlocked:GetValue( f5_local1 ) ~= nil then
			f23_local0 = self:GetDataSource()
			if f23_local0.isUnlocked:GetValue( f5_local1 ) == false then
				ACTIONS.AnimateSequence( self, "Locked" )
			end
		end
	end )
	PostLoadFunc( self, f5_local1, controller )
	return self
end

MenuBuilder.registerType( "PersonalizeItem", PersonalizeItem )
LockTable( _M )
