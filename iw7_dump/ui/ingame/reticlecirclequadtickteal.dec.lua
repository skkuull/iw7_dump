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
			ACTIONS.AnimateSequence( f1_arg0, "Flicker" )
			f1_arg0.isVisible = false
		end
	end )
end

function ReticleCircleQuadTickTeal( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 64 * _1080p, 0, 64 * _1080p )
	self.id = "ReticleCircleQuadTickTeal"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local ReticleCircleQuadTickZoom = nil
	
	ReticleCircleQuadTickZoom = MenuBuilder.BuildRegisteredType( "ReticleCircleQuadTick", {
		controllerIndex = f3_local1
	} )
	ReticleCircleQuadTickZoom.id = "ReticleCircleQuadTickZoom"
	ReticleCircleQuadTickZoom:SetRGBFromInt( 3932047, 0 )
	ReticleCircleQuadTickZoom:SetAlpha( 0, 0 )
	ReticleCircleQuadTickZoom:SetXRotation( -30, 0 )
	ReticleCircleQuadTickZoom:SetScale( -0.4, 0 )
	ReticleCircleQuadTickZoom:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -10, _1080p * 10, _1080p * -10, _1080p * 10 )
	self:addElement( ReticleCircleQuadTickZoom )
	self.ReticleCircleQuadTickZoom = ReticleCircleQuadTickZoom
	
	local ReticleCircleQuadTick = nil
	
	ReticleCircleQuadTick = MenuBuilder.BuildRegisteredType( "ReticleCircleQuadTick", {
		controllerIndex = f3_local1
	} )
	ReticleCircleQuadTick.id = "ReticleCircleQuadTick"
	ReticleCircleQuadTick:SetRGBFromInt( 3932047, 0 )
	ReticleCircleQuadTick:SetZRotation( 45, 0 )
	ReticleCircleQuadTick:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -10, _1080p * 10, _1080p * -10, _1080p * 10 )
	self:addElement( ReticleCircleQuadTick )
	self.ReticleCircleQuadTick = ReticleCircleQuadTick
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		ReticleCircleQuadTickZoom:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.ReticleCircleQuadTickZoom:SetAlpha( 0, 50 )
				end,
				function ()
					return self.ReticleCircleQuadTickZoom:SetAlpha( 0.8, 30 )
				end
			}
		} )
		ReticleCircleQuadTick:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.ReticleCircleQuadTick:SetZRotation( -90, 80, LUI.EASING.outCubic )
				end
			},
			{
				function ()
					return self.ReticleCircleQuadTick:SetAlpha( 0.8, 80, LUI.EASING.outCubic )
				end
			},
			{
				function ()
					return self.ReticleCircleQuadTick:SetXRotation( -30, 80, LUI.EASING.outCubic )
				end
			},
			{
				function ()
					return self.ReticleCircleQuadTick:SetYRotation( 0, 80, LUI.EASING.outCubic )
				end
			},
			{
				function ()
					return self.ReticleCircleQuadTick:SetScale( -0.5, 80, LUI.EASING.outCubic )
				end
			}
		} )
		self._sequences.ADSIN = function ()
			ReticleCircleQuadTickZoom:AnimateSequence( "ADSIN" )
			ReticleCircleQuadTick:AnimateSequence( "ADSIN" )
		end
		
		ReticleCircleQuadTickZoom:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.ReticleCircleQuadTickZoom:SetAlpha( 0, 80 )
				end
			}
		} )
		ReticleCircleQuadTick:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.ReticleCircleQuadTick:SetYRotation( 6, 80 )
				end
			},
			{
				function ()
					return self.ReticleCircleQuadTick:SetXRotation( -20, 80 )
				end
			},
			{
				function ()
					return self.ReticleCircleQuadTick:SetScale( 0, 80 )
				end
			},
			{
				function ()
					return self.ReticleCircleQuadTick:SetZRotation( 45, 1000 )
				end,
				function ()
					return self.ReticleCircleQuadTick:SetZRotation( 135, 1000 )
				end,
				function ()
					return self.ReticleCircleQuadTick:SetZRotation( -45, 10 )
				end
			}
		} )
		self._sequences.ADSOUT = function ()
			ReticleCircleQuadTickZoom:AnimateLoop( "ADSOUT" )
			ReticleCircleQuadTick:AnimateLoop( "ADSOUT" )
		end
		
		ReticleCircleQuadTick:RegisterAnimationSequence( "Flicker", {
			{
				function ()
					return self.ReticleCircleQuadTick:SetAlpha( 0.4, 0 )
				end,
				function ()
					return self.ReticleCircleQuadTick:SetAlpha( 0.25, 60 )
				end
			}
		} )
		self._sequences.Flicker = function ()
			ReticleCircleQuadTick:AnimateLoop( "Flicker" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "ReticleCircleQuadTickTeal", ReticleCircleQuadTickTeal )
LockTable( _M )
