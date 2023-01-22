local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function AARKDStat( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 297 * _1080p, 0, 211 * _1080p )
	self.id = "AARKDStat"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local bg = nil
	
	bg = LUI.UIImage.new()
	bg.id = "bg"
	bg:SetRGBFromInt( 0, 0 )
	bg:SetAlpha( 0.36, 0 )
	self:addElement( bg )
	self.bg = bg
	
	local black = nil
	
	black = LUI.UIImage.new()
	black.id = "black"
	black:SetRGBFromInt( 0, 0 )
	black:SetAlpha( 0.35, 0 )
	black:SetDotPitchEnabled( true )
	black:SetDotPitchX( 0, 0 )
	black:SetDotPitchY( 0, 0 )
	black:SetDotPitchContrast( 0, 0 )
	black:SetDotPitchMode( 0 )
	black:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 26 )
	self:addElement( black )
	self.black = black
	
	local Line = nil
	
	Line = MenuBuilder.BuildRegisteredType( "EmblemBoxLine", {
		controllerIndex = f1_local1
	} )
	Line.id = "Line"
	Line:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 26, _1080p * 27.5 )
	self:addElement( Line )
	self.Line = Line
	
	local LineCopy1 = nil
	
	LineCopy1 = MenuBuilder.BuildRegisteredType( "EmblemBoxLine", {
		controllerIndex = f1_local1
	} )
	LineCopy1.id = "LineCopy1"
	LineCopy1:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -1.5, _1080p * -0.5 )
	self:addElement( LineCopy1 )
	self.LineCopy1 = LineCopy1
	
	local Count = nil
	
	Count = LUI.UIText.new()
	Count.id = "Count"
	Count:setText( "999", 0 )
	Count:SetFontSize( 55 * _1080p )
	Count:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Count:SetAlignment( LUI.Alignment.Left )
	Count:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 146.5, _1080p * 285, _1080p * 89, _1080p * 144 )
	self:addElement( Count )
	self.Count = Count
	
	local Icon = nil
	
	Icon = LUI.UIImage.new()
	Icon.id = "Icon"
	Icon:setImage( RegisterMaterial( "damage_feedback_killing_blow" ), 0 )
	Icon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 18, _1080p * 137, _1080p * 57, _1080p * 176 )
	self:addElement( Icon )
	self.Icon = Icon
	
	local Header = nil
	
	Header = LUI.UIText.new()
	Header.id = "Header"
	Header:setText( ToUpperCase( Engine.Localize( "MENU_KILLS" ) ), 0 )
	Header:SetFontSize( 20 * _1080p )
	Header:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Header:SetAlignment( LUI.Alignment.Left )
	Header:SetOptOutRightToLeftAlignmentFlip( true )
	Header:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 12, _1080p * -60, _1080p * 3, _1080p * 23 )
	self:addElement( Header )
	self.Header = Header
	
	return self
end

MenuBuilder.registerType( "AARKDStat", AARKDStat )
LockTable( _M )
