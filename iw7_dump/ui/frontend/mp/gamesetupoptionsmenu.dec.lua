local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "frontEnd.MP.gameSetupOptions"
f0_local1 = function ()
	WipeGlobalModelsAtPath( f0_local0 )
end

MenuBuilder.registerType( "PopupResetGameOptions", function ( f2_arg0, f2_arg1 )
	local f2_local0 = f2_arg1.gameOptionsMenu
	return MenuBuilder.BuildRegisteredType( "PopupYesNo", {
		title = Engine.Localize( "LUA_MENU_SET_DEFAULT_CONTROLS" ),
		message = Engine.Localize( "PATCH_MENU_RESET_OPTIONS" ),
		yesAction = function ()
			MatchRules.LoadMatchRulesDataDefault()
			MP.ResetNonRecipeOptionsToDefaults()
			f2_local0.GameSetupCategoryOptions:processEvent( {
				name = "refresh_button_values"
			} )
		end
		
	} )
end )
MenuBuilder.registerType( "PopupUnlockGameOptions", function ( f4_arg0, f4_arg1 )
	local f4_local0 = f4_arg1.gameOptionsMenu
	return MenuBuilder.BuildRegisteredType( "PopupYesNo", {
		title = Engine.Localize( "LUA_MENU_UNLOCK_GAME_RULES" ),
		message = Engine.Localize( "LUA_MENU_UNLOCK_GAME_RULES_MSG" ),
		yesAction = function ()
			MLG.SetUsingMLGRules( false )
			MatchRules.SetData( "cwlRulesEnabled", false )
			f4_local0.ESportsRulesLabel:TryHideESportsRules()
			f4_local0.GameSetupCategoryOptions:processEvent( {
				name = "unlock_disabled_buttons"
			} )
			f4_local0:RemoveButtonHelperTextFromElement( f4_local0.HelperBar, "button_alt1", "left" )
			f4_local0:AddButtonHelperTextToElement( f4_local0.HelperBar, {
				helper_text = Engine.Localize( "LUA_MENU_SET_DEFAULT_CONTROLS" ),
				button_ref = "button_alt1",
				side = "left",
				priority = 2,
				clickable = true
			} )
		end
		
	} )
end )
local f0_local3 = {
	ModeAdvanced = 0,
	Game = 1,
	Player = 2,
	Team = 3,
	Gameplay = 4,
	Draft = 5
}
local f0_local4 = {
	RefCol = 0,
	NameCol = 1,
	DescCol = 2,
	ImageCol = 3
}
local f0_local5 = {
	CommonOption = "commonOption",
	GrndData = "grndData",
	DemData = "demData",
	DmData = "dmData",
	TdefData = "tdefData",
	SiegeData = "siegeData",
	DomData = "domData",
	KOTHData = "kothData",
	ConfData = "confData",
	BombData = "bombData",
	BallData = "ballData",
	CTFData = "ctfData",
	FrontData = "frontData",
	GrindData = "grindData",
	InfectData = "infectData",
	GunData = "gunData",
	BallCommonData = "ballCommonData"
}
local f0_local6 = {
	TacticalModeOn = "tacticalMode",
	CWLTuning = "bulletBounce",
	HardcoreModeOn = "hardcoreModeOn",
	TimeLimit = "timeLimit",
	ScoreLimit = "scoreLimit",
	RoundLimit = "roundLimit",
	WinLimit = "winLimit",
	DropTime = "dropTime",
	ZoneSwitchTime = "zoneSwitchTime",
	BombTimer = "bombTimer",
	PlantTime = "plantTime",
	DefuseTime = "defuseTime",
	MultiBomb = "multiBomb",
	RoundSwitch = "roundSwitch",
	DelayPlayer = "delayPlayer",
	RushTimer = "rushTimer",
	SpawnDelay = "spawnDelay",
	CapRate = "capRate",
	RushTimerAmount = "rushTimerAmount",
	PreCapPoints = "preCapPoints",
	SpawnProtectionTimer = "spawnProtectionTimer",
	NumLives = "numLives",
	MaxHealth = "maxHealth",
	HealthRegen = "healthRegen",
	SpectateModeAllowed = "spectateModeAllowed",
	ShowKillcam = "showKillcam",
	RadarAlwaysOn = "radarAlwaysOn",
	RespawnDelay = "respawnDelay",
	WaveRespawnDelay = "waveRespawnDelay",
	ForceRespawn = "forceRespawn",
	FriendlyFire = "friendlyFire",
	FFPunishLimit = "ffPunishLimit",
	AllowCustomClasses = "allowCustomClasses",
	AllowPerks = "allowPerks",
	HeadshotsOnly = "headshotsOnly",
	CrankedBombTimer = "crankedBombTimer",
	AllowKillstreaks = "allowKillstreaks",
	CasualScoreStreaks = "casualScoreStreaks",
	SuperFastChargeRate = "superFastChargeRate",
	SuperPointsMod = "superPointsMod",
	PointsPerKill = "pointsPerKill",
	PointsPerDeath = "pointsPerDeath",
	PointsHeadshotBonus = "pointsHeadshotBonus",
	DogTags = "dogTags",
	FlagCaptureTime = "flagCaptureTime",
	FlagsRequiredToScore = "flagsRequiredToScore",
	PointsPerFlag = "pointsPerFlag",
	FlagNeutralization = "flagNeutralization",
	ZoneCaptureTime = "zoneCaptureTime",
	ZoneLifetime = "zoneLifetime",
	ZoneActivationDelay = "zoneActivationDelay",
	RandomLocationOrder = "randomLocationOrder",
	AdditiveScoring = "additiveScoring",
	PauseTime = "pauseTime",
	UseHQRules = "useHQRules",
	PointsPerConfirm = "pointsPerConfirm",
	PointsPerDeny = "pointsPerDeny",
	ScoreCarry = "scoreCarry",
	ScoreThrow = "scoreThrow",
	SatelliteCount = "satelliteCount",
	PracticeMode = "practiceMode",
	SilentPlant = "silentPlant",
	ExtraTime = "extraTime",
	OvertimeLimit = "overtimeLimit",
	CODCastingEnabled = "codcasterEnabled",
	WinRule = "winRule",
	CaptureCondition = "captureCondition",
	PickupTime = "pickupTime",
	ReturnTime = "returnTime",
	BountyTimer = "bountyTimer",
	BountyBonusScore = "bountyBonusScore",
	EnemyBaseKillReveal = "enemyBaseKillReveal",
	FriendlyBaseScore = "friendlyBaseScore",
	MidfieldScore = "midfieldScore",
	EnemyBaseScore = "enemyBaseScore",
	BankTime = "bankTime",
	BankRate = "bankRate",
	BankCaptureTime = "bankCaptureTime",
	MegaBankLimit = "megaBankLimit",
	MegaBankBonus = "megaBankBonus",
	TeamTimer = "teamTimer",
	ScoringTime = "scoringTime",
	ScorePerTick = "scorePerTick",
	CarrierBonusScore = "carrierBonusScore",
	CarrierBonusTime = "carrierBonusTime",
	BallActivationDelay = "ballActivationDelay",
	NumInitialInfected = "numInitialInfected",
	WeaponSurvivorPrimary = "weaponSurvivorPrimary",
	WeaponSurvivorSecondary = "weaponSurvivorSecondary",
	LethalSurvivor = "lethalSurvivor",
	TacticalSurvivor = "tacticalSurvivor",
	WeaponInfectedPrimary = "weaponInfectPrimary",
	WeaponInfectSecondary = "weaponInfectSecondary",
	LethalInfected = "lethalInfect",
	TacticalInfected = "tacticalInfect",
	WeaponInitialPrimary = "weaponInitialPrimary",
	WeaponInitialSecondary = "weaponInitialSecondary",
	SharedRushTimer = "sharedRushTimer",
	AONRules = "aonRules",
	DoubleJumpEnabled = "doubleJumpEnabled",
	WallRunEnabled = "wallRunEnabled",
	Setback = "setback",
	SetbackStreak = "setbackStreak",
	KillsPerWeapon = "killsPerWeapon",
	LadderIndex = "ladderIndex",
	InfectExtraTimePerKill = "infectExtraTimePerKill",
	SurvivorAliveScore = "survivorAliveScore",
	SurvivorScoreTime = "survivorScoreTime",
	SurvivorScorePerTick = "survivorScorePerTick",
	InfectStreakBonus = "infectStreakBonus",
	EnableInfectedTracker = "enableInfectedTracker",
	EnablePing = "enablePing",
	AllowSupers = "allowSupers",
	WinByTwoEnabled = "winByTwoEnabled",
	WinByTwoMaxRounds = "winByTwoMaxRounds",
	PossessionResetCondition = "possessionResetCondition",
	PossessionResetTime = "possessionResetTime",
	IdleResetTime = "idleResetTime",
	ExplodeOnExpire = "explodeOnExpire",
	ArmorMod = "armorMod",
	ShowEnemyCarrier = "showEnemyCarrier",
	Spectate3rdAllowed = "spectate3rdAllowed",
	TeamAssignmentAllowed = "teamAssignmentAllowed",
	EnableVariantDZ = "enableVariantDZ"
}
local f0_local7 = {
	LuaMenuMPRulesTimeLimit = "@LUA_MENU_MP_RULES_TIME_LIMIT",
	LuaMenuMPRulesScoreLimit = "@LUA_MENU_MP_RULES_SCORE_LIMIT",
	LuaMenuMPRulesRoundTimeLimit = "@LUA_MENU_MP_RULES_ROUND_TIME_LIMIT",
	LuaMenuMPRulesRoundScoreLimit = "@LUA_MENU_MP_RULES_ROUND_SCORE_LIMIT",
	LuaMenuMPRulesRoundLimit = "@LUA_MENU_MP_RULES_ROUND_LIMIT",
	LuaMenuMPRulesWinLimit = "@LUA_MENU_MP_RULES_WIN_LIMIT",
	LuaMenuMPRulesDropTime = "@LUA_MENU_MP_RULES_DROP_TIME",
	LuaMenuMPRulesZoneTime = "@LUA_MENU_MP_RULES_ZONE_TIME",
	LuaMenuMPRulesBombTimer = "@LUA_MENU_MP_RULES_BOMB_TIMER",
	LuaMenuMPRulesPlantTime = "@LUA_MENU_MP_RULES_PLANT_TIME",
	LuaMenuMPRulesDefuseTime = "@LUA_MENU_MP_RULES_DEFUSE_TIME",
	LuaMenuMPRulesMultiBomb = "@LUA_MENU_MP_RULES_MULTI_BOMB",
	LuaMenuMPRulesRoundSwitch = "@LUA_MENU_MP_RULES_ROUND_SWITCH",
	LuaMenuMPRulesDelayPlayer = "@LUA_MENU_MP_RULES_DELAY_PLAYER",
	LuaMenuMPRulesSpawnDelay = "@LUA_MENU_MP_RULES_SPAWN_DELAY",
	LuaMenuMPRulesSpawnProtectionTimer = "@LUA_MENU_MP_RULES_SPAWN_PROTECTION_TIMER",
	LuaMenuMPRulesCapRate = "@LUA_MENU_MP_RULES_CAP_RATE",
	LuaMenuMPRulesRushTimer = "@LUA_MENU_MP_RULES_RUSH_TIMER",
	LuaMenuMPRulesRushTimerAmount = "@LUA_MENU_MP_RULES_RUSH_TIMER_AMOUNT",
	LuaMenuMPRulesPreCap = "@LUA_MENU_MP_RULES_PRE_CAP",
	LuaMenuMPPrematchCountdown = "@LUA_MENU_MP_PREMATCH_COUNTDOWN",
	LuaMenuMPRulesNumberOfLives = "@LUA_MENU_MP_RULES_NUMBER_OF_LIVES",
	LuaMenuMPRulesMaxHealth = "@LUA_MENU_MP_RULES_MAX_HEALTH",
	LuaMenuMPRulesHealthRegen = "@LUA_MENU_MP_RULES_HEALTH_REGEN",
	LuaMenuMPRulesSpectating = "@LUA_MENU_MP_RULES_SPECTATING",
	LuaMenuMPRulesKillcam = "@LUA_MENU_MP_RULES_KILLCAM",
	LuaMenuMPRules3rdSpectating = "@LUA_MENU_MP_RULES_3RDPERSON_SPECTATING",
	LuaMenuMPRulesRadarAlwaysOn = "@LUA_MENU_MP_RULES_RADAR_ALWAYS_ON",
	LuaMenuMPRulesRespawnDelay = "@LUA_MENU_MP_RULES_RESPAWN_DELAY",
	LuaMenuMPRulesWaveDelay = "@LUA_MENU_MP_RULES_WAVE_DELAY",
	LuaMenuMPRulesForceRespawn = "@LUA_MENU_MP_RULES_FORCE_RESPAWN",
	LuaMenuMPRulesFriendlyFire = "@LUA_MENU_MP_RULES_FRIENDLY_FIRE",
	LuaMenuMPRulesFFPunishLimit = "@LUA_MENU_MP_RULES_FF_PUNISH_LIMIT",
	LuaMenuMPRulesPerks = "@LUA_MENU_MP_RULES_PERKS",
	LuaMenuMPRulesHardcore = "@LUA_MENU_MP_RULES_HARDCORE",
	LuaMenuMPRulesHeadshotsOnly = "@LUA_MENU_MP_RULES_HEADSHOTS_ONLY",
	LuaMenuMPRulesCrankedTimer = "@LUA_MENU_MP_RULES_CRANKED_TIMER",
	LuaMenuMPRulesKillstreaks = "@LUA_MENU_MP_RULES_KILLSTREAKS",
	LuaMenuMPRulesCasualScoreStreaks = "@LUA_MENU_MP_RULES_CASUAL_SCORE_STREAKS",
	LuaMenuMPRulesSuperFastChargeRate = "@LUA_MENU_MP_RULES_SUPER_FAST_CHARGE_RATE",
	LuaMenuMPRulesSuperPointsMod = "@LUA_MENU_MP_RULES_SUPER_POINTS_MOD",
	LuaMenuMPRulesPointsPerKill = "@LUA_MENU_MP_RULES_POINTS_PER_KILL",
	LuaMenuMPRulesPointsPerDeath = "@LUA_MENU_MP_RULES_POINTS_PER_DEATH",
	LuaMenuMPRulesPointsHeadshotBonus = "@LUA_MENU_MP_RULES_POINTS_HEADSHOT_BONUS",
	LuaMenuMPRulesDogTags = "@LUA_MENU_MP_RULES_DOG_TAGS",
	LuaMenuMPRulesFlagCaptureTime = "@LUA_MENU_MP_RULES_FLAG_CAPTURE_TIME",
	LuaMenuMPRulesFlagsRequiredToScore = "@LUA_MENU_MP_RULES_FLAGS_REQUIRED_TO_SCORE",
	LuaMenuMPRulesPointsPerFlag = "@LUA_MENU_MP_RULES_POINTS_PER_FLAG",
	LuaMenuMPRulesFlagNeutralization = "@LUA_MENU_MP_RULES_FLAG_NEUTRALIZATION",
	LuaMenuMPRulesZoneLifetime = "@LUA_MENU_MP_RULES_ZONE_LIFETIME",
	LuaMenuMPRulesZoneCaptureTime = "@LUA_MENU_MP_RULES_ZONE_CAPTURE_TIME",
	LuaMenuMPRulesZoneActivationDelay = "@LUA_MENU_MP_RULES_ZONE_ACTIVATION_DELAY",
	LuaMenuMPRulesRandomLocationOrder = "@LUA_MENU_MP_RULES_RANDOM_LOCATION_ORDER",
	LuaMenuMPRulesAdditiveScoring = "@LUA_MENU_MP_RULES_ADDITIVE_SCORING",
	LuaMenuMPRulesPauseTime = "@LUA_MENU_MP_RULES_PAUSE_TIME",
	LuaMenuMPRulesCaptureDelayPlayer = "@LUA_MENU_MP_RULES_CAPTURE_DELAY_PLAYER",
	LuaMenuMPRulesUseHQRules = "@LUA_MENU_MP_RULES_USE_HQ_RULES",
	LuaMenuMPRulesPointsPerConfirm = "@LUA_MENU_MP_RULES_POINTS_PER_CONFIRM",
	LuaMenuMPRulesPointsPerDeny = "@LUA_MENU_MP_RULES_POINTS_PER_DENY",
	LuaMenuMPRulesScoreCarry = "@LUA_MENU_MP_RULES_SCORE_CARRY",
	LuaMenuMPRulesScoreThrow = "@LUA_MENU_MP_RULES_SCORE_THROW",
	LuaMenuMPRulesSatelliteCount = "@LUA_MENU_MP_RULES_SATELLITE_COUNT",
	LuaMenuMPRulesPracticeMode = "@LUA_MENU_MP_RULES_PRACTICE_MODE",
	LuaMenuMPRulesSilentPlant = "@LUA_MENU_MP_RULES_SILENT_PLANT",
	LuaMenuMPRulesExtraTime = "@LUA_MENU_MP_RULES_EXTRA_TIME",
	LuaMenuMPRulesOvertimeLimit = "@LUA_MENU_MP_RULES_OVERTIME_LIMIT",
	LuaMenuMPRulesCODCastingEnabled = "@CODCASTER_CAPS",
	LuaMenuMPRulesWinRule = "@LUA_MENU_MP_RULES_WIN_RULE",
	LuaMenuMPRulesCaptureCondition = "@LUA_MENU_MP_RULES_CAPTURE_CONDITION",
	LuaMenuMPRulesPickupTime = "@LUA_MENU_MP_RULES_PICKUP_TIME",
	LuaMenuMPRulesReturnTime = "@LUA_MENU_MP_RULES_RETURN_TIME",
	LuaMenuMPRulesBountyTimer = "@LUA_MENU_MP_RULES_BOUNTY_TIMER",
	LuaMenuMPRulesBountyBonusScore = "@LUA_MENU_MP_RULES_BOUNTY_BONUS_SCORE",
	LuaMenuMPRulesEnemyBaseKillReveal = "@LUA_MENU_MP_RULES_ENEMY_BASE_KILL_REVEAL",
	LuaMenuMPRulesFriendlyBaseScore = "@MP_FRONTEND_ONLY_RULES_FRIENDLY_BASE_SCORE",
	LuaMenuMPRulesMidfieldScore = "@MP_FRONTEND_ONLY_RULES_MIDFIELD_SCORE",
	LuaMenuMPRulesEnemyBaseScore = "@MP_FRONTEND_ONLY_RULES_ENEMY_BASE_SCORE",
	LuaMenuMPRulesBankTime = "@LUA_MENU_MP_RULES_BANK_TIME",
	LuaMenuMPRulesBankRate = "@LUA_MENU_MP_RULES_BANK_RATE",
	LuaMenuMPRulesBankCapture = "@LUA_MENU_MP_RULES_BANK_CAPTURE",
	LuaMenuMPRulesMegaBankLimit = "@LUA_MENU_MP_RULES_MEGA_BANK_LIMIT",
	LuaMenuMPRulesMegaBankBonus = "@LUA_MENU_MP_RULES_MEGA_BANK_BONUS",
	LuaMenuMPRulesTeamTimer = "@LUA_MENU_MP_RULES_TEAM_TIMER",
	LuaMenuMPRulesRefreshTeamTimerOnReset = "@LUA_MENU_MP_RULES_REFRESH_TEAM_TIMER",
	LuaMenuMPRulesScoringTime = "@LUA_MENU_MP_RULES_SCORE_TIME",
	LuaMenuMPRulesScorePerTick = "@LUA_MENU_MP_RULES_SCORE_PER_TICK",
	LuaMenuMPRulesCarrierBonusTime = "@LUA_MENU_MP_RULES_CARRIER_BONUS_TIME",
	LuaMenuMPRulesCarrierBonusScore = "@LUA_MENU_MP_RULES_CARRIER_BONUS_SCORE",
	LuaMenuMPRulesBallActivationDelay = "@LUA_MENU_MP_RULES_BALL_ACTIVATION_DELAY",
	LuaMenuMPRulesNumInitialInfected = "@LUA_MENU_MP_RULES_INFECT_NUM_INITIAL",
	LuaMenuMPRulesSurvivorPrimaryWeapon = "@LUA_MENU_MP_RULES_INFECT_SURVIVOR_PRIMARY_WEAPON",
	LuaMenuMPRulesSurvivorSecondaryWeapon = "@LUA_MENU_MP_RULES_INFECT_SURVIVOR_SECONDARY_WEAPON",
	LuaMenuMPRulesSurvivorLethal = "@LUA_MENU_MP_RULES_INFECT_SURVIVOR_LETHAL",
	LuaMenuMPRulesSurvivorTactical = "@LUA_MENU_MP_RULES_INFECT_SURVIVOR_TACTICAL",
	LuaMenuMPRulesInfectedPrimaryWeapon = "@LUA_MENU_MP_RULES_INFECT_INFECTED_PRIMARY_WEAPON",
	LuaMenuMPRulesInfectedSecondaryWeapon = "@LUA_MENU_MP_RULES_INFECT_INFECTED_SECONDARY_WEAPON",
	LuaMenuMPRulesInfectedLethal = "@LUA_MENU_MP_RULES_INFECT_INFECTED_LETHAL",
	LuaMenuMPRulesInfectedTactical = "@LUA_MENU_MP_RULES_INFECT_INFECTED_TACTICAL",
	LuaMenuMPRulesInfectedInitialPrimaryWeapon = "@LUA_MENU_MP_RULES_INFECT_INITIAL_PRIMARY_WEAPON",
	LuaMenuMPRulesInfectedInitialSecondaryWeapon = "@LUA_MENU_MP_RULES_INFECT_INITIAL_SECONDARY_WEAPON",
	LuaMenuMPRulesSharedRushTimer = "@LUA_MENU_MP_RULES_SHARED_RUSH_TIMER",
	LuaMenuMPRulesAON = "@LUA_MENU_MP_RULES_AON",
	LuaMenuMPRulesAllowDoubleJump = "@LUA_MENU_MP_RULES_ALLOW_DOUBLE_JUMP",
	LuaMenuMPRulesAllowWallRun = "@LUA_MENU_MP_RULES_ALLOW_WALL_RUN",
	LuaMenuMPRulesSetback = "@LUA_MENU_MP_RULES_SETBACKS",
	LuaMenuMPRulesLadderIndex = "@LUA_MENU_MP_RULES_LADDER",
	LuaMenuMPRulesSetbackStreak = "@LUA_MENU_MP_RULES_SETBACK_STREAK",
	LuaMenuMPRulesKillsPerWeapon = "@LUA_MENU_MP_RULES_KILLS_PER_WEAPON",
	LuaMenuMPRulesInfectExtraTimePerKill = "@LUA_MENU_MP_RULES_INFECT_EXTRA_TIME_PER_KILL",
	LuaMenuMPRulesSurvivorAliveScore = "@LUA_MENU_MP_RULES_SURVIVOR_ALIVE_SCORE",
	LuaMenuMPRulesSurvivorScoreTime = "@LUA_MENU_MP_RULES_SURVIVOR_SCORE_TIME",
	LuaMenuMPRulesSurvivorScorePerTick = "@LUA_MENU_MP_RULES_SURVIVOR_SCORE_PER_TICK",
	LuaMenuMPRulesInfectStreakBonus = "@LUA_MENU_MP_RULES_INFECT_STREAK_BONUS",
	LuaMenuMPRulesEnableInfectedTracker = "@LUA_MENU_MP_RULES_ENABLE_TRACKER",
	LuaMenuMPRulesEnablePing = "@LUA_MENU_MP_RULES_ENABLE_PING",
	LuaMenuMPRulesAllowSupers = "@LUA_MENU_MP_RULES_ALLOW_SUPER",
	LuaMenuMPRulesWinByTwoEnabled = "@LUA_MENU_MP_RULES_WIN_BY_TWO",
	LuaMenuMPRulesWinByTwoMaxRounds = "@LUA_MENU_MP_RULES_WIN_BY_TWO_MAX_ROUNDS",
	LuaMenuMPRulesPossessionResetCondition = "@LUA_MENU_MP_RULES_POSSESSION_RESET_CONDITION",
	LuaMenuMPRulesPossessionResetTime = "@LUA_MENU_MP_RULES_POSSESSION_RESET_TIME",
	LuaMenuMPRulesIdleResetTime = "@LUA_MENU_MP_RULES_IDLE_RESET_TIME",
	LuaMenuMPRulesExplodeOnExpire = "@LUA_MENU_MP_RULES_EXPLODE_ON_EXPIRE",
	LuaMenuMPRulesArmorMod = "@LUA_MENU_MP_RULES_ARMOR_MOD",
	LuaMenuMPRulesShowEnemyCarrier = "@LUA_MENU_MP_RULES_SHOW_ENEMY_CARRIER",
	LuaMenuMPRulesTeamAssignmentAllowed = "@LUA_MENU_MP_RULES_TEAM_ASSIGNMENT",
	LuaMenuMPRulesTacticalMode = "@LUA_MENU_MP_RULES_TACTICAL_MODE",
	LuaMenuMPRulesCWLTuning = "@LUA_MENU_MP_RULES_CWL_TUNING",
	LuaMenuMPRulesDraftLoadoutTimer = "@LUA_MENU_MP_RULES_DRAFT_LOADOUT_TIMER",
	LuaMenuMPRulesDraftWeaponTimer = "@LUA_MENU_MP_RULES_DRAFT_WEAPON_TIMER",
	LuaMenuMPRulesDraftRigTimer = "@LUA_MENU_MP_RULES_DRAFT_RIG_TIMER",
	LuaMenuMPRulesSimultaneousDeath = "@LUA_MENU_MP_RULES_SIMUL_DEATH",
	LuaMenuMPRulesEnableVariantDZ = "@LUA_MENU_MP_RULES_ENABLE_VARIANT_DZ"
}
local f0_local8 = {
	LuaMenuMPRulesTimeLimitDesc = "@LUA_MENU_MP_RULES_TIME_LIMIT_DESC",
	LuaMenuMPRulesScoreLimitDesc = "@LUA_MENU_MP_RULES_SCORE_LIMIT_DESC",
	LuaMenuMPRulesRoundTimeLimitDesc = "@LUA_MENU_MP_RULES_ROUND_TIME_LIMIT_DESC",
	LuaMenuMPRulesRoundScoreLimitDesc = "@LUA_MENU_MP_RULES_ROUND_SCORE_LIMIT_DESC",
	LuaMenuMPRulesRoundLimitDesc = "@LUA_MENU_MP_RULES_ROUND_LIMIT_DESC",
	LuaMenuMPRulesWinLimitDesc = "@LUA_MENU_MP_RULES_WIN_LIMIT_DESC",
	LuaMenuMPRulesDropTimeDesc = "@LUA_MENU_MP_RULES_DROP_TIME_DESC",
	LuaMenuMPRulesZoneTimeDesc = "@LUA_MENU_MP_RULES_ZONE_TIME_DESC",
	LuaMenuMPRulesBombTimerDesc = "@LUA_MENU_MP_RULES_BOMB_TIMER_DESC",
	LuaMenuMPRulesPlantTimeDesc = "@LUA_MENU_MP_RULES_PLANT_TIME_DESC",
	LuaMenuMPRulesDefuseTimeDesc = "@LUA_MENU_MP_RULES_DEFUSE_TIME_DESC",
	LuaMenuMPRulesMultiBombDesc = "@LUA_MENU_MP_RULES_MULTI_BOMB_DESC",
	LuaMenuMPRulesRoundSwitchDesc = "@LUA_MENU_MP_RULES_ROUND_SWITCH_DESC",
	LuaMenuMPRulesDelayPlayerDesc = "@LUA_MENU_MP_RULES_DELAY_PLAYER_DESC",
	LuaMenuMPRulesSpawnDelayDesc = "@LUA_MENU_MP_RULES_SPAWN_DELAY_DESC",
	LuaMenuMPRulesSpawnProtectionTimerDesc = "@LUA_MENU_MP_RULES_SPAWN_PROTECTION_TIMER_DESC",
	LuaMenuMPRulesCapRateDesc = "@LUA_MENU_MP_RULES_FLAG_CAPTURE_TIME_DESC",
	LuaMenuMPRulesRushTimerDesc = "@LUA_MENU_MP_RULES_RUSH_TIMER_DESC",
	LuaMenuMPRulesRushTimerAmountDesc = "@LUA_MENU_MP_RULES_RUSH_TIMER_AMOUNT_DESC",
	LuaMenuMPRulesPreCapDesc = "@LUA_MENU_MP_RULES_PRE_CAP_DESC",
	LuaMenuMPPrematchCountdownDesc = "@LUA_MENU_MP_PREMATCH_COUNTDOWN_DESC",
	LuaMenuMPRulesNumberOfLivesDesc = "@LUA_MENU_MP_RULES_NUMBER_OF_LIVES_DESC",
	LuaMenuMPRulesMaxHealthDesc = "@LUA_MENU_MP_RULES_MAX_HEALTH_DESC",
	LuaMenuMPRulesHealthRegenDesc = "@LUA_MENU_MP_RULES_HEALTH_REGEN_DESC",
	LuaMenuMPRulesSpectatingDesc = "@LUA_MENU_MP_RULES_SPECTATING_DESC",
	LuaMenuMPRulesKillcamDesc = "@LUA_MENU_MP_RULES_KILLCAM_DESC",
	LuaMenuMPRules3rdSpectatingDesc = "@LUA_MENU_MP_RULES_3RDPERSON_SPECTATING_DESC",
	LuaMenuMPRulesRadarAlwaysOnDesc = "@LUA_MENU_MP_RULES_RADAR_ALWAYS_ON_DESC",
	LuaMenuMPRulesRespawnDelayDesc = "@LUA_MENU_MP_RULES_RESPAWN_DELAY_DESC",
	LuaMenuMPRulesWaveDelayDesc = "@LUA_MENU_MP_RULES_WAVE_DELAY_DESC",
	LuaMenuMPRulesForceRespawnDesc = "@LUA_MENU_MP_RULES_FORCE_RESPAWN_DESC",
	LuaMenuMPRulesFriendlyFireDesc = "@LUA_MENU_MP_RULES_FRIENDLY_FIRE_DESC",
	LuaMenuMPRulesFFPunishLimitDesc = "@LUA_MENU_MP_RULES_FF_PUNISH_LIMIT_DESC",
	LuaMenuMPRulesPerksDesc = "@LUA_MENU_MP_RULES_PERKS_DESC",
	LuaMenuMPRulesHardcoreDesc = "@LUA_MENU_MP_RULES_HARDCORE_DESC",
	LuaMenuMPRulesHeadshotsOnlyDesc = "@LUA_MENU_MP_RULES_HEADSHOTS_ONLY_DESC",
	LuaMenuMPRulesCrankedTimerDesc = "@LUA_MENU_MP_RULES_CRANKED_TIMER_DESC",
	LuaMenuMPRulesKillstreaksDesc = "@LUA_MENU_MP_RULES_KILLSTREAKS_DESC",
	LuaMenuMPRulesCasualScoreStreaksDesc = "@LUA_MENU_MP_RULES_CASUAL_SCORE_STREAKS_DESC",
	LuaMenuMPRulesAllowSupersDesc = "@LUA_MENU_MP_RULES_ALLOW_SUPER_DESC",
	LuaMenuMPRulesSuperFastChargeRateDesc = "@LUA_MENU_MP_RULES_SUPER_FAST_CHARGE_RATE_DESC",
	LuaMenuMPRulesSuperPointsModDesc = "@LUA_MENU_MP_RULES_SUPER_POINTS_MOD_DESC",
	LuaMenuMPRulesPointsPerKillDesc = "@LUA_MENU_MP_RULES_POINTS_PER_KILL_DESC",
	LuaMenuMPRulesPointsPerDeathDesc = "@LUA_MENU_MP_RULES_POINTS_PER_DEATH_DESC",
	LuaMenuMPRulesPointsHeadshotBonusDesc = "@LUA_MENU_MP_RULES_POINTS_HEADSHOT_BONUS_DESC",
	LuaMenuMPRulesDogTagsDesc = "@LUA_MENU_MP_RULES_DOG_TAGS_DESC",
	LuaMenuMPRulesFlagsRequiredToScoreDesc = "@LUA_MENU_MP_RULES_FLAGS_REQUIRED_TO_SCORE_DESC",
	LuaMenuMPRulesPointsPerFlagDesc = "@LUA_MENU_MP_RULES_POINTS_PER_FLAG_DESC",
	LuaMenuMPRulesFlagNeutralizationDesc = "@LUA_MENU_MP_RULES_FLAG_NEUTRALIZATION_DESC",
	LuaMenuMPRulesZoneLifetimeDesc = "@LUA_MENU_MP_RULES_ZONE_LIFETIME_DESC",
	LuaMenuMPRulesZoneActivationDelayDesc = "@LUA_MENU_MP_RULES_ZONE_ACTIVATION_DELAY_DESC",
	LuaMenuMPRulesRandomLocationOrderDesc = "@LUA_MENU_MP_RULES_RANDOM_LOCATION_ORDER_DESC",
	LuaMenuMPRulesAdditiveScoringDesc = "@LUA_MENU_MP_RULES_ADDITIVE_SCORING_DESC",
	LuaMenuMPRulesPauseTimeDesc = "@LUA_MENU_MP_RULES_PAUSE_TIME_DESC",
	LuaMenuMPRulesCaptureDelayPlayerDesc = "@LUA_MENU_MP_RULES_CAPTURE_DELAY_PLAYER_DESC",
	LuaMenuMPRulesUseHQRulesDesc = "@LUA_MENU_MP_RULES_USE_HQ_RULES_DESC",
	LuaMenuMPRulesPointsPerConfirmDesc = "@LUA_MENU_MP_RULES_POINTS_PER_CONFIRM_DESC",
	LuaMenuMPRulesPointsPerDenyDesc = "@LUA_MENU_MP_RULES_POINTS_PER_DENY_DESC",
	LuaMenuMPRulesScoreCarryDesc = "@LUA_MENU_MP_RULES_SCORE_CARRY_DESC",
	LuaMenuMPRulesScoreThrowDesc = "@LUA_MENU_MP_RULES_SCORE_THROW_DESC",
	LuaMenuMPRulesSatelliteCountDesc = "@LUA_MENU_MP_RULES_SATELLITE_COUNT_DESC",
	LuaMenuMPRulesPracticeModeDesc = "@LUA_MENU_MP_RULES_PRACTICE_MODE_DESC",
	LuaMenuMPRulesSilentPlantDesc = "@LUA_MENU_MP_RULES_SILENT_PLANT_DESC",
	LuaMenuMPRulesExtraTimeDesc = "@LUA_MENU_MP_RULES_EXTRA_TIME_DESC",
	LuaMenuMPRulesOvertimeLimitDesc = "@LUA_MENU_MP_RULES_OVERTIME_LIMIT_DESC",
	LuaMenuMPRulesCODCastingEnabledDesc = "@LUA_MENU_MP_RULES_CODCASTER_DESC",
	LuaMenuMPRulesWinRuleDesc = "@LUA_MENU_MP_RULES_WIN_RULE_DESC",
	LuaMenuMPRulesCaptureConditionDesc = "@LUA_MENU_MP_RULES_CAPTURE_CONDITION_DESC",
	LuaMenuMPRulesPickupTimeDesc = "@LUA_MENU_MP_RULES_PICKUP_TIME_DESC",
	LuaMenuMPRulesReturnTimeDesc = "@LUA_MENU_MP_RULES_RETURN_TIME_DESC",
	LuaMenuMPRulesBountyTimerDesc = "@LUA_MENU_MP_RULES_BOUNTY_TIMER_DESC",
	LuaMenuMPRulesBountyBonusScoreDesc = "@LUA_MENU_MP_RULES_BOUNTY_BONUS_SCORE_DESC",
	LuaMenuMPRulesEnemyBaseKillRevealDesc = "@LUA_MENU_MP_RULES_ENEMY_BASE_KILL_REVEAL_DESC",
	LuaMenuMPRulesFriendlyBaseScoreDesc = "@MP_FRONTEND_ONLY_RULES_FRIENDLY_BASE_SCORE_DESC",
	LuaMenuMPRulesMidfieldScoreDesc = "@MP_FRONTEND_ONLY_RULES_MIDFIELD_SCORE_DESC",
	LuaMenuMPRulesEnemyBaseScoreDesc = "@MP_FRONTEND_ONLY_RULES_ENEMY_BASE_SCORE_DESC",
	LuaMenuMPRulesBankTimeDesc = "@LUA_MENU_MP_RULES_BANK_TIME_DESC",
	LuaMenuMPRulesBankRateDesc = "@LUA_MENU_MP_RULES_BANK_RATE_DESC",
	LuaMenuMPRulesBankCaptureDesc = "@LUA_MENU_MP_RULES_BANK_CAPTURE_DESC",
	LuaMenuMPRulesMegaBankLimitDesc = "@LUA_MENU_MP_RULES_MEGA_BANK_LIMIT_DESC",
	LuaMenuMPRulesMegaBankBonusDesc = "@LUA_MENU_MP_RULES_MEGA_BANK_BONUS_DESC",
	LuaMenuMPRulesTeamTimerDesc = "@LUA_MENU_MP_RULES_TEAM_TIMER_DESC",
	LuaMenuMPRulesRefreshTeamTimerOnResetDesc = "@LUA_MENU_MP_RULES_REFRESH_TEAM_TIMER_DESC",
	LuaMenuMPRulesScoringTimeDesc = "@LUA_MENU_MP_RULES_SCORE_TIME_DESC",
	LuaMenuMPRulesScorePerTickDesc = "@LUA_MENU_MP_RULES_SCORE_PER_TICK_DESC",
	LuaMenuMPRulesCarrierBonusTimeDesc = "@LUA_MENU_MP_RULES_CARRIER_BONUS_TIME_DESC",
	LuaMenuMPRulesCarrierBonusScoreDesc = "@LUA_MENU_MP_RULES_CARRIER_BONUS_SCORE_DESC",
	LuaMenuMPRulesBallActivationDelayDesc = "@LUA_MENU_MP_RULES_BALL_ACTIVATION_DELAY_DESC",
	LuaMenuMPRulesNumInitialInfectedDesc = "@LUA_MENU_MP_RULES_INFECT_NUM_INITIAL_DESC",
	LuaMenuMPRulesSurvivorPrimaryWeaponDesc = "@LUA_MENU_MP_RULES_INFECT_SURVIVOR_PRIMARY_WEAPON_DESC",
	LuaMenuMPRulesSurvivorSecondaryWeaponDesc = "@LUA_MENU_MP_RULES_INFECT_SURVIVOR_SECONDARY_WEAPON_DESC",
	LuaMenuMPRulesSurvivorLethalDesc = "@LUA_MENU_MP_RULES_INFECT_SURVIVOR_LETHAL_DESC",
	LuaMenuMPRulesSurvivorTacticalDesc = "@LUA_MENU_MP_RULES_INFECT_SURVIVOR_TACTICAL_DESC",
	LuaMenuMPRulesInfectedPrimaryWeaponDesc = "@LUA_MENU_MP_RULES_INFECT_INFECTED_PRIMARY_WEAPON_DESC",
	LuaMenuMPRulesInfectedSecondaryWeaponDesc = "@LUA_MENU_MP_RULES_INFECT_INFECTED_SECONDARY_WEAPON_DESC",
	LuaMenuMPRulesInfectedLethalDesc = "@LUA_MENU_MP_RULES_INFECT_INFECTED_LETHAL_DESC",
	LuaMenuMPRulesInfectedTacticalDesc = "@LUA_MENU_MP_RULES_INFECT_INFECTED_TACTICAL_DESC",
	LuaMenuMPRulesInfectedInitialPrimaryWeaponDesc = "@LUA_MENU_MP_RULES_INFECT_INITIAL_PRIMARY_WEAPON_DESC",
	LuaMenuMPRulesInfectedInitialSecondaryWeaponDesc = "@LUA_MENU_MP_RULES_INFECT_INITIAL_SECONDARY_WEAPON_DESC",
	LuaMenuMPRulesSharedRushTimerDesc = "@LUA_MENU_MP_RULES_SHARED_RUSH_TIMER_DESC",
	LuaMenuMPRulesAONDesc = "@LUA_MENU_MP_RULES_AON_DESC",
	LuaMenuMPRulesAllowDoubleJumpDesc = "@LUA_MENU_MP_RULES_ALLOW_DOUBLE_JUMP_DESC",
	LuaMenuMPRulesAllowWallRunDesc = "@LUA_MENU_MP_RULES_ALLOW_WALL_RUN_DESC",
	LuaMenuMPRulesSetbackDesc = "@LUA_MENU_MP_RULES_SETBACKS_DESC",
	LuaMenuMPRulesLadderIndexDesc = "@LUA_MENU_MP_RULES_LADDER_DESC",
	LuaMenuMPRulesSetbackStreakDesc = "@LUA_MENU_MP_RULES_SETBACK_STREAK_DESC",
	LuaMenuMPRulesKillsPerWeaponDesc = "@LUA_MENU_MP_RULES_KILLS_PER_WEAPON_DESC",
	LuaMenuMPRulesInfectExtraTimePerKillDesc = "@LUA_MENU_MP_RULES_INFECT_EXTRA_TIME_PER_KILL_DESC",
	LuaMenuMPRulesSurvivorAliveScoreDesc = "@LUA_MENU_MP_RULES_SURVIVOR_ALIVE_SCORE_DESC",
	LuaMenuMPRulesSurvivorScoreTimeDesc = "@LUA_MENU_MP_RULES_SURVIVOR_SCORE_TIME_DESC",
	LuaMenuMPRulesSurvivorScorePerTickDesc = "@LUA_MENU_MP_RULES_SURVIVOR_SCORE_PER_TICK_DESC",
	LuaMenuMPRulesInfectStreakBonusDesc = "@LUA_MENU_MP_RULES_INFECT_STREAK_BONUS_DESC",
	LuaMenuMPRulesEnableInfectedTrackerDesc = "@LUA_MENU_MP_RULES_ENABLE_TRACKER_DESC",
	LuaMenuMPRulesEnablePingDesc = "@LUA_MENU_MP_RULES_ENABLE_PING_DESC",
	LuaMenuMPRulesInfectAllowSupersDesc = "@LUA_MENU_MP_RULES_INFECT_ALLOW_SUPER_DESC",
	LuaMenuMPRulesWinByTwoEnabledDesc = "@LUA_MENU_MP_RULES_WIN_BY_TWO_DESC",
	LuaMenuMPRulesWinByTwoMaxRoundsDesc = "@LUA_MENU_MP_RULES_WIN_BY_TWO_MAX_ROUNDS_DESC",
	LuaMenuMPRulesPossessionResetConditionDesc = "@LUA_MENU_MP_RULES_POSSESSION_RESET_CONDITION_DESC",
	LuaMenuMPRulesPossessionResetTimeDesc = "@LUA_MENU_MP_RULES_POSSESSION_RESET_TIME_DESC",
	LuaMenuMPRulesArmorModDesc = "@LUA_MENU_MP_RULES_ARMOR_MOD_DESC",
	LuaMenuMPRulesShowEnemyCarrierDesc = "@LUA_MENU_MP_RULES_SHOW_ENEMY_CARRIER_DESC",
	LuaMenuMPRulesIdleResetTimeDesc = "@LUA_MENU_MP_RULES_IDLE_RESET_TIME_DESC",
	LuaMenuMPRulesExplodeOnExpireDesc = "@LUA_MENU_MP_RULES_EXPLODE_ON_EXPIRE_DESC",
	LuaMenuMPRulesTeamAssignmentAllowedDesc = "@LUA_MENU_MP_RULES_TEAM_ASSIGNMENT_DESC",
	LuaMenuMPRulesTacticalModeDesc = "@LUA_MENU_MP_RULES_TACTICAL_MODE_DESC",
	LuaMenuMPRulesCWLTuningDesc = "@LUA_MENU_MP_RULES_CWL_TUNING_DESC",
	LuaMenuMPRulesDraftLoadoutTimerDesc = "@LUA_MENU_MP_RULES_DRAFT_LOADOUT_TIMER_DESC",
	LuaMenuMPRulesDraftWeaponTimerDesc = "@LUA_MENU_MP_RULES_DRAFT_WEAPON_TIMER_DESC",
	LuaMenuMPRulesDraftRigTimerDesc = "@LUA_MENU_MP_RULES_DRAFT_RIG_TIMER_DESC",
	LuaMenuMPRulesSimultaneousDeathDesc = "@LUA_MENU_MP_RULES_SIMUL_DEATH_DESC",
	LuaMenuMPRulesEnableVariantDZDesc = "@LUA_MENU_MP_RULES_ENABLE_VARIANT_DZ_DESC"
}
local f0_local9 = {
	LuaMenuRulesNever = {
		text = "@LUA_MENU_RULES_NEVER",
		value = 0
	},
	LuaMenuRulesNone = {
		text = "@LUA_MENU_RULES_NONE",
		value = 0
	},
	LuaMenuRulesUnlimited = {
		text = "@LUA_MENU_RULES_UNLIMITED",
		value = 0
	},
	LuaMenuMPRulesSpectating = {
		text = IsCurrentGameTypeteamBased() and "@LUA_MENU_RULES_TEAM_ONLY" or "@LUA_MENU_RULES_PLAYERS_ONLY",
		value = 1
	},
	LuaMenuRulesFree = {
		text = "@LUA_MENU_RULES_FREE",
		value = 2
	},
	LuaMenuMPRulesMinutesHalf = {
		text = "@LUA_MENU_MP_RULES_SECONDS",
		value = 0.5,
		displayValue = 30
	},
	LuaMenuMPRulesMinutes1 = {
		text = "@LUA_MENU_MP_RULES_MINUTES_1",
		value = 1
	},
	LuaMenuMPRulesMinutes1Half = {
		text = "@LUA_MENU_MP_RULES_MINUTES",
		value = 1.5
	},
	LuaMenuMPRulesMinutes2 = {
		text = "@LUA_MENU_MP_RULES_MINUTES",
		value = 2
	},
	LuaMenuMPRulesMinutes2Half = {
		text = "@LUA_MENU_MP_RULES_MINUTES",
		value = 2.5
	},
	LuaMenuMPRulesMinutes3 = {
		text = "@LUA_MENU_MP_RULES_MINUTES",
		value = 3
	},
	LuaMenuMPRulesMinutes3Half = {
		text = "@LUA_MENU_MP_RULES_MINUTES",
		value = 3.5
	},
	LuaMenuMPRulesMinutes4 = {
		text = "@LUA_MENU_MP_RULES_MINUTES",
		value = 4
	},
	LuaMenuMPRulesMinutes4Half = {
		text = "@LUA_MENU_MP_RULES_MINUTES",
		value = 4.5
	},
	LuaMenuMPRulesMinutes5 = {
		text = "@LUA_MENU_MP_RULES_MINUTES",
		value = 5
	},
	LuaMenuMPRulesMinutes6 = {
		text = "@LUA_MENU_MP_RULES_MINUTES",
		value = 6
	},
	LuaMenuMPRulesMinutes7 = {
		text = "@LUA_MENU_MP_RULES_MINUTES",
		value = 7
	},
	LuaMenuMPRulesMinutes8 = {
		text = "@LUA_MENU_MP_RULES_MINUTES",
		value = 8
	},
	LuaMenuMPRulesMinutes9 = {
		text = "@LUA_MENU_MP_RULES_MINUTES",
		value = 9
	},
	LuaMenuMPRulesMinutes10 = {
		text = "@LUA_MENU_MP_RULES_MINUTES",
		value = 10
	},
	LuaMenuMPRulesMinutes11 = {
		text = "@LUA_MENU_MP_RULES_MINUTES",
		value = 11
	},
	LuaMenuMPRulesMinutes12 = {
		text = "@LUA_MENU_MP_RULES_MINUTES",
		value = 12
	},
	LuaMenuMPRulesMinutes13 = {
		text = "@LUA_MENU_MP_RULES_MINUTES",
		value = 13
	},
	LuaMenuMPRulesMinutes14 = {
		text = "@LUA_MENU_MP_RULES_MINUTES",
		value = 14
	},
	LuaMenuMPRulesMinutes15 = {
		text = "@LUA_MENU_MP_RULES_MINUTES",
		value = 15
	},
	LuaMenuMPRulesMinutes20 = {
		text = "@LUA_MENU_MP_RULES_MINUTES",
		value = 20
	},
	LuaMenuMPRulesMinutes30 = {
		text = "@LUA_MENU_MP_RULES_MINUTES",
		value = 30
	},
	LuaMenuRules10Minutes = {
		text = "@LUA_MENU_RULES_10MINUTES",
		value = 10
	},
	LuaMenuRules20Minutes = {
		text = "@LUA_MENU_RULES_20MINUTES",
		value = 20
	},
	LuaMenuRules30Minutes = {
		text = "@LUA_MENU_RULES_30MINUTES",
		value = 30
	},
	LuaMenuMPRulesNum1 = {
		text = "@LUA_MENU_MP_RULES_NUM",
		value = 1
	},
	LuaMenuMPRulesNum2 = {
		text = "@LUA_MENU_MP_RULES_NUM",
		value = 2
	},
	LuaMenuMPRulesNum3 = {
		text = "@LUA_MENU_MP_RULES_NUM",
		value = 3
	},
	LuaMenuMPRulesNum4 = {
		text = "@LUA_MENU_MP_RULES_NUM",
		value = 4
	},
	LuaMenuMPRulesNum5 = {
		text = "@LUA_MENU_MP_RULES_NUM",
		value = 5
	},
	LuaMenuMPRulesNum6 = {
		text = "@LUA_MENU_MP_RULES_NUM",
		value = 6
	},
	LuaMenuRulesMiniscule = {
		text = "@LUA_MENU_RULES_MINISCULE",
		value = 30
	},
	LuaMenuRulesHalf = {
		text = "@LUA_MENU_RULES_HALF",
		value = 50
	},
	LuaMenuRulesTactical = {
		text = "@LUA_MENU_MP_RULES_TACTICAL_HEALTH",
		value = 70
	},
	LuaMenuRulesNormal = {
		text = "@LUA_MENU_RULES_NORMAL",
		value = 100
	},
	LuaMenuRules130 = {
		text = "@LUA_MENU_MP_RULES_1_3_HEALTH",
		value = 130
	},
	LuaMenuRules150 = {
		text = "@LUA_MENU_MP_RULES_1_5_HEALTH",
		value = 150
	},
	LuaMenuRulesDouble = {
		text = "@LUA_MENU_RULES_DOUBLE",
		value = 200
	},
	LuaMenuRulesRegenSlow = {
		text = "@LUA_MENU_RULES_SLOW",
		value = 10
	},
	LuaMenuRulesRegenNormal = {
		text = "@LUA_MENU_RULES_NORMAL",
		value = 3
	},
	LuaMenuRulesRegenFast = {
		text = "@LUA_MENU_RULES_FAST",
		value = 2
	},
	LuaMenuRulesEveryRound = {
		text = "@LUA_MENU_MP_RULES_EVERY_ROUND",
		value = 1
	},
	LuaMenuRulesEvery2Rounds = {
		text = "@LUA_MENU_MP_RULES_EVERY_N_ROUNDS",
		value = 2
	},
	LuaMenuRulesEvery3Rounds = {
		text = "@LUA_MENU_MP_RULES_EVERY_N_ROUNDS",
		value = 3
	},
	LuaMenuRulesEvery4Rounds = {
		text = "@LUA_MENU_MP_RULES_EVERY_N_ROUNDS",
		value = 4
	},
	LuaMPMenuNo = {
		text = "@LUA_MENU_MP_NO",
		value = false
	},
	LuaMenuMPYes = {
		text = "@LUA_MENU_MP_YES",
		value = true
	},
	LuaMenuMPDisabledNumValue = {
		text = "@LUA_MENU_MP_DISABLED",
		value = 0
	},
	LuaMenuMPDisabled = {
		text = "@LUA_MENU_MP_DISABLED",
		value = false
	},
	LuaMenuMPEnabledNumValue = {
		text = "@LUA_MENU_MP_ENABLED",
		value = 1
	},
	LuaMenuMPEnabled = {
		text = "@LUA_MENU_MP_ENABLED",
		value = true
	},
	LuaMenuMPDisabledValueTrue = {
		text = "@LUA_MENU_MP_DISABLED",
		value = true
	},
	LuaMenuMPEabledValueFalse = {
		text = "@LUA_MENU_MP_ENABLED",
		value = false
	},
	LuaMenuMPConstantNumValue = {
		text = "@LUA_MENU_MP_RULES_PING_CONSTANT",
		value = 1
	},
	LuaMenuMPRulesPingSeconds1 = {
		text = "@LUA_MENU_MP_RULES_SECONDS_1",
		value = 2,
		displayValue = 1
	},
	LuaMenuMPRulesPingSeconds1Half = {
		text = "@LUA_MENU_MP_RULES_SECONDS",
		value = 3,
		displayValue = 1.5
	},
	LuaMenuMPRulesPingSeconds2 = {
		text = "@LUA_MENU_MP_RULES_SECONDS",
		value = 4,
		displayValue = 2
	},
	LuaMenuMPRulesPingSeconds3 = {
		text = "@LUA_MENU_MP_RULES_SECONDS",
		value = 5,
		displayValue = 3
	},
	LuaMenuMPRulesPingSeconds4 = {
		text = "@LUA_MENU_MP_RULES_SECONDS",
		value = 6,
		displayValue = 4
	},
	LuaMenuMPRulesPoints0 = {
		text = "@LUA_MENU_MP_RULES_POINTS",
		value = 0
	},
	LuaMenuMPRulesPoints1 = {
		text = "@LUA_MENU_MP_RULES_POINTS_1",
		value = 1
	},
	LuaMenuMPRulesPoints2 = {
		text = "@LUA_MENU_MP_RULES_POINTS",
		value = 2
	},
	LuaMenuMPRulesPoints3 = {
		text = "@LUA_MENU_MP_RULES_POINTS",
		value = 3
	},
	LuaMenuMPRulesPoints4 = {
		text = "@LUA_MENU_MP_RULES_POINTS",
		value = 4
	},
	LuaMenuMPRulesPoints5 = {
		text = "@LUA_MENU_MP_RULES_POINTS",
		value = 5
	},
	LuaMenuMPRulesPoints6 = {
		text = "@LUA_MENU_MP_RULES_POINTS",
		value = 6
	},
	LuaMenuMPRulesPoints7 = {
		text = "@LUA_MENU_MP_RULES_POINTS",
		value = 7
	},
	LuaMenuMPRulesPoints8 = {
		text = "@LUA_MENU_MP_RULES_POINTS",
		value = 8
	},
	LuaMenuMPRulesPoints9 = {
		text = "@LUA_MENU_MP_RULES_POINTS",
		value = 9
	},
	LuaMenuMPRulesPoints10 = {
		text = "@LUA_MENU_MP_RULES_POINTS",
		value = 10
	},
	LuaMenuMPRulesPoints15 = {
		text = "@LUA_MENU_MP_RULES_POINTS",
		value = 15
	},
	LuaMenuMPRulesPoints20 = {
		text = "@LUA_MENU_MP_RULES_POINTS",
		value = 20
	},
	LuaMenuMPRulesPoints25 = {
		text = "@LUA_MENU_MP_RULES_POINTS",
		value = 25
	},
	LuaMenuMPRulesPoints30 = {
		text = "@LUA_MENU_MP_RULES_POINTS",
		value = 30
	},
	LuaMenuMPRulesPoints35 = {
		text = "@LUA_MENU_MP_RULES_POINTS",
		value = 35
	},
	LuaMenuMPRulesPoints40 = {
		text = "@LUA_MENU_MP_RULES_POINTS",
		value = 40
	},
	LuaMenuMPRulesPoints45 = {
		text = "@LUA_MENU_MP_RULES_POINTS",
		value = 45
	},
	LuaMenuMPRulesPoints50 = {
		text = "@LUA_MENU_MP_RULES_POINTS",
		value = 50
	},
	LuaMenuMPRulesPoints55 = {
		text = "@LUA_MENU_MP_RULES_POINTS",
		value = 55
	},
	LuaMenuMPRulesPoints60 = {
		text = "@LUA_MENU_MP_RULES_POINTS",
		value = 60
	},
	LuaMenuMPRulesPoints65 = {
		text = "@LUA_MENU_MP_RULES_POINTS",
		value = 65
	},
	LuaMenuMPRulesPoints70 = {
		text = "@LUA_MENU_MP_RULES_POINTS",
		value = 70
	},
	LuaMenuMPRulesPoints75 = {
		text = "@LUA_MENU_MP_RULES_POINTS",
		value = 75
	},
	LuaMenuMPRulesPoints80 = {
		text = "@LUA_MENU_MP_RULES_POINTS",
		value = 80
	},
	LuaMenuMPRulesPoints85 = {
		text = "@LUA_MENU_MP_RULES_POINTS",
		value = 85
	},
	LuaMenuMPRulesPoints90 = {
		text = "@LUA_MENU_MP_RULES_POINTS",
		value = 90
	},
	LuaMenuMPRulesPoints95 = {
		text = "@LUA_MENU_MP_RULES_POINTS",
		value = 95
	},
	LuaMenuMPRulesPoints100 = {
		text = "@LUA_MENU_MP_RULES_POINTS",
		value = 100
	},
	LuaMenuMPRulesPoints150 = {
		text = "@LUA_MENU_MP_RULES_POINTS",
		value = 150
	},
	LuaMenuMPRulesPoints200 = {
		text = "@LUA_MENU_MP_RULES_POINTS",
		value = 200
	},
	LuaMenuMPRulesPoints250 = {
		text = "@LUA_MENU_MP_RULES_POINTS",
		value = 250
	},
	LuaMenuMPRulesPoints300 = {
		text = "@LUA_MENU_MP_RULES_POINTS",
		value = 300
	},
	LuaMenuMPRulesPoints350 = {
		text = "@LUA_MENU_MP_RULES_POINTS",
		value = 350
	},
	LuaMenuMPRulesPoints400 = {
		text = "@LUA_MENU_MP_RULES_POINTS",
		value = 400
	},
	LuaMenuMPRulesPoints450 = {
		text = "@LUA_MENU_MP_RULES_POINTS",
		value = 450
	},
	LuaMenuMPRulesPoints500 = {
		text = "@LUA_MENU_MP_RULES_POINTS",
		value = 500
	},
	LuaMenuMPRulesPoints550 = {
		text = "@LUA_MENU_MP_RULES_POINTS",
		value = 550
	},
	LuaMenuMPRulesPoints600 = {
		text = "@LUA_MENU_MP_RULES_POINTS",
		value = 600
	},
	LuaMenuMPRulesPoints650 = {
		text = "@LUA_MENU_MP_RULES_POINTS",
		value = 650
	},
	LuaMenuMPRulesPoints700 = {
		text = "@LUA_MENU_MP_RULES_POINTS",
		value = 700
	},
	LuaMenuMPRulesPoints750 = {
		text = "@LUA_MENU_MP_RULES_POINTS",
		value = 750
	},
	LuaMenuMPRulesPoints800 = {
		text = "@LUA_MENU_MP_RULES_POINTS",
		value = 800
	},
	LuaMenuMPRulesPoints850 = {
		text = "@LUA_MENU_MP_RULES_POINTS",
		value = 850
	},
	LuaMenuMPRulesPoints900 = {
		text = "@LUA_MENU_MP_RULES_POINTS",
		value = 900
	},
	LuaMenuMPRulesPoints950 = {
		text = "@LUA_MENU_MP_RULES_POINTS",
		value = 950
	},
	LuaMenuMPRulesPoints1000 = {
		text = "@LUA_MENU_MP_RULES_POINTS",
		value = 1000
	},
	LuaMenuMPRulesLives0 = {
		text = "@LUA_MENU_MP_RULES_LIVES",
		value = 0
	},
	LuaMenuMPRulesLives1 = {
		text = "@LUA_MENU_MP_RULES_LIVES_1",
		value = 1
	},
	LuaMenuMPRulesLives2 = {
		text = "@LUA_MENU_MP_RULES_LIVES",
		value = 2
	},
	LuaMenuMPRulesLives3 = {
		text = "@LUA_MENU_MP_RULES_LIVES",
		value = 3
	},
	LuaMenuMPRulesLives4 = {
		text = "@LUA_MENU_MP_RULES_LIVES",
		value = 4
	},
	LuaMenuMPRulesLives5 = {
		text = "@LUA_MENU_MP_RULES_LIVES",
		value = 5
	},
	LuaMenuMPRulesLives10 = {
		text = "@LUA_MENU_MP_RULES_LIVES",
		value = 10
	},
	LuaMenuMPRulesLives15 = {
		text = "@LUA_MENU_MP_RULES_LIVES",
		value = 15
	},
	LuaMenuMPRulesLives20 = {
		text = "@LUA_MENU_MP_RULES_LIVES",
		value = 20
	},
	LuaMenuMPRulesLives25 = {
		text = "@LUA_MENU_MP_RULES_LIVES",
		value = 25
	},
	LuaMenuMPRulesRounds1 = {
		text = "@LUA_MENU_MP_RULES_ROUNDS_1",
		value = 1
	},
	LuaMenuMPRulesRounds2 = {
		text = "@LUA_MENU_MP_RULES_ROUNDS",
		value = 2
	},
	LuaMenuMPRulesRounds3 = {
		text = "@LUA_MENU_MP_RULES_ROUNDS",
		value = 3
	},
	LuaMenuMPRulesRounds4 = {
		text = "@LUA_MENU_MP_RULES_ROUNDS",
		value = 4
	},
	LuaMenuMPRulesRounds5 = {
		text = "@LUA_MENU_MP_RULES_ROUNDS",
		value = 5
	},
	LuaMenuMPRulesRounds6 = {
		text = "@LUA_MENU_MP_RULES_ROUNDS",
		value = 6
	},
	LuaMenuMPRulesRounds7 = {
		text = "@LUA_MENU_MP_RULES_ROUNDS",
		value = 7
	},
	LuaMenuMPRulesRounds8 = {
		text = "@LUA_MENU_MP_RULES_ROUNDS",
		value = 8
	},
	LuaMenuMPRulesRounds9 = {
		text = "@LUA_MENU_MP_RULES_ROUNDS",
		value = 9
	},
	LuaMenuMPRulesRounds10 = {
		text = "@LUA_MENU_MP_RULES_ROUNDS",
		value = 10
	},
	LuaMenuMPRulesRounds12 = {
		text = "@LUA_MENU_MP_RULES_ROUNDS",
		value = 12
	},
	LuaMenuMPRulesRounds14 = {
		text = "@LUA_MENU_MP_RULES_ROUNDS",
		value = 14
	},
	LuaMenuMPRulesRounds16 = {
		text = "@LUA_MENU_MP_RULES_ROUNDS",
		value = 16
	},
	LuaMenuMPRulesRounds18 = {
		text = "@LUA_MENU_MP_RULES_ROUNDS",
		value = 18
	},
	LuaMenuMPRulesRounds20 = {
		text = "@LUA_MENU_MP_RULES_ROUNDS",
		value = 20
	},
	LuaMenuMPRulesRounds24 = {
		text = "@LUA_MENU_MP_RULES_ROUNDS",
		value = 24
	},
	LuaMenuMPRulesRounds48 = {
		text = "@LUA_MENU_MP_RULES_ROUNDS",
		value = 48
	},
	LuaMenuMPRulesDisabledNeg = {
		text = "@LUA_MENU_MP_DISABLED",
		value = -1
	},
	LuaMenuMPRulesInstant = {
		text = "@LUA_MENU_MP_RULES_INSTANT",
		value = 0
	},
	LuaMenuMPRulesNearInstant = {
		text = "@LUA_MENU_MP_RULES_INSTANT",
		value = 0.05
	},
	LuaMenuMPRulesSeconds0Half = {
		text = "@LUA_MENU_MP_RULES_SECONDS",
		value = 0.5
	},
	LuaMenuMPRulesSeconds1 = {
		text = "@LUA_MENU_MP_RULES_SECONDS_1",
		value = 1
	},
	LuaMenuMPRulesSeconds1Half = {
		text = "@LUA_MENU_MP_RULES_SECONDS",
		value = 1.5
	},
	LuaMenuMPRulesSeconds2 = {
		text = "@LUA_MENU_MP_RULES_SECONDS",
		value = 2
	},
	LuaMenuMPRulesSeconds2Half = {
		text = "@LUA_MENU_MP_RULES_SECONDS",
		value = 2.5
	},
	LuaMenuMPRulesSeconds3 = {
		text = "@LUA_MENU_MP_RULES_SECONDS",
		value = 3
	},
	LuaMenuMPRulesSeconds3Half = {
		text = "@LUA_MENU_MP_RULES_SECONDS",
		value = 3.5
	},
	LuaMenuMPRulesSeconds4 = {
		text = "@LUA_MENU_MP_RULES_SECONDS",
		value = 4
	},
	LuaMenuMPRulesSeconds4Half = {
		text = "@LUA_MENU_MP_RULES_SECONDS",
		value = 4.5
	},
	LuaMenuMPRulesSeconds5 = {
		text = "@LUA_MENU_MP_RULES_SECONDS",
		value = 5
	},
	LuaMenuMPRulesSeconds5Half = {
		text = "@LUA_MENU_MP_RULES_SECONDS",
		value = 5.5
	},
	LuaMenuMPRulesSeconds6 = {
		text = "@LUA_MENU_MP_RULES_SECONDS",
		value = 6
	},
	LuaMenuMPRulesSeconds6Half = {
		text = "@LUA_MENU_MP_RULES_SECONDS",
		value = 6.5
	},
	LuaMenuMPRulesSeconds7 = {
		text = "@LUA_MENU_MP_RULES_SECONDS",
		value = 7
	},
	LuaMenuMPRulesSeconds7Half = {
		text = "@LUA_MENU_MP_RULES_SECONDS",
		value = 7.5
	},
	LuaMenuMPRulesSeconds8 = {
		text = "@LUA_MENU_MP_RULES_SECONDS",
		value = 8
	},
	LuaMenuMPRulesSeconds8Half = {
		text = "@LUA_MENU_MP_RULES_SECONDS",
		value = 8.5
	},
	LuaMenuMPRulesSeconds9 = {
		text = "@LUA_MENU_MP_RULES_SECONDS",
		value = 9
	},
	LuaMenuMPRulesSeconds9Half = {
		text = "@LUA_MENU_MP_RULES_SECONDS",
		value = 9.5
	},
	LuaMenuMPRulesSeconds10 = {
		text = "@LUA_MENU_MP_RULES_SECONDS",
		value = 10
	},
	LuaMenuMPRulesSeconds11 = {
		text = "@LUA_MENU_MP_RULES_SECONDS",
		value = 11
	},
	LuaMenuMPRulesSeconds12 = {
		text = "@LUA_MENU_MP_RULES_SECONDS",
		value = 12
	},
	LuaMenuMPRulesSeconds13 = {
		text = "@LUA_MENU_MP_RULES_SECONDS",
		value = 13
	},
	LuaMenuMPRulesSeconds14 = {
		text = "@LUA_MENU_MP_RULES_SECONDS",
		value = 14
	},
	LuaMenuMPRulesSeconds15 = {
		text = "@LUA_MENU_MP_RULES_SECONDS",
		value = 15
	},
	LuaMenuMPRulesSeconds20 = {
		text = "@LUA_MENU_MP_RULES_SECONDS",
		value = 20
	},
	LuaMenuMPRulesSeconds25 = {
		text = "@LUA_MENU_MP_RULES_SECONDS",
		value = 25
	},
	LuaMenuMPRulesSeconds30 = {
		text = "@LUA_MENU_MP_RULES_SECONDS",
		value = 30
	},
	LuaMenuMPRulesSeconds35 = {
		text = "@LUA_MENU_MP_RULES_SECONDS",
		value = 35
	},
	LuaMenuMPRulesSeconds40 = {
		text = "@LUA_MENU_MP_RULES_SECONDS",
		value = 40
	},
	LuaMenuMPRulesSeconds45 = {
		text = "@LUA_MENU_MP_RULES_SECONDS",
		value = 45
	},
	LuaMenuMPRulesSeconds50 = {
		text = "@LUA_MENU_MP_RULES_SECONDS",
		value = 50
	},
	LuaMenuMPRulesSeconds55 = {
		text = "@LUA_MENU_MP_RULES_SECONDS",
		value = 55
	},
	LuaMenuMPRulesSeconds60real = {
		text = "@LUA_MENU_MP_RULES_SECONDS",
		value = 60
	},
	LuaMenuMPRulesSeconds65 = {
		text = "@LUA_MENU_MP_RULES_SECONDS",
		value = 65
	},
	LuaMenuMPRulesSeconds70 = {
		text = "@LUA_MENU_MP_RULES_SECONDS",
		value = 70
	},
	LuaMenuMPRulesSeconds75 = {
		text = "@LUA_MENU_MP_RULES_SECONDS",
		value = 75
	},
	LuaMenuMPRulesSeconds60 = {
		text = "@LUA_MENU_MP_RULES_MINUTES_1",
		value = 60,
		displayValue = 1
	},
	LuaMenuMPRulesSeconds90 = {
		text = "@LUA_MENU_MP_RULES_MINUTES",
		value = 90,
		displayValue = 1.5
	},
	LuaMenuMPRulesSeconds120 = {
		text = "@LUA_MENU_MP_RULES_MINUTES",
		value = 120,
		displayValue = 2
	},
	LuaMenuMPRulesSeconds150 = {
		text = "@LUA_MENU_MP_RULES_MINUTES",
		value = 150,
		displayValue = 2.5
	},
	LuaMenuMPRulesSeconds180 = {
		text = "@LUA_MENU_MP_RULES_MINUTES",
		value = 180,
		displayValue = 3
	},
	LuaMenuMPRulesSeconds210 = {
		text = "@LUA_MENU_MP_RULES_MINUTES",
		value = 210,
		displayValue = 3.5
	},
	LuaMenuMPRulesSeconds240 = {
		text = "@LUA_MENU_MP_RULES_MINUTES",
		value = 240,
		displayValue = 4
	},
	LuaMenuMPRulesSeconds270 = {
		text = "@LUA_MENU_MP_RULES_MINUTES",
		value = 270,
		displayValue = 4.5
	},
	LuaMenuMPRulesSeconds300 = {
		text = "@LUA_MENU_MP_RULES_MINUTES",
		value = 300,
		displayValue = 5
	},
	LuaMenuMPRulesUnlimited = {
		text = "@LUA_MENU_MP_RULES_UNLIMITED",
		value = 0
	},
	LuaMenuMPRulesFlags1 = {
		text = "@LUA_MENU_MP_RULES_FLAGS_1",
		value = 1
	},
	LuaMenuMPRulesFlags2 = {
		text = "@LUA_MENU_MP_RULES_FLAGS",
		value = 2
	},
	LuaMenuMPRulesFlags3 = {
		text = "@LUA_MENU_MP_RULES_FLAGS",
		value = 3
	},
	LuaMenuMPRulesFlags5 = {
		text = "@LUA_MENU_MP_RULES_FLAGS",
		value = 5
	},
	LuaMenuMPRulesFlags10 = {
		text = "@LUA_MENU_MP_RULES_FLAGS",
		value = 10
	},
	LuaMenuMPRulesFlags15 = {
		text = "@LUA_MENU_MP_RULES_FLAGS",
		value = 15
	},
	LuaMenuMPRulesFlags30 = {
		text = "@LUA_MENU_MP_RULES_FLAGS",
		value = 30
	},
	LuaMenuMPRulesZones1 = {
		text = "@LUA_MENU_MP_RULES_ZONES_1",
		value = 1
	},
	LuaMenuMPRulesZones2 = {
		text = "@LUA_MENU_MP_RULES_ZONES",
		value = 2
	},
	LuaMenuMPRulesZones3 = {
		text = "@LUA_MENU_MP_RULES_ZONES",
		value = 3
	},
	LuaMenuMPRulesLocationOrderLinear = {
		text = "@LUA_MENU_MP_RULES_LOCATION_ORDER_LINEAR",
		value = false
	},
	LuaMenuMPRulesLocationOrderRandom = {
		text = "@LUA_MENU_MP_RULES_LOCATION_ORDER_RANDOM",
		value = true
	},
	LuaMenuMPRulesScoringConstant = {
		text = "@LUA_MENU_MP_RULES_SCORING_CONSTANT",
		value = false
	},
	LuaMenuMPRulesScoringAdditive = {
		text = "@LUA_MENU_MP_RULES_SCORING_ADDITIVE",
		value = true
	},
	LuaMenuMPRulesHalfMod = {
		text = "@LUA_MENU_MP_HALF_MOD",
		value = 0.5
	},
	LuaMenuMPRulesNormalMod = {
		text = "@LUA_MENU_MP_NORMAL_MOD",
		value = 1
	},
	LuaMenuMPRulesDoubleMod = {
		text = "@LUA_MENU_MP_DOUBLE_MOD",
		value = 2
	},
	LuaMenuMPRulesDelayed = {
		text = "@LUA_MENU_MP_DELAYED",
		value = 2
	},
	LuaMenuMPRulesSatellites1 = {
		text = "@LUA_MENU_MP_RULES_SATELLITES_1",
		value = 1
	},
	LuaMenuMPRulesSatellites2 = {
		text = "@LUA_MENU_MP_RULES_SATELLITES",
		value = 2
	},
	LuaMenuMPRulesSatellites3 = {
		text = "@LUA_MENU_MP_RULES_SATELLITES",
		value = 3
	},
	LuaMenuMPRulesSatellites4 = {
		text = "@LUA_MENU_MP_RULES_SATELLITES",
		value = 4
	},
	LuaMenuMPRulesSatellites5 = {
		text = "@LUA_MENU_MP_RULES_SATELLITES",
		value = 5
	},
	LuaMenuMPRulesRoundWins = {
		text = "@LUA_MENU_MP_ROUND_WINS",
		value = 0
	},
	LuaMenuMPRulesTotalFlagCaptures = {
		text = "@LUA_MENU_MP_TOTAL_FLAG_CAPTURES",
		value = 1
	},
	LuaMenuMPRulesFlagAtBase = {
		text = "@LUA_MENU_MP_FLAG_AT_BASE",
		value = 0
	},
	LuaMenuMPRulesFlagAnywhere = {
		text = "@LUA_MENU_MP_FLAG_ANYWHERE",
		value = 1
	},
	LuaMenuMPRulesMultiplierQuarter = {
		text = "@LUA_MENU_MP_RULES_MULTIPLIER",
		value = 0.25
	},
	LuaMenuMPRulesMultiplierHalf = {
		text = "@LUA_MENU_MP_RULES_MULTIPLIER",
		value = 0.5
	},
	LuaMenuMPRulesMultiplierThreeQuarter = {
		text = "@LUA_MENU_MP_RULES_MULTIPLIER",
		value = 0.75
	},
	LuaMenuMPRulesMultiplier1Quarter = {
		text = "@LUA_MENU_MP_RULES_MULTIPLIER",
		value = 1.25
	},
	LuaMenuMPRulesMultiplier1Half = {
		text = "@LUA_MENU_MP_RULES_MULTIPLIER",
		value = 1.5
	},
	LuaMenuMPRulesMultiplier1ThreeQuarter = {
		text = "@LUA_MENU_MP_RULES_MULTIPLIER",
		value = 1.75
	},
	LuaMenuMPRulesMultiplier2 = {
		text = "@LUA_MENU_MP_RULES_MULTIPLIER",
		value = 2
	},
	LuaMenuMPRulesMultiplier2Quarter = {
		text = "@LUA_MENU_MP_RULES_MULTIPLIER",
		value = 2.25
	},
	LuaMenuMPRulesMultiplier2Half = {
		text = "@LUA_MENU_MP_RULES_MULTIPLIER",
		value = 2.5
	},
	LuaMenuMPRulesMultiplier3 = {
		text = "@LUA_MENU_MP_RULES_MULTIPLIER",
		value = 3
	},
	LuaMenuMPRulesMultiplier3Half = {
		text = "@LUA_MENU_MP_RULES_MULTIPLIER",
		value = 3.5
	},
	LuaMenuMPRulesMultiplier4 = {
		text = "@LUA_MENU_MP_RULES_MULTIPLIER",
		value = 4
	},
	LuaMenuMPRulesMultiplier4Half = {
		text = "@LUA_MENU_MP_RULES_MULTIPLIER",
		value = 4.5
	},
	LuaMenuMPRulesMultiplier5 = {
		text = "@LUA_MENU_MP_RULES_MULTIPLIER",
		value = 5
	},
	LuaMenuMPRulesMultiplier5Half = {
		text = "@LUA_MENU_MP_RULES_MULTIPLIER",
		value = 5.5
	},
	LuaMenuMPRulesMultiplier6 = {
		text = "@LUA_MENU_MP_RULES_MULTIPLIER",
		value = 6
	},
	LuaMenuMPRulesMultiplier6Half = {
		text = "@LUA_MENU_MP_RULES_MULTIPLIER",
		value = 6.5
	},
	LuaMenuMPRulesMultiplier7 = {
		text = "@LUA_MENU_MP_RULES_MULTIPLIER",
		value = 7
	},
	LuaMenuMPRulesMultiplier7Half = {
		text = "@LUA_MENU_MP_RULES_MULTIPLIER",
		value = 7.5
	},
	LuaMenuMPRulesMultiplier8 = {
		text = "@LUA_MENU_MP_RULES_MULTIPLIER",
		value = 8
	},
	LuaMenuMPRulesMultiplier8Half = {
		text = "@LUA_MENU_MP_RULES_MULTIPLIER",
		value = 8.5
	},
	LuaMenuMPRulesMultiplier9 = {
		text = "@LUA_MENU_MP_RULES_MULTIPLIER",
		value = 9
	},
	LuaMenuMPRulesMultiplier9Half = {
		text = "@LUA_MENU_MP_RULES_MULTIPLIER",
		value = 9.5
	},
	LuaMenuMPRulesMultiplier10 = {
		text = "@LUA_MENU_MP_RULES_MULTIPLIER",
		value = 10
	},
	LuaMenuMPRulesTags1 = {
		text = "@LUA_MENU_MP_RULES_TAGS_1",
		value = 1
	},
	LuaMenuMPRulesTags2 = {
		text = "@LUA_MENU_MP_RULES_TAGS",
		value = 2
	},
	LuaMenuMPRulesTags3 = {
		text = "@LUA_MENU_MP_RULES_TAGS",
		value = 3
	},
	LuaMenuMPRulesTags4 = {
		text = "@LUA_MENU_MP_RULES_TAGS",
		value = 4
	},
	LuaMenuMPRulesTags5 = {
		text = "@LUA_MENU_MP_RULES_TAGS",
		value = 5
	},
	LuaMenuMPRulesTags6 = {
		text = "@LUA_MENU_MP_RULES_TAGS",
		value = 6
	},
	LuaMenuMPRulesTags7 = {
		text = "@LUA_MENU_MP_RULES_TAGS",
		value = 7
	},
	LuaMenuMPRulesTags8 = {
		text = "@LUA_MENU_MP_RULES_TAGS",
		value = 8
	},
	LuaMenuMPRulesTags9 = {
		text = "@LUA_MENU_MP_RULES_TAGS",
		value = 9
	},
	LuaMenuMPRulesTags10 = {
		text = "@LUA_MENU_MP_RULES_TAGS",
		value = 10
	},
	LuaMenuMPRulesTags11 = {
		text = "@LUA_MENU_MP_RULES_TAGS",
		value = 11
	},
	LuaMenuMPRulesTags12 = {
		text = "@LUA_MENU_MP_RULES_TAGS",
		value = 12
	},
	LuaMenuMPRulesTags13 = {
		text = "@LUA_MENU_MP_RULES_TAGS",
		value = 13
	},
	LuaMenuMPRulesTags14 = {
		text = "@LUA_MENU_MP_RULES_TAGS",
		value = 14
	},
	LuaMenuMPRulesTags15 = {
		text = "@LUA_MENU_MP_RULES_TAGS",
		value = 15
	},
	LuaMenuMPRulesAR57 = {
		text = "@WEAPON_AR57",
		value = "iw7_ar57_mp"
	},
	LuaMenuMPRulesAKE = {
		text = "@WEAPON_AKE",
		value = "iw7_ake_mp"
	},
	LuaMenuMPRulesNV4 = {
		text = "@WEAPON_M4",
		value = "iw7_m4_mp"
	},
	LuaMenuMPRulesFMG = {
		text = "@WEAPON_FMG",
		value = "iw7_fmg_mp"
	},
	LuaMenuMPRulesSDFAR = {
		text = "@WEAPON_SDFAR",
		value = "iw7_sdfar_mp"
	},
	LuaMenuMPRulesARCLASSIC = {
		text = "@WEAPON_ARCLASSIC",
		value = "iw7_arclassic_mp"
	},
	LuaMenuMPRulesERAD = {
		text = "@WEAPON_ERAD",
		value = "iw7_erad_mp"
	},
	LuaMenuMPRulesCRB = {
		text = "@WEAPON_CRB",
		value = "iw7_crb_mp"
	},
	LuaMenuMPRulesRIPPER = {
		text = "@WEAPON_RIPPER",
		value = "iw7_ripper_mp"
	},
	LuaMenuMPRulesUMP45 = {
		text = "@WEAPON_UMP45",
		value = "iw7_ump45_mpr"
	},
	LuaMenuMPRulesFHR = {
		text = "@WEAPON_FHR",
		value = "iw7_fhr_mp"
	},
	LuaMenuMPRulesUMP45C = {
		text = "@WEAPON_UMP45_CLASSIC",
		value = "iw7_ump45c_mp"
	},
	LuaMenuMPRulesMAULER = {
		text = "@WEAPON_MAULER",
		value = "iw7_mauler_mp"
	},
	LuaMenuMPRulesSDFLMG = {
		text = "@WEAPON_SDFLMG",
		value = "iw7_sdflmg_mp"
	},
	LuaMenuMPRulesLMG03 = {
		text = "@WEAPON_LMG03",
		value = "iw7_lmg03_mp"
	},
	LuaMenuMPRulesKBS = {
		text = "@WEAPON_KBS",
		value = "iw7_kbs_mp"
	},
	LuaMenuMPRulesCHEYTAC = {
		text = "@WEAPON_CHEYTAC",
		value = "iw7_cheytac_mpr"
	},
	LuaMenuMPRulesM8 = {
		text = "@WEAPON_M8",
		value = "iw7_m8_mp"
	},
	LuaMenuMPRulesM1 = {
		text = "@WEAPON_M1",
		value = "iw7_m1_mp"
	},
	LuaMenuMPRulesCHEYTACC = {
		text = "@WEAPON_CHEYTAC_CLASSIC",
		value = "iw7_cheytacc_mp"
	},
	LuaMenuMPRulesM1C = {
		text = "@WEAPON_M1_CLASSIC",
		value = "iw7_m1c_mp"
	},
	LuaMenuMPRulesDEVASTATOR = {
		text = "@WEAPON_DEVASTATOR",
		value = "iw7_devastator_mp"
	},
	LuaMenuMPRulesSPAS = {
		text = "@WEAPON_SPAS",
		value = "iw7_spas_mpr"
	},
	LuaMenuMPRulesSONIC = {
		text = "@WEAPON_SONIC",
		value = "iw7_sonic_mp"
	},
	LuaMenuMPRulesSDFSHOTTY = {
		text = "@WEAPON_SDFSHOTTY",
		value = "iw7_sdfshotty_mp"
	},
	LuaMenuMPRulesSPASC = {
		text = "@WEAPON_SPAS_CLASSIC",
		value = "iw7_spasc_mp"
	},
	LuaMenuMPRulesNRG = {
		text = "@WEAPON_NRG",
		value = "iw7_nrg_mp"
	},
	LuaMenuMPRulesG18 = {
		text = "@WEAPON_G18",
		value = "iw7_g18_mpr"
	},
	LuaMenuMPRulesEMC = {
		text = "@WEAPON_EMC",
		value = "iw7_emc_mp"
	},
	LuaMenuMPRulesREVOLVER = {
		text = "@WEAPON_REVOLVER",
		value = "iw7_revolver_mp"
	},
	LuaMenuMPRulesG18C = {
		text = "@WEAPON_G18_CLASSIC",
		value = "iw7_g18c_mp"
	},
	LuaMenuMPRulesLOCKON = {
		text = "@WEAPON_LOCKON",
		value = "iw7_lockon_mp"
	},
	LuaMenuMPRulesCHARGESHOT = {
		text = "@WEAPON_CHARGESHOT",
		value = "iw7_chargeshot_mp"
	},
	LuaMenuMPRulesGLPROX = {
		text = "@WEAPON_GLPROX",
		value = "iw7_glprox_mp"
	},
	LuaMenuMPRulesKnife = {
		text = "@WEAPON_KNIFE_ONLY",
		value = "iw7_knife_mp"
	},
	LuaMenuMPRulesFists = {
		text = "@WEAPON_FISTS",
		value = "iw7_fists_mp"
	},
	LuaMenuMPRulesAxe = {
		text = "@WEAPON_AXE",
		value = "iw7_axe_mp"
	},
	LuaMenuMPRulesPlasmaGrenade = {
		text = "@PERKS_POWER_SPLASH_GRENADE",
		value = "power_splashGrenade"
	},
	LuaMenuMPRulesSplitGrenade = {
		text = "@PERKS_POWER_SPLIT_GRENADE",
		value = "power_splitGrenade"
	},
	LuaMenuMPRulesExplodingDrone = {
		text = "@PERKS_POWER_EXPLODING_DRONE",
		value = "power_explodingDrone"
	},
	LuaMenuMPRulesBlackHoleGrenade = {
		text = "@PERKS_POWER_BLACKHOLE_GRENADE",
		value = "power_blackholeGrenade"
	},
	LuaMenuMPRulesBioSpike = {
		text = "@PERKS_POWER_BIOSPIKE",
		value = "power_bioSpike"
	},
	LuaMenuMPRulesClusterGrenade = {
		text = "@PERKS_POWER_CLUSTERGRENADE",
		value = "power_clusterGrenade"
	},
	LuaMenuMPRulesSpiderGrenade = {
		text = "@PERKS_POWER_SPIDER_GRENADE",
		value = "power_spiderGrenade"
	},
	LuaMenuMPRulesTripMine = {
		text = "@PERKS_POWER_TRIP_MINE",
		value = "power_tripMine"
	},
	LuaMenuMPRulesArmLauncher = {
		text = "@PERKS_POWER_WRISTROCKET",
		value = "power_wristRocket"
	},
	LuaMenuMPRulesC4 = {
		text = "@PERKS_C4",
		value = "power_c4"
	},
	LuaMenuMPRulesThrowingKnife = {
		text = "@PERKS_THROWING_KNIFE",
		value = "power_throwingKnife"
	},
	LuaMenuMPRulesBlackOutGrenade = {
		text = "@PERKS_POWER_BLACKOUTGRENADE",
		value = "power_blackoutGrenade"
	},
	LuaMenuMPRulesDomeShield = {
		text = "@PERKS_POWER_DOMESHIELD",
		value = "power_domeshield"
	},
	LuaMenuMPRulesPersonalRadar = {
		text = "@PERKS_POWER_PERIPHVIS",
		value = "power_periphVis"
	},
	LuaMenuMPRulesAdrenaline = {
		text = "@PERKS_POWER_ADRENALINE",
		value = "power_adrenaline"
	},
	LuaMenuMPRulesJammerGrenade = {
		text = "@PERKS_POWER_CONCUSSION_GRENADE",
		value = "power_concussionGrenade"
	},
	LuaMenuMPRulesTrophySystem = {
		text = "@PERKS_TROPHY",
		value = "power_trophy"
	},
	LuaMenuMPRulesCryoMine = {
		text = "@PERKS_POWER_CRYO_MINE",
		value = "power_cryoMine"
	},
	LuaMenuMPRulesSmokeGrenade = {
		text = "@PERKS_POWER_SMOKEGRENADE",
		value = "power_smokeGrenade"
	},
	LuaMenuMPRulesFoamWall = {
		text = "@PERKS_POWER_DEPLOYABLE_COVER",
		value = "power_deployableCover"
	},
	LuaMenuMPRulesTacInsert = {
		text = "@PERKS_TACTICALINSERTION",
		value = "power_tacInsert"
	},
	LuaMenuMPRulesWeaponNone = {
		text = "@LUA_MENU_MP_RULES_WEAPON_NONE",
		value = "none"
	},
	LuaMenuMPRulesSetbacks1 = {
		text = "@LUA_MENU_MP_RULES_SETBACKS_WEAPONS_1",
		value = 1
	},
	LuaMenuMPRulesSetbacks2 = {
		text = "@LUA_MENU_MP_RULES_SETBACKS_WEAPONS",
		value = 2
	},
	LuaMenuMPRulesSetbacks3 = {
		text = "@LUA_MENU_MP_RULES_SETBACKS_WEAPONS",
		value = 3
	},
	LuaMenuMPRulesSetbacks4 = {
		text = "@LUA_MENU_MP_RULES_SETBACKS_WEAPONS",
		value = 4
	},
	LuaMenuMPRulesSetbacks5 = {
		text = "@LUA_MENU_MP_RULES_SETBACKS_WEAPONS",
		value = 5
	},
	LuaMenuMPRulesLadder1 = {
		text = "@LUA_MENU_MP_RULES_LADDER_1",
		value = 1
	},
	LuaMenuMPRulesLadder2 = {
		text = "@LUA_MENU_MP_RULES_LADDER_2",
		value = 2
	},
	LuaMenuMPRulesLadder3 = {
		text = "@LUA_MENU_MP_RULES_LADDER_3",
		value = 3
	},
	LuaMenuMPRulesDeaths1 = {
		text = "@LUA_MENU_MP_RULES_DEATHS_1",
		value = 1
	},
	LuaMenuMPRulesDeaths2 = {
		text = "@LUA_MENU_MP_RULES_DEATHS",
		value = 2
	},
	LuaMenuMPRulesDeaths3 = {
		text = "@LUA_MENU_MP_RULES_DEATHS",
		value = 3
	},
	LuaMenuMPRulesDeaths4 = {
		text = "@LUA_MENU_MP_RULES_DEATHS",
		value = 4
	},
	LuaMenuMPRulesDeaths5 = {
		text = "@LUA_MENU_MP_RULES_DEATHS",
		value = 5
	},
	LuaMenuMPRulesKills1 = {
		text = "@LUA_MENU_MP_RULES_KILLS_1",
		value = 1
	},
	LuaMenuMPRulesKills2 = {
		text = "@LUA_MENU_MP_RULES_KILLS",
		value = 2
	},
	LuaMenuMPRulesKills3 = {
		text = "@LUA_MENU_MP_RULES_KILLS",
		value = 3
	},
	LuaMenuMPRulesKills4 = {
		text = "@LUA_MENU_MP_RULES_KILLS",
		value = 4
	},
	LuaMenuMPRulesKills5 = {
		text = "@LUA_MENU_MP_RULES_KILLS",
		value = 5
	},
	LuaMenuMPRulesFFReflect = {
		text = "@LUA_MENU_MP_FF_REFLECT",
		value = 2
	},
	LuaMenuMPRulesFFShare = {
		text = "@LUA_MENU_MP_FF_SHARE",
		value = 3
	},
	LuaMenuMPRulesFFPunish = {
		text = "@LUA_MENU_MP_FF_PUNISH",
		value = 4
	},
	LuaMenuMPRulesAONGesture = {
		text = "@PLAYLIST_GESTURE_NAME",
		value = 3
	},
	LuaMenuMPValuePossessionResetNever = {
		text = "@LUA_MENU_MP_RULES_VALUE_NEVER",
		value = 0
	},
	LuaMenuMPValuePossessionResetFirstTouch = {
		text = "@LUA_MENU_MP_RULES_VALUE_FIRST_TOUCH",
		value = 1
	},
	LuaMenuMPValuePossessionResetIndividualTouch = {
		text = "@LUA_MENU_MP_RULES_VALUE_INDIVIDUAL_TOUCH",
		value = 2
	}
}
local f0_local10 = function ()
	return MatchRules.GetData( f0_local5.CommonOption, f0_local6.HardcoreModeOn )
end

local f0_local11 = function ()
	return MatchRules.GetData( f0_local5.CommonOption, f0_local6.TacticalModeOn )
end

local f0_local12 = function ( f8_arg0, f8_arg1, f8_arg2, f8_arg3, f8_arg4, f8_arg5, f8_arg6, f8_arg7, f8_arg8 )
	local f8_local0 = function ()
		local f9_local0 = MatchRules.GetData( f8_arg2, f8_arg3 )
		for f9_local4, f9_local5 in pairs( f8_arg6 ) do
			if f9_local5.value == f9_local0 then
				return f9_local4
			end
		end
		return 1
	end
	
	local f8_local1 = nil
	f8_local1 = MenuBuilder.BuildRegisteredType( "GenericArrowButton", {
		controllerIndex = f8_arg1
	} )
	f8_local1.id = "option_" .. f8_arg2 .. "_" .. f8_arg3
	f8_local1:SetAnchors( 0, 1, 0, 1, 0 )
	f8_local1:SetLeft( _1080p * 0, 0 )
	f8_local1:SetRight( _1080p * 675, 0 )
	f8_local1:SetTop( _1080p * 0, 0 )
	f8_local1:SetBottom( _1080p * 30, 0 )
	f8_local1.Title:setText( ToUpperCase( Engine.Localize( f8_arg4 ) ), 0 )
	if not f8_arg8 then
		f8_arg8 = {}
	end
	for f8_local5, f8_local6 in pairs( f8_arg8 ) do
		f8_local1:addEventHandler( f8_local6.eventName, function ( f10_arg0, f10_arg1 )
			f8_local6.eventFunction( f10_arg0, f10_arg1 )
		end )
	end
	f8_local1:addEventHandler( "button_over", function ( f11_arg0, f11_arg1 )
		assert( f8_arg0.RuleInfo )
		f8_arg0.RuleInfo.HeaderText:setText( ToUpperCase( Engine.Localize( f8_arg4 ) ), 0 )
		f8_arg0.RuleInfo.BodyText:setText( Engine.Localize( f8_arg5 ), 0 )
	end )
	f8_local1:addEventHandler( "button_over_disable", function ( f12_arg0, f12_arg1 )
		assert( f8_arg0.RuleInfo )
		f8_arg0.RuleInfo.HeaderText:setText( ToUpperCase( Engine.Localize( f8_arg4 ) ), 0 )
		f8_arg0.RuleInfo.BodyText:setText( Engine.Localize( f8_arg5 ), 0 )
	end )
	f8_local2 = true
	f8_local1:addEventHandler( "refresh_button_values", function ( f13_arg0, f13_arg1 )
		if f13_arg0 ~= f13_arg1.button then
			f8_local2 = false
			local f13_local0 = f8_local0()
			if f13_local0 ~= f13_arg0.currentValue then
				f13_arg0:SetCurrentValue( f13_local0 )
			end
			f8_local2 = true
		end
	end )
	f8_local3 = nil
	f8_local4 = {}
	for f8_local8, f8_local9 in pairs( f8_arg6 ) do
		if f8_local9.displayValue ~= nil then
			f8_local3 = f8_local9.displayValue
		else
			f8_local3 = f8_local9.value
		end
		table.insert( f8_local4, Engine.Localize( f8_local9.text, f8_local3 ) )
	end
	LUI.AddUIArrowTextButtonLogic( f8_local1, f8_arg1, {
		labels = f8_local4,
		action = function ( f14_arg0 )
			MatchRules.SetData( f8_arg2, f8_arg3, f8_arg6[f14_arg0].value )
			f8_arg0.GameSetupCategoryOptions:processEvent( {
				name = "rule_changed_" .. f8_arg2 .. "_" .. f8_arg3,
				immediate = true,
				value = f8_arg6[f14_arg0].value,
				shouldRefreshButtonValues = f8_local2
			} )
		end,
		defaultValue = f8_local0()
	} )
	f8_local7 = function ()
		if MLG.AreMLGRulesEnabled() then
			return true
		elseif f8_arg7 then
			return f8_arg7()
		else
			return false
		end
	end
	
	if f8_local7() then
		f8_local1:disable()
	end
	f8_local1:addEventHandler( "unlock_disabled_buttons", function ( f16_arg0, f16_arg1 )
		if f8_local7() then
			f8_local1:disable()
		else
			f8_local1:enable()
		end
	end )
	return f8_local1
end

local f0_local13 = function ( f17_arg0, f17_arg1, f17_arg2, f17_arg3, f17_arg4, f17_arg5, f17_arg6, f17_arg7, f17_arg8 )
	local f17_local0 = function ()
		local f18_local0 = nil
		if f17_arg3 == DvarTypeTable.DvarInt then
			f18_local0 = Engine.GetDvarInt( f17_arg2 )
		elseif f17_arg3 == DvarTypeTable.DvarBool then
			f18_local0 = Engine.GetDvarBool( f17_arg2 )
		else
			f18_local0 = nil
		end
		for f18_local4, f18_local5 in pairs( f17_arg6 ) do
			if f18_local5.value == f18_local0 then
				return f18_local4
			end
		end
		return 1
	end
	
	local f17_local1 = nil
	f17_local1 = MenuBuilder.BuildRegisteredType( "GenericArrowButton", {
		controllerIndex = f17_arg1
	} )
	f17_local1.id = "option_" .. f17_arg2
	f17_local1:SetAnchors( 0, 1, 0, 1, 0 )
	f17_local1:SetLeft( _1080p * 0, 0 )
	f17_local1:SetRight( _1080p * 675, 0 )
	f17_local1:SetTop( _1080p * 0, 0 )
	f17_local1:SetBottom( _1080p * 30, 0 )
	f17_local1.Title:setText( ToUpperCase( Engine.Localize( f17_arg4 ) ), 0 )
	if not f17_arg8 then
		f17_arg8 = {}
	end
	for f17_local5, f17_local6 in pairs( f17_arg8 ) do
		f17_local1:addEventHandler( f17_local6.eventName, function ( f19_arg0, f19_arg1 )
			f17_local6.eventFunction( f19_arg0, f19_arg1 )
		end )
	end
	f17_local1:addEventHandler( "button_over", function ( f20_arg0, f20_arg1 )
		assert( f17_arg0.RuleInfo )
		f17_arg0.RuleInfo.HeaderText:setText( ToUpperCase( Engine.Localize( f17_arg4 ) ), 0 )
		f17_arg0.RuleInfo.BodyText:setText( Engine.Localize( f17_arg5 ), 0 )
	end )
	f17_local1:addEventHandler( "button_over_disable", function ( f21_arg0, f21_arg1 )
		assert( f17_arg0.RuleInfo )
		f17_arg0.RuleInfo.HeaderText:setText( ToUpperCase( Engine.Localize( f17_arg4 ) ), 0 )
		f17_arg0.RuleInfo.BodyText:setText( Engine.Localize( f17_arg5 ), 0 )
	end )
	f17_local1:addEventHandler( "refresh_button_values", function ( f22_arg0, f22_arg1 )
		if f22_arg0 ~= f22_arg1.button then
			local f22_local0 = f17_local0()
			if f22_local0 ~= f22_arg0.currentValue then
				f22_arg0:SetCurrentValue( f22_local0 )
			end
		end
	end )
	f17_local2 = nil
	f17_local3 = {}
	for f17_local7, f17_local8 in pairs( f17_arg6 ) do
		if f17_local8.displayValue ~= nil then
			f17_local2 = f17_local8.displayValue
		else
			f17_local2 = f17_local8.value
		end
		table.insert( f17_local3, Engine.Localize( f17_local8.text, f17_local2 ) )
	end
	LUI.AddUIArrowTextButtonLogic( f17_local1, f17_arg1, {
		labels = f17_local3,
		action = function ( f23_arg0 )
			if f17_arg3 == DvarTypeTable.DvarInt then
				Engine.SetDvarInt( f17_arg2, f17_arg6[f23_arg0].value )
			elseif f17_arg3 == DvarTypeTable.DvarBool then
				Engine.SetDvarBool( f17_arg2, f17_arg6[f23_arg0].value )
			else
				assert( false, "UNKNOWN DVAR TYPE" )
			end
		end,
		defaultValue = f17_local0()
	} )
	f17_local7 = function ()
		if f17_arg7 then
			return f17_arg7()
		else
			return false
		end
	end
	
	if f17_local7() then
		f17_local1:disable()
	end
	return f17_local1
end

local f0_local14 = function ( f25_arg0, f25_arg1, f25_arg2, f25_arg3, f25_arg4, f25_arg5, f25_arg6, f25_arg7, f25_arg8, f25_arg9 )
	local f25_local0 = function ()
		local f26_local0 = f25_arg4()
		for f26_local4, f26_local5 in pairs( f25_arg7 ) do
			if f26_local5.value == f26_local0 then
				return f26_local4
			end
		end
		return 1
	end
	
	local f25_local1 = function ()
		local f27_local0 = f25_arg6
		for f27_local4, f27_local5 in pairs( f25_arg7 ) do
			if f27_local5.value == f27_local0 then
				return f27_local4
			end
		end
		return 1
	end
	
	local f25_local2 = nil
	f25_local2 = MenuBuilder.BuildRegisteredType( "GenericArrowButton", {
		controllerIndex = f25_arg1
	} )
	f25_local2.id = "option_" .. Engine.Localize( f25_arg2 )
	f25_local2:SetAnchors( 0, 1, 0, 1, 0 )
	f25_local2:SetLeft( _1080p * 0, 0 )
	f25_local2:SetRight( _1080p * 675, 0 )
	f25_local2:SetTop( _1080p * 0, 0 )
	f25_local2:SetBottom( _1080p * 30, 0 )
	f25_local2.Title:setText( ToUpperCase( Engine.Localize( f25_arg2 ) ), 0 )
	if not f25_arg9 then
		f25_arg9 = {}
	end
	for f25_local6, f25_local7 in pairs( f25_arg9 ) do
		f25_local2:addEventHandler( f25_local7.eventName, function ( f28_arg0, f28_arg1 )
			f25_local7.eventFunction( f28_arg0, f28_arg1 )
		end )
	end
	f25_local2:addEventHandler( "button_over", function ( f29_arg0, f29_arg1 )
		assert( f25_arg0.RuleInfo )
		f25_arg0.RuleInfo.HeaderText:setText( ToUpperCase( Engine.Localize( f25_arg2 ) ), 0 )
		f25_arg0.RuleInfo.BodyText:setText( Engine.Localize( f25_arg3 ), 0 )
	end )
	f25_local2:addEventHandler( "button_over_disable", function ( f30_arg0, f30_arg1 )
		assert( f25_arg0.RuleInfo )
		f25_arg0.RuleInfo.HeaderText:setText( ToUpperCase( Engine.Localize( f25_arg2 ) ), 0 )
		f25_arg0.RuleInfo.BodyText:setText( Engine.Localize( f25_arg3 ), 0 )
	end )
	f25_local2:addEventHandler( "refresh_button_values", function ( f31_arg0, f31_arg1 )
		if f31_arg0 ~= f31_arg1.button then
			local f31_local0 = f25_local1()
			if f31_local0 ~= f31_arg0.currentValue then
				f31_arg0:SetCurrentValue( f31_local0 )
			end
		end
	end )
	f25_local3 = nil
	f25_local4 = {}
	for f25_local8, f25_local9 in pairs( f25_arg7 ) do
		if f25_local9.displayValue ~= nil then
			f25_local3 = f25_local9.displayValue
		else
			f25_local3 = f25_local9.value
		end
		table.insert( f25_local4, Engine.Localize( f25_local9.text, f25_local3 ) )
	end
	LUI.AddUIArrowTextButtonLogic( f25_local2, f25_arg1, {
		labels = f25_local4,
		action = function ( f32_arg0 )
			f25_arg5( f25_arg7[f32_arg0].value )
		end,
		defaultValue = f25_local0()
	} )
	f25_local7 = function ()
		if f25_arg8 then
			return f25_arg8()
		else
			return false
		end
	end
	
	if f25_local7() then
		f25_local2:disable()
	end
	f25_local2:addEventHandler( "unlock_disabled_buttons", function ( f34_arg0, f34_arg1 )
		if f25_local7() then
			f25_local2:disable()
		else
			f25_local2:enable()
		end
	end )
	return f25_local2
end

local f0_local15 = {
	[f0_local3.Gameplay] = {
		categoryTitle = "@LUA_MENU_RULES_GAMEPLAY_OPTIONS",
		optionsFeeder = function ( f57_arg0, f57_arg1 )
			local f57_local0 = {}
			local f57_local1 = GetCurrentGameType()
			table.insert( f57_local0, f0_local12( f57_arg0, f57_arg1, f0_local5.CommonOption, f0_local6.HardcoreModeOn, f0_local7.LuaMenuMPRulesHardcore, f0_local8.LuaMenuMPRulesHardcoreDesc, {
				f0_local9.LuaMenuMPDisabled,
				f0_local9.LuaMenuMPEnabled
			}, nil, {
				{
					eventName = "rule_changed_commonOption_hardcoreModeOn",
					eventFunction = function ( f58_arg0, f58_arg1 )
						if f0_local10() then
							MatchRules.SetData( f0_local5.CommonOption, f0_local6.FriendlyFire, 4 )
							MatchRules.SetData( f0_local5.CommonOption, f0_local6.MaxHealth, 30 )
							MatchRules.SetData( f0_local5.CommonOption, f0_local6.HealthRegen, 0 )
							MatchRules.SetData( f0_local5.CommonOption, f0_local6.ShowKillcam, false )
							MatchRules.SetData( f0_local5.CommonOption, f0_local6.RadarAlwaysOn, false )
							MatchRules.SetData( f0_local5.CommonOption, f0_local6.ForceRespawn, true )
							MatchRules.SetData( f0_local5.CommonOption, f0_local6.Spectate3rdAllowed, false )
							MatchRules.SetData( f0_local5.CommonOption, f0_local6.TacticalModeOn, false )
							if f58_arg1.shouldRefreshButtonValues then
								f57_arg0.GameSetupCategoryOptions:processEvent( {
									name = "refresh_button_values",
									button = f58_arg0
								} )
							end
						end
						if not f0_local10() then
							MatchRules.SetData( f0_local5.CommonOption, f0_local6.FriendlyFire, 0 )
							MatchRules.SetData( f0_local5.CommonOption, f0_local6.MaxHealth, 100 )
							MatchRules.SetData( f0_local5.CommonOption, f0_local6.HealthRegen, 3 )
							MatchRules.SetData( f0_local5.CommonOption, f0_local6.ShowKillcam, true )
							MatchRules.SetData( f0_local5.CommonOption, f0_local6.RadarAlwaysOn, false )
							MatchRules.SetData( f0_local5.CommonOption, f0_local6.ForceRespawn, true )
							MatchRules.SetData( f0_local5.CommonOption, f0_local6.Spectate3rdAllowed, true )
							if f58_arg1.shouldRefreshButtonValues then
								f57_arg0.GameSetupCategoryOptions:processEvent( {
									name = "refresh_button_values",
									button = f58_arg0
								} )
							end
						end
					end
				}
			} ) )
			table.insert( f57_local0, f0_local12( f57_arg0, f57_arg1, f0_local5.CommonOption, f0_local6.TacticalModeOn, f0_local7.LuaMenuMPRulesTacticalMode, f0_local8.LuaMenuMPRulesTacticalModeDesc, {
				f0_local9.LuaMenuMPDisabled,
				f0_local9.LuaMenuMPEnabled
			}, nil, {
				{
					eventName = "rule_changed_commonOption_tacticalMode",
					eventFunction = function ( f59_arg0, f59_arg1 )
						if f0_local11() then
							MatchRules.SetData( f0_local5.CommonOption, f0_local6.MaxHealth, 70 )
							MatchRules.SetData( f0_local5.CommonOption, f0_local6.DoubleJumpEnabled, false )
							if f59_arg1.shouldRefreshButtonValues then
								f57_arg0.GameSetupCategoryOptions:processEvent( {
									name = "refresh_button_values",
									button = f59_arg0
								} )
							end
						end
						if not f0_local11() then
							MatchRules.SetData( f0_local5.CommonOption, f0_local6.MaxHealth, 100 )
							MatchRules.SetData( f0_local5.CommonOption, f0_local6.DoubleJumpEnabled, true )
							if f59_arg1.shouldRefreshButtonValues then
								f57_arg0.GameSetupCategoryOptions:processEvent( {
									name = "refresh_button_values",
									button = f59_arg0
								} )
							end
						end
					end
				}
			} ) )
			table.insert( f57_local0, f0_local12( f57_arg0, f57_arg1, f0_local5.CommonOption, f0_local6.CWLTuning, f0_local7.LuaMenuMPRulesCWLTuning, f0_local8.LuaMenuMPRulesCWLTuningDesc, {
				f0_local9.LuaMenuMPDisabled,
				f0_local9.LuaMenuMPEnabled
			} ) )
			table.insert( f57_local0, f0_local12( f57_arg0, f57_arg1, f0_local5.CommonOption, f0_local6.HeadshotsOnly, f0_local7.LuaMenuMPRulesHeadshotsOnly, f0_local8.LuaMenuMPRulesHeadshotsOnlyDesc, {
				f0_local9.LuaMenuMPDisabled,
				f0_local9.LuaMenuMPEnabled
			} ) )
			if MP.IsCrankedTimerGameType( f57_local1 ) then
				table.insert( f57_local0, f0_local12( f57_arg0, f57_arg1, f0_local5.CommonOption, f0_local6.CrankedBombTimer, f0_local7.LuaMenuMPRulesCrankedTimer, f0_local8.LuaMenuMPRulesCrankedTimerDesc, {
					f0_local9.LuaMenuMPDisabledNumValue,
					f0_local9.LuaMenuMPRulesSeconds15,
					f0_local9.LuaMenuMPRulesSeconds30,
					f0_local9.LuaMenuMPRulesSeconds45,
					f0_local9.LuaMenuMPRulesSeconds60
				} ) )
			end
			table.insert( f57_local0, f0_local12( f57_arg0, f57_arg1, f0_local5.CommonOption, f0_local6.DoubleJumpEnabled, f0_local7.LuaMenuMPRulesAllowDoubleJump, f0_local8.LuaMenuMPRulesAllowDoubleJumpDesc, {
				f0_local9.LuaMenuMPEnabled,
				f0_local9.LuaMenuMPDisabled
			}, f0_local11, {
				{
					eventName = "rule_changed_commonOption_tacticalMode",
					eventFunction = function ( f60_arg0, f60_arg1 )
						if f0_local11() then
							f60_arg0:disable()
						else
							f60_arg0:enable()
						end
					end
				}
			} ) )
			table.insert( f57_local0, f0_local12( f57_arg0, f57_arg1, f0_local5.CommonOption, f0_local6.WallRunEnabled, f0_local7.LuaMenuMPRulesAllowWallRun, f0_local8.LuaMenuMPRulesAllowWallRunDesc, {
				f0_local9.LuaMenuMPEnabled,
				f0_local9.LuaMenuMPDisabled
			} ) )
			if f57_local1 ~= MP.GameMode.InfectGameType and f57_local1 ~= MP.GameMode.GunGameType then
				table.insert( f57_local0, f0_local12( f57_arg0, f57_arg1, f0_local5.CommonOption, f0_local6.AllowSupers, f0_local7.LuaMenuMPRulesAllowSupers, f0_local8.LuaMenuMPRulesAllowSupersDesc, {
					f0_local9.LuaMenuMPDisabled,
					f0_local9.LuaMenuMPEnabled
				} ) )
				table.insert( f57_local0, f0_local12( f57_arg0, f57_arg1, f0_local5.CommonOption, f0_local6.SuperFastChargeRate, f0_local7.LuaMenuMPRulesSuperFastChargeRate, f0_local8.LuaMenuMPRulesSuperFastChargeRateDesc, {
					f0_local9.LuaMenuMPDisabledNumValue,
					f0_local9.LuaMenuMPRulesNormalMod,
					f0_local9.LuaMenuMPRulesMultiplier2,
					f0_local9.LuaMenuMPRulesMultiplier3,
					f0_local9.LuaMenuMPRulesMultiplier4,
					f0_local9.LuaMenuMPRulesMultiplier5,
					f0_local9.LuaMenuMPRulesMultiplier6,
					f0_local9.LuaMenuMPRulesMultiplier7,
					f0_local9.LuaMenuMPRulesMultiplier8,
					f0_local9.LuaMenuMPRulesMultiplier9,
					f0_local9.LuaMenuMPRulesMultiplier10
				} ) )
				table.insert( f57_local0, f0_local12( f57_arg0, f57_arg1, f0_local5.CommonOption, f0_local6.SuperPointsMod, f0_local7.LuaMenuMPRulesSuperPointsMod, f0_local8.LuaMenuMPRulesSuperPointsModDesc, {
					f0_local9.LuaMenuMPDisabledNumValue,
					f0_local9.LuaMenuMPRulesMultiplierQuarter,
					f0_local9.LuaMenuMPRulesMultiplierHalf,
					f0_local9.LuaMenuMPRulesMultiplierThreeQuarter,
					f0_local9.LuaMenuMPRulesNormalMod,
					f0_local9.LuaMenuMPRulesMultiplier1Quarter,
					f0_local9.LuaMenuMPRulesMultiplier1Half,
					f0_local9.LuaMenuMPRulesMultiplier1ThreeQuarter,
					f0_local9.LuaMenuMPRulesMultiplier2,
					f0_local9.LuaMenuMPRulesMultiplier2Quarter,
					f0_local9.LuaMenuMPRulesMultiplier2Half,
					f0_local9.LuaMenuMPRulesMultiplier3,
					f0_local9.LuaMenuMPRulesMultiplier3Half,
					f0_local9.LuaMenuMPRulesMultiplier4,
					f0_local9.LuaMenuMPRulesMultiplier4Half,
					f0_local9.LuaMenuMPRulesMultiplier5,
					f0_local9.LuaMenuMPRulesMultiplier5Half,
					f0_local9.LuaMenuMPRulesMultiplier6,
					f0_local9.LuaMenuMPRulesMultiplier6Half,
					f0_local9.LuaMenuMPRulesMultiplier7,
					f0_local9.LuaMenuMPRulesMultiplier7Half,
					f0_local9.LuaMenuMPRulesMultiplier8,
					f0_local9.LuaMenuMPRulesMultiplier8Half,
					f0_local9.LuaMenuMPRulesMultiplier9,
					f0_local9.LuaMenuMPRulesMultiplier9Half,
					f0_local9.LuaMenuMPRulesMultiplier10
				} ) )
			end
			if f57_local1 ~= MP.GameMode.InfectGameType and f57_local1 ~= MP.GameMode.GunGameType then
				table.insert( f57_local0, f0_local12( f57_arg0, f57_arg1, f0_local5.CommonOption, f0_local6.AllowPerks, f0_local7.LuaMenuMPRulesPerks, f0_local8.LuaMenuMPRulesPerksDesc, {
					f0_local9.LuaMenuMPDisabled,
					f0_local9.LuaMenuMPEnabled
				} ) )
				local f57_local2 = function ()
					return not MatchRules.GetData( f0_local5.CommonOption, f0_local6.AllowKillstreaks )
				end
				
				table.insert( f57_local0, f0_local12( f57_arg0, f57_arg1, f0_local5.CommonOption, f0_local6.AllowKillstreaks, f0_local7.LuaMenuMPRulesKillstreaks, f0_local8.LuaMenuMPRulesKillstreaksDesc, {
					f0_local9.LuaMenuMPDisabled,
					f0_local9.LuaMenuMPEnabled
				}, nil, {
					{
						eventName = "rule_changed_commonOption_allowKillstreaks",
						eventFunction = function ( f62_arg0, f62_arg1 )
							if f57_local2() then
								MatchRules.SetData( f0_local5.CommonOption, f0_local6.CasualScoreStreaks, false )
								if f62_arg1.shouldRefreshButtonValues then
									f57_arg0.GameSetupCategoryOptions:processEvent( {
										name = "refresh_button_values",
										button = f62_arg0
									} )
								end
							end
						end
					}
				} ) )
				table.insert( f57_local0, f0_local12( f57_arg0, f57_arg1, f0_local5.CommonOption, f0_local6.CasualScoreStreaks, f0_local7.LuaMenuMPRulesCasualScoreStreaks, f0_local8.LuaMenuMPRulesCasualScoreStreaksDesc, {
					f0_local9.LuaMenuMPDisabled,
					f0_local9.LuaMenuMPEnabled
				}, f57_local2, {
					{
						eventName = "rule_changed_commonOption_allowKillstreaks",
						eventFunction = function ( f63_arg0, f63_arg1 )
							if f57_local2() then
								f63_arg0:disable()
							else
								f63_arg0:enable()
							end
						end
					}
				} ) )
			end
			return f57_local0
		end
	},
	[f0_local3.Team] = {
		categoryTitle = "@LUA_MENU_RULES_TEAM_OPTIONS",
		optionsFeeder = function ( f55_arg0, f55_arg1 )
			local f55_local0 = {}
			local f55_local1 = GetCurrentGameType()
			table.insert( f55_local0, f0_local12( f55_arg0, f55_arg1, f0_local5.CommonOption, f0_local6.SpectateModeAllowed, f0_local7.LuaMenuMPRulesSpectating, f0_local8.LuaMenuMPRulesSpectatingDesc, {
				f0_local9.LuaMenuMPDisabledNumValue,
				f0_local9.LuaMenuMPRulesSpectating,
				f0_local9.LuaMenuRulesFree
			} ) )
			table.insert( f55_local0, f0_local12( f55_arg0, f55_arg1, f0_local5.CommonOption, f0_local6.Spectate3rdAllowed, f0_local7.LuaMenuMPRules3rdSpectating, f0_local8.LuaMenuMPRules3rdSpectatingDesc, {
				f0_local9.LuaMenuMPDisabled,
				f0_local9.LuaMenuMPEnabled
			} ) )
			table.insert( f55_local0, f0_local12( f55_arg0, f55_arg1, f0_local5.CommonOption, f0_local6.ShowKillcam, f0_local7.LuaMenuMPRulesKillcam, f0_local8.LuaMenuMPRulesKillcamDesc, {
				f0_local9.LuaMenuMPDisabled,
				f0_local9.LuaMenuMPEnabled
			} ) )
			table.insert( f55_local0, f0_local12( f55_arg0, f55_arg1, f0_local5.CommonOption, f0_local6.RadarAlwaysOn, f0_local7.LuaMenuMPRulesRadarAlwaysOn, f0_local8.LuaMenuMPRulesRadarAlwaysOnDesc, {
				f0_local9.LuaMPMenuNo,
				f0_local9.LuaMenuMPYes
			} ) )
			if f55_local1 ~= MP.GameMode.InfectGameType and f55_local1 ~= MP.GameMode.GunGameType then
				table.insert( f55_local0, f0_local12( f55_arg0, f55_arg1, f0_local5.CommonOption, f0_local6.RespawnDelay, f0_local7.LuaMenuMPRulesRespawnDelay, f0_local8.LuaMenuMPRulesRespawnDelayDesc, {
					f0_local9.LuaMenuRulesNone,
					f0_local9.LuaMenuMPRulesSeconds0Half,
					f0_local9.LuaMenuMPRulesSeconds1,
					f0_local9.LuaMenuMPRulesSeconds1Half,
					f0_local9.LuaMenuMPRulesSeconds2,
					f0_local9.LuaMenuMPRulesSeconds2Half,
					f0_local9.LuaMenuMPRulesSeconds5,
					f0_local9.LuaMenuMPRulesSeconds7Half,
					f0_local9.LuaMenuMPRulesSeconds10,
					f0_local9.LuaMenuMPRulesSeconds15,
					f0_local9.LuaMenuMPRulesSeconds30
				} ) )
				table.insert( f55_local0, f0_local12( f55_arg0, f55_arg1, f0_local5.CommonOption, f0_local6.WaveRespawnDelay, f0_local7.LuaMenuMPRulesWaveDelay, f0_local8.LuaMenuMPRulesWaveDelayDesc, {
					f0_local9.LuaMenuRulesNone,
					f0_local9.LuaMenuMPRulesSeconds5,
					f0_local9.LuaMenuMPRulesSeconds10,
					f0_local9.LuaMenuMPRulesSeconds15,
					f0_local9.LuaMenuMPRulesSeconds30
				} ) )
				table.insert( f55_local0, f0_local12( f55_arg0, f55_arg1, f0_local5.CommonOption, f0_local6.ForceRespawn, f0_local7.LuaMenuMPRulesForceRespawn, f0_local8.LuaMenuMPRulesForceRespawnDesc, {
					f0_local9.LuaMenuMPDisabled,
					f0_local9.LuaMenuMPEnabled
				} ) )
				if IsCurrentGameTypeteamBased() then
					table.insert( f55_local0, f0_local12( f55_arg0, f55_arg1, f0_local5.CommonOption, f0_local6.TeamAssignmentAllowed, f0_local7.LuaMenuMPRulesTeamAssignmentAllowed, f0_local8.LuaMenuMPRulesTeamAssignmentAllowedDesc, {
						f0_local9.LuaMenuMPDisabled,
						f0_local9.LuaMenuMPEnabled
					}, nil, {
						{
							eventName = "rule_changed_commonOption_teamAssignmentAllowed",
							eventFunction = function ( f56_arg0, f56_arg1 )
								Engine.SetDvarBool( "lobby_team_select", f56_arg1.value )
								Lobby.SetTeamAssignmentEnabled( f56_arg1.value )
							end
						}
					} ) )
					table.insert( f55_local0, f0_local12( f55_arg0, f55_arg1, f0_local5.CommonOption, f0_local6.FriendlyFire, f0_local7.LuaMenuMPRulesFriendlyFire, f0_local8.LuaMenuMPRulesFriendlyFireDesc, {
						f0_local9.LuaMenuMPDisabledNumValue,
						f0_local9.LuaMenuMPEnabledNumValue,
						f0_local9.LuaMenuMPRulesFFReflect,
						f0_local9.LuaMenuMPRulesFFShare,
						f0_local9.LuaMenuMPRulesFFPunish
					} ) )
					table.insert( f55_local0, f0_local12( f55_arg0, f55_arg1, f0_local5.CommonOption, f0_local6.FFPunishLimit, f0_local7.LuaMenuMPRulesFFPunishLimit, f0_local8.LuaMenuMPRulesFFPunishLimitDesc, {
						f0_local9.LuaMenuMPRulesDisabledNeg,
						f0_local9.LuaMenuMPRulesKills1,
						f0_local9.LuaMenuMPRulesKills2,
						f0_local9.LuaMenuMPRulesKills3,
						f0_local9.LuaMenuMPRulesKills4,
						f0_local9.LuaMenuMPRulesKills5
					} ) )
				end
			end
			return f55_local0
		end
	},
	[f0_local3.Player] = {
		categoryTitle = "@LUA_MENU_RULES_PLAYER_OPTIONS",
		optionsFeeder = function ( f54_arg0, f54_arg1 )
			local f54_local0 = {}
			local f54_local1 = GetCurrentGameType()
			if f54_local1 ~= MP.GameMode.InfectGameType and f54_local1 ~= MP.GameMode.DemoGameType then
				table.insert( f54_local0, f0_local12( f54_arg0, f54_arg1, f0_local5.CommonOption, f0_local6.NumLives, f0_local7.LuaMenuMPRulesNumberOfLives, f0_local8.LuaMenuMPRulesNumberOfLivesDesc, {
					f0_local9.LuaMenuRulesUnlimited,
					f0_local9.LuaMenuMPRulesLives1,
					f0_local9.LuaMenuMPRulesLives2,
					f0_local9.LuaMenuMPRulesLives3,
					f0_local9.LuaMenuMPRulesLives4,
					f0_local9.LuaMenuMPRulesLives5,
					f0_local9.LuaMenuMPRulesLives10,
					f0_local9.LuaMenuMPRulesLives15,
					f0_local9.LuaMenuMPRulesLives20,
					f0_local9.LuaMenuMPRulesLives25
				} ) )
			end
			table.insert( f54_local0, f0_local12( f54_arg0, f54_arg1, f0_local5.CommonOption, f0_local6.MaxHealth, f0_local7.LuaMenuMPRulesMaxHealth, f0_local8.LuaMenuMPRulesMaxHealthDesc, {
				f0_local9.LuaMenuRulesMiniscule,
				f0_local9.LuaMenuRulesHalf,
				f0_local9.LuaMenuRulesTactical,
				f0_local9.LuaMenuRulesNormal,
				f0_local9.LuaMenuRules130,
				f0_local9.LuaMenuRules150,
				f0_local9.LuaMenuRulesDouble
			} ) )
			table.insert( f54_local0, f0_local12( f54_arg0, f54_arg1, f0_local5.CommonOption, f0_local6.HealthRegen, f0_local7.LuaMenuMPRulesHealthRegen, f0_local8.LuaMenuMPRulesHealthRegenDesc, {
				f0_local9.LuaMenuRulesNone,
				f0_local9.LuaMenuRulesRegenSlow,
				f0_local9.LuaMenuRulesRegenNormal,
				f0_local9.LuaMenuRulesRegenFast
			} ) )
			return f54_local0
		end
	},
	[f0_local3.Game] = {
		categoryTitle = "@LUA_MENU_MP_RULES_GAME_OPTIONS",
		optionsFeeder = function ( f52_arg0, f52_arg1 )
			local f52_local0 = {}
			local f52_local1 = GetCurrentGameType()
			if MP.IsTimeLimitGameType( f52_local1 ) then
				table.insert( f52_local0, f0_local12( f52_arg0, f52_arg1, f0_local5.CommonOption, f0_local6.TimeLimit, f0_local7.LuaMenuMPRulesTimeLimit, f0_local8.LuaMenuMPRulesTimeLimitDesc, {
					f0_local9.LuaMenuRulesUnlimited,
					f0_local9.LuaMenuMPRulesMinutes1,
					f0_local9.LuaMenuMPRulesMinutes1Half,
					f0_local9.LuaMenuMPRulesMinutes2,
					f0_local9.LuaMenuMPRulesMinutes2Half,
					f0_local9.LuaMenuMPRulesMinutes3,
					f0_local9.LuaMenuMPRulesMinutes4,
					f0_local9.LuaMenuMPRulesMinutes5,
					f0_local9.LuaMenuMPRulesMinutes6,
					f0_local9.LuaMenuMPRulesMinutes7,
					f0_local9.LuaMenuMPRulesMinutes8,
					f0_local9.LuaMenuMPRulesMinutes9,
					f0_local9.LuaMenuMPRulesMinutes10,
					f0_local9.LuaMenuMPRulesMinutes11,
					f0_local9.LuaMenuMPRulesMinutes12,
					f0_local9.LuaMenuMPRulesMinutes13,
					f0_local9.LuaMenuMPRulesMinutes14,
					f0_local9.LuaMenuMPRulesMinutes15,
					f0_local9.LuaMenuMPRulesMinutes20,
					f0_local9.LuaMenuMPRulesMinutes30
				} ) )
			end
			if MP.IsRoundTimeLimitGameType( f52_local1 ) then
				table.insert( f52_local0, f0_local12( f52_arg0, f52_arg1, f0_local5.CommonOption, f0_local6.TimeLimit, f0_local7.LuaMenuMPRulesRoundTimeLimit, f0_local8.LuaMenuMPRulesRoundTimeLimitDesc, {
					f0_local9.LuaMenuRulesUnlimited,
					f0_local9.LuaMenuMPRulesMinutes1,
					f0_local9.LuaMenuMPRulesMinutes1Half,
					f0_local9.LuaMenuMPRulesMinutes2,
					f0_local9.LuaMenuMPRulesMinutes2Half,
					f0_local9.LuaMenuMPRulesMinutes3,
					f0_local9.LuaMenuMPRulesMinutes4,
					f0_local9.LuaMenuMPRulesMinutes5,
					f0_local9.LuaMenuMPRulesMinutes6,
					f0_local9.LuaMenuMPRulesMinutes7,
					f0_local9.LuaMenuMPRulesMinutes8,
					f0_local9.LuaMenuMPRulesMinutes9,
					f0_local9.LuaMenuMPRulesMinutes10,
					f0_local9.LuaMenuMPRulesMinutes11,
					f0_local9.LuaMenuMPRulesMinutes12,
					f0_local9.LuaMenuMPRulesMinutes13,
					f0_local9.LuaMenuMPRulesMinutes14,
					f0_local9.LuaMenuMPRulesMinutes15,
					f0_local9.LuaMenuMPRulesMinutes20,
					f0_local9.LuaMenuMPRulesMinutes30
				} ) )
			end
			if f52_local1 == MP.GameMode.FrontGameType or f52_local1 == MP.GameMode.DomGameType or f52_local1 == MP.GameMode.BallGameType then
				table.insert( f52_local0, f0_local12( f52_arg0, f52_arg1, f0_local5.CommonOption, f0_local6.ScoreLimit, f0_local7.LuaMenuMPRulesRoundScoreLimit, f0_local8.LuaMenuMPRulesRoundScoreLimitDesc, {
					f0_local9.LuaMenuRulesUnlimited,
					f0_local9.LuaMenuMPRulesPoints5,
					f0_local9.LuaMenuMPRulesPoints10,
					f0_local9.LuaMenuMPRulesPoints15,
					f0_local9.LuaMenuMPRulesPoints20,
					f0_local9.LuaMenuMPRulesPoints25,
					f0_local9.LuaMenuMPRulesPoints30,
					f0_local9.LuaMenuMPRulesPoints35,
					f0_local9.LuaMenuMPRulesPoints40,
					f0_local9.LuaMenuMPRulesPoints45,
					f0_local9.LuaMenuMPRulesPoints50,
					f0_local9.LuaMenuMPRulesPoints55,
					f0_local9.LuaMenuMPRulesPoints60,
					f0_local9.LuaMenuMPRulesPoints65,
					f0_local9.LuaMenuMPRulesPoints70,
					f0_local9.LuaMenuMPRulesPoints75,
					f0_local9.LuaMenuMPRulesPoints80,
					f0_local9.LuaMenuMPRulesPoints85,
					f0_local9.LuaMenuMPRulesPoints90,
					f0_local9.LuaMenuMPRulesPoints95,
					f0_local9.LuaMenuMPRulesPoints100,
					f0_local9.LuaMenuMPRulesPoints150,
					f0_local9.LuaMenuMPRulesPoints200,
					f0_local9.LuaMenuMPRulesPoints250,
					f0_local9.LuaMenuMPRulesPoints300,
					f0_local9.LuaMenuMPRulesPoints350,
					f0_local9.LuaMenuMPRulesPoints400,
					f0_local9.LuaMenuMPRulesPoints450,
					f0_local9.LuaMenuMPRulesPoints500,
					f0_local9.LuaMenuMPRulesPoints550,
					f0_local9.LuaMenuMPRulesPoints600,
					f0_local9.LuaMenuMPRulesPoints650,
					f0_local9.LuaMenuMPRulesPoints700,
					f0_local9.LuaMenuMPRulesPoints750,
					f0_local9.LuaMenuMPRulesPoints800,
					f0_local9.LuaMenuMPRulesPoints850,
					f0_local9.LuaMenuMPRulesPoints900,
					f0_local9.LuaMenuMPRulesPoints950,
					f0_local9.LuaMenuMPRulesPoints1000
				} ) )
			end
			if f52_local1 == MP.GameMode.TDMGameType or f52_local1 == MP.GameMode.MPZombiesGameType or f52_local1 == MP.GameMode.HardpointGameType or f52_local1 == MP.GameMode.TDefGameType or f52_local1 == MP.GameMode.GrndGameType or f52_local1 == MP.GameMode.FFAGameType or f52_local1 == MP.GameMode.ConfGameType or f52_local1 == MP.GameMode.GrindGameType then
				table.insert( f52_local0, f0_local12( f52_arg0, f52_arg1, f0_local5.CommonOption, f0_local6.ScoreLimit, f0_local7.LuaMenuMPRulesScoreLimit, f0_local8.LuaMenuMPRulesScoreLimitDesc, {
					f0_local9.LuaMenuRulesUnlimited,
					f0_local9.LuaMenuMPRulesPoints5,
					f0_local9.LuaMenuMPRulesPoints10,
					f0_local9.LuaMenuMPRulesPoints15,
					f0_local9.LuaMenuMPRulesPoints20,
					f0_local9.LuaMenuMPRulesPoints25,
					f0_local9.LuaMenuMPRulesPoints30,
					f0_local9.LuaMenuMPRulesPoints35,
					f0_local9.LuaMenuMPRulesPoints40,
					f0_local9.LuaMenuMPRulesPoints45,
					f0_local9.LuaMenuMPRulesPoints50,
					f0_local9.LuaMenuMPRulesPoints55,
					f0_local9.LuaMenuMPRulesPoints60,
					f0_local9.LuaMenuMPRulesPoints65,
					f0_local9.LuaMenuMPRulesPoints70,
					f0_local9.LuaMenuMPRulesPoints75,
					f0_local9.LuaMenuMPRulesPoints80,
					f0_local9.LuaMenuMPRulesPoints85,
					f0_local9.LuaMenuMPRulesPoints90,
					f0_local9.LuaMenuMPRulesPoints95,
					f0_local9.LuaMenuMPRulesPoints100,
					f0_local9.LuaMenuMPRulesPoints150,
					f0_local9.LuaMenuMPRulesPoints200,
					f0_local9.LuaMenuMPRulesPoints250,
					f0_local9.LuaMenuMPRulesPoints300,
					f0_local9.LuaMenuMPRulesPoints350,
					f0_local9.LuaMenuMPRulesPoints400,
					f0_local9.LuaMenuMPRulesPoints450,
					f0_local9.LuaMenuMPRulesPoints500,
					f0_local9.LuaMenuMPRulesPoints550,
					f0_local9.LuaMenuMPRulesPoints600,
					f0_local9.LuaMenuMPRulesPoints650,
					f0_local9.LuaMenuMPRulesPoints700,
					f0_local9.LuaMenuMPRulesPoints750,
					f0_local9.LuaMenuMPRulesPoints800,
					f0_local9.LuaMenuMPRulesPoints850,
					f0_local9.LuaMenuMPRulesPoints900,
					f0_local9.LuaMenuMPRulesPoints950,
					f0_local9.LuaMenuMPRulesPoints1000
				} ) )
			end
			if f52_local1 == MP.GameMode.CTFGameType then
				table.insert( f52_local0, f0_local12( f52_arg0, f52_arg1, f0_local5.CommonOption, f0_local6.ScoreLimit, f0_local7.LuaMenuMPRulesRoundScoreLimit, f0_local8.LuaMenuMPRulesRoundScoreLimitDesc, {
					f0_local9.LuaMenuRulesUnlimited,
					f0_local9.LuaMenuMPRulesFlags1,
					f0_local9.LuaMenuMPRulesFlags3,
					f0_local9.LuaMenuMPRulesFlags5,
					f0_local9.LuaMenuMPRulesFlags10,
					f0_local9.LuaMenuMPRulesFlags15,
					f0_local9.LuaMenuMPRulesFlags30
				} ) )
			end
			if f52_local1 == MP.GameMode.AliensGameType then
				table.insert( f52_local0, f0_local12( f52_arg0, f52_arg1, f0_local5.CommonOption, f0_local6.ScoreLimit, f0_local7.LuaMenuMPRulesScoreLimit, f0_local8.LuaMenuMPRulesScoreLimitDesc, {
					f0_local9.LuaMenuRulesUnlimited,
					f0_local9.LuaMenuMPRulesPoints1000
				} ) )
			end
			if f52_local1 == MP.GameMode.SDGameType or f52_local1 == MP.GameMode.SRGameType or f52_local1 == MP.GameMode.SiegeGameType then
				table.insert( f52_local0, f0_local12( f52_arg0, f52_arg1, f0_local5.CommonOption, f0_local6.WinLimit, f0_local7.LuaMenuMPRulesWinLimit, f0_local8.LuaMenuMPRulesWinLimitDesc, {
					f0_local9.LuaMenuMPRulesRounds1,
					f0_local9.LuaMenuMPRulesRounds2,
					f0_local9.LuaMenuMPRulesRounds3,
					f0_local9.LuaMenuMPRulesRounds4,
					f0_local9.LuaMenuMPRulesRounds5,
					f0_local9.LuaMenuMPRulesRounds6,
					f0_local9.LuaMenuMPRulesRounds7,
					f0_local9.LuaMenuMPRulesRounds8,
					f0_local9.LuaMenuMPRulesRounds9,
					f0_local9.LuaMenuMPRulesRounds10,
					f0_local9.LuaMenuMPRulesRounds12,
					f0_local9.LuaMenuMPRulesRounds24
				} ) )
			end
			if f52_local1 == MP.GameMode.SDGameType or f52_local1 == MP.GameMode.SRGameType or f52_local1 == MP.GameMode.SiegeGameType then
				table.insert( f52_local0, f0_local12( f52_arg0, f52_arg1, f0_local5.CommonOption, f0_local6.WinByTwoEnabled, f0_local7.LuaMenuMPRulesWinByTwoEnabled, f0_local8.LuaMenuMPRulesWinByTwoEnabledDesc, {
					f0_local9.LuaMenuMPDisabled,
					f0_local9.LuaMenuMPEnabled
				} ) )
				table.insert( f52_local0, f0_local12( f52_arg0, f52_arg1, f0_local5.CommonOption, f0_local6.WinByTwoMaxRounds, f0_local7.LuaMenuMPRulesWinByTwoMaxRounds, f0_local8.LuaMenuMPRulesWinByTwoMaxRoundsDesc, {
					f0_local9.LuaMenuMPRulesRounds1,
					f0_local9.LuaMenuMPRulesRounds2,
					f0_local9.LuaMenuMPRulesRounds3,
					f0_local9.LuaMenuMPRulesRounds4,
					f0_local9.LuaMenuMPRulesRounds5,
					f0_local9.LuaMenuMPRulesRounds6,
					f0_local9.LuaMenuMPRulesRounds7,
					f0_local9.LuaMenuMPRulesRounds8,
					f0_local9.LuaMenuMPRulesRounds9,
					f0_local9.LuaMenuMPRulesRounds10,
					f0_local9.LuaMenuMPRulesRounds12,
					f0_local9.LuaMenuMPRulesRounds14,
					f0_local9.LuaMenuMPRulesRounds16,
					f0_local9.LuaMenuMPRulesRounds18,
					f0_local9.LuaMenuMPRulesRounds20,
					f0_local9.LuaMenuMPRulesRounds24,
					f0_local9.LuaMenuMPRulesRounds48
				} ) )
			end
			if f52_local1 == MP.GameMode.SDGameType or f52_local1 == MP.GameMode.SRGameType or f52_local1 == MP.GameMode.SiegeGameType then
				table.insert( f52_local0, f0_local12( f52_arg0, f52_arg1, f0_local5.CommonOption, f0_local6.RoundSwitch, f0_local7.LuaMenuMPRulesRoundSwitch, f0_local8.LuaMenuMPRulesRoundSwitchDesc, {
					f0_local9.LuaMenuRulesNever,
					f0_local9.LuaMenuRulesEveryRound,
					f0_local9.LuaMenuRulesEvery2Rounds,
					f0_local9.LuaMenuRulesEvery3Rounds,
					f0_local9.LuaMenuRulesEvery4Rounds
				} ) )
			end
			if Engine.GetDvarBool( "lui_codcaster_enabled" ) then
				table.insert( f52_local0, f0_local12( f52_arg0, f52_arg1, f0_local5.CommonOption, f0_local6.CODCastingEnabled, f0_local7.LuaMenuMPRulesCODCastingEnabled, f0_local8.LuaMenuMPRulesCODCastingEnabledDesc, {
					f0_local9.LuaMenuMPDisabled,
					f0_local9.LuaMenuMPEnabled
				}, nil, {
					{
						eventName = "rule_changed_commonOption_codcasterEnabled",
						eventFunction = function ( f53_arg0, f53_arg1 )
							CODCASTER.SetCODCastingEnabled( f53_arg1.value )
						end
					}
				} ) )
			end
			table.insert( f52_local0, f0_local13( f52_arg0, f52_arg1, "killswitch_simultaneous_deaths", MP.nonRecipeOptionsDefaults.killswitch_simultaneous_deaths.type, f0_local7.LuaMenuMPRulesSimultaneousDeath, f0_local8.LuaMenuMPRulesSimultaneousDeathDesc, {
				f0_local9.LuaMenuMPDisabledValueTrue,
				f0_local9.LuaMenuMPEabledValueFalse
			} ) )
			return f52_local0
		end
	},
	[f0_local3.ModeAdvanced] = {
		categoryTitle = "@LUA_MENU_MP_RULES_MODE_ADVANCED_OPTIONS",
		optionsFeeder = function ( f35_arg0, f35_arg1 )
			local f35_local0 = {}
			local f35_local1 = GetCurrentGameType()
			if f35_local1 == MP.GameMode.TDMGameType then
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.CommonOption, f0_local6.PointsPerKill, f0_local7.LuaMenuMPRulesPointsPerKill, f0_local8.LuaMenuMPRulesPointsPerKillDesc, {
					f0_local9.LuaMenuMPRulesPoints0,
					f0_local9.LuaMenuMPRulesPoints1,
					f0_local9.LuaMenuMPRulesPoints2,
					f0_local9.LuaMenuMPRulesPoints3,
					f0_local9.LuaMenuMPRulesPoints4,
					f0_local9.LuaMenuMPRulesPoints5,
					f0_local9.LuaMenuMPRulesPoints10,
					f0_local9.LuaMenuMPRulesPoints15,
					f0_local9.LuaMenuMPRulesPoints20,
					f0_local9.LuaMenuMPRulesPoints25
				} ) )
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.CommonOption, f0_local6.PointsPerDeath, f0_local7.LuaMenuMPRulesPointsPerDeath, f0_local8.LuaMenuMPRulesPointsPerDeathDesc, {
					f0_local9.LuaMenuMPRulesPoints0,
					f0_local9.LuaMenuMPRulesPoints1,
					f0_local9.LuaMenuMPRulesPoints2,
					f0_local9.LuaMenuMPRulesPoints3,
					f0_local9.LuaMenuMPRulesPoints4,
					f0_local9.LuaMenuMPRulesPoints5,
					f0_local9.LuaMenuMPRulesPoints10,
					f0_local9.LuaMenuMPRulesPoints15,
					f0_local9.LuaMenuMPRulesPoints20,
					f0_local9.LuaMenuMPRulesPoints25
				} ) )
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.CommonOption, f0_local6.PointsHeadshotBonus, f0_local7.LuaMenuMPRulesPointsHeadshotBonus, f0_local8.LuaMenuMPRulesPointsHeadshotBonusDesc, {
					f0_local9.LuaMenuMPRulesPoints0,
					f0_local9.LuaMenuMPRulesPoints1,
					f0_local9.LuaMenuMPRulesPoints2,
					f0_local9.LuaMenuMPRulesPoints3,
					f0_local9.LuaMenuMPRulesPoints4,
					f0_local9.LuaMenuMPRulesPoints5,
					f0_local9.LuaMenuMPRulesPoints10,
					f0_local9.LuaMenuMPRulesPoints15,
					f0_local9.LuaMenuMPRulesPoints20,
					f0_local9.LuaMenuMPRulesPoints25
				} ) )
			end
			if f35_local1 == MP.GameMode.TDMGameType or f35_local1 == MP.GameMode.FrontGameType then
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.CommonOption, f0_local6.DogTags, f0_local7.LuaMenuMPRulesDogTags, f0_local8.LuaMenuMPRulesDogTagsDesc, {
					f0_local9.LuaMenuMPDisabled,
					f0_local9.LuaMenuMPEnabled
				} ) )
			end
			if f35_local1 == MP.GameMode.FrontGameType then
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.FrontData, f0_local6.FriendlyBaseScore, f0_local7.LuaMenuMPRulesFriendlyBaseScore, f0_local8.LuaMenuMPRulesFriendlyBaseScoreDesc, {
					f0_local9.LuaMenuMPRulesPoints0,
					f0_local9.LuaMenuMPRulesPoints1,
					f0_local9.LuaMenuMPRulesPoints2,
					f0_local9.LuaMenuMPRulesPoints3,
					f0_local9.LuaMenuMPRulesPoints4,
					f0_local9.LuaMenuMPRulesPoints5,
					f0_local9.LuaMenuMPRulesPoints6,
					f0_local9.LuaMenuMPRulesPoints7,
					f0_local9.LuaMenuMPRulesPoints8,
					f0_local9.LuaMenuMPRulesPoints9,
					f0_local9.LuaMenuMPRulesPoints10,
					f0_local9.LuaMenuMPRulesPoints15,
					f0_local9.LuaMenuMPRulesPoints20,
					f0_local9.LuaMenuMPRulesPoints25
				} ) )
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.FrontData, f0_local6.MidfieldScore, f0_local7.LuaMenuMPRulesMidfieldScore, f0_local8.LuaMenuMPRulesMidfieldScoreDesc, {
					f0_local9.LuaMenuMPRulesPoints0,
					f0_local9.LuaMenuMPRulesPoints1,
					f0_local9.LuaMenuMPRulesPoints2,
					f0_local9.LuaMenuMPRulesPoints3,
					f0_local9.LuaMenuMPRulesPoints4,
					f0_local9.LuaMenuMPRulesPoints5,
					f0_local9.LuaMenuMPRulesPoints6,
					f0_local9.LuaMenuMPRulesPoints7,
					f0_local9.LuaMenuMPRulesPoints8,
					f0_local9.LuaMenuMPRulesPoints9,
					f0_local9.LuaMenuMPRulesPoints10,
					f0_local9.LuaMenuMPRulesPoints15,
					f0_local9.LuaMenuMPRulesPoints20,
					f0_local9.LuaMenuMPRulesPoints25
				} ) )
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.FrontData, f0_local6.EnemyBaseScore, f0_local7.LuaMenuMPRulesEnemyBaseScore, f0_local8.LuaMenuMPRulesEnemyBaseScoreDesc, {
					f0_local9.LuaMenuMPRulesPoints0,
					f0_local9.LuaMenuMPRulesPoints1,
					f0_local9.LuaMenuMPRulesPoints2,
					f0_local9.LuaMenuMPRulesPoints3,
					f0_local9.LuaMenuMPRulesPoints4,
					f0_local9.LuaMenuMPRulesPoints5,
					f0_local9.LuaMenuMPRulesPoints6,
					f0_local9.LuaMenuMPRulesPoints7,
					f0_local9.LuaMenuMPRulesPoints8,
					f0_local9.LuaMenuMPRulesPoints9,
					f0_local9.LuaMenuMPRulesPoints10,
					f0_local9.LuaMenuMPRulesPoints15,
					f0_local9.LuaMenuMPRulesPoints20,
					f0_local9.LuaMenuMPRulesPoints25
				} ) )
			end
			if f35_local1 == MP.GameMode.BallGameType then
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.BallData, f0_local6.ScoreCarry, f0_local7.LuaMenuMPRulesScoreCarry, f0_local8.LuaMenuMPRulesScoreCarryDesc, {
					f0_local9.LuaMenuMPRulesPoints1,
					f0_local9.LuaMenuMPRulesPoints2,
					f0_local9.LuaMenuMPRulesPoints3,
					f0_local9.LuaMenuMPRulesPoints4,
					f0_local9.LuaMenuMPRulesPoints5,
					f0_local9.LuaMenuMPRulesPoints6,
					f0_local9.LuaMenuMPRulesPoints7,
					f0_local9.LuaMenuMPRulesPoints8,
					f0_local9.LuaMenuMPRulesPoints9
				} ) )
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.BallData, f0_local6.ScoreThrow, f0_local7.LuaMenuMPRulesScoreThrow, f0_local8.LuaMenuMPRulesScoreThrowDesc, {
					f0_local9.LuaMenuMPRulesPoints1,
					f0_local9.LuaMenuMPRulesPoints2,
					f0_local9.LuaMenuMPRulesPoints3,
					f0_local9.LuaMenuMPRulesPoints4,
					f0_local9.LuaMenuMPRulesPoints5,
					f0_local9.LuaMenuMPRulesPoints6,
					f0_local9.LuaMenuMPRulesPoints7,
					f0_local9.LuaMenuMPRulesPoints8,
					f0_local9.LuaMenuMPRulesPoints9
				} ) )
				local f35_local2 = function ()
					return MatchRules.GetData( f0_local5.BallData, f0_local6.SatelliteCount ) > 1
				end
				
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.BallData, f0_local6.SatelliteCount, f0_local7.LuaMenuMPRulesSatelliteCount, f0_local8.LuaMenuMPRulesSatelliteCountDesc, {
					f0_local9.LuaMenuMPRulesSatellites1,
					f0_local9.LuaMenuMPRulesSatellites2,
					f0_local9.LuaMenuMPRulesSatellites3,
					f0_local9.LuaMenuMPRulesSatellites4,
					f0_local9.LuaMenuMPRulesSatellites5
				}, nil, {
					{
						eventName = "rule_changed_ballData_satelliteCount",
						eventFunction = function ( f37_arg0, f37_arg1 )
							if f35_local2() then
								MatchRules.SetData( f0_local5.BallCommonData, f0_local6.PossessionResetCondition, 0 )
								MatchRules.SetData( f0_local5.BallCommonData, f0_local6.PossessionResetTime, 0 )
								if f37_arg1.shouldRefreshButtonValues then
									f35_arg0.GameSetupCategoryOptions:processEvent( {
										name = "refresh_button_values",
										button = f37_arg0
									} )
								end
							end
						end
					}
				} ) )
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.BallData, f0_local6.PracticeMode, f0_local7.LuaMenuMPRulesPracticeMode, f0_local8.LuaMenuMPRulesPracticeModeDesc, {
					f0_local9.LuaMenuMPDisabled,
					f0_local9.LuaMenuMPEnabled
				} ) )
				local f35_local3 = function ()
					return MatchRules.GetData( f0_local5.BallCommonData, f0_local6.PossessionResetCondition ) == 0
				end
				
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.BallCommonData, f0_local6.PossessionResetCondition, f0_local7.LuaMenuMPRulesPossessionResetCondition, f0_local8.LuaMenuMPRulesPossessionResetConditionDesc, {
					f0_local9.LuaMenuMPValuePossessionResetNever,
					f0_local9.LuaMenuMPValuePossessionResetFirstTouch,
					f0_local9.LuaMenuMPValuePossessionResetIndividualTouch
				}, f35_local2, {
					{
						eventName = "rule_changed_ballData_satelliteCount",
						eventFunction = function ( f39_arg0, f39_arg1 )
							if f35_local2() then
								f39_arg0:disable()
							else
								f39_arg0:enable()
							end
						end
					}
				} ) )
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.BallCommonData, f0_local6.PossessionResetTime, f0_local7.LuaMenuMPRulesPossessionResetTime, f0_local8.LuaMenuMPRulesPossessionResetTimeDesc, {
					f0_local9.LuaMenuMPRulesUnlimited,
					f0_local9.LuaMenuMPRulesSeconds1,
					f0_local9.LuaMenuMPRulesSeconds2,
					f0_local9.LuaMenuMPRulesSeconds3,
					f0_local9.LuaMenuMPRulesSeconds4,
					f0_local9.LuaMenuMPRulesSeconds5,
					f0_local9.LuaMenuMPRulesSeconds6,
					f0_local9.LuaMenuMPRulesSeconds7,
					f0_local9.LuaMenuMPRulesSeconds8,
					f0_local9.LuaMenuMPRulesSeconds9,
					f0_local9.LuaMenuMPRulesSeconds10,
					f0_local9.LuaMenuMPRulesSeconds11,
					f0_local9.LuaMenuMPRulesSeconds12,
					f0_local9.LuaMenuMPRulesSeconds13,
					f0_local9.LuaMenuMPRulesSeconds14,
					f0_local9.LuaMenuMPRulesSeconds15,
					f0_local9.LuaMenuMPRulesSeconds20,
					f0_local9.LuaMenuMPRulesSeconds25,
					f0_local9.LuaMenuMPRulesSeconds30,
					f0_local9.LuaMenuMPRulesSeconds45,
					f0_local9.LuaMenuMPRulesSeconds60,
					f0_local9.LuaMenuMPRulesSeconds90,
					f0_local9.LuaMenuMPRulesSeconds120,
					f0_local9.LuaMenuMPRulesSeconds150
				}, f35_local3, {
					{
						eventName = "rule_changed_ballCommonData_possessionResetCondition",
						eventFunction = function ( f40_arg0, f40_arg1 )
							if f35_local3() then
								f40_arg0:disable()
							else
								f40_arg0:enable()
							end
						end
					}
				} ) )
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.BallCommonData, f0_local6.IdleResetTime, f0_local7.LuaMenuMPRulesIdleResetTime, f0_local8.LuaMenuMPRulesIdleResetTimeDesc, {
					f0_local9.LuaMenuMPRulesInstant,
					f0_local9.LuaMenuMPRulesSeconds1,
					f0_local9.LuaMenuMPRulesSeconds2,
					f0_local9.LuaMenuMPRulesSeconds3,
					f0_local9.LuaMenuMPRulesSeconds4,
					f0_local9.LuaMenuMPRulesSeconds5,
					f0_local9.LuaMenuMPRulesSeconds6,
					f0_local9.LuaMenuMPRulesSeconds7,
					f0_local9.LuaMenuMPRulesSeconds8,
					f0_local9.LuaMenuMPRulesSeconds9,
					f0_local9.LuaMenuMPRulesSeconds10,
					f0_local9.LuaMenuMPRulesSeconds11,
					f0_local9.LuaMenuMPRulesSeconds12,
					f0_local9.LuaMenuMPRulesSeconds13,
					f0_local9.LuaMenuMPRulesSeconds14,
					f0_local9.LuaMenuMPRulesSeconds15,
					f0_local9.LuaMenuMPRulesSeconds20,
					f0_local9.LuaMenuMPRulesSeconds25,
					f0_local9.LuaMenuMPRulesSeconds30
				} ) )
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.BallCommonData, f0_local6.ExplodeOnExpire, f0_local7.LuaMenuMPRulesExplodeOnExpire, f0_local8.LuaMenuMPRulesExplodeOnExpireDesc, {
					f0_local9.LuaMenuMPDisabled,
					f0_local9.LuaMenuMPEnabled
				} ) )
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.BallCommonData, f0_local6.ArmorMod, f0_local7.LuaMenuMPRulesArmorMod, f0_local8.LuaMenuMPRulesArmorModDesc, {
					f0_local9.LuaMenuMPDisabledNumValue,
					f0_local9.LuaMenuMPRulesMultiplierQuarter,
					f0_local9.LuaMenuMPRulesMultiplierHalf,
					f0_local9.LuaMenuMPRulesMultiplierThreeQuarter,
					f0_local9.LuaMenuMPRulesNormalMod,
					f0_local9.LuaMenuMPRulesMultiplier1Quarter,
					f0_local9.LuaMenuMPRulesMultiplier1Half,
					f0_local9.LuaMenuMPRulesMultiplier1ThreeQuarter,
					f0_local9.LuaMenuMPRulesMultiplier2
				} ) )
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.BallCommonData, f0_local6.ShowEnemyCarrier, f0_local7.LuaMenuMPRulesShowEnemyCarrier, f0_local8.LuaMenuMPRulesShowEnemyCarrierDesc, {
					f0_local9.LuaMenuMPDisabledNumValue,
					f0_local9.LuaMenuMPConstantNumValue,
					f0_local9.LuaMenuMPRulesPingSeconds1,
					f0_local9.LuaMenuMPRulesPingSeconds1Half,
					f0_local9.LuaMenuMPRulesPingSeconds2,
					f0_local9.LuaMenuMPRulesPingSeconds3,
					f0_local9.LuaMenuMPRulesPingSeconds4
				} ) )
			end
			if f35_local1 == MP.GameMode.CTFGameType then
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.CTFData, f0_local6.WinRule, f0_local7.LuaMenuMPRulesWinRule, f0_local8.LuaMenuMPRulesWinRuleDesc, {
					f0_local9.LuaMenuMPRulesRoundWins,
					f0_local9.LuaMenuMPRulesTotalFlagCaptures
				} ) )
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.CTFData, f0_local6.ShowEnemyCarrier, f0_local7.LuaMenuMPRulesShowEnemyCarrier, f0_local8.LuaMenuMPRulesShowEnemyCarrierDesc, {
					f0_local9.LuaMenuMPDisabledNumValue,
					f0_local9.LuaMenuMPConstantNumValue,
					f0_local9.LuaMenuMPRulesPingSeconds1,
					f0_local9.LuaMenuMPRulesPingSeconds1Half,
					f0_local9.LuaMenuMPRulesPingSeconds2,
					f0_local9.LuaMenuMPRulesPingSeconds3,
					f0_local9.LuaMenuMPRulesPingSeconds4
				} ) )
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.CTFData, f0_local6.IdleResetTime, f0_local7.LuaMenuMPRulesIdleResetTime, f0_local8.LuaMenuMPRulesIdleResetTimeDesc, {
					f0_local9.LuaMenuMPRulesUnlimited,
					f0_local9.LuaMenuMPRulesSeconds5,
					f0_local9.LuaMenuMPRulesSeconds10,
					f0_local9.LuaMenuMPRulesSeconds15,
					f0_local9.LuaMenuMPRulesSeconds20,
					f0_local9.LuaMenuMPRulesSeconds25,
					f0_local9.LuaMenuMPRulesSeconds30,
					f0_local9.LuaMenuMPRulesSeconds35,
					f0_local9.LuaMenuMPRulesSeconds40,
					f0_local9.LuaMenuMPRulesSeconds45,
					f0_local9.LuaMenuMPRulesSeconds50,
					f0_local9.LuaMenuMPRulesSeconds55,
					f0_local9.LuaMenuMPRulesSeconds60
				} ) )
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.CTFData, f0_local6.CaptureCondition, f0_local7.LuaMenuMPRulesCaptureCondition, f0_local8.LuaMenuMPRulesCaptureConditionDesc, {
					f0_local9.LuaMenuMPRulesFlagAtBase,
					f0_local9.LuaMenuMPRulesFlagAnywhere
				} ) )
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.CTFData, f0_local6.PickupTime, f0_local7.LuaMenuMPRulesPickupTime, f0_local8.LuaMenuMPRulesPickupTimeDesc, {
					f0_local9.LuaMenuMPRulesInstant,
					f0_local9.LuaMenuMPRulesSeconds0Half,
					f0_local9.LuaMenuMPRulesSeconds1,
					f0_local9.LuaMenuMPRulesSeconds1Half,
					f0_local9.LuaMenuMPRulesSeconds2,
					f0_local9.LuaMenuMPRulesSeconds2Half,
					f0_local9.LuaMenuMPRulesSeconds3,
					f0_local9.LuaMenuMPRulesSeconds4,
					f0_local9.LuaMenuMPRulesSeconds5,
					f0_local9.LuaMenuMPRulesSeconds6,
					f0_local9.LuaMenuMPRulesSeconds7,
					f0_local9.LuaMenuMPRulesSeconds8,
					f0_local9.LuaMenuMPRulesSeconds9,
					f0_local9.LuaMenuMPRulesSeconds10
				} ) )
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.CTFData, f0_local6.ReturnTime, f0_local7.LuaMenuMPRulesReturnTime, f0_local8.LuaMenuMPRulesReturnTimeDesc, {
					f0_local9.LuaMenuMPRulesDisabledNeg,
					f0_local9.LuaMenuMPRulesInstant,
					f0_local9.LuaMenuMPRulesSeconds0Half,
					f0_local9.LuaMenuMPRulesSeconds1,
					f0_local9.LuaMenuMPRulesSeconds1Half,
					f0_local9.LuaMenuMPRulesSeconds2,
					f0_local9.LuaMenuMPRulesSeconds2Half,
					f0_local9.LuaMenuMPRulesSeconds3,
					f0_local9.LuaMenuMPRulesSeconds4,
					f0_local9.LuaMenuMPRulesSeconds5,
					f0_local9.LuaMenuMPRulesSeconds6,
					f0_local9.LuaMenuMPRulesSeconds7,
					f0_local9.LuaMenuMPRulesSeconds8,
					f0_local9.LuaMenuMPRulesSeconds9,
					f0_local9.LuaMenuMPRulesSeconds10
				} ) )
			end
			if f35_local1 == MP.GameMode.GrndGameType then
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.GrndData, f0_local6.DropTime, f0_local7.LuaMenuMPRulesDropTime, f0_local8.LuaMenuMPRulesDropTimeDesc, {
					f0_local9.LuaMenuMPDisabledNumValue,
					f0_local9.LuaMenuMPRulesSeconds5,
					f0_local9.LuaMenuMPRulesSeconds10,
					f0_local9.LuaMenuMPRulesSeconds15,
					f0_local9.LuaMenuMPRulesSeconds20,
					f0_local9.LuaMenuMPRulesSeconds25,
					f0_local9.LuaMenuMPRulesSeconds30,
					f0_local9.LuaMenuMPRulesSeconds35,
					f0_local9.LuaMenuMPRulesSeconds40,
					f0_local9.LuaMenuMPRulesSeconds45,
					f0_local9.LuaMenuMPRulesSeconds50,
					f0_local9.LuaMenuMPRulesSeconds55,
					f0_local9.LuaMenuMPRulesSeconds60
				} ) )
			end
			if f35_local1 == MP.GameMode.DemoGameType then
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.DemData, f0_local6.ExtraTime, f0_local7.LuaMenuMPRulesExtraTime, f0_local8.LuaMenuMPRulesExtraTimeDesc, {
					f0_local9.LuaMenuMPDisabledNumValue,
					f0_local9.LuaMenuMPRulesMinutesHalf,
					f0_local9.LuaMenuMPRulesMinutes1,
					f0_local9.LuaMenuMPRulesMinutes1Half,
					f0_local9.LuaMenuMPRulesMinutes2,
					f0_local9.LuaMenuMPRulesMinutes2Half,
					f0_local9.LuaMenuMPRulesMinutes3,
					f0_local9.LuaMenuMPRulesMinutes3Half,
					f0_local9.LuaMenuMPRulesMinutes4,
					f0_local9.LuaMenuMPRulesMinutes4Half,
					f0_local9.LuaMenuMPRulesMinutes5
				} ) )
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.DemData, f0_local6.OvertimeLimit, f0_local7.LuaMenuMPRulesOvertimeLimit, f0_local8.LuaMenuMPRulesOvertimeLimitDesc, {
					f0_local9.LuaMenuMPRulesUnlimited,
					f0_local9.LuaMenuMPRulesMinutes1,
					f0_local9.LuaMenuMPRulesMinutes1Half,
					f0_local9.LuaMenuMPRulesMinutes2,
					f0_local9.LuaMenuMPRulesMinutes2Half,
					f0_local9.LuaMenuMPRulesMinutes3,
					f0_local9.LuaMenuMPRulesMinutes3Half,
					f0_local9.LuaMenuMPRulesMinutes4,
					f0_local9.LuaMenuMPRulesMinutes4Half,
					f0_local9.LuaMenuMPRulesMinutes5
				} ) )
			end
			if f35_local1 == MP.GameMode.SDGameType or f35_local1 == MP.GameMode.SRGameType or f35_local1 == MP.GameMode.DemoGameType then
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.BombData, f0_local6.BombTimer, f0_local7.LuaMenuMPRulesBombTimer, f0_local8.LuaMenuMPRulesBombTimerDesc, {
					f0_local9.LuaMenuMPRulesSeconds5,
					f0_local9.LuaMenuMPRulesSeconds15,
					f0_local9.LuaMenuMPRulesSeconds30,
					f0_local9.LuaMenuMPRulesSeconds45,
					f0_local9.LuaMenuMPRulesSeconds60
				} ) )
			end
			if f35_local1 == MP.GameMode.SDGameType or f35_local1 == MP.GameMode.SRGameType or f35_local1 == MP.GameMode.DemoGameType then
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.BombData, f0_local6.PlantTime, f0_local7.LuaMenuMPRulesPlantTime, f0_local8.LuaMenuMPRulesPlantTimeDesc, {
					f0_local9.LuaMenuMPRulesSeconds1,
					f0_local9.LuaMenuMPRulesSeconds2Half,
					f0_local9.LuaMenuMPRulesSeconds5,
					f0_local9.LuaMenuMPRulesSeconds7Half,
					f0_local9.LuaMenuMPRulesSeconds10
				} ) )
			end
			if f35_local1 == MP.GameMode.SDGameType or f35_local1 == MP.GameMode.SRGameType or f35_local1 == MP.GameMode.DemoGameType then
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.BombData, f0_local6.DefuseTime, f0_local7.LuaMenuMPRulesDefuseTime, f0_local8.LuaMenuMPRulesDefuseTimeDesc, {
					f0_local9.LuaMenuMPRulesSeconds1,
					f0_local9.LuaMenuMPRulesSeconds2Half,
					f0_local9.LuaMenuMPRulesSeconds5,
					f0_local9.LuaMenuMPRulesSeconds7Half,
					f0_local9.LuaMenuMPRulesSeconds10
				} ) )
			end
			if f35_local1 == MP.GameMode.SDGameType or f35_local1 == MP.GameMode.SRGameType then
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.BombData, f0_local6.MultiBomb, f0_local7.LuaMenuMPRulesMultiBomb, f0_local8.LuaMenuMPRulesMultiBombDesc, {
					f0_local9.LuaMenuMPDisabled,
					f0_local9.LuaMenuMPEnabled
				} ) )
			end
			if f35_local1 == MP.GameMode.SDGameType or f35_local1 == MP.GameMode.SRGameType or f35_local1 == MP.GameMode.DemoGameType then
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.BombData, f0_local6.SilentPlant, f0_local7.LuaMenuMPRulesSilentPlant, f0_local8.LuaMenuMPRulesSilentPlantDesc, {
					f0_local9.LuaMenuMPDisabled,
					f0_local9.LuaMenuMPEnabled
				} ) )
			end
			if f35_local1 == MP.GameMode.DemoGameType then
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.CommonOption, f0_local6.DogTags, f0_local7.LuaMenuMPRulesDogTags, f0_local8.LuaMenuMPRulesDogTagsDesc, {
					f0_local9.LuaMenuMPDisabled,
					f0_local9.LuaMenuMPEnabled
				} ) )
			end
			if f35_local1 == MP.GameMode.TDefGameType then
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.TdefData, f0_local6.ScoringTime, f0_local7.LuaMenuMPRulesScoringTime, f0_local8.LuaMenuMPRulesScoringTimeDesc, {
					f0_local9.LuaMenuMPRulesSeconds1,
					f0_local9.LuaMenuMPRulesSeconds2,
					f0_local9.LuaMenuMPRulesSeconds3,
					f0_local9.LuaMenuMPRulesSeconds4,
					f0_local9.LuaMenuMPRulesSeconds5,
					f0_local9.LuaMenuMPRulesSeconds6,
					f0_local9.LuaMenuMPRulesSeconds7,
					f0_local9.LuaMenuMPRulesSeconds8,
					f0_local9.LuaMenuMPRulesSeconds9,
					f0_local9.LuaMenuMPRulesSeconds10
				} ) )
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.TdefData, f0_local6.ScorePerTick, f0_local7.LuaMenuMPRulesScorePerTick, f0_local8.LuaMenuMPRulesScorePerTickDesc, {
					f0_local9.LuaMenuMPRulesPoints1,
					f0_local9.LuaMenuMPRulesPoints2,
					f0_local9.LuaMenuMPRulesPoints3,
					f0_local9.LuaMenuMPRulesPoints4,
					f0_local9.LuaMenuMPRulesPoints5,
					f0_local9.LuaMenuMPRulesPoints10,
					f0_local9.LuaMenuMPRulesPoints15,
					f0_local9.LuaMenuMPRulesPoints20,
					f0_local9.LuaMenuMPRulesPoints25
				} ) )
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.TdefData, f0_local6.CarrierBonusTime, f0_local7.LuaMenuMPRulesCarrierBonusTime, f0_local8.LuaMenuMPRulesCarrierBonusTimeDesc, {
					f0_local9.LuaMenuMPRulesSeconds1,
					f0_local9.LuaMenuMPRulesSeconds2,
					f0_local9.LuaMenuMPRulesSeconds3,
					f0_local9.LuaMenuMPRulesSeconds4,
					f0_local9.LuaMenuMPRulesSeconds5,
					f0_local9.LuaMenuMPRulesSeconds6,
					f0_local9.LuaMenuMPRulesSeconds7,
					f0_local9.LuaMenuMPRulesSeconds8,
					f0_local9.LuaMenuMPRulesSeconds9,
					f0_local9.LuaMenuMPRulesSeconds10
				} ) )
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.TdefData, f0_local6.CarrierBonusScore, f0_local7.LuaMenuMPRulesCarrierBonusScore, f0_local8.LuaMenuMPRulesCarrierBonusScoreDesc, {
					f0_local9.LuaMenuMPRulesPoints0,
					f0_local9.LuaMenuMPRulesPoints25,
					f0_local9.LuaMenuMPRulesPoints50,
					f0_local9.LuaMenuMPRulesPoints75,
					f0_local9.LuaMenuMPRulesPoints100,
					f0_local9.LuaMenuMPRulesPoints150,
					f0_local9.LuaMenuMPRulesPoints200,
					f0_local9.LuaMenuMPRulesPoints250
				} ) )
				local f35_local2 = function ()
					return not MatchRules.GetData( f0_local5.TdefData, f0_local6.DelayPlayer )
				end
				
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.TdefData, f0_local6.DelayPlayer, f0_local7.LuaMenuMPRulesDelayPlayer, f0_local8.LuaMenuMPRulesDelayPlayerDesc, {
					f0_local9.LuaMenuMPEnabled,
					f0_local9.LuaMenuMPDisabled
				} ) )
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.TdefData, f0_local6.SpawnDelay, f0_local7.LuaMenuMPRulesSpawnDelay, f0_local8.LuaMenuMPRulesSpawnDelayDesc, {
					f0_local9.LuaMenuMPDisabledNumValue,
					f0_local9.LuaMenuMPRulesSeconds0Half,
					f0_local9.LuaMenuMPRulesSeconds1,
					f0_local9.LuaMenuMPRulesSeconds1Half,
					f0_local9.LuaMenuMPRulesSeconds2,
					f0_local9.LuaMenuMPRulesSeconds2Half,
					f0_local9.LuaMenuMPRulesSeconds3,
					f0_local9.LuaMenuMPRulesSeconds4,
					f0_local9.LuaMenuMPRulesSeconds5,
					f0_local9.LuaMenuMPRulesSeconds7Half,
					f0_local9.LuaMenuMPRulesSeconds10
				}, f35_local2, {
					{
						eventName = "rule_changed_tdefData_delayPlayer",
						eventFunction = function ( f42_arg0, f42_arg1 )
							if f35_local2() then
								f42_arg0:disable()
							else
								f42_arg0:enable()
							end
						end
					}
				} ) )
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.TdefData, f0_local6.BallActivationDelay, f0_local7.LuaMenuMPRulesBallActivationDelay, f0_local8.LuaMenuMPRulesBallActivationDelayDesc, {
					f0_local9.LuaMenuMPDisabledNumValue,
					f0_local9.LuaMenuMPRulesSeconds1,
					f0_local9.LuaMenuMPRulesSeconds2,
					f0_local9.LuaMenuMPRulesSeconds3,
					f0_local9.LuaMenuMPRulesSeconds4,
					f0_local9.LuaMenuMPRulesSeconds5,
					f0_local9.LuaMenuMPRulesSeconds6,
					f0_local9.LuaMenuMPRulesSeconds7,
					f0_local9.LuaMenuMPRulesSeconds8,
					f0_local9.LuaMenuMPRulesSeconds9,
					f0_local9.LuaMenuMPRulesSeconds10,
					f0_local9.LuaMenuMPRulesSeconds11,
					f0_local9.LuaMenuMPRulesSeconds12,
					f0_local9.LuaMenuMPRulesSeconds13,
					f0_local9.LuaMenuMPRulesSeconds14,
					f0_local9.LuaMenuMPRulesSeconds15,
					f0_local9.LuaMenuMPRulesSeconds20,
					f0_local9.LuaMenuMPRulesSeconds25,
					f0_local9.LuaMenuMPRulesSeconds30
				} ) )
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.BallCommonData, f0_local6.PossessionResetCondition, f0_local7.LuaMenuMPRulesPossessionResetCondition, f0_local8.LuaMenuMPRulesPossessionResetConditionDesc, {
					f0_local9.LuaMenuMPValuePossessionResetNever,
					f0_local9.LuaMenuMPValuePossessionResetFirstTouch,
					f0_local9.LuaMenuMPValuePossessionResetIndividualTouch
				} ) )
				local f35_local3 = function ()
					return MatchRules.GetData( f0_local5.BallCommonData, f0_local6.PossessionResetCondition ) == 0
				end
				
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.BallCommonData, f0_local6.PossessionResetTime, f0_local7.LuaMenuMPRulesPossessionResetTime, f0_local8.LuaMenuMPRulesPossessionResetTimeDesc, {
					f0_local9.LuaMenuMPRulesUnlimited,
					f0_local9.LuaMenuMPRulesSeconds5,
					f0_local9.LuaMenuMPRulesSeconds6,
					f0_local9.LuaMenuMPRulesSeconds7,
					f0_local9.LuaMenuMPRulesSeconds8,
					f0_local9.LuaMenuMPRulesSeconds9,
					f0_local9.LuaMenuMPRulesSeconds10,
					f0_local9.LuaMenuMPRulesSeconds11,
					f0_local9.LuaMenuMPRulesSeconds12,
					f0_local9.LuaMenuMPRulesSeconds13,
					f0_local9.LuaMenuMPRulesSeconds14,
					f0_local9.LuaMenuMPRulesSeconds15,
					f0_local9.LuaMenuMPRulesSeconds20,
					f0_local9.LuaMenuMPRulesSeconds25,
					f0_local9.LuaMenuMPRulesSeconds30,
					f0_local9.LuaMenuMPRulesSeconds45,
					f0_local9.LuaMenuMPRulesSeconds60,
					f0_local9.LuaMenuMPRulesSeconds90,
					f0_local9.LuaMenuMPRulesSeconds120,
					f0_local9.LuaMenuMPRulesSeconds150
				}, f35_local3, {
					{
						eventName = "rule_changed_ballCommonData_possessionResetCondition",
						eventFunction = function ( f44_arg0, f44_arg1 )
							if f35_local3() then
								f44_arg0:disable()
							else
								f44_arg0:enable()
							end
						end
					}
				} ) )
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.BallCommonData, f0_local6.IdleResetTime, f0_local7.LuaMenuMPRulesIdleResetTime, f0_local8.LuaMenuMPRulesIdleResetTimeDesc, {
					f0_local9.LuaMenuMPRulesInstant,
					f0_local9.LuaMenuMPRulesSeconds1,
					f0_local9.LuaMenuMPRulesSeconds2,
					f0_local9.LuaMenuMPRulesSeconds3,
					f0_local9.LuaMenuMPRulesSeconds4,
					f0_local9.LuaMenuMPRulesSeconds5,
					f0_local9.LuaMenuMPRulesSeconds6,
					f0_local9.LuaMenuMPRulesSeconds7,
					f0_local9.LuaMenuMPRulesSeconds8,
					f0_local9.LuaMenuMPRulesSeconds9,
					f0_local9.LuaMenuMPRulesSeconds10,
					f0_local9.LuaMenuMPRulesSeconds11,
					f0_local9.LuaMenuMPRulesSeconds12,
					f0_local9.LuaMenuMPRulesSeconds13,
					f0_local9.LuaMenuMPRulesSeconds14,
					f0_local9.LuaMenuMPRulesSeconds15,
					f0_local9.LuaMenuMPRulesSeconds20,
					f0_local9.LuaMenuMPRulesSeconds25,
					f0_local9.LuaMenuMPRulesSeconds30
				} ) )
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.BallCommonData, f0_local6.ExplodeOnExpire, f0_local7.LuaMenuMPRulesExplodeOnExpire, f0_local8.LuaMenuMPRulesExplodeOnExpireDesc, {
					f0_local9.LuaMenuMPDisabled,
					f0_local9.LuaMenuMPEnabled
				} ) )
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.BallCommonData, f0_local6.ArmorMod, f0_local7.LuaMenuMPRulesArmorMod, f0_local8.LuaMenuMPRulesArmorModDesc, {
					f0_local9.LuaMenuMPDisabledNumValue,
					f0_local9.LuaMenuMPRulesMultiplierQuarter,
					f0_local9.LuaMenuMPRulesMultiplierHalf,
					f0_local9.LuaMenuMPRulesMultiplierThreeQuarter,
					f0_local9.LuaMenuMPRulesNormalMod,
					f0_local9.LuaMenuMPRulesMultiplier1Quarter,
					f0_local9.LuaMenuMPRulesMultiplier1Half,
					f0_local9.LuaMenuMPRulesMultiplier1ThreeQuarter,
					f0_local9.LuaMenuMPRulesMultiplier2
				} ) )
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.BallCommonData, f0_local6.ShowEnemyCarrier, f0_local7.LuaMenuMPRulesShowEnemyCarrier, f0_local8.LuaMenuMPRulesShowEnemyCarrierDesc, {
					f0_local9.LuaMenuMPDisabledNumValue,
					f0_local9.LuaMenuMPConstantNumValue,
					f0_local9.LuaMenuMPRulesPingSeconds1,
					f0_local9.LuaMenuMPRulesPingSeconds1Half,
					f0_local9.LuaMenuMPRulesPingSeconds2,
					f0_local9.LuaMenuMPRulesPingSeconds3,
					f0_local9.LuaMenuMPRulesPingSeconds4
				} ) )
			end
			if f35_local1 == MP.GameMode.DomGameType then
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.DomData, f0_local6.FlagCaptureTime, f0_local7.LuaMenuMPRulesFlagCaptureTime, f0_local8.LuaMenuMPRulesCapRateDesc, {
					f0_local9.LuaMenuMPRulesNearInstant,
					f0_local9.LuaMenuMPRulesSeconds1,
					f0_local9.LuaMenuMPRulesSeconds2,
					f0_local9.LuaMenuMPRulesSeconds3,
					f0_local9.LuaMenuMPRulesSeconds4,
					f0_local9.LuaMenuMPRulesSeconds5,
					f0_local9.LuaMenuMPRulesSeconds6,
					f0_local9.LuaMenuMPRulesSeconds7,
					f0_local9.LuaMenuMPRulesSeconds8,
					f0_local9.LuaMenuMPRulesSeconds9,
					f0_local9.LuaMenuMPRulesSeconds10,
					f0_local9.LuaMenuMPRulesSeconds11,
					f0_local9.LuaMenuMPRulesSeconds12,
					f0_local9.LuaMenuMPRulesSeconds13,
					f0_local9.LuaMenuMPRulesSeconds14,
					f0_local9.LuaMenuMPRulesSeconds15
				} ) )
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.DomData, f0_local6.FlagsRequiredToScore, f0_local7.LuaMenuMPRulesFlagsRequiredToScore, f0_local8.LuaMenuMPRulesFlagsRequiredToScoreDesc, {
					f0_local9.LuaMenuMPRulesZones1,
					f0_local9.LuaMenuMPRulesZones2,
					f0_local9.LuaMenuMPRulesZones3
				} ) )
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.DomData, f0_local6.PointsPerFlag, f0_local7.LuaMenuMPRulesPointsPerFlag, f0_local8.LuaMenuMPRulesPointsPerFlagDesc, {
					f0_local9.LuaMenuMPRulesPoints1,
					f0_local9.LuaMenuMPRulesPoints2,
					f0_local9.LuaMenuMPRulesPoints3,
					f0_local9.LuaMenuMPRulesPoints4,
					f0_local9.LuaMenuMPRulesPoints5,
					f0_local9.LuaMenuMPRulesPoints10,
					f0_local9.LuaMenuMPRulesPoints15,
					f0_local9.LuaMenuMPRulesPoints20,
					f0_local9.LuaMenuMPRulesPoints25,
					f0_local9.LuaMenuMPRulesPoints30,
					f0_local9.LuaMenuMPRulesPoints35,
					f0_local9.LuaMenuMPRulesPoints40,
					f0_local9.LuaMenuMPRulesPoints45,
					f0_local9.LuaMenuMPRulesPoints50
				} ) )
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.DomData, f0_local6.FlagNeutralization, f0_local7.LuaMenuMPRulesFlagNeutralization, f0_local8.LuaMenuMPRulesFlagNeutralizationDesc, {
					f0_local9.LuaMenuMPDisabled,
					f0_local9.LuaMenuMPEnabled
				} ) )
			end
			if f35_local1 == MP.GameMode.HardpointGameType or f35_local1 == MP.GameMode.GrndGameType then
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.KOTHData, f0_local6.ZoneCaptureTime, f0_local7.LuaMenuMPRulesZoneCaptureTime, f0_local8.LuaMenuMPRulesCapRateDesc, {
					f0_local9.LuaMenuMPRulesInstant,
					f0_local9.LuaMenuMPRulesSeconds1,
					f0_local9.LuaMenuMPRulesSeconds2,
					f0_local9.LuaMenuMPRulesSeconds3,
					f0_local9.LuaMenuMPRulesSeconds4,
					f0_local9.LuaMenuMPRulesSeconds5,
					f0_local9.LuaMenuMPRulesSeconds6,
					f0_local9.LuaMenuMPRulesSeconds7,
					f0_local9.LuaMenuMPRulesSeconds8,
					f0_local9.LuaMenuMPRulesSeconds9,
					f0_local9.LuaMenuMPRulesSeconds10,
					f0_local9.LuaMenuMPRulesSeconds11,
					f0_local9.LuaMenuMPRulesSeconds12,
					f0_local9.LuaMenuMPRulesSeconds13,
					f0_local9.LuaMenuMPRulesSeconds14,
					f0_local9.LuaMenuMPRulesSeconds15,
					f0_local9.LuaMenuMPRulesSeconds20,
					f0_local9.LuaMenuMPRulesSeconds25,
					f0_local9.LuaMenuMPRulesSeconds30
				} ) )
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.KOTHData, f0_local6.ZoneLifetime, f0_local7.LuaMenuMPRulesZoneLifetime, f0_local8.LuaMenuMPRulesZoneLifetimeDesc, {
					f0_local9.LuaMenuMPRulesUnlimited,
					f0_local9.LuaMenuMPRulesSeconds30,
					f0_local9.LuaMenuMPRulesSeconds45,
					f0_local9.LuaMenuMPRulesSeconds60,
					f0_local9.LuaMenuMPRulesSeconds90,
					f0_local9.LuaMenuMPRulesSeconds120,
					f0_local9.LuaMenuMPRulesSeconds150,
					f0_local9.LuaMenuMPRulesSeconds180,
					f0_local9.LuaMenuMPRulesSeconds210,
					f0_local9.LuaMenuMPRulesSeconds240,
					f0_local9.LuaMenuMPRulesSeconds270,
					f0_local9.LuaMenuMPRulesSeconds300
				} ) )
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.KOTHData, f0_local6.ZoneActivationDelay, f0_local7.LuaMenuMPRulesZoneActivationDelay, f0_local8.LuaMenuMPRulesZoneActivationDelayDesc, {
					f0_local9.LuaMenuMPDisabledNumValue,
					f0_local9.LuaMenuMPRulesSeconds1,
					f0_local9.LuaMenuMPRulesSeconds2,
					f0_local9.LuaMenuMPRulesSeconds3,
					f0_local9.LuaMenuMPRulesSeconds4,
					f0_local9.LuaMenuMPRulesSeconds5,
					f0_local9.LuaMenuMPRulesSeconds6,
					f0_local9.LuaMenuMPRulesSeconds7,
					f0_local9.LuaMenuMPRulesSeconds8,
					f0_local9.LuaMenuMPRulesSeconds9,
					f0_local9.LuaMenuMPRulesSeconds10,
					f0_local9.LuaMenuMPRulesSeconds11,
					f0_local9.LuaMenuMPRulesSeconds12,
					f0_local9.LuaMenuMPRulesSeconds13,
					f0_local9.LuaMenuMPRulesSeconds14,
					f0_local9.LuaMenuMPRulesSeconds15,
					f0_local9.LuaMenuMPRulesSeconds20,
					f0_local9.LuaMenuMPRulesSeconds25,
					f0_local9.LuaMenuMPRulesSeconds30
				} ) )
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.KOTHData, f0_local6.RandomLocationOrder, f0_local7.LuaMenuMPRulesRandomLocationOrder, f0_local8.LuaMenuMPRulesRandomLocationOrderDesc, {
					f0_local9.LuaMenuMPRulesLocationOrderLinear,
					f0_local9.LuaMenuMPRulesLocationOrderRandom
				} ) )
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.KOTHData, f0_local6.AdditiveScoring, f0_local7.LuaMenuMPRulesAdditiveScoring, f0_local8.LuaMenuMPRulesAdditiveScoringDesc, {
					f0_local9.LuaMenuMPRulesScoringConstant,
					f0_local9.LuaMenuMPRulesScoringAdditive
				} ) )
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.KOTHData, f0_local6.PauseTime, f0_local7.LuaMenuMPRulesPauseTime, f0_local8.LuaMenuMPRulesPauseTimeDesc, {
					f0_local9.LuaMenuMPDisabled,
					f0_local9.LuaMenuMPEnabled
				} ) )
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.KOTHData, f0_local6.DelayPlayer, f0_local7.LuaMenuMPRulesCaptureDelayPlayer, f0_local8.LuaMenuMPRulesCaptureDelayPlayerDesc, {
					f0_local9.LuaMenuMPEnabled,
					f0_local9.LuaMenuMPDisabled
				} ) )
			end
			if f35_local1 == MP.GameMode.HardpointGameType then
				local f35_local2 = function ()
					return MatchRules.GetData( f0_local5.KOTHData, f0_local6.UseHQRules )
				end
				
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.KOTHData, f0_local6.UseHQRules, f0_local7.LuaMenuMPRulesUseHQRules, f0_local8.LuaMenuMPRulesUseHQRulesDesc, {
					f0_local9.LuaMenuMPDisabled,
					f0_local9.LuaMenuMPEnabled
				}, nil, {
					{
						eventName = "rule_changed_kothData_useHQRules",
						eventFunction = function ( f46_arg0, f46_arg1 )
							if f35_local2() then
								MatchRules.SetData( f0_local5.CommonOption, f0_local6.TimeLimit, 15 )
								MatchRules.SetData( f0_local5.KOTHData, f0_local6.ZoneCaptureTime, 20 )
								MatchRules.SetData( f0_local5.KOTHData, f0_local6.ZoneLifetime, 60 )
								MatchRules.SetData( f0_local5.KOTHData, f0_local6.ZoneActivationDelay, 30 )
								MatchRules.SetData( f0_local5.KOTHData, f0_local6.RandomLocationOrder, true )
								MatchRules.SetData( f0_local5.KOTHData, f0_local6.PauseTime, false )
								MatchRules.SetData( f0_local5.KOTHData, f0_local6.DelayPlayer, true )
								MatchRules.SetData( f0_local5.KOTHData, f0_local6.AdditiveScoring, false )
								if f46_arg1.shouldRefreshButtonValues then
									f35_arg0.GameSetupCategoryOptions:processEvent( {
										name = "refresh_button_values",
										button = f46_arg0
									} )
								end
							end
						end
					}
				} ) )
			end
			if f35_local1 == MP.GameMode.ConfGameType then
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.ConfData, f0_local6.PointsPerConfirm, f0_local7.LuaMenuMPRulesPointsPerConfirm, f0_local8.LuaMenuMPRulesPointsPerConfirmDesc, {
					f0_local9.LuaMenuMPRulesPoints0,
					f0_local9.LuaMenuMPRulesPoints1,
					f0_local9.LuaMenuMPRulesPoints2,
					f0_local9.LuaMenuMPRulesPoints3,
					f0_local9.LuaMenuMPRulesPoints4,
					f0_local9.LuaMenuMPRulesPoints5,
					f0_local9.LuaMenuMPRulesPoints10,
					f0_local9.LuaMenuMPRulesPoints15,
					f0_local9.LuaMenuMPRulesPoints20,
					f0_local9.LuaMenuMPRulesPoints25
				} ) )
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.ConfData, f0_local6.PointsPerDeny, f0_local7.LuaMenuMPRulesPointsPerDeny, f0_local8.LuaMenuMPRulesPointsPerDenyDesc, {
					f0_local9.LuaMenuMPRulesPoints0,
					f0_local9.LuaMenuMPRulesPoints1,
					f0_local9.LuaMenuMPRulesPoints2,
					f0_local9.LuaMenuMPRulesPoints3,
					f0_local9.LuaMenuMPRulesPoints4,
					f0_local9.LuaMenuMPRulesPoints5,
					f0_local9.LuaMenuMPRulesPoints10,
					f0_local9.LuaMenuMPRulesPoints15,
					f0_local9.LuaMenuMPRulesPoints20,
					f0_local9.LuaMenuMPRulesPoints25
				} ) )
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.CommonOption, f0_local6.PointsPerKill, f0_local7.LuaMenuMPRulesPointsPerKill, f0_local8.LuaMenuMPRulesPointsPerKillDesc, {
					f0_local9.LuaMenuMPRulesPoints0,
					f0_local9.LuaMenuMPRulesPoints1,
					f0_local9.LuaMenuMPRulesPoints2,
					f0_local9.LuaMenuMPRulesPoints3,
					f0_local9.LuaMenuMPRulesPoints4,
					f0_local9.LuaMenuMPRulesPoints5,
					f0_local9.LuaMenuMPRulesPoints10,
					f0_local9.LuaMenuMPRulesPoints15,
					f0_local9.LuaMenuMPRulesPoints20,
					f0_local9.LuaMenuMPRulesPoints25
				} ) )
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.CommonOption, f0_local6.PointsPerDeath, f0_local7.LuaMenuMPRulesPointsPerDeath, f0_local8.LuaMenuMPRulesPointsPerDeathDesc, {
					f0_local9.LuaMenuMPRulesPoints0,
					f0_local9.LuaMenuMPRulesPoints1,
					f0_local9.LuaMenuMPRulesPoints2,
					f0_local9.LuaMenuMPRulesPoints3,
					f0_local9.LuaMenuMPRulesPoints4,
					f0_local9.LuaMenuMPRulesPoints5,
					f0_local9.LuaMenuMPRulesPoints10,
					f0_local9.LuaMenuMPRulesPoints15,
					f0_local9.LuaMenuMPRulesPoints20,
					f0_local9.LuaMenuMPRulesPoints25
				} ) )
			end
			if f35_local1 == MP.GameMode.GrindGameType then
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.GrindData, f0_local6.BankTime, f0_local7.LuaMenuMPRulesBankTime, f0_local8.LuaMenuMPRulesBankTimeDesc, {
					f0_local9.LuaMenuMPRulesSeconds0Half,
					f0_local9.LuaMenuMPRulesSeconds1,
					f0_local9.LuaMenuMPRulesSeconds1Half,
					f0_local9.LuaMenuMPRulesSeconds2,
					f0_local9.LuaMenuMPRulesSeconds2Half,
					f0_local9.LuaMenuMPRulesSeconds3,
					f0_local9.LuaMenuMPRulesSeconds3Half,
					f0_local9.LuaMenuMPRulesSeconds4,
					f0_local9.LuaMenuMPRulesSeconds4Half,
					f0_local9.LuaMenuMPRulesSeconds5,
					f0_local9.LuaMenuMPRulesSeconds5Half,
					f0_local9.LuaMenuMPRulesSeconds6,
					f0_local9.LuaMenuMPRulesSeconds6Half,
					f0_local9.LuaMenuMPRulesSeconds7,
					f0_local9.LuaMenuMPRulesSeconds7Half,
					f0_local9.LuaMenuMPRulesSeconds8,
					f0_local9.LuaMenuMPRulesSeconds8Half,
					f0_local9.LuaMenuMPRulesSeconds9,
					f0_local9.LuaMenuMPRulesSeconds9Half,
					f0_local9.LuaMenuMPRulesSeconds10
				} ) )
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.GrindData, f0_local6.BankRate, f0_local7.LuaMenuMPRulesBankRate, f0_local8.LuaMenuMPRulesBankRateDesc, {
					f0_local9.LuaMenuMPRulesTags1,
					f0_local9.LuaMenuMPRulesTags2,
					f0_local9.LuaMenuMPRulesTags3,
					f0_local9.LuaMenuMPRulesTags4,
					f0_local9.LuaMenuMPRulesTags5,
					f0_local9.LuaMenuMPRulesTags6,
					f0_local9.LuaMenuMPRulesTags7,
					f0_local9.LuaMenuMPRulesTags8,
					f0_local9.LuaMenuMPRulesTags9,
					f0_local9.LuaMenuMPRulesTags10
				} ) )
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.GrindData, f0_local6.BankCaptureTime, f0_local7.LuaMenuMPRulesBankCapture, f0_local8.LuaMenuMPRulesBankCaptureDesc, {
					f0_local9.LuaMenuMPRulesInstant,
					f0_local9.LuaMenuMPRulesSeconds1,
					f0_local9.LuaMenuMPRulesSeconds2,
					f0_local9.LuaMenuMPRulesSeconds3,
					f0_local9.LuaMenuMPRulesSeconds4,
					f0_local9.LuaMenuMPRulesSeconds5,
					f0_local9.LuaMenuMPRulesSeconds6,
					f0_local9.LuaMenuMPRulesSeconds7,
					f0_local9.LuaMenuMPRulesSeconds8,
					f0_local9.LuaMenuMPRulesSeconds9,
					f0_local9.LuaMenuMPRulesSeconds10
				} ) )
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.GrindData, f0_local6.MegaBankLimit, f0_local7.LuaMenuMPRulesMegaBankLimit, f0_local8.LuaMenuMPRulesMegaBankLimitDesc, {
					f0_local9.LuaMenuMPRulesTags5,
					f0_local9.LuaMenuMPRulesTags6,
					f0_local9.LuaMenuMPRulesTags7,
					f0_local9.LuaMenuMPRulesTags8,
					f0_local9.LuaMenuMPRulesTags9,
					f0_local9.LuaMenuMPRulesTags10,
					f0_local9.LuaMenuMPRulesTags11,
					f0_local9.LuaMenuMPRulesTags12,
					f0_local9.LuaMenuMPRulesTags13,
					f0_local9.LuaMenuMPRulesTags14,
					f0_local9.LuaMenuMPRulesTags15
				} ) )
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.GrindData, f0_local6.MegaBankBonus, f0_local7.LuaMenuMPRulesMegaBankBonus, f0_local8.LuaMenuMPRulesMegaBankBonusDesc, {
					f0_local9.LuaMenuMPRulesPoints0,
					f0_local9.LuaMenuMPRulesPoints50,
					f0_local9.LuaMenuMPRulesPoints100,
					f0_local9.LuaMenuMPRulesPoints150,
					f0_local9.LuaMenuMPRulesPoints200,
					f0_local9.LuaMenuMPRulesPoints250,
					f0_local9.LuaMenuMPRulesPoints300,
					f0_local9.LuaMenuMPRulesPoints350,
					f0_local9.LuaMenuMPRulesPoints400,
					f0_local9.LuaMenuMPRulesPoints450,
					f0_local9.LuaMenuMPRulesPoints500,
					f0_local9.LuaMenuMPRulesPoints550,
					f0_local9.LuaMenuMPRulesPoints600,
					f0_local9.LuaMenuMPRulesPoints650,
					f0_local9.LuaMenuMPRulesPoints700,
					f0_local9.LuaMenuMPRulesPoints750
				} ) )
			end
			if f35_local1 == MP.GameMode.SiegeGameType then
				local f35_local2 = function ()
					return not MatchRules.GetData( f0_local5.SiegeData, f0_local6.RushTimer )
				end
				
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.SiegeData, f0_local6.RushTimer, f0_local7.LuaMenuMPRulesRushTimer, f0_local8.LuaMenuMPRulesRushTimerDesc, {
					f0_local9.LuaMenuMPDisabled,
					f0_local9.LuaMenuMPEnabled
				} ) )
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.SiegeData, f0_local6.RushTimerAmount, f0_local7.LuaMenuMPRulesRushTimerAmount, f0_local8.LuaMenuMPRulesRushTimerAmountDesc, {
					f0_local9.LuaMenuMPRulesSeconds30,
					f0_local9.LuaMenuMPRulesSeconds45,
					f0_local9.LuaMenuMPRulesSeconds60,
					f0_local9.LuaMenuMPRulesSeconds90,
					f0_local9.LuaMenuMPRulesSeconds120
				}, f35_local2, {
					{
						eventName = "rule_changed_siegeData_rushTimer",
						eventFunction = function ( f48_arg0, f48_arg1 )
							if f35_local2() then
								f48_arg0:disable()
							else
								f48_arg0:enable()
							end
						end
					}
				} ) )
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.SiegeData, f0_local6.SharedRushTimer, f0_local7.LuaMenuMPRulesSharedRushTimer, f0_local8.LuaMenuMPRulesSharedRushTimerDesc, {
					f0_local9.LuaMenuMPDisabled,
					f0_local9.LuaMenuMPEnabled
				}, f35_local2, {
					{
						eventName = "rule_changed_siegeData_rushTimer",
						eventFunction = function ( f49_arg0, f49_arg1 )
							if f35_local2() then
								f49_arg0:disable()
							else
								f49_arg0:enable()
							end
						end
					}
				} ) )
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.SiegeData, f0_local6.CapRate, f0_local7.LuaMenuMPRulesCapRate, f0_local8.LuaMenuMPRulesCapRateDesc, {
					f0_local9.LuaMenuMPRulesSeconds1,
					f0_local9.LuaMenuMPRulesSeconds1Half,
					f0_local9.LuaMenuMPRulesSeconds2,
					f0_local9.LuaMenuMPRulesSeconds2Half,
					f0_local9.LuaMenuMPRulesSeconds3,
					f0_local9.LuaMenuMPRulesSeconds3Half,
					f0_local9.LuaMenuMPRulesSeconds4,
					f0_local9.LuaMenuMPRulesSeconds4Half,
					f0_local9.LuaMenuMPRulesSeconds5,
					f0_local9.LuaMenuMPRulesSeconds5Half,
					f0_local9.LuaMenuMPRulesSeconds6,
					f0_local9.LuaMenuMPRulesSeconds6Half,
					f0_local9.LuaMenuMPRulesSeconds7,
					f0_local9.LuaMenuMPRulesSeconds7Half,
					f0_local9.LuaMenuMPRulesSeconds8,
					f0_local9.LuaMenuMPRulesSeconds8Half,
					f0_local9.LuaMenuMPRulesSeconds9,
					f0_local9.LuaMenuMPRulesSeconds9Half,
					f0_local9.LuaMenuMPRulesSeconds10
				} ) )
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.SiegeData, f0_local6.PreCapPoints, f0_local7.LuaMenuMPRulesPreCap, f0_local8.LuaMenuMPRulesPreCapDesc, {
					f0_local9.LuaMenuMPDisabled,
					f0_local9.LuaMenuMPEnabled
				} ) )
			end
			if f35_local1 == MP.GameMode.InfectGameType then
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.InfectData, f0_local6.NumInitialInfected, f0_local7.LuaMenuMPRulesNumInitialInfected, f0_local8.LuaMenuMPRulesNumInitialInfectedDesc, {
					f0_local9.LuaMenuMPRulesNum1,
					f0_local9.LuaMenuMPRulesNum2,
					f0_local9.LuaMenuMPRulesNum3,
					f0_local9.LuaMenuMPRulesNum4,
					f0_local9.LuaMenuMPRulesNum5,
					f0_local9.LuaMenuMPRulesNum6
				} ) )
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.InfectData, f0_local6.WeaponSurvivorPrimary, f0_local7.LuaMenuMPRulesSurvivorPrimaryWeapon, f0_local8.LuaMenuMPRulesSurvivorPrimaryWeaponDesc, {
					f0_local9.LuaMenuMPRulesSPASC,
					f0_local9.LuaMenuMPRulesDEVASTATOR,
					f0_local9.LuaMenuMPRulesSPAS,
					f0_local9.LuaMenuMPRulesSONIC,
					f0_local9.LuaMenuMPRulesSDFSHOTTY,
					f0_local9.LuaMenuMPRulesAR57,
					f0_local9.LuaMenuMPRulesAKE,
					f0_local9.LuaMenuMPRulesNV4,
					f0_local9.LuaMenuMPRulesFMG,
					f0_local9.LuaMenuMPRulesSDFAR,
					f0_local9.LuaMenuMPRulesARCLASSIC,
					f0_local9.LuaMenuMPRulesERAD,
					f0_local9.LuaMenuMPRulesCRB,
					f0_local9.LuaMenuMPRulesRIPPER,
					f0_local9.LuaMenuMPRulesUMP45,
					f0_local9.LuaMenuMPRulesFHR,
					f0_local9.LuaMenuMPRulesUMP45C,
					f0_local9.LuaMenuMPRulesMAULER,
					f0_local9.LuaMenuMPRulesSDFLMG,
					f0_local9.LuaMenuMPRulesLMG03,
					f0_local9.LuaMenuMPRulesKBS,
					f0_local9.LuaMenuMPRulesCHEYTAC,
					f0_local9.LuaMenuMPRulesM8,
					f0_local9.LuaMenuMPRulesM1,
					f0_local9.LuaMenuMPRulesCHEYTACC,
					f0_local9.LuaMenuMPRulesM1C,
					f0_local9.LuaMenuMPRulesWeaponNone
				} ) )
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.InfectData, f0_local6.WeaponSurvivorSecondary, f0_local7.LuaMenuMPRulesSurvivorSecondaryWeapon, f0_local8.LuaMenuMPRulesSurvivorSecondaryWeaponDesc, {
					f0_local9.LuaMenuMPRulesG18,
					f0_local9.LuaMenuMPRulesNRG,
					f0_local9.LuaMenuMPRulesEMC,
					f0_local9.LuaMenuMPRulesREVOLVER,
					f0_local9.LuaMenuMPRulesG18C,
					f0_local9.LuaMenuMPRulesLOCKON,
					f0_local9.LuaMenuMPRulesCHARGESHOT,
					f0_local9.LuaMenuMPRulesGLPROX,
					f0_local9.LuaMenuMPRulesWeaponNone
				} ) )
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.InfectData, f0_local6.LethalSurvivor, f0_local7.LuaMenuMPRulesSurvivorLethal, f0_local8.LuaMenuMPRulesSurvivorLethalDesc, {
					f0_local9.LuaMenuMPRulesPlasmaGrenade,
					f0_local9.LuaMenuMPRulesSplitGrenade,
					f0_local9.LuaMenuMPRulesExplodingDrone,
					f0_local9.LuaMenuMPRulesBlackHoleGrenade,
					f0_local9.LuaMenuMPRulesBioSpike,
					f0_local9.LuaMenuMPRulesClusterGrenade,
					f0_local9.LuaMenuMPRulesSpiderGrenade,
					f0_local9.LuaMenuMPRulesTripMine,
					f0_local9.LuaMenuMPRulesArmLauncher,
					f0_local9.LuaMenuMPRulesC4,
					f0_local9.LuaMenuMPRulesThrowingKnife,
					f0_local9.LuaMenuMPRulesWeaponNone
				} ) )
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.InfectData, f0_local6.TacticalSurvivor, f0_local7.LuaMenuMPRulesSurvivorTactical, f0_local8.LuaMenuMPRulesSurvivorTacticalDesc, {
					f0_local9.LuaMenuMPRulesBlackOutGrenade,
					f0_local9.LuaMenuMPRulesDomeShield,
					f0_local9.LuaMenuMPRulesPersonalRadar,
					f0_local9.LuaMenuMPRulesAdrenaline,
					f0_local9.LuaMenuMPRulesJammerGrenade,
					f0_local9.LuaMenuMPRulesTrophySystem,
					f0_local9.LuaMenuMPRulesCryoMine,
					f0_local9.LuaMenuMPRulesSmokeGrenade,
					f0_local9.LuaMenuMPRulesWeaponNone
				} ) )
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.InfectData, f0_local6.WeaponInfectedPrimary, f0_local7.LuaMenuMPRulesInfectedPrimaryWeapon, f0_local8.LuaMenuMPRulesInfectedPrimaryWeaponDesc, {
					f0_local9.LuaMenuMPRulesKnife,
					f0_local9.LuaMenuMPRulesSPASC,
					f0_local9.LuaMenuMPRulesDEVASTATOR,
					f0_local9.LuaMenuMPRulesSPAS,
					f0_local9.LuaMenuMPRulesSONIC,
					f0_local9.LuaMenuMPRulesSDFSHOTTY,
					f0_local9.LuaMenuMPRulesAR57,
					f0_local9.LuaMenuMPRulesAKE,
					f0_local9.LuaMenuMPRulesNV4,
					f0_local9.LuaMenuMPRulesFMG,
					f0_local9.LuaMenuMPRulesSDFAR,
					f0_local9.LuaMenuMPRulesARCLASSIC,
					f0_local9.LuaMenuMPRulesERAD,
					f0_local9.LuaMenuMPRulesCRB,
					f0_local9.LuaMenuMPRulesRIPPER,
					f0_local9.LuaMenuMPRulesUMP45,
					f0_local9.LuaMenuMPRulesFHR,
					f0_local9.LuaMenuMPRulesUMP45C,
					f0_local9.LuaMenuMPRulesMAULER,
					f0_local9.LuaMenuMPRulesSDFLMG,
					f0_local9.LuaMenuMPRulesLMG03,
					f0_local9.LuaMenuMPRulesKBS,
					f0_local9.LuaMenuMPRulesCHEYTAC,
					f0_local9.LuaMenuMPRulesM8,
					f0_local9.LuaMenuMPRulesM1,
					f0_local9.LuaMenuMPRulesCHEYTACC,
					f0_local9.LuaMenuMPRulesM1C,
					f0_local9.LuaMenuMPRulesWeaponNone
				} ) )
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.InfectData, f0_local6.WeaponInfectSecondary, f0_local7.LuaMenuMPRulesInfectedSecondaryWeapon, f0_local8.LuaMenuMPRulesInfectedSecondaryWeaponDesc, {
					f0_local9.LuaMenuMPRulesFists,
					f0_local9.LuaMenuMPRulesNRG,
					f0_local9.LuaMenuMPRulesG18,
					f0_local9.LuaMenuMPRulesEMC,
					f0_local9.LuaMenuMPRulesREVOLVER,
					f0_local9.LuaMenuMPRulesG18C,
					f0_local9.LuaMenuMPRulesLOCKON,
					f0_local9.LuaMenuMPRulesCHARGESHOT,
					f0_local9.LuaMenuMPRulesGLPROX,
					f0_local9.LuaMenuMPRulesWeaponNone,
					f0_local9.LuaMenuMPRulesKnife
				} ) )
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.InfectData, f0_local6.LethalInfected, f0_local7.LuaMenuMPRulesInfectedLethal, f0_local8.LuaMenuMPRulesInfectedLethalDesc, {
					f0_local9.LuaMenuMPRulesPlasmaGrenade,
					f0_local9.LuaMenuMPRulesSplitGrenade,
					f0_local9.LuaMenuMPRulesExplodingDrone,
					f0_local9.LuaMenuMPRulesBlackHoleGrenade,
					f0_local9.LuaMenuMPRulesBioSpike,
					f0_local9.LuaMenuMPRulesClusterGrenade,
					f0_local9.LuaMenuMPRulesSpiderGrenade,
					f0_local9.LuaMenuMPRulesTripMine,
					f0_local9.LuaMenuMPRulesArmLauncher,
					f0_local9.LuaMenuMPRulesC4,
					f0_local9.LuaMenuMPRulesThrowingKnife,
					f0_local9.LuaMenuMPRulesWeaponNone
				} ) )
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.InfectData, f0_local6.TacticalInfected, f0_local7.LuaMenuMPRulesInfectedTactical, f0_local8.LuaMenuMPRulesInfectedTacticalDesc, {
					f0_local9.LuaMenuMPRulesBlackOutGrenade,
					f0_local9.LuaMenuMPRulesDomeShield,
					f0_local9.LuaMenuMPRulesPersonalRadar,
					f0_local9.LuaMenuMPRulesAdrenaline,
					f0_local9.LuaMenuMPRulesJammerGrenade,
					f0_local9.LuaMenuMPRulesTrophySystem,
					f0_local9.LuaMenuMPRulesCryoMine,
					f0_local9.LuaMenuMPRulesSmokeGrenade,
					f0_local9.LuaMenuMPRulesTacInsert,
					f0_local9.LuaMenuMPRulesWeaponNone
				} ) )
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.InfectData, f0_local6.WeaponInitialPrimary, f0_local7.LuaMenuMPRulesInfectedInitialPrimaryWeapon, f0_local8.LuaMenuMPRulesInfectedInitialPrimaryWeaponDesc, {
					f0_local9.LuaMenuMPRulesSPASC,
					f0_local9.LuaMenuMPRulesDEVASTATOR,
					f0_local9.LuaMenuMPRulesSPAS,
					f0_local9.LuaMenuMPRulesSONIC,
					f0_local9.LuaMenuMPRulesSDFSHOTTY,
					f0_local9.LuaMenuMPRulesAR57,
					f0_local9.LuaMenuMPRulesAKE,
					f0_local9.LuaMenuMPRulesNV4,
					f0_local9.LuaMenuMPRulesFMG,
					f0_local9.LuaMenuMPRulesSDFAR,
					f0_local9.LuaMenuMPRulesARCLASSIC,
					f0_local9.LuaMenuMPRulesERAD,
					f0_local9.LuaMenuMPRulesCRB,
					f0_local9.LuaMenuMPRulesRIPPER,
					f0_local9.LuaMenuMPRulesUMP45,
					f0_local9.LuaMenuMPRulesFHR,
					f0_local9.LuaMenuMPRulesUMP45C,
					f0_local9.LuaMenuMPRulesMAULER,
					f0_local9.LuaMenuMPRulesSDFLMG,
					f0_local9.LuaMenuMPRulesLMG03,
					f0_local9.LuaMenuMPRulesKBS,
					f0_local9.LuaMenuMPRulesCHEYTAC,
					f0_local9.LuaMenuMPRulesM8,
					f0_local9.LuaMenuMPRulesM1,
					f0_local9.LuaMenuMPRulesCHEYTACC,
					f0_local9.LuaMenuMPRulesM1C,
					f0_local9.LuaMenuMPRulesWeaponNone
				} ) )
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.InfectData, f0_local6.WeaponInitialSecondary, f0_local7.LuaMenuMPRulesInfectedInitialSecondaryWeapon, f0_local8.LuaMenuMPRulesInfectedInitialSecondaryWeaponDesc, {
					f0_local9.LuaMenuMPRulesG18,
					f0_local9.LuaMenuMPRulesNRG,
					f0_local9.LuaMenuMPRulesEMC,
					f0_local9.LuaMenuMPRulesREVOLVER,
					f0_local9.LuaMenuMPRulesG18C,
					f0_local9.LuaMenuMPRulesLOCKON,
					f0_local9.LuaMenuMPRulesCHARGESHOT,
					f0_local9.LuaMenuMPRulesGLPROX,
					f0_local9.LuaMenuMPRulesKnife,
					f0_local9.LuaMenuMPRulesFists,
					f0_local9.LuaMenuMPRulesWeaponNone
				} ) )
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.InfectData, f0_local6.InfectExtraTimePerKill, f0_local7.LuaMenuMPRulesInfectExtraTimePerKill, f0_local8.LuaMenuMPRulesInfectExtraTimePerKillDesc, {
					f0_local9.LuaMenuMPDisabledNumValue,
					f0_local9.LuaMenuMPRulesSeconds5,
					f0_local9.LuaMenuMPRulesSeconds10,
					f0_local9.LuaMenuMPRulesSeconds15,
					f0_local9.LuaMenuMPRulesSeconds20,
					f0_local9.LuaMenuMPRulesSeconds25,
					f0_local9.LuaMenuMPRulesSeconds30,
					f0_local9.LuaMenuMPRulesSeconds35,
					f0_local9.LuaMenuMPRulesSeconds40,
					f0_local9.LuaMenuMPRulesSeconds45,
					f0_local9.LuaMenuMPRulesSeconds50,
					f0_local9.LuaMenuMPRulesSeconds55,
					f0_local9.LuaMenuMPRulesSeconds60
				} ) )
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.InfectData, f0_local6.SurvivorAliveScore, f0_local7.LuaMenuMPRulesSurvivorAliveScore, f0_local8.LuaMenuMPRulesSurvivorAliveScoreDesc, {
					f0_local9.LuaMenuMPRulesPoints0,
					f0_local9.LuaMenuMPRulesPoints25,
					f0_local9.LuaMenuMPRulesPoints50,
					f0_local9.LuaMenuMPRulesPoints75,
					f0_local9.LuaMenuMPRulesPoints100
				} ) )
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.InfectData, f0_local6.InfectStreakBonus, f0_local7.LuaMenuMPRulesInfectStreakBonus, f0_local8.LuaMenuMPRulesInfectStreakBonusDesc, {
					f0_local9.LuaMenuMPRulesPoints0,
					f0_local9.LuaMenuMPRulesPoints25,
					f0_local9.LuaMenuMPRulesPoints50,
					f0_local9.LuaMenuMPRulesPoints75,
					f0_local9.LuaMenuMPRulesPoints100
				} ) )
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.InfectData, f0_local6.EnableInfectedTracker, f0_local7.LuaMenuMPRulesEnableInfectedTracker, f0_local8.LuaMenuMPRulesEnableInfectedTrackerDesc, {
					f0_local9.LuaMenuMPDisabled,
					f0_local9.LuaMenuMPEnabled
				} ) )
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.InfectData, f0_local6.EnablePing, f0_local7.LuaMenuMPRulesEnablePing, f0_local8.LuaMenuMPRulesEnablePingDesc, {
					f0_local9.LuaMenuMPDisabled,
					f0_local9.LuaMenuMPEnabled
				} ) )
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.CommonOption, f0_local6.AllowSupers, f0_local7.LuaMenuMPRulesAllowSupers, f0_local8.LuaMenuMPRulesInfectAllowSupersDesc, {
					f0_local9.LuaMenuMPDisabled,
					f0_local9.LuaMenuMPEnabled
				} ) )
			end
			if f35_local1 == MP.GameMode.FFAGameType then
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.DmData, f0_local6.AONRules, f0_local7.LuaMenuMPRulesAON, f0_local8.LuaMenuMPRulesAONDesc, {
					f0_local9.LuaMenuMPDisabledNumValue,
					f0_local9.LuaMenuMPEnabledNumValue,
					f0_local9.LuaMenuMPRulesAONGesture
				} ) )
			end
			if f35_local1 == MP.GameMode.TDMGameType or f35_local1 == MP.GameMode.FrontGameType then
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.CommonOption, f0_local6.SpawnProtectionTimer, f0_local7.LuaMenuMPRulesSpawnProtectionTimer, f0_local8.LuaMenuMPRulesSpawnProtectionTimerDesc, {
					f0_local9.LuaMenuMPDisabledNumValue,
					f0_local9.LuaMenuMPRulesSeconds1,
					f0_local9.LuaMenuMPRulesSeconds2,
					f0_local9.LuaMenuMPRulesSeconds3,
					f0_local9.LuaMenuMPRulesSeconds4,
					f0_local9.LuaMenuMPRulesSeconds5,
					f0_local9.LuaMenuMPRulesSeconds6,
					f0_local9.LuaMenuMPRulesSeconds7,
					f0_local9.LuaMenuMPRulesSeconds8,
					f0_local9.LuaMenuMPRulesSeconds9,
					f0_local9.LuaMenuMPRulesSeconds10
				} ) )
			end
			if f35_local1 == MP.GameMode.GunGameType then
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.GunData, f0_local6.Setback, f0_local7.LuaMenuMPRulesSetback, f0_local8.LuaMenuMPRulesSetbackDesc, {
					f0_local9.LuaMenuMPDisabledNumValue,
					f0_local9.LuaMenuMPRulesSetbacks1,
					f0_local9.LuaMenuMPRulesSetbacks2,
					f0_local9.LuaMenuMPRulesSetbacks3,
					f0_local9.LuaMenuMPRulesSetbacks4,
					f0_local9.LuaMenuMPRulesSetbacks5
				} ) )
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.GunData, f0_local6.SetbackStreak, f0_local7.LuaMenuMPRulesSetbackStreak, f0_local8.LuaMenuMPRulesSetbackStreakDesc, {
					f0_local9.LuaMenuMPDisabledNumValue,
					f0_local9.LuaMenuMPRulesDeaths1,
					f0_local9.LuaMenuMPRulesDeaths2,
					f0_local9.LuaMenuMPRulesDeaths3,
					f0_local9.LuaMenuMPRulesDeaths4,
					f0_local9.LuaMenuMPRulesDeaths5
				} ) )
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.GunData, f0_local6.KillsPerWeapon, f0_local7.LuaMenuMPRulesKillsPerWeapon, f0_local8.LuaMenuMPRulesKillsPerWeaponDesc, {
					f0_local9.LuaMenuMPRulesKills1,
					f0_local9.LuaMenuMPRulesKills2,
					f0_local9.LuaMenuMPRulesKills3,
					f0_local9.LuaMenuMPRulesKills4,
					f0_local9.LuaMenuMPRulesKills5
				} ) )
				table.insert( f35_local0, f0_local12( f35_arg0, f35_arg1, f0_local5.GunData, f0_local6.LadderIndex, f0_local7.LuaMenuMPRulesLadderIndex, f0_local8.LuaMenuMPRulesLadderIndexDesc, {
					f0_local9.LuaMenuMPRulesLadder1,
					f0_local9.LuaMenuMPRulesLadder2,
					f0_local9.LuaMenuMPRulesLadder3
				} ) )
			end
			if Engine.GetDvarBool( "xblive_competitionmatch" ) and Engine.GetDvarBool( "systemlink" ) then
				MP.nonRecipeOptionsDefaults.scr_game_graceperiod_comp = {
					type = DvarTypeTable.DvarInt,
					val = 60
				}
				if not Engine.GetDvarInt( "scr_game_graceperiod_comp" ) then
					Engine.Exec( "set scr_game_graceperiod_comp " .. MP.nonRecipeOptionsDefaults.scr_game_graceperiod_comp.val )
				end
				table.insert( f35_local0, f0_local13( f35_arg0, f35_arg1, "scr_game_graceperiod_comp", MP.nonRecipeOptionsDefaults.scr_game_graceperiod_comp.type, f0_local7.LuaMenuMPPrematchCountdown, f0_local8.LuaMenuMPPrematchCountdownDesc, {
					f0_local9.LuaMenuMPRulesSeconds60,
					f0_local9.LuaMenuMPRulesSeconds15,
					f0_local9.LuaMenuMPRulesSeconds30,
					f0_local9.LuaMenuMPRulesSeconds45
				} ) )
			else
				MP.nonRecipeOptionsDefaults.scr_game_graceperiod_comp = nil
			end
			return f35_local0
		end
	},
	[f0_local3.Draft] = {
		categoryTitle = "@LUA_MENU_MP_RULES_DRAFT_OPTIONS",
		optionsFeeder = function ( f50_arg0, f50_arg1 )
			local f50_local0 = {}
			local f50_local1 = GetCurrentGameType()
			local f50_local2 = function ()
				return not MLG.AreMLGRulesEnabled()
			end
			
			local f50_local3 = MP.nonRecipeOptionsDefaults.draftLoadoutTimer
			table.insert( f50_local0, f0_local14( f50_arg0, f50_arg1, f0_local7.LuaMenuMPRulesDraftLoadoutTimer, f0_local8.LuaMenuMPRulesDraftLoadoutTimerDesc, f50_local3.getFunc, f50_local3.setFunc, f50_local3.val, {
				f0_local9.LuaMenuMPRulesSeconds1,
				f0_local9.LuaMenuMPRulesSeconds2,
				f0_local9.LuaMenuMPRulesSeconds3,
				f0_local9.LuaMenuMPRulesSeconds4,
				f0_local9.LuaMenuMPRulesSeconds5,
				f0_local9.LuaMenuMPRulesSeconds10,
				f0_local9.LuaMenuMPRulesSeconds15,
				f0_local9.LuaMenuMPRulesSeconds20,
				f0_local9.LuaMenuMPRulesSeconds25,
				f0_local9.LuaMenuMPRulesSeconds30,
				f0_local9.LuaMenuMPRulesSeconds35,
				f0_local9.LuaMenuMPRulesSeconds40,
				f0_local9.LuaMenuMPRulesSeconds45,
				f0_local9.LuaMenuMPRulesSeconds50,
				f0_local9.LuaMenuMPRulesSeconds55,
				f0_local9.LuaMenuMPRulesSeconds60real,
				f0_local9.LuaMenuMPRulesSeconds65,
				f0_local9.LuaMenuMPRulesSeconds70,
				f0_local9.LuaMenuMPRulesSeconds75
			}, f50_local2 ) )
			f50_local3 = MP.nonRecipeOptionsDefaults.draftRigTimer
			table.insert( f50_local0, f0_local14( f50_arg0, f50_arg1, f0_local7.LuaMenuMPRulesDraftRigTimer, f0_local8.LuaMenuMPRulesDraftRigTimerDesc, f50_local3.getFunc, f50_local3.setFunc, f50_local3.val, {
				f0_local9.LuaMenuMPRulesSeconds1,
				f0_local9.LuaMenuMPRulesSeconds2,
				f0_local9.LuaMenuMPRulesSeconds3,
				f0_local9.LuaMenuMPRulesSeconds4,
				f0_local9.LuaMenuMPRulesSeconds5,
				f0_local9.LuaMenuMPRulesSeconds10,
				f0_local9.LuaMenuMPRulesSeconds15,
				f0_local9.LuaMenuMPRulesSeconds20,
				f0_local9.LuaMenuMPRulesSeconds25,
				f0_local9.LuaMenuMPRulesSeconds30
			}, f50_local2 ) )
			return f50_local0
		end
	}
}
local f0_local16 = function ( f64_arg0, f64_arg1 )
	return function ( f65_arg0 )
		local f65_local0 = f0_local15[f65_arg0].optionsFeeder( f64_arg0, f64_arg1 )
		if f64_arg0.currentOptionButtons and #f64_arg0.currentOptionButtons > 0 then
			for f65_local4, f65_local5 in pairs( f64_arg0.currentOptionButtons ) do
				f64_arg0.GameSetupCategoryOptions:removeElement( f65_local5 )
			end
		end
		f64_arg0.currentOptionButtons = {}
		for f65_local4, f65_local5 in pairs( f65_local0 ) do
			table.insert( f64_arg0.currentOptionButtons, f65_local5 )
			f64_arg0.GameSetupCategoryOptions:addElement( f65_local5 )
		end
		ACTIONS.GainFocus( f64_arg0, "GameSetupCategoryOptions", f64_arg1 )
	end
	
end

local f0_local17 = function ( f66_arg0 )
	local f66_local0 = Engine.TableLookup( "mp/gameTypesTable.csv", f0_local4.RefCol, GetCurrentGameType(), f66_arg0 )
	local f66_local1 = "@"
	local f66_local2
	if f66_arg0 == f0_local4.NameCol then
		f66_local2 = "_CAPS"
		if not f66_local2 then
		
		else
			local f66_local3
			if f66_local0 then
				f66_local3 = Engine.Localize( f66_local1 .. f66_local0 .. f66_local2 )
				if not f66_local3 then
				
				else
					return f66_local3
				end
			end
			f66_local3 = "GAMETYPE NOT FOUND"
		end
	end
	f66_local2 = ""
end

local f0_local18 = function ()
	local f67_local0 = GetCurrentGameType()
	assert( f67_local0, "GAMETYPE NOT FOUND" )
	local f67_local1 = Engine.TableLookup( "mp/gameTypesTable.csv", f0_local4.RefCol, f67_local0, f0_local4.ImageCol )
	local f67_local2
	if f67_local1 then
		f67_local2 = RegisterMaterial( f67_local1 )
		if not f67_local2 then
		
		else
			return f67_local2
		end
	end
	f67_local2 = RegisterMaterial( "icon_playlist_generic" )
end

function PostLoadFunc( f68_arg0, f68_arg1, f68_arg2 )
	assert( f68_arg0.GameSetupCategoryOptions )
	assert( f68_arg0.MenuTitle )
	assert( f68_arg0.GameModeIcon )
	assert( f68_arg0.Tabs )
	assert( f68_arg0.Tabs.Tabs )
	assert( f68_arg0.bindButton )
	Lobby.SetupPrivateMatchLobbyScene( f68_arg1 )
	f68_arg0.GameOptionsCategories = f0_local3
	f68_arg0.CategoryOptionsUpdate = f0_local16( f68_arg0, f68_arg1 )
	f68_arg0.MenuTitle.MenuBreadcrumbs:setText( CoD.GetBreadcrumb(), 0 )
	f68_arg0.MenuTitle.MenuTitle:setText( Engine.Localize( "MENU_CHANGE_GAME_RULES_CAPS" ), 0 )
	f68_arg0.GameModeIcon:setImage( f0_local18(), 0 )
	ACTIONS.AnimateSequence( f68_arg0, "Update" )
	if not Engine.IsConsoleGame() then
		f68_arg0.CategoryOptionsUpdate( f0_local3.Game )
	end
	local f68_local0 = {
		[#f68_local0 + 1] = {
			name = Engine.Localize( "@LUA_MENU_GAME_RULES" ),
			id = f0_local3.Game
		},
		[#f68_local0 + 1] = {
			name = Engine.Localize( "@LUA_MENU_MP_RULES_MODE_ADVANCED_OPTIONS" ),
			id = f0_local3.ModeAdvanced
		},
		[#f68_local0 + 1] = {
			name = Engine.Localize( "@LUA_MENU_RULES_PLAYER_OPTIONS" ),
			id = f0_local3.Player
		},
		[#f68_local0 + 1] = {
			name = Engine.Localize( "@LUA_MENU_RULES_TEAM_OPTIONS" ),
			id = f0_local3.Team
		},
		[#f68_local0 + 1] = {
			name = Engine.Localize( "@LUA_MENU_RULES_GAMEPLAY_OPTIONS" ),
			id = f0_local3.Gameplay
		},
		[#f68_local0 + 1] = {
			name = Engine.Localize( "@LUA_MENU_MP_RULES_DRAFT_OPTIONS" ),
			id = f0_local3.Draft
		}
	}
	local f68_local1 = LUI.DataSourceFromList.new( #f68_local0 )
	f68_local1.MakeDataSourceAtIndex = function ( f69_arg0, f69_arg1, f69_arg2 )
		return LUI.DataSourceInGlobalModel.new( f0_local0 .. ".tabName." .. f69_arg1, f68_local0[f69_arg1 + 1].name )
	end
	
	local f68_local2 = LUI.DataSourceFromList.new( #f68_local0 )
	f68_local2.MakeDataSourceAtIndex = function ( f70_arg0, f70_arg1, f70_arg2 )
		local f70_local0 = f68_local0[f70_arg1 + 1].id
		return {
			name = f68_local1:GetDataSourceAtIndex( f70_arg1, f70_arg2 ),
			focusFunction = function ()
				f68_arg0.CategoryOptionsUpdate( f70_local0 )
			end
			
		}
	end
	
	f68_arg0.Tabs.Tabs:SetTabManagerDataSource( f68_local2, f68_arg1 )
	f68_arg0.bindButton:addEventHandler( "button_alt1", function ( f72_arg0, f72_arg1 )
		if MLG.AreMLGRulesEnabled() then
			LUI.FlowManager.RequestPopupMenu( nil, "PopupUnlockGameOptions", true, f68_arg1, false, {
				gameOptionsMenu = f68_arg0
			} )
		else
			LUI.FlowManager.RequestPopupMenu( nil, "PopupResetGameOptions", true, f68_arg1, false, {
				gameOptionsMenu = f68_arg0
			} )
		end
	end )
	if Engine.IsCoreMode() then
		local self = LUI.UIElement.new( {
			worldBlur = 5
		} )
		self:setupWorldBlur()
		self.id = "blur"
		f68_arg0:addElement( self )
	end
	if MLG.AreMLGRulesEnabled() then
		f68_arg0:AddButtonHelperTextToElement( f68_arg0.HelperBar, {
			helper_text = Engine.Localize( "LUA_MENU_UNLOCK_GAME_RULES" ),
			button_ref = "button_alt1",
			side = "left",
			priority = 2,
			clickable = true
		} )
	else
		f68_arg0:AddButtonHelperTextToElement( f68_arg0.HelperBar, {
			helper_text = Engine.Localize( "LUA_MENU_SET_DEFAULT_CONTROLS" ),
			button_ref = "button_alt1",
			side = "left",
			priority = 2,
			clickable = true
		} )
	end
end

function GameSetupOptionsMenu( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "GameSetupOptionsMenu"
	self._animationSets = {}
	self._sequences = {}
	local f73_local1 = controller and controller.controllerIndex
	if not f73_local1 and not Engine.InFrontend() then
		f73_local1 = self:getRootController()
	end
	assert( f73_local1 )
	self:playSound( "menu_open" )
	local f73_local2 = self
	local HelperBar = nil
	
	HelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f73_local1
	} )
	HelperBar.id = "HelperBar"
	HelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( HelperBar )
	self.HelperBar = HelperBar
	
	local FriendsElement = nil
	
	FriendsElement = MenuBuilder.BuildRegisteredType( "online_friends_widget", {
		controllerIndex = f73_local1
	} )
	FriendsElement.id = "FriendsElement"
	FriendsElement:SetFont( FONTS.GetFont( FONTS.Dev.File ) )
	FriendsElement:SetAlignment( LUI.Alignment.Left )
	FriendsElement:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -500, 0, _1080p * 1035, _1080p * 1080 )
	self:addElement( FriendsElement )
	self.FriendsElement = FriendsElement
	
	local GameSetupCategoryOptions = nil
	
	GameSetupCategoryOptions = MenuBuilder.BuildRegisteredType( "GameSetupCategoryOptions", {
		controllerIndex = f73_local1
	} )
	GameSetupCategoryOptions.id = "GameSetupCategoryOptions"
	GameSetupCategoryOptions:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 805, _1080p * 216, _1080p * 816 )
	self:addElement( GameSetupCategoryOptions )
	self.GameSetupCategoryOptions = GameSetupCategoryOptions
	
	local GameModeIconBorder = nil
	
	GameModeIconBorder = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 4,
		borderThicknessRight = _1080p * 4,
		borderThicknessTop = _1080p * 4,
		borderThicknessBottom = _1080p * 4
	} )
	GameModeIconBorder.id = "GameModeIconBorder"
	GameModeIconBorder:SetRGBFromInt( 0, 0 )
	GameModeIconBorder:SetZRotation( 45, 0 )
	GameModeIconBorder:SetBorderThicknessLeft( _1080p * 4, 0 )
	GameModeIconBorder:SetBorderThicknessRight( _1080p * 4, 0 )
	GameModeIconBorder:SetBorderThicknessTop( _1080p * 4, 0 )
	GameModeIconBorder:SetBorderThicknessBottom( _1080p * 4, 0 )
	GameModeIconBorder:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 370, _1080p * 700, _1080p * -210, _1080p * 120 )
	self:addElement( GameModeIconBorder )
	self.GameModeIconBorder = GameModeIconBorder
	
	local RuleInfo = nil
	
	RuleInfo = MenuBuilder.BuildRegisteredType( "GenericItemInfo", {
		controllerIndex = f73_local1
	} )
	RuleInfo.id = "RuleInfo"
	RuleInfo.BodyText:setText( "", 0 )
	RuleInfo.HeaderText:setText( ToUpperCase( "" ), 0 )
	RuleInfo:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -1024, 0, _1080p * -446, _1080p * -314 )
	self:addElement( RuleInfo )
	self.RuleInfo = RuleInfo
	
	local GameModeIcon = nil
	
	GameModeIcon = LUI.UIImage.new()
	GameModeIcon.id = "GameModeIcon"
	GameModeIcon:setImage( RegisterMaterial( "gamemode_generic" ), 0 )
	GameModeIcon:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 360, _1080p * 710, _1080p * -220, _1080p * 130 )
	self:addElement( GameModeIcon )
	self.GameModeIcon = GameModeIcon
	
	local Tabs = nil
	
	Tabs = MenuBuilder.BuildRegisteredType( "SubMenuTabsBar", {
		controllerIndex = f73_local1
	} )
	Tabs.id = "Tabs"
	Tabs:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 145, _1080p * 185 )
	self:addElement( Tabs )
	self.Tabs = Tabs
	
	local MenuTitle = nil
	
	MenuTitle = MenuBuilder.BuildRegisteredType( "MenuTitle", {
		controllerIndex = f73_local1
	} )
	MenuTitle.id = "MenuTitle"
	MenuTitle.MenuTitle:setText( ToUpperCase( "" ), 0 )
	MenuTitle.MenuBreadcrumbs:setText( ToUpperCase( Engine.Localize( "EXE_LOCAL_PLAY" ) ), 0 )
	MenuTitle.Icon:SetTop( _1080p * -28.5, 0 )
	MenuTitle.Icon:SetBottom( _1080p * 61.5, 0 )
	MenuTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
	self:addElement( MenuTitle )
	self.MenuTitle = MenuTitle
	
	local ESportsRulesLabel = nil
	
	ESportsRulesLabel = MenuBuilder.BuildRegisteredType( "ESportsRulesLabel", {
		controllerIndex = f73_local1
	} )
	ESportsRulesLabel.id = "ESportsRulesLabel"
	ESportsRulesLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1178, _1080p * 1778, _1080p * 94, _1080p * 124 )
	self:addElement( ESportsRulesLabel )
	self.ESportsRulesLabel = ESportsRulesLabel
	
	local SocialFeed = nil
	
	SocialFeed = MenuBuilder.BuildRegisteredType( "SocialFeed", {
		controllerIndex = f73_local1
	} )
	SocialFeed.id = "SocialFeed"
	SocialFeed:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1920, _1080p * 965, _1080p * 995 )
	self:addElement( SocialFeed )
	self.SocialFeed = SocialFeed
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		GameModeIconBorder:RegisterAnimationSequence( "Update", {
			{
				function ()
					return self.GameModeIconBorder:SetScale( -0.45, 0 )
				end,
				function ()
					return self.GameModeIconBorder:SetScale( 0, 400, LUI.EASING.outBack )
				end
			}
		} )
		GameModeIcon:RegisterAnimationSequence( "Update", {
			{
				function ()
					return self.GameModeIcon:SetScale( -0.25, 0 )
				end,
				function ()
					return self.GameModeIcon:SetScale( 0, 300, LUI.EASING.outBack )
				end
			}
		} )
		self._sequences.Update = function ()
			GameModeIconBorder:AnimateSequence( "Update" )
			GameModeIcon:AnimateSequence( "Update" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self.addButtonHelperFunction = function ( f81_arg0, f81_arg1 )
		f81_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			priority = 1,
			clickable = true
		} )
	end
	
	self:addEventHandler( "menu_create", self.addButtonHelperFunction )
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	self.bindButton:addEventHandler( "button_secondary", function ( f82_arg0, f82_arg1 )
		local f82_local0 = f82_arg1.controller or f73_local1
		ACTIONS.LeaveMenu( self )
	end )
	PostLoadFunc( self, f73_local1, controller )
	return self
end

MenuBuilder.registerType( "GameSetupOptionsMenu", GameSetupOptionsMenu )
LUI.FlowManager.RegisterStackPopBehaviour( "GameSetupOptionsMenu", f0_local1 )
LockTable( _M )
