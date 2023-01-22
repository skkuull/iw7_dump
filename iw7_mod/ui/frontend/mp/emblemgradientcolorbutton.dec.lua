local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function EmblemGradientColorButton( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 250 * _1080p, 0, 32 * _1080p )
	self.id = "EmblemGradientColorButton"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Black = nil
	
	Black = LUI.UIImage.new()
	Black.id = "Black"
	Black:SetRGBFromInt( 0, 0 )
	Black:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 250, _1080p * 0.5, _1080p * 32 )
	self:addElement( Black )
	self.Black = Black
	
	local color = nil
	
	color = LUI.UIImage.new()
	color.id = "color"
	color:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 3, _1080p * 87, _1080p * 3.5, _1080p * 28.5 )
	self:addElement( color )
	self.color = color
	
	local colorName = nil
	
	colorName = LUI.UIText.new()
	colorName.id = "colorName"
	colorName:setText( "COLOR", 0 )
	colorName:SetFontSize( 22 * _1080p )
	colorName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	colorName:SetAlignment( LUI.Alignment.Left )
	colorName:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 94, _1080p * -8, _1080p * 5, _1080p * 27 )
	self:addElement( colorName )
	self.colorName = colorName
	
	local HighlightBorder = nil
	
	HighlightBorder = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 2,
		borderThicknessRight = _1080p * 2,
		borderThicknessTop = _1080p * 2,
		borderThicknessBottom = _1080p * 2
	} )
	HighlightBorder.id = "HighlightBorder"
	HighlightBorder:SetRGBFromInt( 16747776, 0 )
	HighlightBorder:SetAlpha( 0, 0 )
	HighlightBorder:SetBorderThicknessLeft( _1080p * 2, 0 )
	HighlightBorder:SetBorderThicknessRight( _1080p * 2, 0 )
	HighlightBorder:SetBorderThicknessTop( _1080p * 2, 0 )
	HighlightBorder:SetBorderThicknessBottom( _1080p * 2, 0 )
	HighlightBorder:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 3, _1080p * 87, _1080p * 3.5, _1080p * 28.5 )
	self:addElement( HighlightBorder )
	self.HighlightBorder = HighlightBorder
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		HighlightBorder:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.HighlightBorder:SetAlpha( 0, 0 )
				end,
				function ()
					return self.HighlightBorder:SetAlpha( 1, 100 )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			HighlightBorder:AnimateSequence( "ButtonOver" )
		end
		
		HighlightBorder:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.HighlightBorder:SetAlpha( 1, 0 )
				end,
				function ()
					return self.HighlightBorder:SetAlpha( 0, 100 )
				end
			}
		} )
		self._sequences.ButtonUp = function ()
			HighlightBorder:AnimateSequence( "ButtonUp" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "button_over", function ( f10_arg0, f10_arg1 )
		local f10_local0 = f10_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "ButtonOver" )
	end )
	self:addEventHandler( "button_up", function ( f11_arg0, f11_arg1 )
		local f11_local0 = f11_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "ButtonUp" )
	end )
	return self
end

MenuBuilder.registerType( "EmblemGradientColorButton", EmblemGradientColorButton )
LockTable( _M )
