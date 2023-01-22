local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	f1_arg0.crosshair2:SetParallaxMotionAmount( ReticleParallaxAmount.udmbackground )
	local f1_local0 = 0.75
	f1_arg0:SubscribeToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_arg1 ), function ( f2_arg0 )
		local f2_local0 = DataModel.GetModelValue( f2_arg0 )
		if f1_arg0.isVisible ~= true and f1_local0 <= f2_local0 then
			ACTIONS.AnimateSequence( f1_arg0, "ADSIN" )
			ACTIONS.AnimateSequenceByElement( f1_arg0, {
				elementName = "AmmoCounterBase",
				sequenceName = "Glow",
				elementPath = "AmmoCounterBase"
			} )
			f1_arg0.isVisible = true
		elseif f1_arg0.isVisible ~= false and f2_local0 < f1_local0 then
			ACTIONS.AnimateSequence( f1_arg0, "ADSOUT" )
			ACTIONS.AnimateSequenceByElement( f1_arg0, {
				elementName = "AmmoCounterBase",
				sequenceName = "NoGlow",
				elementPath = "AmmoCounterBase"
			} )
			f1_arg0.isVisible = false
		end
	end )
end

function ReticleUDM45( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 26 * _1080p, 0, 26 * _1080p )
	self.id = "ReticleUDM45"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local AmmoCounterBase = nil
	
	AmmoCounterBase = MenuBuilder.BuildRegisteredType( "AmmoCounterBase", {
		controllerIndex = f3_local1
	} )
	AmmoCounterBase.id = "AmmoCounterBase"
	AmmoCounterBase:SetRGBFromTable( SWATCHES.Reticles.LightCyan, 0 )
	AmmoCounterBase:SetAlpha( 0.6, 0 )
	AmmoCounterBase:SetScale( -0.1, 0 )
	AmmoCounterBase.AmmoCounterShadow:SetRGBFromTable( SWATCHES.Reticles.LightCyan, 0 )
	AmmoCounterBase.AmmoCounterShadow:SetAlpha( 0.6, 0 )
	AmmoCounterBase.AmmoCounterShadow:SetShadowMinDistance( -0.6, 0 )
	AmmoCounterBase.AmmoCounterShadow:SetShadowRGBFromInt( 8339967, 0 )
	AmmoCounterBase.AmmoCounter:SetAlpha( 0.6, 0 )
	AmmoCounterBase.AmmoCounter:SetShadowMinDistance( -0.8, 0 )
	AmmoCounterBase.AmmoCounter:SetShadowMaxDistance( 0.8, 0 )
	AmmoCounterBase.AmmoCounter:SetShadowRGBFromInt( 8339967, 0 )
	AmmoCounterBase:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -1, _1080p * 39, _1080p * 19, _1080p * 34 )
	self:addElement( AmmoCounterBase )
	self.AmmoCounterBase = AmmoCounterBase
	
	local crosshair2 = nil
	
	crosshair2 = LUI.UIImage.new()
	crosshair2.id = "crosshair2"
	crosshair2:SetRGBFromInt( 8339967, 0 )
	crosshair2:SetAlpha( 0.3, 0 )
	crosshair2:setImage( RegisterMaterial( "hud_reticle_udm45" ), 0 )
	crosshair2:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -13, _1080p * 13, _1080p * -13, _1080p * 13 )
	self:addElement( crosshair2 )
	self.crosshair2 = crosshair2
	
	local crosshair1 = nil
	
	crosshair1 = LUI.UIImage.new()
	crosshair1.id = "crosshair1"
	crosshair1:SetRGBFromTable( SWATCHES.Reticles.AzureBlue, 0 )
	crosshair1:SetAlpha( 0.3, 0 )
	crosshair1:setImage( RegisterMaterial( "hud_reticle_udm45" ), 0 )
	crosshair1:SetBlendMode( BLEND_MODE.addWithAlpha )
	crosshair1:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -13, _1080p * 13, _1080p * -13, _1080p * 13 )
	self:addElement( crosshair1 )
	self.crosshair1 = crosshair1
	
	local DotBase = nil
	
	DotBase = MenuBuilder.BuildRegisteredType( "DotBase", {
		controllerIndex = f3_local1
	} )
	DotBase.id = "DotBase"
	DotBase.DotShadow:SetRGBFromTable( SWATCHES.Reticles.Blue, 0 )
	DotBase.DotShadow:SetAlpha( 0.8, 0 )
	DotBase.Dot:SetRGBFromInt( 9987839, 0 )
	DotBase.Dot:SetAlpha( 0.7, 0 )
	DotBase.DotHighlight:SetRGBFromTable( SWATCHES.Reticles.LightCyan, 0 )
	DotBase:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -3.3, _1080p * 3.3, _1080p * -3.3, _1080p * 3.3 )
	self:addElement( DotBase )
	self.DotBase = DotBase
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		AmmoCounterBase:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.AmmoCounterBase:SetScale( -0.1, 30 )
				end
			},
			{
				function ()
					return self.AmmoCounterBase:SetAlpha( 1, 30 )
				end
			},
			{
				function ()
					return self.AmmoCounterBase.AmmoCounterShadow:SetRGBFromInt( 5264383, 30 )
				end
			},
			{
				function ()
					return self.AmmoCounterBase.AmmoCounterShadow:SetShadowRGBFromInt( 5264383, 30 )
				end
			},
			{
				function ()
					return self.AmmoCounterBase.AmmoCounter:SetShadowRGBFromInt( 5264383, 30 )
				end
			},
			{
				function ()
					return self.AmmoCounterBase:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -1, _1080p * 39, _1080p * 16, _1080p * 31, 29 )
				end
			}
		} )
		crosshair2:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.crosshair2:SetAlpha( 0, 60 )
				end
			},
			{
				function ()
					return self.crosshair2:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -3, _1080p * 3, _1080p * -3, _1080p * 3, 59 )
				end
			}
		} )
		crosshair1:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.crosshair1:SetAlpha( 0, 60 )
				end
			},
			{
				function ()
					return self.crosshair1:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -3, _1080p * 3, _1080p * -3, _1080p * 3, 59 )
				end
			}
		} )
		DotBase:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.DotBase:SetAlpha( 1, 60 )
				end
			}
		} )
		self._sequences.ADSIN = function ()
			AmmoCounterBase:AnimateSequence( "ADSIN" )
			crosshair2:AnimateSequence( "ADSIN" )
			crosshair1:AnimateSequence( "ADSIN" )
			DotBase:AnimateSequence( "ADSIN" )
		end
		
		AmmoCounterBase:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.AmmoCounterBase:SetScale( -0.5, 60 )
				end
			},
			{
				function ()
					return self.AmmoCounterBase:SetAlpha( 0.6, 60 )
				end
			},
			{
				function ()
					return self.AmmoCounterBase.AmmoCounterShadow:SetRGBFromTable( SWATCHES.Reticles.LightCyan, 60 )
				end
			},
			{
				function ()
					return self.AmmoCounterBase.AmmoCounter:SetShadowRGBFromInt( 8339967, 60 )
				end
			},
			{
				function ()
					return self.AmmoCounterBase.AmmoCounterShadow:SetShadowRGBFromInt( 8339967, 60 )
				end
			},
			{
				function ()
					return self.AmmoCounterBase:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -10, _1080p * 30, _1080p * 8, _1080p * 23, 59 )
				end
			}
		} )
		crosshair2:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.crosshair2:SetAlpha( 0.2, 0 )
				end,
				function ()
					return self.crosshair2:SetAlpha( 0.4, 60 )
				end
			},
			{
				function ()
					return self.crosshair2:SetScale( -0.3, 60 )
				end
			},
			{
				function ()
					return self.crosshair2:SetRGBFromInt( 8339967, 60 )
				end
			},
			{
				function ()
					return self.crosshair2:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -13, _1080p * 13, _1080p * -13, _1080p * 13, 59 )
				end
			}
		} )
		crosshair1:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.crosshair1:SetAlpha( 0.2, 0 )
				end,
				function ()
					return self.crosshair1:SetAlpha( 0.4, 60 )
				end
			},
			{
				function ()
					return self.crosshair1:SetScale( -0.3, 60 )
				end
			},
			{
				function ()
					return self.crosshair1:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -13, _1080p * 13, _1080p * -13, _1080p * 13, 59 )
				end
			}
		} )
		DotBase:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.DotBase:SetAlpha( 0, 60 )
				end
			}
		} )
		self._sequences.ADSOUT = function ()
			AmmoCounterBase:AnimateLoop( "ADSOUT" )
			crosshair2:AnimateLoop( "ADSOUT" )
			crosshair1:AnimateLoop( "ADSOUT" )
			DotBase:AnimateLoop( "ADSOUT" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "ReticleUDM45", ReticleUDM45 )
LockTable( _M )
