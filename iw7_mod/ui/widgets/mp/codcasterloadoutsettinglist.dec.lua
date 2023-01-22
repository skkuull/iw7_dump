local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4 )
	MLG.SetShoutcasterProfileVarValue( f1_arg1, f1_arg2, f1_arg3 - 1 )
	f1_arg0:dispatchEventToRoot( {
		name = "codcaster_setting_change",
		immediate = true,
		setting_category = "loadout",
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
		Name = "CODCASTER_LS_PLAYER_SPECIALIST",
		Desc = "CODCASTER_LS_PLAYER_SPECIALIST_DESC",
		Labels = {
			"MENU_OFF",
			"MENU_ON"
		},
		SettingName = "shoutcaster_lo_specialist"
	},
	{
		Name = "CODCASTER_LS_SPECIALIST_WEAPON_ABILITY",
		Desc = "CODCASTER_LS_SPECIALIST_WEAPON_ABILITY_DESC",
		Labels = {
			"MENU_OFF",
			"MENU_ON"
		},
		SettingName = "shoutcaster_lo_specialist_weapon"
	},
	{
		Name = "CODCASTER_LS_PRIMARY_WEAPON",
		Desc = "CODCASTER_LS_PRIMARY_WEAPON_DESC",
		Labels = {
			"MENU_OFF",
			"MENU_ON"
		},
		SettingName = "shoutcaster_lo_primary"
	},
	{
		Name = "CODCASTER_LS_PRIMARY_WEAPON_ATTACHMENTS",
		Desc = "CODCASTER_LS_PRIMARY_WEAPON_ATTACHMENTS_DESC",
		Labels = {
			"MENU_OFF",
			"MENU_ON"
		},
		SettingName = "shoutcaster_lo_primary_attachment"
	},
	{
		Name = "CODCASTER_LS_SECONDARY_WEAPON",
		Desc = "CODCASTER_LS_SECONDARY_WEAPON_DESC",
		Labels = {
			"MENU_OFF",
			"MENU_ON"
		},
		SettingName = "shoutcaster_lo_secondary"
	},
	{
		Name = "CODCASTER_LS_SECONDARY_WEAPON_ATTACHMENTS",
		Desc = "CODCASTER_LS_SECONDARY_WEAPON_ATTACHMENTS_DESC",
		Labels = {
			"MENU_OFF",
			"MENU_ON"
		},
		SettingName = "shoutcaster_lo_secondary_attachment"
	},
	{
		Name = "CODCASTER_LS_EQUIPMENT",
		Desc = "CODCASTER_LS_EQUIPMENT_DESC",
		Labels = {
			"MENU_OFF",
			"MENU_ON"
		},
		SettingName = "shoutcaster_lo_equipment"
	},
	{
		Name = "CODCASTER_LS_PERKS",
		Desc = "CODCASTER_LS_PERKS_DESC",
		Labels = {
			"MENU_OFF",
			"MENU_ON"
		},
		SettingName = "shoutcaster_lo_perks"
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
			f0_local0( f3_arg0, f4_arg1, f0_local2[f3_arg2 + 1].SettingName, f4_arg0, true )
		end,
		defaultValue = f0_local1( f3_arg3, f0_local2[f3_arg2 + 1].SettingName ),
		wrapAround = true
	} )
end

local f0_local4 = function ( f5_arg0, f5_arg1 )
	local SettingsList = nil
	
	SettingsList = LUI.UIGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 8,
		controllerIndex = f5_arg1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "CodCasterArrowButton", {
				controllerIndex = f5_arg1
			} )
		end,
		refreshChild = function ( f7_arg0, f7_arg1, f7_arg2 )
			f0_local3( f7_arg0, f7_arg1, f7_arg2, f5_arg1 )
		end,
		numRows = 8,
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
	SettingsList:SetBottom( _1080p * 410, 0 )
	SettingsList:setUseStencil( false )
	f5_arg0:addElement( SettingsList )
	f5_arg0.SettingsList = SettingsList
	
end

local f0_local5 = function ( f8_arg0, f8_arg1, f8_arg2 )
	f8_arg0:removeElement( f8_arg0.SettingsList )
	f0_local4( f8_arg0, f8_arg1 )
end

function CodCasterLoadoutSettingList( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 771 * _1080p, 0, 961 * _1080p )
	self.id = "CodCasterLoadoutSettingList"
	local f9_local1 = controller and controller.controllerIndex
	if not f9_local1 and not Engine.InFrontend() then
		f9_local1 = self:getRootController()
	end
	assert( f9_local1 )
	local f9_local2 = self
	local SettingsList = nil
	
	SettingsList = LUI.UIGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 7,
		controllerIndex = f9_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "CodCasterArrowButton", {
				controllerIndex = f9_local1
			} )
		end,
		refreshChild = function ( f11_arg0, f11_arg1, f11_arg2 )
			
		end,
		numRows = 7,
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
	SettingsList:setUseStencil( false )
	SettingsList:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 22, _1080p * 772, 0, _1080p * 270 )
	self:addElement( SettingsList )
	self.SettingsList = SettingsList
	
	f0_local5( self, f9_local1, controller )
	return self
end

MenuBuilder.registerType( "CodCasterLoadoutSettingList", CodCasterLoadoutSettingList )
LockTable( _M )
