local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
FenceMLGAccount = LUI.Class( LUI.Fence )
FenceMLGAccount.init = function ( f1_arg0 )
	LUI.Fence.init( f1_arg0 )
end

FenceMLGAccount.Start = function ( f2_arg0 )
	local f2_local0 = Engine.GetFirstActiveController()
	if MLG.GetGameBattleMatchId( f2_local0 ) == GAMEBATTLES.INVALID_MATCH_ID then
		MLG.RefreshGameBattleAccountState( f2_local0 )
	end
end

FenceMLGAccount.Stop = function ( f3_arg0 )
	LUI.FlowManager.RequestLeaveMenuByName( "popup_getting_mlg_account", true )
	f3_arg0._openedWaitPopup = false
end

FenceMLGAccount.OpenPopup = function ( f4_arg0 )
	local f4_local0 = f4_arg0
	LUI.FlowManager.RequestPopupMenu( nil, "popup_getting_mlg_account", false, false, false, {
		onCancel = function ( f5_arg0, f5_arg1 )
			f4_local0._state = LUI.Fence.STATE.fail
		end
	}, nil, true, true )
	f4_arg0._openedWaitPopup = true
end

FenceMLGAccount.PostFail = function ( f6_arg0 )
	local f6_local0 = Engine.GetFirstActiveController()
	if f6_arg0._state == LUI.Fence.STATE.fail then
		if f6_arg0._errorCode == GAMEBATTLES.MLG_ERR_CODE.CANNOT_CONNECT then
			LUI.FlowManager.RequestPopupMenu( f6_arg0, "MLGGamebattlesCannotConnectPopup", false, f6_local0, false, {
				controllerIndex = f6_local0
			} )
		elseif f6_arg0._errorCode == GAMEBATTLES.MLG_ERR_CODE.NO_SOCIAL_PRIVILEGES then
			LUI.FlowManager.RequestPopupMenu( f6_arg0, "MLGGamebattlesNoSocialNetworkPrivilegesPopup", false, f6_local0, false, {
				controllerIndex = f6_local0
			} )
		elseif f6_arg0._errorCode == GAMEBATTLES.MLG_ERR_CODE.USER_NOT_REGISTERED then
			LUI.FlowManager.RequestPopupMenu( f6_arg0, "MLGGamebattlesUnregisteredPopup", false, f6_local0, false, {
				controllerIndex = f6_local0
			} )
		elseif f6_arg0._errorCode == GAMEBATTLES.MLG_ERR_CODE.FIRST_TIME_ENTRY then
			LUI.FlowManager.RequestPopupMenu( f6_arg0, "MLGGamebattlesFirstTimePopup", false, f6_local0, false, {
				controllerIndex = f6_local0
			} )
		end
	end
end

FenceMLGAccount.UpdateState = function ( f7_arg0 )
	assert( f7_arg0._state ~= LUI.Fence.STATE.fail )
	f7_arg0._state = LUI.Fence.STATE.pass
	local f7_local0 = Engine.GetFirstActiveController()
	local f7_local1 = MLG.GetGameBattleAccountState( f7_local0 )
	if Engine.IsXB3() and not Engine.HasSocialNetworkPrivileges( f7_local0 ) then
		f7_arg0._state = LUI.Fence.STATE.fail
		f7_arg0._errorCode = GAMEBATTLES.MLG_ERR_CODE.NO_SOCIAL_PRIVILEGES
	elseif f7_local1 == GAMEBATTLES.MLG_ACCOUNT_STATE.RETRIEVING then
		f7_arg0._state = LUI.Fence.STATE.block
	elseif f7_local1 == GAMEBATTLES.MLG_ACCOUNT_STATE.UNAVAILABLE then
		f7_arg0._state = LUI.Fence.STATE.block
		MLG.RefreshGameBattleAccountState( f7_local0 )
	elseif f7_local1 == GAMEBATTLES.MLG_ACCOUNT_STATE.NO_ACCOUNT then
		f7_arg0._state = LUI.Fence.STATE.fail
		f7_arg0._errorCode = GAMEBATTLES.MLG_ERR_CODE.USER_NOT_REGISTERED
	elseif f7_local1 == GAMEBATTLES.MLG_ACCOUNT_STATE.ACCOUNT_ERROR then
		f7_arg0._state = LUI.Fence.STATE.fail
		f7_arg0._errorCode = GAMEBATTLES.MLG_ERR_CODE.CANNOT_CONNECT
	elseif f7_local1 == GAMEBATTLES.MLG_ACCOUNT_STATE.HAS_ACCOUNT and not Engine.GetPlayerDataEx( f7_local0, CoD.StatsGroup.Common, "registeredToGamebattles" ) then
		f7_arg0._state = LUI.Fence.STATE.fail
		f7_arg0._errorCode = GAMEBATTLES.MLG_ERR_CODE.FIRST_TIME_ENTRY
	end
	if f7_arg0._state == LUI.Fence.STATE.block and not f7_arg0._openedWaitPopup then
		f7_arg0:OpenPopup()
	end
end

function PopupGettingMLGAccount( f8_arg0, f8_arg1 )
	assert( f8_arg1 and f8_arg1.onCancel )
	local f8_local0 = MenuBuilder.buildItems( {
		type = "live_dialog_text_box_with_cancel",
		properties = {
			message = Engine.Localize( "MLG_GAMEBATTLES_FENCE_MLGACCOUNT" ),
			cancel_func = f8_arg1.onCancel
		}
	} )
	f8_local0.id = "popup_getting_mlg_account"
	return f8_local0
end

MenuBuilder.registerType( "popup_getting_mlg_account", PopupGettingMLGAccount )
LUI.Fence.Register( "mlgAccount", FenceMLGAccount )
LockTable( _M )
