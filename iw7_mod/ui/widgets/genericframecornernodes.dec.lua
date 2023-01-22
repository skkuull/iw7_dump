local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function GenericFrameCornerNodes( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 20 * _1080p, 0, 20 * _1080p )
	self.id = "GenericFrameCornerNodes"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local CornerTopLeft = nil
	
	CornerTopLeft = LUI.UIImage.new()
	CornerTopLeft.id = "CornerTopLeft"
	CornerTopLeft:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 4, 0, _1080p * 4 )
	self:addElement( CornerTopLeft )
	self.CornerTopLeft = CornerTopLeft
	
	local CornerTopRight = nil
	
	CornerTopRight = LUI.UIImage.new()
	CornerTopRight.id = "CornerTopRight"
	CornerTopRight:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -4, 0, 0, _1080p * 4 )
	self:addElement( CornerTopRight )
	self.CornerTopRight = CornerTopRight
	
	local CornerBottomRight = nil
	
	CornerBottomRight = LUI.UIImage.new()
	CornerBottomRight.id = "CornerBottomRight"
	CornerBottomRight:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -4, 0, _1080p * -4, 0 )
	self:addElement( CornerBottomRight )
	self.CornerBottomRight = CornerBottomRight
	
	local CornerBottomLeft = nil
	
	CornerBottomLeft = LUI.UIImage.new()
	CornerBottomLeft.id = "CornerBottomLeft"
	CornerBottomLeft:SetAnchorsAndPosition( 0, 1, 1, 0, 0, _1080p * 4, _1080p * -4, 0 )
	self:addElement( CornerBottomLeft )
	self.CornerBottomLeft = CornerBottomLeft
	
	return self
end

MenuBuilder.registerType( "GenericFrameCornerNodes", GenericFrameCornerNodes )
LockTable( _M )
