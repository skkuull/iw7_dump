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

function ReticleCircleRotateQuadRed( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 64 * _1080p, 0, 64 * _1080p )
	self.id = "ReticleCircleRotateQuadRed"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local ReticleCircleRotateQuad = nil
	
	ReticleCircleRotateQuad = MenuBuilder.BuildRegisteredType( "ReticleCircleRotateQuad", {
		controllerIndex = f3_local1
	} )
	ReticleCircleRotateQuad.id = "ReticleCircleRotateQuad"
	ReticleCircleRotateQuad:SetRGBFromTable( SWATCHES.Reticles.Red, 0 )
	ReticleCircleRotateQuad:SetAlpha( 0.5, 0 )
	ReticleCircleRotateQuad:SetScale( 0.2, 0 )
	ReticleCircleRotateQuad:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -4, _1080p * 4, _1080p * -4, _1080p * 4 )
	self:addElement( ReticleCircleRotateQuad )
	self.ReticleCircleRotateQuad = ReticleCircleRotateQuad
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		ReticleCircleRotateQuad:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.ReticleCircleRotateQuad:SetAlpha( 0.4, 60 )
				end
			}
		} )
		self._sequences.ADSOUT = function ()
			ReticleCircleRotateQuad:AnimateSequence( "ADSOUT" )
		end
		
		ReticleCircleRotateQuad:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.ReticleCircleRotateQuad:SetAlpha( 1, 60 )
				end
			}
		} )
		self._sequences.ADSIN = function ()
			ReticleCircleRotateQuad:AnimateSequence( "ADSIN" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f3_local1, controller )
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "ReticleCircleRotateQuad",
		sequenceName = "Rotate",
		elementPath = "ReticleCircleRotateQuad"
	} )
	return self
end

MenuBuilder.registerType( "ReticleCircleRotateQuadRed", ReticleCircleRotateQuadRed )
LockTable( _M )
