if not GameX then
	GameX = {}
end
GameX.EnergyType = {
	MOVEMENT = 0,
	DODGE = 1
}
GameX.GetPlayerOpposingTeam = function ( f1_arg0 )
	local f1_local0 = f1_arg0
	if not f1_local0 then
		f1_local0 = Game.GetPlayerTeam()
		if GameX.IsSpectatingNotOnTeam( f1_local0 ) then
			f1_local0 = spectatorFakeTeam
		end
	end
	local f1_local1 = otherTeamLookup[f1_local0]
	if not f1_local1 then
		f1_local1 = 0
	end
	return f1_local1
end

GameX.gameModeIsFFA = function ( f2_arg0 )
	local f2_local0 = f2_arg0 or Engine.GetDvarString( "ui_gametype" )
	if f2_local0 == "dm" or f2_local0 == "sotf_ffa" or f2_local0 == "gun" or f2_local0 == "mugger" or f2_local0 == "adrn" or f2_local0 == "assn" or f2_local0 == "fo" or f2_local0 == "sna" then
		return true
	elseif f2_local0 == "cranked" or f2_local0 == "mp_zomb" then
		return Engine.GetDvarInt( "scr_" .. f2_local0 .. "_teambased" ) == 0
	else
		return false
	end
end

GameX.GetTeamName = function ( f3_arg0 )
	local f3_local0 = {
		"free",
		"axis",
		"allies"
	}
	return f3_local0[f3_arg0 + 1]
end

GameX.GetFactionName = function ( f4_arg0 )
	local f4_local0 = {
		"free",
		"sdf",
		"unsa"
	}
	return f4_local0[f4_arg0 + 1]
end

GameX.IsSpectatingNotOnTeam = function ( f5_arg0 )
	local f5_local0
	if not (Game.IsSpectating() or Game.GetOmnvar( "ui_session_state" ) == "spectator") or (f5_arg0 or Game.GetPlayerTeam()) ~= Teams.spectator then
		f5_local0 = false
	else
		f5_local0 = true
	end
	return f5_local0
end

GameX.IsHardcoreMode = function ()
	if Engine.InFrontend() then
		return Engine.GetDvarBool( "ui_hardcore" )
	else
		return Engine.IsHardcoreMPActive()
	end
end

GameX.IsRankedMatch = function ()
	if Engine.IsDevelopmentBuild() and Engine.GetDvarInt( "force_ranking" ) == 1 then
		return true
	end
	return Engine.GetDvarBool( "onlinegame" ) and not Engine.GetDvarBool( "xblive_privatematch" )
end

GameX.IsOnlineMatch = function ()
	local f8_local0 = Engine.GetDvarBool( "onlinegame" )
	if not f8_local0 then
		f8_local0 = Engine.GetDvarBool( "xblive_privatematch" )
	end
	return f8_local0
end

GameX.GetGameMode = function ()
	return Engine.GetDvarString( "ui_gametype" )
end

GameX.GetNumPlayerSlotsForFinalScoreboard = function ( f10_arg0, f10_arg1 )
	local f10_local0 = GameX.IsRankedMatch() and Engine.GetDvarInt( "party_maxplayers" ) or 0
	local f10_local1 = Game.GetNumPlayersOnTeam( f10_arg0 )
	if GameX.gameModeIsFFA( f10_arg1 ) then
		assert( f10_arg0 == Teams.free )
		return math.max( 1, math.max( f10_local1, f10_local0 ) )
	elseif f10_arg1 == "infect" then
		if f10_arg0 == Teams.allies then
			return math.max( 0, f10_local1 )
		else
			local f10_local2 = Game.GetNumPlayersOnTeam( GameX.GetPlayerOpposingTeam( f10_arg0 ) )
			local f10_local3 = f10_local0 - f10_local2
			if f10_local1 + f10_local2 == 0 then
				return 1
			else
				return math.max( 0, math.max( f10_local1, f10_local3 ) )
			end
		end
	end
	local f10_local2 = assert
	local f10_local3
	if f10_arg0 ~= Teams.axis and f10_arg0 ~= Teams.allies then
		f10_local3 = false
	else
		f10_local3 = true
	end
	f10_local2( f10_local3 )
	return math.max( 1, math.max( f10_local1, f10_local0 / 2 ) )
end

GameX.GetPlayerScoreInfoAtRankForGameMode = function ( f11_arg0, f11_arg1, f11_arg2, f11_arg3 )
	local f11_local0 = Game.GetPlayerScoreInfoAtRank( f11_arg0, f11_arg1, true )
	if not f11_local0 then
		return nil
	end
	local f11_local1 = 99
	local f11_local2 = 99
	f11_local0.score = math.min( 9999, f11_local0.score )
	f11_local0.kills = math.min( f11_local1, f11_local0.kills )
	f11_local0.deaths = math.min( 99, f11_local0.deaths )
	f11_local0.assists = math.min( f11_local2, f11_local0.assists )
	f11_local0.prestige = f11_local0.prestige or 0
	if not (f11_arg2 ~= "dm" and (f11_arg2 ~= "cranked" or not GameX.gameModeIsFFA( f11_arg2 ))) or f11_arg2 == "sotf_ffa" or f11_arg2 == "mp_zomb" and GameX.gameModeIsFFA( f11_arg2 ) then
		local f11_local3 = Game.GetOmnvar( "ui_game_type_kill_value" )
		if not f11_local3 then
			f11_local0.extrascore0 = 0
		else
			f11_local0.extrascore0 = math.min( 9999, f11_local0.score * f11_local3 )
		end
	elseif f11_arg2 == "infect" then
		f11_local0.time = CoD.FormatInfectedTime( f11_local0.extrascore0, f11_arg3 )
	else
		f11_local0.extrascore0 = math.min( 99, f11_local0.extrascore0 )
	end
	return f11_local0
end

GameX.GetScreenDims = function ()
	return GameX.GetScreenWidth(), GameX.GetScreenHeight()
end

GameX.GetScreenWidth = function ()
	return 1280
end

GameX.GetScreenHeight = function ()
	return 720
end

GameX.GetSafeZoneSize = function ( f15_arg0, f15_arg1 )
	local f15_local0 = f15_arg0 or SliderBounds.HorzMargin.Min
	local f15_local1 = f15_arg1 or SliderBounds.VertMargin.Min
	local f15_local2, f15_local3 = GameX.GetScreenDims()
	local f15_local4 = f15_local2 * (1 - f15_local0) / 2
	local f15_local5 = f15_local3 * (1 - f15_local1) / 2
	local f15_local6 = Engine.SplitscreenPlayerCount()
	assert( f15_local6 <= MaxLocalClients )
	local f15_local7 = assert
	local f15_local8
	if f15_local6 ~= 1 and f15_local6 ~= 2 then
		f15_local8 = false
	else
		f15_local8 = true
	end
	f15_local7( f15_local8 )
	if f15_local6 == 2 then
		f15_local5 = f15_local5 * 2
		f15_local7 = Engine.GetCurrentLocalClient()
		assert( f15_local7 and f15_local7 < MaxLocalClients )
		if f15_local7 == 0 then
			return f15_local4, f15_local5, -f15_local4, 0
		else
			return f15_local4, 0, -f15_local4, -f15_local5
		end
	else
		return f15_local4, f15_local5, -f15_local4, -f15_local5
	end
end

GameX.GetAdjustedSafeZoneSize = function ()
	return GameX.GetSafeZoneSize( Engine.GetDvarFloat( "safeArea_adjusted_horizontal" ), Engine.GetDvarFloat( "safeArea_adjusted_vertical" ) )
end

GameX.IsSplitscreen = function ()
	local f17_local0 = Engine.SplitscreenPlayerCount()
	local f17_local1 = assert
	local f17_local2
	if f17_local0 and f17_local0 > MaxLocalClients then
		f17_local2 = false
	else
		f17_local2 = true
	end
	f17_local1( f17_local2 )
	return f17_local0 > 1
end

OptionState = {
	Locked = false
}
GameX.IsOptionStateLocked = function ()
	return OptionState.Locked
end

GameX.SetOptionState = function ( f19_arg0 )
	OptionState.Locked = f19_arg0
end

GameX.GetLocalizedTeamName = function ( f20_arg0 )
	if f20_arg0 == Teams.allies then
		return Engine.Localize( "LUA_MENU_ALLIES_CAPS" )
	elseif f20_arg0 == Teams.axis then
		return Engine.Localize( "LUA_MENU_AXIS_CAPS" )
	else
		return nil
	end
end

GameX.UsesFakeLoadout = function ()
	local f21_local0 = GameX.GetGameMode()
	local f21_local1 = Game.GetOmnvar( "ui_skip_loadout" )
	local f21_local2
	if f21_local0 ~= "infect" and f21_local0 ~= "gun" then
		f21_local2 = f21_local1
	else
		f21_local2 = true
	end
	return f21_local2
end

GameX.SplitClanTagFromPlayerName = function ( f22_arg0 )
	local f22_local0 = nil
	if Engine.IsConsoleGame() and string.sub( f22_arg0, 1, 1 ) == "[" then
		local f22_local1 = string.find( f22_arg0, "]" )
		if f22_local1 and f22_local1 < 7 then
			f22_local0 = string.sub( f22_arg0, 1, f22_local1 )
			f22_arg0 = string.sub( f22_arg0, f22_local1 + 1 )
		end
	end
	return f22_local0, utils.mp.DebugRemapGamerTag.GetRemappedGamerTag( f22_arg0 )
end

