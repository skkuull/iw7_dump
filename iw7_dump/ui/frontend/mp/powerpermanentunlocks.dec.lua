local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "frontEnd.MP.prestigeMenu.powerSelect"
f0_local1 = function ()
	WipeGlobalModelsAtPath( f0_local0 )
end

f0_local2 = function ( f2_arg0 )
	return function ( f3_arg0, f3_arg1, f3_arg2 )
		WipeGlobalModelsAtPath( f0_local0 )
		assert( f3_arg1.ref )
		assert( f3_arg1.name )
		assert( f3_arg1.icon )
		assert( f3_arg1.slot )
		assert( f3_arg1.desc )
		assert( f3_arg1.fullImage )
		local f3_local0 = f3_arg1.ref:GetValue( f3_arg2 )
		local f3_local1 = {}
		local f3_local2 = f0_local0 .. ".loot." .. f3_local0 .. "."
		f3_local1[1] = {
			power = {
				ref = f3_arg1.ref,
				name = f3_arg1.name,
				icon = f3_arg1.icon,
				fullImage = f3_arg1.fullImage,
				desc = f3_arg1.desc,
				quip = LUI.DataSourceInGlobalModel.new( f3_local2 .. "quip", "" ),
				quality = LUI.DataSourceInGlobalModel.new( f3_local2 .. "quality", 0 ),
				qualityString = LUI.DataSourceInGlobalModel.new( f3_local2 .. "qualityString", Cac.GetLootQualityString( Cac.LowestQuality ) ),
				qualityColor = LUI.DataSourceInGlobalModel.new( f3_local2 .. "qualityColor", Cac.GetLootQualityColor( Cac.LowestQuality ) ),
				qualityImage = LUI.DataSourceInGlobalModel.new( f3_local2 .. "qualityImage", Cac.GetLootQualityImage( Cac.LowestQuality ) ),
				passives = LUI.DataSourceFromList.new( 0 ),
				basePowerRef = LUI.DataSourceInGlobalModel.new( f3_local2 .. "basePowerRef", f3_local0 ),
				lootID = LUI.DataSourceInGlobalModel.new( f3_local2 .. "lootID", Cac.BaseLootID ),
				slot = f3_arg1.slot
			}
		}
		local f3_local3 = LUI.DataSourceFromList.new( #f3_local1 )
		f3_local3.GetDataSourceAtIndex = function ( f4_arg0, f4_arg1 )
			return f3_local1[f4_arg1 + 1]
		end
		
		f3_local3.GetDefaultFocusIndex = function ()
			return 0
		end
		
		return {
			variants = f3_local3,
			ref = f3_arg1.ref,
			name = f3_arg1.name,
			image = f3_arg1.image
		}
	end
	
end

local f0_local3 = function ( f6_arg0, f6_arg1, f6_arg2 )
	assert( f6_arg2 )
	local f6_local0 = f6_arg2.powerSlot
	assert( f6_local0 )
	local f6_local1 = ""
	if f6_local0 == Cac.PowerSlot.LETHAL then
		f6_local1 = "LUA_MENU_RIG_LETHAL"
	elseif f6_local0 == Cac.PowerSlot.TACTICAL then
		f6_local1 = "LUA_MENU_RIG_TACTICAL"
	end
	f6_arg0.MenuTitle.MenuTitle:setText( ToUpperCase( Engine.Localize( f6_local1 ) ), 0 )
	f6_arg0.MenuTitle.MenuBreadcrumbs:setText( ToUpperCase( Engine.Localize( "PRESTIGE_PERMANENT_UNLOCKS" ), 0 ) )
	local f6_local2 = DataSources.frontEnd.MP.CAC.powerSlots:GetDataSourceAtIndex( f6_local0 )
	local f6_local3 = f6_local2:Decorate( f0_local2( f6_arg0 ) )
	f6_local3:SetCachingEnabled( true )
	f6_local3.GetDefaultFocusIndex = function ()
		return 0
	end
	
	f6_arg0:SetDataSource( {
		powerSelectContent = f6_local3,
		points = 0,
		pointCountText = ""
	}, f6_arg1 )
	f6_arg0:SubscribeToModelThroughElement( f6_arg0.BasePowers, "ref", function ()
		local f8_local0 = f6_arg0.BasePowers:GetDataSource()
		local f8_local1 = f8_local0.ref:GetValue( f6_arg1 )
		local f8_local2 = Cac.GetPowerUnlockRank( f8_local1 )
		local f8_local3 = Prestige.IsItemUnlocked( f6_arg1, f8_local1, "power" )
		if not f8_local3 then
			f8_local3 = tonumber( f8_local2 ) == 0
		end
		if f8_local3 then
			f6_arg0.PermanentUnlockItemDetails.ItemCost:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_ALREADY_UNLOCKED" ) ), 0 )
			ACTIONS.AnimateSequence( f6_arg0.PermanentUnlockItemDetails, "HideUnlockInfo" )
			f6_arg0.PermanentUnlockItemDetails.TokenIcon:SetAlpha( 0 )
			f6_arg0.PermanentUnlockItemDetails.ItemCost:SetLeft( _1080p * 20 )
		else
			f6_arg0.PermanentUnlockItemDetails.ItemCost:setText( ToUpperCase( Engine.Localize( "PRESTIGE_PERMANENT_UNLOCKS_COST", 1 ) ) )
			ACTIONS.AnimateSequence( f6_arg0.PermanentUnlockItemDetails, "ShowUnlockInfo" )
			f6_arg0.PermanentUnlockItemDetails.PermanentUnlockItemUnlockInfo.UnlockDesc:setText( ToUpperCase( Engine.Localize( "PRESTIGE_UNLOCKS_AT", Rank.GetRankDisplay( f8_local2 ) ) ) )
			f6_arg0.PermanentUnlockItemDetails.TokenIcon:SetAlpha( 1 )
			f6_arg0.PermanentUnlockItemDetails.ItemCost:SetLeft( _1080p * 75 )
		end
	end )
	local f6_local4 = function ( f9_arg0 )
		local f9_local0 = f6_arg0.BasePowers:GetDataSource()
		local f9_local1 = f9_local0.ref:GetValue( f9_arg0 )
		Prestige.PermanentUnlockTokenSpendAction( f9_arg0, f9_local1, Cac.GetPowerName( f9_local1 ), "power", Cac.GetPowerUnlockRank( f9_local1 ), function ()
			Prestige.UsePermanentUnlockToken( f9_arg0, f9_local1, "power" )
			f6_arg0.PermanentUnlockTokens:processEvent( {
				name = "update_token_count"
			} )
		end )
	end
	
	f6_arg0.bindButton:addEventHandler( "button_primary", function ( f11_arg0, f11_arg1 )
		f6_local4( f11_arg1.controller or f6_arg1 )
	end )
	if Engine.IsPC() then
		f6_arg0:addEventHandler( "power_select_alternate", function ( f12_arg0, f12_arg1 )
			f6_local4( f12_arg1.controller or f6_arg1 )
		end )
	end
end

function PowerPermanentUnlocks( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "PowerPermanentUnlocks"
	local f13_local1 = controller and controller.controllerIndex
	if not f13_local1 and not Engine.InFrontend() then
		f13_local1 = self:getRootController()
	end
	assert( f13_local1 )
	self:playSound( "menu_open" )
	local f13_local2 = self
	local BasePowers = nil
	
	BasePowers = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 5,
		controllerIndex = f13_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "PermanentUnlockBasePower", {
				controllerIndex = f13_local1
			} )
		end,
		wrapX = false,
		wrapY = false,
		spacingX = _1080p * 6,
		spacingY = _1080p * 6,
		columnWidth = _1080p * 250,
		rowHeight = _1080p * 133.2,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Center,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	BasePowers.id = "BasePowers"
	BasePowers:setUseStencil( true )
	BasePowers:SetGridDataSourceThroughElement( self, "powerSelectContent" )
	BasePowers:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 147, _1080p * 397, _1080p * 216, _1080p * 906 )
	self:addElement( BasePowers )
	self.BasePowers = BasePowers
	
	local Powers = nil
	
	Powers = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 5,
		maxVisibleRows = 1,
		controllerIndex = f13_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "PermanentUnlockPowerItem", {
				controllerIndex = f13_local1
			} )
		end,
		wrapX = false,
		wrapY = false,
		spacingX = _1080p * 25,
		spacingY = _1080p * 25,
		columnWidth = _1080p * 512,
		rowHeight = _1080p * 512,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Center,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	Powers.id = "Powers"
	Powers:setUseStencil( false )
	Powers:SetGridDataSourceThroughElement( BasePowers, "variants" )
	Powers:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -2084, _1080p * 576, _1080p * 346, _1080p * 858 )
	self:addElement( Powers )
	self.Powers = Powers
	
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f13_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local BasePowersScrollbar = nil
	
	BasePowersScrollbar = MenuBuilder.BuildRegisteredType( "VerticalMinimalScrollbar", {
		controllerIndex = f13_local1
	} )
	BasePowersScrollbar.id = "BasePowersScrollbar"
	BasePowersScrollbar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 147, _1080p * 216, _1080p * 906 )
	self:addElement( BasePowersScrollbar )
	self.BasePowersScrollbar = BasePowersScrollbar
	
	local FriendsElement = nil
	
	FriendsElement = MenuBuilder.BuildRegisteredType( "online_friends_widget", {
		controllerIndex = f13_local1
	} )
	FriendsElement.id = "FriendsElement"
	FriendsElement:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	FriendsElement:SetAlignment( LUI.Alignment.Left )
	FriendsElement:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 100, _1080p * 600, _1080p * -60, _1080p * -15 )
	self:addElement( FriendsElement )
	self.FriendsElement = FriendsElement
	
	local MenuTitle = nil
	
	MenuTitle = MenuBuilder.BuildRegisteredType( "MenuTitle", {
		controllerIndex = f13_local1
	} )
	MenuTitle.id = "MenuTitle"
	MenuTitle.MenuTitle:setText( ToUpperCase( Engine.Localize( "MENU_NEW" ) ), 0 )
	MenuTitle.MenuBreadcrumbs:setText( ToUpperCase( Engine.Localize( "MENU_MULTIPLAYER" ) ), 0 )
	MenuTitle.Icon:SetTop( _1080p * -28.5, 0 )
	MenuTitle.Icon:SetBottom( _1080p * 61.5, 0 )
	MenuTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
	self:addElement( MenuTitle )
	self.MenuTitle = MenuTitle
	
	local ArrowUp = nil
	
	ArrowUp = MenuBuilder.BuildRegisteredType( "ArrowUp", {
		controllerIndex = f13_local1
	} )
	ArrowUp.id = "ArrowUp"
	ArrowUp:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 344.5, _1080p * 364.5, _1080p * 906, _1080p * 946 )
	self:addElement( ArrowUp )
	self.ArrowUp = ArrowUp
	
	local ArrowDown = nil
	
	ArrowDown = MenuBuilder.BuildRegisteredType( "ArrowDown", {
		controllerIndex = f13_local1
	} )
	ArrowDown.id = "ArrowDown"
	ArrowDown:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 179.5, _1080p * 199.5, _1080p * 906, _1080p * 946 )
	self:addElement( ArrowDown )
	self.ArrowDown = ArrowDown
	
	local ListCount = nil
	
	ListCount = LUI.UIText.new()
	ListCount.id = "ListCount"
	ListCount:setText( "1/15", 0 )
	ListCount:SetFontSize( 24 * _1080p )
	ListCount:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ListCount:SetAlignment( LUI.Alignment.Center )
	ListCount:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 199.5, _1080p * 344.5, _1080p * 914, _1080p * 938 )
	self:addElement( ListCount )
	self.ListCount = ListCount
	
	local SocialFeed = nil
	
	SocialFeed = MenuBuilder.BuildRegisteredType( "SocialFeed", {
		controllerIndex = f13_local1
	} )
	SocialFeed.id = "SocialFeed"
	SocialFeed:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -115, _1080p * -85 )
	self:addElement( SocialFeed )
	self.SocialFeed = SocialFeed
	
	local PermanentUnlockItemDetails = nil
	
	PermanentUnlockItemDetails = MenuBuilder.BuildRegisteredType( "PermanentUnlockItemDetails", {
		controllerIndex = f13_local1
	} )
	PermanentUnlockItemDetails.id = "PermanentUnlockItemDetails"
	PermanentUnlockItemDetails.ItemDescription:SetRight( _1080p * 620, 0 )
	PermanentUnlockItemDetails.ItemName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	PermanentUnlockItemDetails:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 415, _1080p * 1920, _1080p * 216, _1080p * 316 )
	PermanentUnlockItemDetails:SubscribeToModelThroughElement( Powers, "power.desc", function ()
		local f16_local0 = Powers:GetDataSource()
		f16_local0 = f16_local0.power.desc:GetValue( f13_local1 )
		if f16_local0 ~= nil then
			PermanentUnlockItemDetails.ItemDescription:setText( LocalizeString( f16_local0 ), 0 )
		end
	end )
	PermanentUnlockItemDetails:SubscribeToModelThroughElement( Powers, "power.name", function ()
		local f17_local0 = Powers:GetDataSource()
		f17_local0 = f17_local0.power.name:GetValue( f13_local1 )
		if f17_local0 ~= nil then
			PermanentUnlockItemDetails.ItemName:setText( LocalizeString( f17_local0 ), 0 )
		end
	end )
	self:addElement( PermanentUnlockItemDetails )
	self.PermanentUnlockItemDetails = PermanentUnlockItemDetails
	
	local PermanentUnlockTokens = nil
	
	PermanentUnlockTokens = MenuBuilder.BuildRegisteredType( "PermanentUnlockTokens", {
		controllerIndex = f13_local1
	} )
	PermanentUnlockTokens.id = "PermanentUnlockTokens"
	PermanentUnlockTokens:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1170, _1080p * 1920, _1080p * 71.5, _1080p * 116.5 )
	self:addElement( PermanentUnlockTokens )
	self.PermanentUnlockTokens = PermanentUnlockTokens
	
	local CRMMain = nil
	
	CRMMain = MenuBuilder.BuildRegisteredType( "CRMMain", {
		controllerIndex = f13_local1
	} )
	CRMMain.id = "CRMMain"
	CRMMain:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 136, _1080p * 447, _1080p * 745, _1080p * 1069 )
	self:addElement( CRMMain )
	self.CRMMain = CRMMain
	
	BasePowers:addEventHandler( "gain_focus", function ( f18_arg0, f18_arg1 )
		ACTIONS.GainFocus( self, "Powers", f18_arg1.controller or f13_local1 )
	end )
	BasePowers:addEventHandler( "lose_focus", function ( f19_arg0, f19_arg1 )
		ACTIONS.LoseFocus( self, "Powers", f19_arg1.controller or f13_local1 )
	end )
	local f13_local16 = LUI.UIScrollbar.new
	local bindButton = {
		direction = LUI.DIRECTION.vertical,
		eventListener = BasePowersScrollbar,
		startCap = BasePowersScrollbar.startCap,
		endCap = BasePowersScrollbar.endCap
	}
	local f13_local18 = BasePowersScrollbar.sliderArea
	if f13_local18 then
		f13_local18 = BasePowersScrollbar.sliderArea.slider
	end
	bindButton.slider = f13_local18
	f13_local18 = BasePowersScrollbar.sliderArea
	if f13_local18 then
		f13_local18 = BasePowersScrollbar.sliderArea.fixedSizeSlider
	end
	bindButton.fixedSizeSlider = f13_local18
	BasePowers:AddScrollbar( f13_local16( bindButton ) )
	BasePowers:AddArrow( ArrowUp )
	BasePowers:AddArrow( ArrowDown )
	BasePowers:AddItemNumbers( ListCount )
	self.addButtonHelperFunction = function ( f20_arg0, f20_arg1 )
		f20_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			priority = 10,
			clickable = true
		} )
		f20_arg0:AddButtonHelperText( {
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
	
	self.bindButton:addEventHandler( "button_secondary", function ( f21_arg0, f21_arg1 )
		local f21_local0 = f21_arg1.controller or f13_local1
		ACTIONS.LeaveMenu( self )
		return true
	end )
	f0_local3( self, f13_local1, controller )
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "CRMMain",
		sequenceName = "Minimize",
		elementPath = "CRMMain"
	} )
	return self
end

MenuBuilder.registerType( "PowerPermanentUnlocks", PowerPermanentUnlocks )
LUI.FlowManager.RegisterStackPopBehaviour( "PowerPermanentUnlocks", f0_local1 )
LockTable( _M )
