LUI.ItemCard = LUI.Class( LUI.UIElement )
LUI.ItemCard.contexts = {
	INVENTORY_ITEM = 0,
	INVENTORY_CATEGORY = 1,
	AAR_PROGRESSION = 2,
	AAR_SUPPLY_DROP = 3,
	LOOT_CEREMONY = 4,
	WEAPON_COMPARE_BASE = 5,
	WEAPON_COMPARE_LOOT = 6,
	ITEM_CRAFTED = 7,
	CP_WEAPON_LOOT = 8,
	MTXP = 9,
	CONTRACT_REWARD = 10,
	AAR_CHALLENGE = 11,
	QUARTERMASTER_CIPHER = 12
}
local f0_local0 = {
	[LUI.ItemCard.contexts.INVENTORY_ITEM] = 1.5,
	[LUI.ItemCard.contexts.INVENTORY_CATEGORY] = 1.5,
	[LUI.ItemCard.contexts.AAR_PROGRESSION] = 1,
	[LUI.ItemCard.contexts.AAR_SUPPLY_DROP] = 1,
	[LUI.ItemCard.contexts.AAR_CHALLENGE] = 1,
	[LUI.ItemCard.contexts.LOOT_CEREMONY] = 1,
	[LUI.ItemCard.contexts.WEAPON_COMPARE_BASE] = 1.2,
	[LUI.ItemCard.contexts.WEAPON_COMPARE_LOOT] = 1.2,
	[LUI.ItemCard.contexts.ITEM_CRAFTED] = 1,
	[LUI.ItemCard.contexts.MTXP] = 1,
	[LUI.ItemCard.contexts.CONTRACT_REWARD] = 1
}
LUI.ItemCard.types = {
	ATTACHMENT = 0,
	CALLING_CARD = 1,
	CAMO = 2,
	CARE_PACKAGE = 3,
	EMBLEM = 4,
	CRATE = 5,
	GESTURE = 6,
	POWER = 7,
	MISSION_TEAM = 8,
	PERK = 9,
	PICK_10 = 10,
	RETICLE = 11,
	RIG = 12,
	RIG_HEAD = 13,
	RIG_PACKAGE = 14,
	STREAK = 15,
	SUPER = 16,
	TRAIT = 17,
	WEAPON = 18,
	CONSUMABLE = 19,
	DLC = 20,
	CURRENCY = 21,
	CURRENCY_PACK = 22,
	FICTION = 23,
	FATE_CARD = 24,
	FATE_DECK_SIZE = 25,
	COSMETIC_CAMO = 26,
	COSMETIC_ATTACHMENT = 27,
	MTXP = 28,
	RIG_BODY = 29
}
local f0_local1 = function ( f1_arg0 )
	return f1_arg0 == LUI.ItemCard.contexts.LOOT_CEREMONY
end

local f0_local2 = function ( f2_arg0 )
	return f2_arg0 == LUI.ItemCard.contexts.AAR_PROGRESSION
end

local f0_local3 = function ( f3_arg0 )
	return f3_arg0 == LUI.ItemCard.contexts.AAR_CHALLENGE
end

local f0_local4 = function ( f4_arg0, f4_arg1 )
	return ItemCardUtils.IsInventoryItem( f4_arg0 ) and f4_arg1 == LUI.ItemCard.types.WEAPON
end

local f0_local5 = function ( f5_arg0 )
	local f5_local0
	if f5_arg0 ~= LUI.ItemCard.contexts.AAR_SUPPLY_DROP and f5_arg0 ~= LUI.ItemCard.contexts.LOOT_CEREMONY then
		f5_local0 = false
	else
		f5_local0 = true
	end
	return f5_local0
end

local f0_local6 = function ( f6_arg0, f6_arg1, f6_arg2 )
	local f6_local0 = Cac.GetPassivesForWeapon( Cac.GetLootRef( f6_arg2 ), f6_arg2 )
	local f6_local1 = LUI.DataSourceFromList.new( #f6_local0 )
	f6_local1.GetDataSourceAtIndex = function ( f7_arg0, f7_arg1, f7_arg2 )
		local f7_local0 = f6_local0[f7_arg1 + 1]
		assert( f7_local0 )
		local f7_local1 = {
			passive = {
				name = f7_local0.name,
				desc = f7_local0.weaponDesc,
				image = f7_local0.image
			}
		}
		local f7_local2 = ItemCardUtils.IsInventoryItem( f6_arg1 )
		if not f7_local2 then
			f7_local2 = ItemCardUtils.IsCompareItem( f6_arg1 )
		end
		f7_local1.showDescription = f7_local2
		return f7_local1
	end
	
	assert( f6_arg0.passives.Grid )
	f6_arg0.passives.Grid:SetGridDataSource( f6_local1, controllerIndex )
end

local f0_local7 = function ( f8_arg0, f8_arg1, f8_arg2, f8_arg3, f8_arg4, f8_arg5, f8_arg6 )
	local f8_local0 = f0_local0[f8_arg3]
	local f8_local1 = MenuBuilder.BuildRegisteredType( "ItemCardPassives", {
		controllerIndex = f8_arg6
	} )
	f8_local1.id = "passives"
	f8_local1:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * f8_arg1 * f8_local0, _1080p * f8_arg2 * f8_local0, 0 )
	f8_arg0.passives = f8_local1
	f0_local6( f8_arg0, f8_arg3, f8_arg5 )
	return f8_local1
end

local f0_local8 = function ( f9_arg0, f9_arg1, f9_arg2, f9_arg3, f9_arg4, f9_arg5, f9_arg6 )
	local f9_local0 = f0_local0[f9_arg3]
	local f9_local1 = MenuBuilder.BuildRegisteredType( "ItemCardWeaponStatsPanel", {
		controllerIndex = f9_arg6
	} )
	f9_local1.id = "WeaponStatsPanel"
	f9_local1:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * f9_arg1 * f9_local0, _1080p * f9_arg2 * f9_local0, 0 )
	local f9_local2 = LUI.DataSourceInGlobalModel.new( f9_arg0._modelPath .. ".noneAttachment", "none" )
	f9_local1:SetDataSource( {
		weaponLootID = ItemCardUtils.IsLootItem( f9_arg3 ) and f9_arg0._itemCardData.identifier or LUI.DataSourceInGlobalModel.new( f9_arg0._modelPath .. ".weaponLootID", 0 ),
		baseWeaponRef = f9_arg5,
		weaponRef = f9_arg5,
		attachmentOneRef = f9_local2,
		attachmentTwoRef = f9_local2,
		attachmentThreeRef = f9_local2,
		attachmentFourRef = f9_local2,
		attachmentFiveRef = f9_local2,
		attachmentSixRef = f9_local2
	}, f9_arg6 )
	f9_arg0.WeaponStats = f9_local1
	return f9_local1
end

local f0_local9 = function ( f10_arg0, f10_arg1, f10_arg2, f10_arg3, f10_arg4, f10_arg5, f10_arg6 )
	local f10_local0 = nil
	local f10_local1 = f0_local0[f10_arg3]
	local f10_local2 = ItemCardUtils.IsLootItem( f10_arg3 )
	if f10_arg4 == LUI.ItemCard.types.WEAPON or f10_arg4 == LUI.ItemCard.types.RIG or f10_arg4 == LUI.ItemCard.types.CRATE then
		f10_local0 = MenuBuilder.BuildRegisteredType( "ItemCardLongImage", {
			controllerIndex = f10_arg6
		} )
		f10_local0:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * f10_arg1 * f10_local1, _1080p * f10_arg2 * f10_local1, 0 )
		local f10_local3 = f10_local0
		local f10_local4 = f10_local0.SetDataSource
		local f10_local5 = {}
		local f10_local6
		if f10_local2 then
			f10_local6 = f10_arg0._itemCardData.displayImage
			if not f10_local6 then
			
			else
				f10_local5.image = f10_local6
				f10_local4( f10_local3, f10_local5, f10_arg6 )
			end
		end
		f10_local6 = f10_arg0._itemCardData.image
	elseif f10_arg4 == LUI.ItemCard.types.CALLING_CARD then
		f10_local0 = MenuBuilder.BuildRegisteredType( "ItemCardCallingCard", {
			controllerIndex = f10_arg6
		} )
		f10_local0:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * f10_arg1 * f10_local1, _1080p * f10_arg2 * f10_local1, 0 )
		local f10_local3 = f10_local0
		local f10_local4 = f10_local0.SetDataSource
		local f10_local5 = {}
		local f10_local6
		if f10_local2 then
			f10_local6 = f10_arg0._itemCardData.displayImage
			if not f10_local6 then
			
			else
				f10_local5.image = f10_local6
				f10_local4( f10_local3, f10_local5, f10_arg6 )
			end
		end
		f10_local6 = f10_arg0._itemCardData.image
	elseif f10_arg4 == LUI.ItemCard.types.TRAIT or f10_arg4 == LUI.ItemCard.types.SUPER or f10_arg4 == LUI.ItemCard.types.STREAK then
		local f10_local4
		if f10_arg4 == LUI.ItemCard.types.SUPER then
			f10_local4 = 0.5
			if not f10_local4 then
			
			else
				f10_local0 = MenuBuilder.BuildRegisteredType( "ItemCardBigImage", {
					controllerIndex = f10_arg6,
					scaleOverride = f10_local4
				} )
				f10_local0:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * f10_arg1 * f10_local1, _1080p * f10_arg2 * f10_local1, 0 )
				local f10_local5 = f10_local0
				local f10_local3 = f10_local0.SetDataSource
				local f10_local6 = {}
				local f10_local7
				if f10_local2 then
					f10_local7 = f10_arg0._itemCardData.displayImage
					if not f10_local7 then
					
					else
						f10_local6.image = f10_local7
						f10_local3( f10_local5, f10_local6, f10_arg6 )
					end
				end
				f10_local7 = f10_arg0._itemCardData.image
			end
		end
		f10_local4 = 0.3
	elseif f10_arg4 == LUI.ItemCard.types.PERK then
		f10_local0 = MenuBuilder.BuildRegisteredType( "ItemCardBigImage", {
			controllerIndex = f10_arg6,
			perkOverride = true
		} )
		f10_local0:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * f10_arg1 * f10_local1, _1080p * f10_arg2 * f10_local1, 0 )
		local f10_local3 = f10_local0
		local f10_local4 = f10_local0.SetDataSource
		local f10_local5 = {}
		local f10_local6
		if f10_local2 then
			f10_local6 = f10_arg0._itemCardData.displayImage
			if not f10_local6 then
			
			else
				f10_local5.image = f10_local6
				f10_local4( f10_local3, f10_local5, f10_arg6 )
			end
		end
		f10_local6 = f10_arg0._itemCardData.image
	elseif f10_arg4 == LUI.ItemCard.types.CAMO or f10_arg4 == LUI.ItemCard.types.COSMETIC_CAMO then
		f10_local0 = MenuBuilder.BuildRegisteredType( "ItemCardMaskedBigImage", {
			controllerIndex = f10_arg6,
			perkOverride = true
		} )
		f10_local0:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * f10_arg1 * f10_local1, _1080p * f10_arg2 * f10_local1, 0 )
		local f10_local3 = f10_local0
		local f10_local4 = f10_local0.SetDataSource
		local f10_local5 = {}
		local f10_local6
		if f10_local2 then
			f10_local6 = f10_arg0._itemCardData.displayImage
			if not f10_local6 then
			
			else
				f10_local5.image = f10_local6
				f10_local4( f10_local3, f10_local5, f10_arg6 )
			end
		end
		f10_local6 = f10_arg0._itemCardData.image
	elseif f10_arg4 == LUI.ItemCard.types.MTXP then
		f10_local0 = MenuBuilder.BuildRegisteredType( "ItemCardBigImage", {
			controllerIndex = f10_arg6,
			scaleOverride = 0.6
		} )
		f10_local0:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * f10_arg1 * f10_local1, _1080p * f10_arg2 * f10_local1, 0 )
		local f10_local3 = f10_local0
		local f10_local4 = f10_local0.SetDataSource
		local f10_local5 = {}
		local f10_local6
		if f10_local2 then
			f10_local6 = f10_arg0._itemCardData.displayImage
			if not f10_local6 then
			
			else
				f10_local5.image = f10_local6
				f10_local4( f10_local3, f10_local5, f10_arg6 )
			end
		end
		f10_local6 = f10_arg0._itemCardData.image
	else
		f10_local0 = MenuBuilder.BuildRegisteredType( "ItemCardBigImage", {
			controllerIndex = f10_arg6
		} )
		f10_local0:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * f10_arg1 * f10_local1, _1080p * f10_arg2 * f10_local1, 0 )
		local f10_local3 = f10_local0
		local f10_local4 = f10_local0.SetDataSource
		local f10_local5 = {}
		local f10_local6
		if f10_local2 then
			f10_local6 = f10_arg0._itemCardData.displayImage
			if not f10_local6 then
			
			else
				f10_local5.image = f10_local6
				f10_local4( f10_local3, f10_local5, f10_arg6 )
			end
		end
		f10_local6 = f10_arg0._itemCardData.image
	end
	return f10_local0
end

local f0_local10 = function ( f11_arg0, f11_arg1, f11_arg2, f11_arg3, f11_arg4, f11_arg5, f11_arg6 )
	local f11_local0 = f0_local0[f11_arg3]
	local f11_local1 = f11_arg0._itemCardData.desc
	if f11_arg4 == LUI.ItemCard.types.CRATE then
		f11_local1 = f11_arg0._itemCardData.earnedText
	elseif f11_arg4 == LUI.ItemCard.types.CURRENCY_PACK then
		f11_local1 = f11_arg0._itemCardData.uiamount
	end
	local f11_local2 = MenuBuilder.BuildRegisteredType( "ItemCardDescription", {
		controllerIndex = f11_arg6,
		itemType = f11_arg4
	} )
	f11_local2:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * f11_arg1 * f11_local0, _1080p * f11_arg2 * f11_local0, 0 )
	f11_local2:SetDataSource( {
		text = f11_local1
	}, f11_arg6 )
	return f11_local2
end

local f0_local11 = function ( f12_arg0, f12_arg1, f12_arg2, f12_arg3, f12_arg4, f12_arg5, f12_arg6 )
	local f12_local0 = f0_local0[f12_arg3]
	local f12_local1 = MenuBuilder.BuildRegisteredType( "ItemCardBlank", {
		controllerIndex = f12_arg6
	} )
	f12_local1:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * f12_arg1 * f12_local0, _1080p * f12_arg2 * f12_local0, 0 )
	return f12_local1
end

local f0_local12 = function ( f13_arg0, f13_arg1, f13_arg2, f13_arg3, f13_arg4, f13_arg5, f13_arg6 )
	local f13_local0 = f0_local0[f13_arg3]
	local f13_local1 = f0_local2( f13_arg3 )
	local f13_local2 = ItemCardUtils.IsLootItem( f13_arg3 )
	local f13_local3 = ItemCardUtils.IsMTXPItem( f13_arg3 )
	local f13_local4 = nil
	local f13_local5 = {
		controllerIndex = f13_arg6
	}
	if f13_local1 then
		local f13_local6 = nil
		if f13_arg4 == LUI.ItemCard.types.ATTACHMENT then
			f13_local6 = Engine.Localize( "LUA_MENU_MP_UNLOCK_LEVEL", f13_arg0._itemCardData.weaponLevel:GetValue( f13_arg6 ) )
		else
			f13_local6 = Engine.Localize( "LUA_MENU_MP_UNLOCKED_RANK", f13_arg0._itemCardData.rank:GetValue( f13_arg6 ) )
		end
		f13_local4 = LUI.DataSourceInGlobalModel.new( f13_arg0._modelPath .. ".text" )
		f13_local4:SetValue( f13_arg6, f13_local6 )
	elseif f13_local2 then
		f13_local4 = f13_arg0._itemCardData.footer
		if f13_arg0._itemCardData.missionTeamID then
			f13_local5 = {
				controllerIndex = f13_arg6,
				missionTeamID = f13_arg0._itemCardData.missionTeamID:GetValue( f13_arg6 )
			}
		end
	elseif f13_local3 then
		f13_local4 = f13_arg0._itemCardData.footer
		if f13_arg0._itemCardData.missionTeamID then
			f13_local5 = {
				controllerIndex = f13_arg6,
				missionTeamID = f13_arg0._itemCardData.missionTeamID:GetValue( f13_arg6 )
			}
		end
	end
	local f13_local6 = MenuBuilder.BuildRegisteredType( "ItemCardFooter", f13_local5 )
	f13_local6:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * f13_arg1 * f13_local0, _1080p * f13_arg2 * f13_local0, 0 )
	f13_local6:SetDataSource( {
		text = f13_local4
	}, f13_arg6 )
	return f13_local6
end

local f0_local13 = function ( f14_arg0, f14_arg1 )
	local f14_local0 = 0
	local f14_local1
	if f14_arg0 ~= LUI.ItemCard.contexts.AAR_PROGRESSION then
		f14_local1 = f0_local5( f14_arg0 )
	else
		f14_local1 = true
	end
	local f14_local2
	if f14_arg1 ~= LUI.ItemCard.types.ATTACHMENT and f14_arg1 ~= LUI.ItemCard.types.CAMO and f14_arg1 ~= LUI.ItemCard.types.CALLING_CARD then
		f14_local2 = false
	else
		f14_local2 = true
	end
	if f14_local1 or f14_local2 then
		f14_local0 = -110
	end
	return f14_local0
end

LUI.ItemCard.BuildItemCardHeader = function ( f15_arg0, f15_arg1, f15_arg2, f15_arg3, f15_arg4, f15_arg5 )
	local f15_local0 = f0_local0[f15_arg2]
	local f15_local1 = ItemCardUtils.IsLootItem( f15_arg2 )
	local f15_local2 = f0_local1( f15_arg2 )
	local f15_local3 = ItemCardUtils.IsInventoryItem( f15_arg2 )
	local f15_local4 = ItemCardUtils.IsCompareItem( f15_arg2 )
	if not f15_local3 then
		if not f15_local2 or not 50 then
			local f15_local5 = 36
		end
		local f15_local6 = MenuBuilder.BuildRegisteredType( "ItemCardHeader", {
			controllerIndex = f15_arg5
		} )
		f15_local6.id = "ItemCardHeader"
		f15_local6:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 30 * f15_local0, 0 )
		f15_local6:SetDataSource( {
			text = f15_arg0._itemCardData.title
		}, f15_arg5 )
		f15_arg1:addElement( f15_local6 )
	end
	local f15_local5 = f0_local13( f15_arg2, f15_arg3 )
	local f15_local6
	if f15_local2 then
		f15_local6 = 10
		if not f15_local6 then
		
		else
			if f15_arg3 == LUI.ItemCard.types.CRATE and f15_arg2 ~= LUI.ItemCard.contexts.CONTRACT_REWARD then
				f15_arg1:addElement( f0_local11( f15_arg0, 30, 110, f15_arg2, f15_arg3, f15_arg4, f15_arg5 ) )
			else
				local f15_local7
				if f15_arg2 == LUI.ItemCard.contexts.CONTRACT_REWARD then
					f15_local7 = "ItemCardHeaderAltBackground"
					if not f15_local7 then
					
					else
						local f15_local8 = MenuBuilder.BuildRegisteredType( f15_local7, {
							controllerIndex = f15_arg5
						} )
						f15_local8.id = "ItemCardHeaderBG"
						f15_local8:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * f15_local6, 0, _1080p * 30 * f15_local0, _1080p * 110 * f15_local0, 0 )
						if f15_local1 then
							f15_local8:SetDataSource( {
								color = LUI.DataSourceInGlobalModel.new( f15_arg0._modelPath .. ".qualityColor", f15_arg0._itemCardData.qualityColor )
							}, f15_arg5 )
						end
						f15_arg1:addElement( f15_local8 )
						local f15_local9 = MenuBuilder.BuildRegisteredType( "ItemCardName", {
							controllerIndex = f15_arg5
						} )
						f15_local9.id = "ItemCardName"
						if f15_local3 then
							f15_local9:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 20, _1080p * f15_local5, _1080p * 5 * f15_local0, _1080p * 45 * f15_local0, 0 )
						else
							f15_local9:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 20, _1080p * f15_local5, _1080p * 30 * f15_local0, _1080p * 70 * f15_local0, 0 )
						end
						local f15_local10 = f15_local9
						local f15_local11 = f15_local9.SetDataSource
						local f15_local12 = {}
						local f15_local13
						if f15_local1 then
							f15_local13 = f15_arg0._itemCardData.displayName
							if not f15_local13 then
							
							else
								f15_local12.text = f15_local13
								f15_local11( f15_local10, f15_local12, f15_arg5 )
								f15_arg1:addElement( f15_local9 )
								if f15_local1 and f15_arg2 ~= LUI.ItemCard.contexts.CONTRACT_REWARD then
									f15_local11 = MenuBuilder.BuildRegisteredType( "ItemCardQuality", {
										controllerIndex = f15_arg5
									} )
									f15_local11.id = "ItemCardQuality"
									if f15_local3 then
										f15_local11:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 19, _1080p * f15_local5, _1080p * 45 * f15_local0, _1080p * 85 * f15_local0, 0 )
									else
										f15_local11:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 19, _1080p * f15_local5, _1080p * 70 * f15_local0, _1080p * 110 * f15_local0, 0 )
									end
									f15_local11:SetDataSource( {
										text = f15_arg0._itemCardData.qualityName,
										image = f15_arg0._itemCardData.qualityImage,
										color = f15_arg0._itemCardData.qualityColor
									}, f15_arg5 )
									f15_local10 = f15_arg0._itemCardData.qualityImage:GetValue( f15_arg5 )
									f15_local12 = f15_arg0._itemCardData.qualityColor:GetValue( f15_arg5 )
									f15_local11.QualityIcon.Icon:setImage( RegisterMaterial( f15_local10 ) )
									f15_local11.QualityIcon.Icon:SetRGBFromInt( f15_local12 )
									f15_local11.QualityIcon.IconDuplicate:setImage( RegisterMaterial( f15_local10 .. "_mk2" ) )
									f15_local11.QualityIcon.IconDuplicate:SetRGBFromInt( f15_local12 )
									f15_local8.MK2Pattern:SetRGBFromInt( f15_local12 )
									f15_local13 = nil
									if f15_arg0._itemCardData.isMk2 then
										f15_local13 = f15_arg0._itemCardData.isMk2:GetValue( f15_arg5 )
									end
									if f15_local13 then
										f15_local8.MK2:SetAlpha( 0.5, 0 )
										f15_local8.MK2Pattern:SetAlpha( 1, 0 )
										ACTIONS.AnimateSequence( f15_local11.QualityIcon, "LegendaryPulse" )
									end
									f15_arg1:addElement( f15_local11 )
								end
							end
						end
						f15_local13 = f15_arg0._itemCardData.name
					end
				end
				f15_local7 = "ItemCardHeaderBackground"
			end
			local f15_local7 = Engine.Localize( "LUA_MENU_LEVEL_CAPS" )
			local f15_local8 = Engine.Localize( "LUA_MENU_CHALLENGE" )
			if f15_arg3 == LUI.ItemCard.types.ATTACHMENT or f15_arg3 == LUI.ItemCard.types.CAMO then
				local f15_local9 = MenuBuilder.BuildRegisteredType( "ItemCardWeapon", {
					controllerIndex = f15_arg5
				} )
				f15_local9.id = "ItemCardWeapon"
				f15_local9:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -110, _1080p * -10, _1080p * 30 * f15_local0, _1080p * 110 * f15_local0, 0 )
				local f15_local10 = f15_local9
				local f15_local11 = f15_local9.SetDataSource
				local f15_local12 = {
					textA = f15_arg0._itemCardData.weaponName,
					image = f15_arg0._itemCardData.weaponImage
				}
				local f15_local13 = LUI.DataSourceInGlobalModel.new
				local f15_local14 = f15_arg0._modelPath .. ".weaponLevel"
				local f15_local15
				if f15_arg3 == LUI.ItemCard.types.ATTACHMENT then
					f15_local15 = f15_local7 .. f15_arg0._itemCardData.weaponLevel:GetValue( f15_arg5 )
					if not f15_local15 then
					
					else
						f15_local12.textB = f15_local13( f15_local14, f15_local15 )
						f15_local11( f15_local10, f15_local12, f15_arg5 )
						f15_arg1:addElement( f15_local9 )
					end
				end
				f15_local15 = f15_local8
			elseif f15_arg2 == LUI.ItemCard.contexts.AAR_PROGRESSION then
				local f15_local9 = MenuBuilder.BuildRegisteredType( "ItemCardRank", {
					controllerIndex = f15_arg5
				} )
				f15_local9.id = "ItemCardRank"
				f15_local9:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -90, _1080p * 10, _1080p * 30 * f15_local0, _1080p * 110 * f15_local0, 0 )
				f15_local9:SetDataSource( {
					textA = LUI.DataSourceInGlobalModel.new( f15_arg0._modelPath .. ".level", f15_local7 ),
					image = f15_arg0._itemCardData.rankIcon,
					textB = f15_arg0._itemCardData.rank,
					textC = f15_arg0._itemCardData.rankName
				}, f15_arg5 )
				f15_arg1:addElement( f15_local9 )
			elseif f0_local5( f15_arg2 ) and not f15_local1 then
				local f15_local9 = MenuBuilder.BuildRegisteredType( "ItemCardSupplyDrop", {
					controllerIndex = f15_arg5
				} )
				f15_local9.id = "ItemCardSupplyDrop"
				f15_local9:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -110, _1080p * -10, _1080p * 30 * f15_local0, _1080p * 110 * f15_local0, 0 )
				f15_arg1:addElement( f15_local9 )
			elseif f15_arg3 == LUI.ItemCard.types.CALLING_CARD then
				
			else
				
			end
		end
	end
	f15_local6 = 0
end

LUI.ItemCard.BuildItemCardBody = function ( f16_arg0, f16_arg1, f16_arg2, f16_arg3, f16_arg4, f16_arg5 )
	local f16_local0 = f0_local0[f16_arg2]
	local f16_local1 = f0_local2( f16_arg2 )
	local f16_local2 = f0_local3( f16_arg2 )
	local f16_local3 = ItemCardUtils.IsLootItem( f16_arg2 )
	local f16_local4 = ItemCardUtils.IsCompareItem( f16_arg2 )
	local f16_local5 = ItemCardUtils.IsInventoryItem( f16_arg2 )
	if not f16_local3 or not f16_arg0._itemCardData.baseWeaponRef then
		local f16_local6 = f16_arg0._itemCardData.identifier
	end
	local f16_local7 = ItemCardUtils.IsMTXPItem( f16_arg2 )
	if f16_local1 then
		local ItemCardImageComponent = f0_local10( f16_arg0, 210, 395, f16_arg2, f16_arg3, f16_arg4, f16_arg5 )
		f16_arg1:addElement( ItemCardImageComponent )
		f16_arg0.ItemCardDescription = ItemCardImageComponent
		
	elseif f16_local3 then
		if f16_arg3 == LUI.ItemCard.types.WEAPON then
			local ItemCardImageComponent = f0_local7( f16_arg0, 245, 395, f16_arg2, f16_arg3, f16_arg4, f16_arg5 )
			f16_arg1:addElement( ItemCardImageComponent )
			f16_arg0.ItemCardPassives = ItemCardImageComponent
			
		elseif f16_arg3 == LUI.ItemCard.types.CRATE or f16_arg3 == LUI.ItemCard.types.CURRENCY_PACK then
			local ItemCardImageComponent = f0_local10( f16_arg0, 210, 395, f16_arg2, f16_arg3, f16_arg4, f16_arg5 )
			f16_arg1:addElement( ItemCardImageComponent )
			f16_arg0.ItemCardDescription = ItemCardImageComponent
			
		end
	elseif f16_local4 then
		
	elseif f16_local5 then
		
	elseif f16_local7 then
		local ItemCardImageComponent = f0_local10( f16_arg0, 310, 395, f16_arg2, f16_arg3, f16_arg4, f16_arg5 )
		f16_arg1:addElement( ItemCardImageComponent )
		f16_arg0.ItemCardDescription = ItemCardImageComponent
		
	elseif f16_local2 then
		local ItemCardImageComponent = f0_local10( f16_arg0, 210, 395, f16_arg2, f16_arg3, f16_arg4, f16_arg5 )
		f16_arg1:addElement( ItemCardImageComponent )
		f16_arg0.ItemCardDescription = ItemCardImageComponent
		
	else
		f16_arg1:addElement( f0_local11( f16_arg0, 210, 395, f16_arg2, f16_arg3, f16_arg4, f16_arg5 ) )
	end
	local ItemCardImageComponent = nil
	if f16_local3 then
		if f16_arg3 == LUI.ItemCard.types.EMBLEM or f16_arg3 == LUI.ItemCard.types.GESTURE or f16_arg3 == LUI.ItemCard.types.RIG_HEAD or f16_arg3 == LUI.ItemCard.types.RETICLE or f16_arg3 == LUI.ItemCard.types.COSMETIC_CAMO or f16_arg3 == LUI.ItemCard.types.CALLING_CARD then
			ItemCardImageComponent = f0_local9( f16_arg0, 110, 395, f16_arg2, f16_arg3, f16_arg4, f16_arg5 )
		else
			ItemCardImageComponent = f0_local9( f16_arg0, 110, 245, f16_arg2, f16_arg3, f16_arg4, f16_arg5 )
			if f16_arg3 == LUI.ItemCard.types.WEAPON then
				local f16_local9 = nil
				if f16_arg0._itemCardData.isMk2 then
					f16_local9 = f16_arg0._itemCardData.isMk2:GetValue( f16_arg5 )
				end
				if f16_local9 then
					local Mk2Bonus = MenuBuilder.BuildRegisteredType( "LootItemCardMk2Bonus", {
						controllerIndex = f16_arg5
					} )
					Mk2Bonus:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 245 * _1080p, 270 * _1080p )
					Mk2Bonus.id = "Mk2Bonus"
					f16_arg1:addElement( Mk2Bonus )
					f16_arg0.Mk2Bonus = Mk2Bonus
					
					local f16_local11 = f16_arg0._itemCardData.qualityColor:GetValue( f16_arg5 )
					if f16_arg0._itemCardData.baseWeaponRef then
						local f16_local12 = Cac.GetWeaponMk2BonusString( f16_arg5, f16_arg0._itemCardData.baseWeaponRef:GetValue( f16_arg5 ) )
						assert( Mk2Bonus.BonusText )
						Mk2Bonus.BonusText:setText( f16_local12 )
					end
					f16_arg0.Mk2Bonus.Gradient:SetRGBFromInt( f16_local11 )
					f16_arg0.Mk2Bonus.Blur:SetRGBFromInt( f16_local11 )
					ItemCardImageComponent.Highlight:SetRGBFromInt( f16_local11 )
					ACTIONS.AnimateSequence( ItemCardImageComponent, "MK2Highlight" )
				end
			end
		end
	elseif f16_local7 then
		ItemCardImageComponent = f0_local9( f16_arg0, 110, 310, f16_arg2, f16_arg3, f16_arg4, f16_arg5 )
	else
		ItemCardImageComponent = f0_local9( f16_arg0, 110, 210, f16_arg2, f16_arg3, f16_arg4, f16_arg5 )
	end
	ItemCardImageComponent.id = "ItemCardImageComponent"
	f16_arg1:addElement( ItemCardImageComponent )
	f16_arg0.ItemCardImageComponent = ItemCardImageComponent
	
	if f16_local1 or f16_local3 or f16_local7 then
		local f16_local9 = f0_local12( f16_arg0, 395, 420, f16_arg2, f16_arg3, f16_arg4, f16_arg5 )
		f16_arg1:addElement( f16_local9 )
		f16_local9.id = "ItemCardFooter"
	end
end

LUI.ItemCard.BuildItemCard = function ( f17_arg0, f17_arg1, f17_arg2, f17_arg3, f17_arg4, f17_arg5 )
	if f17_arg0._context and f17_arg0._itemType and not f17_arg5 and f17_arg0._context == f17_arg1 and f17_arg0._itemType == f17_arg2 then
		ItemCardUtils.SetupItemCardData( f17_arg0, f17_arg1, f17_arg2, f17_arg3, f17_arg4 )
		if ItemCardUtils.IsLootItem( f17_arg1 ) and f17_arg2 == LUI.ItemCard.types.WEAPON then
			f0_local6( f17_arg0, f17_arg1, f17_arg3 )
		end
		return 
	end
	f17_arg0:closeChildren()
	ItemCardUtils.SetupItemCardData( f17_arg0, f17_arg1, f17_arg2, f17_arg3, f17_arg4 )
	if f17_arg1 == LUI.ItemCard.contexts.AAR_SUPPLY_DROP and f17_arg2 == LUI.ItemCard.types.CRATE and f17_arg0._itemCardData.isBribeCrate:GetValue( f17_arg4 ) then
		f17_arg1 = LUI.ItemCard.contexts.CONTRACT_REWARD
	end
	local self = f17_arg0
	if f17_arg0._isButton then
		self = LUI.UIButton.new()
		self:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
		self.id = "itemCardButton"
		self:addEventHandler( "button_over", function ( f18_arg0, f18_arg1 )
			
		end )
		self:addEventHandler( "button_up", function ( f19_arg0, f19_arg1 )
			
		end )
		f17_arg0:addElement( self )
	end
	f17_arg0:BuildItemCardHeader( self, f17_arg1, f17_arg2, f17_arg3, f17_arg4 )
	f17_arg0:BuildItemCardBody( self, f17_arg1, f17_arg2, f17_arg3, f17_arg4 )
	f17_arg0._context = f17_arg1
	f17_arg0._itemType = f17_arg2
end

LUI.ItemCard.init = function ( f20_arg0, f20_arg1, f20_arg2 )
	assert( f20_arg2.modelPath )
	f20_arg0._modelPath = f20_arg2.modelPath
	f20_arg0._isButton = f20_arg2.isButton
	LUI.UIElement.init( f20_arg0, f20_arg1 )
	if f20_arg2.context and f20_arg2.itemType and f20_arg2.identifier then
		f20_arg0:BuildItemCard( f20_arg2.context, f20_arg2.itemType, f20_arg2.identifier, f20_arg2.controllerIndex, f20_arg2.forceRebuild )
	end
end

