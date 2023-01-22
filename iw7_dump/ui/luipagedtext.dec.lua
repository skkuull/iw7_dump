LUI.UIPagedText = LUI.Class( LUI.UIStyledText )
LUI.UIPagedText.init = function ( f1_arg0, f1_arg1 )
	LUI.UIPagedText.super.init( f1_arg0, f1_arg1 )
	f1_arg0._textPageHeight = 500 * _1080p
	f1_arg0._curPage = 1
	f1_arg0._textPages = {}
	f1_arg0._layoutInitialized = false
	f1_arg0:SetNotifyOnLayoutInit( true )
	f1_arg0:addEventHandler( "next_page", LUI.UIPagedText.NextPage )
	f1_arg0:addEventHandler( "prev_page", LUI.UIPagedText.PrevPage )
	f1_arg0:addEventHandler( "layout_initialized", function ( f2_arg0, f2_arg1 )
		f2_arg0._layoutInitialized = true
		if f2_arg0._text ~= nil then
			f2_arg0:setText( f2_arg0._text )
		end
	end )
end

LUI.UIPagedText.RecalculatePages = function ( f3_arg0 )
	if f3_arg0._text ~= nil then
		f3_arg0._textPages = f3_arg0:GetPagedText( f3_arg0._text, f3_arg0._textPageHeight )
		f3_arg0._curPage = 1
	else
		f3_arg0._textPages = {}
	end
end

LUI.UIPagedText.UpdatePageNumText = function ( f4_arg0 )
	if f4_arg0._pageNumDisplayDatasource ~= nil then
		local f4_local0 = nil
		if Engine.InFrontend() then
			local f4_local1 = LUI.FlowManager.GetScopedData( f4_arg0 )
			assert( f4_local1 )
			f4_local0 = f4_local1.controllerIndex
		else
			f4_local0 = f4_arg0:getRootController()
		end
		if #f4_arg0._textPages > 0 and f4_arg0._curPage <= #f4_arg0._textPages then
			f4_arg0._pageNumDisplayDatasource:SetValue( f4_local0, f4_arg0._curPage .. " / " .. #f4_arg0._textPages )
		else
			f4_arg0._pageNumDisplayDatasource:SetValue( f4_local0, "" )
		end
	end
end

LUI.UIPagedText.setText = function ( f5_arg0, f5_arg1, f5_arg2 )
	f5_arg0._text = f5_arg1
	if f5_arg0._layoutInitialized then
		f5_arg0:RecalculatePages()
		if #f5_arg0._textPages > 0 and f5_arg0._curPage <= #f5_arg0._textPages then
			f5_arg0:setTextInC( f5_arg0._textPages[f5_arg0._curPage], f5_arg2 )
		else
			f5_arg0:setTextInC( "", f5_arg2 )
		end
		f5_arg0:UpdatePageNumText()
	end
end

LUI.UIPagedText.SetTextPageHeight = function ( f6_arg0, f6_arg1 )
	f6_arg0._textPageHeight = f6_arg1
	if f6_arg0._text ~= nil then
		f6_arg0:setText( f6_arg0._text )
	end
end

LUI.UIPagedText.SetPageNumDisplayDatasource = function ( f7_arg0, f7_arg1 )
	f7_arg0._pageNumDisplayDatasource = f7_arg1
end

LUI.UIPagedText.GetNumPages = function ( f8_arg0 )
	return #f8_arg0._textPages
end

LUI.UIPagedText.GetCurrentPage = function ( f9_arg0 )
	return f9_arg0._curPage
end

LUI.UIPagedText.SetPage = function ( f10_arg0, f10_arg1 )
	if 0 < f10_arg1 and 0 < #f10_arg0._textPages and f10_arg1 <= #f10_arg0._textPages then
		f10_arg0._curPage = f10_arg1
		f10_arg0:setTextInC( f10_arg0._textPages[f10_arg0._curPage] )
		f10_arg0:UpdatePageNumText()
		return true
	else
		return false
	end
end

LUI.UIPagedText.NextPage = function ( f11_arg0 )
	if f11_arg0:SetPage( f11_arg0._curPage + 1 ) then
		f11_arg0:processEvent( {
			name = "next_page_success"
		} )
	else
		f11_arg0:processEvent( {
			name = "next_page_fail"
		} )
	end
end

LUI.UIPagedText.PrevPage = function ( f12_arg0 )
	if f12_arg0:SetPage( f12_arg0._curPage - 1 ) then
		f12_arg0:processEvent( {
			name = "prev_page_success"
		} )
	else
		f12_arg0:processEvent( {
			name = "prev_page_fail"
		} )
	end
end

LUI.UIPagedText.id = "LUIPagedText"
