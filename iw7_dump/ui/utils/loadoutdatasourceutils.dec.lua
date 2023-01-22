LOADOUT = {
	weaponLootVariants = {},
	weaponLoot = {},
	weaponLootOverrideData = {},
	reticleRowList = {},
	DefaultClassCount = 5
}
local f0_local0 = "defaultClasses"
local f0_local1 = 2
local f0_local2 = 6
local f0_local3 = 2
local f0_local4 = 3
local f0_local5 = 3
local f0_local6 = 6
local f0_local7 = 5
local f0_local8 = 3
Cac.scannedSPItemStates = {
	LOCKED = "locked",
	SCANNED = "scanned",
	UNLOCKED = "unlocked"
}
LOADOUT.WipeLoadoutDataTables = function ()
	LOADOUT.weaponLootVariants = {}
	LOADOUT.weaponLoot = {}
	LOADOUT.weaponLootOverrideData = {}
	LOADOUT.reticleRowList = {}
end

Cac.playerDataDataSourceModelPath = "frontEnd.MP.CAC.loadout"
LOADOUT.BuildWeaponClassList = function ( f2_arg0 )
	local f2_local0 = {}
	for f2_local1 = 1, f2_arg0, 1 do
		f2_local0[f2_local1] = {}
	end
	local f2_local1 = CSV.weaponClasses.file
	for f2_local2 = 0, Engine.TableGetRowCount( f2_local1 ), 1 do
		local f2_local5 = CSV.ReadRow( CSV.weaponClasses, f2_local2 )
		local f2_local6 = f2_local5.ref
		local f2_local7 = f2_local5.slot
		local f2_local8
		if f2_local6 == "" or f2_local7 == "" or f2_local5.showInMenus ~= "1" then
			f2_local8 = false
		else
			f2_local8 = true
		end
		if f2_local8 then
			if Engine.IsAliensMode() and Engine.TableLookupByRow( f2_local1, f2_local2, CSV.weaponClasses.cols.showInCP ) ~= "1" then
				f2_local8 = false
			else
				f2_local8 = true
			end
		end
		if f2_local8 then
			local f2_local9 = f2_local0[tonumber( f2_local7 )]
			assert( f2_local9 )
			table.insert( f2_local9, {
				ref = f2_local6,
				name = f2_local5.name,
				pluralName = f2_local5.pluralName,
				image = f2_local5.image,
				index = CountTableKeys( f2_local9 ),
				slot = f2_local5.slot,
				showInArmory = f2_local5.showInArmory
			} )
		end
	end
	for f2_local10, f2_local5 in ipairs( f2_local0 ) do
		table.sort( f2_local5, function ( f3_arg0, f3_arg1 )
			return f3_arg0.index < f3_arg1.index
		end )
	end
	return f2_local0
end

LOADOUT.GetWeaponClassDataBySlotAndRef = function ( f4_arg0, f4_arg1 )
	local f4_local0 = Cac.GetWeaponClassList()
	f4_local0 = f4_local0[f4_arg0 + 1]
	for f4_local1 = 1, #f4_local0, 1 do
		if f4_local0[f4_local1].ref == f4_arg1 then
			return f4_local0[f4_local1]
		end
	end
end

LOADOUT.BuildWeaponRowList = function ()
	local f5_local0 = {}
	local f5_local1 = CSV.weapons
	local f5_local2 = f5_local1.file
	for f5_local3 = 1, Engine.TableGetRowCount( f5_local2 ), 1 do
		local f5_local6 = Engine.TableLookupByRow( f5_local2, f5_local3, f5_local1.cols.menuClass )
		if Engine.IsAliensMode() and f5_local6 == "weapon_classic_s" then
			f5_local6 = "weapon_classic_p"
		end
		local f5_local7 = Engine.TableLookupByRow( f5_local2, f5_local3, f5_local1.cols.ref )
		if f5_local1.cols.displayOrder then
			local f5_local8 = Engine.TableLookupByRow( f5_local2, f5_local3, f5_local1.cols.displayOrder )
		end
		local f5_local8
		if Engine.IsAliensMode() then
			f5_local8 = f5_local1.cols.cpDisplayOrder and Engine.TableLookupByRow( f5_local2, f5_local3, f5_local1.cols.cpDisplayOrder )
		end
		f5_local8 = tonumber( f5_local8 ) or -1
		local f5_local9
		if f5_local6 == "" or f5_local7 == "" then
			f5_local9 = false
		else
			f5_local9 = true
		end
		if f5_local9 then
			if Engine.IsAliensMode() and Engine.TableLookupByRow( f5_local2, f5_local3, f5_local1.cols.showInCP ) ~= "1" then
				f5_local9 = false
			else
				f5_local9 = true
			end
		end
		if f5_local9 then
			f5_local0[f5_local6] = f5_local0[f5_local6] or {}
			local f5_local10 = {}
			if f5_local1.cols.attachFirst then
				for f5_local11 = f5_local1.cols.attachFirst, f5_local1.cols.attachLast, 1 do
					local f5_local14 = Engine.TableLookupByRow( f5_local2, f5_local3, f5_local11 )
					if f5_local14 and f5_local14 ~= "" and f5_local14 ~= "none" then
						table.insert( f5_local10, Cac.GetAttachmentRef( f5_local14, f5_local7 ) )
					end
				end
			end
			f5_local0[f5_local6][f5_local7] = {
				row = f5_local3,
				displayOrder = f5_local8,
				allowableAttachments = f5_local10,
				ref = f5_local7,
				stats = {
					accuracy = Cac.GetWeaponStatAccuracy( f5_local7 ),
					damage = Cac.GetWeaponStatDamage( f5_local7 ),
					range = Cac.GetWeaponStatRange( f5_local7 ),
					fireRate = Cac.GetWeaponStatFireRate( f5_local7 ),
					mobility = Cac.GetWeaponStatMobility( f5_local7 )
				}
			}
		end
	end
	return f5_local0
end

LOADOUT.InitWeaponVariant = function ( f6_arg0 )
	for f6_local0 = 0, Engine.TableGetRowCount( f6_arg0 ), 1 do
		local f6_local3 = Engine.TableLookupByRow( f6_arg0, f6_local0, CSV.weaponLoot.cols.baseWeapon )
		if 0 < #f6_local3 then
			local f6_local4 = Engine.TableLookupByRow( f6_arg0, f6_local0, CSV.weaponLoot.cols.ref )
			if 0 < #Engine.TableLookup( CSV.weaponLootMaster.file, CSV.weaponLootMaster.cols.ref, f6_local4, CSV.weaponLootMaster.cols.index ) and Engine.TableLookup( CSV.weaponLootMaster.file, CSV.weaponLootMaster.cols.ref, f6_local4, CSV.weaponLootMaster.cols.shippable ) == "Y" then
				if not LOADOUT.weaponLootVariants[f6_local3] then
					LOADOUT.weaponLootVariants[f6_local3] = {
						file = f6_arg0,
						rows = {}
					}
				end
				table.insert( LOADOUT.weaponLootVariants[f6_local3].rows, f6_local0 )
			end
		end
	end
end

LOADOUT.InitWeaponVariantsList = function ()
	for f7_local3, f7_local4 in ipairs( LOOT.ListWeaponCSVFiles() ) do
		LOADOUT.InitWeaponVariant( f7_local4 )
	end
end

LOADOUT.GetWeaponLootVariantData = function ( f8_arg0 )
	if not LOADOUT.weaponLootVariants[f8_arg0] and #Engine.TableLookup( CSV.weaponLootMaster.file, CSV.weaponLootMaster.cols.variantTable, f8_arg0, CSV.weaponLootMaster.cols.index ) > 0 then
		LOADOUT.InitWeaponVariant( Cac.GetFullPathForWeaponVariantTable( f8_arg0 ) )
	end
	return LOADOUT.weaponLootVariants[f8_arg0]
end

LOADOUT.GetWeaponLootOverrideData = function ( f9_arg0 )
	return LOADOUT.weaponLootOverrideData[f9_arg0]
end

LOADOUT.InitWeaponLootOverrideData = function ()
	for f10_local10, f10_local11 in pairs( LOADOUT.weaponLootVariants ) do
		for f10_local6, f10_local7 in ipairs( f10_local11.rows ) do
			local f10_local9 = CSV.ReadRow( {
				file = f10_local11.file,
				cols = CSV.weaponLoot.cols
			}, f10_local7 )
			local f10_local4 = {}
			local f10_local3 = {}
			local f10_local5 = nil
			if f10_local9.blockedAttachments and f10_local9.blockedAttachments ~= "" then
				f10_local3 = LUI.Split( f10_local9.blockedAttachments, "+" )
			end
			if f10_local9.blockedAttachmentCategories and f10_local9.blockedAttachmentCategories ~= "" then
				f10_local4 = LUI.Split( f10_local9.blockedAttachmentCategories, "+" )
			end
			if f10_local9.desc and f10_local9.desc ~= "" then
				f10_local5 = f10_local9.desc
			end
			LOADOUT.weaponLootOverrideData[f10_local9.ref] = {
				blockedAttachmentCategories = f10_local4,
				blockedAttachments = f10_local3,
				desc = f10_local5
			}
		end
	end
end

LOADOUT.GetWeaponLootData = function ( f11_arg0 )
	return LOADOUT.weaponLoot[f11_arg0]
end

LOADOUT.InitWeaponLootMasterIDs = function ()
	local f12_local0 = CSV.weaponLootMaster
	for f12_local1 = 0, Engine.TableGetRowCount( f12_local0.file ), 1 do
		local f12_local4 = CSV.ReadRow( f12_local0, f12_local1 )
		if #f12_local4.index == 0 then
			return 
		end
		local f12_local5 = f12_local4.ref
		local f12_local6 = tonumber( f12_local4.index )
		assert( f12_local6 )
		LOADOUT.weaponLoot[f12_local5] = {
			id = f12_local6,
			rowIndex = f12_local1
		}
	end
end

local f0_local9 = function ( f13_arg0, f13_arg1 )
	if not f13_arg0.camos then
		f13_arg0.camos = {}
	end
	table.insert( f13_arg0.camos, f13_arg1 )
end

LOADOUT.InitCamoList = function ()
	local f14_local0 = CSV.menuCamos.file
	local f14_local1 = CSV.camoTable.file
	local f14_local2 = {}
	for f14_local3 = 0, Engine.TableGetRowCount( f14_local1 ), 1 do
		local f14_local6 = CSV.ReadRow( CSV.camoTable, f14_local3 )
		local f14_local7 = tonumber( f14_local6.index )
		if f14_local7 and f14_local6.showInMenus == "1" then
			f14_local2[f14_local7 + 1] = {
				index = f14_local7,
				ref = f14_local6.ref,
				name = f14_local6.name,
				image = f14_local6.image,
				category = f14_local6.category,
				unlockType = f14_local6.unlockType,
				menuOrder = f14_local6.menuOrder,
				hideIfLocked = f14_local6.hideIfLocked == "1"
			}
		end
	end
	local f14_local3 = Cac.GetWeaponRowList()
	for f14_local4 = 0, Engine.TableGetRowCount( f14_local0 ), 1 do
		local f14_local7 = Engine.TableLookupByRow( f14_local0, f14_local4, CSV.menuCamos.cols.weaponRef )
		local f14_local9 = tonumber( Engine.TableLookupByRow( f14_local0, f14_local4, CSV.menuCamos.cols.index ) )
		if f14_local9 and f14_local2[f14_local9 + 1] then
			if f14_local7 == "any" then
				for f14_local16, f14_local17 in pairs( f14_local3 ) do
					for f14_local13, f14_local14 in pairs( f14_local17 ) do
						f0_local9( f14_local14, f14_local2[f14_local9 + 1] )
					end
				end
			end
			if f14_local7 then
				for f14_local16, f14_local17 in pairs( f14_local3 ) do
					if f14_local17[f14_local7] then
						f0_local9( f14_local17[f14_local7], f14_local2[f14_local9 + 1] )
					end
				end
			end
		end
	end
end

LOADOUT.GetReticleData = function ( f15_arg0 )
	return LOADOUT.reticleRowList[f15_arg0]
end

LOADOUT.InitReticleDataSources = function ( f16_arg0 )
	local f16_local0 = CSV.reticles.file
	for f16_local1 = 0, Engine.TableGetRowCount( f16_local0 ), 1 do
		local f16_local4 = CSV.ReadRow( CSV.reticles, f16_local1 )
		if f16_local4.showInMenus == "1" and f16_local4.ref then
			LOADOUT.reticleRowList[f16_local4.ref] = {
				index = tonumber( f16_local4.index ),
				ref = f16_local4.ref,
				image = f16_local4.image,
				desc = f16_local4.desc,
				name = f16_local4.name,
				type = f16_local4.type,
				category = f16_local4.category,
				menuOrder = f16_local4.menuOrder,
				unlockType = f16_local4.unlockType,
				hideIfLocked = f16_local4.hideIfLocked == "1"
			}
			LOADOUT.reticleRowList[f16_local4.ref].index = CountTableKeys( LOADOUT.reticleRowList ) - 1
		end
	end
	f16_arg0.reticles = LUI.DataSourceFromList.new( CountTableKeys( LOADOUT.reticleRowList ) )
	local f16_local1 = f16_arg0.reticles
	f16_local1.MakeDataSourceAtIndex = function ( f17_arg0, f17_arg1, f17_arg2 )
		return f16_local1["reticle" .. f17_arg1]
	end
	
	for f16_local4, f16_local7 in pairs( LOADOUT.reticleRowList ) do
		local f16_local8 = "reticle" .. f16_local7.index
		if not f16_local1[f16_local8] then
			f16_local1[f16_local8] = {}
		end
		local f16_local6 = f16_local1[f16_local8]
		f16_local6.ref = f16_arg0:GetDataSourceForSubmodel( "reticle." .. f16_local7.ref .. ".ref", f16_local7.ref )
		f16_local6.desc = f16_arg0:GetDataSourceForSubmodel( "reticle." .. f16_local7.ref .. ".desc", f16_local7.desc )
		f16_local6.name = f16_arg0:GetDataSourceForSubmodel( "reticle." .. f16_local7.ref .. ".name", f16_local7.name )
		f16_local6.image = f16_arg0:GetDataSourceForSubmodel( "reticle." .. f16_local7.ref .. ".image", f16_local7.image )
	end
end

LOADOUT.GetOpticType = function ( f18_arg0 )
	return Engine.TableLookup( CSV.opticTypeMap.file, CSV.opticTypeMap.cols.optic, f18_arg0, CSV.opticTypeMap.cols.type )
end

LOADOUT.GetAvailableReticleData = function ( f19_arg0 )
	local f19_local0 = LOADOUT.reticleRowList
	assert( type( f19_local0 ) == "table" )
	local f19_local1 = {}
	local f19_local2 = LOADOUT.GetOpticType( f19_arg0 )
	for f19_local6, f19_local7 in pairs( f19_local0 ) do
		if f19_local7.type == "" or f19_local2 == f19_local7.type then
			f19_local1[f19_local7.index + 1] = f19_local7
		end
	end
	return f19_local1
end

LOADOUT.GetAvailableCosmeticAttachmentData = function ( f20_arg0 )
	local f20_local0 = {}
	for f20_local1 = 0, Engine.TableGetRowCount( CSV.cosmeticAttachmentTable.file ), 1 do
		local f20_local4 = CSV.ReadRow( CSV.cosmeticAttachmentTable, f20_local1 )
		if f20_local4.ref and f20_local4.ref ~= "" and f20_local4.unlockType ~= "hide" then
			f20_local4.hideIfLocked = f20_local4.hideIfLockedString == "1"
			table.insert( f20_local0, f20_local4 )
		end
	end
	return f20_local0
end

local f0_local10 = function ( f21_arg0 )
	return {
		accuracy = tonumber( Engine.TableLookupByRow( CSV.weapons.file, f21_arg0, CSV.weapons.cols.statAccuracy ) ) or 0,
		damage = tonumber( Engine.TableLookupByRow( CSV.weapons.file, f21_arg0, CSV.weapons.cols.statDamage ) ) or 0,
		range = tonumber( Engine.TableLookupByRow( CSV.weapons.file, f21_arg0, CSV.weapons.cols.statRange ) ) or 0,
		fireRate = tonumber( Engine.TableLookupByRow( CSV.weapons.file, f21_arg0, CSV.weapons.cols.statFireRate ) ) or 0,
		mobility = tonumber( Engine.TableLookupByRow( CSV.weapons.file, f21_arg0, CSV.weapons.cols.statMobility ) ) or 0
	}
end

LOADOUT.MakeWeaponCamosListDataSource = function ( f22_arg0, f22_arg1 )
	local f22_local0 = Cac.GetWeaponClass( f22_arg1 )
	assert( f22_local0 and #f22_local0 > 0 )
	local f22_local1 = Cac.GetWeaponRowList()
	assert( f22_local1 )
	local f22_local2 = f22_local1[f22_local0][f22_arg1]
	assert( f22_local2 )
	local f22_local3 = f22_local2.camos
	assert( type( f22_local3 ) == "table" )
	local f22_local4 = {}
	for f22_local8, f22_local9 in pairs( f22_local3 ) do
		local f22_local10 = f22_arg0 .. ".camos." .. #f22_local4
		table.insert( f22_local4, {
			ref = LUI.DataSourceInGlobalModel.new( f22_local10 .. ".ref", f22_local9.ref ),
			name = LUI.DataSourceInGlobalModel.new( f22_local10 .. ".name", f22_local9.name ),
			image = LUI.DataSourceInGlobalModel.new( f22_local10 .. ".image", f22_local9.image )
		} )
	end
	f22_local5 = LUI.DataSourceFromList.new( #f22_local4 )
	f22_local5.MakeDataSourceAtIndex = function ( f23_arg0, f23_arg1, f23_arg2 )
		return f22_local4[1 + f23_arg1]
	end
	
	return f22_local5
end

local f0_local11 = function ( f24_arg0, f24_arg1 )
	local f24_local0 = CSV.weapons
	local f24_local1 = f24_arg1.row
	assert( f24_local1 )
	local f24_local2 = {}
	local f24_local3 = CSV.ReadRow( f24_local0, f24_local1 )
	f24_local2.displayOrder = f24_arg1.displayOrder
	f24_local2.id = LUI.DataSourceInGlobalModel.new( f24_arg0 .. ".id", f24_local3.index )
	f24_local2.ref = LUI.DataSourceInGlobalModel.new( f24_arg0 .. ".ref", f24_local3.ref )
	f24_local2.name = LUI.DataSourceInGlobalModel.new( f24_arg0 .. ".name", Engine.Localize( f24_local3.name ) )
	f24_local2.desc = LUI.DataSourceInGlobalModel.new( f24_arg0 .. ".desc", Engine.Localize( f24_local3.desc ) )
	f24_local2.image = LUI.DataSourceInGlobalModel.new( f24_arg0 .. ".image", f24_local3.image )
	f24_local2.fullImage = LUI.DataSourceInGlobalModel.new( f24_arg0 .. ".fullImage", f24_local3.fullImage )
	if not Engine.IsMultiplayer() then
		f24_local2.cost = LUI.DataSourceInGlobalModel.new( f24_arg0 .. ".cost", tonumber( Engine.TableLookupByRow( f24_local0.file, f24_local1, f24_local0.cols.cost ) ) )
	end
	f24_local2.stats = f0_local10( f24_local1 )
	return f24_local2
end

LOADOUT.MakeBaseWeaponsListDataSource = function ( f25_arg0, f25_arg1, f25_arg2, f25_arg3 )
	if not f25_arg3 then
		f25_arg3 = {}
	end
	local f25_local0 = {}
	for f25_local9, f25_local10 in ipairs( f25_arg1 ) do
		local f25_local11 = f25_local10.ref
		local f25_local12 = f25_arg0 .. ".weaponClasses." .. f25_local11
		local f25_local13 = {}
		for f25_local4, f25_local5 in pairs( f25_arg2[f25_local11] ) do
			if f25_local5 ~= nil and f25_local5.displayOrder >= 0 and (not f25_arg3.filterOut or not f25_arg3.filterOut( f25_local4 )) then
				table.insert( f25_local13, f0_local11( f25_local12 .. ".weapons." .. f25_local4, f25_local5 ) )
			end
		end
		table.sort( f25_local13, function ( f26_arg0, f26_arg1 )
			return f26_arg0.displayOrder < f26_arg1.displayOrder
		end )
		f25_local7 = LUI.DataSourceFromList.new( #f25_local13 )
		f25_local7.MakeDataSourceAtIndex = function ( f27_arg0, f27_arg1, f27_arg2 )
			return f25_local13[1 + f27_arg1]
		end
		
		f25_local8 = {
			ref = LUI.DataSourceInGlobalModel.new( f25_local12 .. ".ref", f25_local11 ),
			name = LUI.DataSourceInGlobalModel.new( f25_local12 .. ".name", f25_local10.name ),
			pluralName = LUI.DataSourceInGlobalModel.new( f25_local12 .. ".pluralName", f25_local10.pluralName ),
			image = LUI.DataSourceInGlobalModel.new( f25_local12 .. ".image", f25_local10.image ),
			weapons = f25_local7
		}
		if #f25_local13 > 0 and (not f25_arg3.armoryWeapons or f25_local10.showInArmory == "1") then
			table.insert( f25_local0, f25_local8 )
		end
	end
	for f25_local9, f25_local10 in ipairs( f25_local0 ) do
		table.sort( f25_local10, function ( f28_arg0, f28_arg1 )
			return f28_arg0.displayOrder < f28_arg1.displayOrder
		end )
	end
	f25_local1 = LUI.DataSourceFromList.new( #f25_local0 )
	f25_local1.MakeDataSourceAtIndex = function ( f29_arg0, f29_arg1, f29_arg2 )
		return f25_local0[1 + f29_arg1]
	end
	
	return f25_local1
end

LOADOUT.GetPointCostDataSourceAtIndex = function ( f30_arg0 )
	return function ( f31_arg0, f31_arg1, f31_arg2 )
		return {
			isActive = f30_arg0
		}
	end
	
end

LOADOUT.SlotTypes = {
	ATTACHMENT = "attachment",
	OVERKILL = "overkill",
	POWER = "power",
	PERK = "perk"
}
LOADOUT.GetAttachmentPermanentUnlockName = function ( f32_arg0, f32_arg1, f32_arg2 )
	local f32_local0 = nil
	if f32_arg2 == 0 then
		f32_local0 = "extra_primary_attachment_"
	elseif f32_arg2 == 1 then
		f32_local0 = "extra_secondary_attachment_"
	else
		assert( false )
	end
	return f32_local0 .. f32_arg1 - f0_local8
end

LOADOUT.GetSlotTableLookupName = function ( f33_arg0, f33_arg1, f33_arg2, f33_arg3 )
	local f33_local0 = nil
	if f33_arg1 == LOADOUT.SlotTypes.ATTACHMENT then
		if f33_arg3 == 0 then
			f33_local0 = "primary_attachment_"
		elseif f33_arg3 == 1 then
			f33_local0 = "secondary_attachment_"
		else
			assert( false )
		end
		f33_local0 = f33_local0 .. f33_arg2
	elseif f33_arg1 == LOADOUT.SlotTypes.OVERKILL then
		f33_local0 = "extra_primary_weapon"
	elseif f33_arg1 == LOADOUT.SlotTypes.POWER then
		if f33_arg2 == 0 then
			f33_local0 = "extra_lethal"
		elseif f33_arg2 == 1 then
			f33_local0 = "extra_tactical"
		else
			assert( false )
		end
	elseif f33_arg1 == LOADOUT.SlotTypes.PERK then
		f33_local0 = "extra_perk_" .. f33_arg2
	else
		assert( false )
	end
	return f33_local0
end

LOADOUT.IsAttachmentSlotUnlocked = function ( f34_arg0, f34_arg1, f34_arg2, f34_arg3, f34_arg4 )
	local f34_local0
	if f34_arg3 == 0 then
		f34_local0 = f0_local6
		if not f34_local0 then
		
		else
			local f34_local1 = 0
			local f34_local2 = 0
			for f34_local3 = f0_local8 + 1, f34_local0, 1 do
				if Engine.IsUnlocked( f34_arg0, f34_arg1, LOADOUT.GetSlotTableLookupName( f34_arg0, LOADOUT.SlotTypes.ATTACHMENT, f34_local3, f34_arg3 ), true ) then
					f34_local1 = f34_local1 + 1
				end
				if Engine.IsUnlocked( f34_arg0, f34_arg1, LOADOUT.GetAttachmentPermanentUnlockName( f34_arg0, f34_local3, f34_arg3 ), true ) then
					f34_local2 = f34_local2 + 1
				end
			end
			return f34_arg2 - f0_local8 <= math.min( f34_local1 + f34_local2, f34_local0 - f0_local8 )
		end
	end
	f34_local0 = f0_local7
end

LOADOUT.IsSlotUnlocked = function ( f35_arg0, f35_arg1, f35_arg2, f35_arg3, f35_arg4 )
	local f35_local0 = LOADOUT.GetSlotTableLookupName( f35_arg0, f35_arg1, f35_arg2, f35_arg3 )
	local f35_local1
	if f35_arg4 then
		f35_local1 = "pro_pick10"
		if not f35_local1 then
		
		else
			if f35_arg1 == LOADOUT.SlotTypes.ATTACHMENT then
				return LOADOUT.IsAttachmentSlotUnlocked( f35_arg0, f35_local1, f35_arg2, f35_arg3, f35_arg4 ), f35_local0
			else
				return Engine.IsUnlocked( f35_arg0, f35_local1, f35_local0, true ), f35_local0
			end
		end
	end
	f35_local1 = "pick10"
end

LOADOUT.GetPowerSlotName = function ( f36_arg0 )
	local f36_local0 = nil
	if f36_arg0 == 0 then
		f36_local0 = "LETHAL"
	elseif f36_arg0 == 1 then
		f36_local0 = "TACTICAL"
	else
		assert( false )
	end
	return f36_local0
end

local f0_local12 = function ( f37_arg0 )
	return function ( f38_arg0, f38_arg1 )
		local f38_local0 = f37_arg0.weapon:GetValue( f38_arg1 )
		local f38_local1 = Engine.IsMultiplayer() and f37_arg0.lootItemID:GetValue( f38_arg1 ) or Cac.BaseLootID
		if f38_local1 and f38_local1 > Cac.BaseLootID then
			local f38_local2 = Cac.GetAttachmentBaseRef( f38_arg0 )
			local f38_local3 = Cac.GetUniqueAttachmentRef( f38_local2, f38_local0, f38_local0, Cac.GetWeaponModelName( f38_local0, f38_local0, Cac.GetWeaponQuality( f38_local1 ), f37_arg0.variantID:GetValue( f38_arg1 ) ), false, false )
			if f38_local3 and f38_local3 ~= f38_local2 then
				return f38_local3
			end
		end
		return Cac.GetAttachmentRef( f38_arg0, f38_local0 )
	end
	
end

local f0_local13 = function ()
	local f39_local0
	if CONDITIONS.IsSplitscreen() then
		f39_local0 = LUI.DataSourceInControllerModel.new
		if not f39_local0 then
		
		else
			return f39_local0
		end
	end
	f39_local0 = LUI.DataSourceInGlobalModel.new
end

local f0_local14 = function ( f40_arg0, f40_arg1, f40_arg2, f40_arg3, f40_arg4 )
	return function ( f41_arg0, f41_arg1 )
		local f41_local0 = f0_local13()
		local f41_local1 = f40_arg1 .. ".weapon." .. f40_arg2 .. "attachment." .. f41_arg0
		local f41_local2 = f41_local0( f41_local1 )
		local f41_local3 = f41_arg1:FilterTo( f41_local2, "used", Cac.IsAttachmentSlotInUse )
		local f41_local4 = f41_arg1:FilterTo( f41_local2, "attachUniqueRef", f0_local12( f40_arg0 ) )
		local f41_local5 = nil
		local f41_local6 = f40_arg3()
		if f41_arg0 > 1 then
			local f41_local7 = f41_local6:GetDataSourceAtIndex( f41_arg0 - 1 )
			f41_local5 = f41_local7.used
		end
		local f41_local7, f41_local8, f41_local9, f41_local10 = nil
		if not Engine.IsAliensMode() and f41_arg0 > 2 then
			f41_local9, f41_local10 = LOADOUT.IsSlotUnlocked( f40_arg4, LOADOUT.SlotTypes.ATTACHMENT, f41_arg0 + 1, f40_arg2 )
			if not f41_local9 then
				f41_local7 = f41_local4:FilterTo( f41_local2, "name", function ( f42_arg0, f42_arg1 )
					return Cac.GetPick10ItemName( f41_local10 )
				end )
				f41_local8 = f41_local4:FilterTo( f41_local2, "desc", function ( f43_arg0, f43_arg1 )
					return Cac.GetPick10ItemDesc( f41_local10 )
				end )
			else
				f41_local7 = f41_local4:FilterTo( f41_local2, "name", Cac.GetAttachmentName )
				f41_local8 = f41_local4:FilterTo( f41_local2, "desc", Cac.GetAttachmentDesc )
			end
		elseif f41_arg0 == 0 then
			f41_local7 = LUI.AggregateDataSource.new( f41_local2, {
				f41_local4,
				f40_arg0.variantID
			}, "name", function ()
				local f44_local0 = f0_local12( f40_arg0 )
				local f44_local1 = f41_arg1:GetValue( f40_arg4 )
				if f44_local1 then
					local f44_local2 = f44_local0( f44_local1, f40_arg4 )
					if f44_local2 then
						return Cac.GetOpticAttachmentName( f44_local2 )
					end
				end
				return ""
			end )
			f41_local8 = LUI.AggregateDataSource.new( f41_local2, {
				f41_local4,
				f40_arg0.variantID
			}, "desc", function ()
				local f45_local0 = f0_local12( f40_arg0 )
				local f45_local1 = f41_arg1:GetValue( f40_arg4 )
				if f45_local1 then
					local f45_local2 = f45_local0( f45_local1, f40_arg4 )
					if f45_local2 then
						return Cac.GetOpticAttachmentDesc( f45_local2 )
					end
				end
				return ""
			end )
		else
			f41_local7 = f41_local4:FilterTo( f41_local2, "name", Cac.GetAttachmentName )
			f41_local8 = f41_local4:FilterTo( f41_local2, "desc", Cac.GetAttachmentDesc )
		end
		local f41_local11 = {
			icon = f41_local4:FilterTo( f41_local2, "icon", Cac.GetAttachmentImage ),
			used = f41_local3,
			disabled = LUI.AggregateDataSource.new( f41_local4, {
				f40_arg0.weapon,
				f40_arg0.lootItemID,
				f41_local5
			}, "disabled", function ( f46_arg0 )
				if not Engine.IsAliensMode() then
					if f41_local5 and not f41_local5:GetValue( f46_arg0 ) then
						return true
					elseif f41_arg0 > 2 and not f41_local9 then
						return true
					end
				end
				return not Cac.DoesWeaponHaveAttachmentsByCategory( f40_arg0.weapon:GetValue( f46_arg0 ), Engine.IsMultiplayer() and f40_arg0.lootItemID:GetValue( f46_arg0 ) or Cac.BaseLootID, f46_arg0, Cac.GetCategoryBySlotIndex( f41_arg0 ) )
			end
			 ),
			attachmentUniqueDataSource = f41_local4
		}
		if Engine.InFrontend() then
			local f41_local12 = tonumber( Cac.LowestQuality )
			f41_local11.quality = f41_local0( f41_local1 .. ".quality", f41_local12 )
			f41_local11.qualityColor = f41_local0( f41_local1 .. ".qualityColor", Cac.GetLootQualityColor( f41_local12 ) )
			f41_local11.qualityImage = f41_local0( f41_local1 .. ".qualityImage", Cac.GetLootQualityImage( f41_local12 ) )
			f41_local11.weaponRef = f41_local0( f41_local1 .. ".weaponRef", nil )
			f41_local11.passives = LUI.DataSourceFromList.new( 0 )
			f41_local11.fireModes = LUI.DataSourceFromList.new( 0 )
			f41_local11.isMk2 = f41_local0( f41_local1 .. ".isMk2", false )
			if not Engine.IsAliensMode() then
				local f41_local13 = LUI.DataSourceFromList.new( Cac.POINT_COSTS.attachments[f40_arg2 + 1][f41_arg0 + 1] )
				f41_local13.MakeDataSourceAtIndex = LOADOUT.GetPointCostDataSourceAtIndex( f41_local3 )
				f41_local11.pointCost = f41_local13
				f41_local11.weaponIndex = f40_arg2
				f41_local11.esportsLocked = not LOADOUT.IsSlotUnlocked( f40_arg4, LOADOUT.SlotTypes.ATTACHMENT, f41_arg0 + 1, f40_arg2, true )
			else
				f41_local11.weaponRef = LUI.DataSourceInGlobalModel.new( f41_local1 .. ".weapons.attachments.weaponIndex." .. f40_arg2, f40_arg2 )
			end
			local f41_local13 = f41_arg1
			local f41_local14 = false
			if not Engine.IsAliensMode() and f41_arg0 > 2 and not f41_local9 then
				f41_local13 = LUI.DataSourceInGlobalModel.new( f41_local1 .. ".ref", f41_local10 )
				f41_local14 = true
			end
			f41_local11.ref = f41_local13
			f41_local11.index = f41_arg0
			if f41_arg0 > 1 then
				f41_local11.prevAttachmentUsed = f41_local5
			end
			f41_local11.slot = f41_arg0
			f41_local11.fullImage = f41_local4:FilterTo( f41_local2, "fullImage", Cac.GetAttachmentFullImage )
			f41_local11.name = f41_local7
			f41_local11.desc = f41_local8
			f41_local11.qualityString = LUI.DataSourceInGlobalModel.new( f41_local1 .. ".qualityString", Cac.GetLootQualityString( f41_local12 ) )
			f41_local11.emptyString = f41_local2:GetDataSourceForSubmodel( "emptyString", Cac.GetAttachmentEmptyString( f41_arg0 ) )
			f41_local11.stats = {
				accuracy = f41_local4:FilterTo( f41_local2, "stats.accuracy", Cac.GetAttachmentStatAccuracy ),
				damage = f41_local4:FilterTo( f41_local2, "stats.damage", Cac.GetAttachmentStatDamage ),
				range = f41_local4:FilterTo( f41_local2, "stats.range", Cac.GetAttachmentStatRange ),
				fireRate = f41_local4:FilterTo( f41_local2, "stats.fireRate", Cac.GetAttachmentStatFireRate ),
				mobility = f41_local4:FilterTo( f41_local2, "stats.mobility", Cac.GetAttachmentStatMobility )
			}
			f41_local11.slotLocked = LUI.DataSourceInGlobalModel.new( f41_local1 .. ".slotLocked", f41_local14 )
		end
		return f41_local11
	end
	
end

local f0_local15 = function ( f47_arg0, f47_arg1 )
	return {
		ref = f47_arg0.camo,
		image = f47_arg0.camo:FilterTo( f47_arg1, "camo.image", Cac.GetCamoImage ),
		name = f47_arg0.camo:FilterTo( f47_arg1, "camo.name", Cac.GetCamoName ),
		category = f47_arg0.camo:FilterTo( f47_arg1, "camo.category", Cac.GetCamoCategory )
	}
end

local f0_local16 = function ( f48_arg0, f48_arg1 )
	return {
		ref = f48_arg0.reticle,
		image = f48_arg0.reticle:FilterTo( f48_arg1, "reticle.image", Cac.GetReticleImage ),
		name = f48_arg0.reticle:FilterTo( f48_arg1, "reticle.name", Cac.GetReticleName ),
		desc = f48_arg0.reticle:FilterTo( f48_arg1, "reticle.desc", Cac.GetReticleName ),
		type = f48_arg0.reticle:FilterTo( f48_arg1, "reticle.type", Cac.GetReticleType ),
		category = f48_arg0.reticle:FilterTo( f48_arg1, "reticle.category", Cac.GetReticleCategory )
	}
end

local f0_local17 = function ( f49_arg0, f49_arg1 )
	return {
		ref = f49_arg0.cosmeticAttachment,
		name = f49_arg0.cosmeticAttachment:FilterTo( f49_arg1, "cosmeticAttachment.name", Cac.GetCosmeticAttachmentName ),
		icon = f49_arg0.cosmeticAttachment:FilterTo( f49_arg1, "cosmeticAttachment.icon", Cac.GetCosmeticAttachmentIcon ),
		category = f49_arg0.cosmeticAttachment:FilterTo( f49_arg1, "cosmeticAttachment.category", Cac.GetCosmeticAttachmentCategory )
	}
end

local f0_local18 = function ( f50_arg0 )
	return Cac.GetPassivesForWeapon( Cac.GetLootRef( f50_arg0 ), f50_arg0 )
end

local f0_local19 = function ( f51_arg0, f51_arg1, f51_arg2, f51_arg3 )
	local f51_local0 = f0_local18( f51_arg0 )
	if f51_local0[f51_arg2 + 1] ~= nil then
		if f51_arg1 ~= "image" then
			return Engine.Localize( f51_local0[f51_arg2 + 1][f51_arg1]:GetValue( f51_arg3 ) )
		else
			return f51_local0[f51_arg2 + 1][f51_arg1]:GetValue( f51_arg3 )
		end
	else
		return nil
	end
end

local f0_local20 = function ( f52_arg0 )
	return Cac.GetFireModesForLootWeapon( Cac.GetLootRef( f52_arg0 ), f52_arg0 )
end

local f0_local21 = function ( f53_arg0, f53_arg1, f53_arg2, f53_arg3, f53_arg4 )
	local f53_local0 = f0_local20( f53_arg0 )
	if #f53_local0 <= 0 then
		return Cac.GetFireModeFieldValue( f53_arg1, f53_arg2, f53_arg3, f53_arg4 )
	elseif f53_local0[f53_arg3 + 1] ~= nil then
		if f53_arg2 ~= "image" then
			return Engine.Localize( f53_local0[f53_arg3 + 1][f53_arg2]:GetValue( f53_arg4 ) )
		else
			return f53_local0[f53_arg3 + 1][f53_arg2]:GetValue( f53_arg4 )
		end
	else
		return nil
	end
end

local f0_local22 = function ( f54_arg0 )
	return function ( f55_arg0, f55_arg1 )
		local f55_local0 = Cac.GetUnlockAttachmentListByCategory( f55_arg0 )
		local f55_local1 = Cac.GetAttachmentUnlockTable( f55_arg0 )
		local f55_local2 = Cac.GetWeaponClassAttachUnlockTablePrefix( Cac.GetWeaponClass( f55_arg0 ) ) .. "attach"
		for f55_local11, f55_local12 in pairs( f55_local0 ) do
			if f55_local11 == f54_arg0 then
				for f55_local9, f55_local10 in ipairs( f55_local12.attachments ) do
					if Rewards.IsNew( f55_arg1, f55_local2, Engine.TableLookupGetRowNum( f55_local1, CSV.attachmentUnlockTable.cols.weaponAttachRef, f55_local10 ) ) then
						return true
					end
				end
			end
		end
	end
	
end

LOADOUT.GetLootWeaponDecorator = function ( f56_arg0, f56_arg1 )
	return function ( f57_arg0, f57_arg1 )
		if Engine.IsAliensMode() and f57_arg1.weapon:GetValue( f56_arg1 ) == "none" then
			f57_arg1.weapon:SetValue( f56_arg1, f57_arg0 )
		end
		local f57_local0 = f0_local13()
		local f57_local1 = f56_arg0 .. ".weapon." .. f57_arg0
		local f57_local2 = nil
		f57_local2 = f57_arg1.attachment:Decorate( f0_local14( f57_arg1, f57_local1, f57_arg0, function ()
			return f57_local2
		end, f56_arg1 ) )
		f57_local2:SetCachingEnabled( true )
		local f57_local3 = {}
		for f57_local4 = 0, Cac.attachmentCount - 1, 1 do
			local f57_local7 = f57_local4
			table.insert( f57_local3, LUI.LazyDataSource.new( function ()
				return f57_local2:GetDataSourceAtIndex( f57_local7 )
			end ) )
		end
		local f57_local4 = f57_local0( f57_local1 )
		local f57_local5 = f57_arg1.weapon:FilterTo( f57_local4, "used", Cac.IsWeaponSlotInUse )
		local f57_local6 = f57_arg1.lootItemID:FilterTo( f57_local4, "quality", function ( f60_arg0 )
			return Cac.GetWeaponQuality( f60_arg0 )
		end )
		local f57_local7 = f57_arg1.lootItemID:FilterTo( f57_local4, "isMk2", function ( f61_arg0 )
			if Engine.IsMultiplayer() then
				return Cac.IsLootIDMk2( f61_arg0 )
			else
				return false
			end
		end )
		local f57_local8 = Cac.GetWeaponLevelData( f57_arg1.weapon:GetValue( f56_arg1 ), f56_arg1 )
		local f57_local9 = {
			icon = LUI.AggregateDataSource.new( f57_local4, {
				f57_arg1.weapon,
				f57_arg1.lootItemID
			}, "icon", function ( f62_arg0 )
				return Cac.GetWeaponLootImage( f57_arg1.weapon:GetValue( f62_arg0 ), f57_arg1.lootItemID:GetValue( f62_arg0 ) )
			end
			 ),
			used = f57_local5,
			name = LUI.AggregateDataSource.new( f57_local4, {
				f57_arg1.weapon,
				f57_arg1.lootItemID
			}, "name", function ( f63_arg0 )
				return Cac.GetWeaponLootName( f57_arg1.weapon:GetValue( f63_arg0 ), f57_arg1.lootItemID:GetValue( f63_arg0 ) )
			end
			 ),
			attachments = {
				attachmentSlotOne = f57_local3[1],
				attachmentSlotTwo = f57_local3[2],
				attachmentSlotThree = f57_local3[3],
				attachmentSlotFour = f57_local3[4],
				attachmentSlotFive = f57_local3[5],
				attachmentSlotSix = f57_local3[6]
			},
			attachmentsList = f57_local2,
			attachment = f57_arg1.attachment,
			quality = f57_local6,
			qualityColor = f57_local6:FilterTo( f57_local4, "qualityColor", function ( f64_arg0 )
				return Cac.GetLootQualityColor( tonumber( f64_arg0 ) )
			end
			 ),
			qualityImage = f57_local6:FilterTo( f57_local4, "qualityImage", function ( f65_arg0 )
				return Cac.GetLootQualityImage( tonumber( f65_arg0 ) )
			end
			 ),
			isMk2 = f57_local7
		}
		if Engine.InFrontend() then
			local f57_local10 = LUI.DataSourceFromList.new( f57_arg1.lootItemID:FilterTo( f57_local4, "passivesCount", function ( f66_arg0 )
				return #f0_local18( f66_arg0 )
			end ) )
			f57_local10.GetDataSourceAtIndex = function ( f67_arg0, f67_arg1, f67_arg2 )
				return {
					passive = {
						name = f57_arg1.lootItemID:FilterTo( f57_local4, "passives." .. f67_arg1 .. ".name", function ( f68_arg0 )
							return f0_local19( f68_arg0, "name", f67_arg1, f67_arg2 )
						end
						 ),
						desc = f57_arg1.lootItemID:FilterTo( f57_local4, "passives." .. f67_arg1 .. ".desc", function ( f69_arg0 )
							return f0_local19( f69_arg0, "weaponDesc", f67_arg1, f67_arg2 )
						end
						 ),
						image = f57_arg1.lootItemID:FilterTo( f57_local4, "passives." .. f67_arg1 .. ".image", function ( f70_arg0 )
							return f0_local19( f70_arg0, "image", f67_arg1, f67_arg2 )
						end
						 )
					}
				}
			end
			
			f57_local9.passives = f57_local10
			local f57_local11 = {
				f57_arg1.lootItemID,
				f57_arg1.weapon
			}
			local f57_local12 = LUI.DataSourceFromList.new( LUI.AggregateDataSource.new( f57_local4, f57_local11, "fireModesCount", function ()
				local f71_local0 = #f0_local20( f57_arg1.lootItemID:GetValue( f56_arg1 ) )
				if f71_local0 > 0 then
					return f71_local0
				else
					return #Cac.GetFireModesForWeapon( f57_arg1.weapon:GetValue( f56_arg1 ) )
				end
			end ) )
			f57_local12.GetDataSourceAtIndex = function ( f72_arg0, f72_arg1, f72_arg2 )
				return {
					fireMode = {
						name = LUI.AggregateDataSource.new( f57_local4, f57_local11, "fireModes." .. f72_arg1 .. ".name", function ()
							return f0_local21( f57_arg1.lootItemID:GetValue( f72_arg2 ), f57_arg1.weapon:GetValue( f72_arg2 ), "name", f72_arg1, f72_arg2 )
						end
						 ),
						icon = LUI.AggregateDataSource.new( f57_local4, f57_local11, "fireModes." .. f72_arg1 .. ".icon", function ()
							return f0_local21( f57_arg1.lootItemID:GetValue( f72_arg2 ), f57_arg1.weapon:GetValue( f72_arg2 ), "image", f72_arg1, f72_arg2 )
						end
						 )
					}
				}
			end
			
			f57_local9.fireModes = f57_local12
			f57_local9.weaponRef = f57_arg1.weapon:FilterTo( f57_local4, "ref", function ( f75_arg0 )
				return f75_arg0
			end )
			if not Engine.IsAliensMode() then
				local f57_local13 = LUI.DataSourceFromList.new( Cac.POINT_COSTS.weapons[f57_arg0 + 1] )
				f57_local13.MakeDataSourceAtIndex = LOADOUT.GetPointCostDataSourceAtIndex( f57_local5 )
				f57_local9.pointCost = f57_local13
				f57_local9.slot = f57_local4:GetDataSourceForSubmodel( "slot", f57_arg0 )
			end
			local f57_local13 = LUI.AggregateDataSource.new( f57_local4, {
				f57_arg1.weapon,
				f57_arg1.lootItemID
			}, "desc", function ( f76_arg0 )
				return Cac.GetWeaponLootDesc( f57_arg1.weapon:GetValue( f76_arg0 ), f57_arg1.lootItemID:GetValue( f76_arg0 ) )
			end )
			f57_local9.ref = f57_arg1.weapon
			f57_local9.weapon = f57_arg1.weapon
			f57_local9.lootItemID = f57_arg1.lootItemID
			f57_local9.variantID = f57_arg1.variantID
			f57_local9.fullImage = f57_arg1.weapon:FilterTo( f57_local4, "fullImage", Cac.GetWeaponFullImage )
			f57_local9.desc = f57_local13
			f57_local9.qualityString = f57_local6:FilterTo( f57_local4, "qualityString", function ( f77_arg0 )
				return Cac.GetLootQualityString( tonumber( f77_arg0 ) )
			end )
			f57_local9.camoInfo = LUI.LazyDataSource.new( function ()
				return f0_local15( f57_arg1, f57_local4 )
			end )
			f57_local9.reticleInfo = LUI.LazyDataSource.new( function ()
				return f0_local16( f57_arg1, f57_local4 )
			end )
			f57_local9.cosmeticAttachmentInfo = LUI.LazyDataSource.new( function ()
				return f0_local17( f57_arg1, f57_local4 )
			end )
			f57_local9.newOpticsAttachment = f57_arg1.weapon:FilterTo( f57_local4, "newOpticsAttachment", f0_local22( Cac.AttachmentCategories.optics ) )
			f57_local9.newAlternateAttachment = f57_arg1.weapon:FilterTo( f57_local4, "newAlternateAttachment", f0_local22( Cac.AttachmentCategories.attachments ) )
			f57_local9.stats = {
				accuracy = f57_arg1.weapon:FilterTo( f57_local4, "stats.accuracy", Cac.GetWeaponStatAccuracy ),
				damage = f57_arg1.weapon:FilterTo( f57_local4, "stats.damage", Cac.GetWeaponStatDamage ),
				range = f57_arg1.weapon:FilterTo( f57_local4, "stats.range", Cac.GetWeaponStatRange ),
				fireRate = f57_arg1.weapon:FilterTo( f57_local4, "stats.fireRate", Cac.GetWeaponStatFireRate ),
				mobility = f57_arg1.weapon:FilterTo( f57_local4, "stats.mobility", Cac.GetWeaponStatMobility )
			}
			f57_local9.attachmentStats = {
				accuracy = LUI.AggregateDataSource.new( f57_local4, f57_local3, "attachmentStats.accuracy", function ( f81_arg0 )
					return Cac.GetAttachmentStatSum( f57_local3, "accuracy", f81_arg0 )
				end
				 ),
				damage = LUI.AggregateDataSource.new( f57_local4, f57_local3, "attachmentStats.damage", function ( f82_arg0 )
					return Cac.GetAttachmentStatSum( f57_local3, "damage", f82_arg0 )
				end
				 ),
				range = LUI.AggregateDataSource.new( f57_local4, f57_local3, "attachmentStats.range", function ( f83_arg0 )
					return Cac.GetAttachmentStatSum( f57_local3, "range", f83_arg0 )
				end
				 ),
				fireRate = LUI.AggregateDataSource.new( f57_local4, f57_local3, "attachmentStats.fireRate", function ( f84_arg0 )
					return Cac.GetAttachmentStatSum( f57_local3, "fireRate", f84_arg0 )
				end
				 ),
				mobility = LUI.AggregateDataSource.new( f57_local4, f57_local3, "attachmentStats.mobility", function ( f85_arg0 )
					return Cac.GetAttachmentStatSum( f57_local3, "mobility", f85_arg0 )
				end
				 )
			}
		end
		return f57_local9
	end
	
end

LOADOUT.InitPassiveDataSources = function ( f86_arg0 )
	DataSources.alwaysLoaded.MP.CAC.passives = {}
	local f86_local0 = LUI.DataSourceInGlobalModel.new( f86_arg0 .. ".passives" )
	for f86_local1 = 0, Engine.TableGetRowCount( CSV.passives.file ), 1 do
		local f86_local4 = CSV.ReadRow( CSV.passives, f86_local1 )
		if #f86_local4.ref == 0 then
			break
		elseif Engine.IsAliensMode() then
			DataSources.alwaysLoaded.MP.CAC.passives[f86_local4.ref] = {
				index = f86_local1,
				name = f86_local0:GetDataSourceForSubmodel( f86_local4.ref .. ".name", f86_local4.name ),
				weaponDesc = f86_local0:GetDataSourceForSubmodel( f86_local4.ref .. ".CPDesc", f86_local4.CPDesc ),
				streakDesc = f86_local0:GetDataSourceForSubmodel( f86_local4.ref .. ".streakDesc", f86_local4.streakDesc ),
				equipDesc = f86_local0:GetDataSourceForSubmodel( f86_local4.ref .. ".equipDesc", f86_local4.equipDesc ),
				abilityDesc = f86_local0:GetDataSourceForSubmodel( f86_local4.ref .. ".abilityDesc", f86_local4.abilityDesc ),
				image = f86_local0:GetDataSourceForSubmodel( f86_local4.ref .. ".image", f86_local4.image )
			}
		else
			DataSources.alwaysLoaded.MP.CAC.passives[f86_local4.ref] = {
				index = f86_local1,
				name = f86_local0:GetDataSourceForSubmodel( f86_local4.ref .. ".name", f86_local4.name ),
				weaponDesc = f86_local0:GetDataSourceForSubmodel( f86_local4.ref .. ".weaponDesc", f86_local4.weaponDesc ),
				streakDesc = f86_local0:GetDataSourceForSubmodel( f86_local4.ref .. ".streakDesc", f86_local4.streakDesc ),
				equipDesc = f86_local0:GetDataSourceForSubmodel( f86_local4.ref .. ".equipDesc", f86_local4.equipDesc ),
				abilityDesc = f86_local0:GetDataSourceForSubmodel( f86_local4.ref .. ".abilityDesc", f86_local4.abilityDesc ),
				image = f86_local0:GetDataSourceForSubmodel( f86_local4.ref .. ".image", f86_local4.image )
			}
		end
	end
end

LOADOUT.InitFireModeDataSources = function ( f87_arg0 )
	DataSources.alwaysLoaded.MP.CAC.fireModes = {}
	local f87_local0 = LUI.DataSourceInGlobalModel.new( f87_arg0 .. ".fireModes" )
	for f87_local1 = 0, Engine.TableGetRowCount( CSV.fireModes.file ), 1 do
		local f87_local4 = CSV.ReadRow( CSV.fireModes, f87_local1 )
		DataSources.alwaysLoaded.MP.CAC.fireModes[f87_local4.ref] = {
			name = LUI.DataSourceInGlobalModel.new( f87_arg0 .. ".fireModes." .. f87_local1 .. ".name", f87_local4.name ),
			ref = LUI.DataSourceInGlobalModel.new( f87_arg0 .. ".fireModes." .. f87_local1 .. ".fireModeRef", f87_local4.ref ),
			image = LUI.DataSourceInGlobalModel.new( f87_arg0 .. ".fireModes." .. f87_local1 .. ".image", f87_local4.image )
		}
	end
end

local f0_local23 = function ( f88_arg0, f88_arg1 )
	
end

local f0_local24 = function ( f89_arg0 )
	local f89_local0 = {}
	local f89_local1 = {}
	local f89_local2 = {}
	for f89_local6, f89_local7 in pairs( f89_arg0 ) do
		if f89_local7.category and f89_local7.category ~= "" and not f89_local0[f89_local7.category] then
			f89_local0[f89_local7.category] = {}
			f89_local1[f89_local7.category] = {}
			f89_local2[f89_local7.category] = {}
		end
	end
	f89_local3 = function ( f90_arg0, f90_arg1 )
		local f90_local0 = tonumber( f90_arg1.menuOrder )
		if not f89_local1[f90_arg0][f90_local0] then
			f89_local1[f90_arg0][f90_local0] = {}
			table.insert( f89_local2[f90_arg0], f90_local0 )
		end
		table.insert( f89_local1[f90_arg0][f90_local0], f90_arg1 )
	end
	
	for f89_local7, f89_local13 in pairs( f89_arg0 ) do
		if f89_local13.category and f89_local13.category ~= "" then
			f89_local3( f89_local13.category, f89_local13 )
		end
		for f89_local11, f89_local12 in pairs( f89_local1 ) do
			f89_local3( f89_local11, f89_local13 )
		end
	end
	f89_local4 = function ( f91_arg0, f91_arg1 )
		return f91_arg0.index < f91_arg1.index
	end
	
	for f89_local13, f89_local8 in pairs( f89_local1 ) do
		table.sort( f89_local2[f89_local13] )
		for f89_local12, f89_local14 in pairs( f89_local8 ) do
			table.sort( f89_local14, f89_local4 )
		end
	end
	for f89_local13, f89_local8 in pairs( f89_local2 ) do
		for f89_local12, f89_local14 in ipairs( f89_local8 ) do
			for f89_local15, f89_local16 in ipairs( f89_local1[f89_local13][f89_local14] ) do
				table.insert( f89_local0[f89_local13], f89_local16 )
			end
		end
	end
	return f89_local0
end

LOADOUT.MakePersonalizationItemsListDataSource = function ( f92_arg0, f92_arg1, f92_arg2, f92_arg3 )
	local f92_local0 = f92_arg2 or {}
	local f92_local1 = false
	assert( f92_arg1, "Error: LOADOUT.MakePersonalizationItemsListDataSource - No items data provided." )
	local f92_local2 = f0_local24( f92_arg1 )
	local f92_local3 = CountTableKeys( f92_local2 )
	assert( f92_local3 > 0, "Error: LOADOUT.MakePersonalizationItemsListDataSource - There are no categories so we can't make a tab datasource." )
	local f92_local4 = {}
	local f92_local5 = LUI.DataSourceFromList.new( f92_local3 )
	f92_local5.MakeDataSourceAtIndex = function ( f93_arg0, f93_arg1 )
		return f92_local4[f93_arg1 + 1]
	end
	
	local f92_local6 = {}
	if not f92_local0.categoriesOrder or CountTableKeys( f92_local0.categoriesOrder ) == 0 then
		f92_local1 = true
	else
		local f92_local7 = {}
		for f92_local11, f92_local12 in pairs( f92_local0.categoriesOrder ) do
			f92_local7[f92_local12] = f92_local11
		end
		for f92_local8 = 1, CountTableKeys( f92_local7 ), 1 do
			f92_local12 = f92_local7[f92_local8]
			if f92_local2[f92_local12] then
				f92_local6[f92_local12] = CountTableKeys( f92_local6 ) + 1
			end
		end
	end
	assert( f92_local0.currentlyEquippedItemDataSource, "Error: LOADOUT.MakePersonalizationItemsListDataSource - No currently equipped item datasource provided." )
	assert( f92_local0.controllerIndex, "Error: LOADOUT.MakePersonalizationItemsListDataSource - No controllerIndex provided." )
	local f92_local7 = f92_local0.currentlyEquippedItemDataSource.category:GetValue( f92_local0.controllerIndex )
	local f92_local8 = 0
	if f92_local1 then
		local f92_local9 = 0
		for f92_local13, f92_local14 in pairs( f92_local2 ) do
			if f92_local13 == f92_local7 then
				f92_local8 = f92_local9
			end
			f92_local9 = f92_local9 + 1
		end
	elseif f92_local6[f92_local7] then
		f92_local8 = f92_local6[f92_local7] - 1
	end
	f92_local5.GetDefaultFocusIndex = function ()
		return f92_local8
	end
	
	local f92_local9 = 0
	for f92_local13, f92_local14 in pairs( f92_local2 ) do
		local f92_local19 = {
			focusFunction = function ( f95_arg0, f95_arg1, f95_arg2 )
				
			end
		}
		for f92_local15 = 1, #f92_local14, 1 do
			if f92_local14[f92_local15].ref == f92_local0.currentlyEquippedItemDataSource.ref:GetValue( f92_local0.controllerIndex ) then
				f92_local9 = f92_local15 - 1
				break
			end
		end
		if f92_local0.tabNames and f92_local0.tabNames[f92_local13] and f92_local0.tabNames[f92_local13] ~= "" then
			f92_local19.name = LUI.DataSourceInGlobalModel.new( f92_arg0 .. ".tabs." .. f92_local13, ToUpperCase( Engine.Localize( f92_local0.tabNames[f92_local13] ) ) )
		else
			f92_local19.name = LUI.DataSourceInGlobalModel.new( f92_arg0 .. ".tabs." .. f92_local13, f92_local13 )
		end
		for f92_local15 = #f92_local14, 1, -1 do
			local f92_local18 = f92_local14[f92_local15]
			f92_local18.isUnlocked = f92_local0.isUnlockedFunc( f92_local18 )
			if not f92_local18.isUnlocked and f92_local18.hideIfLocked then
				table.remove( f92_local14, f92_local15 )
			end
			if f92_local0.getQualityFunc then
				f92_local18.quality = f92_local0.getQualityFunc( f92_local18 )
			else
				f92_local18.quality = Cac.LowestQuality
			end
		end
		f92_local19.items = LUI.DataSourceFromList.new( #f92_local14 )
		f92_local19.items.MakeDataSourceAtIndex = function ( f96_arg0, f96_arg1, f96_arg2 )
			local f96_local0 = f92_local14[f96_arg1 + 1]
			local f96_local1 = f96_local0.ref
			return {
				ref = LUI.DataSourceInGlobalModel.new( f92_arg0 .. ".entries." .. f92_local13 .. "." .. f96_local1 .. ".ref", f96_local1 ),
				name = LUI.DataSourceInGlobalModel.new( f92_arg0 .. ".entries." .. f92_local13 .. "." .. f96_local1 .. ".name", f96_local0.name ),
				image = LUI.DataSourceInGlobalModel.new( f92_arg0 .. ".entries." .. f92_local13 .. "." .. f96_local1 .. ".image", f96_local0.image ),
				isUnlocked = LUI.DataSourceInGlobalModel.new( f92_arg0 .. ".entries." .. f92_local13 .. "." .. f96_local1 .. ".unlocked", f96_local0.isUnlocked ),
				quality = LUI.DataSourceInGlobalModel.new( f92_arg0 .. ".entries." .. f92_local13 .. "." .. f96_local1 .. ".quality", f96_local0.quality ),
				isSelected = f92_local0.currentlyEquippedItemDataSource.ref:FilterTo( LUI.DataSourceInGlobalModel.new( f92_arg0 .. ".entries." .. f92_local13 .. "." .. f96_local1 ), "selected", function ( f97_arg0 )
					return f96_local1 == f97_arg0
				end
				 )
			}
		end
		
		if f92_local1 then
			table.insert( f92_local4, f92_local19 )
		else
			local f92_local15 = f92_local6[f92_local13]
			assert( f92_local15, "Error: LOADOUT.MakePersonalizationItemsListDataSource - Item tab name (" .. f92_local13 .. ") not specified in categoriesOrder list." )
			f92_local4[f92_local15] = f92_local19
		end
	end
	f92_local4[f92_local8 + 1].items.GetDefaultFocusIndex = function ()
		local f98_local0 = f92_local9
		f92_local9 = 0
		return f98_local0
	end
	
	return f92_local5
end

LOADOUT.LookupDefaultClassItem = function ( f99_arg0, f99_arg1 )
	return Engine.TableLookup( CSV.defaultClassTable.file, CSV.defaultClassTable.cols.itemRef, f99_arg1, CSV.defaultClassTable.cols.class1 + f99_arg0 )
end

LOADOUT.BuildDefaltClassDataSource = function ( f100_arg0, f100_arg1 )
	local f100_local0 = f0_local0 .. "." .. f100_arg0 .. "."
	assert( f100_arg0 < LOADOUT.DefaultClassCount )
	local f100_local1 = LUI.DataSourceFromList.new( f0_local1 )
	f100_local1.MakeDataSourceAtIndex = function ( f101_arg0, f101_arg1, f101_arg2 )
		local f101_local0 = f100_local0 .. "weaponSetup" .. f101_arg1
		local f101_local1
		if f101_arg1 == Cac.PrimaryWeaponSlot then
			f101_local1 = "Primary"
			if not f101_local1 then
			
			else
				local f101_local2 = LUI.DataSourceFromList.new( f0_local2 )
				f101_local2.MakeDataSourceAtIndex = function ( f102_arg0, f102_arg1, f102_arg2 )
					return LUI.DataSourceInControllerModel.new( f101_local0 .. "attachment." .. f102_arg1, LOADOUT.LookupDefaultClassItem( f100_arg0, "loadout" .. f101_local1 .. "Attachment" .. f102_arg1 + 1 ) )
				end
				
				return {
					weapon = LUI.DataSourceInControllerModel.new( f101_local0 .. "weapon", LOADOUT.LookupDefaultClassItem( f100_arg0, "loadout" .. f101_local1 ) ),
					camo = LUI.DataSourceInControllerModel.new( f101_local0 .. "camo", LOADOUT.LookupDefaultClassItem( f100_arg0, "loadout" .. f101_local1 .. "Camo" ) ),
					reticle = LUI.DataSourceInControllerModel.new( f101_local0 .. "reticle", LOADOUT.LookupDefaultClassItem( f100_arg0, "loadout" .. f101_local1 .. "Reticle" ) ),
					lootItemID = LUI.DataSourceInControllerModel.new( f101_local0 .. "lootItemID", Cac.LootIDNoneValue ),
					variantID = LUI.DataSourceInControllerModel.new( f101_local0 .. "variantID", Cac.WeaponVariantIDNoneValue ),
					attachment = f101_local2
				}
			end
		end
		f101_local1 = "Secondary"
	end
	
	local f100_local2 = LUI.DataSourceFromList.new( f0_local3 )
	f100_local2.MakeDataSourceAtIndex = function ( f103_arg0, f103_arg1, f103_arg2 )
		local f103_local0 = f100_local0 .. "powerSetup" .. f103_arg1
		local f103_local1
		if f103_arg1 == Cac.PowerSlot.LETHAL then
			f103_local1 = "Primary"
			if not f103_local1 then
			
			else
				return {
					power = LUI.DataSourceInControllerModel.new( f103_local0 .. "power", LOADOUT.LookupDefaultClassItem( f100_arg0, "loadoutPower" .. f103_local1 ) ),
					lootItemID = LUI.DataSourceInControllerModel.new( f103_local0 .. "lootItemID", Cac.LootIDNoneValue ),
					extraCharge = LUI.DataSourceInControllerModel.new( f103_local0 .. "extraCharge", LOADOUT.LookupDefaultClassItem( f100_arg0, "loadoutExtraPower" .. f103_local1 ) == "TRUE" )
				}
			end
		end
		f103_local1 = "Secondary"
	end
	
	local f100_local3 = LUI.DataSourceFromList.new( f0_local4 )
	f100_local3.MakeDataSourceAtIndex = function ( f104_arg0, f104_arg1, f104_arg2 )
		return LUI.DataSourceInControllerModel.new( f100_local0 .. "loadoutPerk" .. f104_arg1, LOADOUT.LookupDefaultClassItem( f100_arg0, "loadoutPerk" .. f104_arg1 + 1 ) )
	end
	
	local f100_local4 = LUI.DataSourceFromList.new( f0_local5 )
	f100_local4.MakeDataSourceAtIndex = function ( f105_arg0, f105_arg1, f105_arg2 )
		return LUI.DataSourceInControllerModel.new( f100_local0 .. "extraPerks" .. f105_arg1, LOADOUT.LookupDefaultClassItem( f100_arg0, "loadoutExtraPerk" .. f105_arg1 + 1 ) )
	end
	
	return {
		inUse = LUI.DataSourceInControllerModel.new( f100_local0 .. "inUse", true ),
		overkill = LUI.DataSourceInControllerModel.new( f100_local0 .. "overkill", LOADOUT.LookupDefaultClassItem( f100_arg0, "loadoutOverkill" ) and 1 or 0 ),
		name = LUI.DataSourceInControllerModel.new( f100_local0 .. "name", Engine.Localize( "MP_INGAME_ONLY_DEFAULT_CLASS_PREFIX", LOADOUT.LookupDefaultClassItem( f100_arg0, "loadoutName" ) ) ),
		weaponSetups = f100_local1,
		powerSetups = f100_local2,
		loadoutPerks = f100_local3,
		extraPerks = f100_local4,
		isDefaultClass = true
	}
end

LOADOUT.WipeDefaultClassModels = function ( f106_arg0 )
	WipeAllModelsAtPath( f0_local0 )
end

