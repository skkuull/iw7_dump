local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PlayerAbilityGlow( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 130 * _1080p, 0, 125 * _1080p )
	self.id = "PlayerAbilityGlow"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local AbilityIconGlow = nil
	
	AbilityIconGlow = LUI.UIImage.new()
	AbilityIconGlow.id = "AbilityIconGlow"
	AbilityIconGlow:SetRGBFromTable( SWATCHES.HUD.active, 0 )
	AbilityIconGlow:SetAlpha( 0, 0 )
	AbilityIconGlow:SetDepth( 20, 0 )
	AbilityIconGlow:setImage( RegisterMaterial( "hud_glow" ), 0 )
	AbilityIconGlow:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -50, _1080p * 50, 0, _1080p * 100 )
	self:addElement( AbilityIconGlow )
	self.AbilityIconGlow = AbilityIconGlow
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		AbilityIconGlow:RegisterAnimationSequence( "GlowPulse", {
			{
				function ()
					return self.AbilityIconGlow:SetScale( -0.25, 0 )
				end,
				function ()
					return self.AbilityIconGlow:SetScale( 0.15, 1000, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.AbilityIconGlow:SetScale( -0.25, 1300, LUI.EASING.inQuadratic )
				end
			},
			{
				function ()
					return self.AbilityIconGlow:SetAlpha( 0, 0 )
				end,
				function ()
					return self.AbilityIconGlow:SetAlpha( 0.5, 1000, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.AbilityIconGlow:SetAlpha( 0, 1300, LUI.EASING.inQuadratic )
				end
			}
		} )
		self._sequences.GlowPulse = function ()
			AbilityIconGlow:AnimateLoop( "GlowPulse" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	ACTIONS.AnimateSequence( self, "GlowPulse" )
	return self
end

MenuBuilder.registerType( "PlayerAbilityGlow", PlayerAbilityGlow )
LockTable( _M )
