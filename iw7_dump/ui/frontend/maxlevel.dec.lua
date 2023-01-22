local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function MaxLevel( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 128 * _1080p, 0, 28 * _1080p )
	self.id = "MaxLevel"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local BottomLine = nil
	
	BottomLine = LUI.UIImage.new()
	BottomLine.id = "BottomLine"
	BottomLine:SetAlpha( 0.4, 0 )
	BottomLine:setImage( RegisterMaterial( "wdg_gradient_dual" ), 0 )
	BottomLine:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * -10, _1080p * 10, _1080p * 11, _1080p * 13 )
	self:addElement( BottomLine )
	self.BottomLine = BottomLine
	
	local TopLine = nil
	
	TopLine = LUI.UIImage.new()
	TopLine.id = "TopLine"
	TopLine:SetAlpha( 0.4, 0 )
	TopLine:setImage( RegisterMaterial( "wdg_gradient_dual" ), 0 )
	TopLine:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * -10, _1080p * 10, _1080p * -13, _1080p * -11 )
	self:addElement( TopLine )
	self.TopLine = TopLine
	
	local MaxLevelText = nil
	
	MaxLevelText = LUI.UIStyledText.new()
	MaxLevelText.id = "MaxLevelText"
	MaxLevelText:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MAX" ) ), 0 )
	MaxLevelText:SetFontSize( 28 * _1080p )
	MaxLevelText:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	MaxLevelText:SetAlignment( LUI.Alignment.Center )
	MaxLevelText:SetStartupDelay( 1000 )
	MaxLevelText:SetLineHoldTime( 500 )
	MaxLevelText:SetAnimMoveTime( 500 )
	MaxLevelText:SetEndDelay( 1000 )
	MaxLevelText:SetCrossfadeTime( 500 )
	MaxLevelText:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	MaxLevelText:SetMaxVisibleLines( 1 )
	MaxLevelText:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * -14, _1080p * 14 )
	self:addElement( MaxLevelText )
	self.MaxLevelText = MaxLevelText
	
	return self
end

MenuBuilder.registerType( "MaxLevel", MaxLevel )
LockTable( _M )
