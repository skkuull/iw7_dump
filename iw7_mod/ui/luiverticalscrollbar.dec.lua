LUI.UIVerticalScrollbar = LUI.Class( LUI.UIElement )
LUI.UIVerticalScrollbar.InactiveDelay = 500
LUI.UIVerticalScrollbar.InactiveDuration = 250
function OnMouseMove( f1_arg0, f1_arg1 )
	if f1_arg0.scrolling then
		local f1_local0 = f1_arg0:getParent()
		local f1_local1 = f1_local0:getHeight()
		local f1_local2, f1_local3, f1_local4, f1_local5 = f1_local0:getRect()
		local f1_local6, f1_local7 = f1_arg1.root:PixelsToUnits( f1_arg1.x, f1_arg1.y )
		f1_local2, f1_local3 = f1_arg1.root:PixelsToUnits( f1_local2, f1_local3 )
		local f1_local8 = (f1_local7 - f1_local3) / f1_local1
		if f1_local8 < 0 then
			f1_local8 = 0
		elseif f1_local8 > 1 then
			f1_local8 = 1
		end
		if f1_arg0.onMoveFunc then
			f1_arg0.onMoveFunc( f1_local0, f1_local0.verticalList, f1_local8, f1_local0.properties )
		end
	end
end

function MouseMoveEvent( f2_arg0, f2_arg1 )
	f2_arg0:applyElementTransform()
	local f2_local0, f2_local1 = ProjectRootCoordinate( f2_arg1.rootName, f2_arg1.x, f2_arg1.y )
	OnMouseMove( f2_arg0, {
		controller = f2_arg1.controller,
		root = f2_arg1.root,
		x = f2_local0,
		y = f2_local1
	} )
	f2_arg0:undoElementTransform()
end

function ScrollbarMoved( f3_arg0, f3_arg1, f3_arg2 )
	if not f3_arg1 then
		DebugPrint( "Warning: Tried to scroll a scrollbar without a vertical list. Make sure the vertical list was manually added. E.G. scrollBar:setList( <vList> )." )
		return 
	elseif not f3_arg2 then
		DebugPrint( "Warning: Tried to scroll a scrollbar without a scroll percentage. This is very bad." )
		return 
	end
	local f3_local0 = f3_arg1:getNumChildren()
	local f3_local1 = math.min( math.floor( f3_arg2 * f3_local0 ), f3_local0 - 1 )
	if f3_local1 == f3_arg1.lastFocusIndex then
		return 
	end
	f3_arg1.lastFocusIndex = f3_local1
	local f3_local2 = f3_arg1:getFirstChild()
	local f3_local3 = nil
	for f3_local4 = 0, f3_local0 - 1, 1 do
		if f3_local4 == f3_local1 then
			f3_local3 = f3_local2
		end
		f3_local2:processEvent( {
			name = "lose_focus",
			immediate = true
		} )
		f3_local2 = f3_local2:getNextSibling()
	end
	if f3_local3 then
		f3_local3:processEvent( {
			name = "gain_focus",
			immediate = true
		} )
	end
end

function OnMouseDown( f4_arg0, f4_arg1 )
	f4_arg0.scrolling = true
	local f4_local0 = Engine.SetUsingScrollbar
	local f4_local1 = f4_arg1.controller
	if not f4_local1 then
		f4_local1 = Engine.GetFirstActiveController()
	end
	f4_local0( f4_local1, true )
	OnMouseMove( f4_arg0, f4_arg1 )
	f4_local0 = f4_arg0:getParent()
	if f4_local0.verticalList then
		f4_local0.verticalList:processEvent( {
			name = "set_children_ignore_mouse",
			ignore = true,
			immediate = true
		} )
	end
end

function StopScrolling( f5_arg0, f5_arg1 )
	f5_arg0.scrolling = false
	local f5_local0 = Engine.SetUsingScrollbar
	local f5_local1 = f5_arg1.controller
	if not f5_local1 then
		f5_local1 = Engine.GetFirstActiveController()
	end
	f5_local0( f5_local1, false )
	f5_local0 = f5_arg0:getParent()
	if f5_local0.verticalList then
		f5_local0.verticalList:processEvent( {
			name = "set_children_ignore_mouse",
			ignore = false,
			immediate = true
		} )
	end
end

LUI.UIVerticalScrollbar.build = function ( f6_arg0, f6_arg1 )
	return LUI.UIVerticalScrollbar.new( nil, f6_arg1 )
end

LUI.UIVerticalScrollbar.init = function ( f7_arg0, f7_arg1, f7_arg2 )
	if not f7_arg2 then
		f7_arg2 = {}
	end
	f7_arg2.scrollBarWidth = f7_arg2.scrollBarWidth or 20
	f7_arg2.activeAlpha = f7_arg2.activeAlpha or 1
	f7_arg2.inactiveAlpha = f7_arg2.inactiveAlpha or 1
	f7_arg2.onMoveFunc = f7_arg2.onMoveFunc or ScrollbarMoved
	local f7_local0 = f7_arg2.barColor
	if not f7_local0 then
		f7_local0 = {
			red = 0.3,
			green = 0.3,
			blue = 0.3,
			alpha = 1
		}
	end
	f7_arg2.barColor = f7_local0
	f7_local0 = f7_arg2.bgColor
	if not f7_local0 then
		f7_local0 = {
			red = 0.05,
			green = 0.05,
			blue = 0.05,
			alpha = 0.6
		}
	end
	f7_arg2.bgColor = f7_local0
	f7_arg2.barMaterial = f7_arg2.barMaterial or "white"
	f7_arg2.bgMaterial = f7_arg2.bgMaterial or "white"
	if not f7_arg1 then
		f7_arg1 = {
			left = 0,
			top = 0,
			right = f7_arg2.scrollBarWidth,
			bottom = 0,
			leftAnchor = false,
			topAnchor = true,
			rightAnchor = true,
			bottomAnchor = true,
			alpha = f7_arg2.activeAlpha
		}
	end
	LUI.UIElement.init( f7_arg0, f7_arg1 )
	f7_arg0.id = "LUIVerticalScrollbar"
	f7_arg0:registerAnimationState( "inactive", {
		left = 0,
		right = f7_arg2.scrollBarWidth,
		leftAnchor = false,
		rightAnchor = true,
		alpha = f7_arg2.inactiveAlpha
	} )
	f7_arg0:registerEventHandler( "list_scroll", LUI.UIVerticalScrollbar.UpdateScrollbar )
	f7_arg0:registerEventHandler( "focus_changed", LUI.UIVerticalScrollbar.FocusChanged )
	f7_arg0:registerEventHandler( "inactive", LUI.UIVerticalScrollbar.Inactive )
	f7_arg0.bgImage = LUI.UIImage.new( {
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		red = f7_arg2.bgColor.red,
		green = f7_arg2.bgColor.green,
		blue = f7_arg2.bgColor.blue,
		alpha = f7_arg2.bgColor.alpha,
		material = RegisterMaterial( f7_arg2.bgMaterial )
	} )
	f7_arg0.bgImage:animateToState( "default" )
	f7_arg0:addElement( f7_arg0.bgImage )
	f7_arg0.scrollButton = LUI.UIButton.new( {
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true
	} )
	f7_arg0.scrollButton.m_requireFocusType = FocusType.MouseOver
	f7_arg0.buttonImage = LUI.UIImage.new( {
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = false,
		red = f7_arg2.barColor.red,
		green = f7_arg2.barColor.green,
		blue = f7_arg2.barColor.blue,
		alpha = f7_arg2.barColor.alpha,
		material = RegisterMaterial( f7_arg2.barMaterial )
	} )
	f7_arg0.scrollButton.onMoveFunc = f7_arg2.onMoveFunc
	f7_arg0.scrollButton:registerEventHandler( "leftmousedown", OnMouseDown )
	f7_arg0.scrollButton:registerEventHandler( "leftmouseup", StopScrolling )
	f7_arg0.scrollButton:addEventHandler( "popup_active", StopScrolling )
	f7_arg0.scrollButton:addEventHandler( "mousemove", MouseMoveEvent )
	f7_arg0.scrollButton:addElement( f7_arg0.buttonImage )
	f7_arg0:addElement( f7_arg0.scrollButton )
	f7_arg0.setList = LUI.UIVerticalScrollbar.SetVerticalList
	f7_arg0.manualUpdate = LUI.UIVerticalScrollbar.ManualUpdate
	f7_arg0:setList( f7_arg2.verticalList )
end

LUI.UIVerticalScrollbar.UpdateScrollbar = function ( f8_arg0, f8_arg1 )
	if f8_arg0.verticalList and f8_arg1.list == f8_arg0.verticalList then
		f8_arg0.buttonImage:registerAnimationState( "default", {
			top = f8_arg1.scrollHandlePosition,
			bottom = f8_arg1.scrollHandlePosition + f8_arg1.scrollHandleSize,
			topAnchor = true,
			bottomAnchor = false
		} )
		f8_arg0.buttonImage:animateToState( "default" )
	end
end

LUI.UIVerticalScrollbar.FocusChanged = function ( f9_arg0, f9_arg1 )
	f9_arg0:animateToState( "default" )
	if f9_arg0.inactiveTimer then
		f9_arg0.inactiveTimer:close()
		f9_arg0.inactiveTimer:reset()
		f9_arg0:addElement( f9_arg0.inactiveTimer )
	else
		f9_arg0.inactiveTimer = LUI.UITimer.new( nil, {
			interval = LUI.UIVerticalScrollbar.InactiveDelay,
			event = "inactive",
			timerGroup = true
		} )
		f9_arg0:addElement( f9_arg0.inactiveTimer )
	end
end

LUI.UIVerticalScrollbar.Inactive = function ( f10_arg0, f10_arg1 )
	f10_arg0:animateToState( "inactive", LUI.UIVerticalScrollbar.InactiveDuration )
end

LUI.UIVerticalScrollbar.SetVerticalList = function ( f11_arg0, f11_arg1 )
	f11_arg0.verticalList = f11_arg1
end

LUI.UIVerticalScrollbar.ManualUpdate = function ( f12_arg0, f12_arg1, f12_arg2, f12_arg3, f12_arg4 )
	local f12_local0 = f12_arg0:getHeight()
	local f12_local1 = f12_local0
	local f12_local2 = 0
	if f12_arg3 ~= 0 then
		f12_local1 = math.min( f12_local0, f12_local0 * f12_arg2 / f12_arg3 )
		if f12_arg3 ~= f12_arg2 then
			f12_local2 = LUI.clamp( f12_arg1 / (f12_arg3 - f12_arg2) * (f12_local0 - f12_local1), 0, f12_local0 - f12_local1 )
		end
	end
	f12_arg0.buttonImage:registerAnimationState( "default", {
		top = f12_local2,
		bottom = f12_local2 + f12_local1,
		topAnchor = true,
		bottomAnchor = false
	} )
	f12_arg0.buttonImage:animateToState( "default" )
end

