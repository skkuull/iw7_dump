local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ReticleDoubleBarrelBaseWrapper( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 50 * _1080p, 0, 32 * _1080p )
	self.id = "ReticleDoubleBarrelBaseWrapper"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Left = nil
	
	Left = LUI.UIImage.new()
	Left.id = "Left"
	Left:setImage( RegisterMaterial( "hud_reticle_doublebarrel_ring" ), 0 )
	Left:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -16, _1080p * 16, _1080p * -16, _1080p * 16 )
	self:addElement( Left )
	self.Left = Left
	
	local Right = nil
	
	Right = LUI.UIImage.new()
	Right.id = "Right"
	Right:SetZRotation( 180, 0 )
	Right:setImage( RegisterMaterial( "hud_reticle_doublebarrel_ring" ), 0 )
	Right:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -16, _1080p * 16, _1080p * -16, _1080p * 16 )
	self:addElement( Right )
	self.Right = Right
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Left:RegisterAnimationSequence( "OnFire", {
			{
				function ()
					return self.Left:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -31, _1080p * -9, _1080p * -22, _1080p * 22, 100 )
				end,
				function ()
					return self.Left:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -21, _1080p * 1, _1080p * -22, _1080p * 22, 399, LUI.EASING.inOutBack )
				end
			}
		} )
		Right:RegisterAnimationSequence( "OnFire", {
			{
				function ()
					return self.Right:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * 9, _1080p * 31, _1080p * -22, _1080p * 22, 100 )
				end,
				function ()
					return self.Right:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -1, _1080p * 21, _1080p * -22, _1080p * 22, 399, LUI.EASING.inOutBack )
				end
			}
		} )
		self._sequences.OnFire = function ()
			Left:AnimateSequence( "OnFire" )
			Right:AnimateSequence( "OnFire" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	return self
end

MenuBuilder.registerType( "ReticleDoubleBarrelBaseWrapper", ReticleDoubleBarrelBaseWrapper )
LockTable( _M )
