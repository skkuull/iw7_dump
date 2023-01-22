DataSources = {
	alwaysLoaded = {
		input = {
			commands = {}
		},
		MP = {
			CAC = {
				ranked = {},
				private = {}
			},
			ranked = {
				progression = {}
			},
			contracts = {}
		},
		CP = {
			ranked = {
				progression = {}
			}
		},
		playerData = {
			MP = {},
			CP = {}
		},
		activeParty = {}
	},
	debug = {}
}
function InitAlwaysLoadedDataSources()
	
end

local f0_local0 = function ( f2_arg0, f2_arg1 )
	f2_arg0.progression.xp = f2_arg1.playerLevel.xp
	f2_arg0.progression.rank = f2_arg0.progression.xp:Filter( "rank", function ( f3_arg0, f3_arg1 )
		return Engine.GetRankForXP( f3_arg0 )
	end )
	f2_arg0.progression.rankPercentage = f2_arg0.progression.xp:Filter( "rankPercentage", Rank.RankPercentageFilter )
	f2_arg0.progression.rankXPRequired = f2_arg0.progression.xp:Filter( "rankXPRequired", Rank.RankXPRequiredFilter )
	f2_arg0.progression.rankDisplay = f2_arg0.progression.rank:Filter( "display", Rank.RankDisplayFilter )
	f2_arg0.progression.prestige = f2_arg1.playerLevel.prestige
	local f2_local0 = {
		f2_arg0.progression.rank,
		f2_arg0.progression.prestige
	}
	f2_arg0.progression.rankIcon = LUI.AggregateDataSource.new( f2_arg0.progression.rank, f2_local0, "icon", Rank.RankIconFilter( f2_arg0.progression ) )
	f2_arg0.progression.rankBigIcon = LUI.AggregateDataSource.new( f2_arg0.progression.rank, f2_local0, "bigicon", Rank.RankBigIconFilter( f2_arg0.progression ) )
end

local f0_local1 = false
function InitCoreMPRankedDataSources()
	if not f0_local1 then
		InitAlwaysLoadedCoreMPDataSources()
		f0_local0( DataSources.alwaysLoaded.MP.ranked, DataSources.alwaysLoaded.playerData.MP.ranked.progression )
		f0_local1 = true
	end
end

local f0_local2 = false
function InitAlwaysLoadedCoreMPDataSources()
	if not f0_local2 then
		DataSources.alwaysLoaded.playerData.MP.ranked = LUI.DataSourceFromPlayerData.new( CoD.StatsGroup.Ranked, CoD.PlayMode.Core )
		DataSources.alwaysLoaded.playerData.MP.common = LUI.DataSourceFromPlayerData.new( CoD.StatsGroup.Common, CoD.PlayMode.Core )
		DataSources.alwaysLoaded.playerData.MP.rankedloadouts = LUI.DataSourceFromPlayerData.new( CoD.StatsGroup.RankedLoadouts, CoD.PlayMode.Core )
		DataSources.alwaysLoaded.playerData.MP.privateloadouts = LUI.DataSourceFromPlayerData.new( CoD.StatsGroup.PrivateLoadouts, CoD.PlayMode.Core )
		DataSources.alwaysLoaded.MP.contracts.postMatchMissionTeamXP = LUI.DataSourceInControllerModel.new( "alwaysLoaded.MP.contracts.postMatchMissionTeamXP", 0 )
		f0_local2 = true
	end
end

function InitAlwaysLoadedCommonMPDataSources()
	DataSources.alwaysLoaded.playerData.MP.common = LUI.DataSourceFromPlayerData.new( CoD.StatsGroup.Common, CoD.PlayMode.Core )
end

local f0_local3 = false
function InitCPRankedDataSources()
	if not f0_local3 then
		InitAlwaysLoadedCPDataSources()
		f0_local0( DataSources.alwaysLoaded.CP.ranked, DataSources.alwaysLoaded.playerData.CP.progression )
		f0_local3 = true
	end
end

local f0_local4 = false
function InitAlwaysLoadedCPDataSources()
	if not f0_local4 then
		DataSources.alwaysLoaded.playerData.CP.ranked = LUI.DataSourceFromPlayerData.new( CoD.StatsGroup.Ranked, CoD.PlayMode.Aliens )
		DataSources.alwaysLoaded.playerData.CP.common = LUI.DataSourceFromPlayerData.new( CoD.StatsGroup.Common, CoD.PlayMode.Aliens )
		f0_local4 = true
	end
end

