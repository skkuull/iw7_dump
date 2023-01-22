local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function GaussEloChargeMeter( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 40 * _1080p, 0, 16 * _1080p )
	self.id = "GaussEloChargeMeter"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local AmmoCounterBase = nil
	
	AmmoCounterBase = MenuBuilder.BuildRegisteredType( "AmmoCounterBase", {
		controllerIndex = f1_local1
	} )
	AmmoCounterBase.id = "AmmoCounterBase"
	AmmoCounterBase:SetRGBFromTable( SWATCHES.Reticles.Yellow, 0 )
	AmmoCounterBase:SetAlpha( 0, 0 )
	AmmoCounterBase:SetScale( 0.4, 0 )
	AmmoCounterBase.AmmoCounterShadow:SetRGBFromTable( SWATCHES.Reticles.Orange, 0 )
	AmmoCounterBase.AmmoCounterShadow:SetShadowMinDistance( -0.3, 0 )
	AmmoCounterBase.AmmoCounterShadow:SetShadowRGBFromTable( SWATCHES.Reticles.Orange, 0 )
	AmmoCounterBase.AmmoCounter:SetShadowMinDistance( -0.2, 0 )
	AmmoCounterBase.AmmoCounter:SetShadowMaxDistance( 0.2, 0 )
	AmmoCounterBase.AmmoCounter:SetShadowRGBFromTable( SWATCHES.Reticles.Highlight, 0 )
	AmmoCounterBase:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -20, _1080p * 20, _1080p * 58, _1080p * 74 )
	self:addElement( AmmoCounterBase )
	self.AmmoCounterBase = AmmoCounterBase
	
	local ChargeMeterScopeCopy0 = nil
	
	ChargeMeterScopeCopy0 = MenuBuilder.BuildRegisteredType( "ChargeMeterScope", {
		controllerIndex = f1_local1
	} )
	ChargeMeterScopeCopy0.id = "ChargeMeterScopeCopy0"
	ChargeMeterScopeCopy0:SetZRotation( 8, 0 )
	ChargeMeterScopeCopy0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -47, _1080p * -38, _1080p * 37, _1080p * 95 )
	self:addElement( ChargeMeterScopeCopy0 )
	self.ChargeMeterScopeCopy0 = ChargeMeterScopeCopy0
	
	local ChargeMeterScopeCopy1 = nil
	
	ChargeMeterScopeCopy1 = MenuBuilder.BuildRegisteredType( "ChargeMeterScope", {
		controllerIndex = f1_local1
	} )
	ChargeMeterScopeCopy1.id = "ChargeMeterScopeCopy1"
	ChargeMeterScopeCopy1:SetZRotation( -8, 0 )
	ChargeMeterScopeCopy1:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * 38, _1080p * 47, _1080p * 37, _1080p * 95 )
	self:addElement( ChargeMeterScopeCopy1 )
	self.ChargeMeterScopeCopy1 = ChargeMeterScopeCopy1
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		AmmoCounterBase:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.AmmoCounterBase:SetAlpha( 1, 60 )
				end
			},
			{
				function ()
					return self.AmmoCounterBase:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -20, _1080p * 20, _1080p * 57, _1080p * 73, 59 )
				end
			}
		} )
		self._sequences.ADSIN = function ()
			AmmoCounterBase:AnimateSequence( "ADSIN" )
		end
		
		AmmoCounterBase:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.AmmoCounterBase:SetAlpha( 0, 60 )
				end
			},
			{
				function ()
					return self.AmmoCounterBase:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -13, _1080p * 14, _1080p * 59, _1080p * 71, 59 )
				end
			}
		} )
		self._sequences.ADSOUT = function ()
			AmmoCounterBase:AnimateSequence( "ADSOUT" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.player.currentWeapon.inAltMode:GetModel( f1_local1 ), function ()
		if DataSources.inGame.player.currentWeapon.inAltMode:GetValue( f1_local1 ) ~= nil and DataSources.inGame.player.currentWeapon.inAltMode:GetValue( f1_local1 ) == true then
			ACTIONS.AnimateSequence( self, "ADSOUT" )
		end
	end )
	local f1_local6 = function ()
		if DataSources.inGame.player.currentWeapon.adsPercent:GetValue( f1_local1 ) ~= nil and DataSources.inGame.player.currentWeapon.adsPercent:GetValue( f1_local1 ) >= 0.95 and DataSources.inGame.player.currentWeapon.inAltMode:GetValue( f1_local1 ) ~= nil and DataSources.inGame.player.currentWeapon.inAltMode:GetValue( f1_local1 ) ~= true then
			ACTIONS.AnimateSequence( self, "ADSIN" )
		end
		if DataSources.inGame.player.currentWeapon.adsPercent:GetValue( f1_local1 ) ~= nil and DataSources.inGame.player.currentWeapon.adsPercent:GetValue( f1_local1 ) <= 0.94 then
			ACTIONS.AnimateSequence( self, "ADSOUT" )
		end
	end
	
	self:SubscribeToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_local1 ), f1_local6 )
	self:SubscribeToModel( DataSources.inGame.player.currentWeapon.inAltMode:GetModel( f1_local1 ), f1_local6 )
	return self
end

MenuBuilder.registerType( "GaussEloChargeMeter", GaussEloChargeMeter )
LockTable( _M )
