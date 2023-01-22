local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	ACTIONS.AnimateSequence( f1_arg0, "Loop" )
	ACTIONS.AnimateSequence( f1_arg0, "Loop2" )
	ACTIONS.AnimateSequence( f1_arg0, "Loop3" )
	f1_arg0:registerEventHandler( "mk2_wide_pattern", function ( element, event )
		element.Pattern:setImage( RegisterMaterial( "mk2_pattern_wide" ), 0 )
		element.Pattern:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -512, _1080p * 512, _1080p * -256, _1080p * 256 )
		element.PatternAlt:setImage( RegisterMaterial( "mk2_pattern_wide" ), 0 )
		element.PatternAlt:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -512, _1080p * 512, _1080p * -256, _1080p * 256 )
	end )
end

function MK2Pattern( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 512 * _1080p, 0, 512 * _1080p )
	self.id = "MK2Pattern"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	self:setUseStencil( true )
	local Pattern = nil
	
	Pattern = LUI.UIImage.new()
	Pattern.id = "Pattern"
	Pattern:setImage( RegisterMaterial( "mk2_pattern" ), 0 )
	Pattern:SetBlendMode( BLEND_MODE.addWithAlpha )
	Pattern:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -256, _1080p * 256, _1080p * -256, _1080p * 256 )
	self:addElement( Pattern )
	self.Pattern = Pattern
	
	local PatternAlt = nil
	
	PatternAlt = LUI.UIImage.new()
	PatternAlt.id = "PatternAlt"
	PatternAlt:SetAlpha( 0, 0 )
	PatternAlt:setImage( RegisterMaterial( "mk2_pattern" ), 0 )
	PatternAlt:SetUseAA( true )
	PatternAlt:SetBlendMode( BLEND_MODE.addWithAlpha )
	PatternAlt:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -256, _1080p * 256, _1080p * -256, _1080p * 256 )
	self:addElement( PatternAlt )
	self.PatternAlt = PatternAlt
	
	local Gradient = nil
	
	Gradient = LUI.UIImage.new()
	Gradient.id = "Gradient"
	Gradient:SetAlpha( 0, 0 )
	Gradient:setImage( RegisterMaterial( "widg_gradient_center_out" ), 0 )
	Gradient:SetUseAA( true )
	Gradient:SetBlendMode( BLEND_MODE.addWithAlpha )
	Gradient:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -160, _1080p * 160, _1080p * -256, _1080p * 256 )
	self:addElement( Gradient )
	self.Gradient = Gradient
	
	self._animationSets.DefaultAnimationSet = function ()
		Pattern:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Pattern:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			Pattern:AnimateSequence( "DefaultSequence" )
		end
		
		Pattern:RegisterAnimationSequence( "Loop", {
			{
				function ()
					return self.Pattern:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Pattern:SetAlpha( 0.25, 1000 )
				end,
				function ()
					return self.Pattern:SetAlpha( 0.99, 1000 )
				end
			}
		} )
		self._sequences.Loop = function ()
			Pattern:AnimateLoop( "Loop" )
		end
		
		PatternAlt:RegisterAnimationSequence( "Loop2", {
			{
				function ()
					return self.PatternAlt:SetAlpha( 0, 0 )
				end,
				function ()
					return self.PatternAlt:SetAlpha( 0.5, 1000 )
				end,
				function ()
					return self.PatternAlt:SetAlpha( 0, 1000 )
				end,
				function ()
					return self.PatternAlt:SetAlpha( 0, 2000 )
				end
			},
			{
				function ()
					return self.PatternAlt:SetScale( 0, 0 )
				end,
				function ()
					return self.PatternAlt:SetScale( 0.25, 2000 )
				end,
				function ()
					return self.PatternAlt:SetScale( 0.25, 2000 )
				end
			}
		} )
		self._sequences.Loop2 = function ()
			PatternAlt:AnimateLoop( "Loop2" )
		end
		
		Gradient:RegisterAnimationSequence( "Loop3", {
			{
				function ()
					return self.Gradient:SetAlpha( 0.25, 0 )
				end,
				function ()
					return self.Gradient:SetAlpha( 0.5, 1000 )
				end,
				function ()
					return self.Gradient:SetAlpha( 0.25, 1000 )
				end
			}
		} )
		self._sequences.Loop3 = function ()
			Gradient:AnimateLoop( "Loop3" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local0( self, f3_local1, controller )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	return self
end

MenuBuilder.registerType( "MK2Pattern", MK2Pattern )
LockTable( _M )
