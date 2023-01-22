local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "frontEnd.MP.privateLobby.buttons"
f0_local1 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.GameSetup )
	assert( f1_arg0.StartMatch )
	assert( f1_arg0.StartMatch.Text )
	if Engine.IsConsoleGame() then
		assert( f1_arg0.ClanTag )
	end
	local f1_local0 = LUI.DataSourceInGlobalModel.new( "frontEnd.lobby.areWeGameHost" )
	local f1_local1 = LUI.DataSourceInGlobalModel.new( "frontEnd.lobby.everyoneHasMap" )
	local f1_local2 = LUI.DataSourceInGlobalModel.new( "frontEnd.lobby.isHostWaitingOnMembers" )
	local f1_local3 = LUI.DataSourceInGlobalModel.new( "frontEnd.lobby.partyClientsUpToDate" )
	local f1_local4 = LUI.DataSourceInGlobalModel.new( "frontEnd.lobby.isGameStartRequested" )
	local f1_local5 = LUI.DataSourceInGlobalModel.new( "frontEnd.lobby.UIMapName" )
	f1_arg0.GameSetup:addEventHandler( "button_action", function ( f2_arg0, f2_arg1 )
		LUI.FlowManager.RequestAddMenu( "GameSetup", true, f2_arg1.controller, false, {
			isSoloMode = false
		} )
	end )
	f1_arg0.StartMatch:addEventHandler( "button_action", function ( f3_arg0, f3_arg1 )
		if Engine.GetDvarBool( "killswitch_loadout_draft" ) ~= true and MLG.AreMLGRulesEnabled() then
			Lobby.StartCWLDraft( f3_arg1.controller )
		else
			if Lobby.GetBotsConnectType() == 0 then
				Lobby.SetBotsConnectType( 1 )
			end
			LUI.UIRoot.BlockButtonInput( Engine.GetLuiRoot(), false, "TransitionToGame" )
			Engine.Exec( "xpartygo" )
			if not (Engine.SplitscreenPlayerCount() > 1) then
				CODCASTER.SetCODCastingEnabled( MatchRules.GetData( "commonOption", "codcasterEnabled" ) )
			else
				CODCASTER.SetCODCastingEnabled( false )
			end
		end
	end )
	local f1_local6 = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".disableButton" )
	local f1_local7 = LUI.AggregateDataSource.new( f1_local6, {
		f1_local0,
		f1_local4
	}, "gameSetupDisabled", function ( f4_arg0 )
		local f4_local0 = f1_local0:GetValue( f4_arg0 )
		local f4_local1 = f1_local4:GetValue( f4_arg0 )
		local f4_local2
		if f4_local0 then
			f4_local2 = f4_local1
		else
			f4_local2 = true
		end
		return f4_local2
	end )
	f1_arg0:SubscribeToModel( f1_local7:GetModel( f1_arg1 ), function ()
		f1_arg0.GameSetup:SetButtonDisabled( f1_local7:GetValue( f1_arg1 ) )
	end )
	local f1_local8 = function ( f6_arg0 )
		local f6_local0 = f1_local4:GetValue( f6_arg0 )
		local f6_local1 = f1_local0:GetValue( f6_arg0 )
		if f6_local0 then
			f1_arg0.StartMatch.Text:setText( Engine.Localize( "LUA_MENU_STARTING_GAME_CAPS" ) )
		elseif f6_local1 then
			f1_arg0.StartMatch.Text:setText( Engine.Localize( "LUA_MENU_START_GAME_CAPS" ) )
		else
			f1_arg0.StartMatch.Text:setText( Engine.Localize( "LUA_MENU_WAITING_FOR_HOST_CAPS" ) )
		end
	end
	
	f1_arg0:SubscribeToModel( f1_local0:GetModel( f1_arg1 ), f1_local8 )
	f1_arg0:SubscribeToModel( f1_local4:GetModel( f1_arg1 ), f1_local8 )
	local f1_local9 = LUI.AggregateDataSource.new( f1_local6, {
		f1_local0,
		f1_local1,
		f1_local2,
		f1_local3,
		f1_local4
	}, "startButtonDisabled", function ( f7_arg0 )
		local f7_local0 = f1_local0:GetValue( f7_arg0 )
		local f7_local1 = f1_local1:GetValue( f7_arg0 )
		local f7_local2 = f1_local2:GetValue( f7_arg0 )
		local f7_local3 = f1_local3:GetValue( f7_arg0 )
		local f7_local4 = f1_local4:GetValue( f7_arg0 )
		local f7_local5
		if f7_local0 and f7_local1 then
			local f7_local6 = f7_local2
			if f7_local3 then
				f7_local5 = f7_local4
			end
		end
		f7_local5 = f7_local6 or true
	end )
	f1_arg0:SubscribeToModel( f1_local9:GetModel( f1_arg1 ), function ()
		f1_arg0.StartMatch:SetButtonDisabled( f1_local9:GetValue( f1_arg1 ) )
	end )
	f1_arg0.widgetModelPath = f0_local0
	local f1_local10 = function ()
		local f9_local0 = f1_local9:GetValue( f1_arg1 )
		local f9_local1 = Engine.Localize( "LUA_MENU_DESC_START_MATCH" )
		if f9_local0 and f1_local1:GetValue( f1_arg1 ) == false then
			local f9_local2 = Engine.Localize( "PRESENCE_" .. Engine.GetDvarString( "ui_mapname" ) )
			local f9_local3 = Engine.PartyGetFirstPlayerWithoutMap()
			if f9_local3 ~= "" then
				f9_local1 = Engine.Localize( "DLC_PLAYER_DOESNT_HAVE_MAP_PACK", f9_local3, f9_local2 )
			end
		end
		f1_arg0.StartMatch.buttonDescription = f9_local1
		f1_arg0.ButtonDescription:processEvent( {
			name = "update_button_description",
			text = f9_local1
		} )
	end
	
	f1_arg0:SubscribeToModel( f1_local9:GetModel( f1_arg1 ), f1_local10 )
	f1_arg0:SubscribeToModel( f1_local1:GetModel( f1_arg1 ), f1_local10 )
	f1_arg0:SubscribeToModel( f1_local5:GetModel( f1_arg1 ), f1_local10 )
	local f1_local11 = LUI.DataSourceInGlobalModel.new( "frontEnd.lobby.isCodCastingEnabled" )
	f1_arg0:SubscribeToModel( f1_local11:GetModel( f1_arg1 ), function ()
		local f10_local0 = f1_local11:GetValue( f1_arg1 )
		if f10_local0 then
			f10_local0 = CODCASTER.CanCODCast()
		end
		if f10_local0 then
			CODCASTER.CreateCODCasterSettingsButton( f1_arg0, f1_arg1 )
		else
			CODCASTER.DestroyCODCasterSettingsButton( f1_arg0, f1_arg1 )
		end
	end, true )
	if Engine.IsConsoleGame() then
		local f1_local12 = f1_arg0.ClanTag
		local f1_local13 = f1_local12
		f1_local12 = f1_local12.SetButtonDisabled
		local f1_local14 = Engine.IsXB3()
		if f1_local14 then
			f1_local14 = not Engine.IsUserSignedInToLive( f1_arg1 )
		end
		f1_local12( f1_local13, f1_local14 )
		f1_arg0.ClanTag:addEventHandler( "button_action", function ( f11_arg0, f11_arg1 )
			local f11_local0 = f11_arg1.controller or f1_arg1
			Engine.AntiCheatBanCheck( f11_local0, CoD.AntiCheat.Ban.FEATURE_BAN_GLOBAL_CLAN_TAG )
			OSK.OpenScreenKeyboard( f11_local0, Engine.Localize( "@LUA_MENU_CUSTOM_CLAN_TAG" ), Engine.GetCustomClanTag( f11_local0 ) or "", 4, true, true, true, function ( f12_arg0, f12_arg1, f12_arg2 )
				if f12_arg1 then
					Engine.SetAndEnableCustomClanTag( f12_arg0, f12_arg1 )
				end
			end )
		end )
	end
end

function PrivateMatchLobbyButtons( menu, controller )
	local self = LUI.UIVerticalList.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 600 * _1080p, 0, 725 * _1080p )
	self.id = "PrivateMatchLobbyButtons"
	local f13_local1 = controller and controller.controllerIndex
	if not f13_local1 and not Engine.InFrontend() then
		f13_local1 = self:getRootController()
	end
	assert( f13_local1 )
	local f13_local2 = self
	self:SetSpacing( 10 * _1080p )
	local StartMatch = nil
	
	StartMatch = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f13_local1
	} )
	StartMatch.id = "StartMatch"
	StartMatch.buttonDescription = Engine.Localize( "LUA_MENU_DESC_START_MATCH" )
	StartMatch.Text:setText( Engine.Localize( "LUA_MENU_START_GAME_CAPS" ), 0 )
	StartMatch:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 30 )
	self:addElement( StartMatch )
	self.StartMatch = StartMatch
	
	local GameSetup = nil
	
	GameSetup = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f13_local1
	} )
	GameSetup.id = "GameSetup"
	GameSetup.buttonDescription = Engine.Localize( "LUA_MENU_DESC_GAME_SETUP" )
	GameSetup.Text:setText( Engine.Localize( "LUA_MENU_GAME_SETUP_CAPS" ), 0 )
	GameSetup:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 40, _1080p * 70 )
	self:addElement( GameSetup )
	self.GameSetup = GameSetup
	
	local CreateASoldier = nil
	
	CreateASoldier = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f13_local1
	} )
	CreateASoldier.id = "CreateASoldier"
	CreateASoldier.buttonDescription = Engine.Localize( "LUA_MENU_DESC_CREATE_A_CLASS" )
	CreateASoldier.Text:setText( Engine.Localize( "LUA_MENU_CREATE_A_CLASS_CAPS" ), 0 )
	CreateASoldier:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 80, _1080p * 110 )
	self:addElement( CreateASoldier )
	self.CreateASoldier = CreateASoldier
	
	local f13_local6 = nil
	if Engine.IsConsoleGame() then
		f13_local6 = MenuBuilder.BuildRegisteredType( "GenericButton", {
			controllerIndex = f13_local1
		} )
		f13_local6.id = "ClanTag"
		if Engine.IsConsoleGame() then
			
		else
			
		end
		if Engine.IsConsoleGame() then
			f13_local6.buttonDescription = Engine.Localize( "LUA_MENU_CUSTOMIZATION_FIELD_DESC_CLAN_TAG" )
		end
		f13_local6.Text:setText( Engine.Localize( "LUA_MENU_CUSTOMIZATION_FIELD_CLAN_TAG_CAPS" ), 0 )
		f13_local6:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 120, _1080p * 150 )
		self:addElement( f13_local6 )
		self.ClanTag = f13_local6
	end
	local ButtonDescription = nil
	
	ButtonDescription = MenuBuilder.BuildRegisteredType( "ButtonDescriptionText", {
		controllerIndex = f13_local1
	} )
	ButtonDescription.id = "ButtonDescription"
	ButtonDescription:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 600, _1080p * 160, _1080p * 200 )
	self:addElement( ButtonDescription )
	self.ButtonDescription = ButtonDescription
	
	CreateASoldier:addEventHandler( "button_action", function ( f14_arg0, f14_arg1 )
		local f14_local0 = f14_arg1.controller or f13_local1
		ACTIONS.OpenCreateAClass( self, f14_arg1 )
	end )
	f0_local1( self, f13_local1, controller )
	return self
end

MenuBuilder.registerType( "PrivateMatchLobbyButtons", PrivateMatchLobbyButtons )
LockTable( _M )
