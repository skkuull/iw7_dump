local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4 )
	MLG.SetShoutcasterProfileVarValue( f1_arg1, f1_arg2, f1_arg3 - 1 )
	f1_arg0:dispatchEventToRoot( {
		name = "codcaster_setting_change",
		immediate = true,
		setting_category = "display",
		setting_name = f1_arg2,
		setting_value = f1_arg3 - 1,
		update_WidgetVisibility = f1_arg4
	} )
end

f0_local1 = function ( f2_arg0, f2_arg1 )
	return MLG.ShoutcasterProfileVarValue( f2_arg0, f2_arg1 ) + 1
end

f0_local2 = {
	{
		Name = "CODCASTER_DS_XRAY",
		Desc = "CODCASTER_DS_XRAY_DESC",
		Labels = {
			"CODCASTER_XRAY_ENEMY",
			"CODCASTER_XRAY_BOTH",
			"CODCASTER_XRAY_NONE"
		},
		SettingName = "shoutcaster_xray",
		UpdateWidgetVisibility = false
	},
	{
		Name = "CODCASTER_DS_TEAM_IDENTITY",
		Desc = "CODCASTER_DS_TEAM_IDENTITY_DESC",
		Labels = {
			"MENU_OFF",
			"MENU_ON"
		},
		SettingName = "shoutcaster_team_identity",
		UpdateWidgetVisibility = false
	},
	{
		Name = "CODCASTER_DS_TOOLBAR",
		Desc = "CODCASTER_DS_TOOLBAR_DESC",
		Labels = {
			"MENU_OFF",
			"MENU_ON"
		},
		SettingName = "shoutcaster_toolbar",
		UpdateWidgetVisibility = false
	},
	{
		Name = "CODCASTER_DS_MINIMAP",
		Desc = "CODCASTER_DS_MINIMAP_DESC",
		Labels = {
			"CODCASTER_MINIMAP_FULL_VIEW",
			"MENU_OFF",
			"CODCASTER_MINIMAP_STANDARD"
		},
		SettingName = "shoutcaster_minimap",
		UpdateWidgetVisibility = false
	},
	{
		Name = "CODCASTER_DS_TEAM_SCORE",
		Desc = "CODCASTER_DS_TEAM_SCORE_DESC",
		Labels = {
			"MENU_OFF",
			"MENU_ON"
		},
		SettingName = "shoutcaster_teamscore",
		UpdateWidgetVisibility = true
	},
	{
		Name = "CODCASTER_DS_INVENTORY",
		Desc = "CODCASTER_DS_INVENTORY_DESC",
		Labels = {
			"MENU_OFF",
			"MENU_ON"
		},
		SettingName = "shoutcaster_inventory",
		UpdateWidgetVisibility = true
	},
	{
		Name = "CODCASTER_DS_SCORESTREAKS",
		Desc = "CODCASTER_DS_SCORESTREAKS_DESC",
		Labels = {
			"MENU_OFF",
			"MENU_ON"
		},
		SettingName = "shoutcaster_scorestreaks",
		UpdateWidgetVisibility = true
	},
	{
		Name = "CODCASTER_DS_SCORESTREAK_NOTIFICATIONS",
		Desc = "CODCASTER_DS_SCORESTREAK_NOTIFICATIONS_DESC",
		Labels = {
			"MENU_OFF",
			"MENU_ON"
		},
		SettingName = "shoutcaster_scorestreaks_notification",
		UpdateWidgetVisibility = true
	},
	{
		Name = "CODCASTER_DS_SPECIALIST_NOTIFICATIONS",
		Desc = "CODCASTER_DS_SPECIALIST_NOTIFICATIONS_DESC",
		Labels = {
			"MENU_OFF",
			"MENU_ON"
		},
		SettingName = "shoutcaster_specialist_notification",
		UpdateWidgetVisibility = true
	},
	{
		Name = "CODCASTER_DS_OBJECTIVE_STATUS",
		Desc = "CODCASTER_DS_OBJECTIVE_STATUS_DESC",
		Labels = {
			"MENU_OFF",
			"MENU_ON"
		},
		SettingName = "shoutcaster_objective_status",
		UpdateWidgetVisibility = true
	},
	{
		Name = "CODCASTER_DS_WAYPOINT_MARKERS",
		Desc = "CODCASTER_DS_WAYPOINT_MARKERS_DESC",
		Labels = {
			"MENU_OFF",
			"MENU_ON"
		},
		SettingName = "shoutcaster_waypoint_markers",
		UpdateWidgetVisibility = false
	},
	{
		Name = "CODCASTER_DS_KILLFEED",
		Desc = "CODCASTER_DS_KILLFEED_DESC",
		Labels = {
			"MENU_OFF",
			"MENU_ON"
		},
		SettingName = "shoutcaster_killfeed",
		UpdateWidgetVisibility = true
	},
	{
		Name = "CODCASTER_DS_CALLOUT_CARDS",
		Desc = "CODCASTER_DS_CALLOUT_CARDS_DESC",
		Labels = {
			"MENU_OFF",
			"MENU_ON"
		},
		SettingName = "shoutcaster_calloutcards",
		UpdateWidgetVisibility = true
	},
	{
		Name = "CODCASTER_DS_PLAYER_NOTIFICATIONS",
		Desc = "CODCASTER_DS_PLAYER_NOTIFICATIONS_DESC",
		Labels = {
			"MENU_OFF",
			"MENU_ON"
		},
		SettingName = "shoutcaster_playernotifications",
		UpdateWidgetVisibility = true
	},
	{
		Name = "CODCASTER_DS_PLAYERPOINTS",
		Desc = "CODCASTER_DS_PLAYERPOINTS_DESC",
		Labels = {
			"MENU_OFF",
			"MENU_ON"
		},
		SettingName = "shoutcaster_player_points",
		UpdateWidgetVisibility = true
	},
	{
		Name = "CODCASTER_DS_VOIP_DOCK",
		Desc = "CODCASTER_DS_VOIP_DOCK_DESC",
		Labels = {
			"MENU_OFF",
			"MENU_ON"
		},
		SettingName = "shoutcaster_voipdock",
		UpdateWidgetVisibility = true
	},
	{
		Name = "CODCASTER_DS_ANNOUNCEMENT",
		Desc = "CODCASTER_DS_ANNOUNCEMENT_DESC",
		Labels = {
			"CODCASTER_ANNOUNCEMENT_ALL",
			"CODCASTER_ANNOUNCEMENT_MAJOR_ONLY",
			"CODCASTER_ANNOUNCEMENT_MINOR_ONLY",
			"MENU_OFF"
		},
		SettingName = "shoutcaster_announcement",
		UpdateWidgetVisibility = false
	},
	{
		Name = "CODCASTER_DS_CAMERAICON",
		Desc = "CODCASTER_DS_CAMERAICON_DESC",
		Labels = {
			"MENU_OFF",
			"MENU_ON"
		},
		SettingName = "shoutcaster_cameraicon",
		UpdateWidgetVisibility = false
	}
}
local f0_local3 = function ( f3_arg0, f3_arg1, f3_arg2, f3_arg3 )
	assert( type( f3_arg2 ) == "number" )
	assert( f3_arg2 >= 0 )
	assert( f3_arg2 < table.getn( f0_local2 ) )
	f3_arg0.Title:setText( ToUpperCase( Engine.Localize( f0_local2[f3_arg2 + 1].Name ) ) )
	f3_arg0.Desc = Engine.Localize( f0_local2[f3_arg2 + 1].Desc )
	local f3_local0 = {}
	for f3_local4 in ipairs( f0_local2[f3_arg2 + 1].Labels ) do
		f3_local0[f3_local4] = Engine.Localize( f0_local2[f3_arg2 + 1].Labels[f3_local4] )
	end
	LUI.AddUIArrowTextButtonLogic( f3_arg0, f3_arg3, {
		labels = f3_local0,
		action = function ( f4_arg0, f4_arg1 )
			f0_local0( f3_arg0, f4_arg1, f0_local2[f3_arg2 + 1].SettingName, f4_arg0, f0_local2[f3_arg2 + 1].UpdateWidgetVisibility )
		end,
		defaultValue = f0_local1( f3_arg3, f0_local2[f3_arg2 + 1].SettingName ),
		wrapAround = true
	} )
end

local f0_local4 = function ( f5_arg0, f5_arg1 )
	local SettingsList = nil
	local f5_local1 = Engine.GetDvarBool( "cg_mlg_static_cameras" ) and 18 or 17
	
	SettingsList = LUI.UIGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = f5_local1,
		controllerIndex = f5_arg1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "CodCasterArrowButton", {
				controllerIndex = f5_arg1
			} )
		end,
		refreshChild = function ( f7_arg0, f7_arg1, f7_arg2 )
			f0_local3( f7_arg0, f7_arg1, f7_arg2, f5_arg1 )
		end,
		numRows = f5_local1,
		numColumns = 1,
		wrapX = true,
		wrapY = true,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		columnWidth = _1080p * 750,
		rowHeight = _1080p * 30,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	SettingsList.id = "SettingsList"
	SettingsList:SetAnchors( 0, 1, 0, 1, 0 )
	SettingsList:SetLeft( _1080p * 25, 0 )
	SettingsList:SetRight( _1080p * 775, 0 )
	SettingsList:SetTop( _1080p * 0, 0 )
	SettingsList:SetBottom( _1080p * 715, 0 )
	SettingsList:setUseStencil( false )
	f5_arg0:addElement( SettingsList )
	f5_arg0.SettingsList = SettingsList
	
end

local f0_local5 = function ( f8_arg0, f8_arg1, f8_arg2 )
	f0_local4( f8_arg0, f8_arg1 )
end

function CodCasterDisplaySettingList( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 771 * _1080p, 0, 961 * _1080p )
	self.id = "CodCasterDisplaySettingList"
	local f9_local1 = controller and controller.controllerIndex
	if not f9_local1 and not Engine.InFrontend() then
		f9_local1 = self:getRootController()
	end
	assert( f9_local1 )
	local f9_local2 = self
	local f9_local3 = nil
	if CONDITIONS.AlwaysFalse( self ) then
		f9_local3 = LUI.UIGrid.new( nil, {
			maxVisibleColumns = 1,
			maxVisibleRows = 18,
			controllerIndex = f9_local1,
			buildChild = function ()
				return MenuBuilder.BuildRegisteredType( "CodCasterArrowButton", {
					controllerIndex = f9_local1
				} )
			end,
			refreshChild = function ( f11_arg0, f11_arg1, f11_arg2 )
				
			end,
			numRows = 18,
			numColumns = 1,
			wrapX = true,
			wrapY = true,
			spacingX = _1080p * 10,
			spacingY = _1080p * 10,
			columnWidth = _1080p * 750,
			rowHeight = _1080p * 30,
			scrollingThresholdX = 1,
			scrollingThresholdY = 3,
			horizontalAlignment = LUI.Alignment.Left,
			verticalAlignment = LUI.Alignment.Top,
			springCoefficient = 400,
			maxVelocity = 5000
		} )
		f9_local3.id = "SettingsList"
		f9_local3:setUseStencil( true )
		f9_local3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 25, _1080p * 775, 0, _1080p * 710 )
		self:addElement( f9_local3 )
		self.SettingsList = f9_local3
	end
	f0_local5( self, f9_local1, controller )
	return self
end

MenuBuilder.registerType( "CodCasterDisplaySettingList", CodCasterDisplaySettingList )
LockTable( _M )
