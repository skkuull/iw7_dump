LUI.UIElement = LUI.Class()
LUI.UIElement.id = "LUIElement"
LUI.UIElement.addElement = function ( f1_arg0, f1_arg1 )
	if f1_arg0:canAddElement( f1_arg1 ) then
		f1_arg0:addElementToC( f1_arg1 )
	end
end

LUI.UIElement.addElementBefore = function ( f2_arg0, f2_arg1 )
	local f2_local0 = f2_arg1:getParent()
	if not f2_local0 then
		error( "LUI Error: Element has no parent!" )
		return 
	elseif f2_local0:canAddElement( f2_arg0 ) then
		f2_arg0:addElementBeforeInC( f2_arg1 )
	end
end

LUI.UIElement.addElementAfter = function ( f3_arg0, f3_arg1 )
	local f3_local0 = f3_arg1:getParent()
	if not f3_local0 then
		error( "LUI Error: Element has no parent!" )
		return 
	elseif f3_local0:canAddElement( f3_arg0 ) then
		f3_arg0:addElementAfterInC( f3_arg1 )
	end
end

LUI.UIElement.removeElement = function ( f4_arg0, f4_arg1 )
	if f4_arg0.removeElementInC then
		f4_arg0:removeElementInC( f4_arg1 )
	end
end

LUI.UIElement.canAddElement = function ( f5_arg0, f5_arg1 )
	if f5_arg1 == nil then
		error( "LUI Error: Tried to add nil element!" )
		return false
	elseif f5_arg1:getParent() == f5_arg0 then
		return false
	else
		return true
	end
end

LUI.UIElement.RemoveFromParent = function ( f6_arg0 )
	local f6_local0 = f6_arg0:getParent()
	if f6_local0 ~= nil then
		f6_local0:removeElement( f6_arg0 )
	end
end

LUI.UIElement.close = function ( f7_arg0 )
	f7_arg0:UnsubscribeFromAllModels()
	f7_arg0:RemoveDataLinks()
	f7_arg0:RemoveFromParent()
end

LUI.UIElement.closeChildren = function ( f8_arg0 )
	local f8_local0 = f8_arg0:getFirstChild()
	if not f8_local0 then
		return 
	end
	while f8_local0 do
		local f8_local1 = f8_local0:getNextSibling()
		f8_local0:close()
		f8_local0 = f8_local1
	end
end

LUI.UIElement.closeTree = function ( f9_arg0 )
	local f9_local0 = f9_arg0:getFirstChild()
	while f9_local0 do
		local f9_local1 = f9_local0:getNextSibling()
		f9_local0:closeTree()
		f9_local0 = f9_local1
	end
	f9_arg0:close()
end

LUI.UIElement.getFullID = function ( f10_arg0 )
	local f10_local0 = f10_arg0.id
	local f10_local1 = f10_arg0:getParent()
	while f10_local1 do
		f10_local0 = f10_local1.id .. "/" .. f10_local0
		f10_local1 = f10_local1:getParent()
	end
	return f10_local0
end

LUI.UIElement.getChildById = function ( f11_arg0, f11_arg1 )
	local f11_local0 = f11_arg0:getFirstChild()
	while f11_local0 do
		if f11_local0.id == f11_arg1 then
			return f11_local0
		end
		f11_local0 = f11_local0:getNextSibling()
	end
end

LUI.UIElement.isDescendentOf = function ( f12_arg0, f12_arg1 )
	if not f12_arg0 or not f12_arg1 then
		return false
	end
	local f12_local0 = f12_arg0
	while f12_local0 do
		if f12_local0 == f12_arg1 then
			return true
		end
		f12_local0 = f12_local0:getParent()
	end
	return false
end

LUI.UIElement.getFirstDescendentById = function ( f13_arg0, f13_arg1 )
	local f13_local0 = f13_arg0:getChildById( f13_arg1 )
	if f13_local0 then
		return f13_local0
	end
	local f13_local1 = f13_arg0:getFirstChild()
	while f13_local1 do
		f13_local0 = f13_local1:getFirstDescendentById( f13_arg1 )
		if f13_local0 then
			return f13_local0
		end
		f13_local1 = f13_local1:getNextSibling()
	end
end

LUI.UIElement.isIDNamed = function ( f14_arg0 )
	local f14_local0
	if type( f14_arg0.id ) ~= "string" or f14_arg0.id == "" then
		f14_local0 = false
	else
		f14_local0 = true
	end
	return f14_local0
end

LUI.UIElement.isChildOf = function ( f15_arg0, f15_arg1 )
	if not f15_arg0 or not f15_arg1 then
		return false
	end
	local f15_local0 = f15_arg1:getFirstChild()
	while f15_local0 do
		if f15_local0 == f15_arg0 then
			return true
		end
		f15_local0 = f15_local0:getNextSibling()
	end
	return false
end

LUI.UIElement.SetHandleMouse = function ( f16_arg0, f16_arg1 )
	f16_arg0.handleMouseMove = f16_arg1
	f16_arg0.handleMouseButton = f16_arg1
end

LUI.UIElement.SetHandleMouseMove = function ( f17_arg0, f17_arg1 )
	f17_arg0.handleMouseMove = f17_arg1
end

LUI.UIElement.SetHandleMouseButton = function ( f18_arg0, f18_arg1 )
	f18_arg0.handleMouseButton = f18_arg1
end

LUI.UIElement.SetHandleMouseTree = function ( f19_arg0, f19_arg1 )
	local f19_local0 = f19_arg0:getFirstChild()
	while f19_local0 do
		local f19_local1 = f19_local0:getNextSibling()
		f19_local0:SetHandleMouseTree( f19_arg1 )
		f19_local0 = f19_local1
	end
	f19_arg0:SetHandleMouse( f19_arg1 )
end

LUI.UIElement.MouseMoveEvent = function ( f20_arg0, f20_arg1 )
	if f20_arg0.m_outsideParentList or f20_arg0.m_focusLockedByScrolling then
		return 
	elseif not Engine.UsesMouseCursor() then
		return 
	elseif not Engine.InFrontend() and not LUI.UIRoot.mouseInitialized then
		LUI.UIRoot.mouseInitialized = true
		return true
	end
	local f20_local0 = false
	f20_arg0:applyElementTransform()
	if f20_arg0.handleMouseMove and not f20_arg1.waitingForKeyBind then
		local f20_local1, f20_local2 = ProjectRootCoordinate( f20_arg1.rootName, f20_arg1.x, f20_arg1.y )
		if f20_local1 == nil or f20_local2 == nil then
			f20_arg0:undoElementTransform()
			return 
		end
		local f20_local3 = false
		local f20_local4, f20_local5, f20_local6, f20_local7 = f20_arg0:getRect()
		if f20_arg1.mouse_outside == nil and f20_local4 ~= nil and f20_local5 <= f20_local2 and f20_local2 <= f20_local7 and f20_local4 <= f20_local1 and f20_local1 <= f20_local6 then
			f20_local3 = true
		end
		if f20_local3 then
			if f20_arg0:AcceptsFocusType( FocusType.MouseOver ) and not f20_arg0:isInFocus() then
				f20_arg0:processEvent( {
					name = "gain_focus",
					focusType = FocusType.MouseOver,
					controller = f20_arg1.controller
				} )
				local f20_local8 = f20_arg0:getParent()
				if f20_local8:isIDNamed() then
					f20_local8.shouldSaveState = true
				end
			end
			if f20_arg0.m_mouseOver == nil then
				f20_arg0.m_mouseOver = true
				if f20_arg0.m_eventHandlers.mouseenter ~= nil then
					f20_arg0.m_eventHandlers:mouseenter( {
						name = "mouseenter",
						controller = f20_arg1.controller,
						root = f20_arg1.root,
						x = f20_local1,
						y = f20_local2
					} )
				end
			end
		else
			if f20_arg0:isInFocus() then
				f20_arg0:processEvent( {
					name = "lose_focus"
				} )
			end
			if f20_arg0.m_mouseOver ~= nil then
				f20_arg0.m_mouseOver = nil
				if f20_arg0.m_eventHandlers.mouseleave ~= nil then
					f20_arg0.m_eventHandlers:mouseleave( {
						name = "mouseleave",
						controller = f20_arg1.controller,
						root = f20_arg1.root
					} )
				end
			end
		end
		if not f20_local3 and f20_arg1.mouse_outside == nil then
			f20_arg1.mouse_outside = true
			f20_local0 = true
		end
		if f20_arg0.m_eventHandlers.mousedrag ~= nil and f20_arg0.m_leftMouseDown ~= nil then
			f20_arg0.m_eventHandlers:mousedrag( {
				name = "mousedrag",
				controller = f20_arg1.controller,
				root = f20_arg1.root,
				x = f20_local1,
				y = f20_local2,
				mouse_outside = f20_arg1.mouse_outside
			} )
		end
	end
	f20_arg0:dispatchEventToAllChildren( f20_arg1 )
	if f20_arg0.shouldSaveState then
		f20_arg0:saveState()
		f20_arg0.shouldSaveState = nil
	end
	if f20_local0 then
		f20_arg1.mouse_outside = nil
	end
	f20_arg0:undoElementTransform()
	return true
end

LUI.UIElement.MouseButtonEvent = function ( f21_arg0, f21_arg1 )
	if f21_arg0.m_outsideParentList or f21_arg0.m_focusLockedByScrolling then
		return 
	end
	f21_arg0:applyElementTransform()
	if f21_arg0.handleMouseButton then
		local f21_local0, f21_local1 = ProjectRootCoordinate( f21_arg1.rootName, f21_arg1.x, f21_arg1.y )
		if f21_local0 == nil or f21_local1 == nil then
			f21_arg0:undoElementTransform()
			return 
		end
		local f21_local2 = false
		local f21_local3, f21_local4, f21_local5, f21_local6 = f21_arg0:getRect()
		if f21_arg1.mouse_outside == nil and f21_local3 ~= nil and f21_local4 <= f21_local1 and f21_local1 <= f21_local6 and f21_local3 <= f21_local0 and f21_local0 <= f21_local5 then
			f21_local2 = true
		end
		f21_arg1.root = LUI.UIRoot.GetRootFromName( f21_arg1.rootName )
		if f21_arg1.name == "mouseup" then
			if f21_arg1.button == "left" and f21_arg0.m_leftMouseDown ~= nil then
				f21_arg0.m_leftMouseDown = nil
				if f21_arg0.m_eventHandlers.leftmouseup ~= nil then
					f21_arg0.m_eventHandlers:leftmouseup( {
						name = "leftmouseup",
						controller = f21_arg1.controller,
						root = f21_arg1.root,
						x = f21_local0,
						y = f21_local1,
						inside = f21_local2
					} )
				end
			end
			if f21_arg1.button == "right" and f21_arg0.m_rightMouseDown ~= nil then
				f21_arg0.m_rightMouseDown = nil
				if f21_arg0.m_eventHandlers.rightmouseup ~= nil then
					f21_arg0.m_eventHandlers:rightmouseup( {
						name = "rightmouseup",
						controller = f21_arg1.controller,
						root = f21_arg1.root,
						x = f21_local0,
						y = f21_local1,
						inside = f21_local2
					} )
				end
			end
		end
		if f21_local2 and f21_arg1.name == "mousedown" then
			if f21_arg1.button == "left" and f21_arg0.m_eventHandlers.leftmousedown ~= nil and f21_arg0.m_leftMouseDown == nil then
				f21_arg0.m_leftMouseDown = true
				f21_arg0.m_eventHandlers:leftmousedown( {
					name = "leftmousedown",
					controller = f21_arg1.controller,
					root = f21_arg1.root,
					x = f21_local0,
					y = f21_local1,
					inside = f21_local2
				} )
			end
			if f21_arg1.button == "right" and f21_arg0.m_eventHandlers.rightmousedown ~= nil and f21_arg0.m_rightMouseDown == nil then
				f21_arg0.m_rightMouseDown = true
				f21_arg0.m_eventHandlers:rightmousedown( {
					name = "rightmousedown",
					controller = f21_arg1.controller,
					root = f21_arg1.root,
					x = f21_local0,
					y = f21_local1,
					inside = f21_local2
				} )
			end
		end
	end
	f21_arg0:dispatchEventToAllChildren( f21_arg1 )
	f21_arg0:undoElementTransform()
	return true
end

LUI.UIElement.PopupActive = function ( f22_arg0, f22_arg1 )
	f22_arg0.m_leftMouseDown = nil
end

LUI.UIElement.GetNextFocusableElement = function ( f23_arg0, f23_arg1, f23_arg2, f23_arg3, f23_arg4 )
	assert( type( f23_arg0 ) == "userdata" )
	assert( type( f23_arg1 ) == "userdata" )
	if f23_arg0.navigation and f23_arg0.navigation[f23_arg2] then
		return f23_arg0.navigation[f23_arg2]
	else
		return nil
	end
end

LUI.UIElement.FocusNextElement = function ( f24_arg0, f24_arg1, f24_arg2, f24_arg3, f24_arg4, f24_arg5 )
	local f24_local0 = f24_arg0:GetNextFocusableElement( f24_arg1, f24_arg2, f24_arg3, f24_arg4 )
	if f24_local0 then
		f24_arg1:processEvent( {
			name = "lose_focus",
			controller = f24_arg5
		} )
		f24_local0:processEvent( {
			name = "gain_focus",
			controller = f24_arg5
		} )
		local f24_local1 = f24_arg1:getParent()
		if f24_local1 and f24_local0:getParent() == f24_local1 then
			f24_local1:saveState()
		end
		return true
	else
		local f24_local1 = f24_arg0:getParent()
		if f24_local1 then
			return f24_local1:FocusNextElement( f24_arg0, f24_arg2, f24_arg3, f24_arg4, f24_arg5 )
		else
			return false
		end
	end
end

LUI.UIElement.AcceptsFocusType = function ( f25_arg0, f25_arg1 )
	return false
end

LUI.UIElement.TreeCanFocus = function ( f26_arg0, f26_arg1 )
	if f26_arg0:AcceptsFocusType( f26_arg1 ) then
		return true
	end
	local f26_local0 = f26_arg0:getFirstChild()
	while f26_local0 do
		if f26_local0:TreeCanFocus( f26_arg1 ) then
			return true
		end
		f26_local0 = f26_local0:getNextSibling()
	end
	return false
end

LUI.UIElement.isParentInFocus = function ( f27_arg0 )
	local f27_local0 = f27_arg0:getParent()
	if f27_local0 and f27_local0:isInFocus() then
		return true
	else
		return false
	end
end

LUI.UIElement.getFirstInFocus = function ( f28_arg0 )
	if f28_arg0:isInFocus() then
		return f28_arg0
	end
	local f28_local0 = f28_arg0:getFirstChild()
	while f28_local0 do
		local f28_local1 = f28_local0:getFirstInFocus()
		if f28_local1 then
			return f28_local1
		end
		f28_local0 = f28_local0:getNextSibling()
	end
end

LUI.UIElement.getAllFocusedChildren = function ( f29_arg0, f29_arg1 )
	if not f29_arg1 then
		f29_arg1 = {}
	end
	local f29_local0 = f29_arg0:getFirstChild()
	while f29_local0 do
		local f29_local1 = f29_local0:getNextSibling()
		if f29_local0:isInFocus() then
			f29_arg1[#f29_arg1 + 1] = f29_local0
		else
			f29_arg1 = f29_local0:getAllFocusedChildren( f29_arg1 )
		end
		f29_local0 = f29_local1
	end
	return f29_arg1
end

LUI.UIElement.HasEventHandler = function ( f30_arg0, f30_arg1 )
	return f30_arg0.m_eventHandlers[f30_arg1] ~= nil
end

LUI.UIElement.processEvent = function ( f31_arg0, f31_arg1 )
	local f31_local0 = f31_arg0.m_eventHandlers[f31_arg1.name]
	if f31_local0 ~= nil then
		local f31_local1 = f31_local0( f31_arg0, f31_arg1 )
		if not f31_local1 or f31_arg1.dispatchChildren then
			f31_local1 = f31_arg0:dispatchEventToChildren( f31_arg1 ) or f31_local1
		end
		return f31_local1
	else
		return f31_arg0:dispatchEventToChildren( f31_arg1 )
	end
end

LUI.UIElement.dispatchEventToParent = function ( f32_arg0, f32_arg1 )
	local f32_local0 = f32_arg0:getParent()
	while f32_local0 do
		local f32_local1 = f32_local0.m_eventHandlers[f32_arg1.name]
		if f32_local1 then
			if f32_arg1.dispatchChildren then
				f32_local0:dispatchEventToChildren( f32_arg1 )
			end
			return f32_local1( f32_local0, f32_arg1 )
		end
		f32_local0 = f32_local0:getParent()
	end
end

LUI.UIElement.dispatchEventToCurrentMenu = function ( f33_arg0, f33_arg1 )
	local f33_local0 = f33_arg0:GetCurrentMenu()
	return f33_local0:processEvent( f33_arg1 )
end

LUI.UIElement.GetCurrentMenu = function ( f34_arg0 )
	return LUI.FlowManager.GetCurrentMenu( f34_arg0 )
end

LUI.UIElement.dispatchEventToChildren = function ( f35_arg0, f35_arg1 )
	local f35_local0 = f35_arg0:getFirstChild()
	while f35_local0 do
		local f35_local1 = f35_local0:getNextSibling()
		local f35_local2 = f35_local0:processEvent( f35_arg1 )
		if f35_local2 then
			return f35_local2
		end
		f35_local0 = f35_local1
	end
end

LUI.UIElement.dispatchEventToAllChildren = function ( f36_arg0, f36_arg1 )
	local f36_local0 = f36_arg0:getFirstChild()
	while f36_local0 do
		local f36_local1 = f36_local0:getNextSibling()
		local f36_local2 = f36_local0:processEvent( f36_arg1 )
		f36_local0 = f36_local1
	end
end

LUI.UIElement.dispatchEventToRoot = function ( f37_arg0, f37_arg1 )
	LUI.UIRoot.ProcessEvent( f37_arg0:getRootParent(), f37_arg1 )
end

LUI.UIElement.dispatchEventToAllRoots = function ( f38_arg0, f38_arg1 )
	for f38_local3, f38_local4 in pairs( LUI.roots ) do
		f38_local4:processEvent( f38_arg1 )
	end
end

LUI.UIElement.dispatchEventToAllOtherRoots = function ( f39_arg0, f39_arg1 )
	local f39_local0 = f39_arg0:getRootParent()
	for f39_local4, f39_local5 in pairs( LUI.roots ) do
		if f39_local0 ~= f39_local5 and f39_local5 ~= LUI.primaryRoot then
			f39_local5:processEvent( f39_arg1 )
		end
	end
end

LUI.UIElement.registerEventHandler = function ( f40_arg0, f40_arg1, f40_arg2 )
	f40_arg0.m_eventHandlers[f40_arg1] = f40_arg2
	if not f40_arg0.isaroot and EventCatcher.isDirectDispatchEventType( f40_arg1 ) then
		local f40_local0 = f40_arg0:getRootParent()
		f40_local0.eventCatcher:registerDirectDispatchHandler( f40_arg0, f40_arg1, f40_arg2 )
	end
end

LUI.UIElement.registerOmnvarHandler = function ( f41_arg0, f41_arg1, f41_arg2 )
	assert( not f41_arg0.isaroot )
	local f41_local0 = f41_arg0:getRootParent()
	f41_local0.eventCatcher:registerOmnvarHandler( f41_arg0, f41_arg1, f41_arg2 )
end

LUI.UIElement.registerEventHandlerIfFree = function ( f42_arg0, f42_arg1, f42_arg2 )
	if f42_arg0.m_eventHandlers[f42_arg1] == nil then
		f42_arg0:registerEventHandler( f42_arg1, f42_arg2 )
	end
end

local f0_local0 = function ( f43_arg0, f43_arg1 )
	local f43_local0 = f43_arg0
	local f43_local1 = f43_arg1
	return function ( f44_arg0, f44_arg1 )
		local f44_local0, f44_local1 = nil
		return f43_local0( f44_arg0, f44_arg1 ) or f43_local1( f44_arg0, f44_arg1 )
	end
	
end

LUI.UIElement.addEventHandler = function ( f45_arg0, f45_arg1, f45_arg2 )
	if f45_arg0.m_eventHandlers[f45_arg1] then
		f45_arg0:registerEventHandler( f45_arg1, f0_local0( f45_arg0.m_eventHandlers[f45_arg1], f45_arg2 ) )
	else
		f45_arg0:registerEventHandler( f45_arg1, f45_arg2 )
	end
end

LUI.UIElement.getRootParent = function ( f46_arg0 )
	return Engine.GetLuiRoot()
end

LUI.UIElement.getRootController = function ( f47_arg0 )
	local f47_local0 = f47_arg0:getRootParent()
	return f47_local0:GetControllerIndex()
end

LUI.UIElement.RegisterAnimationSequence = function ( f48_arg0, f48_arg1, f48_arg2 )
	f48_arg0.sequences = f48_arg0.sequences or {}
	f48_arg0.sequences[f48_arg1] = f48_arg2
end

LUI.UIElement.AnimateLoop = function ( f49_arg0, f49_arg1 )
	if not f49_arg0.sequences or not f49_arg0.sequences[f49_arg1] then
		DebugPrint( "Tried to loop an unregistered sequence " .. f49_arg1 .. "." )
	else
		local f49_local0 = f49_arg0.sequences[f49_arg1]
		if f49_local0 and f49_local0[1] and f49_local0[1][1] and type( f49_local0[1][1] ) == "function" then
			for f49_local4, f49_local5 in ipairs( f49_local0 ) do
				f49_arg0:PlaySequenceInternal( f49_local5, true )
			end
		else
			local f49_local1 = MBh.AnimateLoop( f49_local0 )
			f49_local1( f49_arg0 )
		end
	end
end

LUI.UIElement.AnimateSequence = function ( f50_arg0, f50_arg1 )
	if not f50_arg0.sequences or not f50_arg0.sequences[f50_arg1] then
		DebugPrint( "Tried to animate to unregistered sequence " .. f50_arg1 .. "." )
	else
		local f50_local0 = f50_arg0.sequences[f50_arg1]
		if f50_local0 and f50_local0[1] and f50_local0[1][1] and type( f50_local0[1][1] ) == "function" then
			for f50_local4, f50_local5 in ipairs( f50_local0 ) do
				f50_arg0:PlaySequenceInternal( f50_local5, false )
			end
		else
			local f50_local1 = MBh.AnimateSequence( f50_local0 )
			f50_local1( f50_arg0 )
		end
	end
end

local f0_local1 = nil
f0_local1 = function ( f51_arg0, f51_arg1, f51_arg2 )
	f51_arg1 = f51_arg1 + 1
	if #f51_arg0 < f51_arg1 then
		if f51_arg2 and 1 < #f51_arg0 then
			f51_arg1 = 1
		else
			return 
		end
	end
	assert( type( f51_arg0[f51_arg1] ) == "function" )
	local f51_local0 = f51_arg0[f51_arg1]()
	if f51_local0 then
		assert( type( f51_local0 ) == "userdata" )
		f51_local0.onComplete = function ()
			f0_local1( f51_arg0, f51_arg1, f51_arg2 )
		end
		
	else
		f0_local1( f51_arg0, f51_arg1, f51_arg2 )
	end
end

LUI.UIElement.PlaySequenceInternal = function ( f53_arg0, f53_arg1, f53_arg2 )
	assert( type( f53_arg1 ) == "table" )
	assert( #f53_arg1 > 0 )
	assert( type( f53_arg1[1] ) == "function" )
	f0_local1( f53_arg1, 0, f53_arg2 )
end

if not LUI.UIElement.hasAnimationState then
	LUI.UIElement.hasAnimationState = function ( f54_arg0, f54_arg1 )
		if not f54_arg0.hasAnimationStateInC then
			return f54_arg0.m_animationStates[f54_arg1]
		else
			return f54_arg0:hasAnimationStateInC( f54_arg1 )
		end
	end
	
end
LUI.UIElement.saveState = function ( f55_arg0 )
	if not f55_arg0:isIDNamed() then
		error( "LUI Error: Tried to save menu state, but element has no name: " .. f55_arg0:getFullID() )
		return nil
	end
	local f55_local0 = {}
	for f55_local4, f55_local5 in ipairs( f55_arg0:getAllFocusedChildren() ) do
		if not f55_local5:isIDNamed() then
			error( "LUI Error: Tried to save menu state, but focused element has no name: " .. f55_local5:getFullID() )
			return nil
		end
		table.insert( f55_local0, {
			id = f55_local5.id,
			data = f55_local5.saveData
		} )
	end
	f55_arg0._savedState = f55_local0
	return f55_local0
end

LUI.UIElement.clearSavedState = function ( f56_arg0 )
	f56_arg0._savedState = nil
end

LUI.UIElement.restoreState = function ( f57_arg0, f57_arg1, f57_arg2, f57_arg3 )
	if not f57_arg0:isIDNamed() then
		error( "LUI Error: Tried to restore menu state, but element has no name: " .. f57_arg0:getFullID() )
		return 
	end
	local f57_local0 = false
	local f57_local1 = 0
	local f57_local2 = f57_arg1 or f57_arg0._savedState
	if f57_local2 then
		f57_local0 = true
		for f57_local6, f57_local7 in ipairs( f57_local2 ) do
			if f57_local7.id and f57_arg0:processEvent( {
				name = "restore_focus",
				id = f57_local7.id,
				data = f57_local7.data,
				isRefresh = f57_arg3,
				controller = f57_arg2
			} ) then
				f57_local1 = f57_local1 + 1
			end
		end
	end
	return f57_local0, f57_local1
end

LUI.UIElement.restoreFocus = function ( f58_arg0, f58_arg1 )
	if f58_arg0.id == f58_arg1.id and f58_arg0:TreeCanFocus( FocusType.MenuFlow ) then
		if not f58_arg1.isRefresh or f58_arg1.isRefresh and not f58_arg0._isRefresh then
			f58_arg0:processEvent( {
				name = "gain_focus",
				focusType = FocusType.MenuFlow,
				controller = f58_arg1.controller
			} )
		end
		return true
	else
		return f58_arg0:dispatchEventToChildren( f58_arg1 )
	end
end

LUI.UIElement.findSoundAlias = function ( f59_arg0, f59_arg1 )
	local f59_local0 = f59_arg0
	while f59_local0 do
		if f59_local0.soundSet and SOUND_SETS[f59_local0.soundSet] and SOUND_SETS[f59_local0.soundSet][f59_arg1] then
			return SOUND_SETS[f59_local0.soundSet][f59_arg1]
		end
		f59_local0 = f59_local0:getParent()
	end
	return SOUND_SETS.default[f59_arg1]
end

LUI.UIElement.PlaySoundInternal = function ( f60_arg0, f60_arg1, f60_arg2 )
	local f60_local0 = Engine.PlaySound( f60_arg1 )
	if f60_arg2 then
		if f60_arg0.soundIDs == nil then
			f60_arg0.soundIDs = {}
		end
		f60_arg0.soundIDs[f60_arg1] = f60_local0
	end
end

LUI.UIElement.playSound = function ( f61_arg0, f61_arg1, f61_arg2, f61_arg3 )
	local f61_local0 = f61_arg0:findSoundAlias( f61_arg1 )
	if f61_local0 then
		local f61_local1, f61_local2 = nil
		if f61_arg3 and f61_arg3 > 0 then
			f61_local1 = f61_arg0:Wait( f61_arg3 )
			f61_local2 = f61_arg0:Wait( f61_arg3 )
			f61_local1.onComplete = function ()
				f61_arg0:PlaySoundInternal( f61_local0, f61_arg2 )
			end
			
		else
			f61_arg0:PlaySoundInternal( f61_local0, f61_arg2 )
		end
		if f61_arg3 then
			return f61_local2
		else
			return true
		end
	else
		
	end
end

LUI.UIElement.stopSound = function ( f63_arg0, f63_arg1 )
	local f63_local0 = f63_arg0:findSoundAlias( f63_arg1 )
	if f63_arg0.soundIDs and f63_arg0.soundIDs[f63_local0] then
		Engine.StopSound( f63_arg0.soundIDs[f63_local0] )
		f63_arg0.soundIDs[f63_local0] = nil
		return true
	else
		
	end
end

LUI.UIElement.AddButtonHelperTextToElement = function ( f64_arg0, f64_arg1, f64_arg2 )
	local f64_local0 = assert
	local f64_local1
	if not f64_arg2.button_ref then
		f64_local1 = f64_arg2.button_ref2
		if f64_local1 then
		
		else
			f64_local0( f64_local1, "AddButtonHelperText requires both a button_ref and a helper_text." )
			f64_arg2.name = "add_button_helper_text"
			f64_arg1:processEvent( f64_arg2 )
			f64_arg0._helperTextAdditions = f64_arg0._helperTextAdditions or {}
			if f64_arg2.button_ref then
				f64_arg0._helperTextAdditions[f64_arg2.button_ref] = true
			end
			if f64_arg2.button_ref2 then
				f64_arg0._helperTextAdditions[f64_arg2.button_ref2] = true
			end
		end
	end
	f64_local1 = f64_arg2.helper_text
end

LUI.UIElement.AddButtonHelperText = function ( f65_arg0, f65_arg1 )
	f65_arg0:AddButtonHelperTextToElement( f65_arg0:GetCurrentMenu(), f65_arg1 )
end

LUI.UIElement.RemoveButtonHelperTextFromElement = function ( f66_arg0, f66_arg1, f66_arg2, f66_arg3 )
	assert( f66_arg2, "RemoveButtonHelperText requires a valid buttonRef value" )
	if f66_arg0._helperTextAdditions and f66_arg0._helperTextAdditions[f66_arg2] then
		f66_arg1:processEvent( {
			name = "add_button_helper_text",
			button_ref = f66_arg2,
			side = f66_arg3,
			helper_text = ""
		} )
		f66_arg0._helperTextAdditions[f66_arg2] = nil
	end
end

LUI.UIElement.RemoveButtonHelperText = function ( f67_arg0, f67_arg1, f67_arg2 )
	f67_arg0:RemoveButtonHelperTextFromElement( f67_arg0:GetCurrentMenu(), f67_arg1, f67_arg2 )
end

DataLink = LUI.Class()
DataLink.TYPES = {
	model = 0,
	selfDataSource = 1,
	gridDataSource = 2,
	tabManagerDataSource = 3,
	dataSourceCallback = 4
}
DataLink.init = function ( f68_arg0, f68_arg1 )
	assert( type( f68_arg1.source ) == "userdata" )
	assert( type( f68_arg1.target ) == "userdata" )
	local f68_local0 = assert
	local f68_local1
	if f68_arg1.source == f68_arg1.target and f68_arg1.type ~= DataLink.TYPES.model and f68_arg1.type ~= DataLink.TYPES.dataSourceCallback then
		f68_local1 = false
	else
		f68_local1 = true
	end
	f68_local0( f68_local1 )
	f68_arg0._source = f68_arg1.source
	f68_arg0._target = f68_arg1.target
	f68_arg0._relativeDataSourcePath = {}
	f68_arg0._callback = f68_arg1.callback
	f68_arg0._type = f68_arg1.type
	if f68_arg1.relativeDataSourcePath then
		f68_arg0._relativeDataSourcePath = LUI.Split( f68_arg1.relativeDataSourcePath, "." )
	end
	f68_arg0._source._dataLinksAsSource = f68_arg0._source._dataLinksAsSource or {}
	f68_arg0._target._dataLinksAsTarget = f68_arg0._target._dataLinksAsTarget or {}
end

DataLink.Refresh = function ( f69_arg0 )
	if f69_arg0._subscription then
		f69_arg0._target:UnsubscribeFromModel( f69_arg0._subscription )
		f69_arg0._subscription = nil
	end
	local f69_local0, f69_local1 = f69_arg0._source:GetDataSource()
	if f69_local0 then
		assert( type( f69_local1 ) == "number" )
		local f69_local2 = f69_local0
		if #f69_arg0._relativeDataSourcePath > 0 then
			for f69_local6, f69_local7 in ipairs( f69_arg0._relativeDataSourcePath ) do
				assert( f69_local2[f69_local7] )
				f69_local2 = f69_local2[f69_local7]
			end
		end
		if f69_arg0._type == DataLink.TYPES.model then
			local f69_local3 = f69_local2:GetModel( f69_local1 )
			if f69_local3 then
				f69_arg0._subscription = f69_arg0._target:SubscribeToModel( f69_local3, f69_arg0._callback )
			end
		elseif f69_arg0._type == DataLink.TYPES.selfDataSource then
			f69_arg0._target:SetDataSource( f69_local2, f69_local1 )
		elseif f69_arg0._type == DataLink.TYPES.gridDataSource then
			f69_arg0._target:SetGridDataSource( f69_local2 )
		elseif f69_arg0._type == DataLink.TYPES.tabManagerDataSource then
			f69_arg0._target:SetTabManagerDataSource( f69_local2 )
		elseif f69_arg0._type == DataLink.TYPES.dataSourceCallback then
			f69_arg0._callback( f69_local2 )
			if f69_arg0.unlinkOnCallback then
				f69_arg0:Unlink()
			end
		else
			assert( false )
		end
	end
end

DataLink.Link = function ( f70_arg0 )
	for f70_local3, f70_local4 in pairs( f70_arg0._target._dataLinksAsTarget ) do
		if f70_local3._type == f70_arg0._type and f70_arg0._type ~= DataLink.TYPES.model and f70_arg0._type ~= DataLink.TYPES.dataSourceCallback then
			f70_local3:Unlink()
		end
	end
	f70_arg0._source._dataLinksAsSource[f70_arg0] = true
	f70_arg0._target._dataLinksAsTarget[f70_arg0] = true
end

DataLink.Unlink = function ( f71_arg0 )
	if f71_arg0._subscription then
		f71_arg0._target:UnsubscribeFromModel( f71_arg0._subscription )
		f71_arg0._subscription = nil
	end
	f71_arg0._source._dataLinksAsSource[f71_arg0] = nil
	f71_arg0._target._dataLinksAsTarget[f71_arg0] = nil
end

LUI.UIElement.GetDataSource = function ( f72_arg0 )
	return f72_arg0._dataSource, f72_arg0._dataSourceControllerIndex
end

LUI.UIElement.SetDataSource = function ( f73_arg0, f73_arg1, f73_arg2 )
	local f73_local0 = assert
	local f73_local1
	if type( f73_arg2 ) ~= "number" and f73_arg1 ~= nil then
		f73_local1 = false
	else
		f73_local1 = true
	end
	f73_local0( f73_local1 )
	f73_arg0._dataSource = f73_arg1
	f73_arg0._dataSourceControllerIndex = f73_arg2
	if f73_arg0._dataLinksAsSource then
		for f73_local4, f73_local5 in pairs( LUI.ShallowCopy( f73_arg0._dataLinksAsSource ) ) do
			f73_local4:Refresh()
		end
	end
end

LUI.UIElement.SubscribeToModel = function ( f74_arg0, f74_arg1, f74_arg2, f74_arg3 )
	local f74_local0 = f74_arg0._subscriptions
	if not f74_local0 then
		f74_local0 = LUI.SubscriptionsHolder.new()
	end
	f74_arg0._subscriptions = f74_local0
	return f74_arg0._subscriptions:SubscribeToModel( f74_arg1, f74_arg2, f74_arg3 )
end

LUI.UIElement.UnsubscribeFromModel = function ( f75_arg0, f75_arg1 )
	if f75_arg0._subscriptions then
		return f75_arg0._subscriptions:UnsubscribeFromModel( f75_arg1 )
	else
		
	end
end

LUI.UIElement.RemoveDataLinks = function ( f76_arg0 )
	if f76_arg0._dataLinksAsTarget then
		for f76_local3, f76_local4 in pairs( f76_arg0._dataLinksAsTarget ) do
			f76_local3._source._dataLinksAsSource[f76_local3] = nil
			f76_local3._target._dataLinksAsTarget[f76_local3] = nil
		end
	end
	if f76_arg0._dataLinksAsSource then
		for f76_local3, f76_local4 in pairs( f76_arg0._dataLinksAsSource ) do
			f76_local3._source._dataLinksAsSource[f76_local3] = nil
			f76_local3._target._dataLinksAsTarget[f76_local3] = nil
		end
	end
end

LUI.UIElement.UnsubscribeFromAllModels = function ( f77_arg0 )
	if f77_arg0._subscriptions then
		f77_arg0._subscriptions:UnsubscribeFromAllModels()
	end
	if f77_arg0._dataLinksAsSource then
		for f77_local3, f77_local4 in pairs( f77_arg0._dataLinksAsSource ) do
			if f77_local3._subscription then
				f77_local3._target:UnsubscribeFromModel( f77_local3._subscription )
			end
		end
	end
end

LUI.UIElement.SubscribeToDataSourceThroughElement = function ( f78_arg0, f78_arg1, f78_arg2, f78_arg3 )
	local f78_local0 = DataLink.new( {
		target = f78_arg0,
		source = f78_arg1,
		relativeDataSourcePath = f78_arg2,
		callback = f78_arg3,
		type = DataLink.TYPES.dataSourceCallback
	} )
	f78_local0:Link()
	f78_local0:Refresh()
	return f78_local0
end

LUI.UIElement.SubscribeToModelThroughElement = function ( f79_arg0, f79_arg1, f79_arg2, f79_arg3 )
	local f79_local0 = DataLink.new( {
		target = f79_arg0,
		source = f79_arg1,
		relativeDataSourcePath = f79_arg2,
		callback = f79_arg3,
		type = DataLink.TYPES.model
	} )
	f79_local0:Link()
	f79_local0:Refresh()
	return f79_local0
end

LUI.UIElement.SetDataSourceThroughElement = function ( f80_arg0, f80_arg1, f80_arg2 )
	local f80_local0 = DataLink.new( {
		target = f80_arg0,
		source = f80_arg1,
		relativeDataSourcePath = f80_arg2,
		type = DataLink.TYPES.selfDataSource
	} )
	f80_local0:Link()
	f80_local0:Refresh()
	return f80_local0
end

LUI.UIElement.UnsubscribeFromModelThroughElement = function ( f81_arg0, f81_arg1 )
	local f81_local0 = f81_arg1
	assert( f81_local0._target == f81_arg0 )
	f81_local0:Unlink()
end

LUI.UIElement.BindAlphaToModel = function ( f82_arg0, f82_arg1 )
	local f82_local0 = f82_arg0._subscriptions
	if not f82_local0 then
		f82_local0 = LUI.SubscriptionsHolder.new()
	end
	f82_arg0._subscriptions = f82_local0
	return f82_arg0._subscriptions:BindElementAlphaToModel( f82_arg0, f82_arg1 )
end

LUI.UIElement.BindColorToModel = function ( f83_arg0, f83_arg1 )
	local f83_local0 = f83_arg0._subscriptions
	if not f83_local0 then
		f83_local0 = LUI.SubscriptionsHolder.new()
	end
	f83_arg0._subscriptions = f83_local0
	return f83_arg0._subscriptions:BindElementColorToModel( f83_arg0, f83_arg1 )
end

LUI.UIElement.BindScaleToModel = function ( f84_arg0, f84_arg1 )
	local f84_local0 = f84_arg0._subscriptions
	if not f84_local0 then
		f84_local0 = LUI.SubscriptionsHolder.new()
	end
	f84_arg0._subscriptions = f84_local0
	return f84_arg0._subscriptions:BindElementScaleToModel( f84_arg0, f84_arg1 )
end

LUI.UIElement.BindZRotationToModel = function ( f85_arg0, f85_arg1 )
	local f85_local0 = f85_arg0._subscriptions
	if not f85_local0 then
		f85_local0 = LUI.SubscriptionsHolder.new()
	end
	f85_arg0._subscriptions = f85_local0
	return f85_arg0._subscriptions:BindElementZRotationToModel( f85_arg0, f85_arg1 )
end

LUI.UIElement.BindLeftToModel = function ( f86_arg0, f86_arg1 )
	local f86_local0 = f86_arg0._subscriptions
	if not f86_local0 then
		f86_local0 = LUI.SubscriptionsHolder.new()
	end
	f86_arg0._subscriptions = f86_local0
	return f86_arg0._subscriptions:BindElementLeftToModel( f86_arg0, f86_arg1 )
end

LUI.UIElement.BindRightToModel = function ( f87_arg0, f87_arg1 )
	local f87_local0 = f87_arg0._subscriptions
	if not f87_local0 then
		f87_local0 = LUI.SubscriptionsHolder.new()
	end
	f87_arg0._subscriptions = f87_local0
	return f87_arg0._subscriptions:BindElementRightToModel( f87_arg0, f87_arg1 )
end

LUI.UIElement.BindTopToModel = function ( f88_arg0, f88_arg1 )
	local f88_local0 = f88_arg0._subscriptions
	if not f88_local0 then
		f88_local0 = LUI.SubscriptionsHolder.new()
	end
	f88_arg0._subscriptions = f88_local0
	return f88_arg0._subscriptions:BindElementTopToModel( f88_arg0, f88_arg1 )
end

LUI.UIElement.BindBottomToModel = function ( f89_arg0, f89_arg1 )
	local f89_local0 = f89_arg0._subscriptions
	if not f89_local0 then
		f89_local0 = LUI.SubscriptionsHolder.new()
	end
	f89_arg0._subscriptions = f89_local0
	return f89_arg0._subscriptions:BindElementBottomToModel( f89_arg0, f89_arg1 )
end

LUI.UIElement.build = function ( f90_arg0, f90_arg1 )
	return LUI.UIElement.new()
end

LUI.UIElement.allocate = function ()
	return ConstructLUIElement()
end

LUI.UIElement.init = function ( f92_arg0, f92_arg1 )
	f92_arg0._scoped = LUI.ActiveScoped
	f92_arg0:setLayoutCached( false )
	f92_arg0.m_eventHandlers = {}
	f92_arg0.m_references = {}
	if f92_arg1 then
		f92_arg0:registerAnimationState( "default", f92_arg1 )
		f92_arg0:animateToState( "default" )
	end
	if not Engine.IsConsoleGame() then
		f92_arg0:registerEventHandler( "mousemove", LUI.UIElement.MouseMoveEvent )
		f92_arg0:registerEventHandler( "mousedown", LUI.UIElement.MouseButtonEvent )
		f92_arg0:registerEventHandler( "mouseup", LUI.UIElement.MouseButtonEvent )
		f92_arg0:registerEventHandler( "popup_active", LUI.UIElement.PopupActive )
	end
	f92_arg0:registerEventHandler( "restore_focus", LUI.UIElement.restoreFocus )
end

