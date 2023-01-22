local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = function ( f2_arg0 )
		local f2_local0 = nil
		local f2_local1 = function ()
			local f3_local0 = f2_arg0:SetRGBFromInt( math.random( 0, 16777215 ), math.random( 300, 800 ), math.random( LUI.EASING.linear, LUI.EASING.inOutBack ) )
			f3_local0.onComplete = f2_local0
		end
		
		f2_local1()
	end
	
	f1_local0( f1_arg0.Burst )
	f1_local0( f1_arg0.BurstBacking )
	f1_local0( f1_arg0.BurstDots )
end

function Reticle50b( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 128 * _1080p, 0, 128 * _1080p )
	self.id = "Reticle50b"
	self._animationSets = {}
	self._sequences = {}
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local BurstBacking = nil
	
	BurstBacking = LUI.UIImage.new()
	BurstBacking.id = "BurstBacking"
	BurstBacking:SetAlpha( 0, 0 )
	BurstBacking:SetScale( 0.5, 0 )
	BurstBacking:setImage( RegisterMaterial( "hud_reticle_50" ), 0 )
	BurstBacking:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 23.12, _1080p * -23.12, _1080p * 23.12, _1080p * -23.12 )
	self:addElement( BurstBacking )
	self.BurstBacking = BurstBacking
	
	local Burst = nil
	
	Burst = LUI.UIImage.new()
	Burst.id = "Burst"
	Burst:SetAlpha( 0, 0 )
	Burst:setImage( RegisterMaterial( "hud_reticle_50" ), 0 )
	Burst:SetBlendMode( BLEND_MODE.addWithAlpha )
	Burst:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 16.96, _1080p * -16.96, _1080p * 16.96, _1080p * -16.96 )
	self:addElement( Burst )
	self.Burst = Burst
	
	local BurstDots = nil
	
	BurstDots = LUI.UIImage.new()
	BurstDots.id = "BurstDots"
	BurstDots:SetAlpha( 0, 0 )
	BurstDots:setImage( RegisterMaterial( "hud_reticle_50b" ), 0 )
	BurstDots:SetBlendMode( BLEND_MODE.addWithAlpha )
	BurstDots:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -1.59, _1080p * 1.59, _1080p * -1.59, _1080p * 1.59 )
	self:addElement( BurstDots )
	self.BurstDots = BurstDots
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		BurstBacking:RegisterAnimationSequence( "Boom1", {
			{
				function ()
					return self.BurstBacking:SetAlpha( 0, 40 )
				end,
				function ()
					return self.BurstBacking:SetAlpha( 0.4, 160, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.BurstBacking:SetAlpha( 0, 300, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.BurstBacking:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -22, _1080p * 22, _1080p * -22, _1080p * 22, 0 )
				end,
				function ()
					return self.BurstBacking:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -22, _1080p * 22, _1080p * -22, _1080p * 22, 39 )
				end,
				function ()
					return self.BurstBacking:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -52, _1080p * 52, _1080p * -52, _1080p * 52, 460, LUI.EASING.outQuadratic )
				end
			}
		} )
		Burst:RegisterAnimationSequence( "Boom1", {
			{
				function ()
					return self.Burst:SetAlpha( 0, 40 )
				end,
				function ()
					return self.Burst:SetAlpha( 1, 160, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.Burst:SetAlpha( 0, 300, LUI.EASING.inOutQuadratic )
				end
			},
			{
				function ()
					return self.Burst:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32.95, _1080p * 32.95, _1080p * -32.95, _1080p * 32.95, 0 )
				end,
				function ()
					return self.Burst:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32.95, _1080p * 32.95, _1080p * -32.95, _1080p * 32.95, 39 )
				end,
				function ()
					return self.Burst:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -47, _1080p * 47, _1080p * -47, _1080p * 47, 160, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.Burst:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -52, _1080p * 52, _1080p * -52, _1080p * 52, 299, LUI.EASING.inOutQuadratic )
				end
			}
		} )
		BurstDots:RegisterAnimationSequence( "Boom1", {
			{
				function ()
					return self.BurstDots:SetAlpha( 0, 0, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.BurstDots:SetAlpha( 1, 180, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.BurstDots:SetAlpha( 0, 120, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.BurstDots:SetZRotation( 0, 0, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.BurstDots:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -21, _1080p * 21, _1080p * -21, _1080p * 21, 0, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.BurstDots:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -69, _1080p * 69, _1080p * -69, _1080p * 69, 300, LUI.EASING.outQuadratic )
				end
			}
		} )
		self._sequences.Boom1 = function ()
			BurstBacking:AnimateSequence( "Boom1" )
			Burst:AnimateSequence( "Boom1" )
			BurstDots:AnimateSequence( "Boom1" )
		end
		
		BurstBacking:RegisterAnimationSequence( "Boom2", {
			{
				function ()
					return self.BurstBacking:SetAlpha( 1, 0 )
				end,
				function ()
					return self.BurstBacking:SetAlpha( 0.6, 220 )
				end,
				function ()
					return self.BurstBacking:SetAlpha( 0, 280, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.BurstBacking:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 55, _1080p * -55, _1080p * 55, _1080p * -55, 0 )
				end,
				function ()
					return self.BurstBacking:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 12, _1080p * -12, _1080p * 12, _1080p * -12, 500, LUI.EASING.outQuadratic )
				end
			}
		} )
		Burst:RegisterAnimationSequence( "Boom2", {
			{
				function ()
					return self.Burst:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Burst:SetAlpha( 1, 100, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.Burst:SetAlpha( 0, 400, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.Burst:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -9, _1080p * 9, _1080p * -9, _1080p * 9, 0 )
				end,
				function ()
					return self.Burst:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -50, _1080p * 50, _1080p * -50, _1080p * 50, 300, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.Burst:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -22, _1080p * 22, _1080p * -22, _1080p * 22, 199, LUI.EASING.outQuadratic )
				end
			}
		} )
		BurstDots:RegisterAnimationSequence( "Boom2", {
			{
				function ()
					return self.BurstDots:SetAlpha( 0, 0 )
				end,
				function ()
					return self.BurstDots:SetAlpha( 1, 100 )
				end,
				function ()
					return self.BurstDots:SetAlpha( 0, 400, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.BurstDots:SetZRotation( 10, 0 )
				end
			},
			{
				function ()
					return self.BurstDots:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -9, _1080p * 9, _1080p * -9, _1080p * 9, 0 )
				end,
				function ()
					return self.BurstDots:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -53, _1080p * 53, _1080p * -53, _1080p * 53, 300, LUI.EASING.outQuadratic )
				end
			}
		} )
		self._sequences.Boom2 = function ()
			BurstBacking:AnimateSequence( "Boom2" )
			Burst:AnimateSequence( "Boom2" )
			BurstDots:AnimateSequence( "Boom2" )
		end
		
		BurstBacking:RegisterAnimationSequence( "Boom3", {
			{
				function ()
					return self.BurstBacking:SetAlpha( 0, 0 )
				end,
				function ()
					return self.BurstBacking:SetAlpha( 0.4, 300, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.BurstBacking:SetAlpha( 0, 200, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.BurstBacking:SetZRotation( -10, 0 )
				end
			},
			{
				function ()
					return self.BurstBacking:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -30, _1080p * 30, _1080p * -30, _1080p * 30, 0 )
				end,
				function ()
					return self.BurstBacking:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -27, _1080p * 27, _1080p * -28, _1080p * 26, 500, LUI.EASING.outQuadratic )
				end
			}
		} )
		Burst:RegisterAnimationSequence( "Boom3", {
			{
				function ()
					return self.Burst:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Burst:SetAlpha( 1, 100, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.Burst:SetAlpha( 0, 400, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.Burst:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -34, _1080p * 34, _1080p * -34, _1080p * 34, 0 )
				end,
				function ()
					return self.Burst:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -75, _1080p * 75, _1080p * -75, _1080p * 75, 300, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.Burst:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -57, _1080p * 57, _1080p * -57, _1080p * 57, 199, LUI.EASING.outQuadratic )
				end
			}
		} )
		BurstDots:RegisterAnimationSequence( "Boom3", {
			{
				function ()
					return self.BurstDots:SetAlpha( 0, 0 )
				end,
				function ()
					return self.BurstDots:SetAlpha( 1, 300, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.BurstDots:SetAlpha( 0, 200, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.BurstDots:SetZRotation( 8, 0 )
				end
			},
			{
				function ()
					return self.BurstDots:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -34, _1080p * 34, _1080p * -34, _1080p * 34, 0 )
				end,
				function ()
					return self.BurstDots:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -66, _1080p * 66, _1080p * -65, _1080p * 67, 500, LUI.EASING.outQuadratic )
				end
			}
		} )
		self._sequences.Boom3 = function ()
			BurstBacking:AnimateSequence( "Boom3" )
			Burst:AnimateSequence( "Boom3" )
			BurstDots:AnimateSequence( "Boom3" )
		end
		
		BurstBacking:RegisterAnimationSequence( "Boom4", {
			{
				function ()
					return self.BurstBacking:SetAlpha( 0, 130 )
				end,
				function ()
					return self.BurstBacking:SetAlpha( 0.4, 140, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.BurstBacking:SetAlpha( 0, 360, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.BurstBacking:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 42, _1080p * -42, _1080p * 42, _1080p * -42, 0 )
				end,
				function ()
					return self.BurstBacking:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 42, _1080p * -42, _1080p * 42, _1080p * -42, 129 )
				end,
				function ()
					return self.BurstBacking:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 32, _1080p * -32, _1080p * 32, _1080p * -32, 500, LUI.EASING.outQuadratic )
				end
			}
		} )
		Burst:RegisterAnimationSequence( "Boom4", {
			{
				function ()
					return self.Burst:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Burst:SetAlpha( 1, 200, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.Burst:SetAlpha( 0, 300, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.Burst:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -13, _1080p * 13, _1080p * -13, _1080p * 13, 0 )
				end,
				function ()
					return self.Burst:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -44, _1080p * 44, _1080p * -44, _1080p * 44, 500, LUI.EASING.outQuadratic )
				end
			}
		} )
		BurstDots:RegisterAnimationSequence( "Boom4", {
			{
				function ()
					return self.BurstDots:SetAlpha( 0, 0 )
				end,
				function ()
					return self.BurstDots:SetAlpha( 1, 200, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.BurstDots:SetAlpha( 0, 300, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.BurstDots:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -22, _1080p * 22, _1080p * -22, _1080p * 22, 0 )
				end,
				function ()
					return self.BurstDots:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -53, _1080p * 53, _1080p * -53, _1080p * 53, 500, LUI.EASING.outQuadratic )
				end
			}
		} )
		self._sequences.Boom4 = function ()
			BurstBacking:AnimateSequence( "Boom4" )
			Burst:AnimateSequence( "Boom4" )
			BurstDots:AnimateSequence( "Boom4" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "Reticle50b", Reticle50b )
LockTable( _M )
