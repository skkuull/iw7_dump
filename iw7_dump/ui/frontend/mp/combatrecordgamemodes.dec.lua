local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.GenericItemInfo )
	assert( f1_arg0.GenericItemInfo.HeaderText )
	assert( f1_arg0.GenericItemInfo.BodyText )
	assert( f1_arg0.ModeImage )
	assert( f1_arg0.CombatRecordHeaderRow )
	assert( f1_arg0.GameModeStatsRows )
	local f1_local0 = MP.GetGameModeStats( f1_arg1 )
	f1_arg0.GameModeStatsRows:SetRefreshChild( function ( f2_arg0, f2_arg1, f2_arg2 )
		f2_arg0:SetupGameModeRowData( f1_local0[f2_arg2 + 1] )
	end )
	f1_arg0.GameModeStatsRows:SetNumRows( #f1_local0 )
	f1_arg0.GameModeStatsRows:RefreshContent()
	f1_arg0:addEventHandler( "update_record_item", function ( f3_arg0, f3_arg1 )
		f1_arg0.GenericItemInfo.HeaderText:setText( f3_arg1.currentItem.name )
		f1_arg0.GenericItemInfo.BodyText:setText( f3_arg1.currentItem.desc )
		f1_arg0.ModeImage:setImage( RegisterMaterial( f3_arg1.currentItem.image ) )
		ACTIONS.AnimateSequence( f1_arg0, "UpdateImage" )
		return true
	end )
	f1_arg0.CombatRecordHeaderRow:SetupHeader( {
		"MENU_GAME_TYPES",
		"LUA_MENU_SCORE",
		"LUA_MENU_TIME_PLAYED",
		"MENU_KILLS",
		"LUA_MENU_KD_RATIO",
		"LUA_MENU_MP_SPM"
	} )
	local self = LUI.UIElement.new( {
		worldBlur = 5
	} )
	self:setupWorldBlur()
	self.id = "blur"
	f1_arg0:addElement( self )
	f1_arg0.GenericItemInfo.HeaderText:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 18, _1080p * -18, _1080p * 10, _1080p * 55 )
	f1_arg0.MenuTitle.MenuBreadcrumbs:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_BREADCRUMB_3_ITEMS", "MENU_MULTIPLAYER", "LUA_MENU_PUBLIC_MATCH_CAPS", "LUA_MENU_COMBAT_RECORD" ) ) )
end

function CombatRecordGameModes( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "CombatRecordGameModes"
	self._animationSets = {}
	self._sequences = {}
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local GameModeStatsRows = nil
	
	GameModeStatsRows = LUI.UIGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 12,
		controllerIndex = f4_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "CombatRecordRow", {
				controllerIndex = f4_local1
			} )
		end,
		refreshChild = function ( f6_arg0, f6_arg1, f6_arg2 )
			
		end,
		numRows = 12,
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
	GameModeStatsRows.id = "GameModeStatsRows"
	GameModeStatsRows:setUseStencil( true )
	GameModeStatsRows:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1096, _1080p * 246, _1080p * 736 )
	self:addElement( GameModeStatsRows )
	self.GameModeStatsRows = GameModeStatsRows
	
	local Border = nil
	
	Border = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 5,
		borderThicknessRight = _1080p * 5,
		borderThicknessTop = _1080p * 5,
		borderThicknessBottom = _1080p * 5
	} )
	Border.id = "Border"
	Border:SetRGBFromInt( 0, 0 )
	Border:SetZRotation( 45, 0 )
	Border:SetBorderThicknessLeft( _1080p * 5, 0 )
	Border:SetBorderThicknessRight( _1080p * 5, 0 )
	Border:SetBorderThicknessTop( _1080p * 5, 0 )
	Border:SetBorderThicknessBottom( _1080p * 5, 0 )
	Border:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1373, _1080p * 1680, _1080p * 337.5, _1080p * 644.5 )
	self:addElement( Border )
	self.Border = Border
	
	local ListBlur = nil
	
	ListBlur = LUI.UIBlur.new()
	ListBlur.id = "ListBlur"
	ListBlur:SetBlurStrength( 1.5, 0 )
	ListBlur:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1096, _1080p * 742, _1080p * 781 )
	self:addElement( ListBlur )
	self.ListBlur = ListBlur
	
	local ListBackground = nil
	
	ListBackground = LUI.UIImage.new()
	ListBackground.id = "ListBackground"
	ListBackground:SetRGBFromInt( 0, 0 )
	ListBackground:SetAlpha( 0.8, 0 )
	ListBackground:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1096, _1080p * 742, _1080p * 781 )
	self:addElement( ListBackground )
	self.ListBackground = ListBackground
	
	local MenuTitle = nil
	
	MenuTitle = MenuBuilder.BuildRegisteredType( "MenuTitle", {
		controllerIndex = f4_local1
	} )
	MenuTitle.id = "MenuTitle"
	MenuTitle.MenuTitle:setText( ToUpperCase( Engine.Localize( "MENU_GAME_TYPES" ) ), 0 )
	MenuTitle.MenuBreadcrumbs:setText( ToUpperCase( "" ), 0 )
	MenuTitle.Icon:SetTop( _1080p * -28.5, 0 )
	MenuTitle.Icon:SetBottom( _1080p * 61.5, 0 )
	MenuTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1045, _1080p * 54, _1080p * 134 )
	self:addElement( MenuTitle )
	self.MenuTitle = MenuTitle
	
	local MissionTeamInfo = nil
	
	MissionTeamInfo = MenuBuilder.BuildRegisteredType( "MissionTeamInfo", {
		controllerIndex = f4_local1
	} )
	MissionTeamInfo.id = "MissionTeamInfo"
	MissionTeamInfo:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -700, 0, _1080p * 54, _1080p * 142 )
	self:addElement( MissionTeamInfo )
	self.MissionTeamInfo = MissionTeamInfo
	
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
	
	local ModeImage = nil
	
	ModeImage = LUI.UIImage.new()
	ModeImage.id = "ModeImage"
	ModeImage:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1344, _1080p * 1709, _1080p * 308.5, _1080p * 673.5 )
	self:addElement( ModeImage )
	self.ModeImage = ModeImage
	
	local ListCount = nil
	
	ListCount = LUI.UIText.new()
	ListCount.id = "ListCount"
	ListCount:setText( "1/15", 0 )
	ListCount:SetFontSize( 24 * _1080p )
	ListCount:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ListCount:SetAlignment( LUI.Alignment.Center )
	ListCount:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 496.5, _1080p * 641.5, _1080p * 749.5, _1080p * 773.5 )
	self:addElement( ListCount )
	self.ListCount = ListCount
	
	local ArrowDown = nil
	
	ArrowDown = MenuBuilder.BuildRegisteredType( "ArrowDown", {
		controllerIndex = f4_local1
	} )
	ArrowDown.id = "ArrowDown"
	ArrowDown:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 496.5, _1080p * 516.5, _1080p * 743.5, _1080p * 783.5 )
	self:addElement( ArrowDown )
	self.ArrowDown = ArrowDown
	
	local ArrowUp = nil
	
	ArrowUp = MenuBuilder.BuildRegisteredType( "ArrowUp", {
		controllerIndex = f4_local1
	} )
	ArrowUp.id = "ArrowUp"
	ArrowUp:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 621.5, _1080p * 641.5, _1080p * 743.5, _1080p * 783.5 )
	self:addElement( ArrowUp )
	self.ArrowUp = ArrowUp
	
	local VerticalMinimalScrollbar = nil
	
	VerticalMinimalScrollbar = MenuBuilder.BuildRegisteredType( "VerticalMinimalScrollbar", {
		controllerIndex = f4_local1
	} )
	VerticalMinimalScrollbar.id = "VerticalMinimalScrollbar"
	VerticalMinimalScrollbar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 76, _1080p * 92, _1080p * 246, _1080p * 736 )
	self:addElement( VerticalMinimalScrollbar )
	self.VerticalMinimalScrollbar = VerticalMinimalScrollbar
	
	local CombatRecordHeaderRow = nil
	
	CombatRecordHeaderRow = MenuBuilder.BuildRegisteredType( "CombatRecordHeaderRow", {
		controllerIndex = f4_local1
	} )
	CombatRecordHeaderRow.id = "CombatRecordHeaderRow"
	CombatRecordHeaderRow:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1096, _1080p * 200, _1080p * 239 )
	self:addElement( CombatRecordHeaderRow )
	self.CombatRecordHeaderRow = CombatRecordHeaderRow
	
	local GenericItemInfo = nil
	
	GenericItemInfo = MenuBuilder.BuildRegisteredType( "GenericItemInfo", {
		controllerIndex = f4_local1
	} )
	GenericItemInfo.id = "GenericItemInfo"
	GenericItemInfo.BodyText:setText( "", 0 )
	GenericItemInfo.HeaderText:setText( ToUpperCase( "" ), 0 )
	GenericItemInfo:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 1133, 0, _1080p * -336.5, _1080p * -190.5 )
	self:addElement( GenericItemInfo )
	self.GenericItemInfo = GenericItemInfo
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Border:RegisterAnimationSequence( "UpdateImage", {
			{
				function ()
					return self.Border:SetScale( -0.5, 0 )
				end,
				function ()
					return self.Border:SetScale( 0, 400, LUI.EASING.outBack )
				end
			}
		} )
		ModeImage:RegisterAnimationSequence( "UpdateImage", {
			{
				function ()
					return self.ModeImage:SetScale( -0.5, 0 )
				end,
				function ()
					return self.ModeImage:SetScale( 0, 300, LUI.EASING.outBack )
				end
			}
		} )
		self._sequences.UpdateImage = function ()
			Border:AnimateSequence( "UpdateImage" )
			ModeImage:AnimateSequence( "UpdateImage" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	local f4_local20 = LUI.UIScrollbar.new
	local bindButton = {
		direction = LUI.DIRECTION.vertical,
		eventListener = VerticalMinimalScrollbar,
		startCap = VerticalMinimalScrollbar.startCap,
		endCap = VerticalMinimalScrollbar.endCap
	}
	local f4_local22 = VerticalMinimalScrollbar.sliderArea
	if f4_local22 then
		f4_local22 = VerticalMinimalScrollbar.sliderArea.slider
	end
	bindButton.slider = f4_local22
	f4_local22 = VerticalMinimalScrollbar.sliderArea
	if f4_local22 then
		f4_local22 = VerticalMinimalScrollbar.sliderArea.fixedSizeSlider
	end
	bindButton.fixedSizeSlider = f4_local22
	GameModeStatsRows:AddScrollbar( f4_local20( bindButton ) )
	GameModeStatsRows:AddArrow( ArrowUp )
	GameModeStatsRows:AddArrow( ArrowDown )
	GameModeStatsRows:AddItemNumbers( ListCount )
	self.addButtonHelperFunction = function ( f14_arg0, f14_arg1 )
		f14_arg0:AddButtonHelperText( {
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
	
	self.bindButton:addEventHandler( "button_secondary", function ( f15_arg0, f15_arg1 )
		local f15_local0 = f15_arg1.controller or f4_local1
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

MenuBuilder.registerType( "CombatRecordGameModes", CombatRecordGameModes )
LockTable( _M )
