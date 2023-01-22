local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function GeneralHUDFrameSquaresAndDots( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 350 * _1080p, 0, 16 * _1080p )
	self.id = "GeneralHUDFrameSquaresAndDots"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local VisualSquareRight = nil
	
	VisualSquareRight = LUI.UIImage.new()
	VisualSquareRight.id = "VisualSquareRight"
	VisualSquareRight:SetRGBFromTable( SWATCHES.HUD.stable, 0 )
	VisualSquareRight:setImage( RegisterMaterial( "hud_square_outline" ), 0 )
	VisualSquareRight:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -16, 0, _1080p * -16, 0 )
	self:addElement( VisualSquareRight )
	self.VisualSquareRight = VisualSquareRight
	
	local VisualSquareLeft = nil
	
	VisualSquareLeft = LUI.UIImage.new()
	VisualSquareLeft.id = "VisualSquareLeft"
	VisualSquareLeft:SetRGBFromTable( SWATCHES.HUD.stable, 0 )
	VisualSquareLeft:setImage( RegisterMaterial( "hud_square_outline" ), 0 )
	VisualSquareLeft:SetAnchorsAndPosition( 0, 1, 1, 0, 0, _1080p * 16, _1080p * -16, 0 )
	self:addElement( VisualSquareLeft )
	self.VisualSquareLeft = VisualSquareLeft
	
	local VisualTicCenter = nil
	
	VisualTicCenter = LUI.UIImage.new()
	VisualTicCenter.id = "VisualTicCenter"
	VisualTicCenter:SetRGBFromTable( SWATCHES.HUD.stable, 0 )
	VisualTicCenter:setImage( RegisterMaterial( "hud_frame_tics" ), 0 )
	VisualTicCenter:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -8, _1080p * 8, _1080p * -8, 0 )
	self:addElement( VisualTicCenter )
	self.VisualTicCenter = VisualTicCenter
	
	return self
end

MenuBuilder.registerType( "GeneralHUDFrameSquaresAndDots", GeneralHUDFrameSquaresAndDots )
LockTable( _M )
