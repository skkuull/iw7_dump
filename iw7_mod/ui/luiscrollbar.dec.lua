LUI.UIScrollbar = LUI.Class()
LUI.UIScrollbar.init = function ( f1_arg0, f1_arg1 )
	local f1_local0 = f1_arg0
	if not f1_arg1 then
		f1_arg1 = {}
	end
	f1_arg0._eventListener = f1_arg1.eventListener
	f1_arg0._slider = f1_arg1.slider
	f1_arg0._fixedSizeSlider = f1_arg1.fixedSizeSlider
	f1_arg0._animationDuration = f1_arg1.animationDuration or 80
	local f1_local1 = f1_arg1.direction
	if not f1_local1 then
		f1_local1 = LUI.DIRECTION.vertical
	end
	f1_arg0._direction = f1_local1
	f1_local1 = assert
	local f1_local2
	if f1_arg0._direction ~= LUI.DIRECTION.vertical and f1_arg0._direction ~= LUI.DIRECTION.horizontal then
		f1_local2 = false
	else
		f1_local2 = true
	end
	f1_local1( f1_local2 )
	if not Engine.IsConsoleGame() then
		if f1_arg1.startCap then
			f1_arg1.startCap:addEventHandler( "button_action", function ( f2_arg0, f2_arg1 )
				if f1_local0._source then
					f1_local0._source:processEvent( {
						name = "scrollbar_previous"
					} )
				end
			end )
		end
		if f1_arg1.endCap then
			f1_arg1.endCap:addEventHandler( "button_action", function ( f3_arg0, f3_arg1 )
				if f1_local0._source then
					f1_local0._source:processEvent( {
						name = "scrollbar_next"
					} )
				end
			end )
		end
		if f1_arg1.slider then
			
		else
			
		end
	end
end

LUI.UIScrollbar.UpdateScrolling = function ( f4_arg0 )
	assert( f4_arg0._source )
	f4_arg0:UpdateSlider()
	if f4_arg0._eventListener then
		local f4_local0 = f4_arg0._source:GetContentSize( f4_arg0._direction )
		local f4_local1 = f4_arg0._source:GetContentVisibleSize( f4_arg0._direction )
		assert( f4_local0 )
		assert( f4_local1 )
		if f4_local0 <= f4_local1 then
			f4_arg0._eventListener:processEvent( {
				name = "scrollbar_all_visible"
			} )
		else
			f4_arg0._eventListener:processEvent( {
				name = "scrollbar_not_all_visible"
			} )
		end
	end
end

LUI.UIScrollbar.LinkTo = function ( f5_arg0, f5_arg1 )
	f5_arg0._source = f5_arg1
	f5_arg0:UpdateScrolling()
end

LUI.UIScrollbar.GetDirection = function ( f6_arg0 )
	return f6_arg0._direction
end

LUI.UIScrollbar.SetLinkedGridDataSource = function ( f7_arg0, f7_arg1 )
	
end

LUI.UIScrollbar.UpdateSlider = function ( f8_arg0 )
	local f8_local0 = f8_arg0._slider or f8_arg0._fixedSizeSlider
	if not f8_local0 then
		return 
	end
	local f8_local1 = f8_arg0._source:GetContentSize( f8_arg0._direction )
	assert( f8_local1 )
	local f8_local2 = f8_arg0._source:GetContentVisibleSize( f8_arg0._direction )
	assert( f8_local2 )
	f8_local2 = math.min( f8_local2, f8_local1 )
	local f8_local3, f8_local4 = nil
	if f8_local0 == f8_arg0._slider then
		local f8_local5 = f8_arg0._source:GetContentOffset( f8_arg0._direction )
		if f8_local5 then
			assert( f8_local5 + f8_local2 <= f8_local1, tostring( f8_local5 ) .. " + " .. tostring( f8_local2 ) .. " <= " .. tostring( f8_local1 ) )
		else
			f8_local5 = 0
			f8_local2 = 1
			f8_local1 = 1
		end
		local f8_local6 = f8_local2 / f8_local1
		f8_local3 = f8_local5 / f8_local1
		f8_local4 = f8_local3 + f8_local6
		f8_local3 = LUI.clamp( f8_local3, 0, 1 - f8_local6 )
		f8_local4 = LUI.clamp( f8_local4, f8_local6, 1 )
	elseif f8_local0 == f8_arg0._fixedSizeSlider then
		local f8_local5 = f8_arg0._source:GetFocusPosition( f8_arg0._direction ) or 0
		assert( f8_local5 >= 0 )
		local f8_local6 = assert
		local f8_local7
		if f8_local5 >= f8_local1 and f8_local1 ~= 0 then
			f8_local7 = false
		else
			f8_local7 = true
		end
		f8_local6( f8_local7 )
		if f8_local1 <= 1 then
			f8_local3 = 0
		else
			f8_local3 = f8_local5 / (f8_local1 - 1)
		end
		f8_local4 = f8_local3
	else
		assert( false )
	end
	local f8_local5 = f8_arg0._animationDuration or 0
	if f8_arg0._direction == LUI.DIRECTION.horizontal then
		f8_local0:SetLeftAnchor( f8_local3, f8_local5, LUI.EASING.outCubic )
		f8_local0:SetRightAnchor( 1 - f8_local4, f8_local5, LUI.EASING.outCubic )
		f8_local0:SetLeft( 0, f8_local5, LUI.EASING.outCubic )
		f8_local0:SetRight( 0, f8_local5, LUI.EASING.outCubic )
	else
		f8_local0:SetTopAnchor( f8_local3, f8_local5, LUI.EASING.outCubic )
		f8_local0:SetBottomAnchor( 1 - f8_local4, f8_local5, LUI.EASING.outCubic )
		f8_local0:SetTop( 0, f8_local5 )
		f8_local0:SetBottom( 0, f8_local5 )
	end
end

