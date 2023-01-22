if not ZombiesUtils then
	ZombiesUtils = {}
end
ZombiesUtils.CombatRecordMenuModelPath = "frontEnd.CP.barracks.CombatRecord"
local f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0
	if f1_arg0 then
		f1_local0 = 1
		if not f1_local0 then
		
		else
			local f1_local1
			if f1_arg1 then
				f1_local1 = 2
				if not f1_local1 then
				
				else
					f1_local0 = f1_local0 + f1_local1
					if f1_arg2 then
						f1_local1 = 4
						if not f1_local1 then
						
						else
							return f1_local0 + f1_local1
						end
					end
					f1_local1 = 0
				end
			end
			f1_local1 = 0
		end
	end
	f1_local0 = 0
end

ZombiesUtils.GetZombiesPlayerPhoto = function ( f2_arg0, f2_arg1, f2_arg2 )
	return Engine.TableLookup( CSV.zombiePlayerImage.File, CSV.zombiePlayerImage.Cols.Idx, tostring( f0_local0( Engine.IsBitSet( f2_arg0, f2_arg2 * 3 ), Engine.IsBitSet( f2_arg0, f2_arg2 * 3 + 1 ), Engine.IsBitSet( f2_arg0, f2_arg2 * 3 + 2 ) ) ), 1 + f0_local0( Engine.IsBitSet( f2_arg1, f2_arg2 * 3 ), Engine.IsBitSet( f2_arg1, f2_arg2 * 3 + 1 ), Engine.IsBitSet( f2_arg1, f2_arg2 * 3 + 2 ) ) )
end

ZombiesUtils.GetZombiesBigPhoto = function ( f3_arg0, f3_arg1 )
	return Engine.TableLookup( CSV.zombiePlayerImage.File, CSV.zombiePlayerImage.Cols.Idx, tostring( f0_local0( Engine.IsBitSet( f3_arg0, f3_arg1 * 3 ), Engine.IsBitSet( f3_arg0, f3_arg1 * 3 + 1 ), Engine.IsBitSet( f3_arg0, f3_arg1 * 3 + 2 ) ) ), CSV.zombiePlayerImage.Cols.BigImage )
end

ZombiesUtils.GetZombiesWinPhoto = function ( f4_arg0, f4_arg1 )
	return string.gsub( Engine.TableLookup( CSV.zombiePlayerImage.File, CSV.zombiePlayerImage.Cols.Idx, tostring( f0_local0( Engine.IsBitSet( f4_arg0, f4_arg1 * 3 ), Engine.IsBitSet( f4_arg0, f4_arg1 * 3 + 1 ), Engine.IsBitSet( f4_arg0, f4_arg1 * 3 + 2 ) ) ), CSV.zombiePlayerImage.Cols.Icon ), "team", "main" )
end

ZombiesUtils.GetZombiesPlayerCoin = function ( f5_arg0, f5_arg1 )
	return Engine.BitwiseAnd( Engine.BitShiftRight( f5_arg0, f5_arg1 * 2 ), 3 )
end

ZombiesUtils.IsLootFortuneCardOwned = function ( f6_arg0, f6_arg1 )
	if Engine.GetDvarBool( "ui_unlock_loot" ) and Engine.IsDevelopmentBuild() then
		return true
	else
		local f6_local0 = Engine.TableLookup( CSV.zombieConsumableItems.file, CSV.zombieConsumableItems.Cols.Ref, f6_arg0, CSV.zombieConsumableItems.Cols.LootID )
		assert( f6_local0 )
		return Loot.IsOwned( f6_arg1, f6_local0 ) > 0
	end
end

ZombiesUtils.NumberOfFortuneCardsOwned = function ( f7_arg0, f7_arg1 )
	if Engine.GetDvarBool( "ui_unlock_loot" ) and Engine.IsDevelopmentBuild() then
		return true
	else
		local f7_local0 = Engine.TableLookup( CSV.zombieConsumableItems.file, CSV.zombieConsumableItems.Cols.Ref, f7_arg0, CSV.zombieConsumableItems.Cols.LootID )
		assert( f7_local0 )
		numOwned = Loot.IsOwned( f7_arg1, f7_local0 )
		return numOwned
	end
end

ZombiesUtils.ValidateFortuneCards = function ( f8_arg0 )
	local f8_local0 = {
		"grenade_cooldown",
		"spawn_reboard_windows",
		"burned_out",
		"faster_health_regen_upgrade",
		"sniper_soft_upgrade"
	}
	for f8_local1 = 0, 4, 1 do
		LUI.RemoveSingleItemFromArray( f8_local0, Engine.GetPlayerDataEx( f8_arg0, CoD.StatsGroup.Coop, "zombiePlayerLoadout", "zombie_consumables", f8_local1 ) )
	end
	for f8_local1 = 0, 4, 1 do
		local f8_local4 = Engine.GetPlayerDataEx( f8_arg0, CoD.StatsGroup.Coop, "zombiePlayerLoadout", "zombie_consumables", f8_local1 )
		if Engine.TableLookup( CSV.zombieConsumableItems.file, CSV.zombieConsumableItems.Cols.Ref, f8_local4, CSV.zombieConsumableItems.Cols.InventoryType ) == "Fortune" and Engine.GetPlayerDataEx( f8_arg0, CoD.StatsGroup.Coop, "zombiePlayerLoadout", "consumables_counter", f8_local1 ) < 1 then
			assert( #f8_local0 > 0 )
			local f8_local5 = table.remove( f8_local0, math.random( 1, #f8_local0 ) )
			Engine.SetPlayerDataEx( f8_arg0, CoD.StatsGroup.Coop, "consumables_enabled_flags", "zombie_consumables", f8_local4, false )
			Engine.SetPlayerDataEx( f8_arg0, CoD.StatsGroup.Coop, "zombiePlayerLoadout", "zombie_consumables", f8_local1, f8_local5 )
			Engine.SetPlayerDataEx( f8_arg0, CoD.StatsGroup.Coop, "consumables_enabled_flags", "zombie_consumables", f8_local5, true )
			Engine.SetPlayerDataEx( f8_arg0, CoD.StatsGroup.Coop, "zombiePlayerLoadout", "consumables_counter", f8_local1, 0 )
		end
	end
end

ZombiesUtils.GetMapsDataSources = function ( f9_arg0, f9_arg1, f9_arg2 )
	local f9_local0 = {}
	for f9_local1 = 0, Lobby.GetMapFeederCount() - 1, 1 do
		local f9_local4 = Lobby.ShouldDisplayMap( f9_local1, f9_arg1 )
		local f9_local5 = nil
		if f9_local4 then
			local f9_local6 = Lobby.GetMapPackForMapIndex( f9_local1 )
			local f9_local7 = {
				name = Lobby.GetMapNameByIndex( f9_local1 ),
				ref = Lobby.GetMapLoadNameByIndex( f9_local1 ),
				desc = Lobby.GetMapDescByIndex( f9_local1 ),
				image = Lobby.GetMapImageByIndex( f9_local1 ),
				isOwned = Engine.IsMapPackOwned( f9_local6 ),
				bossID = nil
			}
			if f9_arg2 ~= nil then
				if f9_local7.ref == "cp_zmb" and Engine.GetDvarBool( "online_zombie_boss_zmb" ) then
					f9_local7.name = Engine.Localize( "LUA_MENU_ZM_BOSS_SPACELAND" )
					f9_local7.bossID = 0
					table.insert( f9_local0, f9_local7 )
				elseif f9_local7.ref == "cp_rave" and Engine.GetDvarBool( "online_zombie_boss_rave" ) then
					f9_local7.name = Engine.Localize( "LUA_MENU_ZM_BOSS_RAVE" )
					f9_local7.bossID = 1
					table.insert( f9_local0, f9_local7 )
				elseif f9_local7.ref == "cp_disco" and Engine.GetDvarBool( "online_zombie_boss_disco" ) then
					f9_local7.name = Engine.Localize( "LUA_MENU_ZM_BOSS_DISCO" )
					f9_local7.bossID = 2
					table.insert( f9_local0, f9_local7 )
				elseif f9_local7.ref == "cp_town" and Engine.GetDvarBool( "online_zombie_boss_town" ) then
					f9_local7.name = Engine.Localize( "LUA_MENU_ZM_BOSS_TOWN" )
					f9_local7.bossID = 3
					table.insert( f9_local0, f9_local7 )
				elseif f9_local7.ref == "cp_final" and Engine.GetDvarBool( "online_zombie_boss_final" ) then
					f9_local7.name = Engine.Localize( "LUA_MENU_ZM_BOSS_FINAL" )
					f9_local7.bossID = 4
					table.insert( f9_local0, f9_local7 )
					f9_local5 = true
				end
			else
				table.insert( f9_local0, f9_local7 )
			end
			if f9_arg2 ~= nil and f9_local5 and Engine.GetDvarBool( "online_zombie_boss_dc" ) then
				table.insert( f9_local0, {
					name = Engine.Localize( "LUA_MENU_ZM_BOSS_DC" ),
					ref = Lobby.GetMapLoadNameByIndex( f9_local1 ),
					desc = Lobby.GetMapDescByIndex( f9_local1 ),
					image = Lobby.GetMapImageByIndex( f9_local1 ),
					isOwned = Engine.IsMapPackOwned( f9_local6 ),
					bossID = 5
				} )
			end
		end
	end
	local f9_local1 = LUI.DataSourceFromList.new( #f9_local0 )
	f9_local1.MakeDataSourceAtIndex = function ( f10_arg0, f10_arg1 )
		local f10_local0 = f9_arg0 .. ".map." .. f10_arg1 + 1
		local f10_local1 = f9_local0[f10_arg1 + 1]
		local f10_local2 = 0
		local f10_local3 = 0
		local f10_local4 = 0
		local f10_local5 = 0
		local f10_local6 = 0
		local f10_local7 = 0
		local f10_local8 = 0
		local f10_local9 = 0
		local f10_local10 = 0
		local f10_local11 = LUI.DataSourceInGlobalModel.new( f10_local0 .. ".highestWaveMap", math.max( Engine.GetPlayerDataEx( f9_arg1, CoD.StatsGroup.Coop, "leaderboarddata", f10_local1.ref, "leaderboardDataPerMap", 1, "Highest_Wave" ), Engine.GetPlayerDataEx( f9_arg1, CoD.StatsGroup.Coop, "leaderboarddata", f10_local1.ref, "leaderboardDataPerMap", 2, "Highest_Wave" ), Engine.GetPlayerDataEx( f9_arg1, CoD.StatsGroup.Coop, "leaderboarddata", f10_local1.ref, "leaderboardDataPerMap", 3, "Highest_Wave" ), Engine.GetPlayerDataEx( f9_arg1, CoD.StatsGroup.Coop, "leaderboarddata", f10_local1.ref, "leaderboardDataPerMap", 4, "Highest_Wave" ) ) )
		local f10_local12 = LUI.DataSourceInGlobalModel.new( f10_local0 .. ".isOwned" )
		f10_local12:SetValue( f9_arg1, f10_local1.isOwned )
		for f10_local13 = 1, 4, 1 do
			f10_local2 = f10_local2 + Engine.GetPlayerDataEx( f9_arg1, CoD.StatsGroup.Coop, "leaderboarddata", f10_local1.ref, "leaderboardDataPerMap", f10_local13, "Kills" )
			f10_local3 = f10_local3 + Engine.GetPlayerDataEx( f9_arg1, CoD.StatsGroup.Coop, "leaderboarddata", f10_local1.ref, "leaderboardDataPerMap", f10_local13, "Rounds" )
			f10_local4 = f10_local4 + Engine.GetPlayerDataEx( f9_arg1, CoD.StatsGroup.Coop, "leaderboarddata", f10_local1.ref, "leaderboardDataPerMap", f10_local13, "Headshots" )
			f10_local5 = f10_local5 + Engine.GetPlayerDataEx( f9_arg1, CoD.StatsGroup.Coop, "leaderboarddata", f10_local1.ref, "leaderboardDataPerMap", f10_local13, "Downs" )
			f10_local6 = f10_local6 + Engine.GetPlayerDataEx( f9_arg1, CoD.StatsGroup.Coop, "leaderboarddata", f10_local1.ref, "leaderboardDataPerMap", f10_local13, "Revives" )
		end
		return {
			name = LUI.DataSourceInGlobalModel.new( f10_local0 .. ".name", f10_local1.name ),
			desc = LUI.DataSourceInGlobalModel.new( f10_local0 .. ".desc", f10_local1.desc ),
			image = LUI.DataSourceInGlobalModel.new( f10_local0 .. ".image", f10_local1.image ),
			isOwned = f10_local12,
			bossID = f10_local1.bossID,
			ref = f10_local1.ref,
			kills = LUI.DataSourceInGlobalModel.new( f10_local0 .. ".kills", f10_local2 ),
			rounds = LUI.DataSourceInGlobalModel.new( f10_local0 .. ".rounds", f10_local3 ),
			headshots = LUI.DataSourceInGlobalModel.new( f10_local0 .. ".headshots", f10_local4 ),
			downs = LUI.DataSourceInGlobalModel.new( f10_local0 .. ".downs", f10_local5 ),
			revives = LUI.DataSourceInGlobalModel.new( f10_local0 .. ".revives", f10_local6 ),
			highestWave = f10_local11,
			boss = LUI.DataSourceInGlobalModel.new( f10_local0 .. ".boss", Engine.GetPlayerDataEx( f9_arg1, CoD.StatsGroup.Coop, "duration", f10_local1.ref ) ),
			meph = LUI.DataSourceInGlobalModel.new( f10_local0 .. ".meph", Engine.GetPlayerDataEx( f9_arg1, CoD.StatsGroup.Coop, "alienPlayerStats", "bestscore" ) ),
			listIndex = f10_arg1
		}
	end
	
	f9_local1.GetDefaultFocusIndex = function ()
		local f11_local0 = Engine.GetDvarString( "ui_mapname" )
		for f11_local1 = 0, f9_local1:GetCountValue( f9_arg1 ) - 1, 1 do
			local f11_local4 = f9_local1:GetDataSourceAtIndex( f11_local1 )
			if f11_local4.ref == f11_local0 then
				if f11_local0 == "cp_final" then
					if Engine.GetDvarInt( "scr_direct_to_meph_fight" ) == 1 then
						return f11_local1 + 1
					end
					return f11_local1
				end
				return f11_local1
			end
		end
	end
	
	return f9_local1
end

ZombiesUtils.SetFrontendMusic = function ()
	if not Engine.IsAliensMode() then
		return 
	end
	local f12_local0 = Engine.GetFirstActiveController()
	assert( f12_local0 )
	local f12_local1 = LUI.DataSourceFromPlayerData.new( CoD.StatsGroup.Coop, CoD.PlayMode.Aliens )
	local f12_local2 = f12_local1.zombiePlayerLoadout.lobbySong:GetValue( f12_local0 )
	Engine.NotifyServer( "music_changed", f12_local2 )
	if f12_local2 == 22 then
		ZombiesUtils.SendShuffleNotifys()
	end
end

ZombiesUtils.SendShuffleNotifys = function ()
	local f13_local0 = Engine.GetFirstActiveController()
	assert( f13_local0 )
	local f13_local1, f13_local2, f13_local3, f13_local4, f13_local5 = nil
	local f13_local6 = Engine.GetLuiRoot()
	Engine.NotifyServer( "music_changed", 22 )
	f13_local5 = function ( f14_arg0 )
		f13_local1 = "song_" .. f14_arg0
		f13_local2 = "songcheck_" .. f14_arg0
		f13_local3 = Engine.GetPlayerDataEx( f13_local0, CoD.StatsGroup.Coop, "hasSongsUnlocked", f13_local1 )
		if f13_local3 == true then
			f13_local4 = 1
		else
			f13_local4 = 0
		end
		Engine.NotifyServer( f13_local2, f13_local4 )
	end
	
	for f13_local7 = 1, 11, 1 do
		local f13_local10 = f13_local7
		local f13_local11 = f13_local6:Wait( 75 * f13_local10 )
		f13_local11.onComplete = function ()
			f13_local5( f13_local10 )
		end
		
	end
end

