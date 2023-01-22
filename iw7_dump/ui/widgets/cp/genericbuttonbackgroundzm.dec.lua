local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function GenericButtonBackgroundZm( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 300 * _1080p, 0, 50 * _1080p )
	self.id = "GenericButtonBackgroundZm"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromTable( SWATCHES.genericButton.background, 0 )
	Background:SetAlpha( 0.25, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local GamepadIcon = nil
	
	GamepadIcon = LUI.UIImage.new()
	GamepadIcon.id = "GamepadIcon"
	GamepadIcon:SetAlpha( 0, 0 )
	GamepadIcon:setImage( RegisterMaterial( "button_primary" ), 0 )
	GamepadIcon:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -42, _1080p * -10, _1080p * -16, _1080p * 16 )
	self:addElement( GamepadIcon )
	self.GamepadIcon = GamepadIcon
	
	local Border = nil
	
	Border = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	} )
	Border.id = "Border"
	Border:SetAlpha( 0, 0 )
	self:addElement( Border )
	self.Border = Border
	
	local CornerNodes = nil
	
	CornerNodes = MenuBuilder.BuildRegisteredType( "GenericFrameCornerNodes", {
		controllerIndex = f1_local1
	} )
	CornerNodes.id = "CornerNodes"
	CornerNodes:SetAlpha( 0, 0 )
	CornerNodes:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -2, _1080p * 2, _1080p * -2, _1080p * 2 )
	self:addElement( CornerNodes )
	self.CornerNodes = CornerNodes
	
	local Highlight = nil
	
	Highlight = LUI.UIImage.new()
	Highlight.id = "Highlight"
	Highlight:SetRGBFromTable( SWATCHES.genericButton.highlight, 0 )
	Highlight:SetAlpha( 0, 0 )
	Highlight:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 3 )
	self:addElement( Highlight )
	self.Highlight = Highlight
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Background:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Background:SetRGBFromTable( SWATCHES.genericButton.backgroundFocus, 0, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.Background:SetAlpha( 0.75, 0, LUI.EASING.outQuadratic )
				end
			}
		} )
		Border:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Border:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Border:SetAlpha( 0.25, 40 )
				end,
				function ()
					return self.Border:SetAlpha( 0, 40 )
				end,
				function ()
					return self.Border:SetAlpha( 0.25, 40 )
				end,
				function ()
					return self.Border:SetAlpha( 0, 40 )
				end,
				function ()
					return self.Border:SetAlpha( 0.25, 40 )
				end,
				function ()
					return self.Border:SetAlpha( 0.25, 100, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.Border:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 1, _1080p * -1, _1080p * 1, _1080p * -1, 0 )
				end,
				function ()
					return self.Border:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 1, _1080p * -1, _1080p * 1, _1080p * -1, 200 )
				end,
				function ()
					return self.Border:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -4, _1080p * 4, _1080p * -4, _1080p * 4, 100, LUI.EASING.outBack )
				end
			}
		} )
		Highlight:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Highlight:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Highlight:SetAlpha( 1, 200 )
				end
			},
			{
				function ()
					return self.Highlight:SetRGBFromInt( 14042667, 0 )
				end
			},
			{
				function ()
					return self.Highlight:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, 0, 0 )
				end,
				function ()
					return self.Highlight:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, 0, 200 )
				end,
				function ()
					return self.Highlight:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 3, 100 )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			Background:AnimateSequence( "ButtonOver" )
			Border:AnimateSequence( "ButtonOver" )
			Highlight:AnimateSequence( "ButtonOver" )
		end
		
		Background:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Background:SetRGBFromTable( SWATCHES.genericButton.background, 0 )
				end
			},
			{
				function ()
					return self.Background:SetAlpha( 0.25, 0 )
				end
			}
		} )
		Border:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Border:SetAlpha( 0.25, 0 )
				end,
				function ()
					return self.Border:SetAlpha( 0, 100 )
				end
			},
			{
				function ()
					return self.Border:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -4, _1080p * 4, _1080p * -4, _1080p * 4, 0 )
				end,
				function ()
					return self.Border:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 1, _1080p * -1, _1080p * 1, _1080p * -1, 100 )
				end
			}
		} )
		Highlight:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Highlight:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.ButtonUp = function ()
			Background:AnimateSequence( "ButtonUp" )
			Border:AnimateSequence( "ButtonUp" )
			Highlight:AnimateSequence( "ButtonUp" )
		end
		
		Background:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.Background:SetRGBFromTable( SWATCHES.genericButton.background, 0 )
				end
			}
		} )
		GamepadIcon:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.GamepadIcon:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Locked = function ()
			Background:AnimateSequence( "Locked" )
			GamepadIcon:AnimateSequence( "Locked" )
		end
		
		Background:RegisterAnimationSequence( "ButtonOverDisabled", {
			{
				function ()
					return self.Background:SetRGBFromTable( SWATCHES.genericButton.backgroundFocus, 0 )
				end
			},
			{
				function ()
					return self.Background:SetAlpha( 0.25, 0 )
				end
			}
		} )
		Highlight:RegisterAnimationSequence( "ButtonOverDisabled", {
			{
				function ()
					return self.Highlight:SetRGBFromInt( 16777215, 0 )
				end
			},
			{
				function ()
					return self.Highlight:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Highlight:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, 0, 0 )
				end,
				function ()
					return self.Highlight:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 3, 100, LUI.EASING.outQuadratic )
				end
			}
		} )
		self._sequences.ButtonOverDisabled = function ()
			Background:AnimateSequence( "ButtonOverDisabled" )
			Highlight:AnimateSequence( "ButtonOverDisabled" )
		end
		
		Background:RegisterAnimationSequence( "ButtonUpDisabled", {
			{
				function ()
					return self.Background:SetRGBFromTable( SWATCHES.genericButton.backgroundDisabled, 0 )
				end
			},
			{
				function ()
					return self.Background:SetAlpha( 0.05, 0 )
				end
			}
		} )
		Highlight:RegisterAnimationSequence( "ButtonUpDisabled", {
			{
				function ()
					return self.Highlight:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.ButtonUpDisabled = function ()
			Background:AnimateSequence( "ButtonUpDisabled" )
			Highlight:AnimateSequence( "ButtonUpDisabled" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "button_over", function ( f45_arg0, f45_arg1 )
		local f45_local0 = f45_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "ButtonOver" )
	end )
	self:addEventHandler( "button_up", function ( f46_arg0, f46_arg1 )
		local f46_local0 = f46_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "ButtonUp" )
	end )
	self:addEventHandler( "button_disable", function ( f47_arg0, f47_arg1 )
		local f47_local0 = f47_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "ButtonUpDisabled" )
	end )
	self:addEventHandler( "button_over_disable", function ( f48_arg0, f48_arg1 )
		local f48_local0 = f48_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "ButtonOverDisabled" )
	end )
	return self
end

MenuBuilder.registerType( "GenericButtonBackgroundZm", GenericButtonBackgroundZm )
LockTable( _M )
