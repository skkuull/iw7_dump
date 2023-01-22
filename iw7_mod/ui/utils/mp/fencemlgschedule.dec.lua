local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
FenceMLGSchedule = LUI.Class( LUI.Fence )
FenceMLGSchedule.init = function ( f1_arg0 )
	LUI.Fence.init( f1_arg0 )
end

FenceMLGSchedule.Start = function ( f2_arg0 )
	local f2_local0 = Engine.GetFirstActiveController()
	if MLG.GetGameBattleMatchId( f2_local0 ) == GAMEBATTLES.INVALID_MATCH_ID then
		MLG.RefreshGameBattleSchedule( f2_local0 )
	end
end

FenceMLGSchedule.Stop = function ( f3_arg0 )
	LUI.FlowManager.RequestLeaveMenuByName( "popup_getting_mlg_schedule", true )
	f3_arg0._openedWaitPopup = false
end

FenceMLGSchedule.OpenPopup = function ( f4_arg0 )
	local f4_local0 = f4_arg0
	LUI.FlowManager.RequestPopupMenu( nil, "popup_getting_mlg_schedule", false, false, false, {
		onCancel = function ( f5_arg0, f5_arg1 )
			f4_local0._state = LUI.Fence.STATE.fail
		end
	}, nil, true, true )
	f4_arg0._openedWaitPopup = true
end

FenceMLGSchedule.PostFail = function ( f6_arg0 )
	local f6_local0 = Engine.GetFirstActiveController()
	if f6_arg0._state == LUI.Fence.STATE.fail then
		
	else
		
	end
end

FenceMLGSchedule.UpdateState = function ( f7_arg0 )
	assert( f7_arg0._state ~= LUI.Fence.STATE.fail )
	f7_arg0._state = LUI.Fence.STATE.pass
	local f7_local0 = Engine.GetFirstActiveController()
	local f7_local1 = MLG.GetGameBattleScheduleState( f7_local0 )
	if f7_local1 == GAMEBATTLES.MLG_SCHEDULE_STATE.RETRIEVING then
		f7_arg0._state = LUI.Fence.STATE.block
	elseif f7_local1 == GAMEBATTLES.MLG_SCHEDULE_STATE.UNAVAILABLE then
		MLG.RefreshGameBattleSchedule( f7_local0 )
		f7_arg0._state = LUI.Fence.STATE.block
	elseif f7_local1 == GAMEBATTLES.MLG_SCHEDULE_STATE.RETRIEVAL_ERROR then
		f7_arg0._state = LUI.Fence.STATE.fail
	end
	if f7_arg0._state == LUI.Fence.STATE.block and not f7_arg0._openedWaitPopup then
		f7_arg0:OpenPopup()
	end
end

function PopupGettingMLGSchedule( f8_arg0, f8_arg1 )
	assert( f8_arg1 and f8_arg1.onCancel )
	local f8_local0 = MenuBuilder.buildItems( {
		type = "live_dialog_text_box_with_cancel",
		properties = {
			message = Engine.Localize( "MLG_GAMEBATTLES_FENCE_MLGSCHEDULE" ),
			cancel_func = f8_arg1.onCancel
		}
	} )
	f8_local0.id = "popup_getting_mlg_data"
	return f8_local0
end

MenuBuilder.registerType( "popup_getting_mlg_schedule", PopupGettingMLGSchedule )
LUI.Fence.Register( "mlgSchedule", FenceMLGSchedule )
LockTable( _M )
