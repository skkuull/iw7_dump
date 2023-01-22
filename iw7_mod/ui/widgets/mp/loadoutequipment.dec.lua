local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function LoadoutEquipment( menu, controller )
	local self = LUI.UIVerticalNavigator.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 295 * _1080p, 0, 208 * _1080p )
	self.id = "LoadoutEquipment"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local PowerSlotTwo = nil
	
	PowerSlotTwo = MenuBuilder.BuildRegisteredType( "FramedPowerButtons", {
		controllerIndex = f1_local1
	} )
	PowerSlotTwo.id = "PowerSlotTwo"
	PowerSlotTwo:SetDataSourceThroughElement( self, "powerSlotTwo" )
	PowerSlotTwo.PowerButton:SetDataSourceThroughElement( self, "powerSlotTwo" )
	PowerSlotTwo.ExtraPowerButton:SetDataSourceThroughElement( self, "powerSlotTwo" )
	PowerSlotTwo.FrameLabel:setText( ToUpperCase( Engine.Localize( "LUA_MENU_TACTICAL_CAPS" ) ), 0 )
	PowerSlotTwo:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 148.5, _1080p * 295, 0, _1080p * 206 )
	self:addElement( PowerSlotTwo )
	self.PowerSlotTwo = PowerSlotTwo
	
	local PowerSlotOne = nil
	
	PowerSlotOne = MenuBuilder.BuildRegisteredType( "FramedPowerButtons", {
		controllerIndex = f1_local1
	} )
	PowerSlotOne.id = "PowerSlotOne"
	PowerSlotOne:SetDataSourceThroughElement( self, "powerSlotOne" )
	PowerSlotOne.PowerButton:SetDataSourceThroughElement( self, "powerSlotOne" )
	PowerSlotOne.ExtraPowerButton:SetDataSourceThroughElement( self, "powerSlotOne" )
	PowerSlotOne.FrameLabel:setText( ToUpperCase( Engine.Localize( "MENU_LETHAL_CAPS" ) ), 0 )
	PowerSlotOne:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 146.5, 0, _1080p * 206 )
	self:addElement( PowerSlotOne )
	self.PowerSlotOne = PowerSlotOne
	
	PowerSlotTwo:addEventHandler( "button_over", function ( f2_arg0, f2_arg1 )
		local f2_local0 = f2_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "ButtonOver" )
	end )
	PowerSlotTwo:addEventHandler( "button_up", function ( f3_arg0, f3_arg1 )
		local f3_local0 = f3_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "ButtonUp" )
	end )
	PowerSlotOne:addEventHandler( "button_over", function ( f4_arg0, f4_arg1 )
		local f4_local0 = f4_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "ButtonOver" )
	end )
	PowerSlotOne:addEventHandler( "button_up", function ( f5_arg0, f5_arg1 )
		local f5_local0 = f5_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "ButtonUp" )
	end )
	PowerSlotTwo:SetDataSourceThroughElement( self, "powerSlotTwo" )
	PowerSlotOne:SetDataSourceThroughElement( self, "powerSlotOne" )
	return self
end

MenuBuilder.registerType( "LoadoutEquipment", LoadoutEquipment )
LockTable( _M )
