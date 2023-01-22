local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.BonusText )
	local f1_local0 = f1_arg0.BonusText
	f1_local0:SetShadowUOffset( -0 )
	f1_local0:SetShadowVOffset( -0 )
end

function MK2BonusText( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 300 * _1080p, 0, 30 * _1080p )
	self.id = "MK2BonusText"
	self._animationSets = {}
	self._sequences = {}
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local BlurL = nil
	
	BlurL = LUI.UIBlur.new()
	BlurL.id = "BlurL"
	BlurL:SetRGBFromInt( 12566463, 0 )
	BlurL:setImage( RegisterMaterial( "widg_gradient_right_to_left" ), 0 )
	BlurL:SetBlurStrength( 2.75, 0 )
	BlurL:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 50, 0, 0 )
	self:addElement( BlurL )
	self.BlurL = BlurL
	
	local BlurR = nil
	
	BlurR = LUI.UIBlur.new()
	BlurR.id = "BlurR"
	BlurR:SetRGBFromInt( 12566463, 0 )
	BlurR:SetBlurStrength( 2.75, 0 )
	BlurR:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 50, 0, 0, 0 )
	self:addElement( BlurR )
	self.BlurR = BlurR
	
	local Gradient = nil
	
	Gradient = LUI.UIImage.new()
	Gradient.id = "Gradient"
	Gradient:SetAlpha( 0.5, 0 )
	Gradient:SetZRotation( 180, 0 )
	Gradient:setImage( RegisterMaterial( "wdg_gradient_flare" ), 0 )
	Gradient:SetBlendMode( BLEND_MODE.addWithAlpha )
	Gradient:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -250, 0, 0, 0 )
	self:addElement( Gradient )
	self.Gradient = Gradient
	
	local BonusText = nil
	
	BonusText = LUI.UIStyledText.new()
	BonusText.id = "BonusText"
	BonusText:SetRGBFromTable( SWATCHES.Popups.highlight, 0 )
	BonusText:setText( Engine.Localize( "LUA_MENU_MP_MK2_BONUS" ), 0 )
	BonusText:SetFontSize( 30 * _1080p )
	BonusText:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	BonusText:SetAlignment( LUI.Alignment.Right )
	BonusText:SetStartupDelay( 1250 )
	BonusText:SetLineHoldTime( 400 )
	BonusText:SetAnimMoveTime( 300 )
	BonusText:SetEndDelay( 1000 )
	BonusText:SetCrossfadeTime( 500 )
	BonusText:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	BonusText:SetMaxVisibleLines( 1 )
	BonusText:SetShadowMinDistance( -0.2, 0 )
	BonusText:SetShadowMaxDistance( 0.2, 0 )
	BonusText:SetShadowRGBFromInt( 0, 0 )
	BonusText:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 39, _1080p * 290, _1080p * 2.5, _1080p * -2.5 )
	self:addElement( BonusText )
	self.BonusText = BonusText
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		BlurL:RegisterAnimationSequence( "MK2On", {
			{
				function ()
					return self.BlurL:SetAlpha( 1, 20 )
				end
			},
			{
				function ()
					return self.BlurL:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 50, 0, 0, 0 )
				end
			}
		} )
		BlurR:RegisterAnimationSequence( "MK2On", {
			{
				function ()
					return self.BlurR:SetAlpha( 1, 0 )
				end
			}
		} )
		Gradient:RegisterAnimationSequence( "MK2On", {
			{
				function ()
					return self.Gradient:SetAlpha( 0.5, 0 )
				end,
				function ()
					return self.Gradient:SetAlpha( 0.5, 100 )
				end,
				function ()
					return self.Gradient:SetAlpha( 0.8, 100 )
				end,
				function ()
					return self.Gradient:SetAlpha( 0.5, 300 )
				end
			},
			{
				function ()
					return self.Gradient:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -250, 0, 0, 0, 0 )
				end
			}
		} )
		BonusText:RegisterAnimationSequence( "MK2On", {
			{
				function ()
					return self.BonusText:SetAlpha( 0, 0 )
				end,
				function ()
					return self.BonusText:SetAlpha( 1, 200, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.BonusText:SetRGBFromTable( SWATCHES.Popups.highlight, 0 )
				end,
				function ()
					return self.BonusText:SetRGBFromTable( SWATCHES.Popups.highlight, 200, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.BonusText:SetRGBFromInt( 16777120, 100, LUI.EASING.outSine )
				end,
				function ()
					return self.BonusText:SetRGBFromTable( SWATCHES.Popups.highlight, 200, LUI.EASING.inSine )
				end
			}
		} )
		self._sequences.MK2On = function ()
			BlurL:AnimateSequence( "MK2On" )
			BlurR:AnimateSequence( "MK2On" )
			Gradient:AnimateSequence( "MK2On" )
			BonusText:AnimateSequence( "MK2On" )
		end
		
		BlurL:RegisterAnimationSequence( "MK2Off", {
			{
				function ()
					return self.BlurL:SetAlpha( 0, 0 )
				end
			}
		} )
		BlurR:RegisterAnimationSequence( "MK2Off", {
			{
				function ()
					return self.BlurR:SetAlpha( 0, 0 )
				end
			}
		} )
		Gradient:RegisterAnimationSequence( "MK2Off", {
			{
				function ()
					return self.Gradient:SetAlpha( 0, 0 )
				end
			}
		} )
		BonusText:RegisterAnimationSequence( "MK2Off", {
			{
				function ()
					return self.BonusText:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.MK2Off = function ()
			BlurL:AnimateSequence( "MK2Off" )
			BlurR:AnimateSequence( "MK2Off" )
			Gradient:AnimateSequence( "MK2Off" )
			BonusText:AnimateSequence( "MK2Off" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "MK2BonusText", MK2BonusText )
LockTable( _M )
