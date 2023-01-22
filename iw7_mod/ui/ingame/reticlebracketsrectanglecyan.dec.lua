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

function ReticleBracketsRectangleCyan( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 32 * _1080p, 0, 32 * _1080p )
	self.id = "ReticleBracketsRectangleCyan"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local ReticleRectangleBase = nil
	
	ReticleRectangleBase = MenuBuilder.BuildRegisteredType( "ReticleRectangleBase", {
		controllerIndex = f3_local1
	} )
	ReticleRectangleBase.id = "ReticleRectangleBase"
	ReticleRectangleBase:SetRGBFromInt( 65521, 0 )
	ReticleRectangleBase:SetAlpha( 0.8, 0 )
	ReticleRectangleBase:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -2.5, _1080p * 2.5, _1080p * -5, _1080p * 5 )
	self:addElement( ReticleRectangleBase )
	self.ReticleRectangleBase = ReticleRectangleBase
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		ReticleRectangleBase:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.ReticleRectangleBase:SetAlpha( 1, 80 )
				end
			},
			{
				function ()
					return self.ReticleRectangleBase:SetDotPitchEnabled( false )
				end
			},
			{
				function ()
					return self.ReticleRectangleBase:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -1.5, _1080p * 1.5, _1080p * -1.5, _1080p * 2, 79 )
				end
			}
		} )
		self._sequences.ADSIN = function ()
			ReticleRectangleBase:AnimateSequence( "ADSIN" )
		end
		
		ReticleRectangleBase:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.ReticleRectangleBase:SetAlpha( 0.6, 0 )
				end,
				function ()
					return self.ReticleRectangleBase:SetAlpha( 0.3, 50 )
				end
			},
			{
				function ()
					return self.ReticleRectangleBase:SetDotPitchEnabled( true )
				end
			},
			{
				function ()
					return self.ReticleRectangleBase:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -2.5, _1080p * 2.5, _1080p * -5, _1080p * 5, 50 )
				end
			}
		} )
		self._sequences.ADSOUT = function ()
			ReticleRectangleBase:AnimateLoop( "ADSOUT" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "ReticleBracketsRectangleCyan", ReticleBracketsRectangleCyan )
LockTable( _M )
