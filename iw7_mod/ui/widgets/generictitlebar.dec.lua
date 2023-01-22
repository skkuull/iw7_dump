local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function GenericTitleBar( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 170 * _1080p )
	self.id = "GenericTitleBar"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	self:setUseStencil( true )
	local Title = nil
	
	Title = LUI.UIText.new()
	Title.id = "Title"
	Title:SetRGBFromTable( SWATCHES.titleBar.titleBarText, 0 )
	Title:setText( Engine.Localize( "MENU_NEW" ), 0 )
	Title:SetFontSize( 60 * _1080p )
	Title:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	Title:SetAlignment( LUI.Alignment.Left )
	Title:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 196.09, 0, _1080p * -125, _1080p * -65 )
	self:addElement( Title )
	self.Title = Title
	
	return self
end

MenuBuilder.registerType( "GenericTitleBar", GenericTitleBar )
LockTable( _M )
