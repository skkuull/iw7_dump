local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0 )
	assert( f1_arg0.Label )
	f1_arg0.SetText = function ( f2_arg0, f2_arg1 )
		f2_arg0.Label:setText( f2_arg1 )
	end
	
	f1_arg0:RegisterAnimationSequence( "intro", {
		{
			function ()
				return f1_arg0:SetAlpha( 1 )
			end,
			function ()
				return f1_arg0:SetAlpha( 1, 10 + 150 * math.random() )
			end,
			function ()
				return f1_arg0:SetAlpha( 0, 20 + 50 * math.random() )
			end,
			function ()
				return f1_arg0:SetAlpha( 1, 20 + 50 * math.random() )
			end,
			function ()
				return f1_arg0:SetAlpha( 0, 20 + 50 * math.random() )
			end,
			function ()
				return f1_arg0:SetAlpha( 1, 20 + 50 * math.random() )
			end,
			function ()
				return f1_arg0:SetAlpha( 1, 20 + 50 * math.random() )
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
end

function PopupButtonLoadout( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 400 * _1080p, 0, 30 * _1080p )
	self.id = "PopupButtonLoadout"
	self._animationSets = {}
	self._sequences = {}
	local f12_local1 = controller and controller.controllerIndex
	if not f12_local1 and not Engine.InFrontend() then
		f12_local1 = self:getRootController()
	end
	assert( f12_local1 )
	local f12_local2 = self
	local GenericListButtonBackground = nil
	
	GenericListButtonBackground = MenuBuilder.BuildRegisteredType( "GenericListButtonBackground", {
		controllerIndex = f12_local1
	} )
	GenericListButtonBackground.id = "GenericListButtonBackground"
	GenericListButtonBackground.DropShadow:SetAlpha( 0, 0 )
	GenericListButtonBackground:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( GenericListButtonBackground )
	self.GenericListButtonBackground = GenericListButtonBackground
	
	local f12_local4 = nil
	if CONDITIONS.IsThirdGameMode( self ) then
		f12_local4 = LUI.UIImage.new()
		f12_local4.id = "CPButtonOffState"
		f12_local4:SetRGBFromTable( SWATCHES.genericButton.border, 0 )
		f12_local4:SetAlpha( 0, 0 )
		self:addElement( f12_local4 )
		self.CPButtonOffState = f12_local4
	end
	local f12_local5 = nil
	if CONDITIONS.IsThirdGameMode( self ) then
		f12_local5 = LUI.UIImage.new()
		f12_local5.id = "CPPopupGlow"
		f12_local5:SetAlpha( 0, 0 )
		f12_local5:setImage( RegisterMaterial( "cp_menu_popup_button_on" ), 0 )
		f12_local5:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -20, _1080p * 20, _1080p * -12, _1080p * 12 )
		self:addElement( f12_local5 )
		self.CPPopupGlow = f12_local5
	end
	local Label = nil
	
	Label = LUI.UIText.new()
	Label.id = "Label"
	Label:SetRGBFromInt( 14277081, 0 )
	Label:setText( Engine.Localize( "MENU_NEW" ), 0 )
	Label:SetFontSize( 22 * _1080p )
	Label:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Label:SetAlignment( LUI.Alignment.Left )
	Label:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 20, _1080p * -30, _1080p * -11, _1080p * 11 )
	self:addElement( Label )
	self.Label = Label
	
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
		
		Label:RegisterAnimationSequence( "Focused", {
			{
				function ()
					return self.Label:SetRGBFromInt( 0, 0 )
				end
			},
			{
				function ()
					return self.Label:SetAlpha( 1, 0 )
				end
			}
		} )
		Lock:RegisterAnimationSequence( "Focused", {
			{
				function ()
					return self.Lock:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Focused = function ()
			Label:AnimateSequence( "Focused" )
			Lock:AnimateSequence( "Focused" )
		end
		
		Label:RegisterAnimationSequence( "NotFocused", {
			{
				function ()
					return self.Label:SetRGBFromInt( 14277081, 0, LUI.EASING.inQuadratic )
				end
			},
			{
				function ()
					return self.Label:SetAlpha( 1, 0, LUI.EASING.inQuadratic )
				end
			}
		} )
		Lock:RegisterAnimationSequence( "NotFocused", {
			{
				function ()
					return self.Lock:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.NotFocused = function ()
			Label:AnimateSequence( "NotFocused" )
			Lock:AnimateSequence( "NotFocused" )
		end
		
		Label:RegisterAnimationSequence( "NotFocusedDisabled", {
			{
				function ()
					return self.Label:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Label:SetRGBFromInt( 12566463, 0 )
				end
			}
		} )
		Lock:RegisterAnimationSequence( "NotFocusedDisabled", {
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
		self._sequences.NotFocusedDisabled = function ()
			Label:AnimateSequence( "NotFocusedDisabled" )
			Lock:AnimateSequence( "NotFocusedDisabled" )
		end
		
		Label:RegisterAnimationSequence( "FocusedDisabled", {
			{
				function ()
					return self.Label:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Label:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		Lock:RegisterAnimationSequence( "FocusedDisabled", {
			{
				function ()
					return self.Lock:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		self._sequences.FocusedDisabled = function ()
			Label:AnimateSequence( "FocusedDisabled" )
			Lock:AnimateSequence( "FocusedDisabled" )
		end
		
	end
	
	self._animationSets.CP = function ()
		GenericListButtonBackground:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.GenericListButtonBackground:SetAlpha( 0, 0 )
				end
			}
		} )
		if CONDITIONS.IsThirdGameMode( self ) then
			f12_local4:RegisterAnimationSequence( "DefaultSequence", {
				{
					function ()
						return self.CPButtonOffState:SetAlpha( 0.6, 0 )
					end
				}
			} )
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f12_local5:RegisterAnimationSequence( "DefaultSequence", {
				{
					function ()
						return self.CPPopupGlow:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		Label:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Label:SetAlpha( 0.6, 0 )
				end
			}
		} )
		Lock:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Lock:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			GenericListButtonBackground:AnimateSequence( "DefaultSequence" )
			if CONDITIONS.IsThirdGameMode( self ) then
				f12_local4:AnimateSequence( "DefaultSequence" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f12_local5:AnimateSequence( "DefaultSequence" )
			end
			Label:AnimateSequence( "DefaultSequence" )
			Lock:AnimateSequence( "DefaultSequence" )
		end
		
		GenericListButtonBackground:RegisterAnimationSequence( "Focused", {
			{
				function ()
					return self.GenericListButtonBackground:SetAlpha( 0, 0 )
				end
			}
		} )
		if CONDITIONS.IsThirdGameMode( self ) then
			f12_local4:RegisterAnimationSequence( "Focused", {
				{
					function ()
						return self.CPButtonOffState:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f12_local5:RegisterAnimationSequence( "Focused", {
				{
					function ()
						return self.CPPopupGlow:SetAlpha( 1, 0 )
					end,
					function ()
						return self.CPPopupGlow:SetAlpha( 0.7, 1000, LUI.EASING.inQuadratic )
					end,
					function ()
						return self.CPPopupGlow:SetAlpha( 1, 1000, LUI.EASING.outQuadratic )
					end
				}
			} )
		end
		Label:RegisterAnimationSequence( "Focused", {
			{
				function ()
					return self.Label:SetRGBFromInt( 16777215, 0 )
				end
			},
			{
				function ()
					return self.Label:SetAlpha( 1, 0 )
				end
			}
		} )
		Lock:RegisterAnimationSequence( "Focused", {
			{
				function ()
					return self.Lock:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Focused = function ()
			GenericListButtonBackground:AnimateLoop( "Focused" )
			if CONDITIONS.IsThirdGameMode( self ) then
				f12_local4:AnimateLoop( "Focused" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f12_local5:AnimateLoop( "Focused" )
			end
			Label:AnimateLoop( "Focused" )
			Lock:AnimateLoop( "Focused" )
		end
		
		GenericListButtonBackground:RegisterAnimationSequence( "NotFocused", {
			{
				function ()
					return self.GenericListButtonBackground:SetAlpha( 0, 0 )
				end
			}
		} )
		if CONDITIONS.IsThirdGameMode( self ) then
			f12_local4:RegisterAnimationSequence( "NotFocused", {
				{
					function ()
						return self.CPButtonOffState:SetAlpha( 0.6, 0 )
					end
				}
			} )
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f12_local5:RegisterAnimationSequence( "NotFocused", {
				{
					function ()
						return self.CPPopupGlow:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		Label:RegisterAnimationSequence( "NotFocused", {
			{
				function ()
					return self.Label:SetRGBFromInt( 14277081, 0, LUI.EASING.inQuadratic )
				end
			},
			{
				function ()
					return self.Label:SetAlpha( 0.6, 0, LUI.EASING.inQuadratic )
				end
			}
		} )
		Lock:RegisterAnimationSequence( "NotFocused", {
			{
				function ()
					return self.Lock:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.NotFocused = function ()
			GenericListButtonBackground:AnimateSequence( "NotFocused" )
			if CONDITIONS.IsThirdGameMode( self ) then
				f12_local4:AnimateSequence( "NotFocused" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f12_local5:AnimateSequence( "NotFocused" )
			end
			Label:AnimateSequence( "NotFocused" )
			Lock:AnimateSequence( "NotFocused" )
		end
		
		GenericListButtonBackground:RegisterAnimationSequence( "NotFocusedDisabled", {
			{
				function ()
					return self.GenericListButtonBackground:SetAlpha( 1, 0 )
				end
			}
		} )
		if CONDITIONS.IsThirdGameMode( self ) then
			f12_local4:RegisterAnimationSequence( "NotFocusedDisabled", {
				{
					function ()
						return self.CPButtonOffState:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f12_local5:RegisterAnimationSequence( "NotFocusedDisabled", {
				{
					function ()
						return self.CPPopupGlow:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		Label:RegisterAnimationSequence( "NotFocusedDisabled", {
			{
				function ()
					return self.Label:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Label:SetRGBFromInt( 12566463, 0 )
				end
			}
		} )
		Lock:RegisterAnimationSequence( "NotFocusedDisabled", {
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
		self._sequences.NotFocusedDisabled = function ()
			GenericListButtonBackground:AnimateSequence( "NotFocusedDisabled" )
			if CONDITIONS.IsThirdGameMode( self ) then
				f12_local4:AnimateSequence( "NotFocusedDisabled" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f12_local5:AnimateSequence( "NotFocusedDisabled" )
			end
			Label:AnimateSequence( "NotFocusedDisabled" )
			Lock:AnimateSequence( "NotFocusedDisabled" )
		end
		
		GenericListButtonBackground:RegisterAnimationSequence( "FocusedDisabled", {
			{
				function ()
					return self.GenericListButtonBackground:SetAlpha( 1, 0 )
				end
			}
		} )
		if CONDITIONS.IsThirdGameMode( self ) then
			f12_local4:RegisterAnimationSequence( "FocusedDisabled", {
				{
					function ()
						return self.CPButtonOffState:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f12_local5:RegisterAnimationSequence( "FocusedDisabled", {
				{
					function ()
						return self.CPPopupGlow:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		Label:RegisterAnimationSequence( "FocusedDisabled", {
			{
				function ()
					return self.Label:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Label:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		Lock:RegisterAnimationSequence( "FocusedDisabled", {
			{
				function ()
					return self.Lock:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		self._sequences.FocusedDisabled = function ()
			GenericListButtonBackground:AnimateSequence( "FocusedDisabled" )
			if CONDITIONS.IsThirdGameMode( self ) then
				f12_local4:AnimateSequence( "FocusedDisabled" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f12_local5:AnimateSequence( "FocusedDisabled" )
			end
			Label:AnimateSequence( "FocusedDisabled" )
			Lock:AnimateSequence( "FocusedDisabled" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "button_over", function ( f70_arg0, f70_arg1 )
		local f70_local0 = f70_arg1.controller or f12_local1
		ACTIONS.AnimateSequence( self, "Focused" )
	end )
	self:addEventHandler( "button_up", function ( f71_arg0, f71_arg1 )
		local f71_local0 = f71_arg1.controller or f12_local1
		ACTIONS.AnimateSequence( self, "NotFocused" )
	end )
	self:addEventHandler( "button_over_disable", function ( f72_arg0, f72_arg1 )
		local f72_local0 = f72_arg1.controller or f12_local1
		ACTIONS.AnimateSequence( self, "FocusedDisabled" )
	end )
	self:addEventHandler( "button_disable", function ( f73_arg0, f73_arg1 )
		local f73_local0 = f73_arg1.controller or f12_local1
		ACTIONS.AnimateSequence( self, "NotFocusedDisabled" )
	end )
	PostLoadFunc( self, f12_local1, controller )
	if CONDITIONS.IsThirdGameMode( self ) then
		ACTIONS.SetAnimationSet( self, "CP" )
	end
	return self
end

MenuBuilder.registerType( "PopupButtonLoadout", PopupButtonLoadout )
LockTable( _M )
