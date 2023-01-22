local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
FenceCODAccountSignIn = LUI.Class( LUI.Fence )
FenceCODAccountSignIn.init = function ( f1_arg0, f1_arg1, f1_arg2 )
	DebugPrint( "FenceCODAccountSignIn.init" )
	f1_arg0.super:init( f1_arg1, f1_arg2 )
	f1_arg0._controllerIndex = f1_arg2
	assert( f1_arg0._controllerIndex )
end

FenceCODAccountSignIn.Start = function ( f2_arg0 )
	DebugPrint( "FenceCODAccountSignIn.Start" )
	assert( f2_arg0._controllerIndex )
	f2_arg0._currentCodeState = -1
	f2_arg0._fenceUpdateCount = 0
end

FenceCODAccountSignIn.Stop = function ( f3_arg0 )
	DebugPrint( "FenceCODAccountSignIn.Stop" )
	if f3_arg0._openedWaitPopup then
		LUI.FlowManager.RequestLeaveMenuByName( f3_arg0._openedWaitPopup, true )
	end
	f3_arg0._openedWaitPopup = nil
end

FenceCODAccountSignIn.PostFail = function ( f4_arg0 )
	if f4_arg0._state == LUI.Fence.STATE.fail then
		LUI.FlowManager.RequestPopupMenu( nil, "CODAccountSignInErrorPopup", false, false, false, {
			singleIdentityErrors = f4_arg0._errors
		}, nil, false, true )
	end
end

FenceCODAccountSignIn.OnBackOut = function ( f5_arg0 )
	
end

FenceCODAccountSignIn.OpenPopup = function ( f6_arg0, f6_arg1 )
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

FenceCODAccountSignIn.UpdateState = function ( f8_arg0 )
	assert( f8_arg0._state ~= LUI.Fence.STATE.fail )
	f8_arg0._fenceUpdateCount = f8_arg0._fenceUpdateCount + 1
	local f8_local0 = f8_arg0._currentCodeState
	local f8_local1 = CoDAccount.GetAccountSignInState( f8_arg0._controllerIndex )
	f8_arg0._currentCodeState = f8_local1
	if f8_local1 ~= lastSignInCodeState then
		f8_arg0._fenceUpdateCount = 0
		if f8_local1 == CODACCOUNT.SignInState.creatingAccount then
			f8_arg0._state = LUI.Fence.STATE.block
		elseif f8_local1 == CODACCOUNT.SignInState.retrievingAccount then
			f8_arg0._state = LUI.Fence.STATE.block
		elseif f8_local1 == CODACCOUNT.SignInState.linkingAccount then
			f8_arg0._state = LUI.Fence.STATE.block
		end
	end
	if f8_arg0._state ~= LUI.Fence.STATE.pass and f8_local1 == CODACCOUNT.SignInState.signedIn then
		f8_arg0._state = LUI.Fence.STATE.pass
	elseif f8_arg0._state ~= LUI.Fence.STATE.fail and (f8_local1 == CODACCOUNT.SignInState.notSignedIn or f8_local1 == CODACCOUNT.SignInState.noAccountFound) then
		f8_arg0._state = LUI.Fence.STATE.fail
	end
	if f8_arg0._state == LUI.Fence.STATE.block then
		if f8_arg0._openedWaitPopup == nil then
			f8_arg0:OpenPopup( "CODAccountSignInFencePopup" )
		elseif f8_arg0._fenceUpdateCount >= 300 then
			f8_arg0._state = LUI.Fence.STATE.fail
		end
	end
end

LUI.Fence.Register( "codAccountSignIn", FenceCODAccountSignIn )
LockTable( _M )
