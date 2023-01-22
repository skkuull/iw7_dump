local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ReticleProteusL( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 40 * _1080p, 0, 40 * _1080p )
	self.id = "ReticleProteusL"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Ret = nil
	
	Ret = LUI.UIImage.new()
	Ret.id = "Ret"
	Ret:SetRGBFromInt( 0, 0 )
	Ret:setImage( RegisterMaterial( "hud_reticle_proteus" ), 0 )
	Ret:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -160, _1080p * 160, _1080p * -160, _1080p * 160 )
	Ret:BindAlphaToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_local1 ) )
	self:addElement( Ret )
	self.Ret = Ret
	
	local BL = nil
	
	BL = LUI.UIImage.new()
	BL.id = "BL"
	BL:SetRGBFromInt( 0, 0 )
	BL:SetZRotation( 45, 0 )
	BL:setImage( RegisterMaterial( "hud_reticle_notch_rounded_long" ), 0 )
	BL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -31, _1080p * -7, _1080p * 18, _1080p * 20 )
	BL:BindAlphaToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_local1 ) )
	self:addElement( BL )
	self.BL = BL
	
	local BR = nil
	
	BR = LUI.UIImage.new()
	BR.id = "BR"
	BR:SetRGBFromInt( 0, 0 )
	BR:SetZRotation( -45, 0 )
	BR:setImage( RegisterMaterial( "hud_reticle_notch_rounded_long" ), 0 )
	BR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 7, _1080p * 31, _1080p * 18, _1080p * 20 )
	BR:BindAlphaToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_local1 ) )
	self:addElement( BR )
	self.BR = BR
	
	local TR = nil
	
	TR = LUI.UIImage.new()
	TR.id = "TR"
	TR:SetRGBFromInt( 0, 0 )
	TR:SetZRotation( 45, 0 )
	TR:setImage( RegisterMaterial( "hud_reticle_notch_rounded_long" ), 0 )
	TR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 7, _1080p * 31, _1080p * -20, _1080p * -18 )
	TR:BindAlphaToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_local1 ) )
	self:addElement( TR )
	self.TR = TR
	
	local TL = nil
	
	TL = LUI.UIImage.new()
	TL.id = "TL"
	TL:SetRGBFromInt( 0, 0 )
	TL:SetZRotation( -45, 0 )
	TL:setImage( RegisterMaterial( "hud_reticle_notch_rounded_long" ), 0 )
	TL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -31, _1080p * -7, _1080p * -20, _1080p * -18 )
	TL:BindAlphaToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_local1 ) )
	self:addElement( TL )
	self.TL = TL
	
	local Radial2 = nil
	
	Radial2 = LUI.UIImage.new()
	Radial2.id = "Radial2"
	Radial2:SetRGBFromInt( 16767744, 0 )
	Radial2:SetZRotation( -30, 0 )
	Radial2:setImage( RegisterMaterial( "hud_reticle_proteus_ring" ), 0 )
	Radial2:SetBlendMode( BLEND_MODE.addWithAlpha )
	Radial2:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -23, _1080p * 23, _1080p * -23, _1080p * 23 )
	Radial2:BindAlphaToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_local1 ) )
	self:addElement( Radial2 )
	self.Radial2 = Radial2
	
	local Radial = nil
	
	Radial = LUI.UIImage.new()
	Radial.id = "Radial"
	Radial:SetRGBFromInt( 16767744, 0 )
	Radial:setImage( RegisterMaterial( "hud_reticle_proteus_ring" ), 0 )
	Radial:SetBlendMode( BLEND_MODE.addWithAlpha )
	Radial:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -23, _1080p * 23, _1080p * -23, _1080p * 23 )
	Radial:BindAlphaToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_local1 ) )
	self:addElement( Radial )
	self.Radial = Radial
	
	local BarR = nil
	
	BarR = LUI.UIImage.new()
	BarR.id = "BarR"
	BarR:SetRGBFromInt( 0, 0 )
	BarR:setImage( RegisterMaterial( "hud_reticle_proteus_bar" ), 0 )
	BarR:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * 21, _1080p * 162, _1080p * -11, _1080p * 11 )
	BarR:SubscribeToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.player.currentWeapon.adsPercent:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			BarR:SetAlpha( Add( f2_local0, -0.8 ), 0 )
		end
	end )
	self:addElement( BarR )
	self.BarR = BarR
	
	local BaL = nil
	
	BaL = LUI.UIImage.new()
	BaL.id = "BaL"
	BaL:SetRGBFromInt( 0, 0 )
	BaL:SetZRotation( 180, 0 )
	BaL:setImage( RegisterMaterial( "hud_reticle_proteus_bar" ), 0 )
	BaL:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -162, _1080p * -21, _1080p * -11, _1080p * 11 )
	BaL:SubscribeToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_local1 ), function ()
		local f3_local0 = DataSources.inGame.player.currentWeapon.adsPercent:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			BaL:SetAlpha( Add( f3_local0, -0.8 ), 0 )
		end
	end )
	self:addElement( BaL )
	self.BaL = BaL
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		BL:RegisterAnimationSequence( "OnFire", {
			{
				function ()
					return self.BL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -31, _1080p * -7, _1080p * 18, _1080p * 20, 0 )
				end,
				function ()
					return self.BL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -36, _1080p * -20, _1080p * 26, _1080p * 28, 129, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.BL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -36, _1080p * -20, _1080p * 26, _1080p * 28, 470 )
				end,
				function ()
					return self.BL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -31, _1080p * -7, _1080p * 18, _1080p * 20, 109, LUI.EASING.outQuadratic )
				end
			}
		} )
		BR:RegisterAnimationSequence( "OnFire", {
			{
				function ()
					return self.BR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 7, _1080p * 31, _1080p * 18, _1080p * 20, 0 )
				end,
				function ()
					return self.BR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 20, _1080p * 36, _1080p * 26, _1080p * 28, 129, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.BR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 20, _1080p * 36, _1080p * 26, _1080p * 28, 470 )
				end,
				function ()
					return self.BR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 7, _1080p * 31, _1080p * 18, _1080p * 20, 109, LUI.EASING.outQuadratic )
				end
			}
		} )
		TR:RegisterAnimationSequence( "OnFire", {
			{
				function ()
					return self.TR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 7, _1080p * 31, _1080p * -20, _1080p * -18, 0 )
				end,
				function ()
					return self.TR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 20, _1080p * 36, _1080p * -29, _1080p * -27, 129, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.TR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 20, _1080p * 36, _1080p * -29, _1080p * -27, 470 )
				end,
				function ()
					return self.TR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 7, _1080p * 31, _1080p * -20, _1080p * -18, 109, LUI.EASING.outQuadratic )
				end
			}
		} )
		TL:RegisterAnimationSequence( "OnFire", {
			{
				function ()
					return self.TL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -31, _1080p * -7, _1080p * -20, _1080p * -18, 0 )
				end,
				function ()
					return self.TL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -36, _1080p * -20, _1080p * -29, _1080p * -27, 129, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.TL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -36, _1080p * -20, _1080p * -29, _1080p * -27, 470 )
				end,
				function ()
					return self.TL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -31, _1080p * -7, _1080p * -20, _1080p * -18, 109, LUI.EASING.outQuadratic )
				end
			}
		} )
		Radial2:RegisterAnimationSequence( "OnFire", {
			{
				function ()
					return self.Radial2:SetZRotation( -30, 200, LUI.EASING.inOutQuadratic )
				end,
				function ()
					return self.Radial2:SetZRotation( -210, 350, LUI.EASING.inOutQuadratic )
				end,
				function ()
					return self.Radial2:SetZRotation( -210, 160, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.Radial2:SetZRotation( -30, 10 )
				end
			},
			{
				function ()
					return self.Radial2:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -23, _1080p * 23, _1080p * -23, _1080p * 23, 0 )
				end,
				function ()
					return self.Radial2:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -26, _1080p * 26, _1080p * -26, _1080p * 26, 129, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.Radial2:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -26, _1080p * 26, _1080p * -26, _1080p * 26, 420, LUI.EASING.inOutQuadratic )
				end,
				function ()
					return self.Radial2:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -26, _1080p * 26, _1080p * -26, _1080p * 26, 50 )
				end,
				function ()
					return self.Radial2:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -23, _1080p * 23, _1080p * -23, _1080p * 23, 109, LUI.EASING.outQuadratic )
				end
			}
		} )
		Radial:RegisterAnimationSequence( "OnFire", {
			{
				function ()
					return self.Radial:SetZRotation( 0, 200, LUI.EASING.inOutQuadratic )
				end,
				function ()
					return self.Radial:SetZRotation( 180, 350, LUI.EASING.inOutQuadratic )
				end,
				function ()
					return self.Radial:SetZRotation( 180, 160, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.Radial:SetZRotation( 0, 10 )
				end
			},
			{
				function ()
					return self.Radial:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -23, _1080p * 23, _1080p * -23, _1080p * 23, 0 )
				end,
				function ()
					return self.Radial:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -20, _1080p * 20, _1080p * -20, _1080p * 20, 129, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.Radial:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -20, _1080p * 20, _1080p * -20, _1080p * 20, 420, LUI.EASING.inOutQuadratic )
				end,
				function ()
					return self.Radial:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -20, _1080p * 20, _1080p * -20, _1080p * 20, 50 )
				end,
				function ()
					return self.Radial:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -23, _1080p * 23, _1080p * -23, _1080p * 23, 109, LUI.EASING.outQuadratic )
				end
			}
		} )
		BarR:RegisterAnimationSequence( "OnFire", {
			{
				function ()
					return self.BarR:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * 21, _1080p * 162, _1080p * -11, _1080p * 11, 0 )
				end,
				function ()
					return self.BarR:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * 39, _1080p * 180, _1080p * -11, _1080p * 11, 129, LUI.EASING.inBack )
				end,
				function ()
					return self.BarR:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * 39, _1080p * 180, _1080p * -11, _1080p * 11, 70 )
				end,
				function ()
					return self.BarR:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * 21, _1080p * 162, _1080p * -11, _1080p * 11, 509, LUI.EASING.inQuadratic )
				end
			}
		} )
		BaL:RegisterAnimationSequence( "OnFire", {
			{
				function ()
					return self.BaL:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -162, _1080p * -21, _1080p * -11, _1080p * 11, 0 )
				end,
				function ()
					return self.BaL:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -180, _1080p * -39, _1080p * -11, _1080p * 11, 129, LUI.EASING.inBack )
				end,
				function ()
					return self.BaL:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -180, _1080p * -39, _1080p * -11, _1080p * 11, 70 )
				end,
				function ()
					return self.BaL:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -162, _1080p * -21, _1080p * -11, _1080p * 11, 509, LUI.EASING.inQuadratic )
				end
			}
		} )
		self._sequences.OnFire = function ()
			BL:AnimateSequence( "OnFire" )
			BR:AnimateSequence( "OnFire" )
			TR:AnimateSequence( "OnFire" )
			TL:AnimateSequence( "OnFire" )
			Radial2:AnimateSequence( "OnFire" )
			Radial:AnimateSequence( "OnFire" )
			BarR:AnimateSequence( "OnFire" )
			BaL:AnimateSequence( "OnFire" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.player.currentWeapon.shotCounter:GetModel( f1_local1 ), function ()
		ACTIONS.AnimateSequence( self, "OnFire" )
	end )
	return self
end

MenuBuilder.registerType( "ReticleProteusL", ReticleProteusL )
LockTable( _M )
