local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = {
		[Lobby.BotTeams.FFA] = f1_arg0.FFABots,
		[Lobby.BotTeams.Enemy] = f1_arg0.EnemyBots,
		[Lobby.BotTeams.Friendly] = f1_arg0.FriendlyBots
	}
	local f1_local1 = function ( f2_arg0, f2_arg1 )
		local f2_local0 = {}
		local f2_local1 = GetMaxBotLimit()
		if f2_arg1 and f2_local1 > 0 then
			f2_local1 = math.floor( f2_local1 / 2 )
			if f2_arg0 == Lobby.BotTeams.Enemy then
				f2_local1 = f2_local1 + 1
			end
		end
		for f2_local2 = 0, f2_local1, 1 do
			table.insert( f2_local0, tostring( f2_local2 ) )
		end
		local f2_local2 = 1 + Lobby.GetBotsTeamLimit( f2_arg0 )
		if #f2_local0 < f2_local2 then
			Lobby.SetBotsTeamLimit( f2_arg0, #f2_local0 - 1 )
			f2_local2 = #f2_local0
		end
		if not f2_arg1 then
			local f2_local3 = GetMaxBotLimit()
			if f2_local3 < f2_local2 then
				f2_local2 = f2_local3 + 1
			end
		end
		return {
			labels = f2_local0,
			action = function ( f3_arg0 )
				Lobby.SetBotsTeamLimit( f2_arg0, f3_arg0 - 1 )
				if f2_arg1 and Lobby.GetBotsTeamLimit( f2_arg0 ) + Lobby.GetBotsTeamLimit( f2_arg1 ) > GetMaxBotLimit() then
					f1_local0[f2_arg1]:SetCurrentValue( Lobby.GetBotsTeamLimit( f2_arg1 ) - 1 + 1 )
				end
			end
			,
			defaultValue = f2_local2,
			wrapAround = true
		}
	end
	
	local f1_local2 = function ( f4_arg0 )
		local f4_local0 = {}
		local f4_local1 = Engine.Localize( "LUA_MENU_BOTS_RECRUIT" )
		local f4_local2 = Engine.Localize( "LUA_MENU_BOTS_REGULAR" )
		local f4_local3 = Engine.Localize( "LUA_MENU_BOTS_HARDENED" )
		local f4_local4 = Engine.Localize( "LUA_MENU_BOTS_VETERAN" )
		local f4_local5 = Engine.Localize( "LUA_MENU_BOTS_MIXED" )
		return {
			labels = f4_local1,
			action = function ( f5_arg0 )
				Lobby.SetBotsDifficulty( f4_arg0, f5_arg0 - 1 )
			end
			,
			defaultValue = 1 + Lobby.GetBotsDifficulty( f4_arg0 ),
			wrapAround = true
		}
	end
	
	if f1_arg0.FriendlyBots and f1_arg0.FriendlyBotsDifficulty and f1_arg0.EnemyBots and f1_arg0.EnemyBotsDifficulty then
		LUI.AddUIArrowTextButtonLogic( f1_arg0.FriendlyBots, f1_arg1, f1_local1( Lobby.BotTeams.Friendly, Lobby.BotTeams.Enemy ) )
		LUI.AddUIArrowTextButtonLogic( f1_arg0.EnemyBots, f1_arg1, f1_local1( Lobby.BotTeams.Enemy, Lobby.BotTeams.Friendly ) )
		LUI.AddUIArrowTextButtonLogic( f1_arg0.FriendlyBotsDifficulty, f1_arg1, f1_local2( Lobby.BotTeams.Friendly ) )
		LUI.AddUIArrowTextButtonLogic( f1_arg0.EnemyBotsDifficulty, f1_arg1, f1_local2( Lobby.BotTeams.Enemy ) )
	end
	if f1_arg0.FFABots and f1_arg0.FFABotsDifficulty then
		LUI.AddUIArrowTextButtonLogic( f1_arg0.FFABots, f1_arg1, f1_local1( Lobby.BotTeams.FFA ) )
		LUI.AddUIArrowTextButtonLogic( f1_arg0.FFABotsDifficulty, f1_arg1, f1_local2( Lobby.BotTeams.FFA ) )
	end
	local f1_local3 = LUI.DataSourceInGlobalModel.new( "frontEnd.lobby.areWeGameHost" )
	f1_arg0:SubscribeToModel( f1_local3:GetModel( f1_arg1 ), function ( f6_arg0 )
		local f6_local0 = DataModel.GetModelValue( f6_arg0 )
		local f6_local1 = IsSystemLink()
		if f1_arg0.FriendlyBots and f1_arg0.FriendlyBotsDifficulty then
			local f6_local2 = f1_arg0.FriendlyBots
			local f6_local3 = f6_local2
			f6_local2 = f6_local2.SetButtonDisabled
			local f6_local4
			if not f6_local0 then
				f6_local4 = not f6_local1
			else
				f6_local4 = false
			end
			f6_local2( f6_local3, f6_local4 )
			f6_local2 = f1_arg0.FriendlyBotsDifficulty
			f6_local3 = f6_local2
			f6_local2 = f6_local2.SetButtonDisabled
			if not f6_local0 then
				f6_local4 = not f6_local1
			else
				f6_local4 = false
			end
			f6_local2( f6_local3, f6_local4 )
		end
		if f1_arg0.EnemyBots and f1_arg0.EnemyBotsDifficulty then
			local f6_local2 = f1_arg0.EnemyBots
			local f6_local3 = f6_local2
			f6_local2 = f6_local2.SetButtonDisabled
			local f6_local4
			if not f6_local0 then
				f6_local4 = not f6_local1
			else
				f6_local4 = false
			end
			f6_local2( f6_local3, f6_local4 )
			f6_local2 = f1_arg0.EnemyBotsDifficulty
			f6_local3 = f6_local2
			f6_local2 = f6_local2.SetButtonDisabled
			if not f6_local0 then
				f6_local4 = not f6_local1
			else
				f6_local4 = false
			end
			f6_local2( f6_local3, f6_local4 )
		end
		if f1_arg0.FFABots and f1_arg0.FFABotsDifficulty then
			local f6_local2 = f1_arg0.FFABots
			local f6_local3 = f6_local2
			f6_local2 = f6_local2.SetButtonDisabled
			local f6_local4
			if not f6_local0 then
				f6_local4 = not f6_local1
			else
				f6_local4 = false
			end
			f6_local2( f6_local3, f6_local4 )
			f6_local2 = f1_arg0.FFABotsDifficulty
			f6_local3 = f6_local2
			f6_local2 = f6_local2.SetButtonDisabled
			if not f6_local0 then
				f6_local4 = not f6_local1
			else
				f6_local4 = false
			end
			f6_local2( f6_local3, f6_local4 )
		end
	end )
end

function GameSetupButtonsBots( menu, controller )
	local self = LUI.UIVerticalList.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 600 * _1080p, 0, 280 * _1080p )
	self.id = "GameSetupButtonsBots"
	local f7_local1 = controller and controller.controllerIndex
	if not f7_local1 and not Engine.InFrontend() then
		f7_local1 = self:getRootController()
	end
	assert( f7_local1 )
	local f7_local2 = self
	self:SetSpacing( 10 * _1080p )
	local f7_local3 = nil
	if CONDITIONS.IsTeamBasedGameType( self ) then
		f7_local3 = MenuBuilder.BuildRegisteredType( "GenericArrowButton", {
			controllerIndex = f7_local1
		} )
		f7_local3.id = "FriendlyBots"
		if CONDITIONS.IsTeamBasedGameType( self ) then
			f7_local3.buttonDescription = Engine.Localize( "LUA_MENU_FRIENDLY_BOTS_DESC" )
		end
		f7_local3.Title:setText( ToUpperCase( Engine.Localize( "LUA_MENU_FRIENDLY_BOTS_CAPS" ) ), 0 )
		f7_local3.Text:setText( ToUpperCase( "" ), 0 )
		f7_local3:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 600, 0, _1080p * 30 )
		self:addElement( f7_local3 )
		self.FriendlyBots = f7_local3
	end
	local f7_local4 = nil
	if CONDITIONS.IsTeamBasedGameType( self ) then
		f7_local4 = MenuBuilder.BuildRegisteredType( "GenericArrowButton", {
			controllerIndex = f7_local1
		} )
		f7_local4.id = "FriendlyBotsDifficulty"
		if CONDITIONS.IsTeamBasedGameType( self ) then
			f7_local4.buttonDescription = Engine.Localize( "LUA_MENU_FRIENDLY_BOTDIFFICULTY_DESC" )
		end
		f7_local4.Title:setText( ToUpperCase( Engine.Localize( "LUA_MENU_BOTDIFFICULTY_CAPS" ) ), 0 )
		f7_local4.Text:setText( ToUpperCase( "" ), 0 )
		f7_local4:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 600, _1080p * 40, _1080p * 70 )
		self:addElement( f7_local4 )
		self.FriendlyBotsDifficulty = f7_local4
	end
	local f7_local5 = nil
	if CONDITIONS.IsTeamBasedGameType( self ) then
		f7_local5 = LUI.UIImage.new()
		f7_local5.id = "SpacerImage"
		f7_local5:SetAlpha( 0, 0 )
		f7_local5:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 600, _1080p * 80, _1080p * 90 )
		self:addElement( f7_local5 )
		self.SpacerImage = f7_local5
	end
	local f7_local6 = nil
	if CONDITIONS.IsTeamBasedGameType( self ) then
		f7_local6 = MenuBuilder.BuildRegisteredType( "GenericArrowButton", {
			controllerIndex = f7_local1
		} )
		f7_local6.id = "EnemyBots"
		if CONDITIONS.IsTeamBasedGameType( self ) then
			f7_local6.buttonDescription = Engine.Localize( "LUA_MENU_ENEMY_BOTS_DESC" )
		end
		f7_local6.Title:setText( ToUpperCase( Engine.Localize( "LUA_MENU_ENEMY_BOTS_CAPS" ) ), 0 )
		f7_local6.Text:setText( ToUpperCase( "" ), 0 )
		f7_local6:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 600, _1080p * 100, _1080p * 130 )
		self:addElement( f7_local6 )
		self.EnemyBots = f7_local6
	end
	local f7_local7 = nil
	if CONDITIONS.IsTeamBasedGameType( self ) then
		f7_local7 = MenuBuilder.BuildRegisteredType( "GenericArrowButton", {
			controllerIndex = f7_local1
		} )
		f7_local7.id = "EnemyBotsDifficulty"
		if CONDITIONS.IsTeamBasedGameType( self ) then
			f7_local7.buttonDescription = Engine.Localize( "LUA_MENU_ENEMY_BOTDIFFICULTY_DESC" )
		end
		f7_local7.Title:setText( ToUpperCase( Engine.Localize( "LUA_MENU_BOTDIFFICULTY_CAPS" ) ), 0 )
		f7_local7.Text:setText( ToUpperCase( "" ), 0 )
		f7_local7:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 600, _1080p * 140, _1080p * 170 )
		self:addElement( f7_local7 )
		self.EnemyBotsDifficulty = f7_local7
	end
	local f7_local8 = nil
	if not CONDITIONS.IsTeamBasedGameType( self ) then
		f7_local8 = MenuBuilder.BuildRegisteredType( "GenericArrowButton", {
			controllerIndex = f7_local1
		} )
		f7_local8.id = "FFABots"
		if not CONDITIONS.IsTeamBasedGameType( self ) then
			f7_local8.buttonDescription = Engine.Localize( "LUA_MENU_BOTS_DESC" )
		end
		f7_local8.Title:setText( ToUpperCase( Engine.Localize( "LUA_MENU_BOTS_CAPS" ) ), 0 )
		f7_local8.Text:setText( ToUpperCase( "" ), 0 )
		f7_local8:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 600, _1080p * 180, _1080p * 210 )
		self:addElement( f7_local8 )
		self.FFABots = f7_local8
	end
	local f7_local9 = nil
	if not CONDITIONS.IsTeamBasedGameType( self ) then
		f7_local9 = MenuBuilder.BuildRegisteredType( "GenericArrowButton", {
			controllerIndex = f7_local1
		} )
		f7_local9.id = "FFABotsDifficulty"
		if not CONDITIONS.IsTeamBasedGameType( self ) then
			f7_local9.buttonDescription = Engine.Localize( "LUA_MENU_BOTDIFFICULTY_DESC" )
		end
		f7_local9.Title:setText( ToUpperCase( Engine.Localize( "LUA_MENU_BOTDIFFICULTY_CAPS" ) ), 0 )
		f7_local9.Text:setText( ToUpperCase( "" ), 0 )
		f7_local9:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 600, _1080p * 220, _1080p * 250 )
		self:addElement( f7_local9 )
		self.FFABotsDifficulty = f7_local9
	end
	local ButtonDescriptionText = nil
	
	ButtonDescriptionText = MenuBuilder.BuildRegisteredType( "ButtonDescriptionText", {
		controllerIndex = f7_local1
	} )
	ButtonDescriptionText.id = "ButtonDescriptionText"
	ButtonDescriptionText:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 420, _1080p * 260, _1080p * 292 )
	self:addElement( ButtonDescriptionText )
	self.ButtonDescriptionText = ButtonDescriptionText
	
	f0_local0( self, f7_local1, controller )
	return self
end

MenuBuilder.registerType( "GameSetupButtonsBots", GameSetupButtonsBots )
LockTable( _M )
