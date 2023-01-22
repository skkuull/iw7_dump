local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = 0.5
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

function ReticlePhase( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 16 * _1080p, 0, 16 * _1080p )
	self.id = "ReticlePhase"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local ReticlePhaseBase = nil
	
	ReticlePhaseBase = MenuBuilder.BuildRegisteredType( "ReticlePhaseBase", {
		controllerIndex = f3_local1
	} )
	ReticlePhaseBase.id = "ReticlePhaseBase"
	ReticlePhaseBase:SetRGBFromInt( 11271995, 0 )
	ReticlePhaseBase:SetAlpha( 0.4, 0 )
	ReticlePhaseBase:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -8, _1080p * 8, _1080p * -8, _1080p * 8 )
	self:addElement( ReticlePhaseBase )
	self.ReticlePhaseBase = ReticlePhaseBase
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		ReticlePhaseBase:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.ReticlePhaseBase:SetScale( 0.5, 60 )
				end
			},
			{
				function ()
					return self.ReticlePhaseBase:SetAlpha( 0.8, 60 )
				end
			}
		} )
		self._sequences.ADSIN = function ()
			ReticlePhaseBase:AnimateSequence( "ADSIN" )
		end
		
		ReticlePhaseBase:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.ReticlePhaseBase:SetAlpha( 0.3, 0 )
				end,
				function ()
					return self.ReticlePhaseBase:SetAlpha( 0.2, 60 )
				end
			},
			{
				function ()
					return self.ReticlePhaseBase:SetScale( 0, 60 )
				end
			}
		} )
		self._sequences.ADSOUT = function ()
			ReticlePhaseBase:AnimateLoop( "ADSOUT" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f3_local1, controller )
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "ReticlePhaseBase",
		sequenceName = "Pulse",
		elementPath = "ReticlePhaseBase"
	} )
	return self
end

MenuBuilder.registerType( "ReticlePhase", ReticlePhase )
LockTable( _M )
