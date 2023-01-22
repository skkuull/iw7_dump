LUI.PostGameManager = LUI.Class( LUI.UIElement )
PostGameState = {
	INACTIVE = 0,
	ACTIVE = 1,
	ROUND_END = 2,
	FINAL_KILLCAM = 3,
	SCOREBOARD = 4,
	GAMEBATTLE_RESULT = 5,
	BROSHOT = 6
}
local f0_local0 = function ( f1_arg0, f1_arg1 )
	local f1_local0 = f1_arg1.controllerIndex
	local f1_local1 = {
		title = Engine.Localize( "MLG_GAMEBATTLES_CAPS" ),
		width = 400
	}
	if MLG.GetGameBattleMatchReportState( f1_local0 ) == GAMEBATTLES.MLG_REPORT_STATE.SEND_ERROR then
		f1_local1.message = Engine.Localize( "MLG_GAMEBATTLES_DATA_ERROR", MLG.GetGameBattleMatchId( f1_local0 ) )
	else
		f1_local1.message = Engine.Localize( "MLG_GAMEBATTLES_DATA_HOST_SENDING", MLG.GetGameBattleMatchId( f1_local0 ) )
	end
	f1_local1.defaultFocusIndex = 0
	f1_local1.cancelClosesPopup = false
	f1_local1.buttonsClosePopup = false
	f1_local1.buttons = {}
	local f1_local2 = MenuBuilder.BuildRegisteredType( "PopupMessageAndButtons", f1_local1 )
	f1_local2.id = "GamebattlesResultPopup"
	return f1_local2
end

LUI.PostGameManager.init = function ( f2_arg0, f2_arg1 )
	LUI.UIElement.init( f2_arg0 )
	assert( f2_arg1 )
	f2_arg0._controllerIndex = f2_arg1
	f2_arg0.id = "PostGameManager"
end

LUI.PostGameManager.ShouldBeVisible = function ( f3_arg0 )
	local f3_local0 = Engine.IsMultiplayer()
	if f3_local0 then
		f3_local0 = Game.IsInitialized()
		if f3_local0 then
			f3_local0 = f3_arg0:IsPostGame()
		end
	end
	return f3_local0
end

LUI.PostGameManager.InitLayer = function ( f4_arg0 )
	f4_arg0.showing = PostGameState.INACTIVE
	f4_arg0:registerOmnvarHandler( "post_game_state", function ( f5_arg0 )
		f5_arg0:Refresh()
	end )
	assert( not f4_arg0._subscriptionToScoreboard )
	f4_arg0._subscriptionToScoreboard = f4_arg0:SubscribeToModel( DataSources.inGame.HUD.isScoreboardOpen:GetModel( f4_arg0._controllerIndex ), function ( f6_arg0 )
		local f6_local0 = DataModel.GetModelValue( f6_arg0 )
		local f6_local1 = f4_arg0
		local f6_local2 = f6_local1
		f6_local1 = f6_local1.SetAlpha
		local f6_local3
		if f6_local0 then
			f6_local3 = 0
			if not f6_local3 then
			
			else
				f6_local1( f6_local2, f6_local3 )
			end
		end
		f6_local3 = 1
	end )
	f4_arg0:Refresh()
	LUI.FlowManager.RequestCloseAllMenus()
end

LUI.PostGameManager.ClearLayer = function ( f7_arg0, f7_arg1 )
	f7_arg0:Refresh()
	f7_arg0:closeChildren()
	f7_arg0:registerOmnvarHandler( "post_game_state", function ()
		
	end )
	if f7_arg0._subscriptionToScoreboard then
		f7_arg0:UnsubscribeFromModel( f7_arg0._subscriptionToScoreboard )
		f7_arg0._subscriptionToScoreboard = nil
	end
	if LUI.PostGameManager.wasInFinalKillcam then
		local f7_local0 = Engine.GetLuiRoot()
		f7_local0.inWorldManager:EndFinalKillcam()
		LUI.PostGameManager.wasInFinalKillcam = false
	end
end

LUI.PostGameManager.IsPostGame = function ( f9_arg0 )
	return Game.GetOmnvar( "post_game_state" ) ~= PostGameState.INACTIVE
end

LUI.PostGameManager.FinalizeCPGame = function ( f10_arg0 )
	if f10_arg0._finalizedCPGame then
		DebugPrint( "CP Game already done" )
		return 
	elseif not Engine.IsAliensMode() or not CONDITIONS.IsAliensOnline( f10_arg0 ) then
		DebugPrint( " Not CP Mode or Not Online" )
		return 
	elseif not Engine.HasClientMatchData() then
		DebugPrint( "No client data" )
		return 
	end
	local f10_local0 = f10_arg0._controllerIndex
	local f10_local1 = DataSources.inGame.CP.zombies.waveNumber:GetValue( f10_local0 )
	local f10_local2 = DataSources.inGame.CP.zombies.timeSurvived:GetValue( f10_local0 )
	DebugPrint( " LUI.PostGameManager.FinalizeCPGame " )
	for f10_local3 = 0, Engine.GetMaxControllerCount() - 1, 1 do
		if Engine.HasActiveLocalClient( f10_local3 ) then
			Rewards.EndZombies( f10_local3, f10_local1, f10_local2 )
			Loot.ConsumeAll( f10_local3 )
			Contracts.RunEndOfMatchLogic( f10_local3 )
		end
	end
	f10_arg0._finalizedCPGame = true
end

LUI.PostGameManager.FinalizeMission = function ( f11_arg0 )
	if f11_arg0._finalizedMission then
		DebugPrint( "Mission already finalized" )
		return 
	elseif Engine.IsAliensMode() or not Engine.GetDvarBool( "onlinegame" ) then
		DebugPrint( " Aliens Mode or Not Online" )
		return 
	elseif not Engine.HasClientMatchData() or not CONDITIONS.IsPublicMatch() then
		DebugPrint( "No client data and Not Public Match" )
		return 
	elseif MissionDirector.GetFlowState() == MissionDirector.FlowState.PRE_INIT then
		DebugPrint( "Mission State is PRE_INIT - " .. MissionDirector.FlowState.PRE_INIT )
		return 
	end
	local f11_local0 = f11_arg0._controllerIndex
	if Engine.GetPlayerDataEx( f11_local0, CoD.StatsGroup.Common, "round", "scoreboardType" ) == "none" then
		DebugPrint( "Scoreboard Type is None" )
		return 
	end
	DebugPrint( "LUI.PostGameManager.FinalizeMission" )
	local f11_local1 = 0
	local f11_local2 = 0
	local f11_local3 = Engine.GetClientMatchData( "scoreboardPlayerCount" )
	local f11_local4 = ""
	if Engine.GetUsernameByController then
		f11_local4 = Engine.GetUsernameByController( f11_local0 )
		DebugPrint( "Searching for user " .. f11_local4 )
	end
	if f11_local3 ~= nil and f11_local3 > 0 then
		for f11_local5 = 1, f11_local3, 1 do
			DebugPrint( "Looking at " .. f11_local5 )
			local f11_local8 = Engine.GetPlayerDataEx( f11_local0, CoD.StatsGroup.Common, "round", "scoreboardType" )
			DebugPrint( "Scoreboard Type " .. f11_local8 )
			local f11_local9 = Engine.GetClientMatchData( "scoreboards", ComputeScoreboardSlot( f11_local8, f11_local5 - 1 ) )
			DebugPrint( "Player " .. f11_local9 )
			if f11_local9 >= 0 then
				local f11_local10 = Engine.GetClientMatchData( "players", f11_local9, "username" )
				DebugPrint( "Found Player " .. f11_local10 )
				if f11_local10 == f11_local4 then
					f11_local1 = Engine.GetPlayerDataEx( f11_local0, CoD.StatsGroup.Common, "round", "timePlayed" )
					DebugPrint( "Timeplayed " .. f11_local1 )
					local f11_local11 = Engine.GetClientMatchData( "players", f11_local9, "team" )
					local f11_local12 = Engine.GetClientMatchData( "axisScore" )
					local f11_local13 = Engine.GetClientMatchData( "alliesScore" )
					if f11_local11 == "axis" then
						if f11_local13 <= f11_local12 then
							DebugPrint( "Axis Win" )
							f11_local2 = 1
							break
						end
					elseif f11_local11 == "allies" and f11_local12 <= f11_local13 then
						DebugPrint( "Allies Win" )
						f11_local2 = 1
						break
					end
				end
			end
		end
	end
	DebugPrint( "Post Game" .. f11_local1 .. " Result " .. f11_local2 )
	for f11_local5 = 0, Engine.GetMaxControllerCount() - 1, 1 do
		if Engine.HasActiveLocalClient( f11_local5 ) then
			Contracts.RunEndOfMatchLogic( f11_local5 )
			MissionDirector.PostGame( f11_local5, f11_local1, f11_local2 )
		end
	end
	DebugPrint( " Setting Mission State to MISSION_OVER - " .. MissionDirector.FlowState.MISSION_OVER )
	MissionDirector.SetFlowState( MissionDirector.FlowState.MISSION_OVER )
	f11_arg0._finalizedMission = true
end

LUI.PostGameManager.Refresh = function ( f12_arg0 )
	local f12_local0 = Game.GetOmnvar( "post_game_state" )
	if f12_local0 ~= f12_arg0.showing then
		f12_arg0:closeChildren()
		if f12_local0 == PostGameState.ROUND_END then
			local f12_local1 = nil
			if Engine.IsCoreMode() then
				if GameX.gameModeIsFFA() then
					f12_local1 = MenuBuilder.BuildRegisteredType( "RoundEndFFAHUD", {
						controllerIndex = f12_arg0._controllerIndex
					} )
				else
					f12_local1 = MenuBuilder.BuildRegisteredType( "RoundEndTeamHUD", {
						controllerIndex = f12_arg0._controllerIndex
					} )
				end
				f12_arg0:addElement( f12_local1 )
			end
		elseif f12_local0 == PostGameState.FINAL_KILLCAM then
			LUI.PostGameManager.wasInFinalKillcam = true
			local f12_local2 = MP.IsRoundEndTitleEndOfMatch( DataSources.inGame.MP.roundEnd.roundEndTitleIndex:GetValue( f12_arg0._controllerIndex ) )
			local f12_local3 = MenuBuilder.BuildRegisteredType( "Killcam", {
				controllerIndex = f12_arg0._controllerIndex,
				isFinal = f12_local2,
				isRoundEnd = not f12_local2
			} )
			local self = LUI.UIElement.new()
			if Engine.IsPC() then
				self:setupLetterboxElement()
			end
			self:addElement( f12_local3 )
			f12_arg0:addElement( self )
			local f12_local5 = Engine.GetLuiRoot()
			f12_local5.inWorldManager:StartFinalKillcam()
		elseif f12_local0 == PostGameState.SCOREBOARD then
			if Engine.IsAliensMode() then
				local f12_local1 = MenuBuilder.BuildRegisteredType( "BroShotZomScreen", {
					controllerIndex = f12_arg0._controllerIndex
				} )
				if not CONDITIONS.IsSplitscreen() then
					local f12_local2 = LUI.UIElement.new()
					f12_local2:setupLetterboxElement()
					f12_local2:addElement( f12_local1 )
					f12_arg0:addElement( f12_local2 )
				else
					f12_arg0:addElement( f12_local1 )
				end
			end
		elseif f12_local0 == PostGameState.GAMEBATTLE_RESULT then
			MenuBuilder.registerType( "GamebattlesResultPopup", f0_local0 )
			LUI.FlowManager.RequestPopupMenu( f12_arg0, "GamebattlesResultPopup", true, f12_arg0._controllerIndex, false )
		elseif f12_local0 == PostGameState.BROSHOT then
			local f12_local1 = LUI.ScoreboardLayer:GetInstance()
			if f12_local1 then
				f12_local1:CloseScoreboard()
			end
			f12_arg0:addElement( MenuBuilder.BuildRegisteredType( "Broshot", {
				controllerIndex = f12_arg0._controllerIndex
			} ) )
		end
		f12_arg0.showing = f12_local0
	end
	f12_arg0:FinalizeCPGame()
	f12_arg0:FinalizeMission()
end

