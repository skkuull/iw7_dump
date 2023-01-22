local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function VerticalScrollbarStartCap( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 16 * _1080p, 0, 20 * _1080p )
	self.id = "VerticalScrollbarStartCap"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local startCap = nil
	
	startCap = LUI.UIImage.new()
	startCap.id = "startCap"
	startCap:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 20 )
	self:addElement( startCap )
	self.startCap = startCap
	
	return self
end

MenuBuilder.registerType( "VerticalScrollbarStartCap", VerticalScrollbarStartCap )
LockTable( _M )
