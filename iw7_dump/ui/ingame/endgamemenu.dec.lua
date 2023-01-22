local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
f0_local0 = function ( f1_arg0, f1_arg1 )
	LUI.FlowManager.RequestLeaveMenu( f1_arg0 )
end

f0_local1 = function ( f2_arg0, f2_arg1 )
	f2_arg0:setText( f2_arg1.message_text )
	f2_arg0:dispatchEventToRoot( {
		name = "resize_popup"
	} )
end

f0_local2 = function ( f3_arg0 )
	Engine.ExecFirstClient( "xpartybackout" )
	Engine.ExecFirstClient( "disconnect" )
end

local f0_local3 = function ( f4_arg0 )
	Engine.ExecFirstClient( "xpartydisbandafterround" )
	Engine.ExecFirstClient( "hostmigration_start_backout" )
end

local f0_local4 = function ( f5_arg0 )
	Engine.ExecFirstClient( "xstopprivateparty" )
	Engine.ExecFirstClient( "disconnect" )
end

local f0_local5 = function ( f6_arg0 )
	Engine.ExecFirstClient( "xstopprivateparty" )
	Engine.ExecFirstClient( "xpartydisbandafterround" )
	Engine.ExecFirstClient( "hostmigration_start" )
end

local f0_local6 = function ( f7_arg0, f7_arg1 )
	if Engine.GetDvarBool( "sv_running" ) then
		if Engine.IsAliensMode() then
			Engine.Unpause()
			if Engine.IsAliensMode() and not IsSystemLink() then
				for f7_local0 = 0, Engine.GetMaxControllerCount() - 1, 1 do
					if Engine.HasActiveLocalClient( f7_local0 ) then
						Loot.ConsumeAll( f7_local0 )
					end
				end
			end
		end
		Engine.NotifyServer( "end_game", 1 )
		Engine.ExecNow( "set endgame_called 1" )
	else
		if Engine.IsAliensMode() and not IsSystemLink() then
			for f7_local0 = 0, Engine.GetMaxControllerCount() - 1, 1 do
				if Engine.HasActiveLocalClient( f7_local0 ) then
					Loot.ConsumeAll( f7_local0 )
				end
			end
		end
		f0_local4( f7_arg0 )
	end
	LUI.FlowManager.RequestCloseAllMenus()
end

local f0_local7 = function ( f8_arg0, f8_arg1 )
	LUI.FlowManager.RequestLeaveMenu( f8_arg0 )
	Engine.Exec( "onPlayerQuit" )
	if Engine.GetDvarBool( "sv_running" ) then
		f0_local3( f8_arg0 )
	else
		f0_local2( f8_arg0 )
	end
	LUI.FlowManager.RequestCloseAllMenus()
end

local f0_local8 = function ( f9_arg0, f9_arg1 )
	LUI.FlowManager.RequestLeaveMenu( f9_arg0 )
	Engine.Exec( "onPlayerQuit" )
	if Engine.GetDvarBool( "sv_running" ) then
		f0_local5( f9_arg0 )
	else
		f0_local4( f9_arg0 )
	end
	LUI.FlowManager.RequestCloseAllMenus()
end

local f0_local9 = function ( f10_arg0 )
	local f10_local0 = Lobby.IsInPrivateParty()
	if f10_local0 then
		f10_local0 = Lobby.IsPrivatePartyHost()
		if f10_local0 then
			f10_local0 = not Lobby.IsAloneInPrivateParty()
		end
	end
	return f10_local0
end

local f0_local10 = function ( f11_arg0, f11_arg1 )
	if Engine.IsAliensMode() and not IsSystemLink() then
		for f11_local0 = 0, Engine.GetMaxControllerCount() - 1, 1 do
			if Engine.HasActiveLocalClient( f11_local0 ) then
				Loot.ConsumeAll( f11_local0 )
			end
		end
	end
	if f0_local9( f11_arg0 ) then
		LUI.FlowManager.RequestLeaveMenu( f11_arg0, true )
		LUI.FlowManager.RequestPopupMenu( f11_arg0, "PullPartyPopup", false )
	else
		Engine.Exec( "onPlayerQuit" )
		if Engine.GetDvarBool( "sv_running" ) then
			f0_local5( f11_arg0 )
		else
			f0_local4( f11_arg0 )
		end
		LUI.FlowManager.RequestCloseAllMenus()
	end
end

local f0_local11 = function ()
	local self = LUI.UIElement.new()
	self.id = "end_game_id"
	self:registerAnimationState( "default", {
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = true,
		rightAnchor = true,
		top = -50,
		left = 0,
		bottom = 0,
		right = 0,
		alpha = 1
	} )
	self:animateToState( "default", 0 )
	local f12_local1 = Engine.Localize( "@LUA_MENU_END_GAME_DESC" )
	local f12_local2 = Engine.Localize( "@LUA_MENU_LEAVE_GAME_TITLE" )
	if Engine.IsAliensMode() and Game.GetOmnvar( "zm_ui_is_solo" ) then
		f12_local1 = Engine.Localize( "@CP_ZMB_LEAVE_GAME_DESC" )
		f12_local2 = Engine.Localize( "@MENU_NOTICE" )
	end
	MenuBuilder.BuildAddChild( self, {
		type = "generic_yesno_popup",
		id = "privateGame_options_list_id",
		properties = {
			message_text_alignment = LUI.Alignment.Center,
			message_text = f12_local1,
			popup_title = f12_local2,
			padding_top = 12,
			yes_action = f0_local6
		}
	} )
	local f12_local3 = LUI.UIBindButton.new()
	f12_local3.id = "endBackToGameStartButton"
	f12_local3:registerEventHandler( "button_start", f0_local0 )
	self:addElement( f12_local3 )
	return self
end

local f0_local12 = function ()
	local self = LUI.UIElement.new()
	self.id = "leave_game_id"
	self:registerAnimationState( "default", {
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = true,
		rightAnchor = true,
		top = -50,
		left = 0,
		bottom = 0,
		right = 0,
		alpha = 1
	} )
	self:animateToState( "default", 0 )
	MenuBuilder.BuildAddChild( self, {
		type = "generic_yesno_popup",
		id = "publicGame_options_list_id",
		properties = {
			message_text_alignment = LUI.Alignment.Center,
			message_text = Engine.IsAliensMode() and Engine.Localize( "@CP_ZMB_LEAVE_GAME_DESC" ) or Engine.Localize( "@LUA_MENU_LEAVE_GAME_DESC" ),
			popup_title = Engine.IsAliensMode() and Engine.Localize( "@MENU_NOTICE" ) or Engine.Localize( "@LUA_MENU_LEAVE_GAME_TITLE" ),
			padding_top = 12,
			yes_action = f0_local10
		}
	} )
	local f13_local1 = LUI.UIBindButton.new()
	f13_local1.id = "leaveBackToGameStartButton"
	f13_local1:registerEventHandler( "button_start", f0_local0 )
	self:addElement( f13_local1 )
	return self
end

local f0_local13 = function ( f14_arg0, f14_arg1 )
	local f14_local0 = MenuBuilder.BuildRegisteredType( "PopupMessageAndButtons", {
		title = Engine.Localize( "LUA_MENU_LEAVE_GAME_TITLE" ),
		message = Engine.Localize( "LUA_MENU_PULL_PARTY_DESC" ),
		defaultFocusIndex = 2,
		cancelClosesPopup = true,
		buttonsClosePopup = true,
		buttons = {
			{
				label = Engine.Localize( "LUA_MENU_YES" ),
				action = f0_local7
			},
			{
				label = Engine.Localize( "LUA_MENU_NO" ),
				action = f0_local8
			}
		}
	} )
	f14_local0.id = "PullPartyPopup"
	return f14_local0
end

MenuBuilder.registerType( "popup_end_game", f0_local11 )
MenuBuilder.registerType( "popup_leave_game", f0_local12 )
MenuBuilder.registerType( "PullPartyPopup", f0_local13 )
LockTable( _M )
