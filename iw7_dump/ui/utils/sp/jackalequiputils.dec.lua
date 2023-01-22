Cac = Cac or {}
Cac.jackalEquipNone = "none"
Cac.jackalEquipSlots = 4
Cac.JackalEquipSlot = {
	primary = 0,
	secondary = 1,
	upgrade = 2,
	decal = 3
}
Cac.JackalWeaponType = {
	primary = "primary",
	secondary = "secondary"
}
Cac.IsJackalEquipInUse = function ( f1_arg0 )
	return f1_arg0 ~= Cac.jackalEquipNone
end

Cac.GetJackalWeaponName = function ( f2_arg0 )
	return Engine.TableLookup( CSV.jackalWeapons.file, CSV.jackalWeapons.cols.ref, f2_arg0, CSV.jackalWeapons.cols.name )
end

Cac.GetJackalWeaponDesc = function ( f3_arg0 )
	return Engine.TableLookup( CSV.jackalWeapons.file, CSV.jackalWeapons.cols.ref, f3_arg0, CSV.jackalWeapons.cols.desc )
end

Cac.GetJackalWeaponImage = function ( f4_arg0 )
	return Engine.TableLookup( CSV.jackalWeapons.file, CSV.jackalWeapons.cols.ref, f4_arg0, CSV.jackalWeapons.cols.image )
end

Cac.GetJackalWeaponImageLarge = function ( f5_arg0 )
	return Engine.TableLookup( CSV.jackalWeapons.file, CSV.jackalWeapons.cols.ref, f5_arg0, CSV.jackalWeapons.cols.fullImage )
end

Cac.GetJackalWeaponType = function ( f6_arg0 )
	return Engine.TableLookup( CSV.jackalWeapons.file, CSV.jackalWeapons.cols.ref, f6_arg0, CSV.jackalWeapons.cols.type )
end

Cac.GetJackalWeaponIndex = function ( f7_arg0 )
	return Engine.TableLookup( CSV.jackalWeapons.file, CSV.jackalWeapons.cols.ref, f7_arg0, CSV.jackalWeapons.cols.index )
end

Cac.GetJackalWeaponNameFromIndex = function ( f8_arg0 )
	return Engine.TableLookup( CSV.jackalWeapons.file, CSV.jackalWeapons.cols.index, f8_arg0, CSV.jackalWeapons.cols.name )
end

Cac.GetJackalUpgradeName = function ( f9_arg0 )
	return Engine.TableLookup( CSV.jackalUpgrades.file, CSV.jackalUpgrades.cols.ref, f9_arg0, CSV.jackalUpgrades.cols.name )
end

Cac.GetJackalUpgradeDesc = function ( f10_arg0 )
	return Engine.TableLookup( CSV.jackalUpgrades.file, CSV.jackalUpgrades.cols.ref, f10_arg0, CSV.jackalUpgrades.cols.desc )
end

Cac.GetJackalUpgradeImage = function ( f11_arg0 )
	return Engine.TableLookup( CSV.jackalUpgrades.file, CSV.jackalUpgrades.cols.ref, f11_arg0, CSV.jackalUpgrades.cols.image )
end

Cac.GetJackalUpgradeImageLarge = function ( f12_arg0 )
	return Engine.TableLookup( CSV.jackalUpgrades.file, CSV.jackalUpgrades.cols.ref, f12_arg0, CSV.jackalUpgrades.cols.fullImage )
end

Cac.GetJackalUpgradeIndex = function ( f13_arg0 )
	return Engine.TableLookup( CSV.jackalUpgrades.file, CSV.jackalUpgrades.cols.ref, f13_arg0, CSV.jackalUpgrades.cols.index )
end

Cac.GetJackalDecalName = function ( f14_arg0 )
	return Engine.TableLookup( CSV.jackalDecals.file, CSV.jackalDecals.cols.ref, f14_arg0, CSV.jackalDecals.cols.name )
end

Cac.GetJackalDecalDesc = function ( f15_arg0 )
	return Engine.TableLookup( CSV.jackalDecals.file, CSV.jackalDecals.cols.ref, f15_arg0, CSV.jackalDecals.cols.desc )
end

Cac.GetJackalDecalImage = function ( f16_arg0 )
	return Engine.TableLookup( CSV.jackalDecals.file, CSV.jackalDecals.cols.ref, f16_arg0, CSV.jackalDecals.cols.image )
end

Cac.GetJackalDecalImageLarge = function ( f17_arg0 )
	return Engine.TableLookup( CSV.jackalDecals.file, CSV.jackalDecals.cols.ref, f17_arg0, CSV.jackalDecals.cols.fullImage )
end

Cac.GetJackalDecalIndex = function ( f18_arg0 )
	return Engine.TableLookup( CSV.jackalDecals.file, CSV.jackalDecals.cols.ref, f18_arg0, CSV.jackalDecals.cols.index )
end

