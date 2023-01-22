local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "frontEnd.MP.CAC.loadoutSelect"
f0_local1 = function ( f1_arg0 )
	ClientWeapon.SetWeaponVisible( 0, false )
	if Engine.IsConsoleGame() then
		f1_arg0:RemoveButtonHelperText( "button_stickr_updown_noswap", "left" )
	end
end

f0_local2 = function ( f2_arg0 )
	ClientWeapon.SetWeaponVisible( 0, true )
	if Engine.IsConsoleGame() then
		f2_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_ROTATE" ),
			button_ref = "button_stickr_updown_noswap",
			priority = 10,
			side = "left",
			clickable = false
		} )
	end
end

local f0_local3 = function ()
	Streaming.SetStreamingEnabled( false )
	ClientWeapon.SetWeaponVisible( 0, false )
	WipeCACPlayerDataModels()
	WipeGlobalModelsAtPath( f0_local0 )
end

local f0_local4 = function ( f4_arg0, f4_arg1, f4_arg2 )
	return function ()
		local f5_local0 = f4_arg1:GetDataSource( f4_arg2 )
		local f5_local1 = f5_local0.weapon:GetValue( f4_arg2 )
		local f5_local2 = f5_local0.variantID:GetValue( f4_arg2 )
		local f5_local3 = Cac.GetWeaponQuality( f5_local0.lootItemID:GetValue( f4_arg2 ) )
		local f5_local4 = f5_local0.camo:GetValue( f4_arg2 )
		local f5_local5 = f5_local0.cosmeticAttachment:GetValue( f4_arg2 )
		local f5_local6 = {}
		local f5_local7 = f5_local0.attachments.attachmentSlotOne:GetValue( f4_arg2 )
		local f5_local8 = f5_local0.attachments.attachmentSlotTwo:GetValue( f4_arg2 )
		local f5_local9 = f5_local0.attachments.attachmentSlotThree:GetValue( f4_arg2 )
		local f5_local10 = f5_local0.attachments.attachmentSlotFour:GetValue( f4_arg2 )
		local f5_local11 = f5_local0.attachments.attachmentSlotFive:GetValue( f4_arg2 )
		local f5_local12 = f5_local0.attachments.attachmentSlotSix:GetValue( f4_arg2 )
		f5_local6 = f5_local7
		f5_local7 = f5_local1 == "iw7_fists"
		if not f5_local7 then
			f5_local8 = Cac.GetCompleteWeaponModelName( f5_local1, f5_local1, f5_local3, f5_local2, f5_local4, f5_local6, f5_local5 )
			Streaming.RequestWeaponViewModels( {
				f5_local8
			}, f4_arg2 )
			FrontEndScene.SetWeaponModel( 0, f5_local8, true )
		end
		if f5_local7 then
			f0_local1( f4_arg0 )
		else
			f0_local2( f4_arg0 )
		end
		ACTIONS.AnimateSequence( f4_arg0.ItemDescription, "ImageHidden" )
	end
	
end

local f0_local5 = function ( f6_arg0 )
	local f6_local0 = f6_arg0:GetCurrentMenu()
	f6_local0.statsData = nil
	local f6_local1 = f6_local0.ItemDescription
	if f6_local1.WeaponStatsPanel then
		f6_local1.WeaponStatsPanel:closeTree()
		f6_local1.WeaponStatsPanel = nil
	end
	f6_local0.ItemDescription.Darkener:SetAlpha( 0, 0 )
end

local f0_local6 = function ( f7_arg0, f7_arg1, f7_arg2 )
	return function ( f8_arg0, f8_arg1 )
		local f8_local0 = f7_arg1:GetDataSource( f7_arg2 )
		if not f7_arg0.ItemDescription.WeaponStatsPanel then
			local f8_local1 = f8_arg0:GetDataSource()
			if f8_local1.used:GetValue( f7_arg2 ) then
				Cac.AttachWeaponStatsPanel( f7_arg0.ItemDescription, f7_arg2 )
				f7_arg0.ItemDescription.Darkener:SetAlpha( 0.5, 0 )
			else
				local f8_local1 = f8_arg0:GetDataSource()
				if not f8_local1.used:GetValue( f7_arg2 ) then
					f0_local5( f8_arg0 )
				end
			end
		else
			local f8_local1 = f8_arg0:GetDataSource()
			if not f8_local1.used:GetValue( f7_arg2 ) then
				f0_local5( f8_arg0 )
			end
		end
		if f7_arg0.ItemDescription.WeaponStatsPanel then
			Cac.UpdateWeaponStatsPanel( f8_local0, f7_arg0.ItemDescription.WeaponStatsPanel, f7_arg2 )
			local f8_local1 = ACTIONS.AnimateSequence
			local f8_local2 = f8_arg0:GetCurrentMenu()
			f8_local1( f8_local2.ItemDescription, "Visible" )
			ACTIONS.AnimateSequence( f7_arg0.ItemDescription, "RatioLarge" )
		end
	end
	
end

local f0_local7 = function ( f9_arg0 )
	return function ( f10_arg0, f10_arg1 )
		local f10_local0 = f10_arg0:GetCurrentMenu()
		local f10_local1 = f10_arg0:GetDataSource( f9_arg0 )
		local f10_local2 = f10_arg0:GetDataSource( f9_arg0 )
		f10_local1.headerColor = f10_local2.qualityColor
		f10_local0.itemDescriptionDataLink = f10_local0.ItemDescription:SetDataSourceThroughElement( f10_arg0, nil )
	end
	
end

local f0_local8 = function ( f11_arg0 )
	return function ( f12_arg0, f12_arg1 )
		local f12_local0 = f12_arg0:GetCurrentMenu()
		local f12_local1 = f12_arg0:GetDataSource( f11_arg0 )
		f12_local1.headerColor = LUI.DataSourceInGlobalModel.new( f0_local0 .. "." .. f12_arg0.id .. "color", GetIntForColor( SWATCHES.CAC.defaultItemHeader ) )
		f12_local0.itemDescriptionDataLink = f12_local0.ItemDescription:SetDataSourceThroughElement( f12_arg0, nil )
		f0_local1( f12_local0 )
	end
	
end

local f0_local9 = function ( f13_arg0 )
	return function ( f14_arg0, f14_arg1 )
		local f14_local0 = f14_arg0:GetCurrentMenu()
		ACTIONS.AnimateSequence( f14_local0.ItemDescription, "Visible" )
		ACTIONS.AnimateSequence( f14_local0.ItemDescription, "RatioLarge" )
		ACTIONS.AnimateSequence( f14_local0.ItemDescription, "ImageHidden" )
		f14_local0.itemDescriptionDataLink = f14_local0.ItemDescription:SetDataSource( f14_arg0.itemDescriptionDataSource, f13_arg0 )
		f0_local1( f14_local0 )
	end
	
end

local f0_local10 = function ( f15_arg0, f15_arg1 )
	return function ( f16_arg0, f16_arg1 )
		local f16_local0 = f16_arg0:GetCurrentMenu()
		f0_local5( f16_arg0 )
		local f16_local1 = f16_arg0:GetDataSource( f15_arg1 )
		f16_local1.headerColor = LUI.DataSourceInGlobalModel.new( f0_local0 .. "." .. f16_arg0.id .. "color", GetIntForColor( f15_arg0 ) )
		ACTIONS.AnimateSequence( f16_local0.ItemDescription, "Visible" )
		ACTIONS.AnimateSequence( f16_local0.ItemDescription, "RatioLarge" )
		f16_local0.itemDescriptionDataLink = f16_local0.ItemDescription:SetDataSourceThroughElement( f16_arg0, nil )
		f0_local1( f16_local0 )
	end
	
end

local f0_local11 = function ( f17_arg0, f17_arg1 )
	return function ( f18_arg0, f18_arg1 )
		local f18_local0 = f18_arg0:GetCurrentMenu()
		f0_local5( f18_arg0 )
		local f18_local1 = f18_arg0:GetDataSource( f17_arg1 )
		f18_local1.headerColor = LUI.DataSourceInGlobalModel.new( f0_local0 .. "." .. f18_arg0.id .. "color", GetIntForColor( f17_arg0 ) )
		ACTIONS.AnimateSequence( f18_local0.ItemDescription, "Visible" )
		ACTIONS.AnimateSequence( f18_local0.ItemDescription, "RatioLarge" )
		f18_local0.itemDescriptionDataLink = f18_local0.ItemDescription:SetDataSourceThroughElement( f18_arg0, nil )
		f0_local1( f18_local0 )
	end
	
end

local f0_local12 = function ( f19_arg0, f19_arg1 )
	return function ( f20_arg0, f20_arg1 )
		local f20_local0 = f20_arg0:GetCurrentMenu()
		f0_local5( f20_arg0 )
		ACTIONS.AnimateSequence( f20_local0.ItemDescription, "Visible" )
		ACTIONS.AnimateSequence( f20_local0.ItemDescription, "RatioLarge" )
		local f20_local1 = f20_arg0:GetDataSource()
		f20_local1.isExtra:SetValue( f19_arg0, f19_arg1 )
		f0_local1( f20_local0 )
	end
	
end

local f0_local13 = function ( f21_arg0, f21_arg1 )
	local f21_local0 = LUI.FlowManager.GetScopedData( f21_arg0 )
	if not f21_local0.openedLoadoutEdit and not f21_arg0.XUID then
		f21_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_MP_RIG_OPTIONS" ),
			button_ref = "button_alt2",
			side = "left",
			priority = 3,
			clickable = false
		} )
	end
	f21_arg0.MenuTitle.MenuBreadcrumbs:setText( CoD.GetBreadcrumbCreateAClass(), 0 )
	if f21_local0.currentDataSource then
		local f21_local1 = f21_arg0.LoadoutList.Loadouts
		local f21_local2 = f21_local1:GetGridDataSource()
		local f21_local3 = f21_local2:Decorate( function ()
			return {}
		end )
		f21_local1:SetDataSource( f21_local0.currentDataSource, f21_arg1.controller )
		f21_local3.GetDefaultFocusIndex = function ()
			local f23_local0 = f21_local0.currentGridIndex
			f21_local0.currentGridIndex = nil
			return f23_local0
		end
		
		f21_local1:SetGridDataSource( f21_local3 )
		if f21_local0.openedLoadoutEdit then
			ACTIONS.AnimateSequence( f21_arg0, "OpenedLoadoutEdit" )
			f21_arg0.CACLoadoutWrapper.CACLoadout:processEvent( {
				name = "open_loadout_edit_menu"
			} )
			local f21_local4 = f21_arg0.MenuTitle.MenuTitle
			local f21_local5 = f21_local4
			f21_local4 = f21_local4.setText
			local f21_local6 = ToUpperCase
			local f21_local7 = f21_arg0.LoadoutList.Loadouts:GetDataSource()
			f21_local4( f21_local5, f21_local6( f21_local7.name:GetValue( f21_arg1.controller ) ) )
		end
		local f21_local4 = f21_local0.refreshWidgetMenu
		if f21_local4 then
			if f21_local4 == Cac.LoadoutEditMenus.WeaponSelect then
				ACTIONS.AnimateSequence( f21_arg0.ItemDescription, "FromWeaponSelect" )
			elseif f21_local4 == Cac.LoadoutEditMenus.AttachmentSelect then
				ACTIONS.AnimateSequence( f21_arg0.ItemDescription, "FromAttachmentSelect" )
			elseif f21_local4 == Cac.LoadoutEditMenus.PowerSelect then
				ACTIONS.AnimateSequence( f21_arg0.ItemDescription, "FromPowerSelect" )
			elseif f21_local4 == Cac.LoadoutEditMenus.PerkSelect then
				ACTIONS.AnimateSequence( f21_arg0.ItemDescription, "FromPerkSelect" )
			end
			f21_local0.refreshWidgetMenu = nil
		end
	end
	Onboarding:ApplyWhitelist( "LoadoutSelect", f21_arg0 )
end

local f0_local14 = function ( f24_arg0, f24_arg1 )
	FrontEndScene.SetScene( "create_a_class" )
	f0_local1( f24_arg0 )
	local f24_local0 = LUI.FlowManager.GetScopedData( f24_arg0 )
	if f24_arg0.itemDescriptionDataLink then
		f24_arg0.ItemDescription:UnsubscribeFromModelThroughElement( f24_arg0.itemDescriptionDataLink )
	end
	f24_local0.openedLoadoutEdit = false
	f24_local0.currentDataSource = nil
	if Engine.IsPC() then
		assert( f24_arg0.RigButton )
		assert( f24_arg0.LoadoutList )
		assert( f24_arg0.FramedStreaks )
		f24_arg0.RigButton:SetHandleMouseTree( true )
		f24_arg0.LoadoutList:SetHandleMouseTree( true )
		f24_arg0.FramedStreaks:SetHandleMouseTree( true )
	end
	if CONDITIONS.IsDraftEnabled() and f24_arg0.XUID then
		f24_arg0:RemoveButtonHelperText( "button_secondary", "left" )
	end
	if not f24_arg0.XUID then
		f24_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_MP_RIG_OPTIONS" ),
			button_ref = "button_alt2",
			side = "left",
			priority = 3,
			clickable = false
		} )
	end
	f24_arg0:AddButtonHelperText( {
		helper_text = Engine.Localize( "LUA_MENU_SCORESTREAKS" ),
		button_ref = "button_alt1",
		side = "left",
		priority = 2,
		clickable = false
	} )
	ACTIONS.AddLoadoutOptionPrompt( f24_arg0, controllerIndex )
end

local f0_local15 = function ( f25_arg0, f25_arg1, f25_arg2 )
	local f25_local0 = LOOT.AreAnyLastLootItemsWeaponBySlot( f25_arg1, f25_arg2 )
	local f25_local1 = false
	if not f25_local0 then
		local f25_local2 = Cac.GetWeaponClasses( f25_arg2 )
		local f25_local3 = Cac.GetWeaponRowList()
		for f25_local10, f25_local11 in ipairs( f25_local2 ) do
			for f25_local7, f25_local8 in pairs( f25_local3[f25_local11.ref] ) do
				if Rewards.IsNew( f25_arg1, "weapon", Engine.TableLookupGetRowNum( CSV.weaponUnlockTable.file, CSV.weaponUnlockTable.cols.ref, f25_local7 ) ) then
					f25_local1 = true
					break
				end
			end
			if f25_local1 then
				
			end
		end
	end
	return f25_local0 or f25_local1
end

local f0_local16 = function ( f26_arg0, f26_arg1, f26_arg2 )
	local f26_local0 = PERK_LIST[tostring( f26_arg2 )]
	local f26_local1 = false
	for f26_local5, f26_local6 in pairs( f26_local0 ) do
		if Rewards.IsNew( f26_arg1, "perk", Engine.TableLookupGetRowNum( CSV.perkUnlockTable.file, CSV.perkUnlockTable.cols.ref, f26_local5 ) ) then
			return true
		end
	end
end

local f0_local17 = function ( f27_arg0, f27_arg1, f27_arg2 )
	local f27_local0 = LUI.FlowManager.GetScopedData( f27_arg0 )
	if f27_local0 and f27_local0.openedLoadoutEdit then
		FrontEndScene.SetTeamAndScene( "loadout_select", f27_arg1 )
	else
		FrontEndScene.SetTeamAndScene( "create_a_class", f27_arg1 )
	end
end

local f0_local18 = function ( f28_arg0, f28_arg1, f28_arg2, f28_arg3 )
	local f28_local0 = LOADOUT.IsSlotUnlocked( f28_arg0, f28_arg1, f28_arg2, f28_arg3 )
	local f28_local1 = LOADOUT.IsSlotUnlocked( f28_arg0, f28_arg1, f28_arg2, f28_arg3, true )
	local f28_local2 = f28_local0
	local f28_local3
	if CONDITIONS.UseLoadoutRestrictions() then
		f28_local3 = f28_local1
	else
		f28_local3 = f28_local2 and true
	end
	return f28_local3
end

function PostLoadFunc( f29_arg0, f29_arg1, f29_arg2 )
	if Engine.IsDevelopmentBuild() and not f29_arg2.squadMemberDataSource then
		DebugPrint( "WARNING: Missing \"squadMemberDataSource\" option for LoadoutSelect menu. Only OK after a MyChanges." )
		f29_arg2.squadMemberDataSource = DataSources.alwaysLoaded.playerData.MP.privateloadouts.squadMembers
	end
	if CONDITIONS.IsDraftEnabled() then
		f29_arg0:addEventHandler( "menu_create", function ()
			local f30_local0 = f29_arg0.CACLoadoutWrapper:SubscribeToDataSourceThroughElement( f29_arg0.LoadoutList, nil, function ( f31_arg0 )
				f29_arg0.CACLoadoutWrapper:SetDataSource( f31_arg0:GetDataSourceAtIndex( 0, f29_arg1 ), f29_arg1 )
			end )
			f30_local0.unlinkOnCallback = true
		end )
		f29_arg0.XUID = Engine.GetLocalClientXUIDString( f29_arg1 )
		if CONDITIONS.IsPublicMatch() then
			f29_arg0.squadMemberDataSource = DataSources.alwaysLoaded.playerData.MP.rankedloadouts.squadMembers
		else
			f29_arg0.squadMemberDataSource = DataSources.alwaysLoaded.playerData.MP.privateloadouts.squadMembers
		end
		f29_arg0.squadMemberDataSource.isProperty = false
		f29_arg0.squadMemberDataSource.__serializable = false
		f29_arg0.statsGroupDataSource = GetCACPlayerDataDataSource( f29_arg0.squadMemberDataSource )
		local f29_local0 = LUI.FlowManager.GetScopedData( f29_arg0 )
		if not f29_local0.priorEntry then
			Cac.ClearBannedAndDraftedItems( f29_arg0.statsGroupDataSource, f29_arg1, f29_arg0.XUID )
			f29_local0.priorEntry = true
		end
		local f29_local1 = Lobby.IsInLobby()
		local f29_local2
		if f29_local1 and Lobby.IsGameHost() then
			f29_local2 = IsPrivateMatch()
			if not f29_local2 then
				if not f29_local1 then
					f29_local2 = Lobby.IsPrivatePartyHost()
				else
					f29_local2 = false
				end
			end
		elseif not f29_local1 then
			f29_local2 = Lobby.IsPrivatePartyHost()
		else
			f29_local2 = false
		end
		Cac.SetupLoadoutDraftTimerRefresh( f29_arg0.LoadoutDraftTimer )
		local f29_local3 = Engine.GetLuiRoot()
		if f29_local3.MPDraftModeTimer then
			local f29_local4 = f29_local3.MPDraftModeTimer
			f29_local4.RefreshTimer = function ()
				if Cac.ClearLoadoutDraftTimerRefreshIfNeeded() then
					return 
				end
				local f32_local0 = f29_local4:Wait( 100 )
				f32_local0.onComplete = function ()
					return f29_local4.RefreshTimer()
				end
				
				local f32_local1 = LoadoutDrafting.GetDraftingTimeRemaining()
				Cac.AdjustPreDraftCountdownPopup( f29_local4, f29_arg1, f32_local1, Lobby.GetDraftLoadoutTimer(), "MP_FRONTEND_ONLY_LOADOUT_SELECT_START" )
				if IsMlgGameBattlesMatch() and MLG.GetGameBattleDSAcquisitionState( f29_arg1 ) ~= GAMEBATTLES.MLG_DS_ACQUISITION_STATE.ACQUIRED then
					LUI.FlowManager.RequestLeaveMenuByName( "LoadoutSelect" )
				end
				if f32_local1 <= 0 and Engine.GetTeamForLocalClient() ~= Teams.spectator and f29_local2 then
					Cac.LoadoutDraftStartMatch( f29_local4, f29_arg1, f29_local3, false )
				end
			end
			
			f29_local4.RefreshTimer()
		end
		assert( f29_arg0.RigButton )
		f29_arg0.RigButton:SetButtonDisabled( true )
	else
		f29_arg0.squadMemberDataSource = f29_arg2.squadMemberDataSource
		f29_arg0.statsGroupDataSource = GetCACPlayerDataDataSource( f29_arg0.squadMemberDataSource )
	end
	assert( f29_arg0.squadMemberDataSource )
	Streaming.SetStreamingEnabled( true )
	local f29_local1 = Engine.TableLookup( CSV.bodies.file, CSV.bodies.cols.index, f29_arg0.squadMemberDataSource.body:GetValue( f29_arg1 ), CSV.bodies.cols.model )
	local f29_local3 = Engine.TableLookup( CSV.heads.file, CSV.heads.cols.index, f29_arg0.squadMemberDataSource.head:GetValue( f29_arg1 ), CSV.heads.cols.model )
	if f29_local1 and f29_local1 ~= "" then
		Streaming.RequestBodyModels( {
			f29_local1
		} )
	end
	if f29_local3 and f29_local3 ~= "" then
		Streaming.RequestHeadModels( {
			f29_local3
		} )
	end
	if CONDITIONS.UseCACBreadCrumbs() then
		f29_arg0.areWeaponsNew = {}
		f29_arg0.areWeaponsNew[Cac.PrimaryWeaponSlot] = f0_local15( self, f29_arg1, Cac.PrimaryWeaponSlot )
		f29_arg0.areWeaponsNew[Cac.SecondaryWeaponSlot] = f0_local15( self, f29_arg1, Cac.SecondaryWeaponSlot )
		f29_arg0.arePerksNew = {}
		f29_arg0.arePerksNew[1] = f0_local16( self, f29_arg1, 1 )
		f29_arg0.arePerksNew[2] = f0_local16( self, f29_arg1, 2 )
		f29_arg0.arePerksNew[3] = f0_local16( self, f29_arg1, 3 )
	end
	f29_arg0.FramedStreaks:SetDataSource( f29_arg0.statsGroupDataSource, f29_arg1 )
	f29_arg0.ScorestreakPreview:SetDataSource( f29_arg0.statsGroupDataSource, f29_arg1 )
	f29_arg0.RigButton:SetDataSource( f29_arg0.statsGroupDataSource.rig, f29_arg1 )
	f29_arg0.RigPreview:SetDataSource( f29_arg0.statsGroupDataSource.rig, f29_arg1 )
	f29_arg0.MenuTitle:addEventHandler( "open_loadout_edit_menu", function ( f34_arg0, f34_arg1 )
		local f34_local0 = f29_arg0.MenuTitle.MenuTitle
		local f34_local1 = f34_local0
		f34_local0 = f34_local0.setText
		local f34_local2 = ToUpperCase
		local f34_local3 = f29_arg0.LoadoutList.Loadouts:GetDataSource()
		f34_local0( f34_local1, f34_local2( f34_local3.name:GetValue( f29_arg1 ) ) )
		ACTIONS.AnimateSequence( f29_arg0.MenuTitle, "Update" )
		ACTIONS.PlaySoundSetSound( f29_arg0, "menuDecode", false )
	end )
	f29_arg0.MenuTitle:addEventHandler( "close_loadout_edit_menu", function ( f35_arg0, f35_arg1 )
		f29_arg0.MenuTitle.MenuTitle:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_LOADOUT_SELECT" ) ), 0 )
		ACTIONS.AnimateSequence( f29_arg0.MenuTitle, "Update" )
		ACTIONS.PlaySoundSetSound( f29_arg0, "menuDecode", false )
		ACTIONS.PlaySoundSetSound( f29_arg0, "back", false )
	end )
	f29_arg0:SetDataSource( f29_arg0.statsGroupDataSource.loadouts, f29_arg1 )
	local f29_local4 = f29_arg0.CACLoadoutWrapper.CACLoadout
	if Engine.IsPC() then
		f29_arg0.CACLoadoutWrapper:SetHandleMouseTree( false )
	end
	local f29_local5 = f0_local0 .. ".ItemDescription.Overkill"
	local f29_local6 = LUI.DataSourceInGlobalModel.new( f29_local5 )
	local f29_local7 = LUI.DataSourceInGlobalModel.new( f29_local5 .. ".empty", nil )
	f29_local6.quality = f29_local7
	f29_local6.qualityColor = f29_local7
	f29_local6.qualityImage = f29_local7
	f29_local6.qualityString = f29_local7
	f29_local6.fullImage = f29_local7
	f29_local6.weaponRef = f29_local7
	f29_local6.passives = LUI.DataSourceFromList.new( 0 )
	f29_local6.fireModes = LUI.DataSourceFromList.new( 0 )
	f29_local6.name = LUI.DataSourceInGlobalModel.new( f29_local5 .. ".name", Engine.Localize( "LUA_MENU_MP_LOADOUT_SELECT_OVERKILL" ) )
	f29_local6.desc = LUI.DataSourceInGlobalModel.new( f29_local5 .. ".desc", Engine.Localize( "LUA_MENU_MP_LOADOUT_SELECT_OVERKILL_DESC" ) )
	f29_local6.ref = LUI.DataSourceInGlobalModel.new( f29_local5 .. ".ref", Cac.overkillRef )
	f29_local6.isMk2 = f29_local7
	f29_local4.WeaponTwo.Overkill.itemDescriptionDataSource = f29_local6
	local f29_local8 = function ( f36_arg0, f36_arg1 )
		ACTIONS.OpenRigSelectMenu( f36_arg0, f36_arg0, f29_arg1 )
	end
	
	local f29_local9 = function ( f37_arg0, f37_arg1 )
		local f37_local0 = f29_arg0.LoadoutList.Loadouts
		local f37_local1 = f37_local0:GetDataSource( f29_arg1 )
		if f37_local1 then
			local f37_local2 = LUI.FlowManager.GetScopedData( f29_arg0 )
			f37_local2.currentDataSource = f37_local1
			f37_local2.currentDataSource.isProperty = false
			f37_local2.currentGridIndex = f37_local0:GetFocusPosition( LUI.DIRECTION.vertical )
			f37_local0:saveState()
		end
	end
	
	f29_arg0:addEventHandler( "menu_create", f0_local13 )
	f29_arg0:addEventHandler( "open_loadout_edit_menu", function ( f38_arg0, f38_arg1 )
		FrontEndScene.SetScene( "loadout_select" )
		f29_local9( f38_arg0, f38_arg1 )
		local f38_local0 = LUI.FlowManager.GetScopedData( f29_arg0 )
		f38_local0.openedLoadoutEdit = true
		ACTIONS.LoseFocus( f38_arg0, "LoadoutList", f29_arg1 )
		if Engine.IsPC() then
			assert( f29_arg0.RigButton )
			assert( f29_arg0.LoadoutList )
			assert( f29_arg0.FramedStreaks )
			f29_arg0.RigButton:SetHandleMouseTree( false )
			f29_arg0.LoadoutList:SetHandleMouseTree( false )
			f29_arg0.FramedStreaks:SetHandleMouseTree( false )
		end
		if CONDITIONS.IsDraftEnabled() and f29_arg0.XUID then
			f29_arg0:AddButtonHelperText( {
				helper_text = Engine.Localize( "MENU_BACK" ),
				button_ref = "button_secondary",
				side = "left",
				priority = 1,
				clickable = true
			} )
		end
		if not f29_arg0.XUID then
			f29_arg0:RemoveButtonHelperText( "button_alt2", "left" )
		end
		ACTIONS.RemoveLoadoutOptionPrompt( f29_arg0, f29_arg1 )
		if f38_arg1.focusLoadout then
			ACTIONS.GainFocus( f38_arg0, "CACLoadoutWrapper", f29_arg1 )
		end
	end )
	f29_arg0:SubscribeToDataSourceThroughElement( f29_arg0.LoadoutList.Loadouts, nil, function ()
		local f39_local0 = f29_arg0.LoadoutList.Loadouts
		local f39_local1 = f39_local0:GetGridDataSource()
		local f39_local2 = f39_local0:GetFocusPosition( LUI.DIRECTION.vertical )
		if f39_local2 then
			for f39_local3 = 0, f39_local1:GetCountValue( f29_arg1 ) - 1, 1 do
				if f39_local3 ~= f39_local2 then
					WipeGlobalModelsAtPath( Cac.playerDataDataSourceModelPath .. "." .. f39_local3 )
				end
			end
		end
	end )
	f29_arg0:addEventHandler( "close_loadout_edit_menu", f0_local14 )
	local f29_local10 = f29_local4.WeaponOne
	local f29_local11 = f29_local4.WeaponTwo
	f29_arg0.LoadoutList.navigation = {}
	f29_arg0.LoadoutList.navigation.up = f29_arg0.RigButton
	f29_arg0.LoadoutList.navigation.down = f29_arg0.FramedStreaks
	f29_arg0.RigButton.navigation = {}
	f29_arg0.RigButton.navigation.down = f29_arg0.LoadoutList
	f29_arg0.RigButton.navigation.up = f29_arg0.FramedStreaks
	if not f29_arg0.XUID then
		f29_arg0.RigButton:addEventHandler( "button_action", f29_local8 )
		f29_arg0.RigButton.actionSFX = "ui_select_screen_return"
		f29_arg0.RigButton:addEventHandler( "button_action", f29_local9 )
		f29_arg0.bindButton:addEventHandler( "button_alt2", function ( f40_arg0, f40_arg1 )
			local f40_local0 = LUI.FlowManager.GetScopedData( f29_arg0 )
			if not f40_local0.openedLoadoutEdit then
				Engine.PlaySound( "ui_select_screen_return" )
				f29_local9( f29_arg0.RigButton, f40_arg1 )
				f29_local8( f29_arg0.RigButton, f40_arg1 )
				return true
			else
				return false
			end
		end )
	end
	f29_arg0.FramedStreaks.navigation = {}
	f29_arg0.FramedStreaks.navigation.up = f29_arg0.LoadoutList
	f29_arg0.FramedStreaks.navigation.down = f29_arg0.RigButton
	f29_arg0.FramedStreaks:addEventHandler( "button_action", f29_local9 )
	f29_arg0.FramedStreaks.actionSFX = "ui_select_screen_return"
	if not Onboarding:IsFlowInProgress( Onboarding.RigTutorial ) then
		f29_arg0:addEventHandler( "menu_create", function ( f41_arg0, f41_arg1 )
			f41_arg0:AddButtonHelperText( {
				helper_text = Engine.Localize( "LUA_MENU_SCORESTREAKS" ),
				button_ref = "button_alt1",
				side = "left",
				priority = 2,
				clickable = false
			} )
		end )
		f29_arg0.bindButton:addEventHandler( "button_alt1", function ( f42_arg0, f42_arg1 )
			local f42_local0 = LUI.FlowManager.GetScopedData( f29_arg0 )
			Engine.PlaySound( "ui_select_screen_return" )
			if not f42_local0.openedLoadoutEdit then
				f29_local9( f29_arg0.FramedStreaks, f42_arg1 )
				ACTIONS.OpenStreakSelectMenu( f29_arg0, f29_arg0.FramedStreaks, f29_arg1 )
				return true
			else
				return false
			end
		end )
	end
	f29_arg0.FramedStreaks:addEventHandler( "gain_focus", function ( f43_arg0, f43_arg1 )
		local f43_local0 = f29_arg0.LoadoutList.Loadouts:GetGridDataSource()
		local f43_local1 = LUI.FlowManager.GetScopedData( f29_arg0 )
		f43_local1.currentGridIndex = f43_local0:GetCountValue( f29_arg1 ) - 1
	end )
	f29_arg0.RigButton:addEventHandler( "gain_focus", function ( f44_arg0, f44_arg1 )
		local f44_local0 = LUI.FlowManager.GetScopedData( f29_arg0 )
		f44_local0.currentGridIndex = 0
	end )
	local f29_local12 = f29_arg0.LoadoutList.Loadouts:GetGridDataSource()
	f29_local12.GetDefaultFocusIndex = function ()
		local f45_local0 = LUI.FlowManager.GetScopedData( "LoadoutSelect" )
		local f45_local1 = f45_local0.currentGridIndex
		f45_local0.currentGridIndex = nil
		return f45_local1
	end
	
	f29_local4.Equipment.PowerSlotOne.PowerButton:addEventHandler( "button_over", f0_local12( f29_arg1, false ) )
	f29_local4.Equipment.PowerSlotOne.PowerButton:addEventHandler( "button_over", f0_local7( f29_arg1 ) )
	f29_local4.Equipment.PowerSlotOne.PowerButton.id = "PowerSlotOneButton"
	f29_local4.Equipment.PowerSlotOne.ExtraPowerButton:addEventHandler( "button_over", f0_local12( f29_arg1, true ) )
	f29_local4.Equipment.PowerSlotOne.ExtraPowerButton:addEventHandler( "button_over_disable", f0_local12( f29_arg1, true ) )
	f29_local4.Equipment.PowerSlotOne.ExtraPowerButton:addEventHandler( "button_over", f0_local7( f29_arg1 ) )
	f29_local4.Equipment.PowerSlotOne.ExtraPowerButton:addEventHandler( "button_over_disable", f0_local7( f29_arg1 ) )
	f29_local4.Equipment.PowerSlotOne.ExtraPowerButton.id = "ExtraPowerSlotOneButton"
	if not f0_local18( f29_arg1, LOADOUT.SlotTypes.POWER, 0 ) then
		ACTIONS.AnimateSequence( f29_local4.Equipment.PowerSlotOne.ExtraPowerButton, "Locked" )
	end
	f29_local4.Equipment.PowerSlotTwo.PowerButton:addEventHandler( "button_over", f0_local12( f29_arg1, false ) )
	f29_local4.Equipment.PowerSlotTwo.PowerButton:addEventHandler( "button_over", f0_local7( f29_arg1 ) )
	f29_local4.Equipment.PowerSlotTwo.PowerButton.id = "PowerSlotTwoButton"
	f29_local4.Equipment.PowerSlotTwo.ExtraPowerButton:addEventHandler( "button_over", f0_local12( f29_arg1, true ) )
	f29_local4.Equipment.PowerSlotTwo.ExtraPowerButton:addEventHandler( "button_over_disable", f0_local12( f29_arg1, true ) )
	f29_local4.Equipment.PowerSlotTwo.ExtraPowerButton:addEventHandler( "button_over", f0_local7( f29_arg1 ) )
	f29_local4.Equipment.PowerSlotTwo.ExtraPowerButton:addEventHandler( "button_over_disable", f0_local7( f29_arg1 ) )
	f29_local4.Equipment.PowerSlotTwo.ExtraPowerButton.id = "ExtraPowerSlotTwoButton"
	if not f0_local18( f29_arg1, LOADOUT.SlotTypes.POWER, 1 ) then
		ACTIONS.AnimateSequence( f29_local4.Equipment.PowerSlotTwo.ExtraPowerButton, "Locked" )
	end
	f29_local10.WeaponButton:addEventHandler( "button_over", f0_local6( f29_arg0, f29_local10.WeaponButton, f29_arg1 ) )
	f29_local10.WeaponButton:addEventHandler( "button_over", f0_local7( f29_arg1 ) )
	f29_local10.WeaponButton:addEventHandler( "button_over", f0_local4( f29_arg0, f29_local10.WeaponButton, f29_arg1 ) )
	f29_local10.WeaponButton.id = "WeaponOne"
	f29_local11.WeaponButton:addEventHandler( "button_over", f0_local6( f29_arg0, f29_local11.WeaponButton, f29_arg1 ) )
	f29_local11.WeaponButton:addEventHandler( "button_over", f0_local7( f29_arg1 ) )
	f29_local11.WeaponButton:addEventHandler( "button_over", f0_local4( f29_arg0, f29_local11.WeaponButton, f29_arg1 ) )
	f29_local11.WeaponButton.id = "WeaponTwo"
	f29_arg0:addEventHandler( "weapon_cleared", function ( f46_arg0, f46_arg1 )
		f0_local1( f29_arg0 )
		f0_local5( f46_arg0 )
	end )
	local f29_local13 = function ( f47_arg0, f47_arg1, f47_arg2 )
		local f47_local0 = {}
		local f47_local1 = f47_arg0.AttachmentsOne:getFirstChild()
		local f47_local2 = f47_arg0.AttachmentsTwo:getFirstChild()
		f47_local0 = f47_local1
		f47_local1 = 0
		for f47_local6, f47_local5 in ipairs( f47_local0 ) do
			while f47_local5 do
				if f47_local5.bindButton then
					f47_local5:addEventHandler( "button_over", f0_local6( f29_arg0, f47_arg0.WeaponButton, f29_arg1 ) )
					f47_local5:addEventHandler( "button_over_disable", f0_local6( f29_arg0, f47_arg0.WeaponButton, f29_arg1 ) )
					f47_local5:addEventHandler( "button_over", f0_local8( f29_arg1 ) )
					f47_local5:addEventHandler( "button_over_disable", f0_local8( f29_arg1 ) )
					if f47_local1 > 2 and not f0_local18( f29_arg1, LOADOUT.SlotTypes.ATTACHMENT, f47_local1 + 1, f47_arg1 ) then
						ACTIONS.AnimateSequence( f47_local5, "Locked" )
					end
					f47_local5.id = f47_arg2 .. f47_local1
				end
				f47_local5 = f47_local5:getNextSibling()
				f47_local1 = f47_local1 + 1
			end
			f47_local1 = f47_local1 - 1
		end
	end
	
	f29_local13( f29_local10, 0, "PrimaryAttachment" )
	f29_local13( f29_local11, 1, "SecondaryAttachment" )
	f29_local11.Overkill:addEventHandler( "button_over", f0_local9( f29_arg1 ) )
	f29_local11.Overkill:addEventHandler( "button_over_disable", f0_local9( f29_arg1 ) )
	f29_local11.Overkill.disabled = not f0_local18( f29_arg1, LOADOUT.SlotTypes.OVERKILL )
	if not f0_local18( f29_arg1, LOADOUT.SlotTypes.OVERKILL ) then
		ACTIONS.AnimateSequence( f29_local11.Overkill, "Locked" )
		f29_local11.Overkill.itemDescriptionDataSource.name:SetValue( f29_arg1, Engine.Localize( "LUA_MENU_MP_PICK10_SLOT_EXTRA_PRIMARY_WEAPON" ) )
		f29_local11.Overkill.itemDescriptionDataSource.desc:SetValue( f29_arg1, ToUpperCase( Cac.GetUnlockText( CSV.pick10UnlockTable, "extra_primary_weapon" ) ) )
	end
	f29_local4.PerkOne.Perk:addEventHandler( "button_over", f0_local10( SWATCHES.CAC.perkSlotOne, f29_arg1 ) )
	f29_local4.PerkOne.Perk.id = "PerkOnePerk"
	f29_local4.PerkOne.ExtraPerk:addEventHandler( "button_over", f0_local11( SWATCHES.CAC.perkSlotOne, f29_arg1 ) )
	f29_local4.PerkOne.ExtraPerk:addEventHandler( "button_over_disable", f0_local11( SWATCHES.CAC.perkSlotOne, f29_arg1 ) )
	f29_local4.PerkOne.ExtraPerk.id = "PerkOneExtraPerk"
	if not f0_local18( f29_arg1, LOADOUT.SlotTypes.PERK, 1 ) then
		ACTIONS.AnimateSequence( f29_local4.PerkOne.ExtraPerk, "Locked" )
	end
	f29_local4.PerkTwo.Perk:addEventHandler( "button_over", f0_local10( SWATCHES.CAC.perkSlotTwo, f29_arg1 ) )
	f29_local4.PerkTwo.Perk.id = "PerkTwoPerk"
	f29_local4.PerkTwo.ExtraPerk:addEventHandler( "button_over", f0_local11( SWATCHES.CAC.perkSlotTwo, f29_arg1 ) )
	f29_local4.PerkTwo.ExtraPerk:addEventHandler( "button_over_disable", f0_local11( SWATCHES.CAC.perkSlotTwo, f29_arg1 ) )
	f29_local4.PerkTwo.ExtraPerk.id = "PerkTwoExtraPerk"
	if not f0_local18( f29_arg1, LOADOUT.SlotTypes.PERK, 2 ) then
		ACTIONS.AnimateSequence( f29_local4.PerkTwo.ExtraPerk, "Locked" )
	end
	f29_local4.PerkThree.Perk:addEventHandler( "button_over", f0_local10( SWATCHES.CAC.perkSlotThree, f29_arg1 ) )
	f29_local4.PerkThree.Perk.id = "PerkThreePerk"
	f29_local4.PerkThree.ExtraPerk:addEventHandler( "button_over", f0_local11( SWATCHES.CAC.perkSlotThree, f29_arg1 ) )
	f29_local4.PerkThree.ExtraPerk:addEventHandler( "button_over_disable", f0_local11( SWATCHES.CAC.perkSlotThree, f29_arg1 ) )
	f29_local4.PerkThree.ExtraPerk.id = "PerkThreeExtraPerk"
	if not f0_local18( f29_arg1, LOADOUT.SlotTypes.PERK, 3 ) then
		ACTIONS.AnimateSequence( f29_local4.PerkThree.ExtraPerk, "Locked" )
	end
	f29_arg0:registerEventHandler( "menu_close", function ( element, event )
		
	end )
	f29_arg0.CACLoadoutWrapper:addEventHandler( "restore_focus", function ( f49_arg0, f49_arg1 )
		local f49_local0 = LUI.FlowManager.GetScopedData( f29_arg0 )
		if f49_local0.openedLoadoutEdit then
			f29_arg0.CACLoadoutWrapper:AddButtonHelperText( {
				helper_text = Engine.Localize( "LUA_MENU_CLEAR" ),
				button_ref = "button_alt1",
				side = "left",
				priority = 2,
				clickable = false
			} )
		end
	end )
	f29_arg0:SetNotifyOnLayoutInit( true )
	f29_arg0:addEventHandler( "layout_initialized", function ( f50_arg0, f50_arg1 )
		local f50_local0 = LUI.FlowManager.GetScopedData( f29_arg0 )
		f50_local0.staticPointAnimation = false
		f50_local0.loadoutPointsUsed = nil
		local f50_local1 = f50_arg0:getFirstInFocus()
		if f50_local1 then
			f50_local1:processEvent( {
				name = "animate_points"
			} )
		end
	end )
	f29_arg0.bindButton:addEventHandler( "button_start", function ( f51_arg0, f51_arg1 )
		if #f29_arg0.LoadoutList:getAllFocusedChildren() > 0 then
			local f51_local0 = f29_arg0.LoadoutList.Loadouts
			local f51_local1 = f51_local0:GetGridDataSource( f29_arg1 )
			local f51_local2 = f51_local0:GetDataSource( f29_arg1 )
			f51_local2.isProperty = false
			f51_local2.__serializable = false
			if f51_local2.isLoadoutLocked:GetValue( f29_arg1 ) then
				return 
			end
			Engine.PlaySound( "ui_select_screen_return" )
			LUI.FlowManager.RequestPopupMenu( f29_arg0, "LoadoutOptionsPopup", true, f29_arg1, false, {
				currentLoadoutIndex = f51_local0:GetFocusPosition( LUI.DIRECTION.vertical ),
				loadoutListDataSource = f29_arg0.squadMemberDataSource,
				loadoutDataSource = f51_local2,
				loadoutGridDataSource = f51_local1
			}, nil, false )
		end
	end )
	f29_arg0.bindButton:addEventHandler( "button_secondary", function ( f52_arg0, f52_arg1 )
		local f52_local0 = LUI.FlowManager.GetScopedData( f29_arg0 )
		if not f52_local0.openedLoadoutEdit then
			if not CONDITIONS.IsDraftEnabled() or not f29_arg0.XUID then
				ACTIONS.LeaveMenu( f29_arg0 )
			end
		else
			ACTIONS.CloseLoadoutEditMenu( f29_arg0 )
		end
		return true
	end )
	f29_arg0:addEventHandler( "menu_create", function ( f53_arg0, f53_arg1 )
		if CONDITIONS.IsDraftEnabled() and f29_arg0.XUID then
			local f53_local0 = LUI.FlowManager.GetScopedData( f29_arg0 )
			if f53_local0.openedLoadoutEdit then
			
			else
				
			end
		end
		f29_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			priority = 1,
			clickable = true
		} )
	end )
	f29_arg0.LoadoutList:addEventHandler( "restore_focus", function ( f54_arg0, f54_arg1 )
		local f54_local0 = LUI.FlowManager.GetScopedData( f29_arg0 )
		if f54_local0.openedLoadoutEdit ~= true then
			ACTIONS.AddLoadoutOptionPrompt( f29_arg0, f29_arg1 )
		end
	end )
	if not Engine.IsConsoleGame() then
		f29_arg0.LoadoutList:SetHandleMouse( true )
		f29_arg0.LoadoutList:registerEventHandler( "mouseenter", function ()
			if not CONDITIONS.IsLoadoutEditOpen( f29_arg0 ) then
				f29_arg0.LoadoutList:processEvent( {
					name = "gain_focus",
					controller = f29_arg1
				} )
			end
		end )
	end
	local f29_local14 = Engine.GetDvarInt( "ui_playtestLevel" )
	if f29_local14 and f29_local14 ~= 0 then
		DataSources.alwaysLoaded.playerData.MP.ranked.progression.playerLevel.xp:SetValue( f29_arg1, Rank.GetRankMaxXP( f29_local14 ) )
	end
	if Engine.InFrontend() then
		local f29_local15 = f29_arg0.squadMemberDataSource
		FrontEndScene.SetCharacterModelsByIndex( FrontEndScene.ClientCharacters.Self, f29_local15.body:GetValue( f29_arg1 ), f29_local15.head:GetValue( f29_arg1 ) )
		local f29_local16 = f29_arg0.squadMemberDataSource.archetype:GetValue( f29_arg1 )
		local f29_local17 = f29_arg0.squadMemberDataSource.archetypeSuper:GetValue( f29_arg1 )
		FrontEndScene.SetWeaponForSuper( FrontEndScene.ClientCharacters.Self, f29_local17, f29_local16 )
		FrontEndScene.PlayIdleForSuper( FrontEndScene.ClientCharacters.Self, f29_local17, f29_local16 )
	end
	local f29_local15 = MenuBuilder.BuildRegisteredType( "LobbyStatus", {
		controllerIndex = f29_arg1
	} )
	f29_local15:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -800, _1080p * -40, _1080p * -114, _1080p * -80 )
	f29_local15:Minimize()
	f29_arg0:addElement( f29_local15 )
	if Engine.IsPC() then
		f29_arg0:addEventHandler( "gain_focus", function ( f56_arg0, f56_arg1 )
			local f56_local0 = f56_arg1.controller or f29_arg1
			if CONDITIONS.IsLoadoutEditOpen( f29_arg0 ) then
				ACTIONS.GainFocus( f29_arg0, "CACLoadoutWrapper", f56_local0 )
				return true
			else
				
			end
		end )
	end
	ClientCharacter.SetCharacterRotation( FrontEndScene.ClientCharacters.Self, 0, 0, 0 )
end

function LoadoutSelect( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "LoadoutSelect"
	self._animationSets = {}
	self._sequences = {}
	local f57_local1 = controller and controller.controllerIndex
	if not f57_local1 and not Engine.InFrontend() then
		f57_local1 = self:getRootController()
	end
	assert( f57_local1 )
	f0_local17( self, f57_local1, controller )
	self:playSound( "menu_open" )
	local f57_local2 = self
	self:setUseStencil( true )
	local ListBlur = nil
	
	ListBlur = LUI.UIBlur.new()
	ListBlur.id = "ListBlur"
	ListBlur:SetRGBFromInt( 12566463, 0 )
	ListBlur:SetBlurStrength( 2.75, 0 )
	ListBlur:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 490, _1080p * 310, _1080p * 878 )
	self:addElement( ListBlur )
	self.ListBlur = ListBlur
	
	local RigButton = nil
	
	RigButton = MenuBuilder.BuildRegisteredType( "RigButton", {
		controllerIndex = f57_local1
	} )
	RigButton.id = "RigButton"
	RigButton.buttonDescription = Engine.Localize( "LUA_MENU_MP_LOADOUT_SELECT_COMBAT_RIG" )
	RigButton.FrameLabel:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_CHANGE_RIG" ) ), 0 )
	RigButton:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 490, _1080p * 225, _1080p * 385 )
	self:addElement( RigButton )
	self.RigButton = RigButton
	
	local LoadoutList = nil
	
	LoadoutList = MenuBuilder.BuildRegisteredType( "LoadoutList", {
		controllerIndex = f57_local1
	} )
	LoadoutList.id = "LoadoutList"
	LoadoutList:SetDataSourceThroughElement( self, nil )
	LoadoutList:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 490, _1080p * 398.5, _1080p * 752.5 )
	self:addElement( LoadoutList )
	self.LoadoutList = LoadoutList
	
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f57_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local CACLoadoutWrapper = nil
	
	CACLoadoutWrapper = MenuBuilder.BuildRegisteredType( "CACLoadoutWrapper", {
		controllerIndex = f57_local1
	} )
	CACLoadoutWrapper.id = "CACLoadoutWrapper"
	CACLoadoutWrapper:SetDotPitchEnabled( true )
	CACLoadoutWrapper:SetDotPitchX( 0, 0 )
	CACLoadoutWrapper:SetDotPitchY( 0, 0 )
	CACLoadoutWrapper:SetDotPitchContrast( 0, 0 )
	CACLoadoutWrapper:SetDotPitchMode( 0 )
	CACLoadoutWrapper:SetDataSourceThroughElement( LoadoutList.Loadouts, nil )
	CACLoadoutWrapper.CACLoadout.WeaponOne.Background:SetAlpha( 0.3, 0 )
	CACLoadoutWrapper.CACLoadout.WeaponTwo.Background:SetAlpha( 0.3, 0 )
	CACLoadoutWrapper.CACLoadout.PerkOne.Background:SetAlpha( 0.3, 0 )
	CACLoadoutWrapper.CACLoadout.PerkTwo.Background:SetAlpha( 0.3, 0 )
	CACLoadoutWrapper.CACLoadout.PerkThree.Background:SetAlpha( 0.3, 0 )
	CACLoadoutWrapper.CACLoadout.Equipment.PowerSlotTwo.Background:SetAlpha( 0.3, 0 )
	CACLoadoutWrapper.CACLoadout.Equipment.PowerSlotOne.Background:SetAlpha( 0.3, 0 )
	CACLoadoutWrapper:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 550, _1080p * 1140, _1080p * 248, _1080p * 878 )
	self:addElement( CACLoadoutWrapper )
	self.CACLoadoutWrapper = CACLoadoutWrapper
	
	local PickPoints = nil
	
	PickPoints = MenuBuilder.BuildRegisteredType( "PickPoints", {
		controllerIndex = f57_local1
	} )
	PickPoints.id = "PickPoints"
	PickPoints:SetDotPitchEnabled( true )
	PickPoints:SetDotPitchX( 0, 0 )
	PickPoints:SetDotPitchY( 0, 0 )
	PickPoints:SetDotPitchContrast( 0, 0 )
	PickPoints:SetDotPitchMode( 0 )
	PickPoints:SetDataSourceThroughElement( LoadoutList.Loadouts, nil )
	PickPoints:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 550, _1080p * 1140, _1080p * 216, _1080p * 242 )
	self:addElement( PickPoints )
	self.PickPoints = PickPoints
	
	local MenuTitle = nil
	
	MenuTitle = MenuBuilder.BuildRegisteredType( "MenuTitle", {
		controllerIndex = f57_local1
	} )
	MenuTitle.id = "MenuTitle"
	MenuTitle.MenuTitle:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_LOADOUT_SELECT" ) ), 0 )
	MenuTitle.MenuBreadcrumbs:setText( ToUpperCase( Engine.Localize( "MENU_MULTIPLAYER" ) ), 0 )
	MenuTitle.Icon:SetTop( _1080p * -28.5, 0 )
	MenuTitle.Icon:SetBottom( _1080p * 61.5, 0 )
	MenuTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
	self:addElement( MenuTitle )
	self.MenuTitle = MenuTitle
	
	local ItemDescription = nil
	
	ItemDescription = MenuBuilder.BuildRegisteredType( "LoadoutSelectHeader", {
		controllerIndex = f57_local1
	} )
	ItemDescription.id = "ItemDescription"
	ItemDescription:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1930, _1080p * 3114, _1080p * 216, _1080p * 966 )
	self:addElement( ItemDescription )
	self.ItemDescription = ItemDescription
	
	local FramedStreaks = nil
	
	FramedStreaks = MenuBuilder.BuildRegisteredType( "FramedStreaks", {
		controllerIndex = f57_local1
	} )
	FramedStreaks.id = "FramedStreaks"
	FramedStreaks.buttonDescription = Engine.Localize( "LUA_MENU_MP_LOADOUTS_SCORESTREAK" )
	FramedStreaks.FrameLabel:setText( ToUpperCase( Engine.Localize( "LUA_MENU_SCORESTREAKS" ) ), 0 )
	FramedStreaks:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 490, _1080p * 766, _1080p * 878 )
	self:addElement( FramedStreaks )
	self.FramedStreaks = FramedStreaks
	
	local ScorestreakPreview = nil
	
	ScorestreakPreview = MenuBuilder.BuildRegisteredType( "ScorestreakPreview", {
		controllerIndex = f57_local1
	} )
	ScorestreakPreview.id = "ScorestreakPreview"
	ScorestreakPreview:SetAlpha( 0, 0 )
	ScorestreakPreview:SetDotPitchEnabled( true )
	ScorestreakPreview:SetDotPitchX( 0, 0 )
	ScorestreakPreview:SetDotPitchY( 0, 0 )
	ScorestreakPreview:SetDotPitchContrast( 0, 0 )
	ScorestreakPreview:SetDotPitchMode( 0 )
	ScorestreakPreview:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 550, _1080p * 915, _1080p * 332.5, _1080p * 793.5 )
	self:addElement( ScorestreakPreview )
	self.ScorestreakPreview = ScorestreakPreview
	
	local RigPreview = nil
	
	RigPreview = MenuBuilder.BuildRegisteredType( "RigPreview", {
		controllerIndex = f57_local1
	} )
	RigPreview.id = "RigPreview"
	RigPreview:SetAlpha( 0, 0 )
	RigPreview:SetDotPitchEnabled( true )
	RigPreview:SetDotPitchX( 0, 0 )
	RigPreview:SetDotPitchY( 0, 0 )
	RigPreview:SetDotPitchContrast( 0, 0 )
	RigPreview:SetDotPitchMode( 0 )
	RigPreview:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 550, _1080p * 915, _1080p * 332.5, _1080p * 642.5 )
	self:addElement( RigPreview )
	self.RigPreview = RigPreview
	
	local SocialFeed = nil
	
	SocialFeed = MenuBuilder.BuildRegisteredType( "SocialFeed", {
		controllerIndex = f57_local1
	} )
	SocialFeed.id = "SocialFeed"
	SocialFeed:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -115, _1080p * -85 )
	self:addElement( SocialFeed )
	self.SocialFeed = SocialFeed
	
	local UnlockCriteria = nil
	
	UnlockCriteria = MenuBuilder.BuildRegisteredType( "UnlockCriteria", {
		controllerIndex = f57_local1
	} )
	UnlockCriteria.id = "UnlockCriteria"
	UnlockCriteria:SetAlpha( 0, 0 )
	UnlockCriteria.UnlockDesc:SetRight( _1080p * 340, 0 )
	UnlockCriteria:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 550, _1080p * 893, _1080p * 213, _1080p * 245 )
	UnlockCriteria:SubscribeToModelThroughElement( LoadoutList.Loadouts, "index", function ()
		local f58_local0 = LoadoutList.Loadouts:GetDataSource()
		f58_local0 = f58_local0.index:GetValue( f57_local1 )
		if f58_local0 ~= nil then
			UnlockCriteria.UnlockDesc:setText( GetLoadoutUnlockText( f58_local0 ), 0 )
		end
	end )
	self:addElement( UnlockCriteria )
	self.UnlockCriteria = UnlockCriteria
	
	local MissionTeamInfo = nil
	
	MissionTeamInfo = MenuBuilder.BuildRegisteredType( "MissionTeamInfo", {
		controllerIndex = f57_local1
	} )
	MissionTeamInfo.id = "MissionTeamInfo"
	MissionTeamInfo:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * 494, _1080p * 1194, _1080p * 54, _1080p * 142 )
	self:addElement( MissionTeamInfo )
	self.MissionTeamInfo = MissionTeamInfo
	
	local ButtonDescription = nil
	
	ButtonDescription = MenuBuilder.BuildRegisteredType( "ButtonDescriptionText", {
		controllerIndex = f57_local1
	} )
	ButtonDescription.id = "ButtonDescription"
	ButtonDescription.Description:SetRight( _1080p * 360, 0 )
	ButtonDescription:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 490, _1080p * 883, _1080p * 953 )
	self:addElement( ButtonDescription )
	self.ButtonDescription = ButtonDescription
	
	local f57_local18 = nil
	if CONDITIONS.IsPublicMatch( self ) then
		f57_local18 = MenuBuilder.BuildRegisteredType( "CRMMain", {
			controllerIndex = f57_local1
		} )
		f57_local18.id = "CRMMain"
		f57_local18:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 136, _1080p * 447, _1080p * 745, _1080p * 1069 )
		self:addElement( f57_local18 )
		self.CRMMain = f57_local18
	end
	local WeaponRotator = nil
	
	WeaponRotator = MenuBuilder.BuildRegisteredType( "WeaponRotator", {
		controllerIndex = f57_local1
	} )
	WeaponRotator.id = "WeaponRotator"
	WeaponRotator:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 745, _1080p * 1790, _1080p * 348.5, _1080p * 907 )
	self:addElement( WeaponRotator )
	self.WeaponRotator = WeaponRotator
	
	local f57_local20 = nil
	if CONDITIONS.IsDraftEnabled( self ) then
		f57_local20 = MenuBuilder.BuildRegisteredType( "LoadoutDraftTimer", {
			controllerIndex = f57_local1
		} )
		f57_local20.id = "LoadoutDraftTimer"
		f57_local20:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -150, _1080p * 150, 0, _1080p * 64 )
		self:addElement( f57_local20 )
		self.LoadoutDraftTimer = f57_local20
	end
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		ListBlur:RegisterAnimationSequence( "OpenLoadoutEdit", {
			{
				function ()
					return self.ListBlur:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 490, _1080p * 310, _1080p * 878, 0 )
				end,
				function ()
					return self.ListBlur:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -393, _1080p * -33, _1080p * 310, _1080p * 878, 100, LUI.EASING.outQuadratic )
				end
			}
		} )
		RigButton:RegisterAnimationSequence( "OpenLoadoutEdit", {
			{
				function ()
					return self.RigButton:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 490, _1080p * 225, _1080p * 385, 0 )
				end,
				function ()
					return self.RigButton:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -393, _1080p * -33, _1080p * 225, _1080p * 385, 100, LUI.EASING.outQuadratic )
				end
			}
		} )
		LoadoutList:RegisterAnimationSequence( "OpenLoadoutEdit", {
			{
				function ()
					return self.LoadoutList:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 490, _1080p * 398.5, _1080p * 752.5, 0 )
				end,
				function ()
					return self.LoadoutList:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -393, _1080p * -33, _1080p * 398.5, _1080p * 752.5, 100, LUI.EASING.outQuadratic )
				end
			}
		} )
		CACLoadoutWrapper:RegisterAnimationSequence( "OpenLoadoutEdit", {
			{
				function ()
					return self.CACLoadoutWrapper:SetAlpha( 1, 0 )
				end,
				function ()
					return self.CACLoadoutWrapper:SetAlpha( 1, 100, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.CACLoadoutWrapper.CACLoadout.WeaponOne.Background:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.CACLoadoutWrapper.CACLoadout.WeaponTwo.Background:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.CACLoadoutWrapper.CACLoadout.PerkOne.Background:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.CACLoadoutWrapper.CACLoadout.PerkTwo.Background:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.CACLoadoutWrapper.CACLoadout.PerkThree.Background:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.CACLoadoutWrapper.CACLoadout.Equipment.PowerSlotOne.Background:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.CACLoadoutWrapper.CACLoadout.Equipment.PowerSlotTwo.Background:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.CACLoadoutWrapper:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 550, _1080p * 1140, _1080p * 248, _1080p * 878, 0 )
				end,
				function ()
					return self.CACLoadoutWrapper:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 720, _1080p * 248, _1080p * 878, 100, LUI.EASING.outQuadratic )
				end
			}
		} )
		PickPoints:RegisterAnimationSequence( "OpenLoadoutEdit", {
			{
				function ()
					return self.PickPoints:SetAlpha( 1, 0 )
				end,
				function ()
					return self.PickPoints:SetAlpha( 1, 100, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.PickPoints:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 550, _1080p * 1140, _1080p * 216, _1080p * 242, 0 )
				end,
				function ()
					return self.PickPoints:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 720, _1080p * 216, _1080p * 242, 100, LUI.EASING.outQuadratic )
				end
			}
		} )
		ItemDescription:RegisterAnimationSequence( "OpenLoadoutEdit", {
			{
				function ()
					return self.ItemDescription:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1930, _1080p * 3114, _1080p * 216, _1080p * 966, 0 )
				end,
				function ()
					return self.ItemDescription:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 736, _1080p * 1920, _1080p * 216, _1080p * 966, 100, LUI.EASING.outQuadratic )
				end
			}
		} )
		FramedStreaks:RegisterAnimationSequence( "OpenLoadoutEdit", {
			{
				function ()
					return self.FramedStreaks:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 490, _1080p * 766, _1080p * 878, 0 )
				end,
				function ()
					return self.FramedStreaks:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -393, _1080p * -33, _1080p * 766, _1080p * 878, 100, LUI.EASING.outQuadratic )
				end
			}
		} )
		ScorestreakPreview:RegisterAnimationSequence( "OpenLoadoutEdit", {
			{
				function ()
					return self.ScorestreakPreview:SetAlpha( 0, 0 )
				end
			}
		} )
		RigPreview:RegisterAnimationSequence( "OpenLoadoutEdit", {
			{
				function ()
					return self.RigPreview:SetAlpha( 0, 0 )
				end
			}
		} )
		MissionTeamInfo:RegisterAnimationSequence( "OpenLoadoutEdit", {
			{
				function ()
					return self.MissionTeamInfo:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * 494, _1080p * 1194, _1080p * 54, _1080p * 142, 0 )
				end,
				function ()
					return self.MissionTeamInfo:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -700, 0, _1080p * 54, _1080p * 142, 100, LUI.EASING.outQuadratic )
				end
			}
		} )
		self._sequences.OpenLoadoutEdit = function ()
			ListBlur:AnimateSequence( "OpenLoadoutEdit" )
			RigButton:AnimateSequence( "OpenLoadoutEdit" )
			LoadoutList:AnimateSequence( "OpenLoadoutEdit" )
			CACLoadoutWrapper:AnimateSequence( "OpenLoadoutEdit" )
			PickPoints:AnimateSequence( "OpenLoadoutEdit" )
			ItemDescription:AnimateSequence( "OpenLoadoutEdit" )
			FramedStreaks:AnimateSequence( "OpenLoadoutEdit" )
			ScorestreakPreview:AnimateSequence( "OpenLoadoutEdit" )
			RigPreview:AnimateSequence( "OpenLoadoutEdit" )
			MissionTeamInfo:AnimateSequence( "OpenLoadoutEdit" )
		end
		
		ListBlur:RegisterAnimationSequence( "CloseLoadoutEdit", {
			{
				function ()
					return self.ListBlur:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -393, _1080p * -33, _1080p * 310, _1080p * 878, 0 )
				end,
				function ()
					return self.ListBlur:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 490, _1080p * 310, _1080p * 878, 100, LUI.EASING.outQuadratic )
				end
			}
		} )
		RigButton:RegisterAnimationSequence( "CloseLoadoutEdit", {
			{
				function ()
					return self.RigButton:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -393, _1080p * -33, _1080p * 225, _1080p * 385, 0 )
				end,
				function ()
					return self.RigButton:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 490, _1080p * 225, _1080p * 385, 100, LUI.EASING.outQuadratic )
				end
			}
		} )
		LoadoutList:RegisterAnimationSequence( "CloseLoadoutEdit", {
			{
				function ()
					return self.LoadoutList:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -393, _1080p * -33, _1080p * 398.5, _1080p * 752.5, 0 )
				end,
				function ()
					return self.LoadoutList:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 490, _1080p * 398.5, _1080p * 752.5, 100, LUI.EASING.outQuadratic )
				end
			}
		} )
		CACLoadoutWrapper:RegisterAnimationSequence( "CloseLoadoutEdit", {
			{
				function ()
					return self.CACLoadoutWrapper:SetAlpha( 1, 0 )
				end,
				function ()
					return self.CACLoadoutWrapper:SetAlpha( 0.9, 100, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.CACLoadoutWrapper.CACLoadout.WeaponOne.Background:SetAlpha( 0.15, 0 )
				end,
				function ()
					return self.CACLoadoutWrapper.CACLoadout.WeaponOne.Background:SetAlpha( 0.3, 100, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.CACLoadoutWrapper.CACLoadout.WeaponTwo.Background:SetAlpha( 0.15, 0 )
				end,
				function ()
					return self.CACLoadoutWrapper.CACLoadout.WeaponTwo.Background:SetAlpha( 0.3, 100, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.CACLoadoutWrapper.CACLoadout.PerkOne.Background:SetAlpha( 0.15, 0 )
				end,
				function ()
					return self.CACLoadoutWrapper.CACLoadout.PerkOne.Background:SetAlpha( 0.3, 100, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.CACLoadoutWrapper.CACLoadout.PerkTwo.Background:SetAlpha( 0.15, 0 )
				end,
				function ()
					return self.CACLoadoutWrapper.CACLoadout.PerkTwo.Background:SetAlpha( 0.3, 100, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.CACLoadoutWrapper.CACLoadout.PerkThree.Background:SetAlpha( 0.15, 0 )
				end,
				function ()
					return self.CACLoadoutWrapper.CACLoadout.PerkThree.Background:SetAlpha( 0.3, 100, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.CACLoadoutWrapper.CACLoadout.Equipment.PowerSlotOne.Background:SetAlpha( 0.15, 0 )
				end,
				function ()
					return self.CACLoadoutWrapper.CACLoadout.Equipment.PowerSlotOne.Background:SetAlpha( 0.3, 100, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.CACLoadoutWrapper.CACLoadout.Equipment.PowerSlotTwo.Background:SetAlpha( 0.15, 0 )
				end,
				function ()
					return self.CACLoadoutWrapper.CACLoadout.Equipment.PowerSlotTwo.Background:SetAlpha( 0.3, 100, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.CACLoadoutWrapper:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 720, _1080p * 248, _1080p * 878, 0 )
				end,
				function ()
					return self.CACLoadoutWrapper:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 550, _1080p * 1140, _1080p * 248, _1080p * 878, 100, LUI.EASING.outQuadratic )
				end
			}
		} )
		PickPoints:RegisterAnimationSequence( "CloseLoadoutEdit", {
			{
				function ()
					return self.PickPoints:SetAlpha( 1, 0 )
				end,
				function ()
					return self.PickPoints:SetAlpha( 0.9, 100, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.PickPoints:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 720, _1080p * 216, _1080p * 242, 0 )
				end,
				function ()
					return self.PickPoints:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 550, _1080p * 1140, _1080p * 216, _1080p * 242, 100, LUI.EASING.outQuadratic )
				end
			}
		} )
		ItemDescription:RegisterAnimationSequence( "CloseLoadoutEdit", {
			{
				function ()
					return self.ItemDescription:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 736, _1080p * 1920, _1080p * 216, _1080p * 966, 0 )
				end,
				function ()
					return self.ItemDescription:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1930, _1080p * 3114, _1080p * 216, _1080p * 966, 100, LUI.EASING.outQuadratic )
				end
			}
		} )
		FramedStreaks:RegisterAnimationSequence( "CloseLoadoutEdit", {
			{
				function ()
					return self.FramedStreaks:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -393, _1080p * -33, _1080p * 769, _1080p * 878, 0 )
				end,
				function ()
					return self.FramedStreaks:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 490, _1080p * 766, _1080p * 878, 100, LUI.EASING.outQuadratic )
				end
			}
		} )
		ScorestreakPreview:RegisterAnimationSequence( "CloseLoadoutEdit", {
			{
				function ()
					return self.ScorestreakPreview:SetAlpha( 0, 0 )
				end
			}
		} )
		RigPreview:RegisterAnimationSequence( "CloseLoadoutEdit", {
			{
				function ()
					return self.RigPreview:SetAlpha( 0, 0 )
				end
			}
		} )
		MissionTeamInfo:RegisterAnimationSequence( "CloseLoadoutEdit", {
			{
				function ()
					return self.MissionTeamInfo:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -700, 0, _1080p * 54, _1080p * 142, 0 )
				end,
				function ()
					return self.MissionTeamInfo:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * 494, _1080p * 1194, _1080p * 54, _1080p * 142, 100, LUI.EASING.outQuadratic )
				end
			}
		} )
		self._sequences.CloseLoadoutEdit = function ()
			ListBlur:AnimateSequence( "CloseLoadoutEdit" )
			RigButton:AnimateSequence( "CloseLoadoutEdit" )
			LoadoutList:AnimateSequence( "CloseLoadoutEdit" )
			CACLoadoutWrapper:AnimateSequence( "CloseLoadoutEdit" )
			PickPoints:AnimateSequence( "CloseLoadoutEdit" )
			ItemDescription:AnimateSequence( "CloseLoadoutEdit" )
			FramedStreaks:AnimateSequence( "CloseLoadoutEdit" )
			ScorestreakPreview:AnimateSequence( "CloseLoadoutEdit" )
			RigPreview:AnimateSequence( "CloseLoadoutEdit" )
			MissionTeamInfo:AnimateSequence( "CloseLoadoutEdit" )
		end
		
		ListBlur:RegisterAnimationSequence( "OpenedLoadoutEdit", {
			{
				function ()
					return self.ListBlur:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -393, _1080p * -33, _1080p * 310, _1080p * 878, 0 )
				end
			}
		} )
		RigButton:RegisterAnimationSequence( "OpenedLoadoutEdit", {
			{
				function ()
					return self.RigButton:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -393, _1080p * -33, _1080p * 225, _1080p * 385, 0 )
				end
			}
		} )
		LoadoutList:RegisterAnimationSequence( "OpenedLoadoutEdit", {
			{
				function ()
					return self.LoadoutList:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -393, _1080p * -33, _1080p * 398.5, _1080p * 752.5, 0 )
				end
			}
		} )
		CACLoadoutWrapper:RegisterAnimationSequence( "OpenedLoadoutEdit", {
			{
				function ()
					return self.CACLoadoutWrapper.CACLoadout.Equipment.PowerSlotTwo.Background:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.CACLoadoutWrapper.CACLoadout.Equipment.PowerSlotOne.Background:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.CACLoadoutWrapper.CACLoadout.PerkThree.Background:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.CACLoadoutWrapper.CACLoadout.PerkTwo.Background:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.CACLoadoutWrapper.CACLoadout.PerkOne.Background:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.CACLoadoutWrapper.CACLoadout.WeaponTwo.Background:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.CACLoadoutWrapper.CACLoadout.WeaponOne.Background:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.CACLoadoutWrapper:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 720, _1080p * 248, _1080p * 878, 0 )
				end
			}
		} )
		PickPoints:RegisterAnimationSequence( "OpenedLoadoutEdit", {
			{
				function ()
					return self.PickPoints:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 720, _1080p * 216, _1080p * 242, 0 )
				end
			}
		} )
		ItemDescription:RegisterAnimationSequence( "OpenedLoadoutEdit", {
			{
				function ()
					return self.ItemDescription:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 736, _1080p * 1920, _1080p * 216, _1080p * 966, 0 )
				end
			}
		} )
		FramedStreaks:RegisterAnimationSequence( "OpenedLoadoutEdit", {
			{
				function ()
					return self.FramedStreaks:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -393, _1080p * -33, _1080p * 769, _1080p * 878, 0 )
				end
			}
		} )
		ScorestreakPreview:RegisterAnimationSequence( "OpenedLoadoutEdit", {
			{
				function ()
					return self.ScorestreakPreview:SetAlpha( 0, 0 )
				end
			}
		} )
		RigPreview:RegisterAnimationSequence( "OpenedLoadoutEdit", {
			{
				function ()
					return self.RigPreview:SetAlpha( 0, 0 )
				end
			}
		} )
		MissionTeamInfo:RegisterAnimationSequence( "OpenedLoadoutEdit", {
			{
				function ()
					return self.MissionTeamInfo:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -700, 0, _1080p * 54, _1080p * 142, 0 )
				end
			}
		} )
		self._sequences.OpenedLoadoutEdit = function ()
			ListBlur:AnimateSequence( "OpenedLoadoutEdit" )
			RigButton:AnimateSequence( "OpenedLoadoutEdit" )
			LoadoutList:AnimateSequence( "OpenedLoadoutEdit" )
			CACLoadoutWrapper:AnimateSequence( "OpenedLoadoutEdit" )
			PickPoints:AnimateSequence( "OpenedLoadoutEdit" )
			ItemDescription:AnimateSequence( "OpenedLoadoutEdit" )
			FramedStreaks:AnimateSequence( "OpenedLoadoutEdit" )
			ScorestreakPreview:AnimateSequence( "OpenedLoadoutEdit" )
			RigPreview:AnimateSequence( "OpenedLoadoutEdit" )
			MissionTeamInfo:AnimateSequence( "OpenedLoadoutEdit" )
		end
		
		CACLoadoutWrapper:RegisterAnimationSequence( "HideLoadout", {
			{
				function ()
					return self.CACLoadoutWrapper:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.CACLoadoutWrapper:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 550, _1080p * 1140, _1080p * 248, _1080p * 878, 0 )
				end
			}
		} )
		PickPoints:RegisterAnimationSequence( "HideLoadout", {
			{
				function ()
					return self.PickPoints:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.PickPoints:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 550, _1080p * 1140, _1080p * 216, _1080p * 242, 0 )
				end
			}
		} )
		self._sequences.HideLoadout = function ()
			CACLoadoutWrapper:AnimateSequence( "HideLoadout" )
			PickPoints:AnimateSequence( "HideLoadout" )
		end
		
		CACLoadoutWrapper:RegisterAnimationSequence( "HideLoadoutAndRig", {
			{
				function ()
					return self.CACLoadoutWrapper:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.CACLoadoutWrapper:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 550, _1080p * 1140, _1080p * 248, _1080p * 878, 0 )
				end
			}
		} )
		PickPoints:RegisterAnimationSequence( "HideLoadoutAndRig", {
			{
				function ()
					return self.PickPoints:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.PickPoints:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 550, _1080p * 1140, _1080p * 216, _1080p * 242, 0 )
				end
			}
		} )
		self._sequences.HideLoadoutAndRig = function ()
			CACLoadoutWrapper:AnimateSequence( "HideLoadoutAndRig" )
			PickPoints:AnimateSequence( "HideLoadoutAndRig" )
		end
		
		CACLoadoutWrapper:RegisterAnimationSequence( "ShowLoadoutAndRig", {
			{
				function ()
					return self.CACLoadoutWrapper:SetAlpha( 0, 0, LUI.EASING.inQuadratic )
				end,
				function ()
					return self.CACLoadoutWrapper:SetAlpha( 1, 150, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.CACLoadoutWrapper:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 600, _1080p * 1190, _1080p * 248, _1080p * 878, 0, LUI.EASING.inQuadratic )
				end,
				function ()
					return self.CACLoadoutWrapper:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 550, _1080p * 1140, _1080p * 248, _1080p * 878, 150, LUI.EASING.outQuadratic )
				end
			}
		} )
		PickPoints:RegisterAnimationSequence( "ShowLoadoutAndRig", {
			{
				function ()
					return self.PickPoints:SetAlpha( 0, 0, LUI.EASING.inQuadratic )
				end,
				function ()
					return self.PickPoints:SetAlpha( 1, 150, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.PickPoints:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 600, _1080p * 1190, _1080p * 216, _1080p * 242, 0, LUI.EASING.inQuadratic )
				end,
				function ()
					return self.PickPoints:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 550, _1080p * 1140, _1080p * 216, _1080p * 242, 150, LUI.EASING.outQuadratic )
				end
			}
		} )
		ScorestreakPreview:RegisterAnimationSequence( "ShowLoadoutAndRig", {
			{
				function ()
					return self.ScorestreakPreview:SetAlpha( 0, 0 )
				end
			}
		} )
		RigPreview:RegisterAnimationSequence( "ShowLoadoutAndRig", {
			{
				function ()
					return self.RigPreview:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.ShowLoadoutAndRig = function ()
			CACLoadoutWrapper:AnimateSequence( "ShowLoadoutAndRig" )
			PickPoints:AnimateSequence( "ShowLoadoutAndRig" )
			ScorestreakPreview:AnimateSequence( "ShowLoadoutAndRig" )
			RigPreview:AnimateSequence( "ShowLoadoutAndRig" )
		end
		
		RigButton:RegisterAnimationSequence( "ShowRigPreview", {
			{
				function ()
					return self.RigButton:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 490, _1080p * 225, _1080p * 385, 0 )
				end
			}
		} )
		CACLoadoutWrapper:RegisterAnimationSequence( "ShowRigPreview", {
			{
				function ()
					return self.CACLoadoutWrapper:SetAlpha( 0, 0 )
				end
			}
		} )
		PickPoints:RegisterAnimationSequence( "ShowRigPreview", {
			{
				function ()
					return self.PickPoints:SetAlpha( 0, 0 )
				end
			}
		} )
		ScorestreakPreview:RegisterAnimationSequence( "ShowRigPreview", {
			{
				function ()
					return self.ScorestreakPreview:SetAlpha( 0, 0 )
				end
			}
		} )
		RigPreview:RegisterAnimationSequence( "ShowRigPreview", {
			{
				function ()
					return self.RigPreview:SetAlpha( 0, 0 )
				end,
				function ()
					return self.RigPreview:SetAlpha( 1, 150, LUI.EASING.inQuadratic )
				end
			},
			{
				function ()
					return self.RigPreview:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 600, _1080p * 965, _1080p * 332.5, _1080p * 642.5, 0 )
				end,
				function ()
					return self.RigPreview:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 550, _1080p * 915, _1080p * 332.5, _1080p * 642.5, 150, LUI.EASING.inQuadratic )
				end
			}
		} )
		UnlockCriteria:RegisterAnimationSequence( "ShowRigPreview", {
			{
				function ()
					return self.UnlockCriteria:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.ShowRigPreview = function ()
			RigButton:AnimateSequence( "ShowRigPreview" )
			CACLoadoutWrapper:AnimateSequence( "ShowRigPreview" )
			PickPoints:AnimateSequence( "ShowRigPreview" )
			ScorestreakPreview:AnimateSequence( "ShowRigPreview" )
			RigPreview:AnimateSequence( "ShowRigPreview" )
			UnlockCriteria:AnimateSequence( "ShowRigPreview" )
		end
		
		CACLoadoutWrapper:RegisterAnimationSequence( "ShowScoreStreakPreview", {
			{
				function ()
					return self.CACLoadoutWrapper:SetAlpha( 0, 0 )
				end
			}
		} )
		PickPoints:RegisterAnimationSequence( "ShowScoreStreakPreview", {
			{
				function ()
					return self.PickPoints:SetAlpha( 0, 0 )
				end
			}
		} )
		ScorestreakPreview:RegisterAnimationSequence( "ShowScoreStreakPreview", {
			{
				function ()
					return self.ScorestreakPreview:SetAlpha( 0, 0 )
				end,
				function ()
					return self.ScorestreakPreview:SetAlpha( 1, 150, LUI.EASING.inQuadratic )
				end
			},
			{
				function ()
					return self.ScorestreakPreview:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 600, _1080p * 965, _1080p * 332.5, _1080p * 793.5, 0 )
				end,
				function ()
					return self.ScorestreakPreview:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 550, _1080p * 915, _1080p * 332.5, _1080p * 793.5, 150, LUI.EASING.inQuadratic )
				end
			}
		} )
		RigPreview:RegisterAnimationSequence( "ShowScoreStreakPreview", {
			{
				function ()
					return self.RigPreview:SetAlpha( 0, 0 )
				end
			}
		} )
		UnlockCriteria:RegisterAnimationSequence( "ShowScoreStreakPreview", {
			{
				function ()
					return self.UnlockCriteria:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.ShowScoreStreakPreview = function ()
			CACLoadoutWrapper:AnimateSequence( "ShowScoreStreakPreview" )
			PickPoints:AnimateSequence( "ShowScoreStreakPreview" )
			ScorestreakPreview:AnimateSequence( "ShowScoreStreakPreview" )
			RigPreview:AnimateSequence( "ShowScoreStreakPreview" )
			UnlockCriteria:AnimateSequence( "ShowScoreStreakPreview" )
		end
		
		CACLoadoutWrapper:RegisterAnimationSequence( "LoadoutLocked", {
			{
				function ()
					return self.CACLoadoutWrapper:SetAlpha( 0.8, 0 )
				end
			}
		} )
		PickPoints:RegisterAnimationSequence( "LoadoutLocked", {
			{
				function ()
					return self.PickPoints:SetAlpha( 0, 0 )
				end
			}
		} )
		ScorestreakPreview:RegisterAnimationSequence( "LoadoutLocked", {
			{
				function ()
					return self.ScorestreakPreview:SetAlpha( 0, 0 )
				end
			}
		} )
		RigPreview:RegisterAnimationSequence( "LoadoutLocked", {
			{
				function ()
					return self.RigPreview:SetAlpha( 0, 0 )
				end
			}
		} )
		UnlockCriteria:RegisterAnimationSequence( "LoadoutLocked", {
			{
				function ()
					return self.UnlockCriteria:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.LoadoutLocked = function ()
			CACLoadoutWrapper:AnimateSequence( "LoadoutLocked" )
			PickPoints:AnimateSequence( "LoadoutLocked" )
			ScorestreakPreview:AnimateSequence( "LoadoutLocked" )
			RigPreview:AnimateSequence( "LoadoutLocked" )
			UnlockCriteria:AnimateSequence( "LoadoutLocked" )
		end
		
		CACLoadoutWrapper:RegisterAnimationSequence( "LoadoutUnlocked", {
			{
				function ()
					return self.CACLoadoutWrapper:SetAlpha( 1, 0 )
				end
			}
		} )
		PickPoints:RegisterAnimationSequence( "LoadoutUnlocked", {
			{
				function ()
					return self.PickPoints:SetAlpha( 1, 0 )
				end
			}
		} )
		ScorestreakPreview:RegisterAnimationSequence( "LoadoutUnlocked", {
			{
				function ()
					return self.ScorestreakPreview:SetAlpha( 0, 0 )
				end
			}
		} )
		RigPreview:RegisterAnimationSequence( "LoadoutUnlocked", {
			{
				function ()
					return self.RigPreview:SetAlpha( 0, 0 )
				end
			}
		} )
		UnlockCriteria:RegisterAnimationSequence( "LoadoutUnlocked", {
			{
				function ()
					return self.UnlockCriteria:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.LoadoutUnlocked = function ()
			CACLoadoutWrapper:AnimateSequence( "LoadoutUnlocked" )
			PickPoints:AnimateSequence( "LoadoutUnlocked" )
			ScorestreakPreview:AnimateSequence( "LoadoutUnlocked" )
			RigPreview:AnimateSequence( "LoadoutUnlocked" )
			UnlockCriteria:AnimateSequence( "LoadoutUnlocked" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	RigButton:addEventHandler( "gain_focus", function ( f198_arg0, f198_arg1 )
		local f198_local0 = f198_arg1.controller or f57_local1
		if not CONDITIONS.IsLoadoutEditOpen( f57_local2 ) then
			ACTIONS.RemoveLoadoutOptionPrompt( self, f198_local0 )
			ACTIONS.AnimateSequence( self, "ShowRigPreview" )
		end
	end )
	LoadoutList:addEventHandler( "gain_focus", function ( f199_arg0, f199_arg1 )
		local f199_local0 = f199_arg1.controller or f57_local1
		if not CONDITIONS.IsLoadoutEditOpen( f57_local2 ) then
			ACTIONS.AnimateSequence( self, "ShowLoadoutAndRig" )
			ACTIONS.AddLoadoutOptionPrompt( self, f199_local0 )
		end
	end )
	CACLoadoutWrapper.addButtonHelperFunction = function ( f200_arg0, f200_arg1 )
		if #f200_arg0:getAllFocusedChildren() > 0 or f200_arg0:isInFocus() then
			f200_arg0:AddButtonHelperText( {
				helper_text = Engine.Localize( "LUA_MENU_CLEAR" ),
				button_ref = "button_alt1",
				side = "left",
				priority = 2,
				clickable = true
			} )
		end
	end
	
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "CACLoadoutWrapperBindButton"
	CACLoadoutWrapper:addElement( bindButton )
	CACLoadoutWrapper.bindButton = bindButton
	
	CACLoadoutWrapper:addEventHandler( "gain_focus", function ( f201_arg0, f201_arg1 )
		local f201_local0 = f201_arg1.controller or f57_local1
		f201_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_CLEAR" ),
			button_ref = "button_alt1",
			side = "left",
			priority = 2,
			clickable = true
		} )
	end )
	CACLoadoutWrapper:addEventHandler( "lose_focus", function ( f202_arg0, f202_arg1 )
		local f202_local0 = f202_arg1.controller or f57_local1
		f202_arg0:RemoveButtonHelperText( "button_alt1", "left" )
		local f202_local1 = f202_arg0:getParent()
		while f202_local1 and not f202_local1.addButtonHelperFunction and f202_local1.id ~= f57_local2.id do
			f202_local1 = f202_local1:getParent()
		end
		if f202_local1 and f202_local1.addButtonHelperFunction then
			f202_local1.addButtonHelperFunction( f202_arg0, f202_arg1 )
		end
	end )
	FramedStreaks:addEventHandler( "button_action", function ( f203_arg0, f203_arg1 )
		ACTIONS.OpenStreakSelectMenu( self, self.FramedStreaks, f203_arg1.controller or f57_local1 )
	end )
	FramedStreaks:addEventHandler( "gain_focus", function ( f204_arg0, f204_arg1 )
		local f204_local0 = f204_arg1.controller or f57_local1
		if not CONDITIONS.IsLoadoutEditOpen( f57_local2 ) then
			ACTIONS.RemoveLoadoutOptionPrompt( self, f204_local0 )
			ACTIONS.AnimateSequence( self, "ShowScoreStreakPreview" )
		end
	end )
	LoadoutList:SetDataSourceThroughElement( self, nil )
	CACLoadoutWrapper:SetDataSourceThroughElement( LoadoutList.Loadouts, nil )
	PickPoints:SetDataSourceThroughElement( LoadoutList.Loadouts, nil )
	self.addButtonHelperFunction = function ( f205_arg0, f205_arg1 )
		f205_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_SELECT" ),
			button_ref = "button_primary",
			side = "left",
			clickable = true
		} )
	end
	
	self:addEventHandler( "menu_create", self.addButtonHelperFunction )
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	self:addEventHandler( "open_loadout_edit_menu", function ( f206_arg0, f206_arg1 )
		local f206_local0 = f206_arg1.controller or f57_local1
		ACTIONS.AnimateSequence( self, "OpenLoadoutEdit" )
		if CONDITIONS.IsPublicMatch( self ) then
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "CRMMain",
				sequenceName = "Opening",
				elementPath = "CRMMain"
			} )
		end
	end )
	self:addEventHandler( "close_loadout_edit_menu", function ( f207_arg0, f207_arg1 )
		local f207_local0 = f207_arg1.controller or f57_local1
		ACTIONS.AnimateSequence( self, "CloseLoadoutEdit" )
		ACTIONS.LoseFocus( self, "CACLoadoutWrapper", f207_local0 )
		ACTIONS.GainFocus( self, "LoadoutList", f207_local0 )
		ACTIONS.UploadStats( self, f207_local0 )
		ACTIONS.LoseFocus( self, "FramedStreaks", f207_local0 )
		if CONDITIONS.IsPublicMatch( self ) then
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "CRMMain",
				sequenceName = "Opening",
				elementPath = "CRMMain"
			} )
		end
	end )
	self:addEventHandler( "menu_create", function ( f208_arg0, f208_arg1 )
		ACTIONS.UploadStats( self, f208_arg1.controller or f57_local1 )
	end )
	self:SubscribeToModelThroughElement( LoadoutList.Loadouts, "isLoadoutLocked", function ()
		local f209_local0 = LoadoutList.Loadouts:GetDataSource()
		if f209_local0.isLoadoutLocked:GetValue( f57_local1 ) ~= nil then
			f209_local0 = LoadoutList.Loadouts:GetDataSource()
			if f209_local0.isLoadoutLocked:GetValue( f57_local1 ) == true then
				ACTIONS.AnimateSequence( self, "LoadoutLocked" )
			end
		end
		f209_local0 = LoadoutList.Loadouts:GetDataSource()
		if f209_local0.isLoadoutLocked:GetValue( f57_local1 ) ~= nil then
			f209_local0 = LoadoutList.Loadouts:GetDataSource()
			if f209_local0.isLoadoutLocked:GetValue( f57_local1 ) == false then
				ACTIONS.AnimateSequence( self, "LoadoutUnlocked" )
			end
		end
	end )
	PostLoadFunc( self, f57_local1, controller )
	if CONDITIONS.IsPublicMatch( self ) then
		ACTIONS.AnimateSequenceByElement( self, {
			elementName = "CRMMain",
			sequenceName = "Minimize",
			elementPath = "CRMMain"
		} )
	end
	return self
end

MenuBuilder.registerType( "LoadoutSelect", LoadoutSelect )
LUI.FlowManager.RegisterStackPopBehaviour( "LoadoutSelect", f0_local3 )
LockTable( _M )
