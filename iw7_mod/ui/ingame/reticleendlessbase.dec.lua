local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = 0.5
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

function ReticleEndlessBase( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 64 * _1080p, 0, 64 * _1080p )
	self.id = "ReticleEndlessBase"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local HalfTLS = nil
	
	HalfTLS = LUI.UIImage.new()
	HalfTLS.id = "HalfTLS"
	HalfTLS:SetRGBFromTable( SWATCHES.Reticles.DarkContrast, 0 )
	HalfTLS:SetAlpha( 0.4, 0 )
	HalfTLS:setImage( RegisterMaterial( "hud_reticle_circle_third" ), 0 )
	HalfTLS:SetUseAA( true )
	HalfTLS:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -17, _1080p * 17, _1080p * -25, _1080p * 9 )
	self:addElement( HalfTLS )
	self.HalfTLS = HalfTLS
	
	local HalfTL = nil
	
	HalfTL = LUI.UIImage.new()
	HalfTL.id = "HalfTL"
	HalfTL:SetRGBFromTable( SWATCHES.Reticles.White, 0 )
	HalfTL:SetAlpha( 0.6, 0 )
	HalfTL:setImage( RegisterMaterial( "hud_reticle_circle_third" ), 0 )
	HalfTL:SetUseAA( true )
	HalfTL:SetBlendMode( BLEND_MODE.addWithAlpha )
	HalfTL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -17, _1080p * 17, _1080p * -25, _1080p * 9 )
	self:addElement( HalfTL )
	self.HalfTL = HalfTL
	
	local HalfBRS = nil
	
	HalfBRS = LUI.UIImage.new()
	HalfBRS.id = "HalfBRS"
	HalfBRS:SetRGBFromTable( SWATCHES.Reticles.DarkContrast, 0 )
	HalfBRS:SetAlpha( 0.4, 0 )
	HalfBRS:SetZRotation( 180, 0 )
	HalfBRS:setImage( RegisterMaterial( "hud_reticle_circle_third" ), 0 )
	HalfBRS:SetUseAA( true )
	HalfBRS:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -17, _1080p * 17, _1080p * -8, _1080p * 26 )
	self:addElement( HalfBRS )
	self.HalfBRS = HalfBRS
	
	local HalfBR = nil
	
	HalfBR = LUI.UIImage.new()
	HalfBR.id = "HalfBR"
	HalfBR:SetRGBFromTable( SWATCHES.Reticles.White, 0 )
	HalfBR:SetAlpha( 0.6, 0 )
	HalfBR:SetZRotation( 180, 0 )
	HalfBR:setImage( RegisterMaterial( "hud_reticle_circle_third" ), 0 )
	HalfBR:SetUseAA( true )
	HalfBR:SetBlendMode( BLEND_MODE.addWithAlpha )
	HalfBR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -17, _1080p * 17, _1080p * -8, _1080p * 26 )
	self:addElement( HalfBR )
	self.HalfBR = HalfBR
	
	local NotchLTS = nil
	
	NotchLTS = LUI.UIImage.new()
	NotchLTS.id = "NotchLTS"
	NotchLTS:SetRGBFromTable( SWATCHES.Reticles.DarkContrast, 0 )
	NotchLTS:SetAlpha( 0.4, 0 )
	NotchLTS:SetZRotation( 90, 0 )
	NotchLTS:setImage( RegisterMaterial( "hud_reticle_notch_rounded_short" ), 0 )
	NotchLTS:SetUseAA( true )
	NotchLTS:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -24, _1080p * -14, _1080p * -2, _1080p * 2 )
	self:addElement( NotchLTS )
	self.NotchLTS = NotchLTS
	
	local NotchLT = nil
	
	NotchLT = LUI.UIImage.new()
	NotchLT.id = "NotchLT"
	NotchLT:SetRGBFromTable( SWATCHES.Reticles.White, 0 )
	NotchLT:SetAlpha( 0.6, 0 )
	NotchLT:SetZRotation( 90, 0 )
	NotchLT:setImage( RegisterMaterial( "hud_reticle_notch_rounded_short" ), 0 )
	NotchLT:SetUseAA( true )
	NotchLT:SetBlendMode( BLEND_MODE.addWithAlpha )
	NotchLT:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -24, _1080p * -14, _1080p * -2, _1080p * 2 )
	self:addElement( NotchLT )
	self.NotchLT = NotchLT
	
	local NotchLBS = nil
	
	NotchLBS = LUI.UIImage.new()
	NotchLBS.id = "NotchLBS"
	NotchLBS:SetRGBFromTable( SWATCHES.Reticles.DarkContrast, 0 )
	NotchLBS:SetAlpha( 0.4, 0 )
	NotchLBS:SetZRotation( 90, 0 )
	NotchLBS:setImage( RegisterMaterial( "hud_reticle_notch_rounded_short" ), 0 )
	NotchLBS:SetUseAA( true )
	NotchLBS:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -18, _1080p * -8, _1080p * -2, _1080p * 2 )
	self:addElement( NotchLBS )
	self.NotchLBS = NotchLBS
	
	local NotchLB = nil
	
	NotchLB = LUI.UIImage.new()
	NotchLB.id = "NotchLB"
	NotchLB:SetRGBFromTable( SWATCHES.Reticles.White, 0 )
	NotchLB:SetAlpha( 0.6, 0 )
	NotchLB:SetZRotation( 90, 0 )
	NotchLB:setImage( RegisterMaterial( "hud_reticle_notch_rounded_short" ), 0 )
	NotchLB:SetUseAA( true )
	NotchLB:SetBlendMode( BLEND_MODE.addWithAlpha )
	NotchLB:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -18, _1080p * -8, _1080p * -2, _1080p * 2 )
	self:addElement( NotchLB )
	self.NotchLB = NotchLB
	
	local NotchRBS = nil
	
	NotchRBS = LUI.UIImage.new()
	NotchRBS.id = "NotchRBS"
	NotchRBS:SetRGBFromTable( SWATCHES.Reticles.DarkContrast, 0 )
	NotchRBS:SetAlpha( 0.4, 0 )
	NotchRBS:SetZRotation( 90, 0 )
	NotchRBS:setImage( RegisterMaterial( "hud_reticle_notch_rounded_short" ), 0 )
	NotchRBS:SetUseAA( true )
	NotchRBS:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 14, _1080p * 24, _1080p * -2, _1080p * 2 )
	self:addElement( NotchRBS )
	self.NotchRBS = NotchRBS
	
	local NotchRB = nil
	
	NotchRB = LUI.UIImage.new()
	NotchRB.id = "NotchRB"
	NotchRB:SetRGBFromTable( SWATCHES.Reticles.White, 0 )
	NotchRB:SetAlpha( 0.6, 0 )
	NotchRB:SetZRotation( 90, 0 )
	NotchRB:setImage( RegisterMaterial( "hud_reticle_notch_rounded_short" ), 0 )
	NotchRB:SetUseAA( true )
	NotchRB:SetBlendMode( BLEND_MODE.addWithAlpha )
	NotchRB:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 14, _1080p * 24, _1080p * -2, _1080p * 2 )
	self:addElement( NotchRB )
	self.NotchRB = NotchRB
	
	local NotchRTS = nil
	
	NotchRTS = LUI.UIImage.new()
	NotchRTS.id = "NotchRTS"
	NotchRTS:SetRGBFromTable( SWATCHES.Reticles.DarkContrast, 0 )
	NotchRTS:SetAlpha( 0.4, 0 )
	NotchRTS:SetZRotation( 90, 0 )
	NotchRTS:setImage( RegisterMaterial( "hud_reticle_notch_rounded_short" ), 0 )
	NotchRTS:SetUseAA( true )
	NotchRTS:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 8, _1080p * 18, _1080p * -2, _1080p * 2 )
	self:addElement( NotchRTS )
	self.NotchRTS = NotchRTS
	
	local NotchRT = nil
	
	NotchRT = LUI.UIImage.new()
	NotchRT.id = "NotchRT"
	NotchRT:SetRGBFromTable( SWATCHES.Reticles.White, 0 )
	NotchRT:SetAlpha( 0.6, 0 )
	NotchRT:SetZRotation( 90, 0 )
	NotchRT:setImage( RegisterMaterial( "hud_reticle_notch_rounded_short" ), 0 )
	NotchRT:SetUseAA( true )
	NotchRT:SetBlendMode( BLEND_MODE.addWithAlpha )
	NotchRT:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 8, _1080p * 18, _1080p * -2, _1080p * 2 )
	self:addElement( NotchRT )
	self.NotchRT = NotchRT
	
	local DotBase = nil
	
	DotBase = MenuBuilder.BuildRegisteredType( "DotBase", {
		controllerIndex = f3_local1
	} )
	DotBase.id = "DotBase"
	DotBase.Dot:SetAlpha( 0, 0 )
	DotBase:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -5, _1080p * 5, _1080p * -5, _1080p * 5 )
	self:addElement( DotBase )
	self.DotBase = DotBase
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		HalfTLS:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.HalfTLS:SetZRotation( 90, 100 )
				end
			},
			{
				function ()
					return self.HalfTLS:SetRGBFromTable( SWATCHES.Reticles.Red, 100 )
				end
			},
			{
				function ()
					return self.HalfTLS:SetAlpha( 0.4, 100 )
				end
			},
			{
				function ()
					return self.HalfTLS:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -29, _1080p * 9, _1080p * -19, _1080p * 19, 100 )
				end
			}
		} )
		HalfTL:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.HalfTL:SetZRotation( 90, 100 )
				end
			},
			{
				function ()
					return self.HalfTL:SetRGBFromTable( SWATCHES.Reticles.Red, 100 )
				end
			},
			{
				function ()
					return self.HalfTL:SetAlpha( 1, 100 )
				end
			},
			{
				function ()
					return self.HalfTL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -29, _1080p * 9, _1080p * -19, _1080p * 19, 100 )
				end
			}
		} )
		HalfBRS:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.HalfBRS:SetZRotation( 270, 100 )
				end
			},
			{
				function ()
					return self.HalfBRS:SetRGBFromTable( SWATCHES.Reticles.Red, 100 )
				end
			},
			{
				function ()
					return self.HalfBRS:SetScale( 0, 100 )
				end
			},
			{
				function ()
					return self.HalfBRS:SetAlpha( 0.4, 100 )
				end
			},
			{
				function ()
					return self.HalfBRS:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -9, _1080p * 29, _1080p * -19, _1080p * 19, 100 )
				end
			}
		} )
		HalfBR:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.HalfBR:SetZRotation( 270, 100 )
				end
			},
			{
				function ()
					return self.HalfBR:SetRGBFromTable( SWATCHES.Reticles.Red, 100 )
				end
			},
			{
				function ()
					return self.HalfBR:SetAlpha( 1, 100 )
				end
			},
			{
				function ()
					return self.HalfBR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -9, _1080p * 29, _1080p * -19, _1080p * 19, 100 )
				end
			}
		} )
		NotchLTS:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.NotchLTS:SetZRotation( -45, 100 )
				end
			},
			{
				function ()
					return self.NotchLTS:SetBlendMode( BLEND_MODE.disabled )
				end
			},
			{
				function ()
					return self.NotchLTS:SetRGBFromTable( SWATCHES.Reticles.Red, 100 )
				end
			},
			{
				function ()
					return self.NotchLTS:SetAlpha( 0.4, 100 )
				end
			},
			{
				function ()
					return self.NotchLTS:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -10, _1080p * -2, _1080p * -7.5, _1080p * -4.5, 100 )
				end
			}
		} )
		NotchLT:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.NotchLT:SetZRotation( -45, 100 )
				end
			},
			{
				function ()
					return self.NotchLT:SetRGBFromTable( SWATCHES.Reticles.Red, 100 )
				end
			},
			{
				function ()
					return self.NotchLT:SetAlpha( 1, 100 )
				end
			},
			{
				function ()
					return self.NotchLT:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -10, _1080p * -2, _1080p * -7.5, _1080p * -4.5, 100 )
				end
			}
		} )
		NotchLBS:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.NotchLBS:SetZRotation( 225, 100 )
				end
			},
			{
				function ()
					return self.NotchLBS:SetBlendMode( BLEND_MODE.disabled )
				end
			},
			{
				function ()
					return self.NotchLBS:SetRGBFromTable( SWATCHES.Reticles.Red, 100 )
				end
			},
			{
				function ()
					return self.NotchLBS:SetAlpha( 0.4, 100 )
				end
			},
			{
				function ()
					return self.NotchLBS:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -10, _1080p * -2, _1080p * 4.5, _1080p * 7.5, 100 )
				end
			}
		} )
		NotchLB:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.NotchLB:SetZRotation( 225, 100 )
				end
			},
			{
				function ()
					return self.NotchLB:SetRGBFromTable( SWATCHES.Reticles.Red, 100 )
				end
			},
			{
				function ()
					return self.NotchLB:SetAlpha( 1, 100 )
				end
			},
			{
				function ()
					return self.NotchLB:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -10, _1080p * -2, _1080p * 4.5, _1080p * 7.5, 100 )
				end
			}
		} )
		NotchRBS:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.NotchRBS:SetBlendMode( BLEND_MODE.disabled )
				end
			},
			{
				function ()
					return self.NotchRBS:SetZRotation( -45, 100 )
				end
			},
			{
				function ()
					return self.NotchRBS:SetRGBFromTable( SWATCHES.Reticles.Red, 100 )
				end
			},
			{
				function ()
					return self.NotchRBS:SetAlpha( 0.4, 100 )
				end
			},
			{
				function ()
					return self.NotchRBS:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 2, _1080p * 10, _1080p * 4.5, _1080p * 7.5, 100 )
				end
			}
		} )
		NotchRB:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.NotchRB:SetZRotation( -45, 100 )
				end
			},
			{
				function ()
					return self.NotchRB:SetRGBFromTable( SWATCHES.Reticles.Red, 100 )
				end
			},
			{
				function ()
					return self.NotchRB:SetAlpha( 1, 100 )
				end
			},
			{
				function ()
					return self.NotchRB:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 2, _1080p * 10, _1080p * 4.5, _1080p * 7.5, 100 )
				end
			}
		} )
		NotchRTS:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.NotchRTS:SetZRotation( 225, 100 )
				end
			},
			{
				function ()
					return self.NotchRTS:SetBlendMode( BLEND_MODE.disabled )
				end
			},
			{
				function ()
					return self.NotchRTS:SetRGBFromTable( SWATCHES.Reticles.Red, 100 )
				end
			},
			{
				function ()
					return self.NotchRTS:SetAlpha( 0.4, 100 )
				end
			},
			{
				function ()
					return self.NotchRTS:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 2, _1080p * 10, _1080p * -7.5, _1080p * -4.5, 100 )
				end
			}
		} )
		NotchRT:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.NotchRT:SetZRotation( 225, 100 )
				end
			},
			{
				function ()
					return self.NotchRT:SetRGBFromTable( SWATCHES.Reticles.Red, 100 )
				end
			},
			{
				function ()
					return self.NotchRT:SetAlpha( 1, 100 )
				end
			},
			{
				function ()
					return self.NotchRT:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 2, _1080p * 10, _1080p * -7.5, _1080p * -4.5, 100 )
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
					return self.DotBase:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -4, _1080p * 4, _1080p * -4, _1080p * 4, 100 )
				end
			}
		} )
		self._sequences.ADSIN = function ()
			HalfTLS:AnimateSequence( "ADSIN" )
			HalfTL:AnimateSequence( "ADSIN" )
			HalfBRS:AnimateSequence( "ADSIN" )
			HalfBR:AnimateSequence( "ADSIN" )
			NotchLTS:AnimateSequence( "ADSIN" )
			NotchLT:AnimateSequence( "ADSIN" )
			NotchLBS:AnimateSequence( "ADSIN" )
			NotchLB:AnimateSequence( "ADSIN" )
			NotchRBS:AnimateSequence( "ADSIN" )
			NotchRB:AnimateSequence( "ADSIN" )
			NotchRTS:AnimateSequence( "ADSIN" )
			NotchRT:AnimateSequence( "ADSIN" )
			DotBase:AnimateSequence( "ADSIN" )
		end
		
		HalfTLS:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.HalfTLS:SetZRotation( 0, 100 )
				end
			},
			{
				function ()
					return self.HalfTLS:SetRGBFromTable( SWATCHES.Reticles.DarkContrast, 100 )
				end
			},
			{
				function ()
					return self.HalfTLS:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -17, _1080p * 17, _1080p * -25, _1080p * 9, 100 )
				end
			}
		} )
		HalfTL:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.HalfTL:SetRGBFromInt( 16777215, 100 )
				end
			},
			{
				function ()
					return self.HalfTL:SetZRotation( 0, 100 )
				end
			},
			{
				function ()
					return self.HalfTL:SetAlpha( 0.6, 100 )
				end
			},
			{
				function ()
					return self.HalfTL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -17, _1080p * 17, _1080p * -25, _1080p * 9, 100 )
				end
			}
		} )
		HalfBRS:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.HalfBRS:SetZRotation( 180, 100 )
				end
			},
			{
				function ()
					return self.HalfBRS:SetRGBFromTable( SWATCHES.Reticles.DarkContrast, 100 )
				end
			},
			{
				function ()
					return self.HalfBRS:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -17, _1080p * 17, _1080p * -8, _1080p * 26, 100 )
				end
			}
		} )
		HalfBR:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.HalfBR:SetRGBFromInt( 16777215, 100 )
				end
			},
			{
				function ()
					return self.HalfBR:SetZRotation( 180, 100 )
				end
			},
			{
				function ()
					return self.HalfBR:SetAlpha( 0.6, 100 )
				end
			},
			{
				function ()
					return self.HalfBR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -17, _1080p * 17, _1080p * -8, _1080p * 26, 100 )
				end
			}
		} )
		NotchLTS:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.NotchLTS:SetZRotation( 90, 100 )
				end
			},
			{
				function ()
					return self.NotchLTS:SetRGBFromTable( SWATCHES.Reticles.DarkContrast, 100 )
				end
			},
			{
				function ()
					return self.NotchLTS:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -24, _1080p * -14, _1080p * -2, _1080p * 2, 100 )
				end
			}
		} )
		NotchLT:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.NotchLT:SetRGBFromInt( 16777215, 100 )
				end
			},
			{
				function ()
					return self.NotchLT:SetZRotation( 90, 100 )
				end
			},
			{
				function ()
					return self.NotchLT:SetAlpha( 0.6, 100 )
				end
			},
			{
				function ()
					return self.NotchLT:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -24, _1080p * -14, _1080p * -2, _1080p * 2, 100 )
				end
			}
		} )
		NotchLBS:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.NotchLBS:SetZRotation( 90, 100 )
				end
			},
			{
				function ()
					return self.NotchLBS:SetRGBFromTable( SWATCHES.Reticles.DarkContrast, 100 )
				end
			},
			{
				function ()
					return self.NotchLBS:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -18, _1080p * -8, _1080p * -2, _1080p * 2, 100 )
				end
			}
		} )
		NotchLB:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.NotchLB:SetRGBFromInt( 16777215, 100 )
				end
			},
			{
				function ()
					return self.NotchLB:SetZRotation( 90, 100 )
				end
			},
			{
				function ()
					return self.NotchLB:SetAlpha( 0.6, 100 )
				end
			},
			{
				function ()
					return self.NotchLB:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -18, _1080p * -8, _1080p * -2, _1080p * 2, 100 )
				end
			}
		} )
		NotchRBS:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.NotchRBS:SetZRotation( 90, 100 )
				end
			},
			{
				function ()
					return self.NotchRBS:SetRGBFromTable( SWATCHES.Reticles.DarkContrast, 100 )
				end
			},
			{
				function ()
					return self.NotchRBS:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 14, _1080p * 24, _1080p * -2, _1080p * 2, 100 )
				end
			}
		} )
		NotchRB:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.NotchRB:SetRGBFromInt( 16777215, 100 )
				end
			},
			{
				function ()
					return self.NotchRB:SetZRotation( 90, 100 )
				end
			},
			{
				function ()
					return self.NotchRB:SetAlpha( 0.6, 100 )
				end
			},
			{
				function ()
					return self.NotchRB:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 14, _1080p * 24, _1080p * -2, _1080p * 2, 100 )
				end
			}
		} )
		NotchRTS:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.NotchRTS:SetZRotation( 90, 100 )
				end
			},
			{
				function ()
					return self.NotchRTS:SetRGBFromTable( SWATCHES.Reticles.DarkContrast, 100 )
				end
			},
			{
				function ()
					return self.NotchRTS:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 8, _1080p * 18, _1080p * -2, _1080p * 2, 100 )
				end
			}
		} )
		NotchRT:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.NotchRT:SetRGBFromInt( 16777215, 100 )
				end
			},
			{
				function ()
					return self.NotchRT:SetZRotation( 90, 100 )
				end
			},
			{
				function ()
					return self.NotchRT:SetAlpha( 0.6, 100 )
				end
			},
			{
				function ()
					return self.NotchRT:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 8, _1080p * 18, _1080p * -2, _1080p * 2, 100 )
				end
			}
		} )
		DotBase:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.DotBase.DotShadow:SetRGBFromInt( 16777215, 100 )
				end
			},
			{
				function ()
					return self.DotBase.Dot:SetRGBFromInt( 16777215, 100 )
				end
			},
			{
				function ()
					return self.DotBase.DotHighlight:SetRGBFromInt( 16777215, 100 )
				end
			},
			{
				function ()
					return self.DotBase.Dot:SetAlpha( 0, 100 )
				end
			},
			{
				function ()
					return self.DotBase:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -5, _1080p * 5, _1080p * -5, _1080p * 5, 100 )
				end
			}
		} )
		self._sequences.ADSOUT = function ()
			HalfTLS:AnimateSequence( "ADSOUT" )
			HalfTL:AnimateSequence( "ADSOUT" )
			HalfBRS:AnimateSequence( "ADSOUT" )
			HalfBR:AnimateSequence( "ADSOUT" )
			NotchLTS:AnimateSequence( "ADSOUT" )
			NotchLT:AnimateSequence( "ADSOUT" )
			NotchLBS:AnimateSequence( "ADSOUT" )
			NotchLB:AnimateSequence( "ADSOUT" )
			NotchRBS:AnimateSequence( "ADSOUT" )
			NotchRB:AnimateSequence( "ADSOUT" )
			NotchRTS:AnimateSequence( "ADSOUT" )
			NotchRT:AnimateSequence( "ADSOUT" )
			DotBase:AnimateSequence( "ADSOUT" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "ReticleEndlessBase", ReticleEndlessBase )
LockTable( _M )
