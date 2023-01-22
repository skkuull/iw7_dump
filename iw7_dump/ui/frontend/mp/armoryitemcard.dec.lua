local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "frontEnd.MP.armory.craftingData"
function PopFunc()
	WipeGlobalModelsAtPath( f0_local0 )
end

f0_local1 = function ( f2_arg0, f2_arg1 )
	local f2_local0 = LUI.DataSourceFromList.new( #f2_arg0 )
	f2_local0.GetDataSourceAtIndex = function ( f3_arg0, f3_arg1, f3_arg2 )
		local f3_local0 = f2_arg0[f3_arg1 + 1]
		return {
			passive = {
				name = f3_local0.name,
				desc = f2_arg1 and f3_local0.streakDesc or f3_local0.weaponDesc,
				image = f3_local0.image
			},
			showDescription = true
		}
	end
	
	return f2_local0
end

f0_local2 = function ( f4_arg0, f4_arg1 )
	f4_arg0.UnlockMessage:SetAlpha( 0, 0 )
	f4_arg0.CostText:SetAlpha( 0, 0 )
	f4_arg0.ScrapImage:SetAlpha( 0, 0 )
	f4_arg0.CostAmount:SetAlpha( 0, 0 )
	f4_arg0.WeaponStatus:SetAlpha( 0, 0 )
	f4_arg0.LockIcon:SetAlpha( 0, 0 )
	f4_arg0.WeaponLockedTillLevel:SetAlpha( 0, 0 )
	f4_arg0.CommonIcon:SetAlpha( 0, 0 )
	f4_arg0.RareIcon:SetAlpha( 0, 0 )
	f4_arg0.LegendaryIcon:SetAlpha( 0, 0 )
	f4_arg0.ItemCardLongImage.UnavailableOverlay:SetAlpha( 0, 0 )
	f4_arg0.CraftWeaponMessage:SetAlpha( 0, 0 )
	f4_arg0.WeaponLockedTillLevel:setText( f4_arg1 )
end

local f0_local3 = function ( f5_arg0, f5_arg1, f5_arg2, f5_arg3, f5_arg4, f5_arg5 )
	if f5_arg1 then
		f5_arg0.WeaponStatus:SetAlpha( 1, 0 )
		f5_arg0.ItemCardLongImage.UnavailableOverlay:SetAlpha( 0, 0 )
		if f5_arg2 then
			f5_arg0.WeaponStatus:setText( Engine.Localize( "LUA_MENU_MP_ARMORY_WEAPON_UNLOCKED" ) )
		else
			f5_arg0.WeaponStatus:setText( Engine.Localize( "LUA_MENU_MP_ARMORY_WEAPON_CRAFTED" ) )
			f5_arg0.LockIcon:SetAlpha( 1, 0 )
			f5_arg0.WeaponLockedTillLevel:SetAlpha( 1, 0 )
		end
	elseif f5_arg4.canCraft then
		f5_arg0.ItemCardLongImage.UnavailableOverlay:SetAlpha( 1, 0 )
		if not f5_arg2 then
			f5_arg0.LockIcon:SetAlpha( 1, 0 )
			f5_arg0.WeaponLockedTillLevel:SetAlpha( 1, 0 )
		end
		f5_arg0.CostText:SetAlpha( 1, 0 )
		f5_arg0.ScrapImage:SetAlpha( 1, 0 )
		f5_arg0.CostAmount:SetAlpha( 1, 0 )
	else
		f5_arg0.ItemCardLongImage.UnavailableOverlay:SetAlpha( 1, 0 )
		f5_arg0.UnlockMessage:SetAlpha( 1, 0 )
		local f5_local0 = {}
		local f5_local1 = {
			f5_arg0.CommonIcon,
			f5_arg0.RareIcon,
			f5_arg0.LegendaryIcon
		}
		for f5_local2 = 1, 3, 1 do
			if not f5_arg4.qualitiesOwned[f5_local2] and f5_arg4.qualitiesExist[f5_local2] and f5_local2 < f5_arg3.quality then
				table.insert( f5_local0, f5_local1[f5_local2] )
			end
		end
		if #f5_local0 == 1 then
			f5_local0[1]:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, -16 * _1080p, 16 * _1080p, 623 * _1080p, 655 * _1080p )
			f5_local0[1]:SetAlpha( 1, 0 )
		elseif #f5_local0 == 2 then
			f5_local0[1]:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, -37 * _1080p, -5 * _1080p, 623 * _1080p, 655 * _1080p )
			f5_local0[2]:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, 5 * _1080p, 37 * _1080p, 623 * _1080p, 655 * _1080p )
			f5_local0[1]:SetAlpha( 1, 0 )
			f5_local0[2]:SetAlpha( 1, 0 )
		elseif #f5_local0 == 3 then
			f5_local0[1]:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, -62 * _1080p, -30 * _1080p, 623 * _1080p, 655 * _1080p )
			f5_local0[2]:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, -16 * _1080p, 16 * _1080p, 623 * _1080p, 655 * _1080p )
			f5_local0[3]:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, 30 * _1080p, 62 * _1080p, 623 * _1080p, 655 * _1080p )
			f5_local0[1]:SetAlpha( 1, 0 )
			f5_local0[2]:SetAlpha( 1, 0 )
			f5_local0[3]:SetAlpha( 1, 0 )
		end
		f5_arg0.CraftWeaponMessage:setText( Engine.Localize( "LUA_MENU_MP_ARMORY_RARITIES_REQUIRED", f5_arg5 ) )
		f5_arg0.CraftWeaponMessage:SetAlpha( 1, 0 )
	end
end

local f0_local4 = function ( f6_arg0, f6_arg1, f6_arg2 )
	WipeGlobalModelsAtPath( f0_local0 )
	local f6_local0 = Cac.GetLootRef( f6_arg1 )
	local f6_local1 = Cac.GetBaseWeaponRefFromLootID( f6_arg1 )
	local f6_local2 = Cac.IsLootWeaponOwned( f6_local0, f6_arg2 )
	local f6_local3 = Cac.IsBaseWeaponUnlockedMode( f6_local1, f6_arg2 )
	local f6_local4 = Engine.TableLookup( CSV.weaponLootMaster.file, CSV.weaponLootMaster.cols.index, f6_arg1, CSV.weaponLootMaster.cols.missionTeam )
	if f6_local4 == MissionDirector.teamRnGValue and not ARMORY.IsWeaponRnG( f6_arg1, f6_local4 ) then
		f6_local3 = true
	end
	local f6_local5 = Rank.GetRankDisplay( Cac.GetBaseWeaponUnlockRank( f6_local1 ) )
	local f6_local6 = Cac.GetLootWeaponCost( f6_local0 )
	local f6_local7 = LOOT.GetLootData( f6_arg1 )
	f6_local7.baseWeaponRef = Cac.GetBaseWeaponRefFromLootID( f6_arg1 )
	local f6_local8 = nil
	if f6_arg0._useSuffix then
		f6_local8 = Engine.Localize( f6_local7.suffix )
	else
		f6_local8 = Engine.Localize( f6_local7.displayName )
	end
	assert( f6_local7.displayImage )
	assert( f6_local7.quality )
	f6_local7.quality = tonumber( f6_local7.quality )
	local f6_local9 = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".weaponID", f6_arg1 )
	local f6_local10 = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".baseWeaponRef", f6_local1 )
	local f6_local11 = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".noneAttachment", "none" )
	f6_arg0:SetDataSource( {
		name = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".name", f6_local8 ),
		cost = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".cost", f6_local6 ),
		image = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".image", f6_local7.displayImage ),
		quality = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".quality", f6_local7.quality ),
		qualityString = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".qualityString", Cac.GetLootQualityString( f6_local7.quality ) ),
		qualityColor = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".qualityColor", Cac.GetLootQualityColor( f6_local7.quality ) ),
		qualityImage = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".qualityImage", Cac.GetLootQualityImage( f6_local7.quality ) ),
		weaponStats = {
			weaponLootID = f6_local9,
			baseWeaponRef = f6_local10,
			weaponRef = f6_local10,
			attachmentOneRef = f6_local11,
			attachmentTwoRef = f6_local11,
			attachmentThreeRef = f6_local11,
			attachmentFourRef = f6_local11,
			attachmentFiveRef = f6_local11,
			attachmentSixRef = f6_local11
		},
		passives = f0_local1( Cac.GetPassivesForWeapon( f6_local0, f6_arg1 ) )
	}, f6_arg2 )
	local f6_local12 = nil
	if not (Engine.TableLookup( CSV.weapons.file, CSV.weapons.cols.ref, f6_local1, CSV.weapons.cols.postLaunch ) == "1") then
		if Engine.IsAliensMode() then
			f6_local12 = Engine.Localize( "LUA_MENU_MP_ARMORY_AVAILABLE_AT_ZOMBIE_LEVEL", f6_local5 )
		else
			f6_local12 = Engine.Localize( "LUA_MENU_MP_ARMORY_AVAILABLE_AT_LEVEL", f6_local5 )
		end
	else
		f6_local12 = GetWeaponUnlockText( f6_local1 )
	end
	f0_local2( f6_arg0, f6_local12 )
	local f6_local13 = Loot.CraftDetails( f6_arg2, f6_arg1 )
	local f6_local14 = LUI.FlowManager.GetScopedData( f6_arg0 )
	assert( f6_local14.context )
	if f6_local14.context == ARMORY.inventoryContext.PROTOTYPE then
		f0_local3( f6_arg0, f6_local2, f6_local3, f6_local7, f6_local13, f6_local8 )
	elseif f6_local14.context == ARMORY.inventoryContext.MISSION_TEAM then
		local f6_local15 = Cac.GetMissionTeamWeaponLevel( f6_local0 )
		if f6_local3 then
			f6_arg0.WeaponLockedTillLevel:SetAlpha( 0, 0 )
			f6_arg0.LockIcon:SetAlpha( 0, 0 )
		else
			f6_arg0.WeaponLockedTillLevel:SetAlpha( 1, 0 )
			f6_arg0.LockIcon:SetAlpha( 1, 0 )
		end
		if f6_local2 then
			f6_arg0.ItemCardLongImage.UnavailableOverlay:SetAlpha( 0, 0 )
			f6_arg0.WeaponStatus:SetAlpha( 1, 0 )
			f6_arg0.WeaponStatus:setText( Engine.Localize( "MENU_UNLOCKED" ) )
		else
			f6_arg0.WeaponStatus:SetAlpha( 1, 0 )
			f6_arg0.WeaponStatus:setText( Engine.Localize( "LUA_MENU_MP_UNLOCK_LEVEL", f6_local15 ) )
		end
	elseif f6_local14.context == ARMORY.inventoryContext.QUARTERMASTER then
		if CONDITIONS.IsCoreMultiplayer( f6_arg0 ) then
			f6_arg0.ItemCardLongImage.UnavailableOverlay:setImage( RegisterMaterial( "inventory_loot_pattern" ), 0 )
		end
		if f6_local3 then
			f6_arg0.WeaponLockedTillLevel:SetAlpha( 0, 0 )
			f6_arg0.LockIcon:SetAlpha( 0, 0 )
		else
			f6_arg0.WeaponLockedTillLevel:SetAlpha( 1, 0 )
			f6_arg0.LockIcon:SetAlpha( 1, 0 )
		end
		if not f6_local2 then
			f6_arg0.UnlockMessage:SetAlpha( 1, 0 )
			f6_arg0.UnlockMessage:setText( Engine.Localize( "LUA_MENU_MP_UNLOCK_IN_DROP" ) )
			if not Engine.IsAliensMode() then
				f6_arg0.ItemCardLongImage.UnavailableOverlay:SetAlpha( 0.4, 0 )
			end
		else
			f6_arg0.ItemCardLongImage.UnavailableOverlay:SetAlpha( 0, 0 )
		end
	elseif f6_local14.context == ARMORY.inventoryContext.MK2 then
		assert( f6_arg0.ItemCardHeaderBackground.MK2 )
		assert( f6_arg0.ItemCardHeaderBackground.MK2Pattern )
		f6_arg0.ItemCardHeaderBackground.MK2:SetAlpha( 0.5, 0 )
		f6_arg0.ItemCardHeaderBackground.MK2Pattern:SetAlpha( 1, 0 )
		f6_arg0.ItemCardQuality:SubscribeToModelThroughElement( f6_arg0, "qualityImage", function ()
			local f7_local0 = f6_arg0:GetDataSource()
			f7_local0 = f7_local0.qualityImage:GetValue( f6_arg2 )
			if f7_local0 ~= nil then
				f6_arg0.ItemCardQuality.QualityIcon.IconDuplicate:setImage( RegisterMaterial( f7_local0 .. "_mk2" ), 0 )
			end
		end )
		ACTIONS.AnimateSequence( f6_arg0, "MK2Layout" )
		ACTIONS.AnimateSequence( f6_arg0.ItemCardQuality.QualityIcon, "LegendaryPulse" )
		if not f6_arg0.ItemCardLongImage.isPlayingMK2Highlight then
			f6_arg0.ItemCardLongImage.isPlayingMK2Highlight = true
			ACTIONS.AnimateSequence( f6_arg0.ItemCardLongImage, "MK2Highlight" )
		end
		if f6_local3 then
			f6_arg0.WeaponLockedTillLevel:SetAlpha( 0, 0 )
			f6_arg0.LockIcon:SetAlpha( 0, 0 )
		else
			f6_arg0.WeaponLockedTillLevel:SetAlpha( 1, 0 )
			f6_arg0.LockIcon:SetAlpha( 1, 0 )
		end
		if not f6_local2 then
			f6_arg0.UnlockMessage:SetAlpha( 1, 0 )
			f6_arg0.UnlockMessage:setText( Engine.Localize( "LUA_MENU_MP_UNLOCK_IN_DROP" ) )
		end
	end
	local f6_local15 = Cac.GetWeaponMk2BonusString( f6_arg2, f6_local1 )
	assert( f6_arg0.LootItemCardMk2Bonus )
	assert( f6_arg0.LootItemCardMk2Bonus.BonusText )
	f6_arg0.LootItemCardMk2Bonus.BonusText:setText( f6_local15 )
	ACTIONS.AnimateSequence( f6_arg0:GetCurrentMenu(), "UpdateCard" )
end

local f0_local5 = function ( f8_arg0, f8_arg1, f8_arg2 )
	WipeGlobalModelsAtPath( f0_local0 )
	local f8_local0 = LOOT.GetLootData( f8_arg1 )
	local f8_local1 = Cac.IsLootStreakOwned( f8_arg1, f8_arg2 )
	local f8_local2 = Cac.IsBaseStreakUnlocked( f8_local0.baseStreak, f8_arg2 )
	local f8_local3 = Rank.GetRankDisplay( Cac.GetStreakUnlockRank( f8_local0.baseStreak ) )
	local f8_local4 = Engine.Localize( f8_local0.suffix )
	f8_local0.quality = tonumber( f8_local0.quality )
	f8_arg0:SetDataSource( {
		name = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".name", f8_local4 ),
		cost = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".cost", f8_local0.cost ),
		image = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".image", f8_local0.displayImage ),
		quality = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".quality", f8_local0.quality ),
		qualityString = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".qualityString", Cac.GetLootQualityString( f8_local0.quality ) ),
		qualityColor = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".qualityColor", Cac.GetLootQualityColor( f8_local0.quality ) ),
		qualityImage = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".qualityImage", Cac.GetLootQualityImage( f8_local0.quality ) ),
		passives = f0_local1( Cac.GetPassivesForStreak( f8_arg1 ), true )
	}, f8_arg2 )
	f0_local2( f8_arg0, GetStreakUnlockText( f8_local0.baseStreak ) )
	ACTIONS.AnimateSequence( f8_arg0.ItemCardLongImage, "StreakRatio" )
	assert( f8_arg0.StreakCost )
	assert( f8_arg0.StreakCost.Description )
	f8_arg0.StreakCost.Description:setText( Engine.Localize( "LUA_MENU_SCORE_WITH_VALUE", f8_local0.pointsCost ) )
	f0_local3( f8_arg0, f8_local1, f8_local2, f8_local0, Loot.CraftDetails( f8_arg2, f8_arg1, true ), f8_local4 )
	ACTIONS.AnimateSequence( f8_arg0:GetCurrentMenu(), "UpdateCard" )
	f8_arg0.ItemCardPassives.Grid:processEvent( {
		name = "update_passive_width"
	} )
end

function PostLoadFunc( f9_arg0, f9_arg1, f9_arg2 )
	f9_arg0:addEventHandler( "menu_create", function ( f10_arg0, f10_arg1 )
		local f10_local0 = LUI.FlowManager.GetScopedData( f9_arg0 )
		assert( f10_local0.context )
		if f10_local0.context == ARMORY.inventoryContext.STREAK_PROTOTYPE then
			f9_arg0.ItemCardWeaponStatsPanel:closeTree()
			f9_arg0.ItemCardWeaponStatsPanel = nil
			f9_arg0.ItemCardPassives:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 400, _1080p * 280, _1080p * 580 )
			f9_arg0.StreakShadow:SetAlpha( 0.5, 0 )
		else
			f9_arg0.StreakCost:closeTree()
			f9_arg0.StreakCost = nil
		end
	end )
	f9_arg0.SetWeapon = f0_local4
	f9_arg0.SetStreak = f0_local5
	f9_arg0.SetUseSuffixAsTitle = function ( f11_arg0, f11_arg1 )
		f11_arg0._useSuffix = f11_arg1
	end
	
	f9_arg0:SetAlpha( 0, 0 )
end

function ArmoryItemCard( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 400 * _1080p, 0, 660 * _1080p )
	self.id = "ArmoryItemCard"
	self._animationSets = {}
	self._sequences = {}
	local f12_local1 = controller and controller.controllerIndex
	if not f12_local1 and not Engine.InFrontend() then
		f12_local1 = self:getRootController()
	end
	assert( f12_local1 )
	local f12_local2 = self
	local Blur = nil
	
	Blur = LUI.UIBlur.new()
	Blur.id = "Blur"
	Blur:SetRGBFromTable( SWATCHES.MPArmory.Background, 0 )
	Blur:SetBlurStrength( 2.75, 0 )
	Blur:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 580, _1080p * 660 )
	self:addElement( Blur )
	self.Blur = Blur
	
	local ItemCardPassives = nil
	
	ItemCardPassives = MenuBuilder.BuildRegisteredType( "ItemCardPassives", {
		controllerIndex = f12_local1
	} )
	ItemCardPassives.id = "ItemCardPassives"
	ItemCardPassives:SetDataSourceThroughElement( self, "passives" )
	ItemCardPassives.Grid:SetTop( _1080p * -75, 0 )
	ItemCardPassives.Grid:SetBottom( _1080p * 45, 0 )
	ItemCardPassives:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 400, _1080p * 280, _1080p * 460 )
	self:addElement( ItemCardPassives )
	self.ItemCardPassives = ItemCardPassives
	
	local ItemCardWeaponStatsPanel = nil
	
	ItemCardWeaponStatsPanel = MenuBuilder.BuildRegisteredType( "ItemCardWeaponStatsPanel", {
		controllerIndex = f12_local1
	} )
	ItemCardWeaponStatsPanel.id = "ItemCardWeaponStatsPanel"
	ItemCardWeaponStatsPanel:SetDataSourceThroughElement( self, "weaponStats" )
	ItemCardWeaponStatsPanel:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 400, _1080p * 460, _1080p * 580 )
	self:addElement( ItemCardWeaponStatsPanel )
	self.ItemCardWeaponStatsPanel = ItemCardWeaponStatsPanel
	
	local ItemCardLongImage = nil
	
	ItemCardLongImage = MenuBuilder.BuildRegisteredType( "ItemCardLongImage", {
		controllerIndex = f12_local1
	} )
	ItemCardLongImage.id = "ItemCardLongImage"
	ItemCardLongImage:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 400, _1080p * 80, _1080p * 230 )
	ItemCardLongImage:SubscribeToModelThroughElement( self, "qualityColor", function ()
		local f13_local0 = self:GetDataSource()
		f13_local0 = f13_local0.qualityColor:GetValue( f12_local1 )
		if f13_local0 ~= nil then
			ItemCardLongImage.Gradient:SetRGBFromInt( f13_local0, 0 )
		end
	end )
	ItemCardLongImage:SubscribeToModelThroughElement( self, "qualityColor", function ()
		local f14_local0 = self:GetDataSource()
		f14_local0 = f14_local0.qualityColor:GetValue( f12_local1 )
		if f14_local0 ~= nil then
			ItemCardLongImage.Highlight:SetRGBFromInt( f14_local0, 0 )
		end
	end )
	ItemCardLongImage:SubscribeToModelThroughElement( self, "image", function ()
		local f15_local0 = self:GetDataSource()
		f15_local0 = f15_local0.image:GetValue( f12_local1 )
		if f15_local0 ~= nil then
			ItemCardLongImage.LongImage:setImage( RegisterMaterial( f15_local0 ), 0 )
		end
	end )
	self:addElement( ItemCardLongImage )
	self.ItemCardLongImage = ItemCardLongImage
	
	local ItemCardHeaderBackground = nil
	ItemCardHeaderBackground = MenuBuilder.BuildRegisteredType( "ItemCardHeaderBackground", {
		controllerIndex = f12_local1
	} )
	ItemCardHeaderBackground.id = "ItemCardHeaderBackground"
	ItemCardHeaderBackground:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 400, 0, _1080p * 80 )
	ItemCardHeaderBackground:SubscribeToModelThroughElement( self, "qualityColor", function ()
		local f16_local0 = self:GetDataSource()
		f16_local0 = f16_local0.qualityColor:GetValue( f12_local1 )
		if f16_local0 ~= nil then
			ItemCardHeaderBackground.Blur:SetRGBFromInt( f16_local0, 0 )
		end
	end )
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() and CONDITIONS.IsMultiplayer( self ) then
		ItemCardHeaderBackground:SubscribeToModelThroughElement( self, "qualityColor", function ()
			local f17_local0 = self:GetDataSource()
			f17_local0 = f17_local0.qualityColor:GetValue( f12_local1 )
			if f17_local0 ~= nil then
				ItemCardHeaderBackground.Tab:SetRGBFromInt( f17_local0, 0 )
			end
		end )
	end
	if Engine.IsMultiplayer() then
		ItemCardHeaderBackground:SubscribeToModelThroughElement( self, "qualityColor", function ()
			local f18_local0 = self:GetDataSource()
			f18_local0 = f18_local0.qualityColor:GetValue( f12_local1 )
			if f18_local0 ~= nil then
				ItemCardHeaderBackground.MK2Pattern:SetRGBFromInt( f18_local0, 0 )
			end
		end )
	end
	self:addElement( ItemCardHeaderBackground )
	self.ItemCardHeaderBackground = ItemCardHeaderBackground
	
	local ItemCardName = nil
	
	ItemCardName = MenuBuilder.BuildRegisteredType( "ItemCardName", {
		controllerIndex = f12_local1
	} )
	ItemCardName.id = "ItemCardName"
	ItemCardName:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 20, _1080p * 299, _1080p * -3, _1080p * 40 )
	ItemCardName:SubscribeToModelThroughElement( self, "name", function ()
		local f19_local0 = self:GetDataSource()
		f19_local0 = f19_local0.name:GetValue( f12_local1 )
		if f19_local0 ~= nil then
			ItemCardName.Title:setText( f19_local0, 0 )
		end
	end )
	self:addElement( ItemCardName )
	self.ItemCardName = ItemCardName
	
	local ItemCardQuality = nil
	
	ItemCardQuality = MenuBuilder.BuildRegisteredType( "ItemCardQuality", {
		controllerIndex = f12_local1
	} )
	ItemCardQuality.id = "ItemCardQuality"
	ItemCardQuality:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 19, _1080p * 222, _1080p * 40, _1080p * 80 )
	ItemCardQuality:SubscribeToModelThroughElement( self, "qualityColor", function ()
		local f20_local0 = self:GetDataSource()
		f20_local0 = f20_local0.qualityColor:GetValue( f12_local1 )
		if f20_local0 ~= nil then
			ItemCardQuality.Rarity:SetRGBFromInt( f20_local0, 0 )
		end
	end )
	ItemCardQuality:SubscribeToModelThroughElement( self, "qualityString", function ()
		local f21_local0 = self:GetDataSource()
		f21_local0 = f21_local0.qualityString:GetValue( f12_local1 )
		if f21_local0 ~= nil then
			ItemCardQuality.Rarity:setText( ToUpperCase( f21_local0 ), 0 )
		end
	end )
	ItemCardQuality:SubscribeToModelThroughElement( self, "qualityColor", function ()
		local f22_local0 = self:GetDataSource()
		f22_local0 = f22_local0.qualityColor:GetValue( f12_local1 )
		if f22_local0 ~= nil then
			ItemCardQuality.QualityIcon.Icon:SetRGBFromInt( f22_local0, 0 )
		end
	end )
	ItemCardQuality:SubscribeToModelThroughElement( self, "qualityImage", function ()
		local f23_local0 = self:GetDataSource()
		f23_local0 = f23_local0.qualityImage:GetValue( f12_local1 )
		if f23_local0 ~= nil then
			ItemCardQuality.QualityIcon.Icon:setImage( RegisterMaterial( f23_local0 ), 0 )
		end
	end )
	ItemCardQuality:SubscribeToModelThroughElement( self, "qualityColor", function ()
		local f24_local0 = self:GetDataSource()
		f24_local0 = f24_local0.qualityColor:GetValue( f12_local1 )
		if f24_local0 ~= nil then
			ItemCardQuality.QualityIcon.IconDuplicate:SetRGBFromInt( f24_local0, 0 )
		end
	end )
	self:addElement( ItemCardQuality )
	self.ItemCardQuality = ItemCardQuality
	
	local CraftWeaponMessage = nil
	
	CraftWeaponMessage = LUI.UIText.new()
	CraftWeaponMessage.id = "CraftWeaponMessage"
	CraftWeaponMessage:setText( "Rarities Required to craft <WEAPON NAME>", 0 )
	CraftWeaponMessage:SetFontSize( 18 * _1080p )
	CraftWeaponMessage:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	CraftWeaponMessage:SetAlignment( LUI.Alignment.Center )
	CraftWeaponMessage:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 9, _1080p * -9, _1080p * 585.5, _1080p * 603.5 )
	self:addElement( CraftWeaponMessage )
	self.CraftWeaponMessage = CraftWeaponMessage
	
	local LegendaryIcon = nil
	
	LegendaryIcon = LUI.UIImage.new()
	LegendaryIcon.id = "LegendaryIcon"
	LegendaryIcon:SetRGBFromTable( SWATCHES.itemRarity.quality2, 0 )
	LegendaryIcon:setImage( RegisterMaterial( "icon_item_quality_3" ), 0 )
	LegendaryIcon:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 30, _1080p * 62, _1080p * 623, _1080p * 655 )
	self:addElement( LegendaryIcon )
	self.LegendaryIcon = LegendaryIcon
	
	local CommonIcon = nil
	
	CommonIcon = LUI.UIImage.new()
	CommonIcon.id = "CommonIcon"
	CommonIcon:SetRGBFromTable( SWATCHES.itemRarity.quality0, 0 )
	CommonIcon:setImage( RegisterMaterial( "icon_item_quality_1" ), 0 )
	CommonIcon:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -62, _1080p * -30, _1080p * 623, _1080p * 655 )
	self:addElement( CommonIcon )
	self.CommonIcon = CommonIcon
	
	local RareIcon = nil
	
	RareIcon = LUI.UIImage.new()
	RareIcon.id = "RareIcon"
	RareIcon:SetRGBFromTable( SWATCHES.itemRarity.quality1, 0 )
	RareIcon:setImage( RegisterMaterial( "icon_item_quality_2" ), 0 )
	RareIcon:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -16, _1080p * 16, _1080p * 623, _1080p * 655 )
	self:addElement( RareIcon )
	self.RareIcon = RareIcon
	
	local WeaponLockedTillLevel = nil
	
	WeaponLockedTillLevel = LUI.UIText.new()
	WeaponLockedTillLevel.id = "WeaponLockedTillLevel"
	WeaponLockedTillLevel:setText( "Available to Equip at Player Level XX", 0 )
	WeaponLockedTillLevel:SetFontSize( 18 * _1080p )
	WeaponLockedTillLevel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	WeaponLockedTillLevel:SetAlignment( LUI.Alignment.Center )
	WeaponLockedTillLevel:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 9, _1080p * -9, _1080p * 585.5, _1080p * 603.5 )
	self:addElement( WeaponLockedTillLevel )
	self.WeaponLockedTillLevel = WeaponLockedTillLevel
	
	local LockIcon = nil
	
	LockIcon = LUI.UIImage.new()
	LockIcon.id = "LockIcon"
	LockIcon:setImage( RegisterMaterial( "icon_slot_locked" ), 0 )
	LockIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 184, _1080p * 216, _1080p * 623, _1080p * 655 )
	self:addElement( LockIcon )
	self.LockIcon = LockIcon
	
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromTable( SWATCHES.MPArmory.MessageBackground, 0 )
	Background:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 230, _1080p * 280 )
	self:addElement( Background )
	self.Background = Background
	
	local UnlockMessage = nil
	
	UnlockMessage = LUI.UIText.new()
	UnlockMessage.id = "UnlockMessage"
	UnlockMessage:setText( Engine.Localize( "LUA_MENU_MP_ARMORY_UNLOCK_MSG" ), 0 )
	UnlockMessage:SetFontSize( 18 * _1080p )
	UnlockMessage:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	UnlockMessage:SetAlignment( LUI.Alignment.Center )
	UnlockMessage:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 45, _1080p * -45, _1080p * 238, _1080p * 256 )
	self:addElement( UnlockMessage )
	self.UnlockMessage = UnlockMessage
	
	local CostText = nil
	
	CostText = LUI.UIText.new()
	CostText.id = "CostText"
	CostText:setText( Engine.Localize( "LUA_MENU_COST" ), 0 )
	CostText:SetFontSize( 28 * _1080p )
	CostText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	CostText:SetAlignment( LUI.Alignment.Right )
	CostText:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 75.5, _1080p * -212.5, _1080p * 241, _1080p * 269 )
	self:addElement( CostText )
	self.CostText = CostText
	
	local ScrapImage = nil
	
	ScrapImage = LUI.UIImage.new()
	ScrapImage.id = "ScrapImage"
	ScrapImage:setImage( RegisterMaterial( "currency_parts_icon" ), 0 )
	ScrapImage:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 192.42, _1080p * 236.42, _1080p * 233, _1080p * 277 )
	self:addElement( ScrapImage )
	self.ScrapImage = ScrapImage
	
	local CostAmount = nil
	
	CostAmount = LUI.UIText.new()
	CostAmount.id = "CostAmount"
	CostAmount:SetFontSize( 22 * _1080p )
	CostAmount:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	CostAmount:SetAlignment( LUI.Alignment.Left )
	CostAmount:SetOptOutRightToLeftAlignmentFlip( true )
	CostAmount:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 232.42, _1080p * -55.58, _1080p * 244, _1080p * 266 )
	CostAmount:SubscribeToModelThroughElement( self, "cost", function ()
		local f25_local0 = self:GetDataSource()
		f25_local0 = f25_local0.cost:GetValue( f12_local1 )
		if f25_local0 ~= nil then
			CostAmount:setText( f25_local0, 0 )
		end
	end )
	self:addElement( CostAmount )
	self.CostAmount = CostAmount
	
	local WeaponStatus = nil
	
	WeaponStatus = LUI.UIText.new()
	WeaponStatus.id = "WeaponStatus"
	WeaponStatus:setText( "Equip Weapon", 0 )
	WeaponStatus:SetFontSize( 26 * _1080p )
	WeaponStatus:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	WeaponStatus:SetAlignment( LUI.Alignment.Center )
	WeaponStatus:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 242, _1080p * 268 )
	self:addElement( WeaponStatus )
	self.WeaponStatus = WeaponStatus
	
	local DropShadow = nil
	
	DropShadow = LUI.UIImage.new()
	DropShadow.id = "DropShadow"
	DropShadow:SetRGBFromInt( 0, 0 )
	DropShadow:SetAlpha( 0.3, 0 )
	DropShadow:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
	DropShadow:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, 0, _1080p * 4 )
	self:addElement( DropShadow )
	self.DropShadow = DropShadow
	
	local StreakCost = nil
	
	StreakCost = MenuBuilder.BuildRegisteredType( "ArmoryCardStreakCost", {
		controllerIndex = f12_local1
	} )
	StreakCost.id = "StreakCost"
	StreakCost:SetAlpha( 0, 0 )
	StreakCost:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 400, _1080p * 460, _1080p * 580 )
	self:addElement( StreakCost )
	self.StreakCost = StreakCost
	
	local LootItemCardMk2Bonus = nil
	
	LootItemCardMk2Bonus = MenuBuilder.BuildRegisteredType( "LootItemCardMk2Bonus", {
		controllerIndex = f12_local1
	} )
	LootItemCardMk2Bonus.id = "LootItemCardMk2Bonus"
	LootItemCardMk2Bonus:SetAlpha( 0, 0 )
	LootItemCardMk2Bonus:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 400, _1080p * 230, _1080p * 255 )
	LootItemCardMk2Bonus:SubscribeToModelThroughElement( self, "qualityColor", function ()
		local f26_local0 = self:GetDataSource()
		f26_local0 = f26_local0.qualityColor:GetValue( f12_local1 )
		if f26_local0 ~= nil then
			LootItemCardMk2Bonus.Blur:SetRGBFromInt( f26_local0, 0 )
		end
	end )
	LootItemCardMk2Bonus:SubscribeToModelThroughElement( self, "qualityColor", function ()
		local f27_local0 = self:GetDataSource()
		f27_local0 = f27_local0.qualityColor:GetValue( f12_local1 )
		if f27_local0 ~= nil then
			LootItemCardMk2Bonus.Gradient:SetRGBFromInt( f27_local0, 0 )
		end
	end )
	self:addElement( LootItemCardMk2Bonus )
	self.LootItemCardMk2Bonus = LootItemCardMk2Bonus
	
	local StreakShadow = nil
	
	StreakShadow = LUI.UIImage.new()
	StreakShadow.id = "StreakShadow"
	StreakShadow:SetRGBFromInt( 0, 0 )
	StreakShadow:SetAlpha( 0, 0 )
	StreakShadow:setImage( RegisterMaterial( "widg_gradient_bottom_to_top" ), 0 )
	StreakShadow:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, _1080p * -80 )
	self:addElement( StreakShadow )
	self.StreakShadow = StreakShadow
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Blur:RegisterAnimationSequence( "StandardLayout", {
			{
				function ()
					return self.Blur:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 580, _1080p * 660, 0 )
				end
			}
		} )
		ItemCardPassives:RegisterAnimationSequence( "StandardLayout", {
			{
				function ()
					return self.ItemCardPassives:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 400, _1080p * 280, _1080p * 460, 0 )
				end
			}
		} )
		ItemCardWeaponStatsPanel:RegisterAnimationSequence( "StandardLayout", {
			{
				function ()
					return self.ItemCardWeaponStatsPanel:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 400, _1080p * 460, _1080p * 580, 0 )
				end
			}
		} )
		CraftWeaponMessage:RegisterAnimationSequence( "StandardLayout", {
			{
				function ()
					return self.CraftWeaponMessage:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 9, _1080p * -9, _1080p * 585.5, _1080p * 603.5, 0 )
				end
			}
		} )
		LegendaryIcon:RegisterAnimationSequence( "StandardLayout", {
			{
				function ()
					return self.LegendaryIcon:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 30, _1080p * 62, _1080p * 623, _1080p * 655, 0 )
				end
			}
		} )
		CommonIcon:RegisterAnimationSequence( "StandardLayout", {
			{
				function ()
					return self.CommonIcon:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -62, _1080p * -30, _1080p * 623, _1080p * 655, 0 )
				end
			}
		} )
		RareIcon:RegisterAnimationSequence( "StandardLayout", {
			{
				function ()
					return self.RareIcon:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -16, _1080p * 16, _1080p * 623, _1080p * 655, 0 )
				end
			}
		} )
		WeaponLockedTillLevel:RegisterAnimationSequence( "StandardLayout", {
			{
				function ()
					return self.WeaponLockedTillLevel:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 9, _1080p * -9, _1080p * 585.5, _1080p * 603.5, 0 )
				end
			}
		} )
		LockIcon:RegisterAnimationSequence( "StandardLayout", {
			{
				function ()
					return self.LockIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 184, _1080p * 216, _1080p * 623, _1080p * 655, 0 )
				end
			}
		} )
		Background:RegisterAnimationSequence( "StandardLayout", {
			{
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 230, _1080p * 280, 0 )
				end
			}
		} )
		UnlockMessage:RegisterAnimationSequence( "StandardLayout", {
			{
				function ()
					return self.UnlockMessage:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 45, _1080p * -45, _1080p * 238, _1080p * 256, 0 )
				end
			}
		} )
		CostText:RegisterAnimationSequence( "StandardLayout", {
			{
				function ()
					return self.CostText:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 75.5, _1080p * -212.5, _1080p * 241, _1080p * 269, 0 )
				end
			}
		} )
		ScrapImage:RegisterAnimationSequence( "StandardLayout", {
			{
				function ()
					return self.ScrapImage:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 192.42, _1080p * 236.42, _1080p * 233, _1080p * 277, 0 )
				end
			}
		} )
		CostAmount:RegisterAnimationSequence( "StandardLayout", {
			{
				function ()
					return self.CostAmount:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 232.42, _1080p * -55.58, _1080p * 244, _1080p * 266, 0 )
				end
			}
		} )
		WeaponStatus:RegisterAnimationSequence( "StandardLayout", {
			{
				function ()
					return self.WeaponStatus:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 242, _1080p * 268, 0 )
				end
			}
		} )
		DropShadow:RegisterAnimationSequence( "StandardLayout", {
			{
				function ()
					return self.DropShadow:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, 0, _1080p * 4, 0 )
				end
			}
		} )
		StreakCost:RegisterAnimationSequence( "StandardLayout", {
			{
				function ()
					return self.StreakCost:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 400, _1080p * 460, _1080p * 580, 0 )
				end
			}
		} )
		LootItemCardMk2Bonus:RegisterAnimationSequence( "StandardLayout", {
			{
				function ()
					return self.LootItemCardMk2Bonus:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.StandardLayout = function ()
			Blur:AnimateSequence( "StandardLayout" )
			ItemCardPassives:AnimateSequence( "StandardLayout" )
			ItemCardWeaponStatsPanel:AnimateSequence( "StandardLayout" )
			CraftWeaponMessage:AnimateSequence( "StandardLayout" )
			LegendaryIcon:AnimateSequence( "StandardLayout" )
			CommonIcon:AnimateSequence( "StandardLayout" )
			RareIcon:AnimateSequence( "StandardLayout" )
			WeaponLockedTillLevel:AnimateSequence( "StandardLayout" )
			LockIcon:AnimateSequence( "StandardLayout" )
			Background:AnimateSequence( "StandardLayout" )
			UnlockMessage:AnimateSequence( "StandardLayout" )
			CostText:AnimateSequence( "StandardLayout" )
			ScrapImage:AnimateSequence( "StandardLayout" )
			CostAmount:AnimateSequence( "StandardLayout" )
			WeaponStatus:AnimateSequence( "StandardLayout" )
			DropShadow:AnimateSequence( "StandardLayout" )
			StreakCost:AnimateSequence( "StandardLayout" )
			LootItemCardMk2Bonus:AnimateSequence( "StandardLayout" )
		end
		
		Blur:RegisterAnimationSequence( "MK2Layout", {
			{
				function ()
					return self.Blur:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 605, _1080p * 685, 0 )
				end
			}
		} )
		ItemCardPassives:RegisterAnimationSequence( "MK2Layout", {
			{
				function ()
					return self.ItemCardPassives:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 400, _1080p * 305, _1080p * 485, 0 )
				end
			}
		} )
		ItemCardWeaponStatsPanel:RegisterAnimationSequence( "MK2Layout", {
			{
				function ()
					return self.ItemCardWeaponStatsPanel:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 400, _1080p * 485, _1080p * 605, 0 )
				end
			}
		} )
		CraftWeaponMessage:RegisterAnimationSequence( "MK2Layout", {
			{
				function ()
					return self.CraftWeaponMessage:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 9, _1080p * -9, _1080p * 610.5, _1080p * 628.5, 0 )
				end
			}
		} )
		LegendaryIcon:RegisterAnimationSequence( "MK2Layout", {
			{
				function ()
					return self.LegendaryIcon:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 30, _1080p * 62, _1080p * 648, _1080p * 680, 0 )
				end
			}
		} )
		CommonIcon:RegisterAnimationSequence( "MK2Layout", {
			{
				function ()
					return self.CommonIcon:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -62, _1080p * -30, _1080p * 648, _1080p * 680, 0 )
				end
			}
		} )
		RareIcon:RegisterAnimationSequence( "MK2Layout", {
			{
				function ()
					return self.RareIcon:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -16, _1080p * 16, _1080p * 648, _1080p * 680, 0 )
				end
			}
		} )
		WeaponLockedTillLevel:RegisterAnimationSequence( "MK2Layout", {
			{
				function ()
					return self.WeaponLockedTillLevel:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 9, _1080p * -9, _1080p * 610.5, _1080p * 628.5, 0 )
				end
			}
		} )
		LockIcon:RegisterAnimationSequence( "MK2Layout", {
			{
				function ()
					return self.LockIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 184, _1080p * 216, _1080p * 648, _1080p * 680, 0 )
				end
			}
		} )
		Background:RegisterAnimationSequence( "MK2Layout", {
			{
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 255, _1080p * 305, 0 )
				end
			}
		} )
		UnlockMessage:RegisterAnimationSequence( "MK2Layout", {
			{
				function ()
					return self.UnlockMessage:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 45, _1080p * -45, _1080p * 263, _1080p * 281, 0 )
				end
			}
		} )
		CostText:RegisterAnimationSequence( "MK2Layout", {
			{
				function ()
					return self.CostText:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 75.5, _1080p * -212.5, _1080p * 266, _1080p * 294, 0 )
				end
			}
		} )
		ScrapImage:RegisterAnimationSequence( "MK2Layout", {
			{
				function ()
					return self.ScrapImage:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 192.42, _1080p * 236.42, _1080p * 258, _1080p * 302, 0 )
				end
			}
		} )
		CostAmount:RegisterAnimationSequence( "MK2Layout", {
			{
				function ()
					return self.CostAmount:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 232.42, _1080p * -55.58, _1080p * 269, _1080p * 291, 0 )
				end
			}
		} )
		WeaponStatus:RegisterAnimationSequence( "MK2Layout", {
			{
				function ()
					return self.WeaponStatus:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 267, _1080p * 293, 0 )
				end
			}
		} )
		DropShadow:RegisterAnimationSequence( "MK2Layout", {
			{
				function ()
					return self.DropShadow:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * 25, _1080p * 29, 0 )
				end
			}
		} )
		LootItemCardMk2Bonus:RegisterAnimationSequence( "MK2Layout", {
			{
				function ()
					return self.LootItemCardMk2Bonus:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.MK2Layout = function ()
			Blur:AnimateSequence( "MK2Layout" )
			ItemCardPassives:AnimateSequence( "MK2Layout" )
			ItemCardWeaponStatsPanel:AnimateSequence( "MK2Layout" )
			CraftWeaponMessage:AnimateSequence( "MK2Layout" )
			LegendaryIcon:AnimateSequence( "MK2Layout" )
			CommonIcon:AnimateSequence( "MK2Layout" )
			RareIcon:AnimateSequence( "MK2Layout" )
			WeaponLockedTillLevel:AnimateSequence( "MK2Layout" )
			LockIcon:AnimateSequence( "MK2Layout" )
			Background:AnimateSequence( "MK2Layout" )
			UnlockMessage:AnimateSequence( "MK2Layout" )
			CostText:AnimateSequence( "MK2Layout" )
			ScrapImage:AnimateSequence( "MK2Layout" )
			CostAmount:AnimateSequence( "MK2Layout" )
			WeaponStatus:AnimateSequence( "MK2Layout" )
			DropShadow:AnimateSequence( "MK2Layout" )
			LootItemCardMk2Bonus:AnimateSequence( "MK2Layout" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	ItemCardPassives:SetDataSourceThroughElement( self, "passives" )
	ItemCardWeaponStatsPanel:SetDataSourceThroughElement( self, "weaponStats" )
	PostLoadFunc( self, f12_local1, controller )
	return self
end

MenuBuilder.registerType( "ArmoryItemCard", ArmoryItemCard )
LUI.FlowManager.RegisterStackPopBehaviour( "ArmoryItemCard", PopFunc )
LockTable( _M )
