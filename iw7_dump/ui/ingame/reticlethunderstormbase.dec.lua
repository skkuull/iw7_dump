local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ReticleThunderstormBase( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 17 * _1080p, 0, 10 * _1080p )
	self.id = "ReticleThunderstormBase"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local BRNotchShadow = nil
	
	BRNotchShadow = LUI.UIImage.new()
	BRNotchShadow.id = "BRNotchShadow"
	BRNotchShadow:SetRGBFromTable( SWATCHES.Reticles.DarkContrast, 0 )
	BRNotchShadow:SetAlpha( 0.8, 0 )
	BRNotchShadow:SetZRotation( -30, 0 )
	BRNotchShadow:setImage( RegisterMaterial( "hud_reticle_notch_rounded_short" ), 0 )
	BRNotchShadow:SetUseAA( true )
	BRNotchShadow:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -8, _1080p * 8, _1080p * -3, _1080p * 3 )
	self:addElement( BRNotchShadow )
	self.BRNotchShadow = BRNotchShadow
	
	local BLNotchShadow = nil
	
	BLNotchShadow = LUI.UIImage.new()
	BLNotchShadow.id = "BLNotchShadow"
	BLNotchShadow:SetRGBFromTable( SWATCHES.Reticles.DarkContrast, 0 )
	BLNotchShadow:SetAlpha( 0.8, 0 )
	BLNotchShadow:SetZRotation( 30, 0 )
	BLNotchShadow:setImage( RegisterMaterial( "hud_reticle_notch_rounded_short" ), 0 )
	BLNotchShadow:SetUseAA( true )
	BLNotchShadow:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * -8, _1080p * 8, _1080p * -3, _1080p * 3 )
	self:addElement( BLNotchShadow )
	self.BLNotchShadow = BLNotchShadow
	
	local TRNotchShadow = nil
	
	TRNotchShadow = LUI.UIImage.new()
	TRNotchShadow.id = "TRNotchShadow"
	TRNotchShadow:SetRGBFromTable( SWATCHES.Reticles.DarkContrast, 0 )
	TRNotchShadow:SetAlpha( 0.8, 0 )
	TRNotchShadow:SetZRotation( 30, 0 )
	TRNotchShadow:setImage( RegisterMaterial( "hud_reticle_notch_rounded_short" ), 0 )
	TRNotchShadow:SetUseAA( true )
	TRNotchShadow:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -8, _1080p * 8, _1080p * -3, _1080p * 3 )
	self:addElement( TRNotchShadow )
	self.TRNotchShadow = TRNotchShadow
	
	local TLNotchShadow = nil
	
	TLNotchShadow = LUI.UIImage.new()
	TLNotchShadow.id = "TLNotchShadow"
	TLNotchShadow:SetRGBFromTable( SWATCHES.Reticles.DarkContrast, 0 )
	TLNotchShadow:SetAlpha( 0.8, 0 )
	TLNotchShadow:SetZRotation( -30, 0 )
	TLNotchShadow:setImage( RegisterMaterial( "hud_reticle_notch_rounded_short" ), 0 )
	TLNotchShadow:SetUseAA( true )
	TLNotchShadow:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -8, _1080p * 8, _1080p * -3, _1080p * 3 )
	self:addElement( TLNotchShadow )
	self.TLNotchShadow = TLNotchShadow
	
	local BRNotch = nil
	
	BRNotch = LUI.UIImage.new()
	BRNotch.id = "BRNotch"
	BRNotch:SetZRotation( -30, 0 )
	BRNotch:setImage( RegisterMaterial( "hud_reticle_notch_rounded_short" ), 0 )
	BRNotch:SetUseAA( true )
	BRNotch:SetBlendMode( BLEND_MODE.addWithAlpha )
	BRNotch:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -6, _1080p * 6, _1080p * -1, _1080p * 1 )
	self:addElement( BRNotch )
	self.BRNotch = BRNotch
	
	local BLNotch = nil
	
	BLNotch = LUI.UIImage.new()
	BLNotch.id = "BLNotch"
	BLNotch:SetZRotation( 30, 0 )
	BLNotch:setImage( RegisterMaterial( "hud_reticle_notch_rounded_short" ), 0 )
	BLNotch:SetUseAA( true )
	BLNotch:SetBlendMode( BLEND_MODE.addWithAlpha )
	BLNotch:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * -6, _1080p * 6, _1080p * -1, _1080p * 1 )
	self:addElement( BLNotch )
	self.BLNotch = BLNotch
	
	local TRNotch = nil
	
	TRNotch = LUI.UIImage.new()
	TRNotch.id = "TRNotch"
	TRNotch:SetZRotation( 30, 0 )
	TRNotch:setImage( RegisterMaterial( "hud_reticle_notch_rounded_short" ), 0 )
	TRNotch:SetUseAA( true )
	TRNotch:SetBlendMode( BLEND_MODE.addWithAlpha )
	TRNotch:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -6, _1080p * 6, _1080p * -1, _1080p * 1 )
	self:addElement( TRNotch )
	self.TRNotch = TRNotch
	
	local TLNotch = nil
	
	TLNotch = LUI.UIImage.new()
	TLNotch.id = "TLNotch"
	TLNotch:SetZRotation( -30, 0 )
	TLNotch:setImage( RegisterMaterial( "hud_reticle_notch_rounded_short" ), 0 )
	TLNotch:SetUseAA( true )
	TLNotch:SetBlendMode( BLEND_MODE.addWithAlpha )
	TLNotch:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -6, _1080p * 6, _1080p * -1, _1080p * 1 )
	self:addElement( TLNotch )
	self.TLNotch = TLNotch
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		BRNotchShadow:RegisterAnimationSequence( "Flicker", {
			{
				function ()
					return self.BRNotchShadow:SetAlpha( 0.6, 0 )
				end,
				function ()
					return self.BRNotchShadow:SetAlpha( 0.4, 60 )
				end
			}
		} )
		BLNotchShadow:RegisterAnimationSequence( "Flicker", {
			{
				function ()
					return self.BLNotchShadow:SetAlpha( 0.6, 0 )
				end,
				function ()
					return self.BLNotchShadow:SetAlpha( 0.4, 60 )
				end
			}
		} )
		TRNotchShadow:RegisterAnimationSequence( "Flicker", {
			{
				function ()
					return self.TRNotchShadow:SetAlpha( 0.6, 0 )
				end,
				function ()
					return self.TRNotchShadow:SetAlpha( 0.4, 60 )
				end
			}
		} )
		TLNotchShadow:RegisterAnimationSequence( "Flicker", {
			{
				function ()
					return self.TLNotchShadow:SetAlpha( 0.6, 0 )
				end,
				function ()
					return self.TLNotchShadow:SetAlpha( 0.4, 60 )
				end
			}
		} )
		BRNotch:RegisterAnimationSequence( "Flicker", {
			{
				function ()
					return self.BRNotch:SetAlpha( 0.75, 0 )
				end,
				function ()
					return self.BRNotch:SetAlpha( 0.5, 60 )
				end
			}
		} )
		BLNotch:RegisterAnimationSequence( "Flicker", {
			{
				function ()
					return self.BLNotch:SetAlpha( 0.75, 0 )
				end,
				function ()
					return self.BLNotch:SetAlpha( 0.5, 60 )
				end
			}
		} )
		TRNotch:RegisterAnimationSequence( "Flicker", {
			{
				function ()
					return self.TRNotch:SetAlpha( 0.75, 0 )
				end,
				function ()
					return self.TRNotch:SetAlpha( 0.5, 60 )
				end
			}
		} )
		TLNotch:RegisterAnimationSequence( "Flicker", {
			{
				function ()
					return self.TLNotch:SetAlpha( 0.75, 0 )
				end,
				function ()
					return self.TLNotch:SetAlpha( 0.5, 60 )
				end
			}
		} )
		self._sequences.Flicker = function ()
			BRNotchShadow:AnimateLoop( "Flicker" )
			BLNotchShadow:AnimateLoop( "Flicker" )
			TRNotchShadow:AnimateLoop( "Flicker" )
			TLNotchShadow:AnimateLoop( "Flicker" )
			BRNotch:AnimateLoop( "Flicker" )
			BLNotch:AnimateLoop( "Flicker" )
			TRNotch:AnimateLoop( "Flicker" )
			TLNotch:AnimateLoop( "Flicker" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	return self
end

MenuBuilder.registerType( "ReticleThunderstormBase", ReticleThunderstormBase )
LockTable( _M )
