local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = f1_arg0.SelectLoadoutButton
	f1_local0.actionSFX = "ui_select_screen_return"
	f1_local0:addEventHandler( "button_action", function ( f2_arg0, f2_arg1 )
		local f2_local0 = LUI.FlowManager.GetScopedData( f2_arg0 )
		if not f2_local0.openedLoadoutEdit then
			ACTIONS.LoseFocus( f1_local0, "", f1_arg1 )
			ACTIONS.OpenLoadoutEditMenu( f1_local0, true )
		end
	end )
	f1_local0:addEventHandler( "button_over", function ( f3_arg0, f3_arg1 )
		FrontEndScene.SetScene( "create_a_class" )
		local f3_local0 = f1_arg0:GetCurrentMenu()
		if Engine.IsPC() and f3_local0 then
			ACTIONS.AddLoadoutOptionPrompt( f3_local0, f1_arg1 )
		end
	end )
end

function SelectLoadoutButtonWrapper( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 360 * _1080p, 0, 30 * _1080p )
	self.id = "SelectLoadoutButtonWrapper"
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local SelectLoadoutButton = nil
	
	SelectLoadoutButton = MenuBuilder.BuildRegisteredType( "SelectLoadoutButton", {
		controllerIndex = f4_local1
	} )
	SelectLoadoutButton.id = "SelectLoadoutButton"
	SelectLoadoutButton:SetDataSourceThroughElement( self, nil )
	SelectLoadoutButton.buttonDescription = Engine.Localize( "LUA_MENU_MP_LOADOUT_SELECT_LOADOUTS" )
	SelectLoadoutButton:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 360, 0, 0 )
	self:addElement( SelectLoadoutButton )
	self.SelectLoadoutButton = SelectLoadoutButton
	
	SelectLoadoutButton:SetDataSourceThroughElement( self, nil )
	PostLoadFunc( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "SelectLoadoutButtonWrapper", SelectLoadoutButtonWrapper )
LockTable( _M )
