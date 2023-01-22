local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function CodCasterDisplaySettingDetails( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 700 * _1080p, 0, 90 * _1080p )
	self.id = "CodCasterDisplaySettingDetails"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetAlpha( 0.25, 0 )
	Background:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 38 )
	self:addElement( Background )
	self.Background = Background
	
	local Title = nil
	
	Title = LUI.UIStyledText.new()
	Title.id = "Title"
	Title:setText( Engine.Localize( "MENU_NEW" ), 0 )
	Title:SetFontSize( 38 * _1080p )
	Title:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	Title:SetAlignment( LUI.Alignment.Left )
	Title:SetDecodeLetterLength( 25 )
	Title:SetDecodeMaxRandChars( 3 )
	Title:SetDecodeUpdatesPerLetter( 4 )
	Title:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 10, _1080p * -10, 0, _1080p * 38 )
	self:addElement( Title )
	self.Title = Title
	
	local Desc = nil
	
	Desc = LUI.UIStyledText.new()
	Desc.id = "Desc"
	Desc:setText( Engine.Localize( "MENU_NEW" ), 0 )
	Desc:SetFontSize( 32 * _1080p )
	Desc:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Desc:SetAlignment( LUI.Alignment.Left )
	Desc:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 10, _1080p * -10, _1080p * 50, _1080p * 82 )
	self:addElement( Desc )
	self.Desc = Desc
	
	return self
end

MenuBuilder.registerType( "CodCasterDisplaySettingDetails", CodCasterDisplaySettingDetails )
LockTable( _M )
