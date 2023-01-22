local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0.Slot1.Text:SetRight( _1080p * -310, 0 )
	f1_arg0.Slot2.Text:SetRight( _1080p * -310, 0 )
	f1_arg0.Slot3.Text:SetRight( _1080p * -310, 0 )
	f1_arg0.Slot4.Text:SetRight( _1080p * -310, 0 )
end

function RigCustomizationTauntSlotsList( menu, controller )
	local self = LUI.UIVerticalList.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 635 * _1080p, 0, 141 * _1080p )
	self.id = "RigCustomizationTauntSlotsList"
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	self:SetSpacing( 7 * _1080p )
	local Slot1 = nil
	
	Slot1 = MenuBuilder.BuildRegisteredType( "GenericDualLabelButton", {
		controllerIndex = f2_local1
	} )
	Slot1.id = "Slot1"
	Slot1.Text:setText( ToUpperCase( "" ), 0 )
	Slot1.DynamicText:setText( "", 0 )
	Slot1:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 30 )
	self:addElement( Slot1 )
	self.Slot1 = Slot1
	
	local Slot2 = nil
	
	Slot2 = MenuBuilder.BuildRegisteredType( "GenericDualLabelButton", {
		controllerIndex = f2_local1
	} )
	Slot2.id = "Slot2"
	Slot2.Text:setText( ToUpperCase( "" ), 0 )
	Slot2.DynamicText:setText( "", 0 )
	Slot2:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 37, _1080p * 67 )
	self:addElement( Slot2 )
	self.Slot2 = Slot2
	
	local Slot3 = nil
	
	Slot3 = MenuBuilder.BuildRegisteredType( "GenericDualLabelButton", {
		controllerIndex = f2_local1
	} )
	Slot3.id = "Slot3"
	Slot3.Text:setText( ToUpperCase( "" ), 0 )
	Slot3.DynamicText:setText( "", 0 )
	Slot3:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 74, _1080p * 104 )
	self:addElement( Slot3 )
	self.Slot3 = Slot3
	
	local Slot4 = nil
	
	Slot4 = MenuBuilder.BuildRegisteredType( "GenericDualLabelButton", {
		controllerIndex = f2_local1
	} )
	Slot4.id = "Slot4"
	Slot4.Text:setText( ToUpperCase( "" ), 0 )
	Slot4.DynamicText:setText( "", 0 )
	Slot4:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 111, _1080p * 141 )
	self:addElement( Slot4 )
	self.Slot4 = Slot4
	
	f0_local0( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "RigCustomizationTauntSlotsList", RigCustomizationTauntSlotsList )
LockTable( _M )
