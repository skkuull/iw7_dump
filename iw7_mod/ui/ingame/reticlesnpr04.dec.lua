local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ReticleSnpr04( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1 * _1080p, 0, 1 * _1080p )
	self.id = "ReticleSnpr04"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local ImageS = nil
	
	ImageS = LUI.UIImage.new()
	ImageS.id = "ImageS"
	ImageS:setImage( RegisterMaterial( "hud_reticle_sniper12" ), 0 )
	ImageS:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -195, _1080p * 194, _1080p * -97, _1080p * 97 )
	ImageS:BindAlphaToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_local1 ) )
	self:addElement( ImageS )
	self.ImageS = ImageS
	
	local ImageA = nil
	
	ImageA = LUI.UIImage.new()
	ImageA.id = "ImageA"
	ImageA:setImage( RegisterMaterial( "hud_reticle_sniper12b" ), 0 )
	ImageA:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -55.5, _1080p * 55, _1080p * -55, _1080p * 55.5 )
	ImageA:BindAlphaToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_local1 ) )
	self:addElement( ImageA )
	self.ImageA = ImageA
	
	return self
end

MenuBuilder.registerType( "ReticleSnpr04", ReticleSnpr04 )
LockTable( _M )
