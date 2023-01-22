local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:SetAlignment( LUI.Alignment.Right )
end

function PurchaseLootPopupCurrencies( menu, controller )
	local self = LUI.UIHorizontalStackedLayout.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 320 * _1080p, 0, 36 * _1080p )
	self.id = "PurchaseLootPopupCurrencies"
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	self:SetSpacing( 10 * _1080p )
	local InGameCurrencyCount = nil
	
	InGameCurrencyCount = MenuBuilder.BuildRegisteredType( "InGameCurrencyCount", {
		controllerIndex = f2_local1
	} )
	InGameCurrencyCount.id = "InGameCurrencyCount"
	InGameCurrencyCount:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 100, 0, _1080p * 36 )
	InGameCurrencyCount:SubscribeToModel( DataSources.frontEnd.MP.commerce.inGameCurrency:GetModel( f2_local1 ), function ()
		local f3_local0 = DataSources.frontEnd.MP.commerce.inGameCurrency:GetValue( f2_local1 )
		if f3_local0 ~= nil then
			InGameCurrencyCount.CurrencyCount:setText( f3_local0, 0 )
		end
	end )
	self:addElement( InGameCurrencyCount )
	self.InGameCurrencyCount = InGameCurrencyCount
	
	local CraftingCurrencyCount = nil
	
	CraftingCurrencyCount = MenuBuilder.BuildRegisteredType( "ScrapCurrencyCount", {
		controllerIndex = f2_local1
	} )
	CraftingCurrencyCount.id = "CraftingCurrencyCount"
	CraftingCurrencyCount:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 110, _1080p * 210, 0, _1080p * 36 )
	CraftingCurrencyCount:SubscribeToModel( DataSources.frontEnd.MP.commerce.craftingCurrency:GetModel( f2_local1 ), function ()
		local f4_local0 = DataSources.frontEnd.MP.commerce.craftingCurrency:GetValue( f2_local1 )
		if f4_local0 ~= nil then
			CraftingCurrencyCount.CurrencyCount:setText( f4_local0, 0 )
		end
	end )
	self:addElement( CraftingCurrencyCount )
	self.CraftingCurrencyCount = CraftingCurrencyCount
	
	local PremiumCurrencyCount = nil
	
	PremiumCurrencyCount = MenuBuilder.BuildRegisteredType( "PremiumCurrencyCount", {
		controllerIndex = f2_local1
	} )
	PremiumCurrencyCount.id = "PremiumCurrencyCount"
	PremiumCurrencyCount:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 220, _1080p * 320, 0, _1080p * 36 )
	PremiumCurrencyCount:SubscribeToModel( DataSources.frontEnd.MP.commerce.premiumCurrency:GetModel( f2_local1 ), function ()
		local f5_local0 = DataSources.frontEnd.MP.commerce.premiumCurrency:GetValue( f2_local1 )
		if f5_local0 ~= nil then
			PremiumCurrencyCount.CODPointsValue:setText( f5_local0, 0 )
		end
	end )
	self:addElement( PremiumCurrencyCount )
	self.PremiumCurrencyCount = PremiumCurrencyCount
	
	PostLoadFunc( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "PurchaseLootPopupCurrencies", PurchaseLootPopupCurrencies )
LockTable( _M )
