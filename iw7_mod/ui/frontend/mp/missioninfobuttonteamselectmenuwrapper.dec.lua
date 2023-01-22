local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	f1_arg0.MissionInfoButton:SetDataSourceThroughElement( f1_arg0, nil )
	f1_arg0.MissionInfoButton.MissionArrowButton:addEventHandler( "button_action", function ( f2_arg0, f2_arg1 )
		local f2_local0 = f1_arg0.MissionInfoButton:GetDataSource()
		MissionDirector.SetActiveMissionTeam( f1_arg1, f2_local0.teamID:GetValue( f1_arg1 ) )
		ACTIONS.LeaveMenu( f1_arg0 )
	end )
end

function MissionInfoButtonTeamSelectMenuWrapper( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 500 * _1080p, 0, 120 * _1080p )
	self.id = "MissionInfoButtonTeamSelectMenuWrapper"
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local MissionInfoButton = nil
	
	MissionInfoButton = MenuBuilder.BuildRegisteredType( "MissionInfoButton", {
		controllerIndex = f3_local1
	} )
	MissionInfoButton.id = "MissionInfoButton"
	MissionInfoButton:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, 0, _1080p * 120 )
	self:addElement( MissionInfoButton )
	self.MissionInfoButton = MissionInfoButton
	
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "MissionInfoButtonTeamSelectMenuWrapper", MissionInfoButtonTeamSelectMenuWrapper )
LockTable( _M )
