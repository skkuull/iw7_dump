local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PurchaseButtonWithCurrency( menu, controller )
	local self = LUI.UIHorizontalStackedLayout.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 630 * _1080p, 0, 38 * _1080p )
	self.id = "PurchaseButtonWithCurrency"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	self:SetSpacing( 10 * _1080p )
	local PurchaseButton = nil
	
	PurchaseButton = MenuBuilder.BuildRegisteredType( "PopupButton", {
		controllerIndex = f1_local1
	} )
	PurchaseButton.id = "PurchaseButton"
	PurchaseButton.Label:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_POINTS_PURCHASE" ) ), 0 )
	PurchaseButton.Label:SetAlignment( LUI.Alignment.Left )
	PurchaseButton:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, 0, _1080p * 500, _1080p * -15, _1080p * 15 )
	self:addElement( PurchaseButton )
	self.PurchaseButton = PurchaseButton
	
	local CostIcon = nil
	
	CostIcon = LUI.UIImage.new()
	CostIcon.id = "CostIcon"
	CostIcon:setImage( RegisterMaterial( "currency_cod_points_icon" ), 0 )
	CostIcon:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 510, _1080p * 548, _1080p * -19, _1080p * 19 )
	self:addElement( CostIcon )
	self.CostIcon = CostIcon
	
	local CostLabel = nil
	
	CostLabel = LUI.UIText.new()
	CostLabel.id = "CostLabel"
	CostLabel:setText( "", 0 )
	CostLabel:SetFontSize( 24 * _1080p )
	CostLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	CostLabel:SetAlignment( LUI.Alignment.Right )
	CostLabel:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 558, _1080p * 629, _1080p * -12, _1080p * 12 )
	self:addElement( CostLabel )
	self.CostLabel = CostLabel
	
	return self
end

MenuBuilder.registerType( "PurchaseButtonWithCurrency", PurchaseButtonWithCurrency )
LockTable( _M )
