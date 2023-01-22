local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = nil
	if Engine.GetPlayerDataEx( f1_arg1, CoD.StatsGroup.Coop, "zombiePlayerLoadout", "lobbySong" ) == 22 then
		f1_arg0.Stamp:SetAlpha( 1, 0 )
		f1_arg0.Shuffling:SetAlpha( 1, 0 )
	end
	local f1_local1 = Engine.GetPlayerDataEx( f1_arg1, CoD.StatsGroup.Coop, "hasSongsUnlocked", "any_song" )
	f1_arg0.addButtonHelperFunction = function ( f2_arg0, f2_arg1 )
		f2_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			clickable = true
		} )
		if f1_local1 == true then
			f2_arg0:AddButtonHelperText( {
				helper_text = Engine.Localize( "LUA_MENU_ZM_SHUFFLE" ),
				button_ref = "button_alt1",
				side = "left",
				clickable = true
			} )
		end
	end
	
	f1_arg0:addEventHandler( "menu_create", f1_arg0.addButtonHelperFunction )
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	f1_arg0:addElement( bindButton )
	f1_arg0.bindButton = bindButton
	
	f1_arg0.bindButton:addEventHandler( "button_secondary", function ( f3_arg0, f3_arg1 )
		local f3_local0 = f3_arg1.controller or f1_arg1
		ACTIONS.LeaveMenu( f1_arg0 )
	end )
	if f1_local1 == true then
		f1_arg0.bindButton:addEventHandler( "button_alt1", function ( f4_arg0, f4_arg1 )
			ACTIONS.SetZombiesLobbyMusic( f1_arg0, "22", f4_arg1.controller or f1_arg1 )
		end )
	end
end

function CPLobbyMusicMenu( menu, controller )
	local self = LUI.UIVerticalNavigator.new()
	self.id = "CPLobbyMusicMenu"
	self._animationSets = {}
	self._sequences = {}
	local f5_local1 = controller and controller.controllerIndex
	if not f5_local1 and not Engine.InFrontend() then
		f5_local1 = self:getRootController()
	end
	assert( f5_local1 )
	self:playSound( "menu_open" )
	local f5_local2 = self
	local CPMenuTitle = nil
	
	CPMenuTitle = MenuBuilder.BuildRegisteredType( "CPMenuTitle", {
		controllerIndex = f5_local1
	} )
	CPMenuTitle.id = "CPMenuTitle"
	CPMenuTitle.MenuTitle:setText( ToUpperCase( Engine.Localize( "LUA_MENU_ZM_LOBBY_MUSIC" ) ), 0 )
	CPMenuTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
	self:addElement( CPMenuTitle )
	self.CPMenuTitle = CPMenuTitle
	
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f5_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local FriendsElement = nil
	
	FriendsElement = MenuBuilder.BuildRegisteredType( "online_friends_widget", {
		controllerIndex = f5_local1
	} )
	FriendsElement.id = "FriendsElement"
	FriendsElement:SetFont( FONTS.GetFont( FONTS.Dev.File ) )
	FriendsElement:SetAlignment( LUI.Alignment.Left )
	FriendsElement:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -500, 0, _1080p * -45, 0 )
	self:addElement( FriendsElement )
	self.FriendsElement = FriendsElement
	
	local CPLobbySecretSongButtons = nil
	
	CPLobbySecretSongButtons = MenuBuilder.BuildRegisteredType( "CPLobbySecretSongButtons", {
		controllerIndex = f5_local1
	} )
	CPLobbySecretSongButtons.id = "CPLobbySecretSongButtons"
	CPLobbySecretSongButtons:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 131, _1080p * 1046, _1080p * 200, _1080p * 719 )
	self:addElement( CPLobbySecretSongButtons )
	self.CPLobbySecretSongButtons = CPLobbySecretSongButtons
	
	local Stamp = nil
	
	Stamp = LUI.UIImage.new()
	Stamp.id = "Stamp"
	Stamp:SetAlpha( 0, 0 )
	Stamp:SetScale( 0.36, 0 )
	Stamp:setImage( RegisterMaterial( "zm_directors_cut_stamp" ), 0 )
	Stamp:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 660, _1080p * 788, _1080p * 211, _1080p * 275 )
	self:addElement( Stamp )
	self.Stamp = Stamp
	
	local Shuffling = nil
	
	Shuffling = LUI.UIText.new()
	Shuffling.id = "Shuffling"
	Shuffling:SetRGBFromInt( 15548470, 0 )
	Shuffling:SetAlpha( 0, 0 )
	Shuffling:SetZRotation( 10, 0 )
	Shuffling:setText( ToUpperCase( Engine.Localize( "LUA_MENU_ZM_SHUFFLING" ) ), 0 )
	Shuffling:SetFontSize( 30 * _1080p )
	Shuffling:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Shuffling:SetAlignment( LUI.Alignment.Center )
	Shuffling:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 472.32, _1080p * 972.32, _1080p * 225, _1080p * 255 )
	self:addElement( Shuffling )
	self.Shuffling = Shuffling
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Stamp:RegisterAnimationSequence( "shufflingOn", {
			{
				function ()
					return self.Stamp:SetAlpha( 1, 0 )
				end
			}
		} )
		Shuffling:RegisterAnimationSequence( "shufflingOn", {
			{
				function ()
					return self.Shuffling:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.shufflingOn = function ()
			Stamp:AnimateSequence( "shufflingOn" )
			Shuffling:AnimateSequence( "shufflingOn" )
		end
		
		Stamp:RegisterAnimationSequence( "shufflingOff", {
			{
				function ()
					return self.Stamp:SetAlpha( 0, 0 )
				end
			}
		} )
		Shuffling:RegisterAnimationSequence( "shufflingOff", {
			{
				function ()
					return self.Shuffling:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.shufflingOff = function ()
			Stamp:AnimateSequence( "shufflingOff" )
			Shuffling:AnimateSequence( "shufflingOff" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.frontEnd.CP.songs.lobbyMusicIndex:GetModel( f5_local1 ), function ()
		if CONDITIONS.IsShuffleOn( f5_local1 ) then
			ACTIONS.AnimateSequence( self, "shufflingOn" )
		end
		if not CONDITIONS.IsShuffleOn( f5_local1 ) then
			ACTIONS.AnimateSequence( self, "shufflingOff" )
		end
	end )
	f0_local0( self, f5_local1, controller )
	return self
end

MenuBuilder.registerType( "CPLobbyMusicMenu", CPLobbyMusicMenu )
LockTable( _M )
