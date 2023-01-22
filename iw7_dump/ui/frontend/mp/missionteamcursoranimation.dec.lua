local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function MissionTeamCursorAnimation( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 128 * _1080p, 0, 128 * _1080p )
	self.id = "MissionTeamCursorAnimation"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local FrameTop = nil
	
	FrameTop = LUI.UIImage.new()
	FrameTop.id = "FrameTop"
	FrameTop:SetRGBFromInt( 6710886, 0 )
	FrameTop:SetAlpha( 0.6, 0 )
	FrameTop:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 12, _1080p * -12, _1080p * 4, _1080p * 12 )
	self:addElement( FrameTop )
	self.FrameTop = FrameTop
	
	local FrameBottom = nil
	
	FrameBottom = LUI.UIImage.new()
	FrameBottom.id = "FrameBottom"
	FrameBottom:SetRGBFromInt( 6710886, 0 )
	FrameBottom:SetAlpha( 0.6, 0 )
	FrameBottom:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 12, _1080p * -12, _1080p * -12, _1080p * -4 )
	self:addElement( FrameBottom )
	self.FrameBottom = FrameBottom
	
	local LineTop = nil
	
	LineTop = LUI.UIImage.new()
	LineTop.id = "LineTop"
	LineTop:SetAlpha( 0.4, 0 )
	LineTop:SetBlendMode( BLEND_MODE.addWithAlpha )
	LineTop:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 10, _1080p * -10, _1080p * -5, _1080p * -3 )
	self:addElement( LineTop )
	self.LineTop = LineTop
	
	local LineBottom = nil
	
	LineBottom = LUI.UIImage.new()
	LineBottom.id = "LineBottom"
	LineBottom:SetAlpha( 0.4, 0 )
	LineBottom:SetBlendMode( BLEND_MODE.addWithAlpha )
	LineBottom:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 10, _1080p * -10, _1080p * 3, _1080p * 5 )
	self:addElement( LineBottom )
	self.LineBottom = LineBottom
	
	local LineRight = nil
	
	LineRight = LUI.UIImage.new()
	LineRight.id = "LineRight"
	LineRight:SetAlpha( 0.4, 0 )
	LineRight:SetBlendMode( BLEND_MODE.addWithAlpha )
	LineRight:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * 3, _1080p * 5, _1080p * 10, _1080p * -10 )
	self:addElement( LineRight )
	self.LineRight = LineRight
	
	local LineLeft = nil
	
	LineLeft = LUI.UIImage.new()
	LineLeft.id = "LineLeft"
	LineLeft:SetAlpha( 0.4, 0 )
	LineLeft:SetBlendMode( BLEND_MODE.addWithAlpha )
	LineLeft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -5, _1080p * -3, _1080p * 10, _1080p * -10 )
	self:addElement( LineLeft )
	self.LineLeft = LineLeft
	
	local FrameLeft = nil
	
	FrameLeft = LUI.UIImage.new()
	FrameLeft.id = "FrameLeft"
	FrameLeft:SetRGBFromInt( 6710886, 0 )
	FrameLeft:SetAlpha( 0.6, 0 )
	FrameLeft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 4, _1080p * 12, _1080p * 4, _1080p * -4 )
	self:addElement( FrameLeft )
	self.FrameLeft = FrameLeft
	
	local FrameRight = nil
	
	FrameRight = LUI.UIImage.new()
	FrameRight.id = "FrameRight"
	FrameRight:SetRGBFromInt( 6710886, 0 )
	FrameRight:SetAlpha( 0.6, 0 )
	FrameRight:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -12, _1080p * -4, _1080p * 4, _1080p * -4 )
	self:addElement( FrameRight )
	self.FrameRight = FrameRight
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		LineTop:RegisterAnimationSequence( "Idle", {
			{
				function ()
					return self.LineTop:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 10, _1080p * -10, _1080p * -5, _1080p * -3, 0 )
				end,
				function ()
					return self.LineTop:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 118, _1080p * -10, _1080p * -5, _1080p * -3, 500, LUI.EASING.outSine )
				end,
				function ()
					return self.LineTop:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 118, _1080p * -10, _1080p * -5, _1080p * -3, 290 )
				end,
				function ()
					return self.LineTop:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 10, _1080p * -118, _1080p * -5, _1080p * -3, 9 )
				end,
				function ()
					return self.LineTop:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 10, _1080p * -10, _1080p * -5, _1080p * -3, 499, LUI.EASING.outSine )
				end,
				function ()
					return self.LineTop:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 10, _1080p * -10, _1080p * -5, _1080p * -3, 900 )
				end
			}
		} )
		LineBottom:RegisterAnimationSequence( "Idle", {
			{
				function ()
					return self.LineBottom:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 10, _1080p * -10, _1080p * 3, _1080p * 5, 0 )
				end,
				function ()
					return self.LineBottom:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 10, _1080p * -118, _1080p * 3, _1080p * 5, 500, LUI.EASING.outSine )
				end,
				function ()
					return self.LineBottom:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 10, _1080p * -118, _1080p * 3, _1080p * 5, 290 )
				end,
				function ()
					return self.LineBottom:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 118, _1080p * -10, _1080p * 3, _1080p * 5, 9 )
				end,
				function ()
					return self.LineBottom:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 10, _1080p * -10, _1080p * 3, _1080p * 5, 499, LUI.EASING.outSine )
				end,
				function ()
					return self.LineBottom:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 10, _1080p * -10, _1080p * 3, _1080p * 5, 900 )
				end
			}
		} )
		LineRight:RegisterAnimationSequence( "Idle", {
			{
				function ()
					return self.LineRight:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * 3, _1080p * 5, _1080p * 10, _1080p * -10, 0 )
				end,
				function ()
					return self.LineRight:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * 3, _1080p * 5, _1080p * 118, _1080p * -10, 500, LUI.EASING.outSine )
				end,
				function ()
					return self.LineRight:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * 3, _1080p * 5, _1080p * 118, _1080p * -10, 290 )
				end,
				function ()
					return self.LineRight:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * 3, _1080p * 5, _1080p * 10, _1080p * -118, 9 )
				end,
				function ()
					return self.LineRight:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * 3, _1080p * 5, _1080p * 10, _1080p * -10, 499, LUI.EASING.outSine )
				end,
				function ()
					return self.LineRight:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * 3, _1080p * 5, _1080p * 10, _1080p * -10, 900 )
				end
			}
		} )
		LineLeft:RegisterAnimationSequence( "Idle", {
			{
				function ()
					return self.LineLeft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -5, _1080p * -3, _1080p * 10, _1080p * -10, 0 )
				end,
				function ()
					return self.LineLeft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -5, _1080p * -3, _1080p * 10, _1080p * -118, 500, LUI.EASING.outSine )
				end,
				function ()
					return self.LineLeft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -5, _1080p * -3, _1080p * 10, _1080p * -118, 290 )
				end,
				function ()
					return self.LineLeft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -5, _1080p * -3, _1080p * 118, _1080p * -10, 9 )
				end,
				function ()
					return self.LineLeft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -5, _1080p * -3, _1080p * 10, _1080p * -10, 499, LUI.EASING.outSine )
				end,
				function ()
					return self.LineLeft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -5, _1080p * -3, _1080p * 10, _1080p * -10, 900 )
				end
			}
		} )
		self._sequences.Idle = function ()
			LineTop:AnimateLoop( "Idle" )
			LineBottom:AnimateLoop( "Idle" )
			LineRight:AnimateLoop( "Idle" )
			LineLeft:AnimateLoop( "Idle" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	ACTIONS.AnimateSequence( self, "Idle" )
	return self
end

MenuBuilder.registerType( "MissionTeamCursorAnimation", MissionTeamCursorAnimation )
LockTable( _M )
