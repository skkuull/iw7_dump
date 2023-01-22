local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ReticlePhaseSweep( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 16 * _1080p, 0, 16 * _1080p )
	self.id = "ReticlePhaseSweep"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local GradientUp = nil
	
	GradientUp = LUI.UIImage.new()
	GradientUp.id = "GradientUp"
	GradientUp:SetRGBFromInt( 11271995, 0 )
	GradientUp:SetAlpha( 0, 0 )
	GradientUp:setImage( RegisterMaterial( "hud_reticle_gradient_top_to_bottom" ), 0 )
	GradientUp:SetBlendMode( BLEND_MODE.addWithAlpha )
	GradientUp:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 4.69, _1080p * 105.69 )
	self:addElement( GradientUp )
	self.GradientUp = GradientUp
	
	local GradientUpTop = nil
	
	GradientUpTop = LUI.UIImage.new()
	GradientUpTop.id = "GradientUpTop"
	GradientUpTop:SetRGBFromInt( 11271995, 0 )
	GradientUpTop:SetAlpha( 0, 0 )
	GradientUpTop:SetZRotation( 180, 0 )
	GradientUpTop:setImage( RegisterMaterial( "hud_reticle_gradient_top_to_bottom" ), 0 )
	GradientUpTop:SetBlendMode( BLEND_MODE.addWithAlpha )
	GradientUpTop:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 4.69 )
	self:addElement( GradientUpTop )
	self.GradientUpTop = GradientUpTop
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		GradientUp:RegisterAnimationSequence( "Scan", {
			{
				function ()
					return self.GradientUp:SetAlpha( 0, 0 )
				end,
				function ()
					return self.GradientUp:SetAlpha( 0.1, 300 )
				end,
				function ()
					return self.GradientUp:SetAlpha( 0.1, 1400 )
				end,
				function ()
					return self.GradientUp:SetAlpha( 0, 300 )
				end
			},
			{
				function ()
					return self.GradientUp:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * -243, _1080p * 243, _1080p * 138, _1080p * 188, 0 )
				end,
				function ()
					return self.GradientUp:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * -242, _1080p * 242, _1080p * -153.69, _1080p * -103.69, 2000 )
				end,
				function ()
					return self.GradientUp:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * -243, _1080p * 243, _1080p * -154, _1080p * -104, 2000 )
				end
			}
		} )
		GradientUpTop:RegisterAnimationSequence( "Scan", {
			{
				function ()
					return self.GradientUpTop:SetAlpha( 0, 0 )
				end,
				function ()
					return self.GradientUpTop:SetAlpha( 0.1, 300 )
				end,
				function ()
					return self.GradientUpTop:SetAlpha( 0.1, 1400 )
				end,
				function ()
					return self.GradientUpTop:SetAlpha( 0, 300 )
				end
			},
			{
				function ()
					return self.GradientUpTop:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * -243, _1080p * 243, _1080p * 133, _1080p * 138, 0 )
				end,
				function ()
					return self.GradientUpTop:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * -242, _1080p * 242, _1080p * -158.69, _1080p * -153.69, 2000 )
				end,
				function ()
					return self.GradientUpTop:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * -243, _1080p * 243, _1080p * -158.69, _1080p * -153.69, 2000 )
				end
			}
		} )
		self._sequences.Scan = function ()
			GradientUp:AnimateLoop( "Scan" )
			GradientUpTop:AnimateLoop( "Scan" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	ACTIONS.AnimateSequence( self, "Scan" )
	return self
end

MenuBuilder.registerType( "ReticlePhaseSweep", ReticlePhaseSweep )
LockTable( _M )
