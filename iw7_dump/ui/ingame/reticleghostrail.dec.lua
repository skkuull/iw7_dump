local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ReticleGhostRail( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 128 * _1080p, 0, 128 * _1080p )
	self.id = "ReticleGhostRail"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local ScopeReticleParallaxerShadow = nil
	
	ScopeReticleParallaxerShadow = MenuBuilder.BuildRegisteredType( "ScopeReticleParallaxer", {
		horSkewFactor = -50,
		vertSkewFactor = -50,
		controllerIndex = f1_local1
	} )
	ScopeReticleParallaxerShadow.id = "ScopeReticleParallaxerShadow"
	ScopeReticleParallaxerShadow:SetRGBFromInt( 16764416, 0 )
	ScopeReticleParallaxerShadow:setImage( RegisterMaterial( "hud_reticle_ghostrail" ), 0 )
	ScopeReticleParallaxerShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -90.5, _1080p * 90.5, _1080p * -91.5, _1080p * 91.5 )
	ScopeReticleParallaxerShadow:SubscribeToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.player.currentWeapon.adsPercent:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			ScopeReticleParallaxerShadow:SetAlpha( Lerp( f2_local0, 0, 0.4 ), 0 )
		end
	end )
	self:addElement( ScopeReticleParallaxerShadow )
	self.ScopeReticleParallaxerShadow = ScopeReticleParallaxerShadow
	
	local ScopeReticleParallaxer = nil
	
	ScopeReticleParallaxer = MenuBuilder.BuildRegisteredType( "ScopeReticleParallaxer", {
		horSkewFactor = -50,
		vertSkewFactor = -50,
		controllerIndex = f1_local1
	} )
	ScopeReticleParallaxer.id = "ScopeReticleParallaxer"
	ScopeReticleParallaxer:SetRGBFromTable( SWATCHES.Reticles.Yellow, 0 )
	ScopeReticleParallaxer:setImage( RegisterMaterial( "hud_reticle_ghostrail" ), 0 )
	ScopeReticleParallaxer:SetBlendMode( BLEND_MODE.addWithAlpha )
	ScopeReticleParallaxer:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -89.4, _1080p * 89.4, _1080p * -91.5, _1080p * 91.5 )
	ScopeReticleParallaxer:SubscribeToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_local1 ), function ()
		local f3_local0 = DataSources.inGame.player.currentWeapon.adsPercent:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			ScopeReticleParallaxer:SetAlpha( Lerp( f3_local0, 0, 0.4 ), 0 )
		end
	end )
	self:addElement( ScopeReticleParallaxer )
	self.ScopeReticleParallaxer = ScopeReticleParallaxer
	
	local ImageS = nil
	
	ImageS = LUI.UIImage.new()
	ImageS.id = "ImageS"
	ImageS:SetRGBFromInt( 10061629, 0 )
	ImageS:SetZRotation( 90, 0 )
	ImageS:setImage( RegisterMaterial( "hud_reticle_notch_rounded_short" ), 0 )
	ImageS:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -3.4, _1080p * 3.4, _1080p * -1, _1080p * 3 )
	ImageS:SubscribeToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_local1 ), function ()
		local f4_local0 = DataSources.inGame.player.currentWeapon.adsPercent:GetValue( f1_local1 )
		if f4_local0 ~= nil then
			ImageS:SetAlpha( Lerp( f4_local0, 0, 0.4 ), 0 )
		end
	end )
	self:addElement( ImageS )
	self.ImageS = ImageS
	
	local Image = nil
	
	Image = LUI.UIImage.new()
	Image.id = "Image"
	Image:SetRGBFromTable( SWATCHES.Reticles.Yellow, 0 )
	Image:SetZRotation( 90, 0 )
	Image:setImage( RegisterMaterial( "hud_reticle_notch_rounded_short" ), 0 )
	Image:SetBlendMode( BLEND_MODE.addWithAlpha )
	Image:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -3, _1080p * 3, 0, _1080p * 2 )
	Image:SubscribeToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_local1 ), function ()
		local f5_local0 = DataSources.inGame.player.currentWeapon.adsPercent:GetValue( f1_local1 )
		if f5_local0 ~= nil then
			Image:SetAlpha( Lerp( f5_local0, 0, 0.6 ), 0 )
		end
	end )
	self:addElement( Image )
	self.Image = Image
	
	return self
end

MenuBuilder.registerType( "ReticleGhostRail", ReticleGhostRail )
LockTable( _M )
