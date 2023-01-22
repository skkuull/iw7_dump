local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:SetAlignment( LUI.Alignment.Top )
	f1_arg0:SetAdjustSizeToContent( true )
end

function PurchaseButtonsWithCurrencyList( menu, controller )
	local self = LUI.UIVerticalList.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 630 * _1080p, 0, 174 * _1080p )
	self.id = "PurchaseButtonsWithCurrencyList"
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	self:SetSpacing( 10 * _1080p )
	local PurchaseWithKeys = nil
	
	PurchaseWithKeys = MenuBuilder.BuildRegisteredType( "PurchaseButtonWithCurrency", {
		controllerIndex = f2_local1
	} )
	PurchaseWithKeys.id = "PurchaseWithKeys"
	PurchaseWithKeys.PurchaseButton.Label:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_KEYS_PURCHASE" ) ), 0 )
	PurchaseWithKeys.CostIcon:setImage( RegisterMaterial( "icon_currency_keys" ), 0 )
	PurchaseWithKeys:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 630, 0, _1080p * 38 )
	self:addElement( PurchaseWithKeys )
	self.PurchaseWithKeys = PurchaseWithKeys
	
	local PurchaseWithPoints = nil
	
	PurchaseWithPoints = MenuBuilder.BuildRegisteredType( "PurchaseButtonWithCurrency", {
		controllerIndex = f2_local1
	} )
	PurchaseWithPoints.id = "PurchaseWithPoints"
	PurchaseWithPoints.PurchaseButton.Label:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_POINTS_PURCHASE" ) ), 0 )
	PurchaseWithPoints:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 630, _1080p * 48, _1080p * 86 )
	self:addElement( PurchaseWithPoints )
	self.PurchaseWithPoints = PurchaseWithPoints
	
	local PurchaseWithSalvage = nil
	
	PurchaseWithSalvage = MenuBuilder.BuildRegisteredType( "PurchaseButtonWithCurrency", {
		controllerIndex = f2_local1
	} )
	PurchaseWithSalvage.id = "PurchaseWithSalvage"
	PurchaseWithSalvage.PurchaseButton.Label:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_SALVAGE_PURCHASE" ) ), 0 )
	PurchaseWithSalvage.CostIcon:setImage( RegisterMaterial( "currency_parts_icon" ), 0 )
	PurchaseWithSalvage:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 630, _1080p * 96, _1080p * 134 )
	self:addElement( PurchaseWithSalvage )
	self.PurchaseWithSalvage = PurchaseWithSalvage
	
	local CancelButton = nil
	
	CancelButton = MenuBuilder.BuildRegisteredType( "PopupButton", {
		controllerIndex = f2_local1
	} )
	CancelButton.id = "CancelButton"
	CancelButton.Label:setText( ToUpperCase( Engine.Localize( "LUA_MENU_CANCEL" ) ), 0 )
	CancelButton.Label:SetAlignment( LUI.Alignment.Left )
	CancelButton:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, _1080p * 144, _1080p * 174 )
	self:addElement( CancelButton )
	self.CancelButton = CancelButton
	
	CancelButton:addEventHandler( "button_action", function ( f3_arg0, f3_arg1 )
		local f3_local0 = f3_arg1.controller or f2_local1
		ACTIONS.LeaveMenu( self )
	end )
	PostLoadFunc( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "PurchaseButtonsWithCurrencyList", PurchaseButtonsWithCurrencyList )
LockTable( _M )
