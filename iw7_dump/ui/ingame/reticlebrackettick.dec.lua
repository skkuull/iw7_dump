local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ReticleBracketTick( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 28 * _1080p, 0, 6 * _1080p )
	self.id = "ReticleBracketTick"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local ScopeReticleSpacer = nil
	
	ScopeReticleSpacer = MenuBuilder.BuildRegisteredType( "ScopeReticleSpacer", {
		minSizeADS = 9,
		maxSizeADS = 9,
		minSizeHip = 15,
		maxSizeHip = 25,
		adjustLeft = true,
		adjustRight = true,
		controllerIndex = f1_local1
	} )
	ScopeReticleSpacer.id = "ScopeReticleSpacer"
	ScopeReticleSpacer:SetAlpha( 0, 0 )
	self:addElement( ScopeReticleSpacer )
	self.ScopeReticleSpacer = ScopeReticleSpacer
	
	local LeftBracketShadow = nil
	
	LeftBracketShadow = LUI.UIImage.new()
	LeftBracketShadow.id = "LeftBracketShadow"
	LeftBracketShadow:SetRGBFromTable( SWATCHES.Reticles.DarkContrast, 0 )
	LeftBracketShadow:SetAlpha( 0.4, 0 )
	LeftBracketShadow:setImage( RegisterMaterial( "hud_reticle_bracket_tick" ), 0 )
	LeftBracketShadow:SetUseAA( true )
	LeftBracketShadow:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -7, _1080p * 8.2, _1080p * -4, _1080p * 4 )
	self:addElement( LeftBracketShadow )
	self.LeftBracketShadow = LeftBracketShadow
	
	local LeftBracket = nil
	
	LeftBracket = LUI.UIImage.new()
	LeftBracket.id = "LeftBracket"
	LeftBracket:setImage( RegisterMaterial( "hud_reticle_bracket_tick" ), 0 )
	LeftBracket:SetUseAA( true )
	LeftBracket:SetBlendMode( BLEND_MODE.addWithAlpha )
	LeftBracket:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -6, _1080p * 8, _1080p * -3, _1080p * 3 )
	self:addElement( LeftBracket )
	self.LeftBracket = LeftBracket
	
	local RightBracketShadow = nil
	
	RightBracketShadow = LUI.UIImage.new()
	RightBracketShadow.id = "RightBracketShadow"
	RightBracketShadow:SetRGBFromTable( SWATCHES.Reticles.DarkContrast, 0 )
	RightBracketShadow:SetAlpha( 0.4, 0 )
	RightBracketShadow:SetZRotation( 180, 0 )
	RightBracketShadow:setImage( RegisterMaterial( "hud_reticle_bracket_tick" ), 0 )
	RightBracketShadow:SetUseAA( true )
	RightBracketShadow:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -8.2, _1080p * 7, _1080p * -4, _1080p * 4 )
	self:addElement( RightBracketShadow )
	self.RightBracketShadow = RightBracketShadow
	
	local RightBracket = nil
	
	RightBracket = LUI.UIImage.new()
	RightBracket.id = "RightBracket"
	RightBracket:SetZRotation( 180, 0 )
	RightBracket:setImage( RegisterMaterial( "hud_reticle_bracket_tick" ), 0 )
	RightBracket:SetUseAA( true )
	RightBracket:SetBlendMode( BLEND_MODE.addWithAlpha )
	RightBracket:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -8, _1080p * 6, _1080p * -3, _1080p * 3 )
	self:addElement( RightBracket )
	self.RightBracket = RightBracket
	
	return self
end

MenuBuilder.registerType( "ReticleBracketTick", ReticleBracketTick )
LockTable( _M )
