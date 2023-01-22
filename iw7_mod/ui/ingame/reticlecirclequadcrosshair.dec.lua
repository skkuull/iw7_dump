local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ReticleCircleQuadCrosshair( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 10 * _1080p, 0, 10 * _1080p )
	self.id = "ReticleCircleQuadCrosshair"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Circle = nil
	
	Circle = LUI.UIImage.new()
	Circle.id = "Circle"
	Circle:SetRGBFromTable( SWATCHES.Reticles.Black, 0 )
	Circle:SetAlpha( 0.5, 0 )
	Circle:setImage( RegisterMaterial( "hud_reticle_full_circle" ), 0 )
	Circle:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -12, _1080p * 12, _1080p * -12, _1080p * 12 )
	self:addElement( Circle )
	self.Circle = Circle
	
	local NotchR = nil
	
	NotchR = LUI.UIImage.new()
	NotchR.id = "NotchR"
	NotchR:SetRGBFromTable( SWATCHES.Reticles.Black, 0 )
	NotchR:SetAlpha( 0.4, 0 )
	NotchR:setImage( RegisterMaterial( "hud_reticle_notch" ), 0 )
	NotchR:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * 5, _1080p * 15, _1080p * -3, _1080p * 3 )
	self:addElement( NotchR )
	self.NotchR = NotchR
	
	local NotchL = nil
	
	NotchL = LUI.UIImage.new()
	NotchL.id = "NotchL"
	NotchL:SetRGBFromTable( SWATCHES.Reticles.Black, 0 )
	NotchL:SetAlpha( 0.4, 0 )
	NotchL:setImage( RegisterMaterial( "hud_reticle_notch" ), 0 )
	NotchL:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -15, _1080p * -5, _1080p * -3, _1080p * 3 )
	self:addElement( NotchL )
	self.NotchL = NotchL
	
	local NotchB = nil
	
	NotchB = LUI.UIImage.new()
	NotchB.id = "NotchB"
	NotchB:SetRGBFromTable( SWATCHES.Reticles.Black, 0 )
	NotchB:SetAlpha( 0.4, 0 )
	NotchB:SetZRotation( 90, 0 )
	NotchB:setImage( RegisterMaterial( "hud_reticle_notch" ), 0 )
	NotchB:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -5, _1080p * 5, _1080p * -23, _1080p * -17 )
	self:addElement( NotchB )
	self.NotchB = NotchB
	
	local NotchT = nil
	
	NotchT = LUI.UIImage.new()
	NotchT.id = "NotchT"
	NotchT:SetRGBFromTable( SWATCHES.Reticles.Black, 0 )
	NotchT:SetAlpha( 0.4, 0 )
	NotchT:SetZRotation( 90, 0 )
	NotchT:setImage( RegisterMaterial( "hud_reticle_notch" ), 0 )
	NotchT:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -5, _1080p * 5, _1080p * 7, _1080p * 13 )
	self:addElement( NotchT )
	self.NotchT = NotchT
	
	local OrangeDot = nil
	
	OrangeDot = MenuBuilder.BuildRegisteredType( "RedDot", {
		controllerIndex = f1_local1
	} )
	OrangeDot.id = "OrangeDot"
	OrangeDot:SetScale( -0.3, 0 )
	OrangeDot.DotShadow:SetRGBFromInt( 16738816, 0 )
	OrangeDot.Dot:SetRGBFromInt( 16738816, 0 )
	OrangeDot.DotHighlight:SetRGBFromInt( 16762112, 0 )
	OrangeDot:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -3, _1080p * 3, _1080p * -3, _1080p * 3 )
	self:addElement( OrangeDot )
	self.OrangeDot = OrangeDot
	
	return self
end

MenuBuilder.registerType( "ReticleCircleQuadCrosshair", ReticleCircleQuadCrosshair )
LockTable( _M )
