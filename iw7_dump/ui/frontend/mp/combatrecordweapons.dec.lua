local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.CACItemHeader )
	assert( f1_arg0.CACItemHeader.ItemName )
	assert( f1_arg0.CACItemHeader.ItemDescription )
	assert( f1_arg0.WeaponImage )
	assert( f1_arg0.CombatRecordHeaderRow )
	assert( f1_arg0.WeaponStatsRows )
	local f1_local0 = Cac.GetWeaponStatsTable( f1_arg1 )
	table.sort( f1_local0, function ( f2_arg0, f2_arg1 )
		return f2_arg1.kills < f2_arg0.kills
	end )
	f1_arg0.WeaponStatsRows:SetRefreshChild( function ( f3_arg0, f3_arg1, f3_arg2 )
		f3_arg0:SetupWeaponRowData( f1_local0[f3_arg2 + 1] )
	end )
	f1_arg0.WeaponStatsRows:SetNumRows( #f1_local0 )
	f1_arg0.WeaponStatsRows:RefreshContent()
	f1_arg0:addEventHandler( "update_record_item", function ( f4_arg0, f4_arg1 )
		local f4_local0 = Engine.TableLookup( CSV.weapons.file, CSV.weapons.cols.ref, f4_arg1.currentItem.ref, CSV.weapons.cols.desc )
		f1_arg0.CACItemHeader.ItemName:setText( f4_arg1.currentItem.name )
		f1_arg0.CACItemHeader.ItemDescription:setText( Engine.Localize( f4_local0 ) )
		f1_arg0.WeaponImage:setImage( RegisterMaterial( f4_arg1.currentItem.image ) )
		ACTIONS.AnimateSequence( f1_arg0, "UpdateImage" )
		ACTIONS.AnimateSequenceByElement( f1_arg0, {
			elementName = "CACItemHeader",
			sequenceName = "UpdateDescription",
			elementPath = "CACItemHeader"
		} )
		return true
	end )
	assert( f1_arg0.MissionTeamInfo )
	f1_arg0.MissionTeamInfo:SetDataSource( MissionDirector.GetMissionTeamDataSources( f1_arg1, "frontEnd.MP.combatRecord.weapons", MissionDirector.GetActiveMissionTeam( f1_arg1 ) ), f1_arg1 )
	f1_arg0.CombatRecordHeaderRow:SetupHeader( {
		"MENU_WEAPONS_CAPS",
		"MENU_KILLS",
		"LUA_MENU_KD_RATIO",
		"LUA_MENU_WEAPPERF_HEADSHOTS",
		"LUA_MENU_WEAPSTATS_ACCURACY"
	} )
	local self = LUI.UIElement.new( {
		worldBlur = 5
	} )
	self:setupWorldBlur()
	self.id = "blur"
	f1_arg0:addElement( self )
	f1_arg0.MenuTitle.MenuBreadcrumbs:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_BREADCRUMB_3_ITEMS", "MENU_MULTIPLAYER", "LUA_MENU_PUBLIC_MATCH_CAPS", "LUA_MENU_COMBAT_RECORD" ) ) )
end

function CombatRecordWeapons( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "CombatRecordWeapons"
	self._animationSets = {}
	self._sequences = {}
	local f5_local1 = controller and controller.controllerIndex
	if not f5_local1 and not Engine.InFrontend() then
		f5_local1 = self:getRootController()
	end
	assert( f5_local1 )
	local f5_local2 = self
	local WeaponStatsRows = nil
	
	WeaponStatsRows = LUI.UIGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 12,
		controllerIndex = f5_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "CombatRecordRow", {
				controllerIndex = f5_local1
			} )
		end,
		refreshChild = function ( f7_arg0, f7_arg1, f7_arg2 )
			
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
	WeaponStatsRows.id = "WeaponStatsRows"
	WeaponStatsRows:setUseStencil( true )
	WeaponStatsRows:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1096, _1080p * 246, _1080p * 736 )
	self:addElement( WeaponStatsRows )
	self.WeaponStatsRows = WeaponStatsRows
	
	local ListBlur = nil
	
	ListBlur = LUI.UIBlur.new()
	ListBlur.id = "ListBlur"
	ListBlur:SetBlurStrength( 1.5, 0 )
	ListBlur:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 96, _1080p * -824, _1080p * 743.5, _1080p * -297.5 )
	self:addElement( ListBlur )
	self.ListBlur = ListBlur
	
	local ListBackground = nil
	
	ListBackground = LUI.UIImage.new()
	ListBackground.id = "ListBackground"
	ListBackground:SetRGBFromInt( 0, 0 )
	ListBackground:SetAlpha( 0.8, 0 )
	ListBackground:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 96, _1080p * -824, _1080p * 743.5, _1080p * -297.5 )
	self:addElement( ListBackground )
	self.ListBackground = ListBackground
	
	local MenuTitle = nil
	
	MenuTitle = MenuBuilder.BuildRegisteredType( "MenuTitle", {
		controllerIndex = f5_local1
	} )
	MenuTitle.id = "MenuTitle"
	MenuTitle.MenuTitle:setText( ToUpperCase( Engine.Localize( "MENU_WEAPONS_CAPS" ) ), 0 )
	MenuTitle.MenuBreadcrumbs:setText( ToUpperCase( "" ), 0 )
	MenuTitle.Icon:SetTop( _1080p * -28.5, 0 )
	MenuTitle.Icon:SetBottom( _1080p * 61.5, 0 )
	MenuTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1043, _1080p * 54, _1080p * 134 )
	self:addElement( MenuTitle )
	self.MenuTitle = MenuTitle
	
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f5_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local SocialFeed = nil
	
	SocialFeed = MenuBuilder.BuildRegisteredType( "SocialFeed", {
		controllerIndex = f5_local1
	} )
	SocialFeed.id = "SocialFeed"
	SocialFeed:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1920, _1080p * 965, _1080p * 995 )
	self:addElement( SocialFeed )
	self.SocialFeed = SocialFeed
	
	local CRMMain = nil
	
	CRMMain = MenuBuilder.BuildRegisteredType( "CRMMain", {
		controllerIndex = f5_local1
	} )
	CRMMain.id = "CRMMain"
	CRMMain:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 136, _1080p * 447, _1080p * 745, _1080p * 1069 )
	self:addElement( CRMMain )
	self.CRMMain = CRMMain
	
	local Friends = nil
	
	Friends = MenuBuilder.BuildRegisteredType( "online_friends_widget", {
		controllerIndex = f5_local1
	} )
	Friends.id = "Friends"
	Friends:SetFont( FONTS.GetFont( FONTS.Dev.File ) )
	Friends:SetAlignment( LUI.Alignment.Left )
	Friends:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1420, _1080p * 1920, _1080p * 1015, _1080p * 1060 )
	self:addElement( Friends )
	self.Friends = Friends
	
	local CACItemHeader = nil
	
	CACItemHeader = MenuBuilder.BuildRegisteredType( "CACItemHeader", {
		controllerIndex = f5_local1
	} )
	CACItemHeader.id = "CACItemHeader"
	CACItemHeader.ItemDescription:SetRight( _1080p * 770, 0 )
	CACItemHeader.ItemDescription:setText( Engine.Localize( "MENU_NEW" ), 0 )
	CACItemHeader.ItemName:setText( Engine.Localize( "MENU_NEW" ), 0 )
	CACItemHeader.ItemName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	CACItemHeader:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1133, _1080p * 1920, _1080p * 200, _1080p * 300 )
	self:addElement( CACItemHeader )
	self.CACItemHeader = CACItemHeader
	
	local WeaponImage = nil
	
	WeaponImage = LUI.UIImage.new()
	WeaponImage.id = "WeaponImage"
	WeaponImage:SetDotPitchEnabled( true )
	WeaponImage:SetDotPitchX( 0, 0 )
	WeaponImage:SetDotPitchY( 0, 0 )
	WeaponImage:SetDotPitchContrast( 0, 0 )
	WeaponImage:SetDotPitchMode( 0 )
	WeaponImage:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1314.5, _1080p * 1738.5, _1080p * 434, _1080p * 646 )
	self:addElement( WeaponImage )
	self.WeaponImage = WeaponImage
	
	local ListCount = nil
	
	ListCount = LUI.UIText.new()
	ListCount.id = "ListCount"
	ListCount:setText( "1/15", 0 )
	ListCount:SetFontSize( 24 * _1080p )
	ListCount:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ListCount:SetAlignment( LUI.Alignment.Center )
	ListCount:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 496.5, _1080p * 641.5, _1080p * 751, _1080p * 775 )
	self:addElement( ListCount )
	self.ListCount = ListCount
	
	local MissionTeamInfo = nil
	
	MissionTeamInfo = MenuBuilder.BuildRegisteredType( "MissionTeamInfo", {
		controllerIndex = f5_local1
	} )
	MissionTeamInfo.id = "MissionTeamInfo"
	MissionTeamInfo:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -700, 0, _1080p * 54, _1080p * 142 )
	self:addElement( MissionTeamInfo )
	self.MissionTeamInfo = MissionTeamInfo
	
	local ArrowDown = nil
	
	ArrowDown = MenuBuilder.BuildRegisteredType( "ArrowDown", {
		controllerIndex = f5_local1
	} )
	ArrowDown.id = "ArrowDown"
	ArrowDown:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 496.5, _1080p * 516.5, _1080p * 745, _1080p * 785 )
	self:addElement( ArrowDown )
	self.ArrowDown = ArrowDown
	
	local ArrowUp = nil
	
	ArrowUp = MenuBuilder.BuildRegisteredType( "ArrowUp", {
		controllerIndex = f5_local1
	} )
	ArrowUp.id = "ArrowUp"
	ArrowUp:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 621.5, _1080p * 641.5, _1080p * 745, _1080p * 785 )
	self:addElement( ArrowUp )
	self.ArrowUp = ArrowUp
	
	local VerticalMinimalScrollbar = nil
	
	VerticalMinimalScrollbar = MenuBuilder.BuildRegisteredType( "VerticalMinimalScrollbar", {
		controllerIndex = f5_local1
	} )
	VerticalMinimalScrollbar.id = "VerticalMinimalScrollbar"
	VerticalMinimalScrollbar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 76, _1080p * 92, _1080p * 246, _1080p * 736 )
	self:addElement( VerticalMinimalScrollbar )
	self.VerticalMinimalScrollbar = VerticalMinimalScrollbar
	
	local CombatRecordHeaderRow = nil
	
	CombatRecordHeaderRow = MenuBuilder.BuildRegisteredType( "CombatRecordHeaderRow", {
		controllerIndex = f5_local1
	} )
	CombatRecordHeaderRow.id = "CombatRecordHeaderRow"
	CombatRecordHeaderRow:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1096, _1080p * 200, _1080p * 239 )
	self:addElement( CombatRecordHeaderRow )
	self.CombatRecordHeaderRow = CombatRecordHeaderRow
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		WeaponImage:RegisterAnimationSequence( "UpdateImage", {
			{
				function ()
					return self.WeaponImage:SetAlpha( 0, 0 )
				end,
				function ()
					return self.WeaponImage:SetAlpha( 1, 30 )
				end,
				function ()
					return self.WeaponImage:SetAlpha( 0, 30 )
				end,
				function ()
					return self.WeaponImage:SetAlpha( 1, 30 )
				end,
				function ()
					return self.WeaponImage:SetAlpha( 0, 30 )
				end,
				function ()
					return self.WeaponImage:SetAlpha( 1, 30 )
				end
			},
			{
				function ()
					return self.WeaponImage:SetDotPitchX( 52, 0 )
				end,
				function ()
					return self.WeaponImage:SetDotPitchX( 0, 300 )
				end
			},
			{
				function ()
					return self.WeaponImage:SetDotPitchY( 43, 0 )
				end,
				function ()
					return self.WeaponImage:SetDotPitchY( 0, 300 )
				end
			},
			{
				function ()
					return self.WeaponImage:SetDotPitchContrast( 0.8, 0 )
				end,
				function ()
					return self.WeaponImage:SetDotPitchContrast( 0, 300 )
				end
			}
		} )
		self._sequences.UpdateImage = function ()
			WeaponImage:AnimateSequence( "UpdateImage" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	local f5_local19 = LUI.UIScrollbar.new
	local bindButton = {
		direction = LUI.DIRECTION.vertical,
		eventListener = VerticalMinimalScrollbar,
		startCap = VerticalMinimalScrollbar.startCap,
		endCap = VerticalMinimalScrollbar.endCap
	}
	local f5_local21 = VerticalMinimalScrollbar.sliderArea
	if f5_local21 then
		f5_local21 = VerticalMinimalScrollbar.sliderArea.slider
	end
	bindButton.slider = f5_local21
	f5_local21 = VerticalMinimalScrollbar.sliderArea
	if f5_local21 then
		f5_local21 = VerticalMinimalScrollbar.sliderArea.fixedSizeSlider
	end
	bindButton.fixedSizeSlider = f5_local21
	WeaponStatsRows:AddScrollbar( f5_local19( bindButton ) )
	WeaponStatsRows:AddArrow( ArrowUp )
	WeaponStatsRows:AddArrow( ArrowDown )
	WeaponStatsRows:AddItemNumbers( ListCount )
	self.addButtonHelperFunction = function ( f23_arg0, f23_arg1 )
		f23_arg0:AddButtonHelperText( {
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
	
	self.bindButton:addEventHandler( "button_secondary", function ( f24_arg0, f24_arg1 )
		local f24_local0 = f24_arg1.controller or f5_local1
		ACTIONS.LeaveMenu( self )
	end )
	f0_local0( self, f5_local1, controller )
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "CRMMain",
		sequenceName = "Minimize",
		elementPath = "CRMMain"
	} )
	return self
end

MenuBuilder.registerType( "CombatRecordWeapons", CombatRecordWeapons )
LockTable( _M )
