local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function AARBarGraphStatDisplay( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 455 * _1080p, 0, 36 * _1080p )
	self.id = "AARBarGraphStatDisplay"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local StatText = nil
	
	StatText = LUI.UIText.new()
	StatText.id = "StatText"
	StatText:SetRGBFromInt( 15658644, 0 )
	StatText:setText( "1.54", 0 )
	StatText:SetFontSize( 18 * _1080p )
	StatText:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	StatText:SetAlignment( LUI.Alignment.Left )
	StatText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 171.1, _1080p * 224.5, _1080p * 1, _1080p * 19 )
	self:addElement( StatText )
	self.StatText = StatText
	
	local StatTitle = nil
	
	StatTitle = LUI.UIText.new()
	StatTitle.id = "StatTitle"
	StatTitle:setText( "Personal Best K/D:", 0 )
	StatTitle:SetFontSize( 16 * _1080p )
	StatTitle:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	StatTitle:SetAlignment( LUI.Alignment.Left )
	StatTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 6.6, _1080p * 167, _1080p * 2, _1080p * 18 )
	self:addElement( StatTitle )
	self.StatTitle = StatTitle
	
	local StatDate = nil
	
	StatDate = LUI.UIText.new()
	StatDate.id = "StatDate"
	StatDate:SetAlpha( 0.5, 0 )
	StatDate:setText( "10/22/15 - 05:09", 0 )
	StatDate:SetFontSize( 14 * _1080p )
	StatDate:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	StatDate:SetAlignment( LUI.Alignment.Left )
	StatDate:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 6.6, _1080p * 167, _1080p * 19, _1080p * 33 )
	self:addElement( StatDate )
	self.StatDate = StatDate
	
	return self
end

MenuBuilder.registerType( "AARBarGraphStatDisplay", AARBarGraphStatDisplay )
LockTable( _M )
