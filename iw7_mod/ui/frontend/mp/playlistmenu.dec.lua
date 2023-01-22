local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "frontEnd.playlists"
f0_local1 = f0_local0 .. ".category"
f0_local2 = function ()
	Lobby.PopulatePlaylistDataModel( f0_local1 )
end

local f0_local3 = function ()
	WipeGlobalModelsAtPath( f0_local0 )
end

local f0_local4 = function ( f3_arg0, f3_arg1 )
	if f3_arg0 ~= nil then
		return f3_arg0 .. "_small"
	else
		return f3_arg0
	end
end

local f0_local5 = function ( f4_arg0, f4_arg1, f4_arg2 )
	assert( f4_arg0.Tabs )
	assert( f4_arg0.Tabs.Tabs )
	assert( f4_arg0.PlaylistList )
	assert( f4_arg0.PlaylistList.PlaylistButtons )
	assert( f4_arg0.PlaylistInfo )
	local f4_local0 = Playlist.GetPreselectedCategory()
	local f4_local1 = Playlist.GetPreselectedIndexInCategory()
	local f4_local2 = f0_local1
	local f4_local3 = LUI.DataSourceFromList.new( LUI.DataSourceInGlobalModel.new( f4_local2 .. ".count" ) )
	f4_local3.MakeDataSourceAtIndex = function ( f5_arg0, f5_arg1 )
		local f5_local0 = LUI.DataSourceInGlobalModel.new( f4_local2 .. ".index." .. f5_arg1 )
		local f5_local1 = f4_local2 .. "." .. f5_arg1 .. ".playlist"
		local f5_local2 = LUI.DataSourceFromList.new( LUI.DataSourceInGlobalModel.new( f5_local1 .. ".count" ) )
		f5_local2.MakeDataSourceAtIndex = function ( f6_arg0, f6_arg1 )
			return {
				name = LUI.DataSourceInGlobalModel.new( f5_local1 .. ".name." .. f6_arg1 ),
				disabled = LUI.DataSourceInGlobalModel.new( f5_local1 .. ".disabled." .. f6_arg1 ),
				hasDLC = LUI.DataSourceInGlobalModel.new( f5_local1 .. ".hasDLC." .. f6_arg1 ),
				image = LUI.DataSourceInGlobalModel.new( f5_local1 .. ".image." .. f6_arg1 ),
				smallImage = LUI.DataSourceInGlobalModel.new( f5_local1 .. ".smallImage." .. f6_arg1 ),
				desc = LUI.DataSourceInGlobalModel.new( f5_local1 .. ".desc." .. f6_arg1 ),
				categoryIndex = f5_local0,
				playlistIndex = LUI.DataSourceInGlobalModel.new( f5_local1 .. ".index." .. f6_arg1 ),
				minPlayerSize = LUI.DataSourceInGlobalModel.new( f5_local1 .. ".minPlayerSize." .. f6_arg1 ),
				maxPlayerSize = LUI.DataSourceInGlobalModel.new( f5_local1 .. ".maxPlayerSize." .. f6_arg1 ),
				minPartySize = LUI.DataSourceInGlobalModel.new( f5_local1 .. ".minPartySize." .. f6_arg1 ),
				maxPartySize = LUI.DataSourceInGlobalModel.new( f5_local1 .. ".maxPartySize." .. f6_arg1 ),
				isCompetitive = LUI.DataSourceInGlobalModel.new( f5_local1 .. ".isCompetitive." .. f6_arg1 )
			}
		end
		
		f5_local2.GetDefaultFocusIndex = function ()
			if f5_local0:GetValue( f4_arg1 ) == f4_local0 then
				for f7_local0 = 0, f5_local2:GetCountValue( f4_arg1 ) - 1, 1 do
					local f7_local3 = f4_local1
					local f7_local4 = f5_local2:GetDataSourceAtIndex( f7_local0 )
					if f7_local3 == f7_local4.playlistIndex:GetValue( f4_arg1 ) + 1 then
						return f7_local0
					end
				end
			end
		end
		
		return {
			name = LUI.DataSourceInGlobalModel.new( f4_local2 .. ".name." .. f5_arg1 ),
			disabled = LUI.DataSourceInGlobalModel.new( f4_local2 .. ".disabled." .. f5_arg1 ),
			index = f5_local0,
			focusFunction = function ()
				
			end
			,
			playlists = f5_local2
		}
	end
	
	f4_local3.GetDefaultFocusIndex = function ()
		for f9_local0 = 0, f4_local3:GetCountValue( f4_arg1 ) - 1, 1 do
			local f9_local3 = f4_local0
			local f9_local4 = f4_local3:GetDataSourceAtIndex( f9_local0 )
			if f9_local3 == f9_local4.index:GetValue( f4_arg1 ) + 1 then
				return f9_local0
			end
		end
	end
	
	f4_arg0.Tabs.Tabs:SetTabManagerDataSource( f4_local3, f4_arg1 )
	f4_arg0.PlaylistList.PlaylistButtons:SetGridDataSourceThroughElement( f4_arg0.Tabs.Tabs, "playlists" )
	f4_arg0.PlaylistInfo:SetDataSourceThroughElement( f4_arg0.PlaylistList.PlaylistButtons, nil )
	f4_arg0.MenuTitle.MenuBreadcrumbs:setText( ToUpperCase( Engine.Localize( "LUA_MENU_BREADCRUMB_2_ITEMS", "MENU_MULTIPLAYER", "LUA_MENU_PUBLIC_MATCH_CAPS" ) ), 0 )
	assert( f4_arg0.Scrollbar )
	local f4_local4 = LUI.UIScrollbar.new
	local self = {
		direction = LUI.DIRECTION.vertical,
		eventListener = f4_arg0.Scrollbar,
		startCap = f4_arg0.Scrollbar.startCap,
		endCap = f4_arg0.Scrollbar.endCap
	}
	local f4_local6 = f4_arg0.Scrollbar.sliderArea
	if f4_local6 then
		f4_local6 = f4_arg0.Scrollbar.sliderArea.slider
	end
	self.slider = f4_local6
	f4_local6 = f4_arg0.Scrollbar.sliderArea
	if f4_local6 then
		f4_local6 = f4_arg0.Scrollbar.sliderArea.fixedSizeSlider
	end
	self.fixedSizeSlider = f4_local6
	f4_arg0.PlaylistList.PlaylistButtons:AddScrollbar( f4_local4( self ) )
	if f4_arg0.CRMMain then
		f4_arg0.CRMMain:Minimize()
	end
	if Engine.IsCoreMode() then
		self = LUI.UIElement.new( {
			worldBlur = 5
		} )
		self:setupWorldBlur()
		self.id = "blur"
		f4_arg0:addElement( self )
	end
	f4_arg0:addElement( MP.GetGameModeMaterialStreamer() )
	f4_arg0:addElement( Lobby.GetMPMapMaterialStreamer() )
end

function PlaylistMenu( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "PlaylistMenu"
	local f10_local1 = controller and controller.controllerIndex
	if not f10_local1 and not Engine.InFrontend() then
		f10_local1 = self:getRootController()
	end
	assert( f10_local1 )
	self:playSound( "menu_open" )
	local f10_local2 = self
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f10_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local SocialFeed = nil
	
	SocialFeed = MenuBuilder.BuildRegisteredType( "SocialFeed", {
		controllerIndex = f10_local1
	} )
	SocialFeed.id = "SocialFeed"
	SocialFeed:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -115, _1080p * -85 )
	self:addElement( SocialFeed )
	self.SocialFeed = SocialFeed
	
	local FriendsElement = nil
	
	FriendsElement = MenuBuilder.BuildRegisteredType( "online_friends_widget", {
		controllerIndex = f10_local1
	} )
	FriendsElement.id = "FriendsElement"
	FriendsElement:SetFont( FONTS.GetFont( FONTS.Dev.File ) )
	FriendsElement:SetAlignment( LUI.Alignment.Left )
	FriendsElement:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1420, _1080p * 1920, _1080p * 1026, _1080p * 1071 )
	self:addElement( FriendsElement )
	self.FriendsElement = FriendsElement
	
	local MenuTitle = nil
	
	MenuTitle = MenuBuilder.BuildRegisteredType( "MenuTitle", {
		controllerIndex = f10_local1
	} )
	MenuTitle.id = "MenuTitle"
	MenuTitle.MenuTitle:setText( Engine.Localize( "LUA_MENU_MP_PLAYLIST_SELECT" ), 0 )
	MenuTitle.MenuBreadcrumbs:setText( "", 0 )
	MenuTitle.Icon:SetTop( _1080p * -28.5, 0 )
	MenuTitle.Icon:SetBottom( _1080p * 61.5, 0 )
	MenuTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
	self:addElement( MenuTitle )
	self.MenuTitle = MenuTitle
	
	local Tabs = nil
	
	Tabs = MenuBuilder.BuildRegisteredType( "SubMenuTabsBar", {
		controllerIndex = f10_local1
	} )
	Tabs.id = "Tabs"
	Tabs:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 145, _1080p * 185 )
	self:addElement( Tabs )
	self.Tabs = Tabs
	
	local f10_local8 = nil
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		f10_local8 = MenuBuilder.BuildRegisteredType( "MissionTeamInfo", {
			controllerIndex = f10_local1
		} )
		f10_local8.id = "MissionTeamInfo"
		f10_local8:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -700, 0, _1080p * 54, _1080p * 141 )
		self:addElement( f10_local8 )
		self.MissionTeamInfo = f10_local8
	end
	local PlaylistInfo = nil
	
	PlaylistInfo = MenuBuilder.BuildRegisteredType( "PlaylistInfo", {
		controllerIndex = f10_local1
	} )
	PlaylistInfo.id = "PlaylistInfo"
	PlaylistInfo:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -1200, _1080p * 5, _1080p * 296, _1080p * 766 )
	self:addElement( PlaylistInfo )
	self.PlaylistInfo = PlaylistInfo
	
	local Scrollbar = nil
	
	Scrollbar = MenuBuilder.BuildRegisteredType( "VerticalMinimalScrollbar", {
		controllerIndex = f10_local1
	} )
	Scrollbar.id = "Scrollbar"
	Scrollbar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 112, _1080p * 296, _1080p * 766 )
	self:addElement( Scrollbar )
	self.Scrollbar = Scrollbar
	
	local PlaylistList = nil
	
	PlaylistList = MenuBuilder.BuildRegisteredType( "PlaylistList", {
		controllerIndex = f10_local1
	} )
	PlaylistList.id = "PlaylistList"
	PlaylistList:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 630, _1080p * 296, _1080p * 608 )
	self:addElement( PlaylistList )
	self.PlaylistList = PlaylistList
	
	local CRMMain = nil
	
	CRMMain = MenuBuilder.BuildRegisteredType( "CRMMain", {
		controllerIndex = f10_local1
	} )
	CRMMain.id = "CRMMain"
	CRMMain:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 136, _1080p * 447, _1080p * 745, _1080p * 1069 )
	self:addElement( CRMMain )
	self.CRMMain = CRMMain
	
	self.addButtonHelperFunction = function ( f11_arg0, f11_arg1 )
		f11_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			priority = 10,
			clickable = true
		} )
		f11_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_SELECT" ),
			button_ref = "button_primary",
			side = "left",
			priority = -10,
			clickable = true
		} )
	end
	
	self:addEventHandler( "menu_create", self.addButtonHelperFunction )
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	self.bindButton:addEventHandler( "button_secondary", function ( f12_arg0, f12_arg1 )
		local f12_local0 = f12_arg1.controller or f10_local1
		ACTIONS.LeaveMenu( self )
	end )
	f0_local5( self, f10_local1, controller )
	return self
end

MenuBuilder.registerType( "PlaylistMenu", PlaylistMenu )
LUI.FlowManager.RegisterStackPushBehaviour( "PlaylistMenu", f0_local2 )
LUI.FlowManager.RegisterStackPopBehaviour( "PlaylistMenu", f0_local3 )
LockTable( _M )
