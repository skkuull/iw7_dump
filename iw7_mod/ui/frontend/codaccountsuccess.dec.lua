local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
LUI.FlowManager.RegisterFenceGroup( "CODAccountSuccessPopup", {
	"codAccountSignIn"
} )
function CODAccountSuccess( menu, controller )
	local self = LUI.UIVerticalNavigator.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 600 * _1080p, 0, 150 * _1080p )
	self.id = "CODAccountSuccess"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Text = nil
	
	Text = LUI.UIText.new()
	Text.id = "Text"
	Text:setText( Engine.Localize( "CODACCOUNT_CODA_LINK_SUCCESS" ), 0 )
	Text:SetFontSize( 22 * _1080p )
	Text:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Text:SetAlignment( LUI.Alignment.Left )
	Text:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 16, _1080p * -16, _1080p * 18, _1080p * 40 )
	self:addElement( Text )
	self.Text = Text
	
	local ContinueButton = nil
	
	ContinueButton = MenuBuilder.BuildRegisteredType( "PopupButton", {
		controllerIndex = f1_local1
	} )
	ContinueButton.id = "ContinueButton"
	ContinueButton.Label:setText( ToUpperCase( Engine.Localize( "LUA_MENU_CONTINUE" ) ), 0 )
	ContinueButton.Label:SetAlignment( LUI.Alignment.Left )
	ContinueButton:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 16, _1080p * -16, _1080p * 100, _1080p * 130 )
	self:addElement( ContinueButton )
	self.ContinueButton = ContinueButton
	
	ContinueButton:addEventHandler( "button_action", function ( f2_arg0, f2_arg1 )
		local f2_local0 = f2_arg1.controller or f1_local1
		ACTIONS.LeaveMenu( self )
		ACTIONS.LeaveMenuByName( "CODAccountRegistration" )
		ACTIONS.LeaveMenuByName( "CODAccountSignInPopup" )
	end )
	return self
end

MenuBuilder.registerType( "CODAccountSuccess", CODAccountSuccess )
LockTable( _M )
