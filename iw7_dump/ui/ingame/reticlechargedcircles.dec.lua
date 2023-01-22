local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0.ReticleCircleRotate:SetBlendMode( BLEND_MODE.addWithAlpha )
end

function ReticleChargedCircles( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 128 * _1080p, 0, 128 * _1080p )
	self.id = "ReticleChargedCircles"
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local ReticleCircleRotateShadow = nil
	
	ReticleCircleRotateShadow = MenuBuilder.BuildRegisteredType( "ReticleCircleRotate", {
		controllerIndex = f2_local1
	} )
	ReticleCircleRotateShadow.id = "ReticleCircleRotateShadow"
	ReticleCircleRotateShadow:SetRGBFromInt( 0, 0 )
	ReticleCircleRotateShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -13, _1080p * 13, _1080p * -13, _1080p * 13 )
	ReticleCircleRotateShadow:SubscribeToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f2_local1 ), function ()
		local f3_local0 = DataSources.inGame.player.currentWeapon.adsPercent:GetValue( f2_local1 )
		if f3_local0 ~= nil then
			ReticleCircleRotateShadow:SetAlpha( Lerp( f3_local0, 0, 0.2 ), 0 )
		end
	end )
	self:addElement( ReticleCircleRotateShadow )
	self.ReticleCircleRotateShadow = ReticleCircleRotateShadow
	
	local ReticleCircleRotate = nil
	
	ReticleCircleRotate = MenuBuilder.BuildRegisteredType( "ReticleCircleRotate", {
		controllerIndex = f2_local1
	} )
	ReticleCircleRotate.id = "ReticleCircleRotate"
	ReticleCircleRotate:SetRGBFromInt( 14975232, 0 )
	ReticleCircleRotate:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -13, _1080p * 13, _1080p * -13, _1080p * 13 )
	ReticleCircleRotate:SubscribeToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f2_local1 ), function ()
		local f4_local0 = DataSources.inGame.player.currentWeapon.adsPercent:GetValue( f2_local1 )
		if f4_local0 ~= nil then
			ReticleCircleRotate:SetAlpha( Lerp( f4_local0, 0.4, 0.8 ), 0 )
		end
	end )
	self:addElement( ReticleCircleRotate )
	self.ReticleCircleRotate = ReticleCircleRotate
	
	local DotBase = nil
	
	DotBase = MenuBuilder.BuildRegisteredType( "DotBase", {
		controllerIndex = f2_local1
	} )
	DotBase.id = "DotBase"
	DotBase.DotShadow:SetRGBFromInt( 14975232, 0 )
	DotBase.Dot:SetRGBFromInt( 14975232, 0 )
	DotBase.DotHighlight:SetRGBFromTable( SWATCHES.Reticles.Highlight, 0 )
	DotBase:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -2.5, _1080p * 2.5, _1080p * -2.5, _1080p * 2.5 )
	DotBase:SubscribeToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f2_local1 ), function ()
		local f5_local0 = DataSources.inGame.player.currentWeapon.adsPercent:GetValue( f2_local1 )
		if f5_local0 ~= nil then
			DotBase:SetAlpha( Lerp( f5_local0, 0, 0.8 ), 0 )
		end
	end )
	self:addElement( DotBase )
	self.DotBase = DotBase
	
	PostLoadFunc( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "ReticleChargedCircles", ReticleChargedCircles )
LockTable( _M )
