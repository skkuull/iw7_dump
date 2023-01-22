local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = 0.75
	f1_arg0:SubscribeToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_arg1 ), function ( f2_arg0 )
		local f2_local0 = DataModel.GetModelValue( f2_arg0 )
		if f1_arg0.isVisible ~= true and f1_local0 <= f2_local0 then
			ACTIONS.AnimateSequence( f1_arg0, "ADSIN" )
			f1_arg0.isVisible = true
		elseif f1_arg0.isVisible ~= false and f2_local0 < f1_local0 then
			ACTIONS.AnimateSequence( f1_arg0, "ADSOUT" )
			f1_arg0.isVisible = false
		end
	end )
end

function ReticleBulletHawk( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 60 * _1080p, 0, 60 * _1080p )
	self.id = "ReticleBulletHawk"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local ReticleBulletHawkBase = nil
	
	ReticleBulletHawkBase = MenuBuilder.BuildRegisteredType( "ReticleBulletHawkBase", {
		controllerIndex = f3_local1
	} )
	ReticleBulletHawkBase.id = "ReticleBulletHawkBase"
	ReticleBulletHawkBase:SetAlpha( 0.5, 0 )
	ReticleBulletHawkBase:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -30, _1080p * 30, _1080p * -30, _1080p * 30 )
	self:addElement( ReticleBulletHawkBase )
	self.ReticleBulletHawkBase = ReticleBulletHawkBase
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		ReticleBulletHawkBase:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.ReticleBulletHawkBase:SetAlpha( 1, 90 )
				end
			},
			{
				function ()
					return self.ReticleBulletHawkBase:SetScale( 0.45, 90 )
				end
			}
		} )
		self._sequences.ADSIN = function ()
			ReticleBulletHawkBase:AnimateSequence( "ADSIN" )
		end
		
		ReticleBulletHawkBase:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.ReticleBulletHawkBase:SetAlpha( 0.5, 0 )
				end,
				function ()
					return self.ReticleBulletHawkBase:SetAlpha( 0.3, 60 )
				end
			},
			{
				function ()
					return self.ReticleBulletHawkBase:SetScale( 0, 60 )
				end
			}
		} )
		self._sequences.ADSOUT = function ()
			ReticleBulletHawkBase:AnimateLoop( "ADSOUT" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "ReticleBulletHawk", ReticleBulletHawk )
LockTable( _M )
