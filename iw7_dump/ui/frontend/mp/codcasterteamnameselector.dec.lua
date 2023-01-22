local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:registerEventHandler( "button_down", function ( element, event )
		OSK.OpenScreenKeyboard( f1_arg1, Engine.Localize( "CODCASTER_TEAM_NAME" ), element.TeamName:getText(), 12, false, true, false, function ( f3_arg0, f3_arg1, f3_arg2 )
			if f3_arg1 ~= nil and f3_arg1 ~= "" then
				element.TeamName:setText( f3_arg1 )
				element:dispatchEventToCurrentMenu( {
					name = "update_team_name",
					teamName = f3_arg1
				} )
			end
		end, CoD.KeyboardInputTypes.Normal )
	end )
end

function CodCasterTeamNameSelector( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 500 * _1080p, 0, 50 * _1080p )
	self.id = "CodCasterTeamNameSelector"
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local TeamName = nil
	
	TeamName = LUI.UIText.new()
	TeamName.id = "TeamName"
	TeamName:setText( Engine.Localize( "MENU_NEW" ), 0 )
	TeamName:SetFontSize( 50 * _1080p )
	TeamName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	TeamName:SetAlignment( LUI.Alignment.Left )
	TeamName:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 30, _1080p * 500, 0, _1080p * 50 )
	self:addElement( TeamName )
	self.TeamName = TeamName
	
	local GenericButtonSelection = nil
	
	GenericButtonSelection = MenuBuilder.BuildRegisteredType( "GenericButtonSelection", {
		controllerIndex = f4_local1
	} )
	GenericButtonSelection.id = "GenericButtonSelection"
	GenericButtonSelection:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, 0, _1080p * 50 )
	self:addElement( GenericButtonSelection )
	self.GenericButtonSelection = GenericButtonSelection
	
	f0_local0( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "CodCasterTeamNameSelector", CodCasterTeamNameSelector )
LockTable( _M )
