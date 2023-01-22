local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
LUI.FlowManager.RequestSetStack( "CPPublicMatchMenu", {
	{
		name = "MainLockoutMenu"
	},
	{
		name = "MainMenu"
	},
	{
		name = "CPMainMenu"
	},
	{
		name = "CPPlaylistMenu"
	}
} )
f0_local0 = "frontEnd.cp.CPPublicMatchMenu"
f0_local1 = nil
f0_local2 = function ()
	if Engine.IsAliensMode() then
		Lobby.ClearLocalReadyUpFlag()
	end
end

local f0_local3 = function ()
	WipeGlobalModelsAtPath( f0_local0 )
	if f0_local1 then
		WipeGlobalModelsAtPath( f0_local1 )
	end
end

local f0_local4 = function ( f3_arg0 )
	return function ( f4_arg0, f4_arg1 )
		Lobby.LeavePublicLobby()
		Engine.ExecNow( "set scr_boss_battles_enabled 0" )
		Engine.NotifyServer( "boss_reset", 1 )
		if Lobby.GetBotsConnectType() > 0 then
			Lobby.SetBotsConnectType( 0 )
		end
		LUI.FlowManager.RequestLeaveMenu( f3_arg0, true, true )
	end
	
end

local f0_local5 = function ( f5_arg0, f5_arg1 )
	local f5_local0 = nil
	if IsOurPrivatePartyHostInLobby() then
		f5_local0 = Engine.Localize( "@XBOXLIVE_LEAVEPARTYANDLOBBY" )
	else
		f5_local0 = Engine.Localize( "@XBOXLIVE_LEAVELOBBY" )
	end
	if Engine.IsXB3() then
		LUI.FlowManager.RequestPopupMenu( f5_arg0, "RateLimitedPopupYesNo", true, f5_arg1.controller, false, {
			yesAction = f0_local4( f5_arg0 ),
			message = f5_local0,
			rateLimitIntervalMS = 5000,
			rateLimitAttempts = 3
		} )
	else
		LUI.FlowManager.RequestPopupMenu( f5_arg0, "PopupYesNo", true, f5_arg1.controller, false, {
			yesAction = f0_local4( f5_arg0 ),
			message = f5_local0
		} )
	end
	return true
end

local f0_local6 = function ( f6_arg0, f6_arg1, f6_arg2 )
	assert( f6_arg0.bindButton )
	assert( f6_arg0.CPPublicMatchButtons )
	for f6_local0 = 0, Engine.GetMaxControllerCount() - 1, 1 do
		if Engine.HasActiveLocalClient( f6_local0 ) then
			Rewards.ResetMissions( f6_local0 )
			Rewards.StartZombies( f6_local0, MissionDirector.ZombiesMissionID )
			ZombiesUtils.ValidateFortuneCards( f6_local0 )
			Loot.ConsumeAll( f6_local0 )
		end
	end
	Engine.SetFrontEndSceneSection( "zm_lobby", 1 )
	ACTIONS.CharacterSelect( f6_arg0, 0, f6_arg1 )
	if Engine.GetDvarBool( "ui_opensummary" ) == true then
		PostGameFanfare:start()
	end
	if Engine.HasClientMatchData() and 0 ~= Engine.GetDvarInt( "lui_matchSummaryAvailable" ) then
		f6_arg0:AddButtonHelperTextToElement( f6_arg0.ButtonHelperBar, {
			helper_text = Engine.Localize( "LUA_MENU_GAME_SUMMARY" ),
			button_ref = "button_select",
			side = "left",
			clickable = true,
			priority = 4
		} )
		f6_arg0.bindButton:addEventHandler( "button_select", function ( f7_arg0, f7_arg1 )
			PostGameFanfare:start()
		end )
	end
	if Engine.IsCoreMode() then
		Engine.ExecNow( "eliteclan_refresh", f6_arg1 )
	end
	Lobby.EnteredLobby()
	local self = LUI.UIButtonCombination.new( nil, {
		interval = 400,
		buttonTable = {
			"left",
			"right",
			"left",
			"up",
			"down"
		},
		callback = function ( f8_arg0, f8_arg1 )
			if Engine.GetDvarString( "ui_mapname" ) == "cp_zmb" and Engine.GetPlayerDataEx( f8_arg1, CoD.StatsGroup.Coop, "haveSoulKeys", "soul_key_1" ) then
				ACTIONS.CharacterSelect( f6_arg0, 1, f8_arg1 )
			end
		end,
		closeOnSuccess = true
	} )
	local f6_local2 = LUI.UIButtonCombination.new( nil, {
		interval = 400,
		buttonTable = {
			"right",
			"left",
			"left",
			"down",
			"down",
			"right"
		},
		callback = function ( f9_arg0, f9_arg1 )
			if Engine.GetDvarString( "ui_mapname" ) == "cp_rave" and Engine.GetPlayerDataEx( f9_arg1, CoD.StatsGroup.Coop, "haveSoulKeys", "soul_key_2" ) then
				ACTIONS.CharacterSelect( f6_arg0, 2, f9_arg1 )
			end
		end,
		closeOnSuccess = true
	} )
	local f6_local3 = LUI.UIButtonCombination.new( nil, {
		interval = 400,
		buttonTable = {
			"up",
			"up",
			"right",
			"left",
			"down",
			"left"
		},
		callback = function ( f10_arg0, f10_arg1 )
			if Engine.GetDvarString( "ui_mapname" ) == "cp_disco" and Engine.GetPlayerDataEx( f10_arg1, CoD.StatsGroup.Coop, "haveSoulKeys", "soul_key_3" ) then
				ACTIONS.CharacterSelect( f6_arg0, 3, f10_arg1 )
			end
		end,
		closeOnSuccess = true
	} )
	local f6_local4 = LUI.UIButtonCombination.new( nil, {
		interval = 400,
		buttonTable = {
			"down",
			"right",
			"down",
			"left",
			"up",
			"right"
		},
		callback = function ( f11_arg0, f11_arg1 )
			if Engine.GetDvarString( "ui_mapname" ) == "cp_town" and Engine.GetPlayerDataEx( f11_arg1, CoD.StatsGroup.Coop, "haveSoulKeys", "soul_key_4" ) then
				ACTIONS.CharacterSelect( f6_arg0, 4, f11_arg1 )
			end
		end,
		closeOnSuccess = true
	} )
	local f6_local5 = LUI.UIButtonCombination.new( nil, {
		interval = 400,
		buttonTable = {
			"left",
			"left",
			"down",
			"up",
			"up",
			"right"
		},
		callback = function ( f12_arg0, f12_arg1 )
			if Engine.GetDvarString( "ui_mapname" ) == "cp_zmb" and CONDITIONS.IsDirectorsCutOn( f12_arg1 ) and CONDITIONS.HasBeatenMeph( f12_arg1 ) and Engine.GetPlayerDataEx( f12_arg1, CoD.StatsGroup.Coop, "haveSoulKeys", "soul_key_5" ) then
				ACTIONS.CharacterSelect( f6_arg0, 5, f12_arg1 )
			end
		end,
		closeOnSuccess = true
	} )
	f6_arg0:SubscribeToModel( DataSources.frontEnd.lobby.mapName:GetModel( f6_arg1 ), function ( f13_arg0 )
		ACTIONS.CharacterSelect( f6_arg0, 0, f6_arg1 )
	end )
	local f6_local6 = Engine.GetDvarString( "ui_mapname" )
	if f6_local6 == "cp_zmb" then
		f6_arg0:addElement( self )
		f6_arg0:addElement( f6_local5 )
	elseif f6_local6 == "cp_rave" then
		f6_arg0:addElement( f6_local2 )
	elseif f6_local6 == "cp_disco" then
		f6_arg0:addElement( f6_local3 )
	elseif f6_local6 == "cp_town" then
		f6_arg0:addElement( f6_local4 )
	end
	local f6_local7 = MenuBuilder.BuildRegisteredType( "LobbyStatus", {
		controllerIndex = f6_arg1
	} )
	f6_local7:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -800, _1080p * -105, _1080p * -114, _1080p * -80 )
	f6_local7:Minimize()
	f6_arg0:addElement( f6_local7 )
	f6_arg0.bindButton:addEventHandler( "button_secondary", f0_local5 )
	f0_local1 = f6_arg0.CPPublicMatchButtons.widgetModelPath
	Lobby.WakeLobbyParty( f6_arg1 )
	Lobby.SetPartyUIRoot( PartyUIRoot.PUBLIC_MATCH_LOBBY )
	ZombiesUtils.SetFrontendMusic()
	if not Engine.IsPC() then
		f6_arg0.bindButton:addEventHandler( "button_start", function ( f14_arg0, f14_arg1 )
			ACTIONS.OpenMenu( "OptionsMenu", true, f14_arg1.controller )
		end )
		f6_arg0:AddButtonHelperTextToElement( f6_arg0.ButtonHelperBar, {
			helper_text = Engine.Localize( "LUA_MENU_OPTIONS_CAPS" ),
			button_ref = "button_start",
			side = "left",
			priority = 4,
			clickable = true
		} )
	end
	if CONDITIONS.IsDirectorsCutAvailable( f6_arg1 ) then
		f6_arg0.bindButton:addEventHandler( "button_shoulderr", function ( f15_arg0, f15_arg1 )
			if not CONDITIONS.IsDirectorsCutOn( f6_arg1 ) then
				Engine.SetPlayerDataEx( f6_arg1, CoD.StatsGroup.Coop, "dc", true )
			else
				Engine.SetPlayerDataEx( f6_arg1, CoD.StatsGroup.Coop, "dc", false )
				if CONDITIONS.SecretCharacterSelection( f6_arg1, "5" ) then
					ACTIONS.CharacterSelect( f6_arg0, 0, f6_arg1 )
				end
			end
		end )
		f6_arg0:AddButtonHelperTextToElement( f6_arg0.ButtonHelperBar, {
			helper_text = Engine.Localize( "LUA_MENU_ZM_DIRECTORS_CUT_TOGGLE" ),
			button_ref = "button_shoulderr",
			side = "left",
			priority = 3,
			clickable = true
		} )
	end
	SURVEY.OpenPostGameSurveyIfRequired( f6_arg1, false )
end

function CPPublicMatchMenu( menu, controller )
	local self = LUI.UIHorizontalNavigator.new()
	self.id = "CPPublicMatchMenu"
	self._animationSets = {}
	self._sequences = {}
	local f16_local1 = controller and controller.controllerIndex
	if not f16_local1 and not Engine.InFrontend() then
		f16_local1 = self:getRootController()
	end
	assert( f16_local1 )
	self:playSound( "menu_open" )
	local f16_local2 = self
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f16_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local CPPublicMatchButtons = nil
	
	CPPublicMatchButtons = MenuBuilder.BuildRegisteredType( "CPPublicMatchButtons", {
		controllerIndex = f16_local1
	} )
	CPPublicMatchButtons.id = "CPPublicMatchButtons"
	CPPublicMatchButtons:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 131, _1080p * 631, _1080p * 200, _1080p * 600 )
	self:addElement( CPPublicMatchButtons )
	self.CPPublicMatchButtons = CPPublicMatchButtons
	
	local MatchDetails = nil
	
	MatchDetails = MenuBuilder.BuildRegisteredType( "CPMatchDetails", {
		controllerIndex = f16_local1
	} )
	MatchDetails.id = "MatchDetails"
	MatchDetails:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 131, _1080p * 631, _1080p * -265, _1080p * -135 )
	self:addElement( MatchDetails )
	self.MatchDetails = MatchDetails
	
	local FriendsElement = nil
	
	FriendsElement = MenuBuilder.BuildRegisteredType( "online_friends_widget", {
		controllerIndex = f16_local1
	} )
	FriendsElement.id = "FriendsElement"
	FriendsElement:SetFont( FONTS.GetFont( FONTS.Dev.File ) )
	FriendsElement:SetAlignment( LUI.Alignment.Left )
	FriendsElement:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, 0, _1080p * 45 )
	self:addElement( FriendsElement )
	self.FriendsElement = FriendsElement
	
	local CPMenuTitle = nil
	
	CPMenuTitle = MenuBuilder.BuildRegisteredType( "CPMenuTitle", {
		controllerIndex = f16_local1
	} )
	CPMenuTitle.id = "CPMenuTitle"
	CPMenuTitle.MenuTitle:setText( Engine.Localize( "LUA_MENU_PUBLIC_MATCH_CAPS" ), 0 )
	CPMenuTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
	self:addElement( CPMenuTitle )
	self.CPMenuTitle = CPMenuTitle
	
	local Willard = nil
	
	Willard = LUI.UIImage.new()
	Willard.id = "Willard"
	Willard:SetAlpha( 0, 0 )
	Willard:SetScale( 0.5, 0 )
	Willard:setImage( RegisterMaterial( "zm_character_willard" ), 0 )
	Willard:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 886, _1080p * 1014, _1080p * 689, _1080p * 945 )
	self:addElement( Willard )
	self.Willard = Willard
	
	local Elvira = nil
	
	Elvira = LUI.UIImage.new()
	Elvira.id = "Elvira"
	Elvira:SetAlpha( 0, 0 )
	Elvira:SetScale( 0.5, 0 )
	Elvira:setImage( RegisterMaterial( "zm_character_select_elvira" ), 0 )
	Elvira:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 886, _1080p * 1014, _1080p * 689, _1080p * 945 )
	self:addElement( Elvira )
	self.Elvira = Elvira
	
	local Pam = nil
	
	Pam = LUI.UIImage.new()
	Pam.id = "Pam"
	Pam:SetAlpha( 0, 0 )
	Pam:setImage( RegisterMaterial( "zm_character_select_pam" ), 0 )
	Pam:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 886, _1080p * 1014, _1080p * 689, _1080p * 945 )
	self:addElement( Pam )
	self.Pam = Pam
	
	local Smith = nil
	
	Smith = LUI.UIImage.new()
	Smith.id = "Smith"
	Smith:SetAlpha( 0, 0 )
	Smith:SetScale( 0.5, 0 )
	Smith:setImage( RegisterMaterial( "zm_character_select_smith" ), 0 )
	Smith:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 872, _1080p * 1000, _1080p * 661.5, _1080p * 917.5 )
	self:addElement( Smith )
	self.Smith = Smith
	
	local Hoff = nil
	
	Hoff = LUI.UIImage.new()
	Hoff.id = "Hoff"
	Hoff:SetAlpha( 0, 0 )
	Hoff:setImage( RegisterMaterial( "zm_character_select_hoff" ), 0 )
	Hoff:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 798, _1080p * 1054, _1080p * 714, _1080p * 970 )
	self:addElement( Hoff )
	self.Hoff = Hoff
	
	local CPLobbyMembers = nil
	
	CPLobbyMembers = MenuBuilder.BuildRegisteredType( "CPLobbyMembers", {
		controllerIndex = f16_local1
	} )
	CPLobbyMembers.id = "CPLobbyMembers"
	CPLobbyMembers:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1405, _1080p * 1852, _1080p * 165, _1080p * 991 )
	self:addElement( CPLobbyMembers )
	self.CPLobbyMembers = CPLobbyMembers
	
	local SocialFeed = nil
	
	SocialFeed = MenuBuilder.BuildRegisteredType( "SocialFeed", {
		controllerIndex = f16_local1
	} )
	SocialFeed.id = "SocialFeed"
	SocialFeed:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1920, _1080p * 965, _1080p * 995 )
	self:addElement( SocialFeed )
	self.SocialFeed = SocialFeed
	
	local CRMMain = nil
	
	CRMMain = MenuBuilder.BuildRegisteredType( "CRMMain", {
		controllerIndex = f16_local1
	} )
	CRMMain.id = "CRMMain"
	CRMMain:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 137, _1080p * 447, _1080p * 745, _1080p * 1069 )
	self:addElement( CRMMain )
	self.CRMMain = CRMMain
	
	local DoubleXPNotifications = nil
	
	DoubleXPNotifications = MenuBuilder.BuildRegisteredType( "DoubleXPNotifications", {
		controllerIndex = f16_local1
	} )
	DoubleXPNotifications.id = "DoubleXPNotifications"
	DoubleXPNotifications:SetScale( -0.5, 0 )
	DoubleXPNotifications:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1276, _1080p * 1791, _1080p * 58, _1080p * 186 )
	self:addElement( DoubleXPNotifications )
	self.DoubleXPNotifications = DoubleXPNotifications
	
	local f16_local17 = nil
	if CONDITIONS.IsDirectorsCutAvailable( f16_local1 ) then
		f16_local17 = MenuBuilder.BuildRegisteredType( "TalismanLobbyWidget", {
			controllerIndex = f16_local1
		} )
		f16_local17.id = "TalismanLobbyWidget"
		f16_local17:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 583, _1080p * 714, _1080p * 833, _1080p * 964 )
		self:addElement( f16_local17 )
		self.TalismanLobbyWidget = f16_local17
	end
	local directorsCut = nil
	
	directorsCut = MenuBuilder.BuildRegisteredType( "directorsCut", {
		controllerIndex = f16_local1
	} )
	directorsCut.id = "directorsCut"
	directorsCut:SetAlpha( 0, 0 )
	directorsCut:SetZRotation( 13, 0 )
	directorsCut:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 468, _1080p * 768, _1080p * 154, _1080p * 304 )
	self:addElement( directorsCut )
	self.directorsCut = directorsCut
	
	self._animationSets.DefaultAnimationSet = function ()
		CPLobbyMembers:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.CPLobbyMembers:SetAlpha( 0, 0 )
				end,
				function ()
					return self.CPLobbyMembers:SetAlpha( 0, 1670 )
				end,
				function ()
					return self.CPLobbyMembers:SetAlpha( 1, 330 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			CPLobbyMembers:AnimateSequence( "DefaultSequence" )
		end
		
		Hoff:RegisterAnimationSequence( "displayHoff", {
			{
				function ()
					return self.Hoff:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.displayHoff = function ()
			Hoff:AnimateSequence( "displayHoff" )
		end
		
		Hoff:RegisterAnimationSequence( "hideHoff", {
			{
				function ()
					return self.Hoff:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.hideHoff = function ()
			Hoff:AnimateSequence( "hideHoff" )
		end
		
		self._sequences.NewSequenceName = function ()
			
		end
		
		Smith:RegisterAnimationSequence( "displaySmith", {
			{
				function ()
					return self.Smith:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.displaySmith = function ()
			Smith:AnimateSequence( "displaySmith" )
		end
		
		Smith:RegisterAnimationSequence( "hideSmith", {
			{
				function ()
					return self.Smith:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.hideSmith = function ()
			Smith:AnimateSequence( "hideSmith" )
		end
		
		Pam:RegisterAnimationSequence( "displayPam", {
			{
				function ()
					return self.Pam:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.displayPam = function ()
			Pam:AnimateSequence( "displayPam" )
		end
		
		Pam:RegisterAnimationSequence( "hidePam", {
			{
				function ()
					return self.Pam:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.hidePam = function ()
			Pam:AnimateSequence( "hidePam" )
		end
		
		Elvira:RegisterAnimationSequence( "displayElvira", {
			{
				function ()
					return self.Elvira:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.displayElvira = function ()
			Elvira:AnimateSequence( "displayElvira" )
		end
		
		Elvira:RegisterAnimationSequence( "hideElvira", {
			{
				function ()
					return self.Elvira:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.hideElvira = function ()
			Elvira:AnimateSequence( "hideElvira" )
		end
		
		directorsCut:RegisterAnimationSequence( "directorsCutOn", {
			{
				function ()
					return self.directorsCut:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.directorsCutOn = function ()
			directorsCut:AnimateSequence( "directorsCutOn" )
		end
		
		directorsCut:RegisterAnimationSequence( "directorsCutOff", {
			{
				function ()
					return self.directorsCut:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.directorsCutOff = function ()
			directorsCut:AnimateSequence( "directorsCutOff" )
		end
		
		Willard:RegisterAnimationSequence( "displayWillard", {
			{
				function ()
					return self.Willard:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.displayWillard = function ()
			Willard:AnimateSequence( "displayWillard" )
		end
		
		Willard:RegisterAnimationSequence( "hideWillard", {
			{
				function ()
					return self.Willard:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.hideWillard = function ()
			Willard:AnimateSequence( "hideWillard" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	Willard:SubscribeToModel( DataSources.frontEnd.CP.characterSelect:GetModel( f16_local1 ), function ()
		if CONDITIONS.SecretCharacterSelection( f16_local1, "5" ) then
			ACTIONS.AnimateSequence( self, "displayWillard" )
		end
		if not CONDITIONS.SecretCharacterSelection( f16_local1, "5" ) then
			ACTIONS.AnimateSequence( self, "hideWillard" )
		end
	end )
	Elvira:SubscribeToModel( DataSources.frontEnd.CP.characterSelect:GetModel( f16_local1 ), function ()
		if CONDITIONS.SecretCharacterSelection( f16_local1, "4" ) then
			ACTIONS.AnimateSequence( self, "displayElvira" )
		end
		if not CONDITIONS.SecretCharacterSelection( f16_local1, "4" ) then
			ACTIONS.AnimateSequence( self, "hideElvira" )
		end
	end )
	Pam:SubscribeToModel( DataSources.frontEnd.CP.characterSelect:GetModel( f16_local1 ), function ()
		if CONDITIONS.SecretCharacterSelection( f16_local1, "3" ) then
			ACTIONS.AnimateSequence( self, "displayPam" )
		end
		if not CONDITIONS.SecretCharacterSelection( f16_local1, "3" ) then
			ACTIONS.AnimateSequence( self, "hidePam" )
		end
	end )
	Smith:SubscribeToModel( DataSources.frontEnd.CP.characterSelect:GetModel( f16_local1 ), function ()
		if CONDITIONS.SecretCharacterSelection( f16_local1, "2" ) then
			ACTIONS.AnimateSequence( self, "displaySmith" )
		end
		if not CONDITIONS.SecretCharacterSelection( f16_local1, "2" ) then
			ACTIONS.AnimateSequence( self, "hideSmith" )
		end
	end )
	Hoff:SubscribeToModel( DataSources.frontEnd.CP.characterSelect:GetModel( f16_local1 ), function ()
		if CONDITIONS.SecretCharacterSelection( f16_local1, "1" ) then
			ACTIONS.AnimateSequence( self, "displayHoff" )
		end
		if not CONDITIONS.SecretCharacterSelection( f16_local1, "1" ) then
			ACTIONS.AnimateSequence( self, "hideHoff" )
		end
	end )
	directorsCut:SubscribeToModel( DataSources.frontEnd.CP.directorsCutOn:GetModel( f16_local1 ), function ()
		if CONDITIONS.IsDirectorsCutOn( f16_local1 ) then
			ACTIONS.AnimateSequence( self, "directorsCutOn" )
		end
		if not CONDITIONS.IsDirectorsCutOn( f16_local1 ) then
			ACTIONS.AnimateSequence( self, "directorsCutOff" )
		end
	end )
	self.addButtonHelperFunction = function ( f53_arg0, f53_arg1 )
		f53_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_SELECT" ),
			button_ref = "button_primary",
			side = "left",
			clickable = true
		} )
		f53_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			clickable = true
		} )
	end
	
	self:addEventHandler( "menu_create", self.addButtonHelperFunction )
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	f0_local6( self, f16_local1, controller )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "CRMMain",
		sequenceName = "Minimize",
		elementPath = "CRMMain"
	} )
	return self
end

MenuBuilder.registerType( "CPPublicMatchMenu", CPPublicMatchMenu )
LUI.FlowManager.RegisterStackPushBehaviour( "CPPublicMatchMenu", f0_local2 )
LUI.FlowManager.RegisterStackPopBehaviour( "CPPublicMatchMenu", f0_local3 )
LockTable( _M )
