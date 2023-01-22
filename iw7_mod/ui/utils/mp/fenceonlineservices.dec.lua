local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
FenceOnlineServices = LUI.Class( LUI.Fence )
FenceOnlineServices.CODE_STATE = {
	inactive = 0,
	requested = 1,
	downloading = 2,
	success = 3,
	failure = 4,
	queued = 5
}
FenceOnlineServices.ERROR_CODES = {
	signedOutOfLive = 1,
	guestWithoutSponsor = 2,
	MPNotAllowed = 3,
	connecting = 4,
	signedOutOfSteamOnline = 5,
	networkConnection = 6,
	TURequired = 7,
	timeout = 8,
	onlineServices = 9,
	fetchingNPData = 10,
	PSPlusRequired = 11,
	max = 11
}
FenceOnlineServices.UPSELL_STATE = {
	inactive = 1,
	selling = 2,
	done = 3
}
FenceOnlineServices.CONTROLLER_FENCE_STATE = {
	inactive = 1,
	pass = 2,
	block = 3,
	fail = 4
}
FenceOnlineServices.init = function ( f1_arg0, f1_arg1 )
	LUI.Fence.init( f1_arg0 )
	f1_arg0._perController = {}
	f1_arg0._noPremium = f1_arg1
	for f1_local0 = 0, Engine.GetMaxControllerCount() - 1, 1 do
		f1_arg0._perController[f1_local0] = {
			onlineUpsell = FenceOnlineServices.UPSELL_STATE.inactive,
			fenceState = FenceOnlineServices.CONTROLLER_FENCE_STATE.inactive,
			isCancelling = false
		}
		Fences.OCDSResetState( f1_local0 )
	end
	if f1_arg1 then
		DebugPrint( "FenceOnlineServices.Init with No Premium" )
	else
		DebugPrint( "FenceOnlineServices.Init with Premium" )
	end
end

FenceOnlineServices.Start = function ( f2_arg0 )
	DebugPrint( "FenceOnlineServices.Start" )
end

FenceOnlineServices.Stop = function ( f3_arg0 )
	if f3_arg0._openedWaitPopup then
		DebugPrint( "FenceOnlineServices.Stop closing: " .. f3_arg0._openedWaitPopup )
		LUI.FlowManager.RequestLeaveMenuByName( f3_arg0._openedWaitPopup, true )
		f3_arg0._openedWaitPopup = nil
	end
end

FenceOnlineServices.OpenConnectingPopup = function ( f4_arg0 )
	local f4_local0 = f4_arg0
	LUI.FlowManager.RequestPopupMenu( nil, "popup_connecting", false, false, false, {
		onCancel = function ( f5_arg0, f5_arg1 )
			DebugPrint( "Cancelling FenceOnlineServices" )
			f4_local0._perController[f5_arg1].isCancelling = true
		end
	}, nil, true, true )
	f4_arg0._openedWaitPopup = "popup_connecting"
end

FenceOnlineServices.OpenQueuedPopup = function ( f6_arg0 )
	local f6_local0 = f6_arg0
	LUI.FlowManager.RequestPopupMenu( nil, "popup_online_queue", false, false, false, {
		onCancel = function ( f7_arg0, f7_arg1 )
			f6_local0._perController[f7_arg1].isCancelling = true
		end
	}, nil, true, true )
	f6_arg0._openedWaitPopup = "popup_online_queue"
end

FenceOnlineServices.OnBackOut = function ( f8_arg0 )
	DebugPrint( "FenceOnlineServices.OnBackOut" )
	for f8_local0 = 0, Engine.GetMaxControllerCount() - 1, 1 do
		Fences.OCDSResetState( f8_local0 )
	end
	Engine.SetDvarBool( "onlinegame", false )
	Engine.CancelConnecting()
	Engine.ExecNow( "xstopparty 0" )
	Engine.ExecNow( "xstopprivateparty 0" )
end

FenceOnlineServices.PostFail = function ( f9_arg0 )
	if f9_arg0._state == LUI.Fence.STATE.fail and f9_arg0._errorCode then
		LUI.FlowManager.RequestPopupMenu( nil, "popup_connecting_error", false, false, false, {
			errorCode = f9_arg0._errorCode
		}, nil, false, true )
	end
end

FenceOnlineServices.UpdateState = function ( f10_arg0 )
	assert( f10_arg0._state ~= LUI.Fence.STATE.fail )
	local f10_local0, f10_local1 = nil
	f10_arg0._queued = false
	for f10_local2 = 0, Engine.GetMaxControllerCount() - 1, 1 do
		if Engine.HasActiveLocalClient( f10_local2 ) then
			local f10_local5 = f10_arg0._perController[f10_local2].onlineUpsell == FenceOnlineServices.UPSELL_STATE.selling
			if Engine.IsShowingOnlineUpsell() then
				f10_arg0._perController[f10_local2].fenceState = FenceOnlineServices.CONTROLLER_FENCE_STATE.block
				break
			elseif f10_local5 then
				Fences.OCDSResetState( f10_local2 )
				f10_arg0._perController[f10_local2].onlineUpsell = FenceOnlineServices.UPSELL_STATE.done
			end
			f10_local0, f10_local1 = Fences.OCDSGetState( f10_local2 )
			if f10_local0 == FenceOnlineServices.CODE_STATE.inactive then
				Fences.OCDSRequest( f10_local2 )
				f10_local0, f10_local1 = Fences.OCDSGetState( f10_local2 )
			end
			if f10_local0 == FenceOnlineServices.CODE_STATE.failure then
				f10_arg0._perController[f10_local2].errorCode = f10_local1
				local f10_local6 = Engine.IsXB3()
				if f10_local6 then
					f10_local6 = f10_local1 == FenceOnlineServices.ERROR_CODES.MPNotAllowed
				end
				local f10_local7 = Engine.IsPS4()
				if f10_local7 then
					f10_local7 = f10_local1 == FenceOnlineServices.ERROR_CODES.PSPlusRequired
				end
				local f10_local8 = Engine.IsPCApp()
				if f10_local8 then
					f10_local8 = f10_local1 == FenceOnlineServices.ERROR_CODES.MPNotAllowed
				end
				if (f10_local6 or f10_local7 or f10_local8) and f10_arg0._perController[f10_local2].onlineUpsell == FenceOnlineServices.UPSELL_STATE.inactive then
					if f10_arg0._noPremium then
					
					else
						f10_arg0._perController[f10_local2].onlineUpsell = FenceOnlineServices.UPSELL_STATE.selling
						f10_arg0._perController[f10_local2].fenceState = FenceOnlineServices.CONTROLLER_FENCE_STATE.block
						Engine.ShowOnlineUpsell( f10_local2 )
						break
					end
					f10_arg0._perController[f10_local2].fenceState = FenceOnlineServices.CONTROLLER_FENCE_STATE.pass
				else
					f10_arg0._perController[f10_local2].fenceState = FenceOnlineServices.CONTROLLER_FENCE_STATE.fail
				end
			elseif f10_local0 == FenceOnlineServices.CODE_STATE.queued then
				f10_arg0._perController[f10_local2].fenceState = FenceOnlineServices.CONTROLLER_FENCE_STATE.block
				f10_arg0._queued = true
			elseif f10_local0 ~= FenceOnlineServices.CODE_STATE.success then
				f10_arg0._perController[f10_local2].fenceState = FenceOnlineServices.CONTROLLER_FENCE_STATE.block
			else
				f10_arg0._perController[f10_local2].fenceState = FenceOnlineServices.CONTROLLER_FENCE_STATE.pass
			end
			if f10_arg0._perController[f10_local2].isCancelling then
				f10_arg0._perController[f10_local2].fenceState = FenceOnlineServices.CONTROLLER_FENCE_STATE.fail
				f10_arg0._perController[f10_local2].errorCode = nil
			end
		end
		f10_arg0._perController[f10_local2].onlineUpsell = FenceOnlineServices.UPSELL_STATE.inactive
		f10_arg0._perController[f10_local2].fenceState = FenceOnlineServices.CONTROLLER_FENCE_STATE.inactive
		f10_arg0._perController[f10_local2].isCancelling = false
		f10_arg0._perController[f10_local2].errorCode = nil
	end
	local f10_local2 = 0
	local f10_local3 = 0
	local f10_local4 = 0
	for f10_local9 = 0, Engine.GetMaxControllerCount() - 1, 1 do
		if f10_arg0._perController[f10_local9].fenceState == FenceOnlineServices.CONTROLLER_FENCE_STATE.pass then
			f10_local2 = f10_local2 + 1
		end
		if f10_arg0._perController[f10_local9].fenceState == FenceOnlineServices.CONTROLLER_FENCE_STATE.block then
			f10_local3 = f10_local3 + 1
		end
		if f10_arg0._perController[f10_local9].fenceState == FenceOnlineServices.CONTROLLER_FENCE_STATE.fail then
			f10_local4 = f10_local4 + 1
		end
	end
	assert( f10_local4 + f10_local3 + f10_local2 > 0, "No active local clients" )
	if f10_local4 > 0 then
		for f10_local9 = 0, Engine.GetMaxControllerCount() - 1, 1 do
			if f10_arg0._perController[f10_local9].fenceState == FenceOnlineServices.CONTROLLER_FENCE_STATE.fail then
				local f10_local7 = f10_arg0._perController[f10_local9].errorCode
				if f10_local2 > 0 and not Lobby.IsControllerIndexHostOfAnyParty( f10_local9 ) then
					DebugPrint( "Controller #" .. tostring( f10_local9 ) .. " does not meet requirements for online play. Making client inactive." )
					f10_arg0._state = LUI.Fence.STATE.block
					Engine.MakeLocalClientInactive( f10_local9 )
					if f10_local7 then
						assert( type( f10_local7 ) == "number" )
						local f10_local8 = assert
						local f10_local11
						if f10_local7 <= 0 or f10_local7 > FenceOnlineServices.ERROR_CODES.max then
							f10_local11 = false
						else
							f10_local11 = true
						end
						f10_local8( f10_local11 )
						LUI.FlowManager.RequestPopupMenu( nil, "popup_connecting_error", false, false, false, {
							errorCode = f10_local7
						}, nil, false, true )
					end
				end
				f10_arg0._errorCode = f10_local7
				f10_arg0._state = LUI.Fence.STATE.fail
			end
		end
	elseif f10_local3 > 0 then
		f10_arg0._state = LUI.Fence.STATE.block
	elseif f10_local2 > 0 then
		f10_arg0._state = LUI.Fence.STATE.pass
	else
		f10_arg0._state = LUI.Fence.STATE.block
	end
	if f10_arg0._state == LUI.Fence.STATE.block then
		local f10_local9 = function ( f11_arg0 )
			if f10_arg0._openedWaitPopup ~= nil and f10_arg0._openedWaitPopup ~= f11_arg0 then
				LUI.FlowManager.RequestLeaveMenuByName( f10_arg0._openedWaitPopup, true )
				f10_arg0._openedWaitPopup = nil
				return true
			elseif f10_arg0._openedWaitPopup == nil then
				return true
			else
				return false
			end
		end
		
		if f10_arg0._queued then
			if f10_local9( "popup_online_queue" ) then
				f10_arg0:OpenQueuedPopup()
			end
		elseif f10_local9( "popup_connecting" ) then
			f10_arg0:OpenConnectingPopup()
		end
	end
end

function PopupConnecting( f12_arg0, f12_arg1 )
	assert( f12_arg1 and f12_arg1.onCancel )
	local f12_local0 = MenuBuilder.buildItems( {
		type = "live_dialog_text_box_with_cancel",
		properties = {
			message = Engine.Localize( "XBOXLIVE_POPUP_CONNECTION" ),
			cancel_func = f12_arg1.onCancel
		}
	} )
	f12_local0.id = "popup_connecting"
	return f12_local0
end

function PopupConnectingError( f13_arg0, f13_arg1 )
	assert( f13_arg1 and f13_arg1.errorCode )
	local f13_local0 = nil
	local f13_local1 = f13_arg1.errorCode
	if f13_local1 == FenceOnlineServices.ERROR_CODES.signedOutOfLive then
		f13_local0 = "XBOXLIVE_SIGNEDOUTOFLIVE"
	elseif f13_local1 == FenceOnlineServices.ERROR_CODES.guestWithoutSponsor then
		f13_local0 = "MPUI_GUEST_SPONSOR_ERROR"
	elseif f13_local1 == FenceOnlineServices.ERROR_CODES.MPNotAllowed then
		f13_local0 = "XBOXLIVE_MPNOTALLOWED"
	elseif f13_local1 == FenceOnlineServices.ERROR_CODES.connecting then
		assert( false, "Unexpected error code" )
	elseif f13_local1 == FenceOnlineServices.ERROR_CODES.signedOutOfSteamOnline then
		f13_local0 = "PLATFORM_STEAM_OFFLINE"
	elseif f13_local1 == FenceOnlineServices.ERROR_CODES.networkConnection then
		f13_local0 = "XBOXLIVE_NETCONNECTION"
	elseif f13_local1 == FenceOnlineServices.ERROR_CODES.PSPlusRequired then
		f13_local0 = "PLATFORM_PSPLUS_REQUIRED"
	elseif f13_local1 == FenceOnlineServices.ERROR_CODES.TURequired then
		f13_local0 = "PLATFORM_TU_REQUIRED"
	elseif f13_local1 == FenceOnlineServices.ERROR_CODES.timeout then
		f13_local0 = "PLATFORM_ONLINE_TIMEOUT"
	elseif f13_local1 == FenceOnlineServices.ERROR_CODES.onlineServices then
		f13_local0 = "PLATFORM_ONLINE_SERVICES_ERROR"
	end
	assert( f13_local0 )
	local f13_local2 = MenuBuilder.buildItems( {
		type = "generic_confirmation_popup",
		properties = {
			popup_title = Engine.Localize( "MENU_ERROR" ),
			message_text = Engine.Localize( f13_local0 )
		}
	} )
	f13_local2.id = "popup_connecting_error"
	return f13_local2
end

function PopupOnlineQueue( f14_arg0, f14_arg1 )
	assert( f14_arg1 )
	local f14_local0 = MenuBuilder.buildItems( {
		type = "FenceOnlineQueueDialogPopupWithDescription",
		properties = {
			message = Engine.Localize( "LUA_MENU_MP_SERVER_QUEUE" ),
			description = Engine.Localize( "LUA_MENU_MP_SERVER_QUEUE_MSG" ),
			onCancel = f14_arg1.onCancel,
			controllerIndex = f14_arg1.controllerIndex or 0
		}
	} )
	f14_local0.id = "popup_online_queue"
	return f14_local0
end

MenuBuilder.registerType( "popup_online_queue", PopupOnlineQueue )
MenuBuilder.registerType( "popup_connecting", PopupConnecting )
MenuBuilder.registerType( "popup_connecting_error", PopupConnectingError )
FenceOnlineServicesPremium = LUI.Class( FenceOnlineServices )
FenceOnlineServicesPremium.init = function ( f15_arg0 )
	FenceOnlineServicesPremium.super.init( f15_arg0, false )
end

LUI.Fence.Register( "onlineServices", FenceOnlineServicesPremium )
FenceOnlineServicesNoPremium = LUI.Class( FenceOnlineServices )
FenceOnlineServicesNoPremium.init = function ( f16_arg0 )
	FenceOnlineServicesNoPremium.super.init( f16_arg0, true )
end

LUI.Fence.Register( "onlineServicesNoPremium", FenceOnlineServicesNoPremium )
LockTable( _M )
