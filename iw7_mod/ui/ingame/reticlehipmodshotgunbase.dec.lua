local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ReticleHipModShotgunBase( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 60 * _1080p, 0, 60 * _1080p )
	self.id = "ReticleHipModShotgunBase"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local TopBracket = nil
	
	TopBracket = LUI.UIImage.new()
	TopBracket.id = "TopBracket"
	TopBracket:setImage( RegisterMaterial( "hud_reticle_hip_mod_semicircle" ), 0 )
	TopBracket:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -20, _1080p * 20, _1080p * -3, _1080p * 13 )
	self:addElement( TopBracket )
	self.TopBracket = TopBracket
	
	local RightBracket = nil
	
	RightBracket = LUI.UIImage.new()
	RightBracket.id = "RightBracket"
	RightBracket:SetZRotation( -125, 0 )
	RightBracket:setImage( RegisterMaterial( "hud_reticle_hip_mod_semicircle" ), 0 )
	RightBracket:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -29, _1080p * 11, _1080p * -24, _1080p * -8 )
	self:addElement( RightBracket )
	self.RightBracket = RightBracket
	
	local LeftBracket = nil
	
	LeftBracket = LUI.UIImage.new()
	LeftBracket.id = "LeftBracket"
	LeftBracket:SetZRotation( 125, 0 )
	LeftBracket:setImage( RegisterMaterial( "hud_reticle_hip_mod_semicircle" ), 0 )
	LeftBracket:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * -11, _1080p * 29, _1080p * -24, _1080p * -8 )
	self:addElement( LeftBracket )
	self.LeftBracket = LeftBracket
	
	return self
end

MenuBuilder.registerType( "ReticleHipModShotgunBase", ReticleHipModShotgunBase )
LockTable( _M )
