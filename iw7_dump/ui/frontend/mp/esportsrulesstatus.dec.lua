local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function UpdateVisibility( f1_arg0 )
	if MLG.AreMLGRulesEnabled() then
		f1_arg0:SetAlpha( 1 )
	else
		f1_arg0:SetAlpha( 0 )
	end
end

f0_local0 = function ( f2_arg0, f2_arg1, f2_arg2 )
	UpdateVisibility( f2_arg0 )
	f2_arg0.UpdateVisibility = UpdateVisibility
	f2_arg0.CWLRulesText:setText( ToUpperCase( Engine.Localize( "MP_FRONTEND_ONLY_CWL_RULES", "LUA_MENU_MP_ENABLED" ) ) )
	f2_arg0.CWLDraftText:setText( ToUpperCase( Engine.Localize( "MP_FRONTEND_ONLY_CWL_DRAFT", "LUA_MENU_MP_ENABLED" ) ) )
end

function ESportsRulesStatus( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 501 * _1080p, 0, 80 * _1080p )
	self.id = "ESportsRulesStatus"
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 4737096, 0 )
	Background:SetAlpha( 0.8, 0 )
	Background:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 5, _1080p * -5 )
	self:addElement( Background )
	self.Background = Background
	
	local CWLRulesText = nil
	
	CWLRulesText = LUI.UIText.new()
	CWLRulesText.id = "CWLRulesText"
	CWLRulesText:setText( "", 0 )
	CWLRulesText:SetFontSize( 26 * _1080p )
	CWLRulesText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	CWLRulesText:setTextStyle( CoD.TextStyle.Shadowed )
	CWLRulesText:SetAlignment( LUI.Alignment.Left )
	CWLRulesText:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 10, _1080p * -10, _1080p * -28, _1080p * -2 )
	self:addElement( CWLRulesText )
	self.CWLRulesText = CWLRulesText
	
	local CWLDraftText = nil
	
	CWLDraftText = LUI.UIText.new()
	CWLDraftText.id = "CWLDraftText"
	CWLDraftText:setText( "", 0 )
	CWLDraftText:SetFontSize( 26 * _1080p )
	CWLDraftText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	CWLDraftText:setTextStyle( CoD.TextStyle.Shadowed )
	CWLDraftText:SetAlignment( LUI.Alignment.Left )
	CWLDraftText:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 10, _1080p * -10, _1080p * -1, _1080p * 25 )
	self:addElement( CWLDraftText )
	self.CWLDraftText = CWLDraftText
	
	local TopLine = nil
	
	TopLine = LUI.UIImage.new()
	TopLine.id = "TopLine"
	TopLine:SetRGBFromTable( SWATCHES.genericButton.highlight, 0 )
	TopLine:SetAlpha( 0.8, 0 )
	TopLine:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 5 )
	self:addElement( TopLine )
	self.TopLine = TopLine
	
	local BottomLine = nil
	
	BottomLine = LUI.UIImage.new()
	BottomLine.id = "BottomLine"
	BottomLine:SetRGBFromTable( SWATCHES.genericButton.highlight, 0 )
	BottomLine:SetAlpha( 0.8, 0 )
	BottomLine:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -5, 0 )
	self:addElement( BottomLine )
	self.BottomLine = BottomLine
	
	f0_local0( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "ESportsRulesStatus", ESportsRulesStatus )
LockTable( _M )
