local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ReticleCrosshair( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 16 * _1080p, 0, 16 * _1080p )
	self.id = "ReticleCrosshair"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local ScopeReticleSpacer = nil
	
	ScopeReticleSpacer = MenuBuilder.BuildRegisteredType( "ScopeReticleSpacer", {
		minSizeADS = 3,
		maxSizeADS = 3,
		minSizeHip = 7,
		maxSizeHip = 16,
		adjustLeft = true,
		adjustRight = true,
		adjustTop = true,
		adjustBottom = true,
		controllerIndex = f1_local1
	} )
	ScopeReticleSpacer.id = "ScopeReticleSpacer"
	ScopeReticleSpacer:SetAlpha( 0, 0 )
	self:addElement( ScopeReticleSpacer )
	self.ScopeReticleSpacer = ScopeReticleSpacer
	
	local RightLineShadow = nil
	
	RightLineShadow = LUI.UIImage.new()
	RightLineShadow.id = "RightLineShadow"
	RightLineShadow:SetRGBFromInt( 12171705, 0 )
	RightLineShadow:setImage( RegisterMaterial( "hud_reticle_box_glow" ), 0 )
	RightLineShadow:SetUseAA( true )
	RightLineShadow:SetBlendMode( BLEND_MODE.blend )
	RightLineShadow:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -4, _1080p * 6, _1080p * -3, _1080p * 2 )
	self:addElement( RightLineShadow )
	self.RightLineShadow = RightLineShadow
	
	local BottomLineShadow = nil
	
	BottomLineShadow = LUI.UIImage.new()
	BottomLineShadow.id = "BottomLineShadow"
	BottomLineShadow:SetRGBFromInt( 12171705, 0 )
	BottomLineShadow:setImage( RegisterMaterial( "hud_reticle_box_glow" ), 0 )
	BottomLineShadow:SetUseAA( true )
	BottomLineShadow:SetBlendMode( BLEND_MODE.blend )
	BottomLineShadow:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -3, _1080p * 2, _1080p * -4, _1080p * 6 )
	self:addElement( BottomLineShadow )
	self.BottomLineShadow = BottomLineShadow
	
	local LeftLineShadow = nil
	
	LeftLineShadow = LUI.UIImage.new()
	LeftLineShadow.id = "LeftLineShadow"
	LeftLineShadow:SetRGBFromInt( 12171705, 0 )
	LeftLineShadow:setImage( RegisterMaterial( "hud_reticle_box_glow" ), 0 )
	LeftLineShadow:SetUseAA( true )
	LeftLineShadow:SetBlendMode( BLEND_MODE.blend )
	LeftLineShadow:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -8, _1080p * 2, _1080p * -3, _1080p * 2 )
	self:addElement( LeftLineShadow )
	self.LeftLineShadow = LeftLineShadow
	
	local TopLineShadow = nil
	
	TopLineShadow = LUI.UIImage.new()
	TopLineShadow.id = "TopLineShadow"
	TopLineShadow:SetRGBFromInt( 12171705, 0 )
	TopLineShadow:setImage( RegisterMaterial( "hud_reticle_box_glow" ), 0 )
	TopLineShadow:SetUseAA( true )
	TopLineShadow:SetBlendMode( BLEND_MODE.blend )
	TopLineShadow:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -3, _1080p * 2, _1080p * -8, _1080p * 2 )
	self:addElement( TopLineShadow )
	self.TopLineShadow = TopLineShadow
	
	local RightLineMid = nil
	
	RightLineMid = LUI.UIImage.new()
	RightLineMid.id = "RightLineMid"
	RightLineMid:setImage( RegisterMaterial( "hud_reticle_box_glow" ), 0 )
	RightLineMid:SetUseAA( true )
	RightLineMid:SetBlendMode( BLEND_MODE.addWithAlpha )
	RightLineMid:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -2, _1080p * 4, _1080p * -2, _1080p * 1 )
	self:addElement( RightLineMid )
	self.RightLineMid = RightLineMid
	
	local LeftLineMid = nil
	
	LeftLineMid = LUI.UIImage.new()
	LeftLineMid.id = "LeftLineMid"
	LeftLineMid:setImage( RegisterMaterial( "hud_reticle_box_glow" ), 0 )
	LeftLineMid:SetUseAA( true )
	LeftLineMid:SetBlendMode( BLEND_MODE.addWithAlpha )
	LeftLineMid:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -6, 0, _1080p * -2, _1080p * 1 )
	self:addElement( LeftLineMid )
	self.LeftLineMid = LeftLineMid
	
	local BottomLineMid = nil
	
	BottomLineMid = LUI.UIImage.new()
	BottomLineMid.id = "BottomLineMid"
	BottomLineMid:setImage( RegisterMaterial( "hud_reticle_box_glow" ), 0 )
	BottomLineMid:SetUseAA( true )
	BottomLineMid:SetBlendMode( BLEND_MODE.addWithAlpha )
	BottomLineMid:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -2, _1080p * 1, _1080p * -2, _1080p * 4 )
	self:addElement( BottomLineMid )
	self.BottomLineMid = BottomLineMid
	
	local TopLineMid = nil
	
	TopLineMid = LUI.UIImage.new()
	TopLineMid.id = "TopLineMid"
	TopLineMid:setImage( RegisterMaterial( "hud_reticle_box_glow" ), 0 )
	TopLineMid:SetUseAA( true )
	TopLineMid:SetBlendMode( BLEND_MODE.addWithAlpha )
	TopLineMid:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -2, _1080p * 1, _1080p * -6, 0 )
	self:addElement( TopLineMid )
	self.TopLineMid = TopLineMid
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		RightLineShadow:RegisterAnimationSequence( "StaticOn", {
			{
				function ()
					return self.RightLineShadow:SetScale( 0.2, 0 )
				end
			},
			{
				function ()
					return self.RightLineShadow:SetAlpha( 0.6, 0 )
				end
			},
			{
				function ()
					return self.RightLineShadow:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -3, _1080p * 4, _1080p * -3, _1080p * 1, 0 )
				end
			}
		} )
		BottomLineShadow:RegisterAnimationSequence( "StaticOn", {
			{
				function ()
					return self.BottomLineShadow:SetScale( 0.2, 0 )
				end
			},
			{
				function ()
					return self.BottomLineShadow:SetAlpha( 0.6, 0 )
				end
			},
			{
				function ()
					return self.BottomLineShadow:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -3, _1080p * 1, _1080p * -3, _1080p * 4, 0 )
				end
			}
		} )
		LeftLineShadow:RegisterAnimationSequence( "StaticOn", {
			{
				function ()
					return self.LeftLineShadow:SetScale( 0.2, 0 )
				end
			},
			{
				function ()
					return self.LeftLineShadow:SetAlpha( 0.6, 0 )
				end
			},
			{
				function ()
					return self.LeftLineShadow:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -6, _1080p * 1, _1080p * -3, _1080p * 1, 0 )
				end
			}
		} )
		TopLineShadow:RegisterAnimationSequence( "StaticOn", {
			{
				function ()
					return self.TopLineShadow:SetScale( 0.2, 0 )
				end
			},
			{
				function ()
					return self.TopLineShadow:SetAlpha( 0.6, 0 )
				end
			},
			{
				function ()
					return self.TopLineShadow:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -3, _1080p * 1, _1080p * -6, _1080p * 1, 0 )
				end
			}
		} )
		RightLineMid:RegisterAnimationSequence( "StaticOn", {
			{
				function ()
					return self.RightLineMid:SetAlpha( 0.5, 0 )
				end,
				function ()
					return self.RightLineMid:SetAlpha( 0.75, 80 )
				end
			},
			{
				function ()
					return self.RightLineMid:setImage( RegisterMaterial( "ui_default_white" ), 0 )
				end
			},
			{
				function ()
					return self.RightLineMid:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -2, _1080p * 3, _1080p * -2, 0, 0 )
				end
			}
		} )
		LeftLineMid:RegisterAnimationSequence( "StaticOn", {
			{
				function ()
					return self.LeftLineMid:SetAlpha( 0.5, 0 )
				end,
				function ()
					return self.LeftLineMid:SetAlpha( 0.75, 80 )
				end
			},
			{
				function ()
					return self.LeftLineMid:setImage( RegisterMaterial( "ui_default_white" ), 0 )
				end
			},
			{
				function ()
					return self.LeftLineMid:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -5, 0, _1080p * -2, 0, 0 )
				end
			}
		} )
		BottomLineMid:RegisterAnimationSequence( "StaticOn", {
			{
				function ()
					return self.BottomLineMid:SetAlpha( 0.5, 0 )
				end,
				function ()
					return self.BottomLineMid:SetAlpha( 0.75, 80 )
				end
			},
			{
				function ()
					return self.BottomLineMid:setImage( RegisterMaterial( "ui_default_white" ), 0 )
				end
			},
			{
				function ()
					return self.BottomLineMid:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -2, 0, _1080p * -2, _1080p * 3, 0 )
				end
			}
		} )
		TopLineMid:RegisterAnimationSequence( "StaticOn", {
			{
				function ()
					return self.TopLineMid:SetAlpha( 0.5, 0 )
				end,
				function ()
					return self.TopLineMid:SetAlpha( 0.75, 80 )
				end
			},
			{
				function ()
					return self.TopLineMid:setImage( RegisterMaterial( "ui_default_white" ), 0 )
				end
			},
			{
				function ()
					return self.TopLineMid:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -2, 0, _1080p * -5, 0, 0 )
				end
			}
		} )
		self._sequences.StaticOn = function ()
			RightLineShadow:AnimateLoop( "StaticOn" )
			BottomLineShadow:AnimateLoop( "StaticOn" )
			LeftLineShadow:AnimateLoop( "StaticOn" )
			TopLineShadow:AnimateLoop( "StaticOn" )
			RightLineMid:AnimateLoop( "StaticOn" )
			LeftLineMid:AnimateLoop( "StaticOn" )
			BottomLineMid:AnimateLoop( "StaticOn" )
			TopLineMid:AnimateLoop( "StaticOn" )
		end
		
		RightLineShadow:RegisterAnimationSequence( "StaticOff", {
			{
				function ()
					return self.RightLineShadow:SetScale( 0, 0 )
				end
			},
			{
				function ()
					return self.RightLineShadow:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -3, _1080p * 5, _1080p * -3, _1080p * 2, 0 )
				end
			}
		} )
		BottomLineShadow:RegisterAnimationSequence( "StaticOff", {
			{
				function ()
					return self.BottomLineShadow:SetScale( 0, 0 )
				end
			},
			{
				function ()
					return self.BottomLineShadow:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -3, _1080p * 2, _1080p * -3, _1080p * 5, 0 )
				end
			}
		} )
		LeftLineShadow:RegisterAnimationSequence( "StaticOff", {
			{
				function ()
					return self.LeftLineShadow:SetScale( 0, 0 )
				end
			},
			{
				function ()
					return self.LeftLineShadow:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -6, _1080p * 2, _1080p * -3, _1080p * 2, 0 )
				end
			}
		} )
		TopLineShadow:RegisterAnimationSequence( "StaticOff", {
			{
				function ()
					return self.TopLineShadow:SetScale( 0, 0 )
				end
			},
			{
				function ()
					return self.TopLineShadow:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -3, _1080p * 2, _1080p * -6, _1080p * 2, 0 )
				end
			}
		} )
		RightLineMid:RegisterAnimationSequence( "StaticOff", {
			{
				function ()
					return self.RightLineMid:setImage( RegisterMaterial( "hud_reticle_box_glow" ), 0 )
				end
			},
			{
				function ()
					return self.RightLineMid:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -3, _1080p * 5, _1080p * -2, _1080p * 1, 0 )
				end
			}
		} )
		LeftLineMid:RegisterAnimationSequence( "StaticOff", {
			{
				function ()
					return self.LeftLineMid:setImage( RegisterMaterial( "hud_reticle_box_glow" ), 0 )
				end
			},
			{
				function ()
					return self.LeftLineMid:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -6, _1080p * 2, _1080p * -2, _1080p * 1, 0 )
				end
			}
		} )
		BottomLineMid:RegisterAnimationSequence( "StaticOff", {
			{
				function ()
					return self.BottomLineMid:setImage( RegisterMaterial( "hud_reticle_box_glow" ), 0 )
				end
			},
			{
				function ()
					return self.BottomLineMid:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -2, _1080p * 1, _1080p * -3, _1080p * 5, 0 )
				end
			}
		} )
		TopLineMid:RegisterAnimationSequence( "StaticOff", {
			{
				function ()
					return self.TopLineMid:setImage( RegisterMaterial( "hud_reticle_box_glow" ), 0 )
				end
			},
			{
				function ()
					return self.TopLineMid:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -2, _1080p * 1, _1080p * -6, _1080p * 2, 0 )
				end
			}
		} )
		self._sequences.StaticOff = function ()
			RightLineShadow:AnimateSequence( "StaticOff" )
			BottomLineShadow:AnimateSequence( "StaticOff" )
			LeftLineShadow:AnimateSequence( "StaticOff" )
			TopLineShadow:AnimateSequence( "StaticOff" )
			RightLineMid:AnimateSequence( "StaticOff" )
			LeftLineMid:AnimateSequence( "StaticOff" )
			BottomLineMid:AnimateSequence( "StaticOff" )
			TopLineMid:AnimateSequence( "StaticOff" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	return self
end

MenuBuilder.registerType( "ReticleCrosshair", ReticleCrosshair )
LockTable( _M )
