local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
helperTextFont = CoD.TextSettings.ButtonHelperFont
CommonEvents = {
	addBackButton = {
		name = "add_button_helper_text",
		button_ref = "button_secondary",
		helper_text = Engine.Localize( "@LUA_MENU_BACK" ),
		side = "right",
		clickable = true,
		priority = -1000
	},
	addActionButton = {
		name = "add_button_helper_text",
		button_ref = "button_primary",
		helper_text = Engine.Localize( "@MENU_CONTINUE" ),
		side = "right",
		clickable = true,
		priority = -1000
	},
	addFriendsButton = {
		name = "add_button_helper_text",
		button_ref = "button_alt2",
		helper_text = Engine.Localize( "@LUA_MENU_FRIENDS" ),
		side = "right",
		clickable = true,
		width = 190,
		pcTextLeft = 42,
		priority = -1000
	},
	removeFriendsButton = {
		name = "add_button_helper_text",
		button_ref = "button_alt2",
		helper_text = ""
	},
	addGameSummaryButton = {
		name = "add_button_helper_text",
		button_ref = "button_select",
		helper_text = Engine.Localize( "@LUA_MENU_MATCH_SUMMARY" ),
		side = "left",
		clickable = true,
		priority = 5
	},
	addAcceptButton = {
		name = "add_button_helper_text",
		button_ref = "button_alt1",
		helper_text = Engine.Localize( "@LUA_MENU_ACCEPT" ),
		side = "right",
		clickable = true,
		priority = -1000
	},
	addDeclineButton = {
		name = "add_button_helper_text",
		button_ref = "button_secondary",
		helper_text = Engine.Localize( "@LUA_MENU_DECLINE" ),
		side = "right",
		clickable = true,
		priority = -1000
	},
	addLeftButton = {
		name = "add_button_helper_text",
		button_ref = "button_shoulderl",
		helper_text = Engine.Localize( "@LUA_MENU_PREV_PAGE" ),
		side = "right",
		clickable = true,
		priority = -1000
	},
	addRightButton = {
		name = "add_button_helper_text",
		button_ref = "button_shoulderr",
		helper_text = Engine.Localize( "@LUA_MENU_NEXT_PAGE" ),
		side = "right",
		clickable = true,
		priority = -1000
	}
}
function sendButtonEvent( f1_arg0, f1_arg1 )
	if f1_arg0.triggers_event and f1_arg1.mouse == true then
		local f1_local0 = {
			name = "gamepad_button",
			immediate = true,
			down = true
		}
		assert( ButtonMap[f1_arg0.triggers_event].raw_button )
		f1_local0.button = ButtonMap[f1_arg0.triggers_event].raw_button
		f1_local0.controller = f1_arg1.controller
		f1_arg0:dispatchEventToRoot( f1_local0 )
	end
end

function getButtonIconText( f2_arg0, f2_arg1 )
	if f2_arg0.useString then
		return Engine.Localize( f2_arg0.string )
	else
		return ""
	end
end

function getButtonIconHeight()
	local f3_local0 = Engine.IsConsoleGame()
	if not f3_local0 then
		f3_local0 = Engine.IsGamepadEnabled() == 1
	end
	local f3_local1
	if f3_local0 then
		f3_local1 = 24
		if not f3_local1 then
		
		else
			return f3_local1
		end
	end
	f3_local1 = helperTextFont.Height
end

f0_local0 = function ( f4_arg0, f4_arg1 )
	local f4_local0, f4_local1, f4_local2, f4_local3 = GetTextDimensions( getButtonIconText( f4_arg0, f4_arg1 ), helperTextFont.Font, getButtonIconHeight() )
	return f4_local2 - f4_local0
end

f0_local1 = function ( f5_arg0 )
	local f5_local0, f5_local1, f5_local2, f5_local3 = GetTextDimensions( ToUpperCase( f5_arg0 ), helperTextFont.Font, helperTextFont.Height )
	return f5_local2 - f5_local0 + 5
end

f0_local2 = 6
function getButtonWidth( f6_arg0, f6_arg1, f6_arg2, f6_arg3 )
	local f6_local0 = f6_arg3
	local f6_local1 = 0
	local f6_local2 = 0
	local f6_local3 = 0
	if f6_arg0 and f6_arg0.useString then
		f6_local1 = f0_local0( f6_arg0, "left" )
	end
	f6_local3 = f0_local1( f6_arg2 )
	if f6_arg1 and f6_arg1.useString then
		f6_local2 = f0_local0( f6_arg1, "right" )
	end
	if not f6_arg3 then
		f6_local0 = f0_local2 + f6_local1 + f6_local3 + f6_local2
	end
	return f6_local0
end

function getButtonTextLeft( f7_arg0, f7_arg1, f7_arg2, f7_arg3 )
	local f7_local0 = 0
	local f7_local1 = 0
	local f7_local2 = 0
	local f7_local3 = 0
	local f7_local4 = 0
	if f7_arg0 and f7_arg0.useString then
		f7_local1 = f0_local0( f7_arg0, "left" )
	end
	f7_local3 = f0_local1( f7_arg2 )
	if f7_arg1 and f7_arg1.useString then
		f7_local2 = f0_local0( f7_arg1, "right" )
	end
	return (f7_arg3 - f0_local2 + f7_local1 + f7_local3 + f7_local2) / 2
end

function isSpecialPCButtonActive( f8_arg0 )
	local f8_local0 = f8_arg0
	local f8_local1
	if Engine.IsSingleplayer() then
		f8_local1 = Engine.InFrontend()
		if f8_local1 then
			f8_local1 = Engine.IsPC()
			if f8_local1 then
				f8_local1 = f8_local0 and Engine.IsGamepadEnabled() ~= 1
			end
		end
	else
		f8_local1 = Engine.IsPC()
		if f8_local1 then
			f8_local1 = f8_local0 and Engine.IsGamepadEnabled() ~= 1
		end
	end
	return f8_local1
end

function getTextDisplayColors( f9_arg0 )
	if isSpecialPCButtonActive( f9_arg0 ) then
		return COLORS.white, COLORS.black
	else
		return SWATCHES.buttonHelper.helperText, COLORS.white
	end
end

local f0_local3 = 0
local f0_local4 = 2
local f0_local5 = 0.6
local f0_local6 = function ( f10_arg0, f10_arg1 )
	local f10_local0 = getButtonIconText( f10_arg0, f10_arg1 )
	local f10_local1 = f0_local0( f10_arg0, f10_arg1 )
	local f10_local2 = getButtonIconHeight()
	local f10_local3 = 0
	if not Engine.IsConsoleGame() and f10_arg0.useString then
		f10_local3 = f0_local3 + f0_local4 + 1
	end
	local self = LUI.UIText.new( CoD.ColorizeState( SWATCHES.buttonHelper.helperText, {
		font = helperTextFont.Font,
		alignment = LUI.Alignment.Center,
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		left = f10_local3,
		width = f10_local1,
		top = -f10_local2 / 2,
		bottom = f10_local2 / 2
	} ) )
	self.id = f10_arg1 .. "Icon"
	self:setText( f10_local0 )
	if not Engine.IsConsoleGame() then
		self:SetWordWrap( false )
		self:SetRGBFromTable( COLORS.white )
		if f10_arg0.useString then
			local f10_local5 = f10_local1 + (f0_local3 + f0_local4) * 2
		end
		f10_local1 = f10_local5 or 0
		f10_local2 = f10_local2 + (f0_local3 + f0_local4) * 2
		local f10_local6 = LUI.UIElement.new( {
			alignment = LUI.Alignment.Center,
			topAnchor = false,
			bottomAnchor = false,
			leftAnchor = true,
			rightAnchor = false,
			left = 0,
			width = f10_local1,
			top = -f10_local2 / 2,
			bottom = f10_local2 / 2
		} )
		f10_local6.id = "buttonContainer"
		local f10_local7 = LUI.UIBorder.new( {
			borderThicknessLeft = _1080p * f0_local4,
			borderThicknessRight = _1080p * f0_local4,
			borderThicknessTop = _1080p * f0_local4,
			borderThicknessBottom = _1080p * f0_local4
		} )
		f10_local7.id = "ButtonBorder"
		if Engine.IsGamepadEnabled() == 1 or not f10_arg0.useString then
			f10_local7:SetAlpha( 0 )
		else
			f10_local7:SetAlpha( f0_local5 )
		end
		f10_local6:addElement( f10_local7 )
		f10_local6:addElement( self )
		f10_local6.ButtonBorder = f10_local7
		f10_local6.icon = self
		return f10_local6
	else
		return self
	end
end

local f0_local7 = function ( f11_arg0 )
	local f11_local0 = f11_arg0 / 2
	if f11_arg0 > 150 then
		f11_local0 = f11_arg0 / 4
	end
	return f11_arg0 - f11_local0
end

local f0_local8 = function ( f12_arg0, f12_arg1, f12_arg2, f12_arg3 )
	local f12_local0 = LUI.Alignment.Left
	local f12_local1 = f0_local1( f12_arg0 )
	if f12_arg2 then
		f12_local0 = LUI.Alignment.Center
		if not isSpecialPCButtonActive( f12_arg3 ) then
			f12_local1 = f0_local7( f12_local1 )
		end
	end
	local f12_local2, f12_local3 = getTextDisplayColors( f12_arg3 )
	local self = LUI.UIText.new( CoD.ColorizeState( f12_local2, {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		left = 0,
		width = f12_local1,
		top = -helperTextFont.Height / 2,
		bottom = helperTextFont.Height / 2,
		font = helperTextFont.Font,
		alignment = f12_local0
	} ) )
	if not f12_arg1 then
		f12_arg1 = ""
	end
	self.id = "helperText" .. f12_arg1
	self.ref = f12_arg1
	self.bothButtonRef = f12_arg2
	self:setText( ToUpperCase( f12_arg0 ) )
	self:SetOptOutRightToLeftAlignmentFlip( true )
	self:SetWordWrap( false )
	self:registerAnimationState( "anim_intro", CoD.ColorizeState( f12_local2, {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
		font = helperTextFont.Font,
		alignment = LUI.Alignment.Left
	} ) )
	self:registerAnimationState( "over", CoD.ColorizeState( f12_local3 ) )
	if useAnimIntro then
		self:animateToState( "anim_intro" )
	else
		self:animateToState( "default" )
	end
	local f12_local5 = MBh.AnimateLoop( {
		{
			"default",
			500
		},
		{
			"flash",
			500
		}
	} )
	if flash then
		self:registerAnimationState( "flash", CoD.ColorizeState( f12_local2 ) )
		f12_local5( self )
	end
	self:registerEventHandler( "button_up", function ( element, event )
		if flash then
			f12_local5( element )
		else
			element:animateToState( "default" )
		end
	end )
	self:registerEventHandler( "button_over", MBh.AnimateToState( "over" ) )
	self:registerEventHandler( "update_existing_helper_text", function ( element, event )
		if element.ref == event.button_ref then
			local f14_local0 = f0_local1( event.helper_text )
			if element.bothButtonRef and not isSpecialPCButtonActive( f12_arg3 ) then
				f14_local0 = f0_local7( f14_local0 )
			end
			local f14_local1, f14_local2 = getTextDisplayColors( f12_arg3 )
			element:setText( ToUpperCase( event.helper_text ) )
			element:registerAnimationState( "default", {
				width = f14_local0,
				color = f14_local1
			} )
			element:registerAnimationState( "over", CoD.ColorizeState( f14_local2 ) )
			element:animateToState( "default" )
		end
	end )
	return self
end

function helperTextItem( f15_arg0, f15_arg1, f15_arg2, f15_arg3, f15_arg4, f15_arg5, f15_arg6, f15_arg7, f15_arg8, f15_arg9, f15_arg10, f15_arg11, f15_arg12, f15_arg13 )
	local f15_local0, f15_local1 = nil
	local f15_local2 = isSpecialPCButtonActive( f15_arg12 )
	if f15_arg0 then
		f15_arg0.useString = not f15_local2
	end
	if f15_arg2 then
		f15_arg2.useString = not f15_local2
	end
	local f15_local3 = function ( f16_arg0 )
		local f16_local0 = nil
		if isSpecialPCButtonActive( f15_arg12 ) then
			f16_local0 = math.max( getButtonWidth( f15_arg0, f15_arg2, f16_arg0, f15_arg4 ) + 16, 160 )
		else
			f16_local0 = getButtonWidth( f15_arg0, f15_arg2, f16_arg0, f15_arg4 )
		end
		return f16_local0
	end
	
	f15_local0 = f15_local3( f15_arg1 )
	local self = LUI.UIButton.new( {
		leftAnchor = true,
		rightAnchor = false,
		topAnchor = true,
		bottomAnchor = true,
		left = 0,
		width = f15_local0,
		top = 0,
		bottom = 0
	} )
	self.id = "helperTextButton"
	self.m_requireFocusType = FocusType.MouseOver
	self.ref = f15_arg3
	self.bothButtonRef = f15_arg11
	self.blockKeyboardSound = true
	if Engine.IsPC() then
		local ButtonBackground = nil
		ButtonBackground = MenuBuilder.BuildRegisteredType( "GenericHelperButtonBackground", {
			controllerIndex = 0
		} )
		ButtonBackground.id = "ButtonBackground"
		ButtonBackground:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
		self:addElement( ButtonBackground )
		self.ButtonBackground = ButtonBackground
		
		if isSpecialPCButtonActive( f15_arg12 ) then
			self.ButtonBackground:SetAlpha( 1, 0 )
		else
			self.ButtonBackground:SetAlpha( 0, 0 )
		end
	end
	self:registerEventHandler( "update_existing_helper_text", function ( element, event )
		if element.ref == event.button_ref then
			if Engine.IsPC() then
				if isSpecialPCButtonActive( f15_arg12 ) then
					self.ButtonBackground:SetAlpha( 1, 0 )
				else
					self.ButtonBackground:SetAlpha( 0, 0 )
				end
			end
			local f17_local0 = f15_arg3 == "button_primary"
			if element.ref == event.button_ref and event.helper_text == "" then
				local f17_local1 = element:getParent()
				f17_local1.currentRefList[event.button_ref] = false
				element:close()
				if f17_local1.storedPrimaryButton and f17_local0 then
					f17_local1.storedPrimaryButton = nil
				end
			elseif element.ref == event.button_ref then
				element:registerAnimationState( "default", {
					width = f15_local3( event.helper_text )
				} )
				element:animateToState( "default" )
			end
		end
	end )
	if f15_arg7 then
		assert( f15_arg8 )
		self:registerEventHandler( "button_action", function ( element, event )
			f15_arg8:processEvent( f15_arg7 )
		end )
	else
		self:registerEventHandler( "button_action", sendButtonEvent )
	end
	if f15_arg6 then
		self:registerEventHandler( "popup_active", nil )
		self:registerEventHandler( "popup_inactive", nil )
	end
	local ButtonBackground = LUI.UIHorizontalList.new( {
		leftAnchor = true,
		rightAnchor = false,
		topAnchor = true,
		bottomAnchor = true,
		left = 0,
		right = f15_local0,
		top = 0,
		bottom = 0,
		spacing = 6
	} )
	ButtonBackground.id = "helperHorizontalList"
	local f15_local6 = function ( f19_arg0, f19_arg1 )
		local f19_local0 = nil
		local f19_local1 = f15_local3( f19_arg1 )
		if isSpecialPCButtonActive( f15_arg12 ) then
			f19_local0 = getButtonTextLeft( f15_arg0, f15_arg2, f19_arg1, f19_local1 )
			if f15_arg13 then
				f19_local0 = f15_arg13
			end
		else
			f19_local1 = getButtonWidth( f15_arg0, f15_arg2, f19_arg1, f15_arg4 )
			f19_local0 = 0
		end
		f19_arg0:SetLeft( f19_local0, 0 )
	end
	
	f15_local6( ButtonBackground, f15_arg1 )
	ButtonBackground:registerEventHandler( "update_existing_helper_text", function ( element, event )
		if self.ref == event.button_ref then
			f15_local6( element, event.helper_text )
		end
	end )
	local f15_local7 = function ( f21_arg0, f21_arg1, f21_arg2 )
		assert( f21_arg0.ButtonBorder )
		assert( f21_arg0.icon )
		local f21_local0 = ""
		if f21_arg1.useString then
			f21_local0 = getButtonIconText( f21_arg1, f21_arg2 )
		end
		local f21_local1 = f0_local0( f21_arg1, f21_arg2 )
		local f21_local2 = getButtonIconHeight()
		if not Engine.IsConsoleGame() then
			if isSpecialPCButtonActive( f15_arg12 ) then
				f21_arg0.icon:registerAnimationState( "default", {
					left = 0,
					width = 0,
					top = -f21_local2 / 2,
					bottom = f21_local2 / 2
				} )
				f21_arg0:registerAnimationState( "default", {
					left = 0,
					width = 0,
					top = -f21_local2 / 2,
					bottom = f21_local2 / 2
				} )
				f21_arg0.icon:setText( f21_local0 )
				f21_arg0.icon:animateToState( "default" )
				f21_arg0:animateToState( "default" )
			else
				local f21_local3 = f0_local3 + f0_local4 + 1
				f21_arg0.icon:registerAnimationState( "default", {
					left = -f21_local1 / 2 + 1,
					width = f21_local1,
					top = -f21_local2 / 2,
					bottom = f21_local2 / 2
				} )
				f21_local1 = f21_local1 + (f0_local3 + f0_local4) * 2
				f21_local2 = f21_local2 + (f0_local3 + f0_local4) * 2
				f21_arg0:registerAnimationState( "default", {
					left = 0,
					width = f21_local1,
					top = -f21_local2 / 2,
					bottom = f21_local2 / 2
				} )
				f21_arg0.icon:setText( f21_local0 )
				f21_arg0.icon:animateToState( "default" )
				f21_arg0:animateToState( "default" )
			end
			if Engine.IsGamepadEnabled() == 1 or not f21_arg1.useString then
				f21_arg0.ButtonBorder:SetAlpha( 0 )
			else
				f21_arg0.ButtonBorder:SetAlpha( f0_local5 )
			end
		else
			f21_arg0:setText( f21_local0 )
			f21_arg0:registerAnimationState( "default", {
				width = f21_local1,
				top = -f21_local2 / 2,
				bottom = f21_local2 / 2
			} )
			f21_arg0:animateToState( "default" )
		end
		self:processEvent( {
			name = "update_existing_helper_text",
			button_ref = f15_arg3,
			helper_text = f15_arg1,
			dispatchChildren = true
		} )
	end
	
	if f15_arg0 then
		local f15_local8 = f0_local6( f15_arg0, "left" )
		f15_local8:registerEventHandler( "refresh_button_helper", function ( element, event )
			f15_arg0.useString = not isSpecialPCButtonActive( f15_arg12 )
			f15_local7( element, f15_arg0, "left" )
		end )
		ButtonBackground:addElement( f15_local8 )
	end
	ButtonBackground:addElement( f0_local8( f15_arg1, f15_arg3, f15_arg11, f15_arg12 ) )
	if f15_arg2 then
		local f15_local8 = f0_local6( f15_arg2, "right" )
		f15_local8:registerEventHandler( "refresh_button_helper", function ( element, event )
			f15_arg2.useString = not isSpecialPCButtonActive( f15_arg12 )
			f15_local7( element, f15_arg2, "right" )
		end )
		ButtonBackground:addElement( f15_local8 )
	end
	self:addElement( ButtonBackground )
	if f15_arg5 then
		self:setPriority( f15_arg5 )
	end
	return self
end

function AddHelperTextObject( f24_arg0, f24_arg1 )
	f24_arg0.currentRefList = f24_arg0.currentRefList or {}
	local f24_local0 = assert
	local f24_local1
	if not f24_arg1.button_ref or f24_arg1.button_ref == "" then
		f24_local1 = f24_arg1.button_ref2
		if f24_local1 then
			if f24_arg1.button_ref2 == "" then
				f24_local1 = false
			else
				f24_local1 = true
			end
		end
	else
		f24_local1 = true
	end
	f24_local0( f24_local1 )
	assert( f24_arg1.helper_text )
	if f24_arg1.button_ref then
		local f24_local2 = f24_arg1.button_ref
		local f24_local3 = f24_arg1.button_ref
	end
	f24_local0 = f24_local2 and f24_local3 or f24_arg1.button_ref2
	if not (f24_arg1.side or f24_arg0.side ~= "left") or f24_arg1.side ~= f24_arg0.side then
		return 
	elseif f24_arg0.currentRefList[f24_local0] then
		f24_arg0:processEvent( {
			name = "update_existing_helper_text",
			button_ref = f24_local0,
			helper_text = f24_arg1.helper_text,
			dispatchChildren = true
		} )
	elseif f24_arg1.helper_text ~= "" then
		local f24_local4 = f24_arg1.ignorePopups or false
		local f24_local5 = f24_arg1.button_ref and ButtonMap[f24_arg1.button_ref] or nil
		local f24_local6 = f24_arg1.button_ref2 and ButtonMap[f24_arg1.button_ref2] or nil
		local f24_local7 = f24_arg1.customEvent or nil
		local f24_local8 = f24_arg1.customEventTarget or nil
		local f24_local9 = f24_arg1.useAnimIntro or nil
		local f24_local10 = f24_arg1.flash or nil
		local f24_local11 = false
		if f24_arg1.button_ref ~= nil and f24_arg1.button_ref2 ~= nil then
			f24_local11 = true
		end
		local f24_local12 = true
		if (not Engine.IsSingleplayer() or Engine.InFrontend()) and Engine.IsGamepadEnabled() ~= 1 then
			if f24_arg1.button_ref == "button_primary" then
				f24_local12 = false
			elseif f24_arg1.clickable and f24_arg1.button_ref == "button_secondary" then
				f24_arg1.priority = -10000
			end
		end
		local f24_local13 = helperTextItem( f24_local5, f24_arg1.helper_text, f24_local6, f24_local0, f24_arg1.width, f24_arg1.priority, f24_local4, f24_local7, f24_local8, f24_local9, f24_local10, f24_local11, f24_arg1.clickable, f24_arg1.pcTextLeft )
		f24_local13.id = f24_local0
		if f24_arg1.clickable == true and ButtonMap[f24_local0] then
			f24_local13.triggers_event = f24_local0
		end
		if Engine.IsConsoleGame() or not f24_arg1.clickable then
			f24_local13:SetFocusable( false )
			f24_local13:SetHandleMouseButton( false )
		end
		if f24_local12 then
			f24_arg0:addElement( f24_local13 )
		else
			f24_arg0.storedPrimaryButton = f24_local13
		end
		f24_arg0.currentRefList[f24_local0] = true
	end
end

function ClearHelperTextObjects( f25_arg0, f25_arg1 )
	if f25_arg1.side == f25_arg0.side or not f25_arg1.side then
		f25_arg0:closeChildren()
	end
end

local f0_local9 = function ( f26_arg0 )
	local self = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = false,
		left = 0,
		right = 0,
		top = 5,
		height = f26_arg0.height
	} )
	self.id = "buttonHelperListContainer"
	local f26_local1 = LUI.UIHorizontalList.new( {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		left = f26_arg0.list_left_inset,
		right = 0,
		top = 0,
		bottom = 0,
		alignment = LUI.Alignment.Left,
		spacing = f26_arg0.spacing
	} )
	f26_local1.id = "buttonHelperLeftList"
	f26_local1.side = "left"
	f26_local1:registerEventHandler( "add_button_helper_text", AddHelperTextObject )
	f26_local1:registerEventHandler( "clear_button_helper_text", ClearHelperTextObjects )
	self:addElement( f26_local1 )
	local f26_local2 = LUI.UIHorizontalList.new( {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		left = 0,
		right = f26_arg0.right_inset,
		top = 0,
		bottom = 0,
		alignment = LUI.Alignment.Right,
		spacing = f26_arg0.spacing
	} )
	f26_local2.id = "buttonHelperRightList"
	f26_local2.side = "right"
	f26_local2:registerEventHandler( "add_button_helper_text", AddHelperTextObject )
	f26_local2:registerEventHandler( "clear_button_helper_text", ClearHelperTextObjects )
	self:addElement( f26_local2 )
	if Engine.IsPC() then
		local f26_local3 = function ( f27_arg0, f27_arg1 )
			if f27_arg0.storedPrimaryButton and Engine.IsGamepadEnabled() == 1 then
				f27_arg0:addElement( f27_arg0.storedPrimaryButton )
				f27_arg0.storedPrimaryButton = nil
			elseif Engine.IsGamepadEnabled() ~= 1 then
				local f27_local0 = f27_arg0:getFirstChild()
				while f27_local0 do
					if f27_local0.ref == "button_primary" then
						f27_arg0.storedPrimaryButton = f27_local0
						f27_arg0:removeElement( f27_local0 )
						break
					end
					f27_local0 = f27_local0:getNextSibling()
				end
			end
		end
		
		f26_local1:registerEventHandler( "refresh_button_helper", f26_local3 )
		f26_local2:registerEventHandler( "refresh_button_helper", f26_local3 )
	end
	return self
end

function buttonHelperTextMain( f28_arg0, f28_arg1 )
	if not f28_arg1 then
		f28_arg1 = {}
	end
	f28_arg1.left_inset = f28_arg1.left_inset or 75
	f28_arg1.right_inset = f28_arg1.right_inset or -75
	local self = f28_arg1.top_margin
	if not self then
		self = GenericFooterDims.TopMargin_WithBackground
	end
	f28_arg1.top_margin = self
	f28_arg1.bottom_margin = f28_arg1.bottom_margin or -35
	self = f28_arg1.height
	if not self then
		self = GenericFooterDims.Height
	end
	f28_arg1.height = self
	f28_arg1.spacing = f28_arg1.spacing or 5
	f28_arg1.hideAlienBar = f28_arg1.hideAlienBar or false
	f28_arg1.background_alpha = f28_arg1.background_alpha or 1
	f28_arg1.list_left_inset = f28_arg1.list_left_inset or 75
	self = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = false,
		bottomAnchor = true,
		left = 0,
		right = 0,
		top = f28_arg1.top_margin,
		bottom = 0,
		alpha = 1
	} )
	self.id = "buttonHelperText"
	self:registerAnimationState( "hidden", {
		alpha = 0
	} )
	self:registerEventHandler( "show_button_helper_text", function ( element, event )
		element:animateToState( "default" )
	end )
	self:registerEventHandler( "hide_button_helper_text", function ( element, event )
		element:animateToState( "hidden" )
	end )
	self:addElement( f0_local9( f28_arg1 ) )
	return self
end

MenuBuilder.registerType( "button_helper_text_main", buttonHelperTextMain )
LockTable( _M )
