SPSharedUtils = SPSharedUtils or {}
SPSharedUtils.GetNumScannedPowers = function ( f1_arg0 )
	local f1_local0 = 0
	for f1_local1 = 0, Engine.TableGetRowCount( CSV.powers.file ) - 1, 1 do
		if DataSources.inGame.SP.player.equipmentState[Engine.TableLookupByRow( CSV.powers.file, f1_local1, CSV.powers.cols.ref )]:GetValue( f1_arg0 ) == Cac.SPPowerState.SCANNED then
			f1_local0 = f1_local0 + 1
		end
	end
	return f1_local0
end

SPSharedUtils.GetNumScannedJackalDecals = function ( f2_arg0 )
	local f2_local0 = 0
	for f2_local1 = 0, Engine.TableGetRowCount( CSV.jackalDecals.file ) - 1, 1 do
		local f2_local4 = Engine.TableLookupByRow( CSV.jackalDecals.file, f2_local1, CSV.jackalDecals.cols.ref )
		if f2_local4 ~= Cac.jackalEquipNone and DataSources.alwaysLoaded.playerData.SP.spData.jackalDecals[f2_local4]:GetValue( f2_arg0 ) == Cac.spLockStates.SCANNED then
			f2_local0 = f2_local0 + 1
		end
	end
	return f2_local0
end

SPSharedUtils.GetNumScannedJackalWeapons = function ( f3_arg0 )
	local f3_local0 = 0
	for f3_local1 = 0, Engine.TableGetRowCount( CSV.jackalWeapons.file ) - 1, 1 do
		local f3_local4 = Engine.TableLookupByRow( CSV.jackalWeapons.file, f3_local1, CSV.jackalWeapons.cols.ref )
		local f3_local5 = Engine.TableLookupByRow( CSV.jackalWeapons.file, f3_local1, CSV.jackalWeapons.cols.type )
		if f3_local4 ~= Cac.jackalEquipNone then
			if f3_local5 == "primary" then
				if DataSources.alwaysLoaded.playerData.SP.spData.jackalPrimaryState[f3_local4]:GetValue( f3_arg0 ) == Cac.spLockStates.SCANNED then
					f3_local0 = f3_local0 + 1
				end
			end
			if DataSources.alwaysLoaded.playerData.SP.spData.jackalSecondaryState[f3_local4] == Cac.spLockStates.SCANNED then
				f3_local0 = f3_local0 + 1
			end
		end
	end
	return f3_local0
end

SPSharedUtils.GetNumScannedJackelUpgrades = function ( f4_arg0 )
	local f4_local0 = 0
	for f4_local1 = 0, Engine.TableGetRowCount( CSV.jackalUpgrades.file ) - 1, 1 do
		local f4_local4 = Engine.TableLookupByRow( CSV.jackalUpgrades.file, f4_local1, CSV.jackalUpgrades.cols.ref )
		if f4_local4 ~= Cac.jackalEquipNone and DataSources.alwaysLoaded.playerData.SP.spData.jackalUpgradeState[f4_local4] == Cac.spLockStates.SCANNED then
			f4_local0 = f4_local0 + 1
		end
	end
	return f4_local0
end

SPSharedUtils.GetNumScannedAttachments = function ( f5_arg0 )
	local f5_local0 = 0
	local f5_local1 = {
		done = true
	}
	for f5_local2 = 0, Engine.TableGetRowCount( CSV.attachments.file ) - 1, 1 do
		local f5_local5 = Engine.TableLookupByRow( CSV.attachments.file, f5_local2, CSV.attachments.cols.baseRef )
		if f5_local1[f5_local5] == nil then
			f5_local1[f5_local5] = true
			local f5_local6 = DataSources.inGame.SP.player.attachmentsState[f5_local5]
			if f5_local6 and f5_local6:GetValue( f5_arg0 ) == Cac.spLockStates.SCANNED then
				f5_local0 = f5_local0 + 1
			end
		end
	end
	return f5_local0
end

SPSharedUtils.GetNumScannedWeapons = function ( f6_arg0 )
	local f6_local0 = 0
	for f6_local1 = 0, Engine.TableGetRowCount( CSV.weapons.file ) - 1, 1 do
		if DataSources.inGame.SP.player.weaponsScanned[Engine.TableLookupByRow( CSV.weapons.file, f6_local1, CSV.weapons.cols.ref )]:GetValue( f6_arg0 ) == Cac.scannedWeaponStates.SCANNED then
			f6_local0 = f6_local0 + 1
		end
	end
	return f6_local0
end

SPSharedUtils.GetNumScannedPerks = function ( f7_arg0 )
	local f7_local0 = 0
	for f7_local1 = 0, Engine.TableGetRowCount( CSV.SPPerks.file ) - 1, 1 do
		if Engine.TableLookupByRow( CSV.SPPerks.file, f7_local1, CSV.SPPerks.cols.type ) == "perk" then
			local f7_local4 = DataSources.inGame.SP.player.suitUpgradeState[string.gsub( Engine.TableLookupByRow( CSV.SPPerks.file, f7_local1, CSV.SPPerks.cols.ref ), "specialty_", "" )]
			if f7_local4 ~= nil and f7_local4:GetValue( f7_arg0 ) == Cac.spLockStates.SCANNED then
				f7_local0 = f7_local0 + 1
			end
		end
	end
	return f7_local0
end

SPSharedUtils.GetNumScannedReticles = function ( f8_arg0 )
	local f8_local0 = 0
	local f8_local1 = 8
	for f8_local2 = 0, f8_local1 - 1, 1 do
		if DataSources.inGame.SP.fragReticles[f8_local2].state == Cac.spLockStates.SCANNED then
			f8_local0 = f8_local0 + 1
		end
	end
	return f8_local0
end

SPSharedUtils.GetLevelRewards = function ( f9_arg0 )
	local f9_local0 = {}
	local f9_local1 = Engine.TableLookup( CSV.progressionUnlocks.file, CSV.progressionUnlocks.cols.ref, f9_arg0, CSV.progressionUnlocks.cols.suit )
	if f9_local1 and #f9_local1 > 0 then
		table.insert( f9_local0, {
			icon = "icon_ops_map_reward_perk",
			value = Engine.Localize( "SUIT_SP_" .. f9_local1 ),
			type = Engine.Localize( "MENU_SP_REWARD_PERK" )
		} )
	end
	local f9_local2 = 0
	local f9_local3 = {
		CSV.progressionUnlocks.cols.jackal_primaries,
		CSV.progressionUnlocks.cols.jackal_secondaries,
		CSV.progressionUnlocks.cols.jackal_upgrade
	}
	for f9_local4 = 1, #f9_local3, 1 do
		if #Engine.TableLookup( CSV.progressionUnlocks.file, CSV.progressionUnlocks.cols.ref, f9_arg0, f9_local3[f9_local4] ) > 0 then
			f9_local2 = f9_local2 + 1
		end
	end
	if f9_local2 > 0 then
		table.insert( f9_local0, {
			icon = "icon_ops_map_reward_jackal",
			value = tostring( f9_local2 ),
			type = Engine.Localize( "MENU_SP_REWARD_JACKAL_UPGRADE" )
		} )
	end
	local f9_local4 = Engine.TableLookup( CSV.OpsMap.file, CSV.OpsMap.cols.map, f9_arg0, CSV.OpsMap.cols.rewardWeapons )
	if f9_local4 and #f9_local4 > 0 then
		table.insert( f9_local0, {
			icon = "icon_ops_map_reward_weapon",
			value = Engine.Localize( f9_local4 ),
			type = Engine.Localize( "MENU_SP_REWARD_WEAPON" )
		} )
	end
	local f9_local5 = Engine.TableLookup( CSV.OpsMap.file, CSV.OpsMap.cols.map, f9_arg0, CSV.OpsMap.cols.rewardMostWanted )
	if not f9_local5 or #f9_local5 == 0 then
		f9_local5 = 0
	end
	if tonumber( f9_local5 ) > 0 then
		table.insert( f9_local0, {
			icon = "icon_ops_map_reward_most_wanted",
			value = f9_local5,
			type = Engine.Localize( "MENU_SP_REWARD_MOST_WANTED" )
		} )
	end
	return f9_local0
end

