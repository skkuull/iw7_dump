local f0_local0 = function ( f1_arg0, f1_arg1 )
	return Engine.Localize( Engine.TableLookup( CSV.perks.file, CSV.perks.cols.index, f1_arg0, CSV.perks.cols.name ) )
end

local f0_local1 = function ( f2_arg0, f2_arg1 )
	return Engine.TableLookup( CSV.perks.file, CSV.perks.cols.index, f2_arg0, CSV.perks.cols.image )
end

local f0_local2 = function ()
	DataSources.inGame.MP.scoreEvents = LUI.FeedDataSource.new( LUI.DataSourceInControllerModel.new( "cg.MP.scoreEvents" ), 4, {
		scoreEvent = {
			text = ""
		}
	} )
	DataSources.inGame.MP.scoreEvents.text = LUI.DataSourceInControllerModel.new( "cg.MP.scoreEvents.push.scoreEvent.text" )
	DataSources.inGame.MP.scoreEvents.push = LUI.DataSourceInControllerModel.new( "cg.MP.scoreEvents.push" )
end

local f0_local3 = function ()
	local f4_local0 = function ( f5_arg0, f5_arg1 )
		if DataSources.inGame.HUD.searchDestroyBombCarrying:GetValue( f5_arg1 ) then
			return 1
		else
			return 0
		end
	end
	
	local f4_local1 = function ( f6_arg0, f6_arg1 )
		if DataSources.inGame.HUD.searchDestroyTimerEnd:GetValue( f6_arg1 ) ~= 0 then
			return true
		else
			return false
		end
	end
	
	local f4_local2 = function ( f7_arg0, f7_arg1 )
		return Game.GetPlayerGamertag( f7_arg0 )
	end
	
	local f4_local3 = {
		Home = -1,
		Away = -2,
		Reset = -3
	}
	local f4_local4 = function ( f8_arg0, f8_arg1 )
		local f8_local0 = nil
		if f8_arg0 == f4_local3.Home then
			f8_local0 = Engine.Localize( "OBJECTIVES_FLAG_HOME" )
		elseif f8_arg0 == f4_local3.Away then
			f8_local0 = Engine.Localize( "OBJECTIVES_FLAG_AWAY" )
		elseif f8_arg0 == f4_local3.Reset then
			f8_local0 = Engine.Localize( "OBJECTIVES_BALL_RESET" )
		elseif f8_arg0 >= 0 then
			f8_local0 = Game.GetPlayerGamertag( f8_arg0 )
		end
		return f8_local0
	end
	
	local f4_local5 = function ( f9_arg0, f9_arg1 )
		local f9_local0 = Game.GetGameType()
		if f9_arg0 >= 0 then
			local f9_local1 = Game.GetPlayerTeam( Game.GetPlayerClientnum( f9_arg1 ) )
			local f9_local2 = Game.GetPlayerTeam( f9_arg0 )
			if CODCASTER.IsCODCaster() then
				local f9_local3 = CODCASTER.GetTeamColor
				local f9_local4 = f9_arg1
				local f9_local5
				if f9_local2 == 1 then
					f9_local5 = 2
					if not f9_local5 then
					
					else
						return f9_local3( f9_local4, f9_local5 )
					end
				end
				f9_local5 = 1
			elseif f9_local1 == f9_local2 then
				return GetIntForColor( SWATCHES.HUD.friendlyTeam )
			else
				return GetIntForColor( SWATCHES.HUD.enemyTeam )
			end
		elseif f9_local0 == "tdef" and Game.GetOmnvar( "ui_uplink_timer_text" ) == 2 then
			return GetIntForColor( SWATCHES.HUD.contested )
		else
			return GetIntForColor( SWATCHES.HUD.normal )
		end
	end
	
	local f4_local6 = {
		Neutral = -1,
		Contested = -2
	}
	local f4_local7 = function ( f10_arg0, f10_arg1 )
		if f10_arg0 == f4_local6.Neutral then
			return GetIntForColor( SWATCHES.HUD.normal )
		elseif f10_arg0 == f4_local6.Contested then
			return GetIntForColor( SWATCHES.HUD.contested )
		elseif f10_arg0 >= 0 then
			local f10_local0 = Game.GetPlayerTeam( Game.GetPlayerClientnum( f10_arg1 ) )
			local f10_local1 = Game.GetPlayerTeam( f10_arg0 )
			if CODCASTER.IsCODCaster() then
				local f10_local2 = CODCASTER.GetTeamColor
				local f10_local3 = f10_arg1
				local f10_local4
				if f10_local1 == 1 then
					f10_local4 = 2
					if not f10_local4 then
					
					else
						return f10_local2( f10_local3, f10_local4 )
					end
				end
				f10_local4 = 1
			elseif f10_local0 == f10_local1 then
				return GetIntForColor( SWATCHES.HUD.friendlyTeam )
			end
			return GetIntForColor( SWATCHES.HUD.enemyTeam )
		end
		return GetIntForColor( SWATCHES.HUD.normal )
	end
	
	local f4_local8 = function ( f11_arg0 )
		local f11_local0 = Game.GetPlayerClientnum()
		if f11_arg0 >= 0 then
			local f11_local1
			if f11_local0 == f11_arg0 then
				f11_local1 = true
			else
				f11_local1 = false
			end
			return f11_local1
		else
			return false
		end
	end
	
	local f4_local9 = function ( f12_arg0 )
		local f12_local0 = DataSources.inGame.MP.match.spectatingTeam:GetValue( f12_arg0 )
		if CODCASTER.IsCODCaster() then
			return DataSources.inGame.HUD.axisAlive:GetValue( f12_arg0 )
		elseif f12_local0 == Teams.axis then
			return DataSources.inGame.HUD.alliesAlive:GetValue( f12_arg0 )
		else
			return DataSources.inGame.HUD.axisAlive:GetValue( f12_arg0 )
		end
	end
	
	local f4_local10 = function ( f13_arg0 )
		local f13_local0 = DataSources.inGame.MP.match.spectatingTeam:GetValue( f13_arg0 )
		if CODCASTER.IsCODCaster() then
			return DataSources.inGame.HUD.alliesAlive:GetValue( f13_arg0 )
		elseif f13_local0 == Teams.axis then
			return DataSources.inGame.HUD.axisAlive:GetValue( f13_arg0 )
		else
			return DataSources.inGame.HUD.alliesAlive:GetValue( f13_arg0 )
		end
	end
	
	local f4_local11 = {
		Empty = 0,
		CarryTimer = 1,
		ResetTimer = 2
	}
	local f4_local12 = function ( f14_arg0 )
		local f14_local0 = GameX.GetGameMode()
		local f14_local1 = nil
		local f14_local2 = 0
		local f14_local3 = nil
		local f14_local4 = f14_arg0
		if f14_local0 == "tdef" then
			if MatchRules.IsUsingMatchRulesData() then
				f14_local1 = MatchRules.GetData( "commonOption", "scoreLimit" )
			else
				f14_local1 = Engine.GetDvarInt( "scr_" .. f14_local0 .. "_scorelimit" )
			end
			if f14_local1 > 0 then
				f14_local2 = f14_local4 / f14_local1 * 100
			end
			f14_local3 = Engine.Localize( "MP_TDEF_DRONE_DATA_PROG", string.format( "%.01f", f14_local2 ) )
		else
			f14_local3 = Engine.Localize( "MP_DRONE_RESET_TIMER" )
		end
		return f14_local3
	end
	
	local f4_local13 = function ( f15_arg0, f15_arg1 )
		local f15_local0 = nil
		if f15_arg0 == f4_local11.Empty then
			f15_local0 = Engine.Localize( "" )
		elseif f15_arg0 == f4_local11.CarryTimer then
			f15_local0 = Engine.Localize( "MP_DRONE_RESET_TIMER" )
		elseif f15_arg0 == f4_local11.ResetTimer then
			f15_local0 = Engine.Localize( "MP_DRONE_RESETTING" )
		end
		return f15_local0
	end
	
	local f4_local14 = function ( f16_arg0 )
		local f16_local0 = Game.GetPlayerTeam( Game.GetPlayerClientnum( f16_arg0 ) )
		local f16_local1 = Game.GetOmnvar( "ui_bomb_owner_team" )
		if CODCASTER.IsCODCaster() then
			local f16_local2 = CODCASTER.GetTeamColor
			local f16_local3 = f16_arg0
			local f16_local4
			if f16_local1 == 1 then
				f16_local4 = 2
				if not f16_local4 then
				
				else
					return f16_local2( f16_local3, f16_local4 )
				end
			end
			f16_local4 = 1
		elseif f16_local0 == f16_local1 then
			return GetIntForColor( SWATCHES.HUD.friendlyTeam )
		else
			return GetIntForColor( SWATCHES.HUD.enemyTeam )
		end
	end
	
	local f4_local15 = {
		Home = -2,
		Away = -1
	}
	local f4_local16 = function ( f17_arg0, f17_arg1 )
		local f17_local0 = nil
		if f17_arg0 == f4_local15.Home then
			f17_local0 = Engine.Localize( "OBJECTIVES_FLAG_HOME" )
		elseif f17_arg0 == f4_local15.Away then
			f17_local0 = Engine.Localize( "OBJECTIVES_FLAG_AWAY" )
		elseif f17_arg0 >= 0 then
			f17_local0 = Game.GetPlayerGamertag( f17_arg0 )
		end
		return f17_local0
	end
	
	local f4_local17 = function ( f18_arg0 )
		if Game.GetPlayerTeam( Game.GetPlayerClientnum( f18_arg0 ) ) == Teams.axis then
			return DataSources.inGame.HUD.ctfAlliesFlagStatus:GetValue( f18_arg0 )
		else
			return DataSources.inGame.HUD.ctfAxisFlagStatus:GetValue( f18_arg0 )
		end
	end
	
	local f4_local18 = function ( f19_arg0 )
		if Game.GetPlayerTeam( Game.GetPlayerClientnum( f19_arg0 ) ) == Teams.axis then
			return DataSources.inGame.HUD.ctfAlliesFlagStatus:GetValue( f19_arg0 )
		else
			return DataSources.inGame.HUD.ctfAxisFlagStatus:GetValue( f19_arg0 )
		end
	end
	
	DataSources.inGame.HUD.searchDestroyTimerEnd = LUI.DataSourceFromOmnvar.new( "ui_bomb_timer_endtime" )
	DataSources.inGame.HUD.searchDestroyTimerActive = DataSources.inGame.HUD.searchDestroyTimerEnd:Filter( "timer", f4_local1 )
	DataSources.inGame.HUD.searchDestroyBombCarrying = LUI.DataSourceFromOmnvar.new( "ui_carrying_bomb" )
	DataSources.inGame.HUD.objectiveProgress = LUI.DataSourceFromOmnvar.new( "ui_objective_progress" )
	DataSources.inGame.HUD.bombCarrier = LUI.DataSourceFromOmnvar.new( "ui_bomb_carrier" )
	DataSources.inGame.HUD.bombDefuser = LUI.DataSourceFromOmnvar.new( "ui_bomb_defuser" )
	DataSources.inGame.HUD.objectiveState = LUI.DataSourceFromOmnvar.new( "ui_objective_state" )
	DataSources.inGame.HUD.secureProgress = LUI.DataSourceFromOmnvar.new( "ui_securing_progress" )
	DataSources.inGame.HUD.secureState = LUI.DataSourceFromOmnvar.new( "ui_securing" )
	DataSources.inGame.HUD.uplinkBallCarrier = LUI.DataSourceFromOmnvar.new( "ui_uplink_ball_carrier" )
	DataSources.inGame.HUD.uplinkBallStatus = DataSources.inGame.HUD.uplinkBallCarrier:Filter( "uplinkBallStatus", f4_local4 )
	DataSources.inGame.HUD.uplinkBallStatusColor = DataSources.inGame.HUD.uplinkBallCarrier:FilterTo( DataSources.inGame.HUD.base, "uplinkBallStatusColor", f4_local5 )
	DataSources.inGame.HUD.uplinkBallCarrierGamertag = DataSources.inGame.HUD.uplinkBallCarrier:Filter( "uplinkBallCarrierGamertag", f4_local2 )
	DataSources.inGame.HUD.uplinkHUDEnabled = LUI.DataSourceFromOmnvar.new( "ui_uplink_carrier_hud" )
	DataSources.inGame.HUD.uplinkCarrierArmor = LUI.DataSourceFromOmnvar.new( "ui_uplink_carrier_armor" )
	DataSources.inGame.HUD.uplinkCarrierArmorMax = LUI.DataSourceFromOmnvar.new( "ui_uplink_carrier_armor_max" )
	DataSources.inGame.HUD.uplinkTimer = LUI.DataSourceFromOmnvar.new( "ui_hardpoint_timer" )
	DataSources.inGame.HUD.uplinkTimerHUD = LUI.DataSourceFromOmnvar.new( "ui_uplink_timer_hud" )
	DataSources.inGame.HUD.uplinkTimerShow = LUI.DataSourceFromOmnvar.new( "ui_uplink_timer_show" )
	DataSources.inGame.HUD.uplinkTimerText = LUI.DataSourceFromOmnvar.new( "ui_uplink_timer_text" )
	DataSources.inGame.HUD.uplinkTimerTextStatus = DataSources.inGame.HUD.uplinkTimerText:Filter( "uplinkTimerTextStatus", f4_local13 )
	DataSources.inGame.HUD.uplinkCarrierTimer = LUI.DataSourceFromOmnvar.new( "ui_hardpoint_timer" )
	DataSources.inGame.HUD.uplinkTimerStopped = LUI.DataSourceFromOmnvar.new( "ui_uplink_timer_stopped" )
	DataSources.inGame.HUD.tDefCurrentScore = DataSources.inGame.MP.match.teamScoreFriendly:Filter( "tDefCurrentScore", f4_local12 )
	DataSources.inGame.MP.hardpointTimer = LUI.DataSourceFromOmnvar.new( "ui_hardpoint_timer" )
	DataSources.inGame.MP.hardpointAreaStatus = LUI.DataSourceFromOmnvar.new( "ui_hardpoint" )
	DataSources.inGame.MP.hardpointStatusColor = DataSources.inGame.MP.hardpointAreaStatus:FilterTo( DataSources.inGame.HUD.base, "hardpointStatusColor", f4_local7 )
	DataSources.inGame.MP.atHardpoint = DataSources.inGame.MP.hardpointAreaStatus:Filter( "atHardpoint", f4_local8 )
	DataSources.inGame.HUD.grindTagsCarried = LUI.DataSourceFromOmnvar.new( "ui_grind_tags" )
	DataSources.inGame.HUD.axisAlive = LUI.DataSourceFromOmnvar.new( "ui_axis_alive" )
	DataSources.inGame.HUD.alliesAlive = LUI.DataSourceFromOmnvar.new( "ui_allies_alive" )
	local f4_local19 = {
		DataSources.inGame.HUD.axisAlive,
		DataSources.inGame.HUD.alliesAlive,
		DataSources.inGame.MP.match.spectatingTeam
	}
	DataSources.inGame.HUD.enemyTeamAlive = LUI.AggregateDataSource.new( DataSources.inGame.HUD.base, f4_local19, "enemyTeamAlive", f4_local9 )
	DataSources.inGame.HUD.friendlyTeamAlive = LUI.AggregateDataSource.new( DataSources.inGame.HUD.base, f4_local19, "friendlyTeamAlive", f4_local10 )
	DataSources.inGame.HUD.bombPlantedA = LUI.DataSourceFromOmnvar.new( "ui_bomb_planted_a" )
	DataSources.inGame.HUD.bombPlantedB = LUI.DataSourceFromOmnvar.new( "ui_bomb_planted_b" )
	DataSources.inGame.HUD.bombModeTimerAEnd = LUI.DataSourceFromOmnvar.new( "ui_bomb_timer_endtime_a" )
	DataSources.inGame.HUD.bombModeTimerBEnd = LUI.DataSourceFromOmnvar.new( "ui_bomb_timer_endtime_b" )
	DataSources.inGame.HUD.bombModeTimerTeam = LUI.DataSourceFromOmnvar.new( "ui_bomb_owner_team" )
	DataSources.inGame.HUD.bombModeTimerStatusColor = LUI.AggregateDataSource.new( DataSources.inGame.HUD.base, {
		DataSources.inGame.MP.match.team,
		DataSources.inGame.HUD.bombModeTimerTeam
	}, "bombModeTimerStatusColor", f4_local14 )
	DataSources.inGame.HUD.ctfFlagIcon = LUI.DataSourceFromOmnvar.new( "ui_ctf_flag_carrier" )
	DataSources.inGame.HUD.ctfAlliesFlag = LUI.DataSourceFromOmnvar.new( "ui_ctf_flag_allies" )
	DataSources.inGame.HUD.ctfAxisFlag = LUI.DataSourceFromOmnvar.new( "ui_ctf_flag_axis" )
	DataSources.inGame.HUD.ctfAlliesFlagStatus = DataSources.inGame.HUD.ctfAlliesFlag:Filter( "ctfAlliesFlagStatus", f4_local16 )
	DataSources.inGame.HUD.ctfAxisFlagStatus = DataSources.inGame.HUD.ctfAxisFlag:Filter( "ctfAxisFlagStatus", f4_local16 )
	local f4_local20 = {
		DataSources.inGame.HUD.ctfAlliesFlagStatus,
		DataSources.inGame.HUD.ctfAxisFlagStatus
	}
	DataSources.inGame.HUD.ctfFriendlyFlagStatus = LUI.AggregateDataSource.new( DataSources.inGame.HUD.base, f4_local20, "ctfFriendlyFlagStatus", f4_local18 )
	DataSources.inGame.HUD.ctfEnemyFlagStatus = LUI.AggregateDataSource.new( DataSources.inGame.HUD.base, f4_local20, "ctfEnemyFlagStatus", f4_local17 )
	DataSources.inGame.HUD.crankedTimer = LUI.DataSourceFromOmnvar.new( "ui_cranked_bomb_timer_end_milliseconds" )
	DataSources.inGame.HUD.crankedTimerFinalSeconds = LUI.DataSourceFromOmnvar.new( "ui_cranked_bomb_timer_final_seconds" )
	DataSources.inGame.HUD.crankedTimerStopped = LUI.DataSourceFromOmnvar.new( "ui_cranked_timer_stopped" )
	DataSources.inGame.HUD.gestureReticle = LUI.DataSourceFromOmnvar.new( "ui_gesture_reticle" )
end

local f0_local4 = function ()
	local f20_local0 = function ( f21_arg0 )
		local f21_local0 = Game.GetTime() - DataSources.inGame.MP.match.timeOfLastServerError:GetValue( f21_arg0 )
		if f21_local0 > 2000 or f21_local0 < 0 then
			DataSources.inGame.MP.match.errorMessage:SetValue( f21_arg0, "" )
			local f21_local1 = DataSources.inGame.HUD.hints.tutorialMessageText:GetValue( f21_arg0 )
			local f21_local2 = DataSources.inGame.HUD.hints.invalidCmdHintShow:GetValue( f21_arg0 )
			if not f21_local2 then
				f21_local2 = DataSources.inGame.HUD.hints.messageShow:GetValue( f21_arg0 )
			end
			if f21_local2 then
				if f21_local1 == nil or f21_local1 == "" then
					return DataSources.inGame.MP.match.errorMessage:GetValue( f21_arg0 )
				else
					return f21_local1
				end
			else
				return ""
			end
		else
			local f21_local1 = DataSources.inGame.MP.match.errorMessageId:GetValue( f21_arg0 )
			if f21_local1 <= 0 then
				return ""
			else
				local f21_local2 = Engine.TableLookupByRow( CSV.mpErrorMessages.file, f21_local1, CSV.mpErrorMessages.cols.stringRef )
				if not f21_local2 or f21_local2 == "" then
					return ""
				else
					local f21_local3 = DataSources.inGame.MP.match.errorMessageParam:GetValue( f21_arg0 )
					if f21_local3 and f21_local3 >= 0 then
						return Engine.Localize( f21_local2, f21_local3 )
					else
						return Engine.Localize( f21_local2 )
					end
				end
			end
		end
	end
	
	local f20_local1 = function ( f22_arg0, f22_arg1 )
		return Game.GetTime()
	end
	
	local f20_local2 = function ( f23_arg0, f23_arg1 )
		local f23_local0 = TeamLogos.allies
		if f23_arg0 == Teams.axis then
			f23_local0 = TeamLogos.axis
		end
		return f23_local0
	end
	
	local f20_local3 = function ( f24_arg0, f24_arg1 )
		local f24_local0 = TeamLogos.axis
		if f24_arg0 == Teams.axis then
			f24_local0 = TeamLogos.allies
		end
		return f24_local0
	end
	
	local f20_local4 = function ()
		return Engine.TableLookup( GameTypesTable.File, GameTypesTable.Cols.Ref, GameX.GetGameMode(), GameTypesTable.Cols.Image )
	end
	
	local f20_local5 = function ( f26_arg0, f26_arg1 )
		return Engine.Localize( Engine.TableLookup( CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, f26_arg0, CSV.gameTypesTable.cols.name ) )
	end
	
	local f20_local6 = function ()
		local f27_local0 = GameX.GetGameMode()
		local f27_local1 = Engine.TableLookup( GameTypesTable.File, GameTypesTable.Cols.Ref, f27_local0, GameTypesTable.Cols.Name )
		local f27_local2, f27_local3, f27_local4 = nil
		if MatchRules.IsUsingMatchRulesData() then
			f27_local4 = MatchRules.GetData( "commonOption", "scoreLimit" )
		else
			f27_local3 = Engine.GetDvarInt( "scr_" .. f27_local0 .. "_winlimit" )
			if f27_local3 <= 1 then
				f27_local4 = Engine.GetDvarInt( "scr_" .. f27_local0 .. "_scorelimit" )
			else
				f27_local4 = f27_local3
			end
		end
		if f27_local4 == 0 then
			f27_local2 = Engine.Localize( "@OBJECTIVES_" .. f27_local0 .. "" )
		else
			f27_local2 = Engine.Localize( "@OBJECTIVES_" .. f27_local0 .. "_SCORE", f27_local4 )
		end
		return f27_local2
	end
	
	DataSources.inGame.MP.match.base = LUI.DataSourceInControllerModel.new( "cg.match" )
	DataSources.inGame.MP.match.teamScoreFriendlyWinRatio = LUI.DataSourceInControllerModel.new( "cg.match.teamScoreFriendlyWinRatio" )
	DataSources.inGame.MP.match.teamScoreEnemyWinRatio = LUI.DataSourceInControllerModel.new( "cg.match.teamScoreEnemyWinRatio" )
	DataSources.inGame.MP.match.teamScoreFriendly = LUI.DataSourceInControllerModel.new( "cg.match.teamScoreFriendly" )
	DataSources.inGame.MP.match.teamScoreEnemy = LUI.DataSourceInControllerModel.new( "cg.match.teamScoreEnemy" )
	DataSources.inGame.MP.match.team = LUI.DataSourceInControllerModel.new( "cg.match.team" )
	DataSources.inGame.MP.match.spectatingTeam = LUI.DataSourceInControllerModel.new( "cg.match.spectatingTeam" )
	DataSources.inGame.MP.match.teamIcon = DataSources.inGame.MP.match.spectatingTeam:Filter( "teamIcon", f20_local2 )
	DataSources.inGame.MP.match.enemyIcon = DataSources.inGame.MP.match.spectatingTeam:Filter( "enemyIcon", f20_local3 )
	DataSources.inGame.MP.match.gameType = LUI.DataSourceInGlobalModel.new( "cg.match.gameType" )
	DataSources.inGame.MP.match.gameMode = DataSources.inGame.MP.match.gameType:Filter( "name", f20_local5 )
	DataSources.inGame.MP.match.gameModeDescription = LUI.DataSourceInGlobalModel.new( "cg.match.gameModeDescription", f20_local6() )
	DataSources.inGame.MP.match.gameModeIcon = LUI.DataSourceInGlobalModel.new( "cg.match.gameModeIcon", f20_local4() )
	DataSources.inGame.MP.match.endTime = LUI.DataSourceInGlobalModel.new( "cg.match.endTime" )
	DataSources.inGame.MP.match.countdownTime = LUI.DataSourceFromOmnvar.new( "ui_match_start_countdown" )
	DataSources.inGame.MP.match.errorTrigger = LUI.DataSourceFromOmnvar.new( "ui_mp_error_trigger" )
	DataSources.inGame.MP.match.errorMessageId = LUI.DataSourceFromOmnvar.new( "ui_mp_error_message_id" )
	DataSources.inGame.MP.match.errorMessageParam = LUI.DataSourceFromOmnvar.new( "ui_mp_error_message_param" )
	DataSources.inGame.MP.match.timeOfLastServerError = DataSources.inGame.MP.match.errorTrigger:Filter( "timeOfLastServerError", f20_local1 )
	DataSources.inGame.MP.match.errorMessage = LUI.AggregateDataSource.new( DataSources.inGame.MP.match.base, {
		DataSources.inGame.HUD.hints.tutorialMessageText,
		DataSources.inGame.MP.match.timeOfLastServerError,
		DataSources.inGame.MP.match.errorMessageId
	}, "errorMessage", f20_local0 )
	DataSources.inGame.MP.match.matchTimerHidden = LUI.DataSourceFromOmnvar.new( "ui_match_timer_hidden" )
	DataSources.inGame.MP.match.matchTimerStopped = LUI.DataSourceFromOmnvar.new( "ui_match_timer_stopped" )
	DataSources.inGame.MP.match.currentRound = LUI.DataSourceFromOmnvar.new( "ui_current_round" )
	DataSources.inGame.MP.match.matchRoundHidden = DataSources.inGame.MP.match.currentRound:Filter( "matchRoundHidden", function ( f28_arg0, f28_arg1 )
		return DataSources.inGame.MP.match.currentRound:GetValue( f28_arg1 ) <= 0
	end )
	DataSources.inGame.MP.match.matchOver = LUI.DataSourceFromOmnvar.new( "ui_match_over" )
end

local f0_local5 = function ()
	local f29_local0 = function ( f30_arg0 )
		local f30_local0 = DataSources.inGame.MP.roundEnd.timeToBeatFriendly:GetValue( f30_arg0 )
		local f30_local1 = DataSources.inGame.MP.roundEnd.timeToBeatEnemy:GetValue( f30_arg0 )
		local f30_local2
		if not f30_local0 or f30_local0 <= 0 then
			local f30_local3 = f30_local1
			if f30_local1 <= 0 then
				f30_local2 = false
			end
		end
		f30_local2 = f30_local3 and true
	end
	
	local f29_local1 = function ( f31_arg0 )
		if f31_arg0 == nil or f31_arg0 <= 0 then
			return Engine.Localize( "LUA_MENU_MP_TIME_TO_BEAT_EMPTY" )
		end
		local f31_local0 = math.floor( f31_arg0 / 60 )
		local f31_local1 = math.floor( f31_arg0 - f31_local0 * 60 )
		local f31_local2 = tostring( f31_local1 )
		if f31_local1 < 10 then
			f31_local2 = "0" .. f31_local2
		end
		return Engine.Localize( "LUA_MENU_MP_TIME_TO_BEAT_FORMAT", f31_local0, f31_local2 )
	end
	
	DataSources.inGame.MP.roundEnd.base = LUI.DataSourceInGlobalModel.new( "cg.roundEnd" )
	DataSources.inGame.MP.roundEnd.roundEndTitleIndex = LUI.DataSourceFromOmnvar.new( "ui_round_end_title" )
	DataSources.inGame.MP.roundEnd.roundEndTitle = DataSources.inGame.MP.roundEnd.roundEndTitleIndex:Filter( "roundEndName", MP.RoundEndTitleFilterFunction )
	DataSources.inGame.MP.roundEnd.roundEndReasonIndex = LUI.DataSourceFromOmnvar.new( "ui_round_end_reason" )
	DataSources.inGame.MP.roundEnd.roundEndReason = DataSources.inGame.MP.roundEnd.roundEndReasonIndex:Filter( "reason", MP.RoundEndReasonFilterFunction )
	DataSources.inGame.MP.roundEnd.roundEndFriendlyScore = LUI.DataSourceFromOmnvar.new( "ui_round_end_friendly_score" )
	DataSources.inGame.MP.roundEnd.roundEndEnemyScore = LUI.DataSourceFromOmnvar.new( "ui_round_end_enemy_score" )
	DataSources.inGame.MP.roundEnd.roundEndMatchBonus = LUI.DataSourceFromOmnvar.new( "ui_round_end_match_bonus" )
	DataSources.inGame.MP.roundEnd.roundEndFFAFirstPlaceName = DataSources.inGame.MP.roundEnd.roundEndTitleIndex:Filter( "firstPlaceName", MP.RoundEndFFAFirstPlayerScoreFunction )
	DataSources.inGame.MP.roundEnd.roundEndFFASecondPlaceName = DataSources.inGame.MP.roundEnd.roundEndTitleIndex:Filter( "secondPlaceName", MP.RoundEndFFASecondPlayerScoreFunction )
	DataSources.inGame.MP.roundEnd.roundEndFFAThirdPlaceName = DataSources.inGame.MP.roundEnd.roundEndTitleIndex:Filter( "thirdPlaceName", MP.RoundEndFFAThirdPlayerScoreFunction )
	DataSources.inGame.MP.roundEnd.timeToBeatFriendly = LUI.DataSourceFromOmnvar.new( "ui_friendly_time_to_beat" )
	DataSources.inGame.MP.roundEnd.timeToBeatFriendlyString = DataSources.inGame.MP.roundEnd.timeToBeatFriendly:Filter( "timeToBeatFriendlyString", f29_local1 )
	DataSources.inGame.MP.roundEnd.timeToBeatEnemy = LUI.DataSourceFromOmnvar.new( "ui_enemy_time_to_beat" )
	DataSources.inGame.MP.roundEnd.timeToBeatEnemyString = DataSources.inGame.MP.roundEnd.timeToBeatEnemy:Filter( "timeToBeatEnemyString", f29_local1 )
	DataSources.inGame.MP.roundEnd.showTimeToBeat = LUI.AggregateDataSource.new( DataSources.inGame.MP.roundEnd.base, {
		DataSources.inGame.MP.roundEnd.timeToBeatFriendly,
		DataSources.inGame.MP.roundEnd.timeToBeatEnemy
	}, "showTimeToBeat", f29_local0 )
end

local f0_local6 = function ()
	local f32_local0 = {
		{
			score = "ui_score_streak",
			cost = "ui_score_streak_cost"
		},
		{
			score = "ui_score_streak_two",
			cost = "ui_score_streak_two_cost"
		},
		{
			score = "ui_score_streak_three",
			cost = "ui_score_streak_three_cost"
		}
	}
	local f32_local1 = function ( f33_arg0, f33_arg1 )
		if f33_arg0 then
			return Engine.TableLookup( CSV.streaks.file, CSV.streaks.cols.index, f33_arg0, CSV.streaks.cols.name )
		else
			
		end
	end
	
	local f32_local2 = function ( f34_arg0, f34_arg1 )
		if f34_arg0 then
			return Engine.TableLookup( CSV.streaks.file, CSV.streaks.cols.index, f34_arg0, CSV.streaks.cols.dPadIcon )
		else
			
		end
	end
	
	local f32_local3 = function ( f35_arg0, f35_arg1 )
		if f35_arg0 then
			return Engine.TableLookup( CSV.streaks.file, CSV.streaks.cols.index, f35_arg0, CSV.streaks.cols.fullImage )
		else
			
		end
	end
	
	local f32_local4 = function ( f36_arg0 )
		return function ( f37_arg0, f37_arg1 )
			local f37_local0 = DataSources.inGame.player.streaks:GetCountValue( f37_arg1 )
			local f37_local1 = f37_local0 - f36_arg0
			local f37_local2 = 0
			local f37_local3 = 0
			if f37_local0 > 0 then
				local f37_local4 = DataSources.inGame.player.streaks:GetDataSourceAtIndex( f37_local1, f37_arg1 )
				f37_local2 = f37_local4.cost:GetValue( f37_arg1 )
				if f37_local1 + 1 < f37_local0 then
					f37_local4 = DataSources.inGame.player.streaks:GetDataSourceAtIndex( f37_local1 + 1, f37_arg1 )
					local f37_local5 = f37_local4.cost:GetValue( f37_arg1 )
				end
				f37_local3 = f37_local5 or 0
			end
			local f37_local4 = 0
			if f37_local2 ~= f37_local3 then
				f37_local4 = LUI.clamp( (f37_arg0 - f37_local3) / (f37_local2 - f37_local3), 0, 1 )
			else
				DebugPrint( "Unexpected killstreak setup. Killstreak progress UI might not look accurate." )
			end
			return f37_local4
		end
		
	end
	
	local f32_local5 = function ( f38_arg0, f38_arg1 )
		return function ( f39_arg0 )
			local f39_local0 = f38_arg1:GetValue( f39_arg0 )
			local f39_local1 = DataSources.inGame.player.streaks:GetCountValue( f39_arg0 )
			local f39_local2 = f39_local1 - f38_arg0
			local f39_local3 = 0
			local f39_local4 = 0
			if f39_local1 > 0 then
				local f39_local5 = DataSources.inGame.player.streaks:GetDataSourceAtIndex( f39_local2, f39_arg0 )
				f39_local3 = f39_local5.cost:GetValue( f39_arg0 )
				if f39_local2 + 1 < f39_local1 then
					f39_local5 = DataSources.inGame.player.streaks:GetDataSourceAtIndex( f39_local2 + 1, f39_arg0 )
					local f39_local6 = f39_local5.cost:GetValue( f39_arg0 )
				end
				f39_local4 = f39_local6 or 0
			end
			local f39_local5 = 0
			if f39_local4 <= f39_local0 and f39_local0 < f39_local3 then
				f39_local5 = f39_local3 - f39_local0
			end
			return f39_local5
		end
		
	end
	
	local f32_local6 = function ( f40_arg0 )
		local f40_local0 = 0
		if DataSources.inGame.player.streakIndex1DataSource:GetValue( f40_arg0 ) ~= 0 then
			f40_local0 = f40_local0 + 1
		end
		if DataSources.inGame.player.streakIndex2DataSource:GetValue( f40_arg0 ) ~= 0 then
			f40_local0 = f40_local0 + 1
		end
		if DataSources.inGame.player.streakIndex3DataSource:GetValue( f40_arg0 ) ~= 0 then
			f40_local0 = f40_local0 + 1
		end
		return f40_local0
	end
	
	local f32_local7 = function ( f41_arg0 )
		return function ( f42_arg0, f42_arg1 )
			return f42_arg0 == f41_arg0
		end
		
	end
	
	DataSources.inGame.player.streaksBase = LUI.DataSourceInControllerModel.new( "cg.player.streaks" )
	DataSources.inGame.player.streakIndex1DataSource = LUI.DataSourceFromOmnvar.new( "ui_score_streak_index_1" )
	DataSources.inGame.player.streakIndex2DataSource = LUI.DataSourceFromOmnvar.new( "ui_score_streak_index_2" )
	DataSources.inGame.player.streakIndex3DataSource = LUI.DataSourceFromOmnvar.new( "ui_score_streak_index_3" )
	DataSources.inGame.player.streakCount = LUI.AggregateDataSource.new( DataSources.inGame.player.streaksBase, {
		DataSources.inGame.player.streakIndex1DataSource,
		DataSources.inGame.player.streakIndex2DataSource,
		DataSources.inGame.player.streakIndex3DataSource
	}, "count", f32_local6 )
	local f32_local8 = LUI.DataSourceFromOmnvar.new( "ui_score_streak_selected_slot" )
	DataSources.inGame.player.streaks = LUI.DataSourceFromList.new( DataSources.inGame.player.streakCount )
	DataSources.inGame.player.streaks.MakeDataSourceAtIndex = function ( f43_arg0, f43_arg1, f43_arg2 )
		f43_arg1 = 1 + f43_arg0:GetCountValue( f43_arg2 ) - f43_arg1 + 1
		local f43_local0 = f32_local0[f43_arg1].score
		local f43_local1 = f32_local0[f43_arg1].cost
		local f43_local2 = LUI.DataSourceFromOmnvar.new( f43_local0 )
		local f43_local3 = LUI.DataSourceFromOmnvar.new( "ui_score_streak_index_" .. f43_arg1 )
		local f43_local4 = f43_local3:Filter( "name", f32_local1 )
		local f43_local5 = f43_local3:Filter( "icon", f32_local2 )
		local f43_local6 = f43_local2:Filter( "percent", f32_local4( f43_arg1 ) )
		local f43_local7 = LUI.DataSourceFromOmnvar.new( f43_local1 )
		return {
			index = f43_local3,
			isActive = LUI.DataSourceFromOmnvar.new( "ui_score_streak_available_" .. f43_arg1 ),
			isSlotSelected = f32_local8:Filter( "isSlotSelected_" .. f43_arg1, f32_local7( f43_arg1 ) ),
			name = f43_local4,
			icon = f43_local5,
			currentScore = f43_local2,
			cost = f43_local7,
			percent = f43_local6,
			remainingPoints = LUI.AggregateDataSource.new( f43_local2, {
				f43_local7,
				f43_local2
			}, "remainingPoints", f32_local5( f43_arg1, f43_local2 ) )
		}
	end
	
	DataSources.inGame.player.gimmeStreak.isSlotSelected = f32_local8:Filter( "isSlotSelected_0", f32_local7( 0 ) )
	DataSources.inGame.player.gimmeStreak.isActive = LUI.DataSourceFromOmnvar.new( "ui_score_streak_available_0" )
	DataSources.inGame.player.gimmeStreak.index = LUI.DataSourceFromOmnvar.new( "ui_score_streak_index_0" )
	DataSources.inGame.player.gimmeStreak.name = DataSources.inGame.player.gimmeStreak.index:Filter( "name", f32_local1 )
	DataSources.inGame.player.gimmeStreak.icon = DataSources.inGame.player.gimmeStreak.index:Filter( "icon", f32_local2 )
end

local f0_local7 = function ()
	local f44_local0 = {
		Available = 0,
		Fired = 1,
		Used = 2,
		Reloading = 3
	}
	local f44_local1 = function ( f45_arg0, f45_arg1, f45_arg2 )
		return function ( f46_arg0 )
			local f46_local0 = f45_arg0:GetValue( f46_arg0 )
			local f46_local1 = f45_arg1:GetValue( f46_arg0 )
			local f46_local2 = DataSources.inGame.MP.scorestreakHuds.thorMissilesLoaded:GetValue( f46_arg0 ) == f45_arg2
			local f46_local3 = DataSources.inGame.MP.scorestreakHuds.thorReloadPercent:GetValue( f46_arg0 )
			if f46_local0 >= 0 and f46_local0 ~= GameScriptConstants.EntityNumNone then
				return f44_local0.Fired
			elseif f46_local1 == -1 then
				return f44_local0.Available
			elseif f46_local2 and f46_local3 > 0 then
				return f44_local0.Reloading
			else
				return f44_local0.Used
			end
		end
		
	end
	
	local f44_local2 = function ( f47_arg0 )
		return function ( f48_arg0 )
			local f48_local0 = 0
			if DataSources.inGame.MP.scorestreakHuds.thorMissilesLoaded:GetValue( f48_arg0 ) == f47_arg0 then
				f48_local0 = DataSources.inGame.MP.scorestreakHuds.thorReloadPercent:GetValue( f48_arg0 )
			end
			return f48_local0
		end
		
	end
	
	local f44_local3 = function ( f49_arg0, f49_arg1 )
		return f49_arg0 ~= f44_local0.Available
	end
	
	local f44_local4 = function ( f50_arg0, f50_arg1 )
		return f50_arg0 == f44_local0.Available
	end
	
	local f44_local5 = "ks_remote_device_mp"
	local f44_local6 = {
		Off = 0,
		Intro = 1,
		Outro = 2
	}
	local f44_local7 = function ( f51_arg0 )
		local f51_local0
		if DataSources.inGame.player.currentWeapon.baseWeapon:GetValue( f51_arg0 ) ~= f44_local5 or DataSources.inGame.MP.scorestreakHuds.remoteControlSequence:GetValue( f51_arg0 ) ~= f44_local6.Intro then
			f51_local0 = false
		else
			f51_local0 = true
		end
		return f51_local0
	end
	
	local f44_local8 = function ( f52_arg0 )
		local f52_local0 = ""
		local f52_local1 = 0
		local f52_local2 = DataSources.inGame.MP.scorestreakHuds.bombardmentMapSelectUses:GetValue( f52_arg0 )
		local f52_local3 = DataSources.inGame.MP.scorestreakHuds.bombardmentMapSelectCount:GetValue( f52_arg0 )
		if f52_local2 >= 0 then
			f52_local0 = Engine.Localize( "MENU_N_OF_N", tostring( f52_local3 - f52_local2 ), tostring( f52_local3 ) )
		end
		return f52_local0
	end
	
	DataSources.inGame.MP.scorestreakHuds.countdown = LUI.DataSourceFromOmnvar.new( "ui_killstreak_countdown" )
	DataSources.inGame.MP.scorestreakHuds.countdownRC8 = LUI.DataSourceFromOmnvar.new( "ui_remote_c8_countdown" )
	DataSources.inGame.MP.scorestreakHuds.health = LUI.DataSourceFromOmnvar.new( "ui_killstreak_health" )
	DataSources.inGame.MP.scorestreakHuds.healthRC8 = LUI.DataSourceFromOmnvar.new( "ui_remote_c8_health" )
	DataSources.inGame.MP.scorestreakHuds.missileWarningVisible = LUI.DataSourceFromOmnvar.new( "ui_killstreak_missile_warn" )
	DataSources.inGame.MP.scorestreakHuds.connectionState = LUI.DataSourceFromOmnvar.new( "ui_killstreak_connection" )
	DataSources.inGame.MP.scorestreakHuds.connectionStateVisible = DataSources.inGame.MP.scorestreakHuds.connectionState:Filter( "visible", function ( f53_arg0 )
		return 0 < f53_arg0
	end )
	local f44_local9 = 5
	DataSources.inGame.MP.scorestreakHuds.thorMissilesCurrentState = LUI.DataSourceFromOmnvar.new( "ui_thor_show" )
	DataSources.inGame.MP.scorestreakHuds.thorMissilesVisible = DataSources.inGame.MP.scorestreakHuds.thorMissilesCurrentState:Filter( "visible", function ( f54_arg0 )
		local f54_local0
		if 0 < f54_arg0 then
			f54_local0 = 1
			if not f54_local0 then
			
			else
				return f54_local0
			end
		end
		f54_local0 = 0
	end )
	DataSources.inGame.MP.scorestreakHuds.thorMissilesLoaded = LUI.DataSourceFromOmnvar.new( "ui_thor_missiles_loaded" )
	DataSources.inGame.MP.scorestreakHuds.thorMissiles = LUI.DataSourceFromList.new( f44_local9 )
	DataSources.inGame.MP.scorestreakHuds.thorReloadPercent = LUI.DataSourceFromOmnvar.new( "ui_thor_missile_reload" )
	DataSources.inGame.MP.scorestreakHuds.thorMissiles.MakeDataSourceAtIndex = function ( f55_arg0, f55_arg1, f55_arg2 )
		local f55_local0 = Mirror( f55_arg1, 0, f44_local9 - 1 )
		local f55_local1 = LUI.DataSourceFromOmnvar.new( "ui_thor_missile_" .. f55_local0 )
		local f55_local2 = LUI.DataSourceFromOmnvar.new( "ui_thor_missile_" .. f55_local0 .. "_dist" )
		return {
			idValue = f55_local1,
			distance = f55_local2,
			state = LUI.AggregateDataSource.new( f55_local1, {
				f55_local1,
				DataSources.inGame.MP.scorestreakHuds.thorMissilesLoaded
			}, "stats", f44_local1( f55_local1, f55_local2, f55_local0 ) ),
			reloadPercent = LUI.AggregateDataSource.new( f55_local1, {
				DataSources.inGame.MP.scorestreakHuds.thorMissilesLoaded,
				DataSources.inGame.MP.scorestreakHuds.thorReloadPercent
			}, "reloadPercent", f44_local2( f55_local0 ) )
		}
	end
	
	DataSources.inGame.MP.scorestreakHuds.miniJackalVisible = LUI.DataSourceFromOmnvar.new( "ui_minijackal_controls" )
	DataSources.inGame.MP.scorestreakHuds.miniJackalReload = LUI.DataSourceFromOmnvar.new( "ui_minijackal_reload" )
	DataSources.inGame.MP.scorestreakHuds.miniJackalReloadLong = LUI.DataSourceFromOmnvar.new( "ui_minijackal_reload_long" )
	DataSources.inGame.MP.scorestreakHuds.miniJackalBoost = LUI.DataSourceInControllerModel.new( "cg.jackal.isThrusting" )
	DataSources.inGame.MP.scorestreakHuds.miniJackalRoll = LUI.DataSourceInControllerModel.new( "cg.jackal.roll" )
	DataSources.inGame.MP.scorestreakHuds.miniJackalConeTargetRadiusPx = LUI.DataSourceInControllerModel.new( "cg.jackal.coneTargetRadiusPx" )
	DataSources.inGame.MP.scorestreakHuds.miniJackalLockTarget = LUI.DataSourceInControllerModel.new( "cg.jackal.missileLockTarget" )
	DataSources.inGame.MP.scorestreakHuds.miniJackalLockTargetTag = LUI.DataSourceInControllerModel.new( "cg.jackal.missileLockTargetTag" )
	DataSources.inGame.MP.scorestreakHuds.venomVisible = LUI.DataSourceFromOmnvar.new( "ui_venom_controls" )
	DataSources.inGame.MP.scorestreakHuds.trinityVisible = LUI.DataSourceFromOmnvar.new( "ui_predator_missile" )
	DataSources.inGame.MP.scorestreakHuds.trinityMissileCount = LUI.DataSourceFromOmnvar.new( "ui_predator_missiles_left" )
	DataSources.inGame.MP.scorestreakHuds.rc8Visible = LUI.DataSourceFromOmnvar.new( "ui_rc8_controls" )
	DataSources.inGame.MP.scorestreakHuds.locationSelectionCountdown = LUI.DataSourceFromOmnvar.new( "ui_location_selection_countdown" )
	DataSources.inGame.MP.scorestreakHuds.bombardmentMapSelectUses = LUI.DataSourceFromOmnvar.new( "ui_map_select_uses" )
	DataSources.inGame.MP.scorestreakHuds.bombardmentMapSelectCount = LUI.DataSourceFromOmnvar.new( "ui_map_select_count" )
	DataSources.inGame.MP.scorestreakHuds.bombardmentMapSelectUsesText = LUI.AggregateDataSource.new( DataSources.inGame.MP.scorestreakHuds.locationSelectionCountdown, {
		DataSources.inGame.MP.scorestreakHuds.bombardmentMapSelectUses,
		DataSources.inGame.MP.scorestreakHuds.bombardmentMapSelectCount
	}, "bombardmentMapSelectUsesText", f44_local8 )
	DataSources.inGame.MP.scorestreakHuds.scorchersRotateTextHintAlpha = DataSources.inGame.MP.scorestreakHuds.bombardmentMapSelectUses:Filter( "scorchersRotateTextHintAlpha", function ( f56_arg0 )
		local f56_local0
		if f56_arg0 == -1 then
			f56_local0 = 1
			if not f56_local0 then
			
			else
				return f56_local0
			end
		end
		f56_local0 = 0
	end )
	DataSources.inGame.MP.scorestreakHuds.remoteControlSequence = LUI.DataSourceFromOmnvar.new( "ui_remote_control_sequence" )
	DataSources.inGame.MP.scorestreakHuds.remoteControlConnect = LUI.AggregateDataSource.new( DataSources.inGame.MP.scorestreakHuds.remoteControlSequence, {
		DataSources.inGame.player.currentWeapon.baseWeapon,
		DataSources.inGame.MP.scorestreakHuds.remoteControlSequence
	}, "connect", f44_local7 )
	DataSources.inGame.MP.scorestreakHuds.nukeCountdown = LUI.DataSourceFromOmnvar.new( "ui_nuke_end_milliseconds" )
	DataSources.inGame.MP.scorestreakHuds.showNukeCountdown = LUI.DataSourceFromOmnvar.new( "ui_nuke_countdown_active" )
end

local f0_local8 = function ()
	local f57_local0 = function ( f58_arg0 )
		local f58_local0 = 0
		for f58_local4, f58_local5 in pairs( DataSources.inGame.MP.deathDetails.attackerOmnvarList ) do
			if 0 <= f58_local5:GetValue( f58_arg0 ) then
				f58_local0 = f58_local0 + 1
			end
		end
		return f58_local0
	end
	
	local f57_local1 = function ( f59_arg0 )
		local f59_local0 = 0
		for f59_local4, f59_local5 in pairs( DataSources.inGame.MP.deathDetails.hitCountOmnvarList ) do
			if 0 <= DataSources.inGame.MP.deathDetails.attackerOmnvarList[f59_local4]:GetValue( f59_arg0 ) then
				f59_local0 = f59_local0 + f59_local5:GetValue( f59_arg0 )
			end
		end
		f59_local1 = 10
		if f59_local1 < f59_local0 then
			return Engine.Localize( "MP_INGAME_ONLY_DEATH_DETAILS_OVERFLOW", f59_local1 )
		else
			return tostring( f59_local0 )
		end
	end
	
	local f57_local2 = function ( f60_arg0 )
		return function ( f61_arg0, f61_arg1 )
			local f61_local0 = Engine.Localize( "LUA_MENU_MP_DEATH_DETAILS_ATTACKER_UNKNOWN" )
			if not f61_arg0 or f61_arg0 < 0 then
				DebugPrint( "ERROR: Invalid client num for attacker!" )
				return f61_local0
			else
				local f61_local1 = LUI.DataSourceInGlobalModel.new( "cg.player.gamerTag." .. f61_arg0 )
				if not f61_local1 then
					DebugPrint( "ERROR: Could not find gamertag data source for attacker!" )
					return f61_local0
				else
					local f61_local2 = f61_local1:GetValue()
					if not f61_local2 then
						DebugPrint( "ERROR: Nil value for gamertag data source for attacker!" )
						return f61_local0
					else
						return f61_local2
					end
				end
			end
		end
		
	end
	
	local f57_local3 = 4
	DataSources.inGame.MP.deathDetails.attackerOmnvarList = {}
	DataSources.inGame.MP.deathDetails.hitCountOmnvarList = {}
	for f57_local4 = 1, f57_local3, 1 do
		DataSources.inGame.MP.deathDetails.attackerOmnvarList[f57_local4] = LUI.DataSourceFromOmnvar.new( "ui_death_details_attacker_" .. f57_local4 - 1 )
		DataSources.inGame.MP.deathDetails.hitCountOmnvarList[f57_local4] = LUI.DataSourceFromOmnvar.new( "ui_death_details_hits_" .. f57_local4 - 1 )
	end
	DataSources.inGame.MP.deathDetails.attackerCount = LUI.AggregateDataSource.new( DataSources.inGame.MP.deathDetails.attackerOmnvarList[1], DataSources.inGame.MP.deathDetails.attackerOmnvarList, "attackerCount", f57_local0 )
	DataSources.inGame.MP.deathDetails.totalHitCount = LUI.AggregateDataSource.new( DataSources.inGame.MP.deathDetails.hitCountOmnvarList[1], DataSources.inGame.MP.deathDetails.hitCountOmnvarList, "hitCount", f57_local1 )
	DataSources.inGame.MP.deathDetails.infoLine = LUI.DataSourceFromList.new( DataSources.inGame.MP.deathDetails.attackerCount )
	DataSources.inGame.MP.deathDetails.infoLine.MakeDataSourceAtIndex = function ( f62_arg0, f62_arg1, f62_arg2 )
		local f62_local0 = LUI.DataSourceFromOmnvar.new( "ui_death_details_attacker_" .. f62_arg1 )
		local f62_local1 = f62_local0:Filter( "attackerClient", f57_local2( f62_arg1 ) )
		local f62_local2 = DataSources.inGame.MP.deathDetails.hitCountOmnvarList[f62_arg1 + 1]
		local f62_local3 = LUI.DataSourceFromList.new( f62_local2 )
		f62_local3.MakeDataSourceAtIndex = function ( f63_arg0, f63_arg1, f63_arg2 )
			return {}
		end
		
		return {
			alpha = alphaDataSource,
			attackerHitCount = f62_local2,
			attackerClient = f62_local1,
			attackerName = f62_local1,
			hitCountList = f62_local3
		}
	end
	
end

function InitCoreMPDebugDataSources()
	if Engine.IsDevelopmentBuild() then
		DataSources.debug.playerInBadPlace = LUI.DataSourceFromOmnvar.new( "ui_debug_spawn_bad_place" )
		DataSources.debug.usingTTLOSSystem = LUI.DataSourceFromOmnvar.new( "ui_debug_spawn_system_id" )
	end
end

local f0_local9 = function ()
	local f65_local0 = function ( f66_arg0, f66_arg1 )
		if 1 <= f66_arg0 and f66_arg0 <= 3 then
			return 1
		else
			return 0
		end
	end
	
	local f65_local1 = function ( f67_arg0, f67_arg1 )
		if 2 <= f67_arg0 and f67_arg0 <= 3 then
			return 1
		else
			return 0
		end
	end
	
	local f65_local2 = function ( f68_arg0, f68_arg1 )
		if f68_arg0 == 3 then
			return 1
		else
			return 0
		end
	end
	
	local f65_local3 = function ( f69_arg0, f69_arg1 )
		if f69_arg0 == 4 then
			return 1
		else
			return 0
		end
	end
	
	local f65_local4 = function ( f70_arg0, f70_arg1 )
		if f70_arg0 == 5 then
			return 1
		else
			return 0
		end
	end
	
	local f65_local5 = function ( f71_arg0, f71_arg1 )
		if f71_arg0 == 6 then
			return 1
		else
			return 0
		end
	end
	
	local f65_local6 = function ( f72_arg0, f72_arg1 )
		if f72_arg0 == 6 then
			return 1
		else
			return 0
		end
	end
	
	local f65_local7 = function ( f73_arg0, f73_arg1 )
		if f73_arg0 == 7 then
			return 1
		else
			return 0
		end
	end
	
	local f65_local8 = function ( f74_arg0, f74_arg1 )
		if f74_arg0 == 8 then
			return 1
		else
			return 0
		end
	end
	
	DataSources.inGame.player.suits.DodgeCharges = LUI.DataSourceFromOmnvar.new( "ui_dodge_charges" )
	DataSources.inGame.player.suits.dodgeCharge1Alpha = DataSources.inGame.player.suits.DodgeCharges:Filter( "dodgeCharge1Alpha", f65_local0 )
	DataSources.inGame.player.suits.dodgeCharge2Alpha = DataSources.inGame.player.suits.DodgeCharges:Filter( "dodgeCharge2Alpha", f65_local1 )
	DataSources.inGame.player.suits.dodgeCharge3Alpha = DataSources.inGame.player.suits.DodgeCharges:Filter( "dodgeCharge3Alpha", f65_local2 )
	DataSources.inGame.player.suits.TransponderRangeFinder = LUI.DataSourceFromOmnvar.new( "ui_transponder_range_finder" )
	DataSources.inGame.player.suits.TransponderOutOfRange = LUI.DataSourceFromOmnvar.new( "ui_show_transponder_outofrange" )
	DataSources.inGame.player.suits.teleSlideAlpha = DataSources.inGame.player.suits.DodgeCharges:Filter( "teleSlideAlpha", f65_local3 )
	DataSources.inGame.player.suits.playerTrophyAlpha = DataSources.inGame.player.suits.DodgeCharges:Filter( "playerTrophyAlpha", f65_local4 )
	DataSources.inGame.player.suits.playerRearguardAlpha = DataSources.inGame.player.suits.DodgeCharges:Filter( "playerRearguardAlpha", f65_local5 )
	DataSources.inGame.player.suits.groundPoundShieldAlpha = DataSources.inGame.player.suits.DodgeCharges:Filter( "groundPoundShieldAlpha", f65_local6 )
	DataSources.inGame.player.suits.groundPoundShockAlpha = DataSources.inGame.player.suits.DodgeCharges:Filter( "groundPoundShockAlpha", f65_local7 )
	DataSources.inGame.player.suits.groundPoundBoostAlpha = DataSources.inGame.player.suits.DodgeCharges:Filter( "groundPoundBoostAlpha", f65_local8 )
	DataSources.inGame.player.suits.CloakChargeProgressMeter = LUI.DataSourceFromOmnvar.new( "ui_cloak_charge_meter" )
	DataSources.inGame.player.suits.CloakChargeProgressState = LUI.DataSourceFromOmnvar.new( "ui_cloak_charge_state" )
	DataSources.inGame.player.suits.HealthRegenHud = LUI.DataSourceFromOmnvar.new( "ui_health_regen_hud" )
end

local f0_local10 = function ()
	local f75_local0 = function ( f76_arg0, f76_arg1 )
		if f76_arg0 == 0 then
			return 0
		else
			return 1
		end
	end
	
	local f75_local1 = function ( f77_arg0, f77_arg1 )
		return Engine.TableLookup( CSV.supers.file, CSV.supers.cols.ref, f77_arg0, f77_arg1 )
	end
	
	local f75_local2 = function ( f78_arg0, f78_arg1 )
		if f78_arg0 == 0 then
			return 0
		else
			return 1
		end
	end
	
	local f75_local3 = function ( f79_arg0, f79_arg1 )
		return f75_local1( f79_arg0, CSV.supers.cols.uiName )
	end
	
	local f75_local4 = function ( f80_arg0, f80_arg1 )
		return f75_local1( f80_arg0, CSV.supers.cols.uiDesc )
	end
	
	local f75_local5 = function ( f81_arg0, f81_arg1 )
		return f75_local1( f81_arg0, CSV.supers.cols.uiImageSmall )
	end
	
	local f75_local6 = function ( f82_arg0, f82_arg1 )
		return f82_arg0 == 3
	end
	
	local f75_local7 = function ( f83_arg0, f83_arg1 )
		return f83_arg0 ~= "none"
	end
	
	DataSources.inGame.player.spawnNotify = LUI.DataSourceFromOmnvar.new( "ui_player_spawned_notify" )
	DataSources.inGame.player.super = {}
	DataSources.inGame.player.super.superMeterProgress = LUI.DataSourceFromOmnvar.new( "ui_super_progress" )
	DataSources.inGame.player.super.superMeterFlashProgress = LUI.DataSourceFromOmnvar.new( "ui_super_flash_progress" )
	DataSources.inGame.player.super.superMeterState = LUI.DataSourceFromOmnvar.new( "ui_super_state" )
	DataSources.inGame.player.super.superMeterAlpha = DataSources.inGame.player.super.superMeterState:Filter( "superMeterAlpha", f75_local2 )
	DataSources.inGame.player.super.superActive = DataSources.inGame.player.super.superMeterState:Filter( "superActive", f75_local6 )
	DataSources.inGame.player.super.superMeterRef = LUI.DataSourceFromOmnvar.new( "ui_super_ref" )
	DataSources.inGame.player.super.superMeterName = DataSources.inGame.player.super.superMeterRef:Filter( "superMeterName", f75_local3 )
	DataSources.inGame.player.super.superMeterDesc = DataSources.inGame.player.super.superMeterRef:Filter( "superMeterDesc", f75_local4 )
	DataSources.inGame.player.super.superMeterImageSmall = DataSources.inGame.player.super.superMeterRef:Filter( "superMeterImageSmall", f75_local5 )
	DataSources.inGame.player.super.superMeterImageLarge = DataSources.inGame.player.super.superMeterRef:Filter( "superMeterImageLarge", f75_local5 )
	DataSources.inGame.player.super.isValid = DataSources.inGame.player.super.superMeterRef:Filter( "isValid", f75_local7 )
	local f75_local8 = 6
	DataSources.inGame.player.perkListOmnvars = {}
	for f75_local9 = 1, f75_local8, 1 do
		DataSources.inGame.player.perkListOmnvars[f75_local9] = LUI.DataSourceFromOmnvar.new( "ui_spawn_perk_" .. f75_local9 - 1 )
	end
	DataSources.inGame.player.perkListCount = LUI.AggregateDataSource.new( DataSources.inGame.player.perkListOmnvars[1], DataSources.inGame.player.perkListOmnvars, "perkListCount", function ( f84_arg0 )
		local f84_local0 = 0
		for f84_local1 = 1, f75_local8, 1 do
			if 0 <= DataSources.inGame.player.perkListOmnvars[f84_local1]:GetValue( f84_arg0 ) then
				f84_local0 = f84_local0 + 1
			end
		end
		return f84_local0
	end )
	DataSources.inGame.player.perkList = LUI.DataSourceFromList.new( DataSources.inGame.player.perkListCount )
	DataSources.inGame.player.perkList.MakeDataSourceAtIndex = function ( f85_arg0, f85_arg1, f85_arg2 )
		local f85_local0 = DataSources.inGame.player.perkListOmnvars[f85_arg1 + 1]
		return {
			name = f85_local0:Filter( "name", f0_local0 ),
			icon = f85_local0:Filter( "icon", f0_local1 )
		}
	end
	
	local f75_local9 = function ( f86_arg0, f86_arg1 )
		return Engine.TableLookup( CSV.perks.file, CSV.perks.cols.index, f86_arg0, CSV.perks.cols.image )
	end
	
	DataSources.inGame.player.trait = {}
	DataSources.inGame.player.trait.traitRef = LUI.DataSourceFromOmnvar.new( "ui_trait_ref" )
	DataSources.inGame.player.trait.traitImageSmall = DataSources.inGame.player.trait.traitRef:Filter( "traitImageSmall", f75_local9 )
end

local f0_local11 = function ()
	DataSources.inGame.MP.awards = LUI.DataSourceFromList.new( Engine.TableGetRowCount( CSV.awardTable.file ) )
	DataSources.inGame.MP.awards.MakeDataSourceAtIndex = function ( f88_arg0, f88_arg1, f88_arg2 )
		local f88_local0 = CSV.ReadRow( CSV.awardTable, f88_arg1 )
		local f88_local1 = "cg.MP.awards." .. f88_arg1
		local f88_local2 = DataSources.alwaysLoaded.playerData.MP.common.awards[f88_local0.ref]
		return {
			count = f88_local2,
			name = LUI.DataSourceInControllerModel.new( f88_local1 .. ".name", f88_local0.title ),
			icon = LUI.DataSourceInControllerModel.new( f88_local1 .. ".icon", f88_local0.icon ),
			notifyDuringMatch = LUI.DataSourceInControllerModel.new( f88_local1 .. ".notifyDuringMatch", f88_local0.notifyDuringMatch == "1" ),
			lastCount = LUI.DataSourceInControllerModel.new( f88_local1 .. ".lastCount", f88_local2:GetValue( f88_arg2 ) )
		}
	end
	
	DataSources.inGame.MP.awardEvents = LUI.FeedDataSource.new( LUI.DataSourceInControllerModel.new( "cg.MP.awardEvents" ), 8, {
		text = "",
		icon = ""
	} )
	DataSources.inGame.MP.awardEvents.text = LUI.DataSourceInControllerModel.new( "cg.MP.awardEvents.push.text" )
	DataSources.inGame.MP.awardEvents.icon = LUI.DataSourceInControllerModel.new( "cg.MP.awardEvents.push.icon" )
	DataSources.inGame.MP.awardEvents.push = LUI.DataSourceInControllerModel.new( "cg.MP.awardEvents.push" )
	DataSources.inGame.MP.awardQueue = {}
	DataSources.inGame.MP.awardQueue.text = LUI.DataSourceInControllerModel.new( "cg.MP.awardQueue.push.text" )
	DataSources.inGame.MP.awardQueue.icon = LUI.DataSourceInControllerModel.new( "cg.MP.awardQueue.push.icon" )
	DataSources.inGame.MP.awardQueue.push = LUI.DataSourceInControllerModel.new( "cg.MP.awardQueue.push" )
end

local f0_local12 = function ()
	local f89_local0 = function ( f90_arg0, f90_arg1 )
		return Engine.TableLookupByRow( AttachmentTable.File, f90_arg0, AttachmentTable.Cols.Image )
	end
	
	local f89_local1 = function ( f91_arg0, f91_arg1 )
		local f91_local0
		if 0 <= f91_arg0 then
			f91_local0 = 1
			if not f91_local0 then
			
			else
				return f91_local0
			end
		end
		f91_local0 = 0
	end
	
	local f89_local2 = function ( f92_arg0 )
		return function ( f93_arg0, f93_arg1 )
			if DataSources.inGame.MP.killcam.killedby.itemType:GetValue( f93_arg1 ) == f92_arg0 then
				return f93_arg0
			else
				
			end
		end
		
	end
	
	local f89_local3 = function ( f94_arg0 )
		return function ( f95_arg0 )
			local f95_local0 = ""
			local f95_local1 = DataSources.inGame.MP.killcam.killedby.itemType:GetValue( f95_arg0 )
			local f95_local2 = DataSources.inGame.MP.killcam.killedby.variantId:GetValue( f95_arg0 )
			if f95_local1 == 1 then
				f95_local0 = Engine.TableLookup( CSV.streakLootMaster.file, CSV.streakLootMaster.cols.index, f95_local2, f94_arg0 + 6 )
			else
				local f95_local3 = DataSources.inGame.MP.killcam.killedby.weaponRootName:GetValue( f95_arg0 )
				if f95_local3 and #f95_local3 > 0 then
					local f95_local4 = "mp/loot/weapon/" .. f95_local3 .. ".csv"
					local f95_local5 = f94_arg0 + 4
					if Engine.TableExists( f95_local4 ) then
						f95_local0 = Engine.TableLookupByRow( f95_local4, f95_local2, f95_local5 )
					end
				end
			end
			return f95_local0
		end
		
	end
	
	local f89_local4 = function ( f96_arg0, f96_arg1 )
		return Cac.GetPassiveTableProperty( f96_arg0, PassiveTable.Cols.Icon )
	end
	
	local f89_local5 = function ( f97_arg0, f97_arg1 )
		local f97_local0
		if f97_arg0 ~= "" then
			f97_local0 = 1
			if not f97_local0 then
			
			else
				return f97_local0
			end
		end
		f97_local0 = 0
	end
	
	local f89_local6 = DataSources.inGame.MP.killcam.killedby
	DataSources.inGame.MP.killcam.countdown = LUI.DataSourceFromOmnvar.new( "ui_killcam_end_milliseconds" )
	DataSources.inGame.MP.killcam.victimClientId = LUI.DataSourceFromOmnvar.new( "ui_killcam_victim_id" )
	DataSources.inGame.MP.killcam.message = LUI.DataSourceFromOmnvar.new( "ui_killcam_text" )
	DataSources.inGame.MP.killcam.scene = LUI.DataSourceFromOmnvar.new( "killcam_scene" )
	DataSources.inGame.MP.killcam.victimOrAttacker = LUI.DataSourceFromOmnvar.new( "ui_killcam_victim_or_attacker" )
	DataSources.inGame.MP.killcam.isVictim = DataSources.inGame.MP.killcam.victimOrAttacker:Filter( "isVictim", function ( f98_arg0, f98_arg1 )
		return f98_arg0 == 0
	end )
	f89_local6.clientId = LUI.DataSourceFromOmnvar.new( "ui_killcam_killedby_id" )
	f89_local6.validKiller = f89_local6.clientId:Filter( "validKiller", function ( f99_arg0 )
		return 0 <= f99_arg0
	end )
	f89_local6.weaponLootRarity = LUI.DataSourceFromOmnvar.new( "ui_killcam_killedby_weapon_rarity" )
	f89_local6.weaponLootRarityName = f89_local6.weaponLootRarity:Filter( "weaponLootRarityName", function ( f100_arg0, f100_arg1 )
		return Cac.GetLootQualityString( f100_arg0 + 1 )
	end )
	f89_local6.weaponLootRarityColor = f89_local6.weaponLootRarity:Filter( "weaponLootRarityColor", function ( f101_arg0, f101_arg1 )
		return Cac.GetLootQualityColor( f101_arg0 + 1 )
	end )
	f89_local6.weaponLootRarityIcon = f89_local6.weaponLootRarity:Filter( "weaponLootRarityIcon", function ( f102_arg0, f102_arg1 )
		return Cac.GetLootQualityImage( f102_arg0 + 1 )
	end )
	f89_local6.weaponLootRarityNotify = LUI.DataSourceFromOmnvar.new( "ui_killcam_killedby_weapon_rarity_notify" )
	f89_local6.itemType = LUI.DataSourceFromOmnvar.new( "ui_killcam_killedby_item_type" )
	f89_local6.variantId = LUI.DataSourceFromOmnvar.new( "ui_killcam_killedby_loot_variant_id" )
	f89_local6.itemID = LUI.DataSourceFromOmnvar.new( "ui_killcam_killedby_item_id" )
	f89_local6.itemName = LUI.AggregateDataSource.new( f89_local6.clientId, {
		f89_local6.itemType,
		f89_local6.itemID,
		f89_local6.variantId
	}, "itemName", function ( f103_arg0 )
		local f103_local0 = f89_local6.itemType:GetValue( f103_arg0 )
		local f103_local1 = f89_local6.itemID:GetValue( f103_arg0 )
		if f103_local0 and f103_local1 then
			if f103_local0 == 0 then
				local f103_local2 = f89_local6.variantId:GetValue( f103_arg0 )
				if f103_local2 > -1 then
					local f103_local3 = LOADOUT.GetWeaponLootVariantData( Engine.TableLookupByRow( CSV.weapons.file, f103_local1, CSV.weapons.cols.ref ) )
					return Engine.TableLookup( f103_local3.file, CSV.weaponLoot.cols.index, f103_local2, CSV.weaponLoot.cols.displayName )
				else
					return Engine.TableLookupByRow( CSV.weapons.file, f103_local1, CSV.weapons.cols.name )
				end
			elseif f103_local0 == 1 then
				local f103_local2 = f89_local6.variantId:GetValue( f103_arg0 )
				if f103_local2 > -1 then
					return Engine.TableLookup( CSV.streakLootMaster.file, CSV.streakLootMaster.cols.index, f103_local2, CSV.streakLootMaster.cols.displayName )
				else
					return Engine.TableLookup( CSV.streaks.file, CSV.streaks.cols.index, f103_local1, CSV.streaks.cols.name )
				end
			elseif f103_local0 == 2 then
				return Engine.TableLookupByRow( CSV.supers.file, f103_local1, CSV.supers.cols.uiName )
			elseif f103_local0 == 3 then
				return Engine.TableLookup( CSV.MPpowers.file, CSV.MPpowers.cols.index, f103_local1, CSV.MPpowers.cols.name )
			elseif f103_local0 == 4 then
				return Engine.TableLookup( CSV.miscKillcam.file, CSV.miscKillcam.cols.index, f103_local1, CSV.miscKillcam.cols.text )
			elseif f103_local0 == -1 then
				return ""
			else
				
			end
		else
			return ""
		end
	end )
	f89_local6.weaponRootName = LUI.AggregateDataSource.new( f89_local6.clientId, {
		f89_local6.itemType,
		f89_local6.itemID
	}, "weaponRootName", function ( f104_arg0 )
		local f104_local0 = f89_local6.itemType:GetValue( f104_arg0 )
		local f104_local1 = f89_local6.itemID:GetValue( f104_arg0 )
		if f104_local0 and f104_local1 and f104_local0 == 0 then
			return Engine.TableLookupByRow( CSV.weapons.file, f104_local1, CSV.weapons.cols.ref )
		else
			return ""
		end
	end )
	f89_local6.passive1 = LUI.AggregateDataSource.new( f89_local6.clientId, {
		f89_local6.variantId,
		f89_local6.weaponRootName
	}, "passive1", f89_local3( 1 ) )
	f89_local6.passive2 = LUI.AggregateDataSource.new( f89_local6.clientId, {
		f89_local6.variantId,
		f89_local6.weaponRootName
	}, "passive2", f89_local3( 2 ) )
	f89_local6.passive3 = LUI.AggregateDataSource.new( f89_local6.clientId, {
		f89_local6.variantId,
		f89_local6.weaponRootName
	}, "passive3", f89_local3( 3 ) )
	f89_local6.passive1Icon = f89_local6.passive1:Filter( "passive1Icon", f89_local4 )
	f89_local6.passive2Icon = f89_local6.passive2:Filter( "passive2Icon", f89_local4 )
	f89_local6.passive3Icon = f89_local6.passive3:Filter( "passive3Icon", f89_local4 )
	f89_local6.passive1IconAlpha = f89_local6.passive1:Filter( "passive1IconAlpha", f89_local5 )
	f89_local6.passive2IconAlpha = f89_local6.passive2:Filter( "passive2IconAlpha", f89_local5 )
	f89_local6.passive3IconAlpha = f89_local6.passive3:Filter( "passive3IconAlpha", f89_local5 )
	f89_local6.itemIcon = LUI.AggregateDataSource.new( f89_local6.clientId, {
		f89_local6.itemType,
		f89_local6.itemID,
		f89_local6.variantId
	}, "itemIcon", function ( f105_arg0 )
		local f105_local0 = f89_local6.itemType:GetValue( f105_arg0 )
		local f105_local1 = f89_local6.itemID:GetValue( f105_arg0 )
		if f105_local0 and f105_local1 then
			if f105_local0 == 0 then
				local f105_local2 = f89_local6.variantId:GetValue( f105_arg0 )
				if f105_local2 >= 0 then
					local f105_local3 = LOADOUT.GetWeaponLootVariantData( Engine.TableLookupByRow( CSV.weapons.file, f105_local1, CSV.weapons.cols.ref ) )
					return Engine.TableLookup( f105_local3.file, CSV.weaponLoot.cols.index, f105_local2, CSV.weaponLoot.cols.displayImage )
				else
					return Engine.TableLookupByRow( CSV.weapons.file, f105_local1, CSV.weapons.cols.image )
				end
			elseif f105_local0 == 1 then
				local f105_local2 = f89_local6.variantId:GetValue( f105_arg0 )
				if f105_local2 > -1 then
					return Engine.TableLookup( CSV.streakLootMaster.file, CSV.streakLootMaster.cols.index, f105_local2, CSV.streakLootMaster.cols.displayImageSmall )
				else
					return Engine.TableLookup( CSV.streaks.file, CSV.streaks.cols.index, f105_local1, CSV.streaks.cols.smallImage )
				end
			elseif f105_local0 == 2 then
				return Engine.TableLookupByRow( CSV.supers.file, f105_local1, CSV.supers.cols.uiImageSmall )
			elseif f105_local0 == 3 then
				return Engine.TableLookup( CSV.MPpowers.file, CSV.MPpowers.cols.index, f105_local1, CSV.MPpowers.cols.image )
			elseif f105_local0 == 4 then
				return Engine.TableLookup( CSV.miscKillcam.file, CSV.miscKillcam.cols.index, f105_local1, CSV.miscKillcam.cols.image )
			end
		end
		return ""
	end )
	f89_local6.killstreakIcon = f89_local6.itemIcon:Filter( "killstreakIcon", f89_local2( 1 ) )
	f89_local6.weaponIcon = f89_local6.itemIcon:Filter( "weaponIcon", f89_local2( 0 ) )
	f89_local6.superIcon = f89_local6.itemIcon:Filter( "superIcon", f89_local2( 2 ) )
	f89_local6.powerIcon = f89_local6.itemIcon:Filter( "powerIcon", f89_local2( 3 ) )
	f89_local6.miscIcon = f89_local6.itemIcon:Filter( "miscIcon", f89_local2( 4 ) )
	f89_local6.attachment1 = LUI.DataSourceFromOmnvar.new( "ui_killcam_killedby_attachment1" )
	f89_local6.attachment2 = LUI.DataSourceFromOmnvar.new( "ui_killcam_killedby_attachment2" )
	f89_local6.attachment3 = LUI.DataSourceFromOmnvar.new( "ui_killcam_killedby_attachment3" )
	f89_local6.attachment4 = LUI.DataSourceFromOmnvar.new( "ui_killcam_killedby_attachment4" )
	f89_local6.attachment5 = LUI.DataSourceFromOmnvar.new( "ui_killcam_killedby_attachment5" )
	f89_local6.attachment6 = LUI.DataSourceFromOmnvar.new( "ui_killcam_killedby_attachment6" )
	f89_local6.attachment1Icon = f89_local6.attachment1:Filter( "attachmentIcon1", f89_local0 )
	f89_local6.attachment2Icon = f89_local6.attachment2:Filter( "attachmentIcon2", f89_local0 )
	f89_local6.attachment3Icon = f89_local6.attachment3:Filter( "attachmentIcon3", f89_local0 )
	f89_local6.attachment4Icon = f89_local6.attachment4:Filter( "attachmentIcon4", f89_local0 )
	f89_local6.attachment5Icon = f89_local6.attachment5:Filter( "attachmentIcon5", f89_local0 )
	f89_local6.attachment6Icon = f89_local6.attachment6:Filter( "attachmentIcon6", f89_local0 )
	f89_local6.attachment1Alpha = f89_local6.attachment1:Filter( "attachment1Alpha", f89_local1 )
	f89_local6.attachment2Alpha = f89_local6.attachment2:Filter( "attachment2Alpha", f89_local1 )
	f89_local6.attachment3Alpha = f89_local6.attachment3:Filter( "attachment3Alpha", f89_local1 )
	f89_local6.attachment4Alpha = f89_local6.attachment4:Filter( "attachment4Alpha", f89_local1 )
	f89_local6.attachment5Alpha = f89_local6.attachment5:Filter( "attachment5Alpha", f89_local1 )
	f89_local6.attachment6Alpha = f89_local6.attachment6:Filter( "attachment6Alpha", f89_local1 )
	f89_local6.killstreakAlpha = f89_local6.itemType:Filter( "killstreakAlpha", function ( f106_arg0, f106_arg1 )
		local f106_local0
		if f106_arg0 == 1 then
			f106_local0 = 1
			if not f106_local0 then
			
			else
				return f106_local0
			end
		end
		f106_local0 = 0
	end )
	f89_local6.weaponAlpha = f89_local6.itemType:Filter( "weaponAlpha", function ( f107_arg0, f107_arg1 )
		local f107_local0
		if f107_arg0 == 0 then
			f107_local0 = 1
			if not f107_local0 then
			
			else
				return f107_local0
			end
		end
		f107_local0 = 0
	end )
	f89_local6.superAlpha = f89_local6.itemType:Filter( "superAlpha", function ( f108_arg0, f108_arg1 )
		local f108_local0
		if f108_arg0 == 2 then
			f108_local0 = 1
			if not f108_local0 then
			
			else
				return f108_local0
			end
		end
		f108_local0 = 0
	end )
	f89_local6.powerAlpha = f89_local6.itemType:Filter( "powerAlpha", function ( f109_arg0, f109_arg1 )
		local f109_local0
		if f109_arg0 == 3 then
			f109_local0 = 1
			if not f109_local0 then
			
			else
				return f109_local0
			end
		end
		f109_local0 = 0
	end )
	f89_local6.miscAlpha = f89_local6.itemType:Filter( "miscAlpha", function ( f110_arg0, f110_arg1 )
		local f110_local0
		if f110_arg0 == 4 then
			f110_local0 = 1
			if not f110_local0 then
			
			else
				return f110_local0
			end
		end
		f110_local0 = 0
	end )
	f89_local6.finalAlpha = f89_local6.itemIcon:Filter( "finalAlpha", function ( f111_arg0, f111_arg1 )
		local f111_local0
		if f111_arg0 == "" then
			f111_local0 = 0
			if not f111_local0 then
			
			else
				return f111_local0
			end
		end
		f111_local0 = 1
	end )
	f89_local6.playerCard = BuildPlayerCardDataSources( f89_local6.clientId )
	f89_local6.victimPlayerCard = BuildPlayerCardDataSources( DataSources.inGame.MP.killcam.victimClientId )
	f89_local6.isMk2 = LUI.AggregateDataSource.new( f89_local6.clientId, {
		f89_local6.itemType,
		f89_local6.itemID,
		f89_local6.variantId
	}, "isMk2", function ( f112_arg0 )
		local f112_local0 = f89_local6.itemType:GetValue( f112_arg0 )
		local f112_local1 = f89_local6.itemID:GetValue( f112_arg0 )
		if f112_local0 and f112_local1 and f112_local0 == 0 then
			local f112_local2 = f89_local6.variantId:GetValue( f112_arg0 )
			if f112_local2 >= 0 then
				local f112_local3 = LOADOUT.GetWeaponLootVariantData( Engine.TableLookupByRow( CSV.weapons.file, f112_local1, CSV.weapons.cols.ref ) )
				return Cac.IsWeaponRefMk2( Engine.TableLookup( f112_local3.file, CSV.weaponLoot.cols.index, f112_local2, CSV.weaponLoot.cols.ref ) )
			end
		end
		return false
	end )
	local f89_local7 = 6
	DataSources.inGame.MP.killcam.perkListOmnvars = {}
	for f89_local8 = 1, f89_local7, 1 do
		DataSources.inGame.MP.killcam.perkListOmnvars[f89_local8] = LUI.DataSourceFromOmnvar.new( "ui_killcam_killedby_perk" .. f89_local8 - 1 )
	end
	f89_local6.perkListCount = LUI.AggregateDataSource.new( DataSources.inGame.MP.killcam.perkListOmnvars[1], DataSources.inGame.MP.killcam.perkListOmnvars, "perkListCount", function ( f113_arg0 )
		local f113_local0 = 0
		for f113_local1 = 1, f89_local7, 1 do
			if 0 <= DataSources.inGame.MP.killcam.perkListOmnvars[f113_local1]:GetValue( f113_arg0 ) then
				f113_local0 = f113_local0 + 1
			end
		end
		return f113_local0
	end )
	f89_local6.perkList = LUI.DataSourceFromList.new( f89_local6.perkListCount )
	f89_local6.perkList.MakeDataSourceAtIndex = function ( f114_arg0, f114_arg1, f114_arg2 )
		local f114_local0 = DataSources.inGame.MP.killcam.perkListOmnvars[f114_arg1 + 1]
		return {
			name = f114_local0:Filter( "name", f0_local0 ),
			icon = f114_local0:Filter( "icon", f0_local1 )
		}
	end
	
end

function InitCoreMPInGameDataSources()
	local f115_local0 = function ( f116_arg0 )
		return function ( f117_arg0, f117_arg1 )
			return Engine.IsBitSet( f117_arg0, f116_arg0 )
		end
		
	end
	
	local f115_local1 = function ( f118_arg0, f118_arg1 )
		if f118_arg0 < 0 then
			return ""
		else
			local f118_local0 = Engine.TableLookup( CSV.mapCallouts.filePath .. Engine.GetDvarString( "ui_mapname" ) .. "_callouts.csv", CSV.mapCallouts.cols.index, f118_arg0, CSV.mapCallouts.cols.localizeRef )
			if f118_local0 and f118_local0 ~= "" then
				return Engine.Localize( f118_local0 )
			else
				return ""
			end
		end
	end
	
	local f115_local2 = function ( f119_arg0, f119_arg1 )
		return ToUpperCase( f119_arg0 )
	end
	
	local f115_local3 = function ( f120_arg0, f120_arg1 )
		if f120_arg0 < 0 then
			return false
		else
			return true
		end
	end
	
	InitAlwaysLoadedCoreMPDataSources()
	f0_local4()
	f0_local5()
	f0_local6()
	InitCoreMPDebugDataSources()
	SCOREBOARD.InitScoreboardDataSources( SCOREBOARD.menus.InGame, 0 )
	f0_local9()
	f0_local10()
	f0_local3()
	f0_local7()
	f0_local8()
	f0_local2()
	InitSplashDataSources()
	InitCacCommonDataSources()
	f0_local11()
	f0_local12()
	DataSources.inGame.MP.edgeGlowVisMask = LUI.DataSourceFromOmnvar.new( "ui_edge_glow" )
	DataSources.inGame.MP.edgeGlowUpperRight = DataSources.inGame.MP.edgeGlowVisMask:Filter( "edgeGlowUpperRight", f115_local0( 0 ) )
	DataSources.inGame.MP.edgeGlowUpperCenter = DataSources.inGame.MP.edgeGlowVisMask:Filter( "edgeGlowUpperCenter", f115_local0( 1 ) )
	DataSources.inGame.MP.edgeGlowUpperLeft = DataSources.inGame.MP.edgeGlowVisMask:Filter( "edgeGlowUpperLeft", f115_local0( 2 ) )
	DataSources.inGame.MP.edgeGlowLowerRight = DataSources.inGame.MP.edgeGlowVisMask:Filter( "edgeGlowLowerRight", f115_local0( 3 ) )
	DataSources.inGame.MP.edgeGlowLowerCenter = DataSources.inGame.MP.edgeGlowVisMask:Filter( "edgeGlowLowerCenter", f115_local0( 4 ) )
	DataSources.inGame.MP.edgeGlowLowerLeft = DataSources.inGame.MP.edgeGlowVisMask:Filter( "edgeGlowLowerLeft", f115_local0( 5 ) )
	DataSources.inGame.MP.edgeGlowMidRight = DataSources.inGame.MP.edgeGlowVisMask:Filter( "edgeGlowMidRight", f115_local0( 6 ) )
	DataSources.inGame.MP.edgeGlowMidLeft = DataSources.inGame.MP.edgeGlowVisMask:Filter( "edgeGlowMidLeft", f115_local0( 7 ) )
	DataSources.inGame.MP.edgeGlowVignette = DataSources.inGame.MP.edgeGlowVisMask:Filter( "vignette", f115_local0( 8 ) )
	DataSources.inGame.MP.calloutAreaId = LUI.DataSourceFromOmnvar.new( "ui_callout_area_id" )
	DataSources.inGame.MP.calloutAreaString = DataSources.inGame.MP.calloutAreaId:Filter( "calloutAreaString", f115_local1 )
	DataSources.inGame.MP.calloutAreaStringUpperCase = DataSources.inGame.MP.calloutAreaString:Filter( "calloutAreaStringUpperCase", f115_local2 )
	DataSources.inGame.MP.hardpointCalloutAreaId = LUI.DataSourceFromOmnvar.new( "ui_hp_callout_id" )
	DataSources.inGame.MP.hardpointCalloutAreaString = DataSources.inGame.MP.hardpointCalloutAreaId:Filter( "calloutAreaString", f115_local1 )
	DataSources.inGame.MP.showHardpointCallout = DataSources.inGame.MP.hardpointCalloutAreaId:Filter( "showHardpointCallout", f115_local3 )
	DataSources.inGame.MP.playerDamaged = LUI.DataSourceFromOmnvar.new( "ui_damage_event" )
	DataSources.inGame.MP.outOfBoundsCountdown = LUI.DataSourceFromOmnvar.new( "ui_out_of_bounds_countdown" )
	DataSources.inGame.MP.outOfBoundsCountdownActive = DataSources.inGame.MP.outOfBoundsCountdown:Filter( "active", function ( f121_arg0 )
		return 0 < f121_arg0
	end )
	DataSources.inGame.MP.rigSelectTitle = LUI.DataSourceInControllerModel.new( "rigSelectTitle" )
end

