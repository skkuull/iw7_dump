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

function ReticleRessurrectionBase( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 64 * _1080p, 0, 64 * _1080p )
	self.id = "ReticleRessurrectionBase"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local CaretShadow = nil
	
	CaretShadow = LUI.UIImage.new()
	CaretShadow.id = "CaretShadow"
	CaretShadow:SetAlpha( 0.4, 0 )
	CaretShadow:setImage( RegisterMaterial( "hud_reticle_caret" ), 0 )
	CaretShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -12, _1080p * 12, _1080p * -30, _1080p * -8 )
	self:addElement( CaretShadow )
	self.CaretShadow = CaretShadow
	
	local Caret = nil
	
	Caret = LUI.UIImage.new()
	Caret.id = "Caret"
	Caret:SetAlpha( 0.8, 0 )
	Caret:setImage( RegisterMaterial( "hud_reticle_caret" ), 0 )
	Caret:SetBlendMode( BLEND_MODE.addWithAlpha )
	Caret:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -12, _1080p * 12, _1080p * -30, _1080p * -8 )
	self:addElement( Caret )
	self.Caret = Caret
	
	local RightArmPlxShadow = nil
	
	RightArmPlxShadow = MenuBuilder.BuildRegisteredType( "ScopeReticleParallaxer", {
		horSkewFactor = 2,
		vertSkewFactor = 2,
		controllerIndex = f3_local1
	} )
	RightArmPlxShadow.id = "RightArmPlxShadow"
	RightArmPlxShadow:SetAlpha( 0.4, 0 )
	RightArmPlxShadow:SetZRotation( 30, 0 )
	RightArmPlxShadow:setImage( RegisterMaterial( "hud_reticle_notch_rounded_long_parallax" ), 0 )
	RightArmPlxShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -2, _1080p * 30, _1080p * -20, _1080p * 44 )
	self:addElement( RightArmPlxShadow )
	self.RightArmPlxShadow = RightArmPlxShadow
	
	local RightArmPlx = nil
	
	RightArmPlx = MenuBuilder.BuildRegisteredType( "ScopeReticleParallaxer", {
		horSkewFactor = 2,
		vertSkewFactor = 2,
		controllerIndex = f3_local1
	} )
	RightArmPlx.id = "RightArmPlx"
	RightArmPlx:SetAlpha( 0.8, 0 )
	RightArmPlx:SetZRotation( 30, 0 )
	RightArmPlx:setImage( RegisterMaterial( "hud_reticle_notch_rounded_long_parallax" ), 0 )
	RightArmPlx:SetBlendMode( BLEND_MODE.addWithAlpha )
	RightArmPlx:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -2, _1080p * 30, _1080p * -20, _1080p * 44 )
	self:addElement( RightArmPlx )
	self.RightArmPlx = RightArmPlx
	
	local RightLegPlxShadow = nil
	
	RightLegPlxShadow = MenuBuilder.BuildRegisteredType( "ScopeReticleParallaxer", {
		horSkewFactor = 2,
		vertSkewFactor = 2,
		controllerIndex = f3_local1
	} )
	RightLegPlxShadow.id = "RightLegPlxShadow"
	RightLegPlxShadow:SetAlpha( 0.4, 0 )
	RightLegPlxShadow:SetZRotation( -30, 0 )
	RightLegPlxShadow:setImage( RegisterMaterial( "hud_reticle_notch_rounded_long_parallax" ), 0 )
	RightLegPlxShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -20, _1080p * 12, _1080p * -13, _1080p * 51 )
	self:addElement( RightLegPlxShadow )
	self.RightLegPlxShadow = RightLegPlxShadow
	
	local RightLegPlx = nil
	
	RightLegPlx = MenuBuilder.BuildRegisteredType( "ScopeReticleParallaxer", {
		horSkewFactor = 2,
		vertSkewFactor = 2,
		controllerIndex = f3_local1
	} )
	RightLegPlx.id = "RightLegPlx"
	RightLegPlx:SetAlpha( 0.8, 0 )
	RightLegPlx:SetZRotation( -30, 0 )
	RightLegPlx:setImage( RegisterMaterial( "hud_reticle_notch_rounded_long_parallax" ), 0 )
	RightLegPlx:SetBlendMode( BLEND_MODE.addWithAlpha )
	RightLegPlx:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -20, _1080p * 12, _1080p * -13, _1080p * 51 )
	self:addElement( RightLegPlx )
	self.RightLegPlx = RightLegPlx
	
	local LeftArmPlxShadow = nil
	
	LeftArmPlxShadow = MenuBuilder.BuildRegisteredType( "ScopeReticleParallaxer", {
		horSkewFactor = 2,
		vertSkewFactor = 2,
		controllerIndex = f3_local1
	} )
	LeftArmPlxShadow.id = "LeftArmPlxShadow"
	LeftArmPlxShadow:SetAlpha( 0.4, 0 )
	LeftArmPlxShadow:SetZRotation( -30, 0 )
	LeftArmPlxShadow:setImage( RegisterMaterial( "hud_reticle_notch_rounded_long_parallax" ), 0 )
	LeftArmPlxShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -44, _1080p * -12, _1080p * -28, _1080p * 36 )
	self:addElement( LeftArmPlxShadow )
	self.LeftArmPlxShadow = LeftArmPlxShadow
	
	local LeftArmPlx = nil
	
	LeftArmPlx = MenuBuilder.BuildRegisteredType( "ScopeReticleParallaxer", {
		horSkewFactor = 2,
		vertSkewFactor = 2,
		controllerIndex = f3_local1
	} )
	LeftArmPlx.id = "LeftArmPlx"
	LeftArmPlx:SetAlpha( 0.8, 0 )
	LeftArmPlx:SetZRotation( -30, 0 )
	LeftArmPlx:setImage( RegisterMaterial( "hud_reticle_notch_rounded_long_parallax" ), 0 )
	LeftArmPlx:SetBlendMode( BLEND_MODE.addWithAlpha )
	LeftArmPlx:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -44, _1080p * -12, _1080p * -28, _1080p * 36 )
	self:addElement( LeftArmPlx )
	self.LeftArmPlx = LeftArmPlx
	
	local LeftLegPlxShadow = nil
	
	LeftLegPlxShadow = MenuBuilder.BuildRegisteredType( "ScopeReticleParallaxer", {
		horSkewFactor = 2,
		vertSkewFactor = 2,
		controllerIndex = f3_local1
	} )
	LeftLegPlxShadow.id = "LeftLegPlxShadow"
	LeftLegPlxShadow:SetAlpha( 0.4, 0 )
	LeftLegPlxShadow:SetZRotation( 30, 0 )
	LeftLegPlxShadow:setImage( RegisterMaterial( "hud_reticle_notch_rounded_long_parallax" ), 0 )
	LeftLegPlxShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -26, _1080p * 6, _1080p * -5, _1080p * 59 )
	self:addElement( LeftLegPlxShadow )
	self.LeftLegPlxShadow = LeftLegPlxShadow
	
	local LeftLegPlx = nil
	
	LeftLegPlx = MenuBuilder.BuildRegisteredType( "ScopeReticleParallaxer", {
		horSkewFactor = 2,
		vertSkewFactor = 2,
		controllerIndex = f3_local1
	} )
	LeftLegPlx.id = "LeftLegPlx"
	LeftLegPlx:SetAlpha( 0.8, 0 )
	LeftLegPlx:SetZRotation( 30, 0 )
	LeftLegPlx:setImage( RegisterMaterial( "hud_reticle_notch_rounded_long_parallax" ), 0 )
	LeftLegPlx:SetBlendMode( BLEND_MODE.addWithAlpha )
	LeftLegPlx:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -26, _1080p * 6, _1080p * -5, _1080p * 59 )
	self:addElement( LeftLegPlx )
	self.LeftLegPlx = LeftLegPlx
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		CaretShadow:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.CaretShadow:SetScale( 0.2, 80 )
				end
			},
			{
				function ()
					return self.CaretShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -6, _1080p * 6, _1080p * -19, _1080p * -1, 79 )
				end
			}
		} )
		Caret:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.Caret:SetScale( 0.2, 80 )
				end
			},
			{
				function ()
					return self.Caret:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -6, _1080p * 6, _1080p * -19, _1080p * -1, 79 )
				end
			}
		} )
		RightArmPlxShadow:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.RightArmPlxShadow:SetZRotation( 0, 80 )
				end
			},
			{
				function ()
					return self.RightArmPlxShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -20, _1080p * 20, _1080p * -14, _1080p * 50, 79 )
				end
			}
		} )
		RightArmPlx:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.RightArmPlx:SetZRotation( 0, 80 )
				end
			},
			{
				function ()
					return self.RightArmPlx:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -20, _1080p * 20, _1080p * -14, _1080p * 50, 79 )
				end
			}
		} )
		RightLegPlxShadow:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.RightLegPlxShadow:SetZRotation( -60, 80 )
				end
			},
			{
				function ()
					return self.RightLegPlxShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -41, _1080p * 9, _1080p * -24, _1080p * 40, 79 )
				end
			}
		} )
		RightLegPlx:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.RightLegPlx:SetZRotation( -60, 80 )
				end
			},
			{
				function ()
					return self.RightLegPlx:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -41, _1080p * 9, _1080p * -24, _1080p * 40, 79 )
				end
			}
		} )
		LeftArmPlxShadow:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.LeftArmPlxShadow:SetZRotation( 0, 80 )
				end
			},
			{
				function ()
					return self.LeftArmPlxShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -40.5, _1080p * 0.5, _1080p * -14, _1080p * 50, 79 )
				end
			}
		} )
		LeftArmPlx:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.LeftArmPlx:SetZRotation( 0, 80 )
				end
			},
			{
				function ()
					return self.LeftArmPlx:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -40.5, _1080p * 0.5, _1080p * -14, _1080p * 50, 79 )
				end
			}
		} )
		LeftLegPlxShadow:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.LeftLegPlxShadow:SetZRotation( 60, 80 )
				end
			},
			{
				function ()
					return self.LeftLegPlxShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -21, _1080p * 29, _1080p * -2, _1080p * 62, 79 )
				end
			}
		} )
		LeftLegPlx:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.LeftLegPlx:SetZRotation( 60, 80 )
				end
			},
			{
				function ()
					return self.LeftLegPlx:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -21, _1080p * 29, _1080p * -2, _1080p * 62, 79 )
				end
			}
		} )
		self._sequences.ADSIN = function ()
			CaretShadow:AnimateSequence( "ADSIN" )
			Caret:AnimateSequence( "ADSIN" )
			RightArmPlxShadow:AnimateSequence( "ADSIN" )
			RightArmPlx:AnimateSequence( "ADSIN" )
			RightLegPlxShadow:AnimateSequence( "ADSIN" )
			RightLegPlx:AnimateSequence( "ADSIN" )
			LeftArmPlxShadow:AnimateSequence( "ADSIN" )
			LeftArmPlx:AnimateSequence( "ADSIN" )
			LeftLegPlxShadow:AnimateSequence( "ADSIN" )
			LeftLegPlx:AnimateSequence( "ADSIN" )
		end
		
		CaretShadow:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.CaretShadow:SetScale( 0, 80 )
				end
			},
			{
				function ()
					return self.CaretShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -12, _1080p * 12, _1080p * -30, _1080p * -8, 70 )
				end
			}
		} )
		Caret:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.Caret:SetScale( 0, 80 )
				end
			},
			{
				function ()
					return self.Caret:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -12, _1080p * 12, _1080p * -30, _1080p * -8, 70 )
				end
			}
		} )
		RightArmPlxShadow:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.RightArmPlxShadow:SetZRotation( 30, 70 )
				end
			},
			{
				function ()
					return self.RightArmPlxShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -2, _1080p * 30, _1080p * -20, _1080p * 44, 70 )
				end
			}
		} )
		RightArmPlx:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.RightArmPlx:SetZRotation( 30, 70 )
				end
			},
			{
				function ()
					return self.RightArmPlx:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -2, _1080p * 30, _1080p * -20, _1080p * 44, 70 )
				end
			}
		} )
		RightLegPlxShadow:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.RightLegPlxShadow:SetZRotation( -30, 70 )
				end
			},
			{
				function ()
					return self.RightLegPlxShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -20, _1080p * 12, _1080p * -13, _1080p * 51, 70 )
				end
			}
		} )
		RightLegPlx:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.RightLegPlx:SetZRotation( -30, 70 )
				end
			},
			{
				function ()
					return self.RightLegPlx:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -20, _1080p * 12, _1080p * -13, _1080p * 51, 70 )
				end
			}
		} )
		LeftArmPlxShadow:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.LeftArmPlxShadow:SetZRotation( -30, 70 )
				end
			},
			{
				function ()
					return self.LeftArmPlxShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -44, _1080p * -12, _1080p * -28, _1080p * 36, 70 )
				end
			}
		} )
		LeftArmPlx:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.LeftArmPlx:SetZRotation( -30, 70 )
				end
			},
			{
				function ()
					return self.LeftArmPlx:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -44, _1080p * -12, _1080p * -28, _1080p * 36, 70 )
				end
			}
		} )
		LeftLegPlxShadow:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.LeftLegPlxShadow:SetZRotation( 30, 70 )
				end
			},
			{
				function ()
					return self.LeftLegPlxShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -26, _1080p * 6, _1080p * -5, _1080p * 59, 70 )
				end
			}
		} )
		LeftLegPlx:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.LeftLegPlx:SetZRotation( 30, 70 )
				end
			},
			{
				function ()
					return self.LeftLegPlx:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -26, _1080p * 6, _1080p * -5, _1080p * 59, 70 )
				end
			}
		} )
		self._sequences.ADSOUT = function ()
			CaretShadow:AnimateSequence( "ADSOUT" )
			Caret:AnimateSequence( "ADSOUT" )
			RightArmPlxShadow:AnimateSequence( "ADSOUT" )
			RightArmPlx:AnimateSequence( "ADSOUT" )
			RightLegPlxShadow:AnimateSequence( "ADSOUT" )
			RightLegPlx:AnimateSequence( "ADSOUT" )
			LeftArmPlxShadow:AnimateSequence( "ADSOUT" )
			LeftArmPlx:AnimateSequence( "ADSOUT" )
			LeftLegPlxShadow:AnimateSequence( "ADSOUT" )
			LeftLegPlx:AnimateSequence( "ADSOUT" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "ReticleRessurrectionBase", ReticleRessurrectionBase )
LockTable( _M )
