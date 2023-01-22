local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = {
	thumbstick_default = "MENU_DEFAULT",
	thumbstick_southpaw = "MENU_SOUTHPAW",
	thumbstick_legacy = "MENU_LEGACY",
	thumbstick_southpaw_ns = "MENU_SOUTHPAW_NS",
	thumbstick_legacysouthpaw_ns = "MENU_LEGACY_SOUTHPAW_NS"
}
f0_local1 = {
	DISABLED = 1,
	ENABLED = 2
}
f0_local2 = {
	"MENU_LOW",
	[3] = "MENU_MEDIUM",
	[7] = "MENU_HIGH",
	[13] = "MENU_VERY_HIGH",
	[20] = "MENU_INSANE"
}
function ValueToListIndex( f1_arg0, f1_arg1 )
	assert( #f1_arg0 > 0 )
	for f1_local3, f1_local4 in ipairs( f1_arg0 ) do
		if f1_arg1 == f1_local4 then
			return f1_local3
		end
	end
	DebugPrint( "Warning: Options Buttons trying to get a value from list that doesn't exist. ( " .. f1_arg1 .. ") Defaulting to 1" )
	return 1
end

local f0_local3 = function ( f2_arg0, f2_arg1 )
	Engine.ToggleInvertedPitch( f2_arg1 )
end

local f0_local4 = function ( f3_arg0, f3_arg1 )
	Engine.ToggleInvertedFlyPitch( f3_arg1 )
end

local f0_local5 = function ( f4_arg0, f4_arg1 )
	Engine.ToggleSprintCancelsReload( f4_arg1 )
end

local f0_local6 = function ( f5_arg0, f5_arg1 )
	Engine.ToggleRumble( f5_arg1 )
end

local f0_local7 = function ( f6_arg0, f6_arg1 )
	Engine.ToggleRenderColorBlind( f6_arg1 )
end

local f0_local8 = function ( f7_arg0, f7_arg1 )
	Engine.ToggleAutoAim( f7_arg1 )
end

local f0_local9 = function ( f8_arg0, f8_arg1 )
	Engine.ToggleTargetAssist( f8_arg1 )
end

local f0_local10 = function ( f9_arg0 )
	return function ( f10_arg0, f10_arg1 )
		Engine.SetDvarFloat( f9_arg0, f10_arg0 )
		Engine.MenuDvarsFinish( f10_arg1 )
	end
	
end

local f0_local11 = function ( f11_arg0, f11_arg1, f11_arg2 )
	return Mirror( f11_arg0, f11_arg1, f11_arg2 )
end

local f0_local12 = function ( f12_arg0 )
	return function ( f13_arg0, f13_arg1 )
		Engine.SetDvarFloat( "profileMenuOption_blacklevel", f0_local11( f13_arg0, SliderBounds.Brightness.Min, SliderBounds.Brightness.Max ) )
		Engine.MenuDvarsFinish( f13_arg1 )
		f12_arg0:dispatchEventToCurrentMenu( {
			name = "brightness_updated"
		} )
	end
	
end

local f0_local13 = function ( f14_arg0, f14_arg1 )
	Engine.SetDvarFloat( "r_filmGrainAtten", f14_arg0 )
	Engine.ExecNow( "profile_setFilmGrain " .. f14_arg0, f14_arg1 )
end

local f0_local14 = function ( f15_arg0, f15_arg1 )
	Engine.ExecNow( "profile_toggleMotionBlur " .. f15_arg0 - 1, f15_arg1 )
end

local f0_local15 = function ( f16_arg0, f16_arg1 )
	if f16_arg0 == 2 then
		f16_arg0 = 3
	end
	Engine.ExecNow( "profile_setSunShadowSplitscreen " .. f16_arg0 - 1, f16_arg1 )
end

local f0_local16 = function ( f17_arg0, f17_arg1, f17_arg2 )
	f17_arg0.vList:AllowScrolling()
	assert( f17_arg0.StickLayout )
	assert( f17_arg0.ButtonLayout )
	assert( f17_arg0.LookInversion )
	assert( f17_arg0.FlightInversion )
	assert( f17_arg0.SprintCancelsReload )
	assert( f17_arg0.Vibration )
	assert( f17_arg0.HorizontalSensitivity )
	assert( f17_arg0.VerticalSensitivity )
	if Engine.InFrontend() then
		assert( f17_arg0.Colorblind )
	end
	assert( f17_arg0.TargetAssist )
	if Engine.IsSingleplayer() or Engine.IsAliensMode() then
		assert( f17_arg0.AimAssist )
	end
	if Engine.IsMultiplayer() and Engine.IsActiveLocalClientPrimary( f17_arg1 ) and not CONDITIONS.IsSplitscreen() then
		assert( f17_arg0.MotionBlur )
	end
	local f17_local0 = Engine.GetProfileData( "gpadSticksConfig", f17_arg1 )
	f17_arg0.StickLayout.DynamicText:setText( Engine.Localize( f0_local0[f17_local0] and f0_local0[f17_local0] or "MENU_LEGACY_SOUTHPAW" ) )
	local f17_local1 = Engine.GetProfileData( "gpadButtonsConfig", f17_arg1 )
	f17_arg0.ButtonLayout.DynamicText:setText( Engine.Localize( OPTIONS.buttonLayoutStrings[f17_local1] and OPTIONS.buttonLayoutStrings[f17_local1] or "MENU_NOMAD_TACTICAL_ALT" ) )
	local f17_local2 = Engine.GetProfileData( "invertedPitch", f17_arg1 )
	local f17_local3 = {}
	local f17_local4 = {}
	local f17_local5 = Engine.Localize( "LUA_MENU_DISABLED" )
	local f17_local6 = Engine.Localize( "LUA_MENU_ENABLED" )
	f17_local3.labels = f17_local5
	f17_local3.action = f0_local3
	if f17_local2 then
		f17_local4 = f0_local1.ENABLED
		if not f17_local4 then
		
		else
			f17_local3.defaultValue = f17_local4
			f17_local3.wrapAround = true
			LUI.AddUIArrowTextButtonLogic( f17_arg0.LookInversion, f17_arg1, f17_local3 )
			f17_local4 = Engine.GetProfileData( "invertedFlyPitch", f17_arg1 )
			f17_local5 = {}
			f17_local6 = {}
			local f17_local7 = Engine.Localize( "LUA_MENU_DISABLED" )
			local f17_local8 = Engine.Localize( "LUA_MENU_ENABLED" )
			f17_local5.labels = f17_local7
			f17_local5.action = f0_local4
			if f17_local4 then
				f17_local6 = f0_local1.ENABLED
				if not f17_local6 then
				
				else
					f17_local5.defaultValue = f17_local6
					f17_local5.wrapAround = true
					LUI.AddUIArrowTextButtonLogic( f17_arg0.FlightInversion, f17_arg1, f17_local5 )
					f17_local6 = Engine.GetProfileData( "sprintCancelsReload", f17_arg1 )
					f17_local7 = {}
					f17_local8 = {}
					local f17_local9 = Engine.Localize( "LUA_MENU_DISABLED" )
					local f17_local10 = Engine.Localize( "LUA_MENU_ENABLED" )
					f17_local7.labels = f17_local9
					f17_local7.action = f0_local5
					if f17_local6 then
						f17_local8 = f0_local1.ENABLED
						if not f17_local8 then
						
						else
							f17_local7.defaultValue = f17_local8
							f17_local7.wrapAround = true
							LUI.AddUIArrowTextButtonLogic( f17_arg0.SprintCancelsReload, f17_arg1, f17_local7 )
							f17_local8 = Engine.GetProfileData( "rumble", f17_arg1 )
							f17_local9 = {}
							f17_local10 = {}
							local f17_local11 = Engine.Localize( "LUA_MENU_DISABLED" )
							local f17_local12 = Engine.Localize( "LUA_MENU_ENABLED" )
							f17_local9.labels = f17_local11
							f17_local9.action = f0_local6
							if f17_local8 then
								f17_local10 = f0_local1.ENABLED
								if not f17_local10 then
								
								else
									f17_local9.defaultValue = f17_local10
									f17_local9.wrapAround = true
									LUI.AddUIArrowTextButtonLogic( f17_arg0.Vibration, f17_arg1, f17_local9 )
									if Engine.InFrontend() then
										f17_local10 = Engine.GetProfileData( "renderColorBlind", f17_arg1 )
										f17_local11 = {}
										f17_local12 = {}
										local f17_local13 = Engine.Localize( "LUA_MENU_DISABLED" )
										local f17_local14 = Engine.Localize( "LUA_MENU_ENABLED" )
										f17_local11.labels = f17_local13
										f17_local11.action = f0_local7
										if f17_local10 then
											f17_local12 = f0_local1.ENABLED
											if not f17_local12 then
											
											else
												f17_local11.defaultValue = f17_local12
												f17_local11.wrapAround = true
												LUI.AddUIArrowTextButtonLogic( f17_arg0.Colorblind, f17_arg1, f17_local11 )
											end
										end
										f17_local12 = f0_local1.DISABLED
									end
									if Engine.IsSingleplayer() or Engine.IsAliensMode() then
										f17_local10 = Engine.GetProfileData( "autoAim", f17_arg1 )
										f17_local11 = {}
										f17_local12 = {}
										local f17_local13 = Engine.Localize( "LUA_MENU_DISABLED" )
										local f17_local14 = Engine.Localize( "LUA_MENU_ENABLED" )
										f17_local11.labels = f17_local13
										f17_local11.action = f0_local8
										if f17_local10 then
											f17_local12 = f0_local1.ENABLED
											if not f17_local12 then
											
											else
												f17_local11.defaultValue = f17_local12
												f17_local11.wrapAround = true
												LUI.AddUIArrowTextButtonLogic( f17_arg0.AimAssist, f17_arg1, f17_local11 )
											end
										end
										f17_local12 = f0_local1.DISABLED
									end
									f17_local10 = Engine.GetProfileData( "targetAssist", f17_arg1 )
									f17_local11 = {}
									f17_local12 = {}
									local f17_local13 = Engine.Localize( "LUA_MENU_DISABLED" )
									local f17_local14 = Engine.Localize( "LUA_MENU_ENABLED" )
									f17_local11.labels = f17_local13
									f17_local11.action = f0_local9
									if f17_local10 then
										f17_local12 = f0_local1.ENABLED
										if not f17_local12 then
										
										else
											f17_local11.defaultValue = f17_local12
											f17_local11.wrapAround = true
											LUI.AddUIArrowTextButtonLogic( f17_arg0.TargetAssist, f17_arg1, f17_local11 )
											f17_local12 = {}
											for f17_local13 = 1, 20, 1 do
												local f17_local16 = f0_local2[f17_local13]
												local f17_local17
												if f17_local16 then
													f17_local17 = Engine.Localize( f17_local16 ) .. " " .. f17_local13
													if not f17_local17 then
													
													else
														table.insert( f17_local12, f17_local17 )
													end
												end
												f17_local17 = tostring( f17_local13 )
											end
											LUI.AddUIArrowTextButtonLogic( f17_arg0.HorizontalSensitivity, f17_arg1, {
												labels = f17_local12,
												action = f0_local10( "profileMenuOption_horzsensitivity" ),
												defaultValue = Engine.GetDvarFloat( "profileMenuOption_horzsensitivity" ),
												wrapAround = false
											} )
											LUI.AddUIArrowTextButtonLogic( f17_arg0.VerticalSensitivity, f17_arg1, {
												labels = f17_local12,
												action = f0_local10( "profileMenuOption_vertsensitivity" ),
												defaultValue = Engine.GetDvarFloat( "profileMenuOption_vertsensitivity" ),
												wrapAround = false
											} )
											if not (not Engine.InFrontend() or not Engine.IsActiveLocalClientPrimary( f17_arg1 )) or Engine.IsActiveLocalClientPrimary( f17_arg1 ) then
												LUI.AddUIArrowFillBarButtonLogic( f17_arg0.Brightness, f17_arg1, {
													decimalPlacesToRound = 3,
													action = f0_local12( f17_arg0 ),
													defaultValue = LUI.clamp( f0_local11( Engine.GetDvarFloat( "profileMenuOption_blacklevel" ), SliderBounds.Brightness.Min, SliderBounds.Brightness.Max ), SliderBounds.Brightness.Min, SliderBounds.Brightness.Max ),
													wrapAround = false,
													max = SliderBounds.Brightness.Max,
													min = SliderBounds.Brightness.Min,
													step = SliderBounds.Brightness.Step,
													fillElement = f17_arg0.Brightness.GenericFillBar.Fill
												} )
											end
											if Engine.IsActiveLocalClientPrimary( f17_arg1 ) then
												assert( f17_arg0.FilmGrainAtten )
												assert( f17_arg0.FilmGrainAtten.GenericFillBar )
												assert( f17_arg0.FilmGrainAtten.GenericFillBar.Fill )
												LUI.AddUIArrowFillBarButtonLogic( f17_arg0.FilmGrainAtten, f17_arg1, {
													decimalPlacesToRound = 3,
													action = f0_local13,
													defaultValue = Engine.GetDvarFloat( "r_filmGrainAtten" ),
													wrapAround = false,
													max = SliderBounds.FilmGrainAtten.Max,
													min = SliderBounds.FilmGrainAtten.Min,
													step = SliderBounds.FilmGrainAtten.Step,
													fillElement = f17_arg0.FilmGrainAtten.GenericFillBar.Fill
												} )
											end
											if Engine.IsMultiplayer() and Engine.IsActiveLocalClientPrimary( f17_arg1 ) and not CONDITIONS.IsSplitscreen() then
												local f17_local16 = Engine.GetDvarBool( "r_mbEnableA" )
												local f17_local17 = {}
												local f17_local18 = {}
												local f17_local19 = Engine.Localize( "LUA_MENU_DISABLED" )
												local f17_local20 = Engine.Localize( "LUA_MENU_ENABLED" )
												f17_local17.labels = f17_local19
												f17_local17.action = f0_local14
												if f17_local16 then
													f17_local18 = f0_local1.ENABLED
													if not f17_local18 then
													
													else
														f17_local17.defaultValue = f17_local18
														f17_local17.wrapAround = true
														LUI.AddUIArrowTextButtonLogic( f17_arg0.MotionBlur, f17_arg1, f17_local17 )
													end
												end
												f17_local18 = f0_local1.DISABLED
											end
											if Engine.IsMultiplayer() and Engine.IsActiveLocalClientPrimary( f17_arg1 ) and CONDITIONS.IsSplitscreen() then
												assert( f17_arg0.SplitscreenShadows )
												local f17_local18 = math.min( ValueToListIndex( Engine.GetDvarEnumList( "sm_sunSplitscreen" ), Engine.GetDvarString( "sm_sunSplitscreen" ) ), 2 )
												local f17_local19 = {}
												local f17_local20 = {}
												local f17_local21 = Engine.Localize( "LUA_MENU_DISABLED" )
												local f17_local22 = Engine.Localize( "LUA_MENU_MP_SHADOW_ALL_OBJECTS" )
												f17_local19.labels = f17_local21
												f17_local19.action = f0_local15
												f17_local19.defaultValue = f17_local18
												f17_local19.wrapAround = true
												LUI.AddUIArrowTextButtonLogic( f17_arg0.SplitscreenShadows, f17_arg1, f17_local19 )
											end
										end
									end
									f17_local12 = f0_local1.DISABLED
								end
							end
							f17_local10 = f0_local1.DISABLED
						end
					end
					f17_local8 = f0_local1.DISABLED
				end
			end
			f17_local6 = f0_local1.DISABLED
		end
	end
	f17_local4 = f0_local1.DISABLED
end

function OptionsButtons( f18_arg0, f18_arg1 )
	local f18_local0, f18_local1, self = nil
	self = LUI.UIElement.new( {
		left = 0,
		right = 1100 * _1080p,
		top = 0,
		bottom = 705 * _1080p,
		leftAnchor = true,
		rightAnchor = false,
		topAnchor = true,
		bottomAnchor = false,
		spacing = 10 * _1080p
	} )
	self.id = "OptionsButtons"
	local f18_local3 = 40 * _1080p
	local f18_local4 = 40 * _1080p
	if CONDITIONS.IsThirdGameMode() then
		f18_local1 = {
			left = -f18_local3,
			right = 0,
			top = -f18_local4,
			bottom = 0,
			leftAnchor = true,
			rightAnchor = true,
			topAnchor = true,
			bottomAnchor = true
		}
		f18_local0 = {
			left = f18_local3,
			right = 816 * _1080p,
			top = f18_local4,
			bottom = 0,
			leftAnchor = true,
			rightAnchor = false,
			topAnchor = true,
			bottomAnchor = true,
			spacing = 10 * _1080p
		}
	else
		f18_local1 = {
			left = 0,
			right = 0,
			top = 0,
			bottom = 0,
			leftAnchor = true,
			rightAnchor = true,
			topAnchor = true,
			bottomAnchor = true
		}
		f18_local0 = {
			left = 0,
			right = 776 * _1080p,
			top = 0,
			bottom = 0,
			leftAnchor = true,
			rightAnchor = false,
			topAnchor = true,
			bottomAnchor = true,
			spacing = 10 * _1080p
		}
	end
	local f18_local5 = LUI.UIElement.new( f18_local1 )
	f18_local5.id = "OptionsButtonsStencil"
	f18_local5:setUseStencil( true )
	if not CONDITIONS.IsSplitscreen() then
		if CONDITIONS.IsThirdGameMode() then
			f18_local5:SetAnchorsAndPosition( 0, 1, 0, 1, -f18_local3, _1080p * 850, -f18_local4, _1080p * 711 )
		else
			f18_local5:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 850, 0, _1080p * 711 )
		end
	else
		if CONDITIONS.IsThirdGameMode() then
			f18_local5:SetLeft( -f18_local3 )
		end
		f18_local5:SetRight( _1080p * 850 )
	end
	self:addElement( f18_local5 )
	self.vList = LUI.UIVerticalList.new( f18_local0 )
	self.vList.id = "OptionsButtonsList"
	f18_local5:addElement( self.vList )
	self._animationSets = {}
	self._sequences = {}
	local f18_local6 = f18_arg1 or {}
	local f18_local7 = f18_local6.controllerIndex
	local f18_local8 = MenuBuilder.BuildRegisteredType( "GenericDualLabelButton", {
		controllerIndex = f18_local7
	} )
	f18_local8.id = "StickLayout"
	f18_local8:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 30, 0 )
	f18_local8.buttonDescription = Engine.Localize( "PLATFORM_OPTIONS_STICK_LAYOUT_DESC" )
	f18_local8.Text:setText( ToUpperCase( Engine.Localize( "MENU_STICK_LAYOUT_CAP" ) ), 0 )
	f18_local8.Text:SetAlignment( LUI.Alignment.Left )
	f18_local8:addEventHandler( "button_action", function ( f19_arg0, f19_arg1 )
		ACTIONS.OpenMenu( "StickLayout", true, f18_local7 )
	end )
	self.vList:addElement( f18_local8 )
	self.StickLayout = f18_local8
	local f18_local9 = MenuBuilder.BuildRegisteredType( "GenericDualLabelButton", {
		controllerIndex = f18_local7
	} )
	f18_local9.id = "ButtonLayout"
	f18_local9:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 30, 0 )
	f18_local9.buttonDescription = Engine.Localize( "PLATFORM_OPTIONS_BUTTON_LAYOUT_DESC" )
	f18_local9.Text:setText( ToUpperCase( Engine.Localize( "MENU_BUTTON_LAYOUT_CAPS" ) ), 0 )
	f18_local9.Text:SetAlignment( LUI.Alignment.Left )
	self.vList:addElement( f18_local9 )
	f18_local9:addEventHandler( "button_action", function ( f20_arg0, f20_arg1 )
		ACTIONS.OpenMenu( "ButtonLayout", true, f18_local7 )
	end )
	self.ButtonLayout = f18_local9
	local f18_local10 = MenuBuilder.BuildRegisteredType( "GenericArrowButton", {
		controllerIndex = f18_local7
	} )
	f18_local10.id = "LookInversion"
	f18_local10:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 30, 0 )
	f18_local10.buttonDescription = Engine.Localize( "PLATFORM_OPTIONS_LOOK_INVERSION_DESC" )
	f18_local10.Title:setText( ToUpperCase( Engine.Localize( "MENU_LOOK_INVERSION_CAPS" ) ), 0 )
	self.vList:addElement( f18_local10 )
	self.LookInversion = f18_local10
	local f18_local11 = MenuBuilder.BuildRegisteredType( "GenericArrowButton", {
		controllerIndex = f18_local7
	} )
	f18_local11.id = "FlightInversion"
	f18_local11:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 30, 0 )
	f18_local11.buttonDescription = Engine.Localize( "PLATFORM_OPTIONS_FLY_INVERSION_DESC" )
	f18_local11.Title:setText( ToUpperCase( Engine.Localize( "MENU_FLY_INVERSION_CAPS" ) ), 0 )
	if not Engine.IsAliensMode() then
		self.vList:addElement( f18_local11 )
	end
	self.FlightInversion = f18_local11
	local f18_local12 = MenuBuilder.BuildRegisteredType( "GenericArrowButton", {
		controllerIndex = f18_local7
	} )
	f18_local12.id = "SprintCancelsReload"
	f18_local12:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 30, 0 )
	f18_local12.buttonDescription = Engine.Localize( "PLATFORM_OPTIONS_SPRINT_CANCELS_RELOAD_DESC" )
	f18_local12.Title:setText( ToUpperCase( Engine.Localize( "MENU_SPRINT_CANCELS_RELOAD_CAPS" ) ), 0 )
	self.vList:addElement( f18_local12 )
	self.SprintCancelsReload = f18_local12
	local f18_local13 = MenuBuilder.BuildRegisteredType( "GenericArrowButton", {
		controllerIndex = f18_local7
	} )
	f18_local13.id = "Vibration"
	f18_local13:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 30, 0 )
	f18_local13.buttonDescription = Engine.Localize( "PLATFORM_OPTIONS_VIBRATION_DESC" )
	f18_local13.Title:setText( ToUpperCase( Engine.Localize( "PLATFORM_CONTROLLER_VIBRATION_CAPS" ) ), 0 )
	self.vList:addElement( f18_local13 )
	self.Vibration = f18_local13
	local f18_local14 = MenuBuilder.BuildRegisteredType( "GenericArrowButton", {
		controllerIndex = f18_local7
	} )
	f18_local14.id = "HorizontalSensitivity"
	f18_local14:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 30, 0 )
	f18_local14.buttonDescription = Engine.Localize( "PLATFORM_OPTIONS_HORZ_SENSITIVITY_DESC" )
	f18_local14.Title:setText( ToUpperCase( Engine.Localize( "MENU_LOOK_HORZ_SENSITIVITY_CAPS" ) ), 0 )
	self.vList:addElement( f18_local14 )
	self.HorizontalSensitivity = f18_local14
	local f18_local15 = MenuBuilder.BuildRegisteredType( "GenericArrowButton", {
		controllerIndex = f18_local7
	} )
	f18_local15.id = "VerticalSensitivity"
	f18_local15:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 30, 0 )
	f18_local15.buttonDescription = Engine.Localize( "PLATFORM_OPTIONS_VERT_SENSITIVITY_DESC" )
	f18_local15.Title:setText( ToUpperCase( Engine.Localize( "MENU_LOOK_VERT_SENSITIVITY_CAPS" ) ), 0 )
	self.vList:addElement( f18_local15 )
	self.VerticalSensitivity = f18_local15
	if (Engine.InFrontend() or not CONDITIONS.IsSplitscreen()) and Engine.IsActiveLocalClientPrimary( f18_local7 ) then
		local f18_local16 = MenuBuilder.BuildRegisteredType( "GenericButton", {
			controllerIndex = f18_local7
		} )
		f18_local16.id = "SafeArea"
		f18_local16:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 30, 0 )
		f18_local16.buttonDescription = Engine.Localize( "LUA_MENU_SAFE_AREA_DESC" )
		f18_local16.Text:setText( ToUpperCase( Engine.Localize( "LUA_MENU_SAFE_AREA_CAPS" ) ), 0 )
		f18_local16.Text:SetAlignment( LUI.Alignment.Left )
		if CONDITIONS.IsThirdGameMode() then
			f18_local16.GenericListButtonBackground:SetRight( -50 * _1080p )
		end
		self.vList:addElement( f18_local16 )
		f18_local16:addEventHandler( "button_action", function ( f21_arg0, f21_arg1 )
			LUI.FlowManager.RequestAddMenu( "boot_screen_margins", true, f18_local7, false, {
				fromFirstTimeFlow = false
			} )
		end )
		self.SafeArea = f18_local16
	end
	if Engine.IsActiveLocalClientPrimary( f18_local7 ) or Engine.IsPS4() then
		local f18_local16 = MenuBuilder.BuildRegisteredType( "GenericButton", {
			controllerIndex = f18_local7
		} )
		f18_local16.id = "AudioOptions"
		f18_local16:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 30, 0 )
		f18_local16.buttonDescription = Engine.Localize( "LUA_MENU_AUDIO_OPTIONS_DESC" )
		f18_local16.Text:setText( ToUpperCase( Engine.Localize( "LUA_MENU_AUDIO_OPTIONS_CAPS" ) ), 0 )
		f18_local16.Text:SetAlignment( LUI.Alignment.Left )
		if CONDITIONS.IsThirdGameMode() then
			f18_local16.GenericListButtonBackground:SetRight( -50 * _1080p )
		end
		self.vList:addElement( f18_local16 )
		f18_local16:addEventHandler( "button_action", function ( f22_arg0, f22_arg1 )
			LUI.FlowManager.RequestAddMenu( "AudioOptions", true, f18_local7, false )
		end )
		self.AudioOptions = f18_local16
	end
	if Engine.InFrontend() and Engine.IsActiveLocalClientPrimary( f18_local7 ) then
		local f18_local16 = MenuBuilder.BuildRegisteredType( "GenericButton", {
			controllerIndex = f18_local7
		} )
		f18_local16.id = "LanguageOptions"
		f18_local16:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 30, 0 )
		f18_local16.buttonDescription = Engine.Localize( "LANGUAGE_SELECT_BUTTON_TEXT_DESC" )
		f18_local16.Text:setText( ToUpperCase( Engine.Localize( "LANGUAGE_SELECT_BUTTON_TEXT" ) ), 0 )
		f18_local16.Text:SetAlignment( LUI.Alignment.Left )
		if CONDITIONS.IsThirdGameMode() then
			f18_local16.GenericListButtonBackground:SetRight( -50 * _1080p )
		end
		self.vList:addElement( f18_local16 )
		f18_local16:addEventHandler( "button_action", function ( f23_arg0, f23_arg1 )
			LUI.FlowManager.RequestAddMenu( "LanguageSelect", true, f18_local7, false )
		end )
		self.LanguageOptions = f18_local16
	end
	if not (not Engine.InFrontend() or not Engine.IsActiveLocalClientPrimary( f18_local7 )) or Engine.IsActiveLocalClientPrimary( f18_local7 ) then
		local f18_local16 = MenuBuilder.BuildRegisteredType( "GenericFillBarArrowButton", {
			controllerIndex = f18_local7
		} )
		f18_local16.id = "Brightness"
		f18_local16:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 30, 0 )
		f18_local16.buttonDescription = Engine.Localize( "MENU_BRIGHTNESS_DESC1" )
		f18_local16.Title:setText( ToUpperCase( Engine.Localize( "MENU_BRIGHTNESS" ) ), 0 )
		self.vList:addElement( f18_local16 )
		self.Brightness = f18_local16
	end
	if Engine.IsActiveLocalClientPrimary( f18_local7 ) then
		local f18_local16 = MenuBuilder.BuildRegisteredType( "GenericFillBarArrowButton", {
			controllerIndex = f18_local7
		} )
		f18_local16.id = "FilmGrainAtten"
		f18_local16:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 30, 0 )
		f18_local16.buttonDescription = Engine.Localize( "MENU_FILM_GRAIN_ATTEN_DESC" )
		f18_local16.Title:setText( ToUpperCase( Engine.Localize( "MENU_FILM_GRAIN_ATTEN" ) ), 0 )
		self.vList:addElement( f18_local16 )
		self.FilmGrainAtten = f18_local16
	end
	if Engine.IsDevelopmentBuild() then
		local f18_local16 = MenuBuilder.BuildRegisteredType( "GenericButton", {
			controllerIndex = f18_local7
		} )
		f18_local16.id = "Calibration"
		f18_local16:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 30, 0 )
		f18_local16.buttonDescription = "Developer screen calibration tool"
		f18_local16.Text:setText( ToUpperCase( "Screen Calibration" ), 0 )
		if CONDITIONS.IsThirdGameMode() then
			f18_local16.GenericListButtonBackground:SetRight( -50 * _1080p )
		end
		self.vList:addElement( f18_local16 )
		f18_local16:addEventHandler( "button_action", function ( f24_arg0, f24_arg1 )
			ACTIONS.OpenMenu( "CalibrationMenu", true, f18_local7 )
		end )
		self.Calibration = f18_local16
	end
	if Engine.InFrontend() then
		local f18_local16 = MenuBuilder.BuildRegisteredType( "GenericArrowButton", {
			controllerIndex = f18_local7
		} )
		f18_local16.id = "Colorblind"
		f18_local16:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 30, 0 )
		f18_local16.buttonDescription = Engine.Localize( "LUA_MENU_COLOR_BLIND_DESC" )
		f18_local16.Title:setText( ToUpperCase( Engine.Localize( "LUA_MENU_COLORBLIND_FILTER_CAPS" ) ), 0 )
		self.vList:addElement( f18_local16 )
		self.Colorblind = f18_local16
	end
	if Engine.IsSingleplayer() or Engine.IsAliensMode() then
		local f18_local16 = nil
		f18_local16 = MenuBuilder.BuildRegisteredType( "GenericArrowButton", {
			controllerIndex = f18_local7
		} )
		f18_local16.id = "AimAssist"
		f18_local16:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 30, 0 )
		f18_local16.buttonDescription = Engine.Localize( "PLATFORM_OPTIONS_AIM_ASSIST_DESC" )
		f18_local16.Title:setText( ToUpperCase( Engine.Localize( "MENU_AIM_ASSIST_CAPS" ) ), 0 )
		self.vList:addElement( f18_local16 )
		self.AimAssist = f18_local16
	end
	local f18_local16 = nil
	f18_local16 = MenuBuilder.BuildRegisteredType( "GenericArrowButton", {
		controllerIndex = f18_local7
	} )
	f18_local16.id = "TargetAssist"
	f18_local16:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 30, 0 )
	f18_local16.buttonDescription = Engine.Localize( "PLATFORM_OPTIONS_TARGET_ASSIST_DESC" )
	f18_local16.Title:setText( ToUpperCase( Engine.Localize( "MENU_TARGET_ASSIST_CAPS" ) ), 0 )
	self.vList:addElement( f18_local16 )
	self.TargetAssist = f18_local16
	if Engine.IsMultiplayer() and Engine.IsActiveLocalClientPrimary( f18_local7 ) and not CONDITIONS.IsSplitscreen() then
		local f18_local17 = MenuBuilder.BuildRegisteredType( "GenericArrowButton", {
			controllerIndex = f18_local7
		} )
		f18_local17.id = "MotionBlur"
		f18_local17:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 30, 0 )
		f18_local17.buttonDescription = Engine.Localize( "PLATFORM_UI_MOTION_BLUR_DESC" )
		f18_local17.Title:setText( ToUpperCase( Engine.Localize( "PLATFORM_UI_MOTION_BLUR_CAPS" ) ), 0 )
		self.vList:addElement( f18_local17 )
		self.MotionBlur = f18_local17
	end
	if Engine.IsMultiplayer() and Engine.IsActiveLocalClientPrimary( f18_local7 ) and CONDITIONS.IsSplitscreen() then
		local f18_local17 = MenuBuilder.BuildRegisteredType( "GenericArrowButton", {
			controllerIndex = f18_local7
		} )
		f18_local17.id = "SplitscreenShadows"
		f18_local17:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 30, 0 )
		f18_local17.buttonDescription = Engine.Localize( "LUA_MENU_MP_SHADOW_DESC" )
		f18_local17.Title:setText( ToUpperCase( Engine.Localize( "MENU_SHADOWS" ) ), 0 )
		self.vList:addElement( f18_local17 )
		self.SplitscreenShadows = f18_local17
	end
	if Engine.InFrontend() and (Engine.IsMultiplayer() or Engine.IsAliensMode()) and CODACCOUNT.IsEnabled() then
		local f18_local17 = MenuBuilder.BuildRegisteredType( "GenericButton", {
			controllerIndex = f18_local7
		} )
		f18_local17.id = "CODAccount"
		f18_local17:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 30, 0 )
		f18_local17.buttonDescription = Engine.Localize( "CODACCOUNT_CODA_SET_UP_ACCOUNT" )
		local f18_local18 = IsOnlineMatch()
		local f18_local19 = CODACCOUNT.IsAccessDisabled( f18_local7 )
		if not f18_local18 then
			f18_local17.buttonDescription = Engine.Localize( "CODACCOUNT_CODA_ONLINE_REQUIRED" )
			f18_local19 = true
		elseif f18_local19 then
			f18_local17.buttonDescription = Engine.Localize( "CODACCOUNT_CODA_UNAVAILABLE" )
		end
		f18_local17.Text:setText( ToUpperCase( Engine.Localize( "CODACCOUNT_COD_ACCOUNT_CAPS" ) ), 0 )
		f18_local17.Text:SetAlignment( LUI.Alignment.Left )
		self.vList:addElement( f18_local17 )
		f18_local17:addEventHandler( "button_action", function ( f25_arg0, f25_arg1 )
			CODACCOUNT.OpenCoDAccountPopupMenu( self, f25_arg1.controller )
		end )
		self.CODAccount = f18_local17
		if f18_local19 then
			f18_local17:ElementDisable()
		end
	end
	f0_local16( self, f18_local7, f18_local6 )
	return self
end

MenuBuilder.registerType( "OptionsButtons", OptionsButtons )
LockTable( _M )
