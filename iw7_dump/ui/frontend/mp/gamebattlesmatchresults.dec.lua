local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ExitPopup( f1_arg0, f1_arg1 )
	MLG.ResetGameBattleSchedule( f1_arg1.controller )
	LUI.FlowManager.RequestLeaveMenu( f1_arg0 )
end

f0_local0 = function ( f2_arg0, f2_arg1, f2_arg2 )
	if 1 < f2_arg2 then
		f2_arg0.MatchWinner:setText( Engine.Localize( "MLG_GAMEBATTLES_MATCH_WON", f2_arg1, f2_arg2 ) )
	else
		f2_arg0.MatchWinner:setText( Engine.Localize( "MLG_GAMEBATTLES_MATCH_WON_SINGLE", f2_arg1, f2_arg2 ) )
	end
end

f0_local1 = function ( f3_arg0, f3_arg1, f3_arg2 )
	f3_arg0.WinnerHeader:setText( Engine.Localize( "MLG_GAMEBATTLES_GAME_WON_LINE", f3_arg2.alliesWins + f3_arg2.axisWins, f3_arg2.gbMatch.gameCount ) )
	for f3_local7, f3_local8 in ipairs( f3_arg2.gbMatch.games ) do
		local f3_local3 = nil
		if f3_local8.status == GAMEBATTLES.MLG_GAME_STATUS.UNPLAYED then
			f3_local3 = f3_local7 - 1
		elseif f3_local7 == f3_arg2.gbMatch.gameCount then
			f3_local3 = f3_local7
		end
		if f3_local3 ~= nil then
			local f3_local4 = f3_arg2.gbMatch.games[f3_local3]
			if f3_local4.status == GAMEBATTLES.MLG_GAME_STATUS.WON_HOME or f3_local4.status == GAMEBATTLES.MLG_GAME_STATUS.WON_AWAY then
			
			else
				f3_arg0.WinnerLabel:setText( f3_local3 .. " [" .. f3_arg2.alliesWins .. "-" .. f3_arg2.axisWins .. "]" )
				break
			end
			local f3_local5 = f3_arg2.gbMatch.teams[2].teamName
			local f3_local6 = f3_arg2.gbMatch.teams[2].teamId
			if f3_local4.status == GAMEBATTLES.MLG_GAME_STATUS.WON_HOME then
			
			else
				f3_arg0.WinnerLabel:setText( f3_local5 .. " [" .. f3_local6 .. "]" )
				break
			end
			f3_local5 = f3_arg2.gbMatch.teams[1].teamName
			f3_local6 = f3_arg2.gbMatch.teams[1].teamId
		end
	end
	f3_local0 = f3_arg2.gbMatch.gameCount / 2
	if f3_local0 >= f3_arg2.alliesWins and f3_local0 >= f3_arg2.axisWins then
		f3_local1 = false
	else
		f3_local1 = true
	end
	if f3_local1 then
		ACTIONS.AnimateSequence( f3_arg0, "MatchWon" )
		if f3_arg2.axisWins < f3_arg2.alliesWins then
			f0_local0( f3_arg0, f3_arg2.gbMatch.teams[1].teamName, f3_arg2.alliesWins )
		else
			f0_local0( f3_arg0, f3_arg2.gbMatch.teams[2].teamName, f3_arg2.axisWins )
		end
	end
	f3_arg0.PopupButton:addEventHandler( "button_down", ExitPopup )
end

function GameBattlesMatchResults( menu, controller )
	local self = LUI.UIVerticalNavigator.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 800 * _1080p, 0, 200 * _1080p )
	self.id = "GameBattlesMatchResults"
	self._animationSets = {}
	self._sequences = {}
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local MatchWinner = nil
	
	MatchWinner = LUI.UIText.new()
	MatchWinner.id = "MatchWinner"
	MatchWinner:SetAlpha( 0, 0 )
	MatchWinner:setText( Engine.Localize( "MLG_GAMEBATTLES_MATCH_WON" ), 0 )
	MatchWinner:SetFontSize( 30 * _1080p )
	MatchWinner:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	MatchWinner:SetAlignment( LUI.Alignment.Center )
	MatchWinner:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 16, _1080p * 787, _1080p * 20.5, _1080p * 50.5 )
	self:addElement( MatchWinner )
	self.MatchWinner = MatchWinner
	
	local WinnerHeader = nil
	
	WinnerHeader = LUI.UIText.new()
	WinnerHeader.id = "WinnerHeader"
	WinnerHeader:setText( ToUpperCase( Engine.Localize( "MLG_GAMEBATTLES_GAME_WON_LINE" ) ), 0 )
	WinnerHeader:SetFontSize( 30 * _1080p )
	WinnerHeader:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	WinnerHeader:SetAlignment( LUI.Alignment.Center )
	WinnerHeader:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 16, _1080p * 787, _1080p * 20.5, _1080p * 50.5 )
	self:addElement( WinnerHeader )
	self.WinnerHeader = WinnerHeader
	
	local WinnerLabel = nil
	
	WinnerLabel = LUI.UIText.new()
	WinnerLabel.id = "WinnerLabel"
	WinnerLabel:setText( "TEAM UNSA", 0 )
	WinnerLabel:SetFontSize( 30 * _1080p )
	WinnerLabel:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	WinnerLabel:SetAlignment( LUI.Alignment.Center )
	WinnerLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 16, _1080p * 787, _1080p * 57.5, _1080p * 87.5 )
	self:addElement( WinnerLabel )
	self.WinnerLabel = WinnerLabel
	
	local PopupButton = nil
	
	PopupButton = MenuBuilder.BuildRegisteredType( "PopupButton", {
		controllerIndex = f4_local1
	} )
	PopupButton.id = "PopupButton"
	PopupButton.Label:setText( ToUpperCase( Engine.Localize( "MENU_CONTINUE" ) ), 0 )
	PopupButton.Label:SetAlignment( LUI.Alignment.Left )
	PopupButton:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 200, _1080p * 600, _1080p * 150, _1080p * 180 )
	self:addElement( PopupButton )
	self.PopupButton = PopupButton
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		MatchWinner:RegisterAnimationSequence( "MatchWon", {
			{
				function ()
					return self.MatchWinner:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.MatchWinner:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 16, _1080p * 787, _1080p * 85, _1080p * 115, 0 )
				end
			}
		} )
		WinnerHeader:RegisterAnimationSequence( "MatchWon", {
			{
				function ()
					return self.WinnerHeader:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 16, _1080p * 787, _1080p * 10.5, _1080p * 40.5, 0 )
				end
			}
		} )
		WinnerLabel:RegisterAnimationSequence( "MatchWon", {
			{
				function ()
					return self.WinnerLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 16, _1080p * 787, _1080p * 47.5, _1080p * 77.5, 0 )
				end
			}
		} )
		self._sequences.MatchWon = function ()
			MatchWinner:AnimateSequence( "MatchWon" )
			WinnerHeader:AnimateSequence( "MatchWon" )
			WinnerLabel:AnimateSequence( "MatchWon" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local1( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "GameBattlesMatchResults", GameBattlesMatchResults )
LockTable( _M )
