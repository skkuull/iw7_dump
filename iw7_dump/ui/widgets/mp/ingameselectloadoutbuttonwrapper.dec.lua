local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0.SelectLoadoutButton:addEventHandler( "button_action", function ( f2_arg0, f2_arg1 )
		local f2_local0 = REG3:GetDataSource()
		f2_local0 = f2_local0.scriptLoadoutID
		DataSources.inGame.MP.selectedLoadout:SetValue( f1_arg1, f2_local0 )
		Engine.NotifyServer( "class_select", f2_local0 )
		LUI.FlowManager.RequestCloseAllMenus()
		LUI.RigBootup.Start()
	end )
	if CONDITIONS.IsSplitscreen() then
		f1_arg0:registerEventHandler( "grid_anim", function ( element, event )
			element:SetAlpha( event.value )
		end )
	end
end

function InGameSelectLoadoutButtonWrapper( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 360 * _1080p, 0, 30 * _1080p )
	self.id = "InGameSelectLoadoutButtonWrapper"
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
	SelectLoadoutButton:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( SelectLoadoutButton )
	self.SelectLoadoutButton = SelectLoadoutButton
	
	SelectLoadoutButton:SetDataSourceThroughElement( self, nil )
	PostLoadFunc( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "InGameSelectLoadoutButtonWrapper", InGameSelectLoadoutButtonWrapper )
LockTable( _M )
