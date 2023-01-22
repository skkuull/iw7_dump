local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ReticleCircleRotateQuad( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 20 * _1080p, 0, 20 * _1080p )
	self.id = "ReticleCircleRotateQuad"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local RingLargeShadow = nil
	
	RingLargeShadow = LUI.UIImage.new()
	RingLargeShadow.id = "RingLargeShadow"
	RingLargeShadow:SetRGBFromTable( SWATCHES.Reticles.DarkContrast, 0 )
	RingLargeShadow:SetAlpha( 0.2, 0 )
	RingLargeShadow:SetScale( 0.05, 0 )
	RingLargeShadow:setImage( RegisterMaterial( "hud_reticle_ring_small_white" ), 0 )
	RingLargeShadow:SetUseAA( true )
	RingLargeShadow:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -7, _1080p * 7, _1080p * -7, _1080p * 7 )
	self:addElement( RingLargeShadow )
	self.RingLargeShadow = RingLargeShadow
	
	local RingLarge = nil
	
	RingLarge = LUI.UIImage.new()
	RingLarge.id = "RingLarge"
	RingLarge:setImage( RegisterMaterial( "hud_reticle_ring_small_white" ), 0 )
	RingLarge:SetUseAA( true )
	RingLarge:SetBlendMode( BLEND_MODE.addWithAlpha )
	RingLarge:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -7, _1080p * 7, _1080p * -7, _1080p * 7 )
	self:addElement( RingLarge )
	self.RingLarge = RingLarge
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		RingLargeShadow:RegisterAnimationSequence( "Rotate", {
			{
				function ()
					return self.RingLargeShadow:SetZRotation( 0, 0 )
				end,
				function ()
					return self.RingLargeShadow:SetZRotation( -90, 3000 )
				end
			}
		} )
		RingLarge:RegisterAnimationSequence( "Rotate", {
			{
				function ()
					return self.RingLarge:SetZRotation( 0, 0 )
				end,
				function ()
					return self.RingLarge:SetZRotation( -90, 3000 )
				end
			}
		} )
		self._sequences.Rotate = function ()
			RingLargeShadow:AnimateLoop( "Rotate" )
			RingLarge:AnimateLoop( "Rotate" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	return self
end

MenuBuilder.registerType( "ReticleCircleRotateQuad", ReticleCircleRotateQuad )
LockTable( _M )
