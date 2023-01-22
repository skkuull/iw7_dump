local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function GaussAcogChargeMeterAlt( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 10 * _1080p, 0, 10 * _1080p )
	self.id = "GaussAcogChargeMeterAlt"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local BlueDot = nil
	
	BlueDot = MenuBuilder.BuildRegisteredType( "RedDot", {
		controllerIndex = f1_local1
	} )
	BlueDot.id = "BlueDot"
	BlueDot.DotShadow:SetRGBFromTable( SWATCHES.Reticles.Blue, 0 )
	BlueDot.Dot:SetRGBFromTable( SWATCHES.Reticles.Blue, 0 )
	BlueDot.DotHighlight:SetRGBFromTable( SWATCHES.Reticles.Periwinkle, 0 )
	BlueDot:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( BlueDot )
	self.BlueDot = BlueDot
	
	local ChargeMeterL = nil
	
	ChargeMeterL = MenuBuilder.BuildRegisteredType( "ChargeMeterScope", {
		controllerIndex = f1_local1
	} )
	ChargeMeterL.id = "ChargeMeterL"
	ChargeMeterL:SetZRotation( -45, 0 )
	ChargeMeterL:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -26, _1080p * -19, _1080p * -47, _1080p * 5 )
	ChargeMeterL:SubscribeToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.player.currentWeapon.adsPercent:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			ChargeMeterL:SetAlpha( Multiply( Add( f2_local0, -0.5 ), 2 ), 0 )
		end
	end )
	self:addElement( ChargeMeterL )
	self.ChargeMeterL = ChargeMeterL
	
	local ChargeMeterR = nil
	
	ChargeMeterR = MenuBuilder.BuildRegisteredType( "ChargeMeterScope", {
		controllerIndex = f1_local1
	} )
	ChargeMeterR.id = "ChargeMeterR"
	ChargeMeterR:SetZRotation( -45, 0 )
	ChargeMeterR:SetDepth( 1, 0 )
	ChargeMeterR:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * 15, _1080p * 22, _1080p * 5, _1080p * 57 )
	ChargeMeterR:SubscribeToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_local1 ), function ()
		local f3_local0 = DataSources.inGame.player.currentWeapon.adsPercent:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			ChargeMeterR:SetAlpha( Multiply( Add( f3_local0, -0.5 ), 2 ), 0 )
		end
	end )
	self:addElement( ChargeMeterR )
	self.ChargeMeterR = ChargeMeterR
	
	return self
end

MenuBuilder.registerType( "GaussAcogChargeMeterAlt", GaussAcogChargeMeterAlt )
LockTable( _M )
