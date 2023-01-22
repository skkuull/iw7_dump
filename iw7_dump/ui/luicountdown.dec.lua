LUI.UICountdown = LUI.Class( LUI.UIText )
LUI.UICountdown.build = function ( f1_arg0, f1_arg1 )
	return LUI.UICountdown.new( nil, f1_arg1 )
end

LUI.UICountdown.init = function ( f2_arg0, f2_arg1, f2_arg2 )
	LUI.UIElement.init( f2_arg0, f2_arg1 )
	if not f2_arg2 then
		f2_arg2 = {}
	end
	if LUI.UIElement.setupUICountdown ~= nil then
		if f2_arg2.endTime == "round_end" then
			f2_arg0:setupUICountdown()
		else
			f2_arg0:setupUICountdown( f2_arg2.endTime or 0 )
		end
	end
end

LUI.UICountdown.freeze = function ( f3_arg0 )
	f3_arg0.m_frozen = true
end

LUI.UICountdown.unfreeze = function ( f4_arg0 )
	f4_arg0.m_frozen = false
end

LUI.UICountdown.useLocalizedFormat = function ( f5_arg0 )
	f5_arg0.m_useLocalizedCountdownFormat = true
end

LUI.UICountdown.setEndTime = function ( f6_arg0, f6_arg1 )
	if LUI.UIElement.setEndTimeInC ~= nil then
		f6_arg0:setEndTimeInC( f6_arg1 )
		f6_arg0.m_endTimeWasSet = true
	end
end

LUI.UICountdown.setTextStyle = function ( f7_arg0, f7_arg1 )
	f7_arg0.m_textStyle = f7_arg1
end

LUI.UICountdown.id = "LUICountdown"
