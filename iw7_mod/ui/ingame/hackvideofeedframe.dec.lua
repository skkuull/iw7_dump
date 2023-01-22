local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function HackVideoFeedFrame( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 450 * _1080p, 0, 250 * _1080p )
	self.id = "HackVideoFeedFrame"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local FrameCornerTL = nil
	
	FrameCornerTL = MenuBuilder.BuildRegisteredType( "FrameCorner", {
		controllerIndex = f1_local1
	} )
	FrameCornerTL.id = "FrameCornerTL"
	FrameCornerTL:SetRGBFromTable( SWATCHES.HUD.stable, 0 )
	FrameCornerTL:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 20, 0, _1080p * 70 )
	self:addElement( FrameCornerTL )
	self.FrameCornerTL = FrameCornerTL
	
	local FrameCornerBR = nil
	
	FrameCornerBR = MenuBuilder.BuildRegisteredType( "FrameCorner", {
		controllerIndex = f1_local1
	} )
	FrameCornerBR.id = "FrameCornerBR"
	FrameCornerBR:SetRGBFromTable( SWATCHES.HUD.stable, 0 )
	FrameCornerBR:SetAnchorsAndPosition( 1, 0, 1, 0, 0, _1080p * -20, 0, _1080p * -70 )
	self:addElement( FrameCornerBR )
	self.FrameCornerBR = FrameCornerBR
	
	local FrameCornerTR = nil
	
	FrameCornerTR = MenuBuilder.BuildRegisteredType( "FrameCorner", {
		controllerIndex = f1_local1
	} )
	FrameCornerTR.id = "FrameCornerTR"
	FrameCornerTR:SetRGBFromTable( SWATCHES.HUD.stable, 0 )
	FrameCornerTR:SetAlpha( 0.8, 0 )
	FrameCornerTR:SetAnchorsAndPosition( 1, 0, 0, 1, 0, _1080p * -20, 0, _1080p * 70 )
	self:addElement( FrameCornerTR )
	self.FrameCornerTR = FrameCornerTR
	
	local FrameCornerBL = nil
	
	FrameCornerBL = MenuBuilder.BuildRegisteredType( "FrameCorner", {
		controllerIndex = f1_local1
	} )
	FrameCornerBL.id = "FrameCornerBL"
	FrameCornerBL:SetRGBFromTable( SWATCHES.HUD.stable, 0 )
	FrameCornerBL:SetAlpha( 0.8, 0 )
	FrameCornerBL:SetAnchorsAndPosition( 0, 1, 1, 0, 0, _1080p * 20, 0, _1080p * -70 )
	self:addElement( FrameCornerBL )
	self.FrameCornerBL = FrameCornerBL
	
	local NodeTL = nil
	
	NodeTL = LUI.UIImage.new()
	NodeTL.id = "NodeTL"
	NodeTL:SetRGBFromTable( SWATCHES.HUD.stable, 0 )
	NodeTL:SetAlpha( 0.8, 0 )
	NodeTL:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 20, _1080p * 24, _1080p * 20, _1080p * 24 )
	self:addElement( NodeTL )
	self.NodeTL = NodeTL
	
	local NodeTR = nil
	
	NodeTR = LUI.UIImage.new()
	NodeTR.id = "NodeTR"
	NodeTR:SetRGBFromTable( SWATCHES.HUD.stable, 0 )
	NodeTR:SetAlpha( 0.8, 0 )
	NodeTR:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -24, _1080p * -20, _1080p * 20, _1080p * 24 )
	self:addElement( NodeTR )
	self.NodeTR = NodeTR
	
	local NodeBL = nil
	
	NodeBL = LUI.UIImage.new()
	NodeBL.id = "NodeBL"
	NodeBL:SetRGBFromTable( SWATCHES.HUD.stable, 0 )
	NodeBL:SetAlpha( 0.8, 0 )
	NodeBL:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 20, _1080p * 24, _1080p * -24, _1080p * -20 )
	self:addElement( NodeBL )
	self.NodeBL = NodeBL
	
	local NodeBR = nil
	
	NodeBR = LUI.UIImage.new()
	NodeBR.id = "NodeBR"
	NodeBR:SetRGBFromTable( SWATCHES.HUD.stable, 0 )
	NodeBR:SetAlpha( 0.8, 0 )
	NodeBR:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -24, _1080p * -20, _1080p * -24, _1080p * -20 )
	self:addElement( NodeBR )
	self.NodeBR = NodeBR
	
	local Accent = nil
	
	Accent = LUI.UIImage.new()
	Accent.id = "Accent"
	Accent:SetRGBFromTable( SWATCHES.HUD.stable, 0 )
	Accent:SetAlpha( 0.6, 0 )
	Accent:setImage( RegisterMaterial( "hud_pip_lt_fluff" ), 0 )
	Accent:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 2, _1080p * 10, _1080p * -128, _1080p * 128 )
	self:addElement( Accent )
	self.Accent = Accent
	
	local DigiText1 = nil
	
	DigiText1 = MenuBuilder.BuildRegisteredType( "UITechyDigits", {
		digits = 8,
		minValue = 0,
		maxValue = 100000000,
		longWait = 340,
		shortWaitMin = 20,
		shortWaitMax = 60,
		pulsesMin = 3,
		pulsesMax = 7,
		controllerIndex = f1_local1
	} )
	DigiText1.id = "DigiText1"
	DigiText1:SetRGBFromTable( SWATCHES.HUD.stable, 0 )
	DigiText1:SetAlpha( 0.8, 0 )
	DigiText1:SetFontSize( 16 * _1080p )
	DigiText1:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	DigiText1:SetAlignment( LUI.Alignment.Right )
	DigiText1:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -100, _1080p * -30, _1080p * 15, _1080p * 31 )
	self:addElement( DigiText1 )
	self.DigiText1 = DigiText1
	
	local DigiText2 = nil
	
	DigiText2 = MenuBuilder.BuildRegisteredType( "UITechyDigits", {
		digits = 6,
		minValue = 0,
		maxValue = 100000000,
		longWait = 300,
		shortWaitMin = 15,
		shortWaitMax = 40,
		pulsesMin = 2,
		pulsesMax = 11,
		controllerIndex = f1_local1
	} )
	DigiText2.id = "DigiText2"
	DigiText2:SetRGBFromTable( SWATCHES.HUD.stable, 0 )
	DigiText2:SetAlpha( 0.8, 0 )
	DigiText2:SetFontSize( 12 * _1080p )
	DigiText2:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	DigiText2:SetAlignment( LUI.Alignment.Right )
	DigiText2:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -70, _1080p * -30, _1080p * -29, _1080p * -17 )
	self:addElement( DigiText2 )
	self.DigiText2 = DigiText2
	
	local ContentLabel = nil
	
	ContentLabel = LUI.UIText.new()
	ContentLabel.id = "ContentLabel"
	ContentLabel:SetRGBFromTable( SWATCHES.HUD.stable, 0 )
	ContentLabel:SetAlpha( 0.8, 0 )
	ContentLabel:setText( "UNN CONFIDENTIAL CONTENT", 0 )
	ContentLabel:SetFontSize( 12 * _1080p )
	ContentLabel:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	ContentLabel:SetAlignment( LUI.Alignment.Left )
	ContentLabel:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 30, _1080p * 150, _1080p * -29, _1080p * -17 )
	self:addElement( ContentLabel )
	self.ContentLabel = ContentLabel
	
	local IncomingTransmissionText = nil
	
	IncomingTransmissionText = LUI.UIStyledText.new()
	IncomingTransmissionText.id = "IncomingTransmissionText"
	IncomingTransmissionText:SetRGBFromTable( SWATCHES.HUD.stable, 0 )
	IncomingTransmissionText:SetAlpha( 0.8, 0 )
	IncomingTransmissionText:setText( ToUpperCase( "Incoming Transmission" ), 0 )
	IncomingTransmissionText:SetFontSize( 16 * _1080p )
	IncomingTransmissionText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	IncomingTransmissionText:SetAlignment( LUI.Alignment.Left )
	IncomingTransmissionText:SetDecodeLetterLength( 120 )
	IncomingTransmissionText:SetDecodeMaxRandChars( 3 )
	IncomingTransmissionText:SetDecodeUpdatesPerLetter( 8 )
	IncomingTransmissionText:SetDecodeUseSystemTime( false )
	IncomingTransmissionText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 30, _1080p * 230, _1080p * 15, _1080p * 31 )
	self:addElement( IncomingTransmissionText )
	self.IncomingTransmissionText = IncomingTransmissionText
	
	return self
end

MenuBuilder.registerType( "HackVideoFeedFrame", HackVideoFeedFrame )
LockTable( _M )
