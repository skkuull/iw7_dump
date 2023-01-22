local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = 0.5
	f1_arg0:SubscribeToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_arg1 ), function ( f2_arg0 )
		local f2_local0 = DataModel.GetModelValue( f2_arg0 )
		if not f1_arg0.isVisible and f1_local0 <= f2_local0 then
			ACTIONS.AnimateSequence( f1_arg0, "ADSIN" )
			f1_arg0.isVisible = true
		elseif f1_arg0.isVisible and f2_local0 < f1_local0 then
			ACTIONS.AnimateSequence( f1_arg0, "ADSOUT" )
			f1_arg0.isVisible = false
		end
	end )
end

function ReticlePhaseBase( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 16 * _1080p, 0, 16 * _1080p )
	self.id = "ReticlePhaseBase"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local ScopeReticleSpacer = nil
	
	ScopeReticleSpacer = MenuBuilder.BuildRegisteredType( "ScopeReticleSpacer", {
		minSizeADS = 40,
		maxSizeADS = 40,
		minSizeHip = 10,
		maxSizeHip = 40,
		adjustLeft = true,
		adjustRight = true,
		adjustTop = true,
		adjustBottom = true,
		controllerIndex = f3_local1
	} )
	ScopeReticleSpacer.id = "ScopeReticleSpacer"
	ScopeReticleSpacer:SetAlpha( 0, 0 )
	ScopeReticleSpacer:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 16, _1080p * -16, 0, 0 )
	self:addElement( ScopeReticleSpacer )
	self.ScopeReticleSpacer = ScopeReticleSpacer
	
	local RightCrosshairS = nil
	
	RightCrosshairS = LUI.UIImage.new()
	RightCrosshairS.id = "RightCrosshairS"
	RightCrosshairS:SetRGBFromTable( SWATCHES.Reticles.Orange, 0 )
	RightCrosshairS:SetAlpha( 0.4, 0 )
	RightCrosshairS:setImage( RegisterMaterial( "hud_reticle_notch_rounded_long" ), 0 )
	RightCrosshairS:SetUseAA( true )
	RightCrosshairS:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -1, _1080p * 19, _1080p * -2, _1080p * 2 )
	self:addElement( RightCrosshairS )
	self.RightCrosshairS = RightCrosshairS
	
	local LeftCrosshairS = nil
	
	LeftCrosshairS = LUI.UIImage.new()
	LeftCrosshairS.id = "LeftCrosshairS"
	LeftCrosshairS:SetRGBFromTable( SWATCHES.Reticles.Orange, 0 )
	LeftCrosshairS:SetAlpha( 0.4, 0 )
	LeftCrosshairS:setImage( RegisterMaterial( "hud_reticle_notch_rounded_long" ), 0 )
	LeftCrosshairS:SetUseAA( true )
	LeftCrosshairS:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -19, _1080p * 1, _1080p * -2, _1080p * 2 )
	self:addElement( LeftCrosshairS )
	self.LeftCrosshairS = LeftCrosshairS
	
	local Notch2S = nil
	
	Notch2S = LUI.UIImage.new()
	Notch2S.id = "Notch2S"
	Notch2S:SetRGBFromTable( SWATCHES.Reticles.Orange, 0 )
	Notch2S:SetAlpha( 0.3, 0 )
	Notch2S:setImage( RegisterMaterial( "hud_reticle_notch_rounded_long" ), 0 )
	Notch2S:SetUseAA( true )
	Notch2S:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -12.5, _1080p * 12.5, _1080p * 18.5, _1080p * 23.5 )
	self:addElement( Notch2S )
	self.Notch2S = Notch2S
	
	local Notch1S = nil
	
	Notch1S = LUI.UIImage.new()
	Notch1S.id = "Notch1S"
	Notch1S:SetRGBFromTable( SWATCHES.Reticles.Orange, 0 )
	Notch1S:SetAlpha( 0.3, 0 )
	Notch1S:setImage( RegisterMaterial( "hud_reticle_notch_rounded_long" ), 0 )
	Notch1S:SetUseAA( true )
	Notch1S:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -9.5, _1080p * 9.5, _1080p * 10.5, _1080p * 15.5 )
	self:addElement( Notch1S )
	self.Notch1S = Notch1S
	
	local RightCrosshair = nil
	
	RightCrosshair = LUI.UIImage.new()
	RightCrosshair.id = "RightCrosshair"
	RightCrosshair:SetAlpha( 0.8, 0 )
	RightCrosshair:setImage( RegisterMaterial( "hud_reticle_notch" ), 0 )
	RightCrosshair:SetUseAA( true )
	RightCrosshair:SetBlendMode( BLEND_MODE.addWithAlpha )
	RightCrosshair:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, 0, _1080p * 18, _1080p * -2, _1080p * 2 )
	self:addElement( RightCrosshair )
	self.RightCrosshair = RightCrosshair
	
	local LeftCrosshair = nil
	
	LeftCrosshair = LUI.UIImage.new()
	LeftCrosshair.id = "LeftCrosshair"
	LeftCrosshair:SetAlpha( 0.8, 0 )
	LeftCrosshair:setImage( RegisterMaterial( "hud_reticle_notch" ), 0 )
	LeftCrosshair:SetUseAA( true )
	LeftCrosshair:SetBlendMode( BLEND_MODE.addWithAlpha )
	LeftCrosshair:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -18, 0, _1080p * -2, _1080p * 2 )
	self:addElement( LeftCrosshair )
	self.LeftCrosshair = LeftCrosshair
	
	local Notch2 = nil
	
	Notch2 = LUI.UIImage.new()
	Notch2.id = "Notch2"
	Notch2:SetAlpha( 0.8, 0 )
	Notch2:setImage( RegisterMaterial( "hud_reticle_notch" ), 0 )
	Notch2:SetUseAA( true )
	Notch2:SetBlendMode( BLEND_MODE.addWithAlpha )
	Notch2:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -11, _1080p * 11, _1080p * 19, _1080p * 23 )
	self:addElement( Notch2 )
	self.Notch2 = Notch2
	
	local Notch1 = nil
	
	Notch1 = LUI.UIImage.new()
	Notch1.id = "Notch1"
	Notch1:SetAlpha( 0.8, 0 )
	Notch1:setImage( RegisterMaterial( "hud_reticle_notch" ), 0 )
	Notch1:SetUseAA( true )
	Notch1:SetBlendMode( BLEND_MODE.addWithAlpha )
	Notch1:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -8, _1080p * 8, _1080p * 11, _1080p * 15 )
	self:addElement( Notch1 )
	self.Notch1 = Notch1
	
	local ArrowS = nil
	
	ArrowS = LUI.UIImage.new()
	ArrowS.id = "ArrowS"
	ArrowS:SetRGBFromTable( SWATCHES.Reticles.Orange, 0 )
	ArrowS:SetAlpha( 0, 0 )
	ArrowS:SetScale( 0.17, 0 )
	ArrowS:setImage( RegisterMaterial( "hud_reticle_caret" ), 0 )
	ArrowS:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -7, _1080p * 7, _1080p * -4, _1080p * 10 )
	self:addElement( ArrowS )
	self.ArrowS = ArrowS
	
	local Arrow = nil
	
	Arrow = LUI.UIImage.new()
	Arrow.id = "Arrow"
	Arrow:SetAlpha( 0, 0 )
	Arrow:setImage( RegisterMaterial( "hud_reticle_caret" ), 0 )
	Arrow:SetBlendMode( BLEND_MODE.addWithAlpha )
	Arrow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -7, _1080p * 7, _1080p * -4, _1080p * 10 )
	self:addElement( Arrow )
	self.Arrow = Arrow
	
	local ArrowHighlight = nil
	
	ArrowHighlight = LUI.UIImage.new()
	ArrowHighlight.id = "ArrowHighlight"
	ArrowHighlight:SetAlpha( 0, 0 )
	ArrowHighlight:SetZRotation( 45, 0 )
	ArrowHighlight:setImage( RegisterMaterial( "hud_reticle_plaw_reticle" ), 0 )
	ArrowHighlight:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -5, _1080p * 5, _1080p * 1, _1080p * 11 )
	self:addElement( ArrowHighlight )
	self.ArrowHighlight = ArrowHighlight
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		ScopeReticleSpacer:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					
				end
			},
			{
				function ()
					
				end
			}
		} )
		RightCrosshairS:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.RightCrosshairS:SetAlpha( 0.2, 70 )
				end
			}
		} )
		LeftCrosshairS:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.LeftCrosshairS:SetAlpha( 0.2, 70 )
				end
			}
		} )
		Notch2S:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.Notch2S:SetAlpha( 0.3, 70 )
				end
			},
			{
				function ()
					return self.Notch2S:SetZRotation( 0, 70 )
				end
			},
			{
				function ()
					return self.Notch2S:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -9, _1080p * 9, _1080p * 12, _1080p * 16, 70 )
				end
			}
		} )
		Notch1S:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.Notch1S:SetAlpha( 0.3, 70 )
				end
			},
			{
				function ()
					return self.Notch1S:SetZRotation( 0, 70 )
				end
			},
			{
				function ()
					return self.Notch1S:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -13, _1080p * 13, _1080p * 20, _1080p * 24, 70 )
				end
			}
		} )
		RightCrosshair:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.RightCrosshair:SetAlpha( 0.8, 70 )
				end
			}
		} )
		LeftCrosshair:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.LeftCrosshair:SetAlpha( 0.8, 70 )
				end
			}
		} )
		Notch2:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.Notch2:SetAlpha( 0.8, 70 )
				end
			},
			{
				function ()
					return self.Notch2:SetZRotation( 0, 70 )
				end
			},
			{
				function ()
					return self.Notch2:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -8, _1080p * 8, _1080p * 12, _1080p * 16, 70 )
				end
			}
		} )
		Notch1:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.Notch1:SetAlpha( 0.8, 70 )
				end
			},
			{
				function ()
					return self.Notch1:SetZRotation( 0, 70 )
				end
			},
			{
				function ()
					return self.Notch1:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -12, _1080p * 12, _1080p * 20, _1080p * 24, 70 )
				end
			}
		} )
		ArrowS:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.ArrowS:SetAlpha( 0.4, 70 )
				end
			}
		} )
		Arrow:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.Arrow:SetAlpha( 0.8, 70 )
				end
			}
		} )
		ArrowHighlight:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.ArrowHighlight:SetAlpha( 0.2, 70 )
				end
			}
		} )
		self._sequences.ADSIN = function ()
			ScopeReticleSpacer:AnimateSequence( "ADSIN" )
			RightCrosshairS:AnimateSequence( "ADSIN" )
			LeftCrosshairS:AnimateSequence( "ADSIN" )
			Notch2S:AnimateSequence( "ADSIN" )
			Notch1S:AnimateSequence( "ADSIN" )
			RightCrosshair:AnimateSequence( "ADSIN" )
			LeftCrosshair:AnimateSequence( "ADSIN" )
			Notch2:AnimateSequence( "ADSIN" )
			Notch1:AnimateSequence( "ADSIN" )
			ArrowS:AnimateSequence( "ADSIN" )
			Arrow:AnimateSequence( "ADSIN" )
			ArrowHighlight:AnimateSequence( "ADSIN" )
		end
		
		Notch2S:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.Notch2S:SetZRotation( 0, 70 )
				end
			},
			{
				function ()
					return self.Notch2S:SetAlpha( 0.4, 70 )
				end
			},
			{
				function ()
					return self.Notch2S:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -12, _1080p * 12, _1080p * 15.5, _1080p * 20.5, 70 )
				end
			}
		} )
		Notch1S:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.Notch1S:SetZRotation( 0, 70 )
				end
			},
			{
				function ()
					return self.Notch1S:SetAlpha( 0.4, 70 )
				end
			},
			{
				function ()
					return self.Notch1S:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -9, _1080p * 9, _1080p * 7.5, _1080p * 12.5, 70 )
				end
			}
		} )
		Notch2:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.Notch2:SetZRotation( 0, 70 )
				end
			},
			{
				function ()
					return self.Notch2:SetAlpha( 1, 70 )
				end
			},
			{
				function ()
					return self.Notch2:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -11, _1080p * 11, _1080p * 16, _1080p * 20, 70 )
				end
			}
		} )
		Notch1:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.Notch1:SetZRotation( 0, 70 )
				end
			},
			{
				function ()
					return self.Notch1:SetAlpha( 1, 70 )
				end
			},
			{
				function ()
					return self.Notch1:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -8, _1080p * 8, _1080p * 8, _1080p * 12, 70 )
				end
			}
		} )
		ArrowS:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.ArrowS:SetAlpha( 0, 70 )
				end
			}
		} )
		Arrow:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.Arrow:SetAlpha( 0, 70 )
				end
			}
		} )
		ArrowHighlight:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.ArrowHighlight:SetAlpha( 0, 70 )
				end
			}
		} )
		self._sequences.ADSOUT = function ()
			Notch2S:AnimateSequence( "ADSOUT" )
			Notch1S:AnimateSequence( "ADSOUT" )
			Notch2:AnimateSequence( "ADSOUT" )
			Notch1:AnimateSequence( "ADSOUT" )
			ArrowS:AnimateSequence( "ADSOUT" )
			Arrow:AnimateSequence( "ADSOUT" )
			ArrowHighlight:AnimateSequence( "ADSOUT" )
		end
		
		RightCrosshairS:RegisterAnimationSequence( "Pulse", {
			{
				function ()
					return self.RightCrosshairS:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -1, _1080p * 19, _1080p * -2, _1080p * 2, 0 )
				end,
				function ()
					return self.RightCrosshairS:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -1, _1080p * 19, _1080p * -2, _1080p * 2, 879 )
				end,
				function ()
					return self.RightCrosshairS:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * 17, _1080p * 39, _1080p * -2, _1080p * 2, 870, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.RightCrosshairS:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -1, _1080p * 19, _1080p * -2, _1080p * 2, 1150, LUI.EASING.inQuadratic )
				end,
				function ()
					return self.RightCrosshairS:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -1, _1080p * 19, _1080p * -2.01, _1080p * 2.01, 1089 )
				end
			}
		} )
		LeftCrosshairS:RegisterAnimationSequence( "Pulse", {
			{
				function ()
					return self.LeftCrosshairS:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -19, _1080p * 1, _1080p * -2, _1080p * 2, 0 )
				end,
				function ()
					return self.LeftCrosshairS:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -19, _1080p * 1, _1080p * -2, _1080p * 2, 879 )
				end,
				function ()
					return self.LeftCrosshairS:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -37, _1080p * -15, _1080p * -2, _1080p * 2, 870, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.LeftCrosshairS:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -19, _1080p * 1, _1080p * -2, _1080p * 2, 1150, LUI.EASING.inQuadratic )
				end,
				function ()
					return self.LeftCrosshairS:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -19, _1080p * 1, _1080p * -2.01, _1080p * 2.01, 1089 )
				end
			}
		} )
		RightCrosshair:RegisterAnimationSequence( "Pulse", {
			{
				function ()
					return self.RightCrosshair:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, 0, _1080p * 18, _1080p * -2, _1080p * 2, 0 )
				end,
				function ()
					return self.RightCrosshair:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, 0, _1080p * 18, _1080p * -2, _1080p * 2, 879 )
				end,
				function ()
					return self.RightCrosshair:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * 19, _1080p * 37, _1080p * -2, _1080p * 2, 870, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.RightCrosshair:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, 0, _1080p * 18, _1080p * -2, _1080p * 2, 1150, LUI.EASING.inQuadratic )
				end,
				function ()
					return self.RightCrosshair:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, 0, _1080p * 18, _1080p * -2.01, _1080p * 2.01, 1089 )
				end
			}
		} )
		LeftCrosshair:RegisterAnimationSequence( "Pulse", {
			{
				function ()
					return self.LeftCrosshair:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -18, 0, _1080p * -2, _1080p * 2, 0 )
				end,
				function ()
					return self.LeftCrosshair:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -18, 0, _1080p * -2, _1080p * 2, 879 )
				end,
				function ()
					return self.LeftCrosshair:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -35, _1080p * -17, _1080p * -2, _1080p * 2, 870, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.LeftCrosshair:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -18, 0, _1080p * -2, _1080p * 2, 1150, LUI.EASING.inQuadratic )
				end,
				function ()
					return self.LeftCrosshair:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -18, 0, _1080p * -2.01, _1080p * 2.01, 1089 )
				end
			}
		} )
		self._sequences.Pulse = function ()
			RightCrosshairS:AnimateLoop( "Pulse" )
			LeftCrosshairS:AnimateLoop( "Pulse" )
			RightCrosshair:AnimateLoop( "Pulse" )
			LeftCrosshair:AnimateLoop( "Pulse" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "ReticlePhaseBase", ReticlePhaseBase )
LockTable( _M )
