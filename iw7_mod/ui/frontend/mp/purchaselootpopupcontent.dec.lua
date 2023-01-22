local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PurchaseLootPopupContent( menu, controller )
	local self = LUI.UIVerticalNavigator.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 630 * _1080p, 0, 205 * _1080p )
	self.id = "PurchaseLootPopupContent"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local AreYouSure = nil
	
	AreYouSure = LUI.UIText.new()
	AreYouSure.id = "AreYouSure"
	AreYouSure:setText( Engine.Localize( "LUA_MENU_MP_PURCHASE_SUPPLY_DROP" ), 0 )
	AreYouSure:SetFontSize( 24 * _1080p )
	AreYouSure:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	AreYouSure:SetAlignment( LUI.Alignment.Center )
	AreYouSure:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -285, _1080p * 285, _1080p * -102.5, _1080p * -78.5 )
	self:addElement( AreYouSure )
	self.AreYouSure = AreYouSure
	
	local Cost = nil
	
	Cost = LUI.UIText.new()
	Cost.id = "Cost"
	Cost:setText( Engine.Localize( "LUA_MENU_COST" ), 0 )
	Cost:SetFontSize( 24 * _1080p )
	Cost:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Cost:SetAlignment( LUI.Alignment.Left )
	Cost:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -120, 0, _1080p * -24, 0 )
	self:addElement( Cost )
	self.Cost = Cost
	
	local Image = nil
	
	Image = LUI.UIImage.new()
	Image.id = "Image"
	Image:setImage( RegisterMaterial( "render_weapon_kbar_small" ), 0 )
	Image:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -128, _1080p * 128, _1080p * -64, _1080p * 64 )
	self:addElement( Image )
	self.Image = Image
	
	return self
end

MenuBuilder.registerType( "PurchaseLootPopupContent", PurchaseLootPopupContent )
LockTable( _M )
