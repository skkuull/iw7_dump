local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = 0.75
	f1_arg0:SubscribeToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_arg1 ), function ( f2_arg0 )
		local f2_local0 = DataModel.GetModelValue( f2_arg0 )
		if f1_arg0.isVisible ~= true and f1_local0 <= f2_local0 then
			ACTIONS.AnimateSequence( f1_arg0, "ADSIN" )
			ACTIONS.AnimateSequenceByElement( f1_arg0, {
				elementName = "ReticleHalfCrosshair",
				sequenceName = "Aim",
				elementPath = "ReticleHalfCrosshair"
			} )
			f1_arg0.isVisible = true
		elseif f1_arg0.isVisible ~= false and f2_local0 < f1_local0 then
			ACTIONS.AnimateSequence( f1_arg0, "ADSOUT" )
			ACTIONS.AnimateSequenceByElement( f1_arg0, {
				elementName = "ReticleHalfCrosshair",
				sequenceName = "Idle",
				elementPath = "ReticleHalfCrosshair"
			} )
			f1_arg0.isVisible = false
		end
	end )
end

function ReticleCrosshairVertGreen( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 40 * _1080p, 0, 40 * _1080p )
	self.id = "ReticleCrosshairVertGreen"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local ReticleHalfCrosshair = nil
	
	ReticleHalfCrosshair = MenuBuilder.BuildRegisteredType( "ReticleHalfCrosshair", {
		controllerIndex = f3_local1
	} )
	ReticleHalfCrosshair.id = "ReticleHalfCrosshair"
	ReticleHalfCrosshair:SetRGBFromTable( SWATCHES.Reticles.BrightGreen, 0 )
	ReticleHalfCrosshair:SetAlpha( 0.4, 0 )
	ReticleHalfCrosshair:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -8, _1080p * 8, _1080p * -6, _1080p * 6 )
	self:addElement( ReticleHalfCrosshair )
	self.ReticleHalfCrosshair = ReticleHalfCrosshair
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		ReticleHalfCrosshair:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.ReticleHalfCrosshair:SetAlpha( 0.6, 50 )
				end
			}
		} )
		self._sequences.ADSIN = function ()
			ReticleHalfCrosshair:AnimateSequence( "ADSIN" )
		end
		
		ReticleHalfCrosshair:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.ReticleHalfCrosshair:SetAlpha( 0.4, 0 )
				end,
				function ()
					return self.ReticleHalfCrosshair:SetAlpha( 0.2, 70 )
				end
			}
		} )
		self._sequences.ADSOUT = function ()
			ReticleHalfCrosshair:AnimateLoop( "ADSOUT" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "ReticleCrosshairVertGreen", ReticleCrosshairVertGreen )
LockTable( _M )
