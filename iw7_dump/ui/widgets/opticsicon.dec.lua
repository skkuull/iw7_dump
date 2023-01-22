local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0 )
	return function ( f2_arg0 )
		if f1_arg0._lastState ~= f2_arg0 then
			f1_arg0._lastState = f2_arg0
			ACTIONS.AnimateSequence( f1_arg0, f2_arg0 )
		end
	end
	
end

function PostLoadFunc( f3_arg0, f3_arg1, f3_arg2 )
	f3_arg0.RunAnimation = f0_local0( f3_arg0 )
end

function OpticsIcon( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 100 * _1080p, 0, 50 * _1080p )
	self.id = "OpticsIcon"
	self._animationSets = {}
	self._sequences = {}
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local OpticsIcon = nil
	
	OpticsIcon = LUI.UIImage.new()
	OpticsIcon.id = "OpticsIcon"
	OpticsIcon:setImage( RegisterMaterial( "icon_slot_optics" ), 0 )
	self:addElement( OpticsIcon )
	self.OpticsIcon = OpticsIcon
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		OpticsIcon:RegisterAnimationSequence( "IconOff", {
			{
				function ()
					return self.OpticsIcon:SetAlpha( 0, 100 )
				end
			}
		} )
		self._sequences.IconOff = function ()
			OpticsIcon:AnimateSequence( "IconOff" )
		end
		
		OpticsIcon:RegisterAnimationSequence( "IconOn", {
			{
				function ()
					return self.OpticsIcon:SetAlpha( 1, 100 )
				end
			}
		} )
		self._sequences.IconOn = function ()
			OpticsIcon:AnimateSequence( "IconOn" )
		end
		
		OpticsIcon:RegisterAnimationSequence( "IconSemiTransparent", {
			{
				function ()
					return self.OpticsIcon:SetAlpha( 0.4, 200 )
				end
			}
		} )
		self._sequences.IconSemiTransparent = function ()
			OpticsIcon:AnimateSequence( "IconSemiTransparent" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "OpticsIcon", OpticsIcon )
LockTable( _M )
