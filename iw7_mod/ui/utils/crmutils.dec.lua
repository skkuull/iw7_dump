CRM = CRM or {}
CRM.locations = {
	UNUSABLE = 0,
	MP_MOTD = 1,
	MP_MSGS = 2,
	ENFORCEMENT_NOTIFICATIONS = 9,
	CS_NOTIFICATIONS = 10,
	CP_MOTD = 11,
	CP_MSGS = 12
}
CRM.keys = {
	TITLE = "title",
	CONTENT_SHORT = "content_short",
	POPUP_ACTION_TITLE = "popup_action_title",
	POPUP_IMAGE = "popup_image",
	ACTION_TITLE = "action_title",
	ACTION = "action",
	ACTION_LOCATION = "action_location",
	IMAGE = "image",
	CONTENT_LONG = "content_long",
	LAYOUT_TYPE = "layout_type",
	FORCE_VIEW_TIME = "force_view_time",
	ACTION_ITEM = "item",
	LOCATION_ID = "location_id",
	MESSAGE_INDEX = "message_index",
	CHECKSUM = "checksum"
}
CRM.viewTime = 10000
CRM.readViews = 5
CRM.CSLocationMessages = 2
CRM.LayoutRegisteredTypes = {
	["0"] = "CRMSplitWindow",
	["1"] = "CRMFullWindow"
}
CRM.menuModelPath = "frontEnd.CRMWindow"
CRM.supportedSmallImages = {
	image_motd_cp_dlc3_small = true,
	image_motd_mp_22xp_centered_small = true,
	image_motd_mp_2wxp_centered_small = true,
	image_motd_mp_2xk_centered_small = true,
	image_motd_mp_2xp_centered_small = true,
	image_motd_mp_2xp_tokens_small = true,
	image_motd_mp_announcer1_small = true,
	image_motd_mp_announcer1_v2_small = true,
	image_motd_mp_announcer003_small = true,
	image_motd_mp_announcer004_small = true,
	image_motd_mp_bloodanvil_v2_small = true,
	image_motd_mp_bo4_dde_plus_small = true,
	image_motd_mp_bo4_dde_small = true,
	image_motd_mp_bo4_shield_small = true,
	image_motd_mp_carnage2xp_small = true,
	image_motd_mp_cwl_generic_small = true,
	image_motd_mp_cwl_loot_small = true,
	image_motd_mp_cwlpack_small = true,
	image_motd_mp_cysp_small = true,
	image_motd_mp_demolition_small = true,
	image_motd_mp_dlc1_keyart_small = true,
	image_motd_mp_dlc2_keyart_small = true,
	image_motd_mp_dlc2_turista_small = true,
	image_motd_mp_dlc3_bermuda_small = true,
	image_motd_mp_dlc3_ember_small = true,
	image_motd_mp_dlc3_fore_small = true,
	image_motd_mp_dlc3_keyart_v1_small = true,
	image_motd_mp_dlc3_keyart_v2_small = true,
	image_motd_mp_dlc3_permafrost_small = true,
	image_motd_mp_dos_generic_small = true,
	image_motd_mp_dos_keyart_small = true,
	image_motd_mp_dos_showcase_small = true,
	image_motd_mp_dropzone_small = true,
	image_motd_mp_epicgungame_small = true,
	image_motd_mp_feast_v1_small = true,
	image_motd_mp_feast_v2_small = true,
	image_motd_mp_ftlrig_small = true,
	image_motd_mp_generic01_small = true,
	image_motd_mp_generic1_small = true,
	image_motd_mp_generic2_small = true,
	image_motd_mp_hack_generic_small = true,
	image_motd_mp_halloween_bossbattles_v1_small = true,
	image_motd_mp_halloween_bossbattles_v2_small = true,
	image_motd_mp_halloween_bossbattles_v3_small = true,
	image_motd_mp_halloween_gesturegame_small = true,
	image_motd_mp_halloween_hacks_w1_small = true,
	image_motd_mp_halloween_hacks_w2_small = true,
	image_motd_mp_halloween_hacks_w3_small = true,
	image_motd_mp_halloween_halloween_small = true,
	image_motd_mp_halloween_quadfeed_small = true,
	image_motd_mp_halloween_triple_play_mp_small = true,
	image_motd_mp_halloween_triple_play_zm_small = true,
	image_motd_mp_hypertdm_small = true,
	image_motd_mp_luck_v1_small = true,
	image_motd_mp_luck_v2_small = true,
	image_motd_mp_mercrig_small = true,
	image_motd_mp_missionteams_all_v2_small = true,
	image_motd_mp_mkii_v2_small = true,
	image_motd_mp_mlg_gamebattles_small = true,
	image_motd_mp_mwr_keyart_small = true,
	image_motd_mp_mwrkeyart_small = true,
	image_motd_mp_mtx12_epicweaponkit_small = true,
	image_motd_mp_mtx12_hyperxp_small = true,
	image_motd_mp_mtx12_playercards_small = true,
	image_motd_mp_mtx12_showcase_small = true,
	image_motd_mp_mtx12_taunts_small = true,
	image_motd_mp_mtx12_weapons_small = true,
	image_motd_mp_nuke_v1_small = true,
	image_motd_mp_nuke_v2_small = true,
	image_motd_mp_phantomrig_small = true,
	image_motd_mp_quartermaster4_small = true,
	image_motd_mp_quartermaster5_small = true,
	image_motd_mp_reload_v1_small = true,
	image_motd_mp_reload_v2_small = true,
	image_motd_mp_s2_dde_small = true,
	image_motd_mp_s2_generic_small = true,
	image_motd_mp_sd_bundle20_centered_small = true,
	image_motd_mp_sd_bundle25_centered_small = true,
	image_motd_mp_sd_bundle_small = true,
	image_motd_mp_sd_sale25_centered_small = true,
	image_motd_mp_sdsale_centered_small = true,
	image_motd_mp_sdsale_v2_small = true,
	image_motd_mp_seasonpass_small = true,
	image_motd_mp_silent_v1_small = true,
	image_motd_mp_silent_v2_small = true,
	image_motd_mp_sp_v2_small = true,
	image_motd_mp_stats_sdf_small = true,
	image_motd_mp_stats_unsa_small = true,
	image_motd_mp_strykerrig_small = true,
	image_motd_mp_synapticrig_small = true,
	image_motd_mp_tacticaltdm_small = true,
	image_motd_mp_tripleplay_small = true,
	image_motd_mp_vobundle_small = true,
	image_motd_mp_warfighterrig_small = true,
	image_motd_mp_wreck_v1_small = true,
	image_motd_mp_wreck_v2_small = true,
	image_motd_mp_zm_small = true,
	image_motd_zm_bombstoppers_small = true,
	image_motd_zm_candymachines_small = true,
	image_motd_zm_fateandfortune_small = true,
	image_motd_zm_portal_small = true,
	image_motd_zm_supplydrop_small = true,
	image_motd_zm_ziskeyart_small = true,
	image_motd_cp_dlc4_keyart_v1_small = true,
	image_motd_cp_dlc4_keyart_v2_small = true,
	image_motd_mp_dlc4_altitude_v1_small = true,
	image_motd_mp_dlc4_altitude_v2_small = true,
	image_motd_mp_dlc4_carnage_v1_small = true,
	image_motd_mp_dlc4_carnage_v2_small = true,
	image_motd_mp_dlc4_depot22_v1_small = true,
	image_motd_mp_dlc4_depot22_v2_small = true,
	image_motd_mp_dlc4_heartland_v1_small = true,
	image_motd_mp_dlc4_heartland_v2_small = true,
	image_motd_mp_dlc4_keyart_v1_small = true,
	image_motd_mp_dlc4_keyart_v2_small = true
}
CRM.MessageQueue = {}
CRM.QueueMessage = function ( f1_arg0, f1_arg1 )
	table.insert( CRM.MessageQueue, {
		message = f1_arg0,
		controllerIndex = f1_arg1
	} )
end

CRM.SendQueuedMessages = function ()
	while #CRM.MessageQueue > 0 do
		local f2_local0 = table.remove( CRM.MessageQueue, 1 )
		Engine.Exec( f2_local0.message, f2_local0.controllerIndex )
	end
end

CRM.IsLocationMOTD = function ( f3_arg0 )
	local f3_local0
	if f3_arg0 ~= CRM.locations.MP_MOTD and f3_arg0 ~= CRM.locations.CP_MOTD then
		f3_local0 = false
	else
		f3_local0 = true
	end
	return f3_local0
end

CRM.TryForceOpenCRMWindow = function ( f4_arg0, f4_arg1, f4_arg2 )
	if Lobby.IsInPrivateParty() and not Lobby.IsPrivatePartyHost() then
		return 
	elseif not Engine.IsProfileSignedIn( f4_arg0 ) then
		return false
	elseif not f4_arg2 then
		f4_arg2 = 0
	end
	local f4_local0 = CRM.GetMessageContent( f4_arg0, f4_arg1, f4_arg2 )
	if f4_local0 then
		if f4_arg1 == CRM.locations.MP_MOTD or f4_arg1 == CRM.locations.CP_MOTD then
			local f4_local1
			if f4_arg1 == CRM.locations.MP_MOTD then
				f4_local1 = "mpMotdChecksum"
				if not f4_local1 then
				
				else
					local f4_local2 = f4_local0[CRM.keys.CHECKSUM]
					if f4_local2 == Engine.GetPlayerDataEx( f4_arg0, CoD.StatsGroup.Common, f4_local1 ) and Engine.GetDvarString( "alwaysShowMOTD" ) ~= "1" then
						return false
					end
					Engine.SetPlayerDataEx( f4_arg0, CoD.StatsGroup.Common, f4_local1, f4_local2 )
				end
			end
			f4_local1 = "cpMotdChecksum"
		end
		CRM.OpenCRMWindow( f4_local0.layout_type, f4_arg1, f4_arg2, f4_arg0, true )
		return true
	end
end

CRM.OpenCRMWindow = function ( f5_arg0, f5_arg1, f5_arg2, f5_arg3, f5_arg4 )
	LUI.FlowManager.RequestPopupMenu( self, "CRMContainer", false, f5_arg3, false, {
		locationIndex = f5_arg1,
		messageIndex = f5_arg2,
		forceOpen = f5_arg4
	} )
end

CRM.ViewMessage = function ( f6_arg0, f6_arg1 )
	local f6_local0 = LUI.DataSourceInGlobalModel.new( "alwaysLoaded.CRM.views." .. f6_arg0[CRM.keys.CHECKSUM]:GetValue( f6_arg1 ) )
	local f6_local1 = f6_local0:GetValue( f6_arg1 ) or 0
	if f6_local1 + 1 == CRM.readViews then
		f6_local0:SetValue( f6_arg1, 0 )
		CRM.QueueMessage( "markCRMMessageRead " .. f6_arg0.location_id:GetValue( f6_arg1 ) .. " " .. f6_arg0.message_index:GetValue( f6_arg1 ), f6_arg1 )
		return true
	elseif f6_local1 < CRM.readViews then
		f6_local0:SetValue( f6_arg1, f6_local1 + 1 )
	end
end

CRM.GetMessageContent = function ( f7_arg0, f7_arg1, f7_arg2 )
	local f7_local0 = Engine.CRMGetMessageContent( f7_arg0, f7_arg1, f7_arg2 )
	if f7_local0 then
		return f7_local0.message
	else
		return false
	end
end

CRM.GetMenuMessageDataSources = function ( f8_arg0, f8_arg1, f8_arg2 )
	local f8_local0, f8_local1 = nil
	if Engine.IsCoreMode() then
		f8_local0 = CRM.locations.MP_MOTD
		f8_local1 = CRM.locations.MP_MSGS
	else
		f8_local0 = CRM.locations.CP_MOTD
		f8_local1 = CRM.locations.CP_MSGS
	end
	local f8_local2 = {}
	for f8_local3 = 0, Engine.CRMGetValidMessageCount( f8_arg1, f8_local1 ), 1 do
		if #f8_local2 == 4 then
			break
		end
		local f8_local6 = CRM.GetMessageContent( f8_arg1, f8_local1, f8_local3 )
		if f8_local6 and (not f8_arg2 or CRM.DoesMessageOpenPopup( f8_local6 )) then
			local f8_local7 = CRM.GetMessageDataSources( f8_arg0, f8_arg1, f8_local1, f8_local3 )
			if f8_local7 then
				f8_local7.index = #f8_local2
				table.insert( f8_local2, f8_local7 )
			end
		end
	end
	local f8_local3 = CRM.GetMessageContent( f8_arg1, f8_local0, 0 )
	if f8_local3 and (not f8_arg2 or CRM.DoesMessageOpenPopup( f8_local3 )) then
		local f8_local4 = CRM.GetMessageDataSources( f8_arg0, f8_arg1, f8_local0, 0 )
		if f8_local4 then
			f8_local4.index = #f8_local2
			table.insert( f8_local2, f8_local4 )
		end
	end
	return f8_local2
end

CRM.DoesMessageOpenPopup = function ( f9_arg0 )
	return f9_arg0.content_long and f9_arg0.content_long ~= ""
end

CRM.GetMessageDataSources = function ( f10_arg0, f10_arg1, f10_arg2, f10_arg3 )
	local f10_local0 = CRM.GetMessageContent( f10_arg1, f10_arg2, f10_arg3 )
	if not f10_local0 then
		return nil
	end
	f10_local0.image = f10_local0[CRM.keys.IMAGE] or "image_motd_main"
	if not f10_local0[CRM.keys.ACTION_TITLE] or f10_local0[CRM.keys.ACTION_TITLE] == "" then
		if CRM.DoesMessageOpenPopup( f10_local0 ) then
			f10_local0[CRM.keys.ACTION_TITLE] = Engine.Localize( "LUA_MENU_OPEN_CRM_POPUP" )
		else
			f10_local0[CRM.keys.ACTION_TITLE] = ""
		end
	end
	if f10_local0[CRM.keys.IMAGE] then
		local f10_local1 = f10_local0[CRM.keys.IMAGE]
		local f10_local2 = f10_local1 .. "_small"
		if CRM.supportedSmallImages[f10_local2] then
			local f10_local3 = f10_local2
		end
		f10_local0.smallImage = f10_local3 or f10_local1
	end
	local f10_local1 = f10_arg0 .. "." .. f10_arg2 .. "." .. f10_arg3
	local f10_local2 = {}
	for f10_local7, f10_local8 in pairs( f10_local0 ) do
		f10_local2[f10_local7] = LUI.DataSourceInGlobalModel.new( f10_local1 .. "." .. f10_local7 )
		f10_local2[f10_local7]:SetValue( f10_arg1, f10_local8 )
	end
	if f10_local0[CRM.keys.ACTION] then
		f10_local4 = CRM.actionFunctions[f10_local0[CRM.keys.ACTION]]
		if f10_local4 ~= nil then
			f10_local2.actionFunction = f10_local4( f10_arg1, f10_local0 )
		end
	end
	return f10_local2
end

CRM.OpenNextCRMWindow = function ( f11_arg0 )
	if f11_arg0.nextLocation then
		local f11_local0 = CRM.TryForceOpenCRMWindow( Engine.GetFirstActiveController(), f11_arg0.nextLocation, f11_arg0.nextMessageIndex )
		if f11_arg0.nextLocation == CRM.locations.MP_MOTD or f11_arg0.nextLocation == CRM.locations.CP_MOTD then
			f11_arg0.nextLocation = CRM.locations.ENFORCEMENT_NOTIFICATIONS
		elseif f11_arg0.nextLocation == CRM.locations.ENFORCEMENT_NOTIFICATIONS then
			f11_arg0.nextLocation = CRM.locations.CS_NOTIFICATIONS
			f11_arg0.nextMessageIndex = 0
		elseif f11_arg0.nextLocation == CRM.locations.CS_NOTIFICATIONS then
			if f11_arg0.nextMessageIndex + 1 == CRM.CSLocationMessages then
				f11_arg0.nextLocation = nil
				f11_arg0.nextMessageIndex = nil
			else
				f11_arg0.nextMessageIndex = f11_arg0.nextMessageIndex + 1
			end
		else
			f11_arg0.nextLocation = nil
		end
		if not f11_local0 then
			CRM.OpenNextCRMWindow( f11_arg0 )
		end
	end
end

CRM.SetupForcedViewTime = function ( f12_arg0, f12_arg1, f12_arg2, f12_arg3, f12_arg4 )
	assert( f12_arg0.bindButton )
	if f12_arg2[CRM.keys.FORCE_VIEW_TIME] and f12_arg3 then
		local f12_local0 = tonumber( f12_arg2[CRM.keys.FORCE_VIEW_TIME]:GetValue( f12_arg1 ) ) * 1000
		local f12_local1 = MenuBuilder.BuildRegisteredType( "UICountdown", {
			controllerIndex = f12_arg1
		} )
		f12_local1.id = "CountdownElement"
		f12_local1:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
		f12_local1:SetAlignment( LUI.Alignment.Right )
		f12_local1:setEndTime( Engine.GetMilliseconds() + f12_local0 )
		f12_local1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1402, _1080p * 1604, _1080p * 907, _1080p * 952 )
		f12_arg0:addElement( f12_local1 )
		local f12_local2 = f12_arg0:Wait( f12_local0 )
		f12_local2.onComplete = function ()
			f12_local1:closeTree()
			f12_local1 = nil
			f12_arg4:AddButtonHelperText( {
				helper_text = Engine.Localize( "MENU_BACK" ),
				button_ref = "button_secondary",
				side = "left",
				priority = -10,
				clickable = true
			} )
			f12_arg0.bindButton:addEventHandler( "button_secondary", function ( f14_arg0, f14_arg1 )
				local f14_local0 = f14_arg1.controller or f12_arg1
				ACTIONS.LeaveMenu( f12_arg0 )
			end )
		end
		
	else
		f12_arg0:addEventHandler( "menu_create", function ( f15_arg0, f15_arg1 )
			f12_arg4:AddButtonHelperText( {
				helper_text = Engine.Localize( "MENU_BACK" ),
				button_ref = "button_secondary",
				side = "left",
				priority = -10,
				clickable = true
			} )
		end )
		f12_arg0.bindButton:addEventHandler( "button_secondary", function ( f16_arg0, f16_arg1 )
			local f16_local0 = f16_arg1.controller or f12_arg1
			ACTIONS.LeaveMenu( f12_arg0 )
		end )
	end
end

CRM.SetupActionFunction = function ( f17_arg0, f17_arg1, f17_arg2, f17_arg3 )
	local f17_local0 = ""
	if f17_arg2.actionFunction then
		local f17_local1 = f17_arg2[CRM.keys.ACTION_TITLE]
		if f17_local1 then
			f17_local1 = f17_arg2[CRM.keys.ACTION_TITLE]:GetValue( f17_arg1 ) ~= ""
		end
		if f17_local1 then
			local f17_local2 = ToUpperCase( f17_arg2[CRM.keys.ACTION_TITLE]:GetValue( f17_arg1 ) )
		end
		f17_local0 = f17_local2 or Engine.Localize( "LUA_MENU_SELECT" )
		assert( f17_arg0.bindButton )
		f17_arg0.bindButton:addEventHandler( "button_alt1", function ( f18_arg0, f18_arg1 )
			LUI.FlowManager.RequestLeaveMenu( f18_arg0 )
			f17_arg2.actionFunction( f18_arg0, f18_arg1 )
		end )
	end
	f17_arg0:addEventHandler( "crm_window_added", function ( f19_arg0, f19_arg1 )
		f17_arg0:AddButtonHelperTextToElement( f17_arg3, {
			helper_text = f17_local0,
			button_ref = "button_alt1",
			side = "left",
			priority = 10,
			clickable = true
		} )
	end )
end

CRM.UpdateCRMData = function ( f20_arg0, f20_arg1, f20_arg2, f20_arg3, f20_arg4 )
	local f20_local0 = "markCRMMessageRead " .. f20_arg2 .. " " .. f20_arg3
	if f20_arg4 then
		CRM.QueueMessage( f20_local0, f20_arg1 )
	else
		Engine.Exec( f20_local0, f20_arg1 )
	end
	f20_arg0:dispatchEventToRoot( {
		name = "update_crm_data",
		controllerIndex = f20_arg1
	} )
end

CRM.QueueReadMessage = function ( f21_arg0, f21_arg1, f21_arg2, f21_arg3 )
	CRM.QueueMessage( "markCRMMessageRead " .. f21_arg2 .. " " .. f21_arg3, f21_arg1 )
end

local f0_local0 = function ( f22_arg0, f22_arg1 )
	return function ( f23_arg0, f23_arg1 )
		Engine.Exec( string.format( "clickCRMMessageAction %d %d %s %s", f22_arg1[CRM.keys.LOCATION_ID], f22_arg1[CRM.keys.MESSAGE_INDEX], "goto_ingame", "store" ), f22_arg0 )
		if not CRM.DoesMessageOpenPopup( f22_arg1 ) then
			CRM.QueueMessage( "markCRMMessageRead " .. f22_arg1[CRM.keys.LOCATION_ID] .. " " .. f22_arg1[CRM.keys.MESSAGE_INDEX], f22_arg0 )
		end
		local f23_local0 = STORE.GoToStore
		local f23_local1 = f23_arg1.controller or f22_arg0
		local f23_local2 = f23_arg0:GetCurrentMenu()
		f23_local0( f23_local1, f23_local2.id, f23_arg0.id )
	end
	
end

local f0_local1 = function ( f24_arg0, f24_arg1 )
	return function ( f25_arg0, f25_arg1 )
		local f25_local0 = f24_arg1.item
		Engine.Exec( string.format( "clickCRMMessageAction %d %d %s %s", f24_arg1[CRM.keys.LOCATION_ID], f24_arg1[CRM.keys.MESSAGE_INDEX], "goto_ingame", f25_local0 ), f24_arg0 )
		if not CRM.DoesMessageOpenPopup( f24_arg1 ) then
			CRM.QueueMessage( "markCRMMessageRead " .. f24_arg1[CRM.keys.LOCATION_ID] .. " " .. f24_arg1[CRM.keys.MESSAGE_INDEX], f24_arg0 )
		end
		local f25_local1 = STORE.GoToStore
		local f25_local2 = f24_arg0
		local f25_local3 = f25_arg0:GetCurrentMenu()
		f25_local1( f25_local2, f25_local3.id, f25_arg0.id, f25_local0 )
	end
	
end

local f0_local2 = function ( f26_arg0, f26_arg1 )
	return function ( f27_arg0, f27_arg1 )
		Engine.Exec( string.format( "clickCRMMessageAction %d %d %s %s", f26_arg1[CRM.keys.LOCATION_ID], f26_arg1[CRM.keys.MESSAGE_INDEX], "goto_ingame", "Armory" ), f26_arg0 )
		if not CRM.DoesMessageOpenPopup( f26_arg1 ) then
			CRM.QueueMessage( "markCRMMessageRead " .. f26_arg1[CRM.keys.LOCATION_ID] .. " " .. f26_arg1[CRM.keys.MESSAGE_INDEX], f26_arg0 )
		end
		if not Engine.IsUserAGuest( f26_arg0 ) then
			LUI.FlowManager.RequestAddMenu( "Armory", true, f26_arg0 )
		end
	end
	
end

local f0_local3 = function ( f28_arg0, f28_arg1 )
	return function ( f29_arg0, f29_arg1 )
		local f29_local0 = f28_arg1.item
		Engine.Exec( string.format( "clickCRMMessageAction %d %d %s %s", f28_arg1[CRM.keys.LOCATION_ID], f28_arg1[CRM.keys.MESSAGE_INDEX], "goto_console", f29_local0 ), f28_arg0 )
		if not CRM.DoesMessageOpenPopup( f28_arg1 ) then
			CRM.QueueMessage( "markCRMMessageRead " .. f28_arg1[CRM.keys.LOCATION_ID] .. " " .. f28_arg1[CRM.keys.MESSAGE_INDEX], f28_arg0 )
		end
		local f29_local1 = STORE.GoToStore
		local f29_local2 = f29_arg1.controller or f28_arg0
		local f29_local3 = f29_arg0:GetCurrentMenu()
		f29_local1( f29_local2, f29_local3.id, f29_arg0.id, f29_local0, true )
	end
	
end

local f0_local4 = function ( f30_arg0, f30_arg1 )
	assert( f30_arg1[CRM.keys.ACTION_LOCATION] )
	local f30_local0 = CRM.LocationFunctions[f30_arg1[CRM.keys.ACTION_LOCATION]]
	if f30_arg1[CRM.keys.ACTION_LOCATION] == "store" and f30_arg1[CRM.keys.ITEM] then
		f30_local0 = CRM.LocationFunctions.store_item
	end
	if f30_local0 ~= nil then
		return f30_local0( f30_arg0, f30_arg1 )
	else
		
	end
end

MenuBuilder.registerType( "RegistrationFailedPopup", function ()
	local f31_local0 = MenuBuilder.BuildRegisteredType( "PopupOK", {
		message = Engine.Localize( "LUA_MENU_MP_REGISTRATION_FAILED" )
	} )
	f31_local0.id = "RegistrationFailedPopup"
	return f31_local0
end )
MenuBuilder.registerType( "RegisteringEmailPopup", function ( f32_arg0, f32_arg1 )
	local f32_local0 = MenuBuilder.BuildRegisteredType( "FenceDialogPopup", {
		message = Engine.Localize( "LUA_MENU_MP_REGISTERING_EMAIL" ),
		controllerIndex = f32_arg1.controllerIndex
	} )
	f32_local0.id = "RegisteringEmailPopup"
	f32_local0:addEventHandler( "registration_success", function ( f33_arg0, f33_arg1 )
		Engine.Exec( string.format( "clickCRMMessageAction %d %d %s %s", f32_arg1.locationIndex, f32_arg1.messageIndex, "register", "registration_success" ), f32_arg1.controllerIndex )
		CRM.UpdateCRMData( f33_arg0, f32_arg1.controllerIndex, f32_arg1.locationIndex, f32_arg1.messageIndex, false )
		LUI.FlowManager.RequestLeaveMenu( f33_arg0 )
	end )
	f32_local0:addEventHandler( "registration_error", function ( f34_arg0, f34_arg1 )
		Engine.Exec( string.format( "clickCRMMessageAction %d %d %s %s", f32_arg1.locationIndex, f32_arg1.messageIndex, "register", "registration_error" ), f32_arg1.controllerIndex )
		LUI.FlowManager.RequestLeaveMenu( f34_arg0 )
		LUI.FlowManager.RequestPopupMenu( f34_arg0, "RegistrationFailedPopup", true, f32_arg1.controllerIndex, false )
	end )
	return f32_local0
end )
local f0_local5 = function ( f35_arg0, f35_arg1 )
	return function ( f36_arg0, f36_arg1 )
		OSK.OpenScreenKeyboard( f35_arg0, Engine.Localize( "LUA_MENU_MP_REGISTER_EMAIL" ), "", 128, false, false, false, function ( f37_arg0, f37_arg1, f37_arg2 )
			if f37_arg1 then
				LUI.FlowManager.RequestPopupMenu( f36_arg0, "RegisteringEmailPopup", true, f37_arg0, false, {
					messageIndex = f35_arg1[CRM.keys.MESSAGE_INDEX],
					locationIndex = f35_arg1[CRM.keys.LOCATION_ID]
				} )
				Engine.RegisterAccount( f37_arg0, f37_arg1 )
			end
		end )
	end
	
end

local f0_local6 = function ( menu, controller )
	local self = LUI.UIElement.new()
	self:addEventHandler( "menu_create", function ( f39_arg0, f39_arg1 )
		local f39_local0 = f0_local5( controller.controllerIndex, {
			content_long = "KentRocks"
		} )
		f39_local0( f39_arg0 )
		LUI.FlowManager.RequestLeaveMenu( f39_arg0 )
	end )
	return self
end

if Engine.IsDevelopmentBuild() then
	MenuBuilder.registerType( "RegisterTestPopup", f0_local6 )
end
local f0_local7 = function ( f40_arg0, f40_arg1 )
	return function ( f41_arg0, f41_arg1 )
		if not CRM.DoesMessageOpenPopup( f40_arg1 ) then
			CRM.UpdateCRMData( f41_arg0, f40_arg0, f40_arg1[CRM.keys.LOCATION_ID], f40_arg1[CRM.keys.MESSAGE_INDEX] )
		end
		if CODACCOUNT.IsAccessDisabled( f40_arg0 ) then
			LUI.FlowManager.RequestPopupMenu( f41_arg0, "CODAccountUnavailablePopup", true, f40_arg0, false, {
				controllerIndex = f40_arg0
			}, nil, false )
		else
			CODACCOUNT.OpenCoDAccountPopupMenu( f41_arg0, f40_arg0 )
		end
	end
	
end

MenuBuilder.registerType( "RedeemCRMMessagePopup", function ( f42_arg0, f42_arg1 )
	local f42_local0 = {
		message = Engine.Localize( "LUA_MENU_MP_REDEEM_CRM_CODE" ),
		controllerIndex = f42_arg1.controllerIndex
	}
	local f42_local1 = false
	local f42_local2 = MenuBuilder.BuildRegisteredType( "FenceDialogPopup", f42_local0 )
	f42_local2.id = "RedeemCRMMessagePopup"
	f42_local2:addEventHandler( "redemption_success", function ( f43_arg0, f43_arg1 )
		Engine.Exec( string.format( "clickCRMMessageAction %d %d %s %s", f42_arg1.locationIndex, f42_arg1.messageIndex, "redeem", "redemption_success" ), f42_arg1.controllerIndex )
		CRM.UpdateCRMData( f43_arg0, f42_arg1.controllerIndex, f42_arg1.locationIndex, f42_arg1.messageIndex, f42_local1 )
		LUI.FlowManager.RequestLeaveMenu( f43_arg0 )
		f43_arg0:dispatchEventToRoot( {
			name = "refresh_hacks_grid"
		} )
	end )
	f42_local2:addEventHandler( "redemption_failed", function ( f44_arg0, f44_arg1 )
		LUI.FlowManager.RequestLeaveMenu( f44_arg0 )
		if f44_arg1.errorAlreadyRedeemed then
			Engine.Exec( string.format( "clickCRMMessageAction %d %d %s %s", f42_arg1.locationIndex, f42_arg1.messageIndex, "redeem", "redemption_failed_already_redeemed" ), f42_arg1.controllerIndex )
			CRM.UpdateCRMData( f44_arg0, f42_arg1.controllerIndex, f42_arg1.locationIndex, f42_arg1.messageIndex, f42_local1 )
			LUI.FlowManager.RequestPopupMenu( f44_arg0, "code_already_redeemed_popup", true, f42_arg1.controllerIndex )
		elseif f44_arg1.errorCodeExpired then
			Engine.Exec( string.format( "clickCRMMessageAction %d %d %s %s", f42_arg1.locationIndex, f42_arg1.messageIndex, "redeem", "redemption_failed_code_expired" ), f42_arg1.controllerIndex )
			CRM.UpdateCRMData( f44_arg0, f42_arg1.controllerIndex, f42_arg1.locationIndex, f42_arg1.messageIndex, f42_local1 )
			LUI.FlowManager.RequestPopupMenu( f44_arg0, "code_expired_popup", true, f42_arg1.controllerIndex )
		else
			Engine.Exec( string.format( "clickCRMMessageAction %d %d %s %s", f42_arg1.locationIndex, f42_arg1.messageIndex, "redeem", "redemption_failed" ), f42_arg1.controllerIndex )
			LUI.FlowManager.RequestPopupMenu( f44_arg0, "code_redemption_failed_popup", true, f42_arg1.controllerIndex )
		end
	end )
	return f42_local2
end )
local f0_local8 = function ( f45_arg0, f45_arg1 )
	return function ( f46_arg0, f46_arg1 )
		LUI.FlowManager.RequestPopupMenu( f46_arg0, "RedeemCRMMessagePopup", true, f45_arg0, false, {
			messageIndex = f45_arg1[CRM.keys.MESSAGE_INDEX],
			locationIndex = f45_arg1[CRM.keys.LOCATION_ID]
		} )
		Engine.CRMRedeemAllCodesForMessage( f45_arg0, f45_arg1[CRM.keys.LOCATION_ID], f45_arg1[CRM.keys.MESSAGE_INDEX] )
	end
	
end

CRM.InitPopupWindow = function ( f47_arg0, f47_arg1, f47_arg2 )
	assert( f47_arg0.locationIndex )
	assert( f47_arg0.messageIndex )
	local f47_local0 = MenuBuilder.BuildRegisteredType( CRM.LayoutRegisteredTypes[f47_arg1], {
		controllerIndex = f47_arg0.controllerIndex
	} )
	if f47_arg0 then
		f47_local0.CRMLastMessageIndex = f47_arg0.messageIndex
		f47_local0.CRMLastLocationIndex = f47_arg0.locationIndex
		f47_local0.CRMLastControllerIndex = f47_arg0.controllerIndex
		f47_local0.CRMForceOpen = f47_arg0.forceOpen
	end
	local f47_local1 = f47_local0.CRMLastControllerIndex
	local f47_local2 = CRM.GetMessageDataSources( CRM.menuModelPath, f47_local1, f47_local0.CRMLastLocationIndex, f47_local0.CRMLastMessageIndex )
	f47_local0:SetDataSource( f47_local2, f47_local1 )
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "bindButton"
	f47_local0:addElement( bindButton )
	f47_local0.bindButton = bindButton
	
	CRM.SetupActionFunction( f47_local0, f47_local1, f47_local2, f47_arg2 )
	CRM.SetupForcedViewTime( f47_local0, f47_local1, f47_local2, f47_arg0.forceOpen, f47_arg2 )
	f47_local0:addEventHandler( "menu_close", function ( f48_arg0, f48_arg1 )
		if not f47_local2.action or f47_local2.action:GetValue( f47_local1 ) ~= "redeem" then
			CRM.UpdateCRMData( f48_arg0, f47_local1, f47_local0.CRMLastLocationIndex, f47_local0.CRMLastMessageIndex, true )
		end
	end )
	return f47_local0
end

CRM.actionFunctions = {
	goto_ingame = f0_local4,
	goto_console = f0_local3,
	register = f0_local5,
	registration = f0_local7,
	redeem = f0_local8
}
CRM.LocationFunctions = {
	store = f0_local0,
	store_item = f0_local1,
	black_market = f0_local2
}
