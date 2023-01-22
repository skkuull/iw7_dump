local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function FrameCorner( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 100 * _1080p, 0, 100 * _1080p )
	self.id = "FrameCorner"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local vertical = nil
	
	vertical = LUI.UIImage.new()
	vertical.id = "vertical"
	vertical:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 1, 0, 0 )
	self:addElement( vertical )
	self.vertical = vertical
	
	local horizontal = nil
	
	horizontal = LUI.UIImage.new()
	horizontal.id = "horizontal"
	horizontal:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 1 )
	self:addElement( horizontal )
	self.horizontal = horizontal
	
	return self
end

MenuBuilder.registerType( "FrameCorner", FrameCorner )
LockTable( _M )
