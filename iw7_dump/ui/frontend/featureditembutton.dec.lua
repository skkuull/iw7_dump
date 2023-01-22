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
	assert( f2_arg0.ItemPrices )
	f2_arg0.ItemPrices.ignoreCostOverride = true
	local f2_local0 = function ()
		local f3_local0 = f2_arg0:GetDataSource()
		f3_local0 = f3_local0.identifier:GetValue( f2_arg1 )
		local f3_local1 = Loot.IsOwned( f2_arg1, f3_local0 )
		local f3_local2 = tonumber( f3_local0 )
		if f3_local2 == Engine.GetDvarInt( "online_quartermaster_event_crate_ref_id" ) then
			f0_local0( f2_arg0, "BribeCrate" )
		elseif f3_local2 == Engine.GetDvarInt( "online_bundle_crate_id" ) or f3_local2 == Engine.GetDvarInt( "online_bundle2_crate_id" ) then
			f0_local0( f2_arg0, "MPBundle" )
		elseif f3_local2 == Engine.GetDvarInt( "online_zbundle_crate_id" ) then
			f0_local0( f2_arg0, "CPBundle" )
		else
			f0_local0( f2_arg0, "RegularCrate" )
		end
	end
	
	f2_arg0:addEventHandler( "popup_inactive", function ( f4_arg0, f4_arg1 )
		local f4_local0 = f2_arg0:GetDataSource()
		local f4_local1 = Loot.IsOwned( f2_arg1, f4_local0.identifier:GetValue( f2_arg1 ) )
	end )
	local f2_local1 = DataSources.frontEnd.MP.commerce.inGameCurrency
	local f2_local2 = DataSources.frontEnd.MP.commerce.premiumCurrency
	local f2_local3 = DataSources.frontEnd.MP.commerce.craftingCurrency
	f2_arg0:SubscribeToModel( f2_local1:GetModel( f2_arg1 ), f2_local0, true )
	f2_arg0:SubscribeToModel( f2_local2:GetModel( f2_arg1 ), f2_local0, true )
	f2_arg0:SubscribeToModel( f2_local3:GetModel( f2_arg1 ), f2_local0, true )
	f2_arg0:SubscribeToModelThroughElement( f2_arg0, "cost", f2_local0 )
	f2_arg0:SubscribeToModelThroughElement( f2_arg0, "identifier", f2_local0 )
end

function FeaturedItemButton( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 680 * _1080p, 0, 200 * _1080p )
	self.id = "FeaturedItemButton"
	self._animationSets = {}
	self._sequences = {}
	local f5_local1 = controller and controller.controllerIndex
	if not f5_local1 and not Engine.InFrontend() then
		f5_local1 = self:getRootController()
	end
	assert( f5_local1 )
	local f5_local2 = self
	local f5_local3 = nil
	if Engine.InFrontend() then
		f5_local3 = LUI.UIBlur.new()
		f5_local3.id = "Blur"
		f5_local3:SetBlurStrength( 2.75, 0 )
		self:addElement( f5_local3 )
		self.Blur = f5_local3
	end
	local Background = nil
	
	Background = MenuBuilder.BuildRegisteredType( "BribeButtonBackground", {
		controllerIndex = f5_local1
	} )
	Background.id = "Background"
	Background:SetAlpha( 0, 0 )
	Background:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local f5_local5 = nil
	if Engine.InFrontend() then
		f5_local5 = LUI.UIImage.new()
		f5_local5.id = "DropShadow"
		f5_local5:SetRGBFromInt( 0, 0 )
		f5_local5:SetAlpha( 0.3, 0 )
		f5_local5:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
		f5_local5:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, 0, _1080p * 4 )
		self:addElement( f5_local5 )
		self.DropShadow = f5_local5
	end
	local InventoryButton = nil
	
	InventoryButton = MenuBuilder.BuildRegisteredType( "InventoryButton", {
		controllerIndex = f5_local1
	} )
	InventoryButton.id = "InventoryButton"
	InventoryButton:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 680, 0, _1080p * 200 )
	self:addElement( InventoryButton )
	self.InventoryButton = InventoryButton
	
	local BankedCrates = nil
	
	BankedCrates = LUI.UIStyledText.new()
	BankedCrates.id = "BankedCrates"
	BankedCrates:setText( "00", 0 )
	BankedCrates:SetFontSize( 38 * _1080p )
	BankedCrates:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	BankedCrates:SetAlignment( LUI.Alignment.Right )
	BankedCrates:SetShadowMinDistance( -0.2, 0 )
	BankedCrates:SetShadowMaxDistance( 0.2, 0 )
	BankedCrates:SetShadowRGBFromInt( 0, 0 )
	BankedCrates:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -82, _1080p * -4, _1080p * 28, _1080p * 66 )
	self:addElement( BankedCrates )
	self.BankedCrates = BankedCrates
	
	local Sheen = nil
	
	Sheen = MenuBuilder.BuildRegisteredType( "BribeButtonSheen", {
		controllerIndex = f5_local1
	} )
	Sheen.id = "Sheen"
	Sheen:SetAlpha( 0, 0 )
	Sheen:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 24, 0 )
	self:addElement( Sheen )
	self.Sheen = Sheen
	
	local ItemPrices = nil
	
	ItemPrices = MenuBuilder.BuildRegisteredType( "QuatermasterItemPrices", {
		controllerIndex = f5_local1
	} )
	ItemPrices.id = "ItemPrices"
	ItemPrices:SetDataSourceThroughElement( self, nil )
	ItemPrices:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -100, 0, _1080p * -116, _1080p * -8 )
	self:addElement( ItemPrices )
	self.ItemPrices = ItemPrices
	
	local FeatureItemBanner = nil
	
	FeatureItemBanner = MenuBuilder.BuildRegisteredType( "FeatureItemBanner", {
		controllerIndex = f5_local1
	} )
	FeatureItemBanner.id = "FeatureItemBanner"
	FeatureItemBanner:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 24, 0 )
	self:addElement( FeatureItemBanner )
	self.FeatureItemBanner = FeatureItemBanner
	
	local Image = nil
	
	Image = LUI.UIImage.new()
	Image.id = "Image"
	Image:setImage( RegisterMaterial( "icon_bribe_mk2" ), 0 )
	Image:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 6, _1080p * 288, _1080p * 59, _1080p * 200 )
	self:addElement( Image )
	self.Image = Image
	
	local ItemName = nil
	
	ItemName = LUI.UIText.new()
	ItemName.id = "ItemName"
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
	SoldOutBacker:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * 7, _1080p * 47 )
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
	SoldOutText:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * 10, _1080p * 44 )
	self:addElement( SoldOutText )
	self.SoldOutText = SoldOutText
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		if Engine.InFrontend() then
			f5_local3:RegisterAnimationSequence( "ButtonOver", {
				{
					function ()
						return self.Blur:SetAlpha( 1, 0 )
					end
				},
				{
					function ()
						return self.Blur:SetRGBFromInt( 16777215, 0 )
					end
				}
			} )
		end
		ItemPrices:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.ItemPrices:SetRGBFromInt( 16777215, 0 )
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
		self._sequences.ButtonOver = function ()
			if Engine.InFrontend() then
				f5_local3:AnimateSequence( "ButtonOver" )
			end
			ItemPrices:AnimateSequence( "ButtonOver" )
			FeatureItemBanner:AnimateSequence( "ButtonOver" )
			Image:AnimateSequence( "ButtonOver" )
			ItemName:AnimateSequence( "ButtonOver" )
			SoldOutText:AnimateSequence( "ButtonOver" )
		end
		
		if Engine.InFrontend() then
			f5_local3:RegisterAnimationSequence( "ButtonUp", {
				{
					function ()
						return self.Blur:SetAlpha( 1, 0 )
					end
				},
				{
					function ()
						return self.Blur:SetRGBFromInt( 16777215, 0 )
					end
				}
			} )
		end
		ItemPrices:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.ItemPrices:SetRGBFromInt( 16777215, 0 )
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
		self._sequences.ButtonUp = function ()
			if Engine.InFrontend() then
				f5_local3:AnimateSequence( "ButtonUp" )
			end
			ItemPrices:AnimateSequence( "ButtonUp" )
			FeatureItemBanner:AnimateSequence( "ButtonUp" )
			Image:AnimateSequence( "ButtonUp" )
			ItemName:AnimateSequence( "ButtonUp" )
			SoldOutText:AnimateSequence( "ButtonUp" )
		end
		
		ItemPrices:RegisterAnimationSequence( "Available", {
			{
				function ()
					return self.ItemPrices:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
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
			ItemPrices:AnimateSequence( "Available" )
			Image:AnimateSequence( "Available" )
			ItemName:AnimateSequence( "Available" )
			SoldOutBacker:AnimateSequence( "Available" )
			SoldOutText:AnimateSequence( "Available" )
		end
		
		self._sequences.Unavailable = function ()
			
		end
		
		if Engine.InFrontend() then
			f5_local3:RegisterAnimationSequence( "DisabledOver", {
				{
					function ()
						return self.Blur:SetRGBFromTable( SWATCHES.MPArmory.disabledLootCrate, 0 )
					end
				}
			} )
		end
		ItemPrices:RegisterAnimationSequence( "DisabledOver", {
			{
				function ()
					return self.ItemPrices:SetRGBFromTable( SWATCHES.MPArmory.disabledLootCrate, 0 )
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
		self._sequences.DisabledOver = function ()
			if Engine.InFrontend() then
				f5_local3:AnimateSequence( "DisabledOver" )
			end
			ItemPrices:AnimateSequence( "DisabledOver" )
			FeatureItemBanner:AnimateSequence( "DisabledOver" )
			Image:AnimateSequence( "DisabledOver" )
			ItemName:AnimateSequence( "DisabledOver" )
			SoldOutText:AnimateSequence( "DisabledOver" )
		end
		
		if Engine.InFrontend() then
			f5_local3:RegisterAnimationSequence( "DisabledUp", {
				{
					function ()
						return self.Blur:SetRGBFromInt( 6710886, 0 )
					end
				}
			} )
		end
		ItemPrices:RegisterAnimationSequence( "DisabledUp", {
			{
				function ()
					return self.ItemPrices:SetRGBFromTable( SWATCHES.MPArmory.disabledLootCrate, 0 )
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
					return self.ItemName:SetRGBFromInt( 3355443, 0 )
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
		self._sequences.DisabledUp = function ()
			if Engine.InFrontend() then
				f5_local3:AnimateSequence( "DisabledUp" )
			end
			ItemPrices:AnimateSequence( "DisabledUp" )
			FeatureItemBanner:AnimateSequence( "DisabledUp" )
			Image:AnimateSequence( "DisabledUp" )
			ItemName:AnimateSequence( "DisabledUp" )
			SoldOutText:AnimateSequence( "DisabledUp" )
		end
		
		Background:RegisterAnimationSequence( "BribeCrate", {
			{
				function ()
					return self.Background:SetAlpha( 1, 0 )
				end
			}
		} )
		Sheen:RegisterAnimationSequence( "BribeCrate", {
			{
				function ()
					return self.Sheen:SetAlpha( 0.5, 0 )
				end
			}
		} )
		self._sequences.BribeCrate = function ()
			Background:AnimateSequence( "BribeCrate" )
			Sheen:AnimateSequence( "BribeCrate" )
		end
		
		self._sequences.MPBundle = function ()
			
		end
		
		self._sequences.CPBundle = function ()
			
		end
		
		self._sequences.RegularCrate = function ()
			
		end
		
		ItemPrices:RegisterAnimationSequence( "SoldOut", {
			{
				function ()
					return self.ItemPrices:SetRGBFromTable( SWATCHES.MPArmory.disabledLootCrate, 0 )
				end
			}
		} )
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
			ItemPrices:AnimateSequence( "SoldOut" )
			Image:AnimateSequence( "SoldOut" )
			ItemName:AnimateSequence( "SoldOut" )
			SoldOutBacker:AnimateSequence( "SoldOut" )
			SoldOutText:AnimateSequence( "SoldOut" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	ItemPrices:SetDataSourceThroughElement( self, nil )
	self:addEventHandler( "button_over", function ( f57_arg0, f57_arg1 )
		local f57_local0 = f57_arg1.controller or f5_local1
		ACTIONS.AnimateSequence( self, "ButtonOver" )
		ACTIONS.AnimateSequenceByElement( self, {
			elementName = "Sheen",
			sequenceName = "Pan",
			elementPath = "Sheen"
		} )
	end )
	self:addEventHandler( "button_up", function ( f58_arg0, f58_arg1 )
		local f58_local0 = f58_arg1.controller or f5_local1
		ACTIONS.AnimateSequence( self, "ButtonUp" )
		ACTIONS.AnimateSequenceByElement( self, {
			elementName = "Sheen",
			sequenceName = "Stop",
			elementPath = "Sheen"
		} )
	end )
	self:addEventHandler( "button_disable", function ( f59_arg0, f59_arg1 )
		local f59_local0 = f59_arg1.controller or f5_local1
		ACTIONS.AnimateSequence( self, "DisabledUp" )
	end )
	self:addEventHandler( "button_over_disable", function ( f60_arg0, f60_arg1 )
		local f60_local0 = f60_arg1.controller or f5_local1
		ACTIONS.AnimateSequence( self, "DisabledOver" )
	end )
	f0_local1( self, f5_local1, controller )
	return self
end

MenuBuilder.registerType( "FeaturedItemButton", FeaturedItemButton )
LockTable( _M )
