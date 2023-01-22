local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:addEventHandler( "arrow_button_changed", function ( f2_arg0, f2_arg1 )
		f1_arg0.ButtonDescription.Description:setText( f2_arg1.desc )
		return true
	end )
	f1_arg0:addElement( CoD.GetWorldBlur() )
	f1_arg0.CodCasterDisplaySettingList.Details = f1_arg0.SettingDetails
	f1_arg0.MenuTitle.MenuBreadcrumbs:setText( CoD.GetBreadcrumb(), 0 )
end

function CodcasterDisplaySettings( menu, controller )
	local self = LUI.UIVerticalNavigator.new()
	self.id = "CodcasterDisplaySettings"
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	self:playSound( "menu_open" )
	local f3_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 0, 0 )
	Background:SetAlpha( 0.5, 0 )
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
	
	local CodCasterDisplaySettingList = nil
	
	CodCasterDisplaySettingList = MenuBuilder.BuildRegisteredType( "CodCasterDisplaySettingList", {
		controllerIndex = f3_local1
	} )
	CodCasterDisplaySettingList.id = "CodCasterDisplaySettingList"
	CodCasterDisplaySettingList:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 110, _1080p * 570, _1080p * 185, _1080p * 1145 )
	self:addElement( CodCasterDisplaySettingList )
	self.CodCasterDisplaySettingList = CodCasterDisplaySettingList
	
	local MenuTitle = nil
	
	MenuTitle = MenuBuilder.BuildRegisteredType( "MenuTitle", {
		controllerIndex = f3_local1
	} )
	MenuTitle.id = "MenuTitle"
	MenuTitle.MenuTitle:setText( ToUpperCase( Engine.Localize( "CODCASTER_DISPLAY_SETTINGS" ) ), 0 )
	MenuTitle.MenuBreadcrumbs:setText( ToUpperCase( "" ), 0 )
	MenuTitle.Icon:SetTop( _1080p * -28.5, 0 )
	MenuTitle.Icon:SetBottom( _1080p * 61.5, 0 )
	MenuTitle:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 96, 0, _1080p * 54, _1080p * 134 )
	self:addElement( MenuTitle )
	self.MenuTitle = MenuTitle
	
	local ButtonDescription = nil
	
	ButtonDescription = MenuBuilder.BuildRegisteredType( "ButtonDescriptionText", {
		controllerIndex = f3_local1
	} )
	ButtonDescription.id = "ButtonDescription"
	ButtonDescription.Description:SetRight( _1080p * 415, 0 )
	ButtonDescription:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 550, _1080p * 901, _1080p * 933 )
	self:addElement( ButtonDescription )
	self.ButtonDescription = ButtonDescription
	
	self.addButtonHelperFunction = function ( f4_arg0, f4_arg1 )
		f4_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_SELECT" ),
			button_ref = "button_primary",
			side = "left",
			priority = -10,
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
	
	self.bindButton:addEventHandler( "button_secondary", function ( f5_arg0, f5_arg1 )
		local f5_local0 = f5_arg1.controller or f3_local1
		ACTIONS.LeaveMenu( self )
		return true
	end )
	f0_local0( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "CodcasterDisplaySettings", CodcasterDisplaySettings )
LockTable( _M )
