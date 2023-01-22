local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function AnimateWeaponButton( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = f1_arg0:GetDataSource()
	f1_local0 = f1_local0.used:GetValue( f1_arg2 )
	local f1_local1 = nil
	if f1_arg1 then
		if f1_local0 then
			f1_local1 = "ButtonOverInUse"
			if not f1_arg0.loadoutRemovalPopup and not Engine.IsSingleplayer() then
				ACTIONS.AnimateSequence( f1_arg0, "PersonalizeOver" )
			end
		else
			f1_local1 = "ButtonOverNotInUse"
			if not f1_arg0.loadoutRemovalPopup then
				ACTIONS.AnimateSequence( f1_arg0, "PersonalizeUp" )
			end
		end
	elseif f1_local0 then
		f1_local1 = "ButtonUpInUse"
		if not f1_arg0.loadoutRemovalPopup then
			ACTIONS.AnimateSequence( f1_arg0, "PersonalizeUp" )
		end
	else
		f1_local1 = "ButtonUpNotInUse"
		if not f1_arg0.loadoutRemovalPopup then
			ACTIONS.AnimateSequence( f1_arg0, "PersonalizeUp" )
		end
	end
	if f1_local1 and f1_arg0._currentSequence ~= f1_local1 then
		ACTIONS.AnimateSequence( f1_arg0, f1_local1 )
		f1_arg0._currentSequence = f1_local1
	end
end

f0_local0 = function ( f2_arg0, f2_arg1 )
	local f2_local0 = f2_arg0:GetCurrentMenu()
	local f2_local1 = f2_local0.LoadoutList.Loadouts:GetDataSource()
	local f2_local2
	if f2_local1.overkill.used:GetValue( f2_arg1 ) then
		f2_local2 = Cac.PrimaryWeaponSlot
		if not f2_local2 then
		
		else
			if f2_local0.areWeaponsNew[f2_local2] then
				f2_arg0.NewItemNotification:SetAlpha( 1, 0 )
			else
				f2_arg0.NewItemNotification:SetAlpha( 0, 0 )
			end
		end
	end
	f2_local2 = f2_arg0:GetDataSource()
	f2_local2 = f2_local2.slot:GetValue( f2_arg1 )
end

function ClearSlot( f3_arg0, f3_arg1 )
	if not CONDITIONS.IsDisabled( f3_arg0 ) then
		ACTIONS.OnClearWeapon( f3_arg0, f3_arg1 )
		ACTIONS.PlaySoundSetSound( f3_arg0, "selectAlt", false )
		if not f3_arg0.loadoutRemovalPopup then
			if not Engine.IsMultiplayer() then
				local f3_local0 = f3_arg0:GetDataSource()
				f3_local0 = f3_local0.weapon:GetValue( f3_arg1 )
				Engine.NotifyServer( f3_local0, 1 )
				Engine.SetDvarString( "loadout_weapon_string", f3_local0 )
			else
				local f3_local0 = f3_arg0:GetCurrentMenu()
				f3_local0:processEvent( {
					name = "weapon_cleared"
				} )
			end
		end
	end
end

function PersonalizeSlot( f4_arg0, f4_arg1 )
	if not f4_arg0.loadoutRemovalPopup then
		local f4_local0 = f4_arg0:GetDataSource()
		if f4_local0.used:GetValue( f4_arg1 ) ~= nil then
			f4_local0 = f4_arg0:GetDataSource()
			if f4_local0.used:GetValue( f4_arg1 ) == true then
				ACTIONS.OpenWeaponPersonalizeMenu( f4_arg0, f4_arg1 )
			end
		end
	end
end

function PostLoadFunc( f5_arg0, f5_arg1 )
	if not f5_arg0.bindButton then
		local self = LUI.UIBindButton.new()
		self.id = "selfBindButton"
		f5_arg0:addElement( self )
		f5_arg0.bindButton = self
	end
	local self = LUI.FlowManager.GetScopedData( f5_arg0 )
	if CONDITIONS.UseCACBreadCrumbs() and not self.hideWeaponBreadcrumbs then
		assert( f5_arg0.NewItemNotification )
		f5_arg0:SubscribeToDataSourceThroughElement( f5_arg0, nil, function ()
			f0_local0( f5_arg0, f5_arg1 )
		end )
		f5_arg0:addEventHandler( "update_new_item", function ( f7_arg0, f7_arg1 )
			f0_local0( f5_arg0, f5_arg1 )
		end )
	end
	assert( f5_arg0.bindButton )
	f5_arg0.bindButton:addEventHandler( "button_alt1", function ( f8_arg0, f8_arg1 )
		local f8_local0 = f8_arg0:getParent()
		if #f8_local0:getAllFocusedChildren() <= 0 then
			f8_local0 = f8_arg0:getParent()
			if f8_local0:isInFocus() then
			
			else
				return false
			end
		end
		ClearSlot( f5_arg0, f5_arg1 )
		return true
	end )
	if not Engine.IsSingleplayer() then
		f5_arg0.bindButton:addEventHandler( "button_alt2", function ( f9_arg0, f9_arg1 )
			local f9_local0 = f9_arg1.controller or f5_arg1
			local f9_local1 = f9_arg0:getParent()
			if #f9_local1:getAllFocusedChildren() <= 0 then
				f9_local1 = f9_arg0:getParent()
				if f9_local1:isInFocus() then
				
				else
					return false
				end
			end
			PersonalizeSlot( f5_arg0, f9_local0 )
			return true
		end )
	end
	f5_arg0:addEventHandler( "refresh_widget", function ( f10_arg0, f10_arg1 )
		ACTIONS.AnimateSequence( f10_arg0, "RefreshWidget" )
	end )
	f5_arg0:registerEventHandler( "button_over", function ( element, event )
		AnimateWeaponButton( element, true, f5_arg1 )
		ACTIONS.AnimateSequence( element, "Pulse" )
		if not Engine.IsMultiplayer() then
			local f11_local0 = element:GetDataSource()
			f11_local0 = f11_local0.weapon:GetValue( f5_arg1 )
			Engine.NotifyServer( f11_local0, 1 )
			Engine.SetDvarString( "loadout_weapon_string", f11_local0 )
		end
	end )
	f5_arg0:registerEventHandler( "button_up", function ( element, event )
		AnimateWeaponButton( element, false, f5_arg1 )
		ACTIONS.AnimateSequence( element, "PulseStop" )
	end )
	f5_arg0:SubscribeToModelThroughElement( f5_arg0, "used", function ()
		AnimateWeaponButton( f5_arg0, f5_arg0:isInFocus(), f5_arg1 )
	end )
	assert( f5_arg0.bindButton )
	if Engine.IsSingleplayer() and not ShipCribUtils.IsSelectedMissionJackal() then
		f5_arg0.bindButton:addEventHandler( "button_alt2", function ( f14_arg0, f14_arg1 )
			local f14_local0 = f14_arg0:getParent()
			if #f14_local0:getAllFocusedChildren() <= 0 then
				f14_local0 = f14_arg0:getParent()
				if f14_local0:isInFocus() then
				
				else
					
				end
			end
			f14_local0 = f5_arg0:GetCurrentMenu()
			local f14_local1 = f14_local0.SPLoadout:GetDataSource()
			local f14_local2 = f14_local1.slot:GetValue( f5_arg1 )
			local f14_local3 = f5_arg0:GetDataSource()
			VRManager.RunVRRoom( f14_local1, f14_local3.weapon:GetValue( f5_arg1 ), VRManager.ItemType.WEAPON, f5_arg1 )
			return true
		end )
		f5_arg0:SubscribeToModelThroughElement( f5_arg0, "weapon", function ()
			if f5_arg0:isInFocus() then
				AnimateWeaponButton( f5_arg0, true, f5_arg1 )
				ACTIONS.AnimateSequence( f5_arg0, "Pulse" )
				local f15_local0 = f5_arg0:GetDataSource()
				f15_local0 = f15_local0.weapon:GetValue( f5_arg1 )
				Engine.NotifyServer( f15_local0, 1 )
				Engine.SetDvarString( "loadout_weapon_string", f15_local0 )
			end
		end )
	end
	if CONDITIONS.IsCoreFrontendPC() then
		f5_arg0.WeaponName:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 12, _1080p * 230, _1080p * -25, _1080p * -3 )
		f5_arg0.QualityIcon:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -40, _1080p * -8, _1080p * -50, _1080p * -18 )
		f5_arg0.PersonalizeButton:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -18, _1080p * 67, _1080p * 8, _1080p * 28 )
		f5_arg0.PersonalizeLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 72, _1080p * 250, _1080p * 10, _1080p * 26 )
		f5_arg0.WeaponLevel:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -79, _1080p * -37, _1080p * 4, _1080p * 38 )
		f5_arg0.MK2:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -107, _1080p * -43, _1080p * -48.5, _1080p * -16.5 )
		f5_arg0.WeaponPersonalizeButton:addEventHandler( "button_action", function ( f16_arg0, f16_arg1 )
			PersonalizeSlot( f5_arg0, f5_arg1 )
		end )
		f5_arg0.ClearButton:addEventHandler( "button_action", function ( f17_arg0, f17_arg1 )
			ClearSlot( f5_arg0, f5_arg1 )
		end )
		f5_arg0:registerEventHandler( "refresh_button_helper", function ( element, event )
			element.PersonalizeButton:setText( Engine.Localize( "LUA_MENU_PAD_ALT2_BUTTON" ), 0 )
		end )
	end
	if CONDITIONS.InFrontend( f5_arg0 ) then
		if IsPublicMatch() then
			f5_arg0.WeaponLevel:SetAlpha( 1 )
		else
			f5_arg0.WeaponLevel:SetAlpha( 0 )
		end
	end
	if Engine.IsMultiplayer() then
		f5_arg0.QualityIcon:SubscribeToModelThroughElement( f5_arg0, "quality", function ()
			local f19_local0 = f5_arg0:GetDataSource()
			f19_local0 = f19_local0.isMk2:GetValue( f5_arg1 )
			local f19_local1 = f5_arg0:GetDataSource()
			f19_local1 = f19_local1.qualityImage:GetValue( f5_arg1 )
			if f19_local1 ~= nil then
				f5_arg0.QualityIcon.IconDuplicate:setImage( RegisterMaterial( f19_local1 .. "_mk2" ), 0 )
			end
			if f19_local0 then
				f5_arg0.MK2:SetAlpha( 0.5, 0 )
				f5_arg0.MK2Pattern:SetAlpha( 0.5, 0 )
				f5_arg0.MK2Gradient:SetAlpha( 0.75, 0 )
				ACTIONS.AnimateSequenceByElement( f5_arg0, {
					elementName = "QualityIcon",
					sequenceName = "LegendaryPulse",
					elementPath = "QualityIcon"
				} )
			else
				f5_arg0.QualityIcon.IconDuplicate:SetAlpha( 0, 0 )
				f5_arg0.MK2:SetAlpha( 0, 0 )
				f5_arg0.MK2Pattern:SetAlpha( 0, 0 )
				f5_arg0.MK2Gradient:SetAlpha( 0, 0 )
				ACTIONS.AnimateSequenceByElement( f5_arg0, {
					elementName = "QualityIcon",
					sequenceName = "StopPulse",
					elementPath = "QualityIcon"
				} )
			end
		end )
	end
end

function WeaponButton( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 295 * _1080p, 0, 185 * _1080p )
	self.id = "WeaponButton"
	self._animationSets = {}
	self._sequences = {}
	local f20_local1 = controller and controller.controllerIndex
	if not f20_local1 and not Engine.InFrontend() then
		f20_local1 = self:getRootController()
	end
	assert( f20_local1 )
	local f20_local2 = self
	local f20_local3 = nil
	if CONDITIONS.InGameSPOrFrontendMP( self ) then
		f20_local3 = MenuBuilder.BuildRegisteredType( "GenericItemBackground", {
			controllerIndex = f20_local1
		} )
		f20_local3.id = "GenericItemBackground"
		f20_local3:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
		self:addElement( f20_local3 )
		self.GenericItemBackground = f20_local3
	end
	local f20_local4 = nil
	if Engine.IsMultiplayer() then
		f20_local4 = MenuBuilder.BuildRegisteredType( "MK2Gradient", {
			controllerIndex = f20_local1
		} )
		f20_local4.id = "MK2Gradient"
		f20_local4:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
		f20_local4:SubscribeToModelThroughElement( self, "qualityColor", function ()
			local f21_local0 = self:GetDataSource()
			f21_local0 = f21_local0.qualityColor:GetValue( f20_local1 )
			if f21_local0 ~= nil then
				f20_local4:SetRGBFromInt( f21_local0, 0 )
			end
		end )
		self:addElement( f20_local4 )
		self.MK2Gradient = f20_local4
	end
	local f20_local5 = nil
	if Engine.IsMultiplayer() then
		f20_local5 = MenuBuilder.BuildRegisteredType( "MK2Pattern", {
			controllerIndex = f20_local1
		} )
		f20_local5.id = "MK2Pattern"
		f20_local5:SetAlpha( 0.29, 0 )
		f20_local5:SetScale( -0.4, 0 )
		f20_local5:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -98, _1080p * 98, _1080p * -62, _1080p * 62 )
		f20_local5:SubscribeToModelThroughElement( self, "qualityColor", function ()
			local f22_local0 = self:GetDataSource()
			f22_local0 = f22_local0.qualityColor:GetValue( f20_local1 )
			if f22_local0 ~= nil then
				f20_local5:SetRGBFromInt( f22_local0, 0 )
			end
		end )
		self:addElement( f20_local5 )
		self.MK2Pattern = f20_local5
	end
	local f20_local6 = nil
	if Engine.IsMultiplayer() then
		f20_local6 = LUI.UIImage.new()
		f20_local6.id = "MK2"
		f20_local6:SetAlpha( 0.5, 0 )
		f20_local6:setImage( RegisterMaterial( "mk2_watermark_1" ), 0 )
		f20_local6:SetBlendMode( BLEND_MODE.addWithAlpha )
		f20_local6:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -72, _1080p * -8, _1080p * -42, _1080p * -10 )
		self:addElement( f20_local6 )
		self.MK2 = f20_local6
	end
	local WeaponImage = nil
	
	WeaponImage = LUI.UIImage.new()
	WeaponImage.id = "WeaponImage"
	WeaponImage:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -120, _1080p * 120, _1080p * -60, _1080p * 60 )
	WeaponImage:SubscribeToModelThroughElement( self, "icon", function ()
		local f23_local0 = self:GetDataSource()
		f23_local0 = f23_local0.icon:GetValue( f20_local1 )
		if f23_local0 ~= nil then
			WeaponImage:setImage( RegisterMaterial( f23_local0 ), 0 )
		end
	end )
	self:addElement( WeaponImage )
	self.WeaponImage = WeaponImage
	
	local PersonalizeLabel = nil
	
	PersonalizeLabel = LUI.UIStyledText.new()
	PersonalizeLabel.id = "PersonalizeLabel"
	PersonalizeLabel:SetAlpha( 0, 0 )
	PersonalizeLabel:setText( Engine.Localize( "LUA_MENU_MP_PERSONALIZE" ), 0 )
	PersonalizeLabel:SetFontSize( 16 * _1080p )
	PersonalizeLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	PersonalizeLabel:SetAlignment( LUI.Alignment.Left )
	PersonalizeLabel:SetOptOutRightToLeftAlignmentFlip( true )
	PersonalizeLabel:SetStartupDelay( 1000 )
	PersonalizeLabel:SetLineHoldTime( 400 )
	PersonalizeLabel:SetAnimMoveTime( 150 )
	PersonalizeLabel:SetEndDelay( 1000 )
	PersonalizeLabel:SetCrossfadeTime( 400 )
	PersonalizeLabel:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	PersonalizeLabel:SetMaxVisibleLines( 1 )
	PersonalizeLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 119, _1080p * 333, _1080p * 159, _1080p * 175 )
	self:addElement( PersonalizeLabel )
	self.PersonalizeLabel = PersonalizeLabel
	
	local PersonalizeButton = nil
	
	PersonalizeButton = LUI.UIText.new()
	PersonalizeButton.id = "PersonalizeButton"
	PersonalizeButton:SetAlpha( 0, 0 )
	PersonalizeButton:setText( Engine.Localize( "LUA_MENU_PAD_ALT2_BUTTON" ), 0 )
	PersonalizeButton:SetFontSize( 20 * _1080p )
	PersonalizeButton:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	PersonalizeButton:SetAlignment( LUI.Alignment.Right )
	PersonalizeButton:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 29, _1080p * 114, _1080p * 157, _1080p * 177 )
	self:addElement( PersonalizeButton )
	self.PersonalizeButton = PersonalizeButton
	
	local f20_local10 = nil
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() and Engine.InFrontend() then
		f20_local10 = MenuBuilder.BuildRegisteredType( "PointCosts", {
			controllerIndex = f20_local1
		} )
		f20_local10.id = "PointCosts"
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() and Engine.InFrontend() then
			f20_local10:SetDataSourceThroughElement( self, "pointCost" )
		end
		f20_local10:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -103, _1080p * -8, _1080p * -12, _1080p * -8 )
		self:addElement( f20_local10 )
		self.PointCosts = f20_local10
	end
	local PulseCover = nil
	
	PulseCover = LUI.UIImage.new()
	PulseCover.id = "PulseCover"
	PulseCover:SetRGBFromTable( SWATCHES.CAC.greenLight, 0 )
	PulseCover:SetAlpha( 0, 0 )
	PulseCover:setImage( RegisterMaterial( "widg_gradient_right_to_left" ), 0 )
	PulseCover:SetBlendMode( BLEND_MODE.addWithAlpha )
	PulseCover:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -294, 0, 0, 0 )
	self:addElement( PulseCover )
	self.PulseCover = PulseCover
	
	local f20_local12 = nil
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		f20_local12 = MenuBuilder.BuildRegisteredType( "QualityIcon", {
			controllerIndex = f20_local1
		} )
		f20_local12.id = "QualityIcon"
		f20_local12:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -283.5, _1080p * -251.5, _1080p * 146, _1080p * 178 )
		f20_local12:SubscribeToModelThroughElement( self, "qualityImage", function ()
			local f24_local0 = self:GetDataSource()
			f24_local0 = f24_local0.qualityImage:GetValue( f20_local1 )
			if f24_local0 ~= nil then
				f20_local12.IconShadow:setImage( RegisterMaterial( f24_local0 ), 0 )
			end
		end )
		f20_local12:SubscribeToModelThroughElement( self, "qualityColor", function ()
			local f25_local0 = self:GetDataSource()
			f25_local0 = f25_local0.qualityColor:GetValue( f20_local1 )
			if f25_local0 ~= nil then
				f20_local12.Icon:SetRGBFromInt( f25_local0, 0 )
			end
		end )
		f20_local12:SubscribeToModelThroughElement( self, "qualityImage", function ()
			local f26_local0 = self:GetDataSource()
			f26_local0 = f26_local0.qualityImage:GetValue( f20_local1 )
			if f26_local0 ~= nil then
				f20_local12.Icon:setImage( RegisterMaterial( f26_local0 ), 0 )
			end
		end )
		f20_local12:SubscribeToModelThroughElement( self, "qualityColor", function ()
			local f27_local0 = self:GetDataSource()
			f27_local0 = f27_local0.qualityColor:GetValue( f20_local1 )
			if f27_local0 ~= nil then
				f20_local12.IconDuplicate:SetRGBFromInt( f27_local0, 0 )
			end
		end )
		self:addElement( f20_local12 )
		self.QualityIcon = f20_local12
	end
	local GenericButtonSelection = nil
	
	GenericButtonSelection = MenuBuilder.BuildRegisteredType( "GenericButtonSelection", {
		controllerIndex = f20_local1
	} )
	GenericButtonSelection.id = "GenericButtonSelection"
	GenericButtonSelection:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( GenericButtonSelection )
	self.GenericButtonSelection = GenericButtonSelection
	
	local f20_local14 = nil
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() and CONDITIONS.InFrontend( self ) then
		f20_local14 = MenuBuilder.BuildRegisteredType( "WeaponButtonLevel", {
			controllerIndex = f20_local1
		} )
		f20_local14.id = "WeaponLevel"
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() and CONDITIONS.InFrontend( self ) then
			f20_local14:SetDataSourceThroughElement( self, "weaponRef" )
		end
		f20_local14:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -50, _1080p * -8, _1080p * 9, _1080p * 43 )
		self:addElement( f20_local14 )
		self.WeaponLevel = f20_local14
	end
	local WeaponName = nil
	
	WeaponName = LUI.UIStyledText.new()
	WeaponName.id = "WeaponName"
	WeaponName:SetRGBFromInt( 14277081, 0 )
	WeaponName:SetAlpha( 0.75, 0 )
	WeaponName:SetFontSize( 22 * _1080p )
	WeaponName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	WeaponName:SetAlignment( LUI.Alignment.Left )
	WeaponName:SetOptOutRightToLeftAlignmentFlip( true )
	WeaponName:SetStartupDelay( 1250 )
	WeaponName:SetLineHoldTime( 400 )
	WeaponName:SetAnimMoveTime( 300 )
	WeaponName:SetEndDelay( 1000 )
	WeaponName:SetCrossfadeTime( 500 )
	WeaponName:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	WeaponName:SetMaxVisibleLines( 1 )
	WeaponName:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 12, _1080p * 230, _1080p * 5, _1080p * 27 )
	WeaponName:SubscribeToModelThroughElement( self, "name", function ()
		local f28_local0 = self:GetDataSource()
		f28_local0 = f28_local0.name:GetValue( f20_local1 )
		if f28_local0 ~= nil then
			WeaponName:setText( f28_local0, 0 )
		end
	end )
	self:addElement( WeaponName )
	self.WeaponName = WeaponName
	
	local f20_local16 = nil
	if CONDITIONS.UseCACBreadCrumbs( self ) then
		f20_local16 = MenuBuilder.BuildRegisteredType( "NewItemNotification", {
			controllerIndex = f20_local1
		} )
		f20_local16.id = "NewItemNotification"
		f20_local16:SetAlpha( 0, 0 )
		f20_local16:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -32, _1080p * 32, _1080p * -67, _1080p * -3 )
		self:addElement( f20_local16 )
		self.NewItemNotification = f20_local16
	end
	local f20_local17 = nil
	if CONDITIONS.IsCoreFrontendPC( self ) then
		f20_local17 = MenuBuilder.BuildRegisteredType( "ClearButton", {
			controllerIndex = f20_local1
		} )
		f20_local17.id = "ClearButton"
		if CONDITIONS.IsCoreFrontendPC( self ) then
			f20_local17:SetDataSourceThroughElement( self, nil )
		end
		f20_local17:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -32, _1080p * -4, _1080p * 4, _1080p * 32 )
		self:addElement( f20_local17 )
		self.ClearButton = f20_local17
	end
	local f20_local18 = nil
	if CONDITIONS.IsCoreFrontendPC( self ) then
		f20_local18 = MenuBuilder.BuildRegisteredType( "WeaponPersonalizeButton", {
			controllerIndex = f20_local1
		} )
		f20_local18.id = "WeaponPersonalizeButton"
		if CONDITIONS.IsCoreFrontendPC( self ) then
			f20_local18:SetDataSourceThroughElement( self, nil )
		end
		f20_local18:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 13, _1080p * 205.5, _1080p * 4, _1080p * 32 )
		self:addElement( f20_local18 )
		self.WeaponPersonalizeButton = f20_local18
	end
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		WeaponImage:RegisterAnimationSequence( "ButtonOverInUse", {
			{
				function ()
					return self.WeaponImage:SetScale( 0.05, 100 )
				end
			},
			{
				function ()
					return self.WeaponImage:SetAlpha( 1, 100 )
				end
			}
		} )
		PulseCover:RegisterAnimationSequence( "ButtonOverInUse", {
			{
				function ()
					return self.PulseCover:SetRGBFromTable( SWATCHES.CAC.yellowHighlight, 0 )
				end
			}
		} )
		WeaponName:RegisterAnimationSequence( "ButtonOverInUse", {
			{
				function ()
					return self.WeaponName:SetAlpha( 0.6, 0 )
				end
			}
		} )
		self._sequences.ButtonOverInUse = function ()
			WeaponImage:AnimateSequence( "ButtonOverInUse" )
			PulseCover:AnimateSequence( "ButtonOverInUse" )
			WeaponName:AnimateSequence( "ButtonOverInUse" )
		end
		
		WeaponImage:RegisterAnimationSequence( "ButtonOverNotInUse", {
			{
				function ()
					return self.WeaponImage:SetAlpha( 0, 100 )
				end
			},
			{
				function ()
					return self.WeaponImage:SetScale( 0, 100 )
				end
			}
		} )
		PulseCover:RegisterAnimationSequence( "ButtonOverNotInUse", {
			{
				function ()
					return self.PulseCover:SetRGBFromTable( SWATCHES.CAC.yellowHighlight, 0 )
				end
			}
		} )
		WeaponName:RegisterAnimationSequence( "ButtonOverNotInUse", {
			{
				function ()
					return self.WeaponName:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.ButtonOverNotInUse = function ()
			WeaponImage:AnimateSequence( "ButtonOverNotInUse" )
			PulseCover:AnimateSequence( "ButtonOverNotInUse" )
			WeaponName:AnimateSequence( "ButtonOverNotInUse" )
		end
		
		WeaponImage:RegisterAnimationSequence( "ButtonUpInUse", {
			{
				function ()
					return self.WeaponImage:SetAlpha( 1, 200 )
				end
			},
			{
				function ()
					return self.WeaponImage:SetScale( 0, 200 )
				end
			}
		} )
		PersonalizeLabel:RegisterAnimationSequence( "ButtonUpInUse", {
			{
				function ()
					return self.PersonalizeLabel:SetAlpha( 0, 200 )
				end
			}
		} )
		PersonalizeButton:RegisterAnimationSequence( "ButtonUpInUse", {
			{
				function ()
					return self.PersonalizeButton:SetAlpha( 0, 200 )
				end
			}
		} )
		PulseCover:RegisterAnimationSequence( "ButtonUpInUse", {
			{
				function ()
					return self.PulseCover:SetRGBFromTable( SWATCHES.CAC.greenLight, 0 )
				end
			}
		} )
		WeaponName:RegisterAnimationSequence( "ButtonUpInUse", {
			{
				function ()
					return self.WeaponName:SetAlpha( 0.6, 0 )
				end
			}
		} )
		self._sequences.ButtonUpInUse = function ()
			WeaponImage:AnimateSequence( "ButtonUpInUse" )
			PersonalizeLabel:AnimateSequence( "ButtonUpInUse" )
			PersonalizeButton:AnimateSequence( "ButtonUpInUse" )
			PulseCover:AnimateSequence( "ButtonUpInUse" )
			WeaponName:AnimateSequence( "ButtonUpInUse" )
		end
		
		WeaponImage:RegisterAnimationSequence( "ButtonUpNotInUse", {
			{
				function ()
					return self.WeaponImage:SetAlpha( 0, 200 )
				end
			},
			{
				function ()
					return self.WeaponImage:SetScale( 0, 200 )
				end
			}
		} )
		PersonalizeLabel:RegisterAnimationSequence( "ButtonUpNotInUse", {
			{
				function ()
					return self.PersonalizeLabel:SetAlpha( 0, 200 )
				end
			}
		} )
		PersonalizeButton:RegisterAnimationSequence( "ButtonUpNotInUse", {
			{
				function ()
					return self.PersonalizeButton:SetAlpha( 0, 200 )
				end
			}
		} )
		PulseCover:RegisterAnimationSequence( "ButtonUpNotInUse", {
			{
				function ()
					return self.PulseCover:SetRGBFromTable( SWATCHES.CAC.greenLight, 0 )
				end
			}
		} )
		WeaponName:RegisterAnimationSequence( "ButtonUpNotInUse", {
			{
				function ()
					return self.WeaponName:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.ButtonUpNotInUse = function ()
			WeaponImage:AnimateSequence( "ButtonUpNotInUse" )
			PersonalizeLabel:AnimateSequence( "ButtonUpNotInUse" )
			PersonalizeButton:AnimateSequence( "ButtonUpNotInUse" )
			PulseCover:AnimateSequence( "ButtonUpNotInUse" )
			WeaponName:AnimateSequence( "ButtonUpNotInUse" )
		end
		
		self._sequences.Pulse = function ()
			
		end
		
		self._sequences.PulseStop = function ()
			
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
					return self.PulseCover:SetAlpha( 0.3, 30 )
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
					return self.PulseCover:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -294, 0, 0, 0, 180 )
				end,
				function ()
					return self.PulseCover:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 295, 0, 0, 0, 420 )
				end
			}
		} )
		self._sequences.RefreshWidget = function ()
			PulseCover:AnimateSequence( "RefreshWidget" )
		end
		
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
			f20_local12:RegisterAnimationSequence( "ShowQuality", {
				{
					function ()
						return self.QualityIcon:SetAlpha( 1, 0 )
					end
				}
			} )
		end
		self._sequences.ShowQuality = function ()
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
				f20_local12:AnimateSequence( "ShowQuality" )
			end
		end
		
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
			f20_local12:RegisterAnimationSequence( "HideQuality", {
				{
					function ()
						return self.QualityIcon:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		self._sequences.HideQuality = function ()
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
				f20_local12:AnimateSequence( "HideQuality" )
			end
		end
		
		WeaponImage:RegisterAnimationSequence( "Disabled", {
			{
				function ()
					return self.WeaponImage:SetAlpha( 0.5, 200 )
				end
			}
		} )
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() and Engine.InFrontend() then
			f20_local10:RegisterAnimationSequence( "Disabled", {
				{
					function ()
						return self.PointCosts:SetAlpha( 0.5, 200 )
					end
				}
			} )
		end
		WeaponName:RegisterAnimationSequence( "Disabled", {
			{
				function ()
					return self.WeaponName:SetAlpha( 0, 200 )
				end
			}
		} )
		self._sequences.Disabled = function ()
			WeaponImage:AnimateSequence( "Disabled" )
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() and Engine.InFrontend() then
				f20_local10:AnimateSequence( "Disabled" )
			end
			WeaponName:AnimateSequence( "Disabled" )
		end
		
		WeaponName:RegisterAnimationSequence( "ButtonOverDisabled", {
			{
				function ()
					return self.WeaponName:SetAlpha( 0, 100 )
				end
			}
		} )
		self._sequences.ButtonOverDisabled = function ()
			WeaponName:AnimateSequence( "ButtonOverDisabled" )
		end
		
		WeaponImage:RegisterAnimationSequence( "Enabled", {
			{
				function ()
					return self.WeaponImage:SetAlpha( 1, 0 )
				end
			}
		} )
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() and Engine.InFrontend() then
			f20_local10:RegisterAnimationSequence( "Enabled", {
				{
					function ()
						return self.PointCosts:SetAlpha( 1, 0 )
					end
				}
			} )
		end
		self._sequences.Enabled = function ()
			WeaponImage:AnimateSequence( "Enabled" )
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() and Engine.InFrontend() then
				f20_local10:AnimateSequence( "Enabled" )
			end
		end
		
		PersonalizeLabel:RegisterAnimationSequence( "PersonalizeOver", {
			{
				function ()
					return self.PersonalizeLabel:SetAlpha( 0, 150 )
				end,
				function ()
					return self.PersonalizeLabel:SetAlpha( 1, 10 )
				end,
				function ()
					return self.PersonalizeLabel:SetAlpha( 1, 40 )
				end
			}
		} )
		PersonalizeButton:RegisterAnimationSequence( "PersonalizeOver", {
			{
				function ()
					return self.PersonalizeButton:SetAlpha( 0, 150 )
				end,
				function ()
					return self.PersonalizeButton:SetAlpha( 1, 10 )
				end,
				function ()
					return self.PersonalizeButton:SetAlpha( 1, 40 )
				end
			}
		} )
		self._sequences.PersonalizeOver = function ()
			PersonalizeLabel:AnimateSequence( "PersonalizeOver" )
			PersonalizeButton:AnimateSequence( "PersonalizeOver" )
		end
		
		PersonalizeLabel:RegisterAnimationSequence( "PersonalizeUp", {
			{
				function ()
					return self.PersonalizeLabel:SetAlpha( 0, 100 )
				end
			}
		} )
		PersonalizeButton:RegisterAnimationSequence( "PersonalizeUp", {
			{
				function ()
					return self.PersonalizeButton:SetAlpha( 0, 100 )
				end
			}
		} )
		self._sequences.PersonalizeUp = function ()
			PersonalizeLabel:AnimateSequence( "PersonalizeUp" )
			PersonalizeButton:AnimateSequence( "PersonalizeUp" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		f20_local12:SubscribeToModelThroughElement( self, "quality", function ()
			local f91_local0 = self:GetDataSource()
			if f91_local0.quality:GetValue( f20_local1 ) ~= nil then
				f91_local0 = self:GetDataSource()
				if f91_local0.quality:GetValue( f20_local1 ) == 0 then
					ACTIONS.AnimateSequence( self, "HideQuality" )
				end
			end
			f91_local0 = self:GetDataSource()
			if f91_local0.quality:GetValue( f20_local1 ) ~= nil then
				f91_local0 = self:GetDataSource()
				if f91_local0.quality:GetValue( f20_local1 ) ~= 0 then
					ACTIONS.AnimateSequence( self, "ShowQuality" )
				end
			end
		end )
	end
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() and Engine.InFrontend() then
		f20_local10:SetDataSourceThroughElement( self, "pointCost" )
	end
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() and CONDITIONS.InFrontend( self ) then
		f20_local14:SetDataSourceThroughElement( self, "weaponRef" )
	end
	if CONDITIONS.IsCoreFrontendPC( self ) then
		f20_local17:SetDataSourceThroughElement( self, nil )
	end
	if CONDITIONS.IsCoreFrontendPC( self ) then
		f20_local18:SetDataSourceThroughElement( self, nil )
	end
	self:addEventHandler( "button_disable", function ( f92_arg0, f92_arg1 )
		local f92_local0 = f92_arg1.controller or f20_local1
		ACTIONS.AnimateSequence( self, "Disabled" )
	end )
	self:addEventHandler( "button_over_disable", function ( f93_arg0, f93_arg1 )
		local f93_local0 = f93_arg1.controller or f20_local1
		ACTIONS.AnimateSequence( self, "ButtonOverDisabled" )
	end )
	PostLoadFunc( self, f20_local1, controller )
	return self
end

MenuBuilder.registerType( "WeaponButton", WeaponButton )
LockTable( _M )
