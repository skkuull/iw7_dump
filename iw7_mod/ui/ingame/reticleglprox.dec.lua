local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ReticleGLProx( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 30 * _1080p, 0, 30 * _1080p )
	self.id = "ReticleGLProx"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local StemShadow = nil
	
	StemShadow = LUI.UIImage.new()
	StemShadow.id = "StemShadow"
	StemShadow:SetRGBFromTable( SWATCHES.Reticles.Orange, 0 )
	StemShadow:SetAlpha( 0.4, 0 )
	StemShadow:setImage( RegisterMaterial( "hud_reticle_glprox" ), 0 )
	StemShadow:SetUseAA( true )
	StemShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -20, _1080p * 21, 0, _1080p * 63 )
	self:addElement( StemShadow )
	self.StemShadow = StemShadow
	
	local Stem = nil
	
	Stem = LUI.UIImage.new()
	Stem.id = "Stem"
	Stem:SetRGBFromTable( SWATCHES.Reticles.Orange, 0 )
	Stem:setImage( RegisterMaterial( "hud_reticle_glprox" ), 0 )
	Stem:SetUseAA( true )
	Stem:SetBlendMode( BLEND_MODE.addWithAlpha )
	Stem:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -19, _1080p * 20, _1080p * -1, _1080p * 63 )
	self:addElement( Stem )
	self.Stem = Stem
	
	local NotchRShadow = nil
	
	NotchRShadow = LUI.UIImage.new()
	NotchRShadow.id = "NotchRShadow"
	NotchRShadow:SetRGBFromTable( SWATCHES.Reticles.Orange, 0 )
	NotchRShadow:SetAlpha( 0.2, 0 )
	NotchRShadow:setImage( RegisterMaterial( "hud_reticle_notch_rounded_short" ), 0 )
	NotchRShadow:SetUseAA( true )
	NotchRShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 10, _1080p * 20, _1080p * -2, _1080p * 2 )
	self:addElement( NotchRShadow )
	self.NotchRShadow = NotchRShadow
	
	local NotchTShadow = nil
	
	NotchTShadow = LUI.UIImage.new()
	NotchTShadow.id = "NotchTShadow"
	NotchTShadow:SetRGBFromTable( SWATCHES.Reticles.Orange, 0 )
	NotchTShadow:SetAlpha( 0.4, 0 )
	NotchTShadow:SetZRotation( 90, 0 )
	NotchTShadow:setImage( RegisterMaterial( "hud_reticle_notch_rounded_short" ), 0 )
	NotchTShadow:SetUseAA( true )
	NotchTShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -2, _1080p * 2, _1080p * -2, _1080p * 2 )
	self:addElement( NotchTShadow )
	self.NotchTShadow = NotchTShadow
	
	local NotchLShadow = nil
	
	NotchLShadow = LUI.UIImage.new()
	NotchLShadow.id = "NotchLShadow"
	NotchLShadow:SetRGBFromTable( SWATCHES.Reticles.Orange, 0 )
	NotchLShadow:SetAlpha( 0.2, 0 )
	NotchLShadow:setImage( RegisterMaterial( "hud_reticle_notch_rounded_short" ), 0 )
	NotchLShadow:SetUseAA( true )
	NotchLShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -20, _1080p * -10, _1080p * -2, _1080p * 2 )
	self:addElement( NotchLShadow )
	self.NotchLShadow = NotchLShadow
	
	local NotchL = nil
	
	NotchL = LUI.UIImage.new()
	NotchL.id = "NotchL"
	NotchL:SetRGBFromTable( SWATCHES.Reticles.Orange, 0 )
	NotchL:setImage( RegisterMaterial( "hud_reticle_notch_rounded_short" ), 0 )
	NotchL:SetUseAA( true )
	NotchL:SetBlendMode( BLEND_MODE.addWithAlpha )
	NotchL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -19, _1080p * -11, _1080p * -1, _1080p * 1 )
	self:addElement( NotchL )
	self.NotchL = NotchL
	
	local NotchR = nil
	
	NotchR = LUI.UIImage.new()
	NotchR.id = "NotchR"
	NotchR:SetRGBFromTable( SWATCHES.Reticles.Orange, 0 )
	NotchR:setImage( RegisterMaterial( "hud_reticle_notch_rounded_short" ), 0 )
	NotchR:SetUseAA( true )
	NotchR:SetBlendMode( BLEND_MODE.addWithAlpha )
	NotchR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 11, _1080p * 19, _1080p * -1, _1080p * 1 )
	self:addElement( NotchR )
	self.NotchR = NotchR
	
	local NotchT = nil
	
	NotchT = LUI.UIImage.new()
	NotchT.id = "NotchT"
	NotchT:SetRGBFromTable( SWATCHES.Reticles.Orange, 0 )
	NotchT:SetZRotation( 90, 0 )
	NotchT:setImage( RegisterMaterial( "hud_reticle_notch_rounded_short" ), 0 )
	NotchT:SetUseAA( true )
	NotchT:SetBlendMode( BLEND_MODE.addWithAlpha )
	NotchT:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -1, _1080p * 1, _1080p * -1, _1080p * 1 )
	self:addElement( NotchT )
	self.NotchT = NotchT
	
	local nubRS = nil
	
	nubRS = LUI.UIImage.new()
	nubRS.id = "nubRS"
	nubRS:SetRGBFromTable( SWATCHES.Reticles.Orange, 0 )
	nubRS:SetAlpha( 0.2, 0 )
	nubRS:SetZRotation( 90, 0 )
	nubRS:setImage( RegisterMaterial( "hud_reticle_notch_rounded_short" ), 0 )
	nubRS:SetUseAA( true )
	nubRS:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 16, _1080p * 20, _1080p * -3, _1080p * 1 )
	self:addElement( nubRS )
	self.nubRS = nubRS
	
	local NubR = nil
	
	NubR = LUI.UIImage.new()
	NubR.id = "NubR"
	NubR:SetRGBFromTable( SWATCHES.Reticles.Orange, 0 )
	NubR:SetZRotation( 90, 0 )
	NubR:setImage( RegisterMaterial( "hud_reticle_notch_rounded_short" ), 0 )
	NubR:SetUseAA( true )
	NubR:SetBlendMode( BLEND_MODE.addWithAlpha )
	NubR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 17, _1080p * 19, _1080p * -2, 0 )
	self:addElement( NubR )
	self.NubR = NubR
	
	local NubLS = nil
	
	NubLS = LUI.UIImage.new()
	NubLS.id = "NubLS"
	NubLS:SetRGBFromTable( SWATCHES.Reticles.Orange, 0 )
	NubLS:SetAlpha( 0.2, 0 )
	NubLS:SetZRotation( 90, 0 )
	NubLS:setImage( RegisterMaterial( "hud_reticle_notch_rounded_short" ), 0 )
	NubLS:SetUseAA( true )
	NubLS:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -20, _1080p * -16, _1080p * -3, _1080p * 1 )
	self:addElement( NubLS )
	self.NubLS = NubLS
	
	local NubL = nil
	
	NubL = LUI.UIImage.new()
	NubL.id = "NubL"
	NubL:SetRGBFromTable( SWATCHES.Reticles.Orange, 0 )
	NubL:SetZRotation( 90, 0 )
	NubL:setImage( RegisterMaterial( "hud_reticle_notch_rounded_short" ), 0 )
	NubL:SetUseAA( true )
	NubL:SetBlendMode( BLEND_MODE.addWithAlpha )
	NubL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -19, _1080p * -17, _1080p * -2, 0 )
	self:addElement( NubL )
	self.NubL = NubL
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		NotchRShadow:RegisterAnimationSequence( "OnFire", {
			{
				function ()
					return self.NotchRShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 20, _1080p * 30, _1080p * -2, _1080p * 2, 100 )
				end,
				function ()
					return self.NotchRShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 10, _1080p * 20, _1080p * -2, _1080p * 2, 899, LUI.EASING.inQuartic )
				end
			}
		} )
		NotchLShadow:RegisterAnimationSequence( "OnFire", {
			{
				function ()
					return self.NotchLShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -30, _1080p * -20, _1080p * -2, _1080p * 2, 100 )
				end,
				function ()
					return self.NotchLShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -20, _1080p * -10, _1080p * -2, _1080p * 2, 899, LUI.EASING.inQuartic )
				end
			}
		} )
		NotchL:RegisterAnimationSequence( "OnFire", {
			{
				function ()
					return self.NotchL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -29, _1080p * -21, _1080p * -1, _1080p * 1, 100 )
				end,
				function ()
					return self.NotchL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -19, _1080p * -11, _1080p * -1, _1080p * 1, 899, LUI.EASING.inQuartic )
				end
			}
		} )
		NotchR:RegisterAnimationSequence( "OnFire", {
			{
				function ()
					return self.NotchR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 21, _1080p * 29, _1080p * -1, _1080p * 1, 100 )
				end,
				function ()
					return self.NotchR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 11, _1080p * 19, _1080p * -1, _1080p * 1, 899, LUI.EASING.inQuartic )
				end
			}
		} )
		nubRS:RegisterAnimationSequence( "OnFire", {
			{
				function ()
					return self.nubRS:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 26, _1080p * 30, _1080p * -3, _1080p * 1, 100 )
				end,
				function ()
					return self.nubRS:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 16, _1080p * 20, _1080p * -3, _1080p * 1, 899, LUI.EASING.inQuartic )
				end
			}
		} )
		NubR:RegisterAnimationSequence( "OnFire", {
			{
				function ()
					return self.NubR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 27, _1080p * 29, _1080p * -2, 0, 100 )
				end,
				function ()
					return self.NubR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 17, _1080p * 19, _1080p * -2, 0, 899, LUI.EASING.inQuartic )
				end
			}
		} )
		NubLS:RegisterAnimationSequence( "OnFire", {
			{
				function ()
					return self.NubLS:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -30, _1080p * -26, _1080p * -3, _1080p * 1, 100 )
				end,
				function ()
					return self.NubLS:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -20, _1080p * -16, _1080p * -3, _1080p * 1, 899, LUI.EASING.inQuartic )
				end
			}
		} )
		NubL:RegisterAnimationSequence( "OnFire", {
			{
				function ()
					return self.NubL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -29, _1080p * -27, _1080p * -2, 0, 100 )
				end,
				function ()
					return self.NubL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -19, _1080p * -17, _1080p * -2, 0, 899, LUI.EASING.inQuadratic )
				end
			}
		} )
		self._sequences.OnFire = function ()
			NotchRShadow:AnimateSequence( "OnFire" )
			NotchLShadow:AnimateSequence( "OnFire" )
			NotchL:AnimateSequence( "OnFire" )
			NotchR:AnimateSequence( "OnFire" )
			nubRS:AnimateSequence( "OnFire" )
			NubR:AnimateSequence( "OnFire" )
			NubLS:AnimateSequence( "OnFire" )
			NubL:AnimateSequence( "OnFire" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.player.currentWeapon.shotCounter:GetModel( f1_local1 ), function ()
		ACTIONS.AnimateSequence( self, "OnFire" )
	end )
	return self
end

MenuBuilder.registerType( "ReticleGLProx", ReticleGLProx )
LockTable( _M )
