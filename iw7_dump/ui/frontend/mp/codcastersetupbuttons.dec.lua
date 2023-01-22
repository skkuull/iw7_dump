local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function CodcasterSetupButtons( menu, controller )
	local self = LUI.UIVerticalList.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 607 * _1080p, 0, 320 * _1080p )
	self.id = "CodcasterSetupButtons"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	self:SetSpacing( 10 * _1080p )
	local QuickSettingsButton = nil
	
	QuickSettingsButton = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f1_local1
	} )
	QuickSettingsButton.id = "QuickSettingsButton"
	QuickSettingsButton.buttonDescription = Engine.Localize( "CODCASTER_QUICK_SETTINGS_DESC" )
	QuickSettingsButton.Text:setText( ToUpperCase( Engine.Localize( "CODCASTER_QUICK_SETTINGS" ) ), 0 )
	QuickSettingsButton:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 600, 0, _1080p * 30 )
	self:addElement( QuickSettingsButton )
	self.QuickSettingsButton = QuickSettingsButton
	
	local DisplaySettingsButton = nil
	
	DisplaySettingsButton = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f1_local1
	} )
	DisplaySettingsButton.id = "DisplaySettingsButton"
	DisplaySettingsButton.buttonDescription = Engine.Localize( "CODCASTER_DISPLAY_SETTINGS_DESC" )
	DisplaySettingsButton.Text:setText( ToUpperCase( Engine.Localize( "CODCASTER_DISPLAY_SETTINGS" ) ), 0 )
	DisplaySettingsButton:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 600, _1080p * 40, _1080p * 70 )
	self:addElement( DisplaySettingsButton )
	self.DisplaySettingsButton = DisplaySettingsButton
	
	local LoadoutSettingsButton = nil
	
	LoadoutSettingsButton = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f1_local1
	} )
	LoadoutSettingsButton.id = "LoadoutSettingsButton"
	LoadoutSettingsButton.buttonDescription = Engine.Localize( "CODCASTER_LOADOUT_SETTINGS_DESC" )
	LoadoutSettingsButton.Text:setText( ToUpperCase( Engine.Localize( "CODCASTER_LOADOUT_SETTINGS" ) ), 0 )
	LoadoutSettingsButton:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 600, _1080p * 80, _1080p * 110 )
	self:addElement( LoadoutSettingsButton )
	self.LoadoutSettingsButton = LoadoutSettingsButton
	
	local KeyboardButton = nil
	
	KeyboardButton = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f1_local1
	} )
	KeyboardButton.id = "KeyboardButton"
	KeyboardButton.buttonDescription = Engine.Localize( "CODCASTER_KEYBOARD_SHORTCUTS_DESC" )
	KeyboardButton.Text:setText( ToUpperCase( Engine.Localize( "CODCASTER_KEYBOARD_SHORTCUTS" ) ), 0 )
	KeyboardButton:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 600, _1080p * 120, _1080p * 150 )
	self:addElement( KeyboardButton )
	self.KeyboardButton = KeyboardButton
	
	local TeamIdentityArrowButton = nil
	
	TeamIdentityArrowButton = MenuBuilder.BuildRegisteredType( "GenericArrowButton", {
		controllerIndex = f1_local1
	} )
	TeamIdentityArrowButton.id = "TeamIdentityArrowButton"
	TeamIdentityArrowButton.buttonDescription = Engine.Localize( "CODCASTER_TEAM_IDENTITY_DESC" )
	TeamIdentityArrowButton.Title:setText( ToUpperCase( Engine.Localize( "CODCASTER_TEAM_IDENTITY" ) ), 0 )
	TeamIdentityArrowButton.Text:setText( Engine.Localize( "CODCASTER_TEAM_IDENTITY_FACTIONS" ), 0 )
	TeamIdentityArrowButton:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 600, _1080p * 160, _1080p * 190 )
	self:addElement( TeamIdentityArrowButton )
	self.TeamIdentityArrowButton = TeamIdentityArrowButton
	
	local Team1SettingsButton = nil
	
	Team1SettingsButton = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f1_local1
	} )
	Team1SettingsButton.id = "Team1SettingsButton"
	Team1SettingsButton.buttonDescription = Engine.Localize( "CODCASTER_TEAM1_SETTINGS_DESC" )
	Team1SettingsButton.Text:setText( ToUpperCase( Engine.Localize( "CODCASTER_TEAM1_SETTINGS" ) ), 0 )
	Team1SettingsButton:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 600, _1080p * 200, _1080p * 230.01 )
	self:addElement( Team1SettingsButton )
	self.Team1SettingsButton = Team1SettingsButton
	
	local Team2SettingsButton = nil
	
	Team2SettingsButton = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f1_local1
	} )
	Team2SettingsButton.id = "Team2SettingsButton"
	Team2SettingsButton.buttonDescription = Engine.Localize( "CODCASTER_TEAM2_SETTINGS_DESC" )
	Team2SettingsButton.Text:setText( ToUpperCase( Engine.Localize( "CODCASTER_TEAM2_SETTINGS" ) ), 0 )
	Team2SettingsButton:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 600, _1080p * 240.01, _1080p * 270.01 )
	self:addElement( Team2SettingsButton )
	self.Team2SettingsButton = Team2SettingsButton
	
	local TeamSwapButton = nil
	
	TeamSwapButton = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f1_local1
	} )
	TeamSwapButton.id = "TeamSwapButton"
	TeamSwapButton.buttonDescription = Engine.Localize( "CODCASTER_SWAP_TEAMS_DESC" )
	TeamSwapButton.Text:setText( ToUpperCase( Engine.Localize( "CODCASTER_SWAP_TEAMS" ) ), 0 )
	TeamSwapButton:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 600, _1080p * 280.01, _1080p * 310.02 )
	self:addElement( TeamSwapButton )
	self.TeamSwapButton = TeamSwapButton
	
	QuickSettingsButton:addEventHandler( "button_action", function ( f2_arg0, f2_arg1 )
		ACTIONS.OpenMenu( "CodcasterQuickSettingsMenu", true, f2_arg1.controller or f1_local1 )
	end )
	DisplaySettingsButton:addEventHandler( "button_action", function ( f3_arg0, f3_arg1 )
		ACTIONS.OpenMenu( "CodcasterDisplaySettings", true, f3_arg1.controller or f1_local1 )
	end )
	LoadoutSettingsButton:addEventHandler( "button_action", function ( f4_arg0, f4_arg1 )
		ACTIONS.OpenMenu( "CodcasterLoadoutSettings", true, f4_arg1.controller or f1_local1 )
	end )
	KeyboardButton:addEventHandler( "button_action", function ( f5_arg0, f5_arg1 )
		ACTIONS.OpenMenu( "CodcasterKeyboardMenu", true, f5_arg1.controller or f1_local1 )
	end )
	return self
end

MenuBuilder.registerType( "CodcasterSetupButtons", CodcasterSetupButtons )
LockTable( _M )
