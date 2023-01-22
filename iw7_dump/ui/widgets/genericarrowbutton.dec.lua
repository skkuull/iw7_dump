local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1 )
	if f1_arg0._lastState ~= f1_arg1 then
		f1_arg0._lastState = f1_arg1
		ACTIONS.AnimateSequence( f1_arg0, f1_arg1 )
	end
end

function AddButtonOverFrames( f2_arg0 )
	local f2_local0 = 0
	if CONDITIONS.IsThirdGameMode( f2_arg0 ) then
		f2_local0 = 14277081
	end
	f2_arg0.Title:RegisterAnimationSequence( "ButtonOver", {
		{
			function ()
				return f2_arg0.Title:SetRGBFromInt( f2_local0, 0 )
			end
		},
		{
			function ()
				return f2_arg0.Title:SetAlpha( 1, 0 )
			end
		}
	} )
	f2_arg0.Text:RegisterAnimationSequence( "ButtonOver", {
		{
			function ()
				return f2_arg0.Text:SetRGBFromInt( f2_local0, 0 )
			end
		},
		{
			function ()
				return f2_arg0.Text:SetAlpha( 1, 0 )
			end
		}
	} )
	f2_arg0.ArrowLeft:RegisterAnimationSequence( "ButtonOver", {
		{
			function ()
				return f2_arg0.ArrowLeft:SetAlpha( 1, 0 )
			end
		}
	} )
	f2_arg0.ArrowRight:RegisterAnimationSequence( "ButtonOver", {
		{
			function ()
				return f2_arg0.ArrowRight:SetAlpha( 1, 0 )
			end
		}
	} )
	f2_arg0.Lock:RegisterAnimationSequence( "ButtonOver", {
		{
			function ()
				return f2_arg0.Lock:SetAlpha( 0, 0 )
			end
		}
	} )
	f2_arg0._sequences.ButtonOver = function ()
		f2_arg0.Text:AnimateSequence( "ButtonOver" )
		f2_arg0.ArrowRight:AnimateSequence( "ButtonOver" )
		f2_arg0.ArrowLeft:AnimateSequence( "ButtonOver" )
		f2_arg0.Title:AnimateSequence( "ButtonOver" )
		f2_arg0.Lock:AnimateSequence( "ButtonOver" )
	end
	
end

function AddButtonUpFrames( f11_arg0 )
	f11_arg0.Title:RegisterAnimationSequence( "ButtonUp", {
		{
			function ()
				return f11_arg0.Title:SetRGBFromInt( 14277081, 0 )
			end
		}
	} )
	f11_arg0.Text:RegisterAnimationSequence( "ButtonUp", {
		{
			function ()
				return f11_arg0.Text:SetRGBFromInt( 14277081, 0 )
			end
		}
	} )
	f11_arg0.ArrowLeft:RegisterAnimationSequence( "ButtonUp", {
		{
			function ()
				return f11_arg0.ArrowLeft:SetAlpha( 0, 0 )
			end
		}
	} )
	f11_arg0.ArrowRight:RegisterAnimationSequence( "ButtonUp", {
		{
			function ()
				return f11_arg0.ArrowRight:SetAlpha( 0, 0 )
			end
		}
	} )
	f11_arg0.Lock:RegisterAnimationSequence( "ButtonUp", {
		{
			function ()
				return f11_arg0.Lock:SetAlpha( 0, 0 )
			end
		}
	} )
	f11_arg0._sequences.ButtonUp = function ()
		f11_arg0.Title:AnimateSequence( "ButtonUp" )
		f11_arg0.Text:AnimateSequence( "ButtonUp" )
		f11_arg0.ArrowLeft:AnimateSequence( "ButtonUp" )
		f11_arg0.ArrowRight:AnimateSequence( "ButtonUp" )
		f11_arg0.Lock:AnimateSequence( "ButtonUp" )
	end
	
end

function AddButtonDisabledUpFrames( f18_arg0 )
	f18_arg0.Title:RegisterAnimationSequence( "ButtonUpDisabled", {
		{
			function ()
				return f18_arg0.Title:SetRGBFromInt( 12566463, 0 )
			end
		}
	} )
	f18_arg0.Text:RegisterAnimationSequence( "ButtonUpDisabled", {
		{
			function ()
				return f18_arg0.Text:SetRGBFromInt( 12566463, 0 )
			end
		}
	} )
	f18_arg0.ArrowLeft:RegisterAnimationSequence( "ButtonUpDisabled", {
		{
			function ()
				return f18_arg0.ArrowLeft:SetAlpha( 0, 0 )
			end
		}
	} )
	local f18_local0 = {
		{
			function ()
				return f18_arg0.ArrowRight:SetAlpha( 0, 0 )
			end
		}
	}
	f18_arg0.Lock:RegisterAnimationSequence( "ButtonUpDisabled", {
		{
			function ()
				return f18_arg0.Lock:SetAlpha( 1, 0 )
			end
		},
		{
			function ()
				return f18_arg0.Lock:SetRGBFromInt( 12566463, 0 )
			end
		}
	} )
	f18_arg0._sequences.ButtonUpDisabled = function ()
		f18_arg0.Title:AnimateSequence( "ButtonUpDisabled" )
		f18_arg0.Text:AnimateSequence( "ButtonUpDisabled" )
		f18_arg0.ArrowLeft:AnimateSequence( "ButtonUpDisabled" )
		f18_arg0.ArrowRight:AnimateSequence( "ButtonUpDisabled" )
		f18_arg0.Lock:AnimateSequence( "ButtonUpDisabled" )
	end
	
end

function AddButtonDisabledOverFrames( f26_arg0 )
	local f26_local0 = 0
	f26_arg0.Title:RegisterAnimationSequence( "ButtonOverDisabled", {
		{
			function ()
				return f26_arg0.Title:SetRGBFromInt( f26_local0, 0 )
			end
		}
	} )
	f26_arg0.Text:RegisterAnimationSequence( "ButtonOverDisabled", {
		{
			function ()
				return f26_arg0.Text:SetRGBFromInt( f26_local0, 0 )
			end
		}
	} )
	f26_arg0.ArrowLeft:RegisterAnimationSequence( "ButtonOverDisabled", {
		{
			function ()
				return f26_arg0.ArrowLeft:SetAlpha( 0, 0 )
			end
		}
	} )
	f26_arg0.ArrowRight:RegisterAnimationSequence( "ButtonOverDisabled", {
		{
			function ()
				return f26_arg0.ArrowRight:SetAlpha( 0, 0 )
			end
		}
	} )
	f26_arg0.Lock:RegisterAnimationSequence( "ButtonOverDisabled", {
		{
			function ()
				return f26_arg0.Lock:SetAlpha( 1, 0 )
			end
		},
		{
			function ()
				return f26_arg0.Lock:SetRGBFromInt( f26_local0, 0 )
			end
		}
	} )
	f26_arg0._sequences.ButtonOverDisabled = function ()
		f26_arg0.Title:AnimateSequence( "ButtonOverDisabled" )
		f26_arg0.Text:AnimateSequence( "ButtonOverDisabled" )
		f26_arg0.ArrowLeft:AnimateSequence( "ButtonOverDisabled" )
		f26_arg0.ArrowRight:AnimateSequence( "ButtonOverDisabled" )
		f26_arg0.Lock:AnimateSequence( "ButtonOverDisabled" )
	end
	
end

function PostLoadFunc( f34_arg0 )
	AddButtonOverFrames( f34_arg0 )
	AddButtonUpFrames( f34_arg0 )
	AddButtonDisabledUpFrames( f34_arg0 )
	AddButtonDisabledOverFrames( f34_arg0 )
	local f34_local0, f34_local1, f34_local2, f34_local3 = f34_arg0.Text:getLocalRect()
	local f34_local4 = 1
	local f34_local5 = 0
	local f34_local6 = f34_local0
	local f34_local7 = f34_local2
	if IsLanguageRightToLeft( GetCurrentLanguage() ) then
		local f34_local8 = 0
		f34_local5 = 1
		f34_local4 = f34_local8
		f34_local6 = 40 * _1080p
		f34_local7 = 240 * _1080p
		f34_arg0.ArrowRight:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 240, _1080p * 272, _1080p * -32, _1080p * 32 )
		f34_arg0.ArrowLeft:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 10, _1080p * 42, _1080p * -32, _1080p * 32 )
		f34_arg0.Title:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 265, _1080p * -65, _1080p * -11, _1080p * 11 )
	end
	if not Engine.IsPC() then
		f34_arg0.ArrowLeft:SetScale( -0.25, 0 )
		f34_arg0.ArrowRight:SetScale( -0.25, 0 )
	end
	f34_arg0.Text:SetAnchorsAndPosition( f34_local4, f34_local5, 0.5, 0.5, f34_local6, f34_local7, _1080p * -11, _1080p * 11 )
	f34_arg0:SetHandleMouseButton( false )
	f34_arg0:addEventHandler( "button_over", function ( f35_arg0, f35_arg1 )
		f0_local0( f35_arg0, "ButtonOver" )
	end )
	f34_arg0:addEventHandler( "button_up", function ( f36_arg0, f36_arg1 )
		f0_local0( f36_arg0, "ButtonUp" )
	end )
	f34_arg0:addEventHandler( "button_disable", function ( f37_arg0, f37_arg1 )
		f0_local0( f37_arg0, "ButtonUpDisabled" )
	end )
	f34_arg0:addEventHandler( "button_over_disable", function ( f38_arg0, f38_arg1 )
		f0_local0( f38_arg0, "ButtonOverDisabled" )
	end )
	if IsLanguageArabic() then
		assert( f34_arg0.Lock )
		f34_arg0.Lock:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 20, _1080p * 46, _1080p * -13, _1080p * 13 )
	end
end

function GenericArrowButton( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 500 * _1080p, 0, 30 * _1080p )
	self.id = "GenericArrowButton"
	self._animationSets = {}
	self._sequences = {}
	local f39_local1 = controller and controller.controllerIndex
	if not f39_local1 and not Engine.InFrontend() then
		f39_local1 = self:getRootController()
	end
	assert( f39_local1 )
	local f39_local2 = self
	local GenericListButtonBackground = nil
	
	GenericListButtonBackground = MenuBuilder.BuildRegisteredType( "GenericListArrowButtonBackground", {
		controllerIndex = f39_local1
	} )
	GenericListButtonBackground.id = "GenericListButtonBackground"
	GenericListButtonBackground:SetAnchorsAndPosition( 0, 0, 0, 0, 0, _1080p * -50, 0, 0 )
	self:addElement( GenericListButtonBackground )
	self.GenericListButtonBackground = GenericListButtonBackground
	
	local Title = nil
	
	Title = LUI.UIStyledText.new()
	Title.id = "Title"
	Title:SetRGBFromInt( 14277081, 0 )
	Title:setText( ToUpperCase( Engine.Localize( "MENU_NEW" ) ), 0 )
	Title:SetFontSize( 22 * _1080p )
	Title:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Title:SetAlignment( LUI.Alignment.Left )
	Title:SetStartupDelay( 1250 )
	Title:SetLineHoldTime( 1000 )
	Title:SetAnimMoveTime( 500 )
	Title:SetEndDelay( 1000 )
	Title:SetCrossfadeTime( 400 )
	Title:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	Title:SetMaxVisibleLines( 1 )
	Title:SetOutlineRGBFromInt( 0, 0 )
	Title:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 20, _1080p * -325, _1080p * -11, _1080p * 11 )
	self:addElement( Title )
	self.Title = Title
	
	local Text = nil
	
	Text = LUI.UIStyledText.new()
	Text.id = "Text"
	Text:SetRGBFromInt( 14277081, 0 )
	Text:setText( Engine.Localize( "MENU_NEW" ), 0 )
	Text:SetFontSize( 22 * _1080p )
	Text:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Text:SetAlignment( LUI.Alignment.Center )
	Text:SetStartupDelay( 1250 )
	Text:SetLineHoldTime( 1000 )
	Text:SetAnimMoveTime( 500 )
	Text:SetEndDelay( 1000 )
	Text:SetCrossfadeTime( 400 )
	Text:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	Text:SetMaxVisibleLines( 1 )
	Text:SetOutlineRGBFromInt( 0, 0 )
	Text:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -294, _1080p * -94, _1080p * -11, _1080p * 11 )
	self:addElement( Text )
	self.Text = Text
	
	local ArrowLeft = nil
	
	ArrowLeft = MenuBuilder.BuildRegisteredType( "MenuLeftArrow", {
		controllerIndex = f39_local1
	} )
	ArrowLeft.id = "ArrowLeft"
	ArrowLeft:SetAlpha( 0, 0 )
	ArrowLeft:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -325, _1080p * -301, _1080p * -24, _1080p * 24 )
	self:addElement( ArrowLeft )
	self.ArrowLeft = ArrowLeft
	
	local ArrowRight = nil
	
	ArrowRight = MenuBuilder.BuildRegisteredType( "MenuRightArrow", {
		controllerIndex = f39_local1
	} )
	ArrowRight.id = "ArrowRight"
	ArrowRight:SetAlpha( 0, 0 )
	ArrowRight:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -87, _1080p * -63, _1080p * -24, _1080p * 24 )
	self:addElement( ArrowRight )
	self.ArrowRight = ArrowRight
	
	local Lock = nil
	
	Lock = LUI.UIImage.new()
	Lock.id = "Lock"
	Lock:SetRGBFromInt( 0, 0 )
	Lock:SetAlpha( 0, 0 )
	Lock:setImage( RegisterMaterial( "icon_slot_locked" ), 0 )
	Lock:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -82, _1080p * -56, _1080p * -13, _1080p * 13 )
	self:addElement( Lock )
	self.Lock = Lock
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Title:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.Title:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Title:SetRGBFromInt( 12566463, 0 )
				end
			}
		} )
		Text:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.Text:SetRGBFromInt( 12566463, 0 )
				end
			},
			{
				function ()
					return self.Text:SetAlpha( 1, 0 )
				end
			}
		} )
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
			Title:AnimateSequence( "Locked" )
			Text:AnimateSequence( "Locked" )
			Lock:AnimateSequence( "Locked" )
		end
		
		Title:RegisterAnimationSequence( "NewNotification", {
			{
				function ()
					return self.Title:SetRGBFromInt( 12566463, 0 )
				end
			},
			{
				function ()
					return self.Title:SetAlpha( 1, 0 )
				end
			}
		} )
		Text:RegisterAnimationSequence( "NewNotification", {
			{
				function ()
					return self.Text:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Text:SetRGBFromInt( 12566463, 0 )
				end
			}
		} )
		Lock:RegisterAnimationSequence( "NewNotification", {
			{
				function ()
					return self.Lock:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.NewNotification = function ()
			Title:AnimateSequence( "NewNotification" )
			Text:AnimateSequence( "NewNotification" )
			Lock:AnimateSequence( "NewNotification" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f39_local1, controller )
	return self
end

MenuBuilder.registerType( "GenericArrowButton", GenericArrowButton )
LockTable( _M )
