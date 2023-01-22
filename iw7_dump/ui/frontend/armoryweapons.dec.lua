local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "frontEnd.MP.armory.weapons"
function PopFunc()
	WipeGlobalModelsAtPath( f0_local0 )
end

f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2 )
	assert( f2_arg0.Weapons )
	assert( f2_arg0.BaseWeapons )
	local f2_local0 = Cac.GetWeaponRowList()
	assert( f2_local0 )
	local f2_local1 = f2_local0[f2_arg1]
	local f2_local2 = {}
	local f2_local3 = Engine.GetDvarInt( "online_sub_license" )
	for f2_local17, f2_local18 in pairs( f2_local1 ) do
		local f2_local19 = LOADOUT.GetWeaponLootVariantData( f2_local17 )
		if f2_local19 then
			for f2_local11, f2_local12 in pairs( f2_local19.rows ) do
				local f2_local13 = CSV.ReadRow( {
					file = f2_local19.file,
					cols = CSV.weaponLoot.cols
				}, f2_local12 )
				local f2_local14 = Engine.TableLookup( CSV.weaponLootMaster.file, CSV.weaponLootMaster.cols.ref, f2_local13.ref, CSV.weaponLootMaster.cols.missionTeam )
				local f2_local15 = Engine.TableLookup( CSV.weaponLootMaster.file, CSV.weaponLootMaster.cols.ref, f2_local13.ref, CSV.weaponLootMaster.cols.sublicense )
				local f2_local16 = Engine.TableLookup( CSV.weaponLootMaster.file, CSV.weaponLootMaster.cols.ref, f2_local13.ref, CSV.weaponLootMaster.cols.index )
				local f2_local10 = false
				if f2_arg0._isMk2 then
					if f2_local14 ~= MissionDirector.teamNoneValue and f2_local14 ~= MissionDirector.teamRnGValue then
						f2_local10 = false
					else
						f2_local10 = true
					end
					if f2_local10 then
						f2_local10 = Cac.IsWeaponRefMk2( f2_local13.ref )
					end
				else
					if f2_local14 ~= MissionDirector.teamNoneValue then
						if f2_local14 == MissionDirector.teamRnGValue then
							f2_local10 = not ARMORY.IsWeaponRnG( f2_local16, f2_local14 )
						else
							f2_local10 = false
						end
					else
						f2_local10 = true
					end
					if f2_local10 then
						f2_local10 = not Cac.IsWeaponRefMk2( f2_local13.ref )
					end
				end
				if f2_local3 < tonumber( f2_local15 ) then
					f2_local10 = false
				end
				if f2_local10 then
					table.insert( f2_local2, f2_local18 )
				end
			end
		end
	end
	table.sort( f2_local2, function ( f3_arg0, f3_arg1 )
		return tonumber( f3_arg0.displayOrder ) < tonumber( f3_arg1.displayOrder )
	end )
	f2_arg0.prototypeClassWeapons = f2_local2
	f2_arg0.currentWeaponClass = f2_arg1
	f2_arg0.BaseWeapons:SetNumColumns( 1 )
	f2_arg0.BaseWeapons:SetNumRows( #f2_local2 )
	f2_arg0.BaseWeapons:RefreshContent()
	f2_arg0.Weapons:SetNumColumns( 1 )
	f2_arg0.Weapons:SetNumRows( #f2_local2 )
	f2_arg0.Weapons:RefreshContent()
	for f2_local17, f2_local18 in pairs( f2_local2 ) do
		local f2_local19 = f2_arg0.Weapons:GetElementAtPosition( 0, f2_local17 - 1 )
		if f2_local19 then
			f2_local19:SetupWeaponRowData( f2_local18.ref )
		else
			DebugPrint( "Missing weaponRow " .. f2_local17 )
		end
	end
	if #f2_local2 < f2_arg0.Weapons:GetMaxVisibleRows() then
		f2_arg0.Weapons:SetTargetRow( 0, true, true )
		f2_arg0.BaseWeapons:SetTargetRow( 0, true, true )
	end
	assert( f2_arg0.ArmoryWeaponCard )
	f2_local4 = f2_arg0.Weapons:GetFocusPositionIndex()
	if f2_local4 ~= nil then
		f2_local5 = f2_arg0.Weapons:GetElementAtPosition( 0, f2_local4 )
		f2_local6 = f2_local5.Items:GetFocusPositionIndex()
		if f2_local6 ~= nil then
			f2_local17 = f2_local5.Items:GetElementAtPosition( f2_local6, 0 )
			f2_arg0.ArmoryWeaponCard:SetWeapon( f2_local17.ArmoryWeaponButton.lootID, f2_arg2 )
		end
		if Engine.IsGamepadEnabled() == 1 then
			f2_arg0.Weapons:FocusFirstItem()
			f2_arg0.Weapons:RefreshContent()
			f2_local17 = f2_arg0.Weapons:GetElementAtPosition( 0, 0 )
			assert( f2_local17 )
			f2_local17.Items:FocusFirstItem()
		end
		for f2_local7, f2_local8 in ipairs( f2_arg0.Weapons:GetBuiltChildren() ) do
			assert( f2_local8.Items )
			f2_local8.Items:SetPosition( {
				x = 0,
				y = 0
			}, true )
		end
	end
end

f0_local2 = function ( f4_arg0, f4_arg1 )
	assert( f4_arg0.ArrowLeft )
	assert( f4_arg0.ArrowRight )
	local f4_local0
	if f4_arg1 then
		f4_local0 = 1
		if not f4_local0 then
		
		else
			f4_arg0.ArrowRight:SetAlpha( f4_local0 )
			f4_arg0.ArrowLeft:SetAlpha( f4_local0 )
		end
	end
	f4_local0 = 0
end

local f0_local3 = function ( f5_arg0 )
	assert( f5_arg0.Weapons )
	assert( f5_arg0.ArrowUp )
	assert( f5_arg0.ArrowDown )
	assert( f5_arg0.BaseWeaponsListCount )
	local f5_local0 = f5_arg0.Weapons:GetFocusPositionIndex()
	if f5_local0 ~= nil then
		local f5_local1 = f5_arg0.Weapons:GetElementAtPosition( 0, f5_local0 )
		if f5_local1.Items:GetMaxVisibleColumns() < f5_local1.Items:GetNumChildren() then
			f0_local2( f5_arg0, true )
		else
			f0_local2( f5_arg0, false )
		end
		if f5_arg0.Weapons:GetMaxVisibleRows() < f5_arg0.Weapons:GetNumChildren() then
			f5_arg0.ArrowUp:SetAlpha( 1 )
			f5_arg0.ArrowDown:SetAlpha( 1 )
			f5_arg0.BaseWeaponsListCount:SetAlpha( 1 )
		else
			f5_arg0.ArrowUp:SetAlpha( 0 )
			f5_arg0.ArrowDown:SetAlpha( 0 )
			f5_arg0.BaseWeaponsListCount:SetAlpha( 0 )
		end
	end
end

local f0_local4 = function ( f6_arg0, f6_arg1 )
	f6_arg0.Weapons:RefreshContent()
	local f6_local0 = f6_arg0.Weapons:GetFocusPositionIndex()
	local f6_local1 = f6_arg0.Weapons:GetElementAtPosition( 0, f6_local0 )
	assert( f6_local1 )
	assert( f6_local1.Items )
	f6_local1.Items:AddItemNumbers( f6_arg0.WeaponsListCount, "weaponListCount" )
	f6_local1.Items:AddArrow( f6_arg0.ArrowRight )
	f6_local1.Items:AddArrow( f6_arg0.ArrowLeft )
	f6_local1.Items:UpdateNumbersAndArrows()
	f6_arg0.BaseWeapons:SetPosition( {
		x = 0,
		y = f6_local0
	}, false, f6_arg1 )
	f0_local3( f6_arg0 )
	local f6_local2 = f6_arg0.Weapons:GetFocusPosition( LUI.DIRECTION.VERTICAL ) - (f6_arg0.Weapons:GetContentOffset( LUI.DIRECTION.vertical ) or 0)
	assert( f6_arg0.ArrowLeft )
	assert( f6_arg0.ArrowRight )
	local f6_local3 = 239 + f6_local2 * 112
	local f6_local4 = 293 + f6_local2 * 112
	f6_arg0.ArrowLeft:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 299, _1080p * 326, _1080p * f6_local3, _1080p * f6_local4 )
	f6_arg0.ArrowRight:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -577, _1080p * -550, _1080p * f6_local3, _1080p * f6_local4 )
end

function PostLoadFunc( f7_arg0, f7_arg1, f7_arg2 )
	assert( f7_arg0.Tabs )
	assert( f7_arg0.Tabs.Tabs )
	assert( f7_arg0.BaseWeaponsListCount )
	assert( f7_arg0.ArrowUp )
	assert( f7_arg0.ArrowDown )
	assert( f7_arg0.WeaponsListCount )
	assert( f7_arg0.ArrowRight )
	assert( f7_arg0.ArrowLeft )
	local f7_local0 = LUI.FlowManager.GetScopedData( f7_arg0 )
	f7_arg0._isMk2 = f7_arg2.isMk2
	if f7_arg0._isMk2 then
		f7_local0.context = ARMORY.inventoryContext.MK2
	else
		f7_local0.context = ARMORY.inventoryContext.PROTOTYPE
	end
	local Weapons = nil
	
	Weapons = LUI.UIGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 6,
		controllerIndex = f7_arg1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "ArmoryItems", {
				controllerIndex = f7_arg1,
				isMk2 = f7_arg2.isMk2,
				context = ARMORY.inventoryContext.PROTOTYPE
			} )
		end,
		refreshChild = function ( f9_arg0, f9_arg1, f9_arg2 )
			if f9_arg2 < #f7_arg0.prototypeClassWeapons then
				assert( f9_arg0.Items )
				if f9_arg0.currentRowIndex ~= f9_arg2 then
					f9_arg0.Items:SetPosition( {
						x = 0,
						y = 0
					}, true, false )
				end
				f9_arg0.currentRowIndex = f9_arg2
				f9_arg0.Items:SetShouldFocus( false )
				f9_arg0.currentWeapon = f7_arg0.prototypeClassWeapons[f9_arg2 + 1]
				f9_arg0:SetupWeaponRowData( f9_arg0.currentWeapon.ref )
			end
		end,
		numRows = 0,
		numColumns = 0,
		wrapX = true,
		wrapY = false,
		spacingX = _1080p * 12,
		spacingY = _1080p * 12,
		columnWidth = _1080p * 1016,
		rowHeight = _1080p * 100,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000,
		alwaysSnap = true,
		disableMouseWheel = true
	} )
	Weapons.id = "Weapons"
	Weapons:setUseStencil( true )
	Weapons:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 326, _1080p * 1342, _1080p * 216, _1080p * 876 )
	Weapons:AddItemNumbers( f7_arg0.BaseWeaponsListCount )
	Weapons:AddArrow( f7_arg0.ArrowUp )
	Weapons:AddArrow( f7_arg0.ArrowDown )
	Weapons:setPriority( -1 )
	f7_arg0.Blur:setPriority( -2 )
	f7_arg0:addElement( Weapons )
	f7_arg0.Weapons = Weapons
	
	if Engine.IsPC() then
		Weapons.FocusChanged = function ( f10_arg0, f10_arg1 )
			LUI.UIGrid.FocusChanged( f10_arg0 )
			f0_local4( f7_arg0, f10_arg1 ~= FocusType.MouseOver )
		end
		
		Weapons.Scroll = function ( f11_arg0, f11_arg1 )
			local f11_local0 = LUI.UIGrid.Scroll( f11_arg0, f11_arg1 )
			f7_arg0.BaseWeapons:SetPosition( {
				x = 0,
				y = f7_arg0.Weapons:GetFocusPositionIndex()
			}, false, false )
			return f11_local0
		end
		
	end
	f7_arg0:addEventHandler( "update_armory_focus", function ( f12_arg0, f12_arg1 )
		f0_local4( f7_arg0, true )
	end )
	local BaseWeapons = nil
	
	BaseWeapons = LUI.UIGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 6,
		controllerIndex = f7_arg1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "ArmoryBaseWeapon", {
				controllerIndex = f7_arg1
			} )
		end,
		refreshChild = function ( f14_arg0, f14_arg1, f14_arg2 )
			if f14_arg2 < #f7_arg0.prototypeClassWeapons then
				f14_arg0:SetupBaseWeapon( f7_arg0.prototypeClassWeapons[f14_arg2 + 1].row )
			end
		end,
		numRows = 0,
		numColumns = 0,
		wrapX = true,
		wrapY = true,
		spacingX = _1080p * 12,
		spacingY = _1080p * 12,
		columnWidth = _1080p * 200,
		rowHeight = _1080p * 100,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	BaseWeapons.id = "BaseWeapons"
	BaseWeapons:setUseStencil( true )
	BaseWeapons:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 280, _1080p * 216, _1080p * 876 )
	f7_arg0:addElement( BaseWeapons )
	f7_arg0.BaseWeapons = BaseWeapons
	
	local f7_local3 = LUI.ShallowCopy( Cac.GetWeaponClasses( Cac.PrimaryWeaponSlot ) )
	for f7_local7, f7_local8 in pairs( LUI.ShallowCopy( f7_local3 ) ) do
		if f7_local8.showInArmory ~= "1" then
			table.remove( f7_local3, f7_local7 )
		end
	end
	table.insert( f7_local3, LOADOUT.GetWeaponClassDataBySlotAndRef( Cac.SecondaryWeaponSlot, Cac.HandgunClassRef ) )
	if f7_arg0._isMk2 or true == Engine.GetDvarBool( "online_show_proto_melee" ) then
		table.insert( f7_local3, LOADOUT.GetWeaponClassDataBySlotAndRef( Cac.SecondaryWeaponSlot, Cac.MeleeClassRef ) )
	end
	f7_local5 = LUI.DataSourceFromList.new( #f7_local3 )
	f7_local5.MakeDataSourceAtIndex = function ( f15_arg0, f15_arg1, f15_arg2 )
		local f15_local0 = f7_local3[f15_arg1 + 1]
		return {
			name = LUI.DataSourceInGlobalModel.new( f0_local0 .. "." .. f15_local0.ref .. ".name", Engine.Localize( f15_local0.pluralName ) ),
			focusFunction = function ()
				f0_local1( f7_arg0, f15_local0.ref, f15_arg2 )
				f0_local3( f7_arg0 )
			end
			
		}
	end
	
	f7_arg0.Tabs.Tabs:SetTabManagerDataSource( f7_local5 )
	if Engine.IsCoreMode() then
		f7_arg0.MenuTitle.MenuBreadcrumbs:setText( ToUpperCase( Engine.Localize( "LUA_MENU_BREADCRUMB_2_ITEMS", "MENU_MULTIPLAYER", "LUA_MENU_PUBLIC_MATCH_CAPS" ), 0 ) )
		if f7_arg0._isMk2 then
			f7_arg0.MenuTitle.MenuTitle:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_MK2_COLLECTION" ) ), 0 )
			f7_arg0.MK2Label:SetAlpha( 1, 0 )
		else
			f7_arg0.MenuTitle.MenuTitle:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_PROTOTYPE_LAB" ) ), 0 )
			f7_arg0.MK2Label:SetAlpha( 0, 0 )
		end
	elseif Engine.IsAliensMode() then
		if f7_arg0._isMk2 then
			f7_arg0.CPMenuTitle.MenuTitle:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_MK2_COLLECTION" ) ), 0 )
		else
			f7_arg0.CPMenuTitle.MenuTitle:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_PROTOTYPE_LAB" ) ), 0 )
		end
	end
	f7_arg0:addEventHandler( "loot_item_transaction_complete", function ( f17_arg0, f17_arg1 )
		LUI.FlowManager.RequestLeaveMenuByName( "live_dialog_text_box" )
		assert( f17_arg1.lootItemID )
		f7_arg0.ArmoryWeaponCard:SetWeapon( f17_arg1.lootItemID, f17_arg1.controller or f7_arg1 )
		f0_local1( f7_arg0, f7_arg0.currentWeaponClass, f17_arg1.controller or f7_arg1 )
		LUI.FlowManager.RequestPopupMenu( f7_arg0, "ArmoryWeaponCrafted", true, f7_arg1, false, {
			lootItemID = f17_arg1.lootItemID
		} )
		return true
	end )
	f7_arg0:addEventHandler( "loot_item_transaction_error", function ( f18_arg0, f18_arg1 )
		LUI.FlowManager.RequestLeaveMenuByName( "live_dialog_text_box" )
		LUI.FlowManager.RequestPopupMenu( f7_arg0, "LootItemError", true, f7_arg1, false )
		return true
	end )
	f7_arg0.ArmoryWeaponCard:SetUseSuffixAsTitle( true )
	if f7_arg0._isMk2 and Engine.IsCoreMode() and CONDITIONS.IsMk2TutorialAllowed() then
		f7_arg0:addEventHandler( "menu_create", function ( f19_arg0, f19_arg1 )
			f19_arg0:AddButtonHelperText( {
				helper_text = Engine.Localize( "LUA_MENU_HELP_CAPS" ),
				button_ref = "button_alt1",
				side = "left",
				clickable = true
			} )
		end )
		f7_arg0.bindButton:addEventHandler( "button_alt1", function ( f20_arg0, f20_arg1 )
			ACTIONS.OpenPopupMenu( f7_arg0, "Mk2TutorialPopup", true, f7_arg1 )
		end )
	end
end

function ArmoryWeapons( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "ArmoryWeapons"
	self._animationSets = {}
	self._sequences = {}
	local f21_local1 = controller and controller.controllerIndex
	if not f21_local1 and not Engine.InFrontend() then
		f21_local1 = self:getRootController()
	end
	assert( f21_local1 )
	self:playSound( "menu_open" )
	local f21_local2 = self
	local Blur = nil
	
	Blur = LUI.UIBlur.new()
	Blur.id = "Blur"
	Blur:SetBlurStrength( 2, 0 )
	self:addElement( Blur )
	self.Blur = Blur
	
	local Tabs = nil
	
	Tabs = MenuBuilder.BuildRegisteredType( "SubMenuTabsBar", {
		controllerIndex = f21_local1
	} )
	Tabs.id = "Tabs"
	Tabs:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 145, _1080p * 185 )
	self:addElement( Tabs )
	self.Tabs = Tabs
	
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f21_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local SocialFeed = nil
	
	SocialFeed = MenuBuilder.BuildRegisteredType( "SocialFeed", {
		controllerIndex = f21_local1
	} )
	SocialFeed.id = "SocialFeed"
	SocialFeed:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -115, _1080p * -85 )
	self:addElement( SocialFeed )
	self.SocialFeed = SocialFeed
	
	local f21_local7 = nil
	if CONDITIONS.IsCoreMultiplayer( self ) then
		f21_local7 = MenuBuilder.BuildRegisteredType( "MenuTitle", {
			controllerIndex = f21_local1
		} )
		f21_local7.id = "MenuTitle"
		f21_local7.MenuTitle:setText( ToUpperCase( Engine.Localize( "MENU_NEW" ) ), 0 )
		f21_local7.MenuBreadcrumbs:setText( ToUpperCase( "" ), 0 )
		f21_local7.Icon:SetTop( _1080p * -28.5, 0 )
		f21_local7.Icon:SetBottom( _1080p * 61.5, 0 )
		f21_local7:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96.5, _1080p * 1056, _1080p * 54, _1080p * 134 )
		self:addElement( f21_local7 )
		self.MenuTitle = f21_local7
	end
	local f21_local8 = nil
	if CONDITIONS.IsThirdGameMode( self ) then
		f21_local8 = MenuBuilder.BuildRegisteredType( "CPMenuTitle", {
			controllerIndex = f21_local1
		} )
		f21_local8.id = "CPMenuTitle"
		f21_local8.MenuTitle:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_PROTOTYPE_LAB" ) ), 0 )
		f21_local8:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
		self:addElement( f21_local8 )
		self.CPMenuTitle = f21_local8
	end
	local ArrowUp = nil
	
	ArrowUp = MenuBuilder.BuildRegisteredType( "ArrowUp", {
		controllerIndex = f21_local1
	} )
	ArrowUp.id = "ArrowUp"
	ArrowUp:SetAlpha( 0, 0 )
	ArrowUp:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 254, _1080p * 274, _1080p * 876, _1080p * 916 )
	self:addElement( ArrowUp )
	self.ArrowUp = ArrowUp
	
	local ArrowDown = nil
	
	ArrowDown = MenuBuilder.BuildRegisteredType( "ArrowDown", {
		controllerIndex = f21_local1
	} )
	ArrowDown.id = "ArrowDown"
	ArrowDown:SetAlpha( 0, 0 )
	ArrowDown:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 134, _1080p * 154, _1080p * 876, _1080p * 916 )
	self:addElement( ArrowDown )
	self.ArrowDown = ArrowDown
	
	local BaseWeaponsListCount = nil
	
	BaseWeaponsListCount = LUI.UIText.new()
	BaseWeaponsListCount.id = "BaseWeaponsListCount"
	BaseWeaponsListCount:SetAlpha( 0, 0 )
	BaseWeaponsListCount:setText( "#/#", 0 )
	BaseWeaponsListCount:SetFontSize( 24 * _1080p )
	BaseWeaponsListCount:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	BaseWeaponsListCount:SetAlignment( LUI.Alignment.Center )
	BaseWeaponsListCount:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 154, _1080p * 254, _1080p * 884, _1080p * 908 )
	self:addElement( BaseWeaponsListCount )
	self.BaseWeaponsListCount = BaseWeaponsListCount
	
	local WeaponsListCount = nil
	
	WeaponsListCount = LUI.UIText.new()
	WeaponsListCount.id = "WeaponsListCount"
	WeaponsListCount:SetAlpha( 0, 0 )
	WeaponsListCount:setText( "", 0 )
	WeaponsListCount:SetFontSize( 24 * _1080p )
	WeaponsListCount:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	WeaponsListCount:SetAlignment( LUI.Alignment.Center )
	WeaponsListCount:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 888, _1080p * 1033, _1080p * 914, _1080p * 938 )
	self:addElement( WeaponsListCount )
	self.WeaponsListCount = WeaponsListCount
	
	local ArrowRight = nil
	
	ArrowRight = MenuBuilder.BuildRegisteredType( "ArrowRight", {
		controllerIndex = f21_local1
	} )
	ArrowRight.id = "ArrowRight"
	ArrowRight:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -603, _1080p * -576, _1080p * 251, _1080p * 305 )
	self:addElement( ArrowRight )
	self.ArrowRight = ArrowRight
	
	local ArrowLeft = nil
	
	ArrowLeft = MenuBuilder.BuildRegisteredType( "ArrowLeft", {
		controllerIndex = f21_local1
	} )
	ArrowLeft.id = "ArrowLeft"
	ArrowLeft:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 273, _1080p * 300, _1080p * 251, _1080p * 305 )
	self:addElement( ArrowLeft )
	self.ArrowLeft = ArrowLeft
	
	local ArmoryWeaponCard = nil
	
	ArmoryWeaponCard = MenuBuilder.BuildRegisteredType( "ArmoryItemCard", {
		controllerIndex = f21_local1
	} )
	ArmoryWeaponCard.id = "ArmoryWeaponCard"
	ArmoryWeaponCard:SetDotPitchEnabled( true )
	ArmoryWeaponCard:SetDotPitchX( 0, 0 )
	ArmoryWeaponCard:SetDotPitchY( 0, 0 )
	ArmoryWeaponCard:SetDotPitchContrast( 0, 0 )
	ArmoryWeaponCard:SetDotPitchMode( 0 )
	ArmoryWeaponCard:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1390, _1080p * 1790, _1080p * 216, _1080p * 876 )
	self:addElement( ArmoryWeaponCard )
	self.ArmoryWeaponCard = ArmoryWeaponCard
	
	local MissionTeamInfo = nil
	
	MissionTeamInfo = MenuBuilder.BuildRegisteredType( "MissionTeamInfo", {
		controllerIndex = f21_local1
	} )
	MissionTeamInfo.id = "MissionTeamInfo"
	MissionTeamInfo:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -700, 0, _1080p * 54, _1080p * 141 )
	self:addElement( MissionTeamInfo )
	self.MissionTeamInfo = MissionTeamInfo
	
	local CRMMain = nil
	
	CRMMain = MenuBuilder.BuildRegisteredType( "CRMMain", {
		controllerIndex = f21_local1
	} )
	CRMMain.id = "CRMMain"
	CRMMain:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 136, _1080p * 447, _1080p * 745, _1080p * 1069 )
	self:addElement( CRMMain )
	self.CRMMain = CRMMain
	
	local MK2Label = nil
	
	MK2Label = LUI.UIImage.new()
	MK2Label.id = "MK2Label"
	MK2Label:SetAlpha( 0, 0 )
	MK2Label:setImage( RegisterMaterial( "icon_inventory_mk2" ), 0 )
	MK2Label:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -100, _1080p * 100, _1080p * 27, _1080p * 127 )
	self:addElement( MK2Label )
	self.MK2Label = MK2Label
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		self._sequences.IncompleteMenuAnim = function ()
			
		end
		
		ArmoryWeaponCard:RegisterAnimationSequence( "UpdateCard", {
			{
				function ()
					return self.ArmoryWeaponCard:SetAlpha( 0, 0 )
				end,
				function ()
					return self.ArmoryWeaponCard:SetAlpha( 1, 200, LUI.EASING.inSine )
				end
			},
			{
				function ()
					return self.ArmoryWeaponCard:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1424, _1080p * 1824, _1080p * 216, _1080p * 876, 0 )
				end,
				function ()
					return self.ArmoryWeaponCard:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1390, _1080p * 1790, _1080p * 216, _1080p * 876, 200, LUI.EASING.inSine )
				end
			}
		} )
		self._sequences.UpdateCard = function ()
			ArmoryWeaponCard:AnimateSequence( "UpdateCard" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self.addButtonHelperFunction = function ( f30_arg0, f30_arg1 )
		f30_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			priority = 10,
			clickable = true
		} )
	end
	
	self:addEventHandler( "menu_create", self.addButtonHelperFunction )
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	self.bindButton:addEventHandler( "button_secondary", function ( f31_arg0, f31_arg1 )
		local f31_local0 = f31_arg1.controller or f21_local1
		ACTIONS.LeaveMenu( self )
	end )
	PostLoadFunc( self, f21_local1, controller )
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "CRMMain",
		sequenceName = "Minimize",
		elementPath = "CRMMain"
	} )
	return self
end

MenuBuilder.registerType( "ArmoryWeapons", ArmoryWeapons )
LUI.FlowManager.RegisterStackPopBehaviour( "ArmoryWeapons", PopFunc )
LockTable( _M )
