LUI.UITechyDigits = LUI.Class( LUI.UIText )
LUI.UITechyDigits.build = function ( f1_arg0, f1_arg1 )
	return LUI.UITechyDigits.new( nil, f1_arg1 )
end

LUI.UITechyDigits.init = function ( f2_arg0, f2_arg1, f2_arg2 )
	if not f2_arg2 then
		f2_arg2 = {}
	end
	LUI.UIText.init( f2_arg0, f2_arg1 )
	if LUI.UIElement.setupTechyDigits then
		f2_arg0:setupTechyDigits()
	end
	f2_arg0.digits = f2_arg2.digits or 8
	f2_arg0.minValue = f2_arg2.minValue or 0
	f2_arg0.maxValue = f2_arg2.maxValue or 100000000
	f2_arg0.longWait = f2_arg2.longWait or 340
	f2_arg0.shortWaitMin = f2_arg2.shortWaitMin or 20
	f2_arg0.shortWaitMax = f2_arg2.shortWaitMax or 60
	f2_arg0.pulsesMin = f2_arg2.pulsesMin or 3
	f2_arg0.pulsesMax = f2_arg2.pulsesMax or 7
end

LUI.UITechyDigits.id = "UITechyDigits"
