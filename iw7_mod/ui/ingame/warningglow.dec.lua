local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function WarningGlow( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 50 * _1080p, 0, 50 * _1080p )
	self.id = "WarningGlow"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local WarningGlow = nil
	
	WarningGlow = LUI.UIImage.new()
	WarningGlow.id = "WarningGlow"
	WarningGlow:SetRGBFromInt( 15028736, 0 )
	WarningGlow:SetAlpha( 0.75, 0 )
	WarningGlow:setImage( RegisterMaterial( "hud_glow" ), 0 )
	WarningGlow:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -9, _1080p * 9, _1080p * -13, _1080p * 14 )
	self:addElement( WarningGlow )
	self.WarningGlow = WarningGlow
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		WarningGlow:RegisterAnimationSequence( "WarningOn", {
			{
				function ()
					return self.WarningGlow:SetAlpha( 0.5, 0 )
				end,
				function ()
					return self.WarningGlow:SetAlpha( 0.75, 300 )
				end,
				function ()
					return self.WarningGlow:SetAlpha( 0.5, 300 )
				end
			},
			{
				function ()
					return self.WarningGlow:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -9, _1080p * 9, _1080p * -13, _1080p * 14, 0 )
				end,
				function ()
					return self.WarningGlow:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -16.06, _1080p * 16.06, _1080p * -21, _1080p * 22, 300 )
				end,
				function ()
					return self.WarningGlow:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -9, _1080p * 9, _1080p * -13, _1080p * 14, 300 )
				end
			}
		} )
		self._sequences.WarningOn = function ()
			WarningGlow:AnimateLoop( "WarningOn" )
		end
		
		WarningGlow:RegisterAnimationSequence( "WarningOff", {
			{
				function ()
					return self.WarningGlow:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.WarningGlow:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -9, _1080p * 9, _1080p * -13, _1080p * 14, 0 )
				end
			}
		} )
		self._sequences.WarningOff = function ()
			WarningGlow:AnimateSequence( "WarningOff" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	return self
end

MenuBuilder.registerType( "WarningGlow", WarningGlow )
LockTable( _M )
