LUI.UIBorder = LUI.Class( LUI.UIElement )
LUI.UIBorder.init = function ( f1_arg0, f1_arg1 )
	LUI.UIBorder.super.init( f1_arg0, f1_arg1 )
	f1_arg0:SetupBorder( f1_arg1 )
end

LUI.UIBorder.id = "LUIBorder"
