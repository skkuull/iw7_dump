local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "frontEnd.gameModes"
f0_local1 = function ()
	WipeGlobalModelsAtPath( f0_local0 )
end

f0_local2 = function ()
	local f2_local0 = Engine.GetDvarString( "ui_gametype" )
	local f2_local1 = Lobby.gameModeCategories.STANDARD
	if MLG.AreMLGRulesEnabled() then
		f2_local1 = Lobby.gameModeCategories.CWL
	else
		for f2_local2 = 0, Engine.TableGetRowCount( CSV.gameTypesTable.file ) - 1, 1 do
			local f2_local5 = CSV.ReadRow( CSV.gameTypesTable, f2_local2 )
			if f2_local5.ref == f2_local0 then
				f2_local1 = f2_local5.category
				break
			end
		end
	end
	return f2_local1
end

local f0_local3 = function ( f3_arg0, f3_arg1, f3_arg2 )
	assert( f3_arg0.Tabs )
	assert( f3_arg0.Tabs.Tabs )
	Lobby.SetupPrivateMatchLobbyScene( f3_arg1 )
	local f3_local0 = {
		[#f3_local0 + 1] = {
			name = Engine.Localize( "@LUA_MENU_STANDARD_MODES" ),
			id = Lobby.gameModeCategories.STANDARD
		},
		[#f3_local0 + 1] = {
			name = Engine.Localize( "@LUA_MENU_ALTERNATE_MODES" ),
			id = Lobby.gameModeCategories.ALTERNATE
		},
		[#f3_local0 + 1] = {
			name = Engine.Localize( "@LUA_MENU_CWL_MODES" ),
			id = Lobby.gameModeCategories.CWL
		}
	}
	local f3_local1 = LUI.DataSourceFromList.new( #f3_local0 )
	f3_local1.MakeDataSourceAtIndex = function ( f4_arg0, f4_arg1, f4_arg2 )
		return {
			name = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".tabName." .. f4_arg1, f3_local0[f4_arg1 + 1].name ),
			focusFunction = function ()
				WipeGlobalModelsAtPath( f0_local0 .. ".mode" )
				local f5_local0 = f3_local0[f4_arg1 + 1].id
				if f5_local0 == Lobby.gameModeCategories.CWL then
					f3_arg0.ESportsRulesLabel:ShowESportsRules()
				else
					f3_arg0.ESportsRulesLabel:TryHideESportsRules()
				end
				local f5_local1 = {}
				for f5_local2 = 0, Engine.TableGetRowCount( CSV.gameTypesTable.file ) - 1, 1 do
					local f5_local5 = CSV.ReadRow( CSV.gameTypesTable, f5_local2 )
					if tonumber( f5_local5.MLG ) == 1 and f5_local0 == Lobby.gameModeCategories.CWL then
						table.insert( f5_local1, f5_local5 )
					end
					if f5_local5.category == f5_local0 then
						table.insert( f5_local1, f5_local5 )
					end
				end
				local f5_local2 = LUI.DataSourceFromList.new( #f5_local1 )
				f5_local2.MakeDataSourceAtIndex = function ( f6_arg0, f6_arg1 )
					local f6_local0 = f0_local0 .. ".mode." .. f6_arg1 + 1
					local f6_local1 = f5_local1[f6_arg1 + 1]
					local f6_local2 = {
						name = LUI.DataSourceInGlobalModel.new( f6_local0 .. ".name", f6_local1.name ),
						desc = LUI.DataSourceInGlobalModel.new( f6_local0 .. ".desc", f6_local1.desc ),
						image = LUI.DataSourceInGlobalModel.new( f6_local0 .. ".image", f6_local1.image ),
						ref = f6_local1.ref
					}
					local f6_local3
					if tonumber( f6_local1.MLG ) ~= 1 or f5_local0 ~= Lobby.gameModeCategories.CWL then
						f6_local3 = false
					else
						f6_local3 = true
					end
					f6_local2.isMLGMode = f6_local3
					return f6_local2
				end
				
				f5_local2.GetDefaultFocusIndex = function ()
					local f7_local0 = Engine.GetDvarString( "ui_gametype" )
					for f7_local1 = 0, f5_local2:GetCountValue( f4_arg2 ) - 1, 1 do
						local f7_local4 = f5_local2:GetDataSourceAtIndex( f7_local1 )
						if f7_local4.ref == f7_local0 then
							f7_local4 = f5_local2:GetDataSourceAtIndex( f7_local1 )
							if f7_local4.isMLGMode == MLG.AreMLGRulesEnabled() then
								return f7_local1
							end
						end
					end
				end
				
				f3_arg0:SetDataSource( f5_local2, f4_arg2 )
			end
			
		}
	end
	
	f3_arg0.Tabs.Tabs:SetTabManagerDataSource( f3_local1, f3_arg1 )
	local f3_local2 = f0_local2()
	for self = 0, #f3_local0 - 1, 1 do
		if f3_local0[self + 1].id == f3_local2 then
			f3_arg0.Tabs.Tabs:FocusTab( self, FocusType.MenuFlow )
		end
	end
	f3_arg0.MenuTitle.MenuBreadcrumbs:setText( CoD.GetBreadcrumb(), 0 )
	if Engine.IsCoreMode() then
		local self = LUI.UIElement.new( {
			worldBlur = 5
		} )
		self:setupWorldBlur()
		self.id = "blur"
		f3_arg0:addElement( self )
	end
end

function GameModes( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "GameModes"
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
	
	local Modes = nil
	
	Modes = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 14,
		controllerIndex = f8_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "ModeButton", {
				controllerIndex = f8_local1
			} )
		end,
		wrapX = false,
		wrapY = true,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		columnWidth = _1080p * 500,
		rowHeight = _1080p * 30,
		scrollingThresholdX = 1,
		scrollingThresholdY = 3,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	Modes.id = "Modes"
	Modes:setUseStencil( false )
	Modes:SetGridDataSourceThroughElement( self, nil )
	Modes:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 630, _1080p * 296, _1080p * 846 )
	self:addElement( Modes )
	self.Modes = Modes
	
	local ModeDetails = nil
	
	ModeDetails = MenuBuilder.BuildRegisteredType( "ModeDetails", {
		controllerIndex = f8_local1
	} )
	ModeDetails.id = "ModeDetails"
	ModeDetails:SetDataSourceThroughElement( Modes, nil )
	ModeDetails.GenericItemInfo.BodyText:setText( "", 0 )
	ModeDetails.GenericItemInfo.HeaderText:setText( ToUpperCase( "" ), 0 )
	ModeDetails.Icon:setImage( RegisterMaterial( "gamemode_generic" ), 0 )
	ModeDetails:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -1200, 0, _1080p * 296, _1080p * 766 )
	self:addElement( ModeDetails )
	self.ModeDetails = ModeDetails
	
	local MenuTitle = nil
	
	MenuTitle = MenuBuilder.BuildRegisteredType( "MenuTitle", {
		controllerIndex = f8_local1
	} )
	MenuTitle.id = "MenuTitle"
	MenuTitle.MenuTitle:setText( ToUpperCase( Engine.Localize( "MENU_GAME_TYPES" ) ), 0 )
	MenuTitle.MenuBreadcrumbs:setText( ToUpperCase( Engine.Localize( "EXE_LOCAL_PLAY" ) ), 0 )
	MenuTitle.Icon:SetTop( _1080p * -28.5, 0 )
	MenuTitle.Icon:SetBottom( _1080p * 61.5, 0 )
	MenuTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
	self:addElement( MenuTitle )
	self.MenuTitle = MenuTitle
	
	local Scrollbar = nil
	
	Scrollbar = MenuBuilder.BuildRegisteredType( "VerticalMinimalScrollbar", {
		controllerIndex = f8_local1
	} )
	Scrollbar.id = "Scrollbar"
	Scrollbar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 112, _1080p * 296, _1080p * 766 )
	self:addElement( Scrollbar )
	self.Scrollbar = Scrollbar
	
	local FriendsElement = nil
	
	FriendsElement = MenuBuilder.BuildRegisteredType( "online_friends_widget", {
		controllerIndex = f8_local1
	} )
	FriendsElement.id = "FriendsElement"
	FriendsElement:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	FriendsElement:SetAlignment( LUI.Alignment.Left )
	FriendsElement:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 100, _1080p * 600, _1080p * -60, _1080p * -15 )
	self:addElement( FriendsElement )
	self.FriendsElement = FriendsElement
	
	local Tabs = nil
	
	Tabs = MenuBuilder.BuildRegisteredType( "SubMenuTabsBar", {
		controllerIndex = f8_local1
	} )
	Tabs.id = "Tabs"
	Tabs:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 145, _1080p * 185 )
	self:addElement( Tabs )
	self.Tabs = Tabs
	
	local SocialFeed = nil
	
	SocialFeed = MenuBuilder.BuildRegisteredType( "SocialFeed", {
		controllerIndex = f8_local1
	} )
	SocialFeed.id = "SocialFeed"
	SocialFeed:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -115, _1080p * -85 )
	self:addElement( SocialFeed )
	self.SocialFeed = SocialFeed
	
	local ESportsRulesLabel = nil
	
	ESportsRulesLabel = MenuBuilder.BuildRegisteredType( "ESportsRulesLabel", {
		controllerIndex = f8_local1
	} )
	ESportsRulesLabel.id = "ESportsRulesLabel"
	ESportsRulesLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1178, _1080p * 1778, _1080p * 94, _1080p * 124 )
	self:addElement( ESportsRulesLabel )
	self.ESportsRulesLabel = ESportsRulesLabel
	
	local ArrowUp = nil
	
	ArrowUp = MenuBuilder.BuildRegisteredType( "ArrowUp", {
		controllerIndex = f8_local1
	} )
	ArrowUp.id = "ArrowUp"
	ArrowUp:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 422.5, _1080p * 442.5, _1080p * 847, _1080p * 887 )
	self:addElement( ArrowUp )
	self.ArrowUp = ArrowUp
	
	local ArrowDown = nil
	
	ArrowDown = MenuBuilder.BuildRegisteredType( "ArrowDown", {
		controllerIndex = f8_local1
	} )
	ArrowDown.id = "ArrowDown"
	ArrowDown:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 257.5, _1080p * 277.5, _1080p * 846, _1080p * 886 )
	self:addElement( ArrowDown )
	self.ArrowDown = ArrowDown
	
	local ListCount = nil
	
	ListCount = LUI.UIText.new()
	ListCount.id = "ListCount"
	ListCount:setText( "1/15", 0 )
	ListCount:SetFontSize( 24 * _1080p )
	ListCount:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ListCount:SetAlignment( LUI.Alignment.Center )
	ListCount:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 277.5, _1080p * 422.5, _1080p * 854, _1080p * 878 )
	self:addElement( ListCount )
	self.ListCount = ListCount
	
	ModeDetails:SetDataSourceThroughElement( Modes, nil )
	local f8_local15 = LUI.UIScrollbar.new
	local bindButton = {
		direction = LUI.DIRECTION.vertical,
		eventListener = Scrollbar,
		startCap = Scrollbar.startCap,
		endCap = Scrollbar.endCap
	}
	local f8_local17 = Scrollbar.sliderArea
	if f8_local17 then
		f8_local17 = Scrollbar.sliderArea.slider
	end
	bindButton.slider = f8_local17
	f8_local17 = Scrollbar.sliderArea
	if f8_local17 then
		f8_local17 = Scrollbar.sliderArea.fixedSizeSlider
	end
	bindButton.fixedSizeSlider = f8_local17
	Modes:AddScrollbar( f8_local15( bindButton ) )
	Modes:AddArrow( ArrowUp )
	Modes:AddArrow( ArrowDown )
	Modes:AddItemNumbers( ListCount )
	self.addButtonHelperFunction = function ( f10_arg0, f10_arg1 )
		f10_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			priority = 10,
			clickable = true
		} )
		f10_arg0:AddButtonHelperText( {
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
	
	self.bindButton:addEventHandler( "button_secondary", function ( f11_arg0, f11_arg1 )
		local f11_local0 = f11_arg1.controller or f8_local1
		ACTIONS.LeaveMenu( self )
	end )
	f0_local3( self, f8_local1, controller )
	return self
end

MenuBuilder.registerType( "GameModes", GameModes )
LUI.FlowManager.RegisterStackPopBehaviour( "GameModes", f0_local1 )
LockTable( _M )
