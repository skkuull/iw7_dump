local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function GaussReflexChargeMeter( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 160 * _1080p, 0, 80 * _1080p )
	self.id = "GaussReflexChargeMeter"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local ChargeMeterScopeCopy0 = nil
	
	ChargeMeterScopeCopy0 = MenuBuilder.BuildRegisteredType( "ChargeMeterScope", {
		controllerIndex = f1_local1
	} )
	ChargeMeterScopeCopy0.id = "ChargeMeterScopeCopy0"
	ChargeMeterScopeCopy0:SetZRotation( -3, 0 )
	ChargeMeterScopeCopy0:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 3, _1080p * 9, _1080p * -79, _1080p * 1 )
	self:addElement( ChargeMeterScopeCopy0 )
	self.ChargeMeterScopeCopy0 = ChargeMeterScopeCopy0
	
	local ChargeMeterScopeCopy1 = nil
	
	ChargeMeterScopeCopy1 = MenuBuilder.BuildRegisteredType( "ChargeMeterScope", {
		controllerIndex = f1_local1
	} )
	ChargeMeterScopeCopy1.id = "ChargeMeterScopeCopy1"
	ChargeMeterScopeCopy1:SetZRotation( 3, 0 )
	ChargeMeterScopeCopy1:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -9, _1080p * -3, _1080p * -79, _1080p * 1 )
	self:addElement( ChargeMeterScopeCopy1 )
	self.ChargeMeterScopeCopy1 = ChargeMeterScopeCopy1
	
	return self
end

MenuBuilder.registerType( "GaussReflexChargeMeter", GaussReflexChargeMeter )
LockTable( _M )
