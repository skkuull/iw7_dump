local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function RefreshAnimation( f1_arg0, f1_arg1 )
	if f1_arg0._lastState ~= f1_arg1 then
		f1_arg0._lastState = f1_arg1
		ACTIONS.AnimateSequence( f1_arg0, f1_arg1 )
	end
end

function PostLoadFunc( f2_arg0, f2_arg1, f2_arg2 )
	f2_arg0:addEventHandler( "button_over", function ( f3_arg0, f3_arg1 )
		RefreshAnimation( f3_arg0, "ButtonOver" )
	end )
	f2_arg0:addEventHandler( "button_up", function ( f4_arg0, f4_arg1 )
		RefreshAnimation( f4_arg0, "ButtonUp" )
	end )
	f2_arg0:addEventHandler( "button_disable", function ( f5_arg0, f5_arg1 )
		RefreshAnimation( f5_arg0, "Disabled" )
	end )
	f2_arg0:addEventHandler( "button_over_disable", function ( f6_arg0, f6_arg1 )
		RefreshAnimation( f6_arg0, "Disabled" )
	end )
end

function GenericButtonBlurBackground( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 50 * _1080p, 0, 50 * _1080p )
	self.id = "GenericButtonBlurBackground"
	self._animationSets = {}
	self._sequences = {}
	local f7_local1 = controller and controller.controllerIndex
	if not f7_local1 and not Engine.InFrontend() then
		f7_local1 = self:getRootController()
	end
	assert( f7_local1 )
	local f7_local2 = self
	local BlurBackground = nil
	
	BlurBackground = LUI.UIBlur.new()
	BlurBackground.id = "BlurBackground"
	BlurBackground:SetRGBFromInt( 15132390, 0 )
	BlurBackground:setImage( RegisterMaterial( "ui_default_white" ), 0 )
	BlurBackground:SetBlurStrength( 2.75, 0 )
	self:addElement( BlurBackground )
	self.BlurBackground = BlurBackground
	
	local Gradient = nil
	
	Gradient = LUI.UIImage.new()
	Gradient.id = "Gradient"
	Gradient:SetRGBFromInt( 0, 0 )
	Gradient:SetAlpha( 0.2, 0 )
	Gradient:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
	self:addElement( Gradient )
	self.Gradient = Gradient
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		BlurBackground:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.BlurBackground:SetRGBFromInt( 6710886, 100 )
				end
			},
			{
				function ()
					return self.BlurBackground:SetAlpha( 1, 100 )
				end
			}
		} )
		Gradient:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Gradient:SetRGBFromInt( 0, 100 )
				end
			},
			{
				function ()
					return self.Gradient:SetAlpha( 0.85, 100 )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			BlurBackground:AnimateSequence( "ButtonOver" )
			Gradient:AnimateSequence( "ButtonOver" )
		end
		
		BlurBackground:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.BlurBackground:SetRGBFromInt( 15132390, 200 )
				end
			},
			{
				function ()
					return self.BlurBackground:SetAlpha( 1, 200 )
				end
			},
			{
				function ()
					return self.BlurBackground:SetBlurStrength( 2.75, 200 )
				end
			}
		} )
		Gradient:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Gradient:SetRGBFromInt( 0, 200 )
				end
			},
			{
				function ()
					return self.Gradient:SetAlpha( 0.2, 200 )
				end
			}
		} )
		self._sequences.ButtonUp = function ()
			BlurBackground:AnimateSequence( "ButtonUp" )
			Gradient:AnimateSequence( "ButtonUp" )
		end
		
		BlurBackground:RegisterAnimationSequence( "Disabled", {
			{
				function ()
					return self.BlurBackground:SetRGBFromInt( 5066061, 100 )
				end
			},
			{
				function ()
					return self.BlurBackground:SetAlpha( 0.5, 100 )
				end
			}
		} )
		Gradient:RegisterAnimationSequence( "Disabled", {
			{
				function ()
					return self.Gradient:SetAlpha( 0.4, 100 )
				end
			},
			{
				function ()
					return self.Gradient:SetRGBFromInt( 0, 100 )
				end
			}
		} )
		self._sequences.Disabled = function ()
			BlurBackground:AnimateSequence( "Disabled" )
			Gradient:AnimateSequence( "Disabled" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f7_local1, controller )
	return self
end

MenuBuilder.registerType( "GenericButtonBlurBackground", GenericButtonBlurBackground )
LockTable( _M )
