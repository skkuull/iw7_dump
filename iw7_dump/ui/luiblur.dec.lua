LUI.UIBlur = LUI.Class( LUI.UIElement )
LUI.UIBlur.init = function ( f1_arg0, f1_arg1 )
	LUI.UIBlur.super.init( f1_arg0, f1_arg1 )
	f1_arg0:SetupBlur()
end

LUI.UIBlur.id = "LUIBlur"
