local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "frontEnd.MP.armory.recentDrops"
f0_local1 = function ( f1_arg0, f1_arg1 )
	assert( f1_arg0.Scrollbar )
	assert( f1_arg0.ArrowLeft )
	assert( f1_arg0.ArrowRight )
	assert( f1_arg0.GridItemText )
	local f1_local0 = LOOT.GetLastLootDropList( f1_arg1 )
	local f1_local1 = {}
	for f1_local5, f1_local6 in ipairs( f1_local0 ) do
		if not LOOT.IsFortuneCard( f1_local6 ) then
			table.insert( f1_local1, f1_local6 )
		end
	end
	ItemGrid = LUI.UIGrid.new( nil, {
		maxVisibleColumns = 4,
		maxVisibleRows = 1,
		controllerIndex = f1_arg1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "LootItemCard", {
				isRecentDropsMenu = true,
				controllerIndex = f1_arg1
			} )
		end,
		refreshChild = function ( f3_arg0, f3_arg1, f3_arg2 )
			local f3_local0 = f1_local1[f3_arg1 + 1]
			if f3_local0 then
				local f3_local1 = LOOT.GetLootData( f3_local0 )
				local f3_local2 = f3_arg0.options
				f3_local2.isDuplicate = false
				f3_local2.context = LUI.ItemCard.contexts.LOOT_CEREMONY
				f3_local2.itemType = f3_local1.type
				f3_local2.identifier = f3_local0
				f3_local2.modelPath = f0_local0 .. ".itemCard." .. f3_local0
				f3_local2.cardIndex = f3_arg1
				f3_local2.controllerIndex = f1_arg1
				f3_arg0._modelPath = f3_local2.modelPath
				ItemCardUtils.SetupItemCardData( f3_arg0, f3_local2.context, f3_local2.itemType, f3_local2.identifier, f3_local2.controllerIndex )
				f3_arg0:ResetCard()
				f3_arg0:RandomizeCard( f3_local2.controllerIndex, f3_local2 )
				f3_arg0:BuildCard()
			end
		end,
		numRows = 1,
		numColumns = 4,
		wrapX = false,
		wrapY = false,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		columnWidth = _1080p * 320,
		rowHeight = _1080p * 472,
		alwaysSnap = true
	} )
	ItemGrid.id = "ItemGrid"
	ItemGrid:setUseStencil( false )
	ItemGrid:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 305, _1080p * -305, _1080p * 304, _1080p * -304 )
	ItemGrid:setPriority( -1 )
	f1_arg0:addElement( ItemGrid )
	f1_arg0.ItemGrid = ItemGrid
	
	ItemGrid:SetNumColumns( #f1_local1 )
	ItemGrid:SetNumRows( 1 )
	ItemGrid:RefreshContent()
	f1_local4 = f1_arg0.Scrollbar
	f1_local5 = LUI.UIScrollbar.new
	f1_local6 = {
		direction = LUI.DIRECTION.horizontal,
		eventListener = f1_local4,
		startCap = f1_local4.startCap,
		endCap = f1_local4.endCap
	}
	local f1_local7 = f1_local4.sliderArea
	if f1_local7 then
		f1_local7 = f1_local4.sliderArea.slider
	end
	f1_local6.slider = f1_local7
	f1_local7 = f1_local4.sliderArea
	if f1_local7 then
		f1_local7 = f1_local4.sliderArea.fixedSizeSlider
	end
	f1_local6.fixedSizeSlider = f1_local7
	ItemGrid:AddScrollbar( f1_local5( f1_local6 ) )
	ItemGrid:AddArrow( f1_arg0.ArrowLeft )
	ItemGrid:AddArrow( f1_arg0.ArrowRight )
	ItemGrid:AddItemNumbers( f1_arg0.GridItemText )
end

f0_local2 = function ( f4_arg0, f4_arg1, f4_arg2 )
	local Blur = LUI.UIBlur.new()
	Blur.id = "Blur"
	Blur:SetBlurStrength( 2, 0 )
	Blur:setPriority( -2 )
	f4_arg0:addElement( Blur )
	f4_arg0.Blur = Blur
	
	assert( f4_arg0.GridItemText )
	f4_arg0.GridItemText:SetShadowUOffset( -0 )
	f4_arg0.GridItemText:SetShadowVOffset( -0 )
	if Engine.IsCoreMode() then
		f4_arg0.MenuTitle.MenuBreadcrumbs:setText( ToUpperCase( Engine.Localize( "LUA_MENU_BREADCRUMB_2_ITEMS", "MENU_MULTIPLAYER", "LUA_MENU_PUBLIC_MATCH_CAPS" ), 0 ) )
	end
	f0_local1( f4_arg0, f4_arg1 )
	ACTIONS.LoseFocus( f4_arg0, "CRMMain", f4_arg1 )
	ACTIONS.GainFocus( f4_arg0, "ItemGrid", f4_arg1 )
end

function ArmoryRecentDrops( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "ArmoryRecentDrops"
	local f5_local1 = controller and controller.controllerIndex
	if not f5_local1 and not Engine.InFrontend() then
		f5_local1 = self:getRootController()
	end
	assert( f5_local1 )
	self:playSound( "menu_open" )
	local f5_local2 = self
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
	SocialFeed:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -115, _1080p * -85 )
	self:addElement( SocialFeed )
	self.SocialFeed = SocialFeed
	
	local f5_local5 = nil
	if CONDITIONS.IsCoreMultiplayer( self ) then
		f5_local5 = MenuBuilder.BuildRegisteredType( "MenuTitle", {
			controllerIndex = f5_local1
		} )
		f5_local5.id = "MenuTitle"
		f5_local5.MenuTitle:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_RECENT_DROPS" ) ), 0 )
		f5_local5.MenuBreadcrumbs:setText( ToUpperCase( "" ), 0 )
		f5_local5.Icon:SetTop( _1080p * -28.5, 0 )
		f5_local5.Icon:SetBottom( _1080p * 61.5, 0 )
		f5_local5:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96.5, _1080p * 1056, _1080p * 54, _1080p * 134 )
		self:addElement( f5_local5 )
		self.MenuTitle = f5_local5
	end
	local f5_local6 = nil
	if CONDITIONS.IsThirdGameMode( self ) then
		f5_local6 = MenuBuilder.BuildRegisteredType( "CPMenuTitle", {
			controllerIndex = f5_local1
		} )
		f5_local6.id = "CPMenuTitle"
		f5_local6.MenuTitle:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_RECENT_DROPS" ) ), 0 )
		f5_local6:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
		self:addElement( f5_local6 )
		self.CPMenuTitle = f5_local6
	end
	local MissionTeamInfo = nil
	
	MissionTeamInfo = MenuBuilder.BuildRegisteredType( "MissionTeamInfo", {
		controllerIndex = f5_local1
	} )
	MissionTeamInfo.id = "MissionTeamInfo"
	MissionTeamInfo:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -700, 0, _1080p * 54, _1080p * 141 )
	self:addElement( MissionTeamInfo )
	self.MissionTeamInfo = MissionTeamInfo
	
	local Scrollbar = nil
	
	Scrollbar = MenuBuilder.BuildRegisteredType( "HorizontalMinimalScrollbar", {
		controllerIndex = f5_local1
	} )
	Scrollbar.id = "Scrollbar"
	Scrollbar:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 305, _1080p * -305, _1080p * 833, _1080p * 849 )
	self:addElement( Scrollbar )
	self.Scrollbar = Scrollbar
	
	local ArrowLeft = nil
	
	ArrowLeft = MenuBuilder.BuildRegisteredType( "ArrowLeft", {
		controllerIndex = f5_local1
	} )
	ArrowLeft.id = "ArrowLeft"
	ArrowLeft:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 241, _1080p * 305, _1080p * 476, _1080p * 604 )
	self:addElement( ArrowLeft )
	self.ArrowLeft = ArrowLeft
	
	local ArrowRight = nil
	
	ArrowRight = MenuBuilder.BuildRegisteredType( "ArrowRight", {
		controllerIndex = f5_local1
	} )
	ArrowRight.id = "ArrowRight"
	ArrowRight:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1617, _1080p * 1681, _1080p * 476, _1080p * 604 )
	self:addElement( ArrowRight )
	self.ArrowRight = ArrowRight
	
	local CRMMain = nil
	
	CRMMain = MenuBuilder.BuildRegisteredType( "CRMMain", {
		controllerIndex = f5_local1
	} )
	CRMMain.id = "CRMMain"
	CRMMain:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 136, _1080p * 447, _1080p * 745, _1080p * 1069 )
	self:addElement( CRMMain )
	self.CRMMain = CRMMain
	
	local ItemGridPlaceholder = nil
	
	ItemGridPlaceholder = LUI.UIImage.new()
	ItemGridPlaceholder.id = "ItemGridPlaceholder"
	ItemGridPlaceholder:SetAlpha( 0, 0 )
	ItemGridPlaceholder:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 305, _1080p * -305, _1080p * 304, _1080p * -304 )
	self:addElement( ItemGridPlaceholder )
	self.ItemGridPlaceholder = ItemGridPlaceholder
	
	local GridItemBG = nil
	
	GridItemBG = LUI.UIImage.new()
	GridItemBG.id = "GridItemBG"
	GridItemBG:SetRGBFromInt( 0, 0 )
	GridItemBG:SetAlpha( 0.4, 0 )
	GridItemBG:setImage( RegisterMaterial( "widg_gradient_center_out" ), 0 )
	GridItemBG:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -200, _1080p * 200, _1080p * 860, _1080p * 887 )
	self:addElement( GridItemBG )
	self.GridItemBG = GridItemBG
	
	local GridItemText = nil
	
	GridItemText = LUI.UIStyledText.new()
	GridItemText.id = "GridItemText"
	GridItemText:setText( "", 0 )
	GridItemText:SetFontSize( 28 * _1080p )
	GridItemText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	GridItemText:SetAlignment( LUI.Alignment.Center )
	GridItemText:SetShadowMinDistance( -0.2, 0 )
	GridItemText:SetShadowMaxDistance( 0.2, 0 )
	GridItemText:SetShadowRGBFromInt( 0, 0 )
	GridItemText:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 710, _1080p * -710, _1080p * 859, _1080p * 887 )
	self:addElement( GridItemText )
	self.GridItemText = GridItemText
	
	self.addButtonHelperFunction = function ( f6_arg0, f6_arg1 )
		f6_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_SELECT" ),
			button_ref = "button_primary",
			side = "left",
			clickable = true
		} )
		f6_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			priority = 10,
			clickable = true
		} )
	end
	
	self:addEventHandler( "menu_create", self.addButtonHelperFunction )
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	self.bindButton:addEventHandler( "button_secondary", function ( f7_arg0, f7_arg1 )
		local f7_local0 = f7_arg1.controller or f5_local1
		ACTIONS.LeaveMenu( self )
	end )
	f0_local2( self, f5_local1, controller )
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "CRMMain",
		sequenceName = "Minimize",
		elementPath = "CRMMain"
	} )
	return self
end

MenuBuilder.registerType( "ArmoryRecentDrops", ArmoryRecentDrops )
LockTable( _M )
