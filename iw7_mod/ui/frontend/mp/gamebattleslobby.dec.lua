local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
LUI.FlowManager.RegisterFenceGroup( "GameBattlesLobby", {
	"mlgAccount",
	"mlgSchedule",
	"mlgData"
} )
LUI.FlowManager.RequestSetStack( "GameBattlesLobby", {
	{
		name = "MainLockoutMenu"
	},
	{
		name = "MainMenu"
	},
	{
		name = "MPMainMenu"
	}
} )
f0_local0 = 5000
f0_local1 = function ()
	Engine.SetDvarBool( "party_teamBased", true )
	Engine.SetDvarBool( "cg_mlg_gamebattles_match", true )
	MatchRules.SetUsingMatchRulesData( 1 )
end

f0_local2 = function ()
	Engine.SetDvarBool( "party_teamBased", false )
	WipeGlobalModelsAtPath( "frontEnd.MP.gameBattlesLobby" )
	Lobby.ClearLocalCommitReady()
	CODCASTER.SetCODCastingEnabled( false )
end

local f0_local3 = function ( f3_arg0, f3_arg1 )
	Engine.SetDvarBool( "cg_mlg_gamebattles_match", false )
	Lobby.LeaveCustomGameLobby()
	MLG.SetActiveGameIndex( 0 )
	MLG.SetUsingMLGRules( false )
	LUI.FlowManager.RequestLeaveMenu( f3_arg0 )
end

local f0_local4 = function ( f4_arg0, f4_arg1 )
	return function ( f5_arg0, f5_arg1 )
		LUI.FlowManager.RequestLeaveMenu( f5_arg0 )
		f0_local3( f4_arg0, f4_arg1 )
	end
	
end

local f0_local5 = function ( f6_arg0, f6_arg1, f6_arg2 )
	local f6_local0 = LUI.DataSourceFromList.new( f6_arg0 )
	f6_local0.MakeDataSourceAtIndex = f6_arg2
	return {
		members = f6_local0
	}
end

local f0_local6 = function ( f7_arg0, f7_arg1 )
	local f7_local0 = DataSources.alwaysLoaded.activeParty
	local f7_local1 = "alwaysLoaded.activeParty"
	f7_arg0.teamAlliesCountDataSource = LUI.DataSourceInGlobalModel.new( f7_local1 .. ".members.teamAlliesCount" )
	f7_arg0.teamAxisCountDataSource = LUI.DataSourceInGlobalModel.new( f7_local1 .. ".members.teamAxisCount" )
	f7_arg0.teamSpectatorCountDataSource = LUI.DataSourceInGlobalModel.new( f7_local1 .. ".members.teamSpectatorCount" )
	f7_local0.teamAllies = f0_local5( f7_arg0.teamAlliesCountDataSource, Teams.allies, GetLobbyMemberDataSourceAtIndex( "alwaysLoaded.activeParty.members" ) )
	f7_local0.teamAxis = f0_local5( f7_arg0.teamAxisCountDataSource, Teams.axis, function ( f8_arg0, f8_arg1, f8_arg2 )
		local f8_local0 = GetLobbyMemberDataSourceAtIndex( "alwaysLoaded.activeParty.members" )
		return f8_local0( f8_arg0, f8_arg1 + MLG.GetMaxMlgTeamSize(), f8_arg2 )
	end )
	f7_local0.teamSpectator = f0_local5( f7_arg0.teamSpectatorCountDataSource, Teams.spectator, function ( f9_arg0, f9_arg1, f9_arg2 )
		local f9_local0 = GetLobbyMemberDataSourceAtIndex( "alwaysLoaded.activeParty.members" )
		return f9_local0( f9_arg0, f9_arg1 + MLG.GetMaxMlgTeamSize() * 2, f9_arg2 )
	end )
end

function PreLoadFunc( f10_arg0, f10_arg1, f10_arg2 )
	Engine.SetDvarInt( "party_maxplayers", 16 )
	Engine.ExecNow( "xblive_privatematch 1" )
	if not Engine.InLobby() then
		Engine.ExecNow( "xstartprivatematch" )
	end
	f0_local6( f10_arg0, f10_arg1 )
	if MLG.GetGameBattleMatchId( f10_arg1 ) == GAMEBATTLES.INVALID_MATCH_ID then
		local f10_local0 = GAMEBATTLES.GetFirstActiveMatch( f10_arg1 )
		if f10_local0 ~= nil then
			MLG.SetGameBattleMatchId( f10_local0.matchId )
		end
	end
	local f10_local0 = nil
	local f10_local1 = function ()
		local f11_local0 = GAMEBATTLES.GetCurrentMatch( f10_arg1 )
		if f11_local0 ~= nil then
			local f11_local1, f11_local2, f11_local3 = GAMEBATTLES.GetMatchVictoryInfo( f11_local0 )
			local f11_local4 = f11_local1 + f11_local2
			if f11_local4 > MLG.GetActiveGameIndex() or f11_local4 == f11_local0.gameCount then
				MLG.SetActiveGameIndex( f11_local4 )
				local f11_local5, f11_local6 = GAMEBATTLES.GetMatchProgressInfo( f11_local0 )
				if not f11_local6 and MLG.IsGameBattleMatchJoined( f10_arg1 ) then
					LUI.FlowManager.RequestPopupMenu( f10_arg0, "MLGGamebattlesMatchResultsPopup", false, f10_arg1, false, {
						controllerIndex = f10_arg1,
						gbMatch = f11_local0,
						alliesWins = f11_local1,
						axisWins = f11_local2
					} )
				end
			end
		else
			f10_arg0.updateMatchInfoTimer = f10_arg0:Wait( 500 )
			f10_arg0.updateMatchInfoTimer.onComplete = f10_local0
		end
	end
	
	f10_local1()
end

local f0_local7 = function ( f12_arg0, f12_arg1, f12_arg2 )
	assert( f12_arg0.bindButton )
	assert( f12_arg0.GameBattlesLobbyButtons )
	assert( f12_arg0.MatchDetails )
	assert( f12_arg0.MatchDetails.Title.VoteTitle )
	f12_arg0.GameBattlesLobbyButtons.upcomingMatchInfo = f12_arg0.UpcomingMatchInfo
	CODCASTER.SetCODCastingEnabled( true )
	Lobby.SetCodcastingEnabled( true )
	if CONDITIONS.IsDraftEnabled() then
		LoadoutDrafting.SetEnabled( false )
	end
	Lobby.SetupGameBattlesMatchLobbyScene( f12_arg1 )
	f12_arg0:removeElement( f12_arg0.GameBattlesTeamsLobbyMembers )
	f12_arg0.GameBattlesTeamsLobbyMembers.LobbyMembersAllies.StatusLabel:setText( "" )
	f12_arg0.GameBattlesTeamsLobbyMembers.LobbyMembersAxis.StatusLabel:setText( "" )
	f12_arg0.GameBattlesTeamsLobbyMembers.LobbyMembersCodcasters.StatusLabel:setText( "" )
	ACTIONS.AnimateSequence( f12_arg0.GameBattlesTeamsLobbyMembers.LobbyMembersCodcasters, "CODCasters" )
	ACTIONS.AnimateSequence( f12_arg0.GameBattlesTeamsLobbyMembers, "NoCODCasters" )
	f12_arg0.gbMatch = GAMEBATTLES.GetCurrentMatch( f12_arg1 )
	if f12_arg0.gbMatch ~= nil then
		local f12_local0 = function ( f13_arg0, f13_arg1, f13_arg2 )
			return function ()
				local f14_local0 = f13_arg0:GetValue( f12_arg1 )
				if f14_local0 == 0 then
					f13_arg2.StatusLabel:setText( Engine.Localize( "MLG_GAMEBATTLES_TEAM_MEMBERS_EMPTY" ) )
				elseif f14_local0 < f13_arg1 then
					f13_arg2.StatusLabel:setText( Engine.Localize( "MLG_GAMEBATTLES_TEAM_MEMBERS_PARTIAL" ) )
				elseif f14_local0 == f13_arg1 then
					f13_arg2.StatusLabel:setText( Engine.Localize( "MLG_GAMEBATTLES_TEAM_MEMBERS_FULL" ) )
				end
			end
			
		end
		
		f12_arg0:SubscribeToModel( f12_arg0.teamAlliesCountDataSource:GetModel( f12_arg1 ), f12_local0( f12_arg0.teamAlliesCountDataSource, f12_arg0.gbMatch.teams[1].playerCount, f12_arg0.GameBattlesTeamsLobbyMembers.LobbyMembersAllies ) )
		f12_arg0:SubscribeToModel( f12_arg0.teamAxisCountDataSource:GetModel( f12_arg1 ), f12_local0( f12_arg0.teamAxisCountDataSource, f12_arg0.gbMatch.teams[2].playerCount, f12_arg0.GameBattlesTeamsLobbyMembers.LobbyMembersAxis ) )
		local f12_local1, f12_local2, f12_local3 = GAMEBATTLES.GetMatchVictoryInfo( f12_arg0.gbMatch )
		f12_arg0.GameBattlesTeamsLobbyMembers.LobbyMembersAllies.WinsCountDigit:setText( f12_local1 )
		f12_arg0.GameBattlesTeamsLobbyMembers.LobbyMembersAxis.WinsCountDigit:setText( f12_local2 )
		f12_arg0.GameBattlesTeamsLobbyMembers.LobbyMembersCodcasters.TeamName:setText( ToUpperCase( Engine.Localize( "MLG_GAMEBATTLES_TEAM_CODCASTERS_NAME" ) ) )
		f12_arg0:SubscribeToModel( DataSources.frontEnd.lobby.mapName:GetModel( f12_arg1 ), function ()
			f12_arg0.MatchDetails.Title.VoteTitle:setText( DataSources.frontEnd.lobby.mapName:GetValue( f12_arg1 ), 0 )
		end )
		ACTIONS.AnimateSequenceByElement( f12_arg0, {
			elementName = "MatchDetails",
			sequenceName = "LANVoteComplete",
			elementPath = "MapDetails"
		} )
		ACTIONS.AnimateSequenceByElement( f12_arg0, {
			elementName = "Title",
			sequenceName = "VoteComplete",
			elementPath = "MatchDetails.Title"
		} )
	else
		f12_arg0.GameBattlesTeamsLobbyMembers.LobbyMembersAllies.WinsCountDigit:SetAlpha( 0 )
		ACTIONS.AnimateSequence( f12_arg0.GameBattlesTeamsLobbyMembers.LobbyMembersAllies, "NoTeamName" )
		f12_arg0.GameBattlesTeamsLobbyMembers.LobbyMembersAxis.WinsCountDigit:SetAlpha( 0 )
		ACTIONS.AnimateSequence( f12_arg0.GameBattlesTeamsLobbyMembers.LobbyMembersAxis, "NoTeamName" )
		f12_arg0.GameBattlesTeamsLobbyMembers.LobbyMembersCodcasters.TeamName:setText( "" )
		ACTIONS.AnimateSequence( f12_arg0.GameBattlesTeamsLobbyMembers.LobbyMembersCodcasters, "NoTeamName" )
		f12_arg0.MatchDetails:SetAlpha( 0 )
	end
	f12_arg0.MatchDetails.VoteOptions:closeTree()
	f12_arg0:SubscribeToModel( f12_arg0.teamSpectatorCountDataSource:GetModel( f12_arg1 ), function ( f16_arg0 )
		local f16_local0 = DataModel.GetModelValue( f16_arg0 )
		if f16_local0 and f16_local0 > 0 then
			ACTIONS.AnimateSequence( f12_arg0.GameBattlesTeamsLobbyMembers, "CODCastersExpected" )
		else
			ACTIONS.AnimateSequence( f12_arg0.GameBattlesTeamsLobbyMembers, "NoCODCasters" )
		end
	end )
	Lobby.SetLocalPlayerTeam( Lobby.MemberListStates.Teams, f12_arg1, Teams.allies )
	f12_arg0.GameBattlesTeamsLobbyMembers.LobbyMembersAllies.TeamName:setText( "" )
	f12_arg0.GameBattlesTeamsLobbyMembers.LobbyMembersAllies.TeamNameBG:SetAlpha( 0 )
	f12_arg0.GameBattlesTeamsLobbyMembers.LobbyMembersAxis.TeamName:setText( "" )
	f12_arg0.GameBattlesTeamsLobbyMembers.LobbyMembersAxis.TeamNameBG:SetAlpha( 0 )
	local f12_local4 = LUI.DataSourceInGlobalModel.new( "frontEnd.mlg.isInRunningLobby" )
	f12_arg0:SubscribeToModel( f12_local4:GetModel( f12_arg1 ), function ()
		if f12_local4:GetValue( f12_arg1 ) then
			local f17_local0 = GAMEBATTLES.GetCurrentMatch( f12_arg1 )
			if f17_local0 ~= nil then
				MLG.SetGameBattleMatchId( f17_local0.matchId )
				f12_arg0.GameBattlesTeamsLobbyMembers.LobbyMembersAllies.TeamName:setText( f17_local0.teams[1].teamName )
				ACTIONS.AnimateSequence( f12_arg0.GameBattlesTeamsLobbyMembers.LobbyMembersAllies, "WithTeamName" )
				f12_arg0.GameBattlesTeamsLobbyMembers.LobbyMembersAxis.TeamName:setText( f17_local0.teams[2].teamName )
				ACTIONS.AnimateSequence( f12_arg0.GameBattlesTeamsLobbyMembers.LobbyMembersAxis, "WithTeamName" )
				f12_arg0.UpcomingMatchInfo.CountdownTitle:setText( Engine.Localize( "MLG_GAMEBATTLES_COUNTDOWN_NEXT_MATCH" ) )
				local f17_local1 = Lobby.GetGamertag( Engine.GetLocalClientXUID( f12_arg1 ) )
				if f17_local1 ~= nil then
					local f17_local2 = MLG.GetCurrentMatchTeamFromGamertag( f12_arg1, f17_local1 )
					Lobby.SetLocalPlayerTeam( Lobby.MemberListStates.Teams, f12_arg1, f17_local2 )
					if f17_local2 == Teams.spectator then
						ACTIONS.AnimateSequence( f12_arg0.GameBattlesTeamsLobbyMembers, "CODCastersExpected" )
						LobbyMember.SelectedMember_SetLocalMemberMLGSpectator( true, f12_arg1 )
						CODCASTER.CreateCODCasterSettingsButton( f12_arg0.GameBattlesLobbyButtons, f12_arg1 )
						f12_arg0.GameBattlesLobbyButtons.CommitReady:SetButtonDisabled( true )
					else
						LobbyMember.SelectedMember_SetLocalMemberMLGSpectator( false, f12_arg1 )
					end
				end
				MLG.SetUsingMLGRules( f17_local0.recipePreset == GAMEBATTLES.MLG_RECIPE_PRESET.RECIPE_CWL )
			else
				MLG.SetUsingMLGRules( false )
			end
			f12_arg0.ESportsRulesStatus:UpdateVisibility()
		end
	end )
	FrontEndScene.CurrentMissionTeam = MissionDirector.InvalidTeamID
	FrontEndScene.SetScene( "gamebattles_lobby" )
	ClientCharacter.SetCharacterVisible( FrontEndScene.ClientCharacters.Self, true )
	if Engine.GetDvarBool( "ui_opensummary" ) == true then
		DebugPrint( "GameBattlesLobby - Opening AAR" )
		OpenAfterActionReport( f12_arg1, true, true )
		Engine.SetDvarBool( "ui_opensummary", false )
	end
	Lobby.WakeLobbyParty( f12_arg1 )
	Lobby.SetPartyUIRoot( PartyUIRoot.GAME_BATTLES_MATCH )
	RefreshMLGRules( f12_arg0, f12_arg1 )
	f12_arg0.bindButton:addEventHandler( "button_secondary", function ( f18_arg0, f18_arg1 )
		local f18_local0 = GAMEBATTLES.GetCurrentMatch( f18_arg1.controller )
		if f18_local0 ~= nil and Engine.GetCurrentTimeDiffWithEpochTime( Engine.AddToEpochTime( f18_local0.matchTime, GAMEBATTLES.GetNoshowTime() ) ) < GAMEBATTLES.GetNoBackOutTime() then
			return 
		elseif Lobby.IsGameHost() and Lobby.CanCancelMatchStart() then
			Lobby.CancelStartServer()
			return 
		end
		local f18_local1 = nil
		if IsOurPrivatePartyHostInLobby() then
			f18_local1 = Engine.Localize( "@XBOXLIVE_LEAVEPARTYANDLOBBY" )
		else
			f18_local1 = Engine.Localize( "@XBOXLIVE_LEAVELOBBY" )
		end
		LUI.FlowManager.RequestPopupMenu( f12_arg0, "PopupYesNo", true, f18_arg1.controller, false, {
			yesAction = f0_local4( f12_arg0, f12_arg1 ),
			message = f18_local1
		} )
		return true
	end )
	local f12_local5 = nil
	local f12_local1 = function ()
		if Engine.HasClientMatchData() and MLG.GetActiveGameIndex() > 0 then
			f12_arg0:AddButtonHelperTextToElement( f12_arg0.ButtonHelperBar, {
				helper_text = Engine.Localize( "LUA_MENU_GAME_SUMMARY" ),
				button_ref = "button_select",
				side = "left",
				clickable = true
			} )
			f12_arg0.bindButton:addEventHandler( "button_select", function ( f20_arg0, f20_arg1 )
				OpenAfterActionReport( f20_arg1.controller, true, false )
			end )
		else
			f12_arg0.enableAfterActionReportTimer = f12_arg0:Wait( 500 )
			f12_arg0.enableAfterActionReportTimer.onComplete = f12_local5
		end
	end
	
	f12_local1()
	f12_local1 = MenuBuilder.BuildRegisteredType( "LobbyStatus", {
		controllerIndex = f12_arg1
	} )
	f12_local1:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -800, _1080p * -40, _1080p * -114, _1080p * -80 )
	f12_local1:Minimize()
	f12_arg0:addElement( f12_local1 )
	f12_arg0:registerEventHandler( "match_forfeit_no_players", function ( element, event )
		local f21_local0 = event.teamIndex and 2 or 1
		if not Lobby.IsGameHost() then
			GAMEBATTLES.MatchForfeitWinningTeamIndex = f21_local0
		elseif MLG.IsGameBattleMatchJoined( f12_arg1 ) then
			if Engine.GetDvarBool( "gamebattle_fix_for_no_show_exploit_enabled" ) then
				MLG.CachePotentialNoShowWinDetails( f12_arg1, element.gbMatch.matchId, f21_local0, event.teamIndex )
				MLG.RefreshMatchHistory( f12_arg1, element.gbMatch.matchId )
			else
				MLG.SendGameBattleNoShowReport( f12_arg1 )
				GAMEBATTLES.ShowMatchForfeitPopup( f12_arg1, element.gbMatch, f21_local0 )
			end
		else
			LUI.FlowManager.RequestPopupMenu( element, "MLGGamebattlesMatchExpiredPopup", false, f12_arg1, false, {
				matchID = element.gbMatch.matchId
			} )
		end
		f0_local3( element, f12_arg1 )
	end )
	f12_arg0.allowRefresh = true
	f12_arg0:registerEventHandler( "gamebattles_deactivate_refresh", function ( element, event )
		element.allowRefresh = false
		element:RemoveButtonHelperText( "button_alt1", "left" )
		element:addElement( element.GameBattlesTeamsLobbyMembers )
	end )
	local f12_local6 = function ()
		if f12_arg0.allowRefresh and not MLG.IsGameBattleMatchJoined( f12_arg1 ) then
			f12_arg0:AddButtonHelperTextToElement( f12_arg0.ButtonHelperBar, {
				helper_text = Engine.Localize( "MLG_GAMEBATTLES_SCHEDULE_REFRESH" ),
				button_ref = "button_alt1",
				side = "left",
				priority = 2,
				clickable = true
			} )
			f12_arg0.bindButton:addEventHandler( "button_alt1", function ( f24_arg0, f24_arg1 )
				if f12_arg0.allowRefresh then
					GAMEBATTLES.ScheduleRefreshRequest = true
					MLG.ResetGameBattleMatchId( f12_arg1 )
					f0_local3( f12_arg0, f12_arg1 )
				end
			end )
		end
	end
	
	f12_arg0.MatchRefreshTween = f12_arg0:Wait( f0_local0 )
	f12_arg0.MatchRefreshTween.onComplete = f12_local6
	if MLG.GetGameBattleDSAcquisitionState( f12_arg1 ) == GAMEBATTLES.MLG_DS_ACQUISITION_STATE.ACQUISITION_ERROR then
		f0_local3( f12_arg0, f12_arg1 )
	end
	f12_arg0:registerEventHandler( "match_cancelled_no_ds", function ( element, event )
		f0_local3( element, f12_arg1 )
	end )
	f12_arg0:registerEventHandler( "gamebattles_change_countdown_name", function ( element, event )
		element.UpcomingMatchInfo.CountdownTitle:setText( event.countdownName )
	end )
	if not Engine.IsPC() then
		f12_arg0.bindButton:addEventHandler( "button_start", function ( f27_arg0, f27_arg1 )
			ACTIONS.OpenMenu( "OptionsMenu", true, f27_arg1.controller )
		end )
		f12_arg0:AddButtonHelperTextToElement( f12_arg0.ButtonHelperBar, {
			helper_text = Engine.Localize( "LUA_MENU_OPTIONS_CAPS" ),
			button_ref = "button_start",
			side = "left",
			priority = 4,
			clickable = true
		} )
	end
end

function GameBattlesLobby( menu, controller )
	local self = LUI.UIHorizontalNavigator.new()
	self.id = "GameBattlesLobby"
	local f28_local1 = controller and controller.controllerIndex
	if not f28_local1 and not Engine.InFrontend() then
		f28_local1 = self:getRootController()
	end
	assert( f28_local1 )
	PreLoadFunc( self, f28_local1, controller )
	self:playSound( "menu_open" )
	local f28_local2 = self
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f28_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local SocialFeed = nil
	
	SocialFeed = MenuBuilder.BuildRegisteredType( "SocialFeed", {
		controllerIndex = f28_local1
	} )
	SocialFeed.id = "SocialFeed"
	SocialFeed:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1920, _1080p * 965.5, _1080p * 995.5 )
	self:addElement( SocialFeed )
	self.SocialFeed = SocialFeed
	
	local GameBattlesLobbyButtons = nil
	
	GameBattlesLobbyButtons = MenuBuilder.BuildRegisteredType( "GameBattlesLobbyButtons", {
		controllerIndex = f28_local1
	} )
	GameBattlesLobbyButtons.id = "GameBattlesLobbyButtons"
	GameBattlesLobbyButtons:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 100, _1080p * 625, _1080p * 140, _1080p * 550 )
	self:addElement( GameBattlesLobbyButtons )
	self.GameBattlesLobbyButtons = GameBattlesLobbyButtons
	
	local FriendsElement = nil
	
	FriendsElement = MenuBuilder.BuildRegisteredType( "online_friends_widget", {
		controllerIndex = f28_local1
	} )
	FriendsElement.id = "FriendsElement"
	FriendsElement:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	FriendsElement:SetAlignment( LUI.Alignment.Left )
	FriendsElement:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 100, _1080p * 600, _1080p * -60, _1080p * -15 )
	self:addElement( FriendsElement )
	self.FriendsElement = FriendsElement
	
	local MenuTitle = nil
	
	MenuTitle = MenuBuilder.BuildRegisteredType( "MenuTitle", {
		controllerIndex = f28_local1
	} )
	MenuTitle.id = "MenuTitle"
	MenuTitle.MenuTitle:setText( Engine.Localize( "LUA_MENU_MLG_GAMEBATTLES_CAPS" ), 0 )
	MenuTitle.MenuBreadcrumbs:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MULTIPLAYER_CAPS" ) ), 0 )
	MenuTitle.Icon:SetTop( _1080p * -28.5, 0 )
	MenuTitle.Icon:SetBottom( _1080p * 61.5, 0 )
	MenuTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
	self:addElement( MenuTitle )
	self.MenuTitle = MenuTitle
	
	local MatchDetails = nil
	
	MatchDetails = MenuBuilder.BuildRegisteredType( "MapVoteDetails", {
		controllerIndex = f28_local1
	} )
	MatchDetails.id = "MatchDetails"
	MatchDetails:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 634, _1080p * 658, _1080p * 932 )
	self:addElement( MatchDetails )
	self.MatchDetails = MatchDetails
	
	local UpcomingMatchInfo = nil
	
	UpcomingMatchInfo = MenuBuilder.BuildRegisteredType( "GameBattlesUpcomingMatch", {
		controllerIndex = f28_local1
	} )
	UpcomingMatchInfo.id = "UpcomingMatchInfo"
	UpcomingMatchInfo:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 644, _1080p * 1144, _1080p * 132, _1080p * 522 )
	self:addElement( UpcomingMatchInfo )
	self.UpcomingMatchInfo = UpcomingMatchInfo
	
	local GameBattlesTeamsLobbyMembers = nil
	
	GameBattlesTeamsLobbyMembers = MenuBuilder.BuildRegisteredType( "GameBattlesTeamsLobbyMembers", {
		controllerIndex = f28_local1
	} )
	GameBattlesTeamsLobbyMembers.id = "GameBattlesTeamsLobbyMembers"
	GameBattlesTeamsLobbyMembers:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -550, 0, _1080p * 54, _1080p * 969 )
	self:addElement( GameBattlesTeamsLobbyMembers )
	self.GameBattlesTeamsLobbyMembers = GameBattlesTeamsLobbyMembers
	
	local ESportsRulesStatus = nil
	
	ESportsRulesStatus = MenuBuilder.BuildRegisteredType( "ESportsRulesStatus", {
		controllerIndex = f28_local1
	} )
	ESportsRulesStatus.id = "ESportsRulesStatus"
	ESportsRulesStatus:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 604, _1080p * 550, _1080p * 630 )
	self:addElement( ESportsRulesStatus )
	self.ESportsRulesStatus = ESportsRulesStatus
	
	self.addButtonHelperFunction = function ( f29_arg0, f29_arg1 )
		f29_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			priority = 1,
			clickable = true
		} )
		f29_arg0:AddButtonHelperText( {
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
	
	f0_local7( self, f28_local1, controller )
	return self
end

MenuBuilder.registerType( "GameBattlesLobby", GameBattlesLobby )
LUI.FlowManager.RegisterStackPushBehaviour( "GameBattlesLobby", f0_local1 )
LUI.FlowManager.RegisterStackPopBehaviour( "GameBattlesLobby", f0_local2 )
LockTable( _M )
