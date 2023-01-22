local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0 )
	assert( f1_arg0 )
	f1_arg0:setImage( RegisterMaterial( Engine.TableLookup( CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, Engine.GetDvarString( "ui_gametype" ), CSV.gameTypesTable.cols.image ) ), 0 )
end

f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2, f2_arg3 )
	if Cac.ClearLoadoutDraftTimerRefreshIfNeeded() then
		return 
	end
	local f2_local0 = f2_arg0:Wait( 100 )
	f2_local0.onComplete = function ()
		return f2_arg0:RefreshTimer( f2_arg1, f2_arg2, f2_arg3 )
	end
	
	local f2_local1 = LoadoutDrafting.GetDraftingTimeRemaining()
	if f2_arg0.lastTimeRemaining < f2_local1 and Engine.GetTeamForLocalClient() == Teams.spectator and not f2_arg3 then
		f2_arg0.loadoutSelectPhase = true
	end
	f2_arg0.lastTimeRemaining = f2_local1
	local f2_local2 = Lobby.GetDraftLoadoutTimer()
	local f2_local3 = Lobby.GetDraftRigTimer()
	if f2_arg0.loadoutSelectPhase then
		Cac.AdjustPreDraftCountdownPopup( f2_arg0, f2_arg1, f2_local1, f2_local2, "MP_FRONTEND_ONLY_LOADOUT_SELECT_START" )
	else
		Cac.AdjustPreDraftCountdownPopup( f2_arg0, f2_arg1, f2_local1, f2_local3, "MP_FRONTEND_ONLY_RIG_DRAFT_START" )
	end
	if IsMlgGameBattlesMatch() then
		local f2_local4 = MLG.GetGameBattleDSAcquisitionState( f2_arg1 )
		if f2_local4 == GAMEBATTLES.MLG_DS_ACQUISITION_STATE.COULD_NOT_ACQUIRE or f2_local4 == GAMEBATTLES.MLG_DS_ACQUISITION_STATE.ACQUISITION_ERROR then
			LUI.FlowManager.RequestLeaveMenuByName( "RigDraftMenu" )
		end
	end
	if f2_local1 <= 0 then
		if Engine.GetTeamForLocalClient() == Teams.spectator and f2_arg3 then
			if f2_arg0.loadoutSelectPhase then
				Cac.LoadoutDraftStartMatch( f2_arg0, f2_arg1, f2_arg2, true )
			else
				Lobby.SetPartyUIRoot( PartyUIRoot.LOADOUT_SELECT_MENU )
				LoadoutDrafting.StartDraftingTimer( (f2_local2 + Cac.LoadoutDraftPhaseChangeTimer) * 1000 )
				f2_arg0.loadoutSelectPhase = true
			end
		elseif f2_arg3 then
			LoadoutDrafting.StartDraftingTimer( (f2_local2 + Cac.LoadoutDraftPhaseChangeTimer) * 1000 )
			Lobby.SetPartyUIRoot( PartyUIRoot.LOADOUT_SELECT_MENU )
			LUI.FlowManager.RequestAddMenu( "LoadoutSelect", true, f2_arg1, true, nil, true )
		end
	end
end

LUI.FlowManager.RegisterIgnoreFollowHostCallback( "RigDraftMenu", function ( f4_arg0 )
	local f4_local0 = Engine.GetLuiRoot()
	local f4_local1 = Lobby.IsInLobby()
	local f4_local2
	if f4_local1 and Lobby.IsGameHost() then
		f4_local2 = IsPrivateMatch()
		if not f4_local2 then
			if not f4_local1 then
				f4_local2 = Lobby.IsPrivatePartyHost()
			else
				f4_local2 = false
			end
		end
	elseif not f4_local1 then
		f4_local2 = Lobby.IsPrivatePartyHost()
	else
		f4_local2 = false
	end
	if Engine.GetTeamForLocalClient() == Teams.spectator and not f4_local2 and f4_arg0 == LUI.FlowManager.FlowMenus.MP[PartyUIRoot.LOADOUT_SELECT_MENU] then
		return true
	else
		return false
	end
end )
local f0_local3 = function ( f5_arg0, f5_arg1, f5_arg2 )
	assert( f5_arg0.LoadoutDraftTimer )
	assert( f5_arg0.LoadoutDraftTimer.Seconds )
	Lobby.SetCodcastingEnabled( true )
	CODCASTER.SetCODCastingEnabled( true )
	Lobby.SetPartyUIRoot( PartyUIRoot.RIG_DRAFT_MENU )
	local f5_local0 = Lobby.IsInLobby()
	local f5_local1
	if f5_local0 and Lobby.IsGameHost() then
		f5_local1 = IsPrivateMatch()
		if not f5_local1 then
			if not f5_local0 then
				f5_local1 = Lobby.IsPrivatePartyHost()
			else
				f5_local1 = false
			end
		end
	elseif not f5_local0 then
		f5_local1 = Lobby.IsPrivatePartyHost()
	else
		f5_local1 = false
	end
	f5_arg0.teamsData = Engine.GetLoadoutDraftTeams( f5_arg1 )
	f5_arg0.myXUID = f5_arg0.teamsData.TeamA[1]
	local f5_local2 = Engine.GetTeamForLocalClient()
	if f5_local2 == Teams.spectator then
		f5_local2 = Teams.allies
	end
	local f5_local3
	if f5_local2 == Teams.axis then
		f5_local3 = Teams.allies
		if not f5_local3 then
		
		else
			assert( f5_arg0.TeamBackground )
			f5_arg0.TeamBackground:SetupTeamColor( f5_local2, f5_arg1 )
			local TeamA = nil
			
			TeamA = MenuBuilder.BuildRegisteredType( "LoadoutDraftTeam", {
				controllerIndex = f5_arg1,
				team = f5_local2,
				teamData = f5_arg0.teamsData.TeamA,
				menu = "RigDraft",
				side = "Left"
			} )
			TeamA.id = "TeamA"
			TeamA:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 782, _1080p * 150, _1080p * 278 )
			f5_arg0:addElement( TeamA )
			f5_arg0.TeamA = TeamA
			
			TeamA.LoadoutDraftTeamInfo.TeamName:SetAlignment( LUI.Alignment.Left )
			ACTIONS.AnimateSequence( TeamA.LoadoutDraftTeamInfo, "TeamLeft" )
			local TeamB = nil
			
			TeamB = MenuBuilder.BuildRegisteredType( "LoadoutDraftTeam", {
				controllerIndex = f5_arg1,
				team = f5_local3,
				teamData = f5_arg0.teamsData.TeamB,
				menu = "RigDraft",
				side = "Right"
			} )
			TeamB.id = "TeamB"
			TeamB:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -782, _1080p * -130, _1080p * 150, _1080p * 278 )
			f5_arg0:addElement( TeamB )
			f5_arg0.TeamB = TeamB
			
			TeamB.LoadoutDraftTeamInfo.TeamName:SetAlignment( LUI.Alignment.Right )
			ACTIONS.AnimateSequence( TeamB.LoadoutDraftTeamInfo, "TeamRight" )
			f5_local2 = Engine.GetTeamForLocalClient()
			local f5_local6 = LUI.FlowManager.GetScopedData( f5_arg0 )
			local f5_local7 = nil
			if CONDITIONS.IsPublicMatch() then
				f5_local7 = DataSources.alwaysLoaded.playerData.MP.rankedloadouts.squadMembers
			else
				f5_local7 = DataSources.alwaysLoaded.playerData.MP.privateloadouts.squadMembers
				if f5_local2 ~= Teams.spectator and f5_local6.priorEntry then
					if IsSystemLink() then
						Lobby.SetupSystemLinkLobbyScene( f5_arg1 )
					else
						Lobby.SetupPrivateMatchLobbyScene( f5_arg1 )
					end
				end
			end
			f5_arg0.squadMemberDataSource = f5_local7
			local f5_local8 = Engine.GetLuiRoot()
			if not f5_local6.priorEntry then
				if f5_local2 ~= Teams.spectator then
					local f5_local9 = GetCACPlayerDataDataSource( f5_local7 )
					f5_local9.rig.rigRef:SetValue( f5_arg1, Cac.rigNoneValue )
					f5_local9.statsGroup.archetypeSuper:SetValue( f5_arg1, Cac.superNoneValue )
					f5_local9.statsGroup.archetypePerk:SetValue( f5_arg1, Cac.traitNoneValue )
					f5_local9.statsGroup.head:SetValue( f5_arg1, Cac.esportsDefaultHeads[Cac.rigNoneValue] )
					f5_local9.statsGroup.body:SetValue( f5_arg1, Cac.esportsDefaultBodies[Cac.rigNoneValue] )
					ACTIONS.UploadStats( f5_arg0, f5_arg1 )
				end
				if f5_local1 then
					LoadoutDrafting.StartDraftingTimer( (Lobby.GetDraftRigTimer() + Cac.LoadoutDraftPhaseChangeTimer) * 1000 )
				end
				if f5_local8.MPDraftModeTimer then
					f5_local8.MPDraftModeTimer:closeTree()
					f5_local8.MPDraftModeTimer = nil
				end
				f5_local6.priorEntry = true
			end
			f5_arg0:addEventHandler( "menu_create", function ( f6_arg0, f6_arg1 )
				if f5_local2 == Teams.spectator and f5_local1 then
					f6_arg0:AddButtonHelperText( {
						helper_text = Engine.Localize( "LUA_MENU_BACK" ),
						button_ref = "button_secondary",
						side = "left",
						clickable = true
					} )
					
					local bindButton = LUI.UIBindButton.new()
					bindButton.id = "selfBindButton"
					f5_arg0:addElement( bindButton )
					f5_arg0.bindButton = bindButton
					
					f5_arg0.bindButton:addEventHandler( "button_secondary", function ( f7_arg0, f7_arg1 )
						ACTIONS.LeaveMenu( f5_arg0 )
					end )
				elseif f5_local2 ~= Teams.spectator then
					f6_arg0:AddButtonHelperText( {
						helper_text = Engine.Localize( "LUA_MENU_SELECT" ),
						button_ref = "button_primary",
						side = "left",
						clickable = true
					} )
				end
			end )
			f5_arg0.TeamA:SetupTeamPlayerData( #f5_arg0.teamsData.TeamA )
			f5_arg0.TeamB:SetupTeamPlayerData( #f5_arg0.teamsData.TeamB )
			ACTIONS.GainFocus( f5_arg0, "TeamA", f5_arg1 )
			f0_local0( f5_arg0.GameModeIcon )
			Cac.SetupLoadoutDraftTimerRefresh( f5_arg0.LoadoutDraftTimer )
			if not f5_local8.MPDraftModeTimer then
				local self = LUI.UIElement.new()
				self.lastTimeRemaining = 999999
				self.id = "MPDraftModeTimer"
				f5_local8.MPDraftModeTimer = self
				self.RefreshTimer = f0_local1
				f5_local8:addElement( self )
				self:RefreshTimer( f5_arg1, f5_local8, f5_local1 )
			end
		end
	end
	f5_local3 = Teams.axis
end

function RigDraftMenu( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "RigDraftMenu"
	local f8_local1 = controller and controller.controllerIndex
	if not f8_local1 and not Engine.InFrontend() then
		f8_local1 = self:getRootController()
	end
	assert( f8_local1 )
	self:playSound( "menu_open" )
	local f8_local2 = self
	local Blur = nil
	
	Blur = LUI.UIBlur.new()
	Blur.id = "Blur"
	Blur:SetBlurStrength( 2, 0 )
	self:addElement( Blur )
	self.Blur = Blur
	
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f8_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local SocialFeed = nil
	
	SocialFeed = MenuBuilder.BuildRegisteredType( "SocialFeed", {
		controllerIndex = f8_local1
	} )
	SocialFeed.id = "SocialFeed"
	SocialFeed:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -115, _1080p * -85 )
	self:addElement( SocialFeed )
	self.SocialFeed = SocialFeed
	
	local MenuTitle = nil
	
	MenuTitle = MenuBuilder.BuildRegisteredType( "MenuTitle", {
		controllerIndex = f8_local1
	} )
	MenuTitle.id = "MenuTitle"
	MenuTitle.MenuTitle:setText( Engine.Localize( "MP_FRONTEND_ONLY_RIG_DRAFT_CAPS" ), 0 )
	MenuTitle.MenuBreadcrumbs:setText( "", 0 )
	MenuTitle.Icon:SetTop( _1080p * -28.5, 0 )
	MenuTitle.Icon:SetBottom( _1080p * 61.5, 0 )
	MenuTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
	self:addElement( MenuTitle )
	self.MenuTitle = MenuTitle
	
	local TeamBackground = nil
	
	TeamBackground = MenuBuilder.BuildRegisteredType( "LoadoutDraftTeamBG", {
		controllerIndex = f8_local1
	} )
	TeamBackground.id = "TeamBackground"
	TeamBackground:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -865, _1080p * 865, _1080p * 150, _1080p * 278 )
	self:addElement( TeamBackground )
	self.TeamBackground = TeamBackground
	
	local GameModeIcon = nil
	
	GameModeIcon = LUI.UIImage.new()
	GameModeIcon.id = "GameModeIcon"
	GameModeIcon:setImage( RegisterMaterial( "gamemode_generic" ), 0 )
	GameModeIcon:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -115, _1080p * 115, _1080p * 99, _1080p * 329 )
	self:addElement( GameModeIcon )
	self.GameModeIcon = GameModeIcon
	
	local GameModeHeader = nil
	
	GameModeHeader = MenuBuilder.BuildRegisteredType( "LoadoutDraftHeader", {
		controllerIndex = f8_local1
	} )
	GameModeHeader.id = "GameModeHeader"
	GameModeHeader:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -608, _1080p * -96, _1080p * 55, _1080p * 125 )
	self:addElement( GameModeHeader )
	self.GameModeHeader = GameModeHeader
	
	local LoadoutDraftTimer = nil
	
	LoadoutDraftTimer = MenuBuilder.BuildRegisteredType( "LoadoutDraftTimer", {
		controllerIndex = f8_local1
	} )
	LoadoutDraftTimer.id = "LoadoutDraftTimer"
	LoadoutDraftTimer:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -150, _1080p * 150, 0, _1080p * 64 )
	self:addElement( LoadoutDraftTimer )
	self.LoadoutDraftTimer = LoadoutDraftTimer
	
	local AbilitiesCategoryLeft = nil
	
	AbilitiesCategoryLeft = MenuBuilder.BuildRegisteredType( "LoadoutDraftCategoryAccent", {
		controllerIndex = f8_local1
	} )
	AbilitiesCategoryLeft.id = "AbilitiesCategoryLeft"
	AbilitiesCategoryLeft.Label:setText( Engine.Localize( "ALIENS_ABILITIES_CAPS" ), 0 )
	AbilitiesCategoryLeft:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -130, _1080p * -100, _1080p * 300, _1080p * 935 )
	self:addElement( AbilitiesCategoryLeft )
	self.AbilitiesCategoryLeft = AbilitiesCategoryLeft
	
	local RigCategoryLeft = nil
	
	RigCategoryLeft = MenuBuilder.BuildRegisteredType( "LoadoutDraftCategoryAccent", {
		controllerIndex = f8_local1
	} )
	RigCategoryLeft.id = "RigCategoryLeft"
	RigCategoryLeft.Label:setText( ToUpperCase( Engine.Localize( "CHALLENGE_CATEGORY_RIGS" ) ), 0 )
	RigCategoryLeft:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -485, _1080p * -455, _1080p * 300, _1080p * 935 )
	self:addElement( RigCategoryLeft )
	self.RigCategoryLeft = RigCategoryLeft
	
	local AbilitiesCategoryRight = nil
	
	AbilitiesCategoryRight = MenuBuilder.BuildRegisteredType( "LoadoutDraftCategoryAccentFlipped", {
		controllerIndex = f8_local1
	} )
	AbilitiesCategoryRight.id = "AbilitiesCategoryRight"
	AbilitiesCategoryRight.Label:setText( Engine.Localize( "ALIENS_ABILITIES_CAPS" ), 0 )
	AbilitiesCategoryRight:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 100, _1080p * 130, _1080p * 300, _1080p * 935 )
	self:addElement( AbilitiesCategoryRight )
	self.AbilitiesCategoryRight = AbilitiesCategoryRight
	
	local RigCategoryRight = nil
	
	RigCategoryRight = MenuBuilder.BuildRegisteredType( "LoadoutDraftCategoryAccentFlipped", {
		controllerIndex = f8_local1
	} )
	RigCategoryRight.id = "RigCategoryRight"
	RigCategoryRight.Label:setText( ToUpperCase( Engine.Localize( "CHALLENGE_CATEGORY_RIGS" ) ), 0 )
	RigCategoryRight:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 455, _1080p * 485, _1080p * 300, _1080p * 935 )
	self:addElement( RigCategoryRight )
	self.RigCategoryRight = RigCategoryRight
	
	f0_local3( self, f8_local1, controller )
	return self
end

MenuBuilder.registerType( "RigDraftMenu", RigDraftMenu )
LockTable( _M )
