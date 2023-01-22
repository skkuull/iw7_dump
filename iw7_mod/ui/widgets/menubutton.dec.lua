local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function RefreshAnimation( f1_arg0, f1_arg1 )
	if f1_arg0._lastState ~= f1_arg1 then
		f1_arg0._lastState = f1_arg1
		ACTIONS.AnimateSequence( f1_arg0, f1_arg1 )
	end
end

function PostLoadFunc( f2_arg0, f2_arg1, f2_arg2 )
	if IsLanguageArabic() then
		f2_arg0.Lock:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 92, _1080p * 118, _1080p * -13, _1080p * 13 )
	end
	f2_arg0:addEventHandler( "ignore_game_mode_layout", function ( f3_arg0, f3_arg1 )
		f2_arg0._ignoreGameModeLayout = true
	end )
	f2_arg0:addEventHandler( "menu_create", function ( f4_arg0, f4_arg1 )
		local f4_local0 = f4_arg1.controller or f2_arg1
		if CONDITIONS.IsThirdGameModeDesired( f2_arg0 ) and not f2_arg0._ignoreGameModeLayout then
			ACTIONS.SetAnimationSet( f2_arg0, "ThirdGameMode" )
			f2_arg0:setGainFocusSFX( "cp_ui_hilite" )
			f2_arg0:setActionSFX( "cp_ui_select_confirm" )
			f2_arg0:setActionDisabledSFX( "cp_ui_select_deny" )
		end
	end )
	f2_arg0:addEventHandler( "button_contextual_menu_open", function ( f5_arg0, f5_arg1 )
		if f5_arg1.selectedButton ~= f2_arg0 and f2_arg0.contextualMenu ~= nil then
			f2_arg0.contextualMenu:closeTree()
			f2_arg0.contextualMenu = nil
		end
	end )
	f2_arg0:addEventHandler( "button_over", function ( f6_arg0, f6_arg1 )
		RefreshAnimation( f6_arg0, "ButtonOver" )
	end )
	f2_arg0:addEventHandler( "button_up", function ( f7_arg0, f7_arg1 )
		RefreshAnimation( f7_arg0, "ButtonUp" )
	end )
	f2_arg0:addEventHandler( "button_disable", function ( f8_arg0, f8_arg1 )
		RefreshAnimation( f8_arg0, "ButtonUpDisabled" )
	end )
	f2_arg0:addEventHandler( "button_over_disable", function ( f9_arg0, f9_arg1 )
		RefreshAnimation( f9_arg0, "ButtonOverDisabled" )
	end )
end

function MenuButton( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 500 * _1080p, 0, 30 * _1080p )
	self.id = "MenuButton"
	self._animationSets = {}
	self._sequences = {}
	local f10_local1 = controller and controller.controllerIndex
	if not f10_local1 and not Engine.InFrontend() then
		f10_local1 = self:getRootController()
	end
	assert( f10_local1 )
	local f10_local2 = self
	local GenericListButtonBackground = nil
	
	GenericListButtonBackground = MenuBuilder.BuildRegisteredType( "GenericListArrowButtonBackground", {
		controllerIndex = f10_local1
	} )
	GenericListButtonBackground.id = "GenericListButtonBackground"
	GenericListButtonBackground:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
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
	Text:SetOutlineRGBFromInt( 0, 0 )
	Text:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 20, _1080p * -70, _1080p * -11, _1080p * 11 )
	self:addElement( Text )
	self.Text = Text
	
	local Lock = nil
	
	Lock = LUI.UIImage.new()
	Lock.id = "Lock"
	Lock:SetAlpha( 0, 0 )
	Lock:setImage( RegisterMaterial( "icon_slot_locked" ), 0 )
	Lock:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -32, _1080p * -6, _1080p * -13, _1080p * 13 )
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
			},
			{
				function ()
					return self.Text:SetAlpha( 1, 0 )
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
		
		Text:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.Text:SetRGBFromTable( SWATCHES.genericButton.textDisabled, 0 )
				end
			},
			{
				function ()
					return self.Text:SetAlpha( 0.5, 0 )
				end
			}
		} )
		self._sequences.Locked = function ()
			Text:AnimateSequence( "Locked" )
		end
		
		Text:RegisterAnimationSequence( "NewNotification", {
			{
				function ()
					return self.Text:SetRGBFromTable( SWATCHES.genericButton.contentFocus, 0 )
				end
			}
		} )
		self._sequences.NewNotification = function ()
			Text:AnimateSequence( "NewNotification" )
		end
		
		Text:RegisterAnimationSequence( "ButtonOverDisabled", {
			{
				function ()
					return self.Text:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Text:SetRGBFromInt( 0, 0 )
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
			Lock:AnimateSequence( "ButtonOverDisabled" )
		end
		
		Text:RegisterAnimationSequence( "ButtonUpDisabled", {
			{
				function ()
					return self.Text:SetRGBFromInt( 12566463, 0, LUI.EASING.inQuadratic )
				end
			},
			{
				function ()
					return self.Text:SetAlpha( 1, 0, LUI.EASING.inQuadratic )
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
		
	end
	
	self._animationSets.ThirdGameMode = function ()
		GenericListButtonBackground:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.GenericListButtonBackground:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 322, 0, 0, 0 )
				end
			}
		} )
		Text:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Text:SetRGBFromTable( SWATCHES.text.primaryText, 0 )
				end
			},
			{
				function ()
					return self.Text:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 20, _1080p * 317, _1080p * -11, _1080p * 11, 0 )
				end
			}
		} )
		Lock:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Lock:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 332, _1080p * 358, _1080p * -13, _1080p * 13, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			GenericListButtonBackground:AnimateSequence( "DefaultSequence" )
			Text:AnimateSequence( "DefaultSequence" )
			Lock:AnimateSequence( "DefaultSequence" )
		end
		
		Text:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Text:SetRGBFromTable( SWATCHES.genericButton.contentFocus, 0 )
				end
			},
			{
				function ()
					return self.Text:SetAlpha( 1, 0 )
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
					return self.Text:SetRGBFromTable( SWATCHES.text.primaryText, 0 )
				end
			},
			{
				function ()
					return self.Text:SetAlpha( 1, 0 )
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
		
		Text:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.Text:SetRGBFromTable( SWATCHES.text.primaryText, 0 )
				end
			},
			{
				function ()
					return self.Text:SetAlpha( 0.5, 0 )
				end
			}
		} )
		self._sequences.Locked = function ()
			Text:AnimateSequence( "Locked" )
		end
		
		Text:RegisterAnimationSequence( "NewNotification", {
			{
				function ()
					return self.Text:SetRGBFromTable( SWATCHES.genericButton.contentFocus, 0 )
				end
			}
		} )
		self._sequences.NewNotification = function ()
			Text:AnimateSequence( "NewNotification" )
		end
		
		Text:RegisterAnimationSequence( "ButtonOverDisabled", {
			{
				function ()
					return self.Text:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Text:SetRGBFromTable( SWATCHES.text.primaryText, 0 )
				end
			}
		} )
		Lock:RegisterAnimationSequence( "ButtonOverDisabled", {
			{
				function ()
					return self.Lock:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.ButtonOverDisabled = function ()
			Text:AnimateSequence( "ButtonOverDisabled" )
			Lock:AnimateSequence( "ButtonOverDisabled" )
		end
		
		Text:RegisterAnimationSequence( "ButtonUpDisabled", {
			{
				function ()
					return self.Text:SetRGBFromTable( SWATCHES.text.primaryText, 0, LUI.EASING.inQuadratic )
				end
			},
			{
				function ()
					return self.Text:SetAlpha( 1, 0, LUI.EASING.inQuadratic )
				end
			}
		} )
		Lock:RegisterAnimationSequence( "ButtonUpDisabled", {
			{
				function ()
					return self.Lock:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.ButtonUpDisabled = function ()
			Text:AnimateSequence( "ButtonUpDisabled" )
			Lock:AnimateSequence( "ButtonUpDisabled" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f10_local1, controller )
	return self
end

MenuBuilder.registerType( "MenuButton", MenuButton )
LockTable( _M )
