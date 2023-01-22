local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = function ( f2_arg0 )
		local f2_local0 = nil
		local f2_local1 = function ()
			local f3_local0 = f2_arg0:SetZRotation( math.random( 0, 512 ), math.random( 100, 3000 ), math.random( LUI.EASING.linear, LUI.EASING.inOutBack ) )
			f3_local0.onComplete = f2_local0
		end
		
		f2_local1()
	end
	
	f1_local0( f1_arg0.Ring2 )
	f1_local0 = 0.75
	f1_arg0:SubscribeToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_arg1 ), function ( f4_arg0 )
		local f4_local0 = DataModel.GetModelValue( f4_arg0 )
		if f1_arg0.isVisible ~= true and f1_local0 <= f4_local0 then
			ACTIONS.AnimateSequence( f1_arg0, "ADSIN" )
			f1_arg0.isVisible = true
		elseif f1_arg0.isVisible ~= false and f4_local0 < f1_local0 then
			ACTIONS.AnimateSequence( f1_arg0, "ADSOUT" )
			f1_arg0.isVisible = false
		end
	end )
end

function Reticle45( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 64 * _1080p, 0, 64 * _1080p )
	self.id = "Reticle45"
	self._animationSets = {}
	self._sequences = {}
	local f5_local1 = controller and controller.controllerIndex
	if not f5_local1 and not Engine.InFrontend() then
		f5_local1 = self:getRootController()
	end
	assert( f5_local1 )
	local f5_local2 = self
	local ReticleS = nil
	
	ReticleS = LUI.UIImage.new()
	ReticleS.id = "ReticleS"
	ReticleS:SetRGBFromInt( 40872, 0 )
	ReticleS:SetAlpha( 0.4, 0 )
	ReticleS:SetScale( 0.02, 0 )
	ReticleS:setImage( RegisterMaterial( "hud_reticle_45" ), 0 )
	ReticleS:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -53, _1080p * 53, _1080p * -53, _1080p * 53 )
	self:addElement( ReticleS )
	self.ReticleS = ReticleS
	
	local Reticle = nil
	
	Reticle = LUI.UIImage.new()
	Reticle.id = "Reticle"
	Reticle:SetRGBFromInt( 12386275, 0 )
	Reticle:SetAlpha( 0.6, 0 )
	Reticle:setImage( RegisterMaterial( "hud_reticle_45" ), 0 )
	Reticle:SetBlendMode( BLEND_MODE.addWithAlpha )
	Reticle:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -53, _1080p * 53, _1080p * -53, _1080p * 53 )
	self:addElement( Reticle )
	self.Reticle = Reticle
	
	local Ring2 = nil
	
	Ring2 = LUI.UIImage.new()
	Ring2.id = "Ring2"
	Ring2:SetRGBFromInt( 12386275, 0 )
	Ring2:SetAlpha( 0.6, 0 )
	Ring2:SetScale( 0.02, 0 )
	Ring2:setImage( RegisterMaterial( "hud_reticle_45c" ), 0 )
	Ring2:SetBlendMode( BLEND_MODE.addWithAlpha )
	Ring2:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -38, _1080p * 38, _1080p * -38, _1080p * 38 )
	self:addElement( Ring2 )
	self.Ring2 = Ring2
	
	local Ring1 = nil
	
	Ring1 = LUI.UIImage.new()
	Ring1.id = "Ring1"
	Ring1:SetRGBFromInt( 12386275, 0 )
	Ring1:SetAlpha( 0.6, 0 )
	Ring1:SetScale( 0.02, 0 )
	Ring1:setImage( RegisterMaterial( "hud_reticle_45b" ), 0 )
	Ring1:SetBlendMode( BLEND_MODE.addWithAlpha )
	Ring1:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -50, _1080p * 50, _1080p * -50, _1080p * 50 )
	self:addElement( Ring1 )
	self.Ring1 = Ring1
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Ring1:RegisterAnimationSequence( "Pulse", {
			{
				function ()
					return self.Ring1:SetAlpha( 0.2, 0 )
				end,
				function ()
					return self.Ring1:SetAlpha( 0.8, 1500, LUI.EASING.inOutSine )
				end,
				function ()
					return self.Ring1:SetAlpha( 0.2, 1500, LUI.EASING.inOutSine )
				end
			}
		} )
		self._sequences.Pulse = function ()
			Ring1:AnimateLoop( "Pulse" )
		end
		
		Ring1:RegisterAnimationSequence( "SpinFire", {
			{
				function ()
					return self.Ring1:SetZRotation( 0, 30 )
				end,
				function ()
					return self.Ring1:SetZRotation( 180, 60 )
				end,
				function ()
					return self.Ring1:SetZRotation( 360, 910, LUI.EASING.outQuintic )
				end,
				function ()
					return self.Ring1:SetZRotation( 0, 10 )
				end
			}
		} )
		self._sequences.SpinFire = function ()
			Ring1:AnimateSequence( "SpinFire" )
		end
		
		ReticleS:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.ReticleS:SetAlpha( 0.5, 60 )
				end
			},
			{
				function ()
					return self.ReticleS:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -53, _1080p * 53, _1080p * -53, _1080p * 53, 59 )
				end
			}
		} )
		Reticle:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.Reticle:SetAlpha( 0.6, 60 )
				end
			},
			{
				function ()
					return self.Reticle:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -53, _1080p * 53, _1080p * -53, _1080p * 53, 59 )
				end
			}
		} )
		Ring2:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.Ring2:SetAlpha( 0.6, 60 )
				end
			},
			{
				function ()
					return self.Ring2:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -38, _1080p * 38, _1080p * -38, _1080p * 38, 59 )
				end
			}
		} )
		Ring1:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.Ring1:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -50, _1080p * 50, _1080p * -50, _1080p * 50, 59 )
				end
			}
		} )
		self._sequences.ADSIN = function ()
			ReticleS:AnimateSequence( "ADSIN" )
			Reticle:AnimateSequence( "ADSIN" )
			Ring2:AnimateSequence( "ADSIN" )
			Ring1:AnimateSequence( "ADSIN" )
		end
		
		ReticleS:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.ReticleS:SetAlpha( 0.2, 60 )
				end
			},
			{
				function ()
					return self.ReticleS:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * 32, _1080p * -32, _1080p * 32, 59 )
				end
			}
		} )
		Reticle:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.Reticle:SetAlpha( 0.1, 0 )
				end,
				function ()
					return self.Reticle:SetAlpha( 0.2, 60 )
				end
			},
			{
				function ()
					return self.Reticle:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * 32, _1080p * -32, _1080p * 32, 59 )
				end
			}
		} )
		Ring2:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.Ring2:SetAlpha( 0.2, 60 )
				end
			},
			{
				function ()
					return self.Ring2:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -17, _1080p * 17, _1080p * -17, _1080p * 17, 59 )
				end
			}
		} )
		Ring1:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.Ring1:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -29, _1080p * 29, _1080p * -29, _1080p * 29, 59 )
				end
			}
		} )
		self._sequences.ADSOUT = function ()
			ReticleS:AnimateLoop( "ADSOUT" )
			Reticle:AnimateLoop( "ADSOUT" )
			Ring2:AnimateLoop( "ADSOUT" )
			Ring1:AnimateLoop( "ADSOUT" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.player.currentWeapon.shotCounter:GetModel( f5_local1 ), function ()
		ACTIONS.AnimateSequence( self, "SpinFire" )
	end )
	PostLoadFunc( self, f5_local1, controller )
	ACTIONS.AnimateSequence( self, "Pulse" )
	return self
end

MenuBuilder.registerType( "Reticle45", Reticle45 )
LockTable( _M )
