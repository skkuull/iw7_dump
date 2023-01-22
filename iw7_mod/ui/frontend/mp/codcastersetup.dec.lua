local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	return function ( f2_arg0, f2_arg1 )
		local f2_local0 = f2_arg0 == 1
		f1_arg0:SetButtonDisabled( f2_local0 )
		f1_arg1:SetButtonDisabled( f2_local0 )
		f1_arg2:SetButtonDisabled( f2_local0 )
	end
	
end

f0_local1 = function ( f3_arg0, f3_arg1 )
	local f3_local0 = f3_arg0.CodCasterTeamIdentityInformationPanel.CodCasterTeam1Information
	local f3_local1 = f3_arg0.CodCasterTeamIdentityInformationPanel.CodCasterTeam2Information
	f3_local0.TeamNameText:setText( CODCASTER.GetTeam1Name( f3_arg1 ), 0 )
	f3_local1.TeamNameText:setText( CODCASTER.GetTeam2Name( f3_arg1 ), 0 )
	f3_local0.TeamColorImage:SetRGBFromInt( CODCASTER.GetTeam1Color( f3_arg1 ), 0 )
	f3_local1.TeamColorImage:SetRGBFromInt( CODCASTER.GetTeam2Color( f3_arg1 ), 0 )
	f3_local0.TeamLogoImage:setImage( RegisterMaterial( CODCASTER.GetTeam1LogoMaterial( f3_arg1 ) ), 0 )
	f3_local1.TeamLogoImage:setImage( RegisterMaterial( CODCASTER.GetTeam2LogoMaterial( f3_arg1 ) ), 0 )
end

f0_local2 = function ( f4_arg0, f4_arg1 )
	if f4_arg0 ~= nil then
		local f4_local0 = MLG.ShoutcasterProfileVarValue( f4_arg1, "shoutcaster_fe_team1_" .. f4_arg0 )
		MLG.SetShoutcasterProfileVarValue( f4_arg1, "shoutcaster_fe_team1_" .. f4_arg0, MLG.ShoutcasterProfileVarValue( f4_arg1, "shoutcaster_fe_team2_" .. f4_arg0 ) )
		MLG.SetShoutcasterProfileVarValue( f4_arg1, "shoutcaster_fe_team2_" .. f4_arg0, f4_local0 )
	end
end

local f0_local3 = function ( f5_arg0 )
	f0_local2( "name", f5_arg0 )
	f0_local2( "color", f5_arg0 )
	f0_local2( "icon", f5_arg0 )
end

local f0_local4 = function ( f6_arg0, f6_arg1, f6_arg2 )
	f6_arg0.isInCustomTeamIdentityMode = MLG.ShoutcasterProfileVarValue( f6_arg1, "shoutcaster_fe_team_identity" )
	local f6_local0 = f6_arg0
	local f6_local1 = {}
	local f6_local2 = {}
	local f6_local3 = Engine.Localize( "CODCASTER_TEAM_IDENTITY_FACTIONS" )
	local f6_local4 = Engine.Localize( "CODCASTER_TEAM_IDENTITY_CUSTOM" )
	f6_local1.labels = f6_local3
	f6_local1.action = f0_local0( f6_arg0.CodcasterSetupButtons.Team1SettingsButton, f6_arg0.CodcasterSetupButtons.Team2SettingsButton, f6_arg0.CodcasterSetupButtons.TeamSwapButton )
	f6_local1.defaultValue = 1 + f6_arg0.isInCustomTeamIdentityMode
	f6_local1.wrapAround = true
	f6_local1.UpdateContent = function ( f7_arg0 )
		f7_arg0.Text:setText( f7_arg0.labels[f7_arg0.currentValue], f7_arg0.updateDuration )
		MLG.SetShoutcasterProfileVarValue( f6_arg1, "shoutcaster_fe_team_identity", f7_arg0.currentValue - 1 )
		f6_local0.OptionTitle:setText( ToUpperCase( f7_arg0.Text:getText() ) )
		f0_local1( f6_local0, f6_arg1 )
	end
	
	f6_local2 = function ()
		ACTIONS.AnimateSequence( f6_local0.CodCasterTeamIdentityInformationPanel, "DefaultSequence" )
	end
	
	f6_local3 = function ( f9_arg0, f9_arg1 )
		f6_local2( codcasterMenu )
		f6_local0.OptionTitle:setText( ToUpperCase( f9_arg0.Text:getText() ) )
		local f9_local0 = f6_local0.CodcasterSetupButtons
		local f9_local1 = f9_arg0.id
		if f9_local1 == f9_local0.QuickSettingsButton.id then
			f6_local0.OptionDescription:setText( Engine.Localize( "CODCASTER_QUICK_SETTINGS_DESC" ) )
		elseif f9_local1 == f9_local0.DisplaySettingsButton.id then
			f6_local0.OptionDescription:setText( Engine.Localize( "CODCASTER_DISPLAY_SETTINGS_DESC" ) )
		elseif f9_local1 == f9_local0.LoadoutSettingsButton.id then
			f6_local0.OptionDescription:setText( Engine.Localize( "CODCASTER_LOADOUT_SETTINGS_DESC" ) )
		elseif f9_local1 == f9_local0.KeyboardButton.id then
			f6_local0.OptionDescription:setText( Engine.Localize( "CODCASTER_KEYBOARD_SHORTCUTS_DESC" ) )
		elseif f9_local1 == f9_local0.TeamIdentityArrowButton.id then
			f6_local0.OptionDescription:setText( Engine.Localize( "CODCASTER_TEAM_IDENTITY_DESC" ) )
			ACTIONS.AnimateSequence( f6_local0.CodCasterTeamIdentityInformationPanel, "ShowBoth" )
		elseif f9_local1 == f9_local0.Team1SettingsButton.id then
			f6_local0.OptionDescription:setText( Engine.Localize( "CODCASTER_TEAM1_SETTINGS_DESC" ) )
			ACTIONS.AnimateSequence( f6_local0.CodCasterTeamIdentityInformationPanel, "ShowTeam1Only" )
		elseif f9_local1 == f9_local0.Team2SettingsButton.id then
			f6_local0.OptionDescription:setText( Engine.Localize( "CODCASTER_TEAM2_SETTINGS_DESC" ) )
			ACTIONS.AnimateSequence( f6_local0.CodCasterTeamIdentityInformationPanel, "ShowTeam2Only" )
		elseif f9_local1 == f9_local0.TeamSwapButton.id then
			f6_local0.OptionDescription:setText( Engine.Localize( "CODCASTER_SWAP_TEAMS_DESC" ) )
			ACTIONS.AnimateSequence( f6_local0.CodCasterTeamIdentityInformationPanel, "ShowBoth" )
		end
	end
	
	LUI.AddUIArrowTextButtonLogic( f6_arg0.CodcasterSetupButtons.TeamIdentityArrowButton, f6_arg1, f6_local1 )
	if f6_arg0.isInCustomTeamIdentityMode == 0 then
		f6_arg0.CodcasterSetupButtons.Team1SettingsButton:SetButtonDisabled( true )
		f6_arg0.CodcasterSetupButtons.Team2SettingsButton:SetButtonDisabled( true )
		f6_arg0.CodcasterSetupButtons.TeamSwapButton:SetButtonDisabled( true )
	end
	f6_arg0.CodcasterSetupButtons.QuickSettingsButton:addEventHandler( "button_over", f6_local3 )
	f6_arg0.CodcasterSetupButtons.DisplaySettingsButton:addEventHandler( "button_over", f6_local3 )
	f6_arg0.CodcasterSetupButtons.LoadoutSettingsButton:addEventHandler( "button_over", f6_local3 )
	f6_arg0.CodcasterSetupButtons.KeyboardButton:addEventHandler( "button_over", f6_local3 )
	f6_arg0.CodcasterSetupButtons.TeamIdentityArrowButton:addEventHandler( "button_over", f6_local3 )
	f6_arg0.CodcasterSetupButtons.TeamSwapButton:addEventHandler( "button_over", f6_local3 )
	f6_arg0.CodcasterSetupButtons.TeamSwapButton:addEventHandler( "button_over_disable", f6_local3 )
	f6_arg0.CodcasterSetupButtons.Team1SettingsButton:addEventHandler( "button_over", f6_local3 )
	f6_arg0.CodcasterSetupButtons.Team1SettingsButton:addEventHandler( "button_over_disable", f6_local3 )
	f6_arg0.CodcasterSetupButtons.Team2SettingsButton:addEventHandler( "button_over", f6_local3 )
	f6_arg0.CodcasterSetupButtons.Team2SettingsButton:addEventHandler( "button_over_disable", f6_local3 )
	f6_arg0.CodcasterSetupButtons.Team1SettingsButton:addEventHandler( "button_action", function ( f10_arg0, f10_arg1 )
		LUI.FlowManager.RequestAddMenu( "CodcasterTeamSettings", true, f10_arg1.controller or f6_arg1, false, {
			isTeamOne = true
		} )
	end )
	f6_arg0.CodcasterSetupButtons.Team2SettingsButton:addEventHandler( "button_action", function ( f11_arg0, f11_arg1 )
		LUI.FlowManager.RequestAddMenu( "CodcasterTeamSettings", true, f11_arg1.controller or f6_arg1, false, {
			isTeamOne = false
		} )
	end )
	f6_arg0.CodcasterSetupButtons.TeamSwapButton:addEventHandler( "button_action", function ( f12_arg0, f12_arg1 )
		local f12_local0 = f12_arg1.controller or f6_arg1
		f0_local3( f12_local0 )
		f0_local1( f6_arg0, f12_local0 )
	end )
	f6_arg0:addElement( CoD.GetWorldBlur() )
	f6_arg0.MenuTitle.MenuBreadcrumbs:setText( CoD.GetBreadcrumb(), 0 )
end

function CodcasterSetup( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "CodcasterSetup"
	local f13_local1 = controller and controller.controllerIndex
	if not f13_local1 and not Engine.InFrontend() then
		f13_local1 = self:getRootController()
	end
	assert( f13_local1 )
	self:playSound( "menu_open" )
	local f13_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 0, 0 )
	Background:SetAlpha( 0.5, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local GenericItemInfoBG0 = nil
	
	GenericItemInfoBG0 = MenuBuilder.BuildRegisteredType( "GenericItemInfoBG", {
		controllerIndex = f13_local1
	} )
	GenericItemInfoBG0.id = "GenericItemInfoBG0"
	GenericItemInfoBG0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 893, _1080p * 2024.43, _1080p * 750.32, _1080p * 876.32 )
	self:addElement( GenericItemInfoBG0 )
	self.GenericItemInfoBG0 = GenericItemInfoBG0
	
	local MenuTitle = nil
	
	MenuTitle = MenuBuilder.BuildRegisteredType( "MenuTitle", {
		controllerIndex = f13_local1
	} )
	MenuTitle.id = "MenuTitle"
	MenuTitle.MenuTitle:setText( ToUpperCase( Engine.Localize( "CODCASTER_EDIT_SETTINGS" ) ), 0 )
	MenuTitle.MenuBreadcrumbs:setText( ToUpperCase( "" ), 0 )
	MenuTitle.Icon:SetTop( _1080p * -28.5, 0 )
	MenuTitle.Icon:SetBottom( _1080p * 61.5, 0 )
	MenuTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 132 )
	self:addElement( MenuTitle )
	self.MenuTitle = MenuTitle
	
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f13_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local CodcasterSetupButtons = nil
	
	CodcasterSetupButtons = MenuBuilder.BuildRegisteredType( "CodcasterSetupButtons", {
		controllerIndex = f13_local1
	} )
	CodcasterSetupButtons.id = "CodcasterSetupButtons"
	CodcasterSetupButtons:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 737, _1080p * 216, _1080p * 494 )
	self:addElement( CodcasterSetupButtons )
	self.CodcasterSetupButtons = CodcasterSetupButtons
	
	local OptionsLabel = nil
	
	OptionsLabel = LUI.UIText.new()
	OptionsLabel.id = "OptionsLabel"
	OptionsLabel:SetAlpha( 0, 0 )
	OptionsLabel:setText( ToUpperCase( Engine.Localize( "CODCASTER_SETTINGS" ) ), 0 )
	OptionsLabel:SetFontSize( 45 * _1080p )
	OptionsLabel:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	OptionsLabel:SetAlignment( LUI.Alignment.Left )
	OptionsLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 98, _1080p * 598, _1080p * 163.5, _1080p * 208.5 )
	self:addElement( OptionsLabel )
	self.OptionsLabel = OptionsLabel
	
	local CodCasterTeamIdentityInformationPanel = nil
	
	CodCasterTeamIdentityInformationPanel = MenuBuilder.BuildRegisteredType( "CodCasterTeamIdentityInformationPanel", {
		controllerIndex = f13_local1
	} )
	CodCasterTeamIdentityInformationPanel.id = "CodCasterTeamIdentityInformationPanel"
	CodCasterTeamIdentityInformationPanel:SetScale( 0.5, 0 )
	CodCasterTeamIdentityInformationPanel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1012.42, _1080p * 1490.08, _1080p * 279.24, _1080p * 656.2 )
	self:addElement( CodCasterTeamIdentityInformationPanel )
	self.CodCasterTeamIdentityInformationPanel = CodCasterTeamIdentityInformationPanel
	
	local ButtonDescription = nil
	
	ButtonDescription = MenuBuilder.BuildRegisteredType( "ButtonDescriptionText", {
		controllerIndex = f13_local1
	} )
	ButtonDescription.id = "ButtonDescription"
	ButtonDescription:SetAlpha( 0, 0 )
	ButtonDescription.Description:SetRight( _1080p * 415, 0 )
	ButtonDescription:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 550, _1080p * 675.98, _1080p * 707.98 )
	self:addElement( ButtonDescription )
	self.ButtonDescription = ButtonDescription
	
	local OptionTitle = nil
	
	OptionTitle = LUI.UIText.new()
	OptionTitle.id = "OptionTitle"
	OptionTitle:setText( ToUpperCase( Engine.Localize( "CODCASTER_QUICK_SETTINGS" ) ), 0 )
	OptionTitle:SetFontSize( 60 * _1080p )
	OptionTitle:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	OptionTitle:SetAlignment( LUI.Alignment.Left )
	OptionTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 912, _1080p * 1746.4, _1080p * 752.32, _1080p * 813.32 )
	self:addElement( OptionTitle )
	self.OptionTitle = OptionTitle
	
	local OptionDescription = nil
	
	OptionDescription = LUI.UIText.new()
	OptionDescription.id = "OptionDescription"
	OptionDescription:SetRGBFromInt( 0, 0 )
	OptionDescription:setText( Engine.Localize( "CODCASTER_QUICK_SETTINGS_DESC" ), 0 )
	OptionDescription:SetFontSize( 22 * _1080p )
	OptionDescription:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	OptionDescription:SetAlignment( LUI.Alignment.Left )
	OptionDescription:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 902, _1080p * 1647.4, _1080p * 818.32, _1080p * 840.32 )
	self:addElement( OptionDescription )
	self.OptionDescription = OptionDescription
	
	self.addButtonHelperFunction = function ( f14_arg0, f14_arg1 )
		f14_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			priority = 10,
			clickable = true
		} )
		f14_arg0:AddButtonHelperText( {
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
	
	self.bindButton:addEventHandler( "button_secondary", function ( f15_arg0, f15_arg1 )
		local f15_local0 = f15_arg1.controller or f13_local1
		ACTIONS.LeaveMenu( self )
	end )
	f0_local4( self, f13_local1, controller )
	return self
end

MenuBuilder.registerType( "CodcasterSetup", CodcasterSetup )
LockTable( _M )
