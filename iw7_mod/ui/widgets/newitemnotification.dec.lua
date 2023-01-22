local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function NewItemNotification( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 64 * _1080p, 0, 64 * _1080p )
	self.id = "NewItemNotification"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Backer = nil
	
	Backer = LUI.UIImage.new()
	Backer.id = "Backer"
	Backer:setImage( RegisterMaterial( "icon_new_item" ), 0 )
	Backer:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * -1, _1080p * -1 )
	self:addElement( Backer )
	self.Backer = Backer
	
	local NewText = nil
	
	NewText = LUI.UIStyledText.new()
	NewText.id = "NewText"
	NewText:setText( ToUpperCase( Engine.Localize( "MENU_NEW" ) ), 0 )
	NewText:SetFontSize( 16 * _1080p )
	NewText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	NewText:SetAlignment( LUI.Alignment.Center )
	NewText:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * -8, _1080p * 8 )
	self:addElement( NewText )
	self.NewText = NewText
	
	return self
end

MenuBuilder.registerType( "NewItemNotification", NewItemNotification )
LockTable( _M )
