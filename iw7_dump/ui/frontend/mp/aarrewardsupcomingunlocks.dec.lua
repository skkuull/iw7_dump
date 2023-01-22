local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function AARRewardsUpcomingUnlocks( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 64 * _1080p )
	self.id = "AARRewardsUpcomingUnlocks"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	self.soundSet = "aarrewards"
	local f1_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 0, 0 )
	Background:SetAlpha( 0.5, 0 )
	Background:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
	self:addElement( Background )
	self.Background = Background
	
	local HorizontalLine = nil
	
	HorizontalLine = LUI.UIImage.new()
	HorizontalLine.id = "HorizontalLine"
	HorizontalLine:SetAlpha( 0.4, 0 )
	HorizontalLine:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 3 )
	self:addElement( HorizontalLine )
	self.HorizontalLine = HorizontalLine
	
	self._animationSets.DefaultAnimationSet = function ()
		Background:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Background:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Background:SetAlpha( 0, 400 )
				end,
				function ()
					return self.Background:SetAlpha( 0.5, 300, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0, 0 )
				end,
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, _1080p * -64, 400 )
				end,
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0, 299, LUI.EASING.outBack )
				end
			}
		} )
		HorizontalLine:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.HorizontalLine:SetAlpha( 0, 0 )
				end,
				function ()
					return self.HorizontalLine:SetAlpha( 0.4, 200 )
				end,
				function ()
					return self.HorizontalLine:SetAlpha( 0.4, 300, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.HorizontalLine:playSound( "lineAnim", false, 200 )
				end
			},
			{
				function ()
					return self.HorizontalLine:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 959, _1080p * -959, 0, _1080p * 3, 0 )
				end,
				function ()
					return self.HorizontalLine:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 959, _1080p * -959, 0, _1080p * 3, 200 )
				end,
				function ()
					return self.HorizontalLine:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 3, 299, LUI.EASING.outBack )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			Background:AnimateSequence( "DefaultSequence" )
			HorizontalLine:AnimateSequence( "DefaultSequence" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	return self
end

MenuBuilder.registerType( "AARRewardsUpcomingUnlocks", AARRewardsUpcomingUnlocks )
LockTable( _M )
