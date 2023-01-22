local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
LUI.FenceSpinner = LUI.Class( LUI.Fence )
LUI.FenceSpinner.CODE_STATE = {
	idle = 0,
	inProgress = 1,
	success = 2,
	failure = 3
}
LUI.FenceSpinner.FAILURE_ACTION = {
	none = 0,
	fence = 1
}
LUI.FenceSpinner.init = function ( f1_arg0 )
	LUI.Fence.init( f1_arg0 )
	f1_arg0.fenceChannel = CoD.FenceChannel.Default
end

LUI.FenceSpinner.Start = function ( f2_arg0 )
	f2_arg0:ShowInProgressPopup()
end

LUI.FenceSpinner.Stop = function ( f3_arg0 )
	local f3_local0, f3_local1 = Fences.FenceSpinnerGetState( f3_arg0.fenceChannel )
	LUI.FlowManager.RequestLeaveMenuByName( "spinner_inprogress_popup", true )
	if f3_local0 ~= LUI.FenceSpinner.CODE_STATE.idle then
		if f3_local0 == LUI.FenceSpinner.CODE_STATE.success then
			if Fences.FenceSpinnerGetSuccessShowPopup( f3_arg0.fenceChannel ) == true then
				f3_arg0:ShowSuccessPopup()
			end
			Fences.FenceSpinnerReset( f3_arg0.fenceChannel )
		elseif f3_local0 == LUI.FenceSpinner.CODE_STATE.failure and Fences.FenceSpinnerGetFailureAction( f3_arg0.fenceChannel ) == LUI.FenceSpinner.FAILURE_ACTION.none then
			f3_arg0:ShowFailurePopup()
			Fences.FenceSpinnerReset( f3_arg0.fenceChannel )
		end
	end
end

LUI.FenceSpinner.PostFail = function ( f4_arg0 )
	if f4_arg0._state == LUI.Fence.STATE.fail then
		f4_arg0:ShowFailurePopup()
		Fences.FenceSpinnerReset( f4_arg0.fenceChannel )
	end
end

LUI.FenceSpinner.ShowInProgressPopup = function ( f5_arg0 )
	local f5_local0, f5_local1 = Fences.FenceSpinnerGetState( f5_arg0.fenceChannel )
	LUI.FlowManager.RequestPopupMenu( nil, "spinner_inprogress_popup", false, false, false, {
		message = f5_local1
	}, nil, true, true )
end

LUI.FenceSpinner.ShowSuccessPopup = function ( f6_arg0 )
	local f6_local0, f6_local1 = Fences.FenceSpinnerGetState( f6_arg0.fenceChannel )
	LUI.FlowManager.RequestPopupMenu( nil, "spinner_confirmation_popup", false, false, false, {
		message = f6_local1
	}, nil, true, true )
end

LUI.FenceSpinner.ShowFailurePopup = function ( f7_arg0 )
	local f7_local0, f7_local1 = Fences.FenceSpinnerGetState( f7_arg0.fenceChannel )
	LUI.FlowManager.RequestPopupMenu( nil, "generic_error_popup", false, false, false, {
		message = f7_local1
	}, nil, true, true )
end

LUI.FenceSpinner.UpdateState = function ( f8_arg0 )
	assert( f8_arg0._state ~= LUI.Fence.STATE.fail )
	local f8_local0, f8_local1 = Fences.FenceSpinnerGetState( f8_arg0.fenceChannel )
	if f8_local0 == LUI.FenceSpinner.CODE_STATE.idle then
		if f8_arg0._state == LUI.Fence.STATE.block then
			f8_arg0._state = LUI.Fence.STATE.pass
		end
	elseif f8_local0 == LUI.FenceSpinner.CODE_STATE.inProgress then
		if f8_arg0._state == LUI.Fence.STATE.pass then
			f8_arg0._state = LUI.Fence.STATE.block
		end
	elseif f8_local0 == LUI.FenceSpinner.CODE_STATE.success then
		f8_arg0._state = LUI.Fence.STATE.pass
	elseif f8_local0 == LUI.FenceSpinner.CODE_STATE.failure then
		if Fences.FenceSpinnerGetFailureAction( f8_arg0.fenceChannel ) == LUI.FenceSpinner.FAILURE_ACTION.fence then
			f8_arg0._state = LUI.Fence.STATE.fail
		else
			f8_arg0._state = LUI.Fence.STATE.pass
		end
	end
end

LUI.Fence.Register( "fenceSpinner", LUI.FenceSpinner )
LockTable( _M )
