local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ()
	Engine.SetFrontEndSceneSection( "loadout_menu", 1 )
end

f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2 )
	assert( f2_arg0.bindButton )
	f2_arg0.bindButton:addEventHandler( "button_secondary", function ( f3_arg0, f3_arg1 )
		ACTIONS.LeaveMenu( f2_arg0 )
	end )
end

function CPLoadoutMenu( menu, controller )
	local self = LUI.UIVerticalNavigator.new()
	self.id = "CPLoadoutMenu"
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	f0_local0( self, f4_local1, controller )
	self:playSound( "menu_open" )
	local f4_local2 = self
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f4_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local CPLoadoutButtons = nil
	
	CPLoadoutButtons = MenuBuilder.BuildRegisteredType( "CPLoadoutButtons", {
		controllerIndex = f4_local1
	} )
	CPLoadoutButtons.id = "CPLoadoutButtons"
	CPLoadoutButtons:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 131, _1080p * 681, _1080p * 200, _1080p * 600 )
	self:addElement( CPLoadoutButtons )
	self.CPLoadoutButtons = CPLoadoutButtons
	
	local CPMenuTitle = nil
	
	CPMenuTitle = MenuBuilder.BuildRegisteredType( "CPMenuTitle", {
		controllerIndex = f4_local1
	} )
	CPMenuTitle.id = "CPMenuTitle"
	CPMenuTitle.MenuTitle:setText( Engine.Localize( "LUA_MENU_ZM_LOADOUT_CAPS" ), 0 )
	CPMenuTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
	self:addElement( CPMenuTitle )
	self.CPMenuTitle = CPMenuTitle
	
	local FriendsElement = nil
	
	FriendsElement = MenuBuilder.BuildRegisteredType( "online_friends_widget", {
		controllerIndex = f4_local1
	} )
	FriendsElement.id = "FriendsElement"
	FriendsElement:SetFont( FONTS.GetFont( FONTS.Dev.File ) )
	FriendsElement:SetAlignment( LUI.Alignment.Left )
	FriendsElement:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -500, 0, _1080p * -45, 0 )
	self:addElement( FriendsElement )
	self.FriendsElement = FriendsElement
	
	local SocialFeed = nil
	
	SocialFeed = MenuBuilder.BuildRegisteredType( "SocialFeed", {
		controllerIndex = f4_local1
	} )
	SocialFeed.id = "SocialFeed"
	SocialFeed:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1920, _1080p * 965, _1080p * 995 )
	self:addElement( SocialFeed )
	self.SocialFeed = SocialFeed
	
	local f4_local8 = nil
	if CONDITIONS.IsPublicMatch( self ) then
		f4_local8 = MenuBuilder.BuildRegisteredType( "CRMMain", {
			controllerIndex = f4_local1
		} )
		f4_local8.id = "CRMMain"
		f4_local8:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 137, _1080p * 447, _1080p * 745, _1080p * 1069 )
		self:addElement( f4_local8 )
		self.CRMMain = f4_local8
	end
	self.addButtonHelperFunction = function ( f5_arg0, f5_arg1 )
		f5_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_SELECT" ),
			button_ref = "button_primary",
			side = "left",
			clickable = true
		} )
		f5_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			clickable = true
		} )
		f5_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_OPTIONS_CAPS" ),
			button_ref = "button_start",
			side = "left",
			clickable = true
		} )
	end
	
	self:addEventHandler( "menu_create", self.addButtonHelperFunction )
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	self.bindButton:addEventHandler( "button_start", function ( f6_arg0, f6_arg1 )
		ACTIONS.OpenMenu( "OptionsMenu", true, f6_arg1.controller or f4_local1 )
	end )
	f0_local1( self, f4_local1, controller )
	if CONDITIONS.IsPublicMatch( self ) then
		ACTIONS.AnimateSequenceByElement( self, {
			elementName = "CRMMain",
			sequenceName = "Minimize",
			elementPath = "CRMMain"
		} )
	end
	return self
end

MenuBuilder.registerType( "CPLoadoutMenu", CPLoadoutMenu )
LockTable( _M )
