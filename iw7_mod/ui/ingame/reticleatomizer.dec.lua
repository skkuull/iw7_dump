local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ReticleAtomizer( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 100 * _1080p, 0, 100 * _1080p )
	self.id = "ReticleAtomizer"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local LinesShadowParallax = nil
	
	LinesShadowParallax = MenuBuilder.BuildRegisteredType( "ScopeReticleParallaxer", {
		horSkewFactor = 150,
		vertSkewFactor = 200,
		controllerIndex = f1_local1
	} )
	LinesShadowParallax.id = "LinesShadowParallax"
	LinesShadowParallax:SetRGBFromTable( SWATCHES.Reticles.AzureBlue, 0 )
	LinesShadowParallax:SetAlpha( 0.4, 0 )
	LinesShadowParallax:setImage( RegisterMaterial( "hud_reticle_atomizer" ), 0 )
	LinesShadowParallax:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -1, _1080p * 1, _1080p * -1, _1080p * 1 )
	self:addElement( LinesShadowParallax )
	self.LinesShadowParallax = LinesShadowParallax
	
	local LinesParallax = nil
	
	LinesParallax = MenuBuilder.BuildRegisteredType( "ScopeReticleParallaxer", {
		horSkewFactor = 150,
		vertSkewFactor = 200,
		controllerIndex = f1_local1
	} )
	LinesParallax.id = "LinesParallax"
	LinesParallax:SetRGBFromTable( SWATCHES.Reticles.VibrantTeal, 0 )
	LinesParallax:SetAlpha( 0.5, 0 )
	LinesParallax:setImage( RegisterMaterial( "hud_reticle_atomizer" ), 0 )
	LinesParallax:SetBlendMode( BLEND_MODE.addWithAlpha )
	self:addElement( LinesParallax )
	self.LinesParallax = LinesParallax
	
	local TriangleShadow = nil
	
	TriangleShadow = LUI.UIImage.new()
	TriangleShadow.id = "TriangleShadow"
	TriangleShadow:SetRGBFromTable( SWATCHES.Reticles.AzureBlue, 0 )
	TriangleShadow:SetAlpha( 0.4, 0 )
	TriangleShadow:SetScale( 0.1, 0 )
	TriangleShadow:setImage( RegisterMaterial( "hud_reticle_triangle_outline" ), 0 )
	TriangleShadow:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 39, _1080p * 61, _1080p * 40, _1080p * 62 )
	self:addElement( TriangleShadow )
	self.TriangleShadow = TriangleShadow
	
	local Triangle = nil
	
	Triangle = LUI.UIImage.new()
	Triangle.id = "Triangle"
	Triangle:SetRGBFromTable( SWATCHES.Reticles.VibrantTeal, 0 )
	Triangle:SetAlpha( 0.5, 0 )
	Triangle:setImage( RegisterMaterial( "hud_reticle_triangle_outline" ), 0 )
	Triangle:SetBlendMode( BLEND_MODE.addWithAlpha )
	Triangle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 39, _1080p * 61, _1080p * 40, _1080p * 62 )
	self:addElement( Triangle )
	self.Triangle = Triangle
	
	return self
end

MenuBuilder.registerType( "ReticleAtomizer", ReticleAtomizer )
LockTable( _M )
