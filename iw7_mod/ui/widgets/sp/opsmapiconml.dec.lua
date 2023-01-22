local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0 )
	f1_arg0:SetZRotation( 45 )
end

function OpsMapIconML( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1 * _1080p, 0, 1 * _1080p )
	self.id = "OpsMapIconML"
	self._animationSets = {}
	self._sequences = {}
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local Center = nil
	
	Center = LUI.UIImage.new()
	Center.id = "Center"
	Center:SetRGBFromTable( SWATCHES.OpsMap.Mainline, 0 )
	Center:SetUseAA( true )
	Center:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -20, _1080p * 20, _1080p * -20, _1080p * 20 )
	self:addElement( Center )
	self.Center = Center
	
	local Border = nil
	
	Border = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 3,
		borderThicknessRight = _1080p * 3,
		borderThicknessTop = _1080p * 3,
		borderThicknessBottom = _1080p * 3
	} )
	Border.id = "Border"
	Border:SetAlpha( 0.6, 0 )
	Border:SetBorderThicknessLeft( _1080p * 3, 0 )
	Border:SetBorderThicknessRight( _1080p * 3, 0 )
	Border:SetBorderThicknessTop( _1080p * 3, 0 )
	Border:SetBorderThicknessBottom( _1080p * 3, 0 )
	Border:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * 32, _1080p * -32, _1080p * 32 )
	self:addElement( Border )
	self.Border = Border
	
	local Glow = nil
	
	Glow = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 3,
		borderThicknessRight = _1080p * 3,
		borderThicknessTop = _1080p * 3,
		borderThicknessBottom = _1080p * 3
	} )
	Glow.id = "Glow"
	Glow:SetRGBFromTable( SWATCHES.OpsMap.Mainline, 0 )
	Glow:SetAlpha( 0, 0 )
	Glow:SetBorderThicknessLeft( _1080p * 3, 0 )
	Glow:SetBorderThicknessRight( _1080p * 3, 0 )
	Glow:SetBorderThicknessTop( _1080p * 3, 0 )
	Glow:SetBorderThicknessBottom( _1080p * 3, 0 )
	Glow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -64, _1080p * 64, _1080p * -64, _1080p * 64 )
	self:addElement( Glow )
	self.Glow = Glow
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Center:RegisterAnimationSequence( "Animate", {
			{
				function ()
					return self.Center:SetZRotation( 0, 0 )
				end,
				function ()
					return self.Center:SetZRotation( -90, 500, LUI.EASING.inOutQuadratic )
				end,
				function ()
					return self.Center:SetZRotation( -90, 1000 )
				end
			},
			{
				function ()
					return self.Center:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -20, _1080p * 20, _1080p * -20, _1080p * 20, 0 )
				end,
				function ()
					return self.Center:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -24, _1080p * 24, _1080p * -24, _1080p * 24, 500, LUI.EASING.inOutQuadratic )
				end,
				function ()
					return self.Center:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -20, _1080p * 20, _1080p * -20, _1080p * 20, 500, LUI.EASING.inOutCubic )
				end,
				function ()
					return self.Center:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -20, _1080p * 20, _1080p * -20, _1080p * 20, 500 )
				end
			}
		} )
		Border:RegisterAnimationSequence( "Animate", {
			{
				function ()
					return self.Border:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * 32, _1080p * -32, _1080p * 32, 0 )
				end,
				function ()
					return self.Border:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -45, _1080p * 45, _1080p * -45, _1080p * 45, 500, LUI.EASING.inOutQuadratic )
				end,
				function ()
					return self.Border:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * 32, _1080p * -32, _1080p * 32, 500, LUI.EASING.inOutQuadratic )
				end,
				function ()
					return self.Border:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * 32, _1080p * -32, _1080p * 32, 500 )
				end
			}
		} )
		Glow:RegisterAnimationSequence( "Animate", {
			{
				function ()
					return self.Glow:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Glow:SetAlpha( 0, 470 )
				end,
				function ()
					return self.Glow:SetAlpha( 1, 30 )
				end,
				function ()
					return self.Glow:SetAlpha( 0, 700, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.Glow:SetAlpha( 0, 300 )
				end
			},
			{
				function ()
					return self.Glow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -45, _1080p * 45, _1080p * -45, _1080p * 45, 0 )
				end,
				function ()
					return self.Glow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -45, _1080p * 45, _1080p * -45, _1080p * 45, 500 )
				end,
				function ()
					return self.Glow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -55, _1080p * 55, _1080p * -55, _1080p * 55, 799 )
				end,
				function ()
					return self.Glow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -50, _1080p * 50, _1080p * -50, _1080p * 50, 200 )
				end
			}
		} )
		self._sequences.Animate = function ()
			Center:AnimateLoop( "Animate" )
			Border:AnimateLoop( "Animate" )
			Glow:AnimateLoop( "Animate" )
		end
		
		Center:RegisterAnimationSequence( "Completed", {
			{
				function ()
					return self.Center:SetRGBFromInt( 15856113, 0 )
				end
			}
		} )
		self._sequences.Completed = function ()
			Center:AnimateSequence( "Completed" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "OpsMapIconML", OpsMapIconML )
LockTable( _M )
