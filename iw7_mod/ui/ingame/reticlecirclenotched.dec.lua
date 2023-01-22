local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ReticleCircleNotched( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 256 * _1080p, 0, 256 * _1080p )
	self.id = "ReticleCircleNotched"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local outerCircle = nil
	
	outerCircle = LUI.UIImage.new()
	outerCircle.id = "outerCircle"
	outerCircle:setImage( RegisterMaterial( "hud_reticle_circle_ring_notched" ), 0 )
	self:addElement( outerCircle )
	self.outerCircle = outerCircle
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		outerCircle:RegisterAnimationSequence( "Rotate", {
			{
				function ()
					return self.outerCircle:SetZRotation( 0, 0 )
				end,
				function ()
					return self.outerCircle:SetZRotation( 60, 5000 )
				end
			}
		} )
		self._sequences.Rotate = function ()
			outerCircle:AnimateLoop( "Rotate" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	ACTIONS.AnimateSequence( self, "Rotate" )
	return self
end

MenuBuilder.registerType( "ReticleCircleNotched", ReticleCircleNotched )
LockTable( _M )
