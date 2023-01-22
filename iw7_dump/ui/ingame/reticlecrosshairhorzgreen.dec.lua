local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ReticleCrosshairHorzGreen( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 40 * _1080p, 0, 40 * _1080p )
	self.id = "ReticleCrosshairHorzGreen"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local ReticleCrosshairVertGreen = nil
	
	ReticleCrosshairVertGreen = MenuBuilder.BuildRegisteredType( "ReticleCrosshairVertGreen", {
		controllerIndex = f1_local1
	} )
	ReticleCrosshairVertGreen.id = "ReticleCrosshairVertGreen"
	ReticleCrosshairVertGreen:SetZRotation( 90, 0 )
	ReticleCrosshairVertGreen:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -8, _1080p * 8, _1080p * -8, _1080p * 8 )
	self:addElement( ReticleCrosshairVertGreen )
	self.ReticleCrosshairVertGreen = ReticleCrosshairVertGreen
	
	return self
end

MenuBuilder.registerType( "ReticleCrosshairHorzGreen", ReticleCrosshairHorzGreen )
LockTable( _M )
