local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function RigIcon( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 160 * _1080p, 0, 160 * _1080p )
	self.id = "RigIcon"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local SuperMeter = nil
	
	SuperMeter = MenuBuilder.BuildRegisteredType( "SuperMeter", {
		controllerIndex = f1_local1
	} )
	SuperMeter.id = "SuperMeter"
	SuperMeter:SetScale( -0.12, 0 )
	SuperMeter:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( SuperMeter )
	self.SuperMeter = SuperMeter
	
	return self
end

MenuBuilder.registerType( "RigIcon", RigIcon )
LockTable( _M )
