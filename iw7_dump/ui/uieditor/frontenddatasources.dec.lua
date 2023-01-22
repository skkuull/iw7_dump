DataSources.frontEnd = {
	MainMenu = {
		SP = {},
		MP = {},
		CP = {}
	},
	MP = {
		flow = {},
		CAC = {},
		challengeCategories = {},
		armory = {
			commonCrate = {},
			rareCrate = {},
			zombieCrate = {},
			zombieRareCrate = {}
		},
		commerce = {},
		conquest = {
			round = {}
		},
		headquarters = {
			emblemEditorArchetype = {},
			combatRecord = {}
		},
		prestigeMenu = {},
		codtv = {},
		cwl = {
			drafting = {}
		}
	},
	CP = {
		fortuneCards = {},
		songs = {},
		prestigeMenu = {},
		reticles = {}
	},
	lobby = {}
}
function InitFrontEndDataSources()
	InitAlwaysLoadedDataSources()
	InitContextualMenuDataSources()
	DataSources.frontEnd.primaryPlayerUserName = LUI.DataSourceInGlobalModel.new( "frontEnd.primaryPlayerUserName" )
	DataSources.frontEnd.lobby.splitscreenPromptText = LUI.DataSourceInGlobalModel.new( "frontEnd.lobby.splitscreenPromptText" )
end

function InitCoreMPFrontEndDataSources()
	if Engine.IsCoreMode() then
		InitAlwaysLoadedCoreMPDataSources()
		InitCommonMPFrontEndDataSources()
		InitCacFrontEndDataSources()
		InitCacCommonDataSources()
		InitMPTabManagerDataSources()
		InitMPCWLDataSources()
		InitChallengeDataSources()
		InitConquestDataSources()
		InitHeadquartersDataSources()
		DataSources.frontEnd.MP.usedDoubleXPToken = LUI.DataSourceInControllerModel.new( "frontEnd.MP.usedDoubleXPToken", false )
	end
end

function InitSPFrontEndDataSources()
	
end

function InitCPFrontEndDataSources()
	if Engine.IsAliensMode() then
		InitAlwaysLoadedCPDataSources()
		InitCommonMPFrontEndDataSources()
		InitCommerceDataSources()
		InitZomFrontEndDataSources()
		WEAPON_BUILD.InitCPLoadoutDataSources()
		InitChallengeDataSources()
		InitHeadquartersDataSources()
	end
end

function InitRPFrontEndDataSources()
	
end

function InitCommerceDataSources()
	DataSources.frontEnd.MP.commerce.craftingCurrency = LUI.DataSourceInControllerModel.new( "frontEnd.commerce.currency.crafting" )
	DataSources.frontEnd.MP.commerce.baseInGameCurrency = LUI.DataSourceInControllerModel.new( "frontEnd.commerce.currency.inGame" )
	DataSources.frontEnd.MP.commerce.inGameCurrency = DataSources.frontEnd.MP.commerce.baseInGameCurrency:Filter( "adjusted", CoD.GetAdjustedCurrency )
	DataSources.frontEnd.MP.commerce.inGameCurrencyDisplay = LUI.DataSourceInControllerModel.new( "frontEnd.commerce.currency.inGameDisplay" )
	DataSources.frontEnd.MP.commerce.percentToNextInGameDollar = DataSources.frontEnd.MP.commerce.baseInGameCurrency:Filter( "percentToNext", CoD.GetPercentToNextCurrency )
	DataSources.frontEnd.MP.commerce.premiumCurrency = LUI.DataSourceInControllerModel.new( "frontEnd.commerce.currency.premium" )
end

local f0_local0 = {}
function InitMPTabManagerDataSources()
	local f7_local0 = DataModel.GetGlobalModel()
	DataModel.SetModelValue( DataModel.CreateModel( f7_local0, "frontEnd.MP.flow.menuCount" ), #f0_local0 )
	DataSources.frontEnd.MP.flow.menuCount = LUI.DataSourceInGlobalModel.new( "frontEnd.MP.flow.menuCount" )
	local f7_local1 = function ( f8_arg0, f8_arg1 )
		return MenuBuilder.BuildRegisteredType( f0_local0[f8_arg1 + 1], {
			controllerIndex = f8_arg0
		} )
	end
	
	local f7_local2 = {}
	for f7_local3 = 0, #f0_local0 - 1, 1 do
		DataModel.SetModelValue( DataModel.CreateModel( f7_local0, "frontEnd.MP.flow.tabs.name." .. f7_local3 ), f0_local0[f7_local3 + 1] )
		f7_local2[f7_local3] = frontEnd.TabManager.GetBuildMenuFocusFunction( f7_local1 )
	end
	DataSources.frontEnd.MP.flow.tabs = LUI.DataSourceFromList.new( DataSources.frontEnd.MP.flow.menuCount )
	DataSources.frontEnd.MP.flow.tabs.MakeDataSourceAtIndex = function ( f9_arg0, f9_arg1, f9_arg2 )
		return {
			name = LUI.DataSourceInGlobalModel.new( "frontEnd.MP.flow.tabs.name." .. f9_arg1 ),
			focusFunction = f7_local2[f9_arg1]
		}
	end
	
end

function InitMPCWLDataSources()
	DataSources.frontEnd.MP.cwl.drafting.countdownTime = LUI.DataSourceInGlobalModel.new( "frontEnd.MP.cwl.drafting.countdownTime" )
end

function InitContextualMenuDataSources()
	local f11_local0 = {
		{
			label = "CONTINUE",
			desc = "CONTINUE Description",
			clickFunc = function ()
				DebugPrint( "CONTINUE button clicked." )
			end
		},
		{
			label = "MISSION SELECT",
			desc = "MISSION SELECT Description",
			clickFunc = function ()
				DebugPrint( "MISSION SELECT button clicked." )
			end
		},
		{
			label = "NEW GAME",
			desc = "NEW GAME Description",
			clickFunc = function ()
				DebugPrint( "NEW GAME button clicked." )
			end
		}
	}
	local f11_local1 = {
		{
			label = "LAST PLAYED",
			desc = "LAST PLAYED Description",
			clickFunc = function ()
				DebugPrint( "LAST PLAYED button clicked." )
			end
		},
		{
			label = "SOCIAL PLAYING",
			desc = "SOCIAL PLAYING Description",
			clickFunc = function ()
				DebugPrint( "SOCIAL PLAYING button clicked." )
			end
		},
		{
			label = "NEXT BIG REWARD",
			desc = "NEXT BIG REWARD Description",
			clickFunc = function ()
				DebugPrint( "NEXT BIG REWARD button clicked." )
			end
		}
	}
	local f11_local2 = {
		{
			label = "LAST PLAYED",
			desc = "LAST PLAYED Description",
			clickFunc = function ()
				DebugPrint( "LAST PLAYED button clicked." )
			end
		},
		{
			label = "SOCIAL PLAYING",
			desc = "SOCIAL PLAYING Description",
			clickFunc = function ()
				DebugPrint( "SOCIAL PLAYING button clicked." )
			end
		},
		{
			label = "NEXT BIG REWARD",
			desc = "NEXT BIG REWARD Description",
			clickFunc = function ()
				DebugPrint( "NEXT BIG REWARD button clicked." )
			end
		}
	}
	DataSources.frontEnd.MainMenu.CampaignButtonContextualMenuDataSource = LUI.DataSourceFromList.new( #f11_local0 )
	DataSources.frontEnd.MainMenu.CampaignButtonContextualMenuDataSource.MakeDataSourceAtIndex = function ( f21_arg0, f21_arg1, f21_arg2 )
		return {
			buttonDataSource = {
				buttonLabel = LUI.DataSourceInGlobalModel.new( "frontEnd.MainMenu.SP.contextMenuLabel." .. f21_arg1, f11_local0[f21_arg1].label ),
				buttonDescription = LUI.DataSourceInGlobalModel.new( "frontEnd.MainMenu.SP.contextMenuDesc." .. f21_arg1, f11_local0[f21_arg1].desc ),
				buttonFunction = f11_local0[f21_arg1].clickFunc
			}
		}
	end
	
	DataSources.frontEnd.MainMenu.MultiplayerButtonContextualMenuDataSource = LUI.DataSourceFromList.new( #f11_local1 )
	DataSources.frontEnd.MainMenu.MultiplayerButtonContextualMenuDataSource.MakeDataSourceAtIndex = function ( f22_arg0, f22_arg1, f22_arg2 )
		return {
			buttonDataSource = {
				buttonLabel = LUI.DataSourceInGlobalModel.new( "frontEnd.MainMenu.MP.contextMenuLabel." .. f22_arg1, f11_local1[f22_arg1].label ),
				buttonDescription = LUI.DataSourceInGlobalModel.new( "frontEnd.MainMenu.MP.contextMenuDesc." .. f22_arg1, f11_local1[f22_arg1].desc ),
				buttonFunction = f11_local1[f22_arg1].clickFunc
			}
		}
	end
	
	DataSources.frontEnd.MainMenu.ZombiesButtonContextualMenuDataSource = LUI.DataSourceFromList.new( #f11_local2 )
	DataSources.frontEnd.MainMenu.ZombiesButtonContextualMenuDataSource.MakeDataSourceAtIndex = function ( f23_arg0, f23_arg1, f23_arg2 )
		return {
			buttonDataSource = {
				buttonLabel = LUI.DataSourceInGlobalModel.new( "frontEnd.MainMenu.CP.contextMenuLabel." .. f23_arg1, f11_local2[f23_arg1].label ),
				buttonDescription = LUI.DataSourceInGlobalModel.new( "frontEnd.MainMenu.CP.contextMenuDesc." .. f23_arg1, f11_local2[f23_arg1].desc ),
				buttonFunction = f11_local2[f23_arg1].clickFunc
			}
		}
	end
	
end

CHALLENGE_CATEGORIES_LIST = {}
local f0_local1 = "frontEnd.MP.challengeCategories"
function WipeChallengeCategoryModel()
	WipeGlobalModelsAtPath( f0_local1 )
end

function InitChallengeCategoriesList()
	CHALLENGE_CATEGORIES_LIST = {}
	local f25_local0 = CSV.challengeCategories.file
	for f25_local1 = 0, Engine.TableGetRowCount( f25_local0 ), 1 do
		local f25_local4 = Engine.TableLookupByRow( f25_local0, f25_local1, CSV.challengeCategories.cols.ref )
		if f25_local4 ~= "" then
			CHALLENGE_CATEGORIES_LIST[f25_local4] = {}
			CHALLENGE_CATEGORIES_LIST[f25_local4].index = tonumber( Engine.TableLookupByRow( f25_local0, f25_local1, CSV.challengeCategories.cols.index ) )
			CHALLENGE_CATEGORIES_LIST[f25_local4].name = Engine.Localize( Engine.TableLookupByRow( f25_local0, f25_local1, CSV.challengeCategories.cols.localizeRef ) )
			CHALLENGE_CATEGORIES_LIST[f25_local4].desc = Engine.Localize( Engine.TableLookupByRow( f25_local0, f25_local1, CSV.challengeCategories.cols.desc ) )
			CHALLENGE_CATEGORIES_LIST[f25_local4].ref = f25_local4
			CHALLENGE_CATEGORIES_LIST[f25_local4].subCategories = {}
		end
	end
	local f25_local1 = CSV.challengeSubCategories.file
	for f25_local2 = 0, Engine.TableGetRowCount( f25_local1 ), 1 do
		local f25_local6 = Engine.TableLookupByRow( f25_local1, f25_local2, CSV.challengeSubCategories.cols.ref )
		if f25_local6 ~= "" then
			local f25_local7 = {
				category = Engine.TableLookupByRow( f25_local1, f25_local2, CSV.challengeSubCategories.cols.category )
			}
			if CHALLENGE_CATEGORIES_LIST[f25_local7.category] ~= nil then
				f25_local7.index = tonumber( Engine.TableLookupByRow( f25_local1, f25_local2, CSV.challengeSubCategories.cols.index ) )
				f25_local7.name = Engine.Localize( Engine.TableLookupByRow( f25_local1, f25_local2, CSV.challengeSubCategories.cols.localizeRef ) )
				f25_local7.image = Engine.TableLookupByRow( f25_local1, f25_local2, CSV.challengeSubCategories.cols.image )
				f25_local7.desc = Engine.Localize( Engine.TableLookupByRow( f25_local1, f25_local2, CSV.challengeSubCategories.cols.desc ) )
				f25_local7.ref = f25_local6
				local f25_local8 = CHALLENGE_CATEGORIES_LIST[f25_local7.category].subCategories
				f25_local8[CountTableKeys( f25_local8 )] = f25_local7
			end
		end
	end
end

function LockIconAlphaFilter( f26_arg0, f26_arg1 )
	local f26_local0
	if f26_arg0 then
		f26_local0 = 0
		if not f26_local0 then
		
		else
			return f26_local0
		end
	end
	f26_local0 = 1
end

function InitChallengeDataSources()
	InitChallengeCategoriesList()
	DataSources.frontEnd.MP.challengeCategories = LUI.DataSourceFromList.new( CountTableKeys( CHALLENGE_CATEGORIES_LIST ) )
	DataSources.frontEnd.MP.challengeCategories.MakeDataSourceAtIndex = function ( f28_arg0, f28_arg1, f28_arg2 )
		local f28_local0 = Challenge.GetCategoryRefFromIndex( f28_arg1 )
		local f28_local1 = f0_local1 .. "." .. f28_local0
		local f28_local2 = LUI.DataSourceInGlobalModel.new( f28_local1 .. ".isUnlocked" )
		f28_local2:SetValue( f28_arg2, Engine.IsUnlocked( f28_arg2, "challenge", f28_local0 ) )
		if CHALLENGE_CATEGORIES_LIST[f28_local0].topChallenges == nil then
			Challenge.PopuplateCategoryInfo( f28_arg2 )
		end
		local f28_local3 = {}
		for f28_local4 = 1, #CHALLENGE_CATEGORIES_LIST[f28_local0].topChallenges, 1 do
			local f28_local7 = CHALLENGE_CATEGORIES_LIST[f28_local0].topChallenges[f28_local4]
			table.insert( f28_local3, CallingCardUtils.GetChallengeEntry( f28_local7.ref, f28_arg2, f28_local7.allChallengesTable ) )
		end
		local f28_local4 = CHALLENGE_CATEGORIES_LIST[f28_local0].totalProgress
		local f28_local5 = math.floor( f28_local4 * 1000 ) / 10
		local f28_local6 = ""
		if f28_local5 - math.floor( f28_local5 ) == 0 then
			f28_local6 = f28_local5 .. "%"
		else
			f28_local6 = string.format( "%.1f", f28_local5 ) .. "%"
		end
		local f28_local8 = LUI.DataSourceFromList.new( CountTableKeys( CHALLENGE_CATEGORIES_LIST[f28_local0].subCategories ) )
		f28_local8.MakeDataSourceAtIndex = function ( f29_arg0, f29_arg1, f29_arg2 )
			local f29_local0 = CHALLENGE_CATEGORIES_LIST[f28_local0].subCategories[f29_arg1]
			local f29_local1 = f28_local1 .. "." .. f29_local0.ref
			return {
				name = LUI.DataSourceInGlobalModel.new( f29_local1 .. ".name", f29_local0.name ),
				desc = LUI.DataSourceInGlobalModel.new( f29_local1 .. ".desc", f29_local0.desc ),
				image = LUI.DataSourceInGlobalModel.new( f29_local1 .. ".image", f29_local0.image ),
				ref = LUI.DataSourceInGlobalModel.new( f29_local1 .. ".ref", f29_local0.ref ),
				index = LUI.DataSourceInGlobalModel.new( f29_local1 .. ".index", f29_local0.index )
			}
		end
		
		local f28_local7 = LUI.DataSourceFromList.new( CountTableKeys( f28_local3 ) )
		f28_local7.MakeDataSourceAtIndex = function ( f30_arg0, f30_arg1, f30_arg2 )
			local f30_local0 = f28_local3[f30_arg1 + 1]
			local f30_local1 = f30_local0.ref
			local f30_local2 = f28_local1 .. ".top." .. f30_local1
			local f30_local3 = f30_local0.image
			if f30_local3 == nil or f30_local3 == "" then
				f30_local3 = CallingCardUtils.GetCardTexture( Engine.TableLookup( CSV.callingCards.file, CSV.callingCards.cols.challenge, f30_local1, CSV.callingCards.cols.index ) )
			end
			return {
				name = LUI.DataSourceInGlobalModel.new( f30_local2 .. ".name", f30_local0.name ),
				desc = LUI.DataSourceInGlobalModel.new( f30_local2 .. ".desc", f30_local0.desc ),
				image = LUI.DataSourceInGlobalModel.new( f30_local2 .. ".image", f30_local3 ),
				ref = LUI.DataSourceInGlobalModel.new( f30_local2 .. ".ref", f30_local1 ),
				tierCount = LUI.DataSourceInGlobalModel.new( f30_local2 .. ".tierCount", f30_local0.tierCount ),
				isCompleted = LUI.DataSourceInGlobalModel.new( f30_local2 .. ".isCompleted", f30_local0.isCompleted ),
				isCompletedAlpha = LUI.DataSourceInGlobalModel.new( f30_local2 .. ".isCompletedAlpha", f30_local0.isCompleted and 1 or 0 ),
				currentTier = LUI.DataSourceInGlobalModel.new( f30_local2 .. ".currentTier", f30_local0.currentTier ),
				currentTierLabel = LUI.DataSourceInGlobalModel.new( f30_local2 .. ".currentTierLabel", f30_local0.currentTierLabel ),
				currentProgress = LUI.DataSourceInGlobalModel.new( f30_local2 .. ".currentProgress", f30_local0.currentProgress ),
				currentProgressPercent = LUI.DataSourceInGlobalModel.new( f30_local2 .. ".currentProgressPercent", f30_local0.currentProgressPercent ),
				currentTierMax = LUI.DataSourceInGlobalModel.new( f30_local2 .. ".currentTierMax", f30_local0.currentTierMax ),
				currentTierXP = LUI.DataSourceInGlobalModel.new( f30_local2 .. ".currentTierXP", f30_local0.currentTierXP ),
				currentTierScore = LUI.DataSourceInGlobalModel.new( f30_local2 .. ".currentTierScore", f30_local0.currentTierScore ),
				isHiddenChallenge = LUI.DataSourceInGlobalModel.new( f30_local2 .. ".isHiddenChallenge", f30_local0.isHiddenChallenge )
			}
		end
		
		return {
			name = LUI.DataSourceInGlobalModel.new( f28_local1 .. ".name", Challenge.GetCategoryName( f28_local0 ) ),
			desc = LUI.DataSourceInGlobalModel.new( f28_local1 .. ".desc", Challenge.GetCategoryDesc( f28_local0 ) ),
			ref = LUI.DataSourceInGlobalModel.new( f28_local1 .. ".ref", f28_local0 ),
			index = LUI.DataSourceInGlobalModel.new( f28_local1 .. ".index", Challenge.GetCategoryIndex( f28_local0 ) ),
			isUnlocked = f28_local2,
			lockIconAlpha = f28_local2:Filter( "iconLockAlpha", LockIconAlphaFilter ),
			subCategories = f28_local8,
			progress = LUI.DataSourceInGlobalModel.new( f28_local1 .. ".progress", f28_local4 ),
			progressText = LUI.DataSourceInGlobalModel.new( f28_local1 .. ".progressText", f28_local6 ),
			topChallenges = f28_local7
		}
	end
	
end

function MissionCompletedFilter( f31_arg0, f31_arg1 )
	return 0 <= f31_arg0
end

function MedalImageFilter( f32_arg0, f32_arg1 )
	if f32_arg0 == 1 then
		return "mission_medal_bronze"
	elseif f32_arg0 == 2 then
		return "mission_medal_silver"
	elseif f32_arg0 == 3 then
		return "mission_medal_gold"
	else
		return "mission_medal_target"
	end
end

function InitConquestRoundDataSources()
	DataSources.frontEnd.MP.conquest.round.missionXp = LUI.DataSourceInControllerModel.new( "frontEnd.MP.conquest.round.missionXp", 0 )
	DataSources.frontEnd.MP.conquest.round.tierCompleted = LUI.DataSourceInControllerModel.new( "frontEnd.MP.conquest.round.tierCompleted", 0 )
	DataSources.frontEnd.MP.conquest.round.medalImage = DataSources.frontEnd.MP.conquest.round.tierCompleted:Filter( "medalImage", MedalImageFilter )
	DataSources.frontEnd.MP.conquest.round.missionCompleted = DataSources.frontEnd.MP.conquest.round.tierCompleted:Filter( "missionCompleted", MissionCompletedFilter )
end

function InitConquestDataSources()
	InitConquestRoundDataSources()
end

function InitHeadquartersDataSources()
	DataSources.frontEnd.headquarters = LUI.DataSourceInGlobalModel.new( "frontEnd.headquarters" )
	DataSources.frontEnd.headquarters.playercardIndex = LUI.DataSourceInControllerModel.new( "frontEnd.headquarters.playercardIndex" )
	DataSources.frontEnd.headquarters.cardBackgroundTexture = DataSources.frontEnd.headquarters.playercardIndex:Filter( "background", function ( f36_arg0, f36_arg1 )
		return CallingCardUtils.GetCardTexture( f36_arg0 )
	end )
end

function InitPrestigeMenuDataSources()
	local f37_local0 = function ( f38_arg0, f38_arg1 )
		return Prestige.CanActivate( f38_arg1 )
	end
	
	if Engine.IsAliensMode() then
		DataSources.frontEnd.CP.prestigeMenu.canActivate = DataSources.alwaysLoaded.CP.ranked.progression.prestige:Filter( "canActivate", f37_local0 )
	else
		DataSources.frontEnd.MP.prestigeMenu.canActivate = DataSources.alwaysLoaded.MP.ranked.progression.prestige:Filter( "canActivate", f37_local0 )
	end
end

function InitCommonMPFrontEndDataSources()
	if Engine.IsMultiplayer() then
		InitAlwaysLoadedCommonMPDataSources()
		InitLobbyDataSources()
		InitCommerceDataSources()
		InitArmoryDataSources()
		InitCODTvDataSources()
	end
end

local f0_local2 = function ( f40_arg0 )
	return f40_arg0 == 1
end

local f0_local3 = function ( f41_arg0, f41_arg1 )
	return function ( f42_arg0 )
		assert( f41_arg0, "GAMETYPE NOT FOUND" )
		assert( f41_arg1, "ISHARDCORE DATA SOURCE NOT FOUND" )
		local f42_local0 = f41_arg0:GetValue( f42_arg0 )
		if not f42_local0 then
			return 
		end
		local f42_local1 = f41_arg1:GetValue( f42_arg0 )
		local f42_local2 = Engine.TableLookup( CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, f42_local0, CSV.gameTypesTable.cols.image )
		if f42_local1 then
			local f42_local3 = Engine.TableLookup( CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, f42_local0, CSV.gameTypesTable.cols.hardcoreImage )
			if f42_local3 == "" then
				f42_local3 = f42_local2
			end
			if f42_local3 ~= "" then
				local f42_local4 = f42_local3
			end
			return f42_local4 or "icon_playlist_generic"
		elseif f42_local2 ~= "" then
			local f42_local5 = f42_local2
		end
		return f42_local5 or "icon_playlist_generic"
	end
	
end

function InitLobbyDataSources()
	DataSources.frontEnd.lobby.memberCount = LUI.DataSourceInGlobalModel.new( "alwaysLoaded.activeParty.members.count" )
	DataSources.frontEnd.lobby.isSolo = DataSources.frontEnd.lobby.memberCount:Filter( "isSolo", f0_local2 )
	DataSources.frontEnd.lobby.mapName = LUI.DataSourceInGlobalModel.new( "frontEnd.lobby.mapName" )
	DataSources.frontEnd.lobby.mapImage = LUI.DataSourceInGlobalModel.new( "frontEnd.lobby.mapImage" )
	DataSources.frontEnd.lobby.gameType = LUI.DataSourceInGlobalModel.new( "frontEnd.lobby.gameType" )
	DataSources.frontEnd.lobby.gameTypeName = LUI.DataSourceInGlobalModel.new( "frontEnd.lobby.gameTypeName" )
	DataSources.frontEnd.lobby.isHardcoreGameType = LUI.DataSourceInGlobalModel.new( "frontEnd.lobby.isHardcoreGameType" )
	local f43_local0 = DataSources.frontEnd.lobby.gameType
	local f43_local1 = DataSources.frontEnd.lobby.isHardcoreGameType
	DataSources.frontEnd.lobby.gameTypeImage = LUI.AggregateDataSource.new( f43_local0, {
		f43_local0,
		f43_local1
	}, "gameTypeImage", f0_local3( f43_local0, f43_local1 ) )
	DataSources.frontEnd.lobby.votingComplete = LUI.DataSourceInGlobalModel.new( "frontEnd.lobby.votingComplete" )
	DataSources.frontEnd.lobby.votingTime = LUI.DataSourceInGlobalModel.new( "frontEnd.lobby.votingTime" )
	DataSources.frontEnd.lobby.timeRemaining = LUI.DataSourceInGlobalModel.new( "frontEnd.lobby.timeRemaining" )
	DataSources.frontEnd.lobby.isUIFadingOut = LUI.DataSourceInGlobalModel.new( "frontEnd.lobby.isUIFadingOut" )
end

function InitCODTvDataSources()
	DataSources.frontEnd.MP.codtv.streamLiveCount = LUI.DataSourceInGlobalModel.new( "mlgcontent.streams.liveCount" )
	DataSources.frontEnd.MP.codtv.streamCount = LUI.DataSourceInGlobalModel.new( "mlgcontent.streams.count" )
	DataSources.frontEnd.MP.codtv.vodCount = LUI.DataSourceInGlobalModel.new( "mlgcontent.VOD.count" )
end

local f0_local4 = function ( f45_arg0, f45_arg1 )
	local f45_local0 = math.floor( f45_arg0 / 3600 )
	if f45_local0 > 0 then
		local f45_local1 = math.floor( f45_arg0 / 60 - f45_local0 * 60 )
		return Engine.Localize( "LUA_MENU_ZM_TIME_PLAYED_HOURS", string.format( "%.2d", f45_local0 ), string.format( "%.2d", f45_local1 ), string.format( "%.2d", f45_arg0 - f45_local0 * 60 * 60 - f45_local1 * 60 ) )
	else
		local f45_local1 = math.floor( f45_arg0 / 60 )
		return Engine.Localize( "LUA_MENU_ZM_TIME_PLAYED_MINUTES", string.format( "%.2d", f45_local1 ), string.format( "%.2d", math.floor( f45_arg0 - f45_local1 * 60 ) ) )
	end
end

local f0_local5 = function ( f46_arg0, f46_arg1 )
	local f46_local0 = Engine.GetPlayerDataEx( f46_arg1, CoD.StatsGroup.Coop, "coopCareerStats", "Total_Score" )
	local f46_local1 = 0
	local f46_local2 = 0
	f46_local1 = math.floor( f46_arg0 / 60 )
	if f46_local1 > 0 then
		f46_local2 = math.floor( f46_local0 / f46_local1 )
	else
		f46_local2 = 0
	end
	return f46_local2
end

local f0_local6 = function ( f47_arg0, f47_arg1 )
	local f47_local0 = Engine.GetPlayerDataEx( f47_arg1, CoD.StatsGroup.Coop, "coopCareerStats", "Total_Score" )
	local f47_local1 = Engine.GetPlayerDataEx( f47_arg1, CoD.StatsGroup.Coop, "coopCareerStats", "gamesPlayed" )
	local f47_local2 = 0
	if f47_local1 > 0 then
		f47_local2 = math.floor( f47_local0 / f47_local1 )
	else
		f47_local2 = 0
	end
	return f47_local2
end

local f0_local7 = function ( f48_arg0, f48_arg1 )
	local f48_local0 = Engine.GetPlayerDataEx( f48_arg1, CoD.StatsGroup.Coop, "coopCareerStats", "gamesPlayed" )
	local f48_local1 = 0
	if f48_local0 > 0 then
		f48_local1 = math.floor( f48_arg0 / f48_local0 )
	else
		f48_local1 = 0
	end
	return f48_local1
end

local f0_local8 = function ( f49_arg0, f49_arg1 )
	return f49_arg0
end

local f0_local9 = function ( f50_arg0, f50_arg1 )
	if f50_arg0 then
		return Engine.TableLookup( CSV.zombieConsumableItems.File, CSV.zombieConsumableItems.Cols.Ref, f50_arg0, CSV.zombieConsumableItems.Cols.Icon )
	else
		
	end
end

local f0_local10 = function ( f51_arg0, f51_arg1 )
	if f51_arg0 then
		return Engine.Localize( Engine.TableLookup( CSV.zombieConsumableItems.File, CSV.zombieConsumableItems.Cols.Ref, f51_arg0, CSV.zombieConsumableItems.Cols.Name ) )
	else
		
	end
end

local f0_local11 = function ( f52_arg0, f52_arg1 )
	if f52_arg0 then
		return Engine.TableLookup( CSV.zombieConsumableItems.File, CSV.zombieConsumableItems.Cols.Ref, f52_arg0, CSV.zombieConsumableItems.Cols.CardBacking )
	else
		
	end
end

local f0_local12 = function ( f53_arg0, f53_arg1 )
	if f53_arg0 then
		return Engine.TableLookup( CSV.zombieConsumableItems.File, CSV.zombieConsumableItems.Cols.Ref, f53_arg0, CSV.zombieConsumableItems.Cols.CardRarity )
	else
		
	end
end

function CardGetPassiveString( f54_arg0 )
	return Engine.TableLookup( CSV.zombieConsumableItems.File, CSV.zombieConsumableItems.Cols.Ref, f54_arg0, CSV.zombieConsumableItems.Cols.DurationPassiveString )
end

function CardGetPassiveUses( f55_arg0 )
	return Engine.TableLookup( CSV.zombieConsumableItems.File, CSV.zombieConsumableItems.Cols.Ref, f55_arg0, CSV.zombieConsumableItems.Cols.PassiveUses )
end

function CardGetTime( f56_arg0 )
	return Engine.TableLookup( CSV.zombieConsumableItems.File, CSV.zombieConsumableItems.Cols.Ref, f56_arg0, CSV.zombieConsumableItems.Cols.Time )
end

function CardGetDuration( f57_arg0, f57_arg1 )
	if f57_arg0 == "timedactivations" then
		return Engine.Localize( "@LUA_MENU_ZM_CARD_DURATION_SECOND", CardGetTime( f57_arg1 ) )
	elseif f57_arg0 == "wave" then
		return Engine.Localize( "@LUA_MENU_ZM_CARD_DURARTION_WAVE", CardGetTime( f57_arg1 ) )
	elseif f57_arg0 == "triggeronce" then
		return Engine.Localize( "@LUA_MENU_ZM_CARD_DURATION_ONCE" )
	elseif f57_arg0 == "triggernow" then
		return Engine.Localize( "@LUA_MENU_ZM_CARD_DURATION_ONCE" )
	elseif f57_arg0 == "triggerwait" then
		return Engine.Localize( "@LUA_MENU_ZM_CARD_DURATION_ONCE" )
	elseif f57_arg0 == "triggerpassive" then
		return Engine.Localize( CardGetPassiveString( f57_arg1 ), CardGetPassiveUses( f57_arg1 ) )
	else
		
	end
end

function InitZomFrontEndDataSources()
	DataSources.alwaysLoaded.playerData.CP = LUI.DataSourceFromPlayerData.new( CoD.StatsGroup.Coop, CoD.PlayMode.Aliens )
	InitFortuneCardInfo()
	InitFortuneCardDataSources()
	DataSources.frontEnd.CP.totalGameplayTime = DataSources.alwaysLoaded.playerData.CP.coopCareerStats.totalGameplayTime
	DataSources.frontEnd.CP.totalGameplayTimeTextFilter = DataSources.alwaysLoaded.playerData.CP.coopCareerStats.totalGameplayTime:Filter( "total_time_filter", f0_local4 )
	DataSources.frontEnd.CP.scorePerMinuteFilter = DataSources.frontEnd.CP.totalGameplayTime:Filter( "score_time_filter", f0_local5 )
	DataSources.frontEnd.CP.gamesPlayed = DataSources.alwaysLoaded.playerData.CP.coopCareerStats.gamesPlayed
	DataSources.frontEnd.CP.avgScoreFilter = DataSources.alwaysLoaded.playerData.CP.coopCareerStats.gamesPlayed:Filter( "score_games_filter", f0_local6 )
	DataSources.frontEnd.CP.Total_Waves = DataSources.alwaysLoaded.playerData.CP.coopCareerStats.Total_Waves
	DataSources.frontEnd.CP.avgWavesFilter = DataSources.alwaysLoaded.playerData.CP.coopCareerStats.Total_Waves:Filter( "waves_games_filter", f0_local7 )
	DataSources.frontEnd.CP.totalScenesFilter = DataSources.alwaysLoaded.playerData.CP.coopCareerStats.Total_Waves:Filter( "total_waves_filter", f0_local8 )
	DataSources.frontEnd.CP.characterSelect = DataSources.alwaysLoaded.playerData.CP.zombiePlayerLoadout.characterSelect
	DataSources.frontEnd.CP.directorsCutOn = DataSources.alwaysLoaded.playerData.CP.dc
	DataSources.frontEnd.CP.songs.lobbyMusicIndex = DataSources.alwaysLoaded.playerData.CP.zombiePlayerLoadout.lobbySong
	DataSources.frontEnd.CP.songs.hasAnySongUnlocked = DataSources.alwaysLoaded.playerData.CP.hasSongsUnlocked.any_song
	DataSources.frontEnd.CP.songs.hasSong1Unlocked = DataSources.alwaysLoaded.playerData.CP.hasSongsUnlocked.song_1
	DataSources.frontEnd.CP.songs.hasSong2Unlocked = DataSources.alwaysLoaded.playerData.CP.hasSongsUnlocked.song_2
	DataSources.frontEnd.CP.songs.hasSong3Unlocked = DataSources.alwaysLoaded.playerData.CP.hasSongsUnlocked.song_3
	DataSources.frontEnd.CP.songs.hasSong4Unlocked = DataSources.alwaysLoaded.playerData.CP.hasSongsUnlocked.song_4
	DataSources.frontEnd.CP.songs.hasSong5Unlocked = DataSources.alwaysLoaded.playerData.CP.hasSongsUnlocked.song_5
	DataSources.frontEnd.CP.songs.hasSong6Unlocked = DataSources.alwaysLoaded.playerData.CP.hasSongsUnlocked.song_6
	DataSources.frontEnd.CP.songs.hasSong7Unlocked = DataSources.alwaysLoaded.playerData.CP.hasSongsUnlocked.song_7
	DataSources.frontEnd.CP.songs.hasSong8Unlocked = DataSources.alwaysLoaded.playerData.CP.hasSongsUnlocked.song_8
	DataSources.frontEnd.CP.songs.hasSong9Unlocked = DataSources.alwaysLoaded.playerData.CP.hasSongsUnlocked.song_9
	DataSources.frontEnd.CP.songs.hasSong10Unlocked = DataSources.alwaysLoaded.playerData.CP.hasSongsUnlocked.song_10
	DataSources.frontEnd.CP.songs.hasSong11Unlocked = DataSources.alwaysLoaded.playerData.CP.hasSongsUnlocked.song_11
	DataSources.frontEnd.CP.fortuneCards.cardSlot1Ref = DataSources.alwaysLoaded.playerData.CP.zombiePlayerLoadout.zombie_consumables[0]
	DataSources.frontEnd.CP.fortuneCards.cardSlot1Icon = DataSources.frontEnd.CP.fortuneCards.cardSlot1Ref:Filter( "card_slot_1_icon", f0_local9 )
	DataSources.frontEnd.CP.fortuneCards.cardSlot1Name = DataSources.frontEnd.CP.fortuneCards.cardSlot1Ref:Filter( "card_slot_1_name", f0_local10 )
	DataSources.frontEnd.CP.fortuneCards.cardSlot1Backing = DataSources.frontEnd.CP.fortuneCards.cardSlot1Ref:Filter( "card_slot_1_backing", f0_local11 )
	DataSources.frontEnd.CP.fortuneCards.cardSlot1Rarity = DataSources.frontEnd.CP.fortuneCards.cardSlot1Ref:Filter( "card_slot_1_rarity", f0_local12 )
	DataSources.frontEnd.CP.fortuneCards.cardSlot2Ref = DataSources.alwaysLoaded.playerData.CP.zombiePlayerLoadout.zombie_consumables[1]
	DataSources.frontEnd.CP.fortuneCards.cardSlot2Icon = DataSources.frontEnd.CP.fortuneCards.cardSlot2Ref:Filter( "card_slot_2_icon", f0_local9 )
	DataSources.frontEnd.CP.fortuneCards.cardSlot2Name = DataSources.frontEnd.CP.fortuneCards.cardSlot2Ref:Filter( "card_slot_2_name", f0_local10 )
	DataSources.frontEnd.CP.fortuneCards.cardSlot2Backing = DataSources.frontEnd.CP.fortuneCards.cardSlot2Ref:Filter( "card_slot_2_backing", f0_local11 )
	DataSources.frontEnd.CP.fortuneCards.cardSlot2Rarity = DataSources.frontEnd.CP.fortuneCards.cardSlot2Ref:Filter( "card_slot_2_rarity", f0_local12 )
	DataSources.frontEnd.CP.fortuneCards.cardSlot3Ref = DataSources.alwaysLoaded.playerData.CP.zombiePlayerLoadout.zombie_consumables[2]
	DataSources.frontEnd.CP.fortuneCards.cardSlot3Icon = DataSources.frontEnd.CP.fortuneCards.cardSlot3Ref:Filter( "card_slot_3_icon", f0_local9 )
	DataSources.frontEnd.CP.fortuneCards.cardSlot3Name = DataSources.frontEnd.CP.fortuneCards.cardSlot3Ref:Filter( "card_slot_3_name", f0_local10 )
	DataSources.frontEnd.CP.fortuneCards.cardSlot3Backing = DataSources.frontEnd.CP.fortuneCards.cardSlot3Ref:Filter( "card_slot_3_backing", f0_local11 )
	DataSources.frontEnd.CP.fortuneCards.cardSlot3Rarity = DataSources.frontEnd.CP.fortuneCards.cardSlot3Ref:Filter( "card_slot_3_rarity", f0_local12 )
	DataSources.frontEnd.CP.fortuneCards.cardSlot4Ref = DataSources.alwaysLoaded.playerData.CP.zombiePlayerLoadout.zombie_consumables[3]
	DataSources.frontEnd.CP.fortuneCards.cardSlot4Icon = DataSources.frontEnd.CP.fortuneCards.cardSlot4Ref:Filter( "card_slot_4_icon", f0_local9 )
	DataSources.frontEnd.CP.fortuneCards.cardSlot4Name = DataSources.frontEnd.CP.fortuneCards.cardSlot4Ref:Filter( "card_slot_4_name", f0_local10 )
	DataSources.frontEnd.CP.fortuneCards.cardSlot4Backing = DataSources.frontEnd.CP.fortuneCards.cardSlot4Ref:Filter( "card_slot_4_backing", f0_local11 )
	DataSources.frontEnd.CP.fortuneCards.cardSlot4Rarity = DataSources.frontEnd.CP.fortuneCards.cardSlot4Ref:Filter( "card_slot_4_rarity", f0_local12 )
	DataSources.frontEnd.CP.fortuneCards.cardSlot5Ref = DataSources.alwaysLoaded.playerData.CP.zombiePlayerLoadout.zombie_consumables[4]
	DataSources.frontEnd.CP.fortuneCards.cardSlot5Icon = DataSources.frontEnd.CP.fortuneCards.cardSlot5Ref:Filter( "card_slot_5_icon", f0_local9 )
	DataSources.frontEnd.CP.fortuneCards.cardSlot5Name = DataSources.frontEnd.CP.fortuneCards.cardSlot5Ref:Filter( "card_slot_5_name", f0_local10 )
	DataSources.frontEnd.CP.fortuneCards.cardSlot5Backing = DataSources.frontEnd.CP.fortuneCards.cardSlot5Ref:Filter( "card_slot_5_backing", f0_local11 )
	DataSources.frontEnd.CP.fortuneCards.cardSlot5Rarity = DataSources.frontEnd.CP.fortuneCards.cardSlot5Ref:Filter( "card_slot_5_rarity", f0_local12 )
	DataSources.frontEnd.CP.fortuneCards.cardDeckSize = DataSources.alwaysLoaded.playerData.CP.zombiePlayerLoadout.cardDeckSize
end

function WipeZombiesDataTables()
	FORTUNE_CARD_INFO = {}
	FORTUNE_CARD_LIST = {
		["1"] = {},
		["2"] = {}
	}
end

FORTUNE_CARD_INFO = {}
FORTUNE_CARD_LIST = {
	["1"] = {},
	["2"] = {}
}
function InitFortuneCardInfo()
	local f60_local0 = CSV.zombieConsumableItems.File
	for f60_local1 = 0, Engine.TableGetRowCount( f60_local0 ), 1 do
		local f60_local4 = Engine.TableLookupByRow( f60_local0, f60_local1, CSV.zombieConsumableItems.Cols.Ref )
		if f60_local4 ~= "" then
			local f60_local5 = CSV.ReadRow( CSV.zombieConsumableItems, f60_local1 )
			local f60_local6 = f60_local5.quality
			local f60_local7 = CardGetDuration( f60_local5.type, f60_local4 )
			local f60_local8 = GetCardUnlockText( f60_local4 )
			local f60_local9 = nil
			if f60_local6 == "1" then
				f60_local9 = "icon_item_quality_1"
			elseif f60_local6 == "2" then
				f60_local9 = "icon_item_quality_2"
			elseif f60_local6 == "3" then
				f60_local9 = "icon_item_quality_3"
			elseif f60_local6 == "4" then
				f60_local9 = "icon_item_quality_4"
			end
			FORTUNE_CARD_INFO[f60_local4] = {
				name = f60_local5.name,
				desc = f60_local5.desc,
				image = f60_local5.icon,
				uses = f60_local5.uses,
				duration = f60_local7,
				unlockDesc = f60_local8,
				backing = f60_local5.cardBacking,
				rarity = f60_local9,
				quality = f60_local5.quality,
				shippable = f60_local5.shippable
			}
		end
	end
end

function InitFortuneCardsList()
	local f61_local0 = CSV.zombieConsumableItems.File
	for f61_local1 = 0, Engine.TableGetRowCount( f61_local0 ), 1 do
		local f61_local4 = nil
		local f61_local5 = Engine.TableLookupByRow( f61_local0, f61_local1, CSV.zombieConsumableItems.Cols.Ref )
		if Engine.TableLookupByRow( f61_local0, f61_local1, CSV.zombieConsumableItems.Cols.InventoryType ) == "Fate" then
			f61_local4 = "1"
		else
			f61_local4 = "2"
		end
		if f61_local5 ~= "" and f61_local4 ~= "" then
			if f61_local4 == "any" then
				for f61_local9, f61_local10 in pairs( FORTUNE_CARD_LIST ) do
					local f61_local11 = FORTUNE_CARD_INFO[f61_local5]
					f61_local11.ref = f61_local5
					f61_local11.slot = f61_local9
					if f61_local11.shippable == "Y" then
						table.insert( f61_local10, f61_local11 )
					end
				end
			end
			local f61_local6 = FORTUNE_CARD_LIST[f61_local4]
			local f61_local7 = FORTUNE_CARD_INFO[f61_local5]
			f61_local7.ref = f61_local5
			f61_local7.slot = f61_local4
			if f61_local7.shippable == "Y" then
				table.insert( f61_local6, f61_local7 )
			end
		end
	end
end

function InitFortuneCardDataSources()
	InitFortuneCardsList()
	local f62_local0 = 2
	if CONDITIONS.IsSystemLink() then
		FORTUNE_CARD_LIST["2"] = nil
		f62_local0 = 1
	end
	DataSources.frontEnd.CP.fortuneCards = LUI.DataSourceFromList.new( f62_local0 )
	DataSources.frontEnd.CP.fortuneCards.MakeDataSourceAtIndex = function ( f63_arg0, f63_arg1, f63_arg2 )
		return DataSources.frontEnd.CP.fortuneCards["slot" .. f63_arg1]
	end
	
	DataSources.frontEnd.CP.fortuneCards:SetCachingEnabled( true )
	for f62_local4, f62_local5 in pairs( FORTUNE_CARD_LIST ) do
		if f62_local4 == "2" then
			table.sort( f62_local5, function ( f64_arg0, f64_arg1 )
				return tonumber( f64_arg0.quality ) < tonumber( f64_arg1.quality )
			end )
		end
	end
	for f62_local4, f62_local5 in pairs( FORTUNE_CARD_LIST ) do
		local f62_local12 = "slot" .. tostring( tonumber( f62_local4 ) - 1 )
		DataSources.frontEnd.CP.fortuneCards[f62_local12] = LUI.DataSourceFromList.new( #f62_local5 )
		DataSources.frontEnd.CP.fortuneCards[f62_local12].MakeDataSourceAtIndex = function ( f65_arg0, f65_arg1, f65_arg2 )
			return DataSources.frontEnd.CP.fortuneCards[f62_local12]["card" .. f65_arg1]
		end
		
		local f62_local13 = DataSources.frontEnd.CP.fortuneCards[f62_local12]
		for f62_local11 = 1, #f62_local5, 1 do
			local f62_local6 = f62_local5[f62_local11]
			local f62_local7 = f62_local6.ref
			local f62_local8 = "card" .. f62_local11 - 1
			if not f62_local13[f62_local8] then
				f62_local13[f62_local8] = {}
			end
			local f62_local9 = f62_local13[f62_local8]
			local f62_local10 = "frontEnd.CP.fortuneCards." .. f62_local7
			f62_local9.ref = LUI.DataSourceInGlobalModel.new( f62_local10 .. ".ref", f62_local7 )
			f62_local9.name = LUI.DataSourceInGlobalModel.new( f62_local10 .. ".name", f62_local6.name )
			f62_local9.desc = LUI.DataSourceInGlobalModel.new( f62_local10 .. ".desc", f62_local6.desc )
			f62_local9.icon = LUI.DataSourceInGlobalModel.new( f62_local10 .. ".image", f62_local6.image )
			f62_local9.backing = LUI.DataSourceInGlobalModel.new( f62_local10 .. ".backing", f62_local6.backing )
			f62_local9.rarity = LUI.DataSourceInGlobalModel.new( f62_local10 .. ".rarity", f62_local6.rarity )
			f62_local9.duration = LUI.DataSourceInGlobalModel.new( f62_local10 .. ".duration", f62_local6.duration )
			f62_local9.uses = LUI.DataSourceInGlobalModel.new( f62_local10 .. ".uses", f62_local6.uses )
			f62_local9.slot = LUI.DataSourceInGlobalModel.new( f62_local10 .. ".slot", tonumber( f62_local6.slot ) )
			f62_local9.unlockDesc = LUI.DataSourceInGlobalModel.new( f62_local10 .. ".unlockDesc", f62_local6.unlockDesc )
			f62_local9.quality = LUI.DataSourceInGlobalModel.new( f62_local10 .. ".quality", f62_local6.quality )
			FORTUNE_CARD_INFO[f62_local7].index = f62_local11 - 1
		end
	end
end

