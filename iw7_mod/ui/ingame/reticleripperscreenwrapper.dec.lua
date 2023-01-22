local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = 0.75
	f1_arg0:SubscribeToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_arg1 ), function ( f2_arg0 )
		local f2_local0 = DataModel.GetModelValue( f2_arg0 )
		if not f1_arg0.isVisible and f1_local0 <= f2_local0 then
			ACTIONS.AnimateSequence( f1_arg0, "ADSIN" )
			f1_arg0.isVisible = true
		elseif f1_arg0.isVisible and f2_local0 < f1_local0 then
			ACTIONS.AnimateSequence( f1_arg0, "ADSOUT" )
			f1_arg0.isVisible = false
		end
	end )
end

function ReticleRipperScreenWrapper( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 128 * _1080p, 0, 128 * _1080p )
	self.id = "ReticleRipperScreenWrapper"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local ReticleRipperScreen = nil
	
	ReticleRipperScreen = MenuBuilder.BuildRegisteredType( "ReticleRipperScreen", {
		controllerIndex = f3_local1
	} )
	ReticleRipperScreen.id = "ReticleRipperScreen"
	ReticleRipperScreen:SetRGBFromTable( SWATCHES.Reticles.BrightGreen, 0 )
	ReticleRipperScreen:SetAlpha( 0.3, 0 )
	ReticleRipperScreen:SetXRotation( -26, 0 )
	ReticleRipperScreen:SetYRotation( 8, 0 )
	ReticleRipperScreen:SetScale( -0.25, 0 )
	ReticleRipperScreen:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -64, _1080p * 64, _1080p * -64, _1080p * 64 )
	self:addElement( ReticleRipperScreen )
	self.ReticleRipperScreen = ReticleRipperScreen
	
	local ReticleCrosshairUMPL = nil
	
	ReticleCrosshairUMPL = MenuBuilder.BuildRegisteredType( "ReticleCrosshairUMPL", {
		controllerIndex = f3_local1
	} )
	ReticleCrosshairUMPL.id = "ReticleCrosshairUMPL"
	ReticleCrosshairUMPL:SetRGBFromTable( SWATCHES.Reticles.BrightGreen, 0 )
	ReticleCrosshairUMPL:SetXRotation( -26, 0 )
	ReticleCrosshairUMPL:SetScale( -0.4, 0 )
	ReticleCrosshairUMPL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -50, _1080p * 50, _1080p * -60, _1080p * 40 )
	self:addElement( ReticleCrosshairUMPL )
	self.ReticleCrosshairUMPL = ReticleCrosshairUMPL
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		ReticleRipperScreen:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.ReticleRipperScreen:SetAlpha( 0.8, 0 )
				end,
				function ()
					return self.ReticleRipperScreen:SetAlpha( 0.7, 60 )
				end
			},
			{
				function ()
					return self.ReticleRipperScreen:SetYRotation( 0, 60 )
				end
			},
			{
				function ()
					return self.ReticleRipperScreen:SetScale( 0, 60 )
				end
			},
			{
				function ()
					return self.ReticleRipperScreen:SetXRotation( -26, 60 )
				end
			}
		} )
		ReticleCrosshairUMPL:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.ReticleCrosshairUMPL:SetXRotation( 0, 60 )
				end
			},
			{
				function ()
					return self.ReticleCrosshairUMPL:SetAlpha( 1, 60 )
				end
			},
			{
				function ()
					return self.ReticleCrosshairUMPL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -50, _1080p * 50, _1080p * -50, _1080p * 50, 59 )
				end
			}
		} )
		self._sequences.ADSIN = function ()
			ReticleRipperScreen:AnimateLoop( "ADSIN" )
			ReticleCrosshairUMPL:AnimateLoop( "ADSIN" )
		end
		
		ReticleRipperScreen:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.ReticleRipperScreen:SetXRotation( -26, 60 )
				end
			},
			{
				function ()
					return self.ReticleRipperScreen:SetYRotation( 8, 60 )
				end
			},
			{
				function ()
					return self.ReticleRipperScreen:SetScale( -0.25, 60 )
				end
			},
			{
				function ()
					return self.ReticleRipperScreen:SetAlpha( 0, 60 )
				end
			}
		} )
		ReticleCrosshairUMPL:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.ReticleCrosshairUMPL:SetXRotation( -26, 60 )
				end
			},
			{
				function ()
					return self.ReticleCrosshairUMPL:SetAlpha( 0.6, 60 )
				end
			},
			{
				function ()
					return self.ReticleCrosshairUMPL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -50, _1080p * 50, _1080p * -60, _1080p * 40, 59 )
				end
			}
		} )
		self._sequences.ADSOUT = function ()
			ReticleRipperScreen:AnimateSequence( "ADSOUT" )
			ReticleCrosshairUMPL:AnimateSequence( "ADSOUT" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "ReticleRipperScreenWrapper", ReticleRipperScreenWrapper )
LockTable( _M )
