local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	if IsLanguageChinese() or IsLanguageJapanese() then
		ACTIONS.AnimateSequence( f1_arg0, "TextLabelShiftDown" )
	end
end

function HeadquartersCombatRecordPreviewCP( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 953 * _1080p, 0, 543 * _1080p )
	self.id = "HeadquartersCombatRecordPreviewCP"
	self._animationSets = {}
	self._sequences = {}
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 3684408, 0 )
	Background:SetAlpha( 0.5, 0 )
	Background:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 176.5, _1080p * 950, _1080p * 51.5, _1080p * 478.5 )
	self:addElement( Background )
	self.Background = Background
	
	local revivesValueBar = nil
	
	revivesValueBar = LUI.UIImage.new()
	revivesValueBar.id = "revivesValueBar"
	revivesValueBar:SetRGBFromInt( 657930, 0 )
	revivesValueBar:SetAlpha( 0.5, 0 )
	revivesValueBar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 256.5, _1080p * 936.5, _1080p * 323, _1080p * 368.5 )
	self:addElement( revivesValueBar )
	self.revivesValueBar = revivesValueBar
	
	local headshotsValueBar = nil
	
	headshotsValueBar = LUI.UIImage.new()
	headshotsValueBar.id = "headshotsValueBar"
	headshotsValueBar:SetRGBFromInt( 657930, 0 )
	headshotsValueBar:SetAlpha( 0.5, 0 )
	headshotsValueBar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 256.5, _1080p * 936.5, _1080p * 212, _1080p * 257.5 )
	self:addElement( headshotsValueBar )
	self.headshotsValueBar = headshotsValueBar
	
	local KillsValueBar = nil
	
	KillsValueBar = LUI.UIImage.new()
	KillsValueBar.id = "KillsValueBar"
	KillsValueBar:SetRGBFromInt( 657930, 0 )
	KillsValueBar:SetAlpha( 0.5, 0 )
	KillsValueBar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 256.5, _1080p * 936.5, _1080p * 98.5, _1080p * 144 )
	self:addElement( KillsValueBar )
	self.KillsValueBar = KillsValueBar
	
	local SubheaderKills = nil
	
	SubheaderKills = LUI.UIImage.new()
	SubheaderKills.id = "SubheaderKills"
	SubheaderKills:SetRGBFromInt( 9048832, 0 )
	SubheaderKills:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 256.5, _1080p * 936.5, _1080p * 69.6, _1080p * 100.6 )
	self:addElement( SubheaderKills )
	self.SubheaderKills = SubheaderKills
	
	local SubheaderHeadshots = nil
	
	SubheaderHeadshots = LUI.UIImage.new()
	SubheaderHeadshots.id = "SubheaderHeadshots"
	SubheaderHeadshots:SetRGBFromInt( 9048832, 0 )
	SubheaderHeadshots:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 256.5, _1080p * 936.5, _1080p * 183.6, _1080p * 214.6 )
	self:addElement( SubheaderHeadshots )
	self.SubheaderHeadshots = SubheaderHeadshots
	
	local SubheaderRevives = nil
	
	SubheaderRevives = LUI.UIImage.new()
	SubheaderRevives.id = "SubheaderRevives"
	SubheaderRevives:SetRGBFromInt( 9048832, 0 )
	SubheaderRevives:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 256.5, _1080p * 936.5, _1080p * 292.6, _1080p * 323.6 )
	self:addElement( SubheaderRevives )
	self.SubheaderRevives = SubheaderRevives
	
	local KillsValue = nil
	
	KillsValue = LUI.UIStyledText.new()
	KillsValue.id = "KillsValue"
	KillsValue:SetRGBFromTable( SWATCHES.Zombies.fateCardLightBar, 0 )
	KillsValue:SetFontSize( 50 * _1080p )
	KillsValue:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	KillsValue:SetAlignment( LUI.Alignment.Left )
	KillsValue:SetOptOutRightToLeftAlignmentFlip( true )
	KillsValue:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 261.5, _1080p * 460.5, _1080p * 98.25, _1080p * 148.25 )
	KillsValue:SubscribeToModel( DataSources.alwaysLoaded.playerData.CP.coopCareerStats.Kills:GetModel( f2_local1 ), function ()
		local f3_local0 = DataSources.alwaysLoaded.playerData.CP.coopCareerStats.Kills:GetValue( f2_local1 )
		if f3_local0 ~= nil then
			KillsValue:setText( f3_local0, 0 )
		end
	end )
	self:addElement( KillsValue )
	self.KillsValue = KillsValue
	
	local KillsTitle = nil
	
	KillsTitle = LUI.UIStyledText.new()
	KillsTitle.id = "KillsTitle"
	KillsTitle:setText( ToUpperCase( Engine.Localize( "MENU_KILLS" ) ), 0 )
	KillsTitle:SetFontSize( 22 * _1080p )
	KillsTitle:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	KillsTitle:SetAlignment( LUI.Alignment.Left )
	KillsTitle:SetOptOutRightToLeftAlignmentFlip( true )
	KillsTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 263.5, _1080p * 439.5, _1080p * 74.5, _1080p * 96.5 )
	self:addElement( KillsTitle )
	self.KillsTitle = KillsTitle
	
	local HeadshotsValue = nil
	
	HeadshotsValue = LUI.UIStyledText.new()
	HeadshotsValue.id = "HeadshotsValue"
	HeadshotsValue:SetRGBFromTable( SWATCHES.Zombies.fateCardLightBar, 0 )
	HeadshotsValue:SetFontSize( 50 * _1080p )
	HeadshotsValue:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	HeadshotsValue:SetAlignment( LUI.Alignment.Left )
	HeadshotsValue:SetOptOutRightToLeftAlignmentFlip( true )
	HeadshotsValue:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 263.5, _1080p * 462.5, _1080p * 211.25, _1080p * 261.25 )
	HeadshotsValue:SubscribeToModel( DataSources.alwaysLoaded.playerData.CP.coopCareerStats.Headshot_Kills:GetModel( f2_local1 ), function ()
		local f4_local0 = DataSources.alwaysLoaded.playerData.CP.coopCareerStats.Headshot_Kills:GetValue( f2_local1 )
		if f4_local0 ~= nil then
			HeadshotsValue:setText( f4_local0, 0 )
		end
	end )
	self:addElement( HeadshotsValue )
	self.HeadshotsValue = HeadshotsValue
	
	local HeadshotsTitle = nil
	
	HeadshotsTitle = LUI.UIStyledText.new()
	HeadshotsTitle.id = "HeadshotsTitle"
	HeadshotsTitle:setText( ToUpperCase( Engine.Localize( "LUA_MENU_WEAPPERF_HEADSHOTS" ) ), 0 )
	HeadshotsTitle:SetFontSize( 22 * _1080p )
	HeadshotsTitle:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	HeadshotsTitle:SetAlignment( LUI.Alignment.Left )
	HeadshotsTitle:SetOptOutRightToLeftAlignmentFlip( true )
	HeadshotsTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 263.5, _1080p * 439.5, _1080p * 187.5, _1080p * 209.5 )
	self:addElement( HeadshotsTitle )
	self.HeadshotsTitle = HeadshotsTitle
	
	local GamesPlayedTitle = nil
	
	GamesPlayedTitle = LUI.UIStyledText.new()
	GamesPlayedTitle.id = "GamesPlayedTitle"
	GamesPlayedTitle:setText( ToUpperCase( Engine.Localize( "LUA_MENU_GAMES_PLAYED" ) ), 0 )
	GamesPlayedTitle:SetFontSize( 22 * _1080p )
	GamesPlayedTitle:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	GamesPlayedTitle:SetAlignment( LUI.Alignment.Left )
	GamesPlayedTitle:SetOptOutRightToLeftAlignmentFlip( true )
	GamesPlayedTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 475.5, _1080p * 676.5, _1080p * 73.6, _1080p * 95.6 )
	self:addElement( GamesPlayedTitle )
	self.GamesPlayedTitle = GamesPlayedTitle
	
	local GamesPlayedValue = nil
	
	GamesPlayedValue = LUI.UIStyledText.new()
	GamesPlayedValue.id = "GamesPlayedValue"
	GamesPlayedValue:SetRGBFromTable( SWATCHES.Zombies.fateCardLightBar, 0 )
	GamesPlayedValue:SetFontSize( 50 * _1080p )
	GamesPlayedValue:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	GamesPlayedValue:SetAlignment( LUI.Alignment.Left )
	GamesPlayedValue:SetOptOutRightToLeftAlignmentFlip( true )
	GamesPlayedValue:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 476.5, _1080p * 676.5, _1080p * 98.25, _1080p * 148.25 )
	GamesPlayedValue:SubscribeToModel( DataSources.alwaysLoaded.playerData.CP.coopCareerStats.gamesPlayed:GetModel( f2_local1 ), function ()
		local f5_local0 = DataSources.alwaysLoaded.playerData.CP.coopCareerStats.gamesPlayed:GetValue( f2_local1 )
		if f5_local0 ~= nil then
			GamesPlayedValue:setText( f5_local0, 0 )
		end
	end )
	self:addElement( GamesPlayedValue )
	self.GamesPlayedValue = GamesPlayedValue
	
	local HighestRoundTitle = nil
	
	HighestRoundTitle = LUI.UIStyledText.new()
	HighestRoundTitle.id = "HighestRoundTitle"
	HighestRoundTitle:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_HIGHEST_SCENE" ) ), 0 )
	HighestRoundTitle:SetFontSize( 22 * _1080p )
	HighestRoundTitle:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	HighestRoundTitle:SetAlignment( LUI.Alignment.Left )
	HighestRoundTitle:SetOptOutRightToLeftAlignmentFlip( true )
	HighestRoundTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 700, _1080p * 922.5, _1080p * 187, _1080p * 209 )
	self:addElement( HighestRoundTitle )
	self.HighestRoundTitle = HighestRoundTitle
	
	local HighestRoundValue = nil
	
	HighestRoundValue = LUI.UIStyledText.new()
	HighestRoundValue.id = "HighestRoundValue"
	HighestRoundValue:SetRGBFromTable( SWATCHES.Zombies.fateCardLightBar, 0 )
	HighestRoundValue:SetFontSize( 50 * _1080p )
	HighestRoundValue:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	HighestRoundValue:SetAlignment( LUI.Alignment.Left )
	HighestRoundValue:SetOptOutRightToLeftAlignmentFlip( true )
	HighestRoundValue:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 696.5, _1080p * 896.5, _1080p * 210.75, _1080p * 260.75 )
	HighestRoundValue:SubscribeToModel( DataSources.alwaysLoaded.playerData.CP.coopCareerStats.Highest_Wave:GetModel( f2_local1 ), function ()
		local f6_local0 = DataSources.alwaysLoaded.playerData.CP.coopCareerStats.Highest_Wave:GetValue( f2_local1 )
		if f6_local0 ~= nil then
			HighestRoundValue:setText( f6_local0, 0 )
		end
	end )
	self:addElement( HighestRoundValue )
	self.HighestRoundValue = HighestRoundValue
	
	local PlayedBar = nil
	
	PlayedBar = LUI.UIImage.new()
	PlayedBar.id = "PlayedBar"
	PlayedBar:SetRGBFromInt( 5395026, 0 )
	PlayedBar:SetAlpha( 0.5, 0 )
	PlayedBar:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 950, _1080p * 494, _1080p * 537.6 )
	self:addElement( PlayedBar )
	self.PlayedBar = PlayedBar
	
	local TimePlayedTitle = nil
	
	TimePlayedTitle = LUI.UIStyledText.new()
	TimePlayedTitle.id = "TimePlayedTitle"
	TimePlayedTitle:SetFontSize( 32 * _1080p )
	TimePlayedTitle:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	TimePlayedTitle:SetAlignment( LUI.Alignment.Center )
	TimePlayedTitle:SetOptOutRightToLeftAlignmentFlip( true )
	TimePlayedTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 223, _1080p * 730, _1080p * 496, _1080p * 528 )
	TimePlayedTitle:SubscribeToModel( DataSources.frontEnd.CP.totalGameplayTimeTextFilter:GetModel( f2_local1 ), function ()
		local f7_local0 = DataSources.frontEnd.CP.totalGameplayTimeTextFilter:GetValue( f2_local1 )
		if f7_local0 ~= nil then
			TimePlayedTitle:setText( f7_local0, 0 )
		end
	end )
	self:addElement( TimePlayedTitle )
	self.TimePlayedTitle = TimePlayedTitle
	
	local RankBox = nil
	
	RankBox = LUI.UIImage.new()
	RankBox.id = "RankBox"
	RankBox:SetRGBFromInt( 5395026, 0 )
	RankBox:SetAlpha( 0.5, 0 )
	RankBox:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 176.5, _1080p * 51.5, _1080p * 482.75 )
	self:addElement( RankBox )
	self.RankBox = RankBox
	
	local RankIcon = nil
	
	RankIcon = LUI.UIImage.new()
	RankIcon.id = "RankIcon"
	RankIcon:SetScale( 1.5, 0 )
	RankIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 51.25, _1080p * 115.25, _1080p * 179, _1080p * 243 )
	RankIcon:SubscribeToModel( DataSources.alwaysLoaded.CP.ranked.progression.rankIcon:GetModel( f2_local1 ), function ()
		local f8_local0 = DataSources.alwaysLoaded.CP.ranked.progression.rankIcon:GetValue( f2_local1 )
		if f8_local0 ~= nil then
			RankIcon:setImage( RegisterMaterial( f8_local0 ), 0 )
		end
	end )
	self:addElement( RankIcon )
	self.RankIcon = RankIcon
	
	local LevelTitle = nil
	
	LevelTitle = LUI.UIText.new()
	LevelTitle.id = "LevelTitle"
	LevelTitle:setText( Engine.Localize( "LUA_MENU_LEVEL_CAPS" ), 0 )
	LevelTitle:SetFontSize( 38 * _1080p )
	LevelTitle:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	LevelTitle:SetAlignment( LUI.Alignment.Center )
	LevelTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 3.75, _1080p * 166.75, _1080p * 294, _1080p * 332 )
	self:addElement( LevelTitle )
	self.LevelTitle = LevelTitle
	
	local Rank = nil
	
	Rank = LUI.UIText.new()
	Rank.id = "Rank"
	Rank:SetRGBFromInt( 14277081, 0 )
	Rank:SetFontSize( 64 * _1080p )
	Rank:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	Rank:SetAlignment( LUI.Alignment.Center )
	Rank:SetOptOutRightToLeftAlignmentFlip( true )
	Rank:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 28.99, _1080p * 137.51, _1080p * 328.6, _1080p * 392.6 )
	Rank:SubscribeToModel( DataSources.alwaysLoaded.CP.ranked.progression.rankDisplay:GetModel( f2_local1 ), function ()
		local f9_local0 = DataSources.alwaysLoaded.CP.ranked.progression.rankDisplay:GetValue( f2_local1 )
		if f9_local0 ~= nil then
			Rank:setText( f9_local0, 0 )
		end
	end )
	self:addElement( Rank )
	self.Rank = Rank
	
	local AvgRoundGameValue = nil
	
	AvgRoundGameValue = LUI.UIText.new()
	AvgRoundGameValue.id = "AvgRoundGameValue"
	AvgRoundGameValue:SetRGBFromTable( SWATCHES.Zombies.fateCardLightBar, 0 )
	AvgRoundGameValue:SetFontSize( 50 * _1080p )
	AvgRoundGameValue:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	AvgRoundGameValue:SetAlignment( LUI.Alignment.Left )
	AvgRoundGameValue:SetOptOutRightToLeftAlignmentFlip( true )
	AvgRoundGameValue:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 696.5, _1080p * 896.5, _1080p * 320.75, _1080p * 370.75 )
	AvgRoundGameValue:SubscribeToModel( DataSources.frontEnd.CP.avgWavesFilter:GetModel( f2_local1 ), function ()
		local f10_local0 = DataSources.frontEnd.CP.avgWavesFilter:GetValue( f2_local1 )
		if f10_local0 ~= nil then
			AvgRoundGameValue:setText( f10_local0, 0 )
		end
	end )
	self:addElement( AvgRoundGameValue )
	self.AvgRoundGameValue = AvgRoundGameValue
	
	local AvgRoundGameTitle = nil
	
	AvgRoundGameTitle = LUI.UIText.new()
	AvgRoundGameTitle.id = "AvgRoundGameTitle"
	AvgRoundGameTitle:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_AVERAGE_SCENES_PER_GAME" ) ), 0 )
	AvgRoundGameTitle:SetFontSize( 22 * _1080p )
	AvgRoundGameTitle:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	AvgRoundGameTitle:SetAlignment( LUI.Alignment.Left )
	AvgRoundGameTitle:SetOptOutRightToLeftAlignmentFlip( true )
	AvgRoundGameTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 700, _1080p * 922.5, _1080p * 297, _1080p * 319 )
	self:addElement( AvgRoundGameTitle )
	self.AvgRoundGameTitle = AvgRoundGameTitle
	
	local ScorePerMinuteValue = nil
	
	ScorePerMinuteValue = LUI.UIText.new()
	ScorePerMinuteValue.id = "ScorePerMinuteValue"
	ScorePerMinuteValue:SetRGBFromTable( SWATCHES.Zombies.fateCardLightBar, 0 )
	ScorePerMinuteValue:SetFontSize( 50 * _1080p )
	ScorePerMinuteValue:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	ScorePerMinuteValue:SetAlignment( LUI.Alignment.Left )
	ScorePerMinuteValue:SetOptOutRightToLeftAlignmentFlip( true )
	ScorePerMinuteValue:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 476.5, _1080p * 676.5, _1080p * 210.75, _1080p * 260.75 )
	ScorePerMinuteValue:SubscribeToModel( DataSources.frontEnd.CP.scorePerMinuteFilter:GetModel( f2_local1 ), function ()
		local f11_local0 = DataSources.frontEnd.CP.scorePerMinuteFilter:GetValue( f2_local1 )
		if f11_local0 ~= nil then
			ScorePerMinuteValue:setText( f11_local0, 0 )
		end
	end )
	self:addElement( ScorePerMinuteValue )
	self.ScorePerMinuteValue = ScorePerMinuteValue
	
	local ScorePerMinuteTitle = nil
	
	ScorePerMinuteTitle = LUI.UIText.new()
	ScorePerMinuteTitle.id = "ScorePerMinuteTitle"
	ScorePerMinuteTitle:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_SCORE_PER_MINUTE" ) ), 0 )
	ScorePerMinuteTitle:SetFontSize( 22 * _1080p )
	ScorePerMinuteTitle:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ScorePerMinuteTitle:SetAlignment( LUI.Alignment.Left )
	ScorePerMinuteTitle:SetOptOutRightToLeftAlignmentFlip( true )
	ScorePerMinuteTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 475.5, _1080p * 676.5, _1080p * 187, _1080p * 209 )
	self:addElement( ScorePerMinuteTitle )
	self.ScorePerMinuteTitle = ScorePerMinuteTitle
	
	local AvgScorePerGameValue = nil
	
	AvgScorePerGameValue = LUI.UIText.new()
	AvgScorePerGameValue.id = "AvgScorePerGameValue"
	AvgScorePerGameValue:SetRGBFromTable( SWATCHES.Zombies.fateCardLightBar, 0 )
	AvgScorePerGameValue:SetFontSize( 50 * _1080p )
	AvgScorePerGameValue:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	AvgScorePerGameValue:SetAlignment( LUI.Alignment.Left )
	AvgScorePerGameValue:SetOptOutRightToLeftAlignmentFlip( true )
	AvgScorePerGameValue:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 476.5, _1080p * 676.5, _1080p * 320.75, _1080p * 370.75 )
	AvgScorePerGameValue:SubscribeToModel( DataSources.frontEnd.CP.avgScoreFilter:GetModel( f2_local1 ), function ()
		local f12_local0 = DataSources.frontEnd.CP.avgScoreFilter:GetValue( f2_local1 )
		if f12_local0 ~= nil then
			AvgScorePerGameValue:setText( f12_local0, 0 )
		end
	end )
	self:addElement( AvgScorePerGameValue )
	self.AvgScorePerGameValue = AvgScorePerGameValue
	
	local AvgScorePerGameTitle = nil
	
	AvgScorePerGameTitle = LUI.UIText.new()
	AvgScorePerGameTitle.id = "AvgScorePerGameTitle"
	AvgScorePerGameTitle:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_AVERAGE_SCORE" ) ), 0 )
	AvgScorePerGameTitle:SetFontSize( 22 * _1080p )
	AvgScorePerGameTitle:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	AvgScorePerGameTitle:SetAlignment( LUI.Alignment.Left )
	AvgScorePerGameTitle:SetOptOutRightToLeftAlignmentFlip( true )
	AvgScorePerGameTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 475.5, _1080p * 676.5, _1080p * 297, _1080p * 319 )
	self:addElement( AvgScorePerGameTitle )
	self.AvgScorePerGameTitle = AvgScorePerGameTitle
	
	local TotalScenesTitle = nil
	
	TotalScenesTitle = LUI.UIStyledText.new()
	TotalScenesTitle.id = "TotalScenesTitle"
	TotalScenesTitle:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_TOTAL_SCENES" ) ), 0 )
	TotalScenesTitle:SetFontSize( 22 * _1080p )
	TotalScenesTitle:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	TotalScenesTitle:SetAlignment( LUI.Alignment.Left )
	TotalScenesTitle:SetOptOutRightToLeftAlignmentFlip( true )
	TotalScenesTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 700, _1080p * 922.5, _1080p * 73.6, _1080p * 95.6 )
	self:addElement( TotalScenesTitle )
	self.TotalScenesTitle = TotalScenesTitle
	
	local TotalScenesValue = nil
	
	TotalScenesValue = LUI.UIStyledText.new()
	TotalScenesValue.id = "TotalScenesValue"
	TotalScenesValue:SetRGBFromTable( SWATCHES.Zombies.fateCardLightBar, 0 )
	TotalScenesValue:SetFontSize( 50 * _1080p )
	TotalScenesValue:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	TotalScenesValue:SetAlignment( LUI.Alignment.Left )
	TotalScenesValue:SetOptOutRightToLeftAlignmentFlip( true )
	TotalScenesValue:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 696.5, _1080p * 896.5, _1080p * 97.6, _1080p * 147.6 )
	TotalScenesValue:SubscribeToModel( DataSources.alwaysLoaded.playerData.CP.coopCareerStats.Total_Waves:GetModel( f2_local1 ), function ()
		local f13_local0 = DataSources.alwaysLoaded.playerData.CP.coopCareerStats.Total_Waves:GetValue( f2_local1 )
		if f13_local0 ~= nil then
			TotalScenesValue:setText( f13_local0, 0 )
		end
	end )
	self:addElement( TotalScenesValue )
	self.TotalScenesValue = TotalScenesValue
	
	local RevivesValue = nil
	
	RevivesValue = LUI.UIStyledText.new()
	RevivesValue.id = "RevivesValue"
	RevivesValue:SetRGBFromTable( SWATCHES.Zombies.fateCardLightBar, 0 )
	RevivesValue:SetFontSize( 50 * _1080p )
	RevivesValue:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	RevivesValue:SetAlignment( LUI.Alignment.Left )
	RevivesValue:SetOptOutRightToLeftAlignmentFlip( true )
	RevivesValue:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 263.5, _1080p * 459.5, _1080p * 320.75, _1080p * 370.75 )
	RevivesValue:SubscribeToModel( DataSources.alwaysLoaded.playerData.CP.coopCareerStats.Revives:GetModel( f2_local1 ), function ()
		local f14_local0 = DataSources.alwaysLoaded.playerData.CP.coopCareerStats.Revives:GetValue( f2_local1 )
		if f14_local0 ~= nil then
			RevivesValue:setText( f14_local0, 0 )
		end
	end )
	self:addElement( RevivesValue )
	self.RevivesValue = RevivesValue
	
	local RevivesTitle = nil
	
	RevivesTitle = LUI.UIStyledText.new()
	RevivesTitle.id = "RevivesTitle"
	RevivesTitle:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_REVIVES" ) ), 0 )
	RevivesTitle:SetFontSize( 22 * _1080p )
	RevivesTitle:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	RevivesTitle:SetAlignment( LUI.Alignment.Left )
	RevivesTitle:SetOptOutRightToLeftAlignmentFlip( true )
	RevivesTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 265.79, _1080p * 439.5, _1080p * 297, _1080p * 319 )
	self:addElement( RevivesTitle )
	self.RevivesTitle = RevivesTitle
	
	local KillsIcon = nil
	
	KillsIcon = LUI.UIImage.new()
	KillsIcon.id = "KillsIcon"
	KillsIcon:setImage( RegisterMaterial( "category_icon_kills" ), 0 )
	KillsIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 154.5, _1080p * 282.5, _1080p * 43.6, _1080p * 171.6 )
	self:addElement( KillsIcon )
	self.KillsIcon = KillsIcon
	
	local HeadshotsIcon = nil
	
	HeadshotsIcon = LUI.UIImage.new()
	HeadshotsIcon.id = "HeadshotsIcon"
	HeadshotsIcon:setImage( RegisterMaterial( "category_icon_headshots" ), 0 )
	HeadshotsIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 154.5, _1080p * 282.5, _1080p * 156.5, _1080p * 284.5 )
	self:addElement( HeadshotsIcon )
	self.HeadshotsIcon = HeadshotsIcon
	
	local RevivesIcon = nil
	
	RevivesIcon = LUI.UIImage.new()
	RevivesIcon.id = "RevivesIcon"
	RevivesIcon:setImage( RegisterMaterial( "category_icon_revives" ), 0 )
	RevivesIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 154.5, _1080p * 282.5, _1080p * 266.5, _1080p * 394.5 )
	self:addElement( RevivesIcon )
	self.RevivesIcon = RevivesIcon
	
	local HeaderBar = nil
	
	HeaderBar = LUI.UIImage.new()
	HeaderBar.id = "HeaderBar"
	HeaderBar:SetRGBFromInt( 5395026, 0 )
	HeaderBar:SetAlpha( 0.5, 0 )
	HeaderBar:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 950, 0, _1080p * 43.6 )
	self:addElement( HeaderBar )
	self.HeaderBar = HeaderBar
	
	local TitleText = nil
	
	TitleText = LUI.UIText.new()
	TitleText.id = "TitleText"
	TitleText:setText( Engine.Localize( "LUA_MENU_COMBAT_RECORD" ), 0 )
	TitleText:SetFontSize( 34 * _1080p )
	TitleText:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	TitleText:SetAlignment( LUI.Alignment.Left )
	TitleText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 21, _1080p * 580, _1080p * 3.6, _1080p * 37.6 )
	self:addElement( TitleText )
	self.TitleText = TitleText
	
	local killsWhiteBar = nil
	
	killsWhiteBar = LUI.UIImage.new()
	killsWhiteBar.id = "killsWhiteBar"
	killsWhiteBar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 254.76, _1080p * 935.5, _1080p * 98.5, _1080p * 100.5 )
	self:addElement( killsWhiteBar )
	self.killsWhiteBar = killsWhiteBar
	
	local headshotsWhiteBar = nil
	
	headshotsWhiteBar = LUI.UIImage.new()
	headshotsWhiteBar.id = "headshotsWhiteBar"
	headshotsWhiteBar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 256.5, _1080p * 936.5, _1080p * 212.6, _1080p * 214.6 )
	self:addElement( headshotsWhiteBar )
	self.headshotsWhiteBar = headshotsWhiteBar
	
	local revivesWhiteBar = nil
	
	revivesWhiteBar = LUI.UIImage.new()
	revivesWhiteBar.id = "revivesWhiteBar"
	revivesWhiteBar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 256.5, _1080p * 936.5, _1080p * 322.1, _1080p * 323.6 )
	self:addElement( revivesWhiteBar )
	self.revivesWhiteBar = revivesWhiteBar
	
	local playedWhiteBar = nil
	
	playedWhiteBar = LUI.UIImage.new()
	playedWhiteBar.id = "playedWhiteBar"
	playedWhiteBar:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 950, _1080p * 537.6, _1080p * 540.6 )
	self:addElement( playedWhiteBar )
	self.playedWhiteBar = playedWhiteBar
	
	local RankSideWhiteBar = nil
	
	RankSideWhiteBar = LUI.UIImage.new()
	RankSideWhiteBar.id = "RankSideWhiteBar"
	RankSideWhiteBar:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 3.75, _1080p * 482.75, _1080p * 51.5 )
	self:addElement( RankSideWhiteBar )
	self.RankSideWhiteBar = RankSideWhiteBar
	
	local whiteBlipTopRight = nil
	
	whiteBlipTopRight = LUI.UIImage.new()
	whiteBlipTopRight.id = "whiteBlipTopRight"
	whiteBlipTopRight:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 936.5, _1080p * 949.5, 0, _1080p * 2 )
	self:addElement( whiteBlipTopRight )
	self.whiteBlipTopRight = whiteBlipTopRight
	
	local whiteBlipBottomRight = nil
	
	whiteBlipBottomRight = LUI.UIImage.new()
	whiteBlipBottomRight.id = "whiteBlipBottomRight"
	whiteBlipBottomRight:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 936.5, _1080p * 949.5, _1080p * 495, _1080p * 497 )
	self:addElement( whiteBlipBottomRight )
	self.whiteBlipBottomRight = whiteBlipBottomRight
	
	local whiteBlipTopLeft = nil
	
	whiteBlipTopLeft = LUI.UIImage.new()
	whiteBlipTopLeft.id = "whiteBlipTopLeft"
	whiteBlipTopLeft:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 0.64, _1080p * 13.64, 0, _1080p * 2 )
	self:addElement( whiteBlipTopLeft )
	self.whiteBlipTopLeft = whiteBlipTopLeft
	
	local whiteBlipBottomLeft = nil
	
	whiteBlipBottomLeft = LUI.UIImage.new()
	whiteBlipBottomLeft.id = "whiteBlipBottomLeft"
	whiteBlipBottomLeft:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 0.5, _1080p * 13.5, _1080p * 495, _1080p * 497 )
	self:addElement( whiteBlipBottomLeft )
	self.whiteBlipBottomLeft = whiteBlipBottomLeft
	
	local downsValueBar = nil
	
	downsValueBar = LUI.UIImage.new()
	downsValueBar.id = "downsValueBar"
	downsValueBar:SetRGBFromInt( 657930, 0 )
	downsValueBar:SetAlpha( 0.5, 0 )
	downsValueBar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 256.5, _1080p * 936.5, _1080p * 435, _1080p * 482.75 )
	self:addElement( downsValueBar )
	self.downsValueBar = downsValueBar
	
	local SubheaderDowns = nil
	
	SubheaderDowns = LUI.UIImage.new()
	SubheaderDowns.id = "SubheaderDowns"
	SubheaderDowns:SetRGBFromInt( 9048832, 0 )
	SubheaderDowns:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 256.5, _1080p * 936.5, _1080p * 404.6, _1080p * 435.6 )
	self:addElement( SubheaderDowns )
	self.SubheaderDowns = SubheaderDowns
	
	local DoorsValue = nil
	
	DoorsValue = LUI.UIText.new()
	DoorsValue.id = "DoorsValue"
	DoorsValue:SetRGBFromTable( SWATCHES.Zombies.fateCardLightBar, 0 )
	DoorsValue:SetFontSize( 50 * _1080p )
	DoorsValue:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	DoorsValue:SetAlignment( LUI.Alignment.Left )
	DoorsValue:SetOptOutRightToLeftAlignmentFlip( true )
	DoorsValue:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 696.5, _1080p * 896.5, _1080p * 432.75, _1080p * 482.75 )
	DoorsValue:SubscribeToModel( DataSources.alwaysLoaded.playerData.CP.coopCareerStats.Doors_Opened:GetModel( f2_local1 ), function ()
		local f15_local0 = DataSources.alwaysLoaded.playerData.CP.coopCareerStats.Doors_Opened:GetValue( f2_local1 )
		if f15_local0 ~= nil then
			DoorsValue:setText( f15_local0, 0 )
		end
	end )
	self:addElement( DoorsValue )
	self.DoorsValue = DoorsValue
	
	local DoorsTitle = nil
	
	DoorsTitle = LUI.UIText.new()
	DoorsTitle.id = "DoorsTitle"
	DoorsTitle:setText( Engine.Localize( "LUA_MENU_ZM_DOORS_OPENED" ), 0 )
	DoorsTitle:SetFontSize( 22 * _1080p )
	DoorsTitle:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	DoorsTitle:SetAlignment( LUI.Alignment.Left )
	DoorsTitle:SetOptOutRightToLeftAlignmentFlip( true )
	DoorsTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 700, _1080p * 922.5, _1080p * 409, _1080p * 431 )
	self:addElement( DoorsTitle )
	self.DoorsTitle = DoorsTitle
	
	local PerksValue = nil
	
	PerksValue = LUI.UIText.new()
	PerksValue.id = "PerksValue"
	PerksValue:SetRGBFromTable( SWATCHES.Zombies.fateCardLightBar, 0 )
	PerksValue:SetFontSize( 50 * _1080p )
	PerksValue:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	PerksValue:SetAlignment( LUI.Alignment.Left )
	PerksValue:SetOptOutRightToLeftAlignmentFlip( true )
	PerksValue:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 476.5, _1080p * 676.5, _1080p * 432.75, _1080p * 482.75 )
	PerksValue:SubscribeToModel( DataSources.alwaysLoaded.playerData.CP.coopCareerStats.Perks_Used:GetModel( f2_local1 ), function ()
		local f16_local0 = DataSources.alwaysLoaded.playerData.CP.coopCareerStats.Perks_Used:GetValue( f2_local1 )
		if f16_local0 ~= nil then
			PerksValue:setText( f16_local0, 0 )
		end
	end )
	self:addElement( PerksValue )
	self.PerksValue = PerksValue
	
	local PerksTitle = nil
	
	PerksTitle = LUI.UIText.new()
	PerksTitle.id = "PerksTitle"
	PerksTitle:setText( Engine.Localize( "LUA_MENU_ZM_PERKS_USED" ), 0 )
	PerksTitle:SetFontSize( 22 * _1080p )
	PerksTitle:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	PerksTitle:SetAlignment( LUI.Alignment.Left )
	PerksTitle:SetOptOutRightToLeftAlignmentFlip( true )
	PerksTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 475.5, _1080p * 676.5, _1080p * 409, _1080p * 431 )
	self:addElement( PerksTitle )
	self.PerksTitle = PerksTitle
	
	local DownsValue = nil
	
	DownsValue = LUI.UIStyledText.new()
	DownsValue.id = "DownsValue"
	DownsValue:SetRGBFromTable( SWATCHES.Zombies.fateCardLightBar, 0 )
	DownsValue:SetFontSize( 50 * _1080p )
	DownsValue:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	DownsValue:SetAlignment( LUI.Alignment.Left )
	DownsValue:SetOptOutRightToLeftAlignmentFlip( true )
	DownsValue:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 263.5, _1080p * 459.5, _1080p * 432.75, _1080p * 482.75 )
	DownsValue:SubscribeToModel( DataSources.alwaysLoaded.playerData.CP.coopCareerStats.Downs:GetModel( f2_local1 ), function ()
		local f17_local0 = DataSources.alwaysLoaded.playerData.CP.coopCareerStats.Downs:GetValue( f2_local1 )
		if f17_local0 ~= nil then
			DownsValue:setText( f17_local0, 0 )
		end
	end )
	self:addElement( DownsValue )
	self.DownsValue = DownsValue
	
	local DownsTitle = nil
	
	DownsTitle = LUI.UIStyledText.new()
	DownsTitle.id = "DownsTitle"
	DownsTitle:setText( Engine.Localize( "LUA_MENU_ZM_DOWNS" ), 0 )
	DownsTitle:SetFontSize( 22 * _1080p )
	DownsTitle:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	DownsTitle:SetAlignment( LUI.Alignment.Left )
	DownsTitle:SetOptOutRightToLeftAlignmentFlip( true )
	DownsTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 265.79, _1080p * 439.5, _1080p * 409, _1080p * 431 )
	self:addElement( DownsTitle )
	self.DownsTitle = DownsTitle
	
	local DownsIcon = nil
	
	DownsIcon = LUI.UIImage.new()
	DownsIcon.id = "DownsIcon"
	DownsIcon:setImage( RegisterMaterial( "category_icon_downs" ), 0 )
	DownsIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 154.5, _1080p * 282.5, _1080p * 378.5, _1080p * 506.5 )
	self:addElement( DownsIcon )
	self.DownsIcon = DownsIcon
	
	local downsWhiteBar = nil
	
	downsWhiteBar = LUI.UIImage.new()
	downsWhiteBar.id = "downsWhiteBar"
	downsWhiteBar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 256.5, _1080p * 936.5, _1080p * 434.1, _1080p * 435.6 )
	self:addElement( downsWhiteBar )
	self.downsWhiteBar = downsWhiteBar
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		KillsValue:RegisterAnimationSequence( "TextLabelShiftDown", {
			{
				function ()
					return self.KillsValue:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 261.5, _1080p * 460.5, _1080p * 101.25, _1080p * 151.25, 0 )
				end
			}
		} )
		HeadshotsValue:RegisterAnimationSequence( "TextLabelShiftDown", {
			{
				function ()
					return self.HeadshotsValue:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 263.5, _1080p * 462.5, _1080p * 215.25, _1080p * 265.25, 0 )
				end
			}
		} )
		GamesPlayedValue:RegisterAnimationSequence( "TextLabelShiftDown", {
			{
				function ()
					return self.GamesPlayedValue:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 476.5, _1080p * 676.5, _1080p * 101.25, _1080p * 151.25, 0 )
				end
			}
		} )
		HighestRoundValue:RegisterAnimationSequence( "TextLabelShiftDown", {
			{
				function ()
					return self.HighestRoundValue:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 696.5, _1080p * 896.5, _1080p * 214.75, _1080p * 264.75, 0 )
				end
			}
		} )
		AvgRoundGameValue:RegisterAnimationSequence( "TextLabelShiftDown", {
			{
				function ()
					return self.AvgRoundGameValue:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 696.5, _1080p * 896.5, _1080p * 323.75, _1080p * 373.75, 0 )
				end
			}
		} )
		ScorePerMinuteValue:RegisterAnimationSequence( "TextLabelShiftDown", {
			{
				function ()
					return self.ScorePerMinuteValue:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 476.5, _1080p * 676.5, _1080p * 214.75, _1080p * 264.75, 0 )
				end
			}
		} )
		AvgScorePerGameValue:RegisterAnimationSequence( "TextLabelShiftDown", {
			{
				function ()
					return self.AvgScorePerGameValue:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 476.5, _1080p * 676.5, _1080p * 323.75, _1080p * 373.75, 0 )
				end
			}
		} )
		TotalScenesValue:RegisterAnimationSequence( "TextLabelShiftDown", {
			{
				function ()
					return self.TotalScenesValue:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 696.5, _1080p * 896.5, _1080p * 100.6, _1080p * 150.6, 0 )
				end
			}
		} )
		RevivesValue:RegisterAnimationSequence( "TextLabelShiftDown", {
			{
				function ()
					return self.RevivesValue:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 263.5, _1080p * 459.5, _1080p * 323.75, _1080p * 373.75, 0 )
				end
			}
		} )
		self._sequences.TextLabelShiftDown = function ()
			KillsValue:AnimateSequence( "TextLabelShiftDown" )
			HeadshotsValue:AnimateSequence( "TextLabelShiftDown" )
			GamesPlayedValue:AnimateSequence( "TextLabelShiftDown" )
			HighestRoundValue:AnimateSequence( "TextLabelShiftDown" )
			AvgRoundGameValue:AnimateSequence( "TextLabelShiftDown" )
			ScorePerMinuteValue:AnimateSequence( "TextLabelShiftDown" )
			AvgScorePerGameValue:AnimateSequence( "TextLabelShiftDown" )
			TotalScenesValue:AnimateSequence( "TextLabelShiftDown" )
			RevivesValue:AnimateSequence( "TextLabelShiftDown" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "HeadquartersCombatRecordPreviewCP", HeadquartersCombatRecordPreviewCP )
LockTable( _M )
