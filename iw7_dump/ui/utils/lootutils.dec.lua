LOOT = LOOT or {}
LOOT.IntroSlamDuration = 500
LOOT.RandomizeDuration = 1000
LOOT.ChristmasCamoFirstLootID = 140792
LOOT.ChristmasCamoLastLootID = 140799
LOOT.ChristmasCamoLootID = -2
LOOT.SummerCamo1FirstLootID = 141816
LOOT.SummerCamo1LastLootID = 141823
LOOT.SummerCamo1LootID = -3
LOOT.SummerCamo2FirstLootID = 141824
LOOT.SummerCamo2LastLootID = 141831
LOOT.SummerCamo2LootID = -4
LOOT.ListWeaponCSVFiles = function ()
	local f1_local0 = CSV.weaponLootMaster
	local f1_local1 = {}
	for f1_local2 = 0, Engine.TableGetRowCount( f1_local0.file ), 1 do
		local f1_local5 = Engine.TableLookupByRow( f1_local0.file, f1_local2, f1_local0.cols.variantTable )
		if #f1_local5 > 0 then
			f1_local1[f1_local5] = true
		end
	end
	local f1_local2 = {}
	for f1_local5, f1_local7 in pairs( f1_local1 ) do
		table.insert( f1_local2, Cac.GetFullPathForWeaponVariantTable( f1_local5 ) )
	end
	return f1_local2
end

LOOT.GetVariantTableForWeapon = function ( f2_arg0 )
	for f2_local3, f2_local4 in ipairs( LOOT.ListWeaponCSVFiles() ) do
		if Engine.TableLookupGetRowNum( f2_local4, CSV.weaponLoot.cols.ref, f2_arg0 ) >= 0 then
			return f2_local4
		end
	end
end

LOOT.GetItemMasterFile = function ( f3_arg0 )
	for f3_local0 = 0, Engine.TableGetRowCount( CSV.lootMaster.file ), 1 do
		local f3_local3 = CSV.ReadRow( CSV.lootMaster, f3_local0 )
		if tonumber( f3_local3.startIndex ) <= f3_arg0 and f3_arg0 <= tonumber( f3_local3.endIndex ) then
			return f3_local3.file
		end
	end
end

LOOT.GetItemText = function ( f4_arg0 )
	local f4_local0 = ""
	for f4_local4, f4_local5 in ipairs( f4_arg0 ) do
		f4_local0 = f4_local0 .. "\n" .. Engine.TableLookup( LOOT.GetItemMasterFile( f4_local5 ), CSV.lootFile.cols.index, f4_local5, CSV.lootFile.cols.name )
	end
	return f4_local0
end

LOOT.GetLastLootDropList = function ( f5_arg0 )
	local f5_local0 = LUI.DataSourceFromPlayerData.new( CoD.StatsGroup.Common, CoD.PlayMode.Core )
	local f5_local1 = f5_local0.lastLootDropIndex:GetValue( f5_arg0 )
	if f5_local1 == 0 then
		return {}
	end
	local f5_local2 = {}
	local f5_local3 = f5_local0.lastLootDrops
	local f5_local4 = f5_local1 - 1
	local f5_local5 = f5_local3:GetCountValue( f5_arg0 ) - 1
	while f5_local4 ~= f5_local1 do
		local f5_local6 = f5_local3:GetDataSourceAtIndex( f5_local4 )
		f5_local6 = f5_local6:GetValue( f5_arg0 )
		if f5_local6 == 0 then
			break
		end
		table.insert( f5_local2, f5_local6 )
		if f5_local4 == 0 then
			local f5_local7 = f5_local5
		end
		f5_local4 = f5_local7 or f5_local4 - 1
	end
	return f5_local2
end

LOOT.AreAnyLastLootItemsInCSV = function ( f6_arg0, f6_arg1 )
	local f6_local0 = LOOT.GetLastLootDropList( f6_arg0 )
	local f6_local1 = tonumber( Engine.TableLookup( CSV.lootMaster.file, CSV.lootMaster.cols.file, f6_arg1, CSV.lootMaster.cols.startIndex ) )
	local f6_local2 = tonumber( Engine.TableLookup( CSV.lootMaster.file, CSV.lootMaster.cols.file, f6_arg1, CSV.lootMaster.cols.endIndex ) )
	for f6_local3 = 1, #f6_local0, 1 do
		local f6_local6 = f6_local0[f6_local3]
		if f6_local1 <= f6_local6 and f6_local6 <= f6_local2 and Loot.IsNew( f6_arg0, f6_local6 ) then
			return true
		end
	end
	return false
end

LOOT.AreAnyLastLootItemsWeaponBySlot = function ( f7_arg0, f7_arg1 )
	local f7_local0 = LOOT.GetLastLootDropList( f7_arg0 )
	local f7_local1 = tonumber( Engine.TableLookup( CSV.lootMaster.file, CSV.lootMaster.cols.file, CSV.weaponLootMaster.file, CSV.lootMaster.cols.startIndex ) )
	local f7_local2 = tonumber( Engine.TableLookup( CSV.lootMaster.file, CSV.lootMaster.cols.file, CSV.weaponLootMaster.file, CSV.lootMaster.cols.endIndex ) )
	for f7_local3 = 1, #f7_local0, 1 do
		local f7_local6 = f7_local0[f7_local3]
		if f7_local1 <= f7_local6 and f7_local6 <= f7_local2 and Cac.GetWeaponSlotFromLootID( f7_local6 ) == f7_arg1 and Loot.IsNew( f7_arg0, f7_local6 ) then
			return true
		end
	end
	return false
end

LOOT.AreAnyLastLootItemsWeaponByClass = function ( f8_arg0, f8_arg1 )
	local f8_local0 = LOOT.GetLastLootDropList( f8_arg0 )
	local f8_local1 = tonumber( Engine.TableLookup( CSV.lootMaster.file, CSV.lootMaster.cols.file, CSV.weaponLootMaster.file, CSV.lootMaster.cols.startIndex ) )
	local f8_local2 = tonumber( Engine.TableLookup( CSV.lootMaster.file, CSV.lootMaster.cols.file, CSV.weaponLootMaster.file, CSV.lootMaster.cols.endIndex ) )
	for f8_local3 = 1, #f8_local0, 1 do
		local f8_local6 = f8_local0[f8_local3]
		if f8_local1 <= f8_local6 and f8_local6 <= f8_local2 and Cac.GetWeaponClassFromLootID( f8_local6 ) == f8_arg1 and Loot.IsNew( f8_arg0, f8_local6 ) then
			return true
		end
	end
	return false
end

LOOT.AreAnyLastLootItemsBaseWeapon = function ( f9_arg0, f9_arg1 )
	local f9_local0 = LOOT.GetLastLootDropList( f9_arg0 )
	local f9_local1 = tonumber( Engine.TableLookup( CSV.lootMaster.file, CSV.lootMaster.cols.file, CSV.weaponLootMaster.file, CSV.lootMaster.cols.startIndex ) )
	local f9_local2 = tonumber( Engine.TableLookup( CSV.lootMaster.file, CSV.lootMaster.cols.file, CSV.weaponLootMaster.file, CSV.lootMaster.cols.endIndex ) )
	for f9_local3 = 1, #f9_local0, 1 do
		local f9_local6 = f9_local0[f9_local3]
		if f9_local1 <= f9_local6 and f9_local6 <= f9_local2 and Cac.GetBaseWeaponRefFromLootID( f9_local6 ) == f9_arg1 and Loot.IsNew( f9_arg0, f9_local6 ) then
			return true
		end
	end
	return false
end

LOOT.AreAnyLastLootItemsBaseStreak = function ( f10_arg0, f10_arg1 )
	local f10_local0 = LOOT.GetLastLootDropList( f10_arg0 )
	local f10_local1 = tonumber( Engine.TableLookup( CSV.lootMaster.file, CSV.lootMaster.cols.file, CSV.streakLootMaster.file, CSV.lootMaster.cols.startIndex ) )
	local f10_local2 = tonumber( Engine.TableLookup( CSV.lootMaster.file, CSV.lootMaster.cols.file, CSV.streakLootMaster.file, CSV.lootMaster.cols.endIndex ) )
	for f10_local3 = 1, #f10_local0, 1 do
		local f10_local6 = f10_local0[f10_local3]
		if f10_local1 <= f10_local6 and f10_local6 <= f10_local2 and Engine.TableLookup( CSV.streakLootMaster.file, CSV.streakLootMaster.cols.index, f10_local6, CSV.streakLootMaster.cols.baseStreak ) == f10_arg1 and Loot.IsNew( f10_arg0, f10_local6 ) then
			return true
		end
	end
	return false
end

LOOT.GetWeaponLootData = function ( f11_arg0 )
	local f11_local0 = {
		type = LUI.ItemCard.types.WEAPON,
		categoryDisplayName = "MENU_UNLOCK"
	}
	local f11_local1 = {
		"salvageReturned",
		"cost",
		"salvageIndex",
		"license"
	}
	local f11_local2 = CSV.ReadRow( CSV.weaponLootMaster, Engine.TableLookupGetRowNum( CSV.weaponLootMaster.file, CSV.weaponLootMaster.cols.index, f11_arg0 ) )
	for f11_local6, f11_local7 in ipairs( f11_local1 ) do
		f11_local0[f11_local7] = f11_local2[f11_local7]
	end
	if f11_local2 and f11_local2.ref then
		f11_local3 = {
			"baseWeapon",
			"quality",
			"displayName",
			"displayImage",
			"desc",
			"suffix"
		}
		f11_local4 = LOOT.GetVariantTableForWeapon( f11_local2.ref )
		if f11_local4 == nil then
			Loot.InvalidLootError( f11_arg0 )
		end
		f11_local5 = Engine.TableLookupGetRowNum( f11_local4, CSV.weaponLoot.cols.ref, f11_local2.ref )
		f11_local6 = LUI.ShallowCopy( CSV.weaponLoot )
		f11_local6.file = f11_local4
		f11_local7 = CSV.ReadRow( f11_local6, f11_local5 )
		for f11_local11, f11_local12 in ipairs( f11_local3 ) do
			f11_local0[f11_local12] = f11_local7[f11_local12]
		end
	end
	return f11_local0
end

LOOT.FortuneCardPackLootStart = 175000
LOOT.FortuneCardPackLootEnd = 179999
LOOT.FortuneCardPackOffset = 5000
LOOT.GetFortuneCardAmount = function ( f12_arg0 )
	local f12_local0 = 1
	if f12_arg0 >= LOOT.FortuneCardPackLootStart and f12_arg0 <= LOOT.FortuneCardPackLootEnd then
		f12_local0 = Engine.TableLookup( CSV.zombieConsumableItems.file, CSV.zombieConsumableItems.Cols.LootID, f12_arg0 - LOOT.FortuneCardPackOffset, CSV.zombieConsumableItems.Cols.MultiPackAmount )
	end
	return f12_local0
end

LOOT.GetFortuneLootItemID = function ( f13_arg0 )
	if LOOT.FortuneCardPackLootStart <= f13_arg0 and f13_arg0 <= LOOT.FortuneCardPackLootEnd then
		f13_arg0 = f13_arg0 - LOOT.FortuneCardPackOffset
	end
	return f13_arg0
end

LOOT.IsFortuneCard = function ( f14_arg0 )
	if LOOT.FortuneCardPackLootStart - LOOT.FortuneCardPackOffset <= f14_arg0 and f14_arg0 <= LOOT.FortuneCardPackLootEnd then
		return true
	else
		return false
	end
end

LOOT.GetLootItemData = function ( f15_arg0, f15_arg1, f15_arg2, f15_arg3 )
	local f15_local0 = {
		type = f15_arg1,
		categoryDisplayName = "MENU_UNLOCK"
	}
	local f15_local1 = Engine.TableLookupGetRowNum( f15_arg0.file, f15_arg0.cols.index, f15_arg3 )
	if f15_local1 < 0 then
		Loot.InvalidLootError( f15_arg3 )
	end
	local f15_local2 = CSV.ReadRow( f15_arg0, f15_local1 )
	for f15_local6, f15_local7 in ipairs( f15_arg2 ) do
		f15_local0[f15_local7] = f15_local2[f15_local7]
	end
	return f15_local0
end

LOOT.GetLootData = function ( f16_arg0 )
	local f16_local0 = nil
	if f16_arg0 == LOOT.ChristmasCamoLootID then
		f16_local0 = {
			type = LUI.ItemCard.types.COSMETIC_CAMO,
			quality = 4,
			displayName = "LUA_MENU_CAMO_100",
			displayImage = "icon_camo_100"
		}
	elseif f16_arg0 == LOOT.SummerCamo1LootID then
		f16_local0 = {
			type = LUI.ItemCard.types.COSMETIC_CAMO,
			quality = 4,
			displayName = "LUA_MENU_CAMO_228",
			displayImage = "icon_camo_228"
		}
	elseif f16_arg0 == LOOT.SummerCamo2LootID then
		f16_local0 = {
			type = LUI.ItemCard.types.COSMETIC_CAMO,
			quality = 4,
			displayName = "LUA_MENU_CAMO_229",
			displayImage = "icon_camo_229"
		}
	else
		for f16_local1 = 0, Engine.TableGetRowCount( CSV.lootMaster.file ), 1 do
			local f16_local4 = CSV.ReadRow( CSV.lootMaster, f16_local1 )
			local f16_local5 = tonumber( f16_local4.startIndex )
			local f16_local6 = tonumber( f16_local4.endIndex )
			local f16_local7 = f16_local4.file
			if f16_local7 ~= "" and f16_local5 <= f16_arg0 and f16_arg0 <= f16_local6 then
				if f16_local7 == CSV.weaponLootMaster.file then
					f16_local0 = LOOT.GetWeaponLootData( f16_arg0 )
					break
				elseif f16_local7 == CSV.streakLootMaster.file then
					f16_local0 = LOOT.GetLootItemData( CSV.streakLootMaster, LUI.ItemCard.types.STREAK, {
						"quality",
						"ref",
						"displayName",
						"displayImage",
						"salvageReturned",
						"cost",
						"salvageIndex",
						"license",
						"baseStreak",
						"suffix",
						"pointsCost"
					}, f16_arg0 )
					break
				elseif f16_local7 == CSV.powerLootMaster.file then
					f16_local0 = LOOT.GetLootItemData( CSV.powerLootMaster, LUI.ItemCard.types.POWER, {
						"quality",
						"ref",
						"displayName",
						"displayImage",
						"salvageReturned",
						"cost",
						"salvageIndex",
						"basePower",
						"license"
					}, f16_arg0 )
					break
				elseif f16_local7 == CSV.consumableLootMaster.file then
					f16_local0 = LOOT.GetLootItemData( CSV.consumableLootMaster, LUI.ItemCard.types.CONSUMABLE, {
						"quality",
						"ref",
						"displayName",
						"salvageReturned",
						"cost",
						"salvageIndex",
						"license",
						"displayImage"
					}, f16_arg0 )
					break
				elseif f16_local7 == CSV.cosmeticCallingCardsLootMaster.file then
					f16_local0 = LOOT.GetLootItemData( CSV.cosmeticCallingCardsLootMaster, LUI.ItemCard.types.CALLING_CARD, {
						"quality",
						"ref",
						"salvageReturned",
						"cost",
						"salvageIndex",
						"displayImage",
						"displayName",
						"license"
					}, f16_arg0 )
					break
				elseif f16_local7 == CSV.DLCLootMaster.file then
					f16_local0 = LOOT.GetLootItemData( CSV.DLCLootMaster, LUI.ItemCard.types.DLC, {
						"salvageIndex",
						"ref"
					}, f16_arg0 )
					break
				elseif f16_local7 == CSV.currencyLootMaster.file then
					f16_local0 = LOOT.GetLootItemData( CSV.currencyLootMaster, LUI.ItemCard.types.CURRENCY, {}, f16_arg0 )
					break
				elseif f16_local7 == CSV.currencyPackLootMaster.file then
					f16_local0 = LOOT.GetLootItemData( CSV.currencyPackLootMaster, LUI.ItemCard.types.CURRENCY_PACK, {
						"quality",
						"ref",
						"currencyType",
						"uiamount",
						"displayName",
						"displayImage"
					}, f16_arg0 )
					break
				elseif f16_local7 == CSV.carePackageLootMaster.file then
					f16_local0 = LOOT.GetLootItemData( CSV.carePackageLootMaster, LUI.ItemCard.types.CARE_PACKAGE, {
						"quality",
						"ref",
						"salvageReturned",
						"cost",
						"salvageIndex"
					}, f16_arg0 )
					break
				elseif f16_local7 == CSV.cosmeticEmblemsLootMaster.file then
					f16_local0 = LOOT.GetLootItemData( CSV.cosmeticEmblemsLootMaster, LUI.ItemCard.types.EMBLEM, {
						"quality",
						"ref",
						"salvageReturned",
						"cost",
						"salvageIndex",
						"displayImage",
						"displayName",
						"license"
					}, f16_arg0 )
					break
				elseif f16_local7 == CSV.cosmeticEmotesLootMaster.file then
					f16_local0 = LOOT.GetLootItemData( CSV.cosmeticEmotesLootMaster, LUI.ItemCard.types.GESTURE, {
						"quality",
						"ref",
						"salvageReturned",
						"cost",
						"salvageIndex",
						"displayImage",
						"displayName",
						"license"
					}, f16_arg0 )
					break
				elseif f16_local7 == CSV.cosmeticRigsLootMaster.file then
					f16_local0 = LOOT.GetLootItemData( CSV.cosmeticRigsLootMaster, LUI.ItemCard.types.RIG_HEAD, {
						"quality",
						"ref",
						"salvageReturned",
						"cost",
						"salvageIndex",
						"displayImage",
						"displayName",
						"license"
					}, f16_arg0 )
					break
				elseif f16_local7 == CSV.cosmeticReticlesLootMaster.file then
					f16_local0 = LOOT.GetLootItemData( CSV.cosmeticReticlesLootMaster, LUI.ItemCard.types.RETICLE, {
						"quality",
						"ref",
						"salvageReturned",
						"cost",
						"salvageIndex",
						"displayImage",
						"displayName",
						"license"
					}, f16_arg0 )
					break
				elseif f16_local7 == CSV.cosmeticFictionLootMaster.file then
					f16_local0 = LOOT.GetLootItemData( CSV.cosmeticFictionLootMaster, LUI.ItemCard.types.FICTION, {
						"quality",
						"ref",
						"salvageReturned",
						"cost",
						"salvageIndex",
						"displayImage",
						"displayName",
						"license"
					}, f16_arg0 )
					break
				elseif f16_local7 == CSV.cosmeticCamosLootMaster.file then
					f16_local0 = LOOT.GetLootItemData( CSV.cosmeticCamosLootMaster, LUI.ItemCard.types.COSMETIC_CAMO, {
						"quality",
						"ref",
						"salvageReturned",
						"cost",
						"salvageIndex",
						"displayImage",
						"displayName",
						"license"
					}, f16_arg0 )
					break
				elseif f16_local7 == CSV.cosmeticAttachmentsLootMaster.file then
					f16_local0 = LOOT.GetLootItemData( CSV.cosmeticAttachmentsLootMaster, LUI.ItemCard.types.COSMETIC_ATTACHMENT, {
						"quality",
						"ref",
						"salvageReturned",
						"cost",
						"salvageIndex",
						"displayImage",
						"displayName",
						"license"
					}, f16_arg0 )
					break
				elseif f16_local7 == CSV.lootCrate.file then
					f16_local0 = LOOT.GetLootItemData( CSV.lootCrate, LUI.ItemCard.types.CRATE, {
						"ref",
						"cost",
						"displayName",
						"displayImage",
						"quality",
						"isBribeCrate"
					}, f16_arg0 )
					break
				elseif f16_local7 == CSV.zombieConsumableItems.file then
					local f16_local8 = {
						"Ref",
						"Quality",
						"Name",
						"Icon",
						"MultiPack",
						"MultiPackAmount"
					}
					f16_arg0 = LOOT.GetFortuneLootItemID( f16_arg0 )
					f16_local0 = LOOT.GetLootItemData( CSV.zombieConsumableItems, LUI.ItemCard.types.FATE_CARD, f16_local8, f16_arg0 )
					break
				elseif f16_local7 == CSV.cosmeticHeroesLootMaster.file then
					f16_local0 = LOOT.GetLootItemData( CSV.cosmeticHeroesLootMaster, LUI.ItemCard.types.RIG_HEAD, {
						"quality",
						"ref",
						"salvageReturned",
						"cost",
						"salvageIndex",
						"displayImage",
						"displayName",
						"license"
					}, f16_arg0 )
					f16_local0.isHero = true
					break
				end
			end
		end
	end
	if f16_local0 == nil then
		Loot.InvalidLootError( f16_arg0 )
	end
	return f16_local0
end

LOOT.GetLootItemStats = function ( f17_arg0, f17_arg1 )
	local f17_local0 = {
		accuracy = 0,
		damage = 0,
		range = 0,
		fireRate = 0,
		mobility = 0
	}
	local f17_local1 = Engine.TableLookup( CSV.weaponLootMaster.file, CSV.weaponLootMaster.cols.index, tostring( f17_arg0 ), CSV.weaponLootMaster.cols.ref )
	local f17_local2 = LOADOUT.GetWeaponLootVariantData( f17_arg1 )
	if f17_local2 then
		for f17_local16, f17_local17 in ipairs( f17_local2.rows ) do
			local f17_local18 = CSV.ReadRow( {
				file = f17_local2.file,
				cols = CSV.weaponLoot.cols
			}, f17_local17 )
			if f17_local18.ref == f17_local1 then
				local f17_local6 = tonumber( f17_local18.statAccuracy )
				local f17_local7 = tonumber( f17_local18.statDamage )
				local f17_local8 = tonumber( f17_local18.statRange )
				local f17_local9 = tonumber( f17_local18.statFireRate )
				local f17_local10 = tonumber( f17_local18.statMobility )
				for f17_local14, f17_local15 in ipairs( LOOT.GetLootWeaponPassives( f17_local18 ) ) do
					f17_local6 = f17_local6 + tonumber( Engine.TableLookupByRow( CSV.passives.file, f17_local15.index, CSV.passives.cols.statAccuracy ) )
					f17_local7 = f17_local7 + tonumber( Engine.TableLookupByRow( CSV.passives.file, f17_local15.index, CSV.passives.cols.statDamage ) )
					f17_local8 = f17_local8 + tonumber( Engine.TableLookupByRow( CSV.passives.file, f17_local15.index, CSV.passives.cols.statRange ) )
					f17_local9 = f17_local9 + tonumber( Engine.TableLookupByRow( CSV.passives.file, f17_local15.index, CSV.passives.cols.statFireRate ) )
					f17_local10 = f17_local10 + tonumber( Engine.TableLookupByRow( CSV.passives.file, f17_local15.index, CSV.passives.cols.statMobility ) )
				end
				f17_local0.accuracy = f17_local6
				f17_local0.damage = f17_local7
				f17_local0.range = f17_local8
				f17_local0.fireRate = f17_local9
				f17_local0.mobility = f17_local10
				return f17_local0
			end
		end
	end
	return nil
end

LOOT.GetLootWeaponPassives = function ( f18_arg0 )
	local f18_local0 = {}
	for f18_local1 = Cac.FirstPassiveIndex, Cac.LastPassiveIndex, 1 do
		local f18_local4 = f18_arg0["passive" .. f18_local1]
		if #f18_local4 > 0 then
			local f18_local5 = DataSources.alwaysLoaded.MP.CAC.passives[f18_local4]
			assert( f18_local5 )
			table.insert( f18_local0, f18_local5 )
		end
	end
	return f18_local0
end

LOOT.DoubleXPTokenID = 30000
LOOT.UseDoubleXPToken = function ( f19_arg0 )
	if Loot.IsOwned( f19_arg0, LOOT.DoubleXPTokenID ) > 0 then
		local f19_local0 = CoD.GetCommonPlayerDataDataSource()
		f19_local0 = f19_local0.round.totalXp:GetValue( f19_arg0 )
		local f19_local1 = CoD.GetRankedPlayerDataDataSource()
		f19_local1 = f19_local1.progression.playerLevel.xp:GetValue( f19_arg0 )
		local f19_local2 = f19_local1 + f19_local0
		DebugPrint( "Double XP Token Used - Adding " .. f19_local0 .. " to " .. f19_local1 .. ", new total is now " .. f19_local2 )
		Loot.UseDoubleXPToken( f19_arg0 )
		DataSources.alwaysLoaded.playerData.MP.ranked.progression.playerLevel.xp:SetValue( f19_arg0, f19_local2 )
		Engine.ExecNow( "uploadstats", f19_arg0 )
	end
end

MenuBuilder.registerType( "PurchaseCrateNoCurrency", function ( f20_arg0, f20_arg1 )
	if CONDITIONS.IsStoreAllowed( f20_arg0 ) then
		return MenuBuilder.BuildRegisteredType( "PopupYesNo", {
			message = Engine.Localize( "LUA_MENU_MP_NOT_ENOUGH_CURRENCY" ),
			yesAction = function ( f21_arg0, f21_arg1 )
				local f21_local0 = STORE.GoToCODPointsOnlyStore
				local f21_local1 = f20_arg1.controllerIndex
				local f21_local2 = f21_arg0:GetCurrentMenu()
				f21_local0( f21_local1, f21_local2.id, f21_arg0.id )
			end
			,
			yesLabel = Engine.Localize( "LUA_MENU_MP_PURCHASE_COD_POINTS" ),
			noLabel = Engine.Localize( "LUA_MENU_CANCEL" )
		} )
	else
		return MenuBuilder.BuildRegisteredType( "PopupOK", {
			message = Engine.Localize( "LUA_MENU_MP_NOT_ENOUGH_CURRENCY" )
		} )
	end
end )
LOOT.GetPurchaseLootCrateAction = function ( f22_arg0, f22_arg1, f22_arg2, f22_arg3, f22_arg4, f22_arg5, f22_arg6, f22_arg7 )
	return function ( f23_arg0, f23_arg1 )
		local f23_local0, f23_local1, f23_local2, f23_local3 = nil
		if f22_arg5 == ARMORY.CrateTypes.NORMAL then
			f23_local3 = Engine.TableLookup( CSV.lootCrate.file, CSV.lootCrate.cols.index, f22_arg3, CSV.lootCrate.cols.demonwareID )
			f23_local0 = CoD.GetAdjustedCurrency( tonumber( Engine.TableLookup( CSV.lootCrate.file, CSV.lootCrate.cols.index, f22_arg3, CSV.lootCrate.cols.cost ) ) )
			f23_local1 = tonumber( Engine.TableLookup( CSV.lootCrate.file, CSV.lootCrate.cols.index, f22_arg3, CSV.lootCrate.cols.premiumCost ) )
			f23_local2 = tonumber( Engine.TableLookup( CSV.lootCrate.file, CSV.lootCrate.cols.index, f22_arg3, CSV.lootCrate.cols.salvageCost ) )
			local f23_local4 = Engine.GetDvarInt( "loot_crate_cost_overide" )
			if f23_local1 > 0 and f23_local4 > 0 then
				f23_local1 = f23_local4
			end
		elseif f22_arg5 == ARMORY.CrateTypes.EVENT then
			f23_local3 = Engine.GetDvarInt( "online_quartermaster_event_dwid" )
			f23_local0 = Engine.GetDvarInt( "online_quartermaster_event_crate_price_key" )
			f23_local1 = Engine.GetDvarInt( "online_quartermaster_event_crate_price_cp" )
			f23_local2 = Engine.GetDvarInt( "online_quartermaster_event_crate_price_scrap" )
		elseif f22_arg5 == ARMORY.CrateTypes.BUNDLE then
			f23_local3 = Engine.GetDvarInt( "online_bundle_dw_id" )
			f23_local0 = Engine.GetDvarInt( "online_bundle_crate_price_key" )
			f23_local1 = Engine.GetDvarInt( "online_bundle_crate_price_cp" )
			f23_local2 = Engine.GetDvarInt( "online_bundle_crate_price_scrap" )
		elseif f22_arg5 == ARMORY.CrateTypes.SECOND_BUNDLE then
			f23_local3 = Engine.GetDvarInt( "online_bundle2_dw_id" )
			f23_local0 = Engine.GetDvarInt( "online_bundle2_crate_price_key" )
			f23_local1 = Engine.GetDvarInt( "online_bundle2_crate_price_cp" )
			f23_local2 = Engine.GetDvarInt( "online_bundle2_crate_price_scrap" )
		elseif f22_arg5 == ARMORY.CrateTypes.ZOMBIE_BUNDLE then
			f23_local3 = Engine.GetDvarInt( "online_zbundle_dw_id" )
			f23_local0 = Engine.GetDvarInt( "online_zbundle_crate_price_key" )
			f23_local1 = Engine.GetDvarInt( "online_zbundle_crate_price_cp" )
			f23_local2 = Engine.GetDvarInt( "online_zbundle_crate_price_scrap" )
		end
		assert( f23_local0 )
		assert( f23_local1 )
		assert( f23_local2 )
		local f23_local4 = DataSources.frontEnd.MP.commerce.inGameCurrency:GetValue( f22_arg1 )
		local f23_local5 = DataSources.frontEnd.MP.commerce.premiumCurrency:GetValue( f22_arg1 )
		local f23_local6 = DataSources.frontEnd.MP.commerce.craftingCurrency:GetValue( f22_arg1 )
		local f23_local7 = true
		local f23_local8 = false
		local f23_local9 = false
		local f23_local10 = false
		if Loot.IsOwned( f22_arg1, f22_arg3 ) > 0 then
			f23_local7 = false
			local f23_local11 = LUI.FlowManager.GetScopedData( f23_arg0 )
			f23_local11.lastPurchasedCrateID = f22_arg3
			f23_local11.lastCrateUsedCODPoints = false
			Loot.ExchangeLootCrate( f22_arg1, f23_local3 )
			if Engine.IsAliensMode() then
				LUI.FlowManager.RequestPopupMenu( f23_arg0, "live_dialog_text_box", true, f22_arg1, false, {
					message = Engine.Localize( "LUA_MENU_ZM_ZOMBIE_CRATE_PURCHASE" )
				} )
			else
				LUI.FlowManager.RequestPopupMenu( f23_arg0, "live_dialog_text_box", true, f22_arg1, false, {
					message = Engine.Localize( "LUA_MENU_MP_SUPPLY_DROP_PURCHASE" )
				} )
			end
		elseif f23_local1 > 0 and CONDITIONS.AreCODPointsEnabled() then
			if f23_local0 <= 0 or f23_local0 > f23_local4 then
				f23_local9 = false
			else
				f23_local9 = true
			end
			if not f23_local9 and not (f23_local1 <= f23_local5) then
				f23_local7 = false
				LUI.FlowManager.RequestPopupMenu( f23_arg0, "PurchaseCrateNoCurrency", true, f22_arg1, false )
			end
		elseif f23_local2 > 0 then
			if not (f23_local2 <= f23_local6) then
				f23_local7 = false
				LUI.FlowManager.RequestPopupMenu( f23_arg0, "NotEnoughSalvagePopup", true, f22_arg1, false )
			end
		elseif f23_local0 > 0 then
			if not (f23_local0 <= f23_local4) then
				f23_local7 = false
				LUI.FlowManager.RequestPopupMenu( f23_arg0, "NotEnoughKeysPopup", true, f22_arg1, false )
			end
		elseif f23_local1 == 0 and f23_local2 == 0 and f23_local0 == 0 then
			if f22_arg5 == ARMORY.CrateTypes.EVENT then
				local f23_local11 = LUI.FlowManager.GetScopedData( f23_arg0 )
				f23_local11.lastPurchasedCrateID = f22_arg3
				f23_local11.lastCrateUsedCODPoints = false
				ARMORY.BuyEventCrate( f23_arg0, f22_arg1, false )
			else
				f22_arg0( f23_arg0, f22_arg1, false, f22_arg3 )
				if Engine.IsAliensMode() then
					LUI.FlowManager.RequestPopupMenu( f23_arg0, "live_dialog_text_box", true, f22_arg1, false, {
						message = Engine.Localize( "LUA_MENU_ZM_ZOMBIE_CRATE_PURCHASE" )
					} )
				else
					LUI.FlowManager.RequestPopupMenu( f23_arg0, "live_dialog_text_box", true, f22_arg1, false, {
						message = Engine.Localize( "LUA_MENU_MP_SUPPLY_DROP_PURCHASE" )
					} )
				end
			end
			f23_local7 = false
		end
		if f23_local7 then
			LUI.FlowManager.RequestPopupMenu( f23_arg0, "PurchaseLootCratePopup", true, f22_arg1, false, {
				controllerIndex = f22_arg1,
				crateImage = f22_arg4,
				crateString = f22_arg2,
				crateID = f22_arg3,
				purchaseLootCrateAction = f22_arg0,
				keysCost = f23_local0,
				premiumCost = f23_local1,
				salvageCost = f23_local2,
				useWideImage = f22_arg6,
				lastCurrencyUsed = f22_arg7
			} )
		end
	end
	
end

LOOT.PopulateLootCardsFromRewards = function ( f24_arg0, f24_arg1, f24_arg2, f24_arg3, f24_arg4, f24_arg5, f24_arg6 )
	assert( f24_arg0.cardList )
	assert( f24_arg0.DupeText )
	assert( f24_arg0.BonusSalvage )
	local f24_local0 = false
	local f24_local1 = f24_arg1.items
	local f24_local2 = 3
	local f24_local3 = Engine.IsAliensMode()
	if f24_local3 then
		if f24_arg0._crateID ~= ARMORY.zombieCrateID and f24_arg0._crateID ~= ARMORY.zombieRareCrateID and f24_arg0._crateID ~= ARMORY.zombieCardPackID and f24_arg0._crateID ~= ARMORY.zombieRareCardPackID then
			f24_local3 = false
		else
			f24_local3 = true
		end
	end
	local f24_local4 = false
	local f24_local5 = #f24_local1
	if Engine.IsCoreMode() then
		f24_arg0.bestLootQuality = 0
	end
	if not f24_local3 then
		f24_local4 = f24_local2 < f24_local5
		f24_local5 = math.min( f24_local5, f24_local2 )
	end
	local f24_local6 = Engine.Localize( "LOOT_MP_DUPE_TEXT" )
	for f24_local7 = 0, f24_local5 - 1, 1 do
		local f24_local10 = f24_local1[f24_local7 + 1]
		local f24_local11 = LOOT.GetLootData( f24_local10 )
		local f24_local12 = Cac.GetLootQualityColor( f24_local11.quality )
		if Engine.IsCoreMode() and tonumber( f24_arg0.bestLootQuality ) < tonumber( f24_local11.quality ) then
			f24_arg0.bestLootQuality = f24_local11.quality
		end
		if f24_local11.type == LUI.ItemCard.types.CALLING_CARD or f24_local11.type == LUI.ItemCard.types.EMBLEM then
			f24_local0 = true
		end
		local f24_local13 = false
		if f24_arg1.dupes[f24_local7 + 1] == true then
			f24_arg0.DupeText:setText( f24_local6, 0 )
			f24_local13 = true
			f24_arg0.hasDupes = true
		end
		local f24_local14 = {
			isDuplicate = f24_local13,
			context = f24_arg2,
			itemType = f24_local11.type,
			identifier = f24_local10,
			modelPath = f24_arg4 .. ".itemCard." .. f24_local10,
			cardIndex = f24_local7,
			controllerIndex = f24_arg5
		}
		if f24_local13 then
			f24_local14.dupeSalvageValue = f24_local11.salvageReturned
		end
		local f24_local15 = not f24_local3
		if f24_local3 then
			if f24_local11.type == LUI.ItemCard.types.FATE_CARD then
				table.insert( f24_arg3, f24_local10 )
			elseif #f24_arg3 > 0 then
				f24_local4 = true
				f24_local2 = f24_local7
			else
				f24_local15 = true
			end
		end
		if f24_local15 then
			f24_arg0.cardList:addElement( MenuBuilder.BuildRegisteredType( "LootItemCard", f24_local14 ) )
		end
	end
	if f24_local4 then
		assert( f24_arg0.BonusSalvage )
		local f24_local8 = LOOT.GetLootData( f24_local1[f24_local2 + 1] )
		f24_arg0.BonusSalvage:SetAlpha( 0 )
		f24_arg0.BonusSalvage:SetScale( 1 )
		local f24_local9 = LOOT.RandomizeDuration * 5
		if Engine.IsAliensMode() and f24_arg6 then
			f24_local9 = LOOT.RandomizeDuration
		end
		f24_arg0.BonusSalvage:SetUpBonus( f24_local8, f24_local9 )
		local f24_local16 = f24_arg0:Wait( f24_local9 )
		f24_local16.onComplete = function ()
			Engine.PlaySound( "ui_iw7_loot_salvage_bonus" )
			if Engine.IsAliensMode() and f24_arg6 then
				f24_arg0.BonusSalvage:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -619, _1080p * -319, _1080p * 390, _1080p * 690 )
			end
			f24_arg0.BonusSalvage:SetAlpha( 1, 200, LUI.EASING.outBack )
			f24_arg0.BonusSalvage:SetScale( 0, 200, LUI.EASING.outBack )
		end
		
	else
		f24_arg0.BonusSalvage:SetAlpha( 0, 0 )
	end
	return f24_local0
end

LOOT.GetCrateTitle = function ( f26_arg0 )
	if f26_arg0 == ARMORY.rareCrateID then
		return "LUA_MENU_MP_SUPPLY_DROP_RARE"
	elseif f26_arg0 == ARMORY.commonCrateID then
		return "LUA_MENU_MP_SUPPLY_DROP_COMMON"
	elseif f26_arg0 == ARMORY.zombieCrateID then
		return "LUA_MENU_ZM_COMMON_ZOMBIE_SUPPLY_DROP"
	elseif f26_arg0 == ARMORY.zombieRareCrateID then
		return "LUA_MENU_ZM_RARE_ZOMBIE_SUPPLY_DROP"
	else
		return Engine.TableLookup( CSV.lootCrate.file, CSV.lootCrate.cols.index, f26_arg0, CSV.lootCrate.cols.displayName )
	end
end

LOOT.ContextSkipRandomize = function ( f27_arg0 )
	local f27_local0
	if f27_arg0 ~= LUI.ItemCard.contexts.ITEM_CRAFTED and f27_arg0 ~= LUI.ItemCard.contexts.CP_WEAPON_LOOT and f27_arg0 ~= LUI.ItemCard.contexts.QUARTERMASTER_CIPHER then
		f27_local0 = false
	else
		f27_local0 = true
	end
	return f27_local0
end

LOOT.GetCurrentLootLicense = function ()
	return Engine.GetDvarInt( "online_license" )
end

LOOT.GetLootMaterialStreamer = function ()
	local f29_local0 = {
		RegisterMaterial( "loot_bonus_salvage_bg" ),
		RegisterMaterial( "loot_bonus_salvage_frame" ),
		RegisterMaterial( "loot_item_card_bg" ),
		RegisterMaterial( "loot_item_card_blur" ),
		RegisterMaterial( "loot_item_card_burst_lines_01" ),
		RegisterMaterial( "loot_item_card_burst_lines_02" ),
		RegisterMaterial( "loot_item_card_explosion_000" ),
		RegisterMaterial( "loot_item_card_explosion_001" ),
		RegisterMaterial( "loot_item_card_explosion_002" ),
		RegisterMaterial( "loot_item_card_explosion_003" ),
		RegisterMaterial( "loot_item_card_explosion_004" ),
		RegisterMaterial( "loot_item_card_explosion_005" ),
		RegisterMaterial( "loot_item_card_explosion_006" ),
		RegisterMaterial( "loot_item_card_explosion_007" ),
		RegisterMaterial( "loot_item_card_explosion_008" ),
		RegisterMaterial( "loot_item_card_explosion_009" ),
		RegisterMaterial( "loot_item_card_explosion_010" ),
		RegisterMaterial( "loot_item_card_explosion_011" ),
		RegisterMaterial( "loot_item_card_explosion_012" ),
		RegisterMaterial( "loot_item_card_explosion_013" ),
		RegisterMaterial( "loot_item_card_flare" ),
		RegisterMaterial( "loot_item_card_frame_common" ),
		RegisterMaterial( "loot_item_card_frame_epic" ),
		RegisterMaterial( "loot_item_card_frame_lengendary" ),
		RegisterMaterial( "loot_item_card_frame_rare" ),
		RegisterMaterial( "loot_item_card_single_starburst" ),
		RegisterMaterial( "loot_item_card_sparks" ),
		RegisterMaterial( "loot_item_card_spinning_widg" ),
		RegisterMaterial( "loot_item_card_starbursts" ),
		RegisterMaterial( "loot_item_cards_frame" ),
		RegisterMaterial( "loot_purchase_again_bg" ),
		RegisterMaterial( "armory_loot_crate_common" ),
		RegisterMaterial( "armory_loot_crate_gold" ),
		RegisterMaterial( "armory_loot_crate_holiday" ),
		RegisterMaterial( "armory_loot_crate_rare" ),
		RegisterMaterial( "armory_zombie_loot_crate_common" ),
		RegisterMaterial( "armory_zombie_loot_crate_rare" ),
		RegisterMaterial( "bribe_bg_smoke" ),
		RegisterMaterial( "bribe_lines_bg" ),
		RegisterMaterial( "icon_bribe_calling_card" ),
		RegisterMaterial( "icon_bribe_epic" ),
		RegisterMaterial( "icon_bribe_legendary" ),
		RegisterMaterial( "icon_bribe_mk2" ),
		RegisterMaterial( "icon_bribe_prototype" ),
		RegisterMaterial( "icon_bribe_qmaster_collection" ),
		RegisterMaterial( "icon_bribe_rig_ftl" ),
		RegisterMaterial( "icon_bribe_rig_gear" ),
		RegisterMaterial( "icon_bribe_rig_gestures" ),
		RegisterMaterial( "icon_bribe_rig_merc" ),
		RegisterMaterial( "icon_bribe_rig_phantom" )
	}
	local self = RegisterMaterial( "icon_bribe_rig_stryker" )
	local f29_local2 = RegisterMaterial( "icon_bribe_rig_synaptic" )
	local f29_local3 = RegisterMaterial( "icon_bribe_rig_taunts" )
	local f29_local4 = RegisterMaterial( "icon_bribe_rig_warfighter" )
	local f29_local5 = RegisterMaterial( "icon_bribe_scorestreak" )
	local f29_local6 = RegisterMaterial( "icon_bribe_weapon_accessory" )
	local f29_local7 = RegisterMaterial( "icon_bribe_weapon_assualt" )
	local f29_local8 = RegisterMaterial( "icon_bribe_weapon_camo" )
	local f29_local9 = RegisterMaterial( "icon_bribe_weapon_launcher" )
	local f29_local10 = RegisterMaterial( "icon_bribe_weapon_lmg" )
	local f29_local11 = RegisterMaterial( "icon_bribe_weapon_pistol" )
	local f29_local12 = RegisterMaterial( "icon_bribe_weapon_reticle" )
	local f29_local13 = RegisterMaterial( "icon_bribe_weapon_shotgun" )
	local f29_local14 = RegisterMaterial( "icon_bribe_weapon_smg" )
	local f29_local15 = RegisterMaterial( "icon_bribe_weapon_sniper" )
	local f29_local16 = RegisterMaterial( "icon_bundle_tripleplay_mp" )
	local f29_local17 = RegisterMaterial( "icon_bundle_tripleplay_cp" )
	self = LUI.UIElement.new()
	self.id = "LootMaterialStreamer"
	self:SetupImageStreamer( f29_local0 )
	return self
end

