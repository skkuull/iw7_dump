local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ReticleCircleDualTick( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 10 * _1080p, 0, 10 * _1080p )
	self.id = "ReticleCircleDualTick"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local ScopeReticleSpacer = nil
	
	ScopeReticleSpacer = MenuBuilder.BuildRegisteredType( "ScopeReticleSpacer", {
		minSizeADS = 3,
		maxSizeADS = 3,
		minSizeHip = 3,
		maxSizeHip = 10,
		adjustLeft = true,
		adjustRight = true,
		adjustTop = true,
		adjustBottom = true,
		controllerIndex = f1_local1
	} )
	ScopeReticleSpacer.id = "ScopeReticleSpacer"
	ScopeReticleSpacer:SetAlpha( 0, 0 )
	self:addElement( ScopeReticleSpacer )
	self.ScopeReticleSpacer = ScopeReticleSpacer
	
	local NotchBRShadow = nil
	
	NotchBRShadow = LUI.UIImage.new()
	NotchBRShadow.id = "NotchBRShadow"
	NotchBRShadow:SetRGBFromTable( SWATCHES.Reticles.DarkContrast, 0 )
	NotchBRShadow:SetAlpha( 0.4, 0 )
	NotchBRShadow:setImage( RegisterMaterial( "hud_reticle_notch" ), 0 )
	NotchBRShadow:SetUseAA( true )
	NotchBRShadow:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * 9.5, _1080p * 15, _1080p * -4.5, _1080p * 4.5 )
	self:addElement( NotchBRShadow )
	self.NotchBRShadow = NotchBRShadow
	
	local NotchBR = nil
	
	NotchBR = LUI.UIImage.new()
	NotchBR.id = "NotchBR"
	NotchBR:SetAlpha( 0.6, 0 )
	NotchBR:setImage( RegisterMaterial( "hud_reticle_notch" ), 0 )
	NotchBR:SetBlendMode( BLEND_MODE.addWithAlpha )
	NotchBR:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * 9.5, _1080p * 14, _1080p * -3, _1080p * 3 )
	self:addElement( NotchBR )
	self.NotchBR = NotchBR
	
	local NotchTLShadow = nil
	
	NotchTLShadow = LUI.UIImage.new()
	NotchTLShadow.id = "NotchTLShadow"
	NotchTLShadow:SetRGBFromTable( SWATCHES.Reticles.DarkContrast, 0 )
	NotchTLShadow:SetAlpha( 0.4, 0 )
	NotchTLShadow:setImage( RegisterMaterial( "hud_reticle_notch" ), 0 )
	NotchTLShadow:SetUseAA( true )
	NotchTLShadow:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -15, _1080p * -9.5, _1080p * -4.5, _1080p * 4.5 )
	self:addElement( NotchTLShadow )
	self.NotchTLShadow = NotchTLShadow
	
	local NotchTL = nil
	
	NotchTL = LUI.UIImage.new()
	NotchTL.id = "NotchTL"
	NotchTL:SetAlpha( 0.6, 0 )
	NotchTL:setImage( RegisterMaterial( "hud_reticle_notch" ), 0 )
	NotchTL:SetBlendMode( BLEND_MODE.addWithAlpha )
	NotchTL:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -14, _1080p * -9.5, _1080p * -3, _1080p * 3 )
	self:addElement( NotchTL )
	self.NotchTL = NotchTL
	
	local CircleShadow = nil
	
	CircleShadow = LUI.UIImage.new()
	CircleShadow.id = "CircleShadow"
	CircleShadow:SetRGBFromTable( SWATCHES.Reticles.DarkContrast, 0 )
	CircleShadow:SetAlpha( 0.4, 0 )
	CircleShadow:SetScale( 0.01, 0 )
	CircleShadow:setImage( RegisterMaterial( "hud_reticle_full_circle" ), 0 )
	CircleShadow:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -10, _1080p * 10, _1080p * -10, _1080p * 10 )
	self:addElement( CircleShadow )
	self.CircleShadow = CircleShadow
	
	local Circle = nil
	
	Circle = LUI.UIImage.new()
	Circle.id = "Circle"
	Circle:SetAlpha( 0.6, 0 )
	Circle:setImage( RegisterMaterial( "hud_reticle_full_circle" ), 0 )
	Circle:SetBlendMode( BLEND_MODE.addWithAlpha )
	Circle:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -10, _1080p * 10, _1080p * -10, _1080p * 10 )
	self:addElement( Circle )
	self.Circle = Circle
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		NotchBRShadow:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.NotchBRShadow:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * 9.5, _1080p * 14.5, _1080p * -4, _1080p * 4, 50 )
				end
			}
		} )
		NotchBR:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.NotchBR:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * 9.5, _1080p * 14, _1080p * -3, _1080p * 3, 50 )
				end
			}
		} )
		NotchTLShadow:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.NotchTLShadow:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -14.5, _1080p * -9.5, _1080p * -4, _1080p * 4, 50 )
				end
			}
		} )
		NotchTL:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.NotchTL:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -14, _1080p * -9.5, _1080p * -3, _1080p * 3, 50 )
				end
			}
		} )
		self._sequences.ADSIN = function ()
			NotchBRShadow:AnimateSequence( "ADSIN" )
			NotchBR:AnimateSequence( "ADSIN" )
			NotchTLShadow:AnimateSequence( "ADSIN" )
			NotchTL:AnimateSequence( "ADSIN" )
		end
		
		NotchBRShadow:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.NotchBRShadow:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * 9, _1080p * 14.5, _1080p * -4, _1080p * 4, 200 )
				end
			}
		} )
		NotchBR:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.NotchBR:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * 9.5, _1080p * 14, _1080p * -3, _1080p * 3, 200 )
				end
			}
		} )
		NotchTLShadow:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.NotchTLShadow:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -14.5, _1080p * -9, _1080p * -4, _1080p * 4, 200 )
				end
			}
		} )
		NotchTL:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.NotchTL:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -14, _1080p * -9.5, _1080p * -3, _1080p * 3, 200 )
				end
			}
		} )
		self._sequences.ADSOUT = function ()
			NotchBRShadow:AnimateSequence( "ADSOUT" )
			NotchBR:AnimateSequence( "ADSOUT" )
			NotchTLShadow:AnimateSequence( "ADSOUT" )
			NotchTL:AnimateSequence( "ADSOUT" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.player.inADS:GetModel( f1_local1 ), function ()
		if DataSources.inGame.player.inADS:GetValue( f1_local1 ) ~= nil and DataSources.inGame.player.inADS:GetValue( f1_local1 ) == true then
			ACTIONS.AnimateSequence( self, "ADSIN" )
		end
		if DataSources.inGame.player.inADS:GetValue( f1_local1 ) ~= nil and DataSources.inGame.player.inADS:GetValue( f1_local1 ) == false then
			ACTIONS.AnimateSequence( self, "ADSOUT" )
		end
	end )
	return self
end

MenuBuilder.registerType( "ReticleCircleDualTick", ReticleCircleDualTick )
LockTable( _M )
