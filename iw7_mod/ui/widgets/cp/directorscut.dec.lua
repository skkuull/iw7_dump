local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function directorsCut( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 300 * _1080p, 0, 150 * _1080p )
	self.id = "directorsCut"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local stamp = nil
	
	stamp = LUI.UIImage.new()
	stamp.id = "stamp"
	stamp:SetScale( 1, 0 )
	stamp:setImage( RegisterMaterial( "zm_directors_cut_stamp" ), 0 )
	stamp:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 86, _1080p * 214, _1080p * 43, _1080p * 107 )
	self:addElement( stamp )
	self.stamp = stamp
	
	local star = nil
	
	star = LUI.UIImage.new()
	star.id = "star"
	star:SetAlpha( 0.8, 0 )
	star:setImage( RegisterMaterial( "zm_directors_cut_star" ), 0 )
	star:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -7, _1080p * 121, _1080p * -7, _1080p * 121 )
	self:addElement( star )
	self.star = star
	
	local text = nil
	
	text = LUI.UIText.new()
	text.id = "text"
	text:SetRGBFromInt( 15548470, 0 )
	text:SetZRotation( 9.5, 0 )
	text:setText( Engine.Localize( "CP_MERITS_DIRECTORS_CUT" ), 0 )
	text:SetFontSize( 38 * _1080p )
	text:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	text:SetAlignment( LUI.Alignment.Center )
	text:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 8, _1080p * 308, _1080p * 43, _1080p * 81 )
	self:addElement( text )
	self.text = text
	
	local cut = nil
	
	cut = LUI.UIText.new()
	cut.id = "cut"
	cut:SetRGBFromInt( 15548470, 0 )
	cut:SetZRotation( 9.5, 0 )
	cut:setText( ToUpperCase( Engine.Localize( "CP_MERITS_DIRECTORS_CUT_CUT" ) ), 0 )
	cut:SetFontSize( 38 * _1080p )
	cut:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	cut:SetAlignment( LUI.Alignment.Center )
	cut:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 8, _1080p * 308, _1080p * 70, _1080p * 108 )
	self:addElement( cut )
	self.cut = cut
	
	return self
end

MenuBuilder.registerType( "directorsCut", directorsCut )
LockTable( _M )
