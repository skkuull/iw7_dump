local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = 0.5
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

function ReticleHellstormWrapper( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 72 * _1080p, 0, 72 * _1080p )
	self.id = "ReticleHellstormWrapper"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local ReticleHellstorm = nil
	
	ReticleHellstorm = MenuBuilder.BuildRegisteredType( "ReticleHellstorm", {
		controllerIndex = f3_local1
	} )
	ReticleHellstorm.id = "ReticleHellstorm"
	ReticleHellstorm:SetScale( -0.2, 0 )
	ReticleHellstorm:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -36, _1080p * 36, _1080p * -36, _1080p * 36 )
	self:addElement( ReticleHellstorm )
	self.ReticleHellstorm = ReticleHellstorm
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		ReticleHellstorm:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.ReticleHellstorm:SetAlpha( 1, 60 )
				end
			},
			{
				function ()
					return self.ReticleHellstorm:SetScale( 0.25, 60 )
				end
			}
		} )
		self._sequences.ADSIN = function ()
			ReticleHellstorm:AnimateSequence( "ADSIN" )
		end
		
		ReticleHellstorm:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.ReticleHellstorm:SetAlpha( 0.5, 0 )
				end,
				function ()
					return self.ReticleHellstorm:SetAlpha( 0.3, 60 )
				end
			},
			{
				function ()
					return self.ReticleHellstorm:SetScale( -0.2, 0 )
				end
			}
		} )
		self._sequences.ADSOUT = function ()
			ReticleHellstorm:AnimateLoop( "ADSOUT" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	ACTIONS.AnimateSequence( self, "ADSOUT" )
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "ReticleHellstormWrapper", ReticleHellstormWrapper )
LockTable( _M )
