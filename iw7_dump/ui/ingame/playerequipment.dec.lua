local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PlayerEquipment( menu, controller )
	local self = LUI.UIHorizontalStackedLayout.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 125 * _1080p, 0, 60 * _1080p )
	self.id = "PlayerEquipment"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	self:SetSpacing( 5 * _1080p )
	local TacticalSlot = nil
	
	TacticalSlot = MenuBuilder.BuildRegisteredType( "PlayerEquipmentBase", {
		controllerIndex = f1_local1
	} )
	TacticalSlot.id = "TacticalSlot"
	TacticalSlot:SetDataSource( DataSources.inGame.player.secondaryPower, f1_local1 )
	TacticalSlot:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 75, _1080p * 135, 0, _1080p * 60 )
	self:addElement( TacticalSlot )
	self.TacticalSlot = TacticalSlot
	
	local LethalSlot = nil
	
	LethalSlot = MenuBuilder.BuildRegisteredType( "PlayerEquipmentBase", {
		controllerIndex = f1_local1
	} )
	LethalSlot.id = "LethalSlot"
	LethalSlot:SetDataSource( DataSources.inGame.player.primaryPower, f1_local1 )
	LethalSlot:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 60, 0, _1080p * 60 )
	self:addElement( LethalSlot )
	self.LethalSlot = LethalSlot
	
	TacticalSlot:SetDataSource( DataSources.inGame.player.secondaryPower, f1_local1 )
	LethalSlot:SetDataSource( DataSources.inGame.player.primaryPower, f1_local1 )
	return self
end

MenuBuilder.registerType( "PlayerEquipment", PlayerEquipment )
LockTable( _M )
