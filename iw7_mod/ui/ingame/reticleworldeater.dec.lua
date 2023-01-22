local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = 0.75
	f1_arg0:SubscribeToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_arg1 ), function ( f2_arg0 )
		local f2_local0 = DataModel.GetModelValue( f2_arg0 )
		if not f1_arg0.isVisible and f1_local0 <= f2_local0 then
			ACTIONS.AnimateSequence( f1_arg0, "ADSIN" )
			f1_arg0.isVisible = true
		elseif f1_arg0.isVisible and f2_local0 < f1_local0 then
			ACTIONS.AnimateSequence( f1_arg0, "ADSOUT" )
			f1_arg0.isVisible = false
		end
	end )
end

function ReticleWorldEater( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 72 * _1080p, 0, 72 * _1080p )
	self.id = "ReticleWorldEater"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local LMNotchShadow = nil
	
	LMNotchShadow = LUI.UIImage.new()
	LMNotchShadow.id = "LMNotchShadow"
	LMNotchShadow:SetRGBFromTable( SWATCHES.Reticles.DarkContrast, 0 )
	LMNotchShadow:SetAlpha( 0.4, 0 )
	LMNotchShadow:SetZRotation( 45, 0 )
	LMNotchShadow:setImage( RegisterMaterial( "hud_reticle_notch_rounded_long" ), 0 )
	LMNotchShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -19, _1080p * -13, _1080p * 14, _1080p * 18 )
	self:addElement( LMNotchShadow )
	self.LMNotchShadow = LMNotchShadow
	
	local BLNotchShadow = nil
	
	BLNotchShadow = LUI.UIImage.new()
	BLNotchShadow.id = "BLNotchShadow"
	BLNotchShadow:SetRGBFromTable( SWATCHES.Reticles.DarkContrast, 0 )
	BLNotchShadow:SetAlpha( 0.4, 0 )
	BLNotchShadow:setImage( RegisterMaterial( "hud_reticle_notch_rounded_short" ), 0 )
	BLNotchShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 19, _1080p * 25, _1080p * -1.5, _1080p * 2.5 )
	self:addElement( BLNotchShadow )
	self.BLNotchShadow = BLNotchShadow
	
	local RMNotchShadow = nil
	
	RMNotchShadow = LUI.UIImage.new()
	RMNotchShadow.id = "RMNotchShadow"
	RMNotchShadow:SetRGBFromTable( SWATCHES.Reticles.DarkContrast, 0 )
	RMNotchShadow:SetAlpha( 0.4, 0 )
	RMNotchShadow:SetZRotation( 45, 0 )
	RMNotchShadow:setImage( RegisterMaterial( "hud_reticle_notch_rounded_long" ), 0 )
	RMNotchShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 18, _1080p * 24, _1080p * -23, _1080p * -19 )
	self:addElement( RMNotchShadow )
	self.RMNotchShadow = RMNotchShadow
	
	local BRNotchShadow = nil
	
	BRNotchShadow = LUI.UIImage.new()
	BRNotchShadow.id = "BRNotchShadow"
	BRNotchShadow:SetRGBFromTable( SWATCHES.Reticles.DarkContrast, 0 )
	BRNotchShadow:SetAlpha( 0.4, 0 )
	BRNotchShadow:setImage( RegisterMaterial( "hud_reticle_notch_rounded_short" ), 0 )
	BRNotchShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 19, _1080p * 25, _1080p * -8.5, _1080p * -4.5 )
	self:addElement( BRNotchShadow )
	self.BRNotchShadow = BRNotchShadow
	
	local TRNotchShadow = nil
	
	TRNotchShadow = LUI.UIImage.new()
	TRNotchShadow.id = "TRNotchShadow"
	TRNotchShadow:SetRGBFromTable( SWATCHES.Reticles.DarkContrast, 0 )
	TRNotchShadow:SetAlpha( 0.4, 0 )
	TRNotchShadow:SetZRotation( 90, 0 )
	TRNotchShadow:setImage( RegisterMaterial( "hud_reticle_notch_rounded_short" ), 0 )
	TRNotchShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -4, _1080p * 4, _1080p * -24, _1080p * -20 )
	self:addElement( TRNotchShadow )
	self.TRNotchShadow = TRNotchShadow
	
	local TMNotchShadow = nil
	
	TMNotchShadow = LUI.UIImage.new()
	TMNotchShadow.id = "TMNotchShadow"
	TMNotchShadow:SetRGBFromTable( SWATCHES.Reticles.DarkContrast, 0 )
	TMNotchShadow:SetAlpha( 0.4, 0 )
	TMNotchShadow:SetZRotation( 90, 0 )
	TMNotchShadow:setImage( RegisterMaterial( "hud_reticle_notch_rounded_short" ), 0 )
	TMNotchShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -13, _1080p * -5, _1080p * -24, _1080p * -20 )
	self:addElement( TMNotchShadow )
	self.TMNotchShadow = TMNotchShadow
	
	local TLNotchShadow = nil
	
	TLNotchShadow = LUI.UIImage.new()
	TLNotchShadow.id = "TLNotchShadow"
	TLNotchShadow:SetRGBFromTable( SWATCHES.Reticles.DarkContrast, 0 )
	TLNotchShadow:SetAlpha( 0.4, 0 )
	TLNotchShadow:SetZRotation( 90, 0 )
	TLNotchShadow:setImage( RegisterMaterial( "hud_reticle_notch_rounded_short" ), 0 )
	TLNotchShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -22, _1080p * -14, _1080p * -24, _1080p * -20 )
	self:addElement( TLNotchShadow )
	self.TLNotchShadow = TLNotchShadow
	
	local LMNotch = nil
	
	LMNotch = LUI.UIImage.new()
	LMNotch.id = "LMNotch"
	LMNotch:SetRGBFromTable( SWATCHES.Reticles.White, 0 )
	LMNotch:SetAlpha( 0.4, 0 )
	LMNotch:SetZRotation( 45, 0 )
	LMNotch:setImage( RegisterMaterial( "hud_reticle_notch_rounded_long" ), 0 )
	LMNotch:SetBlendMode( BLEND_MODE.addWithAlpha )
	LMNotch:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -19, _1080p * -13, _1080p * 14, _1080p * 18 )
	self:addElement( LMNotch )
	self.LMNotch = LMNotch
	
	local RMNotch = nil
	
	RMNotch = LUI.UIImage.new()
	RMNotch.id = "RMNotch"
	RMNotch:SetRGBFromTable( SWATCHES.Reticles.White, 0 )
	RMNotch:SetAlpha( 0.4, 0 )
	RMNotch:SetZRotation( 45, 0 )
	RMNotch:setImage( RegisterMaterial( "hud_reticle_notch_rounded_long" ), 0 )
	RMNotch:SetBlendMode( BLEND_MODE.addWithAlpha )
	RMNotch:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 18, _1080p * 24, _1080p * -23, _1080p * -19 )
	self:addElement( RMNotch )
	self.RMNotch = RMNotch
	
	local TLNotch = nil
	
	TLNotch = LUI.UIImage.new()
	TLNotch.id = "TLNotch"
	TLNotch:SetRGBFromTable( SWATCHES.Reticles.White, 0 )
	TLNotch:SetAlpha( 0.4, 0 )
	TLNotch:SetZRotation( 90, 0 )
	TLNotch:setImage( RegisterMaterial( "hud_reticle_notch_rounded_short" ), 0 )
	TLNotch:SetBlendMode( BLEND_MODE.addWithAlpha )
	TLNotch:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -22, _1080p * -14, _1080p * -24, _1080p * -20 )
	self:addElement( TLNotch )
	self.TLNotch = TLNotch
	
	local BLNotch = nil
	
	BLNotch = LUI.UIImage.new()
	BLNotch.id = "BLNotch"
	BLNotch:SetRGBFromTable( SWATCHES.Reticles.White, 0 )
	BLNotch:SetAlpha( 0.4, 0 )
	BLNotch:setImage( RegisterMaterial( "hud_reticle_notch_rounded_short" ), 0 )
	BLNotch:SetBlendMode( BLEND_MODE.addWithAlpha )
	BLNotch:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 19, _1080p * 25, _1080p * -1.5, _1080p * 2.5 )
	self:addElement( BLNotch )
	self.BLNotch = BLNotch
	
	local TMNotch = nil
	
	TMNotch = LUI.UIImage.new()
	TMNotch.id = "TMNotch"
	TMNotch:SetRGBFromTable( SWATCHES.Reticles.White, 0 )
	TMNotch:SetAlpha( 0.4, 0 )
	TMNotch:SetZRotation( 90, 0 )
	TMNotch:setImage( RegisterMaterial( "hud_reticle_notch_rounded_short" ), 0 )
	TMNotch:SetBlendMode( BLEND_MODE.addWithAlpha )
	TMNotch:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -13, _1080p * -5, _1080p * -24, _1080p * -20 )
	self:addElement( TMNotch )
	self.TMNotch = TMNotch
	
	local TRNotch = nil
	
	TRNotch = LUI.UIImage.new()
	TRNotch.id = "TRNotch"
	TRNotch:SetRGBFromTable( SWATCHES.Reticles.White, 0 )
	TRNotch:SetAlpha( 0.4, 0 )
	TRNotch:SetZRotation( 90, 0 )
	TRNotch:setImage( RegisterMaterial( "hud_reticle_notch_rounded_short" ), 0 )
	TRNotch:SetBlendMode( BLEND_MODE.addWithAlpha )
	TRNotch:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -4, _1080p * 4, _1080p * -24, _1080p * -20 )
	self:addElement( TRNotch )
	self.TRNotch = TRNotch
	
	local BRNotch = nil
	
	BRNotch = LUI.UIImage.new()
	BRNotch.id = "BRNotch"
	BRNotch:SetRGBFromTable( SWATCHES.Reticles.White, 0 )
	BRNotch:SetAlpha( 0.4, 0 )
	BRNotch:setImage( RegisterMaterial( "hud_reticle_notch_rounded_short" ), 0 )
	BRNotch:SetBlendMode( BLEND_MODE.addWithAlpha )
	BRNotch:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 19, _1080p * 25, _1080p * -8.5, _1080p * -4.5 )
	self:addElement( BRNotch )
	self.BRNotch = BRNotch
	
	local DotBase = nil
	
	DotBase = MenuBuilder.BuildRegisteredType( "DotBase", {
		controllerIndex = f3_local1
	} )
	DotBase.id = "DotBase"
	DotBase.DotShadow:SetRGBFromTable( SWATCHES.Reticles.DarkContrast, 0 )
	DotBase.Dot:SetAlpha( 0, 0 )
	DotBase:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -4, _1080p * 4, _1080p * -4, _1080p * 4 )
	self:addElement( DotBase )
	self.DotBase = DotBase
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		LMNotchShadow:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.LMNotchShadow:SetRGBFromTable( SWATCHES.Reticles.Red, 100 )
				end
			},
			{
				function ()
					return self.LMNotchShadow:SetBlendMode( BLEND_MODE.disabled )
				end
			},
			{
				function ()
					return self.LMNotchShadow:SetAlpha( 0.3, 100 )
				end
			},
			{
				function ()
					return self.LMNotchShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -24, 0, _1080p * 10.5, _1080p * 13.5, 100 )
				end
			}
		} )
		BLNotchShadow:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.BLNotchShadow:SetRGBFromTable( SWATCHES.Reticles.Red, 100 )
				end
			},
			{
				function ()
					return self.BLNotchShadow:SetBlendMode( BLEND_MODE.disabled )
				end
			},
			{
				function ()
					return self.BLNotchShadow:SetAlpha( 0.3, 100 )
				end
			},
			{
				function ()
					return self.BLNotchShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 5, _1080p * 19, _1080p * -1.5, _1080p * 1.5, 100 )
				end
			}
		} )
		RMNotchShadow:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.RMNotchShadow:SetRGBFromTable( SWATCHES.Reticles.Red, 100 )
				end
			},
			{
				function ()
					return self.RMNotchShadow:SetBlendMode( BLEND_MODE.disabled )
				end
			},
			{
				function ()
					return self.RMNotchShadow:SetAlpha( 0.3, 100 )
				end
			},
			{
				function ()
					return self.RMNotchShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, 0, _1080p * 24, _1080p * -13, _1080p * -10, 100 )
				end
			}
		} )
		BRNotchShadow:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.BRNotchShadow:SetRGBFromTable( SWATCHES.Reticles.Red, 100 )
				end
			},
			{
				function ()
					return self.BRNotchShadow:SetBlendMode( BLEND_MODE.disabled )
				end
			},
			{
				function ()
					return self.BRNotchShadow:SetAlpha( 0.3, 100 )
				end
			},
			{
				function ()
					return self.BRNotchShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 14, _1080p * 24, _1080p * -11, _1080p * -8, 100 )
				end
			}
		} )
		TRNotchShadow:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.TRNotchShadow:SetBlendMode( BLEND_MODE.disabled )
				end
			},
			{
				function ()
					return self.TRNotchShadow:SetRGBFromTable( SWATCHES.Reticles.Red, 100 )
				end
			},
			{
				function ()
					return self.TRNotchShadow:SetAlpha( 0.3, 100 )
				end
			},
			{
				function ()
					return self.TRNotchShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 5, _1080p * 15, _1080p * -20, _1080p * -17, 100 )
				end
			}
		} )
		TMNotchShadow:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.TMNotchShadow:SetBlendMode( BLEND_MODE.disabled )
				end
			},
			{
				function ()
					return self.TMNotchShadow:SetRGBFromTable( SWATCHES.Reticles.Red, 100 )
				end
			},
			{
				function ()
					return self.TMNotchShadow:SetAlpha( 0.3, 100 )
				end
			},
			{
				function ()
					return self.TMNotchShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -7, _1080p * 7, _1080p * -13.5, _1080p * -10.5, 100 )
				end
			}
		} )
		TLNotchShadow:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.TLNotchShadow:SetBlendMode( BLEND_MODE.disabled )
				end
			},
			{
				function ()
					return self.TLNotchShadow:SetRGBFromTable( SWATCHES.Reticles.Red, 100 )
				end
			},
			{
				function ()
					return self.TLNotchShadow:SetAlpha( 0.3, 100 )
				end
			},
			{
				function ()
					return self.TLNotchShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -22, 0, _1080p * -4.5, _1080p * -1.5, 100 )
				end
			}
		} )
		LMNotch:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.LMNotch:SetRGBFromTable( SWATCHES.Reticles.Red, 100 )
				end
			},
			{
				function ()
					return self.LMNotch:SetAlpha( 0.6, 100 )
				end
			},
			{
				function ()
					return self.LMNotch:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -23, _1080p * -1, _1080p * 11, _1080p * 14, 100 )
				end
			}
		} )
		RMNotch:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.RMNotch:SetRGBFromTable( SWATCHES.Reticles.Red, 100 )
				end
			},
			{
				function ()
					return self.RMNotch:SetAlpha( 0.6, 100 )
				end
			},
			{
				function ()
					return self.RMNotch:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 1, _1080p * 23, _1080p * -12.5, _1080p * -9.5, 100 )
				end
			}
		} )
		TLNotch:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.TLNotch:SetZRotation( 90, 100 )
				end
			},
			{
				function ()
					return self.TLNotch:SetRGBFromTable( SWATCHES.Reticles.Red, 100 )
				end
			},
			{
				function ()
					return self.TLNotch:SetAlpha( 0.6, 100 )
				end
			},
			{
				function ()
					return self.TLNotch:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -21, _1080p * -1, _1080p * -4.5, _1080p * -1.5, 100 )
				end
			}
		} )
		BLNotch:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.BLNotch:SetRGBFromTable( SWATCHES.Reticles.Red, 100 )
				end
			},
			{
				function ()
					return self.BLNotch:SetAlpha( 0.6, 100 )
				end
			},
			{
				function ()
					return self.BLNotch:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 6, _1080p * 18, _1080p * -1.5, _1080p * 1.5, 100 )
				end
			}
		} )
		TMNotch:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.TMNotch:SetRGBFromTable( SWATCHES.Reticles.Red, 100 )
				end
			},
			{
				function ()
					return self.TMNotch:SetZRotation( 90, 100 )
				end
			},
			{
				function ()
					return self.TMNotch:SetAlpha( 0.6, 100 )
				end
			},
			{
				function ()
					return self.TMNotch:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -6, _1080p * 6, _1080p * -13.5, _1080p * -10.5, 100 )
				end
			}
		} )
		TRNotch:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.TRNotch:SetZRotation( 90, 100 )
				end
			},
			{
				function ()
					return self.TRNotch:SetRGBFromTable( SWATCHES.Reticles.Red, 100 )
				end
			},
			{
				function ()
					return self.TRNotch:SetAlpha( 0.6, 100 )
				end
			},
			{
				function ()
					return self.TRNotch:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 6, _1080p * 14, _1080p * -20, _1080p * -17, 100 )
				end
			}
		} )
		BRNotch:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.BRNotch:SetRGBFromTable( SWATCHES.Reticles.Red, 100 )
				end
			},
			{
				function ()
					return self.BRNotch:SetAlpha( 0.6, 100 )
				end
			},
			{
				function ()
					return self.BRNotch:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 15, _1080p * 23, _1080p * -11, _1080p * -8, 100 )
				end
			}
		} )
		DotBase:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.DotBase.DotShadow:SetRGBFromTable( SWATCHES.Reticles.Red, 100 )
				end
			},
			{
				function ()
					return self.DotBase.Dot:SetRGBFromTable( SWATCHES.Reticles.Red, 100 )
				end
			},
			{
				function ()
					return self.DotBase.DotHighlight:SetRGBFromTable( SWATCHES.Reticles.LightRed, 100 )
				end
			},
			{
				function ()
					return self.DotBase.Dot:SetAlpha( 1, 100 )
				end
			},
			{
				function ()
					return self.DotBase.DotHighlight:SetAlpha( 0.6, 100 )
				end
			}
		} )
		self._sequences.ADSIN = function ()
			LMNotchShadow:AnimateSequence( "ADSIN" )
			BLNotchShadow:AnimateSequence( "ADSIN" )
			RMNotchShadow:AnimateSequence( "ADSIN" )
			BRNotchShadow:AnimateSequence( "ADSIN" )
			TRNotchShadow:AnimateSequence( "ADSIN" )
			TMNotchShadow:AnimateSequence( "ADSIN" )
			TLNotchShadow:AnimateSequence( "ADSIN" )
			LMNotch:AnimateSequence( "ADSIN" )
			RMNotch:AnimateSequence( "ADSIN" )
			TLNotch:AnimateSequence( "ADSIN" )
			BLNotch:AnimateSequence( "ADSIN" )
			TMNotch:AnimateSequence( "ADSIN" )
			TRNotch:AnimateSequence( "ADSIN" )
			BRNotch:AnimateSequence( "ADSIN" )
			DotBase:AnimateSequence( "ADSIN" )
		end
		
		LMNotchShadow:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.LMNotchShadow:SetAlpha( 0.4, 100 )
				end
			},
			{
				function ()
					return self.LMNotchShadow:SetRGBFromTable( SWATCHES.Reticles.DarkContrast, 100 )
				end
			},
			{
				function ()
					return self.LMNotchShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -19, _1080p * -13, _1080p * 14, _1080p * 18, 100 )
				end
			}
		} )
		BLNotchShadow:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.BLNotchShadow:SetAlpha( 0.4, 100 )
				end
			},
			{
				function ()
					return self.BLNotchShadow:SetRGBFromTable( SWATCHES.Reticles.DarkContrast, 100 )
				end
			},
			{
				function ()
					return self.BLNotchShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 19, _1080p * 25, _1080p * -1.5, _1080p * 2.5, 100 )
				end
			}
		} )
		RMNotchShadow:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.RMNotchShadow:SetAlpha( 0.4, 100 )
				end
			},
			{
				function ()
					return self.RMNotchShadow:SetRGBFromTable( SWATCHES.Reticles.DarkContrast, 100 )
				end
			},
			{
				function ()
					return self.RMNotchShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 18, _1080p * 24, _1080p * -23, _1080p * -19, 100 )
				end
			}
		} )
		BRNotchShadow:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.BRNotchShadow:SetAlpha( 0.4, 100 )
				end
			},
			{
				function ()
					return self.BRNotchShadow:SetRGBFromTable( SWATCHES.Reticles.DarkContrast, 100 )
				end
			},
			{
				function ()
					return self.BRNotchShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 19, _1080p * 25, _1080p * -8.5, _1080p * -4.5, 100 )
				end
			}
		} )
		TRNotchShadow:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.TRNotchShadow:SetAlpha( 0.4, 100 )
				end
			},
			{
				function ()
					return self.TRNotchShadow:SetRGBFromTable( SWATCHES.Reticles.DarkContrast, 100 )
				end
			},
			{
				function ()
					return self.TRNotchShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -4, _1080p * 4, _1080p * -24, _1080p * -20, 100 )
				end
			}
		} )
		TMNotchShadow:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.TMNotchShadow:SetAlpha( 0.4, 100 )
				end
			},
			{
				function ()
					return self.TMNotchShadow:SetRGBFromTable( SWATCHES.Reticles.DarkContrast, 100 )
				end
			},
			{
				function ()
					return self.TMNotchShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -13, _1080p * -5, _1080p * -24, _1080p * -20, 100 )
				end
			}
		} )
		TLNotchShadow:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.TLNotchShadow:SetRGBFromTable( SWATCHES.Reticles.DarkContrast, 100 )
				end
			},
			{
				function ()
					return self.TLNotchShadow:SetAlpha( 0.4, 100 )
				end
			},
			{
				function ()
					return self.TLNotchShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -22, _1080p * -14, _1080p * -24, _1080p * -20, 100 )
				end
			}
		} )
		LMNotch:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.LMNotch:SetRGBFromTable( SWATCHES.Reticles.White, 100 )
				end
			},
			{
				function ()
					return self.LMNotch:SetAlpha( 0.4, 100 )
				end
			},
			{
				function ()
					return self.LMNotch:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -19, _1080p * -13, _1080p * 14, _1080p * 18, 100 )
				end
			}
		} )
		RMNotch:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.RMNotch:SetRGBFromTable( SWATCHES.Reticles.White, 100 )
				end
			},
			{
				function ()
					return self.RMNotch:SetAlpha( 0.4, 100 )
				end
			},
			{
				function ()
					return self.RMNotch:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 18, _1080p * 24, _1080p * -23, _1080p * -19, 100 )
				end
			}
		} )
		TLNotch:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.TLNotch:SetRGBFromTable( SWATCHES.Reticles.White, 100 )
				end
			},
			{
				function ()
					return self.TLNotch:SetAlpha( 0.4, 100 )
				end
			},
			{
				function ()
					return self.TLNotch:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -22, _1080p * -14, _1080p * -24, _1080p * -20, 100 )
				end
			}
		} )
		BLNotch:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.BLNotch:SetRGBFromTable( SWATCHES.Reticles.White, 100 )
				end
			},
			{
				function ()
					return self.BLNotch:SetAlpha( 0.4, 100 )
				end
			},
			{
				function ()
					return self.BLNotch:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 19, _1080p * 25, _1080p * -1.5, _1080p * 2.5, 100 )
				end
			}
		} )
		TMNotch:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.TMNotch:SetRGBFromTable( SWATCHES.Reticles.White, 100 )
				end
			},
			{
				function ()
					return self.TMNotch:SetAlpha( 0.4, 100 )
				end
			},
			{
				function ()
					return self.TMNotch:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -13, _1080p * -5, _1080p * -24, _1080p * -20, 100 )
				end
			}
		} )
		TRNotch:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.TRNotch:SetRGBFromTable( SWATCHES.Reticles.White, 100 )
				end
			},
			{
				function ()
					return self.TRNotch:SetAlpha( 0.4, 100 )
				end
			},
			{
				function ()
					return self.TRNotch:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -4, _1080p * 4, _1080p * -24, _1080p * -20, 100 )
				end
			}
		} )
		BRNotch:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.BRNotch:SetRGBFromTable( SWATCHES.Reticles.White, 100 )
				end
			},
			{
				function ()
					return self.BRNotch:SetAlpha( 0.4, 100 )
				end
			},
			{
				function ()
					return self.BRNotch:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 19, _1080p * 25, _1080p * -8.5, _1080p * -4.5, 100 )
				end
			}
		} )
		DotBase:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.DotBase.DotShadow:SetRGBFromTable( SWATCHES.Reticles.DarkContrast, 100 )
				end
			},
			{
				function ()
					return self.DotBase.Dot:SetRGBFromInt( 16777215, 100 )
				end
			},
			{
				function ()
					return self.DotBase.Dot:SetScale( 0.25, 100 )
				end
			},
			{
				function ()
					return self.DotBase.Dot:SetAlpha( 0, 100 )
				end
			},
			{
				function ()
					return self.DotBase.DotHighlight:SetRGBFromInt( 16777215, 100 )
				end
			},
			{
				function ()
					return self.DotBase.DotHighlight:SetAlpha( 0.4, 100 )
				end
			}
		} )
		self._sequences.ADSOUT = function ()
			LMNotchShadow:AnimateSequence( "ADSOUT" )
			BLNotchShadow:AnimateSequence( "ADSOUT" )
			RMNotchShadow:AnimateSequence( "ADSOUT" )
			BRNotchShadow:AnimateSequence( "ADSOUT" )
			TRNotchShadow:AnimateSequence( "ADSOUT" )
			TMNotchShadow:AnimateSequence( "ADSOUT" )
			TLNotchShadow:AnimateSequence( "ADSOUT" )
			LMNotch:AnimateSequence( "ADSOUT" )
			RMNotch:AnimateSequence( "ADSOUT" )
			TLNotch:AnimateSequence( "ADSOUT" )
			BLNotch:AnimateSequence( "ADSOUT" )
			TMNotch:AnimateSequence( "ADSOUT" )
			TRNotch:AnimateSequence( "ADSOUT" )
			BRNotch:AnimateSequence( "ADSOUT" )
			DotBase:AnimateSequence( "ADSOUT" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "ReticleWorldEater", ReticleWorldEater )
LockTable( _M )
