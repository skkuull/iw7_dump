local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = nil
f0_local1 = function ( f1_arg0, f1_arg1 )
	return f0_local0( f1_arg0, f1_arg1 )
end

MenuBuilder.registerType( "MainMenuStore", f0_local1 )
MenuBuilder.registerType( "MPStore", f0_local1 )
MenuBuilder.registerType( "CPStore", f0_local1 )
f0_local2 = "frontEnd.store"
LUI.FlowManager.RegisterFenceGroup( "MainMenuStore", {
	"onlineServicesNoPremium",
	"patch",
	"store",
	"fenceSpinner",
	"exchange"
} )
LUI.FlowManager.RegisterFenceGroup( "MPStore", {
	"store",
	"fenceSpinner",
	"exchange"
} )
LUI.FlowManager.RegisterFenceGroup( "CPStore", {
	"store",
	"fenceSpinner",
	"exchange"
} )
function PopFunc()
	WipeGlobalModelsAtPath( f0_local2 )
	Commerce.StoreShutdown()
	if Engine.IsPS4() then
		Engine.Exec( "hideStoreIcon" )
	end
end

LUI.FlowManager.RegisterStackPopBehaviour( "MainMenuStore", PopFunc )
LUI.FlowManager.RegisterStackPopBehaviour( "MPStore", PopFunc )
LUI.FlowManager.RegisterStackPopBehaviour( "CPStore", PopFunc )
local f0_local3 = function ( f3_arg0, f3_arg1 )
	return function ( f4_arg0, f4_arg1, f4_arg2 )
		local f4_local0 = f3_arg0[f3_arg1][f4_arg1 + 1]
		local f4_local1 = f0_local2 .. ".category." .. f3_arg1 .. ".item." .. f4_arg1
		return {
			name = LUI.DataSourceInGlobalModel.new( f4_local1 .. ".name", f4_local0.name ),
			desc = LUI.DataSourceInGlobalModel.new( f4_local1 .. ".desc", f4_local0.desc ),
			image = LUI.DataSourceInGlobalModel.new( f4_local1 .. ".image", f4_local0.image ),
			price = LUI.DataSourceInGlobalModel.new( f4_local1 .. ".price", f4_local0.price ),
			owned = LUI.DataSourceInGlobalModel.new( f4_local1 .. ".owned", f4_local0.owned ),
			ref = LUI.DataSourceInGlobalModel.new( f4_local1 .. ".ref", f4_local0.ref ),
			isFirstParty = LUI.DataSourceInGlobalModel.new( f4_local1 .. ".isFirstParty", f4_local0.isFirstParty ),
			index = LUI.DataSourceInGlobalModel.new( f4_local1 .. ".index", f4_local0.index ),
			should_exchange = LUI.DataSourceInGlobalModel.new( f4_local1 .. ".should_exchange", f4_local0.should_exchange )
		}
	end
	
end

local f0_local4 = function ( f5_arg0, f5_arg1, f5_arg2, f5_arg3, f5_arg4 )
	if f5_arg0[f5_arg3] then
		return 
	end
	local f5_local0 = Engine.TableLookupByRow( CSV.storeCategories.file, f5_arg2, CSV.storeCategories.cols.category )
	f5_arg0[f5_arg3] = {}
	local f5_local1 = {}
	if f5_local0 == STORE.CRMCategory then
		f5_local1 = Commerce.GetFeaturedItems( f5_arg4 )
	else
		for f5_local2 = CSV.storeCategories.cols.itemsFirstColumn, CSV.storeCategories.cols.itemsLastColumn, 1 do
			local f5_local5 = Engine.TableLookupByRow( CSV.storeCategories.file, f5_arg2, f5_local2 )
			if f5_local5 and #f5_local5 > 0 then
				table.insert( f5_local1, f5_local5 )
			end
		end
	end
	for f5_local14, f5_local5 in ipairs( f5_local1 ) do
		local f5_local15 = Engine.TableLookup( CSV.storeItems.file, CSV.storeItems.cols.ref, f5_local5, CSV.storeItems.cols.image )
		local f5_local16 = Engine.TableLookup( CSV.storeItems.file, CSV.storeItems.cols.ref, f5_local5, CSV.storeItems.cols.firstParty )
		local f5_local17 = Engine.TableLookup( CSV.storeItems.file, CSV.storeItems.cols.ref, f5_local5, CSV.storeItems.cols.should_exchange )
		if f5_local16 == "1" then
			local f5_local6 = CSV.storeItems.cols.steamItemID
			if Engine.IsPS4() then
				f5_local6 = CSV.storeItems.cols.PS4ItemID
			elseif Engine.IsXB3() then
				f5_local6 = CSV.storeItems.cols.XB3ItemID
			elseif Engine.IsPCApp() then
				f5_local6 = CSV.storeItems.cols.UWPItemID
			end
			local f5_local7 = Engine.TableLookup( CSV.storeItems.file, CSV.storeItems.cols.ref, f5_local5, f5_local6 )
			for f5_local12, f5_local13 in ipairs( f5_arg1.items ) do
				if f5_local13.product_label == f5_local7 and f5_local13.available then
					local f5_local11 = f5_local13.price
					if Engine.IsPCApp() then
						f5_local11 = ""
					end
					table.insert( f5_arg0[f5_arg3], {
						name = f5_local13.name,
						desc = f5_local13.description,
						image = f5_local15,
						price = f5_local11,
						owned = f5_local13.owned,
						isFirstParty = true,
						index = f5_local12,
						ref = f5_local5,
						should_exchange = f5_local17
					} )
				end
			end
		end
		local f5_local6 = Engine.TableLookup( CSV.storeItems.file, CSV.storeItems.cols.ref, f5_local5, CSV.storeItems.cols.string )
		local f5_local7 = Engine.TableLookup( CSV.storeItems.file, CSV.storeItems.cols.ref, f5_local5, CSV.storeItems.cols.desc )
		local f5_local8 = Engine.TableLookup( CSV.storeItems.file, CSV.storeItems.cols.ref, f5_local5, CSV.storeItems.cols.CPPrice )
		local f5_local9 = Engine.TableLookup( CSV.storeItems.file, CSV.storeItems.cols.ref, f5_local5, CSV.storeItems.cols.steamItemID )
		table.insert( f5_arg0[f5_arg3], {
			name = Engine.Localize( f5_local6 ),
			desc = Engine.Localize( f5_local7 ),
			image = f5_local15,
			price = f5_local8,
			owned = Loot.IsOwned( f5_arg4, f5_local9 ) > 0,
			isFirstParty = false,
			index = f5_local9,
			ref = f5_local5,
			should_exchange = f5_local17
		} )
	end
end

local f0_local5 = function ( f6_arg0, f6_arg1, f6_arg2 )
	assert( f6_arg0.StoreCategories )
	if CONDITIONS.IsThirdGameMode( f6_arg0 ) then
		f6_arg0.StoreCategories:setUseStencil( false )
	end
	local f6_local0 = {}
	local f6_local1 = Commerce.GetStoreData()
	local f6_local2 = Engine.TableGetRowCount( CSV.storeCategories.file )
	local f6_local3 = {}
	for f6_local4 = 0, f6_local2 - 1, 1 do
		local f6_local7 = false
		local f6_local8 = Engine.TableLookupByRow( CSV.storeCategories.file, f6_local4, CSV.storeCategories.cols.category )
		if f6_local8 == STORE.CRMCategory or f6_local8 == STORE.Normal then
			f6_local7 = true
		elseif f6_local8 == STORE.PSN and Engine.IsPS4() and Engine.GetDvarBool( "onlinegame" ) == false then
			f6_local7 = true
		elseif f6_local8 == STORE.XBL and Engine.IsXB3() and Engine.GetDvarBool( "onlinegame" ) == false then
			f6_local7 = true
		elseif f6_local8 == STORE.STEAM and Engine.IsPCDesktop() and Engine.GetDvarBool( "onlinegame" ) == false then
			f6_local7 = true
		elseif f6_local8 == STORE.UWP and Engine.IsPCApp() and Engine.GetDvarBool( "onlinegame" ) == false then
			f6_local7 = true
		elseif f6_local8 == STORE.PSNOnline and Engine.IsPS4() and Engine.GetDvarBool( "onlinegame" ) then
			f6_local7 = true
		elseif f6_local8 == STORE.XBLOnline and Engine.IsXB3() and Engine.GetDvarBool( "onlinegame" ) then
			f6_local7 = true
		elseif f6_local8 == STORE.STEAMOnline and Engine.IsPCDesktop() and Engine.GetDvarBool( "onlinegame" ) then
			f6_local7 = true
		elseif f6_local8 == STORE.UWPOnline and Engine.IsPCApp() and Engine.GetDvarBool( "onlinegame" ) then
			f6_local7 = true
		end
		if f6_local7 == true then
			f6_local3[#f6_local3 + 1] = f6_local4
		end
	end
	local f6_local4 = LUI.DataSourceFromList.new( #f6_local3 )
	local f6_local5 = f0_local2 .. ".category"
	f6_local4.MakeDataSourceAtIndex = function ( f7_arg0, f7_arg1, f7_arg2 )
		local f7_local0 = Engine.Localize( Engine.TableLookupByRow( CSV.storeCategories.file, f6_local3[f7_arg1 + 1], CSV.storeCategories.cols.string ) )
		local f7_local1 = Engine.TableLookupByRow( CSV.storeCategories.file, f6_local3[f7_arg1 + 1], CSV.storeCategories.cols.ref )
		local f7_local2 = Engine.TableLookupByRow( CSV.storeCategories.file, f6_local3[f7_arg1 + 1], CSV.storeCategories.cols.first_party )
		f0_local4( f6_local0, f6_local1, f6_local3[f7_arg1 + 1], f7_arg1, f7_arg2 )
		local f7_local3 = LUI.DataSourceFromList.new( #f6_local0[f7_arg1] )
		f7_local3:SetCachingEnabled( true )
		f7_local3.MakeDataSourceAtIndex = f0_local3( f6_local0, f7_arg1 )
		return {
			name = LUI.DataSourceInGlobalModel.new( f6_local5 .. "." .. f7_arg1 .. ".name", f7_local0 ),
			ref = f7_local1,
			index = f7_arg1,
			items = f7_local3,
			first_party = f7_local2
		}
	end
	
	f6_arg0.StoreCategories:SetGridDataSource( f6_local4, f6_arg1 )
	f6_arg0.modelPath = f0_local2
	local self = LUI.UIBindButton.new()
	self.id = "bindButton"
	f6_arg0:addElement( self )
	self:addEventHandler( "button_secondary", function ( f8_arg0, f8_arg1 )
		if f6_arg0.selectingStoreItems and not f6_arg2.onlyCODPoints then
			f6_arg0:dispatchEventToCurrentMenu( {
				name = "select_store_categories"
			} )
		else
			if f6_arg2.fromMainMenu == true then
				Engine.StopGameMode()
			end
			ACTIONS.LeaveMenu( f6_arg0 )
		end
	end )
	f6_arg0:addEventHandler( "select_store_item", function ( f9_arg0, f9_arg1 )
		f9_arg0.selectingStoreItems = true
		f9_arg0.StoreCategories:saveState()
		ACTIONS.LoseFocus( f6_arg0, "StoreCategories", f6_arg1 )
		ACTIONS.GainFocus( f6_arg0, "StoreShowcase", f6_arg1 )
		return true
	end )
	f6_arg0:addEventHandler( "select_store_categories", function ( f10_arg0, f10_arg1 )
		f10_arg0.selectingStoreItems = false
		ACTIONS.LoseFocus( f6_arg0, "StoreShowcase", f6_arg1 )
		ACTIONS.GainFocus( f6_arg0, "StoreCategories", f6_arg1 )
		return true
	end )
	f6_arg0:addEventHandler( "menu_close", function ( f11_arg0, f11_arg1 )
		Engine.StoreClosed( f6_arg1 )
	end )
	if f6_arg2.onlyCODPoints then
		f6_arg0.StoreCategories:SetAlpha( 0, 0 )
		local f6_local9 = f6_arg0.StoreCategories:getFirstChild()
		while f6_local9 do
			local f6_local7 = f6_local9:getNextSibling()
			f6_local9:SetHandleMouse( false )
			f6_local9 = f6_local7
		end
		f6_local4.GetDefaultFocusIndex = function ()
			local f12_local0 = nil
			for f12_local1 = 0, f6_local4:GetCountValue( f6_arg1 ) - 1, 1 do
				local f12_local4 = f6_local4:GetDataSourceAtIndex( f12_local1, f6_arg1 )
				if f12_local4.ref == STORE.CODPointsCategory then
					f12_local0 = f12_local1
					break
				end
			end
			assert( f12_local0 )
			return f12_local0
		end
		
		f6_arg0:SubscribeToDataSourceThroughElement( f6_arg0.StoreCategories, nil, function ()
			f6_arg0:processEvent( {
				name = "select_store_item"
			} )
			f6_arg0.StoreCategories:closeTree()
		end )
	end
	f6_arg0:SubscribeToDataSourceThroughElement( f6_arg0.StoreCategories, nil, function ()
		local f14_local0 = f6_arg0.StoreShowcase
		local f14_local1 = f14_local0
		f14_local0 = f14_local0.UpdateStoreItemButtons
		local f14_local2 = f6_arg1
		local f14_local3 = f6_arg0.StoreCategories:GetDataSource()
		f14_local0( f14_local1, f14_local2, f14_local3.items )
		if Engine.IsPS4() then
			f14_local0 = f6_arg0.StoreCategories:GetDataSource()
			if f14_local0.items:GetCountValue( f6_arg1 ) > 0 then
				f14_local0 = f6_arg0.StoreCategories:GetDataSource()
				if f14_local0.first_party == "1" then
					Engine.Exec( "showStoreIcon" )
				else
					Engine.Exec( "hideStoreIcon" )
				end
			end
			Engine.Exec( "hideStoreIcon" )
		end
	end )
	if CONDITIONS.IsCoreMultiplayer( f6_arg0 ) then
		f6_arg0.MenuTitle.MenuBreadcrumbs:setText( ToUpperCase( Engine.Localize( "MENU_MULTIPLAYER" ), 0 ) )
	end
	f6_arg0.restoreState = function ( f15_arg0, f15_arg1, f15_arg2, f15_arg3 )
		if not f6_arg2.defaultItem then
			return LUI.UIElement.restoreState( f15_arg0, f15_arg1, f15_arg2, f15_arg3 )
		end
		for f15_local0 = 0, f6_local4:GetCountValue( f15_arg2 ) - 1, 1 do
			local f15_local3 = f6_local4:GetDataSourceAtIndex( f15_local0, f15_arg2 )
			for f15_local4 = 0, f15_local3.items:GetCountValue( f15_arg2 ) - 1, 1 do
				local f15_local7 = f15_local3.items:GetDataSourceAtIndex( f15_local4, f15_arg2 )
				if f15_local7.ref:GetValue( f15_arg2 ) == f6_arg2.defaultItem then
					f15_arg0.StoreCategories:SetFocusedPosition( {
						x = 0,
						y = f15_local0
					}, true, true )
					f15_arg0.StoreCategories:saveState()
					ACTIONS.LoseFocus( f15_arg0, "StoreCategories", f15_arg2 )
					f15_arg0.StoreShowcase:FocusItem( f15_local4 )
					f15_arg0.selectingStoreItems = true
					if f6_arg2.andPurchase == true then
						if IsArabicSKU() then
							Commerce.Purchase( f15_arg2, f15_local4, true )
						else
							Commerce.Purchase( f15_arg2, f15_local4, false )
						end
					end
				end
			end
		end
		f6_arg2.defaultItem = nil
		return true, 1
	end
	
end

MenuBuilder.registerType( "Store", function ( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "Store"
	local f16_local1 = controller and controller.controllerIndex
	if not f16_local1 and not Engine.InFrontend() then
		f16_local1 = self:getRootController()
	end
	assert( f16_local1 )
	self:playSound( "menu_open" )
	local f16_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:setImage( RegisterMaterial( "sp_frontend_bink_background" ), 0 )
	self:addElement( Background )
	self.Background = Background
	
	local BackgroundFill = nil
	
	BackgroundFill = LUI.UIImage.new()
	BackgroundFill.id = "BackgroundFill"
	BackgroundFill:SetRGBFromInt( 0, 0 )
	BackgroundFill:SetAlpha( 0, 0 )
	BackgroundFill:SetBlendMode( BLEND_MODE.blend )
	self:addElement( BackgroundFill )
	self.BackgroundFill = BackgroundFill
	
	local StoreCategories = nil
	
	StoreCategories = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 15,
		controllerIndex = f16_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "StoreCategoryButton", {
				controllerIndex = f16_local1
			} )
		end,
		wrapX = false,
		wrapY = true,
		spacingX = _1080p * 7,
		spacingY = _1080p * 7,
		columnWidth = _1080p * 500,
		rowHeight = _1080p * 30,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	StoreCategories.id = "StoreCategories"
	StoreCategories:setUseStencil( false )
	StoreCategories:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 630, _1080p * 223, _1080p * 771 )
	self:addElement( StoreCategories )
	self.StoreCategories = StoreCategories
	
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f16_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1920, _1080p * 995, _1080p * 1080 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local f16_local7 = nil
	if not CONDITIONS.IsThirdGameMode( self ) then
		f16_local7 = MenuBuilder.BuildRegisteredType( "MenuTitle", {
			controllerIndex = f16_local1
		} )
		f16_local7.id = "MenuTitle"
		f16_local7.MenuTitle:setText( ToUpperCase( Engine.Localize( "LUA_MENU_STORE_CAPS" ) ), 0 )
		f16_local7.MenuBreadcrumbs:setText( ToUpperCase( "" ), 0 )
		f16_local7.Icon:SetTop( _1080p * -28.5, 0 )
		f16_local7.Icon:SetBottom( _1080p * 61.5, 0 )
		f16_local7:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
		self:addElement( f16_local7 )
		self.MenuTitle = f16_local7
	end
	local f16_local8 = nil
	if CONDITIONS.IsThirdGameMode( self ) then
		f16_local8 = MenuBuilder.BuildRegisteredType( "CPMenuTitle", {
			controllerIndex = f16_local1
		} )
		f16_local8.id = "CPMenuTitle"
		f16_local8.MenuTitle:setText( Engine.Localize( "LUA_MENU_STORE_CAPS" ), 0 )
		f16_local8:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
		self:addElement( f16_local8 )
		self.CPMenuTitle = f16_local8
	end
	local StoreShowcase = nil
	
	StoreShowcase = MenuBuilder.BuildRegisteredType( "StoreShowcase", {
		controllerIndex = f16_local1
	} )
	StoreShowcase.id = "StoreShowcase"
	StoreShowcase:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 666, _1080p * 1920, _1080p * 145.5, _1080p * 948.5 )
	self:addElement( StoreShowcase )
	self.StoreShowcase = StoreShowcase
	
	local SocialFeed = nil
	
	SocialFeed = MenuBuilder.BuildRegisteredType( "SocialFeed", {
		controllerIndex = f16_local1
	} )
	SocialFeed.id = "SocialFeed"
	SocialFeed:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1920, _1080p * 965, _1080p * 995 )
	self:addElement( SocialFeed )
	self.SocialFeed = SocialFeed
	
	local f16_local11 = nil
	if not CONDITIONS.IsMenuInStack( "MainMenuStore" ) then
		f16_local11 = MenuBuilder.BuildRegisteredType( "BasicCurrencies", {
			controllerIndex = f16_local1
		} )
		f16_local11.id = "Currencies"
		f16_local11:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -500, 0, _1080p * 54, _1080p * 104 )
		self:addElement( f16_local11 )
		self.Currencies = f16_local11
	end
	self.addButtonHelperFunction = function ( f18_arg0, f18_arg1 )
		f18_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			priority = 1,
			clickable = true
		} )
		f18_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_SELECT" ),
			button_ref = "button_primary",
			side = "left",
			clickable = true
		} )
	end
	
	self:addEventHandler( "menu_create", self.addButtonHelperFunction )
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	f0_local5( self, f16_local1, controller )
	return self
end )
LUI.FlowManager.RegisterStackPopBehaviour( "Store", PopFunc )
LockTable( _M )
