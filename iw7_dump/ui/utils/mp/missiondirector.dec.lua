MissionDirector = {
	missionsPlaylistCategory = 0,
	missionsPlaylistIndex = 0,
	MPMissionID = 0,
	ZombiesMissionID = 1,
	InvalidTeamID = -1,
	teamNoneValue = "None",
	teamRnGValue = "RnG",
	teamPromoValue = "Promo",
	FlowState = {
		PRE_INIT = 0,
		MISSION_ACTIVE = 1,
		MISSION_OVER = 2
	},
	SetActiveMissionTeam = function ( f1_arg0, f1_arg1 )
		if Engine.GetDvarBool( "enable_analytics_log" ) then
			local f1_local0 = f1_arg1
			local f1_local1 = MissionDirector.GetMissionXP( f1_arg0, f1_local0 )
			local f1_local2 = MissionDirector.GetMissionTeamLevel( f1_arg0, f1_local0 )
			local f1_local3 = MissionDirector.GetActiveMissionTeam( f1_arg0 )
			Engine.BBPrint( "analytics_mp_mission_team_select", "mission_team_selected %d missions_completed %d mission_team_rank %d previous_mission_team %d previous_missions_completed %d previous_mission_team_rank %d", f1_local0, f1_local1, f1_local2, f1_local3, MissionDirector.GetMissionXP( f1_arg0, f1_local3 ), MissionDirector.GetMissionTeamLevel( f1_arg0, f1_local3 ) )
		end
		Engine.SetPlayerDataEx( f1_arg0, CoD.StatsGroup.Ranked, "activeMissionTeam", f1_arg1 )
		Engine.SetPlayerDataEx( f1_arg0, CoD.StatsGroup.Ranked, "missionTeams", f1_arg1, "hasJoinedBefore", true )
		Engine.Exec( "uploadstats", f1_arg0 )
	end,
	GetActiveMissionTeam = function ( f2_arg0 )
		if Engine.IsAliensMode() then
			return 0
		else
			return DataSources.alwaysLoaded.playerData.MP.ranked.activeMissionTeam:GetValue( f2_arg0 )
		end
	end,
	GetMissionXP = function ( f3_arg0, f3_arg1 )
		return Engine.GetPlayerDataEx( f3_arg0, CoD.StatsGroup.Ranked, "missionTeams", f3_arg1, "missionXP" )
	end,
	GetMissionTeamLevel = function ( f4_arg0, f4_arg1 )
		return Engine.GetPlayerDataEx( f4_arg0, CoD.StatsGroup.Ranked, "missionTeams", f4_arg1, "level" )
	end,
	GetMissionInSlot = function ( f5_arg0, f5_arg1, f5_arg2 )
		return DataSources.alwaysLoaded.playerData.MP.ranked.missionTeams[f5_arg1].currentMission[f5_arg2]:GetValue( f5_arg0 )
	end,
	GetActiveMission = function ( f6_arg0, f6_arg1 )
		return DataSources.alwaysLoaded.playerData.MP.ranked.missionTeams[f6_arg1].currentMission[MissionDirector.GetActiveMissionSlot( f6_arg0, f6_arg1 )]:GetValue( f6_arg0 )
	end,
	GetActiveMissionSlot = function ( f7_arg0, f7_arg1 )
		return DataSources.alwaysLoaded.playerData.MP.ranked.missionTeams[f7_arg1].activeSlot:GetValue( f7_arg0 )
	end,
	SetActiveMissionSlot = function ( f8_arg0, f8_arg1, f8_arg2 )
		DataSources.alwaysLoaded.playerData.MP.ranked.missionTeams[f8_arg1].activeSlot:SetValue( f8_arg0, f8_arg2 )
	end,
	SetCurrentPlaylist = function ( f9_arg0, f9_arg1 )
		MissionDirector.missionsPlaylistCategory = f9_arg0
		MissionDirector.missionsPlaylistIndex = f9_arg1
	end,
	GetMaxTeamLevel = function ( f10_arg0, f10_arg1 )
		for f10_local0 = Engine.TableGetRowCount( CSV.missionTeamRanks.file ), 0, -1 do
			if Engine.TableLookupByRow( CSV.missionTeamRanks.file, f10_local0, CSV.missionTeamRanks.cols.xpToNextLevel[f10_arg1 + 1] ) ~= "" then
				return f10_local0 + 1
			end
		end
	end,
	GetMissionXPToLevelUp = function ( f11_arg0, f11_arg1, f11_arg2 )
		local f11_local0 = MissionDirector.GetMaxTeamLevel( f11_arg0, f11_arg1 )
		if f11_local0 <= f11_arg2 then
			f11_arg2 = f11_local0
		end
		local f11_local1 = Engine.TableLookupGetRowNum( CSV.missionTeamRanks.file, CSV.missionTeamRanks.cols.level, f11_arg2 )
		if not f11_local1 or f11_local1 < 0 then
			return 0
		else
			return tonumber( Engine.TableLookupByRow( CSV.missionTeamRanks.file, f11_local1, CSV.missionTeamRanks.cols.xpToNextLevel[f11_arg1 + 1] ) )
		end
	end,
	GetMissionXPToNextLevel = function ( f12_arg0, f12_arg1 )
		return MissionDirector.GetMissionXPToLevelUp( f12_arg0, f12_arg1, MissionDirector.GetMissionTeamLevel( f12_arg0, f12_arg1 ) )
	end,
	Setup = function ( f13_arg0 )
		if DataSources.alwaysLoaded.playerData.MP.ranked.missionsInitialized:GetValue( f13_arg0 ) == 0 then
			for f13_local0 = 0, Engine.TableGetRowCount( CSV.missionTeams.file ) - 1, 1 do
				local f13_local3 = tonumber( Engine.TableLookupByRow( CSV.missionTeams.file, f13_local0, CSV.missionTeams.cols.index ) )
				DataSources.alwaysLoaded.playerData.MP.ranked.missionTeams[f13_local3].currentMission[0]:SetValue( f13_arg0, MissionDirector.GetDefaultMissionForTeam( f13_local3 ) )
			end
			DataSources.alwaysLoaded.playerData.MP.ranked.missionsInitialized:SetValue( f13_arg0, 1 )
		end
	end,
	GetDefaultMissionForTeam = function ( f14_arg0 )
		local f14_local0 = Engine.TableLookup( CSV.intelChallenges.file, CSV.intelChallenges.cols.teamDefault, f14_arg0, CSV.intelChallenges.cols.id )
		if not f14_local0 or f14_local0 == "" then
			return 0
		else
			return tonumber( f14_local0 )
		end
	end,
	BuildMissionList = function ( f15_arg0, f15_arg1 )
		local f15_local0 = MissionDirector.GetMissionTeamLevel( f15_arg0, f15_arg1 )
		local f15_local1 = {}
		for f15_local2 = 0, MissionDirector.GetNumMissionSlots( f15_arg0, f15_arg1 ) - 1, 1 do
			f15_local1[DataSources.alwaysLoaded.playerData.MP.ranked.missionTeams[f15_arg1].currentMission[f15_local2]:GetValue( f15_arg0 )] = true
		end
		local f15_local2 = Engine.IsUnlocked( f15_arg0, "missionTeam", "advanced_missions_" .. f15_arg1 )
		local f15_local3 = {}
		for f15_local4 = 0, Engine.TableGetRowCount( CSV.intelChallenges.file ), 1 do
			local f15_local7 = Engine.TableLookupByRow( CSV.intelChallenges.file, f15_local4, CSV.intelChallenges.cols.unitIDs )
			local f15_local8 = {}
			for f15_local12 in string.gmatch( f15_local7, "%d" ) do
				f15_local8[tonumber( f15_local12 )] = true
			end
			if f15_local8[f15_arg1] then
				f15_local9 = tonumber( Engine.TableLookupByRow( CSV.intelChallenges.file, f15_local4, CSV.intelChallenges.cols.id ) )
				if tonumber( Engine.TableLookupByRow( CSV.intelChallenges.file, f15_local4, CSV.intelChallenges.cols.killSwitch ) ) == 0 and f15_local1[f15_local9] == nil then
					f15_local11 = Engine.TableLookupByRow( CSV.intelChallenges.file, f15_local4, CSV.intelChallenges.cols.starterTeam )
					f15_local12 = false
					if f15_local11 and f15_local11 ~= "" then
						f15_local12 = tonumber( f15_local11 ) == f15_arg1
					end
					if (f15_local12 or f15_local2) and MissionDirector.AreMissionItemsUnlocked( f15_arg0, f15_local9 ) then
						table.insert( f15_local3, f15_local9 )
					end
				end
			end
		end
		return f15_local3
	end,
	AreMissionItemsUnlocked = function ( f16_arg0, f16_arg1 )
		for f16_local4, f16_local5 in pairs( CSV.intelChallenges.cols.unlocks ) do
			local f16_local6 = Engine.TableLookup( CSV.intelChallenges.file, CSV.intelChallenges.cols.id, f16_arg1, f16_local5.category )
			if f16_local6 ~= "" then
				local f16_local3 = Engine.TableLookup( CSV.intelChallenges.file, CSV.intelChallenges.cols.id, f16_arg1, f16_local5.item )
				if f16_local3 ~= "" then
					return Engine.IsUnlocked( f16_arg0, f16_local6, f16_local3 )
				end
			end
		end
		return true
	end,
	GenerateMission = function ( f17_arg0, f17_arg1, f17_arg2 )
		local f17_local0 = DataSources.alwaysLoaded.playerData.MP.ranked.missionTeams[f17_arg1]
		local f17_local1 = MissionDirector.BuildMissionList( f17_arg0, f17_arg1 )
		local f17_local2 = nil
		if #f17_local1 == 0 then
			assert( false, "Not enough missions to choose from" )
			f17_local2 = MissionDirector.GetDefaultMissionForTeam( f17_arg1 )
		else
			f17_local2 = f17_local1[math.random( 1, #f17_local1 )]
		end
		f17_local0.currentMission[f17_arg2]:SetValue( f17_arg0, f17_local2 )
		Engine.SetDvarBool( "lui_mc_newMissionDelivered", true )
		Engine.Exec( "uploadstats", f17_arg0 )
	end,
	GetNumMissionSlotsFromLevel = function ( f18_arg0 )
		local f18_local0 = false
		local f18_local1 = Engine.TableGetRowCount( CSV.missionTeamTiers.file ) - 1
		for f18_local2 = 0, f18_local1, 1 do
			local f18_local5 = CSV.ReadRow( CSV.missionTeamTiers, f18_local2 )
			if f18_arg0 <= tonumber( f18_local5.requiredLevel ) then
				return tonumber( f18_local5.slots ), f18_local0
			end
		end
		f18_local0 = true
		local f18_local2 = CSV.ReadRow( CSV.missionTeamTiers, f18_local1 )
		return tonumber( f18_local2.slots ), f18_local0
	end,
	GetNumMissionSlots = function ( f19_arg0, f19_arg1 )
		return MissionDirector.GetNumMissionSlotsFromLevel( MissionDirector.GetMissionTeamLevel( f19_arg0, f19_arg1 ) )
	end,
	GetRoundXP = function ( f20_arg0, f20_arg1, f20_arg2, f20_arg3 )
		local f20_local0 = 0
		if MissionDirector.GetMaxTeamLevel( f20_arg0, f20_arg2 ) <= MissionDirector.GetMissionTeamLevel( f20_arg0, f20_arg2 ) then
			return 0
		end
		local f20_local1 = 0
		if f20_arg3 == "infect" then
			f20_local1 = 334
		elseif f20_arg3 == "gun" then
			f20_local1 = 500
		else
			f20_local1 = 1000
		end
		if f20_arg1 == -1 then
			f20_local1 = f20_local1 + 0
		elseif f20_arg1 == 0 then
			f20_local1 = f20_local1 + 250
		elseif f20_arg1 == 1 then
			f20_local1 = f20_local1 + 500
		elseif f20_arg1 == 2 then
			f20_local1 = f20_local1 + 750
		elseif f20_arg1 == 3 then
			f20_local1 = f20_local1 + 1000
		else
			assert( false, "Tier undefined for Misson Reward" )
		end
		f20_local1 = f20_local1 + Contracts.GetLastMatchMissionTeamXP( f20_arg0 )
		local f20_local2 = Engine.GetDvarInt( "online_mp_missionteam_xpscale" )
		local f20_local3 = Lobby.IsNotAloneInPrivateParty()
		local f20_local4 = Engine.GetDvarInt( "online_mp_party_missionteam_xpscale" )
		if f20_local2 > 1 then
			f20_local1 = f20_local1 * f20_local2
		elseif f20_local4 > 1 and f20_local3 == true then
			f20_local1 = f20_local1 * f20_local4
		end
		return f20_local1
	end,
	GetPostMatchMissionXP = function ( f21_arg0, f21_arg1 )
		local f21_local0 = MissionDirector.GetMissionXP( f21_arg0, f21_arg1 )
		local f21_local1 = Engine.GetPlayerDataEx( f21_arg0, CoD.StatsGroup.Ranked, "activeMissionComplete" )
		local f21_local2 = MissionDirector.GetRoundXP( f21_arg0, f21_local1, f21_arg1, DataSources.alwaysLoaded.playerData.MP.common.round.gameMode:GetValue( f21_arg0 ) )
		Engine.SetDvarInt( "lui_mc_lastMissionCompletionTier", f21_local1 )
		return f21_local0 + f21_local2
	end,
	GiveRewards = function ( f22_arg0, f22_arg1 )
		local f22_local0 = MissionDirector.GetPostMatchMissionXP( f22_arg0, f22_arg1 )
		local f22_local1 = Engine.GetPlayerDataEx( f22_arg0, CoD.StatsGroup.Ranked, "activeMissionComplete" )
		local f22_local2 = MissionDirector.GetRoundXP( f22_arg0, f22_local1, f22_arg1, DataSources.alwaysLoaded.playerData.MP.common.round.gameMode:GetValue( f22_arg0 ) )
		Engine.SetPlayerDataEx( f22_arg0, CoD.StatsGroup.Ranked, "missionTeams", f22_arg1, "missionXP", f22_local0 )
		DataSources.frontEnd.MP.conquest.round.missionXp:SetValue( f22_arg0, f22_local2 )
		DataSources.frontEnd.MP.conquest.round.tierCompleted:SetValue( f22_arg0, f22_local1 )
		local f22_local3 = MissionDirector.GetMissionTeamLevel( f22_arg0, f22_arg1 )
		local f22_local4 = MissionDirector.GetMaxTeamLevel( f22_arg0, f22_arg1 )
		if f22_local3 < f22_local4 then
			local f22_local5 = MissionDirector.GetMissionXPToNextLevel( f22_arg0, f22_arg1 )
			while f22_local5 <= f22_local0 and f22_local3 < f22_local4 do
				local f22_local6 = MissionDirector.GetNumMissionSlots( f22_arg0, f22_arg1 )
				Engine.SetPlayerDataEx( f22_arg0, CoD.StatsGroup.Ranked, "missionTeams", f22_arg1, "level", f22_local3 + 1 )
				f22_local0 = f22_local0 - f22_local5
				if f22_local4 <= f22_local3 + 1 then
					f22_local0 = 0
				end
				Engine.SetPlayerDataEx( f22_arg0, CoD.StatsGroup.Ranked, "missionTeams", f22_arg1, "missionXP", f22_local0 )
				local f22_local7 = MissionDirector.GetNumMissionSlots( f22_arg0, f22_arg1 )
				if f22_local6 < f22_local7 then
					for f22_local8 = f22_local6, f22_local7 - 1, 1 do
						MissionDirector.GenerateMission( f22_arg0, f22_arg1, f22_local8 )
					end
				end
				f22_local5 = MissionDirector.GetMissionXPToNextLevel( f22_arg0, f22_arg1 )
				f22_local3 = f22_local3 + 1
			end
		end
		if Engine.GetDvarBool( "enable_analytics_log" ) and Engine.InFrontend() then
			Engine.BBPrint( "analytics_mp_mission_team_xp", "mission_team_level %d current_player_level %d xp_gained %d mission_team %d crypto_keys_owned %d", MissionDirector.GetMissionTeamLevel( f22_arg0, f22_arg1 ), Engine.GetRankForXP( Engine.GetPlayerDataEx( f22_arg0, CoD.StatsGroup.Ranked, "progression", "playerLevel", "xp" ) ), f22_local0, f22_arg1, DataSources.frontEnd.MP.commerce.inGameCurrency:GetValue( f22_arg0 ) )
		end
	end,
	PlayMission = function ( f23_arg0 )
		Rewards.StartMission( f23_arg0, MissionDirector.MPMissionID, MissionDirector.GetActiveMissionTeam( f23_arg0 ) )
	end,
	PostGame = function ( f24_arg0, f24_arg1, f24_arg2 )
		local f24_local0 = MissionDirector.GetActiveMissionTeam( f24_arg0 )
		local f24_local1 = MissionDirector.GetMissionTeamLevel( f24_arg0, f24_local0 )
		local f24_local2 = MissionDirector.GetPostMatchMissionXP( f24_arg0, f24_local0 )
		local f24_local3 = MissionDirector.GetMissionXPToNextLevel( f24_arg0, f24_local0 )
		if f24_local3 <= f24_local2 then
			f24_local1 = f24_local1 + 1
		end
		DebugPrint( "ControllerIndex " .. f24_arg0 )
		DebugPrint( "missionXP " .. f24_local2 )
		DebugPrint( "xpToNextLevel " .. f24_local3 )
		DebugPrint( "TeamID " .. f24_local0 )
		DebugPrint( "Level " .. f24_local1 )
		local f24_local4 = false
		if f24_local1 > 0 then
			local f24_local5 = 0
			repeat
				local f24_local6 = Engine.TableLookupByRow( "mp/loot/iw7_mission_loot_master.csv", f24_local0, f24_local5 )
				DebugPrint( "Checking Level " .. f24_local5 + 1 )
				DebugPrint( "Checking Column " .. f24_local5 )
				DebugPrint( "Checking ID " .. f24_local6 )
				if f24_local6 == nil or string.len( f24_local6 ) == 0 then
					DebugPrint( "No Loot ID. Skipping." )
					break
				elseif Loot.IsOwned( f24_arg0, f24_local6 ) == 0 then
					DebugPrint( "Needs Loot " .. f24_local6 )
					f24_local4 = true
					break
				end
				f24_local5 = f24_local5 + 1
			until f24_local1 <= f24_local5
		end
		DebugPrint( "Mission - PostGame" )
		DebugPrint( "------------------" )
		DebugPrint( "Time Played: " .. f24_arg1 )
		DebugPrint( "Result: " .. f24_arg2 )
		if f24_local4 then
			DebugPrint( "Needs Loot: True" )
		else
			DebugPrint( "Needs Loot: False" )
		end
		DebugPrint( "------------------" )
		Rewards.EndMission( f24_arg0, f24_arg1, f24_local4, f24_local0, f24_arg2 )
	end,
	HandlePostGame = function ( f25_arg0 )
		local f25_local0 = MissionDirector.GetActiveMissionTeam( f25_arg0 )
		local f25_local1 = MissionDirector.GetActiveMissionSlot( f25_arg0, f25_local0 )
		MissionDirector.GiveRewards( f25_arg0, f25_local0 )
		Engine.SetPlayerDataEx( f25_arg0, CoD.StatsGroup.Ranked, "activeMissionComplete", -1 )
		MissionDirector.GenerateMission( f25_arg0, f25_local0, f25_local1 )
		Engine.ExecNow( "uploadstats", f25_arg0 )
	end,
	FillWithBotsAndStartMission = function ( f26_arg0 )
		Engine.SetDvarBool( "single_player_mp", true )
		Playlist.DoAction( MissionDirector.missionsPlaylistCategory, MissionDirector.missionsPlaylistIndex )
	end
}
local f0_local0 = function ( f27_arg0, f27_arg1 )
	return Engine.Localize( Engine.TableLookup( CSV.intelChallenges.file, CSV.intelChallenges.cols.id, f27_arg0, CSV.intelChallenges.cols.uidesc ) )
end

local f0_local1 = function ( f28_arg0, f28_arg1 )
	local f28_local0 = Engine.TableLookup( CSV.intelChallenges.file, CSV.intelChallenges.cols.id, f28_arg0, CSV.intelChallenges.cols.target1 )
	local f28_local1 = nil
	if tonumber( f28_local0 ) == 1 then
		return Engine.Localize( Engine.TableLookup( CSV.intelChallenges.file, CSV.intelChallenges.cols.id, f28_arg0, CSV.intelChallenges.cols.uiSingularDesc ) )
	else
		return LocalizeIntoString( f28_local0, Engine.TableLookup( CSV.intelChallenges.file, CSV.intelChallenges.cols.id, f28_arg0, CSV.intelChallenges.cols.uiPluralDesc ) )
	end
end

local f0_local2 = function ( f29_arg0, f29_arg1 )
	return Engine.TableLookup( CSV.intelChallenges.file, CSV.intelChallenges.cols.id, f29_arg0, CSV.intelChallenges.cols.target1 )
end

local f0_local3 = function ( f30_arg0, f30_arg1 )
	return Engine.TableLookup( CSV.intelChallenges.file, CSV.intelChallenges.cols.id, f30_arg0, CSV.intelChallenges.cols.target2 )
end

local f0_local4 = function ( f31_arg0, f31_arg1 )
	return Engine.TableLookup( CSV.intelChallenges.file, CSV.intelChallenges.cols.id, f31_arg0, CSV.intelChallenges.cols.target3 )
end

local f0_local5 = function ( f32_arg0, f32_arg1 )
	return Engine.TableLookup( CSV.intelChallenges.file, CSV.intelChallenges.cols.id, f32_arg0, CSV.intelChallenges.cols.target4 )
end

local f0_local6 = function ( f33_arg0, f33_arg1 )
	return Engine.TableLookup( CSV.intelChallenges.file, CSV.intelChallenges.cols.id, f33_arg0, CSV.intelChallenges.cols.unitMeasure )
end

MissionDirector.GetMissionDataSourcesForTeam = function ( f34_arg0, f34_arg1, f34_arg2 )
	local f34_local0 = DataSources.alwaysLoaded.playerData.MP.ranked.missionTeams[f34_arg1].activeSlot
	local f34_local1 = LUI.DataSourceFromList.new( MissionDirector.GetNumMissionSlots( f34_arg2, f34_arg1 ) )
	f34_local1.MakeDataSourceAtIndex = function ( f35_arg0, f35_arg1, f35_arg2 )
		local f35_local0 = LUI.DataSourceInGlobalModel.new( f34_arg0 .. ".team." .. f34_arg1 .. ".mission." .. f35_arg1 )
		local f35_local1 = DataSources.alwaysLoaded.playerData.MP.ranked.missionTeams[f34_arg1].currentMission[f35_arg1]
		local f35_local2 = f35_local1:FilterTo( f35_local0, "nameDetailed", f0_local1 )
		return {
			name = f35_local1:FilterTo( f35_local0, "name", f0_local0 ),
			nameDetailed = f35_local2,
			index = f35_local1,
			listIndex = f35_arg1,
			description = f35_local2,
			active = f34_local0:FilterTo( f35_local0, "active", function ( f36_arg0, f36_arg1 )
				return f36_arg0 == f35_arg1
			end
			 ),
			target = f35_local1:FilterTo( f35_local0, "target", f0_local2 ),
			bonus1 = f35_local1:FilterTo( f35_local0, "bonus1", f0_local3 ),
			bonus2 = f35_local1:FilterTo( f35_local0, "bonus2", f0_local4 ),
			bonus3 = f35_local1:FilterTo( f35_local0, "bonus3", f0_local5 ),
			unitOfMeasure = f35_local1:FilterTo( f35_local0, "unitOfMeasure", f0_local6 )
		}
	end
	
	return f34_local1
end

MissionDirector.GetMissionTeamName = function ( f37_arg0 )
	return Engine.Localize( Engine.TableLookup( CSV.missionTeams.file, CSV.missionTeams.cols.index, f37_arg0, CSV.missionTeams.cols.name ) )
end

MissionDirector.GetMissionTeamDesc = function ( f38_arg0 )
	return Engine.Localize( Engine.TableLookup( CSV.missionTeams.file, CSV.missionTeams.cols.index, f38_arg0, CSV.missionTeams.cols.desc ) )
end

MissionDirector.GetMissionTeamImage = function ( f39_arg0 )
	return Engine.TableLookup( CSV.missionTeams.file, CSV.missionTeams.cols.index, f39_arg0, CSV.missionTeams.cols.image )
end

MissionDirector.GetMissionTeamImageGrayScale = function ( f40_arg0 )
	return Engine.TableLookup( CSV.missionTeams.file, CSV.missionTeams.cols.index, f40_arg0, CSV.missionTeams.cols.imageGrayscale )
end

MissionDirector.GetMissionTeamColor = function ( f41_arg0 )
	local f41_local0 = SWATCHES.MissionTeams[Engine.TableLookup( CSV.missionTeams.file, CSV.missionTeams.cols.index, f41_arg0, CSV.missionTeams.cols.color )]
	assert( f41_local0 )
	return GetIntForColor( f41_local0 )
end

MissionDirector.GetMissionTeamHeadquarters = function ( f42_arg0 )
	return Engine.TableLookup( CSV.missionTeams.file, CSV.missionTeams.cols.index, f42_arg0, CSV.missionTeams.cols.headquarters )
end

MissionDirector.GetMissionTeamCommanderHeadshot = function ( f43_arg0 )
	return Engine.TableLookup( CSV.missionTeams.file, CSV.missionTeams.cols.index, f43_arg0, CSV.missionTeams.cols.commanderHeadshot )
end

MissionDirector.GetMissionTeamMusic = function ( f44_arg0 )
	local f44_local0 = Engine.TableLookup( CSV.missionTeams.file, CSV.missionTeams.cols.index, f44_arg0, CSV.missionTeams.cols.music )
	assert( #f44_local0 > 0 )
	return f44_local0
end

MissionDirector.GetMissionTeamContractImage = function ( f45_arg0 )
	local f45_local0 = Engine.TableLookup( CSV.missionTeams.file, CSV.missionTeams.cols.index, f45_arg0, CSV.missionTeams.cols.contractImage )
	assert( #f45_local0 > 0 )
	return f45_local0
end

MissionDirector.GetActiveMissionTeamTierIcon = function ( f46_arg0, f46_arg1 )
	local f46_local0 = MissionDirector.GetActiveMissionTeam( f46_arg0 )
	local f46_local1 = CSV.missionTeams.cols.challengeTier4
	if f46_arg1 == 0 then
		f46_local1 = CSV.missionTeams.cols.challengeTier1
	elseif f46_arg1 == 1 then
		f46_local1 = CSV.missionTeams.cols.challengeTier2
	elseif f46_arg1 == 2 then
		f46_local1 = CSV.missionTeams.cols.challengeTier3
	end
	return Engine.TableLookup( CSV.missionTeams.file, CSV.missionTeams.cols.index, f46_local0, f46_local1 )
end

Cac.GetMissionTeamUnlockRank = function ( f47_arg0 )
	return Engine.TableLookup( CSV.missionTeamUnlockTable.file, CSV.missionTeamUnlockTable.cols.index, f47_arg0, CSV.missionTeamUnlockTable.cols.unlockRank )
end

MissionDirector.GetMissionTeamCompletedTotal = function ( f48_arg0, f48_arg1 )
	local f48_local0 = DataSources.alwaysLoaded.playerData.MP.ranked.missionTeamPerformanceData[f48_arg1]
	return 0 + f48_local0.completed:GetValue( f48_arg0 ) + f48_local0.bronze:GetValue( f48_arg0 ) + f48_local0.silver:GetValue( f48_arg0 ) + f48_local0.gold:GetValue( f48_arg0 )
end

MissionDirector.GetMissionTeamUnlockText = function ( f49_arg0 )
	return Engine.Localize( Engine.TableLookup( CSV.missionTeamUnlockTable.file, CSV.missionTeamUnlockTable.cols.index, f49_arg0, CSV.missionTeamUnlockTable.cols.ui_text ), Engine.TableLookup( CSV.missionTeamUnlockTable.file, CSV.missionTeamUnlockTable.cols.index, f49_arg0, CSV.missionTeamUnlockTable.cols.ui_text_var1 ) )
end

MissionDirector.GetMissionTeamDisabled = function ( f50_arg0, f50_arg1 )
	return not Engine.IsUnlocked( f50_arg0, "missionTeam", f50_arg1 )
end

MissionDirector.GetMissionTeamMovie = function ( f51_arg0 )
	return Engine.TableLookup( CSV.missionTeams.file, CSV.missionTeams.cols.index, f51_arg0, CSV.missionTeams.cols.movie )
end

MissionDirector.GetItemCardData = function ( f52_arg0 )
	local f52_local0 = Cac.GetMissionTeamUnlockRank( f52_arg0 )
	return {
		name = MissionDirector.GetMissionTeamName( f52_arg0 ),
		image = MissionDirector.GetMissionTeamImage( f52_arg0 ),
		desc = MissionDirector.GetMissionTeamDesc( f52_arg0 ),
		title = Engine.Localize( "LUA_MENU_MP_ITEM_CARD_TITLE_MISSION_TEAM" ),
		rank = Rank.GetRankDisplay( f52_local0 ),
		rankIcon = Rank.GetRankIcon( f52_local0, 0 ),
		rankName = Rank.GetShortRank( f52_local0 )
	}
end

MissionDirector.GetMissionTeamDataSources = function ( f53_arg0, f53_arg1, f53_arg2 )
	local f53_local0 = f53_arg1 .. ".team." .. f53_arg2
	local f53_local1 = MissionDirector.GetMissionTeamCompletedTotal( f53_arg0, f53_arg2 )
	local f53_local2 = MissionDirector.GetNumMissionSlots( f53_arg0, f53_arg2 )
	local f53_local3 = MissionDirector.GetMissionXP( f53_arg0, f53_arg2 )
	local f53_local4 = MissionDirector.GetMissionXPToNextLevel( f53_arg0, f53_arg2 )
	local f53_local5 = MissionDirector.GetMissionTeamDisabled( f53_arg0, f53_arg2 )
	local f53_local6 = tonumber( DataSources.alwaysLoaded.playerData.MP.ranked.missionTeams[f53_arg2].level:GetValue( f53_arg0 ) ) + 1
	local f53_local7 = LUI.DataSourceInGlobalModel.new( f53_local0 .. ".level" )
	f53_local7:SetValue( f53_arg0, f53_local6 )
	local f53_local8 = 0
	if f53_local4 > 0 then
		f53_local8 = f53_local3 / f53_local4
	end
	return {
		name = LUI.DataSourceInGlobalModel.new( f53_local0 .. ".name", MissionDirector.GetMissionTeamName( f53_arg2 ) ),
		desc = LUI.DataSourceInGlobalModel.new( f53_local0 .. ".desc", MissionDirector.GetMissionTeamDesc( f53_arg2 ) ),
		image = LUI.DataSourceInGlobalModel.new( f53_local0 .. ".image", MissionDirector.GetMissionTeamImage( f53_arg2 ) ),
		imageGrayscale = LUI.DataSourceInGlobalModel.new( f53_local0 .. ".imageGrayscale", MissionDirector.GetMissionTeamImageGrayScale( f53_arg2 ) ),
		color = LUI.DataSourceInGlobalModel.new( f53_local0 .. ".color", MissionDirector.GetMissionTeamColor( f53_arg2 ) ),
		headquarters = LUI.DataSourceInGlobalModel.new( f53_local0 .. ".headquarters", MissionDirector.GetMissionTeamHeadquarters( f53_arg2 ) ),
		commanderHeadshot = LUI.DataSourceInGlobalModel.new( f53_local0 .. ".commander", MissionDirector.GetMissionTeamCommanderHeadshot( f53_arg2 ) ),
		level = f53_local7,
		maxLevel = LUI.DataSourceInGlobalModel.new( f53_local0 .. ".maxLevel", MissionDirector.GetMaxTeamLevel( f53_arg0, f53_arg2 ) ),
		teamID = LUI.DataSourceInGlobalModel.new( f53_local0 .. ".teamID", f53_arg2 ),
		completedMissions = LUI.DataSourceInControllerModel.new( f53_local0 .. ".completedMissions", f53_local1 ),
		numMissions = LUI.DataSourceInControllerModel.new( f53_local0 .. ".numMissions", f53_local2 ),
		disabled = LUI.DataSourceInGlobalModel.new( f53_local0 .. ".disabled", f53_local5 ),
		missionXPToNextLevel = LUI.DataSourceInGlobalModel.new( f53_local0 .. ".missionXPToNextLevel", f53_local4 - f53_local3 ),
		missionXPFillPercent = LUI.DataSourceInGlobalModel.new( f53_local0 .. ".missionXPFillPercent", f53_local8 ),
		missionTeamUnlockDesc = LUI.DataSourceInGlobalModel.new( f53_local0 .. ".unlockDesc", MissionDirector.GetMissionTeamUnlockText( f53_arg2 ) )
	}
end

MissionDirector.GetOnboardingMissionOverride = function ( f54_arg0 )
	local f54_local0 = MissionDirector.onboardingMissions[DataSources.alwaysLoaded.playerData.MP.ranked.missionsCompleted:GetValue( f54_arg0 ) + 1]
	if f54_local0 then
		return f54_local0.missionIndex
	else
		return nil
	end
end

MissionDirector.HasEverBeenMember = function ( f55_arg0, f55_arg1 )
	return Engine.GetPlayerDataEx( f55_arg1, CoD.StatsGroup.Ranked, "missionTeams", f55_arg0, "hasJoinedBefore" ) or f55_arg0 == 0
end

MissionDirector.PlayMissionTeamVideo = function ( f56_arg0, f56_arg1, f56_arg2, f56_arg3 )
	LUI.FlowManager.RequestPopupMenu( nil, "MPFullScreenVideoOverlay", true, f56_arg1, nil, {
		videoRef = Engine.TableLookupByRow( CSV.missionTeams.file, f56_arg0, CSV.missionTeams.cols.introBink ),
		allowSkip = f56_arg2,
		doIntroFadeOut = false,
		doIntroFadeIn = false,
		doOutroFadeIn = true,
		doOutroFadeOut = true,
		fadeColor = COLORS.black,
		onCompletePlayback = f56_arg3 or nil
	}, nil, true, true )
end

MissionDirector.PlayTeamMusic = function ()
	if not Engine.IsCoreMode() then
		return 
	else
		local f57_local0 = Engine.GetFirstActiveController()
		assert( f57_local0 )
		local f57_local1 = MissionDirector.GetActiveMissionTeam( f57_local0 )
		assert( f57_local1 )
		Engine.PlayMusic( MissionDirector.GetMissionTeamMusic( f57_local1 ) )
	end
end

MissionDirector.GetFlowState = function ()
	return Engine.GetDvarInt( "active_mission_state" )
end

MissionDirector.SetFlowState = function ( f59_arg0 )
	Engine.SetDvarInt( "active_mission_state", f59_arg0 )
end

