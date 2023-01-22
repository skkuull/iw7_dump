local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
MenuBuilder.registerType( "MPSystemLinkLobby", function ( ... )
	return SystemLinkLobby( ... )
end )
MenuBuilder.registerType( "CPSystemLinkLobby", function ( ... )
	return SystemLinkLobby( ... )
end )
LUI.FlowManager.RequestSetStack( "MPSystemLinkLobby", {
	{
		name = "MainLockoutMenu"
	},
	{
		name = "MainMenu"
	},
	{
		name = "MPSystemLinkMenu",
		exclusiveController = true
	}
} )
LUI.FlowManager.RequestSetStack( "CPSystemLinkLobby", {
	{
		name = "MainLockoutMenu"
	},
	{
		name = "MainMenu"
	},
	{
		name = "CPSystemLinkMenu",
		exclusiveController = true
	}
} )
f0_local0 = "frontEnd.systemLinkLobby"
f0_local1 = nil
f0_local2 = function ()
	local f3_local0 = MatchRules.GetData( "commonOption", "codcasterEnabled" )
	if f3_local0 ~= nil then
		CODCASTER.SetCODCastingEnabled( f3_local0 )
		Lobby.SetCodcastingEnabled( f3_local0 )
	else
		CODCASTER.SetCODCastingEnabled( false )
		Lobby.SetCodcastingEnabled( false )
	end
end

local f0_local3 = function ()
	MatchRules.SetUsingMatchRulesData( 1 )
	if not Engine.IsAliensMode() then
		f0_local2()
		if Engine.GetDvarBool( "systemlink_host" ) then
			local f4_local0 = Engine.GetDvarString( "ui_saved_mapname" )
			if f4_local0 ~= "" then
				Engine.SetDvarString( "ui_mapname", f4_local0 )
			end
		end
	end
end

local f0_local4 = function ()
	Engine.SetDvarBool( "systemlink_host", false )
	WipeGlobalModelsAtPath( f0_local0 )
	if f0_local1 then
		WipeGlobalModelsAtPath( f0_local1 )
	end
	if not Engine.IsAliensMode() then
		Lobby.SetCodcastingEnabled( false )
		CODCASTER.SetCODCastingEnabled( false )
	end
end

LUI.FlowManager.RegisterStackPushBehaviour( "MPSystemLinkLobby", f0_local3 )
LUI.FlowManager.RegisterStackPopBehaviour( "MPSystemLinkLobby", f0_local4 )
LUI.FlowManager.RegisterStackPushBehaviour( "CPSystemLinkLobby", f0_local3 )
LUI.FlowManager.RegisterStackPopBehaviour( "CPSystemLinkLobby", f0_local4 )
MenuBuilder.registerType( "LeaveSystemLinkLobbyPopup", function ()
	local f6_local0 = MenuBuilder.BuildRegisteredType( "PopupYesNo", {
		message = Engine.Localize( "@XBOXLIVE_LEAVELOBBY" ),
		yesAction = function ( f7_arg0, f7_arg1 )
			if Lobby.GetBotsConnectType() > 0 then
				Lobby.SetBotsConnectType( 0 )
			end
			Engine.ExecNow( "xstopprivateparty 0", f7_arg1 )
			LUI.FlowManager.RequestLeaveMenu( f7_arg0, true, true )
			LUI.FlowManager.RequestLeaveMenu( nil, true, true )
			if not Engine.IsAliensMode() then
				CODCASTER.SetCODCastingEnabled( false )
				Lobby.SetCodcastingEnabled( false )
				MLG.SetUsingMLGRules( false )
			end
		end
	} )
	f6_local0.id = "LeaveSystemLinkLobbyPopup"
	return f6_local0
end )
function LeaveSystemLinkLobby( f8_arg0, f8_arg1 )
	if Engine.GetDvarBool( "systemlink_host" ) and Lobby.CanCancelMatchStart() then
		Lobby.CancelStartServer()
		return 
	else
		LUI.FlowManager.RequestPopupMenu( f8_arg0, "LeaveSystemLinkLobbyPopup", true, f8_arg1.controller, false )
	end
end

local f0_local5 = function ( f9_arg0, f9_arg1, f9_arg2 )
	assert( f9_arg0.bindButton )
	assert( f9_arg0.SystemLinkLobbyButtons )
	assert( f9_arg0.SystemLinkLobbyButtons.widgetModelPath )
	local f9_local0 = Engine.GetFirstActiveController()
	if CONDITIONS.IsDraftEnabled() then
		LoadoutDrafting.SetEnabled( false )
	end
	local f9_local1 = Engine.IsAliensMode()
	if IsSystemLink() then
		f9_arg0.MenuTitle.MenuBreadcrumbs:setText( ToUpperCase( Engine.Localize( "LUA_MENU_BREADCRUMB_2_ITEMS", "EXE_LOCAL_PLAY", "MENU_MULTIPLAYER" ) ), 0 )
	end
	if Engine.GetDvarInt( "lui_matchSummaryAvailable" ) == 1 then
		Engine.SetDvarInt( "lui_matchSummaryAvailable", 0 )
	end
	if Engine.HasClientMatchData() and Engine.GetDvarInt( "lui_matchSummaryAvailable" ) == 2 then
		f9_arg0:processEvent( ButtonHelperText.CommonEvents.addGameSummaryButton )
		f9_arg0.bindButton:addEventHandler( "button_select", function ( f10_arg0, f10_arg1 )
			OpenAfterActionReport( f10_arg1.controller, true, false )
		end )
	end
	if Engine.IsAliensMode() then
		Engine.SetFrontEndSceneSection( "zm_lobby", 1 )
	end
	if Engine.GetDvarBool( "ui_opensummary" ) == true then
		OpenAfterActionReport( f9_arg1, true, true )
		Engine.SetDvarBool( "ui_opensummary", false )
	end
	Engine.Exec( MPConfig.default_dvars, f9_local0 )
	if Engine.IsAliensMode() and Engine.GetDvarString( "ui_gametype" ) ~= "ship" and Engine.GetDvarString( "ui_gametype" ) ~= "zombie" then
		utils.cp.AliensUtils.AliensRunConfig( f9_local0 )
		utils.cp.AliensUtils.InitGameTypeToAliens()
	end
	RefreshMLGRules( f9_arg0, f9_local0 )
	Lobby.WakePrivateParty( f9_arg1 )
	Lobby.SetPartyUIRoot( PartyUIRoot.SYSTEM_LINK_LOBBY )
	f0_local2()
	assert( f9_arg0.LobbyMembers )
	f9_arg0.LobbyMembers:AddLobbyStatus( f9_arg1 )
	f9_arg0.bindButton:addEventHandler( "button_secondary", LeaveSystemLinkLobby )
	f0_local1 = f9_arg0.SystemLinkLobbyButtons.widgetModelPath
	local f9_local2 = Engine.GetDvarBool( "systemlink_host" )
	local f9_local3 = Engine.GetDvarString( "ui_mapname" )
	if f9_local2 then
		for ChangeTeamOrRole = 0, Lobby.GetMapFeederCount() - 1, 1 do
			if f9_local3 == Lobby.GetMapLoadNameByIndex( ChangeTeamOrRole ) and not Engine.IsMapPackOwned( Lobby.GetMapPackForMapIndex( ChangeTeamOrRole ) ) then
				if Engine.IsCoreMode() then
				
				else
					Engine.SetDvarString( "ui_mapname", "cp_zmb" )
				end
				Engine.SetDvarString( "ui_mapname", "mp_frontier" )
				Engine.SetDvarString( "ui_saved_mapname", "mp_frontier" )
			end
		end
	end
	if CONDITIONS.IsCoreMultiplayer( f9_arg0 ) then
		assert( f9_arg0.MapDetails )
		assert( f9_arg0.MapDetails.Title.VoteTitle )
		f9_arg0:SubscribeToModel( DataSources.frontEnd.lobby.mapName:GetModel( f9_arg1 ), function ()
			f9_arg0.MapDetails.Title.VoteTitle:setText( DataSources.frontEnd.lobby.mapName:GetValue( f9_arg1 ), 0 )
		end )
		ACTIONS.AnimateSequenceByElement( f9_arg0, {
			elementName = "MapDetails",
			sequenceName = "LANVoteComplete",
			elementPath = "MapDetails"
		} )
		ACTIONS.AnimateSequenceByElement( f9_arg0, {
			elementName = "Title",
			sequenceName = "VoteComplete",
			elementPath = "MapDetails.Title"
		} )
		f9_arg0.MapDetails.VoteOptions:closeTree()
	end
	if Engine.IsCoreMode() then
		Lobby.SetupSystemLinkLobbyScene( f9_arg1 )
	end
	if CONDITIONS.IsThirdGameMode( f9_arg0 ) then
		f9_arg0.LobbyMembers:AnimateSequence( "DefaultSequenceCP" )
		ACTIONS.CharacterSelect( f9_arg0, 0, f9_arg1 )
		f9_arg0:addElement( LUI.UIButtonCombination.new( nil, {
			interval = 400,
			buttonTable = {
				"left",
				"right",
				"left",
				"up",
				"down"
			},
			callback = function ( f12_arg0, f12_arg1 )
				if f9_local3 == "cp_zmb" and Engine.GetPlayerDataEx( f12_arg1, CoD.StatsGroup.Coop, "haveSoulKeys", "soul_key_1" ) then
					ACTIONS.CharacterSelect( f9_arg0, 1, f12_arg1 )
				end
			end,
			closeOnSuccess = true
		} ) )
	end
	if not Engine.IsAliensMode() then
		if f9_local2 then
			local ChangeTeamOrRole = MatchRules.GetData( "commonOption", "codcasterEnabled" )
			if ChangeTeamOrRole ~= nil and Engine.GetDvarBool( "lui_codcaster_enabled" ) then
				Lobby.SetCodcastingEnabled( ChangeTeamOrRole )
				if ChangeTeamOrRole then
					CODCASTER.CreateCODCasterSettingsButton( f9_arg0.SystemLinkLobbyButtons, f9_arg1 )
				else
					CODCASTER.DestroyCODCasterSettingsButton( f9_arg0.SystemLinkLobbyButtons, f9_arg1 )
				end
			else
				Lobby.SetCodcastingEnabled( false )
			end
			f9_arg0.ESportsRulesStatus:UpdateVisibility()
			Lobby.SetTeamAssignmentEnabled( MatchRules.GetData( "commonOption", "teamAssignmentAllowed" ) )
		else
			local ChangeTeamOrRole = LUI.DataSourceInGlobalModel.new( "frontEnd.lobby.isCodCastingEnabled" )
			f9_arg0:SubscribeToModel( ChangeTeamOrRole:GetModel( f9_arg1 ), function ()
				local f13_local0 = ChangeTeamOrRole:GetValue( f9_arg1 )
				CODCASTER.SetCODCastingEnabled( f13_local0 )
				if f13_local0 then
					CODCASTER.CreateCODCasterSettingsButton( f9_arg0.SystemLinkLobbyButtons, f9_arg1 )
				else
					CODCASTER.DestroyCODCasterSettingsButton( f9_arg0.SystemLinkLobbyButtons, f9_arg1 )
				end
			end )
			local self = LUI.DataSourceInGlobalModel.new( "frontEnd.lobby.areMLGRulesEnabled" )
			f9_arg0:SubscribeToModel( self:GetModel( f9_arg1 ), function ()
				f9_arg0.ESportsRulesStatus:UpdateVisibility()
			end )
		end
		Engine.SetDvarBool( "lobby_team_select", Lobby.IsTeamAssignmentEnabled() )
		local ChangeTeamOrRole = nil
		ChangeTeamOrRole = MenuBuilder.BuildRegisteredType( "ChangeTeamOrRole", {
			controllerIndex = f9_arg1
		} )
		ChangeTeamOrRole.id = "ChangeTeamOrRole"
		if Engine.GetDvarInt( "lui_matchSummaryAvailable" ) == 0 then
			ChangeTeamOrRole:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1417, _1080p * 1642, _1080p * 1006, _1080p * 1040 )
		else
			ChangeTeamOrRole:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1103, _1080p * 1328, _1080p * 1006, _1080p * 1040 )
		end
		f9_arg0:addElement( ChangeTeamOrRole )
		f9_arg0.ChangeTeamOrRole = ChangeTeamOrRole
		
		LoadoutDrafting.ResetAllPartyMemberDraftData()
		if CONDITIONS.IsCWLDraftLobby( f9_arg0 ) then
			local self = LUI.UITimer.new( nil, {
				interval = 500,
				event = {
					name = "enableCODCasting"
				}
			} )
			self.id = "enableCODCastingTimer"
			f9_arg0:addElement( self )
			self:registerEventHandler( "enableCODCasting", function ()
				if not Engine.GetDvarBool( "com_codcasterEnabled" ) then
					CODCASTER.SetCODCastingEnabled( true )
				end
			end )
		end
	end
end

function SystemLinkLobby( menu, controller )
	local self = LUI.UIHorizontalNavigator.new()
	self.id = "SystemLinkLobby"
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
	
	local SocialFeed = nil
	
	SocialFeed = MenuBuilder.BuildRegisteredType( "SocialFeed", {
		controllerIndex = f16_local1
	} )
	SocialFeed.id = "SocialFeed"
	SocialFeed:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -115, _1080p * -85 )
	self:addElement( SocialFeed )
	self.SocialFeed = SocialFeed
	
	local SystemLinkLobbyButtons = nil
	
	SystemLinkLobbyButtons = MenuBuilder.BuildRegisteredType( "SystemLinkLobbyButtons", {
		controllerIndex = f16_local1
	} )
	SystemLinkLobbyButtons.id = "SystemLinkLobbyButtons"
	SystemLinkLobbyButtons:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 634, _1080p * 216, _1080p * 666 )
	self:addElement( SystemLinkLobbyButtons )
	self.SystemLinkLobbyButtons = SystemLinkLobbyButtons
	
	local LobbyMembers = nil
	
	LobbyMembers = MenuBuilder.BuildRegisteredType( "LobbyMembers", {
		controllerIndex = f16_local1
	} )
	LobbyMembers.id = "LobbyMembers"
	LobbyMembers:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -700, _1080p * -150, _1080p * 273, _1080p * 938 )
	self:addElement( LobbyMembers )
	self.LobbyMembers = LobbyMembers
	
	local MenuTitle = nil
	
	MenuTitle = MenuBuilder.BuildRegisteredType( "MenuTitle", {
		controllerIndex = f16_local1
	} )
	MenuTitle.id = "MenuTitle"
	MenuTitle.MenuTitle:setText( ToUpperCase( Engine.Localize( "MENU_LOBBY" ) ), 0 )
	MenuTitle.MenuBreadcrumbs:setText( LocalizeString( ToUpperCase( "" ) ), 0 )
	MenuTitle.Icon:SetTop( _1080p * -28.5, 0 )
	MenuTitle.Icon:SetBottom( _1080p * 61.5, 0 )
	MenuTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
	self:addElement( MenuTitle )
	self.MenuTitle = MenuTitle
	
	local f16_local8 = nil
	if CONDITIONS.IsCoreMultiplayer( self ) then
		f16_local8 = MenuBuilder.BuildRegisteredType( "MapVoteDetails", {
			controllerIndex = f16_local1
		} )
		f16_local8.id = "MapDetails"
		f16_local8:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 634, _1080p * 658, _1080p * 932 )
		self:addElement( f16_local8 )
		self.MapDetails = f16_local8
	end
	local f16_local9 = nil
	if CONDITIONS.IsThirdGameMode( self ) then
		f16_local9 = MenuBuilder.BuildRegisteredType( "CPMenuTitle", {
			controllerIndex = f16_local1
		} )
		f16_local9.id = "CPMenuTitle"
		f16_local9.MenuTitle:setText( Engine.Localize( "MENU_LOBBY" ), 0 )
		f16_local9:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
		self:addElement( f16_local9 )
		self.CPMenuTitle = f16_local9
	end
	local f16_local10 = nil
	if CONDITIONS.IsThirdGameMode( self ) then
		f16_local10 = LUI.UIImage.new()
		f16_local10.id = "Hoff"
		f16_local10:SetAlpha( 0, 0 )
		f16_local10:setImage( RegisterMaterial( "zm_character_select_hoff" ), 0 )
		f16_local10:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 798, _1080p * 1054, _1080p * 714, _1080p * 970 )
		self:addElement( f16_local10 )
		self.Hoff = f16_local10
	end
	local ESportsRulesStatus = nil
	
	ESportsRulesStatus = MenuBuilder.BuildRegisteredType( "ESportsRulesStatus", {
		controllerIndex = f16_local1
	} )
	ESportsRulesStatus.id = "ESportsRulesStatus"
	ESportsRulesStatus:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 604, _1080p * 549.5, _1080p * 629.5 )
	self:addElement( ESportsRulesStatus )
	self.ESportsRulesStatus = ESportsRulesStatus
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		SystemLinkLobbyButtons:RegisterAnimationSequence( "ShowPlayerInfo", {
			{
				function ()
					return self.SystemLinkLobbyButtons:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -960, _1080p * -410, _1080p * 216, _1080p * 666, 100 )
				end
			}
		} )
		LobbyMembers:RegisterAnimationSequence( "ShowPlayerInfo", {
			{
				function ()
					return self.LobbyMembers:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -1790, _1080p * -1190, _1080p * 273, _1080p * 938, 100 )
				end
			}
		} )
		if CONDITIONS.IsCoreMultiplayer( self ) then
			f16_local8:RegisterAnimationSequence( "ShowPlayerInfo", {
				{
					function ()
						return self.MapDetails:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -960, _1080p * -456, _1080p * 658, _1080p * 932, 100 )
					end
				}
			} )
		end
		self._sequences.ShowPlayerInfo = function ()
			SystemLinkLobbyButtons:AnimateSequence( "ShowPlayerInfo" )
			LobbyMembers:AnimateSequence( "ShowPlayerInfo" )
			if CONDITIONS.IsCoreMultiplayer( self ) then
				f16_local8:AnimateSequence( "ShowPlayerInfo" )
			end
		end
		
		SystemLinkLobbyButtons:RegisterAnimationSequence( "HidePlayerInfo", {
			{
				function ()
					return self.SystemLinkLobbyButtons:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 634, _1080p * 216, _1080p * 666, 100 )
				end
			}
		} )
		LobbyMembers:RegisterAnimationSequence( "HidePlayerInfo", {
			{
				function ()
					return self.LobbyMembers:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -700, _1080p * -150, _1080p * 273, _1080p * 938, 100 )
				end
			}
		} )
		if CONDITIONS.IsCoreMultiplayer( self ) then
			f16_local8:RegisterAnimationSequence( "HidePlayerInfo", {
				{
					function ()
						return self.MapDetails:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 634, _1080p * 658, _1080p * 932, 100 )
					end
				}
			} )
		end
		self._sequences.HidePlayerInfo = function ()
			SystemLinkLobbyButtons:AnimateSequence( "HidePlayerInfo" )
			LobbyMembers:AnimateSequence( "HidePlayerInfo" )
			if CONDITIONS.IsCoreMultiplayer( self ) then
				f16_local8:AnimateSequence( "HidePlayerInfo" )
			end
		end
		
		SystemLinkLobbyButtons:RegisterAnimationSequence( "ShowPlayerInfoCP", {
			{
				function ()
					return self.SystemLinkLobbyButtons:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -960, _1080p * -410, _1080p * 216, _1080p * 666, 100 )
				end
			}
		} )
		LobbyMembers:RegisterAnimationSequence( "ShowPlayerInfoCP", {
			{
				function ()
					return self.LobbyMembers:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -1790, _1080p * -1190, _1080p * 216, _1080p * 881, 100 )
				end
			}
		} )
		self._sequences.ShowPlayerInfoCP = function ()
			SystemLinkLobbyButtons:AnimateSequence( "ShowPlayerInfoCP" )
			LobbyMembers:AnimateSequence( "ShowPlayerInfoCP" )
		end
		
		SystemLinkLobbyButtons:RegisterAnimationSequence( "HidePlayerInfoCP", {
			{
				function ()
					return self.SystemLinkLobbyButtons:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 680, _1080p * 216, _1080p * 666, 100 )
				end
			}
		} )
		LobbyMembers:RegisterAnimationSequence( "HidePlayerInfoCP", {
			{
				function ()
					return self.LobbyMembers:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -600, 0, _1080p * 216, _1080p * 881, 100 )
				end
			}
		} )
		self._sequences.HidePlayerInfoCP = function ()
			SystemLinkLobbyButtons:AnimateSequence( "HidePlayerInfoCP" )
			LobbyMembers:AnimateSequence( "HidePlayerInfoCP" )
		end
		
		LobbyMembers:RegisterAnimationSequence( "DefaultSequenceCP", {
			{
				function ()
					return self.LobbyMembers:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -588, _1080p * 12, _1080p * 216, _1080p * 881, 0 )
				end,
				function ()
					return self.LobbyMembers:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -588, _1080p * 12, _1080p * 216, _1080p * 881, 100 )
				end
			}
		} )
		MenuTitle:RegisterAnimationSequence( "DefaultSequenceCP", {
			{
				function ()
					return self.MenuTitle:SetAlpha( 0, 0 )
				end
			}
		} )
		if CONDITIONS.IsCoreMultiplayer( self ) then
			f16_local8:RegisterAnimationSequence( "DefaultSequenceCP", {
				{
					function ()
						return self.MapDetails:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		self._sequences.DefaultSequenceCP = function ()
			LobbyMembers:AnimateSequence( "DefaultSequenceCP" )
			MenuTitle:AnimateSequence( "DefaultSequenceCP" )
			if CONDITIONS.IsCoreMultiplayer( self ) then
				f16_local8:AnimateSequence( "DefaultSequenceCP" )
			end
		end
		
		if CONDITIONS.IsThirdGameMode( self ) then
			f16_local10:RegisterAnimationSequence( "displayHoffCP", {
				{
					function ()
						return self.Hoff:SetAlpha( 1, 0 )
					end
				}
			} )
		end
		self._sequences.displayHoffCP = function ()
			if CONDITIONS.IsThirdGameMode( self ) then
				f16_local10:AnimateSequence( "displayHoffCP" )
			end
		end
		
		if CONDITIONS.IsThirdGameMode( self ) then
			f16_local10:RegisterAnimationSequence( "hideHoffCP", {
				{
					function ()
						return self.Hoff:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		self._sequences.hideHoffCP = function ()
			if CONDITIONS.IsThirdGameMode( self ) then
				f16_local10:AnimateSequence( "hideHoffCP" )
			end
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	SystemLinkLobbyButtons:addEventHandler( "gain_focus", function ( f42_arg0, f42_arg1 )
		local f42_local0 = f42_arg1.controller or f16_local1
		if CONDITIONS.IsCoreMultiplayer( self ) then
			ACTIONS.AnimateSequence( self, "HidePlayerInfo" )
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			ACTIONS.AnimateSequence( self, "HidePlayerInfoCP" )
		end
	end )
	if CONDITIONS.IsThirdGameMode( self ) then
		f16_local10:SubscribeToModel( DataSources.frontEnd.CP.characterSelect:GetModel( f16_local1 ), function ()
			if CONDITIONS.SecretCharacterSelection( f16_local1, "1" ) then
				ACTIONS.AnimateSequence( self, "displayHoffCP" )
			end
			if not CONDITIONS.SecretCharacterSelection( f16_local1, "1" ) then
				ACTIONS.AnimateSequence( self, "hideHoffCP" )
			end
		end )
	end
	self.addButtonHelperFunction = function ( f44_arg0, f44_arg1 )
		f44_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			priority = 1,
			clickable = true
		} )
		f44_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_SELECT" ),
			button_ref = "button_primary",
			side = "left",
			clickable = true
		} )
		f44_arg0:AddButtonHelperText( {
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
	
	self.bindButton:addEventHandler( "button_start", function ( f45_arg0, f45_arg1 )
		ACTIONS.OpenMenu( "OptionsMenu", true, f45_arg1.controller or f16_local1 )
		ACTIONS.PlaySoundSetSound( self, "selectAlt", false )
	end )
	f0_local5( self, f16_local1, controller )
	if CONDITIONS.IsThirdGameMode( self ) then
		ACTIONS.AnimateSequence( self, "DefaultSequenceCP" )
	end
	return self
end

MenuBuilder.registerType( "SystemLinkLobby", SystemLinkLobby )
LUI.FlowManager.RegisterStackPushBehaviour( "SystemLinkLobby", f0_local3 )
LUI.FlowManager.RegisterStackPopBehaviour( "SystemLinkLobby", f0_local4 )
LockTable( _M )
