local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PurchaseLootCratePopup( f1_arg0, f1_arg1 )
	local f1_local0 = f1_arg1.controllerIndex
	local f1_local1 = MenuBuilder.BuildRegisteredType( "PurchaseButtonsWithCurrencyList", {
		controllerIndex = f1_local0
	} )
	local f1_local2 = f1_arg1.lastCurrencyUsed
	if f1_local2 == ARMORY.currencyType.COD_POINTS then
		f1_local1.PurchaseWithPoints.listDefaultFocus = true
	elseif f1_local2 == ARMORY.currencyType.KEYS then
		f1_local1.PurchaseWithKeys.listDefaultFocus = true
	elseif f1_local2 == ARMORY.currencyType.SALVAGE then
		f1_local1.PurchaseWithSalvage.listDefaultFocus = true
	end
	local f1_local3 = MenuBuilder.BuildRegisteredType( "PurchaseLootPopupCurrencies", {
		controllerIndex = f1_local0
	} )
	f1_local3:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -315, _1080p * 315, _1080p * -98, _1080p * -58 )
	local self = LUI.UIImage.new()
	self:SetRGBFromInt( 0, 0 )
	self:SetAlpha( 0.6, 0 )
	self:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -325, _1080p * 325, _1080p * -100, _1080p * -60 )
	local f1_local5 = MenuBuilder.BuildRegisteredType( "PurchaseLootPopupContent", {
		controllerIndex = f1_local0
	} )
	f1_local5.Image:setImage( RegisterMaterial( f1_arg1.crateImage ), 0 )
	if f1_arg1.useWideImage then
		f1_local5.Image:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -248, _1080p * 248, _1080p * -64, _1080p * 64 )
		f1_local5.Image:SetUMin( 0 )
		f1_local5.Image:SetUMax( 0.86 )
		f1_local5.Image:SetVMin( 0.18 )
		f1_local5.Image:SetVMax( 1 )
	end
	local f1_local6 = {
		controllerIndex = f1_local0,
		title = f1_arg1.crateString,
		width = _1080p * 630,
		defaultFocusIndex = 1,
		cancelClosesPopup = true,
		listContent = {
			f1_local5,
			f1_local1
		}
	}
	local f1_local7 = DataSources.frontEnd.MP.commerce.inGameCurrency:GetValue( f1_local0 )
	local f1_local8 = DataSources.frontEnd.MP.commerce.premiumCurrency:GetValue( f1_local0 )
	local f1_local9 = DataSources.frontEnd.MP.commerce.craftingCurrency:GetValue( f1_local0 )
	local f1_local10
	if f1_arg1.premiumCost > 0 then
		f1_local10 = CONDITIONS.AreCODPointsEnabled()
	else
		f1_local10 = false
	end
	local f1_local11 = f1_local10 and f1_arg1.premiumCost <= f1_local8
	local f1_local12
	if f1_arg1.keysCost <= 0 or f1_arg1.keysCost > f1_local7 then
		f1_local12 = false
	else
		f1_local12 = true
	end
	local f1_local13
	if f1_arg1.salvageCost <= 0 or f1_arg1.salvageCost > f1_local9 then
		f1_local13 = false
	else
		f1_local13 = true
	end
	if f1_local10 then
		f1_local1.PurchaseWithPoints.CostLabel:setText( f1_arg1.premiumCost )
		if f1_local11 then
			ARMORY.SetupLootCratePopup( f1_local0, f1_local1.PurchaseWithPoints.PurchaseButton, true, f1_arg1.purchaseLootCrateAction, f1_arg1.crateID )
		else
			f1_local1.PurchaseWithPoints.CostLabel:SetRGBFromTable( SWATCHES.MPArmory.PriceCannotBuy, 0 )
			f1_local1.PurchaseWithPoints.PurchaseButton.Label:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_PURCHASE_COD_POINTS" ) ), 0 )
			f1_local1.PurchaseWithPoints.PurchaseButton:addEventHandler( "button_action", function ( f2_arg0, f2_arg1 )
				local f2_local0 = STORE.GoToCODPointsOnlyStore
				local f2_local1 = f1_local0
				local f2_local2 = f2_arg0:GetCurrentMenu()
				f2_local0( f2_local1, f2_local2.id, f2_arg0.id )
				LUI.FlowManager.RequestLeaveMenu( f2_arg0, true )
			end )
			if not CONDITIONS.IsStoreAllowed() then
				f1_local1.PurchaseWithPoints.PurchaseButton:SetButtonDisabled( true )
			end
		end
	else
		f1_local1:removeElement( f1_local1.PurchaseWithPoints )
		f1_local3:removeElement( f1_local3.PremiumCurrencyCount )
	end
	if f1_local12 then
		ARMORY.SetupLootCratePopup( f1_local0, f1_local1.PurchaseWithKeys.PurchaseButton, false, f1_arg1.purchaseLootCrateAction, f1_arg1.crateID )
		f1_local1.PurchaseWithKeys.CostLabel:setText( f1_arg1.keysCost )
	else
		f1_local1:removeElement( f1_local1.PurchaseWithKeys )
		f1_local3:removeElement( f1_local3.InGameCurrencyCount )
	end
	if f1_local13 then
		ARMORY.SetupLootCratePopup( f1_local0, f1_local1.PurchaseWithSalvage.PurchaseButton, false, f1_arg1.purchaseLootCrateAction, f1_arg1.crateID )
		f1_local1.PurchaseWithSalvage.CostLabel:setText( f1_arg1.salvageCost )
	else
		f1_local1:removeElement( f1_local1.PurchaseWithSalvage )
		f1_local3:removeElement( f1_local3.CraftingCurrencyCount )
	end
	local f1_local14 = MenuBuilder.BuildRegisteredType( "PopupList", f1_local6 )
	f1_local14.id = "PurchaseLootCratePopup"
	f1_local14.frame:addElement( self )
	f1_local14.frame:addElement( f1_local3 )
	return f1_local14
end

MenuBuilder.registerType( "PurchaseLootCratePopup", PurchaseLootCratePopup )
LockTable( _M )
