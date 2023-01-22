local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	if f1_arg2.isTeamOne ~= nil then
		f1_arg0.isTeamOne = f1_arg2.isTeamOne
	end
	f1_arg0.CodCasterTeamLogoButton:addEventHandler( "button_action", function ( f2_arg0, f2_arg1 )
		LUI.FlowManager.RequestAddMenu( "CodcasterTeamLogoSettings", true, f1_arg1, false, {
			isTeamOne = f1_arg0.isTeamOne
		} )
	end )
	f1_arg0:addEventHandler( "color_selected", function ( f3_arg0, f3_arg1 )
		local f3_local0 = f3_arg1.intColor
		if f3_arg0.isTeamOne then
			f3_arg0.AlliesColor:SetRGBFromInt( f3_local0, 0 )
			ACTIONS.AnimateSequence( f3_arg0.CodCasterTeamColorSelector.colorWidgets[CODCASTER.GetTeam1Color( f1_arg1 )], "DefaultSequence" )
			MLG.SetShoutcasterProfileVarValue( f1_arg1, "shoutcaster_fe_team1_color", f3_local0 )
			ACTIONS.AnimateSequence( f3_arg0.CodCasterTeamColorSelector.colorWidgets[f3_local0], "Selected" )
		else
			f3_arg0.EnemiesColor:SetRGBFromInt( f3_local0, 0 )
			ACTIONS.AnimateSequence( f3_arg0.CodCasterTeamColorSelector.colorWidgets[CODCASTER.GetTeam2Color( f1_arg1 )], "DefaultSequence" )
			MLG.SetShoutcasterProfileVarValue( f1_arg1, "shoutcaster_fe_team2_color", f3_local0 )
			ACTIONS.AnimateSequence( f3_arg0.CodCasterTeamColorSelector.colorWidgets[f3_local0], "Selected" )
		end
	end )
	f1_arg0:addEventHandler( "update_team_name", function ( f4_arg0, f4_arg1 )
		if f4_arg0.isTeamOne then
			MLG.SetShoutcasterProfileVarValue( f1_arg1, "shoutcaster_fe_team1_name", f4_arg1.teamName )
		else
			MLG.SetShoutcasterProfileVarValue( f1_arg1, "shoutcaster_fe_team2_name", f4_arg1.teamName )
		end
	end )
	local f1_local0 = MLG.ShoutcasterProfileVarValue( f1_arg1, "shoutcaster_fe_team1_color" )
	local f1_local1 = MLG.ShoutcasterProfileVarValue( f1_arg1, "shoutcaster_fe_team2_color" )
	if f1_arg0.CodCasterTeamColorSelector.colorWidgets[f1_local0] == nil then
		if f1_local1 == f1_arg0.CodCasterTeamColorSelector.defaultColorTeam1 then
			f1_local0 = f1_arg0.CodCasterTeamColorSelector.defaultColorTeam2
		else
			f1_local0 = f1_arg0.CodCasterTeamColorSelector.defaultColorTeam1
		end
		MLG.SetShoutcasterProfileVarValue( f1_arg1, "shoutcaster_fe_team1_color", f1_local0 )
	end
	f1_arg0.AlliesColor:SetRGBFromInt( f1_local0, 0 )
	if f1_arg0.CodCasterTeamColorSelector.colorWidgets[f1_local1] == nil then
		if f1_local0 == f1_arg0.CodCasterTeamColorSelector.defaultColorTeam1 then
			f1_local1 = f1_arg0.CodCasterTeamColorSelector.defaultColorTeam2
		else
			f1_local1 = f1_arg0.CodCasterTeamColorSelector.defaultColorTeam1
		end
		MLG.SetShoutcasterProfileVarValue( f1_arg1, "shoutcaster_fe_team2_color", f1_local1 )
	end
	f1_arg0.EnemiesColor:SetRGBFromInt( f1_local1, 0 )
	local f1_local2, f1_local3, f1_local4, f1_local5, f1_local6 = nil
	if f1_arg0.isTeamOne then
		f1_local2 = ToUpperCase( Engine.Localize( "CODCASTER_TEAM1_SETTINGS" ) )
		f1_local3 = f1_local0
		f1_local4 = f1_local1
		f1_local5 = CODCASTER.GetTeam1Name( f1_arg1 )
		f1_local6 = CODCASTER.GetTeam1LogoMaterial( f1_arg1 )
	else
		f1_local2 = ToUpperCase( Engine.Localize( "CODCASTER_TEAM2_SETTINGS" ) )
		f1_local3 = f1_local1
		f1_local4 = f1_local0
		f1_local5 = CODCASTER.GetTeam2Name( f1_arg1 )
		f1_local6 = CODCASTER.GetTeam2LogoMaterial( f1_arg1 )
	end
	f1_arg0.MenuTitle.MenuTitle:setText( f1_local2, 0 )
	if f1_arg0.CodCasterTeamColorSelector.colorWidgets[f1_local3] ~= nil then
		ACTIONS.AnimateSequence( f1_arg0.CodCasterTeamColorSelector.colorWidgets[f1_local3], "Selected" )
	end
	if f1_arg0.CodCasterTeamColorSelector.colorWidgets[f1_local4] ~= nil then
		ACTIONS.AnimateSequence( f1_arg0.CodCasterTeamColorSelector.colorWidgets[f1_local4], "Locked" )
		f1_arg0.CodCasterTeamColorSelector.colorWidgets[f1_local4]:SetButtonDisabled( true )
	end
	if f1_local5 ~= "" then
		f1_arg0.CodCasterTeamNameSelector.TeamName:setText( f1_local5 )
	end
	f1_arg0.CodCasterTeamLogoButton.TeamLogo:setImage( RegisterMaterial( f1_local6 ), 0 )
	f1_arg0:addElement( CoD.GetWorldBlur() )
	f1_arg0.MenuTitle.MenuBreadcrumbs:setText( CoD.GetBreadcrumb(), 0 )
	if Engine.IsCoreMode() then
		f1_arg0:addElement( CoD.GetWorldBlur() )
	end
end

function CodcasterTeamSettings( menu, controller )
	local self = LUI.UIVerticalNavigator.new()
	self.id = "CodcasterTeamSettings"
	local f5_local1 = controller and controller.controllerIndex
	if not f5_local1 and not Engine.InFrontend() then
		f5_local1 = self:getRootController()
	end
	assert( f5_local1 )
	self:playSound( "menu_open" )
	local f5_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 0, 0 )
	Background:SetAlpha( 0.5, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local TeamLogoLabel = nil
	
	TeamLogoLabel = LUI.UIText.new()
	TeamLogoLabel.id = "TeamLogoLabel"
	TeamLogoLabel:setText( ToUpperCase( Engine.Localize( "CODCASTER_TEAM_LOGO_COLON" ) ), 0 )
	TeamLogoLabel:SetFontSize( 48 * _1080p )
	TeamLogoLabel:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	TeamLogoLabel:setTextStyle( CoD.TextStyle.Shadowed )
	TeamLogoLabel:SetAlignment( LUI.Alignment.Left )
	TeamLogoLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 630, _1080p * 154, _1080p * 202 )
	self:addElement( TeamLogoLabel )
	self.TeamLogoLabel = TeamLogoLabel
	
	local TeamNameLabel = nil
	
	TeamNameLabel = LUI.UIText.new()
	TeamNameLabel.id = "TeamNameLabel"
	TeamNameLabel:setText( ToUpperCase( Engine.Localize( "CODCASTER_TEAM_NAME_COLON" ) ), 0 )
	TeamNameLabel:SetFontSize( 48 * _1080p )
	TeamNameLabel:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	TeamNameLabel:setTextStyle( CoD.TextStyle.Shadowed )
	TeamNameLabel:SetAlignment( LUI.Alignment.Left )
	TeamNameLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 630, _1080p * 553.15, _1080p * 601.15 )
	self:addElement( TeamNameLabel )
	self.TeamNameLabel = TeamNameLabel
	
	local TeamColorLabel = nil
	
	TeamColorLabel = LUI.UIText.new()
	TeamColorLabel.id = "TeamColorLabel"
	TeamColorLabel:setText( ToUpperCase( Engine.Localize( "CODCASTER_TEAM_COLOR_COLON" ) ), 0 )
	TeamColorLabel:SetFontSize( 48 * _1080p )
	TeamColorLabel:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	TeamColorLabel:setTextStyle( CoD.TextStyle.Shadowed )
	TeamColorLabel:SetAlignment( LUI.Alignment.Left )
	TeamColorLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 630, _1080p * 698.65, _1080p * 746.65 )
	self:addElement( TeamColorLabel )
	self.TeamColorLabel = TeamColorLabel
	
	local TeamColorPreviewLabel = nil
	
	TeamColorPreviewLabel = LUI.UIText.new()
	TeamColorPreviewLabel.id = "TeamColorPreviewLabel"
	TeamColorPreviewLabel:SetAlpha( 0, 0 )
	TeamColorPreviewLabel:setText( ToUpperCase( Engine.Localize( "CODCASTER_TEAM_COLOR_PREVIEW" ) ), 0 )
	TeamColorPreviewLabel:SetFontSize( 48 * _1080p )
	TeamColorPreviewLabel:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	TeamColorPreviewLabel:SetAlignment( LUI.Alignment.Left )
	TeamColorPreviewLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 908.1, _1080p * 1408.1, _1080p * 154, _1080p * 202 )
	self:addElement( TeamColorPreviewLabel )
	self.TeamColorPreviewLabel = TeamColorPreviewLabel
	
	local TeamColorPreview = nil
	
	TeamColorPreview = LUI.UIImage.new()
	TeamColorPreview.id = "TeamColorPreview"
	TeamColorPreview:setImage( RegisterMaterial( "compass_map_mp_frontier" ), 0 )
	TeamColorPreview:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 834.95, _1080p * 1747.26, _1080p * 82.69, _1080p * 995 )
	self:addElement( TeamColorPreview )
	self.TeamColorPreview = TeamColorPreview
	
	local MenuTitle = nil
	
	MenuTitle = MenuBuilder.BuildRegisteredType( "MenuTitle", {
		controllerIndex = f5_local1
	} )
	MenuTitle.id = "MenuTitle"
	MenuTitle.MenuTitle:setText( ToUpperCase( Engine.Localize( "CODCASTER_TEAM1_SETTINGS" ) ), 0 )
	MenuTitle.MenuBreadcrumbs:setText( ToUpperCase( "" ), 0 )
	MenuTitle.Icon:SetTop( _1080p * -28.5, 0 )
	MenuTitle.Icon:SetBottom( _1080p * 61.5, 0 )
	MenuTitle:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 96, 0, _1080p * 54, _1080p * 132 )
	self:addElement( MenuTitle )
	self.MenuTitle = MenuTitle
	
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f5_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local CodCasterTeamNameSelector = nil
	
	CodCasterTeamNameSelector = MenuBuilder.BuildRegisteredType( "CodCasterTeamNameSelector", {
		controllerIndex = f5_local1
	} )
	CodCasterTeamNameSelector.id = "CodCasterTeamNameSelector"
	CodCasterTeamNameSelector:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 630, _1080p * 601.15, _1080p * 651.15 )
	self:addElement( CodCasterTeamNameSelector )
	self.CodCasterTeamNameSelector = CodCasterTeamNameSelector
	
	local CodCasterTeamColorSelector = nil
	
	CodCasterTeamColorSelector = MenuBuilder.BuildRegisteredType( "CodCasterTeamColorSelector", {
		controllerIndex = f5_local1
	} )
	CodCasterTeamColorSelector.id = "CodCasterTeamColorSelector"
	CodCasterTeamColorSelector:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 784, _1080p * 742.65, _1080p * 911.5 )
	self:addElement( CodCasterTeamColorSelector )
	self.CodCasterTeamColorSelector = CodCasterTeamColorSelector
	
	local CodCasterTeamLogoButton = nil
	
	CodCasterTeamLogoButton = MenuBuilder.BuildRegisteredType( "CodCasterTeamLogoButton", {
		controllerIndex = f5_local1
	} )
	CodCasterTeamLogoButton.id = "CodCasterTeamLogoButton"
	CodCasterTeamLogoButton:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 480, _1080p * 202, _1080p * 552 )
	self:addElement( CodCasterTeamLogoButton )
	self.CodCasterTeamLogoButton = CodCasterTeamLogoButton
	
	local AlliesColor = nil
	
	AlliesColor = LUI.UIImage.new()
	AlliesColor.id = "AlliesColor"
	AlliesColor:setImage( RegisterMaterial( "t7_codcaster_map_mp_alliescolor" ), 0 )
	AlliesColor:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1015.09, _1080p * 1180.91, _1080p * 453.35, _1080p * 718.65 )
	self:addElement( AlliesColor )
	self.AlliesColor = AlliesColor
	
	local EnemiesColor = nil
	
	EnemiesColor = LUI.UIImage.new()
	EnemiesColor.id = "EnemiesColor"
	EnemiesColor:setImage( RegisterMaterial( "t7_codcaster_map_mp_enemiescolor" ), 0 )
	EnemiesColor:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1138.69, _1080p * 1583.73, _1080p * 363.5, _1080p * 643.5 )
	self:addElement( EnemiesColor )
	self.EnemiesColor = EnemiesColor
	
	local PlayerColor = nil
	
	PlayerColor = LUI.UIImage.new()
	PlayerColor.id = "PlayerColor"
	PlayerColor:SetZRotation( 250, 0 )
	PlayerColor:setImage( RegisterMaterial( "icon_minimap_player" ), 0 )
	PlayerColor:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 978.1, _1080p * 1031.95, _1080p * 511.92, _1080p * 565.77 )
	self:addElement( PlayerColor )
	self.PlayerColor = PlayerColor
	
	self.addButtonHelperFunction = function ( f6_arg0, f6_arg1 )
		f6_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			clickable = true
		} )
		f6_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_SELECT" ),
			button_ref = "button_primary",
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
		local f7_local0 = f7_arg1.controller or f5_local1
		ACTIONS.LeaveMenu( self )
	end )
	f0_local0( self, f5_local1, controller )
	return self
end

MenuBuilder.registerType( "CodcasterTeamSettings", CodcasterTeamSettings )
LockTable( _M )
