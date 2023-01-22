local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
PERK_SELECT_BASE_DATA_MODEL = "frontEnd.MP.prestigeMenu.perks"
function PopFunc()
	WipeGlobalModelsAtPath( PERK_SELECT_BASE_DATA_MODEL )
end

f0_local0 = function ( f2_arg0, f2_arg1, f2_arg2 )
	local f2_local0 = LUI.DataSourceInGlobalModel.new( PERK_SELECT_BASE_DATA_MODEL )
	f2_arg0.MenuTitle.MenuTitle:setText( ToUpperCase( Engine.Localize( "MENU_PERKS_CAPS" ) ) )
	f2_arg0.MenuTitle.MenuBreadcrumbs:setText( ToUpperCase( Engine.Localize( "PRESTIGE_PERMANENT_UNLOCKS" ), 0 ) )
	f2_arg0.perkSlot = 0
	local f2_local1 = function ( f3_arg0, f3_arg1, f3_arg2 )
		local f3_local0 = f3_arg1.ref:GetValue( f3_arg2 )
		return {
			perkSlot = f2_arg0.perkSlot
		}
	end
	
	local f2_local2 = {
		[#f2_local2 + 1] = {
			name = Engine.Localize( "@LUA_MENU_MP_PERK_SLOT_ONE_SHORT_CAPS" ),
			perkSlot = 0
		},
		[#f2_local2 + 1] = {
			name = Engine.Localize( "@LUA_MENU_MP_PERK_SLOT_TWO_SHORT_CAPS" ),
			perkSlot = 1
		},
		[#f2_local2 + 1] = {
			name = Engine.Localize( "@LUA_MENU_MP_PERK_SLOT_THREE_SHORT_CAPS" ),
			perkSlot = 2
		}
	}
	local f2_local3 = LUI.DataSourceFromList.new( #f2_local2 )
	local f2_local4 = LUI.DataSourceFromList.new( #f2_local2 )
	f2_local4.MakeDataSourceAtIndex = function ( f4_arg0, f4_arg1, f4_arg2 )
		return {
			name = LUI.DataSourceInGlobalModel.new( PERK_SELECT_BASE_DATA_MODEL .. ".tabName." .. f4_arg1, f2_local2[f4_arg1 + 1].name ),
			focusFunction = function ()
				local f5_local0 = DataSources.frontEnd.MP.CAC.perks:GetDataSourceAtIndex( f2_local2[f4_arg1 + 1].perkSlot )
				f2_arg0.perkList = f5_local0:Decorate( f2_local1 )
				f2_arg0.perkList:SetCachingEnabled( true )
				f2_arg0.perkList.GetDefaultFocusIndex = function ( f6_arg0 )
					return 0
				end
				
				f2_arg0:SetDataSource( {
					perkList = f2_arg0.perkList
				}, f4_arg2 )
			end
			
		}
	end
	
	f2_arg0.Tabs.Tabs:SetTabManagerDataSource( f2_local4, f2_arg1 )
	f2_arg0:SubscribeToModelThroughElement( f2_arg0.PerkGrid, "desc", function ()
		local f7_local0 = f2_arg0.PerkGrid:GetDataSource()
		f7_local0 = f7_local0.ref:GetValue( f2_arg1 )
		if f7_local0 ~= nil then
			local f7_local1 = Cac.GetPerkUnlockRank( f7_local0 )
			local f7_local2 = Prestige.IsItemUnlocked( f2_arg1, f7_local0, "perk" )
			if not f7_local2 then
				f7_local2 = tonumber( f7_local1 ) == 0
			end
			if f7_local2 then
				f2_arg0.PermanentUnlockItemDetails.ItemCost:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_ALREADY_UNLOCKED" ) ), 0 )
				ACTIONS.AnimateSequence( f2_arg0.PermanentUnlockItemDetails, "HideUnlockInfo" )
				f2_arg0.PermanentUnlockItemDetails.TokenIcon:SetAlpha( 0 )
				f2_arg0.PermanentUnlockItemDetails.ItemCost:SetLeft( _1080p * 20 )
			else
				f2_arg0.PermanentUnlockItemDetails.ItemCost:setText( ToUpperCase( Engine.Localize( "PRESTIGE_PERMANENT_UNLOCKS_COST", 1 ) ) )
				ACTIONS.AnimateSequence( f2_arg0.PermanentUnlockItemDetails, "ShowUnlockInfo" )
				f2_arg0.PermanentUnlockItemDetails.PermanentUnlockItemUnlockInfo.UnlockDesc:setText( ToUpperCase( Engine.Localize( "PRESTIGE_UNLOCKS_AT", Rank.GetRankDisplay( f7_local1 ) ) ) )
				f2_arg0.PermanentUnlockItemDetails.TokenIcon:SetAlpha( 1 )
				f2_arg0.PermanentUnlockItemDetails.ItemCost:SetLeft( _1080p * 75 )
				local f7_local3 = f2_arg0.PerkGrid:GetDataSource()
				Prestige.PositionUnlockCriteria( Engine.Localize( f7_local3.desc:GetValue( f2_arg1 ) ), f2_arg0.PermanentUnlockItemDetails.ItemDescription, f2_arg0.PermanentUnlockItemDetails.PermanentUnlockItemUnlockInfo )
			end
		end
	end )
	local f2_local5 = function ( f8_arg0 )
		local f8_local0 = f2_arg0.PerkGrid:GetDataSource()
		local f8_local1 = f8_local0.ref:GetValue( f8_arg0 )
		Prestige.PermanentUnlockTokenSpendAction( f8_arg0, f8_local1, Cac.GetPerkName( f8_local1 ), "perk", Cac.GetPerkUnlockRank( f8_local1 ), function ()
			Prestige.UsePermanentUnlockToken( f2_arg1, f8_local1, "perk" )
			f2_arg0.PermanentUnlockTokens:processEvent( {
				name = "update_token_count"
			} )
		end )
	end
	
	f2_arg0.bindButton:addEventHandler( "button_primary", function ( f10_arg0, f10_arg1 )
		f2_local5( f10_arg1.controller or f2_arg1 )
	end )
	if Engine.IsPC() then
		f2_arg0:addEventHandler( "perk_select_alternate", function ( f11_arg0, f11_arg1 )
			f2_local5( f11_arg1.controller or f2_arg1 )
		end )
	end
end

function PerksPermanentUnlocks( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "PerksPermanentUnlocks"
	self._animationSets = {}
	self._sequences = {}
	local f12_local1 = controller and controller.controllerIndex
	if not f12_local1 and not Engine.InFrontend() then
		f12_local1 = self:getRootController()
	end
	assert( f12_local1 )
	self:playSound( "menu_open" )
	local f12_local2 = self
	local Tabs = nil
	
	Tabs = MenuBuilder.BuildRegisteredType( "SubMenuTabsBar", {
		controllerIndex = f12_local1
	} )
	Tabs.id = "Tabs"
	Tabs:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 145, _1080p * 185 )
	self:addElement( Tabs )
	self.Tabs = Tabs
	
	local PerkGrid = nil
	
	PerkGrid = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 3,
		maxVisibleRows = 3,
		controllerIndex = f12_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "PermanentUnlockBasePerk", {
				controllerIndex = f12_local1
			} )
		end,
		wrapX = false,
		wrapY = false,
		spacingX = _1080p * 6,
		spacingY = _1080p * 6,
		columnWidth = _1080p * 192.67,
		rowHeight = _1080p * 200,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	PerkGrid.id = "PerkGrid"
	PerkGrid:setUseStencil( true )
	PerkGrid:SetGridDataSourceThroughElement( self, "perkList" )
	PerkGrid:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 720.01, _1080p * 216, _1080p * 828 )
	self:addElement( PerkGrid )
	self.PerkGrid = PerkGrid
	
	local PermanentUnlockTokens = nil
	
	PermanentUnlockTokens = MenuBuilder.BuildRegisteredType( "PermanentUnlockTokens", {
		controllerIndex = f12_local1
	} )
	PermanentUnlockTokens.id = "PermanentUnlockTokens"
	PermanentUnlockTokens:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1170, _1080p * 1920, _1080p * 71.5, _1080p * 116.5 )
	self:addElement( PermanentUnlockTokens )
	self.PermanentUnlockTokens = PermanentUnlockTokens
	
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f12_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local MenuTitle = nil
	
	MenuTitle = MenuBuilder.BuildRegisteredType( "MenuTitle", {
		controllerIndex = f12_local1
	} )
	MenuTitle.id = "MenuTitle"
	MenuTitle.MenuTitle:setText( ToUpperCase( Engine.Localize( "LUA_MENU_TITLE_PERK_SELECT" ) ), 0 )
	MenuTitle.MenuBreadcrumbs:setText( ToUpperCase( Engine.Localize( "MENU_MULTIPLAYER" ) ), 0 )
	MenuTitle.Icon:SetTop( _1080p * -28.5, 0 )
	MenuTitle.Icon:SetBottom( _1080p * 61.5, 0 )
	MenuTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
	self:addElement( MenuTitle )
	self.MenuTitle = MenuTitle
	
	local Showcase = nil
	
	Showcase = MenuBuilder.BuildRegisteredType( "PerkShowcase", {
		controllerIndex = f12_local1
	} )
	Showcase.id = "Showcase"
	Showcase:SetDataSourceThroughElement( PerkGrid, nil )
	Showcase:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -830.5, _1080p * -318.5, _1080p * 352, _1080p * 864 )
	self:addElement( Showcase )
	self.Showcase = Showcase
	
	local GridScrollbar = nil
	
	GridScrollbar = MenuBuilder.BuildRegisteredType( "VerticalMinimalScrollbar", {
		controllerIndex = f12_local1
	} )
	GridScrollbar.id = "GridScrollbar"
	GridScrollbar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 113, _1080p * 130, _1080p * 216, _1080p * 824 )
	self:addElement( GridScrollbar )
	self.GridScrollbar = GridScrollbar
	
	local SocialFeed = nil
	
	SocialFeed = MenuBuilder.BuildRegisteredType( "SocialFeed", {
		controllerIndex = f12_local1
	} )
	SocialFeed.id = "SocialFeed"
	SocialFeed:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -115, _1080p * -85 )
	self:addElement( SocialFeed )
	self.SocialFeed = SocialFeed
	
	local PermanentUnlockItemDetails = nil
	
	PermanentUnlockItemDetails = MenuBuilder.BuildRegisteredType( "PermanentUnlockItemDetails", {
		controllerIndex = f12_local1
	} )
	PermanentUnlockItemDetails.id = "PermanentUnlockItemDetails"
	PermanentUnlockItemDetails.ItemDescription:SetRight( _1080p * 620, 0 )
	PermanentUnlockItemDetails.ItemName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	PermanentUnlockItemDetails:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 736, _1080p * 1920, _1080p * 216, _1080p * 316 )
	PermanentUnlockItemDetails:SubscribeToModelThroughElement( PerkGrid, "desc", function ()
		local f14_local0 = PerkGrid:GetDataSource()
		f14_local0 = f14_local0.desc:GetValue( f12_local1 )
		if f14_local0 ~= nil then
			PermanentUnlockItemDetails.ItemDescription:setText( LocalizeString( f14_local0 ), 0 )
		end
	end )
	PermanentUnlockItemDetails:SubscribeToModelThroughElement( PerkGrid, "name", function ()
		local f15_local0 = PerkGrid:GetDataSource()
		f15_local0 = f15_local0.name:GetValue( f12_local1 )
		if f15_local0 ~= nil then
			PermanentUnlockItemDetails.ItemName:setText( LocalizeString( f15_local0 ), 0 )
		end
	end )
	self:addElement( PermanentUnlockItemDetails )
	self.PermanentUnlockItemDetails = PermanentUnlockItemDetails
	
	local FriendsElement = nil
	
	FriendsElement = MenuBuilder.BuildRegisteredType( "online_friends_widget", {
		controllerIndex = f12_local1
	} )
	FriendsElement.id = "FriendsElement"
	FriendsElement:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	FriendsElement:SetAlignment( LUI.Alignment.Left )
	FriendsElement:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 100, _1080p * 600, _1080p * -60, _1080p * -15 )
	self:addElement( FriendsElement )
	self.FriendsElement = FriendsElement
	
	local CRMMain = nil
	
	CRMMain = MenuBuilder.BuildRegisteredType( "CRMMain", {
		controllerIndex = f12_local1
	} )
	CRMMain.id = "CRMMain"
	CRMMain:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 136, _1080p * 447, _1080p * 745, _1080p * 1069 )
	self:addElement( CRMMain )
	self.CRMMain = CRMMain
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Showcase:RegisterAnimationSequence( "MenuOpen", {
			{
				function ()
					return self.Showcase:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -867.5, _1080p * -355.5, _1080p * 352, _1080p * 864, 0 )
				end,
				function ()
					return self.Showcase:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -830.5, _1080p * -318.5, _1080p * 352, _1080p * 864, 300, LUI.EASING.outQuadratic )
				end
			}
		} )
		self._sequences.MenuOpen = function ()
			Showcase:AnimateSequence( "MenuOpen" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	Showcase:SetDataSourceThroughElement( PerkGrid, nil )
	local f12_local14 = LUI.UIScrollbar.new
	local bindButton = {
		direction = LUI.DIRECTION.vertical,
		eventListener = GridScrollbar,
		startCap = GridScrollbar.startCap,
		endCap = GridScrollbar.endCap
	}
	local f12_local16 = GridScrollbar.sliderArea
	if f12_local16 then
		f12_local16 = GridScrollbar.sliderArea.slider
	end
	bindButton.slider = f12_local16
	f12_local16 = GridScrollbar.sliderArea
	if f12_local16 then
		f12_local16 = GridScrollbar.sliderArea.fixedSizeSlider
	end
	bindButton.fixedSizeSlider = f12_local16
	PerkGrid:AddScrollbar( f12_local14( bindButton ) )
	self.addButtonHelperFunction = function ( f21_arg0, f21_arg1 )
		f21_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			priority = 10,
			clickable = true
		} )
		f21_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_SELECT" ),
			button_ref = "button_primary",
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
	
	self.bindButton:addEventHandler( "button_secondary", function ( f22_arg0, f22_arg1 )
		local f22_local0 = f22_arg1.controller or f12_local1
		ACTIONS.LeaveMenu( self )
	end )
	self:SubscribeToModelThroughElement( PerkGrid, "icon", function ()
		ACTIONS.AnimateSequenceByElement( self, {
			elementName = "Showcase",
			sequenceName = "Update",
			elementPath = "Showcase"
		} )
	end )
	f0_local0( self, f12_local1, controller )
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "CRMMain",
		sequenceName = "Minimize",
		elementPath = "CRMMain"
	} )
	return self
end

MenuBuilder.registerType( "PerksPermanentUnlocks", PerksPermanentUnlocks )
LUI.FlowManager.RegisterStackPopBehaviour( "PerksPermanentUnlocks", PopFunc )
LockTable( _M )
