WEAPON_BUILD = {}
local f0_local0 = "frontEnd.CP.weaponBuild"
local f0_local1 = "frontEnd.CP"
WEAPON_BUILD.WipeCPWeaponBuildDataModels = function ()
	WipeGlobalModelsAtPath( f0_local0 )
end

CP_WEAPON_CLASS_LIST = {}
CP_WEAPON_ROW_LIST = {}
WEAPON_BUILD.GetWeaponDataSourceForKey = function ( f2_arg0, f2_arg1 )
	assert( DataSources.frontEnd.CP.weaponSetups )
	local f2_local0 = LOADOUT.GetLootWeaponDecorator( f0_local0, f2_arg1 )
	return f2_local0( f2_arg0, DataSources.frontEnd.CP.weaponSetups[f2_arg0] )
end

WEAPON_BUILD.InitCPLoadoutDataSources = function ()
	CP_WEAPON_CLASS_LIST = LOADOUT.BuildWeaponClassList( 2 )
	CP_WEAPON_ROW_LIST = LOADOUT.BuildWeaponRowList()
	LOADOUT.InitCamoList()
	LOADOUT.InitWeaponVariantsList()
	LOADOUT.InitWeaponLootOverrideData()
	LOADOUT.InitWeaponLootMasterIDs()
	LOADOUT.InitPassiveDataSources( f0_local0 )
	LOADOUT.InitFireModeDataSources( f0_local0 )
	DataSources.frontEnd.CP.weaponSetups = DataSources.alwaysLoaded.playerData.CP.zombiePlayerLoadout.zombiePlayerWeaponModels
	DataSources.frontEnd.CP.reticles = LUI.DataSourceInGlobalModel.new( f0_local1 .. ".reticles" )
	LOADOUT.InitReticleDataSources( DataSources.frontEnd.CP.reticles )
end

