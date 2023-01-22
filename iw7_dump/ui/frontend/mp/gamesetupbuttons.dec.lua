local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0 )
	local f1_local0 = nil
	if MLG.AreMLGRulesEnabled() then
		f1_local0 = "PATCH_MENU_CWL_RULES"
	else
		local f1_local1 = MatchRules.AreMatchRulesDefaultFromFF()
		if f1_local1 then
			f1_local1 = MP.AreNonRecipeOptionsDefault()
		end
		if f1_local1 then
			local f1_local2 = "PATCH_MENU_MATCHRULES_DEFAULT"
		end
		f1_local0 = f1_local2 or "PATCH_MENU_MATCHRULES_CUSTOM"
	end
	f1_arg0.OptionsButton.DynamicText:setText( Engine.Localize( f1_local0 ) )
end

f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2 )
	assert( f2_arg0.ModesButton )
	assert( f2_arg0.ModesButton.DynamicText )
	assert( f2_arg0.MapsButton )
	assert( f2_arg0.MapsButton.DynamicText )
	assert( f2_arg0.OptionsButton )
	assert( f2_arg0.OptionsButton.DynamicText )
	assert( f2_arg0.BotSetup )
	f2_arg0.BotSetup:SetButtonDisabled( MLG.AreMLGRulesEnabled() )
	MatchRules.SetUsingMatchRulesData( 1 )
	if Lobby.IsInPrivateParty() and Lobby.IsPrivatePartyHost() then
		Lobby.StopIntermissionTimer()
	end
	f2_arg0.ModesButton.DynamicText:setText( ToUpperCase( Lobby.GameTypeNameAbbreviated() ) )
	local f2_local0 = Engine.GetDvarString( "ui_saved_mapname" )
	if f2_local0 ~= "" and f2_local0 ~= Engine.GetDvarString( "ui_mapname" ) then
		Engine.SetDvarString( "ui_mapname", f2_local0 )
		Engine.ExecNow( "xupdatepartystate" )
	end
	f2_arg0.MapsButton.DynamicText:setText( ToUpperCase( Lobby.GetMapName() ) )
	f0_local0( f2_arg0 )
end

function GameSetupButtons( menu, controller )
	local self = LUI.UIVerticalList.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 600 * _1080p, 0, 190 * _1080p )
	self.id = "GameSetupButtons"
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	self:SetSpacing( 10 * _1080p )
	local MapsButton = nil
	
	MapsButton = MenuBuilder.BuildRegisteredType( "GenericDualLabelButton", {
		controllerIndex = f3_local1
	} )
	MapsButton.id = "MapsButton"
	MapsButton.buttonDescription = Engine.Localize( "LUA_MENU_DESC_MAP" )
	MapsButton.Text:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MAP_CAPS" ) ), 0 )
	MapsButton.DynamicText:setText( "", 0 )
	MapsButton:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 600, 0, _1080p * 30 )
	self:addElement( MapsButton )
	self.MapsButton = MapsButton
	
	local ModesButton = nil
	
	ModesButton = MenuBuilder.BuildRegisteredType( "GenericDualLabelButton", {
		controllerIndex = f3_local1
	} )
	ModesButton.id = "ModesButton"
	ModesButton.buttonDescription = Engine.Localize( "LUA_MENU_DESC_GAMEMODE" )
	ModesButton.Text:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MODE_CAPS" ) ), 0 )
	ModesButton.DynamicText:setText( "", 0 )
	ModesButton:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 600, _1080p * 40, _1080p * 70 )
	self:addElement( ModesButton )
	self.ModesButton = ModesButton
	
	local OptionsButton = nil
	
	OptionsButton = MenuBuilder.BuildRegisteredType( "GenericDualLabelButton", {
		controllerIndex = f3_local1
	} )
	OptionsButton.id = "OptionsButton"
	OptionsButton.buttonDescription = Engine.Localize( "LUA_MENU_DESC_OPTIONS" )
	OptionsButton.Text:setText( ToUpperCase( Engine.Localize( "MENU_CHANGE_GAME_RULES_CAPS" ) ), 0 )
	OptionsButton.DynamicText:setText( "", 0 )
	OptionsButton:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 600, _1080p * 80, _1080p * 110 )
	self:addElement( OptionsButton )
	self.OptionsButton = OptionsButton
	
	local BotSetup = nil
	
	BotSetup = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f3_local1
	} )
	BotSetup.id = "BotSetup"
	BotSetup.buttonDescription = Engine.Localize( "LUA_MENU_DESC_BOTS" )
	BotSetup.Text:setText( Engine.Localize( "LUA_MENU_BOT_SETUP_CAPS" ), 0 )
	BotSetup:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 600, _1080p * 120, _1080p * 150 )
	self:addElement( BotSetup )
	self.BotSetup = BotSetup
	
	local ButtonDescription = nil
	
	ButtonDescription = MenuBuilder.BuildRegisteredType( "ButtonDescriptionText", {
		controllerIndex = f3_local1
	} )
	ButtonDescription.id = "ButtonDescription"
	ButtonDescription:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 600, _1080p * 160, _1080p * 200 )
	self:addElement( ButtonDescription )
	self.ButtonDescription = ButtonDescription
	
	MapsButton:addEventHandler( "button_action", function ( f4_arg0, f4_arg1 )
		ACTIONS.OpenMenu( "Maps", true, f4_arg1.controller or f3_local1 )
	end )
	ModesButton:addEventHandler( "button_action", function ( f5_arg0, f5_arg1 )
		ACTIONS.OpenMenu( "GameModes", true, f5_arg1.controller or f3_local1 )
	end )
	OptionsButton:addEventHandler( "button_action", function ( f6_arg0, f6_arg1 )
		ACTIONS.OpenMenu( "GameSetupOptionsMenu", true, f6_arg1.controller or f3_local1 )
	end )
	BotSetup:addEventHandler( "button_action", function ( f7_arg0, f7_arg1 )
		ACTIONS.OpenMenu( "GameSetupBots", true, f7_arg1.controller or f3_local1 )
	end )
	f0_local1( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "GameSetupButtons", GameSetupButtons )
LockTable( _M )
