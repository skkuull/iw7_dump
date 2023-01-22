SCOREBOARD = SCOREBOARD or {}
SCOREBOARD.menus = {
	InGame = 1,
	AAR = 2
}
SCOREBOARD.GainFocusSFX = "ui_hilite"
SCOREBOARD.ping = {
	thresholds = {
		poor = 250,
		fair = 200,
		good = 150
	}
}
SCOREBOARD.columns = {
	KILLS = {
		value = "kills",
		name = Engine.Localize( "MPUI_KILLS" )
	},
	DEATHS = {
		value = "deaths",
		name = Engine.Localize( "LUA_MENU_DEATHS" )
	},
	REVIVES = {
		value = "revives",
		name = Engine.Localize( "LUA_MENU_REVIVES" )
	},
	DOWNS = {
		value = "downs",
		name = Engine.Localize( "MENU_DOWNS" )
	},
	ASSISTS = {
		value = "assists",
		name = Engine.Localize( "LUA_MENU_ASSISTS" )
	},
	EXTRA_SCORE0 = {
		value = "extraScore0",
		name = Engine.Localize( "LUA_MENU_C_FOR_CAPTURES_CAPS" )
	},
	EXTRA_SCORE1 = {
		value = "extraScore1",
		name = Engine.Localize( "LUA_MENU_C_FOR_CAPTURES_CAPS" )
	},
	KILLDEATHRATIO = {
		value = "killDeathRatio",
		name = Engine.Localize( "LUA_MENU_RATIO_CAPS" )
	},
	TIME = {
		value = "time",
		name = Engine.Localize( "LUA_MENU_TIME" )
	}
}
SCOREBOARD.columnsPerMode = {
	default = {
		SCOREBOARD.columns.KILLS,
		SCOREBOARD.columns.DEATHS,
		SCOREBOARD.columns.KILLDEATHRATIO,
		SCOREBOARD.columns.ASSISTS
	},
	war = {
		SCOREBOARD.columns.KILLS,
		SCOREBOARD.columns.DEATHS,
		SCOREBOARD.columns.KILLDEATHRATIO,
		SCOREBOARD.columns.ASSISTS
	},
	dom = {
		SCOREBOARD.columns.KILLS,
		SCOREBOARD.columns.DEATHS,
		SCOREBOARD.columns.EXTRA_SCORE0,
		{
			value = SCOREBOARD.columns.EXTRA_SCORE1.value,
			name = Engine.Localize( "LUA_MENU_DEFENDS_CAPS" )
		}
	},
	sd = {
		SCOREBOARD.columns.KILLS,
		SCOREBOARD.columns.DEATHS,
		{
			value = SCOREBOARD.columns.EXTRA_SCORE0.value,
			name = Engine.Localize( "LUA_MENU_PLANTS" )
		},
		{
			value = SCOREBOARD.columns.EXTRA_SCORE1.value,
			name = Engine.Localize( "LUA_MENU_DEFUSES_CAPS" )
		}
	},
	conf = {
		SCOREBOARD.columns.KILLS,
		SCOREBOARD.columns.DEATHS,
		{
			value = SCOREBOARD.columns.EXTRA_SCORE0.value,
			name = Engine.Localize( "LUA_MENU_CONFIRMS_CAPS" )
		},
		{
			value = SCOREBOARD.columns.EXTRA_SCORE1.value,
			name = Engine.Localize( "LUA_MENU_DENIES_CAPS" )
		}
	},
	dm = {
		SCOREBOARD.columns.KILLS,
		SCOREBOARD.columns.DEATHS,
		SCOREBOARD.columns.KILLDEATHRATIO,
		{
			value = SCOREBOARD.columns.EXTRA_SCORE1.value,
			name = Engine.Localize( "LUA_MENU_STREAK_CAPS" )
		}
	},
	sr = {
		SCOREBOARD.columns.KILLS,
		SCOREBOARD.columns.DEATHS,
		{
			value = SCOREBOARD.columns.EXTRA_SCORE0.value,
			name = Engine.Localize( "LUA_MENU_PLANTS" )
		},
		{
			value = SCOREBOARD.columns.EXTRA_SCORE1.value,
			name = Engine.Localize( "LUA_MENU_RESCUES" )
		}
	},
	ball = {
		SCOREBOARD.columns.KILLS,
		SCOREBOARD.columns.DEATHS,
		{
			value = SCOREBOARD.columns.EXTRA_SCORE0.value,
			name = Engine.Localize( "LUA_MENU_MP_CARRIES" )
		},
		{
			value = SCOREBOARD.columns.EXTRA_SCORE1.value,
			name = Engine.Localize( "LUA_MENU_MP_THROWS" )
		}
	},
	infect = {
		SCOREBOARD.columns.KILLS,
		SCOREBOARD.columns.DEATHS,
		{
			value = SCOREBOARD.columns.EXTRA_SCORE0.value,
			name = Engine.Localize( "LUA_MENU_TIME" )
		},
		{
			value = SCOREBOARD.columns.EXTRA_SCORE1.value,
			name = Engine.Localize( "LUA_MENU_INFECTED_SCOREBOARD" )
		}
	},
	grind = {
		SCOREBOARD.columns.KILLS,
		SCOREBOARD.columns.DEATHS,
		{
			value = SCOREBOARD.columns.EXTRA_SCORE0.value,
			name = Engine.Localize( "LUA_MENU_SCORES" )
		},
		{
			value = SCOREBOARD.columns.EXTRA_SCORE1.value,
			name = Engine.Localize( "LUA_MENU_DENIES_CAPS" )
		}
	},
	gun = {
		SCOREBOARD.columns.KILLS,
		SCOREBOARD.columns.DEATHS,
		{
			value = SCOREBOARD.columns.EXTRA_SCORE0.value,
			name = Engine.Localize( "LUA_MENU_MP_MELEES" )
		},
		{
			value = SCOREBOARD.columns.EXTRA_SCORE1.value,
			name = Engine.Localize( "LUA_MENU_MP_SETBACKS" )
		}
	},
	siege = {
		SCOREBOARD.columns.KILLS,
		SCOREBOARD.columns.DEATHS,
		SCOREBOARD.columns.EXTRA_SCORE0,
		{
			value = SCOREBOARD.columns.EXTRA_SCORE1.value,
			name = Engine.Localize( "LUA_MENU_REVIVES" )
		}
	},
	koth = {
		SCOREBOARD.columns.KILLS,
		SCOREBOARD.columns.DEATHS,
		{
			value = SCOREBOARD.columns.EXTRA_SCORE0.value,
			name = Engine.Localize( "LUA_MENU_TIME" )
		},
		{
			value = SCOREBOARD.columns.EXTRA_SCORE1.value,
			name = Engine.Localize( "LUA_MENU_DEFENDS_CAPS" )
		}
	},
	tdef = {
		SCOREBOARD.columns.KILLS,
		SCOREBOARD.columns.DEATHS,
		{
			value = SCOREBOARD.columns.EXTRA_SCORE0.value,
			name = Engine.Localize( "LUA_MENU_TIME" )
		},
		{
			value = SCOREBOARD.columns.EXTRA_SCORE1.value,
			name = Engine.Localize( "LUA_MENU_DEFENDS_CAPS" )
		}
	},
	dd = {
		SCOREBOARD.columns.KILLS,
		SCOREBOARD.columns.DEATHS,
		{
			value = SCOREBOARD.columns.EXTRA_SCORE0.value,
			name = Engine.Localize( "LUA_MENU_PLANTS" )
		},
		{
			value = SCOREBOARD.columns.EXTRA_SCORE1.value,
			name = Engine.Localize( "LUA_MENU_DEFUSES_CAPS" )
		}
	},
	ctf = {
		SCOREBOARD.columns.KILLS,
		SCOREBOARD.columns.DEATHS,
		SCOREBOARD.columns.EXTRA_SCORE0,
		{
			value = SCOREBOARD.columns.EXTRA_SCORE1.value,
			name = Engine.Localize( "LUA_MENU_MP_RETURNS" )
		}
	},
	grnd = {
		SCOREBOARD.columns.KILLS,
		SCOREBOARD.columns.DEATHS,
		{
			value = SCOREBOARD.columns.EXTRA_SCORE0.value,
			name = Engine.Localize( "LUA_MENU_TIME" )
		},
		{
			value = SCOREBOARD.columns.EXTRA_SCORE1.value,
			name = Engine.Localize( "LUA_MENU_DEFENDS_CAPS" )
		}
	},
	front = {
		SCOREBOARD.columns.KILLS,
		SCOREBOARD.columns.DEATHS,
		SCOREBOARD.columns.KILLDEATHRATIO,
		SCOREBOARD.columns.ASSISTS
	},
	zombie = {
		SCOREBOARD.columns.KILLS,
		SCOREBOARD.columns.DEATHS,
		SCOREBOARD.columns.REVIVES,
		SCOREBOARD.columns.DOWNS
	}
}
SCOREBOARD.maxVisibleTeamSize = 9
SCOREBOARD.GetGameModeFieldName = function ( f1_arg0, f1_arg1 )
	local f1_local0 = nil
	if Engine.IsAliensMode() then
		f1_local0 = Engine.GetDvarString( "ui_gametype" )
	elseif SCOREBOARD.IsAARScoreboard() then
		f1_local0 = DataSources.alwaysLoaded.playerData.MP.common.round.gameMode:GetValue( f1_arg0 )
	else
		f1_local0 = Game.GetGameType()
	end
	local f1_local1 = SCOREBOARD.columnsPerMode[f1_local0]
	if not f1_local1 then
		f1_local1 = SCOREBOARD.columnsPerMode.default
	end
	return f1_local1[f1_arg1].value
end

SCOREBOARD.GetPingIcon = function ( f2_arg0 )
	assert( f2_arg0 )
	local f2_local0 = nil
	local f2_local1 = SCOREBOARD.ping.thresholds.poor
	local f2_local2 = SCOREBOARD.ping.thresholds.fair
	if f2_arg0 <= SCOREBOARD.ping.thresholds.good then
		f2_local0 = "hud_ping_4"
	elseif f2_arg0 <= f2_local2 then
		f2_local0 = "hud_ping_3"
	elseif f2_arg0 <= f2_local1 then
		f2_local0 = "hud_ping_2"
	else
		f2_local0 = "hud_ping_1"
	end
	return f2_local0
end

SCOREBOARD.CalculateKillDeathRatio = function ( f3_arg0, f3_arg1 )
	assert( f3_arg0, f3_arg1 )
	if f3_arg1 == 0 then
		f3_arg1 = 1
	end
	local f3_local0 = f3_arg0 / f3_arg1
	local f3_local1 = "%.2f"
	if f3_local0 > 100 then
		f3_local1 = "%.0f"
	elseif f3_local0 > 10 then
		f3_local1 = "%.1f"
	end
	if f3_local0 > 999 then
		f3_local0 = 999
	end
	return string.format( f3_local1, f3_local0 )
end

local f0_local0 = function ( f4_arg0, f4_arg1, f4_arg2 )
	local f4_local0 = {}
	local f4_local1 = f4_arg2 .. ".scoreboard.team." .. f4_arg1
	if Engine.IsCoreMode() then
		f4_local0.name = LUI.DataSourceInControllerModel.new( f4_local1 .. ".name" )
		f4_local0.logo = LUI.DataSourceInControllerModel.new( f4_local1 .. ".logo" )
		f4_local0.watermark = LUI.DataSourceInControllerModel.new( f4_local1 .. ".watermark" )
	end
	return f4_local0
end

local f0_local1 = function ( f5_arg0, f5_arg1, f5_arg2 )
	local f5_local0 = {}
	local f5_local1 = f5_arg2 .. ".scoreboard.team." .. f5_arg1
	if Engine.IsCoreMode() then
		f5_local0.name = LUI.DataSourceInGlobalModel.new( f5_local1 .. ".name", MP.teamInfo[f5_arg1].name )
		f5_local0.logo = LUI.DataSourceInGlobalModel.new( f5_local1 .. ".logo", MP.teamInfo[f5_arg1].logo )
		f5_local0.watermark = LUI.DataSourceInGlobalModel.new( f5_local1 .. ".watermark", MP.teamInfo[f5_arg1].watermark )
	end
	return f5_local0
end

local f0_local2 = function ( f6_arg0 )
	local f6_local0 = nil
	if Engine.IsAliensMode() then
		f6_local0 = Engine.GetDvarString( "ui_gametype" )
	elseif SCOREBOARD.IsAARScoreboard() then
		f6_local0 = DataSources.alwaysLoaded.playerData.MP.common.round.gameMode:GetValue( f6_arg0 )
	else
		f6_local0 = Game.GetGameType()
	end
	local f6_local1 = SCOREBOARD.columnsPerMode[f6_local0]
	if not f6_local1 then
		f6_local1 = SCOREBOARD.columnsPerMode.default
	end
	local f6_local2 = LUI.DataSourceFromList.new( #f6_local1 )
	f6_local2.MakeDataSourceAtIndex = function ( f7_arg0, f7_arg1, f7_arg2 )
		local f7_local0 = f6_local1[f7_arg1 + 1].name
		return {
			value = LUI.DataSourceInGlobalModel.new( "scoreboard.column." .. f7_local0, f7_local0 )
		}
	end
	
	return f6_local2
end

SCOREBOARD.IsAARScoreboard = function ()
	return Engine.InFrontend()
end

SCOREBOARD.GetScoreboardDataSourceRoot = function ()
	if SCOREBOARD.IsAARScoreboard() then
		return DataSources.frontEnd.AAR
	else
		return DataSources.inGame
	end
end

SCOREBOARD.InitScoreboardDataSources = function ( f10_arg0, f10_arg1 )
	local f10_local0 = ""
	if f10_arg0 == SCOREBOARD.menus.InGame then
		f10_local0 = "cg"
	elseif f10_arg0 == SCOREBOARD.menus.AAR then
		f10_local0 = "frontEnd.AAR"
	else
		DebugPrint( "Unexpected scoreboard menu type! Skipping data source init." )
		return 
	end
	local f10_local1 = nil
	if f10_arg0 == SCOREBOARD.menus.InGame then
		f10_local1 = DataSources.inGame.scoreboard
	elseif f10_arg0 == SCOREBOARD.menus.AAR then
		f10_local1 = DataSources.frontEnd.AAR.scoreboard
	end
	if Engine.IsCoreMode() and f10_arg0 == SCOREBOARD.menus.AAR then
		local f10_local2 = LUI.DataSourceInGlobalModel.new( f10_local0 .. ".scoreboard.team." .. Teams.free .. ".color", MP.teamInfo[Teams.free].color )
		local f10_local3 = LUI.DataSourceInGlobalModel.new( f10_local0 .. ".scoreboard.team." .. Teams.allies .. ".color", MP.teamInfo[Teams.allies].color )
		local f10_local4 = LUI.DataSourceInGlobalModel.new( f10_local0 .. ".scoreboard.team." .. Teams.axis .. ".color", MP.teamInfo[Teams.axis].color )
		f10_local1.numPlayersTeamA = LUI.DataSourceInGlobalModel.new( f10_local0 .. ".scoreBoard.players.numPlayersTeamA" )
		f10_local1.numPlayersTeamB = LUI.DataSourceInGlobalModel.new( f10_local0 .. ".scoreBoard.players.numPlayersTeamB" )
		f10_local1.numFFAPlayers = LUI.DataSourceInGlobalModel.new( f10_local0 .. ".scoreBoard.players.numFFAPlayers" )
		f10_local1.extraColumns = f0_local2( f10_arg1 )
		f10_local1.teamFFA = f0_local1( f10_local1.numFFAPlayers, Teams.free, f10_local0 )
		f10_local1.teamA = f0_local1( f10_local1.numPlayersTeamA, Teams.allies, f10_local0 )
		f10_local1.teamB = f0_local1( f10_local1.numPlayersTeamB, Teams.axis, f10_local0 )
	elseif Engine.IsCoreMode() then
		local f10_local2 = LUI.DataSourceInControllerModel.new( f10_local0 .. ".scoreboard.team." .. Teams.free .. ".color", MP.teamInfo[Teams.free].color )
		local f10_local3 = LUI.DataSourceInControllerModel.new( f10_local0 .. ".scoreboard.team." .. Teams.allies .. ".color", MP.teamInfo[Teams.allies].color )
		local f10_local4 = LUI.DataSourceInControllerModel.new( f10_local0 .. ".scoreboard.team." .. Teams.axis .. ".color", MP.teamInfo[Teams.axis].color )
		f10_local1.numPlayersTeamA = LUI.DataSourceInControllerModel.new( f10_local0 .. ".scoreBoard.players.numPlayersTeamA" )
		f10_local1.numPlayersTeamB = LUI.DataSourceInControllerModel.new( f10_local0 .. ".scoreBoard.players.numPlayersTeamB" )
		f10_local1.numFFAPlayers = LUI.DataSourceInControllerModel.new( f10_local0 .. ".scoreBoard.players.numFFAPlayers" )
		f10_local1.extraColumns = f0_local2( f10_arg1 )
		f10_local1.teamFFA = f0_local0( f10_local1.numFFAPlayers, Teams.free, f10_local0 )
		f10_local1.teamA = f0_local0( f10_local1.numPlayersTeamA, Teams.allies, f10_local0 )
		f10_local1.teamB = f0_local0( f10_local1.numPlayersTeamB, Teams.axis, f10_local0 )
	else
		local f10_local2 = LUI.DataSourceInGlobalModel.new( f10_local0 .. ".scoreboard.color", MP.teamInfo[Teams.free].color )
		f10_local1.numCPPlayers = LUI.DataSourceInGlobalModel.new( f10_local0 .. ".scoreBoard.players.numCPPlayers" )
		f10_local1.extraColumns = f0_local2( f10_arg1 )
		f10_local1.teamFFA = f0_local0( f10_local1.numCPPlayers, Teams.free, f10_local0 )
	end
end

SCOREBOARD.SetupScoreboard = function ( f11_arg0, f11_arg1 )
	f11_arg0._numPlayers = 0
	if not f11_arg1 then
		f11_arg1 = {}
	end
	f11_arg0._numPlayersFunction = f11_arg1.numPlayersFunction or function ( f12_arg0 )
		return Game.GetNumPlayersOnTeam( f12_arg0._team )
	end
	
	local f11_local0 = f11_arg1.controllerIndex
	f11_arg0.SetTeam = function ( f13_arg0, f13_arg1 )
		f13_arg0._team = f13_arg1
		if (f13_arg1 == Teams.allies or f13_arg1 == Teams.axis) and not Engine.IsAliensMode() then
			local f13_local0 = f13_arg0:GetDataSource( f11_local0 )
			f13_local0.name:SetValue( f11_local0, MP.teamInfo[f13_arg1].name )
			f13_local0.logo:SetValue( f11_local0, MP.teamInfo[f13_arg1].logo )
			f13_local0.watermark:SetValue( f11_local0, MP.teamInfo[f13_arg1].watermark )
		end
	end
	
	f11_arg0.SetDefaultFocusFunction = function ( f14_arg0, f14_arg1 )
		assert( type( f14_arg1 ) == "function" )
		f14_arg0.Players:SetDefaultFocus( f14_arg1 )
	end
	
	f11_arg0.GetMyRowIndex = function ( f15_arg0 )
		for f15_local0 = 0, f15_arg0._numPlayers - 1, 1 do
			local f15_local3 = f15_arg0.Players:GetElementAtPosition( 0, f15_local0 )
			if f15_local3 and f15_local3:IsMyRow() then
				return f15_local0
			end
		end
	end
	
	f11_arg0.GetNumPlayers = function ( f16_arg0 )
		return f16_arg0._numPlayers
	end
	
	local f11_local1 = function ( f17_arg0, f17_arg1, f17_arg2 )
		for f17_local0 = 0, f17_arg1 - 1, 1 do
			local f17_local3 = f17_arg0.Players:GetElementAtPosition( 0, f17_local0 )
			if f17_local3 and f17_local3.setGainFocusSFX then
				f17_local3:setGainFocusSFX( f17_arg2 )
			end
		end
	end
	
	f11_arg0.RefreshRows = function ( f18_arg0, f18_arg1 )
		if not f18_arg0._team then
			return 
		end
		local f18_local0 = nil
		if SCOREBOARD.IsAARScoreboard() then
			local f18_local1 = SCOREBOARD.GetScoreboardDataSourceRoot()
			assert( f18_local1 and f18_local1.scoreboard )
			f18_local1 = f18_local1.scoreboard
			if Engine.IsAliensMode() then
				f18_local0 = f18_local1.numCPPlayers:GetValue( 0 )
			elseif f18_arg0._team == Teams.allies then
				f18_local0 = f18_local1.numPlayersTeamA:GetValue( 0 )
			elseif f18_arg0._team == Teams.axis then
				f18_local0 = f18_local1.numPlayersTeamB:GetValue( 0 )
			else
				f18_local0 = f18_local1.numFFAPlayers:GetValue( 0 )
			end
		else
			f18_local0 = f18_arg0:_numPlayersFunction()
		end
		f11_local1( f18_arg0, f18_local0, nil )
		f18_arg0.Players:SetNumRows( f18_local0 )
		f11_local1( f18_arg0, f18_local0, SCOREBOARD.GainFocusSFX )
		if Engine.IsAliensMode() then
			f18_arg0.Players:SetTargetRowToDefault()
		end
		f18_arg0._numPlayers = f18_local0
		for f18_local1 = 0, f18_local0 - 1, 1 do
			local f18_local4 = f18_arg0.Players:GetElementAtPosition( 0, f18_local1 )
			if f18_local4 then
				f18_local4:SetPlayer( f18_arg0._team, f18_local1 )
				f18_local4:RefreshRowContent( f18_arg1 )
			else
				DebugPrint( "Missing scoreboard row " .. f18_local1 )
			end
		end
	end
	
	f11_arg0.SetBackgroundRowCount = function ( f19_arg0, f19_arg1 )
		local f19_local0 = f19_arg1 * 32 + 22
		if f19_arg0.Background then
			f19_arg0.Background:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 22, _1080p * f19_local0 )
		end
	end
	
	f11_arg0.UpdateIndicatorArrowAlignment = function ( f20_arg0 )
		assert( f20_arg0.IndicatorArrow )
		local f20_local0, f20_local1 = f20_arg0.Players:GetRowBoundaries()
		local f20_local2 = f20_arg0.Players:GetContentVisibleSize( LUI.DIRECTION.vertical )
		if f20_local1 ~= nil and f20_arg0:GetNumPlayers() - 1 <= f20_local1 then
			ACTIONS.AnimateSequence( f20_arg0.IndicatorArrow, "IndicatorUp" )
		else
			ACTIONS.AnimateSequence( f20_arg0.IndicatorArrow, "IndicatorDown" )
		end
	end
	
	f11_arg0.UpdateScrollIndicatorArrow = function ( f21_arg0, f21_arg1, f21_arg2 )
		assert( f21_arg0.IndicatorArrow )
		f21_arg0:UpdateIndicatorArrowAlignment()
		if f21_arg2 < f21_arg1 then
			f21_arg0.IndicatorArrow:SetAlpha( 1 )
		else
			f21_arg0.IndicatorArrow:SetAlpha( 0 )
		end
	end
	
	f11_arg0.Players.refreshOnScroll = true
end

