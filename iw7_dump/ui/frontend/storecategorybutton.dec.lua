local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.GenericButton )
	local f1_local0 = f1_arg0.GenericButton
	f1_arg0:SubscribeToModelThroughElement( f1_arg0, "name", function ()
		local f2_local0 = f1_arg0:GetDataSource()
		if f2_local0 and f2_local0.items then
			f1_arg0.shouldBeEnabled = f2_local0.items:GetCountValue( f1_arg1 ) > 0
			f1_local0:SetButtonDisabled( not f1_arg0.shouldBeEnabled )
		end
	end )
	f1_local0:addEventHandler( "button_action", function ( f3_arg0, f3_arg1 )
		f3_arg0:dispatchEventToCurrentMenu( {
			name = "select_store_item"
		} )
	end )
end

function StoreCategoryButton( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 500 * _1080p, 0, 30 * _1080p )
	self.id = "StoreCategoryButton"
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
	GenericButton:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 30 )
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

MenuBuilder.registerType( "StoreCategoryButton", StoreCategoryButton )
LockTable( _M )
