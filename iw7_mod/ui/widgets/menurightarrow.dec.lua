local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function MenuRightArrow( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 64 * _1080p, 0, 128 * _1080p )
	self.id = "MenuRightArrow"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Image = nil
	
	Image = LUI.UIImage.new()
	Image.id = "Image"
	Image:SetRGBFromInt( 0, 0 )
	Image:setImage( RegisterMaterial( "wdg_selection_arrow_right_1" ), 0 )
	self:addElement( Image )
	self.Image = Image
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Image:RegisterAnimationSequence( "Blocked", {
			{
				function ()
					return self.Image:SetRGBFromInt( 8421504, 0 )
				end
			},
			{
				function ()
					return self.Image:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0, 0 )
				end
			}
		} )
		self._sequences.Blocked = function ()
			Image:AnimateSequence( "Blocked" )
		end
		
		Image:RegisterAnimationSequence( "NotBlocked", {
			{
				function ()
					return self.Image:SetRGBFromInt( 0, 0 )
				end
			},
			{
				function ()
					return self.Image:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0, 0 )
				end,
				function ()
					return self.Image:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0, 1500 )
				end,
				function ()
					return self.Image:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 4, _1080p * 4, 0, 0, 250, LUI.EASING.inQuadratic )
				end,
				function ()
					return self.Image:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0, 250, LUI.EASING.outQuadratic )
				end
			}
		} )
		self._sequences.NotBlocked = function ()
			Image:AnimateLoop( "NotBlocked" )
		end
		
		Image:RegisterAnimationSequence( "MovedRight", {
			{
				function ()
					return self.Image:SetRGBFromInt( 0, 0 )
				end
			},
			{
				function ()
					return self.Image:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0, 0 )
				end,
				function ()
					return self.Image:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0, 50 )
				end,
				function ()
					return self.Image:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 4, _1080p * 4, 0, 0, 150, LUI.EASING.inQuadratic )
				end,
				function ()
					return self.Image:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0, 149, LUI.EASING.outQuadratic )
				end
			}
		} )
		self._sequences.MovedRight = function ()
			Image:AnimateSequence( "MovedRight" )
		end
		
		Image:RegisterAnimationSequence( "NotBlockedStatic", {
			{
				function ()
					return self.Image:SetRGBFromInt( 0, 0 )
				end
			},
			{
				function ()
					return self.Image:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0, 0 )
				end
			}
		} )
		self._sequences.NotBlockedStatic = function ()
			Image:AnimateSequence( "NotBlockedStatic" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "grid_focus_right_blocked", function ( f22_arg0, f22_arg1 )
		local f22_local0 = f22_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "Blocked" )
	end )
	self:addEventHandler( "grid_focus_right_not_blocked", function ( f23_arg0, f23_arg1 )
		local f23_local0 = f23_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "NotBlocked" )
	end )
	self:addEventHandler( "arrow_button_right_moved", function ( f24_arg0, f24_arg1 )
		local f24_local0 = f24_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "MovedRight" )
	end )
	self:addEventHandler( "arrow_button_right_blocked", function ( f25_arg0, f25_arg1 )
		local f25_local0 = f25_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "Blocked" )
	end )
	self:addEventHandler( "arrow_button_right_not_blocked", function ( f26_arg0, f26_arg1 )
		local f26_local0 = f26_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "NotBlockedStatic" )
	end )
	return self
end

MenuBuilder.registerType( "MenuRightArrow", MenuRightArrow )
LockTable( _M )
