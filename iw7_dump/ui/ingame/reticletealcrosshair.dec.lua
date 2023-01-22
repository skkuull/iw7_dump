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
				elementName = "ReticleCrosshair",
				sequenceName = "StaticOff",
				elementPath = "ReticleCrosshair"
			} )
			f1_arg0.isVisible = true
		elseif f1_arg0.isVisible ~= false and f2_local0 < f1_local0 then
			ACTIONS.AnimateSequence( f1_arg0, "ADSOUT" )
			ACTIONS.AnimateSequenceByElement( f1_arg0, {
				elementName = "ReticleCrosshair",
				sequenceName = "StaticOn",
				elementPath = "ReticleCrosshair"
			} )
			f1_arg0.isVisible = false
		end
	end )
end

function ReticleTealCrosshair( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 128 * _1080p, 0, 128 * _1080p )
	self.id = "ReticleTealCrosshair"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local ReticleCrosshair = nil
	
	ReticleCrosshair = MenuBuilder.BuildRegisteredType( "ReticleCrosshair", {
		controllerIndex = f3_local1
	} )
	ReticleCrosshair.id = "ReticleCrosshair"
	ReticleCrosshair:SetRGBFromTable( SWATCHES.Reticles.VibrantTeal, 0 )
	ReticleCrosshair:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -8, _1080p * 8, _1080p * -8, _1080p * 8 )
	self:addElement( ReticleCrosshair )
	self.ReticleCrosshair = ReticleCrosshair
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		ReticleCrosshair:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.ReticleCrosshair:SetAlpha( 1, 100 )
				end
			}
		} )
		self._sequences.ADSIN = function ()
			ReticleCrosshair:AnimateSequence( "ADSIN" )
		end
		
		ReticleCrosshair:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.ReticleCrosshair:SetAlpha( 0.4, 200 )
				end
			}
		} )
		self._sequences.ADSOUT = function ()
			ReticleCrosshair:AnimateSequence( "ADSOUT" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f3_local1, controller )
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "ReticleCrosshair",
		sequenceName = "StaticOn",
		elementPath = "ReticleCrosshair"
	} )
	return self
end

MenuBuilder.registerType( "ReticleTealCrosshair", ReticleTealCrosshair )
LockTable( _M )
