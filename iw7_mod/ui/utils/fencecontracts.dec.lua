local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
FenceContracts = LUI.Class( LUI.Fence )
FenceContracts.init = function ( f1_arg0 )
	LUI.Fence.init( f1_arg0 )
end

FenceContracts.Start = function ( f2_arg0 )
	DebugPrint( "FenceContracts.Start" )
end

FenceContracts.Stop = function ( f3_arg0 )
	DebugPrint( "FenceContracts.Stop" )
end

FenceContracts.UpdateState = function ( f4_arg0 )
	assert( f4_arg0._state ~= LUI.Fence.STATE.fail )
	f4_arg0._state = LUI.Fence.STATE.pass
	if not Contracts.AreContractsEnabled() then
		return 
	end
	local f4_local0 = false
	for f4_local1 = 0, Engine.GetMaxControllerCount() - 1, 1 do
		if Engine.HasActiveLocalClient( f4_local1 ) and Contracts.AreContractsOutOfDate( f4_local1 ) then
			local f4_local4 = MissionDirector.GetFlowState()
			if f4_local4 == MissionDirector.FlowState.PRE_INIT then
				Contracts.HandleNewContracts( f4_local1 )
			elseif f4_local4 == MissionDirector.FlowState.MISSION_ACTIVE then
				Rewards.ResetMissions( f4_local1 )
				if not Engine.IsAliensMode() then
					MissionDirector.PlayMission( f4_local1 )
				else
					Rewards.StartZombies( f4_local1, MissionDirector.ZombiesMissionID )
				end
				Contracts.RunPreMatchLogic( f4_local1 )
			end
			if not f4_local0 then
				LUI.FlowManager.RequestPopupMenu( nil, "ContractReminderPopup", false, f4_local1 )
				f4_local0 = true
			end
		end
	end
end

LUI.Fence.Register( "contracts", FenceContracts )
LockTable( _M )
