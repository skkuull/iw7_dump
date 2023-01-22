local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function AddButtonOverFrames( f1_arg0 )
	local f1_local0 = 0
	if CONDITIONS.IsThirdGameMode( f1_arg0 ) then
		f1_local0 = 14277081
	end
	f1_arg0.Title:RegisterAnimationSequence( "ButtonOver", {
		{
			function ()
				return f1_arg0.Title:SetRGBFromInt( f1_local0, 0 )
			end
		},
		{
			function ()
				return f1_arg0.Title:SetAlpha( 1, 0 )
			end
		}
	} )
	f1_arg0.Text:RegisterAnimationSequence( "ButtonOver", {
		{
			function ()
				return f1_arg0.Text:SetRGBFromInt( f1_local0, 0 )
			end
		},
		{
			function ()
				return f1_arg0.Text:SetAlpha( 1, 0 )
			end
		}
	} )
	f1_arg0.ArrowLeft:RegisterAnimationSequence( "ButtonOver", {
		{
			function ()
				return f1_arg0.ArrowLeft:SetAlpha( 1, 0 )
			end
		}
	} )
	f1_arg0.ArrowRight:RegisterAnimationSequence( "ButtonOver", {
		{
			function ()
				return f1_arg0.ArrowRight:SetAlpha( 1, 0 )
			end
		}
	} )
	f1_arg0._sequences.ButtonOver = function ()
		f1_arg0.Text:AnimateSequence( "ButtonOver" )
		f1_arg0.ArrowRight:AnimateSequence( "ButtonOver" )
		f1_arg0.ArrowLeft:AnimateSequence( "ButtonOver" )
		f1_arg0.Title:AnimateSequence( "ButtonOver" )
	end
	
end

function AddButtonUpFrames( f9_arg0 )
	f9_arg0.Title:RegisterAnimationSequence( "ButtonUp", {
		{
			function ()
				return f9_arg0.Title:SetRGBFromInt( 14277081, 0 )
			end
		}
	} )
	f9_arg0.Text:RegisterAnimationSequence( "ButtonUp", {
		{
			function ()
				return f9_arg0.Text:SetRGBFromInt( 14277081, 0 )
			end
		}
	} )
	f9_arg0.ArrowLeft:RegisterAnimationSequence( "ButtonUp", {
		{
			function ()
				return f9_arg0.ArrowLeft:SetAlpha( 0, 0 )
			end
		}
	} )
	f9_arg0.ArrowRight:RegisterAnimationSequence( "ButtonUp", {
		{
			function ()
				return f9_arg0.ArrowRight:SetAlpha( 0, 0 )
			end
		}
	} )
	f9_arg0._sequences.ButtonUp = function ()
		f9_arg0.Title:AnimateSequence( "ButtonUp" )
		f9_arg0.Text:AnimateSequence( "ButtonUp" )
		f9_arg0.ArrowLeft:AnimateSequence( "ButtonUp" )
		f9_arg0.ArrowRight:AnimateSequence( "ButtonUp" )
	end
	
end

f0_local0 = function ( f15_arg0, f15_arg1, f15_arg2 )
	AddButtonOverFrames( f15_arg0 )
	AddButtonUpFrames( f15_arg0 )
	if IsLanguageRightToLeft( GetCurrentLanguage() ) then
		f15_arg0.Text:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 42, _1080p * 242, _1080p * -11, _1080p * 11 )
	end
	f15_arg0:addEventHandler( "button_over", function ( f16_arg0, f16_arg1 )
		f15_arg0:dispatchEventToRoot( {
			name = "arrow_button_changed",
			text = f16_arg0.Title:getText(),
			desc = f16_arg0.Desc
		} )
		f15_arg0.ArrowLeft:SetScale( -0.25, 0 )
		f15_arg0.ArrowRight:SetScale( -0.25, 0 )
		if IsLanguageRightToLeft( GetCurrentLanguage() ) then
			f15_arg0.ArrowRight:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 240, _1080p * 272, _1080p * -32, _1080p * 32 )
			f15_arg0.ArrowLeft:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 10, _1080p * 42, _1080p * -32, _1080p * 32 )
		end
	end )
end

function CodCasterArrowButton( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 750 * _1080p, 0, 30 * _1080p )
	self.id = "CodCasterArrowButton"
	self._animationSets = {}
	self._sequences = {}
	local f17_local1 = controller and controller.controllerIndex
	if not f17_local1 and not Engine.InFrontend() then
		f17_local1 = self:getRootController()
	end
	assert( f17_local1 )
	local f17_local2 = self
	local GenericListButtonBackground = nil
	
	GenericListButtonBackground = MenuBuilder.BuildRegisteredType( "GenericListArrowButtonBackground", {
		controllerIndex = f17_local1
	} )
	GenericListButtonBackground.id = "GenericListButtonBackground"
	GenericListButtonBackground:SetAnchorsAndPosition( 0, 0, 0, 0, 0, _1080p * -50, 0, 0 )
	self:addElement( GenericListButtonBackground )
	self.GenericListButtonBackground = GenericListButtonBackground
	
	local Title = nil
	
	Title = LUI.UIStyledText.new()
	Title.id = "Title"
	Title:setText( ToUpperCase( Engine.Localize( "MENU_NEW" ) ), 0 )
	Title:SetFontSize( 22 * _1080p )
	Title:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Title:SetAlignment( LUI.Alignment.Left )
	Title:SetOutlineRGBFromInt( 0, 0 )
	Title:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 20, _1080p * -85, _1080p * -11, _1080p * 11 )
	self:addElement( Title )
	self.Title = Title
	
	local Text = nil
	
	Text = LUI.UIStyledText.new()
	Text.id = "Text"
	Text:setText( ToUpperCase( Engine.Localize( "MENU_NEW" ) ), 0 )
	Text:SetFontSize( 22 * _1080p )
	Text:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Text:SetAlignment( LUI.Alignment.Center )
	Text:SetOutlineRGBFromInt( 0, 0 )
	Text:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -280, _1080p * -95, _1080p * -11, _1080p * 11 )
	self:addElement( Text )
	self.Text = Text
	
	local ArrowLeft = nil
	
	ArrowLeft = MenuBuilder.BuildRegisteredType( "MenuLeftArrow", {
		controllerIndex = f17_local1
	} )
	ArrowLeft.id = "ArrowLeft"
	ArrowLeft:SetAlpha( 0, 0 )
	ArrowLeft:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -319, _1080p * -295, _1080p * -24, _1080p * 24 )
	self:addElement( ArrowLeft )
	self.ArrowLeft = ArrowLeft
	
	local ArrowRight = nil
	
	ArrowRight = MenuBuilder.BuildRegisteredType( "MenuRightArrow", {
		controllerIndex = f17_local1
	} )
	ArrowRight.id = "ArrowRight"
	ArrowRight:SetAlpha( 0, 0 )
	ArrowRight:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -81, _1080p * -57, _1080p * -24, _1080p * 24 )
	self:addElement( ArrowRight )
	self.ArrowRight = ArrowRight
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Title:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Title:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		Text:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Text:SetRGBFromInt( 14277081, 0 )
				end,
				function ()
					return self.Text:SetRGBFromInt( 0, 100, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.Text:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Text:SetAlpha( 1, 100, LUI.EASING.outQuadratic )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			Title:AnimateSequence( "ButtonOver" )
			Text:AnimateSequence( "ButtonOver" )
		end
		
		Title:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Title:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		Text:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Text:SetRGBFromInt( 14277081, 0 )
				end
			},
			{
				function ()
					return self.Text:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.ButtonUp = function ()
			Title:AnimateSequence( "ButtonUp" )
			Text:AnimateSequence( "ButtonUp" )
		end
		
		Title:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.Title:SetAlpha( 0.15, 0 )
				end
			}
		} )
		Text:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.Text:SetRGBFromTable( SWATCHES.genericButton.textDefault, 0 )
				end
			},
			{
				function ()
					return self.Text:SetAlpha( 0.05, 0 )
				end
			}
		} )
		self._sequences.Locked = function ()
			Title:AnimateSequence( "Locked" )
			Text:AnimateSequence( "Locked" )
		end
		
		Title:RegisterAnimationSequence( "NewNotification", {
			{
				function ()
					return self.Title:SetRGBFromInt( 14277081, 0 )
				end,
				function ()
					return self.Title:SetRGBFromInt( 0, 100 )
				end
			},
			{
				function ()
					return self.Title:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Title:SetAlpha( 1, 100 )
				end
			},
			{
				function ()
					return self.Title:SetGlitchMaskPitch( 1.08, 0 )
				end
			},
			{
				function ()
					return self.Title:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 20, 0, _1080p * -13, _1080p * 13, 0 )
				end,
				function ()
					return self.Title:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 20, _1080p * -15, _1080p * -13, _1080p * 13, 100 )
				end
			}
		} )
		Text:RegisterAnimationSequence( "NewNotification", {
			{
				function ()
					return self.Text:SetAlpha( 0.05, 0 )
				end
			},
			{
				function ()
					return self.Text:SetRGBFromTable( SWATCHES.genericButton.textDefault, 0 )
				end
			}
		} )
		self._sequences.NewNotification = function ()
			Title:AnimateSequence( "NewNotification" )
			Text:AnimateSequence( "NewNotification" )
		end
		
		Text:RegisterAnimationSequence( "ButtonOverDisabled", {
			{
				function ()
					return self.Text:SetRGBFromTable( SWATCHES.genericButton.textDisabled, 0 )
				end
			},
			{
				function ()
					return self.Text:SetAlpha( 0.3, 0 )
				end,
				function ()
					return self.Text:SetAlpha( 0.6, 100, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.Text:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -290, _1080p * -90, _1080p * -12, _1080p * 12, 0 )
				end,
				function ()
					return self.Text:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -240, _1080p * -40, _1080p * -11, _1080p * 11, 100, LUI.EASING.outQuadratic )
				end
			}
		} )
		self._sequences.ButtonOverDisabled = function ()
			Text:AnimateSequence( "ButtonOverDisabled" )
		end
		
		Title:RegisterAnimationSequence( "ButtonUpDisabled", {
			{
				function ()
					return self.Title:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Title:SetAlpha( 0.5, 100 )
				end
			},
			{
				function ()
					return self.Title:SetRGBFromTable( SWATCHES.genericButton.textDisabled, 0 )
				end
			},
			{
				function ()
					return self.Title:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 40, _1080p * -15, _1080p * -13, _1080p * 13, 0 )
				end,
				function ()
					return self.Title:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 20, _1080p * -15, _1080p * -13, _1080p * 13, 100 )
				end
			}
		} )
		Text:RegisterAnimationSequence( "ButtonUpDisabled", {
			{
				function ()
					return self.Text:SetRGBFromTable( SWATCHES.genericButton.textDisabled, 0 )
				end
			},
			{
				function ()
					return self.Text:SetAlpha( 0.6, 0 )
				end,
				function ()
					return self.Text:SetAlpha( 0.3, 100, LUI.EASING.inQuadratic )
				end
			},
			{
				function ()
					return self.Text:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -232, _1080p * -32, _1080p * -11, _1080p * 11, 0 )
				end,
				function ()
					return self.Text:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -282, _1080p * -82, _1080p * -11, _1080p * 11, 100, LUI.EASING.inQuadratic )
				end
			}
		} )
		self._sequences.ButtonUpDisabled = function ()
			Title:AnimateSequence( "ButtonUpDisabled" )
			Text:AnimateSequence( "ButtonUpDisabled" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "button_up", function ( f61_arg0, f61_arg1 )
		local f61_local0 = f61_arg1.controller or f17_local1
		ACTIONS.AnimateSequence( self, "ButtonUp" )
	end )
	self:addEventHandler( "button_disable", function ( f62_arg0, f62_arg1 )
		local f62_local0 = f62_arg1.controller or f17_local1
		ACTIONS.AnimateSequence( self, "ButtonUpDisabled" )
	end )
	self:addEventHandler( "button_over_disable", function ( f63_arg0, f63_arg1 )
		local f63_local0 = f63_arg1.controller or f17_local1
		ACTIONS.AnimateSequence( self, "ButtonOverDisabled" )
	end )
	self:addEventHandler( "button_over", function ( f64_arg0, f64_arg1 )
		local f64_local0 = f64_arg1.controller or f17_local1
		ACTIONS.AnimateSequence( self, "ButtonOver" )
	end )
	f0_local0( self, f17_local1, controller )
	return self
end

MenuBuilder.registerType( "CodCasterArrowButton", CodCasterArrowButton )
LockTable( _M )
