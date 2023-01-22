local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = {
	DISABLED = 1,
	ENABLED = 2
}
f0_local1 = function ( f1_arg0, f1_arg1 )
	Engine.SetSubtitlesEnabled( f1_arg1, not Engine.SubtitlesEnabled( f1_arg1 ) )
end

f0_local2 = function ( f2_arg0, f2_arg1 )
	Engine.SetDvarFloat( "profileMenuOption_licensedMusicVolume", f2_arg0 )
	Engine.MenuDvarsFinish( f2_arg1 )
end

local f0_local3 = function ( f3_arg0, f3_arg1 )
	Engine.SetDvarFloat( "profileMenuOption_volume", f3_arg0 )
	Engine.MenuDvarsFinish( f3_arg1 )
end

local f0_local4 = function ( f4_arg0, f4_arg1 )
	Engine.SetDvarFloat( "profileMenuOption_voiceVolume", f4_arg0 )
	Engine.MenuDvarsFinish( f4_arg1 )
end

local f0_local5 = function ( f5_arg0, f5_arg1 )
	Engine.SetDvarFloat( "profileMenuOption_musicVolume", f5_arg0 )
	Engine.MenuDvarsFinish( f5_arg1 )
end

local f0_local6 = function ( f6_arg0, f6_arg1 )
	Engine.SetDvarFloat( "profileMenuOption_effectsVolume", f6_arg0 )
	Engine.MenuDvarsFinish( f6_arg1 )
end

local f0_local7 = function ( f7_arg0, f7_arg1 )
	Engine.ToggleMPVoice( f7_arg1 )
end

local f0_local8 = function ( f8_arg0, f8_arg1 )
	local f8_local0
	if f8_arg0 == f0_local0.ENABLED then
		f8_local0 = true
	else
		f8_local0 = false
	end
	Engine.SetDvarBool( "profileMenuOption_controllerSpeakerEnabled", f8_local0 )
	Engine.MenuDvarsFinish( f8_arg1 )
end

local f0_local9 = function ( f9_arg0, f9_arg1, f9_arg2 )
	f9_arg0:AllowScrolling()
	if Engine.IsActiveLocalClientPrimary( f9_arg1 ) then
		assert( f9_arg0.Volume )
		assert( f9_arg0.Volume.GenericFillBar )
		assert( f9_arg0.Volume.GenericFillBar.Fill )
		assert( f9_arg0.VoiceVolume )
		assert( f9_arg0.VoiceVolume.GenericFillBar )
		assert( f9_arg0.VoiceVolume.GenericFillBar.Fill )
		assert( f9_arg0.MusicVolume )
		assert( f9_arg0.MusicVolume.GenericFillBar )
		assert( f9_arg0.MusicVolume.GenericFillBar.Fill )
		assert( f9_arg0.EffectsVolume )
		assert( f9_arg0.EffectsVolume.GenericFillBar )
		assert( f9_arg0.EffectsVolume.GenericFillBar.Fill )
		if Engine.IsSingleplayer() then
			assert( f9_arg0.Subtitles )
		end
		if Engine.IsAliensMode() then
			assert( f9_arg0.LicensedMusicVolume )
		end
		local f9_local0 = Engine.GetProfileData( "subtitles", f9_arg1 )
		local f9_local1 = {}
		local f9_local2 = {}
		local f9_local3 = Engine.Localize( "LUA_MENU_DISABLED" )
		local f9_local4 = Engine.Localize( "LUA_MENU_ENABLED" )
		f9_local1.labels = f9_local3
		f9_local1.action = f0_local1
		if f9_local0 then
			f9_local2 = f0_local0.ENABLED
			if not f9_local2 then
			
			else
				f9_local1.defaultValue = f9_local2
				f9_local1.wrapAround = true
				LUI.AddUIArrowTextButtonLogic( f9_arg0.Subtitles, f9_arg1, f9_local1 )
			end
		end
		f9_local2 = f0_local0.DISABLED
	end
	if Engine.IsPS4() then
		assert( f9_arg0.ControllerSound )
	end
	if Engine.IsAliensMode() and Engine.IsActiveLocalClientPrimary( f9_arg1 ) then
		LUI.AddUIArrowFillBarButtonLogic( f9_arg0.LicensedMusicVolume, f9_arg1, {
			decimalPlacesToRound = 2,
			action = f0_local2,
			defaultValue = Engine.GetDvarFloat( "profileMenuOption_licensedMusicVolume" ),
			wrapAround = false,
			max = SliderBounds.Volume.Max,
			min = SliderBounds.Volume.Min,
			step = SliderBounds.Volume.Step,
			fillElement = f9_arg0.LicensedMusicVolume.GenericFillBar.Fill
		} )
	end
	if Engine.IsActiveLocalClientPrimary( f9_arg1 ) then
		LUI.AddUIArrowFillBarButtonLogic( f9_arg0.Volume, f9_arg1, {
			decimalPlacesToRound = 2,
			action = f0_local3,
			defaultValue = Engine.GetDvarFloat( "profileMenuOption_volume" ),
			wrapAround = false,
			max = SliderBounds.Volume.Max,
			min = SliderBounds.Volume.Min,
			step = SliderBounds.Volume.Step,
			fillElement = f9_arg0.Volume.GenericFillBar.Fill
		} )
		LUI.AddUIArrowFillBarButtonLogic( f9_arg0.VoiceVolume, f9_arg1, {
			decimalPlacesToRound = 2,
			action = f0_local4,
			defaultValue = Engine.GetDvarFloat( "profileMenuOption_voiceVolume" ),
			wrapAround = false,
			max = SliderBounds.Volume.Max,
			min = SliderBounds.Volume.Min,
			step = SliderBounds.Volume.Step,
			fillElement = f9_arg0.VoiceVolume.GenericFillBar.Fill
		} )
		LUI.AddUIArrowFillBarButtonLogic( f9_arg0.MusicVolume, f9_arg1, {
			decimalPlacesToRound = 2,
			action = f0_local5,
			defaultValue = Engine.GetDvarFloat( "profileMenuOption_musicVolume" ),
			wrapAround = false,
			max = SliderBounds.Volume.Max,
			min = SliderBounds.Volume.Min,
			step = SliderBounds.Volume.Step,
			fillElement = f9_arg0.MusicVolume.GenericFillBar.Fill
		} )
		LUI.AddUIArrowFillBarButtonLogic( f9_arg0.EffectsVolume, f9_arg1, {
			decimalPlacesToRound = 2,
			action = f0_local6,
			defaultValue = Engine.GetDvarFloat( "profileMenuOption_effectsVolume" ),
			wrapAround = false,
			max = SliderBounds.Volume.Max,
			min = SliderBounds.Volume.Min,
			step = SliderBounds.Volume.Step,
			fillElement = f9_arg0.EffectsVolume.GenericFillBar.Fill
		} )
		OPTIONS.CreateAudioMixPreset( f9_arg0.MixPreset, f9_arg1 )
	end
	if Engine.IsPS4() then
		local f9_local0 = Engine.GetDvarBool( "profileMenuOption_controllerSpeakerEnabled" )
		local f9_local1 = {}
		local f9_local2 = {}
		local f9_local3 = Engine.Localize( "LUA_MENU_DISABLED" )
		local f9_local4 = Engine.Localize( "LUA_MENU_ENABLED" )
		f9_local1.labels = f9_local3
		f9_local1.action = f0_local8
		if f9_local0 then
			f9_local2 = f0_local0.ENABLED
			if not f9_local2 then
			
			else
				f9_local1.defaultValue = f9_local2
				f9_local1.wrapAround = true
				LUI.AddUIArrowTextButtonLogic( f9_arg0.ControllerSound, f9_arg1, f9_local1 )
			end
		end
		f9_local2 = f0_local0.DISABLED
	end
end

function AudioOptionsButtons( menu, controller )
	local self = LUI.UIVerticalList.new( {
		left = -10,
		right = 1100 * _1080p,
		top = 0 * _1080p,
		bottom = 705 * _1080p,
		leftAnchor = true,
		rightAnchor = false,
		topAnchor = true,
		bottomAnchor = false,
		spacing = 10 * _1080p
	} )
	self.id = "OptionsButtons"
	self._animationSets = {}
	self._sequences = {}
	local f10_local1 = controller or {}
	local f10_local2 = f10_local1.controllerIndex
	if not CONDITIONS.IsThirdGameMode( self ) then
		self:setUseStencil( true )
	end
	local f10_local3 = nil
	if Engine.IsAliensMode() and Engine.IsActiveLocalClientPrimary( f10_local2 ) then
		f10_local3 = MenuBuilder.BuildRegisteredType( "GenericFillBarArrowButton", {
			controllerIndex = f10_local2
		} )
		f10_local3.id = "MusicPlaylist"
		f10_local3:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 30, 0 )
		f10_local3.buttonDescription = Engine.Localize( "PLATFORM_OPTIONS_MUSIC_PLAYLIST_DESC" )
		f10_local3.Title:setText( ToUpperCase( Engine.Localize( "MENU_MUSIC_PLAYLIST_CAPS" ) ), 0 )
		self:addElement( f10_local3 )
		self.LicensedMusicVolume = f10_local3
	end
	if Engine.IsActiveLocalClientPrimary( f10_local2 ) then
		local Volume = MenuBuilder.BuildRegisteredType( "GenericFillBarArrowButton", {
			controllerIndex = f10_local2
		} )
		Volume.id = "Volume"
		Volume:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 30, 0 )
		Volume.buttonDescription = Engine.Localize( "PLATFORM_OPTIONS_GAME_VOLUME_DESC" )
		Volume.Title:setText( ToUpperCase( Engine.Localize( "MENU_MASTER_VOLUME" ) ), 0 )
		self:addElement( Volume )
		self.Volume = Volume
		
		local VoiceVolume = MenuBuilder.BuildRegisteredType( "GenericFillBarArrowButton", {
			controllerIndex = f10_local2
		} )
		VoiceVolume.id = "VoiceVolume"
		VoiceVolume:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 30, 0 )
		VoiceVolume.buttonDescription = Engine.Localize( "PLATFORM_OPTIONS_VOICE_VOLUME_DESC" )
		VoiceVolume.Title:setText( ToUpperCase( Engine.Localize( "MENU_VOICE_VOLUME" ) ), 0 )
		self:addElement( VoiceVolume )
		self.VoiceVolume = VoiceVolume
		
		local MusicVolume = MenuBuilder.BuildRegisteredType( "GenericFillBarArrowButton", {
			controllerIndex = f10_local2
		} )
		MusicVolume.id = "MusicVolume"
		MusicVolume:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 30, 0 )
		MusicVolume.buttonDescription = Engine.Localize( "PLATFORM_OPTIONS_MUSIC_VOLUME_DESC" )
		MusicVolume.Title:setText( ToUpperCase( Engine.Localize( "MENU_MUSIC_VOLUME" ) ), 0 )
		self:addElement( MusicVolume )
		self.MusicVolume = MusicVolume
		
		local EffectsVolume = MenuBuilder.BuildRegisteredType( "GenericFillBarArrowButton", {
			controllerIndex = f10_local2
		} )
		EffectsVolume.id = "EffectsVolume"
		EffectsVolume:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 30, 0 )
		EffectsVolume.buttonDescription = Engine.Localize( "PLATFORM_OPTIONS_EFFECTS_VOLUME_DESC" )
		EffectsVolume.Title:setText( ToUpperCase( Engine.Localize( "MENU_EFFECTS_VOLUME" ) ), 0 )
		self:addElement( EffectsVolume )
		self.EffectsVolume = EffectsVolume
		
		local Subtitles = nil
		
		Subtitles = MenuBuilder.BuildRegisteredType( "GenericArrowButton", {
			controllerIndex = f10_local2
		} )
		Subtitles.id = "Subtitles"
		Subtitles:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 30, 0 )
		Subtitles.buttonDescription = Engine.Localize( "PLATFORM_OPTIONS_SUBTITLES_DESC" )
		Subtitles.Title:setText( ToUpperCase( Engine.Localize( "MENU_SUBTITLES_CAPS" ) ), 0 )
		self:addElement( Subtitles )
		self.Subtitles = Subtitles
		
		local f10_local9 = MenuBuilder.BuildRegisteredType( "GenericArrowButton", {
			controllerIndex = f10_local2
		} )
		f10_local9.id = "MixPreset"
		f10_local9:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 30, 0 )
		f10_local9.buttonDescription = Engine.Localize( "LUA_MENU_MIX_PRESET_DESC" )
		f10_local9.Title:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MIX_PRESET" ) ), 0 )
		self:addElement( f10_local9 )
		self.MixPreset = f10_local9
	end
	if Engine.IsPS4() then
		local Volume = MenuBuilder.BuildRegisteredType( "GenericArrowButton", {
			controllerIndex = f10_local2
		} )
		Volume.id = "ControllerSound"
		Volume:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 30, 0 )
		Volume.buttonDescription = Engine.Localize( "LUA_MENU_CONTROLLER_SOUND_DESC" )
		Volume.Title:setText( ToUpperCase( Engine.Localize( "LUA_MENU_CONTROLLER_SOUND_CAPS" ) ), 0 )
		self:addElement( Volume )
		self.ControllerSound = Volume
	end
	f0_local9( self, f10_local2, f10_local1 )
	return self
end

MenuBuilder.registerType( "AudioOptionsButtons", AudioOptionsButtons )
LockTable( _M )
