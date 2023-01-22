local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function GenericItemInfo( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 950 * _1080p, 0, 140 * _1080p )
	self.id = "GenericItemInfo"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Background = nil
	
	Background = MenuBuilder.BuildRegisteredType( "GenericItemInfoBG", {
		controllerIndex = f1_local1
	} )
	Background.id = "Background"
	Background.WhiteOverlay:SetAlpha( 0.25, 0 )
	Background:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local BodyText = nil
	
	BodyText = LUI.UIStyledText.new()
	BodyText.id = "BodyText"
	BodyText:setText( "", 0 )
	BodyText:SetFontSize( 22 * _1080p )
	BodyText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	BodyText:SetAlignment( LUI.Alignment.Left )
	BodyText:SetOptOutRightToLeftAlignmentFlip( true )
	BodyText:SetStartupDelay( 1500 )
	BodyText:SetLineHoldTime( 1500 )
	BodyText:SetAnimMoveTime( 3000 )
	BodyText:SetEndDelay( 1000 )
	BodyText:SetCrossfadeTime( 500 )
	BodyText:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollV )
	BodyText:SetMaxVisibleLines( 3 )
	BodyText:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 18, _1080p * -50, _1080p * 69, _1080p * 91 )
	self:addElement( BodyText )
	self.BodyText = BodyText
	
	local HeaderText = nil
	
	HeaderText = LUI.UIStyledText.new()
	HeaderText.id = "HeaderText"
	HeaderText:setText( ToUpperCase( "" ), 0 )
	HeaderText:SetFontSize( 45 * _1080p )
	HeaderText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	HeaderText:SetAlignment( LUI.Alignment.Left )
	HeaderText:SetOptOutRightToLeftAlignmentFlip( true )
	HeaderText:SetStartupDelay( 1000 )
	HeaderText:SetLineHoldTime( 500 )
	HeaderText:SetAnimMoveTime( 500 )
	HeaderText:SetEndDelay( 1000 )
	HeaderText:SetCrossfadeTime( 500 )
	HeaderText:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	HeaderText:SetMaxVisibleLines( 1 )
	HeaderText:SetDecodeLetterLength( 30 )
	HeaderText:SetDecodeMaxRandChars( 6 )
	HeaderText:SetDecodeUpdatesPerLetter( 4 )
	HeaderText:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 18, _1080p * -458, _1080p * 10, _1080p * 55 )
	self:addElement( HeaderText )
	self.HeaderText = HeaderText
	
	return self
end

MenuBuilder.registerType( "GenericItemInfo", GenericItemInfo )
LockTable( _M )
