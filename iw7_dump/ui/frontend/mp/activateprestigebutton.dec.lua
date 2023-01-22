local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = nil
	if Engine.IsAliensMode() then
		f1_local0 = DataSources.frontEnd.CP.prestigeMenu.canActivate:GetValue( f1_arg1 )
	else
		f1_local0 = DataSources.frontEnd.MP.prestigeMenu.canActivate:GetValue( f1_arg1 )
	end
	if f1_local0 ~= nil then
		f1_arg0:SetButtonDisabled( not f1_local0 )
	end
end

function ActivatePrestigeButton( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 600 * _1080p, 0, 600 * _1080p )
	self.id = "ActivatePrestigeButton"
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local GenericButton = nil
	
	GenericButton = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f2_local1
	} )
	GenericButton.id = "GenericButton"
	GenericButton.Text:setText( ToUpperCase( "Activate Prestige" ), 0 )
	GenericButton:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 600, 0, _1080p * 600 )
	self:addElement( GenericButton )
	self.GenericButton = GenericButton
	
	self:addEventHandler( "button_action", function ( f3_arg0, f3_arg1 )
		ACTIONS.ActivatePrestige( self, f3_arg1.controller or f2_local1 )
	end )
	f0_local0( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "ActivatePrestigeButton", ActivatePrestigeButton )
LockTable( _M )
