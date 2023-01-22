local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ScoreboardHeaderBG( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 200 * _1080p, 0, 200 * _1080p )
	self.id = "ScoreboardHeaderBG"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Blur = nil
	
	Blur = LUI.UIBlur.new()
	Blur.id = "Blur"
	Blur:SetRGBFromInt( 12566463, 0 )
	Blur:SetBlurStrength( 2.5, 0 )
	Blur:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 50, 0 )
	self:addElement( Blur )
	self.Blur = Blur
	
	local Overlay = nil
	
	Overlay = LUI.UIImage.new()
	Overlay.id = "Overlay"
	Overlay:SetAlpha( 0.25, 0 )
	Overlay:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
	Overlay:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 50, _1080p * 200 )
	self:addElement( Overlay )
	self.Overlay = Overlay
	
	local Header = nil
	
	Header = LUI.UIImage.new()
	Header.id = "Header"
	Header:SetRGBFromInt( 2500134, 0 )
	Header:SetZRotation( 180, 0 )
	Header:setImage( RegisterMaterial( "widg_gradient_bottom_to_top_opaque" ), 0 )
	Header:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 50 )
	self:addElement( Header )
	self.Header = Header
	
	return self
end

MenuBuilder.registerType( "ScoreboardHeaderBG", ScoreboardHeaderBG )
LockTable( _M )
