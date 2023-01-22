local f0_local0 = false
local f0_local1 = false
_1080p = 0.67
Memory = {
	InGame = {
		lowFreeBytes = 307200
	},
	Frontend = {
		lowFreeBytes = 1048576
	}
}
GameScriptConstants = {
	EntityNumNone = Engine.GetEntityNumNoneValue()
}
CurvedHUD = {
	xAmount = 0.45,
	yAmount = -0.35
}
ReticleParallaxAmount = {
	udmbackground = 0.2,
	udmforeground = 0.4,
	vrFrame = 1
}
JackalWeapons = {
	Guns = "spaceship_30mm_projectile",
	Cannons = "spaceship_cannon_projectile"
}
JackalModes = {
	none = 0,
	assault = 1,
	strike = 2,
	landing = 3
}
JackalBoosterStates = {
	Off = 0,
	Ready = 1,
	Priming = 2,
	Primed = 3,
	Engaged = 4,
	Damaged = 5
}
JackalLaunchStates = {
	Hover = 1,
	Launch = 2,
	LowFuel = 3,
	Detach = 4,
	Space = 5
}
JackalFlareStates = {
	NotReady = 0,
	Ready = 1
}
GrenadeReticleType = {
	generic = 0,
	primable = 1,
	cookable = 2,
	none = 3
}
VideoPlaybackFlags = {
	LOOP = 2,
	PRELOADED = 32,
	INTRO_THEN_LOOP = 64,
	SYNCHRONOUS_TRANSITION = 1024
}
C12LockState = {
	NON_TARGETABLE = 0,
	TARGETABLE = 1,
	TARGETED = 2
}
KillstreakConnectionState = {
	INACTIVE = 0,
	READY = 1,
	CONNECTING = 2,
	CONNECTED = 3,
	DISCONNECTING = 4
}
HintRange = {
	USE_RANGE = 0,
	SHORT_RANGE = 1,
	LONG_RANGE = 2
}
Memory.CheckLow = function ()
	local f1_local0 = Engine.GetBytesFree()
	local f1_local1 = Memory.InGame.lowFreeBytes
	if Engine.InFrontend() then
		f1_local1 = Memory.Frontend.lowFreeBytes
	end
	if f1_local0 < f1_local1 then
		DebugPrint( "LUI: Low on memory, running GC now.  BytesFree = " .. Engine.GetBytesFree() )
		collectgarbage( "collect" )
	end
end

MaxLocalClients = 2
ScreenResolution = {
	HD = {
		width = Engine.GetDisplayWidth() / Engine.GetDisplayHeight() * 720,
		height = 720,
		name = "HD"
	}
}
currentScreenResolution = "HD"
Teams = {
	free = 0,
	axis = 1,
	allies = 2,
	spectator = 3
}
TeamLogos = {
	axis = "icon_faction_sdf_bw",
	allies = "icon_faction_unsa_bw"
}
MissionTeams = {
	Wolverines = 0,
	OrionInitiative = 1,
	SaberTeamSeven = 2,
	Wraith = 3,
	BloodAnvil = 4
}
otherTeamLookup = {
	2,
	1
}
spectatorFakeTeam = 2
font_smallFont = FONTS.MainCondensed.File
font_normalFont = FONTS.MainMedium.File
font_bigFont = FONTS.MainMedium.File
font_extraBigFont = FONTS.MainExtended.File
font_boldFont = FONTS.MainBold.File
font_objectiveFont = FONTS.MainBold.File
font_hudIW6SmallFont = FONTS.MainBold.File
font_hudIW6NormalFont = FONTS.MainBold.File
font_hudIW6BigFont = FONTS.MainBold.File
font_hudEuroSmallFont = FONTS.MainCondensed.File
font_hudEuroNormalFont = FONTS.MainMedium.File
font_hudEuroBigFont = FONTS.MainMedium.File
font_hudDigitalFont20 = "fonts/iw6_digital.ttf"
font_hudDigitalFont25 = "fonts/iw6_digital.ttf"
font_hudDigitalFont30 = "fonts/iw6_digital.ttf"
font_hudDigitalFont40 = "fonts/iw6_digital.ttf"
odayaka = 0
if Engine.GetCurrentLanguage() == 10 then
	odayaka = 0
end
CoD = {
	TextSettings = {
		BuildNumberTinyFont = {
			Height = 10 + odayaka,
			Font = RegisterFont( font_smallFont, 10 + odayaka )
		},
		TinyFont = {
			Height = 15 + odayaka,
			Font = RegisterFont( font_smallFont, 15 + odayaka )
		},
		ButtonHelperFont = {
			Height = 16 + odayaka,
			Font = RegisterFont( font_boldFont, 16 + odayaka )
		},
		SmallFont = {
			Height = 21 + odayaka,
			Font = RegisterFont( font_normalFont, 21 + odayaka )
		},
		NormalFont = {
			Height = 21 + odayaka,
			Font = RegisterFont( font_normalFont, 21 + odayaka )
		},
		BigFont = {
			Height = 28 + odayaka,
			Font = RegisterFont( font_bigFont, 28 + odayaka ),
			MaxHeight = 50
		},
		ExtraBigFont = {
			Height = 28 + odayaka,
			Font = RegisterFont( font_extraBigFont, 28 + odayaka )
		},
		BoldFont = {
			Height = 21 + odayaka,
			Font = RegisterFont( font_boldFont, 21 + odayaka )
		},
		HudIW6TinyFont = {
			Height = 15,
			Font = RegisterFont( font_hudIW6SmallFont, 15 )
		},
		HudIW6SmallFont = {
			Height = 20,
			Font = RegisterFont( font_hudIW6SmallFont, 20 )
		},
		HudIW6NormalFont = {
			Height = 25,
			Font = RegisterFont( font_hudIW6NormalFont, 25 )
		},
		HudIW6BigFont = {
			Height = 30,
			Font = RegisterFont( font_hudIW6BigFont, 30 )
		},
		HudIW6ExtraBigFont = {
			Height = 40,
			Font = RegisterFont( font_hudIW6BigFont, 40 )
		},
		HudEuroConRegTinyFont = {
			Height = 15,
			Font = RegisterFont( font_hudEuroSmallFont, 15 )
		},
		HudEuroMedTinyFont = {
			Height = 15,
			Font = RegisterFont( font_hudEuroNormalFont, 15 )
		},
		HudEuroConRegSmallFont = {
			Height = 20,
			Font = RegisterFont( font_hudEuroSmallFont, 20 )
		},
		HudEuroMedSmallFont = {
			Height = 20,
			Font = RegisterFont( font_hudEuroNormalFont, 20 )
		},
		HudEuroNormalFont = {
			Height = 25,
			Font = RegisterFont( font_hudEuroNormalFont, 25 )
		},
		HudEuroBigFont = {
			Height = 30,
			Font = RegisterFont( font_hudEuroBigFont, 30 )
		},
		HudEuroExtraBigFont = {
			Height = 60,
			Font = RegisterFont( font_hudEuroBigFont, 60 )
		},
		HudDigitalSmallFont = {
			Height = 20,
			Font = RegisterFont( font_hudDigitalFont20, 20 )
		},
		HudDigitalNormalFont = {
			Height = 26,
			Font = RegisterFont( font_hudDigitalFont25, 26 )
		},
		HudDigitalBigFont = {
			Height = 30,
			Font = RegisterFont( font_hudDigitalFont30, 30 )
		},
		HudDigitalExtraBigFont = {
			Height = 40,
			Font = RegisterFont( font_hudDigitalFont40, 40 )
		}
	},
	TextStyle = {
		None = 0,
		Shadowed = 3,
		ShadowedMore = 6,
		Outlined = 7,
		OutlinedMore = 8,
		ForceUpperCase = 9,
		ForceLowerCase = 10,
		Chyron = 11,
		Decode = 11
	},
	PlayMode = {
		None = 0,
		SP = 1,
		Core = 2,
		Aliens = 3,
		Count = 4
	},
	WEAPON_CLASSES = {
		rifle = 0,
		sniper = 1,
		mg = 2,
		smg = 3,
		spread = 4,
		pistol = 5,
		grenade = 6,
		rocketLauncher = 7,
		turret = 8,
		throwingKnife = 9,
		nonPlayer = 10,
		item = 11,
		beam = 12,
		none = 13
	},
	Ownerdraw = {
		CGSpectatorControls = 61,
		CGChangeZoomHint = 70,
		CGHoldBreathHint = 71,
		CGToggleThermalHint = 76,
		CGToggleHybridHint = 77,
		CGMantleHint = 80,
		CGMissionObjectiveHeader = 99,
		CGMissionObjectiveList = 100,
		CGLowHealthOverlay = 112,
		CGInvalidCmdHint = 113,
		CGVehicleReticle = 200,
		CGHudTargetsVehicle = 201,
		UILoadProfiling = 364,
		UIRecordLevel = 365,
		UIIOTD = 387
	},
	OwnerdrawAlignment = {
		None = 0,
		TextTopLeft = 1,
		TextCenter = 2,
		TextTopCenter = 5
	}
}
if Engine.InFrontend() then
	CoD.Music = {
		MainSPMusic = "music_mainmenu",
		MainMPMusic = "music_mainmenu_mp",
		MainCPMusic = "music_mainmenu_cp_main"
	}
end
CoD.SFX = {
	OtherAdjust = "ui_other_adjust",
	MouseOver = "ui_hilite",
	MouseClick = "ui_select_confirm",
	SelectBack = "ui_select_back",
	AdjustSafeArea = "ui_screen_adjust",
	DenyAdjustSafeArea = "ui_screen_edge_deny",
	MPLobbyPlayerJoin = "ui_mp_player_join_lobby",
	MPLobbyPlayerExit = "ui_mp_player_leave_lobby",
	ChangeScreen = "ui_screen_change",
	AdjustSlider = "ui_slide_adjust",
	CharacterSlide = "ui_character_slide",
	SPMinimap = "ui_sp_minimap",
	SubMenuMouseOver = "ui_hilite_submenu",
	CacSelectAbility = "ui_mp_ability_select",
	CacDeselectAbility = "ui_mp_ability_deselect",
	CacSelectStrikePackage = "ui_mp_package_select",
	CacDeselectStrikePackage = "ui_mp_package_deselect",
	CacSpendPoints = "ui_points_spent",
	DenySelect = "ui_select_deny",
	UIKinectCommandGood = "ui_kinect_command_good",
	UIKinectCommandBad = "ui_kinect_command_bad",
	CacSetAILoadout = "ui_mp_ability_select",
	RestrictClass = "ui_select_confirm",
	XPTick = "mp_experience_tick",
	MissionTeamMouseOver = "ui_iw7_mission_team_hilite"
}
CoD.KeyboardInputTypes = {
	Normal = 0,
	Email = 1,
	Password = 2
}
CoD.KeyboardResult = {
	UI_KEYBOARD_RESULT_OK = 0,
	UI_KEYBOARD_RESULT_PROFANITY = 1,
	UI_KEYBOARD_RESULT_INVALID_STRING = 2,
	UI_KEYBOARD_RESULT_CANCELLED = 3,
	UI_KEYBOARD_RESULT_ERROR = 4
}
if Engine.InFrontend() then
	CoD.AntiCheat = {
		Ban = {
			FEATURE_BAN_MP_LIVE = 1,
			FEATURE_BAN_MP_CUSTOM = 2,
			FEATURE_BAN_MP_LEADERBOARDS = 3,
			FEATURE_BAN_MP_PRESTIGE = 4,
			FEATURE_BAN_MP_PRESTIGE_EXTRAS = 5,
			FEATURE_BAN_CP_LIVE = 6,
			FEATURE_BAN_CP_CUSTOM = 7,
			FEATURE_BAN_CP_LEADERBOARDS = 8,
			FEATURE_BAN_UGC_EMBLEMS = 9,
			FEATURE_BAN_UGC_PAINTJOBS = 10,
			FEATURE_BAN_UGC_HELMETS = 11,
			FEATURE_BAN_GLOBAL_HOSTING = 12,
			FEATURE_BAN_GLOBAL_FIND_DEDI = 13,
			FEATURE_BAN_GLOBAL_ALLOCATE_DEDI = 14,
			FEATURE_BAN_GLOBAL_SPLITSCREEN = 15,
			FEATURE_BAN_GLOBAL_CLAN_TAG = 16,
			FEATURE_BAN_GLOBAL_VOICE_CHAT = 17,
			FEATURE_BAN_GLOBAL_LIVESTREAMING = 18
		}
	}
end
CoD.RequiredDLCError = {
	COMPATIBILITY_ERROR_NONE = 0,
	COMPATIBILITY_ERROR_DISK_FULL = 1,
	COMPATIBILITY_ERROR_CORRUPTED = 2,
	COMPATIBILITY_ERROR_CANCELED = 3,
	COMPATIBILITY_ERROR_UNKNOWN = 4
}
CoD.CompassType = {
	Partial = 0,
	Full = 1
}
GenericFooterDims = {
	Height = 26,
	BuildNumberHeight = 35,
	TopMargin_WithBackground = -65,
	TopMargin_WithoutBackground = -48
}
GenericButtonDims = {
	button_height = 27,
	button_width = 500,
	pad_button_width = 35
}
ButtonMap = {
	button_primary = {
		string = "LUA_MENU_PAD_PRIMARY_BUTTON",
		raw_button = "primary"
	},
	button_secondary = {
		string = "LUA_MENU_PAD_SECONDARY_BUTTON",
		raw_button = "secondary"
	},
	button_alt1 = {
		string = "LUA_MENU_PAD_ALT1_BUTTON",
		raw_button = "alt1"
	},
	button_alt2 = {
		string = "LUA_MENU_PAD_ALT2_BUTTON",
		raw_button = "alt2"
	},
	button_right_trigger = {
		string = "LUA_MENU_PAD_RIGHT_TRIGGER_BUTTON",
		raw_button = "right_trigger"
	},
	button_left_trigger = {
		string = "LUA_MENU_PAD_LEFT_TRIGGER_BUTTON",
		raw_button = "left_trigger"
	},
	button_shoulderr = {
		string = "LUA_MENU_PAD_RIGHT_SHOULDER_BUTTON",
		raw_button = "shoulderr"
	},
	button_shoulderl = {
		string = "LUA_MENU_PAD_LEFT_SHOULDER_BUTTON",
		raw_button = "shoulderl"
	},
	button_select = {
		string = "LUA_MENU_PAD_BACK_BUTTON",
		raw_button = "select"
	},
	button_start = {
		string = "LUA_MENU_PAD_START_BUTTON",
		raw_button = "start"
	},
	button_dpad_up = {
		string = "LUA_MENU_PAD_DPAD_UP_BUTTON",
		raw_button = "dpad_up"
	},
	button_dpad_down = {
		string = "LUA_MENU_PAD_DPAD_DOWN_BUTTON",
		raw_button = "dpad_down"
	},
	button_dpad_left = {
		string = "LUA_MENU_PAD_DPAD_LEFT_BUTTON",
		raw_button = "dpad_left"
	},
	button_dpad_right = {
		string = "LUA_MENU_PAD_DPAD_RIGHT_BUTTON",
		raw_button = "dpad_right"
	},
	button_l3 = {
		string = "LUA_MENU_PAD_L3_BUTTON",
		raw_button = "l3"
	},
	button_r3 = {
		string = "LUA_MENU_PAD_R3_BUTTON",
		raw_button = "r3"
	},
	button_page_up = {
		string = "PLATFORM_KB_PAGE_UP_BUTTON",
		raw_button = "page_up"
	},
	button_page_down = {
		string = "PLATFORM_KB_PAGE_DOWN_BUTTON",
		raw_button = "page_down"
	},
	button_home = {
		string = "PLATFORM_KB_HOME_BUTTON",
		raw_button = "home"
	},
	button_ins = {
		string = "PLATFORM_KB_INS_BUTTON",
		raw_button = "ins"
	},
	button_del = {
		string = "PLATFORM_KB_DEL_BUTTON",
		raw_button = "del"
	},
	button_stickr_updown = {
		string = "PLATFORM_RIGHT_STICK",
		raw_button = "stickr"
	},
	button_stickl_updown = {
		string = "PLATFORM_LEFT_STICK",
		raw_button = "stickl"
	},
	button_stickr_updown_noswap = {
		string = "PLATFORM_RIGHT_STICK_NOSWAP",
		raw_button = "stickr"
	},
	button_stickl_updown_noswap = {
		string = "PLATFORM_LEFT_STICK_NOSWAP",
		raw_button = "stickl"
	},
	button_left_stick = {
		string = "LUA_MENU_PAD_L3_BUTTON",
		raw_button = "left_stick"
	}
}
ButtonQualifiers = {
	Gamepad = "gamepad",
	DPad = "dpad",
	Keyboard = "keyboard",
	Mousewheel = "mousewheel"
}
MPConfig = {
	default_dvars = "exec dvar_defaults.cfg",
	default_xboxlive = "exec default_xboxlive.cfg",
	default_splitscreen = "exec default_splitscreen_mp.cfg",
	default_systemlink = "exec default_systemlink_mp.cfg"
}
CPConfig = {
	default_dvars = "exec dvar_defaults.cfg",
	default_xboxlive = "exec default_xboxlive.cfg",
	default_splitscreen = "exec default_splitscreen_cp.cfg",
	default_systemlink = "exec default_systemlink_cp.cfg",
	default_aliens = "exec default_aliens.cfg"
}
FocusType = {
	MenuFlow = 0,
	MouseOver = 1,
	ListSelection = 2,
	Gamepad = 3
}
DvarTypeTable = {
	DvarBool = 0,
	DvarFloat = 1,
	DvarInt = 5,
	DvarEnum = 6,
	DvarString = 7
}
SliderBounds = {
	Brightness = {
		Min = -0.4,
		Max = 0.2,
		Step = 0.01,
		PCStep = 0.01
	},
	PCBrightness = {
		Min = -0.4,
		Max = 0.2,
		Step = -0.01
	},
	HorzMargin = {
		Min = 0.9,
		Max = 1,
		Step = 0
	},
	MouseSensitivity = {
		Min = 0.01,
		Max = 30,
		DividedRangeValue = 1,
		DividedRangeFraction = 0.3,
		Step = 0.05,
		DividedRangeStep = 0.05
	},
	VertMargin = {
		Min = 0.9,
		Max = 1,
		Step = 0
	},
	Volume = {
		Min = 0,
		Max = 1,
		Step = 0.02,
		PCStep = 0.01
	},
	VoiceRecord = {
		Min = 0,
		Max = 65535,
		Step = 655
	},
	VoiceThreshold = {
		Min = 0,
		Max = 65535,
		Step = 655
	},
	FOVUserScale = {
		Min = 0.8,
		Max = 1.5,
		Step = 0.01
	},
	FilmGrainAtten = {
		Min = 0,
		Max = 1,
		Step = 0.1,
		PCStep = 0
	},
	SMAAFilmicStrength = {
		Min = 0,
		Max = 1,
		Step = 0
	}
}
MousePitchTable = {
	PitchFloat = 0.02
}
ActiveMenus = {
	None = 0,
	Main = 1,
	InGame = 2,
	PreGame = 3,
	PostGame = 4
}
CoD.SetMaterial = function ( f2_arg0, f2_arg1, f2_arg2, f2_arg3 )
	if f2_arg2 == nil then
		f2_arg2 = 1
	end
	if f2_arg3 == nil then
		f2_arg3 = 0
	end
	f2_arg0:registerAnimationState( "changeMaterial", {
		material = f2_arg1,
		alpha = f2_arg2
	} )
	f2_arg0:animateToState( "changeMaterial", f2_arg3 )
end

CoD.UsingController = function ()
	local f3_local0 = Engine.IsConsoleGame()
	if not f3_local0 then
		if Engine.IsConsoleGame() or Engine.IsGamepadEnabled() ~= 1 then
			f3_local0 = false
		else
			f3_local0 = true
		end
	end
	return f3_local0
end

CoD.currentGameMode = nil
CoD.UpdateGameMode = function ( f4_arg0, f4_arg1 )
	CSV.UpdateCSVsByGameMode( f4_arg0 )
	if Engine.InFrontend() then
		UpdateDataSourcesByMode( f4_arg0, f4_arg1 )
	end
	Cac.NumAttachments = Engine.IsSingleplayer() and 3 or 6
	CoD.currentGameMode = f4_arg0
end

CoD.GetCurrentGameMode = function ()
	return CoD.currentGameMode
end

CoD.remoteKillstreakWeaponTable = {
	killstreak_ac130_mp = true,
	ac130_105mm_mp = true,
	ac130_40mm_mp = true,
	ac130_25mm_mp = true,
	killstreak_remote_tank_laptop_mp = true,
	killstreak_remote_tank_remote_mp = true,
	killstreak_helicopter_minigun_mp = true,
	killstreak_predator_missile_mp = true,
	heli_remote_mp = true,
	killstreak_remote_turret_remote_mp = true,
	killstreak_remote_turret_laptop_mp = true,
	mortar_remote_mp = true,
	mortar_remote_zoom_mp = true,
	uav_remote_mp = true,
	killstreak_precision_airstrike_mp = true,
	killstreak_heli_pilot_mp = true,
	killstreak_odin_support_mp = true,
	killstreak_odin_assault_mp = true,
	killstreak_level_event_laptop_mp = true,
	killstreak_vanguard_mp = true,
	killstreak_orbital_deployment_mp = true,
	killstreak_fleet_swarm_mp = true,
	killstreak_thor_mp = true,
	killstreak_minijackal_mp = true,
	killstreak_spiderbot_mp = true
}
CoD.UsingKillstreakRemote = function ()
	return CoD.remoteKillstreakWeaponTable[Game.GetPlayerWeaponName()]
end

CoD.ColorizeState = function ( f7_arg0, f7_arg1 )
	if not f7_arg1 then
		f7_arg1 = {}
	end
	if not f7_arg0 then
		DebugPrint( "Warning: Calling CoD.ColorizeState without specifying a color" )
		return f7_arg1
	end
	f7_arg1.red = f7_arg0.r
	f7_arg1.green = f7_arg0.g
	f7_arg1.blue = f7_arg0.b
	local f7_local0 = f7_arg0.a
	if not f7_local0 then
		f7_local0 = f7_arg1.alpha or 1
	end
	f7_arg1.alpha = f7_local0
	return f7_arg1
end

CoD.UseColorblindColors = function ()
	SWATCHES.HUD.friendlyTeam = SWATCHES.HUD.colorblindFriendlyTeam
	SWATCHES.HUD.enemyTeam = SWATCHES.HUD.colorblindEnemyTeam
end

CoD.GetWorldBlur = function ()
	local self = LUI.UIElement.new( {
		worldBlur = 5
	} )
	self:setupWorldBlur()
	self.id = "blur"
	return self
end

CoD.PrintModuleLoad = function ( f10_arg0 )
	
end

CoD.StatsGroup = {
	Ranked = 0,
	Coop = 1,
	Common = 2,
	RankedLoadouts = 3,
	PrivateLoadouts = 4
}
CoD.ProgressionBlob = {
	Gold = 0,
	TU1 = 1
}
CoD.FenceChannel = {
	Default = 0
}
CoD.FenceErrorCodes = {
	Ownership = 0,
	Installation = 1
}
if f0_local0 then
	local f0_local2 = profile.beginuserevent
	local f0_local3 = profile.enduserevent
	profile.beginuserevent = function ( f11_arg0 )
		if type( f11_arg0 ) ~= "number" then
			f11_arg0 = profile.lookupusereventid( f11_arg0 ) or profile.createuserevent( f11_arg0, "duration" )
		end
		f0_local2( f11_arg0 )
		return f11_arg0
	end
	
	profile.enduserevent = function ( f12_arg0 )
		if type( f12_arg0 ) ~= "number" then
			f12_arg0 = profile.lookupusereventid( f12_arg0 )
		end
		f0_local3( f12_arg0 )
	end
	
else
	profile.beginuserevent = function ()
		
	end
	
	profile.enduserevent = function ()
		
	end
	
	profile.createuserevent = function ()
		
	end
	
	profile.lookupusereventid = function ()
		
	end
	
end
if f0_local1 then
	function run_gc( f17_arg0 )
		local f17_local0
		if f17_arg0 then
			f17_local0 = " (" .. f17_arg0 .. ")"
			if not f17_local0 then
			
			else
				local f17_local1 = collectgarbage( "count" )
				collectgarbage( "collect" )
				local f17_local2 = collectgarbage( "count" )
				DebugPrint( "LUI - Ran GC cycle, cleared " .. f17_local1 - f17_local2 .. "kb. " .. f17_local2 .. "kb remaining." .. f17_local0 )
			end
		end
		f17_local0 = ""
	end
	
else
	function run_gc()
		collectgarbage( "collect" )
	end
	
end
function hashset( f19_arg0 )
	local f19_local0 = {}
	for f19_local4, f19_local5 in pairs( f19_arg0 ) do
		f19_local0[f19_local5] = true
	end
	return f19_local0
end

function bit( f20_arg0 )
	return 2 ^ (f20_arg0 - 1)
end

function hasbit( f21_arg0, f21_arg1 )
	return f21_arg1 <= f21_arg0 % (f21_arg1 + f21_arg1)
end

function setbit( f22_arg0, f22_arg1 )
	if hasbit( f22_arg0, f22_arg1 ) then
		local f22_local0 = f22_arg0
	end
	return f22_local0 or f22_arg0 + f22_arg1
end

function clearbit( f23_arg0, f23_arg1 )
	return hasbit( f23_arg0, f23_arg1 ) and f23_arg0 - f23_arg1 or f23_arg0
end

function BitShiftLeft( f24_arg0, f24_arg1 )
	return f24_arg0 * 2 ^ f24_arg1
end

function BitShiftRight( f25_arg0, f25_arg1 )
	return f25_arg0 / 2 ^ f25_arg1
end

function IsCurrentSticksLayoutSouthpaw()
	return Engine.GetProfileData( "gpadSticksConfig" ) == "thumbstick_southpaw"
end

function IsCurrentSticksLayoutLegacy()
	return Engine.GetProfileData( "gpadSticksConfig" ) == "thumbstick_legacy"
end

function IsCurrentSticksLayoutLegacySouthpaw()
	return Engine.GetProfileData( "gpadSticksConfig" ) == "thumbstick_legacysouthpaw"
end

CoD.CreateState = function ( f29_arg0, f29_arg1, f29_arg2, f29_arg3, f29_arg4 )
	return {
		left = f29_arg0,
		top = f29_arg1,
		right = f29_arg2,
		bottom = f29_arg3,
		leftAnchor = f29_arg4.leftAnchor,
		topAnchor = f29_arg4.topAnchor,
		rightAnchor = f29_arg4.rightAnchor,
		bottomAnchor = f29_arg4.bottomAnchor
	}
end

CoD.GradientMap = function ( f30_arg0, f30_arg1 )
	assert( f30_arg0 and #f30_arg0 >= 2 )
	local f30_local0 = assert
	local f30_local1
	if f30_arg0[1].threshold ~= 0 or f30_arg0[#f30_arg0].threshold ~= 1 then
		f30_local1 = false
	else
		f30_local1 = true
	end
	f30_local0( f30_local1 )
	if f30_arg1 <= 0 then
		return f30_arg0[1].color
	elseif f30_arg1 >= 1 then
		return f30_arg0[#f30_arg0].color
	end
	f30_local0 = f30_arg0[1]
	f30_local1 = f30_arg0[1]
	for f30_local6, f30_local7 in ipairs( f30_arg0 ) do
		if f30_arg1 < f30_local7.threshold then
			local f30_local5 = (f30_arg1 - f30_local0.threshold) / (f30_local7.threshold - f30_local0.threshold)
			return {
				r = f30_local5 * f30_local7.color.r + (1 - f30_local5) * f30_local0.color.r,
				g = f30_local5 * f30_local7.color.g + (1 - f30_local5) * f30_local0.color.g,
				b = f30_local5 * f30_local7.color.b + (1 - f30_local5) * f30_local0.color.b
			}
		end
		f30_local0 = f30_local7
	end
	return f30_arg0[#f30_arg0].color
end

CoD.AnchorTypes = {
	All = {
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true
	},
	None = {
		leftAnchor = false,
		topAnchor = false,
		rightAnchor = false,
		bottomAnchor = false
	},
	Top = {
		leftAnchor = false,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = false
	},
	TopLeft = {
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = false
	},
	TopRight = {
		leftAnchor = false,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = false
	},
	TopLeftRight = {
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = false
	},
	Bottom = {
		leftAnchor = false,
		topAnchor = false,
		rightAnchor = false,
		bottomAnchor = true
	},
	BottomLeft = {
		leftAnchor = true,
		topAnchor = false,
		rightAnchor = false,
		bottomAnchor = true
	},
	BottomRight = {
		leftAnchor = false,
		topAnchor = false,
		rightAnchor = true,
		bottomAnchor = true
	},
	BottomLeftRight = {
		leftAnchor = true,
		topAnchor = false,
		rightAnchor = true,
		bottomAnchor = true
	},
	TopBottomLeft = {
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = true
	},
	TopBottomRight = {
		leftAnchor = false,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true
	},
	Left = {
		leftAnchor = true,
		topAnchor = false,
		rightAnchor = false,
		bottomAnchor = false
	},
	Right = {
		leftAnchor = false,
		topAnchor = false,
		rightAnchor = true,
		bottomAnchor = false
	},
	LeftRight = {
		leftAnchor = true,
		topAnchor = false,
		rightAnchor = true,
		bottomAnchor = false
	}
}
CoD.FormatInfectedTime = function ( f31_arg0, f31_arg1 )
	local f31_local0 = Engine.Localize( "@LUA_MENU_S_FOR_SECONDS" )
	local f31_local1 = Engine.Localize( "@LUA_MENU_M_FOR_MINUTES" )
	local f31_local2 = math.floor( f31_arg0 / 60 )
	local f31_local3 = ""
	if not f31_arg1 then
		if f31_local2 < 1 then
			f31_local3 = f31_arg0 .. f31_local0
		else
			f31_local3 = f31_local2 .. f31_local1
			if f31_local2 >= 16 then
				f31_local3 = max_text
			end
		end
	else
		f31_arg0 = f31_arg0 - f31_local2 * 60
		if f31_arg0 >= 10 then
			f31_local3 = f31_local2 .. ":" .. f31_arg0
		else
			f31_local3 = f31_local2 .. ":0" .. f31_arg0
		end
	end
	return f31_local3
end

function IsLocalPlay()
	local f32_local0
	if Engine.GetDvarBool( "splitscreen" ) == true then
		f32_local0 = not IsOnlineMatch()
	else
		f32_local0 = false
	end
	return f32_local0
end

function IsOnlineMatch()
	return Engine.GetDvarBool( "onlinegame" ) == true
end

function IsPrivateMatch()
	if Engine.GetDvarBool( "onlinegame" ) == true and Engine.GetDvarBool( "xblive_privatematch" ) == true then
		return true
	else
		return false
	end
end

function IsPublicMatch()
	if Engine.GetDvarBool( "onlinegame" ) == true and Engine.GetDvarBool( "xblive_privatematch" ) == false then
		return true
	else
		return false
	end
end

function IsMlgGameBattlesMatch()
	return Engine.GetDvarBool( "cg_mlg_gamebattles_match" ) == true
end

function IsSystemLink()
	return Engine.GetDvarBool( "systemlink" ) == true
end

function isAliensSolo()
	return Engine.GetDvarBool( "xblive_privatematch" ) and Engine.IsAliensMode() and Engine.GetDvarBool( "xblive_privatematch_solo" )
end

CoD.IsUsingAspectRatio = function ( f39_arg0 )
	return math.abs( f39_arg0 - Engine.GetAspectRatio() ) < 0.01
end

CoD.GetAdjustedCurrency = function ( f40_arg0 )
	return math.floor( f40_arg0 / 100 )
end

CoD.GetPercentToNextCurrency = function ( f41_arg0 )
	return f41_arg0 % 100 / 100
end

CoD.GetRankedPlayerDataDataSource = function ()
	if Engine.IsCoreMode() then
		return LUI.DataSourceFromPlayerData.new( CoD.StatsGroup.Ranked, CoD.PlayMode.Core )
	elseif Engine.IsAliensMode() then
		return LUI.DataSourceFromPlayerData.new( CoD.StatsGroup.Coop, CoD.PlayMode.Aliens )
	else
		assert( false, "Tried to get player data for a mode which doesn't support it." )
	end
end

CoD.GetCommonPlayerDataDataSource = function ()
	if Engine.IsCoreMode() then
		return LUI.DataSourceFromPlayerData.new( CoD.StatsGroup.Common, CoD.PlayMode.Core )
	elseif Engine.IsAliensMode() then
		return LUI.DataSourceFromPlayerData.new( CoD.StatsGroup.Common, CoD.PlayMode.Aliens )
	else
		assert( false, "Tried to get player data for a mode which doesn't support it." )
	end
end

CoD.GetPrivateLoadoutDataSource = function ()
	return LUI.DataSourceFromPlayerData.new( CoD.StatsGroup.PrivateLoadouts, CoD.PlayMode.Core )
end

CoD.GetBreadcrumbCreateAClass = function ()
	local f45_local0 = ""
	if IsSystemLink() then
		f45_local0 = ToUpperCase( Engine.Localize( "LUA_MENU_BREADCRUMB_2_ITEMS", "EXE_LOCAL_PLAY", "MENU_MULTIPLAYER" ) )
	elseif not IsPrivateMatch() then
		f45_local0 = ToUpperCase( Engine.Localize( "LUA_MENU_BREADCRUMB_2_ITEMS", "MENU_MULTIPLAYER", "LUA_MENU_PUBLIC_MATCH_CAPS" ) )
	elseif IsMlgGameBattlesMatch() then
		f45_local0 = ToUpperCase( Engine.Localize( "LUA_MENU_BREADCRUMB_2_ITEMS", "MENU_MULTIPLAYER", "LUA_MENU_MLG_GAMEBATTLES_CAPS" ) )
	else
		f45_local0 = ToUpperCase( Engine.Localize( "LUA_MENU_BREADCRUMB_2_ITEMS", "MENU_MULTIPLAYER", "LUA_MENU_CUSTOM_GAME_CAPS" ) )
	end
	return f45_local0
end

CoD.GetBreadcrumb = function ()
	local f46_local0 = ""
	if IsPrivateMatch() then
		f46_local0 = ToUpperCase( Engine.Localize( "LUA_MENU_BREADCRUMB_2_ITEMS", "MENU_MULTIPLAYER", "LUA_MENU_CUSTOM_GAME_CAPS" ) )
	else
		f46_local0 = ToUpperCase( Engine.Localize( "LUA_MENU_BREADCRUMB_2_ITEMS", "EXE_LOCAL_PLAY", "MENU_MULTIPLAYER" ) )
	end
	return f46_local0
end

CoD.GameDVREnableCount = 0
CoD.GameDVREnable = function ()
	CoD.GameDVREnableCount = CoD.GameDVREnableCount - 1
	if CoD.GameDVREnableCount == 0 then
		Engine.GameDVRProhibitRecording( false )
		Engine.GameDVRProhibitScreenshots( false )
	end
end

CoD.GameDVRDisable = function ()
	Engine.GameDVRProhibitRecording( true )
	Engine.GameDVRProhibitScreenshots( true )
	CoD.GameDVREnableCount = CoD.GameDVREnableCount + 1
end

PreGameState = {
	DuckedAudio = false
}
PreGame = {
	BeginDuckAudio = function ()
		Engine.DuckAudio( true )
		PreGameState.DuckedAudio = true
	end,
	RemoveDuckAudioTemporarily = function ()
		if PreGameState.DuckedAudio then
			Engine.DuckAudio( false )
		end
	end,
	RestoreDuckAudio = function ()
		if PreGameState.DuckedAudio then
			Engine.DuckAudio( true )
		end
	end,
	EndDuckAudio = function ()
		if PreGameState.DuckedAudio then
			Engine.DuckAudio( false )
			PreGameState.DuckedAudio = false
		end
	end
}
