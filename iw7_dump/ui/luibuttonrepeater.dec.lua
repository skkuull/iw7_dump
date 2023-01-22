require( "LUITimer" )

LUI.UIButtonRepeater = LUI.Class( LUI.UIElement )
LUI.UIButtonRepeater.firstDelay = 420
LUI.UIButtonRepeater.delay = 210
LUI.UIButtonRepeater.delayReduction = 25
LUI.UIButtonRepeater.accelInterval = 100
LUI.UIButtonRepeater.minDelay = 33
LUI.UIButtonRepeater.init = function ( f1_arg0, f1_arg1, f1_arg2 )
	if not f1_arg1 then
		f1_arg1 = {
			leftAnchor = true,
			rightAnchor = true,
			topAnchor = true,
			bottomAnchor = true,
			left = 0,
			right = 0,
			top = 0,
			bottom = 0
		}
	end
	LUI.UIElement.init( f1_arg0, f1_arg1 )
	f1_arg0.id = "LUIButtonRepeater"
	f1_arg0:setPriority( -1000 )
	if not f1_arg2 then
		f1_arg2 = {}
	end
	f1_arg0.buttonName = f1_arg2.buttonName
	if type( f1_arg2.event ) == "string" then
		f1_arg0.event = {
			name = f1_arg2.event,
			buttonRepeat = true
		}
	else
		f1_arg2.event.buttonRepeat = true
		f1_arg0.event = f1_arg2.event
	end
	f1_arg0.eventTarget = f1_arg2.eventTarget
	if not Engine.IsConsoleGame() then
		f1_arg0:addEventHandler( "leftmousedown", LUI.UIButtonRepeater.LeftMouseDown )
		f1_arg0:addEventHandler( "leftmouseup", LUI.UIButtonRepeater.LeftMouseUp )
		f1_arg0:SetHandleMouseButton( true )
	end
	f1_arg0:registerEventHandler( "repeat", LUI.UIButtonRepeater.Repeat )
	f1_arg0:registerEventHandler( "accelerate", LUI.UIButtonRepeater.Accelerate )
	f1_arg0:registerEventHandler( "gamepad_button", LUI.UIButtonRepeater.GamepadButton )
end

LUI.UIButtonRepeater.enable = function ( f2_arg0 )
	f2_arg0.m_disabled = false
end

LUI.UIButtonRepeater.disable = function ( f3_arg0 )
	f3_arg0.m_disabled = true
	f3_arg0:cancelRepetition()
end

LUI.UIButtonRepeater.setMinDelay = function ( f4_arg0, f4_arg1 )
	f4_arg0.minDelay = math.max( 1, f4_arg1 )
end

LUI.UIButtonRepeater.LeftMouseDown = function ( f5_arg0, f5_arg1 )
	if "leftmouse" == f5_arg0.buttonName and not f5_arg1.buttonRepeat then
		f5_arg0:cancelRepetition()
		if f5_arg0.m_disabled then
			return false
		end
		f5_arg0.controller = f5_arg1.controller
		local self = LUI.UITimer.new( nil, {
			interval = f5_arg0.firstDelay,
			event = {
				name = "repeat",
				numRepeats = 1
			}
		} )
		f5_arg0:addElement( self )
		f5_arg0.repeatTimer = self
	end
end

LUI.UIButtonRepeater.LeftMouseUp = function ( f6_arg0, f6_arg1 )
	if "leftmouse" == f6_arg0.buttonName and not f6_arg1.buttonRepeat then
		f6_arg0:cancelRepetition()
	end
end

LUI.UIButtonRepeater.GamepadButton = function ( f7_arg0, f7_arg1 )
	if f7_arg1.button == f7_arg0.buttonName and not f7_arg1.buttonRepeat then
		f7_arg0:cancelRepetition()
		if f7_arg0.m_disabled then
			return false
		elseif f7_arg1.down == true then
			f7_arg0.controller = f7_arg1.controller
			local self = LUI.UITimer.new( nil, {
				interval = f7_arg0.firstDelay,
				event = {
					name = "repeat",
					numRepeats = 1
				}
			} )
			f7_arg0:addElement( self )
			f7_arg0.repeatTimer = self
		end
	end
end

LUI.UIButtonRepeater.cancelRepetition = function ( f8_arg0 )
	local f8_local0 = f8_arg0.repeatTimer
	if f8_local0 ~= nil then
		f8_local0:close()
		f8_arg0.repeatTimer = nil
	end
	local f8_local1 = f8_arg0.accelTimer
	if f8_local1 ~= nil then
		f8_local1:close()
		f8_arg0.accelTimer = nil
	end
	f8_arg0.currentDelay = nil
end

LUI.UIButtonRepeater.sendButtonRepeat = function ( f9_arg0 )
	local f9_local0 = f9_arg0.eventTarget
	if f9_local0 == nil then
		f9_local0 = f9_arg0:getParent()
	end
	local f9_local1 = f9_arg0.event
	f9_local1.controller = f9_arg0.controller
	return f9_local0:processEvent( f9_local1 )
end

LUI.UIButtonRepeater.Repeat = function ( f10_arg0, f10_arg1 )
	local f10_local0 = f10_arg0.repeatTimer
	local f10_local1 = f10_arg1.numRepeats
	if f10_arg0.currentDelay == nil then
		f10_local0.interval = f10_arg0.delay
		if f10_arg0.accelTimer == nil then
			local accelTimer = LUI.UITimer.new( nil, {
				interval = f10_arg0.accelInterval,
				event = "accelerate"
			} )
			accelTimer.id = "accelTimer"
			f10_arg0:addElement( accelTimer )
			f10_arg0.accelTimer = accelTimer
			
		end
	else
		f10_local0.interval = f10_arg0.currentDelay
	end
	f10_arg0:sendButtonRepeat()
	f10_arg1.numRepeats = f10_local1 + 1
end

LUI.UIButtonRepeater.Accelerate = function ( f11_arg0, f11_arg1 )
	local f11_local0 = f11_arg0.currentDelay
	if f11_local0 == nil then
		f11_local0 = f11_arg0.delay
	else
		f11_local0 = f11_local0 - f11_arg0.delayReduction
		if f11_local0 < f11_arg0.minDelay then
			f11_local0 = f11_arg0.minDelay
		end
	end
	f11_arg0.currentDelay = f11_local0
end

