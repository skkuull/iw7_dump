local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function GenericFrameSlants( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 200 * _1080p, 0, 200 * _1080p )
	self.id = "GenericFrameSlants"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local BottomRight = nil
	
	BottomRight = LUI.UIImage.new()
	BottomRight.id = "BottomRight"
	BottomRight:setImage( RegisterMaterial( "wdg_slot_corner" ), 0 )
	BottomRight:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -64, 0, _1080p * -64, 0 )
	self:addElement( BottomRight )
	self.BottomRight = BottomRight
	
	local BottomLeft = nil
	
	BottomLeft = LUI.UIImage.new()
	BottomLeft.id = "BottomLeft"
	BottomLeft:setImage( RegisterMaterial( "wdg_slot_corner" ), 0 )
	BottomLeft:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 64, 0, _1080p * -64, 0 )
	self:addElement( BottomLeft )
	self.BottomLeft = BottomLeft
	
	local TopLeft = nil
	
	TopLeft = LUI.UIImage.new()
	TopLeft.id = "TopLeft"
	TopLeft:setImage( RegisterMaterial( "wdg_slot_corner" ), 0 )
	TopLeft:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 64, 0, _1080p * 64, 0 )
	self:addElement( TopLeft )
	self.TopLeft = TopLeft
	
	local TopRight = nil
	
	TopRight = LUI.UIImage.new()
	TopRight.id = "TopRight"
	TopRight:setImage( RegisterMaterial( "wdg_slot_corner" ), 0 )
	TopRight:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -64, 0, _1080p * 64, 0 )
	self:addElement( TopRight )
	self.TopRight = TopRight
	
	return self
end

MenuBuilder.registerType( "GenericFrameSlants", GenericFrameSlants )
LockTable( _M )
