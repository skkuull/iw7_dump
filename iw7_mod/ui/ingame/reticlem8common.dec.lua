local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ReticleM8Common( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 344 * _1080p, 0, 256 * _1080p )
	self.id = "ReticleM8Common"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local M8CS = nil
	
	M8CS = LUI.UIImage.new()
	M8CS.id = "M8CS"
	M8CS:SetRGBFromTable( SWATCHES.Reticles.Orange, 0 )
	M8CS:SetAlpha( 0.4, 0 )
	M8CS:setImage( RegisterMaterial( "hud_reticle_m8_sniper_common" ), 0 )
	M8CS:SetUseAA( true )
	M8CS:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -172, _1080p * 172, _1080p * -38, _1080p * 135 )
	self:addElement( M8CS )
	self.M8CS = M8CS
	
	local M8C = nil
	
	M8C = LUI.UIImage.new()
	M8C.id = "M8C"
	M8C:SetRGBFromInt( 15053056, 0 )
	M8C:SetAlpha( 0.6, 0 )
	M8C:setImage( RegisterMaterial( "hud_reticle_m8_sniper_common" ), 0 )
	M8C:SetUseAA( true )
	M8C:SetBlendMode( BLEND_MODE.addWithAlpha )
	M8C:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -172, _1080p * 172, _1080p * -38, _1080p * 134 )
	self:addElement( M8C )
	self.M8C = M8C
	
	return self
end

MenuBuilder.registerType( "ReticleM8Common", ReticleM8Common )
LockTable( _M )
