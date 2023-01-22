local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function GenericLineWithNodes( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 20 * _1080p, 0, 5 * _1080p )
	self.id = "GenericLineWithNodes"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local LeftNode = nil
	
	LeftNode = LUI.UIImage.new()
	LeftNode.id = "LeftNode"
	LeftNode:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 5, 0, _1080p * 5 )
	self:addElement( LeftNode )
	self.LeftNode = LeftNode
	
	local RightNode = nil
	
	RightNode = LUI.UIImage.new()
	RightNode.id = "RightNode"
	RightNode:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -5, 0, 0, _1080p * 5 )
	self:addElement( RightNode )
	self.RightNode = RightNode
	
	local Line = nil
	
	Line = LUI.UIImage.new()
	Line.id = "Line"
	Line:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 5, _1080p * -5, _1080p * 2, _1080p * 3 )
	self:addElement( Line )
	self.Line = Line
	
	return self
end

MenuBuilder.registerType( "GenericLineWithNodes", GenericLineWithNodes )
LockTable( _M )
