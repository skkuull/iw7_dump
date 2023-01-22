local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ConfirmJoinBlockedUser( f1_arg0, f1_arg1 )
	assert( f1_arg1.controllerIndex )
	assert( f1_arg1.xuid )
	local f1_local0 = MenuBuilder.BuildRegisteredType( "PopupYesNo", {
		title = Engine.Localize( "MENU_NOTICE" ),
		message = Engine.Localize( "XBOXLIVE_JOIN_ON_BLOCKED_USER_CONFIRM" ),
		yesAction = function ( f2_arg0, f2_arg1 )
			Friends.JoinRecentPlayer( f1_arg1.controllerIndex, f1_arg1.xuid )
			local f2_local0, f2_local1 = Engine.UserCanPlayOnline( f2_arg1 )
			if not f2_local0 and f2_local1 == FenceOnlineServices.ERROR_CODES.PSPlusRequired then
				Engine.ShowOnlineUpsell( f2_arg1 )
			end
		end,
		noAction = function ()
			
		end
	} )
	f1_local0.id = "ConfirmJoinBlockedUser"
	return f1_local0
end

MenuBuilder.registerType( "ConfirmJoinBlockedUser", ConfirmJoinBlockedUser )
function FriendActions( f4_arg0, f4_arg1 )
	local f4_local0 = f4_arg1.xuid
	assert( f4_local0 )
	local f4_local1 = f4_arg1.selectedTab
	assert( f4_local1 )
	local f4_local2 = f4_arg1.controllerIndex
	assert( f4_local2 )
	local f4_local3 = f4_arg1.isPrivateDataSource
	assert( f4_local3 )
	local f4_local4 = not Engine.InFrontend()
	local f4_local5 = Engine.InLobby()
	local f4_local6 = {
		title = Engine.Localize( "MPUI_PLAYER_OPTIONS" ),
		message = "",
		buttons = {}
	}
	if f4_local1 == Friends.TabIDs.ONLINE_FRIENDS then
		if Engine.IsMultiplayer() then
			local f4_local7 = {}
			local f4_local8
			if f4_local4 or f4_local5 then
				f4_local8 = Engine.Localize( "@MENU_INVITE_TO_GAME" )
				if not f4_local8 then
				
				else
					f4_local7.label = f4_local8
					f4_local8 = IsMlgGameBattlesMatch()
					if f4_local8 then
						if not f4_local4 then
							f4_local8 = not MLG.IsGameBattleMatchJoined( f4_local2 )
						else
							f4_local8 = false
						end
					end
					f4_local7.disabledFunc = function ()
						local f5_local0
						if IsOnlineMatch() and Friends.IsFriendInvitable( f4_local2, f4_local0 ) then
							f5_local0 = isAliensSolo()
							if not f5_local0 then
								f5_local0 = f4_local8
							end
						else
							f5_local0 = true
						end
						return f5_local0
					end
					
					f4_local7.disabled = f4_local7.disabledFunc()
					f4_local7.previousDisabledStatus = f4_local7.disabled
					f4_local7.action = function ( f6_arg0, f6_arg1 )
						if not f4_local7.disabledFunc() then
							Friends.InviteOnlineFriend( f6_arg1, f4_local0 )
						end
					end
					
					table.insert( f4_local6.buttons, f4_local7 )
				end
			end
			f4_local8 = Engine.Localize( "@MENU_INVITE_TO_PARTY" )
		end
		if Engine.IsConsoleGame() or Engine.IsPC() then
			local f4_local7 = {
				label = Engine.Localize( "MENU_JOIN_GAME" ),
				disabledFunc = function ()
					local f7_local0 = f4_local3:GetValue( f4_local2 )
					if not f7_local0 then
						if Engine.UserCanPlayOnline( f4_local2 ) and Friends.IsFriendJoinable( f4_local2, f4_local0, true ) then
							f7_local0 = not Engine.IsUserSignedInToLive( f4_local2 )
						else
							f7_local0 = true
						end
					end
					return f7_local0
				end,
				disabled = f4_local7.disabledFunc(),
				previousDisabledStatus = f4_local7.disabled,
				action = function ( f8_arg0, f8_arg1 )
					if not f4_local7.disabledFunc() then
						Friends.JoinOnlineFriend( f8_arg1, f4_local0 )
					end
				end
			}
			table.insert( f4_local6.buttons, f4_local7 )
		end
		if Engine.IsConsoleGame() or Engine.IsPCApp() then
			local f4_local7 = {
				label = Engine.Localize( "XBOXLIVE_VIEW_PROFILE" ),
				disabledFunc = function ()
					return not Friends.CanShowFriendGamercard( f4_local2 )
				end,
				disabled = f4_local7.disabledFunc(),
				previousDisabledStatus = f4_local7.disabled,
				action = function ( f10_arg0, f10_arg1 )
					if not f4_local7.disabledFunc() then
						Friends.ShowPlayerCard( f10_arg1, f4_local0 )
					end
				end
			}
			table.insert( f4_local6.buttons, f4_local7 )
		end
		local f4_local7 = {
			label = Engine.Localize( "@MENU_REPORT_PLAYER" ),
			disabledFunc = function ()
				return Lobby.IsLocalPlayer( f4_local0 )
			end,
			disabled = f4_local7.disabledFunc(),
			previousDisabledStatus = f4_local7.disabled,
			action = function ( f12_arg0, f12_arg1 )
				if not f4_local7.disabledFunc() then
					LUI.FlowManager.RequestPopupMenu( nil, "ReportPlayer", true, f12_arg1, false, {
						xuid = f4_local0
					} )
				end
			end
		}
		table.insert( f4_local6.buttons, f4_local7 )
	elseif f4_local1 == Friends.TabIDs.RECENT_PLAYERS then
		if Engine.IsConsoleGame() or Engine.IsPC() then
			if Engine.IsMultiplayer() and not Engine.IsPCDesktop() then
				local f4_local7 = {}
				local f4_local8
				if f4_local4 or f4_local5 then
					f4_local8 = Engine.Localize( "@MENU_INVITE_TO_GAME" )
					if not f4_local8 then
					
					else
						f4_local7.label = f4_local8
						f4_local7.disabledFunc = function ()
							local f13_local0
							if Engine.GetDvarBool( "onlinegame" ) then
								f13_local0 = isAliensSolo()
							else
								f13_local0 = true
							end
							return f13_local0
						end
						
						f4_local7.disabled = f4_local7.disabledFunc()
						f4_local7.previousDisabledStatus = f4_local7.disabled
						f4_local7.action = function ( f14_arg0, f14_arg1 )
							if not f4_local7.disabledFunc() then
								Friends.InviteRecentPlayer( f14_arg1, f4_local0 )
							end
						end
						
						table.insert( f4_local6.buttons, f4_local7 )
					end
				end
				f4_local8 = Engine.Localize( "@MENU_INVITE_TO_PARTY" )
			end
			if not Engine.IsPCApp() then
				local f4_local7 = {
					label = Engine.Localize( "MENU_JOIN_GAME" ),
					disabledFunc = function ()
						local f15_local0 = f4_local3:GetValue( f4_local2 )
						if not f15_local0 then
							f15_local0 = not Friends.IsRecentlyMetPlayerJoinable( f4_local2, f4_local0 )
						end
						return f15_local0
					end,
					disabled = f4_local7.disabledFunc(),
					previousDisabledStatus = f4_local7.disabled,
					action = function ( f16_arg0, f16_arg1 )
						if not f4_local7.disabledFunc() then
							if (Engine.IsXB3() or Engine.IsPCApp()) and Friends.IsUserInBlockList( f16_arg1, f4_local0 ) then
								LUI.FlowManager.RequestPopupMenu( nil, "ConfirmJoinBlockedUser", true, f16_arg1, false, {
									xuid = f4_local0,
									controllerIndex = f16_arg1
								} )
							else
								Friends.JoinRecentPlayer( f16_arg1, f4_local0 )
								local f16_local0, f16_local1 = Engine.UserCanPlayOnline( f16_arg1 )
								if not f16_local0 and f16_local1 == FenceOnlineServices.ERROR_CODES.PSPlusRequired then
									Engine.ShowOnlineUpsell( f16_arg1 )
								end
							end
						end
					end
				}
				table.insert( f4_local6.buttons, f4_local7 )
			end
		end
		if Engine.IsConsoleGame() or Engine.IsPCApp() then
			table.insert( f4_local6.buttons, {
				label = Engine.Localize( "XBOXLIVE_VIEW_PROFILE" ),
				action = function ( f17_arg0, f17_arg1 )
					Friends.ShowRecentPlayerGamercard( f17_arg1, f4_local0 )
				end
			} )
		end
		if not Engine.IsConsoleGame() then
			local f4_local7 = {}
			local f4_local8 = Engine.Localize
			local f4_local9
			if Engine.IsXB3() or Engine.IsPCApp() then
				f4_local9 = "LUA_MENU_FRIEND_FOLLOW"
				if not f4_local9 then
				
				else
					f4_local7.label = f4_local8( f4_local9 )
					f4_local7.disabledFunc = function ()
						return Friends.IsRecentPlayerAFriend( f4_local2, f4_local0 )
					end
					
					f4_local7.disabled = f4_local7.disabledFunc()
					f4_local7.previousDisabledStatus = f4_local7.disabled
					f4_local7.action = function ( f19_arg0, f19_arg1 )
						if not f4_local7.disabledFunc() then
							Friends.RequestRecentPlayerAsFriend( f19_arg1, f4_local0 )
						end
					end
					
					table.insert( f4_local6.buttons, f4_local7 )
				end
			end
			f4_local9 = "MENU_FRIEND_REQUEST"
		end
		local f4_local7 = {
			label = Engine.Localize( "@MENU_REPORT_PLAYER" ),
			disabledFunc = function ()
				return Lobby.IsLocalPlayer( f4_local0 )
			end,
			disabled = f4_local7.disabledFunc(),
			previousDisabledStatus = f4_local7.disabled,
			action = function ( f21_arg0, f21_arg1 )
				if not f4_local7.disabledFunc() then
					LUI.FlowManager.RequestPopupMenu( nil, "ReportPlayer", true, f21_arg1, false, {
						xuid = f4_local0
					} )
				end
			end
		}
		table.insert( f4_local6.buttons, f4_local7 )
	elseif f4_local1 == Friends.TabIDs.LIVE_PARTY then
		if Engine.IsMultiplayer() then
			local f4_local7 = {}
			local f4_local8
			if f4_local4 or f4_local5 then
				f4_local8 = Engine.Localize( "@MENU_INVITE_TO_GAME" )
				if not f4_local8 then
				
				else
					f4_local7.label = f4_local8
					f4_local7.disabledFunc = function ()
						local f22_local0 = Friends.IsLivePartyLocal( f4_local2, f4_local0 )
						if not f22_local0 then
							if Engine.GetDvarBool( "onlinegame" ) then
								f22_local0 = isAliensSolo()
							else
								f22_local0 = true
							end
						end
						return f22_local0
					end
					
					f4_local7.disabled = f4_local7.disabledFunc()
					f4_local7.previousDisabledStatus = f4_local7.disabled
					f4_local7.action = function ( f23_arg0, f23_arg1 )
						if not f4_local7.disabledFunc() then
							Friends.InviteLivePartyFriend( f23_arg1, f4_local0 )
						end
					end
					
					table.insert( f4_local6.buttons, f4_local7 )
				end
			end
			f4_local8 = Engine.Localize( "@MENU_INVITE_TO_PARTY" )
		end
		local f4_local7 = {
			label = Engine.Localize( "@MENU_JOIN_GAME" ),
			disabledFunc = function ()
				local f24_local0 = f4_local3:GetValue( f4_local2 )
				if not f24_local0 then
					f24_local0 = Friends.IsLivePartyLocal( f4_local2, f4_local0 )
					if not f24_local0 then
						if Engine.UserCanPlayOnline( f4_local2 ) then
							f24_local0 = not Engine.IsUserSignedInToLive( f4_local2 )
						else
							f24_local0 = true
						end
					end
				end
				return f24_local0
			end,
			disabled = f4_local7.disabledFunc(),
			previousDisabledStatus = f4_local7.disabled,
			action = function ( f25_arg0, f25_arg1 )
				if not f4_local7.disabledFunc() then
					Friends.JoinLivePartyFriend( f25_arg1, f4_local0 )
				end
			end
		}
		table.insert( f4_local6.buttons, f4_local7 )
		if Engine.IsConsoleGame() or Engine.IsPCApp() then
			table.insert( f4_local6.buttons, {
				label = Engine.Localize( "XBOXLIVE_VIEW_PROFILE" ),
				action = function ( f26_arg0, f26_arg1 )
					Friends.ShowLivePartyFriendGamercard( f26_arg1, f4_local0 )
				end
			} )
		end
		local f4_local8 = {
			label = Engine.Localize( "@MENU_REPORT_PLAYER" ),
			disabledFunc = function ()
				return Lobby.IsLocalPlayer( f4_local0 )
			end,
			disabled = f4_local8.disabledFunc(),
			previousDisabledStatus = f4_local8.disabled,
			action = function ( f28_arg0, f28_arg1 )
				if not f4_local8.disabledFunc() then
					LUI.FlowManager.RequestPopupMenu( nil, "ReportPlayer", true, f28_arg1, false, {
						xuid = f4_local0
					} )
				end
			end
		}
		table.insert( f4_local6.buttons, f4_local8 )
	end
	local f4_local7 = MenuBuilder.BuildRegisteredType( "PopupMessageAndButtons", f4_local6 )
	f4_local7.id = "FriendActions"
	local f4_local8 = nil
	local f4_local9 = function ()
		for f29_local0 = 1, #f4_local6.buttons, 1 do
			local f29_local3 = f4_local6.buttons[f29_local0]
			if f29_local3.disabledFunc then
				local f29_local4 = f29_local3.disabledFunc()
				if f29_local3.previousDisabledStatus ~= f29_local4 then
					local f29_local5 = f4_local7:GetButton( f29_local0 )
					f29_local5:SetButtonDisabled( f29_local4 )
				end
				f29_local3.previousDisabledStatus = f29_local4
			end
		end
		local f29_local0 = f4_local7:Wait( 1000 )
		f29_local0.onComplete = f4_local8
	end
	
	f4_local9()
	return f4_local7
end

MenuBuilder.registerType( "FriendActions", FriendActions )
f0_local0 = function ( f30_arg0, f30_arg1, f30_arg2 )
	local f30_local0 = nil
	if f30_arg2 == Friends.TabIDs.ONLINE_FRIENDS then
		f30_local0 = Friends.GetFriendXUID( f30_arg0, f30_arg1 )
	elseif f30_arg2 == Friends.TabIDs.LIVE_PARTY then
		f30_local0 = Friends.GetLivePartyPlayerXUID( f30_arg0, f30_arg1 )
	elseif f30_arg2 == Friends.TabIDs.RECENT_PLAYERS then
		f30_local0 = Friends.GetRecentPlayerXUID( f30_arg0, f30_arg1 )
	else
		assert( false )
	end
	assert( f30_local0 )
	return f30_local0
end

f0_local1 = function ( f31_arg0, f31_arg1 )
	local f31_local0 = f31_arg0:GetCurrentMenu()
	local f31_local1 = Friends.TabIDs.ONLINE_FRIENDS
	if f31_local0 then
		local f31_local2 = f31_local0.Tabs.Tabs:GetCurrentTabIndex()
		f31_local1 = f31_local0.tabNamesAndIDs[f31_local0.Tabs.Tabs:GetCurrentTabIndex() + 1].id
	end
	local f31_local2 = f31_arg0:GetDataSource()
	return f31_local1, f0_local0( f31_arg1, f31_local2.friendIndex:GetValue( f31_arg1 ), f31_local1 )
end

function PostLoadFunc( f32_arg0, f32_arg1 )
	assert( f32_arg0.MatchJoinText )
	f32_arg0:addEventHandler( "button_action", function ( f33_arg0, f33_arg1 )
		local f33_local0, f33_local1 = f0_local1( f33_arg0, f32_arg1 )
		local f33_local2 = {
			xuid = f33_local1,
			selectedTab = f33_local0,
			controllerIndex = f32_arg1
		}
		local f33_local3 = f33_arg0:GetDataSource()
		f33_local2.isPrivateDataSource = f33_local3.isPrivate
		LUI.FlowManager.RequestPopupMenu( nil, "FriendActions", true, f32_arg1, false, f33_local2 )
	end )
	local f32_local0 = nil
	f32_local0 = function ()
		local f34_local0 = f32_arg0:GetDataSource()
		f34_local0 = f34_local0.isPrivate:GetValue( f32_arg1 )
		if f34_local0 ~= nil then
			local f34_local1, f34_local2 = f0_local1( f32_arg0, f32_arg1 )
			if f34_local1 == Friends.TabIDs.ONLINE_FRIENDS then
				if f34_local0 or not Engine.UserCanPlayOnline( f32_arg1 ) or not Friends.IsFriendJoinable( f32_arg1, f34_local2, false ) or not Engine.IsUserSignedInToLive( f32_arg1 ) then
					f32_arg0.MatchJoinText:setText( Engine.Localize( "MENU_NOT_JOINABLE" ), 0 )
				else
					f32_arg0.MatchJoinText:setText( Engine.Localize( "MENU_JOINABLE" ), 0 )
				end
			elseif f34_local1 == Friends.TabIDs.RECENT_PLAYERS then
				if f34_local0 or not Friends.IsRecentlyMetPlayerJoinable( f32_arg1, f34_local2 ) then
					f32_arg0.MatchJoinText:setText( Engine.Localize( "MENU_NOT_JOINABLE" ), 0 )
				else
					f32_arg0.MatchJoinText:setText( Engine.Localize( "MENU_JOINABLE" ), 0 )
				end
			elseif f34_local1 == Friends.TabIDs.LIVE_PARTY then
				if f34_local0 or Friends.IsLivePartyLocal( f32_arg1, f34_local2 ) or not Engine.UserCanPlayOnline( f32_arg1 ) or not Engine.IsUserSignedInToLive( f32_arg1 ) then
					f32_arg0.MatchJoinText:setText( Engine.Localize( "MENU_NOT_JOINABLE" ), 0 )
				else
					f32_arg0.MatchJoinText:setText( Engine.Localize( "MENU_JOINABLE" ), 0 )
				end
			end
		end
		local f34_local1 = f32_arg0:Wait( 1000 )
		f34_local1.onComplete = f32_local0
	end
	
	local f32_local1 = nil
	f32_local1 = f32_arg0:SubscribeToModelThroughElement( f32_arg0, "isPrivate", function ()
		f32_arg0:UnsubscribeFromModelThroughElement( f32_local1 )
		f32_local0()
	end )
	f32_arg0.MatchJoinText:SetAlpha( 0 )
	if CONDITIONS.IsSplitscreen() then
		f32_arg0:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, 119 * _1080p )
	end
end

function FriendsListButton( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 780 * _1080p, 0, 119 * _1080p )
	self.id = "FriendsListButton"
	self._animationSets = {}
	self._sequences = {}
	local f36_local1 = controller and controller.controllerIndex
	if not f36_local1 and not Engine.InFrontend() then
		f36_local1 = self:getRootController()
	end
	assert( f36_local1 )
	local f36_local2 = self
	local Fade = nil
	
	Fade = LUI.UIImage.new()
	Fade.id = "Fade"
	Fade:SetAlpha( 0, 0 )
	Fade:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
	Fade:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 418, 0, 0, 0 )
	self:addElement( Fade )
	self.Fade = Fade
	
	local SmallPlayerCard = nil
	
	SmallPlayerCard = MenuBuilder.BuildRegisteredType( "SmallPlayerCard", {
		controllerIndex = f36_local1
	} )
	SmallPlayerCard.id = "SmallPlayerCard"
	SmallPlayerCard:SetDataSourceThroughElement( self, "playerCardArchetype" )
	SmallPlayerCard:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 418, 0, _1080p * 119 )
	self:addElement( SmallPlayerCard )
	self.SmallPlayerCard = SmallPlayerCard
	
	local Presense = nil
	
	Presense = LUI.UIText.new()
	Presense.id = "Presense"
	Presense:SetFontSize( 22 * _1080p )
	Presense:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Presense:SetAlignment( LUI.Alignment.Left )
	Presense:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 424, _1080p * 771, _1080p * 28, _1080p * 50 )
	Presense:SubscribeToModelThroughElement( self, "presence", function ()
		local f37_local0 = self:GetDataSource()
		f37_local0 = f37_local0.presence:GetValue( f36_local1 )
		if f37_local0 ~= nil then
			Presense:setText( f37_local0, 0 )
		end
	end )
	self:addElement( Presense )
	self.Presense = Presense
	
	local LastMetInfo = nil
	
	LastMetInfo = LUI.UIText.new()
	LastMetInfo.id = "LastMetInfo"
	LastMetInfo:SetFontSize( 22 * _1080p )
	LastMetInfo:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	LastMetInfo:SetAlignment( LUI.Alignment.Left )
	LastMetInfo:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 424, _1080p * 772, _1080p * 73, _1080p * 95 )
	LastMetInfo:SubscribeToModelThroughElement( self, "lastMetInfo", function ()
		local f38_local0 = self:GetDataSource()
		f38_local0 = f38_local0.lastMetInfo:GetValue( f36_local1 )
		if f38_local0 ~= nil then
			LastMetInfo:setText( f38_local0, 0 )
		end
	end )
	self:addElement( LastMetInfo )
	self.LastMetInfo = LastMetInfo
	
	local Line = nil
	
	Line = LUI.UIImage.new()
	Line.id = "Line"
	Line:SetRGBFromTable( SWATCHES.HUD.disabled, 0 )
	Line:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, 0, _1080p * -1 )
	self:addElement( Line )
	self.Line = Line
	
	local GenericButtonSelection = nil
	
	GenericButtonSelection = MenuBuilder.BuildRegisteredType( "GenericButtonSelection", {
		controllerIndex = f36_local1
	} )
	GenericButtonSelection.id = "GenericButtonSelection"
	GenericButtonSelection:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( GenericButtonSelection )
	self.GenericButtonSelection = GenericButtonSelection
	
	local BG = nil
	
	BG = LUI.UIImage.new()
	BG.id = "BG"
	BG:SetRGBFromInt( 0, 0 )
	BG:SetAlpha( 0.6, 0 )
	self:addElement( BG )
	self.BG = BG
	
	local MatchJoinText = nil
	
	MatchJoinText = LUI.UIText.new()
	MatchJoinText.id = "MatchJoinText"
	MatchJoinText:setText( "", 0 )
	MatchJoinText:SetFontSize( 22 * _1080p )
	MatchJoinText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	MatchJoinText:SetAlignment( LUI.Alignment.Left )
	MatchJoinText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 424, _1080p * 771, _1080p * 5, _1080p * 27 )
	self:addElement( MatchJoinText )
	self.MatchJoinText = MatchJoinText
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Fade:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Fade:SetAlpha( 0.3, 0 )
				end
			}
		} )
		Presense:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Presense:SetAlpha( 1, 0 )
				end
			}
		} )
		LastMetInfo:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.LastMetInfo:SetAlpha( 1, 0 )
				end
			}
		} )
		BG:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.BG:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			Fade:AnimateSequence( "ButtonOver" )
			Presense:AnimateSequence( "ButtonOver" )
			LastMetInfo:AnimateSequence( "ButtonOver" )
			BG:AnimateSequence( "ButtonOver" )
		end
		
		Fade:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Fade:SetAlpha( 0, 0 )
				end
			}
		} )
		BG:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.BG:SetAlpha( 0.6, 0 )
				end
			}
		} )
		self._sequences.ButtonUp = function ()
			Fade:AnimateSequence( "ButtonUp" )
			BG:AnimateSequence( "ButtonUp" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	BG:addEventHandler( "button_over", function ( f49_arg0, f49_arg1 )
		local f49_local0 = f49_arg1.controller or f36_local1
		ACTIONS.AnimateSequence( self, "ButtonOver" )
	end )
	BG:addEventHandler( "button_up", function ( f50_arg0, f50_arg1 )
		local f50_local0 = f50_arg1.controller or f36_local1
		ACTIONS.AnimateSequence( self, "ButtonUp" )
	end )
	SmallPlayerCard:SetDataSourceThroughElement( self, "playerCardArchetype" )
	PostLoadFunc( self, f36_local1, controller )
	return self
end

MenuBuilder.registerType( "FriendsListButton", FriendsListButton )
LockTable( _M )
