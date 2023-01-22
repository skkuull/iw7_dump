local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
function MLGGamebattlesFirstTimePopup( f1_arg0, f1_arg1 )
	local f1_local0 = {
		title = Engine.Localize( "MLG_GAMEBATTLES_CAPS" ),
		width = _1080p * 900,
		defaultFocusIndex = 1,
		cancelClosesPopup = true
	}
	local f1_local1 = MenuBuilder.BuildRegisteredType( "GameBattlesFirstTimePopup", {
		controllerIndex = f1_arg1.controllerIndex
	} )
	f1_local1.id = "GameBattlesFirstTimePopup"
	f1_local0.listContent = {}
	table.insert( f1_local0.listContent, f1_local1 )
	local f1_local2 = MenuBuilder.BuildRegisteredType( "PopupList", f1_local0 )
	f1_local2.id = "MLGGamebattlesFirstTimePopup"
	return f1_local2
end

function MLGGamebattlesCannotConnectPopup( f2_arg0, f2_arg1 )
	local f2_local0 = MenuBuilder.buildItems( {
		type = "generic_confirmation_popup",
		properties = {
			popup_title = Engine.Localize( "MLG_GAMEBATTLES_CAPS" ),
			message_text = Engine.Localize( "MLG_GAMEBATTLES_CANNOT_CONNECT" )
		}
	} )
	f2_local0.id = "MLGGamebattlesCannotConnectPopup"
	return f2_local0
end

function MLGGamebattlesNoSocialNetworkPrivilegesPopup( f3_arg0, f3_arg1 )
	local f3_local0 = MenuBuilder.buildItems( {
		type = "generic_confirmation_popup",
		properties = {
			popup_title = Engine.Localize( "MLG_GAMEBATTLES_CAPS" ),
			message_text = Engine.Localize( "MLG_GAMEBATTLES_NO_SOCIAL_PRIVILEGES" )
		}
	} )
	f3_local0.id = "MLGGamebattlesNoSocialNetworkPrivilegesPopup"
	return f3_local0
end

function MLGGameBattlesMatchHistoryFailPopup( f4_arg0, f4_arg1 )
	local f4_local0 = MenuBuilder.buildItems( {
		type = "generic_confirmation_popup",
		properties = {
			popup_title = Engine.Localize( "MLG_GAMEBATTLES_CAPS" ),
			message_text = Engine.Localize( "MLG_GAMEBATTLES_MATCH_HISTORY_FAIL" )
		}
	} )
	f4_local0.id = "MLGGameBattlesMatchHistoryFailPopup"
	return f4_local0
end

function MLGGamebattlesUnregisteredPopup( f5_arg0, f5_arg1 )
	local f5_local0 = {
		title = Engine.Localize( "LUA_MENU_MP_WELCOME" ),
		width = _1080p * 800,
		defaultFocusIndex = 1,
		cancelClosesPopup = true
	}
	local f5_local1 = MenuBuilder.BuildRegisteredType( "GameBattlesUnregisteredUserPopup", {
		controllerIndex = f5_arg1.controllerIndex
	} )
	f5_local1.id = "GameBattlesUnregisteredUserPopup"
	f5_local0.listContent = {}
	table.insert( f5_local0.listContent, f5_local1 )
	local f5_local2 = MenuBuilder.BuildRegisteredType( "PopupList", f5_local0 )
	f5_local2.id = "MLGGamebattlesUnregisteredPopup"
	return f5_local2
end

function MLGGamebattlesMatchExpiredPopup( f6_arg0, f6_arg1 )
	local f6_local0 = MenuBuilder.buildItems( {
		type = "generic_confirmation_popup",
		properties = {
			popup_title = Engine.Localize( "MLG_GAMEBATTLES_CAPS" ),
			message_text = Engine.Localize( "MLG_GAMEBATTLES_MATCH_EXPIRED", f6_arg1.matchID )
		}
	} )
	f6_local0.id = "MLGGamebattlesMatchExpiredPopup"
	return f6_local0
end

function MLGGamebattlesMatchCancelledPopup( f7_arg0, f7_arg1 )
	local f7_local0 = MenuBuilder.buildItems( {
		type = "generic_confirmation_popup",
		properties = {
			popup_title = Engine.Localize( "MLG_GAMEBATTLES_CAPS" ),
			message_text = Engine.Localize( "MLG_GAMEBATTLES_NO_DEDICATED_SERVER", f7_arg1.matchID )
		}
	} )
	f7_local0.id = "MLGGamebattlesMatchCancelledPopup"
	return f7_local0
end

function MLGGamebattlesMatchForfeitPopup( f8_arg0, f8_arg1 )
	local f8_local0 = {
		title = Engine.Localize( "MLG_GAMEBATTLES_CAPS" ),
		width = _1080p * 800,
		defaultFocusIndex = 1,
		cancelClosesPopup = true
	}
	local f8_local1 = MenuBuilder.BuildRegisteredType( "GameBattlesMatchForfeit", {
		controllerIndex = f8_arg1.controllerIndex,
		currentDateTime = f8_arg1.currentDateTime,
		forfeitTeamName = f8_arg1.forfeitTeamName,
		forfeitTeamId = f8_arg1.forfeitTeamId,
		winningTeamName = f8_arg1.winningTeamName,
		winningTeamId = f8_arg1.winningTeamId,
		matchID = f8_arg1.matchID
	} )
	f8_local1.id = "GameBattlesMatchForfeit"
	f8_local0.listContent = {}
	table.insert( f8_local0.listContent, f8_local1 )
	local f8_local2 = MenuBuilder.BuildRegisteredType( "PopupList", f8_local0 )
	f8_local2.id = "MLGGamebattlesMatchForfeitPopup"
	return f8_local2
end

function MLGGamebattlesNoShowWinDiscardedPopup( f9_arg0, f9_arg1 )
	local f9_local0 = MenuBuilder.buildItems( {
		type = "generic_confirmation_popup",
		properties = {
			popup_title = Engine.Localize( "MLG_GAMEBATTLES_CAPS" ),
			message_text = Engine.Localize( "MLG_GAMEBATTLES_NO_SHOW_WIN_DISCARDED" )
		}
	} )
	f9_local0.id = "MLGGamebattlesNoShowWinDiscardedPopup"
	return f9_local0
end

function MLGGamebattlesMatchResultsPopup( f10_arg0, f10_arg1 )
	local f10_local0 = {
		title = Engine.Localize( "MLG_GAMEBATTLES_CAPS" ),
		width = _1080p * 800,
		defaultFocusIndex = 1,
		cancelClosesPopup = true
	}
	local f10_local1 = MenuBuilder.BuildRegisteredType( "GameBattlesMatchResults", {
		controllerIndex = f10_arg1.controllerIndex,
		alliesWins = f10_arg1.alliesWins,
		axisWins = f10_arg1.axisWins,
		gbMatch = f10_arg1.gbMatch
	} )
	f10_local1.id = "GameBattlesMatchResults"
	f10_local0.listContent = {}
	table.insert( f10_local0.listContent, f10_local1 )
	local f10_local2 = MenuBuilder.BuildRegisteredType( "PopupList", f10_local0 )
	f10_local2.id = "MLGGamebattlesMatchResultsPopup"
	return f10_local2
end

function MLGGamebattlesCantJoinGamePopup( f11_arg0, f11_arg1 )
	local f11_local0 = MenuBuilder.buildItems( {
		type = "generic_confirmation_popup",
		properties = {
			popup_title = Engine.Localize( "MLG_GAMEBATTLES_CAPS" ),
			message_text = Engine.Localize( "MLG_GAMEBATTLES_CANNOT_JOIN_GAME" )
		}
	} )
	f11_local0.id = "MLGGamebattlesCantJoinGamePopup"
	return f11_local0
end

function MLGGamebattlesCantHostGamePopup( f12_arg0, f12_arg1 )
	local f12_local0 = MenuBuilder.buildItems( {
		type = "generic_confirmation_popup",
		properties = {
			popup_title = Engine.Localize( "MLG_GAMEBATTLES_CAPS" ),
			message_text = Engine.Localize( "MLG_GAMEBATTLES_CANNOT_HOST_GAME" )
		}
	} )
	f12_local0.id = "MLGGamebattlesCantHostGamePopup"
	return f12_local0
end

f0_local0 = function ( f13_arg0, f13_arg1 )
	local f13_local0 = MenuBuilder.BuildRegisteredType( "PopupOK", {
		width = 600,
		title = Engine.Localize( "MLG_GAMEBATTLES_CAPS" ),
		message = Engine.Localize( "MLG_GAMEBATTLES_SPLITSCREEN_WARNING" ),
		defaultFocusIndex = 1,
		cancelClosesPopup = true,
		buttonsClosePopup = true
	} )
	f13_local0.id = "MLGGamebattlesSplitscreenPopup"
	return f13_local0
end

MenuBuilder.registerType( "MLGGamebattlesFirstTimePopup", MLGGamebattlesFirstTimePopup )
MenuBuilder.registerType( "MLGGamebattlesCannotConnectPopup", MLGGamebattlesCannotConnectPopup )
MenuBuilder.registerType( "MLGGamebattlesNoSocialNetworkPrivilegesPopup", MLGGamebattlesNoSocialNetworkPrivilegesPopup )
MenuBuilder.registerType( "MLGGameBattlesMatchHistoryFailPopup", MLGGameBattlesMatchHistoryFailPopup )
MenuBuilder.registerType( "MLGGamebattlesUnregisteredPopup", MLGGamebattlesUnregisteredPopup )
MenuBuilder.registerType( "MLGGamebattlesMatchCancelledPopup", MLGGamebattlesMatchCancelledPopup )
MenuBuilder.registerType( "MLGGamebattlesMatchExpiredPopup", MLGGamebattlesMatchExpiredPopup )
MenuBuilder.registerType( "MLGGamebattlesMatchForfeitPopup", MLGGamebattlesMatchForfeitPopup )
MenuBuilder.registerType( "MLGGamebattlesMatchResultsPopup", MLGGamebattlesMatchResultsPopup )
MenuBuilder.registerType( "MLGGamebattlesCantJoinGamePopup", MLGGamebattlesCantJoinGamePopup )
MenuBuilder.registerType( "MLGGamebattlesCantHostGamePopup", MLGGamebattlesCantHostGamePopup )
MenuBuilder.registerType( "MLGGamebattlesSplitscreenPopup", f0_local0 )
MenuBuilder.registerType( "MLGGamebattlesNoShowWinDiscardedPopup", MLGGamebattlesNoShowWinDiscardedPopup )
