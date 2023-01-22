local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "frontEnd.CP.weaponBuild"
f0_local1 = "frontEnd.CP.weaponBuild.weaponSelect"
f0_local2 = "frontEnd.weapon.levelInfo"
local f0_local3 = function ()
	Streaming.SetStreamingEnabled( false )
	WipeGlobalModelsAtPath( f0_local0 )
	WipeGlobalModelsAtPath( f0_local2 )
end

local f0_local4 = function ( f2_arg0, f2_arg1, f2_arg2, f2_arg3 )
	local f2_local0 = f2_arg3[f2_arg1 + 1]
	assert( f2_local0 )
	return {
		passive = {
			name = f2_arg0:GetDataSourceForSubmodel( "name", Engine.Localize( f2_local0.name:GetValue( f2_arg2 ) ) ),
			desc = f2_arg0:GetDataSourceForSubmodel( "weaponDesc", Engine.Localize( f2_local0.weaponDesc:GetValue( f2_arg2 ) ) ),
			image = f2_local0.image
		}
	}
end

local f0_local5 = function ( f3_arg0, f3_arg1, f3_arg2, f3_arg3 )
	local f3_local0 = f3_arg3[f3_arg1 + 1]
	assert( f3_local0 )
	return {
		fireMode = {
			name = f3_arg0:GetDataSourceForSubmodel( "name", Engine.Localize( f3_local0.name:GetValue( f3_arg2 ) ) ),
			icon = f3_local0.image
		}
	}
end

local f0_local6 = function ( f4_arg0, f4_arg1, f4_arg2 )
	local f4_local0 = f4_arg0.attachments
	f4_arg1.attachmentOneRef = f4_local0.attachmentSlotOne.ref
	f4_arg1.attachmentTwoRef = f4_local0.attachmentSlotTwo.ref
	f4_arg1.attachmentThreeRef = f4_local0.attachmentSlotThree.ref
	f4_arg1.attachmentFourRef = f4_local0.attachmentSlotFour.ref
	f4_arg1.attachmentFiveRef = f4_local0.attachmentSlotFive.ref
	f4_arg1.attachmentSixRef = f4_local0.attachmentSlotSix.ref
end

local f0_local7 = function ( f5_arg0, f5_arg1, f5_arg2 )
	assert( f5_arg1.ref )
	assert( f5_arg1.name )
	assert( f5_arg1.image )
	assert( f5_arg1.fullImage )
	assert( f5_arg1.desc )
	local f5_local0 = f5_arg1.ref:GetValue( f5_arg2 )
	local f5_local1 = f0_local1 .. ".base." .. f5_local0
	local f5_local2 = Engine.IsUnlocked( f5_arg2, "CPWeapon", f5_local0, true )
	local f5_local3 = LUI.DataSourceInGlobalModel.new( f0_local1 .. ".unlocked." .. tostring( f5_local2 ), f5_local2 )
	local f5_local4 = not f5_local2
	local f5_local5 = LUI.DataSourceInGlobalModel.new( f0_local1 .. ".disabled." .. tostring( f5_local4 ), f5_local4 )
	local f5_local6 = WEAPON_BUILD.GetWeaponDataSourceForKey( f5_local0, f5_arg2 )
	local f5_local7 = {}
	local f5_local8 = Cac.GetFireModesForWeapon( f5_local0 )
	local f5_local9 = LUI.DataSourceFromList.new( #f5_local8 )
	f5_local9.MakeDataSourceAtIndex = function ( f6_arg0, f6_arg1, f6_arg2 )
		return f0_local5( LUI.DataSourceInGlobalModel.new( f5_local1 .. ".fireMode." .. f6_arg1, f6_arg1 ), f6_arg1, f6_arg2, f5_local8 )
	end
	
	f5_local7[1] = {
		weapon = {
			weaponRef = f5_arg1.ref,
			ref = f5_arg1.ref,
			weaponLootID = LUI.DataSourceInGlobalModel.new( f5_local1 .. ".lootID", Cac.BaseLootID ),
			ref = f5_arg1.ref,
			name = f5_arg1.name,
			image = f5_arg1.image,
			fullImage = f5_arg1.fullImage,
			desc = f5_arg1.desc,
			isUnlocked = f5_local3,
			isDisabled = f5_local5,
			quality = LUI.DataSourceInGlobalModel.new( f5_local1 .. ".quality", 0 ),
			qualityString = LUI.DataSourceInGlobalModel.new( f5_local1 .. ".qualityString", "" ),
			qualityColor = LUI.DataSourceInGlobalModel.new( f5_local1 .. ".qualityColor", Cac.GetLootQualityColor( Cac.LowestQuality ) ),
			qualityImage = LUI.DataSourceInGlobalModel.new( f5_local1 .. ".qualityImage", Cac.GetLootQualityImage( Cac.LowestQuality ) ),
			fireModes = f5_local9,
			passives = LUI.DataSourceFromList.new( 0 ),
			baseWeaponRef = f5_arg1.ref,
			variantID = LUI.DataSourceInGlobalModel.new( f5_local1 .. ".variantID", -1 ),
			scrollIndex = LUI.DataSourceInGlobalModel.new( f5_local1 .. ".scrollIndex", 1 + #f5_local7 ),
			isLoot = LUI.DataSourceInGlobalModel.new( f5_local1 .. ".isLoot", false ),
			isMk2 = LUI.DataSourceInGlobalModel.new( f5_local1 .. ".isMk2", false ),
			displayOrder = 0
		}
	}
	f0_local6( f5_local6, f5_local7[1].weapon, f5_arg2 )
	local f5_local10 = LOADOUT.GetWeaponLootVariantData( f5_local0 )
	if f5_local10 and not CONDITIONS.IsSystemLink( self ) then
		for f5_local24, f5_local25 in ipairs( f5_local10.rows ) do
			local f5_local26 = CSV.ReadRow( {
				file = f5_local10.file,
				cols = CSV.weaponLoot.cols
			}, f5_local25 )
			local f5_local27 = f0_local1 .. ".loot." .. f5_local26.ref
			local f5_local28 = Engine.Localize( f5_local26.displayName )
			local f5_local29 = tonumber( f5_local26.quality ) or 1
			local f5_local30 = Cac.GetLootQualityString( f5_local29 )
			local f5_local31 = Cac.GetLootQualityColor( f5_local29 )
			local f5_local32 = Cac.GetLootQualityImage( f5_local29 )
			local f5_local33 = Cac.GetWeaponUniqueID( f5_local26.ref )
			local f5_local34 = Cac.IsWeaponRefMk2( f5_local26.ref )
			local f5_local18 = nil
			if LOADOUT.GetWeaponLootOverrideData( f5_local26.ref ) then
				local f5_local14 = LOADOUT.GetWeaponLootOverrideData( f5_local26.ref )
				if f5_local14.desc then
					f5_local14 = LUI.DataSourceInGlobalModel.new
					local f5_local15 = f5_local27 .. "desc"
					local f5_local16 = Engine.Localize
					local f5_local17 = LOADOUT.GetWeaponLootOverrideData( f5_local26.ref )
					f5_local18 = f5_local14( f5_local15, f5_local16( f5_local17.desc ) )
				else
					f5_local18 = f5_arg1.desc
				end
				table.sort( f5_local7, function ( f9_arg0, f9_arg1 )
					return tonumber( f9_arg0.weapon.displayOrder ) < tonumber( f9_arg1.weapon.displayOrder )
				end )
			end
			f5_local18 = f5_arg1.desc
		end
	end
	local f5_local11 = #f5_local7
	local f5_local12 = LUI.DataSourceFromList.new( f5_local11 )
	f5_local12.GetDataSourceAtIndex = function ( f10_arg0, f10_arg1 )
		return f5_local7[f10_arg1 + 1]
	end
	
	f5_local12.GetDefaultFocusIndex = function ()
		local f11_local0 = f5_local6.lootItemID:GetValue( f5_arg2 )
		for f11_local4, f11_local5 in ipairs( f5_local7 ) do
			if f11_local5.weapon.weaponLootID:GetValue( f5_arg2 ) == f11_local0 then
				return f11_local4 - 1
			end
		end
		return nil
	end
	
	for f5_local26, f5_local27 in ipairs( f5_local7 ) do
		f5_local27.sortedIndex = f5_local26 - 1
	end
	f5_local13 = function ( f12_arg0 )
		return Cac.GetWeaponQuality( f12_arg0 )
	end
	
	f5_local24 = function ( f13_arg0 )
		return Cac.IsLootIDMk2( f13_arg0 )
	end
	
	f5_local25 = LUI.DataSourceInGlobalModel.new( f5_local1 )
	f5_local26 = f5_local6.lootItemID:FilterTo( f5_local25, "equippedQuality", f5_local13 )
	return {
		variants = f5_local12,
		isUnlocked = f5_local3,
		isDisabled = f5_local5,
		equippedQuality = f5_local26,
		equippedQualityColor = f5_local26:Filter( "color", Cac.GetLootQualityColor ),
		equippedQualityImage = f5_local26:Filter( "image", Cac.GetLootQualityImage ),
		equipped = LUI.DataSourceInGlobalModel.new( f0_local1 .. ".equipped", false ),
		equippedAlpha = LUI.DataSourceInGlobalModel.new( f0_local1 .. ".equippedAlpha", 0 ),
		numVariants = LUI.DataSourceInGlobalModel.new( f5_local1 .. ".numVariants", f5_local11 ),
		equippedDetails = f5_local6,
		isMk2 = f5_local6.lootItemID:FilterTo( f5_local25, "equippedIsMk2", f5_local24 )
	}
end

local f0_local8 = function ( f14_arg0, f14_arg1 )
	local f14_local0 = LUI.FlowManager.GetScopedData( f14_arg0 )
	if f14_local0.currentBaseWeaponsDataSource and f14_local0.currentWeaponsDataSource then
		local f14_local1 = f14_arg0.BaseWeapons
		local f14_local2 = f14_arg0.Weapons
		local f14_local3 = f14_local1:GetGridDataSource()
		local f14_local4 = f14_local3:Decorate( function ()
			return {}
		end )
		f14_local1:SetDataSource( f14_local0.currentBaseWeaponsDataSource, f14_arg1.controller )
		f14_local4.GetDefaultFocusIndex = function ()
			return f14_local0.currentGridIndex
		end
		
		f14_local1:SetGridDataSource( f14_local4 )
		f14_local2:SetDataSource( f14_local0.currentWeaponsDataSource, f14_arg1.controller )
		if f14_local0.openedAttachmentEdit then
			ACTIONS.AnimateSequence( f14_arg0, "OpenedAttachmentSelection" )
			if CONDITIONS.IsSystemLink( f14_arg0 ) then
				ACTIONS.AnimateSequence( f14_arg0, "HideWeaponLevel" )
			end
			f14_arg0:AddButtonHelperTextToElement( f14_arg0.ButtonHelperBar, {
				helper_text = Engine.Localize( "LUA_MENU_CLEAR" ),
				button_ref = "button_alt1",
				side = "left",
				priority = 2,
				clickable = true
			} )
		else
			f14_local0.currentBaseWeaponsDataSource = nil
			f14_local0.currentWeaponsDataSource = nil
		end
	end
end

local f0_local9 = function ()
	Engine.SetFrontEndSceneSection( "weapon_select", 1 )
end

local f0_local10 = function ( f18_arg0 )
	return function ( f19_arg0, f19_arg1, f19_arg2 )
		local f19_local0 = f19_arg1.weapons:Decorate( f0_local7 )
		return {
			name = f19_arg1.pluralName:Filter( "localized", Engine.Localize ),
			weapons = f19_local0,
			focusFunction = function ()
				local f20_local0 = LUI.FlowManager.GetScopedData( f18_arg0 )
				if not f20_local0.currentBaseWeaponsDataSource then
					WipeGlobalModelsAtPath( f0_local0 )
				end
				f18_arg0:processEvent( {
					name = "close_attachment_selection",
					controllerIndex = f19_arg2
				} )
				f18_arg0:SetDataSource( f19_local0, f19_arg2 )
				f18_arg0.MenuTitle.MenuTitle:setText( ToUpperCase( Engine.Localize( f19_arg1.pluralName:GetValue( f19_arg2 ) ), 0 ) )
			end
			
		}
	end
	
end

local f0_local11 = function ( f21_arg0, f21_arg1 )
	local f21_local0 = f21_arg0.BaseWeapons:GetDataSource( f21_arg1 )
	if not f21_local0 then
		return false
	else
		local f21_local1
		if f21_local0.isDisabled:GetValue( f21_arg1 ) == nil or f21_local0.isDisabled:GetValue( f21_arg1 ) ~= false then
			f21_local1 = false
		else
			f21_local1 = true
		end
	end
	return f21_local1 and Cac.GetWeaponClass( f21_local0.ref:GetValue( f21_arg1 ) ) ~= "weapon_projectile"
end

local f0_local12 = function ( f22_arg0 )
	local f22_local0 = LUI.FlowManager.GetScopedData( f22_arg0 )
	local f22_local1 = f22_arg0.BaseWeapons:GetDataSource()
	if f22_local0.openedAttachmentEdit or f22_local1.numVariants:GetValue( controllerIndex ) > 1 then
		f22_arg0:AddButtonHelperTextToElement( f22_arg0.ButtonHelperBar, {
			helper_text = Engine.Localize( "LUA_MENU_SELECT" ),
			button_ref = "button_primary",
			side = "left",
			clickable = true
		} )
	else
		f22_arg0:RemoveButtonHelperTextFromElement( f22_arg0.ButtonHelperBar, "button_primary", "left" )
	end
end

local f0_local13 = function ( f23_arg0, f23_arg1, f23_arg2 )
	assert( f23_arg2 )
	assert( f23_arg0.MenuTitle )
	assert( f23_arg0.MenuTitle.MenuTitle )
	assert( f23_arg0.PageCount )
	assert( f23_arg0.BaseWeapons )
	assert( f23_arg0.Weapons )
	assert( f23_arg0.WeaponLevel )
	assert( f23_arg0.Attachments )
	assert( f23_arg0.ButtonHelperBar )
	assert( f23_arg0.Tabs )
	assert( f23_arg0.Tabs.Tabs )
	Streaming.SetStreamingEnabled( true )
	local f23_local0 = LOADOUT.MakeBaseWeaponsListDataSource( f0_local1 .. ".baseWeapons", Cac.GetAllWeaponClasses(), Cac.GetWeaponRowList() )
	local f23_local1 = f23_local0:Decorate( f0_local10( f23_arg0 ) )
	local f23_local2 = LUI.FlowManager.GetScopedData( f23_arg0 )
	f23_local2 = f23_local2.currentTabIndex or 0
	f23_local1.GetDefaultFocusIndex = function ()
		return f23_local2
	end
	
	f23_local1:SetCachingEnabled( true )
	f23_arg0.Tabs.Tabs:SetTabManagerDataSource( f23_local1 )
	local f23_local3 = function ()
		local f25_local0 = f23_arg0.BaseWeapons:GetDataSource( f23_arg1 )
		local f25_local1 = f23_arg0.Weapons:GetDataSource( f23_arg1 )
		local f25_local2 = f25_local0.equippedDetails
		local f25_local3 = f25_local2.lootItemID:GetValue( f23_arg1 )
		local f25_local4 = f25_local2.variantID:GetValue( f23_arg1 )
		f25_local2.lootItemID:SetValue( f23_arg1, f25_local1.weapon.weaponLootID:GetValue( f23_arg1 ) )
		f25_local2.variantID:SetValue( f23_arg1, f25_local1.weapon.variantID:GetValue( f23_arg1 ) )
		if Engine.IsAliensMode() then
			if f25_local2.lootItemID:GetValue( f23_arg1 ) ~= f25_local3 and f25_local2.variantID:GetValue( f23_arg1 ) ~= f25_local4 then
				Cac.ClearReticle( f25_local2, f23_arg1 )
				f25_local1.weapon.attachmentOneRef:SetValue( f23_arg1, Cac.attachmentNoneValue )
				f25_local1.weapon.attachmentTwoRef:SetValue( f23_arg1, Cac.attachmentNoneValue )
				f25_local1.weapon.attachmentThreeRef:SetValue( f23_arg1, Cac.attachmentNoneValue )
				f25_local1.weapon.attachmentFourRef:SetValue( f23_arg1, Cac.attachmentNoneValue )
				f25_local1.weapon.attachmentFiveRef:SetValue( f23_arg1, Cac.attachmentNoneValue )
				f25_local1.weapon.attachmentSixRef:SetValue( f23_arg1, Cac.attachmentNoneValue )
			end
		end
		f23_arg0.WeaponsPips:UpdateScrolling()
	end
	
	local f23_local4 = function ()
		local f26_local0 = LUI.FlowManager.GetScopedData( f23_arg0 )
		local f26_local1 = f23_arg0.BaseWeapons:GetDataSource( f23_arg1 )
		local f26_local2 = f23_arg0.Weapons:GetDataSource( f23_arg1 )
		f26_local0.currentBaseWeaponsDataSource = f26_local1
		f26_local0.currentBaseWeaponsDataSource.isProperty = false
		f26_local0.currentWeaponsDataSource = f26_local2
		f26_local0.currentWeaponsDataSource.isProperty = false
		f23_arg0.BaseWeapons:saveState()
		f23_arg0.Weapons:saveState()
	end
	
	local f23_local5 = function ()
		local f27_local0 = LUI.FlowManager.GetScopedData( f23_arg0 )
		f27_local0.currentBaseWeaponsDataSource = nil
		f27_local0.currentWeaponsDataSource = nil
	end
	
	local f23_local6 = function ()
		local f28_local0 = LUI.FlowManager.GetScopedData( f23_arg0 )
		local f28_local1 = ""
		if f28_local0.openedAttachmentEdit then
			f28_local1 = Engine.Localize( "LUA_MENU_CLEAR" )
		elseif f0_local11( f23_arg0, f23_arg1 ) then
			f28_local1 = Engine.Localize( "MENU_ATTACHMENTS_CAPS" )
			ACTIONS.AnimateSequence( f23_arg0, "ShowAttachmentsBar" )
		else
			ACTIONS.AnimateSequence( f23_arg0, "HideAttachmentsBar" )
		end
		f23_arg0:AddButtonHelperTextToElement( f23_arg0.ButtonHelperBar, {
			helper_text = f28_local1,
			button_ref = "button_alt1",
			side = "left",
			priority = 2,
			clickable = true
		} )
	end
	
	local f23_local7 = function ()
		local f29_local0 = f23_arg0.BaseWeapons:GetDataSource()
		local f29_local1 = f23_arg0.Weapons:GetDataSource()
		if f29_local1 and f29_local0 then
			f23_arg0.PageCount:setText( Engine.Localize( "LUA_MENU_X_OF_Y", f29_local1.weapon.scrollIndex:GetValue( f23_arg1 ), f29_local0.numVariants:GetValue( f23_arg1 ) ) )
		end
	end
	
	local f23_local8 = function ()
		local f30_local0 = f23_arg0.WeaponLevel:GetDataSource( f23_arg1 )
		local f30_local1 = f23_arg0.Weapons:GetDataSource( f23_arg1 )
		local f30_local2 = f30_local1.weapon.baseWeaponRef:GetValue( f23_arg1 )
		local f30_local3 = f30_local1.weapon.ref:GetValue( f23_arg1 )
		local f30_local4 = f30_local1.weapon.quality:GetValue( f23_arg1 )
		local f30_local5 = f30_local1.weapon.variantID:GetValue( f23_arg1 )
		local f30_local6 = {}
		local f30_local7 = f30_local1.weapon.attachmentOneRef:GetValue( f23_arg1 )
		local f30_local8 = f30_local1.weapon.attachmentTwoRef:GetValue( f23_arg1 )
		local f30_local9 = f30_local1.weapon.attachmentThreeRef:GetValue( f23_arg1 )
		local f30_local10 = f30_local1.weapon.attachmentFourRef:GetValue( f23_arg1 )
		local f30_local11 = f30_local1.weapon.attachmentFiveRef:GetValue( f23_arg1 )
		local f30_local12 = f30_local1.weapon.attachmentSixRef:GetValue( f23_arg1 )
		f30_local6 = f30_local7
		f30_local7 = f23_arg0.BaseWeapons:GetDataSource( f23_arg1 )
		f30_local8 = f30_local7.equippedDetails
		f30_local12 = Cac.ConvertWeaponMPToZM( Cac.GetCompleteWeaponModelName( f30_local2, f30_local3, f30_local4, f30_local5, f30_local8.camoInfo.ref:GetValue( f23_arg1 ), f30_local6, f30_local8.cosmeticAttachmentInfo.ref:GetValue( f23_arg1 ) ) )
		Streaming.RequestWeaponViewModels( {
			f30_local12
		}, f23_arg1 )
		FrontEndScene.SetWeaponModel( 0, f30_local12, true )
		ClientWeapon.SetWeaponVisible( 0, true )
		ClientWeapon.SetWeaponIsViewModel( 0, true )
	end
	
	local f23_local9 = function ()
		local f31_local0 = f23_arg0.WeaponLevel:GetDataSource( f23_arg1 )
		local f31_local1 = f23_arg0.Weapons:GetDataSource( f23_arg1 )
		f31_local0.weaponRef:SetValue( f23_arg1, f31_local1.weapon.baseWeaponRef:GetValue( f23_arg1 ) )
		local f31_local2 = f31_local1.weapon.variantID:GetValue( f23_arg1 )
		local f31_local3 = f23_arg0.BaseWeapons:GetDataSource( f23_arg1 )
		local f31_local4 = f31_local3.equippedDetails
		f23_local8()
		f23_local6()
		f0_local12( f23_arg0 )
		if f0_local11( f23_arg0, f23_arg1 ) then
			f23_arg0.Attachments:processEvent( {
				name = "refresh_animate"
			} )
		end
	end
	
	local f23_local10 = function ()
		local f32_local0 = LUI.FlowManager.GetScopedData( f23_arg0 )
		ACTIONS.AnimateSequence( f23_arg0, "ClosedAttachmentSelection" )
		if CONDITIONS.IsSystemLink( f23_arg0 ) then
			ACTIONS.AnimateSequence( f23_arg0, "HideWeaponLevel" )
		end
		ACTIONS.LoseFocus( f23_arg0, "Attachments", f23_arg1 )
		ACTIONS.GainFocus( f23_arg0, "BaseWeapons", f23_arg1 )
		f32_local0.openedAttachmentEdit = false
		f32_local0.currentBaseWeaponsDataSource = nil
		f32_local0.currentWeaponsDataSource = nil
		f23_local6()
		f0_local12( f23_arg0 )
		f23_arg0.Tabs.Tabs:EnableAll()
	end
	
	f23_arg0.bindButton:addEventHandler( "button_secondary", function ( f33_arg0, f33_arg1 )
		local f33_local0 = LUI.FlowManager.GetScopedData( f23_arg0 )
		if not f33_local0.openedAttachmentEdit then
			ACTIONS.LeaveMenu( f23_arg0 )
		else
			f23_local10()
		end
	end )
	f23_arg0.bindButton:addEventHandler( "button_alt2", function ( f34_arg0, f34_arg1 )
		local f34_local0 = LUI.FlowManager.GetScopedData( f23_arg0 )
		local f34_local1 = f23_arg0.BaseWeapons:GetDataSource( f23_arg1 )
		if f34_local1.isUnlocked:GetValue( f23_arg1 ) and not f34_local0.openedAttachmentEdit then
			local f34_local2 = f34_local1.equippedDetails
			f34_local0.currentBaseWeaponsDataSource = f34_local1
			f34_local0.currentBaseWeaponsDataSource.isProperty = false
			f34_local0.currentWeaponsDataSource = f23_arg0.Weapons:GetDataSource( f23_arg1 )
			f34_local0.currentWeaponsDataSource.isProperty = false
			f34_local0.currentTabIndex = f23_arg0.Tabs.Tabs:GetCurrentTabIndex()
			ACTIONS.OpenWeaponPersonalizeMenu( f23_arg0, f23_arg1, f34_local2 )
			Engine.PlaySound( "cp_ui_select_alt" )
			return true
		else
			return false
		end
	end )
	f23_arg0:addEventHandler( "open_attachment_selection", function ( f35_arg0, f35_arg1 )
		if f0_local11( f23_arg0, f23_arg1 ) then
			local f35_local0 = LUI.FlowManager.GetScopedData( f23_arg0 )
			f35_local0.currentGridIndex = f23_arg0.BaseWeapons:GetFocusPosition( LUI.DIRECTION.vertical )
			f35_local0.currentTabIndex = f23_arg0.Tabs.Tabs:GetCurrentTabIndex()
			f35_local0.openedAttachmentEdit = true
			ACTIONS.AnimateSequence( f35_arg0, "OpenedAttachmentSelection" )
			if CONDITIONS.IsSystemLink( f23_arg0 ) then
				ACTIONS.AnimateSequence( f23_arg0, "HideWeaponLevel" )
			end
			f23_local3()
			f23_local4()
			f23_local8()
			ACTIONS.LoseFocus( f23_arg0, "Weapons", f23_arg1 )
			ACTIONS.LoseFocus( f23_arg0, "BaseWeapons", f23_arg1 )
			ACTIONS.GainFocus( f23_arg0, "Attachments", f23_arg1 )
			f23_local6()
			f0_local12( f23_arg0 )
			f23_arg0.Tabs.Tabs:DisableAll()
		end
		return true
	end )
	f23_arg0:addEventHandler( "close_attachment_selection", function ( f36_arg0, f36_arg1 )
		local f36_local0 = LUI.FlowManager.GetScopedData( f23_arg0 )
		if f36_local0.openedAttachmentEdit then
			f23_local10()
		end
	end )
	f23_arg0:addEventHandler( "set_current_weapon", function ( f37_arg0, f37_arg1 )
		f23_local3()
		f23_local8()
	end )
	f23_arg0:addEventHandler( "pip_mouse_select", function ( f38_arg0, f38_arg1 )
		local f38_local0 = f38_arg1.pip:GetDataSource()
		local f38_local1 = f23_arg0.BaseWeapons:GetDataSource()
		if not f38_local1.isDisabled:GetValue( f23_arg1 ) then
			f23_arg0.Weapons:SetFocusedPosition( {
				x = f38_local0.sortedIndex,
				y = 0
			}, false )
			f23_local3()
			f23_local8()
		end
	end )
	f23_arg0.bindButton:addEventHandler( "button_alt1", function ()
		if f0_local11( f23_arg0, f23_arg1 ) then
			f23_arg0:dispatchEventToCurrentMenu( {
				name = "open_attachment_selection"
			} )
		end
	end )
	local f23_local11 = f23_arg0:GetDataSource()
	f23_local11.GetDefaultFocusIndex = function ()
		local f40_local0 = LUI.FlowManager.GetScopedData( f23_arg0 )
		return f40_local0.currentGridIndex
	end
	
	ClientWeapon.SetWeaponRotation( 0, 0, 0, 0 )
	f23_arg0.PageCount:SubscribeToModelThroughElement( f23_arg0.BaseWeapons, "numVariants", f23_local7 )
	f23_arg0.PageCount:SubscribeToModelThroughElement( f23_arg0.Weapons, "weapon.scrollIndex", f23_local7 )
	f23_arg0:SubscribeToModelThroughElement( f23_arg0.Weapons, "weapon.baseWeaponRef", f23_local9 )
	f0_local2 = f23_arg0.WeaponLevel.modelPath
	f23_arg0.Attachments:SetGridDataSourceThroughElement( f23_arg0.BaseWeapons, "equippedDetails.attachmentsList" )
	f23_arg0:addEventHandler( "menu_create", f0_local8 )
	f23_arg0:addEventHandler( "attachment_cleared", f23_local9 )
end

function CPWeaponSelect( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "CPWeaponSelect"
	self._animationSets = {}
	self._sequences = {}
	local f41_local1 = controller and controller.controllerIndex
	if not f41_local1 and not Engine.InFrontend() then
		f41_local1 = self:getRootController()
	end
	assert( f41_local1 )
	f0_local9( self, f41_local1, controller )
	self:playSound( "menu_open" )
	local f41_local2 = self
	self:setUseStencil( true )
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f41_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local BaseWeapons = nil
	
	BaseWeapons = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 5,
		controllerIndex = f41_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "CPBaseWeapon", {
				controllerIndex = f41_local1
			} )
		end,
		wrapX = false,
		wrapY = false,
		spacingX = _1080p * 6,
		spacingY = _1080p * 6,
		columnWidth = _1080p * 250,
		rowHeight = _1080p * 140.2,
		scrollingThresholdX = 1,
		scrollingThresholdY = 0,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	BaseWeapons.id = "BaseWeapons"
	BaseWeapons:setUseStencil( true )
	BaseWeapons:SetGridDataSourceThroughElement( self, nil )
	BaseWeapons:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 139.5, _1080p * 389.5, _1080p * 201, _1080p * 926 )
	self:addElement( BaseWeapons )
	self.BaseWeapons = BaseWeapons
	
	local Weapons = nil
	
	Weapons = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 1,
		controllerIndex = f41_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "Weapon", {
				controllerIndex = f41_local1
			} )
		end,
		wrapX = false,
		wrapY = false,
		primaryAxis = LUI.DIRECTION.vertical,
		spacingX = _1080p * 0,
		spacingY = _1080p * 0,
		columnWidth = _1080p * 1000,
		rowHeight = _1080p * 450,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Center,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	Weapons.id = "Weapons"
	Weapons:setUseStencil( true )
	Weapons:SetGridDataSourceThroughElement( BaseWeapons, "variants" )
	Weapons:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * -409, _1080p * 670, _1080p * 343.5, _1080p * 793.5 )
	self:addElement( Weapons )
	self.Weapons = Weapons
	
	local WeaponDetails = nil
	WeaponDetails = MenuBuilder.BuildRegisteredType( "WeaponDetails", {
		controllerIndex = f41_local1
	} )
	WeaponDetails.id = "WeaponDetails"
	WeaponDetails:SetDataSourceThroughElement( Weapons, nil )
	if Engine.IsMultiplayer() then
		WeaponDetails.Passives.Grid:SetLeft( _1080p * 50, 0 )
	end
	WeaponDetails:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 479, 0, _1080p * 201.5, _1080p * 651.5 )
	self:addElement( WeaponDetails )
	self.WeaponDetails = WeaponDetails
	
	local BaseWeaponsScrollbar = nil
	
	BaseWeaponsScrollbar = MenuBuilder.BuildRegisteredType( "VerticalMinimalScrollbar", {
		controllerIndex = f41_local1
	} )
	BaseWeaponsScrollbar.id = "BaseWeaponsScrollbar"
	BaseWeaponsScrollbar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 91, _1080p * 108, _1080p * 203, _1080p * 939 )
	self:addElement( BaseWeaponsScrollbar )
	self.BaseWeaponsScrollbar = BaseWeaponsScrollbar
	
	local WeaponsPips = nil
	
	WeaponsPips = LUI.Pips.new( {
		spacing = _1080p * 10,
		direction = LUI.DIRECTION.horizontal,
		alignment = LUI.Alignment.Center,
		buildPip = function ()
			return MenuBuilder.BuildRegisteredType( "WeaponPip", {
				controllerIndex = f41_local1
			} )
		end,
		controllerIndex = f41_local1
	} )
	WeaponsPips.id = "WeaponsPips"
	WeaponsPips:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 1018, _1080p * -736, _1080p * -346.5, _1080p * -298.5 )
	self:addElement( WeaponsPips )
	self.WeaponsPips = WeaponsPips
	
	local ArrowRight = nil
	
	ArrowRight = MenuBuilder.BuildRegisteredType( "ArrowRight", {
		controllerIndex = f41_local1
	} )
	ArrowRight.id = "ArrowRight"
	ArrowRight:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1670, _1080p * 1734, _1080p * 587.5, _1080p * 715.5 )
	self:addElement( ArrowRight )
	self.ArrowRight = ArrowRight
	
	local ArrowLeft = nil
	
	ArrowLeft = MenuBuilder.BuildRegisteredType( "ArrowLeft", {
		controllerIndex = f41_local1
	} )
	ArrowLeft.id = "ArrowLeft"
	ArrowLeft:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 513, _1080p * 577, _1080p * 587.5, _1080p * 715.5 )
	self:addElement( ArrowLeft )
	self.ArrowLeft = ArrowLeft
	
	local WeaponLevel = nil
	
	WeaponLevel = MenuBuilder.BuildRegisteredType( "LevelInfo", {
		controllerIndex = f41_local1
	} )
	WeaponLevel.id = "WeaponLevel"
	WeaponLevel:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 1490, _1080p * 1790, _1080p * -253, _1080p * -167 )
	self:addElement( WeaponLevel )
	self.WeaponLevel = WeaponLevel
	
	local PageCount = nil
	
	PageCount = LUI.UIText.new()
	PageCount.id = "PageCount"
	PageCount:SetAlpha( 0, 0 )
	PageCount:setText( "1/15", 0 )
	PageCount:SetFontSize( 24 * _1080p )
	PageCount:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	PageCount:SetAlignment( LUI.Alignment.Center )
	PageCount:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1018, _1080p * 1184, _1080p * 781.5, _1080p * 805.5 )
	self:addElement( PageCount )
	self.PageCount = PageCount
	
	local Attachments = nil
	
	Attachments = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 6,
		maxVisibleRows = 1,
		controllerIndex = f41_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "WeaponAttachmentButton", {
				controllerIndex = f41_local1
			} )
		end,
		wrapX = true,
		wrapY = true,
		spacingX = _1080p * 0,
		spacingY = _1080p * 0,
		columnWidth = _1080p * 160,
		rowHeight = _1080p * 120,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	Attachments.id = "Attachments"
	Attachments:SetAlpha( 0.8, 0 )
	Attachments:setUseStencil( true )
	Attachments:SetGridDataSourceThroughElement( BaseWeapons, nil )
	Attachments:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 480, _1080p * 1440, _1080p * 810, _1080p * 930 )
	self:addElement( Attachments )
	self.Attachments = Attachments
	
	local Tabs = nil
	
	Tabs = MenuBuilder.BuildRegisteredType( "WeaponSelectTabsBar", {
		controllerIndex = f41_local1
	} )
	Tabs.id = "Tabs"
	Tabs:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1920, _1080p * 142.5, _1080p * 182.5 )
	self:addElement( Tabs )
	self.Tabs = Tabs
	
	local MenuTitle = nil
	
	MenuTitle = MenuBuilder.BuildRegisteredType( "CPMenuTitle", {
		controllerIndex = f41_local1
	} )
	MenuTitle.id = "MenuTitle"
	MenuTitle.MenuTitle:setText( ToUpperCase( Engine.Localize( "MENU_NEW" ) ), 0 )
	MenuTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
	self:addElement( MenuTitle )
	self.MenuTitle = MenuTitle
	
	local OpticLabel = nil
	
	OpticLabel = LUI.UIText.new()
	OpticLabel.id = "OpticLabel"
	OpticLabel:setText( ToUpperCase( Engine.Localize( "LUA_MENU_OPTIC" ) ), 0 )
	OpticLabel:SetFontSize( 19 * _1080p )
	OpticLabel:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	OpticLabel:SetAlignment( LUI.Alignment.Center )
	OpticLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 485, _1080p * 635, _1080p * 791, _1080p * 810 )
	self:addElement( OpticLabel )
	self.OpticLabel = OpticLabel
	
	local AttachmentLabel = nil
	
	AttachmentLabel = LUI.UIText.new()
	AttachmentLabel.id = "AttachmentLabel"
	AttachmentLabel:setText( ToUpperCase( Engine.Localize( "LUA_MENU_TITLE_ATTACHMENTS" ) ), 0 )
	AttachmentLabel:SetFontSize( 19 * _1080p )
	AttachmentLabel:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	AttachmentLabel:SetAlignment( LUI.Alignment.Center )
	AttachmentLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 645, _1080p * 795, _1080p * 791, _1080p * 810 )
	self:addElement( AttachmentLabel )
	self.AttachmentLabel = AttachmentLabel
	
	local ArrowUp = nil
	
	ArrowUp = MenuBuilder.BuildRegisteredType( "ArrowUp", {
		controllerIndex = f41_local1
	} )
	ArrowUp.id = "ArrowUp"
	ArrowUp:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 337, _1080p * 357, _1080p * 924, _1080p * 964 )
	self:addElement( ArrowUp )
	self.ArrowUp = ArrowUp
	
	local ArrowDown = nil
	
	ArrowDown = MenuBuilder.BuildRegisteredType( "ArrowDown", {
		controllerIndex = f41_local1
	} )
	ArrowDown.id = "ArrowDown"
	ArrowDown:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 172, _1080p * 192, _1080p * 923, _1080p * 963 )
	self:addElement( ArrowDown )
	self.ArrowDown = ArrowDown
	
	local ListCount = nil
	
	ListCount = LUI.UIText.new()
	ListCount.id = "ListCount"
	ListCount:setText( "1/15", 0 )
	ListCount:SetFontSize( 24 * _1080p )
	ListCount:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ListCount:SetAlignment( LUI.Alignment.Center )
	ListCount:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 192, _1080p * 337, _1080p * 931, _1080p * 955 )
	self:addElement( ListCount )
	self.ListCount = ListCount
	
	local MissionTeamInfo = nil
	
	MissionTeamInfo = MenuBuilder.BuildRegisteredType( "MissionTeamInfo", {
		controllerIndex = f41_local1
	} )
	MissionTeamInfo.id = "MissionTeamInfo"
	MissionTeamInfo:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -700, 0, _1080p * 54, _1080p * 142 )
	self:addElement( MissionTeamInfo )
	self.MissionTeamInfo = MissionTeamInfo
	
	local WeaponRotator = nil
	
	WeaponRotator = MenuBuilder.BuildRegisteredType( "WeaponRotator", {
		controllerIndex = f41_local1
	} )
	WeaponRotator.id = "WeaponRotator"
	WeaponRotator:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 389.5, 0, _1080p * 343.5, _1080p * 715.5 )
	self:addElement( WeaponRotator )
	self.WeaponRotator = WeaponRotator
	
	local SocialFeed = nil
	
	SocialFeed = MenuBuilder.BuildRegisteredType( "SocialFeed", {
		controllerIndex = f41_local1
	} )
	SocialFeed.id = "SocialFeed"
	SocialFeed:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1920, _1080p * 965, _1080p * 995 )
	self:addElement( SocialFeed )
	self.SocialFeed = SocialFeed
	
	local f41_local24 = nil
	if CONDITIONS.IsPublicMatch( self ) then
		f41_local24 = MenuBuilder.BuildRegisteredType( "CRMMain", {
			controllerIndex = f41_local1
		} )
		f41_local24.id = "CRMMain"
		f41_local24:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 137, _1080p * 447, _1080p * 745, _1080p * 1069 )
		self:addElement( f41_local24 )
		self.CRMMain = f41_local24
	end
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		BaseWeapons:RegisterAnimationSequence( "OpenedAttachmentSelection", {
			{
				function ()
					return self.BaseWeapons:SetAlpha( 0.8, 100 )
				end
			},
			{
				function ()
					return self.BaseWeapons:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -700, _1080p * -365, _1080p * 201, _1080p * 947, 100 )
				end
			}
		} )
		Weapons:RegisterAnimationSequence( "OpenedAttachmentSelection", {
			{
				function ()
					return self.Weapons:SetAlpha( 0, 100 )
				end
			}
		} )
		WeaponDetails:RegisterAnimationSequence( "OpenedAttachmentSelection", {
			{
				function ()
					return self.WeaponDetails:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.WeaponDetails:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 479, 0, _1080p * 201.5, _1080p * 651.5, 0 )
				end,
				function ()
					return self.WeaponDetails:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 135.5, 0, _1080p * 201.5, _1080p * 651.5, 100 )
				end
			}
		} )
		BaseWeaponsScrollbar:RegisterAnimationSequence( "OpenedAttachmentSelection", {
			{
				function ()
					return self.BaseWeaponsScrollbar:SetAlpha( 0, 0 )
				end
			}
		} )
		WeaponsPips:RegisterAnimationSequence( "OpenedAttachmentSelection", {
			{
				function ()
					return self.WeaponsPips:SetAlpha( 0, 0 )
				end
			}
		} )
		ArrowRight:RegisterAnimationSequence( "OpenedAttachmentSelection", {
			{
				function ()
					return self.ArrowRight:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.ArrowRight:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1509, _1080p * 1573, _1080p * 587.5, _1080p * 715.5, 0 )
				end
			}
		} )
		ArrowLeft:RegisterAnimationSequence( "OpenedAttachmentSelection", {
			{
				function ()
					return self.ArrowLeft:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.ArrowLeft:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 352, _1080p * 416, _1080p * 587.5, _1080p * 715.5, 0 )
				end
			}
		} )
		WeaponLevel:RegisterAnimationSequence( "OpenedAttachmentSelection", {
			{
				function ()
					return self.WeaponLevel:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 1490, _1080p * 1790, _1080p * -253, _1080p * -167, 0 )
				end
			}
		} )
		PageCount:RegisterAnimationSequence( "OpenedAttachmentSelection", {
			{
				function ()
					return self.PageCount:SetAlpha( 0, 0 )
				end
			}
		} )
		Attachments:RegisterAnimationSequence( "OpenedAttachmentSelection", {
			{
				function ()
					return self.Attachments:SetAlpha( 1, 100 )
				end
			},
			{
				function ()
					return self.Attachments:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130.5, _1080p * 1098.5, _1080p * 810, _1080p * 930, 100 )
				end
			}
		} )
		Tabs:RegisterAnimationSequence( "OpenedAttachmentSelection", {
			{
				function ()
					return self.Tabs:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Tabs:SetAlpha( 0, 100 )
				end
			}
		} )
		OpticLabel:RegisterAnimationSequence( "OpenedAttachmentSelection", {
			{
				function ()
					return self.OpticLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 135.5, _1080p * 285.5, _1080p * 791, _1080p * 810, 100 )
				end
			}
		} )
		AttachmentLabel:RegisterAnimationSequence( "OpenedAttachmentSelection", {
			{
				function ()
					return self.AttachmentLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 295.5, _1080p * 445.5, _1080p * 791, _1080p * 810, 100 )
				end
			}
		} )
		ArrowUp:RegisterAnimationSequence( "OpenedAttachmentSelection", {
			{
				function ()
					return self.ArrowUp:SetAlpha( 0, 0 )
				end
			}
		} )
		ArrowDown:RegisterAnimationSequence( "OpenedAttachmentSelection", {
			{
				function ()
					return self.ArrowDown:SetAlpha( 0, 0 )
				end
			}
		} )
		ListCount:RegisterAnimationSequence( "OpenedAttachmentSelection", {
			{
				function ()
					return self.ListCount:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.OpenedAttachmentSelection = function ()
			BaseWeapons:AnimateSequence( "OpenedAttachmentSelection" )
			Weapons:AnimateSequence( "OpenedAttachmentSelection" )
			WeaponDetails:AnimateSequence( "OpenedAttachmentSelection" )
			BaseWeaponsScrollbar:AnimateSequence( "OpenedAttachmentSelection" )
			WeaponsPips:AnimateSequence( "OpenedAttachmentSelection" )
			ArrowRight:AnimateSequence( "OpenedAttachmentSelection" )
			ArrowLeft:AnimateSequence( "OpenedAttachmentSelection" )
			WeaponLevel:AnimateSequence( "OpenedAttachmentSelection" )
			PageCount:AnimateSequence( "OpenedAttachmentSelection" )
			Attachments:AnimateSequence( "OpenedAttachmentSelection" )
			Tabs:AnimateSequence( "OpenedAttachmentSelection" )
			OpticLabel:AnimateSequence( "OpenedAttachmentSelection" )
			AttachmentLabel:AnimateSequence( "OpenedAttachmentSelection" )
			ArrowUp:AnimateSequence( "OpenedAttachmentSelection" )
			ArrowDown:AnimateSequence( "OpenedAttachmentSelection" )
			ListCount:AnimateSequence( "OpenedAttachmentSelection" )
		end
		
		BaseWeapons:RegisterAnimationSequence( "ClosedAttachmentSelection", {
			{
				function ()
					return self.BaseWeapons:SetAlpha( 1, 100 )
				end
			},
			{
				function ()
					return self.BaseWeapons:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 139.5, _1080p * 389.5, _1080p * 201, _1080p * 942, 100 )
				end
			}
		} )
		Weapons:RegisterAnimationSequence( "ClosedAttachmentSelection", {
			{
				function ()
					return self.Weapons:SetAlpha( 1, 100 )
				end
			}
		} )
		WeaponDetails:RegisterAnimationSequence( "ClosedAttachmentSelection", {
			{
				function ()
					return self.WeaponDetails:SetAlpha( 1, 100 )
				end
			},
			{
				function ()
					return self.WeaponDetails:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 135.5, 0, _1080p * 201.5, _1080p * 651.5, 0 )
				end,
				function ()
					return self.WeaponDetails:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 479, 0, _1080p * 201.5, _1080p * 651.5, 100 )
				end
			}
		} )
		BaseWeaponsScrollbar:RegisterAnimationSequence( "ClosedAttachmentSelection", {
			{
				function ()
					return self.BaseWeaponsScrollbar:SetAlpha( 1, 0 )
				end
			}
		} )
		WeaponsPips:RegisterAnimationSequence( "ClosedAttachmentSelection", {
			{
				function ()
					return self.WeaponsPips:SetAlpha( 1, 0 )
				end
			}
		} )
		ArrowRight:RegisterAnimationSequence( "ClosedAttachmentSelection", {
			{
				function ()
					return self.ArrowRight:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.ArrowRight:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1670, _1080p * 1734, _1080p * 587.5, _1080p * 715.5, 0 )
				end
			}
		} )
		ArrowLeft:RegisterAnimationSequence( "ClosedAttachmentSelection", {
			{
				function ()
					return self.ArrowLeft:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.ArrowLeft:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 513, _1080p * 577, _1080p * 587.5, _1080p * 715.5, 0 )
				end
			}
		} )
		WeaponLevel:RegisterAnimationSequence( "ClosedAttachmentSelection", {
			{
				function ()
					return self.WeaponLevel:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 1490, _1080p * 1790, _1080p * -253, _1080p * -167, 0 )
				end
			}
		} )
		Attachments:RegisterAnimationSequence( "ClosedAttachmentSelection", {
			{
				function ()
					return self.Attachments:SetAlpha( 0.8, 100 )
				end
			},
			{
				function ()
					return self.Attachments:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 480, _1080p * 1450, _1080p * 810, _1080p * 930, 100 )
				end
			}
		} )
		Tabs:RegisterAnimationSequence( "ClosedAttachmentSelection", {
			{
				function ()
					return self.Tabs:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Tabs:SetAlpha( 1, 100 )
				end
			}
		} )
		OpticLabel:RegisterAnimationSequence( "ClosedAttachmentSelection", {
			{
				function ()
					return self.OpticLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 485, _1080p * 635, _1080p * 791, _1080p * 810, 100 )
				end
			}
		} )
		AttachmentLabel:RegisterAnimationSequence( "ClosedAttachmentSelection", {
			{
				function ()
					return self.AttachmentLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 645, _1080p * 795, _1080p * 791, _1080p * 810, 100 )
				end
			}
		} )
		ArrowUp:RegisterAnimationSequence( "ClosedAttachmentSelection", {
			{
				function ()
					return self.ArrowUp:SetAlpha( 1, 0 )
				end
			}
		} )
		ArrowDown:RegisterAnimationSequence( "ClosedAttachmentSelection", {
			{
				function ()
					return self.ArrowDown:SetAlpha( 1, 0 )
				end
			}
		} )
		ListCount:RegisterAnimationSequence( "ClosedAttachmentSelection", {
			{
				function ()
					return self.ListCount:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.ClosedAttachmentSelection = function ()
			BaseWeapons:AnimateSequence( "ClosedAttachmentSelection" )
			Weapons:AnimateSequence( "ClosedAttachmentSelection" )
			WeaponDetails:AnimateSequence( "ClosedAttachmentSelection" )
			BaseWeaponsScrollbar:AnimateSequence( "ClosedAttachmentSelection" )
			WeaponsPips:AnimateSequence( "ClosedAttachmentSelection" )
			ArrowRight:AnimateSequence( "ClosedAttachmentSelection" )
			ArrowLeft:AnimateSequence( "ClosedAttachmentSelection" )
			WeaponLevel:AnimateSequence( "ClosedAttachmentSelection" )
			Attachments:AnimateSequence( "ClosedAttachmentSelection" )
			Tabs:AnimateSequence( "ClosedAttachmentSelection" )
			OpticLabel:AnimateSequence( "ClosedAttachmentSelection" )
			AttachmentLabel:AnimateSequence( "ClosedAttachmentSelection" )
			ArrowUp:AnimateSequence( "ClosedAttachmentSelection" )
			ArrowDown:AnimateSequence( "ClosedAttachmentSelection" )
			ListCount:AnimateSequence( "ClosedAttachmentSelection" )
		end
		
		WeaponsPips:RegisterAnimationSequence( "HideWeaponLevel", {
			{
				function ()
					return self.WeaponsPips:SetAlpha( 0, 0 )
				end
			}
		} )
		ArrowRight:RegisterAnimationSequence( "HideWeaponLevel", {
			{
				function ()
					return self.ArrowRight:SetAlpha( 0, 0 )
				end
			}
		} )
		ArrowLeft:RegisterAnimationSequence( "HideWeaponLevel", {
			{
				function ()
					return self.ArrowLeft:SetAlpha( 0, 0 )
				end
			}
		} )
		WeaponLevel:RegisterAnimationSequence( "HideWeaponLevel", {
			{
				function ()
					return self.WeaponLevel:SetAlpha( 0, 0 )
				end
			}
		} )
		PageCount:RegisterAnimationSequence( "HideWeaponLevel", {
			{
				function ()
					return self.PageCount:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.HideWeaponLevel = function ()
			WeaponsPips:AnimateSequence( "HideWeaponLevel" )
			ArrowRight:AnimateSequence( "HideWeaponLevel" )
			ArrowLeft:AnimateSequence( "HideWeaponLevel" )
			WeaponLevel:AnimateSequence( "HideWeaponLevel" )
			PageCount:AnimateSequence( "HideWeaponLevel" )
		end
		
		BaseWeaponsScrollbar:RegisterAnimationSequence( "HideAttachmentsBar", {
			{
				function ()
					return self.BaseWeaponsScrollbar:SetAlpha( 1, 0 )
				end
			}
		} )
		Attachments:RegisterAnimationSequence( "HideAttachmentsBar", {
			{
				function ()
					return self.Attachments:SetAlpha( 0, 0 )
				end
			}
		} )
		OpticLabel:RegisterAnimationSequence( "HideAttachmentsBar", {
			{
				function ()
					return self.OpticLabel:SetAlpha( 0, 0 )
				end
			}
		} )
		AttachmentLabel:RegisterAnimationSequence( "HideAttachmentsBar", {
			{
				function ()
					return self.AttachmentLabel:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.HideAttachmentsBar = function ()
			BaseWeaponsScrollbar:AnimateSequence( "HideAttachmentsBar" )
			Attachments:AnimateSequence( "HideAttachmentsBar" )
			OpticLabel:AnimateSequence( "HideAttachmentsBar" )
			AttachmentLabel:AnimateSequence( "HideAttachmentsBar" )
		end
		
		Attachments:RegisterAnimationSequence( "ShowAttachmentsBar", {
			{
				function ()
					return self.Attachments:SetAlpha( 0.8, 0 )
				end
			}
		} )
		OpticLabel:RegisterAnimationSequence( "ShowAttachmentsBar", {
			{
				function ()
					return self.OpticLabel:SetAlpha( 1, 0 )
				end
			}
		} )
		AttachmentLabel:RegisterAnimationSequence( "ShowAttachmentsBar", {
			{
				function ()
					return self.AttachmentLabel:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.ShowAttachmentsBar = function ()
			Attachments:AnimateSequence( "ShowAttachmentsBar" )
			OpticLabel:AnimateSequence( "ShowAttachmentsBar" )
			AttachmentLabel:AnimateSequence( "ShowAttachmentsBar" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	BaseWeapons:addEventHandler( "gain_focus", function ( f110_arg0, f110_arg1 )
		ACTIONS.GainFocus( self, "Weapons", f110_arg1.controller or f41_local1 )
	end )
	BaseWeapons:addEventHandler( "lose_focus", function ( f111_arg0, f111_arg1 )
		ACTIONS.LoseFocus( self, "Weapons", f111_arg1.controller or f41_local1 )
	end )
	WeaponDetails:SetDataSourceThroughElement( Weapons, nil )
	local f41_local25 = LUI.UIScrollbar.new
	local bindButton = {
		direction = LUI.DIRECTION.vertical,
		eventListener = BaseWeaponsScrollbar,
		startCap = BaseWeaponsScrollbar.startCap,
		endCap = BaseWeaponsScrollbar.endCap
	}
	local f41_local27 = BaseWeaponsScrollbar.sliderArea
	if f41_local27 then
		f41_local27 = BaseWeaponsScrollbar.sliderArea.slider
	end
	bindButton.slider = f41_local27
	f41_local27 = BaseWeaponsScrollbar.sliderArea
	if f41_local27 then
		f41_local27 = BaseWeaponsScrollbar.sliderArea.fixedSizeSlider
	end
	bindButton.fixedSizeSlider = f41_local27
	BaseWeapons:AddScrollbar( f41_local25( bindButton ) )
	BaseWeapons:AddItemNumbers( ListCount )
	Weapons:AddScrollbar( WeaponsPips )
	Weapons:AddArrow( ArrowLeft )
	Weapons:AddArrow( ArrowRight )
	self.addButtonHelperFunction = function ( f112_arg0, f112_arg1 )
		f112_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			priority = 1,
			clickable = true
		} )
		f112_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_SELECT" ),
			button_ref = "button_primary",
			side = "left",
			clickable = true
		} )
	end
	
	self:addEventHandler( "menu_create", self.addButtonHelperFunction )
	
	bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	self:addEventHandler( "open_loadout_edit_menu", function ( f113_arg0, f113_arg1 )
		local f113_local0 = f113_arg1.controller or f41_local1
		if CONDITIONS.IsPublicMatch( self ) then
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "CRMMain",
				sequenceName = "Opening",
				elementPath = "CRMMain"
			} )
		end
	end )
	self:addEventHandler( "close_loadout_edit_menu", function ( f114_arg0, f114_arg1 )
		local f114_local0 = f114_arg1.controller or f41_local1
		if CONDITIONS.IsPublicMatch( self ) then
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "CRMMain",
				sequenceName = "Opening",
				elementPath = "CRMMain"
			} )
		end
	end )
	f0_local13( self, f41_local1, controller )
	if CONDITIONS.IsSystemLink( self ) then
		ACTIONS.AnimateSequence( self, "HideWeaponLevel" )
	end
	if CONDITIONS.IsPublicMatch( self ) then
		ACTIONS.AnimateSequenceByElement( self, {
			elementName = "CRMMain",
			sequenceName = "Minimize",
			elementPath = "CRMMain"
		} )
	end
	return self
end

MenuBuilder.registerType( "CPWeaponSelect", CPWeaponSelect )
LUI.FlowManager.RegisterStackPopBehaviour( "CPWeaponSelect", f0_local3 )
LockTable( _M )
