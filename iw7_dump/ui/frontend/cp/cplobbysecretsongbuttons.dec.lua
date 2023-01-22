local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function CPLobbySecretSongButtons( menu, controller )
	local self = LUI.UIVerticalList.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 453 * _1080p, 0, 935 * _1080p )
	self.id = "CPLobbySecretSongButtons"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	self:SetSpacing( 5 * _1080p )
	local OriginalSong = nil
	
	OriginalSong = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f1_local1
	} )
	OriginalSong.id = "OriginalSong"
	OriginalSong.buttonDescription = Engine.Localize( "LUA_MENU_ZM_SECRET_SONG_DESC" )
	OriginalSong.Text:setText( Engine.Localize( "LUA_MENU_ZM_SECRET_SONG_0" ), 0 )
	OriginalSong:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, 0, _1080p * 30 )
	self:addElement( OriginalSong )
	self.OriginalSong = OriginalSong
	
	local f1_local4 = nil
	if DataSources.frontEnd.CP.songs.hasSong1Unlocked:GetValue( f1_local1 ) ~= nil and DataSources.frontEnd.CP.songs.hasSong1Unlocked:GetValue( f1_local1 ) == 1 then
		f1_local4 = MenuBuilder.BuildRegisteredType( "GenericButton", {
			controllerIndex = f1_local1
		} )
		f1_local4.id = "Song1"
		if DataSources.frontEnd.CP.songs.hasSong1Unlocked:GetValue( f1_local1 ) ~= nil and DataSources.frontEnd.CP.songs.hasSong1Unlocked:GetValue( f1_local1 ) == 1 then
			
		else
			
		end
		if DataSources.frontEnd.CP.songs.hasSong1Unlocked:GetValue( f1_local1 ) ~= nil and DataSources.frontEnd.CP.songs.hasSong1Unlocked:GetValue( f1_local1 ) == 1 then
			f1_local4.buttonDescription = Engine.Localize( "LUA_MENU_ZM_SECRET_SONG_DESC" )
		end
		f1_local4.Text:setText( Engine.Localize( "LUA_MENU_ZM_SECRET_SONG_1" ), 0 )
		f1_local4:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, _1080p * 35, _1080p * 65 )
		self:addElement( f1_local4 )
		self.Song1 = f1_local4
	end
	local f1_local5 = nil
	if DataSources.frontEnd.CP.songs.hasSong2Unlocked:GetValue( f1_local1 ) ~= nil and DataSources.frontEnd.CP.songs.hasSong2Unlocked:GetValue( f1_local1 ) == 1 then
		f1_local5 = MenuBuilder.BuildRegisteredType( "GenericButton", {
			controllerIndex = f1_local1
		} )
		f1_local5.id = "Song2"
		if DataSources.frontEnd.CP.songs.hasSong2Unlocked:GetValue( f1_local1 ) ~= nil and DataSources.frontEnd.CP.songs.hasSong2Unlocked:GetValue( f1_local1 ) == 1 then
			
		else
			
		end
		if DataSources.frontEnd.CP.songs.hasSong2Unlocked:GetValue( f1_local1 ) ~= nil and DataSources.frontEnd.CP.songs.hasSong2Unlocked:GetValue( f1_local1 ) == 1 then
			f1_local5.buttonDescription = Engine.Localize( "LUA_MENU_ZM_SECRET_SONG_DESC" )
		end
		f1_local5.Text:setText( Engine.Localize( "LUA_MENU_ZM_SECRET_SONG_2" ), 0 )
		f1_local5:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, _1080p * 70, _1080p * 100 )
		self:addElement( f1_local5 )
		self.Song2 = f1_local5
	end
	local f1_local6 = nil
	if DataSources.frontEnd.CP.songs.hasSong3Unlocked:GetValue( f1_local1 ) ~= nil and DataSources.frontEnd.CP.songs.hasSong3Unlocked:GetValue( f1_local1 ) == 1 then
		f1_local6 = MenuBuilder.BuildRegisteredType( "GenericButton", {
			controllerIndex = f1_local1
		} )
		f1_local6.id = "Song3"
		if DataSources.frontEnd.CP.songs.hasSong3Unlocked:GetValue( f1_local1 ) ~= nil and DataSources.frontEnd.CP.songs.hasSong3Unlocked:GetValue( f1_local1 ) == 1 then
			
		else
			
		end
		if DataSources.frontEnd.CP.songs.hasSong3Unlocked:GetValue( f1_local1 ) ~= nil and DataSources.frontEnd.CP.songs.hasSong3Unlocked:GetValue( f1_local1 ) == 1 then
			f1_local6.buttonDescription = Engine.Localize( "LUA_MENU_ZM_SECRET_SONG_DESC" )
		end
		f1_local6.Text:setText( Engine.Localize( "LUA_MENU_ZM_SECRET_SONG_3" ), 0 )
		f1_local6:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, _1080p * 105, _1080p * 135 )
		self:addElement( f1_local6 )
		self.Song3 = f1_local6
	end
	local f1_local7 = nil
	if DataSources.frontEnd.CP.songs.hasSong4Unlocked:GetValue( f1_local1 ) ~= nil and DataSources.frontEnd.CP.songs.hasSong4Unlocked:GetValue( f1_local1 ) == 1 then
		f1_local7 = MenuBuilder.BuildRegisteredType( "GenericButton", {
			controllerIndex = f1_local1
		} )
		f1_local7.id = "Song4"
		if DataSources.frontEnd.CP.songs.hasSong4Unlocked:GetValue( f1_local1 ) ~= nil and DataSources.frontEnd.CP.songs.hasSong4Unlocked:GetValue( f1_local1 ) == 1 then
			
		else
			
		end
		if DataSources.frontEnd.CP.songs.hasSong4Unlocked:GetValue( f1_local1 ) ~= nil and DataSources.frontEnd.CP.songs.hasSong4Unlocked:GetValue( f1_local1 ) == 1 then
			
		else
			
		end
		f1_local7.Text:setText( Engine.Localize( "LUA_MENU_ZM_SECRET_SONG_4" ), 0 )
		f1_local7:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, _1080p * 140, _1080p * 170 )
		self:addElement( f1_local7 )
		self.Song4 = f1_local7
	end
	local f1_local8 = nil
	if DataSources.frontEnd.CP.songs.hasSong5Unlocked:GetValue( f1_local1 ) ~= nil and DataSources.frontEnd.CP.songs.hasSong5Unlocked:GetValue( f1_local1 ) == 1 then
		f1_local8 = MenuBuilder.BuildRegisteredType( "GenericButton", {
			controllerIndex = f1_local1
		} )
		f1_local8.id = "Song5"
		if DataSources.frontEnd.CP.songs.hasSong5Unlocked:GetValue( f1_local1 ) ~= nil and DataSources.frontEnd.CP.songs.hasSong5Unlocked:GetValue( f1_local1 ) == 1 then
			
		else
			
		end
		if DataSources.frontEnd.CP.songs.hasSong5Unlocked:GetValue( f1_local1 ) ~= nil and DataSources.frontEnd.CP.songs.hasSong5Unlocked:GetValue( f1_local1 ) == 1 then
			
		else
			
		end
		f1_local8.Text:setText( Engine.Localize( "LUA_MENU_ZM_SECRET_SONG_5" ), 0 )
		f1_local8:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, _1080p * 175, _1080p * 205 )
		self:addElement( f1_local8 )
		self.Song5 = f1_local8
	end
	local f1_local9 = nil
	if DataSources.frontEnd.CP.songs.hasSong6Unlocked:GetValue( f1_local1 ) ~= nil and DataSources.frontEnd.CP.songs.hasSong6Unlocked:GetValue( f1_local1 ) == 1 then
		f1_local9 = MenuBuilder.BuildRegisteredType( "GenericButton", {
			controllerIndex = f1_local1
		} )
		f1_local9.id = "Song6"
		if DataSources.frontEnd.CP.songs.hasSong6Unlocked:GetValue( f1_local1 ) ~= nil and DataSources.frontEnd.CP.songs.hasSong6Unlocked:GetValue( f1_local1 ) == 1 then
			
		else
			
		end
		if DataSources.frontEnd.CP.songs.hasSong6Unlocked:GetValue( f1_local1 ) ~= nil and DataSources.frontEnd.CP.songs.hasSong6Unlocked:GetValue( f1_local1 ) == 1 then
			f1_local9.buttonDescription = Engine.Localize( "LUA_MENU_ZM_SECRET_SONG_DESC" )
		end
		f1_local9.Text:setText( Engine.Localize( "LUA_MENU_ZM_SECRET_SONG_6" ), 0 )
		f1_local9:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, _1080p * 210, _1080p * 240 )
		self:addElement( f1_local9 )
		self.Song6 = f1_local9
	end
	local f1_local10 = nil
	if DataSources.frontEnd.CP.songs.hasSong7Unlocked:GetValue( f1_local1 ) ~= nil and DataSources.frontEnd.CP.songs.hasSong7Unlocked:GetValue( f1_local1 ) == 1 then
		f1_local10 = MenuBuilder.BuildRegisteredType( "GenericButton", {
			controllerIndex = f1_local1
		} )
		f1_local10.id = "Song7"
		if DataSources.frontEnd.CP.songs.hasSong7Unlocked:GetValue( f1_local1 ) ~= nil and DataSources.frontEnd.CP.songs.hasSong7Unlocked:GetValue( f1_local1 ) == 1 then
			
		else
			
		end
		if DataSources.frontEnd.CP.songs.hasSong7Unlocked:GetValue( f1_local1 ) ~= nil and DataSources.frontEnd.CP.songs.hasSong7Unlocked:GetValue( f1_local1 ) == 1 then
			f1_local10.buttonDescription = Engine.Localize( "LUA_MENU_ZM_SECRET_SONG_DESC" )
		end
		f1_local10.Text:setText( Engine.Localize( "ZM_SPACELAND_MUSIC_UP_N_ATOMS" ), 0 )
		f1_local10:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, _1080p * 245, _1080p * 275 )
		self:addElement( f1_local10 )
		self.Song7 = f1_local10
	end
	local f1_local11 = nil
	if DataSources.frontEnd.CP.songs.hasSong7Unlocked:GetValue( f1_local1 ) ~= nil and DataSources.frontEnd.CP.songs.hasSong7Unlocked:GetValue( f1_local1 ) == 1 then
		f1_local11 = MenuBuilder.BuildRegisteredType( "GenericButton", {
			controllerIndex = f1_local1
		} )
		f1_local11.id = "Song8"
		if DataSources.frontEnd.CP.songs.hasSong7Unlocked:GetValue( f1_local1 ) ~= nil and DataSources.frontEnd.CP.songs.hasSong7Unlocked:GetValue( f1_local1 ) == 1 then
			
		else
			
		end
		if DataSources.frontEnd.CP.songs.hasSong7Unlocked:GetValue( f1_local1 ) ~= nil and DataSources.frontEnd.CP.songs.hasSong7Unlocked:GetValue( f1_local1 ) == 1 then
			f1_local11.buttonDescription = Engine.Localize( "LUA_MENU_ZM_SECRET_SONG_DESC" )
		end
		f1_local11.Text:setText( Engine.Localize( "ZM_SPACELAND_MUSIC_RACING_STRIPES" ), 0 )
		f1_local11:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, _1080p * 280, _1080p * 310 )
		self:addElement( f1_local11 )
		self.Song8 = f1_local11
	end
	local f1_local12 = nil
	if DataSources.frontEnd.CP.songs.hasSong7Unlocked:GetValue( f1_local1 ) ~= nil and DataSources.frontEnd.CP.songs.hasSong7Unlocked:GetValue( f1_local1 ) == 1 then
		f1_local12 = MenuBuilder.BuildRegisteredType( "GenericButton", {
			controllerIndex = f1_local1
		} )
		f1_local12.id = "Song9"
		if DataSources.frontEnd.CP.songs.hasSong7Unlocked:GetValue( f1_local1 ) ~= nil and DataSources.frontEnd.CP.songs.hasSong7Unlocked:GetValue( f1_local1 ) == 1 then
			
		else
			
		end
		if DataSources.frontEnd.CP.songs.hasSong7Unlocked:GetValue( f1_local1 ) ~= nil and DataSources.frontEnd.CP.songs.hasSong7Unlocked:GetValue( f1_local1 ) == 1 then
			f1_local12.buttonDescription = Engine.Localize( "LUA_MENU_ZM_SECRET_SONG_DESC" )
		end
		f1_local12.Text:setText( Engine.Localize( "ZM_SPACELAND_MUSIC_SLAPPY_TAFFY" ), 0 )
		f1_local12:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, _1080p * 315, _1080p * 345 )
		self:addElement( f1_local12 )
		self.Song9 = f1_local12
	end
	local f1_local13 = nil
	if DataSources.frontEnd.CP.songs.hasSong8Unlocked:GetValue( f1_local1 ) ~= nil and DataSources.frontEnd.CP.songs.hasSong8Unlocked:GetValue( f1_local1 ) == 1 then
		f1_local13 = MenuBuilder.BuildRegisteredType( "GenericButton", {
			controllerIndex = f1_local1
		} )
		f1_local13.id = "Song10"
		if DataSources.frontEnd.CP.songs.hasSong8Unlocked:GetValue( f1_local1 ) ~= nil and DataSources.frontEnd.CP.songs.hasSong8Unlocked:GetValue( f1_local1 ) == 1 then
			
		else
			
		end
		if DataSources.frontEnd.CP.songs.hasSong8Unlocked:GetValue( f1_local1 ) ~= nil and DataSources.frontEnd.CP.songs.hasSong8Unlocked:GetValue( f1_local1 ) == 1 then
			f1_local13.buttonDescription = Engine.Localize( "LUA_MENU_ZM_SECRET_SONG_DESC" )
		end
		f1_local13.Text:setText( Engine.Localize( "ZM_SPACELAND_MUSIC_BOMBSTOPPERS" ), 0 )
		f1_local13:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, _1080p * 350, _1080p * 380 )
		self:addElement( f1_local13 )
		self.Song10 = f1_local13
	end
	local f1_local14 = nil
	if DataSources.frontEnd.CP.songs.hasSong8Unlocked:GetValue( f1_local1 ) ~= nil and DataSources.frontEnd.CP.songs.hasSong8Unlocked:GetValue( f1_local1 ) == 1 then
		f1_local14 = MenuBuilder.BuildRegisteredType( "GenericButton", {
			controllerIndex = f1_local1
		} )
		f1_local14.id = "Song11"
		if DataSources.frontEnd.CP.songs.hasSong8Unlocked:GetValue( f1_local1 ) ~= nil and DataSources.frontEnd.CP.songs.hasSong8Unlocked:GetValue( f1_local1 ) == 1 then
			
		else
			
		end
		if DataSources.frontEnd.CP.songs.hasSong8Unlocked:GetValue( f1_local1 ) ~= nil and DataSources.frontEnd.CP.songs.hasSong8Unlocked:GetValue( f1_local1 ) == 1 then
			f1_local14.buttonDescription = Engine.Localize( "LUA_MENU_ZM_SECRET_SONG_DESC" )
		end
		f1_local14.Text:setText( Engine.Localize( "ZM_SPACELAND_MUSIC_TUFF_NUFF" ), 0 )
		f1_local14:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, _1080p * 385, _1080p * 415 )
		self:addElement( f1_local14 )
		self.Song11 = f1_local14
	end
	local f1_local15 = nil
	if DataSources.frontEnd.CP.songs.hasSong8Unlocked:GetValue( f1_local1 ) ~= nil and DataSources.frontEnd.CP.songs.hasSong8Unlocked:GetValue( f1_local1 ) == 1 then
		f1_local15 = MenuBuilder.BuildRegisteredType( "GenericButton", {
			controllerIndex = f1_local1
		} )
		f1_local15.id = "Song12"
		if DataSources.frontEnd.CP.songs.hasSong8Unlocked:GetValue( f1_local1 ) ~= nil and DataSources.frontEnd.CP.songs.hasSong8Unlocked:GetValue( f1_local1 ) == 1 then
			
		else
			
		end
		if DataSources.frontEnd.CP.songs.hasSong8Unlocked:GetValue( f1_local1 ) ~= nil and DataSources.frontEnd.CP.songs.hasSong8Unlocked:GetValue( f1_local1 ) == 1 then
			f1_local15.buttonDescription = Engine.Localize( "LUA_MENU_ZM_SECRET_SONG_DESC" )
		end
		f1_local15.Text:setText( Engine.Localize( "ZM_SPACELAND_MUSIC_BANG_BANGS" ), 0 )
		f1_local15:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, _1080p * 420, _1080p * 450 )
		self:addElement( f1_local15 )
		self.Song12 = f1_local15
	end
	local f1_local16 = nil
	if DataSources.frontEnd.CP.songs.hasSong9Unlocked:GetValue( f1_local1 ) ~= nil and DataSources.frontEnd.CP.songs.hasSong9Unlocked:GetValue( f1_local1 ) == 1 then
		f1_local16 = MenuBuilder.BuildRegisteredType( "GenericButton", {
			controllerIndex = f1_local1
		} )
		f1_local16.id = "Song13"
		if DataSources.frontEnd.CP.songs.hasSong9Unlocked:GetValue( f1_local1 ) ~= nil and DataSources.frontEnd.CP.songs.hasSong9Unlocked:GetValue( f1_local1 ) == 1 then
			
		else
			
		end
		if DataSources.frontEnd.CP.songs.hasSong9Unlocked:GetValue( f1_local1 ) ~= nil and DataSources.frontEnd.CP.songs.hasSong9Unlocked:GetValue( f1_local1 ) == 1 then
			f1_local16.buttonDescription = Engine.Localize( "LUA_MENU_ZM_SECRET_SONG_DESC" )
		end
		f1_local16.Text:setText( Engine.Localize( "LUA_MENU_ZM_DEADEYE" ), 0 )
		f1_local16:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, _1080p * 455, _1080p * 485 )
		self:addElement( f1_local16 )
		self.Song13 = f1_local16
	end
	local f1_local17 = nil
	if DataSources.frontEnd.CP.songs.hasSong9Unlocked:GetValue( f1_local1 ) ~= nil and DataSources.frontEnd.CP.songs.hasSong9Unlocked:GetValue( f1_local1 ) == 1 then
		f1_local17 = MenuBuilder.BuildRegisteredType( "GenericButton", {
			controllerIndex = f1_local1
		} )
		f1_local17.id = "Song14"
		if DataSources.frontEnd.CP.songs.hasSong9Unlocked:GetValue( f1_local1 ) ~= nil and DataSources.frontEnd.CP.songs.hasSong9Unlocked:GetValue( f1_local1 ) == 1 then
			
		else
			
		end
		if DataSources.frontEnd.CP.songs.hasSong9Unlocked:GetValue( f1_local1 ) ~= nil and DataSources.frontEnd.CP.songs.hasSong9Unlocked:GetValue( f1_local1 ) == 1 then
			f1_local17.buttonDescription = Engine.Localize( "LUA_MENU_ZM_SECRET_SONG_DESC" )
		end
		f1_local17.Text:setText( Engine.Localize( "ZM_SPACELAND_MUSIC_QUICKIES" ), 0 )
		f1_local17:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, _1080p * 490, _1080p * 520 )
		self:addElement( f1_local17 )
		self.Song14 = f1_local17
	end
	local f1_local18 = nil
	if DataSources.frontEnd.CP.songs.hasSong9Unlocked:GetValue( f1_local1 ) ~= nil and DataSources.frontEnd.CP.songs.hasSong9Unlocked:GetValue( f1_local1 ) == 1 then
		f1_local18 = MenuBuilder.BuildRegisteredType( "GenericButton", {
			controllerIndex = f1_local1
		} )
		f1_local18.id = "Song15"
		if DataSources.frontEnd.CP.songs.hasSong9Unlocked:GetValue( f1_local1 ) ~= nil and DataSources.frontEnd.CP.songs.hasSong9Unlocked:GetValue( f1_local1 ) == 1 then
			
		else
			
		end
		if DataSources.frontEnd.CP.songs.hasSong9Unlocked:GetValue( f1_local1 ) ~= nil and DataSources.frontEnd.CP.songs.hasSong9Unlocked:GetValue( f1_local1 ) == 1 then
			f1_local18.buttonDescription = Engine.Localize( "LUA_MENU_ZM_SECRET_SONG_DESC" )
		end
		f1_local18.Text:setText( Engine.Localize( "ZM_SPACELAND_MUSIC_MULE_MUNCHIES" ), 0 )
		f1_local18:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, _1080p * 525, _1080p * 555 )
		self:addElement( f1_local18 )
		self.Song15 = f1_local18
	end
	local f1_local19 = nil
	if DataSources.frontEnd.CP.songs.hasSong10Unlocked:GetValue( f1_local1 ) ~= nil and DataSources.frontEnd.CP.songs.hasSong10Unlocked:GetValue( f1_local1 ) == 1 then
		f1_local19 = MenuBuilder.BuildRegisteredType( "GenericButton", {
			controllerIndex = f1_local1
		} )
		f1_local19.id = "Song16"
		if DataSources.frontEnd.CP.songs.hasSong10Unlocked:GetValue( f1_local1 ) ~= nil and DataSources.frontEnd.CP.songs.hasSong10Unlocked:GetValue( f1_local1 ) == 1 then
			
		else
			
		end
		if DataSources.frontEnd.CP.songs.hasSong10Unlocked:GetValue( f1_local1 ) ~= nil and DataSources.frontEnd.CP.songs.hasSong10Unlocked:GetValue( f1_local1 ) == 1 then
			f1_local19.buttonDescription = Engine.Localize( "LUA_MENU_ZM_SECRET_SONG_DESC" )
		end
		f1_local19.Text:setText( Engine.Localize( "ZM_SPACELAND_MUSIC_TRAIL_BLAZERS" ), 0 )
		f1_local19:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, _1080p * 560, _1080p * 590 )
		self:addElement( f1_local19 )
		self.Song16 = f1_local19
	end
	local f1_local20 = nil
	if DataSources.frontEnd.CP.songs.hasSong10Unlocked:GetValue( f1_local1 ) ~= nil and DataSources.frontEnd.CP.songs.hasSong10Unlocked:GetValue( f1_local1 ) == 1 then
		f1_local20 = MenuBuilder.BuildRegisteredType( "GenericButton", {
			controllerIndex = f1_local1
		} )
		f1_local20.id = "Song17"
		if DataSources.frontEnd.CP.songs.hasSong10Unlocked:GetValue( f1_local1 ) ~= nil and DataSources.frontEnd.CP.songs.hasSong10Unlocked:GetValue( f1_local1 ) == 1 then
			
		else
			
		end
		if DataSources.frontEnd.CP.songs.hasSong10Unlocked:GetValue( f1_local1 ) ~= nil and DataSources.frontEnd.CP.songs.hasSong10Unlocked:GetValue( f1_local1 ) == 1 then
			f1_local20.buttonDescription = Engine.Localize( "LUA_MENU_ZM_SECRET_SONG_DESC" )
		end
		f1_local20.Text:setText( Engine.Localize( "ZM_SPACELAND_MUSIC_BLUE_BOLTS" ), 0 )
		f1_local20:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, _1080p * 595, _1080p * 625 )
		self:addElement( f1_local20 )
		self.Song17 = f1_local20
	end
	local f1_local21 = nil
	if DataSources.frontEnd.CP.songs.hasSong10Unlocked:GetValue( f1_local1 ) ~= nil and DataSources.frontEnd.CP.songs.hasSong10Unlocked:GetValue( f1_local1 ) == 1 then
		f1_local21 = MenuBuilder.BuildRegisteredType( "GenericButton", {
			controllerIndex = f1_local1
		} )
		f1_local21.id = "Song18"
		if DataSources.frontEnd.CP.songs.hasSong10Unlocked:GetValue( f1_local1 ) ~= nil and DataSources.frontEnd.CP.songs.hasSong10Unlocked:GetValue( f1_local1 ) == 1 then
			
		else
			
		end
		if DataSources.frontEnd.CP.songs.hasSong10Unlocked:GetValue( f1_local1 ) ~= nil and DataSources.frontEnd.CP.songs.hasSong10Unlocked:GetValue( f1_local1 ) == 1 then
			f1_local21.buttonDescription = Engine.Localize( "LUA_MENU_ZM_SECRET_SONG_DESC" )
		end
		f1_local21.Text:setText( Engine.Localize( "LUA_MENU_ZM_CHANGE_CHEWS" ), 0 )
		f1_local21:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, _1080p * 630, _1080p * 660 )
		self:addElement( f1_local21 )
		self.Song18 = f1_local21
	end
	local f1_local22 = nil
	if DataSources.frontEnd.CP.songs.hasSong11Unlocked:GetValue( f1_local1 ) ~= nil and DataSources.frontEnd.CP.songs.hasSong11Unlocked:GetValue( f1_local1 ) == 1 then
		f1_local22 = MenuBuilder.BuildRegisteredType( "GenericButton", {
			controllerIndex = f1_local1
		} )
		f1_local22.id = "Song19"
		if DataSources.frontEnd.CP.songs.hasSong11Unlocked:GetValue( f1_local1 ) ~= nil and DataSources.frontEnd.CP.songs.hasSong11Unlocked:GetValue( f1_local1 ) == 1 then
			
		else
			
		end
		if DataSources.frontEnd.CP.songs.hasSong11Unlocked:GetValue( f1_local1 ) ~= nil and DataSources.frontEnd.CP.songs.hasSong11Unlocked:GetValue( f1_local1 ) == 1 then
			f1_local22.buttonDescription = Engine.Localize( "LUA_MENU_ZM_SECRET_SONG_DESC" )
		end
		f1_local22.Text:setText( Engine.Localize( "LUA_MENU_ZM_MEPH_MUSIC" ), 0 )
		f1_local22:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, _1080p * 665, _1080p * 695 )
		self:addElement( f1_local22 )
		self.Song19 = f1_local22
	end
	local f1_local23 = nil
	if DataSources.frontEnd.CP.songs.hasSong11Unlocked:GetValue( f1_local1 ) ~= nil and DataSources.frontEnd.CP.songs.hasSong11Unlocked:GetValue( f1_local1 ) == 1 then
		f1_local23 = MenuBuilder.BuildRegisteredType( "GenericButton", {
			controllerIndex = f1_local1
		} )
		f1_local23.id = "Song20"
		if DataSources.frontEnd.CP.songs.hasSong11Unlocked:GetValue( f1_local1 ) ~= nil and DataSources.frontEnd.CP.songs.hasSong11Unlocked:GetValue( f1_local1 ) == 1 then
			
		else
			
		end
		if DataSources.frontEnd.CP.songs.hasSong11Unlocked:GetValue( f1_local1 ) ~= nil and DataSources.frontEnd.CP.songs.hasSong11Unlocked:GetValue( f1_local1 ) == 1 then
			f1_local23.buttonDescription = Engine.Localize( "LUA_MENU_ZM_SECRET_SONG_DESC" )
		end
		f1_local23.Text:setText( Engine.Localize( "LUA_MENU_ZM_AFTERLIFE_MUUSIC" ), 0 )
		f1_local23:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, _1080p * 700, _1080p * 730 )
		self:addElement( f1_local23 )
		self.Song20 = f1_local23
	end
	local f1_local24 = nil
	if DataSources.frontEnd.CP.songs.hasSong11Unlocked:GetValue( f1_local1 ) ~= nil and DataSources.frontEnd.CP.songs.hasSong11Unlocked:GetValue( f1_local1 ) == 1 then
		f1_local24 = MenuBuilder.BuildRegisteredType( "GenericButton", {
			controllerIndex = f1_local1
		} )
		f1_local24.id = "Song21"
		if DataSources.frontEnd.CP.songs.hasSong11Unlocked:GetValue( f1_local1 ) ~= nil and DataSources.frontEnd.CP.songs.hasSong11Unlocked:GetValue( f1_local1 ) == 1 then
			
		else
			
		end
		if DataSources.frontEnd.CP.songs.hasSong11Unlocked:GetValue( f1_local1 ) ~= nil and DataSources.frontEnd.CP.songs.hasSong11Unlocked:GetValue( f1_local1 ) == 1 then
			f1_local24.buttonDescription = Engine.Localize( "LUA_MENU_ZM_SECRET_SONG_DESC" )
		end
		f1_local24.Text:setText( Engine.Localize( "LUA_MENU_ZM_EXTINCTION_MUSIC" ), 0 )
		f1_local24:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, _1080p * 735, _1080p * 765 )
		self:addElement( f1_local24 )
		self.Song21 = f1_local24
	end
	local ButtonDescription = nil
	
	ButtonDescription = MenuBuilder.BuildRegisteredType( "ButtonDescriptionText", {
		controllerIndex = f1_local1
	} )
	ButtonDescription.id = "ButtonDescription"
	ButtonDescription.Description:SetRight( _1080p * 415, 0 )
	ButtonDescription:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 600, _1080p * 770, _1080p * 807 )
	self:addElement( ButtonDescription )
	self.ButtonDescription = ButtonDescription
	
	OriginalSong:addEventHandler( "button_action", function ( f2_arg0, f2_arg1 )
		ACTIONS.SetZombiesLobbyMusic( self, "0", f2_arg1.controller or f1_local1 )
	end )
	if DataSources.frontEnd.CP.songs.hasSong1Unlocked:GetValue( f1_local1 ) ~= nil and DataSources.frontEnd.CP.songs.hasSong1Unlocked:GetValue( f1_local1 ) == 1 then
		f1_local4:addEventHandler( "button_action", function ( f3_arg0, f3_arg1 )
			ACTIONS.SetZombiesLobbyMusic( self, "1", f3_arg1.controller or f1_local1 )
		end )
	end
	if DataSources.frontEnd.CP.songs.hasSong2Unlocked:GetValue( f1_local1 ) ~= nil and DataSources.frontEnd.CP.songs.hasSong2Unlocked:GetValue( f1_local1 ) == 1 then
		f1_local5:addEventHandler( "button_action", function ( f4_arg0, f4_arg1 )
			ACTIONS.SetZombiesLobbyMusic( self, "2", f4_arg1.controller or f1_local1 )
		end )
	end
	if DataSources.frontEnd.CP.songs.hasSong3Unlocked:GetValue( f1_local1 ) ~= nil and DataSources.frontEnd.CP.songs.hasSong3Unlocked:GetValue( f1_local1 ) == 1 then
		f1_local6:addEventHandler( "button_action", function ( f5_arg0, f5_arg1 )
			ACTIONS.SetZombiesLobbyMusic( self, "3", f5_arg1.controller or f1_local1 )
		end )
	end
	if DataSources.frontEnd.CP.songs.hasSong4Unlocked:GetValue( f1_local1 ) ~= nil and DataSources.frontEnd.CP.songs.hasSong4Unlocked:GetValue( f1_local1 ) == 1 then
		f1_local7:addEventHandler( "button_action", function ( f6_arg0, f6_arg1 )
			ACTIONS.SetZombiesLobbyMusic( self, "4", f6_arg1.controller or f1_local1 )
		end )
	end
	if DataSources.frontEnd.CP.songs.hasSong5Unlocked:GetValue( f1_local1 ) ~= nil and DataSources.frontEnd.CP.songs.hasSong5Unlocked:GetValue( f1_local1 ) == 1 then
		f1_local8:addEventHandler( "button_action", function ( f7_arg0, f7_arg1 )
			ACTIONS.SetZombiesLobbyMusic( self, "5", f7_arg1.controller or f1_local1 )
		end )
	end
	if DataSources.frontEnd.CP.songs.hasSong6Unlocked:GetValue( f1_local1 ) ~= nil and DataSources.frontEnd.CP.songs.hasSong6Unlocked:GetValue( f1_local1 ) == 1 then
		f1_local9:addEventHandler( "button_action", function ( f8_arg0, f8_arg1 )
			ACTIONS.SetZombiesLobbyMusic( self, "6", f8_arg1.controller or f1_local1 )
		end )
	end
	if DataSources.frontEnd.CP.songs.hasSong7Unlocked:GetValue( f1_local1 ) ~= nil and DataSources.frontEnd.CP.songs.hasSong7Unlocked:GetValue( f1_local1 ) == 1 then
		f1_local10:addEventHandler( "button_action", function ( f9_arg0, f9_arg1 )
			ACTIONS.SetZombiesLobbyMusic( self, "7", f9_arg1.controller or f1_local1 )
		end )
	end
	if DataSources.frontEnd.CP.songs.hasSong7Unlocked:GetValue( f1_local1 ) ~= nil and DataSources.frontEnd.CP.songs.hasSong7Unlocked:GetValue( f1_local1 ) == 1 then
		f1_local11:addEventHandler( "button_action", function ( f10_arg0, f10_arg1 )
			ACTIONS.SetZombiesLobbyMusic( self, "8", f10_arg1.controller or f1_local1 )
		end )
	end
	if DataSources.frontEnd.CP.songs.hasSong7Unlocked:GetValue( f1_local1 ) ~= nil and DataSources.frontEnd.CP.songs.hasSong7Unlocked:GetValue( f1_local1 ) == 1 then
		f1_local12:addEventHandler( "button_action", function ( f11_arg0, f11_arg1 )
			ACTIONS.SetZombiesLobbyMusic( self, "9", f11_arg1.controller or f1_local1 )
		end )
	end
	if DataSources.frontEnd.CP.songs.hasSong8Unlocked:GetValue( f1_local1 ) ~= nil and DataSources.frontEnd.CP.songs.hasSong8Unlocked:GetValue( f1_local1 ) == 1 then
		f1_local13:addEventHandler( "button_action", function ( f12_arg0, f12_arg1 )
			ACTIONS.SetZombiesLobbyMusic( self, "10", f12_arg1.controller or f1_local1 )
		end )
	end
	if DataSources.frontEnd.CP.songs.hasSong8Unlocked:GetValue( f1_local1 ) ~= nil and DataSources.frontEnd.CP.songs.hasSong8Unlocked:GetValue( f1_local1 ) == 1 then
		f1_local14:addEventHandler( "button_action", function ( f13_arg0, f13_arg1 )
			ACTIONS.SetZombiesLobbyMusic( self, "11", f13_arg1.controller or f1_local1 )
		end )
	end
	if DataSources.frontEnd.CP.songs.hasSong8Unlocked:GetValue( f1_local1 ) ~= nil and DataSources.frontEnd.CP.songs.hasSong8Unlocked:GetValue( f1_local1 ) == 1 then
		f1_local15:addEventHandler( "button_action", function ( f14_arg0, f14_arg1 )
			ACTIONS.SetZombiesLobbyMusic( self, "12", f14_arg1.controller or f1_local1 )
		end )
	end
	if DataSources.frontEnd.CP.songs.hasSong9Unlocked:GetValue( f1_local1 ) ~= nil and DataSources.frontEnd.CP.songs.hasSong9Unlocked:GetValue( f1_local1 ) == 1 then
		f1_local16:addEventHandler( "button_action", function ( f15_arg0, f15_arg1 )
			ACTIONS.SetZombiesLobbyMusic( self, "13", f15_arg1.controller or f1_local1 )
		end )
	end
	if DataSources.frontEnd.CP.songs.hasSong9Unlocked:GetValue( f1_local1 ) ~= nil and DataSources.frontEnd.CP.songs.hasSong9Unlocked:GetValue( f1_local1 ) == 1 then
		f1_local17:addEventHandler( "button_action", function ( f16_arg0, f16_arg1 )
			ACTIONS.SetZombiesLobbyMusic( self, "14", f16_arg1.controller or f1_local1 )
		end )
	end
	if DataSources.frontEnd.CP.songs.hasSong9Unlocked:GetValue( f1_local1 ) ~= nil and DataSources.frontEnd.CP.songs.hasSong9Unlocked:GetValue( f1_local1 ) == 1 then
		f1_local18:addEventHandler( "button_action", function ( f17_arg0, f17_arg1 )
			ACTIONS.SetZombiesLobbyMusic( self, "15", f17_arg1.controller or f1_local1 )
		end )
	end
	if DataSources.frontEnd.CP.songs.hasSong10Unlocked:GetValue( f1_local1 ) ~= nil and DataSources.frontEnd.CP.songs.hasSong10Unlocked:GetValue( f1_local1 ) == 1 then
		f1_local19:addEventHandler( "button_action", function ( f18_arg0, f18_arg1 )
			ACTIONS.SetZombiesLobbyMusic( self, "16", f18_arg1.controller or f1_local1 )
		end )
	end
	if DataSources.frontEnd.CP.songs.hasSong10Unlocked:GetValue( f1_local1 ) ~= nil and DataSources.frontEnd.CP.songs.hasSong10Unlocked:GetValue( f1_local1 ) == 1 then
		f1_local20:addEventHandler( "button_action", function ( f19_arg0, f19_arg1 )
			ACTIONS.SetZombiesLobbyMusic( self, "17", f19_arg1.controller or f1_local1 )
		end )
	end
	if DataSources.frontEnd.CP.songs.hasSong10Unlocked:GetValue( f1_local1 ) ~= nil and DataSources.frontEnd.CP.songs.hasSong10Unlocked:GetValue( f1_local1 ) == 1 then
		f1_local21:addEventHandler( "button_action", function ( f20_arg0, f20_arg1 )
			ACTIONS.SetZombiesLobbyMusic( self, "18", f20_arg1.controller or f1_local1 )
		end )
	end
	if DataSources.frontEnd.CP.songs.hasSong11Unlocked:GetValue( f1_local1 ) ~= nil and DataSources.frontEnd.CP.songs.hasSong11Unlocked:GetValue( f1_local1 ) == 1 then
		f1_local22:addEventHandler( "button_action", function ( f21_arg0, f21_arg1 )
			ACTIONS.SetZombiesLobbyMusic( self, "19", f21_arg1.controller or f1_local1 )
		end )
	end
	if DataSources.frontEnd.CP.songs.hasSong11Unlocked:GetValue( f1_local1 ) ~= nil and DataSources.frontEnd.CP.songs.hasSong11Unlocked:GetValue( f1_local1 ) == 1 then
		f1_local23:addEventHandler( "button_action", function ( f22_arg0, f22_arg1 )
			ACTIONS.SetZombiesLobbyMusic( self, "20", f22_arg1.controller or f1_local1 )
		end )
	end
	if DataSources.frontEnd.CP.songs.hasSong11Unlocked:GetValue( f1_local1 ) ~= nil and DataSources.frontEnd.CP.songs.hasSong11Unlocked:GetValue( f1_local1 ) == 1 then
		f1_local24:addEventHandler( "button_action", function ( f23_arg0, f23_arg1 )
			ACTIONS.SetZombiesLobbyMusic( self, "21", f23_arg1.controller or f1_local1 )
		end )
	end
	return self
end

MenuBuilder.registerType( "CPLobbySecretSongButtons", CPLobbySecretSongButtons )
LockTable( _M )
