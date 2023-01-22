local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function MissionInfoTab( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 10 * _1080p, 0, 10 * _1080p )
	self.id = "MissionInfoTab"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Fill = nil
	
	Fill = LUI.UIImage.new()
	Fill.id = "Fill"
	Fill:SetAlpha( 0.3, 0 )
	self:addElement( Fill )
	self.Fill = Fill
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Fill:RegisterAnimationSequence( "Focused", {
			{
				function ()
					return self.Fill:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Fill:SetRGBFromTable( SWATCHES.genericButton.highlight, 0 )
				end
			}
		} )
		self._sequences.Focused = function ()
			Fill:AnimateSequence( "Focused" )
		end
		
		Fill:RegisterAnimationSequence( "Unfocused", {
			{
				function ()
					return self.Fill:SetAlpha( 0.3, 0 )
				end
			},
			{
				function ()
					return self.Fill:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		self._sequences.Unfocused = function ()
			Fill:AnimateSequence( "Unfocused" )
		end
		
		Fill:RegisterAnimationSequence( "Highlighted", {
			{
				function ()
					return self.Fill:SetAlpha( 0.65, 0 )
				end
			},
			{
				function ()
					return self.Fill:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		self._sequences.Highlighted = function ()
			Fill:AnimateSequence( "Highlighted" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "scrollbar_pip_highlighted", function ( f13_arg0, f13_arg1 )
		local f13_local0 = f13_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "Focused" )
	end )
	self:addEventHandler( "scrollbar_pip_not_highlighted", function ( f14_arg0, f14_arg1 )
		local f14_local0 = f14_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "Unfocused" )
	end )
	self:addEventHandler( "scrollbar_pip_mouse_over", function ( f15_arg0, f15_arg1 )
		local f15_local0 = f15_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "Highlighted" )
	end )
	self:addEventHandler( "scrollbar_pip_is_not_default", function ( f16_arg0, f16_arg1 )
		local f16_local0 = f16_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "Unfocused" )
	end )
	return self
end

MenuBuilder.registerType( "MissionInfoTab", MissionInfoTab )
LockTable( _M )
