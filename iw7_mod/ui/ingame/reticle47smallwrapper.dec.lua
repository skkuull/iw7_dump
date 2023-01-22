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

function Reticle47SmallWrapper( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 164 * _1080p, 0, 149 * _1080p )
	self.id = "Reticle47SmallWrapper"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local Reticle47Small = nil
	
	Reticle47Small = MenuBuilder.BuildRegisteredType( "Reticle47Small", {
		controllerIndex = f3_local1
	} )
	Reticle47Small.id = "Reticle47Small"
	Reticle47Small:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -50, _1080p * 50, _1080p * -50, _1080p * 50 )
	self:addElement( Reticle47Small )
	self.Reticle47Small = Reticle47Small
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Reticle47Small:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.Reticle47Small:SetAlpha( 1, 60 )
				end
			}
		} )
		self._sequences.ADSIN = function ()
			Reticle47Small:AnimateSequence( "ADSIN" )
		end
		
		Reticle47Small:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.Reticle47Small:SetAlpha( 0, 60 )
				end
			}
		} )
		self._sequences.ADSOUT = function ()
			Reticle47Small:AnimateSequence( "ADSOUT" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f3_local1, controller )
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "Reticle47Small",
		sequenceName = "Hide",
		elementPath = "Reticle47Small"
	} )
	return self
end

MenuBuilder.registerType( "Reticle47SmallWrapper", Reticle47SmallWrapper )
LockTable( _M )
