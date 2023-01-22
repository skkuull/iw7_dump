local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function CaCSelectedMessage( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 132 * _1080p, 0, 20 * _1080p )
	self.id = "CaCSelectedMessage"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local EndCapRightGlow = nil
	
	EndCapRightGlow = LUI.UIImage.new()
	EndCapRightGlow.id = "EndCapRightGlow"
	EndCapRightGlow:SetRGBFromInt( 16767586, 0 )
	EndCapRightGlow:SetAlpha( 0, 0 )
	EndCapRightGlow:setImage( RegisterMaterial( "selected_angle_gradient" ), 0 )
	EndCapRightGlow:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -64, 0, _1080p * -64, 0 )
	self:addElement( EndCapRightGlow )
	self.EndCapRightGlow = EndCapRightGlow
	
	local EndCapRight = nil
	
	EndCapRight = LUI.UIImage.new()
	EndCapRight.id = "EndCapRight"
	EndCapRight:SetAlpha( 0, 0 )
	EndCapRight:SetZRotation( 180, 0 )
	EndCapRight:setImage( RegisterMaterial( "wdg_slot_cut_out_1" ), 0 )
	EndCapRight:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -19, 0, 0, 0 )
	self:addElement( EndCapRight )
	self.EndCapRight = EndCapRight
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		EndCapRight:RegisterAnimationSequence( "Inactive", {
			{
				function ()
					return self.EndCapRight:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Inactive = function ()
			EndCapRight:AnimateSequence( "Inactive" )
		end
		
		EndCapRightGlow:RegisterAnimationSequence( "Activate", {
			{
				function ()
					return self.EndCapRightGlow:SetAlpha( 0.9, 0 )
				end,
				function ()
					return self.EndCapRightGlow:SetAlpha( 0.8, 590 )
				end,
				function ()
					return self.EndCapRightGlow:SetAlpha( 0, 10 )
				end
			},
			{
				function ()
					return self.EndCapRightGlow:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -64, 0, _1080p * -64, 0, 0 )
				end,
				function ()
					return self.EndCapRightGlow:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -64, 0, _1080p * -64, 0, 400, LUI.EASING.inSine )
				end,
				function ()
					return self.EndCapRightGlow:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -8, 0, _1080p * -8, 0, 200 )
				end
			}
		} )
		EndCapRight:RegisterAnimationSequence( "Activate", {
			{
				function ()
					return self.EndCapRight:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.Activate = function ()
			EndCapRightGlow:AnimateSequence( "Activate" )
			EndCapRight:AnimateSequence( "Activate" )
		end
		
		EndCapRight:RegisterAnimationSequence( "Active", {
			{
				function ()
					return self.EndCapRight:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.Active = function ()
			EndCapRight:AnimateSequence( "Active" )
		end
		
		EndCapRightGlow:RegisterAnimationSequence( "ThirdModeColor", {
			{
				function ()
					return self.EndCapRightGlow:SetRGBFromInt( 12259328, 0 )
				end
			}
		} )
		self._sequences.ThirdModeColor = function ()
			EndCapRightGlow:AnimateSequence( "ThirdModeColor" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	ACTIONS.AnimateSequence( self, "Inactive" )
	if CONDITIONS.IsThirdGameMode( self ) then
		ACTIONS.AnimateSequence( self, "ThirdModeColor" )
	end
	return self
end

MenuBuilder.registerType( "CaCSelectedMessage", CaCSelectedMessage )
LockTable( _M )
