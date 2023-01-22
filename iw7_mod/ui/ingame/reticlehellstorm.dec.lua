local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = 0.5
	f1_arg0:SubscribeToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_arg1 ), function ( f2_arg0 )
		local f2_local0 = DataModel.GetModelValue( f2_arg0 )
		if f1_arg0.isVisible ~= true and f1_local0 <= f2_local0 then
			ACTIONS.AnimateSequence( f1_arg0, "ADSIN" )
			f1_arg0.isVisible = true
		elseif f1_arg0.isVisible ~= false and f2_local0 < f1_local0 then
			ACTIONS.AnimateSequence( f1_arg0, "ADSOUT" )
			f1_arg0.isVisible = false
		end
	end )
end

function ReticleHellstorm( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 72 * _1080p, 0, 72 * _1080p )
	self.id = "ReticleHellstorm"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local LeftCircleShadow = nil
	
	LeftCircleShadow = LUI.UIImage.new()
	LeftCircleShadow.id = "LeftCircleShadow"
	LeftCircleShadow:SetRGBFromTable( SWATCHES.Reticles.DarkContrast, 0 )
	LeftCircleShadow:SetAlpha( 0.4, 0 )
	LeftCircleShadow:setImage( RegisterMaterial( "hud_reticle_circle_third" ), 0 )
	LeftCircleShadow:SetUseAA( true )
	LeftCircleShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -34, _1080p * 34, _1080p * -34, _1080p * 31 )
	self:addElement( LeftCircleShadow )
	self.LeftCircleShadow = LeftCircleShadow
	
	local LeftCircle = nil
	
	LeftCircle = LUI.UIImage.new()
	LeftCircle.id = "LeftCircle"
	LeftCircle:SetAlpha( 0.4, 0 )
	LeftCircle:setImage( RegisterMaterial( "hud_reticle_circle_third" ), 0 )
	LeftCircle:SetUseAA( true )
	LeftCircle:SetBlendMode( BLEND_MODE.addWithAlpha )
	LeftCircle:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -34, _1080p * 34, _1080p * -34, _1080p * 31 )
	self:addElement( LeftCircle )
	self.LeftCircle = LeftCircle
	
	local RightCircleShadow = nil
	
	RightCircleShadow = LUI.UIImage.new()
	RightCircleShadow.id = "RightCircleShadow"
	RightCircleShadow:SetRGBFromTable( SWATCHES.Reticles.DarkContrast, 0 )
	RightCircleShadow:SetAlpha( 0, 0 )
	RightCircleShadow:setImage( RegisterMaterial( "hud_reticle_circle_third" ), 0 )
	RightCircleShadow:SetUseAA( true )
	RightCircleShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -23, _1080p * 23, _1080p * -23, _1080p * 23 )
	self:addElement( RightCircleShadow )
	self.RightCircleShadow = RightCircleShadow
	
	local RightCircle = nil
	
	RightCircle = LUI.UIImage.new()
	RightCircle.id = "RightCircle"
	RightCircle:SetAlpha( 0, 0 )
	RightCircle:setImage( RegisterMaterial( "hud_reticle_circle_third" ), 0 )
	RightCircle:SetUseAA( true )
	RightCircle:SetBlendMode( BLEND_MODE.addWithAlpha )
	RightCircle:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -34, _1080p * 34, _1080p * -34, _1080p * 32 )
	self:addElement( RightCircle )
	self.RightCircle = RightCircle
	
	local NotchRightShadow = nil
	
	NotchRightShadow = LUI.UIImage.new()
	NotchRightShadow.id = "NotchRightShadow"
	NotchRightShadow:SetRGBFromTable( SWATCHES.Reticles.DarkContrast, 0 )
	NotchRightShadow:SetAlpha( 0.4, 0 )
	NotchRightShadow:setImage( RegisterMaterial( "hud_reticle_notch_rounded_short" ), 0 )
	NotchRightShadow:SetUseAA( true )
	NotchRightShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 18, _1080p * 28, _1080p * 1, _1080p * 6 )
	self:addElement( NotchRightShadow )
	self.NotchRightShadow = NotchRightShadow
	
	local NotchRight = nil
	
	NotchRight = LUI.UIImage.new()
	NotchRight.id = "NotchRight"
	NotchRight:SetAlpha( 0.4, 0 )
	NotchRight:setImage( RegisterMaterial( "hud_reticle_notch_rounded_short" ), 0 )
	NotchRight:SetUseAA( true )
	NotchRight:SetBlendMode( BLEND_MODE.addWithAlpha )
	NotchRight:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 18, _1080p * 28, _1080p * 1, _1080p * 6 )
	self:addElement( NotchRight )
	self.NotchRight = NotchRight
	
	local NotchLeftShadow = nil
	
	NotchLeftShadow = LUI.UIImage.new()
	NotchLeftShadow.id = "NotchLeftShadow"
	NotchLeftShadow:SetRGBFromTable( SWATCHES.Reticles.DarkContrast, 0 )
	NotchLeftShadow:SetAlpha( 0.4, 0 )
	NotchLeftShadow:setImage( RegisterMaterial( "hud_reticle_notch_rounded_short" ), 0 )
	NotchLeftShadow:SetUseAA( true )
	NotchLeftShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -28, _1080p * -18, _1080p * 1, _1080p * 6 )
	self:addElement( NotchLeftShadow )
	self.NotchLeftShadow = NotchLeftShadow
	
	local NotchLeft = nil
	
	NotchLeft = LUI.UIImage.new()
	NotchLeft.id = "NotchLeft"
	NotchLeft:SetAlpha( 0.4, 0 )
	NotchLeft:setImage( RegisterMaterial( "hud_reticle_notch_rounded_short" ), 0 )
	NotchLeft:SetUseAA( true )
	NotchLeft:SetBlendMode( BLEND_MODE.addWithAlpha )
	NotchLeft:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -28, _1080p * -18, _1080p * 1, _1080p * 6 )
	self:addElement( NotchLeft )
	self.NotchLeft = NotchLeft
	
	local DotBase = nil
	
	DotBase = MenuBuilder.BuildRegisteredType( "DotBase", {
		controllerIndex = f3_local1
	} )
	DotBase.id = "DotBase"
	DotBase.Dot:SetAlpha( 0, 0 )
	DotBase.Dot:SetScale( -0.5, 0 )
	DotBase:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -6, _1080p * 6, _1080p * -6, _1080p * 6 )
	self:addElement( DotBase )
	self.DotBase = DotBase
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		LeftCircleShadow:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.LeftCircleShadow:SetZRotation( 75, 100 )
				end
			},
			{
				function ()
					return self.LeftCircleShadow:SetAlpha( 0.2, 100 )
				end
			},
			{
				function ()
					return self.LeftCircleShadow:SetRGBFromTable( SWATCHES.Reticles.Red, 100 )
				end
			},
			{
				function ()
					return self.LeftCircleShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -23, _1080p * 23, _1080p * -23, _1080p * 23, 100 )
				end
			}
		} )
		LeftCircle:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.LeftCircle:SetRGBFromTable( SWATCHES.Reticles.Red, 100 )
				end
			},
			{
				function ()
					return self.LeftCircle:SetZRotation( 75, 100 )
				end
			},
			{
				function ()
					return self.LeftCircle:SetAlpha( 0.8, 100 )
				end
			},
			{
				function ()
					return self.LeftCircle:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -23, _1080p * 23, _1080p * -23, _1080p * 23, 100 )
				end
			}
		} )
		RightCircleShadow:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.RightCircleShadow:SetAlpha( 0.4, 0 )
				end,
				function ()
					return self.RightCircleShadow:SetAlpha( 0.2, 100 )
				end
			},
			{
				function ()
					return self.RightCircleShadow:SetZRotation( -75, 100 )
				end
			},
			{
				function ()
					return self.RightCircleShadow:SetRGBFromTable( SWATCHES.Reticles.Red, 100 )
				end
			},
			{
				function ()
					return self.RightCircleShadow:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 13, _1080p * 59, _1080p * -23, _1080p * 23, 100 )
				end
			}
		} )
		RightCircle:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.RightCircle:SetAlpha( 0.5, 0 )
				end,
				function ()
					return self.RightCircle:SetAlpha( 0.8, 100 )
				end
			},
			{
				function ()
					return self.RightCircle:SetRGBFromTable( SWATCHES.Reticles.Red, 100 )
				end
			},
			{
				function ()
					return self.RightCircle:SetZRotation( -75, 100 )
				end
			},
			{
				function ()
					return self.RightCircle:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -23, _1080p * 23, _1080p * -23, _1080p * 23, 100 )
				end
			}
		} )
		NotchRightShadow:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.NotchRightShadow:SetAlpha( 0.2, 100 )
				end
			},
			{
				function ()
					return self.NotchRightShadow:SetRGBFromTable( SWATCHES.Reticles.Red, 100 )
				end
			},
			{
				function ()
					return self.NotchRightShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 5, _1080p * 14, _1080p * 7, _1080p * 11, 100 )
				end
			}
		} )
		NotchRight:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.NotchRight:SetRGBFromTable( SWATCHES.Reticles.Red, 100 )
				end
			},
			{
				function ()
					return self.NotchRight:SetAlpha( 0.8, 100 )
				end
			},
			{
				function ()
					return self.NotchRight:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 5, _1080p * 14, _1080p * 7, _1080p * 11, 100 )
				end
			}
		} )
		NotchLeftShadow:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.NotchLeftShadow:SetAlpha( 0.2, 100 )
				end
			},
			{
				function ()
					return self.NotchLeftShadow:SetRGBFromTable( SWATCHES.Reticles.Red, 100 )
				end
			},
			{
				function ()
					return self.NotchLeftShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -14, _1080p * -5, _1080p * 7, _1080p * 11, 100 )
				end
			}
		} )
		NotchLeft:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.NotchLeft:SetRGBFromTable( SWATCHES.Reticles.Red, 100 )
				end
			},
			{
				function ()
					return self.NotchLeft:SetAlpha( 0.8, 100 )
				end
			},
			{
				function ()
					return self.NotchLeft:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -14, _1080p * -5, _1080p * 7, _1080p * 11, 100 )
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
					return self.DotBase.Dot:SetScale( 0.25, 100 )
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
			},
			{
				function ()
					return self.DotBase:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -3, _1080p * 3, _1080p * -3, _1080p * 3, 100 )
				end
			}
		} )
		self._sequences.ADSIN = function ()
			LeftCircleShadow:AnimateSequence( "ADSIN" )
			LeftCircle:AnimateSequence( "ADSIN" )
			RightCircleShadow:AnimateSequence( "ADSIN" )
			RightCircle:AnimateSequence( "ADSIN" )
			NotchRightShadow:AnimateSequence( "ADSIN" )
			NotchRight:AnimateSequence( "ADSIN" )
			NotchLeftShadow:AnimateSequence( "ADSIN" )
			NotchLeft:AnimateSequence( "ADSIN" )
			DotBase:AnimateSequence( "ADSIN" )
		end
		
		LeftCircleShadow:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.LeftCircleShadow:SetAlpha( 0.4, 60 )
				end
			},
			{
				function ()
					return self.LeftCircleShadow:SetZRotation( 0, 60 )
				end
			},
			{
				function ()
					return self.LeftCircleShadow:SetRGBFromTable( SWATCHES.Reticles.DarkContrast, 60 )
				end
			},
			{
				function ()
					return self.LeftCircleShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -33, _1080p * 33, _1080p * -34, _1080p * 31, 59 )
				end
			}
		} )
		LeftCircle:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.LeftCircle:SetAlpha( 0.4, 60 )
				end
			},
			{
				function ()
					return self.LeftCircle:SetZRotation( 0, 60 )
				end
			},
			{
				function ()
					return self.LeftCircle:SetRGBFromTable( SWATCHES.Reticles.White, 60 )
				end
			},
			{
				function ()
					return self.LeftCircle:SetBlendMode( BLEND_MODE.addWithAlpha )
				end
			},
			{
				function ()
					return self.LeftCircle:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -33, _1080p * 33, _1080p * -34, _1080p * 31, 59 )
				end
			}
		} )
		RightCircleShadow:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.RightCircleShadow:SetAlpha( 0, 60 )
				end
			},
			{
				function ()
					return self.RightCircleShadow:SetZRotation( 0, 60 )
				end
			},
			{
				function ()
					return self.RightCircleShadow:SetRGBFromTable( SWATCHES.Reticles.DarkContrast, 60 )
				end
			},
			{
				function ()
					return self.RightCircleShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -33, _1080p * 33, _1080p * -34, _1080p * 32, 59 )
				end
			}
		} )
		RightCircle:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.RightCircle:SetRGBFromTable( SWATCHES.Reticles.White, 60 )
				end
			},
			{
				function ()
					return self.RightCircle:SetZRotation( 0, 60 )
				end
			},
			{
				function ()
					return self.RightCircle:SetAlpha( 0, 60 )
				end
			},
			{
				function ()
					return self.RightCircle:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -33, _1080p * 33, _1080p * -34, _1080p * 32, 59 )
				end
			}
		} )
		NotchRightShadow:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.NotchRightShadow:SetAlpha( 0.4, 60 )
				end
			},
			{
				function ()
					return self.NotchRightShadow:SetRGBFromTable( SWATCHES.Reticles.DarkContrast, 60 )
				end
			},
			{
				function ()
					return self.NotchRightShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 18, _1080p * 28, _1080p * 1, _1080p * 6, 59 )
				end
			}
		} )
		NotchRight:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.NotchRight:SetRGBFromTable( SWATCHES.Reticles.White, 60 )
				end
			},
			{
				function ()
					return self.NotchRight:SetAlpha( 0.4, 60 )
				end
			},
			{
				function ()
					return self.NotchRight:SetBlendMode( BLEND_MODE.addWithAlpha )
				end
			},
			{
				function ()
					return self.NotchRight:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 18, _1080p * 28, _1080p * 1, _1080p * 6, 59 )
				end
			}
		} )
		NotchLeftShadow:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.NotchLeftShadow:SetAlpha( 0.4, 60 )
				end
			},
			{
				function ()
					return self.NotchLeftShadow:SetRGBFromTable( SWATCHES.Reticles.DarkContrast, 60 )
				end
			},
			{
				function ()
					return self.NotchLeftShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -28, _1080p * -18, _1080p * 1, _1080p * 6, 59 )
				end
			}
		} )
		NotchLeft:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.NotchLeft:SetRGBFromTable( SWATCHES.Reticles.White, 60 )
				end
			},
			{
				function ()
					return self.NotchLeft:SetAlpha( 0.4, 60 )
				end
			},
			{
				function ()
					return self.NotchLeft:SetBlendMode( BLEND_MODE.addWithAlpha )
				end
			},
			{
				function ()
					return self.NotchLeft:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -28, _1080p * -18, _1080p * 1, _1080p * 6, 59 )
				end
			}
		} )
		DotBase:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.DotBase.DotShadow:SetRGBFromTable( SWATCHES.Reticles.DarkContrast, 60 )
				end
			},
			{
				function ()
					return self.DotBase.Dot:SetRGBFromTable( SWATCHES.Reticles.White, 60 )
				end
			},
			{
				function ()
					return self.DotBase.DotHighlight:SetRGBFromTable( SWATCHES.Reticles.White, 60 )
				end
			},
			{
				function ()
					return self.DotBase.Dot:SetScale( -0.55, 60 )
				end
			},
			{
				function ()
					return self.DotBase.DotHighlight:SetAlpha( 0.6, 60 )
				end
			},
			{
				function ()
					return self.DotBase.Dot:SetAlpha( 0, 60 )
				end
			},
			{
				function ()
					return self.DotBase:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -6, _1080p * 6, _1080p * -6, _1080p * 6, 59 )
				end
			}
		} )
		self._sequences.ADSOUT = function ()
			LeftCircleShadow:AnimateSequence( "ADSOUT" )
			LeftCircle:AnimateSequence( "ADSOUT" )
			RightCircleShadow:AnimateSequence( "ADSOUT" )
			RightCircle:AnimateSequence( "ADSOUT" )
			NotchRightShadow:AnimateSequence( "ADSOUT" )
			NotchRight:AnimateSequence( "ADSOUT" )
			NotchLeftShadow:AnimateSequence( "ADSOUT" )
			NotchLeft:AnimateSequence( "ADSOUT" )
			DotBase:AnimateSequence( "ADSOUT" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "ReticleHellstorm", ReticleHellstorm )
LockTable( _M )
