LUI.UIBindButton = LUI.Class( LUI.UIElement )
LUI.UIBindButton.GamepadButton = function ( f1_arg0, f1_arg1 )
	if f1_arg1.down == true then
		local f1_local0 = false
		local f1_local1 = {
			controller = f1_arg1.controller,
			qualifier = f1_arg1.qualifier
		}
		if not f1_arg0.disabled then
			f1_local0 = true
			if f1_arg1.button == "primary" then
				f1_local1.name = "button_primary"
			elseif f1_arg1.button == "secondary" then
				f1_local1.name = "button_secondary"
			elseif f1_arg1.button == "alt1" then
				f1_local1.name = "button_alt1"
			elseif f1_arg1.button == "alt2" then
				f1_local1.name = "button_alt2"
			elseif f1_arg1.button == "right_trigger" then
				f1_local1.name = "button_right_trigger"
			elseif f1_arg1.button == "left_trigger" then
				f1_local1.name = "button_left_trigger"
			elseif f1_arg1.button == "shoulderr" then
				f1_local1.name = "button_shoulderr"
			elseif f1_arg1.button == "shoulderl" then
				f1_local1.name = "button_shoulderl"
			elseif f1_arg1.button == "right_stick" then
				f1_local1.name = "button_right_stick"
			elseif f1_arg1.button == "left_stick" then
				f1_local1.name = "button_left_stick"
			elseif f1_arg1.button == "left" then
				f1_local1.name = "button_left"
			elseif f1_arg1.button == "right" then
				f1_local1.name = "button_right"
			elseif f1_arg1.button == "up" then
				f1_local1.name = "button_up"
			elseif f1_arg1.button == "down" then
				f1_local1.name = "button_down"
			elseif f1_arg1.button == "start" then
				f1_local1.name = "button_start"
			elseif f1_arg1.button == "select" then
				f1_local1.name = "button_select"
			elseif f1_arg1.button == "options" then
				f1_local1.name = "button_options"
			else
				f1_local0 = false
			end
		end
		if f1_local0 and f1_arg0:processEvent( f1_local1 ) then
			if f1_arg0.actionSFX then
				Engine.PlaySound( f1_arg0.actionSFX )
			end
			return true
		end
	end
	return f1_arg0:dispatchEventToChildren( f1_arg1 )
end

LUI.UIBindButton.MouseButton = function ( f2_arg0, f2_arg1 )
	local f2_local0 = {
		controller = f2_arg1.controller,
		qualifier = f2_arg1.qualifier
	}
	if not f2_arg0.disabled then
		if f2_arg1.name == "leftmousedown" then
			f2_local0.name = "mouse_primary"
		elseif f2_arg1.name == "rightmousedown" then
			f2_local0.name = "mouse_secondary"
		end
	end
	if f2_arg0:processEvent( f2_local0 ) then
		if f2_arg0.actionSFX then
			Engine.PlaySound( f2_arg0.actionSFX )
		end
		return true
	else
		return f2_arg0:dispatchEventToChildren( f2_arg1 )
	end
end

LUI.UIBindButton.MouseButtonEvent = function ( f3_arg0, f3_arg1 )
	if f3_arg0.handleMouseButton and f3_arg1.name == "mousedown" then
		if f3_arg1.button == "left" and f3_arg0.m_eventHandlers.leftmousedown ~= nil then
			f3_arg0.m_eventHandlers:leftmousedown( {
				name = "leftmousedown",
				controller = f3_arg1.controller,
				root = f3_arg1.root,
				x = mouseX,
				y = mouseY,
				inside = inside
			} )
		end
		if f3_arg1.button == "right" and f3_arg0.m_eventHandlers.rightmousedown ~= nil then
			f3_arg0.m_eventHandlers:rightmousedown( {
				name = "rightmousedown",
				controller = f3_arg1.controller,
				root = f3_arg1.root,
				x = mouseX,
				y = mouseY,
				inside = inside
			} )
		end
	end
end

LUI.UIBindButton.ElementEnable = function ( f4_arg0, f4_arg1 )
	f4_arg0.disabled = nil
end

LUI.UIBindButton.ElementDisable = function ( f5_arg0, f5_arg1 )
	if not f5_arg0._doNotDisable then
		f5_arg0.disabled = true
	end
end

LUI.UIBindButton.AlwaysEnabled = function ( f6_arg0, f6_arg1 )
	if f6_arg1 then
		f6_arg0.disabled = false
	end
	f6_arg0._doNotDisable = f6_arg1
end

LUI.UIBindButton.enable = function ( f7_arg0 )
	f7_arg0:processEvent( {
		name = "enable",
		dispatchChildren = true
	} )
end

LUI.UIBindButton.disable = function ( f8_arg0 )
	f8_arg0:processEvent( {
		name = "disable",
		dispatchChildren = true
	} )
end

LUI.UIBindButton.SetActionSFX = function ( f9_arg0, f9_arg1 )
	f9_arg0.actionSFX = f9_arg1
end

LUI.UIBindButton.build = function ( f10_arg0, f10_arg1 )
	return LUI.UIBindButton.new()
end

LUI.UIBindButton.init = function ( f11_arg0, f11_arg1 )
	LUI.UIElement.init( f11_arg0, f11_arg1 )
	f11_arg0.id = "LUIBindButton"
	f11_arg0.setActionSFX = LUI.UIBindButton.SetActionSFX
	f11_arg0:SetHandleMouseButton( true )
	f11_arg0:registerEventHandlerIfFree( "enable", LUI.UIBindButton.ElementEnable )
	f11_arg0:registerEventHandlerIfFree( "disable", LUI.UIBindButton.ElementDisable )
	f11_arg0:registerEventHandlerIfFree( "popup_active", LUI.UIBindButton.ElementDisable )
	f11_arg0:registerEventHandlerIfFree( "popup_inactive", LUI.UIBindButton.ElementEnable )
	f11_arg0:registerEventHandler( "gamepad_button", LUI.UIBindButton.GamepadButton )
	f11_arg0:registerEventHandler( "mousedown", LUI.UIBindButton.MouseButtonEvent )
	f11_arg0:registerEventHandler( "leftmousedown", LUI.UIBindButton.MouseButton )
	f11_arg0:registerEventHandler( "rightmousedown", LUI.UIBindButton.MouseButton )
end

