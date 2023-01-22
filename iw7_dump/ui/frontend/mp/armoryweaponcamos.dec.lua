local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "frontEnd.MP.armory.camos"
function PopFunc()
	WipeGlobalModelsAtPath( f0_local0 )
end

function GetCamoDecorator( f2_arg0, f2_arg1 )
	return function ( f3_arg0, f3_arg1, f3_arg2 )
		assert( f3_arg1.ref )
		assert( f3_arg1.name )
		assert( f3_arg1.image )
		local f3_local0 = ARMORY.lootCamo[tostring( f2_arg1 )][f3_arg1.ref:GetValue( f3_arg2 )]
		assert( f3_local0 )
		local f3_local1 = CSV.ReadRow( {
			file = CSV.cosmeticLootMaster.file,
			cols = CSV.cosmeticLootMaster.cols
		}, f3_local0 )
		local f3_local2 = f3_local1.index
		local f3_local3 = f0_local0 .. ".loot." .. f3_local2
		local f3_local4 = Engine.Localize( Cac.GetLootQualityString( f2_arg1 ) )
		local f3_local5 = Cac.GetLootQualityColor( f2_arg1 )
		local f3_local6 = tonumber( f3_local1.cost )
		local f3_local7 = f3_local1.salvageReturned
		local f3_local8 = LUI.DataSourceInGlobalModel.new( f3_local3 .. ".owned", Loot.IsOwned( f3_arg2, f3_local2 ) )
		local f3_local9 = f3_local8:Filter( "unlocked", function ( f4_arg0, f4_arg1 )
			return 0 < f4_arg0
		end )
		local f3_local10 = LUI.DataSourceInGlobalModel.new( f3_local3 .. ".itemID", f3_local2 )
		local f3_local11 = f0_local0 .. ".quality." .. f2_arg1
		return {
			isUnlocked = f3_local9,
			owned = f3_local8,
			ref = f3_arg1.ref,
			lootItemID = f3_local10,
			name = f3_arg1.name,
			image = f3_arg1.image,
			quality = LUI.DataSourceInGlobalModel.new( f3_local11, f2_arg1 ),
			qualityString = LUI.DataSourceInGlobalModel.new( f3_local11 .. ".string", f3_local4 ),
			qualityColor = LUI.DataSourceInGlobalModel.new( f3_local11 .. ".color", f3_local5 ),
			cost = LUI.DataSourceInGlobalModel.new( f3_local3 .. ".cost", f3_local6 ),
			salvageReceived = LUI.DataSourceInGlobalModel.new( f3_local3 .. ".salvageReceived", f3_local7 ),
			fullImage = f3_arg1.image
		}
	end
	
end

f0_local1 = function ( f5_arg0 )
	return function ( f6_arg0, f6_arg1, f6_arg2 )
		return {
			name = f6_arg1.name,
			camos = f6_arg1.items:Decorate( GetCamoDecorator( f5_arg0, f6_arg0 + 1 ) ),
			focusFunction = function ()
				
			end
			
		}
	end
	
end

function PostLoadFunc( f8_arg0, f8_arg1, f8_arg2 )
	assert( f8_arg2 )
	assert( f8_arg0.MenuTitle )
	assert( f8_arg0.MenuTitle.MenuTitle )
	assert( f8_arg0.ButtonHelperBar )
	local f8_local0 = {
		categoryRef = ARMORY.categoryRefs.CAMO,
		lootItem = ARMORY.lootCamo,
		itemRowList = ARMORY.camoRowList,
		itemTable = CSV.camoTable,
		lootTable = CSV.cosmeticLootMaster
	}
	f8_arg0.MenuTitle.MenuTitle:setText( Engine.Localize( "MENU_CAMO_CAPS" ), 0 )
	local f8_local1 = ARMORY.BuildLootItemByQualityDataSources( f0_local0, f8_local0 )
	local f8_local2 = f8_local1:Decorate( f0_local1( f8_arg0 ) )
	f8_local2:SetCachingEnabled( true )
	f8_arg0:addEventHandler( "menu_create", function ( f9_arg0, f9_arg1 )
		f9_arg0:AddButtonHelperTextToElement( f9_arg0.ButtonHelperBar, {
			helper_text = Engine.Localize( "LUA_MENU_SELECT" ),
			button_ref = "button_primary",
			side = "right",
			priority = 20,
			clickable = true
		} )
	end )
	f8_arg0:addEventHandler( "loot_item_transaction_complete", function ( f10_arg0, f10_arg1 )
		LUI.FlowManager.RequestLeaveMenuByName( "live_dialog_text_box" )
		assert( f10_arg1.lootItemID )
		local f10_local0 = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".loot." .. f10_arg1.lootItemID .. ".owned" )
		f10_local0:SetValue( f8_arg1, Loot.IsOwned( f8_arg1, f10_arg1.lootItemID ) )
		return true
	end )
	f8_arg0:addEventHandler( "loot_item_transaction_error", function ( f11_arg0, f11_arg1 )
		LUI.FlowManager.RequestLeaveMenuByName( "live_dialog_text_box" )
		LUI.FlowManager.RequestPopupMenu( f8_arg0, "LootItemError", true, f8_arg1, false )
	end )
	f8_arg0:SetDataSource( f8_local2, f8_arg1 )
end

function ArmoryWeaponCamos( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "ArmoryWeaponCamos"
	local f12_local1 = controller and controller.controllerIndex
	if not f12_local1 and not Engine.InFrontend() then
		f12_local1 = self:getRootController()
	end
	assert( f12_local1 )
	self:playSound( "menu_open" )
	local f12_local2 = self
	local Tabs = nil
	
	Tabs = MenuBuilder.BuildRegisteredType( "SubMenuTabsBar", {
		controllerIndex = f12_local1
	} )
	Tabs.id = "Tabs"
	Tabs.Tabs:SetTabManagerDataSourceThroughElement( self, nil )
	Tabs:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 170, _1080p * 200 )
	self:addElement( Tabs )
	self.Tabs = Tabs
	
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f12_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local MenuTitle = nil
	
	MenuTitle = MenuBuilder.BuildRegisteredType( "MenuTitle", {
		controllerIndex = f12_local1
	} )
	MenuTitle.id = "MenuTitle"
	MenuTitle.MenuTitle:setText( Engine.Localize( "MENU_NEW" ), 0 )
	MenuTitle.MenuBreadcrumbs:setText( ToUpperCase( Engine.Localize( "MENU_NEW" ) ), 0 )
	MenuTitle.Icon:SetTop( _1080p * -28.5, 0 )
	MenuTitle.Icon:SetBottom( _1080p * 61.5, 0 )
	MenuTitle:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 96, _1080p * -96, _1080p * 25, _1080p * 105 )
	self:addElement( MenuTitle )
	self.MenuTitle = MenuTitle
	
	local QualityItems = nil
	
	QualityItems = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 6,
		maxVisibleRows = 4,
		controllerIndex = f12_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "ArmoryItem", {
				controllerIndex = f12_local1
			} )
		end,
		wrapX = true,
		wrapY = true,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		columnWidth = _1080p * 160,
		rowHeight = _1080p * 175,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	QualityItems.id = "QualityItems"
	QualityItems:setUseStencil( false )
	QualityItems:SetGridDataSourceThroughElement( Tabs.Tabs, "camos" )
	QualityItems:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 175, _1080p * 1185, _1080p * 207, _1080p * 937 )
	self:addElement( QualityItems )
	self.QualityItems = QualityItems
	
	local ArmoryCosmeticItemDetails = nil
	
	ArmoryCosmeticItemDetails = MenuBuilder.BuildRegisteredType( "ArmoryCosmeticItemDetails", {
		controllerIndex = f12_local1
	} )
	ArmoryCosmeticItemDetails.id = "ArmoryCosmeticItemDetails"
	ArmoryCosmeticItemDetails:SetDataSourceThroughElement( QualityItems, nil )
	ArmoryCosmeticItemDetails:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1265, _1080p * 1785, _1080p * 207, _1080p * 797 )
	self:addElement( ArmoryCosmeticItemDetails )
	self.ArmoryCosmeticItemDetails = ArmoryCosmeticItemDetails
	
	local MissionTeamInfo = nil
	
	MissionTeamInfo = MenuBuilder.BuildRegisteredType( "MissionTeamInfo", {
		controllerIndex = f12_local1
	} )
	MissionTeamInfo.id = "MissionTeamInfo"
	MissionTeamInfo:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -700, 0, _1080p * 54, _1080p * 141 )
	self:addElement( MissionTeamInfo )
	self.MissionTeamInfo = MissionTeamInfo
	
	ArmoryCosmeticItemDetails:SetDataSourceThroughElement( QualityItems, nil )
	self.addButtonHelperFunction = function ( f14_arg0, f14_arg1 )
		f14_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			priority = 10,
			clickable = true
		} )
		f14_arg0:AddButtonHelperText( {
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
	
	self.bindButton:addEventHandler( "button_secondary", function ( f15_arg0, f15_arg1 )
		local f15_local0 = f15_arg1.controller or f12_local1
		ACTIONS.LeaveMenu( self )
	end )
	PostLoadFunc( self, f12_local1, controller )
	return self
end

MenuBuilder.registerType( "ArmoryWeaponCamos", ArmoryWeaponCamos )
LUI.FlowManager.RegisterStackPopBehaviour( "ArmoryWeaponCamos", PopFunc )
LockTable( _M )
