LUI.UIButtonCombination = LUI.Class( LUI.UIElement )
LUI.UIButtonCombination.init = function ( f1_arg0, f1_arg1, f1_arg2 )
	LUI.UIElement.init( f1_arg0, f1_arg1 )
	f1_arg0.id = "ButtonCombination"
	assert( f1_arg2 )
	assert( type( f1_arg2.buttonTable == "table" ) )
	assert( type( f1_arg2.interval == "number" ) )
	assert( type( f1_arg2.callback == "function" ) )
	assert( #f1_arg2.buttonTable ~= 1, "Only one button in buttonTable. UIBindButton should be used for handling of a single button press." )
	assert( #f1_arg2.buttonTable > 0, "Not enough buttons in buttonTable." )
	local f1_local0 = assert
	local f1_local1
	if f1_arg2.closeOnSuccess then
		f1_local1 = type( f1_arg2.closeOnSuccess == "boolean" )
	else
		f1_local1 = true
	end
	f1_local0( f1_local1 )
	f1_arg0._buttonTable = f1_arg2.buttonTable
	f1_arg0._interval = f1_arg2.interval
	f1_arg0._callback = f1_arg2.callback
	f1_arg0._closeOnSuccess = f1_arg2.closeOnSuccess or false
	f1_arg0:Reset()
	f1_arg0:addEventHandler( "gamepad_button", LUI.UIButtonCombination.HandleButtonPress )
end

LUI.UIButtonCombination.Reset = function ( f2_arg0 )
	f2_arg0._currentButtonIndex = 0
	f2_arg0._lastButtonPressTime = 0
end

LUI.UIButtonCombination.HandleButtonPress = function ( f3_arg0, f3_arg1 )
	if f3_arg1.down then
		return 
	end
	f3_arg0._currentButtonIndex = f3_arg0._currentButtonIndex + 1
	if f3_arg0._buttonTable[f3_arg0._currentButtonIndex] == f3_arg1.button then
		local f3_local0 = Engine.GetMilliseconds()
		if f3_arg0._currentButtonIndex == 1 then
			f3_arg0._lastButtonPressTime = f3_local0
		elseif f3_local0 - f3_arg0._lastButtonPressTime <= f3_arg0._interval then
			f3_arg0._lastButtonPressTime = f3_local0
			if f3_arg0._currentButtonIndex == #f3_arg0._buttonTable then
				f3_arg0:_callback( f3_arg1.controller )
				f3_arg0:Reset()
				if f3_arg0._closeOnSuccess then
					f3_arg0:closeTree()
				end
			end
		else
			f3_arg0:Reset()
		end
	else
		f3_arg0:Reset()
	end
end

