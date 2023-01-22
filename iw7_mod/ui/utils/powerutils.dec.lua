Cac = Cac or {}
Cac.powerSlots = 2
Cac.powerNoneValue = "none"
Cac.SPPowerState = {
	LOCKED = "locked",
	SCANNED = "scanned",
	UNLOCKED = "unlocked",
	UPGRADE_ONE = "upgrade1",
	UPGRADE_TWO = "upgrade2"
}
Cac.SPHands = {
	OFFHAND = 0,
	ITEM = 1
}
Cac.PowerSlot = {
	LETHAL = 0,
	TACTICAL = 1
}
Cac.GetPowerDesc = function ( f1_arg0 )
	assert( f1_arg0 )
	return Engine.Localize( Engine.TableLookup( CSV.powers.file, CSV.powers.cols.ref, tostring( f1_arg0 ), CSV.powers.cols.desc ) )
end

Cac.GetPowerUpgradeOneDesc = function ( f2_arg0 )
	assert( f2_arg0 )
	return Engine.Localize( Engine.TableLookup( CSV.powers.file, CSV.powers.cols.ref, tostring( f2_arg0 ), CSV.powers.cols.upgradeOneText ) )
end

Cac.GetPowerUpgradeTwoDesc = function ( f3_arg0 )
	assert( f3_arg0 )
	return Engine.Localize( Engine.TableLookup( CSV.powers.file, CSV.powers.cols.ref, tostring( f3_arg0 ), CSV.powers.cols.upgradeTwoText ) )
end

Cac.GetPowerImageLarge = function ( f4_arg0 )
	return Engine.TableLookup( CSV.powers.file, CSV.powers.cols.ref, f4_arg0, CSV.powers.cols.imageLarge )
end

Cac.GetPowerName = function ( f5_arg0 )
	return Engine.Localize( Engine.TableLookup( CSV.powers.file, CSV.powers.cols.ref, f5_arg0, CSV.powers.cols.name ) )
end

Cac.GetPowerImage = function ( f6_arg0 )
	return Engine.TableLookup( CSV.powers.file, CSV.powers.cols.ref, f6_arg0, CSV.powers.cols.image )
end

Cac.GetPowerSmallRender = function ( f7_arg0 )
	return Engine.TableLookup( CSV.powers.file, CSV.powers.cols.ref, f7_arg0, CSV.powers.cols.smallRender )
end

Cac.GetPowerSlot = function ( f8_arg0 )
	return tonumber( Engine.TableLookup( CSV.menuPowers.file, CSV.menuPowers.cols.ref, f8_arg0, CSV.menuPowers.cols.slot ) )
end

Cac.GetPowerIndex = function ( f9_arg0, f9_arg1 )
	assert( POWER_LIST )
	assert( POWER_LIST[f9_arg0] )
	return POWER_LIST[f9_arg0][f9_arg1].index
end

Cac.IsBasePowerUnlocked = function ( f10_arg0, f10_arg1 )
	return Engine.IsUnlocked( f10_arg1, "power", f10_arg0 )
end

Cac.IsPowerInUse = function ( f11_arg0 )
	return f11_arg0 ~= Cac.powerNoneValue
end

Cac.IsExtraPowerInUse = function ( f12_arg0 )
	return f12_arg0 == 1
end

Cac.GetPowerImageFromRefAndLootID = function ( f13_arg0, f13_arg1 )
	if f13_arg1 == Cac.BaseLootID then
		return Cac.GetPowerImage( f13_arg0 )
	else
		return Engine.TableLookup( CSV.powerLootMaster.file, CSV.powerLootMaster.cols.index, f13_arg1, CSV.powerLootMaster.cols.displayImage )
	end
end

Cac.GetPowerQuality = function ( f14_arg0, f14_arg1 )
	if f14_arg1 == Cac.BaseLootID then
		return Cac.LowestQuality
	else
		return tonumber( Engine.TableLookup( CSV.powerLootMaster.file, CSV.powerLootMaster.cols.index, f14_arg1, CSV.powerLootMaster.cols.quality ) )
	end
end

Cac.GetPowerQualityColor = function ( f15_arg0, f15_arg1 )
	return Cac.GetLootQualityColor( Cac.GetPowerQuality( f15_arg0, f15_arg1 ) )
end

Cac.GetPowerNameFromRefAndLootID = function ( f16_arg0, f16_arg1, f16_arg2 )
	if f16_arg1 == Cac.BaseLootID then
		if f16_arg0 == Cac.powerNoneValue then
			return Engine.Localize( "LUA_MENU_NO_POWER_" .. f16_arg2 )
		else
			return Cac.GetPowerName( f16_arg0 )
		end
	else
		return Engine.Localize( Engine.TableLookup( CSV.powerLootMaster.file, CSV.powerLootMaster.cols.index, f16_arg1, CSV.powerLootMaster.cols.displayName ) )
	end
end

Cac.ClearPower = function ( f17_arg0, f17_arg1 )
	if Engine.IsMultiplayer() then
		f17_arg0.power:SetValue( f17_arg1, Cac.powerNoneValue )
		f17_arg0.lootItemID:SetValue( f17_arg1, Cac.BaseLootID )
		Cac.ClearExtraPower( f17_arg0, f17_arg1 )
	else
		f17_arg0:SetValue( f17_arg1, Cac.powerNoneValue )
	end
end

Cac.ClearExtraPower = function ( f18_arg0, f18_arg1 )
	f18_arg0.extraCharge:SetValue( f18_arg1, 0 )
end

Cac.GetSPPowerUpgradeCost = function ( f19_arg0, f19_arg1 )
	local f19_local0 = f19_arg0.ref
	local f19_local1 = DataSources.inGame.SP.player.equipmentState[f19_arg0.ref:GetValue( f19_arg1 )]:GetValue( f19_arg1 )
	if f19_local1 == Cac.SPPowerState.UNLOCKED or f19_local1 == Cac.SPPowerState.UPGRADE_ONE then
		local f19_local2 = nil
		if f19_local1 == Cac.SPPowerState.UNLOCKED then
			f19_local2 = f19_arg0.upgradeOneCost:GetValue( f19_arg1 )
		else
			f19_local2 = f19_arg0.upgradeTwoCost:GetValue( f19_arg1 )
		end
		return f19_local2
	else
		return 0
	end
end

Cac.GetSPPowerStateText = function ( f20_arg0 )
	assert( Engine.IsSingleplayer() )
	if f20_arg0 == Cac.SPPowerState.UNLOCKED then
		return ""
	elseif f20_arg0 == Cac.SPPowerState.UPGRADE_ONE then
		return Engine.Localize( "MENU_SP_V1" )
	elseif f20_arg0 == Cac.SPPowerState.UPGRADE_TWO then
		return Engine.Localize( "MENU_SP_V2" )
	else
		return ""
	end
end

Cac.GetSPPowerHandFromSlot = function ( f21_arg0, f21_arg1 )
	local f21_local0
	if f21_arg1 == Cac.SPHands.OFFHAND then
		f21_local0 = f21_arg0.offhandPowers
		if not f21_local0 then
		
		else
			return f21_local0
		end
	end
	f21_local0 = f21_arg0.powers
end

Cac.GetPowerUnlockRank = function ( f22_arg0 )
	return Engine.TableLookup( CSV.powerUnlockTable.file, CSV.powerUnlockTable.cols.ref, f22_arg0, CSV.powerUnlockTable.cols.unlockRank )
end

Cac.GetPowerItemCardData = function ( f23_arg0 )
	local f23_local0 = Cac.GetPowerSlot( f23_arg0 )
	local f23_local1 = Cac.GetPowerUnlockRank( f23_arg0 )
	local f23_local2 = {
		name = Cac.GetPowerName( f23_arg0 ),
		image = Cac.GetPowerImage( f23_arg0 ),
		desc = Cac.GetPowerDesc( f23_arg0 )
	}
	local f23_local3
	if f23_local0 == 1 then
		f23_local3 = Engine.Localize( "LUA_MENU_MP_ITEM_CARD_TITLE_LETHAL" )
		if not f23_local3 then
		
		else
			f23_local2.title = f23_local3
			f23_local2.rank = Rank.GetRankDisplay( f23_local1 )
			f23_local2.rankIcon = Rank.GetRankIcon( f23_local1, 0 )
			f23_local2.rankName = Rank.GetShortRank( f23_local1 )
			return f23_local2
		end
	end
	f23_local3 = Engine.Localize( "LUA_MENU_MP_ITEM_CARD_TITLE_TACTICAL" )
end

Cac.GetLethalStats = function ( f24_arg0 )
	local f24_local0 = {}
	for f24_local1 = 0, Engine.TableGetRowCount( CSV.menuPowers.file ), 1 do
		local f24_local4 = CSV.ReadRow( CSV.menuPowers, f24_local1 )
		if f24_local4 ~= nil and f24_local4.itemType == "LETHAL" then
			local f24_local5 = {
				ref = f24_local4.ref,
				name = Engine.Localize( Engine.TableLookup( CSV.MPpowers.file, CSV.MPpowers.cols.ref, f24_local4.ref, CSV.MPpowers.cols.name ) ),
				desc = Engine.Localize( Engine.TableLookup( CSV.MPpowers.file, CSV.MPpowers.cols.ref, f24_local4.ref, CSV.MPpowers.cols.desc ) ),
				image = Engine.TableLookup( CSV.MPpowers.file, CSV.MPpowers.cols.ref, f24_local4.ref, CSV.MPpowers.cols.imageLarge ),
				uses = Engine.GetPlayerDataEx( f24_arg0, CoD.StatsGroup.Ranked, "lethalStats", f24_local4.ref, "uses" ),
				extraStat1 = Engine.GetPlayerDataEx( f24_arg0, CoD.StatsGroup.Ranked, "lethalStats", f24_local4.ref, "kills" ),
				killsPerUse = f24_local5.extraStat1 / (f24_local5.uses and f24_local5.uses or 1)
			}
			table.insert( f24_local0, f24_local5 )
		end
	end
	table.sort( f24_local0, function ( f25_arg0, f25_arg1 )
		return f25_arg1.extraStat1 < f25_arg0.extraStat1
	end )
	return f24_local0
end

Cac.GetTacticalStats = function ( f26_arg0 )
	local f26_local0 = {}
	for f26_local1 = 0, Engine.TableGetRowCount( CSV.menuPowers.file ), 1 do
		local f26_local4 = CSV.ReadRow( CSV.menuPowers, f26_local1 )
		if f26_local4 ~= nil and f26_local4.itemType == "TACTICAL" then
			local f26_local5 = Engine.TableLookup( CSV.MPpowers.file, CSV.MPpowers.cols.ref, f26_local4.ref, CSV.MPpowers.cols.extraRecordType )
			local f26_local6 = {
				ref = f26_local4.ref,
				desc = Engine.Localize( Engine.TableLookup( CSV.MPpowers.file, CSV.MPpowers.cols.ref, f26_local4.ref, CSV.MPpowers.cols.desc ) ),
				name = Engine.Localize( Engine.TableLookup( CSV.MPpowers.file, CSV.MPpowers.cols.ref, f26_local4.ref, CSV.MPpowers.cols.name ) ),
				image = Engine.TableLookup( CSV.MPpowers.file, CSV.MPpowers.cols.ref, f26_local4.ref, CSV.MPpowers.cols.imageLarge )
			}
			local f26_local7
			if 0 < #f26_local5 then
				f26_local7 = Engine.Localize( f26_local5 )
				if not f26_local7 then
				
				else
					f26_local6.extraRecordType = f26_local7
					f26_local6.uses = Engine.GetPlayerDataEx( f26_arg0, CoD.StatsGroup.Ranked, "tacticalStats", f26_local4.ref, "uses" )
					f26_local6.extraStat1 = Engine.GetPlayerDataEx( f26_arg0, CoD.StatsGroup.Ranked, "tacticalStats", f26_local4.ref, "extraStat1" )
					table.insert( f26_local0, f26_local6 )
				end
			end
			f26_local7 = f26_local5
		end
	end
	table.sort( f26_local0, function ( f27_arg0, f27_arg1 )
		return f27_arg1.uses < f27_arg0.uses
	end )
	return f26_local0
end

