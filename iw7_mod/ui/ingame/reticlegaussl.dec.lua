local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	local f1_local0 = DataSources.inGame.player.currentWeapon.charge
	f1_arg0:SubscribeToModel( f1_local0:GetModel( f1_arg1 ), function ( f2_arg0 )
		local f2_local0 = f1_local0:GetValue( f1_arg1 )
		if f2_local0 ~= nil then
			if f2_local0 > 0.25 then
				f1_arg0.Notch1:SetRGBFromTable( SWATCHES.Reticles.BrightGreen, 100, LUI.EASING.outQuadratic )
			else
				f1_arg0.Notch1:SetRGBFromInt( 15028736, 200, LUI.EASING.outQuadratic )
			end
			if f2_local0 > 0.5 then
				f1_arg0.Notch2:SetRGBFromTable( SWATCHES.Reticles.BrightGreen, 100, LUI.EASING.outQuadratic )
			else
				f1_arg0.Notch2:SetRGBFromInt( 15028736, 200, LUI.EASING.outQuadratic )
			end
			if f2_local0 > 0.75 then
				f1_arg0.Notch3:SetRGBFromTable( SWATCHES.Reticles.BrightGreen, 100, LUI.EASING.outQuadratic )
			else
				f1_arg0.Notch3:SetRGBFromInt( 15028736, 200, LUI.EASING.outQuadratic )
			end
			if f2_local0 >= 1 then
				f1_arg0.NotchH:SetRGBFromTable( SWATCHES.Reticles.BrightGreen, 100, LUI.EASING.outQuadratic )
				f1_arg0.NotchV:SetRGBFromTable( SWATCHES.Reticles.BrightGreen, 100, LUI.EASING.outQuadratic )
			else
				f1_arg0.NotchH:SetRGBFromInt( 15028736, 200, LUI.EASING.outQuadratic )
				f1_arg0.NotchV:SetRGBFromInt( 15028736, 200, LUI.EASING.outQuadratic )
			end
		end
	end )
end

function ReticleGaussL( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1 * _1080p, 0, 1 * _1080p )
	self.id = "ReticleGaussL"
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local Notch1 = nil
	
	Notch1 = LUI.UIImage.new()
	Notch1.id = "Notch1"
	Notch1:SetRGBFromInt( 15028736, 0 )
	Notch1:SetAlpha( 0.2, 0 )
	Notch1:setImage( RegisterMaterial( "hud_reticle_notch" ), 0 )
	Notch1:SetVMin( -0.15, 0 )
	Notch1:SetVMax( 1.15, 0 )
	Notch1:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -2, _1080p * 2, _1080p * 16.25, _1080p * 19.25 )
	self:addElement( Notch1 )
	self.Notch1 = Notch1
	
	local Notch2 = nil
	
	Notch2 = LUI.UIImage.new()
	Notch2.id = "Notch2"
	Notch2:SetRGBFromInt( 15028736, 0 )
	Notch2:SetAlpha( 0.3, 0 )
	Notch2:setImage( RegisterMaterial( "hud_reticle_notch" ), 0 )
	Notch2:SetVMin( -0.15, 0 )
	Notch2:SetVMax( 1.15, 0 )
	Notch2:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -3, _1080p * 3, _1080p * 12, _1080p * 15 )
	self:addElement( Notch2 )
	self.Notch2 = Notch2
	
	local Notch3 = nil
	
	Notch3 = LUI.UIImage.new()
	Notch3.id = "Notch3"
	Notch3:SetRGBFromInt( 15028736, 0 )
	Notch3:SetAlpha( 0.4, 0 )
	Notch3:setImage( RegisterMaterial( "hud_reticle_notch" ), 0 )
	Notch3:SetVMin( -0.15, 0 )
	Notch3:SetVMax( 1.15, 0 )
	Notch3:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -6, _1080p * 6, _1080p * 7, _1080p * 10 )
	self:addElement( Notch3 )
	self.Notch3 = Notch3
	
	local NotchV = nil
	
	NotchV = LUI.UIImage.new()
	NotchV.id = "NotchV"
	NotchV:SetRGBFromInt( 15028736, 0 )
	NotchV:SetAlpha( 0.8, 0 )
	NotchV:SetZRotation( 90, 0 )
	NotchV:setImage( RegisterMaterial( "hud_reticle_notch" ), 0 )
	NotchV:SetVMin( -0.15, 0 )
	NotchV:SetVMax( 1.15, 0 )
	NotchV:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -5, _1080p * 5, _1080p * -1, _1080p * 1 )
	self:addElement( NotchV )
	self.NotchV = NotchV
	
	local NotchH = nil
	
	NotchH = LUI.UIImage.new()
	NotchH.id = "NotchH"
	NotchH:SetRGBFromInt( 15028736, 0 )
	NotchH:SetAlpha( 0.8, 0 )
	NotchH:setImage( RegisterMaterial( "hud_reticle_notch" ), 0 )
	NotchH:SetVMin( -0.15, 0 )
	NotchH:SetVMax( 1.15, 0 )
	NotchH:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -5, _1080p * 5, _1080p * -1, _1080p * 1 )
	self:addElement( NotchH )
	self.NotchH = NotchH
	
	local RetL = nil
	
	RetL = LUI.UIImage.new()
	RetL.id = "RetL"
	RetL:SetRGBFromInt( 0, 0 )
	RetL:setImage( RegisterMaterial( "hud_reticle_gauss_line" ), 0 )
	RetL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -48, 0, _1080p * -3.25, _1080p * 19.25 )
	self:addElement( RetL )
	self.RetL = RetL
	
	local RetR = nil
	
	RetR = LUI.UIImage.new()
	RetR.id = "RetR"
	RetR:SetRGBFromInt( 0, 0 )
	RetR:SetYRotation( 180, 0 )
	RetR:setImage( RegisterMaterial( "hud_reticle_gauss_line" ), 0 )
	RetR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, 0, _1080p * 48, _1080p * -3.25, _1080p * 19.25 )
	self:addElement( RetR )
	self.RetR = RetR
	
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "ReticleGaussL", ReticleGaussL )
LockTable( _M )
