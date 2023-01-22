local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = nil
f0_local1 = function ( f1_arg0, f1_arg1 )
	return f0_local0( f1_arg0, f1_arg1 )
end

MenuBuilder.registerType( "MainMenuStoreBasic", f0_local1 )
MenuBuilder.registerType( "MPStoreBasic", f0_local1 )
LUI.FlowManager.RegisterFenceGroup( "MainMenuStoreBasic", {
	"onlineServices",
	"patch",
	"store",
	"fenceSpinner",
	"exchange"
} )
LUI.FlowManager.RegisterFenceGroup( "MPStoreBasic", {
	"store",
	"fenceSpinner",
	"exchange"
} )
f0_local2 = function ()
	local f2_local0 = {
		"vip",
		"bronzevc",
		"silvervc",
		"goldvc"
	}
	local f2_local1 = "frontEnd.store.items"
	local f2_local2 = Commerce.GetStoreData()
	local f2_local3 = LUI.DataSourceFromList.new( #f2_local0 )
	f2_local3.MakeDataSourceAtIndex = function ( f3_arg0, f3_arg1, f3_arg2 )
		assert( f2_local0[f3_arg1 + 1] )
		local f3_local0 = f2_local0[f3_arg1 + 1]
		local f3_local1 = Engine.TableLookup( CSV.storeItems.file, CSV.storeItems.cols.ref, f3_local0, CSV.storeItems.cols.string )
		local f3_local2 = ""
		local f3_local3 = Engine.TableLookup( CSV.storeItems.file, CSV.storeItems.cols.ref, f3_local0, CSV.storeItems.cols.image )
		local f3_local4 = ""
		local f3_local5 = false
		local f3_local6 = false
		local f3_local7 = 0
		local f3_local8 = Engine.TableLookup( CSV.storeItems.file, CSV.storeItems.cols.ref, f3_local0, CSV.storeItems.cols.firstParty )
		if f3_local8 == "1" then
			local f3_local9 = CSV.storeItems.cols.steamItemID
			if Engine.IsPS4() then
				f3_local9 = CSV.storeItems.cols.PS4ItemID
			elseif Engine.IsXB3() then
				f3_local9 = CSV.storeItems.cols.XB3ItemID
			end
			local f3_local10 = Engine.TableLookup( CSV.storeItems.file, CSV.storeItems.cols.ref, f3_local0, f3_local9 )
			for f3_local14, f3_local15 in ipairs( f2_local2.items ) do
				if f3_local15.product_label == f3_local10 then
					f3_local1 = f3_local15.name
					f3_local2 = f3_local15.description
					f3_local4 = f3_local15.price
					f3_local5 = f3_local15.owned
					f3_local7 = f3_local14
					f3_local8 = true
				end
			end
		else
			f3_local7 = Engine.TableLookup( CSV.storeItems.file, CSV.storeItems.cols.ref, f3_local0, CSV.storeItems.cols.steamItemID )
		end
		return {
			name = LUI.DataSourceInGlobalModel.new( f2_local1 .. "." .. f3_local0 .. ".name", f3_local1 ),
			desc = LUI.DataSourceInGlobalModel.new( f2_local1 .. "." .. f3_local0 .. ".desc", f3_local2 ),
			image = LUI.DataSourceInGlobalModel.new( f2_local1 .. "." .. f3_local0 .. ".image", f3_local3 ),
			price = LUI.DataSourceInGlobalModel.new( f2_local1 .. "." .. f3_local0 .. ".price", f3_local4 ),
			owned = LUI.DataSourceInGlobalModel.new( f2_local1 .. "." .. f3_local0 .. ".owned", f3_local5 ),
			isFirstParty = LUI.DataSourceInGlobalModel.new( f2_local1 .. "." .. f3_local0 .. ".isFirstParty", f3_local8 ),
			index = LUI.DataSourceInGlobalModel.new( f2_local1 .. "." .. f3_local0 .. ".index", f3_local7 ),
			ref = LUI.DataSourceInGlobalModel.new( f2_local1 .. "." .. f3_local0 .. ".ref", f3_local0 )
		}
	end
	
	return f2_local3
end

local f0_local3 = function ( f4_arg0, f4_arg1, f4_arg2 )
	f4_arg0.StoreItems:SetGridDataSource( f0_local2(), f4_arg1 )
	f4_arg0.Description:SubscribeToModelThroughElement( f4_arg0.StoreItems, "desc", function ()
		local f5_local0 = f4_arg0.StoreItems:GetDataSource()
		f5_local0 = f5_local0.desc:GetValue( f4_arg1 )
		if f5_local0 ~= nil then
			f4_arg0.Description:setText( f5_local0, 0 )
		end
	end )
	f4_arg0.Cost:SubscribeToModelThroughElement( f4_arg0.StoreItems, "price", function ()
		local f6_local0 = f4_arg0.StoreItems:GetDataSource()
		f6_local0 = f6_local0.price:GetValue( f4_arg1 )
		if f6_local0 ~= nil then
			f4_arg0.Cost:setText( f6_local0, 0 )
		end
	end )
	local self = LUI.UIBindButton.new()
	self.id = "bindButton"
	f4_arg0:addElement( self )
	self:addEventHandler( "button_secondary", function ( f7_arg0, f7_arg1 )
		if f4_arg2.fromMainMenu == true then
			Engine.StopGameMode()
		end
		ACTIONS.LeaveMenu( f4_arg0 )
	end )
	self:addEventHandler( "button_alt1", function ( f8_arg0, f8_arg1 )
		local f8_local0 = "XXX-XXX-XXX-XXX"
		if Engine.IsPC() then
			f8_local0 = ""
		end
		OSK.OpenScreenKeyboard( f8_arg1.controller, Engine.Localize( "PATCH_MENU_COD_REDEMPTION_CODE" ), f8_local0, 15, true, true, false, function ( f9_arg0, f9_arg1, f9_arg2 )
			Redeemables.RedeemCode( f9_arg0, f9_arg1 )
		end, CoD.KeyboardInputTypes.Normal )
	end )
	f4_arg0:addEventHandler( "menu_close", function ( f10_arg0, f10_arg1 )
		Engine.StoreClosed( f4_arg1 )
	end )
end

MenuBuilder.registerType( "StoreBasic", function ( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "StoreBasic"
	local f11_local1 = controller and controller.controllerIndex
	if not f11_local1 and not Engine.InFrontend() then
		f11_local1 = self:getRootController()
	end
	assert( f11_local1 )
	self:playSound( "menu_open" )
	local f11_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:setImage( RegisterMaterial( "sp_frontend_bink_background" ), 0 )
	self:addElement( Background )
	self.Background = Background
	
	local BackgroundFill = nil
	
	BackgroundFill = LUI.UIImage.new()
	BackgroundFill.id = "BackgroundFill"
	BackgroundFill:SetAlpha( 0.3, 0 )
	BackgroundFill:SetBlendMode( BLEND_MODE.addWithAlpha )
	self:addElement( BackgroundFill )
	self.BackgroundFill = BackgroundFill
	
	local BackgroundGradientBig = nil
	
	BackgroundGradientBig = LUI.UIImage.new()
	BackgroundGradientBig.id = "BackgroundGradientBig"
	BackgroundGradientBig:SetAlpha( 0.8, 0 )
	BackgroundGradientBig:setImage( RegisterMaterial( "wdg_ellipse_glow" ), 0 )
	BackgroundGradientBig:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -800, _1080p * 800, _1080p * -650, 0 )
	self:addElement( BackgroundGradientBig )
	self.BackgroundGradientBig = BackgroundGradientBig
	
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f11_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1920, _1080p * 995, _1080p * 1080 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local MenuTitle = nil
	
	MenuTitle = MenuBuilder.BuildRegisteredType( "MenuTitle", {
		controllerIndex = f11_local1
	} )
	MenuTitle.id = "MenuTitle"
	MenuTitle.MenuTitle:setText( ToUpperCase( Engine.Localize( "LUA_MENU_STORE_CAPS" ) ), 0 )
	MenuTitle.MenuBreadcrumbs:setText( ToUpperCase( "" ), 0 )
	MenuTitle.Icon:SetTop( _1080p * -28.5, 0 )
	MenuTitle.Icon:SetBottom( _1080p * 61.5, 0 )
	MenuTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
	self:addElement( MenuTitle )
	self.MenuTitle = MenuTitle
	
	local BlankBox1 = nil
	
	BlankBox1 = LUI.UIImage.new()
	BlankBox1.id = "BlankBox1"
	BlankBox1:SetRGBFromInt( 0, 0 )
	BlankBox1:SetAlpha( 0.2, 0 )
	BlankBox1:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -657, _1080p * -5, _1080p * 154, _1080p * 480 )
	self:addElement( BlankBox1 )
	self.BlankBox1 = BlankBox1
	
	local BlankBox2 = nil
	
	BlankBox2 = LUI.UIImage.new()
	BlankBox2.id = "BlankBox2"
	BlankBox2:SetRGBFromInt( 0, 0 )
	BlankBox2:SetAlpha( 0.2, 0 )
	BlankBox2:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 5, _1080p * 657, _1080p * 154, _1080p * 480 )
	self:addElement( BlankBox2 )
	self.BlankBox2 = BlankBox2
	
	local BlankBox3 = nil
	
	BlankBox3 = LUI.UIImage.new()
	BlankBox3.id = "BlankBox3"
	BlankBox3:SetRGBFromInt( 0, 0 )
	BlankBox3:SetAlpha( 0.2, 0 )
	BlankBox3:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -657, _1080p * -5, _1080p * 490, _1080p * 816 )
	self:addElement( BlankBox3 )
	self.BlankBox3 = BlankBox3
	
	local BlankBox4 = nil
	
	BlankBox4 = LUI.UIImage.new()
	BlankBox4.id = "BlankBox4"
	BlankBox4:SetRGBFromInt( 0, 0 )
	BlankBox4:SetAlpha( 0.2, 0 )
	BlankBox4:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 5, _1080p * 657, _1080p * 490, _1080p * 816 )
	self:addElement( BlankBox4 )
	self.BlankBox4 = BlankBox4
	
	local StoreItems = nil
	
	StoreItems = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 2,
		maxVisibleRows = 2,
		controllerIndex = f11_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "StoreBasicItemButton", {
				controllerIndex = f11_local1
			} )
		end,
		wrapX = true,
		wrapY = true,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		columnWidth = _1080p * 652,
		rowHeight = _1080p * 326,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	StoreItems.id = "StoreItems"
	StoreItems:setUseStencil( false )
	StoreItems:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -657, _1080p * 657, _1080p * 154, _1080p * 816 )
	self:addElement( StoreItems )
	self.StoreItems = StoreItems
	
	local Description = nil
	
	Description = LUI.UIStyledText.new()
	Description.id = "Description"
	Description:setText( Engine.Localize( "MENU_NEW" ), 0 )
	Description:SetFontSize( 28 * _1080p )
	Description:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Description:SetAlignment( LUI.Alignment.Left )
	Description:SetStartupDelay( 4000 )
	Description:SetLineHoldTime( 3000 )
	Description:SetAnimMoveTime( 250 )
	Description:SetEndDelay( 2000 )
	Description:SetCrossfadeTime( 400 )
	Description:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollV )
	Description:SetMaxVisibleLines( 4 )
	Description:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -637, _1080p * 429, _1080p * 852, _1080p * 880 )
	self:addElement( Description )
	self.Description = Description
	
	local LeftBar = nil
	
	LeftBar = LUI.UIImage.new()
	LeftBar.id = "LeftBar"
	LeftBar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 305, _1080p * 313, _1080p * 856, _1080p * 960 )
	self:addElement( LeftBar )
	self.LeftBar = LeftBar
	
	local LeftBarCost = nil
	
	LeftBarCost = LUI.UIImage.new()
	LeftBarCost.id = "LeftBarCost"
	LeftBarCost:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1425, _1080p * 1433, _1080p * 858, _1080p * 893 )
	self:addElement( LeftBarCost )
	self.LeftBarCost = LeftBarCost
	
	local Cost = nil
	
	Cost = LUI.UIText.new()
	Cost.id = "Cost"
	Cost:setText( Engine.Localize( "MENU_NEW" ), 0 )
	Cost:SetFontSize( 48 * _1080p )
	Cost:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Cost:SetAlignment( LUI.Alignment.Left )
	Cost:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 484, _1080p * 759, _1080p * 852, _1080p * 900 )
	self:addElement( Cost )
	self.Cost = Cost
	
	self.addButtonHelperFunction = function ( f13_arg0, f13_arg1 )
		f13_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			priority = 10,
			clickable = true
		} )
		f13_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_REDEEM_CODE" ),
			button_ref = "button_alt1",
			side = "left",
			clickable = true
		} )
		f13_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_SELECT" ),
			button_ref = "button_primary",
			side = "left",
			priority = -10,
			clickable = true
		} )
	end
	
	self:addEventHandler( "menu_create", self.addButtonHelperFunction )
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	f0_local3( self, f11_local1, controller )
	return self
end )
LockTable( _M )
