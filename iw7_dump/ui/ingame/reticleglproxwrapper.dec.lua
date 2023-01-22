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

function ReticleGLProxWrapper( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 30 * _1080p, 0, 85 * _1080p )
	self.id = "ReticleGLProxWrapper"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local ReticleGLProx = nil
	
	ReticleGLProx = MenuBuilder.BuildRegisteredType( "ReticleGLProx", {
		controllerIndex = f3_local1
	} )
	ReticleGLProx.id = "ReticleGLProx"
	ReticleGLProx:SetAlpha( 0.5, 0 )
	ReticleGLProx:SetXRotation( -16, 0 )
	ReticleGLProx:SetYRotation( 16, 0 )
	ReticleGLProx:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -16.5, _1080p * 16.5, _1080p * -16.5, _1080p * 16.5 )
	self:addElement( ReticleGLProx )
	self.ReticleGLProx = ReticleGLProx
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		ReticleGLProx:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.ReticleGLProx:SetYRotation( 0, 100 )
				end
			},
			{
				function ()
					return self.ReticleGLProx:SetAlpha( 0.6, 100 )
				end
			},
			{
				function ()
					return self.ReticleGLProx:SetXRotation( -16, 100 )
				end
			},
			{
				function ()
					return self.ReticleGLProx:SetScale( 0, 100 )
				end
			}
		} )
		self._sequences.ADSIN = function ()
			ReticleGLProx:AnimateSequence( "ADSIN" )
		end
		
		ReticleGLProx:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.ReticleGLProx:SetAlpha( 0.4, 0 )
				end,
				function ()
					return self.ReticleGLProx:SetAlpha( 0.2, 60 )
				end
			},
			{
				function ()
					return self.ReticleGLProx:SetXRotation( -16, 60 )
				end
			},
			{
				function ()
					return self.ReticleGLProx:SetYRotation( 16, 60 )
				end
			},
			{
				function ()
					return self.ReticleGLProx:SetScale( 0, 60 )
				end
			}
		} )
		self._sequences.ADSOUT = function ()
			ReticleGLProx:AnimateLoop( "ADSOUT" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "ReticleGLProxWrapper", ReticleGLProxWrapper )
LockTable( _M )
