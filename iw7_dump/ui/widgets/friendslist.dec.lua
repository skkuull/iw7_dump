local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function popup_friend_invite_sent()
	return {
		type = "generic_confirmation_popup",
		properties = {
			popup_title = Engine.Localize( "@MENU_POPUP_INVITE_SENT" ),
			message_text = Engine.Localize( "@MENU_POPUP_INVITE_SENT" ),
			dialog_top = -100,
			dialog_bottom = 100
		}
	}
end

MenuBuilder.registerDef( "popup_friend_invite_sent", popup_friend_invite_sent )
f0_local0 = "alwaysLoaded.friendsList"
f0_local1 = 20
f0_local2 = function ()
	WipeGlobalModelsAtPath( f0_local0 )
	WipeControllerModelsAtPath( f0_local0 )
end

local f0_local3 = function ( f3_arg0 )
	local f3_local0, f3_local1 = nil
	if f3_arg0 == Friends.TabIDs.ONLINE_FRIENDS then
		f3_local0 = f0_local0 .. ".friends."
		if Engine.IsPCApp() then
			local f3_local2 = Engine.Localize( "@PLATFORM_NO_FRIENDS_XBOXLIVE" )
		end
		f3_local1 = f3_local2 or Engine.Localize( "@PLATFORM_NO_FRIENDS" )
	elseif f3_arg0 == Friends.TabIDs.RECENT_PLAYERS then
		f3_local0 = f0_local0 .. ".recentPlayers."
		f3_local1 = Engine.Localize( "@LUA_MENU_NO_RECENT_PLAYERS" )
	elseif f3_arg0 == Friends.TabIDs.LIVE_PARTY then
		f3_local0 = f0_local0 .. ".xboxLiveParty."
		f3_local1 = Engine.Localize( "@PLATFORM_NOT_IN_PARTY" )
	else
		assert( false )
	end
	return f3_local0, f3_local1
end

local f0_local4 = function ( f4_arg0, f4_arg1, f4_arg2 )
	local f4_local0 = nil
	if f4_arg2 == Friends.TabIDs.ONLINE_FRIENDS then
		f4_local0 = Friends.GetFriendXUIDString( f4_arg0, f4_arg1 )
	elseif f4_arg2 == Friends.TabIDs.LIVE_PARTY then
		f4_local0 = Friends.GetLivePartyPlayerXUIDString( f4_arg0, f4_arg1 )
	elseif f4_arg2 == Friends.TabIDs.RECENT_PLAYERS then
		f4_local0 = Friends.GetRecentPlayerXUIDString( f4_arg0, f4_arg1 )
	else
		assert( false )
	end
	assert( f4_local0 )
	return f4_local0
end

local f0_local5 = function ( f5_arg0, f5_arg1, f5_arg2, f5_arg3 )
	if f5_arg1:GetValue( f5_arg2 ) == 0 then
		f5_arg0.NoFriendsLabel:setText( f5_arg3, 0 )
		f5_arg0.NoFriendsLabel:SetAlpha( 1, 0 )
		f5_arg0.ArrowUp:SetAlpha( 0, 0 )
		f5_arg0.ArrowDown:SetAlpha( 0, 0 )
		f5_arg0.ListCount:SetAlpha( 0, 0 )
	else
		f5_arg0.NoFriendsLabel:SetAlpha( 0, 0 )
		f5_arg0.ArrowUp:SetAlpha( 1, 0 )
		f5_arg0.ArrowDown:SetAlpha( 1, 0 )
		f5_arg0.ListCount:SetAlpha( 1, 0 )
	end
end

local f0_local6 = function ( f6_arg0, f6_arg1 )
	local f6_local0 = f6_arg0.Tabs.Tabs:GetCurrentTabIndex()
	local f6_local1 = f6_arg0.tabNamesAndIDs[f6_arg0.Tabs.Tabs:GetCurrentTabIndex() + 1].id
	local f6_local2, f6_local3 = f0_local3( f6_local1 )
	local f6_local4 = function ( f7_arg0 )
		return Rank.GetRankDisplay( tostring( f7_arg0 ) )
	end
	
	local f6_local5 = LUI.DataSourceInControllerModel.new( f6_local2 .. "count" )
	f6_arg0.friendsCount = f6_local5:GetValue( f6_arg1 )
	if f6_arg0.friendsCount <= f6_arg0.getFriendTo then
		if f6_arg0.friendsCount == 0 then
			f6_arg0.getFriendTo = 0
		else
			f6_arg0.getFriendTo = f6_arg0.friendsCount - 1
		end
	end
	local f6_local6 = LUI.DataSourceFromList.new( f6_local5 )
	f6_local6.MakeDataSourceAtIndex = function ( f8_arg0, f8_arg1, f8_arg2 )
		local f8_local0 = f6_local2 .. f8_arg1
		local f8_local1 = LUI.DataSourceInControllerModel.new( f8_local0 .. ".presence" )
		local f8_local2 = LUI.DataSourceInControllerModel.new( f8_local0 .. ".lastMetInfo" )
		local f8_local3 = LUI.DataSourceInControllerModel.new( f8_local0 .. ".rank" )
		local f8_local4 = LUI.DataSourceInControllerModel.new( f8_local0 .. ".prestige" )
		local f8_local5 = LUI.AggregateDataSource.new( f8_local3, {
			f8_local3,
			f8_local4
		}, "rankIcon", Rank.MakeRankIconAggregateFunction( f8_local3, f8_local4 ) )
		local f8_local6 = LUI.AggregateDataSource.new( f8_local3, {
			f8_local3,
			f8_local4
		}, "display", Rank.MakeRankDisplayAggregateFunction( f8_local3, f8_local4, true ) )
		local f8_local7 = f8_local4:Filter( "isMasterPrestige", Rank.IsMasterPrestige )
		local f8_local8 = LUI.DataSourceInControllerModel.new( f8_local0 .. ".fullName" )
		local f8_local9 = LUI.DataSourceInControllerModel.new( f8_local0 .. ".customEmblemEquipped" )
		local f8_local10 = LUI.FilteredDataSource.new( LUI.DataSourceInControllerModel.new( f8_local0 .. ".emblemIndex" ), "emblem", function ( f9_arg0, f9_arg1 )
			return Engine.TableLookup( PatchesTable.File, PatchesTable.Cols.Ref, f9_arg0, PatchesTable.Cols.Image )
		end )
		local f8_local11 = LUI.DataSourceInControllerModel.new( f8_local0 .. ".background" )
		local f8_local12 = f8_local11:Filter( "texture", CallingCardUtils.GetCardTexture )
		local f8_local13 = LUI.DataSourceInControllerModel.new( f8_local0 .. ".isPrivate" )
		local f8_local14 = LUI.DataSourceInControllerModel.new( f8_local0 .. ".friendIndex" )
		return {
			playerCardArchetype = {
				xuid = LUI.DataSourceInControllerModel.new( f8_local0 .. ".xuid", f0_local4( f8_arg2, f8_local14:GetValue( f8_arg2 ), f6_local1 ) ),
				fullName = f8_local8,
				displayRank = f8_local6,
				rankIcon = f8_local5,
				rank = f8_local3,
				emblem = f8_local10,
				customEmblemEquipped = f8_local9,
				prestige = f8_local4,
				isMasterPrestige = f8_local7,
				background = f8_local12
			},
			friendIndex = f8_local14,
			isVisible = LUI.DataSourceInControllerModel.new( f8_local0 .. ".isVisible" ),
			presence = f8_local1,
			lastMetInfo = f8_local2,
			isPrivate = f8_local13
		}
	end
	
	f6_local6.GetDefaultFocusIndex = function ()
		local f10_local0 = f6_arg0.FriendsListGrid:GetFocusPosition( LUI.DIRECTION.vertical )
		if f10_local0 and f10_local0 < f6_local5:GetValue( f6_arg1 ) then
			return f10_local0
		else
			return 0
		end
	end
	
	f0_local5( f6_arg0, f6_local5, f6_arg1, f6_local3 )
	return f6_local6
end

local f0_local7 = function ( f11_arg0, f11_arg1 )
	if Engine.IsPS4() and Friends.CountPendingPlaystationInvites and Friends.CountPendingPlaystationInvites( f11_arg1 ) > 0 then
		f11_arg0:AddButtonHelperTextToElement( f11_arg0.ButtonHelperBar, {
			helper_text = Engine.Localize( "@PLATFORM_VIEW_GAME_INVITES" ),
			button_ref = "button_alt2",
			side = "right",
			clickable = true
		} )
	else
		f11_arg0:AddButtonHelperTextToElement( f11_arg0.ButtonHelperBar, {
			helper_text = "",
			button_ref = "button_alt2",
			side = "right",
			clickable = true
		} )
	end
end

local f0_local8 = function ( f12_arg0, f12_arg1 )
	f12_arg0:AddButtonHelperTextToElement( f12_arg0.ButtonHelperBar, {
		helper_text = "",
		button_ref = "button_alt2",
		side = "right",
		clickable = true
	} )
end

local f0_local9 = function ( f13_arg0, f13_arg1 )
	local f13_local0 = Engine.GetDvarBool( "onlinegame" )
	if f13_local0 and Engine.IsMultiplayer() then
		local f13_local1 = f13_arg0.friendsCount
		if f13_local1 then
			f13_local1 = f13_arg0.friendsCount > 1
		end
		local f13_local2 = Engine.Localize
		local f13_local3
		if f13_local1 and f13_local0 then
			f13_local3 = "@PLATFORM_INVITE_XBOX_LIVE_PARTY"
			if not f13_local3 then
			
			else
				f13_arg0:AddButtonHelperTextToElement( f13_arg0.ButtonHelperBar, {
					helper_text = f13_local2( f13_local3 ),
					button_ref = "button_alt1",
					side = "right",
					clickable = true
				} )
			end
		end
		f13_local3 = "@MENU_INVITE_FRIENDS"
	else
		f13_arg0:AddButtonHelperTextToElement( f13_arg0.ButtonHelperBar, {
			helper_text = "",
			button_ref = "button_alt1",
			side = "right",
			clickable = true
		} )
	end
	f13_arg0:AddButtonHelperTextToElement( f13_arg0.ButtonHelperBar, {
		helper_text = "",
		button_ref = "button_alt2",
		side = "right",
		clickable = true
	} )
end

local f0_local10 = function ( f14_arg0, f14_arg1 )
	if f14_arg0.menuCreated then
		if f14_arg0.friendsCount > 0 then
			f14_arg0:AddButtonHelperTextToElement( f14_arg0.ButtonHelperBar, {
				helper_text = Engine.Localize( "LUA_MENU_SELECT" ),
				button_ref = "button_primary",
				side = "right",
				clickable = true
			} )
		else
			f14_arg0:AddButtonHelperTextToElement( f14_arg0.ButtonHelperBar, {
				helper_text = "",
				button_ref = "button_primary",
				side = "right",
				clickable = true
			} )
		end
		local f14_local0 = f14_arg0.Tabs.Tabs:GetCurrentTabIndex()
		local f14_local1 = f14_arg0.tabNamesAndIDs[f14_arg0.Tabs.Tabs:GetCurrentTabIndex() + 1].id
		if f14_local1 == Friends.TabIDs.ONLINE_FRIENDS then
			f0_local7( f14_arg0, f14_arg1 )
		elseif f14_local1 == Friends.TabIDs.RECENT_PLAYERS then
			f0_local8( f14_arg0, f14_arg1 )
		elseif f14_local1 == Friends.TabIDs.LIVE_PARTY then
			if Engine.IsXB3() then
				f0_local9( f14_arg0, f14_arg1 )
			end
		else
			assert( false )
		end
	end
end

local f0_local11 = function ( f15_arg0, f15_arg1 )
	f15_arg0.menuCreated = true
	f0_local10( f15_arg0, f15_arg1.controller )
	f15_arg0.bindButton:addEventHandler( "button_alt1", function ( f16_arg0, f16_arg1 )
		local f16_local0 = f15_arg0.Tabs.Tabs:GetCurrentTabIndex()
		if f15_arg0.tabNamesAndIDs[f15_arg0.Tabs.Tabs:GetCurrentTabIndex() + 1].id == Friends.TabIDs.LIVE_PARTY then
			local f16_local1 = Engine.GetDvarBool( "onlinegame" )
			if f16_local1 and Engine.IsMultiplayer() then
				local f16_local2 = f15_arg0.friendsCount
				if f16_local2 then
					f16_local2 = f15_arg0.friendsCount > 1
				end
				if f16_local1 and f16_local2 then
					Friends.InviteAllLiveParty( f16_arg1.controller )
				elseif Friends.OpenSystemFriendsList then
					Friends.OpenSystemFriendsList( f16_arg1.controller )
				else
					Engine.Exec( "xshowfriendslist" )
				end
			end
		else
			local f16_local1 = f15_arg0.FriendsListGrid:GetFocusPosition( LUI.DIRECTION.vertical )
			if f16_local1 ~= nil and f16_local1 > 0 then
				f15_arg0.FriendsListGrid:FocusFirstItem()
			end
		end
		return true
	end )
	f15_arg0.bindButton:addEventHandler( "button_alt2", function ( f17_arg0, f17_arg1 )
		local f17_local0 = f15_arg0.Tabs.Tabs:GetCurrentTabIndex()
		local f17_local1 = f15_arg0.tabNamesAndIDs[f15_arg0.Tabs.Tabs:GetCurrentTabIndex() + 1].id
		if f17_local1 == Friends.TabIDs.ONLINE_FRIENDS then
			if Engine.IsPS4() and Friends.CountPendingPlaystationInvites and Friends.CountPendingPlaystationInvites( f17_arg1.controller ) > 0 then
				Engine.Exec( "gameInvitesReceived", f17_arg1.controller )
			end
			return true
		elseif f17_local1 == Friends.TabIDs.LIVE_PARTY then
			Friends.OpenLivePartyUI( f17_arg1.controller )
			return true
		else
			
		end
	end )
end

local f0_local12 = nil
f0_local12 = function ( f18_arg0, f18_arg1 )
	local f18_local0 = f18_arg0:Wait( 1000 )
	f18_local0.onComplete = function ()
		return f0_local12( f18_arg0, f18_arg1 )
	end
	
	if Engine.IsXB3() or Engine.IsPCApp() then
		Engine.ExecNow( "friends_refresh", f18_arg1 )
	end
	RefreshData( f18_arg0, f18_arg1, false )
end

function RefreshData( f20_arg0, f20_arg1, f20_arg2 )
	assert( f20_arg0.getFriendFrom )
	assert( f20_arg0.getFriendTo )
	assert( f20_arg0.getFriendFrom >= 0 )
	if f20_arg0.friendsCount > 0 then
		assert( f20_arg0.getFriendTo < f20_arg0.friendsCount )
	end
	assert( f20_arg0.getFriendFrom <= f20_arg0.getFriendTo )
	local f20_local0 = f20_arg0.Tabs.Tabs:GetCurrentTabIndex()
	local f20_local1 = f20_arg0.tabNamesAndIDs[f20_arg0.Tabs.Tabs:GetCurrentTabIndex() + 1].id
	local f20_local2, f20_local3 = f0_local3( f20_local1 )
	Friends.CreateFriendsDataModels( f20_arg1, f20_local1, f20_arg0.getFriendFrom, f20_arg0.getFriendTo, f20_arg0.friendsCount )
	if f20_arg2 then
		f20_arg0.FriendsListGrid:SetGridDataSource( f0_local6( f20_arg0, f20_arg1 ), f20_arg1 )
		if f20_arg0.previousTabID and f20_arg0.previousTabID ~= f20_local1 then
			if f20_arg0.previousTabID == Friends.TabIDs.ONLINE_FRIENDS then
				WipeControllerModelsAtPath( f0_local0 .. ".friends" )
			elseif f20_arg0.previousTabID == Friends.TabIDs.LIVE_PARTY then
				WipeControllerModelsAtPath( f0_local0 .. ".xboxLiveParty" )
			elseif f20_arg0.previousTabID == Friends.TabIDs.RECENT_PLAYERS then
				WipeControllerModelsAtPath( f0_local0 .. ".recentPlayers" )
			end
		end
		f20_arg0.previousTabID = f20_local1
		f20_arg0.FriendsListGrid:processEvent( {
			name = "gain_focus",
			controllerIndex = f20_arg1
		} )
	else
		local f20_local4 = LUI.DataSourceInControllerModel.new( f20_local2 .. "count" )
		local f20_local5 = f20_arg0.friendsCount
		f20_arg0.friendsCount = f20_local4:GetValue( f20_arg1 )
		f0_local5( f20_arg0, f20_local4, f20_arg1, f20_local3 )
		if f20_arg0.friendsCount > 0 then
			f20_arg0.getFriendFrom = LUI.clamp( f20_arg0.getFriendFrom, 0, f20_arg0.friendsCount - 1 )
			if f20_local5 < f20_arg0.friendsCount then
				local f20_local6 = math.floor( f0_local1 / 2 )
				local f20_local7 = f20_arg0.friendsCount - f20_local5
				if f20_local6 < f20_local7 then
					f20_local7 = f20_local6 or f20_local7
				end
				f20_arg0.getFriendTo = f20_arg0.getFriendTo + f20_local7
			end
			f20_arg0.getFriendTo = LUI.clamp( f20_arg0.getFriendTo, f20_arg0.getFriendFrom, f20_arg0.friendsCount - 1 )
		else
			f20_arg0.getFriendFrom = 0
			f20_arg0.getFriendTo = f0_local1
		end
	end
	f0_local10( f20_arg0, f20_arg1 )
end

function PostLoadFunc( f21_arg0, f21_arg1, f21_arg2 )
	local f21_local0 = {
		controllerIndex = f21_arg1,
		right_inset = Engine.IsGamepadEnabled() and -1 or nil
	}
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", f21_local0 )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 570, _1080p * -570, _1080p * -151, _1080p * -91 )
	f21_arg0:addElement( ButtonHelperBar )
	f21_arg0.ButtonHelperBar = ButtonHelperBar
	
	assert( f21_arg0.NoFriendsLabel )
	assert( f21_arg0.ButtonHelperBar )
	f21_arg0.getFriendFrom = 0
	f21_arg0.getFriendTo = f0_local1
	f21_arg0.friendsCount = 0
	f21_arg0.ArrowUp.m_requireFocusType = FocusType.MouseOver
	f21_arg0.ArrowDown.m_requireFocusType = FocusType.MouseOver
	if not Engine.InFrontend() then
		local self = LUI.UIElement.new( {
			worldBlur = 5
		} )
		self:setupWorldBlur()
		self.id = "blur"
		f21_arg0:addElement( self )
	end
	local self = {
		[#self + 1] = {
			name = Engine.Localize( "@LUA_MENU_FRIENDS" ),
			id = Friends.TabIDs.ONLINE_FRIENDS
		}
	}
	if Engine.IsXB3() then
		self[#self + 1] = {
			name = Engine.Localize( "@XBOXLIVE_LIVE_PARTY" ),
			id = Friends.TabIDs.LIVE_PARTY
		}
	end
	if Engine.GetDvarBool( "online_recent_players_ui_enabled" ) then
		self[#self + 1] = {
			name = Engine.Localize( "@MENU_RECENT_PLAYERS" ),
			id = Friends.TabIDs.RECENT_PLAYERS
		}
	end
	f21_arg0.tabNamesAndIDs = self
	local f21_local3 = LUI.DataSourceFromList.new( #self )
	f21_local3.MakeDataSourceAtIndex = function ( f22_arg0, f22_arg1, f22_arg2 )
		return {
			name = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".tabName." .. f22_arg1, self[f22_arg1 + 1].name ),
			focusFunction = function ()
				f21_arg0.getFriendFrom = 0
				f21_arg0.getFriendTo = f0_local1
				f21_arg0.friendsCount = 0
				f21_arg0:AddButtonHelperTextToElement( f21_arg0.ButtonHelperBar, {
					helper_text = "",
					button_ref = "button_alt1",
					side = "right",
					clickable = true
				} )
				RefreshData( f21_arg0, f22_arg2, true )
			end
			
		}
	end
	
	f21_arg0.Tabs.Tabs:SetTabManagerDataSource( f21_local3, f21_arg1 )
	local f21_local4 = function ( f24_arg0, f24_arg1 )
		return function ()
			local f25_local0 = f24_arg0.Tabs.Tabs:GetCurrentTabIndex()
			if f24_arg0.tabNamesAndIDs[f24_arg0.Tabs.Tabs:GetCurrentTabIndex() + 1].id ~= Friends.TabIDs.LIVE_PARTY then
				local f25_local1 = f24_arg0.FriendsListGrid:GetFocusPosition( LUI.DIRECTION.vertical )
				if f25_local1 ~= nil and f25_local1 > 0 then
					f24_arg0:AddButtonHelperTextToElement( f24_arg0.ButtonHelperBar, {
						helper_text = Engine.Localize( "LUA_MENU_TOP" ),
						button_ref = "button_alt1",
						side = "right",
						priority = 0,
						clickable = true
					} )
				else
					f24_arg0:AddButtonHelperTextToElement( f24_arg0.ButtonHelperBar, {
						helper_text = "",
						button_ref = "button_alt1",
						side = "right",
						priority = 0,
						clickable = true
					} )
				end
			end
		end
		
	end
	
	f21_arg0:SubscribeToDataSourceThroughElement( f21_arg0.FriendsListGrid, nil, f21_local4( f21_arg0, f21_arg1 ) )
	f21_arg0.FriendsListGrid:AddScrollbar( {
		SetLinkedGridDataSource = function ()
			
		end,
		UpdateScrolling = function ()
			local f27_local0 = math.floor( f0_local1 / 2 )
			local f27_local1 = f21_arg0.FriendsListGrid:GetFocusPosition() - 1 - f27_local0
			local f27_local2 = f21_arg0.FriendsListGrid:GetFocusPosition() + f27_local0
			local f27_local3 = f21_arg0.Tabs.Tabs:GetCurrentTabIndex()
			local f27_local4 = f0_local3( f21_arg0.tabNamesAndIDs[f21_arg0.Tabs.Tabs:GetCurrentTabIndex() + 1].id )
			local f27_local5, f27_local6 = f21_arg0.FriendsListGrid:GetRowBoundaries()
			for f27_local7 = f21_arg0.getFriendFrom, f21_arg0.getFriendTo, 1 do
				if f27_local5 > f27_local7 or f27_local7 > f27_local6 then
					WipeControllerModelsAtPath( f27_local4 .. f27_local7 )
				end
			end
			local f27_local7 = f21_arg0
			if f27_local1 > 0 then
				local f27_local10 = f27_local1
			end
			f27_local7.getFriendFrom = f27_local10 or 0
			if f21_arg0.friendsCount == 0 then
				f21_arg0.getFriendTo = 0
			else
				f27_local7 = f21_arg0
				if f27_local2 < f21_arg0.friendsCount - 1 then
					local f27_local11 = f27_local2
				end
				f27_local7.getFriendTo = f27_local11 or f21_arg0.friendsCount - 1
			end
			RefreshData( f21_arg0, f21_arg1, false )
		end,
		LinkTo = function ()
			
		end
	} )
	local f21_local5 = f21_arg0:Wait( 1000 )
	f21_local5.onComplete = function ()
		return f0_local12( f21_arg0, f21_arg1 )
	end
	
	f21_arg0:addEventHandler( "menu_create", f0_local11 )
end

function FriendsList( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "FriendsList"
	self._animationSets = {}
	self._sequences = {}
	local f30_local1 = controller and controller.controllerIndex
	if not f30_local1 and not Engine.InFrontend() then
		f30_local1 = self:getRootController()
	end
	assert( f30_local1 )
	self:playSound( "menu_open" )
	local f30_local2 = self
	local BG = nil
	
	BG = LUI.UIImage.new()
	BG.id = "BG"
	BG:SetRGBFromInt( 0, 0 )
	BG:SetAlpha( 0.9, 0 )
	self:addElement( BG )
	self.BG = BG
	
	local GenericButtonBlurBackground = nil
	
	GenericButtonBlurBackground = MenuBuilder.BuildRegisteredType( "GenericButtonBlurBackground", {
		controllerIndex = f30_local1
	} )
	GenericButtonBlurBackground.id = "GenericButtonBlurBackground"
	GenericButtonBlurBackground:SetRGBFromTable( SWATCHES.HUD.disabled, 0 )
	GenericButtonBlurBackground:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 570, _1080p * -570, _1080p * 185, _1080p * -151 )
	self:addElement( GenericButtonBlurBackground )
	self.GenericButtonBlurBackground = GenericButtonBlurBackground
	
	local FriendsListGrid = nil
	
	FriendsListGrid = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = SubtractForSplitscreen( 6, 4 ),
		controllerIndex = f30_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "FriendsListButton", {
				controllerIndex = f30_local1
			} )
		end,
		wrapX = false,
		wrapY = false,
		spacingX = _1080p * 0,
		spacingY = _1080p * 0,
		columnWidth = _1080p * 780,
		rowHeight = _1080p * 119,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	FriendsListGrid.id = "FriendsListGrid"
	FriendsListGrid:setUseStencil( true )
	FriendsListGrid:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 570, _1080p * -570, _1080p * 185, _1080p * -181 )
	self:addElement( FriendsListGrid )
	self.FriendsListGrid = FriendsListGrid
	
	local Tabs = nil
	
	Tabs = MenuBuilder.BuildRegisteredType( "SubMenuTabsBar", {
		controllerIndex = f30_local1
	} )
	Tabs.id = "Tabs"
	Tabs:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 570, _1080p * -570, _1080p * 145, _1080p * 185 )
	self:addElement( Tabs )
	self.Tabs = Tabs
	
	local NoFriendsLabel = nil
	
	NoFriendsLabel = LUI.UIText.new()
	NoFriendsLabel.id = "NoFriendsLabel"
	NoFriendsLabel:setText( Engine.Localize( "PLATFORM_NO_FRIENDS" ), 0 )
	NoFriendsLabel:SetFontSize( 32 * _1080p )
	NoFriendsLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	NoFriendsLabel:SetAlignment( LUI.Alignment.Center )
	NoFriendsLabel:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 618, _1080p * -618, _1080p * 483, _1080p * 515 )
	self:addElement( NoFriendsLabel )
	self.NoFriendsLabel = NoFriendsLabel
	
	local ArrowUp = nil
	
	ArrowUp = MenuBuilder.BuildRegisteredType( "ArrowUp", {
		controllerIndex = f30_local1
	} )
	ArrowUp.id = "ArrowUp"
	ArrowUp:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * 72.5, _1080p * 92.5, _1080p * -185, _1080p * -145 )
	self:addElement( ArrowUp )
	self.ArrowUp = ArrowUp
	
	local ArrowDown = nil
	
	ArrowDown = MenuBuilder.BuildRegisteredType( "ArrowDown", {
		controllerIndex = f30_local1
	} )
	ArrowDown.id = "ArrowDown"
	ArrowDown:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -92.5, _1080p * -72.5, _1080p * -186, _1080p * -146 )
	self:addElement( ArrowDown )
	self.ArrowDown = ArrowDown
	
	local ListCount = nil
	
	ListCount = LUI.UIText.new()
	ListCount.id = "ListCount"
	ListCount:setText( "1/15", 0 )
	ListCount:SetFontSize( 24 * _1080p )
	ListCount:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ListCount:SetAlignment( LUI.Alignment.Center )
	ListCount:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -72.5, _1080p * 72.5, _1080p * -178, _1080p * -154 )
	self:addElement( ListCount )
	self.ListCount = ListCount
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		NoFriendsLabel:RegisterAnimationSequence( "SplitscreenState", {
			{
				function ()
					return self.NoFriendsLabel:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 618, _1080p * -618, _1080p * 293, _1080p * 325, 0 )
				end
			}
		} )
		self._sequences.SplitscreenState = function ()
			NoFriendsLabel:AnimateSequence( "SplitscreenState" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	FriendsListGrid:AddArrow( ArrowUp )
	FriendsListGrid:AddArrow( ArrowDown )
	FriendsListGrid:AddItemNumbers( ListCount )
	self.addButtonHelperFunction = function ( f36_arg0, f36_arg1 )
		f36_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_BACK" ),
			button_ref = "button_secondary",
			side = "right",
			clickable = true
		} )
	end
	
	self:addEventHandler( "menu_create", self.addButtonHelperFunction )
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	self.bindButton:addEventHandler( "button_secondary", function ( f37_arg0, f37_arg1 )
		local f37_local0 = f37_arg1.controller or f30_local1
		ACTIONS.LeaveMenu( self )
	end )
	PostLoadFunc( self, f30_local1, controller )
	if CONDITIONS.IsSplitscreen( self ) then
		ACTIONS.AnimateSequence( self, "SplitscreenState" )
	end
	return self
end

MenuBuilder.registerType( "FriendsList", FriendsList )
LUI.FlowManager.RegisterStackPopBehaviour( "FriendsList", f0_local2 )
LockTable( _M )
