LUI.UIImage = LUI.Class( LUI.UIElement )
LUI.UIImage.build = function ( f1_arg0, f1_arg1 )
	return LUI.UIImage.new()
end

LUI.UIImage.init = function ( f2_arg0, f2_arg1 )
	LUI.UIElement.init( f2_arg0, f2_arg1 )
	f2_arg0:setupUIImage()
end

LUI.UIImage.id = "LUIImage"
