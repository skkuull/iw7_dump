local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1 )
	if f1_arg0.currentState == "over" then
		return 
	end
	f1_arg0.currentState = "over"
	ACTIONS.AnimateSequence( f1_arg0, "Pulse" )
	f1_arg0.Arrow:SetLeft( _1080p * -2, 0 )
	f1_arg0.Arrow:SetLeft( _1080p * 1, 150 )
	f1_arg0.Arrow:SetRight( _1080p * 14, 0 )
	f1_arg0.Arrow:SetRight( _1080p * 17, 150 )
	f1_arg0.Arrow:SetAlpha( 1 )
	f1_arg0.ArrowShadow:SetLeft( _1080p * 1, 0 )
	f1_arg0.ArrowShadow:SetLeft( _1080p * 4, 150 )
	f1_arg0.ArrowShadow:SetRight( _1080p * 17, 0 )
	f1_arg0.ArrowShadow:SetRight( _1080p * 20, 150 )
	f1_arg0.ArrowShadow:SetAlpha( 0.4 )
	f1_arg0.HighlightLeft:SetAlpha( 1 )
	f1_arg0.HighlightShadow:SetAlpha( 0.4 )
	f1_arg0.HighlightLeft:SetTopAnchor( 0, 150, LUI.EASING.inQuadratic )
	f1_arg0.HighlightLeft:SetBottomAnchor( 0, 150, LUI.EASING.inQuadratic )
	f1_arg0.HighlightShadow:SetTopAnchor( 0, 150, LUI.EASING.inQuadratic )
	f1_arg0.HighlightShadow:SetBottomAnchor( 0, 150, LUI.EASING.inQuadratic )
	if CONDITIONS.IsThirdGameMode( f1_arg0 ) then
		f1_arg0.HighlightRight:SetAlpha( 1 )
		f1_arg0.HighlightRight:SetTopAnchor( 0, 150, LUI.EASING.inQuadratic )
		f1_arg0.HighlightRight:SetBottomAnchor( 0, 150, LUI.EASING.inQuadratic )
	end
end

f0_local1 = function ( f2_arg0, f2_arg1 )
	if f2_arg0.currentState == "up" then
		return 
	end
	f2_arg0.currentState = "up"
	ACTIONS.AnimateSequence( f2_arg0, "PulseStop" )
	f2_arg0.Arrow:SetLeft( _1080p * 0, 0 )
	f2_arg0.Arrow:SetLeft( _1080p * -2, 150 )
	f2_arg0.Arrow:SetRight( _1080p * 17, 0 )
	f2_arg0.Arrow:SetRight( _1080p * 14, 150 )
	f2_arg0.ArrowShadow:SetLeft( _1080p * 4, 0 )
	f2_arg0.ArrowShadow:SetLeft( _1080p * 1, 150 )
	f2_arg0.ArrowShadow:SetRight( _1080p * 20, 0 )
	f2_arg0.ArrowShadow:SetRight( _1080p * 17, 150 )
	f2_arg0.GradientLeft:SetAlpha( 0 )
	local f2_local0 = f2_arg0.HighlightLeft:SetTopAnchor( 0.5, 150, LUI.EASING.inQuadratic )
	f2_local0.onComplete = function ()
		f2_arg0.Arrow:SetAlpha( 0 )
		f2_arg0.ArrowShadow:SetAlpha( 0 )
		f2_arg0.HighlightLeft:SetAlpha( 0 )
		if CONDITIONS.IsThirdGameMode( f2_arg0 ) then
			f2_arg0.HighlightRight:SetAlpha( 0 )
		end
	end
	
	f2_arg0.HighlightLeft:SetBottomAnchor( 0.5, 150, LUI.EASING.inQuadratic )
	f2_arg0.HighlightShadow:SetTopAnchor( 0.5, 150, LUI.EASING.inQuadratic )
	f2_arg0.HighlightShadow:SetBottomAnchor( 0.5, 150, LUI.EASING.inQuadratic )
	if CONDITIONS.IsThirdGameMode( f2_arg0 ) then
		f2_arg0.GradientRightCP:SetAlpha( 0 )
		f2_arg0.HighlightRight:SetTopAnchor( 0.5, 150, LUI.EASING.inQuadratic )
		f2_arg0.HighlightRight:SetBottomAnchor( 0.5, 150, LUI.EASING.inQuadratic )
	end
end

function PostLoadFunc( f4_arg0, f4_arg1, f4_arg2 )
	assert( f4_arg0.Arrow )
	assert( f4_arg0.ArrowShadow )
	assert( f4_arg0.HighlightLeft )
	assert( f4_arg0.HighlightShadow )
	assert( f4_arg0.GradientLeft )
	if CONDITIONS.IsThirdGameMode( f4_arg0 ) then
		assert( f4_arg0.HighlightRight )
		assert( f4_arg0.GradientRightCP )
	end
	f4_arg0.currentState = "up"
	f4_arg0:addEventHandler( "button_over", f0_local0 )
	f4_arg0:addEventHandler( "button_over_disable", f0_local0 )
	f4_arg0:addEventHandler( "button_up", f0_local1 )
	f4_arg0:addEventHandler( "button_disable", f0_local1 )
end

function GenericButtonSelection( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 50 * _1080p, 0, 50 * _1080p )
	self.id = "GenericButtonSelection"
	self._animationSets = {}
	self._sequences = {}
	local f5_local1 = controller and controller.controllerIndex
	if not f5_local1 and not Engine.InFrontend() then
		f5_local1 = self:getRootController()
	end
	assert( f5_local1 )
	local f5_local2 = self
	local f5_local3 = nil
	if CONDITIONS.IsThirdGameMode( self ) then
		f5_local3 = LUI.UIImage.new()
		f5_local3.id = "GradientRightCP"
		f5_local3:SetRGBFromInt( 12080170, 0 )
		f5_local3:SetAlpha( 0, 0 )
		f5_local3:setImage( RegisterMaterial( "widg_gradient_left_to_right" ), 0 )
		f5_local3:SetBlendMode( BLEND_MODE.addWithAlpha )
		f5_local3:SetAnchorsAndPosition( 1, 0, 0, 0, 0, _1080p * -15, 0, 0 )
		self:addElement( f5_local3 )
		self.GradientRightCP = f5_local3
	end
	local GradientLeft = nil
	
	GradientLeft = LUI.UIImage.new()
	GradientLeft.id = "GradientLeft"
	GradientLeft:SetRGBFromInt( 12080170, 0 )
	GradientLeft:SetAlpha( 0, 0 )
	GradientLeft:setImage( RegisterMaterial( "widg_gradient_left_to_right" ), 0 )
	GradientLeft:SetBlendMode( BLEND_MODE.addWithAlpha )
	GradientLeft:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 15, 0, 0 )
	self:addElement( GradientLeft )
	self.GradientLeft = GradientLeft
	
	local ArrowShadow = nil
	
	ArrowShadow = LUI.UIImage.new()
	ArrowShadow.id = "ArrowShadow"
	ArrowShadow:SetRGBFromInt( 13398272, 0 )
	ArrowShadow:SetAlpha( 0, 0 )
	ArrowShadow:SetZRotation( 90, 0 )
	ArrowShadow:setImage( RegisterMaterial( "hud_arrow" ), 0 )
	ArrowShadow:SetBlendMode( BLEND_MODE.blend )
	ArrowShadow:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 2, _1080p * 18, _1080p * -5.5, _1080p * 5.5 )
	self:addElement( ArrowShadow )
	self.ArrowShadow = ArrowShadow
	
	local HighlightShadow = nil
	
	HighlightShadow = LUI.UIImage.new()
	HighlightShadow.id = "HighlightShadow"
	HighlightShadow:SetRGBFromInt( 13398272, 0 )
	HighlightShadow:SetAlpha( 0, 0 )
	HighlightShadow:SetBlendMode( BLEND_MODE.blend )
	HighlightShadow:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 3, _1080p * 9, 0, 0 )
	self:addElement( HighlightShadow )
	self.HighlightShadow = HighlightShadow
	
	local Arrow = nil
	
	Arrow = LUI.UIImage.new()
	Arrow.id = "Arrow"
	Arrow:SetRGBFromInt( 16767586, 0 )
	Arrow:SetAlpha( 0, 0 )
	Arrow:SetZRotation( 90, 0 )
	Arrow:setImage( RegisterMaterial( "hud_arrow" ), 0 )
	Arrow:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -1, _1080p * 15, _1080p * -5.5, _1080p * 5.5 )
	self:addElement( Arrow )
	self.Arrow = Arrow
	
	local HighlightLeft = nil
	
	HighlightLeft = LUI.UIImage.new()
	HighlightLeft.id = "HighlightLeft"
	HighlightLeft:SetRGBFromInt( 16767586, 0 )
	HighlightLeft:SetAlpha( 0, 0 )
	HighlightLeft:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, 0, _1080p * 6, 0, 0 )
	self:addElement( HighlightLeft )
	self.HighlightLeft = HighlightLeft
	
	local f5_local9 = nil
	if CONDITIONS.IsThirdGameMode( self ) then
		f5_local9 = LUI.UIImage.new()
		f5_local9.id = "HighlightRight"
		f5_local9:SetRGBFromTable( SWATCHES.Zombies.menuHeader, 0 )
		f5_local9:SetAlpha( 0, 0 )
		f5_local9:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -5, 0, 0, 0 )
		self:addElement( f5_local9 )
		self.HighlightRight = f5_local9
	end
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		GradientLeft:RegisterAnimationSequence( "Pulse", {
			{
				function ()
					return self.GradientLeft:SetAlpha( 0.2, 200 )
				end,
				function ()
					return self.GradientLeft:SetAlpha( 0.4, 1000, LUI.EASING.outSine )
				end,
				function ()
					return self.GradientLeft:SetAlpha( 0.15, 1200, LUI.EASING.inSine )
				end
			},
			{
				function ()
					return self.GradientLeft:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 20, 0, 0, 200 )
				end,
				function ()
					return self.GradientLeft:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 25, 0, 0, 1000, LUI.EASING.outSine )
				end,
				function ()
					return self.GradientLeft:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 25, 0, 0, 199 )
				end,
				function ()
					return self.GradientLeft:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 20, 0, 0, 1000, LUI.EASING.inSine )
				end
			}
		} )
		self._sequences.Pulse = function ()
			GradientLeft:AnimateLoop( "Pulse" )
		end
		
		GradientLeft:RegisterAnimationSequence( "PulseStop", {
			{
				function ()
					return self.GradientLeft:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.GradientLeft:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 15, 0, 0, 0 )
				end
			}
		} )
		self._sequences.PulseStop = function ()
			GradientLeft:AnimateSequence( "PulseStop" )
		end
		
	end
	
	self._animationSets.ThirdGameMode = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		if CONDITIONS.IsThirdGameMode( self ) then
			f5_local3:RegisterAnimationSequence( "Pulse", {
				{
					function ()
						return self.GradientRightCP:SetRGBFromTable( SWATCHES.Zombies.menuHeader, 0 )
					end
				},
				{
					function ()
						return self.GradientRightCP:SetAlpha( 0.15, 200 )
					end,
					function ()
						return self.GradientRightCP:SetAlpha( 0.3, 1000, LUI.EASING.inQuadratic )
					end,
					function ()
						return self.GradientRightCP:SetAlpha( 0.3, 200 )
					end,
					function ()
						return self.GradientRightCP:SetAlpha( 0.15, 1000, LUI.EASING.outQuadratic )
					end
				},
				{
					function ()
						return self.GradientRightCP:SetAnchorsAndPosition( 1, 0, 0, 0, 0, _1080p * -15, 0, 0, 200 )
					end,
					function ()
						return self.GradientRightCP:SetAnchorsAndPosition( 1, 0, 0, 0, 0, _1080p * -20, 0, 0, 1000, LUI.EASING.inQuadratic )
					end,
					function ()
						return self.GradientRightCP:SetAnchorsAndPosition( 1, 0, 0, 0, 0, _1080p * -20, 0, 0, 199 )
					end,
					function ()
						return self.GradientRightCP:SetAnchorsAndPosition( 1, 0, 0, 0, 0, _1080p * -15, 0, 0, 1000, LUI.EASING.outQuadratic )
					end
				}
			} )
		end
		GradientLeft:RegisterAnimationSequence( "Pulse", {
			{
				function ()
					return self.GradientLeft:SetRGBFromTable( SWATCHES.Zombies.menuHeader, 0 )
				end
			},
			{
				function ()
					return self.GradientLeft:SetAlpha( 0.15, 200 )
				end,
				function ()
					return self.GradientLeft:SetAlpha( 0.4, 1000, LUI.EASING.inQuadratic )
				end,
				function ()
					return self.GradientLeft:SetAlpha( 0.4, 200 )
				end,
				function ()
					return self.GradientLeft:SetAlpha( 0.15, 1000, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.GradientLeft:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 15, 0, 0, 200 )
				end,
				function ()
					return self.GradientLeft:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 20, 0, 0, 1000, LUI.EASING.inQuadratic )
				end,
				function ()
					return self.GradientLeft:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 20, 0, 0, 199 )
				end,
				function ()
					return self.GradientLeft:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 15, 0, 0, 1000, LUI.EASING.outQuadratic )
				end
			}
		} )
		HighlightShadow:RegisterAnimationSequence( "Pulse", {
			{
				function ()
					return self.HighlightShadow:SetRGBFromTable( SWATCHES.Zombies.menuHeader, 0 )
				end
			}
		} )
		Arrow:RegisterAnimationSequence( "Pulse", {
			{
				function ()
					return self.Arrow:SetRGBFromTable( SWATCHES.Zombies.menuHeader, 0 )
				end
			}
		} )
		HighlightLeft:RegisterAnimationSequence( "Pulse", {
			{
				function ()
					return self.HighlightLeft:SetRGBFromTable( SWATCHES.Zombies.menuHeader, 0 )
				end
			}
		} )
		self._sequences.Pulse = function ()
			if CONDITIONS.IsThirdGameMode( self ) then
				f5_local3:AnimateLoop( "Pulse" )
			end
			GradientLeft:AnimateLoop( "Pulse" )
			HighlightShadow:AnimateLoop( "Pulse" )
			Arrow:AnimateLoop( "Pulse" )
			HighlightLeft:AnimateLoop( "Pulse" )
		end
		
		if CONDITIONS.IsThirdGameMode( self ) then
			f5_local3:RegisterAnimationSequence( "PulseStop", {
				{
					function ()
						return self.GradientRightCP:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		GradientLeft:RegisterAnimationSequence( "PulseStop", {
			{
				function ()
					return self.GradientLeft:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.GradientLeft:SetRGBFromInt( 14042667, 0 )
				end
			},
			{
				function ()
					return self.GradientLeft:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 15, 0, 0, 0 )
				end
			}
		} )
		HighlightShadow:RegisterAnimationSequence( "PulseStop", {
			{
				function ()
					return self.HighlightShadow:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 6, 0, 0, 0 )
				end
			}
		} )
		Arrow:RegisterAnimationSequence( "PulseStop", {
			{
				function ()
					return self.Arrow:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -4, _1080p * 12, _1080p * -5.5, _1080p * 5.5, 0 )
				end
			}
		} )
		self._sequences.PulseStop = function ()
			if CONDITIONS.IsThirdGameMode( self ) then
				f5_local3:AnimateSequence( "PulseStop" )
			end
			GradientLeft:AnimateSequence( "PulseStop" )
			HighlightShadow:AnimateSequence( "PulseStop" )
			Arrow:AnimateSequence( "PulseStop" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f5_local1, controller )
	if CONDITIONS.IsThirdGameModeDesired( self ) then
		ACTIONS.SetAnimationSet( self, "ThirdGameMode" )
		ACTIONS.AnimateSequence( self, "PulseStop" )
	end
	return self
end

MenuBuilder.registerType( "GenericButtonSelection", GenericButtonSelection )
LockTable( _M )
