local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ReticleCircleDotLineSmall( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 64 * _1080p, 0, 64 * _1080p )
	self.id = "ReticleCircleDotLineSmall"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local DotLineShadow = nil
	
	DotLineShadow = LUI.UIImage.new()
	DotLineShadow.id = "DotLineShadow"
	DotLineShadow:SetRGBFromTable( SWATCHES.Reticles.LightRed, 0 )
	DotLineShadow:SetAlpha( 0.8, 0 )
	DotLineShadow:setImage( RegisterMaterial( "hud_reticle_dot_line_glow" ), 0 )
	DotLineShadow:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 4, _1080p * -4, _1080p * 4, _1080p * -4 )
	self:addElement( DotLineShadow )
	self.DotLineShadow = DotLineShadow
	
	local DotLine = nil
	
	DotLine = LUI.UIImage.new()
	DotLine.id = "DotLine"
	DotLine:SetRGBFromTable( SWATCHES.Reticles.LightRed, 0 )
	DotLine:SetAlpha( 0.8, 0 )
	DotLine:setImage( RegisterMaterial( "hud_reticle_dot_line_glow" ), 0 )
	DotLine:SetBlendMode( BLEND_MODE.addWithAlpha )
	DotLine:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 4, _1080p * -4, _1080p * 4, _1080p * -4 )
	self:addElement( DotLine )
	self.DotLine = DotLine
	
	local BRShadow = nil
	
	BRShadow = LUI.UIImage.new()
	BRShadow.id = "BRShadow"
	BRShadow:SetRGBFromTable( SWATCHES.Reticles.LightRed, 0 )
	BRShadow:SetAlpha( 0.8, 0 )
	BRShadow:SetZRotation( -135, 0 )
	BRShadow:setImage( RegisterMaterial( "hud_reticle_ring_segment" ), 0 )
	self:addElement( BRShadow )
	self.BRShadow = BRShadow
	
	local BLShadow = nil
	
	BLShadow = LUI.UIImage.new()
	BLShadow.id = "BLShadow"
	BLShadow:SetRGBFromTable( SWATCHES.Reticles.LightRed, 0 )
	BLShadow:SetAlpha( 0.8, 0 )
	BLShadow:SetZRotation( 135, 0 )
	BLShadow:setImage( RegisterMaterial( "hud_reticle_ring_segment" ), 0 )
	self:addElement( BLShadow )
	self.BLShadow = BLShadow
	
	local TRShadow = nil
	
	TRShadow = LUI.UIImage.new()
	TRShadow.id = "TRShadow"
	TRShadow:SetRGBFromTable( SWATCHES.Reticles.LightRed, 0 )
	TRShadow:SetAlpha( 0.8, 0 )
	TRShadow:SetZRotation( -45, 0 )
	TRShadow:setImage( RegisterMaterial( "hud_reticle_ring_segment" ), 0 )
	self:addElement( TRShadow )
	self.TRShadow = TRShadow
	
	local TLShadow = nil
	
	TLShadow = LUI.UIImage.new()
	TLShadow.id = "TLShadow"
	TLShadow:SetRGBFromTable( SWATCHES.Reticles.LightRed, 0 )
	TLShadow:SetAlpha( 0.8, 0 )
	TLShadow:SetZRotation( 45, 0 )
	TLShadow:setImage( RegisterMaterial( "hud_reticle_ring_segment" ), 0 )
	self:addElement( TLShadow )
	self.TLShadow = TLShadow
	
	local BRGlow = nil
	
	BRGlow = LUI.UIImage.new()
	BRGlow.id = "BRGlow"
	BRGlow:SetRGBFromTable( SWATCHES.Reticles.LightRed, 0 )
	BRGlow:SetAlpha( 0.8, 0 )
	BRGlow:SetZRotation( -135, 0 )
	BRGlow:setImage( RegisterMaterial( "hud_reticle_ring_segment" ), 0 )
	BRGlow:SetBlendMode( BLEND_MODE.addWithAlpha )
	self:addElement( BRGlow )
	self.BRGlow = BRGlow
	
	local BLGlow = nil
	
	BLGlow = LUI.UIImage.new()
	BLGlow.id = "BLGlow"
	BLGlow:SetRGBFromTable( SWATCHES.Reticles.LightRed, 0 )
	BLGlow:SetAlpha( 0.8, 0 )
	BLGlow:SetZRotation( 135, 0 )
	BLGlow:setImage( RegisterMaterial( "hud_reticle_ring_segment" ), 0 )
	BLGlow:SetBlendMode( BLEND_MODE.addWithAlpha )
	self:addElement( BLGlow )
	self.BLGlow = BLGlow
	
	local TRGlow = nil
	
	TRGlow = LUI.UIImage.new()
	TRGlow.id = "TRGlow"
	TRGlow:SetRGBFromTable( SWATCHES.Reticles.LightRed, 0 )
	TRGlow:SetAlpha( 0.8, 0 )
	TRGlow:SetZRotation( -45, 0 )
	TRGlow:setImage( RegisterMaterial( "hud_reticle_ring_segment" ), 0 )
	TRGlow:SetBlendMode( BLEND_MODE.addWithAlpha )
	self:addElement( TRGlow )
	self.TRGlow = TRGlow
	
	local TLGlow = nil
	
	TLGlow = LUI.UIImage.new()
	TLGlow.id = "TLGlow"
	TLGlow:SetRGBFromTable( SWATCHES.Reticles.LightRed, 0 )
	TLGlow:SetAlpha( 0.8, 0 )
	TLGlow:SetZRotation( 45, 0 )
	TLGlow:setImage( RegisterMaterial( "hud_reticle_ring_segment" ), 0 )
	TLGlow:SetBlendMode( BLEND_MODE.addWithAlpha )
	self:addElement( TLGlow )
	self.TLGlow = TLGlow
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		BRShadow:RegisterAnimationSequence( "OnFire", {
			{
				function ()
					return self.BRShadow:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 4, _1080p * 4, _1080p * 4, _1080p * 4, 0 )
				end,
				function ()
					return self.BRShadow:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0, 100 )
				end
			}
		} )
		BLShadow:RegisterAnimationSequence( "OnFire", {
			{
				function ()
					return self.BLShadow:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -4, _1080p * -4, _1080p * 4, _1080p * 4, 0 )
				end,
				function ()
					return self.BLShadow:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0, 100 )
				end
			}
		} )
		TRShadow:RegisterAnimationSequence( "OnFire", {
			{
				function ()
					return self.TRShadow:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 4, _1080p * 4, _1080p * -4, _1080p * -4, 0 )
				end,
				function ()
					return self.TRShadow:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0, 100 )
				end
			}
		} )
		TLShadow:RegisterAnimationSequence( "OnFire", {
			{
				function ()
					return self.TLShadow:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -4, _1080p * -4, _1080p * -4, _1080p * -4, 0 )
				end,
				function ()
					return self.TLShadow:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0, 100 )
				end
			}
		} )
		BRGlow:RegisterAnimationSequence( "OnFire", {
			{
				function ()
					return self.BRGlow:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 4, _1080p * 4, _1080p * 4, _1080p * 4, 0 )
				end,
				function ()
					return self.BRGlow:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0, 100 )
				end
			}
		} )
		BLGlow:RegisterAnimationSequence( "OnFire", {
			{
				function ()
					return self.BLGlow:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -4, _1080p * -4, _1080p * 4, _1080p * 4, 0 )
				end,
				function ()
					return self.BLGlow:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0, 100 )
				end
			}
		} )
		TRGlow:RegisterAnimationSequence( "OnFire", {
			{
				function ()
					return self.TRGlow:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 4, _1080p * 4, _1080p * -4, _1080p * -4, 0 )
				end,
				function ()
					return self.TRGlow:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0, 100 )
				end
			}
		} )
		TLGlow:RegisterAnimationSequence( "OnFire", {
			{
				function ()
					return self.TLGlow:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -4, _1080p * -4, _1080p * -4, _1080p * -4, 0 )
				end,
				function ()
					return self.TLGlow:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0, 100 )
				end
			}
		} )
		self._sequences.OnFire = function ()
			BRShadow:AnimateSequence( "OnFire" )
			BLShadow:AnimateSequence( "OnFire" )
			TRShadow:AnimateSequence( "OnFire" )
			TLShadow:AnimateSequence( "OnFire" )
			BRGlow:AnimateSequence( "OnFire" )
			BLGlow:AnimateSequence( "OnFire" )
			TRGlow:AnimateSequence( "OnFire" )
			TLGlow:AnimateSequence( "OnFire" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.player.currentWeapon.shotCounter:GetModel( f1_local1 ), function ()
		ACTIONS.AnimateSequence( self, "OnFire" )
	end )
	return self
end

MenuBuilder.registerType( "ReticleCircleDotLineSmall", ReticleCircleDotLineSmall )
LockTable( _M )
