local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
PERK_EQUIP_TYPE_NOT_USED = 0
PERK_EQUIP_TYPE_PERK = 1
PERK_EQUIP_TYPE_EXTRA_PERK = 2
PERK_SELECT_BASE_DATA_MODEL = "frontEnd.MP.CAC.perkMenu"
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5 )
	return function ( f2_arg0 )
		local f2_local0, f2_local1 = Cac.GetPerkSlotDataSourceByEquippedRef( f2_arg0, f1_arg2, f1_arg4 )
		local f2_local2 = Cac.GetPerkSlot( f1_arg2, f1_arg3 )
		local f2_local3 = f2_local2.perk.pointCost:GetCountValue( f2_arg0 )
		local f2_local4 = f2_local2.extraPerk.pointCost:GetCountValue( f2_arg0 )
		if f2_local1 then
			return f2_local4
		elseif f2_local0 ~= nil then
			return f2_local3
		elseif f1_arg5:GetValue( f2_arg0 ) then
			local f2_local5 = f2_local4
		end
		return f2_local5 or f2_local3
	end
	
end

f0_local1 = function ( f3_arg0, f3_arg1, f3_arg2 )
	return function ( f4_arg0 )
		local f4_local0, f4_local1 = Cac.GetPerkSlotDataSourceByEquippedRef( f4_arg0, f3_arg1, f3_arg2 )
		if f4_local0 then
			local f4_local2
			if f4_local1 then
				f4_local2 = PERK_EQUIP_TYPE_EXTRA_PERK
				if not f4_local2 then
				
				else
					return f4_local2
				end
			end
			f4_local2 = PERK_EQUIP_TYPE_PERK
		else
			return PERK_EQUIP_TYPE_NOT_USED
		end
	end
	
end

f0_local2 = function ( f5_arg0 )
	if f5_arg0 == PERK_EQUIP_TYPE_PERK or f5_arg0 == PERK_EQUIP_TYPE_EXTRA_PERK then
		return true
	else
		return false
	end
end

local f0_local3 = function ( f6_arg0 )
	if f6_arg0 == PERK_EQUIP_TYPE_PERK or f6_arg0 == PERK_EQUIP_TYPE_EXTRA_PERK then
		return 1
	else
		return 0
	end
end

local f0_local4 = function ( f7_arg0 )
	local f7_local0 = COLORS.white
	if f7_arg0 == PERK_EQUIP_TYPE_PERK then
		f7_local0 = SWATCHES.CAC.equippedPerkTic
	elseif f7_arg0 == PERK_EQUIP_TYPE_EXTRA_PERK then
		f7_local0 = SWATCHES.CAC.equppedExtraPerkTic
	end
	return GetIntForColor( f7_local0 )
end

local f0_local5 = function ( f8_arg0 )
	if f8_arg0 == PERK_EQUIP_TYPE_PERK then
		return "1"
	elseif f8_arg0 == PERK_EQUIP_TYPE_EXTRA_PERK then
		return "2"
	else
		return ""
	end
end

local f0_local6 = function ( f9_arg0, f9_arg1 )
	return function ( f10_arg0 )
		return f9_arg0:GetValue( f10_arg0 ) or not f9_arg1:GetValue( f10_arg0 )
	end
	
end

local f0_local7 = function ( f11_arg0, f11_arg1, f11_arg2, f11_arg3 )
	return function ( f12_arg0 )
		local f12_local0 = f11_arg1:GetValue( f12_arg0 )
		local f12_local1 = f11_arg2:GetValue( f12_arg0 )
		local f12_local2
		if f12_local0 ~= PERK_EQUIP_TYPE_PERK and f12_local0 ~= PERK_EQUIP_TYPE_EXTRA_PERK then
			f12_local2 = false
		else
			f12_local2 = true
		end
		local f12_local3 = Cac.GetPerkSlotDataSourceByIndex( f12_arg0, f11_arg0, f12_local1 - 1 )
		local f12_local4 = f12_local3.perk.used:GetValue( f12_arg0 )
		if f12_local4 then
			f12_local4 = not f12_local3.extraPerk.used:GetValue( f12_arg0 )
		end
		local f12_local5
		if f12_local4 then
			f12_local5 = f12_local3.extraPerk.pointCost
			if not f12_local5 then
			
			else
				local f12_local6 = Cac.CanAffordItem( f11_arg0, f12_local5, f12_arg0 )
				local f12_local7, f12_local8 = Cac.IsPerkSlotInUse( f12_arg0, f12_local3 )
				local f12_local9 = nil
				if f11_arg3:GetValue( f12_arg0 ) then
					f12_local9 = f12_local8
				else
					f12_local9 = f12_local7
				end
				local f12_local10
				if not f12_local9 and not f12_local2 then
					f12_local10 = not f12_local6
				else
					f12_local10 = false
				end
				return f12_local10
			end
		end
		f12_local5 = f12_local3.perk.pointCost
	end
	
end

function PopFunc()
	WipeGlobalModelsAtPath( PERK_SELECT_BASE_DATA_MODEL )
end

local f0_local8 = function ( f14_arg0, f14_arg1, f14_arg2 )
	if Engine.IsDevelopmentBuild() then
		f14_arg2.perkSlot = f14_arg2.perkSlot or 0
		if not f14_arg2.squadMemberDataSource then
			DebugPrint( "WARNING: Missing \"statsGroupDataSource\" option for PerkSelect menu. Only OK after a MyChanges." )
			f14_arg2.squadMemberDataSource = DataSources.alwaysLoaded.playerData.MP.rankedloadouts.squadMembers
		end
		local f14_local0 = GetCACPlayerDataDataSource( f14_arg2.squadMemberDataSource )
		if not f14_arg2.loadoutDataSource then
			DebugPrint( "WARNING: Missing \"loadoutDataSource\" option for PerkSelect menu. Only OK after a MyChanges." )
			f14_arg2.loadoutDataSource = f14_local0.loadouts[0]
		end
	end
	assert( f14_arg2.loadoutDataSource )
	assert( f14_arg2.squadMemberDataSource )
	assert( f14_arg2.perkSlot )
	f14_arg0.loadoutDataSource = f14_arg2.loadoutDataSource
	f14_arg0.statsGroupDataSource = GetCACPlayerDataDataSource( f14_arg2.squadMemberDataSource )
	f14_arg0.perkSlot = f14_arg2.perkSlot
	f14_arg0.selectedPerkIsExtra = LUI.DataSourceInGlobalModel.new( PERK_SELECT_BASE_DATA_MODEL .. ".selectedPerkIsExtra", f14_arg2.selectedPerkIsExtra )
	f14_arg0.selectedPerkIsExtra:SetValue( f14_arg1, f14_arg2.selectedPerkIsExtra )
	if Engine.IsCoreMode() then
		FrontEndScene.SetTeamAndScene( "loadout_select", f14_arg1 )
	end
	local f14_local0 = LUI.FlowManager.GetScopedData( f14_arg0 )
	if f14_local0.updateOnRemoval then
		f14_arg0.selectedPerkIsExtra:SetValue( f14_arg1, false )
		f14_local0.updateOnRemoval = nil
	end
	if f14_arg0.selectedPerkIsExtra:GetValue( f14_arg1 ) then
		local f14_local1, f14_local2 = Cac.IsPerkSlotInUse( f14_arg1, Cac.GetPerkSlotDataSourceByIndex( f14_arg1, f14_arg0.loadoutDataSource, f14_arg0.perkSlot ) )
		if not f14_local1 then
			f14_arg0.selectedPerkIsExtra:SetValue( f14_arg1, false )
		end
	end
	local f14_local3 = f14_arg0.loadoutDataSource.name:GetValue( f14_arg1 )
	f14_arg0.MenuTitle.MenuBreadcrumbs:setText( CoD.GetBreadcrumbCreateAClass(), 0 )
	local f14_local1 = LUI.DataSourceInGlobalModel.new( PERK_SELECT_BASE_DATA_MODEL )
	local f14_local2 = function ( f15_arg0, f15_arg1, f15_arg2 )
		local f15_local0 = f15_arg1.ref:GetValue( f15_arg2 )
		local f15_local1 = Engine.IsUnlocked( f15_arg2, "perk", f15_local0 )
		local f15_local2 = Cac.IsUnlockedEsports( Engine.IsUnlocked( f15_arg2, "pro_perk", f15_local0, true ) )
		local f15_local3
		if f15_local1 and f15_local2 then
			f15_local3 = 0
			if not f15_local3 then
			
			else
				local f15_local4 = LUI.DataSourceInGlobalModel.new( PERK_SELECT_BASE_DATA_MODEL .. ".perk." .. f15_local0 .. ".unlocked", f15_local1 and f15_local2 )
				local f15_local5 = {
					f14_arg0.loadoutDataSource.perkSlotOne.perk,
					f14_arg0.loadoutDataSource.perkSlotTwo.perk,
					f14_arg0.loadoutDataSource.perkSlotThree.perk,
					f14_arg0.loadoutDataSource.perkSlotOne.extraPerk,
					f14_arg0.loadoutDataSource.perkSlotTwo.extraPerk,
					f14_arg0.loadoutDataSource.perkSlotThree.extraPerk,
					f14_arg0.selectedPerkIsExtra
				}
				local f15_local6 = LUI.AggregateDataSource.new( f14_local1, f15_local5, "perk." .. f15_local0 .. ".isEquipped", f0_local1( f15_arg2, f14_arg0.loadoutDataSource, f15_arg1.ref:GetValue( f15_arg2 ) ) )
				local f15_local7 = f15_local6:Filter( "isEquippedFilter", f0_local2 )
				local f15_local8 = LUI.DataSourceFromList.new( LUI.AggregateDataSource.new( f14_local1, f15_local5, "perk." .. f15_local0 .. ".nodeCount", f0_local0( f14_arg0, f15_arg2, f14_arg0.loadoutDataSource, f14_arg0.perkSlot, f15_arg1.ref:GetValue( f15_arg2 ), f14_arg0.selectedPerkIsExtra ) ) )
				f15_local8.MakeDataSourceAtIndex = function ( f16_arg0, f16_arg1, f16_arg2 )
					return {
						isActive = f15_local7
					}
				end
				
				local f15_local9 = LUI.ShallowCopy( f15_local5 )
				table.insert( f15_local9, f14_arg0.loadoutDataSource.pointCount )
				local f15_local10 = LUI.AggregateDataSource.new( f14_local1, f15_local9, "perk." .. f15_local0 .. ".isDisabledByPointCount", f0_local7( f14_arg0.loadoutDataSource, f15_local6, f15_arg1.slot, f14_arg0.selectedPerkIsExtra ) )
				return {
					isEquipped = f15_local7,
					isDisabledByPointCount = f15_local10,
					isDisabled = LUI.AggregateDataSource.new( f14_local1, f15_local9, "perk." .. f15_local0 .. ".disabled", f0_local6( f15_local10, f15_local4 ) ),
					isUnlocked = f15_local4,
					equipIconAlpha = f15_local6:Filter( "iconAlpha", f0_local3 ),
					equipIconColor = f15_local6:Filter( "iconColor", f0_local4 ),
					equipIconPointText = f15_local6:Filter( "iconPointText", f0_local5 ),
					lockIconAlpha = LUI.DataSourceInGlobalModel.new( PERK_SELECT_BASE_DATA_MODEL .. ".perk." .. f15_local0 .. ".lockIconAlpha", f15_local3 ),
					costNodes = f15_local8,
					perkSlot = f14_arg0.perkSlot
				}
			end
		end
		f15_local3 = 1
	end
	
	local f14_local4 = DataSources.frontEnd.MP.CAC.perks:GetDataSourceAtIndex( f14_arg0.perkSlot )
	f14_arg0.perkList = f14_local4:Decorate( f14_local2 )
	f14_arg0.perkList:SetCachingEnabled( true )
	f14_arg0.perkList.GetDefaultFocusIndex = function ( f17_arg0 )
		for f17_local0 = 0, f14_local4:GetCountValue( f14_arg1 ) - 1, 1 do
			local f17_local3 = f14_local4:GetDataSourceAtIndex( f17_local0 )
			local f17_local4, f17_local5 = Cac.GetPerkSlotDataSourceByEquippedRef( f14_arg1, f14_arg0.loadoutDataSource, f17_local3.ref:GetValue( f14_arg1 ) )
			if f14_arg0.perkSlot == index and f14_arg2.selectedPerkIsExtra then
				if f17_local4 and f17_local5 then
					return f17_local0
				end
			end
			if f17_local4 and not f17_local5 then
				return f17_local0
			end
		end
		return nil
	end
	
	f14_arg0:SetDataSource( {
		perkList = f14_arg0.perkList
	}, f14_arg1 )
	f14_arg0:registerEventHandler( "menu_close", function ( element, event )
		
	end )
	f14_arg0:SubscribeToModelThroughElement( f14_arg0.PerkGrid, "desc", function ()
		local f19_local0 = f14_arg0.PerkGrid:GetDataSource()
		f19_local0 = f19_local0.desc:GetValue( f14_arg1 )
		if f19_local0 ~= nil then
			Cac.PositionUnlockCriteria( ToUpperCase( LocalizeString( f19_local0 ) ), f14_arg0.PerkItemHeader.ItemHeader.ItemDescription, f14_arg0.PerkItemHeader.UnlockCriteria )
		end
	end )
	local f14_local5 = MenuBuilder.BuildRegisteredType( "LobbyStatus", {
		controllerIndex = f14_arg1
	} )
	f14_local5:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -800, _1080p * -40, _1080p * -114, _1080p * -80 )
	f14_local5:Minimize()
	f14_arg0:addElement( f14_local5 )
	if CONDITIONS.IsDraftEnabled( f14_arg0 ) then
		assert( f14_arg0.LoadoutDraftTimer )
		Cac.SetupLoadoutDraftTimerRefresh( f14_arg0.LoadoutDraftTimer )
	end
end

function PerkSelect( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "PerkSelect"
	self._animationSets = {}
	self._sequences = {}
	local f20_local1 = controller and controller.controllerIndex
	if not f20_local1 and not Engine.InFrontend() then
		f20_local1 = self:getRootController()
	end
	assert( f20_local1 )
	self:playSound( "menu_open" )
	local f20_local2 = self
	local PerkGrid = nil
	
	PerkGrid = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 3,
		maxVisibleRows = 3,
		controllerIndex = f20_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "CaCPerkButton", {
				controllerIndex = f20_local1
			} )
		end,
		wrapX = false,
		wrapY = false,
		spacingX = _1080p * 6,
		spacingY = _1080p * 6,
		columnWidth = _1080p * 192.67,
		rowHeight = _1080p * 200,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	PerkGrid.id = "PerkGrid"
	PerkGrid:setUseStencil( true )
	PerkGrid:SetGridDataSourceThroughElement( self, "perkList" )
	PerkGrid:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 720.01, _1080p * 216, _1080p * 828 )
	self:addElement( PerkGrid )
	self.PerkGrid = PerkGrid
	
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f20_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local MenuTitle = nil
	
	MenuTitle = MenuBuilder.BuildRegisteredType( "MenuTitle", {
		controllerIndex = f20_local1
	} )
	MenuTitle.id = "MenuTitle"
	MenuTitle.MenuTitle:setText( ToUpperCase( Engine.Localize( "LUA_MENU_TITLE_PERK_SELECT" ) ), 0 )
	MenuTitle.MenuBreadcrumbs:setText( ToUpperCase( Engine.Localize( "MENU_MULTIPLAYER" ) ), 0 )
	MenuTitle.Icon:SetTop( _1080p * -28.5, 0 )
	MenuTitle.Icon:SetBottom( _1080p * 61.5, 0 )
	MenuTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
	self:addElement( MenuTitle )
	self.MenuTitle = MenuTitle
	
	local Showcase = nil
	
	Showcase = MenuBuilder.BuildRegisteredType( "PerkShowcase", {
		controllerIndex = f20_local1
	} )
	Showcase.id = "Showcase"
	Showcase:SetDataSourceThroughElement( PerkGrid, nil )
	Showcase:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -847.5, _1080p * -335.5, _1080p * 352, _1080p * 864 )
	self:addElement( Showcase )
	self.Showcase = Showcase
	
	local PerkItemHeader = nil
	
	PerkItemHeader = MenuBuilder.BuildRegisteredType( "PerkItemHeader", {
		controllerIndex = f20_local1
	} )
	PerkItemHeader.id = "PerkItemHeader"
	PerkItemHeader:SetDataSourceThroughElement( PerkGrid, nil )
	PerkItemHeader:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 736, 0, _1080p * 216, _1080p * 599 )
	PerkItemHeader:SubscribeToModelThroughElement( PerkGrid, "desc", function ()
		local f22_local0 = PerkGrid:GetDataSource()
		f22_local0 = f22_local0.desc:GetValue( f20_local1 )
		if f22_local0 ~= nil then
			PerkItemHeader.ItemHeader.ItemDescription:setText( LocalizeString( f22_local0 ), 0 )
		end
	end )
	PerkItemHeader:SubscribeToModelThroughElement( PerkGrid, "name", function ()
		local f23_local0 = PerkGrid:GetDataSource()
		f23_local0 = f23_local0.name:GetValue( f20_local1 )
		if f23_local0 ~= nil then
			PerkItemHeader.ItemHeader.ItemName:setText( LocalizeString( f23_local0 ), 0 )
		end
	end )
	self:addElement( PerkItemHeader )
	self.PerkItemHeader = PerkItemHeader
	
	local GridScrollbar = nil
	
	GridScrollbar = MenuBuilder.BuildRegisteredType( "VerticalMinimalScrollbar", {
		controllerIndex = f20_local1
	} )
	GridScrollbar.id = "GridScrollbar"
	GridScrollbar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 113, _1080p * 130, _1080p * 216, _1080p * 824 )
	self:addElement( GridScrollbar )
	self.GridScrollbar = GridScrollbar
	
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
	
	local f20_local11 = nil
	if CONDITIONS.IsPublicMatch( self ) then
		f20_local11 = MenuBuilder.BuildRegisteredType( "CRMMain", {
			controllerIndex = f20_local1
		} )
		f20_local11.id = "CRMMain"
		f20_local11:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 441, _1080p * 742, _1080p * 1066 )
		self:addElement( f20_local11 )
		self.CRMMain = f20_local11
	end
	local f20_local12 = nil
	if CONDITIONS.IsDraftEnabled( self ) then
		f20_local12 = MenuBuilder.BuildRegisteredType( "LoadoutDraftTimer", {
			controllerIndex = f20_local1
		} )
		f20_local12.id = "LoadoutDraftTimer"
		f20_local12:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -150, _1080p * 150, 0, _1080p * 64 )
		self:addElement( f20_local12 )
		self.LoadoutDraftTimer = f20_local12
	end
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Showcase:RegisterAnimationSequence( "MenuOpen", {
			{
				function ()
					return self.Showcase:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -867.5, _1080p * -355.5, _1080p * 352, _1080p * 864, 0 )
				end,
				function ()
					return self.Showcase:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -830.5, _1080p * -318.5, _1080p * 352, _1080p * 864, 300, LUI.EASING.outQuadratic )
				end
			}
		} )
		self._sequences.MenuOpen = function ()
			Showcase:AnimateSequence( "MenuOpen" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	Showcase:SetDataSourceThroughElement( PerkGrid, nil )
	PerkItemHeader:SetDataSourceThroughElement( PerkGrid, nil )
	local f20_local13 = LUI.UIScrollbar.new
	local bindButton = {
		direction = LUI.DIRECTION.vertical,
		eventListener = GridScrollbar,
		startCap = GridScrollbar.startCap,
		endCap = GridScrollbar.endCap
	}
	local f20_local15 = GridScrollbar.sliderArea
	if f20_local15 then
		f20_local15 = GridScrollbar.sliderArea.slider
	end
	bindButton.slider = f20_local15
	f20_local15 = GridScrollbar.sliderArea
	if f20_local15 then
		f20_local15 = GridScrollbar.sliderArea.fixedSizeSlider
	end
	bindButton.fixedSizeSlider = f20_local15
	PerkGrid:AddScrollbar( f20_local13( bindButton ) )
	self.addButtonHelperFunction = function ( f29_arg0, f29_arg1 )
		f29_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			priority = 10,
			clickable = true
		} )
		f29_arg0:AddButtonHelperText( {
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
	
	self:SubscribeToModelThroughElement( PerkGrid, "desc", function ()
		ACTIONS.AnimateSequenceByElement( self, {
			elementName = "ItemHeader",
			sequenceName = "UpdateDescription",
			elementPath = "PerkItemHeader.ItemHeader"
		} )
	end )
	self.bindButton:addEventHandler( "button_secondary", function ( f31_arg0, f31_arg1 )
		local f31_local0 = f31_arg1.controller or f20_local1
		ACTIONS.LeaveMenu( self )
	end )
	self:SubscribeToModelThroughElement( PerkGrid, "icon", function ()
		ACTIONS.AnimateSequenceByElement( self, {
			elementName = "Showcase",
			sequenceName = "Update",
			elementPath = "Showcase"
		} )
	end )
	f0_local8( self, f20_local1, controller )
	if CONDITIONS.IsPublicMatch( self ) then
		ACTIONS.AnimateSequenceByElement( self, {
			elementName = "CRMMain",
			sequenceName = "Minimize",
			elementPath = "CRMMain"
		} )
	end
	return self
end

MenuBuilder.registerType( "PerkSelect", PerkSelect )
LUI.FlowManager.RegisterStackPopBehaviour( "PerkSelect", PopFunc )
LockTable( _M )
