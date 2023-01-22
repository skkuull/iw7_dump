local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.UnlockLevel )
	assert( f1_arg0.MissionLockIcon )
	local f1_local0 = f1_arg0.ArmoryWeaponButton
	assert( f1_local0.Image )
	assert( f1_local0.Name )
	assert( f1_local0.QualityIcon )
	assert( f1_local0.UnavailableOverlay )
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
	f1_arg0.UnlockLevel:setText( f1_arg2.level )
	f1_arg0.UnlockLevel:SetShadowUOffset( -0 )
	f1_arg0.UnlockLevel:SetShadowVOffset( -0 )
	if not (Loot.IsOwned( f1_arg1, f1_local1 ) > 0) then
		f1_local0.Image:SetAlpha( 0.4, 0 )
		f1_local0.Image:SetRGBFromInt( 0, 0 )
		f1_arg0.MissionLockIcon:SetAlpha( 1, 0 )
		f1_arg0.UnlockLevel:SetAlpha( 1, 0 )
		f1_arg0.LeftNotch:SetAlpha( 0.6, 0 )
		f1_arg0.RightNotch:SetAlpha( 0.6, 0 )
		f1_arg0.LevelBacker:SetAlpha( 0.6, 0 )
		f1_local0:setActionSFX( SOUND_SETS.default.deny )
	else
		f1_local0.Image:SetAlpha( 1, 0 )
		f1_local0.Image:SetRGBFromTable( COLORS.white )
		f1_arg0.MissionLockIcon:SetAlpha( 0, 0 )
		f1_arg0.UnlockLevel:SetAlpha( 0, 0 )
		f1_arg0.LeftNotch:SetAlpha( 0, 0 )
		f1_arg0.RightNotch:SetAlpha( 0, 0 )
		f1_arg0.LevelBacker:SetAlpha( 0, 0 )
		f1_local0:setActionSFX( SOUND_SETS.default.action )
	end
end

f0_local1 = function ( f4_arg0, f4_arg1, f4_arg2 )
	f4_arg0.SetupMissionTeamData = f0_local0
end

function ArmoryMissionTeamsButton( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 200 * _1080p, 0, 100 * _1080p )
	self.id = "ArmoryMissionTeamsButton"
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
	ArmoryWeaponButton.Image:SetLeft( _1080p * -70, 0 )
	ArmoryWeaponButton.Image:SetRight( _1080p * 70, 0 )
	ArmoryWeaponButton.Image:SetTop( _1080p * -73, 0 )
	ArmoryWeaponButton.Image:SetBottom( _1080p * -3, 0 )
	ArmoryWeaponButton.Name:setText( "", 0 )
	ArmoryWeaponButton.Name:SetAlignment( LUI.Alignment.Left )
	ArmoryWeaponButton:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 200, 0, _1080p * 100 )
	self:addElement( ArmoryWeaponButton )
	self.ArmoryWeaponButton = ArmoryWeaponButton
	
	local PriceBacker = nil
	
	PriceBacker = LUI.UIImage.new()
	PriceBacker.id = "PriceBacker"
	PriceBacker:SetRGBFromInt( 0, 0 )
	PriceBacker:SetAlpha( 0, 0 )
	PriceBacker:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -107, 0, 0, _1080p * 24 )
	self:addElement( PriceBacker )
	self.PriceBacker = PriceBacker
	
	local MissionLockIcon = nil
	
	MissionLockIcon = LUI.UIImage.new()
	MissionLockIcon.id = "MissionLockIcon"
	MissionLockIcon:setImage( RegisterMaterial( "icon_slot_locked" ), 0 )
	MissionLockIcon:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 82, _1080p * -82, _1080p * 44, _1080p * -20 )
	self:addElement( MissionLockIcon )
	self.MissionLockIcon = MissionLockIcon
	
	local LevelBacker = nil
	
	LevelBacker = LUI.UIImage.new()
	LevelBacker.id = "LevelBacker"
	LevelBacker:SetRGBFromInt( 0, 0 )
	LevelBacker:SetAlpha( 0.6, 0 )
	LevelBacker:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -15, _1080p * 15, _1080p * -20, 0 )
	self:addElement( LevelBacker )
	self.LevelBacker = LevelBacker
	
	local LeftNotch = nil
	
	LeftNotch = LUI.UIImage.new()
	LeftNotch.id = "LeftNotch"
	LeftNotch:SetRGBFromInt( 0, 0 )
	LeftNotch:SetAlpha( 0.6, 0 )
	LeftNotch:SetZRotation( -180, 0 )
	LeftNotch:setImage( RegisterMaterial( "wdg_slot_cut_out_1" ), 0 )
	LeftNotch:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 65, _1080p * -115, _1080p * 80, 0 )
	self:addElement( LeftNotch )
	self.LeftNotch = LeftNotch
	
	local UnlockLevel = nil
	
	UnlockLevel = LUI.UIStyledText.new()
	UnlockLevel.id = "UnlockLevel"
	UnlockLevel:setText( "", 0 )
	UnlockLevel:SetFontSize( 18 * _1080p )
	UnlockLevel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	UnlockLevel:SetAlignment( LUI.Alignment.Center )
	UnlockLevel:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -115, _1080p * -85, _1080p * 31, _1080p * 49 )
	self:addElement( UnlockLevel )
	self.UnlockLevel = UnlockLevel
	
	local RightNotch = nil
	
	RightNotch = LUI.UIImage.new()
	RightNotch.id = "RightNotch"
	RightNotch:SetRGBFromInt( 0, 0 )
	RightNotch:SetAlpha( 0.6, 0 )
	RightNotch:SetZRotation( 90, 0 )
	RightNotch:setImage( RegisterMaterial( "wdg_slot_cut_out_1" ), 0 )
	RightNotch:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 115, _1080p * -65, _1080p * 80, 0 )
	self:addElement( RightNotch )
	self.RightNotch = RightNotch
	
	f0_local1( self, f5_local1, controller )
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "QualityIcon",
		sequenceName = "StopPulse",
		elementPath = "ArmoryWeaponButton.QualityIcon"
	} )
	return self
end

MenuBuilder.registerType( "ArmoryMissionTeamsButton", ArmoryMissionTeamsButton )
LockTable( _M )
