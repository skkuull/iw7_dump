local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = 0.75
	f1_arg0:SubscribeToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_arg1 ), function ( f2_arg0 )
		local f2_local0 = DataModel.GetModelValue( f2_arg0 )
		if not f1_arg0.isVisible and f1_local0 <= f2_local0 then
			ACTIONS.AnimateSequence( f1_arg0, "ADSIN" )
			f1_arg0.BracketParallax:SetHorSkewFactor( 10 )
			f1_arg0.BracketParallax:SetVertSkewFactor( 5 )
			f1_arg0.BracketParallaxshadow:SetHorSkewFactor( 10 )
			f1_arg0.BracketParallaxshadow:SetVertSkewFactor( 5 )
			f1_arg0.isVisible = true
		elseif f1_arg0.isVisible and f2_local0 < f1_local0 then
			ACTIONS.AnimateSequence( f1_arg0, "ADSOUT" )
			f1_arg0.BracketParallax:SetHorSkewFactor( 0 )
			f1_arg0.BracketParallax:SetVertSkewFactor( 0 )
			f1_arg0.BracketParallaxshadow:SetHorSkewFactor( 0 )
			f1_arg0.BracketParallaxshadow:SetVertSkewFactor( 0 )
			f1_arg0.isVisible = false
		end
	end )
end

function ReticleBracketCyan( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 200 * _1080p, 0, 200 * _1080p )
	self.id = "ReticleBracketCyan"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local BracketParallaxshadow = nil
	
	BracketParallaxshadow = MenuBuilder.BuildRegisteredType( "ScopeReticleParallaxer", {
		horSkewFactor = 5,
		vertSkewFactor = 3,
		controllerIndex = f3_local1
	} )
	BracketParallaxshadow.id = "BracketParallaxshadow"
	BracketParallaxshadow:SetRGBFromTable( SWATCHES.Reticles.AzureBlue, 0 )
	BracketParallaxshadow:SetAlpha( 0.6, 0 )
	BracketParallaxshadow:setImage( RegisterMaterial( "hud_reticle_bracket_parallax" ), 0 )
	BracketParallaxshadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -101, _1080p * 101, _1080p * -180, _1080p * 20 )
	self:addElement( BracketParallaxshadow )
	self.BracketParallaxshadow = BracketParallaxshadow
	
	local BracketParallax = nil
	
	BracketParallax = MenuBuilder.BuildRegisteredType( "ScopeReticleParallaxer", {
		horSkewFactor = 5,
		vertSkewFactor = 3,
		controllerIndex = f3_local1
	} )
	BracketParallax.id = "BracketParallax"
	BracketParallax:SetRGBFromTable( SWATCHES.Reticles.LightCyan, 0 )
	BracketParallax:SetAlpha( 0.4, 0 )
	BracketParallax:setImage( RegisterMaterial( "hud_reticle_bracket_parallax" ), 0 )
	BracketParallax:SetBlendMode( BLEND_MODE.addWithAlpha )
	BracketParallax:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -100, _1080p * 100, _1080p * -180, _1080p * 20 )
	self:addElement( BracketParallax )
	self.BracketParallax = BracketParallax
	
	local CyanDot = nil
	
	CyanDot = MenuBuilder.BuildRegisteredType( "CyanDot", {
		controllerIndex = f3_local1
	} )
	CyanDot.id = "CyanDot"
	CyanDot:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -3.5, _1080p * 3.5, _1080p * -24, _1080p * -17 )
	self:addElement( CyanDot )
	self.CyanDot = CyanDot
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		BracketParallaxshadow:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.BracketParallaxshadow:SetAlpha( 0.6, 60 )
				end
			},
			{
				function ()
					return self.BracketParallaxshadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -101, _1080p * 101, _1080p * -203, _1080p * -3, 59 )
				end
			}
		} )
		BracketParallax:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.BracketParallax:SetAlpha( 0.4, 60 )
				end
			},
			{
				function ()
					return self.BracketParallax:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -100, _1080p * 100, _1080p * -203, _1080p * -3, 59 )
				end
			}
		} )
		self._sequences.ADSIN = function ()
			BracketParallaxshadow:AnimateSequence( "ADSIN" )
			BracketParallax:AnimateSequence( "ADSIN" )
		end
		
		BracketParallaxshadow:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.BracketParallaxshadow:SetAlpha( 0.4, 0 )
				end,
				function ()
					return self.BracketParallaxshadow:SetAlpha( 0.3, 60 )
				end
			},
			{
				function ()
					return self.BracketParallaxshadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -101, _1080p * 101, _1080p * -193, _1080p * 7, 59 )
				end
			}
		} )
		BracketParallax:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.BracketParallax:SetAlpha( 0.2, 0 )
				end,
				function ()
					return self.BracketParallax:SetAlpha( 0.1, 60 )
				end
			},
			{
				function ()
					return self.BracketParallax:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -100, _1080p * 100, _1080p * -193, _1080p * 7, 59 )
				end
			}
		} )
		self._sequences.ADSOUT = function ()
			BracketParallaxshadow:AnimateLoop( "ADSOUT" )
			BracketParallax:AnimateLoop( "ADSOUT" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	ACTIONS.AnimateSequence( self, "ADSOUT" )
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "ReticleBracketCyan", ReticleBracketCyan )
LockTable( _M )
