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

function Reticle47Wrapper( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 389 * _1080p, 0, 307 * _1080p )
	self.id = "Reticle47Wrapper"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local Reticle470 = nil
	
	Reticle470 = MenuBuilder.BuildRegisteredType( "Reticle47", {
		controllerIndex = f3_local1
	} )
	Reticle470.id = "Reticle470"
	Reticle470:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -194.5, _1080p * 194.5, _1080p * -153.5, _1080p * 153.5 )
	self:addElement( Reticle470 )
	self.Reticle470 = Reticle470
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Reticle470:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.Reticle470:SetAlpha( 1, 60 )
				end
			}
		} )
		self._sequences.ADSIN = function ()
			Reticle470:AnimateSequence( "ADSIN" )
		end
		
		Reticle470:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.Reticle470:SetAlpha( 0, 60 )
				end
			}
		} )
		self._sequences.ADSOUT = function ()
			Reticle470:AnimateSequence( "ADSOUT" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f3_local1, controller )
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "Reticle470",
		sequenceName = "Hide",
		elementPath = "Reticle470"
	} )
	return self
end

MenuBuilder.registerType( "Reticle47Wrapper", Reticle47Wrapper )
LockTable( _M )
