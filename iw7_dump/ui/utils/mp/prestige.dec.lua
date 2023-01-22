Prestige = {
	IsAtMaxPrestige = function ( f1_arg0 )
		local f1_local0 = DataSources.alwaysLoaded.MP
		if Engine.IsAliensMode() then
			f1_local0 = DataSources.alwaysLoaded.CP
		end
		return f1_local0.ranked.progression.prestige:GetValue( f1_arg0 ) >= Engine.GetDvarInt( "ui_prestige_levels" )
	end,
	CanActivate = function ( f2_arg0 )
		local f2_local0 = DataSources.alwaysLoaded.MP
		if Engine.IsAliensMode() then
			f2_local0 = DataSources.alwaysLoaded.CP
		end
		if Prestige.IsAtMaxPrestige( f2_arg0 ) then
			return false
		elseif f2_local0.ranked.progression.xp:GetValue( f2_arg0 ) < Rank.GetRankMaxXP( Rank.GetMaxRank() ) - 1 then
			return false
		else
			return true
		end
	end,
	DoPrestigeReset = function ( f3_arg0 )
		if not Prestige.CanActivate( f3_arg0 ) then
			return 
		end
		Lobby.ExecPrestigeReset( f3_arg0 )
		local f3_local0 = DataSources.alwaysLoaded.MP
		if Engine.IsAliensMode() then
			f3_local0 = DataSources.alwaysLoaded.CP
		end
		f3_local0.ranked.progression.xp:SetValue( f3_arg0, 0 )
		local f3_local1 = DataSources.alwaysLoaded.MP.ranked.progression.prestige:GetValue( f3_arg0 )
		local f3_local2 = f3_local1 + 1
		DataSources.alwaysLoaded.MP.ranked.progression.prestige:SetValue( f3_arg0, f3_local2 )
		Engine.TelemetryPrestige( f3_arg0, f3_local1, f3_local2 )
		local f3_local3 = Engine.TableLookupGetRowNum( CSV.callingCardUnlockTable.file, CSV.callingCardUnlockTable.cols.ref, "prestige" .. f3_local2 - 1 )
		if f3_local3 and f3_local3 >= 0 then
			Rewards.SetNew( f3_arg0, "callingCard", f3_local3, false )
		end
		Engine.ExecNow( "exec mp\\stats_init_prestige.cfg", f3_arg0 )
		Engine.ExecNow( "uploadstats", f3_arg0 )
	end,
	PositionUnlockCriteria = function ( f4_arg0, f4_arg1, f4_arg2 )
		local f4_local0 = f4_arg1:GetCurrentFont()
		local f4_local1, f4_local2, f4_local3, f4_local4 = f4_arg1:getLocalRect()
		local f4_local5, f4_local6, f4_local7, f4_local8 = GetTextDimensions( f4_arg0, f4_local0, math.abs( f4_local4 - f4_local2 ), 1300 * _1080p )
		local f4_local9 = math.max( 80, f4_local6 - f4_local8 + 130 * _1080p )
		local f4_local10 = 32 * _1080p
		f4_arg2:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1000, f4_local9, f4_local9 + f4_local10, 0 )
		return f4_local9, f4_local9 + f4_local10
	end,
	GetMaxPrestigeRank = function ()
		return Engine.GetDvarInt( "ui_weapon_prestige_levels" )
	end,
	CanActivateWeaponPrestige = function ( f6_arg0, f6_arg1 )
		if Engine.IsAliensMode() then
			return false
		else
			local f6_local0 = LUI.DataSourceFromPlayerData.new( CoD.StatsGroup.Common, CoD.PlayMode.Core )
			local f6_local1 = f6_local0.sharedProgression.weaponLevel[f6_arg0]
			if f6_local1.prestige:GetValue( f6_arg1 ) >= Prestige.GetMaxPrestigeRank() then
				return false
			elseif f6_local1.mpXP:GetValue( f6_arg1 ) + f6_local1.cpXP:GetValue( f6_arg1 ) < Cac.GetWeaponRankMaxXP( Cac.GetWeaponMaxRank( f6_arg0 ) ) then
				return false
			else
				return true
			end
		end
	end,
	GetPrestigeLevelString = function ( f7_arg0 )
		if f7_arg0 == Prestige.GetMaxPrestigeRank() then
			return ToUpperCase( Engine.Localize( "LUA_MENU_MAX" ) )
		else
			return tostring( f7_arg0 )
		end
	end,
	DoWeaponPrestigeReset = function ( f8_arg0, f8_arg1 )
		if not Prestige.CanActivateWeaponPrestige( f8_arg0, f8_arg1 ) then
			return 
		end
		local f8_local0 = LUI.DataSourceFromPlayerData.new( CoD.StatsGroup.Common, CoD.PlayMode.Core )
		local f8_local1 = LUI.DataSourceFromPlayerData.new( CoD.StatsGroup.RankedLoadouts, CoD.PlayMode.Core )
		local f8_local2 = LUI.DataSourceFromPlayerData.new( CoD.StatsGroup.Coop, CoD.PlayMode.Aliens )
		local f8_local3 = f8_local0.sharedProgression.weaponLevel[f8_arg0]
		f8_local3.mpXP:SetValue( f8_arg1, 0 )
		f8_local3.cpXP:SetValue( f8_arg1, 0 )
		f8_local3.prestige:SetValue( f8_arg1, f8_local3.prestige:GetValue( f8_arg1 ) + 1 )
		local f8_local4 = f8_local1.squadMembers.loadouts
		local f8_local5 = f8_local4:GetCountValue( f8_arg1 )
		for f8_local6 = 0, f8_local5 - 1, 1 do
			for f8_local9 = 0, 1, 1 do
				if f8_local4[f8_local6].weaponSetups[f8_local9].weapon:GetValue( f8_arg1 ) == f8_arg0 then
					local f8_local12 = f8_local4[f8_local6].weaponSetups[f8_local9].attachment
					local f8_local13 = f8_local12:GetCountValue( f8_arg1 )
					for f8_local14 = 0, f8_local13 - 1, 1 do
						f8_local12[f8_local14]:SetValue( f8_arg1, "none" )
					end
					f8_local4[f8_local6].weaponSetups[f8_local9].reticle:SetValue( f8_arg1, "none" )
				end
			end
		end
		local f8_local6 = f8_local2.zombiePlayerLoadout.zombiePlayerWeaponModels[f8_arg0]
		local f8_local7 = f8_local6.attachment:GetCountValue( f8_arg1 )
		for f8_local8 = 0, f8_local7 - 1, 1 do
			f8_local6.attachment[f8_local8]:SetValue( f8_arg1, "none" )
		end
		f8_local6.reticle:SetValue( f8_arg1, "none" )
		Engine.Exec( "uploadstats", f8_arg1 )
	end,
	GetPermanentUnlockTokenCount = function ( f9_arg0 )
		local f9_local0 = DataSources.alwaysLoaded.playerData.MP.ranked
		local f9_local1 = 0
		local f9_local2 = math.min( DataSources.alwaysLoaded.MP.ranked.progression.prestige:GetValue( f9_arg0 ), f9_local0.permanentUnlocks:GetCountValue( f9_arg0 ) )
		for f9_local3 = 0, f9_local2 - 1, 1 do
			if Engine.GetPlayerDataEx( f9_arg0, CoD.StatsGroup.Ranked, "permanentUnlocks", f9_local3, "item" ) ~= "" then
				f9_local1 = f9_local1 + 1
			end
		end
		return f9_local2 - f9_local1
	end,
	UsePermanentUnlockToken = function ( f10_arg0, f10_arg1, f10_arg2 )
		if not Prestige.IsItemUnlocked( f10_arg0, f10_arg1, f10_arg2 ) and Prestige.GetPermanentUnlockTokenCount( f10_arg0 ) > 0 then
			local f10_local0 = DataSources.alwaysLoaded.playerData.MP.ranked.permanentUnlocks:GetCountValue( f10_arg0 )
			for f10_local1 = 0, f10_local0 - 1, 1 do
				if Engine.GetPlayerDataEx( f10_arg0, CoD.StatsGroup.Ranked, "permanentUnlocks", f10_local1, "item" ) == "" then
					Engine.SetPlayerDataEx( f10_arg0, CoD.StatsGroup.Ranked, "permanentUnlocks", f10_local1, "category", f10_arg2 )
					Engine.SetPlayerDataEx( f10_arg0, CoD.StatsGroup.Ranked, "permanentUnlocks", f10_local1, "item", f10_arg1 )
					Engine.Exec( "uploadstats", f10_arg0 )
					Engine.InvalidatePermanentUnlockCache( f10_arg0 )
					return true
				end
			end
		end
		return false
	end,
	IsItemUnlocked = function ( f11_arg0, f11_arg1, f11_arg2 )
		local f11_local0 = DataSources.alwaysLoaded.playerData.MP.ranked.permanentUnlocks:GetCountValue( f11_arg0 )
		for f11_local1 = 0, f11_local0 - 1, 1 do
			if f11_arg2 == Engine.GetPlayerDataEx( f11_arg0, CoD.StatsGroup.Ranked, "permanentUnlocks", f11_local1, "category" ) and f11_arg1 == Engine.GetPlayerDataEx( f11_arg0, CoD.StatsGroup.Ranked, "permanentUnlocks", f11_local1, "item" ) then
				return true
			end
		end
		return false
	end,
	PermanentUnlockTokenSpendAction = function ( f12_arg0, f12_arg1, f12_arg2, f12_arg3, f12_arg4, f12_arg5 )
		local f12_local0 = Prestige.GetPermanentUnlockTokenCount( f12_arg0 )
		local f12_local1 = Prestige.IsItemUnlocked( f12_arg0, f12_arg1, f12_arg3 )
		if not f12_local1 then
			f12_local1 = tonumber( f12_arg4 ) == 0
		end
		local f12_local2 = {
			itemName = f12_arg2,
			itemRef = f12_arg1,
			itemUnlockLevel = f12_arg4,
			controllerIndex = f12_arg0
		}
		if f12_local1 then
			LUI.FlowManager.RequestPopupMenu( nil, "PermanentUnlockAlreadyUnlockedPopup", true, f12_arg0, false, f12_local2 )
			return 
		elseif f12_local0 <= 0 then
			LUI.FlowManager.RequestPopupMenu( nil, "PermanentUnlockNotEnoughTokensPopup", true, f12_arg0, false, f12_local2 )
			return 
		else
			f12_local2.confirmAction = function ()
				f12_arg5()
				f12_local2.tokens = Prestige.GetPermanentUnlockTokenCount( f12_arg0 )
				LUI.FlowManager.RequestPopupMenu( nil, "PermanentUnlockCongratulationsPopup", true, f12_arg0, false, f12_local2 )
			end
			
			LUI.FlowManager.RequestPopupMenu( nil, "PermanentUnlockEnterPopup", true, f12_arg0, false, f12_local2 )
		end
	end
}
local f0_local0 = 5
local f0_local1 = "classicWeapon"
Prestige.GetClassicWeaponUnlockTokenCount = function ( f14_arg0 )
	local f14_local0 = CoD.GetCommonPlayerDataDataSource()
	local f14_local1 = 0
	for f14_local2 = 0, f0_local0 - 1, 1 do
		if Engine.IsUnlocked( f14_arg0, "feature", f0_local1 .. f14_local2 ) then
			f14_local1 = f14_local1 + 1
		end
	end
	local f14_local2 = Engine.TableGetRowCount( CSV.classicWeapons.file )
	local f14_local3 = f14_local0.sharedProgression.classicWeapons
	local f14_local4 = 0
	for f14_local5 = 0, f14_local2 - 1, 1 do
		if f14_local3[Engine.TableLookupByRow( CSV.classicWeapons.file, f14_local5, CSV.classicWeapons.cols.weaponRef )]:GetValue( f14_arg0 ) == 1 then
			f14_local4 = f14_local4 + 1
		end
	end
	return math.max( f14_local1 - f14_local4, 0 )
end

Prestige.GetPrestigeRewards = function ( f15_arg0 )
	local f15_local0 = {}
	local f15_local1 = Engine.TableGetRowCount( CSV.prestigeRewards.file )
	for f15_local2 = 0, f15_local1 - 1, 1 do
		if tonumber( Engine.TableLookupByRow( CSV.prestigeRewards.file, f15_local2, CSV.prestigeRewards.cols.prestigeLevel ) ) == f15_arg0 then
			table.insert( f15_local0, CSV.ReadRow( CSV.prestigeRewards, f15_local2 ) )
		end
	end
	return f15_local0
end

