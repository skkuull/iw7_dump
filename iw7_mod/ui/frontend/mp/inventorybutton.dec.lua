local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1 )
	if f1_arg0.lastCrateTypeAnimPlayed ~= f1_arg1 then
		f1_arg0.lastCrateTypeAnimPlayed = f1_arg1
		ACTIONS.AnimateSequence( f1_arg0, f1_arg1 )
	end
end

f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2 )
	local f2_local0 = f2_arg2.crateID
	if f2_local0 then
		local f2_local1 = f2_arg2.crateType
		local f2_local2 = function ()
			local f3_local0 = DataSources.frontEnd.MP.commerce.inGameCurrency:GetValue( f2_arg1 )
			local f3_local1 = DataSources.frontEnd.MP.commerce.premiumCurrency:GetValue( f2_arg1 )
			local f3_local2 = DataSources.frontEnd.MP.commerce.craftingCurrency:GetValue( f2_arg1 )
			local f3_local3, f3_local4, f3_local5 = nil
			if f2_local1 == ARMORY.CrateTypes.BUNDLE then
				f3_local3 = Engine.GetDvarInt( "online_bundle_crate_price_key" )
				f3_local4 = Engine.GetDvarInt( "online_bundle_crate_price_cp" )
				f3_local5 = Engine.GetDvarInt( "online_bundle_crate_price_scrap" )
			elseif f2_local1 == ARMORY.CrateTypes.SECOND_BUNDLE then
				f3_local3 = Engine.GetDvarInt( "online_bundle2_crate_price_key" )
				f3_local4 = Engine.GetDvarInt( "online_bundle2_crate_price_cp" )
				f3_local5 = Engine.GetDvarInt( "online_bundle2_crate_price_scrap" )
			elseif f2_local1 == ARMORY.CrateTypes.ZOMBIE_BUNDLE then
				f3_local3 = Engine.GetDvarInt( "online_zbundle_crate_price_key" )
				f3_local4 = Engine.GetDvarInt( "online_zbundle_crate_price_cp" )
				f3_local5 = Engine.GetDvarInt( "online_zbundle_crate_price_scrap" )
			end
			if f2_local0 == Engine.GetDvarInt( "online_quartermaster_event_crate_ref_id" ) then
				f0_local0( f2_arg0, "BribeCrate" )
			elseif f2_local0 == Engine.GetDvarInt( "online_bundle_crate_id" ) or f2_local0 == Engine.GetDvarInt( "online_bundle2_crate_id" ) then
				f0_local0( f2_arg0, "MPBundle" )
			elseif f2_local0 == Engine.GetDvarInt( "online_zbundle_crate_id" ) then
				f0_local0( f2_arg0, "CPBundle" )
			else
				f0_local0( f2_arg0, "RegularCrate" )
			end
			if f3_local3 > 0 then
				f2_arg0.CurrencyCount:SetAlpha( 1, 0 )
				f2_arg0.CurrencyCount.CurrencyCount:setText( f3_local3, 0 )
				if f3_local3 <= f3_local0 then
					ACTIONS.AnimateSequence( f2_arg0.CurrencyCount, "Available" )
				elseif f3_local0 < f3_local3 then
					ACTIONS.AnimateSequence( f2_arg0.CurrencyCount, "Unavailable" )
				end
			end
			if f3_local4 > 0 and f2_arg0.PremiumCurrencyCount then
				f2_arg0.PremiumCurrencyCount:SetAlpha( 1, 0 )
				f2_arg0.PremiumCurrencyCount.CODPointsValue:setText( f3_local4, 0 )
				if f3_local1 < f3_local4 then
					f2_arg0.PremiumCurrencyCount.CODPointsValue:SetRGBFromTable( SWATCHES.MPArmory.PriceCannotBuy, 0 )
				else
					f2_arg0.PremiumCurrencyCount.CODPointsValue:SetRGBFromTable( COLORS.white, 0 )
				end
			end
			if f3_local5 > 0 then
				f2_arg0.AltCurrencyCount:SetAlpha( 1, 0 )
				f2_arg0.AltCurrencyCount.CurrencyCount:setText( f3_local5, 0 )
				if f3_local2 < f3_local5 then
					f2_arg0.AltCurrencyCount.CurrencyCount:SetRGBFromTable( SWATCHES.MPArmory.PriceCannotBuy, 0 )
				else
					f2_arg0.AltCurrencyCount.CurrencyCount:SetRGBFromTable( COLORS.white, 0 )
				end
			end
		end
		
		f2_arg0.ArmoryButton.BGImage:SetAlpha( 1, 0 )
		local f2_local3 = DataSources.frontEnd.MP.commerce.inGameCurrency
		local f2_local4 = DataSources.frontEnd.MP.commerce.premiumCurrency
		local f2_local5 = DataSources.frontEnd.MP.commerce.craftingCurrency
		f2_arg0:SubscribeToModel( f2_local3:GetModel( f2_arg1 ), f2_local2, true )
		f2_arg0:SubscribeToModel( f2_local4:GetModel( f2_arg1 ), f2_local2, true )
		f2_arg0:SubscribeToModel( f2_local5:GetModel( f2_arg1 ), f2_local2, true )
		f2_local2()
	end
end

function InventoryButton( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 680 * _1080p, 0, 200 * _1080p )
	self.id = "InventoryButton"
	self._animationSets = {}
	self._sequences = {}
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	self.buttonDescription = Engine.Localize( "MENU_INVENTORY_DESC" )
	local f4_local3 = nil
	if Engine.InFrontend() then
		f4_local3 = LUI.UIBlur.new()
		f4_local3.id = "Blur"
		f4_local3:SetBlurStrength( 2.75, 0 )
		self:addElement( f4_local3 )
		self.Blur = f4_local3
	end
	local ArmoryButton = nil
	
	ArmoryButton = MenuBuilder.BuildRegisteredType( "ArmoryButton", {
		controllerIndex = f4_local1
	} )
	ArmoryButton.id = "ArmoryButton"
	ArmoryButton.TitleText:setText( ToUpperCase( Engine.Localize( "LUA_MENU_ARMORY" ) ), 0 )
	ArmoryButton:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( ArmoryButton )
	self.ArmoryButton = ArmoryButton
	
	local f4_local5 = nil
	if CONDITIONS.AreCODPointsEnabled( self ) then
		f4_local5 = MenuBuilder.BuildRegisteredType( "PremiumCurrencyCount", {
			controllerIndex = f4_local1
		} )
		f4_local5.id = "PremiumCurrencyCount"
		f4_local5:SetAlpha( 0, 0 )
		f4_local5:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -100, 0, _1080p * -44, _1080p * -8 )
		self:addElement( f4_local5 )
		self.PremiumCurrencyCount = f4_local5
	end
	local AltCurrencyCount = nil
	
	AltCurrencyCount = MenuBuilder.BuildRegisteredType( "ScrapCurrencyCount", {
		controllerIndex = f4_local1
	} )
	AltCurrencyCount.id = "AltCurrencyCount"
	AltCurrencyCount:SetAlpha( 0, 0 )
	AltCurrencyCount.CurrencyCount:setText( "", 0 )
	AltCurrencyCount:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -91, _1080p * -5, _1080p * -116, _1080p * -80 )
	self:addElement( AltCurrencyCount )
	self.AltCurrencyCount = AltCurrencyCount
	
	local CurrencyCount = nil
	
	CurrencyCount = MenuBuilder.BuildRegisteredType( "InGameCurrencyCount", {
		controllerIndex = f4_local1
	} )
	CurrencyCount.id = "CurrencyCount"
	CurrencyCount:SetAlpha( 0, 0 )
	CurrencyCount.CurrencyCount:setText( "", 0 )
	CurrencyCount:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -100, 0, _1080p * -80, _1080p * -44 )
	self:addElement( CurrencyCount )
	self.CurrencyCount = CurrencyCount
	
	local Image = nil
	
	Image = LUI.UIImage.new()
	Image.id = "Image"
	Image:SetAlpha( 0, 0 )
	Image:setImage( RegisterMaterial( "icon_bribe_mk2" ), 0 )
	Image:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 6, _1080p * 288, _1080p * 59, _1080p * 200 )
	self:addElement( Image )
	self.Image = Image
	
	local ItemName = nil
	
	ItemName = LUI.UIText.new()
	ItemName.id = "ItemName"
	ItemName:SetAlpha( 0, 0 )
	ItemName:setText( "Item Name", 0 )
	ItemName:SetFontSize( 24 * _1080p )
	ItemName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ItemName:SetAlignment( LUI.Alignment.Left )
	ItemName:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 288, _1080p * 564, _1080p * 112, _1080p * 136 )
	self:addElement( ItemName )
	self.ItemName = ItemName
	
	local SoldOutBacker = nil
	
	SoldOutBacker = LUI.UIImage.new()
	SoldOutBacker.id = "SoldOutBacker"
	SoldOutBacker:SetRGBFromInt( 0, 0 )
	SoldOutBacker:SetAlpha( 0, 0 )
	SoldOutBacker:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 30, _1080p * -30, _1080p * -8, _1080p * 32 )
	self:addElement( SoldOutBacker )
	self.SoldOutBacker = SoldOutBacker
	
	local SoldOutText = nil
	
	SoldOutText = LUI.UIText.new()
	SoldOutText.id = "SoldOutText"
	SoldOutText:SetAlpha( 0, 0 )
	SoldOutText:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_ARMORY_ITEM_SOLD_OUT" ) ), 0 )
	SoldOutText:SetFontSize( 34 * _1080p )
	SoldOutText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	SoldOutText:SetAlignment( LUI.Alignment.Center )
	SoldOutText:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 30, _1080p * -30, _1080p * -5, _1080p * 29 )
	self:addElement( SoldOutText )
	self.SoldOutText = SoldOutText
	
	local FeatureItemBanner = nil
	
	FeatureItemBanner = MenuBuilder.BuildRegisteredType( "FeatureItemBanner", {
		controllerIndex = f4_local1
	} )
	FeatureItemBanner.id = "FeatureItemBanner"
	FeatureItemBanner:SetAlpha( 0, 0 )
	FeatureItemBanner:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 24, 0 )
	self:addElement( FeatureItemBanner )
	self.FeatureItemBanner = FeatureItemBanner
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		if Engine.InFrontend() then
			f4_local3:RegisterAnimationSequence( "ButtonOver", {
				{
					function ()
						return self.Blur:SetRGBFromInt( 16777215, 0 )
					end
				}
			} )
		end
		if CONDITIONS.AreCODPointsEnabled( self ) then
			f4_local5:RegisterAnimationSequence( "ButtonOver", {
				{
					function ()
						return self.PremiumCurrencyCount:SetRGBFromInt( 16777215, 0 )
					end
				}
			} )
		end
		AltCurrencyCount:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.AltCurrencyCount:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		CurrencyCount:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.CurrencyCount:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		Image:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Image:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		ItemName:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.ItemName:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		SoldOutText:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.SoldOutText:SetRGBFromTable( SWATCHES.CAC.streakSelected, 0 )
				end
			}
		} )
		FeatureItemBanner:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.FeatureItemBanner:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			if Engine.InFrontend() then
				f4_local3:AnimateSequence( "ButtonOver" )
			end
			if CONDITIONS.AreCODPointsEnabled( self ) then
				f4_local5:AnimateSequence( "ButtonOver" )
			end
			AltCurrencyCount:AnimateSequence( "ButtonOver" )
			CurrencyCount:AnimateSequence( "ButtonOver" )
			Image:AnimateSequence( "ButtonOver" )
			ItemName:AnimateSequence( "ButtonOver" )
			SoldOutText:AnimateSequence( "ButtonOver" )
			FeatureItemBanner:AnimateSequence( "ButtonOver" )
		end
		
		if Engine.InFrontend() then
			f4_local3:RegisterAnimationSequence( "ButtonUp", {
				{
					function ()
						return self.Blur:SetRGBFromInt( 16777215, 0 )
					end
				}
			} )
		end
		if CONDITIONS.AreCODPointsEnabled( self ) then
			f4_local5:RegisterAnimationSequence( "ButtonUp", {
				{
					function ()
						return self.PremiumCurrencyCount:SetRGBFromInt( 16777215, 0 )
					end
				}
			} )
		end
		AltCurrencyCount:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.AltCurrencyCount:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		CurrencyCount:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.CurrencyCount:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		Image:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Image:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		ItemName:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.ItemName:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		SoldOutText:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.SoldOutText:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		FeatureItemBanner:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.FeatureItemBanner:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		self._sequences.ButtonUp = function ()
			if Engine.InFrontend() then
				f4_local3:AnimateSequence( "ButtonUp" )
			end
			if CONDITIONS.AreCODPointsEnabled( self ) then
				f4_local5:AnimateSequence( "ButtonUp" )
			end
			AltCurrencyCount:AnimateSequence( "ButtonUp" )
			CurrencyCount:AnimateSequence( "ButtonUp" )
			Image:AnimateSequence( "ButtonUp" )
			ItemName:AnimateSequence( "ButtonUp" )
			SoldOutText:AnimateSequence( "ButtonUp" )
			FeatureItemBanner:AnimateSequence( "ButtonUp" )
		end
		
		if Engine.InFrontend() then
			f4_local3:RegisterAnimationSequence( "DisabledUp", {
				{
					function ()
						return self.Blur:SetRGBFromInt( 6710886, 0 )
					end
				}
			} )
		end
		if CONDITIONS.AreCODPointsEnabled( self ) then
			f4_local5:RegisterAnimationSequence( "DisabledUp", {
				{
					function ()
						return self.PremiumCurrencyCount:SetRGBFromTable( SWATCHES.MPArmory.disabledLootCrate, 0 )
					end
				}
			} )
		end
		AltCurrencyCount:RegisterAnimationSequence( "DisabledUp", {
			{
				function ()
					return self.AltCurrencyCount:SetRGBFromTable( SWATCHES.MPArmory.disabledLootCrate, 0 )
				end
			}
		} )
		CurrencyCount:RegisterAnimationSequence( "DisabledUp", {
			{
				function ()
					return self.CurrencyCount:SetRGBFromTable( SWATCHES.MPArmory.disabledLootCrate, 0 )
				end
			}
		} )
		Image:RegisterAnimationSequence( "DisabledUp", {
			{
				function ()
					return self.Image:SetRGBFromTable( SWATCHES.MPArmory.disabledLootCrate, 0 )
				end
			}
		} )
		ItemName:RegisterAnimationSequence( "DisabledUp", {
			{
				function ()
					return self.ItemName:SetRGBFromTable( SWATCHES.MPArmory.disabledLootCrate, 0 )
				end
			}
		} )
		SoldOutText:RegisterAnimationSequence( "DisabledUp", {
			{
				function ()
					return self.SoldOutText:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		FeatureItemBanner:RegisterAnimationSequence( "DisabledUp", {
			{
				function ()
					return self.FeatureItemBanner:SetRGBFromTable( SWATCHES.MPArmory.disabledLootCrate, 0 )
				end
			}
		} )
		self._sequences.DisabledUp = function ()
			if Engine.InFrontend() then
				f4_local3:AnimateSequence( "DisabledUp" )
			end
			if CONDITIONS.AreCODPointsEnabled( self ) then
				f4_local5:AnimateSequence( "DisabledUp" )
			end
			AltCurrencyCount:AnimateSequence( "DisabledUp" )
			CurrencyCount:AnimateSequence( "DisabledUp" )
			Image:AnimateSequence( "DisabledUp" )
			ItemName:AnimateSequence( "DisabledUp" )
			SoldOutText:AnimateSequence( "DisabledUp" )
			FeatureItemBanner:AnimateSequence( "DisabledUp" )
		end
		
		if Engine.InFrontend() then
			f4_local3:RegisterAnimationSequence( "DisabledOver", {
				{
					function ()
						return self.Blur:SetRGBFromInt( 3355443, 0 )
					end
				}
			} )
		end
		if CONDITIONS.AreCODPointsEnabled( self ) then
			f4_local5:RegisterAnimationSequence( "DisabledOver", {
				{
					function ()
						return self.PremiumCurrencyCount:SetRGBFromTable( SWATCHES.MPArmory.disabledLootCrate, 0 )
					end
				}
			} )
		end
		AltCurrencyCount:RegisterAnimationSequence( "DisabledOver", {
			{
				function ()
					return self.AltCurrencyCount:SetRGBFromTable( SWATCHES.MPArmory.disabledLootCrate, 0 )
				end
			}
		} )
		CurrencyCount:RegisterAnimationSequence( "DisabledOver", {
			{
				function ()
					return self.CurrencyCount:SetRGBFromTable( SWATCHES.MPArmory.disabledLootCrate, 0 )
				end
			}
		} )
		Image:RegisterAnimationSequence( "DisabledOver", {
			{
				function ()
					return self.Image:SetRGBFromTable( SWATCHES.MPArmory.disabledLootCrate, 0 )
				end
			}
		} )
		ItemName:RegisterAnimationSequence( "DisabledOver", {
			{
				function ()
					return self.ItemName:SetRGBFromTable( SWATCHES.MPArmory.disabledLootCrate, 0 )
				end
			}
		} )
		SoldOutText:RegisterAnimationSequence( "DisabledOver", {
			{
				function ()
					return self.SoldOutText:SetRGBFromTable( SWATCHES.CAC.streakSelected, 0 )
				end
			}
		} )
		FeatureItemBanner:RegisterAnimationSequence( "DisabledOver", {
			{
				function ()
					return self.FeatureItemBanner:SetRGBFromTable( SWATCHES.MPArmory.disabledLootCrate, 0 )
				end
			}
		} )
		self._sequences.DisabledOver = function ()
			if Engine.InFrontend() then
				f4_local3:AnimateSequence( "DisabledOver" )
			end
			if CONDITIONS.AreCODPointsEnabled( self ) then
				f4_local5:AnimateSequence( "DisabledOver" )
			end
			AltCurrencyCount:AnimateSequence( "DisabledOver" )
			CurrencyCount:AnimateSequence( "DisabledOver" )
			Image:AnimateSequence( "DisabledOver" )
			ItemName:AnimateSequence( "DisabledOver" )
			SoldOutText:AnimateSequence( "DisabledOver" )
			FeatureItemBanner:AnimateSequence( "DisabledOver" )
		end
		
		self._sequences.BribeCrate = function ()
			
		end
		
		self._sequences.MPBundle = function ()
			
		end
		
		self._sequences.CPBundle = function ()
			
		end
		
		self._sequences.RegularCrate = function ()
			
		end
		
		Image:RegisterAnimationSequence( "SoldOut", {
			{
				function ()
					return self.Image:SetRGBFromTable( SWATCHES.MPArmory.disabledLootCrate, 0 )
				end
			}
		} )
		ItemName:RegisterAnimationSequence( "SoldOut", {
			{
				function ()
					return self.ItemName:SetRGBFromTable( SWATCHES.MPArmory.disabledLootCrate, 0 )
				end
			}
		} )
		SoldOutBacker:RegisterAnimationSequence( "SoldOut", {
			{
				function ()
					return self.SoldOutBacker:SetAlpha( 1, 0 )
				end
			}
		} )
		SoldOutText:RegisterAnimationSequence( "SoldOut", {
			{
				function ()
					return self.SoldOutText:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.SoldOut = function ()
			Image:AnimateSequence( "SoldOut" )
			ItemName:AnimateSequence( "SoldOut" )
			SoldOutBacker:AnimateSequence( "SoldOut" )
			SoldOutText:AnimateSequence( "SoldOut" )
		end
		
		Image:RegisterAnimationSequence( "Available", {
			{
				function ()
					return self.Image:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		ItemName:RegisterAnimationSequence( "Available", {
			{
				function ()
					return self.ItemName:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		SoldOutBacker:RegisterAnimationSequence( "Available", {
			{
				function ()
					return self.SoldOutBacker:SetAlpha( 0, 0 )
				end
			}
		} )
		SoldOutText:RegisterAnimationSequence( "Available", {
			{
				function ()
					return self.SoldOutText:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Available = function ()
			Image:AnimateSequence( "Available" )
			ItemName:AnimateSequence( "Available" )
			SoldOutBacker:AnimateSequence( "Available" )
			SoldOutText:AnimateSequence( "Available" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "button_disable", function ( f57_arg0, f57_arg1 )
		local f57_local0 = f57_arg1.controller or f4_local1
		ACTIONS.AnimateSequenceByElement( self, {
			elementName = "ArmoryButton",
			sequenceName = "DisabledUp",
			elementPath = "ArmoryButton"
		} )
		ACTIONS.AnimateSequence( self, "DisabledUp" )
	end )
	self:addEventHandler( "button_over_disable", function ( f58_arg0, f58_arg1 )
		local f58_local0 = f58_arg1.controller or f4_local1
		ACTIONS.AnimateSequenceByElement( self, {
			elementName = "ArmoryButton",
			sequenceName = "DisabledOver",
			elementPath = "ArmoryButton"
		} )
		ACTIONS.AnimateSequence( self, "DisabledOver" )
	end )
	self:addEventHandler( "button_up", function ( f59_arg0, f59_arg1 )
		local f59_local0 = f59_arg1.controller or f4_local1
		ACTIONS.AnimateSequence( self, "ButtonUp" )
	end )
	self:addEventHandler( "button_over", function ( f60_arg0, f60_arg1 )
		local f60_local0 = f60_arg1.controller or f4_local1
		ACTIONS.AnimateSequence( self, "ButtonOver" )
	end )
	f0_local1( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "InventoryButton", InventoryButton )
LockTable( _M )
