local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ReticleCircleQuadTick( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 20 * _1080p, 0, 20 * _1080p )
	self.id = "ReticleCircleQuadTick"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local ScopeReticleSpacer = nil
	
	ScopeReticleSpacer = MenuBuilder.BuildRegisteredType( "ScopeReticleSpacer", {
		minSizeADS = 0,
		maxSizeADS = 0,
		minSizeHip = 7,
		maxSizeHip = 13,
		adjustLeft = true,
		adjustRight = true,
		adjustTop = true,
		adjustBottom = true,
		controllerIndex = f1_local1
	} )
	ScopeReticleSpacer.id = "ScopeReticleSpacer"
	ScopeReticleSpacer:SetAlpha( 0, 0 )
	self:addElement( ScopeReticleSpacer )
	self.ScopeReticleSpacer = ScopeReticleSpacer
	
	local RingShadow = nil
	
	RingShadow = LUI.UIImage.new()
	RingShadow.id = "RingShadow"
	RingShadow:SetRGBFromTable( SWATCHES.Reticles.DarkContrast, 0 )
	RingShadow:SetAlpha( 0.4, 0 )
	RingShadow:SetScale( 0.07, 0 )
	RingShadow:setImage( RegisterMaterial( "hud_reticle_circle_quadtick" ), 0 )
	RingShadow:SetUseAA( true )
	RingShadow:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -10, _1080p * 10, _1080p * -10, _1080p * 10 )
	self:addElement( RingShadow )
	self.RingShadow = RingShadow
	
	local Ring = nil
	
	Ring = LUI.UIImage.new()
	Ring.id = "Ring"
	Ring:SetAlpha( 0.8, 0 )
	Ring:setImage( RegisterMaterial( "hud_reticle_circle_quadtick" ), 0 )
	Ring:SetUseAA( true )
	Ring:SetBlendMode( BLEND_MODE.addWithAlpha )
	Ring:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -10, _1080p * 10, _1080p * -10, _1080p * 10 )
	self:addElement( Ring )
	self.Ring = Ring
	
	return self
end

MenuBuilder.registerType( "ReticleCircleQuadTick", ReticleCircleQuadTick )
LockTable( _M )
