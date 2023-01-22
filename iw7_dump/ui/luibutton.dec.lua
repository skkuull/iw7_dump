LUI.UIButton = LUI.Class( LUI.UIElement )
LUI.UIButton.MouseEnter = function ( f1_arg0, f1_arg1 )
	if f1_arg0.m_leftMouseDown == nil then
		if f1_arg0:AcceptsFocusType( FocusType.MouseOver ) and not f1_arg0:isInFocus() then
			if f1_arg0.disabled then
				f1_arg0:processEvent( {
					name = "button_over_disable"
				} )
			else
				f1_arg0:processEvent( {
					name = "button_over",
					controller = f1_arg1.controller,
					focusType = FocusType.MouseOver
				} )
			end
		end
	elseif f1_arg0.m_leftMouseDown ~= nil then
		f1_arg0:processEvent( {
			name = "button_over_down"
		} )
	end
end

LUI.UIButton.MouseLeave = function ( f2_arg0, f2_arg1 )
	if f2_arg0.m_leftMouseDown == nil then
		if f2_arg0._focusable and not f2_arg0:isInFocus() then
			if f2_arg0.disabled then
				f2_arg0:processEvent( {
					name = "button_disable"
				} )
			else
				f2_arg0:processEvent( {
					name = "button_up"
				} )
			end
		end
	else
		f2_arg0:processEvent( {
			name = "button_down"
		} )
	end
end

LUI.UIButton.LeftMouseDown = function ( f3_arg0, f3_arg1 )
	f3_arg0:processEvent( {
		name = "button_over_down",
		controller = f3_arg1.controller
	} )
end

LUI.UIButton.LeftMouseUp = function ( f4_arg0, f4_arg1 )
	if f4_arg1.inside then
		if f4_arg0.disabled then
			f4_arg0:processEvent( {
				name = "button_over_disable"
			} )
		else
			f4_arg0:processEvent( {
				name = "button_over",
				controller = f4_arg1.controller,
				focusType = FocusType.MouseOver
			} )
		end
		if not f4_arg0.disabled then
			if f4_arg0.actionSFX and (not f4_arg0.properties or not f4_arg0.properties.muteAction) then
				Engine.PlaySound( f4_arg0.actionSFX )
			end
			local f4_local0 = f4_arg0:processEvent( {
				name = "button_action",
				controller = f4_arg1.controller,
				mouse = true
			} )
			f4_arg0:processEvent( {
				name = "button_down",
				controller = f4_arg1.controller,
				mouse = true
			} )
			if f4_local0 then
				return f4_local0
			end
		elseif f4_arg0.actionDisabledSFX then
			Engine.PlaySound( f4_arg0.actionDisabledSFX )
		elseif f4_arg0.properties and f4_arg0.properties.disableSound then
			Engine.PlaySound( f4_arg0.properties.disableSound )
		end
		f4_arg0:processEvent( {
			name = "button_action_disable",
			controller = f4_arg1.controller
		} )
	elseif not f4_arg0.disabled then
		f4_arg0:processEvent( {
			name = "button_up"
		} )
	end
end

LUI.UIButton.GamepadButton = function ( f5_arg0, f5_arg1 )
	if not f5_arg0:isInFocus() or f5_arg1.down ~= true then
		return f5_arg0:dispatchEventToChildren( f5_arg1 )
	elseif f5_arg1.qualifier == ButtonQualifiers.Mousewheel then
		return false
	elseif f5_arg1.button == "primary" then
		local f5_local0
		if not f5_arg1.qualifier or f5_arg1.qualifier ~= ButtonQualifiers.Keyboard then
			f5_local0 = false
		else
			f5_local0 = true
		end
		local f5_local1
		if f5_local0 then
			f5_local1 = not f5_arg0.blockKeyboardSound
		else
			f5_local1 = true
		end
		if f5_arg0.actionSFX and (not f5_arg0.properties or not f5_arg0.properties.muteAction) and f5_local1 then
			Engine.PlaySound( f5_arg0.actionSFX )
		end
		if not f5_arg0.disabled then
			f5_arg0:processEvent( {
				name = "button_action",
				controller = f5_arg1.controller,
				keyboard = f5_local0
			} )
			f5_arg0:processEvent( {
				name = "button_down",
				controller = f5_arg1.controller,
				keyboard = f5_local0
			} )
		else
			if f5_arg0.actionDisabledSFX and f5_local1 then
				Engine.PlaySound( f5_arg0.actionDisabledSFX )
			elseif f5_arg0.properties and f5_arg0.properties.disableSound and f5_local1 then
				Engine.PlaySound( f5_arg0.properties.disableSound )
			end
			f5_arg0:processEvent( {
				name = "button_action_disable",
				controller = f5_arg1.controller
			} )
		end
		if f5_arg0.m_eventHandlers.button_action ~= nil then
			return true
		else
			return f5_arg0:dispatchEventToChildren( f5_arg1 )
		end
	elseif f5_arg0:dispatchEventToChildren( f5_arg1 ) then
		return true
	else
		return f5_arg0:FocusNextElement( f5_arg0, f5_arg1.button, FocusType.Gamepad, f5_arg1.qualifier, f5_arg1.controller )
	end
end

LUI.UIButton.SetFocusable = function ( f6_arg0, f6_arg1 )
	f6_arg0._focusable = f6_arg1
end

LUI.UIButton.AcceptsFocusType = function ( f7_arg0, f7_arg1 )
	if not f7_arg0._focusable then
		return false
	elseif f7_arg0.m_requireFocusType then
		return f7_arg1 == f7_arg0.m_requireFocusType
	else
		return true
	end
end

local f0_local0 = function ( f8_arg0 )
	local f8_local0 = f8_arg0
	while f8_local0 do
		if f8_local0.buttonDescription and f8_local0.buttonDescription ~= "" then
			return f8_local0.buttonDescription
		end
		f8_local0 = f8_local0:getParent()
	end
	return nil
end

LUI.UIButton.SetButtonDescription = function ( f9_arg0, f9_arg1 )
	f9_arg0.buttonDescription = f9_arg1
end

LUI.UIButton.GainFocus = function ( f10_arg0, f10_arg1 )
	if f10_arg0:isInFocus() then
		return true
	elseif f10_arg0:AcceptsFocusType( f10_arg1.focusType ) then
		f10_arg0:setFocus( true )
		if f10_arg1.focusType ~= FocusType.MenuFlow and f10_arg0.gainFocusSFX then
			Engine.PlaySound( f10_arg0.gainFocusSFX )
		end
		if f10_arg0.disabled then
			f10_arg0:processEvent( {
				name = "button_over_disable",
				dispatchChildren = true,
				focusType = f10_arg1.focusType
			} )
		else
			f10_arg0:processEvent( {
				name = "button_over",
				controller = f10_arg1.controller,
				dispatchChildren = true,
				focusType = f10_arg1.focusType
			} )
		end
		if f10_arg0:GetCurrentMenu() then
			f10_arg0:dispatchEventToCurrentMenu( {
				name = "update_button_description",
				text = Engine.IsPC() and f0_local0( f10_arg0 ) or f10_arg0.buttonDescription or ""
			} )
			if Engine.IsPC() then
				f10_arg0:dispatchEventToCurrentMenu( {
					name = "update_current_grid_focus",
					child = f10_arg0,
					focusType = f10_arg1.focusType
				} )
			end
		end
		return true
	else
		return false
	end
end

LUI.UIButton.LoseFocus = function ( f11_arg0, f11_arg1 )
	if f11_arg0:isInFocus() then
		f11_arg0:setFocus( false )
		if f11_arg0.disabled then
			f11_arg0:processEvent( {
				name = "button_disable",
				dispatchChildren = true
			} )
		else
			f11_arg0:processEvent( {
				name = "button_up",
				dispatchChildren = true
			} )
		end
	end
end

LUI.UIButton.Up = function ( f12_arg0, f12_arg1 )
	if f12_arg0:isInFocus() then
		f12_arg0:processEvent( {
			name = "gain_focus"
		} )
	end
end

LUI.UIButton.Over = function ( f13_arg0, f13_arg1 )
	if f13_arg0.disabled and f13_arg0:hasAnimationState( "button_over_disabled" ) then
		f13_arg0:animateToState( "button_over_disabled", f13_arg0.disableDuration )
	elseif f13_arg0:hasAnimationState( "button_over" ) then
		f13_arg0:animateToState( "button_over", f13_arg0.overDuration, f13_arg0.overEaseIn, f13_arg0.overEaseOut )
	end
end

LUI.UIButton.ElementUp = function ( f14_arg0, f14_arg1 )
	
end

LUI.UIButton.ElementDown = function ( f15_arg0, f15_arg1 )
	if f15_arg0:hasAnimationState( "button_down" ) then
		f15_arg0:animateToState( "button_down", f15_arg0.downDuration )
	else
		LUI.UIButton.ElementUp( f15_arg0, f15_arg1 )
	end
end

LUI.UIButton.ElementOverDown = function ( f16_arg0, f16_arg1 )
	if f16_arg0:hasAnimationState( "button_over_down" ) then
		f16_arg0:animateToState( "button_over_down", f16_arg0.overDownDuration )
	else
		LUI.UIButton.Over( f16_arg0, f16_arg1 )
	end
end

LUI.UIButton.ElementEnable = function ( f17_arg0, f17_arg1 )
	f17_arg0.disabled = nil
	if f17_arg0:isInFocus() then
		f17_arg0:processEvent( {
			name = "button_over",
			dispatchChildren = true,
			controller = f17_arg1.controller
		} )
	else
		f17_arg0:processEvent( {
			name = "button_up",
			dispatchChildren = true
		} )
	end
	return false
end

LUI.UIButton.ElementDisable = function ( f18_arg0, f18_arg1 )
	f18_arg0.disabled = true
	if f18_arg0:isInFocus() then
		f18_arg0:processEvent( {
			name = "button_over_disable",
			dispatchChildren = true
		} )
	else
		f18_arg0:processEvent( {
			name = "button_disable",
			dispatchChildren = true
		} )
	end
	return false
end

LUI.UIButton.UpdateOutsideList = function ( f19_arg0, f19_arg1 )
	f19_arg0.m_outsideParentList = f19_arg1.outside_list
end

LUI.UIButton.enable = function ( f20_arg0, f20_arg1 )
	f20_arg0:processEvent( {
		name = "enable",
		dispatchChildren = true
	} )
	if f20_arg0:isInFocus() then
		f20_arg0:processEvent( {
			name = "button_over",
			dispatchChildren = true,
			controller = f20_arg1.controller
		} )
	else
		f20_arg0:processEvent( {
			name = "button_up",
			dispatchChildren = true
		} )
	end
end

LUI.UIButton.disable = function ( f21_arg0 )
	f21_arg0:processEvent( {
		name = "disable",
		dispatchChildren = true
	} )
	if f21_arg0:isInFocus() then
		f21_arg0:processEvent( {
			name = "button_over_disable",
			dispatchChildren = true
		} )
	else
		f21_arg0:processEvent( {
			name = "button_disable",
			dispatchChildren = true
		} )
	end
end

LUI.UIButton.SetButtonDisabled = function ( f22_arg0, f22_arg1 )
	if f22_arg1 then
		f22_arg0:disable( {} )
	else
		f22_arg0:enable( {} )
	end
end

LUI.UIButton.IsDisabled = function ( f23_arg0 )
	return f23_arg0.disabled
end

LUI.UIButton.SetupElement = function ( f24_arg0 )
	f24_arg0:registerEventHandlerIfFree( "enable", LUI.UIButton.ElementEnable )
	f24_arg0:registerEventHandlerIfFree( "disable", LUI.UIButton.ElementDisable )
	f24_arg0:registerEventHandlerIfFree( "button_up", LUI.UIButton.Up )
	f24_arg0:registerEventHandlerIfFree( "button_over", LUI.UIButton.Over )
	f24_arg0:registerEventHandlerIfFree( "button_down", LUI.UIButton.ElementDown )
	f24_arg0:registerEventHandlerIfFree( "button_over_down", LUI.UIButton.ElementOverDown )
end

LUI.UIButton.setGainFocusSFX = function ( f25_arg0, f25_arg1 )
	f25_arg0.gainFocusSFX = f25_arg1
end

LUI.UIButton.setActionSFX = function ( f26_arg0, f26_arg1 )
	f26_arg0.actionSFX = f26_arg1
end

LUI.UIButton.setActionDisabledSFX = function ( f27_arg0, f27_arg1 )
	f27_arg0.actionDisabledSFX = f27_arg1
end

LUI.UIButton.build = function ( f28_arg0, f28_arg1 )
	return LUI.UIButton.new()
end

LUI.UIButton.init = function ( f29_arg0, f29_arg1, f29_arg2 )
	LUI.UIElement.init( f29_arg0, f29_arg1 )
	f29_arg0.id = "LUIButton"
	if not f29_arg2 then
		f29_arg2 = {}
	end
	f29_arg0:SetFocusable( true )
	f29_arg0:SetHandleMouse( true )
	f29_arg0.gainFocusSFX = CoD.SFX.MouseOver
	f29_arg0.actionSFX = CoD.SFX.MouseClick
	if not Engine.IsConsoleGame() then
		f29_arg0:registerEventHandler( "mouseenter", LUI.UIButton.MouseEnter )
		f29_arg0:registerEventHandler( "mouseleave", LUI.UIButton.MouseLeave )
		f29_arg0:registerEventHandler( "leftmousedown", LUI.UIButton.LeftMouseDown )
		f29_arg0:registerEventHandler( "leftmouseup", LUI.UIButton.LeftMouseUp )
	end
	f29_arg0:registerEventHandler( "gamepad_button", function ( element, event )
		return element:GamepadButton( event )
	end )
	f29_arg0:registerEventHandler( "gain_focus", function ( element, event )
		return element:GainFocus( event )
	end )
	f29_arg0:registerEventHandler( "lose_focus", function ( element, event )
		return element:LoseFocus( event )
	end )
	f29_arg0:registerEventHandler( "update_outside_list", LUI.UIButton.UpdateOutsideList )
	LUI.UIButton.SetupElement( f29_arg0 )
end

