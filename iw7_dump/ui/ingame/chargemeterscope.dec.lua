local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = DataSources.inGame.player.currentWeapon.charge:GetModel( f1_arg1 )
	f1_arg0:SubscribeToModel( f1_local0, function ()
		if f1_local0 ~= nil then
			local f2_local0 = math.floor( DataModel.GetModelValue( f1_local0 ) * 16 ) / 16
			f1_arg0.Button:SetVMax( f2_local0 )
			f1_arg0.Button:SetTopAnchor( 1 - f2_local0 )
			f1_arg0.Flare:SetVMax( f2_local0 )
			f1_arg0.Flare:SetTopAnchor( 1 - f2_local0 )
		end
	end )
end

function ChargeMeterScope( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 20 * _1080p, 0, 140 * _1080p )
	self.id = "ChargeMeterScope"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local ButtonS = nil
	
	ButtonS = LUI.UIImage.new()
	ButtonS.id = "ButtonS"
	ButtonS:SetRGBFromTable( SWATCHES.Reticles.Black, 0 )
	ButtonS:SetAlpha( Lerp( 0.6, 0.2, 0.4 ), 0 )
	ButtonS:SetGlitchEnabled( true )
	ButtonS:SetGlitchAmount( 0, 0 )
	ButtonS:SetGlitchBlockWidth( 50, 0 )
	ButtonS:SetGlitchBlockHeight( 50, 0 )
	ButtonS:SetGlitchDistortionRange( 16, 0 )
	ButtonS:SetGlitchScanlinePitch( 1, 0 )
	ButtonS:SetGlitchMaskPitch( 1, 0 )
	ButtonS:setImage( RegisterMaterial( "hud_reticle_charging_bracket" ), 0 )
	self:addElement( ButtonS )
	self.ButtonS = ButtonS
	
	local Button = nil
	
	Button = LUI.UIImage.new()
	Button.id = "Button"
	Button:SetRGBFromInt( 15028736, 0 )
	Button:SetAlpha( Lerp( 1, 0.2, 0.4 ), 0 )
	Button:SetGlitchEnabled( true )
	Button:SetGlitchAmount( 0, 0 )
	Button:SetGlitchBlockWidth( 50, 0 )
	Button:SetGlitchBlockHeight( 50, 0 )
	Button:SetGlitchDistortionRange( 16, 0 )
	Button:SetGlitchScanlinePitch( 1, 0 )
	Button:SetGlitchMaskPitch( 1, 0 )
	Button:setImage( RegisterMaterial( "hud_reticle_charging_bracket" ), 0 )
	self:addElement( Button )
	self.Button = Button
	
	local Flare = nil
	
	Flare = LUI.UIImage.new()
	Flare.id = "Flare"
	Flare:SetRGBFromTable( SWATCHES.Reticles.Orange, 0 )
	Flare:SetGlitchEnabled( true )
	Flare:SetGlitchAmount( 0, 0 )
	Flare:SetGlitchBlockWidth( 50, 0 )
	Flare:SetGlitchBlockHeight( 50, 0 )
	Flare:SetGlitchDistortionRange( 16, 0 )
	Flare:SetGlitchScanlinePitch( 1, 0 )
	Flare:SetGlitchMaskPitch( 1, 0 )
	Flare:setImage( RegisterMaterial( "hud_reticle_charging_bracket" ), 0 )
	Flare:SetBlendMode( BLEND_MODE.addWithAlpha )
	Flare:SubscribeToModel( DataSources.inGame.player.currentWeapon.charge:GetModel( f3_local1 ), function ()
		local f4_local0 = DataSources.inGame.player.currentWeapon.charge:GetValue( f3_local1 )
		if f4_local0 ~= nil then
			Flare:SetAlpha( Lerp( f4_local0, 0, 0.4 ), 0 )
		end
	end )
	self:addElement( Flare )
	self.Flare = Flare
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		ButtonS:RegisterAnimationSequence( "NotCharged", {
			{
				function ()
					return self.ButtonS:SetAlpha( Lerp( 0.4, 0.2, 0.4 ), 110 )
				end
			},
			{
				function ()
					return self.ButtonS:SetRGBFromTable( SWATCHES.Reticles.Black, 110 )
				end
			},
			{
				function ()
					return self.ButtonS:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0, 109 )
				end
			}
		} )
		Button:RegisterAnimationSequence( "NotCharged", {
			{
				function ()
					return self.Button:SetRGBFromInt( 15028736, 110 )
				end
			},
			{
				function ()
					return self.Button:SetAlpha( Lerp( 0.4, 0.2, 0.4 ), 110 )
				end
			},
			{
				function ()
					return self.Button:SetBlendMode( BLEND_MODE.disabled )
				end
			}
		} )
		Flare:RegisterAnimationSequence( "NotCharged", {
			{
				function ()
					return self.Flare:SetRGBFromTable( SWATCHES.Reticles.Orange, 110 )
				end
			}
		} )
		self._sequences.NotCharged = function ()
			ButtonS:AnimateSequence( "NotCharged" )
			Button:AnimateSequence( "NotCharged" )
			Flare:AnimateSequence( "NotCharged" )
		end
		
		ButtonS:RegisterAnimationSequence( "FullyCharged", {
			{
				function ()
					return self.ButtonS:SetRGBFromTable( SWATCHES.Reticles.Black, 320 )
				end,
				function ()
					return self.ButtonS:SetRGBFromInt( 32768, 80 )
				end
			},
			{
				function ()
					return self.ButtonS:SetAlpha( Lerp( 0.6, 0.2, 0.4 ), 400 )
				end
			},
			{
				function ()
					return self.ButtonS:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -2, _1080p * 2, _1080p * -0.5, _1080p * 0.5, 400 )
				end
			}
		} )
		Button:RegisterAnimationSequence( "FullyCharged", {
			{
				function ()
					return self.Button:SetAlpha( Lerp( 0.6, 0.2, 0.4 ), 0 )
				end,
				function ()
					return self.Button:SetAlpha( Lerp( 0.1, 0.2, 0.4 ), 80 )
				end,
				function ()
					return self.Button:SetAlpha( Lerp( 0.8, 0.2, 0.4 ), 80 )
				end,
				function ()
					return self.Button:SetAlpha( Lerp( 0.2, 0.2, 0.4 ), 80 )
				end,
				function ()
					return self.Button:SetAlpha( Lerp( 1, 0.2, 0.4 ), 80 )
				end,
				function ()
					return self.Button:SetAlpha( Lerp( 0.8, 0.2, 0.4 ), 90, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.Button:SetRGBFromTable( SWATCHES.Reticles.BrightGreen, 0 )
				end
			},
			{
				function ()
					return self.Button:SetBlendMode( BLEND_MODE.addWithAlpha )
				end
			}
		} )
		Flare:RegisterAnimationSequence( "FullyCharged", {
			{
				function ()
					return self.Flare:SetRGBFromTable( SWATCHES.Reticles.Black, 0 )
				end
			}
		} )
		self._sequences.FullyCharged = function ()
			ButtonS:AnimateSequence( "FullyCharged" )
			Button:AnimateSequence( "FullyCharged" )
			Flare:AnimateSequence( "FullyCharged" )
		end
		
		Button:RegisterAnimationSequence( "PreCharge", {
			{
				function ()
					return self.Button:SetRGBFromTable( SWATCHES.Reticles.BrightGreen, 100 )
				end
			}
		} )
		self._sequences.PreCharge = function ()
			Button:AnimateSequence( "PreCharge" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.player.currentWeapon.charge:GetModel( f3_local1 ), function ()
		if DataSources.inGame.player.currentWeapon.charge:GetValue( f3_local1 ) ~= nil and DataSources.inGame.player.currentWeapon.charge:GetValue( f3_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "FullyCharged" )
		end
		if DataSources.inGame.player.currentWeapon.charge:GetValue( f3_local1 ) ~= nil and DataSources.inGame.player.currentWeapon.charge:GetValue( f3_local1 ) ~= 1 then
			ACTIONS.AnimateSequence( self, "NotCharged" )
		end
		if DataSources.inGame.player.currentWeapon.charge:GetValue( f3_local1 ) ~= nil and DataSources.inGame.player.currentWeapon.charge:GetValue( f3_local1 ) >= 0.9 then
			ACTIONS.AnimateSequence( self, "PreCharge" )
		end
	end )
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "ChargeMeterScope", ChargeMeterScope )
LockTable( _M )
