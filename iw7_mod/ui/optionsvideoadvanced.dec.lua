local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4 )
	local f1_local0 = function ()
		local f2_local0 = {}
		for f2_local4, f2_local5 in pairs( f1_arg2 ) do
			local f2_local6 = Engine.GetDvarType( f2_local4 )
			if f2_local6 == DvarTypeTable.DvarString or f2_local6 == DvarTypeTable.DvarEnum then
				f2_local0[f2_local4] = Engine.GetDvarString( f2_local4 )
				Engine.SetDvarString( f2_local4, f2_local5 )
			elseif f2_local6 == DvarTypeTable.DvarInt then
				f2_local0[f2_local4] = Engine.GetDvarInt( f2_local4 )
				Engine.SetDvarInt( f2_local4, f2_local5 )
			elseif f2_local6 == DvarTypeTable.DvarBool then
				f2_local0[f2_local4] = Engine.GetDvarBool( f2_local4 )
				Engine.SetDvarBool( f2_local4, f2_local5 )
			elseif f2_local6 == DvarTypeTable.DvarFloat then
				f2_local0[f2_local4] = Engine.GetDvarFloat( f2_local4 )
				Engine.SetDvarFloat( f2_local4, f2_local5 )
			end
			if f2_local4 == "r_filmGrainAtten" then
				Engine.ExecNow( "profile_setFilmGrain " .. tostring( f2_local5 ), f1_arg1 )
			end
		end
		if f1_arg3 then
			Engine.Exec( f1_arg3 )
		end
		if f1_arg4 then
			LUI.FlowManager.RequestPopupMenu( nil, "KeepDisplaySettingsPopup", true, f1_arg1, false, {
				menu = f1_arg0,
				controllerIndex = f1_arg1,
				varOptions = f2_local0,
				execCommand = f1_arg3
			} )
		end
	end
	
	if f1_arg3 == "vid_restart" then
		LUI.FlowManager.RequestPopupMenu( f1_arg0, "PopupYesNo", true, f1_arg1, false, {
			yesAction = function ()
				f1_local0()
			end,
			noAction = function ()
				f1_arg0:dispatchEventToCurrentMenu( {
					name = "onVideoChange"
				} )
			end,
			title = Engine.Localize( "PLATFORM_UI_RESTART_GAME_GRAPHICS" ),
			message = Engine.Localize( "PLATFORM_UI_RESTART_GAME_GRAPHICS_MESSAGE" )
		} )
	else
		f1_local0()
	end
end

MenuBuilder.registerType( "KeepDisplaySettingsPopup", function ( f5_arg0, f5_arg1 )
	local f5_local0 = "PLATFORM_UI_KEEP_DISPLAY_SETTINGS_TIME"
	local f5_local1 = nil
	local f5_local2 = 15
	local f5_local3 = nil
	local f5_local4 = function ()
		return Engine.Localize( f5_local0, f5_local2 )
	end
	
	local f5_local5 = function ()
		if f5_local3 then
			f5_local3.onComplete = function ()
				
			end
			
		end
	end
	
	local f5_local6 = function ()
		if f5_local3 then
			f5_local3.onComplete = function ()
				
			end
			
		end
		f0_local0( f5_arg1.menu, f5_arg1.controllerIndex, f5_arg1.varOptions, f5_arg1.execCommand, false )
	end
	
	local f5_local7 = MenuBuilder.BuildRegisteredType( "PopupYesNo", {
		title = Engine.Localize( "PLATFORM_UI_KEEP_DISPLAY_SETTINGS" ),
		message = Engine.Localize( "PLATFORM_UI_KEEP_DISPLAY_SETTINGS_DESC" ),
		statusMessage = f5_local4(),
		yesAction = f5_local5,
		noAction = f5_local6
	} )
	local f5_local8 = f5_local7:getFirstDescendentById( "submessage" )
	if f5_local8 then
		local f5_local9 = nil
		f5_local9 = function ()
			f5_local2 = f5_local2 - 1
			f5_local8:setText( f5_local4() )
			if f5_local2 > 0 then
				f5_local3 = f5_local7:Wait( 1000 )
				f5_local3.onComplete = f5_local9
			else
				LUI.FlowManager.RequestLeaveMenu( f5_local7, true )
				f5_local3 = nil
				f5_local6()
			end
		end
		
		f5_local3 = f5_local7:Wait( 1000 )
		f5_local3.onComplete = f5_local9
	end
	return f5_local7
end )
f0_local2 = function ( f12_arg0, f12_arg1 )
	f12_arg0:addEventHandler( "refresh_values", function ()
		f12_arg1()
	end )
	f12_arg1()
end

local f0_local3 = function ()
	local f14_local0 = {}
	local f14_local1 = Engine.Localize( "LUA_MENU_NO" )
	local f14_local2 = Engine.Localize( "LUA_MENU_YES" )
	return f14_local1
end

local f0_local4 = function ()
	local f15_local0 = {}
	local f15_local1 = Engine.Localize( "LUA_MENU_OFF" )
	local f15_local2 = Engine.Localize( "LUA_MENU_ON" )
	return f15_local1
end

function ValueToListIndex( f16_arg0, f16_arg1 )
	assert( #f16_arg0 > 0 )
	for f16_local3, f16_local4 in ipairs( f16_arg0 ) do
		if f16_arg1 == f16_local4 then
			return f16_local3
		end
	end
	DebugPrint( "Warning: Advanced Video trying to get a value from list that doesn't exist. ( " .. f16_arg1 .. ") Defaulting to 1" )
	return 1
end

local f0_local5 = function ( f17_arg0, f17_arg1 )
	assert( #f17_arg0 > 0 )
	assert( f17_arg1 <= #f17_arg0 )
	return f17_arg0[f17_arg1]
end

local f0_local6 = function ( f18_arg0 )
	local f18_local0 = assert
	local f18_local1
	if f18_arg0.currentValue > f18_arg0.max or f18_arg0.min > f18_arg0.currentValue then
		f18_local1 = false
	else
		f18_local1 = true
	end
	f18_local0( f18_local1 )
	assert( f18_arg0.updateDuration )
	f18_local0 = (f18_arg0.currentValue - f18_arg0.min) / (f18_arg0.max - f18_arg0.min)
	if f18_arg0.direction == ArrowBarFillDirections.LEFT_TO_RIGHT then
		f18_arg0.fillElement:SetAnchors( 0, 1 - f18_local0, 0, 0, f18_arg0.updateDuration )
	else
		f18_arg0.fillElement:SetAnchors( 1 - f18_local0, 0, 0, 0, f18_arg0.updateDuration )
	end
	f18_local1 = f18_arg0.currentValue * 80
	assert( f18_arg0.updateDuration )
	f18_arg0.Text:setText( string.format( "%.1f", f18_local1 ), f18_arg0.updateDuration )
	ACTIONS.AnimateSequence( f18_arg0, "ShowNumberLabel" )
end

local f0_local7 = function ( f19_arg0, f19_arg1, f19_arg2 )
	local f19_local0 = Engine.GetDvarType( f19_arg0 )
	local f19_local1 = 1
	if f19_local0 == DvarTypeTable.DvarString or f19_local0 == DvarTypeTable.DvarEnum then
		local f19_local2 = Engine.GetDvarString( f19_arg0 )
		if f19_arg2 then
			f19_local1 = ValueToListIndex( f19_arg2, f19_local2 )
		else
			f19_local1 = ValueToListIndex( f19_arg1, f19_local2 )
		end
	elseif f19_local0 == DvarTypeTable.DvarInt then
		local f19_local2 = Engine.GetDvarInt( f19_arg0 )
		if f19_arg2 then
			f19_local1 = ValueToListIndex( f19_arg2, f19_local2 )
		else
			f19_local1 = f19_local2
		end
	elseif f19_local0 == DvarTypeTable.DvarBool then
		if Engine.GetDvarBool( f19_arg0 ) then
			f19_local1 = 2
		else
			f19_local1 = 1
		end
	end
	return f19_local1
end

local f0_local8 = function ( f20_arg0, f20_arg1, f20_arg2, f20_arg3, f20_arg4 )
	return function ( f21_arg0 )
		local f21_local0 = false
		local f21_local1 = {}
		for f21_local2 = 1, #f20_arg2, 1 do
			local f21_local5 = f20_arg2[f21_local2].name
			local f21_local6 = Engine.GetDvarType( f21_local5 )
			local f21_local7 = f20_arg2[f21_local2].overrideSetValues
			local f21_local8 = nil
			if f21_local7 then
				f21_local8 = f0_local5( f21_local7, f21_arg0 )
			elseif f21_local6 == DvarTypeTable.DvarString or f21_local6 == DvarTypeTable.DvarEnum then
				f21_local8 = f0_local5( f20_arg3, f21_arg0 )
			elseif f21_local6 == DvarTypeTable.DvarInt then
				f21_local8 = f21_arg0
			elseif f21_local6 == DvarTypeTable.DvarBool then
				f21_local8 = false
				if f21_arg0 == 2 then
					f21_local8 = true
				end
			end
			f21_local1[f21_local5] = f21_local8
			if f20_arg2[f21_local2].showKeepSettingPopup then
				f21_local0 = true
			end
		end
		f0_local0( f20_arg0, f20_arg1, f21_local1, f20_arg4, f21_local0 )
	end
	
end

local f0_local9 = function ( f22_arg0, f22_arg1, f22_arg2, f22_arg3, f22_arg4, f22_arg5 )
	return function ()
		local f23_local0 = f22_arg3()
		LUI.AddUIArrowTextButtonLogic( f22_arg0, f22_arg1, {
			labels = f23_local0,
			action = f0_local8( f22_arg0, f22_arg1, {
				{
					name = f22_arg2,
					overrideSetValues = f22_arg5
				}
			}, f23_local0, f22_arg4 ),
			defaultValue = f0_local7( f22_arg2, f23_local0, f22_arg5 ),
			wrapAround = true
		} )
	end
	
end

local f0_local10 = function ( f24_arg0, f24_arg1, f24_arg2, f24_arg3, f24_arg4, f24_arg5 )
	f0_local2( f24_arg0, f0_local9( f24_arg0, f24_arg1, f24_arg2, f24_arg3, f24_arg4, f24_arg5 ) )
end

local f0_local11 = function ( f25_arg0, f25_arg1, f25_arg2, f25_arg3, f25_arg4, f25_arg5, f25_arg6 )
	local f25_local0 = Engine.GetDvarFloat( f25_arg2 )
	local f25_local1 = function ( f26_arg0 )
		f0_local0( f25_arg0, f25_arg1, {
			[f25_arg2] = f26_arg0
		}, nil )
	end
	
	if f25_local0 < f25_arg3 then
		f25_local0 = f25_arg3
	elseif f25_arg4 < f25_local0 then
		f25_local0 = f25_arg4
	end
	local f25_local2 = {
		decimalPlacesToRound = 6,
		action = f25_local1,
		defaultValue = f25_local0,
		wrapAround = false,
		max = f25_arg4,
		min = f25_arg3,
		step = f25_arg5,
		fillElement = f25_arg0.GenericFillBar.Fill
	}
	if f25_arg6.showTextValue and f25_arg6.sliderID and f25_arg6.sliderID == "FOV" then
		f25_local2.UpdateContent = f0_local6
	end
	LUI.AddUIArrowFillBarButtonLogic( f25_arg0, f25_arg1, f25_local2 )
end

local f0_local12 = function ( f27_arg0, f27_arg1, f27_arg2, f27_arg3 )
	local f27_local0 = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f27_arg3
	} )
	f27_local0.id = f27_arg0
	f27_local0:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 30, 0 )
	f27_local0.buttonDescription = Engine.Localize( f27_arg2 )
	f27_local0.Text:setText( ToUpperCase( Engine.Localize( f27_arg1 ) ), 0 )
	f27_local0.Text:SetAlignment( LUI.Alignment.Left )
	return f27_local0
end

local f0_local13 = function ( f28_arg0, f28_arg1, f28_arg2, f28_arg3 )
	local f28_local0 = MenuBuilder.BuildRegisteredType( "GenericDualLabelButton", {
		controllerIndex = f28_arg3
	} )
	f28_local0.id = "Adapter"
	f28_local0:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 50, 0 )
	f28_local0.buttonDescription = Engine.Localize( f28_arg2 )
	f28_local0.Text:setText( ToUpperCase( Engine.Localize( f28_arg1 ) ), 0 )
	f28_local0.Text:SetAlignment( LUI.Alignment.Left )
	return f28_local0
end

local f0_local14 = function ( f29_arg0, f29_arg1, f29_arg2, f29_arg3 )
	local f29_local0 = MenuBuilder.BuildRegisteredType( "GenericArrowButton", {
		controllerIndex = f29_arg3
	} )
	f29_local0.id = f29_arg0
	f29_local0:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 50, 0 )
	f29_local0.buttonDescription = Engine.Localize( f29_arg2 )
	f29_local0.Title:setText( ToUpperCase( Engine.Localize( f29_arg1 ) ), 0 )
	return f29_local0
end

local f0_local15 = function ( f30_arg0, f30_arg1, f30_arg2, f30_arg3 )
	local f30_local0 = MenuBuilder.BuildRegisteredType( "GenericFillBarArrowButton", {
		controllerIndex = f30_arg3
	} )
	f30_local0.id = f30_arg0
	f30_local0:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 50, 0 )
	f30_local0.buttonDescription = Engine.Localize( f30_arg2 )
	f30_local0.Title:setText( ToUpperCase( Engine.Localize( f30_arg1 ) ), 0 )
	return f30_local0
end

local f0_local16 = function ( f31_arg0, f31_arg1, f31_arg2, f31_arg3, f31_arg4 )
	return function ( f32_arg0, f32_arg1 )
		local f32_local0 = {}
		local f32_local1 = f31_arg2()
		local f32_local2 = {}
		for f32_local3 = 1, #f31_arg3, 1 do
			local f32_local6 = f31_arg3[f32_local3].overrideSetValuesFunc
			if f32_local6 then
				f31_arg3[f32_local3].overrideSetValues = {}
				for f32_local7 = 1, #f32_local1, 1 do
					table.insert( f31_arg3[f32_local3].overrideSetValues, f32_local6( f32_local7 ) )
				end
			end
		end
		local f32_local3 = f0_local8( f32_arg0, f32_arg1, f31_arg3, f32_local1, f31_arg4 )
		for f32_local4 = 1, #f32_local1, 1 do
			local f32_local6 = f32_local4
			table.insert( f32_local0, {
				id = f31_arg0 .. "Button" .. f32_local6,
				text = f32_local1[f32_local6],
				desc = f31_arg1,
				actionFunc = function ( f33_arg0, f33_arg1 )
					f32_local3( f32_local6 )
					f33_arg0:dispatchEventToCurrentMenu( {
						name = "subcategory_option_selected"
					} )
				end
			} )
		end
		return f32_local0
	end
	
end

local f0_local17 = function ( f34_arg0, f34_arg1, f34_arg2, f34_arg3, f34_arg4 )
	local f34_local0 = LUI.FlowManager.GetScopedData( f34_arg0 )
	f34_local0.currentOptionsSubCategory = f34_arg1
	f34_arg0:processEvent( {
		name = "subcategory_changed",
		title = f34_arg0[f34_arg1].Text.getText( REG6.Text ),
		createOptions = f34_arg2,
		noFocus = f34_arg3,
		blockMouseInSubcategory = f34_arg4
	} )
end

local f0_local18 = function ( f35_arg0, f35_arg1, f35_arg2 )
	local f35_local0 = f35_arg1.buttonCategory or ""
	local f35_local1 = f35_arg1.buttonTitle or ""
	local f35_local2 = f35_arg1.buttonDescription or ""
	local f35_local3 = f35_arg1.getCurrentValueFunc
	local f35_local4 = f35_arg1.getButtonDisabledFunc
	local f35_local5 = f35_arg1.createOptionsFunc
	local f35_local6 = f35_arg1.getAllOptionsFunc
	local f35_local7 = f35_arg1.blockMouseInSubcategory or false
	local f35_local8
	if f35_local3 then
		f35_local8 = f35_local3()
		if not f35_local8 then
		
		else
			local f35_local9 = OPTIONS.BuildGenericDualLabelButton( f35_local0, f35_local1, f35_local8, f35_local2, f35_arg2 )
			local f35_local10
			if f35_local4 then
				f35_local10 = f35_local4()
				if not f35_local10 then
				
				else
					f35_local9:SetButtonDisabled( f35_local10 or #f35_local6() <= 1 )
					f35_arg0[f35_local0] = f35_local9
					f35_local9:addEventHandler( "button_action", function ( f36_arg0, f36_arg1 )
						f0_local17( f35_arg0, f35_local0, f35_local5, f36_arg1.mouse, f35_local7 )
					end )
					f35_local9:addEventHandler( "refresh_values", function ( f37_arg0, f37_arg1 )
						f35_local9.DynamicText:setText( ToUpperCase( Engine.Localize( f35_local3 and f35_local3() or "" ) ) )
						local f37_local0 = f35_local4 and f35_local4() or false
						local f37_local1 = f35_local6()
						if not f37_local0 then
							f37_local0 = #f37_local1 <= 1
						end
						f35_local9:SetButtonDisabled( f37_local0 )
						local f37_local2 = LUI.FlowManager.GetScopedData( f35_arg0 )
						if f37_local0 then
							if f37_local2.showingSubCategory and f35_local0 == f37_local2.currentOptionsSubCategory then
								local f37_local3 = f35_arg0:getParent()
								f37_local3:LeaveSubCategoryMenu( {
									noFocus = false
								} )
							end
						elseif f37_local2.showingSubCategory and f35_local0 == f37_local2.currentOptionsSubCategory then
							f0_local17( f35_arg0, f35_local0, f35_local5, true, f35_local7 )
						end
					end )
					return f35_local9
				end
			end
			f35_local10 = false
		end
	end
	f35_local8 = ""
end

local f0_local19 = function ( f38_arg0, f38_arg1 )
	local f38_local0 = Engine.GetAdapterList
	local f38_local1 = {
		buttonCategory = "Adapter",
		buttonTitle = "PLATFORM_UI_ADAPTER_CAP",
		buttonDescription = "PLATFORM_UI_ADAPTER_DESC",
		getCurrentValueFunc = function ()
			local f39_local0 = f38_local0()
			return f39_local0[f0_local7( "r_adapter", f39_local0 )]
		end,
		getButtonDisabledFunc = function ()
			local f40_local0
			if not Engine.InFrontend() then
				f40_local0 = Engine.IsMultiplayer()
			else
				f40_local0 = false
			end
			return f40_local0
		end,
		getAllOptionsFunc = f38_local0,
		createOptionsFunc = f0_local16( f38_local1.buttonCategory, f38_local1.buttonDescription, f38_local1.getAllOptionsFunc, {
			{
				name = "r_adapter",
				overrideSetValuesFunc = nil
			}
		}, "vid_restart" )
	}
	return f0_local18( f38_arg0, f38_local1, f38_arg1 )
end

local f0_local20 = function ( f41_arg0, f41_arg1 )
	local f41_local0 = function ()
		local f42_local0 = {
			"LUA_MENU_MODE_WINDOWED",
			"LUA_MENU_MODE_FULLSCREEN"
		}
		if not Engine.IsPCApp() then
			table.insert( f42_local0, "LUA_MENU_MODE_FULLSCREEN_BORDERLESS" )
		end
		return f42_local0
	end
	
	local f41_local1 = function ()
		local f43_local0 = f41_local0()
		local f43_local1 = 1
		if Engine.GetDvarBool( "r_fullscreen" ) then
			f43_local1 = 2
			if not Engine.IsPCApp() and Engine.GetDvarBool( "r_fullscreenWindow" ) then
				f43_local1 = 3
			end
		end
		return f43_local0[f43_local1]
	end
	
	local f41_local2 = function ( f44_arg0 )
		return f44_arg0 ~= 1
	end
	
	local f41_local3 = function ( f45_arg0 )
		return f45_arg0 == 3
	end
	
	local f41_local4 = {
		buttonCategory = "DisplayMode",
		buttonTitle = "PLATFORM_UI_DISPLAY_MODE_CAPS",
		buttonDescription = Engine.IsPCApp() and "PLATFORM_UI_DISPLAY_MODE_DESC_ALT" or "PLATFORM_UI_DISPLAY_MODE_DESC",
		getCurrentValueFunc = f41_local1,
		getButtonDisabledFunc = nil,
		getAllOptionsFunc = f41_local0,
		blockMouseInSubcategory = true
	}
	local f41_local5 = {
		{
			name = "r_fullscreen",
			overrideSetValuesFunc = f41_local2
		}
	}
	if not Engine.IsPCApp() then
		table.insert( f41_local5, {
			name = "r_fullscreenWindow",
			overrideSetValuesFunc = f41_local3
		} )
	end
	f41_local4.createOptionsFunc = f0_local16( f41_local4.buttonCategory, f41_local4.buttonDescription, f41_local4.getAllOptionsFunc, f41_local5, "vid_reconfig" )
	return f0_local18( f41_arg0, f41_local4, f41_arg1 )
end

local f0_local21 = function ( f46_arg0, f46_arg1 )
	assert( not Engine.IsPCApp() )
	local f46_local0 = Engine.GetMonitorList
	local f46_local1 = {
		buttonCategory = "Monitor",
		buttonTitle = "PLATFORM_UI_MONITOR_CAPS",
		buttonDescription = "PLATFORM_UI_MONITOR_DESC",
		getCurrentValueFunc = function ()
			local f47_local0 = Engine.GetDvarBool( "r_fullscreen" )
			local f47_local1 = ""
			if f47_local0 then
				local f47_local2 = f46_local0()
				f47_local1 = f47_local2[f0_local7( "r_monitor", f47_local2 )]
			end
			return f47_local1
		end,
		getButtonDisabledFunc = function ()
			return not Engine.GetDvarBool( "r_fullscreen" )
		end,
		getAllOptionsFunc = f46_local0,
		createOptionsFunc = f0_local16( f46_local1.buttonCategory, f46_local1.buttonDescription, f46_local1.getAllOptionsFunc, {
			{
				name = "r_monitor",
				overrideSetValuesFunc = nil
			}
		}, "vid_reconfig" )
	}
	return f0_local18( f46_arg0, f46_local1, f46_arg1 )
end

local f0_local22 = function ( f49_arg0, f49_arg1 )
	assert( not Engine.IsPCApp() )
	local f49_local0 = Engine.GetRefreshRateList
	local f49_local1 = {
		buttonCategory = "RefreshRate",
		buttonTitle = "PLATFORM_UI_REFRESH_RATE_CAPS",
		buttonDescription = "PLATFORM_UI_REFRESH_RATE_DESC",
		getCurrentValueFunc = function ()
			local f50_local0 = Engine.GetDvarBool( "r_fullscreen" )
			if f50_local0 then
				f50_local0 = not Engine.GetDvarBool( "r_fullscreenWindow" )
			end
			local f50_local1 = ""
			if f50_local0 then
				local f50_local2 = f49_local0()
				f50_local1 = f50_local2[f0_local7( "r_refreshRate", f50_local2 )]
			end
			return f50_local1
		end,
		getButtonDisabledFunc = function ()
			local f51_local0 = Engine.GetDvarBool( "r_fullscreen" )
			if f51_local0 then
				f51_local0 = not Engine.GetDvarBool( "r_fullscreenWindow" )
			end
			return not f51_local0
		end,
		getAllOptionsFunc = f49_local0,
		createOptionsFunc = f0_local16( f49_local1.buttonCategory, f49_local1.buttonDescription, f49_local1.getAllOptionsFunc, {
			{
				name = "r_refreshRate",
				overrideSetValuesFunc = nil
			}
		}, "vid_reconfig" )
	}
	return f0_local18( f49_arg0, f49_local1, f49_arg1 )
end

local f0_local23 = function ( f52_arg0, f52_arg1 )
	local f52_local0 = f0_local14( "VSync", "PLATFORM_UI_VSYNC_CAPS", "PLATFORM_UI_VSYNC_DESC", f52_arg1 )
	f0_local10( f52_local0, f52_arg1, "r_vsync", f0_local3, "vid_reconfig", {
		0,
		1
	} )
	return f52_local0
end

local f0_local24 = function ( f53_arg0, f53_arg1 )
	local f53_local0 = f0_local14( "AspectRatio", "PLATFORM_UI_ASPECT_RATIO_CAPS", "PLATFORM_UI_ASPECT_RATIO_DESC", f53_arg1 )
	f0_local2( f53_local0, function ()
		f0_local10( f53_local0, f53_arg1, "r_aspectratio", function ()
			local f55_local0 = {}
			local f55_local1 = Engine.Localize( "MENU_AUTO" )
			local f55_local2 = Engine.Localize( "MENU_STANDARD" )
			local f55_local3 = Engine.Localize( "MENU_WIDE_16_10" )
			local f55_local4 = Engine.Localize( "MENU_WIDE_16_9" )
			return f55_local1
		end, "vid_reconfig", Engine.GetDvarEnumList( "r_aspectratio" ) )
	end )
	return f53_local0
end

local f0_local25 = function ( f56_arg0, f56_arg1 )
	local f56_local0 = Engine.GetModeList
	local f56_local1 = function ()
		if Engine.IsPCApp() then
			return false
		end
		return Engine.GetDvarBool( "r_fullscreen" ) and not Engine.GetDvarBool( "r_fullscreenWindow" )
	end
	
	local f56_local2 = {
		buttonCategory = "Resolution",
		buttonTitle = "PLATFORM_UI_VIDEO_MODE_CAPS",
		buttonDescription = "PLATFORM_UI_VIDEO_MODE_DESC",
		getCurrentValueFunc = function ()
			local f58_local0 = f56_local1()
			local f58_local1 = ""
			if f58_local0 then
				local f58_local2 = f56_local0()
				f58_local1 = f58_local2[f0_local7( "r_mode", f58_local2 )]
			else
				f58_local1 = Engine.GetWindowResolution()
			end
			return f58_local1
		end,
		getButtonDisabledFunc = function ()
			return not f56_local1()
		end,
		getAllOptionsFunc = f56_local0,
		createOptionsFunc = f0_local16( f56_local2.buttonCategory, f56_local2.buttonDescription, f56_local2.getAllOptionsFunc, {
			{
				name = "r_mode",
				overrideSetValuesFunc = nil,
				showKeepSettingPopup = true
			}
		}, "vid_reconfig" )
	}
	return f0_local18( f56_arg0, f56_local2, f56_arg1 )
end

local f0_local26 = function ( f60_arg0, f60_arg1 )
	local f60_local0 = function ()
		local f61_local0 = Engine.GetSceneResolutionList()
		for f61_local1 = 1, #f61_local0, 1 do
			if f61_local0[f61_local1] == "" then
				f61_local0[f61_local1] = "PLATFORM_UI_NATIVE"
			end
		end
		return f61_local0
	end
	
	local f60_local1 = {
		buttonCategory = "ImageQuality",
		buttonTitle = "PLATFORM_UI_IMAGE_QUALITY_CAPS",
		buttonDescription = "PLATFORM_UI_IMAGE_QUALITY_DESC",
		getCurrentValueFunc = function ()
			local f62_local0 = f60_local0()
			return f62_local0[Engine.GetSceneResolutionCurrentIndex()]
		end,
		getButtonDisabledFunc = nil,
		getAllOptionsFunc = f60_local0,
		createOptionsFunc = f0_local16( f60_local1.buttonCategory, f60_local1.buttonDescription, f60_local1.getAllOptionsFunc, {
			{
				name = "r_resampleScenePixelCount",
				overrideSetValuesFunc = Engine.GetSceneResolutionPixelCountForIndex
			}
		}, "vid_reconfig" )
	}
	return f0_local18( f60_arg0, f60_local1, f60_arg1 )
end

local f0_local27 = function ( f63_arg0, f63_arg1 )
	local f63_local0 = function ()
		return {
			"PLATFORM_UI_QUALITY_VERY_LOW",
			"PLATFORM_UI_QUALITY_LOW",
			"PLATFORM_UI_QUALITY_NORMAL",
			"PLATFORM_UI_QUALITY_HIGH"
		}
	end
	
	local f63_local1 = {
		3,
		2,
		1,
		0
	}
	local f63_local2 = function ()
		local f65_local0 = f63_local0()
		return f65_local0[f0_local7( "r_picmip", f65_local0, f63_local1 )]
	end
	
	local f63_local3 = function ()
		local f66_local0
		if not Engine.InFrontend() then
			f66_local0 = Engine.IsMultiplayer()
		else
			f66_local0 = false
		end
		return f66_local0
	end
	
	local f63_local4 = function ( f67_arg0 )
		return f63_local1[f67_arg0]
	end
	
	local f63_local5 = f0_local7( "r_picmip", f63_local0(), f63_local1 )
	local f63_local6 = {
		buttonCategory = "TextureRes",
		buttonTitle = "PLATFORM_UI_TEX_RES_CAPS",
		buttonDescription = "PLATFORM_UI_TEX_RES_DESC",
		getCurrentValueFunc = f63_local2,
		getButtonDisabledFunc = f63_local3,
		getAllOptionsFunc = f63_local0,
		createOptionsFunc = f0_local16( f63_local6.buttonCategory, f63_local6.buttonDescription, f63_local6.getAllOptionsFunc, {
			{
				name = "r_picmip",
				overrideSetValuesFunc = f63_local4
			},
			{
				name = "r_picmip_bump",
				overrideSetValuesFunc = f63_local4
			},
			{
				name = "r_picmip_spec",
				overrideSetValuesFunc = f63_local4
			}
		}, "vid_restart" )
	}
	return f0_local18( f63_arg0, f63_local6, f63_arg1 )
end

local f0_local28 = function ( f68_arg0, f68_arg1 )
	local f68_local0 = function ()
		return {
			"PLATFORM_UI_QUALITY_LOW",
			"PLATFORM_UI_QUALITY_NORMAL",
			"PLATFORM_UI_QUALITY_HIGH"
		}
	end
	
	local f68_local1 = {
		2,
		8,
		16
	}
	local f68_local2 = {
		buttonCategory = "TexFilterAniso",
		buttonTitle = "PLATFORM_UI_TEX_FILTER_ANISO_CAPS",
		buttonDescription = "PLATFORM_UI_TEX_FILTER_ANISO_DESC",
		getCurrentValueFunc = function ()
			local f70_local0 = Engine.GetDvarInt( "r_texFilterAnisoMax" )
			local f70_local1 = 1
			if f70_local0 <= f68_local1[1] then
				f70_local1 = 1
			elseif f70_local0 <= f68_local1[2] then
				f70_local1 = 2
			elseif f70_local0 <= f68_local1[3] then
				f70_local1 = 3
			end
			local f70_local2 = f68_local0()
			return f70_local2[f70_local1]
		end,
		getButtonDisabledFunc = nil,
		getAllOptionsFunc = f68_local0,
		createOptionsFunc = f0_local16( f68_local2.buttonCategory, f68_local2.buttonDescription, f68_local2.getAllOptionsFunc, {
			{
				name = "r_texFilterAnisoMax",
				overrideSetValuesFunc = function ( f71_arg0 )
					return f68_local1[f71_arg0]
				end
				
			},
			{
				name = "r_texFilterAnisoMin",
				overrideSetValuesFunc = function ( f72_arg0 )
					return 1
				end
				
			}
		}, "vid_reconfig" )
	}
	return f0_local18( f68_arg0, f68_local2, f68_arg1 )
end

local f0_local29 = function ( f73_arg0, f73_arg1 )
	local f73_local0 = function ()
		return {
			"PLATFORM_UI_QUALITY_AUTO",
			"PLATFORM_UI_QUALITY_NORMAL",
			"PLATFORM_UI_QUALITY_HIGH",
			"PLATFORM_UI_QUALITY_EXTRA"
		}
	end
	
	local f73_local1 = {
		buttonCategory = "ShadowMapResolution",
		buttonTitle = "PLATFORM_UI_SHADOW_MAP_RES_CAPS",
		buttonDescription = "PLATFORM_UI_SHADOW_MAP_RES_DESC",
		getCurrentValueFunc = function ()
			local f75_local0 = f73_local0()
			return f75_local0[f0_local7( "r_shadowTileResolution", f75_local0, Engine.GetDvarEnumList( "r_shadowTileResolution" ) )]
		end,
		getButtonDisabledFunc = nil,
		getAllOptionsFunc = f73_local0,
		createOptionsFunc = f0_local16( f73_local1.buttonCategory, f73_local1.buttonDescription, f73_local1.getAllOptionsFunc, {
			{
				name = "r_shadowTileResolution",
				overrideSetValuesFunc = function ( f76_arg0 )
					local f76_local0 = Engine.GetDvarEnumList( "r_shadowTileResolution" )
					return f76_local0[f76_arg0]
				end
				
			}
		}, "vid_reconfig" )
	}
	return f0_local18( f73_arg0, f73_local1, f73_arg1 )
end

local f0_local30 = function ( f77_arg0, f77_arg1 )
	local f77_local0 = function ()
		return {
			"PLATFORM_UI_QUALITY_LOW",
			"PLATFORM_UI_QUALITY_NORMAL",
			"PLATFORM_UI_QUALITY_HIGH"
		}
	end
	
	local f77_local1 = {
		3,
		4,
		8
	}
	local f77_local2 = {
		5,
		8,
		16
	}
	local f77_local3 = {
		buttonCategory = "ShadowCasterLevel",
		buttonTitle = "PLATFORM_UI_SHADOW_CASTER_CAPS",
		buttonDescription = "PLATFORM_UI_SHADOW_CASTER_DESC",
		getCurrentValueFunc = function ()
			local f79_local0 = Engine.GetDvarInt( "sm_spotUpdateLimitMax" )
			local f79_local1 = 1
			if f79_local0 <= f77_local1[1] then
				f79_local1 = 1
			elseif f79_local0 <= f77_local1[2] then
				f79_local1 = 2
			elseif f79_local0 <= f77_local1[3] then
				f79_local1 = 3
			end
			local f79_local2 = f77_local0()
			return f79_local2[f79_local1]
		end,
		getButtonDisabledFunc = nil,
		getAllOptionsFunc = f77_local0,
		createOptionsFunc = f0_local16( f77_local3.buttonCategory, f77_local3.buttonDescription, f77_local3.getAllOptionsFunc, {
			{
				name = "sm_spotUpdateLimitMax",
				overrideSetValuesFunc = function ( f80_arg0 )
					return f77_local1[f80_arg0]
				end
				
			},
			{
				name = "sm_roundRobinPrioritySpotShadowsMax",
				overrideSetValuesFunc = function ( f81_arg0 )
					return f77_local2[f81_arg0]
				end
				
			}
		}, "vid_reconfig" )
	}
	return f0_local18( f77_arg0, f77_local3, f77_arg1 )
end

local f0_local31 = function ( f82_arg0, f82_arg1 )
	local f82_local0 = f0_local14( "CachedSpotShadows", "PLATFORM_UI_CACHED_SPOT_SHADOWS_CAPS", "PLATFORM_UI_CACHED_SPOT_SHADOWS_DESC", f82_arg1 )
	f0_local10( f82_local0, f82_arg1, "r_usePrebuiltSpotShadow", f0_local3, "vid_reconfig", {
		"Disabled",
		"Enabled"
	} )
	return f82_local0
end

local f0_local32 = function ( f83_arg0, f83_arg1 )
	local f83_local0 = f0_local14( "CachedSunShadows", "PLATFORM_UI_CACHED_SUN_SHADOWS_CAPS", "PLATFORM_UI_CACHED_SUN_SHADOWS_DESC", f83_arg1 )
	f0_local10( f83_local0, f83_arg1, "r_usePrebuiltSunShadowArchived", f0_local3, "vid_reconfig" )
	return f83_local0
end

local f0_local33 = function ( f84_arg0, f84_arg1 )
	local f84_local0 = f0_local14( "VolumetricLighting", "PLATFORM_UI_VOLUMETRIC_LIGHTING_CAPS", "PLATFORM_UI_VOLUMETRIC_LIGHTING_DESC", f84_arg1 )
	f0_local10( f84_local0, f84_arg1, "r_volumetricsA", f0_local3, "vid_reconfig" )
	return f84_local0
end

local f0_local34 = function ( f85_arg0, f85_arg1 )
	local f85_local0 = f0_local14( "AmbientOcclusion", "PLATFORM_UI_SSAO_CAPS", "PLATFORM_UI_SSAO_DESC", f85_arg1 )
	f0_local2( f85_local0, function ()
		local f86_local0 = Engine.GetDvarEnumList( "r_ssao" )
		local f86_local1
		if ValueToListIndex( f86_local0, Engine.GetDvarString( "r_ssao" ) ) > 1 then
			f86_local1 = 2
		else
			f86_local1 = 1
		end
		LUI.AddUIArrowTextButtonLogic( f85_local0, f85_arg1, {
			labels = f0_local3(),
			action = function ( f87_arg0 )
				local f87_local0 = f0_local5
				local f87_local1 = f86_local0
				local f87_local2
				if f87_arg0 == 1 then
					f87_local2 = 1
					if not f87_local2 then
					
					else
						f0_local0( f85_arg0, f85_arg1, {
							r_ssao = f87_local0( f87_local1, f87_local2 )
						}, "vid_reconfig" )
					end
				end
				f87_local2 = 3
			end,
			defaultValue = f86_local1,
			wrapAround = true
		} )
	end )
	return f85_local0
end

local f0_local35 = function ( f88_arg0, f88_arg1 )
	local f88_local0 = function ()
		return {
			"PLATFORM_UI_QUALITY_LOW",
			"PLATFORM_UI_QUALITY_NORMAL",
			"PLATFORM_UI_QUALITY_HIGH",
			"PLATFORM_UI_QUALITY_ULTRA"
		}
	end
	
	local f88_local1 = {
		2,
		3,
		4,
		5
	}
	local f88_local2 = {
		64,
		32,
		24,
		16
	}
	local f88_local3 = {
		buttonCategory = "ParticleLighting",
		buttonTitle = "PLATFORM_UI_PARTICLE_LIGHTING_CAPS",
		buttonDescription = "PLATFORM_UI_PARTICLE_LIGHTING_DESC",
		getCurrentValueFunc = function ()
			local f90_local0 = Engine.GetDvarInt( "ui_fx_lightmap_max_level" )
			local f90_local1 = 1
			if f90_local0 <= f88_local1[1] then
				f90_local1 = 1
			elseif f90_local0 <= f88_local1[2] then
				f90_local1 = 2
			elseif f90_local0 <= f88_local1[3] then
				f90_local1 = 3
			elseif f90_local0 <= f88_local1[4] then
				f90_local1 = 4
			end
			local f90_local2 = f88_local0()
			return f90_local2[f90_local1]
		end,
		getButtonDisabledFunc = nil,
		getAllOptionsFunc = f88_local0,
		createOptionsFunc = f0_local16( f88_local3.buttonCategory, f88_local3.buttonDescription, f88_local3.getAllOptionsFunc, {
			{
				name = "ui_fx_lightmap_max_level",
				overrideSetValuesFunc = function ( f91_arg0 )
					return f88_local1[f91_arg0]
				end
				
			},
			{
				name = "fx_lightmap_pixels_per_texel",
				overrideSetValuesFunc = function ( f92_arg0 )
					return f88_local2[f92_arg0]
				end
				
			}
		}, "vid_reconfig" )
	}
	return f0_local18( f88_arg0, f88_local3, f88_arg1 )
end

local f0_local36 = function ( f93_arg0, f93_arg1 )
	local f93_local0 = f0_local14( "DepthOfField", "PLATFORM_UI_DEPTH_OF_FIELD_CAPS", "PLATFORM_UI_DEPTH_OF_FIELD_DESC", f93_arg1 )
	f0_local10( f93_local0, f93_arg1, "r_dof_enable", f0_local3, "vid_reconfig" )
	return f93_local0
end

local f0_local37 = function ( f94_arg0, f94_arg1 )
	local f94_local0 = f0_local14( "MotionBlur", "PLATFORM_UI_MOTION_BLUR_CAPS", "PLATFORM_UI_MOTION_BLUR_DESC", f94_arg1 )
	f0_local10( f94_local0, f94_arg1, "r_mbEnableA", f0_local3, "vid_reconfig" )
	return f94_local0
end

local f0_local38 = function ( f95_arg0, f95_arg1 )
	local f95_local0 = function ()
		local f96_local0 = {
			"MENU_OFF",
			"MENU_FXAA",
			"MENU_FILMIC_SMAA_1X"
		}
		if Engine.SMAAT2XAvailable() then
			f96_local0[#f96_local0 + 1] = "MENU_FILMIC_SMAA_T2X"
		end
		return f96_local0
	end
	
	local f95_local1 = {
		"None",
		"FXAA",
		"Filmic SMAA 1x"
	}
	if Engine.SMAAT2XAvailable() then
		f95_local1[#f95_local1 + 1] = "Filmic SMAA T2x"
	end
	local f95_local2 = {
		buttonCategory = "AntiAliasing",
		buttonTitle = "PLATFORM_UI_ANTIALIASING_CAPS",
		buttonDescription = "PLATFORM_UI_ANTIALIASING_DESC",
		getCurrentValueFunc = function ()
			local f97_local0 = f95_local0()
			return f97_local0[f0_local7( "r_postAA", f97_local0, f95_local1 )]
		end,
		getButtonDisabledFunc = nil,
		getAllOptionsFunc = f95_local0,
		createOptionsFunc = f0_local16( f95_local2.buttonCategory, f95_local2.buttonDescription, f95_local2.getAllOptionsFunc, {
			{
				name = "r_postAA",
				overrideSetValuesFunc = function ( f98_arg0 )
					return f95_local1[f98_arg0]
				end
				
			}
		}, "vid_reconfig" )
	}
	return f0_local18( f95_arg0, f95_local2, f95_arg1 )
end

local f0_local39 = function ( f99_arg0, f99_arg1, f99_arg2 )
	local f99_local0 = f0_local15( "SMAAFilmicStrength", "PLATFORM_UI_SMAA_FILMIC_STRENGTH", "PLATFORM_UI_SMAA_FILMIC_STRENGTH_DESC", f99_arg2 )
	f0_local11( f99_local0, f99_arg2, "r_smaaFilmicStrength", SliderBounds.SMAAFilmicStrength.Min, SliderBounds.SMAAFilmicStrength.Max, SliderBounds.SMAAFilmicStrength.Step, {
		showTextValue = false
	} )
	local f99_local1 = function ()
		return string.find( Engine.GetDvarString( "r_postAA" ), "Filmic" )
	end
	
	f99_local0:SetButtonDisabled( not f99_local1() )
	f99_arg1:addEventHandler( "refresh_values", function ( f101_arg0, f101_arg1 )
		f99_local0:SetButtonDisabled( not f99_local1() )
	end )
	return f99_local0
end

local f0_local40 = function ( f102_arg0, f102_arg1 )
	local f102_local0 = f0_local15( "FilmGrainAtten", "MENU_FILM_GRAIN_ATTEN", "MENU_FILM_GRAIN_ATTEN_DESC", f102_arg1 )
	local f102_local1 = SliderBounds.FilmGrainAtten.Step
	if Engine.IsPC() and SliderBounds.FilmGrainAtten.PCStep then
		f102_local1 = SliderBounds.FilmGrainAtten.PCStep
	end
	f0_local11( f102_local0, f102_arg1, "r_filmGrainAtten", SliderBounds.FilmGrainAtten.Min, SliderBounds.FilmGrainAtten.Max, f102_local1, {
		showTextValue = false
	} )
	return f102_local0
end

local f0_local41 = function ( f103_arg0, f103_arg1 )
	local f103_local0 = f0_local14( "BulletImpact", "PLATFORM_UI_BULLET_IMPACT_CAPS", "PLATFORM_UI_BULLET_IMPACT_DESC", f103_arg1 )
	f0_local10( f103_local0, f103_arg1, "fx_marks", f0_local3, "vid_reconfig" )
	return f103_local0
end

local f0_local42 = function ( f104_arg0, f104_arg1 )
	local f104_local0 = f0_local14( "SubsurfaceScattering", "PLATFORM_UI_SSS_CAPS", "PLATFORM_UI_SSS_DESC", f104_arg1 )
	f0_local10( f104_local0, f104_arg1, "r_sssEnable", f0_local3, "vid_reconfig" )
	return f104_local0
end

local f0_local43 = function ( f105_arg0, f105_arg1 )
	local f105_local0 = f0_local14( "AllowShaderPreload", "PLATFORM_UI_SHADER_PRELOAD_CAPS", "PLATFORM_UI_SHADER_PRELOAD_DESC", f105_arg1 )
	f0_local10( f105_local0, f105_arg1, "r_preloadShadersFrontendAllow", f0_local3, "vid_reconfig" )
	return f105_local0
end

local f0_local44 = function ( f106_arg0, f106_arg1 )
	local f106_local0 = function ()
		return {
			"MENU_OFF",
			"MENU_NEAR",
			"MENU_ALL"
		}
	end
	
	local f106_local1 = {
		"0_Off",
		"1_Near",
		"2_All"
	}
	local f106_local2 = {
		buttonCategory = "Tessellation",
		buttonTitle = "PLATFORM_UI_TESSELLATION_CAPS",
		buttonDescription = "PLATFORM_UI_TESSELLATION_DESC",
		getCurrentValueFunc = function ()
			local f108_local0 = f106_local0()
			return f108_local0[f0_local7( "r_tessellation", f108_local0, f106_local1 )]
		end,
		getButtonDisabledFunc = nil,
		getAllOptionsFunc = f106_local0,
		createOptionsFunc = f0_local16( f106_local2.buttonCategory, f106_local2.buttonDescription, f106_local2.getAllOptionsFunc, {
			{
				name = "r_tessellation",
				overrideSetValuesFunc = function ( f109_arg0 )
					return f106_local1[f109_arg0]
				end
				
			}
		}, "vid_reconfig" )
	}
	return f0_local18( f106_arg0, f106_local2, f106_arg1 )
end

local f0_local45 = function ( f110_arg0, f110_arg1 )
	local f110_local0 = f0_local14( "ParticleQuality", "PLATFORM_UI_PARTICLE_QUALITY_CAPS", "PLATFORM_UI_PARTICLE_QUALITY_DESC", f110_arg1 )
	f0_local2( f110_local0, function ()
		local f111_local0 = {}
		local f111_local1 = Engine.Localize( "PLATFORM_UI_QUALITY_NORMAL" )
		local f111_local2 = Engine.Localize( "PLATFORM_UI_QUALITY_HIGH" )
		f111_local0 = f111_local1
		f111_local1 = {
			"Disabled",
			"Half size frame buffer with bilateral upsampling"
		}
		f111_local2 = Engine.GetDvarString( "r_halfResEmissive" )
		local f111_local3 = 1
		if f111_local2 == f111_local1[1] then
			f111_local3 = 1
		else
			f111_local3 = 2
		end
		LUI.AddUIArrowTextButtonLogic( f110_local0, f110_arg1, {
			labels = f111_local0,
			action = function ( f112_arg0 )
				f0_local0( f110_arg0, f110_arg1, {
					r_halfResEmissive = f111_local1[f112_arg0]
				}, "vid_reconfig" )
			end,
			defaultValue = f111_local3,
			wrapAround = true
		} )
	end )
	return f110_local0
end

local f0_local46 = function ( f113_arg0, f113_arg1 )
	local f113_local0 = function ()
		return {
			"PLATFORM_UI_QUALITY_LOW",
			"PLATFORM_UI_QUALITY_NORMAL",
			"PLATFORM_UI_QUALITY_HIGH",
			"PLATFORM_UI_QUALITY_ULTRA"
		}
	end
	
	local f113_local1 = {
		1.2,
		1,
		0.8,
		0.5
	}
	local f113_local2 = {
		buttonCategory = "LODRamp",
		buttonTitle = "PLATFORM_UI_LOD_RAMP_CAPS",
		buttonDescription = "PLATFORM_UI_LOD_RAMP_DESC",
		getCurrentValueFunc = function ()
			local f115_local0 = Engine.GetDvarFloat( "r_lodScale" )
			local f115_local1 = 1
			if f115_local0 <= f113_local1[4] then
				f115_local1 = 4
			elseif f115_local0 <= f113_local1[3] then
				f115_local1 = 3
			elseif f115_local0 <= f113_local1[2] then
				f115_local1 = 2
			end
			local f115_local2 = f113_local0()
			return f115_local2[f115_local1]
		end,
		getButtonDisabledFunc = nil,
		getAllOptionsFunc = f113_local0,
		createOptionsFunc = f0_local16( f113_local2.buttonCategory, f113_local2.buttonDescription, f113_local2.getAllOptionsFunc, {
			{
				name = "r_lodScale",
				overrideSetValuesFunc = function ( f116_arg0 )
					return f113_local1[f116_arg0]
				end
				
			}
		}, "vid_reconfig" )
	}
	return f0_local18( f113_arg0, f113_local2, f113_arg1 )
end

MenuBuilder.registerType( "ShaderCacheDialog", function ()
	local f117_local0 = {
		title = Engine.Localize( "PLATFORM_SHADER_PRECACHE_QUESTION_TITLE" ),
		message = Engine.Localize( "PLATFORM_SHADER_PRECACHE_QUESTION" ),
		buttons = {}
	}
	table.insert( f117_local0.buttons, {
		label = Engine.Localize( "PLATFORM_SHADER_PRECACHE_RESUME" ),
		action = function ( f118_arg0, f118_arg1 )
			if not ShaderUpload.ResumeCaching() then
				LUI.FlowManager.RequestPopupMenu( nil, "PopupOK", false, f118_arg1, false, {
					title = Engine.Localize( "MENU_NOTICE" ),
					message = Engine.Localize( "PLATFORM_UI_SHADER_FRONTEND_PRELOAD_ALREADY_DONE" )
				}, unused, false, true )
			end
		end
	} )
	table.insert( f117_local0.buttons, {
		label = Engine.Localize( "PLATFORM_SHADER_PRECACHE_RESTART" ),
		action = function ()
			ShaderUpload.RestartCaching()
		end
	} )
	table.insert( f117_local0.buttons, {
		label = Engine.Localize( "LUA_MENU_CANCEL" ),
		action = function ()
			
		end
	} )
	local f117_local1 = MenuBuilder.BuildRegisteredType( "PopupMessageAndButtons", f117_local0 )
	f117_local1.id = "ShaderCacheDialog"
	return f117_local1
end )
local f0_local47 = function ( f121_arg0, f121_arg1 )
	local f121_local0 = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f121_arg1
	} )
	f121_local0.id = "ShaderFrontendPreload"
	f121_local0:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 50, 0 )
	f121_local0.buttonDescription = Engine.Localize( "PLATFORM_UI_SHADER_FRONTEND_PRELOAD_DESC" )
	f121_local0.Text:setText( ToUpperCase( Engine.Localize( "PLATFORM_UI_SHADER_FRONTEND_PRELOAD" ) ) )
	f121_local0:addEventHandler( "button_action", function ( f122_arg0, f122_arg1 )
		LUI.FlowManager.RequestPopupMenu( nil, "ShaderCacheDialog", false, f122_arg1.controller, false, uploadOptions, unused, false, true )
	end )
	f121_local0:addEventHandler( "refresh_values", function ( f123_arg0, f123_arg1 )
		f121_local0:SetButtonDisabled( not ShaderUpload.OptionsAreAvailable() )
	end )
	f121_local0:SetButtonDisabled( not ShaderUpload.OptionsAreAvailable() )
	return f121_local0
end

local f0_local48 = function ( f124_arg0, f124_arg1 )
	local f124_local0 = f0_local15( "FOV", "PLATFORM_UI_FOV_CAPS", "PLATFORM_UI_FOV_DESC", f124_arg1 )
	f0_local11( f124_local0, f124_arg1, "com_fovUserScale", SliderBounds.FOVUserScale.Min, SliderBounds.FOVUserScale.Max, SliderBounds.FOVUserScale.Step, {
		showTextValue = true,
		sliderID = "FOV"
	} )
	ACTIONS.AnimateSequence( f124_local0, "ShowTickMarker" )
	local f124_local1 = (1 - SliderBounds.FOVUserScale.Min) / (SliderBounds.FOVUserScale.Max - SliderBounds.FOVUserScale.Min)
	f124_local0.GenericFillBar.TickMarker:SetAnchorsAndPosition( f124_local1, 1 - f124_local1 - 0.01, 0, 0, 0, 0, -4, 4 )
	return f124_local0
end

local f0_local49 = function ( f125_arg0, f125_arg1 )
	local f125_local0 = {
		[#f125_local0 + 1] = f0_local19( f125_arg0, f125_arg1 ),
		[#f125_local0 + 1] = f0_local20( f125_arg0, f125_arg1 )
	}
	if not Engine.IsPCApp() then
		f125_local0[#f125_local0 + 1] = f0_local21( f125_arg0, f125_arg1 )
		f125_local0[#f125_local0 + 1] = f0_local22( f125_arg0, f125_arg1 )
	end
	f125_local0[#f125_local0 + 1] = f0_local23( f125_arg0, f125_arg1 )
	f125_local0[#f125_local0 + 1] = f0_local25( f125_arg0, f125_arg1 )
	f125_local0[#f125_local0 + 1] = f0_local26( f125_arg0, f125_arg1 )
	return f125_local0
end

local f0_local50 = function ( f126_arg0, f126_arg1 )
	local f126_local0 = {
		[#f126_local0 + 1] = f0_local27( f126_arg0, f126_arg1 ),
		[#f126_local0 + 1] = f0_local28( f126_arg0, f126_arg1 )
	}
	return f126_local0
end

local f0_local51 = function ( f127_arg0, f127_arg1 )
	local f127_local0 = {
		[#f127_local0 + 1] = f0_local29( f127_arg0, f127_arg1 ),
		[#f127_local0 + 1] = f0_local30( f127_arg0, f127_arg1 ),
		[#f127_local0 + 1] = f0_local31( f127_arg0, f127_arg1 ),
		[#f127_local0 + 1] = f0_local32( f127_arg0, f127_arg1 ),
		[#f127_local0 + 1] = f0_local33( f127_arg0, f127_arg1 ),
		[#f127_local0 + 1] = f0_local34( f127_arg0, f127_arg1 ),
		[#f127_local0 + 1] = f0_local35( f127_arg0, f127_arg1 )
	}
	return f127_local0
end

local f0_local52 = function ( f128_arg0, f128_arg1 )
	local f128_local0 = f0_local38( f128_arg0, f128_arg1 )
	local f128_local1 = {
		[#f128_local1 + 1] = f0_local36( f128_arg0, f128_arg1 ),
		[#f128_local1 + 1] = f0_local37( f128_arg0, f128_arg1 ),
		[#f128_local1 + 1] = f128_local0,
		[#f128_local1 + 1] = f0_local39( f128_arg0, f128_local0, f128_arg1 ),
		[#f128_local1 + 1] = f0_local40( f128_arg0, f128_arg1 )
	}
	return f128_local1
end

local f0_local53 = function ( f129_arg0, f129_arg1 )
	local f129_local0 = {
		[#f129_local0 + 1] = f0_local41( f129_arg0, f129_arg1 ),
		[#f129_local0 + 1] = f0_local44( f129_arg0, f129_arg1 ),
		[#f129_local0 + 1] = f0_local45( f129_arg0, f129_arg1 ),
		[#f129_local0 + 1] = f0_local46( f129_arg0, f129_arg1 ),
		[#f129_local0 + 1] = f0_local43( f129_arg0, f129_arg1 ),
		[#f129_local0 + 1] = f0_local47( f129_arg0, f129_arg1 ),
		[#f129_local0 + 1] = f0_local48( f129_arg0, f129_arg1 )
	}
	return f129_local0
end

local f0_local54 = function ( f130_arg0, f130_arg1 )
	local f130_local0 = nil
	if f130_arg1 == "display_options" then
		f130_local0 = f130_arg0.DisplayOptions
	elseif f130_arg1 == "texture_options" then
		f130_local0 = f130_arg0.TextureOptions
	elseif f130_arg1 == "light_shadow_options" then
		f130_local0 = f130_arg0.LightAndShadowOptions
	elseif f130_arg1 == "post_process_options" then
		f130_local0 = f130_arg0.PostProcessOptions
	elseif f130_arg1 == "misc_options" then
		f130_local0 = f130_arg0.MiscOptions
	else
		f130_local0 = f130_arg0.DisplayOptions
	end
	return f130_local0
end

local f0_local55 = function ( f131_arg0, f131_arg1, f131_arg2 )
	local f131_local0 = LUI.FlowManager.GetScopedData( f131_arg0 )
	f131_local0.currentOptionsCategory = f131_arg1
	local f131_local1 = nil
	local f131_local2 = f0_local54( f131_arg0, f131_arg1 )
	if f131_arg1 == "display_options" then
		f131_local1 = f0_local49
	elseif f131_arg1 == "texture_options" then
		f131_local1 = f0_local50
	elseif f131_arg1 == "light_shadow_options" then
		f131_local1 = f0_local51
	elseif f131_arg1 == "post_process_options" then
		f131_local1 = f0_local52
	elseif f131_arg1 == "misc_options" then
		f131_local1 = f0_local53
	else
		f131_local1 = CreateVideoOptions
	end
	f131_arg0:processEvent( {
		name = "category_changed",
		title = f131_local2.Text:getText(),
		createOptions = f131_local1,
		noFocus = f131_arg2,
		category = f131_arg1
	} )
end

local f0_local56 = function ( f132_arg0, f132_arg1, f132_arg2 )
	assert( f132_arg0.DisplayOptions )
	assert( f132_arg0.TextureOptions )
	assert( f132_arg0.LightAndShadowOptions )
	assert( f132_arg0.PostProcessOptions )
	assert( f132_arg0.MiscOptions )
	f132_arg0.DisplayOptions:addEventHandler( "button_action", function ( f133_arg0, f133_arg1 )
		f0_local55( f132_arg0, "display_options", f133_arg1.mouse )
	end )
	f132_arg0.TextureOptions:addEventHandler( "button_action", function ( f134_arg0, f134_arg1 )
		f0_local55( f132_arg0, "texture_options", f134_arg1.mouse )
	end )
	f132_arg0.LightAndShadowOptions:addEventHandler( "button_action", function ( f135_arg0, f135_arg1 )
		f0_local55( f132_arg0, "light_shadow_options", f135_arg1.mouse )
	end )
	f132_arg0.PostProcessOptions:addEventHandler( "button_action", function ( f136_arg0, f136_arg1 )
		f0_local55( f132_arg0, "post_process_options", f136_arg1.mouse )
	end )
	f132_arg0.MiscOptions:addEventHandler( "button_action", function ( f137_arg0, f137_arg1 )
		f0_local55( f132_arg0, "misc_options", f137_arg1.mouse )
	end )
	f132_arg0:addEventHandler( "menu_create", function ()
		local f138_local0 = LUI.FlowManager.GetScopedData( f132_arg0 )
		local f138_local1 = f138_local0.currentOptionsCategory
		if f138_local1 == nil then
			f138_local1 = "display_options"
		end
		f0_local55( f132_arg0, f138_local1, true )
	end )
	f132_arg0:registerEventHandler( "onVideoChange", function ()
		local f139_local0 = LUI.FlowManager.GetScopedData( f132_arg0 )
		f0_local55( f132_arg0, f139_local0.currentOptionsCategory, true )
		return true
	end )
end

function OptionsVideoAdvanced( menu, controller )
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
	local f140_local1 = controller or {}
	local f140_local2 = f140_local1.controllerIndex
	self:setUseStencil( false )
	
	local DisplayOptions = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f140_local2
	} )
	DisplayOptions.id = "DisplayOptions"
	DisplayOptions:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 30, 0 )
	DisplayOptions.buttonDescription = Engine.Localize( "PLATFORM_UI_DESC_DISPLAY_OPTIONS" )
	DisplayOptions.Text:setText( ToUpperCase( Engine.Localize( "PLATFORM_UI_DISPLAY_OPTIONS" ) ), 0 )
	DisplayOptions.Text:SetAlignment( LUI.Alignment.Left )
	self:addElement( DisplayOptions )
	self.DisplayOptions = DisplayOptions
	
	self.DisplayOptions:addEventHandler( "button_over", function ( f141_arg0, f141_arg1 )
		self:processEvent( {
			name = "category_button_over"
		} )
	end )
	
	local TextureOptions = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f140_local2
	} )
	TextureOptions.id = "TextureOptions"
	TextureOptions:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 30, 0 )
	TextureOptions.buttonDescription = Engine.Localize( "PLATFORM_UI_DESC_TEXTURE_OPTIONS" )
	TextureOptions.Text:setText( ToUpperCase( Engine.Localize( "PLATFORM_UI_TEXTURE_OPTIONS" ) ), 0 )
	TextureOptions.Text:SetAlignment( LUI.Alignment.Left )
	self:addElement( TextureOptions )
	self.TextureOptions = TextureOptions
	
	self.TextureOptions:addEventHandler( "button_over", function ( f142_arg0, f142_arg1 )
		self:processEvent( {
			name = "category_button_over"
		} )
	end )
	
	local LightAndShadowOptions = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f140_local2
	} )
	LightAndShadowOptions.id = "LightAndShadowOptions"
	LightAndShadowOptions:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 30, 0 )
	LightAndShadowOptions.buttonDescription = Engine.Localize( "PLATFORM_UI_DESC_LIGHT_SHADOW_OPTIONS" )
	LightAndShadowOptions.Text:setText( ToUpperCase( Engine.Localize( "PLATFORM_UI_LIGHT_AND_SHADOW_OPTIONS" ) ), 0 )
	LightAndShadowOptions.Text:SetAlignment( LUI.Alignment.Left )
	self:addElement( LightAndShadowOptions )
	self.LightAndShadowOptions = LightAndShadowOptions
	
	self.LightAndShadowOptions:addEventHandler( "button_over", function ( f143_arg0, f143_arg1 )
		self:processEvent( {
			name = "category_button_over"
		} )
	end )
	
	local PostProcessOptions = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f140_local2
	} )
	PostProcessOptions.id = "PostProcessOptions"
	PostProcessOptions:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 30, 0 )
	PostProcessOptions.buttonDescription = Engine.Localize( "PLATFORM_UI_DESC_POST_PROCESS_OPTIONS" )
	PostProcessOptions.Text:setText( ToUpperCase( Engine.Localize( "PLATFORM_UI_POST_PROCESS_OPTIONS" ) ), 0 )
	PostProcessOptions.Text:SetAlignment( LUI.Alignment.Left )
	self:addElement( PostProcessOptions )
	self.PostProcessOptions = PostProcessOptions
	
	self.PostProcessOptions:addEventHandler( "button_over", function ( f144_arg0, f144_arg1 )
		self:processEvent( {
			name = "category_button_over"
		} )
	end )
	
	local MiscOptions = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f140_local2
	} )
	MiscOptions.id = "MiscOptions"
	MiscOptions:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 30, 0 )
	MiscOptions.buttonDescription = Engine.Localize( "PLATFORM_UI_DESC_MISCELLANEOUS_OPTIONS" )
	MiscOptions.Text:setText( ToUpperCase( Engine.Localize( "PLATFORM_UI_MISC_OPTIONS" ) ), 0 )
	MiscOptions.Text:SetAlignment( LUI.Alignment.Left )
	self:addElement( MiscOptions )
	self.MiscOptions = MiscOptions
	
	self.MiscOptions:addEventHandler( "button_over", function ( f145_arg0, f145_arg1 )
		self:processEvent( {
			name = "category_button_over"
		} )
	end )
	f0_local56( self, f140_local2, f140_local1 )
	return self
end

MenuBuilder.registerType( "OptionsVideoAdvanced", OptionsVideoAdvanced )
LockTable( _M )
