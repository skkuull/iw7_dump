LUI.UILongCountdown = LUI.Class( LUI.UIText )
LUI.UILongCountdown.build = function ( f1_arg0, f1_arg1 )
	return LUI.UILongCountdown.new( nil, f1_arg1 )
end

LUI.UILongCountdown.init = function ( f2_arg0, f2_arg1, f2_arg2 )
	LUI.UIElement.init( f2_arg0, f2_arg1 )
	if not f2_arg2 then
		f2_arg2 = {}
	end
	if LUI.UIElement.setupUILongCountdown ~= nil then
		f2_arg0:setupUILongCountdown( f2_arg2.endTime )
	end
	if f2_arg2.endTime then
		f2_arg0:setEndTime( f2_arg2.endTime )
	end
	f2_arg0.m_localizedFormatString = "LUA_MENU_MP_COUNTDOWN_DAYS"
	if Engine.IsAliensMode() then
		f2_arg0.m_localizedFormatString = "ZM_CONTRACTS_COUNTDOWN_DAYS"
	end
end

LUI.UILongCountdown.setEndTime = function ( f3_arg0, f3_arg1 )
	if LUI.UIElement.setEndTimeInC ~= nil then
		f3_arg0:setEndTimeInC( f3_arg1 )
	end
end

LUI.UILongCountdown.useLocalizedFormat = function ( f4_arg0 )
	f4_arg0.m_useLocalizedCountdownFormat = true
end

LUI.UILongCountdown.setLocalizedFormatString = function ( f5_arg0, f5_arg1 )
	f5_arg0.m_localizedFormatString = f5_arg1
end

LUI.UILongCountdown.setTextStyle = function ( f6_arg0, f6_arg1 )
	f6_arg0.m_textStyle = f6_arg1
end

LUI.UILongCountdown.id = "LUICountdown"
