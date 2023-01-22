local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function Reticle05Base( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 32 * _1080p, 0, 32 * _1080p )
	self.id = "Reticle05Base"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local glow = nil
	
	glow = LUI.UIImage.new()
	glow.id = "glow"
	glow:SetRGBFromTable( SWATCHES.Reticles.AzureBlue, 0 )
	glow:SetAlpha( 0, 0 )
	glow:setImage( RegisterMaterial( "hud_reticle_radial_glow" ), 0 )
	glow:SetBlendMode( BLEND_MODE.addWithAlpha )
	glow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -12, _1080p * 12, _1080p * -12, _1080p * 12 )
	self:addElement( glow )
	self.glow = glow
	
	local ScopeReticleSpacer = nil
	
	ScopeReticleSpacer = MenuBuilder.BuildRegisteredType( "ScopeReticleSpacer", {
		minSizeADS = 4,
		maxSizeADS = 4,
		minSizeHip = 10,
		maxSizeHip = 30,
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
	
	local L = nil
	
	L = LUI.UIImage.new()
	L.id = "L"
	L:SetZRotation( 90, 0 )
	L:setImage( RegisterMaterial( "hud_reticle_notch" ), 0 )
	L:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -6, _1080p * 4, _1080p * -2, _1080p * 2 )
	self:addElement( L )
	self.L = L
	
	local R = nil
	
	R = LUI.UIImage.new()
	R.id = "R"
	R:SetZRotation( 90, 0 )
	R:setImage( RegisterMaterial( "hud_reticle_notch" ), 0 )
	R:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -4, _1080p * 6, _1080p * -2, _1080p * 2 )
	self:addElement( R )
	self.R = R
	
	local B = nil
	
	B = LUI.UIImage.new()
	B.id = "B"
	B:setImage( RegisterMaterial( "hud_reticle_notch" ), 0 )
	B:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -5, _1080p * 5, _1080p * -1, _1080p * 3 )
	self:addElement( B )
	self.B = B
	
	local T = nil
	
	T = LUI.UIImage.new()
	T.id = "T"
	T:setImage( RegisterMaterial( "hud_reticle_notch" ), 0 )
	T:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -5, _1080p * 5, _1080p * -3, _1080p * 1 )
	self:addElement( T )
	self.T = T
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		glow:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.glow:SetAlpha( 0.4, 50 )
				end
			}
		} )
		L:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.L:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -4, _1080p * 2, _1080p * -2, _1080p * 2, 50 )
				end
			}
		} )
		R:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.R:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -2, _1080p * 4, _1080p * -2, _1080p * 2, 50 )
				end
			}
		} )
		B:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.B:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -3, _1080p * 3, _1080p * -1, _1080p * 3, 50 )
				end
			}
		} )
		T:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.T:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -3, _1080p * 3, _1080p * -3, _1080p * 1, 50 )
				end
			}
		} )
		self._sequences.ADSIN = function ()
			glow:AnimateSequence( "ADSIN" )
			L:AnimateSequence( "ADSIN" )
			R:AnimateSequence( "ADSIN" )
			B:AnimateSequence( "ADSIN" )
			T:AnimateSequence( "ADSIN" )
		end
		
		glow:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.glow:SetAlpha( 0, 50 )
				end
			}
		} )
		L:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.L:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -6, _1080p * 4, _1080p * -2, _1080p * 2, 50 )
				end
			}
		} )
		R:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.R:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -4, _1080p * 6, _1080p * -2, _1080p * 2, 50 )
				end
			}
		} )
		B:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.B:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -5, _1080p * 5, _1080p * -1, _1080p * 3, 50 )
				end
			}
		} )
		T:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.T:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -5, _1080p * 5, _1080p * -3, _1080p * 1, 50 )
				end
			}
		} )
		self._sequences.ADSOUT = function ()
			glow:AnimateSequence( "ADSOUT" )
			L:AnimateSequence( "ADSOUT" )
			R:AnimateSequence( "ADSOUT" )
			B:AnimateSequence( "ADSOUT" )
			T:AnimateSequence( "ADSOUT" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	return self
end

MenuBuilder.registerType( "Reticle05Base", Reticle05Base )
LockTable( _M )
