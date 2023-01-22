local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:setActionSFX( nil )
	f1_arg0:addEventHandler( "grid_focus_down_blocked", function ( f2_arg0, f2_arg1 )
		ACTIONS.AnimateSequence( f1_arg0, "Blocked" )
		f1_arg0:SetFocusable( false )
	end )
	f1_arg0:addEventHandler( "grid_focus_down_not_blocked", function ( f3_arg0, f3_arg1 )
		ACTIONS.AnimateSequence( f1_arg0, "NotBlocked" )
		f1_arg0:SetFocusable( true )
	end )
end

function ArrowDown( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 64 * _1080p, 0, 128 * _1080p )
	self.id = "ArrowDown"
	self._animationSets = {}
	self._sequences = {}
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local Image = nil
	
	Image = LUI.UIImage.new()
	Image.id = "Image"
	Image:SetZRotation( 90, 0 )
	Image:setImage( RegisterMaterial( "wdg_selection_arrow_left_1" ), 0 )
	self:addElement( Image )
	self.Image = Image
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Image:RegisterAnimationSequence( "Pulse", {
			{
				function ()
					return self.Image:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -0.5, _1080p * -0.5, 0, 0, 9 )
				end,
				function ()
					return self.Image:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -0.5, _1080p * -0.5, _1080p * 3, _1080p * 3, 90 )
				end,
				function ()
					return self.Image:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -0.5, _1080p * -0.5, 0, 0, 100 )
				end
			}
		} )
		self._sequences.Pulse = function ()
			Image:AnimateSequence( "Pulse" )
		end
		
		Image:RegisterAnimationSequence( "Blocked", {
			{
				function ()
					return self.Image:SetAlpha( 0.2, 0 )
				end
			},
			{
				function ()
					return self.Image:setImage( RegisterMaterial( "wdg_selection_arrow_left_1" ), 0 )
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
				end
			},
			{
				function ()
					return self.Image:setImage( RegisterMaterial( "wdg_selection_arrow_left_1_glow" ), 0 )
				end
			}
		} )
		self._sequences.NotBlocked = function ()
			Image:AnimateSequence( "NotBlocked" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "grid_focus_down_moved", function ( f17_arg0, f17_arg1 )
		local f17_local0 = f17_arg1.controller or f4_local1
		ACTIONS.AnimateSequence( self, "Pulse" )
	end )
	f0_local0( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "ArrowDown", ArrowDown )
LockTable( _M )
