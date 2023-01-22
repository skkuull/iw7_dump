local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function GaussHybridChargeMeter( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 490 * _1080p, 0, 330 * _1080p )
	self.id = "GaussHybridChargeMeter"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Glow = nil
	
	Glow = LUI.UIImage.new()
	Glow.id = "Glow"
	Glow:SetRGBFromInt( 16764672, 0 )
	Glow:SetAlpha( 0, 0 )
	Glow:setImage( RegisterMaterial( "hud_reticle_hybrid_meter" ), 0 )
	Glow:SetBlendMode( BLEND_MODE.addWithAlpha )
	Glow:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( Glow )
	self.Glow = Glow
	
	local AmmoCounterBase = nil
	
	AmmoCounterBase = MenuBuilder.BuildRegisteredType( "AmmoCounterBase", {
		controllerIndex = f1_local1
	} )
	AmmoCounterBase.id = "AmmoCounterBase"
	AmmoCounterBase:SetRGBFromTable( SWATCHES.Reticles.Orange, 0 )
	AmmoCounterBase:SetScale( 0.3, 0 )
	AmmoCounterBase.AmmoCounterShadow:SetRGBFromTable( SWATCHES.Reticles.DarkBrown, 0 )
	AmmoCounterBase.AmmoCounterShadow:SetShadowMinDistance( -0.2, 0 )
	AmmoCounterBase.AmmoCounterShadow:SetShadowRGBFromTable( SWATCHES.Reticles.DarkBrown, 0 )
	AmmoCounterBase.AmmoCounter:SetAlpha( 0.2, 0 )
	AmmoCounterBase.AmmoCounter:SetShadowMinDistance( -0.2, 0 )
	AmmoCounterBase.AmmoCounter:SetShadowMaxDistance( 0.2, 0 )
	AmmoCounterBase.AmmoCounter:SetShadowRGBFromTable( SWATCHES.Reticles.Yellow, 0 )
	AmmoCounterBase:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -91, _1080p * -51, _1080p * -58, _1080p * -42 )
	self:addElement( AmmoCounterBase )
	self.AmmoCounterBase = AmmoCounterBase
	
	local ChargeMeterScopeCopy0 = nil
	
	ChargeMeterScopeCopy0 = MenuBuilder.BuildRegisteredType( "ChargeMeterScope", {
		controllerIndex = f1_local1
	} )
	ChargeMeterScopeCopy0.id = "ChargeMeterScopeCopy0"
	ChargeMeterScopeCopy0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 46, _1080p * 56, _1080p * 94, _1080p * 224 )
	self:addElement( ChargeMeterScopeCopy0 )
	self.ChargeMeterScopeCopy0 = ChargeMeterScopeCopy0
	
	local ChargeMeterScopeCopy1 = nil
	
	ChargeMeterScopeCopy1 = MenuBuilder.BuildRegisteredType( "ChargeMeterScope", {
		controllerIndex = f1_local1
	} )
	ChargeMeterScopeCopy1.id = "ChargeMeterScopeCopy1"
	ChargeMeterScopeCopy1:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -56, _1080p * -46, _1080p * 94, _1080p * 224 )
	self:addElement( ChargeMeterScopeCopy1 )
	self.ChargeMeterScopeCopy1 = ChargeMeterScopeCopy1
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Glow:RegisterAnimationSequence( "IsNotAimingAtEnemy", {
			{
				function ()
					return self.Glow:SetAlpha( 0, 60 )
				end
			},
			{
				function ()
					return self.Glow:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -23.64, _1080p * 23.64, _1080p * -19.39, _1080p * 19.39, 59 )
				end
			}
		} )
		self._sequences.IsNotAimingAtEnemy = function ()
			Glow:AnimateSequence( "IsNotAimingAtEnemy" )
		end
		
		Glow:RegisterAnimationSequence( "IsAimingAtEnemy", {
			{
				function ()
					return self.Glow:SetAlpha( 0.4, 60 )
				end
			},
			{
				function ()
					return self.Glow:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0, 59 )
				end
			}
		} )
		self._sequences.IsAimingAtEnemy = function ()
			Glow:AnimateSequence( "IsAimingAtEnemy" )
		end
		
		ChargeMeterScopeCopy0:RegisterAnimationSequence( "ZoomAim", {
			{
				function ()
					return self.ChargeMeterScopeCopy0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 166, _1080p * 171, _1080p * 136, _1080p * 194, 59 )
				end
			}
		} )
		ChargeMeterScopeCopy1:RegisterAnimationSequence( "ZoomAim", {
			{
				function ()
					return self.ChargeMeterScopeCopy1:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -171, _1080p * -166, _1080p * 136, _1080p * 194, 59 )
				end
			}
		} )
		self._sequences.ZoomAim = function ()
			ChargeMeterScopeCopy0:AnimateSequence( "ZoomAim" )
			ChargeMeterScopeCopy1:AnimateSequence( "ZoomAim" )
		end
		
		ChargeMeterScopeCopy0:RegisterAnimationSequence( "AltAim", {
			{
				function ()
					return self.ChargeMeterScopeCopy0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 46, _1080p * 56, _1080p * 94, _1080p * 224, 0 )
				end
			}
		} )
		ChargeMeterScopeCopy1:RegisterAnimationSequence( "AltAim", {
			{
				function ()
					return self.ChargeMeterScopeCopy1:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -56, _1080p * -46, _1080p * 94, _1080p * 224, 0 )
				end
			}
		} )
		self._sequences.AltAim = function ()
			ChargeMeterScopeCopy0:AnimateSequence( "AltAim" )
			ChargeMeterScopeCopy1:AnimateSequence( "AltAim" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.player.currentWeapon.isAimingAtEnemy:GetModel( f1_local1 ), function ()
		if DataSources.inGame.player.currentWeapon.isAimingAtEnemy:GetValue( f1_local1 ) ~= nil and DataSources.inGame.player.currentWeapon.isAimingAtEnemy:GetValue( f1_local1 ) == true then
			ACTIONS.AnimateSequence( self, "IsAimingAtEnemy" )
		end
		if DataSources.inGame.player.currentWeapon.isAimingAtEnemy:GetValue( f1_local1 ) ~= nil and DataSources.inGame.player.currentWeapon.isAimingAtEnemy:GetValue( f1_local1 ) == false then
			ACTIONS.AnimateSequence( self, "IsNotAimingAtEnemy" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.player.currentWeapon.inAltMode:GetModel( f1_local1 ), function ()
		if DataSources.inGame.player.currentWeapon.inAltMode:GetValue( f1_local1 ) ~= nil and DataSources.inGame.player.currentWeapon.inAltMode:GetValue( f1_local1 ) == true then
			ACTIONS.AnimateSequence( self, "AltAim" )
		end
		if DataSources.inGame.player.currentWeapon.inAltMode:GetValue( f1_local1 ) ~= nil and DataSources.inGame.player.currentWeapon.inAltMode:GetValue( f1_local1 ) ~= true then
			ACTIONS.AnimateSequence( self, "ZoomAim" )
		end
	end )
	return self
end

MenuBuilder.registerType( "GaussHybridChargeMeter", GaussHybridChargeMeter )
LockTable( _M )
