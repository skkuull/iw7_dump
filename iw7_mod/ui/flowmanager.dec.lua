LUI.FlowManager = LUI.Class( LUI.UIElement )
PushAndPopsTable = {}
DisableLetterbox = {}
DontBlockMouseMoveEvents = {}
DisableMousePointer = {}
FenceGroups = {}
SavedMenuStates = {}
AlwaysVisible = {}
PresetStacks = {}
IgnoreFollowHostCallbacks = {}
PartyUIRoot = {
	FREE = 0,
	MAIN_MENU = 1,
	PRIVATE_MATCH = 2,
	PUBLIC_MATCH = 3,
	PUBLIC_MATCH_LOBBY = 4,
	SYSTEM_LINK = 5,
	SYSTEM_LINK_LOBBY = 6,
	GAME_BATTLES_MATCH = 7,
	RIG_DRAFT_MENU = 8,
	WEAPON_DRAFT_MENU = 9,
	LOADOUT_SELECT_MENU = 10,
	LAST = 10
}
LUI.FlowManager.FlowMenus = {
	MP = {
		[PartyUIRoot.MAIN_MENU] = "MPMainMenu",
		[PartyUIRoot.PRIVATE_MATCH] = "PrivateMatchLobby",
		[PartyUIRoot.PUBLIC_MATCH] = "Missions",
		[PartyUIRoot.PUBLIC_MATCH_LOBBY] = "LobbyMission",
		[PartyUIRoot.SYSTEM_LINK] = "MPSystemLinkMenu",
		[PartyUIRoot.SYSTEM_LINK_LOBBY] = "MPSystemLinkLobby",
		[PartyUIRoot.GAME_BATTLES_MATCH] = "GameBattlesLobby",
		[PartyUIRoot.RIG_DRAFT_MENU] = "RigDraftMenu",
		[PartyUIRoot.WEAPON_DRAFT_MENU] = "WeaponDraftMenu",
		[PartyUIRoot.LOADOUT_SELECT_MENU] = "LoadoutSelect"
	},
	CP = {
		[PartyUIRoot.MAIN_MENU] = "CPMainMenu",
		[PartyUIRoot.PRIVATE_MATCH] = "CPPrivateMatchMenu",
		[PartyUIRoot.PUBLIC_MATCH] = nil,
		[PartyUIRoot.PUBLIC_MATCH_LOBBY] = "CPPublicMatchMenu",
		[PartyUIRoot.SYSTEM_LINK] = "CPSystemLinkMenu",
		[PartyUIRoot.SYSTEM_LINK_LOBBY] = "CPSystemLinkLobby",
		[PartyUIRoot.GAME_BATTLES_MATCH] = nil,
		[PartyUIRoot.RIG_DRAFT_MENU] = nil,
		[PartyUIRoot.WEAPON_DRAFT_MENU] = nil,
		[PartyUIRoot.LOADOUT_SELECT_MENU] = nil
	}
}
LUI.FlowManager.RegisterStackPushBehaviour = function ( f1_arg0, f1_arg1 )
	PushAndPopsTable[f1_arg0] = PushAndPopsTable[f1_arg0] or {}
	PushAndPopsTable[f1_arg0].pushFunc = f1_arg1 or PushAndPopsTable[f1_arg0].pushFunc
end

LUI.FlowManager.RegisterStackPopBehaviour = function ( f2_arg0, f2_arg1 )
	PushAndPopsTable[f2_arg0] = PushAndPopsTable[f2_arg0] or {}
	PushAndPopsTable[f2_arg0].popFunc = f2_arg1 or PushAndPopsTable[f2_arg0].popFunc
end

LUI.FlowManager.RegisterFenceGroup = function ( f3_arg0, f3_arg1 )
	assert( not FenceGroups[f3_arg0] )
	FenceGroups[f3_arg0] = f3_arg1
end

LUI.FlowManager.RegisterIgnoreFollowHostCallback = function ( f4_arg0, f4_arg1 )
	IgnoreFollowHostCallbacks[f4_arg0] = f4_arg1
end

LUI.FlowManager.DisableLetterboxForMenu = function ( f5_arg0 )
	DisableLetterbox[f5_arg0] = true
end

LUI.FlowManager.AlwaysVisibleForMenu = function ( f6_arg0 )
	AlwaysVisible[f6_arg0] = true
end

LUI.FlowManager.RequestSetStack = function ( f7_arg0, f7_arg1 )
	assert( type( f7_arg0 ) == "string" )
	assert( type( f7_arg1 ) == "table" )
	PresetStacks[f7_arg0] = f7_arg1
end

LUI.FlowManager.DontBlockMouseMoveEventsForMenu = function ( f8_arg0 )
	DontBlockMouseMoveEvents[f8_arg0] = true
end

LUI.FlowManager.DisableMousePointerForMenu = function ( f9_arg0 )
	DisableMousePointer[f9_arg0] = true
end

LUI.FlowManager.GetScopedData = function ( f10_arg0 )
	local f10_local0 = type( f10_arg0 )
	local f10_local1 = assert
	local f10_local2
	if f10_local0 ~= "string" and f10_local0 ~= "userdata" then
		f10_local2 = false
	else
		f10_local2 = true
	end
	f10_local1( f10_local2 )
	f10_local1 = Engine.GetLuiRoot()
	assert( f10_local1 and f10_local1.flowManager )
	f10_local2 = f10_local1.flowManager
	if f10_local0 == "string" then
		return f10_local2:GetScopedDataFromMenuName( f10_arg0 )
	elseif f10_local0 == "userdata" then
		return f10_local2:GetScopedDataFromElement( f10_arg0 )
	else
		
	end
end

LUI.FlowManager.RequestAddMenu = function ( f11_arg0, f11_arg1, f11_arg2, f11_arg3, f11_arg4, f11_arg5 )
	assert( type( f11_arg0 ) == "string" )
	local f11_local0 = {
		name = "addmenu",
		menu = f11_arg0,
		exclusiveController = f11_arg1,
		controller = f11_arg2,
		replaceTop = f11_arg3,
		immediate = f11_arg5,
		data = f11_arg4
	}
	local f11_local1 = Engine.GetLuiRoot()
	LUI.UIRoot.BlockButtonInput( f11_local1, true, "RequestAddMenu " .. f11_arg0 )
	LUI.UIRoot.ProcessEvent( f11_local1, f11_local0 )
end

LUI.FlowManager.RequestPopupMenu = function ( f12_arg0, f12_arg1, f12_arg2, f12_arg3, f12_arg4, f12_arg5, f12_arg6, f12_arg7, f12_arg8 )
	assert( f12_arg1 )
	local f12_local0 = {
		name = "popupmenu",
		menu = f12_arg1,
		isModal = f12_arg7,
		exclusiveController = f12_arg2,
		controller = f12_arg3,
		replaceTop = f12_arg4,
		data = f12_arg5
	}
	if f12_arg8 ~= nil then
		f12_local0.immediate = f12_arg8
	else
		f12_local0.immediate = true
	end
	local f12_local1 = Engine.GetLuiRoot()
	LUI.UIRoot.BlockButtonInput( f12_local1, true, "RequestPopupMenu " .. f12_arg1 )
	LUI.UIRoot.ProcessEvent( f12_local1, f12_local0 )
end

LUI.FlowManager.RequestLeaveMenu = function ( f13_arg0, f13_arg1, f13_arg2 )
	local f13_local0 = {
		name = "leavemenu",
		element = f13_arg0,
		immediate = f13_arg1,
		blockSound = f13_arg2
	}
	local f13_local1 = Engine.GetLuiRoot()
	LUI.UIRoot.BlockButtonInput( f13_local1, true, "RequestLeaveMenu" )
	LUI.UIRoot.ProcessEvent( f13_local1, f13_local0 )
end

LUI.FlowManager.RequestLeaveMenuByName = function ( f14_arg0, f14_arg1, f14_arg2 )
	assert( f14_arg0 )
	local f14_local0 = {
		name = "leavemenu",
		menu = f14_arg0,
		immediate = f14_arg1,
		blockSound = f14_arg2
	}
	LUI.UIRoot.BlockButtonInput( Engine.GetLuiRoot(), true, "RequestLeaveMenuByName " .. f14_arg0 )
	local f14_local1 = Engine.GetLuiRoot()
	f14_local1:processEvent( f14_local0 )
end

LUI.FlowManager.RequestRestoreMenu = function ( f15_arg0, f15_arg1, f15_arg2 )
	local f15_local0 = {
		name = "restoreMenu",
		menu = f15_arg0,
		immediate = true,
		exclusiveController = f15_arg1,
		controller = f15_arg2
	}
	local f15_local1 = Engine.GetLuiRoot()
	LUI.UIRoot.BlockButtonInput( f15_local1, true, "RequestRestoreMenu" )
	LUI.UIRoot.ProcessEvent( f15_local1, f15_local0 )
end

LUI.FlowManager.RequestCloseAllMenus = function ()
	LUI.UIRoot.ProcessEvent( Engine.GetLuiRoot(), {
		name = "closeallmenus"
	} )
end

LUI.FlowManager.IsInStack = function ( f17_arg0 )
	local f17_local0 = Engine.GetLuiRoot()
	assert( f17_local0 and f17_local0.flowManager )
	return f17_local0.flowManager:StackContains( f17_arg0 )
end

LUI.FlowManager.ClearSavedMenuState = function ( f18_arg0 )
	SavedMenuStates[f18_arg0] = nil
end

LUI.FlowManager.IsTopMenuModal = function ()
	local f19_local0 = Engine.GetLuiRoot()
	assert( f19_local0 and f19_local0.flowManager )
	local f19_local1 = f19_local0.flowManager.menuInfoStack
	local f19_local2 = f19_local1[#f19_local1]
	return f19_local2 and f19_local2.isModal
end

LUI.FlowManager.IsMenuOnTop = function ( f20_arg0 )
	local f20_local0 = Engine.GetLuiRoot()
	assert( f20_local0 and f20_local0.flowManager )
	local f20_local1 = f20_local0.flowManager:GetStackTop()
	return f20_local1 and f20_local1.name == f20_arg0
end

LUI.FlowManager.GetCurrentMenu = function ( f21_arg0 )
	local f21_local0 = Engine.GetLuiRoot()
	assert( f21_local0 and f21_local0.flowManager )
	local f21_local1 = f21_arg0
	local f21_local2 = f21_local1:getParent()
	while f21_local2 do
		if f21_local2 == f21_local0.flowManager then
			return f21_local1
		end
		f21_local1 = f21_local2
		f21_local2 = f21_local2:getParent()
	end
	assert( "Error getting current menu. Most likely, the element has not been added to a menu yet." )
end

function SaveMenuStack( f22_arg0 )
	assert( f22_arg0 )
	assert( f22_arg0.flowManager )
	local f22_local0 = {}
	for f22_local4, f22_local5 in ipairs( f22_arg0.flowManager.menuInfoStack ) do
		table.insert( f22_local0, CreateMenuInfoSaveData( f22_local5 ) )
	end
	return serialize.persist( {}, f22_local0 )
end

function RestoreMenuStack( f23_arg0, f23_arg1 )
	assert( f23_arg0 )
	assert( f23_arg0.flowManager )
	assert( f23_arg1 )
	local f23_local0 = f23_arg0.flowManager
	f23_local0:closeAllMenus()
	for f23_local4, f23_local5 in ipairs( serialize.unpersist( {}, f23_arg1 ) ) do
		local f23_local6 = f23_local5.name
		assert( f23_local6 )
		if FenceGroups[f23_local6] then
			f23_local5.fenceGroup = LUI.FenceGroup.new( FenceGroups[f23_local6] )
		end
		f23_local5.scopedData = MakeScopedDataForMenuInfo( f23_local5 )
		f23_local0:PushMenuInfo( f23_local5 )
	end
end

function IsMenuInStack( f24_arg0, f24_arg1 )
	assert( f24_arg0 )
	local f24_local0 = f24_arg0.flowManager
	if not f24_local0 then
		return false
	else
		return f24_local0:StackContains( f24_arg1 )
	end
end

function IsMenuOpenAndVisible( f25_arg0, f25_arg1 )
	assert( f25_arg0 )
	local f25_local0 = f25_arg0.flowManager
	if not f25_local0 then
		return false
	elseif f25_local0.menuInfoStack then
		for f25_local4, f25_local5 in ipairs( f25_local0.menuInfoStack ) do
			if f25_local5.name == f25_arg1 and f25_local5.menu ~= nil then
				return true
			end
		end
	end
	return false
end

function AnyActiveMenusInStack( f26_arg0 )
	assert( f26_arg0 )
	local f26_local0 = f26_arg0.flowManager
	if not f26_local0 then
		return false
	elseif f26_local0.menuInfoStack then
		for f26_local4, f26_local5 in ipairs( f26_local0.menuInfoStack ) do
			if f26_local5.menu then
				return true
			end
		end
	end
	return false
end

function IsTopSignInMenu( f27_arg0 )
	assert( f27_arg0 )
	local f27_local0 = f27_arg0.flowManager
	if not f27_local0 then
		return false
	end
	local f27_local1 = false
	if not LUI.UIRoot.IsButtonInputBlocked( f27_arg0 ) and f27_local0.menuInfoStack then
		local f27_local2 = f27_local0.menuInfoStack[#f27_local0.menuInfoStack]
		if f27_local2 and f27_local2.menu and f27_local2.menu.isSignInMenu then
			local f27_local3 = LUI.FlowManager.GetScopedData( f27_local2.menu )
			if f27_local3 and f27_local3.focusedPage and f27_local3.focusedPage > 2 then
				
			else
				f27_local1 = true
			end
		end
	end
	return f27_local1
end

function IsTopLocalSignInMenu( f28_arg0 )
	return false
end

LUI.FlowManager.closeAllMenusHandler = function ( f29_arg0, f29_arg1 )
	f29_arg0:closeAllMenus()
end

LUI.FlowManager.restoreMenuHandler = function ( f30_arg0, f30_arg1 )
	f30_arg0:restoreMenu( f30_arg1 )
	LUI.UIRoot.BlockButtonInput( f30_arg0.root, false, "RestoreMenuHandler" )
end

LUI.FlowManager.addMenuHandler = function ( f31_arg0, f31_arg1 )
	f31_arg0:addMenu( f31_arg1 )
	LUI.UIRoot.BlockButtonInput( f31_arg0.root, false, "AddMenuHandler" )
end

LUI.FlowManager.popupMenuHandler = function ( f32_arg0, f32_arg1 )
	f32_arg1.isPopup = true
	f32_arg0:addMenuHandler( f32_arg1 )
end

LUI.FlowManager.leaveMenuHandler = function ( f33_arg0, f33_arg1 )
	f33_arg0:leaveMenu( f33_arg1 )
	LUI.UIRoot.BlockButtonInput( f33_arg0.root, false, "leaveMenu" )
end

LUI.FlowManager.closeAllMenus = function ( f34_arg0 )
	for f34_local0 = #f34_arg0.menuInfoStack, 1, -1 do
		local f34_local3 = f34_arg0.menuInfoStack[f34_local0]
		if not AlwaysVisible[f34_local3.name] then
			f34_arg0:CloseMenuInfo( f34_local3, true, false )
			f34_arg0:RemoveMenuInfo( f34_local3 )
		end
	end
end

LUI.FlowManager.restoreMenu = function ( f35_arg0, f35_arg1 )
	local f35_local0 = nil
	if not f35_arg0.IsInStack( f35_arg1.menu ) then
		f35_arg0:addMenu( f35_arg1 )
		return 
	end
	local f35_local1 = f35_arg0:GetStackTop()
	if f35_local1 and f35_local1.name == f35_arg1.menu then
		return 
	end
	local f35_local2 = nil
	for f35_local3 = #f35_arg0.menuInfoStack, 1, -1 do
		local f35_local6 = f35_arg0.menuInfoStack[f35_local3]
		if not f35_local6.isModal then
			if f35_local6.name ~= f35_arg1.menu then
				f35_arg0:CloseMenuInfo( f35_local6, false, false )
				f35_arg0:RemoveMenuInfo( f35_local6 )
			end
		end
	end
	f35_arg0:RefreshStack()
end

LUI.FlowManager.addMenu = function ( f36_arg0, f36_arg1 )
	local f36_local0 = f36_arg1.menu
	if f36_arg0:StackContains( f36_local0 ) then
		return 
	end
	local f36_local1 = f36_arg0.menuInfoStack[#f36_arg0.menuInfoStack]
	if f36_local1 and f36_arg1.replaceTop then
		f36_arg0:CloseMenuInfo( f36_local1, false, false )
		f36_arg0:RemoveMenuInfo( f36_local1 )
	end
	local f36_local2 = f36_arg0:CreateMenuInfo( f36_local0, f36_arg1.data, f36_arg1.exclusiveController, f36_arg1.controller )
	f36_local2.isPopup = f36_arg1.isPopup or f36_arg1.isModal
	f36_local2.isModal = f36_arg1.isModal
	f36_arg0:PushMenuInfo( f36_local2 )
	f36_arg0:RefreshStack()
end

LUI.FlowManager.leaveMenu = function ( f37_arg0, f37_arg1 )
	local f37_local0 = nil
	if f37_arg1.element or f37_arg1.menu then
		for f37_local1 = #f37_arg0.menuInfoStack, 1, -1 do
			local f37_local4 = f37_arg0.menuInfoStack[f37_local1]
			local f37_local5 = f37_arg1.element
			if f37_local5 then
				f37_local5 = f37_arg1.element:isDescendentOf( f37_local4.menu )
			end
			local f37_local6 = f37_arg1.menu
			if f37_local6 then
				f37_local6 = f37_local4.name == f37_arg1.menu
			end
			if f37_local5 or f37_local6 then
				f37_local0 = f37_local4
			end
		end
	else
		f37_local0 = f37_arg0:GetStackTop()
	end
	if not f37_local0 then
		return 
	end
	f37_arg0:CloseMenuInfo( f37_local0, false, false )
	f37_arg0:RemoveMenuInfo( f37_local0 )
	if not f37_local0.isModal and not f37_arg1.blockSound then
		Engine.PlaySound( CoD.SFX.SelectBack )
	end
	f37_arg0:RefreshStack()
end

LUI.FlowManager.GetScopedDataFromElement = function ( f38_arg0, f38_arg1 )
	if f38_arg1._scoped then
		return f38_arg1._scoped
	else
		local f38_local0 = f38_arg1:getParent()
		assert( f38_local0, "Could not find scoped data for supplied LUI element." )
		return f38_arg0:GetScopedDataFromElement( f38_local0 )
	end
end

LUI.FlowManager.GetScopedDataFromMenuName = function ( f39_arg0, f39_arg1 )
	for f39_local0 = #f39_arg0.menuInfoStack, 1, -1 do
		local f39_local3 = f39_arg0.menuInfoStack[f39_local0]
		if f39_local3.name == f39_arg1 then
			return f39_local3.scopedData
		end
	end
	assert( false, "Could not find scoped data for menu named " .. f39_arg1 .. "." )
end

function CreateMenuInfoSaveData( f40_arg0 )
	local f40_local0 = {}
	for f40_local9, f40_local10 in pairs( f40_arg0 ) do
		if f40_local9 ~= "fenceGroup" and f40_local9 ~= "scopedData" then
			if f40_local9 == "menu" then
				
			end
			if f40_local9 == "buildData" then
				for f40_local7, f40_local8 in pairs( f40_local10 ) do
					if type( f40_local8 ) == "table" and f40_local8.__serializable == false then
						DebugPrint( "WARNING: Not saving buildData field \"" .. tostring( f40_local7 ) .. "\" for LUI Reload of menu \"" .. tostring( f40_arg0.name ) .. "\"" )
						f40_local10[f40_local7] = nil
					end
				end
			end
			f40_local0[f40_local9] = f40_local10
		end
	end
	return f40_local0
end

function MakeScopedDataForMenuInfo( f41_arg0 )
	local f41_local0 = {
		menuName = f41_arg0.name
	}
	for f41_local4, f41_local5 in pairs( f41_arg0.buildData ) do
		f41_local0[f41_local4] = f41_local5
	end
	if f41_arg0.controller then
		f41_local0.controllerIndex = f41_arg0.controller
		f41_local0.exclusiveController = f41_arg0.controller
		f41_local0.exclusiveControllerIndex = f41_arg0.controller
	end
	return f41_local0
end

LUI.FlowManager.CreateMenuInfo = function ( f42_arg0, f42_arg1, f42_arg2, f42_arg3, f42_arg4 )
	local f42_local0 = f42_arg0
	local f42_local1 = {
		name = f42_arg1,
		buildData = f42_arg2 or {},
		controller = f42_arg4
	}
	if not Engine.InFrontend() then
		f42_local1.controller = f42_arg0:getRootController()
	elseif not f42_arg4 then
		DebugPrint( "Warning: opening menu \"" .. f42_arg1 .. "\" for unspecified controllerIndex, defaulting to 0" )
		f42_local1.controller = 0
	end
	local f42_local2
	if f42_arg4 == nil or f42_arg3 ~= true then
		f42_local2 = false
	else
		f42_local2 = true
	end
	f42_local1.isControllerExclusive = f42_local2
	f42_local1.scopedData = MakeScopedDataForMenuInfo( f42_local1 )
	if FenceGroups[f42_arg1] then
		f42_local1.fenceGroup = LUI.FenceGroup.new( FenceGroups[f42_arg1], f42_local1.controller, f42_local1.buildData )
		f42_local1.fenceGroup.OnPass = function ( f43_arg0 )
			
		end
		
		f42_local1.fenceGroup.OnBlock = function ( f44_arg0 )
			
		end
		
		f42_local1.fenceGroup.OnFail = function ( f45_arg0 )
			DebugPrint( "Fencegroup failed for " .. f42_arg1 )
			if f42_local0:StackContains( f42_arg1 ) then
				for f45_local0 = #f42_local0.menuInfoStack, 1, -1 do
					local f45_local3 = f42_local0.menuInfoStack[f45_local0]
					f42_local0:CloseMenuInfo( f45_local3, true, false )
					f42_local0:RemoveMenuInfo( f45_local3 )
					if f45_local3.name == f42_arg1 then
						
					end
				end
			else
				DebugPrint( "WARNING: Attempted to fail fencegroup for " .. f42_arg1 .. " but " .. f42_arg1 .. " is not in the stack." )
			end
		end
		
	end
	return f42_local1
end

LUI.FlowManager.OpenMenuInfo = function ( f46_arg0, f46_arg1 )
	if f46_arg1.opening then
		return 
	end
	local f46_local0 = Engine.GetBytesFree()
	if Engine.InFrontend() then
		PlayerData.Cleanup()
	end
	assert( not f46_arg1.menu )
	LUI.ActiveScoped = f46_arg1.scopedData
	f46_arg1.opening = true
	f46_arg1.menu = MenuBuilder.buildMenu( f46_arg1.name, f46_arg1.scopedData )
	f46_arg1.opening = false
	for f46_local4, f46_local5 in ipairs( f46_arg0.menuInfoStack ) do
		if f46_local5.menu then
			f46_local5.menu:setPriority( f46_local4 )
		end
	end
	f46_arg0:addElement( f46_arg1.menu )
	f46_arg1.menu:processEvent( {
		name = "menu_create",
		dispatchChildren = true,
		controller = f46_arg1.controller
	} )
	assert( f46_arg1.menu )
	if not Engine.UsingSplitscreenUpscaling() and not DisableLetterbox[f46_arg1.name] and not f46_arg1.menu:IsInWorld() then
		f46_arg1.menu:setupLetterboxElement()
	end
	LUI.ActiveScoped = nil
	f46_local1 = Engine.GetBytesFree()
	if not Engine.BBPrint( "lua_menu_info", "menu_name %s memory_delta_bytes %d init_free_bytes %d post_free_bytes %d in_game %d completed_menu %d", f46_arg1.name, f46_local1 - f46_local0, f46_local0, f46_local1, Engine.InFrontend(), true ) then
		DebugPrint( "Failed to write to blackbox" )
	end
	f46_arg0:LogMenuChangeTo( f46_arg1.controller, f46_arg1.name )
end

LUI.FlowManager.CloseMenuInfo = function ( f47_arg0, f47_arg1, f47_arg2, f47_arg3 )
	if not f47_arg3 then
		SavedMenuStates[f47_arg1.name] = nil
	end
	if f47_arg1.menu then
		if f47_arg3 and not SavedMenuStates[f47_arg1.name] then
			SavedMenuStates[f47_arg1.name] = f47_arg1.menu:saveState()
		end
		if not f47_arg2 then
			f47_arg1.menu:processEvent( {
				name = "lose_focus"
			} )
			f47_arg1.menu:processEvent( {
				name = "menu_close",
				dispatchChildren = true,
				controller = f47_arg1.controller
			} )
		end
		f47_arg1.menu:closeTree()
		f47_arg1.menu:close()
		f47_arg1.menu = nil
	end
end

LUI.FlowManager.GetStackVersion = function ( f48_arg0 )
	assert( f48_arg0.stackVersion )
	return f48_arg0.stackVersion
end

LUI.FlowManager.InsertMenuInfo = function ( f49_arg0, f49_arg1, f49_arg2 )
	assert( f49_arg2 )
	f49_arg0.stackVersion = f49_arg0.stackVersion + 1
	table.insert( f49_arg0.menuInfoStack, f49_arg1, f49_arg2 )
	if PushAndPopsTable[f49_arg2.name] and PushAndPopsTable[f49_arg2.name].pushFunc then
		PushAndPopsTable[f49_arg2.name].pushFunc()
	end
	Engine.SetLuiInUse( true )
	if #f49_arg0.menuInfoStack == 1 then
		f49_arg0.root:processEvent( {
			name = "non_empty_menu_stack"
		} )
	end
	if Engine.IsDevelopmentBuild() then
		f49_arg0:PrintStack()
	end
end

LUI.FlowManager.RemoveMenuInfo = function ( f50_arg0, f50_arg1 )
	assert( f50_arg1 )
	local f50_local0 = nil
	local f50_local1 = #f50_arg0.menuInfoStack
	while f50_local1 >= 1 and f50_arg0.menuInfoStack[f50_local1] ~= f50_arg1 do
		f50_local1 = f50_local1 - 1
	end
	if f50_local1 >= 1 then
		if f50_arg1.fenceGroup then
			f50_arg1.fenceGroup:Abort()
		end
		if PushAndPopsTable[f50_arg1.name] and PushAndPopsTable[f50_arg1.name].popFunc then
			PushAndPopsTable[f50_arg1.name].popFunc()
		end
		f50_arg0.stackVersion = f50_arg0.stackVersion + 1
		table.remove( f50_arg0.menuInfoStack, f50_local1 )
	end
	if #f50_arg0.menuInfoStack == 0 then
		f50_arg0.root:processEvent( {
			name = "empty_menu_stack"
		} )
		f50_arg0.root:RemoveMouseCursor()
	end
	if Engine.IsDevelopmentBuild() then
		f50_arg0:PrintStack()
	end
	Engine.SetLuiInUse( #f50_arg0.menuInfoStack > 0 )
end

LUI.FlowManager.PushMenuInfo = function ( f51_arg0, f51_arg1 )
	f51_arg0:SetStack( f51_arg1 )
	if f51_arg1.isModal then
		f51_arg0:InsertMenuInfo( #f51_arg0.menuInfoStack + 1, f51_arg1 )
	else
		local f51_local0 = #f51_arg0.menuInfoStack + 1
		while f51_local0 > 1 and f51_arg0.menuInfoStack[f51_local0 - 1].isModal do
			f51_local0 = f51_local0 - 1
		end
		f51_arg0:InsertMenuInfo( f51_local0, f51_arg1 )
	end
end

LUI.FlowManager.SetStack = function ( f52_arg0, f52_arg1 )
	assert( f52_arg1.name )
	local f52_local0 = PresetStacks[f52_arg1.name]
	if not f52_local0 then
		return 
	end
	local f52_local1 = f52_arg1.controller
	DebugPrint( "FlowManager: Rewriting menu stack for " .. f52_arg1.name )
	if Engine.IsDevelopmentBuild() then
		local f52_local2 = ""
		for f52_local7, f52_local8 in ipairs( f52_arg0.menuInfoStack ) do
			local f52_local9 = f52_local2
			local f52_local6
			if f52_local7 > 1 then
				f52_local6 = " > "
				if not f52_local6 then
				
				else
					f52_local2 = f52_local9 .. f52_local6 .. f52_local8.name
				end
			end
			f52_local6 = ""
		end
		DebugPrint( "    Current stack: " .. f52_local2 )
		f52_local2 = ""
		for f52_local7, f52_local8 in ipairs( f52_local0 ) do
			local f52_local9 = f52_local2
			local f52_local6
			if f52_local7 > 1 then
				f52_local6 = " > "
				if not f52_local6 then
				
				else
					f52_local2 = f52_local9 .. f52_local6 .. f52_local8.name
				end
			end
			f52_local6 = ""
		end
		DebugPrint( "    Requesting: " .. f52_local2 .. " > " .. f52_arg1.name )
	end
	for f52_local5, f52_local7 in ipairs( f52_arg0.menuInfoStack ) do
		if #f52_local0 < f52_local5 or f52_local7.name ~= f52_local0[f52_local5].name then
			for f52_local8 = #f52_arg0.menuInfoStack, f52_local5, -1 do
				local f52_local10 = f52_arg0.menuInfoStack[f52_local8]
				if not f52_local10.isModal then
					f52_arg0:CloseMenuInfo( f52_local10 )
					f52_arg0:RemoveMenuInfo( f52_local10 )
				end
			end
		end
	end
	for f52_local5, f52_local7 in ipairs( f52_local0 ) do
		if #f52_arg0.menuInfoStack < f52_local5 or f52_local7.name ~= f52_arg0.menuInfoStack[f52_local5].name then
			f52_arg0:PushMenuInfo( f52_arg0:CreateMenuInfo( f52_local7.name, nil, f52_local7.exclusiveController, f52_local1 ) )
		end
	end
	DebugPrint( "Set stack complete" )
end

LUI.FlowManager.PrintStack = function ( f53_arg0 )
	DebugPrint( "----MENU STACK TOP----" )
	for f53_local0 = #f53_arg0.menuInfoStack, 1, -1 do
		local f53_local3 = f53_arg0.menuInfoStack[f53_local0]
		DebugPrint( f53_local0 .. ") " .. f53_local3.name .. " (" .. (f53_local3.menu and "Opened" or "Closed") .. ")" )
	end
	DebugPrint( "---MENU STACK BOTTOM---" )
end

LUI.FlowManager.StackContains = function ( f54_arg0, f54_arg1 )
	for f54_local3, f54_local4 in ipairs( f54_arg0.menuInfoStack ) do
		if f54_local4.name == f54_arg1 then
			return true
		end
	end
	return false
end

LUI.FlowManager.GetStackTop = function ( f55_arg0 )
	local f55_local0 = #f55_arg0.menuInfoStack
	while f55_local0 >= 1 and f55_arg0.menuInfoStack[f55_local0].isModal do
		f55_local0 = f55_local0 - 1
	end
	if f55_local0 >= 1 then
		return f55_arg0.menuInfoStack[f55_local0]
	else
		return nil
	end
end

LUI.FlowManager.GetTopMostOpenMenuInfo = function ( f56_arg0 )
	local f56_local0 = #f56_arg0.menuInfoStack
	while f56_local0 >= 1 and not f56_arg0.menuInfoStack[f56_local0].menu do
		f56_local0 = f56_local0 - 1
	end
	if f56_local0 >= 1 then
		return f56_arg0.menuInfoStack[f56_local0]
	else
		return nil
	end
end

LUI.FlowManager.IsStackEmpty = function ( f57_arg0 )
	return #f57_arg0.menuInfoStack == 0
end

LUI.FlowManager.init = function ( f58_arg0, f58_arg1, f58_arg2 )
	if not f58_arg1 then
		f58_arg1 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	end
	if not f58_arg2 then
		f58_arg2 = {}
	end
	LUI.UIElement.init( f58_arg0, f58_arg1 )
	f58_arg0.id = "flowManager"
	f58_arg0.root = f58_arg2.root
	f58_arg0.menuInfoStack = {}
	f58_arg0.stackVersion = 0
	f58_arg0.stackChangeTime = Engine.GetMilliseconds()
	f58_arg0.stackChangeMenu = 0
	f58_arg0:registerEventHandler( "gamepad_button", function ( element, event )
		local f59_local0 = f58_arg0:GetTopMostOpenMenuInfo()
		if f59_local0 then
			local f59_local1 = f59_local0.controller == event.controller
			if not f59_local1 then
				f59_local1 = event.controller == nil
			end
			if not f59_local1 then
				f59_local1 = f59_local0.controller == nil
			end
			if f59_local1 or not f59_local0.isControllerExclusive then
				return element:ForwardEventToTopMostOpenMenu( event )
			end
		end
		return false
	end )
	if not Engine.IsConsoleGame() then
		f58_arg0:registerEventHandler( "mousemove", f58_arg0.ForwardMouseEventToTopMostOpenMenu )
		f58_arg0:registerEventHandler( "mousedown", f58_arg0.ForwardMouseEventToTopMostOpenMenu )
		f58_arg0:registerEventHandler( "mouseup", f58_arg0.ForwardMouseEventToTopMostOpenMenu )
	end
	f58_arg0:registerEventHandler( "addmenu", f58_arg0.addMenuHandler )
	f58_arg0:registerEventHandler( "popupmenu", f58_arg0.popupMenuHandler )
	f58_arg0:registerEventHandler( "leavemenu", f58_arg0.leaveMenuHandler )
	f58_arg0:registerEventHandler( "restoreMenu", f58_arg0.restoreMenuHandler )
	f58_arg0:registerEventHandler( "closeallmenus", f58_arg0.closeAllMenusHandler )
	if Engine.IsCoreMode() and not Engine.InFrontend() then
		f58_arg0:registerOmnvarHandler( "ui_options_menu", function ( f60_arg0, f60_arg1 )
			f60_arg0:OpenMenuByScriptRequest( f60_arg1.value )
		end )
		f58_arg0:OpenMenuByScriptRequest( Game.GetOmnvar( "ui_options_menu" ) )
	end
end

LUI.FlowManager.FollowPartyHost = function ( f61_arg0, f61_arg1 )
	if not Engine.IsAnyLocalClientActive() then
		return 
	end
	local f61_local0 = Engine.IsAliensMode() and LUI.FlowManager.FlowMenus.CP or LUI.FlowManager.FlowMenus.MP
	local f61_local1 = f61_local0[f61_arg1]
	if not f61_local1 then
		return 
	end
	for f61_local5, f61_local6 in pairs( IgnoreFollowHostCallbacks ) do
		if f61_arg0:StackContains( f61_local5 ) and f61_local6( f61_local1 ) then
			return 
		end
	end
	f61_local2 = f61_arg0:StackContains( f61_local1 )
	f61_local3 = false
	for f61_local4 = f61_arg1 + 1, PartyUIRoot.LAST, 1 do
		if f61_arg0:StackContains( f61_local0[f61_local4] ) then
			f61_local3 = true
			break
		end
	end
	if f61_local2 and not f61_local3 then
		return 
	end
	DebugPrint( "LUI.FlowManager.FollowPartyHost to " .. f61_local1 )
	f61_local4 = Engine.GetFirstActiveController()
	f61_arg0:closeAllMenus()
	f61_arg0:addMenu( {
		menu = f61_local1,
		controller = f61_local4
	} )
end

LUI.FlowManager.OpenMenuByScriptRequest = function ( f62_arg0, f62_arg1 )
	assert( Engine.IsCoreMode() )
	local f62_local0 = {
		"TeamSelectMenu",
		"InGameLoadoutSelect"
	}
	local f62_local1 = f62_local0[f62_arg1]
	if f62_local1 then
		LUI.FlowManager.RequestAddMenu( f62_local1, true, f62_arg0.root:GetControllerIndex(), false, false, true )
		LUI.FlowManager.RequestSetStack( f62_local1, {
			{
				name = "MPPauseMenu"
			}
		} )
	else
		LUI.FlowManager.RequestCloseAllMenus()
	end
end

LUI.FlowManager.ShouldBeVisible = function ( f63_arg0 )
	local f63_local0 = Engine.InFrontend()
	if not f63_local0 then
		f63_local0 = Game.IsInitialized()
	end
	return f63_local0
end

LUI.FlowManager.LogMenuChangeTo = function ( f64_arg0, f64_arg1, f64_arg2 )
	if f64_arg0.stackChangeMenu ~= f64_arg2 then
		local f64_local0 = Engine.GetMilliseconds()
		local f64_local1 = f64_local0 - f64_arg0.stackChangeTime
		if f64_arg0.stackChangeMenu ~= 0 then
			Engine.TelemetryMenuChange( f64_arg1, f64_arg0.stackChangeMenu, f64_arg2, f64_local1 )
		end
		f64_arg0.stackChangeMenu = f64_arg2
		f64_arg0.stackChangeTime = f64_local0
	end
end

LUI.FlowManager.Frame = function ( f65_arg0 )
	f65_arg0:RefreshStack()
end

LUI.FlowManager.InitLayer = function ( f66_arg0 )
	if Engine.InFrontend() and not f66_arg0._partyRootSubscription then
		local f66_local0 = LUI.DataSourceInGlobalModel.new( "frontEnd.lobby.partyUIRoot" )
		f66_arg0._partyRootSubscription = f66_arg0:SubscribeToModel( f66_local0:GetModel( 0 ), function ( f67_arg0 )
			f66_arg0:FollowPartyHost( Lobby.GetPartyUIRoot() )
		end )
	end
end

LUI.FlowManager.ClearLayer = function ( f68_arg0 )
	f68_arg0:closeAllMenus()
	if f68_arg0._partyRootSubscription then
		f68_arg0:UnsubscribeFromModel( f68_arg0._partyRootSubscription )
		f68_arg0._partyRootSubscription = nil
	end
end

LUI.FlowManager.RefreshStack = function ( f69_arg0 )
	if #f69_arg0.menuInfoStack == 0 then
		return 
	end
	for f69_local8, f69_local9 in ipairs( f69_arg0.menuInfoStack ) do
		if f69_local9.fenceGroup then
			f69_local9.fenceGroup:Frame()
		end
		local f69_local3 = f69_local9.fenceGroup
		if f69_local3 then
			f69_local3 = not f69_local9.fenceGroup:Passes()
		end
		f69_local9.fenced = f69_local3
		if f69_local9.fenced then
			for f69_local3 = f69_local8 + 1, #f69_arg0.menuInfoStack, 1 do
				local f69_local6 = f69_arg0.menuInfoStack[f69_local3]
				if f69_local6 then
					local f69_local7 = f69_local6.fenceGroup
					if f69_local7 then
						f69_local7:Reset()
					end
				end
			end
		end
	end
	f69_local0 = #f69_arg0.menuInfoStack
	for f69_local9, f69_local3 in ipairs( f69_arg0.menuInfoStack ) do
		if f69_local3.fenced then
			f69_local0 = f69_local9 - 1
			break
		end
	end
	f69_local1 = 1
	for f69_local3, f69_local4 in ipairs( f69_arg0.menuInfoStack ) do
		if not f69_local4.isPopup and (f69_local4.menu or f69_local3 <= f69_local0) then
			local f69_local5 = assert
			local f69_local10 = f69_local4.menu
			if not f69_local10 then
				f69_local10 = not f69_local4.fenced
			end
			f69_local5( f69_local10 )
			f69_local1 = f69_local3
		end
	end
	f69_local2 = f69_arg0:GetStackVersion()
	for f69_local4, f69_local5 in ipairs( f69_arg0.menuInfoStack ) do
		if f69_local2 ~= f69_arg0:GetStackVersion() then
			return f69_arg0:RefreshStack()
		elseif f69_local4 < f69_local1 then
			if f69_local5.menu and not AlwaysVisible[f69_local5.name] then
				f69_arg0:CloseMenuInfo( f69_local5, false, true )
			end
		end
		if not f69_local5.menu and (f69_local4 <= f69_local0 or f69_local5.isModal) then
			assert( not f69_local5.fenced )
			Engine.MeasureResourceEventStart( "(FlowManager OpenMenuInfo) " .. f69_local5.name, "widget" )
			f69_arg0:OpenMenuInfo( f69_local5 )
			Engine.MeasureResourceEventEnd( "(FlowManager OpenMenuInfo) " .. f69_local5.name, "widget" )
		end
	end
	for f69_local4, f69_local5 in ipairs( f69_arg0.menuInfoStack ) do
		local f69_local10 = f69_local5.onTop == true
		local f69_local6 = f69_local5.menu
		if f69_local6 then
			f69_local6 = f69_local4 == #f69_arg0.menuInfoStack
		end
		f69_local5.onTop = f69_local6
		if f69_local4 > f69_local0 or f69_local0 >= #f69_arg0.menuInfoStack then
			f69_local6 = false
		else
			f69_local6 = true
		end
		if f69_local5.menu then
			if f69_local5.onTop then
				if f69_local5.menu.popupActive then
					f69_local5.menu:processEvent( {
						name = "popup_inactive",
						dispatchChildren = true
					} )
					f69_local5.menu.popupActive = nil
				end
				if not f69_local10 then
					if DisableMousePointer[f69_local5.name] == true then
						f69_arg0.root:RemoveMouseCursor()
					else
						f69_arg0.root:TryAddMouseCursor()
					end
					local f69_local11, f69_local12 = f69_local5.menu:restoreState( SavedMenuStates[f69_local5.name], f69_local5.controller )
					if not f69_local11 or f69_local12 == 0 then
						Engine.MeasureResourceEventStart( "(FlowManager gain_focus) " .. f69_local5.name, "widget" )
						f69_local5.menu:processEvent( {
							name = "gain_focus",
							controller = f69_local5.controller,
							focusType = FocusType.MenuFlow
						} )
						Engine.MeasureResourceEventEnd( "(FlowManager gain_focus) " .. f69_local5.name, "widget" )
					end
					SavedMenuStates[f69_local5.name] = nil
				end
			else
				if f69_local10 then
					SavedMenuStates[f69_local5.name] = f69_local5.menu:saveState()
					f69_local5.menu:processEvent( {
						name = "lose_focus"
					} )
					f69_local5.menu:processEvent( {
						name = "popup_active",
						dispatchChildren = true
					} )
				end
				f69_local5.menu.popupActive = true
			end
			if f69_local5.menu.isBelowBlockingFence ~= f69_local6 then
				f69_local5.menu.isBelowBlockingFence = f69_local6
				if f69_local6 then
					f69_local5.menu:processEvent( {
						name = "below_blocking_fence"
					} )
				else
					f69_local5.menu:processEvent( {
						name = "not_below_blocking_fence"
					} )
				end
			end
		end
	end
end

LUI.FlowManager.processEvent = function ( f70_arg0, f70_arg1 )
	local f70_local0 = nil
	local f70_local1 = f70_arg0.m_eventHandlers[f70_arg1.name]
	if f70_local1 then
		f70_local0 = f70_local1( f70_arg0, f70_arg1 )
	else
		f70_local0 = LUI.UIElement.processEvent( f70_arg0, f70_arg1 )
	end
	if not f70_local0 and f70_arg0.IsNavigationEvent( f70_arg1 ) then
		f70_arg0:EnsureFocus()
	end
	return f70_local0
end

LUI.FlowManager.EnsureFocus = function ( f71_arg0 )
	local f71_local0 = f71_arg0.menuInfoStack[#f71_arg0.menuInfoStack]
	if f71_local0 and f71_local0.menu and not f71_local0.menu:getFirstInFocus() then
		DebugPrint( "FlowManager: No child in focus, trying to restore focus.  This should probably only happen when using a mouse" )
		f71_local0.menu:processEvent( {
			name = "gain_focus"
		} )
		DebugPrint( "CheckRestoreFocus to " .. f71_local0.name )
	end
end

LUI.FlowManager.ForwardEventToTopMostOpenMenu = function ( f72_arg0, f72_arg1 )
	local f72_local0 = f72_arg0:GetTopMostOpenMenuInfo()
	if f72_local0 then
		return f72_local0.menu:processEvent( f72_arg1 )
	else
		return false
	end
end

LUI.FlowManager.ForwardMouseEventToTopMostOpenMenu = function ( f73_arg0, f73_arg1 )
	f73_arg0:applyElementTransform()
	local f73_local0 = f73_arg0:GetTopMostOpenMenuInfo()
	local f73_local1 = f73_arg0:ForwardEventToTopMostOpenMenu( f73_arg1 )
	f73_arg0:undoElementTransform()
	if f73_arg1.name == "mousemove" then
		if f73_local0 ~= nil then
			return not DontBlockMouseMoveEvents[f73_local0.name]
		else
			return true
		end
	else
		return f73_local1
	end
end

LUI.FlowManager.IsNavigationEvent = function ( f74_arg0 )
	if f74_arg0.name == "gamepad_button" and f74_arg0.down and f74_arg0.qualifier ~= "mousewheel" and (f74_arg0.button == "up" or f74_arg0.button == "down" or f74_arg0.button == "left" or f74_arg0.button == "right") then
		return true
	else
		return false
	end
end

