local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function AccentSideGlow( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 512 * _1080p, 0, 1024 * _1080p )
	self.id = "AccentSideGlow"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local EdgeGlow = nil
	
	EdgeGlow = LUI.UIImage.new()
	EdgeGlow.id = "EdgeGlow"
	EdgeGlow:setImage( RegisterMaterial( "wdg_edge_blur" ), 0 )
	EdgeGlow:SetBlendMode( BLEND_MODE.addWithAlpha )
	self:addElement( EdgeGlow )
	self.EdgeGlow = EdgeGlow
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		EdgeGlow:RegisterAnimationSequence( "Loop", {
			{
				function ()
					return self.EdgeGlow:SetAlpha( 1, 0 )
				end,
				function ()
					return self.EdgeGlow:SetAlpha( 0.9, 30 )
				end,
				function ()
					return self.EdgeGlow:SetAlpha( 1, 30 )
				end
			}
		} )
		self._sequences.Loop = function ()
			EdgeGlow:AnimateLoop( "Loop" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	ACTIONS.AnimateSequence( self, "Loop" )
	return self
end

MenuBuilder.registerType( "AccentSideGlow", AccentSideGlow )
LockTable( _M )
