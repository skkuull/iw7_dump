DataSources.frontEnd.AAR = {
	MP = {
		playerData = {}
	},
	rewards = {},
	scoreboard = {},
	performance = {
		kdHistory = {},
		spmHistory = {}
	},
	medals = {}
}
local f0_local0 = function ( f1_arg0 )
	local f1_local0 = Engine.TableLookup( GameTypesTable.File, GameTypesTable.Cols.Ref, f1_arg0, GameTypesTable.Cols.Name )
	local f1_local1
	if f1_local0 then
		f1_local1 = Engine.Localize( f1_local0 )
		if not f1_local1 then
		
		else
			return f1_local1
		end
	end
	f1_local1 = ""
end

local f0_local1 = function ( f2_arg0, f2_arg1 )
	local f2_local0 = DataSources.frontEnd.lobby.mapName:GetValue( f2_arg1 )
	local f2_local1 = math.floor( f2_arg0 / 3600 )
	if f2_local1 > 0 then
		local f2_local2 = math.floor( f2_arg0 / 60 - f2_local1 * 60 )
		return Engine.Localize( "LUA_MENU_ZM_TIME_SURVIVED_HOURS", string.format( "%.2d", f2_local1 ), string.format( "%.2d", f2_local2 ), string.format( "%.2d", f2_arg0 - f2_local1 * 60 * 60 - f2_local2 * 60 ), f2_local0 )
	else
		local f2_local2 = math.floor( f2_arg0 / 60 )
		return Engine.Localize( "LUA_MENU_ZM_TIME_SURVIVED_MINUTES", string.format( "%.2d", f2_local2 ), string.format( "%.2d", math.floor( f2_arg0 - f2_local2 * 60 ) ), f2_local0 )
	end
end

local f0_local2 = function ( f3_arg0, f3_arg1 )
	return Engine.Localize( "LUA_MENU_ZM_ROUNDS_SURVIVED", f3_arg0 )
end

function InitAARScoreboardDataSources( f4_arg0 )
	if Engine.IsAliensMode() then
		PostMatch.PushCPScoreboardDataToLUIModel( f4_arg0 )
	else
		PostMatch.PushScoreboardDataToLUIModel( f4_arg0 )
	end
	if Engine.IsCoreMode() then
		DataSources.frontEnd.AAR.scoreboard.myTeam = LUI.DataSourceInGlobalModel.new( "frontEnd.AAR.scoreBoard.myTeam" )
		DataSources.frontEnd.AAR.friendlyScore = LUI.DataSourceInGlobalModel.new( "frontEnd.AAR.scoreBoard.friendlyScore" )
		DataSources.frontEnd.AAR.enemyScore = LUI.DataSourceInGlobalModel.new( "frontEnd.AAR.scoreBoard.enemyScore" )
	end
	DataSources.frontEnd.AAR.scoreboard.myPlayerIndex = LUI.DataSourceInGlobalModel.new( "frontEnd.AAR.scoreBoard.myPlayerIndex" )
	DataSources.frontEnd.AAR.mapName = LUI.DataSourceInGlobalModel.new( "frontEnd.AAR.mapName" )
	DataSources.frontEnd.AAR.gameType = LUI.DataSourceInGlobalModel.new( "frontEnd.AAR.gameType" )
	if Engine.IsAliensMode() then
		DataSources.frontEnd.AAR.timeSurvived = LUI.DataSourceInGlobalModel.new( "frontEnd.AAR.scoreBoard.players.timeSurvived" )
		DataSources.frontEnd.AAR.timeSurvivedText = DataSources.frontEnd.AAR.timeSurvived:Filter( "text", f0_local1 )
		DataSources.frontEnd.AAR.roundsSurvived = LUI.DataSourceInGlobalModel.new( "frontEnd.AAR.scoreBoard.players.wavesSurvived" )
		DataSources.frontEnd.AAR.roundsSurvivedText = DataSources.frontEnd.AAR.roundsSurvived:Filter( "text", f0_local2 )
	end
	DataSources.frontEnd.AAR.gameTypeName = DataSources.frontEnd.AAR.gameType:Filter( "gameTypeName", f0_local0 )
	DataSources.frontEnd.AAR.gameTime = LUI.DataSourceInGlobalModel.new( "frontEnd.AAR.gameTime" )
	SCOREBOARD.InitScoreboardDataSources( SCOREBOARD.menus.AAR, f4_arg0 )
end

function InitAARPerformanceDataSources( f5_arg0 )
	local f5_local0 = "frontEnd.AAR.performance"
	PostMatch.PushPerformanceDataToLUIModel( f5_arg0 )
	local f5_local1 = function ( f6_arg0, f6_arg1 )
		return string.format( "%.2f", f6_arg0 )
	end
	
	local f5_local2 = function ( f7_arg0, f7_arg1 )
		return string.format( "%.1f %%", f7_arg0 * 100 )
	end
	
	DataSources.frontEnd.AAR.performance.kills = LUI.DataSourceInControllerModel.new( f5_local0 .. ".kills" )
	DataSources.frontEnd.AAR.performance.deaths = LUI.DataSourceInControllerModel.new( f5_local0 .. ".deaths" )
	DataSources.frontEnd.AAR.performance.kdRatio = LUI.DataSourceInControllerModel.new( f5_local0 .. ".kdRatio" )
	DataSources.frontEnd.AAR.performance.kdRatioString = DataSources.frontEnd.AAR.performance.kdRatio:Filter( "kdRatioString", f5_local1 )
	DataSources.frontEnd.AAR.performance.isPlacedInTopThree = LUI.DataSourceInControllerModel.new( f5_local0 .. ".isPlacedInTopThree" )
	DataSources.frontEnd.AAR.performance.isPersonalBestKills = LUI.DataSourceInControllerModel.new( f5_local0 .. ".isPersonalBestKills" )
	DataSources.frontEnd.AAR.performance.isPersonalBestKD = LUI.DataSourceInControllerModel.new( f5_local0 .. ".isPersonalBestKD" )
	DataSources.frontEnd.AAR.performance.gamesPlayed = LUI.DataSourceInControllerModel.new( f5_local0 .. ".gamesPlayed" )
	DataSources.frontEnd.AAR.performance.totalWins = LUI.DataSourceInControllerModel.new( f5_local0 .. ".totalWins" )
	DataSources.frontEnd.AAR.performance.totalLosses = LUI.DataSourceInControllerModel.new( f5_local0 .. ".totalLosses" )
	DataSources.frontEnd.AAR.performance.winLossPercent = LUI.DataSourceInControllerModel.new( f5_local0 .. ".winLossPercent" )
	DataSources.frontEnd.AAR.performance.winLossPercentString = DataSources.frontEnd.AAR.performance.winLossPercent:Filter( "winLossPercentString", f5_local2 )
	DataSources.frontEnd.AAR.performance.kdHistory.maxValue = LUI.DataSourceInControllerModel.new( f5_local0 .. ".kdHistory.maxValue" )
	DataSources.frontEnd.AAR.performance.kdHistory.average = LUI.DataSourceInControllerModel.new( f5_local0 .. ".kdHistory.average" )
	DataSources.frontEnd.AAR.performance.kdHistory.globalStat = LUI.DataSourceInControllerModel.new( f5_local0 .. ".kdHistory.global" )
	DataSources.frontEnd.AAR.performance.kdHistory.personalBestStat = LUI.DataSourceInControllerModel.new( f5_local0 .. ".kdHistory.best" )
	DataSources.frontEnd.AAR.performance.kdHistory.personalBestTime = LUI.DataSourceInControllerModel.new( f5_local0 .. ".kdHistory.bestTimestamp" )
	DataSources.frontEnd.AAR.performance.spmHistory.maxValue = LUI.DataSourceInControllerModel.new( f5_local0 .. ".spmHistory.maxValue" )
	DataSources.frontEnd.AAR.performance.spmHistory.average = LUI.DataSourceInControllerModel.new( f5_local0 .. ".spmHistory.average" )
	DataSources.frontEnd.AAR.performance.spmHistory.globalStat = LUI.DataSourceInControllerModel.new( f5_local0 .. ".spmHistory.global" )
	DataSources.frontEnd.AAR.performance.spmHistory.personalBestStat = LUI.DataSourceInControllerModel.new( f5_local0 .. ".spmHistory.best" )
	DataSources.frontEnd.AAR.performance.spmHistory.personalBestTime = LUI.DataSourceInControllerModel.new( f5_local0 .. ".spmHistory.bestTimestamp" )
end

local f0_local3 = function ( f8_arg0, f8_arg1, f8_arg2 )
	local f8_local0 = 0
	for f8_local4, f8_local5 in pairs( CSV.ReadRow( {
		file = CSV.scoreEventTable.file,
		cols = CSV.scoreEventTable.xpCols
	}, Engine.TableLookupGetRowNum( CSV.scoreEventTable.file, CSV.scoreEventTable.cols.ref, f8_arg2.xpScoreEvent ) ) ) do
		local f8_local6 = tonumber( f8_local5 )
		if f8_local6 and 0 < f8_local6 then
			f8_local0 = f8_local6
			break
		end
	end
	return {
		text = LUI.DataSourceInControllerModel.new( f8_arg1 .. ".text", f8_arg2.title ),
		icon = LUI.DataSourceInControllerModel.new( f8_arg1 .. ".icon", f8_arg2.icon ),
		desc = LUI.DataSourceInControllerModel.new( f8_arg1 .. ".desc", f8_arg2.desc ),
		xp = LUI.DataSourceInControllerModel.new( f8_arg1 .. ".xp", f8_local0 ),
		achieved = LUI.DataSourceInControllerModel.new( f8_arg1 .. ".achieved", true )
	}
end

local f0_local4 = function ( f9_arg0 )
	DataSources.frontEnd.AAR.medals = {}
	local f9_local0 = "frontEnd.AAR.medals"
	local f9_local1 = AAR.GetNumAwards( f9_arg0 )
	for f9_local2 = 0, f9_local1 - 1, 1 do
		local f9_local5 = f0_local3( f9_arg0, f9_local0 .. "." .. f9_local2, CSV.ReadRow( CSV.awardTable, Engine.TableLookupGetRowNum( CSV.awardTable.file, CSV.awardTable.cols.ref, tostring( AAR.GetAccolade( f9_arg0, f9_local2 ) ) ) ) )
		f9_local5.count = DataSources.alwaysLoaded.playerData.MP.common.round.awards[f9_local2].value
		table.insert( DataSources.frontEnd.AAR.medals, f9_local5 )
	end
end

function InitAARDataSources( f10_arg0 )
	InitAARScoreboardDataSources( f10_arg0 )
	if Engine.IsCoreMode() then
		InitAARPerformanceDataSources( f10_arg0 )
		f0_local4( f10_arg0 )
	end
end

