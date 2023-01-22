local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function SystemLinkMenuButtons( menu, controller )
	local self = LUI.UIVerticalList.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 500 * _1080p, 0, 300 * _1080p )
	self.id = "SystemLinkMenuButtons"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	self:SetSpacing( 10 * _1080p )
	local JoinGameButton = nil
	
	JoinGameButton = MenuBuilder.BuildRegisteredType( "MenuButton", {
		controllerIndex = f1_local1
	} )
	JoinGameButton.id = "JoinGameButton"
	JoinGameButton.buttonDescription = Engine.Localize( "LUA_MENU_DESC_JOIN_GAME" )
	JoinGameButton.Text:setText( ToUpperCase( Engine.Localize( "LUA_MENU_JOIN_GAME_CAPS" ) ), 0 )
	JoinGameButton:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, 0, _1080p * 30 )
	self:addElement( JoinGameButton )
	self.JoinGameButton = JoinGameButton
	
	local CreateGameButton = nil
	
	CreateGameButton = MenuBuilder.BuildRegisteredType( "MenuButton", {
		controllerIndex = f1_local1
	} )
	CreateGameButton.id = "CreateGameButton"
	CreateGameButton.buttonDescription = Engine.Localize( "LUA_MENU_DESC_CREATE_GAME" )
	CreateGameButton.Text:setText( ToUpperCase( Engine.Localize( "LUA_MENU_CREATE_GAME_CAPS" ) ), 0 )
	CreateGameButton:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, _1080p * 40, _1080p * 70 )
	self:addElement( CreateGameButton )
	self.CreateGameButton = CreateGameButton
	
	local f1_local5 = nil
	if CONDITIONS.IsCoreMultiplayer( self ) then
		f1_local5 = MenuBuilder.BuildRegisteredType( "MenuButton", {
			controllerIndex = f1_local1
		} )
		f1_local5.id = "CASButton"
		if CONDITIONS.IsCoreMultiplayer( self ) then
			
		else
			
		end
		if CONDITIONS.IsCoreMultiplayer( self ) then
			f1_local5.buttonDescription = Engine.Localize( "LUA_MENU_DESC_CREATE_A_CLASS" )
		end
		f1_local5.Text:setText( ToUpperCase( Engine.Localize( "LUA_MENU_CREATE_A_CLASS" ) ), 0 )
		f1_local5:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, _1080p * 80, _1080p * 110 )
		self:addElement( f1_local5 )
		self.CASButton = f1_local5
	end
	local f1_local6 = nil
	if CONDITIONS.IsThirdGameMode( self ) then
		f1_local6 = MenuBuilder.BuildRegisteredType( "MenuButton", {
			controllerIndex = f1_local1
		} )
		f1_local6.id = "LoadoutButton"
		if CONDITIONS.IsThirdGameMode( self ) then
			
		else
			
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f1_local6.buttonDescription = Engine.Localize( "LUA_MENU_ZM_LOADOUT_DESC" )
		end
		f1_local6.Text:setText( ToUpperCase( Engine.Localize( "LUA_MENU_ZM_LOADOUT_CAPS" ) ), 0 )
		f1_local6:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, _1080p * 120, _1080p * 150 )
		self:addElement( f1_local6 )
		self.LoadoutButton = f1_local6
	end
	if CONDITIONS.IsCoreMultiplayer( self ) then
		f1_local5:addEventHandler( "button_action", function ( f2_arg0, f2_arg1 )
			local f2_local0 = f2_arg1.controller or f1_local1
			ACTIONS.OpenCreateAClass( self, f2_arg1 )
		end )
	end
	if CONDITIONS.IsThirdGameMode( self ) then
		f1_local6:addEventHandler( "button_action", function ( f3_arg0, f3_arg1 )
			ACTIONS.OpenMenu( "CPLoadoutMenu", true, f3_arg1.controller or f1_local1 )
		end )
	end
	return self
end

MenuBuilder.registerType( "SystemLinkMenuButtons", SystemLinkMenuButtons )
LockTable( _M )
