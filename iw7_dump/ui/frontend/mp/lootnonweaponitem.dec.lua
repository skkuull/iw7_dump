local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg2.material )
	assert( f1_arg2.itemType )
	f1_arg0.ItemIcon:setImage( RegisterMaterial( f1_arg2.material ) )
	if f1_arg2.itemType == LUI.ItemCard.types.CALLING_CARD then
		f1_arg0.ItemIcon:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -133, _1080p * 133, _1080p * -52, _1080p * 52, 0 )
		f1_arg0.ItemIconBackground:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -147, _1080p * 147, _1080p * -66, _1080p * 66 )
	elseif f1_arg2.itemType == LUI.ItemCard.types.CRATE then
		f1_arg0.ItemIcon:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -134, _1080p * 134, _1080p * -67, _1080p * 67, 0 )
		f1_arg0.ItemIconBackground:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -110, _1080p * 110, _1080p * -110, _1080p * 110 )
	else
		f1_arg0.ItemIcon:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -96, _1080p * 96, _1080p * -96, _1080p * 96 )
		f1_arg0.ItemIconBackground:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -110, _1080p * 110, _1080p * -110, _1080p * 110 )
	end
end

function LootNonWeaponItem( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 220 * _1080p, 0, 220 * _1080p )
	self.id = "LootNonWeaponItem"
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local ItemIconBackground = nil
	
	ItemIconBackground = LUI.UIImage.new()
	ItemIconBackground.id = "ItemIconBackground"
	ItemIconBackground:SetRGBFromInt( 0, 0 )
	ItemIconBackground:SetAlpha( 0.5, 0 )
	ItemIconBackground:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -110, _1080p * 110, _1080p * -110, _1080p * 110 )
	self:addElement( ItemIconBackground )
	self.ItemIconBackground = ItemIconBackground
	
	local ItemIcon = nil
	
	ItemIcon = LUI.UIImage.new()
	ItemIcon.id = "ItemIcon"
	ItemIcon:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -96, _1080p * 96, _1080p * -96, _1080p * 96 )
	self:addElement( ItemIcon )
	self.ItemIcon = ItemIcon
	
	f0_local0( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "LootNonWeaponItem", LootNonWeaponItem )
LockTable( _M )
