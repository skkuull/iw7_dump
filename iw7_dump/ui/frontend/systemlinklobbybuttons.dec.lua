local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "frontEnd.systemLinkLobby.buttons"
f0_local1 = function ( f1_arg0, f1_arg1 )
	if Engine.GetDvarBool( "killswitch_loadout_draft" ) ~= true and MLG.AreMLGRulesEnabled() then
		Lobby.StartCWLDraft( f1_arg1.controller )
	else
		if Lobby.GetBotsConnectType() == 0 then
			Lobby.SetBotsConnectType( 1 )
		end
		local f1_local0 = LUI.FlowManager.GetScopedData( f1_arg0 )
		f1_local0.startingController = f1_arg1.controller
		CharacterScene.FreeCharacterScene()
		local f1_local1 = utils.cp.AliensUtils.LobbyGetIntroVideo()
		if Lobby.AreAllUsersLocal() and f1_local1 and f1_local1 ~= "" and not Engine.GetDvarBool( "scr_boss_battles_enabled" ) then
			utils.cp.AliensUtils.AliensPlayIntroVideo( f1_arg1.controller, f1_local1, {
				name = "start_transition_to_game",
				immediate = true,
				skipCountdown = true
			} )
		else
			f1_arg0:dispatchEventToRoot( {
				name = "start_transition_to_game",
				immediate = true,
				skipCountdown = false
			} )
		end
	end
end

function StartTheGameHandler( f2_arg0, f2_arg1 )
	local f2_local0 = LUI.FlowManager.GetScopedData( f2_arg0 )
	Lobby.StartServer( f2_local0.startingController, f2_arg1.skipCountdown == true )
	LUI.UIRoot.BlockButtonInput( Engine.GetLuiRoot(), false, "MenuTransition" )
end

f0_local2 = function ( f3_arg0, f3_arg1, f3_arg2 )
	assert( f3_arg0.StartMatchButton )
	f3_arg0.StartMatchButton:addEventHandler( "button_action", f0_local1 )
	f3_arg0:addEventHandler( "start_transition_to_game", StartTheGameHandler )
	local f3_local0 = LUI.DataSourceInGlobalModel.new( "frontEnd.lobby.isPrivatePartyHost" )
	local f3_local1 = LUI.DataSourceInGlobalModel.new( "frontEnd.lobby.isGameStartRequested" )
	local f3_local2 = LUI.AggregateDataSource.new( LUI.DataSourceInGlobalModel.new( f0_local0 .. ".disableButton" ), {
		f3_local0,
		f3_local1
	}, "disabled", function ( f4_arg0 )
		local f4_local0 = f3_local0:GetValue( f4_arg0 )
		local f4_local1 = f3_local1:GetValue( f4_arg0 )
		local f4_local2
		if f4_local0 then
			f4_local2 = f4_local1
		else
			f4_local2 = true
		end
		return f4_local2
	end )
	f3_arg0:SubscribeToModel( f3_local2:GetModel( f3_arg1 ), function ()
		f3_arg0.StartMatchButton:SetButtonDisabled( f3_local2:GetValue( f3_arg1 ) )
		if not Engine.IsAliensMode() then
			f3_arg0.GameSetupButton:SetButtonDisabled( f3_local2:GetValue( f3_arg1 ) )
		else
			f3_arg0.ChooseMapButton:SetButtonDisabled( f3_local2:GetValue( f3_arg1 ) )
		end
	end )
	f3_arg0.widgetModelPath = f0_local0
	if CONDITIONS.IsBossBattleOn() and Engine.IsAliensMode() then
		f3_arg0.BossBattle:addEventHandler( "button_action", function ( f6_arg0, f6_arg1 )
			LUI.FlowManager.RequestAddMenu( "CPMapsBoss", true, f6_arg1.controller )
		end )
	end
	if Engine.IsConsoleGame() and not Engine.IsAliensMode() then
		assert( f3_arg0.ClanTagButton )
		f3_arg0.ClanTagButton:addEventHandler( "button_action", function ( f7_arg0, f7_arg1 )
			local f7_local0 = f7_arg1.controller or f3_arg1
			OSK.OpenScreenKeyboard( f7_local0, Engine.Localize( "@LUA_MENU_CUSTOM_CLAN_TAG" ), Engine.GetCustomClanTag( f7_local0 ) or "", 4, true, true, true, function ( f8_arg0, f8_arg1, f8_arg2 )
				if f8_arg1 then
					Engine.SetAndEnableCustomClanTag( f8_arg0, f8_arg1 )
				end
			end )
		end )
	end
end

function SystemLinkLobbyButtons( menu, controller )
	local self = LUI.UIVerticalList.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 500 * _1080p, 0, 450 * _1080p )
	self.id = "SystemLinkLobbyButtons"
	self._animationSets = {}
	self._sequences = {}
	local f9_local1 = controller and controller.controllerIndex
	if not f9_local1 and not Engine.InFrontend() then
		f9_local1 = self:getRootController()
	end
	assert( f9_local1 )
	local f9_local2 = self
	self:SetSpacing( 10 * _1080p )
	local StartMatchButton = nil
	
	StartMatchButton = MenuBuilder.BuildRegisteredType( "MenuButton", {
		controllerIndex = f9_local1
	} )
	StartMatchButton.id = "StartMatchButton"
	StartMatchButton.buttonDescription = Engine.Localize( "LUA_MENU_DESC_START_MATCH" )
	StartMatchButton.Text:setText( ToUpperCase( Engine.Localize( "MENU_START_MATCH" ) ), 0 )
	StartMatchButton:SetAnchorsAndPosition( 0, 0, 0, 1, 0, _1080p * -50, 0, _1080p * 30 )
	self:addElement( StartMatchButton )
	self.StartMatchButton = StartMatchButton
	
	local f9_local4 = nil
	if CONDITIONS.IsThirdGameMode( self ) then
		f9_local4 = MenuBuilder.BuildRegisteredType( "MenuButton", {
			controllerIndex = f9_local1
		} )
		f9_local4.id = "LoadoutButton"
		if CONDITIONS.IsThirdGameMode( self ) then
			
		else
			
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f9_local4.buttonDescription = Engine.Localize( "LUA_MENU_ZM_LOADOUT_DESC" )
		end
		f9_local4.Text:setText( ToUpperCase( Engine.Localize( "LUA_MENU_ZM_LOADOUT_CAPS" ) ), 0 )
		f9_local4:SetAnchorsAndPosition( 0, 0, 0, 1, 0, _1080p * -50, _1080p * 40, _1080p * 70 )
		self:addElement( f9_local4 )
		self.LoadoutButton = f9_local4
	end
	local f9_local5 = nil
	if CONDITIONS.IsCoreMultiplayer( self ) then
		f9_local5 = MenuBuilder.BuildRegisteredType( "MenuButton", {
			controllerIndex = f9_local1
		} )
		f9_local5.id = "GameSetupButton"
		if CONDITIONS.IsCoreMultiplayer( self ) then
			
		else
			
		end
		if CONDITIONS.IsCoreMultiplayer( self ) then
			f9_local5.buttonDescription = Engine.Localize( "LUA_MENU_DESC_GAME_SETUP" )
		end
		f9_local5.Text:setText( ToUpperCase( Engine.Localize( "LUA_MENU_GAME_SETUP_CAPS" ) ), 0 )
		f9_local5:SetAnchorsAndPosition( 0, 0, 0, 1, 0, _1080p * -50, _1080p * 80, _1080p * 110 )
		self:addElement( f9_local5 )
		self.GameSetupButton = f9_local5
	end
	local f9_local6 = nil
	if CONDITIONS.IsCoreMultiplayer( self ) then
		f9_local6 = MenuBuilder.BuildRegisteredType( "MenuButton", {
			controllerIndex = f9_local1
		} )
		f9_local6.id = "CASButton"
		if CONDITIONS.IsCoreMultiplayer( self ) then
			
		else
			
		end
		if CONDITIONS.IsCoreMultiplayer( self ) then
			f9_local6.buttonDescription = Engine.Localize( "LUA_MENU_DESC_CREATE_A_CLASS" )
		end
		f9_local6.Text:setText( ToUpperCase( Engine.Localize( "LUA_MENU_CREATE_A_CLASS" ) ), 0 )
		f9_local6:SetAnchorsAndPosition( 0, 0, 0, 1, 0, _1080p * -50, _1080p * 120, _1080p * 150 )
		self:addElement( f9_local6 )
		self.CASButton = f9_local6
	end
	local f9_local7 = nil
	if CONDITIONS.IsThirdGameMode( self ) then
		f9_local7 = MenuBuilder.BuildRegisteredType( "MenuButton", {
			controllerIndex = f9_local1
		} )
		f9_local7.id = "ChooseMapButton"
		if CONDITIONS.IsThirdGameMode( self ) then
			
		else
			
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f9_local7.buttonDescription = Engine.Localize( "LUA_MENU_ZM_SELECT_SHOW_DESC" )
		end
		f9_local7.Text:setText( ToUpperCase( Engine.Localize( "LUA_MENU_ZM_SELECT_SHOW_CAPS" ) ), 0 )
		f9_local7:SetAnchorsAndPosition( 0, 0, 0, 1, 0, _1080p * -50, _1080p * 160, _1080p * 190 )
		self:addElement( f9_local7 )
		self.ChooseMapButton = f9_local7
	end
	local f9_local8 = nil
	if CONDITIONS.IsBossBattlOnAndAliensMode( self ) then
		f9_local8 = MenuBuilder.BuildRegisteredType( "MenuButton", {
			controllerIndex = f9_local1
		} )
		f9_local8.id = "BossBattle"
		if CONDITIONS.IsBossBattlOnAndAliensMode( self ) then
			
		else
			
		end
		if CONDITIONS.IsBossBattlOnAndAliensMode( self ) then
			f9_local8.buttonDescription = Engine.Localize( "LUA_MENU_ZM_BOSS_BATTLE_DESC" )
		end
		f9_local8.Text:setText( ToUpperCase( Engine.Localize( "LUA_MENU_ZM_BOSS_BATTLE" ) ), 0 )
		f9_local8:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 340, _1080p * 200, _1080p * 230 )
		self:addElement( f9_local8 )
		self.BossBattle = f9_local8
	end
	local f9_local9 = nil
	if CONDITIONS.IsThirdGameMode( self ) then
		f9_local9 = MenuBuilder.BuildRegisteredType( "MenuButton", {
			controllerIndex = f9_local1
		} )
		f9_local9.id = "TipsAndTricks"
		if CONDITIONS.IsThirdGameMode( self ) then
			
		else
			
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f9_local9.buttonDescription = Engine.Localize( "LUA_MENU_ZOMBIES_TUTORIAL_DESC" )
		end
		f9_local9.Text:setText( ToUpperCase( Engine.Localize( "LUA_MENU_ZOMBIES_TUTORIAL" ) ), 0 )
		f9_local9:SetAnchorsAndPosition( 0, 0, 0, 1, 0, _1080p * -50, _1080p * 240, _1080p * 270 )
		self:addElement( f9_local9 )
		self.TipsAndTricks = f9_local9
	end
	local f9_local10 = nil
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() and CONDITIONS.IsConsoleGame( self ) then
		f9_local10 = MenuBuilder.BuildRegisteredType( "MenuButton", {
			controllerIndex = f9_local1
		} )
		f9_local10.id = "ClanTagButton"
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() and CONDITIONS.IsConsoleGame( self ) then
			
		else
			
		end
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() and CONDITIONS.IsConsoleGame( self ) then
			f9_local10.buttonDescription = Engine.Localize( "LUA_MENU_CUSTOMIZATION_FIELD_DESC_CLAN_TAG" )
		end
		f9_local10.Text:setText( ToUpperCase( Engine.Localize( "MENU_CLAN_TAG_CAPS" ) ), 0 )
		f9_local10:SetAnchorsAndPosition( 0, 0, 0, 1, 0, _1080p * -50, _1080p * 280, _1080p * 310 )
		self:addElement( f9_local10 )
		self.ClanTagButton = f9_local10
	end
	local ButtonDescription = nil
	
	ButtonDescription = MenuBuilder.BuildRegisteredType( "ButtonDescriptionText", {
		controllerIndex = f9_local1
	} )
	ButtonDescription.id = "ButtonDescription"
	ButtonDescription.Description:SetRight( _1080p * 415, 0 )
	ButtonDescription:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 450, _1080p * 320, _1080p * 360 )
	self:addElement( ButtonDescription )
	self.ButtonDescription = ButtonDescription
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		ButtonDescription:RegisterAnimationSequence( "BlackDescText", {
			{
				function ()
					return self.ButtonDescription:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		self._sequences.BlackDescText = function ()
			ButtonDescription:AnimateSequence( "BlackDescText" )
		end
		
		ButtonDescription:RegisterAnimationSequence( "CPDescText", {
			{
				function ()
					return self.ButtonDescription:SetRGBFromTable( SWATCHES.genericButton.textDisabled, 0 )
				end
			}
		} )
		self._sequences.CPDescText = function ()
			ButtonDescription:AnimateSequence( "CPDescText" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	if CONDITIONS.IsThirdGameMode( self ) then
		f9_local4:addEventHandler( "button_action", function ( f16_arg0, f16_arg1 )
			ACTIONS.OpenMenu( "CPLoadoutMenu", true, f16_arg1.controller or f9_local1 )
		end )
	end
	if CONDITIONS.IsCoreMultiplayer( self ) then
		f9_local5:addEventHandler( "button_action", function ( f17_arg0, f17_arg1 )
			ACTIONS.OpenMenu( "GameSetup", true, f17_arg1.controller or f9_local1 )
		end )
	end
	if CONDITIONS.IsCoreMultiplayer( self ) then
		f9_local6:addEventHandler( "button_action", function ( f18_arg0, f18_arg1 )
			local f18_local0 = f18_arg1.controller or f9_local1
			ACTIONS.OpenCreateAClass( self, f18_arg1 )
		end )
	end
	if CONDITIONS.IsThirdGameMode( self ) then
		f9_local7:addEventHandler( "button_action", function ( f19_arg0, f19_arg1 )
			ACTIONS.OpenMenu( "CPMaps", true, f19_arg1.controller or f9_local1 )
		end )
	end
	if CONDITIONS.IsThirdGameMode( self ) then
		f9_local9:addEventHandler( "button_action", function ( f20_arg0, f20_arg1 )
			ACTIONS.OpenMenu( "TutorialMenu", true, f20_arg1.controller or f9_local1 )
		end )
	end
	f0_local2( self, f9_local1, controller )
	if CONDITIONS.IsThirdGameMode( self ) then
		ACTIONS.AnimateSequence( self, "CPDescText" )
	end
	return self
end

MenuBuilder.registerType( "SystemLinkLobbyButtons", SystemLinkLobbyButtons )
LockTable( _M )
