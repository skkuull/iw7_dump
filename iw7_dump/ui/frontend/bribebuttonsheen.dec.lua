local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function BribeButtonSheen( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 320 * _1080p, 0, 472 * _1080p )
	self.id = "BribeButtonSheen"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	self:setUseStencil( true )
	local Sheen = nil
	
	Sheen = LUI.UIImage.new()
	Sheen.id = "Sheen"
	Sheen:SetAlpha( 0, 0 )
	Sheen:SetZRotation( -25, 0 )
	Sheen:setImage( RegisterMaterial( "widg_gradient_center_out" ), 0 )
	Sheen:SetUseAA( true )
	Sheen:SetBlendMode( BLEND_MODE.addWithAlpha )
	Sheen:SetAnchorsAndPosition( 0.5, 0.5, 0, 0, _1080p * -400, _1080p * -300, _1080p * -100, _1080p * 100 )
	self:addElement( Sheen )
	self.Sheen = Sheen
	
	local Overlay = nil
	
	Overlay = LUI.UIImage.new()
	Overlay.id = "Overlay"
	Overlay:SetAlpha( 0, 0 )
	Overlay:SetBlendMode( BLEND_MODE.addWithAlpha )
	self:addElement( Overlay )
	self.Overlay = Overlay
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Sheen:RegisterAnimationSequence( "Pan", {
			{
				function ()
					return self.Sheen:SetAlpha( 0.7, 0 )
				end
			},
			{
				function ()
					return self.Sheen:SetAnchorsAndPosition( 0.5, 0.5, 0, 0, _1080p * -400, _1080p * -300, _1080p * -100, _1080p * 100, 0 )
				end,
				function ()
					return self.Sheen:SetAnchorsAndPosition( 0.5, 0.5, 0, 0, _1080p * -400, _1080p * -300, _1080p * -100, _1080p * 100, 300 )
				end,
				function ()
					return self.Sheen:SetAnchorsAndPosition( 0.5, 0.5, 0, 0, _1080p * 300, _1080p * 400, _1080p * -100, _1080p * 100, 399, LUI.EASING.outQuadratic )
				end
			}
		} )
		Overlay:RegisterAnimationSequence( "Pan", {
			{
				function ()
					return self.Overlay:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Overlay:SetAlpha( 0, 500, LUI.EASING.outQuadratic )
				end
			}
		} )
		self._sequences.Pan = function ()
			Sheen:AnimateSequence( "Pan" )
			Overlay:AnimateSequence( "Pan" )
		end
		
		Sheen:RegisterAnimationSequence( "Stop", {
			{
				function ()
					return self.Sheen:SetAlpha( 0, 0 )
				end
			}
		} )
		Overlay:RegisterAnimationSequence( "Stop", {
			{
				function ()
					return self.Overlay:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Stop = function ()
			Sheen:AnimateSequence( "Stop" )
			Overlay:AnimateSequence( "Stop" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	return self
end

MenuBuilder.registerType( "BribeButtonSheen", BribeButtonSheen )
LockTable( _M )
