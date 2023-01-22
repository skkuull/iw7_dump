local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function GaussHybridChargeMeterAlt( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 32 * _1080p, 0, 32 * _1080p )
	self.id = "GaussHybridChargeMeterAlt"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local CircleShadow = nil
	
	CircleShadow = LUI.UIImage.new()
	CircleShadow.id = "CircleShadow"
	CircleShadow:SetRGBFromTable( SWATCHES.Reticles.Orange, 0 )
	CircleShadow:SetScale( 0.02, 0 )
	CircleShadow:setImage( RegisterMaterial( "hud_reticle_circle_outline_small" ), 0 )
	CircleShadow:SetUseAA( true )
	CircleShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -4, _1080p * 4, _1080p * -4, _1080p * 4 )
	CircleShadow:SubscribeToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.player.currentWeapon.adsPercent:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			CircleShadow:SetAlpha( Lerp( f2_local0, 0, 0.3 ), 0 )
		end
	end )
	self:addElement( CircleShadow )
	self.CircleShadow = CircleShadow
	
	local Circle = nil
	
	Circle = LUI.UIImage.new()
	Circle.id = "Circle"
	Circle:SetRGBFromTable( SWATCHES.Reticles.Orange, 0 )
	Circle:SetScale( -0.03, 0 )
	Circle:setImage( RegisterMaterial( "hud_reticle_circle_outline_small" ), 0 )
	Circle:SetUseAA( true )
	Circle:SetBlendMode( BLEND_MODE.addWithAlpha )
	Circle:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -4, _1080p * 4, _1080p * -4, _1080p * 4 )
	Circle:SubscribeToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_local1 ), function ()
		local f3_local0 = DataSources.inGame.player.currentWeapon.adsPercent:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			Circle:SetAlpha( Lerp( f3_local0, 0, 0.5 ), 0 )
		end
	end )
	self:addElement( Circle )
	self.Circle = Circle
	
	local ChargeMeterScopeCopy0 = nil
	
	ChargeMeterScopeCopy0 = MenuBuilder.BuildRegisteredType( "ChargeMeterScope", {
		controllerIndex = f1_local1
	} )
	ChargeMeterScopeCopy0.id = "ChargeMeterScopeCopy0"
	ChargeMeterScopeCopy0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -53, _1080p * -48, _1080p * -13, _1080p * 45 )
	self:addElement( ChargeMeterScopeCopy0 )
	self.ChargeMeterScopeCopy0 = ChargeMeterScopeCopy0
	
	local ChargeMeterScopeCopy1 = nil
	
	ChargeMeterScopeCopy1 = MenuBuilder.BuildRegisteredType( "ChargeMeterScope", {
		controllerIndex = f1_local1
	} )
	ChargeMeterScopeCopy1.id = "ChargeMeterScopeCopy1"
	ChargeMeterScopeCopy1:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * 48, _1080p * 53, _1080p * -13, _1080p * 45 )
	self:addElement( ChargeMeterScopeCopy1 )
	self.ChargeMeterScopeCopy1 = ChargeMeterScopeCopy1
	
	return self
end

MenuBuilder.registerType( "GaussHybridChargeMeterAlt", GaussHybridChargeMeterAlt )
LockTable( _M )
