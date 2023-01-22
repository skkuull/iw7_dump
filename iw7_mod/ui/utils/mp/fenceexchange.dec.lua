local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
FenceExchange = LUI.Class( LUI.Fence )
FenceExchange.init = function ( f1_arg0 )
	LUI.Fence.init( f1_arg0 )
end

FenceExchange.Start = function ( f2_arg0 )
	DebugPrint( "FenceExchange.Start" )
end

FenceExchange.Stop = function ( f3_arg0 )
	DebugPrint( "FenceExchange.Stop" )
	LUI.FlowManager.RequestLeaveMenuByName( "popup_exchanging", true )
	f3_arg0._openedWaitPopup = false
end

FenceExchange.OnBackOut = function ( f4_arg0 )
	
end

FenceExchange.OpenPopup = function ( f5_arg0 )
	local f5_local0 = f5_arg0
	LUI.FlowManager.RequestPopupMenu( nil, "popup_exchanging", false, false, false, {}, nil, true, true )
	f5_arg0._openedWaitPopup = true
end

FenceExchange.UpdateState = function ( f6_arg0 )
	assert( f6_arg0._state ~= LUI.Fence.STATE.fail )
	f6_arg0._state = LUI.Fence.STATE.pass
	for f6_local0 = 0, Engine.GetMaxControllerCount() - 1, 1 do
		local f6_local3 = Engine.HasActiveLocalClient( f6_local0 )
		if f6_local3 and not (f6_local3 and Engine.IsUserAGuest( f6_local0 )) then
			if Commerce.GetSignInExchangeState( f6_local0 ) == 3 then
				Commerce.SetSignInExchangeState( f6_local0, 4 )
			end
			if Commerce.GetSignInExchangeState( f6_local0 ) <= 1 then
				f6_arg0._state = LUI.Fence.STATE.block
				break
			end
		end
	end
	if f6_arg0._state == LUI.Fence.STATE.block and not f6_arg0._openedWaitPopup then
		f6_arg0:OpenPopup()
	end
end

function PopupExchanging( f7_arg0, f7_arg1 )
	assert( f7_arg1 )
	local f7_local0 = MenuBuilder.buildItems( {
		type = "live_dialog_text_box",
		properties = {
			message = Engine.Localize( "LUA_MENU_MP_EXCHANGING" )
		}
	} )
	f7_local0.id = "popup_exchanging"
	return f7_local0
end

MenuBuilder.registerType( "popup_exchanging", PopupExchanging )
LUI.Fence.Register( "exchange", FenceExchange )
LockTable( _M )
