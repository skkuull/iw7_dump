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

function ReticleEndless( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 64 * _1080p, 0, 64 * _1080p )
	self.id = "ReticleEndless"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local ReticleEndlessBase = nil
	
	ReticleEndlessBase = MenuBuilder.BuildRegisteredType( "ReticleEndlessBase", {
		controllerIndex = f3_local1
	} )
	ReticleEndlessBase.id = "ReticleEndlessBase"
	ReticleEndlessBase:SetRGBFromTable( SWATCHES.Reticles.White, 0 )
	ReticleEndlessBase:SetAlpha( 0.8, 0 )
	ReticleEndlessBase:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * 32, _1080p * -32, _1080p * 32 )
	self:addElement( ReticleEndlessBase )
	self.ReticleEndlessBase = ReticleEndlessBase
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		ReticleEndlessBase:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.ReticleEndlessBase:SetAlpha( 1, 60 )
				end
			}
		} )
		self._sequences.ADSIN = function ()
			ReticleEndlessBase:AnimateSequence( "ADSIN" )
		end
		
		ReticleEndlessBase:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.ReticleEndlessBase:SetAlpha( 0.5, 0 )
				end,
				function ()
					return self.ReticleEndlessBase:SetAlpha( 0.3, 60 )
				end
			}
		} )
		self._sequences.ADSOUT = function ()
			ReticleEndlessBase:AnimateLoop( "ADSOUT" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "ReticleEndless", ReticleEndless )
LockTable( _M )
