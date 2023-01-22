local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "frontEnd.AAR.UnlockRewardScreen"
f0_local1 = "frontEnd.AAR.rewards.rank"
f0_local2 = nil
AARRewards = {
	states = {
		RANK = 0,
		MISSION_TEAM = 1,
		KEY_PROGRESSION = 2,
		COMPLETED = 3
	}
}
local f0_local3 = function ()
	WipeGlobalModelsAtPath( f0_local0 )
	WipeGlobalModelsAtPath( f0_local1 )
	if f0_local2 then
		WipeGlobalModelsAtPath( f0_local2 )
	end
end

local f0_local4 = function ()
	if Engine.IsCoreMode() then
		return DataSources.alwaysLoaded.MP.ranked.progression
	elseif Engine.IsAliensMode() then
		return DataSources.alwaysLoaded.CP.ranked.progression
	else
		error( "Unexpected game mode" )
	end
end

local f0_local5 = function ( f3_arg0 )
	local f3_local0 = {}
	for f3_local1 = 0, Engine.TableGetRowCount( CSV.challengeCategories.file ), 1 do
		local f3_local4 = CSV.ReadRow( CSV.challengeCategories, f3_local1 )
		if f3_local4.ref == f3_arg0 then
			f3_local0.name = Engine.Localize( f3_local4.localizeRef )
			f3_local0.desc = Engine.Localize( f3_local4.desc )
			f3_local0.image = f3_local4.image
			break
		end
	end
	f3_local0.categoryName = "CHALLENGE"
	return f3_local0
end

local f0_local6 = function ( f4_arg0, f4_arg1 )
	local f4_local0 = {}
	if type( f4_arg0 ) ~= "number" then
		local f4_local1 = f4_arg0.type
		f4_local0.identifier = f4_arg0.item
		f4_local0.context = LUI.ItemCard.contexts.AAR_PROGRESSION
		if f4_local1 == AAR.UnlockTypes.WEAPON or f4_local1 == AAR.UnlockTypes.CP_WEAPON then
			f4_local0.itemType = LUI.ItemCard.types.WEAPON
		elseif AAR.IsAttachmentUnlockType( f4_local1 ) then
			f4_local0.itemType = LUI.ItemCard.types.ATTACHMENT
		elseif f4_local1 == AAR.UnlockTypes.RIG then
			f4_local0.itemType = LUI.ItemCard.types.RIG
		elseif f4_local1 == AAR.UnlockTypes.TRAIT then
			f4_local0.itemType = LUI.ItemCard.types.TRAIT
		elseif f4_local1 == AAR.UnlockTypes.SUPER then
			f4_local0.itemType = LUI.ItemCard.types.SUPER
		elseif f4_local1 == AAR.UnlockTypes.POWER then
			f4_local0.itemType = LUI.ItemCard.types.POWER
		elseif f4_local1 == AAR.UnlockTypes.STREAK then
			f4_local0.itemType = LUI.ItemCard.types.STREAK
		elseif f4_local1 == AAR.UnlockTypes.CHALLENGE then
			f4_local0 = f0_local5( f4_arg0.item )
		elseif f4_local1 == AAR.UnlockTypes.PERK then
			f4_local0.itemType = LUI.ItemCard.types.PERK
		elseif f4_local1 == AAR.UnlockTypes.CAMO then
			f4_local0.itemType = LUI.ItemCard.types.CAMO
			f4_local0.context = LUI.ItemCard.contexts.AAR_CHALLENGE
		elseif f4_local1 == AAR.UnlockTypes.RETICLE then
			f4_local0.itemType = LUI.ItemCard.types.RETICLE
		elseif f4_local1 == AAR.UnlockTypes.CONSUMABLE then
			f4_local0.itemType = LUI.ItemCard.types.CONSUMABLE
		elseif f4_local1 == AAR.UnlockTypes.PICK_10 then
			f4_local0.itemType = LUI.ItemCard.types.PICK_10
		elseif f4_local1 == AAR.UnlockTypes.FATE_CARD then
			f4_local0.itemType = LUI.ItemCard.types.FATE_CARD
		elseif f4_local1 == AAR.UnlockTypes.FATE_DECK_SIZE then
			f4_local0.itemType = LUI.ItemCard.types.FATE_DECK_SIZE
		elseif f4_local1 == AAR.UnlockTypes.MTXP then
			f4_local0.itemType = LUI.ItemCard.types.MTXP
			f4_local0.context = LUI.ItemCard.contexts.MTXP
		elseif f4_local1 == AAR.UnlockTypes.CALLING_CARD then
			f4_local0.itemType = LUI.ItemCard.types.CALLING_CARD
			f4_local0.context = LUI.ItemCard.contexts.AAR_CHALLENGE
		elseif f4_local1 == AAR.UnlockTypes.BODY then
			f4_local0.itemType = LUI.ItemCard.types.RIG_BODY
			f4_local0.context = LUI.ItemCard.contexts.AAR_CHALLENGE
		elseif f4_local1 == AAR.UnlockTypes.HEAD then
			f4_local0.itemType = LUI.ItemCard.types.RIG_HEAD
			f4_local0.context = LUI.ItemCard.contexts.AAR_CHALLENGE
		end
	else
		local f4_local1 = tonumber( f4_arg0 )
		local f4_local2 = LOOT.GetLootData( f4_local1 )
		f4_local0.itemType = f4_local2.type
		f4_local0.identifier = f4_local1
		f4_local0.context = LUI.ItemCard.contexts.AAR_SUPPLY_DROP
	end
	f4_local0.modelPath = f0_local0 .. ".unlockRewards.reward" .. f4_arg1
	return f4_local0
end

local f0_local7 = function ( f5_arg0, f5_arg1 )
	local f5_local0 = DataSources.frontEnd.MP.commerce.baseInGameCurrency:GetValue( f5_arg0 )
	local f5_local1 = Rewards.GetMissionRewards( f5_arg0 )
	return f5_arg1 % 10 < CoD.GetAdjustedCurrency( f5_local0 - f5_local1.Currency ) % 10
end

local f0_local8 = function ( f6_arg0, f6_arg1 )
	local f6_local0 = -1
	local f6_local1 = 4
	for f6_local2 = 0, f6_local1 - 1, 1 do
		local f6_local5 = tonumber( Engine.TableLookupByRow( CSV.missionTeamUnlockTable.file, f6_local2, CSV.missionTeamUnlockTable.cols.unlockRank ) )
		if f6_arg0 < f6_local5 and f6_local5 <= f6_arg1 then
			f6_local0 = f6_local2
		end
	end
	Engine.SetDvarInt( "lui_mc_newMissionTeamUnlocked", f6_local0 )
	return f6_local0
end

local f0_local9 = function ( f7_arg0, f7_arg1 )
	local f7_local0 = 39
	local f7_local1 = 49
	if f7_arg0 < f7_local1 and f7_local1 <= f7_arg1 then
		Engine.Exec( "set lui_mc_crankCallIndex 2" )
	elseif f7_arg0 < f7_local0 and f7_local0 <= f7_arg1 then
		Engine.Exec( "set lui_mc_crankCallIndex 1" )
	end
end

local f0_local10 = function ( f8_arg0, f8_arg1, f8_arg2 )
	DataSources.frontEnd.AAR.rewards.levelUpItemCountModel = LUI.DataSourceInControllerModel.new( f0_local0 .. ".levelUpItemCount", 0 )
	DataSources.frontEnd.AAR.rewards.missionTeamItemCountModel = LUI.DataSourceInControllerModel.new( f0_local0 .. ".missionTeamItemCount", 0 )
	DataSources.frontEnd.AAR.rewards.supplyDropCountModel = LUI.DataSourceInControllerModel.new( f0_local0 .. ".supplyDropCount", 0 )
	f8_arg1.unlockCountModel = LUI.DataSourceInControllerModel.new( f0_local0 .. ".unlockCount", 0 )
	f8_arg1.unlockRewards = LUI.DataSourceFromList.new( f8_arg1.unlockCountModel )
end

local f0_local11 = function ( f9_arg0, f9_arg1, f9_arg2 )
	local f9_local0 = {}
	local f9_local1 = {}
	if Engine.IsCoreMode() then
		f9_local1 = {
			"weapon",
			"power",
			"killstreak",
			"rigPackage",
			"pick10",
			"perk",
			"callingCard",
			"body",
			"head",
			"projectileAttach",
			"meleeAttach",
			"lmgAttach",
			"dmrAttach",
			"pistolAttach",
			"classicAttach",
			"assaultAttach",
			"sniperAttach",
			"smgAttach",
			"shotgunAttach",
			"camo"
		}
	elseif Engine.IsAliensMode() then
		f9_local1 = {
			"CPWeapon",
			"fateCard"
		}
	end
	local f9_local2 = f0_local4()
	local f9_local3 = f9_local2.prestige:GetValue( f9_arg2 )
	local f9_local4 = f9_arg1.rank.rankBeforeLastMatch:GetValue( f9_arg2 )
	local f9_local5 = f9_arg1.rank.currentRank:GetValue( f9_arg2 )
	local f9_local6 = f9_local5 - f9_local4
	if f9_local3 == 0 then
		f0_local8( f9_local4, f9_local5 )
		f0_local9( f9_local4, f9_local5 )
	end
	local f9_local7 = Rewards.GetAARRewards( f9_arg2, f9_local1, #f9_local1 )
	for f9_local8 = 1, #f9_local7, 1 do
		local f9_local11 = f9_local7[f9_local8]
		if f9_local11.type == "rigPackage" then
			local f9_local12 = Cac.GetRigPackageUnlocks( f9_arg2, f9_local11.item, f9_local11.level, true )
			for f9_local13 = 1, #f9_local12, 1 do
				table.insert( f9_local0, f9_local12[f9_local13] )
			end
		end
		if f9_local11.item == "iw7_revolver" and Cac.IsLootWeaponOwned( "weapon_iw7_revolver_epic_2", f9_arg2 ) then
			
		else
			table.insert( f9_local0, f9_local11 )
		end
	end
	local f9_local8 = #f9_local0
	local f9_local9 = 0
	local f9_local10 = 0
	local f9_local16 = 0
	local f9_local11 = 0
	if Engine.IsCoreMode() then
		local f9_local12 = Rewards.GetMissionRewards( f9_arg2 )
		f9_local9 = #f9_local12.items
		f9_local16 = #f9_local12.set_items
		for f9_local13 = 1, f9_local9, 1 do
			table.insert( f9_local0, f9_local12.items[f9_local13] )
		end
		for f9_local13 = 1, f9_local16, 1 do
			table.insert( f9_local0, f9_local12.set_items[f9_local13] )
		end
	end
	local f9_local12 = Rewards.GetMissionContractRewards( f9_arg2 )
	f9_local10 = #f9_local12.items
	for f9_local13 = 1, f9_local10, 1 do
		table.insert( f9_local0, f9_local12.items[f9_local13] )
	end
	if Engine.IsCoreMode() and Contracts.GetLastMatchMissionTeamXP( f9_arg2 ) > 0 then
		table.insert( f9_local0, {
			type = AAR.UnlockTypes.MTXP,
			item = "mtxp"
		} )
		f9_local11 = 1
	end
	local f9_local13 = 0
	local f9_local14 = 0
	local f9_local15 = Engine.TableLookup( CSV.lootCrate.file, CSV.lootCrate.cols.ref, ARMORY.commonCrate, CSV.lootCrate.cols.cost )
	local f9_local17 = Engine.TableLookup( CSV.lootCrate.file, CSV.lootCrate.cols.ref, ARMORY.rareCrate, CSV.lootCrate.cols.cost )
	local f9_local18 = DataSources.frontEnd.MP.commerce.inGameCurrency:GetValue( f9_arg2 )
	if f0_local7( f9_arg2, f9_local18 ) then
		if tonumber( f9_local17 ) <= tonumber( f9_local18 ) then
			table.insert( f9_local0, ARMORY.rareCrateID )
			f9_local13 = 1
		elseif tonumber( f9_local15 ) <= tonumber( f9_local18 ) then
			table.insert( f9_local0, ARMORY.commonCrateID )
			f9_local13 = 1
		end
	end
	f9_local14 = f9_local8 + f9_local9 + f9_local16 + f9_local13 + f9_local10 + f9_local11
	f9_arg0.totalCount = f9_local14
	DataSources.frontEnd.AAR.rewards.levelUpItemCountModel:SetValue( f9_arg2, f9_local8 )
	DataSources.frontEnd.AAR.rewards.missionTeamItemCountModel:SetValue( f9_arg2, f9_local9 + f9_local16 + f9_local11 + f9_local10 )
	DataSources.frontEnd.AAR.rewards.supplyDropCountModel:SetValue( f9_arg2, 0 )
	f9_arg1.unlockCountModel:SetValue( f9_arg2, f9_local14 )
	f9_arg1.unlockRewards.GetDefaultFocusIndex = function ()
		if 0 < f9_local14 then
			return f9_arg1.unlockRewards:GetCountValue( f9_arg2 )
		else
			return 0
		end
	end
	
	f9_arg1.unlockRewards.numToDisplay = 0
	f9_arg1.unlockRewards.SetCountValue = function ( f11_arg0, f11_arg1, f11_arg2 )
		f9_arg1.unlockRewards.numToDisplay = 0
		if f11_arg2 == AARRewards.states.RANK then
			f9_arg1.unlockRewards.numToDisplay = f9_local8
		elseif f11_arg2 == AARRewards.states.MISSION_TEAM then
			f9_arg1.unlockRewards.numToDisplay = f9_local8 + f9_local9 + f9_local16 + f9_local11 + f9_local10
		elseif f11_arg2 == AARRewards.states.KEY_PROGRESSION or f11_arg2 == AARRewards.states.COMPLETED then
			if DataSources.frontEnd.AAR.rewards.supplyDropCountModel:GetValue( f11_arg1 ) > 0 then
				f9_arg1.unlockRewards.numToDisplay = f9_local14
			else
				f9_arg1.unlockRewards.numToDisplay = f9_local8 + f9_local9 + f9_local16 + f9_local11 + f9_local10
			end
		end
		return f9_arg1.unlockRewards.numToDisplay
	end
	
	f9_arg1.unlockRewards.MakeDataSourceAtIndex = function ( f12_arg0, f12_arg1, f12_arg2 )
		local f12_local0 = f12_arg1 + 1
		if f9_local0[f12_local0] then
			return f0_local6( f9_local0[f12_local0], f12_local0 )
		else
			
		end
	end
	
	f9_arg0.UnlockedItemsGrid:NotifyWhenPositionIsVisible( 0, 0 )
	f9_arg0.UnlockedItemsGrid:addEventHandler( "position_visible", function ( f13_arg0, f13_arg1 )
		if not f9_arg0.complete then
			f13_arg1.child:PlayIntro()
			f13_arg0:NotifyWhenPositionIsVisible( f13_arg1.column + 1, 0 )
		end
	end )
	f9_arg1.unlockRewards.currentNumToDisplay = 0
	f9_arg1.unlockRewards.UpdateRewards = function ( f14_arg0, f14_arg1 )
		local f14_local0 = f14_arg0.UnlockedItemsGrid
		local f14_local1 = f9_arg1.unlockRewards:GetCountModel( f9_arg2 )
		if f9_arg1.unlockRewards.currentNumToDisplay < f9_arg1.unlockRewards.numToDisplay then
			f9_arg1.unlockRewards.currentNumToDisplay = f9_arg1.unlockRewards.currentNumToDisplay + 1
			DataModel.SetModelValue( f14_local1, f9_arg1.unlockRewards.currentNumToDisplay )
			f14_local0:SetGridDataSourceThroughElement( f14_arg0, "unlockRewards" )
			f14_local0:SetTargetColumn( f9_arg1.unlockRewards.currentNumToDisplay, true, true )
		end
		if f9_arg1.unlockRewards.currentNumToDisplay > 0 and f9_arg1.unlockRewards.currentNumToDisplay == f14_arg0.totalCount then
			f14_arg0.timer:close()
		end
	end
	
	f9_arg1.unlockRewards.CheckForNewRig = function ()
		for f15_local0 = 1, f9_local8, 1 do
			if f9_local0[f15_local0].type == AAR.UnlockTypes.RIG then
				Cac.PlayFirstRigCapacityBink( f9_local0[f15_local0].item, f9_arg2 )
				break
			end
		end
	end
	
	f9_arg0.UnlockedItemsGrid:RefreshContent()
end

local f0_local12 = function ( f16_arg0, f16_arg1, f16_arg2 )
	local f16_local0 = Engine.GetDvarInt( "lui_mc_lastMissionCompletionTier" )
	local f16_local1 = DataSources.frontEnd.MP.commerce.baseInGameCurrency:GetValue( f16_arg1 )
	local f16_local2 = Rewards.GetMissionRewards( f16_arg1 )
	local f16_local3 = f16_local1 - f16_local2.Currency
	local f16_local4 = f16_arg2.rank.percentToNextRankBeforeLastMatch:GetValue( f16_arg1 )
	local f16_local5 = CoD.GetPercentToNextCurrency( f16_local3 )
	f16_arg0.AARRewardsRank.AARRewardsRankProgress.AARRewardsRadialBar.PreviousRadialBarRank:SetProgress( f16_local4 )
	if Engine.IsCoreMode() then
		local f16_local6 = MissionDirector.GetActiveMissionTeam( f16_arg1 )
		local f16_local7 = MissionDirector.GetMissionXP( f16_arg1, f16_local6 )
		local f16_local8 = f16_local7 - MissionDirector.GetRoundXP( f16_arg1, f16_local0, f16_local6, DataSources.alwaysLoaded.playerData.MP.common.round.gameMode:GetValue( f16_arg1 ) )
		local f16_local9 = f16_local7 / MissionDirector.GetMissionXPToNextLevel( f16_arg1, f16_local6 )
		local f16_local10 = f16_local8 / MissionDirector.GetMissionXPToNextLevel( f16_arg1, f16_local6 )
		if f16_local8 < 0 then
			f16_local10 = f16_local10 + 1
		end
		f16_arg0.AARRewardsMissionTeamRank.AARRewardsMissionTeamProgress.AARRewardsRadialBar.PreviousRadialBarRank:SetProgress( f16_local10 )
	end
	f16_arg0.AARRewardsKeys.AARRewardsKeyProgress.AARRewardsRadialBar.PreviousRadialBarRank:SetProgress( f16_local5 )
end

function InitAARRankDataSources( f17_arg0, f17_arg1, f17_arg2 )
	f17_arg1.rank = {}
	f17_arg1.rank.xpRequired = LUI.DataSourceInControllerModel.new( f0_local1 .. ".requiredXP", 0 )
	f17_arg1.rank.rankBeforeLastMatch = LUI.DataSourceInControllerModel.new( f0_local1 .. ".rankBeforeLastMatch", 0 )
	f17_arg1.rank.displayRank = LUI.DataSourceInControllerModel.new( f0_local1 .. ".displayRank", 0 )
	f17_arg1.rank.currentRank = LUI.DataSourceInControllerModel.new( f0_local1 .. ".currentRank", 0 )
	f17_arg1.rank.displayRankIcon = LUI.DataSourceInControllerModel.new( f0_local1 .. ".displayRankIcon", "rank_icon_1" )
	f17_arg1.rank.nextRank = LUI.DataSourceInControllerModel.new( f0_local1 .. ".nextRank", 1 )
	f17_arg1.rank.nextRankIcon = LUI.DataSourceInControllerModel.new( f0_local1 .. ".nextRankIcon", "rank_icon_1" )
	f17_arg1.rank.percentToNextRank = LUI.DataSourceInControllerModel.new( f0_local1 .. ".percentToNextRank", 0 )
	f17_arg1.rank.percentToNextRankBeforeLastMatch = LUI.DataSourceInControllerModel.new( f0_local1 .. ".percentToNextRankBeforeLastMatch", 0 )
	f17_arg1.rank.matchXp = LUI.DataSourceInControllerModel.new( f0_local1 .. ".matchXp", 0 )
	f17_arg1.rank.bonusXp = LUI.DataSourceInControllerModel.new( f0_local1 .. ".bonusXp", 0 )
	f17_arg1.rank.challengeXp = LUI.DataSourceInControllerModel.new( f0_local1 .. ".challengeXp", 0 )
	f17_arg1.rank.medalXp = LUI.DataSourceInControllerModel.new( f0_local1 .. ".medalXp", 0 )
	f17_arg1.rank.doubleXp = LUI.DataSourceInControllerModel.new( f0_local1 .. ".doubleXp", 0 )
	f17_arg1.rank.totalXp = LUI.DataSourceInControllerModel.new( f0_local1 .. ".totalXp", 0 )
	if Engine.IsCoreMode() then
		f17_arg1.rankMT = {}
		f17_arg1.rankMT.displayRank = DataSources.frontEnd.AAR.rewards.missionTeam.displayRank
	end
	f17_arg1.keys = {}
	f17_arg1.keys.displayKeys = DataSources.frontEnd.MP.commerce.inGameCurrencyDisplay
end

function SetAARRankDataSources( f18_arg0, f18_arg1, f18_arg2 )
	local f18_local0 = CoD.GetCommonPlayerDataDataSource()
	local f18_local1 = CoD.GetRankedPlayerDataDataSource()
	f18_local1 = f18_local1.progression.playerLevel.xp:GetValue( f18_arg2 )
	local f18_local2 = f18_local0.round.totalXp:GetValue( f18_arg2 )
	local f18_local3 = f18_local1 - f18_local2
	if Engine.IsCoreMode() then
		local f18_local4 = Rank.GetMaxRank()
		if Rank.GetRankMaxXP( f18_local4 ) - 1 <= f18_local1 and Rank.GetRankMaxXP( f18_local4 ) - Rank.GetRankMinXP( f18_local4 ) <= f18_local2 then
			f18_local3 = f18_local1
		end
	end
	local f18_local4 = Engine.GetRankForXP( f18_local3 )
	local f18_local5 = Engine.GetRankForXP( f18_local1 )
	local f18_local6 = Rank.GetRankMinXP( f18_local4 )
	local f18_local7 = Rank.GetRankMaxXP( f18_local4 )
	local f18_local8 = Rank.GetRankMinXP( f18_local5 )
	local f18_local9 = Rank.GetRankMaxXP( f18_local5 )
	local f18_local10 = f18_local9 - f18_local1
	local f18_local11 = (f18_local3 - f18_local6) / (f18_local7 - f18_local6)
	local f18_local12 = (f18_local1 - f18_local8) / (f18_local9 - f18_local8)
	local f18_local13 = f0_local4()
	local f18_local14 = f18_local13.prestige:GetValue( f18_arg2 )
	f18_arg1.rank.xpRequired:SetValue( f18_arg2, f18_local10 )
	f18_arg1.rank.rankBeforeLastMatch:SetValue( f18_arg2, f18_local4 )
	f18_arg1.rank.displayRank:SetValue( f18_arg2, Rank.RankDisplayFilter( f18_local4, f18_arg2 ) )
	f18_arg1.rank.currentRank:SetValue( f18_arg2, f18_local5 )
	f18_arg1.rank.displayRankIcon:SetValue( f18_arg2, Rank.GetRankIcon( f18_local4, f18_local14 ) )
	f18_arg1.rank.nextRank:SetValue( f18_arg2, Rank.RankDisplayFilter( f18_local5 + 1, f18_arg2 ) )
	f18_arg1.rank.nextRankIcon:SetValue( f18_arg2, Rank.GetRankIcon( f18_local5 + 1, f18_local14 ) )
	f18_arg1.rank.percentToNextRank:SetValue( f18_arg2, f18_local12 )
	f18_arg1.rank.percentToNextRankBeforeLastMatch:SetValue( f18_arg2, f18_local11 )
	local f18_local15 = f18_local0.round.scoreXp:GetValue( f18_arg2 )
	local f18_local16 = f18_local0.round.matchXp:GetValue( f18_arg2 )
	local f18_local17 = f18_local0.round.challengeXp:GetValue( f18_arg2 )
	local f18_local18 = f18_local0.round.medalXp:GetValue( f18_arg2 )
	local f18_local19 = f18_local0.common_entitlement_xp:GetValue( f18_arg2 )
	local f18_local20 = f18_local0.round.totalXp:GetValue( f18_arg2 )
	f18_arg1.rank.matchXp:SetValue( f18_arg2, f18_local15 )
	f18_arg1.rank.bonusXp:SetValue( f18_arg2, f18_local16 )
	f18_arg1.rank.challengeXp:SetValue( f18_arg2, f18_local17 )
	f18_arg1.rank.medalXp:SetValue( f18_arg2, f18_local18 )
	f18_arg1.rank.doubleXp:SetValue( f18_arg2, f18_local18 )
	f18_arg1.rank.totalXp:SetValue( f18_arg2, f18_local20 )
end

function SetAARKeyDataSources( f19_arg0, f19_arg1, f19_arg2, f19_arg3 )
	local f19_local0 = DataSources.frontEnd.MP.commerce.baseInGameCurrency:GetValue( f19_arg2 )
	local f19_local1 = Rewards.GetMissionRewards( f19_arg2 )
	f19_arg1.keys.displayKeys:SetValue( f19_arg2, CoD.GetAdjustedCurrency( f19_local0 - f19_local1.Currency ) )
end

local f0_local13 = function ( f20_arg0, f20_arg1, f20_arg2, f20_arg3, f20_arg4 )
	local f20_local0 = CoD.GetRankedPlayerDataDataSource()
	local f20_local1 = Engine.GetRankForXP( f20_local0.progression.playerLevel.xp:GetValue( f20_arg4 ) ) == Rank.GetMaxRank()
	if f20_arg2 == "AARRewardsRank" then
		local f20_local2
		if f20_local1 then
			f20_local2 = "FeaturedMax"
			if not f20_local2 then
			
			else
				local f20_local3
				if f20_local1 then
					f20_local3 = "NotFeaturedMax"
					if not f20_local3 then
					
					elseif f20_arg1 then
						ACTIONS.AnimateSequenceByElement( f20_arg0, {
							elementName = f20_arg2,
							sequenceName = f20_local2,
							elementPath = f20_arg2
						} )
						ACTIONS.AnimateSequenceByElement( f20_arg0, {
							elementName = "AARRewardsRadialBar",
							sequenceName = "FeaturedRankProgression",
							elementPath = f20_arg3 .. ".AARRewardsRadialBar"
						} )
					else
						ACTIONS.AnimateSequenceByElement( f20_arg0, {
							elementName = f20_arg2,
							sequenceName = f20_local3,
							elementPath = f20_arg2
						} )
						ACTIONS.AnimateSequenceByElement( f20_arg0, {
							elementName = "AARRewardsRadialBar",
							sequenceName = "DefaultRankProgression",
							elementPath = f20_arg3 .. ".AARRewardsRadialBar"
						} )
					end
				end
				f20_local3 = "NotFeatured"
			end
		end
		f20_local2 = "Featured"
	elseif f20_arg1 then
		local f20_local2 = nil
		if Engine.IsCoreMode() and f20_arg4 ~= nil then
			f20_local2 = DataSources.frontEnd.AAR.rewards.missionTeam.displayRank:GetValue( f20_arg4 )
		end
		if f20_arg2 == "AARRewardsMissionTeamRank" and f20_local2 and f20_local2 > 49 then
			ACTIONS.AnimateSequenceByElement( f20_arg0, {
				elementName = f20_arg2,
				sequenceName = "Featured",
				elementPath = f20_arg2
			} )
			ACTIONS.AnimateSequenceByElement( f20_arg0, {
				elementName = "AARRewardsRadialBar",
				sequenceName = "CommanderRankProgression",
				elementPath = f20_arg3 .. ".AARRewardsRadialBar"
			} )
		else
			ACTIONS.AnimateSequenceByElement( f20_arg0, {
				elementName = f20_arg2,
				sequenceName = "Featured",
				elementPath = f20_arg2
			} )
			ACTIONS.AnimateSequenceByElement( f20_arg0, {
				elementName = "AARRewardsRadialBar",
				sequenceName = "FeaturedRankProgression",
				elementPath = f20_arg3 .. ".AARRewardsRadialBar"
			} )
		end
	else
		ACTIONS.AnimateSequenceByElement( f20_arg0, {
			elementName = f20_arg2,
			sequenceName = "NotFeatured",
			elementPath = f20_arg2
		} )
		ACTIONS.AnimateSequenceByElement( f20_arg0, {
			elementName = "AARRewardsRadialBar",
			sequenceName = "DefaultRankProgression",
			elementPath = f20_arg3 .. ".AARRewardsRadialBar"
		} )
	end
end

local f0_local14 = function ( f21_arg0, f21_arg1, f21_arg2, f21_arg3 )
	f21_arg0:RemoveButtonHelperText( "button_primary", "left" )
	f21_arg1:RemoveButtonHelperText( "button_primary", "left" )
	f21_arg1:RemoveButtonHelperText( "button_secondary", "left" )
	f21_arg1:RemoveButtonHelperText( "button_alt1", "left" )
	f21_arg0.bindButton:closeTree()
	f21_arg1.bindButton:closeTree()
	local f21_local0, f21_local1 = nil
	local f21_local2 = Engine.IsCoreMode()
	if f21_local2 then
		f21_local0 = Loot.IsOwned( f21_arg2, LOOT.DoubleXPTokenID ) > 0
		f21_local1 = DataSources.frontEnd.MP.usedDoubleXPToken:GetValue( f21_arg2 )
	end
	if not f21_arg1.newBindButton then
		local self = LUI.UIBindButton.new()
		self.id = "newBindButton"
		self:setPriority( -1000 )
		f21_arg1:addElement( self )
		f21_arg1.newBindButton = self
	end
	f21_arg1.newBindButton:registerEventHandler( "button_primary", function ( element, event )
		local f22_local0
		if not f21_local1 then
			f22_local0 = f21_arg0.usedDoubleXP
			if f22_local0 then
			
			else
				if not f21_arg1.fromMatch and not f22_local0 then
					LUI.FlowManager.RequestLeaveMenu( f21_arg1 )
				elseif not f21_arg0.complete then
					if f21_arg0.timer then
						f21_arg0.timer:close()
					end
					AARRewards.CompleteAnimation( f21_arg0, f21_arg2, f21_arg3 )
				else
					PostGameFanfare:advance()
				end
			end
		end
		f22_local0 = not f21_arg0.complete
	end )
	if f21_local2 and f21_local0 and not f21_local1 then
		f21_arg1.newBindButton:registerEventHandler( "button_alt1", function ( element, event )
			if Loot.IsOwned( f21_arg2, LOOT.DoubleXPTokenID ) > 0 and not DataSources.frontEnd.MP.usedDoubleXPToken:GetValue( f21_arg2 ) then
				LUI.FlowManager.RequestPopupMenu( f21_arg0, "AARUseXPToken", true, f21_arg2, false, {
					parent = f21_arg0,
					parentMenu = f21_arg1
				} )
			end
		end )
	end
	f21_arg1.newBindButton:registerEventHandler( "button_secondary", function ( element, event )
		LUI.FlowManager.RequestLeaveMenu( f21_arg1 )
	end )
	if f21_arg0.complete then
		local f21_local4 = f21_arg1
		local self = f21_arg1.AddButtonHelperTextToElement
		local f21_local5 = f21_arg1.ButtonHelperBar
		local f21_local6 = {
			helper_text = ToUpperCase( Engine.Localize( "LUA_MENU_CONTINUE" ) ),
			button_ref = "button_primary",
			side = "left"
		}
		local f21_local7 = 10
		f21_local6.clickable = true
		f21_local6[1] = f21_local7
		self( f21_local4, f21_local5, f21_local6 )
		f21_local4 = f21_arg1
		self = f21_arg1.AddButtonHelperTextToElement
		f21_local5 = f21_arg1.ButtonHelperBar
		f21_local6 = {
			helper_text = ToUpperCase( Engine.Localize( "MENU_BACK" ) ),
			button_ref = "button_secondary",
			side = "left"
		}
		f21_local7 = 10
		f21_local6.clickable = true
		f21_local6[1] = f21_local7
		self( f21_local4, f21_local5, f21_local6 )
	end
	if f21_local2 and f21_local0 and not f21_local1 then
		local f21_local4 = f21_arg1
		local self = f21_arg1.AddButtonHelperTextToElement
		local f21_local5 = f21_arg1.ButtonHelperBar
		local f21_local6 = {
			helper_text = ToUpperCase( Engine.Localize( "MP_FRONTEND_ONLY_2XP_TOKEN" ) ),
			button_ref = "button_alt1",
			side = "left"
		}
		local f21_local7 = 10
		f21_local6.clickable = true
		f21_local6[1] = f21_local7
		self( f21_local4, f21_local5, f21_local6 )
	end
end

local f0_local15 = function ( f25_arg0, f25_arg1 )
	local f25_local0 = f25_arg0:GetCurrentMenu()
	f25_arg0.complete = f25_arg1
	f25_arg0.rewardsComplete = f25_arg1
	if f25_local0 then
		f25_local0.rewardsComplete = f25_arg1
	end
end

local f0_local16 = function ( f26_arg0, f26_arg1, f26_arg2 )
	local f26_local0 = f26_arg0:GetCurrentMenu()
	if not f26_local0.fromMatch then
		return 
	end
	local f26_local1 = MissionDirector.GetMissionXP( f26_arg1, f26_arg2 )
	local f26_local2 = Engine.GetDvarInt( "lui_mc_lastMissionCompletionTier" )
	local f26_local3 = MissionDirector.GetMissionTeamLevel( f26_arg1, f26_arg2 )
	if f26_local1 - MissionDirector.GetRoundXP( f26_arg1, f26_local2, f26_arg2, DataSources.alwaysLoaded.playerData.MP.common.round.gameMode:GetValue( f26_arg1 ) ) < 0 then
		local f26_local4, f26_local5 = MissionDirector.GetNumMissionSlotsFromLevel( f26_local3 )
		if not f26_local5 then
			Engine.SetDvarInt( "lui_mc_newMissionSlotUnlocked", f26_local4 )
		end
	end
end

local f0_local17 = function ( f27_arg0, f27_arg1 )
	local f27_local0 = f0_local7( f27_arg0, f27_arg1 )
	local f27_local1 = DataSources.frontEnd.MP.commerce.baseInGameCurrency:GetValue( f27_arg0 )
	local f27_local2 = Rewards.GetMissionRewards( f27_arg0 )
	if f27_arg1 - CoD.GetAdjustedCurrency( f27_local1 - f27_local2.Currency ) > 0 and f27_local0 then
		DataSources.frontEnd.AAR.rewards.supplyDropCountModel:SetValue( f27_arg0, 1 )
	end
end

local f0_local18 = function ( f28_arg0 )
	assert( f28_arg0 )
	f28_arg0.UnlockedItemsGrid:GainFocus()
	if f28_arg0.totalCount > 1 then
		f28_arg0.ArrowLeft:SetAlpha( 1, 100 )
		f28_arg0.ArrowRight:SetAlpha( 1, 100 )
		f28_arg0.ListCount:SetAlpha( 1, 100 )
		f28_arg0.ArrowLeft:addEventHandler( "grid_focus_left_moved", function ( f29_arg0, f29_arg1 )
			Engine.PlaySound( "ui_aar_item_card_slide_left" )
		end )
		f28_arg0.ArrowLeft:addEventHandler( "grid_focus_right_moved", function ( f30_arg0, f30_arg1 )
			Engine.PlaySound( "ui_aar_item_card_slide_right" )
		end )
	end
end

AARRewards.CompleteAnimation = function ( f31_arg0, f31_arg1, f31_arg2 )
	f0_local15( f31_arg0, true )
	f0_local13( f31_arg0, false, "AARRewardsRank", "AARRewardsRank.AARRewardsRankProgress", f31_arg1 )
	f0_local13( f31_arg0, false, "AARRewardsKeys", "AARRewardsKeys.AARRewardsKeyProgress", f31_arg1 )
	local f31_local0 = CoD.GetRankedPlayerDataDataSource()
	f31_local0 = f31_local0.progression.playerLevel.xp:GetValue( f31_arg1 )
	local f31_local1 = Engine.GetRankForXP( f31_local0 )
	local f31_local2 = Rank.GetRankMinXP( f31_local1 )
	local f31_local3 = math.min( 1, (f31_local0 - f31_local2) / (Rank.GetRankMaxXP( f31_local1 ) - f31_local2) )
	local f31_local4 = DataSources.frontEnd.MP.commerce.percentToNextInGameDollar:GetValue( f31_arg1 )
	f31_arg2.rank.displayRankIcon:SetValue( f31_arg1, Rank.GetRankIcon( f31_local1, Cac.GetPrestigeLevel( f31_arg1 ) ) )
	f31_arg2.rank.displayRank:SetValue( f31_arg1, Rank.RankDisplayFilter( f31_local1 ) )
	if Engine.IsCoreMode() then
		local f31_local5 = MissionDirector.GetActiveMissionTeam( f31_arg1 )
		if MissionDirector.GetMaxTeamLevel( f31_arg1, f31_local5 ) <= MissionDirector.GetMissionTeamLevel( f31_arg1, f31_local5 ) then
			ACTIONS.AnimateSequence( f31_arg0.AARRewardsMissionTeamRank, "MaxNotFeatured" )
			ACTIONS.AnimateSequence( f31_arg0.AARRewardsMissionTeamRank.AARRewardsMissionTeamProgress, "MaxOut" )
		else
			f0_local13( f31_arg0, false, "AARRewardsMissionTeamRank", "AARRewardsMissionTeamRank.AARRewardsMissionTeamProgress", f31_arg1 )
			local f31_local6 = MissionDirector.GetMissionXP( f31_arg1, f31_local5 ) / MissionDirector.GetMissionXPToNextLevel( f31_arg1, f31_local5 )
			local f31_local7 = MissionDirector.GetMissionTeamDataSources( f31_arg1, f0_local2, f31_local5 )
			f31_arg2.rankMT.displayRank:SetValue( f31_arg1, f31_local7.level:GetValue( f31_arg1 ) )
			f0_local16( f31_arg0, f31_arg1, f31_local5 )
			f31_arg0.AARRewardsMissionTeamRank.AARRewardsMissionTeamProgress.AARRewardsRadialBar.PreviousRadialBarRank:SetProgress( f31_local6 )
			f31_arg0.AARRewardsMissionTeamRank.AARRewardsMissionTeamProgress.AARRewardsRadialBar.RadialBarRank:SetProgress( f31_local6 )
		end
	end
	local f31_local8 = CoD.GetAdjustedCurrency( DataSources.frontEnd.MP.commerce.baseInGameCurrency:GetValue( f31_arg1 ) )
	f31_arg2.keys.displayKeys:SetValue( f31_arg1, f31_local8 )
	f0_local17( f31_arg1, f31_local8 )
	f31_arg0.AARRewardsRank.AARRewardsRankProgress.AARRewardsRadialBar.PreviousRadialBarRank:SetProgress( f31_local3 )
	f31_arg0.AARRewardsRank.AARRewardsRankProgress.AARRewardsRadialBar.RadialBarRank:SetProgress( f31_local3 )
	f31_arg0.AARRewardsKeys.AARRewardsKeyProgress.AARRewardsRadialBar.PreviousRadialBarRank:SetProgress( f31_local4 )
	f31_arg0.AARRewardsKeys.AARRewardsKeyProgress.AARRewardsRadialBar.RadialBarRank:SetProgress( f31_local4 )
	local f31_local9 = f31_arg2.unlockRewards:SetCountValue( f31_arg1, AARRewards.states.COMPLETED )
	local f31_local6 = f31_arg2.unlockRewards:GetCountModel( f31_arg1 )
	if f31_local9 > 0 then
		f31_arg0.UnlockedItemsGrid:SetAlpha( 1, 0 )
		DataModel.SetModelValue( f31_local6, f31_local9 )
		f31_arg0.UnlockedItemsGrid:SetGridDataSourceThroughElement( f31_arg0, "unlockRewards" )
	end
	local f31_local7 = f31_arg0:GetCurrentMenu()
	if f31_local7 then
		f31_local7.AARTabs.Tabs:ShowTabs()
		f0_local14( f31_arg0, f31_local7, f31_arg1, f31_arg2 )
	end
	f0_local18( f31_arg0 )
	f31_arg2.unlockRewards.CheckForNewRig()
end

local f0_local19 = function ( f32_arg0, f32_arg1, f32_arg2 )
	local f32_local0, f32_local1, f32_local2 = nil
	local f32_local3 = Engine.IsCoreMode()
	if f32_local3 then
		f32_local0 = MissionDirector.GetActiveMissionTeam( f32_arg2 )
		f32_local1 = MissionDirector.GetMissionTeamLevel( f32_arg2, f32_local0 )
		f32_local2 = MissionDirector.GetMaxTeamLevel( f32_arg2, f32_local0 )
	end
	if not f32_arg0.complete then
		if f32_arg1 == AARRewards.states.RANK then
			f0_local13( f32_arg0, true, "AARRewardsRank", "AARRewardsRank.AARRewardsRankProgress", f32_arg2 )
		elseif f32_arg1 == AARRewards.states.MISSION_TEAM then
			if f32_local3 then
				if f32_local2 <= f32_local1 then
					ACTIONS.AnimateSequence( f32_arg0.AARRewardsMissionTeamRank, "MaxOut" )
					ACTIONS.AnimateSequence( f32_arg0.AARRewardsMissionTeamRank.AARRewardsMissionTeamProgress, "MaxOut" )
					ACTIONS.AnimateSequence( f32_arg0.AARRewardsMissionTeamRank.AARRewardsMissionTeamProgress.MissionTeamMax, "MaxOut" )
				else
					f0_local13( f32_arg0, true, "AARRewardsMissionTeamRank", "AARRewardsMissionTeamRank.AARRewardsMissionTeamProgress", f32_arg2 )
				end
				f0_local13( f32_arg0, false, "AARRewardsRank", "AARRewardsRank.AARRewardsRankProgress", f32_arg2 )
			end
		elseif f32_arg1 == AARRewards.states.KEY_PROGRESSION then
			f0_local13( f32_arg0, true, "AARRewardsKeys", "AARRewardsKeys.AARRewardsKeyProgress", f32_arg2 )
			f0_local13( f32_arg0, false, "AARRewardsRank", "AARRewardsRank.AARRewardsRankProgress", f32_arg2 )
			if f32_local3 then
				if f32_local2 <= f32_local1 then
					ACTIONS.AnimateSequence( f32_arg0.AARRewardsMissionTeamRank, "MaxNotFeatured" )
					ACTIONS.AnimateSequence( f32_arg0.AARRewardsMissionTeamRank.AARRewardsMissionTeamProgress, "MaxOut" )
				else
					f0_local13( f32_arg0, false, "AARRewardsMissionTeamRank", "AARRewardsMissionTeamRank.AARRewardsMissionTeamProgress", f32_arg2 )
				end
			end
		else
			f0_local13( f32_arg0, false, "AARRewardsKeys", "AARRewardsKeys.AARRewardsKeyProgress", f32_arg2 )
			f0_local13( f32_arg0, false, "AARRewardsRank", "AARRewardsRank.AARRewardsRankProgress", f32_arg2 )
			if f32_local3 then
				if f32_local2 <= f32_local1 then
					ACTIONS.AnimateSequence( f32_arg0.AARRewardsMissionTeamRank, "MaxNotFeatured" )
					ACTIONS.AnimateSequence( f32_arg0.AARRewardsMissionTeamRank.AARRewardsMissionTeamProgress, "MaxOut" )
				else
					f0_local13( f32_arg0, false, "AARRewardsMissionTeamRank", "AARRewardsMissionTeamRank.AARRewardsMissionTeamProgress", f32_arg2 )
				end
			end
		end
	end
end

local f0_local20 = function ( f33_arg0, f33_arg1, f33_arg2, f33_arg3, f33_arg4, f33_arg5, f33_arg6, f33_arg7, f33_arg8, f33_arg9 )
	local f33_local0 = 0
	local f33_local1 = 300
	for f33_local2 = 0, f33_arg3, 1 do
		local f33_local5 = function ()
			if f33_arg0.complete then
				return 
			elseif Engine.IsCoreMode() and DataSources.frontEnd.MP.usedDoubleXPToken:GetValue( f33_arg1 ) and not f33_arg9 then
				return 
			elseif f33_arg8 == AARRewards.states.RANK then
				local f34_local0 = f33_arg2.rank.displayRank:GetValue( f33_arg1 )
				f33_arg2.rank.displayRankIcon:SetValue( f33_arg1, Rank.GetRankIcon( f34_local0, Cac.GetPrestigeLevel( f33_arg1 ) ) )
				f33_arg2.rank.displayRank:SetValue( f33_arg1, f34_local0 + 1 )
				ACTIONS.AnimateSequence( f33_arg0.AARRewardsRank.AARRewardsRankProgress.AARRewardsRadialBar, "LevelUpProgression" )
			elseif f33_arg8 == AARRewards.states.MISSION_TEAM then
				local f34_local0 = MissionDirector.GetActiveMissionTeam( f33_arg1 )
				if MissionDirector.GetMaxTeamLevel( f33_arg1, f34_local0 ) <= MissionDirector.GetMissionTeamLevel( f33_arg1, f34_local0 ) then
					ACTIONS.AnimateSequence( f33_arg0.AARRewardsMissionTeamRank.AARRewardsMissionTeamProgress, "MaxOut" )
					ACTIONS.AnimateSequence( f33_arg0.AARRewardsMissionTeamRank.AARRewardsMissionTeamProgress.MissionTeamMax, "MaxOut" )
				else
					local f34_local1 = f33_arg2.rankMT.displayRank:GetValue( f33_arg1 )
					f33_arg2.rankMT.displayRank:SetValue( f33_arg1, f34_local1 + 1 )
					ACTIONS.AnimateSequence( f33_arg0.AARRewardsMissionTeamRank.AARRewardsMissionTeamProgress.AARRewardsRadialBar, "LevelUpProgression" )
					if f34_local1 + 1 > 49 then
						ACTIONS.AnimateSequence( f33_arg0.AARRewardsMissionTeamRank.AARRewardsMissionTeamProgress.AARRewardsRadialBar, "CommanderRankProgression" )
					end
				end
			elseif f33_arg8 == AARRewards.states.KEY_PROGRESSION then
				f33_arg2.keys.displayKeys:SetValue( f33_arg1, f33_arg2.keys.displayKeys:GetValue( f33_arg1 ) + 1 )
				ACTIONS.AnimateSequence( f33_arg0.AARRewardsKeys.AARRewardsKeyProgress.AARRewardsRadialBar, "LevelUpProgression" )
			end
		end
		
		local f33_local6 = function ()
			if f33_arg0.complete then
				return 
			end
			local f35_local0 = 0
			local f35_local1 = 1
			if f33_local0 == 0 then
				f35_local0 = f33_arg4
			end
			if f33_local0 == f33_arg3 then
				f35_local1 = f33_arg5
			end
			local f35_local2 = f33_arg6 * (f35_local1 - f35_local0)
			if f35_local2 > 0.05 then
				f33_arg0:playSound( "progressFill", true )
			end
			local f35_local3 = nil
			if f33_arg8 == AARRewards.states.RANK then
				f33_arg0.AARRewardsRank.AARRewardsRankProgress.AARRewardsRadialBar.PreviousRadialBarRank:SetProgress( f35_local0 )
				f33_arg0.AARRewardsRank.AARRewardsRankProgress.AARRewardsRadialBar.RadialBarRank:SetProgress( f35_local0 )
				f35_local3 = f33_arg0.AARRewardsRank.AARRewardsRankProgress.AARRewardsRadialBar.RadialBarRank:SetProgress( f35_local1, f35_local2, 6 )
			elseif f33_arg8 == AARRewards.states.MISSION_TEAM then
				f33_arg0.AARRewardsMissionTeamRank.AARRewardsMissionTeamProgress.AARRewardsRadialBar.PreviousRadialBarRank:SetProgress( f35_local0 )
				f33_arg0.AARRewardsMissionTeamRank.AARRewardsMissionTeamProgress.AARRewardsRadialBar.RadialBarRank:SetProgress( f35_local0 )
				f35_local3 = f33_arg0.AARRewardsMissionTeamRank.AARRewardsMissionTeamProgress.AARRewardsRadialBar.RadialBarRank:SetProgress( f35_local1, f35_local2, 6 )
			elseif f33_arg8 == AARRewards.states.KEY_PROGRESSION then
				f33_arg0.AARRewardsKeys.AARRewardsKeyProgress.AARRewardsRadialBar.PreviousRadialBarRank:SetProgress( f35_local0 )
				f33_arg0.AARRewardsKeys.AARRewardsKeyProgress.AARRewardsRadialBar.RadialBarRank:SetProgress( f35_local0 )
				f35_local3 = f33_arg0.AARRewardsKeys.AARRewardsKeyProgress.AARRewardsRadialBar.RadialBarRank:SetProgress( f35_local1, f35_local2, 6 )
			end
			if f35_local3 then
				f35_local3.onComplete = function ()
					f33_arg0:stopSound( "progressFill" )
				end
				
			end
			if f33_local0 ~= f33_arg3 then
				local f35_local4 = f33_arg0:Wait( math.max( 1, f35_local2 ) )
				f35_local4.onComplete = f33_local5
			end
			f33_local0 = f33_local0 + 1
		end
		
		if f33_local2 == 0 then
			local f33_local7 = f33_arg0:Wait( math.max( 1, f33_local1 ) )
			f33_local7.onComplete = f33_local6
			if f33_local2 == f33_arg3 then
				f33_local1 = f33_local1 + f33_arg6 * (f33_arg5 - f33_arg4) + f33_arg7
			else
				f33_local1 = f33_local1 + f33_arg6 * (1 - f33_arg4) + f33_arg7
			end
		else
			local f33_local7 = f33_arg0:Wait( math.max( 1, f33_local1 ) )
			f33_local7.onComplete = f33_local6
			if f33_local2 == f33_arg3 then
				f33_local1 = f33_local1 + f33_arg6 * f33_arg5 + f33_arg7
			else
				f33_local1 = f33_local1 + f33_arg6 + f33_arg7
			end
		end
	end
	return f33_local1
end

AARRewards.AdvanceReward = function ( f37_arg0, f37_arg1, f37_arg2, f37_arg3, f37_arg4 )
	local f37_local0 = DataSources.frontEnd.AAR.rewards.levelUpItemCountModel:GetValue( f37_arg1 )
	local f37_local1 = DataSources.frontEnd.AAR.rewards.missionTeamItemCountModel:GetValue( f37_arg1 )
	local f37_local2 = DataSources.frontEnd.AAR.rewards.supplyDropCountModel:GetValue( f37_arg1 )
	local f37_local3 = 300
	local f37_local4 = 2000
	local f37_local5 = 2000
	local f37_local6 = 1000
	local f37_local7 = 500
	local f37_local8 = 3000
	local f37_local9 = 3000
	local f37_local10 = 500
	local f37_local11 = 3000
	local f37_local12 = 3000
	local f37_local13 = 500
	if f37_arg0.complete then
		return 
	elseif Engine.IsCoreMode() and DataSources.frontEnd.MP.usedDoubleXPToken:GetValue( f37_arg1 ) and not f37_arg4 then
		return 
	end
	local f37_local14 = f37_arg0:GetCurrentMenu()
	if f37_local14.rewardsComplete then
		AARRewards.CompleteAnimation( f37_arg0, f37_arg1, f37_arg2 )
		return 
	end
	f0_local19( f37_arg0, f37_arg3, f37_arg1 )
	if f37_arg3 == AARRewards.states.RANK then
		f37_local4 = math.max( f37_local5, f0_local20( f37_arg0, f37_arg1, f37_arg2, f37_arg2.rank.currentRank:GetValue( f37_arg1 ) - f37_arg2.rank.rankBeforeLastMatch:GetValue( f37_arg1 ), f37_arg2.rank.percentToNextRankBeforeLastMatch:GetValue( f37_arg1 ), f37_arg2.rank.percentToNextRank:GetValue( f37_arg1 ), f37_local6, f37_local7, f37_arg3, f37_arg4 ) ) + f37_local3 * f37_local0
		local f37_local15 = f37_arg2.unlockRewards:SetCountValue( f37_arg1, f37_arg3 )
	elseif f37_arg3 == AARRewards.states.MISSION_TEAM then
		f37_local14 = MissionDirector.GetActiveMissionTeam( f37_arg1 )
		local f37_local16 = MissionDirector.GetMissionTeamLevel( f37_arg1, f37_local14 )
		local f37_local17 = Engine.GetDvarInt( "lui_mc_lastMissionCompletionTier" )
		local f37_local18 = false
		f0_local16( f37_arg0, f37_arg1, f37_local14 )
		local f37_local19 = MissionDirector.GetMissionXP( f37_arg1, f37_local14 )
		local f37_local15 = f37_local19 - MissionDirector.GetRoundXP( f37_arg1, f37_local17, f37_local14, DataSources.alwaysLoaded.playerData.MP.common.round.gameMode:GetValue( f37_arg1 ) )
		local f37_local20 = nil
		if f37_local15 < 0 then
			f37_local18 = true
			f37_local20 = MissionDirector.GetMissionXPToLevelUp( f37_arg1, f37_local14, f37_local16 - 1 )
			f37_local15 = f37_local15 + f37_local20
		else
			f37_local20 = MissionDirector.GetMissionXPToLevelUp( f37_arg1, f37_local14, f37_local16 )
		end
		local f37_local21 = f37_local19 / MissionDirector.GetMissionXPToNextLevel( f37_arg1, f37_local14 )
		local f37_local22 = f37_local15 / f37_local20
		local f37_local23 = 0
		if f37_local18 then
			f37_local23 = 1
		end
		f37_local4 = math.max( f37_local8, f0_local20( f37_arg0, f37_arg1, f37_arg2, f37_local23, f37_local22, f37_local21, f37_local9, f37_local10, f37_arg3, f37_arg4 ) ) + f37_local3 * f37_local1
		local f37_local24 = f37_arg2.unlockRewards:SetCountValue( f37_arg1, f37_arg3 )
	elseif f37_arg3 == AARRewards.states.KEY_PROGRESSION then
		f37_local14 = DataSources.frontEnd.MP.commerce.baseInGameCurrency:GetValue( f37_arg1 )
		local f37_local16 = Rewards.GetMissionRewards( f37_arg1 )
		local f37_local18 = f37_local14 - f37_local16.Currency
		local f37_local19 = CoD.GetAdjustedCurrency( f37_local14 )
		local f37_local25 = CoD.GetAdjustedCurrency( f37_local18 )
		local f37_local15 = DataSources.frontEnd.MP.commerce.percentToNextInGameDollar:GetValue( f37_arg1 )
		local f37_local20 = CoD.GetPercentToNextCurrency( f37_local18 )
		local f37_local21 = f37_local19 - f37_local25
		f0_local17( f37_arg1, f37_local19 )
		f37_local4 = math.max( f37_local11, f0_local20( f37_arg0, f37_arg1, f37_arg2, f37_local21, f37_local20, f37_local15, f37_local12, f37_local13, f37_arg3, f37_arg4 ) ) + f37_local3 * f37_local2
		local f37_local23 = f37_arg2.unlockRewards:SetCountValue( f37_arg1, f37_arg3 )
	elseif f37_arg3 == AARRewards.states.COMPLETED then
		f0_local15( f37_arg0, true )
		f0_local13( f37_arg0, false, "AARRewardsKeys", "AARRewardsKeys.AARRewardsKeyProgress", f37_arg1 )
		f37_local14 = f37_arg0:GetCurrentMenu()
		f37_local14.AARTabs.Tabs:ShowTabs( f37_arg1 )
		f0_local14( f37_arg0, f37_local14, f37_arg1, f37_arg2 )
		f0_local18( f37_arg0 )
		f37_arg2.unlockRewards.CheckForNewRig()
	end
	if not f37_arg0.rewardsComplete then
		f37_local14 = f37_local4
		local f37_local16 = f37_arg0:Wait( math.max( 1, 0.4 * f37_local14 ) )
		f37_local16.onComplete = function ()
			if f37_arg3 == AARRewards.states.MISSION_TEAM then
				local f38_local0 = MissionDirector.GetActiveMissionTeam( f37_arg1 )
				local f38_local1 = MissionDirector.GetMissionTeamLevel( f37_arg1, f38_local0 ) + 1
				local f38_local2 = Engine.GetDvarInt( "lui_mc_lastMissionCompletionTier" )
				local f38_local3 = "mission_fail"
				if f38_local2 == 0 then
					f38_local3 = "mission_complete"
				elseif f38_local2 == 1 then
					f38_local3 = "mission_complete_bronze"
				elseif f38_local2 == 2 then
					f38_local3 = "mission_complete_silver"
				elseif f38_local2 == 3 then
					f38_local3 = "mission_complete_gold"
				end
				f37_arg0:dispatchEventToCurrentMenu( {
					name = "show_commander_message",
					eventID = f38_local3
				} )
				local f38_local4 = MissionDirector.GetMissionXP( f37_arg1, f38_local0 )
				local f38_local5 = MissionDirector.GetMissionTeamLevel( f37_arg1, f38_local0 )
				if f38_local4 - MissionDirector.GetRoundXP( f37_arg1, f38_local2, f38_local0, DataSources.alwaysLoaded.playerData.MP.common.round.gameMode:GetValue( f37_arg1 ) ) <= 0 then
					if f38_local1 % 10 == 0 and f38_local1 > 0 then
						f37_arg0:dispatchEventToCurrentMenu( {
							name = "show_commander_message",
							eventID = "mt_level_milestone"
						} )
					end
					if DataSources.frontEnd.AAR.rewards.missionTeamItemCountModel:GetValue( f37_arg1 ) > 0 then
						f37_arg0:dispatchEventToCurrentMenu( {
							name = "show_commander_message",
							eventID = "mt_supply_drop"
						} )
					end
				end
			elseif f37_arg3 == AARRewards.states.KEY_PROGRESSION and DataSources.frontEnd.AAR.rewards.supplyDropCountModel:GetValue( f37_arg1 ) > 0 then
				f37_arg0:dispatchEventToCurrentMenu( {
					name = "show_commander_message",
					eventID = "cryptokeys_supplydrop"
				} )
			end
		end
		
		local f37_local17 = f37_arg0:Wait( math.max( 1, f37_local14 ) )
		f37_local17.onComplete = function ()
			if f37_arg4 then
				f37_arg3 = AARRewards.states.COMPLETED
				f37_arg2.unlockRewards:SetCountValue( f37_arg1, f37_arg3 )
			else
				f37_arg3 = f37_arg3 + 1
				if Engine.IsAliensMode() and f37_arg3 == AARRewards.states.MISSION_TEAM then
					f37_arg3 = f37_arg3 + 1
				end
			end
			AARRewards.AdvanceReward( f37_arg0, f37_arg1, f37_arg2, f37_arg3, f37_arg4 )
		end
		
	end
end

local f0_local21 = function ( menu, controller )
	local timer = LUI.UITimer.new( nil, {
		interval = 750,
		event = "updateRewards",
		disposable = false,
		broadcastToRoot = false,
		stopped = false,
		controllerIndex = controller
	} )
	menu:addElement( timer )
	menu.timer = timer
	
end

local f0_local22 = function ( f41_arg0, f41_arg1, f41_arg2 )
	local f41_local0 = assert
	local UnlockedItemsGrid = f41_arg0.AARRewardsRank
	if UnlockedItemsGrid then
		UnlockedItemsGrid = f41_arg0.ArrowLeft
		if UnlockedItemsGrid then
			UnlockedItemsGrid = f41_arg0.ArrowRight and f41_arg0.ListCount
		end
	end
	f41_local0( UnlockedItemsGrid, "WARNING: AAR Reward Summary Items Are Misssing..." )
	f41_local0 = {
		maxVisibleColumns = 5,
		maxVisibleRows = 1,
		controllerIndex = f41_arg1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "AARItemCard", {
				controllerIndex = f41_arg1
			} )
		end,
		wrapX = true,
		wrapY = true,
		spacingX = _1080p * 45,
		spacingY = _1080p * 45,
		columnWidth = _1080p * 350,
		rowHeight = _1080p * 420,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Center,
		verticalAlignment = LUI.Alignment.Middle,
		springCoefficient = 400,
		maxVelocity = 5000
	}
	if not CONDITIONS.IsGamepadEnabled( f41_arg0 ) then
		f41_local0.wrapX = false
		f41_local0.maxVelocity = 2000
	end
	UnlockedItemsGrid = LUI.UIDataSourceGrid.new( nil, f41_local0 )
	UnlockedItemsGrid.id = "UnlockedItemsGrid"
	UnlockedItemsGrid:setUseStencil( false )
	UnlockedItemsGrid:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 317, _1080p * 737 )
	f41_arg0:addElement( UnlockedItemsGrid )
	f41_arg0.UnlockedItemsGrid = UnlockedItemsGrid
	
	f41_arg0.addButtonHelperFunction = function ( f43_arg0, f43_arg1 )
		f43_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_MP_SKIP" ),
			button_ref = "button_primary",
			side = "left",
			priority = -10,
			clickable = true
		} )
	end
	
	f41_arg0:addEventHandler( "menu_create", f41_arg0.addButtonHelperFunction )
	if Engine.IsCoreMode() then
		assert( f41_arg0.AARRewardsMissionTeamRank )
		f0_local2 = f41_arg0.AARRewardsMissionTeamRank.widgetModelPath
	end
	local f41_local2 = {}
	InitAARRankDataSources( f41_arg0, f41_local2, f41_arg1 )
	SetAARRankDataSources( f41_arg0, f41_local2, f41_arg1 )
	SetAARKeyDataSources( f41_arg0, f41_local2, f41_arg1 )
	f0_local12( f41_arg0, f41_arg1, f41_local2 )
	f0_local10( f41_arg0, f41_local2, f41_arg1 )
	f0_local11( f41_arg0, f41_local2, f41_arg1 )
	local f41_local3 = AARRewards.states.RANK
	f0_local21( f41_arg0, f41_arg1 )
	f41_arg0:registerEventHandler( "updateRewards", f41_local2.unlockRewards.UpdateRewards )
	f41_arg0.ArrowLeft:SetAlpha( 0 )
	f41_arg0.ArrowRight:SetAlpha( 0 )
	f41_arg0.ListCount:SetAlpha( 0 )
	local f41_local4 = f41_arg0:Wait( 750 )
	f41_local4.onComplete = function ()
		AARRewards.AdvanceReward( f41_arg0, f41_arg1, f41_local2, f41_local3, false )
	end
	
	f41_arg0.complete = false
	f41_arg0.usedDoubleXP = false
	f41_arg0.soundSet = "aarrewards"
	f41_arg0:SetDataSource( f41_local2, f41_arg1 )
	f41_arg0.AARRewardsRank:SetDataSource( f41_local2.rank, f41_arg1 )
	f41_arg0.UnlockedItemsGrid:AddArrow( f41_arg0.ArrowLeft )
	f41_arg0.UnlockedItemsGrid:AddArrow( f41_arg0.ArrowRight )
	f41_arg0.UnlockedItemsGrid:AddItemNumbers( f41_arg0.ListCount )
	
	local bindButton = LUI.UIBindButton.new()
	bindButton:setPriority( -1000 )
	bindButton.id = "selfBindButton"
	f41_arg0:addElement( bindButton )
	f41_arg0.bindButton = bindButton
	
	f41_arg0.bindButton:addEventHandler( "button_primary", function ( f45_arg0, f45_arg1 )
		if not f41_arg0.complete then
			f41_arg0.timer:close()
			AARRewards.CompleteAnimation( f41_arg0, f41_arg1, f41_local2 )
		end
		return true
	end )
	f41_arg0.bindButton:addEventHandler( "button_secondary", function ( f46_arg0, f46_arg1 )
		if f41_arg0:GetCurrentMenu() then
			LUI.FlowManager.RequestLeaveMenu( menu )
		end
	end )
	if Engine.IsCoreMode() then
		PostMatch.PushPerformanceDataToLUIModel( f41_arg1 )
	end
	f41_arg0.UnlockedItemsGrid:registerEventHandler( "gain_focus", function ( element, event )
		if f41_arg0.complete then
			return element:GainFocus()
		else
			return true
		end
	end )
	local f41_local6 = function ()
		f41_arg0.timer:close()
		AARRewards.CompleteAnimation( f41_arg0, f41_arg1, f41_local2 )
	end
	
	f41_arg0.UnlockedItemsGrid:registerEventHandler( "gamepad_button", function ( element, event )
		if f41_arg0.complete then
			return element:GamepadButton( event )
		elseif event.button == "primary" and event.down and not f41_arg0.complete then
			f41_local6()
		end
		return true
	end )
	if f41_arg2.rewardsComplete then
		f41_arg0.rewardsComplete = f41_arg2.rewardsComplete
		f41_arg0.rewardCompleteTimer = f41_arg0:Wait( 150 )
		f41_arg0.rewardCompleteTimer.onComplete = f41_local6
	end
	f41_arg0:registerEventHandler( "doubleXPUsed", function ( element, event )
		local f50_local0 = f41_arg0:GetCurrentMenu()
		if f50_local0 then
			f50_local0.AARTabs.Tabs:ShowTabs( f41_arg1 )
			f0_local14( f41_arg0, f50_local0, f41_arg1, f41_local2 )
		end
	end )
	f41_arg0:registerEventHandler( "showDoubleXPCeremony", function ( element, event )
		f0_local15( f41_arg0, false )
		local f51_local0 = f41_arg0:GetCurrentMenu()
		if f51_local0 then
			f51_local0.AARTabs.Tabs:HideTabs()
			f0_local14( f41_arg0, f51_local0, f41_arg1, f41_local2 )
		end
		SetAARRankDataSources( f41_arg0, f41_local2, f41_arg1 )
		WipeGlobalModelsAtPath( f0_local0 .. ".unlockRewards.reward" )
		f0_local11( f41_arg0, f41_local2, f41_arg1 )
		f0_local21( f41_arg0, f41_arg1 )
		f41_local2.unlockRewards.currentNumToDisplay = 0
		AARRewards.AdvanceReward( f41_arg0, f41_arg1, f41_local2, AARRewards.states.RANK, true )
	end )
end

function AARRewardsSummary( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, -960 * _1080p, 960 * _1080p, -405 * _1080p, 405 * _1080p )
	self.id = "AARRewardsSummary"
	self._animationSets = {}
	self._sequences = {}
	local f52_local1 = controller and controller.controllerIndex
	if not f52_local1 and not Engine.InFrontend() then
		f52_local1 = self:getRootController()
	end
	assert( f52_local1 )
	self.soundSet = "aarrewards"
	self:playSound( "menu_open" )
	local f52_local2 = self
	local f52_local3 = nil
	if CONDITIONS.IsThirdGameMode( self ) then
		f52_local3 = LUI.UIImage.new()
		f52_local3.id = "DiagonalBackground"
		f52_local3:SetRGBFromTable( SWATCHES.AAR.KillsColor, 0 )
		f52_local3:SetAlpha( 0.4, 0 )
		f52_local3:SetZRotation( -164, 0 )
		f52_local3:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -1448, _1080p * 1464, _1080p * 155, _1080p * 631 )
		self:addElement( f52_local3 )
		self.DiagonalBackground = f52_local3
	end
	local f52_local4 = nil
	if Engine.IsMultiplayer() then
		f52_local4 = LUI.UIBlur.new()
		f52_local4.id = "XPBacker"
		f52_local4:SetRGBFromInt( 5066061, 0 )
		f52_local4:SetBlurStrength( 2, 0 )
		f52_local4:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 290 )
		self:addElement( f52_local4 )
		self.XPBacker = f52_local4
	end
	local f52_local5 = nil
	if CONDITIONS.IsThirdGameMode( self ) then
		f52_local5 = MenuBuilder.BuildRegisteredType( "CPMenuWatermark", {
			controllerIndex = f52_local1
		} )
		f52_local5.id = "CPMenuWatermark"
		f52_local5:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 448, _1080p * 1472, _1080p * -107, _1080p * 917 )
		self:addElement( f52_local5 )
		self.CPMenuWatermark = f52_local5
	end
	local f52_local6 = nil
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		f52_local6 = MenuBuilder.BuildRegisteredType( "AARRewardsUpcomingUnlocks", {
			controllerIndex = f52_local1
		} )
		f52_local6.id = "HorizontalBar"
		f52_local6:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 290, _1080p * 335 )
		self:addElement( f52_local6 )
		self.HorizontalBar = f52_local6
	end
	local AARRewardsRank = nil
	
	AARRewardsRank = MenuBuilder.BuildRegisteredType( "AARRewardsRank", {
		controllerIndex = f52_local1
	} )
	AARRewardsRank.id = "AARRewardsRank"
	AARRewardsRank:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 288, _1080p * 838, _1080p * 23, _1080p * 273 )
	self:addElement( AARRewardsRank )
	self.AARRewardsRank = AARRewardsRank
	
	local f52_local8 = nil
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		f52_local8 = MenuBuilder.BuildRegisteredType( "AARRewardsMissionTeamRank", {
			controllerIndex = f52_local1
		} )
		f52_local8.id = "AARRewardsMissionTeamRank"
		f52_local8:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 835, _1080p * 1385, _1080p * 23, _1080p * 273 )
		self:addElement( f52_local8 )
		self.AARRewardsMissionTeamRank = f52_local8
	end
	local AARRewardsKeys = nil
	
	AARRewardsKeys = MenuBuilder.BuildRegisteredType( "AARRewardsKeys", {
		controllerIndex = f52_local1
	} )
	AARRewardsKeys.id = "AARRewardsKeys"
	AARRewardsKeys:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1382, _1080p * 1632, _1080p * 23, _1080p * 273 )
	self:addElement( AARRewardsKeys )
	self.AARRewardsKeys = AARRewardsKeys
	
	local ListCount = nil
	
	ListCount = LUI.UIText.new()
	ListCount.id = "ListCount"
	ListCount:setText( "0/0", 0 )
	ListCount:SetFontSize( 24 * _1080p )
	ListCount:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ListCount:SetAlignment( LUI.Alignment.Center )
	ListCount:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -71, _1080p * 71, _1080p * -59, _1080p * -35 )
	self:addElement( ListCount )
	self.ListCount = ListCount
	
	local ArrowLeft = nil
	
	ArrowLeft = MenuBuilder.BuildRegisteredType( "ArrowLeft", {
		controllerIndex = f52_local1
	} )
	ArrowLeft.id = "ArrowLeft"
	ArrowLeft:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -91, _1080p * -71, _1080p * -67, _1080p * -27 )
	self:addElement( ArrowLeft )
	self.ArrowLeft = ArrowLeft
	
	local ArrowRight = nil
	
	ArrowRight = MenuBuilder.BuildRegisteredType( "ArrowRight", {
		controllerIndex = f52_local1
	} )
	ArrowRight.id = "ArrowRight"
	ArrowRight:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * 71, _1080p * 91, _1080p * -67, _1080p * -27 )
	self:addElement( ArrowRight )
	self.ArrowRight = ArrowRight
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		AARRewardsRank:RegisterAnimationSequence( "CPDefault", {
			{
				function ()
					return self.AARRewardsRank:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 541, _1080p * 1091, _1080p * 23, _1080p * 273, 0 )
				end
			}
		} )
		AARRewardsKeys:RegisterAnimationSequence( "CPDefault", {
			{
				function ()
					return self.AARRewardsKeys:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1132, _1080p * 1382, _1080p * 23, _1080p * 273, 0 )
				end
			}
		} )
		self._sequences.CPDefault = function ()
			AARRewardsRank:AnimateSequence( "CPDefault" )
			AARRewardsKeys:AnimateSequence( "CPDefault" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local22( self, f52_local1, controller )
	if CONDITIONS.IsThirdGameMode( self ) then
		ACTIONS.AnimateSequence( self, "CPDefault" )
	end
	return self
end

MenuBuilder.registerType( "AARRewardsSummary", AARRewardsSummary )
LUI.FlowManager.RegisterStackPopBehaviour( "AARRewardsSummary", f0_local3 )
LockTable( _M )
