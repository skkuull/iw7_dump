local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function MapVoteButtonBackground( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 504 * _1080p, 0, 80 * _1080p )
	self.id = "MapVoteButtonBackground"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Dropshadow = nil
	
	Dropshadow = MenuBuilder.BuildRegisteredType( "GenericBackgroundGlow", {
		controllerIndex = f1_local1
	} )
	Dropshadow.id = "Dropshadow"
	Dropshadow:SetRGBFromTable( SWATCHES.genericButton.backgroundFocus, 0 )
	Dropshadow:SetAlpha( 0, 0 )
	Dropshadow:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -3, _1080p * -4, 0, _1080p * 6 )
	self:addElement( Dropshadow )
	self.Dropshadow = Dropshadow
	
	local MapBackground = nil
	
	MapBackground = LUI.UIImage.new()
	MapBackground.id = "MapBackground"
	MapBackground:SetVMax( 0.5, 0 )
	MapBackground:SetAnchorsAndPosition( 0, 0, 0, 0, 0, _1080p * -4, 0, 0 )
	self:addElement( MapBackground )
	self.MapBackground = MapBackground
	
	local GamepadIcon = nil
	
	GamepadIcon = LUI.UIImage.new()
	GamepadIcon.id = "GamepadIcon"
	GamepadIcon:SetAlpha( 0, 0 )
	GamepadIcon:setImage( RegisterMaterial( "button_primary" ), 0 )
	GamepadIcon:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -42, _1080p * -10, _1080p * -16, _1080p * 16 )
	self:addElement( GamepadIcon )
	self.GamepadIcon = GamepadIcon
	
	local GradientTopDown = nil
	
	GradientTopDown = LUI.UIImage.new()
	GradientTopDown.id = "GradientTopDown"
	GradientTopDown:SetRGBFromInt( 0, 0 )
	GradientTopDown:SetAlpha( 0.2, 0 )
	GradientTopDown:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
	GradientTopDown:SetAnchorsAndPosition( 0, 0, 0, 0, 0, _1080p * -4, 0, 0 )
	self:addElement( GradientTopDown )
	self.GradientTopDown = GradientTopDown
	
	local GenericButtonSelection = nil
	
	GenericButtonSelection = MenuBuilder.BuildRegisteredType( "GenericButtonSelection", {
		controllerIndex = f1_local1
	} )
	GenericButtonSelection.id = "GenericButtonSelection"
	GenericButtonSelection:SetAnchorsAndPosition( 0, 0, 0, 1, 0, _1080p * -4, 0, _1080p * 80 )
	self:addElement( GenericButtonSelection )
	self.GenericButtonSelection = GenericButtonSelection
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		MapBackground:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.MapBackground:SetAnchorsAndPosition( 0, 0, 0, 0, 0, _1080p * -4, 0, 0, 0 )
				end,
				function ()
					return self.MapBackground:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -104, _1080p * -4, _1080p * -8, _1080p * 8, 150, LUI.EASING.outCubic )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			MapBackground:AnimateSequence( "ButtonOver" )
		end
		
		MapBackground:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.MapBackground:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -104, _1080p * -4, _1080p * -8, _1080p * 8, 0 )
				end,
				function ()
					return self.MapBackground:SetAnchorsAndPosition( 0, 0, 0, 0, 0, _1080p * -4, 0, 0, 100, LUI.EASING.outQuadratic )
				end
			}
		} )
		self._sequences.ButtonUp = function ()
			MapBackground:AnimateSequence( "ButtonUp" )
		end
		
		GamepadIcon:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.GamepadIcon:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Locked = function ()
			GamepadIcon:AnimateSequence( "Locked" )
		end
		
		self._sequences.ButtonOverDisabled = function ()
			
		end
		
		self._sequences.ButtonUpDisabled = function ()
			
		end
		
		self._sequences.ButtonSelected = function ()
			
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "button_over", function ( f15_arg0, f15_arg1 )
		local f15_local0 = f15_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "ButtonOver" )
	end )
	self:addEventHandler( "button_up", function ( f16_arg0, f16_arg1 )
		local f16_local0 = f16_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "ButtonUp" )
	end )
	self:addEventHandler( "button_disable", function ( f17_arg0, f17_arg1 )
		local f17_local0 = f17_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "ButtonUpDisabled" )
	end )
	self:addEventHandler( "button_over_disable", function ( f18_arg0, f18_arg1 )
		local f18_local0 = f18_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "ButtonOverDisabled" )
	end )
	return self
end

MenuBuilder.registerType( "MapVoteButtonBackground", MapVoteButtonBackground )
LockTable( _M )
