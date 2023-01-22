local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0.RigsButton:addEventHandler( "button_action", function ( f2_arg0, f2_arg1 )
		LUI.FlowManager.RequestAddMenu( "RigsPermanentUnlocks", true, f2_arg1.controller or f1_arg1, false, {
			weaponClass = Cac.PrimaryWeaponSlot
		} )
	end )
	f1_arg0.PrimaryWeaponsButton:addEventHandler( "button_action", function ( f3_arg0, f3_arg1 )
		LUI.FlowManager.RequestAddMenu( "WeaponPermanentUnlocks", true, f3_arg1.controller or f1_arg1, false, {
			weaponClass = Cac.PrimaryWeaponSlot
		} )
	end )
	f1_arg0.SecondaryWeaponsButton:addEventHandler( "button_action", function ( f4_arg0, f4_arg1 )
		LUI.FlowManager.RequestAddMenu( "WeaponPermanentUnlocks", true, f4_arg1.controller or f1_arg1, false, {
			weaponClass = Cac.SecondaryWeaponSlot
		} )
	end )
	f1_arg0.LethalButton:addEventHandler( "button_action", function ( f5_arg0, f5_arg1 )
		LUI.FlowManager.RequestAddMenu( "PowerPermanentUnlocks", true, f5_arg1.controller or f1_arg1, false, {
			powerSlot = Cac.PowerSlot.LETHAL
		} )
	end )
	f1_arg0.TacticalButton:addEventHandler( "button_action", function ( f6_arg0, f6_arg1 )
		LUI.FlowManager.RequestAddMenu( "PowerPermanentUnlocks", true, f6_arg1.controller or f1_arg1, false, {
			powerSlot = Cac.PowerSlot.TACTICAL
		} )
	end )
	f1_arg0.ScorestreaksButton:addEventHandler( "button_action", function ( f7_arg0, f7_arg1 )
		LUI.FlowManager.RequestAddMenu( "ScorestreaksPermanentUnlocks", true, f7_arg1.controller or f1_arg1, false )
	end )
	f1_arg0.PerksButton:addEventHandler( "button_action", function ( f8_arg0, f8_arg1 )
		LUI.FlowManager.RequestAddMenu( "PerksPermanentUnlocks", true, f8_arg1.controller or f1_arg1, false )
	end )
	f1_arg0.Pick10ItemsButton:addEventHandler( "button_action", function ( f9_arg0, f9_arg1 )
		LUI.FlowManager.RequestAddMenu( "Pick10PermanentUnlocks", true, f9_arg1.controller or f1_arg1, false )
	end )
end

function PermanentUnlocksButtons( menu, controller )
	local self = LUI.UIVerticalList.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 600 * _1080p, 0, 725 * _1080p )
	self.id = "PermanentUnlocksButtons"
	local f10_local1 = controller and controller.controllerIndex
	if not f10_local1 and not Engine.InFrontend() then
		f10_local1 = self:getRootController()
	end
	assert( f10_local1 )
	local f10_local2 = self
	self:SetSpacing( 10 * _1080p )
	local RigsButton = nil
	
	RigsButton = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f10_local1
	} )
	RigsButton.id = "RigsButton"
	RigsButton.buttonDescription = Engine.Localize( "PRESTIGE_CATEGORY_RIGS_DESC" )
	RigsButton.Text:setText( ToUpperCase( Engine.Localize( "PRESTIGE_RIG_PACKAGES" ) ), 0 )
	RigsButton:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, 0, _1080p * 30 )
	self:addElement( RigsButton )
	self.RigsButton = RigsButton
	
	local PrimaryWeaponsButton = nil
	
	PrimaryWeaponsButton = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f10_local1
	} )
	PrimaryWeaponsButton.id = "PrimaryWeaponsButton"
	PrimaryWeaponsButton.buttonDescription = Engine.Localize( "PRESTIGE_CATEGORY_PRIMARY_WEAPONS_DESC" )
	PrimaryWeaponsButton.Text:setText( ToUpperCase( Engine.Localize( "MENU_PRIMARY_WEAPONS" ) ), 0 )
	PrimaryWeaponsButton:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, _1080p * 40, _1080p * 70 )
	self:addElement( PrimaryWeaponsButton )
	self.PrimaryWeaponsButton = PrimaryWeaponsButton
	
	local SecondaryWeaponsButton = nil
	
	SecondaryWeaponsButton = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f10_local1
	} )
	SecondaryWeaponsButton.id = "SecondaryWeaponsButton"
	SecondaryWeaponsButton.buttonDescription = Engine.Localize( "PRESTIGE_CATEGORY_SECONDARY_WEAPONS_DESC" )
	SecondaryWeaponsButton.Text:setText( ToUpperCase( Engine.Localize( "MENU_SECONDARY_WEAPONS" ) ), 0 )
	SecondaryWeaponsButton:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, _1080p * 80, _1080p * 110 )
	self:addElement( SecondaryWeaponsButton )
	self.SecondaryWeaponsButton = SecondaryWeaponsButton
	
	local LethalButton = nil
	
	LethalButton = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f10_local1
	} )
	LethalButton.id = "LethalButton"
	LethalButton.buttonDescription = Engine.Localize( "PRESTIGE_CATEGORY_LETHAL_DESC" )
	LethalButton.Text:setText( ToUpperCase( Engine.Localize( "MENU_LETHAL_CAPS" ) ), 0 )
	LethalButton:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, _1080p * 120, _1080p * 150 )
	self:addElement( LethalButton )
	self.LethalButton = LethalButton
	
	local TacticalButton = nil
	
	TacticalButton = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f10_local1
	} )
	TacticalButton.id = "TacticalButton"
	TacticalButton.buttonDescription = Engine.Localize( "PRESTIGE_CATEGORY_TACTICAL_DESC" )
	TacticalButton.Text:setText( ToUpperCase( Engine.Localize( "MENU_SPECIAL_EQUIPMENT_CAPS" ) ), 0 )
	TacticalButton:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, _1080p * 160, _1080p * 190 )
	self:addElement( TacticalButton )
	self.TacticalButton = TacticalButton
	
	local PerksButton = nil
	
	PerksButton = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f10_local1
	} )
	PerksButton.id = "PerksButton"
	PerksButton.buttonDescription = Engine.Localize( "PRESTIGE_CATEGORY_PERKS_DESC" )
	PerksButton.Text:setText( ToUpperCase( Engine.Localize( "MENU_PERKS_CAPS" ) ), 0 )
	PerksButton:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, _1080p * 200, _1080p * 230 )
	self:addElement( PerksButton )
	self.PerksButton = PerksButton
	
	local ScorestreaksButton = nil
	
	ScorestreaksButton = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f10_local1
	} )
	ScorestreaksButton.id = "ScorestreaksButton"
	ScorestreaksButton.buttonDescription = Engine.Localize( "PRESTIGE_CATEGORY_SCORESTREAKS_DESC" )
	ScorestreaksButton.Text:setText( ToUpperCase( Engine.Localize( "LUA_MENU_SCORESTREAKS" ) ), 0 )
	ScorestreaksButton:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, _1080p * 240, _1080p * 270 )
	self:addElement( ScorestreaksButton )
	self.ScorestreaksButton = ScorestreaksButton
	
	local Pick10ItemsButton = nil
	
	Pick10ItemsButton = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f10_local1
	} )
	Pick10ItemsButton.id = "Pick10ItemsButton"
	Pick10ItemsButton.buttonDescription = Engine.Localize( "PRESTIGE_CATEGORY_PICK10_DESC" )
	Pick10ItemsButton.Text:setText( ToUpperCase( LocalizeString( Engine.Localize( "PRESTIGE_CATEGORY_PICK10" ) ) ), 0 )
	Pick10ItemsButton:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, _1080p * 280, _1080p * 310 )
	self:addElement( Pick10ItemsButton )
	self.Pick10ItemsButton = Pick10ItemsButton
	
	local ButtonDescriptionText = nil
	
	ButtonDescriptionText = MenuBuilder.BuildRegisteredType( "ButtonDescriptionText", {
		controllerIndex = f10_local1
	} )
	ButtonDescriptionText.id = "ButtonDescriptionText"
	ButtonDescriptionText.Description:SetRight( _1080p * 415, 0 )
	ButtonDescriptionText:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 420, _1080p * 320, _1080p * 352 )
	self:addElement( ButtonDescriptionText )
	self.ButtonDescriptionText = ButtonDescriptionText
	
	PostLoadFunc( self, f10_local1, controller )
	return self
end

MenuBuilder.registerType( "PermanentUnlocksButtons", PermanentUnlocksButtons )
LockTable( _M )
