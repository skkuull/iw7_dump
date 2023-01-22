local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ReticleCircleDotSmall( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 64 * _1080p, 0, 64 * _1080p )
	self.id = "ReticleCircleDotSmall"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local RingShadow = nil
	
	RingShadow = LUI.UIImage.new()
	RingShadow.id = "RingShadow"
	RingShadow:SetRGBFromTable( SWATCHES.Reticles.LightRed, 0 )
	RingShadow:setImage( RegisterMaterial( "hud_reticle_ring_small" ), 0 )
	self:addElement( RingShadow )
	self.RingShadow = RingShadow
	
	local RingGlow = nil
	
	RingGlow = LUI.UIImage.new()
	RingGlow.id = "RingGlow"
	RingGlow:SetRGBFromTable( SWATCHES.Reticles.Orange, 0 )
	RingGlow:SetAlpha( 0.8, 0 )
	RingGlow:setImage( RegisterMaterial( "hud_reticle_ring_small" ), 0 )
	RingGlow:SetBlendMode( BLEND_MODE.addWithAlpha )
	self:addElement( RingGlow )
	self.RingGlow = RingGlow
	
	local DotShadow = nil
	
	DotShadow = LUI.UIImage.new()
	DotShadow.id = "DotShadow"
	DotShadow:SetRGBFromTable( SWATCHES.Reticles.LightRed, 0 )
	DotShadow:setImage( RegisterMaterial( "hud_reticle_dot_glow" ), 0 )
	DotShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -15, _1080p * 15, _1080p * -15, _1080p * 15 )
	self:addElement( DotShadow )
	self.DotShadow = DotShadow
	
	local DotGlow = nil
	
	DotGlow = LUI.UIImage.new()
	DotGlow.id = "DotGlow"
	DotGlow:SetRGBFromTable( SWATCHES.Reticles.Orange, 0 )
	DotGlow:SetAlpha( 0.8, 0 )
	DotGlow:setImage( RegisterMaterial( "hud_reticle_dot_glow" ), 0 )
	DotGlow:SetBlendMode( BLEND_MODE.addWithAlpha )
	DotGlow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -15, _1080p * 15, _1080p * -15, _1080p * 15 )
	self:addElement( DotGlow )
	self.DotGlow = DotGlow
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		RingShadow:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.RingShadow:SetAlpha( 1, 300 )
				end
			},
			{
				function ()
					return self.RingShadow:SetDepth( 0, 300 )
				end
			}
		} )
		RingGlow:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.RingGlow:SetAlpha( 0.8, 300 )
				end
			},
			{
				function ()
					return self.RingGlow:SetDepth( 0, 300 )
				end
			}
		} )
		DotShadow:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.DotShadow:SetAlpha( 1, 300 )
				end
			},
			{
				function ()
					return self.DotShadow:SetDepth( 0, 300 )
				end
			}
		} )
		DotGlow:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.DotGlow:SetAlpha( 0.8, 300 )
				end
			},
			{
				function ()
					return self.DotGlow:SetDepth( 0, 300 )
				end
			}
		} )
		self._sequences.ADSIN = function ()
			RingShadow:AnimateSequence( "ADSIN" )
			RingGlow:AnimateSequence( "ADSIN" )
			DotShadow:AnimateSequence( "ADSIN" )
			DotGlow:AnimateSequence( "ADSIN" )
		end
		
		RingShadow:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.RingShadow:SetAlpha( 0.6, 0 )
				end,
				function ()
					return self.RingShadow:SetAlpha( 0.5, 60 )
				end
			},
			{
				function ()
					return self.RingShadow:SetDepth( 2, 0 )
				end
			}
		} )
		RingGlow:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.RingGlow:SetAlpha( 0.6, 0 )
				end,
				function ()
					return self.RingGlow:SetAlpha( 0.5, 60 )
				end
			},
			{
				function ()
					return self.RingGlow:SetDepth( -2, 0 )
				end
			}
		} )
		DotShadow:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.DotShadow:SetAlpha( 0.6, 0 )
				end,
				function ()
					return self.DotShadow:SetAlpha( 0.5, 60 )
				end
			},
			{
				function ()
					return self.DotShadow:SetDepth( 2, 0 )
				end
			}
		} )
		DotGlow:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.DotGlow:SetAlpha( 0.6, 0 )
				end,
				function ()
					return self.DotGlow:SetAlpha( 0.5, 60 )
				end
			},
			{
				function ()
					return self.DotGlow:SetDepth( -2, 0 )
				end
			}
		} )
		self._sequences.ADSOUT = function ()
			RingShadow:AnimateLoop( "ADSOUT" )
			RingGlow:AnimateLoop( "ADSOUT" )
			DotShadow:AnimateLoop( "ADSOUT" )
			DotGlow:AnimateLoop( "ADSOUT" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.player.inADS:GetModel( f1_local1 ), function ()
		if DataSources.inGame.player.inADS:GetValue( f1_local1 ) ~= nil and DataSources.inGame.player.inADS:GetValue( f1_local1 ) == true then
			ACTIONS.AnimateSequence( self, "ADSIN" )
		end
		if DataSources.inGame.player.inADS:GetValue( f1_local1 ) ~= nil and DataSources.inGame.player.inADS:GetValue( f1_local1 ) == false then
			ACTIONS.AnimateSequence( self, "ADSOUT" )
		end
	end )
	return self
end

MenuBuilder.registerType( "ReticleCircleDotSmall", ReticleCircleDotSmall )
LockTable( _M )
