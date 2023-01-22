local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function MK2Gradient( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 295 * _1080p, 0, 185 * _1080p )
	self.id = "MK2Gradient"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetAlpha( 0.25, 0 )
	Background:setImage( RegisterMaterial( "widg_gradient_bottom_to_top_opaque_dark" ), 0 )
	Background:SetBlendMode( BLEND_MODE.addWithAlpha )
	self:addElement( Background )
	self.Background = Background
	
	local Gradient = nil
	
	Gradient = LUI.UIImage.new()
	Gradient.id = "Gradient"
	Gradient:SetAlpha( 0.8, 0 )
	Gradient:setImage( RegisterMaterial( "wdg_ellipse_glow" ), 0 )
	Gradient:SetBlendMode( BLEND_MODE.addWithAlpha )
	self:addElement( Gradient )
	self.Gradient = Gradient
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Gradient:RegisterAnimationSequence( "Loop", {
			{
				function ()
					return self.Gradient:SetAlpha( 0.75, 0 )
				end,
				function ()
					return self.Gradient:SetAlpha( 0.25, 2000 )
				end,
				function ()
					return self.Gradient:SetAlpha( 0.74, 2000 )
				end
			},
			{
				function ()
					return self.Gradient:SetScale( 0, 0 )
				end,
				function ()
					return self.Gradient:SetScale( -0.25, 2000 )
				end,
				function ()
					return self.Gradient:SetScale( 0, 2000 )
				end
			}
		} )
		self._sequences.Loop = function ()
			Gradient:AnimateLoop( "Loop" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	ACTIONS.AnimateSequence( self, "Loop" )
	return self
end

MenuBuilder.registerType( "MK2Gradient", MK2Gradient )
LockTable( _M )
