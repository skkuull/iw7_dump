local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function YellowDot( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 10 * _1080p, 0, 10 * _1080p )
	self.id = "YellowDot"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local YellowDot = nil
	
	YellowDot = MenuBuilder.BuildRegisteredType( "RedDot", {
		controllerIndex = f1_local1
	} )
	YellowDot.id = "YellowDot"
	YellowDot:SetAlpha( 0, 0 )
	YellowDot.DotShadow:SetRGBFromTable( SWATCHES.Reticles.DarkRed, 0 )
	YellowDot.Dot:SetRGBFromTable( SWATCHES.Reticles.DarkBrown, 0 )
	YellowDot.DotHighlight:SetRGBFromTable( SWATCHES.Reticles.Yellow, 0 )
	YellowDot:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 1, _1080p * -1, _1080p * 1, _1080p * -1 )
	self:addElement( YellowDot )
	self.YellowDot = YellowDot
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		YellowDot:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.YellowDot:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.ADSIN = function ()
			YellowDot:AnimateSequence( "ADSIN" )
		end
		
		YellowDot:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.YellowDot:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.ADSOUT = function ()
			YellowDot:AnimateSequence( "ADSOUT" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_local1 ), function ()
		if DataSources.inGame.player.currentWeapon.adsPercent:GetValue( f1_local1 ) ~= nil and DataSources.inGame.player.currentWeapon.adsPercent:GetValue( f1_local1 ) >= 0.75 then
			ACTIONS.AnimateSequence( self, "ADSIN" )
		end
		if DataSources.inGame.player.currentWeapon.adsPercent:GetValue( f1_local1 ) ~= nil and DataSources.inGame.player.currentWeapon.adsPercent:GetValue( f1_local1 ) < 0.75 then
			ACTIONS.AnimateSequence( self, "ADSOUT" )
		end
	end )
	return self
end

MenuBuilder.registerType( "YellowDot", YellowDot )
LockTable( _M )
