local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.Description )
	local self = LUI.UIElement.new( {
		worldBlur = 5
	} )
	self:setupWorldBlur()
	self.id = "blur"
	f1_arg0:addElement( self )
	local f1_local1 = LUI.UITimer.new( nil, {
		interval = 250,
		event = "host_migration_update"
	} )
	f1_local1.id = "timer"
	f1_arg0:addElement( f1_local1 )
	f1_arg0:addEventHandler( "host_migration_update", function ( f2_arg0, f2_arg1 )
		f2_arg0.Description:setText( Game.GetMigrationStatus() )
	end )
end

function HostMigration( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "HostMigration"
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
	
	local f3_local4 = nil
	if not CONDITIONS.IsThirdGameMode( self ) then
		f3_local4 = MenuBuilder.BuildRegisteredType( "MenuTitle", {
			controllerIndex = f3_local1
		} )
		f3_local4.id = "MenuTitle"
		f3_local4.MenuTitle:setText( ToUpperCase( Engine.Localize( "LUA_MENU_HOST_MIGRATION_CAPS" ) ), 0 )
		f3_local4.MenuBreadcrumbs:setText( ToUpperCase( "" ), 0 )
		f3_local4.Icon:SetTop( _1080p * -28.5, 0 )
		f3_local4.Icon:SetBottom( _1080p * 61.5, 0 )
		f3_local4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
		self:addElement( f3_local4 )
		self.MenuTitle = f3_local4
	end
	local f3_local5 = nil
	if CONDITIONS.IsThirdGameMode( self ) then
		f3_local5 = MenuBuilder.BuildRegisteredType( "CPMenuTitle", {
			controllerIndex = f3_local1
		} )
		f3_local5.id = "CPMenuTitle"
		f3_local5.MenuTitle:setText( Engine.Localize( "LUA_MENU_HOST_MIGRATION_CAPS" ), 0 )
		f3_local5:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 84.21, _1080p * 1044.21, _1080p * 43, _1080p * 123 )
		self:addElement( f3_local5 )
		self.CPMenuTitle = f3_local5
	end
	local Description = nil
	
	Description = LUI.UIText.new()
	Description.id = "Description"
	Description:setText( "", 0 )
	Description:SetFontSize( 64 * _1080p )
	Description:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Description:SetAlignment( LUI.Alignment.Left )
	Description:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 1790, _1080p * 216, _1080p * 280 )
	self:addElement( Description )
	self.Description = Description
	
	f0_local0( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "HostMigration", HostMigration )
LockTable( _M )
