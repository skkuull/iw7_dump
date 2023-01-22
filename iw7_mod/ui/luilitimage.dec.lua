LUI.UILitImage = LUI.Class( LUI.UIElement )
LUI.UILitImage.build = function ( f1_arg0, f1_arg1 )
	return LUI.UILitImage.new()
end

LUI.UILitImage.init = function ( f2_arg0, f2_arg1 )
	LUI.UIElement.init( f2_arg0, f2_arg1 )
	f2_arg0:setupUILitImage()
end

LUI.UILitImage.id = "LUILitImage"
