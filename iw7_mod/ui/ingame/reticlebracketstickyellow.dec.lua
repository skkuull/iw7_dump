local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ReticleBracketsTickYellow( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 32 * _1080p, 0, 20 * _1080p )
	self.id = "ReticleBracketsTickYellow"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local ReticleBracketTick = nil
	
	ReticleBracketTick = MenuBuilder.BuildRegisteredType( "ReticleBracketTick", {
		controllerIndex = f1_local1
	} )
	ReticleBracketTick.id = "ReticleBracketTick"
	ReticleBracketTick:SetRGBFromInt( 16767744, 0 )
	ReticleBracketTick:SetAlpha( 0.4, 0 )
	ReticleBracketTick.LeftBracketShadow:SetRGBFromTable( SWATCHES.Reticles.Orange, 0 )
	ReticleBracketTick.RightBracketShadow:SetRGBFromTable( SWATCHES.Reticles.Orange, 0 )
	ReticleBracketTick:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -11, _1080p * 11, _1080p * -7, _1080p * 7 )
	self:addElement( ReticleBracketTick )
	self.ReticleBracketTick = ReticleBracketTick
	
	local DotBase = nil
	
	DotBase = MenuBuilder.BuildRegisteredType( "DotBase", {
		controllerIndex = f1_local1
	} )
	DotBase.id = "DotBase"
	DotBase:SetAlpha( 0, 0 )
	DotBase.DotShadow:SetRGBFromTable( SWATCHES.Reticles.Orange, 0 )
	DotBase.Dot:SetRGBFromTable( SWATCHES.Reticles.Yellow, 0 )
	DotBase.Dot:SetAlpha( 0.8, 0 )
	DotBase.Dot:SetScale( -0.1, 0 )
	DotBase.DotHighlight:SetRGBFromTable( SWATCHES.Reticles.Highlight, 0 )
	DotBase:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -3.07, _1080p * 2.93, _1080p * -3.06, _1080p * 2.94 )
	self:addElement( DotBase )
	self.DotBase = DotBase
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		ReticleBracketTick:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.ReticleBracketTick:SetAlpha( 0.6, 60 )
				end
			}
		} )
		DotBase:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.DotBase:SetAlpha( 0.7, 60 )
				end
			}
		} )
		self._sequences.ADSIN = function ()
			ReticleBracketTick:AnimateSequence( "ADSIN" )
			DotBase:AnimateSequence( "ADSIN" )
		end
		
		ReticleBracketTick:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.ReticleBracketTick:SetAlpha( 0.4, 0 )
				end,
				function ()
					return self.ReticleBracketTick:SetAlpha( 0.25, 60 )
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
			ReticleBracketTick:AnimateLoop( "ADSOUT" )
			DotBase:AnimateLoop( "ADSOUT" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_local1 ), function ()
		if DataSources.inGame.player.currentWeapon.adsPercent:GetValue( f1_local1 ) ~= nil and DataSources.inGame.player.currentWeapon.adsPercent:GetValue( f1_local1 ) < 0.75 then
			ACTIONS.AnimateSequence( self, "ADSOUT" )
		end
		if DataSources.inGame.player.currentWeapon.adsPercent:GetValue( f1_local1 ) ~= nil and DataSources.inGame.player.currentWeapon.adsPercent:GetValue( f1_local1 ) >= 0.75 then
			ACTIONS.AnimateSequence( self, "ADSIN" )
		end
	end )
	return self
end

MenuBuilder.registerType( "ReticleBracketsTickYellow", ReticleBracketsTickYellow )
LockTable( _M )
