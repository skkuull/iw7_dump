local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function MatchIDLobbyInfo( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 400 * _1080p, 0, 83 * _1080p )
	self.id = "MatchIDLobbyInfo"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 4737096, 0 )
	Background:SetAlpha( 0.8, 0 )
	Background:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 5, _1080p * -5 )
	self:addElement( Background )
	self.Background = Background
	
	local BottomLine = nil
	
	BottomLine = LUI.UIImage.new()
	BottomLine.id = "BottomLine"
	BottomLine:SetRGBFromInt( 22165, 0 )
	BottomLine:SetAlpha( 0.8, 0 )
	BottomLine:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -5, 0 )
	self:addElement( BottomLine )
	self.BottomLine = BottomLine
	
	local TopLine = nil
	
	TopLine = LUI.UIImage.new()
	TopLine.id = "TopLine"
	TopLine:SetRGBFromInt( 12722226, 0 )
	TopLine:SetAlpha( 0.8, 0 )
	TopLine:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 5 )
	self:addElement( TopLine )
	self.TopLine = TopLine
	
	local MatchIDTitle = nil
	
	MatchIDTitle = LUI.UIText.new()
	MatchIDTitle.id = "MatchIDTitle"
	MatchIDTitle:setText( ToUpperCase( Engine.Localize( "MLG_GAMEBATTLES_CURRENT_MATCH_ID" ) ), 0 )
	MatchIDTitle:SetFontSize( 28 * _1080p )
	MatchIDTitle:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	MatchIDTitle:SetAlignment( LUI.Alignment.Left )
	MatchIDTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 3, _1080p * 397, _1080p * 13, _1080p * 41.5 )
	self:addElement( MatchIDTitle )
	self.MatchIDTitle = MatchIDTitle
	
	local MatchIDText = nil
	
	MatchIDText = LUI.UIText.new()
	MatchIDText.id = "MatchIDText"
	MatchIDText:setText( Engine.Localize( "MENU_NEW" ), 0 )
	MatchIDText:SetFontSize( 19 * _1080p )
	MatchIDText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	MatchIDText:SetAlignment( LUI.Alignment.Left )
	MatchIDText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 3, _1080p * 397, _1080p * 42.5, _1080p * 67.5 )
	self:addElement( MatchIDText )
	self.MatchIDText = MatchIDText
	
	return self
end

MenuBuilder.registerType( "MatchIDLobbyInfo", MatchIDLobbyInfo )
LockTable( _M )
