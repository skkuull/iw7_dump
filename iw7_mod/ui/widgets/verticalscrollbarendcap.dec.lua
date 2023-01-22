local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function VerticalScrollbarEndCap( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 16 * _1080p, 0, 20 * _1080p )
	self.id = "VerticalScrollbarEndCap"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local endCap = nil
	
	endCap = LUI.UIImage.new()
	endCap.id = "endCap"
	endCap:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -20, 0 )
	self:addElement( endCap )
	self.endCap = endCap
	
	return self
end

MenuBuilder.registerType( "VerticalScrollbarEndCap", VerticalScrollbarEndCap )
LockTable( _M )
