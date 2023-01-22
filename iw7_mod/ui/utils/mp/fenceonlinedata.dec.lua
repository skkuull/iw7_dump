local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
FenceOnlineData = LUI.Class( LUI.Fence )
FenceOnlineData.CODE_STATE = {
	inactive = 0,
	requested = 1,
	downloading = 2,
	success = 3,
	failure = 4
}
FenceOnlineData.CONTROLLER_FENCE_STATE = {
	inactive = 1,
	pass = 2,
	block = 3,
	fail = 4
}
FenceOnlineData.init = function ( f1_arg0 )
	LUI.Fence.init( f1_arg0 )
	f1_arg0._perController = {}
	for f1_local0 = 0, Engine.GetMaxControllerCount() - 1, 1 do
		Fences.ODSFResetState( f1_local0 )
		f1_arg0._perController[f1_local0] = {
			fenceState = FenceOnlineData.CONTROLLER_FENCE_STATE.inactive,
			isCancelling = false
		}
	end
end

FenceOnlineData.Start = function ( f2_arg0 )
	DebugPrint( "FenceOnlineData.Start" )
end

FenceOnlineData.Stop = function ( f3_arg0 )
	DebugPrint( "FenceOnlineData.Stop" )
	LUI.FlowManager.RequestLeaveMenuByName( "popup_getting_data", true )
	f3_arg0._openedWaitPopup = false
end

FenceOnlineData.OpenPopup = function ( f4_arg0 )
	local f4_local0 = f4_arg0
	LUI.FlowManager.RequestPopupMenu( nil, "popup_getting_data", false, false, false, {
		onCancel = function ( f5_arg0, f5_arg1 )
			DebugPrint( "Cancelling FenceOnlineData" )
			f4_local0._perController[f5_arg1].isCancelling = true
		end
	}, nil, true, true )
	f4_arg0._openedWaitPopup = true
end

FenceOnlineData.OnBackOut = function ( f6_arg0 )
	for f6_local0 = 0, Engine.GetMaxControllerCount() - 1, 1 do
		Fences.ODSFResetState( f6_local0 )
	end
end

FenceOnlineData.PostFail = function ( f7_arg0 )
	if f7_arg0._state == LUI.Fence.STATE.fail and f7_arg0._errorCode then
		LUI.FlowManager.RequestPopupMenu( nil, "popup_getting_data_error", false, false, false, {
			errorCode = f7_arg0._errorCode
		}, nil, false, true )
	end
end

FenceOnlineData.UpdateState = function ( f8_arg0 )
	assert( f8_arg0._state ~= LUI.Fence.STATE.fail )
	for f8_local0 = 0, Engine.GetMaxControllerCount() - 1, 1 do
		local f8_local3 = Engine.HasActiveLocalClient( f8_local0 )
		if f8_local3 and not (f8_local3 and Engine.IsUserAGuest( f8_local0 )) then
			local f8_local4, f8_local5 = Fences.ODSFGetState( f8_local0 )
			if f8_local4 == FenceOnlineData.CODE_STATE.inactive then
				Fences.ODSFRequest( f8_local0 )
				f8_local4, f8_local5 = Fences.ODSFGetState( f8_local0 )
			end
			if f8_local4 == FenceOnlineData.CODE_STATE.failure then
				f8_arg0._perController[f8_local0].errorCode = f8_local5
				f8_arg0._perController[f8_local0].fenceState = FenceOnlineData.CONTROLLER_FENCE_STATE.fail
			elseif f8_local4 ~= FenceOnlineData.CODE_STATE.success then
				f8_arg0._perController[f8_local0].fenceState = FenceOnlineData.CONTROLLER_FENCE_STATE.block
			else
				f8_arg0._perController[f8_local0].fenceState = FenceOnlineData.CONTROLLER_FENCE_STATE.pass
			end
			if f8_arg0._perController[f8_local0].isCancelling then
				f8_arg0._perController[f8_local0].fenceState = FenceOnlineData.CONTROLLER_FENCE_STATE.fail
				f8_arg0._perController[f8_local0].errorCode = nil
			end
		end
		f8_arg0._perController[f8_local0].fenceState = FenceOnlineData.CONTROLLER_FENCE_STATE.inactive
		f8_arg0._perController[f8_local0].isCancelling = false
		f8_arg0._perController[f8_local0].errorCode = nil
	end
	local f8_local0 = 0
	local f8_local1 = 0
	local f8_local2 = 0
	for f8_local6 = 0, Engine.GetMaxControllerCount() - 1, 1 do
		if f8_arg0._perController[f8_local6].fenceState == FenceOnlineData.CONTROLLER_FENCE_STATE.pass then
			f8_local0 = f8_local0 + 1
		end
		if f8_arg0._perController[f8_local6].fenceState == FenceOnlineData.CONTROLLER_FENCE_STATE.block then
			f8_local1 = f8_local1 + 1
		end
		if f8_arg0._perController[f8_local6].fenceState == FenceOnlineData.CONTROLLER_FENCE_STATE.fail then
			f8_local2 = f8_local2 + 1
		end
	end
	assert( f8_local2 + f8_local1 + f8_local0 > 0, "No active local clients" )
	if f8_local2 > 0 then
		for f8_local6 = 0, Engine.GetMaxControllerCount() - 1, 1 do
			if f8_arg0._perController[f8_local6].fenceState == FenceOnlineData.CONTROLLER_FENCE_STATE.fail then
				local f8_local5 = f8_arg0._perController[f8_local6].errorCode
				if f8_local0 > 0 and not Lobby.IsControllerIndexHostOfAnyParty( f8_local6 ) then
					DebugPrint( "Controller #" .. tostring( f8_local6 ) .. " does not have online data. Making client inactive." )
					f8_arg0._state = LUI.Fence.STATE.block
					Engine.MakeLocalClientInactive( f8_local6 )
					if f8_local5 then
						assert( type( f8_local5 ) == "number" )
						LUI.FlowManager.RequestPopupMenu( nil, "popup_getting_data_error", false, false, false, {
							errorCode = f8_local5
						}, nil, false, true )
					end
				end
				f8_arg0._errorCode = f8_local5
				f8_arg0._state = LUI.Fence.STATE.fail
			end
		end
	elseif f8_local1 > 0 then
		f8_arg0._state = LUI.Fence.STATE.block
	elseif f8_local0 > 0 then
		f8_arg0._state = LUI.Fence.STATE.pass
	else
		assert( false, "Unexpected state" )
		f8_arg0._state = LUI.Fence.STATE.block
	end
	if f8_arg0._state == LUI.Fence.STATE.pass and Engine.IsCoreMode() then
		InitCoreMPRankedDataSources()
	end
	if f8_arg0._state == LUI.Fence.STATE.pass and Engine.IsAliensMode() then
		InitCPRankedDataSources()
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
			message = Engine.Localize( "MENU_POPUP_ONLINEDATA" ),
			cancel_func = f9_arg1.onCancel
		}
	} )
	f9_local0.id = "popup_getting_data"
	f9_local0:registerEventHandler( "menu_close", function ( element, event )
		element:dispatchEventToRoot( {
			name = "online_data_finished"
		} )
	end )
	return f9_local0
end

function PopupGettingDataError( f11_arg0, f11_arg1 )
	assert( f11_arg1 and f11_arg1.errorCode )
	local f11_local0 = MenuBuilder.buildItems( {
		type = "generic_confirmation_popup",
		properties = {
			popup_title = Engine.Localize( "MENU_ERROR" ),
			message_text = Engine.Localize( "EXE_ERR_ONLINE_DATA", f11_arg1.errorCode )
		}
	} )
	f11_local0.id = "popup_getting_data_error"
	return f11_local0
end

MenuBuilder.registerType( "popup_getting_data", PopupGettingData )
MenuBuilder.registerType( "popup_getting_data_error", PopupGettingDataError )
LUI.Fence.Register( "onlineData", FenceOnlineData )
LockTable( _M )
