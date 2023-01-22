local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ()
	Engine.SetFrontEndSceneSection( "zm_consumable_selection", 1 )
end

CARD_SELECT_BASE_DATA_MODEL = "frontEnd.CP.fortuneCards.content"
function PopFunc()
	WipeGlobalModelsAtPath( CARD_SELECT_BASE_DATA_MODEL )
end

f0_local1 = function ( f3_arg0, f3_arg1 )
	return Engine.IsUnlocked( f3_arg0, "fateCard", f3_arg1 ) and 0 or 1
end

f0_local2 = function ( f4_arg0, f4_arg1, f4_arg2 )
	f4_arg0.CardTabs.Tabs:SetTabIndexDataSource( LUI.DataSourceInGlobalModel.new( CARD_SELECT_BASE_DATA_MODEL .. ".tabIndex" ) )
	local f4_local0 = LUI.DataSourceInGlobalModel.new( CARD_SELECT_BASE_DATA_MODEL )
	local f4_local1 = function ( f5_arg0 )
		local f5_local0 = {
			"LUA_MENU_ZM_FATE_CARDS_CAPS",
			"LUA_MENU_ZM_FORTUNE_CARDS_CAPS"
		}
		assert( f5_arg0 < #f5_local0 )
		return Engine.Localize( f5_local0[f5_arg0 + 1] )
	end
	
	f4_arg0.cardList = DataSources.frontEnd.CP.fortuneCards:Decorate( function ( f6_arg0, f6_arg1, f6_arg2 )
		local f6_local0 = f6_arg1:Decorate( ZMB_CONSUMABLES.DecorateCardFunc( CARD_SELECT_BASE_DATA_MODEL ) )
		f6_local0:SetCachingEnabled( true )
		f6_local0.GetDefaultFocusIndex = function ( f7_arg0 )
			for f7_local0 = 0, f6_arg1:GetCountValue( f6_arg2 ) - 1, 1 do
				local f7_local3 = f6_arg1:GetDataSourceAtIndex( f7_local0 )
				local f7_local4 = f7_local3.ref:GetValue( f6_arg2 )
				if f4_arg2.defaultTabIndex == f6_arg0 then
					return f7_local0
				end
			end
			return nil
		end
		
		return {
			cardSlot = f6_arg0,
			name = LUI.DataSourceInGlobalModel.new( CARD_SELECT_BASE_DATA_MODEL .. ".cardTab" .. f6_arg0 .. ".name", f4_local1( f6_arg0 ) ),
			slotColor = LUI.DataSourceInGlobalModel.new( CARD_SELECT_BASE_DATA_MODEL .. ".cardTab" .. f6_arg0 .. ".slotColor", Cac.GetPerkSlotColor( f6_arg0 ) ),
			content = f6_local0,
			focusFunction = function ()
				
			end
			
		}
	end )
	f4_arg0.cardList:SetCachingEnabled( true )
	f4_arg0.cardList.GetDefaultFocusIndex = function ( f9_arg0 )
		return f4_arg2.defaultTabIndex or 0
	end
	
	if Engine.IsUserAGuest( f4_arg1 ) then
		local f4_local2 = LUI.DataSourceFromList.new( 1 )
		f4_local2.MakeDataSourceAtIndex = function ( f10_arg0, f10_arg1, f10_arg2 )
			return f4_arg0.cardList:GetDataSourceAtIndex( f10_arg1, f10_arg2 )
		end
		
		f4_local2:SetCachingEnabled( true )
		f4_arg0.CardTabs.Tabs:SetTabManagerDataSource( f4_local2, f4_arg1 )
	else
		f4_arg0.CardTabs.Tabs:SetTabManagerDataSource( f4_arg0.cardList, f4_arg1 )
	end
	assert( f4_arg0.CurrentDeckItem1 )
	assert( f4_arg0.CurrentDeckItem2 )
	assert( f4_arg0.CurrentDeckItem3 )
	assert( f4_arg0.CurrentDeckItem4 )
	assert( f4_arg0.CurrentDeckItem5 )
	local f4_local2 = {
		f4_arg0.CurrentDeckItem1,
		f4_arg0.CurrentDeckItem2,
		f4_arg0.CurrentDeckItem3,
		f4_arg0.CurrentDeckItem4,
		f4_arg0.CurrentDeckItem5
	}
	local f4_local3 = LUI.FlowManager.GetScopedData( f4_arg0 )
	f4_local3 = f4_local3.cardSlot + 1
	for f4_local4 = 1, 5, 1 do
		if not CONDITIONS.IsFateCardSlotUnlocked( f4_arg1, "fate_card_slot_" .. f4_local4 ) then
			ACTIONS.AnimateSequence( f4_local2[f4_local4], "Unavailable" )
		end
		if f4_local4 == f4_local3 then
			ACTIONS.AnimateSequence( f4_local2[f4_local4], "Selected" )
		else
			ACTIONS.AnimateSequence( f4_local2[f4_local4], "Unselected" )
		end
	end
end

function FortuneCards( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "FortuneCards"
	self._animationSets = {}
	self._sequences = {}
	local f11_local1 = controller and controller.controllerIndex
	if not f11_local1 and not Engine.InFrontend() then
		f11_local1 = self:getRootController()
	end
	assert( f11_local1 )
	f0_local0( self, f11_local1, controller )
	self:playSound( "menu_open" )
	local f11_local2 = self
	local BlackBG = nil
	
	BlackBG = LUI.UIImage.new()
	BlackBG.id = "BlackBG"
	BlackBG:SetRGBFromInt( 0, 0 )
	BlackBG:SetAlpha( 0.8, 0 )
	self:addElement( BlackBG )
	self.BlackBG = BlackBG
	
	local Spinner = nil
	
	Spinner = LUI.UIImage.new()
	Spinner.id = "Spinner"
	Spinner:SetAlpha( 0.4, 0 )
	Spinner:setImage( RegisterMaterial( "zm_tix_arcane_spinner" ), 0 )
	Spinner:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 934.19, _1080p * 1884.02, _1080p * 65.08, _1080p * 1014.92 )
	self:addElement( Spinner )
	self.Spinner = Spinner
	
	local CardBackingGlow = nil
	
	CardBackingGlow = LUI.UIImage.new()
	CardBackingGlow.id = "CardBackingGlow"
	CardBackingGlow:SetAlpha( 0.5, 0 )
	CardBackingGlow:setImage( RegisterMaterial( "cp_menu_pause_red_glow" ), 0 )
	CardBackingGlow:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1073.09, _1080p * 1858.75, _1080p * 176.42, _1080p * 962.08 )
	self:addElement( CardBackingGlow )
	self.CardBackingGlow = CardBackingGlow
	
	local CardTabs = nil
	
	CardTabs = MenuBuilder.BuildRegisteredType( "SubMenuTabsBar", {
		controllerIndex = f11_local1
	} )
	CardTabs.id = "CardTabs"
	CardTabs.Tabs:SetTabManagerDataSourceThroughElement( self, "tabs" )
	CardTabs:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 140, _1080p * 170 )
	self:addElement( CardTabs )
	self.CardTabs = CardTabs
	
	local cardGrid = nil
	
	cardGrid = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 4,
		maxVisibleRows = 3,
		controllerIndex = f11_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "fortuneCardButton", {
				controllerIndex = f11_local1
			} )
		end,
		wrapX = true,
		wrapY = true,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		columnWidth = _1080p * 173,
		rowHeight = _1080p * 239,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	cardGrid.id = "cardGrid"
	cardGrid:setUseStencil( true )
	cardGrid:SetGridDataSourceThroughElement( CardTabs.Tabs, "content" )
	cardGrid:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 133, _1080p * 855, _1080p * 198.5, _1080p * 935.5 )
	self:addElement( cardGrid )
	self.cardGrid = cardGrid
	
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f11_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local GridScrollbar = nil
	
	GridScrollbar = MenuBuilder.BuildRegisteredType( "VerticalMinimalScrollbar", {
		controllerIndex = f11_local1
	} )
	GridScrollbar.id = "GridScrollbar"
	GridScrollbar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 81, _1080p * 97, _1080p * 205, _1080p * 935.5 )
	self:addElement( GridScrollbar )
	self.GridScrollbar = GridScrollbar
	
	local fortuneCardItemHeader = nil
	fortuneCardItemHeader = MenuBuilder.BuildRegisteredType( "fortuneCardItemHeader", {
		controllerIndex = f11_local1
	} )
	fortuneCardItemHeader.id = "fortuneCardItemHeader"
	fortuneCardItemHeader:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 971.92, _1080p * 1869.92, _1080p * 195, _1080p * 497 )
	if CONDITIONS.IsAliensOnline( self ) then
		fortuneCardItemHeader:SubscribeToModelThroughElement( cardGrid, "unlockDesc", function ()
			local f13_local0 = cardGrid:GetDataSource()
			f13_local0 = f13_local0.unlockDesc:GetValue( f11_local1 )
			if f13_local0 ~= nil then
				fortuneCardItemHeader.ItemUnlockCriteria:setText( f13_local0, 0 )
			end
		end )
	end
	fortuneCardItemHeader:SubscribeToModelThroughElement( cardGrid, "duration", function ()
		local f14_local0 = cardGrid:GetDataSource()
		f14_local0 = f14_local0.duration:GetValue( f11_local1 )
		if f14_local0 ~= nil then
			fortuneCardItemHeader.Duration:setText( LocalizeIntoString( f14_local0, "LUA_MENU_ZM_DURATION_CAPS" ), 0 )
		end
	end )
	fortuneCardItemHeader:SubscribeToModelThroughElement( cardGrid, "uses", function ()
		local f15_local0 = cardGrid:GetDataSource()
		f15_local0 = f15_local0.uses:GetValue( f11_local1 )
		if f15_local0 ~= nil then
			fortuneCardItemHeader.Uses:setText( LocalizeIntoString( f15_local0, "LUA_MENU_ZM_USES_CAPS" ), 0 )
		end
	end )
	fortuneCardItemHeader:SubscribeToModelThroughElement( cardGrid, "numOwned", function ()
		local f16_local0 = cardGrid:GetDataSource()
		f16_local0 = f16_local0.numOwned:GetValue( f11_local1 )
		if f16_local0 ~= nil then
			fortuneCardItemHeader.Owned:setText( LocalizeIntoString( f16_local0, "LUA_MENU_ZM_CARDS_REMAINING_CAPS" ), 0 )
		end
	end )
	fortuneCardItemHeader:SubscribeToModelThroughElement( cardGrid, "name", function ()
		local f17_local0 = cardGrid:GetDataSource()
		f17_local0 = f17_local0.name:GetValue( f11_local1 )
		if f17_local0 ~= nil then
			fortuneCardItemHeader.ItemName:setText( ToUpperCase( LocalizeString( f17_local0 ) ), 0 )
		end
	end )
	fortuneCardItemHeader:SubscribeToModelThroughElement( cardGrid, "desc", function ()
		local f18_local0 = cardGrid:GetDataSource()
		f18_local0 = f18_local0.desc:GetValue( f11_local1 )
		if f18_local0 ~= nil then
			fortuneCardItemHeader.ItemDescription:setText( ToUpperCase( LocalizeString( f18_local0 ) ), 0 )
		end
	end )
	fortuneCardItemHeader:SubscribeToModelThroughElement( cardGrid, "rarity", function ()
		local f19_local0 = cardGrid:GetDataSource()
		f19_local0 = f19_local0.rarity:GetValue( f11_local1 )
		if f19_local0 ~= nil then
			fortuneCardItemHeader.RarityIcon:setImage( RegisterMaterial( f19_local0 ), 0 )
		end
	end )
	self:addElement( fortuneCardItemHeader )
	self.fortuneCardItemHeader = fortuneCardItemHeader
	
	local Flames = nil
	
	Flames = LUI.UIImage.new()
	Flames.id = "Flames"
	Flames:SetAlpha( 0.5, 0 )
	Flames:setImage( RegisterMaterial( "zm_wc_fire_loop" ), 0 )
	Flames:SetBlendMode( BLEND_MODE.addWithAlpha )
	Flames:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1286.04, _1080p * 1687.95, _1080p * -111.93, _1080p * 400.07 )
	self:addElement( Flames )
	self.Flames = Flames
	
	local FateCardLarge = nil
	
	FateCardLarge = LUI.UIImage.new()
	FateCardLarge.id = "FateCardLarge"
	FateCardLarge:setImage( RegisterMaterial( "zm_wc_fate_card_base_persp" ), 0 )
	FateCardLarge:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1277.17, _1080p * 1633.17, _1080p * 334.42, _1080p * 846.42 )
	self:addElement( FateCardLarge )
	self.FateCardLarge = FateCardLarge
	
	local FortuneCardLarge = nil
	
	FortuneCardLarge = LUI.UIImage.new()
	FortuneCardLarge.id = "FortuneCardLarge"
	FortuneCardLarge:setImage( RegisterMaterial( "zm_wc_fortune_card_base_persp" ), 0 )
	FortuneCardLarge:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1277.17, _1080p * 1633.17, _1080p * 334.42, _1080p * 846.42 )
	self:addElement( FortuneCardLarge )
	self.FortuneCardLarge = FortuneCardLarge
	
	local Bigimage = nil
	
	Bigimage = LUI.UIImage.new()
	Bigimage.id = "Bigimage"
	Bigimage:SetZRotation( -6, 0 )
	Bigimage:SetScale( 1.35, 0 )
	Bigimage:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1397.01, _1080p * 1511.19, _1080p * 505.66, _1080p * 632.84 )
	Bigimage:SubscribeToModelThroughElement( cardGrid, "icon", function ()
		local f20_local0 = cardGrid:GetDataSource()
		f20_local0 = f20_local0.icon:GetValue( f11_local1 )
		if f20_local0 ~= nil then
			Bigimage:setImage( RegisterMaterial( f20_local0 ), 0 )
		end
	end )
	self:addElement( Bigimage )
	self.Bigimage = Bigimage
	
	local CPMenuTitle = nil
	
	CPMenuTitle = MenuBuilder.BuildRegisteredType( "CPMenuTitle", {
		controllerIndex = f11_local1
	} )
	CPMenuTitle.id = "CPMenuTitle"
	CPMenuTitle.MenuTitle:setText( Engine.Localize( "LUA_MENU_ZM_WONDER_CARDS" ), 0 )
	CPMenuTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
	self:addElement( CPMenuTitle )
	self.CPMenuTitle = CPMenuTitle
	
	local CurrentDeckItem1 = nil
	
	CurrentDeckItem1 = MenuBuilder.BuildRegisteredType( "FateAndFortuneCurrentDeckItem", {
		controllerIndex = f11_local1
	} )
	CurrentDeckItem1.id = "CurrentDeckItem1"
	CurrentDeckItem1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 988.17, _1080p * 1059.92, _1080p * 842.15, _1080p * 936.15 )
	CurrentDeckItem1:SubscribeToModel( DataSources.frontEnd.CP.fortuneCards.cardSlot1Icon:GetModel( f11_local1 ), function ()
		local f21_local0 = DataSources.frontEnd.CP.fortuneCards.cardSlot1Icon:GetValue( f11_local1 )
		if f21_local0 ~= nil then
			CurrentDeckItem1.CardImage:setImage( RegisterMaterial( f21_local0 ), 0 )
		end
	end )
	self:addElement( CurrentDeckItem1 )
	self.CurrentDeckItem1 = CurrentDeckItem1
	
	local CurrentDeckItem2 = nil
	
	CurrentDeckItem2 = MenuBuilder.BuildRegisteredType( "FateAndFortuneCurrentDeckItem", {
		controllerIndex = f11_local1
	} )
	CurrentDeckItem2.id = "CurrentDeckItem2"
	CurrentDeckItem2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1074.17, _1080p * 1145.92, _1080p * 842.15, _1080p * 936.15 )
	CurrentDeckItem2:SubscribeToModel( DataSources.frontEnd.CP.fortuneCards.cardSlot2Icon:GetModel( f11_local1 ), function ()
		local f22_local0 = DataSources.frontEnd.CP.fortuneCards.cardSlot2Icon:GetValue( f11_local1 )
		if f22_local0 ~= nil then
			CurrentDeckItem2.CardImage:setImage( RegisterMaterial( f22_local0 ), 0 )
		end
	end )
	self:addElement( CurrentDeckItem2 )
	self.CurrentDeckItem2 = CurrentDeckItem2
	
	local CurrentDeckItem3 = nil
	
	CurrentDeckItem3 = MenuBuilder.BuildRegisteredType( "FateAndFortuneCurrentDeckItem", {
		controllerIndex = f11_local1
	} )
	CurrentDeckItem3.id = "CurrentDeckItem3"
	CurrentDeckItem3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1162.17, _1080p * 1233.92, _1080p * 842.15, _1080p * 936.15 )
	CurrentDeckItem3:SubscribeToModel( DataSources.frontEnd.CP.fortuneCards.cardSlot3Icon:GetModel( f11_local1 ), function ()
		local f23_local0 = DataSources.frontEnd.CP.fortuneCards.cardSlot3Icon:GetValue( f11_local1 )
		if f23_local0 ~= nil then
			CurrentDeckItem3.CardImage:setImage( RegisterMaterial( f23_local0 ), 0 )
		end
	end )
	self:addElement( CurrentDeckItem3 )
	self.CurrentDeckItem3 = CurrentDeckItem3
	
	local CurrentDeckItem4 = nil
	
	CurrentDeckItem4 = MenuBuilder.BuildRegisteredType( "FateAndFortuneCurrentDeckItem", {
		controllerIndex = f11_local1
	} )
	CurrentDeckItem4.id = "CurrentDeckItem4"
	CurrentDeckItem4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1250.17, _1080p * 1321.92, _1080p * 842.15, _1080p * 936.15 )
	CurrentDeckItem4:SubscribeToModel( DataSources.frontEnd.CP.fortuneCards.cardSlot4Icon:GetModel( f11_local1 ), function ()
		local f24_local0 = DataSources.frontEnd.CP.fortuneCards.cardSlot4Icon:GetValue( f11_local1 )
		if f24_local0 ~= nil then
			CurrentDeckItem4.CardImage:setImage( RegisterMaterial( f24_local0 ), 0 )
		end
	end )
	self:addElement( CurrentDeckItem4 )
	self.CurrentDeckItem4 = CurrentDeckItem4
	
	local CurrentDeckItem5 = nil
	
	CurrentDeckItem5 = MenuBuilder.BuildRegisteredType( "FateAndFortuneCurrentDeckItem", {
		controllerIndex = f11_local1
	} )
	CurrentDeckItem5.id = "CurrentDeckItem5"
	CurrentDeckItem5:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1339.17, _1080p * 1410.92, _1080p * 842.15, _1080p * 936.15 )
	CurrentDeckItem5:SubscribeToModel( DataSources.frontEnd.CP.fortuneCards.cardSlot5Icon:GetModel( f11_local1 ), function ()
		local f25_local0 = DataSources.frontEnd.CP.fortuneCards.cardSlot5Icon:GetValue( f11_local1 )
		if f25_local0 ~= nil then
			CurrentDeckItem5.CardImage:setImage( RegisterMaterial( f25_local0 ), 0 )
		end
	end )
	self:addElement( CurrentDeckItem5 )
	self.CurrentDeckItem5 = CurrentDeckItem5
	
	local CurrentDeckLabel = nil
	
	CurrentDeckLabel = LUI.UIText.new()
	CurrentDeckLabel.id = "CurrentDeckLabel"
	CurrentDeckLabel:setText( Engine.Localize( "LUA_MENU_ZM_YOUR_CURRENT_DECK_CAPS" ), 0 )
	CurrentDeckLabel:SetFontSize( 20 * _1080p )
	CurrentDeckLabel:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	CurrentDeckLabel:SetAlignment( LUI.Alignment.Left )
	CurrentDeckLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 986.92, _1080p * 1236.92, _1080p * 811.9, _1080p * 831.9 )
	self:addElement( CurrentDeckLabel )
	self.CurrentDeckLabel = CurrentDeckLabel
	
	local FortuneTextBig = nil
	
	FortuneTextBig = LUI.UIText.new()
	FortuneTextBig.id = "FortuneTextBig"
	FortuneTextBig:SetRGBFromTable( SWATCHES.text.primaryText, 0 )
	FortuneTextBig:SetAlpha( 0.35, 0 )
	FortuneTextBig:SetZRotation( -90, 0 )
	FortuneTextBig:setText( Engine.Localize( "LUA_MENU_ZM_HEADER_FORTUNE_CAPS" ), 0 )
	FortuneTextBig:SetFontSize( 105 * _1080p )
	FortuneTextBig:SetFont( FONTS.GetFont( FONTS.ZmClean.File ) )
	FortuneTextBig:SetAlignment( LUI.Alignment.Center )
	FortuneTextBig:SetOptOutRightToLeftAlignmentFlip( true )
	FortuneTextBig:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1226.19, _1080p * 2241.19, _1080p * 511, _1080p * 666.4 )
	self:addElement( FortuneTextBig )
	self.FortuneTextBig = FortuneTextBig
	
	local FateTextBig = nil
	
	FateTextBig = LUI.UIText.new()
	FateTextBig.id = "FateTextBig"
	FateTextBig:SetRGBFromTable( SWATCHES.text.primaryText, 0 )
	FateTextBig:SetAlpha( 0.35, 0 )
	FateTextBig:SetZRotation( -90, 0 )
	FateTextBig:setText( Engine.Localize( "LUA_MENU_ZM_HEADER_FATE_CAPS" ), 0 )
	FateTextBig:SetFontSize( 105 * _1080p )
	FateTextBig:SetFont( FONTS.GetFont( FONTS.ZmClean.File ) )
	FateTextBig:SetAlignment( LUI.Alignment.Center )
	FateTextBig:SetOptOutRightToLeftAlignmentFlip( true )
	FateTextBig:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1236.92, _1080p * 2219.92, _1080p * 511, _1080p * 666.4 )
	self:addElement( FateTextBig )
	self.FateTextBig = FateTextBig
	
	local ArrowUp = nil
	
	ArrowUp = MenuBuilder.BuildRegisteredType( "ArrowUp", {
		controllerIndex = f11_local1
	} )
	ArrowUp.id = "ArrowUp"
	ArrowUp:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 566.5, _1080p * 586.5, _1080p * 933.08, _1080p * 973.08 )
	self:addElement( ArrowUp )
	self.ArrowUp = ArrowUp
	
	local ArrowDown = nil
	
	ArrowDown = MenuBuilder.BuildRegisteredType( "ArrowDown", {
		controllerIndex = f11_local1
	} )
	ArrowDown.id = "ArrowDown"
	ArrowDown:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 401.5, _1080p * 421.5, _1080p * 932.08, _1080p * 972.08 )
	self:addElement( ArrowDown )
	self.ArrowDown = ArrowDown
	
	local ListCount = nil
	
	ListCount = LUI.UIText.new()
	ListCount.id = "ListCount"
	ListCount:setText( "1/15", 0 )
	ListCount:SetFontSize( 24 * _1080p )
	ListCount:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ListCount:SetAlignment( LUI.Alignment.Center )
	ListCount:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 421.5, _1080p * 566.5, _1080p * 940.08, _1080p * 964.08 )
	self:addElement( ListCount )
	self.ListCount = ListCount
	
	local SocialFeed = nil
	
	SocialFeed = MenuBuilder.BuildRegisteredType( "SocialFeed", {
		controllerIndex = f11_local1
	} )
	SocialFeed.id = "SocialFeed"
	SocialFeed:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1920, _1080p * 966.08, _1080p * 996.08 )
	self:addElement( SocialFeed )
	self.SocialFeed = SocialFeed
	
	local f11_local28 = nil
	if CONDITIONS.IsPublicMatch( self ) then
		f11_local28 = MenuBuilder.BuildRegisteredType( "CRMMain", {
			controllerIndex = f11_local1
		} )
		f11_local28.id = "CRMMain"
		f11_local28:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 137, _1080p * 447, _1080p * 745, _1080p * 1069 )
		self:addElement( f11_local28 )
		self.CRMMain = f11_local28
	end
	self._animationSets.DefaultAnimationSet = function ()
		FateCardLarge:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.FateCardLarge:SetAlpha( 1, 0 )
				end
			}
		} )
		FortuneCardLarge:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.FortuneCardLarge:SetAlpha( 0, 0 )
				end
			}
		} )
		FortuneTextBig:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.FortuneTextBig:SetAlpha( 0, 0 )
				end
			}
		} )
		FateTextBig:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.FateTextBig:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			FateCardLarge:AnimateSequence( "DefaultSequence" )
			FortuneCardLarge:AnimateSequence( "DefaultSequence" )
			FortuneTextBig:AnimateSequence( "DefaultSequence" )
			FateTextBig:AnimateSequence( "DefaultSequence" )
		end
		
		Spinner:RegisterAnimationSequence( "SpinnerRotate", {
			{
				function ()
					return self.Spinner:SetZRotation( 0, 0 )
				end,
				function ()
					return self.Spinner:SetZRotation( -360, 40000 )
				end
			}
		} )
		self._sequences.SpinnerRotate = function ()
			Spinner:AnimateLoop( "SpinnerRotate" )
		end
		
		fortuneCardItemHeader:RegisterAnimationSequence( "ShowFortune", {
			{
				function ()
					return self.fortuneCardItemHeader.Owned:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.fortuneCardItemHeader.RarityIcon:SetAlpha( 1, 0 )
				end
			}
		} )
		FateCardLarge:RegisterAnimationSequence( "ShowFortune", {
			{
				function ()
					return self.FateCardLarge:SetAlpha( 0, 1000 )
				end
			}
		} )
		FortuneCardLarge:RegisterAnimationSequence( "ShowFortune", {
			{
				function ()
					return self.FortuneCardLarge:SetAlpha( 1, 1000 )
				end
			}
		} )
		FortuneTextBig:RegisterAnimationSequence( "ShowFortune", {
			{
				function ()
					return self.FortuneTextBig:SetAlpha( 0.35, 1000 )
				end
			}
		} )
		FateTextBig:RegisterAnimationSequence( "ShowFortune", {
			{
				function ()
					return self.FateTextBig:SetAlpha( 0, 1000 )
				end
			}
		} )
		self._sequences.ShowFortune = function ()
			fortuneCardItemHeader:AnimateSequence( "ShowFortune" )
			FateCardLarge:AnimateSequence( "ShowFortune" )
			FortuneCardLarge:AnimateSequence( "ShowFortune" )
			FortuneTextBig:AnimateSequence( "ShowFortune" )
			FateTextBig:AnimateSequence( "ShowFortune" )
		end
		
		fortuneCardItemHeader:RegisterAnimationSequence( "ShowFate", {
			{
				function ()
					return self.fortuneCardItemHeader.Owned:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.fortuneCardItemHeader.RarityIcon:SetAlpha( 0, 0 )
				end
			}
		} )
		FateCardLarge:RegisterAnimationSequence( "ShowFate", {
			{
				function ()
					return self.FateCardLarge:SetAlpha( 1, 1000 )
				end
			}
		} )
		FortuneCardLarge:RegisterAnimationSequence( "ShowFate", {
			{
				function ()
					return self.FortuneCardLarge:SetAlpha( 0, 1000 )
				end
			}
		} )
		FortuneTextBig:RegisterAnimationSequence( "ShowFate", {
			{
				function ()
					return self.FortuneTextBig:SetAlpha( 0, 1000 )
				end
			}
		} )
		FateTextBig:RegisterAnimationSequence( "ShowFate", {
			{
				function ()
					return self.FateTextBig:SetAlpha( 0.35, 1000 )
				end
			}
		} )
		self._sequences.ShowFate = function ()
			fortuneCardItemHeader:AnimateSequence( "ShowFate" )
			FateCardLarge:AnimateSequence( "ShowFate" )
			FortuneCardLarge:AnimateSequence( "ShowFate" )
			FortuneTextBig:AnimateSequence( "ShowFate" )
			FateTextBig:AnimateSequence( "ShowFate" )
		end
		
		CardBackingGlow:RegisterAnimationSequence( "GlowAnimate", {
			{
				function ()
					return self.CardBackingGlow:SetAlpha( 0.65, 0 )
				end,
				function ()
					return self.CardBackingGlow:SetAlpha( 0.3, 1500, LUI.EASING.inQuadratic )
				end,
				function ()
					return self.CardBackingGlow:SetAlpha( 0.65, 1500, LUI.EASING.outQuadratic )
				end
			}
		} )
		self._sequences.GlowAnimate = function ()
			CardBackingGlow:AnimateLoop( "GlowAnimate" )
		end
		
		fortuneCardItemHeader:RegisterAnimationSequence( "Sequence5", {
			{
				function ()
					return self.fortuneCardItemHeader.ItemUnlockCriteria:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.Sequence5 = function ()
			fortuneCardItemHeader:AnimateSequence( "Sequence5" )
		end
		
		fortuneCardItemHeader:RegisterAnimationSequence( "common", {
			{
				function ()
					return self.fortuneCardItemHeader.RarityIcon:SetRGBFromTable( SWATCHES.itemRarity.quality0, 0 )
				end
			}
		} )
		self._sequences.common = function ()
			fortuneCardItemHeader:AnimateSequence( "common" )
		end
		
		fortuneCardItemHeader:RegisterAnimationSequence( "legendary", {
			{
				function ()
					return self.fortuneCardItemHeader.RarityIcon:SetRGBFromTable( SWATCHES.itemRarity.quality2, 0 )
				end
			}
		} )
		self._sequences.legendary = function ()
			fortuneCardItemHeader:AnimateSequence( "legendary" )
		end
		
		fortuneCardItemHeader:RegisterAnimationSequence( "rare", {
			{
				function ()
					return self.fortuneCardItemHeader.RarityIcon:SetRGBFromTable( SWATCHES.itemRarity.quality1, 0 )
				end
			}
		} )
		self._sequences.rare = function ()
			fortuneCardItemHeader:AnimateSequence( "rare" )
		end
		
		fortuneCardItemHeader:RegisterAnimationSequence( "epic", {
			{
				function ()
					return self.fortuneCardItemHeader.RarityIcon:SetRGBFromTable( SWATCHES.itemRarity.quality3, 0 )
				end
			}
		} )
		self._sequences.epic = function ()
			fortuneCardItemHeader:AnimateSequence( "epic" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	local f11_local29 = LUI.UIScrollbar.new
	local bindButton = {
		direction = LUI.DIRECTION.vertical,
		eventListener = GridScrollbar,
		startCap = GridScrollbar.startCap,
		endCap = GridScrollbar.endCap
	}
	local f11_local31 = "slider"
	local f11_local32 = GridScrollbar.sliderArea
	if f11_local32 then
		f11_local32 = GridScrollbar.sliderArea.slider
	end
	bindButton[f11_local31] = f11_local32
	f11_local31 = "fixedSizeSlider"
	f11_local32 = GridScrollbar.sliderArea
	if f11_local32 then
		f11_local32 = GridScrollbar.sliderArea.fixedSizeSlider
	end
	bindButton[f11_local31] = f11_local32
	cardGrid:AddScrollbar( f11_local29( bindButton ) )
	cardGrid:AddItemNumbers( ListCount )
	self.addButtonHelperFunction = function ( f63_arg0, f63_arg1 )
		f63_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			priority = 10,
			clickable = true
		} )
		f63_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_SELECT" ),
			button_ref = "button_primary",
			side = "left",
			priority = -10,
			clickable = true
		} )
	end
	
	self:addEventHandler( "menu_create", self.addButtonHelperFunction )
	
	bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	self.bindButton:addEventHandler( "button_secondary", function ( f64_arg0, f64_arg1 )
		local f64_local0 = f64_arg1.controller or f11_local1
		ACTIONS.LeaveMenu( self )
	end )
	self:SubscribeToModelThroughElement( cardGrid, "backing", function ()
		local f65_local0 = cardGrid:GetDataSource()
		if f65_local0.backing:GetValue( f11_local1 ) ~= nil then
			f65_local0 = cardGrid:GetDataSource()
			if f65_local0.backing:GetValue( f11_local1 ) == "zm_wc_fate_card_base" then
				ACTIONS.AnimateSequence( self, "ShowFate" )
			end
		end
		f65_local0 = cardGrid:GetDataSource()
		if f65_local0.backing:GetValue( f11_local1 ) ~= nil then
			f65_local0 = cardGrid:GetDataSource()
			if f65_local0.backing:GetValue( f11_local1 ) == "zm_wc_fortune_card_base" then
				ACTIONS.AnimateSequence( self, "ShowFortune" )
			end
		end
	end )
	self:SubscribeToModelThroughElement( cardGrid, "isUnlocked", function ()
		local f66_local0 = cardGrid:GetDataSource()
		if f66_local0.isUnlocked:GetValue( f11_local1 ) ~= nil then
			f66_local0 = cardGrid:GetDataSource()
			if f66_local0.isUnlocked:GetValue( f11_local1 ) == false then
				ACTIONS.AnimateSequenceByElement( self, {
					elementName = "fortuneCardItemHeader",
					sequenceName = "Locked",
					elementPath = "fortuneCardItemHeader"
				} )
			end
		end
		f66_local0 = cardGrid:GetDataSource()
		if f66_local0.isUnlocked:GetValue( f11_local1 ) ~= nil then
			f66_local0 = cardGrid:GetDataSource()
			if f66_local0.isUnlocked:GetValue( f11_local1 ) == true then
				ACTIONS.AnimateSequenceByElement( self, {
					elementName = "fortuneCardItemHeader",
					sequenceName = "Unlocked",
					elementPath = "fortuneCardItemHeader"
				} )
			end
		end
	end )
	self:SubscribeToModelThroughElement( cardGrid, "rarity", function ()
		local f67_local0 = cardGrid:GetDataSource()
		if f67_local0.rarity:GetValue( f11_local1 ) ~= nil then
			f67_local0 = cardGrid:GetDataSource()
			if f67_local0.rarity:GetValue( f11_local1 ) == "icon_item_quality_1" then
				ACTIONS.AnimateSequence( self, "common" )
			end
		end
		f67_local0 = cardGrid:GetDataSource()
		if f67_local0.rarity:GetValue( f11_local1 ) ~= nil then
			f67_local0 = cardGrid:GetDataSource()
			if f67_local0.rarity:GetValue( f11_local1 ) == "icon_item_quality_2" then
				ACTIONS.AnimateSequence( self, "rare" )
			end
		end
		f67_local0 = cardGrid:GetDataSource()
		if f67_local0.rarity:GetValue( f11_local1 ) ~= nil then
			f67_local0 = cardGrid:GetDataSource()
			if f67_local0.rarity:GetValue( f11_local1 ) == "icon_item_quality_3" then
				ACTIONS.AnimateSequence( self, "legendary" )
			end
		end
		f67_local0 = cardGrid:GetDataSource()
		if f67_local0.rarity:GetValue( f11_local1 ) ~= nil then
			f67_local0 = cardGrid:GetDataSource()
			if f67_local0.rarity:GetValue( f11_local1 ) == "icon_item_quality_4" then
				ACTIONS.AnimateSequence( self, "epic" )
			end
		end
	end )
	f0_local2( self, f11_local1, controller )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	ACTIONS.AnimateSequence( self, "SpinnerRotate" )
	ACTIONS.AnimateSequence( self, "GlowAnimate" )
	if CONDITIONS.IsPublicMatch( self ) then
		ACTIONS.AnimateSequenceByElement( self, {
			elementName = "CRMMain",
			sequenceName = "Minimize",
			elementPath = "CRMMain"
		} )
	end
	return self
end

MenuBuilder.registerType( "FortuneCards", FortuneCards )
LUI.FlowManager.RegisterStackPopBehaviour( "FortuneCards", PopFunc )
LockTable( _M )
