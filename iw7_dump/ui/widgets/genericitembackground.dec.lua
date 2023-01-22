local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function GenericItemBackground( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 256 * _1080p, 0, 256 * _1080p )
	self.id = "GenericItemBackground"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Image = nil
	
	Image = LUI.UIImage.new()
	Image.id = "Image"
	Image:SetRGBFromInt( 1710618, 0 )
	Image:SetAlpha( 0.5, 0 )
	Image:setImage( RegisterMaterial( "ui_default_white" ), 0 )
	self:addElement( Image )
	self.Image = Image
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Image:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Image:setImage( RegisterMaterial( "widg_gradient_bottom_to_top_opaque_dark" ), 0 )
				end
			},
			{
				function ()
					return self.Image:SetAlpha( 0.7, 0 )
				end
			},
			{
				function ()
					return self.Image:SetRGBFromInt( 1710618, 0 )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			Image:AnimateSequence( "ButtonOver" )
		end
		
		Image:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Image:setImage( RegisterMaterial( "ui_default_white" ), 0 )
				end
			},
			{
				function ()
					return self.Image:SetAlpha( 0.5, 0 )
				end
			},
			{
				function ()
					return self.Image:SetRGBFromInt( 1710618, 0 )
				end
			}
		} )
		self._sequences.ButtonUp = function ()
			Image:AnimateSequence( "ButtonUp" )
		end
		
		Image:RegisterAnimationSequence( "ButtonOverDisabled", {
			{
				function ()
					return self.Image:setImage( RegisterMaterial( "widg_disabled" ), 0 )
				end
			},
			{
				function ()
					return self.Image:SetRGBFromInt( 13421772, 0 )
				end
			},
			{
				function ()
					return self.Image:SetAlpha( 0.8, 0 )
				end
			}
		} )
		self._sequences.ButtonOverDisabled = function ()
			Image:AnimateSequence( "ButtonOverDisabled" )
		end
		
		Image:RegisterAnimationSequence( "ButtonUpDisabled", {
			{
				function ()
					return self.Image:setImage( RegisterMaterial( "widg_disabled" ), 0 )
				end
			},
			{
				function ()
					return self.Image:SetRGBFromInt( 13421772, 0 )
				end
			},
			{
				function ()
					return self.Image:SetAlpha( 0.3, 0 )
				end
			}
		} )
		self._sequences.ButtonUpDisabled = function ()
			Image:AnimateSequence( "ButtonUpDisabled" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "button_over", function ( f20_arg0, f20_arg1 )
		local f20_local0 = f20_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "ButtonOver" )
	end )
	self:addEventHandler( "button_up", function ( f21_arg0, f21_arg1 )
		local f21_local0 = f21_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "ButtonUp" )
	end )
	self:addEventHandler( "button_over_disable", function ( f22_arg0, f22_arg1 )
		local f22_local0 = f22_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "ButtonOverDisabled" )
	end )
	self:addEventHandler( "button_disable", function ( f23_arg0, f23_arg1 )
		local f23_local0 = f23_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "ButtonUpDisabled" )
	end )
	return self
end

MenuBuilder.registerType( "GenericItemBackground", GenericItemBackground )
LockTable( _M )
