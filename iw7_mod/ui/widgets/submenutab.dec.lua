local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1 )
	f1_arg0.SetName = function ( f2_arg0, f2_arg1 )
		f2_arg0.TabText:setText( f2_arg1 )
	end
	
	f1_arg0.Enable = function ( f3_arg0 )
		f3_arg0._disabled = false
		ACTIONS.AnimateSequence( f3_arg0, "Unfocused" )
	end
	
	f1_arg0.Disable = function ( f4_arg0 )
		f4_arg0._disabled = true
		ACTIONS.AnimateSequence( f4_arg0, "Disabled" )
	end
	
	f1_arg0.IsEnabled = function ( f5_arg0 )
		return not f5_arg0._disabled
	end
	
	f1_arg0:registerEventHandler( "focus_tab", function ( element, event )
		if event.index == element.index then
			if event.playSound then
				element._sequences.Focused()
			else
				element._sequences.FocusedNoSound()
			end
			element.focused = true
		elseif element.focused then
			element._sequences.UnFocused()
			element.focused = false
		end
	end )
	if not Engine.IsConsoleGame() then
		f1_arg0:SetHandleMouse( true )
		f1_arg0:registerEventHandler( "mouseenter", function ( element, event )
			if not element.focused then
				if not element._disabled then
					element._sequences.Highlighted()
				else
					element._sequences.Focused()
				end
			end
		end )
		f1_arg0:registerEventHandler( "mouseleave", function ( element, event )
			if element.focused and not element._disabled then
				element._sequences.FocusedNoSound()
			else
				element._sequences.UnFocused()
			end
		end )
		f1_arg0:registerEventHandler( "leftmousedown", function ( element, event )
			
		end )
		f1_arg0:registerEventHandler( "leftmouseup", function ( element, event )
			if event.inside and not element._disabled then
				element:playSound( "menu_open" )
				element:dispatchEventToCurrentMenu( {
					name = "tab_mouse_select",
					index = element.index
				} )
			end
		end )
	end
	f1_arg0:registerEventHandler( "tab_disable_blur", function ( element, event )
		ACTIONS.AnimateSequence( element, "NoBlur" )
	end )
	f1_arg0:SubscribeToModelThroughElement( f1_arg0, "disabled", function ( f12_arg0 )
		if DataModel.GetModelValue( f12_arg0 ) then
			f1_arg0:Disable()
		end
	end )
end

function SubMenuTab( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 180 * _1080p, 0, 30 * _1080p )
	self.id = "SubMenuTab"
	self._animationSets = {}
	self._sequences = {}
	local f13_local1 = controller and controller.controllerIndex
	if not f13_local1 and not Engine.InFrontend() then
		f13_local1 = self:getRootController()
	end
	assert( f13_local1 )
	local f13_local2 = self
	local BackGroundImage = nil
	
	BackGroundImage = LUI.UIImage.new()
	BackGroundImage.id = "BackGroundImage"
	BackGroundImage:SetRGBFromInt( 12566463, 0 )
	BackGroundImage:SetAlpha( 0, 0 )
	self:addElement( BackGroundImage )
	self.BackGroundImage = BackGroundImage
	
	local BlurBackground = nil
	
	BlurBackground = LUI.UIBlur.new()
	BlurBackground.id = "BlurBackground"
	BlurBackground:SetRGBFromInt( 12566463, 0 )
	BlurBackground:SetBlurStrength( 2.5, 0 )
	self:addElement( BlurBackground )
	self.BlurBackground = BlurBackground
	
	local f13_local5 = nil
	if CONDITIONS.IsThirdGameMode( self ) then
		f13_local5 = LUI.UIImage.new()
		f13_local5.id = "BackgroundRightCP"
		f13_local5:SetRGBFromTable( SWATCHES.Zombies.fateCardLightBar, 0 )
		f13_local5:SetAlpha( 0, 0 )
		f13_local5:setImage( RegisterMaterial( "widg_gradient_left_to_right" ), 0 )
		f13_local5:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -50, _1080p * 20, 0, 0 )
		self:addElement( f13_local5 )
		self.BackgroundRightCP = f13_local5
	end
	local f13_local6 = nil
	if CONDITIONS.IsThirdGameMode( self ) then
		f13_local6 = LUI.UIImage.new()
		f13_local6.id = "BackgroundLeftCP"
		f13_local6:SetRGBFromTable( SWATCHES.Zombies.fateCardLightBar, 0 )
		f13_local6:SetAlpha( 0, 0 )
		f13_local6:SetZRotation( 180, 0 )
		f13_local6:setImage( RegisterMaterial( "widg_gradient_left_to_right" ), 0 )
		f13_local6:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -20, _1080p * 50, 0, 0 )
		self:addElement( f13_local6 )
		self.BackgroundLeftCP = f13_local6
	end
	local BackgroundCenter = nil
	
	BackgroundCenter = LUI.UIImage.new()
	BackgroundCenter.id = "BackgroundCenter"
	BackgroundCenter:SetRGBFromTable( SWATCHES.Zombies.fateCardLightBar, 0 )
	BackgroundCenter:SetAlpha( 0, 0 )
	BackgroundCenter:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 50, _1080p * -50, 0, 0 )
	self:addElement( BackgroundCenter )
	self.BackgroundCenter = BackgroundCenter
	
	local GradientDownTop = nil
	
	GradientDownTop = LUI.UIImage.new()
	GradientDownTop.id = "GradientDownTop"
	GradientDownTop:SetRGBFromTable( SWATCHES.genericButton.backgroundFocus, 0 )
	GradientDownTop:SetAlpha( 0.25, 0 )
	GradientDownTop:setImage( RegisterMaterial( "widg_gradient_bottom_to_top" ), 0 )
	GradientDownTop:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, _1080p * -4 )
	self:addElement( GradientDownTop )
	self.GradientDownTop = GradientDownTop
	
	local TabText = nil
	
	TabText = LUI.UIStyledText.new()
	TabText.id = "TabText"
	TabText:SetRGBFromTable( SWATCHES.tabManager.tabText, 0 )
	TabText:SetAlpha( 0.8, 0 )
	TabText:SetFontSize( 20 * _1080p )
	TabText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	TabText:SetAlignment( LUI.Alignment.Center )
	TabText:SetStartupDelay( 1250 )
	TabText:SetLineHoldTime( 400 )
	TabText:SetAnimMoveTime( 300 )
	TabText:SetEndDelay( 1000 )
	TabText:SetCrossfadeTime( 500 )
	TabText:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	TabText:SetMaxVisibleLines( 1 )
	TabText:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 3, _1080p * -3, _1080p * -12, _1080p * 8 )
	TabText:SubscribeToModelThroughElement( self, "name", function ()
		local f14_local0 = self:GetDataSource()
		f14_local0 = f14_local0.name:GetValue( f13_local1 )
		if f14_local0 ~= nil then
			TabText:setText( ToUpperCase( f14_local0 ), 0 )
		end
	end )
	self:addElement( TabText )
	self.TabText = TabText
	
	local DisabledIcon = nil
	
	DisabledIcon = LUI.UIImage.new()
	DisabledIcon.id = "DisabledIcon"
	DisabledIcon:SetAlpha( 0, 0 )
	DisabledIcon:SetZRotation( 2, 0 )
	DisabledIcon:SetUseAA( true )
	DisabledIcon:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * -1, _1080p * 1 )
	self:addElement( DisabledIcon )
	self.DisabledIcon = DisabledIcon
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		BackGroundImage:RegisterAnimationSequence( "Focused", {
			{
				function ()
					return self.BackGroundImage:SetRGBFromInt( 16777215, 30 )
				end
			}
		} )
		BlurBackground:RegisterAnimationSequence( "Focused", {
			{
				function ()
					return self.BlurBackground:SetBlurStrength( 0, 30 )
				end
			},
			{
				function ()
					return self.BlurBackground:SetRGBFromInt( 16777215, 30 )
				end
			},
			{
				function ()
					return self.BlurBackground:playSound( "tabHighlight", false, 30 )
				end
			}
		} )
		TabText:RegisterAnimationSequence( "Focused", {
			{
				function ()
					return self.TabText:SetRGBFromTable( SWATCHES.tabManager.tabTextFocused, 30 )
				end
			},
			{
				function ()
					return self.TabText:SetAlpha( 1, 30 )
				end
			}
		} )
		self._sequences.Focused = function ()
			BackGroundImage:AnimateSequence( "Focused" )
			BlurBackground:AnimateSequence( "Focused" )
			TabText:AnimateSequence( "Focused" )
		end
		
		BackGroundImage:RegisterAnimationSequence( "UnFocused", {
			{
				function ()
					return self.BackGroundImage:SetRGBFromInt( 12566463, 200 )
				end
			}
		} )
		BlurBackground:RegisterAnimationSequence( "UnFocused", {
			{
				function ()
					return self.BlurBackground:SetRGBFromInt( 12566463, 200 )
				end
			},
			{
				function ()
					return self.BlurBackground:SetBlurStrength( 2.5, 200 )
				end
			}
		} )
		TabText:RegisterAnimationSequence( "UnFocused", {
			{
				function ()
					return self.TabText:SetRGBFromTable( SWATCHES.tabManager.tabText, 200 )
				end
			},
			{
				function ()
					return self.TabText:SetAlpha( 0.8, 200 )
				end
			}
		} )
		self._sequences.UnFocused = function ()
			BackGroundImage:AnimateSequence( "UnFocused" )
			BlurBackground:AnimateSequence( "UnFocused" )
			TabText:AnimateSequence( "UnFocused" )
		end
		
		self._sequences.Locked = function ()
			
		end
		
		TabText:RegisterAnimationSequence( "Disabled", {
			{
				function ()
					return self.TabText:SetAlpha( 0.5, 0 )
				end
			}
		} )
		DisabledIcon:RegisterAnimationSequence( "Disabled", {
			{
				function ()
					return self.DisabledIcon:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.Disabled = function ()
			TabText:AnimateSequence( "Disabled" )
			DisabledIcon:AnimateSequence( "Disabled" )
		end
		
		BackGroundImage:RegisterAnimationSequence( "Highlighted", {
			{
				function ()
					return self.BackGroundImage:SetRGBFromInt( 12566463, 30 )
				end
			}
		} )
		BlurBackground:RegisterAnimationSequence( "Highlighted", {
			{
				function ()
					return self.BlurBackground:SetBlurStrength( 0, 30 )
				end
			},
			{
				function ()
					return self.BlurBackground:SetRGBFromInt( 11645361, 30 )
				end
			},
			{
				function ()
					return self.BlurBackground:playSound( "tabHighlight", false, 30 )
				end
			}
		} )
		TabText:RegisterAnimationSequence( "Highlighted", {
			{
				function ()
					return self.TabText:SetRGBFromTable( SWATCHES.tabManager.tabTextFocused, 30 )
				end
			},
			{
				function ()
					return self.TabText:SetAlpha( 1, 30 )
				end
			}
		} )
		self._sequences.Highlighted = function ()
			BackGroundImage:AnimateSequence( "Highlighted" )
			BlurBackground:AnimateSequence( "Highlighted" )
			TabText:AnimateSequence( "Highlighted" )
		end
		
		BackGroundImage:RegisterAnimationSequence( "FocusedNoSound", {
			{
				function ()
					return self.BackGroundImage:SetRGBFromInt( 16777215, 30 )
				end
			}
		} )
		BlurBackground:RegisterAnimationSequence( "FocusedNoSound", {
			{
				function ()
					return self.BlurBackground:SetBlurStrength( 0, 30 )
				end
			},
			{
				function ()
					return self.BlurBackground:SetRGBFromInt( 16777215, 30 )
				end
			}
		} )
		TabText:RegisterAnimationSequence( "FocusedNoSound", {
			{
				function ()
					return self.TabText:SetRGBFromTable( SWATCHES.tabManager.tabTextFocused, 30 )
				end
			},
			{
				function ()
					return self.TabText:SetAlpha( 1, 30 )
				end
			}
		} )
		self._sequences.FocusedNoSound = function ()
			BackGroundImage:AnimateSequence( "FocusedNoSound" )
			BlurBackground:AnimateSequence( "FocusedNoSound" )
			TabText:AnimateSequence( "FocusedNoSound" )
		end
		
		BackGroundImage:RegisterAnimationSequence( "NoBlur", {
			{
				function ()
					return self.BackGroundImage:SetAlpha( 1, 0 )
				end
			}
		} )
		BlurBackground:RegisterAnimationSequence( "NoBlur", {
			{
				function ()
					return self.BlurBackground:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.NoBlur = function ()
			BackGroundImage:AnimateSequence( "NoBlur" )
			BlurBackground:AnimateSequence( "NoBlur" )
		end
		
	end
	
	self._animationSets.CPAnimationSet = function ()
		BlurBackground:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.BlurBackground:SetAlpha( 0, 0 )
				end
			}
		} )
		GradientDownTop:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.GradientDownTop:SetAlpha( 0, 0 )
				end
			}
		} )
		TabText:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.TabText:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * -10, _1080p * 10, 0 )
				end
			}
		} )
		DisabledIcon:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.DisabledIcon:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			BlurBackground:AnimateSequence( "DefaultSequence" )
			GradientDownTop:AnimateSequence( "DefaultSequence" )
			TabText:AnimateSequence( "DefaultSequence" )
			DisabledIcon:AnimateSequence( "DefaultSequence" )
		end
		
		if CONDITIONS.IsThirdGameMode( self ) then
			f13_local5:RegisterAnimationSequence( "Focused", {
				{
					function ()
						return self.BackgroundRightCP:SetAlpha( 1, 0 )
					end
				}
			} )
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f13_local6:RegisterAnimationSequence( "Focused", {
				{
					function ()
						return self.BackgroundLeftCP:SetAlpha( 1, 0 )
					end
				},
				{
					function ()
						return self.BackgroundLeftCP:playSound( "tabHighlight", false, 0 )
					end
				}
			} )
		end
		BackgroundCenter:RegisterAnimationSequence( "Focused", {
			{
				function ()
					return self.BackgroundCenter:SetAlpha( 1, 0 )
				end
			}
		} )
		TabText:RegisterAnimationSequence( "Focused", {
			{
				function ()
					return self.TabText:SetRGBFromInt( 16745216, 0 )
				end
			},
			{
				function ()
					return self.TabText:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.Focused = function ()
			if CONDITIONS.IsThirdGameMode( self ) then
				f13_local5:AnimateSequence( "Focused" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f13_local6:AnimateSequence( "Focused" )
			end
			BackgroundCenter:AnimateSequence( "Focused" )
			TabText:AnimateSequence( "Focused" )
		end
		
		if CONDITIONS.IsThirdGameMode( self ) then
			f13_local5:RegisterAnimationSequence( "UnFocused", {
				{
					function ()
						return self.BackgroundRightCP:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f13_local6:RegisterAnimationSequence( "UnFocused", {
				{
					function ()
						return self.BackgroundLeftCP:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		BackgroundCenter:RegisterAnimationSequence( "UnFocused", {
			{
				function ()
					return self.BackgroundCenter:SetAlpha( 0, 0 )
				end
			}
		} )
		TabText:RegisterAnimationSequence( "UnFocused", {
			{
				function ()
					return self.TabText:SetAlpha( 0.75, 0 )
				end
			},
			{
				function ()
					return self.TabText:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		self._sequences.UnFocused = function ()
			if CONDITIONS.IsThirdGameMode( self ) then
				f13_local5:AnimateSequence( "UnFocused" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f13_local6:AnimateSequence( "UnFocused" )
			end
			BackgroundCenter:AnimateSequence( "UnFocused" )
			TabText:AnimateSequence( "UnFocused" )
		end
		
		self._sequences.Locked = function ()
			
		end
		
		TabText:RegisterAnimationSequence( "Disabled", {
			{
				function ()
					return self.TabText:SetAlpha( 0.5, 0 )
				end
			}
		} )
		DisabledIcon:RegisterAnimationSequence( "Disabled", {
			{
				function ()
					return self.DisabledIcon:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.Disabled = function ()
			TabText:AnimateSequence( "Disabled" )
			DisabledIcon:AnimateSequence( "Disabled" )
		end
		
		if CONDITIONS.IsThirdGameMode( self ) then
			f13_local5:RegisterAnimationSequence( "Highlighted", {
				{
					function ()
						return self.BackgroundRightCP:SetAlpha( 1, 0 )
					end
				}
			} )
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f13_local6:RegisterAnimationSequence( "Highlighted", {
				{
					function ()
						return self.BackgroundLeftCP:SetAlpha( 1, 0 )
					end
				}
			} )
		end
		BackgroundCenter:RegisterAnimationSequence( "Highlighted", {
			{
				function ()
					return self.BackgroundCenter:SetAlpha( 1, 0 )
				end
			}
		} )
		TabText:RegisterAnimationSequence( "Highlighted", {
			{
				function ()
					return self.TabText:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.TabText:SetRGBFromInt( 16745216, 0 )
				end
			}
		} )
		self._sequences.Highlighted = function ()
			if CONDITIONS.IsThirdGameMode( self ) then
				f13_local5:AnimateSequence( "Highlighted" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f13_local6:AnimateSequence( "Highlighted" )
			end
			BackgroundCenter:AnimateSequence( "Highlighted" )
			TabText:AnimateSequence( "Highlighted" )
		end
		
		if CONDITIONS.IsThirdGameMode( self ) then
			f13_local5:RegisterAnimationSequence( "FocusedNoSound", {
				{
					function ()
						return self.BackgroundRightCP:SetAlpha( 1, 0 )
					end
				}
			} )
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f13_local6:RegisterAnimationSequence( "FocusedNoSound", {
				{
					function ()
						return self.BackgroundLeftCP:SetAlpha( 1, 0 )
					end
				}
			} )
		end
		BackgroundCenter:RegisterAnimationSequence( "FocusedNoSound", {
			{
				function ()
					return self.BackgroundCenter:SetAlpha( 1, 0 )
				end
			}
		} )
		TabText:RegisterAnimationSequence( "FocusedNoSound", {
			{
				function ()
					return self.TabText:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.TabText:SetRGBFromInt( 16745216, 0 )
				end
			}
		} )
		self._sequences.FocusedNoSound = function ()
			if CONDITIONS.IsThirdGameMode( self ) then
				f13_local5:AnimateSequence( "FocusedNoSound" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f13_local6:AnimateSequence( "FocusedNoSound" )
			end
			BackgroundCenter:AnimateSequence( "FocusedNoSound" )
			TabText:AnimateSequence( "FocusedNoSound" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local0( self, f13_local1, controller )
	if CONDITIONS.IsThirdGameMode( self ) then
		ACTIONS.SetAnimationSet( self, "CPAnimationSet" )
	end
	return self
end

MenuBuilder.registerType( "SubMenuTab", SubMenuTab )
LockTable( _M )
