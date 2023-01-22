local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function AmmoCounterRed( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 50 * _1080p, 0, 16 * _1080p )
	self.id = "AmmoCounterRed"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local AmmoCounterBaseRedOrange = nil
	
	AmmoCounterBaseRedOrange = MenuBuilder.BuildRegisteredType( "AmmoCounterBase", {
		controllerIndex = f1_local1
	} )
	AmmoCounterBaseRedOrange.id = "AmmoCounterBaseRedOrange"
	AmmoCounterBaseRedOrange:SetRGBFromTable( SWATCHES.Reticles.LightRed, 0 )
	AmmoCounterBaseRedOrange:SetScale( 0.1, 0 )
	AmmoCounterBaseRedOrange.AmmoCounterShadow:SetRGBFromTable( SWATCHES.Reticles.DarkRed, 0 )
	AmmoCounterBaseRedOrange.AmmoCounterShadow:SetShadowMinDistance( -0.4, 0 )
	AmmoCounterBaseRedOrange.AmmoCounterShadow:SetShadowRGBFromInt( 16711680, 0 )
	AmmoCounterBaseRedOrange.AmmoCounter:SetShadowMinDistance( -0.4, 0 )
	AmmoCounterBaseRedOrange.AmmoCounter:SetShadowMaxDistance( 0.4, 0 )
	AmmoCounterBaseRedOrange.AmmoCounter:SetShadowRGBFromTable( SWATCHES.Reticles.LightRed, 0 )
	AmmoCounterBaseRedOrange:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -17, _1080p * 23, _1080p * 30, _1080p * 46 )
	AmmoCounterBaseRedOrange:BindAlphaToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_local1 ) )
	self:addElement( AmmoCounterBaseRedOrange )
	self.AmmoCounterBaseRedOrange = AmmoCounterBaseRedOrange
	
	return self
end

MenuBuilder.registerType( "AmmoCounterRed", AmmoCounterRed )
LockTable( _M )
