local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0.SelectLoadoutButton:addEventHandler( "button_action", function ( f2_arg0, f2_arg1 )
		local f2_local0 = REG3:GetDataSource()
		f2_local0 = f2_local0.loadoutIndex
		if Engine.GetDvarBool( "giving_mission_reward" ) == true then
			return 
		else
			ACTIONS.LeaveMenu( f1_arg0 )
			MatchSimulator.loadoutSelected( f1_arg1 )
		end
	end )
end

function MatchSimLoadoutSelectButtonWrapper( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 450 * _1080p, 0, 60 * _1080p )
	self.id = "MatchSimLoadoutSelectButtonWrapper"
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local SelectLoadoutButton = nil
	
	SelectLoadoutButton = MenuBuilder.BuildRegisteredType( "SelectLoadoutButton", {
		controllerIndex = f3_local1
	} )
	SelectLoadoutButton.id = "SelectLoadoutButton"
	SelectLoadoutButton:SetDataSourceThroughElement( self, nil )
	SelectLoadoutButton:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 360, 0, 0 )
	self:addElement( SelectLoadoutButton )
	self.SelectLoadoutButton = SelectLoadoutButton
	
	SelectLoadoutButton:SetDataSourceThroughElement( self, nil )
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "MatchSimLoadoutSelectButtonWrapper", MatchSimLoadoutSelectButtonWrapper )
LockTable( _M )
