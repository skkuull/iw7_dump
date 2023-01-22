local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function CreateMessage( f1_arg0, f1_arg1 )
	assert( f1_arg1.useCommanderImage )
	assert( f1_arg1.factionID )
	assert( f1_arg1.aliasBase )
	assert( f1_arg1.sequenceLength )
	assert( f1_arg1.priority )
	local f1_local0 = Engine.TableLookup( CSV.missionTeams.file, CSV.missionTeams.cols.index, f1_arg1.factionID, CSV.missionTeams.cols.factionVOAbbrev )
	local f1_local1 = Engine.TableLookup( CSV.missionTeams.file, CSV.missionTeams.cols.index, f1_arg1.factionID, CSV.missionTeams.cols.missionTeamCommanderVOAbbrev )
	local f1_local2 = Engine.Localize( Engine.TableLookup( CSV.missionTeams.file, CSV.missionTeams.cols.index, f1_arg1.factionID, CSV.missionTeams.cols.commanderName ) )
	local f1_local3 = Engine.TableLookup( CSV.missionTeams.file, CSV.missionTeams.cols.index, f1_arg1.factionID, CSV.missionTeams.cols.commanderHeadshot )
	local f1_local4 = SWATCHES.MissionTeams[Engine.TableLookup( CSV.missionTeams.file, CSV.missionTeams.cols.index, f1_arg1.factionID, CSV.missionTeams.cols.color )]
	if not f1_local4 then
		f1_local4 = SWATCHES.MissionTeams.Wolverines
	end
	local f1_local5 = Engine.TableLookup( CSV.missionTeams.file, CSV.missionTeams.cols.index, f1_arg1.factionID, CSV.missionTeams.cols.image )
	local f1_local6 = tonumber( f1_arg1.sequenceLength )
	local f1_local7 = tonumber( f1_arg1.priority )
	local f1_local8 = true
	for f1_local9 = 1, f1_local6, 1 do
		local f1_local12 = ""
		if f1_local6 > 1 then
			f1_local12 = "_" .. f1_local9
		end
		local f1_local13 = f1_local0 .. "_" .. f1_local1 .. "_" .. f1_arg1.aliasBase .. f1_local12
		if f1_local8 then
			f1_local8 = Engine.DoesSoundExist( f1_local13 )
		end
	end
	if f1_local8 then
		if #f1_arg0.messageQueue >= 1 then
			if f1_arg0.messageQueue[1].priority < f1_local7 then
				for f1_local10 = 1, #f1_arg0.messageQueue, 1 do
					local f1_local12 = f1_local10
					table.remove( f1_arg0.messageQueue )
				end
			else
				return 
			end
		end
		for f1_local9 = 1, f1_local6, 1 do
			local f1_local12 = ""
			if f1_local6 > 1 then
				f1_local12 = "_" .. f1_local9
			end
			table.insert( f1_arg0.messageQueue, {
				commanderImage = f1_local3,
				missionTeamIcon = f1_local5,
				useCommanderImage = f1_arg1.useCommanderImage,
				commanderName = f1_local2,
				messageID = f1_local0 .. "_" .. f1_local1 .. "_" .. f1_arg1.aliasBase .. f1_local12,
				priority = f1_local7,
				color = f1_local4
			} )
		end
	end
end

function ProcessMessage( f2_arg0 )
	if #f2_arg0.messageQueue == 0 then
		if not f2_arg0.hidden then
			f2_arg0.hidden = true
			f2_arg0:SetAlpha( 0, 100 )
			local f2_local0 = f2_arg0:GetCurrentMenu()
			f2_local0:processEvent( {
				name = "hide_commander_message"
			} )
		end
		return nil
	else
		f2_arg0.hidden = false
		ACTIONS.AnimateSequence( f2_arg0, "Glitch" )
		f2_arg0:SetAlpha( 1, 240 )
		local f2_local0 = table.remove( f2_arg0.messageQueue, 1 )
		f2_arg0.soundID = Engine.PlaySound( f2_local0.messageID )
		f2_arg0.CommanderName:setText( f2_local0.commanderName, 0 )
		f2_arg0.CommanderImage:setImage( RegisterMaterial( f2_local0.commanderImage ), 0 )
		f2_arg0.Icon:setImage( RegisterMaterial( f2_local0.missionTeamIcon ), 0 )
		f2_arg0.Background:SetRGBFromTable( f2_local0.color )
		f2_arg0.ColorOverlay:SetRGBFromTable( f2_local0.color )
		f2_arg0.Audio:SetRGBFromTable( f2_local0.color )
		local f2_local1 = Engine.GetSubtitleForSound( f2_arg0.soundID )
		return f2_local0
	end
end

function PostLoadFunc( f3_arg0, f3_arg1, f3_arg2 )
	f3_arg0.messageQueue = {}
	f3_arg0.CreateMessage = CreateMessage
	f3_arg0.soundID = 0
	ACTIONS.AnimateSequence( f3_arg0, "VideoFeed" )
	f3_arg0:SetAlpha( 0, 0 )
	f3_arg0:addElement( LUI.UITimer.new( nil, {
		interval = 100,
		event = "startup_delay",
		disposable = true
	} ) )
	f3_arg0:addEventHandler( "startup_delay", function ( f4_arg0, f4_arg1 )
		local f4_local0 = ProcessMessage( f3_arg0 )
		if f4_local0 ~= nil then
			local f4_local1 = tonumber( f4_local0.useCommanderImage )
			if f4_local1 == 1 then
				ACTIONS.AnimateSequence( f3_arg0, "VideoFeed" )
			elseif f4_local1 == 0 then
				ACTIONS.AnimateSequence( f3_arg0, "VoiceFeed" )
			end
			ACTIONS.AnimateSequence( f3_arg0, "GlowSplash" )
		end
		local f4_local1 = 50
		local f4_local2 = 100
		local self = LUI.UITimer.new( nil, {
			interval = f4_local1,
			event = "is_sound_playing",
			disposable = false
		} )
		f3_arg0:addElement( self )
		f3_arg0:addEventHandler( "is_sound_playing", function ( f5_arg0, f5_arg1 )
			if not Engine.IsSoundPlaying( f3_arg0.soundID ) then
				if ProcessMessage( f3_arg0 ) == nil then
					self.interval = f4_local2
				else
					self.interval = f4_local1
				end
			end
			return 0
		end )
		return 0
	end )
	f3_arg0:addEventHandler( "menu_close", function ()
		if Engine.IsSoundPlaying( f3_arg0.soundID ) then
			Engine.StopSound( f3_arg0.soundID )
		end
	end )
end

function CommanderMessage( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 700 * _1080p, 0, 168 * _1080p )
	self.id = "CommanderMessage"
	self._animationSets = {}
	self._sequences = {}
	local f7_local1 = controller and controller.controllerIndex
	if not f7_local1 and not Engine.InFrontend() then
		f7_local1 = self:getRootController()
	end
	assert( f7_local1 )
	local f7_local2 = self
	local Glow = nil
	
	Glow = LUI.UIImage.new()
	Glow.id = "Glow"
	Glow:SetAlpha( 0, 0 )
	Glow:setImage( RegisterMaterial( "wdg_highlight_glow_tab" ), 0 )
	Glow:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -50, _1080p * 60, _1080p * -93, _1080p * 107 )
	self:addElement( Glow )
	self.Glow = Glow
	
	local DropShadow = nil
	
	DropShadow = LUI.UIImage.new()
	DropShadow.id = "DropShadow"
	DropShadow:SetRGBFromInt( 0, 0 )
	DropShadow:SetAlpha( 0.3, 0 )
	DropShadow:SetGlitchEnabled( true )
	DropShadow:SetGlitchAmount( 0, 0 )
	DropShadow:SetGlitchBlockWidth( 50, 0 )
	DropShadow:SetGlitchBlockHeight( 50, 0 )
	DropShadow:SetGlitchDistortionRange( 16, 0 )
	DropShadow:SetGlitchScanlinePitch( 1, 0 )
	DropShadow:SetGlitchMaskPitch( 1, 0 )
	DropShadow:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
	DropShadow:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, 0, _1080p * 4 )
	self:addElement( DropShadow )
	self.DropShadow = DropShadow
	
	local Background = nil
	
	Background = LUI.UIBlur.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 13070140, 0 )
	Background:SetGlitchEnabled( true )
	Background:SetGlitchAmount( 0, 0 )
	Background:SetGlitchBlockWidth( 50, 0 )
	Background:SetGlitchBlockHeight( 50, 0 )
	Background:SetGlitchDistortionRange( 16, 0 )
	Background:SetGlitchScanlinePitch( 1, 0 )
	Background:SetGlitchMaskPitch( 1, 0 )
	Background:SetBlurStrength( 3, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local ColorOverlay = nil
	
	ColorOverlay = LUI.UIImage.new()
	ColorOverlay.id = "ColorOverlay"
	ColorOverlay:SetRGBFromInt( 13070140, 0 )
	ColorOverlay:SetAlpha( 0.5, 0 )
	ColorOverlay:SetGlitchEnabled( true )
	ColorOverlay:SetGlitchAmount( 0, 0 )
	ColorOverlay:SetGlitchBlockWidth( 50, 0 )
	ColorOverlay:SetGlitchBlockHeight( 50, 0 )
	ColorOverlay:SetGlitchDistortionRange( 16, 0 )
	ColorOverlay:SetGlitchScanlinePitch( 1, 0 )
	ColorOverlay:SetGlitchMaskPitch( 1, 0 )
	ColorOverlay:SetBlendMode( BLEND_MODE.blend )
	self:addElement( ColorOverlay )
	self.ColorOverlay = ColorOverlay
	
	local GradientOverlay = nil
	
	GradientOverlay = LUI.UIImage.new()
	GradientOverlay.id = "GradientOverlay"
	GradientOverlay:SetRGBFromInt( 0, 0 )
	GradientOverlay:SetAlpha( 0.3, 0 )
	GradientOverlay:SetGlitchEnabled( true )
	GradientOverlay:SetGlitchAmount( 0, 0 )
	GradientOverlay:SetGlitchBlockWidth( 50, 0 )
	GradientOverlay:SetGlitchBlockHeight( 50, 0 )
	GradientOverlay:SetGlitchDistortionRange( 16, 0 )
	GradientOverlay:SetGlitchScanlinePitch( 1, 0 )
	GradientOverlay:SetGlitchMaskPitch( 1, 0 )
	GradientOverlay:setImage( RegisterMaterial( "widg_gradient_left_to_right" ), 0 )
	GradientOverlay:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 120, _1080p * -200, 0, 0 )
	self:addElement( GradientOverlay )
	self.GradientOverlay = GradientOverlay
	
	local HeaderDropShadow = nil
	
	HeaderDropShadow = LUI.UIImage.new()
	HeaderDropShadow.id = "HeaderDropShadow"
	HeaderDropShadow:SetRGBFromInt( 0, 0 )
	HeaderDropShadow:SetAlpha( 0.3, 0 )
	HeaderDropShadow:SetGlitchEnabled( true )
	HeaderDropShadow:SetGlitchAmount( 0, 0 )
	HeaderDropShadow:SetGlitchBlockWidth( 50, 0 )
	HeaderDropShadow:SetGlitchBlockHeight( 50, 0 )
	HeaderDropShadow:SetGlitchDistortionRange( 16, 0 )
	HeaderDropShadow:SetGlitchScanlinePitch( 1, 0 )
	HeaderDropShadow:SetGlitchMaskPitch( 1, 0 )
	HeaderDropShadow:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
	HeaderDropShadow:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 120, 0, _1080p * -127, _1080p * -123 )
	self:addElement( HeaderDropShadow )
	self.HeaderDropShadow = HeaderDropShadow
	
	local HeaderBacker = nil
	
	HeaderBacker = LUI.UIImage.new()
	HeaderBacker.id = "HeaderBacker"
	HeaderBacker:SetRGBFromInt( 0, 0 )
	HeaderBacker:SetAlpha( 0.8, 0 )
	HeaderBacker:SetGlitchEnabled( true )
	HeaderBacker:SetGlitchAmount( 0, 0 )
	HeaderBacker:SetGlitchBlockWidth( 50, 0 )
	HeaderBacker:SetGlitchBlockHeight( 50, 0 )
	HeaderBacker:SetGlitchDistortionRange( 16, 0 )
	HeaderBacker:SetGlitchScanlinePitch( 1, 0 )
	HeaderBacker:SetGlitchMaskPitch( 1, 0 )
	HeaderBacker:setImage( RegisterMaterial( "commander_frame" ), 0 )
	HeaderBacker:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 120, 0, 0, _1080p * 41 )
	self:addElement( HeaderBacker )
	self.HeaderBacker = HeaderBacker
	
	local AudioGradient = nil
	
	AudioGradient = LUI.UIImage.new()
	AudioGradient.id = "AudioGradient"
	AudioGradient:SetRGBFromInt( 0, 0 )
	AudioGradient:SetAlpha( 0.6, 0 )
	AudioGradient:SetGlitchEnabled( true )
	AudioGradient:SetGlitchAmount( 0, 0 )
	AudioGradient:SetGlitchBlockWidth( 50, 0 )
	AudioGradient:SetGlitchBlockHeight( 50, 0 )
	AudioGradient:SetGlitchDistortionRange( 16, 0 )
	AudioGradient:SetGlitchScanlinePitch( 1, 0 )
	AudioGradient:SetGlitchMaskPitch( 1, 0 )
	AudioGradient:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
	AudioGradient:SetUseAA( true )
	AudioGradient:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -20, 0 )
	self:addElement( AudioGradient )
	self.AudioGradient = AudioGradient
	
	local AudioGradientTop = nil
	
	AudioGradientTop = LUI.UIImage.new()
	AudioGradientTop.id = "AudioGradientTop"
	AudioGradientTop:SetRGBFromInt( 0, 0 )
	AudioGradientTop:SetAlpha( 0.6, 0 )
	AudioGradientTop:SetGlitchEnabled( true )
	AudioGradientTop:SetGlitchAmount( 0, 0 )
	AudioGradientTop:SetGlitchBlockWidth( 50, 0 )
	AudioGradientTop:SetGlitchBlockHeight( 50, 0 )
	AudioGradientTop:SetGlitchDistortionRange( 16, 0 )
	AudioGradientTop:SetGlitchScanlinePitch( 1, 0 )
	AudioGradientTop:SetGlitchMaskPitch( 1, 0 )
	AudioGradientTop:setImage( RegisterMaterial( "widg_gradient_bottom_to_top" ), 0 )
	AudioGradientTop:SetUseAA( true )
	AudioGradientTop:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 4, _1080p * 4, _1080p * 41, _1080p * -107 )
	self:addElement( AudioGradientTop )
	self.AudioGradientTop = AudioGradientTop
	
	local CommanderImage = nil
	
	CommanderImage = LUI.UIImage.new()
	CommanderImage.id = "CommanderImage"
	CommanderImage:SetGlitchEnabled( true )
	CommanderImage:SetGlitchAmount( 0, 0 )
	CommanderImage:SetGlitchBlockWidth( 50, 0 )
	CommanderImage:SetGlitchBlockHeight( 50, 0 )
	CommanderImage:SetGlitchDistortionRange( 16, 0 )
	CommanderImage:SetGlitchScanlinePitch( 1, 0 )
	CommanderImage:SetGlitchMaskPitch( 1, 0 )
	CommanderImage:setImage( RegisterMaterial( "mp_mt_commander_orion" ), 0 )
	CommanderImage:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -7, _1080p * -570, _1080p * -52.5, _1080p * 53.5 )
	self:addElement( CommanderImage )
	self.CommanderImage = CommanderImage
	
	local CommanderName = nil
	
	CommanderName = LUI.UIStyledText.new()
	CommanderName.id = "CommanderName"
	CommanderName:SetGlitchEnabled( true )
	CommanderName:SetGlitchAmount( 0, 0 )
	CommanderName:SetGlitchBlockWidth( 50, 0 )
	CommanderName:SetGlitchBlockHeight( 50, 0 )
	CommanderName:SetGlitchDistortionRange( 16, 0 )
	CommanderName:SetGlitchScanlinePitch( 1, 0 )
	CommanderName:SetGlitchMaskPitch( 1, 0 )
	CommanderName:setText( ToUpperCase( "CLANS_CLAN_LEADER_CAPS" ), 0 )
	CommanderName:SetFontSize( 28 * _1080p )
	CommanderName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	CommanderName:SetAlignment( LUI.Alignment.Left )
	CommanderName:SetStartupDelay( 1000 )
	CommanderName:SetLineHoldTime( 400 )
	CommanderName:SetAnimMoveTime( 150 )
	CommanderName:SetEndDelay( 1000 )
	CommanderName:SetCrossfadeTime( 400 )
	CommanderName:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	CommanderName:SetMaxVisibleLines( 1 )
	CommanderName:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 127, _1080p * 431, _1080p * 6.5, _1080p * 34.5 )
	self:addElement( CommanderName )
	self.CommanderName = CommanderName
	
	local Accentbar = nil
	
	Accentbar = LUI.UIImage.new()
	Accentbar.id = "Accentbar"
	Accentbar:SetGlitchEnabled( true )
	Accentbar:SetGlitchAmount( 0, 0 )
	Accentbar:SetGlitchBlockWidth( 50, 0 )
	Accentbar:SetGlitchBlockHeight( 50, 0 )
	Accentbar:SetGlitchDistortionRange( 16, 0 )
	Accentbar:SetGlitchScanlinePitch( 1, 0 )
	Accentbar:SetGlitchMaskPitch( 1, 0 )
	Accentbar:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 4, 0, 0 )
	self:addElement( Accentbar )
	self.Accentbar = Accentbar
	
	local Icon = nil
	
	Icon = LUI.UIImage.new()
	Icon.id = "Icon"
	Icon:SetGlitchEnabled( true )
	Icon:SetGlitchAmount( 0, 0 )
	Icon:SetGlitchBlockWidth( 50, 0 )
	Icon:SetGlitchBlockHeight( 50, 0 )
	Icon:SetGlitchDistortionRange( 16, 0 )
	Icon:SetGlitchScanlinePitch( 1, 0 )
	Icon:SetGlitchMaskPitch( 1, 0 )
	Icon:setImage( RegisterMaterial( "mission_team_orion_initiative_icon_off" ), 0 )
	Icon:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 436, _1080p * -39, _1080p * -47.5, _1080p * 9.5 )
	self:addElement( Icon )
	self.Icon = Icon
	
	local AudioBacker = nil
	
	AudioBacker = LUI.UIImage.new()
	AudioBacker.id = "AudioBacker"
	AudioBacker:SetRGBFromInt( 0, 0 )
	AudioBacker:SetAlpha( 0.4, 0 )
	AudioBacker:SetGlitchEnabled( true )
	AudioBacker:SetGlitchAmount( 0, 0 )
	AudioBacker:SetGlitchBlockWidth( 50, 0 )
	AudioBacker:SetGlitchBlockHeight( 50, 0 )
	AudioBacker:SetGlitchDistortionRange( 16, 0 )
	AudioBacker:SetGlitchScanlinePitch( 1, 0 )
	AudioBacker:SetGlitchMaskPitch( 1, 0 )
	AudioBacker:setImage( RegisterMaterial( "wdg_commander_audio_backer" ), 0 )
	AudioBacker:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -570, _1080p * -272, _1080p * -99.5, _1080p * -28.5 )
	self:addElement( AudioBacker )
	self.AudioBacker = AudioBacker
	
	local Audio = nil
	
	Audio = LUI.UIImage.new()
	Audio.id = "Audio"
	Audio:SetAlpha( 0.6, 0 )
	Audio:SetGlitchEnabled( true )
	Audio:SetGlitchAmount( 0, 0 )
	Audio:SetGlitchBlockWidth( 50, 0 )
	Audio:SetGlitchBlockHeight( 50, 0 )
	Audio:SetGlitchDistortionRange( 16, 0 )
	Audio:SetGlitchScanlinePitch( 1, 0 )
	Audio:SetGlitchMaskPitch( 1, 0 )
	Audio:setImage( RegisterMaterial( "wdg_commander_audio" ), 0 )
	Audio:SetBlendMode( BLEND_MODE.addWithAlpha )
	Audio:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -570, _1080p * -272, _1080p * -99.5, _1080p * -28.5 )
	self:addElement( Audio )
	self.Audio = Audio
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		GradientOverlay:RegisterAnimationSequence( "VoiceFeed", {
			{
				function ()
					return self.GradientOverlay:SetAnchorsAndPosition( 0, 0, 0, 0, 0, _1080p * -320, 0, 0, 0 )
				end
			}
		} )
		HeaderDropShadow:RegisterAnimationSequence( "VoiceFeed", {
			{
				function ()
					return self.HeaderDropShadow:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -126.5, _1080p * -122.5, 0 )
				end
			}
		} )
		HeaderBacker:RegisterAnimationSequence( "VoiceFeed", {
			{
				function ()
					return self.HeaderBacker:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 41, 0 )
				end
			}
		} )
		CommanderImage:RegisterAnimationSequence( "VoiceFeed", {
			{
				function ()
					return self.CommanderImage:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.CommanderImage:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 4, _1080p * 143, 0, 0, 0 )
				end
			}
		} )
		CommanderName:RegisterAnimationSequence( "VoiceFeed", {
			{
				function ()
					return self.CommanderName:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 9.5, _1080p * 313.5, _1080p * 6.5, _1080p * 34.5, 0 )
				end
			}
		} )
		AudioBacker:RegisterAnimationSequence( "VoiceFeed", {
			{
				function ()
					return self.AudioBacker:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -612, _1080p * -288, _1080p * -99.5, _1080p * -28.5, 0 )
				end
			}
		} )
		Audio:RegisterAnimationSequence( "VoiceFeed", {
			{
				function ()
					return self.Audio:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -612, _1080p * -288, _1080p * -99.5, _1080p * -28.5, 0 )
				end
			}
		} )
		self._sequences.VoiceFeed = function ()
			GradientOverlay:AnimateSequence( "VoiceFeed" )
			HeaderDropShadow:AnimateSequence( "VoiceFeed" )
			HeaderBacker:AnimateSequence( "VoiceFeed" )
			CommanderImage:AnimateSequence( "VoiceFeed" )
			CommanderName:AnimateSequence( "VoiceFeed" )
			AudioBacker:AnimateSequence( "VoiceFeed" )
			Audio:AnimateSequence( "VoiceFeed" )
		end
		
		GradientOverlay:RegisterAnimationSequence( "VideoFeed", {
			{
				function ()
					return self.GradientOverlay:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 120, _1080p * -200, 0, 0, 0 )
				end
			}
		} )
		HeaderDropShadow:RegisterAnimationSequence( "VideoFeed", {
			{
				function ()
					return self.HeaderDropShadow:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 120, 0, _1080p * -127, _1080p * -123, 0 )
				end
			}
		} )
		HeaderBacker:RegisterAnimationSequence( "VideoFeed", {
			{
				function ()
					return self.HeaderBacker:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 120, 0, 0, _1080p * 41, 0 )
				end
			}
		} )
		CommanderImage:RegisterAnimationSequence( "VideoFeed", {
			{
				function ()
					return self.CommanderImage:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.CommanderImage:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -7, _1080p * 130, _1080p * -136.5, _1080p * 137.5, 0 )
				end
			}
		} )
		CommanderName:RegisterAnimationSequence( "VideoFeed", {
			{
				function ()
					return self.CommanderName:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 127, _1080p * 431, _1080p * 6.5, _1080p * 34.5, 0 )
				end
			}
		} )
		Audio:RegisterAnimationSequence( "VideoFeed", {
			{
				function ()
					return self.Audio:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -570, _1080p * -272, _1080p * -99.5, _1080p * -28.5, 0 )
				end
			}
		} )
		self._sequences.VideoFeed = function ()
			GradientOverlay:AnimateSequence( "VideoFeed" )
			HeaderDropShadow:AnimateSequence( "VideoFeed" )
			HeaderBacker:AnimateSequence( "VideoFeed" )
			CommanderImage:AnimateSequence( "VideoFeed" )
			CommanderName:AnimateSequence( "VideoFeed" )
			Audio:AnimateSequence( "VideoFeed" )
		end
		
		DropShadow:RegisterAnimationSequence( "Glitch", {
			{
				function ()
					return self.DropShadow:SetGlitchAmount( 1, 0 )
				end,
				function ()
					return self.DropShadow:SetGlitchAmount( 0, 150 )
				end
			},
			{
				function ()
					return self.DropShadow:SetGlitchBlockWidth( 15, 0 )
				end,
				function ()
					return self.DropShadow:SetGlitchBlockWidth( 20, 150 )
				end
			},
			{
				function ()
					return self.DropShadow:SetGlitchBlockHeight( 6, 0 )
				end,
				function ()
					return self.DropShadow:SetGlitchBlockHeight( 2, 150 )
				end
			},
			{
				function ()
					return self.DropShadow:SetGlitchDistortionRange( 20, 0 )
				end,
				function ()
					return self.DropShadow:SetGlitchDistortionRange( 4, 150 )
				end
			},
			{
				function ()
					return self.DropShadow:SetGlitchScanlinePitch( 55, 0 )
				end,
				function ()
					return self.DropShadow:SetGlitchScanlinePitch( 55, 150 )
				end
			},
			{
				function ()
					return self.DropShadow:SetGlitchMaskPitch( 45, 0 )
				end,
				function ()
					return self.DropShadow:SetGlitchMaskPitch( 45, 150 )
				end
			}
		} )
		Background:RegisterAnimationSequence( "Glitch", {
			{
				function ()
					return self.Background:SetGlitchAmount( 1, 0 )
				end,
				function ()
					return self.Background:SetGlitchAmount( 0, 150 )
				end
			},
			{
				function ()
					return self.Background:SetGlitchBlockWidth( 15, 0 )
				end,
				function ()
					return self.Background:SetGlitchBlockWidth( 20, 150 )
				end
			},
			{
				function ()
					return self.Background:SetGlitchBlockHeight( 6, 0 )
				end,
				function ()
					return self.Background:SetGlitchBlockHeight( 2, 150 )
				end
			},
			{
				function ()
					return self.Background:SetGlitchDistortionRange( 20, 0 )
				end,
				function ()
					return self.Background:SetGlitchDistortionRange( 4, 150 )
				end
			},
			{
				function ()
					return self.Background:SetGlitchScanlinePitch( 55, 0 )
				end,
				function ()
					return self.Background:SetGlitchScanlinePitch( 55, 150 )
				end
			},
			{
				function ()
					return self.Background:SetGlitchMaskPitch( 45, 0 )
				end,
				function ()
					return self.Background:SetGlitchMaskPitch( 45, 150 )
				end
			}
		} )
		ColorOverlay:RegisterAnimationSequence( "Glitch", {
			{
				function ()
					return self.ColorOverlay:SetGlitchAmount( 1, 0 )
				end,
				function ()
					return self.ColorOverlay:SetGlitchAmount( 0, 150 )
				end
			},
			{
				function ()
					return self.ColorOverlay:SetGlitchBlockWidth( 15, 0 )
				end,
				function ()
					return self.ColorOverlay:SetGlitchBlockWidth( 20, 150 )
				end
			},
			{
				function ()
					return self.ColorOverlay:SetGlitchBlockHeight( 6, 0 )
				end,
				function ()
					return self.ColorOverlay:SetGlitchBlockHeight( 2, 150 )
				end
			},
			{
				function ()
					return self.ColorOverlay:SetGlitchDistortionRange( 20, 0 )
				end,
				function ()
					return self.ColorOverlay:SetGlitchDistortionRange( 4, 150 )
				end
			},
			{
				function ()
					return self.ColorOverlay:SetGlitchScanlinePitch( 55, 0 )
				end,
				function ()
					return self.ColorOverlay:SetGlitchScanlinePitch( 55, 150 )
				end
			},
			{
				function ()
					return self.ColorOverlay:SetGlitchMaskPitch( 45, 0 )
				end,
				function ()
					return self.ColorOverlay:SetGlitchMaskPitch( 45, 150 )
				end
			}
		} )
		GradientOverlay:RegisterAnimationSequence( "Glitch", {
			{
				function ()
					return self.GradientOverlay:SetGlitchAmount( 1, 0 )
				end,
				function ()
					return self.GradientOverlay:SetGlitchAmount( 0, 150 )
				end
			},
			{
				function ()
					return self.GradientOverlay:SetGlitchBlockWidth( 15, 0 )
				end,
				function ()
					return self.GradientOverlay:SetGlitchBlockWidth( 20, 150 )
				end
			},
			{
				function ()
					return self.GradientOverlay:SetGlitchBlockHeight( 6, 0 )
				end,
				function ()
					return self.GradientOverlay:SetGlitchBlockHeight( 2, 150 )
				end
			},
			{
				function ()
					return self.GradientOverlay:SetGlitchDistortionRange( 20, 0 )
				end,
				function ()
					return self.GradientOverlay:SetGlitchDistortionRange( 4, 150 )
				end
			},
			{
				function ()
					return self.GradientOverlay:SetGlitchScanlinePitch( 55, 0 )
				end,
				function ()
					return self.GradientOverlay:SetGlitchScanlinePitch( 55, 150 )
				end
			},
			{
				function ()
					return self.GradientOverlay:SetGlitchMaskPitch( 45, 0 )
				end,
				function ()
					return self.GradientOverlay:SetGlitchMaskPitch( 45, 150 )
				end
			}
		} )
		HeaderBacker:RegisterAnimationSequence( "Glitch", {
			{
				function ()
					return self.HeaderBacker:SetGlitchAmount( 1, 0 )
				end,
				function ()
					return self.HeaderBacker:SetGlitchAmount( 0, 150 )
				end
			},
			{
				function ()
					return self.HeaderBacker:SetGlitchBlockWidth( 15, 0 )
				end,
				function ()
					return self.HeaderBacker:SetGlitchBlockWidth( 20, 150 )
				end
			},
			{
				function ()
					return self.HeaderBacker:SetGlitchBlockHeight( 6, 0 )
				end,
				function ()
					return self.HeaderBacker:SetGlitchBlockHeight( 2, 150 )
				end
			},
			{
				function ()
					return self.HeaderBacker:SetGlitchDistortionRange( 20, 0 )
				end,
				function ()
					return self.HeaderBacker:SetGlitchDistortionRange( 4, 150 )
				end
			},
			{
				function ()
					return self.HeaderBacker:SetGlitchScanlinePitch( 55, 0 )
				end,
				function ()
					return self.HeaderBacker:SetGlitchScanlinePitch( 55, 150 )
				end
			},
			{
				function ()
					return self.HeaderBacker:SetGlitchMaskPitch( 45, 0 )
				end,
				function ()
					return self.HeaderBacker:SetGlitchMaskPitch( 45, 150 )
				end
			}
		} )
		AudioGradient:RegisterAnimationSequence( "Glitch", {
			{
				function ()
					return self.AudioGradient:SetGlitchAmount( 1, 0 )
				end,
				function ()
					return self.AudioGradient:SetGlitchAmount( 0, 150 )
				end
			},
			{
				function ()
					return self.AudioGradient:SetGlitchBlockWidth( 15, 0 )
				end,
				function ()
					return self.AudioGradient:SetGlitchBlockWidth( 20, 150 )
				end
			},
			{
				function ()
					return self.AudioGradient:SetGlitchBlockHeight( 6, 0 )
				end,
				function ()
					return self.AudioGradient:SetGlitchBlockHeight( 2, 150 )
				end
			},
			{
				function ()
					return self.AudioGradient:SetGlitchDistortionRange( 20, 0 )
				end,
				function ()
					return self.AudioGradient:SetGlitchDistortionRange( 4, 150 )
				end
			},
			{
				function ()
					return self.AudioGradient:SetGlitchScanlinePitch( 55, 0 )
				end,
				function ()
					return self.AudioGradient:SetGlitchScanlinePitch( 55, 150 )
				end
			},
			{
				function ()
					return self.AudioGradient:SetGlitchMaskPitch( 45, 0 )
				end,
				function ()
					return self.AudioGradient:SetGlitchMaskPitch( 45, 150 )
				end
			}
		} )
		CommanderImage:RegisterAnimationSequence( "Glitch", {
			{
				function ()
					return self.CommanderImage:SetGlitchAmount( 1, 0 )
				end,
				function ()
					return self.CommanderImage:SetGlitchAmount( 0, 150 )
				end
			},
			{
				function ()
					return self.CommanderImage:SetGlitchBlockWidth( 15, 0 )
				end,
				function ()
					return self.CommanderImage:SetGlitchBlockWidth( 20, 150 )
				end
			},
			{
				function ()
					return self.CommanderImage:SetGlitchBlockHeight( 6, 0 )
				end,
				function ()
					return self.CommanderImage:SetGlitchBlockHeight( 2, 150 )
				end
			},
			{
				function ()
					return self.CommanderImage:SetGlitchDistortionRange( 20, 0 )
				end,
				function ()
					return self.CommanderImage:SetGlitchDistortionRange( 4, 150 )
				end
			},
			{
				function ()
					return self.CommanderImage:SetGlitchScanlinePitch( 55, 0 )
				end,
				function ()
					return self.CommanderImage:SetGlitchScanlinePitch( 55, 150 )
				end
			},
			{
				function ()
					return self.CommanderImage:SetGlitchMaskPitch( 45, 0 )
				end,
				function ()
					return self.CommanderImage:SetGlitchMaskPitch( 45, 150 )
				end
			}
		} )
		CommanderName:RegisterAnimationSequence( "Glitch", {
			{
				function ()
					return self.CommanderName:SetGlitchAmount( 1, 0 )
				end,
				function ()
					return self.CommanderName:SetGlitchAmount( 0, 150 )
				end
			},
			{
				function ()
					return self.CommanderName:SetGlitchBlockWidth( 15, 0 )
				end,
				function ()
					return self.CommanderName:SetGlitchBlockWidth( 20, 150 )
				end
			},
			{
				function ()
					return self.CommanderName:SetGlitchBlockHeight( 6, 0 )
				end,
				function ()
					return self.CommanderName:SetGlitchBlockHeight( 2, 150 )
				end
			},
			{
				function ()
					return self.CommanderName:SetGlitchDistortionRange( 20, 0 )
				end,
				function ()
					return self.CommanderName:SetGlitchDistortionRange( 4, 150 )
				end
			},
			{
				function ()
					return self.CommanderName:SetGlitchScanlinePitch( 55, 0 )
				end,
				function ()
					return self.CommanderName:SetGlitchScanlinePitch( 55, 150 )
				end
			},
			{
				function ()
					return self.CommanderName:SetGlitchMaskPitch( 45, 0 )
				end,
				function ()
					return self.CommanderName:SetGlitchMaskPitch( 45, 150 )
				end
			}
		} )
		Accentbar:RegisterAnimationSequence( "Glitch", {
			{
				function ()
					return self.Accentbar:SetGlitchAmount( 1, 0 )
				end,
				function ()
					return self.Accentbar:SetGlitchAmount( 0, 150 )
				end
			},
			{
				function ()
					return self.Accentbar:SetGlitchBlockWidth( 15, 0 )
				end,
				function ()
					return self.Accentbar:SetGlitchBlockWidth( 20, 150 )
				end
			},
			{
				function ()
					return self.Accentbar:SetGlitchBlockHeight( 6, 0 )
				end,
				function ()
					return self.Accentbar:SetGlitchBlockHeight( 2, 150 )
				end
			},
			{
				function ()
					return self.Accentbar:SetGlitchDistortionRange( 20, 0 )
				end,
				function ()
					return self.Accentbar:SetGlitchDistortionRange( 4, 150 )
				end
			},
			{
				function ()
					return self.Accentbar:SetGlitchScanlinePitch( 55, 0 )
				end,
				function ()
					return self.Accentbar:SetGlitchScanlinePitch( 55, 150 )
				end
			},
			{
				function ()
					return self.Accentbar:SetGlitchMaskPitch( 45, 0 )
				end,
				function ()
					return self.Accentbar:SetGlitchMaskPitch( 45, 150 )
				end
			}
		} )
		Icon:RegisterAnimationSequence( "Glitch", {
			{
				function ()
					return self.Icon:SetGlitchAmount( 1, 0 )
				end,
				function ()
					return self.Icon:SetGlitchAmount( 0, 150 )
				end
			},
			{
				function ()
					return self.Icon:SetGlitchBlockWidth( 15, 0 )
				end,
				function ()
					return self.Icon:SetGlitchBlockWidth( 20, 150 )
				end
			},
			{
				function ()
					return self.Icon:SetGlitchBlockHeight( 6, 0 )
				end,
				function ()
					return self.Icon:SetGlitchBlockHeight( 2, 150 )
				end
			},
			{
				function ()
					return self.Icon:SetGlitchDistortionRange( 20, 0 )
				end,
				function ()
					return self.Icon:SetGlitchDistortionRange( 4, 150 )
				end
			},
			{
				function ()
					return self.Icon:SetGlitchScanlinePitch( 55, 0 )
				end,
				function ()
					return self.Icon:SetGlitchScanlinePitch( 55, 150 )
				end
			},
			{
				function ()
					return self.Icon:SetGlitchMaskPitch( 45, 0 )
				end,
				function ()
					return self.Icon:SetGlitchMaskPitch( 45, 150 )
				end
			}
		} )
		AudioBacker:RegisterAnimationSequence( "Glitch", {
			{
				function ()
					return self.AudioBacker:SetGlitchAmount( 1, 0 )
				end,
				function ()
					return self.AudioBacker:SetGlitchAmount( 0, 150 )
				end
			},
			{
				function ()
					return self.AudioBacker:SetGlitchBlockWidth( 15, 0 )
				end,
				function ()
					return self.AudioBacker:SetGlitchBlockWidth( 20, 150 )
				end
			},
			{
				function ()
					return self.AudioBacker:SetGlitchBlockHeight( 6, 0 )
				end,
				function ()
					return self.AudioBacker:SetGlitchBlockHeight( 2, 150 )
				end
			},
			{
				function ()
					return self.AudioBacker:SetGlitchDistortionRange( 20, 0 )
				end,
				function ()
					return self.AudioBacker:SetGlitchDistortionRange( 4, 150 )
				end
			},
			{
				function ()
					return self.AudioBacker:SetGlitchScanlinePitch( 55, 0 )
				end
			},
			{
				function ()
					return self.AudioBacker:SetGlitchMaskPitch( 45, 0 )
				end
			}
		} )
		Audio:RegisterAnimationSequence( "Glitch", {
			{
				function ()
					return self.Audio:SetGlitchAmount( 1, 0 )
				end,
				function ()
					return self.Audio:SetGlitchAmount( 0, 150 )
				end
			},
			{
				function ()
					return self.Audio:SetGlitchBlockWidth( 15, 0 )
				end,
				function ()
					return self.Audio:SetGlitchBlockWidth( 20, 150 )
				end
			},
			{
				function ()
					return self.Audio:SetGlitchBlockHeight( 6, 0 )
				end,
				function ()
					return self.Audio:SetGlitchBlockHeight( 2, 150 )
				end
			},
			{
				function ()
					return self.Audio:SetGlitchDistortionRange( 20, 0 )
				end,
				function ()
					return self.Audio:SetGlitchDistortionRange( 4, 150 )
				end
			},
			{
				function ()
					return self.Audio:SetGlitchScanlinePitch( 55, 0 )
				end,
				function ()
					return self.Audio:SetGlitchScanlinePitch( 55, 150 )
				end
			},
			{
				function ()
					return self.Audio:SetGlitchMaskPitch( 45, 0 )
				end,
				function ()
					return self.Audio:SetGlitchMaskPitch( 45, 150 )
				end
			}
		} )
		self._sequences.Glitch = function ()
			DropShadow:AnimateSequence( "Glitch" )
			Background:AnimateSequence( "Glitch" )
			ColorOverlay:AnimateSequence( "Glitch" )
			GradientOverlay:AnimateSequence( "Glitch" )
			HeaderBacker:AnimateSequence( "Glitch" )
			AudioGradient:AnimateSequence( "Glitch" )
			CommanderImage:AnimateSequence( "Glitch" )
			CommanderName:AnimateSequence( "Glitch" )
			Accentbar:AnimateSequence( "Glitch" )
			Icon:AnimateSequence( "Glitch" )
			AudioBacker:AnimateSequence( "Glitch" )
			Audio:AnimateSequence( "Glitch" )
		end
		
		Glow:RegisterAnimationSequence( "GlowSplash", {
			{
				function ()
					return self.Glow:SetAlpha( 0.3, 0 )
				end,
				function ()
					return self.Glow:SetAlpha( 0, 30 )
				end,
				function ()
					return self.Glow:SetAlpha( 0.5, 30 )
				end,
				function ()
					return self.Glow:SetAlpha( 0, 30 )
				end,
				function ()
					return self.Glow:SetAlpha( 0.75, 30 )
				end,
				function ()
					return self.Glow:SetAlpha( 0, 30 )
				end,
				function ()
					return self.Glow:SetAlpha( 1, 30 )
				end,
				function ()
					return self.Glow:SetAlpha( 0, 190 )
				end,
				function ()
					return self.Glow:SetAlpha( 0.4, 10 )
				end,
				function ()
					return self.Glow:SetAlpha( 0, 620, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.Glow:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -50, _1080p * 60, _1080p * -93, _1080p * 107, 0 )
				end,
				function ()
					return self.Glow:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -50, _1080p * 60, _1080p * -93, _1080p * 107, 180 )
				end,
				function ()
					return self.Glow:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -141.47, _1080p * 369.87, _1080p * -161.53, _1080p * 220.8, 189 )
				end,
				function ()
					return self.Glow:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -50, _1080p * 60, _1080p * -93, _1080p * 107, 9 )
				end,
				function ()
					return self.Glow:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -141.47, _1080p * 369.87, _1080p * -161.53, _1080p * 220.8, 620, LUI.EASING.outQuadratic )
				end
			}
		} )
		self._sequences.GlowSplash = function ()
			Glow:AnimateSequence( "GlowSplash" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f7_local1, controller )
	return self
end

MenuBuilder.registerType( "CommanderMessage", CommanderMessage )
LockTable( _M )
