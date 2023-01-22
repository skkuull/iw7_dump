local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "frontEnd.MP.conquest.Headquarters.medals"
f0_local1 = "frontEnd.MP.medals"
f0_local2 = {
	overview = "LUA_MENU_MP_MEDAL_OVERVIEW",
	combat = "LUA_MENU_MP_MEDAL_COMBAT",
	gamemode = "LUA_MENU_MP_MEDAL_GAMEMODE",
	streak_kill = "LUA_MENU_MP_MEDAL_STREAK_KILL",
	streak_shutdown = "LUA_MENU_MP_MEDAL_STREAK_SHUTDOWN",
	super_kill = "LUA_MENU_MP_MEDAL_SUPER_KILL",
	supershutdown = "LUA_MENU_MP_MEDAL_SUPER_SHUTDOWN"
}
local f0_local3 = function ()
	WipeGlobalModelsAtPath( f0_local0 )
	WipeGlobalModelsAtPath( f0_local1 )
end

local f0_local4 = function ( f2_arg0, f2_arg1, f2_arg2, f2_arg3 )
	local f2_local0 = 0
	for f2_local4, f2_local5 in pairs( CSV.ReadRow( {
		file = CSV.scoreEventTable.file,
		cols = CSV.scoreEventTable.xpCols
	}, Engine.TableLookupGetRowNum( CSV.scoreEventTable.file, CSV.scoreEventTable.cols.ref, f2_arg3.xpScoreEvent ) ) ) do
		local f2_local6 = tonumber( f2_local5 )
		if f2_local6 and 0 < f2_local6 then
			f2_local0 = f2_local6
			break
		end
	end
	f2_local1 = DataSources.alwaysLoaded.playerData.MP.common.awards[f2_arg3.ref]
	f2_local2 = f2_local1:GetValue( f2_arg1 )
	return {
		count = f2_local1,
		text = LUI.DataSourceInGlobalModel.new( f2_arg2 .. ".text", f2_arg3.title ),
		icon = LUI.DataSourceInGlobalModel.new( f2_arg2 .. ".icon", f2_arg3.icon ),
		desc = LUI.DataSourceInGlobalModel.new( f2_arg2 .. ".desc", f2_arg3.desc ),
		xp = LUI.DataSourceInGlobalModel.new( f2_arg2 .. ".xp", f2_local2 * f2_local0 ),
		achieved = LUI.DataSourceInGlobalModel.new( f2_arg2 .. ".achieved", 0 < f2_local2 )
	}
end

local f0_local5 = function ( f3_arg0, f3_arg1, f3_arg2 )
	f3_arg0.MenuTitle.MenuBreadcrumbs:setText( ToUpperCase( Engine.Localize( "LUA_MENU_BREADCRUMB_2_ITEMS", "MENU_MULTIPLAYER", "LUA_MENU_PUBLIC_MATCH_CAPS" ) ), 0 )
	local self = LUI.UIElement.new( {
		worldBlur = 5
	} )
	self:setupWorldBlur()
	self.id = "blur"
	f3_arg0:addElement( self )
	local f3_local1 = {}
	local f3_local2 = {}
	f3_local1.overview = f3_local2
	local f3_local3 = Engine.TableGetRowCount( CSV.awardTable.file )
	local f3_local4 = 0
	for f3_local5 = 0, f3_local3 - 1, 1 do
		local f3_local8 = CSV.ReadRow( CSV.awardTable, f3_local5 )
		if f3_local8.showInMenus == "1" then
			local f3_local9 = f3_local8.category
			if f3_local9 and f3_local9 ~= "" then
				if not f3_local1[f3_local9] then
					f3_local1[f3_local9] = {}
				end
				local f3_local10 = f0_local4( f3_arg0, f3_arg1, f0_local1 .. "." .. tostring( f3_local5 ), f3_local8 )
				f3_local4 = f3_local4 + f3_local10.count:GetValue( f3_arg1 )
				local f3_local11 = f3_local10.xp:GetValue( f3_arg1 )
				table.insert( f3_local1[f3_local9], f3_local10 )
				if f3_local11 > 0 then
					local f3_local12 = #f3_local2
					local f3_local13 = 8
					if f3_local12 < f3_local13 then
						table.insert( f3_local2, f3_local10 )
						table.sort( f3_local2, function ( f4_arg0, f4_arg1 )
							return f4_arg1.xp:GetValue( f3_arg1 ) < f4_arg0.xp:GetValue( f3_arg1 )
						end )
					end
					if f3_local2[f3_local13].xp:GetValue( f3_arg1 ) < f3_local11 then
						f3_local2[f3_local13] = f3_local10
						table.sort( f3_local2, function ( f5_arg0, f5_arg1 )
							return f5_arg1.xp:GetValue( f3_arg1 ) < f5_arg0.xp:GetValue( f3_arg1 )
						end )
					end
				end
			end
		end
	end
	local f3_local5 = CountTableKeys( f3_local1 )
	if f3_local5 ~= 0 then
		local f3_local6 = {}
		local f3_local7 = LUI.DataSourceFromList.new( f3_local5 )
		f3_local7.MakeDataSourceAtIndex = function ( f6_arg0, f6_arg1 )
			return f3_local6[f6_arg1 + 1]
		end
		
		f3_local7.GetDefaultFocusIndex = function ()
			return 0
		end
		
		for f3_local15, f3_local10 in pairs( f3_local1 ) do
			local f3_local11 = {}
			local f3_local12 = f0_local2[f3_local15] or f3_local15
			f3_local11.subCatRef = f3_local15
			f3_local11.name = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".tabs." .. f3_local15, Engine.Localize( f3_local12 ) )
			f3_local11.focusFunction = function ( f8_arg0, f8_arg1, f8_arg2 )
				if f3_local15 == "overview" then
					f3_arg0.MedalInfo:SetDataSourceThroughElement( f3_arg0.MedalOverview.MostImpressiveMedalGrid, nil )
					ACTIONS.LoseFocus( f3_arg0, "MedalGrid", f8_arg1 )
					ACTIONS.GainFocus( f3_arg0, "MedalOverview", f8_arg1 )
					ACTIONS.AnimateSequence( f3_arg0, "Overview" )
					if f3_local4 == 0 then
						f3_arg0.MedalInfo:SetAlpha( 0 )
					end
				else
					local f8_local0 = LUI.DataSourceFromList.new( #f3_local10 )
					f8_local0.MakeDataSourceAtIndex = function ( f9_arg0, f9_arg1, f9_arg2 )
						return f3_local10[f9_arg1 + 1]
					end
					
					f8_local0.GetDefaultFocusIndex = function ()
						return 0
					end
					
					f3_arg0.MedalGrid:SetGridDataSource( f8_local0, f8_arg1 )
					f3_arg0.MedalInfo:SetDataSourceThroughElement( f3_arg0.MedalGrid, nil )
					ACTIONS.LoseFocus( f3_arg0, "MedalOverview", f8_arg1 )
					ACTIONS.GainFocus( f3_arg0, "MedalGrid", f8_arg1 )
					ACTIONS.AnimateSequence( f3_arg0, "GridView" )
					f3_arg0.MedalInfo:SetAlpha( 1 )
				end
			end
			
			table.insert( f3_local6, f3_local11 )
		end
		table.sort( f3_local6, function ( f11_arg0, f11_arg1 )
			local f11_local0 = f11_arg0.subCatRef
			local f11_local1 = f11_arg1.subCatRef
			if f11_local0 == "overview" then
				return true
			elseif f11_local1 == "overview" then
				return false
			else
				return f11_local0 < f11_local1
			end
		end )
		f3_arg0.SubMenuTabsBar.Tabs:SetTabManagerDataSource( f3_local7 )
		f3_local14 = DataSources.alwaysLoaded.playerData.MP.ranked
		f3_local8 = 0 + f3_local14.losses:GetValue( f3_arg1 ) + f3_local14.wins:GetValue( f3_arg1 ) + f3_local14.ties:GetValue( f3_arg1 )
		f3_local9 = LUI.DataSourceFromList.new( #f3_local2 )
		f3_local9.MakeDataSourceAtIndex = function ( f12_arg0, f12_arg1, f12_arg2 )
			return f3_local2[f12_arg1 + 1]
		end
		
		f3_local9.GetDefaultFocusIndex = function ()
			return 0
		end
		
		if f3_local8 < 1 then
			f3_local8 = 1
		end
		f3_arg0.MedalOverview:SetDataSource( {
			totalMedals = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".totalNumMedals", f3_local4 ),
			avgMedals = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".avgMedals", string.format( "%.2f", f3_local4 / f3_local8 ) ),
			mostImpressiveMedals = f3_local9
		}, f3_arg1 )
		ACTIONS.AnimateSequence( f3_arg0, "Overview" )
		ACTIONS.GainFocus( f3_arg0, "MedalOverview", f3_arg1 )
	end
end

function MedalsMenu( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "MedalsMenu"
	self._animationSets = {}
	self._sequences = {}
	local f14_local1 = controller and controller.controllerIndex
	if not f14_local1 and not Engine.InFrontend() then
		f14_local1 = self:getRootController()
	end
	assert( f14_local1 )
	self:playSound( "menu_open" )
	local f14_local2 = self
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f14_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local SocialFeed = nil
	
	SocialFeed = MenuBuilder.BuildRegisteredType( "SocialFeed", {
		controllerIndex = f14_local1
	} )
	SocialFeed.id = "SocialFeed"
	SocialFeed:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -0.5, _1080p * 1919.5, _1080p * 965, _1080p * 995 )
	self:addElement( SocialFeed )
	self.SocialFeed = SocialFeed
	
	local ListCount = nil
	
	ListCount = LUI.UIText.new()
	ListCount.id = "ListCount"
	ListCount:setText( "1/15", 0 )
	ListCount:SetFontSize( 24 * _1080p )
	ListCount:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ListCount:SetAlignment( LUI.Alignment.Center )
	ListCount:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 465, _1080p * 610, _1080p * 889, _1080p * 913 )
	self:addElement( ListCount )
	self.ListCount = ListCount
	
	local SubMenuTabsBar = nil
	
	SubMenuTabsBar = MenuBuilder.BuildRegisteredType( "SubMenuTabsBar", {
		controllerIndex = f14_local1
	} )
	SubMenuTabsBar.id = "SubMenuTabsBar"
	SubMenuTabsBar:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 145, _1080p * 185 )
	self:addElement( SubMenuTabsBar )
	self.SubMenuTabsBar = SubMenuTabsBar
	
	local MissionTeamInfo = nil
	
	MissionTeamInfo = MenuBuilder.BuildRegisteredType( "MissionTeamInfo", {
		controllerIndex = f14_local1
	} )
	MissionTeamInfo.id = "MissionTeamInfo"
	MissionTeamInfo:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -700, 0, _1080p * 54, _1080p * 141 )
	self:addElement( MissionTeamInfo )
	self.MissionTeamInfo = MissionTeamInfo
	
	local Scrollbar = nil
	
	Scrollbar = MenuBuilder.BuildRegisteredType( "VerticalMinimalScrollbar", {
		controllerIndex = f14_local1
	} )
	Scrollbar.id = "Scrollbar"
	Scrollbar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 105, _1080p * 121, _1080p * 216, _1080p * 866 )
	self:addElement( Scrollbar )
	self.Scrollbar = Scrollbar
	
	local MedalGrid = nil
	
	MedalGrid = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 5,
		maxVisibleRows = 4,
		controllerIndex = f14_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "MedalButton", {
				controllerIndex = f14_local1
			} )
		end,
		wrapX = false,
		wrapY = false,
		primaryAxis = LUI.DIRECTION.horizontal,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		columnWidth = _1080p * 155,
		rowHeight = _1080p * 155,
		scrollingThresholdX = 0,
		scrollingThresholdY = 1,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	MedalGrid.id = "MedalGrid"
	MedalGrid:setUseStencil( true )
	MedalGrid:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 945, _1080p * 216, _1080p * 866 )
	self:addElement( MedalGrid )
	self.MedalGrid = MedalGrid
	
	local MedalOverview = nil
	
	MedalOverview = MenuBuilder.BuildRegisteredType( "MedalOverview", {
		controllerIndex = f14_local1
	} )
	MedalOverview.id = "MedalOverview"
	MedalOverview:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 945, _1080p * 216, _1080p * 866 )
	self:addElement( MedalOverview )
	self.MedalOverview = MedalOverview
	
	local MedalInfo = nil
	
	MedalInfo = MenuBuilder.BuildRegisteredType( "MedalInfo", {
		controllerIndex = f14_local1
	} )
	MedalInfo.id = "MedalInfo"
	MedalInfo:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -900, 0, _1080p * 216, _1080p * 866 )
	self:addElement( MedalInfo )
	self.MedalInfo = MedalInfo
	
	local MenuTitle = nil
	
	MenuTitle = MenuBuilder.BuildRegisteredType( "MenuTitle", {
		controllerIndex = f14_local1
	} )
	MenuTitle.id = "MenuTitle"
	MenuTitle.MenuTitle:setText( ToUpperCase( Engine.Localize( "INTEL_MP_MEDALS_GENERIC_DESC" ) ), 0 )
	MenuTitle.MenuBreadcrumbs:setText( ToUpperCase( "" ), 0 )
	MenuTitle.Icon:SetTop( _1080p * -28.5, 0 )
	MenuTitle.Icon:SetBottom( _1080p * 61.5, 0 )
	MenuTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
	self:addElement( MenuTitle )
	self.MenuTitle = MenuTitle
	
	local ArrowUp = nil
	
	ArrowUp = MenuBuilder.BuildRegisteredType( "ArrowUp", {
		controllerIndex = f14_local1
	} )
	ArrowUp.id = "ArrowUp"
	ArrowUp:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 610, _1080p * 630, _1080p * 882, _1080p * 922 )
	self:addElement( ArrowUp )
	self.ArrowUp = ArrowUp
	
	local ArrowDown = nil
	
	ArrowDown = MenuBuilder.BuildRegisteredType( "ArrowDown", {
		controllerIndex = f14_local1
	} )
	ArrowDown.id = "ArrowDown"
	ArrowDown:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 445, _1080p * 465, _1080p * 881, _1080p * 921 )
	self:addElement( ArrowDown )
	self.ArrowDown = ArrowDown
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		ListCount:RegisterAnimationSequence( "Overview", {
			{
				function ()
					return self.ListCount:SetAlpha( 0, 0 )
				end
			}
		} )
		Scrollbar:RegisterAnimationSequence( "Overview", {
			{
				function ()
					return self.Scrollbar:SetAlpha( 0, 0 )
				end
			}
		} )
		MedalGrid:RegisterAnimationSequence( "Overview", {
			{
				function ()
					return self.MedalGrid:SetAlpha( 0, 0 )
				end
			}
		} )
		MedalOverview:RegisterAnimationSequence( "Overview", {
			{
				function ()
					return self.MedalOverview:SetAlpha( 1, 0 )
				end
			}
		} )
		ArrowUp:RegisterAnimationSequence( "Overview", {
			{
				function ()
					return self.ArrowUp:SetAlpha( 0, 0 )
				end
			}
		} )
		ArrowDown:RegisterAnimationSequence( "Overview", {
			{
				function ()
					return self.ArrowDown:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Overview = function ()
			ListCount:AnimateSequence( "Overview" )
			Scrollbar:AnimateSequence( "Overview" )
			MedalGrid:AnimateSequence( "Overview" )
			MedalOverview:AnimateSequence( "Overview" )
			ArrowUp:AnimateSequence( "Overview" )
			ArrowDown:AnimateSequence( "Overview" )
		end
		
		ListCount:RegisterAnimationSequence( "GridView", {
			{
				function ()
					return self.ListCount:SetAlpha( 1, 0 )
				end
			}
		} )
		Scrollbar:RegisterAnimationSequence( "GridView", {
			{
				function ()
					return self.Scrollbar:SetAlpha( 1, 0 )
				end
			}
		} )
		MedalGrid:RegisterAnimationSequence( "GridView", {
			{
				function ()
					return self.MedalGrid:SetAlpha( 1, 0 )
				end
			}
		} )
		MedalOverview:RegisterAnimationSequence( "GridView", {
			{
				function ()
					return self.MedalOverview:SetAlpha( 0, 0 )
				end
			}
		} )
		ArrowUp:RegisterAnimationSequence( "GridView", {
			{
				function ()
					return self.ArrowUp:SetAlpha( 1, 0 )
				end
			}
		} )
		ArrowDown:RegisterAnimationSequence( "GridView", {
			{
				function ()
					return self.ArrowDown:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.GridView = function ()
			ListCount:AnimateSequence( "GridView" )
			Scrollbar:AnimateSequence( "GridView" )
			MedalGrid:AnimateSequence( "GridView" )
			MedalOverview:AnimateSequence( "GridView" )
			ArrowUp:AnimateSequence( "GridView" )
			ArrowDown:AnimateSequence( "GridView" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	local f14_local15 = LUI.UIScrollbar.new
	local bindButton = {
		direction = LUI.DIRECTION.vertical,
		eventListener = Scrollbar,
		startCap = Scrollbar.startCap,
		endCap = Scrollbar.endCap
	}
	local f14_local17 = Scrollbar.sliderArea
	if f14_local17 then
		f14_local17 = Scrollbar.sliderArea.slider
	end
	bindButton.slider = f14_local17
	f14_local17 = Scrollbar.sliderArea
	if f14_local17 then
		f14_local17 = Scrollbar.sliderArea.fixedSizeSlider
	end
	bindButton.fixedSizeSlider = f14_local17
	MedalGrid:AddScrollbar( f14_local15( bindButton ) )
	MedalGrid:AddArrow( ArrowUp )
	MedalGrid:AddArrow( ArrowDown )
	MedalGrid:AddItemNumbers( ListCount )
	self.addButtonHelperFunction = function ( f32_arg0, f32_arg1 )
		f32_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			priority = 10,
			clickable = true
		} )
	end
	
	self:addEventHandler( "menu_create", self.addButtonHelperFunction )
	
	bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	self.bindButton:addEventHandler( "button_secondary", function ( f33_arg0, f33_arg1 )
		local f33_local0 = f33_arg1.controller or f14_local1
		ACTIONS.LeaveMenu( self )
	end )
	f0_local5( self, f14_local1, controller )
	return self
end

MenuBuilder.registerType( "MedalsMenu", MedalsMenu )
LUI.FlowManager.RegisterStackPopBehaviour( "MedalsMenu", f0_local3 )
LockTable( _M )
