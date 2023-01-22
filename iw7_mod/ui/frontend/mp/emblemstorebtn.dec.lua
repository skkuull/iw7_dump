local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function EmblemStorebtn( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1217 * _1080p, 0, 75 * _1080p )
	self.id = "EmblemStorebtn"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local ListBlur = nil
	
	ListBlur = LUI.UIBlur.new()
	ListBlur.id = "ListBlur"
	ListBlur:SetBlurStrength( 1.5, 0 )
	self:addElement( ListBlur )
	self.ListBlur = ListBlur
	
	local GradientBackgroundInGameOnly = nil
	
	GradientBackgroundInGameOnly = LUI.UIImage.new()
	GradientBackgroundInGameOnly.id = "GradientBackgroundInGameOnly"
	GradientBackgroundInGameOnly:SetRGBFromInt( 0, 0 )
	GradientBackgroundInGameOnly:SetAlpha( 0.4, 0 )
	self:addElement( GradientBackgroundInGameOnly )
	self.GradientBackgroundInGameOnly = GradientBackgroundInGameOnly
	
	local TicBR = nil
	
	TicBR = LUI.UIImage.new()
	TicBR.id = "TicBR"
	TicBR:SetAlpha( 0.8, 0 )
	TicBR:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -15, _1080p * -1, _1080p * 1, _1080p * 4 )
	self:addElement( TicBR )
	self.TicBR = TicBR
	
	local TicBRCopy0 = nil
	
	TicBRCopy0 = LUI.UIImage.new()
	TicBRCopy0.id = "TicBRCopy0"
	TicBRCopy0:SetAlpha( 0.8, 0 )
	TicBRCopy0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1, _1080p * 15, _1080p * 1, _1080p * 4 )
	self:addElement( TicBRCopy0 )
	self.TicBRCopy0 = TicBRCopy0
	
	local TicBRCopy1 = nil
	
	TicBRCopy1 = LUI.UIImage.new()
	TicBRCopy1.id = "TicBRCopy1"
	TicBRCopy1:SetAlpha( 0.8, 0 )
	TicBRCopy1:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -15, _1080p * -1, _1080p * -4, _1080p * -1 )
	self:addElement( TicBRCopy1 )
	self.TicBRCopy1 = TicBRCopy1
	
	local TicBRCopy2 = nil
	
	TicBRCopy2 = LUI.UIImage.new()
	TicBRCopy2.id = "TicBRCopy2"
	TicBRCopy2:SetAlpha( 0.8, 0 )
	TicBRCopy2:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 1, _1080p * 15, _1080p * -4, _1080p * -1 )
	self:addElement( TicBRCopy2 )
	self.TicBRCopy2 = TicBRCopy2
	
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
	black:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 87.5, _1080p * -87.5, _1080p * -54.5, _1080p * -20.5 )
	self:addElement( black )
	self.black = black
	
	local Line = nil
	
	Line = MenuBuilder.BuildRegisteredType( "EmblemBoxLine", {
		controllerIndex = f1_local1
	} )
	Line.id = "Line"
	Line:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 87.5, _1080p * -87.5, _1080p * 17.5, _1080p * 21.5 )
	self:addElement( Line )
	self.Line = Line
	
	local Line2 = nil
	
	Line2 = MenuBuilder.BuildRegisteredType( "EmblemBoxLine", {
		controllerIndex = f1_local1
	} )
	Line2.id = "Line2"
	Line2:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 87.5, _1080p * -87.5, _1080p * -18.5, _1080p * -14.5 )
	self:addElement( Line2 )
	self.Line2 = Line2
	
	local text = nil
	
	text = LUI.UIText.new()
	text.id = "text"
	text:setText( Engine.Localize( "MENU_DESC_EMBLEM_VIST_STORE" ), 0 )
	text:SetFontSize( 28 * _1080p )
	text:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	text:SetAlignment( LUI.Alignment.Center )
	text:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1, _1080p * 1217, _1080p * 24.5, _1080p * 52.5 )
	self:addElement( text )
	self.text = text
	
	return self
end

MenuBuilder.registerType( "EmblemStorebtn", EmblemStorebtn )
LockTable( _M )
