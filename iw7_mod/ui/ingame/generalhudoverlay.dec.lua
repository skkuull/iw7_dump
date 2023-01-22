local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function GeneralHUDOverlay( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "GeneralHUDOverlay"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local CornerTopLeft = nil
	
	CornerTopLeft = LUI.UIImage.new()
	CornerTopLeft.id = "CornerTopLeft"
	CornerTopLeft:setImage( RegisterMaterial( "hud_darken_corner" ), 0 )
	CornerTopLeft:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, 0, _1080p * 440 )
	self:addElement( CornerTopLeft )
	self.CornerTopLeft = CornerTopLeft
	
	local CornerTopRight = nil
	
	CornerTopRight = LUI.UIImage.new()
	CornerTopRight.id = "CornerTopRight"
	CornerTopRight:setImage( RegisterMaterial( "hud_darken_corner" ), 0 )
	CornerTopRight:SetAnchorsAndPosition( 1, 0, 0, 1, 0, _1080p * -500, 0, _1080p * 440 )
	self:addElement( CornerTopRight )
	self.CornerTopRight = CornerTopRight
	
	local CornerBottomRight = nil
	
	CornerBottomRight = LUI.UIImage.new()
	CornerBottomRight.id = "CornerBottomRight"
	CornerBottomRight:setImage( RegisterMaterial( "hud_darken_corner" ), 0 )
	CornerBottomRight:SetAnchorsAndPosition( 1, 0, 1, 0, 0, _1080p * -500, 0, _1080p * -440 )
	self:addElement( CornerBottomRight )
	self.CornerBottomRight = CornerBottomRight
	
	local CornerBottomLeft = nil
	
	CornerBottomLeft = LUI.UIImage.new()
	CornerBottomLeft.id = "CornerBottomLeft"
	CornerBottomLeft:setImage( RegisterMaterial( "hud_darken_corner" ), 0 )
	CornerBottomLeft:SetAnchorsAndPosition( 0, 1, 1, 0, 0, _1080p * 500, 0, _1080p * -440 )
	self:addElement( CornerBottomLeft )
	self.CornerBottomLeft = CornerBottomLeft
	
	local BottomMiddle = nil
	
	BottomMiddle = LUI.UIImage.new()
	BottomMiddle.id = "BottomMiddle"
	BottomMiddle:setImage( RegisterMaterial( "hud_darken_mid" ), 0 )
	BottomMiddle:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -512, _1080p * 512, _1080p * -180, 0 )
	self:addElement( BottomMiddle )
	self.BottomMiddle = BottomMiddle
	
	return self
end

MenuBuilder.registerType( "GeneralHUDOverlay", GeneralHUDOverlay )
LockTable( _M )
