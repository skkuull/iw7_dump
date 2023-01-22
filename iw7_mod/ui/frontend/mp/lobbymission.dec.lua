local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
LUI.FlowManager.RequestSetStack( "LobbyMission", {
	{
		name = "MainLockoutMenu"
	},
	{
		name = "MainMenu"
	},
	{
		name = "MPMainMenu"
	},
	{
		name = "Missions"
	}
} )
f0_local0 = "frontEnd.MP.conquest.lobbyMission"
function PushFunc()
	if Engine.GetDvarInt( "matchsim_tool_enabled" ) == 1 then
		Engine.SetDvarBool( "single_player_mp", false )
	end
end

function PopFunc()
	WipeGlobalModelsAtPath( f0_local0 )
end

function BuildSlideArrow()
	local self = LUI.UIButton.new()
	self.id = "SlideArrow"
	local f3_local1 = LUI.UIImage.new()
	f3_local1:setImage( RegisterMaterial( "wdg_selection_arrow_right_1" ) )
	f3_local1.id = "arrow"
	self:addElement( f3_local1 )
	local f3_local2 = function ( f4_arg0 )
		local f4_local0 = f4_arg0 .. "_glow"
		f3_local1:registerEventHandler( "button_over", function ()
			f3_local1:setImage( RegisterMaterial( f4_local0 ) )
			self.inFocus = true
		end )
		f3_local1:registerEventHandler( "button_up", function ()
			f3_local1:setImage( RegisterMaterial( f4_arg0 ) )
			self.inFocus = false
		end )
		f3_local1:setImage( RegisterMaterial( f4_arg0 ) )
	end
	
	self.PositionRight = function ( f7_arg0 )
		f7_arg0:SetAnchorsAndPosition( 1, 0, 0, 1, -47, -15, 175, 239 )
		f3_local2( "wdg_selection_arrow_right_1" )
	end
	
	self.PositionLeft = function ( f8_arg0 )
		f8_arg0:SetAnchorsAndPosition( 0, 1, 0, 1, 15, 47, 175, 239 )
		f3_local2( "wdg_selection_arrow_left_1" )
	end
	
	self:PositionRight()
	return self
end

function SlideToMainButtons( f9_arg0 )
	if not f9_arg0._lookingAtLobbyMembers then
		return 
	elseif f9_arg0.SlideArrow then
		f9_arg0.SlideArrow:PositionRight()
	end
	f9_arg0._lookingAtLobbyMembers = false
	ACTIONS.AnimateSequence( f9_arg0, "MainHL" )
	FrontEndScene.SetScene( "mission_team_lobby" )
	f9_arg0.CharacterRotator:SetClientCharacterIndex( FrontEndScene.ClientCharacters.Self )
	f9_arg0.LobbyMembers.List:processEvent( {
		name = "lose_focus"
	} )
end

f0_local1 = function ( f10_arg0 )
	assert( f10_arg0.LobbyMembers.List )
	local f10_local0 = f10_arg0.LobbyMembers.List
	f10_local0:SetFocusedPosition( {
		x = 0,
		y = 0
	}, true )
	local f10_local1 = f10_local0:GetElementAtPosition( 0, 0 )
	if f10_local1 then
		f10_local1:processEvent( {
			name = "gain_focus"
		} )
	end
end

function SlideToLobbyMembers( f11_arg0 )
	if f11_arg0._lookingAtLobbyMembers then
		return 
	elseif f11_arg0.SlideArrow then
		f11_arg0.SlideArrow:PositionLeft()
	end
	f11_arg0._lookingAtLobbyMembers = true
	ACTIONS.AnimateSequence( f11_arg0, "LobbyMembersHL" )
	FrontEndScene.SetScene( "lobby_members" )
	if CONDITIONS.IsPC( f11_arg0 ) then
		f0_local1( f11_arg0 )
	end
	f11_arg0.CharacterRotator:SetClientCharacterIndex( FrontEndScene.ClientCharacters.LobbyMember )
end

function PostLoadFunc( f12_arg0, f12_arg1, f12_arg2 )
	assert( f12_arg0.LobbyMissionButtons )
	for f12_local0 = 0, Engine.GetMaxControllerCount() - 1, 1 do
		if Engine.HasActiveLocalClient( f12_local0 ) then
			Cac.CleanLoadoutForCompetitivePlaylist( CONDITIONS.IsCompetitivePlaylist(), f12_local0 )
		end
	end
	Engine.SetDvarInt( "match_running", 0 )
	f12_arg0.LobbyMemberDetails:SetAlpha( 0 )
	f12_arg0:SetNoWrap( true )
	f12_arg0.SlideToLobbyMembers = SlideToLobbyMembers
	f12_arg0.SlideToMainButtons = SlideToMainButtons
	f12_arg0.LobbyMissionButtons:addEventHandler( "gain_focus", function ()
		f12_arg0:SlideToMainButtons()
	end )
	if CONDITIONS.IsPC( f12_arg0 ) then
		f12_arg0.SlideArrow = BuildSlideArrow()
		f12_arg0:addElement( f12_arg0.SlideArrow )
		f12_arg0.SlideArrow:registerEventHandler( "button_action", function ()
			if f12_arg0._lookingAtLobbyMembers then
				f12_arg0:SlideToMainButtons()
			else
				f12_arg0:SlideToLobbyMembers()
			end
		end )
		f12_arg0.SlideArrow.m_requireFocusType = FocusType.MouseOver
		f12_arg0:addEventHandler( "gain_focus", function ( f15_arg0, f15_arg1 )
			if f15_arg0._lookingAtLobbyMembers then
				f0_local1( f15_arg0 )
				return true
			else
				
			end
		end )
	end
	if Engine.GetDvarBool( "lui_mc_firstTimeInCurrentMissionTeam" ) then
		f12_arg0:processEvent( {
			name = "show_commander_message",
			eventID = "mt_join_up"
		} )
		Engine.SetDvarBool( "lui_mc_firstTimeInCurrentMissionTeam", false )
	elseif Engine.GetDvarBool( "lui_mc_rejoinedCurrentMissionTeam" ) then
		f12_arg0:processEvent( {
			name = "show_commander_message",
			eventID = "mt_welcome_back"
		} )
		Engine.SetDvarBool( "lui_mc_rejoinedCurrentMissionTeam", false )
	end
	local f12_local0 = LUI.FlowManager.GetScopedData( f12_arg0 )
	if Engine.GetDvarBool( "lui_mc_newMissionDelivered" ) and f12_local0.firstRun == nil then
		f12_local0.firstRun = false
		local f12_local1 = Engine.GetDvarInt( "lui_mc_newMissionDeliveredMessageCount" )
		if f12_local1 > 5 then
			f12_local1 = 5
		end
		if 100 - 15 * f12_local1 >= math.random( 0, 100 ) then
			Engine.SetDvarInt( "lui_mc_newMissionDeliveredMessageCount", f12_local1 + 1 )
			f12_arg0:processEvent( {
				name = "show_commander_message",
				eventID = "new_mission"
			} )
		end
		Engine.SetDvarBool( "lui_mc_newMissionDelivered", false )
	end
	if Engine.GetDvarInt( "lui_mc_newMissionSlotUnlocked" ) == 2 then
		f12_arg0:processEvent( {
			name = "show_commander_message",
			eventID = "mission_expand_two_slots"
		} )
		Engine.SetDvarInt( "lui_mc_newMissionSlotUnlocked", 0 )
	elseif Engine.GetDvarInt( "lui_mc_newMissionSlotUnlocked" ) == 3 then
		f12_arg0:processEvent( {
			name = "show_commander_message",
			eventID = "mission_expand_three_slots"
		} )
		Engine.SetDvarInt( "lui_mc_newMissionSlotUnlocked", 0 )
	end
	f12_local0.lastTime = -1
	f12_local0.playedTenSecondLine = false
	f12_arg0:SubscribeToModel( DataSources.frontEnd.lobby.timeRemaining:GetModel( f12_arg1 ), function ()
		local f16_local0 = DataSources.frontEnd.lobby.timeRemaining:GetValue( f12_arg1 )
		if f16_local0 ~= nil then
			f16_local0 = tonumber( f16_local0 )
			if f12_local0.lastTime > 10 and f16_local0 <= 10 and not f12_local0.playedTenSecondLine then
				f12_local0.playedTenSecondLine = true
				f12_arg0:processEvent( {
					name = "show_commander_message",
					eventID = "countdown_10"
				} )
			end
			f12_local0.lastTime = f16_local0
		end
	end )
	local f12_local3 = Engine.GetDvarInt( "lui_mc_newMissionTeamUnlocked" )
	if f12_local3 ~= -1 then
		Engine.SetDvarInt( "lui_mc_newMissionTeamUnlocked", -1 )
		f12_arg0:processEvent( {
			name = "show_commander_message",
			eventID = "mt_new_team_unlocked",
			teamOverride = f12_local3
		} )
	end
	local f12_local4 = Engine.GetDvarInt( "lui_mc_crankCallIndex" )
	if f12_local4 and f12_local4 > 0 and f12_local4 ~= Engine.GetDvarInt( "lui_mc_crankCallIndexPlayed" ) then
		Engine.Exec( "set lui_mc_crankCallIndexPlayed " .. f12_local4 )
		f12_arg0:processEvent( {
			name = "show_commander_message",
			eventID = "ba_crank_call_" .. f12_local4,
			teamOverride = 4
		} )
	end
	WipeGlobalModelsAtPath( f0_local0 )
	FrontEndScene.CurrentMissionTeam = MissionDirector.GetActiveMissionTeam( f12_arg1 )
	FrontEndScene.SetScene( "mission_team_lobby" )
	local f12_local5 = DataSources.alwaysLoaded.playerData.MP.rankedloadouts.squadMembers
	local f12_local6 = f12_local5.archetype:GetValue( f12_arg1 )
	local f12_local7 = f12_local5.archetypeSuper:GetValue( f12_arg1 )
	FrontEndScene.SetCharacterModelsByIndex( FrontEndScene.ClientCharacters.Self, f12_local5.body:GetValue( f12_arg1 ), f12_local5.head:GetValue( f12_arg1 ) )
	FrontEndScene.SetWeaponForSuper( FrontEndScene.ClientCharacters.Self, f12_local7, f12_local6 )
	FrontEndScene.PlayIdleForSuper( FrontEndScene.ClientCharacters.Self, f12_local7, f12_local6 )
	Streaming.SetStreamingEnabled( false )
	ClientCharacter.SetCharacterVisible( FrontEndScene.ClientCharacters.Self, true )
	FrontEndScene.HideWeaponModels()
	DebugPrint( "Mission State = " .. MissionDirector.GetFlowState() )
	if MissionDirector.GetFlowState() == MissionDirector.FlowState.MISSION_OVER then
		MissionDirector.SetFlowState( MissionDirector.FlowState.PRE_INIT )
		for f12_local8 = 0, Engine.GetMaxControllerCount() - 1, 1 do
			if Engine.HasActiveLocalClient( f12_local8 ) then
				Contracts.RunPostMatchFrontEndLogic( f12_local8 )
				MissionDirector.HandlePostGame( f12_local8 )
			end
		end
		DebugPrint( "ui_opensummary = " .. (Engine.GetDvarBool( "ui_opensummary" ) and "true" or "false") )
		if Engine.GetDvarBool( "ui_opensummary" ) == true then
			DebugPrint( "PostGameFanfare:start()" )
			PostGameFanfare:start()
		end
	end
	if MissionDirector.GetFlowState() == MissionDirector.FlowState.PRE_INIT then
		MissionDirector.SetFlowState( MissionDirector.FlowState.MISSION_ACTIVE )
		for f12_local8 = 0, Engine.GetMaxControllerCount() - 1, 1 do
			if Engine.HasActiveLocalClient( f12_local8 ) then
				Rewards.ResetMissions( f12_local8 )
				MissionDirector.PlayMission( f12_local8 )
				Contracts.RunPreMatchLogic( f12_local8 )
			end
		end
	end
	assert( f12_arg0.bindButton )
	f12_arg0.bindButton:addEventHandler( "button_secondary", function ( f17_arg0, f17_arg1 )
		LUI.FlowManager.RequestPopupMenu( nil, "LeaveMissionLobby", true, f17_arg1.controllerIndex, false, {
			LobbyMission = f17_arg0
		} )
		return true
	end )
	assert( f12_arg0.LobbyMembers )
	f12_arg0.LobbyMembers:AddLobbyStatus( f12_arg1 )
	if Engine.HasClientMatchData() and Engine.GetDvarInt( "lui_matchSummaryAvailable" ) == 1 then
		f12_arg0:AddButtonHelperTextToElement( f12_arg0.ButtonHelperBar, {
			helper_text = Engine.Localize( "LUA_MENU_GAME_SUMMARY" ),
			button_ref = "button_select",
			side = "left",
			clickable = true
		} )
		f12_arg0.bindButton:addEventHandler( "button_select", function ( f18_arg0, f18_arg1 )
			OpenAfterActionReport( f18_arg1.controller, false, false )
		end )
	end
	local f12_local8 = MissionDirector.GetActiveMissionTeam( f12_arg1 )
	assert( f12_arg0.MissionTeamInfo )
	f12_arg0.menuModelPath = f0_local0
	local f12_local9 = MissionDirector.GetMissionTeamColor( f12_local8 )
	f12_arg0.MissionInfoTabs.HeaderBackground:SetRGBFromInt( f12_local9 )
	f12_arg0.MissionInfoTabs.MissionBackground:SetRGBFromInt( f12_local9 )
	f12_arg0.MissionInfoTabs.MissionBackgroundNotch:SetRGBFromInt( f12_local9 )
	f12_arg0.MissionInfoTabs.Border:SetRGBFromInt( f12_local9 )
	f12_arg0.MissionInfoTabs:SetDataSource( {
		teamID = LUI.DataSourceInControllerModel.new( f0_local0 .. ".missionInfoTabs." .. f12_local8, f12_local8 )
	}, f12_arg1 )
	assert( f12_arg0.MenuTitle )
	f12_arg0.MenuTitle:SubscribeToModel( DataSources.frontEnd.lobby.gameType:GetModel( f12_arg1 ), function ()
		local f19_local0 = DataSources.frontEnd.lobby.gameType:GetValue( f12_arg1 )
		local f19_local1 = "gamemode_generic"
		if f19_local0 ~= nil and f19_local0 ~= "" then
			f19_local1 = Engine.TableLookup( CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, f19_local0, CSV.gameTypesTable.cols.image )
		end
		f12_arg0.MenuTitle.MenuTitle:setText( ToUpperCase( Playlist.GetPlaylistName( Engine.GetDvarInt( "playlist" ) ) ), 0 )
		f12_arg0.MenuTitle.MenuBreadcrumbs:setText( ToUpperCase( Engine.Localize( "LUA_MENU_BREADCRUMB_2_ITEMS", "MENU_MULTIPLAYER", "LUA_MENU_PUBLIC_MATCH_CAPS" ) ), 0 )
		f12_arg0.MenuTitle.Icon:setImage( RegisterMaterial( f19_local1 ), 0 )
	end )
	SURVEY.OpenPostGameSurveyIfRequired( f12_arg1, false )
	Lobby.WakeLobbyParty( f12_arg1 )
	Lobby.SetPartyUIRoot( PartyUIRoot.PUBLIC_MATCH_LOBBY )
	CheckTURequirement( f12_arg0, f12_arg1 )
	MissionDirector.PlayTeamMusic()
	Engine.StopMenuVideo()
	assert( f12_arg0.CharacterRotator )
	f12_arg0.CharacterRotator:SetClientCharacterIndex( FrontEndScene.ClientCharacters.Self )
	if not Engine.IsPC() then
		f12_arg0.bindButton:addEventHandler( "button_start", function ( f20_arg0, f20_arg1 )
			ACTIONS.OpenMenu( "OptionsMenu", true, f20_arg1.controller )
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

function LeaveMissionLobby( f21_arg0, f21_arg1 )
	assert( f21_arg1.LobbyMission )
	local f21_local0 = {
		title = Engine.Localize( "MENU_NOTICE" ),
		message = Engine.Localize( "XBOXLIVE_LEAVELOBBY" ),
		yesAction = function ( f22_arg0, f22_arg1 )
			Lobby.LeavePublicLobby()
			LUI.FlowManager.RequestLeaveMenu( f21_arg1.LobbyMission, true, true )
		end
	}
	local f21_local1 = nil
	f21_local0.noAction = function ()
		
	end
	
	if Engine.IsXB3() then
		f21_local0.rateLimitIntervalMS = 5000
		f21_local0.rateLimitAttempts = 3
		f21_local1 = MenuBuilder.BuildRegisteredType( "RateLimitedPopupYesNo", f21_local0 )
	else
		f21_local1 = MenuBuilder.BuildRegisteredType( "PopupYesNo", f21_local0 )
	end
	f21_local1.id = "LeaveMissionLobby"
	return f21_local1
end

MenuBuilder.registerType( "LeaveMissionLobby", LeaveMissionLobby )
function LobbyMission( menu, controller )
	local self = LUI.UIHorizontalNavigator.new()
	self.id = "LobbyMission"
	self._animationSets = {}
	self._sequences = {}
	local f24_local1 = controller and controller.controllerIndex
	if not f24_local1 and not Engine.InFrontend() then
		f24_local1 = self:getRootController()
	end
	assert( f24_local1 )
	self:playSound( "menu_open" )
	local f24_local2 = self
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f24_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local Friends = nil
	
	Friends = MenuBuilder.BuildRegisteredType( "online_friends_widget", {
		controllerIndex = f24_local1
	} )
	Friends.id = "Friends"
	Friends:SetFont( FONTS.GetFont( FONTS.Dev.File ) )
	Friends:SetAlignment( LUI.Alignment.Left )
	Friends:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1420, _1080p * 1920, _1080p * 1026, _1080p * 1071 )
	self:addElement( Friends )
	self.Friends = Friends
	
	local SocialFeed = nil
	
	SocialFeed = MenuBuilder.BuildRegisteredType( "SocialFeed", {
		controllerIndex = f24_local1
	} )
	SocialFeed.id = "SocialFeed"
	SocialFeed:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -115, _1080p * -85 )
	self:addElement( SocialFeed )
	self.SocialFeed = SocialFeed
	
	local LobbyMissionButtons = nil
	
	LobbyMissionButtons = MenuBuilder.BuildRegisteredType( "LobbyMissionButtons", {
		controllerIndex = f24_local1
	} )
	LobbyMissionButtons.id = "LobbyMissionButtons"
	LobbyMissionButtons:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 688, _1080p * 216, _1080p * 938.5 )
	self:addElement( LobbyMissionButtons )
	self.LobbyMissionButtons = LobbyMissionButtons
	
	local LobbyMembers = nil
	
	LobbyMembers = MenuBuilder.BuildRegisteredType( "LobbyMembers", {
		controllerIndex = f24_local1
	} )
	LobbyMembers.id = "LobbyMembers"
	LobbyMembers:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -700, 0, _1080p * 275.5, _1080p * 919.5 )
	self:addElement( LobbyMembers )
	self.LobbyMembers = LobbyMembers
	
	local MenuTitle = nil
	
	MenuTitle = MenuBuilder.BuildRegisteredType( "MenuTitle", {
		controllerIndex = f24_local1
	} )
	MenuTitle.id = "MenuTitle"
	MenuTitle.MenuTitle:setText( ToUpperCase( Engine.Localize( "MENU_MISSION_LOBBY" ) ), 0 )
	MenuTitle.MenuBreadcrumbs:setText( ToUpperCase( "" ), 0 )
	MenuTitle.Icon:SetTop( _1080p * -28.5, 0 )
	MenuTitle.Icon:SetBottom( _1080p * 61.5, 0 )
	MenuTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
	self:addElement( MenuTitle )
	self.MenuTitle = MenuTitle
	
	local MissionInfoTabs = nil
	
	MissionInfoTabs = MenuBuilder.BuildRegisteredType( "MissionInfoTabs", {
		controllerIndex = f24_local1
	} )
	MissionInfoTabs.id = "MissionInfoTabs"
	MissionInfoTabs:SetGlitchEnabled( true )
	MissionInfoTabs:SetGlitchAmount( 0, 0 )
	MissionInfoTabs:SetGlitchBlockWidth( 50, 0 )
	MissionInfoTabs:SetGlitchBlockHeight( 50, 0 )
	MissionInfoTabs:SetGlitchDistortionRange( 16, 0 )
	MissionInfoTabs:SetGlitchScanlinePitch( 1, 0 )
	MissionInfoTabs:SetGlitchMaskPitch( 1, 0 )
	MissionInfoTabs.MissionText:setText( Engine.Localize( "MENU_NEW" ), 0 )
	MissionInfoTabs:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -700, 0, _1080p * 137, _1080p * 250 )
	self:addElement( MissionInfoTabs )
	self.MissionInfoTabs = MissionInfoTabs
	
	local MissionTeamInfo = nil
	
	MissionTeamInfo = MenuBuilder.BuildRegisteredType( "MissionTeamInfo", {
		controllerIndex = f24_local1
	} )
	MissionTeamInfo.id = "MissionTeamInfo"
	MissionTeamInfo:SetGlitchEnabled( true )
	MissionTeamInfo:SetGlitchAmount( 0, 0 )
	MissionTeamInfo:SetGlitchBlockWidth( 50, 0 )
	MissionTeamInfo:SetGlitchBlockHeight( 50, 0 )
	MissionTeamInfo:SetGlitchDistortionRange( 16, 0 )
	MissionTeamInfo:SetGlitchScanlinePitch( 1, 0 )
	MissionTeamInfo:SetGlitchMaskPitch( 1, 0 )
	MissionTeamInfo:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -700, 0, _1080p * 54, _1080p * 141 )
	self:addElement( MissionTeamInfo )
	self.MissionTeamInfo = MissionTeamInfo
	
	local CommanderMessageListener = nil
	
	CommanderMessageListener = MenuBuilder.BuildRegisteredType( "CommanderMessageListener", {
		controllerIndex = f24_local1
	} )
	CommanderMessageListener.id = "CommanderMessageListener"
	CommanderMessageListener:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -700, 0, _1080p * 57, _1080p * 225 )
	self:addElement( CommanderMessageListener )
	self.CommanderMessageListener = CommanderMessageListener
	
	local LobbyMemberDetails = nil
	
	LobbyMemberDetails = MenuBuilder.BuildRegisteredType( "LobbyMemberDetails", {
		controllerIndex = f24_local1
	} )
	LobbyMemberDetails.id = "LobbyMemberDetails"
	LobbyMemberDetails:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 3050, _1080p * 3468, _1080p * 400, _1080p * 900 )
	self:addElement( LobbyMemberDetails )
	self.LobbyMemberDetails = LobbyMemberDetails
	
	local DoubleXPNotifications = nil
	
	DoubleXPNotifications = MenuBuilder.BuildRegisteredType( "DoubleXPNotifications", {
		controllerIndex = f24_local1
	} )
	DoubleXPNotifications.id = "DoubleXPNotifications"
	DoubleXPNotifications:SetScale( -0.5, 0 )
	DoubleXPNotifications:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 66, _1080p * 322, _1080p * 104, _1080p * 232 )
	self:addElement( DoubleXPNotifications )
	self.DoubleXPNotifications = DoubleXPNotifications
	
	local CharacterRotator = nil
	
	CharacterRotator = MenuBuilder.BuildRegisteredType( "CharacterRotator", {
		controllerIndex = f24_local1
	} )
	CharacterRotator.id = "CharacterRotator"
	CharacterRotator:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -300, _1080p * 200, _1080p * -400, _1080p * 400 )
	self:addElement( CharacterRotator )
	self.CharacterRotator = CharacterRotator
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		MissionInfoTabs:RegisterAnimationSequence( "ShowCluster", {
			{
				function ()
					return self.MissionInfoTabs:SetAlpha( 1, 100 )
				end
			},
			{
				function ()
					return self.MissionInfoTabs:SetGlitchAmount( 0, 100 )
				end
			},
			{
				function ()
					return self.MissionInfoTabs:SetGlitchBlockWidth( 20, 100 )
				end
			},
			{
				function ()
					return self.MissionInfoTabs:SetGlitchBlockHeight( 2, 100 )
				end
			},
			{
				function ()
					return self.MissionInfoTabs:SetGlitchDistortionRange( 4, 100 )
				end
			},
			{
				function ()
					return self.MissionInfoTabs:SetGlitchScanlinePitch( 55, 100 )
				end
			},
			{
				function ()
					return self.MissionInfoTabs:SetGlitchMaskPitch( 45, 100 )
				end
			}
		} )
		MissionTeamInfo:RegisterAnimationSequence( "ShowCluster", {
			{
				function ()
					return self.MissionTeamInfo:SetAlpha( 1, 100 )
				end
			},
			{
				function ()
					return self.MissionTeamInfo:SetGlitchAmount( 0, 100 )
				end
			},
			{
				function ()
					return self.MissionTeamInfo:SetGlitchBlockWidth( 20, 100 )
				end
			},
			{
				function ()
					return self.MissionTeamInfo:SetGlitchBlockHeight( 2, 100 )
				end
			},
			{
				function ()
					return self.MissionTeamInfo:SetGlitchDistortionRange( 4, 100 )
				end
			},
			{
				function ()
					return self.MissionTeamInfo:SetGlitchScanlinePitch( 55, 100 )
				end
			},
			{
				function ()
					return self.MissionTeamInfo:SetGlitchMaskPitch( 45, 100 )
				end
			}
		} )
		self._sequences.ShowCluster = function ()
			MissionInfoTabs:AnimateSequence( "ShowCluster" )
			MissionTeamInfo:AnimateSequence( "ShowCluster" )
		end
		
		MissionInfoTabs:RegisterAnimationSequence( "HideCluster", {
			{
				function ()
					return self.MissionInfoTabs:SetAlpha( 0, 250 )
				end
			},
			{
				function ()
					return self.MissionInfoTabs:SetGlitchAmount( 1, 250 )
				end
			},
			{
				function ()
					return self.MissionInfoTabs:SetGlitchBlockWidth( 15, 250 )
				end
			},
			{
				function ()
					return self.MissionInfoTabs:SetGlitchBlockHeight( 6, 250 )
				end
			},
			{
				function ()
					return self.MissionInfoTabs:SetGlitchDistortionRange( 20, 250 )
				end
			},
			{
				function ()
					return self.MissionInfoTabs:SetGlitchScanlinePitch( 55, 250 )
				end
			},
			{
				function ()
					return self.MissionInfoTabs:SetGlitchMaskPitch( 45, 250 )
				end
			}
		} )
		MissionTeamInfo:RegisterAnimationSequence( "HideCluster", {
			{
				function ()
					return self.MissionTeamInfo:SetAlpha( 0, 250 )
				end
			},
			{
				function ()
					return self.MissionTeamInfo:SetGlitchAmount( 1, 250 )
				end
			},
			{
				function ()
					return self.MissionTeamInfo:SetGlitchBlockWidth( 15, 250 )
				end
			},
			{
				function ()
					return self.MissionTeamInfo:SetGlitchBlockHeight( 6, 250 )
				end
			},
			{
				function ()
					return self.MissionTeamInfo:SetGlitchDistortionRange( 20, 250 )
				end
			},
			{
				function ()
					return self.MissionTeamInfo:SetGlitchScanlinePitch( 55, 250 )
				end
			},
			{
				function ()
					return self.MissionTeamInfo:SetGlitchMaskPitch( 45, 250 )
				end
			}
		} )
		self._sequences.HideCluster = function ()
			MissionInfoTabs:AnimateSequence( "HideCluster" )
			MissionTeamInfo:AnimateSequence( "HideCluster" )
		end
		
		LobbyMissionButtons:RegisterAnimationSequence( "LobbyMembersHL", {
			{
				function ()
					return self.LobbyMissionButtons:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -870, _1080p * -312, _1080p * 216, _1080p * 938.5, 119 )
				end
			}
		} )
		LobbyMembers:RegisterAnimationSequence( "LobbyMembersHL", {
			{
				function ()
					return self.LobbyMembers:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -830, _1080p * -130, _1080p * 275.5, _1080p * 919.5, 119 )
				end
			}
		} )
		LobbyMemberDetails:RegisterAnimationSequence( "LobbyMembersHL", {
			{
				function ()
					return self.LobbyMemberDetails:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1372, _1080p * 1790, _1080p * 400, _1080p * 900, 119 )
				end
			}
		} )
		self._sequences.LobbyMembersHL = function ()
			LobbyMissionButtons:AnimateSequence( "LobbyMembersHL" )
			LobbyMembers:AnimateSequence( "LobbyMembersHL" )
			LobbyMemberDetails:AnimateSequence( "LobbyMembersHL" )
		end
		
		LobbyMissionButtons:RegisterAnimationSequence( "MainHL", {
			{
				function ()
					return self.LobbyMissionButtons:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 688, _1080p * 216, _1080p * 938.5, 119 )
				end
			}
		} )
		LobbyMembers:RegisterAnimationSequence( "MainHL", {
			{
				function ()
					return self.LobbyMembers:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -700, 0, _1080p * 275.5, _1080p * 919.5, 119 )
				end
			}
		} )
		LobbyMemberDetails:RegisterAnimationSequence( "MainHL", {
			{
				function ()
					return self.LobbyMemberDetails:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 3050, _1080p * 3468, _1080p * 400, _1080p * 900, 119 )
				end
			}
		} )
		self._sequences.MainHL = function ()
			LobbyMissionButtons:AnimateSequence( "MainHL" )
			LobbyMembers:AnimateSequence( "MainHL" )
			LobbyMemberDetails:AnimateSequence( "MainHL" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self.addButtonHelperFunction = function ( f65_arg0, f65_arg1 )
		f65_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			priority = 1,
			clickable = true
		} )
		f65_arg0:AddButtonHelperText( {
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
	
	self:addEventHandler( "show_commander_message", function ( f66_arg0, f66_arg1 )
		local f66_local0 = f66_arg1.controller or f24_local1
		ACTIONS.AnimateSequence( self, "HideCluster" )
	end )
	self:addEventHandler( "hide_commander_message", function ( f67_arg0, f67_arg1 )
		local f67_local0 = f67_arg1.controller or f24_local1
		ACTIONS.AnimateSequence( self, "ShowCluster" )
	end )
	PostLoadFunc( self, f24_local1, controller )
	return self
end

MenuBuilder.registerType( "LobbyMission", LobbyMission )
LUI.FlowManager.RegisterStackPushBehaviour( "LobbyMission", PushFunc )
LUI.FlowManager.RegisterStackPopBehaviour( "LobbyMission", PopFunc )
LockTable( _M )
