local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "frontEnd.MP.armory.lootCeremony"
f0_local1 = {
	ItemValues = {
		1,
		2,
		3,
		4
	},
	BonusValues = {
		Legendary = 1,
		Epic = 2.5,
		MarkII = 2,
		PerCrateBonus = 0.25
	},
	ReactionThresholds = {
		SuperPositive = 8,
		Positive = 6,
		Neutral = 4.1
	}
}
f0_local2 = function ( f1_arg0 )
	local f1_local0 = 0
	local f1_local1 = 0
	local f1_local2 = false
	local f1_local3 = false
	for f1_local10, f1_local11 in ipairs( f1_arg0.lastLootDrops ) do
		for f1_local7, f1_local8 in ipairs( f1_local11 ) do
			f1_local0 = f1_local0 + f0_local1.ItemValues[f1_local8]
			if f1_local8 == Cac.HighestQuality - 1 then
				f1_local2 = true
			end
			if f1_local8 == Cac.HighestQuality then
				f1_local3 = true
			end
		end
		f1_local1 = f1_local1 + 1
	end
	if 0 < f1_local1 then
		local f1_local14 = f1_local0 / f1_local1
	end
	f1_local0 = f1_local14 or 0
	if f1_local2 then
		f1_local0 = f1_local0 + f0_local1.BonusValues.Legendary
	end
	if hadAnyEpic then
		f1_local0 = f1_local0 + f0_local1.BonusValues.Epic
	end
	f1_local0 = f1_local0 + f0_local1.BonusValues.PerCrateBonus * f1_local1
	f1_local4 = nil
	if f0_local1.ReactionThresholds.SuperPositive <= f1_local0 then
		f1_local4 = ARMORY.QuartermasterFiles.OverallLootReactions.SuperPositive
	elseif f0_local1.ReactionThresholds.Positive <= f1_local0 then
		f1_local4 = ARMORY.QuartermasterFiles.OverallLootReactions.Positive
	elseif f0_local1.ReactionThresholds.Neutral <= f1_local0 then
		f1_local4 = ARMORY.QuartermasterFiles.OverallLootReactions.Neutral
	else
		f1_local4 = ARMORY.QuartermasterFiles.OverallLootReactions.Negative
	end
	return f1_local4
end

local f0_local3 = function ()
	WipeGlobalModelsAtPath( f0_local0 )
end

local f0_local4 = function ( f3_arg0, f3_arg1, f3_arg2 )
	local f3_local0 = Rewards.GetLootCrateRewards( f3_arg1 )
	assert( f3_local0 )
	local f3_local1 = f3_local0.items
	local f3_local2 = f3_local0.dupes
	local f3_local3 = 3
	f3_arg0.hasDupes = false
	if Engine.IsAliensMode() then
		f3_local3 = 7
	end
	f3_arg0.DupeText:setText( "No Duplicates", 0 )
	f3_arg0.Background:SetAlpha( 0.75, 0 )
	f3_arg0.cardList:closeChildren()
	local f3_local4 = 0
	local f3_local5 = math.min( #f3_local1, f3_local3 )
	if Engine.IsAliensMode() then
		if f3_local5 > 1 then
			f3_arg0.cardList:SetAlignment( LUI.Alignment.Left )
		else
			f3_arg0.cardList:SetAlignment( LUI.Alignment.Center )
		end
	end
	if Engine.IsCoreMode() then
		for f3_local6 = 1, f3_local5, 1 do
			local f3_local9 = math.random( f3_local5 )
			f3_local1[f3_local9] = f3_local1[f3_local6]
			f3_local1[f3_local6] = f3_local1[f3_local9]
			f3_local2[f3_local9] = f3_local2[f3_local6]
			f3_local2[f3_local6] = f3_local2[f3_local9]
		end
	end
	local f3_local6 = {}
	Engine.PlaySound( "ui_iw7_loot_roll" )
	local f3_local7 = false
	WipeGlobalModelsAtPath( f0_local0 .. ".itemCard" )
	local f3_local8 = LOOT.PopulateLootCardsFromRewards( f3_arg0, f3_local0, LUI.ItemCard.contexts.LOOT_CEREMONY, f3_local6, f0_local0, f3_arg1, f3_local7 )
	if #f3_local6 > 0 then
		local f3_local10 = f3_arg0.cardList:getNumChildren()
		if f3_arg0._crateID == ARMORY.zombieCardPackID or f3_arg0._crateID == ARMORY.zombieRareCardPackID then
			f3_arg0:SetAlpha( 0 )
			LUI.FlowManager.RequestLeaveMenu( f3_arg0 )
			LUI.FlowManager.RequestAddMenu( "FortunePackOpening", false, f3_arg1, false, {
				controllerIndex = f3_arg1,
				cards = f3_local6,
				crateID = f3_arg0._crateID,
				usedCODPoints = f3_arg2.usedCODPoints,
				cardIndex = f3_local10
			} )
			return 
		end
		local f3_local9 = MenuBuilder.BuildRegisteredType( "LootFortuneItemCard", {
			controllerIndex = f3_arg1,
			cards = f3_local6,
			crateID = f3_arg0._crateID,
			cardIndex = f3_local10,
			usedCODPoints = f3_arg2.usedCODPoints
		} )
		if f3_local10 > 1 then
			f3_local9:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 215, _1080p * 465, _1080p * -205, _1080p * 205 )
		else
			f3_local9:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -125, _1080p * 125, _1080p * -205, _1080p * 205 )
		end
		f3_arg0:addElement( f3_local9 )
	end
	if Engine.IsCoreMode() then
		local f3_local10 = f3_arg0.cardList:getFirstChild()
		local f3_local9 = {}
		while f3_local10 do
			table.insert( f3_local9, f3_local10._itemCardData.quality and tonumber( f3_local10._itemCardData.quality:GetValue( f3_arg1 ) ) or 0 )
			f3_local10 = f3_local10:getNextSibling()
		end
		table.insert( f3_arg0.lastLootDrops, f3_local9 )
		if #f3_arg0.lastLootDrops > 5 then
			table.remove( f3_arg0.lastLootDrops, 1 )
		end
	end
	assert( f3_arg0.PurchaseAgain )
	assert( f3_arg0.MissionTeamInfo )
	assert( f3_arg0.CalculatingDupeSalvage )
	assert( f3_arg0.ItemCardsFrame )
	f3_arg0.ItemCardsFrame:SetAlpha( 0 )
	f3_arg0.MissionTeamInfo:SetAlpha( 0 )
	f3_arg0.MissionTeamInfo:UpdateDoubleXPTokens( f3_arg1 )
	f3_arg0.PurchaseAgain:SetHandleMouseButton( false )
	f3_arg0.PurchaseAgain:SetAlpha( 0 )
	f3_arg0.PurchaseAgain:SetScale( 1 )
	ACTIONS.LoseFocus( f3_arg0, "PurchaseAgain", f3_arg1 )
	f3_arg0.PurchaseAgain:SetFocusable( false )
	ACTIONS.AnimateSequenceByElement( f3_arg0, {
		elementName = "CalculatingDupeSalvage",
		sequenceName = "DefaultSequence",
		elementPath = "CalculatingDupeSalvage"
	} )
	local f3_local9 = f3_arg0:Wait( LOOT.RandomizeDuration * 5.75 )
	f3_local9.onComplete = function ()
		local f4_local0 = nil
		if f3_arg0._isBribeCrate then
			f4_local0 = Loot.IsOwned( f3_arg1, f3_arg0._crateID ) > 0
		else
			f4_local0 = ARMORY.AnyCratesAvailableForPurchase( f3_arg0._crateID, f3_arg1 )
		end
		Engine.PlaySound( "ui_iw7_loot_crate" )
		if f3_local5 > 1 and f4_local0 then
			f3_arg0.ItemCardsFrame:SetAlpha( 1, 200, LUI.EASING.outBack )
		end
		f3_arg0.MissionTeamInfo:SetAlpha( 1, 200, LUI.EASING.outBack )
		f3_arg0.Background:SetAlpha( 0, 200 )
		f3_arg0.cardList:processEvent( {
			name = "loot_ceremony_complete",
			dispatchChildren = true
		} )
		if f4_local0 then
			f3_arg0.PurchaseAgain:SetAlpha( 1, 200, LUI.EASING.outBack )
			f3_arg0.PurchaseAgain:SetScale( 0, 200, LUI.EASING.outBack )
			f3_arg0.PurchaseAgain:SetHandleMouseButton( true )
			f3_arg0.PurchaseAgain:SetFocusable( true )
			ACTIONS.GainFocus( f3_arg0, "PurchaseAgain", f3_arg1 )
			f3_arg0:AddButtonHelperText( {
				helper_text = Engine.Localize( "LUA_MENU_SELECT" ),
				button_ref = "button_primary",
				side = "left",
				clickable = true
			} )
		else
			if not f3_local8 then
				f3_arg0:RemoveButtonHelperText( "button_primary", "left" )
			end
			ACTIONS.GainFocus( f3_arg0, "cardList", f3_arg1 )
		end
		f3_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			clickable = true
		} )
		f3_arg0.initialCeremonyComplete = true
		if f3_arg0._crateID == ARMORY.GetEventCrateID() then
			ARMORY.PlayBribeAnim( f3_arg0, f3_arg0._crateID )
		elseif f3_arg0.bestLootQuality ~= nil then
			FrontEndScene.PlayQuarterMasterQualityReaction( f3_arg0, f3_arg0.bestLootQuality )
		end
		if f3_arg0.hasDupes then
			Engine.PlaySound( "ui_iw7_loot_dup_calculate" )
			ACTIONS.AnimateSequenceByElement( f3_arg0, {
				elementName = "CalculatingDupeSalvage",
				sequenceName = "Show",
				elementPath = "CalculatingDupeSalvage"
			} )
			f3_local9 = f3_arg0:Wait( 2000 )
			f3_local9.onComplete = function ()
				f3_arg0.cardList:processEvent( {
					name = "reveal_duplicate_info",
					dispatchChildren = true
				} )
				ACTIONS.AnimateSequenceByElement( f3_arg0, {
					elementName = "CalculatingDupeSalvage",
					sequenceName = "Hide",
					elementPath = "CalculatingDupeSalvage"
				} )
			end
			
		end
	end
	
	if f3_arg2.autoBurnError then
		f3_arg0.DupeText:setText( "Error Auto Burning Dupes", 0 )
	end
end

local f0_local5 = function ( f6_arg0, f6_arg1 )
	return function ( f7_arg0, f7_arg1 )
		if f7_arg0.initialCeremonyComplete then
			LUI.FlowManager.RequestLeaveMenuByName( "live_dialog_text_box" )
			f0_local4( f7_arg0, f6_arg0, {
				autoBurnError = f6_arg1
			} )
			local f7_local0 = LUI.FlowManager.GetScopedData( f7_arg0 )
			if f7_local0.lastCrateUsedCODPoints ~= nil then
				f7_arg0._lastCurrencyUsed = f7_arg0.PurchaseAgain:UpdatePurchaseAgain( f7_arg0._crateID, f6_arg0, f7_local0.lastCrateUsedCODPoints )
			end
		end
	end
	
end

local f0_local6 = function ( f8_arg0 )
	local f8_local0 = f8_arg0._crateID
	local f8_local1 = ARMORY.GetCrateFuncFromID( f8_local0 )
	if f8_local0 == Engine.GetDvarInt( "online_bundle_crate_id" ) or f8_local0 == Engine.GetDvarInt( "online_bundle2_crate_id" ) or f8_local0 == Engine.GetDvarInt( "online_zbundle_crate_id" ) then
		return function ( f9_arg0, f9_arg1, f9_arg2, f9_arg3 )
			f8_local1( f9_arg0, f9_arg1, f9_arg2, f9_arg3 )
			local f9_local0 = LUI.FlowManager.GetScopedData( f8_arg0 )
			f9_local0.lastCrateUsedCODPoints = f9_arg2
		end
		
	else
		return function ( f10_arg0, f10_arg1, f10_arg2 )
			f8_local1( f10_arg0, f10_arg1, f10_arg2 )
			local f10_local0 = LUI.FlowManager.GetScopedData( f8_arg0 )
			f10_local0.lastCrateUsedCODPoints = f10_arg2
		end
		
	end
end

local f0_local7 = function ( f11_arg0, f11_arg1, f11_arg2 )
	assert( f11_arg2 )
	local f11_local0 = _1080p * 35
	f11_arg0.lastLootDrops = {}
	f11_arg0:SetNoWrap( true )
	local self = LUI.UIBindButton.new()
	self:addEventHandler( "button_secondary", function ( f12_arg0, f12_arg1 )
		LUI.FlowManager.RequestLeaveMenu( f11_arg0 )
		if Engine.IsCoreMode() then
			local f12_local0 = LUI.FlowManager.GetScopedData( "Armory" )
			f12_local0.overallReactionFile = f0_local2( f11_arg0 )
		end
	end )
	f11_arg0:addElement( self )
	self:addEventHandler( "gamepad_sticks", function ( f13_arg0, f13_arg1 )
		return true
	end )
	f11_arg0.DupeText:setText( "No Duplicates", 0 )
	if Engine.IsCoreMode() then
		f11_arg0.MenuTitle.MenuBreadcrumbs:setText( ToUpperCase( Engine.Localize( "LUA_MENU_BREADCRUMB_2_ITEMS", "MENU_MULTIPLAYER", "LUA_MENU_PUBLIC_MATCH_CAPS" ), 0 ) )
	end
	local cardList = LUI.UIHorizontalList.new( {
		left = _1080p * 445,
		right = _1080p * 1400,
		top = _1080p * 300,
		bottom = _1080p * 900,
		leftAnchor = true,
		rightAnchor = false,
		topAnchor = true,
		bottomAnchor = false,
		alignment = Engine.IsCoreMode() and LUI.Alignment.Center or LUI.Alignment.Left,
		spacing = f11_local0
	} )
	cardList:SetNoWrap( true )
	cardList.id = "cardList"
	f11_arg0:addElement( cardList )
	f11_arg0.cardList = cardList
	
	assert( f11_arg0.PurchaseAgain )
	assert( f11_arg0.PurchaseAgain.Cost )
	assert( f11_arg0.PurchaseAgain.KeyIcon )
	assert( f11_arg0.PurchaseAgain.CrateImage )
	assert( f11_arg2.crateID )
	f11_arg0._isBribeCrate = f11_arg2.isBribeCrate
	f11_arg0._crateID = f11_arg2.crateID
	f11_arg0._lastCurrencyUsed = f11_arg0.PurchaseAgain:UpdatePurchaseAgain( f11_arg0._crateID, f11_arg1, f11_arg2.usedCODPoints )
	local f11_local3 = ""
	if f11_arg0._crateID == ARMORY.GetEventCrateID() then
		f11_local3 = Engine.GetDvarString( "online_quartermaster_event_image" )
	else
		f11_local3 = Engine.TableLookup( CSV.lootCrate.file, CSV.lootCrate.cols.index, f11_arg0._crateID, CSV.lootCrate.cols.displayImage )
	end
	f11_arg0.PurchaseAgain.CrateImage:setImage( RegisterMaterial( f11_local3 ), 0 )
	f11_arg0.PurchaseAgain:registerEventHandler( "button_action", function ( element, event )
		local f14_local0 = nil
		if not f11_arg0._isBribeCrate then
			f14_local0 = f0_local6( f11_arg0 )
		end
		local f14_local1 = Engine.Localize( LOOT.GetCrateTitle( f11_arg0._crateID ) )
		local f14_local2 = ARMORY.CrateTypes.NORMAL
		if f11_arg0._crateID == ARMORY.GetEventCrateID() then
			f14_local2 = ARMORY.CrateTypes.EVENT
		elseif f11_arg0._crateID == Engine.GetDvarInt( "online_bundle_crate_id" ) then
			f14_local2 = ARMORY.CrateTypes.BUNDLE
		elseif f11_arg0._crateID == Engine.GetDvarInt( "online_bundle2_crate_id" ) then
			f14_local2 = ARMORY.CrateTypes.SECOND_BUNDLE
		elseif f11_arg0._crateID == Engine.GetDvarInt( "online_zbundle_crate_id" ) then
			f14_local2 = ARMORY.CrateTypes.ZOMBIE_BUNDLE
		end
		local f14_local3 = LOOT.GetPurchaseLootCrateAction( f14_local0, f11_arg1, f14_local1, f11_arg0._crateID, f11_local3, f14_local2, nil, f11_arg0._lastCurrencyUsed )
		f14_local3( element, event )
	end )
	f11_arg0:registerEventHandler( "loot_crate_complete", f0_local5( f11_arg1, false ) )
	f11_arg0:registerEventHandler( "auto_burn_error", f0_local5( f11_arg1, true ) )
	f11_arg0:registerEventHandler( "reward_error", function ( element, event )
		LUI.FlowManager.RequestLeaveMenuByName( "live_dialog_text_box" )
		LUI.FlowManager.RequestPopupMenu( f11_arg0, "LootCrateErrorsPopup", true, f11_arg1, false )
	end )
	f11_arg0:registerEventHandler( "reward_crate_complete_error", function ( element, event )
		LUI.FlowManager.RequestLeaveMenuByName( "live_dialog_text_box" )
		LUI.FlowManager.RequestPopupMenu( f11_arg0, "LootCrateErrorsPopup", true, f11_arg1, false, {
			crate_complete_error = true
		} )
	end )
	f11_arg0:addElement( LOOT.GetLootMaterialStreamer() )
	f0_local4( f11_arg0, f11_arg1, f11_arg2 )
	f11_arg0:registerEventHandler( "gain_focus", function ( element, event )
		return true
	end )
end

function LootCeremony( menu, controller )
	local self = LUI.UIHorizontalNavigator.new()
	self.id = "LootCeremony"
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
	
	local ItemCardsFrame = nil
	
	ItemCardsFrame = LUI.UIImage.new()
	ItemCardsFrame.id = "ItemCardsFrame"
	ItemCardsFrame:setImage( RegisterMaterial( "loot_item_cards_frame" ), 0 )
	ItemCardsFrame:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -971, _1080p * 605, _1080p * -342, _1080p * 342 )
	self:addElement( ItemCardsFrame )
	self.ItemCardsFrame = ItemCardsFrame
	
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f18_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local f18_local7 = nil
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		f18_local7 = MenuBuilder.BuildRegisteredType( "MenuTitle", {
			controllerIndex = f18_local1
		} )
		f18_local7.id = "MenuTitle"
		f18_local7.MenuTitle:setText( ToUpperCase( Engine.Localize( "MP_FRONTEND_ONLY_SUPPLY_DROP" ) ), 0 )
		f18_local7.MenuBreadcrumbs:setText( ToUpperCase( "Multiplayer / Missions / Armory" ), 0 )
		f18_local7.Icon:SetTop( _1080p * -28.5, 0 )
		f18_local7.Icon:SetBottom( _1080p * 61.5, 0 )
		f18_local7:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 96, _1080p * -96, _1080p * 54, _1080p * 134 )
		self:addElement( f18_local7 )
		self.MenuTitle = f18_local7
	end
	local f18_local8 = nil
	if Engine.IsAliensMode() then
		f18_local8 = MenuBuilder.BuildRegisteredType( "CPMenuTitle", {
			controllerIndex = f18_local1
		} )
		f18_local8.id = "CPMenuTitle"
		f18_local8.MenuTitle:setText( ToUpperCase( Engine.Localize( "LUA_MENU_ZM_ZOMBIE_CRATE" ) ), 0 )
		f18_local8:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 86, _1080p * 1046, _1080p * 37, _1080p * 117 )
		self:addElement( f18_local8 )
		self.CPMenuTitle = f18_local8
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
	
	local CalculatingDupeSalvage = nil
	
	CalculatingDupeSalvage = MenuBuilder.BuildRegisteredType( "CalculatingDupeSalvage", {
		controllerIndex = f18_local1
	} )
	CalculatingDupeSalvage.id = "CalculatingDupeSalvage"
	CalculatingDupeSalvage:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -300, _1080p * 300, _1080p * 160, _1080p * 224 )
	self:addElement( CalculatingDupeSalvage )
	self.CalculatingDupeSalvage = CalculatingDupeSalvage
	
	f0_local7( self, f18_local1, controller )
	return self
end

MenuBuilder.registerType( "LootCeremony", LootCeremony )
LUI.FlowManager.RegisterStackPopBehaviour( "LootCeremony", f0_local3 )
LockTable( _M )
