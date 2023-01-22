LUI.UIMouseCursor = LUI.Class( LUI.UIImage )
LUI.UIMouseCursor.priority = 1000
LUI.UIMouseCursor.mouseTimeout = 3000
LUI.UIMouseCursor.MouseActivity = function ( f1_arg0, f1_arg1 )
	local f1_local0 = {}
	f1_arg0.id = "mouse_cursor"
	f1_arg0:registerAnimationState( "default", f1_arg0:SetMousePosition( f1_arg1.x, f1_arg1.y, f1_arg1.root, f1_local0 ) )
	f1_arg0:animateToState( "default" )
	f1_arg0.lastMoveTime = Engine.GetMilliseconds()
end

LUI.UIMouseCursor.Hide = function ( f2_arg0, f2_arg1 )
	f2_arg0:animateToState( "hidden", 400 )
end

LUI.UIMouseCursor.SetMousePosition = function ( f3_arg0, f3_arg1, f3_arg2, f3_arg3, f3_arg4 )
	f3_arg0:applyElementTransform()
	local f3_local0, f3_local1 = ProjectRootCoordinate( f3_arg3.name, f3_arg1, f3_arg2 )
	f3_arg1, f3_arg2 = f3_arg3:PixelsToUnits( f3_local0, f3_local1 )
	f3_arg4.alpha = 1
	f3_arg4.topAnchor = true
	f3_arg4.leftAnchor = true
	f3_arg4.bottomAnchor = false
	f3_arg4.rightAnchor = false
	f3_arg4.left = f3_arg1 - 32
	f3_arg4.right = f3_arg1 + 32
	f3_arg4.top = f3_arg2 - 32
	f3_arg4.bottom = f3_arg2 + 32
	f3_arg0:undoElementTransform()
	return f3_arg4
end

LUI.UIMouseCursor.init = function ( f4_arg0, f4_arg1 )
	LUI.UIImage.init( f4_arg0, f4_arg1 )
	f4_arg0:setPriority( LUI.UIMouseCursor.priority )
	f4_arg0.lastMoveTime = Engine.GetMilliseconds()
	f4_arg0.id = "mouse_cursor"
	f4_arg0:registerAnimationState( "hidden", {
		alpha = 0
	} )
	f4_arg0:animateToState( "hidden", 0 )
	f4_arg0.hide = LUI.UIMouseCursor.Hide
	f4_arg0:registerEventHandler( "mousemove", LUI.UIMouseCursor.MouseActivity )
	f4_arg0:registerEventHandler( "mousedown", LUI.UIMouseCursor.MouseActivity )
	local self = LUI.UITimer.new( nil, {
		interval = 1000,
		event = {
			name = "update_mouse"
		},
		disposable = false,
		eventTarget = element,
		broadcastToRoot = false
	} )
	self.id = "mouse_update_timer"
	f4_arg0:addElement( self )
	f4_arg0:registerEventHandler( "update_mouse", function ( element, event )
		if not CoD.UsingController() then
			return 
		elseif Engine.GetMilliseconds() - element.lastMoveTime > LUI.UIMouseCursor.mouseTimeout then
			element:hide()
		end
	end )
end

