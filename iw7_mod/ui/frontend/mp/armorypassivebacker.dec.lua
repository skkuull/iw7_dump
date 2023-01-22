local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ArmoryPassiveBacker( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 18 * _1080p, 0, 18 * _1080p )
	self.id = "ArmoryPassiveBacker"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local PassiveDot = nil
	
	PassiveDot = LUI.UIImage.new()
	PassiveDot.id = "PassiveDot"
	PassiveDot:setImage( RegisterMaterial( "widg_circle_small" ), 0 )
	self:addElement( PassiveDot )
	self.PassiveDot = PassiveDot
	
	return self
end

MenuBuilder.registerType( "ArmoryPassiveBacker", ArmoryPassiveBacker )
LockTable( _M )
