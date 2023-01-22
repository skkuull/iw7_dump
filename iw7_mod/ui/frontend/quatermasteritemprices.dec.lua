local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.CraftingCurrencyCount )
	assert( f1_arg0.InGameCurrencyCount )
	assert( f1_arg0.PremiumCurrencyCount )
	f1_arg0.CraftingCurrencyCount.currencyVisible = true
	f1_arg0.InGameCurrencyCount.currencyVisible = true
	f1_arg0.PremiumCurrencyCount.currencyVisible = true
	f1_arg0:SetAlignment( LUI.Alignment.Bottom )
	local f1_local0 = function ()
		local f2_local0 = f1_arg0:GetDataSource()
		f2_local0 = f2_local0.scrapCost:GetValue( f1_arg1 )
		local f2_local1 = f1_arg0:GetDataSource()
		f2_local1 = f2_local1.cost:GetValue( f1_arg1 )
		local f2_local2 = f1_arg0:GetDataSource()
		f2_local2 = f2_local2.premiumCost:GetValue( f1_arg1 )
		local f2_local3 = Engine.GetDvarInt( "loot_crate_cost_overide" )
		if not f1_arg0.ignoreCostOverride and f2_local2 > 0 and f2_local3 > 0 then
			f2_local2 = f2_local3
		end
		if f2_local0 > 0 then
			if not f1_arg0.CraftingCurrencyCount.currencyVisible then
				f1_arg0.CraftingCurrencyCount.currencyVisible = true
				f1_arg0:addElement( f1_arg0.CraftingCurrencyCount )
			end
			if DataSources.frontEnd.MP.commerce.craftingCurrency:GetValue( f1_arg1 ) < f2_local0 then
				f1_arg0.CraftingCurrencyCount.CurrencyCount:SetRGBFromTable( SWATCHES.MPArmory.PriceCannotBuy, 0 )
			else
				f1_arg0.CraftingCurrencyCount.CurrencyCount:SetRGBFromTable( COLORS.white, 0 )
			end
		elseif f1_arg0.CraftingCurrencyCount.currencyVisible then
			f1_arg0.CraftingCurrencyCount.currencyVisible = false
			f1_arg0:removeElement( f1_arg0.CraftingCurrencyCount )
		end
		if f2_local1 > 0 then
			if not f1_arg0.InGameCurrencyCount.currencyVisible then
				f1_arg0.InGameCurrencyCount.currencyVisible = true
				f1_arg0:addElement( f1_arg0.InGameCurrencyCount )
			end
			if DataSources.frontEnd.MP.commerce.inGameCurrency:GetValue( f1_arg1 ) < f2_local1 then
				f1_arg0.InGameCurrencyCount.CurrencyCount:SetRGBFromTable( SWATCHES.MPArmory.PriceCannotBuy, 0 )
			else
				f1_arg0.InGameCurrencyCount.CurrencyCount:SetRGBFromTable( COLORS.white, 0 )
			end
		elseif f1_arg0.InGameCurrencyCount.currencyVisible then
			f1_arg0.InGameCurrencyCount.currencyVisible = false
			f1_arg0:removeElement( f1_arg0.InGameCurrencyCount )
		end
		if f2_local2 > 0 then
			if not f1_arg0.PremiumCurrencyCount.currencyVisible then
				f1_arg0.PremiumCurrencyCount.currencyVisible = true
				f1_arg0:addElement( f1_arg0.PremiumCurrencyCount )
			end
			local f2_local4 = DataSources.frontEnd.MP.commerce.premiumCurrency:GetValue( f1_arg1 )
			f1_arg0.PremiumCurrencyCount.CODPointsValue:setText( f2_local2, 0 )
			if f2_local4 < f2_local2 then
				f1_arg0.PremiumCurrencyCount.CODPointsValue:SetRGBFromTable( SWATCHES.MPArmory.PriceCannotBuy, 0 )
			elseif not f1_arg0.ignoreCostOverride and f2_local3 > 0 then
				f1_arg0.PremiumCurrencyCount.CODPointsValue:SetRGBFromTable( COLORS.green, 0 )
			else
				f1_arg0.PremiumCurrencyCount.CODPointsValue:SetRGBFromTable( COLORS.white, 0 )
			end
		elseif f1_arg0.PremiumCurrencyCount.currencyVisible then
			f1_arg0.PremiumCurrencyCount.currencyVisible = false
			f1_arg0:removeElement( f1_arg0.PremiumCurrencyCount )
		end
	end
	
	local f1_local1 = DataSources.frontEnd.MP.commerce.inGameCurrency
	local f1_local2 = DataSources.frontEnd.MP.commerce.premiumCurrency
	local f1_local3 = DataSources.frontEnd.MP.commerce.craftingCurrency
	f1_arg0:SubscribeToModel( f1_local1:GetModel( f1_arg1 ), f1_local0, true )
	f1_arg0:SubscribeToModel( f1_local2:GetModel( f1_arg1 ), f1_local0, true )
	f1_arg0:SubscribeToModel( f1_local3:GetModel( f1_arg1 ), f1_local0, true )
	f1_arg0:SubscribeToModelThroughElement( f1_arg0, "cost", f1_local0 )
end

function QuatermasterItemPrices( menu, controller )
	local self = LUI.UIVerticalStackedLayout.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 100 * _1080p, 0, 108 * _1080p )
	self.id = "QuatermasterItemPrices"
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local CraftingCurrencyCount = nil
	
	CraftingCurrencyCount = MenuBuilder.BuildRegisteredType( "ScrapCurrencyCount", {
		controllerIndex = f3_local1
	} )
	CraftingCurrencyCount.id = "CraftingCurrencyCount"
	CraftingCurrencyCount:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 36 )
	CraftingCurrencyCount:SubscribeToModelThroughElement( self, "scrapCost", function ()
		local f4_local0 = self:GetDataSource()
		f4_local0 = f4_local0.scrapCost:GetValue( f3_local1 )
		if f4_local0 ~= nil then
			CraftingCurrencyCount.CurrencyCount:setText( f4_local0, 0 )
		end
	end )
	self:addElement( CraftingCurrencyCount )
	self.CraftingCurrencyCount = CraftingCurrencyCount
	
	local InGameCurrencyCount = nil
	
	InGameCurrencyCount = MenuBuilder.BuildRegisteredType( "InGameCurrencyCount", {
		controllerIndex = f3_local1
	} )
	InGameCurrencyCount.id = "InGameCurrencyCount"
	InGameCurrencyCount:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 36, _1080p * 72 )
	InGameCurrencyCount:SubscribeToModelThroughElement( self, "cost", function ()
		local f5_local0 = self:GetDataSource()
		f5_local0 = f5_local0.cost:GetValue( f3_local1 )
		if f5_local0 ~= nil then
			InGameCurrencyCount.CurrencyCount:setText( f5_local0, 0 )
		end
	end )
	self:addElement( InGameCurrencyCount )
	self.InGameCurrencyCount = InGameCurrencyCount
	
	local PremiumCurrencyCount = nil
	
	PremiumCurrencyCount = MenuBuilder.BuildRegisteredType( "PremiumCurrencyCount", {
		controllerIndex = f3_local1
	} )
	PremiumCurrencyCount.id = "PremiumCurrencyCount"
	PremiumCurrencyCount:SetDataSource( DataSources.frontEnd.MP.commerce.premiumCurrency, f3_local1 )
	PremiumCurrencyCount:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 72, _1080p * 108 )
	self:addElement( PremiumCurrencyCount )
	self.PremiumCurrencyCount = PremiumCurrencyCount
	
	PremiumCurrencyCount:SetDataSource( DataSources.frontEnd.MP.commerce.premiumCurrency, f3_local1 )
	f0_local0( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "QuatermasterItemPrices", QuatermasterItemPrices )
LockTable( _M )
