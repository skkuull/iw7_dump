local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	if CONDITIONS.IsAliensOnline( f1_arg0 ) then
		if Engine.IsConsoleGame() then
			assert( f1_arg0.ClanTag )
			local f1_local0 = f1_arg0.ClanTag
			local f1_local1 = f1_local0
			f1_local0 = f1_local0.SetButtonDisabled
			local f1_local2 = Engine.IsXB3()
			if f1_local2 then
				f1_local2 = not Engine.IsUserSignedInToLive( f1_arg1 )
			end
			f1_local0( f1_local1, f1_local2 )
			f1_arg0.ClanTag:addEventHandler( "button_action", function ( f2_arg0, f2_arg1 )
				local f2_local0 = f2_arg1.controller or f1_arg1
				Engine.AntiCheatBanCheck( f2_local0, CoD.AntiCheat.Ban.FEATURE_BAN_GLOBAL_CLAN_TAG )
				OSK.OpenScreenKeyboard( f2_local0, Engine.Localize( "@LUA_MENU_CUSTOM_CLAN_TAG" ), Engine.GetCustomClanTag( f2_local0 ) or "", 4, true, true, true, function ( f3_arg0, f3_arg1, f3_arg2 )
					if f3_arg1 then
						Engine.SetAndEnableCustomClanTag( f3_arg0, f3_arg1 )
					end
				end )
			end )
		end
	else
		local f1_local0, f1_local1, f1_local2, f1_local3 = f1_arg0.Merits:getLocalRect()
		f1_arg0.Tips:SetTop( f1_local1 + 40 * _1080p, 0 )
		f1_arg0.Tips:SetBottom( f1_local3 + 40 * _1080p, 0 )
	end
end

function CPBarracksButtons( menu, controller )
	local self = LUI.UIVerticalNavigator.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 600 * _1080p, 0, 400 * _1080p )
	self.id = "CPBarracksButtons"
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local Merits = nil
	
	Merits = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f4_local1
	} )
	Merits.id = "Merits"
	Merits.buttonDescription = Engine.Localize( "LUA_MENU_ZM_MERITS_DESC" )
	Merits.Text:setText( Engine.Localize( "LUA_MENU_ZM_MERITS_CAPS" ), 0 )
	Merits:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 35 )
	self:addElement( Merits )
	self.Merits = Merits
	
	local f4_local4 = nil
	if CONDITIONS.IsAliensOnline( self ) then
		f4_local4 = MenuBuilder.BuildRegisteredType( "GenericButton", {
			controllerIndex = f4_local1
		} )
		f4_local4.id = "leaderboards"
		if CONDITIONS.IsAliensOnline( self ) then
			
		else
			
		end
		if CONDITIONS.IsAliensOnline( self ) then
			f4_local4.buttonDescription = Engine.Localize( "LUA_MENU_ZM_LEADERBOARDS_DESC" )
		end
		f4_local4.Text:setText( Engine.Localize( "LUA_MENU_ZM_LEADERBOARDS_CAPS" ), 0 )
		f4_local4:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 40, _1080p * 75 )
		self:addElement( f4_local4 )
		self.leaderboards = f4_local4
	end
	local f4_local5 = nil
	if CONDITIONS.IsAliensOnline( self ) then
		f4_local5 = MenuBuilder.BuildRegisteredType( "GenericButton", {
			controllerIndex = f4_local1
		} )
		f4_local5.id = "ClanTag"
		if CONDITIONS.IsAliensOnline( self ) then
			
		else
			
		end
		if CONDITIONS.IsAliensOnline( self ) then
			
		else
			
		end
		f4_local5.Text:setText( Engine.Localize( "MENU_CLAN_TAG_CAPS" ), 0 )
		f4_local5:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 80, _1080p * 115 )
		self:addElement( f4_local5 )
		self.ClanTag = f4_local5
	end
	local Tips = nil
	
	Tips = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f4_local1
	} )
	Tips.id = "Tips"
	Tips.Text:setText( ToUpperCase( Engine.Localize( "ZM_TUTORIALS_TUTORIAL_MENU_HEADER" ) ), 0 )
	Tips:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 120, _1080p * 155 )
	self:addElement( Tips )
	self.Tips = Tips
	
	local f4_local7 = nil
	if DataSources.frontEnd.CP.songs.hasAnySongUnlocked:GetValue( f4_local1 ) ~= nil and DataSources.frontEnd.CP.songs.hasAnySongUnlocked:GetValue( f4_local1 ) == 1 then
		f4_local7 = MenuBuilder.BuildRegisteredType( "GenericButton", {
			controllerIndex = f4_local1
		} )
		f4_local7.id = "LobbyMusic"
		if DataSources.frontEnd.CP.songs.hasAnySongUnlocked:GetValue( f4_local1 ) ~= nil and DataSources.frontEnd.CP.songs.hasAnySongUnlocked:GetValue( f4_local1 ) == 1 then
			
		else
			
		end
		if DataSources.frontEnd.CP.songs.hasAnySongUnlocked:GetValue( f4_local1 ) ~= nil and DataSources.frontEnd.CP.songs.hasAnySongUnlocked:GetValue( f4_local1 ) == 1 then
			
		else
			
		end
		f4_local7.Text:setText( "LOBBY MUSIC", 0 )
		f4_local7:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 156, _1080p * 191 )
		self:addElement( f4_local7 )
		self.LobbyMusic = f4_local7
	end
	local ForSpacing = nil
	
	ForSpacing = LUI.UIImage.new()
	ForSpacing.id = "ForSpacing"
	ForSpacing:SetAlpha( 0, 0 )
	ForSpacing:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 5, _1080p * 181, _1080p * 186 )
	self:addElement( ForSpacing )
	self.ForSpacing = ForSpacing
	
	local ButtonDescription = nil
	
	ButtonDescription = MenuBuilder.BuildRegisteredType( "ButtonDescriptionText", {
		controllerIndex = f4_local1
	} )
	ButtonDescription.id = "ButtonDescription"
	ButtonDescription:SetRGBFromTable( SWATCHES.genericButton.textDisabled, 0 )
	ButtonDescription:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 504, _1080p * 239, _1080p * 289 )
	self:addElement( ButtonDescription )
	self.ButtonDescription = ButtonDescription
	
	Merits:addEventHandler( "button_action", function ( f5_arg0, f5_arg1 )
		ACTIONS.OpenMenu( "ChallengeCategoriesMenu", true, f5_arg1.controller or f4_local1 )
	end )
	if CONDITIONS.IsAliensOnline( self ) then
		f4_local4:addEventHandler( "button_action", function ( f6_arg0, f6_arg1 )
			ACTIONS.OpenMenu( "LeaderboardSelectMenu", true, f6_arg1.controller or f4_local1 )
		end )
	end
	Tips:addEventHandler( "button_action", function ( f7_arg0, f7_arg1 )
		ACTIONS.OpenMenu( "TutorialMenu", true, f7_arg1.controller or f4_local1 )
	end )
	if DataSources.frontEnd.CP.songs.hasAnySongUnlocked:GetValue( f4_local1 ) ~= nil and DataSources.frontEnd.CP.songs.hasAnySongUnlocked:GetValue( f4_local1 ) == 1 then
		f4_local7:addEventHandler( "button_action", function ( f8_arg0, f8_arg1 )
			ACTIONS.OpenMenu( "CPLobbyMusicMenu", true, f8_arg1.controller or f4_local1 )
		end )
	end
	f0_local0( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "CPBarracksButtons", CPBarracksButtons )
LockTable( _M )
