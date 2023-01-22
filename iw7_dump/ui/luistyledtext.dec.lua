LUI.UIStyledText = LUI.Class( LUI.UIText )
LUI.UIStyledText.AutoScrollStyle = {
	None = 0,
	ScrollH = 1,
	ScrollV = 2
}
LUI.UIStyledText.init = function ( f1_arg0, f1_arg1 )
	LUI.UIStyledText.super.init( f1_arg0, f1_arg1 )
	f1_arg0:SetupStyledText()
end

LUI.UIStyledText.SetDecodeParams = function ( f2_arg0, f2_arg1, f2_arg2, f2_arg3 )
	f2_arg0:SetDecodeLetterLength( f2_arg1 )
	f2_arg0:SetDecodeMaxRandChars( f2_arg2 )
	f2_arg0:SetDecodeUpdatesPerLetter( f2_arg3 )
end

LUI.UIStyledText.setText = function ( f3_arg0, f3_arg1, f3_arg2 )
	f3_arg0:TextUpdate()
	return LUI.UIStyledText.super.setText( f3_arg0, f3_arg1, f3_arg2 )
end

LUI.UIStyledText.id = "LUIStyledText"
