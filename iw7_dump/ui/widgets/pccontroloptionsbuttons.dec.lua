local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = {
	"MENU_LOW",
	[3] = "MENU_MEDIUM",
	[7] = "MENU_HIGH",
	[13] = "MENU_VERY_HIGH",
	[20] = "MENU_INSANE"
}
f0_local1 = {}
f0_local2 = Engine.Localize( "LUA_MENU_DISABLED" )
local f0_local3 = Engine.Localize( "LUA_MENU_ENABLED" )
f0_local1 = f0_local2
f0_local2 = {
	false,
	true
}
f0_local3 = function ()
	return Engine.IsGamepadEnabled() == 0
end

local f0_local4 = function ()
	return not Engine.IsGamepadConnected()
end

local f0_local5 = function ( f3_arg0 )
	assert( f3_arg0.DynamicText )
	assert( f3_arg0.actionName )
	f3_arg0.DynamicText:setText( Engine.GetBinding( f3_arg0.actionName ), 0 )
end

local f0_local6 = function ( f4_arg0, f4_arg1, f4_arg2, f4_arg3, f4_arg4 )
	local f4_local0 = function ( f5_arg0 )
		Engine.BindKey( f5_arg0.actionName )
		f0_local5( f5_arg0 )
	end
	
	local f4_local1 = MenuBuilder.BuildRegisteredType( "GenericDualLabelButton", {
		controllerIndex = f4_arg0
	} )
	f4_local1.id = f4_arg1
	f4_local1.Text:setText( ToUpperCase( Engine.Localize( f4_arg2 ) ), 0 )
	f4_local1.actionName = f4_arg3
	f4_local1.DynamicText:setText( Engine.GetBinding( f4_local1.actionName ), 0 )
	f4_local1:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 776, 0, _1080p * 30 )
	f4_local1:addEventHandler( "button_action", function ( f6_arg0, f6_arg1 )
		f4_local0( f4_local1 )
	end )
	f4_local1:addEventHandler( "key_bound", function ()
		f4_local1:dispatchEventToRoot( {
			name = "options_window_refresh"
		} )
		Engine.PlaySound( CoD.SFX.OtherAdjust )
	end )
	f4_local1:addEventHandler( "refresh", function ()
		f0_local5( f4_local1 )
		if f4_arg4 then
			f4_local1:SetButtonDisabled( f4_arg4() )
		end
	end )
	if f4_arg4 then
		f4_local1:SetButtonDisabled( f4_arg4() )
	end
	return f4_local1
end

local f0_local7 = function ( f9_arg0, f9_arg1, f9_arg2, f9_arg3, f9_arg4, f9_arg5 )
	local f9_local0 = MenuBuilder.BuildRegisteredType( "GenericArrowButton", {
		controllerIndex = f9_arg0
	} )
	f9_local0.id = f9_arg1
	f9_local0:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 30, 0 )
	f9_local0.Title:setText( ToUpperCase( Engine.Localize( f9_arg2 ) ), 0 )
	local f9_local1
	if Engine.GetProfileData( f9_arg3 ) then
		f9_local1 = 2
		if not f9_local1 then
		
		else
			local f9_local2 = function ( f10_arg0, f10_arg1 )
				Engine.ExecNow( f9_arg4 )
				Engine.ExecNow( "profile_menuDvarsFinish" )
				f9_local0:dispatchEventToRoot( {
					name = "options_window_refresh"
				} )
			end
			
			f9_local0:addEventHandler( "refresh", function ()
				if f9_arg5 then
					f9_local0:SetButtonDisabled( f9_arg5() )
				end
			end )
			local f9_local3 = {}
			local f9_local4 = Engine.Localize( "LUA_MENU_DISABLED" )
			local f9_local5 = Engine.Localize( "LUA_MENU_ENABLED" )
			LUI.AddUIArrowTextButtonLogic( f9_local0, f9_arg0, {
				labels = f9_local4,
				action = f9_local2,
				defaultValue = f9_local1,
				wrapAround = true
			} )
			if f9_arg5 then
				f9_local0:SetButtonDisabled( f9_arg5() )
			end
			return f9_local0
		end
	end
	f9_local1 = 1
end

function ValueToListIndex( f12_arg0, f12_arg1 )
	assert( #f12_arg0 > 0 )
	for f12_local3, f12_local4 in ipairs( f12_arg0 ) do
		if f12_arg1 == f12_local4 then
			return f12_local3
		end
	end
	assert( false, "Entry not found" )
end

local f0_local8 = function ( f13_arg0, f13_arg1, f13_arg2, f13_arg3, f13_arg4, f13_arg5, f13_arg6 )
	local f13_local0 = MenuBuilder.BuildRegisteredType( "GenericArrowButton", {
		controllerIndex = f13_arg0
	} )
	f13_local0.id = f13_arg1
	f13_local0:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 30, 0 )
	f13_local0.Title:setText( ToUpperCase( Engine.Localize( f13_arg2 ) ), 0 )
	f13_local0:addEventHandler( "refresh", function ()
		if f13_arg6 then
			f13_local0:SetButtonDisabled( f13_arg6() )
		end
	end )
	local f13_local1 = Engine.GetDvarType( f13_arg3 )
	local f13_local2 = 1
	local f13_local3 = nil
	if f13_local1 == DvarTypeTable.DvarString or f13_local1 == DvarTypeTable.DvarEnum then
		f13_local3 = Engine.GetDvarString( f13_arg3 )
	elseif f13_local1 == DvarTypeTable.DvarInt then
		f13_local3 = Engine.GetDvarInt( f13_arg3 )
	elseif f13_local1 == DvarTypeTable.DvarBool then
		f13_local3 = Engine.GetDvarBool( f13_arg3 )
	elseif f13_local1 == DvarTypeTable.DvarFloat then
		f13_local3 = Engine.GetDvarFloat( f13_arg3 )
	end
	if f13_arg3 == "m_pitch" then
		if f13_local3 >= 0 then
			f13_local2 = 1
		else
			f13_local2 = 2
		end
	elseif f13_local3 then
		f13_local2 = ValueToListIndex( f13_arg5, f13_local3 )
	end
	LUI.AddUIArrowTextButtonLogic( f13_local0, f13_arg0, {
		labels = f13_arg4,
		action = function ( f15_arg0 )
			local f15_local0 = f13_arg5[f15_arg0]
			if f13_local1 == DvarTypeTable.DvarString or f13_local1 == DvarTypeTable.DvarEnum then
				Engine.SetDvarString( f13_arg3, f15_local0 )
			elseif f13_local1 == DvarTypeTable.DvarInt then
				Engine.SetDvarInt( f13_arg3, f15_local0 )
			elseif f13_local1 == DvarTypeTable.DvarBool then
				Engine.SetDvarBool( f13_arg3, f15_local0 )
			elseif f13_local1 == DvarTypeTable.DvarFloat then
				Engine.SetDvarFloat( f13_arg3, f15_local0 )
			end
			Engine.MenuDvarsFinish( f13_arg0 )
		end,
		defaultValue = f13_local2,
		wrapAround = true
	} )
	if f13_arg6 then
		f13_local0:SetButtonDisabled( f13_arg6() )
	end
	return f13_local0
end

local f0_local9 = function ( f16_arg0, f16_arg1, f16_arg2, f16_arg3, f16_arg4 )
	local f16_local0 = MenuBuilder.BuildRegisteredType( "GenericFillBarArrowButton", {
		controllerIndex = f16_arg0
	} )
	f16_local0.id = f16_arg1
	f16_local0:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 30, 0 )
	f16_local0.Title:setText( ToUpperCase( Engine.Localize( f16_arg2 ) ), 0 )
	LUI.AddUIArrowFillBarButtonLogic( f16_local0, f16_arg0, {
		decimalPlacesToRound = 2,
		action = function ( f17_arg0 )
			Engine.SetDvarFloat( f16_arg3, f17_arg0 )
			Engine.ExecNow( "profile_menuDvarsFinish" )
		end,
		defaultValue = Engine.GetDvarFloat( f16_arg3 ),
		wrapAround = false,
		max = f16_arg4.Max,
		min = f16_arg4.Min,
		step = f16_arg4.Step,
		showTextLabel = true,
		dividedRangeValue = f16_arg4.DividedRangeValue,
		dividedRangeFraction = f16_arg4.DividedRangeFraction,
		dividedRangeStep = f16_arg4.DividedRangeStep,
		fillElement = f16_local0.GenericFillBar.Fill
	} )
	return f16_local0
end

local f0_local10 = function ( f18_arg0, f18_arg1, f18_arg2 )
	local f18_local0 = Engine.TableGetRowCount( f18_arg2.file )
	for f18_local1 = 0, f18_local0 - 1, 1 do
		local f18_local4 = Engine.TableLookupByRow( f18_arg2.file, f18_local1, f18_arg2.cols.identifier )
		local f18_local5 = Engine.TableLookupByRow( f18_arg2.file, f18_local1, f18_arg2.cols.stringID )
		local f18_local6 = Engine.TableLookupByRow( f18_arg2.file, f18_local1, f18_arg2.cols.action )
		if not (not Engine.IsSingleplayer() or not (Engine.TableLookupByRow( f18_arg2.file, f18_local1, f18_arg2.cols.showForSP ) == "Y")) or not (not Engine.IsMultiplayer() or not Engine.IsCoreMode() or not (Engine.TableLookupByRow( f18_arg2.file, f18_local1, f18_arg2.cols.showForMP ) == "Y")) or Engine.IsAliensMode() and Engine.TableLookupByRow( f18_arg2.file, f18_local1, f18_arg2.cols.showForCP ) == "Y" then
			f18_arg1[#f18_arg1 + 1] = f0_local6( f18_arg0, f18_local4, f18_local5, f18_local6 )
		end
	end
end

local f0_local11 = function ( f19_arg0, f19_arg1 )
	local f19_local0 = {}
	f0_local10( f19_arg1, f19_local0, CSV.movementKeyBindings )
	return f19_local0
end

local f0_local12 = function ( f20_arg0, f20_arg1 )
	local f20_local0 = {}
	if CONDITIONS.IsSingleplayer( f20_arg0 ) then
		f20_local0[#f20_local0 + 1] = f0_local7( f20_arg1, "ToogleLean", "LUA_MENU_LEAN_TOGGLE", "leanEnabled", "profile_toggleLean" )
	end
	f20_local0[#f20_local0 + 1] = f0_local7( f20_arg1, "ToggleSprintReload", "MENU_SPRINT_CANCELS_RELOAD", "sprintCancelsReload", "profile_toggleSprintCancelsReload" )
	f0_local10( f20_arg1, f20_local0, CSV.actionKeyBindings )
	return f20_local0
end

local f0_local13 = function ( f21_arg0, f21_arg1 )
	local f21_local0 = {
		[#f21_local0 + 1] = f0_local9( f21_arg1, "MouseVertSens", "MENU_MOUSE_VERT_SENSITIVITY", "profileMenuOption_mousevertsensitivity", SliderBounds.MouseSensitivity ),
		[#f21_local0 + 1] = f0_local9( f21_arg1, "MouseHorzSens", "MENU_MOUSE_HORZ_SENSITIVITY", "profileMenuOption_mousehorzsensitivity", SliderBounds.MouseSensitivity ),
		[#f21_local0 + 1] = f0_local8( f21_arg1, "InvertMouse", "MENU_INVERT_MOUSE", "m_pitch", f0_local1, {
			MousePitchTable.PitchFloat,
			-MousePitchTable.PitchFloat
		} ),
		[#f21_local0 + 1] = f0_local9( f21_arg1, "MouseFlightVertSens", "MENU_MOUSE_FLIGHT_VERT_SENSITIVITY", "profileMenuOption_mouseflightvertsensitivity", SliderBounds.MouseSensitivity ),
		[#f21_local0 + 1] = f0_local9( f21_arg1, "MouseFlightHorzSens", "MENU_MOUSE_FLIGHT_HORZ_SENSITIVITY", "profileMenuOption_mouseflighthorzsensitivity", SliderBounds.MouseSensitivity ),
		[#f21_local0 + 1] = f0_local7( f21_arg1, "MouseFlightInversion", "MENU_MOUSE_FLIGHT_INVERSION", "invertedFlyPitch", "profile_toggleInvertedFlyPitch" )
	}
	if not Engine.IsPCApp() then
		f21_local0[#f21_local0 + 1] = f0_local8( f21_arg1, "RawMouse", "MENU_RAW_MOUSE", "win_useWmInput", f0_local1, f0_local2 )
	end
	f21_local0[#f21_local0 + 1] = f0_local8( f21_arg1, "Filter", "MENU_SMOOTH_MOUSE", "m_smoothing", f0_local1, f0_local2 )
	f21_local0[#f21_local0 + 1] = f0_local8( f21_arg1, "FreeLook", "MENU_FREE_LOOK", "cl_freelook", f0_local1, f0_local2 )
	f0_local10( f21_arg1, f21_local0, CSV.lookKeyBindings )
	return f21_local0
end

local f0_local14 = function ( f22_arg0, f22_arg1 )
	local f22_local0 = {}
	f0_local10( f22_arg1, f22_local0, CSV.chatKeyBindings )
	return f22_local0
end

local f0_local15 = function ( f23_arg0, f23_arg1 )
	local f23_local0 = {}
	local f23_local1 = f0_local7( f23_arg1, "GamepadEnabled", "LUA_MENU_GAMEPAD", "gpadEnabled", "profile_toggleEnableGamepad", f0_local4 )
	f23_local1:addEventHandler( "refresh", function ()
		local f24_local0 = Engine.GetLuiRoot()
		f24_local0:TryAddMouseCursor()
		f23_arg0:dispatchEventToRoot( {
			name = "refresh_button_helper",
			dispatchChildren = true
		} )
	end )
	f23_local0[#f23_local0 + 1] = f23_local1
	f23_arg0.gamepadConnected = Engine.IsGamepadConnected()
	local f23_local2 = nil
	local f23_local3 = function ()
		local f25_local0 = Engine.IsGamepadConnected()
		local f25_local1
		if not f25_local0 then
			f25_local1 = not f0_local3()
		else
			f25_local1 = false
		end
		if (f23_arg0.gamepadConnected ~= f25_local0 or f25_local1) and f23_local1.SetCurrentValue then
			f23_arg0.gamepadConnected = f25_local0
			if f25_local1 then
				f23_local1:SetCurrentValue( 1, f23_arg1 )
			end
			f23_local1:SetButtonDisabled( not f23_arg0.gamepadConnected )
			f23_arg0:processEvent( "refresh" )
		end
		local f25_local2 = f23_arg0:Wait( 1000 )
		f25_local2.onComplete = function ()
			return f23_local2()
		end
		
	end
	
	f23_local3()
	f23_local1:addEventHandler( "refresh_button_helper", function ()
		local f27_local0
		if Engine.GetProfileData( "gpadEnabled" ) then
			f27_local0 = 2
			if not f27_local0 then
			
			else
				if f23_local1.currentValue ~= f27_local0 then
					f23_local1.currentValue = f27_local0
					f23_local1:UpdateContent()
					f23_local1:dispatchEventToRoot( {
						name = "options_window_refresh"
					} )
				end
			end
		end
		f27_local0 = 1
	end )
	local f23_local4 = Engine.TableLookup( CSV.stickLayouts.file, CSV.stickLayouts.cols.cfg, Engine.GetProfileData( "gpadSticksConfig", f23_arg1 ), CSV.stickLayouts.cols.name )
	local f23_local5 = MenuBuilder.BuildRegisteredType( "GenericDualLabelButton", {
		controllerIndex = f23_arg1
	} )
	f23_local5.id = "StickLayout"
	f23_local5:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 30, 0 )
	f23_local5.Text:setText( ToUpperCase( Engine.Localize( "MENU_STICK_LAYOUT_CAP" ) ), 0 )
	f23_local5.Text:SetAlignment( LUI.Alignment.Left )
	f23_local5.DynamicText:setText( Engine.Localize( f23_local4 ) )
	f23_local5:SetButtonDisabled( f0_local3() )
	f23_local5:addEventHandler( "refresh", function ()
		f23_local5:SetButtonDisabled( f0_local3() )
	end )
	f23_local5:addEventHandler( "button_action", function ( f29_arg0, f29_arg1 )
		LUI.FlowManager.RequestAddMenu( "StickLayout", true, f23_arg1, false )
	end )
	f23_local0[#f23_local0 + 1] = f23_local5
	local f23_local6 = Engine.GetProfileData( "gpadButtonsConfig", f23_arg1 )
	local f23_local7 = OPTIONS.buttonLayoutStrings[f23_local6] and OPTIONS.buttonLayoutStrings[f23_local6] or "MENU_NOMAD_TACTICAL_ALT"
	local f23_local8 = MenuBuilder.BuildRegisteredType( "GenericDualLabelButton", {
		controllerIndex = f23_arg1
	} )
	f23_local8.id = "ButtonLayout"
	f23_local8:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 30, 0 )
	f23_local8.Text:setText( ToUpperCase( Engine.Localize( "MENU_BUTTON_LAYOUT_CAPS" ) ), 0 )
	f23_local8.Text:SetAlignment( LUI.Alignment.Left )
	f23_local8.DynamicText:setText( Engine.Localize( f23_local7 ) )
	f23_local8:SetButtonDisabled( f0_local3() )
	f23_local8:addEventHandler( "refresh", function ()
		f23_local8:SetButtonDisabled( f0_local3() )
	end )
	f23_local8:addEventHandler( "button_action", function ( f31_arg0, f31_arg1 )
		LUI.FlowManager.RequestAddMenu( "ButtonLayout", true, f23_arg1, false )
	end )
	f23_local0[#f23_local0 + 1] = f23_local8
	f23_local0[#f23_local0 + 1] = f0_local7( f23_arg1, "LookInversion", "MENU_LOOK_INVERSION", "invertedPitch", "profile_toggleInvertedPitch", f0_local3 )
	f23_local0[#f23_local0 + 1] = f0_local7( f23_arg1, "FlyInversion", "MENU_FLY_INVERSION", "invertedFlyPitch", "profile_toggleInvertedFlyPitch", f0_local3 )
	f23_local0[#f23_local0 + 1] = f0_local7( f23_arg1, "SprintCancelReload", "MENU_SPRINT_CANCELS_RELOAD", "sprintCancelsReload", "profile_toggleSprintCancelsReload", f0_local3 )
	local f23_local9 = {}
	local f23_local10 = {}
	for f23_local11 = 1, 20, 1 do
		local f23_local14 = f0_local0[f23_local11]
		local f23_local15
		if f23_local14 then
			f23_local15 = Engine.Localize( f23_local14 ) .. " " .. f23_local11
			if not f23_local15 then
			
			else
				table.insert( f23_local9, f23_local15 )
				table.insert( f23_local10, f23_local11 )
			end
		end
		f23_local15 = tostring( f23_local11 )
	end
	f23_local0[#f23_local0 + 1] = f0_local8( f23_arg1, "LookHorzSens", "MENU_LOOK_HORZ_SENSITIVITY_CAPS", "profileMenuOption_horzsensitivity", f23_local9, f23_local10, f0_local3 )
	f23_local0[#f23_local0 + 1] = f0_local8( f23_arg1, "LookVertSense", "MENU_LOOK_VERT_SENSITIVITY_CAPS", "profileMenuOption_vertsensitivity", f23_local9, f23_local10, f0_local3 )
	f23_local0[#f23_local0 + 1] = f0_local7( f23_arg1, "Rumble", "PLATFORM_CONTROLLER_VIBRATION", "rumble", "profile_toggleRumble", f0_local3 )
	if Engine.IsSingleplayer() or Engine.IsAliensMode() then
		f23_local0[#f23_local0 + 1] = f0_local7( f23_arg1, "AimAssist", "MENU_AIM_ASSIST", "autoAim", "profile_toggleAutoAim", f0_local3 )
	end
	f23_local0[#f23_local0 + 1] = f0_local7( f23_arg1, "TargetAssist", "MENU_TARGET_ASSIST", "targetAssist", "profile_toggleTargetAssist", f0_local3 )
	if Engine.IsSingleplayer() then
		f23_local0[#f23_local0 + 1] = f0_local7( f23_arg1, "LeanToggle", "LUA_MENU_LEAN_TOGGLE", "leanEnabled", "profile_toggleLean", f0_local3 )
	end
	if Engine.IsDevelopmentBuild() then
		f23_local0[#f23_local0 + 1] = f0_local7( f23_arg1, "DebugKeyboard", "DEBUG_KEYBOARD", "useDevKeyboard", "profile_toggleDevKeyboard", f0_local3 )
	end
	return f23_local0
end

local f0_local16 = function ( f32_arg0, f32_arg1, f32_arg2 )
	Engine.ExecNow( "profile_menuDvarsSetup" )
	local f32_local0 = {}
	if f32_arg2 == "movement_controls" then
		f32_local0 = f0_local11( f32_arg0, f32_arg1 )
	elseif f32_arg2 == "actions_controls" then
		f32_local0 = f0_local12( f32_arg0, f32_arg1 )
	elseif f32_arg2 == "look_controls" then
		f32_local0 = f0_local13( f32_arg0, f32_arg1 )
	elseif f32_arg2 == "chat_controls" then
		f32_local0 = f0_local14( f32_arg0, f32_arg1 )
	elseif f32_arg2 == "gamepad_controls" then
		f32_local0 = f0_local15( f32_arg0, f32_arg1 )
	end
	for f32_local1 = 1, #f32_local0, 1 do
		f32_arg0:addElement( f32_local0[f32_local1] )
	end
end

local f0_local17 = function ( f33_arg0, f33_arg1, f33_arg2 )
	f33_arg0.CreateOptions = f0_local16
	f33_arg0:addEventHandler( "menu_close", function ()
		Engine.Exec( "updategamerprofile" )
	end )
	f33_arg0:addEventHandler( "options_window_refresh", function ()
		f33_arg0:dispatchEventToChildren( {
			name = "refresh"
		} )
	end )
end

function PCControlOptionsButtons( menu, controller )
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
	self.id = "PCControlOptionsButtons"
	self._animationSets = {}
	self._sequences = {}
	local f36_local1 = controller or {}
	local f36_local2 = f36_local1.controllerIndex
	self:setUseStencil( false )
	self:AllowScrolling()
	f0_local17( self, f36_local2, f36_local1 )
	return self
end

MenuBuilder.registerType( "PCControlOptionsButtons", PCControlOptionsButtons )
LockTable( _M )
