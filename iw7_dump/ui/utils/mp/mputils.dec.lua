MP = MP or {}
MP.SplitScreenRotModifier = CONDITIONS.IsSplitscreen() and 0 or 1
MP.teamInfo = {
	[Teams.free] = {
		name = "Free For All",
		color = GetIntForColor( SWATCHES.HUD.normal ),
		logo = "icon_edi",
		watermark = "icon_edi"
	},
	[Teams.allies] = {
		name = "UNSA",
		color = GetIntForColor( SWATCHES.HUD.stable ),
		logo = "icon_faction_unsa_perspective",
		watermark = "icon_faction_watermark_unsa"
	},
	[Teams.axis] = {
		name = "SDF",
		color = GetIntForColor( SWATCHES.HUD.warning ),
		logo = "icon_faction_sdf_perspective",
		watermark = "icon_faction_watermark_sdf"
	}
}
MP.GameMode = {
	TDMGameType = "war",
	DomGameType = "dom",
	SDGameType = "sd",
	ConfGameType = "conf",
	FFAGameType = "dm",
	HardpointGameType = "koth",
	MPZombiesGameType = "mp_zomb",
	AliensGameType = "aliens",
	SRGameType = "sr",
	InfectGameType = "infect",
	BallGameType = "ball",
	GrindGameType = "grind",
	GunGameType = "gun",
	GrndGameType = "grnd",
	SiegeGameType = "siege",
	CTFGameType = "ctf",
	DemoGameType = "dd",
	TDefGameType = "tdef",
	FrontGameType = "front"
}
MP.RoundEndTitleStrings = {
	"MP_DRAW",
	"MP_ROUND_DRAW",
	"MP_ROUND_WIN",
	"MP_ROUND_LOSS",
	"MP_VICTORY",
	"MP_DEFEAT",
	"MP_HALFTIME",
	"MP_OVERTIME",
	"MP_ROUNDEND",
	"MP_INTERMISSION",
	"MP_SWITCHING_SIDES",
	"MP_MATCH_BONUS_IS",
	"MP_MATCH_TIE",
	"SPLASHES_BLANK",
	"MP_FINAL_ROUND",
	"MP_MATCH_POINT"
}
MP.RoundEndReasonStrings = {
	"MP_SCORE_LIMIT_REACHED",
	"MP_TIME_LIMIT_REACHED",
	"MP_PLAYERS_FORFEITED",
	"MP_TARGET_DESTROYED",
	"MP_BOMB_DEFUSED",
	"MP_FACTION_UNSA_ELIMINATED",
	"MP_FACTION_SDF_ELIMINATED",
	"MP_FACTION_UNSA_FORFEITED",
	"MP_FACTION_SDF_FORFEITED",
	"MP_ENEMIES_ELIMINATED",
	"MP_MATCH_TIE",
	"GAME_OBJECTIVECOMPLETED",
	"GAME_OBJECTIVEFAILED",
	"MP_SWITCHING_SIDES",
	"MP_ROUND_LIMIT_REACHED",
	"MP_ENDED_GAME",
	"MP_HOST_ENDED_GAME",
	"LUA_MENU_MP_LOSS_STAT_PREVENTED",
	"MP_TIME_TO_BEAT_CTF_WIN",
	"MP_TIME_TO_BEAT_CTF_LOSS",
	"MP_TIME_TO_BEAT_UPLINK_WIN",
	"MP_TIME_TO_BEAT_UPLINK_LOSS",
	"MP_NUKE_END"
}
MP.IsTimeLimitGameType = function ( f1_arg0 )
	local f1_local0
	if f1_arg0 ~= MP.GameMode.FFAGameType and f1_arg0 ~= MP.GameMode.TDMGameType and f1_arg0 ~= MP.GameMode.ConfGameType and f1_arg0 ~= MP.GameMode.AliensGameType and f1_arg0 ~= MP.GameMode.GrindGameType and f1_arg0 ~= MP.GameMode.GunGameType and f1_arg0 ~= MP.GameMode.GrndGameType and f1_arg0 ~= MP.GameMode.HardpointGameType and f1_arg0 ~= MP.GameMode.MPZombiesGameType and f1_arg0 ~= MP.GameMode.TDefGameType and f1_arg0 ~= MP.GameMode.InfectGameType and f1_arg0 ~= MP.GameMode.SDGameType and f1_arg0 ~= MP.GameMode.SRGameType and f1_arg0 ~= MP.GameMode.SiegeGameType and f1_arg0 ~= MP.GameMode.DemoGameType then
		f1_local0 = false
	else
		f1_local0 = true
	end
	return f1_local0
end

MP.IsRoundTimeLimitGameType = function ( f2_arg0 )
	local f2_local0
	if f2_arg0 ~= MP.GameMode.BallGameType and f2_arg0 ~= MP.GameMode.DomGameType and f2_arg0 ~= MP.GameMode.CTFGameType and f2_arg0 ~= MP.GameMode.FrontGameType then
		f2_local0 = false
	else
		f2_local0 = true
	end
	return f2_local0
end

MP.IsCrankedTimerGameType = function ( f3_arg0 )
	local f3_local0
	if f3_arg0 ~= MP.GameMode.FFAGameType and f3_arg0 ~= MP.GameMode.TDMGameType and f3_arg0 ~= MP.GameMode.DomGameType and f3_arg0 ~= MP.GameMode.ConfGameType and f3_arg0 ~= MP.GameMode.BallGameType and f3_arg0 ~= MP.GameMode.GrindGameType and f3_arg0 ~= MP.GameMode.GunGameType and f3_arg0 ~= MP.GameMode.GrndGameType and f3_arg0 ~= MP.GameMode.HardpointGameType and f3_arg0 ~= MP.GameMode.FrontGameType then
		f3_local0 = false
	else
		f3_local0 = true
	end
	return f3_local0
end

MP.RoundEndTitleFilterFunction = function ( f4_arg0, f4_arg1 )
	if 0 < f4_arg0 then
		return MP.RoundEndTitleStrings[f4_arg0]
	else
		return ""
	end
end

MP.RoundEndReasonFilterFunction = function ( f5_arg0, f5_arg1 )
	if 0 < f5_arg0 then
		return MP.RoundEndReasonStrings[f5_arg0]
	else
		return ""
	end
end

MP.IsRoundEndTitleEndOfMatch = function ( f6_arg0 )
	local f6_local0
	if f6_arg0 ~= 1 and f6_arg0 ~= 5 and f6_arg0 ~= 6 and f6_arg0 ~= 13 then
		f6_local0 = false
	else
		f6_local0 = true
	end
	return f6_local0
end

MP.RoundEndFFAPlayerScoreFunction = function ( f7_arg0 )
	local f7_local0 = Game.GetPlayerScoreInfoAtRank( Game.GetPlayerTeam(), f7_arg0 )
	if f7_local0 then
		return f7_local0.name
	else
		
	end
end

MP.RoundEndFFAFirstPlayerScoreFunction = function ( f8_arg0, f8_arg1 )
	return MP.RoundEndFFAPlayerScoreFunction( 1 )
end

MP.RoundEndFFASecondPlayerScoreFunction = function ( f9_arg0, f9_arg1 )
	return MP.RoundEndFFAPlayerScoreFunction( 2 )
end

MP.RoundEndFFAThirdPlayerScoreFunction = function ( f10_arg0, f10_arg1 )
	return MP.RoundEndFFAPlayerScoreFunction( 3 )
end

MP.StartEMPGlitch = function ( f11_arg0 )
	f11_arg0:SetGlitchEnabled( true )
	f11_arg0:SetGlitchBlockWidth( 5 )
	f11_arg0:SetGlitchBlockHeight( 6 )
	f11_arg0:SetGlitchDistortionRange( 1 )
	f11_arg0:SetGlitchScanlinePitch( 224 )
	f11_arg0:SetGlitchMaskPitch( 4 )
	f11_arg0:SetGlitchAmount( 0.95 )
	local f11_local0 = nil
	local f11_local1 = function ()
		if f11_arg0:GetGlitchEnabled() then
			f11_arg0:SetGlitchBlockWidth( 2 + 3 * math.random() )
			local f12_local0 = f11_arg0:Wait( 50 + 400 * math.random() )
			f12_local0.onComplete = f11_local0
		end
	end
	
	f11_local1()
	f11_local1 = nil
	local f11_local2 = function ()
		if f11_arg0:GetGlitchEnabled() then
			f11_arg0:SetGlitchBlockHeight( 1 + 5 * math.random() )
			local f13_local0 = f11_arg0:Wait( 50 + 400 * math.random() )
			f13_local0.onComplete = f11_local1
		end
	end
	
	f11_local2()
	f11_local2 = nil
	local f11_local3 = function ()
		if f11_arg0:GetGlitchEnabled() then
			f11_arg0:SetGlitchAmount( 0.95 + 0.05 * math.random() )
			local f14_local0 = f11_arg0:Wait( 50 + 400 * math.random() )
			f14_local0.onComplete = f11_local2
		end
	end
	
	f11_local3()
end

MP.StopEMPGlitch = function ( f15_arg0 )
	f15_arg0:SetGlitchBlockWidth( 1 )
	f15_arg0:SetGlitchBlockHeight( 1 )
	f15_arg0:SetGlitchDistortionRange( 1 )
	f15_arg0:SetGlitchScanlinePitch( 1 )
	f15_arg0:SetGlitchMaskPitch( 1 )
	f15_arg0:SetGlitchAmount( 1 )
	f15_arg0:SetGlitchEnabled( false )
end

MP.LoadoutSelectAttempts = {
	0,
	0,
	0
}
MP.GetGameModeMaterialStreamer = function ()
	local f16_local0 = {}
	local f16_local1 = Engine.TableGetRowCount( CSV.gameTypesTable.file )
	for self = 0, f16_local1 - 1, 1 do
		local f16_local5 = Engine.TableLookupByRow( CSV.gameTypesTable.file, self, CSV.gameTypesTable.cols.image )
		if #f16_local5 > 0 then
			table.insert( f16_local0, RegisterMaterial( f16_local5 ) )
		end
	end
	local self = LUI.UIElement.new()
	self.id = "GameModeMaterialStreamer"
	self:SetupImageStreamer( f16_local0 )
	return self
end

MP.GetGameModeStats = function ( f17_arg0 )
	local f17_local0 = {
		war = {
			"KDRatio",
			"Assists"
		},
		front = {
			"KDRatio",
			"Assists"
		},
		dom = {
			"Captures",
			"Defends"
		},
		sd = {
			"Plants",
			"Defuses"
		},
		conf = {
			"Confirms",
			"Denies"
		},
		dm = {
			"KDRatio",
			"Streak"
		},
		koth = {
			"ObjTime",
			"Defends"
		},
		tdef = {
			"ObjTime",
			"Captures"
		},
		infect = {
			"Time",
			"Infected"
		},
		gun = {
			"Stabs",
			"SetBacks"
		},
		grnd = {
			"ObjTime",
			"Defends"
		},
		hcwar = {
			"KDRatio",
			"Assists"
		},
		hcdom = {
			"Captures",
			"Defends"
		},
		hcsd = {
			"Plants",
			"Defuses"
		},
		hcconf = {
			"Confirms",
			"Denies"
		},
		hcdm = {
			"KDRatio",
			"Streak"
		},
		hctdef = {
			"ObjTime",
			"Captures"
		}
	}
	if Engine.IsConsoleGame() then
		f17_local0.ball = {
			"Carries",
			"Throws"
		}
		f17_local0.ctf = {
			"Captures",
			"Returns"
		}
	end
	local f17_local1 = {}
	for f17_local2 = 0, Engine.TableGetRowCount( CSV.gameTypesTable.file ), 1 do
		local f17_local5 = CSV.ReadRow( CSV.gameTypesTable, f17_local2 )
		if f17_local5 ~= nil and f17_local5.ref ~= "" then
			f17_local1[f17_local5.ref] = {
				name = f17_local5.name,
				image = f17_local5.image,
				desc = f17_local5.desc
			}
			f17_local1["hc" .. f17_local5.ref] = {
				name = Engine.Localize( "LUA_MENU_MP_HARDCORE_GAME_TYPE", f17_local5.name ),
				image = f17_local5.hardcoreImage and f17_local5.hardcoreImage or f17_local5.image,
				desc = f17_local5.desc
			}
		end
	end
	local f17_local2 = {}
	for f17_local5, f17_local8 in pairs( f17_local0 ) do
		local f17_local9 = Engine.GetPlayerDataEx( f17_arg0, CoD.StatsGroup.Ranked, "leaderBoardData", f17_local5 .. "TimePlayed" )
		local f17_local10 = {
			name = Engine.Localize( f17_local1[f17_local5].name ),
			image = f17_local1[f17_local5].image,
			desc = Engine.Localize( f17_local1[f17_local5].desc ),
			gametype = f17_local5,
			score = Engine.GetPlayerDataEx( f17_arg0, CoD.StatsGroup.Ranked, "leaderBoardData", f17_local5 .. "Score" ),
			timePlayed = Engine.FormatTimeSmall( f17_local9 ),
			kills = Engine.GetPlayerDataEx( f17_arg0, CoD.StatsGroup.Ranked, "leaderBoardData", f17_local5 .. "Kills" ),
			deaths = Engine.GetPlayerDataEx( f17_arg0, CoD.StatsGroup.Ranked, "leaderBoardData", f17_local5 .. "Deaths" ),
			extraStat1 = Engine.GetPlayerDataEx( f17_arg0, CoD.StatsGroup.Ranked, "leaderBoardData", f17_local5 .. f17_local8[1] ),
			extraStat1Name = f17_local8[1],
			extraStat2 = Engine.GetPlayerDataEx( f17_arg0, CoD.StatsGroup.Ranked, "leaderBoardData", f17_local5 .. f17_local8[2] ),
			extraStat2Name = f17_local8[2]
		}
		local f17_local11 = f17_local9 / 60
		local f17_local12 = f17_local10.score
		if f17_local11 ~= 0 then
			local f17_local7 = f17_local11
		end
		f17_local10.spm = f17_local12 / (f17_local7 or 1)
		f17_local10.kdr = f17_local10.kills / (f17_local10.deaths and f17_local10.deaths or 1)
		table.insert( f17_local2, f17_local10 )
	end
	table.sort( f17_local2, function ( f18_arg0, f18_arg1 )
		return f18_arg1.spm < f18_arg0.spm
	end )
	return f17_local2
end

MP.nonRecipeOptionsDefaults = {
	killswitch_simultaneous_deaths = {
		type = DvarTypeTable.DvarBool,
		val = true
	},
	draftLoadoutTimer = {
		type = "EngineIntFunc",
		val = function ()
			return IsMlgGameBattlesMatch() and 30 or 75
		end,
		getFunc = Lobby.GetDraftLoadoutTimer,
		setFunc = Lobby.SetDraftLoadoutTimer
	},
	draftRigTimer = {
		type = "EngineIntFunc",
		val = 30,
		getFunc = Lobby.GetDraftRigTimer,
		setFunc = Lobby.SetDraftRigTimer
	}
}
MP.AreNonRecipeOptionsDefault = function ()
	local f20_local0 = true
	for f20_local6, f20_local7 in pairs( MP.nonRecipeOptionsDefaults ) do
		local f20_local4 = nil
		if f20_local7.type == "EngineIntFunc" then
			f20_local4 = f20_local7.getFunc()
		elseif f20_local7.type == DvarTypeTable.DvarInt then
			f20_local4 = Engine.GetDvarInt( f20_local6 )
		elseif f20_local7.type == DvarTypeTable.DvarBool then
			f20_local4 = Engine.GetDvarBool( f20_local6 )
		else
			f20_local4 = nil
		end
		local f20_local5 = f20_local7.val
		if type( f20_local7.val ) == "function" then
			f20_local5 = f20_local7.val()
		end
		if f20_local4 ~= f20_local5 then
			f20_local0 = false
		end
	end
	return f20_local0
end

MP.ResetNonRecipeOptionsToDefaults = function ()
	for f21_local4, f21_local5 in pairs( MP.nonRecipeOptionsDefaults ) do
		local f21_local3 = f21_local5.val
		if type( f21_local5.val ) == "function" then
			f21_local3 = f21_local5.val()
		end
		if f21_local5.type == "EngineIntFunc" then
			f21_local5.setFunc( f21_local3 )
		end
		if f21_local5.type == DvarTypeTable.DvarInt then
			Engine.SetDvarInt( f21_local4, f21_local3 )
		end
		if f21_local5.type == DvarTypeTable.DvarBool then
			Engine.SetDvarBool( f21_local4, f21_local3 )
		end
	end
end

