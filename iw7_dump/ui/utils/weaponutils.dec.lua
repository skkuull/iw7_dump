Cac = Cac or {}
Cac.scannedWeaponStates = {
	LOCKED = "locked",
	SCANNED = "scanned",
	UNLOCKED = "unlocked"
}
Cac.CamoNoneValue = "none"
Cac.ReticleNoneValue = "none"
Cac.CosmeticAttachmentNoneValue = "none"
Cac.WeaponVariantIDNoneValue = -1
Cac.PrimaryWeaponSlot = 0
Cac.SecondaryWeaponSlot = 1
Cac.HandgunClassRef = "weapon_pistol"
Cac.MeleeClassRef = "weapon_melee"
Cac.ReticleTypes = {
	Standard = "standard",
	Scoped = "scoped"
}
Cac.GetWeaponRowList = function ()
	if Engine.IsAliensMode() then
		return CP_WEAPON_ROW_LIST
	elseif Engine.IsMultiplayer() then
		return WEAPON_ROW_LIST
	else
		return SP_WEAPON_ROW_LIST
	end
end

Cac.GetWeaponLootIDFromLootRef = function ( f2_arg0 )
	return Engine.TableLookup( CSV.weaponLootMaster.file, CSV.weaponLootMaster.cols.ref, f2_arg0, CSV.weaponLootMaster.cols.index )
end

Cac.StripSuffix = function ( f3_arg0, f3_arg1 )
	local f3_local0 = f3_arg0
	local f3_local1 = string.len( f3_arg0 )
	if string.sub( f3_arg0, f3_local1 - 2 ) == f3_arg1 then
		f3_local0 = string.sub( f3_arg0, 0, f3_local1 - 3 )
	end
	return f3_local0
end

Cac.GetWeaponClassList = function ()
	if Engine.IsAliensMode() then
		return CP_WEAPON_CLASS_LIST
	elseif Engine.IsMultiplayer() then
		return WEAPON_CLASS_LIST
	else
		return SP_WEAPON_CLASS_LIST
	end
end

Cac.GetWeaponClassSlot = function ( f5_arg0 )
	return Engine.TableLookup( CSV.weaponClasses.file, CSV.weaponClasses.cols.ref, f5_arg0, CSV.weaponClasses.cols.slot )
end

Cac.GetWeaponSlotFromLootID = function ( f6_arg0 )
	return Cac.GetWeaponSlotFromWeaponRef( Cac.GetBaseWeaponRefFromLootID( f6_arg0 ) )
end

Cac.GetWeaponClassFromLootID = function ( f7_arg0 )
	return Cac.GetWeaponClass( Cac.GetBaseWeaponRefFromLootID( f7_arg0 ) )
end

Cac.GetWeaponSlotFromWeaponRef = function ( f8_arg0 )
	return tonumber( Cac.GetWeaponClassSlot( Cac.GetWeaponClass( f8_arg0 ) ) ) - 1
end

Cac.GetAllWeaponClasses = function ()
	local f9_local0 = Cac.GetWeaponClassList()
	local f9_local1 = {}
	for f9_local8, f9_local9 in ipairs( f9_local0 ) do
		for f9_local5, f9_local6 in ipairs( f9_local9 ) do
			table.insert( f9_local1, f9_local6 )
		end
	end
	return f9_local1
end

Cac.GetWeaponClasses = function ( f10_arg0 )
	local f10_local0 = Cac.GetWeaponClassList()
	assert( f10_local0[1 + f10_arg0] )
	return f10_local0[1 + f10_arg0]
end

Cac.IsWeaponSlotInUse = function ( f11_arg0 )
	local f11_local0
	if f11_arg0 == "specialty_null" or f11_arg0 == "none" or f11_arg0 == "iw7_fists" or f11_arg0 == "iw7_fists_mp" then
		f11_local0 = false
	else
		f11_local0 = true
	end
	return f11_local0
end

Cac.DoesWeaponCostPoint = function ( f12_arg0 )
	return Cac.IsWeaponSlotInUse( f12_arg0 )
end

Cac.IsBaseWeaponUnlocked = function ( f13_arg0, f13_arg1 )
	return Engine.IsUnlocked( f13_arg1, "weapon", f13_arg0, true )
end

Cac.IsBaseWeaponUnlockedMode = function ( f14_arg0, f14_arg1 )
	if Engine.IsAliensMode() then
		return Engine.IsUnlocked( f14_arg1, "CPWeapon", f14_arg0, true )
	else
		return Engine.IsUnlocked( f14_arg1, "weapon", f14_arg0, true )
	end
end

Cac.GetBaseWeaponRefFromLootID = function ( f15_arg0 )
	return Engine.TableLookup( Cac.GetFullPathForWeaponVariantTable( Engine.TableLookup( CSV.weaponLootMaster.file, CSV.weaponLootMaster.cols.index, f15_arg0, CSV.weaponLootMaster.cols.variantTable ) ), CSV.weaponLoot.cols.ref, Cac.GetLootRef( f15_arg0 ), CSV.weaponLoot.cols.baseWeapon )
end

Cac.GetWeaponClass = function ( f16_arg0 )
	local f16_local0 = Engine.TableLookup( CSV.weapons.file, CSV.weapons.cols.ref, f16_arg0, CSV.weapons.cols.menuClass )
	if CONDITIONS.IsThirdGameMode() and f16_local0 == "weapon_classic_s" then
		f16_local0 = "weapon_classic_p"
	end
	return f16_local0
end

Cac.GetWeaponClassAttachUnlockTablePrefix = function ( f17_arg0 )
	return Engine.TableLookup( CSV.weaponClasses.file, CSV.weaponClasses.cols.ref, f17_arg0, CSV.weaponClasses.cols.unlockTablePrefix )
end

Cac.GetEquippedWeaponClass = function ( f18_arg0, f18_arg1 )
	assert( f18_arg1 )
	assert( f18_arg0.weapon )
	local f18_local0 = f18_arg0.weapon:GetValue( f18_arg1 )
	assert( f18_local0 and #f18_local0 > 0 )
	local f18_local1 = Cac.GetWeaponClass( f18_local0 )
	assert( f18_local1 and #f18_local1 > 0 )
	return f18_local1
end

Cac.GetEquippedWeaponRef = function ( f19_arg0, f19_arg1 )
	assert( f19_arg1 )
	assert( f19_arg0.weapon )
	local f19_local0 = f19_arg0.lootItemID:GetValue( f19_arg1 )
	local f19_local1 = nil
	if f19_local0 > 0 then
		f19_local1 = Engine.TableLookup( CSV.weaponLootMaster.file, CSV.weaponLootMaster.cols.index, tostring( f19_local0 ), CSV.weaponLootMaster.cols.ref )
	else
		f19_local1 = f19_arg0.weapon:GetValue( f19_arg1 )
	end
	assert( f19_local1 and #f19_local1 > 0 )
	return f19_local1
end

Cac.GetWeaponClassIndex = function ( f20_arg0 )
	assert( type( f20_arg0 ) == "string" )
	assert( #f20_arg0 > 0 )
	for f20_local6, f20_local7 in ipairs( Cac.GetWeaponClassList() ) do
		for f20_local3, f20_local4 in ipairs( f20_local7 ) do
			if f20_local4.ref == f20_arg0 then
				return f20_local3
			end
		end
	end
	return nil
end

Cac.IsWeaponInRowList = function ( f21_arg0 )
	local f21_local0 = assert
	local f21_local1
	if type( f21_arg0 ) ~= "string" or #f21_arg0 <= 0 then
		f21_local1 = false
	else
		f21_local1 = true
	end
	f21_local0( f21_local1 )
	f21_local0 = Cac.GetWeaponClass( f21_arg0 )
	f21_local1 = assert
	local f21_local2
	if type( f21_local0 ) ~= "string" or #f21_local0 <= 0 then
		f21_local2 = false
	else
		f21_local2 = true
	end
	f21_local1( f21_local2 )
	f21_local1 = Cac.GetWeaponRowList()
	f21_local2 = f21_local1[f21_local0]
	if f21_local2 then
		f21_local2 = f21_local1[f21_local0][f21_arg0] ~= nil
	end
	if not f21_local2 then
		local f21_local3 = assert
		local f21_local4
		if f21_arg0 ~= "iw7_fists" and f21_arg0 ~= "none" then
			f21_local4 = false
		else
			f21_local4 = true
		end
		f21_local3( f21_local4 )
	end
	return f21_local2
end

Cac.GetCamoIndex = function ( f22_arg0, f22_arg1 )
	local f22_local0 = assert
	local f22_local1
	if type( f22_arg0 ) ~= "string" or #f22_arg0 <= 0 then
		f22_local1 = false
	else
		f22_local1 = true
	end
	f22_local0( f22_local1 )
	f22_local0 = assert
	if type( f22_arg1 ) ~= "string" or #f22_arg1 <= 0 then
		f22_local1 = false
	else
		f22_local1 = true
	end
	f22_local0( f22_local1 )
	f22_local0 = Cac.GetWeaponRowList()
	f22_local1 = Cac.GetWeaponClass( f22_arg0 )
	for f22_local5, f22_local6 in pairs( f22_local0[Cac.GetWeaponClass( f22_arg0 )][f22_arg0].camos ) do
		if f22_local6.ref == f22_arg1 then
			return f22_local5
		end
	end
	return false
end

Cac.GetReticleIndex = function ( f23_arg0 )
	local f23_local0 = assert
	local f23_local1
	if type( f23_arg0 ) ~= "string" or #f23_arg0 <= 0 then
		f23_local1 = false
	else
		f23_local1 = true
	end
	f23_local0( f23_local1 )
	if LOADOUT.GetReticleData( f23_arg0 ) then
		f23_local0 = LOADOUT.GetReticleData( f23_arg0 )
		return f23_local0.index
	else
		return false
	end
end

Cac.GetWeaponQuality = function ( f24_arg0 )
	local f24_local0 = assert
	local f24_local1
	if type( f24_arg0 ) ~= "number" or f24_arg0 < Cac.BaseLootID then
		f24_local1 = false
	else
		f24_local1 = true
	end
	f24_local0( f24_local1 )
	if f24_arg0 == Cac.BaseLootID then
		return Cac.LowestQuality
	else
		return Cac.GetLootWeaponQuality( Cac.GetLootRef( f24_arg0 ) )
	end
end

Cac.GetWeaponLootName = function ( f25_arg0, f25_arg1 )
	local f25_local0 = assert
	local f25_local1
	if type( f25_arg0 ) ~= "string" or #f25_arg0 <= 0 then
		f25_local1 = false
	else
		f25_local1 = true
	end
	f25_local0( f25_local1 )
	f25_local0 = assert
	if type( f25_arg1 ) ~= "number" or f25_arg1 < Cac.BaseLootID then
		f25_local1 = false
	else
		f25_local1 = true
	end
	f25_local0( f25_local1 )
	f25_local0 = LOADOUT.GetWeaponLootVariantData( f25_arg0 )
	if f25_arg1 == Cac.BaseLootID or not f25_local0 then
		return Cac.GetWeaponName( f25_arg0 )
	else
		return Engine.Localize( Engine.TableLookup( f25_local0.file, CSV.weaponLoot.cols.ref, Cac.GetLootRef( f25_arg1 ), CSV.weaponLoot.cols.displayName ) )
	end
end

Cac.GetWeaponLootDesc = function ( f26_arg0, f26_arg1 )
	local f26_local0 = assert
	local f26_local1
	if type( f26_arg0 ) ~= "string" or #f26_arg0 <= 0 then
		f26_local1 = false
	else
		f26_local1 = true
	end
	f26_local0( f26_local1 )
	f26_local0 = assert
	if type( f26_arg1 ) ~= "number" or f26_arg1 < Cac.BaseLootID then
		f26_local1 = false
	else
		f26_local1 = true
	end
	f26_local0( f26_local1 )
	if f26_arg1 == Cac.BaseLootID then
		return Cac.GetWeaponDesc( f26_arg0 )
	else
		f26_local1 = LOADOUT.GetWeaponLootOverrideData( Cac.GetLootRef( f26_arg1 ) )
		if f26_local1 and f26_local1.desc then
			return Engine.Localize( f26_local1.desc )
		else
			return Cac.GetWeaponDesc( f26_arg0 )
		end
	end
end

Cac.GetWeaponLootImage = function ( f27_arg0, f27_arg1 )
	local f27_local0 = assert
	local f27_local1
	if type( f27_arg0 ) ~= "string" or #f27_arg0 <= 0 then
		f27_local1 = false
	else
		f27_local1 = true
	end
	f27_local0( f27_local1 )
	f27_local0 = assert
	if type( f27_arg1 ) ~= "number" or f27_arg1 < Cac.BaseLootID then
		f27_local1 = false
	else
		f27_local1 = true
	end
	f27_local0( f27_local1 )
	f27_local0 = LOADOUT.GetWeaponLootVariantData( f27_arg0 )
	if f27_arg1 == Cac.BaseLootID or not f27_local0 then
		return Cac.GetWeaponImage( f27_arg0 )
	else
		local f27_local2 = Engine.TableLookup( f27_local0.file, CSV.weaponLoot.cols.ref, Cac.GetLootRef( f27_arg1 ), CSV.weaponLoot.cols.displayImage )
		if not f27_local2 or f27_local2 == "" then
			return Cac.GetWeaponImage( f27_arg0 )
		else
			return f27_local2
		end
	end
end

Cac.GetLootRef = function ( f28_arg0 )
	return Engine.TableLookup( CSV.weaponLootMaster.file, CSV.weaponLootMaster.cols.index, f28_arg0, CSV.weaponLootMaster.cols.ref )
end

Cac.GetWeaponClassName = function ( f29_arg0 )
	return Engine.Localize( Engine.TableLookup( CSV.weaponClasses.file, CSV.weaponClasses.cols.ref, f29_arg0, CSV.weaponClasses.cols.name ) )
end

Cac.GetWeaponClassPluralName = function ( f30_arg0 )
	return Engine.Localize( Engine.TableLookup( CSV.weaponClasses.file, CSV.weaponClasses.cols.ref, f30_arg0, CSV.weaponClasses.cols.pluralName ) )
end

Cac.GetWeaponName = function ( f31_arg0 )
	return Engine.Localize( Engine.TableLookup( CSV.weapons.file, CSV.weapons.cols.ref, f31_arg0, CSV.weapons.cols.name ) )
end

Cac.GetWeaponIndex = function ( f32_arg0 )
	return tonumber( Engine.TableLookup( CSV.weapons.file, CSV.weapons.cols.ref, f32_arg0, CSV.weapons.cols.index ) )
end

Cac.GetWeaponRefFromIndex = function ( f33_arg0 )
	return Engine.TableLookup( CSV.weapons.file, CSV.weapons.cols.index, f33_arg0, CSV.weapons.cols.ref )
end

Cac.GetWeaponDesc = function ( f34_arg0 )
	return Engine.Localize( Engine.TableLookup( CSV.weapons.file, CSV.weapons.cols.ref, f34_arg0, CSV.weapons.cols.desc ) )
end

Cac.GetWeaponImage = function ( f35_arg0 )
	return Engine.TableLookup( CSV.weapons.file, CSV.weapons.cols.ref, f35_arg0, CSV.weapons.cols.image )
end

Cac.GetWeaponSpecialFeatures = function ( f36_arg0 )
	if not Engine.IsMultiplayer() then
		return Engine.Localize( Engine.TableLookup( CSV.weapons.file, CSV.weapons.cols.ref, f36_arg0, CSV.weapons.cols.specialFeatures ) )
	else
		return ""
	end
end

Cac.GetWeaponFullImage = function ( f37_arg0 )
	return Engine.TableLookup( CSV.weapons.file, CSV.weapons.cols.ref, f37_arg0, CSV.weapons.cols.fullImage )
end

Cac.GetWeaponBWImage = function ( f38_arg0 )
	return Engine.TableLookup( CSV.weapons.file, CSV.weapons.cols.ref, f38_arg0, CSV.weapons.cols.BWImage )
end

Cac.GetIsEnergyWeapon = function ( f39_arg0 )
	if CSV.weapons.cols.isEnergyWeapon then
		return Engine.TableLookup( CSV.weapons.file, CSV.weapons.cols.ref, f39_arg0, CSV.weapons.cols.isEnergyWeapon ) == "TRUE"
	else
		return false
	end
end

Cac.GetWeaponStatAccuracy = function ( f40_arg0 )
	return tonumber( Engine.TableLookup( CSV.weapons.file, CSV.weapons.cols.ref, f40_arg0, CSV.weapons.cols.statAccuracy ) )
end

Cac.GetWeaponStatDamage = function ( f41_arg0 )
	return tonumber( Engine.TableLookup( CSV.weapons.file, CSV.weapons.cols.ref, f41_arg0, CSV.weapons.cols.statDamage ) )
end

Cac.GetWeaponStatRange = function ( f42_arg0 )
	return tonumber( Engine.TableLookup( CSV.weapons.file, CSV.weapons.cols.ref, f42_arg0, CSV.weapons.cols.statRange ) )
end

Cac.GetWeaponStatFireRate = function ( f43_arg0 )
	return tonumber( Engine.TableLookup( CSV.weapons.file, CSV.weapons.cols.ref, f43_arg0, CSV.weapons.cols.statFireRate ) )
end

Cac.GetWeaponStatMobility = function ( f44_arg0 )
	return tonumber( Engine.TableLookup( CSV.weapons.file, CSV.weapons.cols.ref, f44_arg0, CSV.weapons.cols.statMobility ) )
end

Cac.GetCamoName = function ( f45_arg0 )
	return Engine.TableLookup( CSV.camoTable.file, CSV.camoTable.cols.ref, f45_arg0, CSV.camoTable.cols.name )
end

Cac.GetCamoImage = function ( f46_arg0 )
	return Engine.TableLookup( CSV.camoTable.file, CSV.camoTable.cols.ref, f46_arg0, CSV.camoTable.cols.image )
end

Cac.GetCamoDesc = function ( f47_arg0 )
	return Engine.TableLookup( CSV.camoTable.file, CSV.camoTable.cols.ref, f47_arg0, CSV.camoTable.cols.desc )
end

Cac.GetCamoCategory = function ( f48_arg0 )
	return Engine.TableLookup( CSV.camoTable.file, CSV.camoTable.cols.ref, f48_arg0, CSV.camoTable.cols.category )
end

Cac.GetReticleName = function ( f49_arg0 )
	return Engine.TableLookup( CSV.reticles.file, CSV.reticles.cols.ref, f49_arg0, CSV.reticles.cols.name )
end

Cac.GetReticleImage = function ( f50_arg0 )
	return Engine.TableLookup( CSV.reticles.file, CSV.reticles.cols.ref, f50_arg0, CSV.reticles.cols.image )
end

Cac.GetReticleDesc = function ( f51_arg0 )
	return Engine.TableLookup( CSV.reticles.file, CSV.reticles.cols.ref, f51_arg0, CSV.reticles.cols.desc )
end

Cac.GetReticleType = function ( f52_arg0 )
	return Engine.TableLookup( CSV.reticles.file, CSV.reticles.cols.ref, f52_arg0, CSV.reticles.cols.type )
end

Cac.GetReticleCategory = function ( f53_arg0 )
	return Engine.TableLookup( CSV.reticles.file, CSV.reticles.cols.ref, f53_arg0, CSV.reticles.cols.category )
end

Cac.GetFireModeWithIndex = function ( f54_arg0, f54_arg1 )
	return Engine.TableLookup( CSV.weapons.file, CSV.weapons.cols.ref, f54_arg0, CSV.weapons.cols["fireMode" .. tostring( f54_arg1 )] )
end

Cac.GetFireModesForWeapon = function ( f55_arg0 )
	local f55_local0 = {}
	for f55_local1 = 1, 2, 1 do
		local f55_local4 = Cac.GetFireModeWithIndex( f55_arg0, f55_local1 )
		if f55_local4 ~= nil and #f55_local4 > 0 then
			local f55_local5 = DataSources.alwaysLoaded.MP.CAC.fireModes[f55_local4]
			assert( f55_local5 )
			table.insert( f55_local0, f55_local5 )
		end
	end
	return f55_local0
end

Cac.GetFireModeFieldValue = function ( f56_arg0, f56_arg1, f56_arg2, f56_arg3 )
	local f56_local0 = Cac.GetFireModesForWeapon( f56_arg0 )
	if f56_local0[f56_arg2 + 1] ~= nil then
		if f56_arg1 ~= "image" then
			return Engine.Localize( f56_local0[f56_arg2 + 1][f56_arg1]:GetValue( f56_arg3 ) )
		else
			return f56_local0[f56_arg2 + 1][f56_arg1]:GetValue( f56_arg3 )
		end
	else
		return nil
	end
end

Cac.IsLootWeaponOwned = function ( f57_arg0, f57_arg1 )
	if Engine.GetDvarBool( "ui_unlock_loot" ) and Engine.IsDevelopmentBuild() then
		return true
	else
		local f57_local0 = Cac.GetWeaponUniqueID( f57_arg0 )
		assert( f57_local0 )
		return Loot.IsOwned( f57_arg1, f57_local0 ) > 0
	end
end

Cac.GetWeaponUniqueID = function ( f58_arg0 )
	local f58_local0 = LOADOUT.GetWeaponLootData( f58_arg0 )
	return f58_local0.id
end

Cac.GetLootWeaponCost = function ( f59_arg0 )
	local f59_local0 = LOADOUT.GetWeaponLootData( f59_arg0 )
	return math.floor( tonumber( Engine.TableLookupByRow( CSV.weaponLootMaster.file, f59_local0.rowIndex, CSV.weaponLootMaster.cols.cost ) ) )
end

Cac.GetLootWeaponSalvageReceived = function ( f60_arg0 )
	local f60_local0 = LOADOUT.GetWeaponLootData( f60_arg0 )
	return math.floor( tonumber( Engine.TableLookupByRow( CSV.weaponLootMaster.file, f60_local0.rowIndex, CSV.weaponLootMaster.cols.salvageReturned ) ) )
end

Cac.GetLootWeaponQuality = function ( f61_arg0 )
	local f61_local0 = LOADOUT.GetWeaponLootData( f61_arg0 )
	local f61_local1 = tonumber( Engine.TableLookupByRow( CSV.weaponLootMaster.file, f61_local0.rowIndex, CSV.weaponLootMaster.cols.quality ) )
	if not f61_local1 then
		f61_local1 = Cac.LowestQuality + 1
	end
	return f61_local1
end

Cac.GetLootWeaponID = function ( f62_arg0 )
	return Engine.TableLookup( CSV.weaponLootMaster.file, CSV.weaponLootMaster.cols.ref, f62_arg0, CSV.weaponLootMaster.cols.index )
end

Cac.IsWeaponRefMk2 = function ( f63_arg0 )
	local f63_local0 = LOADOUT.GetWeaponLootData( f63_arg0 )
	if not f63_local0 then
		return false
	end
	local f63_local1 = Engine.TableLookupByRow( CSV.weaponLootMaster.file, f63_local0.rowIndex, CSV.weaponLootMaster.cols.mk2 )
	local f63_local2
	if not f63_local1 or f63_local1 ~= "Y" then
		f63_local2 = false
	else
		f63_local2 = true
	end
	return f63_local2
end

Cac.IsLootIDMk2 = function ( f64_arg0 )
	local f64_local0 = assert
	local f64_local1
	if type( f64_arg0 ) ~= "number" or f64_arg0 < Cac.BaseLootID then
		f64_local1 = false
	else
		f64_local1 = true
	end
	f64_local0( f64_local1 )
	if f64_arg0 == Cac.BaseLootID then
		return false
	else
		return Cac.IsWeaponRefMk2( Cac.GetLootRef( f64_arg0 ) )
	end
end

Cac.IsWeaponLootIDHoliday = function ( f65_arg0 )
	local f65_local0 = assert
	local f65_local1
	if type( f65_arg0 ) ~= "number" or f65_arg0 < Cac.BaseLootID then
		f65_local1 = false
	else
		f65_local1 = true
	end
	f65_local0( f65_local1 )
	if f65_arg0 == Cac.BaseLootID then
		return false
	end
	f65_local0 = Cac.GetLootRef( f65_arg0 )
	f65_local1 = Cac.IsWeaponLootRefHoliday( f65_local0 )
	if not f65_local1 then
		f65_local1 = Cac.IsWeaponLootRefSummerHoliday( f65_local0 )
		if not f65_local1 then
			f65_local1 = Cac.IsWeaponLootRefHalloweenHoliday( f65_local0 )
		end
	end
	return f65_local1
end

Cac.IsWeaponLootRefHoliday = function ( f66_arg0 )
	local f66_local0
	if f66_arg0 ~= "weapon_iw7_ripper_common_3" and f66_arg0 ~= "weapon_iw7_lmg03_rare_3" and f66_arg0 ~= "weapon_iw7_ar57_legendary_3" then
		f66_local0 = false
	else
		f66_local0 = true
	end
	return f66_local0
end

Cac.IsWeaponBaseRefHoliday = function ( f67_arg0, f67_arg1 )
	f67_arg1 = tonumber( f67_arg1 )
	if f67_arg1 < 0 then
		return false
	else
		return Cac.IsWeaponLootRefHoliday( Engine.TableLookup( Cac.GetFullPathForWeaponVariantTable( f67_arg0 ), CSV.weaponLoot.cols.index, f67_arg1, CSV.weaponLoot.cols.ref ) )
	end
end

Cac.IsWeaponLootRefSummerHoliday = function ( f68_arg0 )
	local f68_local0
	if f68_arg0 ~= "weapon_iw7_erad_legendary_4" and f68_arg0 ~= "weapon_iw7_ake_epic_4" and f68_arg0 ~= "weapon_iw7_sdflmg_legendary_4" and f68_arg0 ~= "weapon_iw7_mod2187_legendary_3" and f68_arg0 ~= "weapon_iw7_longshot_legendary_3" then
		f68_local0 = false
	else
		f68_local0 = true
	end
	return f68_local0
end

Cac.IsWeaponBaseRefSummerHoliday = function ( f69_arg0, f69_arg1 )
	f69_arg1 = tonumber( f69_arg1 )
	if f69_arg1 < 0 then
		return false
	else
		return Cac.IsWeaponLootRefSummerHoliday( Engine.TableLookup( Cac.GetFullPathForWeaponVariantTable( f69_arg0 ), CSV.weaponLoot.cols.index, f69_arg1, CSV.weaponLoot.cols.ref ) )
	end
end

Cac.IsWeaponLootRefHalloweenHoliday = function ( f70_arg0 )
	local f70_local0
	if f70_arg0 ~= "weapon_iw7_kbs_rare_3" and f70_arg0 ~= "weapon_iw7_ripper_rare_3" and f70_arg0 ~= "weapon_iw7_m4_rare_3" and f70_arg0 ~= "weapon_iw7_mod2187_legendary_5" and f70_arg0 ~= "weapon_iw7_mag_rare_3" and f70_arg0 ~= "weapon_iw7_minilmg_epic_3" then
		f70_local0 = false
	else
		f70_local0 = true
	end
	return f70_local0
end

Cac.IsWeaponBaseRefHalloweenHoliday = function ( f71_arg0, f71_arg1 )
	f71_arg1 = tonumber( f71_arg1 )
	if f71_arg1 < 0 then
		return false
	else
		return Cac.IsWeaponLootRefHalloweenHoliday( Engine.TableLookup( Cac.GetFullPathForWeaponVariantTable( f71_arg0 ), CSV.weaponLoot.cols.index, f71_arg1, CSV.weaponLoot.cols.ref ) )
	end
end

Cac.IsWeaponBaseRefMk2 = function ( f72_arg0, f72_arg1 )
	f72_arg1 = tonumber( f72_arg1 )
	if f72_arg1 < 0 then
		return false
	else
		return Cac.IsWeaponRefMk2( Engine.TableLookup( Cac.GetFullPathForWeaponVariantTable( f72_arg0 ), CSV.weaponLoot.cols.index, f72_arg1, CSV.weaponLoot.cols.ref ) )
	end
end

Cac.GetWeaponMark2CamoIndex = function ( f73_arg0 )
	local f73_local0 = 0
	if f73_arg0 == 1 then
		f73_local0 = 99
	elseif f73_arg0 == 2 then
		f73_local0 = 101
	elseif f73_arg0 == 3 then
		f73_local0 = 102
	elseif f73_arg0 == 4 then
		f73_local0 = 103
	end
	return f73_local0
end

Cac.GetPassivesForWeapon = function ( f74_arg0, f74_arg1 )
	local f74_local0 = {}
	local f74_local1 = Engine.TableLookup( CSV.weaponLootMaster.file, CSV.weaponLootMaster.cols.index, tostring( f74_arg1 ), CSV.weaponLootMaster.cols.variantTable )
	if f74_local1 and #f74_local1 > 0 then
		local f74_local2 = Cac.GetFullPathForWeaponVariantTable( f74_local1 )
		for f74_local3 = 1, 3, 1 do
			local f74_local6 = Engine.TableLookup( f74_local2, CSV.weaponLoot.cols.ref, f74_arg0, CSV.weaponLoot.cols["passive" .. f74_local3] )
			if #f74_local6 > 0 then
				local f74_local7 = DataSources.alwaysLoaded.MP.CAC.passives[f74_local6]
				assert( f74_local7 )
				table.insert( f74_local0, f74_local7 )
			end
		end
	end
	return f74_local0
end

Cac.GetFireModesForLootWeapon = function ( f75_arg0, f75_arg1 )
	local f75_local0 = {}
	local f75_local1 = Engine.TableLookup( CSV.weaponLootMaster.file, CSV.weaponLootMaster.cols.index, tostring( f75_arg1 ), CSV.weaponLootMaster.cols.variantTable )
	if f75_local1 and #f75_local1 > 0 then
		local f75_local2 = Cac.GetFullPathForWeaponVariantTable( f75_local1 )
		for f75_local3 = 1, 2, 1 do
			local f75_local6 = Engine.TableLookup( f75_local2, CSV.weaponLoot.cols.ref, f75_arg0, CSV.weaponLoot.cols["fireMode" .. f75_local3] )
			if #f75_local6 > 0 then
				local f75_local7 = DataSources.alwaysLoaded.MP.CAC.fireModes[f75_local6]
				assert( f75_local7 )
				table.insert( f75_local0, f75_local7 )
			end
		end
	end
	return f75_local0
end

Cac.GetWeaponPrestigeLevel = function ( f76_arg0, f76_arg1 )
	return DataSources.alwaysLoaded.playerData.MP.common.sharedProgression.weaponLevel[f76_arg0].prestige:GetValue( f76_arg1 )
end

Cac.GetWeaponLevelData = function ( f77_arg0, f77_arg1 )
	local f77_local0 = {}
	local f77_local1 = Cac.GetWeaponMaxRank( f77_arg0 )
	f77_local0.currentXP = DataSources.alwaysLoaded.playerData.MP.common.sharedProgression.weaponLevel[f77_arg0].mpXP:GetValue( f77_arg1 ) + DataSources.alwaysLoaded.playerData.MP.common.sharedProgression.weaponLevel[f77_arg0].cpXP:GetValue( f77_arg1 )
	f77_local0.prestigeLevel = Cac.GetWeaponPrestigeLevel( f77_arg0, f77_arg1 )
	local f77_local2 = Cac.GetWeaponRankForXP( f77_local0.currentXP )
	local f77_local3
	if f77_local2 < f77_local1 then
		f77_local3 = f77_local2 + 1
		if not f77_local3 then
		
		else
			f77_local0.currentLevel = f77_local2 + 1
			f77_local0.nextLevel = f77_local3 + 1
			f77_local0.nextLevelXP = Cac.GetWeaponRankMaxXP( f77_local2 )
			f77_local0.maxLevel = f77_local1
			local f77_local4 = nil
			if f77_local0.nextLevel and f77_local0.nextLevelXP > 0 and f77_local0.currentLevel <= f77_local1 + 1 and f77_local0.currentXP < f77_local0.nextLevelXP then
				local f77_local5 = Cac.GetWeaponRankMinXP( f77_local2 )
				f77_local4 = LUI.clamp( (f77_local0.currentXP - f77_local5) / (f77_local0.nextLevelXP - f77_local5), 0, 1 )
			else
				f77_local4 = 1
			end
			f77_local0.percentToNext = f77_local4
			f77_local0.nextLevelUnlock = nil
			if f77_local2 ~= f77_local3 then
				local f77_local5 = Cac.GetWeaponRankReward( f77_arg0, f77_local3 )
				if f77_local5 then
					f77_local0.nextLevelUnlock = {}
					local f77_local6 = Cac.GetAttachmentRef( f77_local5, f77_arg0 )
					f77_local0.nextLevelUnlock.name = Cac.GetAttachmentName( f77_local6 )
					f77_local0.nextLevelUnlock.image = Cac.GetAttachmentImage( f77_local6 )
				end
			end
			return f77_local0
		end
	end
	f77_local3 = f77_local2
end

Cac.ClearWeapon = function ( f78_arg0, f78_arg1 )
	f78_arg0.weapon:SetValue( f78_arg1, Engine.IsMultiplayer() and "iw7_fists" or "none" )
	if Engine.IsMultiplayer() then
		f78_arg0.variantID:SetValue( f78_arg1, Cac.BaseVariantID )
		f78_arg0.lootItemID:SetValue( f78_arg1, Cac.BaseLootID )
	end
end

Cac.GetWeaponTabDecorator = function ( f79_arg0, f79_arg1, f79_arg2, f79_arg3, f79_arg4 )
	return function ( f80_arg0, f80_arg1, f80_arg2 )
		assert( f80_arg2 )
		local f80_local0 = f80_arg1.weapons:Decorate( f79_arg2 )
		f80_local0.GetDefaultFocusIndex = function ( f81_arg0 )
			local f81_local0 = Cac.GetEquippedWeaponClass( f79_arg0, f80_arg2 )
			assert( f81_local0 and #f81_local0 > 0 )
			local f81_local1 = f80_arg1.ref:GetValue( f80_arg2 )
			assert( f81_local1 and #f81_local1 > 0 )
			local f81_local2 = f81_arg0:GetCountValue()
			if f81_local1 == f81_local0 and f81_local2 > 0 then
				local f81_local3 = f79_arg0.weapon:GetValue( f80_arg2 )
				assert( f81_local3 and #f81_local3 > 0 )
				for f81_local4 = 0, f81_local2 - 1, 1 do
					local f81_local7 = f81_arg0:GetDataSourceAtIndex( f81_local4, f80_arg2 )
					if f81_local3 == f81_local7.ref:GetValue( f80_arg2 ) then
						return f81_local4
					end
				end
			end
			return nil
		end
		
		return {
			name = f80_arg1.pluralName:Filter( "localized", Engine.Localize ),
			baseWeapons = f80_local0,
			ref = f80_arg1.ref,
			focusFunction = function ()
				WipeGlobalModelsAtPath( f79_arg3 )
				if not Engine.IsMultiplayer() then
					
				else
					
				end
			end
			
		}
	end
	
end

Cac.GetWeaponRankForXP = function ( f83_arg0 )
	for f83_local0 = Engine.TableGetRowCount( CSV.weaponRankTable.file ) - 1, 0, -1 do
		local f83_local3 = Engine.TableLookupByRow( CSV.weaponRankTable.file, f83_local0, CSV.weaponRankTable.cols.minXP )
		if f83_local3 and f83_local3 ~= "" and tonumber( f83_local3 ) <= f83_arg0 then
			return tonumber( Engine.TableLookupByRow( CSV.weaponRankTable.file, f83_local0, CSV.weaponRankTable.cols.rankId ) )
		end
	end
	return 0
end

Cac.GetWeaponMaxRank = function ( f84_arg0 )
	local f84_local0 = Engine.TableLookup( CSV.MPWeapons.file, CSV.MPWeapons.cols.ref, f84_arg0, CSV.MPWeapons.cols.maxRank )
	if not f84_local0 or f84_local0 == "" then
		return 0
	else
		return tonumber( f84_local0 )
	end
end

Cac.GetWeaponRankMinXP = function ( f85_arg0 )
	local f85_local0 = Engine.TableLookup( CSV.weaponRankTable.file, CSV.weaponRankTable.cols.rankId, f85_arg0, CSV.weaponRankTable.cols.minXP )
	if not f85_local0 or f85_local0 == "" then
		return 0
	else
		return tonumber( f85_local0 )
	end
end

Cac.GetWeaponRankMaxXP = function ( f86_arg0 )
	local f86_local0 = Engine.TableLookup( CSV.weaponRankTable.file, CSV.weaponRankTable.cols.rankId, f86_arg0, CSV.weaponRankTable.cols.maxXP )
	if not f86_local0 or f86_local0 == "" then
		return 0
	else
		return tonumber( f86_local0 )
	end
end

Cac.GetWeaponModelName = function ( f87_arg0, f87_arg1, f87_arg2, f87_arg3, f87_arg4 )
	if tonumber( f87_arg3 ) < 0 then
		return Engine.TableLookup( CSV.MPWeapons.file, CSV.MPWeapons.cols.ref, f87_arg1, CSV.MPWeapons.cols.asset )
	end
	local f87_local0 = CSV.weaponLoot.cols.asset
	if f87_arg4 and Engine.IsAliensMode() then
		f87_local0 = CSV.weaponLoot.cols.coopAsset
	end
	local f87_local1 = Cac.GetFullPathForWeaponVariantTable( f87_arg0 )
	if not Engine.TableExists( f87_local1 ) then
		assert( false, "Unable to find variantTable " .. f87_local1 .. " for weaponRef " .. f87_arg1 .. ", variantID " .. f87_arg3 )
		return Engine.TableLookup( CSV.MPWeapons.file, CSV.MPWeapons.cols.ref, f87_arg1, CSV.MPWeapons.cols.asset )
	end
	return Engine.TableLookup( f87_local1, CSV.MPWeapons.cols.index, f87_arg3, f87_local0 )
end

Cac.GetCompleteWeaponModelName = function ( f88_arg0, f88_arg1, f88_arg2, f88_arg3, f88_arg4, f88_arg5, f88_arg6 )
	local f88_local0 = Cac.GetWeaponModelName( f88_arg0, f88_arg1, f88_arg2, f88_arg3, true )
	local f88_local1 = f88_local0
	local f88_local2 = nil
	if Engine.IsAliensMode() then
		f88_local2 = Cac.GetWeaponModelName( f88_arg0, f88_arg1, f88_arg2, f88_arg3, false )
	end
	local f88_local3 = {}
	local f88_local4 = Engine.TableLookup( CSV.MPWeapons.file, CSV.MPWeapons.cols.ref, f88_arg0, CSV.MPWeapons.cols.defaultAttachments )
	if f88_local4 and #f88_local4 > 0 then
		f88_local3 = LUI.Split( f88_local4, " " )
	end
	local f88_local5 = {}
	if f88_arg5 and #f88_arg5 > 0 then
		for f88_local9, f88_local10 in ipairs( f88_arg5 ) do
			if f88_local10 ~= Cac.attachmentNoneValue then
				table.insert( f88_local5, f88_local10 )
			end
		end
	end
	for f88_local9, f88_local10 in ipairs( f88_local3 ) do
		local f88_local11 = true
		for f88_local12, f88_local13 in ipairs( f88_local5 ) do
			if f88_local10 == Cac.attachmentNoneValue or not Cac.AreAttachmentsCompatible( f88_local10, f88_local13 ) then
				f88_local11 = false
				break
			end
		end
		if f88_local11 then
			table.insert( f88_local5, f88_local10 )
		end
	end
	f88_local6 = nil
	if Cac.IsWeaponBaseRefHoliday( f88_arg0, f88_arg3 ) then
		f88_local6 = 89
	elseif Cac.IsWeaponBaseRefSummerHoliday( f88_arg0, f88_arg3 ) then
		f88_local6 = 230
	elseif Cac.IsWeaponBaseRefHalloweenHoliday( f88_arg0, f88_arg3 ) then
		f88_local6 = 242
	elseif f88_arg4 and f88_arg4 ~= Cac.CamoNoneValue then
		f88_local7 = Engine.TableLookup( CSV.camoTable.file, CSV.camoTable.cols.ref, f88_arg4, CSV.camoTable.cols.index )
		if f88_local7 and f88_local7 ~= "" then
			f88_local6 = f88_local7
		else
			DebugPrint( "ERROR: Cac.GetCompleteWeaponModelName - Unable to find index for camoRef: " .. f88_arg4 )
		end
	elseif Cac.IsWeaponBaseRefMk2( f88_arg0, f88_arg3 ) then
		f88_local6 = Cac.GetWeaponMark2CamoIndex( f88_arg2 )
	elseif f88_arg2 == 1 then
		f88_local6 = 24
	elseif f88_arg2 == 2 then
		f88_local6 = 19
	elseif f88_arg2 == 3 then
		f88_local6 = 18
	end
	if f88_local6 ~= nil then
		f88_local1 = f88_local1 .. "+camo" .. f88_local6
	end
	if f88_arg6 and f88_arg6 ~= Cac.CosmeticAttachmentNoneValue then
		f88_local1 = f88_local1 .. "+" .. f88_arg6
	end
	for f88_local10, f88_local11 in ipairs( f88_local5 ) do
		local f88_local15 = Cac.GetUniqueAttachmentRef( f88_local11, f88_arg0, f88_arg1, f88_local0, f88_local2, true )
		if f88_local15 and f88_local15 ~= "" and f88_local15 ~= Cac.attachmentNoneValue then
			f88_local1 = f88_local1 .. "+" .. f88_local15
		end
	end
	return f88_local1
end

Cac.ConvertWeaponMPToZM = function ( f89_arg0 )
	assert( f89_arg0 )
	return string.gsub( string.gsub( f89_arg0, "_mp([lr%_%+])", "_zm%1" ), "_mp$", "_zm" )
end

Cac.UpdateFrontendWeaponModel = function ( f90_arg0, f90_arg1, f90_arg2 )
	local f90_local0 = f90_arg1 or {}
	local f90_local1 = f90_arg2 or 0
	local f90_local2 = f90_local0.weaponRef
	if not f90_local2 then
		f90_local2 = f90_arg0.weapon:GetValue( f90_local1 )
	end
	local f90_local3 = f90_local0.variant
	if not f90_local3 then
		f90_local3 = f90_arg0.variantID:GetValue( f90_local1 )
	end
	local f90_local4 = f90_local0.lootID
	if not f90_local4 then
		f90_local4 = f90_arg0.lootItemID:GetValue( f90_local1 )
	end
	local f90_local5 = f90_local0.weaponQuality
	if not f90_local5 then
		f90_local5 = Cac.GetWeaponQuality( f90_local4 )
	end
	local f90_local6 = f90_local0.camo
	local f90_local7 = f90_local0.cosmeticAttachment
	if Engine.IsCoreMode() then
		if not f90_local6 then
			f90_local6 = f90_arg0.camo:GetValue( f90_local1 )
		end
		if not f90_local7 then
			f90_local7 = f90_arg0.cosmeticAttachment:GetValue( f90_local1 )
		end
	else
		if not f90_local6 then
			f90_local6 = f90_arg0.camoInfo.ref:GetValue( f90_local1 )
		end
		if not f90_local7 then
			f90_local7 = f90_arg0.cosmeticAttachmentInfo.ref:GetValue( f90_local1 )
		end
	end
	local f90_local8 = f90_local0.attachmentList
	if not f90_local8 then
		f90_local8 = {}
		local f90_local9 = f90_arg0.attachments.attachmentSlotOne:GetValue( f90_local1 )
		local f90_local10 = f90_arg0.attachments.attachmentSlotTwo:GetValue( f90_local1 )
		local f90_local11 = f90_arg0.attachments.attachmentSlotThree:GetValue( f90_local1 )
		local f90_local12 = f90_arg0.attachments.attachmentSlotFour:GetValue( f90_local1 )
		local f90_local13 = f90_arg0.attachments.attachmentSlotFive:GetValue( f90_local1 )
		local f90_local14 = f90_arg0.attachments.attachmentSlotSix:GetValue( f90_local1 )
		f90_local8 = f90_local9
	end
	local f90_local9 = f90_local2 == "iw7_fists"
	if not f90_local9 then
		local f90_local10 = Cac.GetCompleteWeaponModelName( f90_local2, f90_local2, f90_local5, f90_local3, f90_local6, f90_local8, f90_local7 )
		if Engine.IsAliensMode() then
			f90_local10 = Cac.ConvertWeaponMPToZM( f90_local10 )
		end
		Streaming.RequestWeaponViewModels( {
			f90_local10
		}, f90_local1 )
		FrontEndScene.SetWeaponModel( 0, f90_local10, true )
	end
	ClientWeapon.SetWeaponVisible( 0, not f90_local9 )
end

Cac.GetWeaponRankReward = function ( f91_arg0, f91_arg1 )
	local f91_local0 = Cac.GetAttachmentUnlockTable( f91_arg0 )
	local f91_local1 = Engine.TableGetRowCount( f91_local0 )
	if not f91_local1 or f91_local1 < 0 then
		return nil
	end
	for f91_local2 = 0, f91_local1 - 1, 1 do
		if tonumber( Engine.TableLookupByRow( f91_local0, f91_local2, CSV.attachmentUnlockTable.cols.unlockRank ) ) == f91_arg1 then
			local f91_local5 = Engine.TableLookupByRow( f91_local0, f91_local2, CSV.attachmentUnlockTable.cols.weaponAttachRef )
			if string.sub( f91_local5, 1, #f91_arg0 ) == f91_arg0 then
				return string.sub( f91_local5, #f91_arg0 + 2 )
			end
		end
	end
end

Cac.GetBaseWeaponUnlockRank = function ( f92_arg0 )
	if Engine.IsAliensMode() then
		return Engine.TableLookup( CSV.zomWeaponUnlockTable.file, CSV.zomWeaponUnlockTable.cols.ref, f92_arg0, CSV.zomWeaponUnlockTable.cols.unlockRank )
	else
		return Engine.TableLookup( CSV.weaponUnlockTable.file, CSV.weaponUnlockTable.cols.ref, f92_arg0, CSV.weaponUnlockTable.cols.unlockRank )
	end
end

Cac.GetLootWeaponLevel = function ( f93_arg0 )
	return Engine.TableLookup( CSV.weaponLootMaster.file, CSV.weaponLootMaster.cols.ref, f93_arg0, CSV.weaponLootMaster.cols.missionLevel )
end

Cac.GetMissionTeamWeaponLevel = function ( f94_arg0 )
	return Engine.TableLookup( CSV.weaponLootMaster.file, CSV.weaponLootMaster.cols.ref, f94_arg0, CSV.weaponLootMaster.cols.teamLevel )
end

Cac.GetWeaponCamoItemCardData = function ( f95_arg0 )
	local f95_local0, f95_local1 = UNLOCK.SplitCompoundUnlockRef( f95_arg0 )
	local f95_local2 = ""
	local f95_local3 = {
		{
			col = CSV.camoChallengeMap.cols.weaponRef,
			key = f95_local0
		},
		{
			col = CSV.camoChallengeMap.cols.camoRef,
			key = f95_local1
		}
	}
	local f95_local4 = Engine.TableLookupMultipleKeys( CSV.camoChallengeMap.file, f95_local3, CSV.camoChallengeMap.cols.challengeRef )
	if f95_local4 and f95_local4 ~= "" then
		f95_local2 = Challenge.GetLocalizedChallengeDesc( f95_local4, Engine.TableLookup( CSV.allChallengesTable.file, CSV.allChallengesTable.cols.ref, f95_local4, CSV.allChallengesTable.cols.tiers.targetStart + CSV.allChallengesTable.numTierCols * tonumber( Engine.TableLookupMultipleKeys( CSV.camoChallengeMap.file, f95_local3, CSV.camoChallengeMap.cols.challengeTier ) ) ) )
	end
	return {
		name = Engine.Localize( Cac.GetCamoName( f95_local1 ) ),
		image = Cac.GetCamoImage( f95_local1 ),
		desc = f95_local2,
		weaponName = Cac.GetWeaponName( f95_local0 ),
		weaponImage = Cac.GetWeaponImage( f95_local0 ),
		title = Engine.Localize( "LUA_MENU_MP_ITEM_CARD_TITLE_CAMO" )
	}
end

Cac.GetProgressionWeaponItemCardData = function ( f96_arg0 )
	local f96_local0 = CSV.ReadRow( CSV.weapons, Engine.TableLookupGetRowNum( CSV.weapons.file, CSV.weapons.cols.ref, f96_arg0 ) )
	local f96_local1 = Cac.GetBaseWeaponUnlockRank( f96_arg0 )
	return {
		class = Cac.GetWeaponClass( f96_arg0 ),
		name = Cac.GetWeaponName( f96_arg0 ),
		image = Cac.GetWeaponImage( f96_arg0 ),
		desc = Cac.GetWeaponDesc( f96_arg0 ),
		rank = Rank.GetRankDisplay( f96_local1 ),
		rankIcon = Rank.GetRankIcon( f96_local1, 0 ),
		rankName = Rank.GetShortRank( f96_local1 ),
		title = Cac.GetWeaponClassName( Cac.GetWeaponClass( f96_arg0 ) )
	}
end

Cac.HasWeaponItemBeenDrafted = function ( f97_arg0, f97_arg1, f97_arg2 )
	return not Engine.IsXUIDInvalid( LoadoutDrafting.GetPlayerXUIDWithWeapon( f97_arg0, Cac.GetWeaponIndex( f97_arg1 ), f97_arg2 ) )
end

Cac.GetWeaponStatsTable = function ( f98_arg0 )
	local f98_local0 = {}
	for f98_local1 = 0, Engine.TableGetRowCount( CSV.MPWeapons.file ), 1 do
		local f98_local4 = CSV.ReadRow( CSV.MPWeapons, f98_local1 )
		if f98_local4 ~= nil and tonumber( f98_local4.displayOrder ) ~= nil and 0 < tonumber( f98_local4.displayOrder ) then
			local f98_local5 = {
				ref = f98_local4.ref,
				name = Engine.Localize( f98_local4.name ),
				image = f98_local4.image,
				deaths = Engine.GetPlayerDataEx( f98_arg0, CoD.StatsGroup.Ranked, "weaponStats", f98_local4.ref, "deaths" ),
				headShots = Engine.GetPlayerDataEx( f98_arg0, CoD.StatsGroup.Ranked, "weaponStats", f98_local4.ref, "headShots" ),
				hits = Engine.GetPlayerDataEx( f98_arg0, CoD.StatsGroup.Ranked, "weaponStats", f98_local4.ref, "hits" ),
				kills = Engine.GetPlayerDataEx( f98_arg0, CoD.StatsGroup.Ranked, "weaponStats", f98_local4.ref, "kills" ),
				shots = Engine.GetPlayerDataEx( f98_arg0, CoD.StatsGroup.Ranked, "weaponStats", f98_local4.ref, "shots" ),
				kdr = f98_local5.kills / (f98_local5.deaths and f98_local5.deaths or 1),
				accuracy = f98_local5.hits / (f98_local5.shots and f98_local5.shots or 1)
			}
			table.insert( f98_local0, f98_local5 )
		end
	end
	return f98_local0
end

Cac.GetWeaponMk2Bonus = function ( f99_arg0, f99_arg1 )
	if not Engine.IsCoreMode() then
		return Engine.GetDvarFloat( "mk2_bonus" )
	else
		local f99_local0 = Engine.TableLookup( CSV.weapons.file, CSV.weapons.cols.ref, f99_arg1, CSV.weapons.cols.class ) .. "_mk_ii_bonus"
		local f99_local1 = Engine.TableLookupGetRowNum( CSV.prestigeExtrasUnlocks.file, CSV.prestigeExtrasUnlocks.cols.ref, f99_local0 )
		if f99_local1 and f99_local1 > 0 and Engine.IsUnlocked( f99_arg0, "prestigeExtras", f99_local0, true ) then
			return Engine.GetDvarFloat( "mk2_extra_bonus" )
		else
			return Engine.GetDvarFloat( "mk2_bonus" )
		end
	end
end

Cac.GetWeaponMk2BonusString = function ( f100_arg0, f100_arg1 )
	return Engine.Localize( "LUA_MENU_MP_MK2_BONUS_PARAM", math.floor( Cac.GetWeaponMk2Bonus( f100_arg0, f100_arg1 ) * 100 ) )
end

Cac.SetupBaseWeaponNewNotificationHandlers = function ( f101_arg0, f101_arg1, f101_arg2 )
	assert( f101_arg2 )
	f101_arg0:SubscribeToModelThroughElement( f101_arg0, "ref", function ()
		local f102_local0 = f101_arg0:GetDataSource()
		f102_local0 = f102_local0.ref:GetValue( f101_arg1 )
		f101_arg0.lootNew = LOOT.AreAnyLastLootItemsBaseWeapon( f101_arg1, f102_local0 )
		if Engine.IsCoreMode() then
			f101_arg0.progressionNew = Rewards.IsNew( f101_arg1, "weapon", Engine.TableLookupGetRowNum( CSV.weaponUnlockTable.file, CSV.weaponUnlockTable.cols.ref, f102_local0 ) )
		end
		if f101_arg0.progressionNew or f101_arg0.lootNew then
			f101_arg2:SetAlpha( 1, 0 )
		else
			f101_arg2:SetAlpha( 0, 0 )
		end
	end )
	f101_arg0:addEventHandler( "update_loot_item_new", function ( f103_arg0, f103_arg1 )
		if f103_arg0 and f103_arg0:GetDataSource() then
			local f103_local0 = f103_arg0:GetDataSource()
			if f103_local0.ref then
				f103_local0 = f103_arg0:GetDataSource()
				f103_local0 = f103_local0.ref:GetValue( f101_arg1 )
				if f103_arg1.baseWeapon == f103_local0 and not f103_arg0.progressionNew then
					f103_arg0.lootNew = LOOT.AreAnyLastLootItemsBaseWeapon( f101_arg1, f103_local0 )
					if f103_arg0.lootNew then
						f101_arg2:SetAlpha( 1, 0 )
					else
						f101_arg2:SetAlpha( 0, 0 )
					end
				end
			end
		end
	end )
	f101_arg0:addEventHandler( "lose_focus", function ( f104_arg0, f104_arg1 )
		local f104_local0 = LUI.FlowManager.GetScopedData( f104_arg0 )
		local f104_local1 = f104_local0.currentBaseWeapon
		if not f104_local1 then
			return 
		end
		local f104_local2 = Engine.TableLookupGetRowNum( CSV.weaponUnlockTable.file, CSV.weaponUnlockTable.cols.ref, f104_local1 )
		if Rewards.IsNew( f101_arg1, "weapon", f104_local2 ) then
			Rewards.ClearNew( f101_arg1, "weapon", f104_local2 )
			f104_arg0.progressionNew = false
			f104_arg0.lootNew = LOOT.AreAnyLastLootItemsBaseWeapon( f101_arg1, f104_local1 )
			if f104_arg0.lootNew then
				f101_arg2:SetAlpha( 1, 0 )
			else
				f101_arg2:SetAlpha( 0, 0 )
			end
			f104_arg0:dispatchEventToCurrentMenu( {
				name = "update_progression_item_new",
				class = Cac.GetWeaponClass( f104_local1 )
			} )
		end
		local f104_local3 = f104_local0.currentLootItemID
		if Loot.IsNew( f101_arg1, f104_local3 ) and f104_local3 ~= Cac.LootIDNoneValue then
			Loot.ClearNew( f101_arg1, f104_local3 )
			f104_arg0:dispatchEventToCurrentMenu( {
				name = "update_loot_item_new",
				class = Cac.GetWeaponClassFromLootID( f104_local3 ),
				lootItemID = f104_local3,
				baseWeapon = Cac.GetBaseWeaponRefFromLootID( f104_local3 )
			} )
		end
	end )
	f101_arg0:addEventHandler( "gain_focus", function ( f105_arg0, f105_arg1 )
		local f105_local0 = LUI.FlowManager.GetScopedData( f105_arg0 )
		local f105_local1 = f101_arg0:GetDataSource()
		f105_local0.currentBaseWeapon = f105_local1.ref:GetValue( f101_arg1 )
	end )
end

