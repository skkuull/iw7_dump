local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "frontEnd.MP.armory.missionTeamWeapons"
function PopFunc()
	WipeGlobalModelsAtPath( f0_local0 )
end

f0_local1 = function ( f2_arg0 )
	assert( f2_arg0.Weapons )
	assert( f2_arg0.MissionTeams )
	assert( f2_arg0.missionTeamsTable )
	local f2_local0 = CountTableKeys( f2_arg0.missionTeamsTable )
	f2_arg0.MissionTeams:SetNumColumns( 1 )
	f2_arg0.MissionTeams:SetNumRows( f2_local0 )
	f2_arg0.MissionTeams:RefreshContent()
	f2_arg0.Weapons:SetNumColumns( 1 )
	f2_arg0.Weapons:SetNumRows( f2_local0 )
	f2_arg0.Weapons:RefreshContent()
	for f2_local4, f2_local5 in pairs( f2_arg0.missionTeamsTable ) do
		local f2_local6 = f2_arg0.Weapons:GetElementAtPosition( 0, f2_local5.index )
		if f2_local6 then
			f2_local6:SetupMissionTeamData( f2_local4, f2_local5 )
		else
			DebugPrint( "Missing weaponRow " .. f2_local5.index )
		end
	end
end

f0_local2 = function ( f3_arg0, f3_arg1 )
	assert( f3_arg0.ArrowLeft )
	assert( f3_arg0.ArrowRight )
	local f3_local0
	if f3_arg1 then
		f3_local0 = 1
		if not f3_local0 then
		
		else
			f3_arg0.ArrowRight:SetAlpha( f3_local0 )
			f3_arg0.ArrowLeft:SetAlpha( f3_local0 )
		end
	end
	f3_local0 = 0
end

local f0_local3 = function ( f4_arg0 )
	assert( f4_arg0.Weapons )
	local f4_local0 = f4_arg0.Weapons:GetFocusPositionIndex()
	if f4_local0 ~= nil then
		local f4_local1 = f4_arg0.Weapons:GetElementAtPosition( 0, f4_local0 )
		if f4_local1.Items:GetMaxVisibleColumns() < f4_local1.Items:GetNumChildren() then
			f0_local2( f4_arg0, true )
		else
			f0_local2( f4_arg0, false )
		end
	end
end

function PostLoadFunc( f5_arg0, f5_arg1, f5_arg2 )
	assert( f5_arg0.MenuTitle )
	assert( f5_arg0.MenuTitle.MenuTitle )
	assert( f5_arg0.MenuTitle.MenuBreadcrumbs )
	assert( f5_arg0.WeaponsListCount )
	assert( f5_arg0.ArrowRight )
	assert( f5_arg0.ArrowLeft )
	local f5_local0 = LUI.FlowManager.GetScopedData( f5_arg0 )
	f5_local0.context = ARMORY.inventoryContext.MISSION_TEAM
	local f5_local1 = {}
	for Weapons = 0, Engine.TableGetRowCount( CSV.missionTeams.file ) - 1, 1 do
		local f5_local5 = Engine.TableLookupByRow( CSV.missionTeams.file, Weapons, CSV.missionTeams.cols.index )
		local f5_local6 = Engine.TableLookupByRow( CSV.missionTeams.file, Weapons, CSV.missionTeams.cols.killswitch )
		local f5_local7
		if #f5_local6 > 0 then
			f5_local7 = Engine.GetDvarBool( f5_local6 )
		else
			f5_local7 = false
		end
		if not f5_local7 then
			f5_local1[f5_local5] = {
				weapons = {},
				index = Weapons
			}
		end
	end
	for Weapons = 0, Engine.TableGetRowCount( CSV.weaponLootMaster.file ) - 1, 1 do
		local f5_local5 = Engine.TableLookupByRow( CSV.weaponLootMaster.file, Weapons, CSV.weaponLootMaster.cols.missionTeam )
		if Engine.TableLookupByRow( CSV.weaponLootMaster.file, Weapons, CSV.weaponLootMaster.cols.mk2 ) == "N" and f5_local5 ~= MissionDirector.teamNoneValue and f5_local5 ~= MissionDirector.teamRnGValue and f5_local5 ~= MissionDirector.teamPromoValue and f5_local1[f5_local5] then
			table.insert( f5_local1[f5_local5].weapons, {
				index = Engine.TableLookupByRow( CSV.weaponLootMaster.file, Weapons, CSV.weaponLootMaster.cols.index ),
				level = tonumber( Engine.TableLookupByRow( CSV.weaponLootMaster.file, Weapons, CSV.weaponLootMaster.cols.teamLevel ) )
			} )
		end
	end
	f5_arg0.missionTeamsTable = f5_local1
	for f5_local8, f5_local5 in pairs( f5_local1 ) do
		table.sort( f5_local5.weapons, function ( f6_arg0, f6_arg1 )
			return f6_arg0.level < f6_arg1.level
		end )
	end
	Weapons = nil
	
	Weapons = LUI.UIGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 5,
		controllerIndex = f5_arg1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "ArmoryItems", {
				controllerIndex = f5_arg1,
				context = ARMORY.inventoryContext.MISSION_TEAM
			} )
		end,
		refreshChild = function ( f8_arg0, f8_arg1, f8_arg2 )
			for f8_local3, f8_local4 in pairs( f5_local1 ) do
				if f8_arg2 == f8_local4.index then
					f8_arg0.currentMissionTeam = f8_local3
					break
				end
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
		maxVelocity = 5000
	} )
	Weapons.id = "Weapons"
	Weapons:setUseStencil( false )
	Weapons:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 326, _1080p * 1342, _1080p * 216, _1080p * 764 )
	Weapons:setPriority( -1 )
	f5_arg0.Blur:setPriority( -2 )
	f5_arg0:addElement( Weapons )
	f5_arg0.Weapons = Weapons
	
	f5_arg0.Weapons.FocusChanged = function ( f9_arg0 )
		LUI.UIGrid.FocusChanged( f9_arg0 )
		local f9_local0 = f9_arg0:GetFocusPositionIndex()
		local f9_local1 = f5_arg0.Weapons:GetElementAtPosition( 0, f9_local0 )
		assert( f9_local1.Items )
		f9_local1.Items:AddItemNumbers( f5_arg0.WeaponsListCount, "weaponListCount" )
		f9_local1.Items:AddArrow( f5_arg0.ArrowRight )
		f9_local1.Items:AddArrow( f5_arg0.ArrowLeft )
		f9_local1.Items:UpdateNumbersAndArrows()
		f0_local3( f5_arg0 )
		assert( f5_arg0.ArrowLeft )
		assert( f5_arg0.ArrowRight )
		if f9_local0 == 0 then
			f5_arg0.ArrowLeft:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 299, _1080p * 326, _1080p * 239, _1080p * 293 )
			f5_arg0.ArrowRight:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -577, _1080p * -550, _1080p * 239, _1080p * 293 )
		elseif f9_local0 == 1 then
			f5_arg0.ArrowLeft:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 299, _1080p * 326, _1080p * 351, _1080p * 405 )
			f5_arg0.ArrowRight:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -577, _1080p * -550, _1080p * 351, _1080p * 405 )
		elseif f9_local0 == 2 then
			f5_arg0.ArrowLeft:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 299, _1080p * 326, _1080p * 463, _1080p * 517 )
			f5_arg0.ArrowRight:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -577, _1080p * -550, _1080p * 463, _1080p * 517 )
		elseif f9_local0 == 3 then
			f5_arg0.ArrowLeft:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 299, _1080p * 326, _1080p * 575, _1080p * 629 )
			f5_arg0.ArrowRight:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -577, _1080p * -550, _1080p * 575, _1080p * 629 )
		elseif f9_local0 == 4 then
			f5_arg0.ArrowLeft:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 299, _1080p * 326, _1080p * 687, _1080p * 741 )
			f5_arg0.ArrowRight:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -577, _1080p * -550, _1080p * 687, _1080p * 741 )
		else
			f5_arg0.ArrowLeft:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 299, _1080p * 326, _1080p * 799, _1080p * 853 )
			f5_arg0.ArrowRight:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -577, _1080p * -550, _1080p * 799, _1080p * 811 )
		end
	end
	
	MissionTeams = nil
	
	MissionTeams = LUI.UIGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 5,
		controllerIndex = f5_arg1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "ArmoryMissionTeam", {
				controllerIndex = f5_arg1
			} )
		end,
		refreshChild = function ( f11_arg0, f11_arg1, f11_arg2 )
			for f11_local3, f11_local4 in pairs( f5_local1 ) do
				if f11_arg2 == f11_local4.index then
					f11_arg0:SetupMissionTeam( f5_arg1, f11_local4 )
					break
				end
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
	MissionTeams.id = "MissionTeams"
	MissionTeams:setUseStencil( false )
	MissionTeams:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 300, _1080p * 216, _1080p * 764 )
	f5_arg0:addElement( MissionTeams )
	f5_arg0.MissionTeams = MissionTeams
	
	f0_local1( f5_arg0 )
	f5_arg0.MenuTitle.MenuTitle:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_MISSION_TEAM_DEPOT" ) ), 0 )
	if Engine.IsCoreMode() then
		f5_arg0.MenuTitle.MenuBreadcrumbs:setText( ToUpperCase( Engine.Localize( "LUA_MENU_BREADCRUMB_2_ITEMS", "MENU_MULTIPLAYER", "LUA_MENU_PUBLIC_MATCH_CAPS" ), 0 ) )
	end
end

function ArmoryMissionTeams( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "ArmoryMissionTeams"
	self._animationSets = {}
	self._sequences = {}
	local f12_local1 = controller and controller.controllerIndex
	if not f12_local1 and not Engine.InFrontend() then
		f12_local1 = self:getRootController()
	end
	assert( f12_local1 )
	self:playSound( "menu_open" )
	local f12_local2 = self
	local Blur = nil
	
	Blur = LUI.UIBlur.new()
	Blur.id = "Blur"
	Blur:SetBlurStrength( 2, 0 )
	self:addElement( Blur )
	self.Blur = Blur
	
	local MissionTeamInfo = nil
	
	MissionTeamInfo = MenuBuilder.BuildRegisteredType( "MissionTeamInfo", {
		controllerIndex = f12_local1
	} )
	MissionTeamInfo.id = "MissionTeamInfo"
	MissionTeamInfo:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -700, 0, _1080p * 54, _1080p * 141 )
	self:addElement( MissionTeamInfo )
	self.MissionTeamInfo = MissionTeamInfo
	
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
	MenuTitle.MenuTitle:setText( ToUpperCase( Engine.Localize( "MENU_NEW" ) ), 0 )
	MenuTitle.MenuBreadcrumbs:setText( ToUpperCase( "" ), 0 )
	MenuTitle.Icon:SetTop( _1080p * -28.5, 0 )
	MenuTitle.Icon:SetBottom( _1080p * 61.5, 0 )
	MenuTitle:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 96, _1080p * -96, _1080p * 54, _1080p * 134 )
	self:addElement( MenuTitle )
	self.MenuTitle = MenuTitle
	
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
		controllerIndex = f12_local1
	} )
	ArrowRight.id = "ArrowRight"
	ArrowRight:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -603, _1080p * -576, _1080p * 287, _1080p * 341 )
	self:addElement( ArrowRight )
	self.ArrowRight = ArrowRight
	
	local ArrowLeft = nil
	
	ArrowLeft = MenuBuilder.BuildRegisteredType( "ArrowLeft", {
		controllerIndex = f12_local1
	} )
	ArrowLeft.id = "ArrowLeft"
	ArrowLeft:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 273, _1080p * 300, _1080p * 287, _1080p * 341 )
	self:addElement( ArrowLeft )
	self.ArrowLeft = ArrowLeft
	
	local SocialFeed = nil
	
	SocialFeed = MenuBuilder.BuildRegisteredType( "SocialFeed", {
		controllerIndex = f12_local1
	} )
	SocialFeed.id = "SocialFeed"
	SocialFeed:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -115, _1080p * -85 )
	self:addElement( SocialFeed )
	self.SocialFeed = SocialFeed
	
	local ArmoryWeaponCard = nil
	
	ArmoryWeaponCard = MenuBuilder.BuildRegisteredType( "ArmoryItemCard", {
		controllerIndex = f12_local1
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
	
	local CRMMain = nil
	
	CRMMain = MenuBuilder.BuildRegisteredType( "CRMMain", {
		controllerIndex = f12_local1
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
	self.addButtonHelperFunction = function ( f20_arg0, f20_arg1 )
		f20_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			priority = 1,
			clickable = true
		} )
	end
	
	self:addEventHandler( "menu_create", self.addButtonHelperFunction )
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	self.bindButton:addEventHandler( "button_secondary", function ( f21_arg0, f21_arg1 )
		local f21_local0 = f21_arg1.controller or f12_local1
		ACTIONS.LeaveMenu( self )
	end )
	PostLoadFunc( self, f12_local1, controller )
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "CRMMain",
		sequenceName = "Minimize",
		elementPath = "CRMMain"
	} )
	return self
end

MenuBuilder.registerType( "ArmoryMissionTeams", ArmoryMissionTeams )
LUI.FlowManager.RegisterStackPopBehaviour( "ArmoryMissionTeams", PopFunc )
LockTable( _M )
