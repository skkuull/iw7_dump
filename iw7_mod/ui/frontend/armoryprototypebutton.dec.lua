local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0.Price:SetRGBFromTable( Cac.GetPriceColor( f1_arg1, f1_arg2 ) )
end

f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2, f2_arg3 )
	assert( f2_arg0.Price )
	assert( f2_arg0.CurrencyLogo )
	local f2_local0 = f2_arg0.ArmoryWeaponButton
	assert( f2_local0.Image )
	assert( f2_local0.Name )
	assert( f2_local0.QualityIcon )
	assert( f2_local0.UnavailableOverlay )
	local f2_local1 = Cac.GetLootWeaponQuality( f2_arg3.ref )
	local f2_local2 = Cac.GetLootWeaponCost( f2_arg3.ref )
	local f2_local3 = Engine.Localize( f2_arg3.suffix )
	local f2_local4 = f2_arg3.displayImage
	f2_local0.Image:setImage( RegisterMaterial( f2_local4 ) )
	f2_local0.Name:setText( f2_local3 )
	f2_local0.QualityIcon.Icon:setImage( RegisterMaterial( Cac.GetLootQualityImage( f2_local1 ) ) )
	f2_local0.QualityIcon.Icon:SetRGBFromInt( Cac.GetLootQualityColor( f2_local1 ), 0 )
	f2_arg0.Price:setText( f2_local2 )
	f2_arg0.Price:SetShadowUOffset( -0 )
	f2_arg0.Price:SetShadowVOffset( -0 )
	f0_local0( f2_arg0, f2_arg1, f2_local2 )
	local f2_local5 = Cac.GetWeaponUniqueID( f2_arg3.ref )
	f2_local0.lootID = f2_local5
	f2_local0.cost = f2_local2
	f2_local0.name = f2_local3
	f2_local0.itemImage = f2_local4
	f2_local0.isOwned = Loot.IsOwned( f2_arg1, f2_local5 ) > 0
	local f2_local6 = Cac.IsBaseWeaponUnlockedMode( Cac.GetBaseWeaponRefFromLootID( f2_local5 ), f2_arg1 )
	local f2_local7 = Engine.TableLookup( CSV.weaponLootMaster.file, CSV.weaponLootMaster.cols.index, f2_local5, CSV.weaponLootMaster.cols.missionTeam )
	if f2_local7 == MissionDirector.teamRnGValue and not ARMORY.IsWeaponRnG( f2_local5, f2_local7 ) then
		f2_local6 = true
	end
	ARMORY.TogglePrototypeButtonStates( f2_local0, f2_local0.Image, f2_local0.QualityIcon, f2_local0.Lock, f2_local0.UnavailableOverlay, f2_arg0.CurrencyLogo, f2_arg0.Price, f2_arg0.PriceBacker, f2_arg1, f2_local5, f2_local6 )
end

f0_local2 = function ( f3_arg0, f3_arg1, f3_arg2 )
	assert( f3_arg0.ArmoryWeaponButton )
	local f3_local0 = f3_arg0.ArmoryWeaponButton
	f3_arg0.SetupVariantData = f0_local1
	f3_local0:addEventHandler( "button_action", function ( f4_arg0, f4_arg1 )
		if not f4_arg0.isOwned then
			local f4_local0 = DataSources.frontEnd.MP.commerce.craftingCurrency:GetValue( f3_arg1 )
			local f4_local1 = Loot.CraftDetails( f3_arg1, f4_arg0.lootID )
			local f4_local2 = f4_local1.canCraft
			local f4_local3 = Cac.IsBaseWeaponUnlockedMode( Cac.GetBaseWeaponRefFromLootID( f4_arg0.lootID ), f3_arg1 )
			local f4_local4 = Engine.TableLookup( CSV.weaponLootMaster.file, CSV.weaponLootMaster.cols.index, f4_arg0.lootID, CSV.weaponLootMaster.cols.missionTeam )
			if f4_local4 == MissionDirector.teamRnGValue and not ARMORY.IsWeaponRnG( f4_arg0.lootID, f4_local4 ) then
				f4_local3 = true
			end
			local f4_local5 = LUI.FlowManager.GetScopedData( f3_arg0 )
			if f4_local2 and f4_local3 then
				if f4_arg0.cost <= f4_local0 then
					LUI.FlowManager.RequestPopupMenu( f3_arg0, "PurchaseArmoryItem", true, f3_arg1, false, {
						lootItemID = f4_arg0.lootID,
						cost = f4_arg0.cost,
						name = f4_arg0.name,
						itemImage = f4_arg0.itemImage,
						scopedContext = f4_local5.context
					} )
				else
					LUI.FlowManager.RequestPopupMenu( f3_arg0, "PopupOK", true, f3_arg1, false, {
						message = Engine.Localize( "LUA_MENU_NOT_ENOUGH_SALVAGE" )
					} )
				end
			end
		end
	end )
	f3_local0:addEventHandler( "button_over", function ( f5_arg0, f5_arg1 )
		local f5_local0 = f5_arg0:GetCurrentMenu()
		assert( f5_local0.ButtonHelperBar )
		assert( f5_local0.ArmoryWeaponCard )
		f5_local0.ArmoryWeaponCard:SetWeapon( f5_arg0.lootID, f3_arg1 or f5_arg1.controller )
		if not f5_arg0.isOwned then
			f5_local0.buttonHelperAddedByID = f5_arg0.lootID
			if not f5_local0.buttonHelperAdded then
				f5_local0:AddButtonHelperTextToElement( f5_local0.ButtonHelperBar, {
					helper_text = Engine.Localize( "LUA_MENU_MP_CRAFT_CAPS" ),
					button_ref = "button_primary",
					side = "left",
					priority = -10,
					clickable = true
				} )
				f5_local0.buttonHelperAdded = true
			end
		else
			f5_local0:RemoveButtonHelperTextFromElement( f5_local0.ButtonHelperBar, "button_primary", "left" )
			f5_local0.buttonHelperAdded = false
		end
	end )
	f3_local0:addEventHandler( "update_currency", function ( f6_arg0, f6_arg1 )
		if not f6_arg0.isOwned then
			f0_local0( f3_arg0, f6_arg1.controller or f3_arg1, f6_arg0.cost )
		end
	end )
	f3_local0:addEventHandler( "button_up", function ( f7_arg0, f7_arg1 )
		local f7_local0 = f7_arg0:GetCurrentMenu()
		assert( f7_local0.ButtonHelperBar )
		if f7_local0.buttonHelperAdded and f7_local0.buttonHelperAddedByID == f7_arg0.lootID then
			f7_local0:RemoveButtonHelperTextFromElement( f7_local0.ButtonHelperBar, "button_primary", "left" )
			f7_local0.buttonHelperAdded = false
		end
	end )
end

function ArmoryPrototypeButton( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 200 * _1080p, 0, 100 * _1080p )
	self.id = "ArmoryPrototypeButton"
	local f8_local1 = controller and controller.controllerIndex
	if not f8_local1 and not Engine.InFrontend() then
		f8_local1 = self:getRootController()
	end
	assert( f8_local1 )
	local f8_local2 = self
	local ArmoryWeaponButton = nil
	
	ArmoryWeaponButton = MenuBuilder.BuildRegisteredType( "ArmoryWeaponButton", {
		controllerIndex = f8_local1
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
	PriceBacker:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -107, 0, 0, _1080p * 24 )
	self:addElement( PriceBacker )
	self.PriceBacker = PriceBacker
	
	local CurrencyLogo = nil
	
	CurrencyLogo = LUI.UIImage.new()
	CurrencyLogo.id = "CurrencyLogo"
	CurrencyLogo:setImage( RegisterMaterial( "currency_parts_icon" ), 0 )
	CurrencyLogo:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -22, _1080p * 22, _1080p * -10, _1080p * 34 )
	self:addElement( CurrencyLogo )
	self.CurrencyLogo = CurrencyLogo
	
	local Price = nil
	
	Price = LUI.UIStyledText.new()
	Price.id = "Price"
	Price:SetRGBFromTable( SWATCHES.MPArmory.weaponPrice, 0 )
	Price:SetAlpha( 0, 0 )
	Price:setText( "", 0 )
	Price:SetFontSize( 22 * _1080p )
	Price:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Price:SetAlignment( LUI.Alignment.Left )
	Price:SetOptOutRightToLeftAlignmentFlip( true )
	Price:SetShadowMinDistance( -0.2, 0 )
	Price:SetShadowMaxDistance( 0.2, 0 )
	Price:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -82, _1080p * -10, _1080p * 1, _1080p * 23 )
	self:addElement( Price )
	self.Price = Price
	
	f0_local2( self, f8_local1, controller )
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "QualityIcon",
		sequenceName = "StopPulse",
		elementPath = "ArmoryWeaponButton.QualityIcon"
	} )
	return self
end

MenuBuilder.registerType( "ArmoryPrototypeButton", ArmoryPrototypeButton )
LockTable( _M )
