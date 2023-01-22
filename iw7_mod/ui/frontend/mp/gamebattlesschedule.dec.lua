local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "gamebattles.schedule"
function GetMatchDataSourceAtIndex( f1_arg0 )
	return function ( f2_arg0, f2_arg1, f2_arg2 )
		return {
			matchId = LUI.DataSourceInGlobalModel.new( f1_arg0 .. "." .. f2_arg1 .. ".matchId" ),
			matchTime = LUI.DataSourceInGlobalModel.new( f1_arg0 .. "." .. f2_arg1 .. ".matchTime" ),
			gameCount = LUI.DataSourceInGlobalModel.new( f1_arg0 .. "." .. f2_arg1 .. ".gameCount" )
		}
	end
	
end

f0_local1 = function ( f3_arg0, f3_arg1 )
	local f3_local0 = LUI.DataSourceFromList.new( f3_arg0 )
	f3_local0.MakeDataSourceAtIndex = GetMatchDataSourceAtIndex( f3_arg1 .. ".matches" )
	return f3_local0
end

f0_local2 = function ( f4_arg0, f4_arg1 )
	local f4_local0 = "frontEnd.mlg"
	DataSources.frontEnd.mlg = LUI.DataSourceInGlobalModel.new( f4_local0 )
	DataSources.frontEnd.mlg.count = LUI.DataSourceInGlobalModel.new( f4_local0 .. ".count" )
	DataSources.frontEnd.mlg.matches = f0_local1( DataSources.frontEnd.mlg.count, f4_local0 )
end

local f0_local3 = function ( f5_arg0, f5_arg1 )
	for f5_local0 = 1, #f5_arg0, 1 do
		if f5_arg0[f5_local0].loadname == f5_arg1 then
			return f5_arg0[f5_local0]
		end
	end
	return nil
end

local f0_local4 = function ()
	local f6_local0 = {}
	for f6_local1 = 0, Lobby.GetMapFeederCount() - 1, 1 do
		table.insert( f6_local0, {
			name = Lobby.GetMapNameByIndex( f6_local1 ),
			loadname = Lobby.GetMapLoadNameByIndex( f6_local1 ),
			ref = mapRef,
			desc = Lobby.GetMapDescByIndex( f6_local1 ),
			image = Lobby.GetMapImageByIndex( f6_local1 )
		} )
	end
	return f6_local0
end

local f0_local5 = function ( f7_arg0, f7_arg1, f7_arg2 )
	local f7_local0 = LUI.DataSourceFromList.new( #f7_arg1.teams[f7_arg2].players )
	f7_local0.MakeDataSourceAtIndex = function ( f8_arg0, f8_arg1 )
		return {
			name = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".team" .. f7_arg2 .. "." .. f8_arg1 + 1 .. ".name", f7_arg1.teams[f7_arg2].players[f8_arg1 + 1].name )
		}
	end
	
	return f7_local0
end

local f0_local6 = function ()
	WipeGlobalModelsAtPath( f0_local0 )
end

function ConfirmMatchSet( f10_arg0, f10_arg1 )
	assert( f10_arg1.matchID )
	assert( f10_arg1.matches )
	assert( f10_arg1.controllerIndex )
	local f10_local0 = MenuBuilder.BuildRegisteredType( "PopupYesNo", {
		title = Engine.Localize( "MENU_NOTICE" ),
		message = Engine.Localize( "MLG_GAMEBATTLES_SET_MATCH_ID", f10_arg1.matchID ),
		yesAction = function ( f11_arg0, f11_arg1 )
			MLG.SetGameBattleMatchId( f10_arg1.matchID )
			for f11_local0 = 0, f10_arg1.matches:GetNumRows() - 1, 1 do
				local f11_local3 = f10_arg1.matches:GetElementAtPosition( 0, f11_local0 )
				f11_local3:UpdateSelectedState( f11_arg1 )
			end
		end
	} )
	f10_local0.id = "ConfirmMatchSet"
	return f10_local0
end

MenuBuilder.registerType( "ConfirmMatchSet", ConfirmMatchSet )
local f0_local7 = function ( f12_arg0, f12_arg1, f12_arg2 )
	f0_local2( f12_arg0, f12_arg1 )
	f12_arg0.Matches:SetGridDataSource( DataSources.frontEnd.mlg.matches )
	local f12_local0 = f0_local4()
	f12_arg0:SubscribeToModelThroughElement( f12_arg0.Matches, "matchId", function ()
		WipeGlobalModelsAtPath( f0_local0 )
		local f13_local0 = f12_arg0.Matches:GetDataSource()
		local f13_local1 = GAMEBATTLES.GetMatchByMatchID( f12_arg1, f13_local0.matchId:GetValue( f12_arg1 ) )
		if f13_local1 ~= nil then
			f12_arg0.MLGScheduleTeams.TeamAName:setText( f13_local1.teams[1].teamName )
			f12_arg0.MLGScheduleTeams.TeamBName:setText( f13_local1.teams[2].teamName )
			f12_arg0.MLGScheduleTeams.TeamAMembers:SetGridDataSource( f0_local5( f12_arg0, f13_local1, 1 ) )
			f12_arg0.MLGScheduleTeams.TeamBMembers:SetGridDataSource( f0_local5( f12_arg0, f13_local1, 2 ) )
			local f13_local2 = LUI.DataSourceFromList.new( #f13_local1.games )
			f13_local2.MakeDataSourceAtIndex = function ( f14_arg0, f14_arg1 )
				local f14_local0 = f0_local0 .. ".game." .. f14_arg1 + 1
				local f14_local1 = f0_local3( f12_local0, f13_local1.games[f14_arg1 + 1].map )
				local f14_local2 = f13_local1.games[f14_arg1 + 1].gametype
				return {
					name = LUI.DataSourceInGlobalModel.new( f14_local0 .. ".name", f14_local1.name ),
					image = LUI.DataSourceInGlobalModel.new( f14_local0 .. ".image", f14_local1.image ),
					gametypeName = LUI.DataSourceInGlobalModel.new( f14_local0 .. ".gametypeName", Engine.Localize( Engine.TableLookup( CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, f14_local2, CSV.gameTypesTable.cols.name ) ) ),
					gametypeIcon = LUI.DataSourceInGlobalModel.new( f14_local0 .. ".gametypeIcon", Engine.TableLookup( CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, f14_local2, CSV.gameTypesTable.cols.image ) )
				}
			end
			
			f12_arg0.Maps:SetGridDataSource( f13_local2 )
		end
	end )
	local f12_local1 = MenuBuilder.BuildRegisteredType( "LobbyStatus", {
		controllerIndex = f12_arg1
	} )
	f12_local1:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -800, _1080p * -40, _1080p * -114, _1080p * -80 )
	f12_local1:Minimize()
	f12_arg0:addElement( f12_local1 )
	local f12_local2 = LUI.DataSourceInGlobalModel.new( "frontEnd.lobby.areWeGameHost" )
	if f12_local2:GetValue( f12_arg1 ) and MLG.GetGameBattleMatchJoinState( f12_arg1 ) == GAMEBATTLES.MLG_MATCH_JOIN_STATE.IDLE then
		f12_arg0.bindButton:addEventHandler( "button_primary", function ( f15_arg0, f15_arg1 )
			local f15_local0 = f12_arg0.Matches:GetDataSource()
			f15_local0 = f15_local0.matchId:GetValue( f12_arg1 )
			if MLG.GetGameBattleMatchId( f12_arg1 ) ~= f15_local0 then
				LUI.FlowManager.RequestPopupMenu( f12_arg0, "ConfirmMatchSet", true, f15_arg1.controller, false, {
					matchID = f15_local0,
					matches = f12_arg0.Matches
				} )
			end
		end )
		f12_arg0:AddButtonHelperTextToElement( f12_arg0.ButtonHelperBar, {
			helper_text = Engine.Localize( "MLG_GAMEBATTLES_SET_AS_CURRENT" ),
			button_ref = "button_primary",
			side = "left",
			clickable = true
		} )
	end
end

function GameBattlesSchedule( menu, controller )
	local self = LUI.UIHorizontalNavigator.new()
	self.id = "GameBattlesSchedule"
	local f16_local1 = controller and controller.controllerIndex
	if not f16_local1 and not Engine.InFrontend() then
		f16_local1 = self:getRootController()
	end
	assert( f16_local1 )
	self:playSound( "menu_open" )
	local f16_local2 = self
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f16_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local FriendsElement = nil
	
	FriendsElement = MenuBuilder.BuildRegisteredType( "online_friends_widget", {
		controllerIndex = f16_local1
	} )
	FriendsElement.id = "FriendsElement"
	FriendsElement:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	FriendsElement:SetAlignment( LUI.Alignment.Left )
	FriendsElement:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 100, _1080p * 600, _1080p * -60, _1080p * -15 )
	self:addElement( FriendsElement )
	self.FriendsElement = FriendsElement
	
	local SocialFeed = nil
	
	SocialFeed = MenuBuilder.BuildRegisteredType( "SocialFeed", {
		controllerIndex = f16_local1
	} )
	SocialFeed.id = "SocialFeed"
	SocialFeed:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1920, _1080p * 965.5, _1080p * 995.5 )
	self:addElement( SocialFeed )
	self.SocialFeed = SocialFeed
	
	local MenuTitle = nil
	
	MenuTitle = MenuBuilder.BuildRegisteredType( "MenuTitle", {
		controllerIndex = f16_local1
	} )
	MenuTitle.id = "MenuTitle"
	MenuTitle.MenuTitle:setText( Engine.Localize( "MENU_GAME_BATTLES_SCHEDULE_BUTTON" ), 0 )
	MenuTitle.MenuBreadcrumbs:setText( ToUpperCase( Engine.Localize( "LUA_MENU_GAME_BATTLES_LOBBY" ) ), 0 )
	MenuTitle.Icon:SetTop( _1080p * -28.5, 0 )
	MenuTitle.Icon:SetBottom( _1080p * 61.5, 0 )
	MenuTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
	self:addElement( MenuTitle )
	self.MenuTitle = MenuTitle
	
	local Matches = nil
	
	Matches = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 6,
		controllerIndex = f16_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "MLGScheduleButton", {
				controllerIndex = f16_local1
			} )
		end,
		wrapX = true,
		wrapY = true,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		columnWidth = _1080p * 400,
		rowHeight = _1080p * 110,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	Matches.id = "Matches"
	Matches:setUseStencil( true )
	Matches:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 530, _1080p * 200, _1080p * 910 )
	self:addElement( Matches )
	self.Matches = Matches
	
	local ArrowUp = nil
	
	ArrowUp = MenuBuilder.BuildRegisteredType( "ArrowUp", {
		controllerIndex = f16_local1
	} )
	ArrowUp.id = "ArrowUp"
	ArrowUp:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 402.5, _1080p * 422.5, _1080p * 921.5, _1080p * 961.5 )
	self:addElement( ArrowUp )
	self.ArrowUp = ArrowUp
	
	local ArrowDown = nil
	
	ArrowDown = MenuBuilder.BuildRegisteredType( "ArrowDown", {
		controllerIndex = f16_local1
	} )
	ArrowDown.id = "ArrowDown"
	ArrowDown:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 237.5, _1080p * 257.5, _1080p * 921.5, _1080p * 961.5 )
	self:addElement( ArrowDown )
	self.ArrowDown = ArrowDown
	
	local Scrollbar = nil
	
	Scrollbar = MenuBuilder.BuildRegisteredType( "VerticalMinimalScrollbar", {
		controllerIndex = f16_local1
	} )
	Scrollbar.id = "Scrollbar"
	Scrollbar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 106, _1080p * 123, _1080p * 200, _1080p * 953.5 )
	self:addElement( Scrollbar )
	self.Scrollbar = Scrollbar
	
	local ListCount = nil
	
	ListCount = LUI.UIText.new()
	ListCount.id = "ListCount"
	ListCount:setText( "1/15", 0 )
	ListCount:SetFontSize( 24 * _1080p )
	ListCount:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ListCount:SetAlignment( LUI.Alignment.Center )
	ListCount:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 257.5, _1080p * 402.5, _1080p * 929.5, _1080p * 953.5 )
	self:addElement( ListCount )
	self.ListCount = ListCount
	
	local MLGScheduleTeams = nil
	
	MLGScheduleTeams = MenuBuilder.BuildRegisteredType( "MLGScheduleTeams", {
		controllerIndex = f16_local1
	} )
	MLGScheduleTeams.id = "MLGScheduleTeams"
	MLGScheduleTeams:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 606, _1080p * 1756, _1080p * 659.5, _1080p * 953.5 )
	self:addElement( MLGScheduleTeams )
	self.MLGScheduleTeams = MLGScheduleTeams
	
	local Maps = nil
	
	Maps = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 4,
		maxVisibleRows = 2,
		controllerIndex = f16_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "ScheduleMapInfo", {
				controllerIndex = f16_local1
			} )
		end,
		wrapX = true,
		wrapY = true,
		spacingX = _1080p * 40,
		spacingY = _1080p * 40,
		columnWidth = _1080p * 266,
		rowHeight = _1080p * 175,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	Maps.id = "Maps"
	Maps:setUseStencil( true )
	Maps:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 606, _1080p * 1790, _1080p * 200, _1080p * 590 )
	self:addElement( Maps )
	self.Maps = Maps
	
	local f16_local14 = LUI.UIScrollbar.new
	local bindButton = {
		direction = LUI.DIRECTION.vertical,
		eventListener = Scrollbar,
		startCap = Scrollbar.startCap,
		endCap = Scrollbar.endCap
	}
	local f16_local16 = Scrollbar.sliderArea
	if f16_local16 then
		f16_local16 = Scrollbar.sliderArea.slider
	end
	bindButton.slider = f16_local16
	f16_local16 = Scrollbar.sliderArea
	if f16_local16 then
		f16_local16 = Scrollbar.sliderArea.fixedSizeSlider
	end
	bindButton.fixedSizeSlider = f16_local16
	Matches:AddScrollbar( f16_local14( bindButton ) )
	Matches:AddArrow( ArrowUp )
	Matches:AddArrow( ArrowDown )
	Matches:AddItemNumbers( ListCount )
	self.addButtonHelperFunction = function ( f19_arg0, f19_arg1 )
		f19_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_OPTIONS_CAPS" ),
			button_ref = "button_start",
			side = "left",
			priority = 100,
			clickable = true
		} )
		f19_arg0:AddButtonHelperText( {
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
	
	self.bindButton:addEventHandler( "button_start", function ( f20_arg0, f20_arg1 )
		ACTIONS.OpenMenu( "OptionsMenu", true, f20_arg1.controller or f16_local1 )
	end )
	self.bindButton:addEventHandler( "button_secondary", function ( f21_arg0, f21_arg1 )
		local f21_local0 = f21_arg1.controller or f16_local1
		ACTIONS.LeaveMenu( self )
	end )
	f0_local7( self, f16_local1, controller )
	return self
end

MenuBuilder.registerType( "GameBattlesSchedule", GameBattlesSchedule )
LUI.FlowManager.RegisterStackPopBehaviour( "GameBattlesSchedule", f0_local6 )
LockTable( _M )
