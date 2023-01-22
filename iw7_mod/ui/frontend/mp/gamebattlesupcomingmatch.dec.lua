local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1 )
	ACTIONS.AnimateSequence( f1_arg0, "NoUpcommingMatch" )
	f1_arg0.MatchError:setText( Engine.Localize( f1_arg1 ), 0 )
end

f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2 )
	local f2_local0 = LUI.DataSourceInGlobalModel.new( "frontEnd.lobby.areWeGameHost" )
	local f2_local1 = f2_local0:GetValue( f2_arg1 )
	local f2_local2 = nil
	local f2_local3 = function ()
		local f3_local0 = MLG.GetGameBattleScheduleState( f2_arg1 )
		local f3_local1 = GAMEBATTLES.GetCurrentMatch( f2_arg1 )
		local f3_local2 = true
		if f3_local0 == GAMEBATTLES.MLG_CODE_STATE.AVAILABLE and f3_local1 == nil then
			f0_local0( f2_arg0, "MLG_GAMEBATTLES_NO_UPCOMING_MATCH" )
			f3_local2 = false
		elseif f3_local0 == GAMEBATTLES.MLG_CODE_STATE.RETRIEVAL_ERROR then
			f0_local0( f2_arg0, "LUA_MENU_GAME_BATTLES_LOBBY_NO_MATCH_DATA" )
		elseif f3_local1 ~= nil then
			local f3_local3, f3_local4 = GAMEBATTLES.GetMatchProgressInfo( f3_local1 )
			if not f3_local4 then
				if f3_local3 then
					f2_arg0.Countdown:StartIntermissionCountdown( f2_local1 )
				else
					f2_arg0.Countdown:StartCountdownToTargetEpochDate( f3_local1.matchTime )
				end
				f2_arg0.MatchDate:setText( Engine.GetFormattedDate( f3_local1.matchTime ) .. " " .. Engine.GetFormattedTime( f3_local1.matchTime ) )
				f2_arg0.BestXOutOfY:setText( Engine.Localize( "MLG_GAMEBATTLES_BEST_X_OUT_OF_Y", math.ceil( f3_local1.gameCount / 2 ), f3_local1.gameCount ) )
				ACTIONS.AnimateSequence( f2_arg0, "RegMatch" )
				f2_arg0.TitleHeader:setText( MLG.GetGameBattleMatchId( f2_arg1 ) )
			end
			f3_local2 = false
		end
		if f2_local1 and not f3_local2 then
			local f3_local3 = LUI.DataSourceInGlobalModel.new( "frontEnd.mlg.isInRunningLobby" )
			f2_arg0:SubscribeToModel( f3_local3:GetModel( f2_arg1 ), function ()
				if f3_local3:GetValue( f2_arg1 ) and f3_local1 ~= nil then
					local f4_local0 = MLG.GetActiveGameIndex()
					if f4_local0 < f3_local1.gameCount then
						GAMEBATTLES.ApplyGameSettings( f3_local1.games[f4_local0 + 1], f2_arg1 )
					end
				end
			end )
		end
		if f3_local2 then
			f2_arg0.updateMatchDataTimer = f2_arg0:Wait( 500 )
			f2_arg0.updateMatchDataTimer.onComplete = f2_local2
		end
	end
	
	f2_local3()
end

function GameBattlesUpcomingMatch( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 500 * _1080p, 0, 381 * _1080p )
	self.id = "GameBattlesUpcomingMatch"
	self._animationSets = {}
	self._sequences = {}
	local f5_local1 = controller and controller.controllerIndex
	if not f5_local1 and not Engine.InFrontend() then
		f5_local1 = self:getRootController()
	end
	assert( f5_local1 )
	local f5_local2 = self
	local backgroundCopy0 = nil
	
	backgroundCopy0 = LUI.UIImage.new()
	backgroundCopy0.id = "backgroundCopy0"
	backgroundCopy0:SetRGBFromInt( 986895, 0 )
	backgroundCopy0:SetAlpha( 0.75, 0 )
	backgroundCopy0:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, _1080p * 231, _1080p * 380.5 )
	self:addElement( backgroundCopy0 )
	self.backgroundCopy0 = backgroundCopy0
	
	local background = nil
	
	background = LUI.UIImage.new()
	background.id = "background"
	background:SetRGBFromInt( 986895, 0 )
	background:SetAlpha( 0.75, 0 )
	background:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, _1080p * 57, _1080p * 186 )
	self:addElement( background )
	self.background = background
	
	local NextMatchBG = nil
	
	NextMatchBG = LUI.UIImage.new()
	NextMatchBG.id = "NextMatchBG"
	NextMatchBG:SetRGBFromInt( 0, 0 )
	NextMatchBG:SetAlpha( 0.75, 0 )
	NextMatchBG:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, _1080p * 7, _1080p * 57 )
	self:addElement( NextMatchBG )
	self.NextMatchBG = NextMatchBG
	
	local TitleHeader = nil
	
	TitleHeader = LUI.UIText.new()
	TitleHeader.id = "TitleHeader"
	TitleHeader:setText( "1234567", 0 )
	TitleHeader:SetFontSize( 30 * _1080p )
	TitleHeader:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	TitleHeader:SetAlignment( LUI.Alignment.Left )
	TitleHeader:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 5, _1080p * 499, _1080p * 27, _1080p * 57 )
	self:addElement( TitleHeader )
	self.TitleHeader = TitleHeader
	
	local CountdownTitleBG = nil
	
	CountdownTitleBG = LUI.UIImage.new()
	CountdownTitleBG.id = "CountdownTitleBG"
	CountdownTitleBG:SetRGBFromInt( 0, 0 )
	CountdownTitleBG:SetAlpha( 0.75, 0 )
	CountdownTitleBG:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, _1080p * 186, _1080p * 231 )
	self:addElement( CountdownTitleBG )
	self.CountdownTitleBG = CountdownTitleBG
	
	local CountdownTitle = nil
	
	CountdownTitle = LUI.UIText.new()
	CountdownTitle.id = "CountdownTitle"
	CountdownTitle:setText( Engine.Localize( "MLG_GAMEBATTLES_COUNTDOWN" ), 0 )
	CountdownTitle:SetFontSize( 36 * _1080p )
	CountdownTitle:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	CountdownTitle:SetAlignment( LUI.Alignment.Center )
	CountdownTitle:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, _1080p * 190.5, _1080p * 226.5 )
	self:addElement( CountdownTitle )
	self.CountdownTitle = CountdownTitle
	
	local MatchDate = nil
	
	MatchDate = LUI.UIText.new()
	MatchDate.id = "MatchDate"
	MatchDate:setText( "9th April 2016 20h15", 0 )
	MatchDate:SetFontSize( 38 * _1080p )
	MatchDate:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	MatchDate:SetAlignment( LUI.Alignment.Center )
	MatchDate:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 28, _1080p * 472, _1080p * 242, _1080p * 280 )
	self:addElement( MatchDate )
	self.MatchDate = MatchDate
	
	local MatchError = nil
	
	MatchError = LUI.UIText.new()
	MatchError.id = "MatchError"
	MatchError:SetAlpha( 0, 0 )
	MatchError:setText( Engine.Localize( "MLG_GAMEBATTLES_NO_UPCOMING_MATCH" ), 0 )
	MatchError:SetFontSize( 38 * _1080p )
	MatchError:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	MatchError:SetAlignment( LUI.Alignment.Center )
	MatchError:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 3.5, _1080p * 496.5, _1080p * 83.5, _1080p * 121.5 )
	self:addElement( MatchError )
	self.MatchError = MatchError
	
	local Countdown = nil
	
	Countdown = MenuBuilder.BuildRegisteredType( "GameBattlesCountdown", {
		controllerIndex = f5_local1
	} )
	Countdown.id = "Countdown"
	Countdown:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 90, _1080p * 410, _1080p * 289.5, _1080p * 369.5 )
	self:addElement( Countdown )
	self.Countdown = Countdown
	
	local PremiumTitle = nil
	
	PremiumTitle = LUI.UIText.new()
	PremiumTitle.id = "PremiumTitle"
	PremiumTitle:SetRGBFromTable( SWATCHES.wristPc.defaultLogo, 0 )
	PremiumTitle:setText( Engine.Localize( "MLG_GAMEBATTLES_PREMIUM" ), 0 )
	PremiumTitle:SetFontSize( 45 * _1080p )
	PremiumTitle:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	PremiumTitle:SetAlignment( LUI.Alignment.Center )
	PremiumTitle:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, _1080p * 67.5, _1080p * 112.5 )
	self:addElement( PremiumTitle )
	self.PremiumTitle = PremiumTitle
	
	local PremiumLeftLine = nil
	
	PremiumLeftLine = LUI.UIImage.new()
	PremiumLeftLine.id = "PremiumLeftLine"
	PremiumLeftLine:SetRGBFromInt( 16767744, 0 )
	PremiumLeftLine:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 68, _1080p * 150, _1080p * 81, _1080p * 83 )
	self:addElement( PremiumLeftLine )
	self.PremiumLeftLine = PremiumLeftLine
	
	local PremiumLeftLineCopy0 = nil
	
	PremiumLeftLineCopy0 = LUI.UIImage.new()
	PremiumLeftLineCopy0.id = "PremiumLeftLineCopy0"
	PremiumLeftLineCopy0:SetRGBFromInt( 16767744, 0 )
	PremiumLeftLineCopy0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 86, _1080p * 150, _1080p * 88, _1080p * 90 )
	self:addElement( PremiumLeftLineCopy0 )
	self.PremiumLeftLineCopy0 = PremiumLeftLineCopy0
	
	local PremiumLeftLineCopy1 = nil
	
	PremiumLeftLineCopy1 = LUI.UIImage.new()
	PremiumLeftLineCopy1.id = "PremiumLeftLineCopy1"
	PremiumLeftLineCopy1:SetRGBFromInt( 16767744, 0 )
	PremiumLeftLineCopy1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 103, _1080p * 150, _1080p * 96, _1080p * 98 )
	self:addElement( PremiumLeftLineCopy1 )
	self.PremiumLeftLineCopy1 = PremiumLeftLineCopy1
	
	local PremiumRightLine = nil
	
	PremiumRightLine = LUI.UIImage.new()
	PremiumRightLine.id = "PremiumRightLine"
	PremiumRightLine:SetRGBFromInt( 16767744, 0 )
	PremiumRightLine:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 347, _1080p * 429, _1080p * 81, _1080p * 83 )
	self:addElement( PremiumRightLine )
	self.PremiumRightLine = PremiumRightLine
	
	local PremiumRightLineCopy0 = nil
	
	PremiumRightLineCopy0 = LUI.UIImage.new()
	PremiumRightLineCopy0.id = "PremiumRightLineCopy0"
	PremiumRightLineCopy0:SetRGBFromInt( 16767744, 0 )
	PremiumRightLineCopy0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 347, _1080p * 410, _1080p * 88, _1080p * 90 )
	self:addElement( PremiumRightLineCopy0 )
	self.PremiumRightLineCopy0 = PremiumRightLineCopy0
	
	local PremiumRightLineCopy1 = nil
	
	PremiumRightLineCopy1 = LUI.UIImage.new()
	PremiumRightLineCopy1.id = "PremiumRightLineCopy1"
	PremiumRightLineCopy1:SetRGBFromInt( 16767744, 0 )
	PremiumRightLineCopy1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 347, _1080p * 395, _1080p * 96, _1080p * 98 )
	self:addElement( PremiumRightLineCopy1 )
	self.PremiumRightLineCopy1 = PremiumRightLineCopy1
	
	local PremiumTitleCopy0 = nil
	
	PremiumTitleCopy0 = LUI.UIText.new()
	PremiumTitleCopy0.id = "PremiumTitleCopy0"
	PremiumTitleCopy0:SetRGBFromTable( SWATCHES.wristPc.defaultLogo, 0 )
	PremiumTitleCopy0:SetAlpha( 0, 0 )
	PremiumTitleCopy0:setText( Engine.Localize( "MLG_GAMEBATTLES_PREMIUM" ), 0 )
	PremiumTitleCopy0:SetFontSize( 45 * _1080p )
	PremiumTitleCopy0:SetFont( FONTS.GetFont( FONTS.Dev.File ) )
	PremiumTitleCopy0:SetAlignment( LUI.Alignment.Center )
	PremiumTitleCopy0:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, _1080p * 67.5, _1080p * 112.5 )
	self:addElement( PremiumTitleCopy0 )
	self.PremiumTitleCopy0 = PremiumTitleCopy0
	
	local BestXOutOfY = nil
	
	BestXOutOfY = LUI.UIText.new()
	BestXOutOfY.id = "BestXOutOfY"
	BestXOutOfY:setText( Engine.Localize( "MLG_GAMEBATTLES_BEST_X_OUT_OF_Y" ), 0 )
	BestXOutOfY:SetFontSize( 55 * _1080p )
	BestXOutOfY:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	BestXOutOfY:SetAlignment( LUI.Alignment.Center )
	BestXOutOfY:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 3.5, _1080p * 496.5, _1080p * 112.5, _1080p * 167.5 )
	self:addElement( BestXOutOfY )
	self.BestXOutOfY = BestXOutOfY
	
	local MatchIDLabel = nil
	
	MatchIDLabel = LUI.UIText.new()
	MatchIDLabel.id = "MatchIDLabel"
	MatchIDLabel:setText( Engine.Localize( "MLG_GAMEBATTLES_MATCH_ID_LABEL" ), 0 )
	MatchIDLabel:SetFontSize( 20 * _1080p )
	MatchIDLabel:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	MatchIDLabel:SetAlignment( LUI.Alignment.Left )
	MatchIDLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 5, _1080p * 500, _1080p * 7, _1080p * 27 )
	self:addElement( MatchIDLabel )
	self.MatchIDLabel = MatchIDLabel
	
	local Divider = nil
	
	Divider = LUI.UIImage.new()
	Divider.id = "Divider"
	Divider:SetRGBFromInt( 11908533, 0 )
	Divider:SetAlpha( 0.75, 0 )
	Divider:setImage( RegisterMaterial( "widg_gradient_left_to_right" ), 0 )
	Divider:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, _1080p * 27, _1080p * 26.5 )
	self:addElement( Divider )
	self.Divider = Divider
	
	local NextMatchDividerTop = nil
	
	NextMatchDividerTop = LUI.UIImage.new()
	NextMatchDividerTop.id = "NextMatchDividerTop"
	NextMatchDividerTop:SetAlpha( 0.3, 0 )
	NextMatchDividerTop:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 186, _1080p * 187 )
	self:addElement( NextMatchDividerTop )
	self.NextMatchDividerTop = NextMatchDividerTop
	
	local NextMatchDividerBottom = nil
	
	NextMatchDividerBottom = LUI.UIImage.new()
	NextMatchDividerBottom.id = "NextMatchDividerBottom"
	NextMatchDividerBottom:SetAlpha( 0.3, 0 )
	NextMatchDividerBottom:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 231, _1080p * 232 )
	self:addElement( NextMatchDividerBottom )
	self.NextMatchDividerBottom = NextMatchDividerBottom
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		backgroundCopy0:RegisterAnimationSequence( "NoUpcommingMatch", {
			{
				function ()
					return self.backgroundCopy0:SetAlpha( 0, 0 )
				end
			}
		} )
		background:RegisterAnimationSequence( "NoUpcommingMatch", {
			{
				function ()
					return self.background:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, _1080p * 57, _1080p * 200, 0 )
				end
			}
		} )
		TitleHeader:RegisterAnimationSequence( "NoUpcommingMatch", {
			{
				function ()
					return self.TitleHeader:SetAlpha( 0, 0 )
				end
			}
		} )
		CountdownTitleBG:RegisterAnimationSequence( "NoUpcommingMatch", {
			{
				function ()
					return self.CountdownTitleBG:SetAlpha( 0, 0 )
				end
			}
		} )
		CountdownTitle:RegisterAnimationSequence( "NoUpcommingMatch", {
			{
				function ()
					return self.CountdownTitle:SetAlpha( 0, 0 )
				end
			}
		} )
		MatchDate:RegisterAnimationSequence( "NoUpcommingMatch", {
			{
				function ()
					return self.MatchDate:SetAlpha( 0, 0 )
				end
			}
		} )
		MatchError:RegisterAnimationSequence( "NoUpcommingMatch", {
			{
				function ()
					return self.MatchError:SetAlpha( 1, 0 )
				end
			}
		} )
		Countdown:RegisterAnimationSequence( "NoUpcommingMatch", {
			{
				function ()
					return self.Countdown:SetAlpha( 0, 0 )
				end
			}
		} )
		PremiumTitle:RegisterAnimationSequence( "NoUpcommingMatch", {
			{
				function ()
					return self.PremiumTitle:SetAlpha( 0, 0 )
				end
			}
		} )
		PremiumLeftLine:RegisterAnimationSequence( "NoUpcommingMatch", {
			{
				function ()
					return self.PremiumLeftLine:SetAlpha( 0, 0 )
				end
			}
		} )
		PremiumLeftLineCopy0:RegisterAnimationSequence( "NoUpcommingMatch", {
			{
				function ()
					return self.PremiumLeftLineCopy0:SetAlpha( 0, 0 )
				end
			}
		} )
		PremiumLeftLineCopy1:RegisterAnimationSequence( "NoUpcommingMatch", {
			{
				function ()
					return self.PremiumLeftLineCopy1:SetAlpha( 0, 0 )
				end
			}
		} )
		PremiumRightLine:RegisterAnimationSequence( "NoUpcommingMatch", {
			{
				function ()
					return self.PremiumRightLine:SetAlpha( 0, 0 )
				end
			}
		} )
		PremiumRightLineCopy0:RegisterAnimationSequence( "NoUpcommingMatch", {
			{
				function ()
					return self.PremiumRightLineCopy0:SetAlpha( 0, 0 )
				end
			}
		} )
		PremiumRightLineCopy1:RegisterAnimationSequence( "NoUpcommingMatch", {
			{
				function ()
					return self.PremiumRightLineCopy1:SetAlpha( 0, 0 )
				end
			}
		} )
		BestXOutOfY:RegisterAnimationSequence( "NoUpcommingMatch", {
			{
				function ()
					return self.BestXOutOfY:SetAlpha( 0, 0 )
				end
			}
		} )
		MatchIDLabel:RegisterAnimationSequence( "NoUpcommingMatch", {
			{
				function ()
					return self.MatchIDLabel:SetAlpha( 0, 0 )
				end
			}
		} )
		Divider:RegisterAnimationSequence( "NoUpcommingMatch", {
			{
				function ()
					return self.Divider:SetAlpha( 0, 0 )
				end
			}
		} )
		NextMatchDividerTop:RegisterAnimationSequence( "NoUpcommingMatch", {
			{
				function ()
					return self.NextMatchDividerTop:SetAlpha( 0, 0 )
				end
			}
		} )
		NextMatchDividerBottom:RegisterAnimationSequence( "NoUpcommingMatch", {
			{
				function ()
					return self.NextMatchDividerBottom:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.NoUpcommingMatch = function ()
			backgroundCopy0:AnimateSequence( "NoUpcommingMatch" )
			background:AnimateSequence( "NoUpcommingMatch" )
			TitleHeader:AnimateSequence( "NoUpcommingMatch" )
			CountdownTitleBG:AnimateSequence( "NoUpcommingMatch" )
			CountdownTitle:AnimateSequence( "NoUpcommingMatch" )
			MatchDate:AnimateSequence( "NoUpcommingMatch" )
			MatchError:AnimateSequence( "NoUpcommingMatch" )
			Countdown:AnimateSequence( "NoUpcommingMatch" )
			PremiumTitle:AnimateSequence( "NoUpcommingMatch" )
			PremiumLeftLine:AnimateSequence( "NoUpcommingMatch" )
			PremiumLeftLineCopy0:AnimateSequence( "NoUpcommingMatch" )
			PremiumLeftLineCopy1:AnimateSequence( "NoUpcommingMatch" )
			PremiumRightLine:AnimateSequence( "NoUpcommingMatch" )
			PremiumRightLineCopy0:AnimateSequence( "NoUpcommingMatch" )
			PremiumRightLineCopy1:AnimateSequence( "NoUpcommingMatch" )
			BestXOutOfY:AnimateSequence( "NoUpcommingMatch" )
			MatchIDLabel:AnimateSequence( "NoUpcommingMatch" )
			Divider:AnimateSequence( "NoUpcommingMatch" )
			NextMatchDividerTop:AnimateSequence( "NoUpcommingMatch" )
			NextMatchDividerBottom:AnimateSequence( "NoUpcommingMatch" )
		end
		
		backgroundCopy0:RegisterAnimationSequence( "RegMatch", {
			{
				function ()
					return self.backgroundCopy0:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, _1080p * 183, _1080p * 336, 0 )
				end
			}
		} )
		background:RegisterAnimationSequence( "RegMatch", {
			{
				function ()
					return self.background:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, _1080p * 57, _1080p * 138, 0 )
				end
			}
		} )
		CountdownTitleBG:RegisterAnimationSequence( "RegMatch", {
			{
				function ()
					return self.CountdownTitleBG:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, _1080p * 138, _1080p * 183, 0 )
				end
			}
		} )
		CountdownTitle:RegisterAnimationSequence( "RegMatch", {
			{
				function ()
					return self.CountdownTitle:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, _1080p * 142.5, _1080p * 178.5, 0 )
				end
			}
		} )
		MatchDate:RegisterAnimationSequence( "RegMatch", {
			{
				function ()
					return self.MatchDate:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 28, _1080p * 472, _1080p * 199.5, _1080p * 237.5, 0 )
				end
			}
		} )
		Countdown:RegisterAnimationSequence( "RegMatch", {
			{
				function ()
					return self.Countdown:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 90, _1080p * 410, _1080p * 248.5, _1080p * 328.5, 0 )
				end
			}
		} )
		PremiumTitle:RegisterAnimationSequence( "RegMatch", {
			{
				function ()
					return self.PremiumTitle:SetAlpha( 0, 0 )
				end
			}
		} )
		PremiumLeftLine:RegisterAnimationSequence( "RegMatch", {
			{
				function ()
					return self.PremiumLeftLine:SetAlpha( 0, 0 )
				end
			}
		} )
		PremiumLeftLineCopy0:RegisterAnimationSequence( "RegMatch", {
			{
				function ()
					return self.PremiumLeftLineCopy0:SetAlpha( 0, 0 )
				end
			}
		} )
		PremiumLeftLineCopy1:RegisterAnimationSequence( "RegMatch", {
			{
				function ()
					return self.PremiumLeftLineCopy1:SetAlpha( 0, 0 )
				end
			}
		} )
		PremiumRightLine:RegisterAnimationSequence( "RegMatch", {
			{
				function ()
					return self.PremiumRightLine:SetAlpha( 0, 0 )
				end
			}
		} )
		PremiumRightLineCopy0:RegisterAnimationSequence( "RegMatch", {
			{
				function ()
					return self.PremiumRightLineCopy0:SetAlpha( 0, 0 )
				end
			}
		} )
		PremiumRightLineCopy1:RegisterAnimationSequence( "RegMatch", {
			{
				function ()
					return self.PremiumRightLineCopy1:SetAlpha( 0, 0 )
				end
			}
		} )
		BestXOutOfY:RegisterAnimationSequence( "RegMatch", {
			{
				function ()
					return self.BestXOutOfY:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 3.5, _1080p * 496.5, _1080p * 69.5, _1080p * 124.5, 0 )
				end
			}
		} )
		NextMatchDividerTop:RegisterAnimationSequence( "RegMatch", {
			{
				function ()
					return self.NextMatchDividerTop:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 138, _1080p * 139, 0 )
				end
			}
		} )
		NextMatchDividerBottom:RegisterAnimationSequence( "RegMatch", {
			{
				function ()
					return self.NextMatchDividerBottom:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 183, _1080p * 184, 0 )
				end
			}
		} )
		self._sequences.RegMatch = function ()
			backgroundCopy0:AnimateSequence( "RegMatch" )
			background:AnimateSequence( "RegMatch" )
			CountdownTitleBG:AnimateSequence( "RegMatch" )
			CountdownTitle:AnimateSequence( "RegMatch" )
			MatchDate:AnimateSequence( "RegMatch" )
			Countdown:AnimateSequence( "RegMatch" )
			PremiumTitle:AnimateSequence( "RegMatch" )
			PremiumLeftLine:AnimateSequence( "RegMatch" )
			PremiumLeftLineCopy0:AnimateSequence( "RegMatch" )
			PremiumLeftLineCopy1:AnimateSequence( "RegMatch" )
			PremiumRightLine:AnimateSequence( "RegMatch" )
			PremiumRightLineCopy0:AnimateSequence( "RegMatch" )
			PremiumRightLineCopy1:AnimateSequence( "RegMatch" )
			BestXOutOfY:AnimateSequence( "RegMatch" )
			NextMatchDividerTop:AnimateSequence( "RegMatch" )
			NextMatchDividerBottom:AnimateSequence( "RegMatch" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local1( self, f5_local1, controller )
	return self
end

MenuBuilder.registerType( "GameBattlesUpcomingMatch", GameBattlesUpcomingMatch )
LockTable( _M )
