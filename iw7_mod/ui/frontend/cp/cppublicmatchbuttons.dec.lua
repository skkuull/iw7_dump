local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "frontEnd.cp.CPPublicMatchButtons"
f0_local1 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.Loadout )
	assert( f1_arg0.Barracks )
	f1_arg0.Loadout:addEventHandler( "button_action", function ( f2_arg0, f2_arg1 )
		LUI.FlowManager.RequestAddMenu( "CPLoadoutMenu", true, f2_arg1.controller )
	end )
	f1_arg0.Armory:addEventHandler( "button_action", function ( f3_arg0, f3_arg1 )
		if not Engine.IsUserAGuest( f3_arg1.controller ) then
			ACTIONS.OpenMenu( "Armory", true, f3_arg1.controller )
		end
	end )
	f1_arg0.Barracks:addEventHandler( "button_action", function ( f4_arg0, f4_arg1 )
		LUI.FlowManager.RequestAddMenu( "Headquarters", true, f4_arg1.controller )
	end )
	f1_arg0.ContractsButton:addEventHandler( "button_action", function ( f5_arg0, f5_arg1 )
		ACTIONS.OpenMenu( "ContractMenu", true, f5_arg1.controller or f1_arg1 )
	end )
	f1_arg0.widgetModelPath = f0_local0
end

function CPPublicMatchButtons( menu, controller )
	local self = LUI.UIVerticalNavigator.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 500 * _1080p, 0, 400 * _1080p )
	self.id = "CPPublicMatchButtons"
	local f6_local1 = controller and controller.controllerIndex
	if not f6_local1 and not Engine.InFrontend() then
		f6_local1 = self:getRootController()
	end
	assert( f6_local1 )
	local f6_local2 = self
	local Loadout = nil
	
	Loadout = MenuBuilder.BuildRegisteredType( "MenuButton", {
		controllerIndex = f6_local1
	} )
	Loadout.id = "Loadout"
	Loadout.buttonDescription = Engine.Localize( "LUA_MENU_ZM_LOADOUT_DESC" )
	Loadout.Text:setText( Engine.Localize( "LUA_MENU_ZM_LOADOUT_CAPS" ), 0 )
	Loadout:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 340, 0, _1080p * 30 )
	self:addElement( Loadout )
	self.Loadout = Loadout
	
	local Barracks = nil
	
	Barracks = MenuBuilder.BuildRegisteredType( "MenuButton", {
		controllerIndex = f6_local1
	} )
	Barracks.id = "Barracks"
	Barracks.buttonDescription = Engine.Localize( "LUA_MENU_ZM_BARRACKS_DESC" )
	Barracks.Text:setText( Engine.Localize( "LUA_MENU_BARRACKS_CAPS" ), 0 )
	Barracks:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 340, _1080p * 40, _1080p * 70 )
	self:addElement( Barracks )
	self.Barracks = Barracks
	
	local Tips = nil
	
	Tips = MenuBuilder.BuildRegisteredType( "MenuButton", {
		controllerIndex = f6_local1
	} )
	Tips.id = "Tips"
	Tips.buttonDescription = Engine.Localize( "LUA_MENU_ZOMBIES_TUTORIAL_DESC" )
	Tips.Text:setText( ToUpperCase( Engine.Localize( "LUA_MENU_ZOMBIES_TUTORIAL" ) ), 0 )
	Tips:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 340, _1080p * 80, _1080p * 110 )
	self:addElement( Tips )
	self.Tips = Tips
	
	local Armory = nil
	
	Armory = MenuBuilder.BuildRegisteredType( "MenuButton", {
		controllerIndex = f6_local1
	} )
	Armory.id = "Armory"
	Armory.buttonDescription = Engine.Localize( "LUA_MENU_ZM_SURVIVAL_DEPOT_DESC" )
	Armory.Text:setText( ToUpperCase( Engine.Localize( "LUA_MENU_ZM_SURVIVAL_DEPOT" ) ), 0 )
	Armory:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 340, _1080p * 120, _1080p * 150 )
	self:addElement( Armory )
	self.Armory = Armory
	
	local ForSpacing = nil
	
	ForSpacing = LUI.UIImage.new()
	ForSpacing.id = "ForSpacing"
	ForSpacing:SetAlpha( 0, 0 )
	ForSpacing:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 5, _1080p * 160, _1080p * 165 )
	self:addElement( ForSpacing )
	self.ForSpacing = ForSpacing
	
	local ButtonDescription = nil
	
	ButtonDescription = MenuBuilder.BuildRegisteredType( "ButtonDescriptionText", {
		controllerIndex = f6_local1
	} )
	ButtonDescription.id = "ButtonDescription"
	ButtonDescription:SetRGBFromTable( SWATCHES.genericButton.textDisabled, 0 )
	ButtonDescription.Description:SetRight( _1080p * 415, 0 )
	ButtonDescription:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 504, _1080p * 220, _1080p * 270 )
	self:addElement( ButtonDescription )
	self.ButtonDescription = ButtonDescription
	
	local ContractsButton = nil
	
	ContractsButton = MenuBuilder.BuildRegisteredType( "ContractsButtonCP", {
		controllerIndex = f6_local1
	} )
	ContractsButton.id = "ContractsButton"
	ContractsButton:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 340, _1080p * 160, _1080p * 220 )
	self:addElement( ContractsButton )
	self.ContractsButton = ContractsButton
	
	Tips:addEventHandler( "button_action", function ( f7_arg0, f7_arg1 )
		ACTIONS.OpenMenu( "TutorialMenu", true, f7_arg1.controller or f6_local1 )
	end )
	f0_local1( self, f6_local1, controller )
	return self
end

MenuBuilder.registerType( "CPPublicMatchButtons", CPPublicMatchButtons )
LockTable( _M )
