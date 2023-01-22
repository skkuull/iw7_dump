local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "frontEnd.cp.CPPrivateMatchButtons"
f0_local1 = function ( f1_arg0, f1_arg1 )
	LUI.UIRoot.BlockButtonInput( Engine.GetLuiRoot(), false, "TransitionToGame" )
	Engine.Exec( "xpartygo" )
end

f0_local2 = function ( f2_arg0, f2_arg1 )
	if Lobby.UsingReadyUpFeature() then
		if not Lobby.GetLocalReadyUpFlag() then
			Lobby.SetLocalReadyUpFlag()
			f2_arg0:dispatchEventToRoot( {
				name = "refresh_ready_up"
			} )
			return 
		elseif not Lobby.GetPartyReadyUpStatus() then
			return 
		end
	end
	if not Engine.IsAliensMode() and Lobby.GetBotsConnectType() == 0 then
		Lobby.SetBotsConnectType( 1 )
	end
	local f2_local0 = LUI.FlowManager.GetScopedData( f2_arg0 )
	f2_local0.startingController = f2_arg1.controller
	local f2_local1 = utils.cp.AliensUtils.LobbyGetIntroVideo()
	if Lobby.AreAllUsersLocal() and f2_local1 and f2_local1 ~= "" and not Engine.GetDvarBool( "scr_boss_battles_enabled" ) then
		utils.cp.AliensUtils.AliensPlayIntroVideo( f2_arg1.controller, f2_local1, {
			name = "start_transition_to_game",
			immediate = true,
			skipCountdown = true
		} )
	else
		f2_arg0:dispatchEventToRoot( {
			name = "start_transition_to_game",
			immediate = true,
			skipCountdown = false
		} )
	end
end

function StartTheGameHandler( f3_arg0, f3_arg1 )
	local f3_local0 = Engine.GetLuiRoot()
	local f3_local1 = LUI.FlowManager.GetScopedData( f3_arg0 )
	LUI.UIRoot.BlockButtonInput( f3_local0, false, "TransitionToGame" )
	if f3_arg1.skipCountdown then
		Engine.Exec( "xpartygo 1" )
	else
		Engine.Exec( "xpartygo 0" )
	end
end

local f0_local3 = function ( f4_arg0, f4_arg1, f4_arg2 )
	assert( f4_arg0.StartMatch )
	assert( f4_arg0.ChooseMap )
	assert( f4_arg0.Loadout )
	assert( f4_arg0.Barracks )
	local f4_local0 = LUI.DataSourceInGlobalModel.new( "frontEnd.lobby.areWeGameHost" )
	local f4_local1 = LUI.DataSourceInGlobalModel.new( "frontEnd.lobby.everyoneHasMap" )
	local f4_local2 = LUI.DataSourceInGlobalModel.new( "frontEnd.lobby.partyClientsUpToDate" )
	local f4_local3 = LUI.DataSourceInGlobalModel.new( "frontEnd.lobby.isHostWaitingOnMembers" )
	local f4_local4 = LUI.DataSourceInGlobalModel.new( "frontEnd.lobby.isGameStartRequested" )
	local f4_local5 = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".disableStartMatchButton" )
	local f4_local6 = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".disableMapSelectButton" )
	local f4_local7 = function ( f5_arg0 )
		local f5_local0 = f4_local4:GetValue( f5_arg0 )
		local f5_local1 = f4_local0:GetValue( f5_arg0 )
		if f5_local0 then
			f4_arg0.StartMatch.Text:setText( Engine.Localize( "LUA_MENU_STARTING_GAME_CAPS" ) )
		elseif f5_local1 then
			f4_arg0.StartMatch.Text:setText( Engine.Localize( "LUA_MENU_START_GAME_CAPS" ) )
		else
			f4_arg0.StartMatch.Text:setText( Engine.Localize( "LUA_MENU_WAITING_FOR_HOST_CAPS" ) )
		end
	end
	
	f4_arg0:SubscribeToModel( f4_local0:GetModel( f4_arg1 ), f4_local7 )
	f4_arg0:SubscribeToModel( f4_local4:GetModel( f4_arg1 ), f4_local7 )
	local f4_local8 = LUI.AggregateDataSource.new( f4_local5, {
		f4_local0,
		f4_local1,
		f4_local2,
		f4_local3,
		f4_local4
	}, "disabled", function ( f6_arg0 )
		local f6_local0 = f4_local0:GetValue( f6_arg0 )
		local f6_local1 = f4_local1:GetValue( f6_arg0 )
		local f6_local2 = f4_local2:GetValue( f6_arg0 )
		local f6_local3 = f4_local3:GetValue( f6_arg0 )
		local f6_local4 = f4_local4:GetValue( f6_arg0 )
		if not isAliensSolo() then
			local f6_local5
			if f6_local0 and f6_local1 and f6_local2 then
				local f6_local6 = f6_local3
				f6_local5 = f6_local4
			else
				f6_local5 = f6_local6 or true
			end
			return f6_local5
		else
			local f6_local5
			if f6_local0 and f6_local1 and f6_local2 then
				f6_local5 = f6_local4
			else
				f6_local5 = true
			end
		end
		return f6_local5
	end )
	f4_arg0:SubscribeToModel( f4_local8:GetModel( f4_arg1 ), function ()
		f4_arg0.StartMatch:SetButtonDisabled( f4_local8:GetValue( f4_arg1 ) )
	end )
	local f4_local9 = function ()
		local f8_local0 = f4_local8:GetValue( f4_arg1 )
		local f8_local1 = Engine.Localize( "LUA_MENU_DESC_START_MATCH" )
		if f8_local0 and f4_local1:GetValue( f4_arg1 ) == false then
			local f8_local2 = Engine.Localize( "PRESENCE_" .. Engine.GetDvarString( "ui_mapname" ) )
			local f8_local3 = Engine.PartyGetFirstPlayerWithoutMap()
			if f8_local3 ~= "" then
				f8_local1 = Engine.Localize( "DLC_PLAYER_DOESNT_HAVE_MAP_PACK", f8_local3, f8_local2 )
			end
		end
		f4_arg0.StartMatch.buttonDescription = f8_local1
		f4_arg0.ButtonDescription:processEvent( {
			name = "update_button_description",
			text = f8_local1
		} )
	end
	
	f4_arg0:SubscribeToModel( f4_local8:GetModel( f4_arg1 ), f4_local9 )
	f4_arg0:SubscribeToModel( f4_local1:GetModel( f4_arg1 ), f4_local9 )
	f4_arg0.StartMatch:addEventHandler( "button_action", f0_local2 )
	f4_arg0:addEventHandler( "start_transition_to_game", StartTheGameHandler )
	if f4_arg0.ChooseMap or f4_arg0.BossBattle then
		local f4_local10 = LUI.AggregateDataSource.new( f4_local6, {
			f4_local0,
			f4_local4
		}, "disabled", function ( f9_arg0 )
			local f9_local0 = f4_local0:GetValue( f9_arg0 )
			local f9_local1 = f4_local4:GetValue( f9_arg0 )
			local f9_local2
			if f9_local0 then
				f9_local2 = f9_local1
			else
				f9_local2 = true
			end
			return f9_local2
		end )
		f4_arg0:SubscribeToModel( f4_local10:GetModel( f4_arg1 ), function ()
			f4_arg0.ChooseMap:SetButtonDisabled( f4_local10:GetValue( f4_arg1 ) )
			if CONDITIONS.IsBossBattleOn() then
				f4_arg0.BossBattle:SetButtonDisabled( f4_local10:GetValue( f4_arg1 ) )
			end
		end )
		f4_arg0.ChooseMap:addEventHandler( "button_action", function ( f11_arg0, f11_arg1 )
			LUI.FlowManager.RequestAddMenu( "CPMaps", true, f11_arg1.controller )
		end )
		if CONDITIONS.IsBossBattleOn() then
			f4_arg0.BossBattle:addEventHandler( "button_action", function ( f12_arg0, f12_arg1 )
				LUI.FlowManager.RequestAddMenu( "CPMapsBoss", true, f12_arg1.controller )
			end )
		end
	end
	f4_arg0.Loadout:addEventHandler( "button_action", function ( f13_arg0, f13_arg1 )
		LUI.FlowManager.RequestAddMenu( "CPLoadoutMenu", true, f13_arg1.controller )
	end )
	f4_arg0.Armory:addEventHandler( "button_action", function ( f14_arg0, f14_arg1 )
		if not Engine.IsUserAGuest( f14_arg1.controller ) then
			ACTIONS.OpenMenu( "Armory", true, f14_arg1.controller )
		end
	end )
	f4_arg0.Barracks:addEventHandler( "button_action", function ( f15_arg0, f15_arg1 )
		LUI.FlowManager.RequestAddMenu( "Headquarters", true, f15_arg1.controller )
	end )
	f4_arg0.ContractsButton:addEventHandler( "button_action", function ( f16_arg0, f16_arg1 )
		ACTIONS.OpenMenu( "ContractMenu", true, f16_arg1.controller or f4_arg1 )
	end )
	f4_arg0.widgetModelPath = f0_local0
end

function CPPrivateMatchButtons( menu, controller )
	local self = LUI.UIVerticalNavigator.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 500 * _1080p, 0, 400 * _1080p )
	self.id = "CPPrivateMatchButtons"
	self._animationSets = {}
	self._sequences = {}
	local f17_local1 = controller and controller.controllerIndex
	if not f17_local1 and not Engine.InFrontend() then
		f17_local1 = self:getRootController()
	end
	assert( f17_local1 )
	local f17_local2 = self
	local StartMatch = nil
	
	StartMatch = MenuBuilder.BuildRegisteredType( "MenuButton", {
		controllerIndex = f17_local1
	} )
	StartMatch.id = "StartMatch"
	StartMatch.buttonDescription = Engine.Localize( "LUA_MENU_DESC_START_MATCH" )
	StartMatch.Text:setText( Engine.Localize( "LUA_MENU_START_GAME_CAPS" ), 0 )
	StartMatch:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 340, 0, _1080p * 30 )
	self:addElement( StartMatch )
	self.StartMatch = StartMatch
	
	local Loadout = nil
	
	Loadout = MenuBuilder.BuildRegisteredType( "MenuButton", {
		controllerIndex = f17_local1
	} )
	Loadout.id = "Loadout"
	Loadout.buttonDescription = Engine.Localize( "LUA_MENU_ZM_LOADOUT_DESC" )
	Loadout.Text:setText( Engine.Localize( "LUA_MENU_ZM_LOADOUT_CAPS" ), 0 )
	Loadout:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 340, _1080p * 40, _1080p * 70 )
	self:addElement( Loadout )
	self.Loadout = Loadout
	
	local Barracks = nil
	
	Barracks = MenuBuilder.BuildRegisteredType( "MenuButton", {
		controllerIndex = f17_local1
	} )
	Barracks.id = "Barracks"
	Barracks.buttonDescription = Engine.Localize( "LUA_MENU_DESC_BARRACKS_ZOM" )
	Barracks.Text:setText( Engine.Localize( "LUA_MENU_BARRACKS_CAPS" ), 0 )
	Barracks:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 340, _1080p * 80, _1080p * 110 )
	self:addElement( Barracks )
	self.Barracks = Barracks
	
	local ChooseMap = nil
	
	ChooseMap = MenuBuilder.BuildRegisteredType( "MenuButton", {
		controllerIndex = f17_local1
	} )
	ChooseMap.id = "ChooseMap"
	ChooseMap.buttonDescription = Engine.Localize( "MENU_DESC_CHANGE_MAP" )
	ChooseMap.Text:setText( Engine.Localize( "LUA_MENU_ZM_SELECT_SHOW_CAPS" ), 0 )
	ChooseMap:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 340, _1080p * 120, _1080p * 150 )
	self:addElement( ChooseMap )
	self.ChooseMap = ChooseMap
	
	local f17_local7 = nil
	if CONDITIONS.IsBossBattleOn( self ) then
		f17_local7 = MenuBuilder.BuildRegisteredType( "MenuButton", {
			controllerIndex = f17_local1
		} )
		f17_local7.id = "BossBattle"
		if CONDITIONS.IsBossBattleOn( self ) then
			
		else
			
		end
		if CONDITIONS.IsBossBattleOn( self ) then
			f17_local7.buttonDescription = Engine.Localize( "LUA_MENU_ZM_BOSS_BATTLE_DESC" )
		end
		f17_local7.Text:setText( ToUpperCase( Engine.Localize( "LUA_MENU_ZM_BOSS_BATTLE" ) ), 0 )
		f17_local7:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 340, _1080p * 160, _1080p * 190 )
		self:addElement( f17_local7 )
		self.BossBattle = f17_local7
	end
	local Tips = nil
	
	Tips = MenuBuilder.BuildRegisteredType( "MenuButton", {
		controllerIndex = f17_local1
	} )
	Tips.id = "Tips"
	Tips.buttonDescription = Engine.Localize( "LUA_MENU_ZOMBIES_TUTORIAL_DESC" )
	Tips.Text:setText( ToUpperCase( Engine.Localize( "LUA_MENU_ZOMBIES_TUTORIAL" ) ), 0 )
	Tips:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 340, _1080p * 200, _1080p * 230 )
	self:addElement( Tips )
	self.Tips = Tips
	
	local Armory = nil
	
	Armory = MenuBuilder.BuildRegisteredType( "MenuButton", {
		controllerIndex = f17_local1
	} )
	Armory.id = "Armory"
	Armory.buttonDescription = Engine.Localize( "LUA_MENU_ZM_SURVIVAL_DEPOT_DESC" )
	Armory.Text:setText( ToUpperCase( Engine.Localize( "LUA_MENU_ZM_SURVIVAL_DEPOT" ) ), 0 )
	Armory:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 340, _1080p * 240, _1080p * 270 )
	self:addElement( Armory )
	self.Armory = Armory
	
	local ForSpacing = nil
	
	ForSpacing = LUI.UIImage.new()
	ForSpacing.id = "ForSpacing"
	ForSpacing:SetAlpha( 0, 0 )
	ForSpacing:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 5, _1080p * 280, _1080p * 285 )
	self:addElement( ForSpacing )
	self.ForSpacing = ForSpacing
	
	local ButtonDescription = nil
	
	ButtonDescription = MenuBuilder.BuildRegisteredType( "ButtonDescriptionText", {
		controllerIndex = f17_local1
	} )
	ButtonDescription.id = "ButtonDescription"
	ButtonDescription:SetRGBFromTable( SWATCHES.genericButton.textDisabled, 0 )
	ButtonDescription.Description:SetRight( _1080p * 415, 0 )
	ButtonDescription:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 504, _1080p * 350, _1080p * 415 )
	self:addElement( ButtonDescription )
	self.ButtonDescription = ButtonDescription
	
	local ContractsButton = nil
	
	ContractsButton = MenuBuilder.BuildRegisteredType( "ContractsButtonCP", {
		controllerIndex = f17_local1
	} )
	ContractsButton.id = "ContractsButton"
	ContractsButton:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 340, _1080p * 280, _1080p * 340 )
	self:addElement( ContractsButton )
	self.ContractsButton = ContractsButton
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Tips:RegisterAnimationSequence( "bossBattleOff", {
			{
				function ()
					return self.Tips:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 340, _1080p * 160, _1080p * 190, 0 )
				end
			}
		} )
		Armory:RegisterAnimationSequence( "bossBattleOff", {
			{
				function ()
					return self.Armory:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 340, _1080p * 200, _1080p * 230, 0 )
				end
			}
		} )
		ForSpacing:RegisterAnimationSequence( "bossBattleOff", {
			{
				function ()
					return self.ForSpacing:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 5, _1080p * 240, _1080p * 245, 0 )
				end
			}
		} )
		ButtonDescription:RegisterAnimationSequence( "bossBattleOff", {
			{
				function ()
					return self.ButtonDescription:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 504, _1080p * 310, _1080p * 375, 0 )
				end
			}
		} )
		ContractsButton:RegisterAnimationSequence( "bossBattleOff", {
			{
				function ()
					return self.ContractsButton:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 340, _1080p * 240, _1080p * 300, 0 )
				end
			}
		} )
		self._sequences.bossBattleOff = function ()
			Tips:AnimateSequence( "bossBattleOff" )
			Armory:AnimateSequence( "bossBattleOff" )
			ForSpacing:AnimateSequence( "bossBattleOff" )
			ButtonDescription:AnimateSequence( "bossBattleOff" )
			ContractsButton:AnimateSequence( "bossBattleOff" )
		end
		
		if CONDITIONS.IsBossBattleOn( self ) then
			f17_local7:RegisterAnimationSequence( "bossBattleOn", {
				{
					function ()
						return self.BossBattle:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 340, _1080p * 160, _1080p * 190, 0 )
					end
				}
			} )
		end
		Tips:RegisterAnimationSequence( "bossBattleOn", {
			{
				function ()
					return self.Tips:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 340, _1080p * 200, _1080p * 230, 0 )
				end
			}
		} )
		Armory:RegisterAnimationSequence( "bossBattleOn", {
			{
				function ()
					return self.Armory:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 340, _1080p * 240, _1080p * 270, 0 )
				end
			}
		} )
		ButtonDescription:RegisterAnimationSequence( "bossBattleOn", {
			{
				function ()
					return self.ButtonDescription:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 504, _1080p * 350, _1080p * 415, 0 )
				end
			}
		} )
		ContractsButton:RegisterAnimationSequence( "bossBattleOn", {
			{
				function ()
					return self.ContractsButton:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 340, _1080p * 280, _1080p * 340, 0 )
				end
			}
		} )
		self._sequences.bossBattleOn = function ()
			if CONDITIONS.IsBossBattleOn( self ) then
				f17_local7:AnimateSequence( "bossBattleOn" )
			end
			Tips:AnimateSequence( "bossBattleOn" )
			Armory:AnimateSequence( "bossBattleOn" )
			ButtonDescription:AnimateSequence( "bossBattleOn" )
			ContractsButton:AnimateSequence( "bossBattleOn" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	Tips:addEventHandler( "button_action", function ( f32_arg0, f32_arg1 )
		ACTIONS.OpenMenu( "TutorialMenu", true, f32_arg1.controller or f17_local1 )
	end )
	f0_local3( self, f17_local1, controller )
	if CONDITIONS.IsBossBattleOn( self ) then
		ACTIONS.AnimateSequence( self, "bossBattleOn" )
	end
	if not CONDITIONS.IsBossBattleOn( self ) then
		ACTIONS.AnimateSequence( self, "bossBattleOff" )
	end
	return self
end

MenuBuilder.registerType( "CPPrivateMatchButtons", CPPrivateMatchButtons )
LockTable( _M )
