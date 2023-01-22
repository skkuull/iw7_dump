local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ReticleRipperScreen( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 128 * _1080p, 0, 128 * _1080p )
	self.id = "ReticleRipperScreen"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local ScreenShadow = nil
	
	ScreenShadow = LUI.UIImage.new()
	ScreenShadow.id = "ScreenShadow"
	ScreenShadow:SetRGBFromTable( SWATCHES.Reticles.DarkContrast, 0 )
	ScreenShadow:SetAlpha( 0.5, 0 )
	ScreenShadow:setImage( RegisterMaterial( "hud_reticle_ripper" ), 0 )
	ScreenShadow:SetUseAA( true )
	ScreenShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -42, _1080p * 42, 0, _1080p * 106 )
	self:addElement( ScreenShadow )
	self.ScreenShadow = ScreenShadow
	
	local Screen = nil
	
	Screen = LUI.UIImage.new()
	Screen.id = "Screen"
	Screen:setImage( RegisterMaterial( "hud_reticle_ripper" ), 0 )
	Screen:SetUseAA( true )
	Screen:SetBlendMode( BLEND_MODE.addWithAlpha )
	Screen:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -42, _1080p * 42, 0, _1080p * 106 )
	self:addElement( Screen )
	self.Screen = Screen
	
	local AmmoCounterBase = nil
	
	AmmoCounterBase = MenuBuilder.BuildRegisteredType( "AmmoCounterBase", {
		controllerIndex = f1_local1
	} )
	AmmoCounterBase.id = "AmmoCounterBase"
	AmmoCounterBase:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 48, _1080p * 80, _1080p * 114, _1080p * 128 )
	self:addElement( AmmoCounterBase )
	self.AmmoCounterBase = AmmoCounterBase
	
	return self
end

MenuBuilder.registerType( "ReticleRipperScreen", ReticleRipperScreen )
LockTable( _M )
