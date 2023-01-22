local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ArmoryRowSupplyDrops( menu, controller )
	local self = LUI.UIHorizontalList.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 680 * _1080p, 0, 200 * _1080p )
	self.id = "ArmoryRowSupplyDrops"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	self:SetSpacing( 10 * _1080p )
	local PurchaseCommonCrate = nil
	
	PurchaseCommonCrate = MenuBuilder.BuildRegisteredType( "PurchaseLootCrateButton", {
		controllerIndex = f1_local1
	} )
	PurchaseCommonCrate.id = "PurchaseCommonCrate"
	PurchaseCommonCrate.buttonDescription = Engine.Localize( "LUA_MENU_MP_COMMON_SUPPLY_DESC" )
	PurchaseCommonCrate.CaCButtonBaseImage.Image:setImage( RegisterMaterial( "armory_loot_crate_common" ), 0 )
	PurchaseCommonCrate.CaCButtonBaseImage.Name:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_SUPPLY_DROP_COMMON" ) ), 0 )
	PurchaseCommonCrate:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 335, 0, _1080p * 200 )
	self:addElement( PurchaseCommonCrate )
	self.PurchaseCommonCrate = PurchaseCommonCrate
	
	local PurchaseRareCrate = nil
	
	PurchaseRareCrate = MenuBuilder.BuildRegisteredType( "PurchaseLootCrateButton", {
		controllerIndex = f1_local1
	} )
	PurchaseRareCrate.id = "PurchaseRareCrate"
	PurchaseRareCrate.buttonDescription = Engine.Localize( "LUA_MENU_MP_RARE_SUPPLY_DESC" )
	PurchaseRareCrate.CaCButtonBaseImage.Image:setImage( RegisterMaterial( "armory_loot_crate_rare" ), 0 )
	PurchaseRareCrate.CaCButtonBaseImage.Name:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_SUPPLY_DROP_RARE" ) ), 0 )
	PurchaseRareCrate:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 345, _1080p * 680, 0, _1080p * 200 )
	self:addElement( PurchaseRareCrate )
	self.PurchaseRareCrate = PurchaseRareCrate
	
	return self
end

MenuBuilder.registerType( "ArmoryRowSupplyDrops", ArmoryRowSupplyDrops )
LockTable( _M )
