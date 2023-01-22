local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.Title )
	assert( f1_arg0.Darkener )
	f1_arg0.SetTitle = function ( f2_arg0, f2_arg1 )
		f2_arg0.Title:setText( f2_arg1 )
	end
	
	f1_arg0.MeasureTitle = function ( f3_arg0, f3_arg1 )
		local f3_local0 = f3_arg0.Title:GetCurrentFont()
		local f3_local1, f3_local2, f3_local3, f3_local4 = f3_arg0.Title:getLocalRect()
		local f3_local5, f3_local6, f3_local7, f3_local8 = f3_arg0.Title:GetAnchorData()
		local f3_local9 = assert
		local f3_local10
		if (f3_local6 ~= 0 or f3_local8 ~= 1) and (f3_local6 ~= 1 or f3_local8 ~= 0) then
			f3_local10 = false
		else
			f3_local10 = true
		end
		f3_local9( f3_local10 )
		f3_local10, f3_local11, f3_local12, f3_local13 = GetTextDimensions( f3_arg1, f3_local0, math.abs( f3_local2 - f3_local4 ) )
		return f3_local12 - f3_local10
	end
	
	if f1_arg2.hideBackground then
		f1_arg0.Darkener:SetAlpha( 0, 0 )
	end
	f1_arg0:RegisterAnimationSequence( "intro", {
		{
			function ()
				return f1_arg0:SetAlpha( 1 )
			end,
			function ()
				return f1_arg0:SetAlpha( 0, 20 )
			end,
			function ()
				return f1_arg0:SetAlpha( 1, 20 )
			end,
			function ()
				return f1_arg0:SetAlpha( 0, 20 )
			end,
			function ()
				return f1_arg0:SetAlpha( 1, 20 )
			end
		},
		{
			function ()
				f1_arg0:SetDotPitchContrast( 0.8, 80 )
				f1_arg0:SetDotPitchY( 1 + 20 * math.random() )
				f1_arg0:SetDotPitchX( 2 )
				return f1_arg0:SetDotPitchX( 40, 200 )
			end,
			function ()
				f1_arg0:SetDotPitchContrast( 0, 140 )
				f1_arg0:SetDotPitchY( 0, 140 )
				return f1_arg0:SetDotPitchX( 0, 120 )
			end
		}
	} )
	f1_arg0:AnimateSequence( "intro" )
	if CONDITIONS.IsSplitscreen() then
		f1_arg0.Darkener:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -1200, _1080p * 1200, _1080p * -960, _1080p * 960, 0 )
	end
end

function PopupFrame( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 400 * _1080p, 0, 400 * _1080p )
	self.id = "PopupFrame"
	self._animationSets = {}
	self._sequences = {}
	local f11_local1 = controller and controller.controllerIndex
	if not f11_local1 and not Engine.InFrontend() then
		f11_local1 = self:getRootController()
	end
	assert( f11_local1 )
	local f11_local2 = self
	local Darkener = nil
	
	Darkener = LUI.UIImage.new()
	Darkener.id = "Darkener"
	Darkener:SetRGBFromInt( 0, 0 )
	Darkener:SetAlpha( 0.9, 0 )
	Darkener:SetScale( 1, 0 )
	Darkener:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -960, _1080p * 960, _1080p * -960, _1080p * 960 )
	self:addElement( Darkener )
	self.Darkener = Darkener
	
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromTable( SWATCHES.Popups.backgroundPopup, 0 )
	Background:SetAlpha( 0.8, 0 )
	Background:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -10, _1080p * 10, _1080p * -60, _1080p * 10 )
	self:addElement( Background )
	self.Background = Background
	
	local Border = nil
	
	Border = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	} )
	Border.id = "Border"
	Border:SetRGBFromTable( SWATCHES.genericMenu.border, 0 )
	Border:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -10, _1080p * 10, _1080p * -10, _1080p * 10 )
	self:addElement( Border )
	self.Border = Border
	
	local TitleBar = nil
	
	TitleBar = LUI.UIImage.new()
	TitleBar.id = "TitleBar"
	TitleBar:SetRGBFromInt( 5723991, 0 )
	TitleBar:SetAlpha( 0.4, 0 )
	TitleBar:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * -10, _1080p * 10, _1080p * -60, _1080p * -10 )
	self:addElement( TitleBar )
	self.TitleBar = TitleBar
	
	local Gradient = nil
	
	Gradient = LUI.UIImage.new()
	Gradient.id = "Gradient"
	Gradient:SetRGBFromInt( 0, 0 )
	Gradient:SetAlpha( 0.4, 0 )
	Gradient:setImage( RegisterMaterial( "widg_gradient_left_to_right" ), 0 )
	Gradient:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * -10, _1080p * 10, _1080p * -60, _1080p * -10 )
	self:addElement( Gradient )
	self.Gradient = Gradient
	
	local Title = nil
	
	Title = LUI.UIStyledText.new()
	Title.id = "Title"
	Title:setText( Engine.Localize( "MENU_NEW" ), 0 )
	Title:SetFontSize( 38 * _1080p )
	Title:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Title:SetAlignment( LUI.Alignment.Center )
	Title:SetStartupDelay( 1250 )
	Title:SetLineHoldTime( 400 )
	Title:SetAnimMoveTime( 300 )
	Title:SetEndDelay( 1000 )
	Title:SetCrossfadeTime( 500 )
	Title:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	Title:SetMaxVisibleLines( 1 )
	Title:SetDecodeLetterLength( 25 )
	Title:SetDecodeMaxRandChars( 3 )
	Title:SetDecodeUpdatesPerLetter( 4 )
	Title:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * -54, _1080p * -16 )
	self:addElement( Title )
	self.Title = Title
	
	local test = nil
	
	test = LUI.UIImage.new()
	test.id = "test"
	test:SetRGBFromInt( 6710886, 0 )
	test:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * 9, _1080p * 10, _1080p * -10, _1080p * 10 )
	self:addElement( test )
	self.test = test
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Darkener:RegisterAnimationSequence( "Darken", {
			{
				function ()
					return self.Darkener:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Darkener:SetAlpha( 0.9, 100 )
				end
			}
		} )
		self._sequences.Darken = function ()
			Darkener:AnimateSequence( "Darken" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	ACTIONS.AnimateSequence( self, "Darken" )
	ACTIONS.PlaySoundSetSound( self, "popup", false )
	PostLoadFunc( self, f11_local1, controller )
	return self
end

MenuBuilder.registerType( "PopupFrame", PopupFrame )
LockTable( _M )
