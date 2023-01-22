local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = 0.75
	f1_arg0:SubscribeToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_arg1 ), function ( f2_arg0 )
		local f2_local0 = DataModel.GetModelValue( f2_arg0 )
		if f1_arg0.isVisible ~= true and f1_local0 <= f2_local0 then
			ACTIONS.AnimateSequence( f1_arg0, "ADSIN" )
			f1_arg0.BGParallax:SetHorSkewFactor( 150 )
			f1_arg0.BGParallax:SetVertSkewFactor( 150 )
			f1_arg0.BGParallaxShadow:SetHorSkewFactor( 150 )
			f1_arg0.BGParallaxShadow:SetVertSkewFactor( 150 )
			f1_arg0.isVisible = true
		elseif f1_arg0.isVisible ~= false and f2_local0 < f1_local0 then
			ACTIONS.AnimateSequence( f1_arg0, "ADSOUT" )
			f1_arg0.BGParallax:SetHorSkewFactor( 0 )
			f1_arg0.BGParallax:SetVertSkewFactor( 0 )
			f1_arg0.BGParallaxShadow:SetHorSkewFactor( 0 )
			f1_arg0.BGParallaxShadow:SetVertSkewFactor( 0 )
			f1_arg0.isVisible = false
		end
	end )
end

function ReticleCrosshairPLAWBoxes( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 100 * _1080p, 0, 100 * _1080p )
	self.id = "ReticleCrosshairPLAWBoxes"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local BGParallaxShadow = nil
	
	BGParallaxShadow = MenuBuilder.BuildRegisteredType( "ScopeReticleParallaxer", {
		horSkewFactor = 150,
		vertSkewFactor = 150,
		controllerIndex = f3_local1
	} )
	BGParallaxShadow.id = "BGParallaxShadow"
	BGParallaxShadow:SetRGBFromTable( SWATCHES.Reticles.Orange, 0 )
	BGParallaxShadow:SetAlpha( 0.35, 0 )
	BGParallaxShadow:setImage( RegisterMaterial( "hud_reticle_plaw" ), 0 )
	BGParallaxShadow:SetAnchorsAndPosition( 0, 0, 0, 0, 0, _1080p * 1, 0, _1080p * 1 )
	BGParallaxShadow:SubscribeToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f3_local1 ), function ()
		local f4_local0 = DataSources.inGame.player.currentWeapon.adsPercent:GetValue( f3_local1 )
		if f4_local0 ~= nil then
			BGParallaxShadow:SetScale( Lerp( f4_local0, 1.2, 1 ), 0 )
		end
	end )
	self:addElement( BGParallaxShadow )
	self.BGParallaxShadow = BGParallaxShadow
	
	local BGParallax = nil
	
	BGParallax = MenuBuilder.BuildRegisteredType( "ScopeReticleParallaxer", {
		horSkewFactor = 150,
		vertSkewFactor = 150,
		controllerIndex = f3_local1
	} )
	BGParallax.id = "BGParallax"
	BGParallax:SetRGBFromTable( SWATCHES.Reticles.Orange, 0 )
	BGParallax:SetAlpha( 0.35, 0 )
	BGParallax:setImage( RegisterMaterial( "hud_reticle_plaw" ), 0 )
	BGParallax:SetBlendMode( BLEND_MODE.addWithAlpha )
	BGParallax:SetAnchorsAndPosition( 0, 0, 0, 0, 0, _1080p * 1, 0, _1080p * 1 )
	BGParallax:SubscribeToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f3_local1 ), function ()
		local f5_local0 = DataSources.inGame.player.currentWeapon.adsPercent:GetValue( f3_local1 )
		if f5_local0 ~= nil then
			BGParallax:SetScale( Lerp( f5_local0, 1.2, 1 ), 0 )
		end
	end )
	self:addElement( BGParallax )
	self.BGParallax = BGParallax
	
	local ReticleCrosshairCornerBoxes = nil
	
	ReticleCrosshairCornerBoxes = MenuBuilder.BuildRegisteredType( "ReticleCrosshairCornerBoxes", {
		controllerIndex = f3_local1
	} )
	ReticleCrosshairCornerBoxes.id = "ReticleCrosshairCornerBoxes"
	ReticleCrosshairCornerBoxes:SetAnchors( 0.5, 0.5, 0.5, 0.5, 0 )
	ReticleCrosshairCornerBoxes:SetRGBFromTable( SWATCHES.Reticles.Orange, 0 )
	ReticleCrosshairCornerBoxes:SetAlpha( 0.6, 0 )
	ReticleCrosshairCornerBoxes:SetZRotation( 90, 0 )
	ReticleCrosshairCornerBoxes:SubscribeToModel( DataSources.inGame.player.currentWeapon.charge:GetModel( f3_local1 ), function ()
		local f6_local0 = DataSources.inGame.player.currentWeapon.charge:GetValue( f3_local1 )
		if f6_local0 ~= nil then
			ReticleCrosshairCornerBoxes:SetLeft( _1080p * Multiply( Lerp( f6_local0, 6.5, 0 ), -1 ), 0 )
		end
	end )
	ReticleCrosshairCornerBoxes:SubscribeToModel( DataSources.inGame.player.currentWeapon.charge:GetModel( f3_local1 ), function ()
		local f7_local0 = DataSources.inGame.player.currentWeapon.charge:GetValue( f3_local1 )
		if f7_local0 ~= nil then
			ReticleCrosshairCornerBoxes:SetRight( _1080p * Lerp( f7_local0, 6.5, 0 ), 0 )
		end
	end )
	ReticleCrosshairCornerBoxes:SubscribeToModel( DataSources.inGame.player.currentWeapon.charge:GetModel( f3_local1 ), function ()
		local f8_local0 = DataSources.inGame.player.currentWeapon.charge:GetValue( f3_local1 )
		if f8_local0 ~= nil then
			ReticleCrosshairCornerBoxes:SetTop( _1080p * Multiply( Lerp( f8_local0, 6.5, 0 ), -1 ), 0 )
		end
	end )
	ReticleCrosshairCornerBoxes:SubscribeToModel( DataSources.inGame.player.currentWeapon.charge:GetModel( f3_local1 ), function ()
		local f9_local0 = DataSources.inGame.player.currentWeapon.charge:GetValue( f3_local1 )
		if f9_local0 ~= nil then
			ReticleCrosshairCornerBoxes:SetBottom( _1080p * Lerp( f9_local0, 6.5, 0 ), 0 )
		end
	end )
	ReticleCrosshairCornerBoxes:SubscribeToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f3_local1 ), function ()
		local f10_local0 = DataSources.inGame.player.currentWeapon.adsPercent:GetValue( f3_local1 )
		if f10_local0 ~= nil then
			ReticleCrosshairCornerBoxes:SetScale( Lerp( f10_local0, 0, 1 ), 0 )
		end
	end )
	self:addElement( ReticleCrosshairCornerBoxes )
	self.ReticleCrosshairCornerBoxes = ReticleCrosshairCornerBoxes
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		BGParallaxShadow:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.BGParallaxShadow:SetAlpha( 0.4, 50 )
				end
			}
		} )
		BGParallax:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.BGParallax:SetAlpha( 0.6, 50 )
				end
			}
		} )
		ReticleCrosshairCornerBoxes:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.ReticleCrosshairCornerBoxes:SetAlpha( 1, 50 )
				end
			},
			{
				function ()
					return self.ReticleCrosshairCornerBoxes:SetAnchors( 0.5, 0.5, 0.5, 0.5, 50 )
				end
			}
		} )
		self._sequences.ADSIN = function ()
			BGParallaxShadow:AnimateSequence( "ADSIN" )
			BGParallax:AnimateSequence( "ADSIN" )
			ReticleCrosshairCornerBoxes:AnimateSequence( "ADSIN" )
		end
		
		BGParallaxShadow:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.BGParallaxShadow:SetAlpha( 0.3, 0 )
				end,
				function ()
					return self.BGParallaxShadow:SetAlpha( 0.2, 60 )
				end
			}
		} )
		BGParallax:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.BGParallax:SetAlpha( 0.4, 0 )
				end,
				function ()
					return self.BGParallax:SetAlpha( 0.2, 60 )
				end
			}
		} )
		ReticleCrosshairCornerBoxes:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.ReticleCrosshairCornerBoxes:SetAlpha( 0.6, 0 )
				end,
				function ()
					return self.ReticleCrosshairCornerBoxes:SetAlpha( 0.4, 60 )
				end
			}
		} )
		self._sequences.ADSOUT = function ()
			BGParallaxShadow:AnimateLoop( "ADSOUT" )
			BGParallax:AnimateLoop( "ADSOUT" )
			ReticleCrosshairCornerBoxes:AnimateLoop( "ADSOUT" )
		end
		
		ReticleCrosshairCornerBoxes:RegisterAnimationSequence( "Fire", {
			{
				function ()
					return self.ReticleCrosshairCornerBoxes:SetRGBFromTable( SWATCHES.Reticles.Red, 0 )
				end,
				function ()
					return self.ReticleCrosshairCornerBoxes:SetRGBFromTable( SWATCHES.Reticles.Orange, 600, LUI.EASING.outQuadratic )
				end
			}
		} )
		self._sequences.Fire = function ()
			ReticleCrosshairCornerBoxes:AnimateSequence( "Fire" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.player.currentWeapon.shotCounter:GetModel( f3_local1 ), function ()
		ACTIONS.AnimateSequence( self, "Fire" )
		ACTIONS.AnimateSequenceByElement( self, {
			elementName = "ReticleCrosshairCornerBoxes",
			sequenceName = "Onfire",
			elementPath = "ReticleCrosshairCornerBoxes"
		} )
	end )
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "ReticleCrosshairPLAWBoxes", ReticleCrosshairPLAWBoxes )
LockTable( _M )
