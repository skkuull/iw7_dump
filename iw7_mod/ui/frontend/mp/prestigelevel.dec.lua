local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PrestigeLevel( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 200 * _1080p, 0, 12 * _1080p )
	self.id = "PrestigeLevel"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Text = nil
	
	Text = LUI.UIText.new()
	Text.id = "Text"
	Text:SetRGBFromInt( 10921638, 0 )
	Text:setText( Engine.Localize( "PRESTIGE_CURRENT_LEVEL" ), 0 )
	Text:SetFontSize( 14 * _1080p )
	Text:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Text:SetAlignment( LUI.Alignment.Left )
	Text:SetOptOutRightToLeftAlignmentFlip( true )
	Text:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 200, 0, _1080p * 14 )
	self:addElement( Text )
	self.Text = Text
	
	return self
end

MenuBuilder.registerType( "PrestigeLevel", PrestigeLevel )
LockTable( _M )
