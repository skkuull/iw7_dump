MatchSimulator = {}
local f0_local0 = nil
local f0_local1 = {
	{
		column = "playerXP",
		statsGroup = CoD.StatsGroup.Ranked,
		data = {
			"progression",
			"playerLevel",
			"xp"
		},
		datatype = "integer",
		winMin = 3000,
		winMax = 3000,
		loseMin = 2500,
		loseMax = 2500
	},
	{
		column = "gametype",
		statsGroup = CoD.StatsGroup.Common,
		data = {
			"round",
			"gameMode"
		},
		datatype = "gametype"
	}
}
local f0_local2 = function ( f1_arg0 )
	local f1_local0, f1_local1, f1_local2 = nil
	DebugPrint( "Generating result" )
	for f1_local9, f1_local10 in ipairs( f0_local1 ) do
		f1_local2 = {}
		table.insert( f1_local2, f1_arg0 )
		table.insert( f1_local2, f1_local10.statsGroup )
		for f1_local6, f1_local7 in pairs( f1_local10.data ) do
			table.insert( f1_local2, f1_local10.data[f1_local6] )
		end
		if f1_local10.datatype == "integer" then
			if f0_local0 == 1 then
				f1_local0 = math.random( f1_local10.winMin, f1_local10.winMax )
			else
				f1_local0 = math.random( f1_local10.loseMin, f1_local10.loseMax )
			end
			table.insert( f1_local2, Engine.GetPlayerDataEx( unpack( f1_local2 ) ) + f1_local0 )
		elseif f1_local10.datatype == "gametype" then
			table.insert( f1_local2, Engine.GetDvarString( "ui_gametype" ) )
		end
		Engine.SetPlayerDataEx( unpack( f1_local2 ) )
	end
	f1_local3 = math.random( 1, DataSources.alwaysLoaded.playerData.MP.common.round.awards:GetCountValue( f1_arg0 ) )
	for f1_local4 = 1, f1_local3, 1 do
		DataSources.alwaysLoaded.playerData.MP.common.round.awards[f1_local4 - 1].award:SetValue( f1_arg0, Engine.TableLookup( CSV.awardTable.file, CSV.awardTable.cols.id, math.random( 1, 100 ), CSV.awardTable.cols.ref ) )
		DataSources.alwaysLoaded.playerData.MP.common.round.awards[f1_local4 - 1].value:SetValue( f1_arg0, math.random( 1, 50 ) )
	end
	DataSources.alwaysLoaded.playerData.MP.common.round.awardCount:SetValue( f1_arg0, f1_local3 )
	PostGameFanfare:start()
end

local f0_local3 = function ( f2_arg0, f2_arg1, f2_arg2 )
	LUI.FlowManager.RequestAddMenu( "MatchSimLoadoutSelect", true, f2_arg0 )
	for f2_local0 = 0, Engine.GetMaxControllerCount() - 1, 1 do
		if Engine.HasActiveLocalClient( f2_local0 ) then
			Engine.SetPlayerDataEx( f2_local0, CoD.StatsGroup.Ranked, "activeMissionComplete", f2_arg2 )
			if f2_arg2 > -1 then
				DataSources.alwaysLoaded.playerData.MP.ranked.missionsCompleted:SetValue( f2_local0, DataSources.alwaysLoaded.playerData.MP.ranked.missionsCompleted:GetValue( f2_local0 ) + 1 )
			end
		end
	end
	f0_local0 = f2_arg1
	local f2_local0 = math.random( 420, 720 )
	DebugPrint( "Sim Results" )
	DebugPrint( "-----------" )
	DebugPrint( "Time Played: " .. f2_local0 )
	DebugPrint( "Outcome: " .. f0_local0 )
	DebugPrint( "Tier: " .. f2_arg2 )
	DebugPrint( "-----------" )
	MissionDirector.SetFlowState( MissionDirector.FlowState.PRE_INIT )
	for f2_local1 = 0, Engine.GetMaxControllerCount() - 1, 1 do
		if Engine.HasActiveLocalClient( f2_local1 ) then
			Contracts.RunEndOfMatchLogic( f2_local1 )
			MissionDirector.PostGame( f2_local1, f2_local0, f0_local0 )
		end
	end
	for f2_local1 = 0, Engine.GetMaxControllerCount() - 1, 1 do
		if Engine.HasActiveLocalClient( f2_local1 ) then
			Contracts.RunPostMatchFrontEndLogic( f2_local1 )
			MissionDirector.HandlePostGame( f2_local1 )
		end
	end
end

local f0_local4 = function ( f3_arg0, f3_arg1 )
	DebugPrint( "Win Chosen" )
	f0_local3( f3_arg1.controller, 1, -1 )
end

local f0_local5 = function ( f4_arg0, f4_arg1 )
	DebugPrint( "Win Complete Chosen" )
	f0_local3( f4_arg1.controller, 1, 0 )
end

local f0_local6 = function ( f5_arg0, f5_arg1 )
	DebugPrint( "Win Bronze" )
	f0_local3( f5_arg1.controller, 1, 1 )
end

local f0_local7 = function ( f6_arg0, f6_arg1 )
	DebugPrint( "Win Silver" )
	f0_local3( f6_arg1.controller, 1, 2 )
end

local f0_local8 = function ( f7_arg0, f7_arg1 )
	DebugPrint( "Win Gold" )
	f0_local3( f7_arg1.controller, 1, 3 )
end

local f0_local9 = function ( f8_arg0, f8_arg1 )
	DebugPrint( "Lose Chosen" )
	f0_local3( f8_arg1.controller, 0, -1 )
end

local f0_local10 = function ( f9_arg0, f9_arg1 )
	DebugPrint( "Lose Complete Chosen" )
	f0_local3( f9_arg1.controller, 0, 0 )
end

local f0_local11 = function ( f10_arg0, f10_arg1 )
	DebugPrint( "Lose Bronze" )
	f0_local3( f10_arg1.controller, 0, 1 )
end

local f0_local12 = function ( f11_arg0, f11_arg1 )
	DebugPrint( "Lose Silver" )
	f0_local3( f11_arg1.controller, 0, 2 )
end

local f0_local13 = function ( f12_arg0, f12_arg1 )
	DebugPrint( "Lose Gold" )
	f0_local3( f12_arg1.controller, 0, 3 )
end

local f0_local14 = function ( f13_arg0, f13_arg1 )
	DebugPrint( "Play With Bots" )
	MissionDirector.FillWithBotsAndStartMission( f13_arg1.controller )
end

MatchSimulator.loadoutSelected = function ( f14_arg0 )
	for f14_local0 = 0, Engine.GetMaxControllerCount() - 1, 1 do
		if Engine.HasActiveLocalClient( f14_local0 ) then
			f0_local2( f14_local0 )
		end
	end
end

MatchSimulator.ShowGameOverScreen = function ()
	local f15_local0 = Lobby.GetPrivatePartyHostControllerIndex()
	assert( f15_local0 )
	LUI.FlowManager.RequestPopupMenu( self, "MatchSimOutcomeSelectorPopup", true, f15_local0, false, {
		playAction = f0_local14,
		winAction = f0_local4,
		winCompleteAction = f0_local5,
		winTier1Action = f0_local6,
		winTier2Action = f0_local7,
		winTier3Action = f0_local8,
		loseAction = f0_local9,
		loseCompleteAction = f0_local10,
		loseTier1Action = f0_local11,
		loseTier2Action = f0_local12,
		loseTier3Action = f0_local13
	} )
end

