local f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0.currentValue = f1_arg1
	f1_arg0:UpdateContent()
	if f1_arg0.autoFunctionCall then
		f1_arg0.action( f1_arg0.currentValue, f1_arg2 )
	end
end

local f0_local1 = function ( f2_arg0, f2_arg1 )
	if f2_arg0.dividedRangeValue == nil then
		f2_arg1 = f2_arg0.min + f2_arg0.step * math.floor( (f2_arg1 - f2_arg0.min) / f2_arg0.step + 0.5 )
	elseif f2_arg1 < f2_arg0.dividedRangeValue then
		f2_arg1 = f2_arg0.dividedRangeValue - f2_arg0.step * math.floor( (f2_arg0.dividedRangeValue - f2_arg1) / f2_arg0.step + 0.5 )
	elseif f2_arg0.dividedRangeValue < f2_arg1 then
		f2_arg1 = f2_arg0.dividedRangeValue + f2_arg0.dividedRangeStep * math.floor( (f2_arg1 - f2_arg0.dividedRangeValue) / f2_arg0.dividedRangeStep + 0.5 )
	end
	if f2_arg1 < f2_arg0.min then
		f2_arg1 = f2_arg1 + f2_arg0.step
	elseif f2_arg0.max < f2_arg1 then
		if f2_arg0.dividedRangeValue == nil then
			f2_arg1 = f2_arg1 - f2_arg0.step
		else
			f2_arg1 = f2_arg1 - f2_arg0.dividedRangeStep
		end
	end
	return f2_arg1
end

local f0_local2 = function ( f3_arg0, f3_arg1 )
	if f3_arg0.dividedRangeValue == nil then
		return f3_arg1 + f3_arg0.step
	elseif f3_arg0.dividedRangeValue - f3_arg0.step <= f3_arg1 and f3_arg1 < f3_arg0.dividedRangeValue then
		return f3_arg0.dividedRangeValue
	elseif f3_arg1 < f3_arg0.dividedRangeValue then
		return f3_arg1 + f3_arg0.step
	else
		return f3_arg1 + f3_arg0.dividedRangeStep
	end
end

local f0_local3 = function ( f4_arg0, f4_arg1 )
	if f4_arg0.dividedRangeValue == nil then
		return f4_arg1 - f4_arg0.step
	elseif f4_arg0.dividedRangeValue < f4_arg1 and f4_arg1 < f4_arg0.dividedRangeValue + f4_arg0.dividedRangeStep then
		return f4_arg0.dividedRangeValue
	elseif f4_arg1 < f4_arg0.dividedRangeValue then
		return f4_arg1 - f4_arg0.step
	else
		return f4_arg1 - f4_arg0.dividedRangeStep
	end
end

local f0_local4 = function ( f5_arg0, f5_arg1, f5_arg2 )
	assert( f5_arg2.action )
	assert( f5_arg0.min )
	assert( f5_arg0.max )
	assert( f5_arg0.UpdateContent )
	f5_arg0.wrapAround = f5_arg2.wrapAround ~= false
	f5_arg0.autoFunctionCall = f5_arg2.autoFunctionCall ~= false
	f5_arg0.action = f5_arg2.action
	f5_arg0.currentValue = f5_arg2.defaultValue or f5_arg0.min
	f5_arg0.decimalPlacesToRound = f5_arg2.decimalPlacesToRound
	local bindButton = assert
	local f5_local1
	if f5_arg0.min > f5_arg0.currentValue or f5_arg0.currentValue > f5_arg0.max then
		f5_local1 = false
	else
		f5_local1 = true
	end
	bindButton( f5_local1 )
	f5_arg0:UpdateContent()
	if not f5_arg0.wrapAround then
		if f5_arg0.currentValue == f5_arg0.min then
			f5_arg0:processEvent( {
				name = "arrow_button_left_blocked"
			} )
		elseif f5_arg0.currentValue == f5_arg0.max then
			f5_arg0:processEvent( {
				name = "arrow_button_right_blocked"
			} )
		end
	end
	if not f5_arg0.autoFunctionCall then
		f5_arg0:addEventHandler( "button_action", function ( f6_arg0, f6_arg1 )
			f5_arg0.action( f5_arg0.currentValue, f6_arg1.controller )
		end )
	end
	f5_arg0.SetCurrentValue = function ( f7_arg0, f7_arg1 )
		f0_local0( f7_arg0, f7_arg1, f5_arg1 )
	end
	
	if f5_arg0.initialized then
		return true
	elseif not f5_arg0.bindButton then
		bindButton = LUI.UIBindButton.new()
		bindButton.id = "selfBindButton"
		f5_arg0:addElement( bindButton )
		f5_arg0.bindButton = bindButton
		
		f5_arg0.bindButton:registerEventHandler( "enable", function ( element, event )
			
		end )
	end
	f5_arg0.bindButton:ElementDisable()
	f5_arg0:addEventHandler( "gain_focus", function ( f9_arg0, f9_arg1 )
		if not f5_arg0:IsDisabled() then
			f5_arg0.bindButton:ElementEnable()
		end
	end )
	f5_arg0:addEventHandler( "lose_focus", function ( f10_arg0, f10_arg1 )
		f5_arg0.bindButton:ElementDisable()
	end )
	f5_arg0.bindButton:registerEventHandler( "popup_inactive", function ( element, event )
		
	end )
	bindButton = function ( f12_arg0, f12_arg1 )
		local f12_local0 = f0_local3( f5_arg0, f5_arg0.currentValue )
		if f5_arg0.decimalPlacesToRound then
			f12_local0 = LUI.Round( f12_local0, f5_arg0.decimalPlacesToRound )
		end
		f12_local0 = math.max( f5_arg0.min, f12_local0 )
		if f5_arg0.currentValue <= f5_arg0.min then
			if f5_arg0.wrapAround then
				f12_local0 = f5_arg0.max
			else
				return 
			end
		end
		f12_local0 = f0_local1( f5_arg0, f12_local0 )
		if f12_local0 == f5_arg0.min and not f5_arg0.wrapAround then
			f5_arg0:processEvent( {
				name = "arrow_button_left_blocked"
			} )
		else
			f5_arg0:processEvent( {
				name = "arrow_button_left_moved"
			} )
		end
		f5_arg0:processEvent( {
			name = "arrow_button_right_not_blocked"
		} )
		if f5_arg0.fillElement then
			Engine.PlaySound( CoD.SFX.AdjustSlider )
		else
			Engine.PlaySound( CoD.SFX.OtherAdjust )
		end
		f0_local0( f5_arg0, f12_local0, f12_arg1.controller )
		return true
	end
	
	f5_local1 = function ( f13_arg0, f13_arg1 )
		local f13_local0 = f0_local2( f5_arg0, f5_arg0.currentValue )
		if f5_arg0.decimalPlacesToRound then
			f13_local0 = LUI.Round( f13_local0, f5_arg0.decimalPlacesToRound )
		end
		f13_local0 = math.min( f5_arg0.max, f13_local0 )
		if f5_arg0.currentValue == f5_arg0.max then
			if f5_arg0.wrapAround then
				f13_local0 = f5_arg0.min
			else
				return 
			end
		end
		f13_local0 = f0_local1( f5_arg0, f13_local0 )
		if f13_local0 == f5_arg0.max and not f5_arg0.wrapAround then
			f5_arg0:processEvent( {
				name = "arrow_button_right_blocked"
			} )
		else
			f5_arg0:processEvent( {
				name = "arrow_button_right_moved"
			} )
		end
		f5_arg0:processEvent( {
			name = "arrow_button_left_not_blocked"
		} )
		if f5_arg0.fillElement then
			Engine.PlaySound( CoD.SFX.AdjustSlider )
		else
			Engine.PlaySound( CoD.SFX.OtherAdjust )
		end
		f0_local0( f5_arg0, f13_local0, f13_arg1.controller )
		return true
	end
	
	if f5_arg2.enableButtonInput ~= false then
		f5_arg0.bindButton:addEventHandler( "button_left", bindButton )
		f5_arg0.bindButton:addEventHandler( "button_right", f5_local1 )
	end
	f5_arg0:addEventHandler( "left_arrow_clicked", bindButton )
	f5_arg0:addEventHandler( "right_arrow_clicked", f5_local1 )
	local f5_local2 = 250
	if f5_arg0.ArrowLeft then
		local f5_local3, f5_local4 = nil
		f5_local4 = function ()
			if f5_arg0.ArrowLeft.m_mouseOver and f5_arg0.ArrowLeft.m_leftMouseDown and f5_arg0.ArrowLeft:isInFocus() and not f5_arg0.ArrowLeft:IsDisabled() then
				f5_arg0:processEvent( {
					name = "left_arrow_clicked",
					controller = f5_arg1
				} )
				f5_local3 = f5_arg0:Wait( f5_local2 )
				f5_local3.onComplete = f5_local4
			else
				f5_local3 = nil
			end
		end
		
		f5_arg0.ArrowLeft:addEventHandler( "button_over_down", function ()
			if f5_local3 then
				f5_local3.onComplete = function ()
					
				end
				
				f5_local3 = nil
			end
			f5_local4()
		end )
	end
	if f5_arg0.ArrowRight then
		local f5_local3, f5_local4 = nil
		f5_local4 = function ()
			if f5_arg0.ArrowRight.m_mouseOver and f5_arg0.ArrowRight.m_leftMouseDown and f5_arg0.ArrowRight:isInFocus() and not f5_arg0.ArrowRight:IsDisabled() then
				f5_arg0:processEvent( {
					name = "right_arrow_clicked",
					controller = f5_arg1
				} )
				f5_local3 = f5_arg0:Wait( f5_local2 )
				f5_local3.onComplete = f5_local4
			else
				f5_local3 = nil
			end
		end
		
		f5_arg0.ArrowRight:addEventHandler( "button_over_down", function ()
			if f5_local3 then
				f5_local3.onComplete = function ()
					
				end
				
				f5_local3 = nil
			end
			f5_local4()
		end )
	end
	f5_arg0.initialized = true
end

LUI.AddUICustomArrowButtonLogic = function ( f20_arg0, f20_arg1, f20_arg2 )
	assert( f20_arg2.max )
	assert( f20_arg2.min )
	assert( f20_arg2.UpdateContent )
	f20_arg0.max = f20_arg2.max
	f20_arg0.min = f20_arg2.min
	f20_arg0.UpdateContent = f20_arg2.UpdateContent
	f20_arg0.step = f20_arg2.step or 1
	f0_local4( f20_arg0, f20_arg1, f20_arg2 )
end

local f0_local5 = function ( f21_arg0 )
	assert( f21_arg0.updateDuration )
	f21_arg0.Text:setText( f21_arg0.labels[f21_arg0.currentValue], f21_arg0.updateDuration )
end

LUI.AddUIArrowTextButtonLogic = function ( f22_arg0, f22_arg1, f22_arg2 )
	assert( f22_arg2.labels )
	assert( f22_arg0.Text )
	f22_arg0.labels = f22_arg2.labels
	f22_arg0.max = #f22_arg0.labels
	f22_arg0.min = 1
	f22_arg0.step = 1
	f22_arg0.updateDuration = f22_arg2.updateDuration or 0
	f22_arg0.UpdateContent = f22_arg2.UpdateContent or f0_local5
	f22_arg0:SetButtonDisabled( f22_arg0.max == f22_arg0.min )
	f0_local4( f22_arg0, f22_arg1, f22_arg2 )
end

ArrowBarFillDirections = {
	LEFT_TO_RIGHT,
	RIGHT_TO_LEFT
}
local f0_local6 = function ( f23_arg0 )
	local f23_local0 = assert
	local f23_local1
	if f23_arg0.currentValue > f23_arg0.max or f23_arg0.min > f23_arg0.currentValue then
		f23_local1 = false
	else
		f23_local1 = true
	end
	f23_local0( f23_local1 )
	assert( f23_arg0.updateDuration )
	f23_local0 = 0
	if f23_arg0.dividedRangeValue == nil then
		f23_local0 = (f23_arg0.currentValue - f23_arg0.min) / (f23_arg0.max - f23_arg0.min)
	elseif f23_arg0.currentValue <= f23_arg0.dividedRangeValue then
		f23_local0 = (f23_arg0.currentValue - f23_arg0.min) / (f23_arg0.dividedRangeValue - f23_arg0.min) * f23_arg0.dividedRangeFraction
	else
		f23_local0 = (f23_arg0.currentValue - f23_arg0.dividedRangeValue) / (f23_arg0.max - f23_arg0.dividedRangeValue) * (1 - f23_arg0.dividedRangeFraction) + f23_arg0.dividedRangeFraction
	end
	if f23_arg0.direction == ArrowBarFillDirections.LEFT_TO_RIGHT then
		f23_arg0.fillElement:SetAnchors( 0, 1 - f23_local0, 0, 0, f23_arg0.updateDuration )
		if f23_arg0.fillMarkerElement then
			f23_local1, f23_local2, f23_local3, f23_local4 = f23_arg0.fillMarkerElement:getLocalRect()
			local f23_local5 = (f23_local3 / _1080p - f23_local1 / _1080p) / 2
			f23_arg0.fillMarkerElement:SetAnchorsAndPosition( f23_local0, 1 - f23_local0, 0, 0, _1080p * -f23_local5, _1080p * f23_local5, 0, 0 )
		end
	else
		f23_arg0.fillElement:SetAnchors( 1 - f23_local0, 0, 0, 0, f23_arg0.updateDuration )
		if f23_arg0.fillMarkerElement then
			f23_local1, f23_local2, f23_local3, f23_local4 = f23_arg0.fillMarkerElement:getLocalRect()
			local f23_local5 = (f23_local3 / _1080p - f23_local1 / _1080p) / 2
			f23_arg0.fillMarkerElement:SetAnchorsAndPosition( 1 - f23_local0, f23_local0, 0, 0, _1080p * -f23_local5, _1080p * f23_local5, 0, 0 )
		end
	end
	if f23_arg0.showTextLabel then
		f23_arg0.Text:setText( string.format( "%.2f", f23_arg0.currentValue ), f23_arg0.updateDuration )
		ACTIONS.AnimateSequence( f23_arg0, "ShowNumberLabel" )
	end
end

local f0_local7 = function ( f24_arg0, f24_arg1 )
	local f24_local0 = f24_arg1.percent
	local f24_local1 = f24_arg0.min
	if f24_arg0.dividedRangeValue == nil then
		f24_local1 = Lerp( f24_local0, f24_arg0.min, f24_arg0.max )
	elseif f24_local0 <= f24_arg0.dividedRangeFraction then
		f24_local1 = Lerp( f24_local0 / f24_arg0.dividedRangeFraction, f24_arg0.min, f24_arg0.dividedRangeValue )
	else
		f24_local1 = Lerp( (f24_local0 - f24_arg0.dividedRangeFraction) / (1 - f24_arg0.dividedRangeFraction), f24_arg0.dividedRangeValue, f24_arg0.max )
	end
	if f24_arg0.decimalPlacesToRound ~= nil then
		f24_local1 = LUI.Round( f24_local1, f24_arg0.decimalPlacesToRound )
	end
	if f24_arg0.snapToStep then
		f24_local1 = f0_local1( f24_arg0, f24_local1 )
	end
	f24_local1 = LUI.clamp( f24_local1, f24_arg0.min, f24_arg0.max )
	if f24_local1 == f24_arg0.min and not f24_arg0.wrapAround then
		f24_arg0:processEvent( {
			name = "arrow_button_left_blocked"
		} )
	else
		f24_arg0:processEvent( {
			name = "arrow_button_left_not_blocked"
		} )
	end
	if f24_local1 == f24_arg0.max and not f24_arg0.wrapAround then
		f24_arg0:processEvent( {
			name = "arrow_button_right_blocked"
		} )
	else
		f24_arg0:processEvent( {
			name = "arrow_button_right_not_blocked"
		} )
	end
	f24_arg0:SetCurrentValue( f24_local1 )
end

LUI.AddMouseSliderLogic = function ( f25_arg0 )
	local f25_local0 = function ( f26_arg0, f26_arg1 )
		if not f26_arg0:IsDisabled() then
			local f26_local0 = f26_arg0:getWidth()
			local f26_local1, f26_local2, f26_local3, f26_local4 = f26_arg0:getRect()
			f26_local1, f26_local2 = f26_arg1.root:PixelsToUnits( f26_local1, f26_local2 )
			local f26_local5, f26_local6 = f26_arg1.root:PixelsToUnits( f26_arg1.x, f26_arg1.y )
			f26_arg0:dispatchEventToParent( {
				name = "set_bar_fill_percent",
				percent = LUI.clamp( (f26_local5 - f26_local1) / f26_local0, 0, 1 )
			} )
		end
	end
	
	f25_arg0.GenericFillBar:SetHandleMouse( true )
	f25_arg0.GenericFillBar:registerEventHandler( "leftmousedown", f25_local0 )
	f25_arg0.GenericFillBar:registerEventHandler( "mousedrag", f25_local0 )
end

LUI.AddUIArrowFillBarButtonLogic = function ( f27_arg0, f27_arg1, f27_arg2 )
	assert( f27_arg2.fillElement )
	assert( f27_arg2.max )
	assert( f27_arg2.min )
	f27_arg0.fillElement = f27_arg2.fillElement
	f27_arg0.fillMarkerElement = f27_arg2.fillMarkerElement
	f27_arg0.max = f27_arg2.max
	f27_arg0.min = f27_arg2.min
	f27_arg0.step = f27_arg2.step or 1
	if Engine.IsPC() and f27_arg2.pcstep then
		f27_arg0.step = f27_arg2.pcstep
	end
	if f27_arg2.snapToStep == nil then
		f27_arg0.snapToStep = Engine.IsPC()
	else
		f27_arg0.snapToStep = f27_arg2.snapToStep
	end
	local f27_local0 = f27_arg2.direction
	if not f27_local0 then
		f27_local0 = ArrowBarFillDirections.LEFT_TO_RIGHT
	end
	f27_arg0.direction = f27_local0
	f27_local0 = assert
	local f27_local1
	if f27_arg0.direction ~= ArrowBarFillDirections.LEFT_TO_RIGHT and f27_arg0.direction ~= ArrowBarFillDirections.RIGHT_TO_LEFT then
		f27_local1 = false
	else
		f27_local1 = true
	end
	f27_local0( f27_local1 )
	f27_arg0.updateDuration = f27_arg2.updateDuration or 0
	f27_arg0.UpdateContent = f27_arg2.UpdateContent or f0_local6
	f27_arg0.showTextLabel = f27_arg2.showTextLabel
	f27_arg0.dividedRangeValue = f27_arg2.dividedRangeValue
	f27_arg0.dividedRangeFraction = f27_arg2.dividedRangeFraction or 0.5
	f27_arg0.dividedRangeStep = f27_arg2.dividedRangeStep or f27_arg0.step
	f27_local0 = assert
	if f27_arg0.dividedRangeValue ~= nil and (f27_arg0.min >= f27_arg0.dividedRangeValue or f27_arg0.dividedRangeValue >= f27_arg0.max) then
		f27_local1 = false
	else
		f27_local1 = true
	end
	f27_local0( f27_local1 )
	f27_local0 = assert
	if f27_arg0.dividedRangeFraction <= 0 or f27_arg0.dividedRangeFraction >= 1 then
		f27_local1 = false
	else
		f27_local1 = true
	end
	f27_local0( f27_local1 )
	f0_local4( f27_arg0, f27_arg1, f27_arg2 )
	f27_arg0:registerEventHandler( "set_bar_fill_percent", f0_local7 )
end

