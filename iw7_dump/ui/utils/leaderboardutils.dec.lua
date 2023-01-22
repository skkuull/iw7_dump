Leaderboards.Filters = {
	None = {
		Title = "LUA_MENU_LB_FILTER_GROUP_ALL",
		OptionText = "LUA_MENU_LB_FILTER_GROUP_ALL",
		Value = 0
	},
	Friends = {
		Title = "LUA_MENU_LB_FILTER_GROUP_FRIENDS",
		OptionText = "LUA_MENU_LB_FILTER_GROUP_FRIENDS",
		Value = 1
	}
}
Leaderboards.HeaderNames = {
	Accuracy = "LUA_MENU_ACCURACY_CAPS",
	Assists = "LUA_MENU_ASSISTS_CAPS",
	AvgCaptures = "LUA_MENU_AVG_CAPTURES_CAPS",
	AvgChains = "LUA_MENU_AVG_CHAINS_CAPS",
	AvgKills = "LUA_MENU_AVG_KILLS_CAPS",
	AvgScore = "LUA_MENU_AVG_SCORE_CAPS",
	Banks = "LUA_MENU_MP_BANKS_CAPS",
	Captures = "LUA_MENU_CAPTURES_CAPS",
	Carries = "LUA_MENU_MP_CARRIES",
	Combo = "LUA_MENU_MP_COMBO_CAPS",
	Confirms = "LUA_MENU_CONFIRMS_CAPS",
	Crates = "LUA_MENU_CRATES",
	Deaths = "LUA_MENU_DEATHS_CAPS",
	Defends = "LUA_MENU_DEFENDS_CAPS",
	Defuses = "LUA_MENU_DEFUSES_CAPS",
	Denies = "LUA_MENU_DENIES_CAPS",
	Downed = "LUA_MENU_DOWNED_CAPS",
	Games = "LUA_MENU_GAMES_CAPS",
	Hits = "LUA_MENU_HITS_CAPS",
	Infected = "LUA_MENU_INFECTED_SCOREBOARD",
	InfectedKills = "LUA_MENU_INFECTED_KILLS_CAPS",
	KillChains = "LUA_MENU_KILL_CHAINS_CAPS",
	Kills = "LUA_MENU_KILLS_CAPS",
	Losses = "LUA_MENU_LOSSES_CAPS",
	MaxWave = "LUA_MENU_MAX_WAVE_CAPS",
	MaxWeaponLevel = "LUA_MENU_MAX_WEAPON_LEVEL_CAPS",
	Melees = "LUA_MENU_MP_MELEES",
	Misses = "LUA_MENU_MISSES_CAPS",
	PerGame = "LUA_MENU_PER_GAME_CAPS",
	Plants = "LUA_MENU_PLANTS_CAPS",
	Points = "LUA_MENU_MP_POINTS_CAPS",
	Ratio = "LUA_MENU_RATIO_CAPS",
	Rescues = "LUA_MENU_RESCUES_CAPS",
	Returns = "MENU_RETURNS_CAPS",
	Revives = "LUA_MENU_REVIVES_CAPS",
	Score = "LUA_MENU_SCORE_CAPS",
	Setbacks = "LUA_MENU_MP_SETBACKS",
	SPM = "LUA_MENU_MP_SPM",
	Stabs = "LUA_MENU_MP_STABS_CAPS",
	Streak = "LUA_MENU_STREAK_CAPS",
	SurvivorKills = "LUA_MENU_SURVIVOR_KILLS_CAPS",
	Throws = "LUA_MENU_MP_THROWS",
	Time = "LUA_MENU_TIME",
	TimePlayed = "LUA_MENU_TIME_PLAYED_CAPS",
	Wave = "LUA_MENU_WAVE_CAPS",
	Waves = "MENU_WAVES_CAPS",
	Wins = "LUA_MENU_WINS_CAPS",
	ShotsFired = "LUA_MENU_ZM_SHOTS_FIRED",
	ShotsOnTarget = "LUA_MENU_ZM_SHOTS_ON_TARGET",
	Headshots = "LUA_MENU_ZM_HEADSHOTS",
	ExplosiveKills = "LUA_MENU_ZM_EXPLOSIVE_KILLS",
	DoorsOpened = "LUA_MENU_ZM_DOORS_OPENED",
	PerksUsed = "LUA_MENU_ZM_PERKS_USED",
	Downs = "LUA_MENU_ZM_DOWNS",
	Rounds = "LUA_MENU_ZM_ROUNDS"
}
Leaderboards.Boards = {
	Score = {
		Title = "LUA_MENU_SCORE_CAPS",
		Desc = "LUA_MENU_CHECK_HOW_YOUR_SCORE",
		file = "LB_VR_TOTALXP",
		extraColumns = {
			{
				key = "Score",
				title = Leaderboards.HeaderNames.Score
			},
			{
				key = "Time Played",
				title = Leaderboards.HeaderNames.TimePlayed
			},
			{
				key = "Games Played",
				title = Leaderboards.HeaderNames.Games
			},
			{
				key = "Avg Score",
				title = Leaderboards.HeaderNames.AvgScore
			}
		}
	},
	Wins = {
		Title = "LUA_MENU_WINS_CAPS",
		Desc = "LUA_MENU_DESC_LEADERBOARD_WINS",
		file = "LB_VR_WINS",
		extraColumns = {
			{
				key = "Wins",
				title = Leaderboards.HeaderNames.Wins
			},
			{
				key = "Losses",
				title = Leaderboards.HeaderNames.Losses
			},
			{
				key = "Win/Loose Ratio",
				title = Leaderboards.HeaderNames.Ratio
			},
			{
				key = "Win Streak",
				title = Leaderboards.HeaderNames.Streak
			}
		}
	},
	Kills = {
		Title = "LUA_MENU_KILLS_CAPS",
		Desc = "LUA_MENU_DESC_LEADERBOARD_KILLS",
		file = "LB_VR_KILLS",
		extraColumns = {
			{
				key = "Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "Deaths",
				title = Leaderboards.HeaderNames.Deaths
			},
			{
				key = "Kill/Death Ratio",
				title = Leaderboards.HeaderNames.Ratio
			},
			{
				key = "Kill Streak",
				title = Leaderboards.HeaderNames.Streak
			},
			{
				key = "Avg Kills",
				title = Leaderboards.HeaderNames.AvgKills
			}
		}
	},
	Accuracy = {
		Title = "LUA_MENU_ACCURACY_CAPS",
		Desc = "LUA_MENU_DESC_LEADERBOARD_ACCURACY",
		file = "LB_VR_ACCURACY",
		extraColumns = {
			{
				key = "Accuracy",
				title = Leaderboards.HeaderNames.Accuracy
			},
			{
				key = "Hits",
				title = Leaderboards.HeaderNames.Hits
			},
			{
				key = "Misses",
				title = Leaderboards.HeaderNames.Misses
			}
		}
	},
	FreeForAll = {
		Title = "LUA_MENU_MP_DEATHMATCH_CAPS",
		Desc = "LUA_MENU_MP_DESC_LEADERBOARD_DM",
		file = "LB_GM_DM",
		extraColumns = {
			{
				key = "Score",
				title = Leaderboards.HeaderNames.SPM
			},
			{
				key = "Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "Deaths",
				title = Leaderboards.HeaderNames.Deaths
			},
			{
				key = "Kill/Death Ratio",
				title = Leaderboards.HeaderNames.Ratio
			},
			{
				key = "Streak",
				title = Leaderboards.HeaderNames.Streak
			}
		}
	},
	TeamDeathmatch = {
		Title = "LUA_MENU_MP_WAR_CAPS",
		Desc = "LUA_MENU_MP_DESC_LEADERBOARD_WAR",
		hasHardcoreMode = true,
		file = "LB_GM_WAR",
		extraColumns = {
			{
				key = "Score",
				title = Leaderboards.HeaderNames.SPM
			},
			{
				key = "Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "Deaths",
				title = Leaderboards.HeaderNames.Deaths
			},
			{
				key = "Kill/Death Ratio",
				title = Leaderboards.HeaderNames.Ratio
			},
			{
				key = "Assists",
				title = Leaderboards.HeaderNames.Assists
			}
		}
	},
	Frontline = {
		Title = "LUA_MENU_MP_FRONTLINE_CAPS",
		Desc = "LUA_MENU_MP_DESC_LEADERBOARD_FRONT",
		file = "LB_GM_FRONT",
		extraColumns = {
			{
				key = "Score",
				title = Leaderboards.HeaderNames.SPM
			},
			{
				key = "Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "Deaths",
				title = Leaderboards.HeaderNames.Deaths
			},
			{
				key = "Kill/Death Ratio",
				title = Leaderboards.HeaderNames.Ratio
			},
			{
				key = "Assists",
				title = Leaderboards.HeaderNames.Assists
			}
		}
	},
	GunGame = {
		Title = "LUA_MENU_MP_GUN_CAPS",
		Desc = "LUA_MENU_MP_DESC_LEADERBOARD_GUN",
		file = "LB_GM_GUN",
		extraColumns = {
			{
				key = "Score",
				title = Leaderboards.HeaderNames.SPM
			},
			{
				key = "Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "Deaths",
				title = Leaderboards.HeaderNames.Deaths
			},
			{
				key = "Melees",
				title = Leaderboards.HeaderNames.Melees
			},
			{
				key = "Setbacks",
				title = Leaderboards.HeaderNames.Setbacks
			}
		}
	},
	SearchAndRescue = {
		Title = "LUA_MENU_MP_SR_CAPS",
		Desc = "LUA_MENU_MP_DESC_LEADERBOARD_SR",
		file = "LB_GM_SR",
		extraColumns = {
			{
				key = "Score",
				title = Leaderboards.HeaderNames.SPM
			},
			{
				key = "Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "Deaths",
				title = Leaderboards.HeaderNames.Deaths
			},
			{
				key = "Plants",
				title = Leaderboards.HeaderNames.Plants
			},
			{
				key = "Rescues",
				title = Leaderboards.HeaderNames.Rescues
			}
		}
	},
	SearchAndDestroy = {
		Title = "LUA_MENU_MP_SD_CAPS",
		Desc = "LUA_MENU_MP_DESC_LEADERBOARD_SD",
		hasHardcoreMode = true,
		file = "LB_GM_SD",
		extraColumns = {
			{
				key = "Score",
				title = Leaderboards.HeaderNames.SPM
			},
			{
				key = "Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "Deaths",
				title = Leaderboards.HeaderNames.Deaths
			},
			{
				key = "Plants",
				title = Leaderboards.HeaderNames.Plants
			},
			{
				key = "Defuses",
				title = Leaderboards.HeaderNames.Defuses
			}
		}
	},
	Domination = {
		Title = "LUA_MENU_MP_DOMINATION_CAPS",
		Desc = "LUA_MENU_MP_DESC_LEADERBOARD_DOM",
		hasHardcoreMode = true,
		file = "LB_GM_DOM",
		extraColumns = {
			{
				key = "Score",
				title = Leaderboards.HeaderNames.SPM
			},
			{
				key = "Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "Deaths",
				title = Leaderboards.HeaderNames.Deaths
			},
			{
				key = "Captures",
				title = Leaderboards.HeaderNames.Captures
			},
			{
				key = "Defends",
				title = Leaderboards.HeaderNames.Defends
			}
		}
	},
	KillConfirmed = {
		Title = "LUA_MENU_MP_CONF_CAPS",
		Desc = "LUA_MENU_MP_DESC_LEADERBOARD_CONF",
		hasHardcoreMode = true,
		file = "LB_GM_CONF",
		extraColumns = {
			{
				key = "Score",
				title = Leaderboards.HeaderNames.SPM
			},
			{
				key = "Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "Deaths",
				title = Leaderboards.HeaderNames.Deaths
			},
			{
				key = "Confirms",
				title = Leaderboards.HeaderNames.Confirms
			},
			{
				key = "Denies",
				title = Leaderboards.HeaderNames.Denies
			}
		}
	},
	Infected = {
		Title = "LUA_MENU_MP_INFECT_CAPS",
		Desc = "LUA_MENU_MP_DESC_LEADERBOARD_INFECT",
		file = "LB_GM_INFECT",
		extraColumns = {
			{
				key = "Score",
				title = Leaderboards.HeaderNames.SPM
			},
			{
				key = "Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "Deaths",
				title = Leaderboards.HeaderNames.Deaths
			},
			{
				key = "Time",
				title = Leaderboards.HeaderNames.Time
			},
			{
				key = "Infected",
				title = Leaderboards.HeaderNames.Infected
			}
		}
	},
	Demolition = {
		Title = "LUA_MENU_MP_DEMOLITION_CAPS",
		Desc = "LUA_MENU_MP_DESC_LEADERBOARD_DEMOLITION",
		file = "LB_GM_DD",
		extraColumns = {
			{
				key = "Score",
				title = Leaderboards.HeaderNames.SPM
			},
			{
				key = "Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "Deaths",
				title = Leaderboards.HeaderNames.Deaths
			},
			{
				key = "Plants",
				title = Leaderboards.HeaderNames.Plants
			},
			{
				key = "Defuses",
				title = Leaderboards.HeaderNames.Defuses
			}
		}
	},
	Hardpoint = {
		Title = "LUA_MENU_MP_HARDPOINT_CAPS",
		Desc = "LUA_MENU_MP_DESC_LEADERBOARD_HARDPOINT",
		file = "LB_GM_KOTH",
		extraColumns = {
			{
				key = "Score",
				title = Leaderboards.HeaderNames.SPM
			},
			{
				key = "Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "Deaths",
				title = Leaderboards.HeaderNames.Deaths
			},
			{
				key = "Time",
				title = Leaderboards.HeaderNames.Time
			},
			{
				key = "Defends",
				title = Leaderboards.HeaderNames.Defends
			}
		}
	},
	CaptureTheFlag = {
		Title = "LUA_MENU_MP_CTF_CAPS",
		Desc = "LUA_MENU_MP_DESC_LEADERBOARD_CTF",
		file = "LB_GM_CTF",
		extraColumns = {
			{
				key = "Score",
				title = Leaderboards.HeaderNames.SPM
			},
			{
				key = "Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "Deaths",
				title = Leaderboards.HeaderNames.Deaths
			},
			{
				key = "Captures",
				title = Leaderboards.HeaderNames.Captures
			},
			{
				key = "Returns",
				title = Leaderboards.HeaderNames.Returns
			}
		}
	},
	Defender = {
		Title = "LUA_MENU_MP_TDEF",
		Desc = "LUA_MENU_MP_DESC_LEADERBOARD_TDEF",
		file = "LB_GM_TDEF",
		extraColumns = {
			{
				key = "Score",
				title = Leaderboards.HeaderNames.SPM
			},
			{
				key = "Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "Deaths",
				title = Leaderboards.HeaderNames.Deaths
			},
			{
				key = "Time",
				title = Leaderboards.HeaderNames.Time
			},
			{
				key = "Captures",
				title = Leaderboards.HeaderNames.Captures
			}
		}
	},
	Uplink = {
		Title = "LUA_MENU_MP_UPLINK_CAPS",
		Desc = "LUA_MENU_MP_DESC_LEADERBOARD_UPLINK",
		file = "LB_GM_BALL",
		extraColumns = {
			{
				key = "Score",
				title = Leaderboards.HeaderNames.SPM
			},
			{
				key = "Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "Deaths",
				title = Leaderboards.HeaderNames.Deaths
			},
			{
				key = "Carries",
				title = Leaderboards.HeaderNames.Carries
			},
			{
				key = "Throws",
				title = Leaderboards.HeaderNames.Throws
			}
		}
	},
	Grind = {
		Title = "LUA_MENU_MP_GRIND_CAPS",
		Desc = "LUA_MENU_MP_DESC_LEADERBOARD_GRIND",
		file = "LB_GM_GRIND",
		extraColumns = {
			{
				key = "Score",
				title = Leaderboards.HeaderNames.SPM
			},
			{
				key = "Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "Deaths",
				title = Leaderboards.HeaderNames.Deaths
			},
			{
				key = "Banks",
				title = Leaderboards.HeaderNames.Banks
			},
			{
				key = "Denies",
				title = Leaderboards.HeaderNames.Denies
			}
		}
	},
	Reinforce = {
		Title = "LUA_MENU_MP_SIEGE_CAPS",
		Desc = "LUA_MENU_MP_DESC_LEADERBOARD_SIEGE",
		file = "LB_GM_SIEGE",
		extraColumns = {
			{
				key = "Score",
				title = Leaderboards.HeaderNames.SPM
			},
			{
				key = "Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "Deaths",
				title = Leaderboards.HeaderNames.Deaths
			},
			{
				key = "Captures",
				title = Leaderboards.HeaderNames.Captures
			},
			{
				key = "Revives",
				title = Leaderboards.HeaderNames.Revives
			}
		}
	},
	DropZone = {
		Title = "LUA_MENU_MP_GRND_CAPS",
		Desc = "LUA_MENU_MP_DESC_LEADERBOARD_GRND",
		file = "LB_GM_GRND",
		extraColumns = {
			{
				key = "Score",
				title = Leaderboards.HeaderNames.SPM
			},
			{
				key = "Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "Deaths",
				title = Leaderboards.HeaderNames.Deaths
			},
			{
				key = "Time",
				title = Leaderboards.HeaderNames.Time
			},
			{
				key = "Crates",
				title = Leaderboards.HeaderNames.Crates
			}
		}
	},
	ShotsOnTarget = {
		Title = "LUA_MENU_ZM_SHOTS_ON_TARGET",
		Desc = "LUA_MENU_ZM_SHOTS_ON_TARGET_DESC",
		file = "LB_VR_ZM_HITS",
		extraColumns = {
			{
				key = "Shots on Target",
				title = Leaderboards.HeaderNames.ShotsOnTarget
			}
		}
	},
	Headshots = {
		Title = "LUA_MENU_ZM_HEADSHOTS",
		Desc = "LUA_MENU_ZM_HEADSHOTS_DESC",
		file = "LB_VR_ZM_HEADSHOTS",
		extraColumns = {
			{
				key = "Headshots",
				title = Leaderboards.HeaderNames.Headshots
			}
		}
	},
	ExplosiveKills = {
		Title = "LUA_MENU_ZM_EXPLOSIVE_KILLS",
		Desc = "LUA_MENU_ZM_EXPLOSIVE_KILLS",
		file = "LB_VR_ZM_EXPLOSIVES",
		extraColumns = {
			{
				key = "Explosive Kills",
				title = Leaderboards.HeaderNames.ExplosiveKills
			}
		}
	},
	DoorsOpened = {
		Title = "LUA_MENU_ZM_DOORS_OPENED",
		Desc = "LUA_MENU_ZM_DOORS_OPENED_DESC",
		file = "LB_VR_ZM_DOORS",
		extraColumns = {
			{
				key = "Doors Opened",
				title = Leaderboards.HeaderNames.DoorsOpened
			}
		}
	},
	PerksUsed = {
		Title = "LUA_MENU_ZM_PERKS_USED",
		Desc = "LUA_MENU_ZM_PERKS_USED_DESC",
		file = "LB_VR_ZM_PERKS",
		extraColumns = {
			{
				key = "Perks Used",
				title = Leaderboards.HeaderNames.PerksUsed
			}
		}
	},
	Revives = {
		Title = "LUA_MENU_ZM_REVIVES",
		Desc = "LUA_MENU_ZM_REVIVES_DESC",
		file = "LB_VR_ZM_REVIVES",
		extraColumns = {
			{
				key = "Revives",
				title = Leaderboards.HeaderNames.Revives
			}
		}
	},
	cpFINALSolo = {
		Title = "LUA_MENU_ZM_SOLO_LEADERBOARD_FINAL",
		Desc = "LUA_MENU_ZM_SOLO_LEADERBOARD_FINAL_DESC",
		MapName = "cp_final",
		file = "LB_VR_ZM_M5_P1",
		extraColumns = {
			{
				key = "M5 P1 Rounds",
				title = Leaderboards.HeaderNames.Rounds
			},
			{
				key = "M5 P1 Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "M5 P1 Revives",
				title = Leaderboards.HeaderNames.Revives
			},
			{
				key = "M5 P1 Headshots",
				title = Leaderboards.HeaderNames.Headshots
			},
			{
				key = "M5 P1 Downs",
				title = Leaderboards.HeaderNames.Downs
			}
		}
	},
	cpFINALCoopTwoPlayers = {
		Title = "LUA_MENU_ZM_TWO_PLAYER_LEADERBOARD_FINAL",
		Desc = "LUA_MENU_ZM_TWO_PLAYER_LEADERBOARD_FINAL_DESC",
		MapName = "cp_final",
		isAlienCoop = true,
		file = "LB_VR_ZM_M5_P2",
		extraColumns = {
			{
				key = "M5 P2 Rounds",
				title = Leaderboards.HeaderNames.Rounds
			},
			{
				key = "M5 P2 Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "M5 P2 Revives",
				title = Leaderboards.HeaderNames.Revives
			},
			{
				key = "M5 P2 Headshots",
				title = Leaderboards.HeaderNames.Headshots
			},
			{
				key = "M5 P2 Downs",
				title = Leaderboards.HeaderNames.Downs
			}
		}
	},
	cpFINALCoopThreePlayers = {
		Title = "LUA_MENU_ZM_THREE_PLAYER_LEADERBOARD_FINAL",
		Desc = "LUA_MENU_ZM_THREE_PLAYER_LEADERBOARD_FINAL_DESC",
		MapName = "cp_final",
		isAlienCoop = true,
		file = "LB_VR_ZM_M5_P3",
		extraColumns = {
			{
				key = "M5 P3 Rounds",
				title = Leaderboards.HeaderNames.Rounds
			},
			{
				key = "M5 P3 Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "M5 P3 Revives",
				title = Leaderboards.HeaderNames.Revives
			},
			{
				key = "M5 P3 Headshots",
				title = Leaderboards.HeaderNames.Headshots
			},
			{
				key = "M5 P3 Downs",
				title = Leaderboards.HeaderNames.Downs
			}
		}
	},
	cpFINALCoopFourPlayers = {
		Title = "LUA_MENU_ZM_FOUR_PLAYER_LEADERBOARD_FINAL",
		Desc = "LUA_MENU_ZM_FOUR_PLAYER_LEADERBOARD_FINAL_DESC",
		MapName = "cp_final",
		isAlienCoop = true,
		file = "LB_VR_ZM_M5_P4",
		extraColumns = {
			{
				key = "M5 P4 Rounds",
				title = Leaderboards.HeaderNames.Rounds
			},
			{
				key = "M5 P4 Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "M5 P4 Revives",
				title = Leaderboards.HeaderNames.Revives
			},
			{
				key = "M5 P4 Headshots",
				title = Leaderboards.HeaderNames.Headshots
			},
			{
				key = "M5 P4 Downs",
				title = Leaderboards.HeaderNames.Downs
			}
		}
	},
	cpTOWNSolo = {
		Title = "LUA_MENU_ZM_SOLO_LEADERBOARD_TOWN",
		Desc = "LUA_MENU_ZM_SOLO_LEADERBOARD_TOWN_DESC",
		MapName = "cp_town",
		file = "LB_VR_ZM_M4_P1",
		extraColumns = {
			{
				key = "M4 P1 Rounds",
				title = Leaderboards.HeaderNames.Rounds
			},
			{
				key = "M4 P1 Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "M4 P1 Revives",
				title = Leaderboards.HeaderNames.Revives
			},
			{
				key = "M4 P1 Headshots",
				title = Leaderboards.HeaderNames.Headshots
			},
			{
				key = "M4 P1 Downs",
				title = Leaderboards.HeaderNames.Downs
			}
		}
	},
	cpTOWNCoopTwoPlayers = {
		Title = "LUA_MENU_ZM_TWO_PLAYER_LEADERBOARD_TOWN",
		Desc = "LUA_MENU_ZM_TWO_PLAYER_LEADERBOARD_TOWN_DESC",
		MapName = "cp_town",
		isAlienCoop = true,
		file = "LB_VR_ZM_M4_P2",
		extraColumns = {
			{
				key = "M4 P2 Rounds",
				title = Leaderboards.HeaderNames.Rounds
			},
			{
				key = "M4 P2 Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "M4 P2 Revives",
				title = Leaderboards.HeaderNames.Revives
			},
			{
				key = "M4 P2 Headshots",
				title = Leaderboards.HeaderNames.Headshots
			},
			{
				key = "M4 P2 Downs",
				title = Leaderboards.HeaderNames.Downs
			}
		}
	},
	cpTOWNCoopThreePlayers = {
		Title = "LUA_MENU_ZM_THREE_PLAYER_LEADERBOARD_TOWN",
		Desc = "LUA_MENU_ZM_THREE_PLAYER_LEADERBOARD_TOWN_DESC",
		MapName = "cp_town",
		isAlienCoop = true,
		file = "LB_VR_ZM_M4_P3",
		extraColumns = {
			{
				key = "M4 P3 Rounds",
				title = Leaderboards.HeaderNames.Rounds
			},
			{
				key = "M4 P3 Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "M4 P3 Revives",
				title = Leaderboards.HeaderNames.Revives
			},
			{
				key = "M4 P3 Headshots",
				title = Leaderboards.HeaderNames.Headshots
			},
			{
				key = "M4 P3 Downs",
				title = Leaderboards.HeaderNames.Downs
			}
		}
	},
	cpTOWNCoopFourPlayers = {
		Title = "LUA_MENU_ZM_FOUR_PLAYER_LEADERBOARD_TOWN",
		Desc = "LUA_MENU_ZM_FOUR_PLAYER_LEADERBOARD_TOWN_DESC",
		MapName = "cp_town",
		isAlienCoop = true,
		file = "LB_VR_ZM_M4_P4",
		extraColumns = {
			{
				key = "M4 P4 Rounds",
				title = Leaderboards.HeaderNames.Rounds
			},
			{
				key = "M4 P4 Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "M4 P4 Revives",
				title = Leaderboards.HeaderNames.Revives
			},
			{
				key = "M4 P4 Headshots",
				title = Leaderboards.HeaderNames.Headshots
			},
			{
				key = "M4 P4 Downs",
				title = Leaderboards.HeaderNames.Downs
			}
		}
	},
	cpDISCOSolo = {
		Title = "LUA_MENU_ZM_SOLO_LEADERBOARD_DISCO",
		Desc = "LUA_MENU_ZM_SOLO_LEADERBOARD_DISCO_DESC",
		MapName = "cp_disco",
		file = "LB_VR_ZM_M3_P1",
		extraColumns = {
			{
				key = "M3 P1 Rounds",
				title = Leaderboards.HeaderNames.Rounds
			},
			{
				key = "M3 P1 Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "M3 P1 Revives",
				title = Leaderboards.HeaderNames.Revives
			},
			{
				key = "M3 P1 Headshots",
				title = Leaderboards.HeaderNames.Headshots
			},
			{
				key = "M3 P1 Downs",
				title = Leaderboards.HeaderNames.Downs
			}
		}
	},
	cpDISCOCoopTwoPlayers = {
		Title = "LUA_MENU_ZM_TWO_PLAYER_LEADERBOARD_DISCO",
		Desc = "LUA_MENU_ZM_TWO_PLAYER_LEADERBOARD_DISCO_DESC",
		MapName = "cp_disco",
		isAlienCoop = true,
		file = "LB_VR_ZM_M3_P2",
		extraColumns = {
			{
				key = "M3 P2 Rounds",
				title = Leaderboards.HeaderNames.Rounds
			},
			{
				key = "M3 P2 Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "M3 P2 Revives",
				title = Leaderboards.HeaderNames.Revives
			},
			{
				key = "M3 P2 Headshots",
				title = Leaderboards.HeaderNames.Headshots
			},
			{
				key = "M3 P2 Downs",
				title = Leaderboards.HeaderNames.Downs
			}
		}
	},
	cpDISCOCoopThreePlayers = {
		Title = "LUA_MENU_ZM_THREE_PLAYER_LEADERBOARD_DISCO",
		Desc = "LUA_MENU_ZM_THREE_PLAYER_LEADERBOARD_DISCO_DESC",
		MapName = "cp_disco",
		isAlienCoop = true,
		file = "LB_VR_ZM_M3_P3",
		extraColumns = {
			{
				key = "M3 P3 Rounds",
				title = Leaderboards.HeaderNames.Rounds
			},
			{
				key = "M3 P3 Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "M3 P3 Revives",
				title = Leaderboards.HeaderNames.Revives
			},
			{
				key = "M3 P3 Headshots",
				title = Leaderboards.HeaderNames.Headshots
			},
			{
				key = "M3 P3 Downs",
				title = Leaderboards.HeaderNames.Downs
			}
		}
	},
	cpDISCOCoopFourPlayers = {
		Title = "LUA_MENU_ZM_FOUR_PLAYER_LEADERBOARD_DISCO",
		Desc = "LUA_MENU_ZM_FOUR_PLAYER_LEADERBOARD_DISCO_DESC",
		MapName = "cp_disco",
		isAlienCoop = true,
		file = "LB_VR_ZM_M3_P4",
		extraColumns = {
			{
				key = "M3 P4 Rounds",
				title = Leaderboards.HeaderNames.Rounds
			},
			{
				key = "M3 P4 Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "M3 P4 Revives",
				title = Leaderboards.HeaderNames.Revives
			},
			{
				key = "M3 P4 Headshots",
				title = Leaderboards.HeaderNames.Headshots
			},
			{
				key = "M3 P4 Downs",
				title = Leaderboards.HeaderNames.Downs
			}
		}
	},
	cpRAVESolo = {
		Title = "LUA_MENU_ZM_SOLO_LEADERBOARD_RAVE",
		Desc = "LUA_MENU_ZM_SOLO_LEADERBOARD_RAVE_DESC",
		MapName = "cp_rave",
		file = "LB_VR_ZM_M2_P1",
		extraColumns = {
			{
				key = "M2 P1 Rounds",
				title = Leaderboards.HeaderNames.Rounds
			},
			{
				key = "M2 P1 Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "M2 P1 Revives",
				title = Leaderboards.HeaderNames.Revives
			},
			{
				key = "M2 P1 Headshots",
				title = Leaderboards.HeaderNames.Headshots
			},
			{
				key = "M2 P1 Downs",
				title = Leaderboards.HeaderNames.Downs
			}
		}
	},
	cpRAVECoopTwoPlayers = {
		Title = "LUA_MENU_ZM_TWO_PLAYER_LEADERBOARD_RAVE",
		Desc = "LUA_MENU_ZM_TWO_PLAYER_LEADERBOARD_RAVE_DESC",
		MapName = "cp_rave",
		isAlienCoop = true,
		file = "LB_VR_ZM_M2_P2",
		extraColumns = {
			{
				key = "M2 P2 Rounds",
				title = Leaderboards.HeaderNames.Rounds
			},
			{
				key = "M2 P2 Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "M2 P2 Revives",
				title = Leaderboards.HeaderNames.Revives
			},
			{
				key = "M2 P2 Headshots",
				title = Leaderboards.HeaderNames.Headshots
			},
			{
				key = "M2 P2 Downs",
				title = Leaderboards.HeaderNames.Downs
			}
		}
	},
	cpRAVECoopThreePlayers = {
		Title = "LUA_MENU_ZM_THREE_PLAYER_LEADERBOARD_RAVE",
		Desc = "LUA_MENU_ZM_THREE_PLAYER_LEADERBOARD_RAVE_DESC",
		MapName = "cp_rave",
		isAlienCoop = true,
		file = "LB_VR_ZM_M2_P3",
		extraColumns = {
			{
				key = "M2 P3 Rounds",
				title = Leaderboards.HeaderNames.Rounds
			},
			{
				key = "M2 P3 Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "M2 P3 Revives",
				title = Leaderboards.HeaderNames.Revives
			},
			{
				key = "M2 P3 Headshots",
				title = Leaderboards.HeaderNames.Headshots
			},
			{
				key = "M2 P3 Downs",
				title = Leaderboards.HeaderNames.Downs
			}
		}
	},
	cpRAVECoopFourPlayers = {
		Title = "LUA_MENU_ZM_FOUR_PLAYER_LEADERBOARD_RAVE",
		Desc = "LUA_MENU_ZM_FOUR_PLAYER_LEADERBOARD_RAVE_DESC",
		MapName = "cp_rave",
		isAlienCoop = true,
		file = "LB_VR_ZM_M2_P4",
		extraColumns = {
			{
				key = "M2 P4 Rounds",
				title = Leaderboards.HeaderNames.Rounds
			},
			{
				key = "M2 P4 Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "M2 P4 Revives",
				title = Leaderboards.HeaderNames.Revives
			},
			{
				key = "M2 P4 Headshots",
				title = Leaderboards.HeaderNames.Headshots
			},
			{
				key = "M2 P4 Downs",
				title = Leaderboards.HeaderNames.Downs
			}
		}
	},
	cpZMBSolo = {
		Title = "LUA_MENU_ZM_SOLO_LEADERBOARD",
		Desc = "LUA_MENU_ZM_SOLO_LEADERBOARD_DESC",
		MapName = "cp_zmb",
		file = "LB_VR_ZM_M1_P1",
		extraColumns = {
			{
				key = "M1 P1 Rounds",
				title = Leaderboards.HeaderNames.Rounds
			},
			{
				key = "M1 P1 Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "M1 P1 Revives",
				title = Leaderboards.HeaderNames.Revives
			},
			{
				key = "M1 P1 Headshots",
				title = Leaderboards.HeaderNames.Headshots
			},
			{
				key = "M1 P1 Downs",
				title = Leaderboards.HeaderNames.Downs
			}
		}
	},
	cpZMBCoopTwoPlayers = {
		Title = "LUA_MENU_ZM_TWO_PLAYER_LEADERBOARD",
		Desc = "LUA_MENU_ZM_TWO_PLAYER_LEADERBOARD_DESC",
		MapName = "cp_zmb",
		isAlienCoop = true,
		file = "LB_VR_ZM_M1_P2",
		extraColumns = {
			{
				key = "M1 P2 Rounds",
				title = Leaderboards.HeaderNames.Rounds
			},
			{
				key = "M1 P2 Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "M1 P2 Revives",
				title = Leaderboards.HeaderNames.Revives
			},
			{
				key = "M1 P2 Headshots",
				title = Leaderboards.HeaderNames.Headshots
			},
			{
				key = "M1 P2 Downs",
				title = Leaderboards.HeaderNames.Downs
			}
		}
	},
	cpZMBCoopThreePlayers = {
		Title = "LUA_MENU_ZM_THREE_PLAYER_LEADERBOARD",
		Desc = "LUA_MENU_ZM_THREE_PLAYER_LEADERBOARD_DESC",
		MapName = "cp_zmb",
		isAlienCoop = true,
		file = "LB_VR_ZM_M1_P3",
		extraColumns = {
			{
				key = "M1 P3 Rounds",
				title = Leaderboards.HeaderNames.Rounds
			},
			{
				key = "M1 P3 Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "M1 P3 Revives",
				title = Leaderboards.HeaderNames.Revives
			},
			{
				key = "M1 P3 Headshots",
				title = Leaderboards.HeaderNames.Headshots
			},
			{
				key = "M1 P3 Downs",
				title = Leaderboards.HeaderNames.Downs
			}
		}
	},
	cpZMBCoopFourPlayers = {
		Title = "LUA_MENU_ZM_FOUR_PLAYER_LEADERBOARD",
		Desc = "LUA_MENU_ZM_FOUR_PLAYER_LEADERBOARD_DESC",
		MapName = "cp_zmb",
		isAlienCoop = true,
		file = "LB_VR_ZM_M1_P4",
		extraColumns = {
			{
				key = "M1 P4 Rounds",
				title = Leaderboards.HeaderNames.Rounds
			},
			{
				key = "M1 P4 Kills",
				title = Leaderboards.HeaderNames.Kills
			},
			{
				key = "M1 P4 Revives",
				title = Leaderboards.HeaderNames.Revives
			},
			{
				key = "M1 P4 Headshots",
				title = Leaderboards.HeaderNames.Headshots
			},
			{
				key = "M1 P4 Downs",
				title = Leaderboards.HeaderNames.Downs
			}
		}
	}
}
Leaderboards.FilterButtonFeeders = {
	Group = {
		title = "LUA_MENU_GROUP_CAPS",
		feeder = function ( f1_arg0, f1_arg1, f1_arg2 )
			local f1_local0 = {}
			local f1_local1 = {}
			local f1_local2 = 1
			local f1_local3 = 1
			for f1_local7, f1_local8 in pairs( Leaderboards.Filters ) do
				table.insert( f1_local0, Engine.Localize( f1_local8.OptionText ) )
				table.insert( f1_local1, f1_local8 )
				if f1_arg2 == f1_local8 then
					f1_local2 = f1_local3
					f1_arg0.filterType = f1_local8
				end
				f1_local3 = f1_local3 + 1
			end
			return {
				labels = f1_local0,
				action = function ( f2_arg0 )
					f1_arg0.filterType = f1_local1[f2_arg0]
				end
				,
				defaultValue = f1_local2,
				wrapAround = true
			}
		end
	},
	Hardcore = {
		title = "LUA_MENU_HARDCORE_CAPS",
		feeder = function ( f3_arg0, f3_arg1, f3_arg2 )
			local f3_local0 = {}
			local f3_local1 = Engine.Localize( "MENU_LB_FILTER_HARDCORE_OFF" )
			local f3_local2 = Engine.Localize( "MENU_LB_FILTER_HARDCORE_ON" )
			f3_local0 = f3_local1
			f3_arg0.isHardcore = f3_arg2
			f3_local1 = {
				labels = f3_local0,
				action = function ( f4_arg0 )
					if f4_arg0 == 2 then
						f3_arg0.isHardcore = true
					else
						f3_arg0.isHardcore = false
					end
				end
			}
			if f3_arg2 then
				f3_local2 = 2
				if not f3_local2 then
				
				else
					f3_local1.defaultValue = f3_local2
					f3_local1.wrapAround = true
					return f3_local1
				end
			end
			f3_local2 = 1
		end
	}
}
Leaderboards.OpenLeaderboard = function ( f5_arg0, f5_arg1 )
	Leaderboards.Open( Leaderboards.GetLeaderboardFile( f5_arg0, f5_arg1 ), "TRK_ALLTIME" )
end

Leaderboards.GetLeaderboardDisabled = function ( f6_arg0 )
	return Leaderboards.Boards[f6_arg0].disabled
end

Leaderboards.GetLeaderboardTitle = function ( f7_arg0 )
	return Leaderboards.Boards[f7_arg0].Title
end

Leaderboards.GetLeaderboardNumColumns = function ( f8_arg0 )
	return Leaderboards.Boards[f8_arg0].NumColumns
end

Leaderboards.GetLeaderboardHasHardcoreMode = function ( f9_arg0 )
	return Leaderboards.Boards[f9_arg0].hasHardcoreMode
end

Leaderboards.GetLeaderboardColumnWidth = function ( f10_arg0, f10_arg1 )
	return Leaderboards.Boards[f10_arg0].ColumnWidths[f10_arg1]
end

Leaderboards.GetLeaderboardFile = function ( f11_arg0, f11_arg1 )
	local f11_local0 = Leaderboards.Boards[f11_arg0].file
	if f11_arg1 then
		f11_local0 = f11_local0 .. "_HC"
	end
	return f11_local0
end

Leaderboards.GetLeaderboardFilterOptionText = function ( f12_arg0 )
	return Leaderboards.Filters[f12_arg0].OptionText
end

Leaderboards.GetLeaderboardFilterValue = function ( f13_arg0 )
	return Leaderboards.Filters[f13_arg0].Value
end

Leaderboards.InitMenuDataSources = function ()
	local f14_local0 = nil
	if Engine.IsAliensMode() then
		f14_local0 = {
			"cpFINALSolo",
			"cpFINALCoopTwoPlayers",
			"cpFINALCoopThreePlayers",
			"cpFINALCoopFourPlayers",
			"cpTOWNSolo",
			"cpTOWNCoopTwoPlayers",
			"cpTOWNCoopThreePlayers",
			"cpTOWNCoopFourPlayers",
			"cpDISCOSolo",
			"cpDISCOCoopTwoPlayers",
			"cpDISCOCoopThreePlayers",
			"cpDISCOCoopFourPlayers",
			"cpRAVESolo",
			"cpRAVECoopTwoPlayers",
			"cpRAVECoopThreePlayers",
			"cpRAVECoopFourPlayers",
			"cpZMBSolo",
			"cpZMBCoopTwoPlayers",
			"cpZMBCoopThreePlayers",
			"cpZMBCoopFourPlayers",
			"ShotsOnTarget",
			"Headshots",
			"ExplosiveKills",
			"DoorsOpened",
			"PerksUsed",
			"Revives"
		}
	else
		f14_local0 = {
			"Score",
			"Wins",
			"Kills",
			"TeamDeathmatch",
			"FreeForAll",
			"Domination",
			"SearchAndDestroy",
			"Hardpoint",
			"KillConfirmed",
			"Frontline",
			"Defender",
			"DropZone",
			"GunGame",
			"Infected"
		}
		if Engine.IsConsoleGame() then
			table.insert( f14_local0, "Uplink" )
			table.insert( f14_local0, "CaptureTheFlag" )
		end
	end
	DataSources.frontEnd.MP.leaderboardTypes = LUI.DataSourceFromList.new( #f14_local0 )
	DataSources.frontEnd.MP.leaderboardTypes.MakeDataSourceAtIndex = function ( f15_arg0, f15_arg1, f15_arg2 )
		local f15_local0 = f14_local0[f15_arg1 + 1]
		local f15_local1 = "frontEnd.MP.leaderboardTypes." .. f15_local0
		return {
			name = LUI.DataSourceInGlobalModel.new( f15_local1 .. ".name", Engine.Localize( Leaderboards.Boards[f15_local0].Title ) ),
			desc = LUI.DataSourceInGlobalModel.new( f15_local1 .. ".desc", Engine.Localize( Leaderboards.Boards[f15_local0].Desc ) ),
			ref = LUI.DataSourceInGlobalModel.new( f15_local1 .. ".ref", f15_local0 )
		}
	end
	
end

