local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "frontEnd.MP.conquest.Headquarters.callingCardEditors.smallPlayerCard"
f0_local1 = function ( f1_arg0, f1_arg1 )
	f1_arg0:SetDataSource( PlayercardUtils.GetFrontendDataSources( f0_local0, f1_arg1 ), f1_arg1 )
end

MenuBuilder.registerType( "QuickChangePlayerCardPopup", function ( f2_arg0, f2_arg1 )
	local f2_local0 = f2_arg1.controllerIndex
	assert( f2_local0 )
	assert( f2_arg1.callbackFunc )
	assert( f2_arg1.smallPlayerCardFunc )
	local f2_local1 = {
		title = ToUpperCase( Engine.Localize( "LUA_MENU_EQUIP" ) ),
		width = _1080p * 500,
		defaultFocusIndex = 1,
		cancelClosesPopup = true,
		listContent = {}
	}
	local f2_local2 = nil
	f2_local2 = MenuBuilder.BuildRegisteredType( "SmallPlayerCard", {
		controllerIndex = f2_local0
	} )
	f2_local2.id = "SmallPlayerCard"
	f2_local2:SetScale( 0.12, 0 )
	f2_local2:SetAnchors( 0, 1, 1, 0, 0 )
	f2_local2:SetLeft( _1080p * 41, 0 )
	f2_local2:SetRight( _1080p * 459, 0 )
	f2_local2:SetTop( _1080p * 0, 5 )
	f2_local2:SetBottom( _1080p * 124, 0 )
	f2_arg1.smallPlayerCardFunc( f2_local2, f2_local0 )
	table.insert( f2_local1.listContent, f2_local2 )
	local f2_local3 = nil
	f2_local3 = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f2_local0
	} )
	f2_local3.id = "AcceptButton"
	f2_local3.Text:setText( ToUpperCase( Engine.Localize( "LUA_MENU_EQUIP" ) ), 0 )
	f2_local3:SetAnchors( 0, 1, 1, 0, 0 )
	f2_local3:SetLeft( _1080p * 0, 0 )
	f2_local3:SetRight( _1080p * 500, 0 )
	f2_local3:SetTop( _1080p * 130, 0 )
	f2_local3:SetBottom( _1080p * 165, 0 )
	f2_local3:addEventHandler( "button_action", function ( f3_arg0, f3_arg1 )
		f2_arg1.callbackFunc()
	end )
	table.insert( f2_local1.listContent, f2_local3 )
	local f2_local4 = nil
	f2_local4 = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f2_local0
	} )
	f2_local4.id = "BackButton"
	f2_local4.Text:setText( ToUpperCase( Engine.Localize( "LUA_MENU_BACK" ) ), 0 )
	f2_local4:SetAnchors( 0, 1, 1, 0, 0 )
	f2_local4:SetLeft( _1080p * 0, 0 )
	f2_local4:SetRight( _1080p * 500, 0 )
	f2_local4:SetTop( _1080p * 170, 0 )
	f2_local4:SetBottom( _1080p * 205, 0 )
	f2_local4:addEventHandler( "button_action", function ( f4_arg0, f4_arg1 )
		ACTIONS.LeaveMenu( f4_arg0 )
	end )
	table.insert( f2_local1.listContent, f2_local4 )
	local f2_local5 = MenuBuilder.BuildRegisteredType( "PopupList", f2_local1 )
	f2_local5.id = "QuickChangePlayerCardPopup"
	return f2_local5
end )
local f0_local3 = {
	{
		color = SWATCHES.itemRarity.qualityBase,
		icon = "icon_item_quality_0",
		frame = ""
	},
	{
		color = SWATCHES.itemRarity.quality0,
		icon = "icon_item_quality_1",
		frame = "loot_item_card_frame_common"
	},
	{
		color = SWATCHES.itemRarity.quality1,
		icon = "icon_item_quality_2",
		frame = "loot_item_card_frame_rare"
	},
	{
		color = SWATCHES.itemRarity.quality2,
		icon = "icon_item_quality_3",
		frame = "loot_item_card_frame_lengendary"
	},
	{
		color = SWATCHES.itemRarity.quality3,
		icon = "icon_item_quality_4",
		frame = "loot_item_card_frame_epic"
	}
}
local f0_local4 = function ( f5_arg0, f5_arg1, f5_arg2 )
	local f5_local0 = function ( f6_arg0 )
		local f6_local0 = nil
		local f6_local1 = function ()
			local f7_local0 = 50
			f6_arg0:SetGlitchEnabled( true )
			f6_arg0:SetGlitchAmount( math.random( 0, 100 ) * 0.01, f7_local0, LUI.EASING.outQuadratic )
			f6_arg0:SetGlitchBlockWidth( math.random( 20, 50 ), f7_local0, LUI.EASING.outQuadratic )
			f6_arg0:SetGlitchBlockHeight( math.random( 20, 50 ), f7_local0, LUI.EASING.outQuadratic )
			f6_arg0:SetGlitchDistortionRange( math.random( 1, 80 ), f7_local0, LUI.EASING.outQuadratic )
			f6_arg0:SetGlitchScanlinePitch( 1 )
			f6_arg0:SetGlitchMaskPitch( 1 )
			local f7_local1 = f6_arg0:Wait( f7_local0 )
			f7_local1.onComplete = function ()
				if f5_arg0.randomize then
					f6_local0()
				else
					f6_arg0:SetGlitchAmount( 0 )
					f6_arg0:SetGlitchEnabled( false )
					f6_arg0:SetDotPitchEnabled( true )
					f6_arg0:SetDotPitchX( 6, 0 )
					f6_arg0:SetDotPitchY( 3, 0 )
					f6_arg0:SetDotPitchContrast( 0.15, 0 )
					f6_arg0:SetDotPitchMode( 1 )
				end
			end
			
		end
		
		f6_local1()
	end
	
	local f5_local1 = f5_arg0.RarityIconLarge
	local f5_local2 = f5_arg0.RarityFrame
	local f5_local3 = f5_arg0.MK2Pattern
	local f5_local4 = f5_arg0.Background
	local f5_local5 = f5_arg0.BackgroundBlur
	local f5_local6 = f5_arg2.isDuplicate
	local f5_local7 = f5_arg0._itemCardData.quality and tonumber( f5_arg0._itemCardData.quality:GetValue( f5_arg1 ) ) or 0
	local f5_local8 = function ()
		local f9_local0 = (f5_local7 + 1) * 200
		f5_local5:SetAlpha( 1 )
		f5_local5:SetRGBFromTable( f0_local3[f5_local7 + 1].color )
		f5_local5:SetScale( 1.75, f9_local0, LUI.EASING.outQuadratic )
		f5_local5:SetAlpha( 0, f9_local0, LUI.EASING.outQuadratic )
	end
	
	local f5_local9 = function ()
		f5_local1:SetAlpha( 0 )
		f5_local5:SetAlpha( 0 )
		if not LOOT.ContextSkipRandomize( f5_arg2.context ) and not f5_arg2.isRecentDropsMenu then
			local f10_local0 = f5_arg0:Wait( 200 )
			f10_local0.onComplete = function ()
				f5_local8()
			end
			
		end
		if f5_local7 ~= 0 then
			f5_local3:SetRGBFromTable( f0_local3[f5_local7 + 1].color )
			f5_local2:setImage( RegisterMaterial( f0_local3[f5_local7 + 1].frame ), 0 )
			f5_local2:SetScale( 0 )
			f5_local2:SetAlpha( 1 )
			ACTIONS.AnimateSequence( f5_arg0, "Pulse" )
		else
			f5_local2:SetAlpha( 0 )
		end
	end
	
	local f5_local10 = nil
	f5_local10 = function ()
		local f12_local0 = math.random( 0, 4 )
		local f12_local1 = f0_local3[f12_local0 + 1].color
		local f12_local2 = f0_local3[f12_local0 + 1].icon
		f5_local1:SetAlpha( 1 )
		f5_local1:setImage( RegisterMaterial( f12_local2 ), 0 )
		f5_local1:SetScale( 1.5 )
		f5_local1:SetScale( 1, 75, LUI.EASING.outBack )
		if f12_local0 ~= 0 then
			f5_local2:setImage( RegisterMaterial( f0_local3[f12_local0 + 1].frame ), 0 )
		end
		f5_local2:SetScale( 0.25 )
		f5_local2:SetScale( 0, 75, LUI.EASING.outBack )
		f5_local4:SetScale( 0.05 )
		f5_local4:SetScale( 0, 70, LUI.EASING.inOutBack )
		f5_local5:SetAlpha( 1 )
		f5_local5:SetRGBFromTable( f12_local1 )
		f5_local5:SetScale( 0.8 )
		f5_local5:SetScale( 0.75, 70, LUI.EASING.inOutBack )
		local f12_local3 = f5_arg0:Wait( 75 )
		f12_local3.onComplete = function ()
			if f5_arg0.randomize then
				f5_local10()
			else
				f5_local9()
			end
		end
		
	end
	
	if LOOT.ContextSkipRandomize( f5_arg2.context ) or f5_arg2.isRecentDropsMenu then
		f5_local9()
	else
		f5_local10()
		f5_local0( f5_arg0.RarityFrame )
		f5_local0( f5_arg0.Background )
	end
	f5_arg0:SetScale( 1 )
	if not LOOT.ContextSkipRandomize( f5_arg2.context ) and not f5_arg2.isRecentDropsMenu then
		f5_arg0:SetAlpha( 0 )
		local f5_local11 = f5_arg0:Wait( (f5_arg2.cardIndex + 1) * LOOT.IntroSlamDuration )
		f5_local11.onComplete = function ()
			if f5_arg2.cardIndex == 0 then
				Engine.PlaySound( "ui_iw7_loot_roll_slam_left" )
			elseif f5_arg2.cardIndex == 1 then
				Engine.PlaySound( "ui_iw7_loot_roll_slam_center" )
			elseif f5_arg2.cardIndex == 2 then
				Engine.PlaySound( "ui_iw7_loot_roll_slam_right" )
			end
			f5_arg0:SetScale( 0.07, 200, LUI.EASING.outBack )
			f5_arg0:SetAlpha( 1, 200, LUI.EASING.outBack )
		end
		
		local f5_local12 = f5_arg0:Wait( (f5_arg2.cardIndex + 2) * LOOT.RandomizeDuration )
		f5_local12.onComplete = function ()
			if f5_local6 then
				Engine.PlaySound( "ui_iw7_loot_duplicate" )
			elseif f5_local7 == 1 then
				Engine.PlaySound( "ui_iw7_loot_common" )
			elseif f5_local7 == 2 then
				Engine.PlaySound( "ui_iw7_loot_rare" )
			elseif f5_local7 == 3 then
				Engine.PlaySound( "ui_iw7_loot_legendary" )
			elseif f5_local7 == 4 then
				Engine.PlaySound( "ui_iw7_loot_epic" )
			end
			f5_arg0.randomize = false
			f5_arg0:SetScale( 1 )
			f5_arg0:SetScale( 0, 200, LUI.EASING.outQuadratic )
		end
		
	elseif f5_arg2.isRecentDropsMenu then
		f5_arg0:SetScale( 0 )
	else
		if f5_local6 then
			Engine.PlaySound( "ui_iw7_craft_duplicate" )
		elseif f5_local7 == 1 then
			Engine.PlaySound( "ui_iw7_craft_common" )
		elseif f5_local7 == 2 then
			Engine.PlaySound( "ui_iw7_craft_rare" )
		elseif f5_local7 == 3 then
			Engine.PlaySound( "ui_iw7_craft_legendary" )
		elseif f5_local7 == 4 then
			Engine.PlaySound( "ui_iw7_craft_epic" )
		end
		f5_local8()
		f5_arg0:SetScale( 1 )
		f5_arg0:SetScale( 0, 200, LUI.EASING.outQuadratic )
	end
end

local f0_local5 = function ( f16_arg0, f16_arg1 )
	local lootDuplicateItem = MenuBuilder.BuildRegisteredType( "LootDuplicateItem", {
		controllerIndex = f16_arg1
	} )
	lootDuplicateItem:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * -25, _1080p * 25 )
	f16_arg0:addElement( lootDuplicateItem )
	f16_arg0.lootDuplicateItem = lootDuplicateItem
	
end

local f0_local6 = function ( f17_arg0, f17_arg1, f17_arg2, f17_arg3 )
	assert( f17_arg0._itemCardData )
	
	local lootWeaponItem = MenuBuilder.BuildRegisteredType( "LootPassiveItem", {
		itemCardData = f17_arg0._itemCardData,
		itemType = f17_arg1,
		controllerIndex = f17_arg2
	} )
	lootWeaponItem:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -128, _1080p * 128, _1080p * -128, _1080p * 128 )
	f17_arg0:addElement( lootWeaponItem )
	f17_arg0.lootWeaponItem = lootWeaponItem
	
	if f17_arg1 == LUI.ItemCard.types.STREAK then
		lootWeaponItem.ItemIcon:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -90, _1080p * 90, _1080p * -166, _1080p * 14 )
	end
	if Cac.IsLootIDMk2( f17_arg3 ) == true then
		assert( f17_arg0.MK2Pattern )
		f17_arg0.MK2Pattern:SetAlpha( 1, 0 )
		f17_arg0.LootItemCardMk2Bonus:SetAlpha( 1, 0 )
		ACTIONS.AnimateSequenceByElement( f17_arg0, {
			elementName = "QualityIcon",
			sequenceName = "LegendaryPulse",
			elementPath = "QualityIcon"
		} )
		assert( f17_arg0.MK2Icon )
		f17_arg0.MK2Icon:SetAlpha( 0.5, 0 )
	end
end

local f0_local7 = function ( f18_arg0, f18_arg1, f18_arg2 )
	assert( f18_arg0._itemCardData )
	assert( f18_arg2.itemType )
	
	local lootNonWeaponItem = MenuBuilder.BuildRegisteredType( "LootNonWeaponItem", {
		material = f18_arg0._itemCardData.displayImage:GetValue( f18_arg1 ),
		itemType = f18_arg2.itemType,
		controllerIndex = f18_arg1
	} )
	lootNonWeaponItem:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -110, _1080p * 110, _1080p * -110, _1080p * 110 )
	f18_arg0:addElement( lootNonWeaponItem )
	f18_arg0.lootNonWeaponItem = lootNonWeaponItem
	
end

local f0_local8 = function ( f19_arg0, f19_arg1 )
	assert( f19_arg0.ItemNameText )
	f19_arg0.ItemNameText:setText( Engine.Localize( f19_arg0._itemCardData.displayName:GetValue( f19_arg1 ) ), 0 )
	assert( f19_arg0.ItemTypeText )
	f19_arg0.ItemTypeText:setText( ToUpperCase( f19_arg0._itemCardData.itemCategory:GetValue( f19_arg1 ) ), 0 )
	assert( f19_arg0.RarityText )
	f19_arg0.RarityText:SetRGBFromInt( f19_arg0._itemCardData.qualityColor:GetValue( f19_arg1 ), 0 )
	f19_arg0.RarityText:setText( f19_arg0._itemCardData.qualityName:GetValue( f19_arg1 ), 0 )
	assert( f19_arg0.QualityIcon )
	f19_arg0.QualityIcon:SetAlpha( 1, 0 )
	f19_arg0.QualityIcon.Icon:SetRGBFromInt( f19_arg0._itemCardData.qualityColor:GetValue( f19_arg1 ), 0 )
	f19_arg0.QualityIcon.Icon:setImage( RegisterMaterial( f19_arg0._itemCardData.qualityImage:GetValue( f19_arg1 ) ), 0 )
	f19_arg0.QualityIcon.IconDuplicate:setImage( RegisterMaterial( f19_arg0._itemCardData.qualityImage:GetValue( f19_arg1 ) .. "_mk2" ), 0 )
	f19_arg0.QualityIcon.IconDuplicate:SetRGBFromInt( f19_arg0._itemCardData.qualityColor:GetValue( f19_arg1 ), 0 )
	f19_arg0.LootItemCardMk2Bonus.Blur:SetRGBFromInt( f19_arg0._itemCardData.qualityColor:GetValue( f19_arg1 ), 0 )
	if f19_arg0._itemCardData.license and tonumber( f19_arg0._itemCardData.license:GetValue( f19_arg1 ) ) == LOOT.GetCurrentLootLicense() then
		assert( f19_arg0.LatestItemNotification )
		f19_arg0.LatestItemNotification:SetAlpha( 1, 0 )
	end
end

local f0_local9 = function ( f20_arg0, f20_arg1, f20_arg2 )
	assert( f20_arg2 )
	local f20_local0 = {
		controllerIndex = f20_arg1
	}
	assert( f20_arg0._itemCardData )
	if f20_arg2.isDuplicate then
		f20_local0.isDuplicate = f20_arg2.isDuplicate
		f20_local0.dupeSalvageValue = f20_arg2.dupeSalvageValue
		f20_local0.itemCardData = f20_arg0._itemCardData
	else
		f20_local0.itemCardData = f20_arg0._itemCardData
	end
	if f20_arg2.context == LUI.ItemCard.contexts.QUARTERMASTER_CIPHER then
		if f20_local0.itemCardData.uiamount then
			f20_local0.itemCardData.uiamount:SetValue( f20_arg1, f20_arg2.quantity )
		else
			f20_local0.context = f20_arg2.context
			f20_local0.quantity = f20_arg2.quantity
		end
	end
	local lootItemDetails = MenuBuilder.BuildRegisteredType( "LootItemCardDetails", f20_local0 )
	lootItemDetails:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 10, _1080p * -10, _1080p * -110, _1080p * -80 )
	f20_arg0:addElement( lootItemDetails )
	f20_arg0.lootItemDetails = lootItemDetails
	
end

local f0_local10 = function ( f21_arg0, f21_arg1, f21_arg2, f21_arg3 )
	assert( f21_arg2 )
	
	local lootItemCardUnlockInfo = MenuBuilder.BuildRegisteredType( "LootItemCardUnlockInfo", {
		controllerIndex = f21_arg1,
		baseWeaponUnlockLevel = f21_arg3
	} )
	lootItemCardUnlockInfo:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 10, _1080p * -10, _1080p * -110, _1080p * -80 )
	f21_arg0:addElement( lootItemCardUnlockInfo )
	f21_arg0.lootItemCardUnlockInfo = lootItemCardUnlockInfo
	
end

local f0_local11 = function ( f22_arg0, f22_arg1, f22_arg2 )
	assert( f22_arg0._itemCardData )
	for f22_local0 = 1, 4, 1 do
		local f22_local3 = f22_local0
		local f22_local4 = MenuBuilder.BuildRegisteredType( "LootItemCardBurst", {
			itemCardData = f22_arg0._itemCardData,
			controllerIndex = f22_arg1,
			delayOverride = LOOT.ContextSkipRandomize( f22_arg2.context )
		} )
		f22_local4:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
		f22_arg0:addElement( f22_local4 )
		f22_arg0.lootItemBurst = f22_local4
	end
end

local f0_local12 = function ( f23_arg0, f23_arg1 )
	local lootItemSheen = MenuBuilder.BuildRegisteredType( "LootItemCardSheen", {
		controllerIndex = f23_arg1
	} )
	lootItemSheen:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	f23_arg0.sheen = lootItemSheen
	f23_arg0:addElement( lootItemSheen )
	f23_arg0.lootItemSheen = lootItemSheen
	
end

local f0_local13 = function ( f24_arg0, f24_arg1, f24_arg2 )
	f24_arg0:SetFocusable( true )
	f24_arg0:registerEventHandler( "button_up", function ( element, event )
		f24_arg0:SetScale( 0, 150, LUI.EASING.inOutCubic )
		if not f24_arg1.isRecentDropsMenu then
			ACTIONS.AnimateSequence( f24_arg0.sheen, "Stop" )
		elseif f24_arg1.itemType == LUI.ItemCard.types.CALLING_CARD or f24_arg1.itemType == LUI.ItemCard.types.EMBLEM then
			ACTIONS.AnimateSequence( f24_arg0, "HideEquip" )
		end
		ACTIONS.AnimateSequence( f24_arg0, "ButtonUp" )
	end )
	f24_arg0:registerEventHandler( "button_over", function ( element, event )
		f24_arg0:SetScale( 0.05, 150, LUI.EASING.inOutCubic )
		if not f24_arg1.isRecentDropsMenu then
			ACTIONS.AnimateSequence( f24_arg0.sheen, "Pan" )
		elseif f24_arg1.itemType == LUI.ItemCard.types.CALLING_CARD or f24_arg1.itemType == LUI.ItemCard.types.EMBLEM then
			ACTIONS.AnimateSequence( f24_arg0, "ShowEquip" )
		end
		ACTIONS.AnimateSequence( f24_arg0, "ButtonOver" )
	end )
	f24_arg0:registerEventHandler( "button_action", function ( element, event )
		if f24_arg1.itemType == LUI.ItemCard.types.CALLING_CARD or f24_arg1.itemType == LUI.ItemCard.types.EMBLEM then
			local f27_local0 = f24_arg1.identifier
			assert( f27_local0 and f27_local0 ~= "" )
			local f27_local1 = LOOT.GetLootData( f27_local0 )
			LUI.FlowManager.RequestPopupMenu( f24_arg0, "QuickChangePlayerCardPopup", true, f24_arg2, false, {
				callbackFunc = function ()
					if f24_arg1.itemType == LUI.ItemCard.types.CALLING_CARD then
						local f28_local0 = tonumber( Engine.TableLookup( CSV.callingCards.file, CSV.callingCards.cols.lootID, f27_local0, CSV.callingCards.cols.index ) )
						assert( f28_local0 )
						Playercard.SetPlayercardBackground( f24_arg2, f28_local0 )
						Playercard.SaveChanges( f24_arg2 )
					else
						EmblemEditor.EquipPatch( f24_arg2, tonumber( Engine.TableLookup( CSV.patches.file, CSV.patches.cols.lootID, f27_local0, CSV.patches.cols.idx ) ) )
					end
				end,
				smallPlayerCardFunc = f0_local1
			}, nil, true )
		end
	end )
end

local f0_local14 = function ( f29_arg0 )
	if f29_arg0.lootWeaponItem then
		f29_arg0:removeElement( f29_arg0.lootWeaponItem )
		f29_arg0.lootWeaponItem = nil
	end
	if f29_arg0.lootItemCardUnlockInfo then
		f29_arg0:removeElement( f29_arg0.lootItemCardUnlockInfo )
		f29_arg0.lootItemCardUnlockInfo = nil
	end
	if f29_arg0.lootNonWeaponItem then
		f29_arg0:removeElement( f29_arg0.lootNonWeaponItem )
		f29_arg0.lootNonWeaponItem = nil
	end
	if f29_arg0.lootItemDetails then
		f29_arg0:removeElement( f29_arg0.lootItemDetails )
		f29_arg0.lootItemDetails = nil
	end
	if f29_arg0.lootDuplicateItem then
		f29_arg0:removeElement( f29_arg0.lootDuplicateItem )
		f29_arg0.lootDuplicateItem = nil
	end
	if f29_arg0.lootItemBurst then
		f29_arg0:removeElement( f29_arg0.lootItemBurst )
		f29_arg0.lootItemBurst = nil
	end
	if f29_arg0.lootItemSheen then
		f29_arg0:removeElement( f29_arg0.lootItemSheen )
		f29_arg0.lootItemSheen = nil
	end
	f29_arg0.MK2Pattern:SetAlpha( 0 )
	f29_arg0.LootItemCardMk2Bonus:SetAlpha( 0 )
	ACTIONS.AnimateSequenceByElement( f29_arg0, {
		elementName = "QualityIcon",
		sequenceName = "StopPulse",
		elementPath = "QualityIcon"
	} )
	f29_arg0.MK2Icon:SetAlpha( 0 )
	f29_arg0.LootItemCardMk2Bonus.BonusText:setText( "" )
	f29_arg0.ItemNameText:setText( "" )
	f29_arg0.ItemTypeText:setText( "" )
	f29_arg0.RarityText:SetRGBFromInt( 16777215 )
	f29_arg0.RarityText:setText( "" )
	f29_arg0.QualityIcon:SetAlpha( 0 )
	f29_arg0.QualityIcon.Icon:SetRGBFromInt( 16777215 )
	f29_arg0.QualityIcon.Icon:setImage( RegisterMaterial( "icon_item_quality_3" ) )
	f29_arg0.QualityIcon.IconDuplicate:setImage( RegisterMaterial( "icon_item_quality_3_mk2" ) )
	f29_arg0.QualityIcon.IconDuplicate:SetRGBFromInt( 16777215 )
	f29_arg0.LootItemCardMk2Bonus.Blur:SetRGBFromInt( 12566463 )
	f29_arg0.LatestItemNotification:SetAlpha( 0 )
end

local f0_local15 = function ( f30_arg0, f30_arg1, f30_arg2 )
	assert( f30_arg0.RarityFrame and f30_arg0.Background, "WARNING: Loot Item Card Items Are Missing..." )
	assert( f30_arg2 )
	f30_arg0.RarityText:SetBlendMode( BLEND_MODE.addWithAlpha )
	if not f30_arg2.isRecentDropsMenu then
		assert( f30_arg2.context )
		assert( f30_arg2.itemType )
		assert( f30_arg2.identifier )
		assert( f30_arg2.modelPath )
		assert( f30_arg2.cardIndex )
		f30_arg0._modelPath = f30_arg2.modelPath
		f30_arg0.randomize = true
		ItemCardUtils.SetupItemCardData( f30_arg0, f30_arg2.context, f30_arg2.itemType, f30_arg2.identifier, f30_arg1 )
		f0_local4( f30_arg0, f30_arg1, f30_arg2 )
	else
		f30_arg0.randomize = false
		f30_arg0.options = f30_arg2
	end
	local f30_local0 = function ()
		if f30_arg2.isRecentDropsMenu then
			f0_local13( f30_arg0, f30_arg2, f30_arg1 )
		else
			f30_arg0:SetFocusable( false )
		end
		if f30_arg2.itemType == LUI.ItemCard.types.WEAPON then
			local f31_local0 = f30_arg0._itemCardData.identifier:GetValue( f30_arg1 )
			local f31_local1 = Cac.GetBaseWeaponRefFromLootID( f31_local0 )
			f0_local6( f30_arg0, f30_arg2.itemType, f30_arg1, f31_local0 )
			local f31_local2 = Cac.IsBaseWeaponUnlockedMode( f31_local1, f30_arg1 )
			local f31_local3 = Rank.GetRankDisplay( Cac.GetBaseWeaponUnlockRank( f31_local1 ) )
			if not f31_local2 then
				f0_local10( f30_arg0, f30_arg1, f30_arg2, f31_local3 )
			end
			local f31_local4 = Cac.GetWeaponMk2BonusString( f30_arg1, f31_local1 )
			assert( f30_arg0.LootItemCardMk2Bonus )
			assert( f30_arg0.LootItemCardMk2Bonus.BonusText )
			f30_arg0.LootItemCardMk2Bonus.BonusText:setText( f31_local4 )
		elseif f30_arg2.itemType == LUI.ItemCard.types.STREAK then
			local f31_local0 = f30_arg0._itemCardData.identifier:GetValue( f30_arg1 )
			f0_local6( f30_arg0, f30_arg2.itemType, f30_arg1, f31_local0 )
			local f31_local1 = Cac.GetBaseStreakFromLootID( f31_local0 )
			if not Cac.IsBaseStreakUnlocked( f31_local1, f30_arg1 ) then
				f0_local10( f30_arg0, f30_arg1, f30_arg2, Rank.GetRankDisplay( Cac.GetStreakUnlockRank( f31_local1 ) ) )
			end
		else
			f0_local7( f30_arg0, f30_arg1, f30_arg2 )
			if f30_arg2.itemType == LUI.ItemCard.types.CURRENCY_PACK or f30_arg2.itemType == LUI.ItemCard.types.CURRENCY or f30_arg2.itemType == LUI.ItemCard.types.CONSUMABLE or f30_arg2.context == LUI.ItemCard.contexts.QUARTERMASTER_CIPHER then
				f0_local9( f30_arg0, f30_arg1, f30_arg2 )
			end
			if not f30_arg2.isRecentDropsMenu and (f30_arg2.itemType == LUI.ItemCard.types.CALLING_CARD or f30_arg2.itemType == LUI.ItemCard.types.EMBLEM) then
				ACTIONS.AnimateSequence( f30_arg0, "ShowEquip" )
				f30_arg0:addEventHandler( "loot_ceremony_complete", function ( f32_arg0, f32_arg1 )
					f0_local13( f32_arg0, f30_arg2, f30_arg1 )
				end )
			end
		end
		f0_local8( f30_arg0, f30_arg1 )
		if f30_arg2.isDuplicate and f30_arg2.itemType ~= LUI.ItemCard.types.CONSUMABLE then
			f0_local5( f30_arg0, f30_arg1 )
			f0_local9( f30_arg0, f30_arg1, f30_arg2 )
		end
		if not f30_arg2.isRecentDropsMenu then
			f0_local11( f30_arg0, f30_arg1, f30_arg2 )
			f0_local12( f30_arg0, f30_arg1 )
		end
	end
	
	f30_arg0.BuildCard = f30_local0
	f30_arg0.ResetCard = f0_local14
	f30_arg0.RandomizeCard = f0_local4
	if not f30_arg2.isRecentDropsMenu then
		if LOOT.ContextSkipRandomize( f30_arg2.context ) then
			f30_local0()
		else
			local f30_local1 = f30_arg0:Wait( (f30_arg2.cardIndex + 2) * LOOT.RandomizeDuration )
			f30_local1.onComplete = function ()
				f30_local0()
			end
			
		end
	end
end

function LootItemCard( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 320 * _1080p, 0, 472 * _1080p )
	self.id = "LootItemCard"
	self._animationSets = {}
	self._sequences = {}
	local f34_local1 = controller and controller.controllerIndex
	if not f34_local1 and not Engine.InFrontend() then
		f34_local1 = self:getRootController()
	end
	assert( f34_local1 )
	local f34_local2 = self
	local BackgroundBlur = nil
	
	BackgroundBlur = LUI.UIImage.new()
	BackgroundBlur.id = "BackgroundBlur"
	BackgroundBlur:SetAlpha( 0, 0 )
	BackgroundBlur:SetScale( 0.75, 0 )
	BackgroundBlur:setImage( RegisterMaterial( "loot_item_card_blur" ), 0 )
	BackgroundBlur:SetUseAA( true )
	BackgroundBlur:SetBlendMode( BLEND_MODE.addWithAlpha )
	BackgroundBlur:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -251, _1080p * 261, _1080p * -256, _1080p * 256 )
	self:addElement( BackgroundBlur )
	self.BackgroundBlur = BackgroundBlur
	
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:setImage( RegisterMaterial( "loot_item_card_bg" ), 0 )
	Background:SetUseAA( true )
	self:addElement( Background )
	self.Background = Background
	
	local RarityFrame = nil
	
	RarityFrame = LUI.UIImage.new()
	RarityFrame.id = "RarityFrame"
	RarityFrame:setImage( RegisterMaterial( "loot_item_card_frame_common" ), 0 )
	RarityFrame:SetUseAA( true )
	RarityFrame:SetBlendMode( BLEND_MODE.addWithAlpha )
	self:addElement( RarityFrame )
	self.RarityFrame = RarityFrame
	
	local LootItemCardMk2Bonus = nil
	
	LootItemCardMk2Bonus = MenuBuilder.BuildRegisteredType( "LootItemCardMk2Bonus", {
		controllerIndex = f34_local1
	} )
	LootItemCardMk2Bonus.id = "LootItemCardMk2Bonus"
	LootItemCardMk2Bonus:SetAlpha( 0, 0 )
	LootItemCardMk2Bonus.Gradient:SetRGBFromInt( 5066061, 0 )
	LootItemCardMk2Bonus.Gradient:SetAlpha( 0.7, 0 )
	LootItemCardMk2Bonus:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 10, _1080p * -10, _1080p * -161, _1080p * -136 )
	self:addElement( LootItemCardMk2Bonus )
	self.LootItemCardMk2Bonus = LootItemCardMk2Bonus
	
	local MK2Pattern = nil
	
	MK2Pattern = MenuBuilder.BuildRegisteredType( "MK2Pattern", {
		controllerIndex = f34_local1
	} )
	MK2Pattern.id = "MK2Pattern"
	MK2Pattern:SetAlpha( 0, 0 )
	MK2Pattern:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 10, _1080p * -10, _1080p * 9, _1080p * -9 )
	self:addElement( MK2Pattern )
	self.MK2Pattern = MK2Pattern
	
	local MK2Icon = nil
	
	MK2Icon = LUI.UIImage.new()
	MK2Icon.id = "MK2Icon"
	MK2Icon:SetAlpha( 0, 0 )
	MK2Icon:setImage( RegisterMaterial( "mk2_watermark_1" ), 0 )
	MK2Icon:SetBlendMode( BLEND_MODE.addWithAlpha )
	MK2Icon:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -71, _1080p * -13, _1080p * -50, _1080p * -21 )
	self:addElement( MK2Icon )
	self.MK2Icon = MK2Icon
	
	local RarityText = nil
	
	RarityText = LUI.UIStyledText.new()
	RarityText.id = "RarityText"
	RarityText:setText( "", 0 )
	RarityText:SetFontSize( 26 * _1080p )
	RarityText:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	RarityText:SetAlignment( LUI.Alignment.Center )
	RarityText:SetStartupDelay( 1000 )
	RarityText:SetLineHoldTime( 500 )
	RarityText:SetAnimMoveTime( 500 )
	RarityText:SetEndDelay( 1000 )
	RarityText:SetCrossfadeTime( 500 )
	RarityText:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	RarityText:SetMaxVisibleLines( 1 )
	RarityText:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 11, _1080p * -11, _1080p * -54, _1080p * -28 )
	self:addElement( RarityText )
	self.RarityText = RarityText
	
	local ItemTypeText = nil
	
	ItemTypeText = LUI.UIStyledText.new()
	ItemTypeText.id = "ItemTypeText"
	ItemTypeText:setText( "", 0 )
	ItemTypeText:SetFontSize( 20 * _1080p )
	ItemTypeText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ItemTypeText:SetAlignment( LUI.Alignment.Center )
	ItemTypeText:SetStartupDelay( 1000 )
	ItemTypeText:SetLineHoldTime( 500 )
	ItemTypeText:SetAnimMoveTime( 500 )
	ItemTypeText:SetEndDelay( 1000 )
	ItemTypeText:SetCrossfadeTime( 500 )
	ItemTypeText:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	ItemTypeText:SetMaxVisibleLines( 1 )
	ItemTypeText:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 9, _1080p * -9, _1080p * 50, _1080p * 70 )
	self:addElement( ItemTypeText )
	self.ItemTypeText = ItemTypeText
	
	local ItemNameText = nil
	
	ItemNameText = LUI.UIStyledText.new()
	ItemNameText.id = "ItemNameText"
	ItemNameText:setText( "", 0 )
	ItemNameText:SetFontSize( 26 * _1080p )
	ItemNameText:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	ItemNameText:SetAlignment( LUI.Alignment.Center )
	ItemNameText:SetStartupDelay( 1000 )
	ItemNameText:SetLineHoldTime( 500 )
	ItemNameText:SetAnimMoveTime( 500 )
	ItemNameText:SetEndDelay( 1000 )
	ItemNameText:SetCrossfadeTime( 500 )
	ItemNameText:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	ItemNameText:SetMaxVisibleLines( 1 )
	ItemNameText:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 11, _1080p * -11, _1080p * 25, _1080p * 51 )
	self:addElement( ItemNameText )
	self.ItemNameText = ItemNameText
	
	local RarityIconLarge = nil
	
	RarityIconLarge = LUI.UIImage.new()
	RarityIconLarge.id = "RarityIconLarge"
	RarityIconLarge:SetAlpha( 0, 0 )
	RarityIconLarge:SetScale( 1, 0 )
	RarityIconLarge:setImage( RegisterMaterial( "icon_item_quality_0" ), 0 )
	RarityIconLarge:SetUseAA( true )
	RarityIconLarge:SetBlendMode( BLEND_MODE.addWithAlpha )
	RarityIconLarge:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -64, _1080p * 64, _1080p * -64, _1080p * 64 )
	self:addElement( RarityIconLarge )
	self.RarityIconLarge = RarityIconLarge
	
	local QualityIcon = nil
	
	QualityIcon = MenuBuilder.BuildRegisteredType( "QualityIcon", {
		controllerIndex = f34_local1
	} )
	QualityIcon.id = "QualityIcon"
	QualityIcon:SetAlpha( 0, 0 )
	QualityIcon:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 13, _1080p * 63, _1080p * -65, _1080p * -15 )
	self:addElement( QualityIcon )
	self.QualityIcon = QualityIcon
	
	local EquipHighlight = nil
	
	EquipHighlight = LUI.UIImage.new()
	EquipHighlight.id = "EquipHighlight"
	EquipHighlight:SetAlpha( 0, 0 )
	EquipHighlight:setImage( RegisterMaterial( "loot_item_card_highlight" ), 0 )
	EquipHighlight:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -170, _1080p * 170, _1080p * -246, _1080p * 246 )
	self:addElement( EquipHighlight )
	self.EquipHighlight = EquipHighlight
	
	local EquipGradient = nil
	
	EquipGradient = LUI.UIImage.new()
	EquipGradient.id = "EquipGradient"
	EquipGradient:SetRGBFromInt( 0, 0 )
	EquipGradient:SetAlpha( 0, 0 )
	EquipGradient:setImage( RegisterMaterial( "widg_gradient_center_out" ), 0 )
	EquipGradient:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * -32, _1080p * -2 )
	self:addElement( EquipGradient )
	self.EquipGradient = EquipGradient
	
	local EquipText = nil
	
	EquipText = LUI.UIText.new()
	EquipText.id = "EquipText"
	EquipText:SetAlpha( 0, 0 )
	EquipText:setText( Engine.Localize( "MP_FRONTEND_ONLY_EQUIP" ), 0 )
	EquipText:SetFontSize( 24 * _1080p )
	EquipText:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	EquipText:SetAlignment( LUI.Alignment.Center )
	EquipText:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * -29, _1080p * -5 )
	self:addElement( EquipText )
	self.EquipText = EquipText
	
	local LatestItemNotification = nil
	
	LatestItemNotification = MenuBuilder.BuildRegisteredType( "LatestItemNotification", {
		controllerIndex = f34_local1
	} )
	LatestItemNotification.id = "LatestItemNotification"
	LatestItemNotification:SetAlpha( 0, 0 )
	LatestItemNotification:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -89, _1080p * 89, _1080p * 225, _1080p * 289 )
	self:addElement( LatestItemNotification )
	self.LatestItemNotification = LatestItemNotification
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		RarityFrame:RegisterAnimationSequence( "Pulse", {
			{
				function ()
					return self.RarityFrame:SetAlpha( 1, 0 )
				end,
				function ()
					return self.RarityFrame:SetAlpha( 0.5, 1000 )
				end,
				function ()
					return self.RarityFrame:SetAlpha( 0.99, 1000 )
				end
			}
		} )
		self._sequences.Pulse = function ()
			RarityFrame:AnimateLoop( "Pulse" )
		end
		
		EquipHighlight:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.EquipHighlight:SetAlpha( 1, 0 )
				end,
				function ()
					return self.EquipHighlight:SetAlpha( 0, 100 )
				end
			}
		} )
		self._sequences.ButtonUp = function ()
			EquipHighlight:AnimateSequence( "ButtonUp" )
		end
		
		EquipHighlight:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.EquipHighlight:SetAlpha( 0, 0 )
				end,
				function ()
					return self.EquipHighlight:SetAlpha( 1, 100 )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			EquipHighlight:AnimateSequence( "ButtonOver" )
		end
		
		EquipGradient:RegisterAnimationSequence( "HideEquip", {
			{
				function ()
					return self.EquipGradient:SetAlpha( 1, 0 )
				end,
				function ()
					return self.EquipGradient:SetAlpha( 0, 100 )
				end
			},
			{
				function ()
					return self.EquipGradient:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * -32, _1080p * -2, 0 )
				end,
				function ()
					return self.EquipGradient:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * -27, _1080p * 3, 100 )
				end
			}
		} )
		EquipText:RegisterAnimationSequence( "HideEquip", {
			{
				function ()
					return self.EquipText:SetAlpha( 1, 0 )
				end,
				function ()
					return self.EquipText:SetAlpha( 0, 100 )
				end
			},
			{
				function ()
					return self.EquipText:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * -29, _1080p * -5, 0 )
				end,
				function ()
					return self.EquipText:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * -24, 0, 100 )
				end
			}
		} )
		self._sequences.HideEquip = function ()
			EquipGradient:AnimateSequence( "HideEquip" )
			EquipText:AnimateSequence( "HideEquip" )
		end
		
		EquipGradient:RegisterAnimationSequence( "ShowEquip", {
			{
				function ()
					return self.EquipGradient:SetAlpha( 0, 0 )
				end,
				function ()
					return self.EquipGradient:SetAlpha( 1, 100 )
				end
			},
			{
				function ()
					return self.EquipGradient:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * -27, _1080p * 3, 0 )
				end,
				function ()
					return self.EquipGradient:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * -32, _1080p * -2, 100 )
				end
			}
		} )
		EquipText:RegisterAnimationSequence( "ShowEquip", {
			{
				function ()
					return self.EquipText:SetAlpha( 0, 0 )
				end,
				function ()
					return self.EquipText:SetAlpha( 1, 100 )
				end
			},
			{
				function ()
					return self.EquipText:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * -24, 0, 0 )
				end,
				function ()
					return self.EquipText:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * -29, _1080p * -5, 100 )
				end
			}
		} )
		self._sequences.ShowEquip = function ()
			EquipGradient:AnimateSequence( "ShowEquip" )
			EquipText:AnimateSequence( "ShowEquip" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local15( self, f34_local1, controller )
	return self
end

MenuBuilder.registerType( "LootItemCard", LootItemCard )
LockTable( _M )
