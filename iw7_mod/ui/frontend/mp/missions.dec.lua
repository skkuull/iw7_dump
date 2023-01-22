local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
LUI.FlowManager.RegisterFenceGroup( "Missions", {
	"contracts"
} )
LUI.FlowManager.RequestSetStack( "Missions", {
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
f0_local0 = "frontEnd.mp.missions"
f0_local1 = function ()
	Onboarding:ResetFlow( Onboarding.RigTutorial )
	WipeGlobalModelsAtPath( f0_local0 )
end

f0_local2 = function ( f2_arg0, f2_arg1, f2_arg2 )
	InitCoreMPRankedDataSources()
end

function LeaveMissions( f3_arg0, f3_arg1 )
	assert( f3_arg1.Missions )
	local f3_local0 = MenuBuilder.BuildRegisteredType( "PopupYesNo", {
		title = Engine.Localize( "MENU_NOTICE" ),
		message = Engine.Localize( "XBOXLIVE_LEAVEPARTYANDLOBBY" ),
		yesAction = function ( f4_arg0, f4_arg1 )
			Engine.Exec( "xstopprivateparty" )
			Engine.Exec( "xstartprivateparty" )
			LUI.FlowManager.RequestLeaveMenu( f3_arg1.Missions, true, true )
		end,
		noAction = function ()
			
		end
	} )
	f3_local0.id = "LeaveMissions"
	return f3_local0
end

MenuBuilder.registerType( "LeaveMissions", LeaveMissions )
local f0_local3 = function ( f6_arg0, f6_arg1 )
	local f6_local0 = DataSources.alwaysLoaded.playerData.MP.ranked
	for f6_local8, f6_local9 in pairs( f6_arg1 ) do
		local f6_local7 = 0
		for f6_local4, f6_local5 in pairs( f6_local9 ) do
			f6_local7 = f6_local7 + f6_local0.challengeState[f6_local5]:GetValue( f6_arg0 )
		end
		f6_local0.challengeProgress[f6_local8]:SetValue( f6_arg0, f6_local7 )
		if tonumber( Engine.TableLookup( CSV.allChallengesTable.file, CSV.allChallengesTable.cols.ref, f6_local8, CSV.allChallengesTable.cols.tiers.targetStart ) ) <= f6_local7 then
			f6_local0.challengeState[f6_local8]:SetValue( f6_arg0, 1 )
		end
	end
end

local f0_local4 = function ( f7_arg0 )
	local f7_local0 = DataSources.alwaysLoaded.playerData.MP.ranked
	if f7_local0.postShipFlags[0]:GetValue( f7_arg0 ) == 0 then
		f0_local3( f7_arg0, {
			ch_gold_rig_assault_body = {
				"ch_assault_amplify_score",
				"ch_assault_overdrive_2multi",
				"ch_assault_ping_2multi",
				"ch_assault_resupply_lethal_kills"
			},
			ch_gold_rig_assault_head = {
				"ch_assault_kills",
				"ch_assault_2multikill",
				"ch_assault_3streak",
				"ch_assault_super"
			},
			ch_gold_rig_heavy_body = {
				"ch_heavy_armor_absorb",
				"ch_heavy_bullcharge_multi",
				"ch_heavy_ground_pound_kills",
				"ch_heavy_icu_heals"
			},
			ch_gold_rig_heavy_head = {
				"ch_heavy_kills",
				"ch_heavy_2multikill",
				"ch_heavy_3streak",
				"ch_heavy_super"
			},
			ch_gold_rig_scout_body = {
				"ch_scout_damaged_rewind",
				"ch_scout_reaper_4multi",
				"ch_scout_dodge_uses",
				"ch_scout_afterburner_kill"
			},
			ch_gold_rig_scout_head = {
				"ch_scout_kills",
				"ch_scout_2multikill",
				"ch_scout_3streak",
				"ch_scout_super"
			},
			ch_gold_rig_assassin_body = {
				"ch_assassin_jump_melee",
				"ch_assassin_damaged_phase_shift",
				"ch_assassin_ads_slide_kill",
				"ch_assassin_perception_revenge"
			},
			ch_gold_rig_assassin_head = {
				"ch_assassin_kills",
				"ch_assassin_2multikill",
				"ch_assassin_3streak",
				"ch_assassin_super"
			},
			ch_gold_rig_engineer_body = {
				"ch_engineer_bhgun_3multi",
				"ch_engineer_micro_turret_2multi",
				"ch_engineer_relay_kill",
				"ch_engineer_hardened_kill"
			},
			ch_gold_rig_engineer_head = {
				"ch_engineer_kills",
				"ch_engineer_2multikill",
				"ch_engineer_3streak",
				"ch_engineer_super"
			},
			ch_gold_rig_sniper_body = {
				"ch_sniper_ballista_collateral",
				"ch_sniper_camo_melee",
				"ch_sniper_pulsar_2multi",
				"ch_sniper_rearguard_kill"
			},
			ch_gold_rig_sniper_head = {
				"ch_sniper_kills",
				"ch_sniper_2multikill",
				"ch_sniper_3streak",
				"ch_sniper_super"
			}
		} )
		f0_local3( f7_arg0, {
			ch_diamond_rig_assault = {
				"ch_gold_rig_assault_body",
				"ch_gold_rig_assault_head"
			},
			ch_diamond_rig_heavy = {
				"ch_gold_rig_heavy_body",
				"ch_gold_rig_heavy_head"
			},
			ch_diamond_rig_scout = {
				"ch_gold_rig_scout_body",
				"ch_gold_rig_scout_head"
			},
			ch_diamond_rig_assassin = {
				"ch_gold_rig_assassin_body",
				"ch_gold_rig_assassin_head"
			},
			ch_diamond_rig_engineer = {
				"ch_gold_rig_engineer_body",
				"ch_gold_rig_engineer_head"
			},
			ch_diamond_rig_sniper = {
				"ch_gold_rig_sniper_body",
				"ch_gold_rig_sniper_head"
			}
		} )
		f0_local3( f7_arg0, {
			ch_solar_rig = {
				"ch_diamond_rig_assault",
				"ch_diamond_rig_heavy",
				"ch_diamond_rig_scout",
				"ch_diamond_rig_assassin",
				"ch_diamond_rig_engineer",
				"ch_diamond_rig_sniper"
			}
		} )
		f7_local0.postShipFlags[0]:SetValue( f7_arg0, 1 )
		Engine.ExecNow( "uploadstats", f7_arg0 )
	end
end

local f0_local5 = function ( f8_arg0 )
	local f8_local0 = DataSources.alwaysLoaded.playerData.MP.ranked
	if f8_local0.dlcEggStatus:GetValue( f8_arg0 ) == 0 then
		f8_local0.globalSPM:SetValue( f8_arg0, 0 )
		local f8_local1 = f8_local0.gameModeScoreHistory:GetCountValue( f8_arg0, 0 )
		for f8_local2 = 0, f8_local1 - 1, 1 do
			f8_local0.gameModeScoreHistory[f8_local2].index:SetValue( f8_arg0, 0 )
			local f8_local5 = f8_local0.gameModeScoreHistory[f8_local2].scores:GetCountValue( f8_arg0 )
			for f8_local6 = 0, f8_local5 - 1, 1 do
				f8_local0.gameModeScoreHistory[f8_local2].scores[f8_local6]:SetValue( f8_arg0, 0 )
			end
		end
		local f8_local2 = f8_local0.gamesPlayed:GetValue( f8_arg0 )
		if f8_local2 == 0 then
			f8_local0.dlcEggStatus:SetValue( f8_arg0, -1 )
		else
			f8_local0.dlcEggStatus:SetValue( f8_arg0, f8_local2 )
		end
	end
end

local f0_local6 = function ( f9_arg0 )
	f0_local5( f9_arg0 )
	f0_local4( f9_arg0 )
end

local f0_local7 = function ( f10_arg0, f10_arg1, f10_arg2 )
	local f10_local0 = MissionDirector.GetActiveMissionTeam( f10_arg1 )
	FrontEndScene.CurrentMissionTeam = f10_local0
	FrontEndScene.SetScene( "mission_team_lobby" )
	f10_arg0.MenuTitle.MenuBreadcrumbs:setText( ToUpperCase( Engine.Localize( "LUA_MENU_BREADCRUMB_2_ITEMS", "MENU_MULTIPLAYER", "LUA_MENU_PUBLIC_MATCH_CAPS" ) ), 0 )
	f10_arg0.MissionInfoTabs:SetDataSource( {
		teamID = LUI.DataSourceInControllerModel.new( f0_local0 .. ".missionInfoTabs." .. f10_local0, f10_local0 )
	}, f10_arg1 )
	ClientCharacter.SetCharacterVisible( FrontEndScene.ClientCharacters.Self, true )
	assert( f10_arg0.MissionTeamInfo )
	f10_arg0.menuModelPath = f0_local0
	local f10_local1 = MissionDirector.GetMissionTeamColor( f10_local0 )
	f10_arg0.MissionInfoTabs.HeaderBackground:SetRGBFromInt( f10_local1 )
	f10_arg0.MissionInfoTabs.MissionBackground:SetRGBFromInt( f10_local1 )
	f10_arg0.MissionInfoTabs.MissionBackgroundNotch:SetRGBFromInt( f10_local1 )
	f10_arg0.MissionInfoTabs.Border:SetRGBFromInt( f10_local1 )
	local f10_local2 = DataSources.alwaysLoaded.playerData.MP.rankedloadouts.squadMembers
	local f10_local3 = f10_local2.archetype:GetValue( f10_arg1 )
	local f10_local4 = f10_local2.archetypeSuper:GetValue( f10_arg1 )
	FrontEndScene.SetCharacterModelsByIndex( FrontEndScene.ClientCharacters.Self, f10_local2.body:GetValue( f10_arg1 ), f10_local2.head:GetValue( f10_arg1 ) )
	FrontEndScene.SetWeaponForSuper( FrontEndScene.ClientCharacters.Self, f10_local4, f10_local3 )
	FrontEndScene.PlayIdleForSuper( FrontEndScene.ClientCharacters.Self, f10_local4, f10_local3 )
	local f10_local5 = Cac.GetRigOffset( Cac.GetRigTableIndex( f10_local3 ) )
	ClientCharacter.SetCharacterOffset( FrontEndScene.ClientCharacters.Self, tonumber( f10_local5[1] ), tonumber( f10_local5[2] ), tonumber( f10_local5[3] ) )
	MissionDirector.Setup( f10_arg1 )
	MissionDirector.SetFlowState( MissionDirector.FlowState.PRE_INIT )
	if not Onboarding.RigTutorial:WasCompleted( f10_arg1 ) then
		f10_arg0:addEventHandler( "gain_focus", function ( f11_arg0, f11_arg1 )
			local f11_local0 = LUI.FlowManager.GetScopedData( f11_arg0 )
			if not f11_local0.playedPickRig then
				f11_local0.playedPickRig = true
				f11_arg0:processEvent( {
					name = "show_commander_message",
					eventID = "onboarding_pick_rig"
				} )
			end
		end )
		Engine.SetDvarBool( "lui_mc_playerFirstGame", false )
	elseif Engine.GetDvarBool( "lui_mc_playerFirstGame" ) then
		Engine.SetDvarBool( "lui_mc_playerFirstGame", false )
		f10_arg0.MissionInfoTabs:SetAlpha( 0, 0 )
		f10_arg0.MissionTeamInfo:SetAlpha( 0, 0 )
		f10_arg0:processEvent( {
			name = "show_commander_message",
			eventID = "lobby_welcome"
		} )
	end
	DebugPrint( "Missions - PostLoadFunc" )
	Engine.SetDvarBool( "ui_opensummary", false )
	if Engine.GetDvarInt( "lui_mc_numGamesFinishedInLobby" ) > 2 then
		Engine.SetDvarInt( "lui_mc_numGamesFinishedInLobby", 0 )
		f10_arg0:processEvent( {
			name = "show_commander_message",
			eventID = "lobby_leave"
		} )
	end
	if Engine.GetDvarInt( "lui_matchSummaryAvailable" ) == 2 then
		Engine.SetDvarInt( "lui_matchSummaryAvailable", 0 )
	end
	if Engine.GetDvarBool( "lui_mc_firstTimeInCurrentMissionTeam" ) then
		f10_arg0:processEvent( {
			name = "show_commander_message",
			eventID = "mt_join_up"
		} )
		Engine.SetDvarBool( "lui_mc_firstTimeInCurrentMissionTeam", false )
	elseif Engine.GetDvarBool( "lui_mc_rejoinedCurrentMissionTeam" ) then
		f10_arg0:processEvent( {
			name = "show_commander_message",
			eventID = "mt_welcome_back"
		} )
		Engine.SetDvarBool( "lui_mc_rejoinedCurrentMissionTeam", false )
	end
	if Engine.HasClientMatchData() and Engine.GetDvarInt( "lui_matchSummaryAvailable" ) == 1 then
		f10_arg0:AddButtonHelperTextToElement( f10_arg0.ButtonHelperBar, {
			helper_text = Engine.Localize( "LUA_MENU_GAME_SUMMARY" ),
			button_ref = "button_select",
			side = "left",
			priority = 5,
			clickable = true
		} )
		f10_arg0.bindButton:addEventHandler( "button_select", function ( f12_arg0, f12_arg1 )
			OpenAfterActionReport( f12_arg1.controller, false, false )
		end )
	end
	f10_arg0.bindButton:addEventHandler( "button_secondary", function ( f13_arg0, f13_arg1 )
		local f13_local0 = f13_arg1.controller or f10_arg1
		if not AreWePrivatePartyHost() then
			LUI.FlowManager.RequestPopupMenu( nil, "LeaveMissions", true, f13_local0, false, {
				Missions = f10_arg0
			} )
		else
			ACTIONS.LeaveMenu( f10_arg0 )
		end
		return true
	end )
	if LUI.FlowManager.IsMenuOnTop( "Missions" ) and not LUI.FlowManager.IsTopMenuModal() then
		MissionDirector.PlayTeamMusic()
		Engine.StopMenuVideo()
	else
		f10_arg0:addEventHandler( "popup_inactive", function ( f14_arg0, f14_arg1 )
			MissionDirector.PlayTeamMusic()
			Engine.StopMenuVideo()
		end )
	end
	if not Lobby.IsInPrivateParty() then
		Engine.ExecNow( "xstartprivateparty", f10_arg1 )
	end
	SURVEY.OpenPostGameSurveyIfRequired( f10_arg1, true )
	Lobby.WakePrivateParty( f10_arg1 )
	Lobby.SetPartyUIRoot( PartyUIRoot.PUBLIC_MATCH )
	Onboarding:ApplyWhitelist( "Missions", f10_arg0 )
	f10_arg0:addElement( LOOT.GetLootMaterialStreamer() )
	f10_arg0:addElement( MP.GetGameModeMaterialStreamer() )
	f10_arg0:addElement( Lobby.GetMPMapMaterialStreamer() )
	assert( f10_arg0.CharacterRotator )
	f10_arg0.CharacterRotator:SetClientCharacterIndex( FrontEndScene.ClientCharacters.Self )
	f0_local6( f10_arg1 )
end

function Missions( menu, controller )
	local self = LUI.UIHorizontalNavigator.new()
	self.id = "Missions"
	self._animationSets = {}
	self._sequences = {}
	local f15_local1 = controller and controller.controllerIndex
	if not f15_local1 and not Engine.InFrontend() then
		f15_local1 = self:getRootController()
	end
	assert( f15_local1 )
	f0_local2( self, f15_local1, controller )
	self:playSound( "menu_open" )
	local f15_local2 = self
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f15_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local SocialFeed = nil
	
	SocialFeed = MenuBuilder.BuildRegisteredType( "SocialFeed", {
		controllerIndex = f15_local1
	} )
	SocialFeed.id = "SocialFeed"
	SocialFeed:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -115, _1080p * -85 )
	self:addElement( SocialFeed )
	self.SocialFeed = SocialFeed
	
	local MissionsButtons = nil
	
	MissionsButtons = MenuBuilder.BuildRegisteredType( "MissionsButtons", {
		controllerIndex = f15_local1
	} )
	MissionsButtons.id = "MissionsButtons"
	MissionsButtons:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 630, _1080p * 216, _1080p * 596 )
	self:addElement( MissionsButtons )
	self.MissionsButtons = MissionsButtons
	
	local LobbyMembers = nil
	
	LobbyMembers = MenuBuilder.BuildRegisteredType( "LobbyMembers", {
		controllerIndex = f15_local1
	} )
	LobbyMembers.id = "LobbyMembers"
	LobbyMembers:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -700, 0, _1080p * 273, _1080p * 917 )
	self:addElement( LobbyMembers )
	self.LobbyMembers = LobbyMembers
	
	local MenuTitle = nil
	
	MenuTitle = MenuBuilder.BuildRegisteredType( "MenuTitle", {
		controllerIndex = f15_local1
	} )
	MenuTitle.id = "MenuTitle"
	MenuTitle.MenuTitle:setText( ToUpperCase( Engine.Localize( "MENU_MISSION_SELECT" ) ), 0 )
	MenuTitle.MenuBreadcrumbs:setText( ToUpperCase( "" ), 0 )
	MenuTitle.Icon:SetTop( _1080p * -28.5, 0 )
	MenuTitle.Icon:SetBottom( _1080p * 61.5, 0 )
	MenuTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
	self:addElement( MenuTitle )
	self.MenuTitle = MenuTitle
	
	local FriendsElement = nil
	
	FriendsElement = MenuBuilder.BuildRegisteredType( "online_friends_widget", {
		controllerIndex = f15_local1
	} )
	FriendsElement.id = "FriendsElement"
	FriendsElement:SetFont( FONTS.GetFont( FONTS.Dev.File ) )
	FriendsElement:SetAlignment( LUI.Alignment.Left )
	FriendsElement:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, 0, _1080p * 45 )
	self:addElement( FriendsElement )
	self.FriendsElement = FriendsElement
	
	local MissionInfoTabs = nil
	
	MissionInfoTabs = MenuBuilder.BuildRegisteredType( "MissionInfoTabs", {
		controllerIndex = f15_local1
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
		controllerIndex = f15_local1
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
		controllerIndex = f15_local1
	} )
	CommanderMessageListener.id = "CommanderMessageListener"
	CommanderMessageListener:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -700, 0, _1080p * 57, _1080p * 225 )
	self:addElement( CommanderMessageListener )
	self.CommanderMessageListener = CommanderMessageListener
	
	local DoubleXPNotifications = nil
	
	DoubleXPNotifications = MenuBuilder.BuildRegisteredType( "DoubleXPNotifications", {
		controllerIndex = f15_local1
	} )
	DoubleXPNotifications.id = "DoubleXPNotifications"
	DoubleXPNotifications:SetScale( -0.5, 0 )
	DoubleXPNotifications:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 66, _1080p * 322, _1080p * 104, _1080p * 232 )
	self:addElement( DoubleXPNotifications )
	self.DoubleXPNotifications = DoubleXPNotifications
	
	local CharacterRotator = nil
	
	CharacterRotator = MenuBuilder.BuildRegisteredType( "CharacterRotator", {
		controllerIndex = f15_local1
	} )
	CharacterRotator.id = "CharacterRotator"
	CharacterRotator:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -300, _1080p * 200, _1080p * -400, _1080p * 400 )
	self:addElement( CharacterRotator )
	self.CharacterRotator = CharacterRotator
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
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
					return self.MissionInfoTabs:SetGlitchBlockWidth( 20, 250 )
				end
			},
			{
				function ()
					return self.MissionInfoTabs:SetGlitchBlockHeight( 2, 250 )
				end
			},
			{
				function ()
					return self.MissionInfoTabs:SetGlitchDistortionRange( 4, 250 )
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
					return self.MissionTeamInfo:SetGlitchAmount( 0, 250 )
				end
			},
			{
				function ()
					return self.MissionTeamInfo:SetGlitchBlockWidth( 20, 250 )
				end
			},
			{
				function ()
					return self.MissionTeamInfo:SetGlitchBlockHeight( 2, 250 )
				end
			},
			{
				function ()
					return self.MissionTeamInfo:SetGlitchDistortionRange( 4, 250 )
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
			},
			{
				function ()
					return self.MissionTeamInfo:SetGlitchAmount( 0, 100 )
				end
			}
		} )
		self._sequences.ShowCluster = function ()
			MissionInfoTabs:AnimateSequence( "ShowCluster" )
			MissionTeamInfo:AnimateSequence( "ShowCluster" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self.addButtonHelperFunction = function ( f48_arg0, f48_arg1 )
		f48_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			priority = 1,
			clickable = true
		} )
		f48_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_SELECT" ),
			button_ref = "button_primary",
			side = "left",
			clickable = true
		} )
		f48_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_OPTIONS_CAPS" ),
			button_ref = "button_start",
			side = "left",
			priority = 4,
			clickable = true
		} )
	end
	
	self:addEventHandler( "menu_create", self.addButtonHelperFunction )
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	self:addEventHandler( "show_commander_message", function ( f49_arg0, f49_arg1 )
		local f49_local0 = f49_arg1.controller or f15_local1
		ACTIONS.AnimateSequence( self, "HideCluster" )
	end )
	self:addEventHandler( "hide_commander_message", function ( f50_arg0, f50_arg1 )
		local f50_local0 = f50_arg1.controller or f15_local1
		ACTIONS.AnimateSequence( self, "ShowCluster" )
	end )
	self.bindButton:addEventHandler( "button_start", function ( f51_arg0, f51_arg1 )
		ACTIONS.OpenMenu( "OptionsMenu", true, f51_arg1.controller or f15_local1 )
	end )
	f0_local7( self, f15_local1, controller )
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "CRMMain",
		sequenceName = "Opening",
		elementPath = "MissionsButtons.CRMMain"
	} )
	return self
end

MenuBuilder.registerType( "Missions", Missions )
LUI.FlowManager.RegisterStackPopBehaviour( "Missions", f0_local1 )
LockTable( _M )
