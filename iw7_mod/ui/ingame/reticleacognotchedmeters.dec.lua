local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = 0.9
	local f1_local1 = DataSources.inGame.player.currentWeapon.adsPercent
	f1_arg0:SubscribeToModel( f1_local1:GetModel( f1_arg1 ), function ( f2_arg0 )
		local f2_local0 = DataModel.GetModelValue( f2_arg0 )
		if not f1_arg0.isVisible and f1_local0 <= f2_local0 then
			ACTIONS.AnimateSequence( f1_arg0, "ADSIN" )
			f1_arg0.isVisible = true
		elseif f1_arg0.isVisible and f2_local0 < f1_local0 then
			ACTIONS.AnimateSequence( f1_arg0, "ADSOUT" )
			f1_arg0.isVisible = false
		end
	end )
	local f1_local2 = f1_local1:GetValue( f1_arg1 )
	if f1_local2 then
		if f1_local0 <= f1_local2 then
			f1_arg0.isVisible = true
			ACTIONS.AnimateSequence( f1_arg0, "ADSIN" )
		else
			f1_arg0.isVisible = false
			ACTIONS.AnimateSequence( f1_arg0, "ADSOUT" )
		end
	end
end

function ReticleACOGNotchedMeters( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 29 * _1080p, 0, 29 * _1080p )
	self.id = "ReticleACOGNotchedMeters"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local NotchRight = nil
	
	NotchRight = LUI.UIImage.new()
	NotchRight.id = "NotchRight"
	NotchRight:SetRGBFromInt( 0, 0 )
	NotchRight:SetAlpha( 0.6, 0 )
	NotchRight:setImage( RegisterMaterial( "hud_reticle_notch_meter" ), 0 )
	NotchRight:SetUseAA( true )
	NotchRight:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * 22, _1080p * 124, _1080p * -9, _1080p * 8 )
	self:addElement( NotchRight )
	self.NotchRight = NotchRight
	
	local NotchLeft = nil
	
	NotchLeft = LUI.UIImage.new()
	NotchLeft.id = "NotchLeft"
	NotchLeft:SetRGBFromInt( 0, 0 )
	NotchLeft:SetAlpha( 0.6, 0 )
	NotchLeft:setImage( RegisterMaterial( "hud_reticle_notch_meter" ), 0 )
	NotchLeft:SetUseAA( true )
	NotchLeft:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -124, _1080p * -22, _1080p * -9, _1080p * 8 )
	self:addElement( NotchLeft )
	self.NotchLeft = NotchLeft
	
	local RingShadow = nil
	
	RingShadow = LUI.UIImage.new()
	RingShadow.id = "RingShadow"
	RingShadow:SetRGBFromTable( SWATCHES.Reticles.Red, 0 )
	RingShadow:SetAlpha( 0.4, 0 )
	RingShadow:SetZRotation( 180, 0 )
	RingShadow:SetScale( 0.05, 0 )
	RingShadow:setImage( RegisterMaterial( "hud_reticle_circle_notch_dot" ), 0 )
	self:addElement( RingShadow )
	self.RingShadow = RingShadow
	
	local RingOuterGlow = nil
	
	RingOuterGlow = LUI.UIImage.new()
	RingOuterGlow.id = "RingOuterGlow"
	RingOuterGlow:SetRGBFromTable( SWATCHES.Reticles.Red, 0 )
	RingOuterGlow:SetAlpha( 0, 0 )
	RingOuterGlow:SetZRotation( 180, 0 )
	RingOuterGlow:SetScale( 0.1, 0 )
	RingOuterGlow:setImage( RegisterMaterial( "hud_reticle_circle_notch_dot" ), 0 )
	RingOuterGlow:SetBlendMode( BLEND_MODE.addWithAlpha )
	self:addElement( RingOuterGlow )
	self.RingOuterGlow = RingOuterGlow
	
	local RingInnerGlow = nil
	
	RingInnerGlow = LUI.UIImage.new()
	RingInnerGlow.id = "RingInnerGlow"
	RingInnerGlow:SetRGBFromTable( SWATCHES.Reticles.Red, 0 )
	RingInnerGlow:SetAlpha( 0.4, 0 )
	RingInnerGlow:SetZRotation( 180, 0 )
	RingInnerGlow:setImage( RegisterMaterial( "hud_reticle_circle_notch_dot" ), 0 )
	RingInnerGlow:SetBlendMode( BLEND_MODE.addWithAlpha )
	self:addElement( RingInnerGlow )
	self.RingInnerGlow = RingInnerGlow
	
	local Dot = nil
	
	Dot = MenuBuilder.BuildRegisteredType( "DotBase", {
		controllerIndex = f3_local1
	} )
	Dot.id = "Dot"
	Dot.DotShadow:SetRGBFromTable( SWATCHES.Reticles.Red, 0 )
	Dot.Dot:SetRGBFromTable( SWATCHES.Reticles.Red, 0 )
	Dot.DotHighlight:SetRGBFromTable( SWATCHES.Reticles.LightRed, 0 )
	Dot:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -3, _1080p * 3, _1080p * -3, _1080p * 3 )
	self:addElement( Dot )
	self.Dot = Dot
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		NotchRight:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.NotchRight:SetAlpha( 0, 20 )
				end
			},
			{
				function ()
					return self.NotchRight:SetScale( -0.5, 20 )
				end
			},
			{
				function ()
					return self.NotchRight:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -16, _1080p * 86, _1080p * -9, _1080p * 8, 19 )
				end
			}
		} )
		NotchLeft:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.NotchLeft:SetAlpha( 0, 20 )
				end
			},
			{
				function ()
					return self.NotchLeft:SetScale( -0.5, 20 )
				end
			},
			{
				function ()
					return self.NotchLeft:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -86, _1080p * 16, _1080p * -9, _1080p * 8, 19 )
				end
			}
		} )
		RingShadow:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.RingShadow:SetAlpha( 0, 20 )
				end
			}
		} )
		RingOuterGlow:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.RingOuterGlow:SetAlpha( 0, 60 )
				end
			}
		} )
		RingInnerGlow:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.RingInnerGlow:SetAlpha( 0, 20 )
				end
			}
		} )
		Dot:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.Dot:SetAlpha( 0, 20 )
				end
			}
		} )
		self._sequences.ADSOUT = function ()
			NotchRight:AnimateSequence( "ADSOUT" )
			NotchLeft:AnimateSequence( "ADSOUT" )
			RingShadow:AnimateSequence( "ADSOUT" )
			RingOuterGlow:AnimateSequence( "ADSOUT" )
			RingInnerGlow:AnimateSequence( "ADSOUT" )
			Dot:AnimateSequence( "ADSOUT" )
		end
		
		NotchRight:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.NotchRight:SetAlpha( 0.6, 20 )
				end
			},
			{
				function ()
					return self.NotchRight:SetScale( 0, 20 )
				end
			},
			{
				function ()
					return self.NotchRight:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * 22, _1080p * 124, _1080p * -9, _1080p * 8, 19 )
				end
			}
		} )
		NotchLeft:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.NotchLeft:SetAlpha( 0.6, 20 )
				end
			},
			{
				function ()
					return self.NotchLeft:SetScale( 0, 20 )
				end
			},
			{
				function ()
					return self.NotchLeft:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -124, _1080p * -22, _1080p * -9, _1080p * 8, 19 )
				end
			}
		} )
		RingShadow:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.RingShadow:SetAlpha( 0.4, 20 )
				end
			}
		} )
		RingOuterGlow:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.RingOuterGlow:SetAlpha( 0.4, 60 )
				end
			}
		} )
		RingInnerGlow:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.RingInnerGlow:SetAlpha( 0.4, 20 )
				end
			}
		} )
		Dot:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.Dot:SetAlpha( 0.8, 20 )
				end
			}
		} )
		self._sequences.ADSIN = function ()
			NotchRight:AnimateSequence( "ADSIN" )
			NotchLeft:AnimateSequence( "ADSIN" )
			RingShadow:AnimateSequence( "ADSIN" )
			RingOuterGlow:AnimateSequence( "ADSIN" )
			RingInnerGlow:AnimateSequence( "ADSIN" )
			Dot:AnimateSequence( "ADSIN" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "ReticleACOGNotchedMeters", ReticleACOGNotchedMeters )
LockTable( _M )
