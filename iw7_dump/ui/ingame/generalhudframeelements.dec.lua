local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function GeneralHUDFrameElements( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "GeneralHUDFrameElements"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local BottomCenterTics = nil
	
	BottomCenterTics = LUI.UIImage.new()
	BottomCenterTics.id = "BottomCenterTics"
	BottomCenterTics:SetRGBFromTable( SWATCHES.HUD.stable, 0 )
	BottomCenterTics:SetAlpha( 0.15, 0 )
	BottomCenterTics:SetCurvedRenderingX( -0.1 )
	BottomCenterTics:SetCurvedRenderingY( 0.1 )
	BottomCenterTics:setImage( RegisterMaterial( "hud_bot_tics" ), 0 )
	BottomCenterTics:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -180, _1080p * 180, _1080p * -8, 0 )
	self:addElement( BottomCenterTics )
	self.BottomCenterTics = BottomCenterTics
	
	local BottomRightCorner = nil
	
	BottomRightCorner = MenuBuilder.BuildRegisteredType( "GeneralHUDFrameSquaresAndDots", {
		controllerIndex = f1_local1
	} )
	BottomRightCorner.id = "BottomRightCorner"
	BottomRightCorner:SetRGBFromTable( SWATCHES.HUD.stable, 0 )
	BottomRightCorner:SetAlpha( 0.15, 0 )
	BottomRightCorner:SetCurvedRenderingX( -0.25 )
	BottomRightCorner:SetCurvedRenderingY( 0.25 )
	BottomRightCorner:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -370, _1080p * -20, _1080p * -16, 0 )
	self:addElement( BottomRightCorner )
	self.BottomRightCorner = BottomRightCorner
	
	local BottomLeftCorner = nil
	
	BottomLeftCorner = MenuBuilder.BuildRegisteredType( "GeneralHUDFrameSquaresAndDots", {
		controllerIndex = f1_local1
	} )
	BottomLeftCorner.id = "BottomLeftCorner"
	BottomLeftCorner:SetRGBFromTable( SWATCHES.HUD.stable, 0 )
	BottomLeftCorner:SetAlpha( 0.15, 0 )
	BottomLeftCorner:SetCurvedRenderingX( -0.25 )
	BottomLeftCorner:SetCurvedRenderingY( 0.25 )
	BottomLeftCorner:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 20, _1080p * 370, _1080p * -16, 0 )
	self:addElement( BottomLeftCorner )
	self.BottomLeftCorner = BottomLeftCorner
	
	local TopRightCorner = nil
	
	TopRightCorner = MenuBuilder.BuildRegisteredType( "GeneralHUDFrameSquaresAndDots", {
		controllerIndex = f1_local1
	} )
	TopRightCorner.id = "TopRightCorner"
	TopRightCorner:SetRGBFromTable( SWATCHES.HUD.stable, 0 )
	TopRightCorner:SetAlpha( 0.15, 0 )
	TopRightCorner:SetZRotation( 180, 0 )
	TopRightCorner:SetCurvedRenderingX( -0.25 )
	TopRightCorner:SetCurvedRenderingY( 0.25 )
	TopRightCorner:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -370, _1080p * -20, 0, _1080p * 16 )
	self:addElement( TopRightCorner )
	self.TopRightCorner = TopRightCorner
	
	local TopLeftCorner = nil
	
	TopLeftCorner = MenuBuilder.BuildRegisteredType( "GeneralHUDFrameSquaresAndDots", {
		controllerIndex = f1_local1
	} )
	TopLeftCorner.id = "TopLeftCorner"
	TopLeftCorner:SetRGBFromTable( SWATCHES.HUD.stable, 0 )
	TopLeftCorner:SetAlpha( 0.15, 0 )
	TopLeftCorner:SetZRotation( 180, 0 )
	TopLeftCorner:SetCurvedRenderingX( -0.25 )
	TopLeftCorner:SetCurvedRenderingY( 0.25 )
	TopLeftCorner:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 20, _1080p * 370, 0, _1080p * 16 )
	self:addElement( TopLeftCorner )
	self.TopLeftCorner = TopLeftCorner
	
	return self
end

MenuBuilder.registerType( "GeneralHUDFrameElements", GeneralHUDFrameElements )
LockTable( _M )
