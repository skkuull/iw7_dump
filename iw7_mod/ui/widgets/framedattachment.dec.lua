local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = {
	on = "on",
	off = "off"
}
function CanPersonalizeReticle( f1_arg0 )
	local f1_local0 = Engine.InFrontend()
	if f1_local0 then
		if not f1_arg0.loadoutRemovalPopup then
			f1_local0 = f1_arg0.hasReticleData
		else
			f1_local0 = false
		end
	end
	return f1_local0
end

function CheckReticleData( f2_arg0, f2_arg1 )
	local f2_local0 = f2_arg0.weaponButton and f2_arg0.weaponButton:GetDataSource() or nil
	local f2_local1 = f2_arg0:GetDataSource()
	if f2_local0 and f2_local0.ref and f2_local1 and f2_local1.ref then
		f2_arg0.hasReticleData = Cac.HasReticleData( f2_local1.ref:GetValue( f2_arg1 ), f2_local0.ref:GetValue( f2_arg1 ), f2_local0.variantID:GetValue( f2_arg1 ) )
	else
		f2_arg0.hasReticleData = false
	end
end

function AnimateFramedAttachment( f3_arg0, f3_arg1, f3_arg2 )
	local f3_local0 = f3_arg0:GetDataSource()
	if not f3_local0 then
		return 
	end
	local f3_local1 = f3_local0.used:GetValue( f3_arg2 )
	local f3_local2 = false
	if Engine.IsSingleplayer() or Engine.InFrontend() then
		f3_local2 = CONDITIONS.UseLoadoutRestrictions() and f3_local0.esportsLocked or f3_local0.disabled:GetValue( f3_arg2 )
	end
	local f3_local3, f3_local4 = nil
	if f3_arg1 then
		if f3_local2 then
			f3_local3 = "ButtonOverDisabled"
		elseif f3_local1 then
			f3_local3 = "ButtonOverInUse"
		else
			f3_local3 = "ButtonOverNotInUse"
		end
		if CanPersonalizeReticle( f3_arg0 ) then
			f3_local4 = f0_local0.on
		else
			f3_local4 = f0_local0.off
		end
	else
		if f3_local2 then
			f3_local3 = "Disabled"
		elseif f3_local1 then
			f3_local3 = "ButtonUpInUse"
		else
			f3_local3 = "ButtonUpNotInUse"
		end
		f3_local4 = f0_local0.off
	end
	if f3_local3 and f3_arg0._currentSequence ~= f3_local3 then
		f3_arg0._currentSequence = f3_local3
		ACTIONS.AnimateSequence( f3_arg0, f3_local3 )
		if f3_local3 == "ButtonOverInUse" or f3_local3 == "ButtonUpInUse" then
			f3_arg0.OpticsIcon.RunAnimation( "IconOff" )
		elseif f3_local3 == "ButtonOverNotInUse" then
			f3_arg0.OpticsIcon.RunAnimation( "IconOn" )
		elseif f3_local3 == "ButtonUpNotInUse" or f3_local3 == "Disabled" or f3_local3 == "ButtonOverDisabled" then
			f3_arg0.OpticsIcon.RunAnimation( "IconSemiTransparent" )
		end
	end
	if f3_arg0._currentPersonalizeAlphaState ~= f3_local4 then
		f3_arg0._currentPersonalizeAlphaState = f3_local4
		if f3_local4 == f0_local0.on then
			f3_arg0.PersonalizeIcon:SetAlpha( 1, 100 )
			if CONDITIONS.IsPC( f3_arg0 ) and Engine.IsGamepadEnabled() ~= 1 then
				f3_arg0.PersonalizeIconBacking:SetAlpha( 0.65, 100 )
			end
		else
			f3_arg0.PersonalizeIcon:SetAlpha( 0, 200 )
			if CONDITIONS.IsPC( f3_arg0 ) then
				f3_arg0.PersonalizeIconBacking:SetAlpha( 0, 200 )
			end
		end
	end
end

function UpdateWeaponButtonRef( f4_arg0, f4_arg1, f4_arg2 )
	if Engine.InFrontend() then
		f4_arg0.weaponButton = f4_arg2
		f4_arg0:SubscribeToModelThroughElement( f4_arg0.weaponButton, "ref", function ()
			CheckReticleData( f4_arg0, f4_arg1 )
		end )
	end
end

function ClearSlot( f6_arg0, f6_arg1 )
	local f6_local0 = f6_arg0:GetDataSource()
	f6_local0 = f6_local0.used:GetValue( f6_arg1 )
	if f6_arg0.loadoutRemovalPopup then
		local f6_local1 = f6_arg0:GetCurrentMenu()
		if LUI.FlowManager.IsInStack( "AttachmentSelect" ) then
			local f6_local2 = LUI.FlowManager.GetScopedData( "AttachmentSelect" )
			if f6_local0 then
				local f6_local3 = f6_arg0:GetDataSource()
				if f6_local3.weaponIndex == f6_local1.weaponSlot then
					f6_local2.updateOnRemoval = true
				end
			end
		end
	end
	ACTIONS.OnClearAttachment( f6_arg0, f6_arg1 )
	ACTIONS.PlaySoundSetSound( f6_arg0, "selectAlt", false )
end

function PersonalizeSlot( f7_arg0, f7_arg1 )
	if CanPersonalizeReticle( f7_arg0 ) then
		ACTIONS.OpenReticlePersonalizeMenu( f7_arg0, f7_arg1, f7_arg0.weaponButton:GetDataSource() )
	end
end

function PostLoadFunc( f8_arg0, f8_arg1, f8_arg2 )
	f8_arg0.ShouldShowPersonalizePrompt = CanPersonalizeReticle
	f8_arg0:addEventHandler( "refresh_widget", function ( f9_arg0, f9_arg1 )
		ACTIONS.AnimateSequence( f9_arg0, "RefreshWidget" )
	end )
	if CONDITIONS.InGameSPOrFrontendMP() then
		f8_arg0:registerEventHandler( "button_over", function ( element, event )
			AnimateFramedAttachment( element, true, f8_arg1 )
			if not Engine.IsMultiplayer() then
				Engine.NotifyServer( "none", 0 )
				Engine.SetDvarString( "loadout_weapon_string", "none" )
			end
		end )
		f8_arg0:registerEventHandler( "button_over_disable", function ( element, event )
			AnimateFramedAttachment( element, true, f8_arg1 )
		end )
		f8_arg0:registerEventHandler( "button_up", function ( element, event )
			AnimateFramedAttachment( element, false, f8_arg1 )
		end )
		f8_arg0:registerEventHandler( "button_disable", function ( element, event )
			AnimateFramedAttachment( element, false, f8_arg1 )
		end )
		f8_arg0:SubscribeToModelThroughElement( f8_arg0, "used", function ()
			AnimateFramedAttachment( f8_arg0, f8_arg0:isInFocus(), f8_arg1 )
		end )
		f8_arg0:SubscribeToModelThroughElement( f8_arg0, "disabled", function ()
			local f15_local0 = f8_arg0:GetDataSource()
			f15_local0 = f15_local0.disabled:GetValue( f8_arg1 )
			local f15_local1 = CONDITIONS.UseLoadoutRestrictions()
			if f15_local1 then
				f15_local1 = f8_arg0:GetDataSource()
				f15_local1 = f15_local1.esportsLocked
			end
			f8_arg0:SetButtonDisabled( f15_local0 or f15_local1 )
			if f15_local0 and CONDITIONS.InFrontend( f8_arg0 ) and f8_arg0._currentSequence ~= "Disabled" then
				ACTIONS.AnimateSequence( f8_arg0, "Disabled" )
			end
		end )
	end
	local f8_local0 = LUI.FlowManager.GetScopedData( f8_arg0 )
	if CONDITIONS.UseCACBreadCrumbs() and not f8_local0.hideWeaponBreadcrumbs then
		assert( f8_arg0.NewItemNotification )
		local f8_local1 = function ()
			local f16_local0 = f8_arg0:GetDataSource()
			if not f16_local0.disabled:GetValue( f8_arg1 ) then
				local f16_local1 = f8_arg0:GetCurrentMenu()
				local f16_local2 = f16_local1.CACLoadoutWrapper:GetDataSource()
				local f16_local3 = f16_local0.weaponIndex and f16_local2.weaponSlotOne or f16_local2.weaponSlotTwo
				local f16_local4 = f16_local0.slot and f16_local3.newOpticsAttachment or f16_local3.newAlternateAttachment
				if f16_local4:GetValue( f8_arg1 ) then
					f8_arg0.NewItemNotification:SetAlpha( 1, 0 )
				else
					f8_arg0.NewItemNotification:SetAlpha( 0, 0 )
				end
			else
				f8_arg0.NewItemNotification:SetAlpha( 0, 0 )
			end
		end
		
		f8_arg0:SubscribeToModelThroughElement( f8_arg0, "disabled", f8_local1 )
		local f8_local2 = f8_arg0:SubscribeToDataSourceThroughElement( f8_arg0, nil, function ()
			local f17_local0 = f8_arg0:GetCurrentMenu()
			assert( f17_local0 )
			assert( f17_local0.CACLoadoutWrapper )
			local f17_local1 = f8_arg0:GetDataSource()
			local f17_local2 = f17_local1.weaponIndex and "weaponSlotOne" or "weaponSlotTwo"
			f8_arg0:SubscribeToModelThroughElement( f17_local0.CACLoadoutWrapper, f17_local2 .. ".newOpticsAttachment", f8_local1 )
			f8_arg0:SubscribeToModelThroughElement( f17_local0.CACLoadoutWrapper, f17_local2 .. ".newAlternateAttachment", f8_local1 )
		end )
		f8_local2.unlinkOnCallback = true
	end
	if Engine.InFrontend() then
		f8_arg0:SubscribeToModelThroughElement( f8_arg0, "ref", function ()
			CheckReticleData( f8_arg0, f8_arg1 )
		end )
	end
	assert( f8_arg0.bindButton )
	f8_arg0.bindButton:addEventHandler( "button_alt1", function ( f19_arg0, f19_arg1 )
		local f19_local0 = f19_arg0:getParent()
		if #f19_local0:getAllFocusedChildren() <= 0 then
			f19_local0 = f19_arg0:getParent()
			if f19_local0:isInFocus() then
			
			else
				return false
			end
		end
		ClearSlot( f8_arg0, f8_arg1 )
		return true
	end )
	f8_arg0.UpdateWeaponButtonRef = UpdateWeaponButtonRef
	if Engine.IsSingleplayer() and not ShipCribUtils.IsSelectedMissionJackal() then
		f8_arg0.bindButton:addEventHandler( "button_alt2", function ( f20_arg0, f20_arg1 )
			local f20_local0 = f20_arg0:getParent()
			if #f20_local0:getAllFocusedChildren() <= 0 then
				f20_local0 = f20_arg0:getParent()
				if f20_local0:isInFocus() then
				
				else
					
				end
			end
			f20_local0 = f8_arg0:GetCurrentMenu()
			local f20_local1 = f20_local0.SPLoadout:GetDataSource()
			local f20_local2 = f20_local1.slot:GetValue( f8_arg1 )
			local f20_local3 = f8_arg0:GetDataSource()
			VRManager.RunVRRoom( f20_local1, f20_local3.ref:GetValue( f8_arg1 ), VRManager.ItemType.ATTACHMENT, f8_arg1 )
			return true
		end )
	elseif Engine.InFrontend() then
		f8_arg0.bindButton:addEventHandler( "button_alt2", function ( f21_arg0, f21_arg1 )
			local f21_local0 = f21_arg0:getParent()
			if #f21_local0:getAllFocusedChildren() <= 0 then
				f21_local0 = f21_arg0:getParent()
				if f21_local0:isInFocus() then
				
				else
					
				end
			end
			PersonalizeSlot( f8_arg0, f8_arg1 )
		end )
	end
	if CONDITIONS.IsCoreMultiplayer() and CONDITIONS.InGame() then
		ACTIONS.AnimateSequence( f8_arg0, "Disabled" )
		f8_arg0._currentSequence = "Disabled"
		f8_arg0.AttachmentImage:SetAlpha( 0, 0 )
		f8_arg0:SetButtonDisabled( true )
		f8_arg0.OpticsIcon:SetAlpha( 0, 0 )
	end
	f8_arg0.AttachmentImage:SubscribeToModelThroughElement( f8_arg0, "icon", function ()
		local f22_local0 = f8_arg0:GetDataSource()
		f22_local0 = f22_local0.icon:GetValue( f8_arg1 )
		local f22_local1 = f8_arg0:GetDataSource()
		f22_local1 = f22_local1.used:GetValue( f8_arg1 )
		if f22_local0 ~= nil then
			f8_arg0.AttachmentImage:SetAlpha( 1, 0 )
			f8_arg0.AttachmentImage:setImage( RegisterMaterial( f22_local0 ), 0 )
		end
		local f22_local2 = nil
		if Engine.IsSingleplayer() then
			f22_local2 = f22_local1 ~= true
		else
			local f22_local3 = f8_arg0:GetDataSource()
			if f22_local1 == true and f22_local3.attachmentUniqueDataSource:GetValue( f8_arg1 ) ~= "none" then
				f22_local2 = false
			else
				f22_local2 = true
			end
		end
		if f22_local2 then
			f8_arg0.AttachmentImage:SetAlpha( 0, 0 )
		end
	end )
	if CONDITIONS.IsCoreFrontendPC() then
		local f8_local2 = f8_arg0:SubscribeToDataSourceThroughElement( f8_arg0, nil, function ()
			f8_arg0.ClearButton:addEventHandler( "button_action", function ( f24_arg0, f24_arg1 )
				ClearSlot( f8_arg0, f8_arg1 )
			end )
			local f23_local0 = f8_arg0:GetDataSource()
			local WeaponPersonalizeButton = f8_arg0:GetDataSource()
			if WeaponPersonalizeButton.slot == 0 then
				f8_arg0.PersonalizeIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 20, _1080p * 104, _1080p * 34, _1080p * 48 )
				f8_arg0:registerEventHandler( "refresh_button_helper", function ( element, event )
					element.PersonalizeIcon:setText( Engine.Localize( "LUA_MENU_PAD_ALT2_BUTTON" ), 0 )
				end )
				WeaponPersonalizeButton = nil
				
				WeaponPersonalizeButton = MenuBuilder.BuildRegisteredType( "WeaponPersonalizeButton", {
					controllerIndex = f8_arg1
				} )
				WeaponPersonalizeButton.id = "WeaponPersonalizeButton"
				WeaponPersonalizeButton:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 13, _1080p * 41, _1080p * 4, _1080p * 32 )
				WeaponPersonalizeButton:SetDataSourceThroughElement( f8_arg0, nil )
				f8_arg0:addElement( WeaponPersonalizeButton )
				f8_arg0.WeaponPersonalizeButton = WeaponPersonalizeButton
				
				ACTIONS.AnimateSequence( f8_arg0.WeaponPersonalizeButton, "SetReticleIcon" )
				f8_arg0.WeaponPersonalizeButton:addEventHandler( "button_action", function ( f26_arg0, f26_arg1 )
					PersonalizeSlot( f8_arg0, f8_arg1 )
				end )
				f8_arg0:addEventHandler( "button_over", function ( f27_arg0, f27_arg1 )
					local f27_local0 = f27_arg0:GetDataSource()
					if not f27_local0.used:GetValue( f8_arg1 ) and CanPersonalizeReticle( f27_arg0 ) then
						f27_arg0.WeaponPersonalizeButton:turnOnFunction()
					end
				end )
			end
		end )
		f8_local2.unlinkOnCallback = true
	end
end

function FramedAttachment( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 95 * _1080p, 0, 90 * _1080p )
	self.id = "FramedAttachment"
	self._animationSets = {}
	self._sequences = {}
	local f28_local1 = controller and controller.controllerIndex
	if not f28_local1 and not Engine.InFrontend() then
		f28_local1 = self:getRootController()
	end
	assert( f28_local1 )
	local f28_local2 = self
	self:setUseStencil( true )
	local f28_local3 = nil
	if CONDITIONS.InGameSPOrFrontendMP( self ) then
		f28_local3 = MenuBuilder.BuildRegisteredType( "GenericItemBackground", {
			controllerIndex = f28_local1
		} )
		f28_local3.id = "GenericItemBackground"
		f28_local3:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
		self:addElement( f28_local3 )
		self.GenericItemBackground = f28_local3
	end
	local AttachmentImage = nil
	
	AttachmentImage = LUI.UIImage.new()
	AttachmentImage.id = "AttachmentImage"
	AttachmentImage:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -30, _1080p * 30, _1080p * -30, _1080p * 30 )
	self:addElement( AttachmentImage )
	self.AttachmentImage = AttachmentImage
	
	local f28_local5 = nil
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() and Engine.InFrontend() then
		f28_local5 = MenuBuilder.BuildRegisteredType( "PointCosts", {
			controllerIndex = f28_local1
		} )
		f28_local5.id = "PointCosts"
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() and Engine.InFrontend() then
			f28_local5:SetDataSourceThroughElement( self, "pointCost" )
		end
		f28_local5:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -103, _1080p * -8, _1080p * -12, _1080p * -8 )
		self:addElement( f28_local5 )
		self.PointCosts = f28_local5
	end
	local PulseCover = nil
	
	PulseCover = LUI.UIImage.new()
	PulseCover.id = "PulseCover"
	PulseCover:SetRGBFromTable( SWATCHES.CAC.greenLight, 0 )
	PulseCover:SetAlpha( 0, 0 )
	PulseCover:setImage( RegisterMaterial( "widg_gradient_right_to_left" ), 0 )
	PulseCover:SetBlendMode( BLEND_MODE.addWithAlpha )
	PulseCover:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -170, 0, 0, 0 )
	self:addElement( PulseCover )
	self.PulseCover = PulseCover
	
	local OpticsIcon = nil
	
	OpticsIcon = MenuBuilder.BuildRegisteredType( "OpticsIcon", {
		controllerIndex = f28_local1
	} )
	OpticsIcon.id = "OpticsIcon"
	OpticsIcon:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -34, _1080p * 34, _1080p * -18.5, _1080p * 15.5 )
	self:addElement( OpticsIcon )
	self.OpticsIcon = OpticsIcon
	
	local Padlock = nil
	
	Padlock = LUI.UIImage.new()
	Padlock.id = "Padlock"
	Padlock:SetAlpha( 0, 0 )
	Padlock:setImage( RegisterMaterial( "icon_slot_locked" ), 0 )
	Padlock:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -18, _1080p * 18, _1080p * -18, _1080p * 18 )
	self:addElement( Padlock )
	self.Padlock = Padlock
	
	local f28_local9 = nil
	if CONDITIONS.InGameSPOrFrontendMP( self ) then
		f28_local9 = MenuBuilder.BuildRegisteredType( "GenericButtonSelection", {
			controllerIndex = f28_local1
		} )
		f28_local9.id = "GenericButtonSelection"
		f28_local9:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
		self:addElement( f28_local9 )
		self.GenericButtonSelection = f28_local9
	end
	local f28_local10 = nil
	if CONDITIONS.IsPC( self ) then
		f28_local10 = LUI.UIImage.new()
		f28_local10.id = "PersonalizeIconBacking"
		f28_local10:SetRGBFromInt( 0, 0 )
		f28_local10:SetAlpha( 0, 0 )
		f28_local10:setImage( RegisterMaterial( "widg_gradient_left_to_right" ), 0 )
		f28_local10:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 14, _1080p * -17, _1080p * 34, _1080p * 49 )
		self:addElement( f28_local10 )
		self.PersonalizeIconBacking = f28_local10
	end
	local PersonalizeIcon = nil
	
	PersonalizeIcon = LUI.UIText.new()
	PersonalizeIcon.id = "PersonalizeIcon"
	PersonalizeIcon:SetAlpha( 0, 0 )
	PersonalizeIcon:setText( Engine.Localize( "LUA_MENU_PAD_ALT2_BUTTON" ), 0 )
	PersonalizeIcon:SetFontSize( 24 * _1080p )
	PersonalizeIcon:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	PersonalizeIcon:SetAlignment( LUI.Alignment.Left )
	PersonalizeIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 73.56, _1080p * 158.56, _1080p * 13.06, _1080p * 26.5 )
	self:addElement( PersonalizeIcon )
	self.PersonalizeIcon = PersonalizeIcon
	
	local f28_local12 = nil
	if CONDITIONS.UseCACBreadCrumbs( self ) then
		f28_local12 = MenuBuilder.BuildRegisteredType( "NewItemNotification", {
			controllerIndex = f28_local1
		} )
		f28_local12.id = "NewItemNotification"
		f28_local12:SetAlpha( 0, 0 )
		f28_local12:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * 32, _1080p * -33.5, _1080p * 30.5 )
		self:addElement( f28_local12 )
		self.NewItemNotification = f28_local12
	end
	local f28_local13 = nil
	if CONDITIONS.IsCoreFrontendPC( self ) then
		f28_local13 = MenuBuilder.BuildRegisteredType( "ClearButton", {
			controllerIndex = f28_local1
		} )
		f28_local13.id = "ClearButton"
		if CONDITIONS.IsCoreFrontendPC( self ) then
			f28_local13:SetDataSourceThroughElement( self, nil )
		end
		f28_local13:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -32, _1080p * -4, _1080p * 4, _1080p * 32 )
		self:addElement( f28_local13 )
		self.ClearButton = f28_local13
	end
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		AttachmentImage:RegisterAnimationSequence( "ButtonOverInUse", {
			{
				function ()
					return self.AttachmentImage:SetAlpha( 1, 100 )
				end
			},
			{
				function ()
					return self.AttachmentImage:SetScale( 0.05, 100 )
				end
			}
		} )
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() and Engine.InFrontend() then
			f28_local5:RegisterAnimationSequence( "ButtonOverInUse", {
				{
					function ()
						return self.PointCosts:SetAlpha( 1, 100 )
					end
				}
			} )
		end
		PulseCover:RegisterAnimationSequence( "ButtonOverInUse", {
			{
				function ()
					return self.PulseCover:SetRGBFromTable( SWATCHES.CAC.yellowHighlight, 0 )
				end
			}
		} )
		self._sequences.ButtonOverInUse = function ()
			AttachmentImage:AnimateSequence( "ButtonOverInUse" )
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() and Engine.InFrontend() then
				f28_local5:AnimateSequence( "ButtonOverInUse" )
			end
			PulseCover:AnimateSequence( "ButtonOverInUse" )
		end
		
		AttachmentImage:RegisterAnimationSequence( "ButtonOverNotInUse", {
			{
				function ()
					return self.AttachmentImage:SetAlpha( 0, 100 )
				end
			},
			{
				function ()
					return self.AttachmentImage:SetScale( 0.05, 100 )
				end
			}
		} )
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() and Engine.InFrontend() then
			f28_local5:RegisterAnimationSequence( "ButtonOverNotInUse", {
				{
					function ()
						return self.PointCosts:SetAlpha( 1, 100 )
					end
				}
			} )
		end
		PulseCover:RegisterAnimationSequence( "ButtonOverNotInUse", {
			{
				function ()
					return self.PulseCover:SetRGBFromTable( SWATCHES.CAC.yellowHighlight, 0 )
				end
			}
		} )
		self._sequences.ButtonOverNotInUse = function ()
			AttachmentImage:AnimateSequence( "ButtonOverNotInUse" )
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() and Engine.InFrontend() then
				f28_local5:AnimateSequence( "ButtonOverNotInUse" )
			end
			PulseCover:AnimateSequence( "ButtonOverNotInUse" )
		end
		
		AttachmentImage:RegisterAnimationSequence( "ButtonUpInUse", {
			{
				function ()
					return self.AttachmentImage:SetAlpha( 1, 200 )
				end
			},
			{
				function ()
					return self.AttachmentImage:SetScale( 0, 200 )
				end
			}
		} )
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() and Engine.InFrontend() then
			f28_local5:RegisterAnimationSequence( "ButtonUpInUse", {
				{
					function ()
						return self.PointCosts:SetAlpha( 1, 200 )
					end
				}
			} )
		end
		PulseCover:RegisterAnimationSequence( "ButtonUpInUse", {
			{
				function ()
					return self.PulseCover:SetRGBFromTable( SWATCHES.CAC.greenLight, 0 )
				end
			}
		} )
		self._sequences.ButtonUpInUse = function ()
			AttachmentImage:AnimateSequence( "ButtonUpInUse" )
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() and Engine.InFrontend() then
				f28_local5:AnimateSequence( "ButtonUpInUse" )
			end
			PulseCover:AnimateSequence( "ButtonUpInUse" )
		end
		
		AttachmentImage:RegisterAnimationSequence( "ButtonUpNotInUse", {
			{
				function ()
					return self.AttachmentImage:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.AttachmentImage:SetScale( 0, 200 )
				end
			}
		} )
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() and Engine.InFrontend() then
			f28_local5:RegisterAnimationSequence( "ButtonUpNotInUse", {
				{
					function ()
						return self.PointCosts:SetAlpha( 1, 200 )
					end
				}
			} )
		end
		PulseCover:RegisterAnimationSequence( "ButtonUpNotInUse", {
			{
				function ()
					return self.PulseCover:SetRGBFromTable( SWATCHES.CAC.greenLight, 0 )
				end
			}
		} )
		self._sequences.ButtonUpNotInUse = function ()
			AttachmentImage:AnimateSequence( "ButtonUpNotInUse" )
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() and Engine.InFrontend() then
				f28_local5:AnimateSequence( "ButtonUpNotInUse" )
			end
			PulseCover:AnimateSequence( "ButtonUpNotInUse" )
		end
		
		AttachmentImage:RegisterAnimationSequence( "Disabled", {
			{
				function ()
					return self.AttachmentImage:SetAlpha( 0, 200 )
				end
			}
		} )
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() and Engine.InFrontend() then
			f28_local5:RegisterAnimationSequence( "Disabled", {
				{
					function ()
						return self.PointCosts:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		self._sequences.Disabled = function ()
			AttachmentImage:AnimateSequence( "Disabled" )
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() and Engine.InFrontend() then
				f28_local5:AnimateSequence( "Disabled" )
			end
		end
		
		AttachmentImage:RegisterAnimationSequence( "ButtonOverDisabled", {
			{
				function ()
					return self.AttachmentImage:SetAlpha( 0, 100 )
				end
			}
		} )
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() and Engine.InFrontend() then
			f28_local5:RegisterAnimationSequence( "ButtonOverDisabled", {
				{
					function ()
						return self.PointCosts:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		self._sequences.ButtonOverDisabled = function ()
			AttachmentImage:AnimateSequence( "ButtonOverDisabled" )
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() and Engine.InFrontend() then
				f28_local5:AnimateSequence( "ButtonOverDisabled" )
			end
		end
		
		PulseCover:RegisterAnimationSequence( "RefreshWidget", {
			{
				function ()
					return self.PulseCover:SetAlpha( 0, 30 )
				end,
				function ()
					return self.PulseCover:SetAlpha( 0.3, 30 )
				end,
				function ()
					return self.PulseCover:SetAlpha( 0, 30 )
				end,
				function ()
					return self.PulseCover:SetAlpha( 0, 30 )
				end,
				function ()
					return self.PulseCover:SetAlpha( 0, 30 )
				end,
				function ()
					return self.PulseCover:SetAlpha( 0.3, 30 )
				end,
				function ()
					return self.PulseCover:SetAlpha( 0.5, 420 )
				end,
				function ()
					return self.PulseCover:SetAlpha( 0, 10 )
				end
			},
			{
				function ()
					return self.PulseCover:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -170, 0, 0, 0, 180 )
				end,
				function ()
					return self.PulseCover:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 95, 0, 0, 0, 420 )
				end
			}
		} )
		self._sequences.RefreshWidget = function ()
			PulseCover:AnimateSequence( "RefreshWidget" )
		end
		
		Padlock:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.Padlock:SetAlpha( 0.2, 0 )
				end
			},
			{
				function ()
					return self.Padlock:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		self._sequences.Locked = function ()
			Padlock:AnimateSequence( "Locked" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() and Engine.InFrontend() then
		f28_local5:SetDataSourceThroughElement( self, "pointCost" )
	end
	if CONDITIONS.IsCoreFrontendPC( self ) then
		f28_local13:SetDataSourceThroughElement( self, nil )
	end
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	PostLoadFunc( self, f28_local1, controller )
	return self
end

MenuBuilder.registerType( "FramedAttachment", FramedAttachment )
LockTable( _M )
