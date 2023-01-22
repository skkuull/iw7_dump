local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
FenceOffline = LUI.Class( LUI.Fence )
FenceOffline.init = function ( f1_arg0 )
	LUI.Fence.init( f1_arg0 )
end

FenceOffline.Start = function ( f2_arg0 )
	DebugPrint( "FenceOffline.Start" )
end

FenceOffline.Stop = function ( f3_arg0 )
	DebugPrint( "FenceOffline.Stop" )
end

FenceOffline.UpdateState = function ( f4_arg0 )
	assert( f4_arg0._state ~= LUI.Fence.STATE.fail )
	f4_arg0._state = LUI.Fence.STATE.pass
	for f4_local0 = 0, Engine.GetMaxControllerCount() - 1, 1 do
		if Engine.HasActiveLocalClient( f4_local0 ) and not Fences.OfflineDataFetched( f4_local0 ) then
			f4_arg0._state = LUI.Fence.STATE.block
		end
	end
end

LUI.Fence.Register( "offlineData", FenceOffline )
LockTable( _M )
