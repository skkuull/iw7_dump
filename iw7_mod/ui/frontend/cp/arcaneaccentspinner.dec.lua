local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ArcaneAccentSpinner( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1000 * _1080p, 0, 1000 * _1080p )
	self.id = "ArcaneAccentSpinner"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local RedGlow = nil
	
	RedGlow = LUI.UIImage.new()
	RedGlow.id = "RedGlow"
	RedGlow:SetAlpha( 0.8, 0 )
	RedGlow:setImage( RegisterMaterial( "cp_menu_pause_red_glow" ), 0 )
	RedGlow:SetBlendMode( BLEND_MODE.addWithAlpha )
	RedGlow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -390, _1080p * 390, _1080p * -390, _1080p * 390 )
	self:addElement( RedGlow )
	self.RedGlow = RedGlow
	
	local Spinner = nil
	
	Spinner = LUI.UIImage.new()
	Spinner.id = "Spinner"
	Spinner:SetAlpha( 0.3, 0 )
	Spinner:setImage( RegisterMaterial( "zm_tix_arcane_spinner" ), 0 )
	Spinner:SetBlendMode( BLEND_MODE.addWithAlpha )
	Spinner:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -452, _1080p * 452, _1080p * -452, _1080p * 452 )
	self:addElement( Spinner )
	self.Spinner = Spinner
	
	local Triangle = nil
	
	Triangle = LUI.UIImage.new()
	Triangle.id = "Triangle"
	Triangle:SetAlpha( 0.15, 0 )
	Triangle:SetScale( 1.15, 0 )
	Triangle:setImage( RegisterMaterial( "zm_wc_triangle" ), 0 )
	Triangle:SetBlendMode( BLEND_MODE.addWithAlpha )
	Triangle:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -128, _1080p * 128, _1080p * -133.5, _1080p * 122.5 )
	self:addElement( Triangle )
	self.Triangle = Triangle
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Spinner:RegisterAnimationSequence( "Spin", {
			{
				function ()
					return self.Spinner:SetZRotation( 0, 0 )
				end,
				function ()
					return self.Spinner:SetZRotation( -359, 40000 )
				end
			}
		} )
		self._sequences.Spin = function ()
			Spinner:AnimateLoop( "Spin" )
		end
		
		RedGlow:RegisterAnimationSequence( "Pulse", {
			{
				function ()
					return self.RedGlow:SetAlpha( 0.8, 0 )
				end,
				function ()
					return self.RedGlow:SetAlpha( 1, 2000, LUI.EASING.inOutQuadratic )
				end,
				function ()
					return self.RedGlow:SetAlpha( 0.8, 8000, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.RedGlow:SetAlpha( 0.8, 2000 )
				end
			},
			{
				function ()
					return self.RedGlow:SetScale( 0, 0 )
				end,
				function ()
					return self.RedGlow:SetScale( 0.2, 2000, LUI.EASING.inOutQuadratic )
				end,
				function ()
					return self.RedGlow:SetScale( 0, 8000, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.RedGlow:SetScale( 0, 2000 )
				end
			}
		} )
		self._sequences.Pulse = function ()
			RedGlow:AnimateLoop( "Pulse" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	ACTIONS.AnimateSequence( self, "Pulse" )
	ACTIONS.AnimateSequence( self, "Spin" )
	return self
end

MenuBuilder.registerType( "ArcaneAccentSpinner", ArcaneAccentSpinner )
LockTable( _M )
