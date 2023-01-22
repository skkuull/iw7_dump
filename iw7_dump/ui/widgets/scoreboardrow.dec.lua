local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = 0
f0_local1 = 1
f0_local2 = 2
local f0_local3 = {
	3,
	4,
	5,
	6
}
local f0_local4 = function ( f1_arg0 )
	if f1_arg0:isInFocus() then
		f1_arg0.scoreboardRow:SetAllFieldsColor( GetIntForColor( SWATCHES.Scoreboard.overText ) )
	elseif f1_arg0._isCurrentPlayer then
		f1_arg0.scoreboardRow:SetAllFieldsColor( GetIntForColor( SWATCHES.CAC.streakSelected ) )
	else
		f1_arg0.scoreboardRow:SetAllFieldsColor( GetIntForColor( SWATCHES.Scoreboard.text ) )
	end
	if f1_arg0._isMasterPrestige then
		f1_arg0.scoreboardRow:SetFieldColor( f0_local0, GetIntForColor( SWATCHES.Scoreboard.masterPrestige ) )
	end
end

function RefreshRowContent( f2_arg0, f2_arg1 )
	assert( f2_arg0._team )
	assert( f2_arg0._row )
	assert( f2_arg0._controllerIndex )
	local f2_local0 = SCOREBOARD.IsAARScoreboard()
	local f2_local1 = nil
	if f2_local0 then
		f2_local1 = PostMatch.GetScoreboardRowData( f2_arg0._controllerIndex, f2_arg0._team )
		f2_local1 = f2_local1[f2_arg0._row]
	else
		f2_local1 = Game.GetScoreboardRowData( f2_arg0._team, f2_arg0._row, true )
	end
	if f2_local1 then
		if not f2_arg1 then
			if f2_arg0._gameType == MP.GameMode.HardpointGameType or f2_arg0._gameType == MP.GameMode.TDefGameType or f2_arg0._gameType == MP.GameMode.InfectGameType or f2_arg0._gameType == MP.GameMode.GrndGameType then
				assert( f2_local1.extraScore0 )
				f2_local1.extraScore0 = string.format( "%.1d:%.2d", math.floor( f2_local1.extraScore0 / 60 % 60 ), f2_local1.extraScore0 % 60 )
			end
			assert( f2_local1 )
			assert( f2_local1.clientNum or f2_local0 )
			f2_arg0._clientNum = f2_local1.clientNum
			assert( f2_local1.xuid or not f2_local0 )
			f2_arg0._xuid = f2_local1.xuid
			local f2_local2
			if f2_local0 or f2_arg0._clientNum ~= Game.GetPlayerClientnum() then
				f2_local2 = false
			else
				f2_local2 = true
			end
			f2_arg0._isCurrentPlayer = f2_local2
			assert( f2_local1.isBot ~= nil )
			f2_arg0._isBot = f2_local1.isBot
			f2_local2 = 30
			local f2_local3 = 64
			local f2_local4 = 83
			local f2_local5 = 374 + f2_local2
			local f2_local6 = {}
			if f2_local0 then
				f2_local6[1] = 459 + f2_local2
				f2_local6[2] = 564 + f2_local2
				f2_local6[3] = 664 + f2_local2
				f2_local6[4] = 768 + f2_local2
			else
				f2_local6[1] = 456 + f2_local2
				f2_local6[2] = 548 + f2_local2
				f2_local6[3] = 643 + f2_local2
				f2_local6[4] = 737 + f2_local2
			end
			assert( f2_local1.kills )
			assert( f2_local1.deaths )
			f2_local1.killDeathRatio = SCOREBOARD.CalculateKillDeathRatio( f2_local1.kills, f2_local1.deaths )
			if not Engine.GetDvarBool( "systemlink" ) and not Engine.GetDvarBool( "xblive_privatematch" ) then
				assert( f2_local1.rank )
				assert( f2_local1.prestige )
				local f2_local7 = Rank.GetRankDisplay( f2_local1.rank, f2_local1.prestige, true, true )
				local f2_local8 = Rank.GetRankIcon( f2_local1.rank, f2_local1.prestige )
				f2_arg0.scoreboardRow:SetFieldAndPosition( f0_local0, f2_local7, f2_local3 * _1080p, LUI.Alignment.Center )
				f2_arg0.RankIcon:setImage( RegisterMaterial( f2_local8 ), 0 )
				f2_arg0._isMasterPrestige = Rank.IsMasterPrestige( f2_local1.prestige )
			else
				f2_arg0.RankIcon:SetAlpha( 0 )
			end
			assert( f2_local1.name )
			local f2_local7 = f2_local1.name
			if Engine.IsPC() then
				f2_local7 = Engine.TruncateToGlyphCount( f2_local7, 16 )
			end
			local f2_local8 = f2_local1.clanTag
			if f2_local0 and f2_local7 and f2_local8 and #f2_local8 > 0 then
				f2_local7 = "[" .. f2_local8 .. "]" .. f2_local7
			end
			f2_arg0.scoreboardRow:SetFieldAndPosition( f0_local1, f2_local7, f2_local4 * _1080p, LUI.Alignment.Left )
			assert( f2_local1.score )
			f2_arg0.scoreboardRow:SetFieldAndPosition( f0_local2, string.format( "%d", f2_local1.score ), f2_local5 * _1080p, LUI.Alignment.Center )
			for f2_local9 = 1, #f0_local3, 1 do
				local f2_local12 = SCOREBOARD.GetGameModeFieldName( f2_arg0._controllerIndex, f2_local9 )
				if f2_local12 then
					local f2_local13 = f2_local1[f2_local12]
					assert( f2_local13 )
					local f2_local14 = f0_local3[f2_local9]
					local f2_local15 = f2_local6[f2_local9]
					if type( f2_local13 ) == "number" then
						f2_arg0.scoreboardRow:SetFieldAndPosition( f2_local14, string.format( "%d", f2_local13 ), f2_local15 * _1080p, LUI.Alignment.Center )
					end
					if type( f2_local13 ) == "string" then
						f2_arg0.scoreboardRow:SetFieldAndPosition( f2_local14, f2_local13, f2_local15 * _1080p, LUI.Alignment.Center )
					end
				end
			end
			if not f2_arg0:isInFocus() and f2_arg0._isCurrentPlayer ~= f2_arg0._wasCurrentPlayer then
				local f2_local9 = function ()
					f2_arg0.Highlight:SetAlpha( 0, 0 )
					if not Engine.InFrontend() then
						f2_arg0.PingIcon:SetRGBFromInt( 16777215, 0 )
					end
				end
				
				if f2_arg0._isCurrentPlayer then
					f2_arg0.scoreboardRow:SetAlpha( 1, 0 )
					f2_local9()
				else
					f2_local9()
				end
				f2_arg0._wasCurrentPlayer = f2_arg0._isCurrentPlayer
			end
			f0_local4( f2_arg0 )
		end
		assert( f2_local1.isMuted ~= nil )
		f2_arg0.Speaker:setImage( RegisterMaterial( f2_local1.isMuted and "scoreboard_mic_mute" or "scoreboard_mic_talk" ), 0 )
		assert( f2_local1.isMicOn ~= nil )
		assert( f2_local1.isMuted ~= nil )
		local f2_local3 = nil
		if f2_local1.isMicOn or f2_local1.isMuted then
			f2_local3 = "MicOn"
		else
			f2_local3 = "MicOff"
		end
		if f2_arg0._micAnim ~= f2_local3 then
			if f2_local3 == "MicOn" then
				f2_arg0.Speaker:SetAlpha( 1, 0 )
			else
				f2_arg0.Speaker:SetAlpha( 0, 0 )
			end
			f2_arg0._micAnim = f2_local3
		end
		if not Engine.InFrontend() then
			assert( f2_local1.ping )
			f2_arg0.PingIcon:setImage( RegisterMaterial( SCOREBOARD.GetPingIcon( f2_local1.ping ) ), 0 )
		end
		if not Engine.InFrontend() then
			assert( f2_local1.isDead ~= nil )
			local f2_local4 = f2_local1.isDead
			assert( f2_local1.hasDogtag ~= nil )
			local f2_local5 = f2_local1.hasDogtag
			local f2_local6 = DataSources.inGame.MP.match.postGameState:GetValue( f2_arg0._controllerIndex )
			local f2_local7, f2_local8 = nil
			if f2_local4 and (f2_local6 <= PostGameState.ROUND_END or f2_local6 > PostGameState.FINAL_KILLCAM) then
				if f2_local5 then
					local f2_local16 = Teams.allies
					if Game.GetPlayerTeam() == Teams.axis then
						f2_local16 = Teams.axis
					end
					if Game.GetPlayerTeam( f2_arg0._clientNum ) == f2_local16 then
						f2_arg0.DeathIcon:setImage( RegisterMaterial( "waypoint_dogtags_friendlys" ), 0 )
					else
						f2_arg0.DeathIcon:setImage( RegisterMaterial( "waypoint_dogtags" ), 0 )
					end
				else
					f2_arg0.DeathIcon:setImage( RegisterMaterial( "killicondied" ), 0 )
				end
				f2_local7 = 1
				f2_local8 = 0
			end
			if not f2_local4 and (f2_local6 < PostGameState.ACTIVE or f2_local6 > PostGameState.FINAL_KILLCAM) then
				f2_local7 = 0
				f2_local8 = 1
			end
			if f2_local7 and f2_arg0._playerDeathIconAction ~= f2_local7 then
				f2_arg0._playerDeathIconAction = f2_local7
				if not Engine.InFrontend() then
					if f2_local7 == 1 then
						f2_arg0.DeathIcon:SetAlpha( 1, 0 )
					else
						f2_arg0.DeathIcon:SetAlpha( 0, 0 )
					end
				end
			end
			local f2_local16
			if not Engine.GetDvarBool( "systemlink" ) then
				f2_local16 = not Engine.GetDvarBool( "xblive_privatematch" )
			else
				f2_local16 = false
			end
			if f2_local16 and f2_local8 and f2_arg0._rankAction ~= f2_local8 then
				f2_arg0._rankAction = f2_local8
				if f2_local8 == 1 then
					f2_arg0.RankIcon:SetAlpha( 0.75, 0 )
				else
					f2_arg0.RankIcon:SetAlpha( 0, 0 )
				end
			end
		end
	end
end

function SetPlayer( f4_arg0, f4_arg1, f4_arg2 )
	f4_arg0._team = f4_arg1
	f4_arg0._row = f4_arg2
	if f4_arg0.BackgroundAlternate then
		f4_arg0.BackgroundAlternate:SetAlpha( f4_arg2 % 2 and 0 or 0.35 )
	end
end

function GetClientNum( f5_arg0 )
	return f5_arg0._clientNum
end

function IsMyRow( f6_arg0 )
	return f6_arg0._isCurrentPlayer
end

function PostLoadFunc( f7_arg0, f7_arg1, f7_arg2 )
	local scoreboardRow = LUI.UIMultiFieldTextRow.new()
	scoreboardRow:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 9, _1080p * -9, _1080p * -9, _1080p * 9 )
	scoreboardRow:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	scoreboardRow:SetFontSize( 18 * _1080p )
	scoreboardRow:SetAllFieldsColor( GetIntForColor( SWATCHES.Scoreboard.RowText ) )
	scoreboardRow:SetAlignment( LUI.Alignment.Center )
	f7_arg0:addElement( scoreboardRow )
	f7_arg0.scoreboardRow = scoreboardRow
	
	f7_arg0._controllerIndex = f7_arg1
	f7_arg0.RefreshRowContent = RefreshRowContent
	f7_arg0.SetPlayer = SetPlayer
	f7_arg0.GetClientNum = GetClientNum
	f7_arg0.IsMyRow = IsMyRow
	if SCOREBOARD.IsAARScoreboard() then
		f7_arg0._gameType = DataSources.frontEnd.AAR.gameType:GetValue( f7_arg1 )
	else
		f7_arg0._gameType = DataSources.inGame.MP.match.gameType:GetValue( f7_arg1 )
	end
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	f7_arg0:addElement( bindButton )
	f7_arg0.bindButton = bindButton
	
	f7_arg0.bindButton:addEventHandler( "button_alt1", function ( f8_arg0, f8_arg1 )
		if f7_arg0:isInFocus() and f7_arg0._isBot == false and not f7_arg0._isCurrentPlayer then
			local f8_local0 = SCOREBOARD.IsAARScoreboard()
			if f7_arg0._clientNum and not f8_local0 and not Game.GetOmnvar( "ui_scoreboard_freeze" ) then
				Game.TogglePlayerMute( f7_arg0._clientNum )
				f7_arg0:RefreshRowContent( true )
				return true
			elseif f7_arg0._xuid and f8_local0 and Lobby.IsInLobby() then
				Lobby.ToggleMuteWithXuidString( f7_arg1, f7_arg0._xuid )
				f7_arg0:RefreshRowContent( true )
				return true
			end
		end
	end )
	f7_arg0.bindButton:addEventHandler( "button_start", function ( f9_arg0, f9_arg1 )
		local f9_local0 = f9_arg0:getParent()
		if #f9_local0:getAllFocusedChildren() <= 0 then
			f9_local0 = f9_arg0:getParent()
			if f9_local0:isInFocus() then
				if (Engine.IsConsoleGame() or Engine.IsPCApp()) and not Engine.IsAliensMode() and not CONDITIONS.IsSystemLink( f7_arg0 ) and f7_arg0._isBot == false then
					local f9_local1 = SCOREBOARD.IsAARScoreboard()
					if not f9_local1 and f7_arg0._clientNum and not Game.GetOmnvar( "ui_scoreboard_freeze" ) then
						Game.ShowGamerCard( f7_arg0._clientNum )
					elseif f9_local1 and f7_arg0._xuid then
						Lobby.ShowGamerCardWithXuidString( f7_arg1, f7_arg0._xuid )
					end
				end
				return true
			end
		end
		if (Engine.IsConsoleGame() or Engine.IsPCApp()) and not Engine.IsAliensMode() and not CONDITIONS.IsSystemLink( f7_arg0 ) and f7_arg0._isBot == false then
			local f9_local1 = SCOREBOARD.IsAARScoreboard()
			if not f9_local1 and f7_arg0._clientNum and not Game.GetOmnvar( "ui_scoreboard_freeze" ) then
				Game.ShowGamerCard( f7_arg0._clientNum )
			elseif f9_local1 and f7_arg0._xuid then
				Lobby.ShowGamerCardWithXuidString( f7_arg1, f7_arg0._xuid )
			end
		end
		return true
	end )
	f7_arg0:addEventHandler( "button_up", function ()
		local f10_local0 = f7_arg0._isCurrentPlayer
		f7_arg0.Speaker:SetRGBFromInt( 16777215, 0 )
		if f10_local0 then
			f7_arg0.Highlight:SetAlpha( 0, 0 )
			f7_arg0.scoreboardRow:SetAlpha( 1, 0 )
			if not Engine.InFrontend() then
				f7_arg0.PingIcon:SetRGBFromInt( 16777215, 0 )
			end
		else
			f7_arg0.Highlight:SetAlpha( 0, 0 )
			if not Engine.InFrontend() then
				f7_arg0.PingIcon:SetRGBFromInt( 16777215, 0 )
			end
		end
		f0_local4( f7_arg0 )
	end )
	f7_arg0:addEventHandler( "button_over", function ( f11_arg0, f11_arg1 )
		f7_arg0.Highlight:SetAlpha( 1, 0 )
		f7_arg0.Highlight:SetRGBFromInt( 15132390, 0 )
		f7_arg0.Speaker:SetRGBFromInt( 0, 0 )
		f0_local4( f7_arg0 )
		if not Engine.InFrontend() then
			f7_arg0.PingIcon:SetRGBFromInt( 0, 0 )
		end
		local f11_local0 = nil
		if SCOREBOARD.IsAARScoreboard() then
			f11_local0 = f11_arg0:GetCurrentMenu()
		else
			local f11_local1 = f11_arg0
			local f11_local2 = f11_arg0:getParent()
			while f11_local2 do
				if f11_local2 == LUI.ScoreboardLayer:GetInstance() then
					f11_local0 = f11_local1
					break
				end
				f11_local1 = f11_local2
				f11_local2 = f11_local2:getParent()
			end
		end
		if f11_local0 ~= nil and f11_local0.ButtonHelperBar ~= nil and (Engine.IsConsoleGame() or Engine.IsPCApp()) and not Engine.IsAliensMode() then
			local f11_local1 = f7_arg0._isCurrentPlayer == true
			if f7_arg0._isBot == true then
				f11_local0:RemoveButtonHelperTextFromElement( f11_local0.ButtonHelperBar, "button_start", SCOREBOARD.IsAARScoreboard() and "left" or "right" )
				f11_local0:RemoveButtonHelperTextFromElement( f11_local0.ButtonHelperBar, "button_alt1", SCOREBOARD.IsAARScoreboard() and "left" or "right" )
			else
				if not CONDITIONS.IsSystemLink( f7_arg0 ) then
					f11_local0:AddButtonHelperTextToElement( f11_local0.ButtonHelperBar, {
						helper_text = Engine.Localize( "XBOXLIVE_VIEW_PROFILE" ),
						button_ref = "button_start",
						side = SCOREBOARD.IsAARScoreboard() and "left" or "right",
						priority = 0,
						clickable = false
					} )
				end
				local f11_local3 = true
				local f11_local4 = true
				if SCOREBOARD.IsAARScoreboard() then
					f11_local3 = Lobby.IsInLobby()
				elseif f7_arg0._clientNum ~= nil then
					f11_local4 = Game.CanChangePlayerMute( f7_arg0._clientNum )
				end
				if f11_local1 ~= true and f11_local3 == true and f11_local4 == true then
					f11_local0:AddButtonHelperTextToElement( f11_local0.ButtonHelperBar, {
						helper_text = Engine.Localize( "SPEECH_MUTE_UNMUTE" ),
						button_ref = "button_alt1",
						side = SCOREBOARD.IsAARScoreboard() and "left" or "right",
						priority = 0,
						clickable = false
					} )
				else
					f11_local0:RemoveButtonHelperTextFromElement( f11_local0.ButtonHelperBar, "button_alt1", SCOREBOARD.IsAARScoreboard() and "left" or "right" )
				end
			end
		end
		if SCOREBOARD.IsAARScoreboard() then
			f7_arg0.Highlight:SetAlpha( 1, 0 )
			f7_arg0.Highlight:SetRGBFromInt( 15132390, 0 )
			if not Engine.InFrontend() then
				f7_arg0.PingIcon:SetRGBFromInt( 0, 0 )
			end
		end
	end )
	f7_arg0:setGainFocusSFX( nil )
	f7_arg0:addEventHandler( "open_scoreboard", function ( f12_arg0, f12_arg1 )
		f7_arg0:setGainFocusSFX( SCOREBOARD.GainFocusSFX )
	end )
	f7_arg0:addEventHandler( "close_scoreboard", function ( f13_arg0, f13_arg1 )
		f7_arg0:setGainFocusSFX( nil )
	end )
	local f7_local2 = nil
	if SCOREBOARD.IsAARScoreboard() then
		local BackgroundAlternate = CoD.GetCommonPlayerDataDataSource()
		f7_local2 = BackgroundAlternate.round.gameMode:GetValue( f7_arg1 )
	else
		f7_local2 = DataSources.inGame.MP.match.gameType:GetValue( f7_arg1 )
	end
	local BackgroundAlternate = nil
	
	BackgroundAlternate = LUI.UIImage.new()
	BackgroundAlternate.id = "BackgroundAlternate"
	BackgroundAlternate:SetAnchors( 0, 0, 0, 0, 0 )
	BackgroundAlternate:SetLeft( _1080p * 0, 0 )
	BackgroundAlternate:SetRight( _1080p * 0, 0 )
	BackgroundAlternate:SetTop( _1080p * 0, 0 )
	BackgroundAlternate:SetBottom( _1080p * 0, 0 )
	BackgroundAlternate:SetRGBFromTable( SWATCHES.Scoreboard.background, 0 )
	BackgroundAlternate:setPriority( -1000 )
	f7_arg0:addElement( BackgroundAlternate )
	f7_arg0.BackgroundAlternate = BackgroundAlternate
	
end

function ScoreboardRow( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 858 * _1080p, 0, 32 * _1080p )
	self.id = "ScoreboardRow"
	local f14_local1 = controller and controller.controllerIndex
	if not f14_local1 and not Engine.InFrontend() then
		f14_local1 = self:getRootController()
	end
	assert( f14_local1 )
	local f14_local2 = self
	local Highlight = nil
	
	Highlight = LUI.UIImage.new()
	Highlight.id = "Highlight"
	Highlight:SetRGBFromTable( SWATCHES.genericMenu.frame, 0 )
	Highlight:SetAlpha( 0, 0 )
	self:addElement( Highlight )
	self.Highlight = Highlight
	
	local Speaker = nil
	
	Speaker = LUI.UIImage.new()
	Speaker.id = "Speaker"
	Speaker:SetAlpha( 0, 0 )
	Speaker:SetScale( -0.5, 0 )
	Speaker:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 36, _1080p * -7, _1080p * 39.25, _1080p * -39.25 )
	self:addElement( Speaker )
	self.Speaker = Speaker
	
	local f14_local5 = nil
	if not Engine.InFrontend() then
		f14_local5 = LUI.UIImage.new()
		f14_local5.id = "DeathIcon"
		f14_local5:SetAlpha( 0, 0 )
		f14_local5:SetScale( -0.2, 0 )
		f14_local5:setImage( RegisterMaterial( "killicondied" ), 0 )
		f14_local5:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 23.5, _1080p * 64.5, _1080p * -2, _1080p * 2 )
		self:addElement( f14_local5 )
		self.DeathIcon = f14_local5
	end
	local f14_local6 = nil
	if not Engine.InFrontend() then
		f14_local6 = LUI.UIImage.new()
		f14_local6.id = "PingIcon"
		f14_local6:SetAlpha( 0.75, 0 )
		f14_local6:SetUseAA( true )
		f14_local6:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -31, _1080p * -5, _1080p * 14, _1080p * -4 )
		self:addElement( f14_local6 )
		self.PingIcon = f14_local6
	end
	local RankIcon = nil
	
	RankIcon = LUI.UIImage.new()
	RankIcon.id = "RankIcon"
	RankIcon:SetAlpha( 0.75, 0 )
	RankIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 31, _1080p * 57, _1080p * 3, _1080p * 29 )
	self:addElement( RankIcon )
	self.RankIcon = RankIcon
	
	PostLoadFunc( self, f14_local1, controller )
	return self
end

MenuBuilder.registerType( "ScoreboardRow", ScoreboardRow )
LockTable( _M )
