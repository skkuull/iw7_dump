local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg2.passive )
	local f1_local0 = f1_arg2.passive.name:GetValue( f1_arg1 )
	local f1_local1 = f1_arg2.passive.image:GetValue( f1_arg1 )
	f1_arg0.ItemName:SetShadowUOffset( -0 )
	f1_arg0.ItemName:SetShadowVOffset( -0 )
	f1_arg0.ItemName:setText( Engine.Localize( f1_local0 ), 0 )
	f1_arg0.ItemIcon:setImage( RegisterMaterial( f1_local1 ), 0 )
end

function LootWeaponItemPassive( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 64 * _1080p, 0, 64 * _1080p )
	self.id = "LootWeaponItemPassive"
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local ItemIcon = nil
	
	ItemIcon = LUI.UIImage.new()
	ItemIcon.id = "ItemIcon"
	ItemIcon:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 64, 0, _1080p * 64 )
	self:addElement( ItemIcon )
	self.ItemIcon = ItemIcon
	
	local ItemName = nil
	
	ItemName = LUI.UIStyledText.new()
	ItemName.id = "ItemName"
	ItemName:setText( "", 0 )
	ItemName:SetFontSize( 18 * _1080p )
	ItemName:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	ItemName:SetAlignment( LUI.Alignment.Center )
	ItemName:SetStartupDelay( 1000 )
	ItemName:SetLineHoldTime( 400 )
	ItemName:SetAnimMoveTime( 150 )
	ItemName:SetEndDelay( 1000 )
	ItemName:SetCrossfadeTime( 400 )
	ItemName:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	ItemName:SetMaxVisibleLines( 1 )
	ItemName:SetShadowMinDistance( -0.2, 0 )
	ItemName:SetShadowMaxDistance( 0.2, 0 )
	ItemName:SetShadowRGBFromInt( 0, 0 )
	ItemName:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * -26, _1080p * 26, _1080p * 3, _1080p * 21 )
	self:addElement( ItemName )
	self.ItemName = ItemName
	
	f0_local0( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "LootWeaponItemPassive", LootWeaponItemPassive )
LockTable( _M )
