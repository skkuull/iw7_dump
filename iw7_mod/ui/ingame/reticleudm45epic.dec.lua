local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	f1_arg0.Box:SetParallaxMotionAmount( ReticleParallaxAmount.udmforeground )
	f1_arg0.BoxS:SetParallaxMotionAmount( ReticleParallaxAmount.udmforeground )
end

function ReticleUDM45Epic( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 256 * _1080p, 0, 256 * _1080p )
	self.id = "ReticleUDM45Epic"
	self._animationSets = {}
	self._sequences = {}
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local Ret = nil
	
	Ret = LUI.UIImage.new()
	Ret.id = "Ret"
	Ret:setImage( RegisterMaterial( "hud_reticle_udm45epic" ), 0 )
	Ret:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -175, _1080p * 174, _1080p * -174, _1080p * 174.5 )
	self:addElement( Ret )
	self.Ret = Ret
	
	local AmmoCounterBase = nil
	
	AmmoCounterBase = MenuBuilder.BuildRegisteredType( "AmmoCounterBase", {
		controllerIndex = f2_local1
	} )
	AmmoCounterBase.id = "AmmoCounterBase"
	AmmoCounterBase:SetRGBFromTable( SWATCHES.Reticles.LightCyan, 0 )
	AmmoCounterBase:SetScale( -0.3, 0 )
	AmmoCounterBase.AmmoCounterShadow:SetRGBFromTable( SWATCHES.Reticles.AzureBlue, 0 )
	AmmoCounterBase.AmmoCounterShadow:SetAlpha( 0.6, 0 )
	AmmoCounterBase.AmmoCounterShadow:SetShadowMinDistance( -0.2, 0 )
	AmmoCounterBase.AmmoCounterShadow:SetShadowRGBFromTable( SWATCHES.Reticles.AzureBlue, 0 )
	AmmoCounterBase.AmmoCounter:SetAlpha( 1, 0 )
	AmmoCounterBase.AmmoCounter:SetShadowMinDistance( -0.5, 0 )
	AmmoCounterBase.AmmoCounter:SetShadowMaxDistance( 0.5, 0 )
	AmmoCounterBase.AmmoCounter:SetShadowRGBFromInt( 4014489, 0 )
	AmmoCounterBase:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 28, _1080p * 68, _1080p * 46.46, _1080p * 62.46 )
	self:addElement( AmmoCounterBase )
	self.AmmoCounterBase = AmmoCounterBase
	
	local BoxS = nil
	
	BoxS = LUI.UIImage.new()
	BoxS.id = "BoxS"
	BoxS:SetRGBFromTable( SWATCHES.Reticles.AzureBlue, 0 )
	BoxS:SetAlpha( 0.6, 0 )
	BoxS:SetScale( 0.01, 0 )
	BoxS:setImage( RegisterMaterial( "hud_reticle_udm45epic_b" ), 0 )
	BoxS:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -20.5, _1080p * 19, _1080p * -20, _1080p * 20.5 )
	self:addElement( BoxS )
	self.BoxS = BoxS
	
	local Box = nil
	
	Box = LUI.UIImage.new()
	Box.id = "Box"
	Box:SetRGBFromTable( SWATCHES.Reticles.LightCyan, 0 )
	Box:SetAlpha( 0.4, 0 )
	Box:setImage( RegisterMaterial( "hud_reticle_udm45epic_b" ), 0 )
	Box:SetBlendMode( BLEND_MODE.addWithAlpha )
	Box:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -20.5, _1080p * 19, _1080p * -20, _1080p * 20.5 )
	self:addElement( Box )
	self.Box = Box
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		BoxS:RegisterAnimationSequence( "OnFire", {
			{
				function ()
					return self.BoxS:SetScale( 0.23, 30 )
				end,
				function ()
					return self.BoxS:SetScale( 0.01, 270, LUI.EASING.inOutBack )
				end
			}
		} )
		Box:RegisterAnimationSequence( "OnFire", {
			{
				function ()
					return self.Box:SetScale( 0.2, 30 )
				end,
				function ()
					return self.Box:SetScale( 0, 270, LUI.EASING.inOutBack )
				end
			}
		} )
		self._sequences.OnFire = function ()
			BoxS:AnimateSequence( "OnFire" )
			Box:AnimateSequence( "OnFire" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.player.currentWeapon.shotCounter:GetModel( f2_local1 ), function ()
		ACTIONS.AnimateSequence( self, "OnFire" )
	end )
	PostLoadFunc( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "ReticleUDM45Epic", ReticleUDM45Epic )
LockTable( _M )
