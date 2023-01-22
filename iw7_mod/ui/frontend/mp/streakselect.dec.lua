local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "frontEnd.MP.CAC.streakSelect"
f0_local1 = function ()
	WipeGlobalModelsAtPath( f0_local0 )
end

f0_local2 = function ( f2_arg0, f2_arg1 )
	return function ( f3_arg0 )
		return Cac.IsBaseStreakEquipped( f2_arg0, f3_arg0, f2_arg1 )
	end
	
end

local f0_local3 = function ( f4_arg0, f4_arg1, f4_arg2, f4_arg3 )
	return function ( f5_arg0 )
		local f5_local0 = f4_arg1:GetValue( f5_arg0 )
		local f5_local1 = f4_arg2:GetValue( f5_arg0 )
		if f5_local0 then
			if f5_local1 then
				return false
			end
			for f5_local5, f5_local6 in pairs( Cac.GetEquippedStreaks( f4_arg0, f5_arg0 ) ) do
				if f4_arg3 == f5_local6.score then
					return true
				end
			end
			return false
		else
			return true
		end
	end
	
end

local f0_local4 = function ( f6_arg0, f6_arg1 )
	return function ( f7_arg0 )
		local f7_local0 = 108
		local f7_local1 = 10
		table.sort( Cac.GetEquippedStreaks( f6_arg0, f7_arg0 ), function ( f8_arg0, f8_arg1 )
			local f8_local0
			if f8_arg1.score ~= 0 or f8_arg0.score == 0 or f8_arg0.score >= f8_arg1.score then
				f8_local0 = false
			else
				f8_local0 = true
			end
			return f8_local0
		end )
		return -1 * f6_arg1 * (f7_local1 + f7_local0)
	end
	
end

local f0_local5 = function ( f9_arg0 )
	local f9_local0 = {}
	for f9_local1 = Cac.FirstStreakIndex, Cac.LastStreakIndex, 1 do
		table.insert( f9_local0, f9_arg0.killstreakSetups[f9_local1].killstreak )
		table.insert( f9_local0, f9_arg0.killstreakSetups[f9_local1].lootItemID )
	end
	return f9_local0
end

local f0_local6 = function ( f10_arg0, f10_arg1, f10_arg2, f10_arg3 )
	return function ( f11_arg0 )
		return Cac.IsBaseStreakEquipped( f10_arg1, f11_arg0, f10_arg2 ) and f10_arg0[f10_arg2]:GetValue( f11_arg0 ) == f10_arg3
	end
	
end

local f0_local7 = function ( f12_arg0, f12_arg1 )
	return function ( f13_arg0, f13_arg1, f13_arg2 )
		assert( f13_arg1.name )
		assert( f13_arg1.image )
		assert( f13_arg1.fullImage )
		local f13_local0 = f12_arg0.squadMemberDataSource
		local f13_local1 = f0_local5( f13_local0 )
		local f13_local2 = f13_arg1.ref:GetValue( f13_arg2 )
		local f13_local3 = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".base." .. f13_local2 .. ".unlocked", Cac.IsBaseStreakUnlocked( f13_local2, f13_arg2 ) and Cac.IsUnlockedEsports( Engine.IsUnlocked( f13_arg2, "pro_killstreak", f13_local2, true ) ) )
		local f13_local4 = nil
		if f12_arg1 then
			f13_local4 = f13_arg1.supportCost
		else
			f13_local4 = f13_arg1.score
		end
		local f13_local5 = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".streak." .. f13_local2 .. ".variant" )
		local f13_local6 = LUI.AggregateDataSource.new( f13_local5, f13_local1, tostring( Cac.BaseLootID ) .. ".isSelected", f0_local6( f12_arg0.statsGroupDataSource.statsGroup.streakPreferences, f13_local0, f13_local2, Cac.BaseLootID ) )
		local f13_local7 = {}
		local f13_local8 = {}
		local f13_local9 = f0_local0 .. ".loot." .. f13_local2 .. "."
		f13_local7[1] = {
			streak = {
				isBase = true,
				ref = f13_arg1.ref,
				name = f13_arg1.name,
				score = f13_local4,
				image = f13_arg1.smallImage,
				desc = f13_arg1.desc,
				fullImage = f13_arg1.fullImage,
				quip = LUI.DataSourceInGlobalModel.new( f13_local9 .. "quip", "" ),
				quality = LUI.DataSourceInGlobalModel.new( f13_local9 .. "quality", Cac.LowestQuality ),
				qualityColor = LUI.DataSourceInGlobalModel.new( f13_local9 .. "qualityColor", Cac.GetLootQualityColor( Cac.BaseLootID ) ),
				qualityString = LUI.DataSourceInGlobalModel.new( f13_local9 .. "qualityString", Cac.GetLootQualityString( Cac.BaseLootID ) ),
				qualityImage = LUI.DataSourceInGlobalModel.new( f13_local9 .. "qualityImage", Cac.GetLootQualityImage( Cac.BaseLootID ) ),
				passives = LUI.DataSourceFromList.new( 0 ),
				baseStreakRef = LUI.DataSourceInGlobalModel.new( f13_local9 .. "baseStreakRef", f13_local2 ),
				lootID = LUI.DataSourceInGlobalModel.new( f13_local9 .. "lootID", Cac.BaseLootID ),
				isUnlocked = f13_local3
			},
			isDisabled = f13_local3:FilterTo( f13_local5, tostring( Cac.BaseLootID ) .. ".isDisabled", Not ),
			isSelected = f13_local6
		}
		f13_local8[Cac.BaseLootID] = f13_local7[1].streak
		local f13_local10 = STREAK_LOOT_VARIANT_LIST[f13_local2]
		if f13_local10 then
			for f13_local29, f13_local30 in ipairs( f13_local10 ) do
				local f13_local31 = CSV.ReadRow( {
					file = CSV.streakLootMaster.file,
					cols = CSV.streakLootMaster.cols
				}, f13_local30 )
				local f13_local32 = f13_local31.index
				assert( f13_local32 )
				local f13_local33 = Loot.IsOwned( f13_arg2, f13_local32 ) > 0
				local f13_local34 = f0_local0 .. ".loot." .. f13_local31.ref .. "."
				local f13_local35 = Engine.Localize( f13_local31.displayName )
				local f13_local36 = f13_local31.displayImage
				local f13_local14 = f13_arg1.desc
				if f13_local31.overrideDesc and f13_local31.overrideDesc ~= "" then
					f13_local14 = LUI.DataSourceInGlobalModel.new( f13_local34 .. "desc", f13_local31.overrideDesc )
				end
				local f13_local15 = tonumber( f13_local31.quality ) or 0
				local f13_local16 = Cac.GetLootQualityString( f13_local15 )
				local f13_local17 = Cac.GetLootQualityImage( f13_local15 )
				local f13_local18 = Engine.Localize( Cac.GetLootQuip( f13_local31.ref ) )
				local f13_local19 = {}
				for f13_local20 = Cac.FirstPassiveIndex, Cac.LastPassiveIndex, 1 do
					local f13_local23 = f13_local31["passive" .. f13_local20]
					if #f13_local23 > 0 then
						local f13_local24 = DataSources.alwaysLoaded.MP.CAC.passives[f13_local23]
						assert( f13_local24 )
						table.insert( f13_local19, f13_local24 )
					end
				end
				local f13_local20 = LUI.DataSourceFromList.new( #f13_local19 )
				f13_local20.GetDataSourceAtIndex = function ( f14_arg0, f14_arg1, f14_arg2 )
					local f14_local0 = f13_local19[f14_arg1 + 1]
					return {
						passive = {
							name = LUI.DataSourceInGlobalModel.new( f13_local34 .. "passives." .. f14_arg1 .. ".name", Engine.Localize( f14_local0.name:GetValue( f14_arg2 ) ) ),
							desc = LUI.DataSourceInGlobalModel.new( f13_local34 .. "passives." .. f14_arg1 .. ".streakDesc", Engine.Localize( f14_local0.streakDesc:GetValue( f14_arg2 ) ) ),
							image = f14_local0.image
						}
					}
				end
				
				local f13_local21 = tonumber( f13_local31.index )
				local f13_local22 = LUI.DataSourceInGlobalModel.new( f13_local34 .. "lootID", f13_local21 )
				local f13_local25 = LUI.AggregateDataSource.new( f13_local5, f13_local1, tostring( f13_local21 ) .. ".isSelected", f0_local6( f12_arg0.statsGroupDataSource.statsGroup.streakPreferences, f13_local0, f13_local2, f13_local21 ) )
				local f13_local23 = f13_local31.ref
				local f13_local24 = LUI.DataSourceInGlobalModel.new( f13_local34 .. "ref", f13_local23 )
				local f13_local26 = LUI.DataSourceInGlobalModel.new( f13_local34 .. "score", Cac.GetStreakDisplayPointsCost( f13_local23, f13_local21, f12_arg1 ) )
				local f13_local27 = LUI.ShallowCopy( f13_local1 )
				table.insert( f13_local27, f13_local3 )
				table.insert( f13_local27, isLootItemSelectedDataSource )
				local f13_local28 = {
					streak = {
						ref = f13_local24,
						name = LUI.DataSourceInGlobalModel.new( f13_local34 .. "name", f13_local35 ),
						score = f13_local26,
						image = LUI.DataSourceInGlobalModel.new( f13_local34 .. "image", f13_local36 ),
						fullImage = f13_arg1.fullImage,
						desc = f13_local14,
						quip = LUI.DataSourceInGlobalModel.new( f13_local34 .. "quip", f13_local18 ),
						quality = LUI.DataSourceInGlobalModel.new( f13_local34 .. "quality", tonumber( f13_local15 ) ),
						qualityColor = LUI.DataSourceInGlobalModel.new( f13_local34 .. "qualityColor", Cac.GetLootQualityColor( f13_local15 ) ),
						qualityString = LUI.DataSourceInGlobalModel.new( f13_local34 .. "qualityString", f13_local16 ),
						qualityImage = LUI.DataSourceInGlobalModel.new( f13_local34 .. "qualityImage", f13_local17 ),
						passives = f13_local20,
						isUnlocked = f13_local3:FilterTo( f13_local5, tostring( f13_local21 ) .. ".isUnlocked", function ( f15_arg0, f15_arg1 )
							return f15_arg0 and f13_local33
						end
						 ),
						baseStreakRef = LUI.DataSourceInGlobalModel.new( f13_local34 .. "baseStreakRef", f13_local2 ),
						lootID = f13_local22,
						isOwned = f13_local33
					},
					isDisabled = f13_local3:FilterTo( f13_local5, tostring( f13_local21 ) .. ".isDisabled", function ( f16_arg0, f16_arg1 )
						local f16_local0
						if f16_arg0 then
							f16_local0 = not f13_local33
						else
							f16_local0 = true
						end
						return f16_local0
					end
					 ),
					isSelected = f13_local25
				}
				f13_local8[tonumber( f13_local31.index )] = f13_local28.streak
				table.insert( f13_local7, f13_local28 )
			end
		end
		local f13_local12 = LUI.DataSourceFromList.new( #f13_local7 )
		f13_local12.GetDataSourceAtIndex = function ( f17_arg0, f17_arg1 )
			return f13_local7[f17_arg1 + 1]
		end
		
		f13_local12.GetDefaultFocusIndex = function ()
			local f18_local0 = Cac.GetEquippedStreaks( f13_local0, f13_arg2 )
			assert( f18_local0 )
			for f18_local7, f18_local8 in ipairs( f13_local7 ) do
				local f18_local9 = f18_local8.streak.ref:GetValue( f13_arg2 )
				for f18_local4, f18_local5 in pairs( f18_local0 ) do
					if f18_local5.streakRef == f18_local9 then
						return f18_local7 - 1
					end
				end
			end
			return nil
		end
		
		local f13_local13 = LUI.AggregateDataSource.new( f13_arg1.ref, f13_local1, "selected", f0_local2( f13_local0, f13_local2, Cac.BaseLootID ) )
		local f13_local29 = LUI.ShallowCopy( f13_local1 )
		table.insert( f13_local29, f13_local3 )
		table.insert( f13_local29, f13_local13 )
		return {
			variants = f13_local12,
			lootStreaks = f13_local8,
			isSelected = f13_local13,
			isDisabled = LUI.AggregateDataSource.new( f13_arg1.ref, f13_local29, "disabled", f0_local3( f13_local0, f13_local3, f13_local13, score ) )
		}
	end
	
end

local f0_local8 = function ( f19_arg0 )
	return function ( f20_arg0, f20_arg1, f20_arg2 )
		local f20_local0 = f19_arg0.statsGroupDataSource
		local f20_local1 = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".preference" )
		local f20_local2 = f20_arg1.variants
		local f20_local3 = f20_local2:GetDataSourceAtIndex( 0, f20_arg2 )
		f20_local3 = f20_local3.streak.baseStreakRef
		return {
			variants = f20_local2,
			streak = f20_arg1.lootStreaks[f20_local0.statsGroup.streakPreferences[f20_local3.streak.baseStreakRef:GetValue( f20_arg2 )]:GetValue( f20_arg2 )],
			isSelected = f20_local2.isSelected,
			isDisabled = f20_local2.isDisabled
		}
	end
	
end

function PostLoadFunc( f21_arg0, f21_arg1, f21_arg2 )
	assert( f21_arg2 )
	assert( f21_arg0.BaseStreaks )
	assert( f21_arg0.Image )
	assert( f21_arg0.StreakRaritySelectList )
	assert( f21_arg0.StreakRaritySelectList.StreakRarityOptions )
	if Engine.IsDevelopmentBuild() and not f21_arg2.squadMemberDataSource then
		DebugPrint( "WARNING: Missing \"squadMemberDataSource\" option for StreakSelect menu. Only OK after a MyChanges." )
		f21_arg2.squadMemberDataSource = DataSources.alwaysLoaded.playerData.MP.privateloadouts.squadMembers
	end
	f21_arg0.MenuTitle.MenuBreadcrumbs:setText( CoD.GetBreadcrumbCreateAClass(), 0 )
	FrontEndScene.SetTeamAndScene( "loadout_select", f21_arg1 )
	assert( f21_arg2.squadMemberDataSource )
	local f21_local0 = f21_arg2.squadMemberDataSource.archetypePerk:GetValue( f21_arg1 ) == "specialty_support_killstreaks"
	local f21_local1 = DataSources.frontEnd.MP.CAC.streaks
	f21_arg0.statsGroupDataSource = GetCACPlayerDataDataSource( f21_arg2.squadMemberDataSource )
	f21_arg0.streaksDataSource = f21_arg0.statsGroupDataSource.streaks
	f21_arg0.squadMemberDataSource = f21_arg2.squadMemberDataSource
	local f21_local2 = f21_local1:Decorate( f0_local7( f21_arg0, f21_local0 ) )
	f21_local2:SetCachingEnabled( true )
	local f21_local3 = f21_local2:Decorate( f0_local8( f21_arg0 ) )
	f21_local3.GetDefaultFocusIndex = function ()
		local f22_local0 = f21_arg0.squadMemberDataSource.killstreakSetups[0].killstreak:GetValue( f21_arg1 )
		assert( f22_local0 and #f22_local0 > 0 )
		local f22_local1
		if f22_local0 ~= "none" then
			f22_local1 = Cac.GetStreakIndex( f22_local0 )
			if not f22_local1 then
			
			else
				return f22_local1
			end
		end
		f22_local1 = nil
	end
	
	local f21_local4 = LUI.ShallowCopy( f21_arg0.streaksDataSource )
	local f21_local5 = f0_local5( f21_arg0.squadMemberDataSource )
	local f21_local6 = f21_local4:GetDataSourceAtIndex( 0, f21_arg1 )
	local f21_local7 = f21_local4:GetDataSourceAtIndex( 1, f21_arg1 )
	local f21_local8 = f21_local4:GetDataSourceAtIndex( 2, f21_arg1 )
	f21_arg0.StreakGraph:SetDataSource( {
		itemOne = {
			streak = f21_local6,
			bottom = LUI.AggregateDataSource.new( f21_local6.name, f21_local5, "slotOneBottom", f0_local4( f21_arg0.squadMemberDataSource, 0 ) )
		},
		itemTwo = {
			streak = f21_local7,
			bottom = LUI.AggregateDataSource.new( f21_local7.name, f21_local5, "slotTwoBottom", f0_local4( f21_arg0.squadMemberDataSource, 1 ) )
		},
		itemThree = {
			streak = f21_local8,
			bottom = LUI.AggregateDataSource.new( f21_local8.name, f21_local5, "slotThreeBottom", f0_local4( f21_arg0.squadMemberDataSource, 2 ) )
		}
	}, f21_arg1 )
	local f21_local9 = {
		streakSelectContent = f21_local3
	}
	f21_arg0:SetDataSource( f21_local9, f21_arg1 )
	f21_arg0:addEventHandler( "show_variants", function ( f23_arg0, f23_arg1 )
		f23_arg0.showingVariants = true
		local f23_local0 = f23_arg0.BaseStreaks:GetDataSource()
		f23_arg0.selectedRef = f23_local0.streak.baseStreakRef:GetValue( f21_arg1 )
		f23_arg0.StreakRaritySelectList.StreakRarityOptions:SetGridDataSource( f23_local0.variants, f21_arg1 )
		f23_arg0.StreakDetails:UnsubscribeFromAllModels()
		f23_arg0.StreakDetails:SetDataSourceThroughElement( f23_arg0.StreakRaritySelectList.StreakRarityOptions, "streak" )
		f23_arg0.ShowcaseLock:SetDataSourceThroughElement( f23_arg0.StreakRaritySelectList.StreakRarityOptions, "streak" )
		f23_arg0.StreakRaritySelectList:SetHandleMouseTree( true )
		f23_arg0.BaseStreaks:SetHandleMouseTree( false )
		if CONDITIONS.AreLootStreaksEnabled() then
			f21_arg0.StreakRarityGrid:SetAlpha( 0, 0 )
		end
		ACTIONS.GainFocus( f23_arg0, "StreakRaritySelectList", f21_arg1 )
		ACTIONS.LoseFocus( f23_arg0, "BaseStreaks", f21_arg1 )
		ACTIONS.AnimateSequence( f21_arg0, "ShowStreakVariants" )
		f21_arg0:RemoveButtonHelperTextFromElement( f21_arg0.ButtonHelperBar, "button_alt1", "left" )
		if CONDITIONS.AreLootStreaksEnabled() then
			f21_arg0:RemoveButtonHelperTextFromElement( f21_arg0.ButtonHelperBar, "button_alt2", "left" )
		end
		return true
	end )
	f21_arg0:addEventHandler( "hide_variants", function ( f24_arg0, f24_arg1 )
		f24_arg0.showingVariants = false
		if not f24_arg0.newDefaultFocusSet then
			f21_local9.streakSelectContent.GetDefaultFocusIndex = function ()
				return Cac.GetStreakIndex( f24_arg0.selectedRef )
			end
			
			f24_arg0.newDefaultFocusSet = true
		end
		f24_arg0.StreakDetails:UnsubscribeFromAllModels()
		f24_arg0.StreakDetails:SetDataSourceThroughElement( f24_arg0.BaseStreaks, "streak" )
		f24_arg0.ShowcaseLock:SetDataSourceThroughElement( f24_arg0.BaseStreaks, "streak" )
		f24_arg0.StreakRaritySelectList:SetHandleMouseTree( false )
		f24_arg0.BaseStreaks:SetHandleMouseTree( true )
		if CONDITIONS.AreLootStreaksEnabled() then
			f21_arg0.StreakRarityGrid:SetAlpha( 1, 0 )
		end
		ACTIONS.LoseFocus( f24_arg0, "StreakRaritySelectList", f21_arg1 )
		ACTIONS.GainFocus( f24_arg0, "BaseStreaks", f21_arg1 )
		ACTIONS.AnimateSequence( f21_arg0, "HideStreakVariants" )
		if CONDITIONS.AreLootStreaksEnabled() then
			f21_arg0:AddButtonHelperTextToElement( f21_arg0.ButtonHelperBar, {
				helper_text = Engine.Localize( "LUA_MENU_MP_STREAK_VARIANTS" ),
				button_ref = "button_alt2",
				side = "left",
				priority = 2
			} )
		end
		f21_arg0:AddButtonHelperTextToElement( f21_arg0.ButtonHelperBar, {
			helper_text = Engine.Localize( "LUA_MENU_CLEAR" ),
			button_ref = "button_alt1",
			side = "left",
			priority = 3
		} )
		return true
	end )
	f21_arg0:addEventHandler( "gain_focus", function ( f26_arg0, f26_arg1 )
		if f21_arg0.showingVariants then
			ACTIONS.GainFocus( f21_arg0, "StreakRaritySelectList", f21_arg1 )
		else
			ACTIONS.GainFocus( f21_arg0, "BaseStreaks", f21_arg1 )
		end
		return true
	end )
	f21_arg0.bindButton:addEventHandler( "button_secondary", function ( f27_arg0, f27_arg1 )
		if f21_arg0.showingVariants then
			f21_arg0.showingVariants = false
			f21_arg0:dispatchEventToCurrentMenu( {
				name = "hide_variants"
			} )
		else
			ACTIONS.LeaveMenu( f21_arg0 )
		end
		return true
	end )
	local f21_local10 = MenuBuilder.BuildRegisteredType( "LobbyStatus", {
		controllerIndex = f21_arg1
	} )
	f21_local10:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -800, _1080p * -40, _1080p * -114, _1080p * -80 )
	f21_local10:Minimize()
	f21_arg0:addElement( f21_local10 )
	if CONDITIONS.IsDraftEnabled( f21_arg0 ) then
		assert( f21_arg0.LoadoutDraftTimer )
		Cac.SetupLoadoutDraftTimerRefresh( f21_arg0.LoadoutDraftTimer )
	end
	if CONDITIONS.AreLootStreaksEnabled() then
		local self = nil
		self = LUI.UIGrid.new( nil, {
			maxVisibleRows = 10,
			maxVisibleColumns = 10,
			spacing = _1080p * 10,
			numRows = 0,
			numColumns = 0,
			wrapX = false,
			wrapY = false,
			horizontalAlignment = LUI.Alignment.Center,
			verticalAlignment = LUI.Alignment.Top,
			columnWidth = _1080p * 48,
			rowHeight = _1080p * 48,
			buildChild = function ()
				return MenuBuilder.BuildRegisteredType( "StreakQuality", {
					controllerIndex = f21_arg1
				} )
			end,
			refreshChild = function ( f29_arg0, f29_arg1, f29_arg2 )
				assert( f29_arg0.QualityIcon )
				assert( f29_arg0.Highlight )
				assert( self.currentUnlockedVariants )
				assert( self.currentUnlockedVariants[f29_arg1 + 1] )
				local f29_local0 = self.currentUnlockedVariants[f29_arg1 + 1]
				f29_arg0.QualityIcon:SetDisplayQuality( f29_local0.streak.quality:GetValue( f21_arg1 ), true )
				f29_arg0.Highlight:SetAlpha( f29_local0.isSelected:GetValue( f21_arg1 ) and 1 or 0 )
			end,
			controllerIndex = f21_arg1
		} )
		self.id = "StreakRarityGrid"
		self:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 1202, _1080p * -438, _1080p * -167, _1080p * -119 )
		f21_arg0:addElement( self )
		self:SubscribeToModelThroughElement( f21_arg0.BaseStreaks, "streak.baseStreakRef", function ()
			local f30_local0 = {}
			local f30_local1 = f21_arg0.BaseStreaks:GetDataSource()
			f30_local1 = f30_local1.variants
			for f30_local2 = 0, f30_local1:GetCountValue( f21_arg1 ) - 1, 1 do
				local f30_local5 = f30_local1:GetDataSourceAtIndex( f30_local2, f21_arg1 )
				local f30_local6 = f30_local5.streak.lootID:GetValue( f21_arg1 )
				if f30_local6 ~= Cac.LootIDNoneValue then
					if Loot.IsOwned( f21_arg1, f30_local6 ) > 0 then
						table.insert( f30_local0, f30_local5 )
					end
				end
				table.insert( f30_local0, f30_local5 )
			end
			self.currentUnlockedVariants = f30_local0
			self:SetNumColumns( #f30_local0 )
			self:SetNumRows( 1 )
			self:RefreshContent()
		end )
		f21_arg0.StreakRarityGrid = self
	end
	f21_arg0:SubscribeToDataSourceThroughElement( f21_arg0.StreakRaritySelectList.StreakRarityOptions, nil, function ()
		ACTIONS.AnimateSequence( f21_arg0, "UpdateImage" )
	end )
	local f21_local12 = function ()
		local f32_local0 = f21_arg0.showingVariants and f21_arg0.StreakRaritySelectList.StreakRarityOptions:GetDataSource() or f21_arg0.BaseStreaks:GetDataSource()
		local f32_local1 = f32_local0.streak.quality:GetValue( f21_arg1 )
		local f32_local2 = Cac.BaseLootID
		f21_arg0.Image:setImage( RegisterMaterial( f32_local0.streak[Cac.BaseLootID and "image" or "fullImage"]:GetValue( f21_arg1 ) ), 0 )
	end
	
	f21_arg0.Image:SubscribeToModelThroughElement( f21_arg0.BaseStreaks, "streak.image", f21_local12 )
	f21_arg0.Image:SubscribeToModelThroughElement( f21_arg0.StreakRaritySelectList.StreakRarityOptions, "streak.image", f21_local12 )
end

function StreakSelect( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "StreakSelect"
	self._animationSets = {}
	self._sequences = {}
	local f33_local1 = controller and controller.controllerIndex
	if not f33_local1 and not Engine.InFrontend() then
		f33_local1 = self:getRootController()
	end
	assert( f33_local1 )
	self:playSound( "menu_open" )
	local f33_local2 = self
	local Blur = nil
	
	Blur = LUI.UIBlur.new()
	Blur.id = "Blur"
	Blur:SetUseAA( true )
	Blur:SetBlurStrength( 2.75, 0 )
	Blur:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 764, 0, _1080p * -324, _1080p * 294 )
	self:addElement( Blur )
	self.Blur = Blur
	
	local SideGradient = nil
	
	SideGradient = LUI.UIImage.new()
	SideGradient.id = "SideGradient"
	SideGradient:SetRGBFromInt( 0, 0 )
	SideGradient:SetAlpha( 0.7, 0 )
	SideGradient:setImage( RegisterMaterial( "widg_gradient_right_to_left" ), 0 )
	SideGradient:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 764, 0, _1080p * 216, _1080p * 834 )
	self:addElement( SideGradient )
	self.SideGradient = SideGradient
	
	local BaseStreaks = nil
	
	BaseStreaks = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 4,
		maxVisibleRows = 4,
		controllerIndex = f33_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "BaseStreak", {
				controllerIndex = f33_local1
			} )
		end,
		wrapX = false,
		wrapY = false,
		spacingX = _1080p * 6,
		spacingY = _1080p * 6,
		columnWidth = _1080p * 150,
		rowHeight = _1080p * 150,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	BaseStreaks.id = "BaseStreaks"
	BaseStreaks:setUseStencil( false )
	BaseStreaks:SetGridDataSourceThroughElement( self, "streakSelectContent" )
	BaseStreaks:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 748, _1080p * 216, _1080p * 834 )
	self:addElement( BaseStreaks )
	self.BaseStreaks = BaseStreaks
	
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f33_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local StreakDetails = nil
	
	StreakDetails = MenuBuilder.BuildRegisteredType( "StreakDetails", {
		controllerIndex = f33_local1
	} )
	StreakDetails.id = "StreakDetails"
	StreakDetails:SetDataSourceThroughElement( BaseStreaks, "streak" )
	StreakDetails.ItemHeader.ItemName:setText( "", 0 )
	StreakDetails:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 764, _1080p * 1920, _1080p * 216, _1080p * 583 )
	StreakDetails:SubscribeToModelThroughElement( BaseStreaks, "streak.desc", function ()
		local f35_local0 = BaseStreaks:GetDataSource()
		f35_local0 = f35_local0.streak.desc:GetValue( f33_local1 )
		if f35_local0 ~= nil then
			StreakDetails.ItemHeader.ItemDescription:setText( f35_local0, 0 )
		end
	end )
	self:addElement( StreakDetails )
	self.StreakDetails = StreakDetails
	
	local StreakGraph = nil
	
	StreakGraph = MenuBuilder.BuildRegisteredType( "StreakGraph", {
		controllerIndex = f33_local1
	} )
	StreakGraph.id = "StreakGraph"
	StreakGraph:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -376, _1080p * -96, _1080p * -485.5, _1080p * -413 )
	self:addElement( StreakGraph )
	self.StreakGraph = StreakGraph
	
	local Image = nil
	
	Image = LUI.UIImage.new()
	Image.id = "Image"
	Image:SetDotPitchEnabled( true )
	Image:SetDotPitchX( 52, 0 )
	Image:SetDotPitchY( 43, 0 )
	Image:SetDotPitchContrast( 0.8, 0 )
	Image:SetDotPitchMode( 0 )
	Image:setImage( RegisterMaterial( "icon_slot_scorestreak_rc8" ), 0 )
	Image:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1038, _1080p * 1550, _1080p * 320.5, _1080p * 832.5 )
	self:addElement( Image )
	self.Image = Image
	
	local MenuTitle = nil
	
	MenuTitle = MenuBuilder.BuildRegisteredType( "MenuTitle", {
		controllerIndex = f33_local1
	} )
	MenuTitle.id = "MenuTitle"
	MenuTitle.MenuTitle:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_STREAK_SELECT" ) ), 0 )
	MenuTitle.MenuBreadcrumbs:setText( ToUpperCase( Engine.Localize( "MENU_MULTIPLAYER" ) ), 0 )
	MenuTitle.Icon:SetTop( _1080p * -28.5, 0 )
	MenuTitle.Icon:SetBottom( _1080p * 61.5, 0 )
	MenuTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
	self:addElement( MenuTitle )
	self.MenuTitle = MenuTitle
	
	local SocialFeed = nil
	
	SocialFeed = MenuBuilder.BuildRegisteredType( "SocialFeed", {
		controllerIndex = f33_local1
	} )
	SocialFeed.id = "SocialFeed"
	SocialFeed:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -115, _1080p * -85 )
	self:addElement( SocialFeed )
	self.SocialFeed = SocialFeed
	
	local ShowcaseLock = nil
	
	ShowcaseLock = MenuBuilder.BuildRegisteredType( "ShowcaseLock", {
		controllerIndex = f33_local1
	} )
	ShowcaseLock.id = "ShowcaseLock"
	ShowcaseLock:SetDataSourceThroughElement( BaseStreaks, "streak" )
	ShowcaseLock:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1038, _1080p * 1550, _1080p * 320.5, _1080p * 832.5 )
	self:addElement( ShowcaseLock )
	self.ShowcaseLock = ShowcaseLock
	
	local MissionTeamInfo = nil
	
	MissionTeamInfo = MenuBuilder.BuildRegisteredType( "MissionTeamInfo", {
		controllerIndex = f33_local1
	} )
	MissionTeamInfo.id = "MissionTeamInfo"
	MissionTeamInfo:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -700, 0, _1080p * 54, _1080p * 142 )
	self:addElement( MissionTeamInfo )
	self.MissionTeamInfo = MissionTeamInfo
	
	local f33_local14 = nil
	if CONDITIONS.IsPublicMatch( self ) then
		f33_local14 = MenuBuilder.BuildRegisteredType( "CRMMain", {
			controllerIndex = f33_local1
		} )
		f33_local14.id = "CRMMain"
		f33_local14:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 136, _1080p * 447, _1080p * 745, _1080p * 1069 )
		self:addElement( f33_local14 )
		self.CRMMain = f33_local14
	end
	local f33_local15 = nil
	if CONDITIONS.IsDraftEnabled( self ) then
		f33_local15 = MenuBuilder.BuildRegisteredType( "LoadoutDraftTimer", {
			controllerIndex = f33_local1
		} )
		f33_local15.id = "LoadoutDraftTimer"
		f33_local15:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -150, _1080p * 150, 0, _1080p * 64 )
		self:addElement( f33_local15 )
		self.LoadoutDraftTimer = f33_local15
	end
	local StreakRaritySelectList = nil
	
	StreakRaritySelectList = MenuBuilder.BuildRegisteredType( "StreakRaritySelectList", {
		controllerIndex = f33_local1
	} )
	StreakRaritySelectList.id = "StreakRaritySelectList"
	StreakRaritySelectList:SetAlpha( 0, 0 )
	StreakRaritySelectList:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 63, _1080p * 748, _1080p * 215, _1080p * 951 )
	self:addElement( StreakRaritySelectList )
	self.StreakRaritySelectList = StreakRaritySelectList
	
	local f33_local17 = nil
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		f33_local17 = LUI.Pips.new( {
			spacing = _1080p * 10,
			direction = LUI.DIRECTION.horizontal,
			alignment = LUI.Alignment.Center,
			buildPip = function ()
				return MenuBuilder.BuildRegisteredType( "WeaponPip", {
					controllerIndex = f33_local1
				} )
			end,
			controllerIndex = f33_local1
		} )
		f33_local17.id = "StreakPips"
		f33_local17:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 1202, _1080p * -438, _1080p * -167, _1080p * -119 )
		self:addElement( f33_local17 )
		self.StreakPips = f33_local17
	end
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Image:RegisterAnimationSequence( "UpdateImage", {
			{
				function ()
					return self.Image:SetDotPitchX( 52, 0 )
				end,
				function ()
					return self.Image:SetDotPitchX( 0, 300 )
				end
			},
			{
				function ()
					return self.Image:SetDotPitchY( 43, 0 )
				end,
				function ()
					return self.Image:SetDotPitchY( 0, 300 )
				end
			},
			{
				function ()
					return self.Image:SetDotPitchContrast( 0.8, 0 )
				end,
				function ()
					return self.Image:SetDotPitchContrast( 0, 300 )
				end
			},
			{
				function ()
					return self.Image:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Image:SetAlpha( 1, 30 )
				end,
				function ()
					return self.Image:SetAlpha( 0, 30 )
				end,
				function ()
					return self.Image:SetAlpha( 1, 30 )
				end,
				function ()
					return self.Image:SetAlpha( 0, 30 )
				end,
				function ()
					return self.Image:SetAlpha( 1, 30 )
				end
			}
		} )
		self._sequences.UpdateImage = function ()
			Image:AnimateSequence( "UpdateImage" )
		end
		
		BaseStreaks:RegisterAnimationSequence( "ShowStreakVariants", {
			{
				function ()
					return self.BaseStreaks:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.BaseStreaks:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -618, 0, _1080p * 216, _1080p * 834, 0 )
				end
			}
		} )
		StreakRaritySelectList:RegisterAnimationSequence( "ShowStreakVariants", {
			{
				function ()
					return self.StreakRaritySelectList:SetAlpha( 0, 0 )
				end,
				function ()
					return self.StreakRaritySelectList:SetAlpha( 1, 150, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.StreakRaritySelectList:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 78, _1080p * 712, _1080p * 216, _1080p * 952, 0 )
				end,
				function ()
					return self.StreakRaritySelectList:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 114, _1080p * 748, _1080p * 216, _1080p * 952, 150, LUI.EASING.outQuadratic )
				end
			}
		} )
		self._sequences.ShowStreakVariants = function ()
			BaseStreaks:AnimateSequence( "ShowStreakVariants" )
			StreakRaritySelectList:AnimateSequence( "ShowStreakVariants" )
		end
		
		BaseStreaks:RegisterAnimationSequence( "HideStreakVariants", {
			{
				function ()
					return self.BaseStreaks:SetAlpha( 0, 0 )
				end,
				function ()
					return self.BaseStreaks:SetAlpha( 1, 150 )
				end
			},
			{
				function ()
					return self.BaseStreaks:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 714, _1080p * 216, _1080p * 834, 0 )
				end,
				function ()
					return self.BaseStreaks:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 748, _1080p * 216, _1080p * 834, 150 )
				end
			}
		} )
		StreakRaritySelectList:RegisterAnimationSequence( "HideStreakVariants", {
			{
				function ()
					return self.StreakRaritySelectList:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.HideStreakVariants = function ()
			BaseStreaks:AnimateSequence( "HideStreakVariants" )
			StreakRaritySelectList:AnimateSequence( "HideStreakVariants" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	StreakDetails:SetDataSourceThroughElement( BaseStreaks, "streak" )
	ShowcaseLock:SetDataSourceThroughElement( BaseStreaks, "streak" )
	self.addButtonHelperFunction = function ( f65_arg0, f65_arg1 )
		f65_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_SELECT" ),
			button_ref = "button_primary",
			side = "left",
			clickable = true
		} )
		f65_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			priority = 1,
			clickable = true
		} )
		if CONDITIONS.AreLootStreaksEnabled() then
			f65_arg0:AddButtonHelperText( {
				helper_text = Engine.Localize( "LUA_MENU_MP_STREAK_VARIANTS" ),
				button_ref = "button_alt2",
				side = "left",
				priority = 2
			} )
		end
		f65_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_CLEAR" ),
			button_ref = "button_alt1",
			side = "left",
			priority = 3
		} )
	end
	
	self:addEventHandler( "menu_create", self.addButtonHelperFunction )
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	self:SubscribeToModelThroughElement( BaseStreaks, "streak.fullImage", function ()
		ACTIONS.AnimateSequence( self, "UpdateImage" )
	end )
	PostLoadFunc( self, f33_local1, controller )
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "ItemHeader",
		sequenceName = "UpdateDescription",
		elementPath = "StreakDetails.ItemHeader"
	} )
	if CONDITIONS.IsPublicMatch( self ) then
		ACTIONS.AnimateSequenceByElement( self, {
			elementName = "CRMMain",
			sequenceName = "Minimize",
			elementPath = "CRMMain"
		} )
	end
	return self
end

MenuBuilder.registerType( "StreakSelect", StreakSelect )
LUI.FlowManager.RegisterStackPopBehaviour( "StreakSelect", f0_local1 )
LockTable( _M )
