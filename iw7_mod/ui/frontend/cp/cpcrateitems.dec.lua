local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "frontEnd.MP.armory.crateItems"
f0_local1 = function ()
	WipeGlobalModelsAtPath( f0_local0 )
end

f0_local2 = function ( f2_arg0, f2_arg1 )
	local f2_local0 = DataSources.frontEnd.CP.fortuneCards["1"]
	local f2_local1 = LUI.DataSourceFromList.new( #f2_arg1 )
	f2_local1.MakeDataSourceAtIndex = function ( f3_arg0, f3_arg1, f3_arg2 )
		f3_arg1 = f3_arg1 + 1
		local f3_local0 = Engine.TableLookup( CSV.zombieConsumableItems.File, CSV.zombieConsumableItems.Cols.LootID, LOOT.GetFortuneLootItemID( f2_arg1[f3_arg1] ), CSV.zombieConsumableItems.Cols.Ref )
		local f3_local1 = f2_local0:GetDataSourceAtIndex( FORTUNE_CARD_INFO[f3_local0].index )
		f3_local1.numOwned = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".card." .. f3_local0 .. ".numOwned", LOOT.GetFortuneCardAmount( f2_arg1[f3_arg1] ) )
		return f3_local1
	end
	
	return f2_local1
end

local f0_local3 = function ( f4_arg0, f4_arg1 )
	local f4_local0 = ARMORY.GetCrateFuncFromID( f4_arg0._crateID )
	return function ( f5_arg0, f5_arg1, f5_arg2 )
		f4_local0( f5_arg0, f5_arg1, f5_arg2 )
		local f5_local0 = LUI.FlowManager.GetScopedData( f4_arg0 )
		f5_local0.lastCrateUsedCODPoints = f5_arg2
	end
	
end

local f0_local4 = function ( f6_arg0, f6_arg1, f6_arg2 )
	return function ( f7_arg0, f7_arg1 )
		local f7_local0 = LUI.FlowManager.GetScopedData( f7_arg0 )
		LUI.FlowManager.RequestLeaveMenuByName( "live_dialog_text_box" )
		LUI.FlowManager.RequestLeaveMenu( f7_arg0 )
		LUI.FlowManager.RequestPopupMenu( f7_arg0, "LootCeremony", true, f6_arg1, false, {
			autoBurnError = f6_arg2,
			crateID = f7_arg0._crateID,
			usedCODPoints = f7_local0.lastCrateUsedCODPoints
		} )
		if f7_local0.lastCrateUsedCODPoints ~= nil then
			f7_arg0._lastCurrencyUsed = f7_arg0.PurchaseAgain:UpdatePurchaseAgain( f7_arg0._crateID, f6_arg1, f7_local0.lastCrateUsedCODPoints )
		end
	end
	
end

local f0_local5 = function ( f8_arg0, f8_arg1, f8_arg2 )
	local f8_local0 = Rewards.GetLootCrateRewards( f8_arg1 )
	assert( f8_local0 )
	assert( f8_arg0.bindButton )
	assert( f8_arg0.PurchaseAgain )
	assert( f8_arg2.crateID )
	assert( f8_arg0.BonusSalvage )
	f8_arg0:SetNoWrap( true )
	f8_arg0._crateID = f8_arg2.crateID
	
	local cardList = LUI.UIHorizontalList.new( {
		left = _1080p * 445,
		right = _1080p * 1400,
		top = _1080p * 300,
		bottom = _1080p * 900,
		leftAnchor = true,
		rightAnchor = false,
		topAnchor = true,
		bottomAnchor = false,
		alignment = LUI.Alignment.Left,
		spacing = _1080p * 35
	} )
	cardList:SetNoWrap( true )
	cardList.id = "cardList"
	f8_arg0:addElement( cardList )
	f8_arg0.cardList = cardList
	
	local f8_local2 = {}
	LOOT.PopulateLootCardsFromRewards( f8_arg0, f8_local0, LUI.ItemCard.contexts.CP_WEAPON_LOOT, f8_local2, f0_local0, f8_arg1, true )
	if f8_arg0._crateID == ARMORY.zombieCardPackID or f8_arg0._crateID == ARMORY.zombieRareCardPackID then
		local f8_local3 = ARMORY.GetTotalFortunePacks( f8_arg1 )
		f8_arg0.OpenFortuneCardPackButton.NumRemaining:setText( f8_local3 )
		if f8_local3 > 0 then
			f8_arg0.OpenFortuneCardPackButton:registerEventHandler( "button_action", function ( element, event )
				if f8_arg0._crateID == ARMORY.zombieRareCardPackID or f8_arg0._crateID == ARMORY.zombieCardPackID then
					if Loot.IsOwned( f8_arg1, ARMORY.zombieRareCardPackID ) > 0 then
						f8_arg0._crateID = ARMORY.zombieRareCardPackID
					elseif Loot.IsOwned( f8_arg1, ARMORY.zombieCardPackID ) > 0 then
						f8_arg0._crateID = ARMORY.zombieCardPackID
					end
				end
				local f9_local0 = LOOT.GetPurchaseLootCrateAction( nil, f8_arg1, Engine.Localize( LOOT.GetCrateTitle( f8_arg0._crateID ) ), f8_arg0._crateID, "", ARMORY.CrateTypes.NORMAL )
				f9_local0( element, event )
			end )
		else
			f8_arg0.OpenFortuneCardPackButton.ButtonLabel:setText( Engine.Localize( "LUA_MENU_ZM_RETURN_TO_STORE" ) )
			f8_arg0.OpenFortuneCardPackButton:registerEventHandler( "button_action", function ( element, event )
				LUI.FlowManager.RequestLeaveMenu( f8_arg0 )
			end )
		end
		ACTIONS.GainFocus( f8_arg0, "OpenFortuneCardPackButton", f8_arg1 )
		f8_arg0.PurchaseAgain:closeTree()
	else
		f8_arg0._lastCurrencyUsed = f8_arg0.PurchaseAgain:UpdatePurchaseAgain( f8_arg0._crateID, f8_arg1, f8_arg2.usedCODPoints )
		local f8_local3 = Engine.TableLookup( CSV.lootCrate.file, CSV.lootCrate.cols.index, f8_arg0._crateID, CSV.lootCrate.cols.displayImage )
		f8_arg0.PurchaseAgain.CrateImage:setImage( RegisterMaterial( f8_local3 ), 0 )
		f8_arg0.PurchaseAgain:registerEventHandler( "button_action", function ( element, event )
			local f11_local0 = LOOT.GetPurchaseLootCrateAction( f0_local3( f8_arg0, f8_arg1 ), f8_arg1, Engine.Localize( LOOT.GetCrateTitle( f8_arg0._crateID ) ), f8_arg0._crateID, f8_local3, ARMORY.CrateTypes.NORMAL, nil, f8_arg0._lastCurrencyUsed )
			f11_local0( element, event )
		end )
		ACTIONS.GainFocus( f8_arg0, "PurchaseAgain", f8_arg1 )
		f8_arg0.cardList:processEvent( {
			name = "loot_ceremony_complete",
			dispatchChildren = true
		} )
		f8_arg0.OpenFortuneCardPackButton:closeTree()
	end
	f8_arg0:registerEventHandler( "loot_crate_complete", f0_local4( f8_arg0, f8_arg1, false ) )
	f8_arg0:registerEventHandler( "auto_burn_error", f0_local4( f8_arg0, f8_arg1, true ) )
	f8_arg0:registerEventHandler( "reward_error", function ( element, event )
		LUI.FlowManager.RequestLeaveMenuByName( "live_dialog_text_box" )
		LUI.FlowManager.RequestPopupMenu( f8_arg0, "LootCrateErrorsPopup", true, f8_arg1, false )
	end )
	f8_arg0:registerEventHandler( "reward_crate_complete_error", function ( element, event )
		LUI.FlowManager.RequestLeaveMenuByName( "live_dialog_text_box" )
		LUI.FlowManager.RequestPopupMenu( f8_arg0, "LootCrateErrorsPopup", true, f8_arg1, false, {
			crate_complete_error = true
		} )
	end )
	f8_arg0.bindButton:addEventHandler( "button_secondary", function ()
		LUI.FlowManager.RequestLeaveMenu( f8_arg0 )
	end )
	local f8_local3 = {}
	local f8_local4 = {}
	f8_arg0.FortuneCardGrid:SetGridDataSource( f0_local2( f8_arg1, f8_local2 ) )
	f8_local4.name = LUI.DataSourceInControllerModel.new( f0_local0 .. ".fortuneCardTab.name", Engine.Localize( "LUA_MENU_ZM_FORTUNE_CARDS_CAPS" ) )
	f8_local4.focusFunction = function ( f15_arg0, f15_arg1, f15_arg2 )
		f8_arg0:addElement( f8_arg0.FortuneCardGrid )
		f8_arg0:removeElement( f8_arg0.cardList )
		ACTIONS.LoseFocus( f8_arg0, "cardList", f15_arg1 )
		ACTIONS.GainFocus( f8_arg0, "PurchaseAgain", f15_arg1 )
	end
	
	table.insert( f8_local3, f8_local4 )
	if f8_arg0.cardList:getNumChildren() > 0 then
		table.insert( f8_local3, {
			name = LUI.DataSourceInControllerModel.new( f0_local0 .. ".lootTab.name", ToUpperCase( Engine.Localize( "LUA_MENU_MP_LOOT" ) ) ),
			focusFunction = function ( f16_arg0, f16_arg1, f16_arg2 )
				f8_arg0:removeElement( f8_arg0.FortuneCardGrid )
				f8_arg0:addElement( f8_arg0.cardList )
			end
		} )
		f8_arg0.cardList:processEvent( {
			name = "reveal_duplicate_info",
			dispatchChildren = true
		} )
	end
	if #f8_local3 > 1 then
		local f8_local5 = LUI.DataSourceFromList.new( #f8_local3 )
		f8_local5.MakeDataSourceAtIndex = function ( f17_arg0, f17_arg1 )
			return f8_local3[f17_arg1 + 1]
		end
		
		f8_arg0.Tabs.Tabs:SetTabManagerDataSource( f8_local5 )
	else
		f8_arg0.Tabs:SetAlpha( 0 )
	end
end

function CPCrateItems( menu, controller )
	local self = LUI.UIHorizontalNavigator.new()
	self.id = "CPCrateItems"
	local f18_local1 = controller and controller.controllerIndex
	if not f18_local1 and not Engine.InFrontend() then
		f18_local1 = self:getRootController()
	end
	assert( f18_local1 )
	self:playSound( "menu_open" )
	local f18_local2 = self
	local Blur = nil
	
	Blur = LUI.UIBlur.new()
	Blur.id = "Blur"
	Blur:SetBlurStrength( 2, 0 )
	self:addElement( Blur )
	self.Blur = Blur
	
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 0, 0 )
	Background:SetAlpha( 0.75, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f18_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local f18_local6 = nil
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		f18_local6 = MenuBuilder.BuildRegisteredType( "MenuTitle", {
			controllerIndex = f18_local1
		} )
		f18_local6.id = "MenuTitle"
		f18_local6.MenuTitle:setText( ToUpperCase( "supply drop" ), 0 )
		f18_local6.MenuBreadcrumbs:setText( ToUpperCase( "Multiplayer / Missions / Armory" ), 0 )
		f18_local6.Icon:SetTop( _1080p * -28.5, 0 )
		f18_local6.Icon:SetBottom( _1080p * 61.5, 0 )
		f18_local6:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 96, _1080p * -96, _1080p * 54, _1080p * 134 )
		self:addElement( f18_local6 )
		self.MenuTitle = f18_local6
	end
	local f18_local7 = nil
	if Engine.IsAliensMode() then
		f18_local7 = MenuBuilder.BuildRegisteredType( "CPMenuTitle", {
			controllerIndex = f18_local1
		} )
		f18_local7.id = "CPMenuTitle"
		f18_local7.MenuTitle:setText( ToUpperCase( Engine.Localize( "LUA_MENU_ZM_ZOMBIE_CRATE" ) ), 0 )
		f18_local7:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
		self:addElement( f18_local7 )
		self.CPMenuTitle = f18_local7
	end
	local DupeText = nil
	
	DupeText = LUI.UIText.new()
	DupeText.id = "DupeText"
	DupeText:SetAlpha( 0, 0 )
	DupeText:setText( Engine.Localize( "MENU_NEW" ), 0 )
	DupeText:SetFontSize( 45 * _1080p )
	DupeText:SetFont( FONTS.GetFont( FONTS.Dev.File ) )
	DupeText:SetAlignment( LUI.Alignment.Center )
	DupeText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 1790, _1080p * 934, _1080p * 979 )
	self:addElement( DupeText )
	self.DupeText = DupeText
	
	local BonusSalvage = nil
	
	BonusSalvage = MenuBuilder.BuildRegisteredType( "BonusSalvage", {
		controllerIndex = f18_local1
	} )
	BonusSalvage.id = "BonusSalvage"
	BonusSalvage:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -360, _1080p * -60, _1080p * 390, _1080p * 690 )
	self:addElement( BonusSalvage )
	self.BonusSalvage = BonusSalvage
	
	local PurchaseAgain = nil
	
	PurchaseAgain = MenuBuilder.BuildRegisteredType( "LootCratePurchaseAgainButton", {
		controllerIndex = f18_local1
	} )
	PurchaseAgain.id = "PurchaseAgain"
	PurchaseAgain:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 60, _1080p * 360, _1080p * 390, _1080p * 690 )
	self:addElement( PurchaseAgain )
	self.PurchaseAgain = PurchaseAgain
	
	local MissionTeamInfo = nil
	
	MissionTeamInfo = MenuBuilder.BuildRegisteredType( "MissionTeamInfo", {
		controllerIndex = f18_local1
	} )
	MissionTeamInfo.id = "MissionTeamInfo"
	MissionTeamInfo:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -700, 0, _1080p * 54, _1080p * 141 )
	self:addElement( MissionTeamInfo )
	self.MissionTeamInfo = MissionTeamInfo
	
	local SocialFeed = nil
	
	SocialFeed = MenuBuilder.BuildRegisteredType( "SocialFeed", {
		controllerIndex = f18_local1
	} )
	SocialFeed.id = "SocialFeed"
	SocialFeed:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -115, _1080p * -85 )
	self:addElement( SocialFeed )
	self.SocialFeed = SocialFeed
	
	local Tabs = nil
	
	Tabs = MenuBuilder.BuildRegisteredType( "SubMenuTabsBar", {
		controllerIndex = f18_local1
	} )
	Tabs.id = "Tabs"
	Tabs:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 310, _1080p * 1610, _1080p * 140, _1080p * 180 )
	self:addElement( Tabs )
	self.Tabs = Tabs
	
	local FortuneCardGrid = nil
	
	FortuneCardGrid = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 3,
		maxVisibleRows = 1,
		controllerIndex = f18_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "fortuneCardInfo", {
				controllerIndex = f18_local1
			} )
		end,
		wrapX = true,
		wrapY = true,
		spacingX = _1080p * 35,
		spacingY = _1080p * 35,
		columnWidth = _1080p * 173,
		rowHeight = _1080p * 470,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Center,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	FortuneCardGrid.id = "FortuneCardGrid"
	FortuneCardGrid:setUseStencil( false )
	FortuneCardGrid:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -294.5, _1080p * 294.5, _1080p * 420, _1080p * 890 )
	self:addElement( FortuneCardGrid )
	self.FortuneCardGrid = FortuneCardGrid
	
	local OpenFortuneCardPackButton = nil
	
	OpenFortuneCardPackButton = MenuBuilder.BuildRegisteredType( "OpenFortunePackAgain", {
		controllerIndex = f18_local1
	} )
	OpenFortuneCardPackButton.id = "OpenFortuneCardPackButton"
	OpenFortuneCardPackButton:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 388, _1080p * 346.8, _1080p * 922.8 )
	self:addElement( OpenFortuneCardPackButton )
	self.OpenFortuneCardPackButton = OpenFortuneCardPackButton
	
	self.addButtonHelperFunction = function ( f20_arg0, f20_arg1 )
		f20_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_SELECT" ),
			button_ref = "button_primary",
			side = "left",
			clickable = true
		} )
		f20_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			clickable = true
		} )
	end
	
	self:addEventHandler( "menu_create", self.addButtonHelperFunction )
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	f0_local5( self, f18_local1, controller )
	return self
end

MenuBuilder.registerType( "CPCrateItems", CPCrateItems )
LUI.FlowManager.RegisterStackPopBehaviour( "CPCrateItems", f0_local1 )
LockTable( _M )
