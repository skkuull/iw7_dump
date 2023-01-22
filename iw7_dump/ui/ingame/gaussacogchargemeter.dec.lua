local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function GaussAcogChargeMeter( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 50 * _1080p, 0, 16 * _1080p )
	self.id = "GaussAcogChargeMeter"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local ChargeMeterL = nil
	
	ChargeMeterL = MenuBuilder.BuildRegisteredType( "ChargeMeterScope", {
		controllerIndex = f1_local1
	} )
	ChargeMeterL.id = "ChargeMeterL"
	ChargeMeterL:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -165, _1080p * -155, _1080p * -70, _1080p * 70 )
	ChargeMeterL:SubscribeToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.player.currentWeapon.adsPercent:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			ChargeMeterL:SetAlpha( Multiply( Add( f2_local0, -0.9 ), 10 ), 0 )
		end
	end )
	self:addElement( ChargeMeterL )
	self.ChargeMeterL = ChargeMeterL
	
	local ChargeMeterR = nil
	
	ChargeMeterR = MenuBuilder.BuildRegisteredType( "ChargeMeterScope", {
		controllerIndex = f1_local1
	} )
	ChargeMeterR.id = "ChargeMeterR"
	ChargeMeterR:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * 154, _1080p * 165, _1080p * -70, _1080p * 70 )
	ChargeMeterR:SubscribeToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_local1 ), function ()
		local f3_local0 = DataSources.inGame.player.currentWeapon.adsPercent:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			ChargeMeterR:SetAlpha( Multiply( Add( f3_local0, -0.9 ), 10 ), 0 )
		end
	end )
	self:addElement( ChargeMeterR )
	self.ChargeMeterR = ChargeMeterR
	
	local AmmoCounterBlue = nil
	
	AmmoCounterBlue = MenuBuilder.BuildRegisteredType( "AmmoCounterBlue", {
		controllerIndex = f1_local1
	} )
	AmmoCounterBlue.id = "AmmoCounterBlue"
	AmmoCounterBlue:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 50, 0, _1080p * 16 )
	self:addElement( AmmoCounterBlue )
	self.AmmoCounterBlue = AmmoCounterBlue
	
	return self
end

MenuBuilder.registerType( "GaussAcogChargeMeter", GaussAcogChargeMeter )
LockTable( _M )
