LUI.List = LUI.Class( LUI.UIElement )
LUI.UIHorizontalList = LUI.Class( LUI.List )
LUI.UIHorizontalNavigator = LUI.Class( LUI.List )
LUI.UIHorizontalStackedLayout = LUI.Class( LUI.List )
LUI.UIVerticalNavigator = LUI.Class( LUI.List )
LUI.UIVerticalList = LUI.Class( LUI.List )
LUI.UIVerticalStackedLayout = LUI.Class( LUI.List )
LUI.List.init = function ( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = f1_arg2.autoLayout ~= false
	local f1_local1 = f1_arg2.handleNavigation ~= false
	local f1_local2 = f1_arg2.direction
	local f1_local3 = assert
	local f1_local4
	if f1_local2 ~= LUI.DIRECTION.horizontal and f1_local2 ~= LUI.DIRECTION.vertical then
		f1_local4 = false
	else
		f1_local4 = true
	end
	f1_local3( f1_local4 )
	LUI.List.super.init( f1_arg0, f1_arg1, f1_arg2 )
	if f1_local0 then
		if f1_arg2.direction == LUI.DIRECTION.horizontal then
			f1_arg0:setupUIHorizontalList()
			if f1_arg2.horizontalAlignment then
				f1_arg0:SetAlignment( f1_arg2.horizontalAlignment )
			end
		else
			f1_arg0:SetupStackedLayout( f1_arg2 )
			if f1_arg2.verticalAlignment then
				f1_arg0:SetAlignment( f1_arg2.verticalAlignment )
			end
		end
	end
	if f1_local1 then
		f1_arg0._handleNavigation = true
		f1_arg0._permittedQualifiers = f1_arg2.permittedQualifiers or {}
		if f1_local2 == LUI.DIRECTION.vertical then
			f1_arg0._previous = "up"
			f1_arg0._next = "down"
			f1_arg0._orthogonalPrevious = "left"
			f1_arg0._orthogonalNext = "right"
			f1_arg0._firstCoord = "top"
			f1_arg0._secondCoord = "bottom"
		else
			f1_arg0._previous = "left"
			f1_arg0._next = "right"
			f1_arg0._orthogonalPrevious = "up"
			f1_arg0._orthogonalNext = "down"
			f1_arg0._firstCoord = "left"
			f1_arg0._secondCoord = "right"
		end
		f1_arg0:registerEventHandler( "gain_focus", function ( element, event )
			return element:GainFocus( event )
		end )
	end
end

LUI.List.addSpacer = function ( f3_arg0, f3_arg1, f3_arg2 )
	local self = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = false,
		topAnchor = true,
		bottomAnchor = false,
		left = 0,
		width = f3_arg1,
		top = 0,
		height = f3_arg1
	} )
	self:setPriority( f3_arg2 )
	f3_arg0:addElement( self )
	return self
end

LUI.List.addElement = function ( f4_arg0, f4_arg1 )
	LUI.List.super.addElement( f4_arg0, f4_arg1 )
	f4_arg0:setLayoutCached( false )
end

LUI.List.removeElement = function ( f5_arg0, f5_arg1 )
	LUI.List.super.removeElement( f5_arg0, f5_arg1 )
	f5_arg0:setLayoutCached( false )
end

LUI.List.addElementBefore = function ( f6_arg0, f6_arg1 )
	LUI.List.super.addElementBefore( f6_arg0, f6_arg1 )
	f6_arg0:setLayoutCached( false )
end

LUI.List.addElementAfter = function ( f7_arg0, f7_arg1 )
	LUI.List.super.addElementAfter( f7_arg0, f7_arg1 )
	f7_arg0:setLayoutCached( false )
end

LUI.List.SetNoWrap = function ( f8_arg0, f8_arg1 )
	f8_arg0._noWrap = f8_arg1
end

LUI.List.GainFocus = function ( f9_arg0, f9_arg1 )
	local f9_local0, f9_local1 = f9_arg0:restoreState( nil, f9_arg1.controller, false )
	if f9_local1 > 0 then
		return true
	end
	local f9_local2 = nil
	local f9_local3 = f9_arg0:getFirstChild()
	while f9_local3 do
		if f9_local3.listDefaultFocus then
			f9_local2 = f9_local3
			break
		end
		f9_local3 = f9_local3:getNextSibling()
	end
	if f9_local2 then
		f9_local2:processEvent( f9_arg1 )
		return true
	end
	return f9_arg0:dispatchEventToChildren( f9_arg1 )
end

LUI.List.GetNextFocusableElement = function ( f10_arg0, f10_arg1, f10_arg2, f10_arg3, f10_arg4 )
	if not f10_arg0._handleNavigation then
		return LUI.List.super.GetNextFocusableElement( f10_arg0, f10_arg1, f10_arg2, f10_arg3, f10_arg4 )
	end
	local f10_local0 = f10_arg1
	local f10_local1 = nil
	if #f10_arg0._permittedQualifiers > 0 and not LUI.IsItemInArray( f10_arg0._permittedQualifiers, f10_arg4 ) then
		return nil
	end
	while f10_local0 do
		if f10_arg2 == f10_arg0._next then
			if f10_local0 == f10_arg0:getLastChild() and not f10_arg0._noWrap then
				f10_local0 = f10_arg0:getFirstChild()
			else
				f10_local0 = f10_local0:getNextSibling()
			end
		elseif f10_arg2 == f10_arg0._previous then
			if f10_local0 == f10_arg0:getFirstChild() and not f10_arg0._noWrap then
				f10_local0 = f10_arg0:getLastChild()
			else
				f10_local0 = f10_local0:getPreviousSibling()
			end
		else
			return LUI.List.super.GetNextFocusableElement( f10_arg0, f10_arg1, f10_arg2, f10_arg3, f10_arg4 )
		end
		if f10_local0 == f10_arg1 then
			break
		elseif f10_local0 and f10_local0:TreeCanFocus( f10_arg3 ) then
			return f10_local0
		end
	end
	return LUI.List.super.GetNextFocusableElement( f10_arg0, f10_arg1, f10_arg2, f10_arg3, f10_arg4 )
end

LUI.UIHorizontalList.init = function ( f11_arg0, f11_arg1, f11_arg2 )
	if not f11_arg2 then
		f11_arg2 = {}
	end
	f11_arg2.direction = LUI.DIRECTION.horizontal
	f11_arg2.handleNavigation = true
	f11_arg2.autoLayout = true
	LUI.UIHorizontalList.super.init( f11_arg0, f11_arg1, f11_arg2 )
end

LUI.UIHorizontalNavigator.init = function ( f12_arg0, f12_arg1, f12_arg2 )
	if not f12_arg2 then
		f12_arg2 = {}
	end
	f12_arg2.direction = LUI.DIRECTION.horizontal
	f12_arg2.handleNavigation = true
	f12_arg2.autoLayout = false
	LUI.UIHorizontalNavigator.super.init( f12_arg0, f12_arg1, f12_arg2 )
end

LUI.UIHorizontalStackedLayout.init = function ( f13_arg0, f13_arg1, f13_arg2 )
	if not f13_arg2 then
		f13_arg2 = {}
	end
	f13_arg2.direction = LUI.DIRECTION.horizontal
	f13_arg2.handleNavigation = false
	f13_arg2.autoLayout = true
	LUI.UIHorizontalStackedLayout.super.init( f13_arg0, f13_arg1, f13_arg2 )
end

LUI.UIVerticalList.init = function ( f14_arg0, f14_arg1, f14_arg2 )
	if not f14_arg2 then
		f14_arg2 = {}
	end
	f14_arg2.direction = LUI.DIRECTION.vertical
	f14_arg2.handleNavigation = true
	f14_arg2.autoLayout = true
	LUI.UIVerticalList.super.init( f14_arg0, f14_arg1, f14_arg2 )
end

LUI.UIVerticalNavigator.init = function ( f15_arg0, f15_arg1, f15_arg2 )
	if not f15_arg2 then
		f15_arg2 = {}
	end
	f15_arg2.direction = LUI.DIRECTION.vertical
	f15_arg2.handleNavigation = true
	f15_arg2.autoLayout = false
	LUI.UIVerticalNavigator.super.init( f15_arg0, f15_arg1, f15_arg2 )
end

LUI.UIVerticalStackedLayout.init = function ( f16_arg0, f16_arg1, f16_arg2 )
	if not f16_arg2 then
		f16_arg2 = {}
	end
	f16_arg2.direction = LUI.DIRECTION.vertical
	f16_arg2.handleNavigation = false
	f16_arg2.autoLayout = true
	LUI.UIVerticalStackedLayout.super.init( f16_arg0, f16_arg1, f16_arg2 )
end

LUI.UIHorizontalList.build = function ( menu, controller )
	local self = LUI.UIHorizontalList.new( {} )
	self:SetNoWrap( controller.noWrap )
	return self
end

LUI.UIVerticalList.build = function ( menu, controller )
	local self = LUI.UIVerticalList.new( nil, controller )
	self:SetNoWrap( controller.noWrap )
	return self
end

