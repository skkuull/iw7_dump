local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.bindButton )
	if not Engine.InFrontend() then
		f1_arg0:addEventHandler( "menu_create", function ()
			f1_arg0:AddButtonHelperText( {
				helper_text = Engine.Localize( "LUA_MENU_DISMISS_MENU" ),
				button_ref = "button_start",
				side = "left",
				priority = 20,
				clickable = true
			} )
		end )
		f1_arg0.bindButton:addEventHandler( "button_start", function ( f3_arg0, f3_arg1 )
			if Engine.IsSingleplayer() then
				ACTIONS.ResumeGame( f3_arg0 )
			end
			LUI.FlowManager.RequestCloseAllMenus()
			return true
		end )
	end
	local self = LUI.UIElement.new( {
		worldBlur = 5
	} )
	self:setupWorldBlur()
	self.id = "blur"
	f1_arg0:addElement( self )
end

function AudioOptions( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "AudioOptions"
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	self:playSound( "menu_open" )
	local f4_local2 = self
	local f4_local3 = nil
	if not Engine.InFrontend() then
		f4_local3 = LUI.UIImage.new()
		f4_local3.id = "Background"
		f4_local3:SetRGBFromInt( 0, 0 )
		f4_local3:SetAlpha( 0.5, 0 )
		self:addElement( f4_local3 )
		self.Background = f4_local3
	end
	local f4_local4 = nil
	if not CONDITIONS.IsThirdGameModeDesired( self ) then
		f4_local4 = MenuBuilder.BuildRegisteredType( "MenuTitle", {
			controllerIndex = f4_local1
		} )
		f4_local4.id = "MenuTitle"
		f4_local4.MenuTitle:setText( Engine.Localize( "LUA_MENU_AUDIO_OPTIONS_CAPS" ), 0 )
		f4_local4.MenuBreadcrumbs:setText( ToUpperCase( Engine.Localize( "LUA_MENU_OPTIONS_CAPS" ) ), 0 )
		f4_local4.Icon:SetTop( _1080p * -10, 0 )
		f4_local4.Icon:SetBottom( _1080p * 80, 0 )
		f4_local4.Icon:setImage( RegisterMaterial( "icon_usna_symbol" ), 0 )
		f4_local4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
		self:addElement( f4_local4 )
		self.MenuTitle = f4_local4
	end
	local f4_local5 = nil
	if CONDITIONS.IsThirdGameModeDesired( self ) then
		f4_local5 = MenuBuilder.BuildRegisteredType( "CPMenuTitle", {
			controllerIndex = f4_local1
		} )
		f4_local5.id = "CPMenuTitle"
		f4_local5.MenuTitle:setText( Engine.Localize( "LUA_MENU_AUDIO_OPTIONS_CAPS" ), 0 )
		f4_local5:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 84.21, _1080p * 1044.21, _1080p * 43, _1080p * 123 )
		self:addElement( f4_local5 )
		self.CPMenuTitle = f4_local5
	end
	local ButtonDescriptionText = nil
	
	ButtonDescriptionText = MenuBuilder.BuildRegisteredType( "ButtonDescriptionText", {
		controllerIndex = f4_local1
	} )
	ButtonDescriptionText.id = "ButtonDescriptionText"
	ButtonDescriptionText.Description:SetRight( _1080p * 415, 0 )
	ButtonDescriptionText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 140, _1080p * 560, _1080p * 875, _1080p * 907 )
	self:addElement( ButtonDescriptionText )
	self.ButtonDescriptionText = ButtonDescriptionText
	
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f4_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local f4_local8 = nil
	if not CONDITIONS.IsSingleplayer( self ) then
		f4_local8 = MenuBuilder.BuildRegisteredType( "online_friends_widget", {
			controllerIndex = f4_local1
		} )
		f4_local8.id = "FriendsElement"
		f4_local8:SetFont( FONTS.GetFont( FONTS.Dev.File ) )
		f4_local8:SetAlignment( LUI.Alignment.Left )
		f4_local8:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 1401.97, _1080p * 1901.97, _1080p * -57, _1080p * -12 )
		self:addElement( f4_local8 )
		self.FriendsElement = f4_local8
	end
	local AudioOptionsButtonsElement = nil
	
	AudioOptionsButtonsElement = MenuBuilder.BuildRegisteredType( "AudioOptionsButtons", {
		controllerIndex = f4_local1
	} )
	AudioOptionsButtonsElement.id = "AudioOptionsButtonsElement"
	AudioOptionsButtonsElement:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 906, _1080p * 216, _1080p * 917 )
	self:addElement( AudioOptionsButtonsElement )
	self.AudioOptionsButtonsElement = AudioOptionsButtonsElement
	
	self.addButtonHelperFunction = function ( f5_arg0, f5_arg1 )
		f5_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			priority = 10,
			clickable = true
		} )
		f5_arg0:AddButtonHelperText( {
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
	
	self.bindButton:addEventHandler( "button_secondary", function ( f6_arg0, f6_arg1 )
		local f6_local0 = f6_arg1.controller or f4_local1
		ACTIONS.LeaveMenu( self )
		return true
	end )
	PostLoadFunc( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "AudioOptions", AudioOptions )
LockTable( _M )
