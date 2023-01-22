local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "frontEnd.MP.conquest.emblemEditor"
f0_local1 = "frontEnd.MP.conquest.Headquarters.callingCardEditors.smallPlayerCard"
f0_local2 = 20
local f0_local3 = 0
local f0_local4 = function ( f1_arg0, f1_arg1 )
	f1_arg0.SmallPlayerCard:SetDataSource( PlayercardUtils.GetFrontendDataSources( f0_local1, f1_arg1 ), f1_arg1 )
end

local f0_local5 = function ( f2_arg0, f2_arg1 )
	if Engine.GetDvarBool( "killswitch_custom_emblems" ) ~= true == true then
		
	else
		
	end
end

local f0_local6 = function ( f3_arg0, f3_arg1 )
	if f3_arg0.menuCreated then
		local f3_local0 = f3_arg0.EmblemsGrid:GetDataSource()
		if f3_local0 ~= nil then
			local f3_local1 = f3_local0.emblemIndex:GetValue( f3_arg1 )
			local f3_local2 = f3_local0.emblemId:GetValue( f3_arg1 )
			local f3_local3 = f3_local0.layerCount:GetValue( f3_arg1 )
			local f3_local4 = f3_local0.emblemName:GetValue( f3_arg1 )
			local f3_local5
			if Engine.GetDvarBool( "killswitch_custom_emblems" ) ~= true then
				f3_local5 = Engine.CanAccessCustomEmblemFeature()
			else
				f3_local5 = false
			end
			local f3_local6
			if f3_arg0.emblemsCount == nil or f3_arg0.emblemsCount <= 0 or f3_local3 == nil or f3_local3 <= 0 then
				f3_local6 = false
			else
				f3_local6 = true
			end
			local f3_local7 = f3_arg0.Tabs.Tabs:GetCurrentTabIndex()
			local f3_local8 = f3_arg0.tabNamesAndIDs[f3_arg0.Tabs.Tabs:GetCurrentTabIndex() + 1].id
			if f3_local6 then
				f3_arg0:AddButtonHelperText( {
					helper_text = Engine.Localize( "MP_EMBLEM_EDITOR_EQUIP" ),
					button_ref = "button_primary",
					side = "left",
					priority = 0,
					clickable = true
				} )
				local f3_local9 = function ()
					if not (f3_local8 ~= EmblemEditorUtils.TabIDs.CUSTOM or f3_local5 == true) or f3_local0.isLocked:GetValue( f3_arg1 ) then
						return 
					elseif f3_local8 ~= EmblemEditorUtils.TabIDs.CUSTOM then
						EmblemEditor.EquipPatch( f3_arg1, f3_local2 )
					else
						EmblemEditor.ClearEmblemThumbnailCache()
						EmblemEditor.EquipEmblem( f3_arg1, f3_local1 )
					end
				end
				
				f3_arg0.bindButton:registerEventHandler( "button_primary", function ( element, event )
					f3_local9()
				end )
				f3_arg0:registerEventHandler( "emblem_selection_alternate", function ( element, event )
					f3_local9()
				end )
				if f3_local8 == EmblemEditorUtils.TabIDs.CUSTOM and f3_local5 == true then
					f3_arg0.bindButton:registerEventHandler( "button_alt2", function ( element, event )
						local f7_local0 = LUI.FlowManager.GetScopedData( f3_arg0 )
						f7_local0.currentTab = f3_arg0.Tabs.Tabs:GetCurrentTabIndex()
						EmblemEditor.ClearAllLayers()
						EmblemEditor.EditEmblem( f3_local1 )
						EmblemEditorUtils.SelectedEmblem = f3_local1
						EmblemEditor.dirty = false
						LUI.FlowManager.RequestAddMenu( "EmblemEditorMenu", true, f3_arg1, false, {
							openingAction = "edit"
						} )
					end )
					f3_arg0:AddButtonHelperText( {
						helper_text = Engine.Localize( "MENU_OPTIONS" ),
						button_ref = "button_start",
						side = "left",
						priority = 100,
						clickable = true
					} )
					f3_arg0.bindButton:registerEventHandler( "button_start", function ( element, event )
						LUI.FlowManager.RequestPopupMenu( nil, "EmblemSelectOptionsPopup", true, event.controller or f3_arg1, false, {
							slotIndex = f0_local3,
							emblemName = f3_local4
						}, nil, false )
					end )
				else
					f3_arg0.bindButton:registerEventHandler( "button_alt2", nil )
					f3_arg0.bindButton:registerEventHandler( "button_start", nil )
					f3_arg0:RemoveButtonHelperText( "button_start", "left" )
				end
			else
				if f3_local8 == EmblemEditorUtils.TabIDs.CUSTOM and f3_local5 == true then
					f3_arg0:AddButtonHelperText( {
						helper_text = Engine.Localize( "MP_EMBLEM_EDITOR_CREATE_NEW" ),
						button_ref = "button_primary",
						side = "left",
						priority = 0,
						clickable = true
					} )
					local f3_local9 = function ()
						local f9_local0 = LUI.FlowManager.GetScopedData( f3_arg0 )
						f9_local0.currentTab = f3_arg0.Tabs.Tabs:GetCurrentTabIndex()
						if f3_arg0.emblemsCount - 1 < f3_arg0.totalSlots then
							EmblemEditor.ClearAllLayers()
							EmblemEditorUtils.SelectedEmblem = -1
							EmblemEditor.dirty = false
							LUI.FlowManager.RequestAddMenu( "EmblemEditorMenu", true, f3_arg1, false, {
								openingAction = "add"
							} )
						else
							LUI.FlowManager.RequestPopupMenu( f3_arg0, "EmblemSlotLimitReachedPopup", true, f3_arg1, false, {
								slotIndex = f0_local3,
								emblemName = f3_local4
							}, nil, false )
						end
					end
					
					f3_arg0.bindButton:registerEventHandler( "button_primary", function ( element, event )
						f3_local9()
					end )
					f3_arg0:registerEventHandler( "emblem_selection_alternate", function ( element, event )
						f3_local9()
					end )
				else
					f3_arg0.bindButton:registerEventHandler( "button_primary", nil )
					f3_arg0:registerEventHandler( "emblem_selection_alternate", nil )
					f3_arg0:RemoveButtonHelperText( "button_primary", "left" )
				end
				f3_arg0.bindButton:registerEventHandler( "button_alt2", nil )
				f3_arg0.bindButton:registerEventHandler( "button_start", nil )
				f3_arg0:RemoveButtonHelperText( "button_start", "left" )
			end
			f0_local5( f3_arg0, f3_arg1 )
		else
			f3_arg0.bindButton:registerEventHandler( "button_primary", nil )
			f3_arg0.bindButton:registerEventHandler( "button_start", nil )
			f3_arg0:registerEventHandler( "emblem_selection_alternate", nil )
			f3_arg0:RemoveButtonHelperText( "button_primary", "left" )
			f3_arg0:RemoveButtonHelperText( "button_start", "left" )
		end
	end
end

local f0_local7 = function ( f12_arg0 )
	local f12_local0 = nil
	if f12_arg0 == EmblemEditorUtils.TabIDs.CUSTOM then
		f12_local0 = f0_local0 .. ".custom."
	elseif f12_arg0 == EmblemEditorUtils.TabIDs.DEFAULT then
		f12_local0 = f0_local0 .. ".default."
	elseif f12_arg0 == EmblemEditorUtils.TabIDs.COMMUNITY then
		f12_local0 = f0_local0 .. ".community."
	elseif f12_arg0 == EmblemEditorUtils.TabIDs.ARMOURY then
		f12_local0 = f0_local0 .. ".armoury."
	elseif f12_arg0 == EmblemEditorUtils.TabIDs.EXTRA then
		f12_local0 = f0_local0 .. ".extra."
	elseif f12_arg0 == EmblemEditorUtils.TabIDs.MISSIONTEAM then
		f12_local0 = f0_local0 .. ".missionTeam."
	else
		assert( false )
	end
	return f12_local0
end

local f0_local8 = function ( f13_arg0, f13_arg1 )
	local f13_local0 = f13_arg0.Tabs.Tabs:GetCurrentTabIndex()
	local f13_local1 = f13_arg0.tabNamesAndIDs[f13_arg0.Tabs.Tabs:GetCurrentTabIndex() + 1].id
	local f13_local2 = f0_local7( f13_local1 )
	local f13_local3 = LUI.DataSourceInControllerModel.new( f13_local2 .. "count" )
	local f13_local4
	if f13_local3:GetValue( f13_arg1 ) ~= nil then
		f13_local4 = f13_local3:GetValue( f13_arg1 )
		if not f13_local4 then
		
		else
			f13_arg0.emblemsCount = f13_local4
			f13_local4 = LUI.DataSourceFromList.new( f13_local3 )
			f13_local4.MakeDataSourceAtIndex = function ( f14_arg0, f14_arg1, f14_arg2 )
				local f14_local0 = f13_local2 .. f14_arg1
				local f14_local1 = LUI.DataSourceInControllerModel.new( f14_local0 .. ".emblemName" )
				local f14_local2 = LUI.DataSourceInControllerModel.new( f14_local0 .. ".emblemIndex" )
				local f14_local3 = LUI.DataSourceInControllerModel.new( f14_local0 .. ".emblemType" )
				local f14_local4 = LUI.DataSourceInControllerModel.new( f14_local0 .. ".emblemImage" )
				local f14_local5 = LUI.DataSourceInControllerModel.new( f14_local0 .. ".emblemId" )
				local f14_local6 = false
				local f14_local7 = f14_local2:GetValue( f14_arg2 )
				local f14_local8 = Cac.LowestQuality
				if f13_local1 ~= EmblemEditorUtils.TabIDs.CUSTOM then
					local f14_local9 = f14_local5:GetValue( f14_arg2 )
					local f14_local10 = Engine.TableLookup( PatchesTable.File, PatchesTable.Cols.Ref, f14_local9, PatchesTable.Cols.Category )
					if f14_local10 == "loot" or f14_local10 == "extra" or f14_local10 == "missionTeam" then
						local f14_local11 = Engine.TableLookup( PatchesTable.File, PatchesTable.Cols.Ref, f14_local9, PatchesTable.Cols.Entitlement )
						local f14_local12 = Engine.TableLookup( CSV.patches.file, CSV.patches.cols.idx, f14_local9, CSV.patches.cols.usesUnlocks )
						if f14_local11 ~= nil and #f14_local11 > 0 then
							f14_local6 = Loot.IsOwned( f14_arg2, tonumber( f14_local11 ) ) < 1
							local f14_local13 = Engine.TableLookup( CSV.cosmeticEmblemsLootMaster.file, CSV.cosmeticEmblemsLootMaster.cols.index, f14_local11, CSV.cosmeticEmblemsLootMaster.cols.quality )
							if f14_local13 ~= nil and f14_local13 ~= "" then
								f14_local8 = tonumber( f14_local13 )
							end
						elseif f14_local12 ~= nil and f14_local12 ~= "" then
							f14_local6 = not Engine.IsUnlocked( f14_arg2, "patch", f14_local9, true )
						end
					end
				end
				return {
					emblemName = f14_local1,
					emblemIndex = f14_local2,
					emblemType = f14_local3,
					emblemImage = f14_local4,
					emblemId = f14_local5,
					layerCount = LUI.DataSourceInControllerModel.new( f14_local0 .. ".layerCount" ),
					isLocked = LUI.DataSourceInControllerModel.new( f14_local0 .. ".isLocked", f14_local6 ),
					quality = LUI.DataSourceInControllerModel.new( f14_local0 .. ".quality", f14_local8 )
				}
			end
			
			f13_local4.GetDefaultFocusIndex = function ()
				local f15_local0 = LUI.FlowManager.GetScopedData( f13_arg0 )
				local f15_local1 = f15_local0.forcedFocus
				if f15_local1 then
					f15_local0.forcedFocus = nil
					return f15_local1
				else
					return f13_arg0.EmblemsGrid:GetFocusPositionIndex()
				end
			end
			
			if f13_local3:GetValue( f13_arg1 ) == 0 then
				f13_arg0.NoEmblemsLabel:SetAlpha( 1, 0 )
			else
				f13_arg0.NoEmblemsLabel:SetAlpha( 0, 0 )
			end
			return f13_local4
		end
	end
	f13_local4 = 0
end

local f0_local9 = nil
f0_local9 = function ( f16_arg0, f16_arg1 )
	local f16_local0 = f16_arg0:Wait( 1000 )
	f16_local0.onComplete = function ()
		return f0_local9( f16_arg0, f16_arg1 )
	end
	
	RefreshData( f16_arg0, f16_arg1, false )
end

function RefreshData( f18_arg0, f18_arg1, f18_arg2 )
	local f18_local0 = f18_arg0.Tabs.Tabs:GetCurrentTabIndex()
	local f18_local1 = f18_arg0.tabNamesAndIDs[f18_local0 + 1].id
	local f18_local2 = f0_local7( f18_local1 )
	local f18_local3 = LUI.FlowManager.GetScopedData( f18_arg0 )
	local f18_local4 = Engine.GetDvarBool( "killswitch_custom_emblems" ) ~= true
	if not f18_local3.emblemsRequested and not EmblemEditor.IsUGCBusy() then
		f18_local3.emblemsRequested = true
		EmblemEditor.DownloadEmblems( f18_arg1, 0 )
	end
	if f18_local1 ~= EmblemEditorUtils.TabIDs.CUSTOM then
		EmblemEditor.CreateEmblemsDataModels( f18_arg1, f18_local1 )
	else
		EmblemEditor.CreateEmblemsDataModels( f18_arg1, f18_local1, f18_arg0.getEmblemFrom, f18_arg0.getEmblemTo )
		for f18_local5 = 0, f18_arg0.getEmblemFrom - 1, 1 do
			WipeControllerModelsAtPath( f18_local2 .. f18_local5 )
		end
		for f18_local5 = f18_arg0.getEmblemTo + 1, f18_arg0.emblemsCount - 1, 1 do
			WipeControllerModelsAtPath( f18_local2 .. f18_local5 )
		end
	end
	if f18_arg2 then
		if f18_arg0.EmblemsGrid:GetFocusPositionIndex() then
			f18_local3.forcedFocus = 0
		else
			f18_local3.forcedFocus = EmblemEditor.GetCurrentEmblemIndex( f18_arg1 )
		end
		f18_arg0.EmblemsGrid:SetGridDataSource( f0_local8( f18_arg0, f18_arg1 ), f18_arg1 )
		if f18_local1 == EmblemEditorUtils.TabIDs.CUSTOM and f18_local4 ~= true then
			f18_arg0.EmblemEditorComingsoon:SetAlpha( 1 )
			f18_arg0.EmblemsGrid:SetAlpha( 0 )
			f18_arg0.ListCount:SetAlpha( 0 )
		else
			f18_arg0.EmblemEditorComingsoon:SetAlpha( 0 )
			f18_arg0.EmblemsGrid:SetAlpha( 1 )
			f18_arg0.ListCount:SetAlpha( 1 )
		end
		if f18_arg0.previousTabID and f18_arg0.previousTabID ~= f18_local1 then
			if f18_arg0.previousTabID == EmblemEditorUtils.TabIDs.CUSTOM then
				WipeControllerModelsAtPath( f0_local0 .. ".custom" )
			elseif f18_arg0.previousTabID == EmblemEditorUtils.TabIDs.DEFAULT then
				WipeControllerModelsAtPath( f0_local0 .. ".default" )
			elseif f18_arg0.previousTabID == EmblemEditorUtils.TabIDs.COMMUNITY then
				WipeControllerModelsAtPath( f0_local0 .. ".community" )
			elseif f18_arg0.previousTabID == EmblemEditorUtils.TabIDs.ARMOURY then
				WipeControllerModelsAtPath( f0_local0 .. ".armoury" )
			elseif f18_arg0.previousTabID == EmblemEditorUtils.TabIDs.EXTRA then
				WipeControllerModelsAtPath( f0_local0 .. ".extra" )
			elseif f18_arg0.previousTabID == EmblemEditorUtils.TabIDs.MISSIONTEAM then
				WipeControllerModelsAtPath( f0_local0 .. ".missionTeam" )
			end
		end
		f18_arg0.previousTabID = f18_local1
		local f18_local7 = f18_arg0.tabNamesAndIDs[f18_local0 + 1].name
		f18_arg0.EmblemsGrid:processEvent( {
			name = "gain_focus"
		} )
	end
	f0_local6( f18_arg0, f18_arg1 )
	local f18_local5 = LUI.DataSourceInControllerModel.new( f18_local2 .. "count" )
	local f18_local6 = LUI.DataSourceInControllerModel.new( f18_local2 .. "totalSlots" )
	f18_arg0.emblemsCount = f18_local5:GetValue( f18_arg1 )
	f18_arg0.totalSlots = f18_local6:GetValue( f18_arg1 )
	if f18_local1 == EmblemEditorUtils.TabIDs.CUSTOM and f18_local4 == true then
		local f18_local7 = nil
		if f18_arg0.emblemsCount - 1 == f18_arg0.totalSlots then
			f18_local7 = Engine.Localize( "MP_EMBLEM_EDITOR_SLOT_LIMIT_REACHED_TITLE" )
			f18_arg0.SlotAvailable:SetRGBFromTable( SWATCHES.MPArmory.PriceCannotBuy, 0 )
		else
			f18_local7 = Engine.Localize( "MP_EMBLEM_EDITOR_SLOTS_USED", tostring( f18_arg0.emblemsCount - 1 ), tostring( f18_arg0.totalSlots ) )
			f18_arg0.SlotAvailable:SetRGBFromTable( COLORS.white )
		end
		f18_arg0.SlotAvailable:setText( f18_local7, 0 )
		f18_arg0.SlotAvailable:SetAlpha( 1 )
	else
		f18_arg0.SlotAvailable:SetAlpha( 0 )
	end
end

function OnMenuCreated( f19_arg0, f19_arg1 )
	f19_arg0.menuCreated = true
	f0_local6( f19_arg0, f19_arg1.controller )
end

function PopFunc()
	WipeGlobalModelsAtPath( f0_local0 )
	WipeControllerModelsAtPath( f0_local0 )
	EmblemEditor.ClearEmblemThumbnailCache()
end

function PostLoadFunc( f21_arg0, f21_arg1 )
	if not Engine.IsAliensMode() then
		FrontEndScene.SetTeamAndScene( "barracks", f21_arg1 )
	else
		Engine.SetFrontEndSceneSection( "barracks_menu", 1 )
	end
	f21_arg0.getEmblemFrom = 0
	f21_arg0.getEmblemTo = f0_local2
	f21_arg0.emblemsCount = 0
	assert( f21_arg0.Tabs )
	assert( f21_arg0.Tabs.Tabs )
	assert( f21_arg0.SmallPlayerCard )
	f0_local4( f21_arg0, f21_arg1 )
	local f21_local0 = Engine.GetDvarBool( "killswitch_custom_emblems" ) ~= true
	if f21_local0 then
		f21_local0 = Engine.CanAccessCustomEmblemFeature() and not Engine.IsUserAGuest( f21_arg1 )
	end
	if CONDITIONS.IsCoreMultiplayer( f21_arg0 ) then
		f21_arg0.MenuTitle.MenuTitle:setText( Engine.Localize( "LUA_MENU_TITLE_EMBLEM_SELECT" ), 0 )
		f21_arg0.MenuTitle.MenuBreadcrumbs:setText( ToUpperCase( Engine.Localize( "LUA_MENU_BREADCRUMB_2_ITEMS", "MENU_MULTIPLAYER", "LUA_MENU_PUBLIC_MATCH_CAPS" ), 0 ) )
	else
		f21_arg0.CPMenuTitle.MenuTitle:setText( Engine.Localize( "LUA_MENU_TITLE_EMBLEM_SELECT" ), 0 )
	end
	local f21_local1 = {
		[#f21_local1 + 1] = {
			name = Engine.Localize( "@MP_EMBLEM_EDITOR_DEFAULT" ),
			id = EmblemEditorUtils.TabIDs.DEFAULT
		}
	}
	if f21_local0 then
		f21_local1[#f21_local1 + 1] = {
			name = Engine.Localize( "@MP_EMBLEM_EDITOR_CUSTOM" ),
			id = EmblemEditorUtils.TabIDs.CUSTOM
		}
	end
	f21_local1[#f21_local1 + 1] = {
		name = Engine.Localize( "@LUA_MENU_MP_QUARTERMASTER" ),
		id = EmblemEditorUtils.TabIDs.ARMOURY
	}
	f21_local1[#f21_local1 + 1] = {
		name = Engine.Localize( "@MENU_MISSION_TEAMS" ),
		id = EmblemEditorUtils.TabIDs.MISSIONTEAM
	}
	f21_local1[#f21_local1 + 1] = {
		name = Engine.Localize( "@MENU_EXTRA" ),
		id = EmblemEditorUtils.TabIDs.EXTRA
	}
	f21_arg0.tabNamesAndIDs = f21_local1
	local f21_local2 = LUI.DataSourceFromList.new( #f21_local1 )
	f21_local2.MakeDataSourceAtIndex = function ( f22_arg0, f22_arg1, f22_arg2 )
		return LUI.DataSourceInGlobalModel.new( f0_local0 .. ".tabName." .. f22_arg1, f21_local1[f22_arg1 + 1].name )
	end
	
	local f21_local3 = LUI.DataSourceFromList.new( #f21_local1 )
	f21_local3.MakeDataSourceAtIndex = function ( f23_arg0, f23_arg1, f23_arg2 )
		return {
			name = f21_local2:GetDataSourceAtIndex( f23_arg1, f23_arg2 ),
			focusFunction = function ()
				f21_arg0.getEmblemFrom = 0
				f21_arg0.getEmblemTo = f0_local2
				f21_arg0.emblemsCount = 0
				RefreshData( f21_arg0, f23_arg2, true )
			end
			
		}
	end
	
	local f21_local4 = function ( f25_arg0 )
		for f25_local3, f25_local4 in pairs( f21_local1 ) do
			if f25_local4.id == f25_arg0 then
				return f25_local3 - 1
			end
		end
		return 0
	end
	
	f21_arg0.defaultTab = EmblemEditor.GetCurrentEmblemCategory( f21_arg1 )
	f21_local3.GetDefaultFocusIndex = function ()
		local f26_local0 = LUI.FlowManager.GetScopedData( f21_arg0 )
		if f26_local0.currentTab then
			return f26_local0.currentTab
		else
			return f21_local4( f21_arg0.defaultTab )
		end
	end
	
	f21_arg0.Tabs.Tabs:SetTabManagerDataSource( f21_local3, f21_arg1 )
	local f21_local5 = function ( f27_arg0, f27_arg1 )
		return function ()
			local f28_local0 = f27_arg0.EmblemsGrid:GetDataSource()
			local f28_local1 = f28_local0.emblemName:GetValue( f27_arg1 )
			local f28_local2 = f27_arg0.Tabs.Tabs:GetCurrentTabIndex()
			local f28_local3 = f27_arg0.tabNamesAndIDs[f27_arg0.Tabs.Tabs:GetCurrentTabIndex() + 1].id
			if f28_local3 == EmblemEditorUtils.TabIDs.CUSTOM and f21_local0 ~= true then
				f27_arg0.EmblemNameLabel:setText( "" )
				f27_arg0.EmblemPreviewImage:SetAlpha( 0 )
				f27_arg0.EmblemPreviewLockIcon:SetAlpha( 1 )
			elseif f28_local1 ~= nil then
				f27_arg0.EmblemNameLabel:setText( Engine.Localize( f28_local1 ) )
				if f28_local0.isLocked:GetValue( f27_arg1 ) then
					if f28_local3 ~= EmblemEditorUtils.TabIDs.MISSIONTEAM then
						f27_arg0.EmblemPreviewImage:SetAlpha( 0 )
					else
						f27_arg0.EmblemPreviewImage:SetAlpha( 1 )
					end
					f27_arg0.EmblemPreviewLockIcon:SetAlpha( 1 )
				else
					f27_arg0.EmblemPreviewImage:SetAlpha( 1 )
					f27_arg0.EmblemPreviewLockIcon:SetAlpha( 0 )
				end
				EmblemEditorUtils.SetupEmblemRendering( f27_arg0.EmblemPreviewImage, f28_local0, f27_arg1 )
			else
				f27_arg0.EmblemNameLabel:setText( Engine.Localize( "@MP_EMBLEM_EDITOR_CREATE_NEW" ) )
				f27_arg0.EmblemPreviewImage:SetAlpha( 0 )
				f27_arg0.EmblemPreviewLockIcon:SetAlpha( 0 )
			end
			f0_local3 = f28_local0.emblemIndex:GetValue( f27_arg1 )
			f0_local6( f27_arg0, f27_arg1 )
			f27_arg0.LootItemHeader:UpdateRarityInfo( f28_local0 )
			if f28_local0.quality:GetValue( f27_arg1 ) > Cac.LowestQuality then
				assert( f27_arg0.EmblemRightPanel )
				ACTIONS.AnimateSequence( f27_arg0, "ShowQualityHeader" )
				ACTIONS.AnimateSequence( f27_arg0.EmblemRightPanel, "ShowQualityHeader" )
			else
				assert( f27_arg0.EmblemRightPanel )
				ACTIONS.AnimateSequence( f27_arg0, "HideQualityHeader" )
				ACTIONS.AnimateSequence( f27_arg0.EmblemRightPanel, "HideQualityHeader" )
			end
		end
		
	end
	
	f21_arg0:SubscribeToDataSourceThroughElement( f21_arg0.EmblemsGrid, nil, f21_local5( f21_arg0, f21_arg1 ) )
	f21_arg0.EmblemsGrid:AddScrollbar( {
		SetLinkedGridDataSource = function ()
			
		end,
		UpdateScrolling = function ()
			local f30_local0 = f21_arg0.EmblemsGrid:GetFocusPosition() and f21_arg0.EmblemsGrid:GetFocusPosition() or 0
			local f30_local1 = math.floor( f0_local2 / 2 )
			local f30_local2 = f30_local0 - 1 - f30_local1
			local f30_local3 = f30_local0 + f30_local1
			local f30_local4 = f21_arg0
			if f30_local2 > 0 then
				local f30_local5 = f30_local2
			end
			f30_local4.getEmblemFrom = f30_local5 or 0
			RefreshData( f21_arg0, f21_arg1, false )
		end,
		LinkTo = function ()
			
		end
	} )
	local f21_local6 = f21_arg0:Wait( 1000 )
	f21_local6.onComplete = function ()
		return f0_local9( f21_arg0, f21_arg1 )
	end
	
	f21_arg0:addEventHandler( "menu_create", OnMenuCreated )
	if Engine.IsCoreMode() then
		local self = LUI.UIElement.new( {
			worldBlur = 5
		} )
		self:setupWorldBlur()
		self.id = "blur"
		f21_arg0:addElement( self )
	end
end

function EmblemSelectMenu( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "EmblemSelectMenu"
	self._animationSets = {}
	self._sequences = {}
	local f33_local1 = controller and controller.controllerIndex
	if not f33_local1 and not Engine.InFrontend() then
		f33_local1 = self:getRootController()
	end
	assert( f33_local1 )
	self:playSound( "menu_open" )
	local f33_local2 = self
	local EmblemRightPanel = nil
	
	EmblemRightPanel = MenuBuilder.BuildRegisteredType( "EmblemRightPanel", {
		controllerIndex = f33_local1
	} )
	EmblemRightPanel.id = "EmblemRightPanel"
	EmblemRightPanel.FrameLabel:setText( Engine.Localize( "MP_EMBLEM_EDITOR_EMBLEM_LIVE_PREVIEW" ), 0 )
	EmblemRightPanel:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -555, _1080p * -130, _1080p * 216, _1080p * 931.5 )
	self:addElement( EmblemRightPanel )
	self.EmblemRightPanel = EmblemRightPanel
	
	local EmblemBgBLur = nil
	
	EmblemBgBLur = LUI.UIBlur.new()
	EmblemBgBLur.id = "EmblemBgBLur"
	EmblemBgBLur:SetRGBFromTable( SWATCHES.CAC.BarracksBlurLight, 0 )
	EmblemBgBLur:SetBlurStrength( 2.75, 0 )
	EmblemBgBLur:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1377.5, _1080p * 1777.5, _1080p * 228.5, _1080p * 628.5 )
	self:addElement( EmblemBgBLur )
	self.EmblemBgBLur = EmblemBgBLur
	
	local EmblemPreviewImage = nil
	
	EmblemPreviewImage = LUI.UIImage.new()
	EmblemPreviewImage.id = "EmblemPreviewImage"
	EmblemPreviewImage:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -542.5, _1080p * -142.5, _1080p * 228.5, _1080p * 628.5 )
	self:addElement( EmblemPreviewImage )
	self.EmblemPreviewImage = EmblemPreviewImage
	
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f33_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1920, _1080p * 995, _1080p * 1080 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local EmblemNameLabel = nil
	
	EmblemNameLabel = LUI.UIText.new()
	EmblemNameLabel.id = "EmblemNameLabel"
	EmblemNameLabel:setText( "EMBLEM NAME", 0 )
	EmblemNameLabel:SetFontSize( 34 * _1080p )
	EmblemNameLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	EmblemNameLabel:SetAlignment( LUI.Alignment.Left )
	EmblemNameLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1389, _1080p * 1769, _1080p * 684, _1080p * 718 )
	self:addElement( EmblemNameLabel )
	self.EmblemNameLabel = EmblemNameLabel
	
	local EmblemsGrid = nil
	
	EmblemsGrid = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 6,
		maxVisibleRows = 3,
		controllerIndex = f33_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "EmblemButton", {
				controllerIndex = f33_local1
			} )
		end,
		wrapX = true,
		wrapY = true,
		spacingX = _1080p * 11,
		spacingY = _1080p * 11,
		columnWidth = _1080p * 194,
		rowHeight = _1080p * 219,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	EmblemsGrid.id = "EmblemsGrid"
	EmblemsGrid:setUseStencil( true )
	EmblemsGrid:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 1349, _1080p * 216, _1080p * 895 )
	self:addElement( EmblemsGrid )
	self.EmblemsGrid = EmblemsGrid
	
	local NoEmblemsLabel = nil
	
	NoEmblemsLabel = LUI.UIText.new()
	NoEmblemsLabel.id = "NoEmblemsLabel"
	NoEmblemsLabel:setText( Engine.Localize( "MP_EMBLEM_EDITOR_NO_EMBLEMS" ), 0 )
	NoEmblemsLabel:SetFontSize( 45 * _1080p )
	NoEmblemsLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	NoEmblemsLabel:SetAlignment( LUI.Alignment.Center )
	NoEmblemsLabel:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 87, _1080p * -623, _1080p * 487, _1080p * 532 )
	self:addElement( NoEmblemsLabel )
	self.NoEmblemsLabel = NoEmblemsLabel
	
	local f33_local10 = nil
	if CONDITIONS.IsCoreMultiplayer( self ) then
		f33_local10 = MenuBuilder.BuildRegisteredType( "MenuTitle", {
			controllerIndex = f33_local1
		} )
		f33_local10.id = "MenuTitle"
		f33_local10.MenuTitle:setText( "", 0 )
		f33_local10.MenuBreadcrumbs:setText( "", 0 )
		f33_local10.Icon:SetTop( _1080p * -28.5, 0 )
		f33_local10.Icon:SetBottom( _1080p * 61.5, 0 )
		f33_local10:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
		self:addElement( f33_local10 )
		self.MenuTitle = f33_local10
	end
	local f33_local11 = nil
	if CONDITIONS.IsThirdGameMode( self ) then
		f33_local11 = MenuBuilder.BuildRegisteredType( "CPMenuTitle", {
			controllerIndex = f33_local1
		} )
		f33_local11.id = "CPMenuTitle"
		f33_local11.MenuTitle:setText( Engine.Localize( "LUA_MENU_ZM_LOADOUT_CAPS" ), 0 )
		f33_local11:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
		self:addElement( f33_local11 )
		self.CPMenuTitle = f33_local11
	end
	local EmblemEditorComingsoon = nil
	
	EmblemEditorComingsoon = MenuBuilder.BuildRegisteredType( "EmblemEditorComingsoon", {
		controllerIndex = f33_local1
	} )
	EmblemEditorComingsoon.id = "EmblemEditorComingsoon"
	EmblemEditorComingsoon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 1349, _1080p * 228.5, _1080p * 895 )
	self:addElement( EmblemEditorComingsoon )
	self.EmblemEditorComingsoon = EmblemEditorComingsoon
	
	local EmblemStorebtn = nil
	
	EmblemStorebtn = MenuBuilder.BuildRegisteredType( "EmblemStorebtn", {
		controllerIndex = f33_local1
	} )
	EmblemStorebtn.id = "EmblemStorebtn"
	EmblemStorebtn:SetAlpha( 0, 0 )
	EmblemStorebtn:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 87, _1080p * 1297, _1080p * 861, _1080p * 936 )
	self:addElement( EmblemStorebtn )
	self.EmblemStorebtn = EmblemStorebtn
	
	local ListAnchor = nil
	
	ListAnchor = LUI.UIImage.new()
	ListAnchor.id = "ListAnchor"
	ListAnchor:SetRGBFromInt( 6710886, 0 )
	ListAnchor:SetAlpha( 0.6, 0 )
	ListAnchor:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 1349, _1080p * 907.5, _1080p * 931.5 )
	self:addElement( ListAnchor )
	self.ListAnchor = ListAnchor
	
	local SlotAvailable = nil
	
	SlotAvailable = LUI.UIText.new()
	SlotAvailable.id = "SlotAvailable"
	SlotAvailable:setText( "5/10 Slot available", 0 )
	SlotAvailable:SetFontSize( 19 * _1080p )
	SlotAvailable:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	SlotAvailable:SetAlignment( LUI.Alignment.Right )
	SlotAvailable:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 809.5, _1080p * 1343.5, _1080p * 910, _1080p * 929 )
	self:addElement( SlotAvailable )
	self.SlotAvailable = SlotAvailable
	
	local ArrowUp = nil
	
	ArrowUp = MenuBuilder.BuildRegisteredType( "ArrowUp", {
		controllerIndex = f33_local1
	} )
	ArrowUp.id = "ArrowUp"
	ArrowUp:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 799.5, _1080p * 819.5, _1080p * 900.5, _1080p * 940.5 )
	self:addElement( ArrowUp )
	self.ArrowUp = ArrowUp
	
	local ArrowDown = nil
	
	ArrowDown = MenuBuilder.BuildRegisteredType( "ArrowDown", {
		controllerIndex = f33_local1
	} )
	ArrowDown.id = "ArrowDown"
	ArrowDown:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 634.5, _1080p * 654.5, _1080p * 899.5, _1080p * 939.5 )
	self:addElement( ArrowDown )
	self.ArrowDown = ArrowDown
	
	local ListCount = nil
	
	ListCount = LUI.UIText.new()
	ListCount.id = "ListCount"
	ListCount:setText( "1/15", 0 )
	ListCount:SetFontSize( 24 * _1080p )
	ListCount:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ListCount:SetAlignment( LUI.Alignment.Center )
	ListCount:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 654.5, _1080p * 799.5, _1080p * 907.5, _1080p * 931.5 )
	self:addElement( ListCount )
	self.ListCount = ListCount
	
	local SmallPlayerCard = nil
	
	SmallPlayerCard = MenuBuilder.BuildRegisteredType( "SmallPlayerCard", {
		controllerIndex = f33_local1
	} )
	SmallPlayerCard.id = "SmallPlayerCard"
	SmallPlayerCard:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1369, _1080p * 1787, _1080p * 753, _1080p * 872 )
	self:addElement( SmallPlayerCard )
	self.SmallPlayerCard = SmallPlayerCard
	
	local Tabs = nil
	
	Tabs = MenuBuilder.BuildRegisteredType( "SubMenuTabsBar", {
		controllerIndex = f33_local1
	} )
	Tabs.id = "Tabs"
	Tabs:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 145, _1080p * 185 )
	self:addElement( Tabs )
	self.Tabs = Tabs
	
	local EmblemPreviewLockIcon = nil
	
	EmblemPreviewLockIcon = LUI.UIImage.new()
	EmblemPreviewLockIcon.id = "EmblemPreviewLockIcon"
	EmblemPreviewLockIcon:setImage( RegisterMaterial( "icon_slot_locked" ), 0 )
	EmblemPreviewLockIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1514, _1080p * 1642, _1080p * 364.5, _1080p * 492.5 )
	self:addElement( EmblemPreviewLockIcon )
	self.EmblemPreviewLockIcon = EmblemPreviewLockIcon
	
	local SocialFeed = nil
	
	SocialFeed = MenuBuilder.BuildRegisteredType( "SocialFeed", {
		controllerIndex = f33_local1
	} )
	SocialFeed.id = "SocialFeed"
	SocialFeed:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1920, _1080p * 965, _1080p * 995 )
	self:addElement( SocialFeed )
	self.SocialFeed = SocialFeed
	
	local CRMMain = nil
	
	CRMMain = MenuBuilder.BuildRegisteredType( "CRMMain", {
		controllerIndex = f33_local1
	} )
	CRMMain.id = "CRMMain"
	CRMMain:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 136, _1080p * 447, _1080p * 745, _1080p * 1069 )
	self:addElement( CRMMain )
	self.CRMMain = CRMMain
	
	local EmblemsScrollbar = nil
	
	EmblemsScrollbar = MenuBuilder.BuildRegisteredType( "VerticalMinimalScrollbar", {
		controllerIndex = f33_local1
	} )
	EmblemsScrollbar.id = "EmblemsScrollbar"
	EmblemsScrollbar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 111, _1080p * 216, _1080p * 895 )
	self:addElement( EmblemsScrollbar )
	self.EmblemsScrollbar = EmblemsScrollbar
	
	local LootItemHeader = nil
	
	LootItemHeader = MenuBuilder.BuildRegisteredType( "CACSmallItemHeader", {
		controllerIndex = f33_local1
	} )
	LootItemHeader.id = "LootItemHeader"
	LootItemHeader:SetScale( -0.2, 0 )
	LootItemHeader.ItemName:setText( Engine.Localize( "MENU_NEW" ), 0 )
	LootItemHeader.ItemName:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	LootItemHeader:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1317, _1080p * 1837, _1080p * 651, _1080p * 751 )
	self:addElement( LootItemHeader )
	self.LootItemHeader = LootItemHeader
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		EmblemNameLabel:RegisterAnimationSequence( "ShowQualityHeader", {
			{
				function ()
					return self.EmblemNameLabel:SetAlpha( 0, 0 )
				end
			}
		} )
		LootItemHeader:RegisterAnimationSequence( "ShowQualityHeader", {
			{
				function ()
					return self.LootItemHeader:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.ShowQualityHeader = function ()
			EmblemNameLabel:AnimateSequence( "ShowQualityHeader" )
			LootItemHeader:AnimateSequence( "ShowQualityHeader" )
		end
		
		EmblemNameLabel:RegisterAnimationSequence( "HideQualityHeader", {
			{
				function ()
					return self.EmblemNameLabel:SetAlpha( 1, 0 )
				end
			}
		} )
		LootItemHeader:RegisterAnimationSequence( "HideQualityHeader", {
			{
				function ()
					return self.LootItemHeader:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.HideQualityHeader = function ()
			EmblemNameLabel:AnimateSequence( "HideQualityHeader" )
			LootItemHeader:AnimateSequence( "HideQualityHeader" )
		end
		
	end
	
	self._animationSets.CP = function ()
		Tabs:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Tabs:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 141, _1080p * 103, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			Tabs:AnimateSequence( "DefaultSequence" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	ArrowUp.navigation = {
		left = ArrowDown,
		down = SocialFeed
	}
	ArrowDown.navigation = {
		right = ArrowUp,
		down = SocialFeed
	}
	SocialFeed.navigation = {
		up = ArrowUp
	}
	local f33_local26 = LUI.UIScrollbar.new
	local bindButton = {
		direction = LUI.DIRECTION.vertical,
		eventListener = EmblemsScrollbar,
		startCap = EmblemsScrollbar.startCap,
		endCap = EmblemsScrollbar.endCap
	}
	local f33_local28 = EmblemsScrollbar.sliderArea
	if f33_local28 then
		f33_local28 = EmblemsScrollbar.sliderArea.slider
	end
	bindButton.slider = f33_local28
	f33_local28 = EmblemsScrollbar.sliderArea
	if f33_local28 then
		f33_local28 = EmblemsScrollbar.sliderArea.fixedSizeSlider
	end
	bindButton.fixedSizeSlider = f33_local28
	EmblemsGrid:AddScrollbar( f33_local26( bindButton ) )
	EmblemsGrid:AddArrow( ArrowUp )
	EmblemsGrid:AddArrow( ArrowDown )
	EmblemsGrid:AddItemNumbers( ListCount )
	self.addButtonHelperFunction = function ( f46_arg0, f46_arg1 )
		f46_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			priority = 10,
			clickable = true
		} )
	end
	
	self:addEventHandler( "menu_create", self.addButtonHelperFunction )
	
	bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	self.bindButton:addEventHandler( "button_secondary", function ( f47_arg0, f47_arg1 )
		local f47_local0 = f47_arg1.controller or f33_local1
		ACTIONS.LeaveMenu( self )
	end )
	PostLoadFunc( self, f33_local1, controller )
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "CRMMain",
		sequenceName = "Minimize",
		elementPath = "CRMMain"
	} )
	if CONDITIONS.IsThirdGameMode( self ) then
		ACTIONS.SetAnimationSet( self, "CP" )
	end
	return self
end

MenuBuilder.registerType( "EmblemSelectMenu", EmblemSelectMenu )
LUI.FlowManager.RegisterStackPopBehaviour( "EmblemSelectMenu", PopFunc )
LockTable( _M )
