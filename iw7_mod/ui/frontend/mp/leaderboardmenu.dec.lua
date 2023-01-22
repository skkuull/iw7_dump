local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
MenuBuilder.registerType( "LeaderboardFilterPopup", function ( f1_arg0, f1_arg1 )
	local f1_local0 = f1_arg1.controllerIndex
	assert( f1_arg1.leaderboard )
	assert( f1_arg1.filter )
	assert( f1_arg1.isHardcore ~= nil )
	local f1_local1 = f1_arg1.filter
	local f1_local2 = f1_arg1.isHardcore
	local f1_local3 = {
		title = Engine.Localize( "MENU_FILTER_OPTIONS_CAPS" ),
		width = _1080p * 500,
		defaultFocusIndex = 1,
		cancelClosesPopup = true,
		listContent = {}
	}
	local f1_local4 = nil
	f1_local4 = MenuBuilder.BuildRegisteredType( "GenericArrowButton", {
		controllerIndex = f1_local0
	} )
	f1_local4.id = "GroupButton"
	f1_local4.Title:setText( ToUpperCase( Engine.Localize( Leaderboards.FilterButtonFeeders.Group.title ) ), 0 )
	f1_local4:SetAnchors( 0, 1, 1, 0, 0 )
	f1_local4:SetLeft( _1080p * 0, 0 )
	f1_local4:SetRight( _1080p * 500, 0 )
	f1_local4:SetTop( _1080p * 0, 0 )
	f1_local4:SetBottom( _1080p * 35, 0 )
	LUI.AddUIArrowTextButtonLogic( f1_local4, f1_local0, Leaderboards.FilterButtonFeeders.Group.feeder( f1_local4, f1_local0, f1_local1 ) )
	table.insert( f1_local3.listContent, f1_local4 )
	local f1_local5 = nil
	if Leaderboards.GetLeaderboardHasHardcoreMode( f1_arg1.leaderboard ) then
		f1_local5 = MenuBuilder.BuildRegisteredType( "GenericArrowButton", {
			controllerIndex = f1_local0
		} )
		f1_local5.id = "HardcoreButton"
		f1_local5.Title:setText( ToUpperCase( Engine.Localize( Leaderboards.FilterButtonFeeders.Hardcore.title ) ), 0 )
		f1_local5:SetAnchors( 0, 1, 1, 0, 0 )
		f1_local5:SetLeft( _1080p * 0, 0 )
		f1_local5:SetRight( _1080p * 500, 0 )
		f1_local5:SetTop( _1080p * 80, 0 )
		f1_local5:SetBottom( _1080p * 115, 0 )
		LUI.AddUIArrowTextButtonLogic( f1_local5, f1_local0, Leaderboards.FilterButtonFeeders.Hardcore.feeder( f1_local5, f1_local0, f1_local2 ) )
		table.insert( f1_local3.listContent, f1_local5 )
	end
	local f1_local6 = nil
	f1_local6 = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f1_local0
	} )
	f1_local6.id = "AcceptButton"
	f1_local6.Text:setText( ToUpperCase( Engine.Localize( "LUA_MENU_ACCEPT" ) ), 0 )
	f1_local6:SetAnchors( 0, 1, 1, 0, 0 )
	f1_local6:SetLeft( _1080p * 0, 0 )
	f1_local6:SetRight( _1080p * 500, 0 )
	f1_local6:SetTop( _1080p * 120, 0 )
	f1_local6:SetBottom( _1080p * 155, 0 )
	f1_local6:addEventHandler( "button_action", function ( f2_arg0, f2_arg1 )
		ACTIONS.LeaveMenu( f2_arg0 )
		local f2_local0 = f1_local4.filterType or f1_local1
		local f2_local1 = f1_local2
		if f1_local5 and f1_local5.isHardcore ~= nil then
			f2_local1 = f1_local5.isHardcore
		end
		f1_arg1.setFilterOptions( f2_local0, f2_local1 )
	end )
	table.insert( f1_local3.listContent, f1_local6 )
	local f1_local7 = nil
	local f1_local8 = MenuBuilder.BuildRegisteredType( "button_helper_text_main", {
		left_inset = 0,
		right_inset = -30,
		top_margin = 0,
		bottom_margin = 0,
		height = GenericFooterDims.Height,
		spacing = 5,
		background_alpha = 1,
		list_left_inset = 0,
		controllerIndex = f1_local0
	} )
	f1_local8.id = "ButtonHelperBar"
	f1_local8:SetAnchors( 0, 1, 1, 0, 0 )
	f1_local8:SetLeft( _1080p * 0, 0 )
	f1_local8:SetRight( _1080p * 500, 0 )
	f1_local8:SetTop( _1080p * -50, 0 )
	f1_local8:SetBottom( _1080p * 0, 0 )
	table.insert( f1_local3.listContent, f1_local8 )
	local f1_local9 = MenuBuilder.BuildRegisteredType( "PopupList", f1_local3 )
	f1_local9.id = "LeaderboardFilterPopup"
	f1_local9:AddButtonHelperTextToElement( f1_local8, {
		helper_text = Engine.Localize( "@MENU_CANCEL" ),
		button_ref = "button_secondary",
		side = "left",
		priority = 1,
		clickable = true
	} )
	return f1_local9
end )
f0_local1 = function ( f3_arg0, f3_arg1 )
	local f3_local0 = Engine.Localize( Leaderboards.GetLeaderboardTitle( f3_arg1 ) )
	if Engine.IsCoreMode() then
		f3_arg0.Title.MenuTitle:setText( f3_local0 )
		f3_arg0.Title.MenuBreadcrumbs:setText( ToUpperCase( Engine.Localize( "LUA_MENU_BREADCRUMB_2_ITEMS", "MENU_MULTIPLAYER", "LUA_MENU_PUBLIC_MATCH_CAPS" ) ) )
	else
		f3_arg0.CPMenuTitle.MenuTitle:setText( ToUpperCase( f3_local0 ) )
	end
end

f0_local2 = function ( f4_arg0, f4_arg1 )
	local f4_local0 = ToUpperCase( Engine.Localize( f4_arg1.Title ) )
	if Engine.IsCoreMode() then
		f4_arg0.Filter:setText( f4_local0 )
	else
		f4_arg0.CPFilter:setText( f4_local0 )
	end
end

local f0_local3 = function ( f5_arg0, f5_arg1, f5_arg2, f5_arg3, f5_arg4 )
	if f5_arg0._leaderboard == f5_arg2 and f5_arg0._filter == f5_arg3 and f5_arg0._isHardcore == f5_arg4 then
		return 
	else
		f5_arg0._leaderboard = f5_arg2
		f5_arg0._filter = f5_arg3
		f5_arg0._isHardcore = f5_arg4
		f5_arg0._autoScrolledToPlayer = false
		f5_arg0._populatedPlayerRow = false
		local f5_local0 = f5_arg0.LeaderboardContent:GetMaxVisibleRows()
		Leaderboards.Clear()
		Leaderboards.OpenLeaderboard( f5_arg0._leaderboard, f5_arg0._isHardcore )
		Leaderboards.Scroll( f5_arg1, f5_arg0._filter.Value, 0, f5_local0 )
		f0_local1( f5_arg0, f5_arg0._leaderboard )
		f0_local2( f5_arg0, f5_arg0._filter )
		f5_arg0.HeaderRow:CreateExtraColumns( f5_arg1, f5_arg2 )
		f5_arg0.PlayerRow:Populate( f5_arg1, f5_arg0._leaderboard, {} )
	end
end

local f0_local4 = function ( f6_arg0, f6_arg1 )
	f6_arg0.LeaderboardContent:SetNumRows( Leaderboards.GetNumRows() )
	f6_arg0.LeaderboardContent:RefreshContent()
	if not f6_arg0._autoScrolledToPlayer then
		local f6_local0 = Leaderboards.GetPlayerRowIndex()
		if f6_local0 then
			f6_arg0._autoScrolledToPlayer = true
			f6_arg0.LeaderboardContent:SetFocusedPosition( {
				x = 0,
				y = f6_local0
			}, true, true )
		end
	end
	if not f6_arg0._populatedPlayerRow then
		local f6_local0 = Leaderboards.GetPlayerRowData( f6_arg1 )
		if f6_local0 then
			f6_local0.Gamertag = Engine.GetLocalClientFullGamertag( f6_arg1 )
			local f6_local1 = f6_local0.Rank
			if f6_local1 then
				f6_local1 = #f6_local0.Rank > 0
			end
			f6_arg0._populatedPlayerRow = f6_local1
			f6_arg0.PlayerRow:Populate( f6_arg1, f6_arg0._leaderboard, f6_local0 )
		end
	end
end

local f0_local5 = function ( f7_arg0 )
	f7_arg0.LeaderboardContent:FocusFirstItem()
end

local f0_local6 = function ( f8_arg0, f8_arg1 )
	local f8_local0 = f8_arg0.LeaderboardContent:GetRowBoundaries()
	if f8_local0 then
		local f8_local1 = f8_local0 + f8_arg1
		f8_arg0.LeaderboardContent:SetTargetRow( f8_local1, true, true )
		f8_arg0.LeaderboardContent:SetFocusedPosition( {
			x = 0,
			y = f8_local1
		}, true, false )
	end
end

local f0_local7 = function ( f9_arg0 )
	f0_local6( f9_arg0, f9_arg0.LeaderboardContent:GetMaxVisibleRows() )
end

local f0_local8 = function ( f10_arg0 )
	f0_local6( f10_arg0, -f10_arg0.LeaderboardContent:GetMaxVisibleRows() )
end

function SetupButtonHelpers( f11_arg0 )
	f11_arg0:AddButtonHelperTextToElement( f11_arg0.ButtonHelperBar, {
		button_ref = "button_alt1",
		helper_text = "",
		side = "left"
	} )
	f11_arg0:AddButtonHelperTextToElement( f11_arg0.ButtonHelperBar, {
		button_ref = "button_left_trigger",
		helper_text = "",
		side = "left"
	} )
	f11_arg0:AddButtonHelperTextToElement( f11_arg0.ButtonHelperBar, {
		button_ref = "button_right_trigger",
		helper_text = "",
		side = "left"
	} )
	f11_arg0:AddButtonHelperTextToElement( f11_arg0.ButtonHelperBar, {
		button_ref = "button_home",
		helper_text = "",
		side = "left"
	} )
	f11_arg0:AddButtonHelperTextToElement( f11_arg0.ButtonHelperBar, {
		button_ref = "button_page_up",
		helper_text = "",
		side = "left"
	} )
	f11_arg0:AddButtonHelperTextToElement( f11_arg0.ButtonHelperBar, {
		button_ref = "button_page_down",
		helper_text = "",
		side = "left"
	} )
	if Engine.IsGamepadEnabled() == 1 then
		f11_arg0:AddButtonHelperTextToElement( f11_arg0.ButtonHelperBar, {
			helper_text = Engine.Localize( "@LUA_MENU_TOP" ),
			button_ref = "button_alt1",
			side = "left",
			priority = 2,
			clickable = true
		} )
		f11_arg0:AddButtonHelperTextToElement( f11_arg0.ButtonHelperBar, {
			helper_text = Engine.Localize( "@LUA_MENU_PAGE_UP" ),
			button_ref = "button_left_trigger",
			side = "left",
			priority = 7,
			clickable = true
		} )
		f11_arg0:AddButtonHelperTextToElement( f11_arg0.ButtonHelperBar, {
			helper_text = Engine.Localize( "@LUA_MENU_PAGE_DOWN" ),
			button_ref = "button_right_trigger",
			side = "left",
			priority = 8,
			clickable = true
		} )
	else
		f11_arg0:AddButtonHelperTextToElement( f11_arg0.ButtonHelperBar, {
			helper_text = Engine.Localize( "@LUA_MENU_TOP" ),
			button_ref = "button_home",
			side = "left",
			priority = 2,
			clickable = true
		} )
		f11_arg0:AddButtonHelperTextToElement( f11_arg0.ButtonHelperBar, {
			helper_text = Engine.Localize( "@LUA_MENU_PAGE_UP" ),
			button_ref = "button_page_up",
			side = "left",
			priority = 7,
			clickable = true
		} )
		f11_arg0:AddButtonHelperTextToElement( f11_arg0.ButtonHelperBar, {
			helper_text = Engine.Localize( "@LUA_MENU_PAGE_DOWN" ),
			button_ref = "button_page_down",
			side = "left",
			priority = 8,
			clickable = true
		} )
	end
end

local f0_local9 = function ( f12_arg0, f12_arg1, f12_arg2 )
	assert( f12_arg0.PlayerRow )
	assert( f12_arg0.bindButton )
	assert( f12_arg0.ButtonHelperBar )
	f0_local3( f12_arg0, f12_arg1, f12_arg2.leaderboardType or "Score", Leaderboards.Filters.Friends, false )
	f12_arg0.LeaderboardContent:SetSnapOnWrapEnabled( true )
	f12_arg0.LeaderboardContent.PositionChanged = function ( f13_arg0 )
		LUI.UIGrid.PositionChanged( f13_arg0 )
		local f13_local0, f13_local1 = f13_arg0:GetRowBoundaries()
		if not f13_local0 or not f13_local1 then
			f13_local0 = 0
			f13_local1 = f12_arg0.LeaderboardContent:GetMaxVisibleRows()
		end
		f12_arg0._pendingUpdate = not Leaderboards.Scroll( f12_arg1, f12_arg0._filter.Value, f13_local0, f13_local1 )
	end
	
	f12_arg0:addElement( LUI.UITimer.new( nil, {
		interval = 50,
		event = "refresh_leaderboard"
	} ) )
	f12_arg0:registerEventHandler( "refresh_leaderboard", function ( element, event )
		if element._pendingUpdate then
			element.LeaderboardContent:PositionChanged()
		end
	end )
	f12_arg0.LeaderboardContent:SetRefreshChild( function ( f15_arg0, f15_arg1, f15_arg2 )
		assert( f15_arg0.Row )
		f15_arg0.Row:Populate( f12_arg1, f12_arg0._leaderboard, Leaderboards.GetRowData( f12_arg1, f15_arg2 ) )
	end )
	f12_arg0:registerEventHandler( "leaderboard_fetch_complete", function ( element, event )
		f0_local4( element, f12_arg1 )
	end )
	f12_arg0.bindButton:addEventHandler( "button_alt1", function ( f17_arg0, f17_arg1 )
		f0_local5( f12_arg0 )
	end )
	f12_arg0.bindButton:addEventHandler( "button_alt2", function ( f18_arg0, f18_arg1 )
		local f18_local0 = f18_arg1.controller or f12_arg1
		LUI.FlowManager.RequestPopupMenu( f12_arg0, "LeaderboardFilterPopup", true, f18_local0, false, {
			leaderboard = f12_arg0._leaderboard,
			filter = f12_arg0._filter,
			isHardcore = f12_arg0._isHardcore,
			setFilterOptions = function ( f19_arg0, f19_arg1 )
				f0_local3( f12_arg0, f18_local0, f12_arg0._leaderboard, f19_arg0, f19_arg1 )
			end
		}, nil, true )
	end )
	f12_arg0.bindButton:addEventHandler( "button_left_trigger", function ( f20_arg0, f20_arg1 )
		f0_local8( f12_arg0 )
	end )
	f12_arg0.bindButton:addEventHandler( "button_right_trigger", function ( f21_arg0, f21_arg1 )
		local f21_local0 = f21_arg1.controller or f12_arg1
		f0_local7( f12_arg0 )
	end )
	f12_arg0:addEventHandler( "gamepad_button", function ( f22_arg0, f22_arg1 )
		if not f22_arg1.down then
			return 
		else
			local f22_local0 = f22_arg1.button == "page_up"
			local f22_local1 = f22_arg1.button == "page_down"
			if f22_local0 then
				return f0_local8( f12_arg0 )
			elseif f22_local1 then
				return f0_local7( f12_arg0 )
			elseif f22_arg1.button == "home" then
				f0_local5( f12_arg0 )
				return true
			else
				return false
			end
		end
	end )
	SetupButtonHelpers( f12_arg0 )
	f12_arg0:addEventHandler( "refresh_button_helper", SetupButtonHelpers )
	local f12_local0 = f12_arg0.Filter
	if CONDITIONS.IsThirdGameMode() then
		f12_local0 = f12_arg0.CPFilter
	end
	f12_local0:SetShadowUOffset( -0 )
	f12_local0:SetShadowVOffset( -0 )
	if Engine.IsCoreMode() then
		local self = LUI.UIElement.new( {
			worldBlur = 5
		} )
		self:setupWorldBlur()
		self.id = "blur"
		f12_arg0:addElement( self )
	end
end

function LeaderboardMenu( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "LeaderboardMenu"
	self._animationSets = {}
	self._sequences = {}
	local f23_local1 = controller and controller.controllerIndex
	if not f23_local1 and not Engine.InFrontend() then
		f23_local1 = self:getRootController()
	end
	assert( f23_local1 )
	self:playSound( "menu_open" )
	local f23_local2 = self
	local f23_local3 = nil
	if CONDITIONS.InFrontendPublicMP( self ) then
		f23_local3 = LUI.UIImage.new()
		f23_local3.id = "TitleBg"
		f23_local3:SetRGBFromInt( 0, 0 )
		f23_local3:SetAlpha( 0.5, 0 )
		f23_local3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 1330, _1080p * 154, _1080p * 200 )
		self:addElement( f23_local3 )
		self.TitleBg = f23_local3
	end
	local PlayerRow = nil
	
	PlayerRow = MenuBuilder.BuildRegisteredType( "LeaderboardRow", {
		controllerIndex = f23_local1
	} )
	PlayerRow.id = "PlayerRow"
	PlayerRow.HighlightBar:SetTop( _1080p * 39, 0 )
	PlayerRow.HighlightBar:SetBottom( _1080p * 0, 0 )
	PlayerRow:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 1330, _1080p * 256, _1080p * 295 )
	self:addElement( PlayerRow )
	self.PlayerRow = PlayerRow
	
	local f23_local5 = nil
	if CONDITIONS.IsCoreMultiplayer( self ) then
		f23_local5 = LUI.UIStyledText.new()
		f23_local5.id = "Filter"
		f23_local5:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_ALL_TIME" ) ), 0 )
		f23_local5:SetFontSize( 36 * _1080p )
		f23_local5:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
		f23_local5:SetAlignment( LUI.Alignment.Left )
		f23_local5:SetShadowMinDistance( -0.2, 0 )
		f23_local5:SetShadowMaxDistance( 0.2, 0 )
		f23_local5:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 147, _1080p * 1330, _1080p * 159, _1080p * 195 )
		self:addElement( f23_local5 )
		self.Filter = f23_local5
	end
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f23_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1920, _1080p * 995, _1080p * 1080 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local HeaderRow = nil
	
	HeaderRow = MenuBuilder.BuildRegisteredType( "LeaderboardHeaderRow", {
		controllerIndex = f23_local1
	} )
	HeaderRow.id = "HeaderRow"
	HeaderRow:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 1330, _1080p * 216, _1080p * 256 )
	self:addElement( HeaderRow )
	self.HeaderRow = HeaderRow
	
	local f23_local8 = nil
	if CONDITIONS.IsCoreMultiplayer( self ) then
		f23_local8 = MenuBuilder.BuildRegisteredType( "MenuTitle", {
			controllerIndex = f23_local1
		} )
		f23_local8.id = "Title"
		f23_local8.MenuTitle:setText( "", 0 )
		f23_local8.MenuBreadcrumbs:setText( "", 0 )
		f23_local8.Icon:SetTop( _1080p * -28.5, 0 )
		f23_local8.Icon:SetBottom( _1080p * 61.5, 0 )
		f23_local8:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
		self:addElement( f23_local8 )
		self.Title = f23_local8
	end
	local f23_local9 = nil
	if CONDITIONS.IsThirdGameMode( self ) then
		f23_local9 = MenuBuilder.BuildRegisteredType( "CPMenuTitle", {
			controllerIndex = f23_local1
		} )
		f23_local9.id = "CPMenuTitle"
		f23_local9.MenuTitle:setText( "", 0 )
		f23_local9:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
		self:addElement( f23_local9 )
		self.CPMenuTitle = f23_local9
	end
	local f23_local10 = nil
	if CONDITIONS.IsThirdGameMode( self ) then
		f23_local10 = LUI.UIStyledText.new()
		f23_local10.id = "CPFilter"
		f23_local10:SetRGBFromTable( SWATCHES.Zombies.menuHeader, 0 )
		f23_local10:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_ALL_TIME" ) ), 0 )
		f23_local10:SetFontSize( 64 * _1080p )
		f23_local10:SetFont( FONTS.GetFont( FONTS.ZmClean.File ) )
		f23_local10:SetAlignment( LUI.Alignment.Left )
		f23_local10:SetShadowMinDistance( -0.2, 0 )
		f23_local10:SetShadowMaxDistance( 0.2, 0 )
		f23_local10:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -590, _1080p * 590, _1080p * 136, _1080p * 200 )
		self:addElement( f23_local10 )
		self.CPFilter = f23_local10
	end
	local Line = nil
	
	Line = MenuBuilder.BuildRegisteredType( "EmblemBoxLine", {
		controllerIndex = f23_local1
	} )
	Line.id = "Line"
	Line:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 130, _1080p * -590, _1080p * 200, _1080p * 204 )
	self:addElement( Line )
	self.Line = Line
	
	local LeaderboardContent = nil
	
	LeaderboardContent = LUI.UIGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 15,
		controllerIndex = f23_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "LeaderboardRowButton", {
				controllerIndex = f23_local1
			} )
		end,
		refreshChild = function ( f25_arg0, f25_arg1, f25_arg2 )
			
		end,
		numRows = 15,
		numColumns = 1,
		wrapX = false,
		wrapY = true,
		spacingX = _1080p * 0,
		spacingY = _1080p * 0,
		columnWidth = _1080p * 1200,
		rowHeight = _1080p * 39,
		scrollingThresholdX = 1,
		scrollingThresholdY = 5,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	LeaderboardContent.id = "LeaderboardContent"
	LeaderboardContent:setUseStencil( true )
	LeaderboardContent:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 1330, _1080p * 309, _1080p * 894 )
	self:addElement( LeaderboardContent )
	self.LeaderboardContent = LeaderboardContent
	
	local LineCopy0 = nil
	
	LineCopy0 = MenuBuilder.BuildRegisteredType( "EmblemBoxLine", {
		controllerIndex = f23_local1
	} )
	LineCopy0.id = "LineCopy0"
	LineCopy0:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 130, _1080p * -590, _1080p * 153, _1080p * 157 )
	self:addElement( LineCopy0 )
	self.LineCopy0 = LineCopy0
	
	local LineCopy1 = nil
	
	LineCopy1 = MenuBuilder.BuildRegisteredType( "EmblemBoxLine", {
		controllerIndex = f23_local1
	} )
	LineCopy1.id = "LineCopy1"
	LineCopy1:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 130, _1080p * -590, _1080p * 308, _1080p * 312 )
	self:addElement( LineCopy1 )
	self.LineCopy1 = LineCopy1
	
	local LineCopy2 = nil
	
	LineCopy2 = MenuBuilder.BuildRegisteredType( "EmblemBoxLine", {
		controllerIndex = f23_local1
	} )
	LineCopy2.id = "LineCopy2"
	LineCopy2:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 130, _1080p * -590, _1080p * 893, _1080p * 897 )
	self:addElement( LineCopy2 )
	self.LineCopy2 = LineCopy2
	
	local LineCopy3 = nil
	
	LineCopy3 = MenuBuilder.BuildRegisteredType( "EmblemBoxLine", {
		controllerIndex = f23_local1
	} )
	LineCopy3.id = "LineCopy3"
	LineCopy3:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 130, _1080p * -590, _1080p * 294, _1080p * 297 )
	self:addElement( LineCopy3 )
	self.LineCopy3 = LineCopy3
	
	local SocialFeed = nil
	
	SocialFeed = MenuBuilder.BuildRegisteredType( "SocialFeed", {
		controllerIndex = f23_local1
	} )
	SocialFeed.id = "SocialFeed"
	SocialFeed:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1920, _1080p * 965, _1080p * 995 )
	self:addElement( SocialFeed )
	self.SocialFeed = SocialFeed
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
	end
	
	self._animationSets.CP = function ()
		PlayerRow:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.PlayerRow:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -600, _1080p * 600, _1080p * 301, _1080p * 340, 0 )
				end
			}
		} )
		if CONDITIONS.IsCoreMultiplayer( self ) then
			f23_local5:RegisterAnimationSequence( "DefaultSequence", {
				{
					function ()
						return self.Filter:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 672, _1080p * 1330, _1080p * 224, _1080p * 260, 0 )
					end
				}
			} )
		end
		HeaderRow:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.HeaderRow:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -600, _1080p * 600, _1080p * 260, _1080p * 300, 0 )
				end
			}
		} )
		if CONDITIONS.IsThirdGameMode( self ) then
			f23_local10:RegisterAnimationSequence( "DefaultSequence", {
				{
					function ()
						return self.CPFilter:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -600, _1080p * 600, _1080p * 200, _1080p * 264, 0 )
					end
				}
			} )
		end
		Line:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Line:SetAlpha( 0, 0 )
				end
			}
		} )
		LeaderboardContent:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.LeaderboardContent:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 360, _1080p * 1560, _1080p * 350, _1080p * 935, 0 )
				end
			}
		} )
		LineCopy0:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.LineCopy0:SetAlpha( 0, 0 )
				end
			}
		} )
		LineCopy1:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.LineCopy1:SetAlpha( 0, 0 )
				end
			}
		} )
		LineCopy2:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.LineCopy2:SetAlpha( 0, 0 )
				end
			}
		} )
		LineCopy3:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.LineCopy3:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			PlayerRow:AnimateSequence( "DefaultSequence" )
			if CONDITIONS.IsCoreMultiplayer( self ) then
				f23_local5:AnimateSequence( "DefaultSequence" )
			end
			HeaderRow:AnimateSequence( "DefaultSequence" )
			if CONDITIONS.IsThirdGameMode( self ) then
				f23_local10:AnimateSequence( "DefaultSequence" )
			end
			Line:AnimateSequence( "DefaultSequence" )
			LeaderboardContent:AnimateSequence( "DefaultSequence" )
			LineCopy0:AnimateSequence( "DefaultSequence" )
			LineCopy1:AnimateSequence( "DefaultSequence" )
			LineCopy2:AnimateSequence( "DefaultSequence" )
			LineCopy3:AnimateSequence( "DefaultSequence" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self.addButtonHelperFunction = function ( f40_arg0, f40_arg1 )
		f40_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			priority = 1,
			clickable = true
		} )
		f40_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_FILTERS" ),
			button_ref = "button_alt2",
			side = "left",
			priority = 3,
			clickable = true
		} )
	end
	
	self:addEventHandler( "menu_create", self.addButtonHelperFunction )
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	self.bindButton:addEventHandler( "button_secondary", function ( f41_arg0, f41_arg1 )
		local f41_local0 = f41_arg1.controller or f23_local1
		ACTIONS.LeaveMenu( self )
	end )
	f0_local9( self, f23_local1, controller )
	if CONDITIONS.IsThirdGameMode( self ) then
		ACTIONS.SetAnimationSet( self, "CP" )
	end
	return self
end

MenuBuilder.registerType( "LeaderboardMenu", LeaderboardMenu )
LockTable( _M )
