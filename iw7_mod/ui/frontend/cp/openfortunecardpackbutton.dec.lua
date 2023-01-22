local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	if IsLanguageArabic() then
		f1_arg0.Amount:SetAlignment( LUI.Alignment.Left )
	end
end

function OpenFortuneCardPackButton( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 500 * _1080p, 0, 30 * _1080p )
	self.id = "OpenFortuneCardPackButton"
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local MenuButton = nil
	
	MenuButton = MenuBuilder.BuildRegisteredType( "MenuButton", {
		controllerIndex = f2_local1
	} )
	MenuButton.id = "MenuButton"
	MenuButton.Text:setText( ToUpperCase( Engine.Localize( "MENU_NEW" ) ), 0 )
	MenuButton:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( MenuButton )
	self.MenuButton = MenuButton
	
	local Amount = nil
	
	Amount = LUI.UIText.new()
	Amount.id = "Amount"
	Amount:setText( "99999", 0 )
	Amount:SetFontSize( 22 * _1080p )
	Amount:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Amount:SetAlignment( LUI.Alignment.Right )
	Amount:SetOptOutRightToLeftAlignmentFlip( true )
	Amount:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -250, _1080p * -30, _1080p * -11, _1080p * 11 )
	self:addElement( Amount )
	self.Amount = Amount
	
	PostLoadFunc( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "OpenFortuneCardPackButton", OpenFortuneCardPackButton )
LockTable( _M )
