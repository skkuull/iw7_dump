local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function AARRewardsKeys( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 250 * _1080p, 0, 250 * _1080p )
	self.id = "AARRewardsKeys"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	self.soundSet = "aarrewards"
	local f1_local2 = self
	local AARRewardsKeyProgress = nil
	
	AARRewardsKeyProgress = MenuBuilder.BuildRegisteredType( "AARRewardsKeyProgress", {
		controllerIndex = f1_local1
	} )
	AARRewardsKeyProgress.id = "AARRewardsKeyProgress"
	AARRewardsKeyProgress:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -125, _1080p * 125, _1080p * -125, _1080p * 125 )
	self:addElement( AARRewardsKeyProgress )
	self.AARRewardsKeyProgress = AARRewardsKeyProgress
	
	self._animationSets.DefaultAnimationSet = function ()
		AARRewardsKeyProgress:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.AARRewardsKeyProgress:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			AARRewardsKeyProgress:AnimateSequence( "DefaultSequence" )
		end
		
		AARRewardsKeyProgress:RegisterAnimationSequence( "Featured", {
			{
				function ()
					return self.AARRewardsKeyProgress:SetAlpha( 0, 0 )
				end,
				function ()
					return self.AARRewardsKeyProgress:SetAlpha( 1, 300, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.AARRewardsKeyProgress:SetScale( 1, 0 )
				end,
				function ()
					return self.AARRewardsKeyProgress:SetScale( 0, 300, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.AARRewardsKeyProgress:playSound( "meterIntroKeys", false, 0 )
				end
			}
		} )
		self._sequences.Featured = function ()
			AARRewardsKeyProgress:AnimateSequence( "Featured" )
		end
		
		AARRewardsKeyProgress:RegisterAnimationSequence( "NotFeatured", {
			{
				function ()
					return self.AARRewardsKeyProgress:SetScale( 0, 0 )
				end
			},
			{
				function ()
					return self.AARRewardsKeyProgress:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.NotFeatured = function ()
			AARRewardsKeyProgress:AnimateSequence( "NotFeatured" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	return self
end

MenuBuilder.registerType( "AARRewardsKeys", AARRewardsKeys )
LockTable( _M )
