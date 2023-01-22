local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function CODTvFullscreenVideoInfos( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 900 * _1080p, 0, 100 * _1080p )
	self.id = "CODTvFullscreenVideoInfos"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 0, 0 )
	Background:SetAlpha( 0.75, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local NowPlaying = nil
	
	NowPlaying = LUI.UIText.new()
	NowPlaying.id = "NowPlaying"
	NowPlaying:setText( Engine.Localize( "CODTV_NOW_PLAYING" ), 0 )
	NowPlaying:SetFontSize( 20 * _1080p )
	NowPlaying:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	NowPlaying:SetAlignment( LUI.Alignment.Right )
	NowPlaying:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 17, _1080p * 892, _1080p * 5, _1080p * 25 )
	self:addElement( NowPlaying )
	self.NowPlaying = NowPlaying
	
	local VideoTitle = nil
	
	VideoTitle = LUI.UIText.new()
	VideoTitle.id = "VideoTitle"
	VideoTitle:setText( Engine.Localize( "MENU_NEW" ), 0 )
	VideoTitle:SetFontSize( 30 * _1080p )
	VideoTitle:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	VideoTitle:SetAlignment( LUI.Alignment.Right )
	VideoTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 17, _1080p * 892, _1080p * 35, _1080p * 65 )
	self:addElement( VideoTitle )
	self.VideoTitle = VideoTitle
	
	local Spacer = nil
	
	Spacer = LUI.UIImage.new()
	Spacer.id = "Spacer"
	Spacer:SetAlpha( 0.5, 0 )
	Spacer:setImage( RegisterMaterial( "widg_gradient_right_to_left" ), 0 )
	Spacer:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 26, _1080p * 27 )
	self:addElement( Spacer )
	self.Spacer = Spacer
	
	return self
end

MenuBuilder.registerType( "CODTvFullscreenVideoInfos", CODTvFullscreenVideoInfos )
LockTable( _M )
