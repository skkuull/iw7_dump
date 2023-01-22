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

function ReticleWorldEaterWrapper( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 72 * _1080p, 0, 72 * _1080p )
	self.id = "ReticleWorldEaterWrapper"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local ReticleWorldEater = nil
	
	ReticleWorldEater = MenuBuilder.BuildRegisteredType( "ReticleWorldEater", {
		controllerIndex = f3_local1
	} )
	ReticleWorldEater.id = "ReticleWorldEater"
	ReticleWorldEater:SetAlpha( 0.6, 0 )
	ReticleWorldEater:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -36, _1080p * 36, _1080p * -36, _1080p * 36 )
	self:addElement( ReticleWorldEater )
	self.ReticleWorldEater = ReticleWorldEater
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		ReticleWorldEater:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.ReticleWorldEater:SetAlpha( 1, 60 )
				end
			},
			{
				function ()
					return self.ReticleWorldEater:SetScale( 0.2, 60 )
				end
			}
		} )
		self._sequences.ADSIN = function ()
			ReticleWorldEater:AnimateSequence( "ADSIN" )
		end
		
		ReticleWorldEater:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.ReticleWorldEater:SetAlpha( 0.5, 0 )
				end,
				function ()
					return self.ReticleWorldEater:SetAlpha( 0.3, 60 )
				end
			},
			{
				function ()
					return self.ReticleWorldEater:SetScale( -0.1, 60 )
				end
			}
		} )
		self._sequences.ADSOUT = function ()
			ReticleWorldEater:AnimateLoop( "ADSOUT" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "ReticleWorldEaterWrapper", ReticleWorldEaterWrapper )
LockTable( _M )
