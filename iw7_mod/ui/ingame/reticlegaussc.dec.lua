local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ReticleGaussC( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 11 * _1080p, 0, 11 * _1080p )
	self.id = "ReticleGaussC"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Focus = nil
	
	Focus = LUI.UIImage.new()
	Focus.id = "Focus"
	Focus:SetRGBFromInt( 0, 0 )
	Focus:setImage( RegisterMaterial( "hud_reticle_udm45" ), 0 )
	Focus:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -1, _1080p * 1, _1080p * -1, _1080p * 1 )
	Focus:SubscribeToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.player.currentWeapon.adsPercent:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			Focus:SetAlpha( Add( f2_local0, -0.6 ), 0 )
		end
	end )
	self:addElement( Focus )
	self.Focus = Focus
	
	local Ret = nil
	
	Ret = LUI.UIImage.new()
	Ret.id = "Ret"
	Ret:SetRGBFromTable( SWATCHES.Reticles.VibrantTeal, 0 )
	Ret:setImage( RegisterMaterial( "hud_reticle_gauss_crosshair" ), 0 )
	Ret:SetBlendMode( BLEND_MODE.addWithAlpha )
	Ret:BindAlphaToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_local1 ) )
	self:addElement( Ret )
	self.Ret = Ret
	
	return self
end

MenuBuilder.registerType( "ReticleGaussC", ReticleGaussC )
LockTable( _M )
