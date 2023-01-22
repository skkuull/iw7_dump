local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ReticleThermal( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 2 * _1080p, 0, 2 * _1080p )
	self.id = "ReticleThermal"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local ThermalShadow = nil
	
	ThermalShadow = LUI.UIImage.new()
	ThermalShadow.id = "ThermalShadow"
	ThermalShadow:SetRGBFromTable( SWATCHES.Reticles.Blue, 0 )
	ThermalShadow:setImage( RegisterMaterial( "hud_reticle_thermal" ), 0 )
	ThermalShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -301.5, _1080p * 300.2, _1080p * -151.4, _1080p * 150 )
	ThermalShadow:SubscribeToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.player.currentWeapon.adsPercent:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			ThermalShadow:SetAlpha( Multiply( Add( Lerp( f2_local0, -1, 0.6 ), -1 ), 2 ), 0 )
		end
	end )
	self:addElement( ThermalShadow )
	self.ThermalShadow = ThermalShadow
	
	local Thermal = nil
	
	Thermal = LUI.UIImage.new()
	Thermal.id = "Thermal"
	Thermal:SetRGBFromTable( SWATCHES.Reticles.LightCyan, 0 )
	Thermal:setImage( RegisterMaterial( "hud_reticle_thermal" ), 0 )
	Thermal:SetBlendMode( BLEND_MODE.addWithAlpha )
	Thermal:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -301.5, _1080p * 300.2, _1080p * -151.4, _1080p * 150 )
	Thermal:SubscribeToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_local1 ), function ()
		local f3_local0 = DataSources.inGame.player.currentWeapon.adsPercent:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			Thermal:SetAlpha( Add( Multiply( f3_local0, 2 ), -1 ), 0 )
		end
	end )
	self:addElement( Thermal )
	self.Thermal = Thermal
	
	return self
end

MenuBuilder.registerType( "ReticleThermal", ReticleThermal )
LockTable( _M )
