local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg2.itemCardData )
	assert( f1_arg2.itemType )
	local f1_local0 = _1080p * 60
	local f1_local1 = _1080p * 64
	local f1_local2 = nil
	local f1_local3 = f1_arg2.itemCardData.identifier:GetValue( f1_arg1 )
	if f1_arg2.itemType == LUI.ItemCard.types.STREAK then
		f1_local2 = Cac.GetPassivesForStreak( f1_local3 )
	else
		f1_local2 = Cac.GetPassivesForWeapon( Cac.GetLootRef( f1_local3 ), f1_local3 )
	end
	local passiveList = LUI.UIHorizontalList.new( {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = false,
		bottomAnchor = false,
		left = _1080p * 10,
		right = _1080p * -10,
		top = _1080p * 30,
		bottom = _1080p * 94,
		alignment = LUI.Alignment.Center,
		spacing = f1_local0
	} )
	passiveList.id = "passiveList"
	f1_arg0:addElement( passiveList )
	f1_arg0.passiveList = passiveList
	
	for f1_local8, f1_local9 in ipairs( f1_local2 ) do
		local f1_local10 = MenuBuilder.BuildRegisteredType( "LootWeaponItemPassive", {
			passive = f1_local9,
			controllerIndex = f1_arg1
		} )
		f1_local10:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, f1_local1 * 0.5, f1_local1 * -0.5, 0, f1_local1 )
		f1_local10.id = "passiveItem" .. f1_local8
		f1_arg0.passiveList:addElement( f1_local10 )
	end
	f1_arg0.ItemIcon:setImage( RegisterMaterial( f1_arg2.itemCardData.displayImage:GetValue( f1_arg1 ) ), 0 )
end

function LootPassiveItem( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 256 * _1080p, 0, 256 * _1080p )
	self.id = "LootPassiveItem"
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local ItemIcon = nil
	
	ItemIcon = LUI.UIImage.new()
	ItemIcon.id = "ItemIcon"
	ItemIcon:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -128, _1080p * 128, _1080p * -114, _1080p * 14 )
	self:addElement( ItemIcon )
	self.ItemIcon = ItemIcon
	
	f0_local0( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "LootPassiveItem", LootPassiveItem )
LockTable( _M )
