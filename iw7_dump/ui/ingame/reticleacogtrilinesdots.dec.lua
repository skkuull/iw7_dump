local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ReticleACOGTriLinesDots( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 64 * _1080p, 0, 64 * _1080p )
	self.id = "ReticleACOGTriLinesDots"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local ACOGvDShadow = nil
	
	ACOGvDShadow = LUI.UIImage.new()
	ACOGvDShadow.id = "ACOGvDShadow"
	ACOGvDShadow:SetRGBFromTable( SWATCHES.Reticles.LightRed, 0 )
	ACOGvDShadow:SetAlpha( 0.6, 0 )
	ACOGvDShadow:setImage( RegisterMaterial( "hud_reticle_acog_d" ), 0 )
	self:addElement( ACOGvDShadow )
	self.ACOGvDShadow = ACOGvDShadow
	
	local ACOGvDGlow = nil
	
	ACOGvDGlow = LUI.UIImage.new()
	ACOGvDGlow.id = "ACOGvDGlow"
	ACOGvDGlow:SetRGBFromTable( SWATCHES.Reticles.LightRed, 0 )
	ACOGvDGlow:SetAlpha( 0.8, 0 )
	ACOGvDGlow:setImage( RegisterMaterial( "hud_reticle_acog_d" ), 0 )
	ACOGvDGlow:SetBlendMode( BLEND_MODE.addWithAlpha )
	self:addElement( ACOGvDGlow )
	self.ACOGvDGlow = ACOGvDGlow
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		ACOGvDShadow:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.ACOGvDShadow:SetAlpha( 1, 60 )
				end
			}
		} )
		ACOGvDGlow:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.ACOGvDGlow:SetAlpha( 0.8, 60 )
				end
			}
		} )
		self._sequences.ADSIN = function ()
			ACOGvDShadow:AnimateSequence( "ADSIN" )
			ACOGvDGlow:AnimateSequence( "ADSIN" )
		end
		
		ACOGvDShadow:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.ACOGvDShadow:SetAlpha( 0.2, 60 )
				end
			}
		} )
		ACOGvDGlow:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.ACOGvDGlow:SetAlpha( 0.3, 0 )
				end,
				function ()
					return self.ACOGvDGlow:SetAlpha( 0.5, 60 )
				end
			}
		} )
		self._sequences.ADSOUT = function ()
			ACOGvDShadow:AnimateLoop( "ADSOUT" )
			ACOGvDGlow:AnimateLoop( "ADSOUT" )
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

MenuBuilder.registerType( "ReticleACOGTriLinesDots", ReticleACOGTriLinesDots )
LockTable( _M )
