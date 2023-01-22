local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ShowESportsRules( f1_arg0 )
	f1_arg0.ESportsRulesLabel:setText( Engine.Localize( "PATCH_MENU_MLG_RULES_VERSION", MLG.GetRulesVersionNumber() ) )
end

function TryHideESportsRules( f2_arg0 )
	if not MLG.AreMLGRulesEnabled() then
		f2_arg0.ESportsRulesLabel:setText( "" )
	end
end

function PostLoadFunc( f3_arg0, f3_arg1, f3_arg2 )
	if MLG.AreMLGRulesEnabled() then
		f3_arg0.ESportsRulesLabel:setText( Engine.Localize( "PATCH_MENU_MLG_RULES_VERSION", MLG.GetRulesVersionNumber() ) )
	else
		f3_arg0.ESportsRulesLabel:setText( "" )
	end
	f3_arg0.ShowESportsRules = ShowESportsRules
	f3_arg0.TryHideESportsRules = TryHideESportsRules
end

function ESportsRulesLabel( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 600 * _1080p, 0, 30 * _1080p )
	self.id = "ESportsRulesLabel"
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local ESportsRulesLabel = nil
	
	ESportsRulesLabel = LUI.UIText.new()
	ESportsRulesLabel.id = "ESportsRulesLabel"
	ESportsRulesLabel:setText( Engine.Localize( "MENU_NEW" ), 0 )
	ESportsRulesLabel:SetFontSize( 26 * _1080p )
	ESportsRulesLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ESportsRulesLabel:setTextStyle( CoD.TextStyle.Shadowed )
	ESportsRulesLabel:SetAlignment( LUI.Alignment.Right )
	ESportsRulesLabel:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 600, 0, _1080p * 26 )
	self:addElement( ESportsRulesLabel )
	self.ESportsRulesLabel = ESportsRulesLabel
	
	PostLoadFunc( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "ESportsRulesLabel", ESportsRulesLabel )
LockTable( _M )
