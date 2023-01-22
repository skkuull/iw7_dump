local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function RefreshAnimation( f1_arg0, f1_arg1 )
	if f1_arg0._lastState ~= f1_arg1 then
		f1_arg0._lastState = f1_arg1
		ACTIONS.AnimateSequence( f1_arg0, f1_arg1 )
	end
end

function AddGradientFlashOverFrames( f2_arg0 )
	f2_arg0.Gradient:RegisterAnimationSequence( "GradientFlashOver", {
		{
			function ()
				return f2_arg0.Gradient:SetAlpha( 1, 0 )
			end
		},
		{
			function ()
				return f2_arg0.Gradient:SetRGBFromInt( 16742912, 0 )
			end
		},
		{
			function ()
				return f2_arg0.Gradient:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0 * _1080p, 0, 0, 0 )
			end
		},
		{
			function ()
				return f2_arg0.Gradient:SetAlpha( 0.2, 400, LUI.EASING.inQuartic )
			end
		},
		{
			function ()
				return f2_arg0.Gradient:SetRGBFromInt( 16774827, 400, LUI.EASING.inQuartic )
			end
		},
		{
			function ()
				return f2_arg0.Gradient:SetAnchorsAndPosition( 0, 0, 0, 0, 0, -50 * _1080p, 0, 0, 400, LUI.EASING.inQuartic )
			end
		}
	} )
	f2_arg0._sequences.GradientFlashOver = function ()
		f2_arg0.Gradient:AnimateSequence( "GradientFlashOver" )
	end
	
end

function AddGradientFlashUpFrames( f10_arg0 )
	f10_arg0.Gradient:RegisterAnimationSequence( "GradientFlashUp", {
		{
			function ()
				return f10_arg0.Gradient:SetAlpha( 0 )
			end
		},
		{
			function ()
				return f10_arg0.Gradient:SetAnchorsAndPosition( 0, 0.2, 0, 0, 0, 0, 0, 0, 0, LUI.EASING.outBack )
			end
		}
	} )
	f10_arg0._sequences.GradientFlashUp = function ()
		f10_arg0.Gradient:AnimateSequence( "GradientFlashUp" )
	end
	
end

function PostLoadFunc( f14_arg0, f14_arg1, f14_arg2 )
	f14_arg0:addEventHandler( "ignore_game_mode_layout", function ( f15_arg0, f15_arg1 )
		f14_arg0._ignoreGameModeLayout = true
		ACTIONS.SetAnimationSet( f14_arg0, "DefaultAnimationSet" )
	end )
	if CONDITIONS.IsThirdGameMode( f14_arg0 ) and not f14_arg0._ignoreGameModeLayout then
		ACTIONS.SetAnimationSet( f14_arg0, "ThirdGamemode" )
	end
	AddGradientFlashOverFrames( f14_arg0 )
	AddGradientFlashUpFrames( f14_arg0 )
	f14_arg0:addEventHandler( "button_over", function ( f16_arg0, f16_arg1 )
		RefreshAnimation( f16_arg0, "ButtonOver" )
		if not CONDITIONS.IsThirdGameMode() or f14_arg0._ignoreGameModeLayout then
			ACTIONS.AnimateSequence( f16_arg0, "GradientFlashOver" )
		end
		if CONDITIONS.IsThirdGameModeDesired( f14_arg0 ) and not f14_arg0._ignoreGameModeLayout then
			ACTIONS.AnimateSequence( f14_arg0, "Flicker" )
		end
	end )
	f14_arg0:addEventHandler( "button_up", function ( f17_arg0, f17_arg1 )
		RefreshAnimation( f17_arg0, "ButtonUp" )
		if not CONDITIONS.IsThirdGameMode() or f14_arg0._ignoreGameModeLayout then
			ACTIONS.AnimateSequence( f17_arg0, "GradientFlashUp" )
		end
	end )
	f14_arg0:addEventHandler( "button_disable", function ( f18_arg0, f18_arg1 )
		RefreshAnimation( f18_arg0, "Disabled" )
		if not CONDITIONS.IsThirdGameMode() or f14_arg0._ignoreGameModeLayout then
			ACTIONS.AnimateSequence( f18_arg0, "GradientFlashUp" )
		end
	end )
	f14_arg0:addEventHandler( "button_over_disable", function ( f19_arg0, f19_arg1 )
		RefreshAnimation( f19_arg0, "DisabledOver" )
		if not CONDITIONS.IsThirdGameMode() or f14_arg0._ignoreGameModeLayout then
			ACTIONS.AnimateSequence( f19_arg0, "GradientFlashOver" )
		end
	end )
end

function GenericHelperButtonBackground( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 215 * _1080p, 0, 30 * _1080p )
	self.id = "GenericHelperButtonBackground"
	self._animationSets = {}
	self._sequences = {}
	local f20_local1 = controller and controller.controllerIndex
	if not f20_local1 and not Engine.InFrontend() then
		f20_local1 = self:getRootController()
	end
	assert( f20_local1 )
	local f20_local2 = self
	local MainShadow = nil
	
	MainShadow = LUI.UIImage.new()
	MainShadow.id = "MainShadow"
	MainShadow:SetRGBFromInt( 13398272, 0 )
	MainShadow:SetAlpha( 0, 0 )
	MainShadow:SetDotPitchEnabled( true )
	MainShadow:SetDotPitchX( 0, 0 )
	MainShadow:SetDotPitchY( 0, 0 )
	MainShadow:SetDotPitchContrast( 0, 0 )
	MainShadow:SetDotPitchMode( 0 )
	MainShadow:SetBlendMode( BLEND_MODE.blend )
	MainShadow:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 6, _1080p * 6, _1080p * 6, _1080p * 6 )
	self:addElement( MainShadow )
	self.MainShadow = MainShadow
	
	local GlowMid = nil
	
	GlowMid = LUI.UIImage.new()
	GlowMid.id = "GlowMid"
	GlowMid:SetRGBFromInt( 12080170, 0 )
	GlowMid:SetAlpha( 0, 0 )
	GlowMid:setImage( RegisterMaterial( "wdg_button_glow_mid" ), 0 )
	GlowMid:SetBlendMode( BLEND_MODE.addWithAlpha )
	GlowMid:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 11, _1080p * -11, _1080p * -8, _1080p * 8 )
	self:addElement( GlowMid )
	self.GlowMid = GlowMid
	
	local GlowLeft = nil
	
	GlowLeft = LUI.UIImage.new()
	GlowLeft.id = "GlowLeft"
	GlowLeft:SetRGBFromInt( 12080170, 0 )
	GlowLeft:SetAlpha( 0, 0 )
	GlowLeft:setImage( RegisterMaterial( "wdg_button_glow_left" ), 0 )
	GlowLeft:SetBlendMode( BLEND_MODE.addWithAlpha )
	GlowLeft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -12, _1080p * 11, _1080p * -8, _1080p * 8 )
	self:addElement( GlowLeft )
	self.GlowLeft = GlowLeft
	
	local GlowRight = nil
	
	GlowRight = LUI.UIImage.new()
	GlowRight.id = "GlowRight"
	GlowRight:SetRGBFromInt( 12080170, 0 )
	GlowRight:SetAlpha( 0, 0 )
	GlowRight:SetZRotation( 180, 0 )
	GlowRight:setImage( RegisterMaterial( "wdg_button_glow_left" ), 0 )
	GlowRight:SetBlendMode( BLEND_MODE.addWithAlpha )
	GlowRight:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -11, _1080p * 12, _1080p * -8, _1080p * 8 )
	self:addElement( GlowRight )
	self.GlowRight = GlowRight
	
	local Main = nil
	
	Main = LUI.UIImage.new()
	Main.id = "Main"
	Main:SetRGBFromInt( 3684408, 0 )
	Main:SetAlpha( 0.8, 0 )
	Main:SetDotPitchEnabled( true )
	Main:SetDotPitchX( 6, 0 )
	Main:SetDotPitchY( 3, 0 )
	Main:SetDotPitchContrast( 0.15, 0 )
	Main:SetDotPitchMode( 0 )
	self:addElement( Main )
	self.Main = Main
	
	local Gradient = nil
	
	Gradient = LUI.UIImage.new()
	Gradient.id = "Gradient"
	Gradient:SetRGBFromInt( 16774827, 0 )
	Gradient:SetAlpha( 0, 0 )
	Gradient:setImage( RegisterMaterial( "wdg_gradient_flare" ), 0 )
	Gradient:SetBlendMode( BLEND_MODE.addWithAlpha )
	Gradient:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 6, 0, 0, 0 )
	self:addElement( Gradient )
	self.Gradient = Gradient
	
	local f20_local9 = nil
	if CONDITIONS.IsThirdGameMode( self ) then
		f20_local9 = LUI.UIImage.new()
		f20_local9.id = "CPBackgroundFlicker"
		f20_local9:SetRGBFromTable( SWATCHES.Zombies.fateCardLightBar, 0 )
		f20_local9:SetAlpha( 0, 0 )
		f20_local9:setImage( RegisterMaterial( "cp_main_button_background" ), 0 )
		f20_local9:SetBlendMode( BLEND_MODE.addWithAlpha )
		f20_local9:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -30, _1080p * 30, _1080p * -8, _1080p * 8 )
		self:addElement( f20_local9 )
		self.CPBackgroundFlicker = f20_local9
	end
	local f20_local10 = nil
	if CONDITIONS.IsThirdGameMode( self ) then
		f20_local10 = LUI.UIImage.new()
		f20_local10.id = "CPBackground"
		f20_local10:SetRGBFromTable( SWATCHES.Zombies.fateCardLightBar, 0 )
		f20_local10:SetAlpha( 0, 0 )
		f20_local10:setImage( RegisterMaterial( "cp_main_button_background" ), 0 )
		f20_local10:SetBlendMode( BLEND_MODE.addWithAlpha )
		f20_local10:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -30, _1080p * 30, _1080p * -8, _1080p * 8 )
		self:addElement( f20_local10 )
		self.CPBackground = f20_local10
	end
	local f20_local11 = nil
	if CONDITIONS.IsThirdGameMode( self ) then
		f20_local11 = LUI.UIImage.new()
		f20_local11.id = "CPBackgroundGlowFlicker"
		f20_local11:SetRGBFromTable( SWATCHES.Zombies.fateCardLightBar, 0 )
		f20_local11:SetAlpha( 0, 0 )
		f20_local11:setImage( RegisterMaterial( "cp_main_button_glow" ), 0 )
		f20_local11:SetBlendMode( BLEND_MODE.addWithAlpha )
		self:addElement( f20_local11 )
		self.CPBackgroundGlowFlicker = f20_local11
	end
	local f20_local12 = nil
	if CONDITIONS.IsThirdGameMode( self ) then
		f20_local12 = LUI.UIImage.new()
		f20_local12.id = "CPBackgroundGlow"
		f20_local12:SetRGBFromTable( SWATCHES.Zombies.fateCardLightBar, 0 )
		f20_local12:SetAlpha( 0, 0 )
		f20_local12:setImage( RegisterMaterial( "cp_main_button_glow" ), 0 )
		f20_local12:SetBlendMode( BLEND_MODE.addWithAlpha )
		self:addElement( f20_local12 )
		self.CPBackgroundGlow = f20_local12
	end
	local f20_local13 = nil
	if CONDITIONS.IsThirdGameMode( self ) then
		f20_local13 = LUI.UIImage.new()
		f20_local13.id = "CPBlood"
		f20_local13:SetAlpha( 0, 0 )
		f20_local13:setImage( RegisterMaterial( "cp_main_button_blood_splatter" ), 0 )
		f20_local13:SetBlendMode( BLEND_MODE.addWithAlpha )
		f20_local13:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -88, _1080p * 87, _1080p * -87.5, _1080p * 87.5 )
		self:addElement( f20_local13 )
		self.CPBlood = f20_local13
	end
	local f20_local14 = nil
	if CONDITIONS.IsThirdGameMode( self ) then
		f20_local14 = LUI.UIBorder.new( {
			borderThicknessLeft = _1080p * 2,
			borderThicknessRight = _1080p * 2,
			borderThicknessTop = _1080p * 2,
			borderThicknessBottom = _1080p * 2
		} )
		f20_local14.id = "BorderBox"
		f20_local14:SetAlpha( 0, 0 )
		f20_local14:SetBorderThicknessLeft( _1080p * 2, 0 )
		f20_local14:SetBorderThicknessRight( _1080p * 2, 0 )
		f20_local14:SetBorderThicknessTop( _1080p * 2, 0 )
		f20_local14:SetBorderThicknessBottom( _1080p * 2, 0 )
		self:addElement( f20_local14 )
		self.BorderBox = f20_local14
	end
	local Cap = nil
	
	Cap = LUI.UIImage.new()
	Cap.id = "Cap"
	Cap:SetRGBFromInt( 14277081, 0 )
	Cap:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 6, 0, 0 )
	self:addElement( Cap )
	self.Cap = Cap
	
	self._animationSets.DefaultAnimationSet = function ()
		Main:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Main:SetAlpha( 0.8, 0 )
				end
			},
			{
				function ()
					return self.Main:SetRGBFromInt( 3684408, 0 )
				end
			}
		} )
		if CONDITIONS.IsThirdGameMode( self ) then
			f20_local9:RegisterAnimationSequence( "DefaultSequence", {
				{
					function ()
						return self.CPBackgroundFlicker:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f20_local10:RegisterAnimationSequence( "DefaultSequence", {
				{
					function ()
						return self.CPBackground:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f20_local11:RegisterAnimationSequence( "DefaultSequence", {
				{
					function ()
						return self.CPBackgroundGlowFlicker:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f20_local12:RegisterAnimationSequence( "DefaultSequence", {
				{
					function ()
						return self.CPBackgroundGlow:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f20_local13:RegisterAnimationSequence( "DefaultSequence", {
				{
					function ()
						return self.CPBlood:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f20_local14:RegisterAnimationSequence( "DefaultSequence", {
				{
					function ()
						return self.BorderBox:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		Cap:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Cap:SetRGBFromInt( 14277081, 0 )
				end
			},
			{
				function ()
					return self.Cap:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			Main:AnimateSequence( "DefaultSequence" )
			if CONDITIONS.IsThirdGameMode( self ) then
				f20_local9:AnimateSequence( "DefaultSequence" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f20_local10:AnimateSequence( "DefaultSequence" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f20_local11:AnimateSequence( "DefaultSequence" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f20_local12:AnimateSequence( "DefaultSequence" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f20_local13:AnimateSequence( "DefaultSequence" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f20_local14:AnimateSequence( "DefaultSequence" )
			end
			Cap:AnimateSequence( "DefaultSequence" )
		end
		
		MainShadow:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.MainShadow:SetAlpha( 0.4, 0 )
				end
			}
		} )
		GlowMid:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.GlowMid:SetAlpha( 0.25, 200 )
				end,
				function ()
					return self.GlowMid:SetAlpha( 0.4, 1000 )
				end,
				function ()
					return self.GlowMid:SetAlpha( 0.4, 200 )
				end,
				function ()
					return self.GlowMid:SetAlpha( 0.25, 1000 )
				end
			}
		} )
		GlowLeft:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.GlowLeft:SetAlpha( 0.25, 200 )
				end,
				function ()
					return self.GlowLeft:SetAlpha( 0.4, 1000 )
				end,
				function ()
					return self.GlowLeft:SetAlpha( 0.4, 200 )
				end,
				function ()
					return self.GlowLeft:SetAlpha( 0.25, 1000 )
				end
			}
		} )
		GlowRight:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.GlowRight:SetAlpha( 0.25, 200 )
				end,
				function ()
					return self.GlowRight:SetAlpha( 0.4, 1000 )
				end,
				function ()
					return self.GlowRight:SetAlpha( 0.4, 200 )
				end,
				function ()
					return self.GlowRight:SetAlpha( 0.25, 1000 )
				end
			}
		} )
		Main:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Main:SetRGBFromInt( 16767586, 0 )
				end
			},
			{
				function ()
					return self.Main:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Main:SetDotPitchX( 6, 0 )
				end
			},
			{
				function ()
					return self.Main:SetDotPitchY( 3, 0 )
				end
			},
			{
				function ()
					return self.Main:SetDotPitchContrast( 0.15, 0 )
				end
			},
			{
				function ()
					return self.Main:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0, 259 )
				end
			}
		} )
		Cap:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Cap:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			MainShadow:AnimateLoop( "ButtonOver" )
			GlowMid:AnimateLoop( "ButtonOver" )
			GlowLeft:AnimateLoop( "ButtonOver" )
			GlowRight:AnimateLoop( "ButtonOver" )
			Main:AnimateLoop( "ButtonOver" )
			Cap:AnimateLoop( "ButtonOver" )
		end
		
		MainShadow:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.MainShadow:SetAlpha( 0, 0 )
				end
			}
		} )
		GlowMid:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.GlowMid:SetAlpha( 0, 0 )
				end
			}
		} )
		GlowLeft:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.GlowLeft:SetAlpha( 0, 0 )
				end
			}
		} )
		GlowRight:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.GlowRight:SetAlpha( 0, 0 )
				end
			}
		} )
		Main:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Main:SetAlpha( 0.8, 0 )
				end
			},
			{
				function ()
					return self.Main:SetRGBFromInt( 3684408, 0 )
				end
			}
		} )
		Gradient:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Gradient:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Gradient:SetAlpha( 0, 100 )
				end
			}
		} )
		Cap:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Cap:SetRGBFromInt( 14277081, 0 )
				end
			}
		} )
		self._sequences.ButtonUp = function ()
			MainShadow:AnimateSequence( "ButtonUp" )
			GlowMid:AnimateSequence( "ButtonUp" )
			GlowLeft:AnimateSequence( "ButtonUp" )
			GlowRight:AnimateSequence( "ButtonUp" )
			Main:AnimateSequence( "ButtonUp" )
			Gradient:AnimateSequence( "ButtonUp" )
			Cap:AnimateSequence( "ButtonUp" )
		end
		
		MainShadow:RegisterAnimationSequence( "Disabled", {
			{
				function ()
					return self.MainShadow:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.MainShadow:SetDotPitchX( 0, 100 )
				end
			},
			{
				function ()
					return self.MainShadow:SetDotPitchY( 0, 100 )
				end
			},
			{
				function ()
					return self.MainShadow:SetDotPitchContrast( 0, 100 )
				end
			}
		} )
		GlowMid:RegisterAnimationSequence( "Disabled", {
			{
				function ()
					return self.GlowMid:SetAlpha( 0, 0 )
				end
			}
		} )
		Main:RegisterAnimationSequence( "Disabled", {
			{
				function ()
					return self.Main:SetAlpha( 0.4, 0 )
				end
			},
			{
				function ()
					return self.Main:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		Gradient:RegisterAnimationSequence( "Disabled", {
			{
				function ()
					return self.Gradient:SetAlpha( 0, 100 )
				end
			}
		} )
		self._sequences.Disabled = function ()
			MainShadow:AnimateSequence( "Disabled" )
			GlowMid:AnimateSequence( "Disabled" )
			Main:AnimateSequence( "Disabled" )
			Gradient:AnimateSequence( "Disabled" )
		end
		
		MainShadow:RegisterAnimationSequence( "DisabledOver", {
			{
				function ()
					return self.MainShadow:SetAlpha( 0.4, 100 )
				end
			}
		} )
		GlowMid:RegisterAnimationSequence( "DisabledOver", {
			{
				function ()
					return self.GlowMid:SetAlpha( 0.25, 200 )
				end,
				function ()
					return self.GlowMid:SetAlpha( 0.4, 1000, LUI.EASING.outSine )
				end,
				function ()
					return self.GlowMid:SetAlpha( 0.4, 200 )
				end,
				function ()
					return self.GlowMid:SetAlpha( 0.25, 1000, LUI.EASING.inSine )
				end
			}
		} )
		Main:RegisterAnimationSequence( "DisabledOver", {
			{
				function ()
					return self.Main:SetRGBFromInt( 16767586, 0 )
				end
			},
			{
				function ()
					return self.Main:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Main:SetDotPitchX( 6, 0 )
				end
			},
			{
				function ()
					return self.Main:SetDotPitchY( 3, 0 )
				end
			},
			{
				function ()
					return self.Main:SetDotPitchContrast( 0.15, 0 )
				end
			}
		} )
		self._sequences.DisabledOver = function ()
			MainShadow:AnimateLoop( "DisabledOver" )
			GlowMid:AnimateLoop( "DisabledOver" )
			Main:AnimateLoop( "DisabledOver" )
		end
		
	end
	
	self._animationSets.ThirdGamemode = function ()
		MainShadow:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.MainShadow:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.MainShadow:SetRGBFromTable( SWATCHES.Zombies.menuHeader, 0 )
				end
			}
		} )
		GlowMid:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.GlowMid:SetAlpha( 0, 0 )
				end
			}
		} )
		GlowLeft:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.GlowLeft:SetAlpha( 0, 0 )
				end
			}
		} )
		GlowRight:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.GlowRight:SetAlpha( 0, 0 )
				end
			}
		} )
		Main:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Main:SetRGBFromInt( 0, 0 )
				end
			},
			{
				function ()
					return self.Main:SetAlpha( 0.75, 0 )
				end
			}
		} )
		Gradient:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Gradient:SetAlpha( 0, 0 )
				end
			}
		} )
		if CONDITIONS.IsThirdGameMode( self ) then
			f20_local10:RegisterAnimationSequence( "DefaultSequence", {
				{
					function ()
						return self.CPBackground:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f20_local12:RegisterAnimationSequence( "DefaultSequence", {
				{
					function ()
						return self.CPBackgroundGlow:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f20_local13:RegisterAnimationSequence( "DefaultSequence", {
				{
					function ()
						return self.CPBlood:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f20_local14:RegisterAnimationSequence( "DefaultSequence", {
				{
					function ()
						return self.BorderBox:SetAlpha( 0.2, 0 )
					end
				}
			} )
		end
		Cap:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Cap:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			MainShadow:AnimateSequence( "DefaultSequence" )
			GlowMid:AnimateSequence( "DefaultSequence" )
			GlowLeft:AnimateSequence( "DefaultSequence" )
			GlowRight:AnimateSequence( "DefaultSequence" )
			Main:AnimateSequence( "DefaultSequence" )
			Gradient:AnimateSequence( "DefaultSequence" )
			if CONDITIONS.IsThirdGameMode( self ) then
				f20_local10:AnimateSequence( "DefaultSequence" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f20_local12:AnimateSequence( "DefaultSequence" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f20_local13:AnimateSequence( "DefaultSequence" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f20_local14:AnimateSequence( "DefaultSequence" )
			end
			Cap:AnimateSequence( "DefaultSequence" )
		end
		
		MainShadow:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.MainShadow:SetAlpha( 0, 0 )
				end
			}
		} )
		GlowMid:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.GlowMid:SetAlpha( 0, 0 )
				end
			}
		} )
		Main:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Main:SetAlpha( 0, 0 )
				end
			}
		} )
		Gradient:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Gradient:SetAlpha( 0, 0 )
				end
			}
		} )
		if CONDITIONS.IsThirdGameMode( self ) then
			f20_local10:RegisterAnimationSequence( "ButtonOver", {
				{
					function ()
						return self.CPBackground:SetAlpha( 0, 0 )
					end,
					function ()
						return self.CPBackground:SetAlpha( 0.75, 250, LUI.EASING.outQuadratic )
					end
				},
				{
					function ()
						return self.CPBackground:SetRGBFromTable( SWATCHES.Zombies.fateCardLightBar, 0 )
					end
				},
				{
					function ()
						return self.CPBackground:SetScale( 0, 250, LUI.EASING.outQuadratic )
					end
				},
				{
					function ()
						return self.CPBackground:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -30, _1080p * -150, _1080p * -8, _1080p * 8, 0 )
					end,
					function ()
						return self.CPBackground:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -30, _1080p * 30, _1080p * -8, _1080p * 8, 250, LUI.EASING.outQuadratic )
					end
				}
			} )
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f20_local12:RegisterAnimationSequence( "ButtonOver", {
				{
					function ()
						return self.CPBackgroundGlow:SetAlpha( 0, 0 )
					end,
					function ()
						return self.CPBackgroundGlow:SetAlpha( 0.75, 250, LUI.EASING.outQuadratic )
					end
				},
				{
					function ()
						return self.CPBackgroundGlow:SetRGBFromTable( SWATCHES.Zombies.fateCardLightBar, 0 )
					end
				},
				{
					function ()
						return self.CPBackgroundGlow:SetScale( 0, 250, LUI.EASING.outQuadratic )
					end
				},
				{
					function ()
						return self.CPBackgroundGlow:SetAnchorsAndPosition( 0, 0, 0, 0, 0, _1080p * -150, 0, 0, 0 )
					end,
					function ()
						return self.CPBackgroundGlow:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0, 250, LUI.EASING.outQuadratic )
					end
				}
			} )
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f20_local13:RegisterAnimationSequence( "ButtonOver", {
				{
					function ()
						return self.CPBlood:SetAlpha( 1, 0 )
					end
				},
				{
					function ()
						return self.CPBlood:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -16, 0, _1080p * 7, _1080p * 23, 0 )
					end,
					function ()
						return self.CPBlood:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -88, _1080p * 87, _1080p * -87.5, _1080p * 87.5, 250, LUI.EASING.outQuadratic )
					end
				}
			} )
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f20_local14:RegisterAnimationSequence( "ButtonOver", {
				{
					function ()
						return self.BorderBox:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		self._sequences.ButtonOver = function ()
			MainShadow:AnimateSequence( "ButtonOver" )
			GlowMid:AnimateSequence( "ButtonOver" )
			Main:AnimateSequence( "ButtonOver" )
			Gradient:AnimateSequence( "ButtonOver" )
			if CONDITIONS.IsThirdGameMode( self ) then
				f20_local10:AnimateSequence( "ButtonOver" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f20_local12:AnimateSequence( "ButtonOver" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f20_local13:AnimateSequence( "ButtonOver" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f20_local14:AnimateSequence( "ButtonOver" )
			end
		end
		
		MainShadow:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.MainShadow:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.MainShadow:SetRGBFromTable( SWATCHES.Zombies.menuHeader, 0 )
				end
			}
		} )
		GlowMid:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.GlowMid:SetAlpha( 0, 0 )
				end
			}
		} )
		Main:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Main:SetAlpha( 0.75, 0 )
				end
			},
			{
				function ()
					return self.Main:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		Gradient:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Gradient:SetAlpha( 0, 0 )
				end
			}
		} )
		if CONDITIONS.IsThirdGameMode( self ) then
			f20_local9:RegisterAnimationSequence( "ButtonUp", {
				{
					function ()
						return self.CPBackgroundFlicker:SetAlpha( 0, 0 )
					end
				},
				{
					function ()
						return self.CPBackgroundFlicker:SetScale( 0, 0 )
					end
				}
			} )
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f20_local10:RegisterAnimationSequence( "ButtonUp", {
				{
					function ()
						return self.CPBackground:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f20_local11:RegisterAnimationSequence( "ButtonUp", {
				{
					function ()
						return self.CPBackgroundGlowFlicker:SetAlpha( 0, 0 )
					end
				},
				{
					function ()
						return self.CPBackgroundGlowFlicker:SetScale( 0, 0 )
					end
				}
			} )
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f20_local12:RegisterAnimationSequence( "ButtonUp", {
				{
					function ()
						return self.CPBackgroundGlow:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f20_local13:RegisterAnimationSequence( "ButtonUp", {
				{
					function ()
						return self.CPBlood:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f20_local14:RegisterAnimationSequence( "ButtonUp", {
				{
					function ()
						return self.BorderBox:SetAlpha( 0.2, 0 )
					end
				}
			} )
		end
		self._sequences.ButtonUp = function ()
			MainShadow:AnimateSequence( "ButtonUp" )
			GlowMid:AnimateSequence( "ButtonUp" )
			Main:AnimateSequence( "ButtonUp" )
			Gradient:AnimateSequence( "ButtonUp" )
			if CONDITIONS.IsThirdGameMode( self ) then
				f20_local9:AnimateSequence( "ButtonUp" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f20_local10:AnimateSequence( "ButtonUp" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f20_local11:AnimateSequence( "ButtonUp" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f20_local12:AnimateSequence( "ButtonUp" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f20_local13:AnimateSequence( "ButtonUp" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f20_local14:AnimateSequence( "ButtonUp" )
			end
		end
		
		MainShadow:RegisterAnimationSequence( "Disabled", {
			{
				function ()
					return self.MainShadow:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.MainShadow:SetRGBFromTable( SWATCHES.Zombies.menuHeader, 0 )
				end
			}
		} )
		GlowMid:RegisterAnimationSequence( "Disabled", {
			{
				function ()
					return self.GlowMid:SetAlpha( 0, 0 )
				end
			}
		} )
		Main:RegisterAnimationSequence( "Disabled", {
			{
				function ()
					return self.Main:SetAlpha( 0.75, 0 )
				end
			},
			{
				function ()
					return self.Main:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		Gradient:RegisterAnimationSequence( "Disabled", {
			{
				function ()
					return self.Gradient:SetAlpha( 0, 0 )
				end
			}
		} )
		if CONDITIONS.IsThirdGameMode( self ) then
			f20_local9:RegisterAnimationSequence( "Disabled", {
				{
					function ()
						return self.CPBackgroundFlicker:SetAlpha( 0, 0 )
					end
				},
				{
					function ()
						return self.CPBackgroundFlicker:SetScale( 0, 0 )
					end
				}
			} )
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f20_local10:RegisterAnimationSequence( "Disabled", {
				{
					function ()
						return self.CPBackground:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f20_local11:RegisterAnimationSequence( "Disabled", {
				{
					function ()
						return self.CPBackgroundGlowFlicker:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f20_local12:RegisterAnimationSequence( "Disabled", {
				{
					function ()
						return self.CPBackgroundGlow:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f20_local13:RegisterAnimationSequence( "Disabled", {
				{
					function ()
						return self.CPBlood:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f20_local14:RegisterAnimationSequence( "Disabled", {
				{
					function ()
						return self.BorderBox:SetAlpha( 0.3, 0 )
					end
				}
			} )
		end
		self._sequences.Disabled = function ()
			MainShadow:AnimateSequence( "Disabled" )
			GlowMid:AnimateSequence( "Disabled" )
			Main:AnimateSequence( "Disabled" )
			Gradient:AnimateSequence( "Disabled" )
			if CONDITIONS.IsThirdGameMode( self ) then
				f20_local9:AnimateSequence( "Disabled" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f20_local10:AnimateSequence( "Disabled" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f20_local11:AnimateSequence( "Disabled" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f20_local12:AnimateSequence( "Disabled" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f20_local13:AnimateSequence( "Disabled" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f20_local14:AnimateSequence( "Disabled" )
			end
		end
		
		if CONDITIONS.IsThirdGameMode( self ) then
			f20_local9:RegisterAnimationSequence( "Flicker", {
				{
					function ()
						return self.CPBackgroundFlicker:SetAlpha( 0.25, 0 )
					end,
					function ()
						return self.CPBackgroundFlicker:SetAlpha( 0.5, 500 )
					end,
					function ()
						return self.CPBackgroundFlicker:SetAlpha( 0, 1000 )
					end,
					function ()
						return self.CPBackgroundFlicker:SetAlpha( 0.25, 500 )
					end
				}
			} )
		end
		self._sequences.Flicker = function ()
			if CONDITIONS.IsThirdGameMode( self ) then
				f20_local9:AnimateLoop( "Flicker" )
			end
		end
		
		if CONDITIONS.IsThirdGameMode( self ) then
			f20_local11:RegisterAnimationSequence( "FlickerGlow", {
				{
					function ()
						return self.CPBackgroundGlowFlicker:SetAlpha( 0.2, 0 )
					end,
					function ()
						return self.CPBackgroundGlowFlicker:SetAlpha( 1, 50 )
					end,
					function ()
						return self.CPBackgroundGlowFlicker:SetAlpha( 0.2, 40 )
					end,
					function ()
						return self.CPBackgroundGlowFlicker:SetAlpha( 1, 30 )
					end,
					function ()
						return self.CPBackgroundGlowFlicker:SetAlpha( 0.2, 40 )
					end,
					function ()
						return self.CPBackgroundGlowFlicker:SetAlpha( 1, 50 )
					end,
					function ()
						return self.CPBackgroundGlowFlicker:SetAlpha( 0.2, 40 )
					end
				}
			} )
		end
		self._sequences.FlickerGlow = function ()
			if CONDITIONS.IsThirdGameMode( self ) then
				f20_local11:AnimateLoop( "FlickerGlow" )
			end
		end
		
		MainShadow:RegisterAnimationSequence( "DisabledOver", {
			{
				function ()
					return self.MainShadow:SetAlpha( 0, 0 )
				end
			}
		} )
		GlowMid:RegisterAnimationSequence( "DisabledOver", {
			{
				function ()
					return self.GlowMid:SetAlpha( 0, 0 )
				end
			}
		} )
		Main:RegisterAnimationSequence( "DisabledOver", {
			{
				function ()
					return self.Main:SetAlpha( 0, 0 )
				end
			}
		} )
		Gradient:RegisterAnimationSequence( "DisabledOver", {
			{
				function ()
					return self.Gradient:SetAlpha( 0, 0 )
				end
			}
		} )
		if CONDITIONS.IsThirdGameMode( self ) then
			f20_local10:RegisterAnimationSequence( "DisabledOver", {
				{
					function ()
						return self.CPBackground:SetAlpha( 0, 0 )
					end,
					function ()
						return self.CPBackground:SetAlpha( 0.75, 250, LUI.EASING.outQuadratic )
					end
				},
				{
					function ()
						return self.CPBackground:SetRGBFromInt( 9868950, 0 )
					end
				},
				{
					function ()
						return self.CPBackground:SetScale( 0, 250, LUI.EASING.outQuadratic )
					end
				},
				{
					function ()
						return self.CPBackground:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -30, _1080p * -150, _1080p * -8, _1080p * 8, 0 )
					end,
					function ()
						return self.CPBackground:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -30, _1080p * 30, _1080p * -8, _1080p * 8, 250, LUI.EASING.outQuadratic )
					end
				}
			} )
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f20_local12:RegisterAnimationSequence( "DisabledOver", {
				{
					function ()
						return self.CPBackgroundGlow:SetAlpha( 0, 0 )
					end,
					function ()
						return self.CPBackgroundGlow:SetAlpha( 0.75, 250, LUI.EASING.outQuadratic )
					end
				},
				{
					function ()
						return self.CPBackgroundGlow:SetRGBFromInt( 9868950, 0 )
					end
				},
				{
					function ()
						return self.CPBackgroundGlow:SetScale( 0, 250, LUI.EASING.outQuadratic )
					end
				},
				{
					function ()
						return self.CPBackgroundGlow:SetAnchorsAndPosition( 0, 0, 0, 0, 0, _1080p * -150, 0, 0, 0 )
					end,
					function ()
						return self.CPBackgroundGlow:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0, 250, LUI.EASING.outQuadratic )
					end
				}
			} )
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f20_local13:RegisterAnimationSequence( "DisabledOver", {
				{
					function ()
						return self.CPBlood:SetAlpha( 1, 0 )
					end
				},
				{
					function ()
						return self.CPBlood:SetRGBFromInt( 9868950, 0 )
					end
				},
				{
					function ()
						return self.CPBlood:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -16, 0, _1080p * 7, _1080p * 23, 0 )
					end,
					function ()
						return self.CPBlood:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -88, _1080p * 87, _1080p * -87.5, _1080p * 87.5, 250, LUI.EASING.outQuadratic )
					end
				}
			} )
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f20_local14:RegisterAnimationSequence( "DisabledOver", {
				{
					function ()
						return self.BorderBox:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		self._sequences.DisabledOver = function ()
			MainShadow:AnimateSequence( "DisabledOver" )
			GlowMid:AnimateSequence( "DisabledOver" )
			Main:AnimateSequence( "DisabledOver" )
			Gradient:AnimateSequence( "DisabledOver" )
			if CONDITIONS.IsThirdGameMode( self ) then
				f20_local10:AnimateSequence( "DisabledOver" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f20_local12:AnimateSequence( "DisabledOver" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f20_local13:AnimateSequence( "DisabledOver" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f20_local14:AnimateSequence( "DisabledOver" )
			end
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f20_local1, controller )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	return self
end

MenuBuilder.registerType( "GenericHelperButtonBackground", GenericHelperButtonBackground )
LockTable( _M )
