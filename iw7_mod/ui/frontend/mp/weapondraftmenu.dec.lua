local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0 )
	assert( f1_arg0 )
	f1_arg0:setImage( RegisterMaterial( Engine.TableLookup( CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, Engine.GetDvarString( "ui_gametype" ), CSV.gameTypesTable.cols.image ) ), 0 )
end

f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2 )
	assert( f2_arg0.LoadoutDraftTimer )
	assert( f2_arg0.LoadoutDraftTimer.Seconds )
	Lobby.SetPartyUIRoot( PartyUIRoot.WEAPON_DRAFT_MENU )
	f2_arg0.teamsData = Engine.GetLoadoutDraftTeams( f2_arg1 )
	f2_arg0.myXUID = f2_arg0.teamsData.TeamA[1]
	local f2_local0 = Engine.GetTeamForLocalClient()
	if f2_local0 == Teams.spectator then
		f2_local0 = Teams.allies
	end
	local f2_local1
	if f2_local0 == Teams.axis then
		f2_local1 = Teams.allies
		if not f2_local1 then
		
		else
			assert( f2_arg0.TeamBackground )
			f2_arg0.TeamBackground:SetupTeamColor( f2_local0, f2_arg1 )
			local TeamA = nil
			
			TeamA = MenuBuilder.BuildRegisteredType( "LoadoutDraftTeam", {
				controllerIndex = f2_arg1,
				team = f2_local0,
				teamData = f2_arg0.teamsData.TeamA,
				menu = "WeaponDraft",
				side = "Left"
			} )
			TeamA.id = "TeamA"
			TeamA:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 782, _1080p * 150, _1080p * 278 )
			f2_arg0:addElement( TeamA )
			f2_arg0.TeamA = TeamA
			
			TeamA.LoadoutDraftTeamInfo.TeamName:SetAlignment( LUI.Alignment.Left )
			ACTIONS.AnimateSequence( TeamA.LoadoutDraftTeamInfo, "TeamLeft" )
			local TeamB = nil
			
			TeamB = MenuBuilder.BuildRegisteredType( "LoadoutDraftTeam", {
				controllerIndex = f2_arg1,
				team = f2_local1,
				teamData = f2_arg0.teamsData.TeamB,
				menu = "WeaponDraft",
				side = "Right"
			} )
			TeamB.id = "TeamB"
			TeamB:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -782, _1080p * -130, _1080p * 150, _1080p * 278 )
			f2_arg0:addElement( TeamB )
			f2_arg0.TeamB = TeamB
			
			TeamB.LoadoutDraftTeamInfo.TeamName:SetAlignment( LUI.Alignment.Right )
			ACTIONS.AnimateSequence( TeamB.LoadoutDraftTeamInfo, "TeamRight" )
			local f2_local4 = LUI.FlowManager.GetScopedData( f2_arg0 )
			local f2_local5 = nil
			if CONDITIONS.IsPublicMatch() then
				f2_local5 = DataSources.alwaysLoaded.playerData.MP.rankedloadouts.squadMembers
			else
				f2_local5 = DataSources.alwaysLoaded.playerData.MP.privateloadouts.squadMembers
				if not Lobby.IsLocalMemberMLGSpectator( f2_arg1 ) then
					if IsSystemLink() then
						Lobby.SetupSystemLinkLobbyScene( f2_arg1 )
					elseif IsPrivateMatch() then
						Lobby.SetupPrivateMatchLobbyScene( f2_arg1 )
					end
				end
			end
			f2_arg0.squadMemberDataSource = f2_local5
			local f2_local6 = Lobby.GetDraftWeaponTimer()
			if not f2_local4.priorEntry then
				if Lobby.IsLocalMemberMLGSpectator( f2_arg1 ) then
					LoadoutDrafting.StartDraftingTimer( (f2_local6 + Cac.LoadoutDraftPhaseChangeTimer) * 1000 )
				end
				f2_local4.priorEntry = true
			end
			f2_arg0.TeamA:SetupTeamPlayerData( #f2_arg0.teamsData.TeamA )
			f2_arg0.TeamB:SetupTeamPlayerData( #f2_arg0.teamsData.TeamB )
			ACTIONS.GainFocus( f2_arg0, "TeamA", f2_arg1 )
			f0_local0( f2_arg0.GameModeIcon )
			local f2_local7 = nil
			local f2_local8 = function ()
				local f3_local0 = f2_arg0:Wait( 100 )
				f3_local0.onComplete = function ()
					return f2_local7()
				end
				
				local f3_local1 = LoadoutDrafting.GetDraftingTimeRemaining()
				local f3_local2 = Lobby.GetDraftLoadoutTimer()
				if f3_local1 > 10 and f2_arg0.LoadoutDraftTimer.lastAnimPlayed ~= "Reset" then
					f2_arg0.LoadoutDraftTimer.lastAnimPlayed = "Reset"
					ACTIONS.AnimateSequence( f2_arg0.LoadoutDraftTimer, "Reset" )
				end
				if f2_arg0.loadoutSelectPhase then
					if f3_local2 < f3_local1 then
						f2_arg0.LoadoutDraftTimer.Seconds:setText( f3_local2, 0 )
						if not f2_arg0.prePhaseCountdownOpen then
							f2_arg0.prePhaseCountdownOpen = true
							LUI.FlowManager.RequestPopupMenu( f2_arg0, "PreDraftCountdownPopup", true, f2_arg1, false, {
								draftPhaseText = "MP_FRONTEND_ONLY_LOADOUT_SELECT_START",
								baseCountdownTime = f3_local2,
								controllerIndex = f2_arg1
							} )
						end
					else
						if f2_arg0.prePhaseCountdownOpen then
							f2_arg0.prePhaseCountdownOpen = nil
							LUI.FlowManager.RequestLeaveMenuByName( "PreDraftCountdownPopup" )
						end
						f2_arg0.LoadoutDraftTimer.Seconds:setText( f3_local1, 0 )
					end
				elseif f2_local6 < f3_local1 then
					f2_arg0.LoadoutDraftTimer.Seconds:setText( f2_local6, 0 )
					if not f2_arg0.prePhaseCountdownOpen then
						f2_arg0.prePhaseCountdownOpen = true
						LUI.FlowManager.RequestPopupMenu( f2_arg0, "PreDraftCountdownPopup", true, f2_arg1, false, {
							draftPhaseText = "MP_FRONTEND_ONLY_WEAPON_DRAFT_START",
							baseCountdownTime = f2_local6,
							controllerIndex = f2_arg1
						} )
					end
				else
					if f2_arg0.prePhaseCountdownOpen then
						f2_arg0.prePhaseCountdownOpen = nil
						LUI.FlowManager.RequestLeaveMenuByName( "PreDraftCountdownPopup" )
					end
					f2_arg0.LoadoutDraftTimer.Seconds:setText( f3_local1, 0 )
				end
				if f3_local1 <= 10 and f2_arg0.oldTimeRemaining ~= f3_local1 then
					f2_arg0.oldTimeRemaining = f3_local1
					Engine.PlayCountdownSound( f3_local1 )
					if f3_local1 <= 10 and f3_local1 > 5 and f2_arg0.LoadoutDraftTimer.lastAnimPlayed ~= "TenSecondsRemaining" then
						f2_arg0.LoadoutDraftTimer.lastAnimPlayed = "TenSecondsRemaining"
						ACTIONS.AnimateSequence( f2_arg0.LoadoutDraftTimer, "TenSecondsRemaining" )
					end
					if f3_local1 <= 5 and f2_arg0.LoadoutDraftTimer.lastAnimPlayed ~= "FiveSecondsRemaining" then
						f2_arg0.LoadoutDraftTimer.lastAnimPlayed = "FiveSecondsRemaining"
						ACTIONS.AnimateSequence( f2_arg0.LoadoutDraftTimer, "FiveSecondsRemaining" )
					end
				end
				if f3_local1 <= 0 and Lobby.IsLocalMemberMLGSpectator( f2_arg1 ) then
					if f2_arg0.loadoutSelectPhase then
						if not f2_arg0.startingMatch then
							f2_arg0.startingMatch = true
							local f3_local3 = Engine.GetLuiRoot()
							if IsSystemLink() then
								Lobby.StartServer( f2_arg1, true )
								LUI.UIRoot.BlockButtonInput( f3_local3, false, "MenuTransition" )
							else
								LUI.UIRoot.BlockButtonInput( f3_local3, false, "TransitionToGame" )
								Engine.Exec( "xpartygo 1" )
								if not (Engine.SplitscreenPlayerCount() > 1) then
									CODCASTER.SetCODCastingEnabled( MatchRules.GetData( "commonOption", "codcasterEnabled" ) )
								else
									CODCASTER.SetCODCastingEnabled( false )
								end
							end
						end
					else
						Lobby.SetPartyUIRoot( PartyUIRoot.LOADOUT_SELECT_MENU )
						LoadoutDrafting.StartDraftingTimer( (f3_local2 + Cac.LoadoutDraftPhaseChangeTimer) * 1000 )
						f2_arg0.loadoutSelectPhase = true
					end
				end
			end
			
			f2_local8()
		end
	end
	f2_local1 = Teams.axis
end

function WeaponDraftMenu( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "WeaponDraftMenu"
	local f5_local1 = controller and controller.controllerIndex
	if not f5_local1 and not Engine.InFrontend() then
		f5_local1 = self:getRootController()
	end
	assert( f5_local1 )
	self:playSound( "menu_open" )
	local f5_local2 = self
	local Blur = nil
	
	Blur = LUI.UIBlur.new()
	Blur.id = "Blur"
	Blur:SetBlurStrength( 2, 0 )
	self:addElement( Blur )
	self.Blur = Blur
	
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f5_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local SocialFeed = nil
	
	SocialFeed = MenuBuilder.BuildRegisteredType( "SocialFeed", {
		controllerIndex = f5_local1
	} )
	SocialFeed.id = "SocialFeed"
	SocialFeed:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -115, _1080p * -85 )
	self:addElement( SocialFeed )
	self.SocialFeed = SocialFeed
	
	local MenuTitle = nil
	
	MenuTitle = MenuBuilder.BuildRegisteredType( "MenuTitle", {
		controllerIndex = f5_local1
	} )
	MenuTitle.id = "MenuTitle"
	MenuTitle.MenuTitle:setText( Engine.Localize( "MP_FRONTEND_ONLY_WEAPON_DRAFT_CAPS" ), 0 )
	MenuTitle.MenuBreadcrumbs:setText( "", 0 )
	MenuTitle.Icon:SetTop( _1080p * -28.5, 0 )
	MenuTitle.Icon:SetBottom( _1080p * 61.5, 0 )
	MenuTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
	self:addElement( MenuTitle )
	self.MenuTitle = MenuTitle
	
	local LoadoutDraftTimer = nil
	
	LoadoutDraftTimer = MenuBuilder.BuildRegisteredType( "LoadoutDraftTimer", {
		controllerIndex = f5_local1
	} )
	LoadoutDraftTimer.id = "LoadoutDraftTimer"
	LoadoutDraftTimer:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -150, _1080p * 150, 0, _1080p * 64 )
	self:addElement( LoadoutDraftTimer )
	self.LoadoutDraftTimer = LoadoutDraftTimer
	
	local TeamBackground = nil
	
	TeamBackground = MenuBuilder.BuildRegisteredType( "LoadoutDraftTeamBG", {
		controllerIndex = f5_local1
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
		controllerIndex = f5_local1
	} )
	GameModeHeader.id = "GameModeHeader"
	GameModeHeader:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -608, _1080p * -96, _1080p * 55, _1080p * 125 )
	self:addElement( GameModeHeader )
	self.GameModeHeader = GameModeHeader
	
	local VerticalDividerLeft1 = nil
	
	VerticalDividerLeft1 = MenuBuilder.BuildRegisteredType( "LoadoutDraftCategoryAccent", {
		controllerIndex = f5_local1
	} )
	VerticalDividerLeft1.id = "VerticalDividerLeft1"
	VerticalDividerLeft1.Label:setText( Engine.Localize( "ALIENS_ABILITIES_CAPS" ), 0 )
	VerticalDividerLeft1:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -130, _1080p * -100, _1080p * 300, _1080p * 935 )
	self:addElement( VerticalDividerLeft1 )
	self.VerticalDividerLeft1 = VerticalDividerLeft1
	
	local VerticalDividerLeft2 = nil
	
	VerticalDividerLeft2 = MenuBuilder.BuildRegisteredType( "LoadoutDraftCategoryAccent", {
		controllerIndex = f5_local1
	} )
	VerticalDividerLeft2.id = "VerticalDividerLeft2"
	VerticalDividerLeft2.Label:setText( ToUpperCase( Engine.Localize( "CHALLENGE_CATEGORY_RIGS" ) ), 0 )
	VerticalDividerLeft2:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -485, _1080p * -455, _1080p * 300, _1080p * 935 )
	self:addElement( VerticalDividerLeft2 )
	self.VerticalDividerLeft2 = VerticalDividerLeft2
	
	local VerticalDividerRight1 = nil
	
	VerticalDividerRight1 = MenuBuilder.BuildRegisteredType( "LoadoutDraftCategoryAccentFlipped", {
		controllerIndex = f5_local1
	} )
	VerticalDividerRight1.id = "VerticalDividerRight1"
	VerticalDividerRight1.Label:setText( Engine.Localize( "ALIENS_ABILITIES_CAPS" ), 0 )
	VerticalDividerRight1:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 100, _1080p * 130, _1080p * 300, _1080p * 935 )
	self:addElement( VerticalDividerRight1 )
	self.VerticalDividerRight1 = VerticalDividerRight1
	
	local VerticalDividerRight2 = nil
	
	VerticalDividerRight2 = MenuBuilder.BuildRegisteredType( "LoadoutDraftCategoryAccentFlipped", {
		controllerIndex = f5_local1
	} )
	VerticalDividerRight2.id = "VerticalDividerRight2"
	VerticalDividerRight2.Label:setText( ToUpperCase( Engine.Localize( "CHALLENGE_CATEGORY_RIGS" ) ), 0 )
	VerticalDividerRight2:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 455, _1080p * 485, _1080p * 300, _1080p * 935 )
	self:addElement( VerticalDividerRight2 )
	self.VerticalDividerRight2 = VerticalDividerRight2
	
	self.addButtonHelperFunction = function ( f6_arg0, f6_arg1 )
		f6_arg0:AddButtonHelperText( {
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
	
	f0_local1( self, f5_local1, controller )
	return self
end

MenuBuilder.registerType( "WeaponDraftMenu", WeaponDraftMenu )
LockTable( _M )
