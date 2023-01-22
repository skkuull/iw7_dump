local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
LUI.FlowManager.RegisterFenceGroup( "Armory", {
	"onlineServices",
	"onlineData",
	"patch",
	"exchange"
} )
f0_local0 = function ()
	if Engine.IsAliensMode() then
		Engine.SetFrontEndSceneSection( "zm_survival_depot", 1 )
	end
end

f0_local1 = "frontEnd.MP.armory"
function PopFunc()
	WipeGlobalModelsAtPath( f0_local1 )
	Onboarding:ResetFlow( Onboarding.Quartermaster )
	ClientCharacter.PlayCharacterAnim( FrontEndScene.ClientCharacters.quarterMaster, "iw7_mp_quartermaster_idle_01_nosound", 0.2 )
end

MenuBuilder.registerType( "QuartermasterCipherPopup", function ( f3_arg0, f3_arg1 )
	local f3_local0 = {
		title = Engine.Localize( "LUA_MENU_MP_QUARTERMASTER_CIPHER" ),
		width = _1080p * 320,
		cancelClosesPopup = true,
		listContent = {}
	}
	table.insert( f3_local0.listContent, f3_arg1.itemCard )
	local f3_local1 = MenuBuilder.BuildRegisteredType( "PopupList", f3_local0 )
	f3_local1.id = "QuartermasterCipherPopup"
	return f3_local1
end )
MenuBuilder.registerType( "NotEnoughKeysPopup", function ()
	local f4_local0 = MenuBuilder.BuildRegisteredType( "PopupOK", {
		message = Engine.Localize( "LUA_MENU_MP_SUPPLY_DROP_NO" )
	} )
	f4_local0.id = "NotEnoughKeys"
	return f4_local0
end )
MenuBuilder.registerType( "NotEnoughSalvagePopup", function ()
	local f5_local0 = MenuBuilder.BuildRegisteredType( "PopupOK", {
		message = Engine.Localize( "LUA_MENU_MP_NOT_ENOUGH_SALVAGE" )
	} )
	f5_local0.id = "NotEnoughSalvage"
	return f5_local0
end )
MenuBuilder.registerType( "LootCrateErrorsPopup", function ( f6_arg0, f6_arg1 )
	local f6_local0 = {}
	if f6_arg1.crate_complete_error then
		f6_local0.message = Engine.Localize( "LUA_MENU_MP_SUPPLY_DROP_CRATE_COMPLETE_ERROR" )
	else
		f6_local0.message = Engine.Localize( "LUA_MENU_MP_SUPPLY_DROP_ERROR" )
	end
	local f6_local1 = MenuBuilder.BuildRegisteredType( "PopupOK", f6_local0 )
	f6_local1.id = "LootCrateError"
	return f6_local1
end )
local f0_local3 = function ( f7_arg0, f7_arg1, f7_arg2 )
	return function ( f8_arg0, f8_arg1 )
		LUI.FlowManager.RequestLeaveMenuByName( "live_dialog_text_box" )
		local f8_local0 = LUI.FlowManager.GetScopedData( f8_arg0 )
		assert( f8_local0.lastPurchasedCrateID )
		local f8_local1 = 0
		if f8_local0.lastPurchasedCrateID == Engine.GetDvarInt( "online_bundle_crate_id" ) then
			f8_local1 = Engine.GetDvarInt( "online_bundle_contains_bribes" )
		elseif f8_local0.lastPurchasedCrateID == Engine.GetDvarInt( "online_bundle2_crate_id" ) then
			f8_local1 = Engine.GetDvarInt( "online_bundle2_contains_bribes" )
		elseif f8_local0.lastPurchasedCrateID == Engine.GetDvarInt( "online_zbundle_crate_id" ) then
			f8_local1 = Engine.GetDvarInt( "online_zbundle_contains_bribes" )
		end
		if f8_local1 > 0 then
			if CONDITIONS.AreBribeCratesEnabled( f8_arg0 ) then
				for f8_local2 = 0, #f8_arg0.tabNamesAndIDs - 1, 1 do
					if f8_arg0.tabNamesAndIDs[f8_local2 + 1].id == ARMORY.TabIDs.SUPPLY_DROPS then
						f8_arg0.Tabs:FocusTab( f8_local2, FocusType.Gamepad )
					end
				end
			end
		else
			local f8_local2, f8_local3, f8_local4, f8_local5, f8_local6 = false
			if f8_local0.lastPurchasedCrateID == Engine.GetDvarInt( "online_bundle_crate_id" ) then
				f8_local2 = true
				f8_local3 = Engine.GetDvarString( "online_bundle_desc" )
				f8_local4 = math.max( ARMORY.GetMaxCratesPurchasable( f8_local0.lastPurchasedCrateID ) - Loot.IsOwned( f7_arg1, Engine.GetDvarInt( "online_bundle_tracker_id" ) ), 0 )
				if 0 == Engine.GetDvarInt( "online_bundle_tracker_id" ) or f8_local4 >= 1 then
					f8_local5 = false
				else
					f8_local5 = true
				end
				f8_local6 = f7_arg0.BundleButton
				if f8_local5 then
					f8_local6:SetButtonDisabled( true )
				end
				if Engine.GetDvarBool( "online_bundle_show_ceremony" ) == true then
					local f8_local7 = {
						autoBurnError = f7_arg2,
						crateID = f8_local0.lastPurchasedCrateID,
						usedCODPoints = f8_local0.lastPurchasedUsedCODPoints,
						isBribeCrate = f7_arg0.isBribeCrate
					}
					f7_arg0.isBribeCrate = nil
					LUI.FlowManager.RequestAddMenu( "LootCeremony", true, f7_arg1, false, f8_local7, true )
				end
			elseif f8_local0.lastPurchasedCrateID == Engine.GetDvarInt( "online_bundle2_crate_id" ) then
				f8_local2 = true
				f8_local3 = Engine.GetDvarString( "online_bundle2_desc" )
				f8_local4 = math.max( ARMORY.GetMaxCratesPurchasable( f8_local0.lastPurchasedCrateID ) - Loot.IsOwned( f7_arg1, Engine.GetDvarInt( "online_bundle2_tracker_id" ) ), 0 )
				if 0 == Engine.GetDvarInt( "online_bundle2_tracker_id" ) or f8_local4 >= 1 then
					f8_local5 = false
				else
					f8_local5 = true
				end
				local f8_local7 = Engine.IsCoreMode()
				if f8_local7 then
					f8_local7 = ARMORY.IsBundleEnabled( ARMORY.BundlesData.Bundle1 )
					if f8_local7 then
						f8_local7 = ARMORY.IsBundleEnabled( ARMORY.BundlesData.Bundle2 )
					end
				end
				if f8_local7 then
					f8_local6 = f7_arg0.BundleButton2
				else
					f8_local6 = f7_arg0.BundleButton
				end
				if f8_local5 then
					f8_local6:SetButtonDisabled( true )
				end
				if Engine.GetDvarBool( "online_bundle2_show_ceremony" ) == true then
					local f8_local8 = {
						autoBurnError = f7_arg2,
						crateID = f8_local0.lastPurchasedCrateID,
						usedCODPoints = f8_local0.lastPurchasedUsedCODPoints,
						isBribeCrate = f7_arg0.isBribeCrate
					}
					f7_arg0.isBribeCrate = nil
					LUI.FlowManager.RequestAddMenu( "LootCeremony", true, f7_arg1, false, f8_local8, true )
				end
			elseif f8_local0.lastPurchasedCrateID == Engine.GetDvarInt( "online_zbundle_crate_id" ) then
				f8_local2 = true
				f8_local3 = Engine.GetDvarString( "online_zbundle_desc" )
				f8_local4 = math.max( ARMORY.GetMaxCratesPurchasable( f8_local0.lastPurchasedCrateID ) - Loot.IsOwned( f7_arg1, Engine.GetDvarInt( "online_zbundle_tracker_id" ) ), 0 )
				if 0 == Engine.GetDvarInt( "online_zbundle_tracker_id" ) or f8_local4 >= 1 then
					f8_local5 = false
				else
					f8_local5 = true
				end
				f8_local6 = f7_arg0.BundleButton
				if f8_local5 then
					f8_local6:SetButtonDisabled( true )
				end
			else
				local f8_local7 = {
					autoBurnError = f7_arg2,
					crateID = f8_local0.lastPurchasedCrateID,
					usedCODPoints = f8_local0.lastPurchasedUsedCODPoints,
					isBribeCrate = f7_arg0.isBribeCrate
				}
				f7_arg0.isBribeCrate = nil
				LUI.FlowManager.RequestAddMenu( "LootCeremony", true, f7_arg1, false, f8_local7, true )
			end
			if f8_local2 then
				assert( f8_local6 )
				local f8_local7 = nil
				if f8_local5 then
					f8_local7 = Engine.Localize( f8_local3, "LUA_MENU_MP_ARMORY_ITEM_SOLD_OUT" )
					ACTIONS.AnimateSequence( f8_local6, "SoldOut" )
				else
					f8_local7 = Engine.Localize( f8_local3, f8_local4 )
					ACTIONS.AnimateSequence( f8_local6, "Available" )
				end
				f8_local6.buttonDescription = f8_local7
			end
		end
	end
	
end

local f0_local4 = function ( f9_arg0, f9_arg1, f9_arg2 )
	return function ( f10_arg0, f10_arg1, f10_arg2 )
		f9_arg1( f10_arg0, f10_arg1, f10_arg2, f9_arg2 )
		local f10_local0 = LUI.FlowManager.GetScopedData( f9_arg0 )
		f10_local0.lastPurchasedCrateID = f9_arg2
		f10_local0.lastPurchasedUsedCODPoints = f10_arg2
	end
	
end

local f0_local5 = function ( f11_arg0, f11_arg1, f11_arg2 )
	if f11_arg0.ButtonDescription then
		local f11_local0 = f11_arg0.ButtonDescription.Description
		f11_local0:SetStartupDelay( 1000 )
		f11_local0:SetLineHoldTime( 400 )
		f11_local0:SetAnimMoveTime( 150 )
		f11_local0:SetEndDelay( 1000 )
		f11_local0:SetCrossfadeTime( 400 )
		f11_local0:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollV )
		f11_local0:SetMaxVisibleLines( f11_arg2 )
	end
end

local f0_local6 = function ( f12_arg0, f12_arg1 )
	local f12_local0 = MenuBuilder.BuildRegisteredType( "ButtonDescriptionText", {
		controllerIndex = f12_arg1
	} )
	f12_local0.id = "ButtonDescription"
	f12_local0.Description:SetRight( _1080p * 680, 0 )
	f12_local0:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 70 )
	f12_local0:setPriority( 10 )
	f12_arg0.ButtonDescription = f12_local0
	local f12_local1 = f12_local0.Description
	f12_local1:SetShadowMinDistance( -0.2, 0 )
	f12_local1:SetShadowMaxDistance( 0.2, 0 )
	f12_local1:SetShadowRGBFromInt( 0, 0 )
	f12_local1:SetShadowUOffset( -0 )
	f12_local1:SetShadowVOffset( -0 )
	return f12_local0
end

local f0_local7 = function ( f13_arg0, f13_arg1 )
	local f13_local0 = MenuBuilder.BuildRegisteredType( "FeaturedItemButton", {
		controllerIndex = f13_arg1
	} )
	f13_local0.id = "PurchaseEventCrate"
	f13_local0.Image:setImage( RegisterMaterial( "armory_loot_crate_rare" ), 0 )
	f13_local0.InventoryButton.ArmoryButton.TitleText:setText( "", 0 )
	f13_local0:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 200 )
	f13_arg0.PurchaseEventCrate = f13_local0
	local self = LUI.UIHorizontalList.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 680, 0, _1080p * 200 )
	self.id = "eventCrateRow"
	self:addElement( f13_local0 )
	return self
end

local f0_local8 = function ( f14_arg0 )
	if f14_arg0.PurchaseEventCrate then
		f14_arg0.PurchaseEventCrate:closeTree()
		f14_arg0.PurchaseEventCrate = nil
	end
end

local f0_local9 = function ( f15_arg0, f15_arg1 )
	local f15_local0 = nil
	if not f15_arg0.PurchaseEventCrate then
		f15_local0 = f0_local7( f15_arg0, f15_arg1 )
	end
	assert( f15_arg0.PurchaseEventCrate.FeatureItemBanner.EventTimer )
	f15_arg0.PurchaseEventCrate.FeatureItemBanner.EventTimer.timer:setEndTime( ARMORY.GetEventCrateEndTime() )
	f15_arg0.PurchaseEventCrate.FeatureItemBanner.EventTimer:SetAlpha( 1 )
	f15_arg0.PurchaseEventCrate.BankedCrates:SetAlpha( 0 )
	f15_arg0.PurchaseEventCrate.FeatureItemBanner:SetAlpha( 1 )
	f15_arg0.PurchaseEventCrate.FeatureItemBanner.OfferText:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_ARMORY_LIMITED_OFFER" ) ), 0 )
	f15_arg0.PurchaseEventCrate.InventoryButton.ArmoryButton.BGImage:setImage( RegisterMaterial( "event_button_bg" ), 0 )
	f15_arg0.PurchaseEventCrate.InventoryButton.ArmoryButton.BGImage:SetAlpha( 0.6, 0 )
	local f15_local1 = ARMORY.GetEventCrateID()
	f15_arg0.currentEventCrateID = f15_local1
	Engine.SetPlayerDataEx( f15_arg1, CoD.StatsGroup.Common, "quartermasterEventIDs", 0, f15_local1 )
	local f15_local2 = Engine.GetDvarString( "online_quartermaster_event_image" )
	local f15_local3 = Engine.GetDvarString( "online_quartermaster_event_name" )
	local f15_local4 = Engine.GetDvarString( "online_quartermaster_event_desc" )
	local f15_local5, f15_local6 = nil
	local f15_local7 = ARMORY.GetMaxCratesPurchasable( f15_local1 )
	if f15_local7 and f15_local7 > 0 then
		local f15_local8 = 0
		local f15_local9 = ARMORY.GetNumCratesPurchased( f15_local1, f15_arg1 )
		if f15_local9 then
			f15_local8 = math.max( f15_local7 - f15_local9, 0 )
		end
		f15_local5 = Engine.Localize( f15_local3, f15_local8 )
		if f15_local8 < 1 then
			f15_local6 = Engine.Localize( f15_local4, "LUA_MENU_MP_ARMORY_ITEM_SOLD_OUT" )
			ACTIONS.AnimateSequence( f15_arg0.PurchaseEventCrate, "SoldOut" )
			f15_arg0.PurchaseEventCrate:SetButtonDisabled( true )
			if Engine.GetDvarBool( "online_quartermaster_event" ) then
				f15_arg0.PurchaseEventCrate.FeatureItemBanner.EventTimer:SetAlpha( 0 )
			end
		else
			f15_local6 = Engine.Localize( f15_local4, f15_local8 )
			ACTIONS.AnimateSequence( f15_arg0.PurchaseEventCrate, "Available" )
			if not Onboarding:IsFlowInProgress( Onboarding.Quartermaster ) then
				f15_arg0.PurchaseEventCrate:SetButtonDisabled( false )
			end
		end
		f15_arg0.PurchaseEventCrate.FeatureItemBanner.LimitText:setText( Engine.Localize( "LUA_MENU_MP_ARMORY_PURCHASE_LIMIT", f15_local8 ) )
	else
		f15_local5 = Engine.Localize( f15_local3 )
		f15_local6 = Engine.Localize( f15_local4 )
		ACTIONS.AnimateSequence( f15_arg0.PurchaseEventCrate, "Available" )
	end
	if Onboarding:IsFlowInProgress( Onboarding.Quartermaster ) then
		f15_arg0.PurchaseEventCrate:SetButtonDisabled( true )
	end
	RefreshEventCrateDataSources( f15_arg1 )
	f15_arg0.PurchaseEventCrate:SetDataSource( DataSources.frontEnd.MP.armory.eventCrate, f15_arg1 )
	f15_arg0.PurchaseEventCrate.buttonDescription = f15_local6
	f15_arg0.PurchaseEventCrate.InventoryButton.ArmoryButton.TitleText:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_ARMORY_EVENT" ) ), 0 )
	f15_arg0.PurchaseEventCrate.ItemName:setText( ToUpperCase( f15_local5 ), 0 )
	f15_arg0.PurchaseEventCrate.Image:setImage( RegisterMaterial( f15_local2 ), 0 )
	if Engine.IsPC() then
		assert( f15_arg0.PurchaseEventCrate.InventoryButton )
		f15_arg0.PurchaseEventCrate.InventoryButton.buttonDescription = f15_local6
	end
	f15_arg0.PurchaseEventCrate:registerEventHandler( "button_action", LOOT.GetPurchaseLootCrateAction( f0_local4( f15_arg0, ARMORY.BuyEventCrate, f15_local1 ), f15_arg1, f15_local5, f15_local1, f15_local2, ARMORY.CrateTypes.EVENT ) )
	return f15_local0
end

local f0_local10 = function ( f16_arg0 )
	if f16_arg0.BribesGrid then
		f16_arg0.BribesGrid:closeTree()
		f16_arg0.BribesGrid = nil
	end
	if f16_arg0.ArrowsWithLabel then
		f16_arg0.ArrowsWithLabel:closeTree()
		f16_arg0.ArrowsWithLabel = nil
	end
end

local f0_local11 = function ( f17_arg0, f17_arg1 )
	if not f17_arg0.BribesGrid then
		local self = LUI.UIGrid.new( nil, {
			maxVisibleColumns = 2,
			maxVisibleRows = 2,
			controllerIndex = f17_arg1,
			buildChild = function ()
				return MenuBuilder.BuildRegisteredType( "BribeButton", {
					controllerIndex = f17_arg1
				} )
			end,
			refreshChild = function ( f19_arg0, f19_arg1, f19_arg2 )
				
			end,
			numRows = 2,
			numColumns = 2,
			spacingX = _1080p * 10,
			spacingY = _1080p * 10,
			columnWidth = _1080p * 335,
			rowHeight = _1080p * 150,
			adjustSizeToContent = true
		} )
		self.id = "BribesGrid"
		self:setUseStencil( true )
		f17_arg0.BribesGrid = self
		self:SetDefaultFocus( function ()
			if f17_arg0.hacksGridFocusItem then
				return f17_arg0.hacksGridFocusItem
			else
				return {
					x = 0,
					y = 0
				}
			end
		end )
		local f17_local1 = ARMORY.GetLootCrateTable( f17_arg1 )
		self:SetNumColumns( 2 )
		self:SetNumRows( nil )
		self:SetNumChildren( #f17_local1 )
		self:SetRefreshChild( function ( f21_arg0, f21_arg1, f21_arg2 )
			f21_arg0:SetupBribeButtonData( f17_local1[f21_arg2 * 2 + f21_arg1 + 1] )
		end )
		self:RefreshContent()
		self:registerEventHandler( "refresh_hacks_grid", function ( element, event )
			f17_local1 = ARMORY.GetLootCrateTable( f17_arg1 )
			self:SetNumChildren( #f17_local1 )
			self:RefreshContent()
		end )
		if #f17_local1 > 2 then
			f0_local5( f17_arg0, f17_arg1, 2 )
		end
		local f17_local2 = nil
		if #f17_local1 > 0 then
			f17_local2 = LUI.UIStyledText.new()
			f17_local2.id = "HacksLabel"
			f17_local2:setText( LocalizeString( ToUpperCase( Engine.Localize( "MENU_INVENTORY" ) ) ), 0 )
			f17_local2:SetFontSize( 28 * _1080p )
			f17_local2:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
			f17_local2:SetAlignment( LUI.Alignment.Left )
			f17_local2:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 680, _1080p * 0, _1080p * 28 )
			f17_local2:SetShadowMinDistance( -0.2, 0 )
			f17_local2:SetShadowMaxDistance( 0.2, 0 )
			f17_local2:SetShadowRGBFromInt( 0, 0 )
			f17_local2:SetShadowUOffset( -0 )
			f17_local2:SetShadowVOffset( -0 )
		end
		local f17_local3 = nil
		if #f17_local1 > 4 then
			f17_local3 = MenuBuilder.BuildRegisteredType( "GridCountArrows", {
				controllerIndex = f17_arg1
			} )
			f17_local3.id = "ArrowsWithLabel"
			f17_local3:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 24 )
			f17_arg0.ArrowsWithLabel = f17_local3
			f17_arg0.BribesGrid:AddArrow( f17_arg0.ArrowsWithLabel.ArrowDown )
			f17_arg0.BribesGrid:AddArrow( f17_arg0.ArrowsWithLabel.ArrowUp )
			f17_arg0.BribesGrid:AddItemNumbers( f17_arg0.ArrowsWithLabel.ListCount )
			f17_arg0.ArrowsWithLabel.ListCount:setText( Engine.Localize( "LUA_MENU_X_OF_Y", 1, #f17_local1 ) )
			f17_arg0.ArrowsWithLabel.ArrowDown.m_requireFocusType = FocusType.MouseOver
			f17_arg0.ArrowsWithLabel.ArrowUp.m_requireFocusType = FocusType.MouseOver
		end
		return self, f17_local3, f17_local2
	else
		
	end
end

local f0_local12 = function ( f23_arg0, f23_arg1, f23_arg2 )
	f23_arg0.ArmoryButton.BGImage:SetAlpha( 0 )
	f23_arg0.Image:setImage( RegisterMaterial( f23_arg1 ) )
	f23_arg0.ItemName:setText( ToUpperCase( Engine.Localize( f23_arg2 ) ) )
	f23_arg0.ArmoryButton.TitleText:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_ARMORY_EVENT" ) ) )
	f23_arg0.Image:SetAlpha( 1 )
	f23_arg0.ItemName:SetAlpha( 1 )
end

local f0_local13 = function ( f24_arg0, f24_arg1 )
	local f24_local0 = false
	local f24_local1 = false
	Engine.SetPlayerDataEx( f24_arg1, CoD.StatsGroup.Common, "quartermasterEventIDs", 2, -1 )
	Engine.SetPlayerDataEx( f24_arg1, CoD.StatsGroup.Common, "quartermasterEventIDs", 3, -1 )
	local f24_local2 = 0
	if Engine.IsAliensMode() then
		f24_local0 = ARMORY.IsBundleEnabled( ARMORY.BundlesData.ZBundle )
	else
		f24_local0 = ARMORY.IsBundleEnabled( ARMORY.BundlesData.Bundle1 )
		f24_local1 = ARMORY.IsBundleEnabled( ARMORY.BundlesData.Bundle2 )
	end
	if f24_local0 then
		f24_local2 = f24_local2 + 1
	end
	if f24_local1 then
		f24_local2 = f24_local2 + 1
	end
	if f24_local2 > 0 then
		for f24_local3 = 0, f24_local2 - 1, 1 do
			local f24_local6, f24_local7, f24_local8, f24_local9, f24_local10, f24_local11, f24_local12, f24_local13, f24_local14, f24_local15 = nil
			if not (f24_local2 ~= 1 or not f24_local0) or f24_local2 == 2 and f24_local3 == 0 then
				if Engine.IsCoreMode() then
					f24_local6 = Engine.GetDvarInt( "online_bundle_crate_id" )
					f24_arg0.currentBundle1ID = f24_local6
					f24_local7 = Engine.GetDvarInt( "online_bundle_tracker_id" )
					f24_local8 = Engine.GetDvarString( "online_bundle_name" )
					f24_local9 = Engine.GetDvarString( "online_bundle_desc" )
					f24_local10 = Engine.GetDvarString( "online_bundle_image" )
					f24_local11 = Engine.GetDvarString( "online_bundle_small_image" )
					f24_local12 = ARMORY.CrateTypes.BUNDLE
					f24_local13 = ARMORY.GetBundleEndTime( f24_local12 )
					f24_local14 = Engine.GetDvarInt( "online_bundle_is_event" ) > 0
				else
					f24_local6 = Engine.GetDvarInt( "online_zbundle_crate_id" )
					f24_arg0.currentZBundleID = f24_local6
					f24_local7 = Engine.GetDvarInt( "online_zbundle_tracker_id" )
					f24_local8 = Engine.GetDvarString( "online_zbundle_name" )
					f24_local9 = Engine.GetDvarString( "online_zbundle_desc" )
					f24_local10 = Engine.GetDvarString( "online_zbundle_image" )
					f24_local11 = Engine.GetDvarString( "online_zbundle_small_image" )
					f24_local12 = ARMORY.CrateTypes.ZOMBIE_BUNDLE
					f24_local13 = ARMORY.GetBundleEndTime( f24_local12 )
					f24_local14 = false
				end
			elseif not (f24_local2 ~= 1 or not f24_local1) or f24_local2 == 2 and f24_local3 == 1 then
				f24_local6 = Engine.GetDvarInt( "online_bundle2_crate_id" )
				f24_arg0.currentBundle2ID = f24_local6
				f24_local7 = Engine.GetDvarInt( "online_bundle2_tracker_id" )
				f24_local8 = Engine.GetDvarString( "online_bundle2_name" )
				f24_local9 = Engine.GetDvarString( "online_bundle2_desc" )
				f24_local10 = Engine.GetDvarString( "online_bundle2_image" )
				f24_local11 = Engine.GetDvarString( "online_bundle2_small_image" )
				f24_local12 = ARMORY.CrateTypes.SECOND_BUNDLE
				f24_local13 = ARMORY.GetBundleEndTime( f24_local12 )
				f24_local14 = Engine.GetDvarInt( "online_bundle2_is_event" ) > 0
			end
			if f24_local2 == 1 then
				f24_local15 = MenuBuilder.BuildRegisteredType( "InventoryButton", {
					controllerIndex = f24_arg1,
					crateID = f24_local6,
					crateType = f24_local12
				} )
				f24_local15.id = "BundleButton"
				f24_local15.ArmoryButton.TitleText:setText( ToUpperCase( Engine.Localize( f24_local8 ) ), 0 )
				f24_local15.ArmoryButton.BGImage:setImage( RegisterMaterial( f24_local10 ), 0 )
				f24_local15:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 200 )
				f24_arg0.BundleButton = f24_local15
				f24_arg0.BundleButton.FeatureItemBanner:SetAlpha( 1 )
				f24_arg0.BundleButton.FeatureItemBanner.FeatureHighlight:SetAlpha( 1 )
				f24_arg0.BundleButton.FeatureItemBanner.OfferText:SetRGBFromTable( SWATCHES.MPArmory.Feature, 0 )
				f24_arg0.BundleButton.FeatureItemBanner.OfferText:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_ARMORY_BEST_OFFER" ) ), 0 )
				assert( f24_arg0.BundleButton.FeatureItemBanner.EventTimer )
				if f24_local13 then
					f24_arg0.BundleButton.FeatureItemBanner.EventTimer.timer:setEndTime( f24_local13 )
					f24_arg0.BundleButton.FeatureItemBanner.EventTimer:SetAlpha( 1 )
				else
					f24_arg0.BundleButton.FeatureItemBanner.EventTimer:SetAlpha( 0 )
				end
				if f24_local14 then
					f0_local12( f24_arg0.BundleButton, f24_local10, f24_local8 )
				end
				Engine.SetPlayerDataEx( f24_arg1, CoD.StatsGroup.Common, "quartermasterEventIDs", 2, f24_local6 )
			else
				f24_local15 = MenuBuilder.BuildRegisteredType( "InventoryButton", {
					controllerIndex = f24_arg1,
					crateID = f24_local6,
					crateType = f24_local12
				} )
				f24_local15.id = "BundleButton" .. f24_local3
				f24_local15.ArmoryButton.TitleText:setText( ToUpperCase( Engine.Localize( f24_local8 ) ), 0 )
				f24_local15.ArmoryButton.BGImage:setImage( RegisterMaterial( f24_local10 ), 0 )
				f24_local15:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 200 )
				if f24_local3 == 0 then
					f24_arg0.BundleButton = f24_local15
					f24_arg0.BundleButton.FeatureItemBanner:SetAlpha( 1 )
					f24_arg0.BundleButton.FeatureItemBanner.FeatureHighlight:SetAlpha( 1 )
					f24_arg0.BundleButton.FeatureItemBanner.OfferText:SetRGBFromTable( SWATCHES.MPArmory.Feature, 0 )
					f24_arg0.BundleButton.FeatureItemBanner.OfferText:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_ARMORY_BEST_OFFER" ) ), 0 )
					assert( f24_arg0.BundleButton.FeatureItemBanner.EventTimer )
					if f24_local13 then
						f24_arg0.BundleButton.FeatureItemBanner.EventTimer.timer:setEndTime( f24_local13 )
						f24_arg0.BundleButton.FeatureItemBanner.EventTimer:SetAlpha( 1 )
					else
						f24_arg0.BundleButton.FeatureItemBanner.EventTimer:SetAlpha( 0 )
					end
					if f24_local14 then
						f0_local12( f24_arg0.BundleButton, f24_local10, f24_local8 )
					end
					Engine.SetPlayerDataEx( f24_arg1, CoD.StatsGroup.Common, "quartermasterEventIDs", 2, f24_local6 )
				else
					f24_arg0.BundleButton2 = f24_local15
					f24_arg0.BundleButton2.FeatureItemBanner:SetAlpha( 1 )
					f24_arg0.BundleButton2.FeatureItemBanner.OfferText:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_ARMORY_NEW_OFFER" ) ), 0 )
					assert( f24_arg0.BundleButton2.FeatureItemBanner.EventTimer )
					if f24_local13 then
						f24_arg0.BundleButton2.FeatureItemBanner.EventTimer.timer:setEndTime( f24_local13 )
						f24_arg0.BundleButton2.FeatureItemBanner.EventTimer:SetAlpha( 1 )
					else
						f24_arg0.BundleButton2.FeatureItemBanner.EventTimer:SetAlpha( 0 )
					end
					if f24_local14 then
						f0_local12( f24_arg0.BundleButton2, f24_local10, f24_local8 )
					end
					Engine.SetPlayerDataEx( f24_arg1, CoD.StatsGroup.Common, "quartermasterEventIDs", 3, f24_local6 )
				end
			end
			local f24_local16 = nil
			local f24_local17 = math.max( ARMORY.GetMaxCratesPurchasable( f24_local6 ) - Loot.IsOwned( f24_arg1, f24_local7 ), 0 )
			local f24_local18
			if f24_local7 ~= 0 and f24_local17 <= 0 then
				f24_local18 = false
			else
				f24_local18 = true
			end
			if f24_local18 then
				f24_local16 = Engine.Localize( f24_local9, f24_local17 )
				if f24_local7 ~= 0 then
					f24_local15.FeatureItemBanner.LimitText:setText( Engine.Localize( "LUA_MENU_MP_ARMORY_PURCHASE_LIMIT", f24_local17 ) )
				end
				ACTIONS.AnimateSequence( f24_local15, "Available" )
				f24_local15:addEventHandler( "button_action", LOOT.GetPurchaseLootCrateAction( f0_local4( f24_arg0, ARMORY.BuyBundleCrate, f24_local6 ), f24_arg1, Engine.Localize( f24_local8 ), f24_local6, f24_local11, f24_local12, not f24_local14 ) )
			else
				f24_local16 = Engine.Localize( f24_local9, "LUA_MENU_MP_ARMORY_ITEM_SOLD_OUT" )
				ACTIONS.AnimateSequence( f24_local15, "SoldOut" )
				f24_local15:SetButtonDisabled( true )
			end
			f24_local15.buttonDescription = f24_local16
			f24_local15.isBundleButtonEnabled = f24_local18
		end
		return f24_arg0.BundleButton, f24_arg0.BundleButton2
	else
		
	end
end

local f0_local14 = function ( f25_arg0, f25_arg1 )
	local f25_local0 = MenuBuilder.BuildRegisteredType( "PurchaseCODPointsButton", {
		controllerIndex = f25_arg1
	} )
	f25_local0.id = "PurchaseCODPointsButton"
	f25_local0:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 680, 0, _1080p * 80 )
	f25_arg0.PurchaseCODPointsButton = f25_local0
	return f25_local0
end

local f0_local15 = function ( f26_arg0, f26_arg1 )
	local f26_local0 = MenuBuilder.BuildRegisteredType( "OpenFortuneCardPackButton", {
		controllerIndex = f26_arg1
	} )
	f26_local0.id = "OpenCardPack"
	f26_local0.buttonDescription = Engine.Localize( "LUA_MENU_ZM_OPEN_CARD_PACK_DESC" )
	f26_local0.MenuButton.Text:setText( ToUpperCase( Engine.Localize( "LUA_MENU_ZM_OPEN_CARD_PACK" ) ), 0 )
	f26_local0:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 30 )
	f26_arg0.OpenCardPack = f26_local0
	if Loot.IsOwned( f26_arg1, ARMORY.zombieRareCardPackID ) > 0 then
		f26_arg0.OpenCardPack:addEventHandler( "button_action", LOOT.GetPurchaseLootCrateAction( nil, f26_arg1, Engine.Localize( "LUA_MENU_ZM_CARD_PACK_ZOMBIE_SUPPLY_DROP" ), ARMORY.zombieRareCardPackID, "armory_loot_crate_rare", ARMORY.CrateTypes.NORMAL ) )
	elseif Loot.IsOwned( f26_arg1, ARMORY.zombieCardPackID ) > 0 then
		f26_arg0.OpenCardPack:addEventHandler( "button_action", LOOT.GetPurchaseLootCrateAction( nil, f26_arg1, Engine.Localize( "LUA_MENU_ZM_CARD_PACK_ZOMBIE_SUPPLY_DROP" ), ARMORY.zombieCardPackID, "armory_loot_crate_rare", ARMORY.CrateTypes.NORMAL ) )
	end
	local f26_local1 = ARMORY.GetTotalFortunePacks( f26_arg1 )
	f26_arg0.OpenCardPack:SetButtonDisabled( f26_local1 == 0 )
	f26_arg0.OpenCardPack.Amount:setText( f26_local1 )
	return f26_local0
end

local f0_local16 = function ( f27_arg0, f27_arg1 )
	local PurchaseCommonCrate = MenuBuilder.BuildRegisteredType( "ArmoryRowSupplyDrops", {
		controllerIndex = f27_arg1
	} )
	PurchaseCommonCrate.id = "ArmoryRowSupplyDrops"
	PurchaseCommonCrate:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 200 )
	local self = LUI.UIHorizontalList.new()
	self:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 200 )
	self:SetSpacing( 10 * _1080p )
	self.id = "supplyDropsRow"
	self:addElement( PurchaseCommonCrate )
	f27_arg0.PurchaseCommonCrate = PurchaseCommonCrate.PurchaseCommonCrate
	
	f27_arg0.PurchaseRareCrate = PurchaseCommonCrate.PurchaseRareCrate
	if Engine.IsAliensMode() then
		f27_arg0.PurchaseCommonCrate.buttonDescription = Engine.Localize( "LUA_MENU_ZM_COMMON_ZOMBIE_SUPPLY_DROP_DESC" )
		f27_arg0.PurchaseCommonCrate.CaCButtonBaseImage.Image:setImage( RegisterMaterial( "armory_zombie_loot_crate_common" ), 0 )
		f27_arg0.PurchaseCommonCrate.CaCButtonBaseImage.Name:setText( ToUpperCase( Engine.Localize( "LUA_MENU_ZM_COMMON_ZOMBIE_SUPPLY_DROP" ) ), 0 )
		f27_arg0.PurchaseCommonCrate:addEventHandler( "button_action", LOOT.GetPurchaseLootCrateAction( f0_local4( f27_arg0, ARMORY.BuyZombieCrate, ARMORY.zombieCrateID ), f27_arg1, Engine.Localize( "LUA_MENU_ZM_COMMON_ZOMBIE_SUPPLY_DROP" ), ARMORY.zombieCrateID, "armory_zombie_loot_crate_common", ARMORY.CrateTypes.NORMAL ) )
		f27_arg0.PurchaseCommonCrate:SetDataSource( DataSources.frontEnd.MP.armory.zombieCrate, f27_arg1 )
		f27_arg0.PurchaseRareCrate.buttonDescription = Engine.Localize( "LUA_MENU_ZM_RARE_ZOMBIE_SUPPLY_DROP_DESC" )
		f27_arg0.PurchaseRareCrate.CaCButtonBaseImage.Image:setImage( RegisterMaterial( "armory_zombie_loot_crate_rare" ), 0 )
		f27_arg0.PurchaseRareCrate.CaCButtonBaseImage.Name:setText( ToUpperCase( Engine.Localize( "LUA_MENU_ZM_RARE_ZOMBIE_SUPPLY_DROP" ) ), 0 )
		f27_arg0.PurchaseRareCrate:addEventHandler( "button_action", LOOT.GetPurchaseLootCrateAction( f0_local4( f27_arg0, ARMORY.BuyZombieRareCrate, ARMORY.zombieRareCrateID ), f27_arg1, Engine.Localize( "LUA_MENU_ZM_RARE_ZOMBIE_SUPPLY_DROP" ), ARMORY.zombieRareCrateID, "armory_zombie_loot_crate_rare", ARMORY.CrateTypes.NORMAL ) )
		f27_arg0.PurchaseRareCrate:SetDataSource( DataSources.frontEnd.MP.armory.zombieRareCrate, f27_arg1 )
	else
		f27_arg0.PurchaseCommonCrate:addEventHandler( "button_action", LOOT.GetPurchaseLootCrateAction( f0_local4( f27_arg0, ARMORY.BuyCommonCrate, ARMORY.commonCrateID ), f27_arg1, Engine.Localize( "LUA_MENU_MP_SUPPLY_DROP_COMMON" ), ARMORY.commonCrateID, "armory_loot_crate_common", ARMORY.CrateTypes.NORMAL ) )
		f27_arg0.PurchaseCommonCrate:SetDataSource( DataSources.frontEnd.MP.armory.commonCrate, f27_arg1 )
		f27_arg0.PurchaseRareCrate:addEventHandler( "button_action", LOOT.GetPurchaseLootCrateAction( f0_local4( f27_arg0, ARMORY.BuyRareCrate, ARMORY.rareCrateID ), f27_arg1, Engine.Localize( "LUA_MENU_MP_SUPPLY_DROP_RARE" ), ARMORY.rareCrateID, "armory_loot_crate_rare", ARMORY.CrateTypes.NORMAL ) )
		f27_arg0.PurchaseRareCrate:SetDataSource( DataSources.frontEnd.MP.armory.rareCrate, f27_arg1 )
	end
	return self
end

local f0_local17 = function ( f28_arg0 )
	if f28_arg0.ArmoryGrid then
		f28_arg0.ArmoryGrid:closeTree()
		f28_arg0.ArmoryGrid = nil
	end
end

local f0_local18 = function ( f29_arg0, f29_arg1 )
	local f29_local0 = {}
	table.insert( f29_local0, {
		buttonDescription = Engine.Localize( "LUA_MENU_MP_PROTO_LAB_DUTTON_DESC" ),
		imageAnchors = {
			left = -64,
			right = 64,
			top = -54,
			bottom = 74
		},
		image = "icon_inventory_crafting",
		name = Engine.Localize( "LUA_MENU_MP_PROTOTYPE_LAB" ),
		openMenu = "ArmoryWeapons",
		aliensMode = {
			imageColor = 5568769
		}
	} )
	table.insert( f29_local0, {
		buttonDescription = Engine.Localize( "LUA_MENU_MP_MK2_COLLECTION_DESC" ),
		imageAnchors = {
			left = -96,
			right = 96,
			top = -48,
			bottom = 48
		},
		image = "icon_inventory_mk2",
		name = Engine.Localize( "LUA_MENU_MP_MK2_COLLECTION" ),
		openMenu = "ArmoryWeapons",
		isMk2 = true,
		aliensMode = {
			imageColor = 5568769
		}
	} )
	if CONDITIONS.IsCoreMultiplayer( f29_arg0 ) then
		table.insert( f29_local0, {
			buttonDescription = Engine.Localize( "LUA_MENU_MP_MISSION_TEAM_BUTTON_DESC" ),
			imageAnchors = {
				left = -64,
				right = 64,
				top = -54,
				bottom = 74
			},
			image = "icon_inventory_missionteam",
			name = Engine.Localize( "LUA_MENU_MP_MISSION_TEAM_DEPOT" ),
			openMenu = "ArmoryMissionTeams"
		} )
		table.insert( f29_local0, {
			buttonDescription = Engine.Localize( "LUA_MENU_MP_OR_COLLECTION_BUTTON_DESC" ),
			imageAnchors = {
				left = -64,
				right = 64,
				top = -54,
				bottom = 74
			},
			image = "icon_inventory_quartermaster",
			name = Engine.Localize( "LUA_MENU_MP_QUATERMASTER_COLLECTION" ),
			openMenu = "ArmoryRNG"
		} )
		if CONDITIONS.AreLootStreaksEnabled( f29_arg0 ) then
			table.insert( f29_local0, {
				buttonDescription = Engine.Localize( "MP_FRONTEND_ONLY_PROTO_STREAK_DESC" ),
				imageAnchors = {
					left = -64,
					right = 64,
					top = -54,
					bottom = 74
				},
				image = "icon_inventory_scorestreaks",
				name = Engine.Localize( "MP_FRONTEND_ONLY_STREAK_PROTO_LAB" ),
				openMenu = "ArmoryStreaks"
			} )
		end
	else
		table.insert( f29_local0, {
			buttonDescription = Engine.Localize( "LUA_MENU_ZM_COLLECTION_BUTTON_DESC" ),
			imageAnchors = {
				left = -128,
				right = 128,
				top = -54,
				bottom = 74
			},
			image = "armory_zombie_loot_crate_rare",
			name = Engine.Localize( "LUA_MENU_ZM_SURVIVALIST_COLLECTION" ),
			openMenu = "ArmoryRNG"
		} )
	end
	return f29_local0
end

local f0_local19 = function ( f30_arg0, f30_arg1 )
	if not f30_arg0.ArmoryGrid then
		local f30_local0 = f0_local18( f30_arg0, f30_arg1 )
		local self = LUI.UIGrid.new( nil, {
			maxVisibleColumns = 2,
			maxVisibleRows = 3,
			controllerIndex = f30_arg1,
			buildChild = function ()
				return MenuBuilder.BuildRegisteredType( "ArmoryCategoryButton", {
					controllerIndex = f30_arg1
				} )
			end,
			refreshChild = function ( f32_arg0, f32_arg1, f32_arg2 )
				
			end,
			numRows = 3,
			numColumns = 2,
			spacingX = _1080p * 10,
			spacingY = _1080p * 10,
			columnWidth = _1080p * 335,
			rowHeight = _1080p * 200,
			adjustSizeToContent = true
		} )
		self.id = "ArmoryGrid"
		self:setUseStencil( true )
		f30_arg0.ArmoryGrid = self
		local f30_local2 = 3
		if CONDITIONS.IsCoreMultiplayer( f30_arg0 ) then
			f30_local2 = f30_local2 + 1
			if CONDITIONS.AreLootStreaksEnabled( f30_arg0 ) then
				f30_local2 = f30_local2 + 1
			end
		end
		self:SetNumColumns( 2 )
		self:SetNumRows( nil )
		self:SetNumChildren( f30_local2 )
		self:SetRefreshChild( function ( f33_arg0, f33_arg1, f33_arg2 )
			f33_arg0:SetupArmoryButtonData( f30_local0[f33_arg2 * 2 + f33_arg1 + 1] )
		end )
		self:RefreshContent()
		return self
	else
		
	end
end

local f0_local20 = function ( f34_arg0, f34_arg1 )
	f34_arg0.currentEventCrateID = nil
	f34_arg0.currentBundle1ID = nil
	f34_arg0.currentBundle2ID = nil
	f34_arg0.currentZBundleID = nil
	local f34_local0, f34_local1 = f0_local13( f34_arg0, f34_arg1 )
	if f34_local0 then
		f34_arg0.VerticalContainer:addElement( f34_local0 )
	end
	if f34_local1 then
		f34_arg0.VerticalContainer:addElement( f34_local1 )
	end
	if Engine.IsCoreMode() then
		Engine.SetPlayerDataEx( f34_arg1, CoD.StatsGroup.Common, "quartermasterEventIDs", 0, -1 )
		Engine.SetPlayerDataEx( f34_arg1, CoD.StatsGroup.Common, "quartermasterEventIDs", 1, -1 )
		if ARMORY.IsEventCrateEnabled( f34_arg1 ) then
			local f34_local2 = f0_local9( f34_arg0, f34_arg1 )
			if f34_local2 then
				f34_arg0.VerticalContainer:addElement( f34_local2 )
			end
		end
		if f34_arg0.PurchaseEventCrate then
			f34_arg0.PurchaseEventCrate:addEventHandler( "refresh_event_crate", function ()
				RefreshEventCrateDataSources( f34_arg1 )
				if ARMORY.IsEventCrateEnabled( f34_arg1 ) then
					local f35_local0 = f0_local9( f34_arg0, f34_arg1 )
					if f35_local0 then
						f34_arg0.VerticalContainer:addElement( f35_local0 )
					end
				else
					f0_local8( f34_arg0, f34_arg1 )
				end
			end )
		end
	end
	if CONDITIONS.AreCODPointsEnabled( f34_arg0 ) then
		f34_arg0.VerticalContainer:addElement( f0_local14( f34_arg0, f34_arg1 ) )
	end
	if f34_arg0.VerticalContainer:getNumChildren() == 5 then
		f34_arg0.VerticalContainer:SetSpacing( 6 * _1080p )
		f0_local5( f34_arg0, f34_arg1, 1 )
	end
	ACTIONS.UploadStats( f34_arg0, f34_arg1 )
	f34_arg0.VerticalContainer:clearSavedState()
end

local f0_local21 = function ( f36_arg0 )
	f36_arg0.VerticalContainer:closeChildren()
	f36_arg0.PurchaseCommonCrate = nil
	f36_arg0.PurchaseRareCrate = nil
	f36_arg0.BundleButton = nil
	f36_arg0.BundleButton2 = nil
	f0_local10( f36_arg0 )
	f0_local17( f36_arg0 )
	f0_local8( f36_arg0 )
end

local f0_local22 = function ( f37_arg0, f37_arg1, f37_arg2 )
	local f37_local0 = f37_arg0.tabNamesAndIDs[f37_arg2 + 1].id
	local f37_local1 = LUI.FlowManager.GetScopedData( f37_arg0 )
	f37_local1.currentTabIndex = f37_arg2
	f0_local21( f37_arg0 )
	f37_arg0.VerticalContainer:addElement( f0_local6( f37_arg0, f37_arg1 ) )
	f37_arg0.VerticalContainer:SetSpacing( 10 * _1080p )
	if f37_local0 == ARMORY.TabIDs.FEATURED then
		f0_local20( f37_arg0, f37_arg1 )
	elseif f37_local0 == ARMORY.TabIDs.SUPPLY_DROPS then
		if Engine.GetPlayerDataEx( f37_arg1, CoD.StatsGroup.Common, "newCrateRewards" ) then
			f37_arg0.Tabs:processEvent( {
				name = "remove_supply_drops_new_notification"
			} )
			Engine.SetPlayerDataEx( f37_arg1, CoD.StatsGroup.Common, "newCrateRewards", false )
		end
		local f37_local2 = f0_local16( f37_arg0, f37_arg1 )
		f37_arg0.VerticalContainer:addElement( f37_local2 )
		if CONDITIONS.AreCODPointsEnabled( f37_arg0 ) then
			local f37_local3 = f0_local14( f37_arg0, f37_arg1 )
			f37_local3:addEventHandler( "gain_focus", function ( f38_arg0, f38_arg1 )
				f37_arg0.hacksGridFocusItem = {
					x = 0,
					y = 0
				}
			end )
			f37_arg0.VerticalContainer:addElement( f37_local3 )
		end
		if CONDITIONS.AreBribeCratesEnabled( f37_arg0 ) then
			local f37_local3, f37_local4, f37_local5 = f0_local11( f37_arg0, f37_arg1 )
			if f37_local3 then
				if f37_local5 then
					f37_arg0.VerticalContainer:addElement( f37_local5 )
				end
				f37_local2:addEventHandler( "gain_focus", function ( f39_arg0, f39_arg1 )
					f37_arg0.hacksGridFocusItem = {
						x = 0,
						y = f37_local3:GetNumRows()
					}
					f37_local3:SetPosition( {
						x = 0,
						y = 0
					}, true )
				end )
				f37_arg0.VerticalContainer:addElement( f37_local3 )
				if f37_local4 then
					f37_arg0.VerticalContainer:addElement( f37_local4 )
				end
			end
		end
		if Engine.IsAliensMode() and CONDITIONS.HasCardPacks( f37_arg1 ) then
			f37_arg0.VerticalContainer:addElement( f0_local15( f37_arg0, f37_arg1 ) )
		end
		ACTIONS.UploadStats( f37_arg0, f37_arg1 )
	elseif f37_local0 == ARMORY.TabIDs.ARMORY then
		local f37_local2 = f0_local19( f37_arg0, f37_arg1 )
		if f37_local2 then
			f37_arg0.VerticalContainer:addElement( f37_local2 )
		end
	else
		assert( "Invalid armory tab ID!" )
	end
end

local f0_local23 = function ( f40_arg0, f40_arg1, f40_arg2 )
	local f40_local0 = {}
	if f40_arg2 then
		f40_local0[#f40_local0 + 1] = {
			name = ToUpperCase( Engine.Localize( "LUA_MENU_ARMORY_TAB_FEATURED" ) ),
			id = ARMORY.TabIDs.FEATURED
		}
	end
	f40_local0[#f40_local0 + 1] = {
		name = ToUpperCase( Engine.Localize( "LUA_MENU_ARMORY_TAB_SUPPLY_DROPS" ) ),
		id = ARMORY.TabIDs.SUPPLY_DROPS
	}
	f40_local0[#f40_local0 + 1] = {
		name = ToUpperCase( Engine.Localize( "LUA_MENU_ARMORY" ) ),
		id = ARMORY.TabIDs.ARMORY
	}
	f40_arg0.tabNamesAndIDs = f40_local0
	local f40_local1 = LUI.DataSourceFromList.new( #f40_local0 )
	f40_local1.MakeDataSourceAtIndex = function ( f41_arg0, f41_arg1, f41_arg2 )
		local f41_local0 = LUI.DataSourceInGlobalModel.new( f0_local1 .. ".tabName." .. f41_arg1 )
		f41_local0:SetValue( f41_arg2, f40_local0[f41_arg1 + 1].name )
		return {
			name = f41_local0,
			focusFunction = function ( f42_arg0, f42_arg1, f42_arg2, f42_arg3 )
				f0_local22( f40_arg0, f41_arg2, f42_arg2 )
				if f42_arg3 ~= FocusType.MenuFlow then
					f40_arg0.VerticalContainer:clearSavedState()
					ACTIONS.GainFocus( f40_arg0, "VerticalContainer", f41_arg2 )
				end
			end
			,
			isSupplyDropsTab = f40_local0[f41_arg1 + 1].id == ARMORY.TabIDs.SUPPLY_DROPS
		}
	end
	
	f40_local1.GetDefaultFocusIndex = function ()
		local f43_local0 = LUI.FlowManager.GetScopedData( f40_arg0 )
		return f43_local0.currentTabIndex or 0
	end
	
	f40_arg0.Tabs:SetTabManagerDataSource( f40_local1, f40_arg1 )
	f40_arg0.Tabs:SizeTabsToFit()
end

local f0_local24 = function ( f44_arg0, f44_arg1 )
	return function ()
		local f45_local0, f45_local1 = false
		local f45_local2, f45_local3 = false
		local f45_local4, f45_local5 = false
		local f45_local6, f45_local7 = false
		if Engine.IsCoreMode() then
			f45_local0 = ARMORY.IsEventCrateEnabled( f44_arg1 )
			if f45_local0 then
				f45_local1 = ARMORY.GetEventCrateID()
			end
			f45_local2 = ARMORY.IsBundleEnabled( ARMORY.BundlesData.Bundle1 )
			if f45_local2 then
				f45_local3 = Engine.GetDvarInt( "online_bundle_crate_id" )
			end
			f45_local4 = ARMORY.IsBundleEnabled( ARMORY.BundlesData.Bundle2 )
			if f45_local4 then
				f45_local5 = Engine.GetDvarInt( "online_bundle2_crate_id" )
			end
		else
			f45_local6 = ARMORY.IsBundleEnabled( ARMORY.BundlesData.ZBundle )
			if f45_local6 then
				f45_local7 = Engine.GetDvarInt( "online_zbundle_crate_id" )
			end
		end
		local f45_local8 = f45_local4 or f45_local2 or f45_local0 or f45_local6
		local f45_local9 = false
		if f45_local8 then
			if Engine.IsCoreMode() then
				if f44_arg0.eventActive ~= f45_local0 or f44_arg0.currentEventCrateID ~= f45_local1 then
					f44_arg0.eventActive = f45_local0
					f45_local9 = true
				end
				if f44_arg0.bundle1Active ~= f45_local2 or f44_arg0.currentBundle1ID ~= f45_local3 then
					f44_arg0.bundle1Active = f45_local2
					f45_local9 = true
				end
				if f44_arg0.bundle2Active ~= f45_local4 or f44_arg0.currentBundle2ID ~= f45_local5 then
					f44_arg0.bundle2Active = f45_local4
					f45_local9 = true
				end
			elseif f44_arg0.zbundleActive ~= f45_local6 or f44_arg0.currentZBundleID ~= f45_local7 then
				f44_arg0.zbundleActive = f45_local6
				f45_local9 = true
			end
		end
		local f45_local10 = false
		if f44_arg0.tabNamesAndIDs then
			for f45_local11 = 0, #f44_arg0.tabNamesAndIDs - 1, 1 do
				if f44_arg0.tabNamesAndIDs[f45_local11 + 1].id == ARMORY.TabIDs.FEATURED then
					f45_local10 = true
				end
			end
		end
		if not f44_arg0.tabNamesAndIDs or f45_local8 ~= f45_local10 then
			f0_local23( f44_arg0, f44_arg1, f45_local8 )
		end
		if f44_arg0.tabNamesAndIDs and f45_local10 and f45_local8 and f45_local9 then
			local f45_local11 = LUI.FlowManager.GetScopedData( f44_arg0 )
			if f44_arg0.tabNamesAndIDs[f45_local11.currentTabIndex + 1].id == ARMORY.TabIDs.FEATURED then
				f44_arg0.VerticalContainer:SetSpacing( 10 * _1080p )
				f0_local21( f44_arg0 )
				f44_arg0.VerticalContainer:addElement( f0_local6( f44_arg0, f44_arg1 ) )
				RefreshEventCrateDataSources( f44_arg1 )
				f0_local20( f44_arg0, f44_arg1 )
				ACTIONS.GainFocus( f44_arg0, "VerticalContainer", f44_arg1 )
			end
		end
	end
	
end

local f0_local25 = function ( f46_arg0, f46_arg1, f46_arg2 )
	assert( f46_arg0.VerticalContainer )
	assert( f46_arg0.Tabs )
	f46_arg0.Tabs:AddBacker()
	
	local eventRefreshTimer = LUI.UITimer.new( nil, {
		interval = 1000,
		event = "refreshEventsAndBundles",
		disposable = false,
		broadcastToRoot = false,
		stopped = false,
		controllerIndex = f46_arg1
	} )
	f46_arg0:addElement( eventRefreshTimer )
	f46_arg0.eventRefreshTimer = eventRefreshTimer
	
	local f46_local1 = f0_local24( f46_arg0, f46_arg1 )
	f46_arg0:registerEventHandler( "refreshEventsAndBundles", f46_local1 )
	f46_local1()
	if Engine.IsCoreMode() then
		FrontEndScene.CurrentMissionTeam = MissionDirector.InvalidTeamID
		FrontEndScene.SetScene( "armory" )
		FrontEndScene.SetCharacterModels( FrontEndScene.ClientCharacters.quarterMaster, "robot_merchant" )
		FrontEndScene.SetCharacterVisible( FrontEndScene.ClientCharacters.quarterMaster, true )
		FrontEndScene.SetCharacterModels( FrontEndScene.ClientCharacters.LootBox, "container_lootbox_rare" )
		FrontEndScene.SetCharacterVisible( FrontEndScene.ClientCharacters.LootBox, false )
		ClientCharacter.SetCharacterWeapons( FrontEndScene.ClientCharacters.quarterMaster, nil )
		ClientCharacter.SetCharacterWeapons( FrontEndScene.ClientCharacters.LootBox, nil )
		local f46_local2 = LUI.FlowManager.GetScopedData( f46_arg0 )
		if not f46_local2.playedGreeting then
			if Onboarding:BeginFlow( Onboarding.Quartermaster, f46_arg1 ) then
				Onboarding:ApplyWhitelist( "Armory", f46_arg0 )
				f46_arg0.Tabs:DisableAll()
				FrontEndScene.PlayQuarterMasterAnim( f46_arg0, FrontEndScene.ClientCharacters.quarterMaster, "iw7_mp_quartermaster_first_greeting_01", "qm_enter_armory_first_01", 2600 )
				local f46_local3 = LUI.UITimer.new( nil, {
					interval = 11000,
					event = {
						name = "open_tutorial_popup"
					},
					disposable = true
				} )
				f46_local3.id = "infoPopupTimer"
				f46_arg0:addElement( f46_local3 )
			else
				FrontEndScene.PlayQuartermasterGreeting( f46_arg0, DataSources.frontEnd.MP.commerce.inGameCurrency:GetValue( f46_arg1 ), DataSources.frontEnd.MP.commerce.premiumCurrency:GetValue( f46_arg1 ) )
			end
			f46_local2.playedGreeting = true
		end
		local f46_local4 = LUI.UITimer.new( nil, {
			interval = 30000,
			event = {
				name = "idle_robot"
			}
		} )
		f46_local4.id = "idleTimer"
		f46_arg0:addElement( f46_local4 )
		f46_arg0:addEventHandler( "idle_robot", function ( f47_arg0, f47_arg1 )
			FrontEndScene.PlayQuarterMasterRandomAnim( f47_arg0, "mp/quartermasterIdles.csv" )
		end )
		f46_arg0:addEventHandler( "popup_active", function ( f48_arg0, f48_arg1 )
			f46_local4:Stop()
		end )
		f46_arg0:addEventHandler( "popup_inactive", function ( f49_arg0, f49_arg1 )
			f46_local4:Reset()
			if f46_local2.overallReactionFile then
				FrontEndScene.CloseLootBoxSequence()
				FrontEndScene.PlayQuarterMasterRandomAnim( f49_arg0, f46_local2.overallReactionFile )
				f46_local2.overallReactionFile = nil
			end
			if f49_arg0.PurchaseCommonCrate then
				f49_arg0.PurchaseCommonCrate:SetButtonDisabled( false )
			end
			if f49_arg0.PurchaseRareCrate then
				f49_arg0.PurchaseRareCrate:SetButtonDisabled( false )
			end
			if f49_arg0.PurchaseEventCrate then
				f49_arg0.PurchaseEventCrate:SetButtonDisabled( not ARMORY.AnyCratesAvailableForPurchase( ARMORY.GetEventCrateID(), f46_arg1 ) )
			end
			if f49_arg0.PurchaseCODPointsButton then
				f49_arg0.PurchaseCODPointsButton:SetButtonDisabled( false )
			end
			if f49_arg0.BundleButton and f49_arg0.BundleButton.isBundleButtonEnabled then
				f49_arg0.BundleButton.isBundleButtonEnabled = nil
				f49_arg0.BundleButton:SetButtonDisabled( false )
			end
			if f49_arg0.BundleButton2 and f49_arg0.BundleButton2.isBundleButtonEnabled then
				f49_arg0.BundleButton2.isBundleButtonEnabled = nil
				f49_arg0.BundleButton2:SetButtonDisabled( false )
			end
			if f49_arg0.Tabs then
				f49_arg0.Tabs:EnableAll()
			end
		end )
		f46_arg0:addEventHandler( "open_tutorial_popup", function ( f50_arg0, f50_arg1 )
			LUI.FlowManager.RequestPopupMenu( f50_arg0, "QuartermasterTutorialPopup", false, f46_arg1, false )
		end )
		f46_arg0.bindButton:addEventHandler( "button_secondary", function ( f51_arg0, f51_arg1 )
			if f46_arg0.lastQuartermasterSoundID then
				Engine.StopSound( f46_arg0.lastQuartermasterSoundID )
				f46_arg0.lastQuartermasterSoundID = nil
			end
			ACTIONS.LeaveMenu( f46_arg0 )
		end )
	end
	if Engine.IsAliensMode() then
		f46_arg0.bindButton:addEventHandler( "button_secondary", function ( f52_arg0, f52_arg1 )
			ACTIONS.LeaveMenu( f46_arg0 )
		end )
	end
	f46_arg0:registerEventHandler( "loot_crate_complete", f0_local3( f46_arg0, f46_arg1, false ) )
	f46_arg0:registerEventHandler( "auto_burn_error", f0_local3( f46_arg0, f46_arg1, true ) )
	f46_arg0:registerEventHandler( "reward_error", function ( element, event )
		LUI.FlowManager.RequestLeaveMenuByName( "live_dialog_text_box" )
		LUI.FlowManager.RequestPopupMenu( f46_arg0, "LootCrateErrorsPopup", true, f46_arg1, false )
	end )
	f46_arg0:registerEventHandler( "reward_crate_complete_error", function ( element, event )
		LUI.FlowManager.RequestLeaveMenuByName( "live_dialog_text_box" )
		LUI.FlowManager.RequestPopupMenu( f46_arg0, "LootCrateErrorsPopup", true, f46_arg1, false, {
			crate_complete_error = true
		} )
	end )
	if Engine.IsCoreMode() then
		f46_arg0.MenuTitle.MenuBreadcrumbs:setText( ToUpperCase( Engine.Localize( "LUA_MENU_BREADCRUMB_2_ITEMS", "MENU_MULTIPLAYER", "LUA_MENU_PUBLIC_MATCH_CAPS" ), 0 ) )
	end
	f46_arg0.addMoreButtonHelperFunction = function ( f55_arg0, f55_arg1 )
		if CONDITIONS.IsCoreMultiplayer( f46_arg0 ) then
			f55_arg0:AddButtonHelperText( {
				helper_text = Engine.Localize( "LUA_MENU_HELP_CAPS" ),
				button_ref = "button_alt1",
				side = "left",
				clickable = true
			} )
		end
		if Engine.GetDvarBool( "online_qrm5tr_cipher_enabled" ) == true then
			f55_arg0:AddButtonHelperText( {
				helper_text = Engine.Localize( "LUA_MENU_MP_QUARTERMASTER_CIPHER" ),
				button_ref = "button_alt2",
				side = "left",
				clickable = true
			} )
		end
		if #LOOT.GetLastLootDropList( f46_arg1 ) > 0 then
			f55_arg0:AddButtonHelperText( {
				helper_text = Engine.Localize( "LUA_MENU_MP_RECENT_DROPS" ),
				button_ref = "button_start",
				side = "left",
				clickable = true
			} )
		end
	end
	
	f46_arg0:addEventHandler( "menu_create", f46_arg0.addMoreButtonHelperFunction )
	f46_arg0.bindButton:addEventHandler( "button_alt1", function ( f56_arg0, f56_arg1 )
		local f56_local0 = f56_arg1.controller or f46_arg1
		if CONDITIONS.IsCoreMultiplayer( f46_arg0 ) then
			ACTIONS.OpenPopupMenu( f46_arg0, "QuartermasterTutorialPopup", true, f56_local0 )
		end
	end )
	if Engine.GetDvarBool( "online_qrm5tr_cipher_enabled" ) == true then
		f46_arg0.bindButton:addEventHandler( "button_alt2", function ( f57_arg0, f57_arg1 )
			OSK.OpenScreenKeyboard( f57_arg1.controller, Engine.Localize( "LUA_MENU_MP_QUARTERMASTER_CIPHER_KEYB" ), "", 12, false, false, true, function ( f58_arg0, f58_arg1, f58_arg2 )
				if f58_arg2 == CoD.KeyboardResult.UI_KEYBOARD_RESULT_CANCELLED then
					return 
				end
				local f58_local0 = true
				if f58_arg1 then
					if string.match( f58_arg1, "....%-..%-...." ) == nil then
						f58_local0 = false
					end
				else
					f58_local0 = false
				end
				if f58_local0 == true then
					Redeemables.RedeemCode( f58_arg0, f58_arg1 )
				else
					LUI.FlowManager.RequestPopupMenu( f46_arg0, "PopupOK", true, f57_arg1.controller, false, {
						message = Engine.Localize( "LUA_MENU_MP_QUARTERMASTER_CIPHER_ERROR" )
					} )
				end
			end, CoD.KeyboardInputTypes.Normal )
		end )
		f46_arg0:addEventHandler( "redemption_success", function ( f59_arg0, f59_arg1 )
			local f59_local0, f59_local1, f59_local2 = nil
			if #f59_arg1.Currencies > 0 then
				f59_local0 = tonumber( Engine.TableLookupMultipleKeys( CSV.currencyPackLootMaster.file, {
					{
						col = CSV.currencyPackLootMaster.cols.currencyIndex,
						key = f59_arg1.Currencies[1].itemID
					},
					{
						col = CSV.currencyPackLootMaster.cols.isQuartermasterCipher,
						key = "1"
					}
				}, CSV.currencyPackLootMaster.cols.index ) )
				f59_local2 = f59_arg1.Currencies[1].amount
			elseif #f59_arg1.Items > 0 then
				f59_local0 = f59_arg1.Items[1].itemID
				f59_local1 = f59_arg1.Items[1].dupe
				f59_local2 = f59_arg1.Items[1].newQuantity
			end
			local f59_local3 = LOOT.GetLootData( f59_local0 )
			local f59_local4 = MenuBuilder.BuildRegisteredType( "LootItemCard", {
				isDuplicate = f59_local1,
				context = LUI.ItemCard.contexts.QUARTERMASTER_CIPHER,
				itemType = f59_local3.type,
				identifier = f59_local0,
				modelPath = f0_local1 .. ".itemCard." .. f59_local0,
				cardIndex = 0,
				quantity = f59_local2,
				controllerIndex = f46_arg1
			} )
			f59_local4.id = "itemCard"
			LUI.FlowManager.RequestPopupMenu( f59_arg0, "QuartermasterCipherPopup", true, f46_arg1, false, {
				itemCard = f59_local4
			} )
		end )
	end
	if #LOOT.GetLastLootDropList( f46_arg1 ) > 0 then
		f46_arg0.bindButton:addEventHandler( "button_start", function ( f60_arg0, f60_arg1 )
			LUI.FlowManager.RequestAddMenu( "ArmoryRecentDrops", true, f46_arg1, false )
		end )
	end
	f46_arg0:addElement( LOOT.GetLootMaterialStreamer() )
end

function Armory( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "Armory"
	local f61_local1 = controller and controller.controllerIndex
	if not f61_local1 and not Engine.InFrontend() then
		f61_local1 = self:getRootController()
	end
	assert( f61_local1 )
	f0_local0( self, f61_local1, controller )
	self:playSound( "menu_open" )
	local f61_local2 = self
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f61_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local SocialFeed = nil
	
	SocialFeed = MenuBuilder.BuildRegisteredType( "SocialFeed", {
		controllerIndex = f61_local1
	} )
	SocialFeed.id = "SocialFeed"
	SocialFeed:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1920, _1080p * 965, _1080p * 995 )
	self:addElement( SocialFeed )
	self.SocialFeed = SocialFeed
	
	local Tabs = nil
	
	Tabs = LUI.TabManager.new( nil, {
		tabHeight = _1080p * 30,
		wrap = false,
		spacing = 2,
		buildTab = function ()
			return MenuBuilder.BuildRegisteredType( "ArmoryTab", {
				controllerIndex = f61_local1
			} )
		end,
		buildSpacer = function ()
			return MenuBuilder.BuildRegisteredType( "TabsSpacer", {
				controllerIndex = f61_local1
			} )
		end,
		controllerIndex = f61_local1
	} )
	Tabs.id = "Tabs"
	Tabs:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 810, _1080p * 150, _1080p * 180 )
	self:addElement( Tabs )
	self.Tabs = Tabs
	
	local MissionTeamInfo = nil
	
	MissionTeamInfo = MenuBuilder.BuildRegisteredType( "MissionTeamInfo", {
		controllerIndex = f61_local1
	} )
	MissionTeamInfo.id = "MissionTeamInfo"
	MissionTeamInfo:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -700, 0, _1080p * 54, _1080p * 141 )
	self:addElement( MissionTeamInfo )
	self.MissionTeamInfo = MissionTeamInfo
	
	local f61_local7 = nil
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() and CONDITIONS.IsCoreMultiplayer( self ) then
		f61_local7 = MenuBuilder.BuildRegisteredType( "MenuTitle", {
			controllerIndex = f61_local1
		} )
		f61_local7.id = "MenuTitle"
		f61_local7.MenuTitle:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_QUARTERMASTER" ) ), 0 )
		f61_local7.MenuBreadcrumbs:setText( ToUpperCase( "" ), 0 )
		f61_local7.Icon:SetTop( _1080p * -28.5, 0 )
		f61_local7.Icon:SetBottom( _1080p * 61.5, 0 )
		f61_local7:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
		self:addElement( f61_local7 )
		self.MenuTitle = f61_local7
	end
	local f61_local8 = nil
	if CONDITIONS.IsThirdGameMode( self ) then
		f61_local8 = MenuBuilder.BuildRegisteredType( "CPMenuTitle", {
			controllerIndex = f61_local1
		} )
		f61_local8.id = "CPMenuTitle"
		f61_local8.MenuTitle:setText( ToUpperCase( Engine.Localize( "LUA_MENU_ZM_SURVIVAL_DEPOT" ) ), 0 )
		f61_local8:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
		self:addElement( f61_local8 )
		self.CPMenuTitle = f61_local8
	end
	local VerticalContainer = nil
	
	VerticalContainer = MenuBuilder.BuildRegisteredType( "ArmoryVerticalContainer", {
		controllerIndex = f61_local1
	} )
	VerticalContainer.id = "VerticalContainer"
	VerticalContainer:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 810, _1080p * 216, _1080p * 916 )
	self:addElement( VerticalContainer )
	self.VerticalContainer = VerticalContainer
	
	local f61_local10 = nil
	if not CONDITIONS.IsSystemLink( self ) then
		f61_local10 = MenuBuilder.BuildRegisteredType( "CRMMain", {
			controllerIndex = f61_local1
		} )
		f61_local10.id = "CRMMain"
		f61_local10:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 136, _1080p * 447, _1080p * 745, _1080p * 939 )
		self:addElement( f61_local10 )
		self.CRMMain = f61_local10
	end
	self.addButtonHelperFunction = function ( f64_arg0, f64_arg1 )
		f64_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			clickable = true
		} )
		f64_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_SELECT" ),
			button_ref = "button_primary",
			side = "left",
			priority = -10,
			clickable = true
		} )
	end
	
	self:addEventHandler( "menu_create", self.addButtonHelperFunction )
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	f0_local25( self, f61_local1, controller )
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "CRMMain",
		sequenceName = "Minimize",
		elementPath = "CRMMain"
	} )
	return self
end

MenuBuilder.registerType( "Armory", Armory )
LUI.FlowManager.RegisterStackPopBehaviour( "Armory", PopFunc )
LockTable( _M )
