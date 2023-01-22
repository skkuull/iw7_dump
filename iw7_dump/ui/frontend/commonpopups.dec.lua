local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
function ReadingSaveDevice( f1_arg0, f1_arg1 )
	return MenuBuilder.BuildRegisteredType( "FenceDialogPopup", {
		message = Engine.Localize( "PLATFORM_READING_SAVE_DEVICE" ),
		controllerIndex = 0
	} )
end

function error_popmenu( f2_arg0, f2_arg1 )
	local f2_local0 = {
		title = Engine.GetDvarString( "com_errorTitle" ),
		message = Engine.GetDvarString( "com_errorMessage" )
	}
	local f2_local1 = Engine.GetLastErrorCode()
	if string.len( f2_local1 ) > 0 then
		f2_local0.statusMessage = Engine.Localize( "MENU_COM_ERROR_STRING_WITH_ERROR_CODE", f2_local1 )
	end
	Engine.ClearLastErrorCode()
	f2_local0.controllerIndex = f2_arg1.controllerIndex
	f2_local0.action = function ()
		Engine.ClearError()
	end
	
	local f2_local2 = MenuBuilder.BuildRegisteredType( "PopupOK", f2_local0 )
	f2_local2.id = "error_popmenu"
	return f2_local2
end

f0_local0 = function ( f4_arg0, f4_arg1 )
	DebugPrint( "QUIT GAME NOW" )
	Engine.Quit()
end

function quit_popmenu()
	return {
		type = "generic_yesno_popup",
		id = "quit_confirmation_id",
		properties = {
			popup_title = Engine.Localize( "@MENU_NOTICE" ),
			message_text = Engine.Localize( "@MENU_QUIT_WARNING" ),
			yes_action = f0_local0
		}
	}
end

f0_local1 = function ( f6_arg0, f6_arg1 )
	Engine.RetrySaveData( f6_arg1.controller )
end

f0_local2 = function ( f7_arg0, f7_arg1 )
	Engine.ClearSaveDataErrors( f7_arg1.controller )
end

function savedata_failed_popmenu()
	return {
		type = "generic_yesno_popup",
		id = "savedata_failed_popmenu_id",
		properties = {
			popup_title = Engine.Localize( "@MENU_SAVEDATA_FAILED_TITLE" ),
			message_text = Engine.Localize( "@MENU_SAVEDATA_FAILED_MESSAGE" ),
			yes_action = f0_local1,
			no_action = f0_local2
		}
	}
end

function live_party_invite_popmenu()
	return {
		type = "generic_yesno_popup",
		id = "live_party_invite_popmenu_id",
		properties = {
			popup_title = Engine.Localize( "@MENU_NOTICE" ),
			message_text = Engine.Localize( "@XBOXLIVE_PARTY_INVITE" ),
			yes_text = Engine.Localize( "@XBOXLIVE_PARTY_INVITE_ACCEPT_NOW" ),
			yes_action = function ( f10_arg0, f10_arg1 )
				Friends.AcceptLivePartyInvitation( f10_arg1.controller )
			end
			,
			no_text = Engine.Localize( "@XBOXLIVE_PARTY_INVITE_ACCEPT_LATER" ),
			no_action = function ( f11_arg0, f11_arg1 )
				
			end
			
		}
	}
end

function CancelAcceptingInvite( f12_arg0, f12_arg1 )
	DebugPrint( "CancelAcceptingInvite triggered" )
	Engine.SetDvarBool( "onlinegame", false )
	Engine.SetDvarBool( "systemlink", false )
	Engine.Exec( "xstopparty WAITING_POPUP_CANCELED_ACTION", f12_arg1 )
	Engine.Exec( "xstopprivateparty", f12_arg1 )
	Engine.Exec( "xcancelconnectingdialog", f12_arg1 )
	LUI.FlowManager.RequestLeaveMenu( f12_arg0 )
end

function AcceptingInvite( f13_arg0, f13_arg1 )
	local f13_local0 = MenuBuilder.BuildRegisteredType( "FenceDialogPopup", {
		message = Engine.Localize( "MENU_POPUP_ACCEPTINVITE" ),
		controllerIndex = f13_arg1.controllerIndex,
		onCancel = CancelAcceptingInvite
	} )
	f13_local0.id = "AcceptingInvite"
	return f13_local0
end

function UpdateTextDots( f14_arg0, f14_arg1 )
	assert( f14_arg0.properties.numDots )
	assert( f14_arg0.properties.message )
	local f14_local0 = f14_arg0.properties.numDots
	local f14_local1 = f14_arg0.properties.message
	f14_local0 = (f14_local0 + 1) % 4
	for f14_local2 = 1, f14_local0, 1 do
		local f14_local5 = f14_local2
		f14_local1 = f14_local1 .. ". "
	end
	f14_arg0:setText( f14_local1 )
	f14_arg0.properties.numDots = f14_local0
end

function AddLiveDialogFooterHelperText( f15_arg0 )
	local f15_local0 = ButtonHelperText.helperTextItem( ButtonMap.button_secondary, Engine.Localize( "@LUA_MENU_CANCEL" ), nil, nil, nil )
	f15_local0.triggers_event = "button_secondary"
	f15_local0.id = "popup_cancel_text_id"
	local f15_local1 = Engine.IsConsoleGame()
	if not f15_local1 then
		f15_local1 = Engine.IsGamepadEnabled() == 1
	end
	local f15_local2
	if f15_local1 then
		f15_local2 = 32
		if not f15_local2 then
		
		else
			f15_local0:registerAnimationState( "default", {
				leftAnchor = false,
				rightAnchor = false,
				topAnchor = false,
				bottomAnchor = false,
				left = -50,
				right = 50,
				top = 35,
				height = f15_local2
			} )
			f15_local0:animateToState( "default" )
			f15_local0:registerEventHandler( "virtual_keyboard_popup_active", MBh.EmitEvent( "popup_active" ) )
			f15_arg0:addElement( f15_local0 )
		end
	end
	f15_local2 = CoD.TextSettings.SmallFont.Height
end

function FenceDialogPopup( f16_arg0, f16_arg1 )
	assert( f16_arg1.controllerIndex )
	assert( f16_arg1.message )
	local f16_local0 = MenuBuilder.BuildRegisteredType( "FenceDialog", {
		controllerIndex = f16_arg1.controllerIndex
	} )
	assert( f16_local0.Message )
	f16_local0.Message:setText( f16_arg1.message )
	f16_local0.SetText = function ( f17_arg0, f17_arg1 )
		f17_arg0.Message:setText( f17_arg1 )
	end
	
	if f16_arg1.onCancel then
		local self = LUI.UIBindButton.new()
		self.onCancel = f16_arg1.onCancel
		self:registerEventHandler( "button_secondary", function ( element, event )
			assert( element.onCancel )
			assert( event.controller )
			element:onCancel( event.controller )
		end )
		f16_local0:addElement( self )
		AddLiveDialogFooterHelperText( f16_local0 )
	end
	if f16_local0.Spinner then
		local self = LUI.UIImage.new()
		self:setImage( RegisterMaterial( "white_2d_stencil_mask" ) )
		self:SetAnchorsAndPosition( 1, 0, 0, 0, 5, 1280, -50, 50 )
		f16_local0.Spinner:addElement( self )
		f16_local0.Message:SetMask( self )
		local f16_local2 = f16_local0:Wait( 550 )
		f16_local2.onComplete = function ()
			local f19_local0 = f16_local0.Message:GetCurrentFont()
			local f19_local1, f19_local2, f19_local3, f19_local4 = f16_local0.Message:getLocalRect()
			local f19_local5, f19_local6, f19_local7, f19_local8 = GetTextDimensions( f16_arg1.message, f19_local0, math.abs( f19_local4 - f19_local2 ) )
			f19_local4 = f19_local8
			f19_local3 = f19_local7
			f19_local2 = f19_local6
			f19_local5 = math.abs( f19_local3 - f19_local5 )
			f16_local0.Message:SetLeft( -f19_local5 / 2 )
			f16_local0.Message:SetRight( -f19_local5 / 2 )
			f16_local0.Message:SetLeft( 0, 450, LUI.EASING.outBack )
			f16_local0.Message:SetRight( 0, 450, LUI.EASING.outBack )
			local f19_local6, f19_local7, f19_local8, f19_local9 = f16_local0.Spinner:getLocalRect()
			f16_local0.Spinner:SetLeft( f19_local6 - f19_local5 / 2 - 25, 450, LUI.EASING.outBack )
			f16_local0.Spinner:SetRight( f19_local8 - f19_local5 / 2 - 25, 450, LUI.EASING.outBack )
		end
		
	end
	return f16_local0
end

function FenceDialogPopupWithProgress( f20_arg0, f20_arg1 )
	if not f20_arg1 then
		f20_arg1 = {}
	end
	local f20_local0 = MenuBuilder.BuildRegisteredType( "FenceDialogPopup", f20_arg1 )
	local self = LUI.UIElement.new()
	self.id = "progressBar"
	f20_local0:addElement( self )
	self:SetAlpha( 0 )
	local f20_local2 = self:Wait( 800 )
	f20_local2.onComplete = function ()
		self:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, -125, 125, 22, 25 )
		self:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, -125, 125, 18, 21, 100, LUI.EASING.outQuadratic )
		self:SetAlpha( 1, 50 )
	end
	
	local f20_local3 = LUI.UIImage.new()
	f20_local3:SetRGBFromInt( 0 )
	f20_local3:SetAlpha( 0.5 )
	f20_local3.id = "background"
	self:addElement( f20_local3 )
	local f20_local4 = LUI.UIImage.new()
	f20_local4:SetRGBFromInt( 0 )
	f20_local4:SetRightAnchor( 1 )
	f20_local4.id = "fill"
	self:addElement( f20_local4 )
	f20_local0.SetProgress = function ( f22_arg0, f22_arg1 )
		f20_local4:SetRightAnchor( 1 - LUI.clamp( f22_arg1, 0, 1 ), 80, LUI.EASING.inOutQuadratic )
	end
	
	return f20_local0
end

function FenceOnlineQueueDialogPopupWithDescription( f23_arg0, f23_arg1 )
	if not f23_arg1 then
		f23_arg1 = {}
	end
	local f23_local0 = MenuBuilder.BuildRegisteredType( "FenceDialogPopup", f23_arg1 )
	local f23_local1 = f23_arg1.controllerIndex or 0
	local Description = nil
	
	Description = LUI.UIText.new()
	Description.id = "Description"
	Description:SetRGBFromInt( 16777215, 0 )
	Description:SetAlpha( 1, 0 )
	Description:setText( f23_arg1.description )
	Description:SetFontSize( 30 * _1080p )
	Description:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Description:SetAlignment( LUI.Alignment.Center )
	Description:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -500, _1080p * 500, _1080p * 110, _1080p * 140 )
	f23_local0:addElement( Description )
	f23_local0.Description = Description
	
	local WaitTime = nil
	
	WaitTime = LUI.UIText.new()
	WaitTime.id = "WaitTime"
	WaitTime:SetRGBFromInt( 16777215, 0 )
	WaitTime:SetAlpha( 1, 0 )
	WaitTime:setText( "Estimated Wait: " )
	WaitTime:SetFontSize( 26 * _1080p )
	WaitTime:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	WaitTime:SetAlignment( LUI.Alignment.Center )
	WaitTime:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -400, _1080p * 400, _1080p * 270, _1080p * 300 )
	f23_local0:addElement( WaitTime )
	f23_local0.WaitTime = WaitTime
	
	local f23_local4 = nil
	f23_local4 = function ()
		local f24_local0 = Engine.GetQueueWaitTimeSecs( f23_local1 )
		DebugPrint( " wait time: " .. f24_local0 )
		local f24_local1 = math.floor( f24_local0 / 3600 )
		f24_local0 = f24_local0 - f24_local1 * 3600
		local f24_local2 = math.floor( f24_local0 / 60 )
		WaitTime:setText( Engine.Localize( "MP_FRONTEND_ONLY_ESTIMATED_WAIT", f24_local1, f24_local2, f24_local0 - f24_local2 * 60 ) )
		local f24_local3 = WaitTime:Wait( 1000 )
		f24_local3.onComplete = f23_local4
	end
	
	local f23_local5 = WaitTime:Wait( 1000 )
	f23_local5.onComplete = f23_local4
	f23_local4()
	local WaitPosition = nil
	
	WaitPosition = LUI.UIText.new()
	WaitPosition.id = "WaitPosition"
	WaitPosition:SetRGBFromInt( 16777215, 0 )
	WaitPosition:SetAlpha( 1, 0 )
	WaitPosition:setText( "Position: " )
	WaitPosition:SetFontSize( 26 * _1080p )
	WaitPosition:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	WaitPosition:SetAlignment( LUI.Alignment.Center )
	WaitPosition:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -400, _1080p * 400, _1080p * 310, _1080p * 340 )
	f23_local0:addElement( WaitPosition )
	f23_local0.WaitPosition = WaitPosition
	
	local f23_local7 = nil
	f23_local7 = function ()
		WaitPosition:setText( Engine.Localize( "MP_FRONTEND_ONLY_CURRENT_POSITION", Engine.GetQueuePosition( f23_local1 ) ) )
		local f25_local0 = WaitPosition:Wait( 1000 )
		f25_local0.onComplete = f23_local7
	end
	
	local f23_local8 = WaitPosition:Wait( 1000 )
	f23_local8.onComplete = f23_local7
	f23_local7()
	return f23_local0
end

function live_dialog_text_box_with_cancel( f26_arg0, f26_arg1 )
	if not f26_arg1 then
		f26_arg1 = {}
	end
	return MenuBuilder.BuildRegisteredType( "FenceDialogPopup", {
		message = f26_arg1.message or "",
		controllerIndex = f26_arg1.controllerIndex or 0,
		onCancel = f26_arg1.cancel_func
	} )
end

function live_dialog_text_box( f27_arg0, f27_arg1 )
	if not f27_arg1 then
		f27_arg1 = {}
	end
	return MenuBuilder.BuildRegisteredType( "FenceDialogPopup", {
		message = f27_arg1.message or "",
		controllerIndex = f27_arg1.controllerIndex or 0
	} )
end

function menu_online_ended()
	local f28_local0 = MenuBuilder.BuildRegisteredType( "PopupOK", {
		title = Engine.Localize( "@MENU_NOTICE" ),
		message = Engine.GetDvarString( "online_end_reason" )
	} )
	f28_local0.id = "menu_online_ended"
	return f28_local0
end

local f0_local3 = function ( f29_arg0, f29_arg1 )
	Engine.Exec( "disconnect" )
end

function quit_no_save_confirm_popup()
	return {
		type = "generic_yesno_popup",
		id = "quit_no_save_confirm_popup_id",
		properties = {
			popup_title = Engine.Localize( "@PLATFORM_QUIT" ),
			message_text = Engine.Localize( "@MENU_QUIT_WARNING" ),
			yes_action = f0_local3,
			yes_text = Engine.Localize( "@MENU_QUIT" ),
			no_text = Engine.Localize( "@LUA_MENU_CANCEL" )
		}
	}
end

function quit_confirm_popup()
	return {
		type = "generic_yesno_popup",
		id = "quit_confirm_popup_id",
		properties = {
			popup_title = Engine.Localize( "@PLATFORM_QUIT" ),
			message_text = Engine.Localize( "@MENU_ARE_YOU_SURE_QUIT" ),
			yes_action = f0_local3,
			yes_text = Engine.Localize( "@MENU_QUIT" ),
			no_text = Engine.Localize( "@LUA_MENU_CANCEL" )
		}
	}
end

function campaign_mode_savedata_error_popup( f32_arg0, f32_arg1 )
	local f32_local0 = MenuBuilder.BuildRegisteredType( "PopupOK", {
		title = Engine.Localize( "MENU_CORRUPT_SAVEDATA_TITLE" ),
		message = Engine.Localize( "MENU_CORRUPT_SAVEDATA_CAMPAIGN" ),
		controllerIndex = f32_arg1.controllerIndex,
		action = function ( f33_arg0 )
			HudUtility.CorruptSaveDataRepairForSP( f32_arg1.controllerIndex )
			Engine.Unpause()
		end
	} )
	f32_local0.id = "campaign_mode_savedata_error_popup"
	return f32_local0
end

local f0_local4 = function ( f34_arg0 )
	return Engine.MarkLocalized( string.format( "%02d", f34_arg0 ) )
end

local f0_local5 = function ( f35_arg0, f35_arg1 )
	Engine.ExecNow( "profile_toggleEnableGamepad" )
	Engine.ExecNow( "updategamerprofile" )
	local f35_local0 = Engine.GetLuiRoot()
	f35_local0:TryAddMouseCursor()
	f35_arg0:dispatchEventToRoot( {
		name = "refresh_button_helper"
	} )
end

if Engine.IsConsoleGame() then
	function controllerremoved_popmenu()
		return MenuBuilder.BuildRegisteredType( "FenceDialogPopup", {
			message = Engine.Localize( "PLATFORM_CONTROLLER_DISCONNECTED" ),
			controllerIndex = 0
		} )
	end
	
else
	function controllerremoved_popmenu()
		return MenuBuilder.buildItems( {
			type = "generic_confirmation_popup",
			properties = {
				popup_title = Engine.Localize( "@MENU_NOTICE" ),
				message_text = Engine.Localize( "@PLATFORM_CONTROLLER_DISCONNECTED" ),
				button_text = Engine.Localize( "@MENU_SWITCH_TO_MOUSE" ),
				confirmation_action = f0_local5
			}
		} )
	end
	
end
function WaitingForTransientsPopMenu()
	local f38_local0 = MenuBuilder.BuildRegisteredType( "FenceDialogPopup", {
		message = Engine.Localize( "@MENU_SP_LOADING_TRANSIENTS" ),
		controllerIndex = 0
	} )
	local self = LUI.UIElement.new( {
		worldBlur = 2
	} )
	self:setupWorldBlur()
	self.id = "blur"
	f38_local0:addElement( self )
	local f38_local2 = LUI.UIBindButton.new()
	f38_local2:registerEventHandler( "button_start", function ( element, event )
		ACTIONS.PauseGame( element, true )
	end )
	f38_local0:addElement( f38_local2 )
	return f38_local0
end

function ConfirmProfileChange( f40_arg0, f40_arg1 )
	DebugPrint( "Confirm profile change" )
	Engine.ConfirmXB3UserProfileChange( f40_arg1.controller )
	LUI.FlowManager.RequestLeaveMenu( f40_arg0 )
end

function IgnoreProfileChange( f41_arg0, f41_arg1 )
	DebugPrint( "Ignore profile change" )
	Engine.IgnoreXB3UserProfileChange( f41_arg1.controller )
	LUI.FlowManager.RequestLeaveMenu( f41_arg0 )
end

function user_changed_confirm_mp()
	return {
		type = "generic_yesno_popup",
		properties = {
			message_text = Engine.Localize( "@PLATFORM_PROFILE_PAIRING_CONFIRM" ),
			popup_title = Engine.Localize( "@MENU_WARNING" ),
			yes_text = Engine.Localize( "@MENU_YES" ),
			no_text = Engine.Localize( "@MENU_NO" ),
			yes_action = IgnoreProfileChange,
			no_action = ConfirmProfileChange,
			default_focus_index = 1
		}
	}
end

function controller_changed_confirm_mp()
	return {
		type = "generic_confirmation_popup",
		properties = {
			message_text = Engine.Localize( "@PLATFORM_CONTROLLER_PAIRING_CONFIRM" ),
			popup_title = Engine.Localize( "@MENU_WARNING" )
		}
	}
end

function recipe_load_failed_popup()
	return {
		type = "generic_confirmation_popup",
		id = "recipe_load_failed_popup_id",
		properties = {
			popup_title = Engine.Localize( "@MENU_NOTICE" ),
			message_text = Engine.Localize( "@MPUI_RECIPE_LOAD_FAILED" )
		}
	}
end

function recipe_save_failed_popup()
	return {
		type = "generic_confirmation_popup",
		id = "recipe_save_failed_popup_id",
		properties = {
			popup_title = Engine.Localize( "@MENU_NOTICE" ),
			message_text = Engine.Localize( "@MPUI_RECIPE_SAVE_FAILED" )
		}
	}
end

function recipe_save_failed_no_guests_popup()
	return {
		type = "generic_confirmation_popup",
		id = "recipe_save_failed_no_guests_popup_id",
		properties = {
			popup_title = Engine.Localize( "@MENU_NOTICE" ),
			message_text = Engine.Localize( "@MPUI_RULES_NOGUESTSAVE" )
		}
	}
end

function recipe_save_failed_no_device_popup()
	return {
		type = "generic_confirmation_popup",
		id = "recipe_save_failed_no_device_popup_id",
		properties = {
			popup_title = Engine.Localize( "@MENU_NOTICE" ),
			message_text = Engine.Localize( "@MPUI_RULES_NOSAVEDEVICE" )
		}
	}
end

function PopupFenceGameModeError( f48_arg0, f48_arg1 )
	assert( f48_arg1 and f48_arg1.errorCode )
	local f48_local0 = f48_arg1.errorCode
	local f48_local1 = ""
	local f48_local2 = ""
	if f48_local0 == CoD.FenceErrorCodes.Ownership then
		f48_local1 = Engine.Localize( "LUA_MENU_PURCHASE_NEEDED" )
		f48_local2 = Engine.Localize( "LUA_MENU_PURCHASE_NEEDED_MESSAGE" )
	elseif f48_local0 == CoD.FenceErrorCodes.Installation then
		f48_local1 = Engine.Localize( "LUA_MENU_INSTALLATION_NEEDED" )
		f48_local2 = Engine.Localize( "LUA_MENU_INSTALLATION_NEEDED_MESSAGE" )
	end
	local f48_local3 = MenuBuilder.buildItems( {
		type = "generic_confirmation_popup",
		properties = {
			popup_title = f48_local1,
			message_text = f48_local2
		}
	} )
	f48_local3.id = "popup_getting_data_error"
	return f48_local3
end

function no_controller_initial_popup()
	return {
		type = "generic_yesno_popup",
		id = "no_controller_initial_popup_id",
		properties = {
			popup_title = Engine.Localize( "@MENU_NOTICE" ),
			message_text = Engine.Localize( "@MENU_NO_CONTROLLER_INITIAL" ),
			yes_action = f0_local5
		}
	}
end

local f0_local6 = function ( f50_arg0, f50_arg1 )
	Engine.ExecNow( "profile_toggleEnableGamepad 1" )
	Engine.ExecNow( "updategamerprofile" )
	f50_arg0:dispatchEventToRoot( {
		name = "refresh_button_helper",
		dispatchChildren = true
	} )
	f50_arg0:dispatchEventToRoot( {
		name = "refresh_button_background"
	} )
end

local f0_local7 = function ( f51_arg0, f51_arg1 )
	Engine.ExecNow( "profile_toggleEnableGamepad 0" )
	Engine.ExecNow( "updategamerprofile" )
end

function controller_initial_popup()
	return {
		type = "generic_yesno_popup",
		id = "controller_initial_popup_id",
		properties = {
			popup_title = Engine.Localize( "@MENU_NOTICE" ),
			message_text = Engine.Localize( "@MENU_CONTROLLER_INITIAL" ),
			yes_action = f0_local6,
			no_action = f0_local7
		}
	}
end

function controller_connected_popup()
	return {
		type = "generic_yesno_popup",
		id = "controller_connected_popup_id",
		properties = {
			popup_title = Engine.Localize( "@MENU_NOTICE" ),
			message_text = Engine.Localize( "@MENU_CONTROLLER_INITIAL" ),
			yes_action = f0_local6,
			no_action = f0_local7
		}
	}
end

function generic_error_popup( f54_arg0, f54_arg1 )
	local f54_local0 = MenuBuilder.buildItems( {
		type = "generic_confirmation_popup",
		properties = {
			popup_title = Engine.Localize( "MENU_NOTICE" ),
			message_text = f54_arg1.message
		}
	} )
	f54_local0.id = "generic_error_popup"
	return f54_local0
end

function spinner_inprogress_popup( f55_arg0, f55_arg1 )
	local f55_local0 = MenuBuilder.buildItems( {
		type = "live_dialog_text_box_with_cancel",
		properties = {
			message = Engine.Localize( "MENU_FENCE_SPINNER_IN_PROGRESS" ) .. " : " .. f55_arg1.message,
			cancel_func = f55_arg1.onCancel
		}
	} )
	f55_local0.id = "spinner_inprogress_popup"
	return f55_local0
end

function spinner_confirmation_popup( f56_arg0, f56_arg1 )
	local f56_local0 = MenuBuilder.buildItems( {
		type = "generic_confirmation_popup",
		properties = {
			popup_title = Engine.Localize( "MENU_NOTICE" ),
			message_text = f56_arg1.message .. " " .. Engine.Localize( "MENU_FENCE_SPINNER_SUCCESSFUL" )
		}
	} )
	f56_local0.id = "spinner_confirmation_popup"
	return f56_local0
end

function store_inprogress_popup( f57_arg0, f57_arg1 )
	local f57_local0 = MenuBuilder.buildItems( {
		type = "live_dialog_text_box_with_cancel",
		properties = {
			message = Engine.Localize( "MENU_FENCE_SPINNER_IN_PROGRESS" ) .. " : " .. f57_arg1.message,
			cancel_func = f57_arg1.onCancel
		}
	} )
	f57_local0.id = "store_inprogress_popup"
	return f57_local0
end

function ReportPlayer( f58_arg0, f58_arg1 )
	assert( f58_arg1.xuid )
	local f58_local0 = {
		title = Engine.Localize( "MENU_REPORT_PLAYER" ),
		message = "",
		buttons = {}
	}
	for f58_local4, f58_local5 in ipairs( {
		{
			text = "MENU_REPORT_OFFENSIVE",
			confirmationString = "MENU_REPORT_OFFENSIVE_SUBMIT",
			offense = Friends.Constants.reportOffensiveLobbyPlayer
		},
		{
			text = "MENU_REPORT_EXPLOITING",
			confirmationString = "MENU_REPORT_EXPLOITING_SUBMIT",
			offense = Friends.Constants.reportExploitingLobbyPlayer
		},
		{
			text = "MENU_REPORT_CHEATING",
			confirmationString = "MENU_REPORT_CHEATING_SUBMIT",
			offense = Friends.Constants.reportCheatingLobbyPlayer
		},
		{
			text = "MENU_REPORT_BOOSTING",
			confirmationString = "MENU_REPORT_BOOSTING_SUBMIT",
			offense = Friends.Constants.reportBoostingLobbyPlayer
		},
		{
			text = "MENU_REPORT_UGC",
			confirmationString = "MENU_REPORT_UGC_SUBMIT",
			offense = Friends.Constants.reportOffensiveUGC
		}
	} ) do
		table.insert( f58_local0.buttons, {
			label = Engine.Localize( f58_local5.text ),
			action = function ( f59_arg0, f59_arg1 )
				Lobby.ReportPlayer( f59_arg1, f58_arg1.xuid, f58_local5.offense )
				LUI.FlowManager.RequestPopupMenu( f59_arg0, "PopupOK", true, f59_arg1, false, {
					title = Engine.Localize( "MENU_NOTICE" ),
					message = Engine.Localize( f58_local5.confirmationString )
				} )
			end
		} )
	end
	f58_local1 = MenuBuilder.BuildRegisteredType( "PopupMessageAndButtons", f58_local0 )
	f58_local1.id = "ReportPlayer"
	return f58_local1
end

function LeaveCommonMPMainMenuPopup( f60_arg0, f60_arg1 )
	assert( f60_arg1.menu )
	local f60_local0 = MenuBuilder.BuildRegisteredType( "PopupYesNo", {
		title = Engine.Localize( "MENU_NOTICE" ),
		message = Engine.Localize( "XBOXLIVE_LEAVEPARTYANDLOBBY" ),
		yesAction = function ( f61_arg0, f61_arg1 )
			Lobby.LeaveCommonMPMainMenu( f60_arg1.menu, f61_arg1 )
		end,
		noAction = function ()
			
		end
	} )
	f60_local0.id = "LeaveMissionLobby"
	return f60_local0
end

function RateLimitedLeaveCommonMPMainMenuPopup( f63_arg0, f63_arg1 )
	assert( f63_arg1.menu )
	local f63_local0 = MenuBuilder.BuildRegisteredType( "RateLimitedPopupYesNo", {
		title = Engine.Localize( "MENU_NOTICE" ),
		message = Engine.Localize( "XBOXLIVE_LEAVEPARTYANDLOBBY" ),
		yesAction = function ( f64_arg0, f64_arg1 )
			Lobby.LeaveCommonMPMainMenu( f63_arg1.menu, f64_arg1 )
		end,
		noAction = function ()
			
		end,
		rateLimited = f63_arg1.rateLimited,
		rateLimitIntervalMS = f63_arg1.rateLimitIntervalMS,
		rateLimitAttempts = f63_arg1.rateLimitAttempts
	} )
	f63_local0.id = "LeaveMissionLobby"
	return f63_local0
end

function ShowUpsellDialogPopup( f66_arg0, f66_arg1 )
	assert( f66_arg1.controllerIndex )
	Engine.SetDvarBool( "showUpsellDialog", false )
	Engine.ClearError()
	local f66_local0 = {
		title = Engine.Localize( "LUA_MENU_TRIAL_EXPIRED" ),
		message = Engine.Localize( "LUA_MENU_TRIAL_EXPIRED_MSG" ),
		buttonsClosePopup = true,
		cancelClosesPopup = true,
		buttons = {}
	}
	table.insert( f66_local0.buttons, {
		label = ToUpperCase( Engine.Localize( "LUA_MENU_BUY_NOW" ) ),
		action = function ( f67_arg0, f67_arg1 )
			if CONDITIONS.IsPS4() then
				Commerce.ShowFirstPartyStore( f67_arg1 )
			elseif CONDITIONS.IsXboxOne() then
				LUI.FlowManager.RequestPopupMenu( nil, "ShowUpsellXboxStore", false, false, false, {}, nil, false, true )
			end
		end
	} )
	table.insert( f66_local0.buttons, {
		label = Engine.Localize( "LUA_MENU_CANCEL" ),
		action = function ( f68_arg0, f68_arg1 )
			
		end
	} )
	local f66_local1 = MenuBuilder.BuildRegisteredType( "PopupMessageAndButtons", f66_local0 )
	f66_local1.id = "ShowUpsellDialogPopup"
	return f66_local1
end

function DisbandPartyEnterGameBattlesLobbyPopup( f69_arg0, f69_arg1 )
	assert( f69_arg1.controllerIndex )
	local f69_local0 = MenuBuilder.BuildRegisteredType( "PopupYesNo", {
		title = Engine.Localize( "MENU_NOTICE" ),
		message = Engine.Localize( "MLG_GAMEBATTLES_DISBAND_PARTY" ),
		yesAction = function ( f70_arg0, f70_arg1 )
			Engine.ExecNow( "xstopprivateparty 0", f70_arg1 )
			OpenGameBattlesLobby( f70_arg1 )
		end
	} )
	f69_local0.id = "DisbandPartyEnterGameBattlesLobbyPopup"
	return f69_local0
end

function RateLimitedPopupYesNo( f71_arg0, f71_arg1 )
	f71_arg1.rateLimited = true
	f71_arg1.rateLimitIntervalMS = f71_arg1.rateLimitIntervalMS or 5000
	f71_arg1.rateLimitAttempts = f71_arg1.rateLimitAttempts or 3
	return MenuBuilder.BuildRegisteredType( "PopupYesNo", f71_arg1 )
end

function ShowUpsellXboxStore( f72_arg0, f72_arg1 )
	assert( f72_arg1.controllerIndex )
	local f72_local0 = {
		title = Engine.Localize( "LUA_MENU_STORE_CAPS" ),
		message = "",
		buttonsClosePopup = true,
		cancelClosesPopup = true,
		buttons = {}
	}
	table.insert( f72_local0.buttons, {
		label = Engine.Localize( "LUA_MENU_DIGITAL_DELUXE" ),
		action = function ( f73_arg0, f73_arg1 )
			Commerce.ShowFirstPartyStore( f73_arg1, "c5da3bf3-3459-4202-a7eb-6eb8f41fabe5" )
		end
	} )
	table.insert( f72_local0.buttons, {
		label = Engine.Localize( "LUA_MENU_DIGITAL_LEGACY" ),
		action = function ( f74_arg0, f74_arg1 )
			Commerce.ShowFirstPartyStore( f74_arg1, "559cf838-c5c4-498a-a5e3-351fa4b37d7c" )
		end
	} )
	table.insert( f72_local0.buttons, {
		label = Engine.Localize( "LUA_MENU_DIGITAL_BASE" ),
		action = function ( f75_arg0, f75_arg1 )
			Commerce.ShowFirstPartyStore( f75_arg1, "b34bce6e-11b7-45ae-bb93-aad737c1b457" )
		end
	} )
	table.insert( f72_local0.buttons, {
		label = Engine.Localize( "LUA_MENU_CANCEL" ),
		action = function ( f76_arg0, f76_arg1 )
			
		end
	} )
	local f72_local1 = MenuBuilder.BuildRegisteredType( "PopupMessageAndButtons", f72_local0 )
	f72_local1.id = "ShowUpsellXboxStore"
	return f72_local1
end

local f0_local8 = function ( f77_arg0, f77_arg1 )
	local f77_local0 = f77_arg1.controllerIndex
	assert( f77_local0 )
	assert( f77_arg1.labels )
	assert( f77_arg1.keys )
	assert( f77_arg1.callback )
	local f77_local1 = {
		title = Engine.Localize( "MENU_FILTER_OPTIONS_CAPS" ),
		width = _1080p * 500,
		defaultFocusIndex = 1,
		cancelClosesPopup = true,
		listContent = {}
	}
	local f77_local2 = nil
	f77_local2 = MenuBuilder.BuildRegisteredType( "GenericArrowButton", {
		controllerIndex = f77_local0
	} )
	f77_local2.id = "TypeButton"
	f77_local2.Title:setText( ToUpperCase( Engine.Localize( "LUA_MENU_FILTER" ) ), 0 )
	f77_local2:SetAnchors( 0, 1, 1, 0, 0 )
	f77_local2:SetLeft( _1080p * 0, 0 )
	f77_local2:SetRight( _1080p * 500, 0 )
	f77_local2:SetTop( _1080p * 0, 0 )
	f77_local2:SetBottom( _1080p * 35, 0 )
	f77_local2.filterType = f77_arg1.keys[f77_local1.defaultFocusIndex]
	LUI.AddUIArrowTextButtonLogic( f77_local2, f77_local0, {
		labels = f77_arg1.labels,
		action = function ( f78_arg0 )
			f77_local2.filterType = f77_arg1.keys[f78_arg0]
		end,
		defaultValue = 1,
		wrapAround = true
	} )
	table.insert( f77_local1.listContent, f77_local2 )
	local f77_local3 = nil
	f77_local3 = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f77_local0
	} )
	f77_local3.id = "AcceptButton"
	f77_local3.Text:setText( ToUpperCase( Engine.Localize( "LUA_MENU_ACCEPT" ) ), 0 )
	f77_local3:SetAnchors( 0, 1, 1, 0, 0 )
	f77_local3:SetLeft( _1080p * 0, 0 )
	f77_local3:SetRight( _1080p * 500, 0 )
	f77_local3:SetTop( _1080p * 120, 0 )
	f77_local3:SetBottom( _1080p * 155, 0 )
	f77_local3:addEventHandler( "button_action", function ( f79_arg0, f79_arg1 )
		ACTIONS.LeaveMenu( f79_arg0 )
		f77_arg1.callback( f77_local2.filterType )
	end )
	table.insert( f77_local1.listContent, f77_local3 )
	local f77_local4 = nil
	local f77_local5 = MenuBuilder.BuildRegisteredType( "button_helper_text_main", {
		left_inset = 0,
		right_inset = -30,
		top_margin = 0,
		bottom_margin = 0,
		height = GenericFooterDims.Height,
		spacing = 5,
		background_alpha = 1,
		list_left_inset = 0,
		controllerIndex = f77_local0
	} )
	f77_local5.id = "ButtonHelperBar"
	f77_local5:SetAnchors( 0, 1, 1, 0, 0 )
	f77_local5:SetLeft( _1080p * 0, 0 )
	f77_local5:SetRight( _1080p * 500, 0 )
	f77_local5:SetTop( _1080p * -50, 0 )
	f77_local5:SetBottom( _1080p * 0, 0 )
	table.insert( f77_local1.listContent, f77_local5 )
	local f77_local6 = MenuBuilder.BuildRegisteredType( "PopupList", f77_local1 )
	f77_local6.id = "FilterPopup"
	f77_local6:AddButtonHelperTextToElement( f77_local5, {
		helper_text = Engine.Localize( "@MENU_CANCEL" ),
		button_ref = "button_secondary",
		side = "left",
		priority = 1,
		clickable = true
	} )
	return f77_local6
end

MenuBuilder.registerType( "FenceDialogPopup", FenceDialogPopup )
MenuBuilder.registerType( "FenceDialogPopupWithProgress", FenceDialogPopupWithProgress )
MenuBuilder.registerType( "FenceOnlineQueueDialogPopupWithDescription", FenceOnlineQueueDialogPopupWithDescription )
MenuBuilder.registerType( "live_dialog_text_box_with_cancel", live_dialog_text_box_with_cancel )
MenuBuilder.registerType( "live_dialog_text_box", live_dialog_text_box )
MenuBuilder.registerDef( "live_party_invite_popmenu", live_party_invite_popmenu )
MenuBuilder.registerType( "AcceptingInvite", AcceptingInvite )
MenuBuilder.registerType( "ReadingSaveDevice", ReadingSaveDevice )
MenuBuilder.registerDef( "savedata_failed_popmenu", savedata_failed_popmenu )
MenuBuilder.registerType( "error_popmenu", error_popmenu )
MenuBuilder.registerDef( "quit_popmenu", quit_popmenu )
MenuBuilder.registerDef( "quit_no_save_confirm_popup", quit_no_save_confirm_popup )
MenuBuilder.registerDef( "quit_confirm_popup", quit_confirm_popup )
MenuBuilder.registerType( "campaign_mode_savedata_error_popup", campaign_mode_savedata_error_popup )
MenuBuilder.registerType( "menu_online_ended", menu_online_ended )
MenuBuilder.registerDef( "user_changed_confirm_mp", user_changed_confirm_mp )
MenuBuilder.registerDef( "controller_changed_confirm_mp", controller_changed_confirm_mp )
MenuBuilder.registerDef( "recipe_load_failed_popup", recipe_load_failed_popup )
MenuBuilder.registerDef( "recipe_save_failed_popup", recipe_save_failed_popup )
MenuBuilder.registerDef( "recipe_save_failed_no_guests_popup", recipe_save_failed_no_guests_popup )
MenuBuilder.registerDef( "recipe_save_failed_no_device_popup", recipe_save_failed_no_device_popup )
MenuBuilder.registerType( "PopupFenceGameModeError", PopupFenceGameModeError )
MenuBuilder.registerDef( "no_controller_initial_popup", no_controller_initial_popup )
MenuBuilder.registerDef( "controller_initial_popup", controller_initial_popup )
MenuBuilder.registerDef( "controller_connected_popup", controller_connected_popup )
MenuBuilder.registerType( "controllerremoved_popmenu", controllerremoved_popmenu )
MenuBuilder.registerType( "WaitingForTransientsPopMenu", WaitingForTransientsPopMenu )
MenuBuilder.registerType( "generic_error_popup", generic_error_popup )
MenuBuilder.registerType( "spinner_inprogress_popup", spinner_inprogress_popup )
MenuBuilder.registerType( "spinner_confirmation_popup", spinner_confirmation_popup )
MenuBuilder.registerType( "store_inprogress_popup", store_inprogress_popup )
MenuBuilder.registerType( "ReportPlayer", ReportPlayer )
MenuBuilder.registerType( "LeaveCommonMPMainMenuPopup", LeaveCommonMPMainMenuPopup )
MenuBuilder.registerType( "RateLimitedLeaveCommonMPMainMenuPopup", RateLimitedLeaveCommonMPMainMenuPopup )
MenuBuilder.registerType( "DisbandPartyEnterGameBattlesLobbyPopup", DisbandPartyEnterGameBattlesLobbyPopup )
MenuBuilder.registerType( "ShowUpsellDialogPopup", ShowUpsellDialogPopup )
MenuBuilder.registerType( "RateLimitedPopupYesNo", RateLimitedPopupYesNo )
MenuBuilder.registerType( "ShowUpsellXboxStore", ShowUpsellXboxStore )
MenuBuilder.registerType( "FilterPopup", f0_local8 )
LockTable( _M )
