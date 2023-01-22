local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
LUI.FlowManager.RequestSetStack( "PrivateMatchLobby", {
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
f0_local0 = "frontEnd.MP.privateLobby"
f0_local1 = nil
f0_local2 = function ()
	local f1_local0 = MatchRules.GetData( "commonOption", "codcasterEnabled" ) and not (Engine.SplitscreenPlayerCount() > 1)
	if f1_local0 ~= nil then
		CODCASTER.SetCODCastingEnabled( f1_local0 )
		Lobby.SetCodcastingEnabled( f1_local0 )
	else
		CODCASTER.SetCODCastingEnabled( false )
		Lobby.SetCodcastingEnabled( false )
	end
end

local f0_local3 = function ()
	if Lobby.IsInLobby() and Lobby.IsGameHost() then
		MatchRules.SetUsingMatchRulesData( 1 )
	end
	f0_local2()
end

local f0_local4 = function ()
	WipeGlobalModelsAtPath( f0_local0 )
	if f0_local1 then
		WipeGlobalModelsAtPath( f0_local1 )
	end
	Lobby.SetCodcastingEnabled( false )
	CODCASTER.SetCODCastingEnabled( false )
end

local f0_local5 = function ( f4_arg0, f4_arg1 )
	return function ( f5_arg0, f5_arg1 )
		Lobby.LeaveCustomGameLobby()
		if Lobby.GetBotsConnectType() > 0 then
			Lobby.SetBotsConnectType( 0 )
		end
		CODCASTER.SetCODCastingEnabled( false )
		MLG.SetUsingMLGRules( false )
		LUI.FlowManager.RequestLeaveMenu( f4_arg0, true, true )
	end
	
end

local f0_local6 = function ( f6_arg0, f6_arg1, f6_arg2 )
	assert( f6_arg0.bindButton )
	assert( f6_arg0.PrivateMatchLobbyButtons )
	assert( f6_arg0.PrivateMatchLobbyButtons.widgetModelPath )
	if CONDITIONS.IsDraftEnabled() then
		LoadoutDrafting.SetEnabled( false )
	end
	f6_arg0.MenuTitle.MenuBreadcrumbs:setText( ToUpperCase( Engine.Localize( "LUA_MENU_BREADCRUMB_2_ITEMS", "MENU_MULTIPLAYER", "LUA_MENU_CUSTOM_GAME_CAPS" ) ), 0 )
	Streaming.SetStreamingEnabled( false )
	Lobby.SetupPrivateMatchLobbyScene( f6_arg1 )
	local f6_local0 = LUI.DataSourceInGlobalModel.new( "frontEnd.lobby.mapName" )
	local f6_local1 = LUI.DataSourceInGlobalModel.new( "frontEnd.lobby.gameTypeName" )
	if CONDITIONS.IsCoreMultiplayer( f6_arg0 ) then
		assert( f6_arg0.MapVoteDetails )
		assert( f6_arg0.MapVoteDetails.Title.VoteTitle )
		f6_arg0:SubscribeToModel( DataSources.frontEnd.lobby.mapName:GetModel( f6_arg1 ), function ()
			local f7_local0 = DataSources.frontEnd.lobby.mapName:GetValue( f6_arg1 )
			if f7_local0 then
				f6_arg0.MapVoteDetails.Title.VoteTitle:setText( f7_local0 )
			end
		end )
		ACTIONS.AnimateSequenceByElement( f6_arg0, {
			elementName = "MapVoteDetails",
			sequenceName = "LANVoteComplete",
			elementPath = "MapDetails"
		} )
		ACTIONS.AnimateSequenceByElement( f6_arg0, {
			elementName = "Title",
			sequenceName = "VoteComplete",
			elementPath = "MapVoteDetails.Title"
		} )
		f6_arg0.MapVoteDetails.VoteOptions:closeTree()
		LoadoutDrafting.ResetAllPartyMemberDraftData()
		if CONDITIONS.IsCWLDraftLobby( f6_arg0 ) then
			local self = LUI.UITimer.new( nil, {
				interval = 500,
				event = {
					name = "enableCODCasting"
				}
			} )
			self.id = "enableCODCastingTimer"
			f6_arg0:addElement( self )
			self:registerEventHandler( "enableCODCasting", function ()
				if not Engine.GetDvarBool( "com_codcasterEnabled" ) then
					CODCASTER.SetCODCastingEnabled( true )
				end
			end )
		end
	end
	if Engine.GetDvarBool( "ui_opensummary" ) == true then
		OpenAfterActionReport( f6_arg1, true, true )
		Engine.SetDvarBool( "ui_opensummary", false )
	end
	if not Engine.InLobby() then
		Engine.ExecNow( "xstartprivatematch" )
	end
	Lobby.WakeLobbyParty( f6_arg1 )
	Lobby.SetPartyUIRoot( PartyUIRoot.PRIVATE_MATCH )
	f0_local2()
	RefreshMLGRules( f6_arg0, f6_arg1 )
	local f6_local3 = LUI.DataSourceInGlobalModel.new( "frontEnd.lobby.areWeGameHost" )
	local f6_local4 = f6_local3:GetValue( f6_arg1 )
	if f6_local4 then
		local self = MatchRules.GetData( "commonOption", "codcasterEnabled" )
		if self ~= nil and Engine.GetDvarBool( "lui_codcaster_enabled" ) and not (Engine.SplitscreenPlayerCount() > 1) then
			Lobby.SetCodcastingEnabled( self )
		else
			Lobby.SetCodcastingEnabled( false )
		end
		f6_arg0.ESportsRulesStatus:UpdateVisibility()
		Lobby.SetTeamAssignmentEnabled( MatchRules.GetData( "commonOption", "teamAssignmentAllowed" ) )
	else
		local self = LUI.DataSourceInGlobalModel.new( "frontEnd.lobby.isCodCastingEnabled" )
		f6_arg0:SubscribeToModel( self:GetModel( f6_arg1 ), function ()
			CODCASTER.SetCODCastingEnabled( self:GetValue( f6_arg1 ) )
		end, true )
		local f6_local5 = LUI.DataSourceInGlobalModel.new( "frontEnd.lobby.areMLGRulesEnabled" )
		f6_arg0:SubscribeToModel( f6_local5:GetModel( f6_arg1 ), function ()
			f6_arg0.ESportsRulesStatus:UpdateVisibility()
		end )
	end
	Engine.SetDvarBool( "lobby_team_select", Lobby.IsTeamAssignmentEnabled() )
	if CODCASTER.CanCODCast() then
		f6_arg0.ChangeTeamOrRole:SetAlpha( 1, 0 )
	else
		f6_arg0.ChangeTeamOrRole:SetAlpha( 0, 0 )
	end
	if f6_local4 then
		local self = Engine.GetDvarString( "ui_saved_mapname" )
		if self ~= "" then
			Engine.SetDvarString( "ui_mapname", self )
			Engine.ExecNow( "xupdatepartystate" )
		end
	end
	f6_arg0.bindButton:addEventHandler( "button_secondary", function ( f11_arg0, f11_arg1 )
		if Lobby.IsGameHost() and Lobby.CanCancelMatchStart() then
			Lobby.CancelStartServer()
			return 
		end
		local f11_local0 = nil
		if IsOurPrivatePartyHostInLobby() then
			f11_local0 = Engine.Localize( "@XBOXLIVE_LEAVEPARTYANDLOBBY" )
		else
			f11_local0 = Engine.Localize( "@XBOXLIVE_LEAVELOBBY" )
		end
		LUI.FlowManager.RequestPopupMenu( f6_arg0, "PopupYesNo", true, f11_arg1.controller, false, {
			yesAction = f0_local5( f6_arg0, f6_arg1 ),
			message = f11_local0
		} )
		return true
	end )
	if Engine.GetDvarInt( "lui_matchSummaryAvailable" ) == 1 then
		Engine.SetDvarInt( "lui_matchSummaryAvailable", 0 )
	end
	if CODCASTER.CanCODCast() then
		CODCASTER.CreateCODCasterSettingsButton( f6_arg0.PrivateMatchLobbyButtons, f6_arg1 )
	end
	if Engine.HasClientMatchData() and Engine.GetDvarInt( "lui_matchSummaryAvailable" ) == 2 then
		f6_arg0:AddButtonHelperTextToElement( f6_arg0.ButtonHelperBar, {
			helper_text = Engine.Localize( "LUA_MENU_GAME_SUMMARY" ),
			button_ref = "button_select",
			side = "left",
			clickable = true
		} )
		f6_arg0.bindButton:addEventHandler( "button_select", function ( f12_arg0, f12_arg1 )
			OpenAfterActionReport( f12_arg1.controller, true, false )
		end )
	end
	assert( f6_arg0.LobbyMembers )
	f6_arg0.LobbyMembers:AddLobbyStatus( f6_arg1 )
	f0_local1 = f6_arg0.PrivateMatchLobbyButtons.widgetModelPath
	MissionDirector.PlayTeamMusic()
	Engine.StopMenuVideo()
	if not Engine.IsPC() then
		f6_arg0.bindButton:addEventHandler( "button_start", function ( f13_arg0, f13_arg1 )
			ACTIONS.OpenMenu( "OptionsMenu", true, f13_arg1.controller )
		end )
		f6_arg0:AddButtonHelperTextToElement( f6_arg0.ButtonHelperBar, {
			helper_text = Engine.Localize( "LUA_MENU_OPTIONS_CAPS" ),
			button_ref = "button_start",
			side = "left",
			priority = 4,
			clickable = true
		} )
	end
	f6_arg0:addElement( Lobby.GetMPMapMaterialStreamer() )
end

function PrivateMatchLobby( menu, controller )
	local self = LUI.UIHorizontalNavigator.new()
	self.id = "PrivateMatchLobby"
	local f14_local1 = controller and controller.controllerIndex
	if not f14_local1 and not Engine.InFrontend() then
		f14_local1 = self:getRootController()
	end
	assert( f14_local1 )
	self:playSound( "menu_open" )
	local f14_local2 = self
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f14_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local PrivateMatchLobbyButtons = nil
	
	PrivateMatchLobbyButtons = MenuBuilder.BuildRegisteredType( "PrivateMatchLobbyButtons", {
		controllerIndex = f14_local1
	} )
	PrivateMatchLobbyButtons.id = "PrivateMatchLobbyButtons"
	PrivateMatchLobbyButtons:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 630, _1080p * 216, _1080p * 625 )
	self:addElement( PrivateMatchLobbyButtons )
	self.PrivateMatchLobbyButtons = PrivateMatchLobbyButtons
	
	local LobbyMembers = nil
	
	LobbyMembers = MenuBuilder.BuildRegisteredType( "LobbyMembers", {
		controllerIndex = f14_local1
	} )
	LobbyMembers.id = "LobbyMembers"
	LobbyMembers:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -700, _1080p * -150, _1080p * 273, _1080p * 938 )
	self:addElement( LobbyMembers )
	self.LobbyMembers = LobbyMembers
	
	local FriendsElement = nil
	
	FriendsElement = MenuBuilder.BuildRegisteredType( "online_friends_widget", {
		controllerIndex = f14_local1
	} )
	FriendsElement.id = "FriendsElement"
	FriendsElement:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	FriendsElement:SetAlignment( LUI.Alignment.Left )
	FriendsElement:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 100, _1080p * 600, _1080p * -60, _1080p * -15 )
	self:addElement( FriendsElement )
	self.FriendsElement = FriendsElement
	
	local MenuTitle = nil
	
	MenuTitle = MenuBuilder.BuildRegisteredType( "MenuTitle", {
		controllerIndex = f14_local1
	} )
	MenuTitle.id = "MenuTitle"
	MenuTitle.MenuTitle:setText( Engine.Localize( "LUA_MENU_CUSTOM_GAME_CAPS" ), 0 )
	MenuTitle.MenuBreadcrumbs:setText( ToUpperCase( Engine.Localize( "LUA_MENU_CUSTOM_GAME_CAPS" ) ), 0 )
	MenuTitle.Icon:SetTop( _1080p * -28.5, 0 )
	MenuTitle.Icon:SetBottom( _1080p * 61.5, 0 )
	MenuTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
	self:addElement( MenuTitle )
	self.MenuTitle = MenuTitle
	
	local ESportsRulesStatus = nil
	
	ESportsRulesStatus = MenuBuilder.BuildRegisteredType( "ESportsRulesStatus", {
		controllerIndex = f14_local1
	} )
	ESportsRulesStatus.id = "ESportsRulesStatus"
	ESportsRulesStatus:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 604, _1080p * 549.5, _1080p * 629.5 )
	self:addElement( ESportsRulesStatus )
	self.ESportsRulesStatus = ESportsRulesStatus
	
	local ChangeTeamOrRole = nil
	
	ChangeTeamOrRole = MenuBuilder.BuildRegisteredType( "ChangeTeamOrRole", {
		controllerIndex = f14_local1
	} )
	ChangeTeamOrRole.id = "ChangeTeamOrRole"
	ChangeTeamOrRole:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1103, _1080p * 1328, _1080p * 1006, _1080p * 1040 )
	self:addElement( ChangeTeamOrRole )
	self.ChangeTeamOrRole = ChangeTeamOrRole
	
	local SocialFeed = nil
	
	SocialFeed = MenuBuilder.BuildRegisteredType( "SocialFeed", {
		controllerIndex = f14_local1
	} )
	SocialFeed.id = "SocialFeed"
	SocialFeed:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1920, _1080p * 965.5, _1080p * 995.5 )
	self:addElement( SocialFeed )
	self.SocialFeed = SocialFeed
	
	local MapVoteDetails = nil
	
	MapVoteDetails = MenuBuilder.BuildRegisteredType( "MapVoteDetails", {
		controllerIndex = f14_local1
	} )
	MapVoteDetails.id = "MapVoteDetails"
	MapVoteDetails:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 634, _1080p * 658, _1080p * 932 )
	self:addElement( MapVoteDetails )
	self.MapVoteDetails = MapVoteDetails
	
	self.addButtonHelperFunction = function ( f15_arg0, f15_arg1 )
		f15_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			priority = 1,
			clickable = true
		} )
		f15_arg0:AddButtonHelperText( {
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
	
	f0_local6( self, f14_local1, controller )
	return self
end

MenuBuilder.registerType( "PrivateMatchLobby", PrivateMatchLobby )
LUI.FlowManager.RegisterStackPushBehaviour( "PrivateMatchLobby", f0_local3 )
LUI.FlowManager.RegisterStackPopBehaviour( "PrivateMatchLobby", f0_local4 )
LockTable( _M )
