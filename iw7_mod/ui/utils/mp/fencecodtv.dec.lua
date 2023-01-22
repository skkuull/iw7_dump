local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
FenceCODTV = LUI.Class( LUI.Fence )
FenceCODTV.init = function ( f1_arg0 )
	LUI.Fence.init( f1_arg0 )
end

FenceCODTV.Start = function ( f2_arg0 )
	DebugPrint( "FenceCODTV.Start" )
end

FenceCODTV.Stop = function ( f3_arg0 )
	DebugPrint( "FenceCODTV.Stop" )
	if f3_arg0._openedWaitPopup then
		LUI.FlowManager.RequestLeaveMenuByName( f3_arg0._openedWaitPopup, true )
	end
end

FenceCODTV.PostFail = function ( f4_arg0 )
	
end

FenceCODTV.OnBackOut = function ( f5_arg0 )
	
end

FenceCODTV.OpenPopup = function ( f6_arg0, f6_arg1 )
	local f6_local0 = f6_arg0
	local f6_local1 = {
		onCancel = function ( f7_arg0, f7_arg1 )
			f6_local0._state = LUI.Fence.STATE.fail
		end,
		callingFence = f6_local0
	}
	if f6_arg0._openedWaitPopup then
		LUI.FlowManager.RequestLeaveMenuByName( f6_arg0._openedWaitPopup, true )
	end
	LUI.FlowManager.RequestPopupMenu( nil, f6_arg1, false, false, false, f6_local1, nil, true, true )
	f6_arg0._openedWaitPopup = f6_arg1
end

FenceCODTV.UpdateState = function ( f8_arg0 )
	assert( f8_arg0._state ~= LUI.Fence.STATE.fail )
	f8_arg0._state = LUI.Fence.STATE.pass
end

LUI.Fence.Register( "codtv", FenceCODTV )
LockTable( _M )
