local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ReticleSpinningDottedCirclePart( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 256 * _1080p, 0, 256 * _1080p )
	self.id = "ReticleSpinningDottedCirclePart"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Ring = nil
	
	Ring = LUI.UIImage.new()
	Ring.id = "Ring"
	Ring:setImage( RegisterMaterial( "hud_reticle_steeldragon_r" ), 0 )
	self:addElement( Ring )
	self.Ring = Ring
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Ring:RegisterAnimationSequence( "Whirlygig", {
			{
				function ()
					return self.Ring:SetZRotation( 0, 0 )
				end,
				function ()
					return self.Ring:SetZRotation( -180, 1000 )
				end
			}
		} )
		self._sequences.Whirlygig = function ()
			Ring:AnimateLoop( "Whirlygig" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	return self
end

MenuBuilder.registerType( "ReticleSpinningDottedCirclePart", ReticleSpinningDottedCirclePart )
LockTable( _M )
