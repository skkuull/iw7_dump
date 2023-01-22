local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:addEventHandler( "button_action", function ( f2_arg0, f2_arg1 )
		local f2_local0 = f2_arg0:GetDataSource()
		Engine.ExecNow( "profile_setButtonsConfig " .. f2_local0.ref:GetValue( f1_arg1 ), f1_arg1 )
		ACTIONS.LeaveMenu( f2_arg0 )
	end )
	if CONDITIONS.IsSplitscreen( f1_arg0 ) then
		f1_arg0:registerEventHandler( "grid_anim", function ( element, event )
			element:SetAlpha( event.value )
		end )
	end
end

function ButtonLayoutButton( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 530 * _1080p, 0, 30 * _1080p )
	self.id = "ButtonLayoutButton"
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local GenericButton = nil
	
	GenericButton = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f4_local1
	} )
	GenericButton.id = "GenericButton"
	GenericButton:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	GenericButton:SubscribeToModelThroughElement( self, "name", function ()
		local f5_local0 = self:GetDataSource()
		f5_local0 = f5_local0.name:GetValue( f4_local1 )
		if f5_local0 ~= nil then
			GenericButton.Text:setText( ToUpperCase( f5_local0 ), 0 )
		end
	end )
	self:addElement( GenericButton )
	self.GenericButton = GenericButton
	
	f0_local0( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "ButtonLayoutButton", ButtonLayoutButton )
LockTable( _M )
