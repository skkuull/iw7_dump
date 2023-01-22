local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0.Red.ValueName:setText( Engine.Localize( "MP_EMBLEM_EDITOR_RED" ), 0 )
	f1_arg0.Green.ValueName:setText( Engine.Localize( "MP_EMBLEM_EDITOR_GREEN" ), 0 )
	f1_arg0.Blue.ValueName:setText( Engine.Localize( "MP_EMBLEM_EDITOR_BLUE" ), 0 )
	LUI.AddUIArrowFillBarButtonLogic( f1_arg0.Red, f1_arg1, {
		decimalPlacesToRound = 2,
		action = function ( f2_arg0, f2_arg1 )
			if EmblemEditor.colorPickerMode == EmblemEditor.ColorPickerMode.COLOR_MIXER then
				EmblemEditor.SetLayerColorRed( f2_arg1, f2_arg0 )
				EmblemEditor.ResetLayerMaterial( f2_arg1 )
				EmblemEditor.SetLayerMaterial( f2_arg1, -1 )
			end
		end,
		defaultValue = 0,
		wrapAround = false,
		max = 255,
		min = 0,
		step = 1,
		fillElement = f1_arg0.Red.GenericFillBar.Fill,
		fillMarkerElement = f1_arg0.Red.GenericFillBar.SliderFillBarMarker
	} )
	LUI.AddUIArrowFillBarButtonLogic( f1_arg0.Green, f1_arg1, {
		decimalPlacesToRound = 2,
		action = function ( f3_arg0, f3_arg1 )
			if EmblemEditor.colorPickerMode == EmblemEditor.ColorPickerMode.COLOR_MIXER then
				EmblemEditor.SetLayerColorGreen( f3_arg1, f3_arg0 )
				EmblemEditor.ResetLayerMaterial( f3_arg1 )
				EmblemEditor.SetLayerMaterial( f3_arg1, -1 )
			end
		end,
		defaultValue = 0,
		wrapAround = false,
		max = 255,
		min = 0,
		step = 1,
		fillElement = f1_arg0.Green.GenericFillBar.Fill,
		fillMarkerElement = f1_arg0.Green.GenericFillBar.SliderFillBarMarker
	} )
	LUI.AddUIArrowFillBarButtonLogic( f1_arg0.Blue, f1_arg1, {
		decimalPlacesToRound = 2,
		action = function ( f4_arg0, f4_arg1 )
			if EmblemEditor.colorPickerMode == EmblemEditor.ColorPickerMode.COLOR_MIXER then
				EmblemEditor.SetLayerColorBlue( f4_arg1, f4_arg0 )
				EmblemEditor.ResetLayerMaterial( f4_arg1 )
				EmblemEditor.SetLayerMaterial( f4_arg1, -1 )
			end
		end,
		defaultValue = 0,
		wrapAround = false,
		max = 255,
		min = 0,
		step = 1,
		fillElement = f1_arg0.Blue.GenericFillBar.Fill,
		fillMarkerElement = f1_arg0.Blue.GenericFillBar.SliderFillBarMarker
	} )
	f1_arg0:SubscribeToModelThroughElement( f1_arg0, "color", function ()
		local f5_local0 = f1_arg0:GetDataSource()
		f5_local0 = f5_local0.color:GetValue( f1_arg1 )
		local f5_local1 = GetColorTableFromIntColor( f5_local0 )
		f1_arg0.Red:SetValue( f5_local1.r * 255 )
		f1_arg0.Green:SetValue( f5_local1.g * 255 )
		f1_arg0.Blue:SetValue( f5_local1.b * 255 )
		f1_arg0.SelectedColor:SetRGBFromInt( f5_local0 )
		f1_arg0.Red.GenericFillBar.Fill:SetRGBFromInt( GetIntForColor( {
			r = f5_local1.r,
			g = 0,
			b = 0
		} ) )
		f1_arg0.Green.GenericFillBar.Fill:SetRGBFromInt( GetIntForColor( {
			r = 0,
			g = f5_local1.g,
			b = 0
		} ) )
		f1_arg0.Blue.GenericFillBar.Fill:SetRGBFromInt( GetIntForColor( {
			r = 0,
			g = 0,
			b = f5_local1.b
		} ) )
	end )
end

function ColorMixerPanel( menu, controller )
	local self = LUI.UIVerticalNavigator.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 462 * _1080p, 0, 186 * _1080p )
	self.id = "ColorMixerPanel"
	local f6_local1 = controller and controller.controllerIndex
	if not f6_local1 and not Engine.InFrontend() then
		f6_local1 = self:getRootController()
	end
	assert( f6_local1 )
	local f6_local2 = self
	local SelectedColor = nil
	
	SelectedColor = LUI.UIImage.new()
	SelectedColor.id = "SelectedColor"
	SelectedColor:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 59, 0, _1080p * 186 )
	self:addElement( SelectedColor )
	self.SelectedColor = SelectedColor
	
	local Red = nil
	
	Red = MenuBuilder.BuildRegisteredType( "ColorMixerColorSlider", {
		controllerIndex = f6_local1
	} )
	Red.id = "Red"
	Red:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 62, _1080p * 462, _1080p * 7, _1080p * 52 )
	self:addElement( Red )
	self.Red = Red
	
	local Green = nil
	
	Green = MenuBuilder.BuildRegisteredType( "ColorMixerColorSlider", {
		controllerIndex = f6_local1
	} )
	Green.id = "Green"
	Green:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 62, _1080p * 462, _1080p * 70.5, _1080p * 115.5 )
	self:addElement( Green )
	self.Green = Green
	
	local Blue = nil
	
	Blue = MenuBuilder.BuildRegisteredType( "ColorMixerColorSlider", {
		controllerIndex = f6_local1
	} )
	Blue.id = "Blue"
	Blue:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 62, _1080p * 462, _1080p * 134, _1080p * 179 )
	self:addElement( Blue )
	self.Blue = Blue
	
	PostLoadFunc( self, f6_local1, controller )
	return self
end

MenuBuilder.registerType( "ColorMixerPanel", ColorMixerPanel )
LockTable( _M )
