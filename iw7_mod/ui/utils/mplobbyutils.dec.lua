Lobby = Lobby or {}
Lobby.MemberListStates = {
	Lobby = 2,
	Teams = 3
}
Lobby.MaxMemberListSlots = 18
Lobby.MemberListRefreshTime = 1000
Lobby.TransitionTime = 750
Lobby.MemberListMemberHeight = 26
Lobby.MemberListSquadMemberHeight = 25
Lobby.PasswordLength = 24
Lobby.DLC1_MAP_PACK_INDEX = 1
Lobby.DLC2_MAP_PACK_INDEX = 2
Lobby.DLC3_MAP_PACK_INDEX = 3
Lobby.DLC4_MAP_PACK_INDEX = 4
Lobby.MatchmakerState = {
	IDLE = 0,
	INITIALIZING = 1,
	SEARCHING = 2,
	QOSING = 3,
	JOINED_LOBBY = 4,
	ERRORING = 5
}
Lobby.PartyState = {
	NONE = 0,
	JOININGLOBBY = 1,
	MERGINGLOBBIES = 2,
	MIGRATINGHOSTS = 3,
	MAKEHOSTACTIVE = 4,
	WAITING_FOR_FASTFILES_STARTED = 5,
	WAITING_FOR_FASTFILES = 6,
	WAITING_FOR_MEMBERS = 7,
	WAITING_FOR_HOST_AWAY = 8,
	WAITING_FOR_HOST = 9,
	WAITING_FOR_MATCH = 10,
	WAITING_FOR_READY = 11,
	WAITING_FOR_OTHER_PLAYERS = 12,
	WAITING_FOR_DEDICATED_SERVER = 13,
	WAITING = 14,
	INTERMISSION = 15,
	HOST_CHANGING_SETTINGS = 16,
	SEARCHING_FOR_OPPONENTS = 17,
	MAKING_TEAMS = 18,
	STARTING_SOON = 19,
	STARTING = 20,
	UNKNOWN = 21
}
Lobby.GetStatusString = function ( f1_arg0 )
	if IsPublicMatch() then
		local f1_local0, f1_local1 = Lobby.GetMatchmakerStatus()
		if f1_local0 == Lobby.MatchmakerState.IDLE then
			return "", false, "idle"
		elseif f1_local0 == Lobby.MatchmakerState.JOINED_LOBBY then
			
		elseif f1_local0 == Lobby.MatchmakerState.QOSING then
			assert( f1_local1.numQoSPlayers )
			return Engine.Localize( "MPUI_MMING_QOSING", f1_local1.numQoSPlayers ), true, "qosing"
		elseif Lobby.IsPrivatePartyHost() then
			if f1_local0 == Lobby.MatchmakerState.INITIALIZING then
				return Engine.Localize( "MPUI_MMING_INITIALIZING" ), true, "initializing"
			elseif f1_local0 == Lobby.MatchmakerState.SEARCHING then
				return Engine.Localize( "MPUI_MMING_SEARCHING" ), true, "searching"
			elseif f1_local0 == Lobby.MatchmakerState.ERRORING then
				return Engine.Localize( "MPUI_MMING_ERRORING" ), true, "erroring"
			end
		end
	end
	local f1_local0, f1_local1 = Lobby.GetPartyStatus()
	if MLG.IsGameBattleMatch() then
		local f1_local2 = GAMEBATTLES.GetCurrentMatch( f1_arg0 )
		if f1_local2 then
			if f1_local0 == Lobby.PartyState.INTERMISSION then
				local f1_local3 = math.ceil( f1_local1.timeRemaining / 1000 )
				local f1_local4, f1_local5 = GAMEBATTLES.GetMatchProgressInfo( f1_local2 )
				if not f1_local5 then
					local f1_local6 = GAMEBATTLES.GetNoshowTime()
					if f1_local4 or f1_local3 < f1_local6 then
						return Engine.Localize( "MLG_GAMEBATTLES_STATUS_NOSHOW", Engine.MarkLocalized( Engine.FormatTimeHoursMinutesSeconds( f1_local3 ) ) ), false, "gamebattle_noshow"
					else
						return Engine.Localize( "MLG_GAMEBATTLES_STATUS_PREMATCH", Engine.MarkLocalized( Engine.FormatTimeHoursMinutesSeconds( f1_local3 - f1_local6 ) ) ), false, "gamebattle_prematch"
					end
				end
			else
				local f1_local3 = LUI.DataSourceInGlobalModel.new( "frontEnd.mlg.matchJoinState" )
				local f1_local4 = f1_local3:GetValue( f1_arg0 )
				if f1_local4 == GAMEBATTLES.MLG_MATCH_JOIN_STATE.IDLE or f1_local4 == GAMEBATTLES.MLG_MATCH_JOIN_STATE.TRY_CREATE then
					return "", false, "gamebattle_not joined"
				end
			end
		end
	end
	if f1_local0 == Lobby.PartyState.INTERMISSION then
		assert( f1_local1.timeRemaining )
		return Engine.Localize( "MENU_INTERMISSION", math.ceil( f1_local1.timeRemaining / 1000 ) ), false, "intermission"
	elseif f1_local0 == Lobby.PartyState.STARTING_SOON then
		return Engine.Localize( "MENU_MATCH_WILL_BEGIN" ), false, "starting_soon"
	elseif f1_local0 == Lobby.PartyState.STARTING then
		assert( f1_local1.timeRemaining )
		if f1_local1.timeRemaining < 0 then
			return Engine.Localize( "MENU_GAME_BEGINNING" ), false, "starting_no_time"
		else
			return Engine.Localize( "MENU_MATCH_BEGINNING_IN", math.ceil( f1_local1.timeRemaining / 1000 ) ), false, "starting"
		end
	elseif f1_local0 == Lobby.PartyState.WAITING_FOR_FASTFILES_STARTED then
		return Engine.Localize( "MENU_WAITING_FOR_FASTFILES_STARTED" ), true, "ff_started"
	elseif f1_local0 == Lobby.PartyState.WAITING_FOR_FASTFILES then
		return Engine.Localize( "MENU_WAITING_FOR_FASTFILES" ), true, "ff"
	elseif f1_local0 == Lobby.PartyState.WAITING_FOR_HOST then
		return Engine.Localize( "MENU_WAITING_FOR_HOST" ), false, "waiting_for_host"
	elseif f1_local0 == Lobby.PartyState.WAITING_FOR_READY then
		return Engine.Localize( "LUA_MENU_STATUS_NEED_TO_READY_UP" ), false, "waiting_for_ready"
	elseif f1_local0 == Lobby.PartyState.WAITING_FOR_OTHER_PLAYERS then
		return Engine.Localize( "LUA_MENU_STATUS_WAITING_FOR_OTHER_PLAYERS" ), false, "waiting_for_other_players"
	elseif f1_local0 == Lobby.PartyState.WAITING_FOR_DEDICATED_SERVER then
		return Engine.Localize( "MP_FRONTEND_ONLY_WAITING_FOR_DEDICATED_SERVER" ), true, "waiting_for_dedicated_server"
	elseif IsPublicMatch() then
		local f1_local2 = Engine.GetDvarInt( "party_minplayers" )
		local f1_local3 = Lobby.GetNumLobbyMembers()
		if f1_local3 < f1_local2 then
			return Engine.Localize( "MENU_WAITING_FOR_MORE_PLAYERS", f1_local2 - f1_local3 ), true, "waiting_for_players"
		end
	end
	if Lobby.IsPrivatePartyHost() then
		return Engine.Localize( "MENU_WAITING" ), false, "waiting"
	end
	return Engine.Localize( "MPUI_MMING_HOST_DOES_IT" ), true, "host_searching"
end

Lobby.Teams = {
	Free = 0,
	Bad = 0,
	Axis = 1,
	Allies = 2
}
Lobby.BotTeams = {
	Friendly = 0,
	Enemy = 1,
	FFA = 2
}
Lobby.BotLimit = 12
Lobby.BotDifficulties = {
	Recruit = 0,
	Regular = 1,
	Hardened = 2,
	Veteran = 3,
	Mixed = 4
}
Lobby.CustomizationTypes = {
	Head = 0,
	Body = 1,
	ViewHands = 2
}
local f0_local0 = Lobby
local f0_local1 = {
	Min = 0,
	Max = 2
}
local f0_local2 = {
	[0] = "PATCH_MENU_OPEN"
}
local f0_local3 = "PATCH_MENU_FRIENDS_ONLY"
local f0_local4 = "PATCH_MENU_CLOSED"
f0_local2[1] = f0_local3
f0_local2[2] = f0_local4
f0_local1.Texts = f0_local2
f0_local0.PrivacySettings = f0_local1
Lobby.gameModeCategories = {
	STANDARD = "Standard",
	ALTERNATE = "Alternate",
	CWL = "Cwl"
}
MapVoting = {
	MapA = {
		refNum = 0,
		voteIndex = 1
	},
	MapB = {
		refNum = 1,
		voteIndex = 2
	},
	MapC = {
		refNum = 2,
		voteIndex = 3
	}
}
Lobby.IsNotAloneInPrivateParty = function ()
	return Lobby.IsInPrivateParty() and not Lobby.IsAloneInPrivateParty()
end

Lobby.LeavePublicLobby = function ()
	local f3_local0 = IsOurPrivatePartyHostInLobby()
	Engine.ExecNow( "xstopparty Lobby.LeavePublicLobby" )
	if f3_local0 then
		Engine.ExecNow( "xstopprivateparty" )
		Engine.ExecNow( "xstartprivateparty" )
	end
end

Lobby.LeaveCustomGameLobby = function ()
	local f4_local0 = IsOurPrivatePartyHostInLobby()
	Engine.ExecNow( "xstoplobbybackout Lobby.LeaveCustomGameLobby" )
	if f4_local0 then
		Engine.ExecNow( "xstopprivateparty" )
		Engine.ExecNow( "xstartprivateparty" )
	end
	Engine.SetDvarBool( "xblive_privatematch", false )
end

Lobby.LeaveCommonMPMainMenu = function ( f5_arg0, f5_arg1 )
	assert( f5_arg0 )
	assert( f5_arg1 )
	Engine.ExecNow( "xstopprivateparty 0", f5_arg1 )
	Engine.SetDvarBool( "onlinegame", false )
	Engine.SetDvarBool( "splitscreen", false )
	LUI.FlowManager.RequestLeaveMenu( f5_arg0, true )
end

Lobby.SetupSystemLinkLobbyScene = function ( f6_arg0 )
	local f6_local0 = DataSources.alwaysLoaded.playerData.MP.privateloadouts.squadMembers.archetype:GetValue( f6_arg0 )
	local f6_local1 = DataSources.alwaysLoaded.playerData.MP.privateloadouts.squadMembers.archetypeSuper:GetValue( f6_arg0 )
	local f6_local2 = DataSources.alwaysLoaded.playerData.MP.privateloadouts.squadMembers.head:GetValue( f6_arg0 )
	local f6_local3 = DataSources.alwaysLoaded.playerData.MP.privateloadouts.squadMembers.body:GetValue( f6_arg0 )
	FrontEndScene.SetScene( "private_lobby" )
	ClientCharacter.SetCharacterVisible( FrontEndScene.ClientCharacters.Self, true )
	FrontEndScene.SetCharacterModelsByIndex( FrontEndScene.ClientCharacters.Self, f6_local3, f6_local2 )
	ClientWeapon.SetWeaponIsViewModel( FrontEndScene.ClientCharacters.Self, true )
	ClientWeapon.SetWeaponVisible( FrontEndScene.ClientCharacters.Self, false )
	FrontEndScene.PlayIdleForSuper( FrontEndScene.ClientCharacters.Self, f6_local1, f6_local0 )
	FrontEndScene.SetWeaponForSuper( FrontEndScene.ClientCharacters.Self, f6_local1, f6_local0 )
	FrontEndScene.HideWeaponModels()
end

Lobby.SetupPrivateMatchLobbyScene = function ( f7_arg0 )
	FrontEndScene.CurrentMissionTeam = MissionDirector.InvalidTeamID
	FrontEndScene.SetScene( "private_lobby" )
	ClientCharacter.SetCharacterVisible( FrontEndScene.ClientCharacters.Self, true )
	FrontEndScene.HideWeaponModels()
	local f7_local0 = DataSources.alwaysLoaded.playerData.MP.privateloadouts.squadMembers
	local f7_local1 = f7_local0.archetype:GetValue( f7_arg0 )
	local f7_local2 = f7_local0.archetypeSuper:GetValue( f7_arg0 )
	FrontEndScene.SetCharacterModelsByIndex( FrontEndScene.ClientCharacters.Self, f7_local0.body:GetValue( f7_arg0 ), f7_local0.head:GetValue( f7_arg0 ) )
	FrontEndScene.PlayIdleForSuper( FrontEndScene.ClientCharacters.Self, f7_local2, f7_local1 )
	FrontEndScene.SetWeaponForSuper( FrontEndScene.ClientCharacters.Self, f7_local2, f7_local1 )
end

Lobby.SetupGameBattlesMatchLobbyScene = function ( f8_arg0 )
	FrontEndScene.CurrentMissionTeam = MissionDirector.InvalidTeamID
	FrontEndScene.SetScene( "private_lobby" )
	ClientCharacter.SetCharacterVisible( FrontEndScene.ClientCharacters.Self, true )
	FrontEndScene.HideWeaponModels()
	local f8_local0 = DataSources.alwaysLoaded.playerData.MP.privateloadouts.squadMembers
	local f8_local1 = f8_local0.archetype:GetValue( f8_arg0 )
	local f8_local2 = f8_local0.archetypeSuper:GetValue( f8_arg0 )
	FrontEndScene.SetCharacterModelsByIndex( FrontEndScene.ClientCharacters.Self, f8_local0.body:GetValue( f8_arg0 ), f8_local0.head:GetValue( f8_arg0 ) )
	FrontEndScene.PlayIdleForSuper( FrontEndScene.ClientCharacters.Self, f8_local2, f8_local1 )
	FrontEndScene.SetWeaponForSuper( FrontEndScene.ClientCharacters.Self, f8_local2, f8_local1 )
end

Lobby.StartCWLDraft = function ( f9_arg0 )
	local f9_local0 = Engine.IsDraftTeamCompositionValid()
	if Lobby.IsAnyDraftMemberSplitscreen() then
		LUI.FlowManager.RequestPopupMenu( nil, "CWLSplitscreenPlayersPopup", true, f9_arg0, false, false )
	elseif Lobby.IsAnyDraftMemberAutoAssign() then
		LUI.FlowManager.RequestPopupMenu( nil, "CWLNoTeamPlayersPopup", true, f9_arg0, false, false )
	elseif f9_local0 then
		LoadoutDrafting.SetEnabled( true )
		LUI.FlowManager.RequestAddMenu( "RigDraftMenu", true, f9_arg0, nil, nil, true )
	else
		LUI.FlowManager.RequestPopupMenu( nil, "CWLInvalidTeamsPopup", true, f9_arg0, false, false )
	end
end

function CheckTURequirement( f10_arg0, f10_arg1 )
	if Engine.IsTURequired() then
		LUI.FlowManager.RequestPopupMenu( f10_arg0, "TURequiredWarning", false, f10_arg1, false )
	end
end

function clearMatchData()
	Engine.ClearMatchData()
end

function AreWePrivatePartyHost()
	return Lobby.IsInPrivateParty() and Lobby.IsPrivatePartyHost()
end

function IsOurPrivatePartyHostInLobby()
	local f13_local0 = Lobby.IsInPrivateParty()
	local f13_local1 = Lobby.IsPrivatePartyHost()
	local f13_local2 = Lobby.IsPrivatePartyHostInLobby()
	local f13_local3 = f13_local0
	local f13_local4
	if not f13_local1 then
		f13_local4 = f13_local2
	else
		f13_local4 = false
	end
	return f13_local4
end

function IsOfflineMatch()
	return Engine.GetDvarBool( "onlinegame" ) == false
end

function IsVotingFinished()
	local f15_local0 = Lobby.HasVotePassed()
	local f15_local1 = Engine.GetDvarBool( "party_teamsVisible" )
	if f15_local1 then
		f15_local1 = Engine.GetDvarBool( "party_teamBased" )
	end
	local f15_local2
	if Lobby.GetVoteMapName( MapVoting.MapA.refNum ) == Lobby.GetVoteMapName( MapVoting.MapB.refNum ) ~= Lobby.GetVoteMapName( MapVoting.MapC.refNum ) or Lobby.GetVoteMapGametype( MapVoting.MapA.refNum ) == Lobby.GetVoteMapGametype( MapVoting.MapB.refNum ) ~= Lobby.GetVoteMapGametype( MapVoting.MapC.refNum ) then
		f15_local2 = false
	else
		f15_local2 = true
	end
	return f15_local1 or f15_local0 or f15_local2
end

function VoteForMap( f16_arg0, f16_arg1, f16_arg2 )
	local f16_local0 = assert
	local f16_local1
	if f16_arg2 ~= MapVoting.MapA.voteIndex and f16_arg2 ~= MapVoting.MapB.voteIndex and f16_arg2 ~= MapVoting.MapC.voteIndex then
		f16_local1 = false
	else
		f16_local1 = true
	end
	f16_local0( f16_local1 )
	if Engine.GetMilliseconds then
		f16_local0 = LUI.FlowManager.GetScopedData( f16_arg0 )
		if f16_local0.voteDelayEndTime and f16_local0.voteDelayEndTime > Engine.GetMilliseconds() then
			f16_arg0:dispatchEventToRoot( {
				name = "set_button_info_text",
				text = Engine.Localize( "@PATCH_MENU_WAIT_TO_VOTE", f16_local0.voteCount or 1 )
			} )
			return 
		elseif not f16_local0.voteCount then
			f16_local0.voteCount = 1
		elseif f16_local0.voteCount < 6 then
			f16_local0.voteCount = f16_local0.voteCount + 1
		end
		f16_local0.voteDelayEndTime = Engine.GetMilliseconds() + 1000 * f16_local0.voteCount
	end
	Engine.Exec( "xpartyvote " .. f16_arg2, f16_arg1 )
end

function OpenAfterActionReport( f17_arg0, f17_arg1, f17_arg2 )
	if Engine.IsUserAGuest( f17_arg0 ) then
		f17_arg1 = true
	end
	LUI.FlowManager.RequestAddMenu( "AARMain", true, f17_arg0, false, {
		controller = f17_arg0,
		onlyLeaderboard = f17_arg1,
		fromMatch = f17_arg2
	} )
end

function GetMaxBotLimit()
	local f18_local0 = Lobby.BotLimit
	if Engine.GetDvarBool( "onlinegame" ) == false and Engine.GetDvarBool( "splitscreen" ) == true then
		f18_local0 = f18_local0 - Engine.SplitscreenPlayerCount()
	end
	if Engine.GetDvarBool( "xblive_privatematch" ) == true or Engine.GetDvarBool( "systemlink" ) == true then
		f18_local0 = math.max( math.min( Lobby.BotLimit, Engine.GetDvarInt( "party_maxplayers" ) ) - Lobby.GetMemberCount( Lobby.MemberListStates.Lobby ), 0 )
	end
	return f18_local0
end

function ClearAllBots()
	Lobby.SetBotsTeamLimit( Lobby.BotTeams.Friendly, 0 )
	Lobby.SetBotsTeamLimit( Lobby.BotTeams.Enemy, 0 )
	Lobby.SetBotsTeamLimit( Lobby.BotTeams.FFA, 0 )
end

function FixTeamLimitsAndDifficultiesIfNecessary( f20_arg0, f20_arg1 )
	local f20_local0 = tonumber( Engine.TableLookup( GameTypesTable.File, GameTypesTable.Cols.Ref, f20_arg0, GameTypesTable.Cols.TeamChoice ) )
	local f20_local1 = tonumber( Engine.TableLookup( GameTypesTable.File, GameTypesTable.Cols.Ref, f20_arg1, GameTypesTable.Cols.TeamChoice ) )
	if f20_local0 == 1 and f20_local1 == 0 then
		if Lobby.SetBotsTeamLimit and Lobby.GetBotsTeamLimit then
			local f20_local2 = Lobby.GetBotsTeamLimit( Lobby.BotTeams.Friendly )
			local f20_local3 = Lobby.GetBotsTeamLimit( Lobby.BotTeams.Enemy )
			if f20_local2 + f20_local3 > GetMaxBotLimit() then
				Lobby.SetBotsTeamLimit( Lobby.BotTeams.Friendly, 0 )
				Lobby.SetBotsTeamLimit( Lobby.BotTeams.Enemy, 0 )
				Lobby.SetBotsTeamLimit( Lobby.BotTeams.FFA, GetMaxBotLimit() )
			else
				Lobby.SetBotsTeamLimit( Lobby.BotTeams.Friendly, 0 )
				Lobby.SetBotsTeamLimit( Lobby.BotTeams.Enemy, 0 )
				Lobby.SetBotsTeamLimit( Lobby.BotTeams.FFA, f20_local2 + f20_local3 )
			end
		end
		if Lobby.SetBotsDifficulty and Lobby.GetBotsDifficulty then
			Lobby.SetBotsDifficulty( Lobby.BotTeams.FFA, Lobby.GetBotsDifficulty( Lobby.BotTeams.Enemy ) )
		end
	end
	if f20_local0 == 0 and f20_local1 == 1 then
		if Lobby.SetBotsTeamLimit and Lobby.GetBotsTeamLimit then
			local f20_local2 = GetMaxBotLimit()
			local f20_local3 = Lobby.GetBotsTeamLimit( Lobby.BotTeams.FFA )
			if f20_local2 < f20_local3 then
				f20_local3 = f20_local2
			end
			Lobby.SetBotsTeamLimit( Lobby.BotTeams.FFA, 0 )
			local f20_local4 = math.floor( f20_local3 / 2 )
			Lobby.SetBotsTeamLimit( Lobby.BotTeams.Friendly, f20_local4 )
			if f20_local3 % 2 == 1 then
				Lobby.SetBotsTeamLimit( Lobby.BotTeams.Enemy, f20_local4 + 1 )
			else
				Lobby.SetBotsTeamLimit( Lobby.BotTeams.Enemy, f20_local4 )
			end
		end
		if Lobby.SetBotsDifficulty and Lobby.GetBotsDifficulty then
			local f20_local2 = Lobby.GetBotsDifficulty( Lobby.BotTeams.FFA )
			Lobby.SetBotsDifficulty( Lobby.BotTeams.Friendly, f20_local2 )
			Lobby.SetBotsDifficulty( Lobby.BotTeams.Enemy, f20_local2 )
		end
	end
end

function SetIsAliensSolo( f21_arg0 )
	if f21_arg0 then
		Engine.SetDvarBool( "xblive_privatematch_solo", true )
	else
		Engine.SetDvarBool( "xblive_privatematch_solo", false )
	end
end

function GetGameTypeIcon( f22_arg0 )
	return Engine.TableLookup( GameTypesTable.File, GameTypesTable.Cols.Ref, f22_arg0, GameTypesTable.Cols.Image )
end

function GetCurrentGameType()
	local f23_local0 = Engine.GetDvarString( "ui_gametype" )
	if MatchRules.IsUsingMatchRulesData() then
		f23_local0 = MatchRules.GetData( "gametype" )
	end
	return f23_local0
end

function IsCurrentGameTypeteamBased()
	local f24_local0 = GetCurrentGameType()
	local f24_local1
	if f24_local0 == "dm" or f24_local0 == "mugger" or f24_local0 == "sotf_ffa" or f24_local0 == "gun" then
		f24_local1 = false
	else
		f24_local1 = true
	end
	return f24_local1
end

function RefreshMLGRules( f25_arg0, f25_arg1 )
	local f25_local0 = MatchRules.GetData( "cwlRulesEnabled" )
	if f25_local0 ~= nil and f25_local0 then
		MLG.SetUsingMLGRules( true )
	end
end

function OpenPrivateMatchLobby( f26_arg0 )
	Engine.ExecNow( MPConfig.default_xboxlive, f26_arg0.controller )
	Engine.ExecNow( "xblive_privatematch 1" )
	LUI.FlowManager.RequestAddMenu( "PrivateMatchLobby", false, f26_arg0.controller, false, {} )
end

function OpenGameBattlesLobby( f27_arg0 )
	Engine.ExecNow( MPConfig.default_xboxlive, f27_arg0 )
	LUI.FlowManager.RequestAddMenu( "GameBattlesLobby", false, f27_arg0, false, {} )
end

function GetLobbyMemberDataSourceAtIndex( f28_arg0 )
	local f28_local0 = function ( f29_arg0 )
		return Engine.TableLookupByRow( CSV.zombieConsumableItems.File, f29_arg0, CSV.zombieConsumableItems.Cols.Icon )
	end
	
	return function ( f30_arg0, f30_arg1, f30_arg2 )
		local f30_local0 = LUI.DataSourceInGlobalModel.new( f28_arg0 .. "." .. f30_arg1 .. ".rank" )
		local f30_local1 = LUI.DataSourceInGlobalModel.new( f28_arg0 .. "." .. f30_arg1 .. ".prestige" )
		local f30_local2 = LUI.AggregateDataSource.new( f30_local0, {
			f30_local0,
			f30_local1
		}, "rankIcon", Rank.MakeRankIconAggregateFunction( f30_local0, f30_local1 ) )
		local f30_local3 = LUI.AggregateDataSource.new( f30_local0, {
			f30_local0,
			f30_local1
		}, "display", Rank.MakeRankDisplayAggregateFunction( f30_local0, f30_local1, true ) )
		local f30_local4 = f30_local1:Filter( "isMasterPrestige", Rank.IsMasterPrestige )
		local f30_local5 = LUI.DataSourceInGlobalModel.new( f28_arg0 .. "." .. f30_arg1 .. ".microphoneState" )
		local f30_local6 = LUI.DataSourceInGlobalModel.new( f28_arg0 .. "." .. f30_arg1 .. ".clanTag" )
		local f30_local7 = LUI.DataSourceInGlobalModel.new( f28_arg0 .. "." .. f30_arg1 .. ".gamertag" )
		local f30_local8 = LUI.AggregateDataSource.new( f30_local6, {
			f30_local6,
			f30_local7
		}, "fullName", function ( f31_arg0 )
			return f30_local6:GetValue( f31_arg0 ) .. " " .. f30_local7:GetValue( f31_arg0 )
		end )
		local f30_local9 = LUI.DataSourceInGlobalModel.new( f28_arg0 .. "." .. f30_arg1 .. ".customEmblemEquipped" )
		local f30_local10 = LUI.DataSourceInGlobalModel.new( f28_arg0 .. "." .. f30_arg1 .. ".emblemIndex" )
		local f30_local11 = LUI.FilteredDataSource.new( f30_local10, "emblem", function ( f32_arg0, f32_arg1 )
			return Engine.TableLookup( PatchesTable.File, PatchesTable.Cols.Ref, f32_arg0, PatchesTable.Cols.Image )
		end )
		local f30_local12 = LUI.DataSourceInGlobalModel.new( f28_arg0 .. "." .. f30_arg1 .. ".backgroundIndex" )
		local f30_local13 = nil
		if Engine.IsAliensMode() then
			local f30_local14 = LUI.DataSourceInGlobalModel.new( f28_arg0 .. "." .. f30_arg1 .. ".zombiesConsumables.slot0Index" )
			local f30_local15 = LUI.DataSourceInGlobalModel.new( f28_arg0 .. "." .. f30_arg1 .. ".zombiesConsumables.slot1Index" )
			local f30_local16 = LUI.DataSourceInGlobalModel.new( f28_arg0 .. "." .. f30_arg1 .. ".zombiesConsumables.slot2Index" )
			local f30_local17 = LUI.DataSourceInGlobalModel.new( f28_arg0 .. "." .. f30_arg1 .. ".zombiesConsumables.slot3Index" )
			local f30_local18 = LUI.DataSourceInGlobalModel.new( f28_arg0 .. "." .. f30_arg1 .. ".zombiesConsumables.slot4Index" )
			f30_local13 = {
				cardSlot1Icon = f30_local14:Filter( "cardSlot1Icon", f28_local0 ),
				cardSlot2Icon = f30_local15:Filter( "cardSlot2Icon", f28_local0 ),
				cardSlot3Icon = f30_local16:Filter( "cardSlot3Icon", f28_local0 ),
				cardSlot4Icon = f30_local17:Filter( "cardSlot4Icon", f28_local0 ),
				cardSlot5Icon = f30_local18:Filter( "cardSlot5Icon", f28_local0 )
			}
		end
		return {
			memberIndex = LUI.DataSourceInGlobalModel.new( f28_arg0 .. "." .. f30_arg1 .. ".memberIndex" ),
			controllerIndex = LUI.DataSourceInGlobalModel.new( f28_arg0 .. "." .. f30_arg1 .. ".controllerIndex" ),
			xuid = LUI.DataSourceInGlobalModel.new( f28_arg0 .. "." .. f30_arg1 .. ".xuid" ),
			isVisible = LUI.DataSourceInGlobalModel.new( f28_arg0 .. "." .. f30_arg1 .. ".isVisible" ),
			team = LUI.DataSourceInGlobalModel.new( f28_arg0 .. "." .. f30_arg1 .. ".team" ),
			body = LUI.DataSourceInGlobalModel.new( f28_arg0 .. "." .. f30_arg1 .. ".body" ),
			head = LUI.DataSourceInGlobalModel.new( f28_arg0 .. "." .. f30_arg1 .. ".head" ),
			rigIndex = LUI.DataSourceInGlobalModel.new( f28_arg0 .. "." .. f30_arg1 .. ".rigIndex" ),
			rank = f30_local0,
			prestige = f30_local1,
			gamertag = f30_local7,
			missingGamertag = LUI.DataSourceInGlobalModel.new( f28_arg0 .. "." .. f30_arg1 .. ".missingGamertag" ),
			clanTag = f30_local6,
			fullName = f30_local8,
			displayRank = f30_local3,
			rankIcon = f30_local2,
			isMasterPrestige = f30_local4,
			microphoneState = f30_local5,
			microphoneIcon = f30_local5:Filter( "icon", Mic.GetIcon ),
			microphoneAlpha = f30_local5:Filter( "alpha", Mic.GetIconAlpha ),
			subparty = LUI.DataSourceInGlobalModel.new( f28_arg0 .. "." .. f30_arg1 .. ".subparty" ),
			isPrivatePartyHost = LUI.DataSourceInGlobalModel.new( f28_arg0 .. "." .. f30_arg1 .. ".isPrivatePartyHost" ),
			customEmblemEquipped = f30_local9,
			emblemIndex = f30_local10,
			emblem = f30_local11,
			backgroundIndex = f30_local12,
			background = f30_local12:Filter( "background", CallingCardUtils.GetCardTexture ),
			zombiesConsumables = f30_local13,
			commitReady = LUI.DataSourceInGlobalModel.new( f28_arg0 .. "." .. f30_arg1 .. ".commitReady" )
		}
	end
	
end

f0_local0 = function ( f33_arg0, f33_arg1 )
	if Lobby.IsInviteOnly( f33_arg1 ) then
		f33_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_LOBBY_ALLOW_JOIN" ),
			button_ref = "button_alt1",
			side = "left",
			priority = 1000,
			clickable = true
		} )
	else
		f33_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_LOBBY_BLOCK_JOIN" ),
			button_ref = "button_alt1",
			side = "left",
			priority = 1000,
			clickable = true
		} )
	end
end

function CreateToggleJoinableBindButton( menu, controller )
	local self = LUI.UIBindButton.new()
	self.id = "toggleJoinableBindButton"
	self:registerEventHandler( "button_alt1", function ( element, event )
		Lobby.ToggleJoinOnInviteOnly( event.controller )
		f0_local0( menu, event.controller )
		ACTIONS.PlaySoundSetSound( menu, "selectAlt", false )
	end )
	f0_local0( menu, controller )
	menu:addElement( self )
end

Lobby.GetMPMapMaterialStreamer = function ()
	local f36_local0 = {}
	for self = 0, Lobby.GetMapFeederCount() - 1, 1 do
		table.insert( f36_local0, RegisterMaterial( Lobby.GetMapImageByIndex( self ) ) )
	end
	local self = LUI.UIElement.new()
	self.id = "MPMapMaterialStreamer"
	self:SetupImageStreamer( f36_local0 )
	return self
end

Lobby.ShouldDisplayMap = function ( f37_arg0, f37_arg1 )
	if not (Engine.IsAliensMode() == Lobby.GetMapSupportsAliensByIdx( f37_arg0 )) then
		return false
	else
		local f37_local0 = Lobby.GetMapPackForMapIndex( f37_arg0 )
		if Engine.GetDvarBool( "killswitch_dlc1_maps" ) and f37_local0 == Lobby.DLC1_MAP_PACK_INDEX then
			return false
		elseif f37_local0 == Lobby.DLC2_MAP_PACK_INDEX and not Engine.GetDvarBool( "dlc2_maps_enabled" ) then
			return false
		elseif f37_local0 == Lobby.DLC3_MAP_PACK_INDEX and not Engine.GetDvarBool( "dlc3_maps_enabled" ) then
			return false
		elseif f37_local0 == Lobby.DLC4_MAP_PACK_INDEX and not Engine.GetDvarBool( "dlc4_maps_enabled" ) then
			return false
		else
			local f37_local1 = Lobby.GetMapLoadNameByIndex( f37_arg0 )
			if Engine.GetDvarBool( "lui_checkIfLevelInFileSystem" ) and not Engine.IsLevelInFileSystem( f37_local1 ) then
				return false
			elseif IsSystemLink() and not Engine.IsMapPackOwned( f37_local0 ) then
				return false
			elseif f37_local1 == "mp_dome_dusk" or f37_local1 == "mp_permafrost2" or f37_local1 == "mp_carnage2" or f37_local1 == "mp_renaissance2" then
				return false
			elseif f37_local1 == "mp_skyway" then
				return Commerce.HasLaunchItem( f37_arg1, 0 )
			elseif f37_local1 == "mp_turista2" and not Engine.GetDvarBool( "mp_turista2_enabled" ) then
				return false
			else
				return true
			end
		end
	end
end

