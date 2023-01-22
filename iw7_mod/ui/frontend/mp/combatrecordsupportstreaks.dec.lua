local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.Header )
	assert( f1_arg0.Header.ItemName )
	assert( f1_arg0.Header.ItemDescription )
	assert( f1_arg0.StreakImage )
	assert( f1_arg0.CombatRecordHeaderRow )
	assert( f1_arg0.UsedBox )
	assert( f1_arg0.UsedBox.Stat )
	assert( f1_arg0.MiscBox )
	assert( f1_arg0.MiscBox.Stat )
	assert( f1_arg0.MiscBox.StatTitle )
	assert( f1_arg0.StreakStatsRows )
	local f1_local0 = Cac.GetSupportStreakStats( f1_arg1 )
	f1_arg0.StreakStatsRows:SetRefreshChild( function ( f2_arg0, f2_arg1, f2_arg2 )
		f2_arg0:SetupSupportStreakRowData( f1_local0[f2_arg2 + 1] )
	end )
	f1_arg0.StreakStatsRows:SetNumRows( #f1_local0 )
	f1_arg0.StreakStatsRows:RefreshContent()
	f1_arg0:addEventHandler( "update_record_item", function ( f3_arg0, f3_arg1 )
		f1_arg0.UsedBox.Stat:setText( f3_arg1.currentItem.uses )
		if #f3_arg1.currentItem.extraRecordType > 0 then
			f1_arg0.MiscBox:SetAlpha( 1 )
			f1_arg0.MiscBox.StatTitle:setText( ToUpperCase( f3_arg1.currentItem.extraRecordType ) )
			f1_arg0.MiscBox.Stat:setText( f3_arg1.currentItem.extraStat1 )
		else
			f1_arg0.MiscBox:SetAlpha( 0 )
		end
		f1_arg0.Header.ItemName:setText( f3_arg1.currentItem.name )
		f1_arg0.Header.ItemDescription:setText( Engine.Localize( f3_arg1.currentItem.desc ) )
		f1_arg0.StreakImage:setImage( RegisterMaterial( f3_arg1.currentItem.image ) )
		ACTIONS.AnimateSequence( f1_arg0, "UpdateImage" )
		ACTIONS.AnimateSequenceByElement( f1_arg0, {
			elementName = "Header",
			sequenceName = "UpdateDescription",
			elementPath = "Header"
		} )
		return true
	end )
	f1_arg0.CombatRecordHeaderRow:SetupHeader( {
		"MENU_STREAK",
		"LUA_MENU_MP_USED"
	} )
	local self = LUI.UIElement.new( {
		worldBlur = 5
	} )
	self:setupWorldBlur()
	self.id = "blur"
	f1_arg0:addElement( self )
	f1_arg0.MenuTitle.MenuBreadcrumbs:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_BREADCRUMB_3_ITEMS", "MENU_MULTIPLAYER", "LUA_MENU_PUBLIC_MATCH_CAPS", "LUA_MENU_COMBAT_RECORD" ) ) )
end

function CombatRecordSupportStreaks( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "CombatRecordSupportStreaks"
	self._animationSets = {}
	self._sequences = {}
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local ListBlur = nil
	
	ListBlur = LUI.UIBlur.new()
	ListBlur.id = "ListBlur"
	ListBlur:SetBlurStrength( 1.5, 0 )
	ListBlur:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 796, _1080p * 407, _1080p * 446 )
	self:addElement( ListBlur )
	self.ListBlur = ListBlur
	
	local ListBackground = nil
	
	ListBackground = LUI.UIImage.new()
	ListBackground.id = "ListBackground"
	ListBackground:SetRGBFromInt( 0, 0 )
	ListBackground:SetAlpha( 0.8, 0 )
	ListBackground:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 796, _1080p * 407, _1080p * 446 )
	self:addElement( ListBackground )
	self.ListBackground = ListBackground
	
	local StreakStatsRows = nil
	
	StreakStatsRows = LUI.UIGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 4,
		controllerIndex = f4_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "CombatRecordRow", {
				controllerIndex = f4_local1
			} )
		end,
		refreshChild = function ( f6_arg0, f6_arg1, f6_arg2 )
			
		end,
		numRows = 4,
		numColumns = 1,
		wrapX = false,
		wrapY = true,
		spacingX = _1080p * 2,
		spacingY = _1080p * 2,
		columnWidth = _1080p * 1000,
		rowHeight = _1080p * 39,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	StreakStatsRows.id = "StreakStatsRows"
	StreakStatsRows:setUseStencil( true )
	StreakStatsRows:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 796, _1080p * 239, _1080p * 401 )
	self:addElement( StreakStatsRows )
	self.StreakStatsRows = StreakStatsRows
	
	local MenuTitle = nil
	
	MenuTitle = MenuBuilder.BuildRegisteredType( "MenuTitle", {
		controllerIndex = f4_local1
	} )
	MenuTitle.id = "MenuTitle"
	MenuTitle.MenuTitle:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_SUPPORT_STREAKS" ) ), 0 )
	MenuTitle.MenuBreadcrumbs:setText( ToUpperCase( "" ), 0 )
	MenuTitle.Icon:SetTop( _1080p * -28.5, 0 )
	MenuTitle.Icon:SetBottom( _1080p * 61.5, 0 )
	MenuTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1045, _1080p * 54, _1080p * 134 )
	self:addElement( MenuTitle )
	self.MenuTitle = MenuTitle
	
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f4_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local SocialFeed = nil
	
	SocialFeed = MenuBuilder.BuildRegisteredType( "SocialFeed", {
		controllerIndex = f4_local1
	} )
	SocialFeed.id = "SocialFeed"
	SocialFeed:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1920, _1080p * 965, _1080p * 995 )
	self:addElement( SocialFeed )
	self.SocialFeed = SocialFeed
	
	local CRMMain = nil
	
	CRMMain = MenuBuilder.BuildRegisteredType( "CRMMain", {
		controllerIndex = f4_local1
	} )
	CRMMain.id = "CRMMain"
	CRMMain:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 136, _1080p * 447, _1080p * 745, _1080p * 1069 )
	self:addElement( CRMMain )
	self.CRMMain = CRMMain
	
	local Friends = nil
	
	Friends = MenuBuilder.BuildRegisteredType( "online_friends_widget", {
		controllerIndex = f4_local1
	} )
	Friends.id = "Friends"
	Friends:SetFont( FONTS.GetFont( FONTS.Dev.File ) )
	Friends:SetAlignment( LUI.Alignment.Left )
	Friends:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1420, _1080p * 1920, _1080p * 1015, _1080p * 1060 )
	self:addElement( Friends )
	self.Friends = Friends
	
	local ListCount = nil
	
	ListCount = LUI.UIText.new()
	ListCount.id = "ListCount"
	ListCount:setText( "1/15", 0 )
	ListCount:SetFontSize( 24 * _1080p )
	ListCount:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ListCount:SetAlignment( LUI.Alignment.Center )
	ListCount:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 374.5, _1080p * 519.5, _1080p * 414.5, _1080p * 438.5 )
	self:addElement( ListCount )
	self.ListCount = ListCount
	
	local ArrowDown = nil
	
	ArrowDown = MenuBuilder.BuildRegisteredType( "ArrowDown", {
		controllerIndex = f4_local1
	} )
	ArrowDown.id = "ArrowDown"
	ArrowDown:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 374.5, _1080p * 394.5, _1080p * 408.5, _1080p * 448.5 )
	self:addElement( ArrowDown )
	self.ArrowDown = ArrowDown
	
	local ArrowUp = nil
	
	ArrowUp = MenuBuilder.BuildRegisteredType( "ArrowUp", {
		controllerIndex = f4_local1
	} )
	ArrowUp.id = "ArrowUp"
	ArrowUp:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 499.5, _1080p * 519.5, _1080p * 408.5, _1080p * 448.5 )
	self:addElement( ArrowUp )
	self.ArrowUp = ArrowUp
	
	local VerticalMinimalScrollbar = nil
	
	VerticalMinimalScrollbar = MenuBuilder.BuildRegisteredType( "VerticalMinimalScrollbar", {
		controllerIndex = f4_local1
	} )
	VerticalMinimalScrollbar.id = "VerticalMinimalScrollbar"
	VerticalMinimalScrollbar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 76, _1080p * 92, _1080p * 239, _1080p * 401 )
	self:addElement( VerticalMinimalScrollbar )
	self.VerticalMinimalScrollbar = VerticalMinimalScrollbar
	
	local CombatRecordHeaderRow = nil
	
	CombatRecordHeaderRow = MenuBuilder.BuildRegisteredType( "CombatRecordHeaderRow", {
		controllerIndex = f4_local1
	} )
	CombatRecordHeaderRow.id = "CombatRecordHeaderRow"
	CombatRecordHeaderRow:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 796, _1080p * 200, _1080p * 239 )
	self:addElement( CombatRecordHeaderRow )
	self.CombatRecordHeaderRow = CombatRecordHeaderRow
	
	local Header = nil
	
	Header = MenuBuilder.BuildRegisteredType( "CACItemHeader", {
		controllerIndex = f4_local1
	} )
	Header.id = "Header"
	Header.ItemDescription:SetRight( _1080p * 750, 0 )
	Header.ItemDescription:setText( Engine.Localize( "MENU_NEW" ), 0 )
	Header.ItemName:setText( Engine.Localize( "MENU_NEW" ), 0 )
	Header.ItemName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Header:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 922, _1080p * 1920, _1080p * 200, _1080p * 300 )
	self:addElement( Header )
	self.Header = Header
	
	local UsedBox = nil
	
	UsedBox = MenuBuilder.BuildRegisteredType( "CombatRecordStatBox", {
		controllerIndex = f4_local1
	} )
	UsedBox.id = "UsedBox"
	UsedBox.StatTitle:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_USED" ) ), 0 )
	UsedBox:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 930, _1080p * 1230, _1080p * 380, _1080p * 560 )
	self:addElement( UsedBox )
	self.UsedBox = UsedBox
	
	local MiscBox = nil
	
	MiscBox = MenuBuilder.BuildRegisteredType( "CombatRecordStatBox", {
		controllerIndex = f4_local1
	} )
	MiscBox.id = "MiscBox"
	MiscBox.StatTitle:setText( ToUpperCase( Engine.Localize( "LUA_MENU_ASSISTS" ) ), 0 )
	MiscBox:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 930, _1080p * 1230, _1080p * 560, _1080p * 740 )
	self:addElement( MiscBox )
	self.MiscBox = MiscBox
	
	local StreakImage = nil
	
	StreakImage = LUI.UIImage.new()
	StreakImage.id = "StreakImage"
	StreakImage:SetDotPitchEnabled( true )
	StreakImage:SetDotPitchX( 0, 0 )
	StreakImage:SetDotPitchY( 0, 0 )
	StreakImage:SetDotPitchContrast( 0, 0 )
	StreakImage:SetDotPitchMode( 0 )
	StreakImage:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1390, _1080p * 1750, _1080p * 467, _1080p * 827 )
	self:addElement( StreakImage )
	self.StreakImage = StreakImage
	
	local MissionTeamInfo = nil
	
	MissionTeamInfo = MenuBuilder.BuildRegisteredType( "MissionTeamInfo", {
		controllerIndex = f4_local1
	} )
	MissionTeamInfo.id = "MissionTeamInfo"
	MissionTeamInfo:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -700, 0, _1080p * 54, _1080p * 142 )
	self:addElement( MissionTeamInfo )
	self.MissionTeamInfo = MissionTeamInfo
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		StreakImage:RegisterAnimationSequence( "UpdateImage", {
			{
				function ()
					return self.StreakImage:SetAlpha( 0, 0 )
				end,
				function ()
					return self.StreakImage:SetAlpha( 1, 30 )
				end,
				function ()
					return self.StreakImage:SetAlpha( 0, 30 )
				end,
				function ()
					return self.StreakImage:SetAlpha( 1, 30 )
				end,
				function ()
					return self.StreakImage:SetAlpha( 0, 30 )
				end,
				function ()
					return self.StreakImage:SetAlpha( 1, 30 )
				end
			},
			{
				function ()
					return self.StreakImage:SetDotPitchX( 52, 0 )
				end,
				function ()
					return self.StreakImage:SetDotPitchX( 0, 300 )
				end
			},
			{
				function ()
					return self.StreakImage:SetDotPitchY( 43, 0 )
				end,
				function ()
					return self.StreakImage:SetDotPitchY( 0, 300 )
				end
			},
			{
				function ()
					return self.StreakImage:SetDotPitchContrast( 0.8, 0 )
				end,
				function ()
					return self.StreakImage:SetDotPitchContrast( 0, 300 )
				end
			}
		} )
		self._sequences.UpdateImage = function ()
			StreakImage:AnimateSequence( "UpdateImage" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	local f4_local21 = LUI.UIScrollbar.new
	local bindButton = {
		direction = LUI.DIRECTION.vertical,
		eventListener = VerticalMinimalScrollbar,
		startCap = VerticalMinimalScrollbar.startCap,
		endCap = VerticalMinimalScrollbar.endCap
	}
	local f4_local23 = VerticalMinimalScrollbar.sliderArea
	if f4_local23 then
		f4_local23 = VerticalMinimalScrollbar.sliderArea.slider
	end
	bindButton.slider = f4_local23
	f4_local23 = VerticalMinimalScrollbar.sliderArea
	if f4_local23 then
		f4_local23 = VerticalMinimalScrollbar.sliderArea.fixedSizeSlider
	end
	bindButton.fixedSizeSlider = f4_local23
	StreakStatsRows:AddScrollbar( f4_local21( bindButton ) )
	StreakStatsRows:AddArrow( ArrowUp )
	StreakStatsRows:AddArrow( ArrowDown )
	StreakStatsRows:AddItemNumbers( ListCount )
	self.addButtonHelperFunction = function ( f22_arg0, f22_arg1 )
		f22_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			priority = -10,
			clickable = true
		} )
	end
	
	self:addEventHandler( "menu_create", self.addButtonHelperFunction )
	
	bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	self.bindButton:addEventHandler( "button_secondary", function ( f23_arg0, f23_arg1 )
		local f23_local0 = f23_arg1.controller or f4_local1
		ACTIONS.LeaveMenu( self )
	end )
	f0_local0( self, f4_local1, controller )
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "CRMMain",
		sequenceName = "Minimize",
		elementPath = "CRMMain"
	} )
	return self
end

MenuBuilder.registerType( "CombatRecordSupportStreaks", CombatRecordSupportStreaks )
LockTable( _M )
