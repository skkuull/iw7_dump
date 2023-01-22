local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.ArmoryWeaponButton )
	local f1_local0 = f1_arg0.ArmoryWeaponButton
	assert( f1_local0.Image )
	assert( f1_local0.Name )
	assert( f1_local0.QualityIcon )
	assert( f1_local0.UnavailableOverlay )
	assert( f1_arg0.LockIcon )
	f1_local0.UnavailableOverlay:SetAlpha( 0, 0 )
	local f1_local1 = tonumber( f1_arg2.index )
	local f1_local2 = LOOT.GetLootData( f1_local1 )
	f1_local0.Image:setImage( RegisterMaterial( f1_local2.displayImage ) )
	f1_local0.Name:setText( Engine.Localize( f1_local2.suffix ) )
	f1_local0.QualityIcon.Icon:setImage( RegisterMaterial( Cac.GetLootQualityImage( f1_local2.quality ) ) )
	f1_local0.QualityIcon.Icon:SetRGBFromInt( Cac.GetLootQualityColor( f1_local2.quality ), 0 )
	f1_local0:addEventHandler( "button_over", function ( f2_arg0, f2_arg1 )
		local f2_local0 = f2_arg0:GetCurrentMenu()
		assert( f2_local0.ArmoryWeaponCard )
		f2_local0.ArmoryWeaponCard:SetWeapon( f1_local1, f1_arg1 or f2_arg1.controller )
	end )
	f1_local0:addEventHandler( "button_action", function ( f3_arg0, f3_arg1 )
		
	end )
	if not (Loot.IsOwned( f1_arg1, f1_local1 ) > 0) then
		f1_local0.Image:SetAlpha( 0.4, 0 )
		f1_local0.Image:SetRGBFromInt( 0, 0 )
		f1_arg0.LockIcon:SetAlpha( 1, 0 )
		if not Engine.IsAliensMode() then
			f1_local0.UnavailableOverlay:SetAlpha( 0.4, 0 )
		end
		f1_local0:setActionSFX( SOUND_SETS.default.deny )
	else
		f1_local0.Image:SetAlpha( 1, 0 )
		f1_local0.Image:SetRGBFromTable( COLORS.white )
		f1_arg0.LockIcon:SetAlpha( 0, 0 )
		f1_local0.UnavailableOverlay:SetAlpha( 0, 0 )
		f1_local0:setActionSFX( SOUND_SETS.default.action )
	end
	if Engine.IsAliensMode() then
		f1_arg0.LockIcon:setImage( RegisterMaterial( "armory_zombie_loot_crate_rare" ), 0 )
		f1_arg0.LockIcon:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -64, _1080p * 64, _1080p * -20, _1080p * 44 )
	end
end

f0_local1 = function ( f4_arg0, f4_arg1, f4_arg2 )
	f4_arg0.SetupQualityItemData = f0_local0
end

function ArmoryRNGButton( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 298.5 * _1080p, 0, 149 * _1080p )
	self.id = "ArmoryRNGButton"
	local f5_local1 = controller and controller.controllerIndex
	if not f5_local1 and not Engine.InFrontend() then
		f5_local1 = self:getRootController()
	end
	assert( f5_local1 )
	local f5_local2 = self
	local ArmoryWeaponButton = nil
	
	ArmoryWeaponButton = MenuBuilder.BuildRegisteredType( "ArmoryWeaponButton", {
		controllerIndex = f5_local1
	} )
	ArmoryWeaponButton.id = "ArmoryWeaponButton"
	ArmoryWeaponButton.UnavailableOverlay:setImage( RegisterMaterial( "inventory_loot_pattern_small" ), 0 )
	ArmoryWeaponButton.Image:SetLeft( _1080p * -110, 0 )
	ArmoryWeaponButton.Image:SetRight( _1080p * 110, 0 )
	ArmoryWeaponButton.Image:SetTop( _1080p * -117, 0 )
	ArmoryWeaponButton.Image:SetBottom( _1080p * -7, 0 )
	ArmoryWeaponButton.Name:setText( "", 0 )
	ArmoryWeaponButton.Name:SetAlignment( LUI.Alignment.Left )
	ArmoryWeaponButton:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 298.5, 0, _1080p * 149 )
	self:addElement( ArmoryWeaponButton )
	self.ArmoryWeaponButton = ArmoryWeaponButton
	
	local LockIcon = nil
	
	LockIcon = LUI.UIImage.new()
	LockIcon.id = "LockIcon"
	LockIcon:SetAlpha( 0, 0 )
	LockIcon:setImage( RegisterMaterial( "icon_inventory_quartermaster" ), 0 )
	LockIcon:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * 32, _1080p * -20, _1080p * 44 )
	self:addElement( LockIcon )
	self.LockIcon = LockIcon
	
	f0_local1( self, f5_local1, controller )
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "QualityIcon",
		sequenceName = "StopPulse",
		elementPath = "ArmoryWeaponButton.QualityIcon"
	} )
	return self
end

MenuBuilder.registerType( "ArmoryRNGButton", ArmoryRNGButton )
LockTable( _M )
