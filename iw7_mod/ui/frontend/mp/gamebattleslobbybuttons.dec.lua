local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = 1
f0_local1 = function ( f1_arg0 )
	local f1_local0 = false
	if f1_arg0.upcomingMatchInfo then
		f1_local0 = f1_arg0.upcomingMatchInfo.Countdown:IsInNoShow()
	end
	local f1_local1 = MLG.GetActiveGameIndex()
	if f1_local1 > 0 or f1_local0 then
		f1_arg0:dispatchEventToRoot( {
			name = "gamebattles_change_countdown_name",
			countdownName = Engine.Localize( "MLG_GAMEBATTLES_COUNTDOWN_GAME_LAUNCH", f1_local1 + 1 )
		} )
	else
		f1_arg0:dispatchEventToRoot( {
			name = "gamebattles_change_countdown_name",
			countdownName = Engine.Localize( "MLG_GAMEBATTLES_COUNTDOWN_GAME_NUMBER", f1_local1 + 1 )
		} )
	end
	f1_arg0.JoinGame.Text:setText( Engine.Localize( "MLG_GAMEBATTLES_GAME_JOINED" ) )
	f1_arg0.CommitReady:SetButtonDisabled( false )
	f1_arg0.JoinGame:SetButtonDisabled( true )
	f1_arg0:dispatchEventToRoot( {
		name = "gamebattles_deactivate_refresh",
		dispatchChildren = true
	} )
end

f0_local2 = function ( f2_arg0, f2_arg1 )
	return function ()
		if MLG.RequestAcquireServer( f2_arg1 ) > 0 then
			f2_arg0.acquireServerTween = f2_arg0:Wait( f0_local0 )
			f2_arg0.acquireServerTween.onComplete = f2_arg0:UpdateAcquireServer( f2_arg1 )
		end
	end
	
end

local f0_local3 = function ( f4_arg0, f4_arg1, f4_arg2 )
	assert( f4_arg0.CommitReady )
	assert( f4_arg0.CommitReady.Text )
	f4_arg0.UpdateAcquireServer = f0_local2
	local f4_local0 = LUI.DataSourceInGlobalModel.new( "frontEnd.mlg.dsAcquisitionState" )
	local f4_local1 = function ()
		local f5_local0 = f4_local0:GetValue( f4_arg1 )
		if f5_local0 == GAMEBATTLES.MLG_DS_ACQUISITION_STATE.COULD_NOT_ACQUIRE or f5_local0 == GAMEBATTLES.MLG_DS_ACQUISITION_STATE.ACQUISITION_ERROR then
			f4_arg0:dispatchEventToRoot( {
				name = "match_cancelled_no_ds",
				dispatchChildren = true
			} )
		end
	end
	
	local f4_local2 = function ( f6_arg0, f6_arg1, f6_arg2 )
		f4_arg0.CommitReady:SetButtonDisabled( true )
		f4_arg0.CommitReady.Text:setText( Engine.Localize( "LUA_MENU_STARTING_GAME_CAPS" ) )
		if Lobby.GetBotsConnectType() == 0 then
			Lobby.SetBotsConnectType( 1 )
		end
		local f6_local0 = LUI.DataSourceInGlobalModel.new( "alwaysLoaded.activeParty.members.teamAlliesCount" )
		local f6_local1 = f6_local0:GetValue( f6_arg1 )
		local f6_local2 = LUI.DataSourceInGlobalModel.new( "alwaysLoaded.activeParty.members.teamAxisCount" )
		local f6_local3 = f6_local2:GetValue( f6_arg1 )
		if f6_local1 == 0 then
			f4_arg0:dispatchEventToRoot( {
				name = "match_forfeit_no_players",
				dispatchChildren = true,
				teamIndex = 1,
				immediate = not Lobby.IsGameHost()
			} )
		elseif f6_local3 == 0 then
			f4_arg0:dispatchEventToRoot( {
				name = "match_forfeit_no_players",
				dispatchChildren = true,
				teamIndex = 2,
				immediate = not Lobby.IsGameHost()
			} )
		elseif f6_arg2 and Engine.GetDvarBool( "gamebattle_allow_ds_acquistion" ) then
			if MLG.RequestAcquireServer( f6_arg1 ) > 0 then
				local f6_local4 = f0_local2( f4_arg0, f6_arg1 )
				f6_local4()
			end
			f4_arg0:SubscribeToModel( f4_local0:GetModel( f6_arg1 ), f4_local1 )
		end
	end
	
	f4_arg0.CommitReady:addEventHandler( "button_action", function ( f7_arg0, f7_arg1 )
		Lobby.SetLocalCommitReady()
		f4_arg0.CommitReady:SetButtonDisabled( true )
		f4_arg0.CommitReady.Text:setText( Engine.Localize( "LUA_MENU_COMMITTED_TO_START_CAPS" ) )
	end )
	local f4_local3 = LUI.DataSourceInGlobalModel.new( "frontEnd.mlg.matchJoinState" )
	local f4_local4 = function ()
		local f8_local0 = f4_local3:GetValue( f4_arg1 )
		if f8_local0 == GAMEBATTLES.MLG_MATCH_JOIN_STATE.IDLE or f8_local0 == GAMEBATTLES.MLG_MATCH_JOIN_STATE.TRY_CREATE or f8_local0 == GAMEBATTLES.MLG_MATCH_JOIN_STATE.CLIENT then
			f4_arg0.JoinGame.Text:setText( Engine.Localize( "MLG_GAMEBATTLES_JOINING_GAME" ) )
		elseif f8_local0 == GAMEBATTLES.MLG_MATCH_JOIN_STATE.HOST then
			f0_local1( f4_arg0 )
			if f4_arg0.upcomingMatchInfo and MLG.GetGameBattleIntermissionTimeLeft() == nil then
				f4_arg0.upcomingMatchInfo.Countdown:StartIntermissionTimer()
			end
		elseif f8_local0 == GAMEBATTLES.MLG_MATCH_JOIN_STATE.JOIN_ERROR then
			f4_arg0.JoinGame.Text:setText( ToUpperCase( Engine.Localize( "LUA_MENU_JOIN_GAME_CAPS" ) ), 0 )
			f4_arg0.JoinGame:SetButtonDisabled( false )
			LUI.FlowManager.RequestPopupMenu( f4_arg0, "MLGGamebattlesCantJoinGamePopup", false, f4_arg1, false, {
				controllerIndex = f4_arg1
			} )
		elseif f8_local0 == GAMEBATTLES.MLG_MATCH_JOIN_STATE.CANT_HOST then
			f4_arg0.JoinGame.Text:setText( ToUpperCase( Engine.Localize( "LUA_MENU_JOIN_GAME_CAPS" ) ), 0 )
			f4_arg0.JoinGame:SetButtonDisabled( false )
			LUI.FlowManager.RequestPopupMenu( f4_arg0, "MLGGamebattlesCantHostGamePopup", false, f4_arg1, false, {
				controllerIndex = f4_arg1
			} )
		end
	end
	
	local f4_local5 = function ()
		f4_arg0.JoinGame:SetButtonDisabled( true )
		MLG.ClearPotentialNoShowWinCache()
		MLG.JoinGameBattleMatchLobby( f4_arg1 )
		f4_arg0:SubscribeToModel( f4_local3:GetModel( f4_arg1 ), f4_local4 )
	end
	
	f4_arg0.JoinGame:addEventHandler( "button_action", function ( f10_arg0, f10_arg1 )
		f4_local5()
	end )
	local f4_local6 = function ()
		if f4_arg0:getParent() == nil then
			return nil
		else
			return LUI.FlowManager.GetScopedData( f4_arg0 )
		end
	end
	
	f4_local6 = f4_local6()
	local f4_local7 = LUI.DataSourceInGlobalModel.new( "frontEnd.lobby.areWeGameHost" )
	local f4_local8 = f4_local7:GetValue( f4_arg1 )
	local f4_local9 = GAMEBATTLES.GetCurrentMatch( f4_arg1 )
	if f4_local9 ~= nil then
		if MLG.GetGameBattleMatchJoinState( f4_arg1 ) == GAMEBATTLES.MLG_MATCH_JOIN_STATE.CLIENT or not MLG.IsGameBattleLeavingChatChannel() then
			local f4_local10, f4_local11 = GAMEBATTLES.GetMatchProgressInfo( f4_local9 )
			local f4_local12 = MLG.GetGameBattleIntermissionTimeLeft()
			if MLG.IsGameBattleMatchJoined( f4_arg1 ) then
				f0_local1( f4_arg0 )
				if Lobby.GetLocalCommitReady() then
					f4_arg0.CommitReady:SetButtonDisabled( true )
				end
			elseif f4_local10 then
				if f4_local6 == nil or not f4_local6.inSubMenu then
					f4_local5()
				end
			elseif f4_local8 and f4_local12 == nil then
				f4_arg0.CommitReady:SetButtonDisabled( true )
			end
		end
	else
		f4_arg0.JoinGame:SetButtonDisabled( true )
		f4_arg0.CommitReady:SetButtonDisabled( true )
		f4_arg0.GameBattlesSchedule:SetButtonDisabled( true )
	end
	f4_arg0.GameBattlesSchedule:addEventHandler( "button_action", function ( f12_arg0, f12_arg1 )
		LUI.FlowManager.RequestAddMenu( "GameBattlesSchedule", true, f12_arg1.controller )
		f4_local6 = LUI.FlowManager.GetScopedData( f4_arg0 )
		f4_local6.inSubMenu = true
	end )
	local f4_local10 = LUI.DataSourceInGlobalModel.new( "frontEnd.lobby.areAllPlayersCommitReady" )
	f4_arg0:SubscribeToModel( f4_local10:GetModel( f4_arg1 ), function ( f13_arg0 )
		if Lobby.GetLocalCommitReady() and f4_local10:GetValue( f4_arg1 ) then
			f4_local2( f4_arg0, f4_arg1, f4_local8 )
		end
	end )
	f4_arg0:registerEventHandler( "no_show_countdown_stop", function ( element, event )
		f4_local2( element, f4_arg1, f4_local8 )
	end )
	f4_arg0.CreateASoldier:addEventHandler( "button_action", function ( f15_arg0, f15_arg1 )
		local f15_local0 = f15_arg1.controller or f4_arg1
		ACTIONS.OpenCreateAClass( f4_arg0, f15_arg1 )
		f4_local6 = LUI.FlowManager.GetScopedData( f4_arg0 )
		f4_local6.inSubMenu = true
	end )
	if f4_local6 ~= nil then
		f4_local6.inSubMenu = false
	end
end

function GameBattlesLobbyButtons( menu, controller )
	local self = LUI.UIVerticalList.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 600 * _1080p, 0, 725 * _1080p )
	self.id = "GameBattlesLobbyButtons"
	local f16_local1 = controller and controller.controllerIndex
	if not f16_local1 and not Engine.InFrontend() then
		f16_local1 = self:getRootController()
	end
	assert( f16_local1 )
	local f16_local2 = self
	self:SetSpacing( 12 * _1080p )
	local JoinGame = nil
	
	JoinGame = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f16_local1
	} )
	JoinGame.id = "JoinGame"
	JoinGame.buttonDescription = Engine.Localize( "LUA_MENU_DESC_JOIN_GAME" )
	JoinGame.Text:setText( ToUpperCase( Engine.Localize( "LUA_MENU_JOIN_GAME_CAPS" ) ), 0 )
	JoinGame:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 30 )
	self:addElement( JoinGame )
	self.JoinGame = JoinGame
	
	local CommitReady = nil
	
	CommitReady = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f16_local1
	} )
	CommitReady.id = "CommitReady"
	CommitReady.buttonDescription = Engine.Localize( "LUA_MENU_DESC_READY_UP" )
	CommitReady.Text:setText( Engine.Localize( "LUA_MENU_COMMIT_TO_START_CAPS" ), 0 )
	CommitReady:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 42, _1080p * 72 )
	self:addElement( CommitReady )
	self.CommitReady = CommitReady
	
	local CreateASoldier = nil
	
	CreateASoldier = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f16_local1
	} )
	CreateASoldier.id = "CreateASoldier"
	CreateASoldier.buttonDescription = Engine.Localize( "LUA_MENU_DESC_CREATE_A_CLASS" )
	CreateASoldier.Text:setText( Engine.Localize( "LUA_MENU_CREATE_A_CLASS_CAPS" ), 0 )
	CreateASoldier:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 84, _1080p * 114 )
	self:addElement( CreateASoldier )
	self.CreateASoldier = CreateASoldier
	
	local GameBattlesSchedule = nil
	
	GameBattlesSchedule = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f16_local1
	} )
	GameBattlesSchedule.id = "GameBattlesSchedule"
	GameBattlesSchedule.buttonDescription = Engine.Localize( "MLG_GAMEBATTLES_SCHEDULE_BUTTON_DESC" )
	GameBattlesSchedule.Text:setText( Engine.Localize( "MENU_GAME_BATTLES_SCHEDULE_BUTTON" ), 0 )
	GameBattlesSchedule:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 126, _1080p * 156 )
	self:addElement( GameBattlesSchedule )
	self.GameBattlesSchedule = GameBattlesSchedule
	
	local ButtonDescription = nil
	
	ButtonDescription = MenuBuilder.BuildRegisteredType( "ButtonDescriptionText", {
		controllerIndex = f16_local1
	} )
	ButtonDescription.id = "ButtonDescription"
	ButtonDescription.Description:SetRight( _1080p * 415, 0 )
	ButtonDescription:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 504, _1080p * 168, _1080p * 205 )
	self:addElement( ButtonDescription )
	self.ButtonDescription = ButtonDescription
	
	f0_local3( self, f16_local1, controller )
	return self
end

MenuBuilder.registerType( "GameBattlesLobbyButtons", GameBattlesLobbyButtons )
LockTable( _M )
