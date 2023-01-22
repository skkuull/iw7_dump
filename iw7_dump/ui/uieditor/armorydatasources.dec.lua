local f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3 )
	local f1_local0, f1_local1, f1_local2, f1_local3, f1_local4 = nil
	if f1_arg3 then
		f1_local0 = Engine.GetDvarInt( "online_quartermaster_event_crate_price_key" )
		f1_local1 = Engine.GetDvarInt( "online_quartermaster_event_crate_price_cp" )
		f1_local2 = Engine.GetDvarInt( "online_quartermaster_event_crate_price_scrap" )
		f1_local3 = Engine.GetDvarInt( "online_quartermaster_event_dwid" )
		f1_local4 = Engine.GetDvarInt( "online_quartermaster_event_cp_id" )
	else
		local f1_local5 = tonumber( Engine.TableLookup( CSV.lootCrate.file, CSV.lootCrate.cols.ref, f1_arg2, CSV.lootCrate.cols.cost ) )
		if not f1_local5 then
			DebugPrint( "ERROR - Unable to find cost for " .. f1_arg2 .. " in loot crate files! Check that the client files have data for the crateRef specified by the server!" )
			f1_local5 = 0
		end
		f1_local0 = CoD.GetAdjustedCurrency( f1_local5 )
		f1_local1 = tonumber( Engine.TableLookup( CSV.lootCrate.file, CSV.lootCrate.cols.ref, f1_arg2, CSV.lootCrate.cols.premiumCost ) )
		f1_local2 = tonumber( Engine.TableLookup( CSV.lootCrate.file, CSV.lootCrate.cols.ref, f1_arg2, CSV.lootCrate.cols.salvageCost ) )
		f1_local3 = Engine.TableLookup( CSV.lootCrate.file, CSV.lootCrate.cols.ref, f1_arg2, CSV.lootCrate.cols.index )
		f1_local4 = Engine.TableLookup( CSV.lootCrate.file, CSV.lootCrate.cols.ref, f1_arg2, CSV.lootCrate.cols.CODPointsSKU )
	end
	f1_arg0.cost = LUI.DataSourceInGlobalModel.new( f1_arg1 .. ".cost", f1_local0 )
	f1_arg0.identifier = LUI.DataSourceInGlobalModel.new( f1_arg1 .. ".identifier", f1_local3 )
	f1_arg0.premiumCost = LUI.DataSourceInGlobalModel.new( f1_arg1 .. ".premiumCost", f1_local1 )
	f1_arg0.scrapCost = LUI.DataSourceInGlobalModel.new( f1_arg1 .. ".scrapCost", f1_local2 )
	f1_arg0.CODPointsID = LUI.DataSourceInGlobalModel.new( f1_arg1 .. ".CODPointsID", f1_local4 )
end

function InitLootCrateDataSources()
	f0_local0( DataSources.frontEnd.MP.armory.commonCrate, "frontEnd.MP.armory.commonCrate", ARMORY.commonCrate, false )
	f0_local0( DataSources.frontEnd.MP.armory.rareCrate, "frontEnd.MP.armory.rareCrate", ARMORY.rareCrate, false )
	f0_local0( DataSources.frontEnd.MP.armory.zombieCrate, "frontEnd.MP.armory.zombieCrate", ARMORY.zombieCrate, false )
	f0_local0( DataSources.frontEnd.MP.armory.zombieRareCrate, "frontEnd.MP.armory.zombieRareCrate", ARMORY.zombieRareCrate, false )
	InitEventCrateDataSourcesIfNeeded()
end

function InitEventCrateDataSourcesIfNeeded()
	if CONDITIONS.IsEventCrateAllowed() and DataSources.frontEnd.MP.armory.eventCrate == nil then
		local f3_local0 = ARMORY.GetEventCrateRef()
		if f3_local0 then
			DataSources.frontEnd.MP.armory.eventCrate = {}
			f0_local0( DataSources.frontEnd.MP.armory.eventCrate, "frontEnd.MP.armory.eventCrate", f3_local0, true )
		end
	end
end

function RefreshEventCrateDataSources( f4_arg0 )
	if CONDITIONS.IsEventCrateAllowed() then
		if DataSources.frontEnd.MP.armory.eventCrate == nil then
			InitEventCrateDataSourcesIfNeeded()
		else
			local f4_local0 = Engine.GetDvarInt( "online_quartermaster_event_crate_price_key" )
			local f4_local1 = Engine.GetDvarInt( "online_quartermaster_event_crate_price_cp" )
			local f4_local2 = Engine.GetDvarInt( "online_quartermaster_event_crate_price_scrap" )
			local f4_local3 = Engine.GetDvarInt( "online_quartermaster_event_dwid" )
			local f4_local4 = Engine.GetDvarInt( "online_quartermaster_event_cp_id" )
			DataSources.frontEnd.MP.armory.eventCrate.cost:SetValue( f4_arg0, f4_local0 )
			DataSources.frontEnd.MP.armory.eventCrate.identifier:SetValue( f4_arg0, f4_local3 )
			DataSources.frontEnd.MP.armory.eventCrate.premiumCost:SetValue( f4_arg0, f4_local1 )
			DataSources.frontEnd.MP.armory.eventCrate.scrapCost:SetValue( f4_arg0, f4_local2 )
			DataSources.frontEnd.MP.armory.eventCrate.CODPointsID:SetValue( f4_arg0, f4_local4 )
		end
	end
end

function InitArmoryDataSources()
	InitLootCrateDataSources()
end

