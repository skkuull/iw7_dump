local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ReticleBracketBase( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 20 * _1080p, 0, 10 * _1080p )
	self.id = "ReticleBracketBase"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local BracketLShadow = nil
	
	BracketLShadow = LUI.UIImage.new()
	BracketLShadow.id = "BracketLShadow"
	BracketLShadow:SetRGBFromTable( SWATCHES.Reticles.Black, 0 )
	BracketLShadow:SetAlpha( 0.4, 0 )
	BracketLShadow:setImage( RegisterMaterial( "hud_reticle_bracket" ), 0 )
	BracketLShadow:SetUseAA( true )
	BracketLShadow:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -3, _1080p * 5, _1080p * -3, _1080p * 3 )
	self:addElement( BracketLShadow )
	self.BracketLShadow = BracketLShadow
	
	local BracketL = nil
	
	BracketL = LUI.UIImage.new()
	BracketL.id = "BracketL"
	BracketL:setImage( RegisterMaterial( "hud_reticle_bracket" ), 0 )
	BracketL:SetUseAA( true )
	BracketL:SetBlendMode( BLEND_MODE.addWithAlpha )
	BracketL:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -3, _1080p * 5, _1080p * -3, _1080p * 3 )
	self:addElement( BracketL )
	self.BracketL = BracketL
	
	local BracketRShadow = nil
	
	BracketRShadow = LUI.UIImage.new()
	BracketRShadow.id = "BracketRShadow"
	BracketRShadow:SetRGBFromTable( SWATCHES.Reticles.Black, 0 )
	BracketRShadow:SetAlpha( 0.4, 0 )
	BracketRShadow:SetZRotation( 180, 0 )
	BracketRShadow:setImage( RegisterMaterial( "hud_reticle_bracket" ), 0 )
	BracketRShadow:SetUseAA( true )
	BracketRShadow:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -5, _1080p * 3, _1080p * -3, _1080p * 3 )
	self:addElement( BracketRShadow )
	self.BracketRShadow = BracketRShadow
	
	local BracketR = nil
	
	BracketR = LUI.UIImage.new()
	BracketR.id = "BracketR"
	BracketR:SetZRotation( 180, 0 )
	BracketR:setImage( RegisterMaterial( "hud_reticle_bracket" ), 0 )
	BracketR:SetUseAA( true )
	BracketR:SetBlendMode( BLEND_MODE.addWithAlpha )
	BracketR:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -5, _1080p * 3, _1080p * -3, _1080p * 3 )
	self:addElement( BracketR )
	self.BracketR = BracketR
	
	return self
end

MenuBuilder.registerType( "ReticleBracketBase", ReticleBracketBase )
LockTable( _M )
