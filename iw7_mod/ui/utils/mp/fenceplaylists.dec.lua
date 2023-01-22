local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
FencePlaylists = LUI.Class( LUI.Fence )
FencePlaylists.state = {
	NEED_UPDATE = 0,
	UPDATING = 1,
	UP_TO_DATE = 2
}
FencePlaylists.init = function ( f1_arg0 )
	FencePlaylists.super.init( f1_arg0 )
end

FencePlaylists.Start = function ( f2_arg0 )
	DebugPrint( "FencePlaylists.Start" )
	f2_arg0._userCancelled = false
end

FencePlaylists.Stop = function ( f3_arg0 )
	DebugPrint( "FencePlaylists.Stop" )
	LUI.FlowManager.RequestLeaveMenuByName( "UpdatingPlaylists", true )
	LUI.FlowManager.RequestLeaveMenuByName( "OutdatedPlaylists", true )
end

FencePlaylists.PostFail = function ( f4_arg0 )
	if f4_arg0._state == LUI.Fence.STATE.fail and not f4_arg0._userCancelled then
		Matchmaking.ResetDisband()
		LUI.FlowManager.RequestPopupMenu( nil, "OutdatedPlaylists", false, false, false, {}, nil, false, true )
	end
end

FencePlaylists.OpenUpdatingPopup = function ( f5_arg0 )
	f5_arg0._openedPopup = true
	local f5_local0 = f5_arg0
	LUI.FlowManager.RequestPopupMenu( nil, "UpdatingPlaylists", false, false, false, {
		onCancel = function ( f6_arg0, f6_arg1 )
			DebugPrint( "Cancelling FencePlaylists" )
			f5_local0._state = LUI.Fence.STATE.fail
			f5_local0._userCancelled = true
		end
	}, nil, true, true )
end

FencePlaylists.UpdateState = function ( f7_arg0 )
	assert( f7_arg0._state ~= LUI.Fence.STATE.fail )
	local f7_local0 = Fences.PlaylistsGetState()
	if f7_local0 == FencePlaylists.state.NEED_UPDATE then
		if not f7_arg0._passed then
			f7_arg0._state = LUI.Fence.STATE.block
		else
			f7_arg0._state = LUI.Fence.STATE.fail
		end
	elseif f7_local0 == FencePlaylists.state.UPDATING then
		f7_arg0._state = LUI.Fence.STATE.block
	elseif f7_local0 == FencePlaylists.state.UP_TO_DATE then
		f7_arg0._state = LUI.Fence.STATE.pass
		f7_arg0._passed = true
	else
		f7_arg0._state = LUI.Fence.STATE.fail
		assert( false, "Unexpected state for playlists fence" )
	end
	if f7_arg0._state == LUI.Fence.STATE.block and not f7_arg0._openedPopup then
		f7_arg0:OpenUpdatingPopup()
	end
end

f0_local0 = function ( f8_arg0, f8_arg1 )
	assert( f8_arg1 and f8_arg1.onCancel )
	local f8_local0 = MenuBuilder.buildItems( {
		type = "live_dialog_text_box_with_cancel",
		properties = {
			message = Engine.Localize( "MP_FRONTEND_ONLY_UPDATING_PLAYLISTS" ),
			cancel_func = f8_arg1.onCancel
		}
	} )
	f8_local0.id = "UpdatingPlaylists"
	return f8_local0
end

f0_local1 = function ()
	local f9_local0 = MenuBuilder.BuildRegisteredType( "PopupOK", {
		message = Engine.Localize( "MPUI_DOWNLOADPLAYLIST" )
	} )
	f9_local0.id = "OutdatedPlaylists"
	return f9_local0
end

MenuBuilder.registerType( "UpdatingPlaylists", f0_local0 )
MenuBuilder.registerType( "OutdatedPlaylists", f0_local1 )
LUI.Fence.Register( "playlists", FencePlaylists )
LockTable( _M )
