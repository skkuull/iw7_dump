local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function GameBattlesCountdownElement( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 80 * _1080p, 0, 80 * _1080p )
	self.id = "GameBattlesCountdownElement"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Title = nil
	
	Title = LUI.UIText.new()
	Title.id = "Title"
	Title:setText( Engine.Localize( "MENU_NEW" ), 0 )
	Title:SetFontSize( 22 * _1080p )
	Title:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Title:SetAlignment( LUI.Alignment.Center )
	Title:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 80, 0, _1080p * 22 )
	self:addElement( Title )
	self.Title = Title
	
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 3223857, 0 )
	Background:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 5, _1080p * 75, _1080p * 22, _1080p * 79 )
	self:addElement( Background )
	self.Background = Background
	
	local BackgroundHighlight = nil
	
	BackgroundHighlight = LUI.UIImage.new()
	BackgroundHighlight.id = "BackgroundHighlight"
	BackgroundHighlight:SetRGBFromInt( 15395562, 0 )
	BackgroundHighlight:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 5, _1080p * 75, _1080p * 35.5, _1080p * 65.5 )
	self:addElement( BackgroundHighlight )
	self.BackgroundHighlight = BackgroundHighlight
	
	local Value = nil
	
	Value = LUI.UIText.new()
	Value.id = "Value"
	Value:SetRGBFromInt( 0, 0 )
	Value:setText( Engine.Localize( "MENU_NEW" ), 0 )
	Value:SetFontSize( 32 * _1080p )
	Value:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Value:SetAlignment( LUI.Alignment.Center )
	Value:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 5, _1080p * -5, _1080p * 34.5, _1080p * 66.5 )
	self:addElement( Value )
	self.Value = Value
	
	return self
end

MenuBuilder.registerType( "GameBattlesCountdownElement", GameBattlesCountdownElement )
LockTable( _M )
