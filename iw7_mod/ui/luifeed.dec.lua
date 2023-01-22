LUI.BaseUIFeed = LUI.Class( LUI.UIGrid )
LUI.UIFeed = LUI.Class( LUI.BaseUIFeed )
LUI.UIDataSourceFeed = LUI.Class( LUI.BaseUIFeed )
LUI.BaseUIFeed.init = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg2 )
	local f1_local0 = assert
	local f1_local1
	if f1_arg2.TTL ~= nil and type( f1_arg2.TTL ) ~= "number" then
		f1_local1 = false
	else
		f1_local1 = true
	end
	f1_local0( f1_local1 )
	f1_local0 = assert
	if f1_arg2.maxVisibleColumns ~= 1 and f1_arg2.maxVisibleRows ~= 1 then
		f1_local1 = false
	else
		f1_local1 = true
	end
	f1_local0( f1_local1 )
	f1_arg2.numChildren = 0
	f1_arg2.numRows = nil
	f1_arg2.numColumns = nil
	f1_arg2.defaultFocus = nil
	LUI.BaseUIFeed.super.init( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0._numData = 0
	f1_arg0._TTL = f1_arg2.TTL or 4000
	f1_arg0._numScrolled = 0
	f1_arg0._numVisible = 0
	f1_arg0._numAlive = 0
	f1_arg0._maxActive = math.max( f1_arg2.maxVisibleColumns, f1_arg2.maxVisibleRows )
	f1_arg0._tickOnExpiration = f1_arg2.tickOnExpiration
	f1_arg0._numAliveDataSource = f1_arg2.numAliveDataSource
	f1_arg0._numVisibleDataSource = f1_arg2.numVisibleDataSource
	f1_arg0._resetCounter = 0
	f1_local0 = f1_arg2.childVisibilityNotifyFunc
	if not f1_local0 then
		f1_local0 = LUI.BaseUIFeed.OnElementNotifyVisible
	end
	f1_arg0._childVisibilityNotifyFunc = f1_local0
	if f1_arg0._tickOnExpiration == nil then
		if f1_arg2.maxVisibleColumns == 1 and f1_arg0._verticalAlignment == LUI.Alignment.Bottom then
			f1_arg0._tickOnExpiration = false
		elseif f1_arg2.maxVisibleRows == 1 and f1_arg0._horizontalAlignment == LUI.Alignment.Right then
			f1_arg0._tickOnExpiration = false
		else
			f1_arg0._tickOnExpiration = true
		end
	end
	f1_arg0:addEventHandler( "position_visible", f1_arg0._childVisibilityNotifyFunc )
end

LUI.BaseUIFeed.OnNewData = function ( f2_arg0, f2_arg1 )
	f2_arg0._numData = f2_arg0._numData + 1
	f2_arg0:SetNumChildren( f2_arg0._numData )
	f2_arg0._numVisible = f2_arg0._numVisible + 1
	f2_arg0._numAlive = f2_arg0._numAlive + 1
	local f2_local0 = f2_arg0:GetPrimaryAxis()
	local f2_local1 = f2_arg0._maxActive < f2_arg0._numVisible
	if not f2_local1 then
		if f2_local0 ~= LUI.DIRECTION.horizontal or f2_arg0._verticalAlignment ~= LUI.Alignment.Bottom then
			f2_local1 = false
		else
			f2_local1 = true
		end
	end
	if not f2_local1 then
		if f2_local0 ~= LUI.DIRECTION.vertical or f2_arg0._horizontalAlignment ~= LUI.Alignment.Right then
			f2_local1 = false
		else
			f2_local1 = true
		end
	end
	if f2_local1 then
		f2_arg0:Tick()
	end
	f2_arg0:UpdateTrackerDataSources()
	local f2_local2 = f2_arg1 or f2_arg0._TTL
	if f2_local2 then
		local f2_local3 = f2_arg0:Wait( f2_local2 )
		local f2_local4 = f2_arg0._numData
		local f2_local5 = f2_arg0._resetCounter
		f2_local3.onComplete = function ()
			if f2_local5 == f2_arg0._resetCounter then
				local f3_local0, f3_local1 = f2_arg0:GetGridLocation( f2_local4 - 1 )
				local f3_local2 = f2_arg0:GetElementAtPosition( f3_local1, f3_local0 )
				if f3_local2 ~= nil then
					f3_local2:processEvent( {
						name = "feed_expiration"
					} )
				else
					f2_arg0:NotifyWhenPositionIsVisible( f3_local1, f3_local0 )
				end
				if f2_arg0._numScrolled < f2_local4 and f2_arg0._tickOnExpiration then
					f2_arg0:Tick()
				end
				f2_arg0._numAlive = f2_arg0._numAlive - 1
				f2_arg0:UpdateTrackerDataSources()
			end
		end
		
	end
end

LUI.BaseUIFeed.Tick = function ( f4_arg0 )
	f4_arg0._numScrolled = f4_arg0._numScrolled + 1
	f4_arg0._numVisible = f4_arg0._numVisible - 1
	if f4_arg0:GetPrimaryAxis() == LUI.DIRECTION.horizontal then
		local f4_local0 = f4_arg0._verticalAlignment
		local f4_local1 = LUI.Alignment.Bottom
		f4_arg0:SetTargetRow( REG7 and f4_arg0._numScrolled + f4_arg0._numVisible - 1 or f4_arg0._numScrolled, false, false )
	else
		local f4_local0 = f4_arg0._horizontalAlignment
		local f4_local1 = LUI.Alignment.Right
		f4_arg0:SetTargetColumn( REG10 and f4_arg0._numScrolled + f4_arg0._numVisible - 1 or f4_arg0._numScrolled, false, false )
	end
end

LUI.BaseUIFeed.GetDataIndex = function ( f5_arg0, f5_arg1, f5_arg2 )
	if f5_arg0:GetPrimaryAxis() == LUI.DIRECTION.horizontal then
		return f5_arg1 + f5_arg2 * f5_arg0:GetMaxVisibleColumns()
	else
		return f5_arg2 + f5_arg1 * f5_arg0:GetMaxVisibleRows()
	end
end

LUI.BaseUIFeed.GetGridLocation = function ( f6_arg0, f6_arg1 )
	local f6_local0, f6_local1 = nil
	if f6_arg0:GetPrimaryAxis() == LUI.DIRECTION.horizontal then
		f6_local0 = math.floor( f6_arg1 / f6_arg0:GetMaxVisibleColumns() )
		f6_local1 = f6_arg1 % f6_arg0:GetMaxVisibleColumns()
	else
		f6_local1 = math.floor( f6_arg1 / f6_arg0:GetMaxVisibleRows() )
		f6_local0 = f6_arg1 % f6_arg0:GetMaxVisibleRows()
	end
	return f6_local0, f6_local1
end

LUI.BaseUIFeed.GainFocus = function ( f7_arg0, f7_arg1 )
	return false
end

LUI.BaseUIFeed.UpdateTrackerDataSources = function ( f8_arg0 )
	if f8_arg0._numAliveDataSource then
		DataModel.SetModelValue( f8_arg0._numAliveDataSource:GetModel( f8_arg0._controllerIndex ), f8_arg0._numAlive )
	end
	if f8_arg0._numVisibleDataSource then
		DataModel.SetModelValue( f8_arg0._numVisibleDataSource:GetModel( f8_arg0._controllerIndex ), f8_arg0._numVisible )
	end
end

LUI.BaseUIFeed.OnElementNotifyVisible = function ( f9_arg0, f9_arg1 )
	assert( f9_arg1 )
	assert( f9_arg1.child )
	f9_arg1.child:processEvent( {
		name = "feed_expiration"
	} )
end

LUI.UIFeed.init = function ( f10_arg0, f10_arg1, f10_arg2 )
	assert( f10_arg2 )
	local f10_local0 = assert
	local f10_local1
	if f10_arg2.bufferPadding ~= nil and type( f10_arg2.bufferPadding ) ~= "number" then
		f10_local1 = false
	else
		f10_local1 = true
	end
	f10_local0( f10_local1 )
	f10_local0 = LUI.ShallowCopy( f10_arg2 )
	f10_local1 = f10_local0.refreshChild
	f10_local0.refreshChild = function ( f11_arg0, f11_arg1, f11_arg2 )
		local f11_local0 = f10_arg0:GetDataAtIndex( f10_arg0:GetDataIndex( f11_arg1, f11_arg2 ) )
		assert( type( f11_local0 ) == "table" )
		f10_local1( f11_arg0, f11_local0 )
	end
	
	LUI.UIFeed.super.init( f10_arg0, f10_arg1, f10_local0 )
	f10_arg0._dataBufferLength = math.max( 2, f10_local0.bufferPadding or 2 ) + math.max( f10_local0.maxVisibleColumns, f10_local0.maxVisibleRows )
	f10_arg0._dataBuffer = {}
	f10_arg0._nextBufferWriteIndex = 1
end

LUI.UIFeed.PushData = function ( f12_arg0, f12_arg1 )
	assert( type( f12_arg1 ) == "table" )
	f12_arg0._dataBuffer[f12_arg0._nextBufferWriteIndex] = f12_arg1
	f12_arg0._nextBufferWriteIndex = 1 + f12_arg0._nextBufferWriteIndex % f12_arg0._dataBufferLength
	f12_arg0:OnNewData()
end

LUI.UIFeed.Reset = function ( f13_arg0 )
	f13_arg0._resetCounter = f13_arg0._resetCounter + 1
	f13_arg0._numData = 0
	f13_arg0._numScrolled = 0
	f13_arg0._numVisible = 0
	f13_arg0._numAlive = 0
	f13_arg0:SetNumChildren( 0 )
	f13_arg0._dataBuffer = {}
	f13_arg0._nextBufferWriteIndex = 1
	f13_arg0:RefreshContent()
end

LUI.UIFeed.GetDataAtIndex = function ( f14_arg0, f14_arg1 )
	return f14_arg0._dataBuffer[1 + f14_arg1 % f14_arg0._dataBufferLength]
end

LUI.UIDataSourceFeed.init = function ( f15_arg0, f15_arg1, f15_arg2 )
	assert( f15_arg2 )
	assert( type( f15_arg2.dataSource ) == "table" )
	assert( f15_arg2.controllerIndex )
	f15_arg2.refreshChild = function ( f16_arg0, f16_arg1, f16_arg2 )
		f16_arg0:SetDataSource( f15_arg0._feedDataSource:GetDataSourceAtIndex( f15_arg0:GetDataIndex( f16_arg1, f16_arg2 ), f15_arg0._controllerIndex ), f15_arg0._controllerIndex )
	end
	
	f15_arg0._controllerIndex = f15_arg2.controllerIndex
	LUI.UIDataSourceFeed.super.init( f15_arg0, f15_arg1, f15_arg2 )
	f15_arg0:SetFeedDataSource( f15_arg2.dataSource )
end

LUI.UIDataSourceFeed.SetFeedDataSource = function ( f17_arg0, f17_arg1 )
	assert( type( f17_arg1 ) == "table" )
	assert( type( f17_arg1.GetPushModel ) == "function" )
	assert( type( f17_arg1.GetTTLModel ) == "function" )
	assert( type( f17_arg1.GetDataSourceAtIndex ) == "function" )
	if f17_arg0._feedDataSource == f17_arg1 then
		return 
	end
	f17_arg0._feedDataSource = f17_arg1
	if f17_arg0._pushSubscription then
		f17_arg0:UnsubscribeFromModel( f17_arg0._pushSubscription )
		f17_arg0._pushSubscription = nil
	end
	f17_arg0._pushSubscription = f17_arg0:SubscribeToModel( f17_arg0._feedDataSource:GetPushModel( f17_arg0._controllerIndex ), function ( f18_arg0 )
		if DataModel.GetModelValue( f18_arg0 ) == true then
			local f18_local0 = f17_arg0._feedDataSource:GetTTLModel( f17_arg0._controllerIndex )
			local f18_local1
			if f18_local0 then
				f18_local1 = DataModel.GetModelValue( f18_local0 )
				if not f18_local1 then
				
				else
					f17_arg0:OnNewData( f18_local1 )
				end
			end
			f18_local1 = nil
		end
	end )
end

