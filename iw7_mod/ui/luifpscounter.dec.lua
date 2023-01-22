LUI.UIFPSCounter = LUI.Class( LUI.UIElement )
LUI.UIFPSCounter.init = function ( f1_arg0, f1_arg1 )
	LUI.UIFPSCounter.super.init( f1_arg0, f1_arg1 )
	f1_arg0:SetupFPSCounter( f1_arg1 )
end

LUI.UIFPSCounter.id = "LUIFPSCounter"
