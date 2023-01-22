local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ReticleChargingBrackets( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 200 * _1080p, 0, 200 * _1080p )
	self.id = "ReticleChargingBrackets"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Fluff = nil
	
	Fluff = LUI.UIImage.new()
	Fluff.id = "Fluff"
	Fluff:SetAlpha( 0.6, 0 )
	Fluff:setImage( RegisterMaterial( "hud_reticle_railgun_fluff" ), 0 )
	Fluff:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -256, _1080p * 256, _1080p * -82, _1080p * 173 )
	self:addElement( Fluff )
	self.Fluff = Fluff
	
	local Stencil = nil
	
	Stencil = LUI.UIImage.new()
	Stencil.id = "Stencil"
	Stencil:SetRGBFromInt( 0, 0 )
	Stencil:setImage( RegisterMaterial( "hud_reticle_circle_fill" ), 0 )
	Stencil:SetBlendMode( BLEND_MODE.addWithAlpha )
	Stencil:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -54, _1080p * 54, _1080p * -54, _1080p * 54 )
	self:addElement( Stencil )
	self.Stencil = Stencil
	
	local LFrame = nil
	
	LFrame = LUI.UIImage.new()
	LFrame.id = "LFrame"
	LFrame:SetRGBFromInt( 3355443, 0 )
	LFrame:setImage( RegisterMaterial( "hud_reticle_charging_bracket" ), 0 )
	LFrame:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -169, _1080p * -158, _1080p * -35, _1080p * 99 )
	LFrame:SubscribeToModel( DataSources.inGame.player.currentWeapon.charge:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.player.currentWeapon.charge:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			LFrame:SetAlpha( Lerp( f2_local0, 0.2, 0.4 ), 0 )
		end
	end )
	self:addElement( LFrame )
	self.LFrame = LFrame
	
	local LGlow = nil
	
	LGlow = LUI.UIImage.new()
	LGlow.id = "LGlow"
	LGlow:SetRGBFromTable( SWATCHES.Reticles.AzureBlue, 0 )
	LGlow:SetAlpha( Lerp( 0, 0.2, 0.4 ), 0 )
	LGlow:SetGlitchEnabled( true )
	LGlow:SetGlitchAmount( 0, 0 )
	LGlow:SetGlitchBlockWidth( 50, 0 )
	LGlow:SetGlitchBlockHeight( 50, 0 )
	LGlow:SetGlitchDistortionRange( 16, 0 )
	LGlow:SetGlitchScanlinePitch( 1, 0 )
	LGlow:SetGlitchMaskPitch( 1, 0 )
	LGlow:setImage( RegisterMaterial( "hud_reticle_charging_bracket" ), 0 )
	LGlow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -169, _1080p * -158, _1080p * -35, _1080p * 99 )
	LGlow:SubscribeToModel( DataSources.inGame.player.currentWeapon.charge:GetModel( f1_local1 ), function ()
		local f3_local0 = DataSources.inGame.player.currentWeapon.charge:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			LGlow:SetVMin( Add( f3_local0, -1 ), 0 )
		end
	end )
	LGlow:SubscribeToModel( DataSources.inGame.player.currentWeapon.charge:GetModel( f1_local1 ), function ()
		local f4_local0 = DataSources.inGame.player.currentWeapon.charge:GetValue( f1_local1 )
		if f4_local0 ~= nil then
			LGlow:SetVMax( Add( f4_local0, 0 ), 0 )
		end
	end )
	self:addElement( LGlow )
	self.LGlow = LGlow
	
	local LGauge = nil
	
	LGauge = LUI.UIImage.new()
	LGauge.id = "LGauge"
	LGauge:SetRGBFromTable( SWATCHES.Reticles.AzureBlue, 0 )
	LGauge:SetAlpha( Lerp( 1, 0.2, 0.4 ), 0 )
	LGauge:SetGlitchEnabled( true )
	LGauge:SetGlitchAmount( 0, 0 )
	LGauge:SetGlitchBlockWidth( 50, 0 )
	LGauge:SetGlitchBlockHeight( 50, 0 )
	LGauge:SetGlitchDistortionRange( 16, 0 )
	LGauge:SetGlitchScanlinePitch( 1, 0 )
	LGauge:SetGlitchMaskPitch( 1, 0 )
	LGauge:setImage( RegisterMaterial( "hud_reticle_charging_bracket" ), 0 )
	LGauge:SetBlendMode( BLEND_MODE.addWithAlpha )
	LGauge:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -169, _1080p * -158, _1080p * -35, _1080p * 99 )
	LGauge:SubscribeToModel( DataSources.inGame.player.currentWeapon.charge:GetModel( f1_local1 ), function ()
		local f5_local0 = DataSources.inGame.player.currentWeapon.charge:GetValue( f1_local1 )
		if f5_local0 ~= nil then
			LGauge:SetVMin( Add( f5_local0, -1 ), 0 )
		end
	end )
	LGauge:SubscribeToModel( DataSources.inGame.player.currentWeapon.charge:GetModel( f1_local1 ), function ()
		local f6_local0 = DataSources.inGame.player.currentWeapon.charge:GetValue( f1_local1 )
		if f6_local0 ~= nil then
			LGauge:SetVMax( Add( f6_local0, 0 ), 0 )
		end
	end )
	self:addElement( LGauge )
	self.LGauge = LGauge
	
	local RFrame = nil
	
	RFrame = LUI.UIImage.new()
	RFrame.id = "RFrame"
	RFrame:SetRGBFromInt( 3355443, 0 )
	RFrame:setImage( RegisterMaterial( "hud_reticle_charging_bracket" ), 0 )
	RFrame:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 158, _1080p * 169, _1080p * -35, _1080p * 99 )
	RFrame:SubscribeToModel( DataSources.inGame.player.currentWeapon.charge:GetModel( f1_local1 ), function ()
		local f7_local0 = DataSources.inGame.player.currentWeapon.charge:GetValue( f1_local1 )
		if f7_local0 ~= nil then
			RFrame:SetAlpha( Lerp( f7_local0, 0.2, 0.4 ), 0 )
		end
	end )
	self:addElement( RFrame )
	self.RFrame = RFrame
	
	local RGlow = nil
	
	RGlow = LUI.UIImage.new()
	RGlow.id = "RGlow"
	RGlow:SetRGBFromTable( SWATCHES.Reticles.AzureBlue, 0 )
	RGlow:SetAlpha( Lerp( 0, 0.2, 0.4 ), 0 )
	RGlow:SetGlitchEnabled( true )
	RGlow:SetGlitchAmount( 0, 0 )
	RGlow:SetGlitchBlockWidth( 50, 0 )
	RGlow:SetGlitchBlockHeight( 50, 0 )
	RGlow:SetGlitchDistortionRange( 16, 0 )
	RGlow:SetGlitchScanlinePitch( 1, 0 )
	RGlow:SetGlitchMaskPitch( 1, 0 )
	RGlow:setImage( RegisterMaterial( "hud_reticle_charging_bracket" ), 0 )
	RGlow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 158, _1080p * 169, _1080p * -35, _1080p * 99 )
	RGlow:SubscribeToModel( DataSources.inGame.player.currentWeapon.charge:GetModel( f1_local1 ), function ()
		local f8_local0 = DataSources.inGame.player.currentWeapon.charge:GetValue( f1_local1 )
		if f8_local0 ~= nil then
			RGlow:SetVMin( Add( f8_local0, -1 ), 0 )
		end
	end )
	RGlow:SubscribeToModel( DataSources.inGame.player.currentWeapon.charge:GetModel( f1_local1 ), function ()
		local f9_local0 = DataSources.inGame.player.currentWeapon.charge:GetValue( f1_local1 )
		if f9_local0 ~= nil then
			RGlow:SetVMax( Add( f9_local0, 0 ), 0 )
		end
	end )
	self:addElement( RGlow )
	self.RGlow = RGlow
	
	local RGauge = nil
	
	RGauge = LUI.UIImage.new()
	RGauge.id = "RGauge"
	RGauge:SetRGBFromTable( SWATCHES.Reticles.AzureBlue, 0 )
	RGauge:SetAlpha( Lerp( 1, 0.2, 0.4 ), 0 )
	RGauge:SetGlitchEnabled( true )
	RGauge:SetGlitchAmount( 0, 0 )
	RGauge:SetGlitchBlockWidth( 50, 0 )
	RGauge:SetGlitchBlockHeight( 50, 0 )
	RGauge:SetGlitchDistortionRange( 16, 0 )
	RGauge:SetGlitchScanlinePitch( 1, 0 )
	RGauge:SetGlitchMaskPitch( 1, 0 )
	RGauge:setImage( RegisterMaterial( "hud_reticle_charging_bracket" ), 0 )
	RGauge:SetBlendMode( BLEND_MODE.addWithAlpha )
	RGauge:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 158, _1080p * 169, _1080p * -35, _1080p * 99 )
	RGauge:SubscribeToModel( DataSources.inGame.player.currentWeapon.charge:GetModel( f1_local1 ), function ()
		local f10_local0 = DataSources.inGame.player.currentWeapon.charge:GetValue( f1_local1 )
		if f10_local0 ~= nil then
			RGauge:SetVMin( Add( f10_local0, -1 ), 0 )
		end
	end )
	RGauge:SubscribeToModel( DataSources.inGame.player.currentWeapon.charge:GetModel( f1_local1 ), function ()
		local f11_local0 = DataSources.inGame.player.currentWeapon.charge:GetValue( f1_local1 )
		if f11_local0 ~= nil then
			RGauge:SetVMax( Add( f11_local0, 0 ), 0 )
		end
	end )
	self:addElement( RGauge )
	self.RGauge = RGauge
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		LFrame:RegisterAnimationSequence( "Pulse", {
			{
				function ()
					return self.LFrame:SetScale( 0, 0 )
				end,
				function ()
					return self.LFrame:SetScale( 0.1, 100, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.LFrame:SetScale( 0, 600, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.LFrame:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -169, _1080p * -158, _1080p * -35, _1080p * 99, 0 )
				end,
				function ()
					return self.LFrame:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -177, _1080p * -166, _1080p * -35, _1080p * 99, 100, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.LFrame:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -169, _1080p * -158, _1080p * -35, _1080p * 99, 599, LUI.EASING.outQuadratic )
				end
			}
		} )
		LGlow:RegisterAnimationSequence( "Pulse", {
			{
				function ()
					return self.LGlow:SetScale( 0, 0 )
				end,
				function ()
					return self.LGlow:SetScale( 0.1, 100, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.LGlow:SetScale( 0, 600, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.LGlow:SetAlpha( Lerp( 0, 0.2, 0.4 ), 0 )
				end,
				function ()
					return self.LGlow:SetAlpha( Lerp( 1, 0.2, 0.4 ), 100, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.LGlow:SetAlpha( Lerp( 0, 0.2, 0.4 ), 600, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.LGlow:SetRGBFromTable( SWATCHES.Reticles.BrightGreen, 100, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.LGlow:SetRGBFromTable( SWATCHES.Reticles.AzureBlue, 600, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.LGlow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -169, _1080p * -158, _1080p * -35, _1080p * 99, 0 )
				end,
				function ()
					return self.LGlow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -177, _1080p * -166, _1080p * -35, _1080p * 99, 100, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.LGlow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -169, _1080p * -158, _1080p * -35, _1080p * 99, 599, LUI.EASING.outQuadratic )
				end
			}
		} )
		LGauge:RegisterAnimationSequence( "Pulse", {
			{
				function ()
					return self.LGauge:SetScale( 0, 0 )
				end,
				function ()
					return self.LGauge:SetScale( 0.1, 100, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.LGauge:SetRGBFromTable( SWATCHES.Reticles.AzureBlue, 0 )
				end,
				function ()
					return self.LGauge:SetRGBFromTable( SWATCHES.Reticles.VibrantTeal, 100, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.LGauge:SetRGBFromTable( SWATCHES.Reticles.AzureBlue, 600, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.LGauge:SetAlpha( Lerp( 1, 0.2, 0.4 ), 700, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.LGauge:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -169, _1080p * -158, _1080p * -35, _1080p * 99, 0 )
				end,
				function ()
					return self.LGauge:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -177, _1080p * -166, _1080p * -35, _1080p * 99, 100, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.LGauge:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -169, _1080p * -158, _1080p * -35, _1080p * 99, 599, LUI.EASING.outQuadratic )
				end
			}
		} )
		RFrame:RegisterAnimationSequence( "Pulse", {
			{
				function ()
					return self.RFrame:SetScale( 0, 0 )
				end,
				function ()
					return self.RFrame:SetScale( 0.1, 100, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.RFrame:SetScale( 0, 600, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.RFrame:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 158, _1080p * 169, _1080p * -35, _1080p * 99, 0 )
				end,
				function ()
					return self.RFrame:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 166, _1080p * 177, _1080p * -35, _1080p * 99, 100, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.RFrame:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 158, _1080p * 169, _1080p * -35, _1080p * 99, 599, LUI.EASING.outQuadratic )
				end
			}
		} )
		RGlow:RegisterAnimationSequence( "Pulse", {
			{
				function ()
					return self.RGlow:SetScale( 0, 0 )
				end,
				function ()
					return self.RGlow:SetScale( 0.1, 100, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.RGlow:SetScale( 0, 600, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.RGlow:SetAlpha( Lerp( 0, 0.2, 0.4 ), 0 )
				end,
				function ()
					return self.RGlow:SetAlpha( Lerp( 1, 0.2, 0.4 ), 100, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.RGlow:SetAlpha( Lerp( 0, 0.2, 0.4 ), 600, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.RGlow:SetRGBFromTable( SWATCHES.Reticles.AzureBlue, 0 )
				end,
				function ()
					return self.RGlow:SetRGBFromTable( SWATCHES.Reticles.BrightGreen, 100, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.RGlow:SetRGBFromTable( SWATCHES.Reticles.AzureBlue, 600, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.RGlow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 158, _1080p * 169, _1080p * -35, _1080p * 99, 0 )
				end,
				function ()
					return self.RGlow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 166, _1080p * 177, _1080p * -35, _1080p * 99, 100, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.RGlow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 158, _1080p * 169, _1080p * -35, _1080p * 99, 599, LUI.EASING.outQuadratic )
				end
			}
		} )
		RGauge:RegisterAnimationSequence( "Pulse", {
			{
				function ()
					return self.RGauge:SetScale( 0, 0 )
				end,
				function ()
					return self.RGauge:SetScale( 0.1, 100, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.RGauge:SetScale( 0, 600, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.RGauge:SetAlpha( Lerp( 1, 0.2, 0.4 ), 0 )
				end,
				function ()
					return self.RGauge:SetAlpha( Lerp( 1, 0.2, 0.4 ), 700, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.RGauge:SetRGBFromTable( SWATCHES.Reticles.AzureBlue, 0 )
				end,
				function ()
					return self.RGauge:SetRGBFromTable( SWATCHES.Reticles.VibrantTeal, 100, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.RGauge:SetRGBFromTable( SWATCHES.Reticles.AzureBlue, 600, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.RGauge:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 158, _1080p * 169, _1080p * -35, _1080p * 99, 0 )
				end,
				function ()
					return self.RGauge:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 166, _1080p * 177, _1080p * -35, _1080p * 99, 100, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.RGauge:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 158, _1080p * 169, _1080p * -35, _1080p * 99, 599, LUI.EASING.outQuadratic )
				end
			}
		} )
		self._sequences.Pulse = function ()
			LFrame:AnimateSequence( "Pulse" )
			LGlow:AnimateSequence( "Pulse" )
			LGauge:AnimateSequence( "Pulse" )
			RFrame:AnimateSequence( "Pulse" )
			RGlow:AnimateSequence( "Pulse" )
			RGauge:AnimateSequence( "Pulse" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.player.currentWeapon.shotCounter:GetModel( f1_local1 ), function ()
		ACTIONS.AnimateSequence( self, "Pulse" )
	end )
	return self
end

MenuBuilder.registerType( "ReticleChargingBrackets", ReticleChargingBrackets )
LockTable( _M )
