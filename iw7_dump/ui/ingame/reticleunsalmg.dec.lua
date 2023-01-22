local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ReticleUnsaLmg( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 350 * _1080p, 0, 350 * _1080p )
	self.id = "ReticleUnsaLmg"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local ColorS = nil
	
	ColorS = LUI.UIImage.new()
	ColorS.id = "ColorS"
	ColorS:SetRGBFromTable( SWATCHES.Reticles.DarkRed, 0 )
	ColorS:SetAlpha( 0.4, 0 )
	ColorS:setImage( RegisterMaterial( "hud_reticle_unsalmg" ), 0 )
	self:addElement( ColorS )
	self.ColorS = ColorS
	
	local Color = nil
	
	Color = LUI.UIImage.new()
	Color.id = "Color"
	Color:SetRGBFromInt( 16711680, 0 )
	Color:SetAlpha( 0.8, 0 )
	Color:setImage( RegisterMaterial( "hud_reticle_unsalmg" ), 0 )
	Color:SetBlendMode( BLEND_MODE.addWithAlpha )
	self:addElement( Color )
	self.Color = Color
	
	local Frame = nil
	
	Frame = LUI.UIImage.new()
	Frame.id = "Frame"
	Frame:SetRGBFromInt( 0, 0 )
	Frame:setImage( RegisterMaterial( "hud_reticle_unsalmg_frame" ), 0 )
	self:addElement( Frame )
	self.Frame = Frame
	
	return self
end

MenuBuilder.registerType( "ReticleUnsaLmg", ReticleUnsaLmg )
LockTable( _M )
