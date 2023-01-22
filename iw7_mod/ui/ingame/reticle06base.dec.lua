local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function Reticle06Base( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 20 * _1080p, 0, 20 * _1080p )
	self.id = "Reticle06Base"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local ScopeReticleSpacer = nil
	
	ScopeReticleSpacer = MenuBuilder.BuildRegisteredType( "ScopeReticleSpacer", {
		minSizeADS = 14,
		maxSizeADS = 14,
		minSizeHip = 20,
		maxSizeHip = 30,
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
	
	local CTop = nil
	
	CTop = LUI.UIImage.new()
	CTop.id = "CTop"
	CTop:setImage( RegisterMaterial( "hud_reticle_ring_segment" ), 0 )
	CTop:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -12, _1080p * 12, _1080p * 1.5, _1080p * 25.5 )
	self:addElement( CTop )
	self.CTop = CTop
	
	local CRight = nil
	
	CRight = LUI.UIImage.new()
	CRight.id = "CRight"
	CRight:SetZRotation( -120, 0 )
	CRight:setImage( RegisterMaterial( "hud_reticle_ring_segment" ), 0 )
	CRight:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -26, _1080p * -2, _1080p * -26, _1080p * -2 )
	self:addElement( CRight )
	self.CRight = CRight
	
	local CLeft = nil
	
	CLeft = LUI.UIImage.new()
	CLeft.id = "CLeft"
	CLeft:SetZRotation( 120, 0 )
	CLeft:setImage( RegisterMaterial( "hud_reticle_ring_segment" ), 0 )
	CLeft:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 2, _1080p * 26, _1080p * -26, _1080p * -2 )
	self:addElement( CLeft )
	self.CLeft = CLeft
	
	return self
end

MenuBuilder.registerType( "Reticle06Base", Reticle06Base )
LockTable( _M )
