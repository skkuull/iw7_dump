local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "frontEnd.armory.deconstructItem"
f0_local1 = function ()
	WipeGlobalModelsAtPath( f0_local0 )
end

f0_local2 = function ( f2_arg0, f2_arg1, f2_arg2 )
	f2_arg0.YesButton:addEventHandler( "button_action", function ( f3_arg0, f3_arg1 )
		Loot.PawnChoice( f2_arg1, f2_arg2.lootItemID, 0 )
		LUI.FlowManager.RequestPopupMenu( f3_arg0, "live_dialog_text_box", true, f3_arg1.controller, true, {
			message = "Deconstructing Armory Item"
		} )
	end )
	f2_arg0:SetDataSource( {
		currency = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".currency", f2_arg2.salvageReceived ),
		newBalance = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".newBalance", DataSources.frontEnd.MP.commerce.craftingCurrency:GetValue( f2_arg1 ) + f2_arg2.salvageReceived )
	}, f2_arg1 )
end

function DeconstructArmoryItem( menu, controller )
	local self = LUI.UIVerticalNavigator.new()
	self.id = "DeconstructArmoryItem"
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	self:playSound( "menu_open" )
	local f4_local2 = self
	local Darkener = nil
	
	Darkener = LUI.UIImage.new()
	Darkener.id = "Darkener"
	Darkener:SetRGBFromTable( SWATCHES.Popups.backgroundPopup, 0 )
	Darkener:SetAlpha( 0.4, 0 )
	Darkener:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -1000, _1080p * 1000, _1080p * -600, _1080p * 600 )
	self:addElement( Darkener )
	self.Darkener = Darkener
	
	local PopupFrame = nil
	
	PopupFrame = MenuBuilder.BuildRegisteredType( "PopupFrame", {
		controllerIndex = f4_local1
	} )
	PopupFrame.id = "PopupFrame"
	PopupFrame.Title:setText( Engine.Localize( "LUA_MENU_DECONSTRUCT_CAPS" ), 0 )
	PopupFrame:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 760, _1080p * 1160, _1080p * 379, _1080p * 752.5 )
	self:addElement( PopupFrame )
	self.PopupFrame = PopupFrame
	
	local AreYouSure = nil
	
	AreYouSure = LUI.UIText.new()
	AreYouSure.id = "AreYouSure"
	AreYouSure:SetRGBFromTable( SWATCHES.genericButton.highlight, 0 )
	AreYouSure:setText( Engine.Localize( "LUA_MENU_ARMORY_DECONSTRUCT_CONFIRMATION" ), 0 )
	AreYouSure:SetFontSize( 20 * _1080p )
	AreYouSure:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	AreYouSure:SetAlignment( LUI.Alignment.Center )
	AreYouSure:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 760, _1080p * 1160, _1080p * 392, _1080p * 412 )
	self:addElement( AreYouSure )
	self.AreYouSure = AreYouSure
	
	local CraftingCurrencyCount = nil
	
	CraftingCurrencyCount = MenuBuilder.BuildRegisteredType( "CraftingCurrencyCount", {
		controllerIndex = f4_local1
	} )
	CraftingCurrencyCount.id = "CraftingCurrencyCount"
	CraftingCurrencyCount:SetDataSource( DataSources.frontEnd.MP.commerce.craftingCurrency, f4_local1 )
	CraftingCurrencyCount:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 991.5, _1080p * 1041.5, _1080p * 460, _1080p * 510 )
	CraftingCurrencyCount:SubscribeToModel( DataSources.frontEnd.MP.commerce.craftingCurrency:GetModel( f4_local1 ), function ()
		local f5_local0 = DataSources.frontEnd.MP.commerce.craftingCurrency:GetValue( f4_local1 )
		if f5_local0 ~= nil then
			CraftingCurrencyCount.CurrencyCount:setText( f5_local0, 0 )
		end
	end )
	self:addElement( CraftingCurrencyCount )
	self.CraftingCurrencyCount = CraftingCurrencyCount
	
	local Amount = nil
	
	Amount = LUI.UIText.new()
	Amount.id = "Amount"
	Amount:setText( Engine.Localize( "LUA_MENU_AMOUNT" ), 0 )
	Amount:SetFontSize( 18 * _1080p )
	Amount:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Amount:SetAlignment( LUI.Alignment.Right )
	Amount:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 811.5, _1080p * 975.5, _1080p * 526.5, _1080p * 544.5 )
	self:addElement( Amount )
	self.Amount = Amount
	
	local Balance = nil
	
	Balance = LUI.UIText.new()
	Balance.id = "Balance"
	Balance:setText( Engine.Localize( "LUA_MENU_NEW_BALANCE" ), 0 )
	Balance:SetFontSize( 18 * _1080p )
	Balance:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Balance:SetAlignment( LUI.Alignment.Right )
	Balance:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 811.5, _1080p * 975.5, _1080p * 597.5, _1080p * 615.5 )
	self:addElement( Balance )
	self.Balance = Balance
	
	local Current = nil
	
	Current = LUI.UIText.new()
	Current.id = "Current"
	Current:setText( Engine.Localize( "LUA_MENU_CURRENT" ), 0 )
	Current:SetFontSize( 19 * _1080p )
	Current:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Current:SetAlignment( LUI.Alignment.Right )
	Current:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 811.5, _1080p * 975.5, _1080p * 475.5, _1080p * 494.5 )
	self:addElement( Current )
	self.Current = Current
	
	local NewBalance = nil
	
	NewBalance = MenuBuilder.BuildRegisteredType( "CraftingCurrencyCount", {
		controllerIndex = f4_local1
	} )
	NewBalance.id = "NewBalance"
	NewBalance:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 991.5, _1080p * 1041.5, _1080p * 581.5, _1080p * 631.5 )
	NewBalance:SubscribeToModelThroughElement( self, "newBalance", function ()
		local f6_local0 = self:GetDataSource()
		f6_local0 = f6_local0.newBalance:GetValue( f4_local1 )
		if f6_local0 ~= nil then
			NewBalance.CurrencyCount:setText( f6_local0, 0 )
		end
	end )
	self:addElement( NewBalance )
	self.NewBalance = NewBalance
	
	local SalvageReceived = nil
	
	SalvageReceived = MenuBuilder.BuildRegisteredType( "CraftingCurrencyCount", {
		controllerIndex = f4_local1
	} )
	SalvageReceived.id = "SalvageReceived"
	SalvageReceived:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 991.5, _1080p * 1041.5, _1080p * 510.5, _1080p * 560.5 )
	SalvageReceived:SubscribeToModelThroughElement( self, "currency", function ()
		local f7_local0 = self:GetDataSource()
		f7_local0 = f7_local0.currency:GetValue( f4_local1 )
		if f7_local0 ~= nil then
			SalvageReceived.CurrencyCount:setText( f7_local0, 0 )
		end
	end )
	self:addElement( SalvageReceived )
	self.SalvageReceived = SalvageReceived
	
	local Divider2 = nil
	
	Divider2 = LUI.UIImage.new()
	Divider2.id = "Divider2"
	Divider2:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -96.5, _1080p * 96.5, _1080p * 30, _1080p * 33 )
	self:addElement( Divider2 )
	self.Divider2 = Divider2
	
	local YesButton = nil
	
	YesButton = MenuBuilder.BuildRegisteredType( "PopupButton", {
		controllerIndex = f4_local1
	} )
	YesButton.id = "YesButton"
	YesButton.Label:setText( ToUpperCase( Engine.Localize( "LUA_MENU_YES" ) ), 0 )
	YesButton:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 760, _1080p * 1160, _1080p * 663.04, _1080p * 701.04 )
	self:addElement( YesButton )
	self.YesButton = YesButton
	
	local NoButton = nil
	
	NoButton = MenuBuilder.BuildRegisteredType( "PopupButton", {
		controllerIndex = f4_local1
	} )
	NoButton.id = "NoButton"
	NoButton.Label:setText( ToUpperCase( Engine.Localize( "LUA_MENU_NO" ) ), 0 )
	NoButton:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 760, _1080p * 1160, _1080p * 711.5, _1080p * 751.5 )
	self:addElement( NoButton )
	self.NoButton = NoButton
	
	CraftingCurrencyCount:SetDataSource( DataSources.frontEnd.MP.commerce.craftingCurrency, f4_local1 )
	self.addButtonHelperFunction = function ( f8_arg0, f8_arg1 )
		f8_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			clickable = true
		} )
	end
	
	self:addEventHandler( "menu_create", self.addButtonHelperFunction )
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	self.bindButton:addEventHandler( "button_secondary", function ( f9_arg0, f9_arg1 )
		local f9_local0 = f9_arg1.controller or f4_local1
		ACTIONS.LeaveMenu( self )
	end )
	f0_local2( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "DeconstructArmoryItem", DeconstructArmoryItem )
LUI.FlowManager.RegisterStackPopBehaviour( "DeconstructArmoryItem", f0_local1 )
LockTable( _M )
