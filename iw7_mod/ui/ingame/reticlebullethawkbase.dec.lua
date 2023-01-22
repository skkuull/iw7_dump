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

function ReticleBulletHawkBase( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 60 * _1080p, 0, 60 * _1080p )
	self.id = "ReticleBulletHawkBase"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local HalfCircleShadow = nil
	
	HalfCircleShadow = LUI.UIImage.new()
	HalfCircleShadow.id = "HalfCircleShadow"
	HalfCircleShadow:SetRGBFromInt( 11776947, 0 )
	HalfCircleShadow:SetAlpha( 0.2, 0 )
	HalfCircleShadow:SetScale( -0.1, 0 )
	HalfCircleShadow:setImage( RegisterMaterial( "hud_reticle_circle_quadtick_half" ), 0 )
	HalfCircleShadow:SetUseAA( true )
	HalfCircleShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -30, _1080p * 30, _1080p * -30, _1080p * 30 )
	self:addElement( HalfCircleShadow )
	self.HalfCircleShadow = HalfCircleShadow
	
	local HalfCircle = nil
	
	HalfCircle = LUI.UIImage.new()
	HalfCircle.id = "HalfCircle"
	HalfCircle:SetAlpha( 0.8, 0 )
	HalfCircle:SetScale( -0.1, 0 )
	HalfCircle:setImage( RegisterMaterial( "hud_reticle_circle_quadtick_half" ), 0 )
	HalfCircle:SetUseAA( true )
	HalfCircle:SetBlendMode( BLEND_MODE.addWithAlpha )
	HalfCircle:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -30, _1080p * 30, _1080p * -30, _1080p * 30 )
	self:addElement( HalfCircle )
	self.HalfCircle = HalfCircle
	
	local LongLineShadow = nil
	
	LongLineShadow = LUI.UIImage.new()
	LongLineShadow.id = "LongLineShadow"
	LongLineShadow:SetRGBFromInt( 11776947, 0 )
	LongLineShadow:SetAlpha( 0.2, 0 )
	LongLineShadow:SetZRotation( 90, 0 )
	LongLineShadow:setImage( RegisterMaterial( "hud_reticle_notch_rounded_long" ), 0 )
	LongLineShadow:SetUseAA( true )
	LongLineShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -22, _1080p * 8, _1080p * -2, _1080p * 1 )
	self:addElement( LongLineShadow )
	self.LongLineShadow = LongLineShadow
	
	local LongLine = nil
	
	LongLine = LUI.UIImage.new()
	LongLine.id = "LongLine"
	LongLine:SetAlpha( 0.8, 0 )
	LongLine:SetZRotation( 90, 0 )
	LongLine:setImage( RegisterMaterial( "hud_reticle_notch_rounded_long" ), 0 )
	LongLine:SetUseAA( true )
	LongLine:SetBlendMode( BLEND_MODE.addWithAlpha )
	LongLine:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -22, _1080p * 8, _1080p * -2, _1080p * 1 )
	self:addElement( LongLine )
	self.LongLine = LongLine
	
	local NotchBottomShadow = nil
	
	NotchBottomShadow = LUI.UIImage.new()
	NotchBottomShadow.id = "NotchBottomShadow"
	NotchBottomShadow:SetRGBFromInt( 11776947, 0 )
	NotchBottomShadow:SetAlpha( 0.2, 0 )
	NotchBottomShadow:setImage( RegisterMaterial( "hud_reticle_notch_rounded_short" ), 0 )
	NotchBottomShadow:SetUseAA( true )
	NotchBottomShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -18, _1080p * -10, _1080p * 11, _1080p * 14 )
	self:addElement( NotchBottomShadow )
	self.NotchBottomShadow = NotchBottomShadow
	
	local NotchBottom = nil
	
	NotchBottom = LUI.UIImage.new()
	NotchBottom.id = "NotchBottom"
	NotchBottom:SetAlpha( 0.8, 0 )
	NotchBottom:setImage( RegisterMaterial( "hud_reticle_notch_rounded_short" ), 0 )
	NotchBottom:SetUseAA( true )
	NotchBottom:SetBlendMode( BLEND_MODE.addWithAlpha )
	NotchBottom:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -18, _1080p * -10, _1080p * 11, _1080p * 14 )
	self:addElement( NotchBottom )
	self.NotchBottom = NotchBottom
	
	local NotchTopShadow = nil
	
	NotchTopShadow = LUI.UIImage.new()
	NotchTopShadow.id = "NotchTopShadow"
	NotchTopShadow:SetRGBFromInt( 11776947, 0 )
	NotchTopShadow:SetAlpha( 0.2, 0 )
	NotchTopShadow:setImage( RegisterMaterial( "hud_reticle_notch_rounded_short" ), 0 )
	NotchTopShadow:SetUseAA( true )
	NotchTopShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -18, _1080p * -10, _1080p * -15, _1080p * -12 )
	self:addElement( NotchTopShadow )
	self.NotchTopShadow = NotchTopShadow
	
	local NotchTop = nil
	
	NotchTop = LUI.UIImage.new()
	NotchTop.id = "NotchTop"
	NotchTop:SetAlpha( 0.8, 0 )
	NotchTop:setImage( RegisterMaterial( "hud_reticle_notch_rounded_short" ), 0 )
	NotchTop:SetUseAA( true )
	NotchTop:SetBlendMode( BLEND_MODE.addWithAlpha )
	NotchTop:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -18, _1080p * -10, _1080p * -15, _1080p * -12 )
	self:addElement( NotchTop )
	self.NotchTop = NotchTop
	
	local DotBase = nil
	
	DotBase = MenuBuilder.BuildRegisteredType( "DotBase", {
		controllerIndex = f3_local1
	} )
	DotBase.id = "DotBase"
	DotBase.Dot:SetAlpha( 0, 0 )
	DotBase.Dot:SetScale( 0.2, 0 )
	DotBase:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -3, _1080p * 3, _1080p * -3, _1080p * 3 )
	self:addElement( DotBase )
	self.DotBase = DotBase
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		HalfCircleShadow:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.HalfCircleShadow:SetZRotation( -45, 100 )
				end
			},
			{
				function ()
					return self.HalfCircleShadow:SetRGBFromTable( SWATCHES.Reticles.Red, 100 )
				end
			},
			{
				function ()
					return self.HalfCircleShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -18, _1080p * 18, _1080p * -18, _1080p * 16, 100 )
				end
			}
		} )
		HalfCircle:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.HalfCircle:SetZRotation( -45, 100 )
				end
			},
			{
				function ()
					return self.HalfCircle:SetRGBFromTable( SWATCHES.Reticles.Red, 100 )
				end
			},
			{
				function ()
					return self.HalfCircle:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -18, _1080p * 18, _1080p * -18, _1080p * 16, 100 )
				end
			}
		} )
		LongLineShadow:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.LongLineShadow:SetZRotation( 45, 100 )
				end
			},
			{
				function ()
					return self.LongLineShadow:SetRGBFromTable( SWATCHES.Reticles.Red, 100 )
				end
			},
			{
				function ()
					return self.LongLineShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -12, _1080p * 10.5, _1080p * -4, _1080p * -2, 100 )
				end
			}
		} )
		LongLine:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.LongLine:SetZRotation( 45, 100 )
				end
			},
			{
				function ()
					return self.LongLine:SetRGBFromTable( SWATCHES.Reticles.Red, 100 )
				end
			},
			{
				function ()
					return self.LongLine:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -12, _1080p * 10.5, _1080p * -4, _1080p * -2, 100 )
				end
			}
		} )
		NotchBottomShadow:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.NotchBottomShadow:SetRGBFromTable( SWATCHES.Reticles.Red, 100 )
				end
			},
			{
				function ()
					return self.NotchBottomShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -14, _1080p * -8.5, _1080p * 3.5, _1080p * 5.5, 100 )
				end
			}
		} )
		NotchBottom:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.NotchBottom:SetRGBFromTable( SWATCHES.Reticles.Red, 100 )
				end
			},
			{
				function ()
					return self.NotchBottom:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -14, _1080p * -8.5, _1080p * 3.5, _1080p * 5.5, 100 )
				end
			}
		} )
		NotchTopShadow:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.NotchTopShadow:SetRGBFromTable( SWATCHES.Reticles.Red, 100 )
				end
			},
			{
				function ()
					return self.NotchTopShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 7, _1080p * 14.5, _1080p * -11.5, _1080p * -9.5, 100 )
				end
			}
		} )
		NotchTop:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.NotchTop:SetRGBFromTable( SWATCHES.Reticles.Red, 100 )
				end
			},
			{
				function ()
					return self.NotchTop:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 7, _1080p * 14.5, _1080p * -11.5, _1080p * -9.5, 100 )
				end
			}
		} )
		DotBase:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.DotBase.Dot:SetAlpha( 1, 100 )
				end
			},
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
			}
		} )
		self._sequences.ADSIN = function ()
			HalfCircleShadow:AnimateSequence( "ADSIN" )
			HalfCircle:AnimateSequence( "ADSIN" )
			LongLineShadow:AnimateSequence( "ADSIN" )
			LongLine:AnimateSequence( "ADSIN" )
			NotchBottomShadow:AnimateSequence( "ADSIN" )
			NotchBottom:AnimateSequence( "ADSIN" )
			NotchTopShadow:AnimateSequence( "ADSIN" )
			NotchTop:AnimateSequence( "ADSIN" )
			DotBase:AnimateSequence( "ADSIN" )
		end
		
		HalfCircleShadow:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.HalfCircleShadow:SetZRotation( 0, 300 )
				end
			},
			{
				function ()
					return self.HalfCircleShadow:SetRGBFromInt( 11776947, 300 )
				end
			},
			{
				function ()
					return self.HalfCircleShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -30, _1080p * 30, _1080p * -30, _1080p * 30, 300 )
				end
			}
		} )
		HalfCircle:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.HalfCircle:SetZRotation( 0, 300 )
				end
			},
			{
				function ()
					return self.HalfCircle:SetRGBFromInt( 16777215, 300 )
				end
			},
			{
				function ()
					return self.HalfCircle:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -30, _1080p * 30, _1080p * -30, _1080p * 30, 300 )
				end
			}
		} )
		LongLineShadow:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.LongLineShadow:SetZRotation( 90, 300 )
				end
			},
			{
				function ()
					return self.LongLineShadow:SetRGBFromInt( 11776947, 300 )
				end
			},
			{
				function ()
					return self.LongLineShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -22, _1080p * 8, _1080p * -2, _1080p * 1, 300 )
				end
			}
		} )
		LongLine:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.LongLine:SetZRotation( 90, 300 )
				end
			},
			{
				function ()
					return self.LongLine:SetRGBFromInt( 16777215, 300 )
				end
			},
			{
				function ()
					return self.LongLine:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -22, _1080p * 8, _1080p * -2, _1080p * 1, 300 )
				end
			}
		} )
		NotchBottomShadow:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.NotchBottomShadow:SetRGBFromInt( 11776947, 300 )
				end
			},
			{
				function ()
					return self.NotchBottomShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -18, _1080p * -10, _1080p * 11, _1080p * 14, 300 )
				end
			}
		} )
		NotchBottom:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.NotchBottom:SetRGBFromInt( 16777215, 300 )
				end
			},
			{
				function ()
					return self.NotchBottom:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -18, _1080p * -10, _1080p * 11, _1080p * 14, 300 )
				end
			}
		} )
		NotchTopShadow:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.NotchTopShadow:SetRGBFromInt( 11776947, 300 )
				end
			},
			{
				function ()
					return self.NotchTopShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -18, _1080p * -10, _1080p * -15, _1080p * -12, 300 )
				end
			}
		} )
		NotchTop:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.NotchTop:SetRGBFromInt( 16777215, 300 )
				end
			},
			{
				function ()
					return self.NotchTop:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -18, _1080p * -10, _1080p * -15, _1080p * -12, 300 )
				end
			}
		} )
		DotBase:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.DotBase.DotShadow:SetRGBFromInt( 16777215, 300 )
				end
			},
			{
				function ()
					return self.DotBase.Dot:SetRGBFromInt( 16777215, 300 )
				end
			},
			{
				function ()
					return self.DotBase.DotHighlight:SetRGBFromInt( 16777215, 300 )
				end
			},
			{
				function ()
					return self.DotBase.Dot:SetAlpha( 0, 300 )
				end
			}
		} )
		self._sequences.ADSOUT = function ()
			HalfCircleShadow:AnimateSequence( "ADSOUT" )
			HalfCircle:AnimateSequence( "ADSOUT" )
			LongLineShadow:AnimateSequence( "ADSOUT" )
			LongLine:AnimateSequence( "ADSOUT" )
			NotchBottomShadow:AnimateSequence( "ADSOUT" )
			NotchBottom:AnimateSequence( "ADSOUT" )
			NotchTopShadow:AnimateSequence( "ADSOUT" )
			NotchTop:AnimateSequence( "ADSOUT" )
			DotBase:AnimateSequence( "ADSOUT" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "ReticleBulletHawkBase", ReticleBulletHawkBase )
LockTable( _M )
