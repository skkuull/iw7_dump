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
				return f2_arg0.Gradient:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 100 * _1080p, 0, 0, 0 )
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

function GenericListArrowButtonBackground( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 215 * _1080p, 0, 30 * _1080p )
	self.id = "GenericListArrowButtonBackground"
	self._animationSets = {}
	self._sequences = {}
	local f20_local1 = controller and controller.controllerIndex
	if not f20_local1 and not Engine.InFrontend() then
		f20_local1 = self:getRootController()
	end
	assert( f20_local1 )
	local f20_local2 = self
	local DropShadow = nil
	
	DropShadow = LUI.UIImage.new()
	DropShadow.id = "DropShadow"
	DropShadow:SetRGBFromInt( 0, 0 )
	DropShadow:SetAlpha( 0.3, 0 )
	DropShadow:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
	DropShadow:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, 0, _1080p * 4 )
	self:addElement( DropShadow )
	self.DropShadow = DropShadow
	
	local TipShadow = nil
	
	TipShadow = LUI.UIImage.new()
	TipShadow.id = "TipShadow"
	TipShadow:SetRGBFromInt( 13398272, 0 )
	TipShadow:SetAlpha( 0, 0 )
	TipShadow:SetDotPitchEnabled( true )
	TipShadow:SetDotPitchX( 0, 0 )
	TipShadow:SetDotPitchY( 0, 0 )
	TipShadow:SetDotPitchContrast( 0, 0 )
	TipShadow:SetDotPitchMode( 0 )
	TipShadow:setImage( RegisterMaterial( "wdg_button_arrow_tip" ), 0 )
	TipShadow:SetBlendMode( BLEND_MODE.blend )
	TipShadow:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * 6, _1080p * 21, _1080p * 6, _1080p * 6 )
	self:addElement( TipShadow )
	self.TipShadow = TipShadow
	
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
	
	local GlowRight = nil
	
	GlowRight = LUI.UIImage.new()
	GlowRight.id = "GlowRight"
	GlowRight:SetRGBFromInt( 12080170, 0 )
	GlowRight:SetAlpha( 0, 0 )
	GlowRight:setImage( RegisterMaterial( "wdg_button_glow_right" ), 0 )
	GlowRight:SetBlendMode( BLEND_MODE.addWithAlpha )
	GlowRight:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -3, _1080p * 20, _1080p * -8, _1080p * 8 )
	self:addElement( GlowRight )
	self.GlowRight = GlowRight
	
	local GlowMid = nil
	
	GlowMid = LUI.UIImage.new()
	GlowMid.id = "GlowMid"
	GlowMid:SetRGBFromInt( 12080170, 0 )
	GlowMid:SetAlpha( 0, 0 )
	GlowMid:setImage( RegisterMaterial( "wdg_button_glow_mid" ), 0 )
	GlowMid:SetBlendMode( BLEND_MODE.addWithAlpha )
	GlowMid:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 11, _1080p * -3, _1080p * -8, _1080p * 8 )
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
	
	local Tip = nil
	
	Tip = LUI.UIImage.new()
	Tip.id = "Tip"
	Tip:SetRGBFromInt( 0, 0 )
	Tip:SetAlpha( 0.8, 0 )
	Tip:SetDotPitchEnabled( true )
	Tip:SetDotPitchX( 0, 0 )
	Tip:SetDotPitchY( 0, 0 )
	Tip:SetDotPitchContrast( 0, 0 )
	Tip:SetDotPitchMode( 0 )
	Tip:setImage( RegisterMaterial( "wdg_button_arrow_tip" ), 0 )
	Tip:SetAnchorsAndPosition( 1, 0, 0, 0, 0, _1080p * 6, _1080p * 9, _1080p * -9 )
	self:addElement( Tip )
	self.Tip = Tip
	
	local Main = nil
	
	Main = LUI.UIImage.new()
	Main.id = "Main"
	Main:SetRGBFromInt( 0, 0 )
	Main:SetAlpha( 0.8, 0 )
	Main:SetDotPitchEnabled( true )
	Main:SetDotPitchX( 0, 0 )
	Main:SetDotPitchY( 0, 0 )
	Main:SetDotPitchContrast( 0, 0 )
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
	
	local Cap = nil
	
	Cap = LUI.UIImage.new()
	Cap.id = "Cap"
	Cap:SetRGBFromInt( 14277081, 0 )
	Cap:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 6, 0, 0 )
	self:addElement( Cap )
	self.Cap = Cap
	
	local f20_local13 = nil
	if CONDITIONS.IsThirdGameMode( self ) then
		f20_local13 = LUI.UIImage.new()
		f20_local13.id = "CPBackgroundFlicker"
		f20_local13:SetRGBFromTable( SWATCHES.Zombies.fateCardLightBar, 0 )
		f20_local13:SetAlpha( 0, 0 )
		f20_local13:setImage( RegisterMaterial( "cp_main_button_background" ), 0 )
		f20_local13:SetBlendMode( BLEND_MODE.addWithAlpha )
		f20_local13:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -30, _1080p * 30, _1080p * -8, _1080p * 8 )
		self:addElement( f20_local13 )
		self.CPBackgroundFlicker = f20_local13
	end
	local f20_local14 = nil
	if CONDITIONS.IsThirdGameMode( self ) then
		f20_local14 = LUI.UIImage.new()
		f20_local14.id = "CPBackground"
		f20_local14:SetRGBFromTable( SWATCHES.Zombies.fateCardLightBar, 0 )
		f20_local14:SetAlpha( 0, 0 )
		f20_local14:setImage( RegisterMaterial( "cp_main_button_background" ), 0 )
		f20_local14:SetBlendMode( BLEND_MODE.addWithAlpha )
		f20_local14:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -30, _1080p * 30, _1080p * -8, _1080p * 8 )
		self:addElement( f20_local14 )
		self.CPBackground = f20_local14
	end
	local f20_local15 = nil
	if CONDITIONS.IsThirdGameMode( self ) then
		f20_local15 = LUI.UIImage.new()
		f20_local15.id = "CPBackgroundGlowFlicker"
		f20_local15:SetRGBFromTable( SWATCHES.Zombies.fateCardLightBar, 0 )
		f20_local15:SetAlpha( 0, 0 )
		f20_local15:setImage( RegisterMaterial( "cp_main_button_glow" ), 0 )
		f20_local15:SetBlendMode( BLEND_MODE.addWithAlpha )
		self:addElement( f20_local15 )
		self.CPBackgroundGlowFlicker = f20_local15
	end
	local f20_local16 = nil
	if CONDITIONS.IsThirdGameMode( self ) then
		f20_local16 = LUI.UIImage.new()
		f20_local16.id = "CPBackgroundGlow"
		f20_local16:SetRGBFromTable( SWATCHES.Zombies.fateCardLightBar, 0 )
		f20_local16:SetAlpha( 0, 0 )
		f20_local16:setImage( RegisterMaterial( "cp_main_button_glow" ), 0 )
		f20_local16:SetBlendMode( BLEND_MODE.addWithAlpha )
		self:addElement( f20_local16 )
		self.CPBackgroundGlow = f20_local16
	end
	local f20_local17 = nil
	if CONDITIONS.IsThirdGameMode( self ) then
		f20_local17 = LUI.UIImage.new()
		f20_local17.id = "CPBlood"
		f20_local17:SetAlpha( 0, 0 )
		f20_local17:setImage( RegisterMaterial( "cp_main_button_blood_splatter" ), 0 )
		f20_local17:SetBlendMode( BLEND_MODE.addWithAlpha )
		f20_local17:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -88, _1080p * 87, _1080p * -87.5, _1080p * 87.5 )
		self:addElement( f20_local17 )
		self.CPBlood = f20_local17
	end
	local f20_local18 = nil
	if CONDITIONS.IsThirdGameMode( self ) then
		f20_local18 = LUI.UIBorder.new( {
			borderThicknessLeft = _1080p * 2,
			borderThicknessRight = _1080p * 2,
			borderThicknessTop = _1080p * 2,
			borderThicknessBottom = _1080p * 2
		} )
		f20_local18.id = "BorderBox"
		f20_local18:SetAlpha( 0, 0 )
		f20_local18:SetBorderThicknessLeft( _1080p * 2, 0 )
		f20_local18:SetBorderThicknessRight( _1080p * 2, 0 )
		f20_local18:SetBorderThicknessTop( _1080p * 2, 0 )
		f20_local18:SetBorderThicknessBottom( _1080p * 2, 0 )
		self:addElement( f20_local18 )
		self.BorderBox = f20_local18
	end
	self._animationSets.DefaultAnimationSet = function ()
		Cap:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Cap:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Cap:SetRGBFromInt( 14277081, 0 )
				end
			}
		} )
		if CONDITIONS.IsThirdGameMode( self ) then
			f20_local13:RegisterAnimationSequence( "DefaultSequence", {
				{
					function ()
						return self.CPBackgroundFlicker:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f20_local14:RegisterAnimationSequence( "DefaultSequence", {
				{
					function ()
						return self.CPBackground:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f20_local15:RegisterAnimationSequence( "DefaultSequence", {
				{
					function ()
						return self.CPBackgroundGlowFlicker:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f20_local16:RegisterAnimationSequence( "DefaultSequence", {
				{
					function ()
						return self.CPBackgroundGlow:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f20_local17:RegisterAnimationSequence( "DefaultSequence", {
				{
					function ()
						return self.CPBlood:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f20_local18:RegisterAnimationSequence( "DefaultSequence", {
				{
					function ()
						return self.BorderBox:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		self._sequences.DefaultSequence = function ()
			Cap:AnimateSequence( "DefaultSequence" )
			if CONDITIONS.IsThirdGameMode( self ) then
				f20_local13:AnimateSequence( "DefaultSequence" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f20_local14:AnimateSequence( "DefaultSequence" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f20_local15:AnimateSequence( "DefaultSequence" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f20_local16:AnimateSequence( "DefaultSequence" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f20_local17:AnimateSequence( "DefaultSequence" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f20_local18:AnimateSequence( "DefaultSequence" )
			end
		end
		
		TipShadow:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.TipShadow:SetAlpha( 0.4, 0 )
				end
			},
			{
				function ()
					return self.TipShadow:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * 6, _1080p * 21, _1080p * 6, _1080p * 6, 100 )
				end
			}
		} )
		MainShadow:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.MainShadow:SetAlpha( 0.4, 0 )
				end
			}
		} )
		GlowRight:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.GlowRight:SetAlpha( 0.25, 200 )
				end,
				function ()
					return self.GlowRight:SetAlpha( 0.4, 1000, LUI.EASING.outSine )
				end,
				function ()
					return self.GlowRight:SetAlpha( 0.4, 200 )
				end,
				function ()
					return self.GlowRight:SetAlpha( 0.25, 1000, LUI.EASING.inSine )
				end
			},
			{
				function ()
					return self.GlowRight:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -3, _1080p * 20, _1080p * -8, _1080p * 8, 200 )
				end
			}
		} )
		GlowMid:RegisterAnimationSequence( "ButtonOver", {
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
					return self.GlowMid:SetAlpha( 0.25, 1000, LUI.EASING.inBack )
				end
			}
		} )
		GlowLeft:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.GlowLeft:SetAlpha( 0.25, 200 )
				end,
				function ()
					return self.GlowLeft:SetAlpha( 0.4, 1000, LUI.EASING.outSine )
				end,
				function ()
					return self.GlowLeft:SetAlpha( 0.4, 200 )
				end,
				function ()
					return self.GlowLeft:SetAlpha( 0.25, 1000, LUI.EASING.inBack )
				end
			}
		} )
		Tip:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Tip:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Tip:SetDotPitchX( 6, 0 )
				end
			},
			{
				function ()
					return self.Tip:SetDotPitchY( 3, 0 )
				end
			},
			{
				function ()
					return self.Tip:SetDotPitchContrast( 0.15, 0 )
				end
			},
			{
				function ()
					return self.Tip:SetRGBFromInt( 16767586, 0 )
				end
			},
			{
				function ()
					return self.Tip:SetAnchorsAndPosition( 1, 0, 0, 0, 0, _1080p * 15, 0, 0, 100 )
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
			},
			{
				function ()
					return self.Cap:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			TipShadow:AnimateLoop( "ButtonOver" )
			MainShadow:AnimateLoop( "ButtonOver" )
			GlowRight:AnimateLoop( "ButtonOver" )
			GlowMid:AnimateLoop( "ButtonOver" )
			GlowLeft:AnimateLoop( "ButtonOver" )
			Tip:AnimateLoop( "ButtonOver" )
			Main:AnimateLoop( "ButtonOver" )
			Cap:AnimateLoop( "ButtonOver" )
		end
		
		TipShadow:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.TipShadow:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.TipShadow:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * 6, _1080p * 12, _1080p * 15, _1080p * -3, 100 )
				end
			}
		} )
		MainShadow:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.MainShadow:SetAlpha( 0, 0 )
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
		Tip:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Tip:SetAlpha( 0.8, 0 )
				end
			},
			{
				function ()
					return self.Tip:SetDotPitchX( 0, 0 )
				end,
				function ()
					return self.Tip:SetDotPitchX( 0, 100 )
				end
			},
			{
				function ()
					return self.Tip:SetDotPitchY( 0, 0 )
				end,
				function ()
					return self.Tip:SetDotPitchY( 0, 100 )
				end
			},
			{
				function ()
					return self.Tip:SetDotPitchContrast( 0, 0 )
				end,
				function ()
					return self.Tip:SetDotPitchContrast( 0, 100 )
				end
			},
			{
				function ()
					return self.Tip:SetRGBFromInt( 0, 0 )
				end
			},
			{
				function ()
					return self.Tip:SetAnchorsAndPosition( 1, 0, 0, 0, 0, _1080p * 15, 0, 0, 0 )
				end,
				function ()
					return self.Tip:SetAnchorsAndPosition( 1, 0, 0, 0, 0, _1080p * 6, _1080p * 9, _1080p * -9, 100 )
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
					return self.Main:SetRGBFromInt( 0, 0 )
				end
			},
			{
				function ()
					return self.Main:SetDotPitchX( 0, 100 )
				end
			},
			{
				function ()
					return self.Main:SetDotPitchY( 0, 100 )
				end
			},
			{
				function ()
					return self.Main:SetDotPitchContrast( 0, 100 )
				end
			}
		} )
		Gradient:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Gradient:SetAlpha( 0, 100 )
				end
			}
		} )
		Cap:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Cap:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Cap:SetRGBFromInt( 14277081, 0 )
				end
			}
		} )
		self._sequences.ButtonUp = function ()
			TipShadow:AnimateSequence( "ButtonUp" )
			MainShadow:AnimateSequence( "ButtonUp" )
			GlowRight:AnimateSequence( "ButtonUp" )
			GlowMid:AnimateSequence( "ButtonUp" )
			GlowLeft:AnimateSequence( "ButtonUp" )
			Tip:AnimateSequence( "ButtonUp" )
			Main:AnimateSequence( "ButtonUp" )
			Gradient:AnimateSequence( "ButtonUp" )
			Cap:AnimateSequence( "ButtonUp" )
		end
		
		TipShadow:RegisterAnimationSequence( "Disabled", {
			{
				function ()
					return self.TipShadow:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.TipShadow:SetDotPitchX( 0, 100 )
				end
			},
			{
				function ()
					return self.TipShadow:SetDotPitchY( 0, 100 )
				end
			},
			{
				function ()
					return self.TipShadow:SetDotPitchContrast( 0, 100 )
				end
			}
		} )
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
		GlowRight:RegisterAnimationSequence( "Disabled", {
			{
				function ()
					return self.GlowRight:SetAlpha( 0, 0 )
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
		GlowLeft:RegisterAnimationSequence( "Disabled", {
			{
				function ()
					return self.GlowLeft:SetAlpha( 0, 0 )
				end
			}
		} )
		Tip:RegisterAnimationSequence( "Disabled", {
			{
				function ()
					return self.Tip:SetAlpha( 0.4, 0 )
				end
			},
			{
				function ()
					return self.Tip:SetDotPitchX( 0, 0 )
				end
			},
			{
				function ()
					return self.Tip:SetDotPitchY( 0, 0 )
				end
			},
			{
				function ()
					return self.Tip:SetDotPitchContrast( 0, 0 )
				end
			},
			{
				function ()
					return self.Tip:SetRGBFromInt( 0, 0 )
				end
			},
			{
				function ()
					return self.Tip:SetAnchorsAndPosition( 1, 0, 0, 0, 0, _1080p * 6, _1080p * 9, _1080p * -9, 0 )
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
		Cap:RegisterAnimationSequence( "Disabled", {
			{
				function ()
					return self.Cap:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Cap:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		self._sequences.Disabled = function ()
			TipShadow:AnimateSequence( "Disabled" )
			MainShadow:AnimateSequence( "Disabled" )
			GlowRight:AnimateSequence( "Disabled" )
			GlowMid:AnimateSequence( "Disabled" )
			GlowLeft:AnimateSequence( "Disabled" )
			Tip:AnimateSequence( "Disabled" )
			Main:AnimateSequence( "Disabled" )
			Gradient:AnimateSequence( "Disabled" )
			Cap:AnimateSequence( "Disabled" )
		end
		
		TipShadow:RegisterAnimationSequence( "DisabledOver", {
			{
				function ()
					return self.TipShadow:SetAlpha( 0.4, 100 )
				end
			}
		} )
		MainShadow:RegisterAnimationSequence( "DisabledOver", {
			{
				function ()
					return self.MainShadow:SetAlpha( 0.4, 100 )
				end
			}
		} )
		GlowRight:RegisterAnimationSequence( "DisabledOver", {
			{
				function ()
					return self.GlowRight:SetAlpha( 0.25, 200 )
				end,
				function ()
					return self.GlowRight:SetAlpha( 0.4, 1000, LUI.EASING.outSine )
				end,
				function ()
					return self.GlowRight:SetAlpha( 0.4, 200 )
				end,
				function ()
					return self.GlowRight:SetAlpha( 0.25, 1000, LUI.EASING.inSine )
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
		GlowLeft:RegisterAnimationSequence( "DisabledOver", {
			{
				function ()
					return self.GlowLeft:SetAlpha( 0.25, 200 )
				end,
				function ()
					return self.GlowLeft:SetAlpha( 0.4, 1000, LUI.EASING.outSine )
				end,
				function ()
					return self.GlowLeft:SetAlpha( 0.4, 200 )
				end,
				function ()
					return self.GlowLeft:SetAlpha( 0.25, 1000, LUI.EASING.inSine )
				end
			}
		} )
		Tip:RegisterAnimationSequence( "DisabledOver", {
			{
				function ()
					return self.Tip:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Tip:SetRGBFromInt( 16767586, 0 )
				end
			},
			{
				function ()
					return self.Tip:SetDotPitchX( 6, 0 )
				end
			},
			{
				function ()
					return self.Tip:SetDotPitchY( 3, 0 )
				end
			},
			{
				function ()
					return self.Tip:SetDotPitchContrast( 0.15, 0 )
				end
			},
			{
				function ()
					return self.Tip:SetAnchorsAndPosition( 1, 0, 0, 0, 0, _1080p * 15, 0, 0, 0 )
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
		Cap:RegisterAnimationSequence( "DisabledOver", {
			{
				function ()
					return self.Cap:SetRGBFromInt( 0, 0 )
				end
			},
			{
				function ()
					return self.Cap:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.DisabledOver = function ()
			TipShadow:AnimateLoop( "DisabledOver" )
			MainShadow:AnimateLoop( "DisabledOver" )
			GlowRight:AnimateLoop( "DisabledOver" )
			GlowMid:AnimateLoop( "DisabledOver" )
			GlowLeft:AnimateLoop( "DisabledOver" )
			Tip:AnimateLoop( "DisabledOver" )
			Main:AnimateLoop( "DisabledOver" )
			Cap:AnimateLoop( "DisabledOver" )
		end
		
	end
	
	self._animationSets.ThirdGamemode = function ()
		DropShadow:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.DropShadow:SetAlpha( 0, 0 )
				end
			}
		} )
		TipShadow:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.TipShadow:SetAlpha( 0, 0 )
				end
			}
		} )
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
		GlowRight:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.GlowRight:SetAlpha( 0, 0 )
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
		Tip:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Tip:SetAlpha( 0, 0 )
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
		Cap:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Cap:SetAlpha( 0, 0 )
				end
			}
		} )
		if CONDITIONS.IsThirdGameMode( self ) then
			f20_local14:RegisterAnimationSequence( "DefaultSequence", {
				{
					function ()
						return self.CPBackground:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f20_local16:RegisterAnimationSequence( "DefaultSequence", {
				{
					function ()
						return self.CPBackgroundGlow:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f20_local17:RegisterAnimationSequence( "DefaultSequence", {
				{
					function ()
						return self.CPBlood:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f20_local18:RegisterAnimationSequence( "DefaultSequence", {
				{
					function ()
						return self.BorderBox:SetAlpha( 0.2, 0 )
					end
				}
			} )
		end
		self._sequences.DefaultSequence = function ()
			DropShadow:AnimateSequence( "DefaultSequence" )
			TipShadow:AnimateSequence( "DefaultSequence" )
			MainShadow:AnimateSequence( "DefaultSequence" )
			GlowRight:AnimateSequence( "DefaultSequence" )
			GlowMid:AnimateSequence( "DefaultSequence" )
			GlowLeft:AnimateSequence( "DefaultSequence" )
			Tip:AnimateSequence( "DefaultSequence" )
			Main:AnimateSequence( "DefaultSequence" )
			Gradient:AnimateSequence( "DefaultSequence" )
			Cap:AnimateSequence( "DefaultSequence" )
			if CONDITIONS.IsThirdGameMode( self ) then
				f20_local14:AnimateSequence( "DefaultSequence" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f20_local16:AnimateSequence( "DefaultSequence" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f20_local17:AnimateSequence( "DefaultSequence" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f20_local18:AnimateSequence( "DefaultSequence" )
			end
		end
		
		DropShadow:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.DropShadow:SetAlpha( 0, 0 )
				end
			}
		} )
		TipShadow:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.TipShadow:SetAlpha( 0, 0 )
				end
			}
		} )
		MainShadow:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.MainShadow:SetAlpha( 0, 0 )
				end
			}
		} )
		GlowRight:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.GlowRight:SetAlpha( 0, 0 )
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
		GlowLeft:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.GlowLeft:SetAlpha( 0, 0 )
				end
			}
		} )
		Tip:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Tip:SetAlpha( 0, 0 )
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
		Cap:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Cap:SetAlpha( 0, 0 )
				end
			}
		} )
		if CONDITIONS.IsThirdGameMode( self ) then
			f20_local14:RegisterAnimationSequence( "ButtonOver", {
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
			f20_local16:RegisterAnimationSequence( "ButtonOver", {
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
			f20_local17:RegisterAnimationSequence( "ButtonOver", {
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
			f20_local18:RegisterAnimationSequence( "ButtonOver", {
				{
					function ()
						return self.BorderBox:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		self._sequences.ButtonOver = function ()
			DropShadow:AnimateSequence( "ButtonOver" )
			TipShadow:AnimateSequence( "ButtonOver" )
			MainShadow:AnimateSequence( "ButtonOver" )
			GlowRight:AnimateSequence( "ButtonOver" )
			GlowMid:AnimateSequence( "ButtonOver" )
			GlowLeft:AnimateSequence( "ButtonOver" )
			Tip:AnimateSequence( "ButtonOver" )
			Main:AnimateSequence( "ButtonOver" )
			Gradient:AnimateSequence( "ButtonOver" )
			Cap:AnimateSequence( "ButtonOver" )
			if CONDITIONS.IsThirdGameMode( self ) then
				f20_local14:AnimateSequence( "ButtonOver" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f20_local16:AnimateSequence( "ButtonOver" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f20_local17:AnimateSequence( "ButtonOver" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f20_local18:AnimateSequence( "ButtonOver" )
			end
		end
		
		DropShadow:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.DropShadow:SetAlpha( 0, 0 )
				end
			}
		} )
		TipShadow:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.TipShadow:SetAlpha( 0, 0 )
				end
			}
		} )
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
		GlowRight:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.GlowRight:SetAlpha( 0, 0 )
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
		Tip:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Tip:SetAlpha( 0, 0 )
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
		Cap:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Cap:SetAlpha( 0, 0 )
				end
			}
		} )
		if CONDITIONS.IsThirdGameMode( self ) then
			f20_local13:RegisterAnimationSequence( "ButtonUp", {
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
			f20_local14:RegisterAnimationSequence( "ButtonUp", {
				{
					function ()
						return self.CPBackground:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f20_local15:RegisterAnimationSequence( "ButtonUp", {
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
			f20_local16:RegisterAnimationSequence( "ButtonUp", {
				{
					function ()
						return self.CPBackgroundGlow:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f20_local17:RegisterAnimationSequence( "ButtonUp", {
				{
					function ()
						return self.CPBlood:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f20_local18:RegisterAnimationSequence( "ButtonUp", {
				{
					function ()
						return self.BorderBox:SetAlpha( 0.2, 0 )
					end
				}
			} )
		end
		self._sequences.ButtonUp = function ()
			DropShadow:AnimateSequence( "ButtonUp" )
			TipShadow:AnimateSequence( "ButtonUp" )
			MainShadow:AnimateSequence( "ButtonUp" )
			GlowRight:AnimateSequence( "ButtonUp" )
			GlowMid:AnimateSequence( "ButtonUp" )
			GlowLeft:AnimateSequence( "ButtonUp" )
			Tip:AnimateSequence( "ButtonUp" )
			Main:AnimateSequence( "ButtonUp" )
			Gradient:AnimateSequence( "ButtonUp" )
			Cap:AnimateSequence( "ButtonUp" )
			if CONDITIONS.IsThirdGameMode( self ) then
				f20_local13:AnimateSequence( "ButtonUp" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f20_local14:AnimateSequence( "ButtonUp" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f20_local15:AnimateSequence( "ButtonUp" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f20_local16:AnimateSequence( "ButtonUp" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f20_local17:AnimateSequence( "ButtonUp" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f20_local18:AnimateSequence( "ButtonUp" )
			end
		end
		
		DropShadow:RegisterAnimationSequence( "Disabled", {
			{
				function ()
					return self.DropShadow:SetAlpha( 0, 0 )
				end
			}
		} )
		TipShadow:RegisterAnimationSequence( "Disabled", {
			{
				function ()
					return self.TipShadow:SetAlpha( 0, 0 )
				end
			}
		} )
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
		GlowRight:RegisterAnimationSequence( "Disabled", {
			{
				function ()
					return self.GlowRight:SetAlpha( 0, 0 )
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
		GlowLeft:RegisterAnimationSequence( "Disabled", {
			{
				function ()
					return self.GlowLeft:SetAlpha( 0, 0 )
				end
			}
		} )
		Tip:RegisterAnimationSequence( "Disabled", {
			{
				function ()
					return self.Tip:SetAlpha( 0, 0 )
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
		Cap:RegisterAnimationSequence( "Disabled", {
			{
				function ()
					return self.Cap:SetAlpha( 0, 0 )
				end
			}
		} )
		if CONDITIONS.IsThirdGameMode( self ) then
			f20_local13:RegisterAnimationSequence( "Disabled", {
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
			f20_local14:RegisterAnimationSequence( "Disabled", {
				{
					function ()
						return self.CPBackground:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f20_local15:RegisterAnimationSequence( "Disabled", {
				{
					function ()
						return self.CPBackgroundGlowFlicker:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f20_local16:RegisterAnimationSequence( "Disabled", {
				{
					function ()
						return self.CPBackgroundGlow:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f20_local17:RegisterAnimationSequence( "Disabled", {
				{
					function ()
						return self.CPBlood:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f20_local18:RegisterAnimationSequence( "Disabled", {
				{
					function ()
						return self.BorderBox:SetAlpha( 0.3, 0 )
					end
				}
			} )
		end
		self._sequences.Disabled = function ()
			DropShadow:AnimateSequence( "Disabled" )
			TipShadow:AnimateSequence( "Disabled" )
			MainShadow:AnimateSequence( "Disabled" )
			GlowRight:AnimateSequence( "Disabled" )
			GlowMid:AnimateSequence( "Disabled" )
			GlowLeft:AnimateSequence( "Disabled" )
			Tip:AnimateSequence( "Disabled" )
			Main:AnimateSequence( "Disabled" )
			Gradient:AnimateSequence( "Disabled" )
			Cap:AnimateSequence( "Disabled" )
			if CONDITIONS.IsThirdGameMode( self ) then
				f20_local13:AnimateSequence( "Disabled" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f20_local14:AnimateSequence( "Disabled" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f20_local15:AnimateSequence( "Disabled" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f20_local16:AnimateSequence( "Disabled" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f20_local17:AnimateSequence( "Disabled" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f20_local18:AnimateSequence( "Disabled" )
			end
		end
		
		if CONDITIONS.IsThirdGameMode( self ) then
			f20_local13:RegisterAnimationSequence( "Flicker", {
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
				f20_local13:AnimateLoop( "Flicker" )
			end
		end
		
		if CONDITIONS.IsThirdGameMode( self ) then
			f20_local15:RegisterAnimationSequence( "FlickerGlow", {
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
				f20_local15:AnimateLoop( "FlickerGlow" )
			end
		end
		
		DropShadow:RegisterAnimationSequence( "DisabledOver", {
			{
				function ()
					return self.DropShadow:SetAlpha( 0, 0 )
				end
			}
		} )
		TipShadow:RegisterAnimationSequence( "DisabledOver", {
			{
				function ()
					return self.TipShadow:SetAlpha( 0, 0 )
				end
			}
		} )
		MainShadow:RegisterAnimationSequence( "DisabledOver", {
			{
				function ()
					return self.MainShadow:SetAlpha( 0, 0 )
				end
			}
		} )
		GlowRight:RegisterAnimationSequence( "DisabledOver", {
			{
				function ()
					return self.GlowRight:SetAlpha( 0, 0 )
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
		GlowLeft:RegisterAnimationSequence( "DisabledOver", {
			{
				function ()
					return self.GlowLeft:SetAlpha( 0, 0 )
				end
			}
		} )
		Tip:RegisterAnimationSequence( "DisabledOver", {
			{
				function ()
					return self.Tip:SetAlpha( 0, 0 )
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
		Cap:RegisterAnimationSequence( "DisabledOver", {
			{
				function ()
					return self.Cap:SetAlpha( 0, 0 )
				end
			}
		} )
		if CONDITIONS.IsThirdGameMode( self ) then
			f20_local14:RegisterAnimationSequence( "DisabledOver", {
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
			f20_local16:RegisterAnimationSequence( "DisabledOver", {
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
			f20_local17:RegisterAnimationSequence( "DisabledOver", {
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
			f20_local18:RegisterAnimationSequence( "DisabledOver", {
				{
					function ()
						return self.BorderBox:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		self._sequences.DisabledOver = function ()
			DropShadow:AnimateSequence( "DisabledOver" )
			TipShadow:AnimateSequence( "DisabledOver" )
			MainShadow:AnimateSequence( "DisabledOver" )
			GlowRight:AnimateSequence( "DisabledOver" )
			GlowMid:AnimateSequence( "DisabledOver" )
			GlowLeft:AnimateSequence( "DisabledOver" )
			Tip:AnimateSequence( "DisabledOver" )
			Main:AnimateSequence( "DisabledOver" )
			Gradient:AnimateSequence( "DisabledOver" )
			Cap:AnimateSequence( "DisabledOver" )
			if CONDITIONS.IsThirdGameMode( self ) then
				f20_local14:AnimateSequence( "DisabledOver" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f20_local16:AnimateSequence( "DisabledOver" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f20_local17:AnimateSequence( "DisabledOver" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f20_local18:AnimateSequence( "DisabledOver" )
			end
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f20_local1, controller )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	return self
end

MenuBuilder.registerType( "GenericListArrowButtonBackground", GenericListArrowButtonBackground )
LockTable( _M )
