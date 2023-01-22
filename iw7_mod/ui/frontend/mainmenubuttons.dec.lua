local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ()
	Engine.SetDvarBool( "onlinegame", false )
	Engine.SetDvarBool( "systemlink", false )
	Engine.SetDvarBool( "splitscreen", false )
	Engine.SetDvarBool( "xblive_privatematch", false )
	DebugPrint( "MainMenuButtons - ResetDvars" )
	Engine.SetDvarBool( "ui_opensummary", false )
end

f0_local1 = function ( f2_arg0 )
	assert( f2_arg0 )
	Engine.DisableSplitscreenControls( "Pressed a Main Menu button", f2_arg0 )
end

f0_local2 = function ( f3_arg0, f3_arg1, f3_arg2 )
	assert( f3_arg0.CampaignButton )
	assert( f3_arg0.MultiplayerButton )
	assert( f3_arg0.ZombiesButton )
	f3_arg0.ButtonDescription:setPriority( 1 )
	f3_arg0.CampaignButton:processEvent( {
		name = "ignore_game_mode_layout",
		controller = f3_arg1
	} )
	f3_arg0.CampaignButton:addEventHandler( "button_action", function ( f4_arg0, f4_arg1 )
		f0_local1( f4_arg1.controller )
		LUI.FlowManager.RequestAddMenu( "CampaignMenu", true, f4_arg1.controller, false, false, false )
	end )
	f3_arg0.MultiplayerButton:processEvent( {
		name = "ignore_game_mode_layout",
		controller = f3_arg1
	} )
	f3_arg0.ZombiesButton:processEvent( {
		name = "ignore_game_mode_layout",
		controller = f3_arg1
	} )
	f3_arg0.MultiplayerButton:addEventHandler( "button_action", function ( f5_arg0, f5_arg1 )
		f0_local0()
		f0_local1( f5_arg1.controller )
		LUI.FlowManager.RequestAddMenu( "MPMainMenu", false, f5_arg1.controller, false, false )
	end )
	f3_arg0.ZombiesButton:addEventHandler( "button_action", function ( f6_arg0, f6_arg1 )
		f0_local0()
		f0_local1( f6_arg1.controller )
		LUI.FlowManager.RequestAddMenu( "CPMainMenu", false, f6_arg1.controller, false, false )
	end )
	if not CONDITIONS.IsPC( f3_arg0 ) then
		f3_arg0.LocalButton:processEvent( {
			name = "ignore_game_mode_layout",
			controller = f3_arg1
		} )
		f3_arg0.LocalButton:addEventHandler( "button_action", function ( f7_arg0, f7_arg1 )
			f0_local0()
			f0_local1( f7_arg1.controller )
			LUI.FlowManager.RequestPopupMenu( f3_arg0, "ChooseLocalPlay", false, f7_arg1.controller )
		end )
		if Engine.IsTrialLicense() then
			f3_arg0.LocalButton:SetButtonDisabled( true )
		end
	end
	if CONDITIONS.IsStoreAllowed( f3_arg0 ) then
		f3_arg0.StoreButton:processEvent( {
			name = "ignore_game_mode_layout",
			controller = f3_arg1
		} )
		f3_arg0.StoreButton:addEventHandler( "button_action", function ( f8_arg0, f8_arg1 )
			f0_local1( f8_arg1.controller )
			if Engine.IsTURequired() then
				CheckTURequirement( f8_arg0, f8_arg1.controller )
			else
				f0_local0()
				local f8_local0 = STORE.GoToStoreFromMainMenu
				local f8_local1 = f8_arg1.controller
				local f8_local2 = f8_arg0:GetCurrentMenu()
				f8_local0( f8_local1, f8_local2.id, f8_arg0.id )
			end
		end )
	end
	if Engine.IsConsoleGame() and not CONDITIONS.IsTrialLicense() then
		local f3_local0 = LUI.DataSourceInGlobalModel.new( "alwaysLoaded.hasMWR" )
		f3_arg0:SubscribeToModel( f3_local0:GetModel( f3_arg1 ), function ()
			if f3_local0:GetValue( f3_arg1 ) == true and f3_arg0.MWRButton == nil then
				local MWRButton = nil
				MWRButton = MenuBuilder.BuildRegisteredType( "MenuButton", {
					controllerIndex = f3_arg1
				} )
				MWRButton.id = "MWRButton"
				if Upsell.ButtonType( f3_arg1 ) == 0 then
					MWRButton.buttonDescription = Engine.Localize( "LUA_MENU_REMASTERED_DESC" )
					MWRButton.Text:setText( ToUpperCase( Engine.Localize( "LUA_MENU_REMASTERED_CAPS" ) ), 0 )
				else
					MWRButton.buttonDescription = Engine.Localize( "LUA_MENU_REMASTERED_UPSELL_DESC" )
					MWRButton.Text:setText( ToUpperCase( Engine.Localize( "LUA_MENU_REMASTERED_CAPS" ) ), 0 )
				end
				MWRButton:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, _1080p * 200, _1080p * 230 )
				f3_arg0:addElement( MWRButton )
				f3_arg0.MWRButton = MWRButton
				
				f3_arg0.MWRButton:addEventHandler( "button_action", function ( f10_arg0, f10_arg1 )
					Upsell.DoAction( f3_arg1 )
				end )
				f3_arg0.MWRButton:processEvent( {
					name = "ignore_game_mode_layout",
					controller = f3_arg1
				} )
				local f9_local1 = nil
				f9_local1 = MenuBuilder.BuildRegisteredType( "NewItemNotification", {
					controllerIndex = f3_arg1
				} )
				f9_local1.id = "NewItemNotification"
				if Upsell.ButtonType( f3_arg1 ) == 0 then
					f9_local1:SetAlpha( 0, 0 )
				else
					f9_local1:SetAlpha( 1, 0 )
				end
				f9_local1:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 436, _1080p * 0, _1080p * -17, _1080p * 47 )
				f3_arg0.MWRButton:addElement( f9_local1 )
				f3_arg0.NewItemNotification = f9_local1
				f3_arg0.NewItemNotification:processEvent( {
					name = "ignore_game_mode_layout",
					controller = f3_arg1
				} )
			elseif f3_arg0.MWRButton ~= nil then
				f3_arg0.MWRButton:closeTree()
				f3_arg0.MWRButton = nil
				f3_arg0.NewItemNotification:closeTree()
				f3_arg0.NewItemNotification = nil
			end
		end )
	end
	if f3_arg0.StoreButton then
		f3_arg0.StoreButton:SetButtonDescription( STORE.GetStoreDescription() )
		if CONDITIONS.IsTrialLicense() then
			f3_arg0.StoreButton.Text:setText( ToUpperCase( Engine.Localize( "LUA_MENU_BUY_NOW" ) ) )
		end
	end
end

function MainMenuButtons( menu, controller )
	local self = LUI.UIVerticalList.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 500 * _1080p, 0, 440 * _1080p )
	self.id = "MainMenuButtons"
	local f11_local1 = controller and controller.controllerIndex
	if not f11_local1 and not Engine.InFrontend() then
		f11_local1 = self:getRootController()
	end
	assert( f11_local1 )
	local f11_local2 = self
	self:SetSpacing( 10 * _1080p )
	local CampaignButton = nil
	
	CampaignButton = MenuBuilder.BuildRegisteredType( "MenuButton", {
		controllerIndex = f11_local1
	} )
	CampaignButton.id = "CampaignButton"
	CampaignButton.buttonDescription = Engine.Localize( "LUA_MENU_CAMPAIGN_DESC" )
	CampaignButton.Text:setText( Engine.Localize( "MENU_SP_CAMPAIGN" ), 0 )
	CampaignButton:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, 0, _1080p * 30 )
	self:addElement( CampaignButton )
	self.CampaignButton = CampaignButton
	
	local MultiplayerButton = nil
	
	MultiplayerButton = MenuBuilder.BuildRegisteredType( "MenuButton", {
		controllerIndex = f11_local1
	} )
	MultiplayerButton.id = "MultiplayerButton"
	MultiplayerButton.buttonDescription = Engine.Localize( "MENU_SP_DESC_MULTIPLAYER" )
	MultiplayerButton.Text:setText( Engine.Localize( "LUA_MENU_MULTIPLAYER_CAPS" ), 0 )
	MultiplayerButton:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, _1080p * 40, _1080p * 70 )
	self:addElement( MultiplayerButton )
	self.MultiplayerButton = MultiplayerButton
	
	local ZombiesButton = nil
	
	ZombiesButton = MenuBuilder.BuildRegisteredType( "MenuButton", {
		controllerIndex = f11_local1
	} )
	ZombiesButton.id = "ZombiesButton"
	ZombiesButton.buttonDescription = Engine.Localize( "LUA_MENU_ALIENS_MAIN_MENU_DESC" )
	ZombiesButton.Text:setText( Engine.Localize( "LUA_MENU_ALIENS_CAPS" ), 0 )
	ZombiesButton:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 80, _1080p * 110 )
	self:addElement( ZombiesButton )
	self.ZombiesButton = ZombiesButton
	
	local f11_local6 = nil
	if not CONDITIONS.IsPC( self ) then
		f11_local6 = MenuBuilder.BuildRegisteredType( "MenuButton", {
			controllerIndex = f11_local1
		} )
		f11_local6.id = "LocalButton"
		if not CONDITIONS.IsPC( self ) then
			
		else
			
		end
		if not CONDITIONS.IsPC( self ) then
			f11_local6.buttonDescription = Engine.Localize( "LUA_MENU_LAN_PLAY_DESC" )
		end
		f11_local6.Text:setText( Engine.Localize( "LUA_MENU_LOCAL_PLAY_CAPS" ), 0 )
		f11_local6:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, _1080p * 120, _1080p * 150 )
		self:addElement( f11_local6 )
		self.LocalButton = f11_local6
	end
	local f11_local7 = nil
	if CONDITIONS.IsStoreAllowed( self ) then
		f11_local7 = MenuBuilder.BuildRegisteredType( "MenuButton", {
			controllerIndex = f11_local1
		} )
		f11_local7.id = "StoreButton"
		if CONDITIONS.IsStoreAllowed( self ) then
			
		else
			
		end
		if CONDITIONS.IsStoreAllowed( self ) then
			f11_local7.buttonDescription = Engine.Localize( "LUA_MENU_STORE_DESC" )
		end
		f11_local7.Text:setText( ToUpperCase( Engine.Localize( "LUA_MENU_STORE_CAPS" ) ), 0 )
		f11_local7:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, _1080p * 160, _1080p * 190 )
		self:addElement( f11_local7 )
		self.StoreButton = f11_local7
	end
	local ButtonDescription = nil
	
	ButtonDescription = MenuBuilder.BuildRegisteredType( "ButtonDescriptionText", {
		controllerIndex = f11_local1
	} )
	ButtonDescription.id = "ButtonDescription"
	ButtonDescription.Description:SetRight( _1080p * 415, 0 )
	ButtonDescription:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 504, _1080p * 200, _1080p * 300 )
	self:addElement( ButtonDescription )
	self.ButtonDescription = ButtonDescription
	
	f0_local2( self, f11_local1, controller )
	return self
end

MenuBuilder.registerType( "MainMenuButtons", MainMenuButtons )
LockTable( _M )
