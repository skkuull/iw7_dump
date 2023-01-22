local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
FenceDailyReward = LUI.Class( LUI.Fence )
FenceDailyReward.init = function ( f1_arg0 )
	LUI.Fence.init( f1_arg0 )
end

FenceDailyReward.Start = function ( f2_arg0 )
	DebugPrint( "FenceDailyReward.Start" )
end

FenceDailyReward.Stop = function ( f3_arg0 )
	DebugPrint( "FenceDailyReward.Stop" )
end

FenceDailyReward.UpdateState = function ( f4_arg0 )
	assert( f4_arg0._state ~= LUI.Fence.STATE.fail )
	f4_arg0._state = LUI.Fence.STATE.pass
	for f4_local0 = 0, Engine.GetMaxControllerCount() - 1, 1 do
		if Engine.HasActiveLocalClient( f4_local0 ) then
			DLB.OpenDLBWindowIfRequired( f4_local0 )
		end
	end
end

LUI.Fence.Register( "dailyReward", FenceDailyReward )
LockTable( _M )
