Cac = Cac or {}
Cac.PointMax = 10
Cac.MaxStatValue = 100
Cac.BaseLootID = 0
Cac.LowestQuality = 0
Cac.HighestQuality = 4
Cac.BaseVariantID = -1
Cac.NumWeaponSetups = 2
Cac.NumPowerSetups = 2
Cac.NumAttachments = Engine.IsSingleplayer() and 3 or 6
Cac.NumLoadoutPerks = 3
Cac.NumExtraPerks = 3
Cac.NumEquipSlots = 2
Cac.NumOffhandEquipSlots = 2
Cac.LoadoutDraftPhaseChangeTimer = 11
Cac.POINT_COSTS = {
	weapons = {
		1,
		1
	},
	attachments = {
		{
			1,
			1,
			1,
			2,
			2,
			2
		},
		{
			1,
			1,
			1,
			2,
			2,
			2
		}
	},
	perks = {
		1,
		1,
		1
	},
	extraPerks = {
		2,
		2,
		2
	},
	powers = {
		1,
		1
	},
	extraPowers = {
		2,
		2
	},
	rigPerk = 0,
	overkill = 1
}
Cac.spLockStates = {
	LOCKED = "locked",
	SCANNED = "scanned",
	UNLOCKED = "unlocked"
}
Cac.spMissionStates = {
	INCOMPLETE = "incomplete",
	COMPLETE = "complete",
	LOCKED = "locked"
}
Cac.spComputerStates = {
	LOCKED = "locked",
	OPEN = "open",
	KIA = "kia",
	READ = "read"
}
Cac.spNewsReelStates = {
	LOCKED = "locked",
	OPEN = "open",
	WATCHED = "watched"
}
Cac.LoadoutEditMenus = {
	WeaponSelect = 0,
	AttachmentSelect = 1,
	PowerSelect = 2,
	PerkSelect = 3,
	JackalEquipSelect = 4,
	JackalDecalSelect = 5
}
Cac.GetPointCountForLoadout = function ( f1_arg0, f1_arg1 )
	local f1_local0 = 0
	for f1_local10, f1_local11 in ipairs( {
		f1_arg0.weaponSlotOne,
		f1_arg0.weaponSlotTwo
	} ) do
		if Cac.DoesWeaponCostPoint( f1_local11.weapon:GetValue( f1_arg1 ) ) then
			f1_local0 = f1_local0 + f1_local11.pointCost:GetCountValue( f1_arg1 )
		end
		local f1_local4 = {
			f1_local11.attachments.attachmentSlotOne,
			f1_local11.attachments.attachmentSlotTwo,
			f1_local11.attachments.attachmentSlotThree,
			f1_local11.attachments.attachmentSlotFour,
			f1_local11.attachments.attachmentSlotFive
		}
		if f1_local10 == 1 then
			table.insert( f1_local4, f1_local11.attachments.attachmentSlotSix )
		end
		for f1_local8, f1_local9 in ipairs( f1_local4 ) do
			if f1_local9.used:GetValue( f1_arg1 ) then
				f1_local0 = f1_local0 + f1_local9.pointCost:GetCountValue( f1_arg1 )
			end
		end
	end
	for f1_local11, f1_local4 in ipairs( {
		f1_arg0.perkSlotOne.perk,
		f1_arg0.perkSlotTwo.perk,
		f1_arg0.perkSlotThree.perk
	} ) do
		if f1_local4.used:GetValue( f1_arg1 ) then
			f1_local0 = f1_local0 + f1_local4.pointCost:GetCountValue( f1_arg1 )
		end
	end
	for f1_local4, f1_local5 in ipairs( {
		f1_arg0.perkSlotOne.extraPerk,
		f1_arg0.perkSlotTwo.extraPerk,
		f1_arg0.perkSlotThree.extraPerk
	} ) do
		if f1_local5.used:GetValue( f1_arg1 ) then
			f1_local0 = f1_local0 + f1_local5.pointCost:GetCountValue( f1_arg1 )
		end
	end
	for f1_local5, f1_local6 in ipairs( {
		f1_arg0.powerSlotOne,
		f1_arg0.powerSlotTwo
	} ) do
		if f1_local6.used:GetValue( f1_arg1 ) then
			f1_local0 = f1_local0 + f1_local6.pointCost:GetCountValue( f1_arg1 )
			if f1_local6.extraUsed:GetValue( f1_arg1 ) then
				f1_local0 = f1_local0 + f1_local6.extraPointCost:GetCountValue( f1_arg1 )
			end
		end
	end
	f1_local10 = f1_arg0.overkill
	if f1_local10.used:GetValue( f1_arg1 ) then
		f1_local0 = f1_local0 + f1_local10.pointCost:GetCountValue( f1_arg1 )
	end
	return f1_local0
end

local f0_local0 = function ( f2_arg0, f2_arg1, f2_arg2 )
	if Engine.IsMultiplayer() then
		f2_arg1.inUse:SetValue( f2_arg2, f2_arg0.inUse:GetValue( f2_arg2 ) )
		f2_arg1.overkill:SetValue( f2_arg2, f2_arg0.overkill:GetValue( f2_arg2 ) )
		for f2_local0 = 0, Cac.NumPowerSetups - 1, 1 do
			local f2_local3 = f2_arg0.powerSetups[f2_local0]
			local f2_local4 = f2_arg1.powerSetups[f2_local0]
			f2_local4.power:SetValue( f2_arg2, f2_local3.power:GetValue( f2_arg2 ) )
			f2_local4.lootItemID:SetValue( f2_arg2, f2_local3.lootItemID:GetValue( f2_arg2 ) )
			f2_local4.extraCharge:SetValue( f2_arg2, f2_local3.extraCharge:GetValue( f2_arg2 ) )
		end
		for f2_local0 = 0, Cac.NumLoadoutPerks - 1, 1 do
			f2_arg1.loadoutPerks[f2_local0]:SetValue( f2_arg2, f2_arg0.loadoutPerks[f2_local0]:GetValue( f2_arg2 ) )
		end
		for f2_local0 = 0, Cac.NumExtraPerks - 1, 1 do
			f2_arg1.extraPerks[f2_local0]:SetValue( f2_arg2, f2_arg0.extraPerks[f2_local0]:GetValue( f2_arg2 ) )
		end
	else
		for f2_local0 = 0, Cac.NumEquipSlots - 1, 1 do
			f2_arg1.equipment[f2_local0]:SetValue( f2_arg2, f2_arg0.equipment[f2_local0]:GetValue( f2_arg2 ) )
		end
		for f2_local0 = 0, Cac.NumOffhandEquipSlots - 1, 1 do
			f2_arg1.offhandEquipment[f2_local0]:SetValue( f2_arg2, f2_arg0.offhandEquipment[f2_local0]:GetValue( f2_arg2 ) )
		end
		f2_arg1.jackalSetup.jackalPrimary:SetValue( f2_arg2, f2_arg0.jackalSetup.jackalPrimary:GetValue( f2_arg2 ) )
		f2_arg1.jackalSetup.jackalSecondary:SetValue( f2_arg2, f2_arg0.jackalSetup.jackalSecondary:GetValue( f2_arg2 ) )
		f2_arg1.jackalSetup.jackalUpgrade:SetValue( f2_arg2, f2_arg0.jackalSetup.jackalUpgrade:GetValue( f2_arg2 ) )
		f2_arg1.jackalSetup.jackalDecal:SetValue( f2_arg2, f2_arg0.jackalSetup.jackalDecal:GetValue( f2_arg2 ) )
	end
	local f2_local0 = f2_arg0.name:GetValue( f2_arg2 )
	if f2_local0 ~= nil then
		f2_arg1.name:SetValue( f2_arg2, f2_local0 )
	end
	for f2_local1 = 0, Cac.NumWeaponSetups - 1, 1 do
		local f2_local4 = f2_arg0.weaponSetups[f2_local1]
		local f2_local6 = f2_arg1.weaponSetups[f2_local1]
		f2_local6.camo:SetValue( f2_arg2, f2_local4.camo:GetValue( f2_arg2 ) )
		f2_local6.reticle:SetValue( f2_arg2, f2_local4.reticle:GetValue( f2_arg2 ) )
		f2_local6.weapon:SetValue( f2_arg2, f2_local4.weapon:GetValue( f2_arg2 ) )
		if Engine.IsMultiplayer() then
			f2_local6.lootItemID:SetValue( f2_arg2, f2_local4.lootItemID:GetValue( f2_arg2 ) )
			f2_local6.variantID:SetValue( f2_arg2, f2_local4.variantID:GetValue( f2_arg2 ) )
			f2_local6.cosmeticAttachment:SetValue( f2_arg2, f2_local4.cosmeticAttachment:GetValue( f2_arg2 ) )
		end
		for f2_local7 = 0, Cac.NumAttachments - 1, 1 do
			f2_local6.attachment[f2_local7]:SetValue( f2_arg2, f2_local4.attachment[f2_local7]:GetValue( f2_arg2 ) )
		end
	end
end

local f0_local1 = function ( f3_arg0, f3_arg1 )
	if Engine.IsMultiplayer() then
		f3_arg0.overkill:SetValue( f3_arg1, 0 )
		for f3_local0 = 0, Cac.NumPowerSetups - 1, 1 do
			local f3_local3 = f3_arg0.powerSetups[f3_local0]
			f3_local3.power:SetValue( f3_arg1, Cac.powerNoneValue )
			f3_local3.lootItemID:SetValue( f3_arg1, Cac.BaseLootID )
			f3_local3.extraCharge:SetValue( f3_arg1, 0 )
		end
		for f3_local0 = 0, Cac.NumLoadoutPerks - 1, 1 do
			f3_arg0.loadoutPerks[f3_local0]:SetValue( f3_arg1, Cac.perkNoneValue )
		end
		for f3_local0 = 0, Cac.NumExtraPerks - 1, 1 do
			f3_arg0.extraPerks[f3_local0]:SetValue( f3_arg1, Cac.perkNoneValue )
		end
	else
		for f3_local0 = 0, Cac.NumEquipSlots - 1, 1 do
			f3_arg0.equipment[f3_local0]:SetValue( f3_arg1, Cac.powerNoneValue )
		end
		for f3_local0 = 0, Cac.NumOffhandEquipSlots - 1, 1 do
			f3_arg0.offhandEquipment[f3_local0]:SetValue( f3_arg1, Cac.powerNoneValue )
		end
		f3_arg0.jackalSetup.jackalPrimary:SetValue( f3_arg1, "primary_default" )
		f3_arg0.jackalSetup.jackalSecondary:SetValue( f3_arg1, "secondary_default" )
		f3_arg0.jackalSetup.jackalUpgrade:SetValue( f3_arg1, "hull" )
		f3_arg0.jackalSetup.jackalDecal:SetValue( f3_arg1, "veh_mil_air_un_jackal_livery_shell_01" )
	end
	for f3_local0 = 0, Cac.NumWeaponSetups - 1, 1 do
		local f3_local3 = f3_arg0.weaponSetups[f3_local0]
		f3_local3.camo:SetValue( f3_arg1, Cac.CamoNoneValue )
		f3_local3.reticle:SetValue( f3_arg1, Cac.ReticleNoneValue )
		for f3_local4 = 0, Cac.NumAttachments - 1, 1 do
			f3_local3.attachment[f3_local4]:SetValue( f3_arg1, Cac.attachmentNoneValue )
		end
		if Engine.IsMultiplayer() then
			f3_local3.cosmeticAttachment:SetValue( f3_arg1, Cac.CosmeticAttachmentNoneValue )
			f3_local3.lootItemID:SetValue( f3_arg1, Cac.BaseLootID )
			f3_local3.variantID:SetValue( f3_arg1, Cac.BaseVariantID )
		end
		f3_local3.weapon:SetValue( f3_arg1, Engine.IsMultiplayer() and "iw7_fists" or "none" )
	end
end

local f0_local2 = function ( f4_arg0, f4_arg1 )
	OSK.OpenScreenKeyboard( f4_arg0, Engine.Localize( "LUA_MENU_NAME_LOADOUT" ), f4_arg1.name:GetValue( f4_arg0 ), 20, true, true, false, function ( f5_arg0, f5_arg1, f5_arg2 )
		if f5_arg1 ~= nil and f5_arg1 ~= "" then
			f4_arg1.name:SetValue( f5_arg0, f5_arg1 )
			ACTIONS.UploadStats( nil, f5_arg0 )
			LUI.FlowManager.RequestLeaveMenuByName( "LoadoutOptionsPopup" )
		end
		if Engine.IsSingleplayer() then
			Engine.Unpause()
		end
	end, CoD.KeyboardInputTypes.Normal )
end

MenuBuilder.registerType( "CopyLoadoutPopup", function ( f6_arg0, f6_arg1 )
	local f6_local0 = f6_arg1.controllerIndex
	local f6_local1 = f6_arg1.loadoutListDataSource
	local f6_local2 = f6_arg1.loadoutGridDataSource
	local f6_local3 = f6_arg1.currentLoadoutIndex
	local f6_local4 = f6_local1.loadouts:GetDataSourceAtIndex( f6_local3, f6_local0 )
	local f6_local5 = f6_local4.name:GetValue( f6_local0 )
	local f6_local6 = {
		title = Engine.Localize( "LUA_MENU_COPY_LOADOUT" ),
		width = _1080p * 500,
		defaultFocusIndex = 1,
		cancelClosesPopup = true,
		listContent = {}
	}
	local self = LUI.UIText.new()
	self.id = "message"
	self:SetAnchors( 0, 0, 1, 0, 0 )
	self:SetLeft( 0, 0 )
	self:SetRight( 0, 0 )
	self:SetTop( 0, 0 )
	self:SetBottom( 21, 0 )
	self:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	self:SetAlignment( LUI.Alignment.Center )
	self:setText( Engine.Localize( "LUA_MENU_COPY_LOADOUT_SUBHEADER", Engine.MarkLocalized( f6_local5 ) ) )
	table.insert( f6_local6.listContent, self )
	local f6_local8 = nil
	f6_local8 = LUI.UIGrid.new( nil, {
		numRows = f6_local1.loadouts:GetCountValue( f6_local0 ),
		numColumns = 1,
		maxVisibleRows = 10,
		maxVisibleColumns = 1,
		controllerIndex = f6_local0,
		buildChild = function ()
			local f7_local0 = MenuBuilder.BuildRegisteredType( Engine.IsAliensMode() and "PopupButtonZm" or "PopupButtonLoadout", {
				controllerIndex = f6_local0
			} )
			f7_local0:SetLeftAnchor( 0 )
			f7_local0:SetRightAnchor( 0 )
			f7_local0:SetLeft( 0 )
			f7_local0:SetRight( 0 )
			return f7_local0
		end,
		refreshChild = function ( f8_arg0, f8_arg1, f8_arg2 )
			local f8_local0 = f6_local1.loadouts:GetDataSourceAtIndex( f8_arg2, f6_local0 )
			local f8_local1 = f8_local0.name:GetValue( f6_local0 )
			local f8_local2 = false
			if Engine.IsMultiplayer() then
				local f8_local3 = f6_local2:GetDataSourceAtIndex( f8_arg2, f6_local0 )
				f8_local2 = f8_local3.isLoadoutLocked:GetValue( f6_local0 )
			end
			f8_arg0:SetText( f8_local1 )
			local f8_local4 = f8_arg0
			local f8_local3 = f8_arg0.SetButtonDisabled
			local f8_local5
			if (not Engine.IsSingleplayer() or f8_arg2 ~= 0) and f8_arg2 ~= f6_local3 then
				f8_local5 = f8_local2
			else
				f8_local5 = true
			end
			f8_local3( f8_local4, f8_local5 )
			f8_arg0:addEventHandler( "button_action", function ( f9_arg0, f9_arg1 )
				assert( f9_arg1.controller )
				f0_local0( f6_local4, f8_local0, f9_arg1.controller )
				ACTIONS.UploadStats( nil, f6_local0 )
				ACTIONS.LeaveMenu( f9_arg0 )
				LUI.FlowManager.RequestLeaveMenuByName( "LoadoutOptionsPopup" )
			end )
		end,
		wrapX = true,
		wrapY = false,
		spacingX = _1080p * 2,
		spacingY = _1080p * 2,
		columnWidth = _1080p * 500,
		rowHeight = _1080p * 40,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	} )
	f6_local8.id = "Loadouts"
	f6_local8:SetAnchors( 0, 0, 0, 1, 0 )
	f6_local8:SetLeft( 0, 0 )
	f6_local8:SetRight( 0, 0 )
	f6_local8:SetTop( 0, 0 )
	f6_local8:SetBottom( _1080p * 420, 0 )
	f6_local8:setUseStencil( true )
	table.insert( f6_local6.listContent, f6_local8 )
	local f6_local9 = MenuBuilder.BuildRegisteredType( "PopupList", f6_local6 )
	f6_local9.id = "CopyLoadoutPopup"
	return f6_local9
end )
local f0_local3 = function ( f10_arg0, f10_arg1, f10_arg2, f10_arg3 )
	f10_arg1.isProperty = false
	f10_arg1.__serializable = false
	LUI.FlowManager.RequestPopupMenu( menu, "CopyLoadoutPopup", true, f10_arg0, false, {
		currentLoadoutIndex = f10_arg2,
		loadoutListDataSource = f10_arg1,
		loadoutGridDataSource = f10_arg3
	}, nil, true )
end

MenuBuilder.registerType( "LoadoutOptionsPopup", function ( f11_arg0, f11_arg1 )
	local f11_local0 = f11_arg1.controllerIndex
	local f11_local1 = f11_arg1.loadoutListDataSource
	local f11_local2 = f11_arg1.loadoutGridDataSource
	local f11_local3 = f11_arg1.currentLoadoutIndex
	local f11_local4 = f11_local1.loadouts:GetDataSourceAtIndex( f11_local3, f11_local0 )
	local f11_local5 = MenuBuilder.BuildRegisteredType( "PopupMessageAndButtons", {
		title = f11_local4.name:GetValue( f11_local0 ),
		width = 400,
		message = "",
		defaultFocusIndex = 1,
		cancelClosesPopup = true,
		buttonsClosePopup = false,
		buttons = {
			{
				label = Engine.Localize( "MENU_RENAME" ),
				action = function ( f12_arg0, f12_arg1 )
					f0_local2( f12_arg1, f11_local4 )
					if Engine.IsSingleplayer() then
						ACTIONS.LeaveMenu( f12_arg0 )
					end
				end,
				disabled = Engine.IsSingleplayer() and f11_local3 == 0
			},
			{
				label = Engine.Localize( "LUA_MENU_COPY" ),
				action = function ( f13_arg0, f13_arg1 )
					f0_local3( f13_arg1, f11_local1, f11_local3, f11_local2 )
				end
			},
			{
				label = Engine.Localize( "LUA_MENU_CLEAR_LOADOUT" ),
				action = function ( f14_arg0, f14_arg1 )
					f0_local1( f11_local4, f14_arg1 )
					ACTIONS.UploadStats( nil, f14_arg1 )
					ACTIONS.LeaveMenu( f14_arg0 )
				end,
				disabled = Engine.IsSingleplayer() and f11_local3 == 0
			}
		}
	} )
	f11_local5.id = "LoadoutOptionsPopup"
	f11_local5:SetDataSource( f11_local4, f11_local0 )
	return f11_local5
end )
Cac.ClearWeaponAndAttachments = function ( f15_arg0, f15_arg1 )
	Cac.ClearWeapon( f15_arg0, f15_arg1 )
	Cac.ClearAllAttachments( f15_arg0, f15_arg1 )
end

Cac.ClearWeaponCosmetics = function ( f16_arg0, f16_arg1 )
	f16_arg0.camo:SetValue( f16_arg1, Cac.CamoNoneValue )
	f16_arg0.reticle:SetValue( f16_arg1, Cac.ReticleNoneValue )
	f16_arg0.cosmeticAttachment:SetValue( f16_arg1, Cac.CosmeticAttachmentNoneValue )
end

Cac.ArePointsFull = function ( f17_arg0 )
	return Cac.PointMax <= f17_arg0
end

Cac.CanAffordItem = function ( f18_arg0, f18_arg1, f18_arg2 )
	return f18_arg1:GetCountValue( f18_arg2 ) <= Cac.PointMax - f18_arg0.pointCount:GetValue( f18_arg2 )
end

Cac.PointsNeededForItem = function ( f19_arg0, f19_arg1, f19_arg2 )
	return f19_arg1:GetCountValue( f19_arg2 ) - Cac.PointMax - f19_arg0.pointCount:GetValue( f19_arg2 )
end

Cac.AnimateFramedLoadoutItem = function ( f20_arg0, f20_arg1, f20_arg2 )
	local f20_local0 = f20_arg0:GetDataSource()
	f20_local0 = f20_local0.used:GetValue( f20_arg2 )
	local f20_local1 = nil
	if f20_arg1 then
		if f20_local0 then
			f20_local1 = "ButtonOverInUse"
		else
			f20_local1 = "ButtonOverNotInUse"
		end
	elseif f20_local0 then
		f20_local1 = "ButtonUpInUse"
	else
		f20_local1 = "ButtonUpNotInUse"
	end
	if f20_local1 and f20_arg0._currentSequence ~= f20_local1 then
		ACTIONS.AnimateSequence( f20_arg0, f20_local1 )
		f20_arg0._currentSequence = f20_local1
	end
end

Cac.HandleFramedLoadoutItemAnimation = function ( f21_arg0, f21_arg1 )
	f21_arg0:addEventHandler( "button_over", function ( f22_arg0, f22_arg1 )
		Cac.AnimateFramedLoadoutItem( f22_arg0, true, f21_arg1 )
		ACTIONS.AnimateSequence( f22_arg0, "Pulse" )
	end )
	f21_arg0:addEventHandler( "button_up", function ( f23_arg0, f23_arg1 )
		Cac.AnimateFramedLoadoutItem( f23_arg0, false, f21_arg1 )
		ACTIONS.AnimateSequence( f23_arg0, "PulseStop" )
	end )
	f21_arg0:SubscribeToModelThroughElement( f21_arg0, "used", function ()
		Cac.AnimateFramedLoadoutItem( f21_arg0, f21_arg0:isInFocus(), f21_arg1 )
	end )
end

Cac.AttachWeaponStatsPanel = function ( f25_arg0, f25_arg1 )
	local WeaponStatsPanel = MenuBuilder.BuildRegisteredType( "WeaponStatsPanel", {
		controllerIndex = f25_arg1
	} )
	WeaponStatsPanel.id = "WeaponStatsPanel"
	if Engine.IsMultiplayer() then
		WeaponStatsPanel:SetAnchors( 0, 1, 1, 0, 0 )
		WeaponStatsPanel:SetLeft( _1080p * 10, 0 )
		WeaponStatsPanel:SetRight( _1080p * 405, 0 )
		WeaponStatsPanel:SetTop( _1080p * -98.5, 0 )
		WeaponStatsPanel:SetBottom( _1080p * -12.5, 0 )
	else
		WeaponStatsPanel:SetAnchors( 0.5, 0.5, 1, 0, 0 )
		WeaponStatsPanel:SetLeft( _1080p * -310, 0 )
		WeaponStatsPanel:SetRight( _1080p * 310, 0 )
		WeaponStatsPanel:SetTop( _1080p * -118, 0 )
		WeaponStatsPanel:SetBottom( _1080p * -6, 0 )
	end
	f25_arg0:addElement( WeaponStatsPanel )
	f25_arg0.WeaponStatsPanel = WeaponStatsPanel
	
end

Cac.UpdateWeaponStatsPanel = function ( f26_arg0, f26_arg1, f26_arg2 )
	local f26_local0 = {
		weaponRef = f26_arg0.weapon,
		attachmentOneRef = f26_arg0.attachments.attachmentSlotOne,
		attachmentTwoRef = f26_arg0.attachments.attachmentSlotTwo,
		attachmentThreeRef = f26_arg0.attachments.attachmentSlotThree
	}
	if Engine.IsMultiplayer() then
		f26_local0.attachmentFourRef = f26_arg0.attachments.attachmentSlotFour
		f26_local0.attachmentFiveRef = f26_arg0.attachments.attachmentSlotFive
		f26_local0.attachmentSixRef = f26_arg0.attachments.attachmentSlotSix
		f26_local0.weaponLootID = f26_arg0.lootItemID
	end
	f26_arg1:SetDataSource( f26_local0, f26_arg2 )
end

Cac.GetPick10UnlockRank = function ( f27_arg0 )
	return Engine.TableLookup( CSV.pick10UnlockTable.file, CSV.pick10UnlockTable.cols.ref, f27_arg0, CSV.pick10UnlockTable.cols.unlockRank )
end

Cac.GetPick10ItemName = function ( f28_arg0 )
	return Engine.Localize( Engine.TableLookup( CSV.pick10Slots.file, CSV.pick10Slots.cols.ref, f28_arg0, CSV.pick10Slots.cols.locRef ) )
end

Cac.GetPick10ItemImage = function ( f29_arg0 )
	return Engine.TableLookup( CSV.pick10Slots.file, CSV.pick10Slots.cols.ref, f29_arg0, CSV.pick10Slots.cols.image )
end

Cac.GetPick10ItemDesc = function ( f30_arg0 )
	return Engine.Localize( Engine.TableLookup( CSV.pick10Slots.file, CSV.pick10Slots.cols.ref, f30_arg0, CSV.pick10Slots.cols.desc ) )
end

Cac.GetPick10ItemCardData = function ( f31_arg0 )
	local f31_local0 = Cac.GetPick10UnlockRank( f31_arg0 )
	return {
		name = Cac.GetPick10ItemName( f31_arg0 ),
		image = Cac.GetPick10ItemImage( f31_arg0 ),
		desc = Cac.GetPick10ItemDesc( f31_arg0 ),
		title = Engine.Localize( "LUA_MENU_MP_ITEM_CARD_TITLE_PICK_10" ),
		rank = Rank.GetRankDisplay( f31_local0 ),
		rankIcon = Rank.GetRankIcon( f31_local0, 0 ),
		rankName = Rank.GetShortRank( f31_local0 )
	}
end

Cac.IncrementAnalyticsCACChanges = function ()
	Cac.changesInLoadout = Cac.changesInLoadout and Cac.changesInLoadout + 1 or 0
end

Cac.IncrementAnalyticsRigsViewed = function ( f33_arg0, f33_arg1 )
	Cac.numRigsViewed = Cac.numRigsViewed and Cac.numRigsViewed + 1 or 0
end

Cac.PositionUnlockCriteria = function ( f34_arg0, f34_arg1, f34_arg2 )
	local f34_local0 = f34_arg1:GetCurrentFont()
	local f34_local1, f34_local2, f34_local3, f34_local4 = f34_arg1:getLocalRect()
	local f34_local5, f34_local6, f34_local7, f34_local8 = GetTextDimensions( f34_arg0, f34_local0, math.abs( f34_local4 - f34_local2 ), 1300 * _1080p )
	local f34_local9 = math.max( 105, f34_local6 - f34_local8 + 120 * _1080p )
	local f34_local10 = 32 * _1080p
	f34_arg2:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, f34_local9, f34_local9 + f34_local10, 0 )
	return f34_local9, f34_local9 + f34_local10
end

Cac.UpdateNewItemNotification = function ( f35_arg0, f35_arg1, f35_arg2, f35_arg3, f35_arg4 )
	if Rewards.IsNew( f35_arg0, f35_arg3, Engine.TableLookupGetRowNum( f35_arg2.file, f35_arg2.cols.ref, f35_arg1 ) ) then
		f35_arg4:SetAlpha( 1, 0 )
	else
		f35_arg4:SetAlpha( 0, 0 )
	end
end

Cac.ClearNewItemNotification = function ( f36_arg0, f36_arg1, f36_arg2, f36_arg3, f36_arg4 )
	local f36_local0 = Engine.TableLookupGetRowNum( f36_arg2.file, f36_arg2.cols.ref, f36_arg1 )
	if Rewards.IsNew( f36_arg0, f36_arg3, f36_local0 ) then
		Rewards.ClearNew( f36_arg0, f36_arg3, f36_local0 )
		f36_arg4:SetAlpha( 0, 0 )
	end
end

Cac.IsUnlockedEsports = function ( f37_arg0 )
	local f37_local0
	if CONDITIONS.UseLoadoutRestrictions() then
		f37_local0 = f37_arg0
	else
		f37_local0 = true
	end
	return f37_local0
end

Cac.CleanLoadoutForCompetitivePlaylist = function ( f38_arg0, f38_arg1 )
	if f38_arg0 then
		local f38_local0 = Engine.GetLocalClientXUIDString( f38_arg1 )
		local f38_local1 = DataSources.alwaysLoaded.playerData.MP.rankedloadouts.squadMembers
		f38_local1.isProperty = false
		f38_local1.__serializable = false
		Cac.ClearBannedAndDraftedItems( GetCACPlayerDataDataSource( f38_local1 ), f38_arg1, f38_local0, true )
		Engine.ExecNow( "set wasLastPlaylistCompetitive 1" )
	else
		Engine.ExecNow( "set wasLastPlaylistCompetitive 0" )
	end
end

Cac.ClearBannedAndDraftedLoadoutItems = function ( f39_arg0, f39_arg1, f39_arg2, f39_arg3 )
	local f39_local0 = LOADOUT.IsSlotUnlocked( f39_arg1, LOADOUT.SlotTypes.OVERKILL, nill, nil, true )
	for f39_local12, f39_local13 in ipairs( {
		f39_arg0.weaponSlotOne,
		f39_arg0.weaponSlotTwo
	} ) do
		local f39_local14 = f39_local13.weapon:GetValue( f39_arg1 )
		local f39_local15 = f39_local13.lootItemID:GetValue( f39_arg1 )
		local f39_local16 = Engine.IsUnlocked( f39_arg1, "pro_weapon", f39_local14, true )
		local f39_local17 = Cac.GetWeaponIndex( f39_local14 )
		local f39_local18 = f39_arg0.overkill.used:GetValue( f39_arg1 )
		if f39_local18 or f39_local12 ~= Cac.SecondaryWeaponSlot + 1 then
			local f39_local4 = false
		else
			local f39_local4 = true
		end
		local f39_local5
		if f39_local0 or f39_local12 ~= 2 then
			f39_local5 = false
		else
			f39_local5 = true
		end
		if not (f39_local16 and (not f39_local5 or not f39_local18)) or f39_local15 ~= Cac.BaseLootID then
			Cac.ClearWeaponAndAttachments( f39_local13, f39_arg1 )
			Cac.ClearWeaponCosmetics( f39_local13, f39_arg1 )
			if f39_local5 then
				f39_arg0.overkill.usedInt:SetValue( f39_arg1, 0 )
			end
			if f39_arg3 then
				f39_local13.weapon:SetValue( f39_arg1, Engine.TableLookup( CSV.proDefaults.file, CSV.proDefaults.cols.itemType, "weapon" .. f39_local12, CSV.proDefaults.cols.itemRef ) )
				f39_local13.lootItemID:SetValue( f39_arg1, Cac.BaseLootID )
				f39_local13.variantID:SetValue( f39_arg1, Cac.BaseVariantID )
			end
		end
		local f39_local6 = {}
		if f39_local12 == 1 then
			f39_local6 = {
				f39_local13.attachments.attachmentSlotSix,
				f39_local13.attachments.attachmentSlotFive,
				f39_local13.attachments.attachmentSlotFour,
				f39_local13.attachments.attachmentSlotThree,
				f39_local13.attachments.attachmentSlotTwo,
				f39_local13.attachments.attachmentSlotOne
			}
		else
			f39_local6 = {
				f39_local13.attachments.attachmentSlotFive,
				f39_local13.attachments.attachmentSlotFour,
				f39_local13.attachments.attachmentSlotThree,
				f39_local13.attachments.attachmentSlotTwo,
				f39_local13.attachments.attachmentSlotOne
			}
		end
		for f39_local10, f39_local11 in ipairs( f39_local6 ) do
			if not Cac.IsAttachmentEsportsUnlocked( f39_local11:GetValue( f39_arg1 ), f39_local14, f39_arg1 ) or not LOADOUT.IsSlotUnlocked( f39_arg1, LOADOUT.SlotTypes.ATTACHMENT, Mirror( f39_local10, 1, 6 ), f39_local12 - 1, true ) then
				Cac.ClearAttachment( f39_arg1, f39_local13, f39_local11 )
			end
		end
	end
	f39_local1 = {
		f39_arg0.perkSlotOne.extraPerk,
		f39_arg0.perkSlotTwo.extraPerk,
		f39_arg0.perkSlotThree.extraPerk
	}
	for f39_local13, f39_local14 in ipairs( f39_local1 ) do
		if not Engine.IsUnlocked( f39_arg1, "pro_perk", f39_local14:GetValue( f39_arg1 ), true ) or not LOADOUT.IsSlotUnlocked( f39_arg1, LOADOUT.SlotTypes.PERK, f39_local13, nil, true ) then
			Cac.ClearPerk( f39_arg1, f39_local14 )
		end
	end
	for f39_local14, f39_local15 in ipairs( {
		f39_arg0.perkSlotOne.perk,
		f39_arg0.perkSlotTwo.perk,
		f39_arg0.perkSlotThree.perk
	} ) do
		if not Engine.IsUnlocked( f39_arg1, "pro_perk", f39_local15:GetValue( f39_arg1 ), true ) then
			local f39_local16 = f39_local1[f39_local14]
			local f39_local17 = f39_local16:GetValue( f39_arg1 )
			if CONDITIONS.IsDraftEnabled() then
				f39_local15:SetValue( f39_arg1, f39_local17 )
			elseif f39_arg3 then
				if f39_local17 == Cac.perkNoneValue then
					f39_local15:SetValue( f39_arg1, Engine.TableLookup( CSV.proDefaults.file, CSV.proDefaults.cols.itemType, "perk" .. f39_local14, CSV.proDefaults.cols.itemRef ) )
				else
					f39_local15:SetValue( f39_arg1, f39_local17 )
				end
			end
			Cac.ClearPerk( f39_arg1, f39_local16 )
		end
	end
	for f39_local15, f39_local16 in ipairs( {
		f39_arg0.powerSlotOne,
		f39_arg0.powerSlotTwo
	} ) do
		local f39_local17 = LOADOUT.IsSlotUnlocked( f39_arg1, LOADOUT.SlotTypes.POWER, f39_local15 - 1, nil, true )
		if not Engine.IsUnlocked( f39_arg1, "pro_power", f39_local16.ref:GetValue( f39_arg1 ), true ) then
			if CONDITIONS.IsDraftEnabled() then
				Cac.ClearPower( f39_local16, f39_arg1 )
			elseif f39_arg3 then
				f39_local16.lootItemID:SetValue( f39_arg1, Cac.BaseLootID )
				f39_local16.power:SetValue( f39_arg1, Engine.TableLookup( CSV.proDefaults.file, CSV.proDefaults.cols.itemType, "power" .. f39_local15, CSV.proDefaults.cols.itemRef ) )
			end
			Cac.ClearExtraPower( f39_local16, f39_arg1 )
		end
		if not f39_local17 then
			Cac.ClearExtraPower( f39_local16, f39_arg1 )
		end
	end
end

Cac.ClearBannedAndDraftedItems = function ( f40_arg0, f40_arg1, f40_arg2, f40_arg3 )
	for f40_local0 = 0, f40_arg0.loadouts:GetCountValue( f40_arg1 ) - 1, 1 do
		Cac.ClearBannedAndDraftedLoadoutItems( f40_arg0.loadouts:GetDataSourceAtIndex( f40_local0, f40_arg1 ), f40_arg1, f40_arg2, f40_arg3 )
	end
	local f40_local0 = f40_arg0.streaks
	for f40_local1 = f40_local0:GetCountValue( f40_arg1 ) - 1, 0, -1 do
		local f40_local4 = f40_local0:GetDataSourceAtIndex( f40_local1, f40_arg1 )
		if (f40_local4.lootItemID:GetValue( f40_arg1 ) ~= Cac.BaseLootID) or not Engine.IsUnlocked( f40_arg1, "pro_killstreak", f40_local4.killstreak:GetValue( f40_arg1 ), true ) then
			Cac.ClearStreakSlot( f40_arg0.statsGroup, f40_arg1, f40_local1, f40_arg0, true )
		end
	end
	local f40_local1 = f40_arg0.rig
	if not Engine.IsUnlocked( f40_arg1, "pro_rig", f40_local1.rigRef:GetValue( f40_arg1 ), true ) then
		if CONDITIONS.IsDraftEnabled() then
			f40_local1.rigRef:SetValue( f40_arg1, Cac.rigNoneValue )
			f40_local1.archetypePerk.ref:SetValue( f40_arg1, Cac.traitNoneValue )
			f40_local1.archetypeSuper.ref:SetValue( f40_arg1, Cac.superNoneValue )
			f40_arg0.statsGroup.head:SetValue( f40_arg1, Cac.esportsDefaultHeads[Cac.rigNoneValue] )
			f40_arg0.statsGroup.body:SetValue( f40_arg1, Cac.esportsDefaultBodies[Cac.rigNoneValue] )
		elseif f40_arg3 then
			local f40_local2 = Engine.TableLookup( CSV.proDefaults.file, CSV.proDefaults.cols.itemType, "rig", CSV.proDefaults.cols.itemRef )
			f40_local1.rigRef:SetValue( f40_arg1, f40_local2 )
			f40_local1.archetypeSuper.ref:SetValue( f40_arg1, Engine.TableLookupMultipleKeys( CSV.proDefaults.file, {
				{
					col = CSV.proDefaults.cols.itemType,
					key = "super"
				},
				{
					col = CSV.proDefaults.cols.rigRef,
					key = f40_local2
				}
			}, CSV.proDefaults.cols.itemRef ) )
			f40_local1.archetypePerk.ref:SetValue( f40_arg1, Engine.TableLookupMultipleKeys( CSV.proDefaults.file, {
				{
					col = CSV.proDefaults.cols.itemType,
					key = "trait"
				},
				{
					col = CSV.proDefaults.cols.rigRef,
					key = f40_local2
				}
			}, CSV.proDefaults.cols.itemRef ) )
			f40_arg0.statsGroup.head:SetValue( f40_arg1, Cac.esportsDefaultHeads[f40_local2] )
			f40_arg0.statsGroup.body:SetValue( f40_arg1, Cac.esportsDefaultBodies[f40_local2] )
		end
	end
	if not Engine.IsUnlocked( f40_arg1, "pro_super", f40_local1.archetypeSuper.ref:GetValue( f40_arg1 ), true ) then
		if CONDITIONS.IsDraftEnabled() then
			f40_local1.archetypeSuper.ref:SetValue( f40_arg1, Cac.superNoneValue )
		elseif f40_arg3 then
			f40_local1.archetypeSuper.ref:SetValue( f40_arg1, Engine.TableLookupMultipleKeys( CSV.proDefaults.file, {
				{
					col = CSV.proDefaults.cols.itemType,
					key = "super"
				},
				{
					col = CSV.proDefaults.cols.rigRef,
					key = f40_local1.rigRef:GetValue( f40_arg1 )
				}
			}, CSV.proDefaults.cols.itemRef ) )
		end
	end
	if not Engine.IsUnlocked( f40_arg1, "pro_trait", f40_local1.archetypePerk.ref:GetValue( f40_arg1 ), true ) then
		if CONDITIONS.IsDraftEnabled() then
			f40_local1.archetypePerk.ref:SetValue( f40_arg1, Cac.traitNoneValue )
		elseif f40_arg3 then
			f40_local1.archetypePerk.ref:SetValue( f40_arg1, Engine.TableLookupMultipleKeys( CSV.proDefaults.file, {
				{
					col = CSV.proDefaults.cols.itemType,
					key = "trait"
				},
				{
					col = CSV.proDefaults.cols.rigRef,
					key = f40_local1.rigRef:GetValue( f40_arg1 )
				}
			}, CSV.proDefaults.cols.itemRef ) )
		end
	end
	f40_local2 = f40_local1.rigRef:GetValue( f40_arg1 )
	if not Engine.IsUnlocked( f40_arg1, "pro_head", Engine.TableLookup( CSV.heads.file, CSV.heads.cols.index, f40_arg0.statsGroup.head:GetValue( f40_arg1 ), CSV.heads.cols.ref ), true ) then
		f40_arg0.statsGroup.head:SetValue( f40_arg1, Cac.esportsDefaultHeads[f40_local2] )
	end
	if not Engine.IsUnlocked( f40_arg1, "pro_body", Engine.TableLookup( CSV.bodies.file, CSV.bodies.cols.index, f40_arg0.statsGroup.body:GetValue( f40_arg1 ), CSV.bodies.cols.ref ), true ) then
		f40_arg0.statsGroup.body:SetValue( f40_arg1, Cac.esportsDefaultBodies[f40_local2] )
	end
end

Cac.SetupLoadoutDraftTimerRefresh = function ( f41_arg0 )
	assert( f41_arg0.Seconds )
	local f41_local0 = nil
	local f41_local1 = function ()
		local f42_local0 = f41_arg0:Wait( 100 )
		f42_local0.onComplete = function ()
			return f41_local0()
		end
		
		local f42_local1 = LoadoutDrafting.GetDraftingTimeRemaining()
		if f42_local1 > 10 and f41_arg0.lastAnimPlayed ~= "Reset" then
			f41_arg0.lastAnimPlayed = "Reset"
			ACTIONS.AnimateSequence( f41_arg0, "Reset" )
		end
		DataSources.frontEnd.MP.cwl.drafting.countdownTime:SetValue( controllerIndex, f42_local1 )
		if f42_local1 <= 10 and f41_arg0.oldTimeRemaining ~= f42_local1 then
			f41_arg0.oldTimeRemaining = f42_local1
			Engine.PlayCountdownSound( f42_local1 )
			if f42_local1 <= 10 and f42_local1 > 5 and f41_arg0.lastAnimPlayed ~= "TenSecondsRemaining" then
				f41_arg0.lastAnimPlayed = "TenSecondsRemaining"
				ACTIONS.AnimateSequence( f41_arg0, "TenSecondsRemaining" )
			end
			if f42_local1 <= 5 and f41_arg0.lastAnimPlayed ~= "FiveSecondsRemaining" then
				f41_arg0.lastAnimPlayed = "FiveSecondsRemaining"
				ACTIONS.AnimateSequence( f41_arg0, "FiveSecondsRemaining" )
			end
		end
	end
	
	f41_local1()
end

Cac.ClearLoadoutDraftTimerRefreshIfNeeded = function ()
	local f44_local0 = Engine.GetLuiRoot()
	if not Engine.InFrontend() or not CONDITIONS.IsDraftEnabled() then
		if f44_local0.MPDraftModeTimer then
			f44_local0.MPDraftModeTimer:closeTree()
			f44_local0.MPDraftModeTimer = nil
		end
		return true
	else
		return false
	end
end

Cac.AdjustPreDraftCountdownPopup = function ( f45_arg0, f45_arg1, f45_arg2, f45_arg3, f45_arg4 )
	if f45_arg3 < f45_arg2 then
		DataSources.frontEnd.MP.cwl.drafting.countdownTime:SetValue( f45_arg1, f45_arg3 )
		if not f45_arg0.prePhaseCountdownOpen then
			f45_arg0.prePhaseCountdownOpen = true
			LUI.FlowManager.RequestPopupMenu( f45_arg0, "PreDraftCountdownPopup", true, f45_arg1, false, {
				draftPhaseText = f45_arg4,
				baseCountdownTime = f45_arg3,
				controllerIndex = f45_arg1
			} )
		end
	else
		if f45_arg0.prePhaseCountdownOpen then
			f45_arg0.prePhaseCountdownOpen = nil
			LUI.FlowManager.RequestLeaveMenuByName( "PreDraftCountdownPopup" )
		end
		DataSources.frontEnd.MP.cwl.drafting.countdownTime:SetValue( f45_arg1, f45_arg2 )
	end
end

Cac.LoadoutDraftStartMatch = function ( f46_arg0, f46_arg1, f46_arg2, f46_arg3 )
	if not f46_arg0.startingMatch then
		f46_arg0.startingMatch = true
		if MLG.GetGameBattleMatchId( f46_arg1 ) ~= GAMEBATTLES.INVALID_MATCH_ID then
			Lobby.SetPartyUIRoot( PartyUIRoot.GAME_BATTLES_MATCH )
		end
		if IsSystemLink() then
			Lobby.StartServer( f46_arg1, true )
			LUI.UIRoot.BlockButtonInput( f46_arg2, false, "MenuTransition" )
		else
			LUI.UIRoot.BlockButtonInput( f46_arg2, false, "TransitionToGame" )
			Engine.Exec( "xpartygo 1" )
			if f46_arg3 then
				if not (Engine.SplitscreenPlayerCount() > 1) then
					CODCASTER.SetCODCastingEnabled( MatchRules.GetData( "commonOption", "codcasterEnabled" ) )
				else
					CODCASTER.SetCODCastingEnabled( false )
				end
			end
		end
	end
end

