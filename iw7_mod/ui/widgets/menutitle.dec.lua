local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = f1_arg0.MenuTitle
	f1_arg0:addEventHandler( "menu_create", function ( f2_arg0, f2_arg1 )
		if IsLanguageJapanese() or IsLanguageChinese() or IsLanguageArabic() then
			f1_local0:SetTop( _1080p * 23 )
			f1_local0:SetBottom( _1080p * 59 )
		end
	end )
	if Engine.IsAliensMode() then
		f1_local0:SetFontSize( 64 * _1080p )
		f1_local0:SetFont( FONTS.GetFont( FONTS.ZmClean.File ) )
	elseif Engine.IsMultiplayer() then
		f1_local0:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	else
		f1_local0:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	end
end

function MenuTitle( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 960 * _1080p, 0, 80 * _1080p )
	self.id = "MenuTitle"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local f3_local3 = nil
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		f3_local3 = LUI.UIImage.new()
		f3_local3.id = "MPBackerImage"
		f3_local3:setImage( RegisterMaterial( "menu_header" ), 0 )
		f3_local3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -19, _1080p * 1005, _1080p * -1.5, _1080p * 126.5 )
		self:addElement( f3_local3 )
		self.MPBackerImage = f3_local3
	end
	local f3_local4 = nil
	if not CONDITIONS.IsCoreMultiplayer( self ) then
		f3_local4 = LUI.UIImage.new()
		f3_local4.id = "Darkener"
		f3_local4:SetRGBFromInt( 0, 0 )
		f3_local4:setImage( RegisterMaterial( "menu_title_darkener" ), 0 )
		f3_local4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -105, _1080p * 655, _1080p * -54, _1080p * 326 )
		self:addElement( f3_local4 )
		self.Darkener = f3_local4
	end
	local f3_local5 = nil
	if Engine.IsAliensMode() and CONDITIONS.IsThirdGameMode( self ) then
		f3_local5 = LUI.UIImage.new()
		f3_local5.id = "Gradient"
		f3_local5:SetAlpha( 0, 0 )
		f3_local5:setImage( RegisterMaterial( "cp_wepbuild_gradient_banner_1" ), 0 )
		f3_local5:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -95, 0, 0, 0 )
		self:addElement( f3_local5 )
		self.Gradient = f3_local5
	end
	local Accent = nil
	
	Accent = LUI.UIImage.new()
	Accent.id = "Accent"
	Accent:SetRGBFromInt( 0, 0 )
	Accent:SetAlpha( 0.2, 0 )
	Accent:setImage( RegisterMaterial( "widg_gradient_left_to_right" ), 0 )
	Accent:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * -105, _1080p * -470, 0, _1080p * 16 )
	self:addElement( Accent )
	self.Accent = Accent
	
	local MenuTitle = nil
	
	MenuTitle = LUI.UIStyledText.new()
	MenuTitle.id = "MenuTitle"
	MenuTitle:SetAlpha( 0.8, 0 )
	MenuTitle:setText( "", 0 )
	MenuTitle:SetFontSize( 50 * _1080p )
	MenuTitle:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	MenuTitle:SetAlignment( LUI.Alignment.Left )
	MenuTitle:SetOptOutRightToLeftAlignmentFlip( true )
	MenuTitle:SetStartupDelay( 1250 )
	MenuTitle:SetLineHoldTime( 400 )
	MenuTitle:SetAnimMoveTime( 300 )
	MenuTitle:SetEndDelay( 1000 )
	MenuTitle:SetCrossfadeTime( 500 )
	MenuTitle:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	MenuTitle:SetMaxVisibleLines( 1 )
	MenuTitle:SetDecodeLetterLength( 25 )
	MenuTitle:SetDecodeMaxRandChars( 3 )
	MenuTitle:SetDecodeUpdatesPerLetter( 4 )
	MenuTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 93, _1080p * 473, _1080p * 13, _1080p * 63 )
	self:addElement( MenuTitle )
	self.MenuTitle = MenuTitle
	
	local MenuBreadcrumbs = nil
	
	MenuBreadcrumbs = LUI.UIStyledText.new()
	MenuBreadcrumbs.id = "MenuBreadcrumbs"
	MenuBreadcrumbs:setText( "", 0 )
	MenuBreadcrumbs:SetFontSize( 16 * _1080p )
	MenuBreadcrumbs:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	MenuBreadcrumbs:SetAlignment( LUI.Alignment.Left )
	MenuBreadcrumbs:SetOptOutRightToLeftAlignmentFlip( true )
	MenuBreadcrumbs:SetDecodeLetterLength( 20 )
	MenuBreadcrumbs:SetDecodeMaxRandChars( 6 )
	MenuBreadcrumbs:SetDecodeUpdatesPerLetter( 4 )
	MenuBreadcrumbs:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 94, _1080p * -304, 0, _1080p * 16 )
	self:addElement( MenuBreadcrumbs )
	self.MenuBreadcrumbs = MenuBreadcrumbs
	
	local Divider = nil
	
	Divider = LUI.UIImage.new()
	Divider.id = "Divider"
	Divider:SetAlpha( 0.8, 0 )
	Divider:setImage( RegisterMaterial( "widg_gradient_left_to_right" ), 0 )
	Divider:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 90, _1080p * 490, _1080p * 16, _1080p * 17 )
	self:addElement( Divider )
	self.Divider = Divider
	
	local TicBR = nil
	
	TicBR = LUI.UIImage.new()
	TicBR.id = "TicBR"
	TicBR:SetAlpha( 0.8, 0 )
	TicBR:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 482, _1080p * 492, _1080p * 68, _1080p * 70 )
	self:addElement( TicBR )
	self.TicBR = TicBR
	
	local TicuR = nil
	
	TicuR = LUI.UIImage.new()
	TicuR.id = "TicuR"
	TicuR:SetAlpha( 0.8, 0 )
	TicuR:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 482, _1080p * 492, _1080p * -4.5, _1080p * -2.5 )
	self:addElement( TicuR )
	self.TicuR = TicuR
	
	local Icon = nil
	
	Icon = LUI.UIImage.new()
	Icon.id = "Icon"
	Icon:setImage( RegisterMaterial( "gamemode_generic" ), 0 )
	Icon:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 90, _1080p * -28.5, _1080p * 61.5 )
	self:addElement( Icon )
	self.Icon = Icon
	
	local f3_local13 = nil
	if CONDITIONS.IsThirdGameMode( self ) then
		f3_local13 = LUI.UIImage.new()
		f3_local13.id = "CPTitleLineRed"
		f3_local13:SetRGBFromTable( SWATCHES.Zombies.fateCardLightBar, 0 )
		f3_local13:setImage( RegisterMaterial( "cp_menu_title_line_glow" ), 0 )
		f3_local13:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -95, _1080p * 2000, _1080p * -28, _1080p * 36 )
		self:addElement( f3_local13 )
		self.CPTitleLineRed = f3_local13
	end
	local f3_local14 = nil
	if CONDITIONS.IsThirdGameMode( self ) then
		f3_local14 = LUI.UIImage.new()
		f3_local14.id = "CPTitleLine"
		f3_local14:setImage( RegisterMaterial( "cp_menu_title_line_glow" ), 0 )
		f3_local14:SetBlendMode( BLEND_MODE.addWithAlpha )
		f3_local14:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -95, _1080p * 960, _1080p * -28, _1080p * 36 )
		self:addElement( f3_local14 )
		self.CPTitleLine = f3_local14
	end
	local f3_local15 = nil
	if CONDITIONS.IsThirdGameMode( self ) then
		f3_local15 = LUI.UIImage.new()
		f3_local15.id = "CPIconSquares"
		f3_local15:setImage( RegisterMaterial( "cp_menu_title_icon_squares" ), 0 )
		f3_local15:SetBlendMode( BLEND_MODE.addWithAlpha )
		f3_local15:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 56, _1080p * 80, _1080p * 16, _1080p * 56 )
		self:addElement( f3_local15 )
		self.CPIconSquares = f3_local15
	end
	local f3_local16 = nil
	if CONDITIONS.IsThirdGameMode( self ) then
		f3_local16 = LUI.UIImage.new()
		f3_local16.id = "CPYellowLine"
		f3_local16:SetRGBFromTable( SWATCHES.AAR.InfoHighlight, 0 )
		f3_local16:setImage( RegisterMaterial( "widg_gradient_left_to_right" ), 0 )
		f3_local16:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -95, _1080p * 1000, _1080p * 1, _1080p * 3 )
		self:addElement( f3_local16 )
		self.CPYellowLine = f3_local16
	end
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		TicBR:RegisterAnimationSequence( "Update", {
			{
				function ()
					return self.TicBR:SetAlpha( 0.8, 0 )
				end,
				function ()
					return self.TicBR:SetAlpha( 0.8, 200, LUI.EASING.inQuartic )
				end
			},
			{
				function ()
					return self.TicBR:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 482, _1080p * 492, _1080p * 68, _1080p * 70, 0 )
				end,
				function ()
					return self.TicBR:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 103, _1080p * 113, _1080p * 68, _1080p * 70, 200, LUI.EASING.inQuartic )
				end,
				function ()
					return self.TicBR:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 482, _1080p * 492, _1080p * 69, _1080p * 71, 600, LUI.EASING.outQuartic )
				end
			}
		} )
		TicuR:RegisterAnimationSequence( "Update", {
			{
				function ()
					return self.TicuR:SetAlpha( 0.8, 0 )
				end,
				function ()
					return self.TicuR:SetAlpha( 1, 200, LUI.EASING.inQuartic )
				end
			},
			{
				function ()
					return self.TicuR:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 482, _1080p * 492, _1080p * -4.5, _1080p * -2.5, 0 )
				end,
				function ()
					return self.TicuR:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 103, _1080p * 113, _1080p * -4.5, _1080p * -2.5, 200, LUI.EASING.inQuartic )
				end,
				function ()
					return self.TicuR:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 482, _1080p * 492, _1080p * -4.5, _1080p * -2.5, 600, LUI.EASING.outQuartic )
				end
			}
		} )
		self._sequences.Update = function ()
			TicBR:AnimateSequence( "Update" )
			TicuR:AnimateSequence( "Update" )
		end
		
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
			f3_local3:RegisterAnimationSequence( "MPSetup", {
				{
					function ()
						return self.MPBackerImage:SetAlpha( 1, 0 )
					end
				}
			} )
		end
		Accent:RegisterAnimationSequence( "MPSetup", {
			{
				function ()
					return self.Accent:SetAlpha( 0, 0 )
				end
			}
		} )
		MenuTitle:RegisterAnimationSequence( "MPSetup", {
			{
				function ()
					return self.MenuTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 10, _1080p * 472, _1080p * 15, _1080p * 65, 0 )
				end
			}
		} )
		MenuBreadcrumbs:RegisterAnimationSequence( "MPSetup", {
			{
				function ()
					return self.MenuBreadcrumbs:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 8, _1080p * -395, 0, _1080p * 16, 0 )
				end
			}
		} )
		Divider:RegisterAnimationSequence( "MPSetup", {
			{
				function ()
					return self.Divider:SetAlpha( 0, 0 )
				end
			}
		} )
		TicBR:RegisterAnimationSequence( "MPSetup", {
			{
				function ()
					return self.TicBR:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.TicBR:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		TicuR:RegisterAnimationSequence( "MPSetup", {
			{
				function ()
					return self.TicuR:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.TicuR:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		Icon:RegisterAnimationSequence( "MPSetup", {
			{
				function ()
					return self.Icon:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.MPSetup = function ()
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
				f3_local3:AnimateSequence( "MPSetup" )
			end
			Accent:AnimateSequence( "MPSetup" )
			MenuTitle:AnimateSequence( "MPSetup" )
			MenuBreadcrumbs:AnimateSequence( "MPSetup" )
			Divider:AnimateSequence( "MPSetup" )
			TicBR:AnimateSequence( "MPSetup" )
			TicuR:AnimateSequence( "MPSetup" )
			Icon:AnimateSequence( "MPSetup" )
		end
		
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
			f3_local3:RegisterAnimationSequence( "Setup", {
				{
					function ()
						return self.MPBackerImage:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		Accent:RegisterAnimationSequence( "Setup", {
			{
				function ()
					return self.Accent:SetAlpha( 0.2, 0 )
				end
			}
		} )
		MenuTitle:RegisterAnimationSequence( "Setup", {
			{
				function ()
					return self.MenuTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 93, _1080p * 780, _1080p * 13, _1080p * 63, 0 )
				end
			}
		} )
		MenuBreadcrumbs:RegisterAnimationSequence( "Setup", {
			{
				function ()
					return self.MenuBreadcrumbs:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 94, _1080p * -304, 0, _1080p * 16, 0 )
				end
			}
		} )
		Divider:RegisterAnimationSequence( "Setup", {
			{
				function ()
					return self.Divider:SetAlpha( 0.8, 0 )
				end
			}
		} )
		TicBR:RegisterAnimationSequence( "Setup", {
			{
				function ()
					return self.TicBR:SetRGBFromInt( 16777215, 0 )
				end
			},
			{
				function ()
					return self.TicBR:SetAlpha( 0.8, 0 )
				end
			}
		} )
		TicuR:RegisterAnimationSequence( "Setup", {
			{
				function ()
					return self.TicuR:SetRGBFromInt( 16777215, 0 )
				end
			},
			{
				function ()
					return self.TicuR:SetAlpha( 0.8, 0 )
				end
			}
		} )
		Icon:RegisterAnimationSequence( "Setup", {
			{
				function ()
					return self.Icon:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.Setup = function ()
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
				f3_local3:AnimateSequence( "Setup" )
			end
			Accent:AnimateSequence( "Setup" )
			MenuTitle:AnimateSequence( "Setup" )
			MenuBreadcrumbs:AnimateSequence( "Setup" )
			Divider:AnimateSequence( "Setup" )
			TicBR:AnimateSequence( "Setup" )
			TicuR:AnimateSequence( "Setup" )
			Icon:AnimateSequence( "Setup" )
		end
		
		MenuTitle:RegisterAnimationSequence( "HideTitle", {
			{
				function ()
					return self.MenuTitle:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.HideTitle = function ()
			MenuTitle:AnimateSequence( "HideTitle" )
		end
		
	end
	
	self._animationSets.CP = function ()
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
			f3_local3:RegisterAnimationSequence( "DefaultSequence", {
				{
					function ()
						return self.MPBackerImage:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if Engine.IsAliensMode() and CONDITIONS.IsThirdGameMode( self ) then
			f3_local5:RegisterAnimationSequence( "DefaultSequence", {
				{
					function ()
						return self.Gradient:SetAlpha( 0.3, 0 )
					end
				}
			} )
		end
		Accent:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Accent:SetAlpha( 0, 0 )
				end
			}
		} )
		MenuTitle:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.MenuTitle:SetOutlineMinDistance( -0.03, 0 )
				end
			},
			{
				function ()
					return self.MenuTitle:SetRGBFromInt( 14042667, 0 )
				end
			},
			{
				function ()
					return self.MenuTitle:SetOutlineRGBFromInt( 0, 0 )
				end
			},
			{
				function ()
					return self.MenuTitle:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 16, 0, _1080p * 13, _1080p * 77, 0 )
				end
			}
		} )
		MenuBreadcrumbs:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.MenuBreadcrumbs:SetAlpha( 0, 0 )
				end
			}
		} )
		Divider:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Divider:SetAlpha( 0, 0 )
				end
			}
		} )
		TicBR:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.TicBR:SetAlpha( 0, 0 )
				end
			}
		} )
		TicuR:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.TicuR:SetAlpha( 0, 0 )
				end
			}
		} )
		Icon:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Icon:SetAlpha( 0, 0 )
				end
			}
		} )
		if CONDITIONS.IsThirdGameMode( self ) then
			f3_local14:RegisterAnimationSequence( "DefaultSequence", {
				{
					function ()
						return self.CPTitleLine:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * -95, 0, _1080p * -28, _1080p * 36, 0 )
					end
				}
			} )
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f3_local15:RegisterAnimationSequence( "DefaultSequence", {
				{
					function ()
						return self.CPIconSquares:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -19, _1080p * 5, _1080p * 25, _1080p * 65, 0 )
					end
				}
			} )
		end
		self._sequences.DefaultSequence = function ()
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
				f3_local3:AnimateSequence( "DefaultSequence" )
			end
			if Engine.IsAliensMode() and CONDITIONS.IsThirdGameMode( self ) then
				f3_local5:AnimateSequence( "DefaultSequence" )
			end
			Accent:AnimateSequence( "DefaultSequence" )
			MenuTitle:AnimateSequence( "DefaultSequence" )
			MenuBreadcrumbs:AnimateSequence( "DefaultSequence" )
			Divider:AnimateSequence( "DefaultSequence" )
			TicBR:AnimateSequence( "DefaultSequence" )
			TicuR:AnimateSequence( "DefaultSequence" )
			Icon:AnimateSequence( "DefaultSequence" )
			if CONDITIONS.IsThirdGameMode( self ) then
				f3_local14:AnimateSequence( "DefaultSequence" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f3_local15:AnimateSequence( "DefaultSequence" )
			end
		end
		
		if CONDITIONS.IsThirdGameMode( self ) then
			f3_local14:RegisterAnimationSequence( "Flicker", {
				{
					function ()
						return self.CPTitleLine:SetAlpha( 1, 0 )
					end,
					function ()
						return self.CPTitleLine:SetAlpha( 0, 3000 )
					end,
					function ()
						return self.CPTitleLine:SetAlpha( 1, 50 )
					end,
					function ()
						return self.CPTitleLine:SetAlpha( 0, 50 )
					end,
					function ()
						return self.CPTitleLine:SetAlpha( 1, 50 )
					end,
					function ()
						return self.CPTitleLine:SetAlpha( 0.6, 1850 )
					end,
					function ()
						return self.CPTitleLine:SetAlpha( 1, 2000 )
					end,
					function ()
						return self.CPTitleLine:SetAlpha( 0.4, 500 )
					end,
					function ()
						return self.CPTitleLine:SetAlpha( 1, 500 )
					end,
					function ()
						return self.CPTitleLine:SetAlpha( 1, 3000 )
					end,
					function ()
						return self.CPTitleLine:SetAlpha( 0, 20 )
					end,
					function ()
						return self.CPTitleLine:SetAlpha( 1, 180 )
					end,
					function ()
						return self.CPTitleLine:SetAlpha( 1, 800 )
					end,
					function ()
						return self.CPTitleLine:SetAlpha( 0.4, 1000 )
					end,
					function ()
						return self.CPTitleLine:SetAlpha( 1, 3000 )
					end
				}
			} )
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f3_local16:RegisterAnimationSequence( "Flicker", {
				{
					function ()
						return self.CPYellowLine:SetAlpha( 1, 0 )
					end,
					function ()
						return self.CPYellowLine:SetAlpha( 0, 3000 )
					end,
					function ()
						return self.CPYellowLine:SetAlpha( 1, 50 )
					end,
					function ()
						return self.CPYellowLine:SetAlpha( 0, 50 )
					end,
					function ()
						return self.CPYellowLine:SetAlpha( 1, 50 )
					end,
					function ()
						return self.CPYellowLine:SetAlpha( 0.6, 1850 )
					end,
					function ()
						return self.CPYellowLine:SetAlpha( 1, 2000 )
					end,
					function ()
						return self.CPYellowLine:SetAlpha( 0.4, 500 )
					end,
					function ()
						return self.CPYellowLine:SetAlpha( 1, 500 )
					end,
					function ()
						return self.CPYellowLine:SetAlpha( 1, 3000 )
					end,
					function ()
						return self.CPYellowLine:SetAlpha( 0, 20 )
					end,
					function ()
						return self.CPYellowLine:SetAlpha( 1, 180 )
					end,
					function ()
						return self.CPYellowLine:SetAlpha( 1, 800 )
					end,
					function ()
						return self.CPYellowLine:SetAlpha( 0.4, 1000 )
					end,
					function ()
						return self.CPYellowLine:SetAlpha( 1, 3000 )
					end
				}
			} )
		end
		self._sequences.Flicker = function ()
			if CONDITIONS.IsThirdGameMode( self ) then
				f3_local14:AnimateLoop( "Flicker" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f3_local16:AnimateLoop( "Flicker" )
			end
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	ACTIONS.AnimateSequence( self, "Update" )
	f0_local0( self, f3_local1, controller )
	if CONDITIONS.IsThirdGameMode( self ) then
		ACTIONS.SetAnimationSet( self, "CP" )
		ACTIONS.AnimateSequence( self, "Flicker" )
	end
	if CONDITIONS.IsMultiplayer( self ) then
		ACTIONS.AnimateSequence( self, "MPSetup" )
		ACTIONS.PlaySoundSetSound( self, "menuDecode", false )
	end
	if CONDITIONS.IsSingleplayer( self ) then
		ACTIONS.AnimateSequence( self, "Setup" )
		ACTIONS.PlaySoundSetSound( self, "menuDecode", false )
	end
	return self
end

MenuBuilder.registerType( "MenuTitle", MenuTitle )
LockTable( _M )
