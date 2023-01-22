local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PreLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = LUI.FlowManager.GetScopedData( f1_arg0 )
	f1_local0.hideWeaponBreadcrumbs = true
end

function PostLoadFunc( f2_arg0, f2_arg1, f2_arg2 )
	local self = LUI.UIElement.new( {
		worldBlur = 5
	} )
	self:setupWorldBlur()
	self.id = "blur"
	f2_arg0:addElement( self )
	local f2_local1 = nil
	f2_local1 = GetCACPlayerDataDataSource( DataSources.alwaysLoaded.playerData.MP.rankedloadouts.squadMembers )
	assert( f2_local1 )
	f2_arg0.statsGroupDataSource = f2_local1
	f2_arg0:SetDataSource( f2_local1.loadouts, f2_arg1 )
end

function MatchSimLoadoutSelect( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "MatchSimLoadoutSelect"
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	PreLoadFunc( self, f3_local1, controller )
	self:playSound( "menu_open" )
	local f3_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 0, 0 )
	Background:SetAlpha( 0.5, 0 )
	Background:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080 )
	self:addElement( Background )
	self.Background = Background
	
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f3_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local MatchSimLoadoutList = nil
	
	MatchSimLoadoutList = MenuBuilder.BuildRegisteredType( "MatchSimLoadoutList", {
		controllerIndex = f3_local1
	} )
	MatchSimLoadoutList.id = "MatchSimLoadoutList"
	MatchSimLoadoutList:SetDataSourceThroughElement( self, nil )
	MatchSimLoadoutList:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 317.43, _1080p * 773.43, _1080p * 218.5, _1080p * 774.5 )
	self:addElement( MatchSimLoadoutList )
	self.MatchSimLoadoutList = MatchSimLoadoutList
	
	local CACLoadoutWrapper = nil
	
	CACLoadoutWrapper = MenuBuilder.BuildRegisteredType( "CACLoadoutWrapper", {
		controllerIndex = f3_local1
	} )
	CACLoadoutWrapper.id = "CACLoadoutWrapper"
	CACLoadoutWrapper:SetDataSourceThroughElement( MatchSimLoadoutList.Loadouts, nil )
	CACLoadoutWrapper:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1091, _1080p * 1686, _1080p * 121.5, _1080p * 871.5 )
	self:addElement( CACLoadoutWrapper )
	self.CACLoadoutWrapper = CACLoadoutWrapper
	
	local MenuTitle = nil
	
	MenuTitle = MenuBuilder.BuildRegisteredType( "MenuTitle", {
		controllerIndex = f3_local1
	} )
	MenuTitle.id = "MenuTitle"
	MenuTitle.MenuTitle:setText( Engine.Localize( "LUA_MENU_MP_LOADOUT_SELECT" ), 0 )
	MenuTitle.MenuBreadcrumbs:setText( "", 0 )
	MenuTitle.Icon:SetTop( _1080p * -28.5, 0 )
	MenuTitle.Icon:SetBottom( _1080p * 61.5, 0 )
	MenuTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 290.43, _1080p * 800.43, _1080p * 81.5, _1080p * 161.5 )
	self:addElement( MenuTitle )
	self.MenuTitle = MenuTitle
	
	MatchSimLoadoutList:SetDataSourceThroughElement( self, nil )
	CACLoadoutWrapper:SetDataSourceThroughElement( MatchSimLoadoutList.Loadouts, nil )
	self.addButtonHelperFunction = function ( f4_arg0, f4_arg1 )
		f4_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_SELECT" ),
			button_ref = "button_primary",
			side = "left",
			priority = -20,
			clickable = true
		} )
		f4_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			priority = 10,
			clickable = true
		} )
	end
	
	self:addEventHandler( "menu_create", self.addButtonHelperFunction )
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	self:addEventHandler( "menu_create", function ( f5_arg0, f5_arg1 )
		ACTIONS.UploadStats( self, f5_arg1.controller or f3_local1 )
	end )
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "MatchSimLoadoutSelect", MatchSimLoadoutSelect )
LockTable( _M )
