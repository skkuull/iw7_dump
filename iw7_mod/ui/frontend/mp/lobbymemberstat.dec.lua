local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function LobbyMemberStat( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 418 * _1080p, 0, 30 * _1080p )
	self.id = "LobbyMemberStat"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 0, 0 )
	Background:SetAlpha( 0.6, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local Title = nil
	
	Title = LUI.UIText.new()
	Title.id = "Title"
	Title:setText( "", 0 )
	Title:SetFontSize( 30 * _1080p )
	Title:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Title:SetAlignment( LUI.Alignment.Left )
	Title:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 10, _1080p * 260, 0, _1080p * 30 )
	self:addElement( Title )
	self.Title = Title
	
	local Value = nil
	
	Value = LUI.UIText.new()
	Value.id = "Value"
	Value:setText( "", 0 )
	Value:SetFontSize( 30 * _1080p )
	Value:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	Value:SetAlignment( LUI.Alignment.Right )
	Value:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -162, _1080p * -10, 0, _1080p * 30 )
	self:addElement( Value )
	self.Value = Value
	
	return self
end

MenuBuilder.registerType( "LobbyMemberStat", LobbyMemberStat )
LockTable( _M )
