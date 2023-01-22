local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ItemCardSupplyDrop( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 100 * _1080p, 0, 100 * _1080p )
	self.id = "ItemCardSupplyDrop"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local WeaponImage = nil
	
	WeaponImage = LUI.UIImage.new()
	WeaponImage.id = "WeaponImage"
	WeaponImage:setImage( RegisterMaterial( "armory_loot_crate_common" ), 0 )
	WeaponImage:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -64, _1080p * 64, _1080p * -32, _1080p * 32 )
	self:addElement( WeaponImage )
	self.WeaponImage = WeaponImage
	
	local WeaponName = nil
	
	WeaponName = LUI.UIText.new()
	WeaponName.id = "WeaponName"
	WeaponName:setText( "LOOT", 0 )
	WeaponName:SetFontSize( 12 * _1080p )
	WeaponName:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	WeaponName:SetAlignment( LUI.Alignment.Center )
	WeaponName:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 5, _1080p * 17 )
	self:addElement( WeaponName )
	self.WeaponName = WeaponName
	
	local WeaponLevel = nil
	
	WeaponLevel = LUI.UIText.new()
	WeaponLevel.id = "WeaponLevel"
	WeaponLevel:setText( "UNIT SUPPLY DROP", 0 )
	WeaponLevel:SetFontSize( 12 * _1080p )
	WeaponLevel:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	WeaponLevel:SetAlignment( LUI.Alignment.Center )
	WeaponLevel:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -17, _1080p * -5 )
	self:addElement( WeaponLevel )
	self.WeaponLevel = WeaponLevel
	
	return self
end

MenuBuilder.registerType( "ItemCardSupplyDrop", ItemCardSupplyDrop )
LockTable( _M )
