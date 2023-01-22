local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
FencePatch = LUI.Class( LUI.Fence )
FencePatch.CODE_STATE = {
	active = 0,
	success = 1,
	success_restart = 2,
	failure = 3,
	update_needed = 4
}
FencePatch.init = function ( f1_arg0 )
	LUI.Fence.init( f1_arg0 )
	Fences.PatchResetState()
end

FencePatch.Start = function ( f2_arg0 )
	DebugPrint( "FencePatch.Start" )
end

FencePatch.Stop = function ( f3_arg0 )
	DebugPrint( "FencePatch.Stop" )
	LUI.FlowManager.RequestLeaveMenuByName( "PopupPatching", true )
	f3_arg0._openedWaitPopup = false
end

FencePatch.OpenPopup = function ( f4_arg0 )
	local f4_local0 = f4_arg0
	LUI.FlowManager.RequestPopupMenu( nil, "PopupPatching", false, false, false, {
		onCancel = function ( f5_arg0, f5_arg1 )
			f4_local0._state = LUI.Fence.STATE.fail
		end
	}, nil, true, true )
	f4_arg0._openedWaitPopup = true
end

FencePatch.PostFail = function ( f6_arg0 )
	local f6_local0, f6_local1 = Fences.PatchGetState()
	if f6_arg0._state == LUI.Fence.STATE.fail and f6_local0 == FencePatch.CODE_STATE.update_needed then
		LUI.FlowManager.RequestPopupMenu( nil, "newPatchManifestRestart", false, false, false, {}, nil, true, true )
	elseif f6_arg0._state == LUI.Fence.STATE.fail and f6_arg0._errorCode then
		LUI.FlowManager.RequestPopupMenu( nil, "PopupPatchingError", false, false, false, {
			errorCode = f6_arg0._errorCode
		}, nil, false, true )
	end
end

FencePatch.UpdateState = function ( f7_arg0 )
	assert( f7_arg0._state ~= LUI.Fence.STATE.fail )
	f7_arg0._state = LUI.Fence.STATE.pass
	local f7_local0, f7_local1 = Fences.PatchGetState()
	if f7_local0 == FencePatch.CODE_STATE.failure then
		f7_arg0._errorCode = f7_local1
		f7_arg0._state = LUI.Fence.STATE.fail
	elseif f7_local0 == FencePatch.CODE_STATE.success_restart then
		LUI.FlowManager.RequestLeaveMenuByName( "PopupPatching", true )
		LUI.FlowManager.RequestPopupMenu( nil, "PopupPatchingRestart", false, false, false, {}, nil, true, true )
		f7_arg0._state = LUI.Fence.STATE.block
	elseif f7_local0 == FencePatch.CODE_STATE.active then
		f7_arg0._state = LUI.Fence.STATE.block
	elseif f7_local0 == FencePatch.CODE_STATE.update_needed then
		f7_arg0._state = LUI.Fence.STATE.fail
	end
	if f7_arg0._state == LUI.Fence.STATE.block and not f7_arg0._openedWaitPopup then
		f7_arg0:OpenPopup()
	end
end

function PopupPatching( f8_arg0, f8_arg1 )
	assert( f8_arg1 )
	f8_arg1.message = Engine.Localize( "LUA_MENU_PATCH_DOWNLOADING" )
	local f8_local0 = MenuBuilder.BuildRegisteredType( "FenceDialogPopupWithProgress", f8_arg1 )
	local self = LUI.UITimer.new( nil, {
		interval = 200,
		event = "update_bar"
	} )
	self.id = "timer"
	f8_local0:addElement( self )
	assert( f8_local0.SetProgress )
	self:registerEventHandler( "update_bar", function ( element, event )
		f8_local0:SetProgress( Fences.PatchGetProgress() )
	end )
	return f8_local0
end

f0_local0 = function ( f10_arg0, f10_arg1 )
	Engine.SystemRestart( Engine.Localize( "@LUA_MENU_PATCH_UPDATE_FAILED_RESTART" ) )
end

function PopupPatchingError( f11_arg0, f11_arg1 )
	assert( f11_arg1 )
	assert( type( f11_arg1.errorCode ) == "number" )
	local f11_local0 = Engine.GetLastErrorCode()
	if string.len( f11_local0 ) == 0 then
		f11_local0 = tostring( f11_arg1.errorCode )
	end
	Engine.ClearLastErrorCode()
	local f11_local1 = MenuBuilder.buildItems( {
		type = "generic_confirmation_popup",
		properties = {
			confirmation_action = f0_local0,
			popup_title = Engine.Localize( "MENU_ERROR" ),
			message_text = Engine.Localize( "LUA_MENU_PATCH_UPDATE_FAILED", f11_local0 ),
			cancel_will_close = false
		}
	} )
	f11_local1.id = "PopupPatchingError"
	return f11_local1
end

function PopupPatchingRestart( f12_arg0, f12_arg1 )
	assert( f12_arg1 )
	local f12_local0 = MenuBuilder.buildItems( {
		type = "generic_confirmation_popup",
		properties = {
			popup_title = Engine.Localize( "MENU_NOTICE" ),
			message_text = Engine.Localize( "LUA_MENU_PATCH_UPDATE_RESTART" ),
			confirmation_action = function ()
				Fences.PatchRestart()
			end,
			cancel_will_close = false
		}
	} )
	f12_local0.id = "PopupPatchingRestart"
	return f12_local0
end

MenuBuilder.registerType( "PopupPatching", PopupPatching )
MenuBuilder.registerType( "PopupPatchingError", PopupPatchingError )
MenuBuilder.registerType( "PopupPatchingRestart", PopupPatchingRestart )
LUI.Fence.Register( "patch", FencePatch )
LockTable( _M )
