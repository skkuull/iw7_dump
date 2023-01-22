DebugPrint( "Running main.lua" )
function OpenTitleScreen()
	LUI.FlowManager.RequestAddMenu( "MainLockoutMenu", nil, nil, false, {}, true )
end

function OpenInitialMenu()
	local f2_local0 = Engine.IsAnyUserSignedIn()
	local f2_local1 = Engine.IsAnyLocalClientActive()
	local f2_local2
	if not Engine.IsMultiplayer() then
		f2_local2 = not Engine.IsSingleplayer()
	else
		f2_local2 = false
	end
	if Engine.GetDvarBool( "Kleenex" ) then
		LUI.FlowManager.RequestAddMenu( "LevelSelectMenu", nil, nil, false, {}, true )
	elseif Engine.InFrontend() and (f2_local2 or not f2_local0 or not f2_local1) then
		if Engine.MustShowSplashScreens() then
			LUI.FlowManager.RequestAddMenu( "splash_screens", nil, nil, false, {}, true )
		else
			OpenTitleScreen()
		end
	elseif Engine.InFrontend() and Engine.IsMultiplayer() then
		local f2_local3 = Engine.GetFirstActiveController()
		if Engine.HasAcceptedInvite() then
			
		elseif IsPublicMatch() and Engine.InLobby() then
			if Engine.IsAliensMode() then
				LUI.FlowManager.RequestAddMenu( "CPPublicMatchMenu", nil, f2_local3, false, {}, true )
			else
				LUI.FlowManager.RequestAddMenu( "LobbyMission", nil, f2_local3, false, {}, true )
			end
		elseif IsMlgGameBattlesMatch() then
			local f2_local4 = "GameBattlesLobby"
			if GAMEBATTLES.IsCurrentMatchCompleted( f2_local3 ) then
				DebugPrint( "GameBattlesLobby - From Main.lua - MLG.SetActiveGameIndex( 0 )" )
				MLG.SetActiveGameIndex( 0 )
				Lobby.LeaveCustomGameLobby()
				Engine.SetDvarBool( "cg_mlg_gamebattles_match", false )
				f2_local4 = "MPMainMenu"
			end
			LUI.FlowManager.RequestAddMenu( f2_local4, nil, f2_local3, false, {}, true )
		elseif IsPrivateMatch() then
			if Engine.IsAliensMode() then
				LUI.FlowManager.RequestAddMenu( "CPPrivateMatchMenu", nil, f2_local3, false, {}, true )
			else
				LUI.FlowManager.RequestAddMenu( "PrivateMatchLobby", nil, f2_local3, false, {}, true )
			end
		elseif IsSystemLink() then
			if Engine.InLobby() then
				if Engine.IsAliensMode() then
					LUI.FlowManager.RequestAddMenu( "CPSystemLinkLobby", nil, f2_local3, false, {}, true )
				else
					LUI.FlowManager.RequestAddMenu( "MPSystemLinkLobby", nil, f2_local3, false, {}, true )
				end
			elseif IsSystemLink() then
				if Engine.IsAliensMode() then
					LUI.FlowManager.RequestAddMenu( "CPSystemLinkMenu", nil, f2_local3, false, {}, true )
				else
					LUI.FlowManager.RequestAddMenu( "MPSystemLinkMenu", nil, f2_local3, false, {}, true )
				end
			end
		elseif IsOnlineMatch() then
			if Engine.IsAliensMode() then
				LUI.FlowManager.RequestAddMenu( "CPMainMenu", nil, f2_local3, false, {}, true )
			else
				LUI.FlowManager.RequestAddMenu( "Missions", nil, f2_local3, false, {}, true )
			end
		else
			LUI.FlowManager.RequestAddMenu( "MainMenu", nil, f2_local3, false, {}, true )
		end
	elseif Engine.InFrontend() and Engine.IsSingleplayer() then
		if not Engine.HasAcceptedInvite() then
			LUI.FlowManager.RequestAddMenu( "CampaignMenu", nil, Engine.GetFirstActiveController(), false, {}, true )
		end
	elseif Engine.IsSingleplayer() and not Engine.InFrontend() and Engine.GetDvarBool( "cl_pregame" ) then
		LUI.FlowManager.RequestAddMenu( "pre_game", nil, nil, nil, nil, true )
	end
end

function Main()
	if Engine.InFrontend() then
		InitFrontEndDataSources()
		PersistentBackground.SetToDefault()
	end
	CoD.UpdateGameMode( Engine.GetCurrentCoDPlayMode(), CoD.PlayMode.None )
	if not Engine.InFrontend() and Engine.GetProfileData( "renderColorBlind" ) then
		CoD.UseColorblindColors()
	end
	OpenInitialMenu()
end

