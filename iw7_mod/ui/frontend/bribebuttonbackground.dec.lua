local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.Ring )
	assert( f1_arg0.Pattern )
	f1_arg0.Pattern:SetMask( f1_arg0.Ring )
end

function BribeButtonBackground( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 300 * _1080p, 0, 200 * _1080p )
	self.id = "BribeButtonBackground"
	self._animationSets = {}
	self._sequences = {}
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	self:setUseStencil( true )
	local SmokeBG = nil
	
	SmokeBG = LUI.UIImage.new()
	SmokeBG.id = "SmokeBG"
	SmokeBG:SetAlpha( 0, 0 )
	SmokeBG:setImage( RegisterMaterial( "bribe_bg_smoke" ), 0 )
	SmokeBG:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -30, _1080p * 30, _1080p * -30, _1080p * 30 )
	self:addElement( SmokeBG )
	self.SmokeBG = SmokeBG
	
	local Pattern = nil
	
	Pattern = LUI.UIImage.new()
	Pattern.id = "Pattern"
	Pattern:SetAlpha( 0, 0 )
	Pattern:setImage( RegisterMaterial( "bribe_lines_bg" ), 0 )
	Pattern:SetUseAA( true )
	Pattern:SetBlendMode( BLEND_MODE.addWithAlpha )
	Pattern:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -50, _1080p * 50, 0, 0 )
	self:addElement( Pattern )
	self.Pattern = Pattern
	
	local Ring = nil
	
	Ring = LUI.UIImage.new()
	Ring.id = "Ring"
	Ring:setImage( RegisterMaterial( "wdg_ring_mask" ), 0 )
	Ring:SetUseAA( true )
	Ring:SetBlendMode( BLEND_MODE.addWithAlpha )
	Ring:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -128, _1080p * 128, _1080p * -136, _1080p * 120 )
	self:addElement( Ring )
	self.Ring = Ring
	
	local PatternDupe = nil
	
	PatternDupe = LUI.UIImage.new()
	PatternDupe.id = "PatternDupe"
	PatternDupe:SetAlpha( 0, 0 )
	PatternDupe:setImage( RegisterMaterial( "bribe_lines_bg" ), 0 )
	PatternDupe:SetUseAA( true )
	PatternDupe:SetBlendMode( BLEND_MODE.addWithAlpha )
	PatternDupe:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -50, _1080p * 50, 0, 0 )
	self:addElement( PatternDupe )
	self.PatternDupe = PatternDupe
	
	local GlowBG = nil
	
	GlowBG = LUI.UIImage.new()
	GlowBG.id = "GlowBG"
	GlowBG:SetRGBFromInt( 0, 0 )
	GlowBG:SetAlpha( 0.75, 0 )
	GlowBG:SetScale( 1, 0 )
	GlowBG:setImage( RegisterMaterial( "hud_glow" ), 0 )
	GlowBG:SetUseAA( true )
	GlowBG:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -128, _1080p * 128, _1080p * -118, _1080p * 138 )
	self:addElement( GlowBG )
	self.GlowBG = GlowBG
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		GlowBG:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.GlowBG:SetBlendMode( BLEND_MODE.addWithAlpha )
				end
			},
			{
				function ()
					return self.GlowBG:SetRGBFromInt( 16765729, 0 )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			GlowBG:AnimateSequence( "ButtonOver" )
		end
		
		GlowBG:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.GlowBG:SetRGBFromInt( 0, 0 )
				end
			},
			{
				function ()
					return self.GlowBG:SetBlendMode( BLEND_MODE.disabled )
				end
			}
		} )
		self._sequences.ButtonUp = function ()
			GlowBG:AnimateSequence( "ButtonUp" )
		end
		
		SmokeBG:RegisterAnimationSequence( "Loop", {
			{
				function ()
					return self.SmokeBG:SetAlpha( 1, 0 )
				end
			}
		} )
		Pattern:RegisterAnimationSequence( "Loop", {
			{
				function ()
					return self.Pattern:SetAlpha( 1, 0 )
				end
			}
		} )
		Ring:RegisterAnimationSequence( "Loop", {
			{
				function ()
					return self.Ring:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -50, _1080p * 50, _1080p * -50, _1080p * 50, 0 )
				end,
				function ()
					return self.Ring:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -225, _1080p * 225, _1080p * -225, _1080p * 225, 6000 )
				end
			}
		} )
		PatternDupe:RegisterAnimationSequence( "Loop", {
			{
				function ()
					return self.PatternDupe:SetAlpha( 0.25, 0 )
				end
			}
		} )
		self._sequences.Loop = function ()
			SmokeBG:AnimateLoop( "Loop" )
			Pattern:AnimateLoop( "Loop" )
			Ring:AnimateLoop( "Loop" )
			PatternDupe:AnimateLoop( "Loop" )
		end
		
		GlowBG:RegisterAnimationSequence( "Glow", {
			{
				function ()
					return self.GlowBG:SetScale( 1, 0 )
				end,
				function ()
					return self.GlowBG:SetScale( 0, 3000 )
				end,
				function ()
					return self.GlowBG:SetScale( 0.99, 3000 )
				end
			}
		} )
		self._sequences.Glow = function ()
			GlowBG:AnimateLoop( "Glow" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "button_over", function ( f21_arg0, f21_arg1 )
		local f21_local0 = f21_arg1.controller or f2_local1
		ACTIONS.AnimateSequence( self, "ButtonOver" )
	end )
	self:addEventHandler( "button_up", function ( f22_arg0, f22_arg1 )
		local f22_local0 = f22_arg1.controller or f2_local1
		ACTIONS.AnimateSequence( self, "ButtonUp" )
	end )
	f0_local0( self, f2_local1, controller )
	ACTIONS.AnimateSequence( self, "Glow" )
	ACTIONS.AnimateSequence( self, "Loop" )
	return self
end

MenuBuilder.registerType( "BribeButtonBackground", BribeButtonBackground )
LockTable( _M )
