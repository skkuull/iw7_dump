local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function DotBase( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 10 * _1080p, 0, 10 * _1080p )
	self.id = "DotBase"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local DotShadow = nil
	
	DotShadow = LUI.UIImage.new()
	DotShadow.id = "DotShadow"
	DotShadow:SetAlpha( 0.4, 0 )
	DotShadow:SetScale( 0.25, 0 )
	DotShadow:setImage( RegisterMaterial( "hud_reticle_faded_dot" ), 0 )
	self:addElement( DotShadow )
	self.DotShadow = DotShadow
	
	local Dot = nil
	
	Dot = LUI.UIImage.new()
	Dot.id = "Dot"
	Dot:SetScale( 0.25, 0 )
	Dot:setImage( RegisterMaterial( "hud_reticle_faded_dot" ), 0 )
	Dot:SetBlendMode( BLEND_MODE.addWithAlpha )
	Dot:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( Dot )
	self.Dot = Dot
	
	local DotHighlight = nil
	
	DotHighlight = LUI.UIImage.new()
	DotHighlight.id = "DotHighlight"
	DotHighlight:SetAlpha( 0.6, 0 )
	DotHighlight:SetScale( -0.55, 0 )
	DotHighlight:setImage( RegisterMaterial( "hud_reticle_circle_fill" ), 0 )
	self:addElement( DotHighlight )
	self.DotHighlight = DotHighlight
	
	return self
end

MenuBuilder.registerType( "DotBase", DotBase )
LockTable( _M )
