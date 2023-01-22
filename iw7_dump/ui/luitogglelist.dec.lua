LUI.UIToggleList = LUI.Class( LUI.List )
LUI.UIDataSourceToggleList = LUI.Class( LUI.UIToggleList )
LUI.UIToggleList.init = function ( f1_arg0, f1_arg1, f1_arg2 )
	LUI.UIToggleList.super.init( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg2 )
	assert( type( f1_arg2.buildChild ) == "function" )
	f1_arg0._activeIndices = {}
	f1_arg0._buildChildFunc = f1_arg2.buildChild
	f1_arg0._orderedIndices = f1_arg2.orderedIndices or false
	f1_arg0._animateInDuration = f1_arg2.animateInDuration or 500
	f1_arg0._animateOutDuration = f1_arg2.animateOutDuration or 500
	f1_arg0._animationVariance = f1_arg2.animationVariance
end

LUI.UIToggleList.AddItem = function ( f2_arg0, f2_arg1 )
	if f2_arg0._activeIndices[f2_arg1] then
		DebugPrint( "ERROR - LUI.UIToggleList.AddItem - Attempting to add an item at an index where an item already exists!" )
		return 
	end
	local widget = f2_arg0._buildChildFunc( f2_arg1 )
	local f2_local1 = f2_arg0:CreateContainerElement( widget )
	f2_local1.id = widget.id .. "Wrapper" .. f2_arg1
	f2_local1:addElement( widget )
	f2_local1.widget = widget
	
	widget:registerAnimationState( "default", {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		left = 0,
		right = 0,
		top = 0,
		bottom = 0
	} )
	widget:animateToState( "default" )
	f2_local1._toggleListIndex = f2_arg1
	f2_arg0._activeIndices[f2_arg1] = true
	if f2_arg0._orderedIndices then
		f2_arg0:InsertOrderedItem( f2_arg1, f2_local1 )
	else
		f2_arg0:addElement( f2_local1 )
	end
	f2_local1:registerEventHandler( "transition_complete_default", function ( element, event )
		element:close()
		f2_arg0._activeIndices[f2_arg1] = nil
	end )
	f2_local1:animateToState( "visible", f2_arg0:GetAnimationDuration( f2_arg0._animateInDuration ) )
	return f2_local1
end

LUI.UIToggleList.RemoveItem = function ( f4_arg0, f4_arg1 )
	local f4_local0 = f4_arg0:getFirstChild()
	while f4_local0 do
		if f4_local0._toggleListIndex == f4_arg1 then
			f4_local0:animateToState( "default", f4_arg0:GetAnimationDuration( f4_arg0._animateOutDuration ) )
			return 
		end
		f4_local0 = f4_local0:getNextSibling()
	end
end

LUI.UIToggleList.GetItem = function ( f5_arg0, f5_arg1 )
	local f5_local0 = f5_arg0:getFirstChild()
	while f5_local0 do
		if f5_local0._toggleListIndex == f5_arg1 then
			return f5_local0
		end
		f5_local0 = f5_local0:getNextSibling()
	end
	return nil
end

LUI.UIToggleList.InsertOrderedItem = function ( f6_arg0, f6_arg1, f6_arg2 )
	local f6_local0 = f6_arg0:getFirstChild()
	while f6_local0 do
		assert( f6_local0._toggleListIndex )
		if f6_arg1 < f6_local0._toggleListIndex then
			f6_arg2:addElementBefore( f6_local0 )
			return 
		end
		f6_local0 = f6_local0:getNextSibling()
	end
	f6_arg0:addElement( f6_arg2 )
end

LUI.UIToggleList.CreateContainerElement = function ( f7_arg0, f7_arg1 )
	local f7_local0 = {}
	f7_local0 = f7_arg1:getLocalRect()
	local f7_local1 = {}
	f7_local1 = f7_arg1:GetAnchorData()
	local f7_local2 = f7_local1[1] == 0
	local f7_local3 = f7_local1[2] == 0
	local f7_local4 = f7_local1[3] == 0
	local f7_local5 = f7_local1[4] == 0
	local f7_local6 = {
		leftAnchor = f7_local2,
		rightAnchor = f7_local4,
		topAnchor = f7_local3,
		bottomAnchor = f7_local5,
		left = f7_local0[1],
		top = f7_local0[2],
		right = f7_local0[3],
		bottom = f7_local0[4]
	}
	local self = LUI.UIElement.new( {
		leftAnchor = f7_local2,
		rightAnchor = f7_local4,
		topAnchor = f7_local3,
		bottomAnchor = f7_local5,
		left = 0,
		top = 0,
		right = 0,
		bottom = 0
	} )
	self:registerAnimationState( "visible", f7_local6 )
	return self
end

LUI.UIToggleList.GetAnimationDuration = function ( f8_arg0, f8_arg1 )
	if f8_arg0._animationVariance then
		return math.random( f8_arg1 - f8_arg0._animationVariance, f8_arg1 + f8_arg0._animationVariance )
	else
		return f8_arg1
	end
end

LUI.UIDataSourceToggleList.init = function ( f9_arg0, f9_arg1, f9_arg2 )
	LUI.UIDataSourceToggleList.super.init( f9_arg0, f9_arg1, f9_arg2 )
	assert( f9_arg2.controlDataSource )
	assert( f9_arg2.listDataSource )
	assert( type( f9_arg2.listDataSource.GetDataSourceAtIndex ) == "function" )
	assert( f9_arg2.controller )
	f9_arg0._maxBits = f9_arg2.maxBits or 31
	local f9_local0 = f9_arg2.controlDataSource
	local f9_local1 = f9_arg2.listDataSource
	f9_arg0:SubscribeToModel( f9_local0:GetModel( f9_arg2.controller ), function ( f10_arg0 )
		local f10_local0 = DataModel.GetModelValue( f10_arg0 )
		for f10_local1 = 1, f9_arg0._maxBits, 1 do
			local f10_local4 = Engine.IsBitSet( f10_local0, f10_local1 - 1 )
			if f10_local4 and not f9_arg0._activeIndices[f10_local1] then
				local f10_local5 = f9_local1:GetDataSourceAtIndex( f10_local1, f9_arg2.controller )
				local f10_local6 = f9_arg0:AddItem( f10_local1 )
				f10_local6.widget:SetDataSource( f10_local5, f9_arg2.controller )
			end
			if not f10_local4 and f9_arg0._activeIndices[f10_local1] then
				f9_arg0:RemoveItem( f10_local1 )
			end
		end
	end )
	if f9_arg2.animationDataSource then
		f9_arg0:SubscribeToModel( f9_arg2.animationDataSource:GetModel( f9_arg2.controller ), function ( f11_arg0 )
			local f11_local0 = DataModel.GetModelValue( f11_arg0 )
			for f11_local1 = 1, f9_arg0._maxBits, 1 do
				if Engine.IsBitSet( f11_local0, f11_local1 - 1 ) then
					local f11_local4 = f9_arg0:GetItem( f11_local1 )
					if f11_local4 then
						f11_local4:processEvent( {
							name = "togglelist_bitfield_animate"
						} )
					else
						DebugPrint( "ERROR - LUI.UIDataSourceToggleList.init - Attempting to animate an item which doesn't exist!" )
					end
				end
			end
		end )
	end
end

