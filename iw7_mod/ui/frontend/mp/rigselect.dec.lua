local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "frontEnd.MP.CAC.rigSelect"
f0_local1 = "frontEnd.MP.CAC.rig"
f0_local2 = function ()
	Streaming.SetStreamingEnabled( false )
	WipeGlobalModelsAtPath( f0_local0 )
	WipeGlobalModelsAtPath( f0_local1 )
end

local f0_local3 = function ( f2_arg0, f2_arg1, f2_arg2 )
	assert( f2_arg2 )
	assert( f2_arg0.RigItems )
	if Engine.IsDevelopmentBuild() and not f2_arg2.squadMemberDataSource then
		DebugPrint( "WARNING: Missing \"statsGroupDataSource\" option for RigSelect menu. Only OK after a MyChanges." )
		f2_arg2.squadMemberDataSource = DataSources.alwaysLoaded.playerData.MP.privateloadouts.squadMembers
	end
	assert( f2_arg2.squadMemberDataSource )
	FrontEndScene.SetScene( "rig_select" )
	f2_arg0.statsGroupDataSource = GetCACPlayerDataDataSource( f2_arg2.squadMemberDataSource )
	f2_arg0.squadMemberDataSource = f2_arg0.statsGroupDataSource.statsGroup
	f2_arg0.rigDataSource = f2_arg0.statsGroupDataSource.rig
	f2_arg0.XUID = f2_arg2.XUID
	f2_arg0.RigItems.XUID = f2_arg2.XUID
	f2_arg0:SetDataSource( f2_arg0.rigDataSource, f2_arg1 )
	Streaming.SetStreamingEnabled( true )
	local f2_local0 = f2_arg0.rigDataSource.rigRef:GetValue( f2_arg1 )
	assert( f2_local0 and #f2_local0 > 0 )
	FrontEndScene.SetCustomizationWeaponForSuper( FrontEndScene.ClientCharacters.Customization, f2_arg0.squadMemberDataSource.archetypeSuper:GetValue( f2_arg1 ), f2_local0 )
	f2_arg0.decoratedRigs = Cac.GetRigSelectDataSources( f0_local0, f2_arg0.rigDataSource, f2_arg0.squadMemberDataSource, f2_arg1 )
	local f2_local1 = f2_arg0.decoratedRigs:GetDataSourceAtIndex( Cac.GetRigIndex( f2_local0 ) )
	f2_arg0.selectedRig = f2_local1.rig
	FrontEndScene.SetCharacterToRig( FrontEndScene.ClientCharacters.Customization, f2_local0, f2_arg0.squadMemberDataSource.archetypePreferences, f2_arg1 )
	FrontEndScene.SetCharacterVisible( FrontEndScene.ClientCharacters.Customization, true )
	FrontEndScene.PlayCustomizationIdle( FrontEndScene.ClientCharacters.Customization, f2_local0 )
	local f2_local2 = MenuBuilder.BuildRegisteredType( "LobbyStatus", {
		controllerIndex = f2_arg1
	} )
	f2_local2:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -800, _1080p * -40, _1080p * -114, _1080p * -80 )
	f2_local2:Minimize()
	f2_arg0:addElement( f2_local2 )
	f2_arg0.MenuTitle.MenuBreadcrumbs:setText( CoD.GetBreadcrumbCreateAClass(), 0 )
	Onboarding:ApplyWhitelist( "RigSelect", f2_arg0 )
	assert( f2_arg0.CommanderMessageListener )
	f2_arg0:addEventHandler( "gain_focus", function ( f3_arg0, f3_arg1 )
		if Onboarding:AdvanceFlow( Onboarding.RigTutorial, "LOADOUT_HINT" ) then
			f3_arg0.CommanderMessageListener:processEvent( {
				name = "show_commander_message",
				eventID = "onboarding_pick_loadout"
			} )
		end
	end )
	f2_arg0:addElement( Cac.GetRigSuperStreamer() )
	if f2_arg0.XUID then
		f2_arg0:addEventHandler( "menu_close", function ( f4_arg0, f4_arg1 )
			ACTIONS.UploadStats( f4_arg0, f2_arg1 )
		end )
	end
	if CONDITIONS.IsDraftEnabled( f2_arg0 ) then
		assert( f2_arg0.LoadoutDraftTimer )
		Cac.SetupLoadoutDraftTimerRefresh( f2_arg0.LoadoutDraftTimer )
	end
	assert( f2_arg0.CharacterRotator )
	f2_arg0.CharacterRotator:SetClientCharacterIndex( FrontEndScene.ClientCharacters.Customization )
	if Engine.IsConsoleGame() and not Engine.GetDvarBool( "killswitch_character_rotation" ) then
		f2_arg0:AddButtonHelperTextToElement( f2_arg0, {
			helper_text = Engine.Localize( "LUA_MENU_ROTATE" ),
			button_ref = "button_stickr_updown_noswap",
			priority = 10,
			side = "left",
			clickable = false
		} )
	end
end

function RigSelect( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "RigSelect"
	local f5_local1 = controller and controller.controllerIndex
	if not f5_local1 and not Engine.InFrontend() then
		f5_local1 = self:getRootController()
	end
	assert( f5_local1 )
	self:playSound( "menu_open" )
	local f5_local2 = self
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f5_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local MenuTitle = nil
	
	MenuTitle = MenuBuilder.BuildRegisteredType( "MenuTitle", {
		controllerIndex = f5_local1
	} )
	MenuTitle.id = "MenuTitle"
	MenuTitle.MenuTitle:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_RIG_OPTIONS" ) ), 0 )
	MenuTitle.MenuBreadcrumbs:setText( ToUpperCase( Engine.Localize( "MENU_MULTIPLAYER" ) ), 0 )
	MenuTitle.Icon:SetTop( _1080p * -28.5, 0 )
	MenuTitle.Icon:SetBottom( _1080p * 61.5, 0 )
	MenuTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
	self:addElement( MenuTitle )
	self.MenuTitle = MenuTitle
	
	local RigInfo = nil
	
	RigInfo = MenuBuilder.BuildRegisteredType( "RigInfo", {
		controllerIndex = f5_local1
	} )
	RigInfo.id = "RigInfo"
	RigInfo:SetDataSourceThroughElement( self, nil )
	RigInfo.RigDescription:SetRGBFromInt( 16777215, 0 )
	RigInfo:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -950, 0, _1080p * -287, _1080p * -147 )
	self:addElement( RigInfo )
	self.RigInfo = RigInfo
	
	local RigItems = nil
	
	RigItems = MenuBuilder.BuildRegisteredType( "RigItems", {
		controllerIndex = f5_local1
	} )
	RigItems.id = "RigItems"
	RigItems:SetDataSourceThroughElement( self, nil )
	RigItems:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 556, _1080p * 216, _1080p * 570 )
	self:addElement( RigItems )
	self.RigItems = RigItems
	
	local SocialFeed = nil
	
	SocialFeed = MenuBuilder.BuildRegisteredType( "SocialFeed", {
		controllerIndex = f5_local1
	} )
	SocialFeed.id = "SocialFeed"
	SocialFeed:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -115, _1080p * -85 )
	self:addElement( SocialFeed )
	self.SocialFeed = SocialFeed
	
	local CommanderMessageListener = nil
	
	CommanderMessageListener = MenuBuilder.BuildRegisteredType( "CommanderMessageListener", {
		controllerIndex = f5_local1
	} )
	CommanderMessageListener.id = "CommanderMessageListener"
	CommanderMessageListener:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -700, 0, _1080p * 57, _1080p * 225 )
	self:addElement( CommanderMessageListener )
	self.CommanderMessageListener = CommanderMessageListener
	
	local f5_local9 = nil
	if CONDITIONS.IsPublicMatch( self ) then
		f5_local9 = MenuBuilder.BuildRegisteredType( "CRMMain", {
			controllerIndex = f5_local1
		} )
		f5_local9.id = "CRMMain"
		f5_local9:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 136, _1080p * 447, _1080p * 745, _1080p * 1069 )
		self:addElement( f5_local9 )
		self.CRMMain = f5_local9
	end
	local f5_local10 = nil
	if CONDITIONS.IsDraftEnabled( self ) then
		f5_local10 = MenuBuilder.BuildRegisteredType( "LoadoutDraftTimer", {
			controllerIndex = f5_local1
		} )
		f5_local10.id = "LoadoutDraftTimer"
		f5_local10:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -150, _1080p * 150, 0, _1080p * 64 )
		self:addElement( f5_local10 )
		self.LoadoutDraftTimer = f5_local10
	end
	local CharacterRotator = nil
	
	CharacterRotator = MenuBuilder.BuildRegisteredType( "CharacterRotator", {
		controllerIndex = f5_local1
	} )
	CharacterRotator.id = "CharacterRotator"
	CharacterRotator:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 710, _1080p * 1824, _1080p * 216, _1080p * 761 )
	self:addElement( CharacterRotator )
	self.CharacterRotator = CharacterRotator
	
	RigInfo:SetDataSourceThroughElement( self, nil )
	RigItems:SetDataSourceThroughElement( self, nil )
	self.addButtonHelperFunction = function ( f6_arg0, f6_arg1 )
		f6_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			clickable = true
		} )
		f6_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_SELECT" ),
			button_ref = "button_primary",
			side = "left",
			priority = -1,
			clickable = true
		} )
	end
	
	self:addEventHandler( "menu_create", self.addButtonHelperFunction )
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	self.bindButton:addEventHandler( "button_secondary", function ( f7_arg0, f7_arg1 )
		local f7_local0 = f7_arg1.controller or f5_local1
		ACTIONS.LeaveMenu( self )
	end )
	f0_local3( self, f5_local1, controller )
	if CONDITIONS.IsPublicMatch( self ) then
		ACTIONS.AnimateSequenceByElement( self, {
			elementName = "CRMMain",
			sequenceName = "Minimize",
			elementPath = "CRMMain"
		} )
	end
	return self
end

MenuBuilder.registerType( "RigSelect", RigSelect )
LUI.FlowManager.RegisterStackPopBehaviour( "RigSelect", f0_local2 )
LockTable( _M )
