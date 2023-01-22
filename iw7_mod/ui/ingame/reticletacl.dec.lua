local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ReticleTacL( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 320 * _1080p, 0, 320 * _1080p )
	self.id = "ReticleTacL"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local FrameAcc = nil
	
	FrameAcc = LUI.UIImage.new()
	FrameAcc.id = "FrameAcc"
	FrameAcc:SetRGBFromTable( SWATCHES.Reticles.DarkContrast, 0 )
	FrameAcc:setImage( RegisterMaterial( "hud_reticle_tacl_frame_accent" ), 0 )
	FrameAcc:SetBlendMode( BLEND_MODE.addWithAlpha )
	FrameAcc:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -41, _1080p * 41, _1080p * -41, _1080p * 41 )
	self:addElement( FrameAcc )
	self.FrameAcc = FrameAcc
	
	local FrameS = nil
	
	FrameS = LUI.UIImage.new()
	FrameS.id = "FrameS"
	FrameS:SetRGBFromInt( 386, 0 )
	FrameS:SetAlpha( 0.6, 0 )
	FrameS:setImage( RegisterMaterial( "hud_reticle_tacl_frame" ), 0 )
	self:addElement( FrameS )
	self.FrameS = FrameS
	
	local Frame = nil
	
	Frame = LUI.UIImage.new()
	Frame.id = "Frame"
	Frame:SetRGBFromTable( SWATCHES.Reticles.AzureBlue, 0 )
	Frame:setImage( RegisterMaterial( "hud_reticle_tacl_frame" ), 0 )
	Frame:SetBlendMode( BLEND_MODE.addWithAlpha )
	self:addElement( Frame )
	self.Frame = Frame
	
	local CyanDot = nil
	
	CyanDot = MenuBuilder.BuildRegisteredType( "CyanDot", {
		controllerIndex = f1_local1
	} )
	CyanDot.id = "CyanDot"
	CyanDot:SetScale( -0.5, 0 )
	CyanDot:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -3, _1080p * 3, _1080p * -3, _1080p * 3 )
	self:addElement( CyanDot )
	self.CyanDot = CyanDot
	
	return self
end

MenuBuilder.registerType( "ReticleTacL", ReticleTacL )
LockTable( _M )
