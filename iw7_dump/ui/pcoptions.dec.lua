local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
f0_local0 = {
	DISABLED = 1,
	ENABLED = 2
}
f0_local1 = 5
f0_local2 = 9
function SinglePlayerDisabled( f1_arg0, f1_arg1 )
	return not Engine.IsMultiplayer()
end

function ChatDisableFunc( f2_arg0, f2_arg1 )
	local f2_local0 = SinglePlayerDisabled( f2_arg0, f2_arg1 )
	if not f2_local0 then
		f2_local0 = GamepadDisabledFunc( f2_arg0, f2_arg1 )
	end
	return f2_local0
end

function GamepadDisabledFunc( f3_arg0, f3_arg1 )
	return Engine.IsGamepadEnabled() == 1
end

function OptimalVideoDisabledFunc( f4_arg0, f4_arg1 )
	local f4_local0
	if not Engine.InFrontend() then
		f4_local0 = Engine.IsMultiplayer()
	else
		f4_local0 = false
	end
	return f4_local0
end

local f0_local3 = function ( f5_arg0 )
	return function ( f6_arg0, f6_arg1 )
		return OPTIONS.CreateAudioMixPresetButtons( f5_arg0, f6_arg1 )
	end
	
end

local f0_local4 = function ( f7_arg0, f7_arg1 )
	local f7_local0 = nil
	if f7_arg1 == "mix_preset" then
		f7_local0 = f7_arg0.mixPreset
	end
	return f7_local0
end

local f0_local5 = function ( f8_arg0, f8_arg1, f8_arg2, f8_arg3 )
	local f8_local0 = LUI.FlowManager.GetScopedData( f8_arg0 )
	f8_local0.currentOptionsSubCategory = f8_arg2
	local f8_local1 = nil
	local f8_local2 = f0_local4( f8_arg0, f8_arg2 )
	if f8_arg2 == "mix_preset" then
		f8_local1 = f0_local3( f8_arg1 )
	end
	f8_arg0:processEvent( {
		name = "subcategory_changed",
		title = f8_local2.Text:getText(),
		createOptions = f8_local1,
		noFocus = f8_arg3
	} )
end

function OptimalVideoNotice( f9_arg0, f9_arg1 )
	local f9_local0 = MenuBuilder.BuildRegisteredType( "PopupYesNo", {
		title = Engine.Localize( "MENU_RESET_SYSTEM_DEFAULTS" ),
		message = Engine.Localize( "MENU_RESTORE_DEFAULTS" ),
		yesAction = function ( f10_arg0, f10_arg1 )
			Engine.SetRecommended()
			Engine.SetDvarFloat( "com_fovUserScale", 1 )
			Engine.SetDvarFloat( "r_filmGrainAtten", 1 )
			Engine.SetDvarFloat( "r_smaaFilmicStrength", 1 )
			Engine.SetDvarFloat( "profileMenuOption_blacklevel", 0 )
			Engine.ExecNow( "profile_setFilmGrain " .. tostring( 1 ), f10_arg1 )
			Engine.MenuDvarsFinish( f10_arg1 )
			Engine.Exec( "wait; wait; r_applyPicmip;" )
			f10_arg0:dispatchEventToRoot( {
				name = "optimal_video_update"
			} )
		end,
		noAction = function ()
			
		end
	} )
	f9_local0.id = "OptimalVideoNotice"
	return f9_local0
end

function MicThreshDisable()
	return Engine.GetDvarBool( "cl_pushToTalk" )
end

function ResetControlsYesAction( f13_arg0, f13_arg1 )
	Engine.ExecNow( "profile_toggleLean 1", f13_arg1 )
	if Engine.IsGamepadEnabled() == 1 then
		Engine.ExecNow( "profile_setSticksConfig thumbstick_default", f13_arg1 )
		Engine.ExecNow( "profile_setButtonsConfig buttons_default", f13_arg1 )
		Engine.ExecNow( "profile_toggleInvertedPitch 0", f13_arg1 )
		Engine.ExecNow( "profile_toggleRumble 1", f13_arg1 )
		Engine.ExecNow( "profile_toggleAutoAim 1", f13_arg1 )
		Engine.ExecNow( "profile_toggleTargetAssist 1", f13_arg1 )
		Engine.ExecNow( "profile_toggleSprintCancelsReload 0", f13_arg1 )
		Engine.SetDvarFloat( "profileMenuOption_vertsensitivity", 4 )
		Engine.SetDvarFloat( "profileMenuOption_horzsensitivity", 4 )
	else
		if Engine.IsMultiplayer() then
			Engine.Exec( "exec default_keys_mp.cfg" )
		elseif Engine.IsSingleplayer() then
			Engine.Exec( "exec default_keys_sp.cfg" )
		end
		Engine.SetDvarFloat( "profileMenuOption_mousehorzsensitivity", f0_local1 )
		Engine.SetDvarFloat( "profileMenuOption_mousevertsensitivity", f0_local1 )
		Engine.SetDvarFloat( "profileMenuOption_mouseflightvertsensitivity", f0_local2 )
		Engine.SetDvarFloat( "profileMenuOption_mouseflighthorzsensitivity", f0_local2 )
		Engine.SetDvarBool( "profileMenuOption_mouseflightinversion", false )
	end
	Engine.ExecNow( "profile_toggleInvertedFlyPitch 0", f13_arg1 )
	Engine.ExecNow( "profile_menuDvarsFinish" )
end

function ResetControls()
	local f14_local0 = MenuBuilder.BuildRegisteredType( "PopupYesNo", {
		title = Engine.Localize( "LUA_MENU_SET_DEFAULT_CONTROLS" ),
		message = Engine.Localize( "LUA_MENU_RESTORE_EACH_SETTING" ),
		yesAction = ResetControlsYesAction,
		noAction = function ()
			
		end
	} )
	f14_local0.id = "ResetControls"
	return f14_local0
end

function CopyKeysFromOtherModeAction( f16_arg0, f16_arg1 )
	if CoD.GetCurrentGameMode() == CoD.PlayMode.SP then
		Engine.ExecKeysCfgFrom( CoD.PlayMode.Core, f16_arg1 )
	else
		Engine.ExecKeysCfgFrom( CoD.PlayMode.SP, f16_arg1 )
	end
end

function CopyKeysFromOtherMode()
	local f17_local0 = {
		title = Engine.Localize( "LUA_MENU_PC_COPY_KEYS_TITLE" )
	}
	if Engine.IsMultiplayer() then
		f17_local0.message = Engine.Localize( "LUA_MENU_PC_COPY_KEYS_FROM_SP" )
	elseif Engine.IsSingleplayer() then
		f17_local0.message = Engine.Localize( "LUA_MENU_PC_COPY_KEYS_FROM_MP" )
	end
	f17_local0.yesAction = CopyKeysFromOtherModeAction
	f17_local0.noAction = function ()
		
	end
	
	local f17_local1 = MenuBuilder.BuildRegisteredType( "PopupYesNo", f17_local0 )
	f17_local1.id = "CopyKeysFromOtherMode"
	return f17_local1
end

local f0_local6 = function ( f19_arg0, f19_arg1 )
	local f19_local0 = {}
	local f19_local1 = MenuBuilder.BuildRegisteredType( "GenericFillBarArrowButton", {
		controllerIndex = f19_arg1
	} )
	f19_local1.id = "Brightness"
	f19_local1:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 50, 0 )
	f19_local1.Title:setText( ToUpperCase( Engine.Localize( "MENU_BRIGHTNESS" ) ), 0 )
	f19_local1.buttonDescription = Engine.Localize( "MENU_BRIGHTNESS_DESC1" )
	f19_local1:addEventHandler( "button_over", function ( f20_arg0, f20_arg1 )
		f19_arg0:processEvent( {
			name = "brightness_over"
		} )
	end )
	f19_local1:addEventHandler( "button_up", function ( f21_arg0, f21_arg1 )
		f19_arg0:processEvent( {
			name = "brightness_up"
		} )
	end )
	OPTIONS.CreateBrightnessSliderLogic( f19_local1, f19_arg1 )
	f19_local0[#f19_local0 + 1] = f19_local1
	if Engine.InFrontend() then
		local f19_local2 = MenuBuilder.BuildRegisteredType( "GenericArrowButton", {
			controllerIndex = f19_arg1
		} )
		f19_local2.id = "Colorblind"
		f19_local2:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 50, 0 )
		f19_local2.Title:setText( ToUpperCase( Engine.Localize( "LUA_MENU_COLORBLIND_FILTER_CAPS" ) ), 0 )
		f19_local2.buttonDescription = Engine.Localize( "LUA_MENU_COLOR_BLIND_DESC" )
		OPTIONS.CreateColorblindFilterLogic( f19_local2, f19_arg1 )
		f19_local0[#f19_local0 + 1] = f19_local2
	end
	local f19_local2 = MenuBuilder.BuildRegisteredType( "GenericArrowButton", {
		controllerIndex = f19_arg1
	} )
	f19_local2.id = "FPSCounter"
	f19_local2:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 50, 0 )
	f19_local2.Title:setText( ToUpperCase( Engine.Localize( "LUA_MENU_FPS_OPTION_CAPS" ) ), 0 )
	f19_local2.buttonDescription = Engine.Localize( "LUA_MENU_FPS_OPTION_DESC" )
	OPTIONS.CreateFPSCounterLogic( f19_local2, f19_arg1 )
	f19_local0[#f19_local0 + 1] = f19_local2
	local f19_local3 = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f19_arg1
	} )
	f19_local3.id = "OptimalVideo"
	f19_local3:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 50, 0 )
	f19_local3.buttonDescription = Engine.Localize( "LUA_MENU_OPTIMAL_VIDEO_DESC" )
	f19_local3.Text:setText( ToUpperCase( Engine.Localize( "LUA_MENU_OPTIMAL_VIDEO_AUDIO_CAPS" ) ), 0 )
	f19_local3.Text:SetAlignment( LUI.Alignment.Left )
	f19_local3:SetButtonDisabled( OptimalVideoDisabledFunc() )
	f19_local3:addEventHandler( "button_action", function ( f22_arg0, f22_arg1 )
		LUI.FlowManager.RequestPopupMenu( nil, "OptimalVideoNotice", true, f19_arg1 )
	end )
	f19_local0[#f19_local0 + 1] = f19_local3
	local f19_local4 = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f19_arg1
	} )
	f19_local4.id = "AdvancedVideo"
	f19_local4:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 50, 0 )
	f19_local4.Text:setText( ToUpperCase( Engine.Localize( "LUA_MENU_ADVANCED_VIDEO" ) ), 0 )
	f19_local4.buttonDescription = Engine.Localize( "LUA_MENU_ADVANCED_VIDEO_DESC" )
	f19_local4.Text:SetAlignment( LUI.Alignment.Left )
	f19_local4:addEventHandler( "button_action", function ( f23_arg0, f23_arg1 )
		LUI.FlowManager.RequestAddMenu( "AdvancedVideoOptions", true, f19_arg1 )
	end )
	f19_local0[#f19_local0 + 1] = f19_local4
	return f19_local0
end

local f0_local7 = function ( f24_arg0, f24_arg1 )
	local f24_local0 = {}
	if Engine.IsAliensMode() then
		local f24_local1 = MenuBuilder.BuildRegisteredType( "GenericFillBarArrowButton", {
			controllerIndex = f24_arg1
		} )
		f24_local1.id = "MusicPlaylist"
		f24_local1:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 50, 0 )
		f24_local1.Title:setText( ToUpperCase( Engine.Localize( "MENU_MUSIC_PLAYLIST_CAPS" ) ), 0 )
		f24_local1.buttonDescription = Engine.Localize( "PLATFORM_OPTIONS_MUSIC_PLAYLIST_DESC" )
		OPTIONS.CreateVolumeLogic( f24_local1, f24_arg1, "profileMenuOption_licensedMusicVolume" )
		f24_local0[#f24_local0 + 1] = f24_local1
	end
	local f24_local1 = MenuBuilder.BuildRegisteredType( "GenericFillBarArrowButton", {
		controllerIndex = f24_arg1
	} )
	f24_local1.id = "Volume"
	f24_local1:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 50, 0 )
	f24_local1.Title:setText( ToUpperCase( Engine.Localize( "MENU_MASTER_VOLUME" ) ), 0 )
	f24_local1.buttonDescription = Engine.Localize( "PLATFORM_OPTIONS_GAME_VOLUME_DESC" )
	OPTIONS.CreateVolumeLogic( f24_local1, f24_arg1, "profileMenuOption_volume" )
	f24_local0[#f24_local0 + 1] = f24_local1
	local f24_local2 = MenuBuilder.BuildRegisteredType( "GenericFillBarArrowButton", {
		controllerIndex = f24_arg1
	} )
	f24_local2.id = "VoiceVolume"
	f24_local2:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 50, 0 )
	f24_local2.Title:setText( ToUpperCase( Engine.Localize( "MENU_VOICE_VOLUME" ) ), 0 )
	f24_local2.buttonDescription = Engine.Localize( "PLATFORM_OPTIONS_VOICE_VOLUME_DESC" )
	OPTIONS.CreateVolumeLogic( f24_local2, f24_arg1, "profileMenuOption_voiceVolume" )
	f24_local0[#f24_local0 + 1] = f24_local2
	local f24_local3 = MenuBuilder.BuildRegisteredType( "GenericFillBarArrowButton", {
		controllerIndex = f24_arg1
	} )
	f24_local3.id = "MusicVolume"
	f24_local3:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 50, 0 )
	f24_local3.Title:setText( ToUpperCase( Engine.Localize( "MENU_MUSIC_VOLUME" ) ), 0 )
	f24_local3.buttonDescription = Engine.Localize( "PLATFORM_OPTIONS_MUSIC_VOLUME_DESC" )
	OPTIONS.CreateVolumeLogic( f24_local3, f24_arg1, "profileMenuOption_musicVolume" )
	f24_local0[#f24_local0 + 1] = f24_local3
	local f24_local4 = MenuBuilder.BuildRegisteredType( "GenericFillBarArrowButton", {
		controllerIndex = f24_arg1
	} )
	f24_local4.id = "EffectsVolume"
	f24_local4:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 50, 0 )
	f24_local4.Title:setText( ToUpperCase( Engine.Localize( "MENU_EFFECTS_VOLUME" ) ), 0 )
	f24_local4.buttonDescription = Engine.Localize( "PLATFORM_OPTIONS_EFFECTS_VOLUME_DESC" )
	OPTIONS.CreateVolumeLogic( f24_local4, f24_arg1, "profileMenuOption_effectsVolume" )
	f24_local0[#f24_local0 + 1] = f24_local4
	if Engine.IsSingleplayer() then
		local f24_local5 = MenuBuilder.BuildRegisteredType( "GenericArrowButton", {
			controllerIndex = f24_arg1
		} )
		f24_local5.id = "Subtitles"
		f24_local5:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 50, 0 )
		f24_local5.Title:setText( ToUpperCase( Engine.Localize( "MENU_SUBTITLES_CAPS" ) ), 0 )
		OPTIONS.CreateSubtitleLogic( f24_local5, f24_arg1 )
		f24_local0[#f24_local0 + 1] = f24_local5
	end
	local f24_local5, f24_local6 = OPTIONS.GetCurrentAudioMixPreset()
	local f24_local7 = OPTIONS.BuildGenericDualLabelButton( "MixPreset", "LUA_MENU_MIX_PRESET", f24_local6, "LUA_MENU_MIX_PRESET_DESC", f24_arg1 )
	f24_arg0.mixPreset = f24_local7
	f24_local7:addEventHandler( "button_action", function ( f25_arg0, f25_arg1 )
		f0_local5( f24_arg0, "LUA_MENU_MIX_PRESET_DESC", "mix_preset", f25_arg1.mouse )
	end )
	f24_local7:addEventHandler( "refresh_values", function ( f26_arg0, f26_arg1 )
		local f26_local0, f26_local1 = OPTIONS.GetCurrentAudioMixPreset()
		f24_local7.DynamicText:setText( ToUpperCase( Engine.Localize( f26_local1 ) ) )
	end )
	f24_local0[#f24_local0 + 1] = f24_local7
	return f24_local0
end

local f0_local8 = function ( f27_arg0, f27_arg1 )
	local f27_local0 = {}
	local f27_local1 = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f27_arg1
	} )
	f27_local1.id = "Movement"
	f27_local1:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 50, 0 )
	f27_local1.Text:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MOVEMENT" ) ), 0 )
	f27_local1.Text:SetAlignment( LUI.Alignment.Left )
	f27_local1.buttonDescription = Engine.Localize( "LUA_MENU_MOVEMENT_DESC" )
	f27_local1:addEventHandler( "button_action", function ( f28_arg0, f28_arg1 )
		LUI.FlowManager.RequestAddMenu( "PCControlOptions", true, f27_arg1, false, {
			optionsMenu = "movement_controls",
			title = "LUA_MENU_MOVEMENT"
		} )
	end )
	f27_local1:SetButtonDisabled( GamepadDisabledFunc() )
	f27_local0[#f27_local0 + 1] = f27_local1
	local f27_local2 = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f27_arg1
	} )
	f27_local2.id = "Actions"
	f27_local2:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 50, 0 )
	f27_local2.Text:setText( ToUpperCase( Engine.Localize( "LUA_MENU_ACTIONS" ) ), 0 )
	f27_local2.Text:SetAlignment( LUI.Alignment.Left )
	f27_local2.buttonDescription = Engine.Localize( "LUA_MENU_ACTIONS_DESC" )
	f27_local2:addEventHandler( "button_action", function ( f29_arg0, f29_arg1 )
		LUI.FlowManager.RequestAddMenu( "PCControlOptions", true, f27_arg1, false, {
			optionsMenu = "actions_controls",
			title = "LUA_MENU_ACTIONS"
		} )
	end )
	f27_local2:SetButtonDisabled( GamepadDisabledFunc() )
	f27_local0[#f27_local0 + 1] = f27_local2
	local f27_local3 = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f27_arg1
	} )
	f27_local3.id = "Look"
	f27_local3:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 50, 0 )
	f27_local3.Text:setText( ToUpperCase( Engine.Localize( "LUA_MENU_LOOK" ) ), 0 )
	f27_local3.Text:SetAlignment( LUI.Alignment.Left )
	f27_local3.buttonDescription = Engine.Localize( "LUA_MENU_LOOK_DESC" )
	f27_local3:addEventHandler( "button_action", function ( f30_arg0, f30_arg1 )
		LUI.FlowManager.RequestAddMenu( "PCControlOptions", true, f27_arg1, false, {
			optionsMenu = "look_controls",
			title = "LUA_MENU_LOOK"
		} )
	end )
	f27_local3:SetButtonDisabled( GamepadDisabledFunc() )
	f27_local0[#f27_local0 + 1] = f27_local3
	local f27_local4 = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f27_arg1
	} )
	f27_local4.id = "Chat"
	f27_local4:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 50, 0 )
	f27_local4.Text:setText( ToUpperCase( Engine.Localize( "LUA_MENU_CHAT" ) ), 0 )
	f27_local4.Text:SetAlignment( LUI.Alignment.Left )
	f27_local4.buttonDescription = Engine.Localize( "LUA_MENU_CHAT_DESC" )
	f27_local4:addEventHandler( "button_action", function ( f31_arg0, f31_arg1 )
		LUI.FlowManager.RequestAddMenu( "PCControlOptions", true, f27_arg1, false, {
			optionsMenu = "chat_controls",
			title = "LUA_MENU_CHAT"
		} )
	end )
	f27_local4:SetButtonDisabled( ChatDisableFunc() )
	f27_local0[#f27_local0 + 1] = f27_local4
	local f27_local5 = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f27_arg1
	} )
	f27_local5.id = "Gamepad"
	f27_local5:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 50, 0 )
	f27_local5.Text:setText( ToUpperCase( Engine.Localize( "LUA_MENU_GAMEPAD" ) ), 0 )
	f27_local5.Text:SetAlignment( LUI.Alignment.Left )
	f27_local5.buttonDescription = Engine.Localize( "LUA_MENU_GAMEPAD_DESC" )
	f27_local5:addEventHandler( "button_action", function ( f32_arg0, f32_arg1 )
		LUI.FlowManager.RequestAddMenu( "PCControlOptions", true, f27_arg1, false, {
			optionsMenu = "gamepad_controls",
			title = "LUA_MENU_GAMEPAD"
		} )
	end )
	f27_local0[#f27_local0 + 1] = f27_local5
	local f27_local6 = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f27_arg1
	} )
	f27_local6.id = "CopyKeysFromOtherMode"
	f27_local6:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 50, 0 )
	f27_local6.Text:SetAlignment( LUI.Alignment.Left )
	if Engine.IsMultiplayer() then
		f27_local6.Text:setText( ToUpperCase( Engine.Localize( "LUA_MENU_PC_COPY_KEYS_MP" ) ), 0 )
		f27_local6.buttonDescription = Engine.Localize( "LUA_MENU_PC_COPY_KEYS_MP_DESC" )
	elseif Engine.IsSingleplayer() then
		f27_local6.Text:setText( ToUpperCase( Engine.Localize( "LUA_MENU_PC_COPY_KEYS_SP" ) ), 0 )
		f27_local6.buttonDescription = Engine.Localize( "LUA_MENU_PC_COPY_KEYS_SP_DESC" )
	end
	f27_local6:addEventHandler( "button_action", function ( f33_arg0, f33_arg1 )
		LUI.FlowManager.RequestPopupMenu( nil, "CopyKeysFromOtherMode", true, f27_arg1 )
	end )
	f27_local0[#f27_local0 + 1] = f27_local6
	local f27_local7 = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f27_arg1
	} )
	f27_local7.id = "ResetControls"
	f27_local7:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 50, 0 )
	f27_local7.Text:setText( ToUpperCase( Engine.Localize( "LUA_MENU_RESTORE_DEFAULT_CONTROLS" ) ), 0 )
	f27_local7.Text:SetAlignment( LUI.Alignment.Left )
	f27_local7.buttonDescription = Engine.Localize( "LUA_MENU_RESET_CONTROLS_DESC" )
	f27_local7:addEventHandler( "button_action", function ( f34_arg0, f34_arg1 )
		LUI.FlowManager.RequestPopupMenu( nil, "ResetControls", true, f27_arg1 )
	end )
	f27_local0[#f27_local0 + 1] = f27_local7
	return f27_local0
end

local f0_local9 = function ( f35_arg0, f35_arg1 )
	Engine.SetDvarFloat( "winvoice_mic_reclevel", f35_arg0 )
	Engine.MenuDvarsFinish( f35_arg1 )
end

local f0_local10 = function ( f36_arg0, f36_arg1 )
	Engine.SetDvarFloat( "winvoice_mic_threshold", f36_arg0 )
	Engine.MenuDvarsFinish( f36_arg1 )
end

local f0_local11 = function ( f37_arg0, f37_arg1 )
	local f37_local0 = true
	if f37_arg0 == 1 then
		f37_local0 = false
	end
	Engine.SetDvarBool( "cl_voice", f37_local0 )
	Engine.MenuDvarsFinish( f37_arg1 )
end

local f0_local12 = function ( f38_arg0, f38_arg1 )
	local f38_local0 = true
	if f38_arg0 == 1 then
		f38_local0 = false
	end
	Engine.SetDvarBool( "cl_textChatEnabled", f38_local0 )
	Engine.MenuDvarsFinish( f38_arg1 )
end

local f0_local13 = function ( f39_arg0, f39_arg1 )
	local f39_local0 = {}
	local f39_local1 = MenuBuilder.BuildRegisteredType( "GenericFillBarArrowButton", {
		controllerIndex = f39_arg1
	} )
	if not Engine.IsPCApp() then
		local f39_local2 = MenuBuilder.BuildRegisteredType( "GenericFillBarArrowButton", {
			controllerIndex = f39_arg1
		} )
		f39_local2.id = "RecordLevel"
		f39_local2:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 50, 0 )
		f39_local2.Title:setText( ToUpperCase( Engine.Localize( "LUA_MENU_VOICECHAT_RECORD_LEVEL" ) ), 0 )
		f39_local2.buttonDescription = Engine.Localize( "LUA_MENU_VOICECHAT_RECORD_LEVEL_DESC" )
		LUI.AddUIArrowFillBarButtonLogic( f39_local2, f39_arg1, {
			decimalPlacesToRound = 2,
			action = f0_local9,
			defaultValue = Engine.GetDvarFloat( "winvoice_mic_reclevel" ),
			wrapAround = false,
			max = SliderBounds.VoiceRecord.Max,
			min = SliderBounds.VoiceRecord.Min,
			step = SliderBounds.VoiceRecord.Step,
			fillElement = f39_local2.GenericFillBar.Fill
		} )
		f39_local0[#f39_local0 + 1] = f39_local2
		local f39_local3 = MenuBuilder.BuildRegisteredType( "GenericFillBarArrowButton", {
			controllerIndex = f39_arg1
		} )
		f39_local3.id = "VoiceLevelIndicator"
		f39_local3:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 50, 0 )
		f39_local3.Title:setText( ToUpperCase( Engine.Localize( "LUA_MENU_VOICECHAT_LEVEL_INDICATOR" ) ), 0 )
		f39_local3.buttonDescription = Engine.Localize( "LUA_MENU_VOICECHAT_LEVEL_INDICATOR_DESC" )
		f39_local3:SetButtonDisabled( true )
		f39_local3.ArrowRight:SetAlpha( 0 )
		f39_local3.ArrowLeft:SetAlpha( 0 )
		f39_local0[#f39_local0 + 1] = f39_local3
		local f39_local4 = f39_arg0:Wait( 100 )
		local f39_local5 = nil
		f39_local4.onComplete = function ( f40_arg0 )
			f39_local3.GenericFillBar.Fill:SetAnchors( 0, 1 - Engine.GetVoiceLevel(), 0, 0, 0 )
			local f40_local0 = f40_arg0:Wait( 100 )
			f40_local0.onComplete = f39_local5
		end
		
		f39_local1.id = "VoiceThreshold"
		f39_local1:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 50, 0 )
		f39_local1.Title:setText( ToUpperCase( Engine.Localize( "LUA_MENU_PICKUP_THRESHOLD" ) ), 0 )
		f39_local1.buttonDescription = Engine.Localize( "LUA_MENU_PICKUP_THRESHOLD_DESC" )
		local f39_local6 = {
			decimalPlacesToRound = 2,
			action = f0_local10,
			defaultValue = Engine.GetDvarFloat( "winvoice_mic_threshold" ),
			wrapAround = false,
			max = SliderBounds.VoiceThreshold.Max,
			min = SliderBounds.VoiceThreshold.Min,
			step = SliderBounds.VoiceThreshold.Step,
			fillElement = f39_local1.GenericFillBar.Fill
		}
		f39_local1:SetButtonDisabled( MicThreshDisable() )
		LUI.AddUIArrowFillBarButtonLogic( f39_local1, f39_arg1, f39_local6 )
		f39_local0[#f39_local0 + 1] = f39_local1
	end
	local f39_local2 = MenuBuilder.BuildRegisteredType( "GenericArrowButton", {
		controllerIndex = f39_arg1
	} )
	f39_local2.id = "PushToTalk"
	f39_local2:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 50, 0 )
	f39_local2.Title:setText( ToUpperCase( Engine.Localize( "LUA_MENU_PUSH_TO_TALK" ) ), 0 )
	f39_local2.buttonDescription = Engine.Localize( "LUA_MENU_PUSH_TO_TALK_DESC" )
	local f39_local7 = Engine.GetDvarBool( "cl_pushToTalk" )
	local f39_local8 = {}
	local f39_local3 = {}
	local f39_local4 = Engine.Localize( "LUA_MENU_DISABLED" )
	local f39_local5 = Engine.Localize( "LUA_MENU_ENABLED" )
	f39_local8.labels = f39_local4
	f39_local8.action = function ( f41_arg0, f41_arg1 )
		local f41_local0 = true
		if f41_arg0 == 1 then
			f41_local0 = false
		end
		Engine.SetDvarBool( "cl_pushToTalk", f41_local0 )
		Engine.MenuDvarsFinish( f41_arg1 )
		if not Engine.IsPCApp() then
			f39_local1:SetButtonDisabled( MicThreshDisable() )
		end
	end
	
	if f39_local7 then
		f39_local3 = f0_local0.ENABLED
		if not f39_local3 then
		
		else
			f39_local8.defaultValue = f39_local3
			f39_local8.wrapAround = true
			LUI.AddUIArrowTextButtonLogic( f39_local2, f39_arg1, f39_local8 )
			f39_local0[#f39_local0 + 1] = f39_local2
			f39_local3 = MenuBuilder.BuildRegisteredType( "GenericArrowButton", {
				controllerIndex = f39_arg1
			} )
			f39_local3.id = "UseVoiceCom"
			f39_local3:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 50, 0 )
			f39_local3.Title:setText( ToUpperCase( Engine.Localize( "LUA_MENU_USE_VOICE_COMMUNICATIONS" ) ), 0 )
			f39_local3.buttonDescription = Engine.Localize( "LUA_MENU_USE_VOICE_COMMUNICATIONS_DESC" )
			f39_local4 = Engine.GetDvarBool( "cl_voice" )
			f39_local5 = {}
			local f39_local9 = {}
			local f39_local6 = Engine.Localize( "LUA_MENU_DISABLED" )
			local f39_local10 = Engine.Localize( "LUA_MENU_ENABLED" )
			f39_local5.labels = f39_local6
			f39_local5.action = f0_local11
			if f39_local4 then
				f39_local9 = f0_local0.ENABLED
				if not f39_local9 then
				
				else
					f39_local5.defaultValue = f39_local9
					f39_local5.wrapAround = true
					LUI.AddUIArrowTextButtonLogic( f39_local3, f39_arg1, f39_local5 )
					f39_local0[#f39_local0 + 1] = f39_local3
					f39_local9 = MenuBuilder.BuildRegisteredType( "GenericArrowButton", {
						controllerIndex = f39_arg1
					} )
					f39_local9.id = "TextChatEnabled"
					f39_local9:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 50, 0 )
					f39_local9.Title:setText( ToUpperCase( Engine.Localize( "LUA_MENU_TEXTCHATENABLED" ) ), 0 )
					f39_local9.buttonDescription = Engine.Localize( "LUA_MENU_TEXTCHATENABLED_DESC" )
					f39_local6 = Engine.GetDvarBool( "cl_textChatEnabled" )
					f39_local10 = {}
					local f39_local11 = {}
					local f39_local12 = Engine.Localize( "LUA_MENU_DISABLED" )
					local f39_local13 = Engine.Localize( "LUA_MENU_ENABLED" )
					f39_local10.labels = f39_local12
					f39_local10.action = f0_local12
					if f39_local6 then
						f39_local11 = f0_local0.ENABLED
						if not f39_local11 then
						
						else
							f39_local10.defaultValue = f39_local11
							f39_local10.wrapAround = true
							LUI.AddUIArrowTextButtonLogic( f39_local9, f39_arg1, f39_local10 )
							f39_local0[#f39_local0 + 1] = f39_local9
							return f39_local0
						end
					end
					f39_local11 = f0_local0.DISABLED
				end
			end
			f39_local9 = f0_local0.DISABLED
		end
	end
	f39_local3 = f0_local0.DISABLED
end

local f0_local14 = function ( f42_arg0, f42_arg1 )
	local f42_local0 = nil
	if f42_arg1 == "video_options" then
		f42_local0 = f42_arg0.VideoOptions
	elseif f42_arg1 == "audio_options" then
		f42_local0 = f42_arg0.AudioOptions
	elseif f42_arg1 == "control_options" then
		f42_local0 = f42_arg0.ControlOptions
	elseif f42_arg1 == "voice_options" then
		f42_local0 = f42_arg0.VoiceOptions
	else
		f42_local0 = f42_arg0.VideoOptions
	end
	return f42_local0
end

local f0_local15 = function ( f43_arg0, f43_arg1, f43_arg2 )
	local f43_local0 = LUI.FlowManager.GetScopedData( f43_arg0 )
	f43_local0.currentOptionsCategory = f43_arg1
	local f43_local1 = nil
	local f43_local2 = f0_local14( f43_arg0, f43_arg1 )
	if f43_arg1 == "video_options" then
		f43_local1 = f0_local6
	elseif f43_arg1 == "audio_options" then
		f43_local1 = f0_local7
	elseif f43_arg1 == "control_options" then
		f43_local1 = f0_local8
	elseif f43_arg1 == "voice_options" then
		f43_local1 = f0_local13
	else
		f43_local1 = f0_local6
	end
	f43_arg0:processEvent( {
		name = "category_changed",
		title = f43_local2.Text:getText(),
		createOptions = f43_local1,
		noFocus = f43_arg2
	} )
end

local f0_local16 = function ( f44_arg0, f44_arg1, f44_arg2 )
	assert( f44_arg0.VideoOptions )
	assert( f44_arg0.AudioOptions )
	assert( f44_arg0.ControlOptions )
	Engine.ExecNow( "profile_menuDvarsSetup" )
	f44_arg0.VideoOptions:addEventHandler( "button_action", function ( f45_arg0, f45_arg1 )
		f0_local15( f44_arg0, "video_options", f45_arg1.mouse )
	end )
	f44_arg0.AudioOptions:addEventHandler( "button_action", function ( f46_arg0, f46_arg1 )
		f0_local15( f44_arg0, "audio_options", f46_arg1.mouse )
	end )
	f44_arg0.ControlOptions:addEventHandler( "button_action", function ( f47_arg0, f47_arg1 )
		f0_local15( f44_arg0, "control_options", f47_arg1.mouse )
	end )
	if Engine.IsMultiplayer() then
		f44_arg0.VoiceOptions:addEventHandler( "button_action", function ( f48_arg0, f48_arg1 )
			f0_local15( f44_arg0, "voice_options", f48_arg1.mouse )
		end )
	end
	f44_arg0:addEventHandler( "menu_create", function ()
		local f49_local0 = LUI.FlowManager.GetScopedData( f44_arg0 )
		local f49_local1 = f49_local0.currentOptionsCategory
		if f49_local1 == nil then
			f49_local1 = "video_options"
		end
		f0_local15( f44_arg0, f49_local1, true )
	end )
end

MenuBuilder.registerType( "PCOptionsButtons", function ( menu, controller )
	local self = LUI.UIVerticalList.new( {
		left = 0,
		right = 1100 * _1080p,
		top = 0 * _1080p,
		bottom = 705 * _1080p,
		leftAnchor = true,
		rightAnchor = false,
		topAnchor = true,
		bottomAnchor = false,
		spacing = 10 * _1080p
	} )
	self.id = "PCOptions"
	self._animationSets = {}
	self._sequences = {}
	local f50_local1 = controller or {}
	local f50_local2 = f50_local1.controllerIndex
	self:setUseStencil( false )
	
	local VideoOptions = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f50_local2
	} )
	VideoOptions.id = "VideoOptions"
	VideoOptions:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 30, 0 )
	VideoOptions.buttonDescription = Engine.Localize( "LUA_MENU_VIDEO_OPTIONS_DESC" )
	VideoOptions.Text:setText( ToUpperCase( Engine.Localize( "LUA_MENU_VIDEO_OPTIONS_CAPS" ) ), 0 )
	VideoOptions.Text:SetAlignment( LUI.Alignment.Left )
	self:addElement( VideoOptions )
	self.VideoOptions = VideoOptions
	
	self.VideoOptions:addEventHandler( "button_over", function ( f51_arg0, f51_arg1 )
		self:processEvent( {
			name = "category_button_over"
		} )
	end )
	
	local AudioOptions = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f50_local2
	} )
	AudioOptions.id = "AudioOptions"
	AudioOptions:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 30, 0 )
	AudioOptions.buttonDescription = Engine.Localize( "LUA_MENU_AUDIO_OPTIONS_DESC" )
	AudioOptions.Text:setText( ToUpperCase( Engine.Localize( "LUA_MENU_AUDIO_OPTIONS_CAPS" ) ), 0 )
	AudioOptions.Text:SetAlignment( LUI.Alignment.Left )
	self:addElement( AudioOptions )
	self.AudioOptions = AudioOptions
	
	self.AudioOptions:addEventHandler( "button_over", function ( f52_arg0, f52_arg1 )
		self:processEvent( {
			name = "category_button_over"
		} )
	end )
	
	local ControlOptions = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f50_local2
	} )
	ControlOptions.id = "ControlOptions"
	ControlOptions:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 30, 0 )
	ControlOptions.buttonDescription = Engine.Localize( "LUA_MENU_CONTROL_OPTIONS_DESC" )
	ControlOptions.Text:setText( ToUpperCase( Engine.Localize( "LUA_MENU_CONTROL_OPTIONS_CAPS" ) ), 0 )
	ControlOptions.Text:SetAlignment( LUI.Alignment.Left )
	self:addElement( ControlOptions )
	self.ControlOptions = ControlOptions
	
	self.ControlOptions:addEventHandler( "button_over", function ( f53_arg0, f53_arg1 )
		self:processEvent( {
			name = "category_button_over"
		} )
	end )
	if Engine.IsMultiplayer() then
		local CODAccount = MenuBuilder.BuildRegisteredType( "GenericButton", {
			controllerIndex = f50_local2
		} )
		CODAccount.id = "VoiceOptions"
		CODAccount:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 30, 0 )
		CODAccount.buttonDescription = Engine.Localize( "LUA_MENU_VOICE_OPTIONS_DESC" )
		CODAccount.Text:setText( ToUpperCase( Engine.Localize( "LUA_MENU_VOICE_OPTIONS_CAPS" ) ), 0 )
		CODAccount.Text:SetAlignment( LUI.Alignment.Left )
		self:addElement( CODAccount )
		self.VoiceOptions = CODAccount
		
		self.VoiceOptions:addEventHandler( "button_over", function ( f54_arg0, f54_arg1 )
			self:processEvent( {
				name = "category_button_over"
			} )
		end )
	end
	if Engine.InFrontend() and (Engine.IsMultiplayer() or Engine.IsAliensMode()) and CODACCOUNT.IsEnabled() then
		local CODAccount = MenuBuilder.BuildRegisteredType( "GenericButton", {
			controllerIndex = f50_local2
		} )
		CODAccount.id = "CODAccount"
		CODAccount:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 30, 0 )
		CODAccount.buttonDescription = Engine.Localize( "CODACCOUNT_CODA_SET_UP_ACCOUNT" )
		local f50_local7 = IsOnlineMatch()
		local f50_local8 = CODACCOUNT.IsAccessDisabled( f50_local2 )
		if not f50_local7 then
			CODAccount.buttonDescription = Engine.Localize( "CODACCOUNT_CODA_ONLINE_REQUIRED" )
			f50_local8 = true
		elseif f50_local8 then
			CODAccount.buttonDescription = Engine.Localize( "CODACCOUNT_CODA_UNAVAILABLE" )
		end
		CODAccount.Text:setText( ToUpperCase( Engine.Localize( "CODACCOUNT_COD_ACCOUNT_CAPS" ) ), 0 )
		CODAccount.Text:SetAlignment( LUI.Alignment.Left )
		self:addElement( CODAccount )
		self.CODAccount = CODAccount
		
		self.CODAccount:addEventHandler( "button_over", function ( f55_arg0, f55_arg1 )
			self:processEvent( {
				name = "category_button_over"
			} )
		end )
		CODAccount:addEventHandler( "button_action", function ( f56_arg0, f56_arg1 )
			CODACCOUNT.OpenCoDAccountPopupMenu( self, f56_arg1.controller )
		end )
		if f50_local8 then
			CODAccount:ElementDisable()
		end
	end
	f0_local16( self, f50_local2, f50_local1 )
	return self
end )
MenuBuilder.registerType( "OptimalVideoNotice", OptimalVideoNotice )
MenuBuilder.registerType( "ResetControls", ResetControls )
MenuBuilder.registerType( "CopyKeysFromOtherMode", CopyKeysFromOtherMode )
LockTable( _M )
