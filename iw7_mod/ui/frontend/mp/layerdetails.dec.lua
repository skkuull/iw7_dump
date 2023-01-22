local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function LayerDetails( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 325 * _1080p, 0, 219 * _1080p )
	self.id = "LayerDetails"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local ListBlur = nil
	
	ListBlur = LUI.UIBlur.new()
	ListBlur.id = "ListBlur"
	ListBlur:SetRGBFromTable( SWATCHES.CAC.BarracksBlurDark, 0 )
	ListBlur:SetBlurStrength( 2.75, 0 )
	self:addElement( ListBlur )
	self.ListBlur = ListBlur
	
	local black = nil
	
	black = LUI.UIImage.new()
	black.id = "black"
	black:SetRGBFromInt( 0, 0 )
	black:SetAlpha( 0.8, 0 )
	black:SetDotPitchEnabled( true )
	black:SetDotPitchX( 0, 0 )
	black:SetDotPitchY( 0, 0 )
	black:SetDotPitchContrast( 0, 0 )
	black:SetDotPitchMode( 0 )
	black:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 24 )
	self:addElement( black )
	self.black = black
	
	local Title = nil
	
	Title = LUI.UIText.new()
	Title.id = "Title"
	Title:setText( Engine.Localize( "MP_EMBLEM_EDITOR_LAYER_DETAILS" ), 0 )
	Title:SetFontSize( 19 * _1080p )
	Title:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Title:SetAlignment( LUI.Alignment.Left )
	Title:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 8, _1080p * -8, _1080p * 2.5, _1080p * 21.5 )
	self:addElement( Title )
	self.Title = Title
	
	local Position = nil
	
	Position = LUI.UIStyledText.new()
	Position.id = "Position"
	Position:setText( ToUpperCase( Engine.Localize( "MP_EMBLEM_EDITOR_POSITION" ) ), 0 )
	Position:SetFontSize( 19 * _1080p )
	Position:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Position:SetAlignment( LUI.Alignment.Left )
	Position:SetStartupDelay( 1000 )
	Position:SetLineHoldTime( 400 )
	Position:SetAnimMoveTime( 150 )
	Position:SetEndDelay( 1000 )
	Position:SetCrossfadeTime( 400 )
	Position:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	Position:SetMaxVisibleLines( 1 )
	Position:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 8, _1080p * 152.63, _1080p * 85.75, _1080p * 104.75 )
	self:addElement( Position )
	self.Position = Position
	
	local Rotation = nil
	
	Rotation = LUI.UIText.new()
	Rotation.id = "Rotation"
	Rotation:setText( ToUpperCase( Engine.Localize( "MP_EMBLEM_EDITOR_ROTATION" ) ), 0 )
	Rotation:SetFontSize( 19 * _1080p )
	Rotation:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Rotation:SetAlignment( LUI.Alignment.Left )
	Rotation:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 8, _1080p * 152.63, _1080p * 166.25, _1080p * 185.25 )
	self:addElement( Rotation )
	self.Rotation = Rotation
	
	local Scale = nil
	
	Scale = LUI.UIStyledText.new()
	Scale.id = "Scale"
	Scale:setText( ToUpperCase( Engine.Localize( "MP_EMBLEM_EDITOR_SCALE" ) ), 0 )
	Scale:SetFontSize( 19 * _1080p )
	Scale:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Scale:SetAlignment( LUI.Alignment.Left )
	Scale:SetStartupDelay( 1000 )
	Scale:SetLineHoldTime( 400 )
	Scale:SetAnimMoveTime( 150 )
	Scale:SetEndDelay( 1000 )
	Scale:SetCrossfadeTime( 400 )
	Scale:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	Scale:SetMaxVisibleLines( 1 )
	Scale:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 8, _1080p * 152.63, _1080p * 109.5, _1080p * 128.5 )
	self:addElement( Scale )
	self.Scale = Scale
	
	local Opacity = nil
	
	Opacity = LUI.UIText.new()
	Opacity.id = "Opacity"
	Opacity:setText( ToUpperCase( Engine.Localize( "MP_EMBLEM_EDITOR_OPACITY" ) ), 0 )
	Opacity:SetFontSize( 19 * _1080p )
	Opacity:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Opacity:SetAlignment( LUI.Alignment.Left )
	Opacity:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 8, _1080p * 152.63, _1080p * 188.75, _1080p * 207.75 )
	self:addElement( Opacity )
	self.Opacity = Opacity
	
	local PositionValue = nil
	
	PositionValue = LUI.UIText.new()
	PositionValue.id = "PositionValue"
	PositionValue:SetFontSize( 19 * _1080p )
	PositionValue:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	PositionValue:SetAlignment( LUI.Alignment.Left )
	PositionValue:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 158.63, _1080p * 317, _1080p * 86.5, _1080p * 105.5 )
	PositionValue:SubscribeToModelThroughElement( self, "position", function ()
		local f2_local0 = self:GetDataSource()
		f2_local0 = f2_local0.position:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			PositionValue:setText( f2_local0, 0 )
		end
	end )
	self:addElement( PositionValue )
	self.PositionValue = PositionValue
	
	local ScaleValue = nil
	
	ScaleValue = LUI.UIText.new()
	ScaleValue.id = "ScaleValue"
	ScaleValue:SetFontSize( 19 * _1080p )
	ScaleValue:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ScaleValue:SetAlignment( LUI.Alignment.Left )
	ScaleValue:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 158.63, _1080p * 317, _1080p * 109.5, _1080p * 128.5 )
	ScaleValue:SubscribeToModelThroughElement( self, "scale", function ()
		local f3_local0 = self:GetDataSource()
		f3_local0 = f3_local0.scale:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			ScaleValue:setText( f3_local0, 0 )
		end
	end )
	self:addElement( ScaleValue )
	self.ScaleValue = ScaleValue
	
	local RotationValue = nil
	
	RotationValue = LUI.UIText.new()
	RotationValue.id = "RotationValue"
	RotationValue:SetFontSize( 19 * _1080p )
	RotationValue:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	RotationValue:SetAlignment( LUI.Alignment.Left )
	RotationValue:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 158.63, _1080p * 317, _1080p * 167, _1080p * 186 )
	RotationValue:SubscribeToModelThroughElement( self, "rotation", function ()
		local f4_local0 = self:GetDataSource()
		f4_local0 = f4_local0.rotation:GetValue( f1_local1 )
		if f4_local0 ~= nil then
			RotationValue:setText( f4_local0, 0 )
		end
	end )
	self:addElement( RotationValue )
	self.RotationValue = RotationValue
	
	local OpacityValue = nil
	
	OpacityValue = LUI.UIText.new()
	OpacityValue.id = "OpacityValue"
	OpacityValue:SetFontSize( 19 * _1080p )
	OpacityValue:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	OpacityValue:SetAlignment( LUI.Alignment.Left )
	OpacityValue:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 158.63, _1080p * 317, _1080p * 189.5, _1080p * 208.5 )
	OpacityValue:SubscribeToModelThroughElement( self, "opacity", function ()
		local f5_local0 = self:GetDataSource()
		f5_local0 = f5_local0.opacity:GetValue( f1_local1 )
		if f5_local0 ~= nil then
			OpacityValue:setText( AddPercentSymbol( f5_local0 ), 0 )
		end
	end )
	self:addElement( OpacityValue )
	self.OpacityValue = OpacityValue
	
	local blacklineCopy0 = nil
	
	blacklineCopy0 = LUI.UIImage.new()
	blacklineCopy0.id = "blacklineCopy0"
	blacklineCopy0:SetRGBFromInt( 0, 0 )
	blacklineCopy0:SetAlpha( 0.14, 0 )
	blacklineCopy0:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 79.63, _1080p * -74.37, _1080p * 71.17, _1080p * 72.25 )
	self:addElement( blacklineCopy0 )
	self.blacklineCopy0 = blacklineCopy0
	
	local blacklineCopy1 = nil
	
	blacklineCopy1 = LUI.UIImage.new()
	blacklineCopy1.id = "blacklineCopy1"
	blacklineCopy1:SetRGBFromInt( 0, 0 )
	blacklineCopy1:SetAlpha( 0.14, 0 )
	blacklineCopy1:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 79.63, _1080p * -74.37, _1080p * 148.17, _1080p * 149.25 )
	self:addElement( blacklineCopy1 )
	self.blacklineCopy1 = blacklineCopy1
	
	local f1_local16 = nil
	if Engine.InFrontend() then
		f1_local16 = LUI.UIImage.new()
		f1_local16.id = "DropShadow"
		f1_local16:SetRGBFromInt( 0, 0 )
		f1_local16:SetAlpha( 0.3, 0 )
		f1_local16:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
		f1_local16:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, 0, _1080p * 4 )
		self:addElement( f1_local16 )
		self.DropShadow = f1_local16
	end
	return self
end

MenuBuilder.registerType( "LayerDetails", LayerDetails )
LockTable( _M )
