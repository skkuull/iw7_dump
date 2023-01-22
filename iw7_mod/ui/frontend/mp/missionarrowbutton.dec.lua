local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function MissionArrowButton( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 500 * _1080p, 0, 90 * _1080p )
	self.id = "MissionArrowButton"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local BlurBackground = nil
	
	BlurBackground = MenuBuilder.BuildRegisteredType( "GenericButtonBlurBackground", {
		controllerIndex = f1_local1
	} )
	BlurBackground.id = "BlurBackground"
	BlurBackground:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( BlurBackground )
	self.BlurBackground = BlurBackground
	
	local HonorsGrad = nil
	
	HonorsGrad = LUI.UIImage.new()
	HonorsGrad.id = "HonorsGrad"
	HonorsGrad:SetRGBFromInt( 0, 0 )
	HonorsGrad:SetAlpha( 0.5, 0 )
	HonorsGrad:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
	HonorsGrad:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 30, 0, _1080p * 65, _1080p * 76 )
	self:addElement( HonorsGrad )
	self.HonorsGrad = HonorsGrad
	
	local TabBackground = nil
	
	TabBackground = LUI.UIImage.new()
	TabBackground.id = "TabBackground"
	TabBackground:SetRGBFromTable( SWATCHES.tabManager.tabBackgroundFocused, 0 )
	TabBackground:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 30, 0, 0 )
	self:addElement( TabBackground )
	self.TabBackground = TabBackground
	
	local HonorsDivider = nil
	
	HonorsDivider = LUI.UIImage.new()
	HonorsDivider.id = "HonorsDivider"
	HonorsDivider:SetRGBFromInt( 10921638, 0 )
	HonorsDivider:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 30, 0, _1080p * 63, _1080p * 65 )
	self:addElement( HonorsDivider )
	self.HonorsDivider = HonorsDivider
	
	local imageStub = nil
	
	imageStub = LUI.UIImage.new()
	imageStub.id = "imageStub"
	imageStub:SetRGBFromTable( SWATCHES.genericButton.textDefault, 0 )
	imageStub:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 45, _1080p * 49, _1080p * 52.5, _1080p * 56.5 )
	self:addElement( imageStub )
	self.imageStub = imageStub
	
	local HonorsStub = nil
	
	HonorsStub = LUI.UIImage.new()
	HonorsStub.id = "HonorsStub"
	HonorsStub:SetRGBFromTable( SWATCHES.genericButton.textDefault, 0 )
	HonorsStub:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -129, _1080p * -125, _1080p * 52.5, _1080p * 56.5 )
	self:addElement( HonorsStub )
	self.HonorsStub = HonorsStub
	
	local Selection = nil
	
	Selection = MenuBuilder.BuildRegisteredType( "GenericButtonSelection", {
		controllerIndex = f1_local1
	} )
	Selection.id = "Selection"
	Selection:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( Selection )
	self.Selection = Selection
	
	local ArrowLeft = nil
	
	ArrowLeft = MenuBuilder.BuildRegisteredType( "ArrowLeft", {
		controllerIndex = f1_local1
	} )
	ArrowLeft.id = "ArrowLeft"
	ArrowLeft:SetScale( -0.25, 0 )
	ArrowLeft:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -28, _1080p * 4, _1080p * -32, _1080p * 32 )
	self:addElement( ArrowLeft )
	self.ArrowLeft = ArrowLeft
	
	local ArrowRight = nil
	
	ArrowRight = MenuBuilder.BuildRegisteredType( "ArrowRight", {
		controllerIndex = f1_local1
	} )
	ArrowRight.id = "ArrowRight"
	ArrowRight:SetScale( -0.25, 0 )
	ArrowRight:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -4, _1080p * 28, _1080p * -32, _1080p * 32 )
	self:addElement( ArrowRight )
	self.ArrowRight = ArrowRight
	
	local Text = nil
	
	Text = LUI.UIStyledText.new()
	Text.id = "Text"
	Text:SetRGBFromTable( SWATCHES.MissionSelectButton.headerText, 0 )
	Text:setText( ToUpperCase( Engine.Localize( "MENU_NEW" ) ), 0 )
	Text:SetFontSize( 20 * _1080p )
	Text:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Text:SetAlignment( LUI.Alignment.Left )
	Text:SetOutlineRGBFromInt( 0, 0 )
	Text:SetDecodeLetterLength( 20 )
	Text:SetDecodeMaxRandChars( 3 )
	Text:SetDecodeUpdatesPerLetter( 4 )
	Text:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 40, _1080p * -10, _1080p * 3, _1080p * 23 )
	self:addElement( Text )
	self.Text = Text
	
	local HeaderCompletion = nil
	
	HeaderCompletion = LUI.UIStyledText.new()
	HeaderCompletion.id = "HeaderCompletion"
	HeaderCompletion:SetRGBFromTable( SWATCHES.genericButton.textDefault, 0 )
	HeaderCompletion:setText( ToUpperCase( Engine.Localize( "LUA_MENU_TARGET" ) ), 0 )
	HeaderCompletion:SetFontSize( 14 * _1080p )
	HeaderCompletion:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	HeaderCompletion:SetAlignment( LUI.Alignment.Left )
	HeaderCompletion:SetOutlineRGBFromInt( 0, 0 )
	HeaderCompletion:SetDecodeLetterLength( 20 )
	HeaderCompletion:SetDecodeMaxRandChars( 3 )
	HeaderCompletion:SetDecodeUpdatesPerLetter( 4 )
	HeaderCompletion:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 53, 0, _1080p * -42, _1080p * -29 )
	self:addElement( HeaderCompletion )
	self.HeaderCompletion = HeaderCompletion
	
	local HeaderHonours = nil
	
	HeaderHonours = LUI.UIStyledText.new()
	HeaderHonours.id = "HeaderHonours"
	HeaderHonours:SetRGBFromTable( SWATCHES.genericButton.textDefault, 0 )
	HeaderHonours:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_HONORS" ) ), 0 )
	HeaderHonours:SetFontSize( 14 * _1080p )
	HeaderHonours:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	HeaderHonours:SetAlignment( LUI.Alignment.Center )
	HeaderHonours:SetOutlineRGBFromInt( 0, 0 )
	HeaderHonours:SetDecodeLetterLength( 20 )
	HeaderHonours:SetDecodeMaxRandChars( 3 )
	HeaderHonours:SetDecodeUpdatesPerLetter( 4 )
	HeaderHonours:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -180, _1080p * -10, _1080p * -42, _1080p * -29 )
	self:addElement( HeaderHonours )
	self.HeaderHonours = HeaderHonours
	
	local NumText = nil
	
	NumText = LUI.UIStyledText.new()
	NumText.id = "NumText"
	NumText:SetRGBFromInt( 0, 0 )
	NumText:setText( "1", 0 )
	NumText:SetFontSize( 24 * _1080p )
	NumText:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	NumText:SetAlignment( LUI.Alignment.Center )
	NumText:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 30, _1080p * 1, _1080p * 25 )
	self:addElement( NumText )
	self.NumText = NumText
	
	local MissionsHonours = nil
	
	MissionsHonours = MenuBuilder.BuildRegisteredType( "MissionsHonours", {
		controllerIndex = f1_local1
	} )
	MissionsHonours.id = "MissionsHonours"
	MissionsHonours:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -190, _1080p * -10, _1080p * -22, _1080p * -2 )
	self:addElement( MissionsHonours )
	self.MissionsHonours = MissionsHonours
	
	local TextCompletion = nil
	
	TextCompletion = LUI.UIStyledText.new()
	TextCompletion.id = "TextCompletion"
	TextCompletion:setText( ToUpperCase( "99" ), 0 )
	TextCompletion:SetFontSize( 20 * _1080p )
	TextCompletion:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	TextCompletion:SetAlignment( LUI.Alignment.Center )
	TextCompletion:SetOutlineRGBFromInt( 0, 0 )
	TextCompletion:SetDecodeLetterLength( 20 )
	TextCompletion:SetDecodeMaxRandChars( 3 )
	TextCompletion:SetDecodeUpdatesPerLetter( 4 )
	TextCompletion:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 40, _1080p * 105, _1080p * -22, _1080p * -2 )
	self:addElement( TextCompletion )
	self.TextCompletion = TextCompletion
	
	local SideGrad = nil
	
	SideGrad = LUI.UIImage.new()
	SideGrad.id = "SideGrad"
	SideGrad:SetRGBFromInt( 0, 0 )
	SideGrad:SetAlpha( 0.3, 0 )
	SideGrad:setImage( RegisterMaterial( "widg_gradient_left_to_right" ), 0 )
	SideGrad:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 30, _1080p * 36, 0, _1080p * 90 )
	self:addElement( SideGrad )
	self.SideGrad = SideGrad
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Text:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Text:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			Text:AnimateSequence( "ButtonOver" )
		end
		
		Text:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Text:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.ButtonUp = function ()
			Text:AnimateSequence( "ButtonUp" )
		end
		
		Text:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.Text:SetAlpha( 0.75, 0 )
				end
			}
		} )
		self._sequences.Locked = function ()
			Text:AnimateSequence( "Locked" )
		end
		
		Text:RegisterAnimationSequence( "NewNotification", {
			{
				function ()
					return self.Text:SetAlpha( 0.75, 0 )
				end
			}
		} )
		self._sequences.NewNotification = function ()
			Text:AnimateSequence( "NewNotification" )
		end
		
		Text:RegisterAnimationSequence( "ButtonOverDisabled", {
			{
				function ()
					return self.Text:SetAlpha( 0.3, 0 )
				end
			}
		} )
		self._sequences.ButtonOverDisabled = function ()
			Text:AnimateSequence( "ButtonOverDisabled" )
		end
		
		Text:RegisterAnimationSequence( "ButtonUpDisabled", {
			{
				function ()
					return self.Text:SetAlpha( 0.15, 0 )
				end
			}
		} )
		self._sequences.ButtonUpDisabled = function ()
			Text:AnimateSequence( "ButtonUpDisabled" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "button_over", function ( f16_arg0, f16_arg1 )
		local f16_local0 = f16_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "ButtonOver" )
	end )
	self:addEventHandler( "button_up", function ( f17_arg0, f17_arg1 )
		local f17_local0 = f17_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "ButtonUp" )
	end )
	self:addEventHandler( "button_disable", function ( f18_arg0, f18_arg1 )
		local f18_local0 = f18_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "ButtonUpDisabled" )
	end )
	self:addEventHandler( "button_over_disable", function ( f19_arg0, f19_arg1 )
		local f19_local0 = f19_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "ButtonOverDisabled" )
	end )
	return self
end

MenuBuilder.registerType( "MissionArrowButton", MissionArrowButton )
LockTable( _M )
