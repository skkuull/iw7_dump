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
	assert( f2_arg0.SaleNotification )
	f2_arg0.BankedCrates:SetShadowVOffset( -0 )
	f2_arg0.BankedCrates:SetShadowVOffset( -0 )
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
		if f3_local1 > 0 then
			f2_arg0.BankedCrates:setText( tostring( f3_local1 ), 0 )
		else
			f2_arg0.BankedCrates:setText( "", 0 )
		end
		local f3_local3 = f2_arg0:GetDataSource()
		if f3_local3.premiumCost:GetValue( f2_arg1 ) > 0 and Engine.GetDvarInt( "loot_crate_cost_overide" ) > 0 then
			f2_arg0.SaleNotification:SetAlpha( 1, 0 )
			Engine.SetPlayerDataEx( f2_arg1, CoD.StatsGroup.Common, "quartermasterSale", true )
		else
			Engine.SetPlayerDataEx( f2_arg1, CoD.StatsGroup.Common, "quartermasterSale", false )
		end
	end
	
	f2_arg0:addEventHandler( "popup_inactive", function ( f4_arg0, f4_arg1 )
		local f4_local0 = f2_arg0:GetDataSource()
		local f4_local1 = Loot.IsOwned( f2_arg1, f4_local0.identifier:GetValue( f2_arg1 ) )
		if f4_local1 > 0 then
			f2_arg0.BankedCrates:setText( tostring( f4_local1 ), 0 )
		else
			f2_arg0.BankedCrates:setText( "", 0 )
		end
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

function PurchaseLootCrateButton( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 335 * _1080p, 0, 200 * _1080p )
	self.id = "PurchaseLootCrateButton"
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
	local CaCButtonBaseImage = nil
	CaCButtonBaseImage = MenuBuilder.BuildRegisteredType( "CaCButtonBaseImage", {
		controllerIndex = f5_local1
	} )
	CaCButtonBaseImage.id = "CaCButtonBaseImage"
	CaCButtonBaseImage.Image:SetLeft( _1080p * -162, 0 )
	CaCButtonBaseImage.Image:SetRight( _1080p * 162, 0 )
	CaCButtonBaseImage.Image:SetTop( _1080p * -171, 0 )
	CaCButtonBaseImage.Image:SetBottom( _1080p * -5, 0 )
	CaCButtonBaseImage.Image:setImage( RegisterMaterial( "hud_icon_case_bomb" ), 0 )
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		CaCButtonBaseImage.Level:setText( "", 0 )
	end
	CaCButtonBaseImage.Name:setText( ToUpperCase( "Item Name" ), 0 )
	CaCButtonBaseImage.Name:SetAlignment( LUI.Alignment.Left )
	CaCButtonBaseImage:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( CaCButtonBaseImage )
	self.CaCButtonBaseImage = CaCButtonBaseImage
	
	local EventTimer = nil
	
	EventTimer = MenuBuilder.BuildRegisteredType( "EventCrateTimer", {
		controllerIndex = f5_local1
	} )
	EventTimer.id = "EventTimer"
	EventTimer:SetAlpha( 0, 0 )
	EventTimer:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 200, _1080p * 28, _1080p * 83 )
	self:addElement( EventTimer )
	self.EventTimer = EventTimer
	
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
	ItemPrices:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -100, 0, _1080p * -108, 0 )
	self:addElement( ItemPrices )
	self.ItemPrices = ItemPrices
	
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
	
	local SaleNotification = nil
	
	SaleNotification = MenuBuilder.BuildRegisteredType( "QuatermasterItemSaleNotification", {
		controllerIndex = f5_local1
	} )
	SaleNotification.id = "SaleNotification"
	SaleNotification:SetAlpha( 0, 0 )
	SaleNotification:SetDataSourceThroughElement( self, nil )
	SaleNotification:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -169, _1080p * -105, _1080p * -34, _1080p * -2 )
	self:addElement( SaleNotification )
	self.SaleNotification = SaleNotification
	
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
		CaCButtonBaseImage:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.CaCButtonBaseImage.Image:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		ItemPrices:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.ItemPrices:SetRGBFromInt( 16777215, 0 )
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
			CaCButtonBaseImage:AnimateSequence( "ButtonOver" )
			ItemPrices:AnimateSequence( "ButtonOver" )
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
		CaCButtonBaseImage:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.CaCButtonBaseImage.Image:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		ItemPrices:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.ItemPrices:SetRGBFromInt( 16777215, 0 )
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
			CaCButtonBaseImage:AnimateSequence( "ButtonUp" )
			ItemPrices:AnimateSequence( "ButtonUp" )
			SoldOutText:AnimateSequence( "ButtonUp" )
		end
		
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
		CaCButtonBaseImage:RegisterAnimationSequence( "DisabledOver", {
			{
				function ()
					return self.CaCButtonBaseImage.Image:SetRGBFromInt( 3355443, 0 )
				end
			}
		} )
		ItemPrices:RegisterAnimationSequence( "DisabledOver", {
			{
				function ()
					return self.ItemPrices:SetRGBFromTable( SWATCHES.MPArmory.disabledLootCrate, 0 )
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
			CaCButtonBaseImage:AnimateSequence( "DisabledOver" )
			ItemPrices:AnimateSequence( "DisabledOver" )
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
		CaCButtonBaseImage:RegisterAnimationSequence( "DisabledUp", {
			{
				function ()
					return self.CaCButtonBaseImage.Image:SetRGBFromInt( 6710886, 0 )
				end
			}
		} )
		ItemPrices:RegisterAnimationSequence( "DisabledUp", {
			{
				function ()
					return self.ItemPrices:SetRGBFromTable( SWATCHES.MPArmory.disabledLootCrate, 0 )
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
			CaCButtonBaseImage:AnimateSequence( "DisabledUp" )
			ItemPrices:AnimateSequence( "DisabledUp" )
			SoldOutText:AnimateSequence( "DisabledUp" )
		end
		
		Background:RegisterAnimationSequence( "BribeCrate", {
			{
				function ()
					return self.Background:SetAlpha( 1, 0 )
				end
			}
		} )
		CaCButtonBaseImage:RegisterAnimationSequence( "BribeCrate", {
			{
				function ()
					return self.CaCButtonBaseImage.GenericItemBackground:SetAlpha( 0, 0 )
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
			CaCButtonBaseImage:AnimateSequence( "BribeCrate" )
			Sheen:AnimateSequence( "BribeCrate" )
		end
		
		CaCButtonBaseImage:RegisterAnimationSequence( "MPBundle", {
			{
				function ()
					return self.CaCButtonBaseImage.Image:SetLeft( _1080p * -150, 0 )
				end
			},
			{
				function ()
					return self.CaCButtonBaseImage.Image:SetRight( _1080p * 150, 0 )
				end
			},
			{
				function ()
					return self.CaCButtonBaseImage.Image:SetBottom( _1080p * 0, 0 )
				end
			},
			{
				function ()
					return self.CaCButtonBaseImage.Image:SetTop( _1080p * -200, 0 )
				end
			}
		} )
		self._sequences.MPBundle = function ()
			CaCButtonBaseImage:AnimateSequence( "MPBundle" )
		end
		
		CaCButtonBaseImage:RegisterAnimationSequence( "CPBundle", {
			{
				function ()
					return self.CaCButtonBaseImage.Image:SetLeft( _1080p * -150, 0 )
				end
			},
			{
				function ()
					return self.CaCButtonBaseImage.Image:SetRight( _1080p * 150, 0 )
				end
			},
			{
				function ()
					return self.CaCButtonBaseImage.Image:SetTop( _1080p * -200, 0 )
				end
			},
			{
				function ()
					return self.CaCButtonBaseImage.Image:SetBottom( _1080p * 0, 0 )
				end
			}
		} )
		self._sequences.CPBundle = function ()
			CaCButtonBaseImage:AnimateSequence( "CPBundle" )
		end
		
		self._sequences.RegularCrate = function ()
			
		end
		
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
			SoldOutBacker:AnimateSequence( "SoldOut" )
			SoldOutText:AnimateSequence( "SoldOut" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	ItemPrices:SetDataSourceThroughElement( self, nil )
	SaleNotification:SetDataSourceThroughElement( self, nil )
	self:addEventHandler( "button_over", function ( f52_arg0, f52_arg1 )
		local f52_local0 = f52_arg1.controller or f5_local1
		ACTIONS.AnimateSequence( self, "ButtonOver" )
		ACTIONS.AnimateSequenceByElement( self, {
			elementName = "Sheen",
			sequenceName = "Pan",
			elementPath = "Sheen"
		} )
	end )
	self:addEventHandler( "button_up", function ( f53_arg0, f53_arg1 )
		local f53_local0 = f53_arg1.controller or f5_local1
		ACTIONS.AnimateSequence( self, "ButtonUp" )
		ACTIONS.AnimateSequenceByElement( self, {
			elementName = "Sheen",
			sequenceName = "Stop",
			elementPath = "Sheen"
		} )
	end )
	self:addEventHandler( "button_disable", function ( f54_arg0, f54_arg1 )
		local f54_local0 = f54_arg1.controller or f5_local1
		ACTIONS.AnimateSequenceByElement( self, {
			elementName = "GenericItemBackground",
			sequenceName = "ButtonUpDisabled",
			elementPath = "CaCButtonBaseImage.GenericItemBackground"
		} )
		ACTIONS.AnimateSequenceByElement( self, {
			elementName = "CaCButtonBaseImage",
			sequenceName = "Disabled_Rollout",
			elementPath = "CaCButtonBaseImage"
		} )
		ACTIONS.AnimateSequence( self, "DisabledUp" )
	end )
	self:addEventHandler( "button_over_disable", function ( f55_arg0, f55_arg1 )
		local f55_local0 = f55_arg1.controller or f5_local1
		ACTIONS.AnimateSequenceByElement( self, {
			elementName = "GenericItemBackground",
			sequenceName = "ButtonOverDisabled",
			elementPath = "CaCButtonBaseImage.GenericItemBackground"
		} )
		ACTIONS.AnimateSequenceByElement( self, {
			elementName = "CaCButtonBaseImage",
			sequenceName = "Disabled_Rollover",
			elementPath = "CaCButtonBaseImage"
		} )
		ACTIONS.AnimateSequence( self, "DisabledOver" )
	end )
	f0_local1( self, f5_local1, controller )
	return self
end

MenuBuilder.registerType( "PurchaseLootCrateButton", PurchaseLootCrateButton )
LockTable( _M )
