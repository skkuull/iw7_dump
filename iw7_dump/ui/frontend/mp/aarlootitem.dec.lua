local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function AARLootItem( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1180 * _1080p, 0, 114 * _1080p )
	self.id = "AARLootItem"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local SideGradient = nil
	
	SideGradient = LUI.UIImage.new()
	SideGradient.id = "SideGradient"
	SideGradient:SetRGBFromInt( 8421504, 0 )
	SideGradient:SetAlpha( 0.15, 0 )
	SideGradient:setImage( RegisterMaterial( "widg_gradient_left_to_right" ), 0 )
	SideGradient:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 140, _1080p * 694, 0, _1080p * 114 )
	self:addElement( SideGradient )
	self.SideGradient = SideGradient
	
	local LootQualityImage = nil
	
	LootQualityImage = LUI.UIImage.new()
	LootQualityImage.id = "LootQualityImage"
	LootQualityImage:SetRGBFromInt( 7958197, 0 )
	LootQualityImage:setImage( RegisterMaterial( "icon_item_quality_3" ), 0 )
	LootQualityImage:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 114, 0, _1080p * 114 )
	self:addElement( LootQualityImage )
	self.LootQualityImage = LootQualityImage
	
	local QualityStub = nil
	
	QualityStub = LUI.UIImage.new()
	QualityStub.id = "QualityStub"
	QualityStub:SetRGBFromInt( 7958197, 0 )
	QualityStub:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 124, _1080p * 140, 0, _1080p * 114 )
	self:addElement( QualityStub )
	self.QualityStub = QualityStub
	
	local LootName = nil
	
	LootName = LUI.UIStyledText.new()
	LootName.id = "LootName"
	LootName:setText( ToUpperCase( "LOOT_NAME" ), 0 )
	LootName:SetFontSize( 45 * _1080p )
	LootName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	LootName:SetAlignment( LUI.Alignment.Left )
	LootName:SetOptOutRightToLeftAlignmentFlip( true )
	LootName:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 164, _1080p * 546, _1080p * 7, _1080p * 48 )
	self:addElement( LootName )
	self.LootName = LootName
	
	local LootDescription = nil
	
	LootDescription = LUI.UIStyledText.new()
	LootDescription.id = "LootDescription"
	LootDescription:SetRGBFromTable( SWATCHES.text.primaryText, 0 )
	LootDescription:setText( "Loot Description goes here.", 0 )
	LootDescription:SetFontSize( 20 * _1080p )
	LootDescription:SetFont( FONTS.GetFont( FONTS.Dev.File ) )
	LootDescription:SetAlignment( LUI.Alignment.Left )
	LootDescription:SetOptOutRightToLeftAlignmentFlip( true )
	LootDescription:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 164, _1080p * 486, _1080p * 48, _1080p * 68 )
	self:addElement( LootDescription )
	self.LootDescription = LootDescription
	
	local LootItemImage = nil
	
	LootItemImage = LUI.UIImage.new()
	LootItemImage.id = "LootItemImage"
	LootItemImage:setImage( RegisterMaterial( "render_weapon_ake_small" ), 0 )
	LootItemImage:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 432, _1080p * 688, _1080p * -14, _1080p * 114 )
	self:addElement( LootItemImage )
	self.LootItemImage = LootItemImage
	
	return self
end

MenuBuilder.registerType( "AARLootItem", AARLootItem )
LockTable( _M )
