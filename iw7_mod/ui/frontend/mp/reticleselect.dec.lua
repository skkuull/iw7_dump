local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "frontEnd.MP.CAC.weaponPersonalize.reticles"
f0_local1 = {}
function PopFunc()
	WipeGlobalModelsAtPath( f0_local0 )
	f0_local1 = {}
end

function PostLoadFunc( f2_arg0, f2_arg1, f2_arg2 )
	assert( f2_arg0.ShowcaseLock )
	if CONDITIONS.IsCoreMultiplayer( f2_arg0 ) then
		assert( f2_arg0.ChallengeProgress )
	end
	assert( f2_arg2 )
	f2_arg0.opticDataSource = f2_arg2.opticDataSource
	f2_arg0.weaponDataSource = f2_arg2.weaponDataSource
	local f2_local0 = f2_arg2.opticDataSource.ref:GetValue( f2_arg1 )
	f2_arg0:SetDataSource( f2_arg2.opticDataSource, f2_arg1 )
	if Engine.IsCoreMode() then
		FrontEndScene.SetTeamAndScene( "loadout_select", f2_arg1 )
	end
	local f2_local1 = Cac.GetOpticRefForWeapon( f2_local0, f2_arg0.weaponDataSource.ref:GetValue( f2_arg1 ), f2_arg0.weaponDataSource.variantID:GetValue( f2_arg1 ) )
	local f2_local2 = LOADOUT.GetAvailableReticleData( f2_local1 )
	local f2_local3 = {
		file = CSV.reticleChallengeMap.file,
		cols = {
			equipmentRef = CSV.reticleChallengeMap.cols.opticRef,
			itemRef = CSV.reticleChallengeMap.cols.reticleRef,
			challengeRef = CSV.reticleChallengeMap.cols.challengeRef,
			challengeTier = CSV.reticleChallengeMap.cols.challengeTier
		}
	}
	local f2_local4 = LOADOUT.MakePersonalizationItemsListDataSource( f0_local0, f2_local2, {
		equipmentRef = f2_local1,
		currentlyEquippedItemDataSource = f2_arg0.weaponDataSource.reticleInfo,
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
			missionTeam = "MENU_MISSION_TEAMS",
			extra = "MENU_EXTRAS"
		},
		categoriesToShowChallengeDataFor = {
			mp = true
		},
		controllerIndex = f2_arg1,
		challengeMap = f2_local3,
		allItemsChallengeData = f0_local1,
		isUnlockedFunc = function ( f3_arg0 )
			if f3_arg0.unlockType == "loot" then
				local f3_local0 = Engine.TableLookup( CSV.cosmeticReticlesLootMaster.file, CSV.cosmeticReticlesLootMaster.cols.ref, f3_arg0.ref, CSV.cosmeticReticlesLootMaster.cols.index )
				if f3_local0 ~= nil and #f3_local0 > 0 then
					if CONDITIONS.IsSystemLink( f2_arg0 ) and Engine.IsCoreMode() and tonumber( Engine.TableLookup( CSV.cosmeticReticlesLootMaster.file, CSV.cosmeticReticlesLootMaster.cols.ref, f3_arg0.ref, CSV.cosmeticReticlesLootMaster.cols.cost ) ) ~= 0 then
						return true
					else
						return Loot.IsOwned( f2_arg1, tonumber( f3_local0 ) ) >= 1
					end
				else
					return true
				end
			end
			local f3_local0 = Engine.IsAliensMode()
			if f3_local0 then
				f3_local0 = not CONDITIONS.IsSystemLink( f2_arg0 )
			end
			return Engine.IsUnlocked( f2_arg1, "reticle", f2_local1 .. "+" .. f3_arg0.ref, f3_local0 )
		end,
		getQualityFunc = function ( f4_arg0 )
			return Cac.GetLootQualityFromFile( CSV.cosmeticReticlesLootMaster, f4_arg0, f4_arg0.ref )
		end
	}, f0_local1 )
	if f2_local4 then
		f2_arg0.CategoriesTabs.Tabs:SetTabManagerDataSource( f2_local4 )
		f2_arg0.PersonalizeItemGrid.ItemGrid:SetGridDataSourceThroughElement( f2_arg0.CategoriesTabs.Tabs, "items" )
	else
		f2_arg0.CategoriesTabs:closeTree()
	end
	f2_arg0.reticleActive = true
	f2_arg0:addEventHandler( "close_item_selection", function ( f5_arg0, f5_arg1 )
		ACTIONS.LeaveMenu( f2_arg0 )
	end )
	local f2_local5 = {
		ref = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".challenge.ref", "" ),
		tierIndex = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".challenge.tierIndex", 0 ),
		desc = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".challenge.desc", "" ),
		currentProgress = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".challenge.currentProgress", 0 ),
		currentTierMax = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".challenge.currentTierMax", 0 ),
		challengeUnlocked = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".challenge.challengeUnlocked", false )
	}
	if CONDITIONS.IsCoreMultiplayer( f2_arg0 ) then
		f2_arg0.ChallengeProgress:SetDataSource( f2_local5, f2_arg1 )
	end
	f2_arg0:addEventHandler( "selection_changed", function ( f6_arg0, f6_arg1 )
		assert( f6_arg1.newSelection )
		local f6_local0 = f6_arg1.newSelection:GetDataSource( f2_arg1 )
		f6_local0 = f6_local0.ref:GetValue( f2_arg1 )
		local f6_local1 = CSV.ReadRow( CSV.reticles, Engine.TableLookupGetRowNum( CSV.reticles.file, CSV.reticles.cols.ref, f6_local0 ) )
		assert( f2_arg0.CACItemHeader.ItemName )
		assert( f2_arg0.CACItemHeader.ItemDescription )
		assert( f2_arg0.ReticleImage )
		f2_arg0.CACItemHeader.ItemName:setText( ToUpperCase( Engine.Localize( f6_local1.name ) ) )
		f2_arg0.CACItemHeader.ItemDescription:setText( ToUpperCase( Engine.Localize( f6_local1.desc ) ) )
		f2_arg0.ReticleImage:setImage( RegisterMaterial( f6_local1.image ), 0 )
		f2_arg0.CACItemHeader:UpdateRarityInfo( f6_arg1.newSelection:GetDataSource( f2_arg1 ) )
		if f6_local1.category == "mp" then
			local f6_local2 = Challenge.GetPersonalizationItemChallengeData( f2_local1, f6_local0, f0_local1, f2_local3, f2_arg1 )
			if f6_local2 and f6_local2.ref and f6_local2.tierIndex and f6_local2.desc and f6_local2.currentProgress and f6_local2.currentTierMax then
				f2_local5.ref:SetValue( f2_arg1, f6_local2.ref )
				f2_local5.tierIndex:SetValue( f2_arg1, f6_local2.tierIndex )
				local f6_local3 = Engine.IsUnlocked( f2_arg1, "challenge", f6_local2.ref )
				f2_local5.challengeUnlocked:SetValue( f2_arg1, f6_local3 )
				if f6_local3 then
					f2_local5.desc:SetValue( f2_arg1, f6_local2.desc )
				else
					f2_local5.desc:SetValue( f2_arg1, GetChallengeUnlockText( f6_local2.ref ) )
				end
				f2_local5.currentProgress:SetValue( f2_arg1, f6_local2.currentProgress )
				f2_local5.currentTierMax:SetValue( f2_arg1, f6_local2.currentTierMax )
				if CONDITIONS.IsCoreMultiplayer( f2_arg0 ) then
					f2_arg0.ChallengeProgress:SetAlpha( 1, 0 )
				end
			elseif CONDITIONS.IsCoreMultiplayer( f2_arg0 ) then
				f2_arg0.ChallengeProgress:SetAlpha( 0, 0 )
			end
		elseif CONDITIONS.IsCoreMultiplayer( f2_arg0 ) then
			f2_arg0.ChallengeProgress:SetAlpha( 0, 0 )
		end
		local f6_local2 = f6_arg1.newSelection:GetDataSource( f2_arg1 )
		if f6_local2.isUnlocked:GetValue( f2_arg1 ) == true then
			ACTIONS.AnimateSequence( f2_arg0, "ShowReticle" )
			ACTIONS.AnimateSequence( f2_arg0, "HideCriteria" )
			ACTIONS.AnimateSequence( f2_arg0.ShowcaseLock, "HideCriteria" )
		else
			if f6_local1.category ~= "extra" then
				f2_arg0.UnlockCriteria.UnlockDesc:setText( Engine.Localize( f6_local1.customUnlockString ) )
				ACTIONS.AnimateSequence( f2_arg0, "ShowCriteria" )
			end
			ACTIONS.AnimateSequence( f2_arg0, "HideReticle" )
			ACTIONS.AnimateSequence( f2_arg0.ShowcaseLock, "ShowCriteria" )
		end
	end )
	f2_arg0.bindButton:addEventHandler( "button_alt1", function ( f7_arg0, f7_arg1 )
		Engine.PlaySound( "ui_select_alt" )
		ACTIONS.RemoveReticle( f2_arg0, f2_arg1 )
	end )
end

function ReticleSelect( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "ReticleSelect"
	self._animationSets = {}
	self._sequences = {}
	local f8_local1 = controller and controller.controllerIndex
	if not f8_local1 and not Engine.InFrontend() then
		f8_local1 = self:getRootController()
	end
	assert( f8_local1 )
	self:playSound( "menu_open" )
	local f8_local2 = self
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f8_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local SocialFeed = nil
	
	SocialFeed = MenuBuilder.BuildRegisteredType( "SocialFeed", {
		controllerIndex = f8_local1
	} )
	SocialFeed.id = "SocialFeed"
	SocialFeed:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -115, _1080p * -85 )
	self:addElement( SocialFeed )
	self.SocialFeed = SocialFeed
	
	local f8_local5 = nil
	if CONDITIONS.IsMultiplayer( self ) then
		f8_local5 = LUI.UIImage.new()
		f8_local5.id = "ReticleImage"
		f8_local5:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1135, _1080p * 1489, _1080p * 402, _1080p * 756 )
		self:addElement( f8_local5 )
		self.ReticleImage = f8_local5
	end
	local PersonalizeItemGrid = nil
	
	PersonalizeItemGrid = MenuBuilder.BuildRegisteredType( "PersonalizeItemGrid", {
		controllerIndex = f8_local1
	} )
	PersonalizeItemGrid.id = "PersonalizeItemGrid"
	PersonalizeItemGrid:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 97, _1080p * 713, _1080p * 216, _1080p * 846 )
	self:addElement( PersonalizeItemGrid )
	self.PersonalizeItemGrid = PersonalizeItemGrid
	
	local CACItemHeader = nil
	
	CACItemHeader = MenuBuilder.BuildRegisteredType( "CACItemHeader", {
		controllerIndex = f8_local1
	} )
	CACItemHeader.id = "CACItemHeader"
	CACItemHeader.Background:SetRGBFromInt( 6710886, 0 )
	CACItemHeader.ItemDescription:SetRight( _1080p * 750, 0 )
	CACItemHeader.ItemDescription:setText( ToUpperCase( "Reticle Description" ), 0 )
	CACItemHeader.ItemName:setText( ToUpperCase( "Reticle Name" ), 0 )
	CACItemHeader.ItemName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	CACItemHeader:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 736, 0, _1080p * 216, _1080p * 316 )
	self:addElement( CACItemHeader )
	self.CACItemHeader = CACItemHeader
	
	local f8_local8 = nil
	if CONDITIONS.IsCoreMultiplayer( self ) then
		f8_local8 = MenuBuilder.BuildRegisteredType( "MenuTitle", {
			controllerIndex = f8_local1
		} )
		f8_local8.id = "MenuTitle"
		f8_local8.MenuTitle:setText( ToUpperCase( Engine.Localize( "MENU_RETICLE_CAPS" ) ), 0 )
		f8_local8.MenuBreadcrumbs:setText( ToUpperCase( Engine.Localize( "MENU_MULTIPLAYER" ) ), 0 )
		f8_local8.Icon:SetTop( _1080p * -28.5, 0 )
		f8_local8.Icon:SetBottom( _1080p * 61.5, 0 )
		f8_local8:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
		self:addElement( f8_local8 )
		self.MenuTitle = f8_local8
	end
	local f8_local9 = nil
	if CONDITIONS.IsThirdGameMode( self ) then
		f8_local9 = MenuBuilder.BuildRegisteredType( "CPMenuTitle", {
			controllerIndex = f8_local1
		} )
		f8_local9.id = "CPMenuTitle"
		f8_local9.MenuTitle:setText( Engine.Localize( "MENU_RETICLE_CAPS" ), 0 )
		f8_local9:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
		self:addElement( f8_local9 )
		self.CPMenuTitle = f8_local9
	end
	local CategoriesTabs = nil
	
	CategoriesTabs = MenuBuilder.BuildRegisteredType( "SubMenuTabsBar", {
		controllerIndex = f8_local1
	} )
	CategoriesTabs.id = "CategoriesTabs"
	CategoriesTabs:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 310, _1080p * 1610, _1080p * 154, _1080p * 194 )
	self:addElement( CategoriesTabs )
	self.CategoriesTabs = CategoriesTabs
	
	local f8_local11 = nil
	if CONDITIONS.IsCoreMultiplayer( self ) then
		f8_local11 = MenuBuilder.BuildRegisteredType( "ChallengeProgressWithRadialBar", {
			controllerIndex = f8_local1
		} )
		f8_local11.id = "ChallengeProgress"
		f8_local11:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 736, _1080p * 1886, _1080p * 805, _1080p * 991 )
		self:addElement( f8_local11 )
		self.ChallengeProgress = f8_local11
	end
	local ShowcaseLock = nil
	
	ShowcaseLock = MenuBuilder.BuildRegisteredType( "ShowcaseLock", {
		controllerIndex = f8_local1
	} )
	ShowcaseLock.id = "ShowcaseLock"
	ShowcaseLock:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 93.5, _1080p * 610.5, _1080p * 320.5, _1080p * 837.5 )
	self:addElement( ShowcaseLock )
	self.ShowcaseLock = ShowcaseLock
	
	local MissionTeamInfo = nil
	
	MissionTeamInfo = MenuBuilder.BuildRegisteredType( "MissionTeamInfo", {
		controllerIndex = f8_local1
	} )
	MissionTeamInfo.id = "MissionTeamInfo"
	MissionTeamInfo:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -700, 0, _1080p * 54, _1080p * 142 )
	self:addElement( MissionTeamInfo )
	self.MissionTeamInfo = MissionTeamInfo
	
	local UnlockCriteria = nil
	
	UnlockCriteria = MenuBuilder.BuildRegisteredType( "UnlockCriteria", {
		controllerIndex = f8_local1
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
		
		if CONDITIONS.IsMultiplayer( self ) then
			f8_local5:RegisterAnimationSequence( "HideReticle", {
				{
					function ()
						return self.ReticleImage:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		self._sequences.HideReticle = function ()
			if CONDITIONS.IsMultiplayer( self ) then
				f8_local5:AnimateSequence( "HideReticle" )
			end
		end
		
		if CONDITIONS.IsMultiplayer( self ) then
			f8_local5:RegisterAnimationSequence( "ShowReticle", {
				{
					function ()
						return self.ReticleImage:SetAlpha( 1, 200 )
					end
				}
			} )
		end
		self._sequences.ShowReticle = function ()
			if CONDITIONS.IsMultiplayer( self ) then
				f8_local5:AnimateSequence( "ShowReticle" )
			end
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
					return self.UnlockCriteria:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 740, _1080p * 1178, _1080p * 345, _1080p * 375, 0 )
				end,
				function ()
					return self.UnlockCriteria:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 740, _1080p * 1178, _1080p * 330, _1080p * 360, 100 )
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
	self.addButtonHelperFunction = function ( f24_arg0, f24_arg1 )
		f24_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_SELECT" ),
			button_ref = "button_primary",
			side = "left",
			clickable = true
		} )
		f24_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			priority = 1,
			clickable = true
		} )
		f24_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_REMOVE" ),
			button_ref = "button_alt1",
			side = "left",
			priority = 2
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
	self.bindButton:addEventHandler( "button_secondary", function ( f26_arg0, f26_arg1 )
		local f26_local0 = f26_arg1.controller or f8_local1
		ACTIONS.LeaveMenu( self )
	end )
	PostLoadFunc( self, f8_local1, controller )
	if CONDITIONS.IsThirdGameMode( self ) then
		ACTIONS.AnimateSequence( self, "CPInit" )
	end
	return self
end

MenuBuilder.registerType( "ReticleSelect", ReticleSelect )
LUI.FlowManager.RegisterStackPopBehaviour( "ReticleSelect", PopFunc )
LockTable( _M )
