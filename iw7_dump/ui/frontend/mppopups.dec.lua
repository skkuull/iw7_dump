local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
function menu_resetstats_offline()
	return {
		type = "generic_confirmation_popup",
		id = "menu_resetstats_offline_id",
		properties = {
			dialog_top = -100,
			dialog_bottom = 100,
			popup_title = Engine.Localize( "@MENU_NOTICE" ),
			message_text = Engine.Localize( "@LUA_MENU_RESETCUSTOMCLASSES_OFFLINE" ),
			button_text = Engine.Localize( "@MENU_OK" ),
			cancel_will_close = false
		}
	}
end

function ResetStatsCancel( f2_arg0, f2_arg1 )
	Engine.ResetStatsCancel( f2_arg1.controller )
end

function menu_resetstats_warning()
	return {
		type = "generic_yesno_popup",
		properties = {
			message_text = Engine.GetDvarString( "com_errorMessage" ),
			popup_title = Engine.GetDvarString( "com_errorTitle" ),
			yes_text = Engine.Localize( "@MENU_STATS_RESET_YES" ),
			no_text = Engine.Localize( "@MENU_STATS_RESET_NO" ),
			yes_action = function ()
				Engine.Exec( "confirmStatsReset" )
			end
			,
			no_action = ResetStatsCancel
		}
	}
end

f0_local0 = function ( f5_arg0, f5_arg1 )
	Engine.ExecNow( "xstopprivateparty 0", f5_arg1 )
	Engine.SetDvarBool( "onlinegame", false )
	Engine.SetDvarBool( "splitscreen", false )
	Engine.CancelConnecting()
	Engine.Exec( "xstopparty" )
	Engine.StopGameMode()
	if not LUI.FlowManager.IsMenuOnTop( "MainMenu" ) then
		LUI.FlowManager.RequestRestoreMenu( "MainMenu", true, f5_arg1, true )
	end
end

function TURequiredWarning()
	local f6_local0 = MenuBuilder.BuildRegisteredType( "PopupOK", {
		title = Engine.Localize( "@MENU_NOTICE" ),
		message = Engine.Localize( "PLATFORM_TU_REQUIRED" ),
		action = f0_local0
	} )
	f6_local0.id = "TURequiredWarning"
	return f6_local0
end

f0_local1 = function ( f7_arg0, f7_arg1 )
	Engine.SystemRestart( Engine.Localize( "@MPUI_NEW_PATCH_RESTART" ) )
end

function newPatchManifestRestart()
	return {
		type = "generic_confirmation_popup",
		id = "menu_new_patch_manifest_id",
		properties = {
			confirmation_action = f0_local1,
			dialog_top = -100,
			dialog_bottom = 100,
			popup_title = Engine.Localize( "@MENU_NOTICE" ),
			message_text = Engine.Localize( "@MPUI_NEW_PATCH_AVAILABLE" ),
			button_text = Engine.Localize( "@MENU_OK" ),
			cancel_will_close = false
		}
	}
end

function error_popmenu_lobby()
	local f9_local0 = MenuBuilder.BuildRegisteredType( "PopupOK", {
		title = Engine.GetDvarString( "com_errorTitle" ),
		message = Engine.GetDvarString( "com_errorMessage" ),
		action = function ()
			Engine.ClearError()
		end
	} )
	f9_local0.id = "error_popmenu_lobby"
	return f9_local0
end

function youarehost()
	local f11_local0 = MenuBuilder.BuildRegisteredType( "PopupOK", {
		title = Engine.Localize( "@MENU_NOTICE" ),
		message = Engine.Localize( "@MPUI_YOUAREHOST" )
	} )
	f11_local0.id = "youarehost"
	return f11_local0
end

function LootItemError()
	local f12_local0 = MenuBuilder.BuildRegisteredType( "PopupOK", {
		title = Engine.Localize( "MENU_NOTICE" ),
		message = Engine.Localize( "MP_FRONTEND_ONLY_CRAFTING_ERROR" )
	} )
	f12_local0.id = "LootItemError"
	return f12_local0
end

f0_local2 = function ( f13_arg0, f13_arg1 )
	
end

function makehostfailed()
	return {
		type = "generic_confirmation_popup",
		id = "makehostfailed",
		properties = {
			title_text = Engine.Localize( "@MENU_NOTICE" ),
			message_text = Engine.Localize( Engine.GetDvarString( "party_makehosterrormsg" ) ),
			confirmation_action = f0_local2
		}
	}
end

function AcceptInviteWarningConfirm( f15_arg0, f15_arg1 )
	LUI.FlowManager.RequestLeaveMenu( f15_arg0, nil )
	Engine.ExecNow( "xstopprivateparty" )
	Engine.ExecNow( "xstartprivateparty" )
	Engine.ExecNow( "confirmInvite" )
end

function AcceptInviteWarningCancel( f16_arg0, f16_arg1 )
	LUI.FlowManager.RequestLeaveMenu( f16_arg0, nil )
	Engine.ExecNow( "cancelInvite" )
end

function acceptinvite_warning()
	return {
		type = "generic_yesno_popup",
		id = "acceptinvite_warning_id",
		properties = {
			message_text = Engine.Localize( "@MENU_LEAVEPARTYWARNING" ),
			popup_title = Engine.Localize( "@MENU_ACCEPTINVITETITLE" ),
			yes_text = Engine.Localize( "@MENU_CONFIRMINVITE" ),
			no_text = Engine.Localize( "@MENU_RESUMEGAME" ),
			yes_action = AcceptInviteWarningConfirm,
			no_action = AcceptInviteWarningCancel
		}
	}
end

function user_generated_content_restriction_popup()
	return {
		type = "generic_confirmation_popup",
		id = "clan_invite_restriction_popup_id",
		properties = {
			popup_title = Engine.Localize( "@GAME_WARNING" ),
			message_text = Engine.Localize( "@LUA_MENU_USER_CONTENT_RESTRICTIONS" ),
			confirmation_action = MBh.LeaveMenu()
		},
		handlers = {}
	}
end

function CancelJoinInProgressWithPassword( f19_arg0, f19_arg1 )
	Engine.SetDvarBool( "onlinegame", false )
	Engine.SetDvarBool( "systemlink", false )
	Engine.Exec( "stopListening" )
	Engine.Exec( "xstopparty PASSWORD_POPUP_CANCELED_ACTION" )
	Engine.Exec( "xstopprivateparty" )
	Engine.Exec( "xcancelconnectingdialog" )
	Engine.Exec( "resetautoconnect" )
	LUI.FlowManager.RequestLeaveMenu( f19_arg0 )
end

function jip_with_password()
	local self = LUI.UIElement.new()
	self.id = "jip_with_password_id"
	self:registerEventHandler( "menu_create", function ( element, event )
		Engine.SetDvarString( "privateMatch_joinPassword", "" )
		OSK.OpenScreenKeyboard( 0, Engine.Localize( "MENU_PASSWORD" ), "", Lobby.PasswordLength, false, false, false, function ( f22_arg0, f22_arg1, f22_arg2 )
			if not f22_arg1 then
				CancelJoinInProgressWithPassword( element, nil )
			else
				Engine.SetDvarString( "privateMatch_joinPassword", f22_arg1 )
				Engine.Exec( "xjoinpasswordparty" )
				LUI.FlowManager.RequestLeaveMenu( element )
			end
		end, CoD.KeyboardInputTypes.Password, true )
	end )
	return self
end

function ContineueSearching()
	Engine.SetDvarBool( "party_search_for_dlc_content", true )
	Engine.Exec( "resetdlcsearchtimer" )
end

function StopSearching()
	Engine.SetDvarBool( "party_search_for_dlc_content", false )
	Engine.Exec( "xstoplobbybackout" )
	Engine.Exec( "xblive_privatematch 0" )
	LUI.FlowManager.RequestRestoreMenu( "CPMainMenu" )
end

function mp_dlc_switch_searchtype()
	return {
		type = "generic_yesno_popup",
		id = "mp_dlc_switch_searchtype_id",
		properties = {
			message_text = Engine.Localize( "@DLC_SEARCH_IS_TAKING_TIME" ),
			popup_title = Engine.Localize( "@MENU_WARNING" ),
			no_text = Engine.Localize( "@DLC_SEARCH_CONTINUE" ),
			yes_text = Engine.Localize( "@DLC_SEARCH_STOP" ),
			no_action = ContineueSearching,
			yes_action = StopSearching
		}
	}
end

function popup_throttling()
	return {
		type = "UIElement",
		id = "popup_throttling_id",
		handlers = {
			move_to_lobby = function ( f27_arg0, f27_arg1 )
				LUI.FlowManager.RequestLeaveMenu( f27_arg0, nil )
				local f27_local0 = f27_arg0.properties.eventData or {}
				f27_local0.name = "find_match_after_throttle"
				f27_arg1.controller = f27_arg0.properties.exclusiveController
				f27_arg0:dispatchEventToRoot( f27_local0 )
			end
			
		},
		children = {
			{
				type = "live_dialog_text_box_with_cancel",
				id = "live_dialog_text_box_with_cancel_id",
				properties = {
					message = Engine.Localize( "@MENU_PLEASE_WAIT" ),
					cancel_func = MBh.LeaveMenu()
				}
			},
			{
				type = "UITimer",
				id = "move_to_lobby_id",
				properties = {
					event = "move_to_lobby",
					interval = Engine.GetDvarInt( "lb_throttle_time" ) * 1000,
					disposable = false
				}
			}
		}
	}
end

function mlg_error_no_rules_available_offline()
	return {
		type = "generic_confirmation_popup",
		id = "mlg_error_no_rules_available_offline",
		properties = {
			popup_title = Engine.Localize( "@MENU_NOTICE" ),
			message_text = Engine.Localize( "@LUA_MENU_MLG_NO_RULES_AVAILABLE_OFFLINE" )
		}
	}
end

function mlg_error_no_rules_available()
	return {
		type = "generic_confirmation_popup",
		id = "mlg_error_no_rules_available",
		properties = {
			popup_title = Engine.Localize( "@MENU_NOTICE" ),
			message_text = Engine.Localize( "@LUA_MENU_MLG_NO_RULES_AVAILABLE" )
		}
	}
end

function mp_no_guest_popup()
	return {
		type = "generic_confirmation_popup",
		id = "mp_no_guest_popup_id",
		properties = {
			popup_title = Engine.Localize( "@MENU_NOTICE" ),
			message_text = Engine.Localize( "@MENU_NO_GUEST" )
		}
	}
end

function popup_no_guest()
	return {
		type = "generic_confirmation_popup",
		id = "no_guest_leaderboards_id",
		properties = {
			popup_title = Engine.Localize( "MENU_NOTICE" ),
			message_text = Engine.Localize( "PATCH_MENU_NO_GUEST" )
		}
	}
end

function popup_ugc_restricted()
	return {
		type = "generic_confirmation_popup",
		id = "popup_ugc_restricted",
		properties = {
			popup_title = Engine.Localize( "MENU_NOTICE" ),
			message_text = Engine.Localize( "PLATFORM_CANT_ACCESS_UGC_RESTRICTED" )
		}
	}
end

function ClearChatRestrictedDvar()
	Engine.SetDvarString( "current_chat_restricted_message", "" )
end

function popup_chat_restricted()
	return {
		type = "generic_confirmation_popup",
		id = "popup_chat_restricted",
		properties = {
			popup_title = Engine.Localize( "MENU_NOTICE" ),
			message_text = Engine.Localize( "PLATFORM_CHAT_RESTRICTED", Engine.GetDvarString( "current_chat_restricted_message" ) ),
			yes_action = ClearChatRestrictedDvar()
		}
	}
end

function strict_nat_warning()
	return {
		type = "generic_confirmation_popup",
		id = "strict_nat_warning",
		properties = {
			popup_title = Engine.Localize( "MENU_NOTICE" ),
			message_text = Engine.Localize( "NETWORK_STRICTPARTYWARNING" )
		}
	}
end

function mp_panic_buttons_popup()
	return {
		type = "generic_confirmation_popup",
		id = "mp_panic_buttons_popup_id",
		properties = {
			popup_title = "Something went wrong!",
			message_text = "It sounds like something went wrong. Please backout to the boot screen and re-enter matchmaking. If that doesn't work reboot the game and try again."
		}
	}
end

function popup_getting_lootcrate( f37_arg0, f37_arg1 )
	assert( f37_arg1 )
	local f37_local0 = MenuBuilder.buildItems( {
		type = "live_dialog_text_box",
		properties = {
			message_text = "Purchasing...",
			popup_title = "Loot Crate"
		}
	} )
	f37_local0.id = "popup_getting_lootcrate"
	return f37_local0
end

function ChooseLocalPlay( f38_arg0, f38_arg1 )
	local f38_local0 = MenuBuilder.BuildRegisteredType( "PopupMessageAndButtons", {
		title = Engine.Localize( "@MENU_CHOOSE_GAME_MODE_CAP" ),
		message = "",
		defaultFocusIndex = 0,
		buttons = {
			{
				label = ToUpperCase( Engine.Localize( "@MENU_MULTIPLAYER" ) ),
				action = function ( f39_arg0, f39_arg1 )
					Engine.SetDvarBool( "systemlink", true )
					LUI.FlowManager.RequestAddMenu( "MPSystemLinkMenu", true, f39_arg1, false )
				end
			},
			{
				label = Engine.Localize( "@LUA_MENU_ALIENS" ),
				action = function ( f40_arg0, f40_arg1 )
					Engine.SetDvarBool( "systemlink", true )
					LUI.FlowManager.RequestAddMenu( "CPSystemLinkMenu", true, f40_arg1, false )
				end
			}
		}
	} )
	f38_local0.id = "ChooseLocalPlay"
	return f38_local0
end

function code_already_redeemed_popup()
	return MenuBuilder.buildItems( {
		type = "generic_confirmation_popup",
		properties = {
			popup_title = Engine.Localize( "@GAME_WARNING" ),
			message_text = Engine.Localize( "MENU_REDEMPTION_ALREADY_REDEEMED" ),
			confirmation_action = MBh.LeaveMenu()
		}
	} )
end

function code_expired_popup()
	return MenuBuilder.buildItems( {
		type = "generic_confirmation_popup",
		properties = {
			popup_title = Engine.Localize( "@GAME_WARNING" ),
			message_text = Engine.Localize( "MENU_REDEMPTION_CODE_EXPIRED" ),
			confirmation_action = MBh.LeaveMenu()
		}
	} )
end

function code_redemption_failed_popup()
	return MenuBuilder.buildItems( {
		type = "generic_confirmation_popup",
		properties = {
			popup_title = Engine.Localize( "@GAME_WARNING" ),
			message_text = Engine.Localize( "MENU_REDEMPTION_REDEMPTION_FAILED" ),
			confirmation_action = MBh.LeaveMenu()
		}
	} )
end

function RedeemingPopup( f44_arg0, f44_arg1 )
	local f44_local0 = MenuBuilder.buildItems( {
		type = "live_dialog_text_box",
		properties = {
			message = Engine.Localize( "MENU_REDEMPTION_REDEEMING_PLEASE_WAIT" )
		}
	} )
	f44_local0.id = "RedeemingPopup"
	f44_local0:registerEventHandler( "redemption_success", function ( element, event )
		LUI.FlowManager.RequestLeaveMenu( element )
	end )
	f44_local0:registerEventHandler( "redemption_failed", function ( element, event )
		LUI.FlowManager.RequestLeaveMenu( element )
		DebugPrint( "Code redeeming failed" )
		if event.errorAlreadyRedeemed then
			LUI.FlowManager.RequestPopupMenu( nil, "code_already_redeemed_popup" )
		elseif event.errorCodeExpired then
			LUI.FlowManager.RequestPopupMenu( nil, "code_expired_popup" )
		else
			LUI.FlowManager.RequestPopupMenu( nil, "code_redemption_failed_popup" )
		end
	end )
	return f44_local0
end

function ExchangeFailed()
	return MenuBuilder.buildItems( {
		type = "generic_confirmation_popup",
		properties = {
			popup_title = Engine.Localize( "@GAME_WARNING" ),
			message_text = CONDITIONS.AreCODPointsEnabled() and Engine.Localize( "@EXE_EXCHANGE_ERROR" ) or Engine.Localize( "EXE_EXCHANGE_ERROR_NO_COD_POINTS" ),
			confirmation_action = MBh.LeaveMenu()
		}
	} )
end

function MPFullScreenVideoOverlay( f48_arg0, f48_arg1 )
	if not f48_arg1 then
		f48_arg1 = {}
	end
	assert( f48_arg1.videoRef )
	local f48_local0 = 1
	local f48_local1 = 2
	local f48_local2 = 3
	local f48_local3 = 4
	local f48_local4 = f48_arg1.doIntroFadeOut ~= false
	local f48_local5 = f48_arg1.doIntroFadeIn ~= false
	local f48_local6 = f48_arg1.doOutroFadeOut ~= false
	local f48_local7 = f48_arg1.doOutroFadeIn ~= false
	local f48_local8 = f48_arg1.fadeColor
	if not f48_local8 then
		f48_local8 = COLORS.black
	end
	local f48_local9 = 600
	local f48_local10 = f48_arg1.onCompletePlayback or nil
	local self = LUI.UIElement.new()
	self.id = "MPFullScreenVideoOverlay"
	local f48_local12 = LUI.UIImage.new()
	f48_local12:setPriority( f48_local1 )
	f48_local12.id = "fade"
	f48_local12:SetRGBFromTable( f48_local8 )
	f48_local12:SetAlpha( 0 )
	self:addElement( f48_local12 )
	local f48_local13, f48_local14, f48_local15, f48_local16, f48_local17 = nil
	f48_local13 = function ()
		f48_local17 = LUI.UIImage.new()
		f48_local17.id = "bink"
		f48_local17:setImage( RegisterMaterial( "cinematic" ) )
		self:addElement( f48_local17 )
		Engine.StopMusic()
		Engine.PlayMenuVideo( f48_arg1.videoRef )
		if f48_local5 then
			f48_local12:SetAlpha( 1 )
			local f49_local0 = f48_local12:Wait( 150 )
			f49_local0.onComplete = function ()
				local f50_local0 = f48_local12:SetAlpha( 0, f48_local9 )
				f50_local0.onComplete = f48_local14
			end
			
		else
			f48_local14()
		end
		local f49_local0 = LUI.UITimer.new( nil, {
			interval = 100,
			event = {
				name = "check_exit_video"
			}
		} )
		f49_local0.id = "checkExitTimer"
		self:addElement( f49_local0 )
		f49_local0:registerEventHandler( "check_exit_video", function ()
			if Engine.IsVideoFinished() then
				self:exitMenu()
			end
		end )
	end
	
	f48_local14 = function ()
		f48_local12:SetAlpha( 0 )
		self._binkStarted = true
	end
	
	f48_local15 = function ()
		Engine.StopMenuVideo()
		if f48_local7 then
			f48_local12:SetAlpha( 1 )
			f48_local17:SetAlpha( 0 )
			local f53_local0 = f48_local12:Wait( 150 )
			f53_local0.onComplete = function ()
				local f54_local0 = f48_local12:SetAlpha( 0, f48_local9 )
				f54_local0.onComplete = f48_local16
			end
			
		else
			f48_local16()
		end
	end
	
	f48_local16 = function ()
		LUI.FlowManager.RequestLeaveMenu( self, true )
		if f48_local10 ~= nil then
			f48_local10()
		end
	end
	
	self.exitMenu = function ( f56_arg0 )
		if f56_arg0._exiting then
			return 
		end
		f56_arg0._exiting = true
		if f48_local6 then
			f48_local12:SetAlpha( 0 )
			local f56_local0 = f48_local12:SetAlpha( 1, f48_local9 )
			f56_local0.onComplete = f48_local15
		else
			f48_local15()
		end
	end
	
	if f48_local4 then
		local f48_local18 = f48_local12:SetAlpha( 1, f48_local9 )
		f48_local18.onComplete = f48_local13
	else
		f48_local13()
	end
	if f48_arg1.allowSkip then
		local f48_local18 = MenuBuilder.BuildRegisteredType( "BinkSkipPrompt", {
			onSkipInput = function ()
				self:exitMenu()
			end
		} )
		f48_local18:setPriority( f48_local2 )
		self:addElement( f48_local18 )
	end
	local f48_local18 = LUI.UIElement.new()
	f48_local18:setPriority( f48_local3 )
	f48_local18:SetupCinematicSubtitles()
	f48_local18.id = "subtitles"
	self:addElement( f48_local18 )
	return self
end

function MPFullScreenVideoOverlayPop()
	Engine.StopMenuVideo()
	MissionDirector.PlayTeamMusic()
end

function PermanentUnlockAlreadyUnlockedPopup( f59_arg0, f59_arg1 )
	local f59_local0 = MenuBuilder.buildItems( {
		type = "generic_confirmation_popup",
		properties = {
			popup_title = Engine.Localize( "PRESTIGE_PERMANENT_UNLOCKS" ),
			message_text = Engine.Localize( "MP_FRONTEND_ONLY_PERMANENT_UNLOCK_ALREADY_UNLOCKED", f59_arg1.itemName )
		}
	} )
	f59_local0.id = "PermanentUnlockAlreadyUnlockedPopup"
	return f59_local0
end

function PermanentUnlockNotEnoughTokensPopup( f60_arg0, f60_arg1 )
	local f60_local0 = MenuBuilder.buildItems( {
		type = "generic_confirmation_popup",
		properties = {
			popup_title = Engine.Localize( "PRESTIGE_PERMANENT_UNLOCKS" ),
			message_text = Engine.Localize( "MP_FRONTEND_ONLY_PERMANENT_UNLOCK_FAILURE", f60_arg1.itemName )
		}
	} )
	f60_local0.id = "PermanentUnlockNotEnoughTokensPopup"
	return f60_local0
end

function PermanentUnlockEnterPopup( f61_arg0, f61_arg1 )
	local f61_local0 = {
		title = Engine.Localize( "PRESTIGE_PERMANENT_UNLOCKS" ),
		width = _1080p * 600,
		defaultFocusIndex = 1,
		cancelClosesPopup = true
	}
	local f61_local1 = MenuBuilder.BuildRegisteredType( "EnterPermanentUnlockWidget", {
		itemName = f61_arg1.itemName,
		controllerIndex = f61_arg1.controllerIndex,
		itemUnlockLevel = f61_arg1.itemUnlockLevel,
		confirmAction = f61_arg1.confirmAction
	} )
	f61_local1.id = "EnterPermanentUnlockWidget"
	f61_local0.listContent = {}
	table.insert( f61_local0.listContent, f61_local1 )
	local f61_local2 = MenuBuilder.BuildRegisteredType( "PopupList", f61_local0 )
	f61_local2.id = "PermanentUnlockEnterPopup"
	return f61_local2
end

function PermanentUnlockCongratulationsPopup( f62_arg0, f62_arg1 )
	local f62_local0 = MenuBuilder.buildItems( {
		type = "generic_confirmation_popup",
		properties = {
			popup_title = Engine.Localize( "PRESTIGE_PERMANENT_UNLOCK_CONFIRM_TITLE", f62_arg1.itemName ),
			message_text = Engine.Localize( "PRESTIGE_PERMANENT_UNLOCK_CONFIRM_MESSAGE", f62_arg1.itemName, f62_arg1.tokens )
		}
	} )
	f62_local0.id = "PermanentUnlockCongratulationsPopup"
	return f62_local0
end

function ClassicWeaponAlreadyUnlockedPopup( f63_arg0, f63_arg1 )
	local f63_local0 = MenuBuilder.buildItems( {
		type = "generic_confirmation_popup",
		properties = {
			popup_title = Engine.Localize( "MP_FRONTEND_ONLY_CLASSIC_WEAPON_UNLOCK_TITLE" ),
			message_text = Engine.Localize( "MP_FRONTEND_ONLY_CLASSIC_WEAPON_ALREADY_UNLOCKED", f63_arg1.itemName )
		}
	} )
	f63_local0.id = "ClassicWeaponAlreadyUnlockedPopup"
	return f63_local0
end

function ClassicWeaponNotEnoughTokensPopup( f64_arg0, f64_arg1 )
	local f64_local0 = MenuBuilder.buildItems( {
		type = "generic_confirmation_popup",
		properties = {
			popup_title = Engine.Localize( "MP_FRONTEND_ONLY_CLASSIC_WEAPON_UNLOCK_TITLE" ),
			message_text = Engine.Localize( "MP_FRONTEND_ONLY_CLASSIC_WEAPON_UNLOCK_FAILURE" )
		}
	} )
	f64_local0.id = "ClassicWeaponNotEnoughTokensPopup"
	return f64_local0
end

function ClassicWeaponsYesNoPopup( f65_arg0, f65_arg1 )
	local f65_local0 = MenuBuilder.buildItems( {
		type = "generic_yesno_popup",
		properties = {
			popup_title = Engine.Localize( "MP_FRONTEND_ONLY_CLASSIC_WEAPON_UNLOCK_TITLE" ),
			message_text = Engine.Localize( "PRESTIGE_CLASSIC_WEAPON_UNLOCKS_CONFIRM", f65_arg1.itemName ),
			yes_text = Engine.Localize( "LUA_MENU_YES" ),
			yes_action = f65_arg1.confirmAction,
			no_text = Engine.Localize( "LUA_MENU_CANCEL" )
		}
	} )
	f65_local0.id = "ClassicWeaponsYesNoPopup"
	return f65_local0
end

local f0_local3 = function ( f66_arg0, f66_arg1 )
	local f66_local0 = MenuBuilder.BuildRegisteredType( "PopupOK", {
		message = Engine.Localize( "MP_FRONTEND_ONLY_DRAFT_FAILED" )
	} )
	f66_local0.id = "DraftFailed"
	return f66_local0
end

local f0_local4 = function ( f67_arg0, f67_arg1 )
	assert( f67_arg1 )
	assert( f67_arg1.refreshFunction )
	local f67_local0 = MenuBuilder.BuildRegisteredType( "FenceDialogPopup", {
		message = Engine.Localize( "MP_FRONTEND_ONLY_DRAFTING" ),
		controllerIndex = f67_arg1.controllerIndex
	} )
	f67_local0:addElement( LUI.UITimer.new( nil, {
		interval = 500,
		event = {
			name = "refresh_fence_dialog"
		}
	} ) )
	f67_local0:addEventHandler( "refresh_fence_dialog", function ( f68_arg0, f68_arg1 )
		f67_arg1.refreshFunction()
	end )
	return f67_local0
end

local f0_local5 = function ( f69_arg0, f69_arg1 )
	local f69_local0 = MenuBuilder.BuildRegisteredType( "PopupOK", {
		width = 600,
		title = Engine.Localize( "MP_FRONTEND_ONLY_INVALID_TEAMS_TITLE" ),
		message = Engine.Localize( "MP_FRONTEND_ONLY_DRAFT_SPLITSCREEN" ),
		defaultFocusIndex = 1,
		cancelClosesPopup = true,
		buttonsClosePopup = true
	} )
	f69_local0.id = "CWLSplitscreenPlayersPopup"
	return f69_local0
end

local f0_local6 = function ( f70_arg0, f70_arg1 )
	assert( f70_arg1 )
	assert( f70_arg1.controllerIndex )
	assert( f70_arg1.draftPhaseText )
	assert( f70_arg1.baseCountdownTime )
	local f70_local0 = MenuBuilder.BuildRegisteredType( "FenceDialogPopup", {
		message = Engine.Localize( f70_arg1.draftPhaseText, LoadoutDrafting.GetDraftingTimeRemaining() - f70_arg1.baseCountdownTime ),
		controllerIndex = f70_arg1.controllerIndex
	} )
	f70_local0:addElement( LUI.UITimer.new( nil, {
		interval = 100,
		event = {
			name = "refresh_fence_dialog"
		}
	} ) )
	f70_local0:addEventHandler( "refresh_fence_dialog", function ( f71_arg0, f71_arg1 )
		f70_local0:SetText( Engine.Localize( f70_arg1.draftPhaseText, LoadoutDrafting.GetDraftingTimeRemaining() - f70_arg1.baseCountdownTime ) )
		if IsMlgGameBattlesMatch() and MLG.GetGameBattleDSAcquisitionState( f70_arg1.controllerIndex ) ~= GAMEBATTLES.MLG_DS_ACQUISITION_STATE.ACQUIRED then
			LUI.FlowManager.RequestLeaveMenuByName( "PreDraftCountdownPopup" )
		end
	end )
	return f70_local0
end

local f0_local7 = function ( f72_arg0, f72_arg1 )
	local f72_local0 = MenuBuilder.BuildRegisteredType( "PopupOK", {
		width = 600,
		title = Engine.Localize( "MP_FRONTEND_ONLY_INVALID_TEAMS_TITLE" ),
		message = Engine.Localize( "MP_FRONTEND_ONLY_INVALID_TEAMS_MSG" ),
		defaultFocusIndex = 1,
		cancelClosesPopup = true,
		buttonsClosePopup = true
	} )
	f72_local0.id = "CWLInvalidTeamsPopup"
	return f72_local0
end

local f0_local8 = function ( f73_arg0, f73_arg1 )
	local f73_local0 = MenuBuilder.BuildRegisteredType( "PopupOK", {
		width = 600,
		title = Engine.Localize( "MP_FRONTEND_ONLY_INVALID_TEAMS_TITLE" ),
		message = Engine.Localize( "MP_FRONTEND_ONLY_NO_TEAM_PLAYER" ),
		defaultFocusIndex = 1,
		cancelClosesPopup = true,
		buttonsClosePopup = true
	} )
	f73_local0.id = "CWLNoTeamPlayersPopup"
	return f73_local0
end

local f0_local9 = function ( f74_arg0, f74_arg1 )
	local f74_local0 = {
		title = Engine.Localize( "LUA_MENU_ANNOUNCER_VOICE" ),
		width = _1080p * 700,
		defaultFocusIndex = 0,
		cancelClosesPopup = false
	}
	local f74_local1 = MenuBuilder.BuildRegisteredType( "AnnouncerVoiceSelectWidget", {
		controllerIndex = f74_arg1.controllerIndex
	} )
	f74_local1.id = "AnnouncerVoiceSelectWidget"
	f74_local0.listContent = {}
	table.insert( f74_local0.listContent, f74_local1 )
	local f74_local2 = MenuBuilder.BuildRegisteredType( "PopupList", f74_local0 )
	f74_local2.id = "AnnouncerVoiceSelectPopup"
	return f74_local2
end

local f0_local10 = function ( f75_arg0, f75_arg1 )
	local f75_local0 = MenuBuilder.buildItems( {
		type = "generic_yesno_popup",
		properties = {
			popup_title = Engine.Localize( "LUA_MENU_ANNOUNCER_VOICE" ),
			message_text = Engine.Localize( "LUA_MENU_ANNOUNCER_PURCHASE_CONFIRM", f75_arg1.name ),
			yes_text = Engine.Localize( "LUA_MENU_YES" ),
			yes_action = f75_arg1.confirmAction,
			no_text = Engine.Localize( "LUA_MENU_CANCEL" )
		}
	} )
	f75_local0.id = "AnnouncerStoreYesNoPopup"
	return f75_local0
end

local f0_local11 = function ( f76_arg0, f76_arg1 )
	local f76_local0 = MenuBuilder.buildItems( {
		type = "generic_yesno_popup",
		properties = {
			popup_title = Engine.Localize( "@MENU_NOTICE" ),
			message_text = Engine.Localize( "LUA_MENU_MP_PURCHASE_DLC_CP", f76_arg1.cost ),
			yes_text = Engine.Localize( "LUA_MENU_YES" ),
			no_text = Engine.Localize( "LUA_MENU_CANCEL" ),
			yes_action = function ()
				Loot.PurchaseItem( f76_arg1.controllerIndex, f76_arg1.itemID, true )
				LUI.FlowManager.RequestPopupMenu( element, "live_dialog_text_box", true, f76_arg1.controllerIndex, true, {
					message = Engine.Localize( "LUA_MENU_MP_PURCHASING_DLC" )
				} )
			end
		}
	} )
	f76_local0.id = "DLCStoreYesNoPopup"
	return f76_local0
end

MenuBuilder.registerType( "PreDraftCountdownPopup", f0_local6 )
MenuBuilder.registerType( "RequestDraftPopup", f0_local4 )
MenuBuilder.registerType( "DraftFailed", f0_local3 )
MenuBuilder.registerDef( "newPatchManifestRestart", newPatchManifestRestart )
MenuBuilder.registerDef( "menu_resetstats_offline", menu_resetstats_offline )
MenuBuilder.registerDef( "menu_resetstats_warning", menu_resetstats_warning )
MenuBuilder.registerType( "TURequiredWarning", TURequiredWarning )
MenuBuilder.registerType( "error_popmenu_lobby", error_popmenu_lobby )
MenuBuilder.registerType( "youarehost", youarehost )
MenuBuilder.registerDef( "makehostfailed", makehostfailed )
MenuBuilder.registerDef( "acceptinvite_warning", acceptinvite_warning )
MenuBuilder.registerDef( "user_generated_content_restriction_popup", user_generated_content_restriction_popup )
MenuBuilder.registerDef( "mp_dlc_switch_searchtype", mp_dlc_switch_searchtype )
MenuBuilder.registerDef( "popup_throttling", popup_throttling )
MenuBuilder.registerDef( "mlg_error_no_rules_available_offline", mlg_error_no_rules_available_offline )
MenuBuilder.registerDef( "mlg_error_no_rules_available", mlg_error_no_rules_available )
MenuBuilder.registerDef( "mp_no_guest_popup", mp_no_guest_popup )
MenuBuilder.registerDef( "popup_ugc_restricted", popup_ugc_restricted )
MenuBuilder.registerDef( "popup_chat_restricted", popup_chat_restricted )
MenuBuilder.registerDef( "strict_nat_warning", strict_nat_warning )
MenuBuilder.registerDef( "mp_panic_buttons_popup", mp_panic_buttons_popup )
MenuBuilder.registerType( "jip_with_password", jip_with_password )
MenuBuilder.registerDef( "popup_no_guest", popup_no_guest )
MenuBuilder.registerType( "popup_getting_lootcrate", popup_getting_lootcrate )
MenuBuilder.registerType( "ChooseLocalPlay", ChooseLocalPlay )
MenuBuilder.registerType( "code_already_redeemed_popup", code_already_redeemed_popup )
MenuBuilder.registerType( "code_expired_popup", code_expired_popup )
MenuBuilder.registerType( "code_redemption_failed_popup", code_redemption_failed_popup )
MenuBuilder.registerType( "RedeemingPopup", RedeemingPopup )
MenuBuilder.registerType( "LootItemError", LootItemError )
MenuBuilder.registerType( "ExchangeFailed", ExchangeFailed )
MenuBuilder.registerType( "MPFullScreenVideoOverlay", MPFullScreenVideoOverlay )
LUI.FlowManager.RegisterStackPopBehaviour( "MPFullScreenVideoOverlay", MPFullScreenVideoOverlayPop )
MenuBuilder.registerType( "PermanentUnlockAlreadyUnlockedPopup", PermanentUnlockAlreadyUnlockedPopup )
MenuBuilder.registerType( "PermanentUnlockNotEnoughTokensPopup", PermanentUnlockNotEnoughTokensPopup )
MenuBuilder.registerType( "PermanentUnlockEnterPopup", PermanentUnlockEnterPopup )
MenuBuilder.registerType( "PermanentUnlockCongratulationsPopup", PermanentUnlockCongratulationsPopup )
MenuBuilder.registerType( "ClassicWeaponAlreadyUnlockedPopup", ClassicWeaponAlreadyUnlockedPopup )
MenuBuilder.registerType( "ClassicWeaponNotEnoughTokensPopup", ClassicWeaponNotEnoughTokensPopup )
MenuBuilder.registerType( "ClassicWeaponsYesNoPopup", ClassicWeaponsYesNoPopup )
MenuBuilder.registerType( "CWLSplitscreenPlayersPopup", f0_local5 )
MenuBuilder.registerType( "CWLInvalidTeamsPopup", f0_local7 )
MenuBuilder.registerType( "CWLNoTeamPlayersPopup", f0_local8 )
MenuBuilder.registerType( "AnnouncerVoiceSelectPopup", f0_local9 )
MenuBuilder.registerType( "AnnouncerStoreYesNoPopup", f0_local10 )
MenuBuilder.registerType( "DLCStoreYesNoPopup", f0_local11 )
LockTable( _M )
