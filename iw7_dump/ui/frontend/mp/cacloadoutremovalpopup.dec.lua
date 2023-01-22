local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1 )
	return function ( f2_arg0, f2_arg1 )
		ACTIONS.OnClearWeapon( f2_arg0, f1_arg1 )
	end
	
end

f0_local1 = function ( f3_arg0, f3_arg1 )
	return function ( f4_arg0, f4_arg1 )
		if LUI.FlowManager.IsInStack( "AttachmentSelect" ) then
			local f4_local0 = f4_arg0:GetDataSource()
			if f4_local0.used:GetValue( f3_arg1 ) then
				local f4_local1 = f4_arg0:GetDataSource()
				if f4_local1.weaponIndex == f3_arg0.weaponSlot then
					f4_local1 = LUI.FlowManager.GetScopedData( "AttachmentSelect" )
					f4_local1.updateOnRemoval = true
				end
			end
		end
		ACTIONS.OnClearAttachment( f4_arg0, f3_arg1 )
	end
	
end

f0_local2 = function ( f5_arg0, f5_arg1, f5_arg2 )
	return function ( f6_arg0, f6_arg1 )
		if #f5_arg1:getAllFocusedChildren() > 0 or f5_arg1:isInFocus() then
			local f6_local0 = f5_arg1:GetDataSource()
			if f6_local0.used:GetValue( f5_arg2 ) and not f5_arg1:IsDisabled() then
				f6_local0 = f5_arg1:GetDataSource()
				f6_local0.usedInt:SetValue( f5_arg2, 0 )
				ACTIONS.OnClearWeapon( f5_arg0.CACLoadout.WeaponTwo.WeaponButton, f5_arg2 )
			end
		end
	end
	
end

local f0_local3 = function ( f7_arg0, f7_arg1 )
	return function ( f8_arg0, f8_arg1 )
		ACTIONS.OnClearPower( f8_arg0, f7_arg1 )
	end
	
end

local f0_local4 = function ( f9_arg0, f9_arg1 )
	return function ( f10_arg0, f10_arg1 )
		ACTIONS.OnClearExtraPower( f10_arg0, f9_arg1 )
	end
	
end

local f0_local5 = function ( f11_arg0, f11_arg1, f11_arg2 )
	return function ( f12_arg0, f12_arg1 )
		if LUI.FlowManager.IsInStack( "PerkSelect" ) then
			local f12_local0 = f12_arg0:GetDataSource()
			if not f11_arg2 and f12_local0.used:GetValue( f11_arg1 ) then
				local f12_local1 = f12_arg0:GetDataSource()
				if f12_local1.slotIndex:GetValue( f11_arg1 ) == f11_arg0.perkSlot then
					f12_local1 = LUI.FlowManager.GetScopedData( "PerkSelect" )
					f12_local1.updateOnRemoval = true
				end
			end
		end
		ACTIONS.OnClearPerk( f12_arg0, f11_arg1 )
	end
	
end

function PreLoadFunc( f13_arg0, f13_arg1, f13_arg2 )
	f13_arg0:addEventHandler( "menu_close", function ( f14_arg0, f14_arg1 )
		local f14_local0 = LUI.FlowManager.GetScopedData( f13_arg0 )
		f14_local0.hideWeaponBreadcrumbs = false
	end )
	local f13_local0 = LUI.FlowManager.GetScopedData( f13_arg0 )
	f13_local0.hideWeaponBreadcrumbs = true
end

function PostLoadFunc( f15_arg0, f15_arg1, f15_arg2 )
	assert( f15_arg2.loadoutDataSource )
	assert( f15_arg2.statsGroupDataSource )
	f15_arg0.loadoutDataSource = f15_arg2.loadoutDataSource
	f15_arg0.statsGroupDataSource = f15_arg2.statsGroupDataSource
	f15_arg0.desiredItemCost = f15_arg2.desiredItemCost
	f15_arg0.CheckRemainingPoints = CheckRemainingPoints
	local f15_local0 = f15_arg0.CACLoadout
	f15_arg0:addEventHandler( "menu_create", function ( f16_arg0, f16_arg1 )
		f15_local0:SetDataSource( f15_arg0.loadoutDataSource, f15_arg1 )
		f15_arg0.PickPoints:SetDataSource( f15_arg0.loadoutDataSource, f15_arg1 )
	end )
	if f15_arg2.weaponSlot then
		f15_arg0.weaponSlot = f15_arg2.weaponSlot
		if f15_arg2.weaponSlot == 0 then
			f15_local0.WeaponOne.WeaponButton:ElementDisable()
		elseif f15_arg2.weaponSlot == 1 then
			f15_local0.WeaponTwo.WeaponButton:ElementDisable()
			f15_local0.WeaponTwo.Overkill:ElementDisable()
		end
	end
	if f15_arg2.perkSlot then
		f15_arg0.perkSlot = f15_arg2.perkSlot
	end
	f15_local0.WeaponOne.WeaponButton.loadoutRemovalPopup = true
	f15_local0.WeaponOne.WeaponButton:addEventHandler( "button_action", f0_local0( f15_arg0, f15_arg1 ) )
	f15_local0.WeaponTwo.WeaponButton.loadoutRemovalPopup = true
	f15_local0.WeaponTwo.WeaponButton:addEventHandler( "button_action", f0_local0( f15_arg0, f15_arg1 ) )
	for f15_local8, f15_local9 in pairs( {
		{
			attachmentGrids = {
				f15_local0.WeaponOne.AttachmentsOne,
				f15_local0.WeaponOne.AttachmentsTwo
			},
			weapon = f15_local0.WeaponOne.WeaponButton
		},
		{
			attachmentGrids = {
				f15_local0.WeaponTwo.AttachmentsOne,
				f15_local0.WeaponTwo.AttachmentsTwo
			},
			weapon = f15_local0.WeaponTwo.WeaponButton
		}
	} ) do
		for f15_local5, f15_local6 in ipairs( f15_local9.attachmentGrids ) do
			local f15_local4 = f15_local6:getFirstChild()
			while f15_local4 do
				if f15_local4.bindButton then
					f15_local4.loadoutRemovalPopup = true
					f15_local4:addEventHandler( "button_action", f0_local1( f15_arg0, f15_arg1 ) )
				end
				f15_local4 = f15_local4:getNextSibling()
			end
		end
	end
	f15_local0.WeaponTwo.Overkill:addEventHandler( "button_action", f0_local2( f15_arg0, f15_local0.WeaponTwo.Overkill, f15_arg1 ) )
	f15_local0.WeaponTwo.Overkill.bindButton:addEventHandler( "button_alt1", f0_local2( f15_arg0, f15_local0.WeaponTwo.Overkill, f15_arg1 ) )
	f15_local0.Equipment.PowerSlotOne.PowerButton.loadoutRemovalPopup = true
	f15_local0.Equipment.PowerSlotOne.PowerButton:addEventHandler( "button_action", f0_local3( f15_arg0, f15_arg1 ) )
	f15_local0.Equipment.PowerSlotTwo.PowerButton.loadoutRemovalPopup = true
	f15_local0.Equipment.PowerSlotTwo.PowerButton:addEventHandler( "button_action", f0_local3( f15_arg0, f15_arg1 ) )
	f15_local0.Equipment.PowerSlotOne.ExtraPowerButton.loadoutRemovalPopup = true
	f15_local0.Equipment.PowerSlotOne.ExtraPowerButton:addEventHandler( "button_action", f0_local4( f15_arg0, f15_arg1 ) )
	f15_local0.Equipment.PowerSlotTwo.ExtraPowerButton.loadoutRemovalPopup = true
	f15_local0.Equipment.PowerSlotTwo.ExtraPowerButton:addEventHandler( "button_action", f0_local4( f15_arg0, f15_arg1 ) )
	for f15_local9, f15_local10 in ipairs( {
		f15_local0.PerkOne,
		f15_local0.PerkTwo,
		f15_local0.PerkThree
	} ) do
		f15_local10.Perk.loadoutRemovalPopup = true
		f15_local10.Perk:addEventHandler( "button_action", f0_local5( f15_arg0, f15_arg1, false ) )
		f15_local10.ExtraPerk.loadoutRemovalPopup = true
		f15_local10.ExtraPerk:addEventHandler( "button_action", f0_local5( f15_arg0, f15_arg1, true ) )
	end
	if Engine.IsPC() then
		f15_local0:processEvent( {
			name = "open_loadout_edit_menu"
		} )
	end
	f15_arg0:SubscribeToModel( f15_arg0.loadoutDataSource.pointCountText:GetModel( f15_arg1 ), function ()
		if Cac.CanAffordItem( f15_arg0.loadoutDataSource, f15_arg0.desiredItemCost, f15_arg1 ) then
			ACTIONS.LeaveMenu( f15_arg0 )
		else
			f15_arg0.InstructionMessage:setText( Engine.Localize( "MP_FRONTEND_ONLY_REMOVEITEMS", Cac.PointsNeededForItem( f15_arg0.loadoutDataSource, f15_arg0.desiredItemCost, f15_arg1 ) ), 0 )
		end
	end )
	if CONDITIONS.IsDraftEnabled( f15_arg0 ) then
		assert( f15_arg0.LoadoutDraftTimer )
		Cac.SetupLoadoutDraftTimerRefresh( f15_arg0.LoadoutDraftTimer )
	end
end

function CACLoadoutRemovalPopup( menu, controller )
	local self = LUI.UIVerticalNavigator.new()
	self.id = "CACLoadoutRemovalPopup"
	local f18_local1 = controller and controller.controllerIndex
	if not f18_local1 and not Engine.InFrontend() then
		f18_local1 = self:getRootController()
	end
	assert( f18_local1 )
	PreLoadFunc( self, f18_local1, controller )
	self:playSound( "menu_open" )
	local f18_local2 = self
	local Blur0 = nil
	
	Blur0 = LUI.UIBlur.new()
	Blur0.id = "Blur0"
	Blur0:SetRGBFromInt( 6710886, 0 )
	Blur0:SetBlurStrength( 2, 0 )
	Blur0:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, _1080p * -85 )
	self:addElement( Blur0 )
	self.Blur0 = Blur0
	
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromTable( SWATCHES.genericMenu.popupBackground, 0 )
	Background:SetAlpha( 0, 0 )
	Background:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1096 )
	self:addElement( Background )
	self.Background = Background
	
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f18_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local LoadoutBackground = nil
	
	LoadoutBackground = LUI.UIImage.new()
	LoadoutBackground.id = "LoadoutBackground"
	LoadoutBackground:SetRGBFromInt( 0, 0 )
	LoadoutBackground:SetAlpha( 0.6, 0 )
	LoadoutBackground:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 997.71, _1080p * 1585.71, _1080p * 216, _1080p * 848 )
	self:addElement( LoadoutBackground )
	self.LoadoutBackground = LoadoutBackground
	
	local CACLoadout = nil
	
	CACLoadout = MenuBuilder.BuildRegisteredType( "CACLoadout", {
		controllerIndex = f18_local1
	} )
	CACLoadout.id = "CACLoadout"
	CACLoadout:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 997.71, _1080p * 1585.71, _1080p * 216, _1080p * 848 )
	self:addElement( CACLoadout )
	self.CACLoadout = CACLoadout
	
	local WarningMessage = nil
	
	WarningMessage = LUI.UIText.new()
	WarningMessage.id = "WarningMessage"
	WarningMessage:setText( Engine.Localize( "LUA_MENU_MP_MAX_POINTS_REACHED" ), 0 )
	WarningMessage:SetFontSize( 22 * _1080p )
	WarningMessage:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	WarningMessage:SetAlignment( LUI.Alignment.Left )
	WarningMessage:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 352.99, _1080p * 960, _1080p * 285, _1080p * 307 )
	self:addElement( WarningMessage )
	self.WarningMessage = WarningMessage
	
	local InstructionMessage = nil
	
	InstructionMessage = LUI.UIText.new()
	InstructionMessage.id = "InstructionMessage"
	InstructionMessage:setText( Engine.Localize( "MP_FRONTEND_ONLY_REMOVEITEMS" ), 0 )
	InstructionMessage:SetFontSize( 22 * _1080p )
	InstructionMessage:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	InstructionMessage:SetAlignment( LUI.Alignment.Left )
	InstructionMessage:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 352.99, _1080p * 960, _1080p * 314, _1080p * 336 )
	self:addElement( InstructionMessage )
	self.InstructionMessage = InstructionMessage
	
	local HeaderBacker = nil
	
	HeaderBacker = LUI.UIImage.new()
	HeaderBacker.id = "HeaderBacker"
	HeaderBacker:SetRGBFromInt( 0, 0 )
	HeaderBacker:setImage( RegisterMaterial( "widg_gradient_left_to_right" ), 0 )
	HeaderBacker:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 340.99, _1080p * 980.99, _1080p * 216, _1080p * 261 )
	self:addElement( HeaderBacker )
	self.HeaderBacker = HeaderBacker
	
	local ItemName = nil
	
	ItemName = LUI.UIStyledText.new()
	ItemName.id = "ItemName"
	ItemName:setText( Engine.Localize( "LUA_MENU_MP_REMOVE_ITEMS" ), 0 )
	ItemName:SetFontSize( 38 * _1080p )
	ItemName:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	ItemName:SetAlignment( LUI.Alignment.Left )
	ItemName:SetDecodeLetterLength( 25 )
	ItemName:SetDecodeMaxRandChars( 3 )
	ItemName:SetDecodeUpdatesPerLetter( 4 )
	ItemName:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 356.99, _1080p * 960, _1080p * 220.5, _1080p * 258.5 )
	self:addElement( ItemName )
	self.ItemName = ItemName
	
	local DesctiptionAnchor = nil
	
	DesctiptionAnchor = LUI.UIImage.new()
	DesctiptionAnchor.id = "DesctiptionAnchor"
	DesctiptionAnchor:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 340.99, _1080p * 344.99, _1080p * 285, _1080p * 338 )
	self:addElement( DesctiptionAnchor )
	self.DesctiptionAnchor = DesctiptionAnchor
	
	local PickPoints = nil
	
	PickPoints = MenuBuilder.BuildRegisteredType( "PickPoints", {
		controllerIndex = f18_local1
	} )
	PickPoints.id = "PickPoints"
	PickPoints:SetDotPitchEnabled( true )
	PickPoints:SetDotPitchX( 0, 0 )
	PickPoints:SetDotPitchY( 0, 0 )
	PickPoints:SetDotPitchContrast( 0, 0 )
	PickPoints:SetDotPitchMode( 0 )
	PickPoints:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 997.71, _1080p * 1585.71, _1080p * 185, _1080p * 211 )
	self:addElement( PickPoints )
	self.PickPoints = PickPoints
	
	local f18_local14 = nil
	if CONDITIONS.IsDraftEnabled( self ) then
		f18_local14 = MenuBuilder.BuildRegisteredType( "LoadoutDraftTimer", {
			controllerIndex = f18_local1
		} )
		f18_local14.id = "LoadoutDraftTimer"
		f18_local14:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -250, _1080p * 250, _1080p * 22, _1080p * 86 )
		self:addElement( f18_local14 )
		self.LoadoutDraftTimer = f18_local14
	end
	self.addButtonHelperFunction = function ( f19_arg0, f19_arg1 )
		f19_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_CLEAR" ),
			button_ref = "button_primary",
			side = "left",
			priority = -10,
			clickable = true
		} )
		f19_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			priority = 10,
			clickable = true
		} )
	end
	
	self:addEventHandler( "menu_create", self.addButtonHelperFunction )
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	self.bindButton:addEventHandler( "button_secondary", function ( f20_arg0, f20_arg1 )
		local f20_local0 = f20_arg1.controller or f18_local1
		ACTIONS.LeaveMenu( self )
	end )
	PostLoadFunc( self, f18_local1, controller )
	return self
end

MenuBuilder.registerType( "CACLoadoutRemovalPopup", CACLoadoutRemovalPopup )
LockTable( _M )
