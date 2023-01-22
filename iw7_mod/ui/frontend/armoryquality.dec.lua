local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.QualityImage )
	assert( f1_arg0.QualityName )
	assert( f1_arg0.Blur )
	f1_arg0.QualityImage:setImage( RegisterMaterial( f1_arg2.image ) )
	f1_arg0.QualityImage:SetRGBFromTable( f1_arg2.color )
	f1_arg0.QualityName:SetRGBFromTable( f1_arg2.color )
	f1_arg0.QualityName:setText( ToUpperCase( f1_arg2.name ) )
	DebugPrint( "---------| Color: " .. tostring( f1_arg2.color ) )
	f1_arg0.Blur:SetRGBFromTable( f1_arg2.color )
end

f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2 )
	f2_arg0.SetupQuality = f0_local0
end

function ArmoryQuality( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 298.5 * _1080p, 0, 40 * _1080p )
	self.id = "ArmoryQuality"
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local Blur = nil
	
	Blur = LUI.UIBlur.new()
	Blur.id = "Blur"
	Blur:SetRGBFromInt( 12566463, 0 )
	Blur:SetBlurStrength( 2.75, 0 )
	self:addElement( Blur )
	self.Blur = Blur
	
	local DarkenDivider = nil
	
	DarkenDivider = LUI.UIImage.new()
	DarkenDivider.id = "DarkenDivider"
	DarkenDivider:SetRGBFromTable( SWATCHES.HUD.background, 0 )
	DarkenDivider:SetAlpha( 0.4, 0 )
	DarkenDivider:SetBlendMode( BLEND_MODE.blend )
	self:addElement( DarkenDivider )
	self.DarkenDivider = DarkenDivider
	
	local QualityImage = nil
	
	QualityImage = LUI.UIImage.new()
	QualityImage.id = "QualityImage"
	QualityImage:SetScale( -0.25, 0 )
	QualityImage:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -299.25, _1080p * -254.25, _1080p * -22.5, _1080p * 22.5 )
	self:addElement( QualityImage )
	self.QualityImage = QualityImage
	
	local QualityName = nil
	
	QualityName = LUI.UIStyledText.new()
	QualityName.id = "QualityName"
	QualityName:setText( "", 0 )
	QualityName:SetFontSize( 24 * _1080p )
	QualityName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	QualityName:SetAlignment( LUI.Alignment.Left )
	QualityName:SetOptOutRightToLeftAlignmentFlip( true )
	QualityName:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 43.25, _1080p * 23.25, _1080p * -12, _1080p * 12 )
	self:addElement( QualityName )
	self.QualityName = QualityName
	
	f0_local1( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "ArmoryQuality", ArmoryQuality )
LockTable( _M )
