local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	if Engine.IsCoreMode() then
		local self = LUI.UIElement.new( {
			worldBlur = 5
		} )
		self:setupWorldBlur()
		self.id = "blur"
		f1_arg0:addElement( self )
	end
	FrontEndScene.SetScene( "loadout_select" )
end

function PermanentUnlocksMenu( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "PermanentUnlocksMenu"
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	self:playSound( "menu_open" )
	local f2_local2 = self
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f2_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local MenuTitle = nil
	
	MenuTitle = MenuBuilder.BuildRegisteredType( "MenuTitle", {
		controllerIndex = f2_local1
	} )
	MenuTitle.id = "MenuTitle"
	MenuTitle.MenuTitle:setText( ToUpperCase( Engine.Localize( "PRESTIGE_PERMANENT_UNLOCKS" ) ), 0 )
	MenuTitle.MenuBreadcrumbs:setText( Engine.Localize( "LUA_MENU_BARRACKS_CAPS" ), 0 )
	MenuTitle.Icon:SetTop( _1080p * -28.5, 0 )
	MenuTitle.Icon:SetBottom( _1080p * 61.5, 0 )
	MenuTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
	self:addElement( MenuTitle )
	self.MenuTitle = MenuTitle
	
	local FriendsElement = nil
	
	FriendsElement = MenuBuilder.BuildRegisteredType( "online_friends_widget", {
		controllerIndex = f2_local1
	} )
	FriendsElement.id = "FriendsElement"
	FriendsElement:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	FriendsElement:SetAlignment( LUI.Alignment.Left )
	FriendsElement:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 100, _1080p * 600, _1080p * -60, _1080p * -15 )
	self:addElement( FriendsElement )
	self.FriendsElement = FriendsElement
	
	local PermanentUnlockTokens = nil
	
	PermanentUnlockTokens = MenuBuilder.BuildRegisteredType( "PermanentUnlockTokens", {
		controllerIndex = f2_local1
	} )
	PermanentUnlockTokens.id = "PermanentUnlockTokens"
	PermanentUnlockTokens:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1170, _1080p * 1920, _1080p * 71.5, _1080p * 116.5 )
	self:addElement( PermanentUnlockTokens )
	self.PermanentUnlockTokens = PermanentUnlockTokens
	
	local PermanentUnlocksButtons = nil
	
	PermanentUnlocksButtons = MenuBuilder.BuildRegisteredType( "PermanentUnlocksButtons", {
		controllerIndex = f2_local1
	} )
	PermanentUnlocksButtons.id = "PermanentUnlocksButtons"
	PermanentUnlocksButtons:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 730, _1080p * 216, _1080p * 941 )
	self:addElement( PermanentUnlocksButtons )
	self.PermanentUnlocksButtons = PermanentUnlocksButtons
	
	local PermanentUnlocksDescription = nil
	
	PermanentUnlocksDescription = MenuBuilder.BuildRegisteredType( "PermanentUnlocksDescription", {
		controllerIndex = f2_local1
	} )
	PermanentUnlocksDescription.id = "PermanentUnlocksDescription"
	PermanentUnlocksDescription:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1019, _1080p * 1719, _1080p * 216, _1080p * 766 )
	self:addElement( PermanentUnlocksDescription )
	self.PermanentUnlocksDescription = PermanentUnlocksDescription
	
	local SocialFeed = nil
	
	SocialFeed = MenuBuilder.BuildRegisteredType( "SocialFeed", {
		controllerIndex = f2_local1
	} )
	SocialFeed.id = "SocialFeed"
	SocialFeed:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1920, _1080p * 955, _1080p * 995 )
	self:addElement( SocialFeed )
	self.SocialFeed = SocialFeed
	
	local CRMMain = nil
	
	CRMMain = MenuBuilder.BuildRegisteredType( "CRMMain", {
		controllerIndex = f2_local1
	} )
	CRMMain.id = "CRMMain"
	CRMMain:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 136, _1080p * 447, _1080p * 745, _1080p * 1069 )
	self:addElement( CRMMain )
	self.CRMMain = CRMMain
	
	self.addButtonHelperFunction = function ( f3_arg0, f3_arg1 )
		f3_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_SELECT" ),
			button_ref = "button_primary",
			side = "left",
			clickable = true
		} )
		f3_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			clickable = true
		} )
	end
	
	self:addEventHandler( "menu_create", self.addButtonHelperFunction )
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	self.bindButton:addEventHandler( "button_secondary", function ( f4_arg0, f4_arg1 )
		local f4_local0 = f4_arg1.controller or f2_local1
		ACTIONS.LeaveMenu( self )
	end )
	f0_local0( self, f2_local1, controller )
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "CRMMain",
		sequenceName = "Minimize",
		elementPath = "CRMMain"
	} )
	return self
end

MenuBuilder.registerType( "PermanentUnlocksMenu", PermanentUnlocksMenu )
LockTable( _M )
