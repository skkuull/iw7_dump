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

function ReticleCrosshairUMPL( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 100 * _1080p, 0, 100 * _1080p )
	self.id = "ReticleCrosshairUMPL"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local ReticleCrosshairUMPBase = nil
	
	ReticleCrosshairUMPBase = MenuBuilder.BuildRegisteredType( "ReticleCrosshairUMPBase", {
		controllerIndex = f3_local1
	} )
	ReticleCrosshairUMPBase.id = "ReticleCrosshairUMPBase"
	ReticleCrosshairUMPBase:SetRGBFromInt( 8641536, 0 )
	ReticleCrosshairUMPBase:SetAlpha( 0.4, 0 )
	ReticleCrosshairUMPBase.RightLineShadow:SetAlpha( 0.6, 0 )
	ReticleCrosshairUMPBase.LeftLineShadow:SetAlpha( 0.6, 0 )
	ReticleCrosshairUMPBase.BottomLineShadow:SetAlpha( 0.6, 0 )
	ReticleCrosshairUMPBase:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -8, _1080p * 8, _1080p * -8, _1080p * 8 )
	self:addElement( ReticleCrosshairUMPBase )
	self.ReticleCrosshairUMPBase = ReticleCrosshairUMPBase
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		ReticleCrosshairUMPBase:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.ReticleCrosshairUMPBase:SetAlpha( 0.8, 0 )
				end,
				function ()
					return self.ReticleCrosshairUMPBase:SetAlpha( 0.9, 60 )
				end
			}
		} )
		self._sequences.ADSIN = function ()
			ReticleCrosshairUMPBase:AnimateLoop( "ADSIN" )
		end
		
		ReticleCrosshairUMPBase:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.ReticleCrosshairUMPBase:SetAlpha( 0.4, 0 )
				end,
				function ()
					return self.ReticleCrosshairUMPBase:SetAlpha( 0.2, 60 )
				end
			}
		} )
		self._sequences.ADSOUT = function ()
			ReticleCrosshairUMPBase:AnimateLoop( "ADSOUT" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "ReticleCrosshairUMPL", ReticleCrosshairUMPL )
LockTable( _M )
