local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ReticleGreenCrosshair( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 32 * _1080p, 0, 32 * _1080p )
	self.id = "ReticleGreenCrosshair"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local ReticleBracket = nil
	
	ReticleBracket = MenuBuilder.BuildRegisteredType( "ReticleBracket", {
		controllerIndex = f1_local1
	} )
	ReticleBracket.id = "ReticleBracket"
	ReticleBracket:SetRGBFromTable( SWATCHES.Reticles.BrightGreen, 0 )
	ReticleBracket:SetAlpha( 0.4, 0 )
	ReticleBracket:SetScale( -0.3, 0 )
	ReticleBracket:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -7, _1080p * 7, 0, 0 )
	self:addElement( ReticleBracket )
	self.ReticleBracket = ReticleBracket
	
	local Glow = nil
	
	Glow = LUI.UIImage.new()
	Glow.id = "Glow"
	Glow:SetRGBFromTable( SWATCHES.Reticles.BrightGreen, 0 )
	Glow:SetAlpha( 0, 0 )
	Glow:setImage( RegisterMaterial( "hud_reticle_faded_dot" ), 0 )
	Glow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -2, _1080p * 2, _1080p * -2, _1080p * 2 )
	self:addElement( Glow )
	self.Glow = Glow
	
	local GreenDot = nil
	
	GreenDot = MenuBuilder.BuildRegisteredType( "RedDot", {
		controllerIndex = f1_local1
	} )
	GreenDot.id = "GreenDot"
	GreenDot.DotShadow:SetRGBFromInt( 0, 0 )
	GreenDot.Dot:SetRGBFromTable( SWATCHES.Reticles.BrightGreen, 0 )
	GreenDot.DotHighlight:SetRGBFromInt( 16777215, 0 )
	GreenDot:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -1.5, _1080p * 1.5, _1080p * -1.5, _1080p * 1.5 )
	self:addElement( GreenDot )
	self.GreenDot = GreenDot
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		ReticleBracket:RegisterAnimationSequence( "ZoomIn", {
			{
				function ()
					return self.ReticleBracket:SetAlpha( 0.4, 0 )
				end,
				function ()
					return self.ReticleBracket:SetAlpha( 0, 200 )
				end
			},
			{
				function ()
					return self.ReticleBracket:SetScale( -0.7, 200 )
				end
			},
			{
				function ()
					return self.ReticleBracket:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -5, _1080p * 5, _1080p * -2, _1080p * 2, 0 )
				end,
				function ()
					return self.ReticleBracket:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -4.3, _1080p * 4.3, _1080p * 0.57, _1080p * -0.57, 200 )
				end
			}
		} )
		Glow:RegisterAnimationSequence( "ZoomIn", {
			{
				function ()
					return self.Glow:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Glow:SetAlpha( 0.6, 200 )
				end
			},
			{
				function ()
					return self.Glow:SetScale( 1, 200 )
				end
			}
		} )
		GreenDot:RegisterAnimationSequence( "ZoomIn", {
			{
				function ()
					return self.GreenDot:SetAlpha( 0.85, 200 )
				end
			},
			{
				function ()
					return self.GreenDot.DotHighlight:SetRGBFromTable( SWATCHES.Reticles.Highlight, 200 )
				end
			},
			{
				function ()
					return self.GreenDot.Dot:SetRGBFromTable( SWATCHES.Reticles.BrightGreen, 200 )
				end
			},
			{
				function ()
					return self.GreenDot.DotShadow:SetRGBFromTable( SWATCHES.Reticles.BrightGreen, 200 )
				end
			}
		} )
		self._sequences.ZoomIn = function ()
			ReticleBracket:AnimateSequence( "ZoomIn" )
			Glow:AnimateSequence( "ZoomIn" )
			GreenDot:AnimateSequence( "ZoomIn" )
		end
		
		ReticleBracket:RegisterAnimationSequence( "ZoomOut", {
			{
				function ()
					return self.ReticleBracket:SetAlpha( 0.25, 0 )
				end,
				function ()
					return self.ReticleBracket:SetAlpha( 0.1, 60 )
				end
			},
			{
				function ()
					return self.ReticleBracket:SetScale( -0.3, 60 )
				end
			}
		} )
		Glow:RegisterAnimationSequence( "ZoomOut", {
			{
				function ()
					return self.Glow:SetAlpha( 0, 60 )
				end
			}
		} )
		GreenDot:RegisterAnimationSequence( "ZoomOut", {
			{
				function ()
					return self.GreenDot:SetAlpha( 0, 60 )
				end
			}
		} )
		self._sequences.ZoomOut = function ()
			ReticleBracket:AnimateLoop( "ZoomOut" )
			Glow:AnimateLoop( "ZoomOut" )
			GreenDot:AnimateLoop( "ZoomOut" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.player.inADS:GetModel( f1_local1 ), function ()
		if DataSources.inGame.player.inADS:GetValue( f1_local1 ) ~= nil and DataSources.inGame.player.inADS:GetValue( f1_local1 ) == true then
			ACTIONS.AnimateSequence( self, "ZoomIn" )
		end
		if DataSources.inGame.player.inADS:GetValue( f1_local1 ) ~= nil and DataSources.inGame.player.inADS:GetValue( f1_local1 ) == false then
			ACTIONS.AnimateSequence( self, "ZoomOut" )
		end
	end )
	return self
end

MenuBuilder.registerType( "ReticleGreenCrosshair", ReticleGreenCrosshair )
LockTable( _M )
