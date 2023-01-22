local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function AmmoCounterGreenHipHide( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 50 * _1080p, 0, 16 * _1080p )
	self.id = "AmmoCounterGreenHipHide"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local AmmoCounterGreen = nil
	
	AmmoCounterGreen = MenuBuilder.BuildRegisteredType( "AmmoCounterGreen", {
		controllerIndex = f1_local1
	} )
	AmmoCounterGreen.id = "AmmoCounterGreen"
	AmmoCounterGreen:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -25, _1080p * 25, _1080p * -8, _1080p * 8 )
	AmmoCounterGreen:BindAlphaToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_local1 ) )
	self:addElement( AmmoCounterGreen )
	self.AmmoCounterGreen = AmmoCounterGreen
	
	return self
end

MenuBuilder.registerType( "AmmoCounterGreenHipHide", AmmoCounterGreenHipHide )
LockTable( _M )
