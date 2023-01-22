local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ReticleTacFrame( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 126 * _1080p, 0, 135 * _1080p )
	self.id = "ReticleTacFrame"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Glow = nil
	
	Glow = LUI.UIImage.new()
	Glow.id = "Glow"
	Glow:SetRGBFromTable( SWATCHES.Reticles.Blue, 0 )
	Glow:SetAlpha( 0.6, 0 )
	Glow:SetZRotation( 180, 0 )
	Glow:setImage( RegisterMaterial( "hud_reticle_hybrid_meter" ), 0 )
	Glow:SetBlendMode( BLEND_MODE.addWithAlpha )
	Glow:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -4.07, _1080p * 132.07, _1080p * -20, _1080p * 154 )
	self:addElement( Glow )
	self.Glow = Glow
	
	local FrameLCopy1 = nil
	
	FrameLCopy1 = LUI.UIImage.new()
	FrameLCopy1.id = "FrameLCopy1"
	FrameLCopy1:SetRGBFromTable( SWATCHES.Reticles.Blue, 0 )
	FrameLCopy1:SetAlpha( 0.2, 0 )
	FrameLCopy1:SetYRotation( 180, 0 )
	FrameLCopy1:setImage( RegisterMaterial( "hud_reticle_tac_frame" ), 0 )
	FrameLCopy1:SetVMin( 0.02, 0 )
	FrameLCopy1:SetBlendMode( BLEND_MODE.addWithAlpha )
	FrameLCopy1:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 2, _1080p * 16 )
	self:addElement( FrameLCopy1 )
	self.FrameLCopy1 = FrameLCopy1
	
	local FrameLCopy0 = nil
	
	FrameLCopy0 = LUI.UIImage.new()
	FrameLCopy0.id = "FrameLCopy0"
	FrameLCopy0:SetRGBFromTable( SWATCHES.Reticles.AzureBlue, 0 )
	FrameLCopy0:SetAlpha( 0.4, 0 )
	FrameLCopy0:SetYRotation( 180, 0 )
	FrameLCopy0:setImage( RegisterMaterial( "hud_reticle_tac_frame" ), 0 )
	FrameLCopy0:SetVMin( 0.02, 0 )
	FrameLCopy0:SetBlendMode( BLEND_MODE.addWithAlpha )
	FrameLCopy0:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -4, _1080p * 4, _1080p * -1, _1080p * 21 )
	self:addElement( FrameLCopy0 )
	self.FrameLCopy0 = FrameLCopy0
	
	local FrameL = nil
	
	FrameL = LUI.UIImage.new()
	FrameL.id = "FrameL"
	FrameL:SetRGBFromTable( SWATCHES.Reticles.LightCyan, 0 )
	FrameL:SetAlpha( 0.6, 0 )
	FrameL:SetYRotation( 180, 0 )
	FrameL:setImage( RegisterMaterial( "hud_reticle_tac_frame" ), 0 )
	FrameL:SetVMin( 0.02, 0 )
	FrameL:SetBlendMode( BLEND_MODE.addWithAlpha )
	FrameL:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -9, _1080p * 9, _1080p * -9, _1080p * 27 )
	self:addElement( FrameL )
	self.FrameL = FrameL
	
	return self
end

MenuBuilder.registerType( "ReticleTacFrame", ReticleTacFrame )
LockTable( _M )
