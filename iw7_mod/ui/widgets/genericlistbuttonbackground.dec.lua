local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1 )
	if f1_arg0._lastState ~= f1_arg1 then
		f1_arg0._lastState = f1_arg1
		ACTIONS.AnimateSequence( f1_arg0, f1_arg1 )
	end
end

f0_local1 = function ( f2_arg0, f2_arg1 )
	if f2_arg0._lastAnimFunc ~= f2_arg1 then
		f2_arg0._lastAnimFunc = f2_arg1
		f2_arg1( f2_arg0 )
	end
end

f0_local2 = function ( f3_arg0 )
	f3_arg0.Gradient:SetAlpha( 1, 0 )
	f3_arg0.Gradient:SetRGBFromInt( 16742912, 0 )
	f3_arg0.Gradient:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 20 * _1080p, 0, 0, 0 )
	f3_arg0.Gradient:SetAlpha( 0.2, 400, LUI.EASING.inQuartic )
	f3_arg0.Gradient:SetRGBFromInt( 16774827, 400, LUI.EASING.inQuartic )
	f3_arg0.Gradient:SetAnchorsAndPosition( 0, 0, 0, 0, 0, -50 * _1080p, 0, 0, 400, LUI.EASING.inQuartic )
end

local f0_local3 = function ( f4_arg0 )
	f4_arg0.Gradient:SetAlpha( 0 )
	f4_arg0.Gradient:SetAnchorsAndPosition( 0, 0.2, 0, 0, 0, 0, 0, 0, 0, LUI.EASING.outBack )
end

local f0_local4 = function ( f5_arg0 )
	if not CONDITIONS.IsThirdGameMode() then
		f5_arg0.MainShadow:SetAlpha( 0.4, 0 )
		f5_arg0.MainShadow:SetDotPitchX( 9, 0 )
		f5_arg0.MainShadow:SetDotPitchY( 6, 0 )
		f5_arg0.MainShadow:SetDotPitchContrast( 0.2, 0 )
		f5_arg0.Main:SetRGBFromTable( COLORS.creamyYellow, 0 )
		f5_arg0.Main:SetAlpha( 1, 0 )
		f5_arg0.Main:SetDotPitchX( 6, 0 )
		f5_arg0.Main:SetDotPitchY( 3, 0 )
		f5_arg0.Main:SetDotPitchContrast( 0.15, 0 )
		if f5_arg0.Cap then
			f5_arg0.Cap:SetRGBFromInt( 0, 0 )
			f5_arg0.Cap:SetAlpha( 1, 0 )
		end
		f0_local2( f5_arg0 )
	else
		f5_arg0.Main:SetRGBFromTable( SWATCHES.Zombies.menuHeader, 0 )
		f5_arg0.Main:SetAlpha( 1, 0 )
	end
end

local f0_local5 = function ( f6_arg0 )
	if not CONDITIONS.IsThirdGameMode() then
		f6_arg0.MainShadow:SetAlpha( 0, 0 )
		f6_arg0.MainShadow:SetDotPitchX( 0, 0 )
		f6_arg0.MainShadow:SetDotPitchY( 0, 0 )
		f6_arg0.MainShadow:SetDotPitchContrast( 0, 0 )
		f6_arg0.GlowRight:SetAlpha( 0, 0 )
		f6_arg0.GlowMid:SetAlpha( 0, 0 )
		f6_arg0.GlowLeft:SetAlpha( 0, 0 )
		f6_arg0.Main:SetAlpha( 0.8, 0 )
		f6_arg0.Main:SetRGBFromInt( 0, 0 )
		f6_arg0.Main:SetDotPitchX( 0, 0 )
		f6_arg0.Main:SetDotPitchY( 0, 0 )
		f6_arg0.Main:SetDotPitchContrast( 0, 0 )
		f6_arg0.Gradient:SetAlpha( 0, 100 )
		if f6_arg0.Cap then
			f6_arg0.Cap:SetAlpha( 1, 0 )
			f6_arg0.Cap:SetRGBFromInt( 14277081, 0 )
		end
		f6_arg0.Main:SetRGBFromTable( SWATCHES.CACAbility, 0 )
		f0_local3( f6_arg0 )
	else
		f6_arg0.MainShadow:SetAlpha( 0, 0 )
		f6_arg0.MainShadow:SetRGBFromTable( SWATCHES.Zombies.menuHeader, 0 )
		f6_arg0.GlowRight:SetAlpha( 0, 0 )
		f6_arg0.GlowMid:SetAlpha( 0, 0 )
		f6_arg0.GlowLeft:SetAlpha( 0, 0 )
		f6_arg0.Main:SetAlpha( 0.8, 0 )
		f6_arg0.Main:SetRGBFromInt( 0, 0 )
		f6_arg0.Gradient:SetAlpha( 0, 100 )
	end
end

local f0_local6 = function ( f7_arg0 )
	if not CONDITIONS.IsThirdGameMode() then
		f7_arg0.MainShadow:SetAlpha( 0, 0 )
		f7_arg0.MainShadow:SetDotPitchX( 0, 0 )
		f7_arg0.MainShadow:SetDotPitchY( 0, 0 )
		f7_arg0.MainShadow:SetDotPitchContrast( 0, 0 )
		f7_arg0.GlowRight:SetAlpha( 0, 0 )
		f7_arg0.GlowMid:SetAlpha( 0, 0 )
		f7_arg0.GlowLeft:SetAlpha( 0, 0 )
		f7_arg0.Main:SetAlpha( 0.4, 0 )
		f7_arg0.Main:SetRGBFromInt( 0, 0 )
		f7_arg0.Gradient:SetAlpha( 0, 100 )
		if f7_arg0.Cap then
			f7_arg0.Cap:SetAlpha( 1, 0 )
			f7_arg0.Cap:SetRGBFromInt( 0, 0 )
		end
		f0_local3( f7_arg0 )
	else
		f7_arg0.MainShadow:SetAlpha( 0, 0 )
		f7_arg0.MainShadow:SetRGBFromTable( SWATCHES.Zombies.menuHeader, 0 )
		f7_arg0.GlowRight:SetAlpha( 0, 0 )
		f7_arg0.GlowMid:SetAlpha( 0, 0 )
		f7_arg0.GlowLeft:SetAlpha( 0, 0 )
		f7_arg0.Main:SetAlpha( 0.4, 0 )
		f7_arg0.Main:SetRGBFromInt( 0, 0 )
		f7_arg0.Gradient:SetAlpha( 0, 100 )
	end
end

local f0_local7 = function ( f8_arg0 )
	if not CONDITIONS.IsThirdGameMode() then
		f8_arg0.MainShadow:SetDotPitchX( 6, 0 )
		f8_arg0.MainShadow:SetDotPitchY( 3, 0 )
		f8_arg0.MainShadow:SetDotPitchContrast( 0.1, 0 )
		f8_arg0.MainShadow:SetAlpha( 0.25, 100 )
		f8_arg0.Main:SetAlpha( 1, 0 )
		f8_arg0.Main:SetDotPitchX( 6, 0 )
		f8_arg0.Main:SetDotPitchY( 3, 0 )
		f8_arg0.Main:SetDotPitchContrast( 0.1, 0 )
		f8_arg0.Main:SetRGBFromTable( COLORS.creamyYellow, 0 )
		if f8_arg0.Cap then
			f8_arg0.Cap:SetRGBFromInt( 0, 0 )
			f8_arg0.Cap:SetAlpha( 1, 0 )
		end
		f0_local2( f8_arg0 )
	else
		f8_arg0.MainShadow:SetRGBFromTable( SWATCHES.Zombies.menuHeader, 0 )
		f8_arg0.MainShadow:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 6, _1080p * 6, 0 )
		f8_arg0.Main:SetRGBFromTable( SWATCHES.Zombies.menuHeader, 0 )
		f8_arg0.Main:SetAlpha( 1, 0 )
	end
end

local f0_local8 = function ( f9_arg0 )
	f9_arg0.MainShadow:SetAlpha( 0.4, 0 )
	f9_arg0.MainShadow:SetDotPitchX( 9, 0 )
	f9_arg0.MainShadow:SetDotPitchY( 6, 0 )
	f9_arg0.MainShadow:SetDotPitchContrast( 0.2, 0 )
	f9_arg0.Main:SetRGBFromTable( COLORS.creamyYellow, 0 )
	f9_arg0.Main:SetAlpha( 1, 0 )
	f9_arg0.Main:SetDotPitchContrast( 0.15, 0 )
	f9_arg0.Main:SetDotPitchY( 3, 0 )
	f9_arg0.Main:SetDotPitchX( 6, 0 )
	if f9_arg0.Cap then
		f9_arg0.Cap:SetRGBFromInt( 0, 0 )
		f9_arg0.Cap:SetAlpha( 1, 0 )
	end
end

local f0_local9 = function ( f10_arg0 )
	f10_arg0.MainShadow:SetAlpha( 0, 0 )
	f10_arg0.MainShadow:SetDotPitchX( 0, 0 )
	f10_arg0.MainShadow:SetDotPitchY( 0, 0 )
	f10_arg0.MainShadow:SetDotPitchContrast( 0, 0 )
	f10_arg0.GlowRight:SetAlpha( 0, 0 )
	f10_arg0.GlowMid:SetAlpha( 0, 0 )
	f10_arg0.GlowLeft:SetAlpha( 0, 0 )
	f10_arg0.Main:SetAlpha( 0.8, 0 )
	f10_arg0.Main:SetRGBFromInt( 0, 0 )
	f10_arg0.Main:SetDotPitchX( 0, 0 )
	f10_arg0.Main:SetDotPitchY( 0, 0 )
	f10_arg0.Main:SetDotPitchContrast( 0, 0 )
	if f10_arg0.Cap then
		f10_arg0.Cap:SetAlpha( 0, 0 )
	end
	f10_arg0.Main:SetRGBFromTable( SWATCHES.CACAbility, 0 )
end

function PostLoadFunc( f11_arg0, f11_arg1, f11_arg2 )
	f11_arg0.Pick10Over = f0_local8
	f11_arg0.Pick10Up = f0_local9
	f11_arg0.GradientFlashOver = f0_local2
	f11_arg0.GradientFlashUp = f0_local3
	f11_arg0.ButtonOverAnims = f0_local4
	f11_arg0.ButtonUpAnims = f0_local5
	f11_arg0:addEventHandler( "button_over", function ( f12_arg0, f12_arg1 )
		f0_local0( f12_arg0, "ButtonOver" )
		f0_local1( f11_arg0, f0_local4 )
	end )
	f11_arg0:addEventHandler( "button_up", function ( f13_arg0, f13_arg1 )
		f0_local0( f13_arg0, "ButtonUp" )
		f0_local1( f11_arg0, f0_local5 )
	end )
	f11_arg0:addEventHandler( "button_disable", function ( f14_arg0, f14_arg1 )
		f0_local0( f14_arg0, "Disabled" )
		f0_local1( f11_arg0, f0_local6 )
	end )
	f11_arg0:addEventHandler( "button_over_disable", function ( f15_arg0, f15_arg1 )
		f0_local0( f15_arg0, "DisabledOver" )
		f0_local1( f11_arg0, f0_local7 )
	end )
end

function GenericListButtonBackground( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 215 * _1080p, 0, 30 * _1080p )
	self.id = "GenericListButtonBackground"
	self._animationSets = {}
	self._sequences = {}
	local f16_local1 = controller and controller.controllerIndex
	if not f16_local1 and not Engine.InFrontend() then
		f16_local1 = self:getRootController()
	end
	assert( f16_local1 )
	local f16_local2 = self
	local DropShadow = nil
	
	DropShadow = LUI.UIImage.new()
	DropShadow.id = "DropShadow"
	DropShadow:SetRGBFromInt( 0, 0 )
	DropShadow:SetAlpha( 0.3, 0 )
	DropShadow:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
	DropShadow:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, 0, _1080p * 4 )
	self:addElement( DropShadow )
	self.DropShadow = DropShadow
	
	local MainShadow = nil
	
	MainShadow = LUI.UIImage.new()
	MainShadow.id = "MainShadow"
	MainShadow:SetRGBFromInt( 13398272, 0 )
	MainShadow:SetAlpha( 0, 0 )
	MainShadow:SetBlendMode( BLEND_MODE.blend )
	MainShadow:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 6, _1080p * 6, _1080p * 6, _1080p * 6 )
	self:addElement( MainShadow )
	self.MainShadow = MainShadow
	
	local GlowRight = nil
	
	GlowRight = LUI.UIImage.new()
	GlowRight.id = "GlowRight"
	GlowRight:SetRGBFromInt( 12080170, 0 )
	GlowRight:SetAlpha( 0, 0 )
	GlowRight:SetZRotation( 180, 0 )
	GlowRight:setImage( RegisterMaterial( "wdg_button_glow_left" ), 0 )
	GlowRight:SetBlendMode( BLEND_MODE.addWithAlpha )
	GlowRight:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -32, _1080p * 32, _1080p * -8, _1080p * 8 )
	self:addElement( GlowRight )
	self.GlowRight = GlowRight
	
	local GlowMid = nil
	
	GlowMid = LUI.UIImage.new()
	GlowMid.id = "GlowMid"
	GlowMid:SetRGBFromInt( 12080170, 0 )
	GlowMid:SetAlpha( 0, 0 )
	GlowMid:setImage( RegisterMaterial( "wdg_button_glow_mid" ), 0 )
	GlowMid:SetBlendMode( BLEND_MODE.addWithAlpha )
	GlowMid:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 11, _1080p * -32, _1080p * -8, _1080p * 8 )
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
	Gradient:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 6, _1080p * 215, 0, 0 )
	self:addElement( Gradient )
	self.Gradient = Gradient
	
	local f16_local10 = nil
	if not CONDITIONS.IsThirdGameMode( self ) then
		f16_local10 = LUI.UIImage.new()
		f16_local10.id = "Cap"
		f16_local10:SetRGBFromInt( 14277081, 0 )
		f16_local10:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 6, 0, 0 )
		self:addElement( f16_local10 )
		self.Cap = f16_local10
	end
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
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
					return self.GlowMid:SetAlpha( 0.25, 1000, LUI.EASING.inSine )
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
					return self.GlowLeft:SetAlpha( 0.25, 1000, LUI.EASING.inSine )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			GlowRight:AnimateLoop( "ButtonOver" )
			GlowMid:AnimateLoop( "ButtonOver" )
			GlowLeft:AnimateLoop( "ButtonOver" )
		end
		
		self._sequences.ButtonUp = function ()
			
		end
		
		self._sequences.Disabled = function ()
			
		end
		
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
		self._sequences.DisabledOver = function ()
			GlowRight:AnimateLoop( "DisabledOver" )
			GlowMid:AnimateLoop( "DisabledOver" )
			GlowLeft:AnimateLoop( "DisabledOver" )
		end
		
		GlowRight:RegisterAnimationSequence( "Pick10Over", {
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
		GlowMid:RegisterAnimationSequence( "Pick10Over", {
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
		GlowLeft:RegisterAnimationSequence( "Pick10Over", {
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
		self._sequences.Pick10Over = function ()
			GlowRight:AnimateLoop( "Pick10Over" )
			GlowMid:AnimateLoop( "Pick10Over" )
			GlowLeft:AnimateLoop( "Pick10Over" )
		end
		
		self._sequences.Pick10Up = function ()
			
		end
		
		MainShadow:RegisterAnimationSequence( "AlignMainShadow", {
			{
				function ()
					return self.MainShadow:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 6, _1080p * 6, 0, 0, 0 )
				end
			}
		} )
		self._sequences.AlignMainShadow = function ()
			MainShadow:AnimateSequence( "AlignMainShadow" )
		end
		
	end
	
	self._animationSets.ThirdGamemode = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		MainShadow:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.MainShadow:SetAlpha( 0.4, 0 )
				end,
				function ()
					return self.MainShadow:SetAlpha( 0.3, 100 )
				end
			},
			{
				function ()
					return self.MainShadow:SetRGBFromTable( SWATCHES.Zombies.menuHeader, 0 )
				end
			},
			{
				function ()
					return self.MainShadow:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 6, _1080p * 6, 0 )
				end
			}
		} )
		GlowRight:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.GlowRight:SetRGBFromTable( SWATCHES.Zombies.menuHeader, 0 )
				end
			},
			{
				function ()
					return self.GlowRight:SetAlpha( 0.3, 100 )
				end,
				function ()
					return self.GlowRight:SetAlpha( 0.15, 300, LUI.EASING.outSine )
				end
			}
		} )
		GlowMid:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.GlowMid:SetRGBFromTable( SWATCHES.Zombies.menuHeader, 0 )
				end
			},
			{
				function ()
					return self.GlowMid:SetAlpha( 0.3, 100 )
				end,
				function ()
					return self.GlowMid:SetAlpha( 0.15, 300, LUI.EASING.outSine )
				end
			}
		} )
		GlowLeft:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.GlowLeft:SetRGBFromTable( SWATCHES.Zombies.menuHeader, 0 )
				end
			},
			{
				function ()
					return self.GlowLeft:SetAlpha( 0.3, 100 )
				end,
				function ()
					return self.GlowLeft:SetAlpha( 0.15, 300, LUI.EASING.outSine )
				end
			}
		} )
		Gradient:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Gradient:SetAlpha( 0.8, 0, LUI.EASING.outBack )
				end,
				function ()
					return self.Gradient:SetAlpha( 0.1, 400, LUI.EASING.outSine )
				end
			},
			{
				function ()
					return self.Gradient:SetRGBFromTable( SWATCHES.Zombies.menuHeader, 0, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.Gradient:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 6, _1080p * 300, 0, 0, 0, LUI.EASING.outBack )
				end,
				function ()
					return self.Gradient:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 6, _1080p * 200, 0, 0, 400, LUI.EASING.outSine )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			MainShadow:AnimateSequence( "ButtonOver" )
			GlowRight:AnimateSequence( "ButtonOver" )
			GlowMid:AnimateSequence( "ButtonOver" )
			GlowLeft:AnimateSequence( "ButtonOver" )
			Gradient:AnimateSequence( "ButtonOver" )
		end
		
		self._sequences.ButtonUp = function ()
			
		end
		
		self._sequences.Disabled = function ()
			
		end
		
		MainShadow:RegisterAnimationSequence( "DisabledOver", {
			{
				function ()
					return self.MainShadow:SetAlpha( 0.4, 0 )
				end,
				function ()
					return self.MainShadow:SetAlpha( 0.25, 100 )
				end
			}
		} )
		GlowRight:RegisterAnimationSequence( "DisabledOver", {
			{
				function ()
					return self.GlowRight:SetAlpha( 0.3, 100 )
				end,
				function ()
					return self.GlowRight:SetAlpha( 0.15, 300, LUI.EASING.outSine )
				end
			}
		} )
		GlowMid:RegisterAnimationSequence( "DisabledOver", {
			{
				function ()
					return self.GlowMid:SetAlpha( 0.3, 100 )
				end,
				function ()
					return self.GlowMid:SetAlpha( 0.15, 300, LUI.EASING.outSine )
				end
			}
		} )
		GlowLeft:RegisterAnimationSequence( "DisabledOver", {
			{
				function ()
					return self.GlowLeft:SetAlpha( 0.3, 100 )
				end,
				function ()
					return self.GlowLeft:SetAlpha( 0.15, 300, LUI.EASING.outSine )
				end
			}
		} )
		Gradient:RegisterAnimationSequence( "DisabledOver", {
			{
				function ()
					return self.Gradient:SetAlpha( 0.8, 0, LUI.EASING.outBack )
				end,
				function ()
					return self.Gradient:SetAlpha( 0.1, 400, LUI.EASING.outSine )
				end
			},
			{
				function ()
					return self.Gradient:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 6, _1080p * 300, 0, 0, 0, LUI.EASING.outBack )
				end,
				function ()
					return self.Gradient:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 6, _1080p * 200, 0, 0, 400, LUI.EASING.outSine )
				end
			}
		} )
		self._sequences.DisabledOver = function ()
			MainShadow:AnimateSequence( "DisabledOver" )
			GlowRight:AnimateSequence( "DisabledOver" )
			GlowMid:AnimateSequence( "DisabledOver" )
			GlowLeft:AnimateSequence( "DisabledOver" )
			Gradient:AnimateSequence( "DisabledOver" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f16_local1, controller )
	if CONDITIONS.IsThirdGameModeDesired( self ) then
		ACTIONS.SetAnimationSet( self, "ThirdGamemode" )
	end
	return self
end

MenuBuilder.registerType( "GenericListButtonBackground", GenericListButtonBackground )
LockTable( _M )
