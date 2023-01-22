local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function CODTvStatusWidget( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 701 * _1080p, 0, 188 * _1080p )
	self.id = "CODTvStatusWidget"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Text = nil
	
	Text = LUI.UIText.new()
	Text.id = "Text"
	Text:setText( Engine.Localize( "CODTV_ERROR_MSG" ), 0 )
	Text:SetFontSize( 45 * _1080p )
	Text:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Text:SetAlignment( LUI.Alignment.Center )
	Text:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 66, _1080p * 635, _1080p * 64, _1080p * 106 )
	self:addElement( Text )
	self.Text = Text
	
	local ErrorIcon = nil
	
	ErrorIcon = LUI.UIImage.new()
	ErrorIcon.id = "ErrorIcon"
	ErrorIcon:setImage( RegisterMaterial( "hud_icon_warning" ), 0 )
	ErrorIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 318.5, _1080p * 382.5, 0, _1080p * 64 )
	self:addElement( ErrorIcon )
	self.ErrorIcon = ErrorIcon
	
	return self
end

MenuBuilder.registerType( "CODTvStatusWidget", CODTvStatusWidget )
LockTable( _M )
