local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1 )
	Engine.Exec( "xblive_privatematch 0" )
	utils.cp.AliensUtils.AliensRunConfig( f1_arg1.controller )
	LUI.FlowManager.RequestAddMenu( "CPPlaylistMenu", true, f1_arg1.controller )
end

f0_local1 = function ( f2_arg0, f2_arg1 )
	if Lobby.EnteringLobby() == true then
		LUI.FlowManager.RequestPopupMenu( f2_arg0, "popup_throttling", true, f2_arg1.controller, false, {
			eventData = f2_arg1
		} )
	else
		f0_local0( f2_arg0, f2_arg1 )
	end
end

f0_local2 = function ( f3_arg0, f3_arg1 )
	Engine.Exec( MPConfig.default_xboxlive, f3_arg1.controller )
	Engine.SetDvarBool( "xblive_privatematch", true )
	SetIsAliensSolo( true )
	Engine.SetDvarInt( "party_maxplayers", 1 )
	Engine.Exec( "xstartprivatematch" )
	LUI.FlowManager.RequestAddMenu( "CPPrivateMatchMenu", false, f3_arg1.controller, false, {
		showPlayNowButton = true,
		isPublicMatch = false
	} )
end

local f0_local3 = function ( f4_arg0, f4_arg1 )
	Engine.Exec( MPConfig.default_xboxlive, f4_arg1.controller )
	Engine.SetDvarBool( "xblive_privatematch", true )
	SetIsAliensSolo( false )
	Engine.Exec( "xstartprivatematch" )
	LUI.FlowManager.RequestAddMenu( "CPPrivateMatchMenu", false, f4_arg1.controller, false, {
		showPlayNowButton = true,
		isPublicMatch = false
	} )
end

local f0_local4 = function ( f5_arg0, f5_arg1, f5_arg2 )
	assert( f5_arg0.PublicMatch )
	assert( f5_arg0.SoloMatch )
	assert( f5_arg0.CustomMatch )
	local f5_local0 = LUI.DataSourceInGlobalModel.new( "frontEnd.lobby.areWeGameHost" )
	local f5_local1 = DataSources.frontEnd.lobby.memberCount
	local f5_local2 = function ()
		return Lobby.IsInPrivateParty() and not Lobby.IsPrivatePartyHost()
	end
	
	local f5_local3 = function ()
		local f7_local0 = f5_local2()
		f5_arg0.PublicMatch:SetButtonDisabled( f7_local0 )
		f5_arg0.CustomMatch:SetButtonDisabled( f7_local0 )
	end
	
	f5_arg0:SubscribeToModel( f5_local0:GetModel( f5_arg1 ), f5_local3 )
	f5_arg0:SubscribeToModel( f5_local1:GetModel( f5_arg1 ), f5_local3 )
	f5_arg0:SubscribeToModel( DataSources.frontEnd.lobby.isSolo:GetModel( f5_arg1 ), function ()
		local f8_local0 = DataSources.frontEnd.lobby.isSolo:GetValue( f5_arg1 )
		if f8_local0 ~= nil then
			f5_arg0.SoloMatch:SetButtonDisabled( not f8_local0 )
		end
	end )
	f5_arg0.PublicMatch:addEventHandler( "button_action", f0_local1 )
	f5_arg0.SoloMatch:addEventHandler( "button_action", f0_local2 )
	f5_arg0.Loadout:addEventHandler( "button_action", function ( f9_arg0, f9_arg1 )
		LUI.FlowManager.RequestAddMenu( "CPLoadoutMenu", true, f9_arg1.controller )
	end )
	f5_arg0.Barracks:addEventHandler( "button_action", function ( f10_arg0, f10_arg1 )
		LUI.FlowManager.RequestAddMenu( "Headquarters", true, f10_arg1.controller )
	end )
	f5_arg0.Armory:addEventHandler( "button_action", function ( f11_arg0, f11_arg1 )
		if not Engine.IsUserAGuest( f11_arg1.controller ) then
			ACTIONS.OpenMenu( "Armory", true, f11_arg1.controller )
		end
	end )
	f5_arg0.CustomMatch:addEventHandler( "button_action", f0_local3 )
	f5_arg0.ContractsButton:addEventHandler( "button_action", function ( f12_arg0, f12_arg1 )
		ACTIONS.OpenMenu( "ContractMenu", true, f12_arg1.controller or f5_arg1 )
	end )
	if CONDITIONS.IsStoreAllowed( f5_arg0 ) then
		f5_arg0.StoreButton:addEventHandler( "button_action", function ( f13_arg0, f13_arg1 )
			local f13_local0 = STORE.GoToStore
			local f13_local1 = f13_arg1.controller
			local f13_local2 = f13_arg0:GetCurrentMenu()
			f13_local0( f13_local1, f13_local2.id, f13_arg0.id )
		end )
		f5_arg0.StoreButton:SetButtonDescription( STORE.GetStoreDescription() )
		if CONDITIONS.IsTrialLicense() then
			f5_arg0.StoreButton.Text:setText( ToUpperCase( Engine.Localize( "LUA_MENU_BUY_NOW" ) ) )
		end
	end
end

function CPMainMenuButtons( menu, controller )
	local self = LUI.UIVerticalNavigator.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 500 * _1080p, 0, 400 * _1080p )
	self.id = "CPMainMenuButtons"
	local f14_local1 = controller and controller.controllerIndex
	if not f14_local1 and not Engine.InFrontend() then
		f14_local1 = self:getRootController()
	end
	assert( f14_local1 )
	local f14_local2 = self
	local ButtonDescription = nil
	
	ButtonDescription = MenuBuilder.BuildRegisteredType( "ButtonDescriptionText", {
		controllerIndex = f14_local1
	} )
	ButtonDescription.id = "ButtonDescription"
	ButtonDescription:SetRGBFromTable( SWATCHES.genericButton.textDisabled, 0 )
	ButtonDescription.Description:SetRight( _1080p * 415, 0 )
	ButtonDescription:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 336, _1080p * 394 )
	self:addElement( ButtonDescription )
	self.ButtonDescription = ButtonDescription
	
	local PublicMatch = nil
	
	PublicMatch = MenuBuilder.BuildRegisteredType( "MenuButton", {
		controllerIndex = f14_local1
	} )
	PublicMatch.id = "PublicMatch"
	PublicMatch.buttonDescription = Engine.Localize( "LUA_MENU_ZM_PUBLIC_MATCH_DESC" )
	PublicMatch.Text:setText( ToUpperCase( Engine.Localize( "LUA_MENU_PUBLIC_MATCH_CAPS" ) ), 0 )
	PublicMatch:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 340, 0, _1080p * 30 )
	self:addElement( PublicMatch )
	self.PublicMatch = PublicMatch
	
	local SoloMatch = nil
	
	SoloMatch = MenuBuilder.BuildRegisteredType( "MenuButton", {
		controllerIndex = f14_local1
	} )
	SoloMatch.id = "SoloMatch"
	SoloMatch.buttonDescription = Engine.Localize( "LUA_MENU_ZM_SOLO_MATCH_DESC" )
	SoloMatch.Text:setText( ToUpperCase( Engine.Localize( "LUA_MENU_SOLO_MATCH_CAPS" ) ), 0 )
	SoloMatch:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 340, _1080p * 40, _1080p * 70 )
	self:addElement( SoloMatch )
	self.SoloMatch = SoloMatch
	
	local CustomMatch = nil
	
	CustomMatch = MenuBuilder.BuildRegisteredType( "MenuButton", {
		controllerIndex = f14_local1
	} )
	CustomMatch.id = "CustomMatch"
	CustomMatch.buttonDescription = Engine.Localize( "LUA_MENU_ZM_CUSTOM_MATCH_DESC" )
	CustomMatch.Text:setText( ToUpperCase( Engine.Localize( "LUA_MENU_CUSTOM_GAME_CAPS" ) ), 0 )
	CustomMatch:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 340, _1080p * 80, _1080p * 110 )
	self:addElement( CustomMatch )
	self.CustomMatch = CustomMatch
	
	local Loadout = nil
	
	Loadout = MenuBuilder.BuildRegisteredType( "MenuButton", {
		controllerIndex = f14_local1
	} )
	Loadout.id = "Loadout"
	Loadout.buttonDescription = Engine.Localize( "LUA_MENU_ZM_LOADOUT_DESC" )
	Loadout.Text:setText( Engine.Localize( "LUA_MENU_ZM_LOADOUT_CAPS" ), 0 )
	Loadout:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 340, _1080p * 120, _1080p * 150 )
	self:addElement( Loadout )
	self.Loadout = Loadout
	
	local Barracks = nil
	
	Barracks = MenuBuilder.BuildRegisteredType( "MenuButton", {
		controllerIndex = f14_local1
	} )
	Barracks.id = "Barracks"
	Barracks.buttonDescription = Engine.Localize( "LUA_MENU_ZM_BARRACKS_DESC" )
	Barracks.Text:setText( ToUpperCase( Engine.Localize( "LUA_MENU_ZM_BARRACKS_CAPS" ) ), 0 )
	Barracks:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 340, _1080p * 160, _1080p * 190 )
	self:addElement( Barracks )
	self.Barracks = Barracks
	
	local Armory = nil
	
	Armory = MenuBuilder.BuildRegisteredType( "MenuButton", {
		controllerIndex = f14_local1
	} )
	Armory.id = "Armory"
	Armory.buttonDescription = Engine.Localize( "LUA_MENU_ZM_SURVIVAL_DEPOT_DESC" )
	Armory.Text:setText( ToUpperCase( Engine.Localize( "LUA_MENU_ZM_SURVIVAL_DEPOT" ) ), 0 )
	Armory:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 340, _1080p * 200, _1080p * 230 )
	self:addElement( Armory )
	self.Armory = Armory
	
	local ContractsButton = nil
	
	ContractsButton = MenuBuilder.BuildRegisteredType( "ContractsButtonCP", {
		controllerIndex = f14_local1
	} )
	ContractsButton.id = "ContractsButton"
	ContractsButton:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 340, _1080p * 240, _1080p * 300 )
	self:addElement( ContractsButton )
	self.ContractsButton = ContractsButton
	
	local f14_local11 = nil
	if CONDITIONS.IsStoreAllowed( self ) then
		f14_local11 = MenuBuilder.BuildRegisteredType( "MenuButton", {
			controllerIndex = f14_local1
		} )
		f14_local11.id = "StoreButton"
		if CONDITIONS.IsStoreAllowed( self ) then
			
		else
			
		end
		if CONDITIONS.IsStoreAllowed( self ) then
			f14_local11.buttonDescription = Engine.Localize( "LUA_MENU_STORE_DESC" )
		end
		f14_local11.Text:setText( ToUpperCase( Engine.Localize( "LUA_MENU_STORE_CAPS" ) ), 0 )
		f14_local11:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 340, _1080p * 310, _1080p * 340 )
		self:addElement( f14_local11 )
		self.StoreButton = f14_local11
	end
	f0_local4( self, f14_local1, controller )
	return self
end

MenuBuilder.registerType( "CPMainMenuButtons", CPMainMenuButtons )
LockTable( _M )
