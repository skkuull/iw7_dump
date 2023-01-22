LUI.Pips = LUI.Class( LUI.List )
LUI.Pips.init = function ( f1_arg0, f1_arg1 )
	assert( f1_arg1 )
	local f1_local0 = assert
	local f1_local1
	if f1_arg1.direction ~= nil and type( f1_arg1.direction ) ~= "number" then
		f1_local1 = false
	else
		f1_local1 = true
	end
	f1_local0( f1_local1 )
	f1_local0 = assert
	if f1_arg1.alignment ~= nil and type( f1_arg1.alignment ) ~= "number" then
		f1_local1 = false
	else
		f1_local1 = true
	end
	f1_local0( f1_local1 )
	assert( f1_arg1.controllerIndex )
	assert( type( f1_arg1.buildPip ) == "function" )
	f1_arg0._buildPip = f1_arg1.buildPip
	f1_local0 = f1_arg1.direction
	if not f1_local0 then
		f1_local0 = LUI.DIRECTION.horizontal
	end
	f1_arg0._direction = f1_local0
	f1_arg0._nextPipID = 0
	f1_arg0._controllerIndex = f1_arg1.controllerIndex
	f1_arg0._pipPool = {}
	f1_local0 = f1_arg1.alignment
	if not f1_local0 then
		if f1_arg0._direction == LUI.DIRECTION.vertical then
			f1_local0 = LUI.Alignment.Middle
		else
			f1_local0 = LUI.Alignment.Center
		end
	end
	LUI.Pips.super.init( f1_arg0, {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0,
		alignment = f1_local0,
		spacing = f1_arg1.spacing or 0
	}, {
		direction = f1_arg0._direction
	} )
	f1_arg0.id = "Pips"
end

LUI.Pips.SetupPipEventHandlers = function ( f2_arg0, f2_arg1, f2_arg2 )
	f2_arg1:addEventHandler( "scrollbar_pip_is_default", function ( f3_arg0, f3_arg1 )
		f3_arg0.focused = true
	end )
	f2_arg1:addEventHandler( "scrollbar_pip_highlighted", function ( f4_arg0, f4_arg1 )
		if f4_arg0:GetCurrentMenu() then
			f2_arg2:processEvent( {
				name = "scrollbar_pip_focused",
				index = f4_arg0.index
			} )
		end
		f4_arg0.focused = true
	end )
	f2_arg1:addEventHandler( "scrollbar_pip_focused", function ( f5_arg0, f5_arg1 )
		if f5_arg1.index == f5_arg0.index then
			f5_arg0.focused = true
		elseif f5_arg0.focused then
			f5_arg0.focused = false
		end
	end )
	if not Engine.IsConsoleGame() then
		f2_arg1:SetHandleMouse( true )
		f2_arg1:registerEventHandler( "mouseenter", function ( element, event )
			if not element.focused then
				element:processEvent( {
					name = "scrollbar_pip_mouse_over"
				} )
			end
		end )
		f2_arg1:registerEventHandler( "mouseleave", function ( element, event )
			if element.focused then
				f2_arg2:processEvent( {
					name = "scrollbar_pip_focused",
					index = element.index
				} )
			else
				element:processEvent( {
					name = "scrollbar_pip_not_highlighted"
				} )
				element.focused = false
			end
		end )
		f2_arg1:registerEventHandler( "leftmousedown", function ( element, event )
			element:dispatchEventToCurrentMenu( {
				name = "pip_mouse_select",
				index = element.index,
				pip = f2_arg1
			} )
			element.focused = true
		end )
	end
end

LUI.Pips.Resize = function ( f9_arg0, f9_arg1 )
	local f9_local0 = f9_arg0:getNumChildren()
	while f9_arg1 < f9_arg0:getNumChildren() do
		local f9_local1 = f9_arg0:getLastChild()
		if f9_local1.link then
			f9_local1.link:Unlink()
			f9_local1.link = nil
		end
		table.insert( f9_arg0._pipPool, f9_local1 )
		f9_arg0:removeElement( f9_local1 )
		f9_local1:processEvent( {
			name = "removed_from_pips"
		} )
	end
	while f9_arg0:getNumChildren() < f9_arg1 do
		local f9_local1 = nil
		if #f9_arg0._pipPool > 0 then
			f9_local1 = f9_arg0._pipPool[1]
			table.remove( f9_arg0._pipPool, 1 )
		else
			f9_local1 = f9_arg0._buildPip()
			f9_local1.id = "pip_" .. f9_arg0._nextPipID
			f9_local1.index = f9_arg0._nextPipID
			f9_arg0._nextPipID = f9_arg0._nextPipID + 1
			f9_arg0:SetupPipEventHandlers( f9_local1, f9_arg0 )
		end
		assert( not f9_local1.link )
		assert( type( f9_local1 ) == "userdata" )
		local f9_local2 = f9_arg0:getNumChildren()
		if f9_arg0:GetDataSource() then
			local f9_local3 = f9_local1
			local f9_local4 = f9_local1.SetDataSource
			local f9_local5 = f9_arg0:GetDataSource()
			f9_local1.link = f9_local4( f9_local3, f9_local5:GetDataSourceAtIndex( f9_local2, f9_arg0._controllerIndex ), f9_arg0._controllerIndex )
		end
		f9_arg0:addElement( f9_local1 )
		f9_local1:processEvent( {
			name = "added_to_pips"
		} )
	end
	if f9_local0 ~= f9_arg0:getNumChildren() and f9_arg0:GetCurrentMenu() then
		f9_arg0:dispatchEventToCurrentMenu( {
			name = "resized_pips"
		} )
	end
end

LUI.Pips.AutoResize = function ( f10_arg0 )
	assert( f10_arg0._source )
	f10_arg0:Resize( f10_arg0._source:GetContentSize( f10_arg0._direction ) )
end

LUI.Pips.UpdateChildren = function ( f11_arg0, f11_arg1, f11_arg2 )
	local f11_local0 = f11_arg0:getFirstChild()
	local f11_local1 = 0
	while f11_local0 do
		if f11_local1 == f11_arg2 then
			f11_local0:processEvent( {
				name = "scrollbar_pip_is_default",
				index = f11_arg2
			} )
		else
			f11_local0:processEvent( {
				name = "scrollbar_pip_is_not_default"
			} )
		end
		if f11_local1 == f11_arg1 then
			f11_local0:processEvent( {
				name = "scrollbar_pip_highlighted",
				index = f11_arg1
			} )
		else
			f11_local0:processEvent( {
				name = "scrollbar_pip_not_highlighted"
			} )
		end
		f11_local0 = f11_local0:getNextSibling()
		f11_local1 = f11_local1 + 1
	end
end

LUI.Pips.UpdateScrolling = function ( f12_arg0 )
	assert( f12_arg0._source )
	f12_arg0:AutoResize()
	local f12_local0 = f12_arg0._source:GetContentSize( f12_arg0._direction )
	if f12_local0 <= 0 then
		return 
	end
	local f12_local1 = f12_arg0._source:GetFocusPosition( f12_arg0._direction )
	if f12_local1 then
		assert( f12_local1 >= 0 )
		assert( f12_local1 < f12_local0 )
	end
	local f12_local2 = f12_arg0._source:GetDefaultPosition( f12_arg0._direction )
	if f12_local2 then
		assert( f12_local2 >= 0 )
		assert( f12_local2 < f12_local0 )
	end
	f12_arg0:UpdateChildren( f12_local1, f12_local2 )
end

LUI.Pips.LinkTo = function ( f13_arg0, f13_arg1 )
	f13_arg0._source = f13_arg1
	if f13_arg1.GetGridDataSource then
		f13_arg0:SetLinkedGridDataSource( f13_arg1:GetGridDataSource() )
	end
	f13_arg0:UpdateScrolling()
end

LUI.Pips.GetDirection = function ( f14_arg0 )
	return f14_arg0._direction
end

LUI.Pips.SetLinkedGridDataSource = function ( f15_arg0, f15_arg1 )
	f15_arg0:Resize( 0 )
	f15_arg0:SetDataSource( f15_arg1, f15_arg0._controllerIndex )
	f15_arg0:AutoResize()
end

