local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function leaveLobbyBlockedPlayerWarningYesAction( f1_arg0, f1_arg1 )
	if AreWePrivatePartyHost() then
		Engine.Exec( "xstoplobbybackout leavelobbyblockedplayerwarning", f1_arg1.controller )
	else
		Engine.Exec( "xstopparty leavelobbyblockedplayerwarning", f1_arg1.controller )
	end
	Engine.Exec( "xblive_privatematch 0" )
	SetIsAliensSolo( false )
	if Lobby.GetBotsConnectType() > 0 then
		Lobby.SetBotsConnectType( 0 )
	end
	if MLG.AreMLGRulesEnabled() then
		MLG.Toggle( f1_arg0, f1_arg1 )
	end
end

function leavelobbyblockedplayerwarning()
	return {
		type = "generic_yesno_popup",
		properties = {
			message_text = Engine.Localize( "@XBOXLIVE_LEAVELOBBYBLOCKEDPLAYER" ),
			popup_title = Engine.Localize( "@MENU_NOTICE" ),
			yes_action = leaveLobbyBlockedPlayerWarningYesAction,
			default_focus_index = 2
		}
	}
end

MenuBuilder.registerDef( "leavelobbyblockedplayerwarning", leavelobbyblockedplayerwarning )
LockTable( _M )
