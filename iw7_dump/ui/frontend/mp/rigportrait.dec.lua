local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function RigPortrait( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 390 * _1080p, 0, 80 * _1080p )
	self.id = "RigPortrait"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	self:setUseStencil( true )
	local Portrait = nil
	
	Portrait = LUI.UIImage.new()
	Portrait.id = "Portrait"
	self:addElement( Portrait )
	self.Portrait = Portrait
	
	return self
end

MenuBuilder.registerType( "RigPortrait", RigPortrait )
LockTable( _M )
