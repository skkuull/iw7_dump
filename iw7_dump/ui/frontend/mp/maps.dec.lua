local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ()
	if Engine.IsAliensMode() then
		Engine.SetFrontEndSceneSection( "zm_map_selection", 1 )
	end
end

f0_local1 = "frontEnd.maps"
f0_local2 = function ()
	WipeGlobalModelsAtPath( f0_local1 )
end

local f0_local3 = 1
local f0_local4 = function ( f3_arg0, f3_arg1, f3_arg2 )
	Lobby.SetupPrivateMatchLobbyScene( f3_arg1 )
	local f3_local0 = {}
	for f3_local1 = 0, Lobby.GetMapFeederCount() - 1, 1 do
		if Lobby.ShouldDisplayMap( f3_local1, f3_arg1 ) then
			table.insert( f3_local0, {
				name = Lobby.GetMapNameByIndex( f3_local1 ),
				ref = Lobby.GetMapLoadNameByIndex( f3_local1 ),
				desc = Lobby.GetMapDescByIndex( f3_local1 ),
				image = Lobby.GetMapImageByIndex( f3_local1 ),
				isOwned = Engine.IsMapPackOwned( Lobby.GetMapPackForMapIndex( f3_local1 ) )
			} )
		end
		f3_arg0.MenuTitle.MenuBreadcrumbs:setText( CoD.GetBreadcrumb(), 0 )
	end
	local f3_local1 = LUI.DataSourceFromList.new( #f3_local0 )
	f3_local1.MakeDataSourceAtIndex = function ( f4_arg0, f4_arg1 )
		local f4_local0 = f0_local1 .. ".map." .. f4_arg1 + 1
		local f4_local1 = f3_local0[f4_arg1 + 1]
		local f4_local2 = LUI.DataSourceInGlobalModel.new( f4_local0 .. ".isOwned" )
		f4_local2:SetValue( f3_arg1, f4_local1.isOwned )
		return {
			name = LUI.DataSourceInGlobalModel.new( f4_local0 .. ".name", f4_local1.name ),
			desc = LUI.DataSourceInGlobalModel.new( f4_local0 .. ".desc", f4_local1.desc ),
			image = LUI.DataSourceInGlobalModel.new( f4_local0 .. ".image", f4_local1.image ),
			isOwned = f4_local2,
			ref = f4_local1.ref
		}
	end
	
	f3_local1.GetDefaultFocusIndex = function ()
		local f5_local0 = Engine.GetDvarString( "ui_mapname" )
		for f5_local1 = 0, f3_local1:GetCountValue( f3_arg1 ) - 1, 1 do
			local f5_local4 = f3_local1:GetDataSourceAtIndex( f5_local1 )
			if f5_local4.ref == f5_local0 then
				return f5_local1
			end
		end
	end
	
	f3_arg0:SetDataSource( f3_local1, f3_arg1 )
	if Engine.IsCoreMode() then
		local self = LUI.UIElement.new( {
			worldBlur = 5
		} )
		self:setupWorldBlur()
		self.id = "blur"
		f3_arg0:addElement( self )
	end
end

function Maps( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "Maps"
	local f6_local1 = controller and controller.controllerIndex
	if not f6_local1 and not Engine.InFrontend() then
		f6_local1 = self:getRootController()
	end
	assert( f6_local1 )
	f0_local0( self, f6_local1, controller )
	self:playSound( "menu_open" )
	local f6_local2 = self
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f6_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local Maps = nil
	
	Maps = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 12,
		controllerIndex = f6_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "MapButton", {
				controllerIndex = f6_local1
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
	Maps.id = "Maps"
	Maps:setUseStencil( false )
	Maps:SetGridDataSourceThroughElement( self, nil )
	Maps:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 630, _1080p * 296, _1080p * 766 )
	self:addElement( Maps )
	self.Maps = Maps
	
	local MapDetails = nil
	
	MapDetails = MenuBuilder.BuildRegisteredType( "MapDetails", {
		controllerIndex = f6_local1
	} )
	MapDetails.id = "MapDetails"
	MapDetails:SetDataSourceThroughElement( Maps, nil )
	MapDetails:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -1200, 0, _1080p * 296, _1080p * 766 )
	self:addElement( MapDetails )
	self.MapDetails = MapDetails
	
	local Scrollbar = nil
	
	Scrollbar = MenuBuilder.BuildRegisteredType( "VerticalMinimalScrollbar", {
		controllerIndex = f6_local1
	} )
	Scrollbar.id = "Scrollbar"
	Scrollbar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 112, _1080p * 296, _1080p * 766 )
	self:addElement( Scrollbar )
	self.Scrollbar = Scrollbar
	
	local MenuTitle = nil
	
	MenuTitle = MenuBuilder.BuildRegisteredType( "MenuTitle", {
		controllerIndex = f6_local1
	} )
	MenuTitle.id = "MenuTitle"
	MenuTitle.MenuTitle:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MAPS_CAPS" ) ), 0 )
	MenuTitle.MenuBreadcrumbs:setText( ToUpperCase( Engine.Localize( "EXE_LOCAL_PLAY" ) ), 0 )
	MenuTitle.Icon:SetTop( _1080p * -28.5, 0 )
	MenuTitle.Icon:SetBottom( _1080p * 61.5, 0 )
	MenuTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
	self:addElement( MenuTitle )
	self.MenuTitle = MenuTitle
	
	local FriendsElement = nil
	
	FriendsElement = MenuBuilder.BuildRegisteredType( "online_friends_widget", {
		controllerIndex = f6_local1
	} )
	FriendsElement.id = "FriendsElement"
	FriendsElement:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	FriendsElement:SetAlignment( LUI.Alignment.Left )
	FriendsElement:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 100, _1080p * 600, _1080p * -60, _1080p * -15 )
	self:addElement( FriendsElement )
	self.FriendsElement = FriendsElement
	
	local SocialFeed = nil
	
	SocialFeed = MenuBuilder.BuildRegisteredType( "SocialFeed", {
		controllerIndex = f6_local1
	} )
	SocialFeed.id = "SocialFeed"
	SocialFeed:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -115, _1080p * -85 )
	self:addElement( SocialFeed )
	self.SocialFeed = SocialFeed
	
	MapDetails:SetDataSourceThroughElement( Maps, nil )
	local f6_local10 = LUI.UIScrollbar.new
	local bindButton = {
		direction = LUI.DIRECTION.vertical,
		eventListener = Scrollbar,
		startCap = Scrollbar.startCap,
		endCap = Scrollbar.endCap
	}
	local f6_local12 = Scrollbar.sliderArea
	if f6_local12 then
		f6_local12 = Scrollbar.sliderArea.slider
	end
	bindButton.slider = f6_local12
	f6_local12 = Scrollbar.sliderArea
	if f6_local12 then
		f6_local12 = Scrollbar.sliderArea.fixedSizeSlider
	end
	bindButton.fixedSizeSlider = f6_local12
	Maps:AddScrollbar( f6_local10( bindButton ) )
	self.addButtonHelperFunction = function ( f8_arg0, f8_arg1 )
		f8_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			priority = 10,
			clickable = true
		} )
		f8_arg0:AddButtonHelperText( {
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
	
	self.bindButton:addEventHandler( "button_secondary", function ( f9_arg0, f9_arg1 )
		local f9_local0 = f9_arg1.controller or f6_local1
		ACTIONS.LeaveMenu( self )
	end )
	f0_local4( self, f6_local1, controller )
	return self
end

MenuBuilder.registerType( "Maps", Maps )
LUI.FlowManager.RegisterStackPopBehaviour( "Maps", f0_local2 )
LockTable( _M )
