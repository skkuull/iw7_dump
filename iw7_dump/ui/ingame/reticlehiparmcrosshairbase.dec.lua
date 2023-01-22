local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ReticleHipArmCrosshairBase( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 128 * _1080p, 0, 128 * _1080p )
	self.id = "ReticleHipArmCrosshairBase"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local TickCopy1 = nil
	
	TickCopy1 = LUI.UIImage.new()
	TickCopy1.id = "TickCopy1"
	TickCopy1:SetZRotation( 90, 0 )
	TickCopy1:setImage( RegisterMaterial( "hud_reticle_hip_tic" ), 0 )
	TickCopy1:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * 10, _1080p * 14, _1080p * -8, _1080p * 8 )
	self:addElement( TickCopy1 )
	self.TickCopy1 = TickCopy1
	
	local TickCopy2 = nil
	
	TickCopy2 = LUI.UIImage.new()
	TickCopy2.id = "TickCopy2"
	TickCopy2:SetZRotation( 90, 0 )
	TickCopy2:setImage( RegisterMaterial( "hud_reticle_hip_tic" ), 0 )
	TickCopy2:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -14, _1080p * -10, _1080p * -8, _1080p * 8 )
	self:addElement( TickCopy2 )
	self.TickCopy2 = TickCopy2
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		TickCopy1:RegisterAnimationSequence( "OnFire", {
			{
				function ()
					return self.TickCopy1:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * 18, _1080p * 22, _1080p * -8, _1080p * 8, 0 )
				end,
				function ()
					return self.TickCopy1:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * 10, _1080p * 14, _1080p * -8, _1080p * 8, 100 )
				end
			}
		} )
		TickCopy2:RegisterAnimationSequence( "OnFire", {
			{
				function ()
					return self.TickCopy2:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -22, _1080p * -18, _1080p * -8, _1080p * 8, 0 )
				end,
				function ()
					return self.TickCopy2:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -14, _1080p * -10, _1080p * -8, _1080p * 8, 100 )
				end
			}
		} )
		self._sequences.OnFire = function ()
			TickCopy1:AnimateSequence( "OnFire" )
			TickCopy2:AnimateSequence( "OnFire" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	return self
end

MenuBuilder.registerType( "ReticleHipArmCrosshairBase", ReticleHipArmCrosshairBase )
LockTable( _M )
