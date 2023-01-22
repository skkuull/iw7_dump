local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "frontEnd.MP.armory.RNG"
function PopFunc()
	WipeGlobalModelsAtPath( f0_local0 )
end

f0_local1 = function ( f2_arg0 )
	assert( f2_arg0.Weapons )
	assert( f2_arg0.Qualities )
	assert( f2_arg0.lootWeaponsTable )
	f2_arg0.Qualities:SetNumColumns( #f2_arg0.lootWeaponsTable )
	f2_arg0.Qualities:SetNumRows( 1 )
	f2_arg0.Qualities:RefreshContent()
	f2_arg0.Weapons:SetNumColumns( #f2_arg0.lootWeaponsTable )
	f2_arg0.Weapons:SetNumRows( 1 )
	f2_arg0.Weapons:RefreshContent()
	for f2_local3, f2_local4 in pairs( f2_arg0.lootWeaponsTable ) do
		local f2_local5 = f2_arg0.Weapons:GetElementAtPosition( f2_local3 - 1, 0 )
		if f2_local5 then
			f2_local5:SetupQualityWeaponData( f2_local4 )
		else
			DebugPrint( "Missing weaponColumn " .. f2_local3 - 1 )
		end
	end
end

function PostLoadFunc( f3_arg0, f3_arg1, f3_arg2 )
	assert( f3_arg0.WeaponsListCount )
	local f3_local0 = LUI.FlowManager.GetScopedData( f3_arg0 )
	f3_local0.context = ARMORY.inventoryContext.QUARTERMASTER
	local f3_local1 = Engine.GetDvarInt( "online_sub_license" )
	local f3_local2 = {}
	for Weapons = 0, Engine.TableGetRowCount( CSV.weaponLootMaster.file ) - 1, 1 do
		local f3_local6 = Engine.TableLookupByRow( CSV.weaponLootMaster.file, Weapons, CSV.weaponLootMaster.cols.missionTeam )
		local f3_local7 = Engine.TableLookupByRow( CSV.weaponLootMaster.file, Weapons, CSV.weaponLootMaster.cols.index )
		if ARMORY.IsWeaponRnG( f3_local7, f3_local6 ) and not Cac.IsLootIDMk2( tonumber( f3_local7 ) ) and tonumber( Engine.TableLookupByRow( CSV.weaponLootMaster.file, Weapons, CSV.weaponLootMaster.cols.sublicense ) ) <= f3_local1 then
			local f3_local8 = tonumber( Engine.TableLookupByRow( CSV.weaponLootMaster.file, Weapons, CSV.weaponLootMaster.cols.quality ) )
			if not f3_local2[f3_local8] then
				f3_local2[f3_local8] = {
					color = Cac.GetLootQualityColorSwatch( f3_local8 ),
					name = Cac.GetLootQualityString( f3_local8 ),
					image = Cac.GetLootQualityImage( f3_local8 ),
					weapons = {}
				}
			end
			table.insert( f3_local2[f3_local8].weapons, {
				index = Engine.TableLookupByRow( CSV.weaponLootMaster.file, Weapons, CSV.weaponLootMaster.cols.index ),
				displayOrder = tonumber( Engine.TableLookupByRow( CSV.weaponLootMaster.file, Weapons, CSV.weaponLootMaster.cols.RnGDisplayLevel ) )
			} )
		end
	end
	for f3_local9, f3_local6 in pairs( f3_local2 ) do
		table.sort( f3_local6.weapons, function ( f4_arg0, f4_arg1 )
			if f4_arg0.displayOrder == 0 and f4_arg1.displayOrder ~= 0 then
				return false
			elseif f4_arg1.displayOrder == 0 and f4_arg0.displayOrder ~= 0 then
				return true
			elseif f4_arg0.displayOrder == f4_arg1.displayOrder then
				return tonumber( f4_arg0.index ) < tonumber( f4_arg1.index )
			else
				return f4_arg0.displayOrder < f4_arg1.displayOrder
			end
		end )
	end
	f3_arg0.lootWeaponsTable = f3_local2
	Weapons = nil
	
	Weapons = LUI.UIGrid.new( nil, {
		maxVisibleColumns = 5,
		maxVisibleRows = 1,
		controllerIndex = f3_arg1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "ArmoryWeaponItemsColumn", {
				controllerIndex = f3_arg1
			} )
		end,
		refreshChild = function ( f6_arg0, f6_arg1, f6_arg2 )
			
		end,
		numRows = 0,
		numColumns = 0,
		wrapX = true,
		wrapY = true,
		spacingX = _1080p * 6,
		spacingY = _1080p * 6,
		columnWidth = _1080p * 298.5,
		rowHeight = _1080p * 614,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	Weapons.id = "Weapons"
	Weapons:setUseStencil( true )
	Weapons:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 1342, _1080p * 262, _1080p * 876 )
	Weapons:setPriority( -1 )
	f3_arg0.Blur:setPriority( -2 )
	f3_arg0:addElement( Weapons )
	f3_arg0.Weapons = Weapons
	
	f3_arg0.Weapons.FocusChanged = function ( f7_arg0 )
		LUI.UIGrid.FocusChanged( f7_arg0 )
		local f7_local0 = f7_arg0:GetFocusPositionIndex()
		local f7_local1 = f3_arg0.Weapons:GetElementAtPosition( f7_local0, 0 )
		assert( f7_local1.Items )
		f7_local1.Items:AddItemNumbers( f3_arg0.WeaponsListCount, "weaponListCount" )
		f7_local1.Items:AddArrow( f3_arg0.ArrowUp )
		f7_local1.Items:AddArrow( f3_arg0.ArrowDown )
		f7_local1.Items:UpdateNumbersAndArrows()
		assert( f3_arg0.ArrowUp )
		assert( f3_arg0.ArrowDown )
		assert( f3_arg0.ListAnchor )
		local f7_local2 = 186.75 + f7_local0 * 304.5
		local f7_local3 = 206.75 + f7_local0 * 304.5
		local f7_local4 = 351.75 + f7_local0 * 304.5
		local f7_local5 = 371.75 + f7_local0 * 304.5
		local f7_local6 = 206.75 + f7_local0 * 304.5
		local f7_local7 = 351.75 + f7_local0 * 304.5
		f3_arg0.ArrowUp:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * f7_local2, _1080p * f7_local3, _1080p * 876, _1080p * 916 )
		f3_arg0.ArrowDown:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * f7_local4, _1080p * f7_local5, _1080p * 876, _1080p * 916 )
		f3_arg0.WeaponsListCount:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * f7_local6, _1080p * f7_local7, _1080p * 885, _1080p * 909 )
		f3_arg0.ListAnchor:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * (f7_local6 - 76.75), _1080p * (f7_local7 + 76.75), _1080p * 885, _1080p * 909 )
	end
	
	Qualities = nil
	
	Qualities = LUI.UIGrid.new( nil, {
		maxVisibleColumns = 5,
		maxVisibleRows = 1,
		controllerIndex = f3_arg1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "ArmoryQuality", {
				controllerIndex = f3_arg1
			} )
		end,
		refreshChild = function ( f9_arg0, f9_arg1, f9_arg2 )
			assert( f3_local2[f9_arg1 + 1] )
			f9_arg0:SetupQuality( f3_arg1, f3_local2[f9_arg1 + 1] )
		end,
		numRows = 0,
		numColumns = 0,
		wrapX = true,
		wrapY = true,
		spacingX = _1080p * 6,
		spacingY = _1080p * 6,
		columnWidth = _1080p * 298.5,
		rowHeight = _1080p * 100,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	Qualities.id = "Qualities"
	Qualities:setUseStencil( false )
	Qualities:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 1342, _1080p * 216, _1080p * 266 )
	f3_arg0:addElement( Qualities )
	f3_arg0.Qualities = Qualities
	
	f0_local1( f3_arg0 )
	if Engine.IsCoreMode() then
		f3_arg0.MenuTitle.MenuTitle:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_QUATERMASTER_COLLECTION" ) ), 0 )
		f3_arg0.MenuTitle.MenuBreadcrumbs:setText( ToUpperCase( Engine.Localize( "LUA_MENU_BREADCRUMB_2_ITEMS", "MENU_MULTIPLAYER", "LUA_MENU_PUBLIC_MATCH_CAPS" ), 0 ) )
	end
end

function ArmoryRNG( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "ArmoryRNG"
	self._animationSets = {}
	self._sequences = {}
	local f10_local1 = controller and controller.controllerIndex
	if not f10_local1 and not Engine.InFrontend() then
		f10_local1 = self:getRootController()
	end
	assert( f10_local1 )
	self:playSound( "menu_open" )
	local f10_local2 = self
	local Blur = nil
	
	Blur = LUI.UIBlur.new()
	Blur.id = "Blur"
	Blur:SetBlurStrength( 2, 0 )
	self:addElement( Blur )
	self.Blur = Blur
	
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f10_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local SocialFeed = nil
	
	SocialFeed = MenuBuilder.BuildRegisteredType( "SocialFeed", {
		controllerIndex = f10_local1
	} )
	SocialFeed.id = "SocialFeed"
	SocialFeed:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -115, _1080p * -85 )
	self:addElement( SocialFeed )
	self.SocialFeed = SocialFeed
	
	local f10_local6 = nil
	if CONDITIONS.IsCoreMultiplayer( self ) then
		f10_local6 = MenuBuilder.BuildRegisteredType( "MenuTitle", {
			controllerIndex = f10_local1
		} )
		f10_local6.id = "MenuTitle"
		f10_local6.MenuTitle:setText( ToUpperCase( Engine.Localize( "MENU_NEW" ) ), 0 )
		f10_local6.MenuBreadcrumbs:setText( ToUpperCase( "" ), 0 )
		f10_local6.Icon:SetTop( _1080p * -28.5, 0 )
		f10_local6.Icon:SetBottom( _1080p * 61.5, 0 )
		f10_local6:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96.5, _1080p * 1056, _1080p * 54, _1080p * 134 )
		self:addElement( f10_local6 )
		self.MenuTitle = f10_local6
	end
	local f10_local7 = nil
	if CONDITIONS.IsThirdGameMode( self ) then
		f10_local7 = MenuBuilder.BuildRegisteredType( "CPMenuTitle", {
			controllerIndex = f10_local1
		} )
		f10_local7.id = "CPMenuTitle"
		f10_local7.MenuTitle:setText( ToUpperCase( Engine.Localize( "LUA_MENU_ZM_SURVIVALIST_COLLECTION" ) ), 0 )
		f10_local7:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
		self:addElement( f10_local7 )
		self.CPMenuTitle = f10_local7
	end
	local ListAnchor = nil
	
	ListAnchor = LUI.UIImage.new()
	ListAnchor.id = "ListAnchor"
	ListAnchor:SetRGBFromInt( 6710886, 0 )
	ListAnchor:SetAlpha( 0.6, 0 )
	ListAnchor:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 655, _1080p * 953.5, _1080p * 914, _1080p * 938 )
	self:addElement( ListAnchor )
	self.ListAnchor = ListAnchor
	
	local ArrowUp = nil
	
	ArrowUp = MenuBuilder.BuildRegisteredType( "ArrowUp", {
		controllerIndex = f10_local1
	} )
	ArrowUp.id = "ArrowUp"
	ArrowUp:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 876.75, _1080p * 896.75, _1080p * 907, _1080p * 947 )
	self:addElement( ArrowUp )
	self.ArrowUp = ArrowUp
	
	local ArrowDown = nil
	
	ArrowDown = MenuBuilder.BuildRegisteredType( "ArrowDown", {
		controllerIndex = f10_local1
	} )
	ArrowDown.id = "ArrowDown"
	ArrowDown:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 711.75, _1080p * 731.75, _1080p * 906, _1080p * 946 )
	self:addElement( ArrowDown )
	self.ArrowDown = ArrowDown
	
	local WeaponsListCount = nil
	
	WeaponsListCount = LUI.UIText.new()
	WeaponsListCount.id = "WeaponsListCount"
	WeaponsListCount:setText( "", 0 )
	WeaponsListCount:SetFontSize( 24 * _1080p )
	WeaponsListCount:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	WeaponsListCount:SetAlignment( LUI.Alignment.Center )
	WeaponsListCount:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 731.75, _1080p * 876.75, _1080p * 914, _1080p * 938 )
	self:addElement( WeaponsListCount )
	self.WeaponsListCount = WeaponsListCount
	
	local ArmoryWeaponCard = nil
	
	ArmoryWeaponCard = MenuBuilder.BuildRegisteredType( "ArmoryItemCard", {
		controllerIndex = f10_local1
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
		controllerIndex = f10_local1
	} )
	MissionTeamInfo.id = "MissionTeamInfo"
	MissionTeamInfo:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -700, 0, _1080p * 54, _1080p * 141 )
	self:addElement( MissionTeamInfo )
	self.MissionTeamInfo = MissionTeamInfo
	
	local CRMMain = nil
	
	CRMMain = MenuBuilder.BuildRegisteredType( "CRMMain", {
		controllerIndex = f10_local1
	} )
	CRMMain.id = "CRMMain"
	CRMMain:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 136, _1080p * 447, _1080p * 745, _1080p * 1069 )
	self:addElement( CRMMain )
	self.CRMMain = CRMMain
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
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
	self.addButtonHelperFunction = function ( f18_arg0, f18_arg1 )
		f18_arg0:AddButtonHelperText( {
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
	
	self.bindButton:addEventHandler( "button_secondary", function ( f19_arg0, f19_arg1 )
		local f19_local0 = f19_arg1.controller or f10_local1
		ACTIONS.LeaveMenu( self )
	end )
	PostLoadFunc( self, f10_local1, controller )
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "CRMMain",
		sequenceName = "Minimize",
		elementPath = "CRMMain"
	} )
	return self
end

MenuBuilder.registerType( "ArmoryRNG", ArmoryRNG )
LUI.FlowManager.RegisterStackPopBehaviour( "ArmoryRNG", PopFunc )
LockTable( _M )
