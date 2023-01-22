local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ReticleChargingBracketsWrapper( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 256 * _1080p, 0, 256 * _1080p )
	self.id = "ReticleChargingBracketsWrapper"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local ReticleChargingBrackets = nil
	
	ReticleChargingBrackets = MenuBuilder.BuildRegisteredType( "ReticleChargingBrackets", {
		controllerIndex = f1_local1
	} )
	ReticleChargingBrackets.id = "ReticleChargingBrackets"
	ReticleChargingBrackets:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -100, _1080p * 100, _1080p * -100, _1080p * 100 )
	ReticleChargingBrackets:BindAlphaToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_local1 ) )
	self:addElement( ReticleChargingBrackets )
	self.ReticleChargingBrackets = ReticleChargingBrackets
	
	return self
end

MenuBuilder.registerType( "ReticleChargingBracketsWrapper", ReticleChargingBracketsWrapper )
LockTable( _M )
