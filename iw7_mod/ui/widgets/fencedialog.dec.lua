local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function FenceDialog( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "FenceDialog"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	self:playSound( "menu_open" )
	local f1_local2 = self
	local Darken = nil
	
	Darken = LUI.UIImage.new()
	Darken.id = "Darken"
	Darken:SetRGBFromInt( 0, 0 )
	Darken:SetAlpha( 0.8, 0 )
	self:addElement( Darken )
	self.Darken = Darken
	
	local BackgroundGlowBottom = nil
	
	BackgroundGlowBottom = LUI.UIImage.new()
	BackgroundGlowBottom.id = "BackgroundGlowBottom"
	BackgroundGlowBottom:SetRGBFromInt( 12080170, 0 )
	BackgroundGlowBottom:SetAlpha( 0.25, 0 )
	BackgroundGlowBottom:SetDotPitchEnabled( true )
	BackgroundGlowBottom:SetDotPitchX( 6, 0 )
	BackgroundGlowBottom:SetDotPitchY( 3, 0 )
	BackgroundGlowBottom:SetDotPitchContrast( 0.15, 0 )
	BackgroundGlowBottom:SetDotPitchMode( 0 )
	BackgroundGlowBottom:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
	BackgroundGlowBottom:SetBlendMode( BLEND_MODE.addWithAlpha )
	BackgroundGlowBottom:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, _1080p * -1920, _1080p * 64, _1080p * 80 )
	self:addElement( BackgroundGlowBottom )
	self.BackgroundGlowBottom = BackgroundGlowBottom
	
	local BackgroundGlowTop = nil
	
	BackgroundGlowTop = LUI.UIImage.new()
	BackgroundGlowTop.id = "BackgroundGlowTop"
	BackgroundGlowTop:SetRGBFromInt( 12080170, 0 )
	BackgroundGlowTop:SetAlpha( 0.25, 0 )
	BackgroundGlowTop:SetDotPitchEnabled( true )
	BackgroundGlowTop:SetDotPitchX( 6, 0 )
	BackgroundGlowTop:SetDotPitchY( 3, 0 )
	BackgroundGlowTop:SetDotPitchContrast( 0.15, 0 )
	BackgroundGlowTop:SetDotPitchMode( 0 )
	BackgroundGlowTop:setImage( RegisterMaterial( "widg_gradient_bottom_to_top" ), 0 )
	BackgroundGlowTop:SetBlendMode( BLEND_MODE.addWithAlpha )
	BackgroundGlowTop:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, _1080p * -1920, _1080p * -80, _1080p * -64 )
	self:addElement( BackgroundGlowTop )
	self.BackgroundGlowTop = BackgroundGlowTop
	
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 16767586, 0 )
	Background:SetDotPitchEnabled( true )
	Background:SetDotPitchX( 6, 0 )
	Background:SetDotPitchY( 3, 0 )
	Background:SetDotPitchContrast( 0.15, 0 )
	Background:SetDotPitchMode( 0 )
	Background:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, _1080p * -1920, _1080p * -64, _1080p * 64 )
	self:addElement( Background )
	self.Background = Background
	
	local Gradient = nil
	
	Gradient = LUI.UIImage.new()
	Gradient.id = "Gradient"
	Gradient:SetRGBFromInt( 16774827, 0 )
	Gradient:SetDotPitchEnabled( true )
	Gradient:SetDotPitchX( 6, 0 )
	Gradient:SetDotPitchY( 3, 0 )
	Gradient:SetDotPitchContrast( 0.15, 0 )
	Gradient:SetDotPitchMode( 0 )
	Gradient:setImage( RegisterMaterial( "wdg_gradient_dual" ), 0 )
	Gradient:SetBlendMode( BLEND_MODE.addWithAlpha )
	Gradient:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, _1080p * -1920, _1080p * -40, _1080p * 40 )
	self:addElement( Gradient )
	self.Gradient = Gradient
	
	local Message = nil
	
	Message = LUI.UIText.new()
	Message.id = "Message"
	Message:SetRGBFromInt( 0, 0 )
	Message:SetAlpha( 0, 0 )
	Message:setText( "", 0 )
	Message:SetFontSize( 38 * _1080p )
	Message:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Message:SetAlignment( LUI.Alignment.Center )
	Message:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * -19, _1080p * 19 )
	self:addElement( Message )
	self.Message = Message
	
	local Spinner = nil
	
	Spinner = MenuBuilder.BuildRegisteredType( "Spinner", {
		controllerIndex = f1_local1
	} )
	Spinner.id = "Spinner"
	Spinner:SetRGBFromInt( 0, 0 )
	Spinner:SetAlpha( 0, 0 )
	Spinner:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -20, _1080p * 20, _1080p * -20, _1080p * 20 )
	self:addElement( Spinner )
	self.Spinner = Spinner
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		BackgroundGlowBottom:RegisterAnimationSequence( "Intro", {
			{
				function ()
					return self.BackgroundGlowBottom:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, _1080p * -1920, _1080p * 1, _1080p * 10, 0 )
				end,
				function ()
					return self.BackgroundGlowBottom:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * 1, _1080p * 10, 349, LUI.EASING.inOutCubic )
				end,
				function ()
					return self.BackgroundGlowBottom:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * 40, _1080p * 50, 110, LUI.EASING.outBack )
				end
			}
		} )
		BackgroundGlowTop:RegisterAnimationSequence( "Intro", {
			{
				function ()
					return self.BackgroundGlowTop:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, _1080p * -1920, _1080p * -10, _1080p * -1, 0 )
				end,
				function ()
					return self.BackgroundGlowTop:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * -10, _1080p * -1, 349, LUI.EASING.inOutCubic )
				end,
				function ()
					return self.BackgroundGlowTop:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * -50, _1080p * -40, 110, LUI.EASING.outBack )
				end
			}
		} )
		Background:RegisterAnimationSequence( "Intro", {
			{
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, _1080p * -1920, _1080p * -1, _1080p * 1, 0 )
				end,
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * -1, _1080p * 1, 349, LUI.EASING.inOutCubic )
				end,
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * -40, _1080p * 40, 110, LUI.EASING.outBack )
				end
			}
		} )
		Gradient:RegisterAnimationSequence( "Intro", {
			{
				function ()
					return self.Gradient:SetAlpha( 1, 460, LUI.EASING.outBack )
				end,
				function ()
					return self.Gradient:SetAlpha( 0.1, 90 )
				end
			},
			{
				function ()
					return self.Gradient:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, _1080p * -1920, _1080p * -1, _1080p * 1, 0 )
				end,
				function ()
					return self.Gradient:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * -1, _1080p * 1, 349, LUI.EASING.inOutCubic )
				end,
				function ()
					return self.Gradient:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * -40, _1080p * 40, 110, LUI.EASING.outBack )
				end,
				function ()
					return self.Gradient:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 300, _1080p * -300, _1080p * -40, _1080p * 40, 90 )
				end
			}
		} )
		Message:RegisterAnimationSequence( "Intro", {
			{
				function ()
					return self.Message:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Message:SetAlpha( 0, 460 )
				end,
				function ()
					return self.Message:SetAlpha( 1, 90 )
				end
			}
		} )
		Spinner:RegisterAnimationSequence( "Intro", {
			{
				function ()
					return self.Spinner:SetAlpha( 0, 460 )
				end,
				function ()
					return self.Spinner:SetAlpha( 1, 90 )
				end
			}
		} )
		self._sequences.Intro = function ()
			BackgroundGlowBottom:AnimateSequence( "Intro" )
			BackgroundGlowTop:AnimateSequence( "Intro" )
			Background:AnimateSequence( "Intro" )
			Gradient:AnimateSequence( "Intro" )
			Message:AnimateSequence( "Intro" )
			Spinner:AnimateSequence( "Intro" )
		end
		
		BackgroundGlowBottom:RegisterAnimationSequence( "GlowPulse", {
			{
				function ()
					return self.BackgroundGlowBottom:SetAlpha( 0.25, 0 )
				end,
				function ()
					return self.BackgroundGlowBottom:SetAlpha( 0.4, 1000, LUI.EASING.outSine )
				end,
				function ()
					return self.BackgroundGlowBottom:SetAlpha( 0.4, 200 )
				end,
				function ()
					return self.BackgroundGlowBottom:SetAlpha( 0.25, 1000, LUI.EASING.inSine )
				end
			}
		} )
		BackgroundGlowTop:RegisterAnimationSequence( "GlowPulse", {
			{
				function ()
					return self.BackgroundGlowTop:SetAlpha( 0.25, 0 )
				end,
				function ()
					return self.BackgroundGlowTop:SetAlpha( 0.4, 1000, LUI.EASING.outSine )
				end,
				function ()
					return self.BackgroundGlowTop:SetAlpha( 0.4, 200 )
				end,
				function ()
					return self.BackgroundGlowTop:SetAlpha( 0.25, 1000, LUI.EASING.inSine )
				end
			}
		} )
		self._sequences.GlowPulse = function ()
			BackgroundGlowBottom:AnimateLoop( "GlowPulse" )
			BackgroundGlowTop:AnimateLoop( "GlowPulse" )
		end
		
		BackgroundGlowBottom:RegisterAnimationSequence( "CPColor", {
			{
				function ()
					return self.BackgroundGlowBottom:SetRGBFromTable( SWATCHES.Zombies.menuHeader, 0 )
				end
			}
		} )
		BackgroundGlowTop:RegisterAnimationSequence( "CPColor", {
			{
				function ()
					return self.BackgroundGlowTop:SetRGBFromTable( SWATCHES.Zombies.menuHeader, 0 )
				end
			}
		} )
		Background:RegisterAnimationSequence( "CPColor", {
			{
				function ()
					return self.Background:SetRGBFromTable( SWATCHES.Zombies.menuHeader, 0 )
				end
			}
		} )
		self._sequences.CPColor = function ()
			BackgroundGlowBottom:AnimateSequence( "CPColor" )
			BackgroundGlowTop:AnimateSequence( "CPColor" )
			Background:AnimateSequence( "CPColor" )
		end
		
	end
	
	self._animationSets.CP = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	ACTIONS.AnimateSequence( self, "Intro" )
	ACTIONS.AnimateSequence( self, "GlowPulse" )
	if CONDITIONS.IsThirdGameMode( self ) then
		ACTIONS.AnimateSequence( self, "CPColor" )
	end
	return self
end

MenuBuilder.registerType( "FenceDialog", FenceDialog )
LockTable( _M )
