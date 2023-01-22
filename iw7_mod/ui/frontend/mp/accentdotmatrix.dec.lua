local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function AccentDotMatrix( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 128 * _1080p, 0, 32 * _1080p )
	self.id = "AccentDotMatrix"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local AccentDotMatrix = nil
	
	AccentDotMatrix = LUI.UIImage.new()
	AccentDotMatrix.id = "AccentDotMatrix"
	AccentDotMatrix:setImage( RegisterMaterial( "wdg_dot_matrix" ), 0 )
	self:addElement( AccentDotMatrix )
	self.AccentDotMatrix = AccentDotMatrix
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		AccentDotMatrix:RegisterAnimationSequence( "Loop", {
			{
				function ()
					return self.AccentDotMatrix:SetAlpha( 1, 0 )
				end,
				function ()
					return self.AccentDotMatrix:SetAlpha( 0, 30 )
				end,
				function ()
					return self.AccentDotMatrix:SetAlpha( 1, 30 )
				end
			}
		} )
		self._sequences.Loop = function ()
			AccentDotMatrix:AnimateLoop( "Loop" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	ACTIONS.AnimateSequence( self, "Loop" )
	return self
end

MenuBuilder.registerType( "AccentDotMatrix", AccentDotMatrix )
LockTable( _M )
