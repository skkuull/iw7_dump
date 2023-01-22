OPTIONS = {}
local f0_local0 = {
	thumbstick_default = "MENU_DEFAULT",
	thumbstick_southpaw = "MENU_SOUTHPAW",
	thumbstick_legacy = "MENU_LEGACY",
	thumbstick_southpaw_ns = "MENU_SOUTHPAW_NS",
	thumbstick_legacysouthpaw_ns = "MENU_LEGACY_SOUTHPAW_NS"
}
OPTIONS.buttonLayoutStrings = {
	buttons_default = "MENU_DEFAULT",
	buttons_tactical = "MENU_TACTICAL",
	buttons_lefty = "MENU_LEFTY",
	buttons_nomad = "MENU_NOMAD",
	buttons_nomad_tactical = "MENU_NOMAD_TACTICAL",
	buttons_nomad_lefty = "MENU_NOMAD_LEFTY",
	buttons_bumper_jumper = "MENU_BUMPER_JUMPER",
	buttons_bumper_jumper_tac = "MENU_BUMPER_JUMPER_TACTICAL",
	buttons_charlie = "MENU_CHARLIE",
	buttons_one_hand_gun = "MENU_ONE_HAND_GUN",
	buttons_stick_move = "MENU_STICK_MOVE",
	buttons_brawler = "MENU_BRAWLER",
	buttons_beast = "MENU_BEAST",
	buttons_default_alt = "MENU_DEFAULT_ALT",
	buttons_tactical_alt = "MENU_TACTICAL_ALT",
	buttons_lefty_alt = "MENU_LEFTY_ALT",
	buttons_nomad_alt = "MENU_NOMAD_ALT",
	buttons_nomad_tactical_alt = "MENU_NOMAD_TACTICAL_ALT",
	buttons_nomad_lefty_alt = "MENU_NOMAD_LEFTY_ALT",
	buttons_bumper_jumper_alt = "MENU_BUMPER_JUMPER_ALT",
	buttons_bumper_jumper_tac_alt = "MENU_BUMPER_JUMPER_TACTICAL_ALT",
	buttons_charlie_alt = "MENU_CHARLIE_ALT",
	buttons_one_hand_gun_alt = "MENU_ONE_HAND_GUN_ALT",
	buttons_stick_move_alt = "MENU_STICK_MOVE_ALT",
	buttons_brawler_alt = "MENU_BRAWLER_ALT",
	buttons_beast_alt = "MENU_BEAST_ALT"
}
local f0_local1 = {
	DISABLED = 1,
	ENABLED = 2
}
local f0_local2 = {
	"MENU_LOW",
	[3] = "MENU_MEDIUM",
	[7] = "MENU_HIGH",
	[13] = "MENU_VERY_HIGH",
	[20] = "MENU_INSANE"
}
local f0_local3 = function ( f1_arg0, f1_arg1 )
	Engine.ToggleRenderColorBlind( f1_arg1 )
end

OPTIONS.CreateColorblindFilterLogic = function ( f2_arg0, f2_arg1 )
	local f2_local0 = Engine.GetProfileData( "renderColorBlind", f2_arg1 )
	local f2_local1 = {}
	local f2_local2 = {}
	local f2_local3 = Engine.Localize( "LUA_MENU_DISABLED" )
	local f2_local4 = Engine.Localize( "LUA_MENU_ENABLED" )
	f2_local1.labels = f2_local3
	f2_local1.action = f0_local3
	if f2_local0 then
		f2_local2 = f0_local1.ENABLED
		if not f2_local2 then
		
		else
			f2_local1.defaultValue = f2_local2
			f2_local1.wrapAround = true
			LUI.AddUIArrowTextButtonLogic( f2_arg0, f2_arg1, f2_local1 )
		end
	end
	f2_local2 = f0_local1.DISABLED
end

local f0_local4 = function ( f3_arg0, f3_arg1 )
	Engine.SetDvarBool( "cg_fpsCounter", not Engine.GetDvarBool( "cg_fpsCounter" ) )
end

OPTIONS.CreateFPSCounterLogic = function ( f4_arg0, f4_arg1 )
	local f4_local0 = Engine.GetDvarBool( "cg_fpsCounter" )
	local f4_local1 = {}
	local f4_local2 = {}
	local f4_local3 = Engine.Localize( "LUA_MENU_DISABLED" )
	local f4_local4 = Engine.Localize( "LUA_MENU_ENABLED" )
	f4_local1.labels = f4_local3
	f4_local1.action = f0_local4
	if f4_local0 then
		f4_local2 = f0_local1.ENABLED
		if not f4_local2 then
		
		else
			f4_local1.defaultValue = f4_local2
			f4_local1.wrapAround = true
			LUI.AddUIArrowTextButtonLogic( f4_arg0, f4_arg1, f4_local1 )
		end
	end
	f4_local2 = f0_local1.DISABLED
end

local f0_local5 = function ( f5_arg0 )
	return function ( f6_arg0, f6_arg1 )
		Engine.SetDvarFloat( "profileMenuOption_blacklevel", Mirror( f6_arg0, SliderBounds.Brightness.Min, SliderBounds.Brightness.Max ) )
		Engine.MenuDvarsFinish( f6_arg1 )
		f5_arg0:dispatchEventToCurrentMenu( {
			name = "brightness_updated"
		} )
	end
	
end

OPTIONS.CreateBrightnessSliderLogic = function ( f7_arg0, f7_arg1 )
	local f7_local0 = {
		decimalPlacesToRound = 3,
		action = f0_local5( f7_arg0 ),
		defaultValue = LUI.clamp( Mirror( Engine.GetDvarFloat( "profileMenuOption_blacklevel" ), SliderBounds.Brightness.Min, SliderBounds.Brightness.Max ), SliderBounds.Brightness.Min, SliderBounds.Brightness.Max ),
		wrapAround = false,
		max = SliderBounds.Brightness.Max,
		min = SliderBounds.Brightness.Min,
		step = SliderBounds.Brightness.Step,
		pcstep = SliderBounds.Brightness.PCStep,
		fillElement = f7_arg0.GenericFillBar.Fill
	}
	f7_arg0:addEventHandler( "optimal_video_update", function ( f8_arg0, f8_arg1 )
		f7_arg0:SetCurrentValue( Mirror( Engine.GetDvarFloat( "profileMenuOption_blacklevel" ), SliderBounds.Brightness.Min, SliderBounds.Brightness.Max ) )
	end )
	LUI.AddUIArrowFillBarButtonLogic( f7_arg0, f7_arg1, f7_local0 )
end

local f0_local6 = function ( f9_arg0, f9_arg1 )
	Engine.SetSubtitlesEnabled( f9_arg1, not Engine.SubtitlesEnabled( f9_arg1 ) )
end

local f0_local7 = function ( f10_arg0, f10_arg1 )
	Engine.ToggleMPVoice( f10_arg1 )
end

local f0_local8 = function ( f11_arg0, f11_arg1 )
	Engine.SetDvarBool( "snd_mute_player_dialogue", f11_arg0 ~= f0_local1.ENABLED )
end

OPTIONS.CreateSubtitleLogic = function ( f12_arg0, f12_arg1 )
	assert( f12_arg0 )
	local f12_local0 = Engine.GetProfileData( "subtitles", f12_arg1 )
	local f12_local1 = {}
	local f12_local2 = {}
	local f12_local3 = Engine.Localize( "LUA_MENU_DISABLED" )
	local f12_local4 = Engine.Localize( "LUA_MENU_ENABLED" )
	f12_local1.labels = f12_local3
	f12_local1.action = f0_local6
	if f12_local0 then
		f12_local2 = f0_local1.ENABLED
		if not f12_local2 then
		
		else
			f12_local1.defaultValue = f12_local2
			f12_local1.wrapAround = true
			LUI.AddUIArrowTextButtonLogic( f12_arg0, f12_arg1, f12_local1 )
		end
	end
	f12_local2 = f0_local1.DISABLED
end

OPTIONS.CreateVolumeLogic = function ( f13_arg0, f13_arg1, f13_arg2 )
	assert( f13_arg0 )
	assert( f13_arg0.GenericFillBar )
	assert( f13_arg0.GenericFillBar.Fill )
	LUI.AddUIArrowFillBarButtonLogic( f13_arg0, f13_arg1, {
		decimalPlacesToRound = 2,
		action = function ( f14_arg0 )
			Engine.SetDvarFloat( f13_arg2, f14_arg0 )
			Engine.MenuDvarsFinish( f13_arg1 )
		end,
		defaultValue = Engine.GetDvarFloat( f13_arg2 ),
		wrapAround = false,
		max = SliderBounds.Volume.Max,
		min = SliderBounds.Volume.Min,
		step = SliderBounds.Volume.Step,
		pcstep = SliderBounds.Volume.PCStep,
		fillElement = f13_arg0.GenericFillBar.Fill
	} )
end

OPTIONS.CreateMPVoiceLogic = function ( f15_arg0, f15_arg1 )
	assert( f15_arg0 )
	local f15_local0 = Engine.GetProfileData( "snd_mpVoiceEnabled", f15_arg1 )
	local f15_local1 = {}
	local f15_local2 = {}
	local f15_local3 = Engine.Localize( "LUA_MENU_DISABLED" )
	local f15_local4 = Engine.Localize( "LUA_MENU_ENABLED" )
	f15_local1.labels = f15_local3
	f15_local1.action = f0_local7
	if f15_local0 then
		f15_local2 = f0_local1.ENABLED
		if not f15_local2 then
		
		else
			f15_local1.defaultValue = f15_local2
			f15_local1.wrapAround = true
			LUI.AddUIArrowTextButtonLogic( f15_arg0, f15_arg1, f15_local1 )
		end
	end
	f15_local2 = f0_local1.DISABLED
end

OPTIONS.CreateMPPlayerReactionLogic = function ( f16_arg0, f16_arg1 )
	assert( f16_arg0 )
	local f16_local0 = not Engine.GetDvarBool( "snd_mute_player_dialogue" )
	local f16_local1 = {}
	local f16_local2 = {}
	local f16_local3 = Engine.Localize( "LUA_MENU_DISABLED" )
	local f16_local4 = Engine.Localize( "LUA_MENU_ENABLED" )
	f16_local1.labels = f16_local3
	f16_local1.action = f0_local8
	if f16_local0 then
		f16_local2 = f0_local1.ENABLED
		if not f16_local2 then
		
		else
			f16_local1.defaultValue = f16_local2
			f16_local1.wrapAround = true
			LUI.AddUIArrowTextButtonLogic( f16_arg0, f16_arg1, f16_local1 )
		end
	end
	f16_local2 = f0_local1.DISABLED
end

OPTIONS.BuildGenericButton = function ( f17_arg0, f17_arg1, f17_arg2, f17_arg3 )
	local f17_local0 = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f17_arg3
	} )
	f17_local0.id = f17_arg0
	f17_local0:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 30, 0 )
	f17_local0.buttonDescription = Engine.Localize( f17_arg2 )
	f17_local0.Text:setText( ToUpperCase( Engine.Localize( f17_arg1 ) ), 0 )
	f17_local0.Text:SetAlignment( LUI.Alignment.Left )
	return f17_local0
end

OPTIONS.BuildGenericDualLabelButton = function ( f18_arg0, f18_arg1, f18_arg2, f18_arg3, f18_arg4 )
	local f18_local0 = MenuBuilder.BuildRegisteredType( "GenericDualLabelButton", {
		controllerIndex = f18_arg4
	} )
	f18_local0.id = f18_arg0
	f18_local0:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 50, 0 )
	f18_local0.buttonDescription = Engine.Localize( f18_arg3 )
	f18_local0.Text:setText( ToUpperCase( Engine.Localize( f18_arg1 ) ), 0 )
	f18_local0.Text:SetAlignment( LUI.Alignment.Left )
	f18_local0.DynamicText:setText( ToUpperCase( Engine.Localize( f18_arg2 ) ), 0 )
	return f18_local0
end

local f0_local9 = function ()
	return {
		{
			label = "LUA_MENU_DEFAULT",
			value = 0
		},
		{
			label = "LUA_MENU_MEDIUM_SPEAKERS",
			value = 3
		},
		{
			label = "LUA_MENU_SMALL_SPEAKERS",
			value = 1
		},
		{
			label = "LUA_MENU_HEADPHONES",
			value = 2
		}
	}
end

OPTIONS.GetCurrentAudioMixPreset = function ()
	local f20_local0 = f0_local9()
	local f20_local1 = Engine.GetDvarInt( "profileMenuOption_presetMix" )
	for f20_local2 = 1, #f20_local0, 1 do
		if f20_local0[f20_local2].value == f20_local1 then
			return f20_local1, f20_local0[f20_local2].label
		end
	end
	return 0, ""
end

OPTIONS.CreateAudioMixPresetButtons = function ( f21_arg0, f21_arg1 )
	local f21_local0 = {}
	local f21_local1 = f0_local9()
	local f21_local2 = function ( f22_arg0 )
		Engine.SetDvarInt( "profileMenuOption_presetMix", f21_local1[f22_arg0].value )
		Engine.MenuDvarsFinish( f21_arg1 )
	end
	
	for f21_local3 = 1, #f21_local1, 1 do
		local f21_local6 = f21_local3
		local f21_local7 = OPTIONS.BuildGenericButton( "MixPreset" .. f21_local6, f21_local1[f21_local6].label, f21_arg0, f21_arg1 )
		f21_local7:addEventHandler( "button_action", function ( f23_arg0, f23_arg1 )
			f21_local2( f21_local6 )
			f21_local7:dispatchEventToCurrentMenu( {
				name = "subcategory_option_selected"
			} )
		end )
		table.insert( f21_local0, f21_local7 )
	end
	return f21_local0
end

OPTIONS.CreateAudioMixPreset = function ( f24_arg0, f24_arg1 )
	assert( f24_arg0 )
	local f24_local0 = f0_local9()
	local f24_local1 = function ( f25_arg0 )
		Engine.SetDvarInt( "profileMenuOption_presetMix", f24_local0[f25_arg0].value )
		Engine.MenuDvarsFinish( f24_arg1 )
	end
	
	local f24_local2 = {}
	local f24_local3 = 1
	local f24_local4 = Engine.GetDvarInt( "profileMenuOption_presetMix" )
	for f24_local5 = 1, #f24_local0, 1 do
		table.insert( f24_local2, Engine.Localize( f24_local0[f24_local5].label ) )
		if f24_local0[f24_local5].value == f24_local4 then
			f24_local3 = f24_local5
		end
	end
	LUI.AddUIArrowTextButtonLogic( f24_arg0, f24_arg1, {
		labels = f24_local2,
		action = f24_local1,
		defaultValue = f24_local3,
		wrapAround = true
	} )
end

OPTIONS.CreateGender = function ( f26_arg0, f26_arg1 )
	assert( f26_arg0 )
	local f26_local0 = function ( f27_arg0, f27_arg1 )
		if Engine.GetPlayerDataEx( f27_arg1, CoD.StatsGroup.Common, "gender" ) then
			Engine.SetPlayerDataEx( f27_arg1, CoD.StatsGroup.Common, "gender", false )
		else
			Engine.SetPlayerDataEx( f27_arg1, CoD.StatsGroup.Common, "gender", true )
		end
	end
	
	local f26_local1 = Engine.GetPlayerDataEx( f26_arg1, CoD.StatsGroup.Common, "gender" )
	local f26_local2 = {}
	local f26_local3 = {}
	local f26_local4 = Engine.Localize( "LUA_MENU_MP_MALE" )
	local f26_local5 = Engine.Localize( "LUA_MENU_MP_FEMALE" )
	f26_local2.labels = f26_local4
	f26_local2.action = f26_local0
	if f26_local1 then
		f26_local3 = f0_local1.ENABLED
		if not f26_local3 then
		
		else
			f26_local2.defaultValue = f26_local3
			f26_local2.wrapAround = true
			LUI.AddUIArrowTextButtonLogic( f26_arg0, f26_arg1, f26_local2 )
		end
	end
	f26_local3 = f0_local1.DISABLED
end

