ItemCardUtils = {
	GetCamoWeaponCategory = function ( f1_arg0 )
		assert( f1_arg0 )
		local f1_local0 = ""
		local f1_local1 = LUI.Split( Engine.TableLookup( CSV.cosmeticCamosLootMaster.file, CSV.cosmeticCamosLootMaster.cols.index, f1_arg0, CSV.cosmeticCamosLootMaster.cols.ref ), "+" )
		if #f1_local1 > 0 then
			return Engine.Localize( "MP_FRONTEND_ONLY_WEAPONCATEGORY_WEAPONITEM", Cac.GetWeaponClassName( f1_local1[1] ), "MENU_CAMO_CAPS" )
		else
			return Engine.Localize( "MP_FRONTEND_ONLY_CAMO_ANY_WEAPON" )
		end
	end,
	GetReticleWeaponCategory = function ( f2_arg0 )
		assert( f2_arg0 )
		local f2_local0 = ""
		local f2_local1 = Engine.TableLookup( CSV.reticles.file, CSV.reticles.cols.ref, Engine.TableLookup( CSV.cosmeticReticlesLootMaster.file, CSV.cosmeticReticlesLootMaster.cols.index, f2_arg0, CSV.cosmeticReticlesLootMaster.cols.ref ), CSV.reticles.cols.type )
		local f2_local2 = nil
		if f2_local1 == Cac.ReticleTypes.Standard then
			f2_local2 = "MP_FRONTEND_ONLY_STANDARD"
		elseif f2_local1 == Cac.ReticleTypes.Scoped then
			f2_local2 = "MP_FRONTEND_ONLY_SCOPED"
		end
		if f2_local2 ~= nil then
			f2_local0 = Engine.Localize( "MP_FRONTEND_ONLY_WEAPONCATEGORY_WEAPONITEM", f2_local2, "MENU_RETICLE_CAPS" )
		end
		return f2_local0
	end,
	GetRigCategory = function ( f3_arg0, f3_arg1 )
		assert( f3_arg0 )
		local f3_local0 = ""
		if f3_arg1 then
			f3_local0 = Engine.Localize( "MP_FRONTEND_ONLY_RIGNAME_RIGITEMNAME", "LUA_MENU_CUSTOMIZATION_FIELD_HERO_CAPS", "LUA_MENU_CUSTOMIZATION_FIELD_HEAD_AND_BODY_CAPS" )
		else
			local f3_local1 = ""
			local f3_local2 = ""
			local f3_local3 = false
			local f3_local4 = false
			local f3_local5 = Engine.TableLookup( CSV.cosmeticRigsLootMaster.file, CSV.cosmeticRigsLootMaster.cols.index, f3_arg0, CSV.cosmeticCamosLootMaster.cols.ref )
			local f3_local6 = Engine.TableLookup( CSV.cosmeticRigsLootMaster.file, CSV.cosmeticRigsLootMaster.cols.index, f3_arg0, CSV.cosmeticCamosLootMaster.cols.type )
			local f3_local7 = nil
			if f3_local6 == Cac.RigLootTypes.Head then
				f3_local3 = true
				f3_local2 = "LUA_MENU_CUSTOMIZATION_FIELD_HEAD_CAPS"
				f3_local7 = Engine.TableLookup( CSV.heads.file, CSV.heads.cols.model, f3_local5, CSV.heads.cols.rigRef )
			elseif f3_local6 == Cac.RigLootTypes.Body then
				f3_local4 = true
				f3_local2 = "LUA_MENU_CUSTOMIZATION_FIELD_BODY_CAPS"
				f3_local7 = Engine.TableLookup( CSV.bodies.file, CSV.bodies.cols.model, f3_local5, CSV.bodies.cols.rigRef )
			end
			if f3_local7 ~= nil then
				f3_local0 = Engine.Localize( "MP_FRONTEND_ONLY_RIGNAME_RIGITEMNAME", Engine.TableLookup( CSV.battleRigs.file, CSV.battleRigs.cols.ref, f3_local7, CSV.battleRigs.cols.name ), f3_local2 )
			end
		end
		return f3_local0
	end,
	GetEmoteCategory = function ( f4_arg0 )
		assert( f4_arg0 )
		local f4_local0 = ""
		local f4_local1 = Engine.TableLookup( CSV.cosmeticEmotesLootMaster.file, CSV.cosmeticEmotesLootMaster.cols.index, f4_arg0, CSV.cosmeticEmotesLootMaster.cols.type )
		if f4_local1 == Cac.RigEmoteTypes.Gesture then
			f4_local0 = Engine.Localize( "LUA_MENU_MP_CUSTOMIZE_GESTURE" )
		elseif f4_local1 == Cac.RigEmoteTypes.Taunt then
			local f4_local2 = Engine.TableLookup( CSV.taunts.file, CSV.taunts.cols.ref, Engine.TableLookup( CSV.cosmeticEmotesLootMaster.file, CSV.cosmeticEmotesLootMaster.cols.index, f4_arg0, CSV.cosmeticEmotesLootMaster.cols.ref ), CSV.taunts.cols.rigRef )
			local f4_local3 = nil
			if f4_local2 == Cac.RigArchetypes.Human then
				f4_local3 = "MP_FRONTEND_ONLY_ALL_BUT_C6"
			else
				f4_local3 = Engine.TableLookup( CSV.battleRigs.file, CSV.battleRigs.cols.ref, f4_local2, CSV.battleRigs.cols.name )
			end
			if f4_local3 ~= nil and #f4_local3 > 0 then
				f4_local0 = Engine.Localize( "MP_FRONTEND_ONLY_RIGNAME_RIGITEMNAME", f4_local3, "LUA_MENU_MP_CUSTOMIZE_TAUNT" )
			else
				f4_local0 = Engine.Localize( "LUA_MENU_MP_CUSTOMIZE_TAUNT" )
			end
		end
		return f4_local0
	end,
	GetItemCategory = function ( f5_arg0, f5_arg1, f5_arg2 )
		assert( f5_arg0 )
		local f5_local0 = ""
		if f5_arg0 == LUI.ItemCard.types.COSMETIC_CAMO then
			f5_local0 = ItemCardUtils.GetCamoWeaponCategory( f5_arg1 )
		elseif f5_arg0 == LUI.ItemCard.types.CALLING_CARD then
			f5_local0 = Engine.Localize( "LUA_MENU_MP_CALLING_CARD" )
		elseif f5_arg0 == LUI.ItemCard.types.EMBLEM then
			f5_local0 = Engine.Localize( "MENU_PLAYERCARD_ICON" )
		elseif f5_arg0 == LUI.ItemCard.types.GESTURE then
			f5_local0 = ItemCardUtils.GetEmoteCategory( f5_arg1 )
		elseif f5_arg0 == LUI.ItemCard.types.WEAPON then
			f5_local0 = Cac.GetWeaponClassName( Cac.GetWeaponClass( Cac.GetBaseWeaponRefFromLootID( f5_arg1 ) ) )
		elseif f5_arg0 == LUI.ItemCard.types.RIG_HEAD then
			f5_local0 = ItemCardUtils.GetRigCategory( f5_arg1, f5_arg2 )
		elseif f5_arg0 == LUI.ItemCard.types.ATTACHMENT then
			f5_local0 = Engine.Localize( "PRESTIGE_WEAPON_PRESTIGE_REWARD_CATEGORY" )
		elseif f5_arg0 == LUI.ItemCard.types.RETICLE then
			f5_local0 = ItemCardUtils.GetReticleWeaponCategory( f5_arg1 )
		elseif f5_arg0 == LUI.ItemCard.types.COSMETIC_ATTACHMENT then
			f5_local0 = Engine.Localize( "MENU_ACCESSORY" )
		elseif f5_arg0 == LUI.ItemCard.types.CURRENCY or f5_arg0 == LUI.ItemCard.types.CURRENCY_PACK then
			f5_local0 = Engine.Localize( "LUA_MENU_MP_CURRENCY" )
		elseif f5_arg0 == LUI.ItemCard.types.CONSUMABLE then
			f5_local0 = Engine.Localize( "LUA_MENU_MP_CONSUMABLE" )
		end
		return f5_local0
	end,
	GetGestureName = function ( f6_arg0 )
		assert( f6_arg0 )
		return Engine.Localize( Engine.TableLookup( CSV.gestures.file, CSV.gestures.cols.ref, tostring( f6_arg0 ), CSV.gestures.cols.name ) )
	end,
	GetGestureImage = function ( f7_arg0 )
		assert( f7_arg0 )
		return Engine.TableLookup( CSV.gestures.file, CSV.gestures.cols.ref, tostring( f7_arg0 ), CSV.gestures.cols.uiImage )
	end,
	GetGestureDesc = function ( f8_arg0 )
		assert( f8_arg0 )
		return Engine.Localize( Engine.TableLookup( CSV.gestures.file, CSV.gestures.cols.ref, tostring( f8_arg0 ), CSV.gestures.cols.customUnlockString ) )
	end,
	GetEmblemName = function ( f9_arg0 )
		assert( f9_arg0 )
		return Engine.Localize( Engine.TableLookup( CSV.emblemSets.file, CSV.emblemSets.cols.id, tostring( f9_arg0 ), CSV.emblemSets.cols.description ) )
	end,
	GetEmblemImage = function ( f10_arg0 )
		assert( f10_arg0 )
		return Engine.TableLookup( CSV.emblemSets.file, CSV.emblemSets.cols.id, tostring( f10_arg0 ), CSV.emblemSets.cols.image )
	end,
	GetGestureItemCardData = function ( f11_arg0 )
		assert( f11_arg0 )
		return {
			name = ItemCardUtils.GetGestureName( f11_arg0 ),
			image = ItemCardUtils.GetGestureImage( f11_arg0 ),
			desc = ItemCardUtils.GetGestureDesc( f11_arg0 )
		}
	end,
	GetEmblemItemCardData = function ( f12_arg0 )
		assert( f12_arg0 )
		return {
			name = ItemCardUtils.GetEmblemName( f12_arg0 ),
			image = ItemCardUtils.GetEmblemImage( f12_arg0 )
		}
	end,
	GetCallingCardItemCardData = function ( f13_arg0 )
		assert( f13_arg0 )
		local f13_local0 = Engine.TableLookup( CSV.callingCards.file, CSV.callingCards.cols.unlockID, f13_arg0, CSV.callingCards.cols.index )
		local f13_local1 = CallingCardUtils.GetCardChallenge( f13_local0 )
		if f13_local1 == nil or f13_local1 == "" then
			return {
				title = Engine.Localize( "LUA_MENU_MP_CALLING_CARD" ),
				name = f13_arg0,
				image = "",
				desc = ""
			}
		else
			local f13_local2 = CSV.allChallengesTable.file
			return {
				title = Engine.Localize( "LUA_MENU_MP_CALLING_CARD" ),
				name = CallingCardUtils.GetCardChallengeName( f13_local1 ),
				image = CallingCardUtils.GetCardTexture( f13_local0 ),
				desc = CallingCardUtils.GetCardChallengeDesc( f13_local1, Engine.TableLookup( CSV.allChallengesTable.file, CSV.allChallengesTable.cols.ref, f13_local1, CSV.allChallengesTable.cols.tiers.targetStart + CSV.allChallengesTable.numTierCols * (tonumber( Engine.TableLookup( CSV.callingCardUnlockTable.file, CSV.callingCardUnlockTable.cols.ref, f13_local1, CSV.callingCardUnlockTable.cols.unlockRank ) ) - 1) ) )
			}
		end
	end
}
local f0_local0 = function ( f14_arg0, f14_arg1, f14_arg2 )
	assert( f14_arg0 )
	local f14_local0 = Engine.TableLookup( f14_arg1.file, f14_arg1.cols.ref, f14_arg0, f14_arg1.cols.challenge )
	if f14_local0 == nil or f14_local0 == "" then
		return {
			title = Engine.Localize( f14_arg2 ),
			name = f14_arg0,
			image = "",
			desc = ""
		}
	else
		local f14_local1 = CSV.allChallengesTable.file
		return {
			title = Engine.Localize( "MP_FRONTEND_ONLY_RIGNAME_RIGITEMNAME", Engine.TableLookup( CSV.battleRigs.file, CSV.battleRigs.cols.ref, Engine.TableLookup( f14_arg1.file, f14_arg1.cols.ref, f14_arg0, f14_arg1.cols.rigRef ), CSV.battleRigs.cols.name ), f14_arg2 ),
			name = Engine.Localize( Engine.TableLookup( f14_arg1.file, f14_arg1.cols.ref, f14_arg0, f14_arg1.cols.name ) ),
			image = Engine.TableLookup( f14_arg1.file, f14_arg1.cols.ref, f14_arg0, f14_arg1.cols.uiImage ),
			desc = Challenge.GetLocalizedChallengeDesc( f14_local0, Engine.TableLookup( CSV.allChallengesTable.file, CSV.allChallengesTable.cols.ref, f14_local0, CSV.allChallengesTable.cols.tiers.targetStart + CSV.allChallengesTable.numTierCols * Engine.TableLookup( f14_arg1.file, f14_arg1.cols.ref, f14_arg0, f14_arg1.cols.challengeTier ) ) )
		}
	end
end

ItemCardUtils.GetRigBodyItemCardData = function ( f15_arg0 )
	assert( f15_arg0 )
	return f0_local0( f15_arg0, CSV.bodies, "LUA_MENU_CUSTOMIZATION_FIELD_BODY_CAPS" )
end

ItemCardUtils.GetRigHeadItemCardData = function ( f16_arg0 )
	assert( f16_arg0 )
	return f0_local0( f16_arg0, CSV.heads, "LUA_MENU_CUSTOMIZATION_FIELD_HEAD_CAPS" )
end

ItemCardUtils.IsInventoryItem = function ( f17_arg0 )
	local f17_local0
	if f17_arg0 ~= LUI.ItemCard.contexts.INVENTORY_ITEM and f17_arg0 ~= LUI.ItemCard.contexts.INVENTORY_CATEGORY then
		f17_local0 = false
	else
		f17_local0 = true
	end
	return f17_local0
end

ItemCardUtils.IsCompareItem = function ( f18_arg0 )
	local f18_local0
	if f18_arg0 ~= LUI.ItemCard.contexts.WEAPON_COMPARE_BASE and f18_arg0 ~= LUI.ItemCard.contexts.WEAPON_COMPARE_LOOT then
		f18_local0 = false
	else
		f18_local0 = true
	end
	return f18_local0
end

ItemCardUtils.IsLootItem = function ( f19_arg0 )
	local f19_local0
	if f19_arg0 ~= LUI.ItemCard.contexts.ITEM_CRAFTED and f19_arg0 ~= LUI.ItemCard.contexts.INVENTORY_ITEM and f19_arg0 ~= LUI.ItemCard.contexts.AAR_SUPPLY_DROP and f19_arg0 ~= LUI.ItemCard.contexts.WEAPON_COMPARE_LOOT and f19_arg0 ~= LUI.ItemCard.contexts.LOOT_CEREMONY and f19_arg0 ~= LUI.ItemCard.contexts.CP_WEAPON_LOOT and f19_arg0 ~= LUI.ItemCard.contexts.CONTRACT_REWARD and f19_arg0 ~= LUI.ItemCard.contexts.QUARTERMASTER_CIPHER then
		f19_local0 = false
	else
		f19_local0 = true
	end
	return f19_local0
end

ItemCardUtils.IsMTXPItem = function ( f20_arg0 )
	return f20_arg0 == LUI.ItemCard.contexts.MTXP
end

ItemCardUtils.SetupItemCardData = function ( f21_arg0, f21_arg1, f21_arg2, f21_arg3, f21_arg4 )
	local f21_local0 = nil
	if ItemCardUtils.IsLootItem( f21_arg1 ) then
		f21_local0 = LOOT.GetLootData( f21_arg3 )
		if not f21_local0.displayName then
			f21_local0.displayName = ""
		else
			f21_local0.displayName = Engine.Localize( f21_local0.displayName )
		end
		f21_local0.qualityImage = Cac.GetLootQualityImage( f21_local0.quality )
		f21_local0.qualityName = Cac.GetLootQualityString( f21_local0.quality )
		f21_local0.qualityColor = Cac.GetLootQualityColor( f21_local0.quality )
		f21_local0.itemCategory = ItemCardUtils.GetItemCategory( f21_arg2, f21_arg3, f21_local0.isHero )
		local f21_local1 = ""
		if Engine.IsCoreMode() then
			local f21_local2 = MissionDirector.GetActiveMissionTeam( f21_arg4 )
			f21_local1 = MissionDirector.GetMissionTeamName( f21_local2 )
			f21_local0.missionTeamID = f21_local2
		end
		if f21_arg2 == LUI.ItemCard.types.WEAPON then
			f21_local0.title = Cac.GetWeaponClassName( Cac.GetWeaponClass( Cac.GetBaseWeaponRefFromLootID( f21_arg3 ) ) )
			f21_local0.footer = f21_local1
			f21_local0.baseWeaponRef = Cac.GetBaseWeaponRefFromLootID( f21_arg3 )
			f21_local0.isMk2 = Cac.IsLootIDMk2( f21_arg3 )
		elseif f21_arg2 == LUI.ItemCard.types.CRATE then
			if f21_arg1 ~= LUI.ItemCard.contexts.LOOT_CEREMONY then
				if f21_local0.isBribeCrate == "1" then
					f21_local0.title = Engine.Localize( "MP_CONTRACTS_REWARD_TITLE" )
					f21_local0.footer = Engine.Localize( "LUA_MENU_MP_QUARTERMASTER_HACK" )
					f21_local0.earnedText = Engine.Localize( "LUA_MENU_MP_HACK_DIRECTIONS" )
					if Engine.IsAliensMode() then
						f21_local0.footer = ""
						f21_local0.earnedText = Engine.Localize( "ZM_CONTRACTS_CONTRACT_OPEN_HINT" )
						f21_local0.title = Engine.Localize( "ZM_CONTRACTS_REWARD_TITLE" )
					end
				else
					local f21_local2 = f21_local0.cost / 100
					local f21_local3 = DataSources.frontEnd.MP.commerce.inGameCurrency:GetValue( f21_arg4 )
					f21_local0.earnedText = Engine.Localize( "LUA_MENU_MP_ENOUGH_CRYPTOKEYS", math.floor( f21_local3 / f21_local2 ), Engine.Localize( f21_local0.displayName ) )
					f21_local0.title = Engine.Localize( "LUA_MENU_MP_ENOUGH_CRYPTOKEYS_TITLE" )
					f21_local0.footer = Engine.Localize( "LUA_MENU_MP_TOTAL_KEYS", f21_local3 )
				end
			end
		else
			f21_local0.title = ToUpperCase( ItemCardUtils.GetItemCategory( f21_arg2, f21_arg3, f21_local0.isHero ) )
			f21_local0.footer = f21_local1
		end
		if not f21_local0.displayImage then
			f21_local0.displayImage = ""
		end
	elseif f21_arg2 == LUI.ItemCard.types.ATTACHMENT then
		f21_local0 = Cac.GetAttachmentItemCardData( f21_arg3 )
	elseif f21_arg2 == LUI.ItemCard.types.CALLING_CARD then
		f21_local0 = ItemCardUtils.GetCallingCardItemCardData( f21_arg3 )
	elseif f21_arg2 == LUI.ItemCard.types.CAMO then
		f21_local0 = Cac.GetWeaponCamoItemCardData( f21_arg3 )
	elseif f21_arg2 == LUI.ItemCard.types.CARE_PACKAGE then
		
	elseif f21_arg2 == LUI.ItemCard.types.EMBLEM then
		f21_local0 = ItemCardUtils.GetEmblemItemCardData( f21_arg3 )
	elseif f21_arg2 == LUI.ItemCard.types.GESTURE then
		f21_local0 = ItemCardUtils.GetGestureItemCardData( f21_arg3 )
	elseif f21_arg2 == LUI.ItemCard.types.POWER then
		f21_local0 = Cac.GetPowerItemCardData( f21_arg3 )
	elseif f21_arg2 == LUI.ItemCard.types.MISSION_TEAM then
		f21_local0 = MissionDirector.GetItemCardData( f21_arg3 )
	elseif f21_arg2 == LUI.ItemCard.types.PERK then
		f21_local0 = Cac.GetPerkItemCardData( f21_arg3 )
	elseif f21_arg2 == LUI.ItemCard.types.PICK_10 then
		f21_local0 = Cac.GetPick10ItemCardData( f21_arg3 )
	elseif f21_arg2 == LUI.ItemCard.types.RETICLE then
		
	elseif f21_arg2 == LUI.ItemCard.types.RIG then
		f21_local0 = Cac.GetRigItemCardData( f21_arg3 )
	elseif f21_arg2 == LUI.ItemCard.types.RIG_BODY then
		f21_local0 = ItemCardUtils.GetRigBodyItemCardData( f21_arg3 )
	elseif f21_arg2 == LUI.ItemCard.types.RIG_HEAD then
		f21_local0 = ItemCardUtils.GetRigHeadItemCardData( f21_arg3 )
	elseif f21_arg2 == LUI.ItemCard.types.RIG_PACKAGE then
		
	elseif f21_arg2 == LUI.ItemCard.types.STREAK then
		f21_local0 = Cac.GetStreakItemCardData( f21_arg3 )
	elseif f21_arg2 == LUI.ItemCard.types.SUPER then
		f21_local0 = Cac.GetRigSuperItemCardData( f21_arg3 )
	elseif f21_arg2 == LUI.ItemCard.types.TRAIT then
		f21_local0 = Cac.GetRigTraitItemCardData( f21_arg3 )
	elseif f21_arg2 == LUI.ItemCard.types.WEAPON then
		f21_local0 = Cac.GetProgressionWeaponItemCardData( f21_arg3 )
	elseif f21_arg2 == LUI.ItemCard.types.FATE_CARD then
		f21_local0 = ZMB_CONSUMABLES.GetZMBFateCardItemCardData( f21_arg3 )
	elseif f21_arg2 == LUI.ItemCard.types.FATE_DECK_SIZE then
		f21_local0 = ZMB_CONSUMABLES.GetDeckSizeItemCardData( f21_arg3 )
	elseif f21_arg2 == LUI.ItemCard.types.COSMETIC_CAMO then
		
	elseif f21_arg2 == LUI.ItemCard.types.COSMETIC_ATTACHMENT then
		
	elseif f21_arg2 == LUI.ItemCard.types.MTXP then
		f21_local0 = Contracts.GetMTXPItemCardInfo( f21_arg4 )
	end
	f21_local0.identifier = f21_arg3
	if not ItemCardUtils.IsLootItem( f21_arg1 ) and (ItemCardUtils.IsInventoryItem( f21_arg1 ) or ItemCardUtils.IsCompareItem( f21_arg1 )) then
		f21_local0.quality = Cac.LowestQuality
		f21_local0.qualityImage = Cac.GetLootQualityImage( f21_local0.quality )
		f21_local0.qualityName = Cac.GetLootQualityString( f21_local0.quality )
		f21_local0.qualityColor = Cac.GetLootQualityColor( f21_local0.quality )
	end
	if not ItemCardUtils.IsLootItem( f21_arg1 ) and not f21_local0.image then
		f21_local0.image = ""
	end
	local f21_local1 = f21_arg0._itemCardData
	if not f21_local1 then
		f21_local1 = {}
	end
	for f21_local5, f21_local6 in pairs( f21_local0 ) do
		if not f21_local1[f21_local5] then
			f21_local1[f21_local5] = LUI.DataSourceInGlobalModel.new( f21_arg0._modelPath .. "." .. f21_local5 )
		end
		f21_local1[f21_local5]:SetValue( f21_arg4, f21_local6 )
	end
	f21_arg0._itemCardData = f21_local1
end

