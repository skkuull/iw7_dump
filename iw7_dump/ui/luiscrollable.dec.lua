LUI.UIScrollable = LUI.Class( LUI.UIElement )
LUI.UIScrollable.addElement = function ( f1_arg0, f1_arg1 )
	f1_arg0.container:addElement( f1_arg1 )
end

LUI.UIScrollable.scrollX = function ( f2_arg0, f2_arg1, f2_arg2, f2_arg3, f2_arg4 )
	f2_arg0.container:registerAnimationState( "scroll_target", {
		left = f2_arg1,
		right = f2_arg1 + f2_arg0.containerWidth,
		leftAnchor = true
	} )
	f2_arg0.container:animateToState( "scroll_target", f2_arg2, f2_arg3, f2_arg4 )
end

LUI.UIScrollable.scrollY = function ( f3_arg0, f3_arg1, f3_arg2, f3_arg3, f3_arg4 )
	local f3_local0 = f3_arg0:getHeight()
	if f3_arg1 > 0 then
		f3_arg1 = 0
	elseif f3_arg1 < -f3_arg0.containerHeight + f3_local0 then
		f3_arg1 = -f3_arg0.containerHeight + f3_local0
	end
	f3_arg0.container:registerAnimationState( "scroll_target", {
		top = f3_arg1,
		bottom = f3_arg1 + f3_arg0.containerHeight,
		topAnchor = true,
		bottomAnchor = false
	} )
	f3_arg0.container:animateToState( "scroll_target", f3_arg2, f3_arg3, f3_arg4 )
end

LUI.UIScrollable.init = function ( f4_arg0, f4_arg1, f4_arg2 )
	if f4_arg2.containerWidth == nil or f4_arg2.containerHeight == nil then
		error( "Cannot create scrollable component without valid dimensions!" )
		return 
	end
	LUI.UIElement.init( f4_arg0, f4_arg1 )
	f4_arg0.id = "LUIScrollable"
	if not f4_arg2 then
		f4_arg2 = {}
	end
	f4_arg0:SetHandleMouse( true )
	if f4_arg2.centered == true then
		f4_arg0.container = LUI.UIElement.new( {
			left = -f4_arg2.containerWidth / 2,
			top = -f4_arg2.containerHeight / 2,
			right = f4_arg2.containerWidth / 2,
			bottom = f4_arg2.containerHeight / 2,
			leftAnchor = false,
			topAnchor = false,
			rightAnchor = false,
			bottomAnchor = false,
			zoom = 0
		} )
	else
		f4_arg0.container = LUI.UIElement.new( {
			left = 0,
			top = 0,
			right = f4_arg2.containerWidth,
			bottom = f4_arg2.containerHeight,
			leftAnchor = true,
			topAnchor = true,
			rightAnchor = false,
			bottomAnchor = false,
			zoom = 0
		} )
	end
	f4_arg0.container.id = "LUIScrollable_Container"
	f4_arg0:setUseStencil( true )
	f4_arg0.containerWidth = f4_arg2.containerWidth
	f4_arg0.containerHeight = f4_arg2.containerHeight
	f4_arg0:addElement( f4_arg0.container )
end

