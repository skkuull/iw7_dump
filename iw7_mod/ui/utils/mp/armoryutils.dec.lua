ARMORY = ARMORY or {}
ARMORY.inventoryContext = {
	PROTOTYPE = 0,
	MISSION_TEAM = 1,
	QUARTERMASTER = 2,
	STREAK_PROTOTYPE = 3,
	MK2 = 4
}
ARMORY.commonCrate = "CommonCrate"
ARMORY.commonCrateID = 70000
ARMORY.rareCrate = "EnlistedCrate"
ARMORY.rareCrateID = 70001
ARMORY.zombieCrate = "ZombieCrate"
ARMORY.zombieCrateID = 70002
ARMORY.zombieRareCrate = "ZombieRareCrate"
ARMORY.zombieRareCrateID = 70003
ARMORY.zombieCardPack = "ZombieCardPack"
ARMORY.zombieCardPackID = 70004
ARMORY.zombieRareCardPack = "ZombieRareCardPack"
ARMORY.zombieRareCardPackID = 70005
ARMORY.weaponBribeCrateID = 70026
ARMORY.weaponClassCrateFirstID = 70028
ARMORY.weaponClassCrateLastID = 70033
ARMORY.rigCrateFirstID = 70034
ARMORY.rigCrateLastID = 70040
ARMORY.accessoryCrateID = 70041
ARMORY.maxDeconstructionBatchSize = 1000
ARMORY.BundlesData = {
	Bundle1 = {
		enabled = "online_bundle_enabled",
		startTime = "online_bundle_start",
		endTime = "online_bundle_end",
		crateID = "online_bundle_crate_id"
	},
	Bundle2 = {
		enabled = "online_bundle2_enabled",
		startTime = "online_bundle2_start",
		endTime = "online_bundle2_end",
		crateID = "online_bundle2_crate_id"
	},
	ZBundle = {
		enabled = "online_zbundle_enabled",
		startTime = "online_zbundle_start",
		endTime = "online_zbundle_end",
		crateID = "online_zbundle_crate_id"
	}
}
ARMORY.currencyType = {
	COD_POINTS = "CODPoints",
	KEYS = "Keys",
	SALVAGE = "Salvage"
}
ARMORY.categoryRefs = {
	PRIMARY_WEAPON = "PrimaryWeapon",
	SECONDARY_WEAPON = "SecondaryWeapon",
	STREAK = "Scorestreak",
	RETICLE = "Reticle",
	CAMO = "WeaponCamo"
}
ARMORY.CrateTypes = {
	NORMAL = "Normal",
	EVENT = "Event",
	BUNDLE = "Bundle",
	SECOND_BUNDLE = "SecondBundle",
	ZOMBIE_BUNDLE = "ZombieBundle"
}
ARMORY.TabIDs = {
	FEATURED = 0,
	SUPPLY_DROPS = 1,
	ARMORY = 2
}
ARMORY.QuartermasterFiles = {
	ItemReactions = {
		Epic = "mp/quartermaster_item_epic.csv",
		Legendary = "mp/quartermaster_item_legendary.csv",
		Rare = "mp/quartermaster_item_rare.csv",
		Common = "mp/quartermaster_item_common.csv"
	},
	OverallLootReactions = {
		SuperPositive = "mp/quartermaster_reaction_super_pos.csv",
		Positive = "mp/quartermaster_reaction_pos.csv",
		Neutral = "mp/quartermaster_reaction_neutral.csv",
		Negative = "mp/quartermaster_reaction_negative.csv"
	}
}
ARMORY.lootCamo = {}
ARMORY.camoRowList = {}
ARMORY.lootReticle = {}
ARMORY.reticleRowList = {}
ARMORY.IsBundleEnabled = function ( f1_arg0 )
	local f1_local0 = false
	if Engine.GetDvarBool( f1_arg0.enabled ) then
		f1_local0 = Engine.IsCurrentTimeWithinRange( f1_arg0.startTime, f1_arg0.endTime )
	end
	return f1_local0
end

ARMORY.IsEventCrateEnabled = function ( f2_arg0 )
	local f2_local0 = false
	if Engine.IsCoreMode() and CONDITIONS.IsEventCrateAllowed() then
		InitEventCrateDataSourcesIfNeeded()
		if CONDITIONS.IsEventCrateValid( f2_arg0 ) then
			f2_local0 = Engine.IsCurrentTimeWithinRange( "online_quartermaster_event_start", "online_quartermaster_event_end" )
		end
	end
	return f2_local0
end

ARMORY.BuildLootItemList = function ( f3_arg0 )
	if not next( f3_arg0.lootItem ) then
		for f3_local0 = 0, Engine.TableGetRowCount( f3_arg0.lootTable.file ), 1 do
			local f3_local3 = CSV.ReadRow( f3_arg0.lootTable, f3_local0 )
			if #f3_local3.index == 0 then
				return 
			elseif f3_local3.category == f3_arg0.categoryRef then
				if not f3_arg0.lootItem[f3_local3.quality] then
					f3_arg0.lootItem[f3_local3.quality] = {}
				end
				f3_arg0.lootItem[f3_local3.quality][f3_local3.ref] = f3_local0
			end
		end
	end
end

ARMORY.BuildItemRowList = function ( f4_arg0 )
	if not next( f4_arg0.itemRowList ) then
		for f4_local0 = 0, Engine.TableGetRowCount( f4_arg0.itemTable.file ), 1 do
			local f4_local3 = CSV.ReadRow( f4_arg0.itemTable, f4_local0 )
			if #f4_local3.index == 0 then
				return 
			end
			f4_arg0.itemRowList[f4_local3.ref] = f4_local0
		end
	end
end

ARMORY.BuildLootItemByQualityDataSources = function ( f5_arg0, f5_arg1 )
	ARMORY.BuildItemRowList( f5_arg1 )
	ARMORY.BuildLootItemList( f5_arg1 )
	local f5_local0 = {}
	local f5_local1 = LUI.DataSourceFromList.new( Cac.HighestQuality )
	f5_local1.MakeDataSourceAtIndex = function ( f6_arg0, f6_arg1, f6_arg2 )
		local f6_local0 = f5_arg0 .. ".qualities." .. f6_arg1
		f6_arg1 = f6_arg1 + 1
		return {
			items = f5_local1[f6_arg1],
			name = LUI.DataSourceInGlobalModel.new( f6_local0 .. ".name", Cac.GetLootQualityString( f6_arg1 ) )
		}
	end
	
	for f5_local2 = 1, Cac.HighestQuality, 1 do
		local f5_local5 = {}
		if next( f5_arg1.lootItem ) and next( f5_arg1.itemRowList ) then
			for f5_local9, f5_local10 in pairs( f5_arg1.lootItem[tostring( f5_local2 )] ) do
				local f5_local11 = CSV.ReadRow( f5_arg1.itemTable, f5_arg1.itemRowList[f5_local9] )
				local f5_local12 = f5_arg0 .. ".items." .. f5_local9
				table.insert( f5_local5, {
					ref = LUI.DataSourceInGlobalModel.new( f5_local12 .. ".ref", f5_local11.ref ),
					name = LUI.DataSourceInGlobalModel.new( f5_local12 .. ".name", f5_local11.name ),
					image = LUI.DataSourceInGlobalModel.new( f5_local12 .. ".image", f5_local11.image )
				} )
			end
		end
		f5_local1[f5_local2] = LUI.DataSourceFromList.new( #f5_local5 )
		f5_local1[f5_local2].MakeDataSourceAtIndex = function ( f7_arg0, f7_arg1, f7_arg2 )
			return f5_local5[1 + f7_arg1]
		end
		
	end
	return f5_local1
end

ARMORY.SetupLootCratePopup = function ( f8_arg0, f8_arg1, f8_arg2, f8_arg3, f8_arg4 )
	f8_arg1:addEventHandler( "button_action", function ( f9_arg0, f9_arg1 )
		f8_arg3( f9_arg0, f8_arg0, f8_arg2, f8_arg4 )
		if Engine.IsAliensMode() then
			LUI.FlowManager.RequestPopupMenu( f9_arg0, "live_dialog_text_box", true, f9_arg1.controller, true, {
				message = Engine.Localize( "LUA_MENU_ZM_ZOMBIE_CRATE_PURCHASE" )
			} )
		else
			LUI.FlowManager.RequestPopupMenu( f9_arg0, "live_dialog_text_box", true, f9_arg1.controller, true, {
				message = Engine.Localize( "LUA_MENU_MP_SUPPLY_DROP_PURCHASE" )
			} )
		end
	end )
end

local f0_local0 = function ( f10_arg0, f10_arg1, f10_arg2 )
	local f10_local0 = Engine.TableLookup( CSV.lootCrate.file, CSV.lootCrate.cols.ref, f10_arg1, CSV.lootCrate.cols.demonwareID )
	local f10_local1 = nil
	if f10_arg2 then
		f10_local1 = Engine.TableLookup( CSV.lootCrate.file, CSV.lootCrate.cols.ref, f10_arg1, CSV.lootCrate.cols.CODPointsSKU )
	else
		f10_local1 = Engine.TableLookup( CSV.lootCrate.file, CSV.lootCrate.cols.ref, f10_arg1, CSV.lootCrate.cols.index )
	end
	Loot.PurchaseLootCrate( f10_arg0, f10_local1, f10_local0 )
end

ARMORY.BuyCommonCrate = function ( f11_arg0, f11_arg1, f11_arg2 )
	local f11_local0 = ARMORY.commonCrate
	f0_local0( f11_arg1, f11_local0, f11_arg2 )
	FrontEndScene.OpenLootBoxSequence( f11_local0 )
	FrontEndScene.PlayQuarterMasterRandomAnim( f11_arg0, "mp/quartermaster_common_ack.csv" )
end

ARMORY.BuyRareCrate = function ( f12_arg0, f12_arg1, f12_arg2 )
	local f12_local0 = ARMORY.rareCrate
	f0_local0( f12_arg1, f12_local0, f12_arg2 )
	FrontEndScene.OpenLootBoxSequence( f12_local0 )
	FrontEndScene.PlayQuarterMasterRandomAnim( f12_arg0, "mp/quartermaster_rare_ack.csv" )
end

ARMORY.BuyZombieCrate = function ( f13_arg0, f13_arg1, f13_arg2 )
	f0_local0( f13_arg1, ARMORY.zombieCrate, f13_arg2 )
end

ARMORY.BuyZombieRareCrate = function ( f14_arg0, f14_arg1, f14_arg2 )
	f0_local0( f14_arg1, ARMORY.zombieRareCrate, f14_arg2 )
end

ARMORY.PlayBribeAnim = function ( f15_arg0, f15_arg1 )
	local f15_local0 = tonumber( f15_arg1 )
	assert( f15_local0 )
	if f15_local0 == ARMORY.weaponBribeCrateID or f15_local0 >= ARMORY.weaponClassCrateFirstID and f15_local0 <= ARMORY.weaponClassCrateLastID then
		FrontEndScene.PlayQuarterMasterRandomAnim( f15_arg0, "mp/quartermaster_bribe_weapons.csv" )
	elseif f15_local0 >= ARMORY.rigCrateFirstID and f15_local0 <= ARMORY.rigCrateLastID then
		FrontEndScene.PlayQuarterMasterRandomAnim( f15_arg0, "mp/quartermaster_bribe_rig_gear.csv" )
	elseif f15_local0 == ARMORY.accessoryCrateID then
		FrontEndScene.PlayQuarterMasterRandomAnim( f15_arg0, "mp/quartermaster_bribe_accessories.csv" )
	else
		FrontEndScene.PlayQuarterMasterRandomAnim( f15_arg0, "mp/quartermaster_bribes.csv" )
	end
end

ARMORY.BuyEventCrate = function ( f16_arg0, f16_arg1, f16_arg2 )
	local f16_local0 = Engine.GetDvarInt( "online_quartermaster_event_dwid" )
	local f16_local1 = nil
	if f16_arg2 then
		f16_local1 = Engine.GetDvarInt( "online_quartermaster_event_cp_id" )
	else
		f16_local1 = Engine.GetDvarInt( "online_quartermaster_event_crate_ref_id" )
	end
	Loot.PurchaseLootCrate( f16_arg1, f16_local1, f16_local0 )
	FrontEndScene.OpenLootBoxSequence( "EnlistedCrate" )
	FrontEndScene.PlayQuarterMasterRandomAnim( f16_arg0, "mp/quartermaster_rare_ack.csv" )
end

ARMORY.OpenBribeCrate = function ( f17_arg0, f17_arg1, f17_arg2 )
	
end

ARMORY.BuyBundleCrate = function ( f18_arg0, f18_arg1, f18_arg2, f18_arg3 )
	local f18_local0, f18_local1 = nil
	if Engine.IsAliensMode() == true then
		f18_local0 = Engine.GetDvarInt( "online_zbundle_dw_id" )
		if f18_arg2 then
			f18_local1 = Engine.GetDvarInt( "online_zbundle_cp_id" )
		else
			f18_local1 = Engine.GetDvarInt( "online_zbundle_crate_id" )
		end
	elseif f18_arg3 == Engine.GetDvarInt( "online_bundle_crate_id" ) then
		f18_local0 = Engine.GetDvarInt( "online_bundle_dw_id" )
		if f18_arg2 then
			f18_local1 = Engine.GetDvarInt( "online_bundle_cp_id" )
		else
			f18_local1 = Engine.GetDvarInt( "online_bundle_crate_id" )
		end
	else
		f18_local0 = Engine.GetDvarInt( "online_bundle2_dw_id" )
		if f18_arg2 then
			f18_local1 = Engine.GetDvarInt( "online_bundle2_cp_id" )
		else
			f18_local1 = Engine.GetDvarInt( "online_bundle2_crate_id" )
		end
	end
	Loot.PurchaseLootCrate( f18_arg1, f18_local1, f18_local0 )
end

ARMORY.GetCrateFuncFromID = function ( f19_arg0 )
	local f19_local0 = nil
	if f19_arg0 == ARMORY.rareCrateID then
		f19_local0 = ARMORY.BuyRareCrate
	elseif f19_arg0 == ARMORY.zombieCrateID then
		f19_local0 = ARMORY.BuyZombieCrate
	elseif f19_arg0 == ARMORY.zombieRareCrateID then
		f19_local0 = ARMORY.BuyZombieRareCrate
	elseif f19_arg0 == ARMORY.GetEventCrateID() then
		f19_local0 = ARMORY.BuyEventCrate
	elseif f19_arg0 == Engine.GetDvarInt( "online_bundle_crate_id" ) or f19_arg0 == Engine.GetDvarInt( "online_bundle2_crate_id" ) or f19_arg0 == Engine.GetDvarInt( "online_zbundle_crate_id" ) then
		f19_local0 = ARMORY.BuyBundleCrate
	else
		assert( f19_arg0 == ARMORY.commonCrateID, "ERROR - Unknown crateID during Purchase Again. Defaulting to common!" )
		f19_local0 = ARMORY.BuyCommonCrate
	end
	return f19_local0
end

ARMORY.GetCurrencyCostAndImageForCrate = function ( f20_arg0, f20_arg1, f20_arg2 )
	local f20_local0 = ARMORY.CrateTypes.NORMAL
	if f20_arg0 == ARMORY.GetEventCrateID() then
		f20_local0 = ARMORY.CrateTypes.EVENT
	elseif f20_arg0 == Engine.GetDvarInt( "online_bundle_crate_id" ) then
		f20_local0 = ARMORY.CrateTypes.BUNDLE
	elseif f20_arg0 == Engine.GetDvarInt( "online_bundle2_crate_id" ) then
		f20_local0 = ARMORY.CrateTypes.SECOND_BUNDLE
	elseif f20_arg0 == Engine.GetDvarInt( "online_zbundle_crate_id" ) then
		f20_local0 = ARMORY.CrateTypes.ZOMBIE_BUNDLE
	end
	local f20_local1, f20_local2, f20_local3 = nil
	if f20_local0 == ARMORY.CrateTypes.NORMAL then
		f20_local1 = CoD.GetAdjustedCurrency( tonumber( Engine.TableLookup( CSV.lootCrate.file, CSV.lootCrate.cols.index, f20_arg0, CSV.lootCrate.cols.cost ) ) )
		f20_local2 = tonumber( Engine.TableLookup( CSV.lootCrate.file, CSV.lootCrate.cols.index, f20_arg0, CSV.lootCrate.cols.premiumCost ) )
		f20_local3 = tonumber( Engine.TableLookup( CSV.lootCrate.file, CSV.lootCrate.cols.index, f20_arg0, CSV.lootCrate.cols.salvageCost ) )
		local f20_local4 = Engine.GetDvarInt( "loot_crate_cost_overide" )
		if f20_local2 > 0 and f20_local4 > 0 then
			f20_local2 = f20_local4
		end
	elseif f20_local0 == ARMORY.CrateTypes.EVENT then
		f20_local1 = Engine.GetDvarInt( "online_quartermaster_event_crate_price_key" )
		f20_local2 = Engine.GetDvarInt( "online_quartermaster_event_crate_price_cp" )
		f20_local3 = Engine.GetDvarInt( "online_quartermaster_event_crate_price_scrap" )
	elseif f20_local0 == ARMORY.CrateTypes.BUNDLE then
		f20_local1 = Engine.GetDvarInt( "online_bundle_crate_price_key" )
		f20_local2 = Engine.GetDvarInt( "online_bundle_crate_price_cp" )
		f20_local3 = Engine.GetDvarInt( "online_bundle_crate_price_scrap" )
	elseif f20_local0 == ARMORY.CrateTypes.SECOND_BUNDLE then
		f20_local1 = Engine.GetDvarInt( "online_bundle2_crate_price_key" )
		f20_local2 = Engine.GetDvarInt( "online_bundle2_crate_price_cp" )
		f20_local3 = Engine.GetDvarInt( "online_bundle2_crate_price_scrap" )
	elseif f20_local0 == ARMORY.CrateTypes.ZOMBIE_BUNDLE then
		f20_local1 = Engine.GetDvarInt( "online_zbundle_crate_price_key" )
		f20_local2 = Engine.GetDvarInt( "online_zbundle_crate_price_cp" )
		f20_local3 = Engine.GetDvarInt( "online_zbundle_crate_price_scrap" )
	end
	assert( f20_local1 )
	assert( f20_local2 )
	assert( f20_local3 )
	local f20_local4 = DataSources.frontEnd.MP.commerce.inGameCurrency:GetValue( f20_arg1 )
	local f20_local5 = DataSources.frontEnd.MP.commerce.premiumCurrency:GetValue( f20_arg1 )
	local f20_local6 = DataSources.frontEnd.MP.commerce.craftingCurrency:GetValue( f20_arg1 )
	local f20_local7 = f20_local2 <= f20_local5
	local f20_local8 = f20_local1 <= f20_local4
	local f20_local9 = f20_local3 <= f20_local6
	if f20_local3 > 0 then
		return f20_local3, "currency_parts_icon", ARMORY.currencyType.SALVAGE
	end
	local f20_local10 = f20_local7
	local f20_local11
	if f20_local2 > 0 then
		local f20_local12 = f20_arg2
		f20_local11 = not f20_local8
	else
		f20_local11 = false
	end
	if f20_local11 and CONDITIONS.AreCODPointsEnabled() then
		return f20_local2, "currency_cod_points_icon", ARMORY.currencyType.COD_POINTS
	end
	return f20_local1, "currency_keys_icon", ARMORY.currencyType.KEYS
end

ARMORY.GetTotalFortunePacks = function ( f21_arg0 )
	return Loot.IsOwned( f21_arg0, ARMORY.zombieCardPackID ) + Loot.IsOwned( f21_arg0, ARMORY.zombieRareCardPackID )
end

ARMORY.GetEventCrateRef = function ()
	if Engine.GetDvarBool( "online_quartermaster_event" ) then
		return Engine.GetDvarString( "online_quartermaster_event_crate_ref" )
	elseif Engine.GetDvarBool( "online_quartermaster_multi_event" ) then
		return Engine.GetDvarString( "online_quartermaster_multi_event_crate_ref_base" ) .. tostring( Rewards.GetMultiEventID() + 1 )
	else
		
	end
end

ARMORY.GetEventCrateID = function ()
	if Engine.GetDvarBool( "online_quartermaster_event" ) then
		return Engine.GetDvarInt( "online_quartermaster_event_crate_ref_id" )
	elseif Engine.GetDvarBool( "online_quartermaster_multi_event" ) then
		return Engine.GetDvarInt( "online_quartermaster_multi_event_crate_ref_id_base" ) + Rewards.GetMultiEventID()
	else
		
	end
end

ARMORY.GetEventCrateEndTime = function ()
	if Engine.GetDvarBool( "online_quartermaster_event" ) then
		return Engine.GetDvarInt( "online_quartermaster_event_end" )
	elseif Engine.GetDvarBool( "online_quartermaster_multi_event" ) then
		return Engine.GetDvarInt( "online_quartermaster_multi_event_end" ) - (Engine.GetDvarInt( "online_quartermaster_multi_event_sub_event_count" ) - Rewards.GetMultiEventID() + 1) * Engine.GetDvarInt( "online_quartermaster_multi_event_sub_event_duration" )
	else
		
	end
end

ARMORY.GetBundleEndTime = function ( f25_arg0 )
	if f25_arg0 == ARMORY.CrateTypes.BUNDLE then
		return Engine.GetDvarInt( "online_bundle_end" )
	elseif f25_arg0 == ARMORY.CrateTypes.SECOND_BUNDLE then
		return Engine.GetDvarInt( "online_bundle2_end" )
	elseif f25_arg0 == ARMORY.CrateTypes.ZOMBIE_BUNDLE then
		return Engine.GetDvarInt( "online_zbundle_end" )
	else
		error( "Invalid Bundle Type!" )
	end
end

ARMORY.GetMaxCratesPurchasable = function ( f26_arg0 )
	if f26_arg0 == Engine.GetDvarInt( "online_bundle_crate_id" ) then
		return Engine.GetDvarInt( "online_bundle_max_purchasable" )
	elseif f26_arg0 == Engine.GetDvarInt( "online_bundle2_crate_id" ) then
		return Engine.GetDvarInt( "online_bundle2_max_purchasable" )
	elseif f26_arg0 == Engine.GetDvarInt( "online_zbundle_crate_id" ) then
		return Engine.GetDvarInt( "online_zbundle_max_purchasable" )
	elseif f26_arg0 == Engine.GetDvarInt( "online_quartermaster_event_crate_ref_id" ) then
		return Engine.GetDvarInt( "online_quartermaster_event_max_purchasable" )
	else
		return 0
	end
end

ARMORY.GetNumCratesPurchased = function ( f27_arg0, f27_arg1 )
	assert( f27_arg0 )
	local f27_local0, f27_local1 = nil
	if f27_arg0 == Engine.GetDvarInt( "online_bundle_crate_id" ) then
		f27_local1 = Engine.GetDvarInt( "online_bundle_tracker_id" )
	elseif f27_arg0 == Engine.GetDvarInt( "online_bundle2_crate_id" ) then
		f27_local1 = Engine.GetDvarInt( "online_bundle2_tracker_id" )
	elseif f27_arg0 == Engine.GetDvarInt( "online_zbundle_crate_id" ) then
		f27_local1 = Engine.GetDvarInt( "online_zbundle_tracker_id" )
	else
		f27_local1 = Engine.GetDvarInt( "online_quartermaster_event_tracker_id" )
	end
	assert( f27_local1, "ARMORY.GetNumCratesPurchased() - trackerID for crateID not found: " .. f27_arg0 )
	if f27_local1 then
		f27_local0 = Loot.IsOwned( f27_arg1, f27_local1 )
	end
	return f27_local0
end

ARMORY.AnyCratesAvailableForPurchase = function ( f28_arg0, f28_arg1 )
	local f28_local0 = false
	local f28_local1 = ARMORY.GetMaxCratesPurchasable( f28_arg0 )
	if f28_local1 and f28_local1 > 0 then
		local f28_local2 = ARMORY.GetNumCratesPurchased( f28_arg0, f28_arg1 )
		if f28_local2 then
			f28_local0 = f28_local1 - f28_local2 > 0
		end
	else
		f28_local0 = true
	end
	return f28_local0
end

ARMORY.TogglePrototypeButtonStates = function ( f29_arg0, f29_arg1, f29_arg2, f29_arg3, f29_arg4, f29_arg5, f29_arg6, f29_arg7, f29_arg8, f29_arg9, f29_arg10, f29_arg11 )
	local f29_local0 = Loot.IsOwned( f29_arg8, f29_arg9 ) > 0
	if not f29_arg11 then
		f29_arg11 = false
	end
	if not f29_local0 then
		f29_arg4:SetAlpha( 1, 0 )
		local f29_local1 = Loot.CraftDetails( f29_arg8, f29_arg9, f29_arg11 )
		if f29_local1.canCraft and f29_arg10 then
			f29_arg1:SetAlpha( 0.5, 0 )
			f29_arg1:SetRGBFromTable( COLORS.white )
			f29_arg5:SetAlpha( 1, 0 )
			f29_arg6:SetAlpha( 1, 0 )
			f29_arg7:SetAlpha( 0.6, 0 )
			f29_arg3:SetAlpha( 0, 0 )
			f29_arg4:SetRGBFromTable( COLORS.white, 0 )
			f29_arg0:setActionSFX( SOUND_SETS.default.action )
		else
			f29_arg1:SetAlpha( 0.4, 0 )
			f29_arg1:SetRGBFromInt( 0, 0 )
			f29_arg3:SetAlpha( 1, 0 )
			f29_arg5:SetAlpha( 0, 0 )
			f29_arg6:SetAlpha( 0, 0 )
			f29_arg7:SetAlpha( 0, 0 )
			f29_arg4:SetRGBFromInt( 11776947, 0 )
			f29_arg0:setActionSFX( SOUND_SETS.default.deny )
		end
	else
		f29_arg3:SetAlpha( 0, 0 )
		f29_arg4:SetAlpha( 0, 0 )
		f29_arg1:SetAlpha( 1, 0 )
		f29_arg1:SetRGBFromTable( COLORS.white )
		f29_arg2:SetAlpha( 1, 0 )
		f29_arg5:SetAlpha( 0, 0 )
		f29_arg6:SetAlpha( 0, 0 )
		f29_arg7:SetAlpha( 0, 0 )
		f29_arg0:setActionSFX( SOUND_SETS.default.action )
	end
end

ARMORY.GetLootCrateTable = function ( f30_arg0 )
	local f30_local0 = {}
	for f30_local1 = 0, Engine.TableGetRowCount( CSV.lootCrate.file ), 1 do
		local f30_local4 = CSV.ReadRow( CSV.lootCrate, f30_local1 )
		if f30_local4 ~= nil and tonumber( f30_local4.index ) ~= nil and tonumber( f30_local4.isBribeCrate ) == 1 then
			local f30_local5 = Loot.IsOwned( f30_arg0, f30_local4.index )
			if 0 < f30_local5 then
				table.insert( f30_local0, {
					id = f30_local4.index,
					name = Engine.Localize( f30_local4.displayName ),
					image = f30_local4.displayImage,
					desc = Engine.Localize( f30_local4.displayDesc ),
					lootOwned = f30_local5
				} )
			end
		end
	end
	return f30_local0
end

ARMORY.IsWeaponRnG = function ( f31_arg0, f31_arg1 )
	if f31_arg1 == MissionDirector.teamRnGValue then
		local f31_local0 = Engine.GetDvarString( "online_rng_bypass" )
		if #f31_local0 > 0 then
			local f31_local1 = {}
			for f31_local5 in string.gmatch( f31_local0, "([^,]+)" ) do
				if tonumber( f31_local5 ) ~= nil then
					f31_local1[tonumber( f31_local5 )] = true
					f31_local1[tonumber( f31_local5 ) + 5000] = true
				end
			end
			if f31_local1[tonumber( f31_arg0 )] == true then
				return false
			end
		end
		return true
	else
		return false
	end
end

