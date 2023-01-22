local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	local f1_local0 = Engine.GetPlayerDataEx( f1_arg1, CoD.StatsGroup.Ranked, "timePlayedTotal" )
	local f1_local1 = 86400
	local f1_local2 = math.floor( f1_local0 / f1_local1 )
	f1_local0 = f1_local0 - f1_local2 * f1_local1
	local f1_local3 = 3600
	local f1_local4 = math.floor( f1_local0 / f1_local3 )
	f1_local0 = f1_local0 - f1_local4 * f1_local3
	local f1_local5 = math.floor( f1_local0 / 60 )
	f1_arg0.TimePlayed:setText( Engine.Localize( "MENU_SP_TIME_PLAYED_DHMS", f1_local2, f1_local4, f1_local5, f1_local0 - f1_local5 * 60 ) )
	f1_arg0.HighScore:setText( Engine.GetPlayerDataEx( f1_arg1, CoD.StatsGroup.Ranked, "bestScores", "score" ) )
	f1_arg0.HighScorePerMinute:setText( Engine.GetPlayerDataEx( f1_arg1, CoD.StatsGroup.Ranked, "bestSPM", "score" ) )
	assert( f1_arg0.MostXP )
	f1_arg0.MostXP:setText( Engine.GetPlayerDataEx( f1_arg1, CoD.StatsGroup.Ranked, "mostXp" ) )
	f1_arg0.HighKillStreak:setText( Engine.GetPlayerDataEx( f1_arg1, CoD.StatsGroup.Ranked, "bestScores", "killStreak" ) )
	f1_arg0.HighKillDeath:setText( string.format( "%.2f", Engine.GetPlayerDataEx( f1_arg1, CoD.StatsGroup.Ranked, "bestKD", "score" ) / 1000 ) )
	f1_arg0.HighKills:setText( Engine.GetPlayerDataEx( f1_arg1, CoD.StatsGroup.Ranked, "bestScores", "kills" ) )
end

function HeadquartersHighScoreRecords( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 500 * _1080p, 0, 631 * _1080p )
	self.id = "HeadquartersHighScoreRecords"
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local Blur = nil
	
	Blur = LUI.UIBlur.new()
	Blur.id = "Blur"
	Blur:SetRGBFromInt( 12566463, 0 )
	Blur:SetUseAA( true )
	Blur:SetBlurStrength( 2.75, 0 )
	self:addElement( Blur )
	self.Blur = Blur
	
	local BlackHeaderBar4 = nil
	
	BlackHeaderBar4 = LUI.UIImage.new()
	BlackHeaderBar4.id = "BlackHeaderBar4"
	BlackHeaderBar4:SetRGBFromInt( 0, 0 )
	BlackHeaderBar4:SetAlpha( 0.4, 0 )
	BlackHeaderBar4:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 8, _1080p * -7, _1080p * 426.75, _1080p * 456.75 )
	self:addElement( BlackHeaderBar4 )
	self.BlackHeaderBar4 = BlackHeaderBar4
	
	local BlackHeaderBar3 = nil
	
	BlackHeaderBar3 = LUI.UIImage.new()
	BlackHeaderBar3.id = "BlackHeaderBar3"
	BlackHeaderBar3:SetRGBFromInt( 0, 0 )
	BlackHeaderBar3:SetAlpha( 0.4, 0 )
	BlackHeaderBar3:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 8, _1080p * -7, _1080p * 296.25, _1080p * 326.25 )
	self:addElement( BlackHeaderBar3 )
	self.BlackHeaderBar3 = BlackHeaderBar3
	
	local BlackHeaderBar2 = nil
	
	BlackHeaderBar2 = LUI.UIImage.new()
	BlackHeaderBar2.id = "BlackHeaderBar2"
	BlackHeaderBar2:SetRGBFromInt( 0, 0 )
	BlackHeaderBar2:SetAlpha( 0.4, 0 )
	BlackHeaderBar2:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 8, _1080p * -7, _1080p * 165.25, _1080p * 195.25 )
	self:addElement( BlackHeaderBar2 )
	self.BlackHeaderBar2 = BlackHeaderBar2
	
	local BlackHeaderBar1 = nil
	
	BlackHeaderBar1 = LUI.UIImage.new()
	BlackHeaderBar1.id = "BlackHeaderBar1"
	BlackHeaderBar1:SetRGBFromInt( 0, 0 )
	BlackHeaderBar1:SetAlpha( 0.4, 0 )
	BlackHeaderBar1:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 8, _1080p * -7, _1080p * 35, _1080p * 65 )
	self:addElement( BlackHeaderBar1 )
	self.BlackHeaderBar1 = BlackHeaderBar1
	
	local DividerBar3 = nil
	
	DividerBar3 = LUI.UIImage.new()
	DividerBar3.id = "DividerBar3"
	DividerBar3:SetRGBFromInt( 0, 0 )
	DividerBar3:SetAlpha( 0.4, 0 )
	DividerBar3:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 239, _1080p * -257, _1080p * 336.25, _1080p * 416.75 )
	self:addElement( DividerBar3 )
	self.DividerBar3 = DividerBar3
	
	local DividerBar2 = nil
	
	DividerBar2 = LUI.UIImage.new()
	DividerBar2.id = "DividerBar2"
	DividerBar2:SetRGBFromInt( 0, 0 )
	DividerBar2:SetAlpha( 0.4, 0 )
	DividerBar2:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 239, _1080p * -257, _1080p * 205.25, _1080p * 286.25 )
	self:addElement( DividerBar2 )
	self.DividerBar2 = DividerBar2
	
	local DividerBar1 = nil
	
	DividerBar1 = LUI.UIImage.new()
	DividerBar1.id = "DividerBar1"
	DividerBar1:SetRGBFromInt( 0, 0 )
	DividerBar1:SetAlpha( 0.4, 0 )
	DividerBar1:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 239, _1080p * -257, _1080p * 75, _1080p * 155.25 )
	self:addElement( DividerBar1 )
	self.DividerBar1 = DividerBar1
	
	local HighKills = nil
	
	HighKills = LUI.UIText.new()
	HighKills.id = "HighKills"
	HighKills:setText( "", 0 )
	HighKills:SetFontSize( 48 * _1080p )
	HighKills:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	HighKills:SetAlignment( LUI.Alignment.Center )
	HighKills:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 19.6, _1080p * 228.5, _1080p * 91.5, _1080p * 139.5 )
	self:addElement( HighKills )
	self.HighKills = HighKills
	
	local HighKillDeath = nil
	
	HighKillDeath = LUI.UIText.new()
	HighKillDeath.id = "HighKillDeath"
	HighKillDeath:setText( "", 0 )
	HighKillDeath:SetFontSize( 48 * _1080p )
	HighKillDeath:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	HighKillDeath:SetAlignment( LUI.Alignment.Center )
	HighKillDeath:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 20.38, _1080p * 228.5, _1080p * 221.75, _1080p * 269.75 )
	self:addElement( HighKillDeath )
	self.HighKillDeath = HighKillDeath
	
	local HighKillStreak = nil
	
	HighKillStreak = LUI.UIText.new()
	HighKillStreak.id = "HighKillStreak"
	HighKillStreak:setText( "", 0 )
	HighKillStreak:SetFontSize( 48 * _1080p )
	HighKillStreak:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	HighKillStreak:SetAlignment( LUI.Alignment.Center )
	HighKillStreak:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 20.38, _1080p * 228.5, _1080p * 352.5, _1080p * 400.5 )
	self:addElement( HighKillStreak )
	self.HighKillStreak = HighKillStreak
	
	local MostXP = nil
	
	MostXP = LUI.UIText.new()
	MostXP.id = "MostXP"
	MostXP:setText( "", 0 )
	MostXP:SetFontSize( 48 * _1080p )
	MostXP:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	MostXP:SetAlignment( LUI.Alignment.Center )
	MostXP:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -224.75, _1080p * -31.38, _1080p * 352.5, _1080p * 400.5 )
	self:addElement( MostXP )
	self.MostXP = MostXP
	
	local HighScorePerMinute = nil
	
	HighScorePerMinute = LUI.UIText.new()
	HighScorePerMinute.id = "HighScorePerMinute"
	HighScorePerMinute:setText( "", 0 )
	HighScorePerMinute:SetFontSize( 48 * _1080p )
	HighScorePerMinute:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	HighScorePerMinute:SetAlignment( LUI.Alignment.Center )
	HighScorePerMinute:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -224.75, _1080p * -31.38, _1080p * 221.75, _1080p * 269.75 )
	self:addElement( HighScorePerMinute )
	self.HighScorePerMinute = HighScorePerMinute
	
	local HighScore = nil
	
	HighScore = LUI.UIText.new()
	HighScore.id = "HighScore"
	HighScore:setText( "", 0 )
	HighScore:SetFontSize( 48 * _1080p )
	HighScore:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	HighScore:SetAlignment( LUI.Alignment.Center )
	HighScore:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -224.75, _1080p * -31.38, _1080p * 91.5, _1080p * 139.5 )
	self:addElement( HighScore )
	self.HighScore = HighScore
	
	local TimePlayed = nil
	
	TimePlayed = LUI.UIText.new()
	TimePlayed.id = "TimePlayed"
	TimePlayed:setText( "", 0 )
	TimePlayed:SetFontSize( 48 * _1080p )
	TimePlayed:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	TimePlayed:SetAlignment( LUI.Alignment.Center )
	TimePlayed:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 11, _1080p * -8, _1080p * -115.5, _1080p * -67.5 )
	self:addElement( TimePlayed )
	self.TimePlayed = TimePlayed
	
	local TimePlayedLabel = nil
	
	TimePlayedLabel = LUI.UIText.new()
	TimePlayedLabel.id = "TimePlayedLabel"
	TimePlayedLabel:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_TOTAL_TIME_PLAYED" ) ), 0 )
	TimePlayedLabel:SetFontSize( 16 * _1080p )
	TimePlayedLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	TimePlayedLabel:SetAlignment( LUI.Alignment.Left )
	TimePlayedLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 20, _1080p * 480, _1080p * 433.75, _1080p * 449.75 )
	self:addElement( TimePlayedLabel )
	self.TimePlayedLabel = TimePlayedLabel
	
	local HighKillsLabel = nil
	
	HighKillsLabel = LUI.UIText.new()
	HighKillsLabel.id = "HighKillsLabel"
	HighKillsLabel:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_HIGHEST_KILLS" ) ), 0 )
	HighKillsLabel:SetFontSize( 16 * _1080p )
	HighKillsLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	HighKillsLabel:SetAlignment( LUI.Alignment.Left )
	HighKillsLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 20, _1080p * 240, _1080p * 41.25, _1080p * 57.25 )
	self:addElement( HighKillsLabel )
	self.HighKillsLabel = HighKillsLabel
	
	local HighScoreLabel = nil
	
	HighScoreLabel = LUI.UIText.new()
	HighScoreLabel.id = "HighScoreLabel"
	HighScoreLabel:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_HIGHEST_SCORE" ) ), 0 )
	HighScoreLabel:SetFontSize( 16 * _1080p )
	HighScoreLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	HighScoreLabel:SetAlignment( LUI.Alignment.Left )
	HighScoreLabel:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -240, _1080p * -20, _1080p * 41.25, _1080p * 57.25 )
	self:addElement( HighScoreLabel )
	self.HighScoreLabel = HighScoreLabel
	
	local HighKillDeathLabel = nil
	
	HighKillDeathLabel = LUI.UIText.new()
	HighKillDeathLabel.id = "HighKillDeathLabel"
	HighKillDeathLabel:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_HIGHEST_KD" ) ), 0 )
	HighKillDeathLabel:SetFontSize( 16 * _1080p )
	HighKillDeathLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	HighKillDeathLabel:SetAlignment( LUI.Alignment.Left )
	HighKillDeathLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 20, _1080p * 240, _1080p * 172.25, _1080p * 188.25 )
	self:addElement( HighKillDeathLabel )
	self.HighKillDeathLabel = HighKillDeathLabel
	
	local HighScorePerMinuteLabel = nil
	
	HighScorePerMinuteLabel = LUI.UIText.new()
	HighScorePerMinuteLabel.id = "HighScorePerMinuteLabel"
	HighScorePerMinuteLabel:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_HIGHEST_SPM" ) ), 0 )
	HighScorePerMinuteLabel:SetFontSize( 16 * _1080p )
	HighScorePerMinuteLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	HighScorePerMinuteLabel:SetAlignment( LUI.Alignment.Left )
	HighScorePerMinuteLabel:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -240, _1080p * -20, _1080p * 172.25, _1080p * 188.25 )
	self:addElement( HighScorePerMinuteLabel )
	self.HighScorePerMinuteLabel = HighScorePerMinuteLabel
	
	local HighKillStreakLabel = nil
	
	HighKillStreakLabel = LUI.UIText.new()
	HighKillStreakLabel.id = "HighKillStreakLabel"
	HighKillStreakLabel:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_KILLS_WO_DYING" ) ), 0 )
	HighKillStreakLabel:SetFontSize( 16 * _1080p )
	HighKillStreakLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	HighKillStreakLabel:SetAlignment( LUI.Alignment.Left )
	HighKillStreakLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 20, _1080p * 240, _1080p * 303.25, _1080p * 319.25 )
	self:addElement( HighKillStreakLabel )
	self.HighKillStreakLabel = HighKillStreakLabel
	
	local MostXPLabel = nil
	
	MostXPLabel = LUI.UIText.new()
	MostXPLabel.id = "MostXPLabel"
	MostXPLabel:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_MOST_XP" ) ), 0 )
	MostXPLabel:SetFontSize( 16 * _1080p )
	MostXPLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	MostXPLabel:SetAlignment( LUI.Alignment.Left )
	MostXPLabel:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -240, _1080p * -20, _1080p * 303.25, _1080p * 319.25 )
	self:addElement( MostXPLabel )
	self.MostXPLabel = MostXPLabel
	
	local RecordsLabel = nil
	
	RecordsLabel = LUI.UIText.new()
	RecordsLabel.id = "RecordsLabel"
	RecordsLabel:setText( ToUpperCase( Engine.Localize( "LUA_MENU_RECORDS" ) ), 0 )
	RecordsLabel:SetFontSize( 20 * _1080p )
	RecordsLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	RecordsLabel:SetAlignment( LUI.Alignment.Left )
	RecordsLabel:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 7.5, _1080p * -8, _1080p * 5.75, _1080p * 25.75 )
	self:addElement( RecordsLabel )
	self.RecordsLabel = RecordsLabel
	
	PostLoadFunc( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "HeadquartersHighScoreRecords", HeadquartersHighScoreRecords )
LockTable( _M )
