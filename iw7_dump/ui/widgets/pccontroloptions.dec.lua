local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.PCControlsOptionsButtonElement )
	assert( f1_arg2.optionsMenu )
	assert( f1_arg2.title )
	if not Engine.IsAliensMode() then
		assert( f1_arg0.MenuTitle )
		assert( f1_arg0.MenuTitle.MenuTitle )
		f1_arg0.MenuTitle.MenuTitle:setText( Engine.Localize( f1_arg2.title ), 0 )
	end
	if Engine.IsAliensMode() then
		assert( f1_arg0.CPMenuTitle )
		assert( f1_arg0.CPMenuTitle.MenuTitle )
		f1_arg0.CPMenuTitle.MenuTitle:setText( Engine.Localize( f1_arg2.title ), 0 )
	end
	f1_arg0.PCControlsOptionsButtonElement:CreateOptions( f1_arg1, f1_arg2.optionsMenu )
	local self = LUI.UIElement.new( {
		worldBlur = 5
	} )
	self:setupWorldBlur()
	self.id = "blur"
	f1_arg0:addElement( self )
end

function PCControlOptions( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "PCControlOptions"
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	self:playSound( "menu_open" )
	local f2_local2 = self
	local f2_local3 = nil
	if not Engine.InFrontend() then
		f2_local3 = LUI.UIImage.new()
		f2_local3.id = "Background"
		f2_local3:SetRGBFromInt( 0, 0 )
		f2_local3:SetAlpha( 0.5, 0 )
		self:addElement( f2_local3 )
		self.Background = f2_local3
	end
	local f2_local4 = nil
	if not CONDITIONS.IsThirdGameModeDesired( self ) then
		f2_local4 = MenuBuilder.BuildRegisteredType( "MenuTitle", {
			controllerIndex = f2_local1
		} )
		f2_local4.id = "MenuTitle"
		f2_local4.MenuTitle:setText( Engine.Localize( "LUA_MENU_AUDIO_OPTIONS_CAPS" ), 0 )
		f2_local4.MenuBreadcrumbs:setText( ToUpperCase( Engine.Localize( "LUA_MENU_CONTROL_OPTIONS_CAPS" ) ), 0 )
		f2_local4.Icon:SetTop( _1080p * -10, 0 )
		f2_local4.Icon:SetBottom( _1080p * 80, 0 )
		f2_local4.Icon:setImage( RegisterMaterial( "icon_usna_symbol" ), 0 )
		f2_local4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
		self:addElement( f2_local4 )
		self.MenuTitle = f2_local4
	end
	local f2_local5 = nil
	if CONDITIONS.IsThirdGameModeDesired( self ) then
		f2_local5 = MenuBuilder.BuildRegisteredType( "CPMenuTitle", {
			controllerIndex = f2_local1
		} )
		f2_local5.id = "CPMenuTitle"
		f2_local5.MenuTitle:setText( Engine.Localize( "LUA_MENU_AUDIO_OPTIONS_CAPS" ), 0 )
		f2_local5:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 84.21, _1080p * 1044.21, _1080p * 43, _1080p * 123 )
		self:addElement( f2_local5 )
		self.CPMenuTitle = f2_local5
	end
	local ButtonDescriptionText = nil
	
	ButtonDescriptionText = MenuBuilder.BuildRegisteredType( "ButtonDescriptionText", {
		controllerIndex = f2_local1
	} )
	ButtonDescriptionText.id = "ButtonDescriptionText"
	ButtonDescriptionText.Description:SetRight( _1080p * 415, 0 )
	ButtonDescriptionText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 152.21, _1080p * 572.21, _1080p * 913.6, _1080p * 945.6 )
	self:addElement( ButtonDescriptionText )
	self.ButtonDescriptionText = ButtonDescriptionText
	
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f2_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1920, _1080p * 995, _1080p * 1080 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local f2_local8 = nil
	if not CONDITIONS.IsSingleplayer( self ) then
		f2_local8 = MenuBuilder.BuildRegisteredType( "online_friends_widget", {
			controllerIndex = f2_local1
		} )
		f2_local8.id = "FriendsElement"
		f2_local8:SetFont( FONTS.GetFont( FONTS.Dev.File ) )
		f2_local8:SetAlignment( LUI.Alignment.Left )
		f2_local8:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1401.97, _1080p * 1901.97, _1080p * 1022.5, _1080p * 1067.5 )
		self:addElement( f2_local8 )
		self.FriendsElement = f2_local8
	end
	local PCControlsOptionsButtonElement = nil
	
	PCControlsOptionsButtonElement = MenuBuilder.BuildRegisteredType( "PCControlOptionsButtons", {
		controllerIndex = f2_local1
	} )
	PCControlsOptionsButtonElement.id = "PCControlsOptionsButtonElement"
	PCControlsOptionsButtonElement:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 906, _1080p * 196, _1080p * 948.6 )
	self:addElement( PCControlsOptionsButtonElement )
	self.PCControlsOptionsButtonElement = PCControlsOptionsButtonElement
	
	self.addButtonHelperFunction = function ( f3_arg0, f3_arg1 )
		f3_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			priority = 10,
			clickable = true
		} )
		f3_arg0:AddButtonHelperText( {
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
	
	self.bindButton:addEventHandler( "button_secondary", function ( f4_arg0, f4_arg1 )
		local f4_local0 = f4_arg1.controller or f2_local1
		ACTIONS.LeaveMenu( self )
		return true
	end )
	f0_local0( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "PCControlOptions", PCControlOptions )
LockTable( _M )
