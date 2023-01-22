local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
FenceGamerProfile = LUI.Class( LUI.Fence )
FenceGamerProfile.init = function ( f1_arg0 )
	LUI.Fence.init( f1_arg0 )
end

FenceGamerProfile.Start = function ( f2_arg0 )
	DebugPrint( "FenceGamerProfile.Start" )
	f2_arg0._openedBrightnessMenu = false
end

FenceGamerProfile.Stop = function ( f3_arg0 )
	DebugPrint( "FenceGamerProfile.Stop" )
end

FenceGamerProfile.OnBackOut = function ( f4_arg0 )
	Engine.DeclineInvitationOnGamerProfileFenceBackout()
end

FenceGamerProfile.UpdateState = function ( f5_arg0 )
	assert( f5_arg0._state ~= LUI.Fence.STATE.fail )
	f5_arg0._state = LUI.Fence.STATE.pass
	local f5_local0 = nil
	for f5_local1 = 0, Engine.GetMaxControllerCount() - 1, 1 do
		if Engine.HasActiveLocalClient( f5_local1 ) then
			if Engine.IsActiveLocalClientPrimary( f5_local1 ) then
				f5_local0 = f5_local1
			end
			if Engine.IsPS4() and Engine.NeedToDeleteSaveData( f5_local1 ) then
				if not LUI.FlowManager.IsInStack( "popup_corrupt_data" ) then
					LUI.FlowManager.RequestPopupMenu( nil, "popup_corrupt_data", true, f5_local1, false, {}, nil, false, true )
				end
				f5_arg0._state = LUI.Fence.STATE.block
				return 
			elseif Engine.GetPreferredLanguage( f5_local1 ) == #Languages then
				Engine.SetPreferredLanguage( f5_local1, Engine.GetCurrentLanguage() )
				Engine.ExecNow( "updategamerprofile" )
			end
		end
	end
	if f5_local0 and Engine.IsUserSignedIn( f5_local0 ) and not Engine.UserIsGuest( f5_local0 ) then
		local f5_local1 = Engine.GetPreferredLanguage( f5_local0 )
		local f5_local2 = Engine.GetCurrentLanguage()
		if f5_local1 < #Languages and f5_local2 ~= f5_local1 then
			if Engine.IsLanguageAvailable( f5_local1 ) then
				LUI.FlowManager.RequestPopupMenu( unused, "PopupLanguageRestart", true, f5_local0, false, {
					currentLanguage = f5_local2,
					preferredLanguage = f5_local1
				}, nil, true, true )
			end
		elseif not Engine.GetProfileData( "acceptedEULA", f5_local0 ) then
			f5_arg0._state = LUI.Fence.STATE.block
			if not f5_arg0._openedEULA then
				f5_arg0._openedEULA = true
				LUI.FlowManager.RequestPopupMenu( unused, "EULAPopup", false, f5_local0, false, {}, nil, true, true )
			end
			if not LUI.FlowManager.IsInStack( "EULAPopup" ) then
				f5_arg0._state = LUI.Fence.STATE.fail
			end
		elseif not Engine.GetProfileData( "hasEverPlayed_MainMenu", f5_local0 ) then
			f5_arg0._state = LUI.Fence.STATE.block
			if not f5_arg0._openedBrightnessMenu then
				LUI.FlowManager.RequestPopupMenu( unused, "boot_brightness", false, f5_local0, false, {}, nil, true, true )
				f5_arg0._openedBrightnessMenu = true
				return 
			end
			if not LUI.FlowManager.IsInStack( "boot_brightness" ) and not LUI.FlowManager.IsInStack( "boot_screen_margins" ) then
				f5_arg0._state = LUI.Fence.STATE.pass
				Engine.ExecNow( "profile_SetHasEverPlayed_MainMenu" )
				Engine.ExecNow( "updategamerprofile" )
				if IsLanguageSubtitleOnByDefault() then
					Engine.SetSubtitlesEnabled( f5_local0, true )
				end
			end
		end
	end
end

function PopupCorruptData( f6_arg0, f6_arg1 )
	local f6_local0 = MenuBuilder.buildItems( {
		type = "generic_confirmation_popup",
		properties = {
			popup_title = Engine.Localize( "MENU_CORRUPT_SAVEDATA_TITLE" ),
			message_text = Engine.Localize( "MENU_CORRUPT_SAVEDATA_MESSAGE" ),
			button_text = Engine.Localize( "MENU_OK" ),
			confirmation_action = function ( f7_arg0, f7_arg1 )
				Engine.DeleteProfile( f7_arg1.controller )
				LUI.FlowManager.RequestLeaveMenuByName( "popup_corrupt_data", true )
			end
		}
	} )
	f6_local0.id = "popup_corrupt_data"
	return f6_local0
end

MenuBuilder.registerType( "PopupLanguageRestart", function ( f8_arg0, f8_arg1 )
	assert( f8_arg1.controllerIndex )
	assert( f8_arg1.currentLanguage )
	assert( f8_arg1.preferredLanguage )
	local f8_local0 = MenuBuilder.BuildRegisteredType( "PopupYesNo", {
		title = Engine.Localize( "MENU_NOTICE" ),
		message = Engine.Localize( "LANGUAGE_SELECT_MISMATCH", GetLanguageDisplayName( f8_arg1.currentLanguage ), GetLanguageDisplayName( f8_arg1.preferredLanguage ) ),
		yesAction = function ( f9_arg0, f9_arg1 )
			DCache.SetLanguage( f8_arg1.preferredLanguage )
			Engine.SystemRestart( "" )
		end,
		noAction = function ( f10_arg0, f10_arg1 )
			Engine.SetPreferredLanguage( f8_arg1.controllerIndex, f8_arg1.currentLanguage )
			Engine.ExecNow( "updategamerprofile" )
		end
	} )
	f8_local0.id = "PopupLanguageRestart"
	return f8_local0
end )
MenuBuilder.registerType( "popup_corrupt_data", PopupCorruptData )
LUI.Fence.Register( "gamerProfile", FenceGamerProfile )
LockTable( _M )
