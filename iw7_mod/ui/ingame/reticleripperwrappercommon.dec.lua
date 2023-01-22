local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ReticleRipperWrapperCommon( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 128 * _1080p, 0, 128 * _1080p )
	self.id = "ReticleRipperWrapperCommon"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local ScreenShadow = nil
	
	ScreenShadow = LUI.UIImage.new()
	ScreenShadow.id = "ScreenShadow"
	ScreenShadow:SetRGBFromTable( SWATCHES.Reticles.BrightGreen, 0 )
	ScreenShadow:SetScale( -0.29, 0 )
	ScreenShadow:setImage( RegisterMaterial( "hud_reticle_ripper" ), 0 )
	ScreenShadow:SetUseAA( true )
	ScreenShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -47, _1080p * 47, _1080p * -18, _1080p * 106 )
	ScreenShadow:SubscribeToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.player.currentWeapon.adsPercent:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			ScreenShadow:SetAlpha( Lerp( f2_local0, 0, 0.4 ), 0 )
		end
	end )
	self:addElement( ScreenShadow )
	self.ScreenShadow = ScreenShadow
	
	local Screen = nil
	
	Screen = LUI.UIImage.new()
	Screen.id = "Screen"
	Screen:SetRGBFromTable( SWATCHES.Reticles.BrightGreen, 0 )
	Screen:SetScale( -0.3, 0 )
	Screen:setImage( RegisterMaterial( "hud_reticle_ripper" ), 0 )
	Screen:SetUseAA( true )
	Screen:SetBlendMode( BLEND_MODE.addWithAlpha )
	Screen:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -47, _1080p * 47, _1080p * -18, _1080p * 106 )
	Screen:SubscribeToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_local1 ), function ()
		local f3_local0 = DataSources.inGame.player.currentWeapon.adsPercent:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			Screen:SetAlpha( Lerp( f3_local0, 0, 0.8 ), 0 )
		end
	end )
	self:addElement( Screen )
	self.Screen = Screen
	
	local DotBase = nil
	
	DotBase = MenuBuilder.BuildRegisteredType( "DotBase", {
		controllerIndex = f1_local1
	} )
	DotBase.id = "DotBase"
	DotBase.DotShadow:SetRGBFromInt( 39424, 0 )
	DotBase.DotShadow:SetAlpha( 0.6, 0 )
	DotBase.Dot:SetRGBFromTable( SWATCHES.Reticles.BrightGreen, 0 )
	DotBase.Dot:SetAlpha( 0.8, 0 )
	DotBase.DotHighlight:SetRGBFromInt( 11403008, 0 )
	DotBase:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -2, _1080p * 2, _1080p * -2, _1080p * 2 )
	DotBase:BindAlphaToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_local1 ) )
	self:addElement( DotBase )
	self.DotBase = DotBase
	
	return self
end

MenuBuilder.registerType( "ReticleRipperWrapperCommon", ReticleRipperWrapperCommon )
LockTable( _M )
