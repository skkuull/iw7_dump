local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function CPMenuTitle( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 960 * _1080p, 0, 80 * _1080p )
	self.id = "CPMenuTitle"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Darkener = nil
	
	Darkener = LUI.UIImage.new()
	Darkener.id = "Darkener"
	Darkener:SetRGBFromInt( 0, 0 )
	Darkener:setImage( RegisterMaterial( "menu_title_darkener" ), 0 )
	Darkener:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -105, _1080p * 655, _1080p * -54, _1080p * 326 )
	self:addElement( Darkener )
	self.Darkener = Darkener
	
	local Gradient = nil
	
	Gradient = LUI.UIImage.new()
	Gradient.id = "Gradient"
	Gradient:setImage( RegisterMaterial( "cp_wepbuild_gradient_banner_1" ), 0 )
	Gradient:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -95, 0, 0, 0 )
	self:addElement( Gradient )
	self.Gradient = Gradient
	
	local MenuTitle = nil
	
	MenuTitle = LUI.UIStyledText.new()
	MenuTitle.id = "MenuTitle"
	MenuTitle:SetRGBFromTable( SWATCHES.Zombies.menuHeader, 0 )
	MenuTitle:SetGlitchEnabled( true )
	MenuTitle:SetGlitchAmount( 1, 0 )
	MenuTitle:SetGlitchBlockWidth( 50, 0 )
	MenuTitle:SetGlitchBlockHeight( 50, 0 )
	MenuTitle:SetGlitchDistortionRange( 16, 0 )
	MenuTitle:SetGlitchScanlinePitch( 1, 0 )
	MenuTitle:SetGlitchMaskPitch( 1, 0 )
	MenuTitle:setText( Engine.Localize( "MENU_NEW" ), 0 )
	MenuTitle:SetFontSize( 64 * _1080p )
	MenuTitle:SetFont( FONTS.GetFont( FONTS.ZmClean.File ) )
	MenuTitle:SetAlignment( LUI.Alignment.Left )
	MenuTitle:SetOptOutRightToLeftAlignmentFlip( true )
	MenuTitle:SetOutlineRGBFromInt( 0, 0 )
	MenuTitle:SetDecodeLetterLength( 25 )
	MenuTitle:SetDecodeMaxRandChars( 3 )
	MenuTitle:SetDecodeUpdatesPerLetter( 4 )
	MenuTitle:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 16, 0, _1080p * 13, _1080p * 77 )
	self:addElement( MenuTitle )
	self.MenuTitle = MenuTitle
	
	local CPTitleLineRed = nil
	
	CPTitleLineRed = LUI.UIImage.new()
	CPTitleLineRed.id = "CPTitleLineRed"
	CPTitleLineRed:SetRGBFromTable( SWATCHES.Zombies.fateCardLightBar, 0 )
	CPTitleLineRed:setImage( RegisterMaterial( "cp_menu_title_line_glow" ), 0 )
	CPTitleLineRed:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -95, _1080p * 2000, _1080p * -28, _1080p * 36 )
	self:addElement( CPTitleLineRed )
	self.CPTitleLineRed = CPTitleLineRed
	
	local CPTitleLine = nil
	
	CPTitleLine = LUI.UIImage.new()
	CPTitleLine.id = "CPTitleLine"
	CPTitleLine:setImage( RegisterMaterial( "cp_menu_title_line_glow" ), 0 )
	CPTitleLine:SetBlendMode( BLEND_MODE.addWithAlpha )
	CPTitleLine:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -95, _1080p * 2000, _1080p * -28, _1080p * 36 )
	self:addElement( CPTitleLine )
	self.CPTitleLine = CPTitleLine
	
	local CPIconSquares = nil
	
	CPIconSquares = LUI.UIImage.new()
	CPIconSquares.id = "CPIconSquares"
	CPIconSquares:SetRGBFromTable( SWATCHES.Zombies.menuHeader, 0 )
	CPIconSquares:setImage( RegisterMaterial( "cp_menu_title_icon_squares" ), 0 )
	CPIconSquares:SetBlendMode( BLEND_MODE.addWithAlpha )
	CPIconSquares:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -19, _1080p * 5, _1080p * 25, _1080p * 65 )
	self:addElement( CPIconSquares )
	self.CPIconSquares = CPIconSquares
	
	local CPYellowLine = nil
	
	CPYellowLine = LUI.UIImage.new()
	CPYellowLine.id = "CPYellowLine"
	CPYellowLine:SetRGBFromTable( SWATCHES.AAR.InfoHighlight, 0 )
	CPYellowLine:setImage( RegisterMaterial( "widg_gradient_left_to_right" ), 0 )
	CPYellowLine:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -95, _1080p * 1000, _1080p * 1, _1080p * 3 )
	self:addElement( CPYellowLine )
	self.CPYellowLine = CPYellowLine
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		self._sequences.Update = function ()
			
		end
		
		MenuTitle:RegisterAnimationSequence( "Initial", {
			{
				function ()
					return self.MenuTitle:SetGlitchAmount( 0.5, 0 )
				end,
				function ()
					return self.MenuTitle:SetGlitchAmount( 0, 500 )
				end
			},
			{
				function ()
					return self.MenuTitle:SetGlitchBlockWidth( 2, 0 )
				end
			},
			{
				function ()
					return self.MenuTitle:SetGlitchBlockHeight( 2, 0 )
				end
			},
			{
				function ()
					return self.MenuTitle:SetGlitchScanlinePitch( 1, 0 )
				end
			},
			{
				function ()
					return self.MenuTitle:SetGlitchDistortionRange( 6, 0 )
				end
			}
		} )
		self._sequences.Initial = function ()
			MenuTitle:AnimateSequence( "Initial" )
		end
		
		CPTitleLine:RegisterAnimationSequence( "Flicker", {
			{
				function ()
					return self.CPTitleLine:SetAlpha( 1, 0 )
				end,
				function ()
					return self.CPTitleLine:SetAlpha( 0, 3000 )
				end,
				function ()
					return self.CPTitleLine:SetAlpha( 1, 50 )
				end,
				function ()
					return self.CPTitleLine:SetAlpha( 0, 50 )
				end,
				function ()
					return self.CPTitleLine:SetAlpha( 1, 50 )
				end,
				function ()
					return self.CPTitleLine:SetAlpha( 0.6, 1850 )
				end,
				function ()
					return self.CPTitleLine:SetAlpha( 1, 2000 )
				end,
				function ()
					return self.CPTitleLine:SetAlpha( 0.4, 500 )
				end,
				function ()
					return self.CPTitleLine:SetAlpha( 1, 500 )
				end,
				function ()
					return self.CPTitleLine:SetAlpha( 1, 3000 )
				end,
				function ()
					return self.CPTitleLine:SetAlpha( 0, 20 )
				end,
				function ()
					return self.CPTitleLine:SetAlpha( 1, 180 )
				end,
				function ()
					return self.CPTitleLine:SetAlpha( 1, 800 )
				end,
				function ()
					return self.CPTitleLine:SetAlpha( 0.4, 1000 )
				end,
				function ()
					return self.CPTitleLine:SetAlpha( 1, 3000 )
				end
			}
		} )
		CPYellowLine:RegisterAnimationSequence( "Flicker", {
			{
				function ()
					return self.CPYellowLine:SetAlpha( 1, 0 )
				end,
				function ()
					return self.CPYellowLine:SetAlpha( 0, 3000 )
				end,
				function ()
					return self.CPYellowLine:SetAlpha( 1, 50 )
				end,
				function ()
					return self.CPYellowLine:SetAlpha( 0, 50 )
				end,
				function ()
					return self.CPYellowLine:SetAlpha( 1, 50 )
				end,
				function ()
					return self.CPYellowLine:SetAlpha( 0.6, 1850 )
				end,
				function ()
					return self.CPYellowLine:SetAlpha( 1, 2000 )
				end,
				function ()
					return self.CPYellowLine:SetAlpha( 0.4, 500 )
				end,
				function ()
					return self.CPYellowLine:SetAlpha( 1, 500 )
				end,
				function ()
					return self.CPYellowLine:SetAlpha( 1, 3000 )
				end,
				function ()
					return self.CPYellowLine:SetAlpha( 0, 20 )
				end,
				function ()
					return self.CPYellowLine:SetAlpha( 1, 180 )
				end,
				function ()
					return self.CPYellowLine:SetAlpha( 1, 800 )
				end,
				function ()
					return self.CPYellowLine:SetAlpha( 0.4, 1000 )
				end,
				function ()
					return self.CPYellowLine:SetAlpha( 1, 3000 )
				end
			}
		} )
		self._sequences.Flicker = function ()
			CPTitleLine:AnimateLoop( "Flicker" )
			CPYellowLine:AnimateLoop( "Flicker" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	ACTIONS.AnimateSequence( self, "Initial" )
	ACTIONS.AnimateSequence( self, "Flicker" )
	return self
end

MenuBuilder.registerType( "CPMenuTitle", CPMenuTitle )
LockTable( _M )
