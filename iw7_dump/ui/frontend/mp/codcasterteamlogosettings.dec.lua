local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "frontEnd.mp.TeamLogo"
f0_local1 = function ( f1_arg0, f1_arg1, f1_arg2 )
	if f1_arg2.isTeamOne ~= nil then
		f1_arg0.isTeamOne = f1_arg2.isTeamOne
	end
	f1_arg0:addEventHandler( "logo_selected", function ( f2_arg0, f2_arg1 )
		local f2_local0 = f2_arg1.index
		local f2_local1 = f2_arg0.TeamLogos:GetMaxVisibleColumns()
		local f2_local2 = f2_local0 % f2_local1
		local f2_local3 = math.floor( f2_local0 / f2_local1 )
		local f2_local4 = f2_arg1.logoMaterial
		local f2_local5 = ToUpperCase( Engine.Localize( f2_arg1.logoName ) )
		f2_arg0.lockedLogo = f2_arg0.TeamLogos:GetElementAtPosition( f2_arg0.lockedLogoIndex % f2_local1, math.floor( f2_arg0.lockedLogoIndex / f2_local1 ) )
		f2_arg0.selectedLogoIndex = f2_arg1.index
		f2_arg0.TeamLogoPreview:setImage( RegisterMaterial( f2_local4 ), 0 )
		f2_arg0.TeamLogoNamePreview:setText( f2_local5, 0 )
		if f2_arg0.selectedLogo ~= nil then
			ACTIONS.AnimateSequence( f2_arg0.selectedLogo, "DefaultSequence" )
		end
		if lockedLogo ~= nil then
			ACTIONS.AnimateSequence( lockedLogo, "Locked" )
		end
		f2_arg0.selectedLogo = f2_arg0.TeamLogos:GetElementAtPosition( f2_local2, f2_local3 )
		if f2_arg0.selectedLogo ~= nil then
			local f2_local6 = CODCASTER.GetProTeamAlias( f1_arg1, f2_local0 )
			if f2_arg0.isTeamOne then
				MLG.SetShoutcasterProfileVarValue( f1_arg1, "shoutcaster_fe_team1_icon", f2_local0 )
				MLG.SetShoutcasterProfileVarValue( f1_arg1, "shoutcaster_fe_team1_name", f2_local6 )
			else
				MLG.SetShoutcasterProfileVarValue( f1_arg1, "shoutcaster_fe_team2_icon", f2_local0 )
				MLG.SetShoutcasterProfileVarValue( f1_arg1, "shoutcaster_fe_team2_name", f2_local6 )
			end
			ACTIONS.AnimateSequence( f2_arg0.selectedLogo, "Selected" )
		end
	end )
	local f1_local0 = {}
	local f1_local1 = LUI.DataSourceFromList.new( Engine.TableGetRowCount( CSV.teamLogoTable.file ) )
	f1_local1:SetCachingEnabled( true )
	f1_local1.MakeDataSourceAtIndex = function ( f3_arg0, f3_arg1, f3_arg2 )
		local f3_local0 = ToUpperCase( Engine.Localize( Engine.TableLookupByRow( CSV.teamLogoTable.file, f3_arg1, CSV.teamLogoTable.cols.teamName ) ) )
		local f3_local1 = Engine.TableLookupByRow( CSV.teamLogoTable.file, f3_arg1, CSV.teamLogoTable.cols.logoMaterial )
		local f3_local2 = f0_local0 .. ".item." .. f3_arg1
		return {
			index = LUI.DataSourceInGlobalModel.new( f3_local2 .. ".index", f3_arg1 ),
			teamName = LUI.DataSourceInGlobalModel.new( f3_local2 .. ".teamName", f3_local0 ),
			logoMaterial = LUI.DataSourceInGlobalModel.new( f3_local2 .. ".logoMaterial", f3_local1 )
		}
	end
	
	f1_arg0.TeamLogos:SetGridDataSource( f1_local1, f1_arg1 )
	local f1_local2 = MLG.ShoutcasterProfileVarValue( f1_arg1, "shoutcaster_fe_team1_icon" )
	local f1_local3 = MLG.ShoutcasterProfileVarValue( f1_arg1, "shoutcaster_fe_team2_icon" )
	local f1_local4 = nil
	if f1_arg0.isTeamOne then
		f1_local4 = ToUpperCase( Engine.Localize( "CODCASTER_TEAM1_LOGO" ) )
		f1_arg0.selectedLogoIndex = f1_local2
		f1_arg0.lockedLogoIndex = f1_local3
	else
		f1_local4 = ToUpperCase( Engine.Localize( "CODCASTER_TEAM2_LOGO" ) )
		f1_arg0.selectedLogoIndex = f1_local3
		f1_arg0.lockedLogoIndex = f1_local2
	end
	f1_arg0.TeamLogos:SetFocusedPosition( f1_arg0.TeamLogos:GetPositionForIndex( f1_arg0.selectedLogoIndex ), false, true )
	f1_arg0.MenuTitle.MenuTitle:setText( f1_local4, 0 )
	f1_arg0:addElement( CoD.GetWorldBlur() )
end

function CodcasterTeamLogoSettings( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "CodcasterTeamLogoSettings"
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	self:playSound( "menu_open" )
	local f4_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 0, 0 )
	Background:SetAlpha( 0.5, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local TeamLogoNamePreview = nil
	
	TeamLogoNamePreview = LUI.UIStyledText.new()
	TeamLogoNamePreview.id = "TeamLogoNamePreview"
	TeamLogoNamePreview:setText( Engine.Localize( "MENU_NEW" ), 0 )
	TeamLogoNamePreview:SetFontSize( 55 * _1080p )
	TeamLogoNamePreview:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	TeamLogoNamePreview:SetAlignment( LUI.Alignment.Center )
	TeamLogoNamePreview:SetStartupDelay( 1000 )
	TeamLogoNamePreview:SetLineHoldTime( 500 )
	TeamLogoNamePreview:SetAnimMoveTime( 500 )
	TeamLogoNamePreview:SetEndDelay( 1000 )
	TeamLogoNamePreview:SetCrossfadeTime( 500 )
	TeamLogoNamePreview:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	TeamLogoNamePreview:SetMaxVisibleLines( 1 )
	TeamLogoNamePreview:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1260, _1080p * 1843, _1080p * 665, _1080p * 720 )
	self:addElement( TeamLogoNamePreview )
	self.TeamLogoNamePreview = TeamLogoNamePreview
	
	local TeamLogoPreview = nil
	
	TeamLogoPreview = LUI.UIImage.new()
	TeamLogoPreview.id = "TeamLogoPreview"
	TeamLogoPreview:setImage( RegisterMaterial( "icon_faction_unsa_color" ), 0 )
	TeamLogoPreview:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1365, _1080p * 1719, _1080p * 282, _1080p * 636 )
	self:addElement( TeamLogoPreview )
	self.TeamLogoPreview = TeamLogoPreview
	
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f4_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local MenuTitle = nil
	
	MenuTitle = MenuBuilder.BuildRegisteredType( "MenuTitle", {
		controllerIndex = f4_local1
	} )
	MenuTitle.id = "MenuTitle"
	MenuTitle.MenuTitle:setText( ToUpperCase( Engine.Localize( "CODCASTER_TEAM1_LOGO" ) ), 0 )
	MenuTitle.MenuBreadcrumbs:setText( ToUpperCase( Engine.Localize( "CODCASTER_EDIT_SETTINGS" ) ), 0 )
	MenuTitle.Icon:SetTop( _1080p * -28.5, 0 )
	MenuTitle.Icon:SetBottom( _1080p * 61.5, 0 )
	MenuTitle:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 96, 0, _1080p * 54, _1080p * 132 )
	self:addElement( MenuTitle )
	self.MenuTitle = MenuTitle
	
	local TeamLogos = nil
	
	TeamLogos = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 5,
		maxVisibleRows = 4,
		controllerIndex = f4_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "CodCasterTeamLogo", {
				controllerIndex = f4_local1
			} )
		end,
		wrapX = true,
		wrapY = true,
		spacingX = _1080p * 20,
		spacingY = _1080p * 20,
		columnWidth = _1080p * 210,
		rowHeight = _1080p * 160,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	TeamLogos.id = "TeamLogos"
	TeamLogos:setUseStencil( true )
	TeamLogos:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 1260, _1080p * 216, _1080p * 916 )
	self:addElement( TeamLogos )
	self.TeamLogos = TeamLogos
	
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
		local f7_local0 = f7_arg1.controller or f4_local1
		ACTIONS.LeaveMenu( self )
	end )
	f0_local1( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "CodcasterTeamLogoSettings", CodcasterTeamLogoSettings )
LockTable( _M )
