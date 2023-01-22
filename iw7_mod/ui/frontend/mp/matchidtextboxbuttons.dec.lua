local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function MatchIDTextBoxButtons( menu, controller )
	local self = LUI.UIHorizontalNavigator.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 378 * _1080p, 0, 86 * _1080p )
	self.id = "MatchIDTextBoxButtons"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local ConfirmButton = nil
	
	ConfirmButton = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f1_local1
	} )
	ConfirmButton.id = "ConfirmButton"
	ConfirmButton.Text:setText( ToUpperCase( Engine.Localize( "MENU_OK" ) ), 0 )
	ConfirmButton:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 200, _1080p * 18, _1080p * 68 )
	self:addElement( ConfirmButton )
	self.ConfirmButton = ConfirmButton
	
	local CancelButton = nil
	
	CancelButton = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f1_local1
	} )
	CancelButton.id = "CancelButton"
	CancelButton.buttonDescription = Engine.Localize( "MENU_CANCEL" )
	CancelButton.Text:setText( ToUpperCase( Engine.Localize( "MENU_CANCEL" ) ), 0 )
	CancelButton:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 210, _1080p * 410, _1080p * 18, _1080p * 68 )
	self:addElement( CancelButton )
	self.CancelButton = CancelButton
	
	return self
end

MenuBuilder.registerType( "MatchIDTextBoxButtons", MatchIDTextBoxButtons )
LockTable( _M )
