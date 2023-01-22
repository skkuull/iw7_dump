local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1 )
	if f1_arg0._lastState ~= f1_arg1 then
		f1_arg0._lastState = f1_arg1
		ACTIONS.AnimateSequence( f1_arg0, f1_arg1 )
	end
end

function PostLoadFunc( f2_arg0 )
	local f2_local0, f2_local1, f2_local2, f2_local3 = f2_arg0.DynamicText:getLocalRect()
	local f2_local4 = 1
	local f2_local5 = 0
	local f2_local6 = f2_local0
	local f2_local7 = f2_local2
	if IsLanguageRightToLeft( GetCurrentLanguage() ) then
		f2_arg0.DynamicText:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, 40 * _1080p, 240 * _1080p, _1080p * -11, _1080p * 11 )
	end
	f2_arg0:addEventHandler( "button_over", function ( f3_arg0, f3_arg1 )
		f0_local0( f3_arg0, "ButtonOver" )
	end )
	f2_arg0:addEventHandler( "button_up", function ( f4_arg0, f4_arg1 )
		f0_local0( f4_arg0, "ButtonUp" )
	end )
	f2_arg0:addEventHandler( "button_disable", function ( f5_arg0, f5_arg1 )
		f0_local0( f5_arg0, "ButtonUpDisabled" )
	end )
	f2_arg0:addEventHandler( "button_over_disable", function ( f6_arg0, f6_arg1 )
		f0_local0( f6_arg0, "ButtonOverDisabled" )
	end )
end

function GenericDualLabelButton( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 500 * _1080p, 0, 30 * _1080p )
	self.id = "GenericDualLabelButton"
	self._animationSets = {}
	self._sequences = {}
	local f7_local1 = controller and controller.controllerIndex
	if not f7_local1 and not Engine.InFrontend() then
		f7_local1 = self:getRootController()
	end
	assert( f7_local1 )
	local f7_local2 = self
	local GenericListButtonBackground = nil
	
	GenericListButtonBackground = MenuBuilder.BuildRegisteredType( "GenericListArrowButtonBackground", {
		controllerIndex = f7_local1
	} )
	GenericListButtonBackground.id = "GenericListButtonBackground"
	GenericListButtonBackground:SetAnchorsAndPosition( 0, 0, 0, 0, 0, _1080p * -50, 0, 0 )
	self:addElement( GenericListButtonBackground )
	self.GenericListButtonBackground = GenericListButtonBackground
	
	local Text = nil
	
	Text = LUI.UIStyledText.new()
	Text.id = "Text"
	Text:SetRGBFromInt( 14277081, 0 )
	Text:setText( ToUpperCase( Engine.Localize( "MENU_NEW" ) ), 0 )
	Text:SetFontSize( 22 * _1080p )
	Text:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Text:SetAlignment( LUI.Alignment.Left )
	Text:SetStartupDelay( 1000 )
	Text:SetLineHoldTime( 500 )
	Text:SetAnimMoveTime( 500 )
	Text:SetEndDelay( 1000 )
	Text:SetCrossfadeTime( 500 )
	Text:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	Text:SetMaxVisibleLines( 1 )
	Text:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 20, _1080p * -70, _1080p * -11, _1080p * 11 )
	self:addElement( Text )
	self.Text = Text
	
	local DynamicText = nil
	
	DynamicText = LUI.UIStyledText.new()
	DynamicText.id = "DynamicText"
	DynamicText:SetRGBFromInt( 14277081, 0 )
	DynamicText:setText( Engine.Localize( "MENU_NEW" ), 0 )
	DynamicText:SetFontSize( 22 * _1080p )
	DynamicText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	DynamicText:SetAlignment( LUI.Alignment.Center )
	DynamicText:SetStartupDelay( 1000 )
	DynamicText:SetLineHoldTime( 500 )
	DynamicText:SetAnimMoveTime( 500 )
	DynamicText:SetEndDelay( 1000 )
	DynamicText:SetCrossfadeTime( 500 )
	DynamicText:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	DynamicText:SetMaxVisibleLines( 1 )
	DynamicText:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -304, _1080p * -84, _1080p * -11, _1080p * 11 )
	self:addElement( DynamicText )
	self.DynamicText = DynamicText
	
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
		
		Text:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Text:SetRGBFromInt( 0, 0 )
				end
			},
			{
				function ()
					return self.Text:SetAlpha( 1, 0 )
				end
			}
		} )
		DynamicText:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.DynamicText:SetRGBFromInt( 0, 0 )
				end
			},
			{
				function ()
					return self.DynamicText:SetAlpha( 1, 0 )
				end
			}
		} )
		Lock:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Lock:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			Text:AnimateSequence( "ButtonOver" )
			DynamicText:AnimateSequence( "ButtonOver" )
			Lock:AnimateSequence( "ButtonOver" )
		end
		
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
		DynamicText:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.DynamicText:SetRGBFromInt( 14277081, 0 )
				end
			},
			{
				function ()
					return self.DynamicText:SetAlpha( 0.85, 0 )
				end
			}
		} )
		Lock:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Lock:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.ButtonUp = function ()
			Text:AnimateSequence( "ButtonUp" )
			DynamicText:AnimateSequence( "ButtonUp" )
			Lock:AnimateSequence( "ButtonUp" )
		end
		
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
		DynamicText:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.DynamicText:SetRGBFromInt( 12566463, 0 )
				end
			},
			{
				function ()
					return self.DynamicText:SetAlpha( 1, 0 )
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
			Text:AnimateSequence( "Locked" )
			DynamicText:AnimateSequence( "Locked" )
			Lock:AnimateSequence( "Locked" )
		end
		
		Text:RegisterAnimationSequence( "NewNotification", {
			{
				function ()
					return self.Text:SetRGBFromTable( SWATCHES.genericButton.contentFocus, 0 )
				end
			}
		} )
		DynamicText:RegisterAnimationSequence( "NewNotification", {
			{
				function ()
					return self.DynamicText:SetRGBFromTable( SWATCHES.genericButton.contentFocus, 0 )
				end
			},
			{
				function ()
					return self.DynamicText:SetAlpha( 0.05, 0 )
				end
			}
		} )
		self._sequences.NewNotification = function ()
			Text:AnimateSequence( "NewNotification" )
			DynamicText:AnimateSequence( "NewNotification" )
		end
		
		Text:RegisterAnimationSequence( "ButtonOverDisabled", {
			{
				function ()
					return self.Text:SetRGBFromInt( 0, 0 )
				end
			},
			{
				function ()
					return self.Text:SetAlpha( 1, 0 )
				end
			}
		} )
		DynamicText:RegisterAnimationSequence( "ButtonOverDisabled", {
			{
				function ()
					return self.DynamicText:SetRGBFromInt( 0, 0 )
				end
			},
			{
				function ()
					return self.DynamicText:SetAlpha( 1, 0 )
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
			Text:AnimateSequence( "ButtonOverDisabled" )
			DynamicText:AnimateSequence( "ButtonOverDisabled" )
			Lock:AnimateSequence( "ButtonOverDisabled" )
		end
		
		Text:RegisterAnimationSequence( "ButtonUpDisabled", {
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
		DynamicText:RegisterAnimationSequence( "ButtonUpDisabled", {
			{
				function ()
					return self.DynamicText:SetRGBFromInt( 12566463, 0 )
				end
			},
			{
				function ()
					return self.DynamicText:SetAlpha( 1, 0 )
				end
			}
		} )
		Lock:RegisterAnimationSequence( "ButtonUpDisabled", {
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
		self._sequences.ButtonUpDisabled = function ()
			Text:AnimateSequence( "ButtonUpDisabled" )
			DynamicText:AnimateSequence( "ButtonUpDisabled" )
			Lock:AnimateSequence( "ButtonUpDisabled" )
		end
		
	end
	
	self._animationSets.ThirdGameMode = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Text:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Text:SetRGBFromInt( 14277081, 0 )
				end
			}
		} )
		Lock:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Lock:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			Text:AnimateSequence( "ButtonOver" )
			Lock:AnimateSequence( "ButtonOver" )
		end
		
		Text:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Text:SetRGBFromInt( 14277081, 0 )
				end
			}
		} )
		Lock:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Lock:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.ButtonUp = function ()
			Text:AnimateSequence( "ButtonUp" )
			Lock:AnimateSequence( "ButtonUp" )
		end
		
		Text:RegisterAnimationSequence( "ButtonUpDisabled", {
			{
				function ()
					return self.Text:SetRGBFromInt( 14277081, 0 )
				end
			}
		} )
		Lock:RegisterAnimationSequence( "ButtonUpDisabled", {
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
		self._sequences.ButtonUpDisabled = function ()
			Text:AnimateSequence( "ButtonUpDisabled" )
			Lock:AnimateSequence( "ButtonUpDisabled" )
		end
		
		Text:RegisterAnimationSequence( "ButtonOverDisabled", {
			{
				function ()
					return self.Text:SetRGBFromInt( 14277081, 0 )
				end
			}
		} )
		Lock:RegisterAnimationSequence( "ButtonOverDisabled", {
			{
				function ()
					return self.Lock:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Lock:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		self._sequences.ButtonOverDisabled = function ()
			Text:AnimateSequence( "ButtonOverDisabled" )
			Lock:AnimateSequence( "ButtonOverDisabled" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f7_local1, controller )
	if CONDITIONS.IsThirdGameMode( self ) then
		ACTIONS.SetAnimationSet( self, "ThirdGameMode" )
	end
	return self
end

MenuBuilder.registerType( "GenericDualLabelButton", GenericDualLabelButton )
LockTable( _M )
