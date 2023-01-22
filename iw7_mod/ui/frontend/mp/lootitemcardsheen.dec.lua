local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	ACTIONS.AnimateSequence( f1_arg0, "Pan" )
end

function LootItemCardSheen( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 320 * _1080p, 0, 472 * _1080p )
	self.id = "LootItemCardSheen"
	self._animationSets = {}
	self._sequences = {}
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
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
	f0_local0( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "LootItemCardSheen", LootItemCardSheen )
LockTable( _M )
