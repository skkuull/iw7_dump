local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	ACTIONS.AnimateSequence( f1_arg0, "NotBlockedStatic" )
	f1_arg0:registerEventHandler( "mouseenter", function ( element, event )
		ACTIONS.AnimateSequence( element, "NotBlocked" )
	end )
	f1_arg0:registerEventHandler( "mouseleave", function ( element, event )
		ACTIONS.AnimateSequence( element, "NotBlockedStatic" )
	end )
	f1_arg0:addEventHandler( "button_action", function ()
		local f4_local0 = "MovedRight"
		local f4_local1 = "button_shoulderr"
		ACTIONS.AnimateSequence( f1_arg0, f4_local0 )
		local f4_local2 = f1_arg0:GetCurrentMenu()
		assert( f4_local2 )
		f4_local2:processEvent( {
			name = f4_local1,
			controller = f1_arg1
		} )
	end )
	f1_arg0.m_requireFocusType = FocusType.MouseOver
end

function ArrowRightClick( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 64 * _1080p, 0, 128 * _1080p )
	self.id = "ArrowRightClick"
	self._animationSets = {}
	self._sequences = {}
	local f5_local1 = controller and controller.controllerIndex
	if not f5_local1 and not Engine.InFrontend() then
		f5_local1 = self:getRootController()
	end
	assert( f5_local1 )
	local f5_local2 = self
	local Image = nil
	
	Image = LUI.UIImage.new()
	Image.id = "Image"
	Image:setImage( RegisterMaterial( "wdg_selection_arrow_right_1" ), 0 )
	self:addElement( Image )
	self.Image = Image
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Image:RegisterAnimationSequence( "Blocked", {
			{
				function ()
					return self.Image:SetAlpha( 0.2, 0 )
				end
			},
			{
				function ()
					return self.Image:SetRGBFromInt( 16777215, 0 )
				end
			},
			{
				function ()
					return self.Image:setImage( RegisterMaterial( "wdg_selection_arrow_right_1" ), 0 )
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
					return self.Image:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Image:SetAlpha( 1, 1500 )
				end
			},
			{
				function ()
					return self.Image:SetRGBFromInt( 16777215, 0 )
				end
			},
			{
				function ()
					return self.Image:setImage( RegisterMaterial( "wdg_selection_arrow_right_1_glow" ), 0 )
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
					return self.Image:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Image:SetAlpha( 1, 50 )
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
					return self.Image:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Image:SetRGBFromInt( 16777215, 0 )
				end
			},
			{
				function ()
					return self.Image:setImage( RegisterMaterial( "wdg_selection_arrow_right_1_glow" ), 0 )
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
	self:addEventHandler( "grid_focus_right_blocked", function ( f34_arg0, f34_arg1 )
		local f34_local0 = f34_arg1.controller or f5_local1
		ACTIONS.AnimateSequence( self, "Blocked" )
	end )
	self:addEventHandler( "grid_focus_right_not_blocked", function ( f35_arg0, f35_arg1 )
		local f35_local0 = f35_arg1.controller or f5_local1
		ACTIONS.AnimateSequence( self, "NotBlocked" )
	end )
	self:addEventHandler( "arrow_button_right_moved", function ( f36_arg0, f36_arg1 )
		local f36_local0 = f36_arg1.controller or f5_local1
		ACTIONS.AnimateSequence( self, "MovedRight" )
	end )
	self:addEventHandler( "arrow_button_right_blocked", function ( f37_arg0, f37_arg1 )
		local f37_local0 = f37_arg1.controller or f5_local1
		ACTIONS.AnimateSequence( self, "Blocked" )
	end )
	self:addEventHandler( "arrow_button_right_not_blocked", function ( f38_arg0, f38_arg1 )
		local f38_local0 = f38_arg1.controller or f5_local1
		ACTIONS.AnimateSequence( self, "NotBlockedStatic" )
	end )
	self:addEventHandler( "grid_focus_right_moved", function ( f39_arg0, f39_arg1 )
		local f39_local0 = f39_arg1.controller or f5_local1
		ACTIONS.AnimateSequence( self, "MovedRight" )
	end )
	f0_local0( self, f5_local1, controller )
	return self
end

MenuBuilder.registerType( "ArrowRightClick", ArrowRightClick )
LockTable( _M )
