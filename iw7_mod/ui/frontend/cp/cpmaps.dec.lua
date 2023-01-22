local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ()
	Engine.SetFrontEndSceneSection( "zm_map_selection", 1 )
end

f0_local1 = "frontEnd.maps"
f0_local2 = function ()
	WipeGlobalModelsAtPath( f0_local1 )
end

local f0_local3 = function ( f3_arg0, f3_arg1, f3_arg2 )
	f3_arg0:SetDataSource( ZombiesUtils.GetMapsDataSources( f0_local1, f3_arg1 ), f3_arg1 )
end

function CPMaps( menu, controller )
	local self = LUI.UIHorizontalNavigator.new()
	self.id = "CPMaps"
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	f0_local0( self, f4_local1, controller )
	self:playSound( "menu_open" )
	local f4_local2 = self
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f4_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local FriendsElement = nil
	
	FriendsElement = MenuBuilder.BuildRegisteredType( "online_friends_widget", {
		controllerIndex = f4_local1
	} )
	FriendsElement.id = "FriendsElement"
	FriendsElement:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	FriendsElement:SetAlignment( LUI.Alignment.Left )
	FriendsElement:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 100, _1080p * 600, _1080p * -60, _1080p * -15 )
	self:addElement( FriendsElement )
	self.FriendsElement = FriendsElement
	
	local MapButtons = nil
	
	MapButtons = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 7,
		controllerIndex = f4_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "MapButton", {
				controllerIndex = f4_local1
			} )
		end,
		wrapX = true,
		wrapY = true,
		primaryAxis = LUI.DIRECTION.horizontal,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		columnWidth = _1080p * 500,
		rowHeight = _1080p * 30,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = true,
		horizontalAlignment = LUI.Alignment.Center,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	MapButtons.id = "MapButtons"
	MapButtons:setUseStencil( false )
	MapButtons:SetGridDataSourceThroughElement( self, nil )
	MapButtons:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 630, _1080p * 200, _1080p * 470 )
	self:addElement( MapButtons )
	self.MapButtons = MapButtons
	
	local CPMenuTitle = nil
	
	CPMenuTitle = MenuBuilder.BuildRegisteredType( "CPMenuTitle", {
		controllerIndex = f4_local1
	} )
	CPMenuTitle.id = "CPMenuTitle"
	CPMenuTitle.MenuTitle:setText( Engine.Localize( "LUA_MENU_ZM_SELECT_SHOW_CAPS" ), 0 )
	CPMenuTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
	self:addElement( CPMenuTitle )
	self.CPMenuTitle = CPMenuTitle
	
	local f4_local7 = nil
	if CONDITIONS.IsDirectorsCutAvailable( f4_local1 ) then
		f4_local7 = MenuBuilder.BuildRegisteredType( "CPMapsTalisman", {
			controllerIndex = f4_local1
		} )
		f4_local7.id = "CPMapsTalisman"
		f4_local7:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 88, _1080p * 130, _1080p * 195, _1080p * 397 )
		self:addElement( f4_local7 )
		self.CPMapsTalisman = f4_local7
	end
	self.addButtonHelperFunction = function ( f6_arg0, f6_arg1 )
		f6_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_SELECT" ),
			button_ref = "button_primary",
			side = "left",
			clickable = true
		} )
		f6_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			clickable = true
		} )
	end
	
	self:addEventHandler( "menu_create", self.addButtonHelperFunction )
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	self.bindButton:addEventHandler( "button_secondary", function ( f7_arg0, f7_arg1 )
		local f7_local0 = f7_arg1.controller or f4_local1
		ACTIONS.LeaveMenu( self )
	end )
	f0_local3( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "CPMaps", CPMaps )
LUI.FlowManager.RegisterStackPopBehaviour( "CPMaps", f0_local2 )
LockTable( _M )
