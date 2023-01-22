local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1 )
	if f1_arg0._lastState ~= f1_arg1 then
		f1_arg0._lastState = f1_arg1
		ACTIONS.AnimateSequence( f1_arg0, f1_arg1 )
	end
end

function GetRightToLeftConstants()
	local f2_local0 = 1
	local f2_local1 = 0
	local f2_local2 = 1
	local f2_local3 = 0
	if IsLanguageRightToLeft( GetCurrentLanguage() ) then
		local f2_local4 = 0
		f2_local1 = 1
		f2_local0 = f2_local4
		f2_local4 = 0
		f2_local3 = -1
		f2_local2 = f2_local4
	end
	return f2_local0, f2_local1, f2_local2, f2_local3
end

function AddButtonOverFrames( f3_arg0 )
	local f3_local0, f3_local1, f3_local2, f3_local3 = GetRightToLeftConstants()
	local f3_local4 = 0
	if Engine.IsAliensMode() then
		f3_local4 = 14277081
	end
	f3_arg0.Title:RegisterAnimationSequence( "ButtonOver", {
		{
			function ()
				return f3_arg0.Title:SetRGBFromInt( f3_local4, 0 )
			end
		}
	} )
	f3_arg0.ArrowLeft:RegisterAnimationSequence( "ButtonOver", {
		{
			function ()
				return f3_arg0.ArrowLeft:SetAlpha( 1, 0 )
			end
		}
	} )
	f3_arg0.ArrowRight:RegisterAnimationSequence( "ButtonOver", {
		{
			function ()
				return f3_arg0.ArrowRight:SetAlpha( 1, 0 )
			end
		}
	} )
	f3_arg0.Text:RegisterAnimationSequence( "ButtonOver", {
		{
			function ()
				return f3_arg0.Text:SetRGBFromInt( f3_local4, 0 )
			end
		}
	} )
	f3_arg0.Lock:RegisterAnimationSequence( "ButtonOver", {
		{
			function ()
				return f3_arg0.Lock:SetAlpha( 0, 0 )
			end
		}
	} )
	f3_arg0._sequences.ButtonOver = function ()
		f3_arg0.Title:AnimateSequence( "ButtonOver" )
		f3_arg0.ArrowRight:AnimateSequence( "ButtonOver" )
		f3_arg0.ArrowLeft:AnimateSequence( "ButtonOver" )
		f3_arg0.Text:AnimateSequence( "ButtonOver" )
		f3_arg0.Lock:AnimateSequence( "ButtonOver" )
	end
	
	f3_arg0.ArrowLeft:RegisterAnimationSequence( "ShowNumberLabel", {
		{
			function ()
				return f3_arg0.ArrowLeft:SetAnchorsAndPosition( f3_local0, f3_local1, 0.5, 0.5, _1080p * (-379 * f3_local2 + -58 * f3_local3), _1080p * (-355 * f3_local2 + -82 * f3_local3), _1080p * -24, _1080p * 24, 0 )
			end
		}
	} )
	f3_arg0.ArrowRight:RegisterAnimationSequence( "ShowNumberLabel", {
		{
			function ()
				return f3_arg0.ArrowRight:SetAnchorsAndPosition( f3_local0, f3_local1, 0.5, 0.5, _1080p * (-82 * f3_local2 + -355 * f3_local3), _1080p * (-58 * f3_local2 + -379 * f3_local3), _1080p * -24, _1080p * 24 )
			end
		}
	} )
	f3_arg0.GenericFillBar:RegisterAnimationSequence( "ShowNumberLabel", {
		{
			function ()
				return f3_arg0.GenericFillBar:SetAnchorsAndPosition( f3_local0, f3_local1, 0.5, 0.5, _1080p * (-361 * f3_local2 + -133 * f3_local3), _1080p * (-133 * f3_local2 + -361 * f3_local3), _1080p * -8, _1080p * 8, 0 )
			end
		}
	} )
	f3_arg0.Text:RegisterAnimationSequence( "ShowNumberLabel", {
		{
			function ()
				return f3_arg0.Text:SetAlpha( 1, 0 )
			end,
			function ()
				return f3_arg0.Text:SetAnchorsAndPosition( f3_local0, f3_local1, 0.5, 0.5, _1080p * (-150 * f3_local2 + -82 * f3_local3), _1080p * (-82 * f3_local2 + -150 * f3_local3), _1080p * -11, _1080p * 11 )
			end
		}
	} )
	f3_arg0._sequences.ShowNumberLabel = function ()
		f3_arg0.ArrowLeft:AnimateSequence( "ShowNumberLabel" )
		f3_arg0.ArrowRight:AnimateSequence( "ShowNumberLabel" )
		f3_arg0.GenericFillBar:AnimateSequence( "ShowNumberLabel" )
		f3_arg0.Text:AnimateSequence( "ShowNumberLabel" )
	end
	
	f3_arg0.GenericFillBar:RegisterAnimationSequence( "ShowTickMarker", {
		{
			function ()
				return f3_arg0.GenericFillBar.TickMarker:SetAlpha( 0.85, 0 )
			end
		}
	} )
	f3_arg0._sequences.ShowTickMarker = function ()
		f3_arg0.GenericFillBar:AnimateSequence( "ShowTickMarker" )
	end
	
end

function AddButtonUpFrames( f18_arg0 )
	local f18_local0, f18_local1, f18_local2, f18_local3 = GetRightToLeftConstants()
	f18_arg0.Title:RegisterAnimationSequence( "ButtonUp", {
		{
			function ()
				return f18_arg0.Title:SetRGBFromInt( 14277081, 0 )
			end
		}
	} )
	f18_arg0.ArrowLeft:RegisterAnimationSequence( "ButtonUp", {
		{
			function ()
				return f18_arg0.ArrowLeft:SetAlpha( 0, 0 )
			end
		}
	} )
	f18_arg0.ArrowRight:RegisterAnimationSequence( "ButtonUp", {
		{
			function ()
				return f18_arg0.ArrowRight:SetAlpha( 0, 0 )
			end
		}
	} )
	f18_arg0.Text:RegisterAnimationSequence( "ButtonUp", {
		{
			function ()
				return f18_arg0.Text:SetRGBFromInt( 14277081, 0 )
			end
		}
	} )
	f18_arg0.Lock:RegisterAnimationSequence( "ButtonUp", {
		{
			function ()
				return f18_arg0.Lock:SetAlpha( 0, 0 )
			end
		}
	} )
	f18_arg0._sequences.ButtonUp = function ()
		f18_arg0.Title:AnimateSequence( "ButtonUp" )
		f18_arg0.ArrowRight:AnimateSequence( "ButtonUp" )
		f18_arg0.ArrowLeft:AnimateSequence( "ButtonUp" )
		f18_arg0.Text:AnimateSequence( "ButtonUp" )
		f18_arg0.Lock:AnimateSequence( "ButtonUp" )
	end
	
end

function AddButtonDisabledUpFrames( f25_arg0 )
	local f25_local0, f25_local1, f25_local2, f25_local3 = GetRightToLeftConstants()
	f25_arg0.Title:RegisterAnimationSequence( "ButtonUpDisabled", {
		{
			function ()
				return f25_arg0.Title:SetAlpha( 1, 0 )
			end
		},
		{
			function ()
				return f25_arg0.Title:SetRGBFromInt( 12566463, 0 )
			end
		}
	} )
	f25_arg0.ArrowLeft:RegisterAnimationSequence( "ButtonUpDisabled", {
		{
			function ()
				return f25_arg0.ArrowLeft:SetAlpha( 0, 0 )
			end
		}
	} )
	f25_arg0.ArrowRight:RegisterAnimationSequence( "ButtonUpDisabled", {
		{
			function ()
				return f25_arg0.ArrowRight:SetAlpha( 0, 0 )
			end
		}
	} )
	f25_arg0.Text:RegisterAnimationSequence( "ButtonUpDisabled", {
		{
			function ()
				return f25_arg0.Text:SetRGBFromInt( 12566463, 0 )
			end
		}
	} )
	f25_arg0.Lock:RegisterAnimationSequence( "ButtonUpDisabled", {
		{
			function ()
				return f25_arg0.Lock:SetRGBFromInt( 12566463, 0 )
			end
		},
		{
			function ()
				return f25_arg0.Lock:SetAlpha( 1, 0 )
			end
		}
	} )
	f25_arg0._sequences.ButtonUpDisabled = function ()
		f25_arg0.Title:AnimateSequence( "ButtonUpDisabled" )
		f25_arg0.ArrowRight:AnimateSequence( "ButtonUpDisabled" )
		f25_arg0.ArrowLeft:AnimateSequence( "ButtonUpDisabled" )
		f25_arg0.Text:AnimateSequence( "ButtonUpDisabled" )
		f25_arg0.Lock:AnimateSequence( "ButtonUpDisabled" )
	end
	
end

function AddButtonDisabledOverFrames( f34_arg0 )
	local f34_local0, f34_local1, f34_local2, f34_local3 = GetRightToLeftConstants()
	f34_arg0.Title:RegisterAnimationSequence( "ButtonOverDisabled", {
		{
			function ()
				return f34_arg0.Title:SetAlpha( 1, 0 )
			end
		},
		{
			function ()
				return f34_arg0.Title:SetRGBFromInt( 0, 0 )
			end
		}
	} )
	f34_arg0.ArrowLeft:RegisterAnimationSequence( "ButtonOverDisabled", {
		{
			function ()
				return f34_arg0.ArrowLeft:SetAlpha( 0, 0 )
			end
		}
	} )
	f34_arg0.ArrowRight:RegisterAnimationSequence( "ButtonOverDisabled", {
		{
			function ()
				return f34_arg0.ArrowRight:SetAlpha( 0, 0 )
			end
		}
	} )
	f34_arg0.Text:RegisterAnimationSequence( "ButtonOverDisabled", {
		{
			function ()
				return f34_arg0.Text:SetRGBFromInt( 0, 0 )
			end
		}
	} )
	f34_arg0.Lock:RegisterAnimationSequence( "ButtonOverDisabled", {
		{
			function ()
				return f34_arg0.Lock:SetAlpha( 1, 0 )
			end
		},
		{
			function ()
				return f34_arg0.Lock:SetRGBFromInt( 0, 0 )
			end
		}
	} )
	f34_arg0._sequences.ButtonOverDisabled = function ()
		f34_arg0.Title:AnimateSequence( "ButtonOverDisabled" )
		f34_arg0.ArrowRight:AnimateSequence( "ButtonOverDisabled" )
		f34_arg0.ArrowLeft:AnimateSequence( "ButtonOverDisabled" )
		f34_arg0.Text:AnimateSequence( "ButtonOverDisabled" )
		f34_arg0.Lock:AnimateSequence( "ButtonOverDisabled" )
	end
	
end

function PostLoadFunc( f43_arg0, f43_arg1, f43_arg2 )
	f43_arg0._sequences = {}
	AddButtonOverFrames( f43_arg0 )
	AddButtonUpFrames( f43_arg0 )
	AddButtonDisabledUpFrames( f43_arg0 )
	AddButtonDisabledOverFrames( f43_arg0 )
	local f43_local0, f43_local1, f43_local2, f43_local3 = GetRightToLeftConstants()
	f43_arg0.ArrowLeft:SetAnchorsAndPosition( f43_local0, f43_local1, 0.5, 0.5, _1080p * (-326 * f43_local2 + -55 * f43_local3), _1080p * (-302 * f43_local2 + -87 * f43_local3), _1080p * -24, _1080p * 24 )
	f43_arg0.ArrowRight:SetAnchorsAndPosition( f43_local0, f43_local1, 0.5, 0.5, _1080p * (-82 * f43_local2 + -302 * f43_local3), _1080p * (-58 * f43_local2 + -334 * f43_local3), _1080p * -24, _1080p * 24 )
	f43_arg0.GenericFillBar:SetAnchorsAndPosition( f43_local0, f43_local1, 0.5, 0.5, _1080p * (-296 * f43_local2 + -96 * f43_local3), _1080p * (-96 * f43_local2 + -296 * f43_local3), _1080p * -8, _1080p * 8 )
	f43_arg0.GenericFillBar:SetAnchorsAndPosition( f43_local0, f43_local1, 0.5, 0.5, _1080p * (-296 * f43_local2 + -96 * f43_local3), _1080p * (-96 * f43_local2 + -296 * f43_local3), _1080p * -8, _1080p * 8 )
	f43_arg0:SetHandleMouseButton( false )
	if not CONDITIONS.IsGamepadEnabled() then
		LUI.AddMouseSliderLogic( f43_arg0 )
	end
	f43_arg0:addEventHandler( "button_over", function ( f44_arg0, f44_arg1 )
		f0_local0( f44_arg0, "ButtonOver" )
	end )
	f43_arg0:addEventHandler( "button_up", function ( f45_arg0, f45_arg1 )
		f0_local0( f45_arg0, "ButtonUp" )
	end )
	f43_arg0:addEventHandler( "button_disable", function ( f46_arg0, f46_arg1 )
		f0_local0( f46_arg0, "ButtonUpDisabled" )
	end )
	f43_arg0:addEventHandler( "button_over_disable", function ( f47_arg0, f47_arg1 )
		f0_local0( f47_arg0, "ButtonOverDisabled" )
	end )
end

function GenericFillBarArrowButton( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 776 * _1080p, 0, 30 * _1080p )
	self.id = "GenericFillBarArrowButton"
	self._animationSets = {}
	self._sequences = {}
	local f48_local1 = controller and controller.controllerIndex
	if not f48_local1 and not Engine.InFrontend() then
		f48_local1 = self:getRootController()
	end
	assert( f48_local1 )
	local f48_local2 = self
	local GenericListButtonBackground = nil
	
	GenericListButtonBackground = MenuBuilder.BuildRegisteredType( "GenericListArrowButtonBackground", {
		controllerIndex = f48_local1
	} )
	GenericListButtonBackground.id = "GenericListButtonBackground"
	GenericListButtonBackground:SetAnchorsAndPosition( 0, 0, 0, 0, 0, _1080p * -50, 0, 0 )
	self:addElement( GenericListButtonBackground )
	self.GenericListButtonBackground = GenericListButtonBackground
	
	local ArrowLeft = nil
	
	ArrowLeft = MenuBuilder.BuildRegisteredType( "MenuLeftArrow", {
		controllerIndex = f48_local1
	} )
	ArrowLeft.id = "ArrowLeft"
	ArrowLeft:SetAlpha( 0, 0 )
	ArrowLeft:SetScale( -0.25, 0 )
	ArrowLeft:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -326, _1080p * -302, _1080p * -24, _1080p * 24 )
	self:addElement( ArrowLeft )
	self.ArrowLeft = ArrowLeft
	
	local ArrowRight = nil
	
	ArrowRight = MenuBuilder.BuildRegisteredType( "MenuRightArrow", {
		controllerIndex = f48_local1
	} )
	ArrowRight.id = "ArrowRight"
	ArrowRight:SetRGBFromInt( 0, 0 )
	ArrowRight:SetAlpha( 0, 0 )
	ArrowRight:SetScale( -0.25, 0 )
	ArrowRight:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -82, _1080p * -58, _1080p * -24, _1080p * 24 )
	self:addElement( ArrowRight )
	self.ArrowRight = ArrowRight
	
	local Title = nil
	
	Title = LUI.UIStyledText.new()
	Title.id = "Title"
	Title:SetRGBFromInt( 14277081, 0 )
	Title:setText( ToUpperCase( "Button" ), 0 )
	Title:SetFontSize( 22 * _1080p )
	Title:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Title:SetAlignment( LUI.Alignment.Left )
	Title:SetStartupDelay( 1250 )
	Title:SetLineHoldTime( 400 )
	Title:SetAnimMoveTime( 300 )
	Title:SetEndDelay( 1000 )
	Title:SetCrossfadeTime( 500 )
	Title:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	Title:SetMaxVisibleLines( 1 )
	Title:SetOutlineRGBFromInt( 0, 0 )
	Title:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 20, _1080p * 713, _1080p * -11, _1080p * 11 )
	self:addElement( Title )
	self.Title = Title
	
	local GenericFillBar = nil
	
	GenericFillBar = MenuBuilder.BuildRegisteredType( "MenuFillBar", {
		controllerIndex = f48_local1
	} )
	GenericFillBar.id = "GenericFillBar"
	GenericFillBar:SetScale( -0.16, 0 )
	GenericFillBar:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -308, _1080p * -80, _1080p * -8, _1080p * 8 )
	self:addElement( GenericFillBar )
	self.GenericFillBar = GenericFillBar
	
	local Text = nil
	
	Text = LUI.UIStyledText.new()
	Text.id = "Text"
	Text:SetRGBFromInt( 14277081, 0 )
	Text:SetAlpha( 0, 0 )
	Text:setText( "0", 0 )
	Text:SetFontSize( 22 * _1080p )
	Text:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Text:SetAlignment( LUI.Alignment.Center )
	Text:SetOutlineRGBFromInt( 0, 0 )
	Text:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -130, _1080p * -82, _1080p * -11, _1080p * 11 )
	self:addElement( Text )
	self.Text = Text
	
	local Lock = nil
	
	Lock = LUI.UIImage.new()
	Lock.id = "Lock"
	Lock:SetRGBFromTable( SWATCHES.genericButton.textDisabled, 0 )
	Lock:SetAlpha( 0, 0 )
	Lock:setImage( RegisterMaterial( "icon_slot_locked" ), 0 )
	Lock:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -82, _1080p * -56, _1080p * -13, _1080p * 13 )
	self:addElement( Lock )
	self.Lock = Lock
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		self._sequences.Locked = function ()
			
		end
		
		self._sequences.NewNotification = function ()
			
		end
		
		Title:RegisterAnimationSequence( "ButtonOverDisabled", {
			{
				function ()
					return self.Title:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		self._sequences.ButtonOverDisabled = function ()
			Title:AnimateSequence( "ButtonOverDisabled" )
		end
		
		self._sequences.ButtonUpDisabled = function ()
			
		end
		
		Title:RegisterAnimationSequence( "Arabic", {
			{
				function ()
					return self.Title:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -756, _1080p * -63, _1080p * -11, _1080p * 11, 0 )
				end
			}
		} )
		self._sequences.Arabic = function ()
			Title:AnimateSequence( "Arabic" )
		end
		
	end
	
	self._animationSets.ThirdGameModeSet = function ()
		Lock:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Lock:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			Lock:AnimateSequence( "DefaultSequence" )
		end
		
		Lock:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.Lock:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Lock:SetRGBFromInt( 12566463, 0 )
				end
			}
		} )
		self._sequences.Locked = function ()
			Lock:AnimateSequence( "Locked" )
		end
		
		self._sequences.NewNotification = function ()
			
		end
		
		Title:RegisterAnimationSequence( "ButtonOverDisabled", {
			{
				function ()
					return self.Title:SetRGBFromInt( 14277081, 0 )
				end
			}
		} )
		Lock:RegisterAnimationSequence( "ButtonOverDisabled", {
			{
				function ()
					return self.Lock:SetRGBFromInt( 0, 0 )
				end
			},
			{
				function ()
					return self.Lock:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.ButtonOverDisabled = function ()
			Title:AnimateSequence( "ButtonOverDisabled" )
			Lock:AnimateSequence( "ButtonOverDisabled" )
		end
		
		Lock:RegisterAnimationSequence( "ButtonUpDisabled", {
			{
				function ()
					return self.Lock:SetRGBFromInt( 12566463, 0 )
				end
			},
			{
				function ()
					return self.Lock:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.ButtonUpDisabled = function ()
			Lock:AnimateSequence( "ButtonUpDisabled" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	if CONDITIONS.IsArabic( self ) then
		ACTIONS.AnimateSequence( self, "Arabic" )
	end
	self:addEventHandler( "button_over", function ( f72_arg0, f72_arg1 )
		local f72_local0 = f72_arg1.controller or f48_local1
		ACTIONS.AnimateSequenceByElement( self, {
			elementName = "GenericFillBar",
			sequenceName = "ButtonOver",
			elementPath = "GenericFillBar"
		} )
	end )
	self:addEventHandler( "button_up", function ( f73_arg0, f73_arg1 )
		local f73_local0 = f73_arg1.controller or f48_local1
		ACTIONS.AnimateSequenceByElement( self, {
			elementName = "GenericFillBar",
			sequenceName = "ButtonUp",
			elementPath = "GenericFillBar"
		} )
	end )
	self:addEventHandler( "button_over_disable", function ( f74_arg0, f74_arg1 )
		local f74_local0 = f74_arg1.controller or f48_local1
		ACTIONS.AnimateSequenceByElement( self, {
			elementName = "GenericFillBar",
			sequenceName = "ButtonOver",
			elementPath = "GenericFillBar"
		} )
	end )
	self:addEventHandler( "button_disable", function ( f75_arg0, f75_arg1 )
		local f75_local0 = f75_arg1.controller or f48_local1
		ACTIONS.AnimateSequenceByElement( self, {
			elementName = "GenericFillBar",
			sequenceName = "ButtonUp",
			elementPath = "GenericFillBar"
		} )
	end )
	PostLoadFunc( self, f48_local1, controller )
	if CONDITIONS.IsThirdGameMode( self ) then
		ACTIONS.SetAnimationSet( self, "ThirdGameModeSet" )
	end
	return self
end

MenuBuilder.registerType( "GenericFillBarArrowButton", GenericFillBarArrowButton )
LockTable( _M )
