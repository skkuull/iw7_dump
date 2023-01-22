local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ReticleSteelDragonFramePart( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 256 * _1080p, 0, 256 * _1080p )
	self.id = "ReticleSteelDragonFramePart"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Frame = nil
	
	Frame = LUI.UIImage.new()
	Frame.id = "Frame"
	Frame:setImage( RegisterMaterial( "hud_reticle_steeldragon" ), 0 )
	Frame:SetUseAA( true )
	self:addElement( Frame )
	self.Frame = Frame
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Frame:RegisterAnimationSequence( "Spin", {
			{
				function ()
					return self.Frame:SetZRotation( 0, 0 )
				end,
				function ()
					return self.Frame:SetZRotation( -89, 2990 )
				end,
				function ()
					return self.Frame:SetZRotation( 0, 10 )
				end
			}
		} )
		self._sequences.Spin = function ()
			Frame:AnimateLoop( "Spin" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	return self
end

MenuBuilder.registerType( "ReticleSteelDragonFramePart", ReticleSteelDragonFramePart )
LockTable( _M )
