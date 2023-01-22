local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "frontEnd.MP.prestigeMenu.weaponSelect"
f0_local1 = "frontEnd.MP.prestigeMenu.weaponSelectTab"
function GetWeaponDecorator( f1_arg0 )
	return function ( f2_arg0, f2_arg1, f2_arg2 )
		WipeGlobalModelsAtPath( f0_local0 )
		assert( f2_arg1.ref )
		assert( f2_arg1.name )
		assert( f2_arg1.image )
		assert( f2_arg1.desc )
		local f2_local0 = f2_arg1.ref:GetValue( f2_arg2 )
		local f2_local1 = {}
		local f2_local2 = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".attachmentRef", "none" )
		local f2_local3 = Cac.GetWeaponLevelData( f2_local0, f2_arg2 )
		local f2_local4 = f0_local1
		local f2_local5 = LUI.DataSourceInGlobalModel.new( f2_local4 .. "fullImage", Cac.GetWeaponFullImage( f2_local0 ) )
		local f2_local6 = {}
		local f2_local7 = Cac.GetWeaponLevelData( f2_local0, f2_arg2 )
		local f2_local8 = f0_local1 .. ".loot." .. f2_local0 .. "."
		f2_local6[1] = {
			weapon = {
				ref = f2_arg1.ref,
				name = f2_arg1.name,
				image = f2_arg1.image,
				desc = f2_arg1.desc,
				baseWeaponRef = f2_arg1.ref,
				quality = LUI.DataSourceInGlobalModel.new( f2_local8 .. "quality", 0 ),
				variantID = LUI.DataSourceInGlobalModel.new( f2_local8 .. "variantID", -1 ),
				variantIndex = LUI.DataSourceInGlobalModel.new( f2_local8 .. "variantIndex", 0 )
			}
		}
		local f2_local9 = LUI.DataSourceFromList.new( #f2_local6 )
		f2_local9.GetDataSourceAtIndex = function ( f3_arg0, f3_arg1 )
			return f2_local6[f3_arg1 + 1]
		end
		
		f2_local9.GetDefaultFocusIndex = function ()
			return 0
		end
		
		return {
			ref = f2_arg1.ref,
			name = f2_arg1.name,
			image = f2_arg1.image,
			weaponLevel = LUI.DataSourceInGlobalModel.new( f2_local4 .. "level", f2_local7.currentLevel ),
			isLoot = LUI.DataSourceInGlobalModel.new( f2_local4 .. "isLoot", false ),
			variantIndex = LUI.DataSourceInGlobalModel.new( f2_local4 .. "variantIndex", 0 ),
			variants = f2_local9
		}
	end
	
end

f0_local2 = function ( f5_arg0, f5_arg1 )
	return function ( f6_arg0, f6_arg1, f6_arg2 )
		return {
			name = f6_arg1.pluralName:Filter( "localized", Engine.Localize ),
			baseWeapons = f6_arg1.weapons:Decorate( f5_arg1 ),
			focusFunction = function ()
				f5_arg0.BaseItems:processEvent( {
					name = "gain_focus",
					controllerIndex = f6_arg2
				} )
			end
			
		}
	end
	
end

local f0_local3 = function ( f8_arg0 )
	return Engine.TableLookup( CSV.MPWeapons.file, CSV.MPWeapons.cols.ref, f8_arg0, CSV.MPWeapons.cols.postLaunch ) ~= ""
end

function PopFunc()
	ClientWeapon.SetWeaponVisible( 0, false )
	ClientWeapon.SetWeaponVisible( 1, false )
	ClientWeapon.SetWeaponVisible( 2, false )
	ClientWeapon.SetWeaponRotation( 0, 0, 0, 0 )
	ClientWeapon.SetWeaponRotation( 1, 0, 0, 0 )
	ClientWeapon.SetWeaponRotation( 2, 0, 0, 0 )
	Streaming.SetStreamingEnabled( false )
	WipeGlobalModelsAtPath( f0_local0 )
end

function PostLoadFunc( f10_arg0, f10_arg1, f10_arg2 )
	assert( f10_arg2 )
	assert( f10_arg0.MenuTitle )
	assert( f10_arg0.MenuTitle.MenuTitle )
	assert( f10_arg0.Tabs )
	assert( f10_arg0.Tabs.Tabs )
	assert( f10_arg0.BaseItems )
	assert( f10_arg0.ButtonHelperBar )
	f10_arg0.menuUsesItemClasses = true
	f10_arg0.MenuTitle.MenuBreadcrumbs:setText( ToUpperCase( Engine.Localize( "PRESTIGE_PERMANENT_UNLOCKS" ), 0 ) )
	local f10_local0 = Cac.PrimaryWeaponSlot
	if f10_arg2.weaponClass ~= nil then
		f10_local0 = f10_arg2.weaponClass
	end
	local f10_local1 = Cac.GetWeaponClasses( f10_local0 )
	local f10_local2 = ""
	if f10_local0 == Cac.PrimaryWeaponSlot then
		f10_arg0.MenuTitle.MenuTitle:setText( ToUpperCase( Engine.Localize( "MENU_PRIMARY_WEAPONS" ), 0 ) )
		f10_local2 = "weapon_classic_p"
	else
		f10_arg0.MenuTitle.MenuTitle:setText( ToUpperCase( Engine.Localize( "MENU_SECONDARY_WEAPONS" ), 0 ) )
		f10_local2 = "weapon_classic_s"
	end
	local f10_local3 = {}
	for f10_local4 = 1, #f10_local1, 1 do
		if f10_local1[f10_local4].ref ~= f10_local2 then
			table.insert( f10_local3, f10_local1[f10_local4] )
		end
	end
	local f10_local4 = LOADOUT.MakeBaseWeaponsListDataSource( f0_local0 .. ".baseWeapons", f10_local3, Cac.GetWeaponRowList(), {
		filterOut = f0_local3
	} )
	local f10_local7 = f10_local4:Decorate( f0_local2( f10_arg0, GetWeaponDecorator( f10_arg0 ) ) )
	f10_local7:SetCachingEnabled( true )
	f10_arg0:SetDataSource( {
		tabs = f10_local7
	}, f10_arg1 )
	f10_arg0:SubscribeToModelThroughElement( f10_arg0.BaseItems, "ref", function ()
		local f11_local0 = f10_arg0.BaseItems:GetDataSource()
		local f11_local1 = f11_local0.ref:GetValue( f10_arg1 )
		local f11_local2 = Cac.GetBaseWeaponUnlockRank( f11_local1 )
		local f11_local3 = Prestige.IsItemUnlocked( f10_arg1, f11_local1, "weapon" )
		if not f11_local3 then
			f11_local3 = tonumber( f11_local2 ) == 0
		end
		if f11_local3 then
			f10_arg0.PermanentUnlockItemDetails.ItemCost:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_ALREADY_UNLOCKED" ) ), 0 )
			ACTIONS.AnimateSequence( f10_arg0.PermanentUnlockItemDetails, "HideUnlockInfo" )
			f10_arg0.PermanentUnlockItemDetails.TokenIcon:SetAlpha( 0 )
			f10_arg0.PermanentUnlockItemDetails.ItemCost:SetLeft( _1080p * 20 )
		else
			f10_arg0.PermanentUnlockItemDetails.ItemCost:setText( ToUpperCase( Engine.Localize( "PRESTIGE_PERMANENT_UNLOCKS_COST", 1 ) ) )
			ACTIONS.AnimateSequence( f10_arg0.PermanentUnlockItemDetails, "ShowUnlockInfo" )
			f10_arg0.PermanentUnlockItemDetails.PermanentUnlockItemUnlockInfo.UnlockDesc:setText( Engine.Localize( "PRESTIGE_UNLOCKS_AT", Rank.GetRankDisplay( f11_local2 ) ) )
			f10_arg0.PermanentUnlockItemDetails.TokenIcon:SetAlpha( 1 )
			f10_arg0.PermanentUnlockItemDetails.ItemCost:SetLeft( _1080p * 75 )
		end
		local f11_local4 = Cac.GetCompleteWeaponModelName( f11_local1, f11_local1, Cac.LowestQuality, -1, nil )
		Streaming.RequestWeaponViewModels( {
			f11_local4
		}, f10_arg1 )
		FrontEndScene.SetWeaponModel( 0, f11_local4, true )
		ClientWeapon.SetWeaponVisible( 0, true )
		ClientWeapon.SetWeaponRotation( 0, 0, 0, 0 )
		ClientWeapon.SetWeaponRotation( 1, 0, 0, 0 )
		ClientWeapon.SetWeaponRotation( 2, 0, 0, 0 )
	end )
	local f10_local8 = function ( f12_arg0 )
		local f12_local0 = f10_arg0.BaseItems:GetDataSource()
		local f12_local1 = f12_local0.ref:GetValue( f12_arg0 )
		Prestige.PermanentUnlockTokenSpendAction( f12_arg0, f12_local1, Cac.GetWeaponName( f12_local1 ), "weapon", Cac.GetBaseWeaponUnlockRank( f12_local1 ), function ()
			Prestige.UsePermanentUnlockToken( f10_arg1, f12_local1, "weapon" )
			f10_arg0.PermanentUnlockTokens:processEvent( {
				name = "update_token_count"
			} )
		end )
	end
	
	f10_arg0.bindButton:addEventHandler( "button_primary", function ( f14_arg0, f14_arg1 )
		f10_local8( f14_arg1.controller or f10_arg1 )
	end )
	if Engine.IsPC() then
		f10_arg0:addEventHandler( "weapon_select_alternate", function ( f15_arg0, f15_arg1 )
			f10_local8( f15_arg1.controller or f10_arg1 )
		end )
	end
	Streaming.SetStreamingEnabled( true )
	ClientWeapon.SetWeaponRotation( 0, 0, 0, 0 )
	ClientWeapon.SetWeaponRotation( 1, 0, 0, 0 )
	ClientWeapon.SetWeaponRotation( 2, 0, 0, 0 )
	FrontEndScene.SetScene( "weapon_select" )
end

function WeaponPermanentUnlocks( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "WeaponPermanentUnlocks"
	local f16_local1 = controller and controller.controllerIndex
	if not f16_local1 and not Engine.InFrontend() then
		f16_local1 = self:getRootController()
	end
	assert( f16_local1 )
	self:playSound( "menu_open" )
	local f16_local2 = self
	local Tabs = nil
	
	Tabs = MenuBuilder.BuildRegisteredType( "SubMenuTabsBar", {
		controllerIndex = f16_local1
	} )
	Tabs.id = "Tabs"
	Tabs.Tabs:SetTabManagerDataSourceThroughElement( self, "tabs" )
	Tabs:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 145, _1080p * 185 )
	self:addElement( Tabs )
	self.Tabs = Tabs
	
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f16_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local BaseItems = nil
	
	BaseItems = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 5,
		controllerIndex = f16_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "PermanentUnlockBaseWeapon", {
				controllerIndex = f16_local1
			} )
		end,
		wrapX = false,
		wrapY = false,
		spacingX = _1080p * 6,
		spacingY = _1080p * 6,
		columnWidth = _1080p * 250,
		rowHeight = _1080p * 140,
		scrollingThresholdX = 1,
		scrollingThresholdY = 0,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	BaseItems.id = "BaseItems"
	BaseItems:setUseStencil( true )
	BaseItems:SetGridDataSourceThroughElement( Tabs.Tabs, "baseWeapons" )
	BaseItems:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 147, _1080p * 397, _1080p * 216, _1080p * 940 )
	self:addElement( BaseItems )
	self.BaseItems = BaseItems
	
	local FriendsElement = nil
	
	FriendsElement = MenuBuilder.BuildRegisteredType( "online_friends_widget", {
		controllerIndex = f16_local1
	} )
	FriendsElement.id = "FriendsElement"
	FriendsElement:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	FriendsElement:SetAlignment( LUI.Alignment.Left )
	FriendsElement:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 100, _1080p * 600, _1080p * -60, _1080p * -15 )
	self:addElement( FriendsElement )
	self.FriendsElement = FriendsElement
	
	local Weapons = nil
	
	Weapons = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 1,
		controllerIndex = f16_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "PermanentUnlockWeapon", {
				controllerIndex = f16_local1
			} )
		end,
		wrapX = false,
		wrapY = false,
		primaryAxis = LUI.DIRECTION.vertical,
		spacingX = _1080p * 0,
		spacingY = _1080p * 0,
		columnWidth = _1080p * 1000,
		rowHeight = _1080p * 450,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Center,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 2800
	} )
	Weapons.id = "Weapons"
	Weapons:setUseStencil( true )
	Weapons:SetGridDataSourceThroughElement( BaseItems, "variants" )
	Weapons:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * -299.5, _1080p * 780.5, _1080p * 336, _1080p * 786 )
	self:addElement( Weapons )
	self.Weapons = Weapons
	
	local BaseWeaponsScrollbar = nil
	
	BaseWeaponsScrollbar = MenuBuilder.BuildRegisteredType( "VerticalMinimalScrollbar", {
		controllerIndex = f16_local1
	} )
	BaseWeaponsScrollbar.id = "BaseWeaponsScrollbar"
	BaseWeaponsScrollbar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 147, _1080p * 216, _1080p * 906 )
	self:addElement( BaseWeaponsScrollbar )
	self.BaseWeaponsScrollbar = BaseWeaponsScrollbar
	
	local MenuTitle = nil
	
	MenuTitle = MenuBuilder.BuildRegisteredType( "MenuTitle", {
		controllerIndex = f16_local1
	} )
	MenuTitle.id = "MenuTitle"
	MenuTitle.MenuTitle:setText( ToUpperCase( Engine.Localize( "MENU_NEW" ) ), 0 )
	MenuTitle.MenuBreadcrumbs:setText( ToUpperCase( Engine.Localize( "MENU_MULTIPLAYER" ) ), 0 )
	MenuTitle.Icon:SetTop( _1080p * -28.5, 0 )
	MenuTitle.Icon:SetBottom( _1080p * 61.5, 0 )
	MenuTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1096, _1080p * 54, _1080p * 134 )
	self:addElement( MenuTitle )
	self.MenuTitle = MenuTitle
	
	local ArrowUp = nil
	
	ArrowUp = MenuBuilder.BuildRegisteredType( "ArrowUp", {
		controllerIndex = f16_local1
	} )
	ArrowUp.id = "ArrowUp"
	ArrowUp:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 344.5, _1080p * 364.5, _1080p * 932, _1080p * 972 )
	self:addElement( ArrowUp )
	self.ArrowUp = ArrowUp
	
	local ArrowDown = nil
	
	ArrowDown = MenuBuilder.BuildRegisteredType( "ArrowDown", {
		controllerIndex = f16_local1
	} )
	ArrowDown.id = "ArrowDown"
	ArrowDown:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 179.5, _1080p * 199.5, _1080p * 932, _1080p * 972 )
	self:addElement( ArrowDown )
	self.ArrowDown = ArrowDown
	
	local ListCount = nil
	
	ListCount = LUI.UIText.new()
	ListCount.id = "ListCount"
	ListCount:setText( "1/15", 0 )
	ListCount:SetFontSize( 24 * _1080p )
	ListCount:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ListCount:SetAlignment( LUI.Alignment.Center )
	ListCount:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 199.5, _1080p * 344.5, _1080p * 940, _1080p * 964 )
	self:addElement( ListCount )
	self.ListCount = ListCount
	
	local SocialFeed = nil
	
	SocialFeed = MenuBuilder.BuildRegisteredType( "SocialFeed", {
		controllerIndex = f16_local1
	} )
	SocialFeed.id = "SocialFeed"
	SocialFeed:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -115, _1080p * -85 )
	self:addElement( SocialFeed )
	self.SocialFeed = SocialFeed
	
	local PermanentUnlockTokens = nil
	
	PermanentUnlockTokens = MenuBuilder.BuildRegisteredType( "PermanentUnlockTokens", {
		controllerIndex = f16_local1
	} )
	PermanentUnlockTokens.id = "PermanentUnlockTokens"
	PermanentUnlockTokens:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1170, _1080p * 1920, _1080p * 71.5, _1080p * 116.5 )
	self:addElement( PermanentUnlockTokens )
	self.PermanentUnlockTokens = PermanentUnlockTokens
	
	local PermanentUnlockItemDetails = nil
	
	PermanentUnlockItemDetails = MenuBuilder.BuildRegisteredType( "PermanentUnlockItemDetails", {
		controllerIndex = f16_local1
	} )
	PermanentUnlockItemDetails.id = "PermanentUnlockItemDetails"
	PermanentUnlockItemDetails.ItemDescription:SetRight( _1080p * 620, 0 )
	PermanentUnlockItemDetails.ItemName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	PermanentUnlockItemDetails:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 413, _1080p * 1920, _1080p * 216, _1080p * 316 )
	PermanentUnlockItemDetails:SubscribeToModelThroughElement( Weapons, "weapon.desc", function ()
		local f19_local0 = Weapons:GetDataSource()
		f19_local0 = f19_local0.weapon.desc:GetValue( f16_local1 )
		if f19_local0 ~= nil then
			PermanentUnlockItemDetails.ItemDescription:setText( f19_local0, 0 )
		end
	end )
	PermanentUnlockItemDetails:SubscribeToModelThroughElement( Weapons, "weapon.name", function ()
		local f20_local0 = Weapons:GetDataSource()
		f20_local0 = f20_local0.weapon.name:GetValue( f16_local1 )
		if f20_local0 ~= nil then
			PermanentUnlockItemDetails.ItemName:setText( f20_local0, 0 )
		end
	end )
	self:addElement( PermanentUnlockItemDetails )
	self.PermanentUnlockItemDetails = PermanentUnlockItemDetails
	
	local WeaponRotator = nil
	
	WeaponRotator = MenuBuilder.BuildRegisteredType( "WeaponRotator", {
		controllerIndex = f16_local1
	} )
	WeaponRotator.id = "WeaponRotator"
	WeaponRotator:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 413, 0, _1080p * 336, _1080p * 932 )
	self:addElement( WeaponRotator )
	self.WeaponRotator = WeaponRotator
	
	local CRMMain = nil
	
	CRMMain = MenuBuilder.BuildRegisteredType( "CRMMain", {
		controllerIndex = f16_local1
	} )
	CRMMain.id = "CRMMain"
	CRMMain:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 136, _1080p * 447, _1080p * 745, _1080p * 1069 )
	self:addElement( CRMMain )
	self.CRMMain = CRMMain
	
	BaseItems:addEventHandler( "gain_focus", function ( f21_arg0, f21_arg1 )
		ACTIONS.GainFocus( self, "Weapons", f21_arg1.controller or f16_local1 )
	end )
	BaseItems:addEventHandler( "lose_focus", function ( f22_arg0, f22_arg1 )
		ACTIONS.LoseFocus( self, "Weapons", f22_arg1.controller or f16_local1 )
	end )
	local f16_local18 = LUI.UIScrollbar.new
	local bindButton = {
		direction = LUI.DIRECTION.vertical,
		eventListener = BaseWeaponsScrollbar,
		startCap = BaseWeaponsScrollbar.startCap,
		endCap = BaseWeaponsScrollbar.endCap
	}
	local f16_local20 = BaseWeaponsScrollbar.sliderArea
	if f16_local20 then
		f16_local20 = BaseWeaponsScrollbar.sliderArea.slider
	end
	bindButton.slider = f16_local20
	f16_local20 = BaseWeaponsScrollbar.sliderArea
	if f16_local20 then
		f16_local20 = BaseWeaponsScrollbar.sliderArea.fixedSizeSlider
	end
	bindButton.fixedSizeSlider = f16_local20
	BaseItems:AddScrollbar( f16_local18( bindButton ) )
	BaseItems:AddArrow( ArrowUp )
	BaseItems:AddArrow( ArrowDown )
	BaseItems:AddItemNumbers( ListCount )
	self.addButtonHelperFunction = function ( f23_arg0, f23_arg1 )
		f23_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			priority = 10,
			clickable = true
		} )
		f23_arg0:AddButtonHelperText( {
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
	
	self.bindButton:addEventHandler( "button_secondary", function ( f24_arg0, f24_arg1 )
		local f24_local0 = f24_arg1.controller or f16_local1
		ACTIONS.LeaveMenu( self )
		return true
	end )
	PostLoadFunc( self, f16_local1, controller )
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "CRMMain",
		sequenceName = "Minimize",
		elementPath = "CRMMain"
	} )
	return self
end

MenuBuilder.registerType( "WeaponPermanentUnlocks", WeaponPermanentUnlocks )
LUI.FlowManager.RegisterStackPopBehaviour( "WeaponPermanentUnlocks", PopFunc )
LockTable( _M )
