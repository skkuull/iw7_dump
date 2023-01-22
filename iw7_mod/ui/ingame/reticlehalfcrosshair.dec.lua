local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ReticleHalfCrosshair( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 16 * _1080p, 0, 16 * _1080p )
	self.id = "ReticleHalfCrosshair"
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
		minSizeADS = 0,
		maxSizeADS = 0,
		minSizeHip = 8,
		maxSizeHip = 16,
		adjustTop = true,
		adjustBottom = true,
		controllerIndex = f1_local1
	} )
	ScopeReticleSpacer.id = "ScopeReticleSpacer"
	ScopeReticleSpacer:SetAlpha( 0, 0 )
	self:addElement( ScopeReticleSpacer )
	self.ScopeReticleSpacer = ScopeReticleSpacer
	
	local BottomLineShadow = nil
	
	BottomLineShadow = LUI.UIImage.new()
	BottomLineShadow.id = "BottomLineShadow"
	BottomLineShadow:SetRGBFromTable( SWATCHES.Reticles.DarkContrast, 0 )
	BottomLineShadow:setImage( RegisterMaterial( "hud_reticle_box_glow" ), 0 )
	BottomLineShadow:SetUseAA( true )
	BottomLineShadow:SetBlendMode( BLEND_MODE.blend )
	BottomLineShadow:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -2.5, _1080p * 2.5, _1080p * -3, _1080p * 7 )
	self:addElement( BottomLineShadow )
	self.BottomLineShadow = BottomLineShadow
	
	local TopLineShadow = nil
	
	TopLineShadow = LUI.UIImage.new()
	TopLineShadow.id = "TopLineShadow"
	TopLineShadow:SetRGBFromTable( SWATCHES.Reticles.DarkContrast, 0 )
	TopLineShadow:setImage( RegisterMaterial( "hud_reticle_box_glow" ), 0 )
	TopLineShadow:SetUseAA( true )
	TopLineShadow:SetBlendMode( BLEND_MODE.blend )
	TopLineShadow:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -2.5, _1080p * 2.5, _1080p * -7, _1080p * 3 )
	self:addElement( TopLineShadow )
	self.TopLineShadow = TopLineShadow
	
	local BottomLineMid = nil
	
	BottomLineMid = LUI.UIImage.new()
	BottomLineMid.id = "BottomLineMid"
	BottomLineMid:setImage( RegisterMaterial( "hud_reticle_box_glow" ), 0 )
	BottomLineMid:SetUseAA( true )
	BottomLineMid:SetBlendMode( BLEND_MODE.addWithAlpha )
	BottomLineMid:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -1.5, _1080p * 1.5, _1080p * -1, _1080p * 5 )
	self:addElement( BottomLineMid )
	self.BottomLineMid = BottomLineMid
	
	local TopLineMid = nil
	
	TopLineMid = LUI.UIImage.new()
	TopLineMid.id = "TopLineMid"
	TopLineMid:setImage( RegisterMaterial( "hud_reticle_box_glow" ), 0 )
	TopLineMid:SetUseAA( true )
	TopLineMid:SetBlendMode( BLEND_MODE.addWithAlpha )
	TopLineMid:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -1.5, _1080p * 1.5, _1080p * -5, _1080p * 1 )
	self:addElement( TopLineMid )
	self.TopLineMid = TopLineMid
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		BottomLineShadow:RegisterAnimationSequence( "Idle", {
			{
				function ()
					return self.BottomLineShadow:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 5.5, _1080p * -5.5, _1080p * -3, _1080p * 7, 0 )
				end
			}
		} )
		TopLineShadow:RegisterAnimationSequence( "Idle", {
			{
				function ()
					return self.TopLineShadow:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 5.5, _1080p * -5.5, _1080p * -7, _1080p * 3, 0 )
				end
			}
		} )
		BottomLineMid:RegisterAnimationSequence( "Idle", {
			{
				function ()
					return self.BottomLineMid:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 6.5, _1080p * -6.5, _1080p * -1, _1080p * 5, 0 )
				end
			}
		} )
		TopLineMid:RegisterAnimationSequence( "Idle", {
			{
				function ()
					return self.TopLineMid:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 6.5, _1080p * -6.5, _1080p * -5, _1080p * 1, 0 )
				end
			}
		} )
		self._sequences.Idle = function ()
			BottomLineShadow:AnimateSequence( "Idle" )
			TopLineShadow:AnimateSequence( "Idle" )
			BottomLineMid:AnimateSequence( "Idle" )
			TopLineMid:AnimateSequence( "Idle" )
		end
		
		BottomLineShadow:RegisterAnimationSequence( "Aim", {
			{
				function ()
					return self.BottomLineShadow:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -2.5, _1080p * 2.5, _1080p * -2.5, _1080p * 2.5, 0 )
				end
			}
		} )
		TopLineShadow:RegisterAnimationSequence( "Aim", {
			{
				function ()
					return self.TopLineShadow:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -2.5, _1080p * 2.5, _1080p * -2.5, _1080p * 2.5, 0 )
				end
			}
		} )
		BottomLineMid:RegisterAnimationSequence( "Aim", {
			{
				function ()
					return self.BottomLineMid:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -2.5, _1080p * 2.5, _1080p * -2.5, _1080p * 2.5, 0 )
				end
			}
		} )
		TopLineMid:RegisterAnimationSequence( "Aim", {
			{
				function ()
					return self.TopLineMid:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -2.5, _1080p * 2.5, _1080p * -2.5, _1080p * 2.5, 0 )
				end
			}
		} )
		self._sequences.Aim = function ()
			BottomLineShadow:AnimateSequence( "Aim" )
			TopLineShadow:AnimateSequence( "Aim" )
			BottomLineMid:AnimateSequence( "Aim" )
			TopLineMid:AnimateSequence( "Aim" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	return self
end

MenuBuilder.registerType( "ReticleHalfCrosshair", ReticleHalfCrosshair )
LockTable( _M )
