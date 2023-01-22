local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1 )
	return function ( f2_arg0, f2_arg1 )
		local f2_local0 = not MLG.ShoutcasterProfileVarBool( f2_arg1, f1_arg0 )
		local f2_local1 = MLG.SetShoutcasterProfileVarValue
		local f2_local2 = f2_arg1
		local f2_local3 = f1_arg0
		local f2_local4
		if f2_local0 then
			f2_local4 = 1
			if not f2_local4 then
			
			else
				f2_local1( f2_local2, f2_local3, f2_local4 )
				if f1_arg1 ~= nil then
					f1_arg1( f2_local0 )
				end
			end
		end
		f2_local4 = 0
	end
	
end

f0_local1 = function ( f3_arg0 )
	return function ( f4_arg0, f4_arg1 )
		f3_arg0:SetText( f4_arg0.Text )
	end
	
end

f0_local2 = function ( f5_arg0, f5_arg1 )
	return function ( f6_arg0 )
		if not Engine.InFrontend() then
			f5_arg0:dispatchEventToRoot( {
				name = "codcaster_setting_change",
				immediate = true,
				setting_category = "quick",
				setting_name = f5_arg1,
				setting_value = f6_arg0,
				update_WidgetVisibility = false
			} )
		end
	end
	
end

local f0_local3 = function ( f7_arg0 )
	return function ( f8_arg0 )
		if not Engine.InFrontend() then
			f7_arg0:dispatchEventToRoot( {
				name = "codcaster_setting_change",
				immediate = true,
				setting_category = "quick",
				setting_name = "player_hud",
				setting_value = f8_arg0,
				update_WidgetVisibility = true
			} )
		end
	end
	
end

local f0_local4 = function ( f9_arg0 )
	if not Engine.InFrontend() then
		MLG.SetThirdPerson( f9_arg0 )
	end
end

local f0_local5 = function ( f10_arg0 )
	if not Engine.InFrontend() then
		MLG.SetPlayerOutlines( f10_arg0 )
	end
end

local f0_local6 = function ( f11_arg0 )
	return function ( f12_arg0 )
		if not Engine.InFrontend() then
			f11_arg0:dispatchEventToRoot( {
				name = "codcaster_setting_change",
				immediate = true,
				setting_category = "quick",
				setting_name = "player_numbers",
				setting_value = f12_arg0,
				update_WidgetVisibility = false
			} )
		end
	end
	
end

local f0_local7 = function ( f13_arg0 )
	return function ( f14_arg0 )
		if not Engine.InFrontend() then
			f13_arg0:dispatchEventToRoot( {
				name = "codcaster_setting_change",
				immediate = true,
				setting_category = "quick",
				setting_name = "listen_in",
				setting_value = f14_arg0,
				update_WidgetVisibility = false
			} )
		end
	end
	
end

local f0_local8 = function ( f15_arg0 )
	return function ( f16_arg0 )
		if not Engine.InFrontend() then
			f15_arg0:dispatchEventToRoot( {
				name = "codcaster_setting_change",
				immediate = true,
				setting_category = "quick",
				setting_name = "playernameplates",
				setting_value = f16_arg0,
				update_WidgetVisibility = false
			} )
		end
	end
	
end

local f0_local9 = function ( f17_arg0, f17_arg1, f17_arg2, f17_arg3, f17_arg4 )
	local f17_local0 = MLG.ShoutcasterProfileVarBool( f17_arg1, f17_arg3 )
	if f17_arg4 ~= nil then
		f17_arg4( f17_local0 )
	end
	local f17_local1 = {}
	local f17_local2 = {}
	local f17_local3 = Engine.Localize( "LUA_MENU_ENABLED" )
	local f17_local4 = Engine.Localize( "LUA_MENU_DISABLED" )
	f17_local1.labels = f17_local3
	f17_local1.action = f0_local0( f17_arg3, f17_arg4 )
	if f17_local0 then
		f17_local2 = 1
		if not f17_local2 then
		
		else
			f17_local1.defaultValue = f17_local2
			f17_local1.wrapAround = true
			LUI.AddUIArrowTextButtonLogic( f17_arg2, f17_arg1, f17_local1 )
			f17_arg2:addEventHandler( "gain_focus", function ( f18_arg0, f18_arg1 )
				f17_arg0.ButtonDescription:processEvent( {
					name = "update_button_description",
					text = f18_arg0.buttonDescription or ""
				} )
			end )
		end
	end
	f17_local2 = 2
end

local f0_local10 = function ( f19_arg0 )
	f19_arg0.XRayArrowButton.Text:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.None )
	f19_arg0.ThirdPersonArrowButton.Text:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.None )
	f19_arg0.ListenInArrowButton.Text:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.None )
	f19_arg0.PlayerListArrowButton.Text:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.None )
	f19_arg0.ScorePanelArrowButton.Text:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.None )
	f19_arg0.ScreenBorderArrowButton.Text:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.None )
	f19_arg0.PlayerCardArrowButton.Text:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.None )
	f19_arg0.PlayerHUDArrowButton.Text:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.None )
	f19_arg0.PlayerNumbersArrowButton.Text:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.None )
	f19_arg0.PlayerNameplatesArrowButton.Text:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.None )
	f19_arg0.XRayArrowButton.Title:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.None )
	f19_arg0.ThirdPersonArrowButton.Title:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.None )
	f19_arg0.ListenInArrowButton.Title:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.None )
	f19_arg0.PlayerListArrowButton.Title:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.None )
	f19_arg0.ScorePanelArrowButton.Title:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.None )
	f19_arg0.ScreenBorderArrowButton.Title:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.None )
	f19_arg0.PlayerCardArrowButton.Title:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.None )
	f19_arg0.PlayerHUDArrowButton.Title:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.None )
	f19_arg0.PlayerNumbersArrowButton.Title:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.None )
	f19_arg0.PlayerNameplatesArrowButton.Title:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.None )
	if not IsLanguageRightToLeft( GetCurrentLanguage() ) then
		f19_arg0.PlayerNumbersArrowButton.Title:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 20, _1080p * -300, _1080p * -11, _1080p * 11 )
	end
end

local f0_local11 = function ( f20_arg0, f20_arg1, f20_arg2 )
	f0_local10( f20_arg0 )
	f0_local9( f20_arg0, f20_arg1, f20_arg0.XRayArrowButton, "shoutcaster_qs_xray", f0_local5 )
	f0_local9( f20_arg0, f20_arg1, f20_arg0.ThirdPersonArrowButton, "shoutcaster_qs_thirdperson", f0_local4 )
	f0_local9( f20_arg0, f20_arg1, f20_arg0.ListenInArrowButton, "shoutcaster_qs_listen_in", f0_local2( f20_arg0, "listen_in" ) )
	f0_local9( f20_arg0, f20_arg1, f20_arg0.PlayerListArrowButton, "shoutcaster_qs_playerlist", f0_local2( f20_arg0, "player_list" ) )
	f0_local9( f20_arg0, f20_arg1, f20_arg0.ScorePanelArrowButton, "shoutcaster_qs_scorepanel", f0_local2( f20_arg0, "score_panel" ) )
	f0_local9( f20_arg0, f20_arg1, f20_arg0.ScreenBorderArrowButton, "shoutcaster_qs_screenborder", f0_local2( f20_arg0, "screen_border" ) )
	f0_local9( f20_arg0, f20_arg1, f20_arg0.PlayerCardArrowButton, "shoutcaster_qs_playercard", f0_local2( f20_arg0, "player_card" ) )
	f0_local9( f20_arg0, f20_arg1, f20_arg0.PlayerHUDArrowButton, "shoutcaster_qs_playerhud", f0_local3( f20_arg0 ) )
	f0_local9( f20_arg0, f20_arg1, f20_arg0.PlayerNumbersArrowButton, "shoutcaster_qs_playernumbers", f0_local6( f20_arg0 ) )
	f0_local9( f20_arg0, f20_arg1, f20_arg0.PlayerNameplatesArrowButton, "shoutcaster_qs_playernameplates", f0_local8( f20_arg0 ) )
	f20_arg0.ButtonDescription.Description:SetDecodeLetterLength( CODCASTER.fastDecodeLetterLength )
	f20_arg0.ButtonDescription.Description:SetDecodeMaxRandChars( CODCASTER.fastDecodeMaxRandChars )
	f20_arg0.ButtonDescription.Description:SetDecodeUpdatesPerLetter( CODCASTER.fastDecodeUpdatesPerLetter )
end

function CodCasterQuickSettings( menu, controller )
	local self = LUI.UIVerticalList.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 705 * _1080p, 0, 580 * _1080p )
	self.id = "CodCasterQuickSettings"
	local f21_local1 = controller and controller.controllerIndex
	if not f21_local1 and not Engine.InFrontend() then
		f21_local1 = self:getRootController()
	end
	assert( f21_local1 )
	local f21_local2 = self
	self:SetSpacing( 10 * _1080p )
	local XRayArrowButton = nil
	
	XRayArrowButton = MenuBuilder.BuildRegisteredType( "GenericArrowButton", {
		controllerIndex = f21_local1
	} )
	XRayArrowButton.id = "XRayArrowButton"
	XRayArrowButton.buttonDescription = Engine.Localize( "CODCASTER_QS_XRAY_HINT" )
	XRayArrowButton.Title:setText( ToUpperCase( Engine.Localize( "CODCASTER_QS_XRAY" ) ), 0 )
	XRayArrowButton.Text:setText( ToUpperCase( Engine.Localize( "LUA_MENU_ENABLED" ) ), 0 )
	XRayArrowButton:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 705, 0, _1080p * 30 )
	self:addElement( XRayArrowButton )
	self.XRayArrowButton = XRayArrowButton
	
	local ThirdPersonArrowButton = nil
	
	ThirdPersonArrowButton = MenuBuilder.BuildRegisteredType( "GenericArrowButton", {
		controllerIndex = f21_local1
	} )
	ThirdPersonArrowButton.id = "ThirdPersonArrowButton"
	ThirdPersonArrowButton.buttonDescription = Engine.Localize( "CODCASTER_QS_THIRD_PERSON_HINT" )
	ThirdPersonArrowButton.Title:setText( ToUpperCase( Engine.Localize( "CODCASTER_QS_THIRD_PERSON" ) ), 0 )
	ThirdPersonArrowButton.Text:setText( ToUpperCase( Engine.Localize( "LUA_MENU_ENABLED" ) ), 0 )
	ThirdPersonArrowButton:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 705, _1080p * 40, _1080p * 70 )
	self:addElement( ThirdPersonArrowButton )
	self.ThirdPersonArrowButton = ThirdPersonArrowButton
	
	local ListenInArrowButton = nil
	
	ListenInArrowButton = MenuBuilder.BuildRegisteredType( "GenericArrowButton", {
		controllerIndex = f21_local1
	} )
	ListenInArrowButton.id = "ListenInArrowButton"
	ListenInArrowButton.buttonDescription = Engine.Localize( "CODCASTER_QS_LISTEN_IN_HINT" )
	ListenInArrowButton.Title:setText( ToUpperCase( Engine.Localize( "CODCASTER_QS_LISTEN_IN" ) ), 0 )
	ListenInArrowButton.Text:setText( ToUpperCase( Engine.Localize( "LUA_MENU_ENABLED" ) ), 0 )
	ListenInArrowButton:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 705, _1080p * 80, _1080p * 110 )
	self:addElement( ListenInArrowButton )
	self.ListenInArrowButton = ListenInArrowButton
	
	local PlayerListArrowButton = nil
	
	PlayerListArrowButton = MenuBuilder.BuildRegisteredType( "GenericArrowButton", {
		controllerIndex = f21_local1
	} )
	PlayerListArrowButton.id = "PlayerListArrowButton"
	PlayerListArrowButton.buttonDescription = Engine.Localize( "CODCASTER_QS_PLAYER_LIST_HINT" )
	PlayerListArrowButton.Title:setText( ToUpperCase( Engine.Localize( "CODCASTER_QS_PLAYER_LIST" ) ), 0 )
	PlayerListArrowButton.Text:setText( ToUpperCase( Engine.Localize( "LUA_MENU_ENABLED" ) ), 0 )
	PlayerListArrowButton:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 705, _1080p * 120, _1080p * 150 )
	self:addElement( PlayerListArrowButton )
	self.PlayerListArrowButton = PlayerListArrowButton
	
	local ScorePanelArrowButton = nil
	
	ScorePanelArrowButton = MenuBuilder.BuildRegisteredType( "GenericArrowButton", {
		controllerIndex = f21_local1
	} )
	ScorePanelArrowButton.id = "ScorePanelArrowButton"
	ScorePanelArrowButton.buttonDescription = Engine.Localize( "CODCASTER_QS_SCORE_PANEL_HINT" )
	ScorePanelArrowButton.Title:setText( ToUpperCase( Engine.Localize( "CODCASTER_QS_SCORE_PANEL" ) ), 0 )
	ScorePanelArrowButton.Text:setText( ToUpperCase( Engine.Localize( "LUA_MENU_ENABLED" ) ), 0 )
	ScorePanelArrowButton:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 705, _1080p * 160, _1080p * 190 )
	self:addElement( ScorePanelArrowButton )
	self.ScorePanelArrowButton = ScorePanelArrowButton
	
	local ScreenBorderArrowButton = nil
	
	ScreenBorderArrowButton = MenuBuilder.BuildRegisteredType( "GenericArrowButton", {
		controllerIndex = f21_local1
	} )
	ScreenBorderArrowButton.id = "ScreenBorderArrowButton"
	ScreenBorderArrowButton.buttonDescription = Engine.Localize( "CODCASTER_QS_SCREEN_BORDER_HINT" )
	ScreenBorderArrowButton.Title:setText( ToUpperCase( Engine.Localize( "CODCASTER_QS_SCREEN_BORDER" ) ), 0 )
	ScreenBorderArrowButton.Text:setText( Engine.Localize( "LUA_MENU_ENABLED" ), 0 )
	ScreenBorderArrowButton:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 705, _1080p * 200, _1080p * 230 )
	self:addElement( ScreenBorderArrowButton )
	self.ScreenBorderArrowButton = ScreenBorderArrowButton
	
	local PlayerCardArrowButton = nil
	
	PlayerCardArrowButton = MenuBuilder.BuildRegisteredType( "GenericArrowButton", {
		controllerIndex = f21_local1
	} )
	PlayerCardArrowButton.id = "PlayerCardArrowButton"
	PlayerCardArrowButton.buttonDescription = Engine.Localize( "CODCASTER_QS_PLAYER_CARD_HINT" )
	PlayerCardArrowButton.Title:setText( ToUpperCase( Engine.Localize( "CODCASTER_QS_PLAYER_CARD" ) ), 0 )
	PlayerCardArrowButton.Text:setText( ToUpperCase( Engine.Localize( "LUA_MENU_ENABLED" ) ), 0 )
	PlayerCardArrowButton:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 705, _1080p * 240, _1080p * 270 )
	self:addElement( PlayerCardArrowButton )
	self.PlayerCardArrowButton = PlayerCardArrowButton
	
	local PlayerHUDArrowButton = nil
	
	PlayerHUDArrowButton = MenuBuilder.BuildRegisteredType( "GenericArrowButton", {
		controllerIndex = f21_local1
	} )
	PlayerHUDArrowButton.id = "PlayerHUDArrowButton"
	PlayerHUDArrowButton.buttonDescription = Engine.Localize( "CODCASTER_QS_PLAYER_HUD_HINT" )
	PlayerHUDArrowButton.Title:setText( ToUpperCase( Engine.Localize( "CODCASTER_QS_PLAYER_HUD" ) ), 0 )
	PlayerHUDArrowButton.Text:setText( ToUpperCase( Engine.Localize( "LUA_MENU_ENABLED" ) ), 0 )
	PlayerHUDArrowButton:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 705, _1080p * 280, _1080p * 310 )
	self:addElement( PlayerHUDArrowButton )
	self.PlayerHUDArrowButton = PlayerHUDArrowButton
	
	local PlayerNumbersArrowButton = nil
	
	PlayerNumbersArrowButton = MenuBuilder.BuildRegisteredType( "GenericArrowButton", {
		controllerIndex = f21_local1
	} )
	PlayerNumbersArrowButton.id = "PlayerNumbersArrowButton"
	PlayerNumbersArrowButton.buttonDescription = Engine.Localize( "CODCASTER_PLAYER_NUMBERS_DESC" )
	PlayerNumbersArrowButton.Title:setText( ToUpperCase( Engine.Localize( "CODCASTER_PLAYER_NUMBERS" ) ), 0 )
	PlayerNumbersArrowButton.Text:setText( ToUpperCase( Engine.Localize( "LUA_MENU_ENABLED" ) ), 0 )
	PlayerNumbersArrowButton:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 705, _1080p * 320, _1080p * 350 )
	self:addElement( PlayerNumbersArrowButton )
	self.PlayerNumbersArrowButton = PlayerNumbersArrowButton
	
	local PlayerNameplatesArrowButton = nil
	
	PlayerNameplatesArrowButton = MenuBuilder.BuildRegisteredType( "GenericArrowButton", {
		controllerIndex = f21_local1
	} )
	PlayerNameplatesArrowButton.id = "PlayerNameplatesArrowButton"
	PlayerNameplatesArrowButton.buttonDescription = Engine.Localize( "CODCASTER_QS_PLAYERNAMEPLATES_DESC" )
	PlayerNameplatesArrowButton.Title:setText( ToUpperCase( Engine.Localize( "CODCASTER_QS_PLAYERNAMEPLATES" ) ), 0 )
	PlayerNameplatesArrowButton.Text:setText( Engine.Localize( "LUA_MENU_ENABLED" ), 0 )
	PlayerNameplatesArrowButton:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 705, _1080p * 360, _1080p * 390 )
	self:addElement( PlayerNameplatesArrowButton )
	self.PlayerNameplatesArrowButton = PlayerNameplatesArrowButton
	
	local ButtonDescription = nil
	
	ButtonDescription = MenuBuilder.BuildRegisteredType( "ButtonDescriptionText", {
		controllerIndex = f21_local1
	} )
	ButtonDescription.id = "ButtonDescription"
	ButtonDescription.Description:SetRight( _1080p * 415, 0 )
	ButtonDescription:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 420, _1080p * 400, _1080p * 432 )
	self:addElement( ButtonDescription )
	self.ButtonDescription = ButtonDescription
	
	f0_local11( self, f21_local1, controller )
	return self
end

MenuBuilder.registerType( "CodCasterQuickSettings", CodCasterQuickSettings )
LockTable( _M )
