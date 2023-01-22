local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1 )
	local f1_local0 = Engine.GetGameTypeIndex( f1_arg1 )
	if not f1_local0 or f1_local0 < 0 then
		f1_arg1 = 0
	end
	local f1_local1 = {}
	local f1_local2 = 5
	local f1_local3 = Engine.GetPlayerDataEx( f1_arg0, CoD.StatsGroup.Ranked, "gameModeScoreHistory", f1_local0, "index" )
	for f1_local4 = 0, f1_local2 - 1, 1 do
		table.insert( f1_local1, Engine.GetPlayerDataEx( f1_arg0, CoD.StatsGroup.Ranked, "gameModeScoreHistory", f1_local0, "scores", (f1_local3 + f1_local4) % f1_local2 ) )
	end
	return f1_local1
end

f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2 )
	f2_arg0.ScorePerMinute:setText( Engine.GetPlayerDataEx( f2_arg1, CoD.StatsGroup.Ranked, "globalSPM" ) )
	local f2_local0 = Engine.GetPlayerDataEx( f2_arg1, CoD.StatsGroup.Ranked, "kills" )
	local f2_local1 = Engine.GetPlayerDataEx( f2_arg1, CoD.StatsGroup.Ranked, "deaths" )
	f2_arg0.Kills:setText( f2_local0 )
	if f2_local1 ~= 0 then
		local f2_local2 = f2_local1
	end
	f2_arg0.KillDeathRatio:setText( string.format( "%.2f", f2_local0 / (f2_local2 or 1) ) )
	f2_arg0.TotalGames:setText( Engine.GetPlayerDataEx( f2_arg1, CoD.StatsGroup.Ranked, "wins" ) + Engine.GetPlayerDataEx( f2_arg1, CoD.StatsGroup.Ranked, "losses" ) + Engine.GetPlayerDataEx( f2_arg1, CoD.StatsGroup.Ranked, "ties" ) )
	local f2_local3 = {}
	local f2_local4 = 0
	local f2_local5 = 0
	local f2_local6 = 0
	local f2_local7 = 5
	for f2_local8 = 1, f2_local7, 1 do
		local f2_local11 = Engine.GetPlayerDataEx( f2_arg1, CoD.StatsGroup.Ranked, "kdHistoryK", f2_local8 - 1 )
		f2_local4 = f2_local4 + f2_local11
		local f2_local12 = Engine.GetPlayerDataEx( f2_arg1, CoD.StatsGroup.Ranked, "kdHistoryD", f2_local8 - 1 )
		f2_local5 = f2_local5 + f2_local12
		if f2_local12 ~= 0 then
			local f2_local13 = f2_local12
		end
		local f2_local14 = f2_local11 / (f2_local13 or 1)
		f2_local6 = math.max( f2_local6, f2_local14 )
		table.insert( f2_local3, {
			value = f2_local14,
			valid = true,
			barColor = GetIntForColor( SWATCHES.AAR.InfoNormal ),
			valueText = string.format( "%.2f", f2_local14 )
		} )
	end
	for f2_local8 = 1, #f2_local3, 1 do
		f2_local3[f2_local8].maxValue = f2_local6
	end
	local f2_local8 = {
		maxValue = f2_local6
	}
	if f2_local5 ~= 0 then
		local f2_local15 = f2_local5
	end
	f2_local8.average = f2_local4 / (f2_local15 or 1)
	f2_arg0.KillDeathHistory:SetGraphData( f2_local3, f2_local8, true )
	local f2_local9 = Engine.GetPlayerDataEx( f2_arg1, CoD.StatsGroup.Common, "round", "gameMode" )
	f2_arg0.KillsSubLabelCopy1:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_AAR_LAST_5_GAMES_BY_MODE", Engine.TableLookup( CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, f2_local9, CSV.gameTypesTable.cols.name ) ) ) )
	local f2_local11 = 0
	local f2_local12 = 0
	local f2_local14 = {}
	local f2_local16 = f0_local0( f2_arg1, f2_local9 )
	for f2_local17 = 1, #f2_local16, 1 do
		local f2_local20 = f2_local16[f2_local17]
		f2_local11 = math.max( f2_local11, f2_local20 )
		f2_local12 = f2_local12 + f2_local20
		table.insert( f2_local14, {
			value = f2_local20,
			valid = true,
			barColor = GetIntForColor( SWATCHES.AAR.InfoNormal ),
			valueText = string.format( "%.2f", f2_local20 )
		} )
	end
	for f2_local17 = 1, #f2_local14, 1 do
		f2_local14[f2_local17].maxValue = f2_local11
	end
	f2_arg0.BestGameScoreHistory:SetGraphData( f2_local14, {
		maxValue = f2_local11,
		average = f2_local12 / #f2_local14
	} )
end

function PostLoadFunc( f3_arg0, f3_arg1 )
	f3_arg0.PopulateGlobalRecords = f0_local1
end

function HeadquartersGlobalRecords( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 500 * _1080p, 0, 631 * _1080p )
	self.id = "HeadquartersGlobalRecords"
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local Blur = nil
	
	Blur = LUI.UIBlur.new()
	Blur.id = "Blur"
	Blur:SetRGBFromInt( 12566463, 0 )
	Blur:SetUseAA( true )
	Blur:SetBlurStrength( 2.75, 0 )
	self:addElement( Blur )
	self.Blur = Blur
	
	local BlackHeader3 = nil
	
	BlackHeader3 = LUI.UIImage.new()
	BlackHeader3.id = "BlackHeader3"
	BlackHeader3:SetRGBFromInt( 0, 0 )
	BlackHeader3:SetAlpha( 0.4, 0 )
	BlackHeader3:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 8, _1080p * -8, _1080p * 427, _1080p * -174 )
	self:addElement( BlackHeader3 )
	self.BlackHeader3 = BlackHeader3
	
	local BlackHeader2 = nil
	
	BlackHeader2 = LUI.UIImage.new()
	BlackHeader2.id = "BlackHeader2"
	BlackHeader2:SetRGBFromInt( 0, 0 )
	BlackHeader2:SetAlpha( 0.4, 0 )
	BlackHeader2:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 8, _1080p * -8, _1080p * 231, _1080p * -370 )
	self:addElement( BlackHeader2 )
	self.BlackHeader2 = BlackHeader2
	
	local BlackHeader1 = nil
	
	BlackHeader1 = LUI.UIImage.new()
	BlackHeader1.id = "BlackHeader1"
	BlackHeader1:SetRGBFromInt( 0, 0 )
	BlackHeader1:SetAlpha( 0.4, 0 )
	BlackHeader1:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 8, _1080p * -8, _1080p * 34, _1080p * -567 )
	self:addElement( BlackHeader1 )
	self.BlackHeader1 = BlackHeader1
	
	local GraphBar2 = nil
	
	GraphBar2 = LUI.UIImage.new()
	GraphBar2.id = "GraphBar2"
	GraphBar2:SetRGBFromInt( 0, 0 )
	GraphBar2:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -299, _1080p * -15, _1080p * 605, _1080p * 618 )
	self:addElement( GraphBar2 )
	self.GraphBar2 = GraphBar2
	
	local GraphBar1 = nil
	
	GraphBar1 = LUI.UIImage.new()
	GraphBar1.id = "GraphBar1"
	GraphBar1:SetRGBFromInt( 0, 0 )
	GraphBar1:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -299, _1080p * -15, _1080p * 409.36, _1080p * 422.36 )
	self:addElement( GraphBar1 )
	self.GraphBar1 = GraphBar1
	
	local TotalGames = nil
	
	TotalGames = LUI.UIText.new()
	TotalGames.id = "TotalGames"
	TotalGames:setText( "", 0 )
	TotalGames:SetFontSize( 48 * _1080p )
	TotalGames:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	TotalGames:SetAlignment( LUI.Alignment.Center )
	TotalGames:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 23.56, _1080p * 156.72, _1080p * 105, _1080p * 153 )
	self:addElement( TotalGames )
	self.TotalGames = TotalGames
	
	local KillDeathRatio = nil
	
	KillDeathRatio = LUI.UIText.new()
	KillDeathRatio.id = "KillDeathRatio"
	KillDeathRatio:setText( "", 0 )
	KillDeathRatio:SetFontSize( 26 * _1080p )
	KillDeathRatio:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	KillDeathRatio:SetAlignment( LUI.Alignment.Center )
	KillDeathRatio:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 19.5, _1080p * 153.16, _1080p * 346, _1080p * 372 )
	self:addElement( KillDeathRatio )
	self.KillDeathRatio = KillDeathRatio
	
	local Kills = nil
	
	Kills = LUI.UIText.new()
	Kills.id = "Kills"
	Kills:setText( "", 0 )
	Kills:SetFontSize( 26 * _1080p )
	Kills:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Kills:SetAlignment( LUI.Alignment.Center )
	Kills:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 19.5, _1080p * 153.16, _1080p * 264, _1080p * 290 )
	self:addElement( Kills )
	self.Kills = Kills
	
	local ScorePerMinute = nil
	
	ScorePerMinute = LUI.UIText.new()
	ScorePerMinute.id = "ScorePerMinute"
	ScorePerMinute:setText( "", 0 )
	ScorePerMinute:SetFontSize( 48 * _1080p )
	ScorePerMinute:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	ScorePerMinute:SetAlignment( LUI.Alignment.Center )
	ScorePerMinute:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 19.5, _1080p * 160.78, _1080p * 485.5, _1080p * 533.5 )
	self:addElement( ScorePerMinute )
	self.ScorePerMinute = ScorePerMinute
	
	local HeadquartersCombatRecordWinLoss = nil
	
	HeadquartersCombatRecordWinLoss = MenuBuilder.BuildRegisteredType( "HeadquartersCombatRecordWinLoss", {
		controllerIndex = f4_local1
	} )
	HeadquartersCombatRecordWinLoss.id = "HeadquartersCombatRecordWinLoss"
	HeadquartersCombatRecordWinLoss:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -299.5, _1080p * -15.5, _1080p * 129, _1080p * 167 )
	self:addElement( HeadquartersCombatRecordWinLoss )
	self.HeadquartersCombatRecordWinLoss = HeadquartersCombatRecordWinLoss
	
	local TotalGamesLabel = nil
	
	TotalGamesLabel = LUI.UIText.new()
	TotalGamesLabel.id = "TotalGamesLabel"
	TotalGamesLabel:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_TOTAL_GAMES" ) ), 0 )
	TotalGamesLabel:SetFontSize( 16 * _1080p )
	TotalGamesLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	TotalGamesLabel:SetAlignment( LUI.Alignment.Left )
	TotalGamesLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 20, _1080p * 220, _1080p * 41, _1080p * 57 )
	self:addElement( TotalGamesLabel )
	self.TotalGamesLabel = TotalGamesLabel
	
	local KillDeathRatioLabel = nil
	
	KillDeathRatioLabel = LUI.UIText.new()
	KillDeathRatioLabel.id = "KillDeathRatioLabel"
	KillDeathRatioLabel:setText( ToUpperCase( Engine.Localize( "LUA_MENU_KD_RATIO" ) ), 0 )
	KillDeathRatioLabel:SetFontSize( 19 * _1080p )
	KillDeathRatioLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	KillDeathRatioLabel:SetAlignment( LUI.Alignment.Center )
	KillDeathRatioLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 20, _1080p * 153.16, _1080p * 368.86, _1080p * 387.86 )
	self:addElement( KillDeathRatioLabel )
	self.KillDeathRatioLabel = KillDeathRatioLabel
	
	local KillsLabel = nil
	
	KillsLabel = LUI.UIText.new()
	KillsLabel.id = "KillsLabel"
	KillsLabel:setText( ToUpperCase( Engine.Localize( "MPUI_KILLS" ) ), 0 )
	KillsLabel:SetFontSize( 16 * _1080p )
	KillsLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	KillsLabel:SetAlignment( LUI.Alignment.Left )
	KillsLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 20, _1080p * 220, _1080p * 238, _1080p * 254 )
	self:addElement( KillsLabel )
	self.KillsLabel = KillsLabel
	
	local ScorePerMinuteLabel = nil
	
	ScorePerMinuteLabel = LUI.UIText.new()
	ScorePerMinuteLabel.id = "ScorePerMinuteLabel"
	ScorePerMinuteLabel:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_SCORE_PER_MINUTE" ) ), 0 )
	ScorePerMinuteLabel:SetFontSize( 16 * _1080p )
	ScorePerMinuteLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ScorePerMinuteLabel:SetAlignment( LUI.Alignment.Left )
	ScorePerMinuteLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 20, _1080p * 220, _1080p * 434, _1080p * 450 )
	self:addElement( ScorePerMinuteLabel )
	self.ScorePerMinuteLabel = ScorePerMinuteLabel
	
	local WinLossLabel = nil
	
	WinLossLabel = LUI.UIText.new()
	WinLossLabel.id = "WinLossLabel"
	WinLossLabel:setText( ToUpperCase( Engine.Localize( "MENU_WLRATIO" ) ), 0 )
	WinLossLabel:SetFontSize( 16 * _1080p )
	WinLossLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	WinLossLabel:SetAlignment( LUI.Alignment.Left )
	WinLossLabel:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -250, _1080p * -20, _1080p * 41, _1080p * 57 )
	self:addElement( WinLossLabel )
	self.WinLossLabel = WinLossLabel
	
	local KillDeathHistory = nil
	
	KillDeathHistory = MenuBuilder.BuildRegisteredType( "AARBars", {
		controllerIndex = f4_local1
	} )
	KillDeathHistory.id = "KillDeathHistory"
	KillDeathHistory:SetScale( -0.25, 0 )
	KillDeathHistory:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -336, _1080p * 22, _1080p * 275, _1080p * 426 )
	self:addElement( KillDeathHistory )
	self.KillDeathHistory = KillDeathHistory
	
	local BestGameScoreHistory = nil
	
	BestGameScoreHistory = MenuBuilder.BuildRegisteredType( "AARBars", {
		controllerIndex = f4_local1
	} )
	BestGameScoreHistory.id = "BestGameScoreHistory"
	BestGameScoreHistory:SetScale( -0.25, 0 )
	BestGameScoreHistory:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -337, _1080p * 22, _1080p * 471, _1080p * 622 )
	self:addElement( BestGameScoreHistory )
	self.BestGameScoreHistory = BestGameScoreHistory
	
	local RecordsLabel = nil
	
	RecordsLabel = LUI.UIText.new()
	RecordsLabel.id = "RecordsLabel"
	RecordsLabel:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_LEADERBOARD_GLOBAL" ) ), 0 )
	RecordsLabel:SetFontSize( 20 * _1080p )
	RecordsLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	RecordsLabel:SetAlignment( LUI.Alignment.Left )
	RecordsLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 8, _1080p * 492, _1080p * 8, _1080p * 28 )
	self:addElement( RecordsLabel )
	self.RecordsLabel = RecordsLabel
	
	local KillsSubLabel = nil
	
	KillsSubLabel = LUI.UIText.new()
	KillsSubLabel.id = "KillsSubLabel"
	KillsSubLabel:setText( ToUpperCase( Engine.Localize( "MENU_KILLS" ) ), 0 )
	KillsSubLabel:SetFontSize( 19 * _1080p )
	KillsSubLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	KillsSubLabel:SetAlignment( LUI.Alignment.Center )
	KillsSubLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 20, _1080p * 153.16, _1080p * 286.29, _1080p * 305.29 )
	self:addElement( KillsSubLabel )
	self.KillsSubLabel = KillsSubLabel
	
	local GamesPlayedLabel = nil
	
	GamesPlayedLabel = LUI.UIStyledText.new()
	GamesPlayedLabel.id = "GamesPlayedLabel"
	GamesPlayedLabel:setText( ToUpperCase( Engine.Localize( "LUA_MENU_GAMES_PLAYED" ) ), 0 )
	GamesPlayedLabel:SetFontSize( 14 * _1080p )
	GamesPlayedLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	GamesPlayedLabel:SetAlignment( LUI.Alignment.Center )
	GamesPlayedLabel:SetStartupDelay( 1000 )
	GamesPlayedLabel:SetLineHoldTime( 400 )
	GamesPlayedLabel:SetAnimMoveTime( 150 )
	GamesPlayedLabel:SetEndDelay( 1000 )
	GamesPlayedLabel:SetCrossfadeTime( 400 )
	GamesPlayedLabel:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollV )
	GamesPlayedLabel:SetMaxVisibleLines( 2 )
	GamesPlayedLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 17.28, _1080p * 163, _1080p * 153, _1080p * 167 )
	self:addElement( GamesPlayedLabel )
	self.GamesPlayedLabel = GamesPlayedLabel
	
	local AVGSPMLabel = nil
	
	AVGSPMLabel = LUI.UIStyledText.new()
	AVGSPMLabel.id = "AVGSPMLabel"
	AVGSPMLabel:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_AVG_SPM_GLOBAL" ) ), 0 )
	AVGSPMLabel:SetFontSize( 19 * _1080p )
	AVGSPMLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	AVGSPMLabel:SetAlignment( LUI.Alignment.Center )
	AVGSPMLabel:SetStartupDelay( 1000 )
	AVGSPMLabel:SetLineHoldTime( 400 )
	AVGSPMLabel:SetAnimMoveTime( 150 )
	AVGSPMLabel:SetEndDelay( 1000 )
	AVGSPMLabel:SetCrossfadeTime( 400 )
	AVGSPMLabel:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollV )
	AVGSPMLabel:SetMaxVisibleLines( 4 )
	AVGSPMLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 19.5, _1080p * 164, _1080p * 533.5, _1080p * 552.5 )
	self:addElement( AVGSPMLabel )
	self.AVGSPMLabel = AVGSPMLabel
	
	local KDGraphLabel = nil
	
	KDGraphLabel = LUI.UIText.new()
	KDGraphLabel.id = "KDGraphLabel"
	KDGraphLabel:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_KD_GRAPH" ) ), 0 )
	KDGraphLabel:SetFontSize( 16 * _1080p )
	KDGraphLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	KDGraphLabel:SetAlignment( LUI.Alignment.Left )
	KDGraphLabel:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -250, _1080p * -20, _1080p * 238, _1080p * 254 )
	self:addElement( KDGraphLabel )
	self.KDGraphLabel = KDGraphLabel
	
	local SPMGraph = nil
	
	SPMGraph = LUI.UIText.new()
	SPMGraph.id = "SPMGraph"
	SPMGraph:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_SPM_GRAPH" ) ), 0 )
	SPMGraph:SetFontSize( 16 * _1080p )
	SPMGraph:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	SPMGraph:SetAlignment( LUI.Alignment.Left )
	SPMGraph:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -248.5, _1080p * -20, _1080p * 434, _1080p * 450 )
	self:addElement( SPMGraph )
	self.SPMGraph = SPMGraph
	
	local KillsSubLabelCopy0 = nil
	
	KillsSubLabelCopy0 = LUI.UIStyledText.new()
	KillsSubLabelCopy0.id = "KillsSubLabelCopy0"
	KillsSubLabelCopy0:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_AAR_LAST_5_GAMES" ) ), 0 )
	KillsSubLabelCopy0:SetFontSize( 19 * _1080p )
	KillsSubLabelCopy0:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	KillsSubLabelCopy0:SetAlignment( LUI.Alignment.Center )
	KillsSubLabelCopy0:SetStartupDelay( 1000 )
	KillsSubLabelCopy0:SetLineHoldTime( 400 )
	KillsSubLabelCopy0:SetAnimMoveTime( 150 )
	KillsSubLabelCopy0:SetEndDelay( 1000 )
	KillsSubLabelCopy0:SetCrossfadeTime( 400 )
	KillsSubLabelCopy0:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	KillsSubLabelCopy0:SetMaxVisibleLines( 1 )
	KillsSubLabelCopy0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 210, _1080p * 492, _1080p * 269.5, _1080p * 288.5 )
	self:addElement( KillsSubLabelCopy0 )
	self.KillsSubLabelCopy0 = KillsSubLabelCopy0
	
	local KillsSubLabelCopy1 = nil
	
	KillsSubLabelCopy1 = LUI.UIStyledText.new()
	KillsSubLabelCopy1.id = "KillsSubLabelCopy1"
	KillsSubLabelCopy1:setText( Engine.Localize( "LUA_MENU_MP_AAR_LAST_5_GAMES_BY_MODE" ), 0 )
	KillsSubLabelCopy1:SetFontSize( 19 * _1080p )
	KillsSubLabelCopy1:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	KillsSubLabelCopy1:SetAlignment( LUI.Alignment.Center )
	KillsSubLabelCopy1:SetStartupDelay( 1000 )
	KillsSubLabelCopy1:SetLineHoldTime( 400 )
	KillsSubLabelCopy1:SetAnimMoveTime( 150 )
	KillsSubLabelCopy1:SetEndDelay( 1000 )
	KillsSubLabelCopy1:SetCrossfadeTime( 400 )
	KillsSubLabelCopy1:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	KillsSubLabelCopy1:SetMaxVisibleLines( 1 )
	KillsSubLabelCopy1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 210, _1080p * 492, _1080p * 465.5, _1080p * 484.5 )
	self:addElement( KillsSubLabelCopy1 )
	self.KillsSubLabelCopy1 = KillsSubLabelCopy1
	
	local KDImage = nil
	
	KDImage = LUI.UIImage.new()
	KDImage.id = "KDImage"
	KDImage:setImage( RegisterMaterial( "aar_kdr_icon" ), 0 )
	KDImage:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 63.33, _1080p * 109.33, _1080p * 382.36, _1080p * 428.36 )
	self:addElement( KDImage )
	self.KDImage = KDImage
	
	local KillsImage = nil
	
	KillsImage = LUI.UIImage.new()
	KillsImage.id = "KillsImage"
	KillsImage:setImage( RegisterMaterial( "aar_kills_icon" ), 0 )
	KillsImage:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 63.58, _1080p * 109.58, _1080p * 299.79, _1080p * 345.79 )
	self:addElement( KillsImage )
	self.KillsImage = KillsImage
	
	PostLoadFunc( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "HeadquartersGlobalRecords", HeadquartersGlobalRecords )
LockTable( _M )
