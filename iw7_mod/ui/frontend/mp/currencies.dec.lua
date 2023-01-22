local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function Currencies( menu, controller )
	local self = LUI.UIHorizontalNavigator.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 104 * _1080p, 0, 50 * _1080p )
	self.id = "Currencies"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local CraftingCurrencyCount = nil
	
	CraftingCurrencyCount = MenuBuilder.BuildRegisteredType( "CraftingCurrencyCount", {
		controllerIndex = f1_local1
	} )
	CraftingCurrencyCount.id = "CraftingCurrencyCount"
	CraftingCurrencyCount:SetDataSource( DataSources.frontEnd.MP.commerce.craftingCurrency, f1_local1 )
	CraftingCurrencyCount:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 50, 0, _1080p * 50 )
	CraftingCurrencyCount:SubscribeToModelThroughElement( self, "DataSources.frontEnd.MP.commerce.craftingCurrency", function ()
		local f2_local0 = self:GetDataSource()
		f2_local0 = f2_local0.DataSources.frontEnd.MP.commerce.craftingCurrency:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			CraftingCurrencyCount.CurrencyCount:setText( f2_local0, 0 )
		end
	end )
	self:addElement( CraftingCurrencyCount )
	self.CraftingCurrencyCount = CraftingCurrencyCount
	
	local InGameCurrencyCount = nil
	
	InGameCurrencyCount = MenuBuilder.BuildRegisteredType( "InGameCurrencyCount", {
		controllerIndex = f1_local1
	} )
	InGameCurrencyCount.id = "InGameCurrencyCount"
	InGameCurrencyCount:SetDataSource( DataSources.frontEnd.MP.commerce.inGameCurrency, f1_local1 )
	InGameCurrencyCount:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 54, _1080p * 104, 0, _1080p * 50 )
	InGameCurrencyCount:SubscribeToModelThroughElement( self, "DataSources.frontEnd.MP.armory.commonCrate.cost", function ()
		local f3_local0 = self:GetDataSource()
		f3_local0 = f3_local0.DataSources.frontEnd.MP.armory.commonCrate.cost:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			InGameCurrencyCount.CurrencyCount:setText( f3_local0, 0 )
		end
	end )
	self:addElement( InGameCurrencyCount )
	self.InGameCurrencyCount = InGameCurrencyCount
	
	CraftingCurrencyCount:SetDataSource( DataSources.frontEnd.MP.commerce.craftingCurrency, f1_local1 )
	InGameCurrencyCount:SetDataSource( DataSources.frontEnd.MP.commerce.inGameCurrency, f1_local1 )
	return self
end

MenuBuilder.registerType( "Currencies", Currencies )
LockTable( _M )
