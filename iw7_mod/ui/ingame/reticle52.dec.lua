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

function Reticle52( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 64 * _1080p, 0, 64 * _1080p )
	self.id = "Reticle52"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local Glow = nil
	
	Glow = LUI.UIImage.new()
	Glow.id = "Glow"
	Glow:SetRGBFromInt( 8192255, 0 )
	Glow:SetAlpha( 0.2, 0 )
	Glow:setImage( RegisterMaterial( "hud_reticle_52b" ), 0 )
	Glow:SetBlendMode( BLEND_MODE.addWithAlpha )
	Glow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * 32, _1080p * -32, _1080p * 32 )
	self:addElement( Glow )
	self.Glow = Glow
	
	local GlowFlash = nil
	
	GlowFlash = LUI.UIImage.new()
	GlowFlash.id = "GlowFlash"
	GlowFlash:SetRGBFromInt( 57317, 0 )
	GlowFlash:setImage( RegisterMaterial( "hud_reticle_52b" ), 0 )
	GlowFlash:SetBlendMode( BLEND_MODE.addWithAlpha )
	GlowFlash:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * 32, _1080p * -32, _1080p * 32 )
	self:addElement( GlowFlash )
	self.GlowFlash = GlowFlash
	
	local FrameGlow = nil
	
	FrameGlow = LUI.UIImage.new()
	FrameGlow.id = "FrameGlow"
	FrameGlow:SetRGBFromTable( SWATCHES.Reticles.Black, 0 )
	FrameGlow:SetAlpha( 0, 0 )
	FrameGlow:SetScale( -0.03, 0 )
	FrameGlow:setImage( RegisterMaterial( "hud_reticle_52" ), 0 )
	FrameGlow:SetBlendMode( BLEND_MODE.addWithAlpha )
	FrameGlow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -33, _1080p * 33, _1080p * -33, _1080p * 33 )
	self:addElement( FrameGlow )
	self.FrameGlow = FrameGlow
	
	local Frame = nil
	
	Frame = LUI.UIImage.new()
	Frame.id = "Frame"
	Frame:SetRGBFromInt( 0, 0 )
	Frame:SetAlpha( 0.4, 0 )
	Frame:setImage( RegisterMaterial( "hud_reticle_52" ), 0 )
	Frame:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * 32, _1080p * -32, _1080p * 32 )
	self:addElement( Frame )
	self.Frame = Frame
	
	local DotBase = nil
	
	DotBase = MenuBuilder.BuildRegisteredType( "DotBase", {
		controllerIndex = f3_local1
	} )
	DotBase.id = "DotBase"
	DotBase:SetAlpha( 0, 0 )
	DotBase.DotShadow:SetRGBFromTable( SWATCHES.Reticles.Blue, 0 )
	DotBase.DotShadow:SetAlpha( 1, 0 )
	DotBase.Dot:SetRGBFromInt( 8192255, 0 )
	DotBase.Dot:SetScale( 0.5, 0 )
	DotBase.DotHighlight:SetRGBFromTable( SWATCHES.Reticles.Highlight, 0 )
	DotBase:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -3, _1080p * 3, _1080p * -3, _1080p * 3 )
	self:addElement( DotBase )
	self.DotBase = DotBase
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Glow:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.Glow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -64, _1080p * 64, _1080p * -61, _1080p * 61, 59 )
				end
			}
		} )
		GlowFlash:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.GlowFlash:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -64, _1080p * 64, _1080p * -61, _1080p * 61, 59 )
				end
			}
		} )
		FrameGlow:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.FrameGlow:SetAlpha( 0.6, 60 )
				end
			},
			{
				function ()
					return self.FrameGlow:SetScale( -0.01, 60 )
				end
			},
			{
				function ()
					return self.FrameGlow:SetRGBFromTable( SWATCHES.Reticles.Blue, 60 )
				end
			},
			{
				function ()
					return self.FrameGlow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -64, _1080p * 64, _1080p * -64, _1080p * 64, 59 )
				end
			}
		} )
		Frame:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.Frame:SetAlpha( 1, 60 )
				end
			},
			{
				function ()
					return self.Frame:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -64, _1080p * 64, _1080p * -64, _1080p * 64, 59 )
				end
			}
		} )
		DotBase:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.DotBase:SetAlpha( 1, 60 )
				end
			}
		} )
		self._sequences.ADSIN = function ()
			Glow:AnimateSequence( "ADSIN" )
			GlowFlash:AnimateSequence( "ADSIN" )
			FrameGlow:AnimateSequence( "ADSIN" )
			Frame:AnimateSequence( "ADSIN" )
			DotBase:AnimateSequence( "ADSIN" )
		end
		
		Glow:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.Glow:SetAlpha( 0.2, 0 )
				end
			},
			{
				function ()
					return self.Glow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * 32, _1080p * -32, _1080p * 32, 59 )
				end
			}
		} )
		GlowFlash:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.GlowFlash:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * 32, _1080p * -32, _1080p * 32, 59 )
				end
			}
		} )
		FrameGlow:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.FrameGlow:SetAlpha( 0, 60 )
				end
			},
			{
				function ()
					return self.FrameGlow:SetRGBFromTable( SWATCHES.Reticles.Black, 60 )
				end
			},
			{
				function ()
					return self.FrameGlow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -33, _1080p * 33, _1080p * -33, _1080p * 33, 59 )
				end
			}
		} )
		Frame:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.Frame:SetAlpha( 0.4, 60 )
				end
			},
			{
				function ()
					return self.Frame:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * 32, _1080p * -32, _1080p * 32, 59 )
				end
			}
		} )
		DotBase:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.DotBase:SetAlpha( 0, 60 )
				end
			}
		} )
		self._sequences.ADSOUT = function ()
			Glow:AnimateLoop( "ADSOUT" )
			GlowFlash:AnimateLoop( "ADSOUT" )
			FrameGlow:AnimateLoop( "ADSOUT" )
			Frame:AnimateLoop( "ADSOUT" )
			DotBase:AnimateLoop( "ADSOUT" )
		end
		
		Glow:RegisterAnimationSequence( "OnFire", {
			{
				function ()
					return self.Glow:SetAlpha( 1, 60 )
				end,
				function ()
					return self.Glow:SetAlpha( 0.4, 630, LUI.EASING.outQuintic )
				end
			}
		} )
		GlowFlash:RegisterAnimationSequence( "OnFire", {
			{
				function ()
					return self.GlowFlash:SetAlpha( 1, 0 )
				end,
				function ()
					return self.GlowFlash:SetAlpha( 0, 60 )
				end
			}
		} )
		FrameGlow:RegisterAnimationSequence( "OnFire", {
			{
				function ()
					return self.FrameGlow:SetAlpha( 1, 60 )
				end,
				function ()
					return self.FrameGlow:SetAlpha( 0.4, 630, LUI.EASING.outQuintic )
				end
			},
			{
				function ()
					return self.FrameGlow:SetScale( -0.04, 60 )
				end,
				function ()
					return self.FrameGlow:SetScale( -0.03, 630, LUI.EASING.outQuintic )
				end
			}
		} )
		self._sequences.OnFire = function ()
			Glow:AnimateSequence( "OnFire" )
			GlowFlash:AnimateSequence( "OnFire" )
			FrameGlow:AnimateSequence( "OnFire" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.player.currentWeapon.shotCounter:GetModel( f3_local1 ), function ()
		ACTIONS.AnimateSequence( self, "OnFire" )
	end )
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "Reticle52", Reticle52 )
LockTable( _M )
