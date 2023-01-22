local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.RigImage )
	assert( f1_arg0.RigName )
	assert( f1_arg0.CombatRecordHeaderRow )
	assert( f1_arg0.KillsBox )
	assert( f1_arg0.KillsBox.Stat )
	assert( f1_arg0.DeathsBox )
	assert( f1_arg0.DeathsBox.Stat )
	assert( f1_arg0.KDBox )
	assert( f1_arg0.KDBox.Stat )
	assert( f1_arg0.RigStatsRows )
	local f1_local0 = Cac.GetRigStats( f1_arg1 )
	f1_arg0.RigStatsRows:SetRefreshChild( function ( f2_arg0, f2_arg1, f2_arg2 )
		f2_arg0:SetupRigRowData( f1_local0[f2_arg2 + 1] )
	end )
	f1_arg0.RigStatsRows:SetNumRows( #f1_local0 )
	f1_arg0:addEventHandler( "update_record_item", function ( f3_arg0, f3_arg1 )
		f1_arg0.KillsBox.Stat:setText( f3_arg1.currentItem.kills )
		f1_arg0.DeathsBox.Stat:setText( f3_arg1.currentItem.deaths )
		f1_arg0.KDBox.Stat:setText( string.format( "%.2f", f3_arg1.currentItem.kdr ) )
		f1_arg0.RigImage:setImage( RegisterMaterial( f3_arg1.currentItem.image ) )
		f1_arg0.RigName:setText( ToUpperCase( f3_arg1.currentItem.name ) )
		for f3_local3, f3_local4 in ipairs( f3_arg1.currentItem.superStats ) do
			assert( f1_arg0["Super" .. f3_local3 .. "Image"] )
			assert( f1_arg0["Super" .. f3_local3 .. "Kills"] )
			local f3_local5 = assert
			local f3_local6 = f1_arg0
			local f3_local7 = "Super"
			local f3_local8 = f3_local3
			f3_local5( f3_local6[f3_local7 .. f3_local3 .. "Kills"].Stat )
			assert( f1_arg0["Super" .. f3_local3 .. "Uses"] )
			f3_local5 = assert
			f3_local6 = f1_arg0
			f3_local7 = "Super"
			f3_local8 = f3_local3
			f3_local5( f3_local6[f3_local7 .. f3_local3 .. "Uses"].Stat )
			f3_local5 = f1_arg0
			f3_local6 = "Super"
			f3_local5["Super" .. f3_local3 .. "Image"]:setImage( RegisterMaterial( f3_local4.image ) )
			f3_local5 = f1_arg0
			f3_local6 = "Super"
			f3_local7 = f3_local3
			f3_local5[f3_local6 .. f3_local3 .. "Kills"].Stat:setText( f3_local4.kills )
			f3_local5 = f1_arg0
			f3_local6 = "Super"
			f3_local7 = f3_local3
			f3_local5[f3_local6 .. f3_local3 .. "Uses"].Stat:setText( f3_local4.uses )
			f3_local5 = f1_arg0
			f3_local6 = "Super"
			f3_local7 = f3_local3
			f3_local5[f3_local6 .. f3_local3 .. "Kills"].StatTitle:setText( ToUpperCase( Engine.Localize( "LUA_MENU_N_KILLS", f3_local4.name ) ) )
			f3_local5 = f1_arg0
			f3_local6 = "Super"
			f3_local7 = f3_local3
			f3_local5[f3_local6 .. f3_local3 .. "Uses"].StatTitle:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_N_USES", f3_local4.name ) ) )
		end
		ACTIONS.AnimateSequence( f1_arg0, "UpdateImage" )
		return true
	end )
	f1_arg0.CombatRecordHeaderRow:SetupHeader( {
		"LUA_MENU_MP_RIG",
		"MENU_KILLS"
	} )
	local self = LUI.UIElement.new( {
		worldBlur = 5
	} )
	self:setupWorldBlur()
	self.id = "blur"
	f1_arg0:addElement( self )
	f1_arg0.MenuTitle.MenuBreadcrumbs:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_BREADCRUMB_3_ITEMS", "MENU_MULTIPLAYER", "LUA_MENU_PUBLIC_MATCH_CAPS", "LUA_MENU_COMBAT_RECORD" ) ) )
end

function CombatRecordRig( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "CombatRecordRig"
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
	ListBlur:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 796, _1080p * 695, _1080p * 734 )
	self:addElement( ListBlur )
	self.ListBlur = ListBlur
	
	local ListBackground = nil
	
	ListBackground = LUI.UIImage.new()
	ListBackground.id = "ListBackground"
	ListBackground:SetRGBFromInt( 0, 0 )
	ListBackground:SetAlpha( 0.8, 0 )
	ListBackground:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 796, _1080p * 695, _1080p * 734 )
	self:addElement( ListBackground )
	self.ListBackground = ListBackground
	
	local NameGradientCopy0 = nil
	
	NameGradientCopy0 = LUI.UIImage.new()
	NameGradientCopy0.id = "NameGradientCopy0"
	NameGradientCopy0:SetRGBFromInt( 0, 0 )
	NameGradientCopy0:SetAlpha( 0.6, 0 )
	NameGradientCopy0:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
	NameGradientCopy0:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 1490, _1080p * -130, _1080p * -712, _1080p * -524 )
	self:addElement( NameGradientCopy0 )
	self.NameGradientCopy0 = NameGradientCopy0
	
	local RigStatsRows = nil
	
	RigStatsRows = LUI.UIGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 6,
		controllerIndex = f4_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "CombatRecordRow", {
				controllerIndex = f4_local1
			} )
		end,
		refreshChild = function ( f6_arg0, f6_arg1, f6_arg2 )
			
		end,
		numRows = 6,
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
	RigStatsRows.id = "RigStatsRows"
	RigStatsRows:setUseStencil( true )
	RigStatsRows:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 796, _1080p * 445, _1080p * 689 )
	self:addElement( RigStatsRows )
	self.RigStatsRows = RigStatsRows
	
	local NameGradientCopy2 = nil
	
	NameGradientCopy2 = LUI.UIImage.new()
	NameGradientCopy2.id = "NameGradientCopy2"
	NameGradientCopy2:SetRGBFromInt( 0, 0 )
	NameGradientCopy2:SetAlpha( 0.6, 0 )
	NameGradientCopy2:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
	NameGradientCopy2:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 1490, _1080p * -130, _1080p * -344, _1080p * -172 )
	self:addElement( NameGradientCopy2 )
	self.NameGradientCopy2 = NameGradientCopy2
	
	local NameGradientCopy1 = nil
	
	NameGradientCopy1 = LUI.UIImage.new()
	NameGradientCopy1.id = "NameGradientCopy1"
	NameGradientCopy1:SetRGBFromInt( 0, 0 )
	NameGradientCopy1:SetAlpha( 0.6, 0 )
	NameGradientCopy1:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
	NameGradientCopy1:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 1490, _1080p * -130, _1080p * -524, _1080p * -344 )
	self:addElement( NameGradientCopy1 )
	self.NameGradientCopy1 = NameGradientCopy1
	
	local MenuTitle = nil
	
	MenuTitle = MenuBuilder.BuildRegisteredType( "MenuTitle", {
		controllerIndex = f4_local1
	} )
	MenuTitle.id = "MenuTitle"
	MenuTitle.MenuTitle:setText( ToUpperCase( Engine.Localize( "CHALLENGE_CATEGORY_RIGS" ) ), 0 )
	MenuTitle.MenuBreadcrumbs:setText( ToUpperCase( "" ), 0 )
	MenuTitle.Icon:SetTop( _1080p * -28.5, 0 )
	MenuTitle.Icon:SetBottom( _1080p * 61.5, 0 )
	MenuTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1040, _1080p * 54, _1080p * 134 )
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
	ListCount:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 374.5, _1080p * 519.5, _1080p * 703, _1080p * 727 )
	self:addElement( ListCount )
	self.ListCount = ListCount
	
	local ArrowDown = nil
	
	ArrowDown = MenuBuilder.BuildRegisteredType( "ArrowDown", {
		controllerIndex = f4_local1
	} )
	ArrowDown.id = "ArrowDown"
	ArrowDown:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 374.5, _1080p * 394.5, _1080p * 695, _1080p * 735 )
	self:addElement( ArrowDown )
	self.ArrowDown = ArrowDown
	
	local ArrowUp = nil
	
	ArrowUp = MenuBuilder.BuildRegisteredType( "ArrowUp", {
		controllerIndex = f4_local1
	} )
	ArrowUp.id = "ArrowUp"
	ArrowUp:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 499.5, _1080p * 519.5, _1080p * 695, _1080p * 735 )
	self:addElement( ArrowUp )
	self.ArrowUp = ArrowUp
	
	local NameGradient = nil
	
	NameGradient = LUI.UIImage.new()
	NameGradient.id = "NameGradient"
	NameGradient:SetRGBFromInt( 0, 0 )
	NameGradient:SetAlpha( 0.6, 0 )
	NameGradient:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
	NameGradient:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 96, _1080p * -1124, _1080p * -790, _1080p * -674 )
	self:addElement( NameGradient )
	self.NameGradient = NameGradient
	
	local RigImage = nil
	
	RigImage = LUI.UIImage.new()
	RigImage.id = "RigImage"
	RigImage:SetDotPitchEnabled( true )
	RigImage:SetDotPitchX( 0, 0 )
	RigImage:SetDotPitchY( 0, 0 )
	RigImage:SetDotPitchContrast( 0, 0 )
	RigImage:SetDotPitchMode( 0 )
	RigImage:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 352, _1080p * 150, _1080p * 406 )
	self:addElement( RigImage )
	self.RigImage = RigImage
	
	local VerticalMinimalScrollbar = nil
	
	VerticalMinimalScrollbar = MenuBuilder.BuildRegisteredType( "VerticalMinimalScrollbar", {
		controllerIndex = f4_local1
	} )
	VerticalMinimalScrollbar.id = "VerticalMinimalScrollbar"
	VerticalMinimalScrollbar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 76, _1080p * 92, _1080p * 458, _1080p * 689 )
	self:addElement( VerticalMinimalScrollbar )
	self.VerticalMinimalScrollbar = VerticalMinimalScrollbar
	
	local CombatRecordHeaderRow = nil
	
	CombatRecordHeaderRow = MenuBuilder.BuildRegisteredType( "CombatRecordHeaderRow", {
		controllerIndex = f4_local1
	} )
	CombatRecordHeaderRow.id = "CombatRecordHeaderRow"
	CombatRecordHeaderRow:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 796, _1080p * 406, _1080p * 445 )
	self:addElement( CombatRecordHeaderRow )
	self.CombatRecordHeaderRow = CombatRecordHeaderRow
	
	local KillsBox = nil
	
	KillsBox = MenuBuilder.BuildRegisteredType( "CombatRecordStatBox", {
		controllerIndex = f4_local1
	} )
	KillsBox.id = "KillsBox"
	KillsBox.StatTitle:setText( ToUpperCase( Engine.Localize( "MENU_KILLS" ) ), 0 )
	KillsBox:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 890, _1080p * 1190, _1080p * 162, _1080p * 342 )
	self:addElement( KillsBox )
	self.KillsBox = KillsBox
	
	local KDBox = nil
	
	KDBox = MenuBuilder.BuildRegisteredType( "CombatRecordStatBox", {
		controllerIndex = f4_local1
	} )
	KDBox.id = "KDBox"
	KDBox.StatTitle:setText( ToUpperCase( Engine.Localize( "LUA_MENU_KD_RATIO" ) ), 0 )
	KDBox:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1490, _1080p * 1790, _1080p * 162, _1080p * 342 )
	self:addElement( KDBox )
	self.KDBox = KDBox
	
	local DeathsBox = nil
	
	DeathsBox = MenuBuilder.BuildRegisteredType( "CombatRecordStatBox", {
		controllerIndex = f4_local1
	} )
	DeathsBox.id = "DeathsBox"
	DeathsBox.StatTitle:setText( ToUpperCase( Engine.Localize( "LUA_MENU_DEATHS" ) ), 0 )
	DeathsBox:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1190, _1080p * 1490, _1080p * 162, _1080p * 342 )
	self:addElement( DeathsBox )
	self.DeathsBox = DeathsBox
	
	local Super1Uses = nil
	
	Super1Uses = MenuBuilder.BuildRegisteredType( "CombatRecordStatBox", {
		controllerIndex = f4_local1
	} )
	Super1Uses.id = "Super1Uses"
	Super1Uses.StatTitle:setText( ToUpperCase( "" ), 0 )
	Super1Uses:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 890, _1080p * 1190, _1080p * 368, _1080p * 548 )
	self:addElement( Super1Uses )
	self.Super1Uses = Super1Uses
	
	local Super1Kills = nil
	
	Super1Kills = MenuBuilder.BuildRegisteredType( "CombatRecordStatBox", {
		controllerIndex = f4_local1
	} )
	Super1Kills.id = "Super1Kills"
	Super1Kills.StatTitle:setText( ToUpperCase( "" ), 0 )
	Super1Kills:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1190, _1080p * 1490, _1080p * 368, _1080p * 548 )
	self:addElement( Super1Kills )
	self.Super1Kills = Super1Kills
	
	local Super2Uses = nil
	
	Super2Uses = MenuBuilder.BuildRegisteredType( "CombatRecordStatBox", {
		controllerIndex = f4_local1
	} )
	Super2Uses.id = "Super2Uses"
	Super2Uses.StatTitle:setText( ToUpperCase( "" ), 0 )
	Super2Uses:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 890, _1080p * 1190, _1080p * 548, _1080p * 728 )
	self:addElement( Super2Uses )
	self.Super2Uses = Super2Uses
	
	local Super2Kills = nil
	
	Super2Kills = MenuBuilder.BuildRegisteredType( "CombatRecordStatBox", {
		controllerIndex = f4_local1
	} )
	Super2Kills.id = "Super2Kills"
	Super2Kills.StatTitle:setText( ToUpperCase( "" ), 0 )
	Super2Kills:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1190, _1080p * 1490, _1080p * 548, _1080p * 728 )
	self:addElement( Super2Kills )
	self.Super2Kills = Super2Kills
	
	local Super3Uses = nil
	
	Super3Uses = MenuBuilder.BuildRegisteredType( "CombatRecordStatBox", {
		controllerIndex = f4_local1
	} )
	Super3Uses.id = "Super3Uses"
	Super3Uses.StatTitle:setText( ToUpperCase( "" ), 0 )
	Super3Uses:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 890, _1080p * 1190, _1080p * 728, _1080p * 908 )
	self:addElement( Super3Uses )
	self.Super3Uses = Super3Uses
	
	local Super3Kills = nil
	
	Super3Kills = MenuBuilder.BuildRegisteredType( "CombatRecordStatBox", {
		controllerIndex = f4_local1
	} )
	Super3Kills.id = "Super3Kills"
	Super3Kills.StatTitle:setText( ToUpperCase( "" ), 0 )
	Super3Kills:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1190, _1080p * 1490, _1080p * 728, _1080p * 908 )
	self:addElement( Super3Kills )
	self.Super3Kills = Super3Kills
	
	local Super1Image = nil
	
	Super1Image = LUI.UIImage.new()
	Super1Image.id = "Super1Image"
	Super1Image:SetDotPitchEnabled( true )
	Super1Image:SetDotPitchX( 0, 0 )
	Super1Image:SetDotPitchY( 0, 0 )
	Super1Image:SetDotPitchContrast( 0, 0 )
	Super1Image:SetDotPitchMode( 0 )
	Super1Image:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1547, _1080p * 1741, _1080p * 379, _1080p * 537 )
	self:addElement( Super1Image )
	self.Super1Image = Super1Image
	
	local Super2Image = nil
	
	Super2Image = LUI.UIImage.new()
	Super2Image.id = "Super2Image"
	Super2Image:SetDotPitchEnabled( true )
	Super2Image:SetDotPitchX( 0, 0 )
	Super2Image:SetDotPitchY( 0, 0 )
	Super2Image:SetDotPitchContrast( 0, 0 )
	Super2Image:SetDotPitchMode( 0 )
	Super2Image:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1547, _1080p * 1741, _1080p * 567, _1080p * 725 )
	self:addElement( Super2Image )
	self.Super2Image = Super2Image
	
	local Super3Image = nil
	
	Super3Image = LUI.UIImage.new()
	Super3Image.id = "Super3Image"
	Super3Image:SetDotPitchEnabled( true )
	Super3Image:SetDotPitchX( 0, 0 )
	Super3Image:SetDotPitchY( 0, 0 )
	Super3Image:SetDotPitchContrast( 0, 0 )
	Super3Image:SetDotPitchMode( 0 )
	Super3Image:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1547, _1080p * 1741, _1080p * 743, _1080p * 901 )
	self:addElement( Super3Image )
	self.Super3Image = Super3Image
	
	local RigName = nil
	
	RigName = LUI.UIText.new()
	RigName.id = "RigName"
	RigName:setText( ToUpperCase( Engine.Localize( "MENU_NEW" ) ), 0 )
	RigName:SetFontSize( 38 * _1080p )
	RigName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	RigName:SetAlignment( LUI.Alignment.Left )
	RigName:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 374.5, _1080p * 782, _1080p * 329, _1080p * 367 )
	self:addElement( RigName )
	self.RigName = RigName
	
	local MissionTeamInfo = nil
	
	MissionTeamInfo = MenuBuilder.BuildRegisteredType( "MissionTeamInfo", {
		controllerIndex = f4_local1
	} )
	MissionTeamInfo.id = "MissionTeamInfo"
	MissionTeamInfo:SetAlpha( 0, 0 )
	MissionTeamInfo:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -700, 0, _1080p * 54, _1080p * 142 )
	self:addElement( MissionTeamInfo )
	self.MissionTeamInfo = MissionTeamInfo
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Super1Image:RegisterAnimationSequence( "UpdateImage", {
			{
				function ()
					return self.Super1Image:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Super1Image:SetAlpha( 1, 30 )
				end,
				function ()
					return self.Super1Image:SetAlpha( 0, 30 )
				end,
				function ()
					return self.Super1Image:SetAlpha( 1, 30 )
				end,
				function ()
					return self.Super1Image:SetAlpha( 0, 30 )
				end,
				function ()
					return self.Super1Image:SetAlpha( 1, 30 )
				end
			},
			{
				function ()
					return self.Super1Image:SetDotPitchX( 52, 0 )
				end,
				function ()
					return self.Super1Image:SetDotPitchX( 0, 300 )
				end
			},
			{
				function ()
					return self.Super1Image:SetDotPitchY( 43, 0 )
				end,
				function ()
					return self.Super1Image:SetDotPitchY( 0, 300 )
				end
			},
			{
				function ()
					return self.Super1Image:SetDotPitchContrast( 0.8, 0 )
				end,
				function ()
					return self.Super1Image:SetDotPitchContrast( 0, 300 )
				end
			}
		} )
		Super2Image:RegisterAnimationSequence( "UpdateImage", {
			{
				function ()
					return self.Super2Image:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Super2Image:SetAlpha( 1, 30 )
				end,
				function ()
					return self.Super2Image:SetAlpha( 0, 30 )
				end,
				function ()
					return self.Super2Image:SetAlpha( 1, 30 )
				end,
				function ()
					return self.Super2Image:SetAlpha( 0, 30 )
				end,
				function ()
					return self.Super2Image:SetAlpha( 1, 30 )
				end
			},
			{
				function ()
					return self.Super2Image:SetDotPitchContrast( 0.8, 0 )
				end,
				function ()
					return self.Super2Image:SetDotPitchContrast( 0, 300 )
				end
			},
			{
				function ()
					return self.Super2Image:SetDotPitchY( 43, 0 )
				end,
				function ()
					return self.Super2Image:SetDotPitchY( 0, 300 )
				end
			},
			{
				function ()
					return self.Super2Image:SetDotPitchX( 52, 0 )
				end,
				function ()
					return self.Super2Image:SetDotPitchX( 0, 300 )
				end
			}
		} )
		Super3Image:RegisterAnimationSequence( "UpdateImage", {
			{
				function ()
					return self.Super3Image:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Super3Image:SetAlpha( 1, 30 )
				end,
				function ()
					return self.Super3Image:SetAlpha( 0, 30 )
				end,
				function ()
					return self.Super3Image:SetAlpha( 1, 30 )
				end,
				function ()
					return self.Super3Image:SetAlpha( 0, 30 )
				end,
				function ()
					return self.Super3Image:SetAlpha( 1, 30 )
				end
			},
			{
				function ()
					return self.Super3Image:SetDotPitchX( 52, 0 )
				end,
				function ()
					return self.Super3Image:SetDotPitchX( 0, 300 )
				end
			},
			{
				function ()
					return self.Super3Image:SetDotPitchY( 43, 0 )
				end,
				function ()
					return self.Super3Image:SetDotPitchY( 0, 300 )
				end
			},
			{
				function ()
					return self.Super3Image:SetDotPitchContrast( 0.8, 0 )
				end,
				function ()
					return self.Super3Image:SetDotPitchContrast( 0, 300 )
				end
			}
		} )
		self._sequences.UpdateImage = function ()
			Super1Image:AnimateSequence( "UpdateImage" )
			Super2Image:AnimateSequence( "UpdateImage" )
			Super3Image:AnimateSequence( "UpdateImage" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	local f4_local35 = LUI.UIScrollbar.new
	local bindButton = {
		direction = LUI.DIRECTION.vertical,
		eventListener = VerticalMinimalScrollbar,
		startCap = VerticalMinimalScrollbar.startCap,
		endCap = VerticalMinimalScrollbar.endCap
	}
	local f4_local37 = VerticalMinimalScrollbar.sliderArea
	if f4_local37 then
		f4_local37 = VerticalMinimalScrollbar.sliderArea.slider
	end
	bindButton.slider = f4_local37
	f4_local37 = VerticalMinimalScrollbar.sliderArea
	if f4_local37 then
		f4_local37 = VerticalMinimalScrollbar.sliderArea.fixedSizeSlider
	end
	bindButton.fixedSizeSlider = f4_local37
	RigStatsRows:AddScrollbar( f4_local35( bindButton ) )
	RigStatsRows:AddArrow( ArrowUp )
	RigStatsRows:AddArrow( ArrowDown )
	RigStatsRows:AddItemNumbers( ListCount )
	self.addButtonHelperFunction = function ( f46_arg0, f46_arg1 )
		f46_arg0:AddButtonHelperText( {
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
	
	self.bindButton:addEventHandler( "button_secondary", function ( f47_arg0, f47_arg1 )
		local f47_local0 = f47_arg1.controller or f4_local1
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

MenuBuilder.registerType( "CombatRecordRig", CombatRecordRig )
LockTable( _M )
