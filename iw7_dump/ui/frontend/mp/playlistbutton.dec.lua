local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = {
	UNLOCKED = 0,
	LOCKED_DLC_LOCAL = 1,
	LOCKED_DLC_PARTY = 2,
	LOCKED_MAXPARTY = 3,
	LOCKED_MINPARTY = 4
}
f0_local1 = function ( f1_arg0 )
	return function ( f2_arg0, f2_arg1 )
		assert( f1_arg0.Button )
		local f2_local0 = f1_arg0:GetDataSource()
		local f2_local1 = f2_local0.playlistIndex:GetValue( f2_arg1.controller )
		local f2_local2 = f2_local0.categoryIndex:GetValue( f2_arg1.controller ) + 1
		local f2_local3 = nil
		if Engine.IsCoreMode() then
			f2_local3 = f2_local0.isCompetitive:GetValue( f2_arg1.controller )
		end
		local f2_local4 = function ()
			if Engine.IsCoreMode() then
				Cac.CleanLoadoutForCompetitivePlaylist( f2_local3, f2_arg1.controller )
			end
			local f3_local0 = Playlist.GetItemVideo( f2_local2, f2_local1 )
			if Lobby.AreAllUsersLocal() and f3_local0 and f3_local0 ~= "" and not f2_arg1.skipVideo then
				utils.cp.AliensUtils.AliensPlayIntroVideo( f2_arg1.categoryIndex, f3_local0, {
					name = "button_action",
					target = f1_arg0.Button,
					controller = f2_arg1.controller,
					skipVideo = true
				} )
			elseif Playlist.DoAction( f2_local2, f2_local1 ) then
				MissionDirector.SetCurrentPlaylist( f2_local2, f2_local1 )
				if Engine.IsAliensMode() then
					LUI.FlowManager.RequestAddMenu( "CPPublicMatchMenu", false, f2_arg1.controller, false, {
						openFromPlaylist = true
					} )
				else
					LUI.FlowManager.RequestAddMenu( "LobbyMission", false, f2_arg1.controller, false, {
						openFromPlaylist = true
					} )
				end
			end
		end
		
		local f2_local5 = Playlist.GetLockState( f2_local2, f2_local1 )
		if f2_local5 == f0_local0.LOCKED_DLC_LOCAL then
			local f2_local6 = STORE.GoToStore
			local f2_local7 = f2_arg1.controller
			local f2_local8 = f1_arg0:GetCurrentMenu()
			f2_local6( f2_local7, f2_local8.id, f1_arg0.id, "vip" )
			return 
		elseif f2_local5 ~= f0_local0.UNLOCKED then
			f1_arg0.Button:SetButtonDisabled( true )
			return 
		elseif Engine.IsCoreMode() then
			if f2_local3 and not Engine.GetDvarBool( "wasLastPlaylistCompetitive" ) then
				LUI.FlowManager.RequestPopupMenu( f1_arg0, "PopupYesNo", true, f2_arg1.controller, false, {
					yesAction = f2_local4,
					title = Engine.Localize( "GAME_WARNING" ),
					message = Engine.Localize( "LUA_MENU_MP_LOADOUT_WIPE_WARN_POPUP" )
				} )
				return 
			end
		end
		f2_local4()
	end
	
end

f0_local2 = function ( f4_arg0, f4_arg1, f4_arg2 )
	assert( f4_arg0.DownloadIcon )
	assert( f4_arg0.Button )
	f4_arg0.Button:addEventHandler( "button_action", f0_local1( f4_arg0 ) )
	local f4_local0 = function ()
		if Engine.IsAliensMode() then
			local f5_local0 = f4_arg0:GetDataSource()
			assert( f5_local0 )
			local f5_local1 = f5_local0.listIndex
			assert( f5_local1 )
			local f5_local2 = f5_local0.image:GetValue( f4_arg1 )
			if f5_local1 > 4 then
				if f5_local2 == "grey" then
					f5_local1 = 5
				elseif f5_local2 == "superslasher" then
					f5_local1 = 6
				elseif f5_local2 == "ratking" then
					f5_local1 = 7
				elseif f5_local2 == "crog" then
					f5_local1 = 8
				elseif f5_local2 == "mammoth" then
					f5_local1 = 9
				elseif f5_local2 == "meph" then
					f5_local1 = 10
				end
			end
			Engine.NotifyServer( "map_select", f5_local1 )
			f4_arg0.Button:dispatchEventToCurrentMenu( {
				name = "boss_ID",
				bossSelection = f5_local2
			} )
		end
	end
	
	f4_arg0.Button:addEventHandler( "button_over", f4_local0 )
	f4_arg0.Button:addEventHandler( "button_over_disable", f4_local0 )
	local f4_local1 = function ( f6_arg0 )
		local f6_local0 = f6_arg0:GetDataSource()
		if f6_local0 then
			local f6_local1 = Playlist.GetLockState( f6_local0.categoryIndex:GetValue( f4_arg1 ) + 1, f6_local0.playlistIndex:GetValue( f4_arg1 ) )
			local f6_local2 = f6_local1 == f0_local0.UNLOCKED
			local f6_local3 = f6_local1 == f0_local0.LOCKED_DLC_LOCAL
			local f6_local4 = f6_arg0.Button
			local f6_local5 = f6_local4
			f6_local4 = f6_local4.SetButtonDisabled
			local f6_local6
			if not f6_local2 then
				f6_local6 = not f6_local3
			else
				f6_local6 = false
			end
			f6_local4( f6_local5, f6_local6 )
			f6_local4 = f6_arg0.DownloadIcon
			f6_local5 = f6_local4
			f6_local4 = f6_local4.SetAlpha
			if f6_local3 then
				f6_local6 = 1
				if not f6_local6 then
				
				else
					f6_local4( f6_local5, f6_local6 )
					if f6_local1 == f0_local0.UNLOCKED then
						f6_arg0.Button:SetButtonDescription( "" )
					elseif f6_local1 == f0_local0.LOCKED_DLC_LOCAL then
						f6_arg0.Button:SetButtonDescription( Engine.Localize( "DLC_PLAYLIST_MISSING_MAP_PACK" ) )
					elseif f6_local1 == f0_local0.LOCKED_DLC_PARTY then
						f6_arg0.Button:SetButtonDescription( Engine.Localize( "DLC_NOTEVERYONEHASREQUIREDDLC" ) )
					elseif f6_local1 == f0_local0.LOCKED_MAXPARTY then
						f6_arg0.Button:SetButtonDescription( Engine.Localize( "MPUI_MAXPARTYSIZE", f6_local0.maxPartySize:GetValue( f4_arg1 ) ) )
					elseif f6_local1 == f0_local0.LOCKED_MINPARTY then
						f6_arg0.Button:SetButtonDescription( Engine.Localize( "MPUI_MINPARTYSIZE", f6_local0.minPartySize:GetValue( f4_arg1 ) ) )
					end
				end
			end
			f6_local6 = 0
		end
	end
	
	local f4_local2 = nil
	local f4_local3 = function ( f7_arg0 )
		f4_local1( f7_arg0 )
		local f7_local0 = f7_arg0:Wait( 1000 )
		f7_local0.onComplete = f4_local2
	end
	
	f4_local3( f4_arg0 )
	f4_arg0:SubscribeToDataSourceThroughElement( f4_arg0, nil, function ()
		f4_local1( f4_arg0 )
	end )
end

function PlaylistButton( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 500 * _1080p, 0, 30 * _1080p )
	self.id = "PlaylistButton"
	self._animationSets = {}
	self._sequences = {}
	local f9_local1 = controller and controller.controllerIndex
	if not f9_local1 and not Engine.InFrontend() then
		f9_local1 = self:getRootController()
	end
	assert( f9_local1 )
	local f9_local2 = self
	local Button = nil
	
	Button = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f9_local1
	} )
	Button.id = "Button"
	Button:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, 0, _1080p * 30 )
	Button:SubscribeToModelThroughElement( self, "name", function ()
		local f10_local0 = self:GetDataSource()
		f10_local0 = f10_local0.name:GetValue( f9_local1 )
		if f10_local0 ~= nil then
			Button.Text:setText( ToUpperCase( f10_local0 ), 0 )
		end
	end )
	self:addElement( Button )
	self.Button = Button
	
	local DownloadIcon = nil
	
	DownloadIcon = LUI.UIImage.new()
	DownloadIcon.id = "DownloadIcon"
	DownloadIcon:setImage( RegisterMaterial( "icon_download" ), 0 )
	DownloadIcon:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -80, _1080p * -54, _1080p * -13, _1080p * 13 )
	self:addElement( DownloadIcon )
	self.DownloadIcon = DownloadIcon
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		DownloadIcon:RegisterAnimationSequence( "IsArabic", {
			{
				function ()
					return self.DownloadIcon:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -489, _1080p * -463, _1080p * -13, _1080p * 13, 0 )
				end
			}
		} )
		self._sequences.IsArabic = function ()
			DownloadIcon:AnimateSequence( "IsArabic" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local2( self, f9_local1, controller )
	if CONDITIONS.IsArabic( self ) then
		ACTIONS.AnimateSequence( self, "IsArabic" )
	end
	return self
end

MenuBuilder.registerType( "PlaylistButton", PlaylistButton )
LockTable( _M )
