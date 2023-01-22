local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ConfirmLanguageChangePopup( f1_arg0, f1_arg1 )
	assert( f1_arg1.newLanguageCode )
	local f1_local0 = MenuBuilder.BuildRegisteredType( "PopupYesNo", {
		title = Engine.Localize( "MENU_NOTICE" ),
		message = Engine.Localize( "LANGUAGE_SELECT_CONFIRM_CHANGE" ),
		yesAction = function ( f2_arg0, f2_arg1 )
			Engine.SetPreferredLanguage( f2_arg1, f1_arg1.newLanguageCode )
			Engine.ExecNow( "updategamerprofile" )
			DCache.SetLanguage( f1_arg1.newLanguageCode )
			Engine.SystemRestart( "" )
		end,
		noAction = function ( f3_arg0 )
			LUI.FlowManager.RequestLeaveMenuByName( "LanguageSelect" )
		end
	} )
	f1_local0.id = "ConfirmLanguageChangePopup"
	return f1_local0
end

MenuBuilder.registerType( "ConfirmLanguageChangePopup", ConfirmLanguageChangePopup )
function MakeLanguageSelectButton( f4_arg0, f4_arg1, f4_arg2, f4_arg3 )
	assert( f4_arg0 )
	assert( f4_arg0.Title )
	f4_arg0.Title:setText( Engine.Localize( f4_arg2 ) )
	local f4_local0 = {}
	for f4_local1 = 1, #f4_arg3, 1 do
		assert( f4_arg3[f4_local1].label )
		assert( f4_arg3[f4_local1].language )
		table.insert( f4_local0, Engine.Localize( f4_arg3[f4_local1].label ) )
	end
	local f4_local1 = 1
	local f4_local2 = GetCurrentLanguage()
	for f4_local3 = 1, #f4_arg3, 1 do
		assert( f4_arg3[f4_local3].language )
		if f4_arg3[f4_local3].language == f4_local2 then
			f4_local1 = f4_local3
		end
	end
	LUI.AddUIArrowTextButtonLogic( f4_arg0, f4_arg1, {
		labels = f4_local0,
		action = function ( f5_arg0 )
			f4_arg0.newLanguage = f4_arg3[f5_arg0].language
			assert( f4_arg0.newLanguage )
		end,
		defaultValue = f4_local1,
		wrapAround = true
	} )
end

function PostLoadFunc( f6_arg0, f6_arg1 )
	assert( f6_arg0.Button )
	assert( f6_arg0.bindButton )
	if not Engine.InFrontend() then
		f6_arg0:addEventHandler( "menu_create", function ()
			f6_arg0:AddButtonHelperText( {
				helper_text = Engine.Localize( "LUA_MENU_DISMISS_MENU" ),
				button_ref = "button_start",
				side = "left",
				priority = 20,
				clickable = true
			} )
		end )
		f6_arg0.bindButton:addEventHandler( "button_start", function ( f8_arg0, f8_arg1 )
			if Engine.IsSingleplayer() then
				ACTIONS.ResumeGame( f8_arg0 )
			end
			LUI.FlowManager.RequestCloseAllMenus()
			return true
		end )
	end
	local f6_local0 = GetCurrentLanguage()
	f6_arg0.bindButton:addEventHandler( "button_secondary", function ( f9_arg0, f9_arg1 )
		local f9_local0 = f6_arg0.Button.newLanguage or f6_local0
		if f9_local0 == f6_local0 then
			LUI.FlowManager.RequestLeaveMenu( f6_arg0 )
		else
			LUI.FlowManager.RequestPopupMenu( f6_arg0, "ConfirmLanguageChangePopup", true, f9_arg1.controller, false, {
				newLanguageCode = GetLanguageCode( f9_local0 )
			} )
		end
	end )
	local f6_local1 = {
		{
			label = "LANGUAGE_SELECT_ENGLISH",
			language = "LANGUAGE_ENGLISH"
		},
		{
			label = "LANGUAGE_SELECT_SPANISHNA",
			language = "LANGUAGE_SPANISHNA"
		},
		{
			label = "LANGUAGE_SELECT_PORTUGUESE",
			language = "LANGUAGE_PORTUGUESE"
		},
		{
			label = "LANGUAGE_SELECT_FRENCH",
			language = "LANGUAGE_FRENCH"
		},
		{
			label = "LANGUAGE_SELECT_GERMAN",
			language = "LANGUAGE_GERMAN"
		},
		{
			label = "LANGUAGE_SELECT_ITALIAN",
			language = "LANGUAGE_ITALIAN"
		},
		{
			label = "LANGUAGE_SELECT_SPANISH",
			language = "LANGUAGE_SPANISH"
		},
		{
			label = "LANGUAGE_SELECT_ENGLISH",
			language = "LANGUAGE_POLISH_PARTIAL",
			[1] = userConfig == "audio"
		},
		{
			label = "LANGUAGE_SELECT_POLISH",
			language = "LANGUAGE_POLISH_FULL",
			[1] = userConfig == "audio"
		},
		{
			label = "LANGUAGE_SELECT_ENGLISH",
			language = "LANGUAGE_RUSSIAN_PARTIAL",
			[1] = userConfig == "audio"
		},
		{
			label = "LANGUAGE_SELECT_RUSSIAN",
			language = "LANGUAGE_RUSSIAN_FULL",
			[1] = userConfig == "audio"
		},
		{
			label = "LANGUAGE_SELECT_ENGLISH",
			language = "LANGUAGE_ENGLISH_SAFE",
			[1] = userConfig == "text"
		},
		{
			label = "LANGUAGE_SELECT_ARABIC",
			language = "LANGUAGE_ARABIC",
			[1] = userConfig == "text"
		},
		{
			label = "LANGUAGE_SELECT_ENGLISH",
			language = "LANGUAGE_JAPANESE_PARTIAL",
			[1] = userConfig == "audio"
		},
		{
			label = "LANGUAGE_SELECT_JAPANESE",
			language = "LANGUAGE_JAPANESE_FULL",
			[1] = userConfig == "audio"
		},
		{
			label = "LANGUAGE_SELECT_KOREAN",
			language = "LANGUAGE_KOREAN",
			[1] = userConfig == "text"
		},
		{
			label = "LANGUAGE_SELECT_TRADITIONAL_CHINESE",
			language = "LANGUAGE_TRADITIONAL_CHINESE",
			[1] = userConfig == "text"
		},
		{
			label = "LANGUAGE_SELECT_SIMPLIFIED_CHINESE",
			language = "LANGUAGE_SIMPLIFIED_CHINESE",
			[1] = userConfig == "text"
		}
	}
	local f6_local2 = {}
	local f6_local3 = nil
	for f6_local7, f6_local8 in ipairs( f6_local1 ) do
		if Engine.IsLanguageAvailable( GetLanguageCode( f6_local8.language ) ) then
			table.insert( f6_local2, f6_local8 )
			if not f6_local3 then
				f6_local3 = f6_local8.userConfig
			end
		end
	end
	assert( #f6_local2 > 0 )
	f6_local4 = nil
	if f6_local3 == "audio" then
		f6_local4 = "LANGUAGE_SELECT_AUDIO_LANGUAGE"
	elseif f6_local3 == "text" then
		f6_local4 = "LANGUAGE_SELECT_TEXT_LANGUAGE"
	else
		f6_local4 = "LANGUAGE_SELECT_LANGUAGE"
	end
	MakeLanguageSelectButton( f6_arg0.Button, f6_arg1, f6_local4, f6_local2 )
	self = LUI.UIElement.new( {
		worldBlur = 5
	} )
	self:setupWorldBlur()
	self.id = "blur"
	f6_arg0:addElement( self )
end

function LanguageSelect( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "LanguageSelect"
	local f10_local1 = controller and controller.controllerIndex
	if not f10_local1 and not Engine.InFrontend() then
		f10_local1 = self:getRootController()
	end
	assert( f10_local1 )
	self:playSound( "menu_open" )
	local f10_local2 = self
	local MenuTitle = nil
	
	MenuTitle = MenuBuilder.BuildRegisteredType( "MenuTitle", {
		controllerIndex = f10_local1
	} )
	MenuTitle.id = "MenuTitle"
	MenuTitle.MenuTitle:setText( ToUpperCase( Engine.Localize( "LANGUAGE_SELECT_SCREEN_TITLE" ) ), 0 )
	MenuTitle.MenuBreadcrumbs:setText( Engine.Localize( "LUA_MENU_OPTIONS_CAPS" ), 0 )
	MenuTitle.Icon:SetTop( _1080p * -10, 0 )
	MenuTitle.Icon:SetBottom( _1080p * 80, 0 )
	MenuTitle.Icon:setImage( RegisterMaterial( "icon_usna_symbol" ), 0 )
	MenuTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 796, _1080p * 54, _1080p * 134 )
	self:addElement( MenuTitle )
	self.MenuTitle = MenuTitle
	
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f10_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local Button = nil
	
	Button = MenuBuilder.BuildRegisteredType( "GenericArrowButton", {
		controllerIndex = f10_local1
	} )
	Button.id = "Button"
	Button.Title:setText( ToUpperCase( "" ), 0 )
	Button.Text:setText( ToUpperCase( "" ), 0 )
	Button:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 630, _1080p * 216, _1080p * 246 )
	self:addElement( Button )
	self.Button = Button
	
	self.addButtonHelperFunction = function ( f11_arg0, f11_arg1 )
		f11_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			priority = 1,
			clickable = true
		} )
	end
	
	self:addEventHandler( "menu_create", self.addButtonHelperFunction )
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	PostLoadFunc( self, f10_local1, controller )
	return self
end

MenuBuilder.registerType( "LanguageSelect", LanguageSelect )
LockTable( _M )
