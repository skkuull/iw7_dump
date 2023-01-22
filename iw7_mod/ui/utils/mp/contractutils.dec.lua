Contracts = {
	NUM_SLOTS = 2,
	AreContractsEnabled = function ()
		return Engine.GetDvarBool( "mission_team_contracts_enabled" )
	end,
	GetCurrentWeekID = function ()
		local f2_local0 = Rewards.GetMissionChallengeWeek()
		if Engine.IsDevelopmentBuild() then
			local f2_local1 = Engine.GetDvarInt( "contract_debug_week" )
			if f2_local1 ~= nil and f2_local1 >= 0 then
				f2_local0 = f2_local1
			end
		end
		local f2_local1 = Contracts.GetFinalCyclicWeek()
		if f2_local0 < f2_local1 then
			return f2_local0, 0
		else
			local f2_local2 = Contracts.GetFirstCyclicWeek()
			local f2_local3 = f2_local1 - f2_local2 + 1
			local f2_local4 = f2_local0 - f2_local2
			return f2_local4 % f2_local3 + f2_local2, math.floor( f2_local4 / f2_local3 )
		end
	end,
	GetFirstCyclicWeek = function ()
		local f3_local0 = tonumber( Engine.TableLookup( CSV.contractCalendar.file, CSV.contractCalendar.cols.cycleTag, "start", CSV.contractCalendar.cols.week ) )
		assert( f3_local0 ~= nil )
		return f3_local0
	end,
	GetFinalCyclicWeek = function ()
		local f4_local0 = tonumber( Engine.TableLookup( CSV.contractCalendar.file, CSV.contractCalendar.cols.cycleTag, "end", CSV.contractCalendar.cols.week ) )
		assert( f4_local0 ~= nil )
		return f4_local0
	end,
	HandleNewContracts = function ( f5_arg0 )
		if not Contracts.AreContractsEnabled() then
			return 
		elseif Contracts.AreContractsOutOfDate( f5_arg0 ) then
			Contracts.AssignNewContracts( f5_arg0 )
		end
	end,
	AssignNewContracts = function ( f6_arg0 )
		local f6_local0 = nil
		if Engine.IsAliensMode() then
			f6_local0 = DataSources.alwaysLoaded.playerData.CP.contracts
		else
			f6_local0 = DataSources.alwaysLoaded.playerData.MP.ranked.contracts
		end
		local f6_local1 = f6_local0.challenges:GetCountValue( f6_arg0 )
		local f6_local2, f6_local3 = Contracts.GetCurrentWeekID()
		for f6_local4 = 0, f6_local1 - 1, 1 do
			local f6_local7 = f6_local0.challenges[f6_local4]
			local f6_local8 = nil
			if Engine.IsAliensMode() then
				if f6_local4 == 0 then
					f6_local8 = tonumber( Engine.TableLookup( CSV.contractCalendar.file, CSV.contractCalendar.cols.week, f6_local2, CSV.contractCalendar.cols.team0 ) )
				else
					f6_local8 = Contracts.GetZombiesMaps( f6_local2, f6_local4 )
				end
			else
				f6_local8 = Contracts.GetMissionTeam( f6_local2, f6_local4 )
			end
			local f6_local9 = Contracts.GenerateContractChallengeID( f6_arg0, f6_local8, oldChallengeID )
			f6_local0.challengeUsage[f6_local9]:SetValue( f6_arg0, 1 )
			f6_local7.challengeID:SetValue( f6_arg0, f6_local9 )
			f6_local7.progress:SetValue( f6_arg0, 0 )
			f6_local7.completed:SetValue( f6_arg0, 0 )
			f6_local7.rewardGiven:SetValue( f6_arg0, 0 )
			f6_local7.rewardShown:SetValue( f6_arg0, 0 )
		end
		f6_local0.currentWeek:SetValue( f6_arg0, f6_local2 )
		f6_local0.currentWeekCycle:SetValue( f6_arg0, f6_local3 )
		ACTIONS.UploadStats( self, f6_arg0 )
		if Engine.IsDevelopmentBuild() and Engine.SetDvarInt( "ui_contract_force_reset", 0 ) then
			return true
		else
			
		end
	end,
	GenerateContractChallengeID = function ( f7_arg0, f7_arg1, f7_arg2 )
		local f7_local0 = nil
		if Engine.IsAliensMode() then
			f7_local0 = DataSources.alwaysLoaded.playerData.CP.contracts
		else
			f7_local0 = DataSources.alwaysLoaded.playerData.MP.ranked.contracts
		end
		local f7_local1 = Contracts.GetAllChallengesForTeam( f7_arg0, f7_arg1 )
		local f7_local2 = Contracts.SearchForUnusedChallengeID( f7_arg0, f7_arg1, f7_local1, f7_arg2 )
		if not f7_local2 then
			for f7_local3 = 1, #f7_local1, 1 do
				f7_local0.challengeUsage[f7_local1[f7_local3]]:SetValue( f7_arg0, 0 )
			end
			f7_local2 = Contracts.SearchForUnusedChallengeID( f7_arg0, f7_arg1, f7_local1, f7_arg2 )
			assert( f7_local2 ~= nil )
		end
		return f7_local2
	end,
	GetAllChallengesForTeam = function ( f8_arg0, f8_arg1 )
		local f8_local0 = Engine.TableGetRowCount( CSV.contractChallenges.file )
		local f8_local1 = {}
		for f8_local2 = 0, f8_local0 - 1, 1 do
			if tonumber( Engine.TableLookupByRow( CSV.contractChallenges.file, f8_local2, CSV.contractChallenges.cols.team ) ) == f8_arg1 and Engine.TableLookupByRow( CSV.contractChallenges.file, f8_local2, CSV.contractChallenges.cols.killSwitch ) == "" then
				table.insert( f8_local1, tonumber( Engine.TableLookupByRow( CSV.contractChallenges.file, f8_local2, CSV.contractChallenges.cols.index ) ) )
			end
		end
		return f8_local1
	end,
	SearchForUnusedChallengeID = function ( f9_arg0, f9_arg1, f9_arg2, f9_arg3 )
		local f9_local0 = nil
		if Engine.IsAliensMode() then
			f9_local0 = DataSources.alwaysLoaded.playerData.CP.contracts
		else
			f9_local0 = DataSources.alwaysLoaded.playerData.MP.ranked.contracts
		end
		local f9_local1 = #f9_arg2
		local f9_local2 = math.random( f9_local1 )
		for f9_local3 = 1, f9_local1, 1 do
			local f9_local6 = f9_local3
			local f9_local7 = f9_arg2[f9_local2]
			if f9_local0.challengeUsage[f9_local7]:GetValue( f9_arg0 ) == 0 and f9_local7 ~= f9_arg3 then
				return f9_local7
			end
			f9_local2 = f9_local2 + 1
			if f9_local1 < f9_local2 then
				f9_local2 = 1
			end
		end
		return nil
	end,
	AreContractsOutOfDate = function ( f10_arg0 )
		if Engine.IsDevelopmentBuild() and Engine.GetDvarInt( "ui_contract_force_reset" ) == 1 then
			return true
		end
		local f10_local0 = nil
		if Engine.IsAliensMode() then
			f10_local0 = DataSources.alwaysLoaded.playerData.CP.contracts
		else
			f10_local0 = DataSources.alwaysLoaded.playerData.MP.ranked.contracts
		end
		local f10_local1, f10_local2 = Contracts.GetCurrentWeekID()
		if f10_local0.currentWeek:GetValue( f10_arg0 ) ~= f10_local1 then
			return true
		elseif f10_local0.currentWeekCycle:GetValue( f10_arg0 ) ~= f10_local2 then
			return true
		end
		return false
	end,
	CheckCompletion = function ( f11_arg0, f11_arg1 )
		if Engine.IsDevelopmentBuild() and Engine.GetDvarInt( "contract_fake_complete" ) == 1 then
			return true
		end
		local f11_local0 = nil
		if Engine.IsAliensMode() then
			f11_local0 = DataSources.alwaysLoaded.playerData.CP.contracts
		else
			f11_local0 = DataSources.alwaysLoaded.playerData.MP.ranked.contracts
		end
		return f11_local0.challenges[f11_arg1].completed:GetValue( f11_arg0 ) == 1
	end,
	HasSeenContract = function ( f12_arg0, f12_arg1 )
		local f12_local0 = nil
		if Engine.IsAliensMode() then
			f12_local0 = DataSources.alwaysLoaded.playerData.CP.contracts
		else
			f12_local0 = DataSources.alwaysLoaded.playerData.MP.ranked.contracts
		end
		return f12_local0.challenges[f12_arg1].rewardShown:GetValue( f12_arg0 ) == 1
	end,
	SetHasSeenContract = function ( f13_arg0, f13_arg1, f13_arg2 )
		local f13_local0 = nil
		if Engine.IsAliensMode() then
			f13_local0 = DataSources.alwaysLoaded.playerData.CP.contracts
		else
			f13_local0 = DataSources.alwaysLoaded.playerData.MP.ranked.contracts
		end
		local f13_local1 = f13_local0.challenges[f13_arg1].rewardShown
		local f13_local2 = f13_local1
		f13_local1 = f13_local1.SetValue
		local f13_local3 = f13_arg0
		local f13_local4
		if f13_arg2 then
			f13_local4 = 1
			if not f13_local4 then
			
			else
				f13_local1( f13_local2, f13_local3, f13_local4 )
			end
		end
		f13_local4 = 0
	end,
	GetCurrentChallengeID = function ( f14_arg0, f14_arg1 )
		local f14_local0 = nil
		if Engine.IsAliensMode() then
			f14_local0 = DataSources.alwaysLoaded.playerData.CP.contracts
		else
			f14_local0 = DataSources.alwaysLoaded.playerData.MP.ranked.contracts
		end
		return f14_local0.challenges[f14_arg1].challengeID:GetValue( f14_arg0 )
	end,
	GetCurrentChallengeProgress = function ( f15_arg0, f15_arg1 )
		assert( Contracts.AreContractsOutOfDate( f15_arg0 ) == false )
		local f15_local0 = nil
		if Engine.IsAliensMode() then
			f15_local0 = DataSources.alwaysLoaded.playerData.CP.contracts
		else
			f15_local0 = DataSources.alwaysLoaded.playerData.MP.ranked.contracts
		end
		return f15_local0.challenges[f15_arg1].progress:GetValue( f15_arg0 )
	end,
	GetWeekRewardID = function ( f16_arg0, f16_arg1 )
		return tonumber( Engine.TableLookup( CSV.contractCalendar.file, CSV.contractCalendar.cols.week, f16_arg0, CSV.contractCalendar.cols.rewardStream0 + f16_arg1 ) )
	end,
	GetMissionTeam = function ( f17_arg0, f17_arg1 )
		return tonumber( Engine.TableLookup( CSV.contractCalendar.file, CSV.contractCalendar.cols.week, f17_arg0, CSV.contractCalendar.cols.team0 + f17_arg1 ) )
	end,
	GetZombiesMaps = function ( f18_arg0, f18_arg1 )
		local f18_local0 = Engine.IsMapPackOwned( 4 )
		local f18_local1 = Engine.IsMapPackOwned( 3 )
		local f18_local2 = Engine.IsMapPackOwned( 2 )
		local f18_local3 = Engine.IsMapPackOwned( 1 )
		local f18_local4 = CSV.contractCalendar.cols.pack0
		if f18_local0 and f18_local1 and f18_local2 and f18_local3 then
			f18_local4 = CSV.contractCalendar.cols.pack01234
		elseif not f18_local0 and f18_local1 and f18_local2 and f18_local3 then
			f18_local4 = CSV.contractCalendar.cols.pack0123
		elseif f18_local0 and not f18_local1 and f18_local2 and f18_local3 then
			f18_local4 = CSV.contractCalendar.cols.pack0124
		elseif f18_local0 and f18_local1 and not f18_local2 and f18_local3 then
			f18_local4 = CSV.contractCalendar.cols.pack0134
		elseif f18_local0 and f18_local1 and f18_local2 and not f18_local3 then
			f18_local4 = CSV.contractCalendar.cols.pack0234
		elseif not f18_local0 and not f18_local1 and f18_local2 and f18_local3 then
			f18_local4 = CSV.contractCalendar.cols.pack012
		elseif not f18_local0 and f18_local1 and not f18_local2 and f18_local3 then
			f18_local4 = CSV.contractCalendar.cols.pack013
		elseif f18_local0 and not f18_local1 and not f18_local2 and f18_local3 then
			f18_local4 = CSV.contractCalendar.cols.pack014
		elseif not f18_local0 and f18_local1 and not f18_local2 and not f18_local3 then
			f18_local4 = CSV.contractCalendar.cols.pack023
		elseif f18_local0 and not f18_local1 and f18_local2 and not f18_local3 then
			f18_local4 = CSV.contractCalendar.cols.pack024
		elseif f18_local0 and f18_local1 and not f18_local2 and not f18_local3 then
			f18_local4 = CSV.contractCalendar.cols.pack034
		elseif not f18_local0 and not f18_local1 and not f18_local2 and f18_local3 then
			f18_local4 = CSV.contractCalendar.cols.pack01
		elseif not f18_local0 and not f18_local1 and f18_local2 and not f18_local3 then
			f18_local4 = CSV.contractCalendar.cols.pack02
		elseif not f18_local0 and f18_local1 and not f18_local2 and not f18_local3 then
			f18_local4 = CSV.contractCalendar.cols.pack03
		elseif f18_local0 and not f18_local1 and not f18_local2 and not f18_local3 then
			f18_local4 = CSV.contractCalendar.cols.pack04
		else
			f18_local4 = CSV.contractCalendar.cols.pack0
		end
		return tonumber( Engine.TableLookup( CSV.contractCalendar.file, CSV.contractCalendar.cols.week, f18_arg0, f18_local4 ) )
	end,
	HasGivenReward = function ( f19_arg0, f19_arg1 )
		assert( Contracts.AreContractsOutOfDate( f19_arg0 ) == false )
		local f19_local0 = nil
		if Engine.IsAliensMode() then
			f19_local0 = DataSources.alwaysLoaded.playerData.CP.contracts
		else
			f19_local0 = DataSources.alwaysLoaded.playerData.MP.ranked.contracts
		end
		return f19_local0.challenges[f19_arg1].rewardGiven:GetValue( f19_arg0 ) == 1
	end,
	RunPreMatchLogic = function ( f20_arg0 )
		if not Contracts.AreContractsEnabled() then
			return 
		end
		local f20_local0 = Contracts.GetCurrentWeekID()
		Contracts.HandleNewContracts( f20_arg0 )
		for f20_local1 = 0, Contracts.NUM_SLOTS - 1, 1 do
			local f20_local4 = Contracts.GetWeekRewardID( f20_local0, f20_local1 )
			if not Contracts.IsRewardMissionTeamXP( f20_local4 ) then
				Rewards.StartContract( f20_arg0, f20_local4 )
			end
		end
		if Engine.IsDevelopmentBuild() then
			local f20_local1, f20_local2 = Contracts.GetCurrentWeekID()
			DebugPrint( "Starting Contracts for week #" .. f20_local1 .. " (Cycle# " .. f20_local2 .. ")" )
		end
	end,
	RunEndOfMatchLogic = function ( f21_arg0 )
		if not Contracts.AreContractsEnabled() then
			return 
		end
		local f21_local0 = nil
		if Engine.IsAliensMode() then
			f21_local0 = DataSources.alwaysLoaded.playerData.CP.contracts
		else
			f21_local0 = DataSources.alwaysLoaded.playerData.MP.ranked.contracts
		end
		local f21_local1 = f21_local0.currentWeek:GetValue( f21_arg0 )
		if not Engine.IsAliensMode() then
			Contracts.SetLastMatchMissionTeamXP( f21_arg0, 0 )
		end
		for f21_local2 = 0, Contracts.NUM_SLOTS - 1, 1 do
			local f21_local5 = Contracts.CheckCompletion( f21_arg0, f21_local2 )
			local f21_local6 = f21_local0.challenges[f21_local2].rewardGiven:GetValue( f21_arg0 ) == 1
			local f21_local7 = Contracts.GetWeekRewardID( f21_local1, f21_local2 )
			if f21_local5 and not f21_local6 then
				f21_local0.challenges[f21_local2].rewardGiven:SetValue( f21_arg0, 1 )
				Engine.ExecNow( "uploadstats", f21_arg0 )
				if Contracts.IsRewardMissionTeamXP( f21_local7 ) and Engine.IsCoreMode() then
					if Contracts.GetMissionTeam( f21_local1, f21_local2 ) == MissionDirector.GetActiveMissionTeam( f21_arg0 ) then
						Contracts.SetLastMatchMissionTeamXP( f21_arg0, Contracts.GetMissionTeamXPReward( f21_local7 ) )
					end
				end
				Rewards.EndContract( f21_arg0, f21_local7 )
			end
		end
	end,
	RunPostMatchFrontEndLogic = function ( f22_arg0 )
		if not Contracts.AreContractsEnabled() then
			return 
		end
		local f22_local0 = nil
		if Engine.IsAliensMode() then
			f22_local0 = DataSources.alwaysLoaded.playerData.CP.contracts
		else
			f22_local0 = DataSources.alwaysLoaded.playerData.MP.ranked.contracts
		end
		local f22_local1 = f22_local0.currentWeek:GetValue( f22_arg0 )
		local f22_local2 = false
		for f22_local3 = 0, Contracts.NUM_SLOTS - 1, 1 do
			if Contracts.CheckCompletion( f22_arg0, f22_local3 ) and not (f22_local0.challenges[f22_local3].rewardGiven:GetValue( f22_arg0 ) == 1) and Contracts.IsRewardMissionTeamXP( Contracts.GetWeekRewardID( f22_local1, f22_local3 ) ) and Contracts.GetMissionTeam( f22_local1, f22_local3 ) == MissionDirector.GetActiveMissionTeam( f22_arg0 ) then
				f22_local0.challenges[f22_local3].rewardGiven:SetValue( f22_arg0, 1 )
				f22_local2 = true
			end
		end
		if f22_local2 then
			ACTIONS.UploadStats( self, f22_arg0 )
		end
	end,
	IsRewardMissionTeamXP = function ( f23_arg0 )
		local f23_local0 = Contracts.GetMissionTeamXPReward( f23_arg0 )
		local f23_local1
		if f23_local0 == nil or f23_local0 <= 0 then
			f23_local1 = false
		else
			f23_local1 = true
		end
		return f23_local1
	end,
	GetMissionTeamXPReward = function ( f24_arg0 )
		return tonumber( Engine.TableLookup( CSV.lootMissionSetMaster.file, CSV.lootMissionSetMaster.cols.index, f24_arg0, CSV.lootMissionSetMaster.cols.MTXP ) )
	end,
	SetLastMatchMissionTeamXP = function ( f25_arg0, f25_arg1 )
		DataSources.alwaysLoaded.MP.contracts.postMatchMissionTeamXP:SetValue( f25_arg0, f25_arg1 )
	end,
	GetLastMatchMissionTeamXP = function ( f26_arg0 )
		return DataSources.alwaysLoaded.MP.contracts.postMatchMissionTeamXP:GetValue( f26_arg0 )
	end,
	GetContractData = function ( f27_arg0, f27_arg1, f27_arg2 )
		local f27_local0 = {
			challengeData = CSV.ReadRow( CSV.contractChallenges, Engine.TableLookupGetRowNum( CSV.contractChallenges.file, CSV.contractChallenges.cols.index, f27_arg1 ) ),
			index = f27_arg2,
			teamIndex = tonumber( f27_local0.challengeData.team )
		}
		if f27_local0.teamIndex == -1 then
			if Engine.IsAliensMode() then
				f27_local0.color = GetIntForColor( SWATCHES.Zombies.fateCardLightBar )
				f27_local0.teamImage = RegisterMaterial( "zm_character_willard" )
				f27_local0.type = Engine.Localize( "ZM_CONTRACTS_HEADER_ANY" )
			else
				f27_local0.type = Engine.Localize( "LUA_MENU_MP_JOINT_CONTRACT" )
				f27_local0.teamImage = RegisterMaterial( "render_weapon_slot_nrg_mp" )
			end
			f27_local0.desc = Engine.Localize( f27_local0.challengeData.desc, f27_local0.challengeData.target )
		else
			local f27_local1 = CSV.ReadRow( CSV.missionTeams, Engine.TableLookupGetRowNum( CSV.missionTeams.file, CSV.missionTeams.cols.index, f27_local0.teamIndex ) )
			f27_local0.teamImage = RegisterMaterial( f27_local1.image )
			f27_local0.teamName = f27_local1.name
			if Engine.IsAliensMode() then
				f27_local0.type = Engine.Localize( f27_local1.name )
			else
				f27_local0.type = Engine.Localize( "LUA_MENU_MP_TEAM_CONTRACT", f27_local1.name )
			end
			f27_local0.desc = Engine.Localize( f27_local0.challengeData.desc, f27_local0.challengeData.target, f27_local1.name )
			f27_local0.color = MissionDirector.GetMissionTeamColor( f27_local0.teamIndex )
			if Engine.IsAliensMode() then
				f27_local0.color = GetIntForColor( SWATCHES.Zombies.fateCardLightBar )
			end
			f27_local0.popupBackground = RegisterMaterial( f27_local1.popupBackground )
		end
		return f27_local0
	end
}
local f0_local0 = function ( f28_arg0, f28_arg1, f28_arg2 )
	local f28_local0
	if f28_arg1 then
		f28_local0 = "button_alt1"
		if not f28_local0 then
		
		else
			local f28_local1
			if f28_arg1 then
				f28_local1 = -5
				if not f28_local1 then
				
				else
					f28_arg0:AddButtonHelperTextToElement( f28_arg0.ButtonHelperBar, {
						helper_text = Engine.Localize( "LUA_MENU_MP_SWITCH_TO_TEAM", f28_arg2 ),
						button_ref = f28_local0,
						side = "left",
						priority = f28_local1,
						clickable = true
					} )
				end
			end
			f28_local1 = 0
		end
	end
	f28_local0 = "button_alt2"
end

Contracts.SetupContract = function ( f29_arg0, f29_arg1, f29_arg2, f29_arg3 )
	local f29_local0 = f29_arg1[f29_arg2 + 1]
	f29_local0:SetupContract( f29_arg3, Contracts.GetCurrentChallengeID( f29_arg3, f29_arg2 ), f29_arg2 )
	assert( f29_local0.contractData )
	local f29_local1 = tonumber( f29_local0.contractData.teamIndex )
	if Engine.IsCoreMode() and f29_local1 ~= -1 and not MissionDirector.GetMissionTeamDisabled( f29_arg3, f29_local1 ) then
		local f29_local2 = f29_arg2 == 0
		local f29_local3 = f29_local0.contractData.teamName
		local f29_local4
		if f29_local2 then
			f29_local4 = "button_alt1"
			if not f29_local4 then
			
			else
				if f29_local1 ~= MissionDirector.GetActiveMissionTeam( f29_arg3 ) then
					f0_local0( f29_arg0, f29_local2, f29_local3 )
				end
				assert( f29_arg0.bindButton )
				assert( f29_arg0.ButtonHelperBar )
				f29_arg0.bindButton:addEventHandler( f29_local4, function ( f30_arg0, f30_arg1 )
					if f29_local1 ~= MissionDirector.GetActiveMissionTeam( f29_arg3 ) then
						MissionDirector.SetActiveMissionTeam( f29_arg3, f29_local1 )
						if f29_arg0.MissionTeamInfo then
							f29_arg0.MissionTeamInfo:SetupMissionTeam( f29_arg3 )
						end
						f29_arg0:RemoveButtonHelperTextFromElement( f29_arg0.ButtonHelperBar, f29_local4, "left" )
						f29_local0.RequirementText:setText( Contracts.GetRequirementText( f29_local1, f29_arg2, f29_arg3 ) )
						local f30_local0 = 1 - f29_arg2
						local f30_local1 = f29_arg1[f30_local0 + 1]
						f30_local1.RequirementText:setText( Contracts.GetRequirementText( f30_local1.contractData.teamIndex, f30_local0, f29_arg3 ) )
						if Contracts.CanTeamSwitch( f30_local1.contractData.teamIndex, f29_arg3 ) then
							f0_local0( f29_arg0, not f29_local2, f30_local1.contractData.teamName )
						end
					end
				end )
			end
		end
		f29_local4 = "button_alt2"
	end
end

Contracts.GetRequirementText = function ( f31_arg0, f31_arg1, f31_arg2, f31_arg3 )
	local f31_local0 = tonumber( f31_arg0 )
	if Engine.IsCoreMode() then
		if f31_local0 ~= -1 then
			local f31_local1 = MissionDirector.GetActiveMissionTeam( f31_arg2 )
			local f31_local2 = MissionDirector.GetMissionTeamName( f31_local0 )
			if MissionDirector.GetMissionTeamDisabled( f31_arg2, f31_local0 ) then
				return MissionDirector.GetMissionTeamUnlockText( f31_local0 )
			elseif f31_local1 == f31_local0 or f31_arg3 then
				return Engine.Localize( "LUA_MENU_MP_CONTRACT_REQUIREMENT_USE", f31_local2 )
			else
				local f31_local3
				if f31_arg1 == 0 then
					f31_local3 = "[{ui_alt1}]"
					if not f31_local3 then
					
					else
						return Engine.Localize( "LUA_MENU_MP_CONTRACT_REQUIREMENT_SWITCH", f31_local3, f31_local2 )
					end
				end
			end
			f31_local3 = "[{ui_alt2}]"
		else
			return Engine.Localize( "LUA_MENU_MP_CONTRACT_REQUIREMENT_ANY" )
		end
	else
		if Engine.IsAliensMode() then
			if f31_local0 == -1 then
				return Engine.Localize( "ZM_CONTRACTS_REQIREMENTS_NONE" )
			elseif f31_local0 == 0 then
				return Engine.Localize( "ZM_CONTRACTS_REQUIREMENTS_SPACELAND" )
			elseif f31_local0 == 1 then
				return Engine.Localize( "ZM_CONTRACTS_REQUIREMENTS_RAVE" )
			elseif f31_local0 == 2 then
				return Engine.Localize( "ZM_CONTRACTS_REQUIREMENTS_SHAOLIN" )
			elseif f31_local0 == 3 then
				return Engine.Localize( "ZM_CONTRACTS_REQUIREMENTS_ATTACK" )
			elseif f31_local0 == 4 then
				return Engine.Localize( "ZM_CONTRACTS_REQUIREMENTS_BEYOND" )
			end
		end
	end
end

Contracts.CanTeamSwitch = function ( f32_arg0, f32_arg1 )
	local f32_local0 = MissionDirector.GetActiveMissionTeam( f32_arg1 )
	local f32_local1 = MissionDirector.GetMissionTeamDisabled( f32_arg1, f32_arg0 )
	local f32_local2
	if f32_arg0 ~= -1 and f32_arg0 ~= f32_local0 then
		f32_local2 = not f32_local1
	else
		f32_local2 = false
	end
	return f32_local2
end

Contracts.GetRewardData = function ( f33_arg0, f33_arg1 )
	return CSV.ReadRow( CSV.lootMissionSetMaster, Engine.TableLookupGetRowNum( CSV.lootMissionSetMaster.file, CSV.lootMissionSetMaster.cols.index, Engine.TableLookup( CSV.contractCalendar.file, CSV.contractCalendar.cols.week, Contracts.GetCurrentWeekID( f33_arg1 ), CSV.contractCalendar.cols["rewardStream" .. f33_arg0] ) ) )
end

Contracts.GetMTXPItemCardInfo = function ( f34_arg0 )
	local f34_local0 = MissionDirector.GetActiveMissionTeam( f34_arg0 )
	return {
		name = Engine.Localize( "MP_CONTRACTS_MT_XP_ITEM_NAME" ),
		image = MissionDirector.GetMissionTeamContractImage( f34_local0 ),
		desc = Engine.Localize( "MP_CONTRACTS_MT_XP_ITEM_DESC" ),
		missionTeamID = f34_local0,
		footer = MissionDirector.GetMissionTeamName( f34_local0 ),
		title = Engine.Localize( "MP_CONTRACTS_REWARD_TITLE" )
	}
end

