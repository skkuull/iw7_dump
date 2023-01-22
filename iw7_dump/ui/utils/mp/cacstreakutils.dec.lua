Cac = Cac or {}
Cac.FirstStreakIndex = 0
Cac.LastStreakIndex = 2
Cac.MaxStreaks = 3
Cac.MaxStreakScore = 1500
Cac.StreakNoneValue = "none"
Cac.GetLootStreakRef = function ( f1_arg0 )
	return Engine.TableLookup( CSV.streakLootMaster.file, CSV.streakLootMaster.cols.index, tostring( f1_arg0 ), CSV.streakLootMaster.cols.ref )
end

Cac.GetLootStreakBaseRef = function ( f2_arg0 )
	return Engine.TableLookup( CSV.streakLootMaster.file, CSV.streakLootMaster.cols.index, tostring( f2_arg0 ), CSV.streakLootMaster.cols.baseStreak )
end

Cac.GetStreakImage = function ( f3_arg0 )
	return Engine.TableLookup( CSV.streaks.file, CSV.streaks.cols.ref, f3_arg0, CSV.streaks.cols.icon )
end

Cac.GetStreakFullImage = function ( f4_arg0 )
	return Engine.TableLookup( CSV.streaks.file, CSV.streaks.cols.ref, f4_arg0, CSV.streaks.cols.fullImage )
end

Cac.GetSmallImage = function ( f5_arg0 )
	return Engine.TableLookup( CSV.streaks.file, CSV.streaks.cols.ref, f5_arg0, CSV.streaks.cols.smallImage )
end

Cac.GetStreakScore = function ( f6_arg0 )
	return Engine.TableLookup( CSV.streaks.file, CSV.streaks.cols.ref, f6_arg0, CSV.streaks.cols.score )
end

Cac.GetStreakSupportCost = function ( f7_arg0 )
	local f7_local0 = Engine.TableLookup( CSV.streaks.file, CSV.streaks.cols.ref, f7_arg0, CSV.streaks.cols.supportCost )
	if f7_local0 and f7_local0 ~= "" then
		return f7_local0
	else
		local f7_local1 = Engine.TableLookup( CSV.streakLootMaster.file, CSV.streakLootMaster.cols.ref, f7_arg0, CSV.streakLootMaster.cols.pointsCostWithPersist )
		if f7_local1 and f7_local1 ~= "" then
			return f7_local1
		else
			return ""
		end
	end
end

Cac.GetStreakKills = function ( f8_arg0 )
	local f8_local0 = Engine.TableLookup( CSV.streaks.file, CSV.streaks.cols.ref, f8_arg0, CSV.streaks.cols.kills )
	if f8_local0 and f8_local0 ~= "" then
		return f8_local0
	else
		local f8_local1 = Engine.TableLookup( CSV.streakLootMaster.file, CSV.streakLootMaster.cols.ref, f8_arg0, CSV.streakLootMaster.cols.pointsCost )
		if f8_local1 and f8_local1 ~= "" then
			return f8_local1
		else
			return ""
		end
	end
end

Cac.GetStreakDisplayPointsCost = function ( f9_arg0, f9_arg1, f9_arg2 )
	local f9_local0 = ""
	if f9_arg1 then
		f9_local0 = Cac.GetLootStreakBaseRef( f9_arg1 )
	end
	if f9_arg2 then
		local f9_local1 = Cac.GetStreakSupportCost( f9_arg0 )
		if f9_local1 and f9_local1 ~= "" then
			return f9_local1
		elseif f9_local0 ~= "" then
			return Cac.GetStreakSupportCost( f9_local0 )
		end
	else
		local f9_local1 = Cac.GetStreakKills( f9_arg0 )
		if f9_local1 and f9_local1 ~= "" then
			return f9_local1
		elseif f9_local0 ~= "" then
			return Cac.GetStreakKills( f9_local0 )
		end
	end
	return ""
end

Cac.GetStreakName = function ( f10_arg0 )
	return Engine.Localize( Engine.TableLookup( CSV.streaks.file, CSV.streaks.cols.ref, f10_arg0, CSV.streaks.cols.name ) )
end

Cac.GetStreakDesc = function ( f11_arg0 )
	return Engine.Localize( Engine.TableLookup( CSV.streaks.file, CSV.streaks.cols.ref, f11_arg0, CSV.streaks.cols.desc ) )
end

Cac.IsStreakInUse = function ( f12_arg0 )
	local f12_local0
	if f12_arg0 == "none" or f12_arg0 == "" then
		f12_local0 = false
	else
		f12_local0 = true
	end
	return f12_local0
end

Cac.GetStreakIndex = function ( f13_arg0 )
	return STREAK_LIST[f13_arg0].index
end

Cac.GetEquippedStreaks = function ( f14_arg0, f14_arg1 )
	assert( f14_arg1 )
	local f14_local0 = {}
	for f14_local1 = Cac.FirstStreakIndex, Cac.LastStreakIndex, 1 do
		local f14_local4 = f14_arg0.killstreakSetups[f14_local1]
		local f14_local5 = f14_local4.lootItemID:GetValue( f14_arg1 )
		local f14_local6 = nil
		local f14_local7 = f14_local4.killstreak:GetValue( f14_arg1 )
		local f14_local8
		if f14_local7 ~= "none" then
			f14_local8 = STREAK_LIST[f14_local7].score
			if not f14_local8 then
			
			else
				if f14_local5 > 0 then
					f14_local6 = Engine.TableLookup( CSV.streakLootMaster.file, CSV.streakLootMaster.cols.index, tostring( f14_local5 ), CSV.streakLootMaster.cols.ref )
				else
					f14_local6 = f14_local7
				end
				assert( f14_local6 and #f14_local6 > 0 )
				f14_local0[f14_local1] = {
					streakRef = f14_local6,
					baseStreakRef = f14_local7,
					lootItemID = f14_local5,
					score = f14_local8
				}
			end
		end
		f14_local8 = 0
	end
	return f14_local0
end

Cac.GetEquippedStreakCount = function ( f15_arg0, f15_arg1 )
	local f15_local0 = 0
	for f15_local1 = Cac.FirstStreakIndex, Cac.LastStreakIndex, 1 do
		if f15_arg0.killstreakSetups[f15_local1].killstreak:GetValue( f15_arg1 ) ~= "none" then
			f15_local0 = f15_local0 + 1
		end
	end
	return f15_local0
end

Cac.IsBaseStreakUnlocked = function ( f16_arg0, f16_arg1 )
	return Engine.IsUnlocked( f16_arg1, "killstreak", f16_arg0 )
end

Cac.IsStreakEquipped = function ( f17_arg0, f17_arg1, f17_arg2, f17_arg3 )
	for f17_local3, f17_local4 in pairs( Cac.GetEquippedStreaks( f17_arg0, f17_arg1 ) ) do
		if f17_arg2 == f17_local4.baseStreakRef and f17_arg3 == f17_local4.lootItemID then
			return true
		end
	end
	return false
end

Cac.IsBaseStreakEquipped = function ( f18_arg0, f18_arg1, f18_arg2 )
	for f18_local3, f18_local4 in pairs( Cac.GetEquippedStreaks( f18_arg0, f18_arg1 ) ) do
		if f18_arg2 == f18_local4.baseStreakRef then
			return true
		end
	end
	return false
end

Cac.GetStreakIndexIfEquipped = function ( f19_arg0, f19_arg1, f19_arg2 )
	for f19_local3, f19_local4 in pairs( Cac.GetEquippedStreaks( f19_arg0, f19_arg1 ) ) do
		if f19_arg2 == f19_local4.baseStreakRef then
			return f19_local3
		end
	end
end

Cac.GetInfoFromBaseStreakAndLootID = function ( f20_arg0, f20_arg1 )
	local f20_local0 = {}
	if 0 < f20_arg1 then
		f20_local0 = CSV.ReadRow( {
			file = CSV.streakLootMaster,
			[1] = CSV.streakLootMaster.cols
		}, Engine.TableLookupGetRowNum( CSV.streakLootMaster.file, CSV.streakLootMaster.cols.index, tostring( f20_arg1 ) ) )
	else
		f20_local0 = STREAK_LIST[f20_arg0]
	end
	return f20_local0
end

Cac.ClearStreakSlot = function ( f21_arg0, f21_arg1, f21_arg2, f21_arg3, f21_arg4 )
	if f21_arg3 then
		local f21_local0 = f21_arg0.killstreakSetups[f21_arg2].killstreak
		f21_arg3.statsGroup.streakPreferences[f21_arg0.killstreakSetups[f21_arg2].killstreak:GetValue( f21_arg1 )]:SetValue( f21_arg1, Cac.BaseLootID )
	end
	f21_arg0.killstreakSetups[f21_arg2].killstreak:SetValue( f21_arg1, "none" )
	f21_arg0.killstreakSetups[f21_arg2].lootItemID:SetValue( f21_arg1, Cac.BaseLootID )
	if f21_arg4 then
		Cac.SortStreaks( f21_arg0, f21_arg1 )
	end
end

Cac.SortStreaks = function ( f22_arg0, f22_arg1 )
	local f22_local0 = {}
	local f22_local1 = {}
	for f22_local2 = Cac.FirstStreakIndex, Cac.LastStreakIndex, 1 do
		local f22_local5 = f22_arg0.killstreakSetups[f22_local2].killstreak:GetValue( f22_arg1 )
		if f22_local5 ~= "none" then
			local f22_local6 = f22_arg0.killstreakSetups[f22_local2].lootItemID:GetValue( f22_arg1 )
			local f22_local7 = Cac.GetLootStreakRef( f22_local6 )
			if f22_local7 == "" then
				f22_local7 = f22_local5
			end
			local f22_local8 = tonumber( Cac.GetStreakDisplayPointsCost( f22_local7, f22_local6, false ) )
			if not f22_local0[f22_local8] then
				table.insert( f22_local1, f22_local8 )
			end
			local f22_local9 = f22_local0[f22_local8]
			if not f22_local9 then
				f22_local9 = {}
			end
			f22_local0[f22_local8] = f22_local9
			table.insert( f22_local0[f22_local8], {
				baseStreakRef = f22_local5,
				lootItemID = f22_local6
			} )
		end
		Cac.ClearStreakSlot( f22_arg0, f22_arg1, f22_local2 )
	end
	table.sort( f22_local1 )
	local f22_local2 = Cac.FirstStreakIndex
	for f22_local5, f22_local6 in pairs( f22_local1 ) do
		for f22_local11, f22_local12 in ipairs( f22_local0[f22_local6] ) do
			f22_arg0.killstreakSetups[f22_local2].lootItemID:SetValue( f22_arg1, f22_local12.lootItemID )
			f22_arg0.killstreakSetups[f22_local2].killstreak:SetValue( f22_arg1, f22_local12.baseStreakRef )
			f22_local2 = f22_local2 + 1
		end
	end
end

local f0_local0 = function ( f23_arg0, f23_arg1, f23_arg2, f23_arg3, f23_arg4, f23_arg5 )
	f23_arg1.statsGroup.streakPreferences[f23_arg3]:SetValue( f23_arg5, f23_arg4 )
	f23_arg0.killstreakSetups[f23_arg2].lootItemID:SetValue( f23_arg5, f23_arg4 )
	f23_arg0.killstreakSetups[f23_arg2].killstreak:SetValue( f23_arg5, f23_arg3 )
	Cac.SortStreaks( f23_arg0, f23_arg5 )
end

Cac.TryToEquipStreak = function ( f24_arg0, f24_arg1, f24_arg2, f24_arg3, f24_arg4 )
	local f24_local0 = Cac.GetEquippedStreaks( f24_arg0, f24_arg4 )
	local f24_local1 = nil
	for f24_local5, f24_local6 in pairs( f24_local0 ) do
		if f24_arg2 == f24_local6.baseStreakRef then
			f0_local0( f24_arg0, f24_arg1, f24_local5, f24_arg2, f24_arg3, f24_arg4 )
			return true
		elseif f24_local6.baseStreakRef == "none" then
			f24_local1 = f24_local5
		end
	end
	if f24_local1 then
		f0_local0( f24_arg0, f24_arg1, f24_local1, f24_arg2, f24_arg3, f24_arg4 )
		return true
	end
	return false
end

Cac.GetStreakUnlockRank = function ( f25_arg0 )
	return Engine.TableLookup( CSV.streakUnlockTable.file, CSV.streakUnlockTable.cols.ref, f25_arg0, CSV.streakUnlockTable.cols.unlockRank )
end

Cac.GetStreakItemCardData = function ( f26_arg0 )
	local f26_local0 = Cac.GetStreakUnlockRank( f26_arg0 )
	return {
		name = Cac.GetStreakName( f26_arg0 ),
		image = Cac.GetStreakFullImage( f26_arg0 ),
		desc = Cac.GetStreakDesc( f26_arg0 ),
		title = Engine.Localize( "LUA_MENU_MP_ITEM_CARD_TITLE_STREAK" ),
		rank = Rank.GetRankDisplay( f26_local0 ),
		rankIcon = Rank.GetRankIcon( f26_local0, 0 ),
		rankName = Rank.GetShortRank( f26_local0 )
	}
end

Cac.GetBaseStreakFromLootID = function ( f27_arg0 )
	return Engine.TableLookup( CSV.streakLootMaster.file, CSV.streakLootMaster.cols.index, f27_arg0, CSV.streakLootMaster.cols.baseStreak )
end

Cac.IsLootStreakOwned = function ( f28_arg0, f28_arg1 )
	if Engine.GetDvarBool( "ui_unlock_loot" ) and Engine.IsDevelopmentBuild() then
		return true
	else
		return Loot.IsOwned( f28_arg1, f28_arg0 ) > 0
	end
end

Cac.GetPassivesForStreak = function ( f29_arg0 )
	local f29_local0 = {}
	for f29_local1 = 1, 3, 1 do
		local f29_local4 = Engine.TableLookup( CSV.streakLootMaster.file, CSV.streakLootMaster.cols.index, f29_arg0, CSV.streakLootMaster.cols["passive" .. f29_local1] )
		if #f29_local4 > 0 then
			local f29_local5 = DataSources.alwaysLoaded.MP.CAC.passives[f29_local4]
			assert( f29_local5 )
			table.insert( f29_local0, f29_local5 )
		end
	end
	return f29_local0
end

Cac.GetLethalStreakStats = function ( f30_arg0 )
	local f30_local0 = {}
	for f30_local1 = 0, Engine.TableGetRowCount( CSV.streaks.file ), 1 do
		local f30_local4 = CSV.ReadRow( CSV.streaks, f30_local1 )
		if f30_local4 ~= nil and f30_local4.streakType == "LETHAL" then
			local f30_local5 = {
				ref = f30_local4.ref,
				name = Engine.Localize( f30_local4.name ),
				desc = f30_local4.desc,
				image = f30_local4.smallImage,
				uses = Engine.GetPlayerDataEx( f30_arg0, CoD.StatsGroup.Ranked, "lethalScorestreakStats", f30_local4.ref, "uses" ),
				extraStat1 = Engine.GetPlayerDataEx( f30_arg0, CoD.StatsGroup.Ranked, "lethalScorestreakStats", f30_local4.ref, "extraStat1" ),
				killsPerUse = f30_local5.extraStat1 / (f30_local5.uses and f30_local5.uses or 1)
			}
			table.insert( f30_local0, f30_local5 )
		end
	end
	table.sort( f30_local0, function ( f31_arg0, f31_arg1 )
		return f31_arg1.extraStat1 < f31_arg0.extraStat1
	end )
	return f30_local0
end

Cac.GetSupportStreakStats = function ( f32_arg0 )
	local f32_local0 = {}
	for f32_local1 = 0, Engine.TableGetRowCount( CSV.streaks.file ), 1 do
		local f32_local4 = CSV.ReadRow( CSV.streaks, f32_local1 )
		if f32_local4 ~= nil and f32_local4.streakType == "SUPPORT" then
			local f32_local5 = f32_local4.extraRecordType
			local f32_local6 = {
				ref = f32_local4.ref,
				name = Engine.Localize( f32_local4.name ),
				desc = Engine.Localize( f32_local4.desc ),
				image = f32_local4.smallImage
			}
			local f32_local7
			if 0 < #f32_local5 then
				f32_local7 = Engine.Localize( f32_local5 )
				if not f32_local7 then
				
				else
					f32_local6.extraRecordType = f32_local7
					f32_local6.uses = Engine.GetPlayerDataEx( f32_arg0, CoD.StatsGroup.Ranked, "supportScorestreakStats", f32_local4.ref, "uses" )
					f32_local6.extraStat1 = Engine.GetPlayerDataEx( f32_arg0, CoD.StatsGroup.Ranked, "supportScorestreakStats", f32_local4.ref, "extraStat1" )
					table.insert( f32_local0, f32_local6 )
				end
			end
			f32_local7 = f32_local5
		end
	end
	table.sort( f32_local0, function ( f33_arg0, f33_arg1 )
		return f33_arg1.uses < f33_arg0.uses
	end )
	return f32_local0
end

