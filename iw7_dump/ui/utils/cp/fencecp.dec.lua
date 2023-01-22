local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
FenceCP = LUI.Class( LUI.Fence )
FenceCP.init = function ( f1_arg0 )
	LUI.Fence.init( f1_arg0 )
end

FenceCP.Start = function ( f2_arg0 )
	if Engine.GetDvarBool( "com_checkIfGameModeInstalled" ) and Engine.IsPC() then
		if not Engine.UserOwnsApp( CoD.PlayMode.Aliens ) then
			f2_arg0._errorCode = CoD.FenceErrorCodes.Ownership
			f2_arg0._state = LUI.Fence.STATE.fail
		elseif not Engine.AppIsInstalled( CoD.PlayMode.Aliens ) then
			f2_arg0._errorCode = CoD.FenceErrorCodes.Installation
			f2_arg0._state = LUI.Fence.STATE.fail
		else
			Engine.StartGameModeCP()
		end
	else
		Engine.StartGameModeCP()
	end
end

FenceCP.Stop = function ( f3_arg0 )
	
end

FenceCP.OnBackOut = function ( f4_arg0 )
	Engine.StopGameMode()
end

FenceCP.PostFail = function ( f5_arg0 )
	if f5_arg0._state == LUI.Fence.STATE.fail and f5_arg0._errorCode then
		LUI.FlowManager.RequestPopupMenu( nil, "PopupFenceGameModeError", false, false, false, {
			errorCode = f5_arg0._errorCode
		}, nil, false, true )
	end
end

FenceCP.UpdateState = function ( f6_arg0 )
	assert( f6_arg0._state ~= LUI.Fence.STATE.fail )
	f6_arg0._state = LUI.Fence.STATE.block
	if Engine.IsAliensMode() and CoD.GetCurrentGameMode() == CoD.PlayMode.Aliens then
		f6_arg0._state = LUI.Fence.STATE.pass
	end
end

LUI.Fence.Register( "cp", FenceCP )
LockTable( _M )
