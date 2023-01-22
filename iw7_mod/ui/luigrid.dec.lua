LUI.UIGrid = LUI.Class( LUI.UIElement )
LUI.UIDataSourceGrid = LUI.Class( LUI.UIGrid )
LUI.UIGrid.ARROW_FOR = {
	previous = 0,
	next = 1
}
LUI.UIGrid.init = function ( f1_arg0, f1_arg1, f1_arg2 )
	Engine.MeasureResourceEventStart( "UIGrid", "widget" )
	assert( f1_arg2 )
	assert( type( f1_arg2.buildChild ) == "function" )
	assert( type( f1_arg2.maxVisibleRows ) == "number" )
	assert( type( f1_arg2.maxVisibleColumns ) == "number" )
	local f1_local0 = assert
	local f1_local1
	if f1_arg2.refreshChild ~= nil and type( f1_arg2.refreshChild ) ~= "function" then
		f1_local1 = false
	else
		f1_local1 = true
	end
	f1_local0( f1_local1 )
	f1_local0 = assert
	if f1_arg2.measureRow ~= nil and type( f1_arg2.measureRow ) ~= "function" then
		f1_local1 = false
	else
		f1_local1 = true
	end
	f1_local0( f1_local1 )
	f1_local0 = assert
	if f1_arg2.rowHeight ~= nil and type( f1_arg2.rowHeight ) ~= "number" then
		f1_local1 = false
	else
		f1_local1 = true
	end
	f1_local0( f1_local1 )
	assert( f1_arg2.rowHeight or f1_arg2.measureRow )
	f1_local0 = assert
	if f1_arg2.measureColumn ~= nil and type( f1_arg2.measureColumn ) ~= "function" then
		f1_local1 = false
	else
		f1_local1 = true
	end
	f1_local0( f1_local1 )
	f1_local0 = assert
	if f1_arg2.columnWidth ~= nil and type( f1_arg2.columnWidth ) ~= "number" then
		f1_local1 = false
	else
		f1_local1 = true
	end
	f1_local0( f1_local1 )
	assert( f1_arg2.columnWidth or f1_arg2.measureColumn )
	f1_local0 = assert
	if f1_arg2.isPositionFocusable ~= nil and type( f1_arg2.isPositionFocusable ) ~= "function" then
		f1_local1 = false
	else
		f1_local1 = true
	end
	f1_local0( f1_local1 )
	f1_local0 = assert
	if f1_arg2.wrapX ~= nil and type( f1_arg2.wrapX ) ~= "boolean" then
		f1_local1 = false
	else
		f1_local1 = true
	end
	f1_local0( f1_local1 )
	f1_local0 = assert
	if f1_arg2.wrapY ~= nil and type( f1_arg2.wrapY ) ~= "boolean" then
		f1_local1 = false
	else
		f1_local1 = true
	end
	f1_local0( f1_local1 )
	f1_local0 = assert
	if f1_arg2.spacingX ~= nil and type( f1_arg2.spacingX ) ~= "number" then
		f1_local1 = false
	else
		f1_local1 = true
	end
	f1_local0( f1_local1 )
	f1_local0 = assert
	if f1_arg2.spacingY ~= nil and type( f1_arg2.spacingY ) ~= "number" then
		f1_local1 = false
	else
		f1_local1 = true
	end
	f1_local0( f1_local1 )
	f1_local0 = assert
	if f1_arg2.horizontalAlignment ~= nil and type( f1_arg2.horizontalAlignment ) ~= "number" then
		f1_local1 = false
	else
		f1_local1 = true
	end
	f1_local0( f1_local1 )
	f1_local0 = assert
	if f1_arg2.verticalAlignment ~= nil and type( f1_arg2.verticalAlignment ) ~= "number" then
		f1_local1 = false
	else
		f1_local1 = true
	end
	f1_local0( f1_local1 )
	f1_local0 = assert
	if f1_arg2.defaultFocus ~= nil and type( f1_arg2.defaultFocus ) ~= "table" then
		f1_local1 = false
	else
		f1_local1 = true
	end
	f1_local0( f1_local1 )
	f1_local0 = assert
	if f1_arg2.numRows ~= nil and type( f1_arg2.numRows ) ~= "number" then
		f1_local1 = false
	else
		f1_local1 = true
	end
	f1_local0( f1_local1 )
	f1_local0 = assert
	if f1_arg2.numColumns ~= nil and type( f1_arg2.numColumns ) ~= "number" then
		f1_local1 = false
	else
		f1_local1 = true
	end
	f1_local0( f1_local1 )
	f1_local0 = assert
	if f1_arg2.numChildren ~= nil and type( f1_arg2.numChildren ) ~= "number" then
		f1_local1 = false
	else
		f1_local1 = true
	end
	f1_local0( f1_local1 )
	f1_local0 = assert
	if f1_arg2.scrollingThresholdX ~= nil and type( f1_arg2.scrollingThresholdX ) ~= "number" then
		f1_local1 = false
	else
		f1_local1 = true
	end
	f1_local0( f1_local1 )
	f1_local0 = assert
	if f1_arg2.scrollingThresholdY ~= nil and type( f1_arg2.scrollingThresholdY ) ~= "number" then
		f1_local1 = false
	else
		f1_local1 = true
	end
	f1_local0( f1_local1 )
	f1_local0 = assert
	if f1_arg2.maxVelocity ~= nil and type( f1_arg2.maxVelocity ) ~= "number" then
		f1_local1 = false
	else
		f1_local1 = true
	end
	f1_local0( f1_local1 )
	f1_local0 = assert
	if f1_arg2.springCoefficient ~= nil and type( f1_arg2.springCoefficient ) ~= "number" then
		f1_local1 = false
	else
		f1_local1 = true
	end
	f1_local0( f1_local1 )
	f1_local0 = assert
	if f1_arg2.primaryAxis ~= nil and type( f1_arg2.primaryAxis ) ~= "number" then
		f1_local1 = false
	else
		f1_local1 = true
	end
	f1_local0( f1_local1 )
	f1_local0 = assert
	if f1_arg2.adjustSizeToContent ~= nil and type( f1_arg2.adjustSizeToContent ) ~= "boolean" then
		f1_local1 = false
	else
		f1_local1 = true
	end
	f1_local0( f1_local1 )
	f1_local0 = assert
	if f1_arg2.alwaysSnap ~= nil and type( f1_arg2.alwaysSnap ) ~= "boolean" then
		f1_local1 = false
	else
		f1_local1 = true
	end
	f1_local0( f1_local1 )
	f1_local0 = assert
	if f1_arg2.disableMouseWheel ~= nil and type( f1_arg2.disableMouseWheel ) ~= "boolean" then
		f1_local1 = false
	else
		f1_local1 = true
	end
	f1_local0( f1_local1 )
	f1_local0 = assert
	if f1_arg2.arrowsEnabled ~= nil and type( f1_arg2.arrowsEnabled ) ~= "boolean" then
		f1_local1 = false
	else
		f1_local1 = true
	end
	f1_local0( f1_local1 )
	f1_local0 = assert
	if f1_arg2.directionalInputEnabled ~= nil and type( f1_arg2.directionalInputEnabled ) ~= "boolean" then
		f1_local1 = false
	else
		f1_local1 = true
	end
	f1_local0( f1_local1 )
	f1_arg2.adjustSizeToContent = f1_arg2.adjustSizeToContent == true
	f1_arg2.spacingX = f1_arg2.spacingX or 0
	f1_arg2.spacingY = f1_arg2.spacingY or 0
	f1_arg2.maxVelocity = f1_arg2.maxVelocity or 5000
	f1_arg2.springCoefficient = f1_arg2.springCoefficient or 400
	f1_local0 = f1_arg2.primaryAxis
	if not f1_local0 then
		f1_local0 = LUI.DIRECTION.horizontal
	end
	f1_arg2.primaryAxis = f1_local0
	f1_local0 = assert
	if f1_arg2.primaryAxis ~= LUI.DIRECTION.horizontal and f1_arg2.primaryAxis ~= LUI.DIRECTION.vertical then
		f1_local1 = false
	else
		f1_local1 = true
	end
	f1_local0( f1_local1 )
	LUI.UIGrid.super.init( f1_arg0, f1_arg1 )
	f1_arg0.id = "UIGrid"
	f1_arg0._controllerIndex = f1_arg2.controllerIndex
	f1_arg0._isPositionFocusable = f1_arg2.isPositionFocusable
	f1_arg0._wrapX = f1_arg2.wrapX or false
	f1_arg0._wrapY = f1_arg2.wrapY or false
	f1_arg0._defaultFocus = f1_arg2.defaultFocus or nil
	f1_arg0._scrollingThresholdX = f1_arg2.scrollingThresholdX or 1
	f1_arg0._scrollingThresholdY = f1_arg2.scrollingThresholdY or 1
	f1_arg0._permittedQualifiers = f1_arg2.permittedQualifiers or {}
	f1_arg0._horizontalAlignment = f1_arg2.horizontalAlignment
	f1_arg0._verticalAlignment = f1_arg2.verticalAlignment
	f1_arg0._alwaysSnap = f1_arg2.alwaysSnap == true
	f1_arg0._disableMouseWheel = f1_arg2.disableMouseWheel
	f1_arg0._arrowsEnabled = f1_arg2.arrowsEnabled ~= false
	f1_arg0._directionalInputEnabled = f1_arg2.directionalInputEnabled ~= false
	f1_arg0._arrows = {}
	f1_arg0._itemNumbers = {}
	f1_arg0._scrollbars = {}
	f1_arg0:registerEventHandler( "position_visible", function ( element, event )
		assert( event.row and event.column )
		assert( event.child )
		if element._targetPosition and event.child ~= event._childInFocus and element._shouldFocus and event.row == element._targetPosition.y and event.column == element._targetPosition.x then
			element:GiveFocusToChild( event.child )
		end
	end )
	f1_arg0:registerEventHandler( "restore_focus", LUI.UIGrid.restoreFocus )
	f1_arg0:registerEventHandler( "gain_focus", function ( element, event )
		return element:GainFocus( event )
	end )
	f1_arg0:registerEventHandler( "lose_focus", function ( element, event )
		return element:LoseFocus( event )
	end )
	f1_arg0:registerEventHandler( "gamepad_button", function ( element, event )
		return element:GamepadButton( event )
	end )
	if Engine.IsPC() then
		f1_arg0:addEventHandler( "update_current_grid_focus", function ( f6_arg0, f6_arg1 )
			local f6_local0, f6_local1 = f6_arg0:GetChildPosition( f6_arg1.child )
			local f6_local2 = f6_arg1.focusType == FocusType.MouseOver
			local f6_local3 = f6_arg0._targetPosition
			if f6_local3 then
				if f6_arg0._targetPosition.x ~= f6_local0 or f6_arg0._targetPosition.y ~= f6_local1 then
					f6_local3 = false
				else
					f6_local3 = true
				end
			end
			if not f6_local3 and f6_local0 ~= nil and f6_local1 ~= nil then
				f6_arg0:SetPosition( {
					x = f6_local0,
					y = f6_local1
				}, not f6_local2, not f6_local2 )
				f6_arg0._childInFocus = f6_arg1.child
				f6_arg0._shouldFocus = true
				f6_arg0:FocusChanged( f6_arg1.focusType )
			end
		end )
	end
	f1_arg0:SetupUIGrid( f1_arg2 )
	Engine.MeasureResourceEventEnd( "UIGrid", "widget" )
end

LUI.UIGrid.SetNumChildren = function ( f7_arg0, f7_arg1 )
	f7_arg0:SetNumChildrenInC( f7_arg1 )
	if f7_arg0._targetPosition then
		if f7_arg0._shouldFocus then
			f7_arg0:SetFocusedPosition( f7_arg0._targetPosition, true )
		else
			f7_arg0:SetPosition( f7_arg0._targetPosition, true )
		end
	end
end

LUI.UIGrid.SetNumColumns = function ( f8_arg0, f8_arg1 )
	f8_arg0:SetNumColumnsInC( f8_arg1 )
	if f8_arg0._targetPosition then
		if f8_arg0._shouldFocus then
			f8_arg0:SetFocusedPosition( f8_arg0._targetPosition, true )
		else
			f8_arg0:SetPosition( f8_arg0._targetPosition, true )
		end
	end
end

LUI.UIGrid.SetNumRows = function ( f9_arg0, f9_arg1 )
	f9_arg0:SetNumRowsInC( f9_arg1 )
	if f9_arg0._targetPosition then
		if f9_arg0._shouldFocus then
			f9_arg0:SetFocusedPosition( f9_arg0._targetPosition, true )
		else
			f9_arg0:SetPosition( f9_arg0._targetPosition, true )
		end
	end
end

LUI.UIGrid.AddScrollbar = function ( f10_arg0, f10_arg1 )
	f10_arg1:LinkTo( f10_arg0 )
	table.insert( f10_arg0._scrollbars, f10_arg1 )
end

LUI.UIGrid.SetArrowsEnabled = function ( f11_arg0, f11_arg1 )
	f11_arg0._arrowsEnabled = f11_arg1
end

LUI.UIGrid.AddArrow = function ( f12_arg0, f12_arg1, f12_arg2 )
	assert( type( f12_arg1 ) == "userdata" )
	f12_arg0._arrows[f12_arg2 or f12_arg1.id] = f12_arg1
	if not Engine.IsConsoleGame() and (f12_arg1.id == "ArrowUp" or f12_arg1.id == "ArrowDown" or f12_arg1.id == "ArrowRight" or f12_arg1.id == "ArrowLeft") then
		f12_arg1:registerEventHandler( "button_action", function ( element, event )
			if f12_arg0._arrowsEnabled then
				local f13_local0 = "up"
				if f12_arg1.id == "ArrowDown" then
					f13_local0 = "down"
				elseif f12_arg1.id == "ArrowRight" then
					f13_local0 = "right"
				elseif f12_arg1.id == "ArrowLeft" then
					f13_local0 = "left"
				end
				f12_arg0:Scroll( f13_local0 )
			end
		end )
	end
end

LUI.UIGrid.AddItemNumbers = function ( f14_arg0, f14_arg1, f14_arg2 )
	assert( type( f14_arg1 ) == "userdata" )
	assert( f14_arg1.setText )
	local f14_local0 = f14_arg2 or f14_arg1.id
	assert( f14_local0 and #f14_local0 > 0 )
	f14_arg0._itemNumbers[f14_local0] = f14_arg1
end

LUI.UIGrid.SetLastFocusIndexDataSource = function ( f15_arg0, f15_arg1 )
	assert( type( f15_arg1 ) == "table" )
	f15_arg0._lastFocusIndexDataSource = f15_arg1
	f15_arg0:SetLastFocusIndex( f15_arg0._targetPosition )
end

LUI.UIGrid.SetLastFocusIndex = function ( f16_arg0, f16_arg1 )
	if f16_arg0._lastFocusIndexDataSource then
		f16_arg0._lastFocusIndexDataSource:SetValue( f16_arg0._controllerIndex, f16_arg1 )
	end
end

LUI.UIGrid.FocusFirstItem = function ( f17_arg0 )
	f17_arg0:SetFocusedPosition( {
		x = 0,
		y = 0
	}, true )
end

LUI.UIGrid.GetFocusPositionIndex = function ( f18_arg0 )
	if not f18_arg0._targetPosition then
		return nil
	end
	local f18_local0 = nil
	local f18_local1 = f18_arg0:GetFocusPosition( LUI.DIRECTION.horizontal )
	local f18_local2 = f18_arg0:GetFocusPosition( LUI.DIRECTION.vertical )
	if f18_arg0:GetPrimaryAxis() == LUI.DIRECTION.horizontal then
		f18_local0 = f18_local1 + f18_local2 * f18_arg0:GetMaxVisibleColumns()
	else
		f18_local0 = f18_local2 + f18_local1 * f18_arg0:GetMaxVisibleRows()
	end
	local f18_local3 = f18_arg0:GetNumChildren()
	if f18_local3 then
		f18_local0 = f18_local0 % f18_local3
	end
	return f18_local0
end

LUI.UIGrid.SetSnapOnWrapEnabled = function ( f19_arg0, f19_arg1 )
	f19_arg0._snapOnWrap = f19_arg1
end

LUI.UIGrid.GetChildPosition = function ( f20_arg0, f20_arg1 )
	for f20_local3, f20_local4 in ipairs( f20_arg0:GetBuiltChildren() ) do
		if f20_arg1:isDescendentOf( f20_local4 ) then
			return f20_local4._gridContentColumnIndex, f20_local4._gridContentRowIndex
		end
	end
	return nil, nil
end

LUI.UIDataSourceGrid.init = function ( f21_arg0, f21_arg1, f21_arg2 )
	Engine.MeasureResourceEventStart( "UIDataSourceGrid", "widget" )
	assert( f21_arg2 )
	assert( f21_arg2.controllerIndex )
	f21_arg2.numChildren = nil
	f21_arg2.numRows = nil
	f21_arg2.numColumns = nil
	f21_arg2.refreshChild = function ( f22_arg0, f22_arg1, f22_arg2 )
		if f21_arg0._gridDataSource then
			f22_arg0:SetDataSource( f21_arg0._gridDataSource:GetDataSourceAtIndex( f21_arg0:GetContentIndex( f22_arg1, f22_arg2 ), f21_arg0._controllerIndex ), f21_arg0._controllerIndex )
		end
	end
	
	LUI.UIDataSourceGrid.super.init( f21_arg0, f21_arg1, f21_arg2 )
	if f21_arg2.dataSource then
		f21_arg0:SetGridDataSource( f21_arg2.dataSource )
	else
		f21_arg0:SetNumChildren( 0 )
	end
	Engine.MeasureResourceEventEnd( "UIDataSourceGrid", "widget" )
end

LUI.UIDataSourceGrid.SetGridDataSource = function ( f23_arg0, f23_arg1 )
	assert( type( f23_arg1 ) == "table" )
	assert( type( f23_arg1.GetDataSourceAtIndex ) == "function" )
	if f23_arg0._gridDataSource == f23_arg1 then
		return 
	end
	for f23_local3, f23_local4 in ipairs( f23_arg0:GetBuiltChildren() ) do
		f23_local4:SetDataSource( nil, f23_arg0._controllerIndex )
	end
	f23_arg0._pendingRefresh = true
	f23_arg0._gridDataSource = f23_arg1
	if f23_arg0._countSubscription then
		f23_arg0:UnsubscribeFromModel( f23_arg0._countSubscription )
	end
	f23_local0 = f23_arg0._gridDataSource:GetCountModel( f23_arg0._controllerIndex )
	if f23_local0 then
		f23_arg0._countSubscription = f23_arg0:SubscribeToModel( f23_local0, function ( f24_arg0 )
			local f24_local0 = DataModel.GetModelValue( f24_arg0 )
			if f24_local0 then
				f23_arg0:SetNumChildrenInC( f24_local0 )
				f23_arg0:SetTargetColumnToDefault()
				f23_arg0:SetTargetRowToDefault()
			end
		end )
	else
		f23_local1 = f23_arg0._gridDataSource:GetCountValue( f23_arg0._controllerIndex )
		assert( f23_local1 )
		f23_arg0:SetNumChildrenInC( f23_local1 )
		f23_arg0:SetTargetColumnToDefault()
		f23_arg0:SetTargetRowToDefault()
	end
	for f23_local4, f23_local5 in ipairs( f23_arg0._scrollbars ) do
		f23_local5:SetLinkedGridDataSource( f23_arg1 )
	end
	if f23_arg0._childInFocus then
		f23_arg0._childInFocus:processEvent( {
			name = "lose_focus"
		} )
		f23_arg0._childInFocus = nil
	end
	f23_arg0:clearSavedState()
	if f23_arg0._targetPosition and f23_arg0._shouldFocus then
		f23_arg0._targetPosition = nil
		f23_arg0:SetLastFocusIndex( nil )
		f23_arg0:GainFocus( {} )
	end
	if f23_arg0._pendingRefresh then
		f23_arg0._pendingRefresh = nil
		f23_arg0:RefreshContent()
	end
end

LUI.UIDataSourceGrid.SetGridDataSourceThroughElement = function ( f25_arg0, f25_arg1, f25_arg2 )
	local f25_local0 = DataLink.new( {
		target = f25_arg0,
		source = f25_arg1,
		relativeDataSourcePath = f25_arg2,
		type = DataLink.TYPES.gridDataSource
	} )
	f25_local0:Link()
	f25_local0:Refresh()
	return f25_local0
end

LUI.UIDataSourceGrid.GetGridDataSource = function ( f26_arg0 )
	return f26_arg0._gridDataSource
end

LUI.UIDataSourceGrid.GetDefaultFocus = function ( f27_arg0 )
	if not f27_arg0._gridDataSource then
		return nil
	else
		local f27_local0 = f27_arg0._gridDataSource:GetDefaultFocusIndex( f27_arg0._controllerIndex )
		if f27_local0 then
			return f27_arg0:GetPositionForIndex( f27_local0 )
		else
			return nil
		end
	end
end

LUI.UIGrid.addElement = function ( f28_arg0, f28_arg1 )
	assert( false, "Forbidden" )
end

LUI.UIGrid.removeElement = function ( f29_arg0, f29_arg1 )
	
end

LUI.UIGrid.closeTree = function ( f30_arg0 )
	for f30_local3, f30_local4 in ipairs( f30_arg0:GetBuiltChildren() ) do
		f30_local4:closeTree()
	end
	f30_arg0:close()
end

LUI.UIGrid.LoseFocus = function ( f31_arg0, f31_arg1 )
	if f31_arg0:ProcessEventToChildInFocus( f31_arg1 ) then
		f31_arg0._childInFocus = nil
	end
	f31_arg0._targetPosition = nil
	f31_arg0._shouldFocus = nil
end

LUI.UIGrid.ProcessEventToChildInFocus = function ( f32_arg0, f32_arg1 )
	if f32_arg0._childInFocus then
		return f32_arg0._childInFocus:processEvent( f32_arg1 )
	else
		return false
	end
end

LUI.UIGrid.GetVisibleChildInFocus = function ( f33_arg0 )
	assert( f33_arg0._childInFocus )
	return f33_arg0._childInFocus
end

LUI.UIGrid.GainFocus = function ( f34_arg0, f34_arg1 )
	local f34_local0 = f34_arg0:GetDefaultFocus()
	if f34_local0 then
		f34_arg0:SetFocusedPosition( f34_local0, true )
	else
		local f34_local1, f34_local2 = f34_arg0:restoreState()
		if f34_local2 == 0 then
			local f34_local3 = f34_arg0._targetPosition
			if not f34_local3 then
				f34_local3 = f34_arg0:GetFirstFocusablePosition()
			end
			if f34_local3 then
				f34_arg0:SetFocusedPosition( f34_local3, true )
			end
		end
	end
	return f34_arg0._targetPosition ~= nil
end

LUI.UIGrid.restoreFocus = function ( f35_arg0, f35_arg1 )
	if f35_arg0.id == f35_arg1.id and f35_arg0:GetNumColumns() ~= 0 and f35_arg0:GetNumRows() ~= 0 then
		assert( f35_arg1.data )
		f35_arg0:SetTargetRow( f35_arg1.data.targetRow, true, true )
		f35_arg0:SetTargetColumn( f35_arg1.data.targetColumn, true, true )
		f35_arg0:SetFocusedPosition( f35_arg1.data.targetPosition, true )
		return true
	else
		return f35_arg0:dispatchEventToChildren( f35_arg1 )
	end
end

LUI.UIGrid.getAllFocusedChildren = function ( f36_arg0, f36_arg1 )
	if not f36_arg1 then
		f36_arg1 = {}
	end
	if f36_arg0._targetPosition and f36_arg0._shouldFocus then
		f36_arg0.saveData = {
			targetPosition = f36_arg0._targetPosition,
			targetRow = f36_arg0:GetTargetRow(),
			targetColumn = f36_arg0:GetTargetColumn()
		}
		table.insert( f36_arg1, f36_arg0 )
	end
	return f36_arg1
end

LUI.UIGrid.IsPositionFocusable = function ( f37_arg0, f37_arg1 )
	if not f37_arg0:IsPositionInDataSet( f37_arg1.x, f37_arg1.y ) then
		return false
	elseif f37_arg0._isPositionFocusable then
		return f37_arg0._isPositionFocusable( f37_arg1.x, f37_arg1.y )
	else
		local f37_local0 = f37_arg0:GetBuiltChildren()
		f37_local0 = f37_local0[1]
		assert( f37_local0 )
		return f37_local0:TreeCanFocus( FocusType.ListSelection )
	end
end

LUI.UIGrid.GetFirstFocusablePosition = function ( f38_arg0 )
	local f38_local0 = {
		x = 0,
		y = 0
	}
	if f38_arg0:IsPositionFocusable( f38_local0 ) then
		return f38_local0
	elseif f38_arg0:GetPrimaryAxis() == LUI.DIRECTION.horizontal then
		f38_local0 = {
			x = 1,
			y = 0
		}
	else
		f38_local0 = {
			x = 0,
			y = 1
		}
	end
	if f38_arg0:IsPositionFocusable( f38_local0 ) then
		return f38_local0
	elseif f38_arg0:GetPrimaryAxis() == LUI.DIRECTION.horizontal then
		f38_local0 = {
			x = 0,
			y = 1
		}
	else
		f38_local0 = {
			x = 1,
			y = 0
		}
	end
	if f38_arg0:IsPositionFocusable( f38_local0 ) then
		return f38_local0
	end
	return nil
end

LUI.UIGrid.GetNextFocusablePosition = function ( f39_arg0, f39_arg1, f39_arg2 )
	assert( math.abs( f39_arg2 ) == 1 )
	local f39_local0 = f39_arg0:GetNumColumns()
	local f39_local1 = f39_arg0:GetNumRows()
	if f39_local1 == 0 or f39_local0 == 0 then
		return nil
	end
	local f39_local2, f39_local3, f39_local4 = nil
	if f39_arg1 == LUI.DIRECTION.horizontal then
		f39_local2 = "x"
		f39_local3 = f39_arg0._wrapX
		f39_local4 = f39_local0
	else
		f39_local2 = "y"
		f39_local3 = f39_arg0._wrapY
		f39_local4 = f39_local1
	end
	local f39_local5 = false
	local f39_local6 = LUI.ShallowCopy( f39_arg0._targetPosition )
	repeat
		f39_local6[f39_local2] = f39_local6[f39_local2] + f39_arg2
		if f39_local3 and f39_local4 then
			local f39_local7 = f39_local4 - 1
			if f39_local6[f39_local2] < 0 then
				f39_local6[f39_local2] = f39_local7
				f39_local5 = true
			elseif f39_local7 < f39_local6[f39_local2] then
				f39_local6[f39_local2] = 0
				f39_local5 = true
			end
		elseif not f39_arg0:IsPositionInDataSet( f39_local6.x, f39_local6.y ) then
			return nil
		end
	until f39_arg0:IsPositionInDataSet( f39_local6.x, f39_local6.y ) and f39_arg0:IsPositionFocusable( f39_local6 )
	return f39_local6, f39_local5
end

LUI.UIGrid.PositionChanged = function ()
	
end

LUI.UIGrid.SetFocusedPosition = function ( f41_arg0, f41_arg1, f41_arg2, f41_arg3 )
	f41_arg0:SetPositionInternal( f41_arg1, f41_arg2, true, f41_arg3 )
	f41_arg0:FocusChanged()
	f41_arg0:PositionChanged()
end

LUI.UIGrid.SetPosition = function ( f42_arg0, f42_arg1, f42_arg2, f42_arg3 )
	f42_arg0:SetPositionInternal( f42_arg1, f42_arg2, false, f42_arg3 )
	f42_arg0:PositionChanged()
end

LUI.UIGrid.SetPositionInternal = function ( f43_arg0, f43_arg1, f43_arg2, f43_arg3, f43_arg4 )
	f43_arg4 = f43_arg4 ~= false
	f43_arg1 = LUI.ShallowCopy( f43_arg1 )
	assert( f43_arg1.x and f43_arg1.y )
	local f43_local0 = f43_arg0:GetNumColumns()
	local f43_local1 = f43_arg0:GetNumRows()
	if f43_local0 == 0 or f43_local1 == 0 then
		if f43_arg0._childInFocus then
			f43_arg0._childInFocus:processEvent( {
				name = "lose_focus"
			} )
			f43_arg0._childInFocus = nil
		end
		f43_arg0._targetPosition = nil
		f43_arg0:SetLastFocusIndex( nil )
		f43_arg0:UpdateNumbersAndArrows()
		return 
	elseif f43_local0 then
		f43_arg1.x = LUI.clamp( f43_arg1.x, 0, f43_local0 - 1 )
	end
	if f43_local1 then
		f43_arg1.y = LUI.clamp( f43_arg1.y, 0, f43_local1 - 1 )
	end
	if f43_arg0._targetPosition and f43_arg0._targetPosition.x == f43_arg1.x and f43_arg0._targetPosition.y == f43_arg1.y then
		if not f43_arg3 then
			return 
		end
		local f43_local2 = f43_arg0:GetElementAtPosition( f43_arg0._targetPosition.x, f43_arg0._targetPosition.y )
		if f43_local2 and #f43_local2:getAllFocusedChildren() > 0 then
			return 
		end
	end
	f43_arg0._shouldFocus = f43_arg3
	local f43_local2 = f43_arg0._targetPosition == nil
	if f43_arg0._childInFocus then
		f43_arg0._childInFocus:processEvent( {
			name = "lose_focus"
		} )
		f43_arg0._childInFocus = nil
	end
	local f43_local3 = nil
	local f43_local4, f43_local5 = f43_arg0:GetRowBoundaries()
	local f43_local6 = LUI.clamp( f43_arg0._scrollingThresholdY, 0, f43_arg0:GetMaxVisibleRows() - 1 )
	local f43_local7 = f43_local4
	local f43_local8 = f43_local5
	local f43_local9 = f43_local2 or f43_arg1.y < f43_arg0._targetPosition.y
	local f43_local10 = f43_local2 or f43_arg0._targetPosition.y < f43_arg1.y
	if not f43_arg4 then
		f43_local6 = 0
	end
	if f43_local9 and f43_arg1.y < f43_local4 + f43_local6 then
		f43_local7 = f43_arg1.y - f43_local6
		f43_local8 = f43_local5 - f43_local4 - f43_local7
	elseif f43_local10 and f43_local5 - f43_local6 < f43_arg1.y then
		f43_local8 = f43_arg1.y + f43_local6
		f43_local7 = f43_local4 + f43_local8 - f43_local5
	end
	if f43_local7 ~= f43_local4 or f43_local8 ~= f43_local5 then
		if f43_arg0._verticalAlignment == LUI.Alignment.Middle then
			assert( f43_local9 or f43_local10 )
			if f43_local9 then
				f43_local3 = f43_arg1.y + math.floor( f43_arg0:GetMaxVisibleRows() / 2 ) - f43_local6
			elseif f43_local10 then
				f43_local3 = f43_arg1.y - math.floor( f43_arg0:GetMaxVisibleRows() / 2 ) + f43_local6
			end
		else
			if f43_arg0._verticalAlignment == LUI.Alignment.Bottom then
				local f43_local11 = f43_local8
			end
			f43_local3 = f43_local11 or f43_local7
		end
	end
	if f43_local3 then
		f43_arg0:SetTargetRow( f43_local3, true, f43_arg2 )
	end
	local f43_local12 = nil
	local f43_local13, f43_local14 = f43_arg0:GetColumnBoundaries()
	local f43_local15 = LUI.clamp( f43_arg0._scrollingThresholdX, 0, f43_arg0:GetMaxVisibleColumns() - 1 )
	local f43_local16 = f43_local13
	local f43_local17 = f43_local14
	local f43_local18 = f43_local2 or f43_arg1.x < f43_arg0._targetPosition.x
	local f43_local19 = f43_local2 or f43_arg0._targetPosition.x < f43_arg1.x
	if not f43_arg4 then
		f43_local15 = 0
	end
	if f43_local18 and f43_arg1.x < f43_local13 + f43_local15 then
		f43_local16 = f43_arg1.x - f43_local15
		f43_local17 = f43_local14 - f43_local13 - f43_local16
	elseif f43_local19 and f43_local14 - f43_local15 < f43_arg1.x then
		f43_local17 = f43_arg1.x + f43_local15
		f43_local16 = f43_local13 + f43_local17 - f43_local14
	end
	if f43_local16 ~= f43_local13 or f43_local17 ~= f43_local14 then
		if f43_arg0._horizontalAlignment == LUI.Alignment.Center then
			assert( f43_local18 or f43_local19 )
			if f43_local18 then
				f43_local12 = f43_arg1.x + math.floor( f43_arg0:GetMaxVisibleColumns() / 2 ) - f43_local15
			elseif f43_local19 then
				f43_local12 = f43_arg1.x - math.floor( f43_arg0:GetMaxVisibleColumns() / 2 ) + f43_local15
			end
		else
			if f43_arg0._horizontalAlignment == LUI.Alignment.Right then
				local f43_local20 = f43_local17
			end
			f43_local12 = f43_local20 or f43_local16
		end
	end
	if f43_local12 then
		f43_arg0:SetTargetColumn( f43_local12, true, f43_arg2 )
	end
	if f43_arg0._pendingRefresh then
		f43_arg0._pendingRefresh = nil
		f43_arg0:RefreshContent()
	end
	f43_arg0._targetPosition = f43_arg1
	f43_arg0:UpdateNumbersAndArrows()
	if f43_arg3 then
		local f43_local21 = f43_arg0:GetElementAtPosition( f43_arg1.x, f43_arg1.y )
		if f43_local21 then
			f43_arg0:GiveFocusToChild( f43_local21 )
		else
			f43_arg0:NotifyWhenPositionIsVisible( f43_arg1.x, f43_arg1.y )
		end
	end
	for f43_local24, f43_local25 in ipairs( f43_arg0._scrollbars ) do
		f43_local25:UpdateScrolling()
	end
end

LUI.UIGrid.GiveFocusToChild = function ( f44_arg0, f44_arg1 )
	f44_arg1:processEvent( {
		name = "gain_focus"
	} )
	f44_arg0._childInFocus = f44_arg1
end

LUI.UIGrid.FocusNextElement = function ( f45_arg0, f45_arg1, f45_arg2, f45_arg3, f45_arg4, f45_arg5 )
	local f45_local0, f45_local1, f45_local2, f45_local3 = nil
	if f45_arg2 == "up" then
		f45_local2 = LUI.DIRECTION.vertical
		f45_local3 = -1
	elseif f45_arg2 == "down" then
		f45_local2 = LUI.DIRECTION.vertical
		f45_local3 = 1
	elseif f45_arg2 == "left" then
		f45_local2 = LUI.DIRECTION.horizontal
		f45_local3 = -1
	elseif f45_arg2 == "right" then
		f45_local2 = LUI.DIRECTION.horizontal
		f45_local3 = 1
	end
	if f45_local2 and f45_local3 then
		f45_local0, f45_local1 = f45_arg0:GetNextFocusablePosition( f45_local2, f45_local3 )
	end
	if f45_local0 then
		local f45_local4 = f45_arg0._alwaysSnap
		if not f45_local4 then
			f45_local4 = f45_local1 and f45_arg0._snapOnWrap
		end
		f45_arg0:SetFocusedPosition( f45_local0, f45_local4 == true )
		f45_arg0:FocusMoved( f45_arg2 )
		return true
	else
		local f45_local4 = f45_arg0:getParent()
		if f45_local4 and f45_local4:FocusNextElement( f45_arg0, f45_arg2, f45_arg3, f45_arg4, f45_arg5 ) then
			f45_arg0:saveState()
			return true
		else
			return false
		end
	end
end

LUI.UIGrid.Scroll = function ( f46_arg0, f46_arg1 )
	local f46_local0 = f46_arg0:GetContentVisibleSize( LUI.DIRECTION.horizontal )
	local f46_local1 = f46_arg0:GetContentVisibleSize( LUI.DIRECTION.vertical )
	local f46_local2 = f46_arg0:GetNumChildren()
	if f46_local2 <= f46_local1 * f46_local0 and f46_local2 ~= -1 then
		return false
	elseif f46_arg1 == "up" or f46_arg1 == "down" then
		local f46_local3, f46_local4 = f46_arg0:GetRowBoundaries()
		local f46_local5 = f46_arg0:GetNumRows()
		local f46_local6 = f46_local3
		if f46_arg1 == "up" and (not f46_local5 or f46_local3 > 0) then
			f46_local6 = f46_local6 - 1
		elseif f46_arg1 == "down" and (not f46_local5 or f46_local4 < f46_local5 - 1) then
			f46_local6 = f46_local6 + f46_local1
		else
			return false
		end
		if f46_local6 ~= f46_local3 then
			f46_arg0:SetPositionInternal( {
				x = 0,
				y = f46_local6
			}, true, false, false )
		end
		return true
	elseif f46_arg1 == "left" or f46_arg1 == "right" then
		local f46_local3, f46_local4 = f46_arg0:GetColumnBoundaries()
		local f46_local5 = f46_arg0:GetNumColumns()
		local f46_local6 = f46_local3
		if f46_arg1 == "left" and (not f46_local5 or f46_local3 > 0) then
			f46_local6 = f46_local6 - 1
		elseif f46_arg1 == "right" and (not f46_local5 or f46_local4 < f46_local5 - 1) then
			f46_local6 = f46_local6 + f46_local0
		else
			return false
		end
		if f46_local6 ~= f46_local3 then
			f46_arg0:SetPositionInternal( {
				x = f46_local6,
				y = 0
			}, true, false, false )
		end
		return true
	else
		return false
	end
end

LUI.UIGrid.SetDirectionalInputEnabled = function ( f47_arg0, f47_arg1 )
	f47_arg0._directionalInputEnabled = f47_arg1
end

LUI.UIGrid.GamepadButton = function ( f48_arg0, f48_arg1 )
	if f48_arg1.down then
		local f48_local0
		if f48_arg1.button ~= "up" and f48_arg1.button ~= "down" and f48_arg1.button ~= "left" and f48_arg1.button ~= "right" then
			f48_local0 = false
		else
			f48_local0 = true
		end
		if f48_local0 and not f48_arg0._directionalInputEnabled then
			return false
		elseif #f48_arg0._permittedQualifiers > 0 and f48_arg1.qualifier and f48_local0 and not LUI.IsItemInArray( f48_arg0._permittedQualifiers, f48_arg1.qualifier ) then
			return false
		elseif f48_arg1.qualifier == "mousewheel" and not f48_arg0._disableMouseWheel then
			f48_arg0:Scroll( f48_arg1.button )
			return true
		elseif f48_arg0._targetPosition then
			if not f48_arg0._childInFocus and f48_arg0._shouldFocus then
				return f48_arg0:FocusNextElement( f48_arg0, f48_arg1.button, FocusType.Gamepad, f48_arg1.qualifier, f48_arg1.controller )
			else
				return f48_arg0:dispatchEventToChildren( f48_arg1 )
			end
		end
	end
	return f48_arg0:dispatchEventToChildren( f48_arg1 )
end

LUI.UIGrid.SetDefaultFocus = function ( f49_arg0, f49_arg1 )
	f49_arg0._defaultFocus = f49_arg1
end

LUI.UIGrid.GetDefaultFocus = function ( f50_arg0 )
	if type( f50_arg0._defaultFocus ) == "function" then
		return f50_arg0._defaultFocus()
	else
		return f50_arg0._defaultFocus
	end
end

LUI.UIGrid.FocusMoved = function ( f51_arg0, f51_arg1 )
	local f51_local0 = "grid_focus_" .. f51_arg1 .. "_moved"
	for f51_local4, f51_local5 in pairs( f51_arg0._arrows ) do
		f51_local5:processEvent( {
			name = f51_local0
		} )
	end
end

local f0_local0 = function ( f52_arg0 )
	local f52_local0, f52_local1 = nil
	local f52_local2 = f52_arg0:GetNumRows()
	local f52_local3 = f52_arg0:GetNumColumns()
	if f52_arg0._targetPosition then
		if f52_local3 == 1 then
			f52_local0 = 1 + f52_arg0._targetPosition.y
			f52_local1 = f52_local2
		elseif f52_local2 == 1 then
			f52_local0 = 1 + f52_arg0._targetPosition.x
			f52_local1 = f52_local3 or f52_arg0:GetNumChildren()
		else
			f52_local0 = 1 + f52_arg0._targetPosition.x + f52_arg0._targetPosition.y * f52_local3
			f52_local1 = f52_arg0:GetNumChildren()
		end
	else
		f52_local0 = 0
		f52_local1 = f52_arg0:GetNumChildren()
	end
	for f52_local7, f52_local8 in pairs( f52_arg0._itemNumbers ) do
		f52_local8:setText( Engine.Localize( "LUA_MENU_X_OF_Y", f52_local0, f52_local1 ) )
	end
end

local f0_local1 = function ( f53_arg0 )
	local f53_local0 = {}
	local f53_local1 = f53_arg0:GetNumRows()
	local f53_local2 = f53_arg0:GetNumColumns()
	local f53_local3, f53_local4, f53_local5, f53_local6 = nil
	if Engine.IsGamepadEnabled() ~= 1 then
		f53_local3, f53_local4 = f53_arg0:GetRowBoundaries()
		f53_local5, f53_local6 = f53_arg0:GetColumnBoundaries()
	elseif f53_arg0._targetPosition then
		f53_local3 = f53_arg0._targetPosition.y
		f53_local4 = f53_arg0._targetPosition.y
		f53_local5 = f53_arg0._targetPosition.x
		f53_local6 = f53_arg0._targetPosition.x
	end
	if f53_local3 and f53_local4 and f53_local5 and f53_local6 then
		if f53_local3 == 0 and f53_local1 >= 0 then
			table.insert( f53_local0, "grid_focus_up_blocked" )
		else
			table.insert( f53_local0, "grid_focus_up_not_blocked" )
		end
		if f53_local1 - 1 <= f53_local4 then
			table.insert( f53_local0, "grid_focus_down_blocked" )
		else
			table.insert( f53_local0, "grid_focus_down_not_blocked" )
		end
		if f53_local5 == 0 and f53_local2 and f53_local2 >= 0 then
			table.insert( f53_local0, "grid_focus_left_blocked" )
		else
			table.insert( f53_local0, "grid_focus_left_not_blocked" )
		end
		if f53_local2 and f53_local2 - 1 <= f53_local6 then
			table.insert( f53_local0, "grid_focus_right_blocked" )
		else
			table.insert( f53_local0, "grid_focus_right_not_blocked" )
		end
	else
		table.insert( f53_local0, "grid_focus_up_blocked" )
		table.insert( f53_local0, "grid_focus_down_blocked" )
		table.insert( f53_local0, "grid_focus_left_blocked" )
		table.insert( f53_local0, "grid_focus_right_blocked" )
	end
	for f53_local13, f53_local14 in pairs( f53_arg0._arrows ) do
		for f53_local10, f53_local11 in ipairs( f53_local0 ) do
			f53_local14:processEvent( {
				name = f53_local11
			} )
		end
	end
end

LUI.UIGrid.UpdateNumbersAndArrows = function ( f54_arg0 )
	f0_local0( f54_arg0 )
	f0_local1( f54_arg0 )
end

LUI.UIGrid.FocusChanged = function ( f55_arg0, f55_arg1 )
	if not f55_arg0._targetPosition then
		return 
	else
		f0_local1( f55_arg0 )
		f55_arg0:SetLastFocusIndex( f55_arg0:GetContentIndex( f55_arg0._targetPosition.x, f55_arg0._targetPosition.y ) )
	end
end

LUI.UIGrid.GetPositionForIndex = function ( f56_arg0, f56_arg1 )
	local f56_local0 = f56_arg0:GetNumChildren()
	if f56_local0 then
		f56_arg1 = LUI.clamp( f56_arg1, 0, f56_local0 - 1 )
	end
	local f56_local1, f56_local2 = nil
	if f56_arg0:GetPrimaryAxis() == LUI.DIRECTION.horizontal then
		local f56_local3 = f56_arg0:GetMaxVisibleColumns()
		f56_local1 = f56_arg1 % f56_local3
		f56_local2 = math.floor( f56_arg1 / f56_local3 )
	else
		local f56_local3 = f56_arg0:GetMaxVisibleRows()
		f56_local2 = f56_arg1 % f56_local3
		f56_local1 = math.floor( f56_arg1 / f56_local3 )
	end
	return {
		x = f56_local1,
		y = f56_local2
	}
end

LUI.UIGrid.GetContentIndex = function ( f57_arg0, f57_arg1, f57_arg2 )
	local f57_local0 = nil
	if f57_arg0:GetPrimaryAxis() == LUI.DIRECTION.horizontal then
		f57_local0 = f57_arg1 + f57_arg2 * f57_arg0:GetMaxVisibleColumns()
	else
		f57_local0 = f57_arg2 + f57_arg1 * f57_arg0:GetMaxVisibleRows()
	end
	local f57_local1 = f57_arg0:GetNumChildren()
	if f57_local1 then
		f57_local0 = f57_local0 % f57_local1
	end
	return f57_local0
end

LUI.UIGrid.GetContentSize = function ( f58_arg0, f58_arg1 )
	if f58_arg1 == LUI.DIRECTION.horizontal then
		return f58_arg0:GetNumColumns()
	else
		return f58_arg0:GetNumRows()
	end
end

LUI.UIGrid.GetContentVisibleSize = function ( f59_arg0, f59_arg1 )
	if f59_arg1 == LUI.DIRECTION.horizontal then
		return f59_arg0:GetMaxVisibleColumns()
	else
		return f59_arg0:GetMaxVisibleRows()
	end
end

LUI.UIGrid.GetContentOffset = function ( f60_arg0, f60_arg1 )
	local f60_local0, f60_local1 = f60_arg0:GetRowBoundaries()
	local f60_local2, f60_local3 = f60_arg0:GetColumnBoundaries()
	if f60_arg1 == LUI.DIRECTION.horizontal then
		return f60_local2
	else
		return f60_local0
	end
end

LUI.UIGrid.GetFocusPosition = function ( f61_arg0, f61_arg1 )
	if not f61_arg0._targetPosition then
		return nil
	elseif f61_arg1 == LUI.DIRECTION.horizontal then
		return f61_arg0._targetPosition.x
	else
		return f61_arg0._targetPosition.y
	end
end

LUI.UIGrid.GetDefaultPosition = function ( f62_arg0, f62_arg1 )
	local f62_local0 = f62_arg0:GetDefaultFocus()
	if f62_local0 then
		if f62_arg1 == LUI.DIRECTION.horizontal then
			return f62_local0.x
		else
			return f62_local0.y
		end
	else
		return nil
	end
end

LUI.UIGrid.SetShouldFocus = function ( f63_arg0, f63_arg1 )
	f63_arg0._shouldFocus = f63_arg1
end

LUI.UIDataSourceGrid.FocusChanged = function ( f64_arg0 )
	LUI.UIDataSourceGrid.super.FocusChanged( f64_arg0 )
	if f64_arg0._targetPosition then
		f64_arg0:SetDataSource( f64_arg0._gridDataSource:GetDataSourceAtIndex( f64_arg0:GetContentIndex( f64_arg0._targetPosition.x, f64_arg0._targetPosition.y ), f64_arg0._controllerIndex ), f64_arg0._controllerIndex )
	end
end

