local f0_local0 = "inGame.SP.loadouts"
local f0_local1 = function ()
	local f1_local0 = Engine.GetDvarBool( "g_specialistMode" )
	local f1_local1 = {}
	for f1_local2 = 0, Engine.TableGetRowCount( CSV.powers.file ), 1 do
		local f1_local5 = CSV.ReadRow( CSV.powers, f1_local2 )
		if f1_local5.ref ~= "" and f1_local5.ref ~= Cac.powerNoneValue and f1_local5.showInMenus == "TRUE" and (f1_local5.isSpecialistOnly ~= "TRUE" or f1_local5.isSpecialistOnly == "TRUE" and f1_local0) then
			local f1_local6 = tonumber( f1_local5.slot )
			if not f1_local1[f1_local6] then
				f1_local1[f1_local6] = {}
			end
			f1_local1[f1_local6][f1_local5.ref] = {
				name = f1_local5.name,
				desc = f1_local5.desc,
				image = f1_local5.image,
				smallRender = f1_local5.smallRender,
				fullImage = f1_local5.imageLarge,
				upgradeOneCost = tonumber( f1_local5.upgradeOneCost ),
				upgradeTwoCost = tonumber( f1_local5.upgradeTwoCost ),
				ref = f1_local5.ref,
				index = CountTableKeys( f1_local1[f1_local6] )
			}
		end
	end
	return f1_local1
end

local f0_local2 = function ( f2_arg0 )
	f2_arg0.powers = LUI.DataSourceFromList.new( 2 )
	f2_arg0.powers.MakeDataSourceAtIndex = function ( f3_arg0, f3_arg1, f3_arg2 )
		return f2_arg0.powers["slot" .. f3_arg1]
	end
	
	f2_arg0.powers:SetCachingEnabled( true )
	for f2_local0 = 0, 1, 1 do
		local f2_local3 = "slot" .. f2_local0
		f2_arg0.powers[f2_local3] = LUI.DataSourceFromList.new( CountTableKeys( SP_POWER_ROW_LIST[f2_local0] ) )
		f2_arg0.powers[f2_local3].MakeDataSourceAtIndex = function ( f4_arg0, f4_arg1, f4_arg2 )
			return f2_arg0.powers[f2_local3]["power" .. f4_arg1]
		end
		
		f2_arg0.powers[f2_local3]:SetCachingEnabled( true )
		local f2_local4 = f2_arg0.powers[f2_local3]
		for f2_local10, f2_local11 in pairs( SP_POWER_ROW_LIST[f2_local0] ) do
			local f2_local12 = "power" .. f2_local11.index
			if not f2_local4[f2_local12] then
				f2_local4[f2_local12] = {}
			end
			local f2_local8 = f2_local4[f2_local12]
			local f2_local9 = f2_local11.name
			f2_local8.ref = f2_arg0:GetDataSourceForSubmodel( f2_local9 .. ".ref", f2_local11.ref )
			f2_local8.name = f2_arg0:GetDataSourceForSubmodel( f2_local9 .. ".name", f2_local9 )
			f2_local8.desc = f2_arg0:GetDataSourceForSubmodel( f2_local9 .. ".desc", f2_local11.desc )
			f2_local8.image = f2_arg0:GetDataSourceForSubmodel( f2_local9 .. ".image", f2_local11.image )
			f2_local8.smallRender = f2_arg0:GetDataSourceForSubmodel( f2_local9 .. ".smallRender", f2_local11.smallRender )
			f2_local8.fullImage = f2_arg0:GetDataSourceForSubmodel( f2_local9 .. ".fullImage", f2_local11.fullImage )
			f2_local8.upgradeOneCost = f2_arg0:GetDataSourceForSubmodel( f2_local9 .. ".upgradeOne", f2_local11.upgradeOneCost )
			f2_local8.upgradeTwoCost = f2_arg0:GetDataSourceForSubmodel( f2_local9 .. ".upgradeTwo", f2_local11.upgradeTwoCost )
		end
	end
end

function WipeSPLoadoutDataModels()
	WipeGlobalModelsAtPath( f0_local0 )
end

local f0_local3 = function ( f6_arg0 )
	return function ( f7_arg0, f7_arg1 )
		return Cac.GetAttachmentRef( f7_arg0, f6_arg0.weapon:GetValue( f7_arg1 ) )
	end
	
end

local f0_local4 = function ( f8_arg0, f8_arg1, f8_arg2 )
	return function ( f9_arg0, f9_arg1, f9_arg2 )
		local f9_local0 = LUI.DataSourceInGlobalModel.new( f8_arg1 .. ".weapon." .. f8_arg2 .. "attachment." .. f9_arg0 )
		local f9_local1 = f9_arg1:FilterTo( f9_local0, "attachUniqueRef", f0_local3( f8_arg0 ) )
		return {
			uniqueRef = f9_arg1,
			ref = f9_arg1,
			icon = f9_local1:FilterTo( f9_local0, "icon", Cac.GetAttachmentImage ),
			fullImage = f9_local1:FilterTo( f9_local0, "fullImage", Cac.GetAttachmentFullImage ),
			used = f9_local1:FilterTo( f9_local0, "used", Cac.IsAttachmentSlotInUse ),
			name = f9_local1:FilterTo( f9_local0, "name", Cac.GetAttachmentName ),
			desc = f9_local1:FilterTo( f9_local0, "desc", Cac.GetAttachmentDesc ),
			disabled = LUI.AggregateDataSource.new( f9_local1, {
				f8_arg0.weapon
			}, "disabled", function ( f10_arg0 )
				return not Cac.DoesWeaponHaveAttachmentsByCategory( f8_arg0.weapon:GetValue( f10_arg0 ), Cac.BaseLootID, f10_arg0, Cac.GetCategoryBySlotIndex( f9_arg0 ) )
			end
			 ),
			emptyString = f9_local0:GetDataSourceForSubmodel( "emptyString", Cac.GetAttachmentEmptyString( f9_arg0 ) ),
			stats = {
				accuracy = f9_local1:FilterTo( f9_local0, "stats.accuracy", Cac.GetAttachmentStatAccuracy ),
				damage = f9_local1:FilterTo( f9_local0, "stats.damage", Cac.GetAttachmentStatDamage ),
				range = f9_local1:FilterTo( f9_local0, "stats.range", Cac.GetAttachmentStatRange ),
				fireRate = f9_local1:FilterTo( f9_local0, "stats.fireRate", Cac.GetAttachmentStatFireRate ),
				mobility = f9_local1:FilterTo( f9_local0, "stats.mobility", Cac.GetAttachmentStatMobility )
			},
			weaponIndex = f8_arg2,
			index = f9_arg0,
			fireModes = LUI.DataSourceFromList.new( 0 )
		}
	end
	
end

local f0_local5 = function ( f11_arg0 )
	return function ( f12_arg0, f12_arg1, f12_arg2 )
		local f12_local0 = f12_arg1.attachment:Decorate( f0_local4( f12_arg1, f11_arg0, f12_arg0 ) )
		f12_local0:SetCachingEnabled( true )
		local f12_local1 = {}
		for f12_local2 = 0, Cac.SPAttachmentCount - 1, 1 do
			local f12_local5 = f12_local2
			table.insert( f12_local1, LUI.LazyDataSource.new( function ()
				return f12_local0:GetDataSourceAtIndex( f12_local5, f12_arg2 )
			end ) )
		end
		local f12_local2 = LUI.DataSourceInGlobalModel.new( f11_arg0 .. ".weapon." .. f12_arg0 )
		local f12_local4 = LUI.DataSourceFromList.new( f12_arg1.weapon:FilterTo( f12_local2, "fireModesCount", function ( f14_arg0 )
			return #Cac.GetFireModesForWeapon( f14_arg0 )
		end ) )
		f12_local4.GetDataSourceAtIndex = function ( f15_arg0, f15_arg1, f15_arg2 )
			return {
				fireMode = {
					name = f12_arg1.weapon:FilterTo( f12_local2, "fireModes." .. f15_arg1 .. ".name", function ( f16_arg0 )
						return Cac.GetFireModeFieldValue( f16_arg0, "name", f15_arg1, f15_arg2 )
					end
					 ),
					icon = f12_arg1.weapon:FilterTo( f12_local2, "fireModes." .. f15_arg1 .. ".icon", function ( f17_arg0 )
						return Cac.GetFireModeFieldValue( f17_arg0, "image", f15_arg1, f15_arg2 )
					end
					 )
				}
			}
		end
		
		return {
			slot = f12_local2:GetDataSourceForSubmodel( "slot", f12_arg0 ),
			icon = f12_arg1.weapon:FilterTo( f12_local2, "icon", Cac.GetWeaponImage ),
			fullImage = f12_arg1.weapon:FilterTo( f12_local2, "fullImage", Cac.GetWeaponFullImage ),
			used = f12_arg1.weapon:FilterTo( f12_local2, "used", Cac.IsWeaponSlotInUse ),
			name = f12_arg1.weapon:FilterTo( f12_local2, "name", Cac.GetWeaponName ),
			desc = f12_arg1.weapon:FilterTo( f12_local2, "desc", Cac.GetWeaponDesc ),
			attachments = {
				attachmentSlotOne = f12_local1[1],
				attachmentSlotTwo = f12_local1[2],
				attachmentSlotThree = f12_local1[3]
			},
			stats = {
				accuracy = f12_arg1.weapon:FilterTo( f12_local2, "stats.accuracy", Cac.GetWeaponStatAccuracy ),
				damage = f12_arg1.weapon:FilterTo( f12_local2, "stats.damage", Cac.GetWeaponStatDamage ),
				range = f12_arg1.weapon:FilterTo( f12_local2, "stats.range", Cac.GetWeaponStatRange ),
				fireRate = f12_arg1.weapon:FilterTo( f12_local2, "stats.fireRate", Cac.GetWeaponStatFireRate ),
				mobility = f12_arg1.weapon:FilterTo( f12_local2, "stats.mobility", Cac.GetWeaponStatMobility )
			},
			attachmentStats = {
				accuracy = LUI.AggregateDataSource.new( f12_local2, f12_local1, "attachmentStats.accuracy", function ( f18_arg0 )
					return Cac.GetAttachmentStatSum( f12_local1, "accuracy", f18_arg0 )
				end
				 ),
				damage = LUI.AggregateDataSource.new( f12_local2, f12_local1, "attachmentStats.damage", function ( f19_arg0 )
					return Cac.GetAttachmentStatSum( f12_local1, "damage", f19_arg0 )
				end
				 ),
				range = LUI.AggregateDataSource.new( f12_local2, f12_local1, "attachmentStats.range", function ( f20_arg0 )
					return Cac.GetAttachmentStatSum( f12_local1, "range", f20_arg0 )
				end
				 ),
				fireRate = LUI.AggregateDataSource.new( f12_local2, f12_local1, "attachmentStats.fireRate", function ( f21_arg0 )
					return Cac.GetAttachmentStatSum( f12_local1, "fireRate", f21_arg0 )
				end
				 ),
				mobility = LUI.AggregateDataSource.new( f12_local2, f12_local1, "attachmentStats.mobility", function ( f22_arg0 )
					return Cac.GetAttachmentStatSum( f12_local1, "mobility", f22_arg0 )
				end
				 )
			},
			fireModes = f12_local4
		}
	end
	
end

local f0_local6 = function ( f23_arg0, f23_arg1 )
	return function ( f24_arg0, f24_arg1, f24_arg2 )
		local f24_local0 = LUI.DataSourceInGlobalModel.new( f23_arg0 .. f24_arg0 )
		return {
			ref = f24_arg1,
			icon = f24_arg1:FilterTo( f24_local0, "icon", Cac.GetPowerSmallRender ),
			used = f24_arg1:FilterTo( f24_local0, "used", Cac.IsPowerInUse ),
			fullImage = f24_arg1:FilterTo( f24_local0, "fullImage", Cac.GetPowerImageLarge ),
			name = f24_arg1:FilterTo( f24_local0, "name", Cac.GetPowerName ),
			desc = f24_arg1:FilterTo( f24_local0, "desc", Cac.GetPowerDesc ),
			slot = LUI.DataSourceInGlobalModel.new( "inGame.SP.loadouts.power.slot." .. f24_arg0, f24_arg0 ),
			handSlot = LUI.DataSourceInGlobalModel.new( "inGame.SP.loadouts.power.handSlot." .. f23_arg1, f23_arg1 ),
			fireModes = LUI.DataSourceFromList.new( 0 ),
			extraDisabled = DataSources.inGame.SP.player.suitUpgradeState.extraequipment:Filter( "extraDisabled" .. f23_arg1 .. "." .. f24_arg0, function ( f25_arg0, f25_arg1 )
				local f25_local0
				if f24_arg0 ~= 1 or f25_arg0 ~= Cac.spLockStates.LOCKED then
					f25_local0 = false
				else
					f25_local0 = true
				end
				return f25_local0
			end
			 )
		}
	end
	
end

local f0_local7 = function ( f26_arg0, f26_arg1 )
	return {
		power = LUI.LazyDataSource.new( function ()
			return f26_arg0:GetDataSourceAtIndex( 0, f26_arg1 )
		end
		 ),
		extraPower = LUI.LazyDataSource.new( function ()
			return f26_arg0:GetDataSourceAtIndex( 1, f26_arg1 )
		end
		 )
	}
end

local f0_local8 = function ( f29_arg0, f29_arg1, f29_arg2, f29_arg3 )
	local f29_local0 = LUI.DataSourceInGlobalModel.new( f29_arg1 )
	if f29_arg2 == Cac.JackalEquipSlot.upgrade then
		f29_local0.ref = f29_arg0
		f29_local0.name = f29_arg0:FilterTo( f29_local0, "name", function ( f30_arg0 )
			return Engine.Localize( Cac.GetJackalUpgradeName( f30_arg0 ) )
		end )
		f29_local0.desc = f29_arg0:FilterTo( f29_local0, "desc", function ( f31_arg0 )
			return Engine.Localize( Cac.GetJackalUpgradeDesc( f31_arg0 ) )
		end )
		f29_local0.index = f29_arg0:FilterTo( f29_local0, "index", Cac.GetJackalUpgradeImage )
		f29_local0.image = f29_arg0:FilterTo( f29_local0, "image", Cac.GetJackalUpgradeImage )
		f29_local0.fullImage = f29_arg0:FilterTo( f29_local0, "fullImage", Cac.GetJackalUpgradeImageLarge )
	elseif f29_arg2 == Cac.JackalEquipSlot.decal then
		f29_local0.ref = f29_arg0
		f29_local0.name = f29_arg0:FilterTo( f29_local0, "name", function ( f32_arg0 )
			return Engine.Localize( Cac.GetJackalDecalName( f32_arg0 ) )
		end )
		f29_local0.desc = f29_arg0:FilterTo( f29_local0, "desc", function ( f33_arg0 )
			return Engine.Localize( Cac.GetJackalDecalDesc( f33_arg0 ) )
		end )
		f29_local0.index = f29_arg0:FilterTo( f29_local0, "index", Cac.GetJackalDecalImage )
		f29_local0.image = f29_arg0:FilterTo( f29_local0, "image", Cac.GetJackalDecalImage )
		f29_local0.fullImage = f29_arg0:FilterTo( f29_local0, "fullImage", Cac.GetJackalDecalImageLarge )
	else
		f29_local0.ref = f29_arg0
		f29_local0.name = f29_arg0:FilterTo( f29_local0, "name", function ( f34_arg0 )
			return Engine.Localize( Cac.GetJackalWeaponName( f34_arg0 ) )
		end )
		f29_local0.desc = f29_arg0:FilterTo( f29_local0, "desc", function ( f35_arg0 )
			return Engine.Localize( Cac.GetJackalWeaponDesc( f35_arg0 ) )
		end )
		f29_local0.index = f29_arg0:FilterTo( f29_local0, "index", Cac.GetJackalWeaponImage )
		f29_local0.image = f29_arg0:FilterTo( f29_local0, "image", Cac.GetJackalWeaponImage )
		f29_local0.fullImage = f29_arg0:FilterTo( f29_local0, "fullImage", Cac.GetJackalWeaponImageLarge )
		f29_local0.type = f29_arg0:FilterTo( f29_local0, "type", Cac.GetJackalWeaponType )
	end
	f29_local0.slot = LUI.DataSourceInGlobalModel.new( f29_arg1 .. ".slot", f29_arg2 )
	f29_local0.fireModes = LUI.DataSourceFromList.new( 0 )
	return f29_local0
end

local f0_local9 = function ( f36_arg0, f36_arg1, f36_arg2 )
	local f36_local0 = f36_arg1 .. ".jackalLoadout."
	local f36_local1 = f36_arg0.jackalSetup
	return {
		jackalPrimary = f0_local8( f36_local1.jackalPrimary, f36_local0 .. "jackalPrimary", Cac.JackalEquipSlot.primary, f36_arg2 ),
		jackalSecondary = f0_local8( f36_local1.jackalSecondary, f36_local0 .. "jackalSecondary", Cac.JackalEquipSlot.secondary, f36_arg2 ),
		jackalUpgrade = f0_local8( f36_local1.jackalUpgrade, f36_local0 .. "jackalUpgrade", Cac.JackalEquipSlot.upgrade, f36_arg2 ),
		jackalDecal = f0_local8( f36_local1.jackalDecal, f36_local0 .. "jackalDecal", Cac.JackalEquipSlot.decal, f36_arg2 )
	}
end

local f0_local10 = function ( f37_arg0, f37_arg1, f37_arg2 )
	local f37_local0 = f0_local0 .. "." .. f37_arg0
	local f37_local1 = f37_arg1.weaponSetups:Decorate( f0_local5( f37_local0 ) )
	f37_local1:SetCachingEnabled( true )
	local f37_local2 = f37_arg1.equipment:Decorate( f0_local6( f37_local0 .. ".power.", 1 ) )
	f37_local2:SetCachingEnabled( true )
	local f37_local3 = f37_arg1.offhandEquipment:Decorate( f0_local6( f37_local0 .. ".offHandPower.", 0 ) )
	f37_local3:SetCachingEnabled( true )
	local f37_local4 = f0_local9( f37_arg1, f37_local0, f37_arg2 )
	local f37_local5 = LUI.DataSourceFromOmnvar.new( "ui_loadouts_disabled" )
	return {
		loadoutIndex = f37_arg0,
		slot = LUI.DataSourceInGlobalModel.new( f37_local0 .. ".slot", f37_arg0 ),
		weaponSlotOne = LUI.LazyDataSource.new( function ()
			return f37_local1:GetDataSourceAtIndex( 0, f37_arg2 )
		end
		 ),
		weaponSlotTwo = LUI.LazyDataSource.new( function ()
			return f37_local1:GetDataSourceAtIndex( 1, f37_arg2 )
		end
		 ),
		powers = f0_local7( f37_local2, f37_arg2 ),
		offhandPowers = f0_local7( f37_local3, f37_arg2 ),
		jackalLoadout = f37_local4,
		disabled = f37_local5:Filter( f37_arg0 .. ".disabled", function ( f38_arg0 )
			local f38_local0
			if not f38_arg0 or f37_arg0 == 0 then
				f38_local0 = false
			else
				f38_local0 = true
			end
			return f38_local0
		end
		 )
	}
end

local f0_local11 = function ()
	local f41_local0 = {}
	local f41_local1 = CSV.jackalWeapons
	for f41_local2 = 0, Cac.jackalEquipSlots - 1, 1 do
		local f41_local5 = nil
		if f41_local2 == Cac.JackalEquipSlot.upgrade then
			f41_local1 = CSV.jackalUpgrades
		elseif f41_local2 == Cac.JackalEquipSlot.decal then
			f41_local1 = CSV.jackalDecals
		elseif f41_local2 == Cac.JackalEquipSlot.primary then
			f41_local5 = Cac.JackalWeaponType.primary
		elseif f41_local2 == Cac.JackalEquipSlot.secondary then
			f41_local5 = Cac.JackalWeaponType.secondary
		end
		local f41_local6 = Engine.TableGetRowCount( f41_local1.file )
		for f41_local7 = 0, f41_local6, 1 do
			local f41_local10 = CSV.ReadRow( f41_local1, f41_local7 )
			if (f41_local2 == Cac.JackalEquipSlot.upgrade or f41_local10.type == f41_local5) and f41_local10.ref ~= "" and f41_local10.ref ~= Cac.jackalEquipNone then
				if not f41_local0[f41_local2] then
					f41_local0[f41_local2] = {}
				end
				f41_local0[f41_local2][f41_local10.ref] = {
					name = f41_local10.name,
					desc = f41_local10.desc,
					image = f41_local10.image,
					fullImage = f41_local10.fullImage,
					ref = f41_local10.ref,
					index = CountTableKeys( f41_local0[f41_local2] ),
					unlockText = f41_local10.unlockText
				}
			end
		end
	end
	return f41_local0
end

local f0_local12 = function ( f42_arg0 )
	f42_arg0.jackalItems = LUI.DataSourceFromList.new( Cac.jackalEquipSlots )
	f42_arg0.jackalItems.MakeDataSourceAtIndex = function ( f43_arg0, f43_arg1, f43_arg2 )
		return f42_arg0.jackalItems["slot" .. f43_arg1]
	end
	
	f42_arg0.jackalItems:SetCachingEnabled( true )
	for f42_local0 = 0, Cac.jackalEquipSlots - 1, 1 do
		local f42_local3 = "slot" .. f42_local0
		f42_arg0.jackalItems[f42_local3] = LUI.DataSourceFromList.new( CountTableKeys( SP_JACKAL_ROW_LIST[f42_local0] ) )
		f42_arg0.jackalItems[f42_local3].MakeDataSourceAtIndex = function ( f44_arg0, f44_arg1, f44_arg2 )
			return f42_arg0.jackalItems[f42_local3]["item" .. f44_arg1]
		end
		
		f42_arg0.jackalItems[f42_local3]:SetCachingEnabled( true )
		local f42_local4 = f42_arg0.jackalItems[f42_local3]
		for f42_local10, f42_local11 in pairs( SP_JACKAL_ROW_LIST[f42_local0] ) do
			local f42_local12 = "item" .. f42_local11.index
			if not f42_local4[f42_local12] then
				f42_local4[f42_local12] = {}
			end
			local f42_local8 = f42_local4[f42_local12]
			local f42_local9 = f42_arg0._modelPath .. "." .. f42_local10
			f42_local8.ref = LUI.DataSourceInGlobalModel.new( f42_local9 .. ".ref", f42_local10 )
			f42_local8.name = LUI.DataSourceInGlobalModel.new( f42_local9 .. ".name", f42_local11.name )
			f42_local8.desc = LUI.DataSourceInGlobalModel.new( f42_local9 .. ".desc", f42_local11.desc )
			f42_local8.image = LUI.DataSourceInGlobalModel.new( f42_local9 .. ".image", f42_local11.image )
			f42_local8.fullImage = LUI.DataSourceInGlobalModel.new( f42_local9 .. ".fullImage", f42_local11.fullImage )
			f42_local8.unlockText = LUI.DataSourceInGlobalModel.new( f42_local9 .. ".unlockText", f42_local11.unlockText )
		end
	end
end

local f0_local13 = function ()
	DataSources.inGame.SP.player.weaponsScanned = DataSources.alwaysLoaded.playerData.SP.spData.weaponsScanned
	DataSources.inGame.SP.player.attachmentsState = DataSources.alwaysLoaded.playerData.SP.spData.attachmentsState
	DataSources.inGame.SP.player.equipmentState = DataSources.alwaysLoaded.playerData.SP.spData.equipmentState
	DataSources.inGame.SP.player.selectedLoadout = DataSources.alwaysLoaded.playerData.SP.spData.selectedLoadout
	DataSources.inGame.SP.player.jackalDecalState = DataSources.alwaysLoaded.playerData.SP.spData.jackalDecals
	DataSources.inGame.SP.player.jackalPrimaryState = DataSources.alwaysLoaded.playerData.SP.spData.jackalPrimaryState
	DataSources.inGame.SP.player.jackalSecondaryState = DataSources.alwaysLoaded.playerData.SP.spData.jackalSecondaryState
	DataSources.inGame.SP.player.jackalUpgradeState = DataSources.alwaysLoaded.playerData.SP.spData.jackalUpgradeState
	DataSources.inGame.SP.player.missionStateData = DataSources.alwaysLoaded.playerData.SP.spData.missionStateData
	DataSources.inGame.SP.player.opsmapMissionStateData = DataSources.alwaysLoaded.playerData.SP.spData.opsmapMissionStateData
	DataSources.inGame.SP.player.missionProbability = DataSources.alwaysLoaded.playerData.SP.spData.missionProbability
	DataSources.inGame.SP.player.shipAssaultStateData = DataSources.alwaysLoaded.playerData.SP.spData.shipAssaultStateData
	DataSources.inGame.SP.player.shipAssaultProbability = DataSources.alwaysLoaded.playerData.SP.spData.shipAssaultProbability
	DataSources.inGame.SP.player.lastCompletedMission = DataSources.alwaysLoaded.playerData.SP.spData.lastCompletedMission
	DataSources.inGame.SP.player.suitUpgradeState = DataSources.alwaysLoaded.playerData.SP.spData.suitUpgradeState
end

function GetProgressionLoadoutDataSources()
	local f46_local0 = DataSources.alwaysLoaded.playerData.SP.spData.loadouts:Decorate( f0_local10 )
	f46_local0:SetCachingEnabled( true )
	return f46_local0
end

function GetSPPlayerDataDataSources()
	return DataSources.alwaysLoaded.playerData.SP.spData
end

SP_WEAPON_CLASS_LIST = {}
SP_WEAPON_ROW_LIST = {}
SP_POWER_ROW_LIST = {}
SP_JACKAL_ROW_LIST = {}
function InitSPLoadoutInGameDataSources()
	SP_WEAPON_CLASS_LIST = LOADOUT.BuildWeaponClassList( 2 )
	SP_WEAPON_ROW_LIST = LOADOUT.BuildWeaponRowList()
	SP_POWER_ROW_LIST = f0_local1()
	SP_JACKAL_ROW_LIST = f0_local11()
	DataSources.inGame.SP.loadouts = LUI.DataSourceInGlobalModel.new( "inGame.SP.loadouts" )
	f0_local2( DataSources.inGame.SP.loadouts )
	f0_local12( DataSources.inGame.SP.loadouts )
	f0_local13()
	LOADOUT.InitFireModeDataSources( "inGame.SP.loadouts" )
end

