local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function MenuTitleWithIcon( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 960 * _1080p, 0, 80 * _1080p )
	self.id = "MenuTitleWithIcon"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local MenuTitle = nil
	
	MenuTitle = MenuBuilder.BuildRegisteredType( "MenuTitle", {
		controllerIndex = f1_local1
	} )
	MenuTitle.id = "MenuTitle"
	MenuTitle.MenuTitle:setText( Engine.Localize( "MENU_NEW" ), 0 )
	MenuTitle.MenuBreadcrumbs:setText( Engine.Localize( "MENU_NEW" ), 0 )
	MenuTitle.Icon:SetTop( _1080p * -28.5, 0 )
	MenuTitle.Icon:SetBottom( _1080p * 61.5, 0 )
	MenuTitle:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 70, _1080p * 70, 0, _1080p * 80 )
	self:addElement( MenuTitle )
	self.MenuTitle = MenuTitle
	
	local Icon = nil
	
	Icon = LUI.UIImage.new()
	Icon.id = "Icon"
	Icon:setImage( RegisterMaterial( "gamemode_generic" ), 0 )
	Icon:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 90, _1080p * -28.5, _1080p * 61.5 )
	self:addElement( Icon )
	self.Icon = Icon
	
	return self
end

MenuBuilder.registerType( "MenuTitleWithIcon", MenuTitleWithIcon )
LockTable( _M )
