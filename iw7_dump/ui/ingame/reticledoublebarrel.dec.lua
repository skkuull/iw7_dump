local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ReticleDoubleBarrel( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 287 * _1080p, 0, 64 * _1080p )
	self.id = "ReticleDoubleBarrel"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local ReticleDoubleBarrelBaseWrapper = nil
	
	ReticleDoubleBarrelBaseWrapper = MenuBuilder.BuildRegisteredType( "ReticleDoubleBarrelBaseWrapper", {
		controllerIndex = f1_local1
	} )
	ReticleDoubleBarrelBaseWrapper.id = "ReticleDoubleBarrelBaseWrapper"
	ReticleDoubleBarrelBaseWrapper:SetAnchors( 0.5, 0.5, 0.5, 0.5, 0 )
	ReticleDoubleBarrelBaseWrapper:SubscribeToModel( DataSources.inGame.player.currentWeapon.crosshairRadius:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.player.currentWeapon.crosshairRadius:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			ReticleDoubleBarrelBaseWrapper:SetLeft( _1080p * Multiply( f2_local0, -1 ), 0 )
		end
	end )
	ReticleDoubleBarrelBaseWrapper:SubscribeToModel( DataSources.inGame.player.currentWeapon.crosshairRadius:GetModel( f1_local1 ), function ()
		local f3_local0 = DataSources.inGame.player.currentWeapon.crosshairRadius:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			ReticleDoubleBarrelBaseWrapper:SetRight( _1080p * Multiply( f3_local0, 1 ), 0 )
		end
	end )
	ReticleDoubleBarrelBaseWrapper:SubscribeToModel( DataSources.inGame.player.currentWeapon.crosshairRadius:GetModel( f1_local1 ), function ()
		local f4_local0 = DataSources.inGame.player.currentWeapon.crosshairRadius:GetValue( f1_local1 )
		if f4_local0 ~= nil then
			ReticleDoubleBarrelBaseWrapper:SetTop( _1080p * Multiply( f4_local0, -1 ), 0 )
		end
	end )
	ReticleDoubleBarrelBaseWrapper:SubscribeToModel( DataSources.inGame.player.currentWeapon.crosshairRadius:GetModel( f1_local1 ), function ()
		local f5_local0 = DataSources.inGame.player.currentWeapon.crosshairRadius:GetValue( f1_local1 )
		if f5_local0 ~= nil then
			ReticleDoubleBarrelBaseWrapper:SetBottom( _1080p * Multiply( f5_local0, 1 ), 0 )
		end
	end )
	ReticleDoubleBarrelBaseWrapper:BindColorToModel( DataSources.inGame.player.currentWeapon.crosshairColor:GetModel( f1_local1 ) )
	ReticleDoubleBarrelBaseWrapper:SubscribeToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_local1 ), function ()
		local f6_local0 = DataSources.inGame.player.currentWeapon.adsPercent:GetValue( f1_local1 )
		if f6_local0 ~= nil then
			ReticleDoubleBarrelBaseWrapper:SetAlpha( Add( Multiply( f6_local0, -1.5 ), 1 ), 0 )
		end
	end )
	self:addElement( ReticleDoubleBarrelBaseWrapper )
	self.ReticleDoubleBarrelBaseWrapper = ReticleDoubleBarrelBaseWrapper
	
	return self
end

MenuBuilder.registerType( "ReticleDoubleBarrel", ReticleDoubleBarrel )
LockTable( _M )
