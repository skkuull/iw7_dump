local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function AccentOverlay( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "AccentOverlay"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local AccentRightDotPattern = nil
	
	AccentRightDotPattern = LUI.UIImage.new()
	AccentRightDotPattern.id = "AccentRightDotPattern"
	AccentRightDotPattern:setImage( RegisterMaterial( "wdg_right_dot_pattern" ), 0 )
	AccentRightDotPattern:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -512, 0, 0, _1080p * 512 )
	self:addElement( AccentRightDotPattern )
	self.AccentRightDotPattern = AccentRightDotPattern
	
	local AccentGridPattern1 = nil
	
	AccentGridPattern1 = LUI.UIImage.new()
	AccentGridPattern1.id = "AccentGridPattern1"
	AccentGridPattern1:setImage( RegisterMaterial( "wdg_grid_pattern" ), 0 )
	AccentGridPattern1:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 256, _1080p * 30, _1080p * 542 )
	self:addElement( AccentGridPattern1 )
	self.AccentGridPattern1 = AccentGridPattern1
	
	local AccentGridPattern2 = nil
	
	AccentGridPattern2 = LUI.UIImage.new()
	AccentGridPattern2.id = "AccentGridPattern2"
	AccentGridPattern2:setImage( RegisterMaterial( "wdg_grid_pattern_2" ), 0 )
	AccentGridPattern2:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 512, 0, _1080p * 64 )
	self:addElement( AccentGridPattern2 )
	self.AccentGridPattern2 = AccentGridPattern2
	
	local AccentTopStreak = nil
	
	AccentTopStreak = LUI.UIImage.new()
	AccentTopStreak.id = "AccentTopStreak"
	AccentTopStreak:setImage( RegisterMaterial( "wdg_fade_streak_right" ), 0 )
	AccentTopStreak:SetAnchorsAndPosition( 1, 0, 0, 1, 0, _1080p * -1024, _1080p * 90, _1080p * 106 )
	self:addElement( AccentTopStreak )
	self.AccentTopStreak = AccentTopStreak
	
	local AccentStreak = nil
	
	AccentStreak = LUI.UIImage.new()
	AccentStreak.id = "AccentStreak"
	AccentStreak:setImage( RegisterMaterial( "wdg_screen_streak_1" ), 0 )
	AccentStreak:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -76, _1080p * 948, _1080p * 18, _1080p * 34 )
	self:addElement( AccentStreak )
	self.AccentStreak = AccentStreak
	
	local AccentHorzTicks1 = nil
	
	AccentHorzTicks1 = LUI.UIImage.new()
	AccentHorzTicks1.id = "AccentHorzTicks1"
	AccentHorzTicks1:SetAlpha( 0.2, 0 )
	AccentHorzTicks1:setImage( RegisterMaterial( "wdg_horizontal_ticks_1" ), 0 )
	AccentHorzTicks1:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -656, _1080p * -400, _1080p * -129, _1080p * -125 )
	self:addElement( AccentHorzTicks1 )
	self.AccentHorzTicks1 = AccentHorzTicks1
	
	local AccentMatrixStreak2 = nil
	
	AccentMatrixStreak2 = LUI.UIImage.new()
	AccentMatrixStreak2.id = "AccentMatrixStreak2"
	AccentMatrixStreak2:setImage( RegisterMaterial( "wdg_matrix_streak_2" ), 0 )
	AccentMatrixStreak2:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -310, _1080p * -182, _1080p * -135, _1080p * -119 )
	self:addElement( AccentMatrixStreak2 )
	self.AccentMatrixStreak2 = AccentMatrixStreak2
	
	local AccentMatrixStreak1 = nil
	
	AccentMatrixStreak1 = LUI.UIImage.new()
	AccentMatrixStreak1.id = "AccentMatrixStreak1"
	AccentMatrixStreak1:setImage( RegisterMaterial( "wdg_matrix_streak_1" ), 0 )
	AccentMatrixStreak1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 400, _1080p * 1424, _1080p * 20, _1080p * 36 )
	self:addElement( AccentMatrixStreak1 )
	self.AccentMatrixStreak1 = AccentMatrixStreak1
	
	local AccentTightMatrix = nil
	
	AccentTightMatrix = LUI.UIImage.new()
	AccentTightMatrix.id = "AccentTightMatrix"
	AccentTightMatrix:setImage( RegisterMaterial( "wdg_tight_matrix" ), 0 )
	AccentTightMatrix:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -352, _1080p * -96, _1080p * 55, _1080p * 87 )
	self:addElement( AccentTightMatrix )
	self.AccentTightMatrix = AccentTightMatrix
	
	local AccentDotMatrix = nil
	
	AccentDotMatrix = MenuBuilder.BuildRegisteredType( "AccentDotMatrix", {
		controllerIndex = f1_local1
	} )
	AccentDotMatrix.id = "AccentDotMatrix"
	AccentDotMatrix:SetAlpha( 0.4, 0 )
	AccentDotMatrix:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1696, _1080p * 1824, _1080p * 913, _1080p * 945 )
	self:addElement( AccentDotMatrix )
	self.AccentDotMatrix = AccentDotMatrix
	
	local RightSideGlow = nil
	
	RightSideGlow = MenuBuilder.BuildRegisteredType( "AccentSideGlow", {
		controllerIndex = f1_local1
	} )
	RightSideGlow.id = "RightSideGlow"
	RightSideGlow:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -362, _1080p * 150, _1080p * -190, _1080p * 190 )
	self:addElement( RightSideGlow )
	self.RightSideGlow = RightSideGlow
	
	local LeftSideGlow = nil
	
	LeftSideGlow = MenuBuilder.BuildRegisteredType( "AccentSideGlow", {
		controllerIndex = f1_local1
	} )
	LeftSideGlow.id = "LeftSideGlow"
	LeftSideGlow:SetZRotation( 180, 0 )
	LeftSideGlow:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -150, _1080p * 362, _1080p * -190, _1080p * 190 )
	self:addElement( LeftSideGlow )
	self.LeftSideGlow = LeftSideGlow
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		AccentRightDotPattern:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.AccentRightDotPattern:SetAlpha( 0, 400 )
				end,
				function ()
					return self.AccentRightDotPattern:SetAlpha( 0.5, 600, LUI.EASING.outQuartic )
				end
			}
		} )
		AccentGridPattern1:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.AccentGridPattern1:SetAlpha( 0, 100 )
				end,
				function ()
					return self.AccentGridPattern1:SetAlpha( 1, 600, LUI.EASING.outQuartic )
				end
			},
			{
				function ()
					return self.AccentGridPattern1:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 256, _1080p * -457, _1080p * 55, 100 )
				end,
				function ()
					return self.AccentGridPattern1:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 256, _1080p * 30, _1080p * 542, 599, LUI.EASING.outQuartic )
				end
			}
		} )
		AccentGridPattern2:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.AccentGridPattern2:SetAlpha( 0, 200 )
				end,
				function ()
					return self.AccentGridPattern2:SetAlpha( 1, 600, LUI.EASING.outQuartic )
				end
			}
		} )
		AccentTopStreak:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.AccentTopStreak:SetAlpha( 0, 200 )
				end,
				function ()
					return self.AccentTopStreak:SetAlpha( 1, 600, LUI.EASING.outQuartic )
				end
			},
			{
				function ()
					return self.AccentTopStreak:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * 1024, 0, _1080p * 90, _1080p * 106, 200 )
				end,
				function ()
					return self.AccentTopStreak:SetAnchorsAndPosition( 1, 0, 0, 1, 0, _1080p * -1024, _1080p * 90, _1080p * 106, 600, LUI.EASING.outQuartic )
				end
			}
		} )
		AccentStreak:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.AccentStreak:SetAlpha( 0, 0 )
				end,
				function ()
					return self.AccentStreak:SetAlpha( 1, 600, LUI.EASING.outQuartic )
				end
			},
			{
				function ()
					return self.AccentStreak:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -964, _1080p * 60, _1080p * 16, _1080p * 32, 0 )
				end,
				function ()
					return self.AccentStreak:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -76, _1080p * 948, _1080p * 18, _1080p * 34, 600, LUI.EASING.outQuartic )
				end
			}
		} )
		AccentHorzTicks1:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.AccentHorzTicks1:SetAlpha( 0, 100 )
				end,
				function ()
					return self.AccentHorzTicks1:SetAlpha( 0.4, 600, LUI.EASING.outQuartic )
				end
			},
			{
				function ()
					return self.AccentHorzTicks1:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -500, _1080p * -244, _1080p * -129, _1080p * -125, 100 )
				end,
				function ()
					return self.AccentHorzTicks1:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -656, _1080p * -400, _1080p * -129, _1080p * -125, 599, LUI.EASING.outQuartic )
				end
			}
		} )
		AccentMatrixStreak2:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.AccentMatrixStreak2:SetAlpha( 0, 150 )
				end,
				function ()
					return self.AccentMatrixStreak2:SetAlpha( 1, 600, LUI.EASING.outQuartic )
				end
			},
			{
				function ()
					return self.AccentMatrixStreak2:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -95, _1080p * 33, _1080p * -135, _1080p * -119, 150 )
				end,
				function ()
					return self.AccentMatrixStreak2:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -310, _1080p * -182, _1080p * -135, _1080p * -119, 599, LUI.EASING.outQuartic )
				end
			}
		} )
		AccentMatrixStreak1:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.AccentMatrixStreak1:SetAlpha( 0, 250 )
				end,
				function ()
					return self.AccentMatrixStreak1:SetAlpha( 1, 600, LUI.EASING.outQuartic )
				end
			},
			{
				function ()
					return self.AccentMatrixStreak1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -100, _1080p * 924, _1080p * 20, _1080p * 36, 250 )
				end,
				function ()
					return self.AccentMatrixStreak1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 400, _1080p * 1424, _1080p * 20, _1080p * 36, 600, LUI.EASING.outQuartic )
				end
			}
		} )
		AccentTightMatrix:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.AccentTightMatrix:SetAlpha( 0, 400 )
				end,
				function ()
					return self.AccentTightMatrix:SetAlpha( 1, 600, LUI.EASING.outQuartic )
				end
			}
		} )
		AccentDotMatrix:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.AccentDotMatrix:SetAlpha( 0, 200 )
				end,
				function ()
					return self.AccentDotMatrix:SetAlpha( 0.4, 600, LUI.EASING.outQuartic )
				end
			}
		} )
		RightSideGlow:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.RightSideGlow:SetAlpha( 0, 0 )
				end,
				function ()
					return self.RightSideGlow:SetAlpha( 0.6, 1000, LUI.EASING.outQuartic )
				end
			}
		} )
		LeftSideGlow:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.LeftSideGlow:SetAlpha( 0, 0 )
				end,
				function ()
					return self.LeftSideGlow:SetAlpha( 0.6, 1000, LUI.EASING.outQuartic )
				end
			}
		} )
		self._sequences.Bootup = function ()
			AccentRightDotPattern:AnimateSequence( "Bootup" )
			AccentGridPattern1:AnimateSequence( "Bootup" )
			AccentGridPattern2:AnimateSequence( "Bootup" )
			AccentTopStreak:AnimateSequence( "Bootup" )
			AccentStreak:AnimateSequence( "Bootup" )
			AccentHorzTicks1:AnimateSequence( "Bootup" )
			AccentMatrixStreak2:AnimateSequence( "Bootup" )
			AccentMatrixStreak1:AnimateSequence( "Bootup" )
			AccentTightMatrix:AnimateSequence( "Bootup" )
			AccentDotMatrix:AnimateSequence( "Bootup" )
			RightSideGlow:AnimateSequence( "Bootup" )
			LeftSideGlow:AnimateSequence( "Bootup" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	ACTIONS.AnimateSequence( self, "Bootup" )
	return self
end

MenuBuilder.registerType( "AccentOverlay", AccentOverlay )
LockTable( _M )
