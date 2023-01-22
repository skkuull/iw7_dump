local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = 40
f0_local1 = 10
f0_local2 = function ( f1_arg0, f1_arg1, f1_arg2 )
	if 0 < f1_arg2 then
		local f1_local0, f1_local1, f1_local2, f1_local3 = f1_arg0:getLocalRect()
		local f1_local4 = f1_local3 - f1_local1
		f1_arg0:SetTop( f1_local1 - (f1_local4 + f1_arg1) * f1_arg2 )
		f1_arg0:SetBottom( f1_local3 - (f1_local4 + f1_arg1) * f1_arg2 )
	end
end

local f0_local3 = function ( f2_arg0, f2_arg1, f2_arg2 )
	assert( f2_arg0.ConquestButton )
	if CONDITIONS.IsStoreAllowed( f2_arg0 ) then
		assert( f2_arg0.StoreButton )
	end
	assert( f2_arg0.CODTvButton )
	local f2_local0 = not CONDITIONS.IsTrialLicense( f2_arg0 )
	if f2_local0 then
		assert( f2_arg0.CustomGameButton )
	end
	f2_arg0.buttonSpacing = _1080p * f0_local0
	local f2_local1 = function ()
		return Lobby.IsInPrivateParty() and not Lobby.IsPrivatePartyHost()
	end
	
	local f2_local2 = function ()
		local f4_local0 = f2_local1()
		f2_arg0.ConquestButton:SetButtonDisabled( f4_local0 )
		if f2_arg0.MLGGameBattlesButton ~= nil then
			f2_arg0.MLGGameBattlesButton:SetButtonDisabled( f4_local0 )
		end
		if f2_local0 then
			f2_arg0.CustomGameButton:SetButtonDisabled( f4_local0 )
		end
	end
	
	local f2_local3 = LUI.DataSourceInGlobalModel.new( "frontEnd.lobby.areWeGameHost" )
	local f2_local4 = DataSources.frontEnd.lobby.memberCount
	f2_arg0:SubscribeToModel( f2_local3:GetModel( f2_arg1 ), f2_local2 )
	f2_arg0:SubscribeToModel( f2_local4:GetModel( f2_arg1 ), f2_local2 )
	f2_arg0.ConquestButton:addEventHandler( "button_action", function ( f5_arg0, f5_arg1 )
		Engine.SetDvarBool( "cg_mlg_gamebattles_match", false )
		local f5_local0 = function ()
			LUI.FlowManager.RequestAddMenu( "Missions", false, f5_arg1.controller, false, {}, true )
		end
		
		if not Onboarding:BeginFlow( Onboarding.RigTutorial, f2_arg1 ) then
			f5_local0()
		else
			LUI.FlowManager.RequestPopupMenu( nil, "MPFullScreenVideoOverlay", true, f2_arg1, nil, {
				videoRef = "mp_wolverines_mission_commander",
				allowSkip = true,
				doIntroFadeOut = false,
				doIntroFadeIn = false,
				doOutroFadeIn = true,
				doOutroFadeOut = true,
				fadeColor = COLORS.black
			}, nil, true, true )
			local f5_local1 = f2_arg0:Wait( 500 )
			f5_local1.onComplete = f5_local0
		end
	end )
	if CONDITIONS.IsGameBattlesAllowed( f2_arg0 ) then
		f2_arg0.MLGGameBattlesButton:addEventHandler( "button_action", function ( f7_arg0, f7_arg1 )
			if Engine.GetDvarBool( "splitscreen" ) then
				LUI.FlowManager.RequestPopupMenu( f2_arg0, "MLGGamebattlesSplitscreenPopup", true, f7_arg1.controller, false, {
					controllerIndex = f2_arg1
				} )
			elseif Lobby.IsNotAloneInPrivateParty() then
				LUI.FlowManager.RequestPopupMenu( f2_arg0, "DisbandPartyEnterGameBattlesLobbyPopup", true, f7_arg1.controller, false, {
					controllerIndex = f2_arg1
				} )
			else
				OpenGameBattlesLobby( f7_arg1.controller )
			end
		end )
	end
	if f2_local0 then
		f2_arg0.CustomGameButton:addEventHandler( "button_action", function ( f8_arg0, f8_arg1 )
			OpenPrivateMatchLobby( f8_arg1 )
		end )
	end
	if CONDITIONS.IsStoreAllowed( f2_arg0 ) then
		f2_arg0.StoreButton:addEventHandler( "button_action", function ( f9_arg0, f9_arg1 )
			local f9_local0 = STORE.GoToStore
			local f9_local1 = f9_arg1.controller
			local f9_local2 = f9_arg0:GetCurrentMenu()
			f9_local0( f9_local1, f9_local2.id, f9_arg0.id )
		end )
	end
	if CODTV.IsCODTVEnabled() then
		f2_arg0.CODTvButton:addEventHandler( "button_action", function ( f10_arg0, f10_arg1 )
			LUI.FlowManager.RequestAddMenu( "CODTvMenu", true, f10_arg1.controller, false )
		end )
	else
		f2_arg0:removeElement( f2_arg0.CODTvButton )
		f2_arg0.CODTvButton = nil
	end
	local f2_local5 = _1080p * f0_local1
	local f2_local6 = 0
	if f2_arg0.MLGGameBattlesButton == nil then
		f2_local6 = 1
	end
	if f2_arg0.CustomGameButton then
		f0_local2( f2_arg0.CustomGameButton, f2_local5, f2_local6 )
	else
		f2_local6 = f2_local6 + 1
	end
	if CONDITIONS.IsStoreAllowed( f2_arg0 ) then
		f0_local2( f2_arg0.StoreButton, f2_local5, f2_local6 )
	else
		f2_local6 = f2_local6 + 1
	end
	if f2_arg0.StoreButton then
		f2_arg0.StoreButton:SetButtonDescription( STORE.GetStoreDescription() )
		if CONDITIONS.IsTrialLicense() then
			f2_arg0.StoreButton.Text:setText( ToUpperCase( Engine.Localize( "LUA_MENU_BUY_NOW" ) ) )
		end
	end
	if f2_arg0.CODTvButton ~= nil then
		f0_local2( f2_arg0.CODTvButton, f2_local5, f2_local6 )
	end
end

function MPMainMenuButtons( menu, controller )
	local self = LUI.UIVerticalNavigator.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 500 * _1080p, 0, 190 * _1080p )
	self.id = "MPMainMenuButtons"
	local f11_local1 = controller and controller.controllerIndex
	if not f11_local1 and not Engine.InFrontend() then
		f11_local1 = self:getRootController()
	end
	assert( f11_local1 )
	local f11_local2 = self
	local ConquestButton = nil
	
	ConquestButton = MenuBuilder.BuildRegisteredType( "MenuButton", {
		controllerIndex = f11_local1
	} )
	ConquestButton.id = "ConquestButton"
	ConquestButton.buttonDescription = Engine.Localize( "LUA_MENU_PUBLIC_MATCH_DESC" )
	ConquestButton.Text:setText( Engine.Localize( "LUA_MENU_PUBLIC_MATCH_CAPS" ), 0 )
	ConquestButton:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, 0, _1080p * 30 )
	self:addElement( ConquestButton )
	self.ConquestButton = ConquestButton
	
	local f11_local4 = nil
	if CONDITIONS.IsGameBattlesAllowed( self ) then
		f11_local4 = MenuBuilder.BuildRegisteredType( "MenuButton", {
			controllerIndex = f11_local1
		} )
		f11_local4.id = "MLGGameBattlesButton"
		if CONDITIONS.IsGameBattlesAllowed( self ) then
			
		else
			
		end
		if CONDITIONS.IsGameBattlesAllowed( self ) then
			f11_local4.buttonDescription = Engine.Localize( "LUA_MENU_MLG_GAMEBATTLES_DESC" )
		end
		f11_local4.Text:setText( Engine.Localize( "LUA_MENU_MLG_GAMEBATTLES_CAPS" ), 0 )
		f11_local4:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, _1080p * 40, _1080p * 70 )
		self:addElement( f11_local4 )
		self.MLGGameBattlesButton = f11_local4
	end
	local f11_local5 = nil
	if not CONDITIONS.IsTrialLicense( self ) then
		f11_local5 = MenuBuilder.BuildRegisteredType( "MenuButton", {
			controllerIndex = f11_local1
		} )
		f11_local5.id = "CustomGameButton"
		if not CONDITIONS.IsTrialLicense( self ) then
			
		else
			
		end
		if not CONDITIONS.IsTrialLicense( self ) then
			f11_local5.buttonDescription = Engine.Localize( "LUA_MENU_CUSTOM_GAME_DESC" )
		end
		f11_local5.Text:setText( Engine.Localize( "LUA_MENU_CUSTOM_GAME_CAPS" ), 0 )
		f11_local5:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, _1080p * 80, _1080p * 110 )
		self:addElement( f11_local5 )
		self.CustomGameButton = f11_local5
	end
	local f11_local6 = nil
	if CONDITIONS.IsStoreAllowed( self ) then
		f11_local6 = MenuBuilder.BuildRegisteredType( "MenuButton", {
			controllerIndex = f11_local1
		} )
		f11_local6.id = "StoreButton"
		if CONDITIONS.IsStoreAllowed( self ) then
			
		else
			
		end
		if CONDITIONS.IsStoreAllowed( self ) then
			f11_local6.buttonDescription = Engine.Localize( "LUA_MENU_STORE_DESC" )
		end
		f11_local6.Text:setText( Engine.Localize( "LUA_MENU_STORE_CAPS" ), 0 )
		f11_local6:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, _1080p * 120, _1080p * 150 )
		self:addElement( f11_local6 )
		self.StoreButton = f11_local6
	end
	local CODTvButton = nil
	
	CODTvButton = MenuBuilder.BuildRegisteredType( "MPMainMenuCODTvButton", {
		controllerIndex = f11_local1
	} )
	CODTvButton.id = "CODTvButton"
	CODTvButton:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, _1080p * 160, _1080p * 190 )
	self:addElement( CODTvButton )
	self.CODTvButton = CODTvButton
	
	local CRMMain = nil
	
	CRMMain = MenuBuilder.BuildRegisteredType( "CRMMain", {
		controllerIndex = f11_local1
	} )
	CRMMain.id = "CRMMain"
	CRMMain:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 6, _1080p * 317, _1080p * 385, _1080p * 579 )
	self:addElement( CRMMain )
	self.CRMMain = CRMMain
	
	f0_local3( self, f11_local1, controller )
	return self
end

MenuBuilder.registerType( "MPMainMenuButtons", MPMainMenuButtons )
LockTable( _M )
