local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:addElement( CoD.GetWorldBlur() )
	f1_arg0.MenuTitle.MenuBreadcrumbs:setText( CoD.GetBreadcrumb(), 0 )
end

function CodcasterKeyboardMenu( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "CodcasterKeyboardMenu"
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	self:playSound( "menu_open" )
	local f2_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 0, 0 )
	Background:SetAlpha( 0.5, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local BackgroundKeys = nil
	
	BackgroundKeys = LUI.UIImage.new()
	BackgroundKeys.id = "BackgroundKeys"
	BackgroundKeys:SetRGBFromTable( SWATCHES.genericMenu.popupBackground, 0 )
	BackgroundKeys:SetAlpha( 0.5, 0 )
	BackgroundKeys:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1920, _1080p * 185, _1080p * 905 )
	self:addElement( BackgroundKeys )
	self.BackgroundKeys = BackgroundKeys
	
	local MenuTitle = nil
	
	MenuTitle = MenuBuilder.BuildRegisteredType( "MenuTitle", {
		controllerIndex = f2_local1
	} )
	MenuTitle.id = "MenuTitle"
	MenuTitle.MenuTitle:setText( ToUpperCase( Engine.Localize( "CODCASTER_KEYBOARD_SHORTCUTS" ) ), 0 )
	MenuTitle.MenuBreadcrumbs:setText( "", 0 )
	MenuTitle.Icon:SetTop( _1080p * -28.5, 0 )
	MenuTitle.Icon:SetBottom( _1080p * 61.5, 0 )
	MenuTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
	self:addElement( MenuTitle )
	self.MenuTitle = MenuTitle
	
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f2_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1920, _1080p * 1010, _1080p * 1080 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local CodcasterKeyboardShortcuts = nil
	
	CodcasterKeyboardShortcuts = MenuBuilder.BuildRegisteredType( "CodcasterKeyboardShortcuts", {
		controllerIndex = f2_local1
	} )
	CodcasterKeyboardShortcuts.id = "CodcasterKeyboardShortcuts"
	CodcasterKeyboardShortcuts:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 323.5, _1080p * 1596.5, _1080p * 216, _1080p * 888 )
	self:addElement( CodcasterKeyboardShortcuts )
	self.CodcasterKeyboardShortcuts = CodcasterKeyboardShortcuts
	
	self.addButtonHelperFunction = function ( f3_arg0, f3_arg1 )
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
	return self
end

MenuBuilder.registerType( "CodcasterKeyboardMenu", CodcasterKeyboardMenu )
LockTable( _M )
