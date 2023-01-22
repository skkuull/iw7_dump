local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	local f1_local0 = DataSources.inGame.player.currentWeapon.charge
	f1_arg0:SubscribeToModel( f1_local0:GetModel( f1_arg1 ), function ( f2_arg0 )
		local f2_local0 = f1_local0:GetValue( f1_arg1 )
		if f2_local0 ~= nil then
			if f2_local0 > 0.15 then
				f1_arg0.SemiCircle1:SetAlpha( 0.8, 700, LUI.EASING.outQuadratic )
			else
				f1_arg0.SemiCircle1:SetAlpha( 0, 700, LUI.EASING.outQuadratic )
			end
			if f2_local0 > 0.3 then
				f1_arg0.SemiCircle2:SetAlpha( 0.8, 500, LUI.EASING.outQuadratic )
			else
				f1_arg0.SemiCircle2:SetAlpha( 0, 500, LUI.EASING.outQuadratic )
			end
			if f2_local0 > 0.45 then
				f1_arg0.SemiCircle3:SetAlpha( 0.8, 400, LUI.EASING.outQuadratic )
			else
				f1_arg0.SemiCircle3:SetAlpha( 0, 400, LUI.EASING.outQuadratic )
			end
			if f2_local0 > 0.6 then
				f1_arg0.SemiCircle4:SetAlpha( 0.8, 200, LUI.EASING.outQuadratic )
			else
				f1_arg0.SemiCircle4:SetAlpha( 0, 200, LUI.EASING.outQuadratic )
			end
			if f2_local0 > 0.75 then
				f1_arg0.SemiCircle5:SetAlpha( 0.8, 100, LUI.EASING.outQuadratic )
			else
				f1_arg0.SemiCircle5:SetAlpha( 0, 100, LUI.EASING.outQuadratic )
			end
			if f2_local0 > 0.9 then
				f1_arg0.SemiCircle6:SetAlpha( 0.8, 100, LUI.EASING.outQuadratic )
			else
				f1_arg0.SemiCircle6:SetAlpha( 0, 100, LUI.EASING.outQuadratic )
			end
		end
	end )
end

function ReticleGaussLBase( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 256 * _1080p, 0, 256 * _1080p )
	self.id = "ReticleGaussLBase"
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local SemiCircle1 = nil
	
	SemiCircle1 = LUI.UIImage.new()
	SemiCircle1.id = "SemiCircle1"
	SemiCircle1:SetZRotation( -15, 0 )
	SemiCircle1:setImage( RegisterMaterial( "hud_reticle_gauss_ring" ), 0 )
	SemiCircle1:SetBlendMode( BLEND_MODE.addWithAlpha )
	SemiCircle1:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -63, _1080p * 1, _1080p * 100, _1080p * 132 )
	self:addElement( SemiCircle1 )
	self.SemiCircle1 = SemiCircle1
	
	local SemiCircle2 = nil
	
	SemiCircle2 = LUI.UIImage.new()
	SemiCircle2.id = "SemiCircle2"
	SemiCircle2:SetZRotation( -45, 0 )
	SemiCircle2:setImage( RegisterMaterial( "hud_reticle_gauss_ring" ), 0 )
	SemiCircle2:SetBlendMode( BLEND_MODE.addWithAlpha )
	SemiCircle2:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -117, _1080p * -53, _1080p * 69, _1080p * 101 )
	self:addElement( SemiCircle2 )
	self.SemiCircle2 = SemiCircle2
	
	local SemiCircle3 = nil
	
	SemiCircle3 = LUI.UIImage.new()
	SemiCircle3.id = "SemiCircle3"
	SemiCircle3:SetZRotation( -75, 0 )
	SemiCircle3:setImage( RegisterMaterial( "hud_reticle_gauss_ring" ), 0 )
	SemiCircle3:SetBlendMode( BLEND_MODE.addWithAlpha )
	SemiCircle3:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -148, _1080p * -84, _1080p * 16, _1080p * 48 )
	self:addElement( SemiCircle3 )
	self.SemiCircle3 = SemiCircle3
	
	local SemiCircle4 = nil
	
	SemiCircle4 = LUI.UIImage.new()
	SemiCircle4.id = "SemiCircle4"
	SemiCircle4:SetZRotation( 255, 0 )
	SemiCircle4:setImage( RegisterMaterial( "hud_reticle_gauss_ring" ), 0 )
	SemiCircle4:SetBlendMode( BLEND_MODE.addWithAlpha )
	SemiCircle4:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -148, _1080p * -84, _1080p * -47, _1080p * -15 )
	self:addElement( SemiCircle4 )
	self.SemiCircle4 = SemiCircle4
	
	local SemiCircle5 = nil
	
	SemiCircle5 = LUI.UIImage.new()
	SemiCircle5.id = "SemiCircle5"
	SemiCircle5:SetZRotation( -135, 0 )
	SemiCircle5:setImage( RegisterMaterial( "hud_reticle_gauss_ring" ), 0 )
	SemiCircle5:SetBlendMode( BLEND_MODE.addWithAlpha )
	SemiCircle5:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -118, _1080p * -54, _1080p * -101, _1080p * -69 )
	self:addElement( SemiCircle5 )
	self.SemiCircle5 = SemiCircle5
	
	local SemiCircle6 = nil
	
	SemiCircle6 = LUI.UIImage.new()
	SemiCircle6.id = "SemiCircle6"
	SemiCircle6:SetZRotation( -345, 0 )
	SemiCircle6:setImage( RegisterMaterial( "hud_reticle_gauss_ring" ), 0 )
	SemiCircle6:SetBlendMode( BLEND_MODE.addWithAlpha )
	SemiCircle6:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -63, _1080p * 1, _1080p * -101, _1080p * -133 )
	self:addElement( SemiCircle6 )
	self.SemiCircle6 = SemiCircle6
	
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "ReticleGaussLBase", ReticleGaussLBase )
LockTable( _M )
