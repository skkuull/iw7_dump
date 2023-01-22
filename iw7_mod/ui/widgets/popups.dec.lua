local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
Popups = {
	PopupYesActionAttempts = {
		0,
		0,
		0
	}
}
f0_local0 = function ( f1_arg0, f1_arg1 )
	local f1_local0 = f1_arg1.controllerIndex
	if not f1_local0 then
		DebugPrint( "Warning: opening popup for unspecified controllerIndex, defaulting to 0" )
		f1_local0 = 0
	end
	local frame = MenuBuilder.BuildRegisteredType( "PopupFrame", {
		controllerIndex = f1_local0,
		hideBackground = f1_arg1.hideBackground
	} )
	assert( frame.MeasureTitle )
	if Engine.IsAliensMode() then
		frame = MenuBuilder.BuildRegisteredType( "PopupFrameZm", {
			controllerIndex = f1_local0
		} )
	end
	local f1_local2 = f1_arg1.title
	if not f1_local2 then
		f1_local2 = Engine.Localize( "MENU_NOTICE" )
	end
	local f1_local3 = f1_arg1.width
	if not f1_local3 then
		f1_local3 = LUI.clamp( frame:MeasureTitle( f1_local2 ) + 60, 430, 1200 )
	end
	local f1_local4 = f1_arg1.spacing or 4
	local f1_local5 = f1_arg1.yOffset or 0
	local f1_local6 = f1_arg1.cancelClosesPopup ~= false
	local f1_local7 = f1_arg1.cancelAction
	local f1_local8 = f1_arg1.listContent or {}
	local self = LUI.UIElement.new( {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0
	} )
	self.id = "screen"
	local f1_local10 = LUI.UIElement.new( {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		top = f1_local5,
		bottom = f1_local5,
		left = -f1_local3 / 2,
		right = f1_local3 / 2
	} )
	f1_local10.id = "PopupList"
	self:addElement( f1_local10 )
	local f1_local11 = LUI.UIVerticalList.new( {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0,
		spacing = f1_local4
	}, {
		adjustSizeToContent = true,
		ignoreStretchingChildren = true
	} )
	f1_local11:SetAlignment( LUI.Alignment.Middle )
	f1_local10:addElement( f1_local11 )
	assert( frame.SetTitle )
	frame:SetTitle( f1_local2 )
	frame:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	f1_local11:addElement( frame )
	self.frame = frame
	
	for f1_local15, f1_local16 in ipairs( f1_arg1.listContent ) do
		f1_local11:addElement( f1_local16 )
	end
	f1_local12 = LUI.UIBindButton.new()
	f1_local12.id = "bindButton"
	f1_local12:registerEventHandler( "button_secondary", function ( element, event )
		if f1_local7 then
			f1_local7( element, event.controller )
		end
		if f1_local6 then
			LUI.FlowManager.RequestLeaveMenu( element, true )
		end
		return true
	end )
	self:addElement( f1_local12 )
	return self
end

f0_local1 = function ( f3_arg0 )
	return function ( f4_arg0, f4_arg1 )
		if #f3_arg0.listContent > 0 then
			return f3_arg0.listContent[f4_arg1]
		else
			
		end
	end
	
end

f0_local2 = function ( f5_arg0, f5_arg1 )
	local f5_local0 = Engine.GetMilliseconds() - f5_arg1
	local f5_local1 = 0
	for f5_local2 = 1, math.min( #Popups.PopupYesActionAttempts, f5_arg0 ), 1 do
		if f5_local0 < Popups.PopupYesActionAttempts[f5_local2] then
			f5_local1 = f5_local1 + 1
		end
	end
	if f5_arg0 <= f5_local1 then
		return true
	end
	table.insert( Popups.PopupYesActionAttempts, Engine.GetMilliseconds() )
	if f5_arg0 < #Popups.PopupYesActionAttempts then
		table.remove( Popups.PopupYesActionAttempts, 1 )
	end
	return false
end

local f0_local3 = function ( f6_arg0, f6_arg1 )
	local f6_local0 = f6_arg1.message or "Default popup message"
	local f6_local1 = f6_arg1.buttons or {}
	local f6_local2 = f6_arg1.buttonsClosePopup ~= false
	local f6_local3 = f6_arg1.defaultFocusIndex
	local f6_local4 = f6_arg1.statusMessage
	local f6_local5 = f6_arg1.blockSoundOnButtonClose
	local f6_local6 = f6_arg1.controllerIndex
	if not f6_local6 then
		DebugPrint( "Warning: opening popup for unspecified controllerIndex" )
		f6_local6 = 0
	end
	local f6_local7 = {
		controllerIndex = f6_local6,
		title = f6_arg1.title,
		width = f6_arg1.width,
		cancelClosesPopup = f6_arg1.cancelClosesPopup,
		cancelAction = f6_arg1.cancelAction,
		yOffset = f6_arg1.yOffset,
		hideBackground = f6_arg1.hideBackground,
		listContent = {}
	}
	if #f6_local0 > 0 then
		local self = LUI.UIText.new( {
			alignment = LUI.Alignment.Center,
			font = FONTS.GetFont( FONTS.MainMedium.File ),
			topAnchor = true,
			bottomAnchor = false,
			leftAnchor = true,
			rightAnchor = true,
			left = 0,
			top = 0,
			right = 0,
			height = 32 * _1080p
		} )
		self.id = "message"
		self:setText( f6_local0 )
		table.insert( f6_local7.listContent, self )
	end
	if f6_local4 ~= nil then
		local self = LUI.UIText.new( {
			alignment = LUI.Alignment.Center,
			font = FONTS.GetFont( FONTS.MainMedium.File ),
			topAnchor = true,
			bottomAnchor = false,
			leftAnchor = true,
			rightAnchor = true,
			left = 0,
			top = 0,
			right = 0,
			height = 10
		} )
		self.id = "submessage"
		self:setText( f6_local4 )
		table.insert( f6_local7.listContent, self )
	end
	local self = false
	for f6_local12, f6_local13 in ipairs( f6_arg1.buttons ) do
		assert( type( f6_local13.label ) == "string" )
		assert( type( f6_local13.action ) == "function" )
		local f6_local14 = MenuBuilder.BuildRegisteredType( "PopupButton", {
			controllerIndex = f6_local6
		} )
		f6_local14.listDefaultFocus = f6_local12 == f6_local3
		f6_local14:SetLeftAnchor( 0 )
		f6_local14:SetRightAnchor( 0 )
		f6_local14:SetLeft( 0 )
		f6_local14:SetRight( 0 )
		f6_local14.id = "button_" .. f6_local12
		assert( f6_local14.SetText )
		f6_local14:SetText( f6_local13.label )
		f6_local14:addEventHandler( "button_action", function ( f7_arg0, f7_arg1 )
			assert( f7_arg1.controller )
			local f7_local0 = false
			if f6_arg1.rateLimited then
				f7_local0 = f0_local2( f6_arg1.rateLimitAttempts, f6_arg1.rateLimitIntervalMS )
			end
			if not f7_local0 then
				f6_local13.action( f7_arg0, f7_arg1.controller )
				if f6_local2 then
					LUI.FlowManager.RequestLeaveMenu( f7_arg0, true, f6_local5 )
				end
			end
		end )
		if f6_local13.disabled then
			f6_local14:SetButtonDisabled( true )
		end
		if f6_local13.buttonDescription then
			f6_local14.buttonDescription = f6_local13.buttonDescription
			self = true
		end
		table.insert( f6_local7.listContent, f6_local14 )
	end
	if self then
		f6_local9 = MenuBuilder.BuildRegisteredType( "ButtonDescriptionText", {
			controllerIndex = f6_local6
		} )
		f6_local9.id = "buttonDescription"
		f6_local9:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, 0 )
		f6_local9.Description:SetRightAnchor( 0 )
		f6_local9.Description:SetRight( 0 )
		table.insert( f6_local7.listContent, f6_local9 )
	end
	f6_local9 = MenuBuilder.BuildRegisteredType( "PopupList", f6_local7 )
	f6_local9.GetButton = f0_local1( f6_local7 )
	return f6_local9
end

local f0_local4 = function ( f8_arg0, f8_arg1 )
	local f8_local0 = {
		controllerIndex = f8_arg1.controllerIndex,
		title = f8_arg1.title,
		width = f8_arg1.width,
		message = f8_arg1.message,
		defaultFocusIndex = f8_arg1.defaultFocusIndex or 2,
		cancelClosesPopup = true,
		buttonsClosePopup = true,
		cancelAction = f8_arg1.noAction,
		yOffset = f8_arg1.yOffset,
		blockSoundOnButtonClose = f8_arg1.blockSoundOnButtonClose ~= false,
		statusMessage = f8_arg1.statusMessage
	}
	local f8_local1 = {}
	local f8_local2 = {}
	local f8_local3 = f8_arg1.yesLabel
	if not f8_local3 then
		f8_local3 = Engine.Localize( "LUA_MENU_YES" )
	end
	f8_local2.label = f8_local3
	f8_local2.action = f8_arg1.yesAction or function ( f9_arg0 )
		
	end
	
	f8_local3 = {}
	local f8_local4 = f8_arg1.noLabel
	if not f8_local4 then
		f8_local4 = Engine.Localize( "LUA_MENU_NO" )
	end
	f8_local3.label = f8_local4
	f8_local3.action = f8_arg1.noAction or function ( f10_arg0 )
		
	end
	
	f8_local1[1] = f8_local2
	f8_local1[2] = f8_local3
	f8_local0.buttons = f8_local1
	f8_local0.rateLimited = f8_arg1.rateLimited
	f8_local0.rateLimitIntervalMS = f8_arg1.rateLimitIntervalMS
	f8_local0.rateLimitAttempts = f8_arg1.rateLimitAttempts
	return MenuBuilder.BuildRegisteredType( "PopupMessageAndButtons", f8_local0 )
end

local f0_local5 = function ( f11_arg0, f11_arg1 )
	local f11_local0 = {
		controllerIndex = f11_arg1.controllerIndex,
		title = f11_arg1.title,
		width = f11_arg1.width,
		message = f11_arg1.message,
		statusMessage = f11_arg1.statusMessage,
		cancelClosesPopup = true,
		buttonsClosePopup = true,
		cancelAction = f11_arg1.action,
		yOffset = f11_arg1.yOffset
	}
	local f11_local1 = {}
	local f11_local2 = {}
	local f11_local3 = f11_arg1.label
	if not f11_local3 then
		f11_local3 = Engine.Localize( "MENU_EXIT" )
	end
	f11_local2.label = f11_local3
	f11_local2.action = f11_arg1.action or function ( f12_arg0 )
		
	end
	
	f11_local1[1] = f11_local2
	f11_local0.buttons = f11_local1
	return MenuBuilder.BuildRegisteredType( "PopupMessageAndButtons", f11_local0 )
end

MenuBuilder.registerType( "PopupList", f0_local0 )
MenuBuilder.registerType( "PopupMessageAndButtons", f0_local3 )
MenuBuilder.registerType( "PopupYesNo", f0_local4 )
MenuBuilder.registerType( "PopupOK", f0_local5 )
LockTable( _M )
