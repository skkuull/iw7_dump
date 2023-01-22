LUI.UIMultiFieldTextRow = LUI.Class( LUI.UIElement )
LUI.UIMultiFieldTextRow.build = function ( f1_arg0, f1_arg1 )
	return LUI.UIMultiFieldTextRow.new()
end

LUI.UIMultiFieldTextRow.init = function ( f2_arg0, f2_arg1 )
	LUI.UIElement.init( f2_arg0, f2_arg1 )
	f2_arg0:SetupMultiFieldTextRow()
end

LUI.UIMultiFieldTextRow.id = "LUIMultiFieldTextRow"
