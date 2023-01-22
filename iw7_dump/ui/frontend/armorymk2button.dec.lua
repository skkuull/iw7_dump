local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3 )
	assert( f1_arg0.CrateIcon )
	assert( f1_arg0.ArmoryWeaponButton )
	local f1_local0 = f1_arg0.ArmoryWeaponButton
	assert( f1_local0.Image )
	assert( f1_local0.Name )
	assert( f1_local0.QualityIcon )
	assert( f1_local0.UnavailableOverlay )
	local f1_local1 = Cac.GetLootWeaponQuality( f1_arg3.ref )
	local f1_local2 = Cac.GetLootWeaponCost( f1_arg3.ref )
	local f1_local3 = Engine.Localize( f1_arg3.suffix )
	local f1_local4 = f1_arg3.displayImage
	local f1_local5 = Cac.GetWeaponUniqueID( f1_arg3.ref )
	f1_local0.lootID = f1_local5
	f1_local0.Image:setImage( RegisterMaterial( f1_local4 ) )
	f1_local0.Name:setText( f1_local3 )
	f1_local0.QualityIcon.Icon:setImage( RegisterMaterial( Cac.GetLootQualityImage( f1_local1 ) ) )
	f1_local0.QualityIcon.Icon:SetRGBFromInt( Cac.GetLootQualityColor( f1_local1 ), 0 )
	f1_local0.QualityIcon.IconDuplicate:setImage( RegisterMaterial( Cac.GetLootQualityImage( f1_local1 ) .. "_mk2" ) )
	f1_local0.QualityIcon.IconDuplicate:SetRGBFromInt( Cac.GetLootQualityColor( f1_local1 ), 0 )
	f1_local0.MK2:SetAlpha( 0.25, 0 )
	f1_local0.Pattern:SetRGBFromInt( Cac.GetLootQualityColor( f1_local1 ), 0 )
	f1_local0.PatternDup:SetRGBFromInt( Cac.GetLootQualityColor( f1_local1 ), 0 )
	f1_local0.Gradient:SetRGBFromInt( Cac.GetLootQualityColor( f1_local1 ), 0 )
	f1_local0.Highlight:SetRGBFromInt( Cac.GetLootQualityColor( f1_local1 ), 0 )
	if Loot.IsOwned( f1_arg1, f1_local5 ) > 0 then
		f1_arg0.CrateIcon:SetAlpha( 0, 0 )
		f1_local0.Lock:SetAlpha( 0, 0 )
		f1_local0.UnavailableOverlay:SetAlpha( 0, 0 )
		f1_local0.Image:SetAlpha( 1, 0 )
		f1_local0.Image:SetRGBFromTable( COLORS.white )
		f1_local0.QualityIcon:SetAlpha( 1, 0 )
		f1_local0:setActionSFX( SOUND_SETS.default.action )
	else
		f1_arg0.CrateIcon:SetAlpha( 1, 0 )
		f1_local0.UnavailableOverlay:SetAlpha( 0, 0 )
		f1_local0.Image:SetAlpha( 0, 0 )
		f1_local0.Image:SetRGBFromInt( 0, 0 )
		f1_local0.Lock:SetAlpha( 1, 0 )
		f1_local0:setActionSFX( SOUND_SETS.default.deny )
	end
end

f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2 )
	assert( f2_arg0.ArmoryWeaponButton )
	local f2_local0 = f2_arg0.ArmoryWeaponButton
	f2_arg0.SetupVariantData = f0_local0
	f2_local0:addEventHandler( "button_over", function ( f3_arg0, f3_arg1 )
		local f3_local0 = f3_arg0:GetCurrentMenu()
		assert( f3_local0.ArmoryWeaponCard )
		f3_local0.ArmoryWeaponCard:SetWeapon( f3_arg0.lootID, f2_arg1 or f3_arg1.controller )
		if f2_arg0.lastPlayedAnim ~= "MK2HighlightOn" then
			f2_arg0.lastPlayedAnim = "MK2HighlightOn"
			ACTIONS.AnimateSequence( f2_arg0.ArmoryWeaponButton, "MK2HighlightOn" )
		end
	end )
	f2_local0:addEventHandler( "button_up", function ( f4_arg0, f4_arg1 )
		if f2_arg0.lastPlayedAnim ~= "MK2HighlightOff" then
			f2_arg0.lastPlayedAnim = "MK2HighlightOff"
			ACTIONS.AnimateSequence( f2_arg0.ArmoryWeaponButton, "MK2HighlightOff" )
		end
	end )
end

function ArmoryMk2Button( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 200 * _1080p, 0, 100 * _1080p )
	self.id = "ArmoryMk2Button"
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
	ArmoryWeaponButton.Image:SetLeft( _1080p * -70, 0 )
	ArmoryWeaponButton.Image:SetRight( _1080p * 70, 0 )
	ArmoryWeaponButton.Image:SetTop( _1080p * -73, 0 )
	ArmoryWeaponButton.Image:SetBottom( _1080p * -3, 0 )
	ArmoryWeaponButton.Name:setText( "", 0 )
	ArmoryWeaponButton.Name:SetAlignment( LUI.Alignment.Left )
	ArmoryWeaponButton:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 200, 0, _1080p * 100 )
	self:addElement( ArmoryWeaponButton )
	self.ArmoryWeaponButton = ArmoryWeaponButton
	
	local CrateIcon = nil
	
	CrateIcon = LUI.UIImage.new()
	CrateIcon.id = "CrateIcon"
	CrateIcon:setImage( RegisterMaterial( "icon_inventory_quartermaster" ), 0 )
	CrateIcon:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -25, _1080p * 25, _1080p * -13, _1080p * 37 )
	self:addElement( CrateIcon )
	self.CrateIcon = CrateIcon
	
	f0_local1( self, f5_local1, controller )
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "QualityIcon",
		sequenceName = "LegendaryPulse",
		elementPath = "ArmoryWeaponButton.QualityIcon"
	} )
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "ArmoryWeaponButton",
		sequenceName = "Glow",
		elementPath = "ArmoryWeaponButton"
	} )
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "ArmoryWeaponButton",
		sequenceName = "Pulse",
		elementPath = "ArmoryWeaponButton"
	} )
	return self
end

MenuBuilder.registerType( "ArmoryMk2Button", ArmoryMk2Button )
LockTable( _M )
