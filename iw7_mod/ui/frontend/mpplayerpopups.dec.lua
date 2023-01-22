local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function LobbyMemberKick( f1_arg0, f1_arg1 )
	assert( f1_arg1.xuid )
	local f1_local0 = MenuBuilder.BuildRegisteredType( "PopupYesNo", {
		title = Engine.Localize( "MPUI_KICK_PLAYER" ),
		message = Engine.Localize( "XBOXLIVE_KICKPLAYER", Engine.MarkLocalized( Lobby.GetGamertag( f1_arg1.xuid ) ) ),
		yesAction = function ( f2_arg0, f2_arg1 )
			Lobby.KickPlayer( f1_arg1.xuid )
		end,
		noAction = function ()
			
		end
	} )
	f1_local0.id = "LobbyMemberKick"
	return f1_local0
end

function LobbyMemberActions( f4_arg0, f4_arg1 )
	local f4_local0 = f4_arg1.xuid
	assert( f4_local0 )
	local f4_local1 = Lobby.IsLocalPlayer( f4_local0 )
	local f4_local2 = {
		title = Engine.Localize( "MPUI_PLAYER_OPTIONS" ),
		message = "",
		buttons = {}
	}
	local f4_local3 = Lobby.IsInLobby()
	local f4_local4
	if f4_local3 and Lobby.IsGameHost() then
		f4_local4 = IsPrivateMatch()
		if not f4_local4 then
			if not f4_local3 then
				f4_local4 = Lobby.IsPrivatePartyHost()
			else
				f4_local4 = false
			end
		end
	elseif not f4_local3 then
		f4_local4 = Lobby.IsPrivatePartyHost()
	else
		f4_local4 = false
	end
	if Engine.IsConsoleGame() or Engine.IsPCApp() then
		table.insert( f4_local2.buttons, {
			label = Engine.Localize( "XBOXLIVE_VIEW_PROFILE" ),
			action = function ( f5_arg0, f5_arg1 )
				Lobby.ShowGamerCard( f5_arg1, f4_local0 )
			end
		} )
	end
	if not f4_local1 and not (Engine.IsGamepadEnabled() == 1) then
		table.insert( f4_local2.buttons, {
			label = Engine.Localize( "XBOXLIVE_PLAYER_MUTE" ),
			action = function ( f6_arg0, f6_arg1 )
				Lobby.ToggleMute( f6_arg1, f4_local0 )
			end
		} )
	end
	if not f4_local1 and not IsSystemLink() then
		table.insert( f4_local2.buttons, {
			label = Engine.Localize( "MENU_REPORT_PLAYER" ),
			action = function ()
				LUI.FlowManager.RequestPopupMenu( nil, "ReportPlayer", true, controllerIndex, false, {
					xuid = f4_local0
				} )
			end
		} )
	end
	if f4_local4 and (IsPrivateMatch() or not f4_local3) and not f4_local1 and not IsMlgGameBattlesMatch() then
		table.insert( f4_local2.buttons, {
			label = Engine.Localize( "XBOXLIVE_KICK" ),
			action = function ()
				LUI.FlowManager.RequestPopupMenu( nil, "LobbyMemberKick", true, controllerIndex, false, {
					xuid = f4_local0
				} )
			end
		} )
	end
	local f4_local5 = MenuBuilder.BuildRegisteredType( "PopupMessageAndButtons", f4_local2 )
	f4_local5.id = "LobbyMemberActions"
	return f4_local5
end

if not LobbyMember then
	LobbyMember = {}
end
function playerUnmutable()
	return {
		type = "generic_confirmation_popup",
		id = "player_unmutable_popup_id",
		properties = {
			message_text = Engine.Localize( "@XBOXLIVE_EXTERNALMUTE_TITLE" ),
			popup_title = Engine.Localize( "@MENU_NOTICE" ),
			button_text = Engine.Localize( "@MENU_OK" ),
			confirmation_action = nil,
			dialog_top = -75,
			dialog_bottom = 75
		}
	}
end

MenuBuilder.registerDef( "playerUnmutable", playerUnmutable )
MenuBuilder.registerType( "LobbyMemberKick", LobbyMemberKick )
MenuBuilder.registerType( "LobbyMemberActions", LobbyMemberActions )
LockTable( _M )
