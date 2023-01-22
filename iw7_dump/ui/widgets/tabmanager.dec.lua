LUI.TabManager = LUI.Class( LUI.UIVerticalList )
local f0_local0 = function ( f1_arg0, f1_arg1 )
	local f1_local0 = f1_arg0._buildSpacer()
	f1_local0.id = "spacer" .. f1_arg1
	table.insert( f1_arg0._spacerElements, f1_local0 )
	f1_arg0._tabNavigator:addElement( f1_local0 )
end

local f0_local1 = function ( f2_arg0, f2_arg1 )
	if f2_arg0._buildSpacer and f2_arg1 > 0 then
		f0_local0( f2_arg0, f2_arg1 - 1 )
	end
	local f2_local0 = f2_arg0._buildTab()
	assert( type( f2_local0 ) == "userdata" )
	f2_local0.id = "tab" .. f2_arg1
	f2_local0.index = f2_arg1
	f2_arg0._tabElements[f2_arg1 + 1] = f2_local0
	f2_arg0._tabNavigator:addElement( f2_local0 )
	return f2_local0
end

local f0_local2 = function ( f3_arg0 )
	for f3_local3, f3_local4 in ipairs( f3_arg0._tabElements ) do
		f3_local4:closeTree()
	end
	f3_arg0._tabElements = {}
	for f3_local3, f3_local4 in ipairs( f3_arg0._spacerElements ) do
		f3_local4:closeTree()
	end
	f3_arg0._spacerElements = {}
end

local f0_local3 = function ( f4_arg0 )
	assert( f4_arg0._tabManagerDataSource )
	local f4_local0 = f4_arg0._tabManagerDataSource:GetCountValue( f4_arg0._controllerIndex )
	for f4_local1 = 0, f4_local0 - 1, 1 do
		local f4_local4 = f0_local1( f4_arg0, f4_local1 )
		local f4_local5 = f4_arg0._tabManagerDataSource:GetDataSourceAtIndex( f4_local1, f4_arg0._controllerIndex )
		if not f4_local5.disabled then
			f4_local5.disabled = f4_local5.name:GetDataSourceForSubmodel( "disabled", false )
		end
		f4_local4:SetDataSource( f4_local5, f4_arg0._controllerIndex )
	end
end

local f0_local4 = function ( f5_arg0 )
	assert( f5_arg0._tabs )
	local f5_local0 = #f5_arg0._tabs
	for f5_local1 = 1, f5_local0, 1 do
		local f5_local4 = f0_local1( f5_arg0, f5_local1 - 1 )
		f5_local4:SetName( f5_arg0._tabs[f5_local1].name )
		if f5_arg0._tabs[f5_local1].disabled then
			f5_local4:Disable()
		end
	end
end

local f0_local5 = function ( f6_arg0 )
	if f6_arg0._tabManagerDataSource then
		return f6_arg0._tabManagerDataSource:GetCountValue( f6_arg0._controllerIndex )
	elseif f6_arg0._tabs then
		return #f6_arg0._tabs
	else
		
	end
end

local f0_local6 = function ( f7_arg0 )
	if f7_arg0._tabManagerDataSource then
		return f7_arg0._tabManagerDataSource:GetDefaultFocusIndex( f7_arg0._controllerIndex ) or 0
	elseif f7_arg0._tabs then
		for f7_local0 = 1, #f7_arg0._tabs, 1 do
			if f7_arg0._tabs[f7_local0].hasDefaultFocus then
				return f7_local0 - 1
			end
		end
		return 0
	end
end

local f0_local7 = function ( f8_arg0, f8_arg1 )
	if f8_arg0._tabManagerDataSource then
		local f8_local0 = f8_arg0._tabManagerDataSource:GetDataSourceAtIndex( f8_arg1, f8_arg0._controllerIndex )
		assert( f8_local0.focusFunction, "A data source provided to the tab manager needs to have a focusFunction defined at every index." )
		return f8_local0.focusFunction
	elseif f8_arg0._tabs then
		return f8_arg0._tabs[f8_arg1 + 1].focusFunction or function ()
			
		end
		
	else
		
	end
end

local f0_local8 = function ( f10_arg0, f10_arg1 )
	if f10_arg0._tabManagerDataSource then
		local f10_local0 = f10_arg0._tabManagerDataSource:GetDataSourceAtIndex( f10_arg1, f10_arg0._controllerIndex )
		local f10_local1
		if f10_local0.disabled then
			f10_local1 = not f10_local0.disabled:GetValue( f10_arg0._controllerIndex )
		else
			f10_local1 = true
		end
		return f10_local1
	else
		return f10_arg0._tabElements[f10_arg1 + 1]:IsEnabled()
	end
end

local f0_local9 = function ( f11_arg0 )
	f0_local2( f11_arg0 )
	if f11_arg0._tabManagerDataSource then
		f0_local3( f11_arg0 )
	else
		f0_local4( f11_arg0 )
	end
	f11_arg0:FocusTab( f0_local6( f11_arg0 ), FocusType.MenuFlow )
end

local f0_local10 = function ( f12_arg0 )
	assert( f12_arg0.leftShoulderButton )
	assert( f12_arg0.rightShoulderButton )
	if Engine.IsConsoleGame() or Engine.GetProfileData( "gpadEnabled" ) then
		f12_arg0.leftShoulderButton:SetAlpha( 1, 0 )
		f12_arg0.rightShoulderButton:SetAlpha( 1, 0 )
	else
		f12_arg0.leftShoulderButton:SetAlpha( 0, 0 )
		f12_arg0.rightShoulderButton:SetAlpha( 0, 0 )
	end
end

function GetBuildMenuFocusFunction( f13_arg0, f13_arg1 )
	return function ( f14_arg0, f14_arg1, f14_arg2 )
		local f14_local0 = f13_arg0( f14_arg1, f14_arg2 )
		f14_local0.id = "menu" .. f14_arg2
		if f14_arg0.currentMenu then
			f14_arg0.currentMenu:closeTree()
		end
		f14_arg0.menuContainer:addElement( f14_local0 )
		f14_arg0.currentMenu = f14_local0
		if f13_arg1 then
			f13_arg1( f14_local0 )
		end
	end
	
end

function GetDataSourceFocusFunction( f15_arg0 )
	return function ( f16_arg0, f16_arg1, f16_arg2 )
		if not f16_arg0.currentMenu then
			local f16_local0 = f15_arg0( f16_arg1 )
			f16_local0.id = "dataSourceMenu"
			f16_arg0.menuContainer:addElement( f16_local0 )
			f16_arg0.currentMenu = f16_local0
		end
		f16_arg0.currentMenu:SetDataSource( f16_arg0._tabManagerDataSource:GetDataSourceAtIndex( f16_arg2 ), f16_arg1 )
	end
	
end

LUI.TabManager.init = function ( f17_arg0, f17_arg1, f17_arg2 )
	assert( f17_arg2 )
	assert( type( f17_arg2.buildTab ) == "function" )
	assert( type( f17_arg2.controllerIndex ) == "number" )
	local self = assert
	local f17_local1
	if f17_arg2.tabHeight ~= nil and type( f17_arg2.tabHeight ) ~= "number" then
		f17_local1 = false
	else
		f17_local1 = true
	end
	self( f17_local1 )
	self = assert
	if f17_arg2.height ~= nil and type( f17_arg2.height ) ~= "number" then
		f17_local1 = false
	else
		f17_local1 = true
	end
	self( f17_local1 )
	self = assert
	if f17_arg2.dataSource ~= nil and type( f17_arg2.dataSource ) ~= "table" then
		f17_local1 = false
	else
		f17_local1 = true
	end
	self( f17_local1 )
	self = assert
	if f17_arg2.tabs ~= nil and type( f17_arg2.dataSource ) ~= "table" then
		f17_local1 = false
	else
		f17_local1 = true
	end
	self( f17_local1 )
	self = assert
	if f17_arg2.wrap ~= nil and type( f17_arg2.wrap ) ~= "boolean" then
		f17_local1 = false
	else
		f17_local1 = true
	end
	self( f17_local1 )
	f17_arg2.tabHeight = f17_arg2.tabHeight or 52
	f17_arg2.height = f17_arg2.height or f17_arg2.tabHeight
	LUI.TabManager.super.init( f17_arg0, f17_arg1 )
	f17_arg0.id = "tabManager"
	f17_arg0._tabElements = {}
	f17_arg0._spacerElements = {}
	f17_arg0._buildTab = f17_arg2.buildTab
	f17_arg0._buildSpacer = f17_arg2.buildSpacer
	f17_arg0._controllerIndex = f17_arg2.controllerIndex
	self = LUI.UIElement.new()
	self.id = "navigatorContainer"
	f17_arg0.navigatorContainer = self
	f17_arg0:addElement( self )
	f17_local1 = LUI.UIHorizontalList.new( {
		left = 0,
		right = 0,
		top = 0,
		bottom = f17_arg2.height,
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = false,
		alignment = LUI.Alignment.Center,
		spacing = f17_arg2.spacing or 0
	} )
	f17_local1.id = "tabNavigator"
	f17_arg0._tabNavigator = f17_local1
	self:addElement( f17_local1 )
	local f17_local2 = LUI.UIElement.new( {
		left = 0,
		right = 0,
		top = f17_arg2.height,
		bottom = 0,
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true
	} )
	f17_local2.id = "menuContainer"
	f17_arg0.menuContainer = f17_local2
	f17_arg0:addElement( f17_local2 )
	local f17_local3 = 22
	local f17_local4 = (f17_arg2.tabHeight - f17_local3) / 2
	
	local leftShoulderButton = LUI.UIImage.new( {
		top = f17_local4,
		right = 0,
		width = 35.75,
		height = f17_local3,
		leftAnchor = false,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = false,
		material = RegisterMaterial( "button_shoulder_left" )
	} )
	leftShoulderButton:setPriority( -1 )
	leftShoulderButton.id = "leftShoulderButton"
	f17_local1:addElement( leftShoulderButton )
	f17_arg0.leftShoulderButton = leftShoulderButton
	
	local rightShoulderButton = LUI.UIImage.new( {
		top = f17_local4,
		left = 0,
		width = 35.75,
		height = f17_local3,
		leftAnchor = true,
		rightAnchor = false,
		topAnchor = true,
		bottomAnchor = false,
		material = RegisterMaterial( "button_shoulder_right" )
	} )
	rightShoulderButton:setPriority( 1 )
	rightShoulderButton.id = "rightShoulderButton"
	f17_local1:addElement( rightShoulderButton )
	f17_arg0.rightShoulderButton = rightShoulderButton
	
	f0_local10( f17_arg0 )
	if f17_arg2.dataSource then
		f17_arg0:SetTabManagerDataSource( f17_arg2.dataSource )
	elseif f17_arg2.tabs then
		f17_arg0:SetTabs( f17_arg2.tabs )
	end
	local f17_local7 = LUI.UIBindButton.new()
	f17_local7.id = "bindButton"
	f17_local7:registerEventHandler( "button_shoulderl", function ( element, event )
		if not f17_arg0._isAllDisabled then
			local f18_local0 = f17_arg0:GetNextEnabledTab( event.controller, -1, f17_arg2.wrap )
			if f18_local0 then
				f17_arg0:FocusTab( f18_local0, FocusType.Gamepad )
			else
				f17_arg0:playSound( "deny" )
			end
		end
		return true
	end )
	f17_local7:registerEventHandler( "button_shoulderr", function ( element, event )
		if not f17_arg0._isAllDisabled then
			local f19_local0 = f17_arg0:GetNextEnabledTab( event.controller, 1, f17_arg2.wrap )
			if f19_local0 then
				f17_arg0:FocusTab( f19_local0, FocusType.Gamepad )
			else
				f17_arg0:playSound( "deny" )
			end
		end
		return true
	end )
	f17_local7:registerEventHandler( "tab_mouse_select", function ( element, event )
		if not f17_arg0._isAllDisabled and f0_local8( f17_arg0, event.index ) and event.index ~= f17_arg0._currentTab then
			f17_arg0:FocusTab( event.index, FocusType.Gamepad )
		end
	end )
	f17_arg0:addElement( f17_local7 )
	if Engine.IsPC() then
		f17_arg0:registerEventHandler( "refresh_button_helper", function ( element, event )
			f0_local10( f17_arg0 )
		end )
	end
end

LUI.TabManager.GetCurrentTabIndex = function ( f22_arg0 )
	return f22_arg0._currentTab
end

LUI.TabManager.GetTabManagerDataSource = function ( f23_arg0 )
	return f23_arg0._tabManagerDataSource
end

LUI.TabManager.SetTabManagerDataSource = function ( f24_arg0, f24_arg1 )
	f24_arg0._tabManagerDataSource = f24_arg1
	f0_local9( f24_arg0 )
end

LUI.TabManager.SetTabs = function ( f25_arg0, f25_arg1 )
	f25_arg0._tabs = f25_arg1
	f0_local9( f25_arg0 )
end

LUI.TabManager.DisableAll = function ( f26_arg0 )
	f26_arg0._isAllDisabled = true
end

LUI.TabManager.EnableAll = function ( f27_arg0 )
	f27_arg0._isAllDisabled = false
end

LUI.TabManager.HideTabs = function ( f28_arg0 )
	f28_arg0._tabNavigator:SetAlpha( 0 )
	f28_arg0:DisableAll()
end

LUI.TabManager.ShowTabs = function ( f29_arg0 )
	f29_arg0._tabNavigator:SetAlpha( 1 )
	f29_arg0:EnableAll()
end

LUI.TabManager.JustifyTabs = function ( f30_arg0 )
	local f30_local0, f30_local1, f30_local2, f30_local3 = f30_arg0:getLocalRect()
	local f30_local4 = f30_local2 - f30_local0
	local f30_local5, f30_local6, f30_local7, f30_local8 = f30_arg0.leftShoulderButton:getLocalRect()
	f30_local3 = f30_local8
	f30_local2 = f30_local7
	f30_local1 = f30_local6
	f30_local6 = (f30_local2 - f30_local5 + 3) * 2
	f30_local7 = 0
	f30_local8 = 0
	for f30_local12, f30_local13 in ipairs( f30_arg0._tabElements ) do
		local f30_local14, f30_local15, f30_local16, f30_local17 = f30_local13:getLocalRect()
		f30_local3 = f30_local17
		f30_local2 = f30_local16
		f30_local1 = f30_local15
		f30_local7 = f30_local7 + f30_local2 - f30_local14
		f30_local8 = f30_local8 + 1
	end
	f30_local9 = 0
	f30_local10 = 0
	for f30_local14, f30_local15 in ipairs( f30_arg0._spacerElements ) do
		local f30_local16, f30_local17, f30_local18, f30_local19 = f30_local15:getLocalRect()
		f30_local3 = f30_local19
		f30_local2 = f30_local18
		f30_local1 = f30_local17
		f30_local9 = f30_local9 + f30_local2 - f30_local16
		f30_local10 = f30_local10 + 1
	end
	f30_arg0._tabNavigator:SetSpacing( (f30_local4 - f30_local6 + f30_local7 + f30_local9) / (f30_local8 + f30_local10 + 1) )
end

LUI.TabManager.SizeTabsToFit = function ( f31_arg0 )
	local f31_local0, f31_local1, f31_local2, f31_local3 = f31_arg0:getLocalRect()
	local f31_local4 = f31_local2 - f31_local0
	local f31_local5, f31_local6, f31_local7, f31_local8 = f31_arg0.leftShoulderButton:getLocalRect()
	f31_local3 = f31_local8
	f31_local2 = f31_local7
	f31_local1 = f31_local6
	f31_local6 = (f31_local2 - f31_local5 + 3) * 2
	f31_local7 = 0
	for f31_local11, f31_local12 in ipairs( f31_arg0._spacerElements ) do
		local f31_local13, f31_local14, f31_local15, f31_local16 = f31_local12:getLocalRect()
		f31_local3 = f31_local16
		f31_local2 = f31_local15
		f31_local1 = f31_local14
		f31_local7 = f31_local7 + f31_local2 - f31_local13
	end
	f31_local8 = f31_local4 - f31_local6 + f31_local7
	f31_local9 = f0_local5( f31_arg0 )
	f31_local11 = (f31_local8 - 4 * f31_local9) / f31_local9
	for f31_local15, f31_local16 in ipairs( f31_arg0._tabElements ) do
		f31_local16:SetRight( f31_local11 )
	end
end

LUI.TabManager.SetTabSpacing = function ( f32_arg0, f32_arg1 )
	f32_arg0._tabNavigator:SetSpacing( f32_arg1 )
end

LUI.TabManager.FocusTab = function ( f33_arg0, f33_arg1, f33_arg2 )
	f33_arg0:processEvent( {
		name = "focus_tab",
		index = f33_arg1,
		playSound = f33_arg2 == FocusType.Gamepad
	} )
	local f33_local0 = f0_local7( f33_arg0, f33_arg1 )
	f33_arg0._currentTab = f33_arg1
	f33_local0( f33_arg0, f33_arg0._controllerIndex, f33_arg1, f33_arg2 )
	if f33_arg0._tabIndexDataSource then
		f33_arg0._tabIndexDataSource:SetValue( f33_arg0._controllerIndex, f33_arg1 )
	end
	if f33_arg0._tabManagerDataSource then
		f33_arg0:SetDataSource( f33_arg0._tabManagerDataSource:GetDataSourceAtIndex( f33_arg1, f33_arg0._controllerIndex ), f33_arg0._controllerIndex )
	end
end

LUI.TabManager.SetTabManagerDataSourceThroughElement = function ( f34_arg0, f34_arg1, f34_arg2 )
	local f34_local0 = DataLink.new( {
		target = f34_arg0,
		source = f34_arg1,
		relativeDataSourcePath = f34_arg2,
		type = DataLink.TYPES.tabManagerDataSource
	} )
	f34_local0:Link()
	f34_local0:Refresh()
	return f34_local0
end

LUI.TabManager.AddBacker = function ( f35_arg0, f35_arg1 )
	local f35_local0 = nil
	if f35_arg1 then
		f35_local0 = f35_arg1
	else
		f35_local0 = MenuBuilder.BuildRegisteredType( "TabsBacker", {
			controllerIndex = f35_arg0._controllerIndex
		} )
	end
	f35_local0.id = "tabsBacker"
	f35_local0:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * -5, _1080p * 5 )
	f35_local0:setPriority( -1 )
	f35_arg0.navigatorContainer:addElement( f35_local0 )
	f35_arg0._tabsBacker = f35_local0
end

LUI.TabManager.GetNextEnabledTab = function ( f36_arg0, f36_arg1, f36_arg2, f36_arg3 )
	local f36_local0 = f36_arg0._currentTab
	local f36_local1 = nil
	local f36_local2 = f0_local5( f36_arg0 )
	if f36_local2 < 1 then
		return nil
	end
	local f36_local3 = f36_local2 - 1
	while f36_local1 == nil do
		local f36_local4 = f36_local0 + f36_arg2
		if f36_local3 < f36_local4 then
			if f36_arg3 then
				f36_local4 = 0
			else
				return nil
			end
		elseif f36_local4 < 0 then
			if f36_arg3 then
				f36_local4 = f36_local3
			else
				return nil
			end
		end
		if f0_local8( f36_arg0, f36_local4 ) then
			return f36_local4
		elseif f36_local4 == f36_arg0._currentTab then
			return nil
		end
		f36_local0 = f36_local4
	end
	return nil
end

LUI.TabManager.SetTabIndexDataSource = function ( f37_arg0, f37_arg1 )
	f37_arg0._tabIndexDataSource = f37_arg1
end

LUI.TabManager.GetCurrentTabMenu = function ( f38_arg0 )
	assert( f38_arg0.currentMenu )
	return f38_arg0.currentMenu
end

