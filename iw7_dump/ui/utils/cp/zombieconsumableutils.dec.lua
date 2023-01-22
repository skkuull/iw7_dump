ZMB_CONSUMABLES = ZMB_CONSUMABLES or {}
ZMB_CONSUMABLES.GetConsumableName = function ( f1_arg0 )
	return Engine.Localize( Engine.TableLookup( CSV.zombieConsumableItems.File, CSV.zombieConsumableItems.Cols.Ref, f1_arg0, CSV.zombieConsumableItems.Cols.Name ) )
end

ZMB_CONSUMABLES.GetConsumableImage = function ( f2_arg0 )
	return Engine.TableLookup( CSV.zombieConsumableItems.File, CSV.zombieConsumableItems.Cols.Ref, f2_arg0, CSV.zombieConsumableItems.Cols.Icon )
end

ZMB_CONSUMABLES.GetConsumableDesc = function ( f3_arg0 )
	return Engine.Localize( Engine.TableLookup( CSV.zombieConsumableItems.File, CSV.zombieConsumableItems.Cols.Ref, f3_arg0, CSV.zombieConsumableItems.Cols.Desc ) )
end

ZMB_CONSUMABLES.GetConsumableUnlockRank = function ( f4_arg0 )
	return Rank.GetRankFromRankDisplay( Engine.TableLookup( CSV.fateCardUnlockTable.file, CSV.fateCardUnlockTable.cols.ref, f4_arg0, CSV.fateCardUnlockTable.cols.unlockRank ) )
end

ZMB_CONSUMABLES.GetZMBFateCardItemCardData = function ( f5_arg0 )
	local f5_local0 = ZMB_CONSUMABLES.GetConsumableUnlockRank( f5_arg0 )
	return {
		name = ZMB_CONSUMABLES.GetConsumableName( f5_arg0 ),
		image = ZMB_CONSUMABLES.GetConsumableImage( f5_arg0 ),
		desc = ZMB_CONSUMABLES.GetConsumableDesc( f5_arg0 ),
		title = Engine.Localize( "LUA_MENU_ZM_FATE_CARDS_CAPS" ),
		rank = Rank.GetRankDisplay( f5_local0 ),
		rankIcon = Rank.GetRankIcon( f5_local0, 0 ),
		rankName = Rank.GetShortRank( f5_local0 )
	}
end

ZMB_CONSUMABLES.GetDeckSizeName = function ( f6_arg0 )
	return Engine.TableLookup( CSV.weaponBuildUpgrades.file, CSV.weaponBuildUpgrades.cols.ref, f6_arg0, CSV.weaponBuildUpgrades.cols.name )
end

ZMB_CONSUMABLES.GetDeckSizeImage = function ( f7_arg0 )
	return Engine.TableLookup( CSV.weaponBuildUpgrades.file, CSV.weaponBuildUpgrades.cols.ref, f7_arg0, CSV.weaponBuildUpgrades.cols.image )
end

ZMB_CONSUMABLES.GetDeckSizeDesc = function ( f8_arg0 )
	return Engine.TableLookup( CSV.weaponBuildUpgrades.file, CSV.weaponBuildUpgrades.cols.ref, f8_arg0, CSV.weaponBuildUpgrades.cols.desc )
end

ZMB_CONSUMABLES.GetDeckSizeUnlockRank = function ( f9_arg0 )
	return Rank.GetRankFromRankDisplay( Engine.TableLookup( CSV.fateDeckSizeUnlockTable.file, CSV.fateDeckSizeUnlockTable.cols.ref, f9_arg0, CSV.fateDeckSizeUnlockTable.cols.unlockRank ) )
end

ZMB_CONSUMABLES.GetDeckSizeItemCardData = function ( f10_arg0 )
	local f10_local0 = ZMB_CONSUMABLES.GetDeckSizeUnlockRank( f10_arg0 )
	return {
		name = ZMB_CONSUMABLES.GetDeckSizeName( f10_arg0 ),
		image = ZMB_CONSUMABLES.GetDeckSizeImage( f10_arg0 ),
		desc = ZMB_CONSUMABLES.GetDeckSizeDesc( f10_arg0 ),
		title = Engine.Localize( "LUA_MENU_ZM_DECK_SLOT" ),
		rank = Rank.GetRankDisplay( f10_local0 ),
		rankIcon = Rank.GetRankIcon( f10_local0, 0 ),
		rankName = Rank.GetShortRank( f10_local0 )
	}
end

ZMB_CONSUMABLES.DecorateCardFunc = function ( f11_arg0 )
	return function ( f12_arg0, f12_arg1, f12_arg2 )
		local f12_local0 = f12_arg1.ref:GetValue( f12_arg2 )
		local f12_local1 = Engine.IsUnlocked( f12_arg2, "fateCard", f12_local0 ) and 0 or 1
		local f12_local2 = Engine.TableLookup( CSV.zombieConsumableItems.File, CSV.zombieConsumableItems.Cols.Ref, f12_local0, CSV.zombieConsumableItems.Cols.InventoryType ) == "Fate"
		local f12_local3 = nil
		local f12_local4 = Loot.IsOwned( f12_arg2, Engine.TableLookup( CSV.zombieConsumableItems.File, CSV.zombieConsumableItems.Cols.Ref, f12_local0, CSV.zombieConsumableItems.Cols.LootID ) )
		if f12_local2 then
			f12_local3 = Engine.IsUnlocked( f12_arg2, "fateCard", f12_local0, true )
		else
			f12_local3 = true
			if CONDITIONS.IsSystemLink() then
				f12_local3 = false
			end
		end
		return {
			isUnlocked = LUI.DataSourceInGlobalModel.new( f11_arg0 .. ".card." .. f12_local0 .. ".unlocked", f12_local3 ),
			numOwned = LUI.DataSourceInGlobalModel.new( f11_arg0 .. ".card." .. f12_local0 .. ".numOwned", f12_local4 ),
			lockIconAlpha = LUI.DataSourceInGlobalModel.new( f11_arg0 .. ".card." .. f12_local0 .. ".lockIconAlpha", f12_local1 ),
			timesUsed = LUI.DataSourceInControllerModel.new( f11_arg0 .. ".card." .. f12_local0 .. ".timesUsed", Engine.GetPlayerDataEx( f12_arg2, CoD.StatsGroup.Coop, "cards_used", f12_local0 ) )
		}
	end
	
end

