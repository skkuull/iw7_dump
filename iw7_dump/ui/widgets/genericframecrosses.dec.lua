local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function GenericFrameCrosses( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 16 * _1080p, 0, 16 * _1080p )
	self.id = "GenericFrameCrosses"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local TopLeftCross = nil
	
	TopLeftCross = LUI.UIImage.new()
	TopLeftCross.id = "TopLeftCross"
	TopLeftCross:setImage( RegisterMaterial( "hud_frame_cross_sm" ), 0 )
	TopLeftCross:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -4, _1080p * 4, _1080p * -4, _1080p * 4 )
	self:addElement( TopLeftCross )
	self.TopLeftCross = TopLeftCross
	
	local TopRightCross = nil
	
	TopRightCross = LUI.UIImage.new()
	TopRightCross.id = "TopRightCross"
	TopRightCross:setImage( RegisterMaterial( "hud_frame_cross_sm" ), 0 )
	TopRightCross:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -4, _1080p * 4, _1080p * -4, _1080p * 4 )
	self:addElement( TopRightCross )
	self.TopRightCross = TopRightCross
	
	local BottomLeftCross = nil
	
	BottomLeftCross = LUI.UIImage.new()
	BottomLeftCross.id = "BottomLeftCross"
	BottomLeftCross:setImage( RegisterMaterial( "hud_frame_cross_sm" ), 0 )
	BottomLeftCross:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * -4, _1080p * 4, _1080p * -4, _1080p * 4 )
	self:addElement( BottomLeftCross )
	self.BottomLeftCross = BottomLeftCross
	
	local BottomRightCross = nil
	
	BottomRightCross = LUI.UIImage.new()
	BottomRightCross.id = "BottomRightCross"
	BottomRightCross:setImage( RegisterMaterial( "hud_frame_cross_sm" ), 0 )
	BottomRightCross:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -4, _1080p * 4, _1080p * -4, _1080p * 4 )
	self:addElement( BottomRightCross )
	self.BottomRightCross = BottomRightCross
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		TopLeftCross:RegisterAnimationSequence( "VisibleIcon", {
			{
				function ()
					return self.TopLeftCross:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.TopLeftCross:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 292, _1080p * 308, _1080p * 59.5, _1080p * 75.5, 0 )
				end,
				function ()
					return self.TopLeftCross:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -8, _1080p * 8, _1080p * -8, _1080p * 8, 300 )
				end
			}
		} )
		TopRightCross:RegisterAnimationSequence( "VisibleIcon", {
			{
				function ()
					return self.TopRightCross:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.TopRightCross:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 292, _1080p * 308, _1080p * 59.5, _1080p * 75.5, 0 )
				end,
				function ()
					return self.TopRightCross:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 592, _1080p * 608, _1080p * -8, _1080p * 8, 300 )
				end
			}
		} )
		BottomLeftCross:RegisterAnimationSequence( "VisibleIcon", {
			{
				function ()
					return self.BottomLeftCross:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.BottomLeftCross:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 292, _1080p * 308, _1080p * 59.5, _1080p * 75.5, 0 )
				end,
				function ()
					return self.BottomLeftCross:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -8, _1080p * 8, _1080p * 127, _1080p * 143, 300 )
				end
			}
		} )
		BottomRightCross:RegisterAnimationSequence( "VisibleIcon", {
			{
				function ()
					return self.BottomRightCross:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.BottomRightCross:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 292, _1080p * 308, _1080p * 59.5, _1080p * 75.5, 0 )
				end,
				function ()
					return self.BottomRightCross:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 592, _1080p * 608, _1080p * 127, _1080p * 143, 300 )
				end
			}
		} )
		self._sequences.VisibleIcon = function ()
			TopLeftCross:AnimateSequence( "VisibleIcon" )
			TopRightCross:AnimateSequence( "VisibleIcon" )
			BottomLeftCross:AnimateSequence( "VisibleIcon" )
			BottomRightCross:AnimateSequence( "VisibleIcon" )
		end
		
		TopLeftCross:RegisterAnimationSequence( "VisibleNoIcon", {
			{
				function ()
					return self.TopLeftCross:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.TopLeftCross:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 292, _1080p * 308, _1080p * 59.5, _1080p * 75.5, 0 )
				end,
				function ()
					return self.TopLeftCross:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -8, _1080p * 8, _1080p * -8, _1080p * 8, 300 )
				end
			}
		} )
		TopRightCross:RegisterAnimationSequence( "VisibleNoIcon", {
			{
				function ()
					return self.TopRightCross:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.TopRightCross:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 292, _1080p * 308, _1080p * 59.5, _1080p * 75.5, 0 )
				end,
				function ()
					return self.TopRightCross:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 592, _1080p * 608, _1080p * -8, _1080p * 8, 300 )
				end
			}
		} )
		BottomLeftCross:RegisterAnimationSequence( "VisibleNoIcon", {
			{
				function ()
					return self.BottomLeftCross:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.BottomLeftCross:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 292, _1080p * 308, _1080p * 59.5, _1080p * 75.5, 0 )
				end,
				function ()
					return self.BottomLeftCross:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -8, _1080p * 8, _1080p * 127, _1080p * 143, 300 )
				end
			}
		} )
		BottomRightCross:RegisterAnimationSequence( "VisibleNoIcon", {
			{
				function ()
					return self.BottomRightCross:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.BottomRightCross:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 292, _1080p * 308, _1080p * 59.5, _1080p * 75.5, 0 )
				end,
				function ()
					return self.BottomRightCross:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 592, _1080p * 608, _1080p * 127, _1080p * 143, 300 )
				end
			}
		} )
		self._sequences.VisibleNoIcon = function ()
			TopLeftCross:AnimateSequence( "VisibleNoIcon" )
			TopRightCross:AnimateSequence( "VisibleNoIcon" )
			BottomLeftCross:AnimateSequence( "VisibleNoIcon" )
			BottomRightCross:AnimateSequence( "VisibleNoIcon" )
		end
		
		TopLeftCross:RegisterAnimationSequence( "Hidden", {
			{
				function ()
					return self.TopLeftCross:SetAlpha( 0, 300 )
				end
			},
			{
				function ()
					return self.TopLeftCross:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 292, _1080p * 308, _1080p * 60, _1080p * 76, 200 )
				end
			}
		} )
		TopRightCross:RegisterAnimationSequence( "Hidden", {
			{
				function ()
					return self.TopRightCross:SetAlpha( 0, 300 )
				end
			},
			{
				function ()
					return self.TopRightCross:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 292, _1080p * 308, _1080p * 60, _1080p * 76, 200 )
				end
			}
		} )
		BottomLeftCross:RegisterAnimationSequence( "Hidden", {
			{
				function ()
					return self.BottomLeftCross:SetAlpha( 0, 300 )
				end
			},
			{
				function ()
					return self.BottomLeftCross:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 292, _1080p * 308, _1080p * 60, _1080p * 76, 200 )
				end
			}
		} )
		BottomRightCross:RegisterAnimationSequence( "Hidden", {
			{
				function ()
					return self.BottomRightCross:SetAlpha( 0, 300 )
				end
			},
			{
				function ()
					return self.BottomRightCross:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 292, _1080p * 308, _1080p * 60, _1080p * 76, 200 )
				end
			}
		} )
		self._sequences.Hidden = function ()
			TopLeftCross:AnimateSequence( "Hidden" )
			TopRightCross:AnimateSequence( "Hidden" )
			BottomLeftCross:AnimateSequence( "Hidden" )
			BottomRightCross:AnimateSequence( "Hidden" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	return self
end

MenuBuilder.registerType( "GenericFrameCrosses", GenericFrameCrosses )
LockTable( _M )
