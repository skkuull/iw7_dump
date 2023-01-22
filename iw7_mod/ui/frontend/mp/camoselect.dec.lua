local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "frontEnd.MP.CAC.weaponPersonalize.camos"
f0_local1 = {}
function PopFunc()
	WipeGlobalModelsAtPath( f0_local0 )
	f0_local1 = {}
end

function PostLoadFunc( f2_arg0, f2_arg1, f2_arg2 )
	assert( f2_arg0.ShowcaseLock )
	if Engine.IsConsoleGame() then
		f2_arg0:AddButtonHelperTextToElement( f2_arg0, {
			helper_text = Engine.Localize( "LUA_MENU_ROTATE" ),
			button_ref = "button_stickr_updown_noswap",
			priority = 10,
			side = "left",
			clickable = false
		} )
	end
	assert( f2_arg2 )
	f2_arg0.weaponDataSource = f2_arg2.weaponDataSource
	local f2_local0 = f2_arg2.weaponDataSource.weapon:GetValue( f2_arg1 )
	f2_arg0:SetDataSource( f2_arg2.weaponDataSource, f2_arg1 )
	if CONDITIONS.IsCoreMultiplayer( f2_arg0 ) then
		f2_arg0.MenuTitle.MenuBreadcrumbs:setText( CoD.GetBreadcrumbCreateAClass(), 0 )
	end
	local f2_local1 = Cac.GetWeaponClass( f2_local0 )
	assert( f2_local1 and #f2_local1 > 0 )
	if Engine.IsCoreMode() then
		FrontEndScene.SetTeamAndScene( "loadout_select", f2_arg1 )
	end
	local f2_local2 = Cac.GetWeaponRowList()
	assert( f2_local2 )
	local f2_local3 = f2_local2[f2_local1][f2_local0]
	assert( f2_local3 )
	local f2_local4 = f2_local3.camos
	assert( type( f2_local4 ) == "table" )
	local f2_local5 = {
		file = CSV.camoChallengeMap.file,
		cols = {
			equipmentRef = CSV.camoChallengeMap.cols.weaponRef,
			itemRef = CSV.camoChallengeMap.cols.camoRef,
			challengeRef = CSV.camoChallengeMap.cols.challengeRef,
			challengeTier = CSV.camoChallengeMap.cols.challengeTier,
			altUnlockString = CSV.camoChallengeMap.cols.altUnlockString
		}
	}
	f2_arg0.CategoriesTabs.Tabs:SetTabManagerDataSource( LOADOUT.MakePersonalizationItemsListDataSource( f0_local0, f2_local4, {
		equipmentRef = f2_local0,
		currentlyEquippedItemDataSource = f2_arg0.weaponDataSource.camoInfo,
		categoriesOrder = {
			mp = 1,
			cp = 2,
			loot = 3,
			missionTeam = 4,
			extra = 5
		},
		tabNames = {
			mp = "LUA_MENU_MULTIPLAYER_CAPS",
			cp = "LUA_MENU_ALIENS",
			loot = "LUA_MENU_MP_QUARTERMASTER",
			extra = "MENU_EXTRAS",
			missionTeam = "MENU_MISSION_TEAMS"
		},
		categoriesToShowChallengeDataFor = {
			mp = true
		},
		controllerIndex = f2_arg1,
		challengeMap = f2_local5,
		allItemsChallengeData = f0_local1,
		isUnlockedFunc = function ( f3_arg0 )
			if f3_arg0.unlockType == "loot" then
				local f3_local0 = Engine.TableLookup( CSV.cosmeticCamosLootMaster.file, CSV.cosmeticCamosLootMaster.cols.ref, Engine.TableLookup( CSV.weapons.file, CSV.weapons.cols.ref, f2_local0, CSV.weapons.cols.class ) .. "+" .. f3_arg0.ref, CSV.cosmeticCamosLootMaster.cols.index )
				if f3_local0 ~= nil and #f3_local0 > 0 then
					return Loot.IsOwned( f2_arg1, tonumber( f3_local0 ) ) >= 1
				else
					return true
				end
			else
				local f3_local1 = not CONDITIONS.IsSystemLink( f2_arg0 )
				if Engine.IsCoreMode() or f3_arg0.ref == "camo35" then
					return Engine.IsUnlocked( f2_arg1, "camo", f2_local0 .. "+" .. f3_arg0.ref, f3_local1 )
				else
					return true
				end
			end
		end,
		getQualityFunc = function ( f4_arg0 )
			return Cac.GetLootQualityFromFile( CSV.cosmeticCamosLootMaster, f4_arg0, Engine.TableLookup( CSV.weapons.file, CSV.weapons.cols.ref, f2_local0, CSV.weapons.cols.class ) .. "+" .. f4_arg0.ref )
		end
	}, f0_local1 ) )
	f2_arg0.PersonalizeItemGrid.ItemGrid:SetGridDataSourceThroughElement( f2_arg0.CategoriesTabs.Tabs, "items" )
	f2_arg0.camoActive = true
	f2_arg0:addEventHandler( "close_item_selection", function ( f5_arg0, f5_arg1 )
		ACTIONS.LeaveMenu( f2_arg0 )
	end )
	local f2_local6 = nil
	if CONDITIONS.IsCorePublicMatch( f2_arg0 ) then
		assert( f2_arg0.ChallengeProgress )
		f2_local6 = {
			ref = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".challenge.ref", "" ),
			tierIndex = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".challenge.tierIndex", 0 ),
			desc = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".challenge.desc", "" ),
			currentProgress = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".challenge.currentProgress", 0 ),
			currentTierMax = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".challenge.currentTierMax", 0 ),
			challengeUnlocked = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".challenge.challengeUnlocked", false )
		}
		f2_arg0.ChallengeProgress:SetDataSource( f2_local6, f2_arg1 )
	end
	f2_arg0:addEventHandler( "selection_changed", function ( f6_arg0, f6_arg1 )
		assert( f6_arg1.newSelection )
		local f6_local0 = f6_arg1.newSelection:GetDataSource( f2_arg1 )
		local f6_local1 = f6_local0.ref:GetValue( f2_arg1 )
		local f6_local2 = CSV.ReadRow( CSV.camoTable, Engine.TableLookupGetRowNum( CSV.camoTable.file, CSV.camoTable.cols.ref, f6_local1 ) )
		assert( f2_arg0.CACItemHeader.ItemName )
		assert( f2_arg0.CACItemHeader.ItemDescription )
		f2_arg0.CACItemHeader.ItemName:setText( ToUpperCase( Engine.Localize( f6_local2.name ) ) )
		f2_arg0.CACItemHeader.ItemDescription:setText( ToUpperCase( Engine.Localize( f6_local2.desc ) ) )
		f2_arg0.CACItemHeader:UpdateRarityInfo( f6_local0 )
		if CONDITIONS.IsCorePublicMatch( f2_arg0 ) then
			if f6_local2.category == "mp" then
				local f6_local3 = Challenge.GetPersonalizationItemChallengeData( f2_arg0.weaponDataSource.weapon:GetValue( f2_arg1 ), f6_local1, f0_local1, f2_local5, f2_arg1 )
				if f6_local3 and f6_local3.ref and f6_local3.tierIndex and f6_local3.desc and f6_local3.currentProgress and f6_local3.currentTierMax then
					f2_local6.ref:SetValue( f2_arg1, f6_local3.ref )
					f2_local6.tierIndex:SetValue( f2_arg1, f6_local3.tierIndex )
					local f6_local4 = Engine.IsUnlocked( f2_arg1, "challenge", f6_local3.ref )
					if f6_local3.altUnlockString then
						f2_local6.desc:SetValue( f2_arg1, Engine.Localize( f6_local3.altUnlockString ) )
						f6_local4 = false
					elseif f6_local4 then
						f2_local6.desc:SetValue( f2_arg1, f6_local3.desc )
					else
						f2_local6.desc:SetValue( f2_arg1, GetChallengeUnlockText( f6_local3.ref ) )
					end
					f2_local6.challengeUnlocked:SetValue( f2_arg1, f6_local4 )
					f2_local6.currentProgress:SetValue( f2_arg1, f6_local3.currentProgress )
					f2_local6.currentTierMax:SetValue( f2_arg1, f6_local3.currentTierMax )
					f2_arg0.ChallengeProgress:SetAlpha( 1, 0 )
				else
					f2_arg0.ChallengeProgress:SetAlpha( 0, 0 )
				end
			else
				f2_arg0.ChallengeProgress:SetAlpha( 0, 0 )
			end
		end
		if f6_local0.isUnlocked:GetValue( f2_arg1 ) == true then
			ACTIONS.AnimateSequence( f2_arg0.ShowcaseLock, "HideCriteria" )
			ACTIONS.AnimateSequence( f2_arg0, "HideCriteria" )
		else
			if f6_local2.category ~= "extra" then
				f2_arg0.UnlockCriteria.UnlockDesc:setText( Engine.Localize( f6_local2.customUnlockString ) )
				ACTIONS.AnimateSequence( f2_arg0, "ShowCriteria" )
			end
			ACTIONS.AnimateSequence( f2_arg0.ShowcaseLock, "ShowCriteria" )
		end
	end )
	f2_arg0.bindButton:addEventHandler( "button_secondary", function ( f7_arg0, f7_arg1 )
		Cac.UpdateFrontendWeaponModel( f2_arg0.weaponDataSource, {
			camo = f2_arg0.weaponDataSource.camoInfo.ref:GetValue( f2_arg1 )
		}, f2_arg1 )
	end )
	f2_arg0.bindButton:addEventHandler( "button_alt1", function ( f8_arg0, f8_arg1 )
		Engine.PlaySound( "ui_select_alt" )
		ACTIONS.RemoveCamo( f2_arg0, f2_arg1 )
	end )
	if Engine.IsAliensMode() then
		f2_arg0.CACItemHeader.ItemName:SetFont( FONTS.GetFont( FONTS.ZmClean.File ) )
	else
		f2_arg0.CACItemHeader.ItemName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	end
end

function CamoSelect( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "CamoSelect"
	self._animationSets = {}
	self._sequences = {}
	local f9_local1 = controller and controller.controllerIndex
	if not f9_local1 and not Engine.InFrontend() then
		f9_local1 = self:getRootController()
	end
	assert( f9_local1 )
	self:playSound( "menu_open" )
	local f9_local2 = self
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f9_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local SocialFeed = nil
	
	SocialFeed = MenuBuilder.BuildRegisteredType( "SocialFeed", {
		controllerIndex = f9_local1
	} )
	SocialFeed.id = "SocialFeed"
	SocialFeed:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -115, _1080p * -85 )
	self:addElement( SocialFeed )
	self.SocialFeed = SocialFeed
	
	local f9_local5 = nil
	if CONDITIONS.IsMultiplayer( self ) then
		f9_local5 = LUI.UIImage.new()
		f9_local5.id = "WeaponImage"
		f9_local5:SetAlpha( 0, 0 )
		f9_local5:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1169.05, _1080p * 1580.96, _1080p * 404.48, _1080p * 787.48 )
		f9_local5:SubscribeToModelThroughElement( self, "icon", function ()
			local f10_local0 = self:GetDataSource()
			f10_local0 = f10_local0.icon:GetValue( f9_local1 )
			if f10_local0 ~= nil then
				f9_local5:setImage( RegisterMaterial( f10_local0 ), 0 )
			end
		end )
		self:addElement( f9_local5 )
		self.WeaponImage = f9_local5
	end
	local PersonalizeItemGrid = nil
	
	PersonalizeItemGrid = MenuBuilder.BuildRegisteredType( "PersonalizeItemGrid", {
		controllerIndex = f9_local1
	} )
	PersonalizeItemGrid.id = "PersonalizeItemGrid"
	PersonalizeItemGrid:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 97, _1080p * 720, _1080p * 216, _1080p * 898 )
	self:addElement( PersonalizeItemGrid )
	self.PersonalizeItemGrid = PersonalizeItemGrid
	
	local CACItemHeader = nil
	
	CACItemHeader = MenuBuilder.BuildRegisteredType( "CACItemHeader", {
		controllerIndex = f9_local1
	} )
	CACItemHeader.id = "CACItemHeader"
	CACItemHeader.Background:SetRGBFromInt( 6710886, 0 )
	CACItemHeader.ItemDescription:SetRight( _1080p * 750, 0 )
	CACItemHeader.ItemDescription:setText( ToUpperCase( "Camo Description" ), 0 )
	CACItemHeader.ItemName:setText( ToUpperCase( "Camo Name" ), 0 )
	CACItemHeader.ItemName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	CACItemHeader:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 736, 0, _1080p * 216, _1080p * 316 )
	self:addElement( CACItemHeader )
	self.CACItemHeader = CACItemHeader
	
	local f9_local8 = nil
	if CONDITIONS.IsCoreMultiplayer( self ) then
		f9_local8 = MenuBuilder.BuildRegisteredType( "MenuTitle", {
			controllerIndex = f9_local1
		} )
		f9_local8.id = "MenuTitle"
		f9_local8.MenuTitle:setText( ToUpperCase( Engine.Localize( "MENU_CAMO_CAPS" ) ), 0 )
		f9_local8.MenuBreadcrumbs:setText( ToUpperCase( "" ), 0 )
		f9_local8.Icon:SetTop( _1080p * -28.5, 0 )
		f9_local8.Icon:SetBottom( _1080p * 61.5, 0 )
		f9_local8:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
		self:addElement( f9_local8 )
		self.MenuTitle = f9_local8
	end
	local f9_local9 = nil
	if CONDITIONS.IsThirdGameMode( self ) then
		f9_local9 = MenuBuilder.BuildRegisteredType( "CPMenuTitle", {
			controllerIndex = f9_local1
		} )
		f9_local9.id = "CPMenuTitle"
		f9_local9.MenuTitle:setText( Engine.Localize( "MENU_CAMO_CAPS" ), 0 )
		f9_local9:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
		self:addElement( f9_local9 )
		self.CPMenuTitle = f9_local9
	end
	local CategoriesTabs = nil
	
	CategoriesTabs = MenuBuilder.BuildRegisteredType( "SubMenuTabsBar", {
		controllerIndex = f9_local1
	} )
	CategoriesTabs.id = "CategoriesTabs"
	CategoriesTabs:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 310, _1080p * 1610, _1080p * 154, _1080p * 194 )
	self:addElement( CategoriesTabs )
	self.CategoriesTabs = CategoriesTabs
	
	local f9_local11 = nil
	if CONDITIONS.IsCorePublicMatch( self ) then
		f9_local11 = MenuBuilder.BuildRegisteredType( "ChallengeProgressWithRadialBar", {
			controllerIndex = f9_local1
		} )
		f9_local11.id = "ChallengeProgress"
		f9_local11:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 736, _1080p * 1886, _1080p * 805, _1080p * 991 )
		self:addElement( f9_local11 )
		self.ChallengeProgress = f9_local11
	end
	local camoicon = nil
	
	camoicon = LUI.UIImage.new()
	camoicon.id = "camoicon"
	camoicon:setImage( RegisterMaterial( "icon_weapon_camo_small" ), 0 )
	camoicon:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -290, _1080p * -205, _1080p * 224, _1080p * 309 )
	self:addElement( camoicon )
	self.camoicon = camoicon
	
	local ShowcaseLock = nil
	
	ShowcaseLock = MenuBuilder.BuildRegisteredType( "ShowcaseLock", {
		controllerIndex = f9_local1
	} )
	ShowcaseLock.id = "ShowcaseLock"
	ShowcaseLock:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 156.5, _1080p * 673.5, _1080p * 339, _1080p * 856 )
	self:addElement( ShowcaseLock )
	self.ShowcaseLock = ShowcaseLock
	
	local MissionTeamInfo = nil
	
	MissionTeamInfo = MenuBuilder.BuildRegisteredType( "MissionTeamInfo", {
		controllerIndex = f9_local1
	} )
	MissionTeamInfo.id = "MissionTeamInfo"
	MissionTeamInfo:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -700, 0, _1080p * 54, _1080p * 142 )
	self:addElement( MissionTeamInfo )
	self.MissionTeamInfo = MissionTeamInfo
	
	local WeaponRotator = nil
	
	WeaponRotator = MenuBuilder.BuildRegisteredType( "WeaponRotator", {
		controllerIndex = f9_local1
	} )
	WeaponRotator.id = "WeaponRotator"
	WeaponRotator:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 736, 0, _1080p * 339, _1080p * 856 )
	self:addElement( WeaponRotator )
	self.WeaponRotator = WeaponRotator
	
	local f9_local16 = nil
	if CONDITIONS.IsPublicMatch( self ) then
		f9_local16 = MenuBuilder.BuildRegisteredType( "CRMMain", {
			controllerIndex = f9_local1
		} )
		f9_local16.id = "CRMMain"
		f9_local16:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 136, _1080p * 447, _1080p * 745, _1080p * 1069 )
		self:addElement( f9_local16 )
		self.CRMMain = f9_local16
	end
	local UnlockCriteria = nil
	
	UnlockCriteria = MenuBuilder.BuildRegisteredType( "UnlockCriteria", {
		controllerIndex = f9_local1
	} )
	UnlockCriteria.id = "UnlockCriteria"
	UnlockCriteria:SetAlpha( 0, 0 )
	UnlockCriteria.UnlockDesc:SetRight( _1080p * 340, 0 )
	UnlockCriteria.UnlockDesc:setText( "", 0 )
	UnlockCriteria:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 741, _1080p * 1179, _1080p * 330, _1080p * 360 )
	self:addElement( UnlockCriteria )
	self.UnlockCriteria = UnlockCriteria
	
	self._animationSets.DefaultAnimationSet = function ()
		CategoriesTabs:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.CategoriesTabs:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 310, _1080p * 1610, _1080p * 155, _1080p * 195, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			CategoriesTabs:AnimateSequence( "DefaultSequence" )
		end
		
		CategoriesTabs:RegisterAnimationSequence( "CPInit", {
			{
				function ()
					return self.CategoriesTabs:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 310, _1080p * 1610, _1080p * 140, _1080p * 180, 0 )
				end
			}
		} )
		self._sequences.CPInit = function ()
			CategoriesTabs:AnimateSequence( "CPInit" )
		end
		
		UnlockCriteria:RegisterAnimationSequence( "ShowCriteria", {
			{
				function ()
					return self.UnlockCriteria:SetAlpha( 0, 0 )
				end,
				function ()
					return self.UnlockCriteria:SetAlpha( 1, 100 )
				end
			},
			{
				function ()
					return self.UnlockCriteria:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 741, _1080p * 1179, _1080p * 345, _1080p * 375, 0 )
				end,
				function ()
					return self.UnlockCriteria:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 741, _1080p * 1179, _1080p * 330, _1080p * 360, 100 )
				end
			}
		} )
		self._sequences.ShowCriteria = function ()
			UnlockCriteria:AnimateSequence( "ShowCriteria" )
		end
		
		UnlockCriteria:RegisterAnimationSequence( "HideCriteria", {
			{
				function ()
					return self.UnlockCriteria:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.HideCriteria = function ()
			UnlockCriteria:AnimateSequence( "HideCriteria" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self.addButtonHelperFunction = function ( f23_arg0, f23_arg1 )
		f23_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_SELECT" ),
			button_ref = "button_primary",
			side = "left",
			clickable = true
		} )
		f23_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			priority = 2,
			clickable = true
		} )
		f23_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_REMOVE" ),
			button_ref = "button_alt1",
			side = "left",
			priority = 1
		} )
	end
	
	self:addEventHandler( "menu_create", self.addButtonHelperFunction )
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	self:SubscribeToModelThroughElement( self, "desc", function ()
		ACTIONS.AnimateSequenceByElement( self, {
			elementName = "CACItemHeader",
			sequenceName = "UpdateDescription",
			elementPath = "CACItemHeader"
		} )
	end )
	self.bindButton:addEventHandler( "button_secondary", function ( f25_arg0, f25_arg1 )
		local f25_local0 = f25_arg1.controller or f9_local1
		ACTIONS.LeaveMenu( self )
	end )
	PostLoadFunc( self, f9_local1, controller )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	if CONDITIONS.IsThirdGameMode( self ) then
		ACTIONS.AnimateSequence( self, "CPInit" )
	end
	if CONDITIONS.IsPublicMatch( self ) then
		ACTIONS.AnimateSequenceByElement( self, {
			elementName = "CRMMain",
			sequenceName = "Minimize",
			elementPath = "CRMMain"
		} )
	end
	return self
end

MenuBuilder.registerType( "CamoSelect", CamoSelect )
LUI.FlowManager.RegisterStackPopBehaviour( "CamoSelect", PopFunc )
LockTable( _M )
