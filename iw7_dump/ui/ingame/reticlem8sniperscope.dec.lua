local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = 0.8
	f1_arg0:SubscribeToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_arg1 ), function ( f2_arg0 )
		local f2_local0 = DataModel.GetModelValue( f2_arg0 )
		if f1_arg0.isVisible ~= true and f1_local0 <= f2_local0 then
			ACTIONS.AnimateSequence( f1_arg0, "ADSIN" )
			f1_arg0.isVisible = true
		elseif f1_arg0.isVisible ~= false and f2_local0 < f1_local0 then
			ACTIONS.AnimateSequence( f1_arg0, "Hidden" )
			f1_arg0.isVisible = false
		end
	end )
end

function ReticleM8SniperScope( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 512 * _1080p, 0, 512 * _1080p )
	self.id = "ReticleM8SniperScope"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local OuterRingShadow = nil
	
	OuterRingShadow = LUI.UIImage.new()
	OuterRingShadow.id = "OuterRingShadow"
	OuterRingShadow:SetRGBFromInt( 16713216, 0 )
	OuterRingShadow:SetAlpha( 0.2, 0 )
	OuterRingShadow:setImage( RegisterMaterial( "hud_reticle_m8_sniper" ), 0 )
	OuterRingShadow:SetUseAA( true )
	OuterRingShadow:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -112, _1080p * 112, _1080p * -112, _1080p * 112 )
	self:addElement( OuterRingShadow )
	self.OuterRingShadow = OuterRingShadow
	
	local OuterRing = nil
	
	OuterRing = LUI.UIImage.new()
	OuterRing.id = "OuterRing"
	OuterRing:SetRGBFromInt( 16713216, 0 )
	OuterRing:SetAlpha( 0.8, 0 )
	OuterRing:setImage( RegisterMaterial( "hud_reticle_m8_sniper" ), 0 )
	OuterRing:SetUseAA( true )
	OuterRing:SetBlendMode( BLEND_MODE.addWithAlpha )
	OuterRing:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -112, _1080p * 112, _1080p * -112, _1080p * 112 )
	self:addElement( OuterRing )
	self.OuterRing = OuterRing
	
	local OuterRingGlow = nil
	
	OuterRingGlow = LUI.UIImage.new()
	OuterRingGlow.id = "OuterRingGlow"
	OuterRingGlow:SetRGBFromTable( SWATCHES.Reticles.Yellow, 0 )
	OuterRingGlow:SetAlpha( 0.6, 0 )
	OuterRingGlow:setImage( RegisterMaterial( "hud_reticle_m8_sniper_glow" ), 0 )
	OuterRingGlow:SetUseAA( true )
	OuterRingGlow:SetBlendMode( BLEND_MODE.addWithAlpha )
	OuterRingGlow:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -112, _1080p * 112, _1080p * -112, _1080p * 112 )
	self:addElement( OuterRingGlow )
	self.OuterRingGlow = OuterRingGlow
	
	local CircleMidShadow = nil
	
	CircleMidShadow = LUI.UIImage.new()
	CircleMidShadow.id = "CircleMidShadow"
	CircleMidShadow:SetRGBFromTable( SWATCHES.Reticles.Red, 0 )
	CircleMidShadow:SetAlpha( 0.6, 0 )
	CircleMidShadow:setImage( RegisterMaterial( "hud_reticle_m8_ring" ), 0 )
	CircleMidShadow:SetUseAA( true )
	CircleMidShadow:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 128, _1080p * -128, _1080p * 128, _1080p * -128 )
	CircleMidShadow:SubscribeToModel( DataSources.inGame.player.currentWeapon.charge:GetModel( f3_local1 ), function ()
		local f4_local0 = DataSources.inGame.player.currentWeapon.charge:GetValue( f3_local1 )
		if f4_local0 ~= nil then
			CircleMidShadow:SetScale( Lerp( f4_local0, 0, -0.75 ), 0 )
		end
	end )
	self:addElement( CircleMidShadow )
	self.CircleMidShadow = CircleMidShadow
	
	local CircleMid = nil
	
	CircleMid = LUI.UIImage.new()
	CircleMid.id = "CircleMid"
	CircleMid:SetRGBFromTable( SWATCHES.Reticles.Yellow, 0 )
	CircleMid:SetAlpha( 0.6, 0 )
	CircleMid:setImage( RegisterMaterial( "hud_reticle_m8_ring" ), 0 )
	CircleMid:SetUseAA( true )
	CircleMid:SetBlendMode( BLEND_MODE.addWithAlpha )
	CircleMid:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 128, _1080p * -128, _1080p * 128, _1080p * -128 )
	CircleMid:SubscribeToModel( DataSources.inGame.player.currentWeapon.charge:GetModel( f3_local1 ), function ()
		local f5_local0 = DataSources.inGame.player.currentWeapon.charge:GetValue( f3_local1 )
		if f5_local0 ~= nil then
			CircleMid:SetScale( Lerp( f5_local0, 0, -0.75 ), 0 )
		end
	end )
	self:addElement( CircleMid )
	self.CircleMid = CircleMid
	
	local CircleSmallShadow = nil
	
	CircleSmallShadow = LUI.UIImage.new()
	CircleSmallShadow.id = "CircleSmallShadow"
	CircleSmallShadow:SetRGBFromTable( SWATCHES.Reticles.Orange, 0 )
	CircleSmallShadow:SetAlpha( 0.4, 0 )
	CircleSmallShadow:SetScale( 0.01, 0 )
	CircleSmallShadow:setImage( RegisterMaterial( "hud_reticle_ring_small" ), 0 )
	CircleSmallShadow:SetUseAA( true )
	CircleSmallShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 33, _1080p * -33, _1080p * 33, _1080p * -33 )
	self:addElement( CircleSmallShadow )
	self.CircleSmallShadow = CircleSmallShadow
	
	local CircleSmall = nil
	
	CircleSmall = LUI.UIImage.new()
	CircleSmall.id = "CircleSmall"
	CircleSmall:SetRGBFromInt( 16765192, 0 )
	CircleSmall:SetAlpha( 0.6, 0 )
	CircleSmall:setImage( RegisterMaterial( "hud_reticle_ring_small" ), 0 )
	CircleSmall:SetUseAA( true )
	CircleSmall:SetBlendMode( BLEND_MODE.addWithAlpha )
	CircleSmall:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 289, _1080p * -289, _1080p * 289, _1080p * -289 )
	self:addElement( CircleSmall )
	self.CircleSmall = CircleSmall
	
	local DotShadow = nil
	
	DotShadow = LUI.UIImage.new()
	DotShadow.id = "DotShadow"
	DotShadow:SetRGBFromTable( SWATCHES.Reticles.Orange, 0 )
	DotShadow:SetAlpha( 0.6, 0 )
	DotShadow:setImage( RegisterMaterial( "hud_reticle_dot_glow" ), 0 )
	DotShadow:SetUseAA( true )
	DotShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -11, _1080p * 10.5, _1080p * -10.5, _1080p * 11 )
	self:addElement( DotShadow )
	self.DotShadow = DotShadow
	
	local Dot = nil
	
	Dot = LUI.UIImage.new()
	Dot.id = "Dot"
	Dot:SetRGBFromTable( SWATCHES.Reticles.Highlight, 0 )
	Dot:SetAlpha( 0.6, 0 )
	Dot:SetZRotation( -90, 0 )
	Dot:SetScale( 0.04, 0 )
	Dot:setImage( RegisterMaterial( "hud_reticle_faded_dot" ), 0 )
	Dot:SetBlendMode( BLEND_MODE.addWithAlpha )
	Dot:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -2, _1080p * 2, _1080p * -2, _1080p * 2 )
	self:addElement( Dot )
	self.Dot = Dot
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		OuterRingShadow:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.OuterRingShadow:SetAlpha( 0, 0 )
				end,
				function ()
					return self.OuterRingShadow:SetAlpha( 0.4, 200 )
				end
			}
		} )
		OuterRing:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.OuterRing:SetAlpha( 0, 0 )
				end,
				function ()
					return self.OuterRing:SetAlpha( 0.6, 200 )
				end
			}
		} )
		OuterRingGlow:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.OuterRingGlow:SetAlpha( 0, 0 )
				end,
				function ()
					return self.OuterRingGlow:SetAlpha( 0.8, 200 )
				end
			}
		} )
		CircleMidShadow:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.CircleMidShadow:SetAlpha( 0, 0 )
				end,
				function ()
					return self.CircleMidShadow:SetAlpha( 0.6, 200 )
				end
			}
		} )
		CircleMid:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.CircleMid:SetAlpha( 0, 0 )
				end,
				function ()
					return self.CircleMid:SetAlpha( 0.6, 200 )
				end
			}
		} )
		CircleSmallShadow:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.CircleSmallShadow:SetAlpha( 0, 0 )
				end,
				function ()
					return self.CircleSmallShadow:SetAlpha( 0.6, 200 )
				end
			}
		} )
		CircleSmall:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.CircleSmall:SetAlpha( 0, 0 )
				end,
				function ()
					return self.CircleSmall:SetAlpha( 0.6, 200 )
				end
			}
		} )
		DotShadow:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.DotShadow:SetAlpha( 0, 0 )
				end,
				function ()
					return self.DotShadow:SetAlpha( 0.6, 200 )
				end
			}
		} )
		Dot:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.Dot:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Dot:SetAlpha( 0.6, 200 )
				end
			}
		} )
		self._sequences.ADSIN = function ()
			OuterRingShadow:AnimateSequence( "ADSIN" )
			OuterRing:AnimateSequence( "ADSIN" )
			OuterRingGlow:AnimateSequence( "ADSIN" )
			CircleMidShadow:AnimateSequence( "ADSIN" )
			CircleMid:AnimateSequence( "ADSIN" )
			CircleSmallShadow:AnimateSequence( "ADSIN" )
			CircleSmall:AnimateSequence( "ADSIN" )
			DotShadow:AnimateSequence( "ADSIN" )
			Dot:AnimateSequence( "ADSIN" )
		end
		
		OuterRingShadow:RegisterAnimationSequence( "OnFire", {
			{
				function ()
					return self.OuterRingShadow:SetScale( 0.05, 60 )
				end,
				function ()
					return self.OuterRingShadow:SetScale( 0, 400 )
				end
			}
		} )
		OuterRing:RegisterAnimationSequence( "OnFire", {
			{
				function ()
					return self.OuterRing:SetScale( 0.05, 60 )
				end,
				function ()
					return self.OuterRing:SetScale( 0, 400 )
				end
			}
		} )
		OuterRingGlow:RegisterAnimationSequence( "OnFire", {
			{
				function ()
					return self.OuterRingGlow:SetScale( 0.05, 60 )
				end,
				function ()
					return self.OuterRingGlow:SetScale( 0, 400 )
				end
			}
		} )
		self._sequences.OnFire = function ()
			OuterRingShadow:AnimateSequence( "OnFire" )
			OuterRing:AnimateSequence( "OnFire" )
			OuterRingGlow:AnimateSequence( "OnFire" )
		end
		
		OuterRingShadow:RegisterAnimationSequence( "Hidden", {
			{
				function ()
					return self.OuterRingShadow:SetAlpha( 0, 0 )
				end
			}
		} )
		OuterRing:RegisterAnimationSequence( "Hidden", {
			{
				function ()
					return self.OuterRing:SetAlpha( 0, 0 )
				end
			}
		} )
		OuterRingGlow:RegisterAnimationSequence( "Hidden", {
			{
				function ()
					return self.OuterRingGlow:SetAlpha( 0, 0 )
				end
			}
		} )
		CircleMidShadow:RegisterAnimationSequence( "Hidden", {
			{
				function ()
					return self.CircleMidShadow:SetAlpha( 0, 0 )
				end
			}
		} )
		CircleMid:RegisterAnimationSequence( "Hidden", {
			{
				function ()
					return self.CircleMid:SetAlpha( 0, 0 )
				end
			}
		} )
		CircleSmallShadow:RegisterAnimationSequence( "Hidden", {
			{
				function ()
					return self.CircleSmallShadow:SetAlpha( 0, 0 )
				end
			}
		} )
		CircleSmall:RegisterAnimationSequence( "Hidden", {
			{
				function ()
					return self.CircleSmall:SetAlpha( 0, 0 )
				end
			}
		} )
		DotShadow:RegisterAnimationSequence( "Hidden", {
			{
				function ()
					return self.DotShadow:SetAlpha( 0, 0 )
				end
			}
		} )
		Dot:RegisterAnimationSequence( "Hidden", {
			{
				function ()
					return self.Dot:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Hidden = function ()
			OuterRingShadow:AnimateSequence( "Hidden" )
			OuterRing:AnimateSequence( "Hidden" )
			OuterRingGlow:AnimateSequence( "Hidden" )
			CircleMidShadow:AnimateSequence( "Hidden" )
			CircleMid:AnimateSequence( "Hidden" )
			CircleSmallShadow:AnimateSequence( "Hidden" )
			CircleSmall:AnimateSequence( "Hidden" )
			DotShadow:AnimateSequence( "Hidden" )
			Dot:AnimateSequence( "Hidden" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.player.currentWeapon.shotCounter:GetModel( f3_local1 ), function ()
		ACTIONS.AnimateSequence( self, "OnFire" )
	end )
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "ReticleM8SniperScope", ReticleM8SniperScope )
LockTable( _M )
