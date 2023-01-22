local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "frontEnd.MP.CAC.weaponPersonalize.cosmeticAttachments"
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
	if Engine.IsCoreMode() then
		FrontEndScene.SetTeamAndScene( "loadout_select", f2_arg1 )
	end
	assert( f2_arg2 )
	f2_arg0.weaponDataSource = f2_arg2.weaponDataSource
	local f2_local0 = f2_arg2.weaponDataSource.ref:GetValue( f2_arg1 )
	f2_arg0:SetDataSource( f2_arg2.weaponDataSource, f2_arg1 )
	local f2_local1 = LOADOUT.MakePersonalizationItemsListDataSource( f0_local0, LOADOUT.GetAvailableCosmeticAttachmentData( f2_local0 ), {
		equipmentRef = f2_local0,
		currentlyEquippedItemDataSource = f2_arg0.weaponDataSource.cosmeticAttachmentInfo,
		categoriesOrder = {
			mp = 1,
			missionTeam = 3,
			loot = 2,
			extra = 4
		},
		tabNames = {
			mp = "LUA_MENU_MULTIPLAYER_CAPS",
			missionTeam = "MENU_MISSION_TEAMS",
			loot = "LUA_MENU_MP_QUARTERMASTER",
			extra = "MENU_EXTRAS"
		},
		categoriesToShowChallengeDataFor = {},
		controllerIndex = f2_arg1,
		challengeMap = nil,
		allItemsChallengeData = f0_local1,
		isUnlockedFunc = function ( f3_arg0 )
			if f3_arg0.unlockType == "loot" then
				local f3_local0 = Engine.TableLookup( CSV.cosmeticAttachmentsLootMaster.file, CSV.cosmeticAttachmentsLootMaster.cols.ref, f3_arg0.ref, CSV.cosmeticAttachmentsLootMaster.cols.index )
				if f3_local0 ~= nil and #f3_local0 > 0 then
					return Loot.IsOwned( f2_arg1, tonumber( f3_local0 ) ) >= 1
				else
					return true
				end
			end
			local f3_local0 = Engine.IsAliensMode()
			if f3_local0 then
				f3_local0 = not CONDITIONS.IsSystemLink( f2_arg0 )
			end
			return Engine.IsUnlocked( f2_arg1, "cosmeticAttachment", f2_local0 .. "+" .. f3_arg0.ref, f3_local0 )
		end,
		getQualityFunc = function ( f4_arg0 )
			return Cac.GetLootQualityFromFile( CSV.cosmeticAttachmentsLootMaster, f4_arg0, f4_arg0.ref )
		end
	}, f0_local1 )
	if f2_local1 then
		f2_arg0.CategoriesTabs.Tabs:SetTabManagerDataSource( f2_local1 )
		f2_arg0.PersonalizeItemGrid.ItemGrid:SetGridDataSourceThroughElement( f2_arg0.CategoriesTabs.Tabs, "items" )
	else
		f2_arg0.CategoriesTabs:closeTree()
	end
	f2_arg0.cosmeticAttachmentActive = true
	f2_arg0:addEventHandler( "close_item_selection", function ( f5_arg0, f5_arg1 )
		ACTIONS.LeaveMenu( f2_arg0 )
	end )
	f2_arg0:addEventHandler( "selection_changed", function ( f6_arg0, f6_arg1 )
		assert( f6_arg1.newSelection )
		local f6_local0 = f6_arg1.newSelection:GetDataSource( f2_arg1 )
		f6_local0 = f6_local0.ref:GetValue( f2_arg1 )
		local f6_local1 = CSV.ReadRow( CSV.cosmeticAttachmentTable, Engine.TableLookupGetRowNum( CSV.cosmeticAttachmentTable.file, CSV.cosmeticAttachmentTable.cols.ref, f6_local0 ) )
		assert( f2_arg0.CACItemHeader.ItemName )
		assert( f2_arg0.CACItemHeader.ItemDescription )
		f2_arg0.CACItemHeader.ItemName:setText( ToUpperCase( Engine.Localize( f6_local1.name ) ) )
		f2_arg0.CACItemHeader.ItemDescription:setText( ToUpperCase( Engine.Localize( f6_local1.desc ) ) )
		f2_arg0.CACItemHeader:UpdateRarityInfo( f6_arg1.newSelection:GetDataSource( f2_arg1 ) )
		local f6_local2 = f6_arg1.newSelection:GetDataSource( f2_arg1 )
		if f6_local2.isUnlocked:GetValue( f2_arg1 ) == true then
			ACTIONS.AnimateSequence( f2_arg0.ShowcaseLock, "HideCriteria" )
			ACTIONS.AnimateSequence( f2_arg0, "HideCriteria" )
		else
			if f6_local1.category == "mp" then
				f2_arg0.UnlockCriteria.UnlockDesc:setText( Cac.GetUnlockText( CSV.cosmeticAttachmentUnlockTable, tostring( f2_local0 ) .. "+" .. tostring( f6_local0 ) ) )
			else
				f2_arg0.UnlockCriteria.UnlockDesc:setText( Engine.Localize( f6_local1.customUnlockString ) )
			end
			ACTIONS.AnimateSequence( f2_arg0, "ShowCriteria" )
			ACTIONS.AnimateSequence( f2_arg0.ShowcaseLock, "ShowCriteria" )
		end
	end )
	f2_arg0.bindButton:addEventHandler( "button_secondary", function ( f7_arg0, f7_arg1 )
		Cac.UpdateFrontendWeaponModel( f2_arg0.weaponDataSource, {
			cosmeticAttachment = f2_arg0.weaponDataSource.cosmeticAttachmentInfo.ref:GetValue( f2_arg1 )
		}, f2_arg1 )
	end )
	f2_arg0.bindButton:addEventHandler( "button_alt1", function ( f8_arg0, f8_arg1 )
		Engine.PlaySound( "ui_select_alt" )
		ACTIONS.RemoveCosmeticAttachment( f2_arg0, f2_arg1 )
	end )
	if Engine.IsAliensMode() then
		f2_arg0.CACItemHeader.ItemName:SetFont( FONTS.GetFont( FONTS.ZmClean.File ) )
	else
		f2_arg0.CACItemHeader.ItemName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	end
end

function CosmeticAttachmentSelect( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "CosmeticAttachmentSelect"
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
	
	local PersonalizeItemGrid = nil
	
	PersonalizeItemGrid = MenuBuilder.BuildRegisteredType( "PersonalizeItemGrid", {
		controllerIndex = f9_local1
	} )
	PersonalizeItemGrid.id = "PersonalizeItemGrid"
	PersonalizeItemGrid:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 97, _1080p * 713, _1080p * 216, _1080p * 846 )
	self:addElement( PersonalizeItemGrid )
	self.PersonalizeItemGrid = PersonalizeItemGrid
	
	local CACItemHeader = nil
	
	CACItemHeader = MenuBuilder.BuildRegisteredType( "CACItemHeader", {
		controllerIndex = f9_local1
	} )
	CACItemHeader.id = "CACItemHeader"
	CACItemHeader.Background:SetRGBFromInt( 6710886, 0 )
	CACItemHeader.ItemDescription:SetRight( _1080p * 750, 0 )
	CACItemHeader.ItemDescription:setText( ToUpperCase( "Accessory Description" ), 0 )
	CACItemHeader.ItemName:setText( ToUpperCase( "Accessory Name" ), 0 )
	CACItemHeader.ItemName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	CACItemHeader:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 736, 0, _1080p * 216, _1080p * 316 )
	self:addElement( CACItemHeader )
	self.CACItemHeader = CACItemHeader
	
	local f9_local7 = nil
	if CONDITIONS.IsCoreMultiplayer( self ) then
		f9_local7 = MenuBuilder.BuildRegisteredType( "MenuTitle", {
			controllerIndex = f9_local1
		} )
		f9_local7.id = "MenuTitle"
		f9_local7.MenuTitle:setText( ToUpperCase( Engine.Localize( "MENU_ACCESSORY" ) ), 0 )
		f9_local7.MenuBreadcrumbs:setText( ToUpperCase( Engine.Localize( "MENU_MULTIPLAYER" ) ), 0 )
		f9_local7.Icon:SetTop( _1080p * -28.5, 0 )
		f9_local7.Icon:SetBottom( _1080p * 61.5, 0 )
		f9_local7:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
		self:addElement( f9_local7 )
		self.MenuTitle = f9_local7
	end
	local f9_local8 = nil
	if CONDITIONS.IsThirdGameMode( self ) then
		f9_local8 = MenuBuilder.BuildRegisteredType( "CPMenuTitle", {
			controllerIndex = f9_local1
		} )
		f9_local8.id = "CPMenuTitle"
		f9_local8.MenuTitle:setText( ToUpperCase( Engine.Localize( "MENU_ACCESSORY" ) ), 0 )
		f9_local8:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
		self:addElement( f9_local8 )
		self.CPMenuTitle = f9_local8
	end
	local CategoriesTabs = nil
	
	CategoriesTabs = MenuBuilder.BuildRegisteredType( "SubMenuTabsBar", {
		controllerIndex = f9_local1
	} )
	CategoriesTabs.id = "CategoriesTabs"
	CategoriesTabs:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 310, _1080p * 1610, _1080p * 154, _1080p * 194 )
	self:addElement( CategoriesTabs )
	self.CategoriesTabs = CategoriesTabs
	
	local icon = nil
	
	icon = LUI.UIImage.new()
	icon.id = "icon"
	icon:setImage( RegisterMaterial( "icon_weapon_accessory_small" ), 0 )
	icon:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -290, _1080p * -205, _1080p * 224, _1080p * 309 )
	self:addElement( icon )
	self.icon = icon
	
	local ShowcaseLock = nil
	
	ShowcaseLock = MenuBuilder.BuildRegisteredType( "ShowcaseLock", {
		controllerIndex = f9_local1
	} )
	ShowcaseLock.id = "ShowcaseLock"
	ShowcaseLock:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 109.5, _1080p * 626.5, _1080p * 316, _1080p * 833 )
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
	WeaponRotator:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 736, 0, _1080p * 316, _1080p * 833 )
	self:addElement( WeaponRotator )
	self.WeaponRotator = WeaponRotator
	
	local f9_local14 = nil
	if CONDITIONS.IsPublicMatch( self ) then
		f9_local14 = MenuBuilder.BuildRegisteredType( "CRMMain", {
			controllerIndex = f9_local1
		} )
		f9_local14.id = "CRMMain"
		f9_local14:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 136, _1080p * 447, _1080p * 745, _1080p * 1069 )
		self:addElement( f9_local14 )
		self.CRMMain = f9_local14
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
		self._sequences.DefaultSequence = function ()
			
		end
		
		CategoriesTabs:RegisterAnimationSequence( "CPInit", {
			{
				function ()
					return self.CategoriesTabs:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 310, _1080p * 1610, _1080p * 141, _1080p * 181, 0 )
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
	self.addButtonHelperFunction = function ( f21_arg0, f21_arg1 )
		f21_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_SELECT" ),
			button_ref = "button_primary",
			side = "left",
			clickable = true
		} )
		f21_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			priority = 2,
			clickable = true
		} )
		f21_arg0:AddButtonHelperText( {
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
	self.bindButton:addEventHandler( "button_secondary", function ( f23_arg0, f23_arg1 )
		local f23_local0 = f23_arg1.controller or f9_local1
		ACTIONS.LeaveMenu( self )
	end )
	PostLoadFunc( self, f9_local1, controller )
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

MenuBuilder.registerType( "CosmeticAttachmentSelect", CosmeticAttachmentSelect )
LUI.FlowManager.RegisterStackPopBehaviour( "CosmeticAttachmentSelect", PopFunc )
LockTable( _M )
