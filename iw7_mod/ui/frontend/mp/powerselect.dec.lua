local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "frontEnd.MP.CAC.powerSelect"
f0_local1 = function ()
	WipeGlobalModelsAtPath( f0_local0 )
end

f0_local2 = function ( f2_arg0, f2_arg1, f2_arg2 )
	return function ( f3_arg0 )
		local f3_local0
		if f2_arg0.power:GetValue( f3_arg0 ) ~= f2_arg1 or f2_arg0.lootItemID:GetValue( f3_arg0 ) ~= f2_arg2 or f2_arg0.power:GetValue( f3_arg0 ) == Cac.powerNoneValue then
			f3_local0 = false
		else
			f3_local0 = true
		end
		return f3_local0
	end
	
end

local f0_local3 = function ( f4_arg0 )
	local f4_local0
	if f4_arg0 then
		f4_local0 = 1
		if not f4_local0 then
		
		else
			return f4_local0
		end
	end
	f4_local0 = 0
end

local f0_local4 = function ( f5_arg0, f5_arg1 )
	return function ( f6_arg0 )
		local f6_local0
		if f5_arg1 ~= f5_arg0.power:GetValue( f6_arg0 ) or f5_arg0.power:GetValue( f6_arg0 ) == Cac.powerNoneValue then
			f6_local0 = false
		else
			f6_local0 = true
		end
		return f6_local0
	end
	
end

local f0_local5 = function ( f7_arg0, f7_arg1 )
	return function ( f8_arg0 )
		local f8_local0
		if f7_arg0:GetValue( f8_arg0 ) then
			f8_local0 = f7_arg1:GetValue( f8_arg0 )
		else
			f8_local0 = true
		end
		return f8_local0
	end
	
end

local f0_local6 = function ( f9_arg0, f9_arg1, f9_arg2 )
	return function ( f10_arg0 )
		local f10_local0 = Cac.CanAffordItem( f9_arg1, f9_arg0.pointCost, f10_arg0 )
		local f10_local1 = f9_arg2:GetValue( f10_arg0 )
		local f10_local2
		if not f9_arg0.used:GetValue( f10_arg0 ) then
			f10_local2 = not f10_local0
		else
			f10_local2 = false
		end
		return f10_local2
	end
	
end

local f0_local7 = function ( f11_arg0, f11_arg1 )
	return function ( f12_arg0, f12_arg1, f12_arg2 )
		assert( f12_arg1.ref )
		assert( f12_arg1.name )
		assert( f12_arg1.icon )
		assert( f12_arg1.slot )
		assert( f12_arg1.desc )
		assert( f12_arg1.fullImage )
		local f12_local0 = {
			f11_arg0.power,
			f11_arg0.lootItemID
		}
		local f12_local1 = f12_arg1.ref:GetValue( f12_arg2 )
		local f12_local2 = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".base." .. f12_local1 .. ".unlocked", Cac.IsBasePowerUnlocked( f12_local1, f12_arg2 ) and Cac.IsUnlockedEsports( Engine.IsUnlocked( f12_arg2, "pro_power", f12_local1, true ) ) )
		local f12_local3 = LUI.AggregateDataSource.new( f12_arg1.ref, f12_local0, "selected", f0_local2( f11_arg0, f12_local1, Cac.BaseLootID ) )
		local f12_local4 = f12_local3:Filter( "selectedAlpha", f0_local3 )
		local f12_local5 = LUI.AggregateDataSource.new( f12_arg1.ref, {
			f12_local2,
			f11_arg1.pointCount,
			f11_arg0.power
		}, "disabledByPointCount", f0_local6( f11_arg0, f11_arg1, f12_local2 ) )
		local f12_local6 = LUI.AggregateDataSource.new( f12_arg1.ref, {
			f12_local2,
			f12_local5
		}, "isDisabled", f0_local5( f12_local2, f12_local5 ) )
		local f12_local7 = LUI.DataSourceFromList.new( f11_arg0.pointCost:GetCountValue( f12_arg2 ) )
		f12_local7.MakeDataSourceAtIndex = function ( f13_arg0, f13_arg1, f13_arg2 )
			return {
				isActive = f12_local3
			}
		end
		
		local f12_local8 = {}
		local f12_local9 = f0_local0 .. ".loot." .. f12_local1 .. "."
		f12_local8[1] = {
			power = {
				ref = f12_arg1.ref,
				name = f12_arg1.name,
				icon = f12_arg1.icon,
				fullImage = f12_arg1.fullImage,
				desc = f12_arg1.desc,
				quip = LUI.DataSourceInGlobalModel.new( f12_local9 .. "quip", "" ),
				quality = LUI.DataSourceInGlobalModel.new( f12_local9 .. "quality", 0 ),
				qualityString = LUI.DataSourceInGlobalModel.new( f12_local9 .. "qualityString", Cac.GetLootQualityString( Cac.LowestQuality ) ),
				qualityColor = LUI.DataSourceInGlobalModel.new( f12_local9 .. "qualityColor", Cac.GetLootQualityColor( Cac.LowestQuality ) ),
				qualityImage = LUI.DataSourceInGlobalModel.new( f12_local9 .. "qualityImage", Cac.GetLootQualityImage( Cac.LowestQuality ) ),
				passives = LUI.DataSourceFromList.new( 0 ),
				basePowerRef = LUI.DataSourceInGlobalModel.new( f12_local9 .. "basePowerRef", f12_local1 ),
				lootID = LUI.DataSourceInGlobalModel.new( f12_local9 .. "lootID", Cac.BaseLootID ),
				isUnlocked = f12_local2,
				isDisabledByPointCount = f12_local5,
				isDisabled = f12_local6,
				selected = f12_local3,
				selectedAlpha = f12_local4,
				slot = f12_arg1.slot,
				pointCost = f12_local7
			}
		}
		local f12_local10 = POWER_LOOT_VARIANT_LIST[f12_local1]
		if f12_local10 then
			for f12_local28, f12_local29 in ipairs( f12_local10 ) do
				local f12_local30 = CSV.ReadRow( {
					file = CSV.powerLootMaster.file,
					cols = CSV.powerLootMaster.cols
				}, f12_local29 )
				local f12_local31 = f12_local30.index
				assert( f12_local31 )
				if Loot.IsOwned( f12_arg2, f12_local31 ) > 0 then
					local f12_local14 = f0_local0 .. ".loot." .. f12_local30.ref .. "."
					local f12_local15 = Engine.Localize( f12_local30.displayName )
					local f12_local16 = f12_local30.displayImage
					local f12_local17 = tonumber( f12_local30.quality ) or 1
					local f12_local18 = Cac.GetLootQualityString( f12_local17 )
					local f12_local19 = Cac.GetLootQualityColor( f12_local17 )
					local f12_local20 = Cac.GetLootQualityImage( f12_local17 )
					local f12_local21 = Engine.Localize( Cac.GetLootQuip( f12_local30.ref ) )
					local f12_local22 = {}
					for f12_local23 = Cac.FirstPassiveIndex, Cac.LastPassiveIndex, 1 do
						local f12_local26 = f12_local30["passive" .. f12_local23]
						if #f12_local26 > 0 then
							local f12_local27 = DataSources.alwaysLoaded.MP.CAC.passives[f12_local26]
							assert( f12_local27 )
							table.insert( f12_local22, f12_local27 )
						end
					end
					local f12_local23 = LUI.DataSourceFromList.new( #f12_local22 )
					f12_local23.GetDataSourceAtIndex = function ( f14_arg0, f14_arg1, f14_arg2 )
						local f14_local0 = f12_local22[f14_arg1 + 1]
						local f14_local1 = Engine.Localize( f14_local0.name:GetValue( f14_arg2 ) )
						local f14_local2 = nil
						if f12_arg1.slot:GetValue( f14_arg2 ) == 1 then
							f14_local2 = Engine.Localize( f14_local0.abilityDesc:GetValue( f14_arg2 ) )
						else
							f14_local2 = Engine.Localize( f14_local0.equipDesc:GetValue( f14_arg2 ) )
						end
						return {
							passive = {
								name = LUI.DataSourceInGlobalModel.new( f12_local14 .. "passives." .. f14_arg1 .. ".name", f14_local1 ),
								desc = LUI.DataSourceInGlobalModel.new( f12_local14 .. "passives." .. f14_arg1 .. ".abilityDesc", f14_local2 ),
								image = f14_local0.image
							}
						}
					end
					
					local f12_local24 = LUI.AggregateDataSource.new( f12_arg1.ref, f12_local0, "selected" .. f12_local30.index, f0_local2( f11_arg0, f12_local1, tonumber( f12_local30.index ) ) )
					table.insert( f12_local8, {
						power = {
							ref = LUI.DataSourceInGlobalModel.new( f12_local14 .. "ref", f12_local30.ref ),
							name = LUI.DataSourceInGlobalModel.new( f12_local14 .. "name", f12_local15 ),
							icon = LUI.DataSourceInGlobalModel.new( f12_local14 .. "image", f12_local16 ),
							fullImage = f12_arg1.fullImage,
							desc = f12_arg1.desc,
							quip = LUI.DataSourceInGlobalModel.new( f12_local14 .. "quip", f12_local21 ),
							quality = LUI.DataSourceInGlobalModel.new( f12_local14 .. "quality", tonumber( f12_local17 ) ),
							qualityString = LUI.DataSourceInGlobalModel.new( f12_local14 .. "qualityString", f12_local18 ),
							qualityColor = LUI.DataSourceInGlobalModel.new( f12_local14 .. "qualityColor", f12_local19 ),
							qualityImage = LUI.DataSourceInGlobalModel.new( f12_local14 .. "qualityImage", f12_local20 ),
							passives = f12_local23,
							isUnlocked = f12_local2,
							basePowerRef = LUI.DataSourceInGlobalModel.new( f12_local14 .. "basePowerRef", f12_local1 ),
							lootID = LUI.DataSourceInGlobalModel.new( f12_local14 .. "lootID", tonumber( f12_local30.index ) ),
							isDisabledByPointCount = f12_local5,
							isDisabled = f12_local6,
							selected = f12_local24,
							selectedAlpha = f12_local24:Filter( "selectedAlpha", f0_local3 ),
							slot = f12_arg1.slot,
							pointCost = f12_local7
						}
					} )
				end
			end
		end
		local f12_local12 = LUI.DataSourceFromList.new( #f12_local8 )
		f12_local12.GetDataSourceAtIndex = function ( f15_arg0, f15_arg1 )
			return f12_local8[f15_arg1 + 1]
		end
		
		f12_local12.GetDefaultFocusIndex = function ()
			if f11_arg0.power:GetValue( f12_arg2 ) ~= Cac.powerNoneValue then
				for f16_local3, f16_local4 in ipairs( f12_local8 ) do
					if f16_local4.power.basePowerRef:GetValue( f12_arg2 ) == f11_arg0.power:GetValue( f12_arg2 ) and f16_local4.power.lootID:GetValue( f12_arg2 ) == f11_arg0.lootItemID:GetValue( f12_arg2 ) then
						return f16_local3 - 1
					end
				end
			end
			return nil
		end
		
		local f12_local13 = LUI.AggregateDataSource.new( f12_arg1.ref, f12_local0, "baseSelected", f0_local4( f11_arg0, f12_local1 ) )
		return {
			variants = f12_local12,
			selected = f12_local13,
			selectedAlpha = f12_local13:Filter( "selectedAlpha", f0_local3 ),
			isUnlocked = f12_local2,
			isDisabled = f12_local6,
			pointCost = f12_local7
		}
	end
	
end

local f0_local8 = function ( f17_arg0, f17_arg1, f17_arg2 )
	assert( f17_arg2 )
	if Engine.IsDevelopmentBuild() then
		if not f17_arg2.squadMemberDataSource then
			DebugPrint( "WARNING: Missing \"statsGroupDataSource\" option for PowerSelect menu. Only OK after a MyChanges." )
			f17_arg2.squadMemberDataSource = DataSources.alwaysLoaded.playerData.MP.privateloadouts.squadMembers
		end
		local f17_local0 = GetCACPlayerDataDataSource( f17_arg2.squadMemberDataSource )
		if not f17_arg2.equippedSlotDataSource then
			DebugPrint( "WARNING: Missing \"equippedSlotDataSource\" option for PowerSelect menu. Only OK after a MyChanges." )
			local f17_local1 = f17_local0.loadouts:GetDataSourceAtIndex( 0 )
			f17_arg2.equippedSlotDataSource = f17_local1.powerSlotOne
		end
		if not f17_arg2.loadoutDataSource then
			DebugPrint( "WARNING: Missing \"loadoutDataSource\" option for PowerSelect menu. Only OK after a MyChanges." )
			f17_arg2.loadoutDataSource = f17_local0.loadouts:GetDataSourceAtIndex( 0 )
		end
	end
	if Engine.IsCoreMode() then
		FrontEndScene.SetTeamAndScene( "loadout_select", f17_arg1 )
	end
	assert( f17_arg2.equippedSlotDataSource )
	assert( f17_arg2.loadoutDataSource )
	assert( f17_arg2.squadMemberDataSource )
	f17_arg0.equippedSlotDataSource = f17_arg2.equippedSlotDataSource
	f17_arg0.loadoutDataSource = f17_arg2.loadoutDataSource
	f17_arg0.statsGroupDataSource = GetCACPlayerDataDataSource( f17_arg2.squadMemberDataSource )
	local f17_local0 = f17_arg0.loadoutDataSource.name:GetValue( f17_arg1 )
	f17_arg0.MenuTitle.MenuBreadcrumbs:setText( CoD.GetBreadcrumbCreateAClass(), 0 )
	local f17_local1 = f17_arg0.equippedSlotDataSource.slot:GetValue( f17_arg1 )
	assert( f17_local1 )
	local f17_local2 = DataSources.frontEnd.MP.CAC.powerSlots:GetDataSourceAtIndex( f17_local1 )
	local f17_local3 = ""
	if f17_local1 == Cac.PowerSlot.LETHAL then
		f17_local3 = "LUA_MENU_RIG_LETHAL"
	elseif f17_local1 == Cac.PowerSlot.TACTICAL then
		f17_local3 = "LUA_MENU_RIG_TACTICAL"
	end
	f17_arg0.MenuTitle.MenuTitle:setText( ToUpperCase( Engine.Localize( f17_local3 ) ), 0 )
	local f17_local4 = f17_local2:Decorate( f0_local7( f17_arg0.equippedSlotDataSource, f17_arg2.loadoutDataSource ) )
	f17_local4:SetCachingEnabled( true )
	f17_local4.GetDefaultFocusIndex = function ()
		if f17_arg0.equippedSlotDataSource.power:GetValue( f17_arg1 ) ~= Cac.powerNoneValue then
			local f18_local0 = f17_arg0.equippedSlotDataSource.power:GetValue( f17_arg1 )
			assert( f18_local0 and #f18_local0 > 0 )
			local f18_local1
			if f18_local0 ~= "none" then
				f18_local1 = Cac.GetPowerIndex( f17_local1 + 1, f18_local0 )
				if not f18_local1 then
				
				else
					return f18_local1
				end
			end
			f18_local1 = nil
		else
			return nil
		end
	end
	
	f17_arg0:SetDataSource( {
		powerSelectContent = f17_local4,
		points = f17_arg2.loadoutDataSource.points,
		pointCountText = f17_arg2.loadoutDataSource.pointCountText
	}, f17_arg1 )
	if Engine.IsPC() then
		f17_arg0.bindButton:addEventHandler( "button_primary", function ( f19_arg0, f19_arg1 )
			local f19_local0 = f19_arg1.controller or f17_arg1
			local f19_local1 = f17_arg0.BasePowers:GetVisibleChildInFocus()
			if f19_local1 and not f19_local1:IsDisabled() then
				f19_local1:processEvent( {
					name = "button_action",
					controller = f19_local0
				} )
			end
		end )
	end
	local f17_local5 = MenuBuilder.BuildRegisteredType( "LobbyStatus", {
		controllerIndex = f17_arg1
	} )
	f17_local5:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -800, _1080p * -40, _1080p * -114, _1080p * -80 )
	f17_local5:Minimize()
	f17_arg0:addElement( f17_local5 )
	if CONDITIONS.IsDraftEnabled( f17_arg0 ) then
		assert( f17_arg0.LoadoutDraftTimer )
		Cac.SetupLoadoutDraftTimerRefresh( f17_arg0.LoadoutDraftTimer )
	end
end

function PowerSelect( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "PowerSelect"
	self._animationSets = {}
	self._sequences = {}
	local f20_local1 = controller and controller.controllerIndex
	if not f20_local1 and not Engine.InFrontend() then
		f20_local1 = self:getRootController()
	end
	assert( f20_local1 )
	self:playSound( "menu_open" )
	local f20_local2 = self
	local ListAnchor = nil
	
	ListAnchor = LUI.UIImage.new()
	ListAnchor.id = "ListAnchor"
	ListAnchor:SetRGBFromInt( 6710886, 0 )
	ListAnchor:SetAlpha( 0.6, 0 )
	ListAnchor:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 147, _1080p * 397, _1080p * 914, _1080p * 938 )
	self:addElement( ListAnchor )
	self.ListAnchor = ListAnchor
	
	local BasePowers = nil
	
	BasePowers = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 5,
		controllerIndex = f20_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "BasePower", {
				controllerIndex = f20_local1
			} )
		end,
		wrapX = false,
		wrapY = false,
		spacingX = _1080p * 6,
		spacingY = _1080p * 6,
		columnWidth = _1080p * 250,
		rowHeight = _1080p * 133.2,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Center,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	BasePowers.id = "BasePowers"
	BasePowers:setUseStencil( true )
	BasePowers:SetGridDataSourceThroughElement( self, "powerSelectContent" )
	BasePowers:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 147, _1080p * 397, _1080p * 216, _1080p * 906 )
	self:addElement( BasePowers )
	self.BasePowers = BasePowers
	
	local Powers = nil
	
	Powers = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 5,
		maxVisibleRows = 1,
		controllerIndex = f20_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "PowerItem", {
				controllerIndex = f20_local1
			} )
		end,
		wrapX = false,
		wrapY = false,
		spacingX = _1080p * 25,
		spacingY = _1080p * 25,
		columnWidth = _1080p * 512,
		rowHeight = _1080p * 512,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Center,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	Powers.id = "Powers"
	Powers:setUseStencil( false )
	Powers:SetGridDataSourceThroughElement( BasePowers, "variants" )
	Powers:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -2084, _1080p * 576, _1080p * 346, _1080p * 858 )
	self:addElement( Powers )
	self.Powers = Powers
	
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f20_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local BasePowersScrollbar = nil
	
	BasePowersScrollbar = MenuBuilder.BuildRegisteredType( "VerticalMinimalScrollbar", {
		controllerIndex = f20_local1
	} )
	BasePowersScrollbar.id = "BasePowersScrollbar"
	BasePowersScrollbar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 147, _1080p * 216, _1080p * 906 )
	self:addElement( BasePowersScrollbar )
	self.BasePowersScrollbar = BasePowersScrollbar
	
	local PowerPips = nil
	
	PowerPips = LUI.Pips.new( {
		spacing = _1080p * 10,
		direction = LUI.DIRECTION.horizontal,
		alignment = LUI.Alignment.Center,
		buildPip = function ()
			return MenuBuilder.BuildRegisteredType( "Pip", {
				controllerIndex = f20_local1
			} )
		end,
		controllerIndex = f20_local1
	} )
	PowerPips.id = "PowerPips"
	PowerPips:SetAlpha( 0, 0 )
	PowerPips:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 1206, _1080p * -594, _1080p * -294, _1080p * -278 )
	self:addElement( PowerPips )
	self.PowerPips = PowerPips
	
	local PowerDetails = nil
	PowerDetails = MenuBuilder.BuildRegisteredType( "PowerDetails", {
		controllerIndex = f20_local1
	} )
	PowerDetails.id = "PowerDetails"
	PowerDetails:SetDataSourceThroughElement( Powers, "power" )
	if not Engine.IsMultiplayer() and not Engine.InFrontend() then
		PowerDetails.UpgradeState:setText( "", 0 )
	end
	PowerDetails:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 412, 0, _1080p * 216, _1080p * 416 )
	self:addElement( PowerDetails )
	self.PowerDetails = PowerDetails
	
	local ArrowLeft = nil
	
	ArrowLeft = MenuBuilder.BuildRegisteredType( "ArrowLeft", {
		controllerIndex = f20_local1
	} )
	ArrowLeft.id = "ArrowLeft"
	ArrowLeft:SetAlpha( 0, 0 )
	ArrowLeft:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 637, _1080p * 701, _1080p * 565, _1080p * 693 )
	self:addElement( ArrowLeft )
	self.ArrowLeft = ArrowLeft
	
	local ArrowRight = nil
	
	ArrowRight = MenuBuilder.BuildRegisteredType( "ArrowRight", {
		controllerIndex = f20_local1
	} )
	ArrowRight.id = "ArrowRight"
	ArrowRight:SetAlpha( 0, 0 )
	ArrowRight:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -185, _1080p * -121, _1080p * 565, _1080p * 693 )
	self:addElement( ArrowRight )
	self.ArrowRight = ArrowRight
	
	local MenuTitle = nil
	
	MenuTitle = MenuBuilder.BuildRegisteredType( "MenuTitle", {
		controllerIndex = f20_local1
	} )
	MenuTitle.id = "MenuTitle"
	MenuTitle.MenuTitle:setText( ToUpperCase( Engine.Localize( "MENU_NEW" ) ), 0 )
	MenuTitle.MenuBreadcrumbs:setText( ToUpperCase( Engine.Localize( "MENU_MULTIPLAYER" ) ), 0 )
	MenuTitle.Icon:SetTop( _1080p * -28.5, 0 )
	MenuTitle.Icon:SetBottom( _1080p * 61.5, 0 )
	MenuTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
	self:addElement( MenuTitle )
	self.MenuTitle = MenuTitle
	
	local ArrowUp = nil
	
	ArrowUp = MenuBuilder.BuildRegisteredType( "ArrowUp", {
		controllerIndex = f20_local1
	} )
	ArrowUp.id = "ArrowUp"
	ArrowUp:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 344.5, _1080p * 364.5, _1080p * 906, _1080p * 946 )
	self:addElement( ArrowUp )
	self.ArrowUp = ArrowUp
	
	local ArrowDown = nil
	
	ArrowDown = MenuBuilder.BuildRegisteredType( "ArrowDown", {
		controllerIndex = f20_local1
	} )
	ArrowDown.id = "ArrowDown"
	ArrowDown:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 179.5, _1080p * 199.5, _1080p * 906, _1080p * 946 )
	self:addElement( ArrowDown )
	self.ArrowDown = ArrowDown
	
	local ListCount = nil
	
	ListCount = LUI.UIText.new()
	ListCount.id = "ListCount"
	ListCount:setText( "1/15", 0 )
	ListCount:SetFontSize( 24 * _1080p )
	ListCount:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ListCount:SetAlignment( LUI.Alignment.Center )
	ListCount:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 199.5, _1080p * 344.5, _1080p * 914, _1080p * 938 )
	self:addElement( ListCount )
	self.ListCount = ListCount
	
	local SocialFeed = nil
	
	SocialFeed = MenuBuilder.BuildRegisteredType( "SocialFeed", {
		controllerIndex = f20_local1
	} )
	SocialFeed.id = "SocialFeed"
	SocialFeed:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -115, _1080p * -85 )
	self:addElement( SocialFeed )
	self.SocialFeed = SocialFeed
	
	local MissionTeamInfo = nil
	
	MissionTeamInfo = MenuBuilder.BuildRegisteredType( "MissionTeamInfo", {
		controllerIndex = f20_local1
	} )
	MissionTeamInfo.id = "MissionTeamInfo"
	MissionTeamInfo:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -700, 0, _1080p * 54, _1080p * 142 )
	self:addElement( MissionTeamInfo )
	self.MissionTeamInfo = MissionTeamInfo
	
	local f20_local18 = nil
	if CONDITIONS.IsPublicMatch( self ) then
		f20_local18 = MenuBuilder.BuildRegisteredType( "CRMMain", {
			controllerIndex = f20_local1
		} )
		f20_local18.id = "CRMMain"
		f20_local18:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 136, _1080p * 447, _1080p * 745, _1080p * 1069 )
		self:addElement( f20_local18 )
		self.CRMMain = f20_local18
	end
	local f20_local19 = nil
	if CONDITIONS.IsDraftEnabled( self ) then
		f20_local19 = MenuBuilder.BuildRegisteredType( "LoadoutDraftTimer", {
			controllerIndex = f20_local1
		} )
		f20_local19.id = "LoadoutDraftTimer"
		f20_local19:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -150, _1080p * 150, 0, _1080p * 64 )
		self:addElement( f20_local19 )
		self.LoadoutDraftTimer = f20_local19
	end
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Powers:RegisterAnimationSequence( "MenuOpen", {
			{
				function ()
					return self.Powers:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -1605, _1080p * 1055, _1080p * 346, _1080p * 858, 0 )
				end,
				function ()
					return self.Powers:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -2084, _1080p * 576, _1080p * 346, _1080p * 858, 300, LUI.EASING.outQuadratic )
				end
			}
		} )
		self._sequences.MenuOpen = function ()
			Powers:AnimateSequence( "MenuOpen" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	BasePowers:addEventHandler( "gain_focus", function ( f29_arg0, f29_arg1 )
		ACTIONS.GainFocus( self, "Powers", f29_arg1.controller or f20_local1 )
	end )
	BasePowers:addEventHandler( "lose_focus", function ( f30_arg0, f30_arg1 )
		ACTIONS.LoseFocus( self, "Powers", f30_arg1.controller or f20_local1 )
	end )
	PowerDetails:SetDataSourceThroughElement( Powers, "power" )
	local f20_local20 = LUI.UIScrollbar.new
	local bindButton = {
		direction = LUI.DIRECTION.vertical,
		eventListener = BasePowersScrollbar,
		startCap = BasePowersScrollbar.startCap,
		endCap = BasePowersScrollbar.endCap
	}
	local f20_local22 = BasePowersScrollbar.sliderArea
	if f20_local22 then
		f20_local22 = BasePowersScrollbar.sliderArea.slider
	end
	bindButton.slider = f20_local22
	f20_local22 = BasePowersScrollbar.sliderArea
	if f20_local22 then
		f20_local22 = BasePowersScrollbar.sliderArea.fixedSizeSlider
	end
	bindButton.fixedSizeSlider = f20_local22
	BasePowers:AddScrollbar( f20_local20( bindButton ) )
	BasePowers:AddArrow( ArrowUp )
	BasePowers:AddArrow( ArrowDown )
	BasePowers:AddItemNumbers( ListCount )
	Powers:AddScrollbar( PowerPips )
	Powers:AddArrow( ArrowLeft )
	Powers:AddArrow( ArrowRight )
	self.addButtonHelperFunction = function ( f31_arg0, f31_arg1 )
		f31_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			priority = 10,
			clickable = true
		} )
		f31_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_SELECT" ),
			button_ref = "button_primary",
			side = "left",
			priority = -10,
			clickable = true
		} )
	end
	
	self:addEventHandler( "menu_create", self.addButtonHelperFunction )
	
	bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	self.bindButton:addEventHandler( "button_secondary", function ( f32_arg0, f32_arg1 )
		local f32_local0 = f32_arg1.controller or f20_local1
		ACTIONS.LeaveMenu( self )
	end )
	f0_local8( self, f20_local1, controller )
	ACTIONS.AnimateSequence( self, "MenuOpen" )
	if CONDITIONS.IsPublicMatch( self ) then
		ACTIONS.AnimateSequenceByElement( self, {
			elementName = "CRMMain",
			sequenceName = "Minimize",
			elementPath = "CRMMain"
		} )
	end
	return self
end

MenuBuilder.registerType( "PowerSelect", PowerSelect )
LUI.FlowManager.RegisterStackPopBehaviour( "PowerSelect", f0_local1 )
LockTable( _M )
