local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function AmmoCounterGreen( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 50 * _1080p, 0, 16 * _1080p )
	self.id = "AmmoCounterGreen"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local AmmoCounterBase = nil
	
	AmmoCounterBase = MenuBuilder.BuildRegisteredType( "AmmoCounterBase", {
		controllerIndex = f1_local1
	} )
	AmmoCounterBase.id = "AmmoCounterBase"
	AmmoCounterBase:SetRGBFromTable( SWATCHES.Reticles.BrightGreen, 0 )
	AmmoCounterBase.AmmoCounter:SetShadowMinDistance( 0, 0 )
	AmmoCounterBase.AmmoCounter:SetShadowMaxDistance( 0, 0 )
	AmmoCounterBase.AmmoCounter:SetShadowRGBFromInt( 65280, 0 )
	AmmoCounterBase:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( AmmoCounterBase )
	self.AmmoCounterBase = AmmoCounterBase
	
	return self
end

MenuBuilder.registerType( "AmmoCounterGreen", AmmoCounterGreen )
LockTable( _M )
