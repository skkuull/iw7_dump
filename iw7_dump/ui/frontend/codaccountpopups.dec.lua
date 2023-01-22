local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
function CODAccountEnterPopup( f1_arg0, f1_arg1 )
	local f1_local0 = {
		title = Engine.Localize( "CODACCOUNT_COD_ACCOUNT_CAPS" ),
		width = _1080p * 750,
		defaultFocusIndex = 0,
		cancelClosesPopup = true
	}
	local f1_local1 = MenuBuilder.BuildRegisteredType( "CODAccountEnter", {
		controllerIndex = f1_arg1.controllerIndex
	} )
	f1_local1.id = "CODAccountEnter"
	f1_local0.listContent = {}
	table.insert( f1_local0.listContent, f1_local1 )
	local f1_local2 = MenuBuilder.BuildRegisteredType( "PopupList", f1_local0 )
	f1_local2.id = "CODAccountEnterPopup"
	return f1_local2
end

function CODAccountSignInPopup( f2_arg0, f2_arg1 )
	local f2_local0 = {
		title = Engine.Localize( "CODACCOUNT_CODA_SIGNIN_TITLE" ),
		width = _1080p * 750,
		defaultFocusIndex = 2,
		cancelClosesPopup = true
	}
	local f2_local1 = MenuBuilder.BuildRegisteredType( "CODAccountSignIn", {
		controllerIndex = f2_arg1.controllerIndex
	} )
	f2_local1.id = "CODAccountSignIn"
	f2_local0.listContent = {}
	table.insert( f2_local0.listContent, f2_local1 )
	local f2_local2 = MenuBuilder.BuildRegisteredType( "PopupList", f2_local0 )
	f2_local2.id = "CODAccountSignInPopup"
	return f2_local2
end

function CODAccountEntryErrorPopup( f3_arg0, f3_arg1 )
	local f3_local0 = Engine.Localize( "@CODACCOUNT_CODA_REGISTER_ENTRY_ERROR" )
	if f3_arg1 and f3_arg1.extraMessage then
		f3_local0 = Engine.MarkLocalized( f3_local0 .. "\n" .. Engine.Localize( f3_arg1.extraMessage ) )
	end
	local f3_local1 = MenuBuilder.buildItems( {
		type = "generic_confirmation_popup",
		properties = {
			cancel_will_close = false,
			popup_title = Engine.Localize( "MENU_ERROR" ),
			message_text = f3_local0,
			button_text = Engine.Localize( "LUA_MENU_CONTINUE" )
		}
	} )
	f3_local1.id = "CODAccountEntryErrorPopup"
	return f3_local1
end

function CODAccountEmailConfirmContinue( f4_arg0, f4_arg1 )
	LUI.FlowManager.RequestLeaveMenu( f4_arg0 )
	f4_arg0:dispatchEventToRoot( {
		name = "codaccount_start_registration",
		id = "coda_registration",
		controller = f4_arg1.controller
	} )
end

function CODAccountEmailConfirmPopup( f5_arg0, f5_arg1 )
	local f5_local0 = MenuBuilder.buildItems( {
		type = "generic_yesno_popup",
		properties = {
			popup_title = Engine.Localize( "CODACCOUNT_CODA_EMAIL_CONFIRM_TITLE" ),
			message_text = Engine.Localize( "CODACCOUNT_CODA_EMAIL_CONFIRM_TEXT", f5_arg1.emailConfirm ),
			yes_action = CODAccountEmailConfirmContinue,
			no_action = MBh.LeaveMenu(),
			yes_text = Engine.Localize( "LUA_MENU_CONTINUE" ),
			no_text = Engine.Localize( "LUA_MENU_CANCEL" )
		}
	} )
	f5_local0.id = "CODAccountEmailConfirmPopup"
	return f5_local0
end

function CODAccountQuitConfirmPopup()
	return {
		type = "generic_yesno_popup",
		id = "codaccount_quit_confirm_popup",
		properties = {
			popup_title = Engine.Localize( "PLATFORM_QUIT" ),
			message_text = Engine.Localize( "MENU_QUIT_WARNING" ),
			yes_action = function ( f7_arg0, f7_arg1 )
				f7_arg0:dispatchEventToRoot( {
					name = "codaccount_exit",
					id = "coda_registration"
				} )
			end
			,
			no_action = MBh.LeaveMenu(),
			yes_text = Engine.Localize( "MENU_QUIT" ),
			no_text = Engine.Localize( "LUA_MENU_CANCEL" )
		}
	}
end

function CODAccountUnavailablePopup( f8_arg0, f8_arg1 )
	local f8_local0 = MenuBuilder.buildItems( {
		type = "generic_confirmation_popup",
		properties = {
			cancel_will_close = false,
			popup_title = Engine.Localize( "GAME_WARNING" ),
			message_text = Engine.Localize( "@CODACCOUNT_CODA_UNAVAILABLE" ),
			confirmation_action = MBh.LeaveMenu()
		}
	} )
	f8_local0.id = "CODAccountUnavailablePopup"
	return f8_local0
end

function CODAccountAllDonePopup( f9_arg0, f9_arg1 )
	Engine.SetPlayerDataEx( f9_arg1.controllerIndex, CoD.StatsGroup.Common, "CODAccountSignupRequest", true )
	local f9_local0 = MenuBuilder.buildItems( {
		type = "generic_confirmation_popup",
		properties = {
			cancel_will_close = false,
			popup_title = Engine.Localize( "CODACCOUNT_COD_ACCOUNT_CAPS" ),
			message_text = Engine.Localize( "CODACCOUNT_CODA_ALL_DONE" ),
			button_text = Engine.Localize( "LUA_MENU_CONTINUE" ),
			confirmation_action = MBh.LeaveMenu()
		}
	} )
	f9_local0.id = "CODAccountAllDonePopup"
	return f9_local0
end

function CODAccountSignInFencePopup( f10_arg0, f10_arg1 )
	local f10_local0 = assert
	local f10_local1 = f10_arg1
	local f10_local2 = f10_arg1.onCancel
	if f10_local2 then
		f10_local2 = f10_local1 and f10_arg1.callingFence
	end
	f10_local0( f10_local2 )
	f10_local2 = MenuBuilder.buildItems( {
		type = "live_dialog_text_box",
		properties = {
			message = Engine.Localize( "CODACCOUNT_CODA_SIGNING_IN" ),
			cancel_func = f10_arg1.onCancel
		}
	} )
	f10_local2.id = "CODAccountSignInFencePopup"
	f10_local2.fence = f10_arg1.callingFence
	f10_local2:registerEventHandler( "codaccount_create_error", function ( element, event )
		element.fence._errors = event
	end )
	f10_local2:registerEventHandler( "codaccount_retrieve_error", function ( element, event )
		element.fence._errors = event
	end )
	f10_local2:registerEventHandler( "codaccount_link_error", function ( element, event )
		element.fence._errors = event
	end )
	return f10_local2
end

function CODAccountSuccessPopup( f14_arg0, f14_arg1 )
	local f14_local0 = {
		title = Engine.Localize( "CODACCOUNT_COD_ACCOUNT_CAPS" ),
		width = _1080p * 600,
		defaultFocusIndex = 0,
		cancelClosesPopup = false
	}
	local f14_local1 = MenuBuilder.BuildRegisteredType( "CODAccountSuccess", {
		controllerIndex = f14_arg1.controllerIndex
	} )
	f14_local1.id = "CODAccountSuccess"
	f14_local0.listContent = {}
	table.insert( f14_local0.listContent, f14_local1 )
	local f14_local2 = MenuBuilder.BuildRegisteredType( "PopupList", f14_local0 )
	f14_local2.id = "CODAccountSuccessPopup"
	return f14_local2
end

function CODAccountSignInErrorPopup( f15_arg0, f15_arg1 )
	local f15_local0 = MenuBuilder.buildItems( {
		type = "generic_confirmation_popup",
		properties = {
			popup_title = Engine.Localize( "CODACCOUNT_COD_ACCOUNT_CAPS" ),
			message_text = Engine.Localize( CODACCOUNT.GetErrorStringFromSingleIdentityErrors( f15_arg1.singleIdentityErrors ) )
		}
	} )
	f15_local0.id = "CODAccountSignInErrorPopup"
	return f15_local0
end

MenuBuilder.registerType( "CODAccountEnterPopup", CODAccountEnterPopup )
MenuBuilder.registerType( "CODAccountSuccessPopup", CODAccountSuccessPopup )
MenuBuilder.registerType( "CODAccountAllDonePopup", CODAccountAllDonePopup )
MenuBuilder.registerType( "CODAccountUnavailablePopup", CODAccountUnavailablePopup )
MenuBuilder.registerDef( "CODAccountQuitConfirmPopup", CODAccountQuitConfirmPopup )
MenuBuilder.registerType( "CODAccountSignInPopup", CODAccountSignInPopup )
LUI.FlowManager.RegisterStackPushBehaviour( "CODAccountSignInPopup", CoD.GameDVRDisable )
LUI.FlowManager.RegisterStackPopBehaviour( "CODAccountSignInPopup", CoD.GameDVREnable )
MenuBuilder.registerType( "CODAccountEntryErrorPopup", CODAccountEntryErrorPopup )
LUI.FlowManager.RegisterStackPushBehaviour( "CODAccountEntryErrorPopup", CoD.GameDVRDisable )
LUI.FlowManager.RegisterStackPopBehaviour( "CODAccountEntryErrorPopup", CoD.GameDVREnable )
MenuBuilder.registerType( "CODAccountEmailConfirmPopup", CODAccountEmailConfirmPopup )
LUI.FlowManager.RegisterStackPushBehaviour( "CODAccountEmailConfirmPopup", CoD.GameDVRDisable )
LUI.FlowManager.RegisterStackPopBehaviour( "CODAccountEmailConfirmPopup", CoD.GameDVREnable )
MenuBuilder.registerType( "CODAccountSignInErrorPopup", CODAccountSignInErrorPopup )
LUI.FlowManager.RegisterStackPushBehaviour( "CODAccountSignInErrorPopup", CoD.GameDVRDisable )
LUI.FlowManager.RegisterStackPopBehaviour( "CODAccountSignInErrorPopup", CoD.GameDVREnable )
MenuBuilder.registerType( "CODAccountSignInFencePopup", CODAccountSignInFencePopup )
LUI.FlowManager.RegisterStackPushBehaviour( "CODAccountSignInFencePopup", CoD.GameDVRDisable )
LUI.FlowManager.RegisterStackPopBehaviour( "CODAccountSignInFencePopup", CoD.GameDVREnable )
LockTable( _M )
