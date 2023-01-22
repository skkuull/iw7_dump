DataSources.inGame = {
	SP = {
		player = {},
		titan = {
			c12 = {}
		},
		europa = {},
		rogueAsteroid = {},
		mars = {},
		shipCrib = {
			epilogueLines = {}
		},
		pearlHarbor = {},
		heist = {},
		heistSpace = {},
		dPad = {
			action1 = {},
			action2 = {},
			action3 = {},
			action4 = {}
		},
		contextualGauges = {},
		missionCountdown = {},
		deathHint = {},
		shipLog = {},
		opsMap = {},
		droneInfo = {},
		assassination = {},
		wounded = {}
	},
	MP = {
		match = {},
		players = {
			nameplate = {}
		},
		scorestreakHuds = {},
		deathDetails = {
			infoLine = {}
		},
		callouts = {},
		intel = {},
		splashes = {
			queue = {},
			omnvarList = {},
			paramList = {},
			cardClientIdList = {},
			altDisplayList = {},
			localPlayer = {},
			globalPlayer = {},
			miscMessages = {
				queue = {}
			}
		},
		killcam = {
			killedby = {}
		},
		spectating = {},
		roundEnd = {}
	},
	CP = {
		ammo = {},
		zombies = {
			perks = {},
			charms = {},
			powerups = {
				queue = {}
			},
			quests = {},
			questsDLC1 = {},
			HUDInventoryDLC1 = {},
			challenges = {
				queue = {}
			},
			escape = {},
			ghost = {},
			cards = {},
			tutorials = {},
			tutorialMenu = {},
			waveNumberQueue = {},
			ticketsDispersedQueue = {},
			songs = {},
			dlc1 = {},
			dlc2 = {},
			dlc3 = {
				elements = {}
			},
			dlc4 = {}
		}
	},
	player = {
		gimmeStreak = {},
		target = {},
		primaryPower = {},
		secondaryPower = {},
		primaryStoredPower = {},
		secondaryStoredPower = {},
		suits = {}
	},
	HUD = {
		hints = {
			interactiveObject = {
				popup = {},
				button = {}
			}
		},
		hitMarker = {},
		overlay = {},
		ringRadar = {},
		netPerf = {}
	},
	jackal = {
		missiles = {
			left = {},
			right = {}
		},
		jackalWarning = {},
		activeJackalObjectives = {}
	},
	scoreboard = {}
}
local f0_local0 = function ()
	local f1_local0 = {
		health = {},
		name = {},
		rankIcon = {},
		rankBG = {},
		rankNumber = {}
	}
	for f1_local1 = 0, Engine.GetDvarInt( "ui_maxclients" ) - 1, 1 do
		f1_local0.health[f1_local1] = LUI.DataSourceInControllerModel.new( "cg.players.nameplate.health." .. f1_local1 )
		f1_local0.name[f1_local1] = LUI.DataSourceInGlobalModel.new( "cg.players.nameplate.name." .. f1_local1 )
		f1_local0.rankIcon[f1_local1] = LUI.DataSourceInGlobalModel.new( "cg.players.nameplate.rankIcon." .. f1_local1 )
		f1_local0.rankBG[f1_local1] = LUI.DataSourceInControllerModel.new( "cg.players.nameplate.rankBG." .. f1_local1 )
		f1_local0.rankNumber[f1_local1] = LUI.DataSourceInGlobalModel.new( "cg.players.nameplate.rankNumber." .. f1_local1 )
	end
	DataSources.inGame.MP.players.nameplate = LUI.DataSourceFromList.new( Engine.GetDvarInt( "ui_maxclients" ) )
	DataSources.inGame.MP.players.nameplate.MakeDataSourceAtIndex = function ( f2_arg0, f2_arg1, f2_arg2 )
		return {
			health = f1_local0.health[f2_arg1],
			name = f1_local0.name[f2_arg1],
			rankIcon = f1_local0.rankIcon[f2_arg1],
			rankBG = f1_local0.rankBG[f2_arg1],
			rankNumber = f1_local0.rankNumber[f2_arg1]
		}
	end
	
	DataSources.inGame.MP.selectedLoadout = LUI.DataSourceInControllerModel.new( "cg.players.selectedLoadout" )
end

function BuildPlayerCardDataSources( f3_arg0 )
	local f3_local0 = {
		clanTag = f3_arg0:Filter( "clanTag", function ( f4_arg0 )
			if 0 <= f4_arg0 then
				return Game.GetPlayerClanTag( f4_arg0 )
			else
				return ""
			end
		end
		 ),
		gamertag = f3_arg0:Filter( "gamertag", function ( f5_arg0 )
			if 0 <= f5_arg0 then
				return Game.GetPlayerGamertag( f5_arg0 )
			else
				return ""
			end
		end
		 ),
		xuid = f3_arg0:Filter( "xuid", function ( f6_arg0 )
			if 0 <= f6_arg0 then
				return Game.GetClientXUIDString( f6_arg0 )
			else
				return ""
			end
		end
		 ),
		displayRank = f3_arg0:Filter( "displayRank", function ( f7_arg0 )
			if 0 <= f7_arg0 then
				return Rank.GetRankDisplay( Game.GetPlayerRank( f7_arg0 ), Game.GetPlayerPrestige( f7_arg0 ), true )
			else
				return ""
			end
		end
		 ),
		isMasterPrestige = f3_arg0:Filter( "isMasterPrestige", function ( f8_arg0 )
			if 0 <= f8_arg0 then
				return Rank.IsMasterPrestige( Game.GetPlayerPrestige( f8_arg0 ) )
			else
				return false
			end
		end
		 ),
		rankIcon = f3_arg0:Filter( "rankIcon", function ( f9_arg0 )
			if 0 <= f9_arg0 then
				return Game.GetPlayerRankIcon( f9_arg0 )
			else
				return ""
			end
		end
		 ),
		customEmblemEquipped = f3_arg0:Filter( "customEmblemEquipped", function ( f10_arg0 )
			if 0 <= f10_arg0 then
				return Game.GetPlayerCustomEmblemEquipped( f10_arg0 )
			else
				return false
			end
		end
		 ),
		emblem = f3_arg0:Filter( "emblem", function ( f11_arg0 )
			if 0 <= f11_arg0 then
				return Game.GetPlayerEmblem( f11_arg0 )
			else
				return Engine.TableLookup( CSV.patches.file, CSV.patches.cols.idx, 0, CSV.patches.cols.texture )
			end
		end
		 ),
		backgroundIndex = f3_arg0:Filter( "background", function ( f12_arg0 )
			if 0 <= f12_arg0 then
				return Game.GetPlayerBackground( f12_arg0 )
			else
				return 0
			end
		end
		 ),
		background = f3_local0.backgroundIndex:Filter( "texture", CallingCardUtils.GetCardTexture )
	}
	local f3_local1 = f3_local0.clanTag
	local f3_local2 = f3_local0.gamertag
	f3_local0.fullName = LUI.AggregateDataSource.new( f3_arg0, {
		f3_local1,
		f3_local2
	}, "fullName", function ( f13_arg0 )
		local f13_local0 = f3_local1:GetValue( f13_arg0 )
		local f13_local1 = f3_local2:GetValue( f13_arg0 )
		if f13_local0 and #f13_local0 > 0 and f13_local1 then
			return "[" .. f13_local0 .. "]" .. f13_local1
		else
			return f13_local1
		end
	end )
	return f3_local0
end

local f0_local1 = function ()
	local f14_local0 = DataSources.inGame.MP.spectating
	local f14_local1 = DataSources.inGame.currentPlayerStateClientNum
	f14_local0.isSpectating = LUI.DataSourceInControllerModel.new( "cg.spectating.isSpectating" )
	f14_local0.nextViewModeText = LUI.DataSourceInControllerModel.new( "cg.spectating.nextViewModeText" )
	f14_local0.isFollowingPlayer = LUI.DataSourceInControllerModel.new( "cg.spectating.isFollowingPlayer" )
	f14_local0.isSwitchingPlayer = LUI.DataSourceInControllerModel.new( "cg.spectating.isSwitchingPlayer" )
	f14_local0.followDroneActive = LUI.DataSourceInControllerModel.new( "cg.spectating.followDroneActive" )
	f14_local0.playerCard = BuildPlayerCardDataSources( f14_local1 )
end

local f0_local2 = function ()
	DataSources.inGame.MP.splashes.localPlayer.splashIndex = LUI.DataSourceInControllerModel.new( "cg.MP.splashes.localPlayer.splashIndex" )
	DataSources.inGame.MP.splashes.localPlayer.header = LUI.DataSourceInControllerModel.new( "cg.MP.splashes.localPlayer.header" )
	DataSources.inGame.MP.splashes.localPlayer.body = LUI.DataSourceInControllerModel.new( "cg.MP.splashes.localPlayer.body" )
	DataSources.inGame.MP.splashes.localPlayer.icon = LUI.DataSourceInControllerModel.new( "cg.MP.splashes.localPlayer.icon" )
	DataSources.inGame.MP.splashes.localPlayer.headerAlpha = LUI.DataSourceInControllerModel.new( "cg.MP.splashes.localPlayer.headerAlpha", 0 )
	DataSources.inGame.MP.splashes.localPlayer.bodyAlpha = LUI.DataSourceInControllerModel.new( "cg.MP.splashes.localPlayer.bodyAlpha", 0 )
	DataSources.inGame.MP.splashes.localPlayer.iconAlpha = LUI.DataSourceInControllerModel.new( "cg.MP.splashes.localPlayer.iconAlpha", 0 )
	DataSources.inGame.MP.splashes.localPlayer.sound = LUI.DataSourceInControllerModel.new( "cg.MP.splashes.localPlayer.sound" )
	DataSources.inGame.MP.splashes.localPlayer.useRectangleImage = LUI.DataSourceInControllerModel.new( "cg.MP.splashes.localPlayer.useRectangleImage" )
	DataSources.inGame.MP.splashes.localPlayer.useRectangleBacking = LUI.DataSourceInControllerModel.new( "cg.MP.splashes.localPlayer.useRectangleBacking" )
end

local f0_local3 = function ()
	DataSources.inGame.MP.splashes.globalPlayer.splashIndex = LUI.DataSourceInControllerModel.new( "cg.MP.splashes.globalPlayer.splashIndex" )
	DataSources.inGame.MP.splashes.globalPlayer.header = LUI.DataSourceInControllerModel.new( "cg.MP.splashes.globalPlayer.header" )
	DataSources.inGame.MP.splashes.globalPlayer.body = LUI.DataSourceInControllerModel.new( "cg.MP.splashes.globalPlayer.body" )
	DataSources.inGame.MP.splashes.globalPlayer.cardClientId = LUI.DataSourceInControllerModel.new( "cg.MP.splashes.globalPlayer.cardClientId" )
	DataSources.inGame.MP.splashes.globalPlayer.xuid = LUI.DataSourceInControllerModel.new( "cg.MP.splashes.globalPlayer.xuid" )
	DataSources.inGame.MP.splashes.globalPlayer.headerAlpha = LUI.DataSourceInControllerModel.new( "cg.MP.splashes.globalPlayer.headerAlpha", 0 )
	DataSources.inGame.MP.splashes.globalPlayer.bodyAlpha = LUI.DataSourceInControllerModel.new( "cg.MP.splashes.globalPlayer.bodyAlpha", 0 )
	DataSources.inGame.MP.splashes.globalPlayer.sound = LUI.DataSourceInControllerModel.new( "cg.MP.splashes.globalPlayer.sound" )
	DataSources.inGame.MP.splashes.globalPlayer.playerCard = BuildPlayerCardDataSources( DataSources.inGame.MP.splashes.globalPlayer.cardClientId )
end

local f0_local4 = function ()
	local f17_local0 = function ( f18_arg0 )
		local f18_local0 = DataSources.inGame.MP.splashes.miscMessages.messageIndexOmnvar:GetValue( f18_arg0 )
		if not f18_local0 or f18_local0 < 0 then
			return 
		else
			local f18_local1 = Engine.TableLookupByRow( CSV.mpMiscMessages.file, f18_local0, CSV.mpMiscMessages.cols.stringRef )
			if not f18_local1 or f18_local1 == "" then
				return ""
			else
				return Engine.Localize( f18_local1 )
			end
		end
	end
	
	local f17_local1 = function ( f19_arg0 )
		local f19_local0 = DataSources.inGame.MP.splashes.miscMessages.messageIndexOmnvar:GetValue( f19_arg0 )
		if not f19_local0 or f19_local0 < 0 then
			return "white"
		else
			local f19_local1 = Engine.TableLookupByRow( CSV.mpMiscMessages.file, f19_local0, CSV.mpMiscMessages.cols.icon )
			if not f19_local1 or f19_local1 == "" then
				return "white"
			else
				return f19_local1
			end
		end
	end
	
	local f17_local2 = function ( f20_arg0 )
		local f20_local0 = DataSources.inGame.MP.splashes.miscMessages.messageIndexOmnvar:GetValue( f20_arg0 )
		if not f20_local0 or f20_local0 < 0 then
			return 0
		else
			local f20_local1 = Engine.TableLookupByRow( CSV.mpMiscMessages.file, f20_local0, CSV.mpMiscMessages.cols.icon )
			if not f20_local1 or f20_local1 == "" then
				return 0
			else
				return 1
			end
		end
	end
	
	local f17_local3 = LUI.DataSourceFromOmnvar.new( "ui_misc_message_id" )
	local f17_local4 = LUI.DataSourceFromOmnvar.new( "ui_misc_message_trigger" )
	DataSources.inGame.MP.splashes.miscMessages.messageIndexOmnvar = f17_local3
	DataSources.inGame.MP.splashes.miscMessages.showMessage = f17_local4
	DataSources.inGame.MP.splashes.miscMessages.text = LUI.AggregateDataSource.new( f17_local4, {
		f17_local4,
		f17_local3
	}, "text", f17_local0 )
	DataSources.inGame.MP.splashes.miscMessages.icon = LUI.AggregateDataSource.new( f17_local4, {
		f17_local4,
		f17_local3
	}, "icon", f17_local1 )
	DataSources.inGame.MP.splashes.miscMessages.iconAlpha = LUI.AggregateDataSource.new( f17_local4, {
		f17_local4,
		f17_local3
	}, "iconAlpha", f17_local2 )
end

function InitSplashDataSources()
	local f21_local0 = 6
	for f21_local1 = 0, f21_local0 - 1, 1 do
		DataSources.inGame.MP.splashes.omnvarList[f21_local1] = LUI.DataSourceFromOmnvar.new( "ui_player_splash_id_" .. f21_local1 )
		DataSources.inGame.MP.splashes.paramList[f21_local1] = LUI.DataSourceFromOmnvar.new( "ui_player_splash_param_" .. f21_local1 )
		DataSources.inGame.MP.splashes.cardClientIdList[f21_local1] = LUI.DataSourceFromOmnvar.new( "ui_player_splash_cardClientId_" .. f21_local1 )
		DataSources.inGame.MP.splashes.altDisplayList[f21_local1] = LUI.DataSourceFromOmnvar.new( "ui_player_splash_use_alt_" .. f21_local1 )
	end
	DataSources.inGame.MP.splashes.queue.splashIndex = LUI.DataSourceInControllerModel.new( "cg.MP.splashes.queue.splashIndex" )
	DataSources.inGame.MP.splashes.queue.header = LUI.DataSourceInControllerModel.new( "cg.MP.splashes.queue.header" )
	DataSources.inGame.MP.splashes.queue.body = LUI.DataSourceInControllerModel.new( "cg.MP.splashes.queue.body" )
	DataSources.inGame.MP.splashes.queue.icon = LUI.DataSourceInControllerModel.new( "cg.MP.splashes.queue.icon" )
	DataSources.inGame.MP.splashes.queue.headerAlpha = LUI.DataSourceInControllerModel.new( "cg.MP.splashes.queue.headerAlpha" )
	DataSources.inGame.MP.splashes.queue.bodyAlpha = LUI.DataSourceInControllerModel.new( "cg.MP.splashes.queue.bodyAlpha" )
	DataSources.inGame.MP.splashes.queue.iconAlpha = LUI.DataSourceInControllerModel.new( "cg.MP.splashes.queue.iconAlpha" )
	DataSources.inGame.MP.splashes.queue.cardClientId = LUI.DataSourceInControllerModel.new( "cg.MP.splashes.queue.clientId" )
	DataSources.inGame.MP.splashes.queue.xuid = LUI.DataSourceInControllerModel.new( "cg.MP.splashes.queue.xuid" )
	DataSources.inGame.MP.splashes.queue.sound = LUI.DataSourceInControllerModel.new( "cg.MP.splashes.queue.sound" )
	DataSources.inGame.MP.splashes.queue.useRectangleImage = LUI.DataSourceInControllerModel.new( "cg.MP.splashes.queue.useRectangleImage" )
	DataSources.inGame.MP.splashes.queue.useRectangleBacking = LUI.DataSourceInControllerModel.new( "cg.MP.splashes.queue.useRectangleBacking" )
	DataSources.inGame.MP.splashes.queue.pushToLocalPlayer = LUI.DataSourceInControllerModel.new( "cg.MP.splashes.queue.pushToLocalPlayer" )
	DataSources.inGame.MP.splashes.queue.pushToGlobalPlayer = LUI.DataSourceInControllerModel.new( "cg.MP.splashes.queue.pushToGlobalPlayer" )
	f0_local2()
	f0_local3()
	f0_local4()
end

local f0_local5 = function ()
	DataSources.alwaysLoaded.input.commands.attackIcon = LUI.DataSourceInControllerModel.new( "input.commands.attackIcon" )
	DataSources.alwaysLoaded.input.commands.speedThrowIcon = LUI.DataSourceInControllerModel.new( "input.commands.speedThrowIcon" )
	DataSources.alwaysLoaded.input.commands.useReloadIcon = LUI.DataSourceInControllerModel.new( "input.commands.useReloadIcon" )
	DataSources.alwaysLoaded.input.commands.fragIcon = LUI.DataSourceInControllerModel.new( "input.commands.fragIcon" )
	DataSources.alwaysLoaded.input.commands.smokeIcon = LUI.DataSourceInControllerModel.new( "input.commands.smokeIcon" )
end

local f0_local6 = function ()
	if Engine.IsAliensMode() then
		InitAlwaysLoadedCPDataSources()
		InitZombieDataSources()
		InitCommonCPDataSources()
		InitSplashDataSources()
		InitCPRankedDataSources()
		if Engine.GetDvarString( "ui_mapname" ) == "cp_town" then
			InitElementInfo()
			InitElementDataSources()
		end
	end
end

local f0_local7 = function ()
	if Engine.IsMultiplayer() then
		DataSources.inGame.playerCount = LUI.DataSourceInGlobalModel.new( "cg.clientCount" )
		DataSources.inGame.currentPlayerClientNum = LUI.DataSourceInControllerModel.new( "cg.currentPlayerClientNum" )
		DataSources.inGame.currentPlayerStateClientNum = LUI.DataSourceInControllerModel.new( "cg.currentPlayerStateClientNum" )
		DataSources.inGame.currentPlayerName = LUI.DataSourceInControllerModel.new( "cg.currentPlayerName" )
		DataSources.inGame.MP.match.postGameState = LUI.DataSourceFromOmnvar.new( "post_game_state" )
		InitAlwaysLoadedCommonMPDataSources()
		f0_local0()
		f0_local1()
	end
end

local f0_local8 = function ()
	local f25_local0 = function ( f26_arg0, f26_arg1 )
		return Engine.Localize( Engine.TableLookup( CSV.mpMapTable.file, CSV.mpMapTable.cols.ref, f26_arg0, CSV.mpMapTable.cols.name ) )
	end
	
	DataSources.inGame.map = LUI.DataSourceInGlobalModel.new( "cg.inGame.mapName" )
	if Engine.IsMultiplayer() then
		DataSources.inGame.mapName = DataSources.inGame.map:Filter( "name", f25_local0 )
	end
end

local f0_local9 = function ()
	DataSources.inGame.HUD.ringRadar.north = LUI.DataSourceInControllerModel.new( "cg.HUD.ringradar.north", 0 )
	DataSources.inGame.HUD.ringRadar.northeast = LUI.DataSourceInControllerModel.new( "cg.HUD.ringradar.northeast", 0 )
	DataSources.inGame.HUD.ringRadar.northwest = LUI.DataSourceInControllerModel.new( "cg.HUD.ringradar.northwest", 0 )
	DataSources.inGame.HUD.ringRadar.east = LUI.DataSourceInControllerModel.new( "cg.HUD.ringradar.east", 0 )
	DataSources.inGame.HUD.ringRadar.west = LUI.DataSourceInControllerModel.new( "cg.HUD.ringradar.west", 0 )
	DataSources.inGame.HUD.ringRadar.southeast = LUI.DataSourceInControllerModel.new( "cg.HUD.ringradar.southeast", 0 )
	DataSources.inGame.HUD.ringRadar.southwest = LUI.DataSourceInControllerModel.new( "cg.HUD.ringradar.southwest", 0 )
	DataSources.inGame.HUD.ringRadar.south = LUI.DataSourceInControllerModel.new( "cg.HUD.ringradar.south", 0 )
end

local f0_local10 = function ()
	local f28_local0 = function ( f29_arg0, f29_arg1 )
		local f29_local0
		if f29_arg0 < 0 then
			f29_local0 = 0
			if not f29_local0 then
			
			else
				return f29_local0
			end
		end
		f29_local0 = 1
	end
	
	local f28_local1 = function ( f30_arg0 )
		local f30_local0 = DataSources.inGame.player.currentWeapon.hideWeaponInfoOmnvar:GetValue( f30_arg0 )
		local f30_local1 = DataSources.inGame.player.currentWeapon.clipAmmoMax:GetValue( f30_arg0 )
		local f30_local2 = DataSources.inGame.player.currentWeapon.displayName:GetValue( f30_arg0 )
		local f30_local3 = f30_local0
		local f30_local4
		if f30_local1 ~= 0 and f30_local2 ~= "none" then
			f30_local4 = false
		else
			f30_local4 = f30_local3 or true
		end
		if Engine.IsSingleplayer() then
			local f30_local5 = DataSources.inGame.player.currentWeapon.baseWeapon:GetValue( f30_arg0 )
			if f30_local5 and string.find( f30_local5, "knife" ) ~= nil then
				return nil
			end
		end
		return f30_local4
	end
	
	local f28_local2 = function ( f31_arg0 )
		local f31_local0 = 1
		if DataSources.inGame.player.currentWeapon.hideAmmoInfo:GetValue( f31_arg0 ) or DataSources.inGame.player.currentWeapon.hideAmmoPrimary:GetValue( f31_arg0 ) then
			f31_local0 = 0 or f31_local0
		end
		return f31_local0
	end
	
	local f28_local3 = function ( f32_arg0, f32_arg1 )
		local f32_local0 = DataSources.inGame.player.currentWeapon.clipAmmoMax:GetValue( f32_arg1 )
		if not f32_local0 or f32_local0 <= 0 then
			return 0
		else
			local f32_local1 = f32_arg0 / f32_local0
			return math.floor( (SWATCHES.heatBar.highHeat.r + (SWATCHES.heatBar.lowHeat.r - SWATCHES.heatBar.highHeat.r) * f32_local1) * 255 ) * 65536 + math.floor( (SWATCHES.heatBar.highHeat.g + (SWATCHES.heatBar.lowHeat.g - SWATCHES.heatBar.highHeat.g) * f32_local1) * 255 ) * 256 + math.floor( (SWATCHES.heatBar.highHeat.b + (SWATCHES.heatBar.lowHeat.b - SWATCHES.heatBar.highHeat.b) * f32_local1) * 255 )
		end
	end
	
	local f28_local4 = function ( f33_arg0 )
		local f33_local0 = 1
		if Engine.IsAliensMode() then
			if DataSources.inGame.CP.ammo.unlimited:GetValue( f33_arg0 ) then
				local f33_local1 = 0
			end
			f33_local0 = f33_local1 or 1
		end
		if DataSources.inGame.player.currentWeapon.hideAmmoReserve:GetValue( f33_arg0 ) or DataSources.inGame.player.currentWeapon.hideAmmoInfo:GetValue( f33_arg0 ) then
			f33_local0 = 0 or f33_local0
		end
		return f33_local0
	end
	
	local f28_local5 = function ( f34_arg0 )
		local f34_local0 = DataSources.inGame.player.currentWeapon.ammoReserveAlpha:GetValue( f34_arg0 )
		if DataSources.inGame.player.currentWeapon.isDualWielding:GetValue( f34_arg0 ) then
			local f34_local1 = f34_local0
		end
		return f34_local1 or 0
	end
	
	local f28_local6 = function ( f35_arg0, f35_arg1 )
		if not f35_arg0 or f35_arg0 < 0 then
			return "white"
		elseif f35_arg0 == 1 then
			return "alien_dpad_icon_ammo_stun"
		elseif f35_arg0 == 2 then
			return "alien_dpad_icon_ammo_incendiary"
		elseif f35_arg0 == 3 then
			return "alien_dpad_icon_ammo_explosive"
		elseif f35_arg0 == 4 then
			return "alien_dpad_icon_ammo_piercing"
		elseif f35_arg0 == 5 then
			return "alien_dpad_icon_ammo_combined"
		else
			
		end
	end
	
	local f28_local7 = function ( f36_arg0, f36_arg1 )
		local f36_local0
		if 0 < f36_arg0 then
			f36_local0 = 1
			if not f36_local0 then
			
			else
				return f36_local0
			end
		end
		f36_local0 = 0
	end
	
	local f28_local8 = function ( f37_arg0, f37_arg1 )
		if not f37_arg0 then
			return "white"
		elseif f37_arg0 == 1 then
			return "alien_icon_sentry"
		elseif f37_arg0 == 2 then
			return "hud_icon_minigun"
		else
			return "alien_icon_sentry"
		end
	end
	
	local f28_local9 = function ( f38_arg0, f38_arg1 )
		local f38_local0
		if 0 < f38_arg0 then
			f38_local0 = 1
			if not f38_local0 then
			
			else
				return f38_local0
			end
		end
		f38_local0 = 0
	end
	
	local f28_local10 = function ( f39_arg0, f39_arg1 )
		local f39_local0
		if f39_arg0 then
			f39_local0 = 1
			if not f39_local0 then
			
			else
				return f39_local0
			end
		end
		f39_local0 = 0
	end
	
	local f28_local11 = function ( f40_arg0 )
		local f40_local0 = DataSources.inGame.player.currentWeapon.inAltMode:GetValue( f40_arg0 )
		local f40_local1 = DataSources.inGame.player.currentWeapon.altModeActiveName:GetValue( f40_arg0 )
		local f40_local2 = DataSources.inGame.player.currentWeapon.altModeInactiveName:GetValue( f40_arg0 )
		if f40_local0 then
			local f40_local3 = f40_local1
		end
		local f40_local4 = f40_local3 or f40_local2
		if f40_local4 ~= nil and f40_local4 ~= "" then
			return Engine.Localize( f40_local4 )
		else
			return ""
		end
	end
	
	local f28_local12 = function ( f41_arg0, f41_arg1 )
		return Cac.GetWeaponName( Cac.StripSuffix( f41_arg0, "_mp" ) )
	end
	
	local f28_local13 = function ( f42_arg0 )
		if Engine.IsMultiplayer() then
			local f42_local0 = DataSources.inGame.player.currentWeapon.baseWeapon:GetValue( f42_arg0 )
			if f42_local0 ~= nil and f42_local0 ~= "" then
				local f42_local1 = Engine.TableLookup( CSV.weapons.file, CSV.weapons.cols.asset, f42_local0, CSV.weapons.cols.ref )
				if f42_local1 ~= nil and f42_local1 ~= "" then
					local f42_local2 = DataSources.inGame.player.currentWeapon.lootIndex:GetValue( f42_arg0 )
					if f42_local2 ~= nil and f42_local2 >= 0 then
						local f42_local3 = LOADOUT.GetWeaponLootVariantData( f42_local1 )
						return Cac.IsWeaponRefMk2( Engine.TableLookup( f42_local3.file, CSV.weaponLoot.cols.index, f42_local2, CSV.weaponLoot.cols.ref ) )
					end
				end
			end
		end
		return false
	end
	
	local f28_local14 = function ( f43_arg0, f43_arg1 )
		return Cac.GetWeaponClass( Cac.StripSuffix( f43_arg0, "_mp" ) )
	end
	
	local f28_local15 = function ( f44_arg0, f44_arg1 )
		return Cac.GetWeaponClassName( f44_arg0 )
	end
	
	local f28_local16 = function ( f45_arg0, f45_arg1 )
		return Cac.GetWeaponImage( Cac.StripSuffix( f45_arg0, "_mp" ) )
	end
	
	local f28_local17 = function ( f46_arg0, f46_arg1 )
		return Cac.GetWeaponSpecialFeatures( Cac.StripSuffix( f46_arg0, "_mp" ) )
	end
	
	DataSources.inGame.player.isKeyboardConnected = LUI.DataSourceInControllerModel.new( "cg.player.isKeyboardConnected" )
	DataSources.inGame.player.currentWeapon = LUI.DataSourceInControllerModel.new( "cg.player.currentWeapon" )
	DataSources.inGame.player.currentWeapon.isNull = LUI.DataSourceInControllerModel.new( "cg.player.currentWeapon.isNull" )
	DataSources.inGame.player.currentWeapon.isDefaultWeapon = LUI.DataSourceInControllerModel.new( "cg.player.currentWeapon.isDefaultWeapon" )
	DataSources.inGame.player.currentWeapon.displayNameMultiline = LUI.DataSourceInControllerModel.new( "cg.player.currentWeapon.displayName" )
	DataSources.inGame.player.currentWeapon.displayName = DataSources.inGame.player.currentWeapon.displayNameMultiline:Filter( "displayName", function ( f47_arg0, f47_arg1 )
		return f47_arg0:gsub( "\n", " " )
	end )
	DataSources.inGame.player.currentWeapon.name = LUI.DataSourceInControllerModel.new( "cg.player.currentWeapon.name" )
	DataSources.inGame.player.currentWeapon.baseWeapon = LUI.DataSourceInControllerModel.new( "cg.player.currentWeapon.baseWeapon" )
	DataSources.inGame.player.currentWeapon.lootIndex = LUI.DataSourceInControllerModel.new( "cg.player.currentWeapon.lootIndex" )
	DataSources.inGame.player.currentWeapon.isMk2 = LUI.AggregateDataSource.new( DataSources.inGame.player.currentWeapon, {
		DataSources.inGame.player.currentWeapon.lootIndex,
		DataSources.inGame.player.currentWeapon.baseWeapon
	}, "isMk2", f28_local13 )
	DataSources.inGame.player.currentWeapon.baseDisplayName = DataSources.inGame.player.currentWeapon.baseWeapon:Filter( "baseDisplayName", f28_local12 )
	DataSources.inGame.player.currentWeapon.class = DataSources.inGame.player.currentWeapon.baseWeapon:Filter( "class", f28_local14 )
	DataSources.inGame.player.currentWeapon.classDisplayName = DataSources.inGame.player.currentWeapon.class:Filter( "classDisplayName", f28_local15 )
	DataSources.inGame.player.currentWeapon.isMeleeWeapon = LUI.DataSourceInControllerModel.new( "cg.player.currentWeapon.isMeleeOnly" )
	DataSources.inGame.player.currentWeapon.image = DataSources.inGame.player.currentWeapon.baseWeapon:Filter( "image", f28_local16 )
	DataSources.inGame.player.currentWeapon.isDualWielding = LUI.DataSourceInControllerModel.new( "cg.player.currentWeapon.isDualWielding" )
	DataSources.inGame.player.currentWeapon.hasAltMode = LUI.DataSourceInControllerModel.new( "cg.player.currentWeapon.hasAltMode" )
	DataSources.inGame.player.currentWeapon.inAltMode = LUI.DataSourceInControllerModel.new( "cg.player.currentWeapon.inAltMode" )
	DataSources.inGame.player.currentWeapon.altModeActiveName = LUI.DataSourceInControllerModel.new( "cg.player.currentWeapon.altModeActiveName" )
	DataSources.inGame.player.currentWeapon.altModeInactiveName = LUI.DataSourceInControllerModel.new( "cg.player.currentWeapon.altModeInactiveName" )
	DataSources.inGame.player.currentWeapon.altModeDisplayName = LUI.AggregateDataSource.new( DataSources.inGame.player.currentWeapon, {
		DataSources.inGame.player.currentWeapon.inAltMode,
		DataSources.inGame.player.currentWeapon.altModeActiveName,
		DataSources.inGame.player.currentWeapon.altModeInactiveName
	}, "altModeDisplayName", f28_local11 )
	DataSources.inGame.player.currentWeapon.enemyNameplateDisplayRange = LUI.DataSourceInControllerModel.new( "cg.player.currentWeapon.enemyNameplateRange" )
	DataSources.inGame.player.currentWeapon.ammoUsedPerShot = LUI.DataSourceInControllerModel.new( "cg.player.currentWeapon.ammoUsedPerShot" )
	DataSources.inGame.player.currentWeapon.weaponIsLockedOn = LUI.DataSourceInControllerModel.new( "cg.player.currentWeapon.weaponIsLockedOn" )
	DataSources.inGame.player.currentWeapon.hipfireCrosshairVisible = LUI.DataSourceInControllerModel.new( "cg.player.currentWeapon.hipfireCrosshairVisible" )
	DataSources.inGame.player.currentWeapon.stockAmmo = LUI.DataSourceInControllerModel.new( "cg.player.currentWeapon.stockAmmo" )
	DataSources.inGame.player.currentWeapon.stockAmmoDisplay = LUI.DataSourceInControllerModel.new( "cg.player.currentWeapon.stockAmmoDisplay" )
	DataSources.inGame.player.currentWeapon.clipAmmoMax = LUI.DataSourceInControllerModel.new( "cg.player.currentWeapon.clipAmmoMax" )
	DataSources.inGame.player.currentWeapon.clipAmmoLeft = LUI.DataSourceInControllerModel.new( "cg.player.currentWeapon.clipAmmoLeft" )
	DataSources.inGame.player.currentWeapon.clipAmmoLeftDisplay = LUI.DataSourceInControllerModel.new( "cg.player.currentWeapon.clipAmmoLeftDisplay" )
	DataSources.inGame.player.currentWeapon.clipAmmoLeftTotal = LUI.DataSourceInControllerModel.new( "cg.player.currentWeapon.clipAmmoLeftTotal" )
	DataSources.inGame.player.currentWeapon.clipAmmoRight = LUI.DataSourceInControllerModel.new( "cg.player.currentWeapon.clipAmmoRight" )
	DataSources.inGame.player.currentWeapon.clipAmmoRightDisplay = LUI.DataSourceInControllerModel.new( "cg.player.currentWeapon.clipAmmoRightDisplay" )
	DataSources.inGame.player.currentWeapon.clipAmmoRightTotal = LUI.DataSourceInControllerModel.new( "cg.player.currentWeapon.clipAmmoRightTotal" )
	DataSources.inGame.player.currentWeapon.lowAmmoThreshold = LUI.DataSourceInControllerModel.new( "cg.player.currentWeapon.lowAmmoThreshold" )
	DataSources.inGame.player.currentWeapon.disableNoAmmoWarning = LUI.DataSourceInControllerModel.new( "cg.player.currentWeapon.disableNoAmmoWarning" )
	DataSources.inGame.player.currentWeapon.canCharge = LUI.DataSourceInControllerModel.new( "cg.player.currentWeapon.canCharge" )
	DataSources.inGame.player.currentWeapon.charge = LUI.DataSourceInControllerModel.new( "cg.player.currentWeapon.charge" )
	DataSources.inGame.player.currentWeapon.heatbarColorRight = DataSources.inGame.player.currentWeapon.clipAmmoRight:Filter( "heatbarColorRight", f28_local3 )
	DataSources.inGame.player.currentWeapon.heatbarColorLeft = DataSources.inGame.player.currentWeapon.clipAmmoLeft:Filter( "heatbarColorLeft", f28_local3 )
	DataSources.inGame.player.currentWeapon.ammoWarningState = LUI.DataSourceInControllerModel.new( "cg.player.currentWeapon.ammoWarningState" )
	DataSources.inGame.player.currentWeapon.scopeVariation = LUI.DataSourceInControllerModel.new( "cg.player.currentWeapon.scopeVariation" )
	DataSources.inGame.player.currentWeapon.scopeIndex = LUI.DataSourceInControllerModel.new( "cg.player.currentWeapon.scopeIndex" )
	DataSources.inGame.player.currentWeapon.adsPercent = LUI.DataSourceInControllerModel.new( "cg.player.currentWeapon.adsPercent" )
	DataSources.inGame.player.currentWeapon.inFullADS = LUI.DataSourceInControllerModel.new( "cg.player.currentWeapon.inFullADS" )
	DataSources.inGame.player.currentWeapon.spreadPercent = LUI.DataSourceInControllerModel.new( "cg.player.currentWeapon.spreadPercent" )
	DataSources.inGame.player.currentWeapon.isAimingAtEnemy = LUI.DataSourceInControllerModel.new( "cg.player.currentWeapon.isAimingAtEnemy" )
	DataSources.inGame.player.currentWeapon.isAimingAtFriendly = LUI.DataSourceInControllerModel.new( "cg.player.currentWeapon.isAimingAtFriendly" )
	DataSources.inGame.player.currentWeapon.crosshairColor = LUI.DataSourceInControllerModel.new( "cg.player.currentWeapon.crosshairColor" )
	DataSources.inGame.player.currentWeapon.crosshairRadius = LUI.DataSourceInControllerModel.new( "cg.player.currentWeapon.crosshairRadius" )
	DataSources.inGame.player.currentWeapon.shotCounter = LUI.DataSourceInControllerModel.new( "cg.player.currentWeapon.shotCounter" )
	DataSources.inGame.player.currentWeapon.energyBullet = LUI.DataSourceInControllerModel.new( "cg.player.currentWeapon.energyBullet" )
	DataSources.inGame.player.currentWeapon.bulletType = LUI.AggregateDataSource.new( DataSources.inGame.player.currentWeapon, {
		DataSources.inGame.player.currentWeapon.energyBullet,
		DataSources.inGame.player.currentWeapon.baseWeapon
	}, "bulletType", function ( f48_arg0 )
		local f48_local0 = DataSources.inGame.player.currentWeapon.energyBullet:GetValue( f48_arg0 )
		if DataSources.inGame.player.currentWeapon.baseWeapon:GetValue( f48_arg0 ) == "iw7_sonic" then
			return Engine.Localize( "HUD_SONIC" )
		elseif f48_local0 == true then
			return Engine.Localize( "HUD_ENERGY" )
		else
			return Engine.Localize( "HUD_BALLISTICS" )
		end
	end )
	DataSources.inGame.player.currentWeapon.isEnergyDualWield = LUI.AggregateDataSource.new( DataSources.inGame.player.currentWeapon, {
		DataSources.inGame.player.currentWeapon.energyBullet,
		DataSources.inGame.player.currentWeapon.isDualWielding
	}, "isEnergyDualWield", function ( f49_arg0 )
		return DataSources.inGame.player.currentWeapon.energyBullet:GetValue( f49_arg0 ) and DataSources.inGame.player.currentWeapon.isDualWielding:GetValue( f49_arg0 )
	end )
	DataSources.inGame.player.currentWeapon.primaryReticleVisible = LUI.DataSourceInControllerModel.new( "cg.player.currentWeapon.primaryReticleVisible" )
	DataSources.inGame.player.currentWeapon.altReticleVisible = LUI.DataSourceInControllerModel.new( "cg.player.currentWeapon.altReticleVisible" )
	DataSources.inGame.player.currentWeapon.weaponInfoLUIWidgetsVisible = LUI.DataSourceInControllerModel.new( "cg.player.currentWeapon.weaponInfoLUIWidgetsVisible" )
	if Engine.IsMultiplayer() or Engine.IsAliensMode() then
		DataSources.inGame.player.currentWeapon.lastShotsThreshold = LUI.DataSourceFromOmnvar.new( "ui_last_shots_clip_size" )
		DataSources.inGame.player.currentWeapon.lastShotsAlpha = DataSources.inGame.player.currentWeapon.lastShotsThreshold:Filter( "lastShotsAlpha", f28_local0 )
	end
	if not Engine.IsMultiplayer() then
		DataSources.inGame.player.currentWeapon.specialFeatures = DataSources.inGame.player.currentWeapon.baseWeapon:Filter( "specialFeatures", f28_local17 )
	end
	if Engine.IsAliensMode() then
		DataSources.inGame.CP.ammo.special = LUI.DataSourceFromOmnvar.new( "zm_ui_specialammo" )
		DataSources.inGame.CP.ammo.specialImage = DataSources.inGame.CP.ammo.special:Filter( "specialImage", f28_local6 )
		DataSources.inGame.CP.ammo.specialAlpha = DataSources.inGame.CP.ammo.special:Filter( "specialAlpha", f28_local7 )
		DataSources.inGame.CP.ammo.turret = LUI.DataSourceFromOmnvar.new( "zm_ui_turret" )
		DataSources.inGame.CP.ammo.turretImage = DataSources.inGame.CP.ammo.turret:Filter( "turretImage", f28_local8 )
		DataSources.inGame.CP.ammo.showTurret = LUI.DataSourceFromOmnvar.new( "zm_ui_turret_ammo" )
		DataSources.inGame.CP.ammo.turretAlpha = DataSources.inGame.CP.ammo.showTurret:Filter( "turretAlpha", f28_local9 )
		DataSources.inGame.CP.ammo.unlimited = LUI.DataSourceFromOmnvar.new( "zm_ui_unlimited_ammo" )
		DataSources.inGame.CP.ammo.unlimitedAlpha = DataSources.inGame.CP.ammo.unlimited:Filter( "unlimitedAlpha", f28_local10 )
	end
	DataSources.inGame.player.currentWeapon.hideWeaponInfoOmnvar = LUI.DataSourceFromOmnvar.new( "ui_hide_weapon_info" )
	DataSources.inGame.player.currentWeapon.hideWeaponInfo = LUI.AggregateDataSource.new( DataSources.inGame.player.currentWeapon, {
		DataSources.inGame.player.currentWeapon.hideWeaponInfoOmnvar,
		DataSources.inGame.player.currentWeapon.clipAmmoMax,
		DataSources.inGame.player.currentWeapon.displayName
	}, "hideWeaponInfo", f28_local1 )
	DataSources.inGame.player.currentWeapon.hideAmmoInfo = LUI.AggregateDataSource.new( DataSources.inGame.player.currentWeapon, {
		DataSources.inGame.player.currentWeapon.isMeleeWeapon,
		DataSources.inGame.player.currentWeapon.isNull
	}, "hideAmmoInfo", function ( f50_arg0 )
		if DataSources.inGame.player.currentWeapon.isNull:GetValue( f50_arg0 ) then
			return true
		elseif DataSources.inGame.player.currentWeapon.isMeleeWeapon:GetValue( f50_arg0 ) then
			local f50_local0 = DataSources.inGame.player.currentWeapon.name:GetValue( f50_arg0 )
			if string.match( f50_local0, "katana" ) or string.match( f50_local0, "nunchucks" ) then
				return false
			else
				return true
			end
		else
			return false
		end
	end )
	DataSources.inGame.player.currentWeapon.hideAmmoPrimary = DataSources.inGame.player.currentWeapon:GetDataSourceForSubmodel( "hideAmmoPrimary" )
	DataSources.inGame.player.currentWeapon.hideAmmoReserve = DataSources.inGame.player.currentWeapon:GetDataSourceForSubmodel( "hideAmmoReserve" )
	local f28_local18 = Engine.IsAliensMode and {
		DataSources.inGame.player.currentWeapon.hideAmmoPrimary,
		DataSources.inGame.player.currentWeapon.hideAmmoReserve,
		DataSources.inGame.player.currentWeapon.hideAmmoInfo,
		DataSources.inGame.CP.ammo.unlimited
	} or {
		DataSources.inGame.player.currentWeapon.hideAmmoPrimary,
		DataSources.inGame.player.currentWeapon.hideAmmoReserve,
		DataSources.inGame.player.currentWeapon.hideAmmoInfo
	}
	DataSources.inGame.player.currentWeapon.ammoInfoAlpha = LUI.AggregateDataSource.new( DataSources.inGame.player.currentWeapon, f28_local18, "ammoInfoAlpha", f28_local2 )
	DataSources.inGame.player.currentWeapon.ammoReserveAlpha = LUI.AggregateDataSource.new( DataSources.inGame.player.currentWeapon, f28_local18, "ammoReserveAlpha", f28_local4 )
	DataSources.inGame.player.currentWeapon.leftAmmoReserveAlpha = LUI.AggregateDataSource.new( DataSources.inGame.player.currentWeapon, {
		DataSources.inGame.player.currentWeapon.ammoReserveAlpha,
		DataSources.inGame.player.currentWeapon.isDualWielding
	}, "leftAmmoReserveAlpha", f28_local5 )
end

local f0_local11 = function ()
	DataSources.inGame.player.movementEnergy = LUI.DataSourceInControllerModel.new( "cg.player.movementEnergy" )
	DataSources.inGame.player.displayMovementEnergy = LUI.DataSourceInControllerModel.new( "cg.player.displayMovementEnergy" )
end

local f0_local12 = function ()
	if Engine.IsDevelopmentBuild() then
		DataSources.debug.drawHUDMap = LUI.DataSourceInGlobalModel.new( "cg.debug.drawHUDMap" )
	end
end

local f0_local13 = function ()
	DataSources.inGame.player.health = LUI.DataSourceInControllerModel.new( "cg.player.health" )
	DataSources.inGame.player.maxHealth = LUI.DataSourceInControllerModel.new( "cg.player.maxHealth" )
	DataSources.inGame.player.affectedByEMP = LUI.DataSourceInControllerModel.new( "cg.player.affectedByEMP" )
	DataSources.inGame.player.affectedByUAVJam = LUI.DataSourceInControllerModel.new( "cg.player.affectedByUAVJam" )
	DataSources.inGame.player.isCUAVActive = LUI.DataSourceInControllerModel.new( "cg.player.isCUAVActive" )
	DataSources.inGame.player.inADS = LUI.DataSourceInControllerModel.new( "cg.player.inADS" )
	DataSources.inGame.player.inKillCam = LUI.DataSourceInControllerModel.new( "cg.player.isPlayerInKillCam" )
	DataSources.inGame.player.shieldEnergy = LUI.DataSourceInControllerModel.new( "cg.player.shieldEnergy" )
	DataSources.inGame.player.maxShieldEnergy = LUI.DataSourceInControllerModel.new( "cg.player.maxShieldEnergy" )
	DataSources.inGame.player.shieldIsDeployed = LUI.DataSourceInControllerModel.new( "cg.player.shieldIsDeployed" )
	DataSources.inGame.player.shieldCanDeploy = LUI.DataSourceInControllerModel.new( "cg.player.shieldCanDeploy" )
	DataSources.inGame.player.wristPC = LUI.DataSourceFromOmnvar.new( "ui_wrist_pc" )
	DataSources.inGame.player.spawnCount = LUI.DataSourceInControllerModel.new( "cg.player.spawnCount" )
	DataSources.inGame.player.chargeMeleeTarget = LUI.DataSourceInControllerModel.new( "cg.player.chargeMeleeTarget" )
	DataSources.inGame.player.viewPitch = LUI.DataSourceInControllerModel.new( "cg.player.viewPitch" )
	DataSources.inGame.player.marksman = LUI.DataSourceInControllerModel.new( "cg.player.hasPerkMarksman" )
end

local f0_local14 = function ()
	local f54_local0 = function ( f55_arg0, f55_arg1 )
		if not f55_arg0 or f55_arg0 == "none" then
			return ""
		else
			return f55_arg0
		end
	end
	
	local f54_local1 = function ( f56_arg0 )
		if DataSources.inGame.HUD.hints.warning.icon:GetValue( f56_arg0 ) == "" then
			return 0
		else
			return 1
		end
	end
	
	local f54_local2 = function ( f57_arg0, f57_arg1 )
		if f57_arg0 == 1 then
			return GetIntForColor( SWATCHES.scrapRarity.quality1 )
		elseif f57_arg0 == 2 then
			return GetIntForColor( SWATCHES.scrapRarity.quality2 )
		elseif f57_arg0 == 3 then
			return GetIntForColor( SWATCHES.scrapRarity.quality3 )
		else
			return GetIntForColor( SWATCHES.scrapRarity.quality0 )
		end
	end
	
	local f54_local3 = function ( f58_arg0 )
		if Engine.IsMultiplayer() then
			local f58_local0 = Game.GetInteractiveObjectWeaponLootTableFilename( f58_arg0 )
			if f58_local0 ~= nil and f58_local0 ~= "" then
				local f58_local1 = DataSources.inGame.HUD.hints.interactiveObject.weapon.lootIndex:GetValue( f58_arg0 )
				if f58_local1 ~= nil and f58_local1 >= 0 then
					return Cac.IsWeaponRefMk2( Engine.TableLookup( f58_local0, CSV.weaponLoot.cols.index, f58_local1, CSV.weaponLoot.cols.ref ) )
				end
			end
		end
		return false
	end
	
	DataSources.inGame.HUD.hints.base = LUI.DataSourceInControllerModel.new( "cg.HUD.hints" )
	DataSources.inGame.HUD.hints.interactiveObject.popup.shouldShow = LUI.DataSourceInControllerModel.new( "cg.HUD.hints.interactiveObject.showPopup" )
	DataSources.inGame.HUD.hints.interactiveObject.popup.shouldShowIcon = LUI.DataSourceInControllerModel.new( "cg.HUD.hints.interactiveObject.popup.showIcon" )
	DataSources.inGame.HUD.hints.interactiveObject.popup.string = LUI.DataSourceInControllerModel.new( "cg.HUD.hints.interactiveObject.string" )
	DataSources.inGame.HUD.hints.interactiveObject.popup.keyBind = LUI.DataSourceInControllerModel.new( "cg.HUD.hints.interactiveObject.keyBind" )
	DataSources.inGame.HUD.hints.interactiveObject.popup.material = LUI.DataSourceInControllerModel.new( "cg.HUD.hints.interactiveObject.icon" )
	DataSources.inGame.HUD.hints.interactiveObject.weapon = {}
	DataSources.inGame.HUD.hints.interactiveObject.weapon.baseName = LUI.DataSourceInControllerModel.new( "cg.HUD.hints.interactiveObject.weaponBaseName" )
	DataSources.inGame.HUD.hints.interactiveObject.weapon.lootIndex = LUI.DataSourceInControllerModel.new( "cg.HUD.hints.interactiveObject.weaponLootIndex" )
	DataSources.inGame.HUD.hints.interactiveObject.weapon.isMk2 = LUI.AggregateDataSource.new( DataSources.inGame.HUD.hints.base, {
		DataSources.inGame.HUD.hints.interactiveObject.weapon.lootIndex,
		DataSources.inGame.HUD.hints.interactiveObject.weapon.baseName
	}, "interactiveObject.weapon.isMk2", f54_local3 )
	DataSources.inGame.HUD.hints.interactiveObject.button.shouldShow = LUI.DataSourceInControllerModel.new( "cg.HUD.hints.interactiveObject.showButton" )
	DataSources.inGame.HUD.hints.interactiveObject.button.style = LUI.DataSourceInControllerModel.new( "cg.HUD.hints.interactiveObject.buttonStyle" )
	DataSources.inGame.HUD.hints.interactiveObject.button.icon = LUI.DataSourceInControllerModel.new( "cg.HUD.hints.interactiveObject.buttonIcon" )
	DataSources.inGame.HUD.hints.interactiveObject.button.targetEntity = LUI.DataSourceInControllerModel.new( "cg.HUD.hints.interactiveObject.targetEntity" )
	DataSources.inGame.HUD.hints.interactiveObject.button.targetEntityTag = LUI.DataSourceInControllerModel.new( "cg.HUD.hints.interactiveObject.targetEntityTag" )
	DataSources.inGame.HUD.hints.interactiveObject.button.range = LUI.DataSourceInControllerModel.new( "cg.HUD.hints.interactiveObject.range" )
	DataSources.inGame.HUD.hints.interactiveObject.button.obstructed = LUI.DataSourceInControllerModel.new( "cg.HUD.hints.interactiveObject.obstructed" )
	DataSources.inGame.HUD.hints.interactiveObject.button.operable = LUI.DataSourceInControllerModel.new( "cg.HUD.hints.interactiveObject.operable" )
	DataSources.inGame.HUD.hints.interactiveObject.button.requiresMashing = LUI.DataSourceInControllerModel.new( "cg.HUD.hints.interactiveObject.requiresMashing" )
	DataSources.inGame.HUD.hints.interactiveObject.button.requiresHolding = LUI.DataSourceInControllerModel.new( "cg.HUD.hints.interactiveObject.requiresHolding" )
	DataSources.inGame.HUD.hints.interactiveObject.button.dismiss = LUI.DataSourceInControllerModel.new( "cg.HUD.hints.interactiveObject.dismiss" )
	DataSources.inGame.HUD.hints.interactiveObject.button.rarity = LUI.DataSourceInControllerModel.new( "cg.HUD.hints.interactiveObject.rarity" )
	DataSources.inGame.HUD.hints.interactiveObject.button.rarityColor = DataSources.inGame.HUD.hints.interactiveObject.button.rarity:Filter( "rarityColor", f54_local2 )
	DataSources.inGame.HUD.hints.interactiveObject.button.string = DataSources.inGame.HUD.hints.interactiveObject.popup.string
	DataSources.inGame.HUD.hints.interactiveObject.button.keyBind = DataSources.inGame.HUD.hints.interactiveObject.popup.keyBind
	DataSources.inGame.HUD.hints.interactiveObject.button.material = DataSources.inGame.HUD.hints.interactiveObject.popup.material
	DataSources.inGame.HUD.hints.interactiveObject.progress = LUI.DataSourceInControllerModel.new( "cg.HUD.hints.interactiveObject.progress" )
	DataSources.inGame.HUD.hints.interactiveObject.progress.entity = LUI.DataSourceInControllerModel.new( "cg.HUD.hints.interactiveObject.progressEntity" )
	DataSources.inGame.HUD.hints.canMantle = LUI.DataSourceInControllerModel.new( "cg.HUD.hints.canMantle" )
	DataSources.inGame.HUD.hints.tutorialMessageString = LUI.DataSourceInControllerModel.new( "cg.HUD.hints.tutorial.string" )
	DataSources.inGame.HUD.hints.tutorialMessage = DataSources.inGame.HUD.hints.tutorialMessageString:Filter( "tutorialMessage", f54_local0 )
	DataSources.inGame.HUD.hints.invalidCmdHint = LUI.DataSourceInControllerModel.new( "cg.HUD.hints.tutorial.string.invalidCmdHint" )
	DataSources.inGame.HUD.hints.invalidCmdHintShow = LUI.DataSourceInControllerModel.new( "cg.HUD.hints.tutorial.string.invalidCmdHintShow" )
	DataSources.inGame.HUD.hints.messageShow = LUI.DataSourceFromOmnvar.new( "ui_tutorial_message_show" )
	DataSources.inGame.HUD.hints.tutorialMessageText = LUI.AggregateDataSource.new( DataSources.inGame.HUD.hints.tutorialMessageString, {
		DataSources.inGame.HUD.hints.invalidCmdHint,
		DataSources.inGame.HUD.hints.tutorialMessage,
		DataSources.inGame.HUD.hints.invalidCmdHintShow,
		DataSources.inGame.HUD.hints.messageShow
	}, "tutorialMessageText", function ( f59_arg0 )
		if DataSources.inGame.HUD.hints.invalidCmdHintShow:GetValue( f59_arg0 ) then
			return DataSources.inGame.HUD.hints.invalidCmdHint:GetValue( f59_arg0 )
		elseif DataSources.inGame.HUD.hints.messageShow:GetValue( f59_arg0 ) then
			return DataSources.inGame.HUD.hints.tutorialMessage:GetValue( f59_arg0 )
		else
			return ""
		end
	end )
	DataSources.inGame.HUD.hints.warning = {}
	DataSources.inGame.HUD.hints.warning.shouldShow = LUI.DataSourceFromOmnvar.new( "ui_hud_warning_notify" )
	DataSources.inGame.HUD.hints.warning.icon = LUI.DataSourceInGlobalModel.new( "cg.HUD.hints.warning.icon" )
	DataSources.inGame.HUD.hints.warning.iconAlpha = DataSources.inGame.HUD.hints.warning.icon:Filter( "iconAlpha", f54_local1 )
	DataSources.inGame.HUD.hints.warning.text = LUI.DataSourceInGlobalModel.new( "cg.HUD.hints.warning.text" )
	DataSources.inGame.HUD.hints.warning.color = LUI.DataSourceInGlobalModel.new( "cg.HUD.hints.warning.color" )
end

local f0_local15 = function ()
	DataSources.inGame.HUD.subtitle = LUI.FeedDataSource.new( LUI.DataSourceInControllerModel.new( "cg.HUD.subtitle" ), 10, {
		text = ""
	} )
	DataSources.inGame.HUD.subtitleLineCount = LUI.DataSourceInControllerModel.new( "cg.HUD.subtitleLineCount" )
end

local f0_local16 = function ()
	local f61_local0 = function ( f62_arg0, f62_arg1 )
		if f62_arg0 ~= nil then
			return Engine.TableLookup( CSV.hitMarkers.file, CSV.hitMarkers.cols.ref, f62_arg0, CSV.hitMarkers.cols.material )
		else
			
		end
	end
	
	local f61_local1 = function ( f63_arg0, f63_arg1 )
		if f63_arg0 ~= nil then
			local f63_local0 = Engine.TableLookup( CSV.hitMarkers.file, CSV.hitMarkers.cols.ref, f63_arg0, CSV.hitMarkers.cols.scale )
			if f63_local0 and f63_local0 ~= "" then
				return tonumber( f63_local0 )
			end
		end
		return 1
	end
	
	local f61_local2 = function ( f64_arg0 )
		local f64_local0 = DataSources.inGame.HUD.hitMarker.kill:GetValue( f64_arg0 )
		local f64_local1 = DataSources.inGame.HUD.hitMarker.headShot:GetValue( f64_arg0 )
		if f64_local0 then
			return GetIntForColor( SWATCHES.hitMarker.killingHit )
		elseif f64_local1 then
			return GetIntForColor( SWATCHES.hitMarker.headshot )
		else
			return GetIntForColor( SWATCHES.hitMarker.normal )
		end
	end
	
	DataSources.inGame.HUD.hitMarker.base = LUI.DataSourceInControllerModel.new( "cg.HUD.hitMarker" )
	DataSources.inGame.HUD.hitMarker.type = LUI.DataSourceFromOmnvar.new( "damage_feedback" )
	DataSources.inGame.HUD.hitMarker.typeNotify = LUI.DataSourceFromOmnvar.new( "damage_feedback_notify" )
	DataSources.inGame.HUD.hitMarker.headShot = LUI.DataSourceFromOmnvar.new( "damage_feedback_headshot" )
	DataSources.inGame.HUD.hitMarker.kill = LUI.DataSourceFromOmnvar.new( "damage_feedback_kill" )
	DataSources.inGame.HUD.hitMarker.material = DataSources.inGame.HUD.hitMarker.type:Filter( "material", f61_local0 )
	DataSources.inGame.HUD.hitMarker.scale = DataSources.inGame.HUD.hitMarker.type:Filter( "scale", f61_local1 )
	DataSources.inGame.HUD.hitMarker.color = LUI.AggregateDataSource.new( DataSources.inGame.HUD.hitMarker.base, {
		DataSources.inGame.HUD.hitMarker.kill,
		DataSources.inGame.HUD.hitMarker.headShot
	}, "color", f61_local2 )
	if Engine.IsMultiplayer() then
		DataSources.inGame.HUD.hitMarker.iconType = LUI.DataSourceFromOmnvar.new( "damage_feedback_icon" )
		DataSources.inGame.HUD.hitMarker.iconTypeNotifySource = LUI.DataSourceFromOmnvar.new( "damage_feedback_icon_notify" )
		if Engine.IsCoreMode() then
			DataSources.inGame.HUD.hitMarker.audioEvents = LUI.DataSourceFromOmnvar.new( "ui_hitmarker_audio_events" )
		end
	end
end

PowerDataSourceHelpers = {
	PowerIsShieldRef = function ( f65_arg0 )
		if f65_arg0 == "offhandshield" then
			return true
		else
			return false
		end
	end,
	PowerIconFilter = function ( f66_arg0, f66_arg1 )
		if f66_arg0 then
			if f66_arg0 == -1 then
				return "specialty_ks_null"
			else
				return Engine.TableLookup( CSV.powers.file, CSV.powers.cols.index, tostring( f66_arg0 ), CSV.powers.cols.image )
			end
		else
			
		end
	end,
	PowerIconAlphaFilter = function ( f67_arg0, f67_arg1 )
		if f67_arg0 then
			if f67_arg0 == 0 then
				return 0
			else
				return 1
			end
		else
			
		end
	end,
	PowerNameFilter = function ( f68_arg0, f68_arg1 )
		if f68_arg0 then
			return Engine.TableLookup( CSV.powers.file, CSV.powers.cols.index, tostring( f68_arg0 ), CSV.powers.cols.name )
		else
			
		end
	end,
	PowerReferenceFilter = function ( f69_arg0, f69_arg1 )
		if f69_arg0 then
			return Engine.TableLookup( CSV.powers.file, CSV.powers.cols.index, tostring( f69_arg0 ), CSV.powers.cols.ref )
		else
			
		end
	end,
	PowerTypeFilter = function ( f70_arg0, f70_arg1 )
		if f70_arg0 then
			return Engine.TableLookup( CSV.powers.file, CSV.powers.cols.index, tostring( f70_arg0 ), CSV.powers.cols.uiType )
		else
			
		end
	end,
	PowerLowThresholdFilter = function ( f71_arg0, f71_arg1 )
		if f71_arg0 and 0 <= f71_arg0 and Engine.IsSingleplayer() then
			return tonumber( Engine.TableLookup( CSV.powers.file, CSV.powers.cols.index, tostring( f71_arg0 ), CSV.powers.cols.lowPower ) ) or 0
		else
			return 0
		end
	end,
	PowerColorFilterHelper = function ( f72_arg0, f72_arg1, f72_arg2 )
		local f72_local0 = f72_arg0.type:GetValue( f72_arg2 )
		local f72_local1 = f72_arg0.numCharges:GetValue( f72_arg2 )
		local f72_local2 = f72_arg0.rechargeProgress:GetValue( f72_arg2 )
		local f72_local3 = f72_arg0.consumption:GetValue( f72_arg2 )
		local f72_local4 = f72_arg1
		local f72_local5 = f72_arg0.powerDisabled:GetValue( f72_arg2 )
		local f72_local6 = f72_arg0.powerChargingState:GetValue( f72_arg2 )
		local f72_local7 = f72_arg0.reference:GetValue( f72_arg2 )
		local f72_local8 = Engine.IsSingleplayer()
		local f72_local9
		if f72_local8 then
			f72_local9 = SWATCHES.powers.active_sp
			if not f72_local9 then
			
			else
				local f72_local10
				if f72_local8 then
					f72_local10 = SWATCHES.powers.inactive_sp
					if not f72_local10 then
					
					else
						local f72_local11
						if f72_local8 then
							f72_local11 = SWATCHES.powers.inactive_sp_shield
							if not f72_local11 then
							
							else
								local f72_local12
								if f72_local8 then
									f72_local12 = SWATCHES.powers.recharging_sp
									if not f72_local12 then
									
									else
										if f72_local7 == "none" then
											f72_local4 = f72_local10
										elseif f72_local2 and f72_local2 < 1000 and f72_local0 == "drain" then
											if f72_local2 == 0 then
												f72_local4 = f72_local11
											elseif f72_local5 == true then
												f72_local4 = f72_local11
											elseif f72_local6 == 1 then
												f72_local4 = f72_local11
											elseif f72_local3 == true then
												f72_local4 = f72_local12
											elseif f72_local3 == false and f72_local5 == false then
												f72_local4 = f72_local9
											end
										elseif f72_local1 and f72_local1 <= 0 and (f72_local0 == "charges" or f72_local0 == "interact") then
											f72_local4 = f72_local10
										else
											f72_local4 = f72_local9
										end
										return GetIntForColor( f72_local4 )
									end
								end
								f72_local12 = SWATCHES.powers.recharging
							end
						end
						f72_local11 = SWATCHES.powers.inactive
					end
				end
				f72_local10 = SWATCHES.powers.inactive
			end
		end
		f72_local9 = SWATCHES.powers.active
	end,
	PowerButtonColorFilter = function ( f73_arg0, f73_arg1, f73_arg2 )
		local f73_local0 = f73_arg0.consumption:GetValue( f73_arg2 )
		local f73_local1 = f73_arg0.numCharges:GetValue( f73_arg2 )
		local f73_local2 = f73_arg0.type:GetValue( f73_arg2 )
		local f73_local3 = f73_arg1
		local f73_local4 = f73_arg0.powerDisabled:GetValue( f73_arg2 )
		local f73_local5 = f73_arg0.reference:GetValue( f73_arg2 )
		if PowerDataSourceHelpers.PowerIsShieldRef( f73_local5 ) then
			if DataSources.inGame.player.shieldEnergy:GetValue( f73_arg2 ) == DataSources.inGame.player.maxShieldEnergy:GetValue( f73_arg2 ) then
				f73_local3 = SWATCHES.powers.active
			elseif f73_local4 then
				f73_local3 = SWATCHES.HUD.disabled
			else
				f73_local3 = SWATCHES.powers.recharging
			end
		elseif not (not f73_local4 or f73_local2 ~= "drain") or not (f73_local1 ~= 0 or f73_local2 == "drain") or f73_local5 == "none" then
			f73_local3 = SWATCHES.HUD.disabled
		elseif f73_local0 then
			f73_local3 = SWATCHES.powers.recharging
		else
			f73_local3 = SWATCHES.powers.active
		end
		return GetIntForColor( f73_local3 )
	end,
	NumberAlphaFilter = function ( f74_arg0, f74_arg1 )
		if f74_arg0.type:GetValue( f74_arg1 ) == "drain" or f74_arg0.reference:GetValue( f74_arg1 ) == "none" then
			return 0
		else
			return 1
		end
	end,
	PowerDisabledFilter = function ( f75_arg0, f75_arg1 )
		if PowerDataSourceHelpers.PowerIsShieldRef( f75_arg0.reference:GetValue( f75_arg1 ) ) then
			return not DataSources.inGame.player.shieldCanDeploy:GetValue( f75_arg1 )
		else
			return f75_arg0.powerDisabledOnvmar:GetValue( f75_arg1 )
		end
	end,
	PowerChargeFilter = function ( f76_arg0, f76_arg1 )
		if PowerDataSourceHelpers.PowerIsShieldRef( f76_arg0.reference:GetValue( f76_arg1 ) ) then
			local f76_local0 = DataSources.inGame.player.shieldEnergy:GetValue( f76_arg1 )
			local f76_local1 = DataSources.inGame.player.maxShieldEnergy:GetValue( f76_arg1 )
			if f76_local1 == 0 or f76_local1 == nil then
				return 0
			else
				return f76_local0 / f76_local1 * 1000
			end
		else
			return f76_arg0.rechargeOmnvar:GetValue( f76_arg1 )
		end
	end,
	PowerConsumptionFilter = function ( f77_arg0, f77_arg1 )
		if PowerDataSourceHelpers.PowerIsShieldRef( f77_arg0.reference:GetValue( f77_arg1 ) ) then
			return not DataSources.inGame.player.shieldIsDeployed:GetValue( f77_arg1 )
		else
			return f77_arg0.consumptionOnmvar:GetValue( f77_arg1 )
		end
	end,
	PowerEquippedFilter = function ( f78_arg0, f78_arg1 )
		return -1 < f78_arg0
	end
}
local f0_local17 = function ()
	local f79_local0 = DataSources.inGame.player.primaryPower
	local f79_local1 = DataSources.inGame.player.secondaryPower
	f79_local0.base = LUI.DataSourceInControllerModel.new( "cg.player.primaryPower" )
	f79_local0.id = LUI.DataSourceFromOmnvar.new( "ui_power_id" )
	f79_local0.numCharges = LUI.DataSourceFromOmnvar.new( "ui_power_num_charges" )
	f79_local0.maxCharges = LUI.DataSourceFromOmnvar.new( "ui_power_max_charges" )
	f79_local0.rechargeProgress = LUI.DataSourceFromOmnvar.new( "ui_power_recharge" )
	f79_local0.consumption = LUI.DataSourceFromOmnvar.new( "ui_power_consume" )
	f79_local0.icon = DataSources.inGame.player.primaryPower.id:Filter( "icon", PowerDataSourceHelpers.PowerIconFilter )
	f79_local0.iconAlpha = DataSources.inGame.player.primaryPower.id:Filter( "iconAlpha", PowerDataSourceHelpers.PowerIconAlphaFilter )
	f79_local0.equipped = DataSources.inGame.player.primaryPower.id:Filter( "equipped", PowerDataSourceHelpers.PowerEquippedFilter )
	f79_local0.name = DataSources.inGame.player.primaryPower.id:Filter( "name", PowerDataSourceHelpers.PowerNameFilter )
	f79_local0.reference = DataSources.inGame.player.primaryPower.id:Filter( "reference", PowerDataSourceHelpers.PowerReferenceFilter )
	f79_local0.type = DataSources.inGame.player.primaryPower.id:Filter( "type", PowerDataSourceHelpers.PowerTypeFilter )
	f79_local0.lowPower = DataSources.inGame.player.primaryPower.id:Filter( "lowPower", PowerDataSourceHelpers.PowerLowThresholdFilter )
	f79_local0.powerDisabled = LUI.DataSourceFromOmnvar.new( "ui_power_disabled" )
	if Engine.IsCoreMode() then
		f79_local0.powerChargingState = LUI.DataSourceFromOmnvar.new( "ui_power_state" )
	else
		f79_local0.powerChargingState = LUI.DataSourceInGlobalModel.new( "cg.SP.power.defaultState", 0 )
	end
	local f79_local2 = {
		f79_local0.numCharges,
		f79_local0.rechargeProgress,
		f79_local0.consumption,
		f79_local0.type
	}
	table.insert( f79_local2, f79_local0.powerDisabled )
	f79_local0.color = LUI.AggregateDataSource.new( f79_local0.base, f79_local2, "color", function ( f80_arg0 )
		return PowerDataSourceHelpers.PowerColorFilterHelper( f79_local0, SWATCHES.powers.active, f80_arg0 )
	end )
	f79_local0.iconColor = LUI.AggregateDataSource.new( f79_local0.base, f79_local2, "iconColor", function ( f81_arg0 )
		return PowerDataSourceHelpers.PowerColorFilterHelper( f79_local0, SWATCHES.HUD.stable, f81_arg0 )
	end )
	f79_local0.buttonColor = LUI.AggregateDataSource.new( f79_local0.base, f79_local2, "buttonColor", function ( f82_arg0 )
		return PowerDataSourceHelpers.PowerButtonColorFilter( f79_local0, SWATCHES.HUD.stable, f82_arg0 )
	end )
	f79_local0.numAlpha = LUI.AggregateDataSource.new( f79_local0.base, f79_local2, "numAlpha", function ( f83_arg0 )
		return PowerDataSourceHelpers.NumberAlphaFilter( f79_local0, f83_arg0 )
	end )
	f79_local1.base = LUI.DataSourceInControllerModel.new( "cg.player.secondaryPower" )
	f79_local1.id = LUI.DataSourceFromOmnvar.new( "ui_power_id_secondary" )
	f79_local1.numCharges = LUI.DataSourceFromOmnvar.new( "ui_power_secondary_num_charges" )
	f79_local1.maxCharges = LUI.DataSourceFromOmnvar.new( "ui_power_secondary_max_charges" )
	f79_local1.icon = DataSources.inGame.player.secondaryPower.id:Filter( "icon", PowerDataSourceHelpers.PowerIconFilter )
	f79_local1.iconAlpha = DataSources.inGame.player.secondaryPower.id:Filter( "iconAlpha", PowerDataSourceHelpers.PowerIconAlphaFilter )
	f79_local1.equipped = DataSources.inGame.player.secondaryPower.id:Filter( "equipped", PowerDataSourceHelpers.PowerEquippedFilter )
	f79_local1.name = DataSources.inGame.player.secondaryPower.id:Filter( "name", PowerDataSourceHelpers.PowerNameFilter )
	f79_local1.reference = DataSources.inGame.player.secondaryPower.id:Filter( "reference", PowerDataSourceHelpers.PowerReferenceFilter )
	if Engine.IsCoreMode() then
		f79_local1.powerChargingState = LUI.DataSourceFromOmnvar.new( "ui_power_secondary_state" )
	else
		f79_local1.powerChargingState = LUI.DataSourceInGlobalModel.new( "cg.SP.power.secondary.defaultState", 0 )
	end
	f79_local1.consumptionOnmvar = LUI.DataSourceFromOmnvar.new( "ui_power_secondary_consume" )
	f79_local1.consumption = LUI.AggregateDataSource.new( f79_local1.base, {
		f79_local1.consumptionOnmvar,
		f79_local1.reference,
		DataSources.inGame.player.ShieldIsDeployed
	}, "consumptionState", function ( f84_arg0 )
		return PowerDataSourceHelpers.PowerConsumptionFilter( f79_local1, f84_arg0 )
	end )
	f79_local1.rechargeOmnvar = LUI.DataSourceFromOmnvar.new( "ui_power_secondary_recharge" )
	f79_local1.rechargeProgress = LUI.AggregateDataSource.new( f79_local1.base, {
		f79_local1.rechargeOmnvar,
		f79_local1.reference,
		DataSources.inGame.player.shieldEnergy,
		DataSources.inGame.player.maxShieldEnergy
	}, "rechargeProgress", function ( f85_arg0 )
		return PowerDataSourceHelpers.PowerChargeFilter( f79_local1, f85_arg0 )
	end )
	f79_local1.type = DataSources.inGame.player.secondaryPower.id:Filter( "type", PowerDataSourceHelpers.PowerTypeFilter )
	f79_local1.lowPower = DataSources.inGame.player.secondaryPower.id:Filter( "lowPower", PowerDataSourceHelpers.PowerLowThresholdFilter )
	f79_local1.powerDisabledOnvmar = LUI.DataSourceFromOmnvar.new( "ui_power_secondary_disabled" )
	f79_local1.powerDisabled = LUI.AggregateDataSource.new( f79_local1.base, {
		f79_local1.powerDisabledOnvmar,
		f79_local1.reference,
		DataSources.inGame.player.shieldCanDeploy
	}, "powerIsDisabled", function ( f86_arg0 )
		return PowerDataSourceHelpers.PowerDisabledFilter( f79_local1, f86_arg0 )
	end )
	local f79_local3 = {
		f79_local1.powerDisabled,
		f79_local1.numCharges,
		f79_local1.rechargeProgress,
		f79_local1.consumption,
		f79_local1.type,
		DataSources.inGame.player.shieldEnergy,
		DataSources.inGame.player.maxShieldEnergy
	}
	table.insert( f79_local3, f79_local1.powerDisabled )
	f79_local1.color = LUI.AggregateDataSource.new( f79_local1.base, f79_local3, "color", function ( f87_arg0 )
		return PowerDataSourceHelpers.PowerColorFilterHelper( f79_local1, SWATCHES.HUD.stable, f87_arg0 )
	end )
	f79_local1.iconColor = LUI.AggregateDataSource.new( f79_local1.base, f79_local3, "iconColor", function ( f88_arg0 )
		return PowerDataSourceHelpers.PowerColorFilterHelper( f79_local1, SWATCHES.HUD.stable, f88_arg0 )
	end )
	f79_local1.buttonColor = LUI.AggregateDataSource.new( f79_local1.base, f79_local3, "buttonColor", function ( f89_arg0 )
		return PowerDataSourceHelpers.PowerButtonColorFilter( f79_local1, SWATCHES.HUD.stable, f89_arg0 )
	end )
	f79_local1.numAlpha = LUI.AggregateDataSource.new( f79_local1.base, f79_local3, "numAlpha", function ( f90_arg0 )
		return PowerDataSourceHelpers.NumberAlphaFilter( f79_local1, f90_arg0 )
	end )
end

local f0_local18 = function ()
	DataSources.inGame.HUD.base = LUI.DataSourceInControllerModel.new( "cg.HUD" )
	DataSources.inGame.HUD.grenadeReticleType = LUI.DataSourceInControllerModel.new( "cg.HUD.grenadeReticleType" )
	DataSources.inGame.HUD.grenadeCookPercent = LUI.DataSourceInControllerModel.new( "cg.HUD.grenadeCookPercent" )
	DataSources.inGame.HUD.compassRotation = LUI.DataSourceInControllerModel.new( "cg.HUD.compassRotation" )
	DataSources.inGame.HUD.netPerf.isEnabled = LUI.DataSourceInGlobalModel.new( "cg.HUD.netPerf.isEnabled" )
	DataSources.inGame.HUD.netPerf.ping = LUI.DataSourceInControllerModel.new( "cg.HUD.netPerf.ping" )
	DataSources.inGame.HUD.netPerf.maxExtrapolation = LUI.DataSourceInControllerModel.new( "cg.HUD.netPerf.maxExtrapolation" )
	DataSources.inGame.HUD.netPerf.maxInterpolation = LUI.DataSourceInControllerModel.new( "cg.HUD.netPerf.maxInterpolation" )
	DataSources.inGame.HUD.netPerf.maxCmdReceived = LUI.DataSourceInControllerModel.new( "cg.HUD.netPerf.maxCmdReceived" )
	DataSources.inGame.HUD.netPerf.maxCmdQueued = LUI.DataSourceInControllerModel.new( "cg.HUD.netPerf.maxCmdQueued" )
	DataSources.inGame.HUD.netPerf.maxCmdDropped = LUI.DataSourceInControllerModel.new( "cg.HUD.netPerf.maxCmdDropped" )
	if Engine.IsCoreMode() then
		DataSources.inGame.HUD.pointsPopupNum = LUI.DataSourceFromOmnvar.new( "ui_points_popup" )
		DataSources.inGame.HUD.pointsPopupNotify = LUI.DataSourceFromOmnvar.new( "ui_points_popup_notify" )
		DataSources.inGame.HUD.pointsPopupDesc = LUI.DataSourceFromOmnvar.new( "ui_points_popup_desc" )
		DataSources.inGame.HUD.pointsPopupDescNotify = LUI.DataSourceFromOmnvar.new( "ui_points_popup_desc_notify" )
		f0_local9()
	end
	if Engine.IsMultiplayer() then
		DataSources.inGame.HUD.isScoreboardOpen = LUI.DataSourceInControllerModel.new( "cg.HUD.isScoreboardOpen", false )
		DataSources.inGame.HUD.ownerIsTalking = LUI.DataSourceInControllerModel.new( "cg.HUD.talkersHud.ownerIsTalking", false )
		DataSources.inGame.HUD.talkersList = LUI.DataSourceFromList.new( 4 )
		DataSources.inGame.HUD.talkersList.MakeDataSourceAtIndex = function ( f92_arg0, f92_arg1, f92_arg2 )
			local f92_local0 = LUI.DataSourceInGlobalModel.new( "cg.HUD.talkersHud.talkers" )
			return {
				name = f92_local0:GetDataSourceForSubmodel( f92_arg1 .. ".name" ),
				isVisible = f92_local0:GetDataSourceForSubmodel( f92_arg1 .. ".isVisible" )
			}
		end
		
	end
end

local f0_local19 = function ( f93_arg0 )
	if Engine.IsSingleplayer() then
		if DataSources.inGame.HUD.overlay.isC12Active:GetValue( f93_arg0 ) == 1 then
			return true
		elseif DataSources.inGame.HUD.overlay.isDropshipActive:GetValue( f93_arg0 ) then
			return true
		elseif DataSources.inGame.SP.hackTargeting:GetValue( f93_arg0 ) then
			return true
		elseif DataSources.inGame.SP.hackControlOverlay:GetValue( f93_arg0 ) then
			return true
		elseif DataSources.inGame.SP.hackEthanControlOverlay:GetValue( f93_arg0 ) > 0 then
			return true
		elseif DataSources.inGame.HUD.overlay.jackalCallDownActive:GetValue( f93_arg0 ) then
			return true
		elseif DataSources.inGame.SP.mars.marsRemoteMissileActive and DataSources.inGame.SP.mars.marsRemoteMissileActive:GetValue( f93_arg0 ) then
			return true
		elseif DataSources.inGame.SP.europa.haloDropActive and DataSources.inGame.SP.europa.haloDropActive:GetValue( f93_arg0 ) then
			return true
		end
	end
	return false
end

local f0_local20 = function ()
	DataSources.inGame.HUD.overlay.base = LUI.DataSourceInControllerModel.new( "cg.HUD.overlay" )
	local f94_local0 = {}
	if Engine.IsSingleplayer() then
		DataSources.inGame.HUD.overlay.isC12Active = LUI.DataSourceFromOmnvar.new( "ui_c12_active" )
		table.insert( f94_local0, DataSources.inGame.HUD.overlay.isC12Active )
		DataSources.inGame.HUD.overlay.isDropshipActive = LUI.DataSourceFromOmnvar.new( "ui_dropship_active" )
		table.insert( f94_local0, DataSources.inGame.HUD.overlay.isDropshipActive )
		table.insert( f94_local0, DataSources.inGame.SP.hackTargeting )
		table.insert( f94_local0, DataSources.inGame.SP.hackControlOverlay )
		table.insert( f94_local0, DataSources.inGame.SP.hackEthanControlOverlay )
		DataSources.inGame.HUD.overlay.jackalCallDownActive = LUI.DataSourceFromOmnvar.new( "ui_jackal_call_down_active" )
		table.insert( f94_local0, DataSources.inGame.HUD.overlay.jackalCallDownActive )
		table.insert( f94_local0, DataSources.inGame.SP.mars.marsRemoteMissileActive )
		table.insert( f94_local0, DataSources.inGame.SP.europa.haloDropActive )
		table.insert( f94_local0, DataSources.inGame.SP.europa.bfgActive )
		DataSources.inGame.HUD.overlay.active = LUI.AggregateDataSource.new( DataSources.inGame.HUD.overlay.base, f94_local0, "active", f0_local19 )
	end
	if Engine.IsCoreMode() then
		DataSources.inGame.HUD.overlay.locationSelectorActive = LUI.DataSourceInControllerModel.new( "cg.HUD.overlay.locationSelectorActive" )
	end
end

local f0_local21 = function ()
	f0_local8()
	f0_local10()
	f0_local11()
	f0_local12()
	f0_local13()
	f0_local15()
	f0_local14()
	f0_local16()
	f0_local17()
	f0_local18()
end

local f0_local22 = false
function InitInGameDataSources()
	if f0_local22 then
		return 
	end
	Engine.MeasureResourceEventStart( "InitInGameDataSources", "widget" )
	f0_local22 = true
	InitAlwaysLoadedDataSources()
	f0_local21()
	if Engine.IsSingleplayer() then
		InitSPInGameDataSources()
	end
	if Engine.IsMultiplayer() then
		f0_local7()
	end
	if Engine.IsCoreMode() then
		InitCoreMPInGameDataSources()
	end
	if Engine.IsAliensMode() then
		f0_local6()
	end
	f0_local20()
	f0_local5()
	Engine.MeasureResourceEventEnd( "InitInGameDataSources", "widget" )
end

