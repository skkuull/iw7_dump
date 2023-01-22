local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function SelectMissionTeam( f1_arg0, f1_arg1 )
	local f1_local0 = f1_arg0:GetDataSource()
	f1_local0 = f1_local0.index:GetValue( f1_arg1 )
	assert( f1_local0 )
	MissionDirector.SetActiveMissionTeam( f1_arg1, f1_local0 )
end

function PostLoadFunc( f2_arg0, f2_arg1 )
	assert( f2_arg0.Button )
	f2_arg0.Button:registerEventHandler( "button_action", function ( element, event )
		SelectMissionTeam( f2_arg0, f2_arg1 )
		LUI.FlowManager.RequestLeaveMenu( f2_arg0 )
	end )
	f2_arg0.Button:registerEventHandler( "button_over", function ( element, event )
		local f4_local0 = f2_arg0:GetDataSource()
		f4_local0 = f4_local0.index:GetValue( f2_arg1 )
		assert( f4_local0 )
		Engine.SetFrontEndSceneSection( "mission_team_lobby", f4_local0 )
	end )
end

function MissionTeamButton( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 500 * _1080p, 0, 60 * _1080p )
	self.id = "MissionTeamButton"
	local f5_local1 = controller and controller.controllerIndex
	if not f5_local1 and not Engine.InFrontend() then
		f5_local1 = self:getRootController()
	end
	assert( f5_local1 )
	local f5_local2 = self
	local Button = nil
	
	Button = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f5_local1
	} )
	Button.id = "Button"
	Button:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	Button:SubscribeToModelThroughElement( self, "name", function ()
		local f6_local0 = self:GetDataSource()
		f6_local0 = f6_local0.name:GetValue( f5_local1 )
		if f6_local0 ~= nil then
			Button.Text:setText( f6_local0, 0 )
		end
	end )
	self:addElement( Button )
	self.Button = Button
	
	PostLoadFunc( self, f5_local1, controller )
	return self
end

MenuBuilder.registerType( "MissionTeamButton", MissionTeamButton )
LockTable( _M )
