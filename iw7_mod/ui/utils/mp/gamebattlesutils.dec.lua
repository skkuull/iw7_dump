GAMEBATTLES = GAMEBATTLES or {}
GAMEBATTLES.INVALID_MATCH_ID = "0"
GAMEBATTLES.ScheduleRefreshRequest = false
GAMEBATTLES.MatchForfeitWinningTeamIndex = 0
GAMEBATTLES.MLGPRivacyPolicyURL = "https://accounts.majorleaguegaming.com/privacy_policy"
MLG.ResetGameBattleMatchId = function ( f1_arg0 )
	MLG.SetGameBattleMatchId( GAMEBATTLES.INVALID_MATCH_ID )
end

GAMEBATTLES.MLG_ACCOUNT_STATE = {
	UNAVAILABLE = 0,
	RETRIEVING = 1,
	HAS_ACCOUNT = 2,
	NO_ACCOUNT = 3,
	ACCOUNT_ERROR = 4
}
GAMEBATTLES.MLG_RECIPE_PRESET = {
	RECIPE_DEFAULT = 0,
	RECIPE_CWL = 1,
	RECIPE_GB = 2,
	RECIPE_MAX = 3
}
GAMEBATTLES.MLG_SCHEDULE_STATE = {
	UNAVAILABLE = 0,
	RETRIEVING = 1,
	AVAILABLE = 2,
	RETRIEVAL_ERROR = 3
}
GAMEBATTLES.MLG_CODE_STATE = {
	UNAVAILABLE = 0,
	RETRIEVING = 1,
	AVAILABLE = 2,
	RETRIEVAL_ERROR = 3
}
GAMEBATTLES.MLG_ERR_CODE = {
	CANNOT_CONNECT = 0,
	USER_NOT_REGISTERED = 1,
	FIRST_TIME_ENTRY = 2,
	MATCH_HISTORY_RETRIEVAL_ERROR = 3,
	NO_SOCIAL_PRIVILEGES = 4
}
GAMEBATTLES.MLG_REPORT_STATE = {
	IDLE = 0,
	SENDING = 1,
	DS_SENDING = 2,
	SEND_SUCCESS = 3,
	SEND_ERROR = 4
}
GAMEBATTLES.MLG_GAME_STATUS = {
	UNPLAYED = 0,
	WON_HOME = 1,
	WON_AWAY = 2,
	NO_SHOW = 3
}
GAMEBATTLES.MLG_DS_ACQUISITION_STATE = {
	IDLE = 0,
	FINDING_DATA_CENTER = 1,
	ACQUIRING = 2,
	ACQUIRED = 3,
	COULD_NOT_ACQUIRE = 4,
	ACQUISITION_ERROR = 5
}
GAMEBATTLES.MLG_MATCH_JOIN_STATE = {
	IDLE = 0,
	TRY_CREATE = 1,
	HOST = 2,
	CLIENT = 3,
	JOIN_ERROR = 4,
	CANT_HOST = 5
}
GAMEBATTLES.MLG_MATCH_HISTORY_STATE = {
	UNAVAILABLE = 0,
	RETRIEVING = 1,
	AVAILABLE = 2,
	RETRIEVAL_ERROR = 3
}
GAMEBATTLES.ApplyGameSettings = function ( f2_arg0, f2_arg1 )
	MatchRules.SetData( "gametype", f2_arg0.gametype )
	Engine.SetDvarString( "ui_mapname", f2_arg0.map )
	MLG.LoadGameBattlesRecipe( f2_arg1 )
end

GAMEBATTLES.GetCodcastersCount = function ( f3_arg0 )
	assert( f3_arg0 ~= nil )
	return f3_arg0.totalPlayerCount - f3_arg0.teams[1].playerCount + f3_arg0.teams[2].playerCount
end

GAMEBATTLES.GetNoshowTime = function ()
	local f4_local0 = Engine.GetDvarInt( "gamebattle_noshow_time_override" )
	if f4_local0 ~= nil and f4_local0 ~= 0 then
		return f4_local0
	else
		return 900
	end
end

GAMEBATTLES.GetNoBackOutTime = function ()
	return 30
end

GAMEBATTLES.GetIntermissionTime = function ()
	local f6_local0 = Engine.GetDvarInt( "gamebattle_intermission_time_override" )
	if f6_local0 ~= nil and f6_local0 ~= 0 then
		return f6_local0
	else
		return 300
	end
end

GAMEBATTLES.GetMatchProgressInfo = function ( f7_arg0 )
	local f7_local0 = Engine.GetCurrentTimeDiffWithEpochTime( Engine.AddToEpochTime( f7_arg0.matchTime, GAMEBATTLES.GetNoshowTime() ) ) <= 0
	local f7_local1 = false
	local f7_local2, f7_local3, f7_local4 = GAMEBATTLES.GetMatchVictoryInfo( f7_arg0 )
	if f7_local2 ~= 0 or f7_local3 ~= 0 then
		f7_local0 = true
		local f7_local5 = f7_arg0.gameCount / 2
		if f7_local5 < f7_local2 or f7_local5 < f7_local3 then
			f7_local1 = true
		end
	end
	return f7_local0, f7_local1 or f7_local4
end

GAMEBATTLES.GetMatchVictoryInfo = function ( f8_arg0 )
	local f8_local0 = 0
	local f8_local1 = 0
	local f8_local2 = false
	for f8_local6, f8_local7 in ipairs( f8_arg0.games ) do
		if f8_local7.status == GAMEBATTLES.MLG_GAME_STATUS.WON_HOME then
			f8_local0 = f8_local0 + 1
		end
		if f8_local7.status == GAMEBATTLES.MLG_GAME_STATUS.WON_AWAY then
			f8_local1 = f8_local1 + 1
		end
		if f8_local7.status == GAMEBATTLES.MLG_GAME_STATUS.NO_SHOW then
			f8_local2 = true
		end
	end
	return f8_local0, f8_local1, f8_local2
end

GAMEBATTLES.GetFirstActiveMatch = function ( f9_arg0 )
	local f9_local0 = MLG.GetGameBattleScheduleMatchCount( f9_arg0 )
	for f9_local1 = 0, f9_local0 - 1, 1 do
		local f9_local4 = MLG.GetGameBattleMatch( f9_arg0, f9_local1 )
		local f9_local5, f9_local6 = GAMEBATTLES.GetMatchProgressInfo( f9_local4 )
		if not f9_local6 then
			return f9_local4
		end
	end
	return nil
end

GAMEBATTLES.GetMatchByMatchID = function ( f10_arg0, f10_arg1 )
	local f10_local0 = MLG.GetGameBattleScheduleMatchCount( f10_arg0 )
	for f10_local1 = 0, f10_local0 - 1, 1 do
		local f10_local4 = MLG.GetGameBattleMatch( f10_arg0, f10_local1 )
		if f10_local4.matchId == f10_arg1 then
			return f10_local4
		end
	end
	return nil
end

GAMEBATTLES.GetCurrentMatch = function ( f11_arg0 )
	return MLG.GetGameBattleMatch( f11_arg0, MLG.GetCurrentGameBattleMatchIndex( f11_arg0 ) )
end

GAMEBATTLES.IsCurrentMatchCompleted = function ( f12_arg0 )
	local f12_local0 = GAMEBATTLES.GetCurrentMatch( f12_arg0 )
	if f12_local0 ~= nil then
		local f12_local1, f12_local2 = GAMEBATTLES.GetMatchProgressInfo( f12_local0 )
		return f12_local2
	else
		return false
	end
end

GAMEBATTLES.ShowMatchForfeitPopup = function ( f13_arg0, f13_arg1, f13_arg2 )
	local f13_local0
	if f13_arg2 == 1 then
		f13_local0 = 2
		if not f13_local0 then
		
		else
			LUI.FlowManager.RequestPopupMenu( self, "MLGGamebattlesMatchForfeitPopup", false, f13_arg0, false, {
				currentDateTime = Engine.GetCurrentFormattedDateTime(),
				forfeitTeamName = f13_arg1.teams[f13_local0].teamName,
				forfeitTeamId = f13_arg1.teams[f13_local0].teamId,
				winningTeamName = f13_arg1.teams[f13_arg2].teamName,
				winningTeamId = f13_arg1.teams[f13_arg2].teamId,
				matchID = f13_arg1.matchId
			} )
		end
	end
	f13_local0 = 1
end

GAMEBATTLES.AwardNoShowWin = function ( f14_arg0, f14_arg1, f14_arg2, f14_arg3, f14_arg4, f14_arg5 )
	LUI.FlowManager.RequestPopupMenu( self, "MLGGamebattlesMatchForfeitPopup", false, f14_arg0, false, {
		currentDateTime = Engine.GetCurrentFormattedDateTime(),
		forfeitTeamName = f14_arg1,
		forfeitTeamId = f14_arg2,
		winningTeamName = f14_arg3,
		winningTeamId = f14_arg4,
		matchID = f14_arg5
	} )
end

