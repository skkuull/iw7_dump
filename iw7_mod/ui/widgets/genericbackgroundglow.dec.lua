local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function GenericBackgroundGlow( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 24 * _1080p, 0, 24 * _1080p )
	self.id = "GenericBackgroundGlow"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local FrameMidLeft = nil
	
	FrameMidLeft = LUI.UIImage.new()
	FrameMidLeft.id = "FrameMidLeft"
	FrameMidLeft:setImage( RegisterMaterial( "widg_glow_lt" ), 0 )
	FrameMidLeft:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 8, _1080p * 8, _1080p * -8 )
	self:addElement( FrameMidLeft )
	self.FrameMidLeft = FrameMidLeft
	
	local FrameMidRight = nil
	
	FrameMidRight = LUI.UIImage.new()
	FrameMidRight.id = "FrameMidRight"
	FrameMidRight:setImage( RegisterMaterial( "widg_glow_rt" ), 0 )
	FrameMidRight:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -8, 0, _1080p * 8, _1080p * -8 )
	self:addElement( FrameMidRight )
	self.FrameMidRight = FrameMidRight
	
	local FrameLowerRight = nil
	
	FrameLowerRight = LUI.UIImage.new()
	FrameLowerRight.id = "FrameLowerRight"
	FrameLowerRight:setImage( RegisterMaterial( "widg_glow_bottom_rt" ), 0 )
	FrameLowerRight:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -8, 0, _1080p * -8, 0 )
	self:addElement( FrameLowerRight )
	self.FrameLowerRight = FrameLowerRight
	
	local FrameLowerLeft = nil
	
	FrameLowerLeft = LUI.UIImage.new()
	FrameLowerLeft.id = "FrameLowerLeft"
	FrameLowerLeft:setImage( RegisterMaterial( "widg_glow_bottom_lt" ), 0 )
	FrameLowerLeft:SetAnchorsAndPosition( 0, 1, 1, 0, 0, _1080p * 8, _1080p * -8, 0 )
	self:addElement( FrameLowerLeft )
	self.FrameLowerLeft = FrameLowerLeft
	
	local FrameUpperRight = nil
	
	FrameUpperRight = LUI.UIImage.new()
	FrameUpperRight.id = "FrameUpperRight"
	FrameUpperRight:setImage( RegisterMaterial( "widg_glow_top_rt" ), 0 )
	FrameUpperRight:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -8, 0, 0, _1080p * 8 )
	self:addElement( FrameUpperRight )
	self.FrameUpperRight = FrameUpperRight
	
	local FrameUpperLeft = nil
	
	FrameUpperLeft = LUI.UIImage.new()
	FrameUpperLeft.id = "FrameUpperLeft"
	FrameUpperLeft:setImage( RegisterMaterial( "widg_glow_top_lt" ), 0 )
	FrameUpperLeft:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 8, 0, _1080p * 8 )
	self:addElement( FrameUpperLeft )
	self.FrameUpperLeft = FrameUpperLeft
	
	local FrameCenter = nil
	
	FrameCenter = LUI.UIImage.new()
	FrameCenter.id = "FrameCenter"
	FrameCenter:setImage( RegisterMaterial( "widg_glow_center" ), 0 )
	FrameCenter:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 8, _1080p * -8, _1080p * 8, _1080p * -8 )
	self:addElement( FrameCenter )
	self.FrameCenter = FrameCenter
	
	local Image0 = nil
	
	Image0 = LUI.UIImage.new()
	Image0.id = "Image0"
	Image0:setImage( RegisterMaterial( "widg_glow_tp" ), 0 )
	Image0:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 8, _1080p * -8, 0, _1080p * 8 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image1 = nil
	
	Image1 = LUI.UIImage.new()
	Image1.id = "Image1"
	Image1:setImage( RegisterMaterial( "widg_glow_btm" ), 0 )
	Image1:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 8, _1080p * -8, _1080p * -8, 0 )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	return self
end

MenuBuilder.registerType( "GenericBackgroundGlow", GenericBackgroundGlow )
LockTable( _M )
