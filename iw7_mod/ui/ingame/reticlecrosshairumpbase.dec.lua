local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ReticleCrosshairUMPBase( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 16 * _1080p, 0, 16 * _1080p )
	self.id = "ReticleCrosshairUMPBase"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local ScopeReticleSpacer = nil
	
	ScopeReticleSpacer = MenuBuilder.BuildRegisteredType( "ScopeReticleSpacer", {
		minSizeADS = 3,
		maxSizeADS = 3,
		minSizeHip = 6,
		maxSizeHip = 12,
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
	
	local RightLineShadow = nil
	
	RightLineShadow = LUI.UIImage.new()
	RightLineShadow.id = "RightLineShadow"
	RightLineShadow:SetRGBFromTable( SWATCHES.Reticles.DarkContrast, 0 )
	RightLineShadow:setImage( RegisterMaterial( "hud_reticle_box_glow" ), 0 )
	RightLineShadow:SetUseAA( true )
	RightLineShadow:SetBlendMode( BLEND_MODE.blend )
	RightLineShadow:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -2, _1080p * 13, _1080p * -4, _1080p * 2 )
	self:addElement( RightLineShadow )
	self.RightLineShadow = RightLineShadow
	
	local RightLineMid = nil
	
	RightLineMid = LUI.UIImage.new()
	RightLineMid.id = "RightLineMid"
	RightLineMid:setImage( RegisterMaterial( "hud_reticle_box_glow" ), 0 )
	RightLineMid:SetUseAA( true )
	RightLineMid:SetBlendMode( BLEND_MODE.addWithAlpha )
	RightLineMid:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, 0, _1080p * 11, _1080p * -2.5, _1080p * 0.5 )
	self:addElement( RightLineMid )
	self.RightLineMid = RightLineMid
	
	local LeftLineShadow = nil
	
	LeftLineShadow = LUI.UIImage.new()
	LeftLineShadow.id = "LeftLineShadow"
	LeftLineShadow:SetRGBFromTable( SWATCHES.Reticles.DarkContrast, 0 )
	LeftLineShadow:setImage( RegisterMaterial( "hud_reticle_box_glow" ), 0 )
	LeftLineShadow:SetUseAA( true )
	LeftLineShadow:SetBlendMode( BLEND_MODE.blend )
	LeftLineShadow:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -13, _1080p * 2, _1080p * -4, _1080p * 2 )
	self:addElement( LeftLineShadow )
	self.LeftLineShadow = LeftLineShadow
	
	local LeftLineMid = nil
	
	LeftLineMid = LUI.UIImage.new()
	LeftLineMid.id = "LeftLineMid"
	LeftLineMid:setImage( RegisterMaterial( "hud_reticle_box_glow" ), 0 )
	LeftLineMid:SetUseAA( true )
	LeftLineMid:SetBlendMode( BLEND_MODE.addWithAlpha )
	LeftLineMid:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -11, 0, _1080p * -2.5, _1080p * 0.5 )
	self:addElement( LeftLineMid )
	self.LeftLineMid = LeftLineMid
	
	local BottomLineShadow = nil
	
	BottomLineShadow = LUI.UIImage.new()
	BottomLineShadow.id = "BottomLineShadow"
	BottomLineShadow:SetRGBFromTable( SWATCHES.Reticles.DarkContrast, 0 )
	BottomLineShadow:setImage( RegisterMaterial( "hud_reticle_box_glow" ), 0 )
	BottomLineShadow:SetUseAA( true )
	BottomLineShadow:SetBlendMode( BLEND_MODE.blend )
	BottomLineShadow:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -3, _1080p * 3, _1080p * -2, _1080p * 13 )
	self:addElement( BottomLineShadow )
	self.BottomLineShadow = BottomLineShadow
	
	local BottomLineMid = nil
	
	BottomLineMid = LUI.UIImage.new()
	BottomLineMid.id = "BottomLineMid"
	BottomLineMid:setImage( RegisterMaterial( "hud_reticle_box_glow" ), 0 )
	BottomLineMid:SetUseAA( true )
	BottomLineMid:SetBlendMode( BLEND_MODE.addWithAlpha )
	BottomLineMid:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -1.5, _1080p * 1.5, 0, _1080p * 11 )
	self:addElement( BottomLineMid )
	self.BottomLineMid = BottomLineMid
	
	return self
end

MenuBuilder.registerType( "ReticleCrosshairUMPBase", ReticleCrosshairUMPBase )
LockTable( _M )
