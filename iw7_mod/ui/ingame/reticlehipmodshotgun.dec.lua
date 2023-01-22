local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ReticleHipModShotgun( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 60 * _1080p, 0, 60 * _1080p )
	self.id = "ReticleHipModShotgun"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local ReticleHipModShotgunBase = nil
	
	ReticleHipModShotgunBase = MenuBuilder.BuildRegisteredType( "ReticleHipModShotgunBase", {
		controllerIndex = f1_local1
	} )
	ReticleHipModShotgunBase.id = "ReticleHipModShotgunBase"
	ReticleHipModShotgunBase:SetAnchors( 0.5, 0.5, 0.5, 0.5, 0 )
	ReticleHipModShotgunBase:SubscribeToModel( DataSources.inGame.player.currentWeapon.crosshairRadius:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.player.currentWeapon.crosshairRadius:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			ReticleHipModShotgunBase:SetLeft( _1080p * Multiply( f2_local0, -1 ), 0 )
		end
	end )
	ReticleHipModShotgunBase:SubscribeToModel( DataSources.inGame.player.currentWeapon.crosshairRadius:GetModel( f1_local1 ), function ()
		local f3_local0 = DataSources.inGame.player.currentWeapon.crosshairRadius:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			ReticleHipModShotgunBase:SetRight( _1080p * Multiply( f3_local0, 1 ), 0 )
		end
	end )
	ReticleHipModShotgunBase:SubscribeToModel( DataSources.inGame.player.currentWeapon.crosshairRadius:GetModel( f1_local1 ), function ()
		local f4_local0 = DataSources.inGame.player.currentWeapon.crosshairRadius:GetValue( f1_local1 )
		if f4_local0 ~= nil then
			ReticleHipModShotgunBase:SetTop( _1080p * Multiply( f4_local0, -1 ), 0 )
		end
	end )
	ReticleHipModShotgunBase:SubscribeToModel( DataSources.inGame.player.currentWeapon.crosshairRadius:GetModel( f1_local1 ), function ()
		local f5_local0 = DataSources.inGame.player.currentWeapon.crosshairRadius:GetValue( f1_local1 )
		if f5_local0 ~= nil then
			ReticleHipModShotgunBase:SetBottom( _1080p * Multiply( f5_local0, 1 ), 0 )
		end
	end )
	ReticleHipModShotgunBase:BindColorToModel( DataSources.inGame.player.currentWeapon.crosshairColor:GetModel( f1_local1 ) )
	self:addElement( ReticleHipModShotgunBase )
	self.ReticleHipModShotgunBase = ReticleHipModShotgunBase
	
	return self
end

MenuBuilder.registerType( "ReticleHipModShotgun", ReticleHipModShotgun )
LockTable( _M )
