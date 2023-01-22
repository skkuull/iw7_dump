local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
FenceMLGData = LUI.Class( LUI.Fence )
FenceMLGData.init = function ( f1_arg0 )
	LUI.Fence.init( f1_arg0 )
	f1_arg0.matchHistoryRefreshed = false
end

f0_local0 = function ( f2_arg0 )
	local f2_local0 = Engine.GetFirstActiveController()
	local f2_local1 = GAMEBATTLES.GetFirstActiveMatch( f2_local0 )
	if f2_local1 ~= nil then
		MLG.SetGameBattleMatchId( f2_local1.matchId )
		MLG.RefreshMatchHistory( f2_local0, f2_local1.matchId )
		f2_arg0.matchHistoryRefreshed = true
	else
		f2_arg0.matchHistoryRefreshed = false
	end
end

FenceMLGData.Start = function ( f3_arg0 )
	if MLG.GetGameBattleMatchId( Engine.GetFirstActiveController() ) == GAMEBATTLES.INVALID_MATCH_ID then
		f0_local0( f3_arg0 )
	end
end

FenceMLGData.Stop = function ( f4_arg0 )
	LUI.FlowManager.RequestLeaveMenuByName( "popup_getting_mlg_data", true )
	f4_arg0._openedWaitPopup = false
	f4_arg0.matchHistoryRefreshed = false
end

FenceMLGData.OpenPopup = function ( f5_arg0 )
	local f5_local0 = f5_arg0
	LUI.FlowManager.RequestPopupMenu( nil, "popup_getting_mlg_data", false, false, false, {
		onCancel = function ( f6_arg0, f6_arg1 )
			f5_local0._state = LUI.Fence.STATE.fail
		end
	}, nil, true, true )
	f5_arg0._openedWaitPopup = true
end

FenceMLGData.PostFail = function ( f7_arg0 )
	local f7_local0 = Engine.GetFirstActiveController()
	if f7_arg0._state == LUI.Fence.STATE.fail and f7_arg0._errorCode == GAMEBATTLES.MLG_ERR_CODE.MATCH_HISTORY_RETRIEVAL_ERROR then
		LUI.FlowManager.RequestPopupMenu( f7_arg0, "MLGGameBattlesMatchHistoryFailPopup", false, f7_local0, false, {
			controllerIndex = f7_local0
		} )
	end
end

FenceMLGData.UpdateState = function ( f8_arg0 )
	assert( f8_arg0._state ~= LUI.Fence.STATE.fail )
	f8_arg0._state = LUI.Fence.STATE.pass
	local f8_local0 = Engine.GetFirstActiveController()
	local f8_local1 = MLG.GetMatchHistoryState( f8_local0, MLG.GetGameBattleMatchId( f8_local0 ) )
	if f8_local1 == GAMEBATTLES.MLG_MATCH_HISTORY_STATE.RETRIEVING then
		f8_arg0._state = LUI.Fence.STATE.block
	elseif f8_local1 == GAMEBATTLES.MLG_MATCH_HISTORY_STATE.RETRIEVAL_ERROR then
		f8_arg0._state = LUI.Fence.STATE.fail
		f8_arg0._errorCode = GAMEBATTLES.MLG_ERR_CODE.MATCH_HISTORY_RETRIEVAL_ERROR
		MLG.ResetGameBattleMatchId( f8_local0 )
	elseif f8_arg0.matchHistoryRefreshed then
		if f8_local1 == GAMEBATTLES.MLG_MATCH_HISTORY_STATE.AVAILABLE then
			if GAMEBATTLES.IsCurrentMatchCompleted( f8_local0 ) then
				MLG.ResetGameBattleMatchId( f8_local0 )
				f0_local0( f8_arg0 )
				if f8_arg0.matchHistoryRefreshed then
					f8_arg0._state = LUI.Fence.STATE.block
				end
			end
		elseif f8_local1 == GAMEBATTLES.MLG_MATCH_HISTORY_STATE.UNAVAILABLE then
			f8_arg0._state = LUI.Fence.STATE.block
		end
	end
	if f8_arg0._state == LUI.Fence.STATE.block and not f8_arg0._openedWaitPopup then
		f8_arg0:OpenPopup()
	end
end

function PopupGettingData( f9_arg0, f9_arg1 )
	assert( f9_arg1 and f9_arg1.onCancel )
	local f9_local0 = MenuBuilder.buildItems( {
		type = "live_dialog_text_box_with_cancel",
		properties = {
			message = Engine.Localize( "MENU_POPUP_MLGDATA" ),
			cancel_func = f9_arg1.onCancel
		}
	} )
	f9_local0.id = "popup_getting_mlg_data"
	return f9_local0
end

MenuBuilder.registerType( "popup_getting_mlg_data", PopupGettingData )
LUI.Fence.Register( "mlgData", FenceMLGData )
LockTable( _M )
