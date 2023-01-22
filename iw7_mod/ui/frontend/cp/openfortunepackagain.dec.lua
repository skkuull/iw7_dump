local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function OpenFortunePackAgain( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 258 * _1080p, 0, 576 * _1080p )
	self.id = "OpenFortunePackAgain"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local LootFortuneItemCard = nil
	
	LootFortuneItemCard = MenuBuilder.BuildRegisteredType( "LootFortuneItemCard", {
		controllerIndex = f1_local1
	} )
	LootFortuneItemCard.id = "LootFortuneItemCard"
	LootFortuneItemCard:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 5, _1080p * 255, 0, _1080p * 410 )
	self:addElement( LootFortuneItemCard )
	self.LootFortuneItemCard = LootFortuneItemCard
	
	local GenericListButtonBackground = nil
	
	GenericListButtonBackground = MenuBuilder.BuildRegisteredType( "GenericListButtonBackground", {
		controllerIndex = f1_local1
	} )
	GenericListButtonBackground.id = "GenericListButtonBackground"
	GenericListButtonBackground:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 255, _1080p * 493.08, _1080p * 523.08 )
	self:addElement( GenericListButtonBackground )
	self.GenericListButtonBackground = GenericListButtonBackground
	
	local ButtonLabel = nil
	
	ButtonLabel = LUI.UIStyledText.new()
	ButtonLabel.id = "ButtonLabel"
	ButtonLabel:setText( LocalizeString( "LUA_MENU_ZM_OPEN_CARD_PACK" ), 0 )
	ButtonLabel:SetFontSize( 20 * _1080p )
	ButtonLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ButtonLabel:SetAlignment( LUI.Alignment.Center )
	ButtonLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 5, _1080p * 258, _1080p * 500.08, _1080p * 520.08 )
	self:addElement( ButtonLabel )
	self.ButtonLabel = ButtonLabel
	
	local RemainingText = nil
	
	RemainingText = LUI.UIStyledText.new()
	RemainingText.id = "RemainingText"
	RemainingText:setText( ToUpperCase( Engine.Localize( "LUA_MENU_REMAINING" ) ), 0 )
	RemainingText:SetFontSize( 22 * _1080p )
	RemainingText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	RemainingText:SetAlignment( LUI.Alignment.Center )
	RemainingText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 3, _1080p * 252, _1080p * 417.94, _1080p * 439.94 )
	self:addElement( RemainingText )
	self.RemainingText = RemainingText
	
	local NumRemaining = nil
	
	NumRemaining = LUI.UIText.new()
	NumRemaining.id = "NumRemaining"
	NumRemaining:setText( "5", 0 )
	NumRemaining:SetFontSize( 22 * _1080p )
	NumRemaining:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	NumRemaining:SetAlignment( LUI.Alignment.Center )
	NumRemaining:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 79, _1080p * 176, _1080p * 455.02, _1080p * 477.02 )
	self:addElement( NumRemaining )
	self.NumRemaining = NumRemaining
	
	return self
end

MenuBuilder.registerType( "OpenFortunePackAgain", OpenFortunePackAgain )
LockTable( _M )
