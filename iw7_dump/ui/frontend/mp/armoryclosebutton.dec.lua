local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ArmoryCloseButton( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 600 * _1080p, 0, 24 * _1080p )
	self.id = "ArmoryCloseButton"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local ButtonPrompt = nil
	
	ButtonPrompt = LUI.UIStyledText.new()
	ButtonPrompt.id = "ButtonPrompt"
	ButtonPrompt:setText( Engine.Localize( "PLATFORM_CLOSE_CAPS" ), 0 )
	ButtonPrompt:SetFontSize( 24 * _1080p )
	ButtonPrompt:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ButtonPrompt:SetAlignment( LUI.Alignment.Center )
	self:addElement( ButtonPrompt )
	self.ButtonPrompt = ButtonPrompt
	
	self:addEventHandler( "button_action", function ( f2_arg0, f2_arg1 )
		local f2_local0 = f2_arg1.controller or f1_local1
		ACTIONS.LeaveMenu( self )
	end )
	return self
end

MenuBuilder.registerType( "ArmoryCloseButton", ArmoryCloseButton )
LockTable( _M )
