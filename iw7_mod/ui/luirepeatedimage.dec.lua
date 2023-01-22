LUI.UIRepeatedImage = LUI.Class( LUI.UIElement )
LUI.UIRepeatedImage.build = function ( f1_arg0, f1_arg1 )
	return LUI.UIRepeatedImage.new()
end

LUI.UIRepeatedImage.init = function ( f2_arg0, f2_arg1 )
	LUI.UIElement.init( f2_arg0, f2_arg1 )
	f2_arg0:SetupRepeatedImage()
end

LUI.UIRepeatedImage.id = "LUIRepeatedImage"
