WEAPON_ROW_LIST = {}
WEAPON_CLASS_LIST = {}
function InitFrontEndWeaponDataSources()
	WEAPON_CLASS_LIST = LOADOUT.BuildWeaponClassList( 2 )
	WEAPON_ROW_LIST = LOADOUT.BuildWeaponRowList()
	LOADOUT.InitCamoList()
	LOADOUT.InitWeaponVariantsList()
	LOADOUT.InitWeaponLootOverrideData()
	DataSources.frontEnd.MP.CAC = LUI.DataSourceInGlobalModel.new( "frontEnd.MP.CAC" )
	LOADOUT.InitReticleDataSources( DataSources.frontEnd.MP.CAC )
end

function InitCommonWeaponData()
	LOADOUT.InitWeaponLootMasterIDs()
end

RIG_LIST = {}
POWER_LIST = {
	{},
	{}
}
POWER_LOOT_VARIANT_LIST = {}
local f0_local0 = function ()
	local f3_local0 = CSV.battleRigs.file
	local f3_local1 = 0
	for f3_local2 = 0, Engine.TableGetRowCount( f3_local0 ), 1 do
		local f3_local5 = Engine.TableLookupByRow( f3_local0, f3_local2, CSV.battleRigs.cols.ref )
		if f3_local5 ~= "" then
			RIG_LIST[f3_local5] = {}
			RIG_LIST[f3_local5].index = f3_local1
			RIG_LIST[f3_local5].perks = {}
			RIG_LIST[f3_local5].supers = {}
			RIG_LIST[f3_local5].heads = {}
			RIG_LIST[f3_local5].bodies = {}
			RIG_LIST[f3_local5].taunts = {}
			RIG_LIST[f3_local5].gestures = {}
			f3_local1 = f3_local1 + 1
		end
	end
end

local f0_local1 = function ()
	local f4_local0 = CSV.menuRigPerks.file
	for f4_local1 = 0, Engine.TableGetRowCount( f4_local0 ), 1 do
		local f4_local4 = Engine.TableLookupByRow( f4_local0, f4_local1, CSV.menuRigPerks.cols.rig )
		local f4_local5 = Engine.TableLookupByRow( f4_local0, f4_local1, CSV.menuRigPerks.cols.ref )
		if f4_local4 ~= "" and f4_local5 ~= "" then
			if not PERK_INFO[f4_local5] then
				DebugPrint( "LUI Warning: Rig perk ref " .. f4_local5 .. " listed in menuRigPerks.csv not found in perktable.csv. It was likely removed." )
			end
			if f4_local4 ~= "any" and not RIG_LIST[f4_local4] then
				DebugPrint( "LUI Warning: Ignoring invalid rig type " .. f4_local4 .. " for rig perk " .. f4_local5 .. " in " .. f4_local0 )
			end
			if f4_local4 == "any" then
				for f4_local9, f4_local10 in pairs( RIG_LIST ) do
					f4_local10.perks[f4_local5] = LUI.ShallowCopy( PERK_INFO[f4_local5] )
					f4_local10.perks[f4_local5].index = CountTableKeys( f4_local10.perks ) - 1
				end
			end
			RIG_LIST[f4_local4].perks[f4_local5] = LUI.ShallowCopy( PERK_INFO[f4_local5] )
			RIG_LIST[f4_local4].perks[f4_local5].index = CountTableKeys( RIG_LIST[f4_local4].perks ) - 1
		end
	end
end

local f0_local2 = function ( f5_arg0, f5_arg1, f5_arg2, f5_arg3 )
	if f5_arg2 == "any" then
		for f5_local3, f5_local4 in pairs( f5_arg0 ) do
			f5_arg3.index = CountTableKeys( f5_local4 )
			f5_local4[f5_arg1] = f5_arg3
		end
	else
		local f5_local0 = CountTableKeys( f5_arg0[tonumber( f5_arg2 )] )
		f5_arg0[tonumber( f5_arg2 )][f5_arg1] = LUI.ShallowCopy( f5_arg3 )
		f5_arg0[tonumber( f5_arg2 )][f5_arg1].index = f5_local0
	end
end

local f0_local3 = function ( f6_arg0, f6_arg1 )
	local f6_local0 = f6_arg1.ref
	f6_arg0.supers[f6_local0] = {}
	f6_arg0.supers[f6_local0].index = CountTableKeys( f6_arg0.supers ) - 1
	f6_arg0.supers[f6_local0].name = f6_arg1.uiName
	f6_arg0.supers[f6_local0].desc = f6_arg1.uiDesc
	f6_arg0.supers[f6_local0].image = f6_arg1.uiImageSmall
	f6_arg0.supers[f6_local0].fullImage = f6_arg1.uiImageLarge
	f6_arg0.supers[f6_local0].manufacturersImage = f6_arg1.manufacturersImage
end

local f0_local4 = function ()
	local f7_local0 = CSV.supers.file
	for f7_local1 = 0, Engine.TableGetRowCount( f7_local0 ), 1 do
		local f7_local4 = CSV.ReadRow( {
			file = f7_local0,
			cols = CSV.supers.cols
		}, f7_local1 )
		local f7_local5 = f7_local4.ref
		local f7_local6 = f7_local4.rigRef
		if f7_local6 ~= "" and f7_local5 ~= "" then
			if f7_local6 ~= "any" and not RIG_LIST[f7_local6] then
				DebugPrint( "LUI Warning: Ignoring invalid rig type " .. f7_local6 .. " for super " .. f7_local5 .. " in " .. f7_local0 )
			end
			if f7_local6 == "any" then
				for f7_local10, f7_local11 in pairs( RIG_LIST ) do
					f0_local3( f7_local11, f7_local4 )
				end
			end
			f0_local3( RIG_LIST[f7_local6], f7_local4 )
		end
	end
end

local f0_local5 = function ()
	local f8_local0 = CSV.MPpowers.file
	local f8_local1 = CSV.menuPowers.file
	local f8_local2 = {}
	for f8_local3 = 0, Engine.TableGetRowCount( f8_local0 ), 1 do
		if Engine.TableLookupByRow( f8_local0, f8_local3, CSV.powers.cols.ref ) ~= "" then
			local f8_local6 = Engine.TableLookupByRow( f8_local0, f8_local3, CSV.powers.cols.name )
			local f8_local7 = Engine.TableLookupByRow( f8_local0, f8_local3, CSV.powers.cols.desc )
			local f8_local8 = Engine.TableLookupByRow( f8_local0, f8_local3, CSV.powers.cols.image )
			local f8_local9 = Engine.TableLookupByRow( f8_local0, f8_local3, CSV.powers.cols.ref )
			f8_local2[f8_local9] = {
				name = f8_local6,
				desc = f8_local7,
				image = f8_local8,
				ref = f8_local9,
				fullImage = Engine.TableLookupByRow( f8_local0, f8_local3, CSV.powers.cols.imageLarge )
			}
		end
	end
	for f8_local3 = 0, Engine.TableGetRowCount( f8_local1 ), 1 do
		local f8_local10 = Engine.TableLookupByRow( f8_local1, f8_local3, CSV.menuPowers.cols.ref )
		local f8_local6 = Engine.TableLookupByRow( f8_local1, f8_local3, CSV.menuPowers.cols.slot )
		if f8_local10 ~= "" and f8_local6 ~= "" then
			if not f8_local2[f8_local10] then
				DebugPrint( "LUI Warning: Power ref " .. f8_local10 .. " listed in menuPowers.csv not found in powertable.csv. It was likely removed." )
			else
				f0_local2( POWER_LIST, f8_local10, f8_local6, f8_local2[f8_local10] )
			end
		end
	end
end

local f0_local6 = function ()
	local f9_local0 = CSV.powerLootMaster.file
	for f9_local1 = 0, Engine.TableGetRowCount( f9_local0 ), 1 do
		local f9_local4 = Engine.TableLookupByRow( f9_local0, f9_local1, CSV.powerLootMaster.cols.basePower )
		if #f9_local4 ~= 0 then
			if not POWER_LOOT_VARIANT_LIST[f9_local4] then
				POWER_LOOT_VARIANT_LIST[f9_local4] = {}
			end
			table.insert( POWER_LOOT_VARIANT_LIST[f9_local4], f9_local1 )
		end
	end
end

local f0_local7 = function ()
	local f10_local0 = {}
	for f10_local1 = 0, Cac.powerSlots - 1, 1 do
		local f10_local4 = POWER_LIST[f10_local1 + 1]
		local f10_local5 = "slot" .. f10_local1
		if not f10_local0[f10_local5] then
			f10_local0[f10_local5] = LUI.DataSourceFromList.new( CountTableKeys( f10_local4 ) )
			f10_local0[f10_local5]:SetCachingEnabled( true )
		end
		for f10_local11, f10_local12 in pairs( f10_local4 ) do
			local f10_local13 = "power" .. f10_local12.index
			if not f10_local0[f10_local5][f10_local13] then
				f10_local0[f10_local5][f10_local13] = {}
			end
			local f10_local9 = f10_local0[f10_local5][f10_local13]
			local f10_local10 = "frontEnd.MP.CAC." .. f10_local11
			f10_local9.name = LUI.DataSourceInGlobalModel.new( f10_local10 .. ".name", f10_local4[f10_local11].name )
			f10_local9.desc = LUI.DataSourceInGlobalModel.new( f10_local10 .. ".desc", f10_local4[f10_local11].desc )
			f10_local9.icon = LUI.DataSourceInGlobalModel.new( f10_local10 .. ".icon", f10_local4[f10_local11].image )
			f10_local9.ref = LUI.DataSourceInGlobalModel.new( f10_local10 .. ".ref", f10_local4[f10_local11].ref )
			f10_local9.slot = LUI.DataSourceInGlobalModel.new( "frontEnd.MP.CAC.powerSlot." .. f10_local1, f10_local1 )
			f10_local9.fullImage = LUI.DataSourceInGlobalModel.new( f10_local10 .. ".fullImage", f10_local4[f10_local11].fullImage )
		end
		f10_local0[f10_local5].MakeDataSourceAtIndex = function ( f11_arg0, f11_arg1, f11_arg2 )
			return f10_local0[f10_local5]["power" .. f11_arg1]
		end
		
	end
	DataSources.frontEnd.MP.CAC.powerSlots = LUI.DataSourceFromList.new( Cac.powerSlots )
	DataSources.frontEnd.MP.CAC.powerSlots.MakeDataSourceAtIndex = function ( f12_arg0, f12_arg1, f12_arg2 )
		return f10_local0["slot" .. f12_arg1]
	end
	
	DataSources.frontEnd.MP.CAC.powerSlots:SetCachingEnabled( true )
end

local f0_local8 = function ()
	f0_local5()
	f0_local6()
	f0_local7()
end

SUPER_ROW_LIST = {}
local f0_local9 = function ( f14_arg0 )
	local f14_local0 = RIG_LIST[f14_arg0].perks
	local f14_local1 = {}
	for f14_local6, f14_local7 in pairs( f14_local0 ) do
		local f14_local8 = "perk" .. f14_local7.index
		if not f14_local1[f14_local8] then
			f14_local1[f14_local8] = {}
		end
		local f14_local5 = "frontEnd.MP.CAC.rig." .. f14_local6
		f14_local1[f14_local8].name = LUI.DataSourceInGlobalModel.new( f14_local5 .. ".name", Engine.Localize( f14_local7.name ) )
		f14_local1[f14_local8].desc = LUI.DataSourceInGlobalModel.new( f14_local5 .. ".desc", Engine.Localize( f14_local7.desc ) )
		f14_local1[f14_local8].image = LUI.DataSourceInGlobalModel.new( f14_local5 .. ".image", f14_local7.image )
		f14_local1[f14_local8].fullImage = LUI.DataSourceInGlobalModel.new( f14_local5 .. ".fullImage", f14_local7.fullImage )
		f14_local1[f14_local8].manufacturersImage = LUI.DataSourceInGlobalModel.new( f14_local5 .. ".manufacturersImage", f14_local7.manufacturersImage )
		f14_local1[f14_local8].ref = LUI.DataSourceInGlobalModel.new( f14_local5 .. ".ref", f14_local6 )
	end
	f14_local2 = LUI.DataSourceFromList.new( CountTableKeys( RIG_LIST[f14_arg0].perks ) )
	f14_local2.MakeDataSourceAtIndex = function ( f15_arg0, f15_arg1, f15_arg2 )
		return f14_local1["perk" .. f15_arg1]
	end
	
	f14_local2:SetCachingEnabled( true )
	return f14_local2
end

local f0_local10 = function ( f16_arg0, f16_arg1 )
	local f16_local0 = RIG_LIST[f16_arg0][f16_arg1]
	local f16_local1 = {}
	for f16_local8, f16_local9 in ipairs( f16_local0 ) do
		if not f16_local1[f16_local8] then
			f16_local1[f16_local8] = {}
		end
		local f16_local5 = nil
		if f16_local9.unlockTextParam and f16_local9.unlockTextParam ~= "" then
			f16_local5 = Engine.Localize( f16_local9.customUnlockString, f16_local9.unlockTextParam )
		else
			f16_local5 = Engine.Localize( f16_local9.customUnlockString )
		end
		local f16_local6 = Cac.LowestQuality
		if f16_arg1 == "taunts" or f16_arg1 == "gestures" then
			f16_local6 = Cac.GetLootQualityFromFile( CSV.cosmeticEmotesLootMaster, f16_local9, f16_local9.ref )
		else
			f16_local6 = Cac.GetLootQualityFromFile( CSV.cosmeticRigsLootMaster, f16_local9, f16_local9.model )
		end
		local f16_local7 = "frontEnd.MP.CAC.rig." .. f16_arg1 .. "." .. f16_local9.index
		f16_local1[f16_local8].index = LUI.DataSourceInGlobalModel.new( f16_local7 .. ".index", f16_local9.index )
		f16_local1[f16_local8].ref = LUI.DataSourceInGlobalModel.new( f16_local7 .. ".ref", f16_local9.ref )
		f16_local1[f16_local8].name = LUI.DataSourceInGlobalModel.new( f16_local7 .. ".name", Engine.Localize( f16_local9.name ) )
		f16_local1[f16_local8].customUnlockString = LUI.DataSourceInGlobalModel.new( f16_local7 .. ".customUnlockString", f16_local9.customUnlockString )
		f16_local1[f16_local8].uiImage = LUI.DataSourceInGlobalModel.new( f16_local7 .. ".uiImage", f16_local9.uiImage )
		f16_local1[f16_local8].fullImage = LUI.DataSourceInGlobalModel.new( f16_local7 .. ".fullImage", f16_local9.fullImage )
		f16_local1[f16_local8].challengeEntry = LUI.DataSourceInGlobalModel.new( f16_local7 .. ".challengeEntry" )
		f16_local1[f16_local8].challengeEntry.ref = LUI.DataSourceInGlobalModel.new( f16_local7 .. ".challenge.ref", f16_local9.challenge and f16_local9.challenge or "" )
		f16_local1[f16_local8].challengeEntry.desc = LUI.DataSourceInGlobalModel.new( f16_local7 .. ".challenge.desc", f16_local5 )
		f16_local1[f16_local8].challengeEntry.currentProgress = LUI.DataSourceInGlobalModel.new( f16_local7 .. ".challenge.currentProgress", 0 )
		f16_local1[f16_local8].challengeEntry.currentTierMax = LUI.DataSourceInGlobalModel.new( f16_local7 .. ".challenge.currentTierMax", tonumber( f16_local9.unlockTextParam ) )
		f16_local1[f16_local8].challengeEntry.challengeUnlocked = LUI.DataSourceInGlobalModel.new( f16_local7 .. ".challenge.challengeUnlocked", false )
		f16_local1[f16_local8].challengeEntry.isInit = false
		f16_local1[f16_local8].rigRef = f16_arg0
		f16_local1[f16_local8].previewAnim = f16_local9.previewAnim
		f16_local1[f16_local8].uiCategory = f16_local9.uiCategory
		f16_local1[f16_local8].unlockType = f16_local9.unlockType
		f16_local1[f16_local8].model = f16_local9.model
		f16_local1[f16_local8].displayOrder = f16_local9.displayOrder
		f16_local1[f16_local8].howToUnlock = f16_local9.howToUnlock
		f16_local1[f16_local8].unlockTextParam = f16_local9.unlockTextParam
		f16_local1[f16_local8].quality = LUI.DataSourceInGlobalModel.new( f16_local7 .. ".quality", f16_local6 )
	end
	if #f16_local1 > 0 and f16_local1[1].displayOrder ~= nil then
		table.sort( f16_local1, function ( f17_arg0, f17_arg1 )
			return tonumber( f17_arg0.displayOrder ) < tonumber( f17_arg1.displayOrder )
		end )
	end
	f16_local2 = LUI.DataSourceFromList.new( #f16_local0 )
	f16_local2.MakeDataSourceAtIndex = function ( f18_arg0, f18_arg1 )
		return f16_local1[f18_arg1 + 1]
	end
	
	return f16_local2
end

local f0_local11 = function ()
	f0_local0()
	f0_local1()
	f0_local4()
	SUPER_ROW_LIST = Cac.BuildSuperRowList()
	DataSources.frontEnd.MP.CAC.rigs = LUI.DataSourceFromList.new( CountTableKeys( RIG_LIST ) )
	DataSources.frontEnd.MP.CAC.rigs:SetCachingEnabled( true )
	DataSources.frontEnd.MP.CAC.rigs.MakeDataSourceAtIndex = function ( f20_arg0, f20_arg1, f20_arg2 )
		local f20_local0 = Cac.GetRigRefFromIndex( f20_arg1 )
		local f20_local1 = "frontEnd.MP.CAC.rig." .. f20_local0
		return {
			name = LUI.DataSourceInGlobalModel.new( f20_local1 .. "name", Cac.GetRigName( f20_local0 ) ),
			rigIndex = LUI.DataSourceInGlobalModel.new( f20_local1 .. "rigIndex", string.format( "%02d", f20_arg1 + 1 ) ),
			rigIcon = LUI.DataSourceInGlobalModel.new( f20_local1 .. "rigIcon", Cac.GetRigIcon( f20_local0 ) ),
			manufacturersImage = LUI.DataSourceInGlobalModel.new( f20_local1 .. ".manufacturersImage", Cac.GetRigManufacturersImage( f20_local0 ) ),
			image = LUI.DataSourceInGlobalModel.new( f20_local1 .. "image", Cac.GetRigPortrait( f20_local0 ) ),
			rigHeadshot = LUI.DataSourceInGlobalModel.new( f20_local1 .. "headshot", Cac.GetRigHeadshot( f20_local0 ) ),
			desc = LUI.DataSourceInGlobalModel.new( f20_local1 .. "desc", Cac.GetRigDesc( f20_local0 ) ),
			supers = Cac.GetRigSupersDataSource( f20_local0 ),
			trait = LUI.DataSourceInGlobalModel.new( f20_local1 .. "trait", Cac.GetRigTrait( f20_local0 ) ),
			affinity = LUI.DataSourceInGlobalModel.new( f20_local1 .. "affinity", Cac.GetRigAffinity( f20_local0 ) ),
			movementSpeed = LUI.DataSourceInGlobalModel.new( f20_local1 .. "movementSpeed", Cac.GetRigMovementSpeed( f20_local0 ) ),
			liftType = LUI.DataSourceInGlobalModel.new( f20_local1 .. "liftType", Cac.GetRigLiftType( f20_local0 ) ),
			ref = LUI.DataSourceInGlobalModel.new( f20_local1 .. "ref", f20_local0 ),
			rigPerks = f0_local9( f20_local0 )
		}
	end
	
end

PERK_INFO = {}
PERK_LIST = {
	["1"] = {},
	["2"] = {},
	["3"] = {}
}
local f0_local12 = function ()
	local f21_local0 = CSV.perks.file
	for f21_local1 = 1, Engine.TableGetRowCount( f21_local0 ), 1 do
		local f21_local4 = Engine.TableLookupByRow( f21_local0, f21_local1, CSV.perks.cols.ref )
		if f21_local4 ~= "" then
			PERK_INFO[f21_local4] = {
				name = Engine.TableLookupByRow( f21_local0, f21_local1, CSV.perks.cols.name ),
				desc = Engine.TableLookupByRow( f21_local0, f21_local1, CSV.perks.cols.desc ),
				image = Engine.TableLookupByRow( f21_local0, f21_local1, CSV.perks.cols.image ),
				fullImage = Engine.TableLookupByRow( f21_local0, f21_local1, CSV.perks.cols.fullImage ),
				manufacturersImage = Engine.TableLookupByRow( f21_local0, f21_local1, CSV.perks.cols.manufacturersImage )
			}
		end
	end
end

local f0_local13 = function ()
	local f22_local0 = CSV.menuPerks.file
	for f22_local1 = 0, Engine.TableGetRowCount( f22_local0 ), 1 do
		local f22_local4 = Engine.TableLookupByRow( f22_local0, f22_local1, CSV.menuPerks.cols.slot )
		local f22_local5 = Engine.TableLookupByRow( f22_local0, f22_local1, CSV.menuPerks.cols.ref )
		if f22_local5 ~= "" and f22_local4 ~= "" then
			if not PERK_INFO[f22_local5] then
				DebugPrint( "LUI Warning: Perk ref " .. f22_local5 .. " listed in menuPerks.csv not found in perktable.csv. It was likely removed." )
			end
			if f22_local4 ~= "any" and not PERK_LIST[f22_local4] then
				DebugPrint( "LUI Warning: Ignoring invalid perk slot " .. f22_local4 .. " for perk " .. f22_local5 .. " in " .. f22_local0 )
			end
			if f22_local4 == "any" then
				for f22_local9, f22_local10 in pairs( PERK_LIST ) do
					PERK_INFO[f22_local5].index = CountTableKeys( f22_local10 )
					f22_local10[f22_local5] = PERK_INFO[f22_local5]
					f22_local10[f22_local5].slot = f22_local9
				end
			end
			PERK_INFO[f22_local5].index = CountTableKeys( PERK_LIST[f22_local4] )
			PERK_LIST[f22_local4][f22_local5] = PERK_INFO[f22_local5]
			PERK_LIST[f22_local4][f22_local5].slot = f22_local4
		end
	end
end

local f0_local14 = function ()
	f0_local13()
	DataSources.frontEnd.MP.CAC.perks = LUI.DataSourceFromList.new( 3 )
	DataSources.frontEnd.MP.CAC.perks.MakeDataSourceAtIndex = function ( f24_arg0, f24_arg1, f24_arg2 )
		return DataSources.frontEnd.MP.CAC.perks["slot" .. f24_arg1]
	end
	
	DataSources.frontEnd.MP.CAC.perks:SetCachingEnabled( true )
	for f23_local9, f23_local10 in pairs( PERK_LIST ) do
		local f23_local11 = "slot" .. tostring( tonumber( f23_local9 ) - 1 )
		DataSources.frontEnd.MP.CAC.perks[f23_local11] = LUI.DataSourceFromList.new( CountTableKeys( f23_local10 ) )
		DataSources.frontEnd.MP.CAC.perks[f23_local11].MakeDataSourceAtIndex = function ( f25_arg0, f25_arg1, f25_arg2 )
			return DataSources.frontEnd.MP.CAC.perks[f23_local11]["perk" .. f25_arg1]
		end
		
		local f23_local12 = DataSources.frontEnd.MP.CAC.perks[f23_local11]
		for f23_local5, f23_local6 in pairs( f23_local10 ) do
			local f23_local8 = "perk" .. f23_local6.index
			if not f23_local12[f23_local8] then
				f23_local12[f23_local8] = {}
			end
			local f23_local3 = f23_local12[f23_local8]
			local f23_local4 = "frontEnd.MP.CAC.perks." .. f23_local5
			f23_local3.ref = LUI.DataSourceInGlobalModel.new( f23_local4 .. ".ref", f23_local5 )
			f23_local3.name = LUI.DataSourceInGlobalModel.new( f23_local4 .. ".name", f23_local10[f23_local5].name )
			f23_local3.desc = LUI.DataSourceInGlobalModel.new( f23_local4 .. ".desc", f23_local10[f23_local5].desc )
			f23_local3.icon = LUI.DataSourceInGlobalModel.new( f23_local4 .. ".image", f23_local10[f23_local5].image )
			f23_local3.fullImage = LUI.DataSourceInGlobalModel.new( f23_local4 .. ".fullImage", f23_local10[f23_local5].fullImage )
			f23_local3.slot = LUI.DataSourceInGlobalModel.new( f23_local4 .. ".slot", tonumber( f23_local10[f23_local5].slot ) )
		end
	end
end

STREAK_LIST = {}
STREAK_LOOT_VARIANT_LIST = {}
local f0_local15 = function ()
	local f26_local0 = CSV.streaks.file
	local f26_local1 = {}
	for f26_local2 = 0, Engine.TableGetRowCount( f26_local0 ), 1 do
		local f26_local5 = CSV.ReadRow( CSV.streaks, f26_local2 )
		if f26_local5.ref ~= "" and f26_local5.showInMenus == "1" then
			STREAK_LIST[f26_local5.ref] = {
				index = CountTableKeys( STREAK_LIST ),
				ref = f26_local5.ref,
				name = f26_local5.name,
				desc = f26_local5.desc,
				score = tonumber( f26_local5.kills ),
				supportCost = tonumber( f26_local5.supportCost ),
				image = f26_local5.icon,
				smallImage = f26_local5.smallImage,
				fullImage = f26_local5.fullImage
			}
		end
	end
end

local f0_local16 = function ()
	local f27_local0 = CSV.streakLootMaster.file
	for f27_local1 = 0, Engine.TableGetRowCount( f27_local0 ), 1 do
		local f27_local4 = Engine.TableLookupByRow( f27_local0, f27_local1, CSV.streakLootMaster.cols.baseStreak )
		if #f27_local4 == 0 then
			break
		elseif not STREAK_LOOT_VARIANT_LIST[f27_local4] then
			STREAK_LOOT_VARIANT_LIST[f27_local4] = {}
		end
		table.insert( STREAK_LOOT_VARIANT_LIST[f27_local4], f27_local1 )
	end
end

local f0_local17 = function ()
	f0_local15()
	f0_local16()
	DataSources.frontEnd.MP.CAC.streaks = LUI.DataSourceFromList.new( CountTableKeys( STREAK_LIST ) )
	DataSources.frontEnd.MP.CAC.streaks.MakeDataSourceAtIndex = function ( f29_arg0, f29_arg1, f29_arg2 )
		return DataSources.frontEnd.MP.CAC.streaks["streak" .. f29_arg1]
	end
	
	DataSources.frontEnd.MP.CAC.streaks:SetCachingEnabled( true )
	for f28_local5, f28_local6 in pairs( STREAK_LIST ) do
		local f28_local7 = "streak" .. f28_local6.index
		if not DataSources.frontEnd.MP.CAC.streaks[f28_local7] then
			DataSources.frontEnd.MP.CAC.streaks[f28_local7] = {}
		end
		local f28_local3 = DataSources.frontEnd.MP.CAC.streaks[f28_local7]
		local f28_local4 = "frontEnd.MP.CAC.streaks." .. f28_local5
		f28_local3.ref = LUI.DataSourceInGlobalModel.new( f28_local4 .. ".ref", f28_local6.ref )
		f28_local3.name = LUI.DataSourceInGlobalModel.new( f28_local4 .. ".name", Engine.Localize( f28_local6.name ) )
		f28_local3.score = LUI.DataSourceInGlobalModel.new( f28_local4 .. ".score", f28_local6.score )
		f28_local3.supportCost = LUI.DataSourceInGlobalModel.new( f28_local4 .. ".supportCost", f28_local6.supportCost )
		f28_local3.desc = LUI.DataSourceInGlobalModel.new( f28_local4 .. ".desc", Engine.Localize( f28_local6.desc ) )
		f28_local3.image = LUI.DataSourceInGlobalModel.new( f28_local4 .. ".image", f28_local6.image )
		f28_local3.smallImage = LUI.DataSourceInGlobalModel.new( f28_local4 .. ".smallImage", f28_local6.smallImage )
		f28_local3.fullImage = LUI.DataSourceInGlobalModel.new( f28_local4 .. ".fullImage", f28_local6.fullImage )
	end
end

function WipeGlobalCACDataTables()
	WEAPON_ROW_LIST = {}
	WEAPON_CLASS_LIST = {}
	STREAK_LIST = {}
	STREAK_LOOT_VARIANT_LIST = {}
	PERK_INFO = {}
	PERK_LIST = {
		["1"] = {},
		["2"] = {},
		["3"] = {}
	}
	RIG_LIST = {}
	POWER_LIST = {
		{},
		{}
	}
	POWER_LOOT_VARIANT_LIST = {}
	LOADOUT.WipeLoadoutDataTables()
	SUPER_ROW_LIST = {}
end

local f0_local18 = "frontEnd.MP.CAC.rigSetup"
local f0_local19 = "frontEnd.MP.CAC.streaks"
function WipeCACPlayerDataModels()
	WipeAllModelsAtPath( Cac.playerDataDataSourceModelPath )
	WipeAllModelsAtPath( f0_local18 )
	WipeAllModelsAtPath( f0_local19 )
end

local f0_local20 = function ()
	local f32_local0
	if CONDITIONS.IsSplitscreen() then
		f32_local0 = LUI.DataSourceInControllerModel.new
		if not f32_local0 then
		
		else
			return f32_local0
		end
	end
	f32_local0 = LUI.DataSourceInGlobalModel.new
end

local f0_local21 = function ( f33_arg0 )
	return function ( f34_arg0, f34_arg1, f34_arg2 )
		local f34_local0 = f0_local20()
		local f34_local1 = f33_arg0 .. ".power." .. f34_arg0
		local f34_local2 = f34_local0( f34_local1 )
		local f34_local3 = f34_arg1.power:FilterTo( f34_local2, "used", Cac.IsPowerInUse )
		local f34_local4 = f34_arg1.extraCharge:FilterTo( f34_local2, "extraUsed", Cac.IsExtraPowerInUse )
		local f34_local5 = f34_local0( f34_local1 .. ".extraPower", false )
		local f34_local6, f34_local7 = LOADOUT.IsSlotUnlocked( f34_arg2, LOADOUT.SlotTypes.POWER, f34_arg0 )
		local f34_local8 = LOADOUT.GetPowerSlotName( f34_arg0 )
		local f34_local9 = {
			isExtra = f34_local5,
			icon = f34_arg1.power:FilterTo( f34_local2, "icon", Cac.GetPowerImage ),
			used = f34_local3,
			extraUsed = f34_local4,
			extraDisabled = f34_local3:FilterTo( f34_local2, "extraDisabled", function ( f35_arg0, f35_arg1 )
				if not f34_local6 then
					return true
				else
					return not f35_arg0
				end
			end
			 )
		}
		if Engine.InFrontend() then
			local f34_local10 = LUI.AggregateDataSource.new( f34_local2, {
				f34_arg1.power,
				f34_arg1.lootItemID
			}, "qualityColor", function ( f36_arg0 )
				return Cac.GetPowerQualityColor( f34_arg1.power:GetValue( f36_arg0 ), f34_arg1.lootItemID:GetValue( f36_arg0 ) )
			end )
			local f34_local11 = tonumber( Cac.LowestQuality )
			local f34_local12 = f34_local0( f34_local1 .. ".quality", f34_local11 )
			f34_local9.qualityColor = f34_local10
			f34_local9.quality = f34_local12
			f34_local9.qualityImage = f34_local0( f34_local1 .. ".qualityImage", Cac.GetLootQualityImage( f34_local11 ) )
			local f34_local13 = LUI.DataSourceFromList.new( Cac.POINT_COSTS.powers[f34_arg0 + 1] )
			f34_local13.MakeDataSourceAtIndex = LOADOUT.GetPointCostDataSourceAtIndex( f34_local3 )
			local f34_local14 = LUI.DataSourceFromList.new( Cac.POINT_COSTS.extraPowers[f34_arg0 + 1] )
			f34_local14.MakeDataSourceAtIndex = LOADOUT.GetPointCostDataSourceAtIndex( f34_local4 )
			local f34_local15 = LUI.AggregateDataSource.new( f34_local2, {
				f34_arg1.power,
				f34_arg1.lootItemID
			}, "baseName", function ( f37_arg0 )
				return Cac.GetPowerNameFromRefAndLootID( f34_arg1.power:GetValue( f37_arg0 ), f34_arg1.lootItemID:GetValue( f37_arg0 ), f34_local8 )
			end )
			local f34_local16 = LUI.AggregateDataSource.new( f34_local2, {
				f34_local15,
				f34_local5,
				f34_local4
			}, "name", function ( f38_arg0 )
				if f34_local5:GetValue( f38_arg0 ) then
					if f34_local6 then
						if f34_local4:GetValue( f38_arg0 ) then
							return f34_local15:GetValue( f38_arg0 )
						else
							return Cac.GetPick10ItemName( f34_local7 )
						end
					else
						return Cac.GetPick10ItemName( f34_local7 )
					end
				else
					return f34_local15:GetValue( f38_arg0 )
				end
			end )
			local f34_local17 = f34_arg1.power:FilterTo( f34_local2, "baseDesc", function ( f39_arg0, f39_arg1 )
				if f39_arg0 == Cac.powerNoneValue then
					return Engine.Localize( "LUA_MENU_NO_POWER_" .. f34_local8 )
				else
					return Cac.GetPowerDesc( f39_arg0 )
				end
			end )
			local f34_local18 = LUI.AggregateDataSource.new( f34_local2, {
				f34_local17,
				f34_local5,
				f34_local4
			}, "desc", function ( f40_arg0 )
				if f34_local5:GetValue( f40_arg0 ) then
					if f34_local6 then
						if f34_local4:GetValue( f40_arg0 ) then
							return f34_local17:GetValue( f40_arg0 )
						else
							return Cac.GetPick10ItemDesc( f34_local7 )
						end
					else
						return Cac.GetPick10ItemDesc( f34_local7 )
					end
				else
					return f34_local17:GetValue( f40_arg0 )
				end
			end )
			local f34_local19 = f34_arg1.power:FilterTo( f34_local2, "baseImage", Cac.GetPowerImageLarge )
			local f34_local20 = LUI.AggregateDataSource.new( f34_local2, {
				f34_local19,
				f34_local5,
				f34_local4
			}, "fullImage", function ( f41_arg0 )
				if f34_local5:GetValue( f41_arg0 ) then
					if f34_local6 then
						if f34_local4:GetValue( f41_arg0 ) then
							return f34_local19:GetValue( f41_arg0 )
						else
							return Engine.TableLookup( CSV.powers.file, CSV.powers.cols.ref, Cac.powerNoneValue, CSV.powers.cols.imageLarge )
						end
					else
						return Engine.TableLookup( CSV.powers.file, CSV.powers.cols.ref, Cac.powerNoneValue, CSV.powers.cols.imageLarge )
					end
				else
					return f34_local19:GetValue( f41_arg0 )
				end
			end )
			local f34_local21 = LUI.AggregateDataSource.new( f34_local2, {
				LUI.DataSourceInGlobalModel.new( f34_local1 .. ".baseRef", f34_local7 ),
				f34_local5,
				f34_local4
			}, "ref", function ( f42_arg0 )
				if f34_local5:GetValue( f42_arg0 ) and not f34_local6 then
					return f34_local7
				else
					return f34_arg1.power:GetValue( f42_arg0 )
				end
			end )
			local f34_local22 = LUI.AggregateDataSource.new( f34_local2, {
				LUI.DataSourceInGlobalModel.new( f34_local1 .. ".baseSlotLocked", isExtraPower and not f34_local6 ),
				f34_local5,
				f34_local4
			}, "slotLocked", function ( f43_arg0 )
				if f34_local5:GetValue( f43_arg0 ) and not f34_local6 then
					return true
				else
					return false
				end
			end )
			f34_local9.ref = f34_local21
			f34_local9.pointCost = f34_local13
			f34_local9.lootItemID = f34_arg1.lootItemID
			f34_local9.fullImage = f34_local20
			f34_local9.name = f34_local16
			f34_local9.desc = f34_local18
			f34_local9.qualityString = LUI.DataSourceInGlobalModel.new( f34_local1 .. ".qualityString", Cac.GetLootQualityString( f34_local11 ) )
			f34_local9.slot = LUI.DataSourceInGlobalModel.new( "frontEnd.MP.CAC.power.slot." .. f34_arg0, f34_arg0 )
			f34_local9.extraPointCost = f34_local14
			f34_local9.extraPowerPlayerData = f34_arg1.extraCharge
			f34_local9.weaponRef = LUI.DataSourceInGlobalModel.new( f34_local1 .. ".weaponRef", nil )
			f34_local9.passives = LUI.DataSourceFromList.new( 0 )
			f34_local9.fireModes = LUI.DataSourceFromList.new( 0 )
			f34_local9.slotLocked = f34_local22
			f34_local9.esportsLocked = not LOADOUT.IsSlotUnlocked( f34_arg2, LOADOUT.SlotTypes.POWER, f34_arg0, nil, true )
			f34_local9.isMk2 = LUI.DataSourceInGlobalModel.new( f34_local1 .. ".isMk2", false )
		end
		return f34_local9
	end
	
end

local f0_local22 = function ( f44_arg0, f44_arg1, f44_arg2 )
	return function ( f45_arg0, f45_arg1, f45_arg2 )
		local f45_local0 = f0_local20()
		local f45_local1 = nil
		if f44_arg0 then
			f45_local1 = Cac.POINT_COSTS.extraPerks[f45_arg0 + 1]
		else
			f45_local1 = Cac.POINT_COSTS.perks[f45_arg0 + 1]
		end
		local f45_local2 = f44_arg1 .. ".perk." .. f45_arg0
		local f45_local3 = f45_local0( f45_local2 )
		local f45_local4 = f45_arg1:FilterTo( f45_local3, "used", Cac.IsPerkInUse )
		local f45_local5, f45_local6 = LOADOUT.IsSlotUnlocked( f45_arg2, LOADOUT.SlotTypes.PERK, f45_arg0 + 1 )
		local f45_local7 = nil
		if f44_arg0 and f44_arg2 then
			local f45_local8 = f44_arg2:GetDataSourceAtIndex( f45_arg0, f45_arg2 )
			f45_local7 = f45_local8.used:FilterTo( f45_local3, "disabled", function ( f46_arg0, f46_arg1 )
				if not f45_local5 then
					return true
				else
					return not f46_arg0
				end
			end )
		else
			f45_local7 = f45_local0( f45_local2 .. ".disabled", false )
		end
		local f45_local8 = {
			icon = f45_arg1:FilterTo( f45_local3, "icon", Cac.GetPerkImage ),
			used = f45_local4,
			disabled = f45_local7
		}
		if Engine.InFrontend() then
			local f45_local9 = tonumber( Cac.LowestQuality )
			f45_local8.quality = f45_local0( f45_local2 .. ".quality", f45_local9 )
			f45_local8.qualityColor = f45_local0( f45_local2 .. ".qualityColor", Cac.GetLootQualityColor( f45_local9 ) )
			f45_local8.qualityImage = f45_local0( f45_local2 .. ".qualityImage", Cac.GetLootQualityImage( f45_local9 ) )
			local f45_local10, f45_local11 = nil
			if f44_arg0 and not f45_local5 then
				f45_local10 = f45_arg1:FilterTo( f45_local3, "name", function ( f47_arg0, f47_arg1 )
					return Cac.GetPick10ItemName( f45_local6 )
				end )
				f45_local11 = f45_arg1:FilterTo( f45_local3, "desc", function ( f48_arg0, f48_arg1 )
					return Cac.GetPick10ItemDesc( f45_local6 )
				end )
			else
				f45_local10 = f45_arg1:FilterTo( f45_local3, "name", function ( f49_arg0, f49_arg1 )
					if f49_arg0 == Cac.perkNoneValue then
						return Engine.Localize( "LUA_MENU_NO_PERK", f45_arg0 + 1 )
					else
						return Cac.GetPerkName( f49_arg0 )
					end
				end )
				f45_local11 = f45_arg1:FilterTo( f45_local3, "desc", function ( f50_arg0, f50_arg1 )
					if f50_arg0 == Cac.perkNoneValue then
						return Engine.Localize( "LUA_MENU_NO_PERK", f45_arg0 + 1 )
					else
						return Cac.GetPerkDesc( f50_arg0 )
					end
				end )
			end
			local f45_local12 = LUI.DataSourceFromList.new( f45_local1 )
			f45_local12.MakeDataSourceAtIndex = LOADOUT.GetPointCostDataSourceAtIndex( f45_local4 )
			local f45_local13 = nil
			if f44_arg0 and not f45_local5 then
				f45_local13 = LUI.DataSourceInGlobalModel.new( f45_local2 .. ".ref", f45_local6 )
			else
				f45_local13 = f45_arg1
			end
			local f45_local14 = LUI.DataSourceInGlobalModel.new( f45_local2 .. ".slotLocked", f44_arg0 and not f45_local5 )
			f45_local8.ref = f45_local13
			f45_local8.pointCost = f45_local12
			f45_local8.fullImage = f45_arg1:FilterTo( f45_local3, "fullImage", Cac.GetPerkFullImage )
			f45_local8.name = f45_local10
			f45_local8.desc = f45_local11
			f45_local8.qualityString = LUI.DataSourceInGlobalModel.new( f45_local2 .. ".qualityString", Cac.GetLootQualityString( f45_local9 ) )
			f45_local8.slotIndex = f45_local3:GetDataSourceForSubmodel( "slot", f45_arg0 )
			f45_local8.isExtra = f45_local3:GetDataSourceForSubmodel( "isExtra", f44_arg0 )
			f45_local8.weaponRef = LUI.DataSourceInGlobalModel.new( f45_local2 .. ".weaponRef", nil )
			f45_local8.passives = LUI.DataSourceFromList.new( 0 )
			f45_local8.fireModes = LUI.DataSourceFromList.new( 0 )
			f45_local8.slotLocked = f45_local14
			local f45_local15 = f44_arg0
			if f45_local15 then
				f45_local15 = not LOADOUT.IsSlotUnlocked( f45_arg2, LOADOUT.SlotTypes.PERK, f45_arg0 + 1, nil, true )
			end
			f45_local8.esportsLocked = f45_local15
			f45_local8.isMk2 = LUI.DataSourceInGlobalModel.new( f45_local2 .. ".isMk2", false )
		end
		return f45_local8
	end
	
end

local f0_local23 = function ( f51_arg0, f51_arg1 )
	return function ( f52_arg0, f52_arg1, f52_arg2 )
		local f52_local0 = f51_arg0 .. ".streak." .. f52_arg0
		local f52_local1 = f52_arg1.killstreak
		local f52_local2 = f52_arg1.lootItemID
		local f52_local3 = LUI.DataSourceInGlobalModel.new( f52_local0 )
		local f52_local4 = f52_local2:FilterTo( f52_local3, "quality", function ( f53_arg0 )
			local f53_local0 = tonumber( Engine.TableLookup( CSV.streakLootMaster.file, CSV.streakLootMaster.cols.index, tostring( f53_arg0 ), CSV.streakLootMaster.cols.quality ) )
			if f53_local0 then
				local f53_local1 = f53_local0
			end
			return f53_local1 or 0
		end )
		return {
			baseRef = f52_local1,
			icon = f52_local1:FilterTo( f52_local3, "icon", Cac.GetStreakImage ),
			smallImage = f52_local1:FilterTo( f52_local3, "smallImage", Cac.GetSmallImage ),
			fullImage = LUI.AggregateDataSource.new( f52_local1, {
				f52_local1,
				f52_local2
			}, "fullImage", function ( f56_arg0 )
				local f56_local0 = f52_local1:GetValue( f56_arg0 )
				local f56_local1 = f52_local2:GetValue( f56_arg0 )
				if f56_local1 == Cac.LootIDNoneValue then
					return Cac.GetStreakFullImage( f56_local0 )
				else
					return Engine.TableLookup( CSV.streakLootMaster.file, CSV.streakLootMaster.cols.index, f56_local1, CSV.streakLootMaster.cols.displayImage )
				end
			end
			 ),
			score = LUI.AggregateDataSource.new( f52_local1, {
				f52_local1,
				f52_local2,
				f51_arg1
			}, "displayCost", function ( f55_arg0 )
				local f55_local0 = f51_arg1:GetValue( f55_arg0 ) == "specialty_support_killstreaks"
				local f55_local1 = f52_local1:GetValue( f55_arg0 )
				local f55_local2 = f52_local2:GetValue( f55_arg0 )
				local f55_local3 = Cac.GetLootStreakRef( f55_local2 )
				if f55_local3 == "" then
					f55_local3 = f55_local1
				end
				return Cac.GetStreakDisplayPointsCost( f55_local3, f55_local2, f55_local0 )
			end
			 ),
			name = LUI.AggregateDataSource.new( f52_local1, {
				f52_local1,
				f52_local2
			}, "name", function ( f54_arg0 )
				local f54_local0 = f52_local2:GetValue( f54_arg0 )
				if f52_local4:GetValue( f54_arg0 ) > 0 then
					local f54_local1 = Engine.Localize( Engine.TableLookup( CSV.streakLootMaster.file, CSV.streakLootMaster.cols.index, tostring( f54_local0 ), CSV.streakLootMaster.cols.displayName ) )
					if f54_local1 ~= "" then
						return f54_local1
					end
				end
				return Cac.GetStreakName( f52_local1:GetValue( f54_arg0 ) )
			end
			 ),
			desc = f52_local1:FilterTo( f52_local3, "desc", Cac.GetStreakDesc ),
			quality = f52_local4,
			qualityColor = f52_local4:FilterTo( f52_local3, "qualityColor", Cac.GetLootQualityColor ),
			qualityString = f52_local4:FilterTo( f52_local3, "qualityString", Cac.GetLootQualityString ),
			qualityImage = f52_local4:FilterTo( f52_local3, "qualityImage", Cac.GetLootQualityImage ),
			used = f52_local1:FilterTo( f52_local3, "used", Cac.IsStreakInUse )
		}
	end
	
end

local f0_local24 = function ( f57_arg0, f57_arg1, f57_arg2, f57_arg3 )
	return {
		perk = LUI.LazyDataSource.new( function ()
			return f57_arg1:GetDataSourceAtIndex( f57_arg0, f57_arg3 )
		end
		 ),
		extraPerk = LUI.LazyDataSource.new( function ()
			return f57_arg2:GetDataSourceAtIndex( f57_arg0, f57_arg3 )
		end
		 )
	}
end

local f0_local25 = function ( f60_arg0 )
	return function ( f61_arg0 )
		for f61_local0 = Cac.FirstStreakIndex, Cac.LastStreakIndex, 1 do
			local f61_local3 = f60_arg0:GetDataSourceAtIndex( f61_local0, f61_arg0 )
			if f61_local3.used:GetValue( f61_arg0 ) then
				return true
			end
		end
		return false
	end
	
end

local f0_local26 = function ( f62_arg0, f62_arg1, f62_arg2 )
	local f62_local0 = f0_local20()
	local f62_local1 = f62_arg2
	local f62_local2 = f62_arg0.archetypePerk
	local f62_local3 = tonumber( Cac.LowestQuality )
	local f62_local4 = {
		icon = f62_local2:FilterTo( f62_arg1, "perk.icon", Cac.GetPerkImage ),
		quality = f62_local0( f62_local1 .. ".quality", f62_local3 ),
		qualityColor = f62_local0( f62_local1 .. ".qualityColor", Cac.GetLootQualityColor( f62_local3 ) ),
		qualityImage = f62_local0( f62_local1 .. ".qualityImage", Cac.GetLootQualityImage( f62_local3 ) ),
		fullImage = f62_local2:FilterTo( f62_arg1, "perk.fullImage", Cac.GetPerkFullImage ),
		name = f62_local2:FilterTo( f62_arg1, "perk.name", Cac.GetPerkName )
	}
	if Engine.InFrontend() then
		f62_local4.ref = f62_local2
		f62_local4.desc = f62_local2:FilterTo( f62_arg1, "perk.desc", Cac.GetPerkDesc )
		f62_local4.manufacturersImage = f62_local2:FilterTo( f62_arg1, "perk.manufacturersImage", Cac.GetSuperManufacturersImage )
		f62_local4.qualityString = LUI.DataSourceInGlobalModel.new( f62_local1 .. ".qualityString", Cac.GetLootQualityString( f62_local3 ) )
	end
	return f62_local4
end

local f0_local27 = function ( f63_arg0, f63_arg1 )
	local f63_local0 = f63_arg0.archetypeSuper
	local f63_local1 = {
		icon = f63_local0:FilterTo( f63_arg1, "super.icon", Cac.GetSuperImage ),
		fullImage = f63_local0:FilterTo( f63_arg1, "super.fullImage", Cac.GetSuperFullImage ),
		name = f63_local0:FilterTo( f63_arg1, "super.name", Cac.GetSuperName )
	}
	if Engine.InFrontend() then
		f63_local1.ref = f63_local0
		f63_local1.desc = f63_local0:FilterTo( f63_arg1, "super.desc", Cac.GetSuperDesc )
		f63_local1.manufacturersImage = f63_local0:FilterTo( f63_arg1, "super.manufacturersImage", Cac.GetSuperManufacturersImage )
	end
	return f63_local1
end

local f0_local28 = function ( f64_arg0 )
	local f64_local0 = f0_local20()
	local f64_local1 = f0_local18
	local f64_local2 = f64_local0( f64_local1 )
	local f64_local3 = nil
	if Engine.InFrontend() then
		f64_local3 = f64_arg0.archetype
	else
		local f64_local4 = LUI.DataSourceFromOmnvar.new( "ui_selected_archetype" )
		f64_local3 = f64_local4:Filter( "rigRef", function ( f65_arg0 )
			return Engine.TableLookup( CSV.battleRigs.file, CSV.battleRigs.cols.index, f65_arg0, CSV.battleRigs.cols.ref )
		end )
	end
	local f64_local4 = {
		name = f64_local3:FilterTo( f64_local2, "name", Cac.GetRigName ),
		rigHeadshot = f64_local3:FilterTo( f64_local2, "headshot", Cac.GetRigHeadshot )
	}
	if Engine.InFrontend() then
		local f64_local5 = tonumber( Cac.LowestQuality )
		local f64_local6 = f64_local0( f64_local1 .. ".quality", f64_local5 )
		f64_local4.rigRef = f64_local3
		f64_local4.fullImage = f64_arg0.archetypeSuper:FilterTo( f64_local2, "fullImage", Cac.GetSuperFullImage )
		f64_local4.desc = f64_local3:FilterTo( f64_local2, "desc", Cac.GetRigDesc )
		f64_local4.qualityString = LUI.DataSourceInGlobalModel.new( f64_local1 .. ".qualityString", Cac.GetLootQualityString( f64_local5 ) )
		f64_local4.used = f64_local3:FilterTo( f64_local2, "used", Cac.IsRigInUse )
		f64_local4.rigIndex = f64_local3:FilterTo( f64_local2, "rigIndex", function ( f66_arg0 )
			return string.format( "%02d", Cac.GetRigIndex( f66_arg0 ) + 1 )
		end )
		f64_local4.rigIcon = f64_local3:FilterTo( f64_local2, "rigIcon", Cac.GetRigIcon )
		f64_local4.rigPortrait = f64_local3:FilterTo( f64_local2, "rigPortrait", Cac.GetRigPortrait )
		f64_local4.rigDescription = f64_local3:FilterTo( f64_local2, "rigDescription", Cac.GetRigDesc )
		f64_local4.icon = f64_arg0.archetypeSuper:FilterTo( f64_local2, "icon", Cac.GetSuperImage )
		f64_local4.superIconFull = f64_arg0.archetypeSuper:FilterTo( f64_local2, "superIconFull", Cac.GetSuperFullImage )
		f64_local4.superName = f64_arg0.archetypeSuper:FilterTo( f64_local2, "superName", Cac.GetSuperName )
		f64_local4.archetypePerk = f0_local26( f64_arg0, f64_local2, f64_local1 )
		f64_local4.archetypeSuper = f0_local27( f64_arg0, f64_local2 )
		f64_local4.quality = f64_local6
		f64_local4.qualityColor = f64_local0( f64_local1 .. ".qualityColor", Cac.GetLootQualityColor( f64_local5 ) )
		f64_local4.qualityImage = f64_local0( f64_local1 .. ".qualityImage", Cac.GetLootQualityImage( f64_local5 ) )
		f64_local4.manufacturersImage = f64_local3:FilterTo( f64_local2, "manufacturersImage", Cac.GetRigManufacturersImage )
	end
	return f64_local4
end

local f0_local29 = function ( f67_arg0, f67_arg1, f67_arg2, f67_arg3, f67_arg4, f67_arg5 )
	local f67_local0 = {}
	for f67_local1 = 0, f67_arg1:GetCountValue( f67_arg0 ) - 1, 1 do
		local f67_local4 = f67_arg1:GetDataSourceAtIndex( f67_local1, f67_arg0 )
		table.insert( f67_local0, f67_local4.used )
		table.insert( f67_local0, f67_local4.attachments.attachmentSlotOne.used )
		table.insert( f67_local0, f67_local4.attachments.attachmentSlotTwo.used )
		table.insert( f67_local0, f67_local4.attachments.attachmentSlotThree.used )
		table.insert( f67_local0, f67_local4.attachments.attachmentSlotFour.used )
		table.insert( f67_local0, f67_local4.attachments.attachmentSlotFive.used )
		if f67_local1 == 0 then
			table.insert( f67_local0, f67_local4.attachments.attachmentSlotSix.used )
		end
	end
	for f67_local1 = 0, f67_arg3:GetCountValue( f67_arg0 ) - 1, 1 do
		local f67_local4 = table.insert
		local f67_local5 = f67_local0
		local f67_local6 = f67_arg3:GetDataSourceAtIndex( f67_local1, f67_arg0 )
		f67_local4( f67_local5, f67_local6.used )
	end
	for f67_local1 = 0, f67_arg4:GetCountValue( f67_arg0 ) - 1, 1 do
		local f67_local4 = table.insert
		local f67_local5 = f67_local0
		local f67_local6 = f67_arg4:GetDataSourceAtIndex( f67_local1, f67_arg0 )
		f67_local4( f67_local5, f67_local6.used )
	end
	for f67_local1 = 0, f67_arg2:GetCountValue( f67_arg0 ) - 1, 1 do
		local f67_local4 = table.insert
		local f67_local5 = f67_local0
		local f67_local6 = f67_arg2:GetDataSourceAtIndex( f67_local1, f67_arg0 )
		f67_local4( f67_local5, f67_local6.used )
		f67_local4 = table.insert
		f67_local5 = f67_local0
		f67_local6 = f67_arg2:GetDataSourceAtIndex( f67_local1, f67_arg0 )
		f67_local4( f67_local5, f67_local6.extraUsed )
	end
	table.insert( f67_local0, f67_arg5 )
	return f67_local0
end

local f0_local30 = function ( f68_arg0 )
	return function ( f69_arg0, f69_arg1 )
		return f68_arg0 + 1 <= f69_arg0
	end
	
end

local f0_local31 = function ( f70_arg0, f70_arg1, f70_arg2, f70_arg3, f70_arg4, f70_arg5, f70_arg6, f70_arg7 )
	return function ()
		return LUI.AggregateDataSource.new( LUI.DataSourceInGlobalModel.new( f70_arg1 ), f0_local29( f70_arg7, f70_arg2, f70_arg3, f70_arg4, f70_arg5, f70_arg6 ), "pointCount", function ( f72_arg0 )
			return Cac.GetPointCountForLoadout( f70_arg0, f72_arg0 )
		end
		 )
	end
	
end

function DecorateLoadout( f73_arg0 )
	return function ( f74_arg0, f74_arg1, f74_arg2 )
		local f74_local0 = f0_local20()
		local f74_local1 = Cac.playerDataDataSourceModelPath .. "." .. f74_arg0
		local f74_local2 = f74_arg1.overkill:Filter( "overkillBool", function ( f75_arg0, f75_arg1 )
			return f75_arg0 == 1
		end )
		local f74_local3 = f74_arg1.powerSetups:Decorate( f0_local21( f74_local1 ) )
		f74_local3:SetCachingEnabled( true )
		local f74_local4 = f74_arg1.weaponSetups:Decorate( LOADOUT.GetLootWeaponDecorator( f74_local1, f74_arg2 ) )
		f74_local4:SetCachingEnabled( true )
		local f74_local5 = f74_arg1.loadoutPerks:Decorate( f0_local22( false, f74_local1 ) )
		f74_local5:SetCachingEnabled( true )
		local f74_local6 = f74_arg1.extraPerks:Decorate( f0_local22( true, f74_local1 .. ".extra", f74_local5 ) )
		f74_local6:SetCachingEnabled( true )
		local f74_local7 = f73_arg0
		if f74_local7 then
			f74_local7 = not Engine.IsUnlocked( f74_arg2, "feature", "loadoutslot" .. f74_arg0 )
		end
		local f74_local8 = f74_local0( f74_local1 .. ".isLoadoutLocked", f74_local7 )
		f74_local8:SetValue( f74_arg2, f74_local7 )
		local f74_local9 = {
			loadoutIndex = f74_arg0,
			weaponSlotOne = LUI.LazyDataSource.new( function ()
				return f74_local4:GetDataSourceAtIndex( 0, f74_arg2 )
			end
			 ),
			weaponSlotTwo = LUI.LazyDataSource.new( function ()
				return f74_local4:GetDataSourceAtIndex( 1, f74_arg2 )
			end
			 ),
			powers = f74_local3,
			powerSlotOne = LUI.LazyDataSource.new( function ()
				return f74_local3:GetDataSourceAtIndex( 0, f74_arg2 )
			end
			 ),
			powerSlotTwo = LUI.LazyDataSource.new( function ()
				return f74_local3:GetDataSourceAtIndex( 1, f74_arg2 )
			end
			 ),
			perkSlotOne = f0_local24( 0, f74_local5, f74_local6, f74_arg2 ),
			perkSlotTwo = f0_local24( 1, f74_local5, f74_local6, f74_arg2 ),
			perkSlotThree = f0_local24( 2, f74_local5, f74_local6, f74_arg2 ),
			overkill = LUI.LazyDataSource.new( function ()
				local f80_local0 = {
					used = f74_local2,
					usedInt = REG5
				}
				if Engine.InFrontend() then
					local f80_local1 = LUI.DataSourceFromList.new( Cac.POINT_COSTS.overkill )
					f80_local1.MakeDataSourceAtIndex = LOADOUT.GetPointCostDataSourceAtIndex( f74_local2 )
					f80_local0.pointCost = f80_local1
					f80_local0.weaponRef = LUI.DataSourceInGlobalModel.new( f74_local1 .. ".overkill.weaponRef", nil )
					f80_local0.passives = LUI.DataSourceFromList.new( 0 )
					f80_local0.fireModes = LUI.DataSourceFromList.new( 0 )
				end
				return f80_local0
			end
			 ),
			isLoadoutLocked = f74_local8
		}
		if Engine.InFrontend() then
			local f74_local10 = LUI.LazyDataSource.new( f0_local31( f74_local9, f74_local1, f74_local4, f74_local3, f74_local5, f74_local6, f74_local2, f74_arg2 ) )
			local f74_local11 = f74_local10:Filter( "pointCountText", function ( f81_arg0, f81_arg1 )
				return Engine.Localize( "LUA_MENU_POINTS_REMAINING", f81_arg0 )
			end )
			local f74_local12 = LUI.DataSourceFromList.new( Cac.PointMax )
			f74_local12.MakeDataSourceAtIndex = function ( f82_arg0, f82_arg1, f82_arg2 )
				return {
					gridIndex = f82_arg1,
					isActive = f74_local10:Filter( "isActive" .. f82_arg1, f0_local30( f82_arg1 ) )
				}
			end
			
			f74_local12:SetCachingEnabled( true )
			f74_local9.points = f74_local12
			f74_local9.pointCountText = f74_local11
			f74_local9.pointCount = f74_local10
			f74_local9.arePointsFull = f74_local10:Filter( "full", Cac.ArePointsFull )
			f74_local9.index = LUI.DataSourceInGlobalModel.new( f74_local1 .. ".index", f74_arg0 )
		end
		return f74_local9
	end
	
end

local f0_local32 = function ( f83_arg0 )
	local f83_local0 = {
		loadouts = f83_arg0.loadouts:Decorate( DecorateLoadout( true ) ),
		statsGroup = f83_arg0,
		rig = LUI.LazyDataSource.new( function ()
			return f0_local28( f83_arg0 )
		end
		 )
	}
	if Engine.InFrontend() then
		local f83_local1 = f83_arg0.killstreakSetups:Decorate( f0_local23( f0_local19, f83_arg0.archetypePerk ) )
		f83_local0.streaks = f83_local1
		local f83_local2 = f83_local1:GetCountValue()
		local f83_local3 = LUI.DataSourceFromList.new( f83_local2 )
		f83_local3.MakeDataSourceAtIndex = function ( f85_arg0, f85_arg1, f85_arg2 )
			return f83_local1:GetDataSourceAtIndex( Mirror( f85_arg1, 0, f83_local2 - 1 ), f85_arg2 )
		end
		
		f83_local0.reverseStreaks = f83_local3
	end
	return f83_local0
end

function GetCACPlayerDataDataSource( f86_arg0 )
	return f0_local32( f86_arg0 )
end

function GetSquadMemberDataSource()
	if IsPublicMatch() then
		return DataSources.alwaysLoaded.playerData.MP.rankedloadouts.squadMembers
	else
		return DataSources.alwaysLoaded.playerData.MP.privateloadouts.squadMembers
	end
end

function InitCacCommonDataSources()
	LOADOUT.InitPassiveDataSources( "frontEnd.MP.CAC" )
	LOADOUT.InitFireModeDataSources( "frontEnd.MP.CAC" )
	InitCommonWeaponData()
end

function InitCacFrontEndDataSources()
	InitFrontEndWeaponDataSources()
	f0_local12()
	f0_local11()
	f0_local14()
	f0_local17()
	f0_local8()
end

