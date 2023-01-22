local f0_local0 = function ( f1_arg0, f1_arg1 )
	return math.max( math.min( f1_arg0, 4 ) - 1, 0 )
end

local f0_local1 = function ( f2_arg0, f2_arg1 )
	return math.min( f2_arg0, 4 )
end

local f0_local2 = function ( f3_arg0, f3_arg1 )
	if Engine.IsBitSet( f3_arg0, 1 ) then
		return 1
	else
		return 0
	end
end

local f0_local3 = function ( f4_arg0, f4_arg1 )
	if Engine.IsBitSet( f4_arg0, 2 ) then
		return 1
	else
		return 0
	end
end

local f0_local4 = function ( f5_arg0, f5_arg1 )
	if Engine.IsBitSet( f5_arg0, 3 ) then
		return 1
	else
		return 0
	end
end

local f0_local5 = function ( f6_arg0, f6_arg1 )
	if f6_arg0 == 1 then
		return "cp_hud_sentry_trap"
	elseif f6_arg0 == 2 then
		return "cp_hud_fireworks_trap"
	elseif f6_arg0 == 3 then
		return "cp_hud_medusa_trap"
	elseif f6_arg0 == 4 then
		return "cp_hud_electric_trap"
	elseif f6_arg0 == 5 then
		return "cp_hud_boombox_trap"
	elseif f6_arg0 == 6 then
		return "cp_hud_revocator_trap"
	elseif f6_arg0 == 7 then
		return "cp_hud_kindlepops_trap"
	elseif f6_arg0 == 8 then
		return "cp_hud_lazer_trap"
	elseif f6_arg0 == 9 then
		return "cp_hud_helium_trap"
	elseif f6_arg0 == 10 then
		return "cp_hud_mower_trap"
	elseif f6_arg0 == 11 then
		return "cp_hud_lavalamp_trap"
	elseif f6_arg0 == 12 then
		return "cp_hud_robot_trap"
	elseif f6_arg0 == 13 then
		return "cp_hud_zombgone_trap"
	elseif f6_arg0 == 14 then
		return "cp_town_crafted_hypnosis"
	elseif f6_arg0 == 15 then
		return "cp_town_crafted_mindcontrol"
	elseif f6_arg0 == 16 then
		return "cp_town_crafted_radiation"
	elseif f6_arg0 == 17 then
		return "cp_town_crafted_seismic"
	elseif f6_arg0 == 18 then
		return "cp_town_crafted_xray"
	elseif f6_arg0 == 19 then
		return "cp_final_entangler_hud"
	else
		
	end
end

local f0_local6 = function ( f7_arg0, f7_arg1 )
	local f7_local0 = ""
	if f7_arg0 == 1 then
		return "chlorination"
	elseif f7_arg0 == 2 then
		return "bromination"
	elseif f7_arg0 == 3 then
		return "solvolysis"
	elseif f7_arg0 == 4 then
		return "azides"
	elseif f7_arg0 == 5 then
		return "alkenes"
	elseif f7_arg0 == 6 then
		return "hydrogenation"
	elseif f7_arg0 == 7 then
		return "oxidation"
	elseif f7_arg0 == 8 then
		return "reduction"
	elseif f7_arg0 == 9 then
		return "ethers"
	elseif f7_arg0 == 10 then
		return "ethyl"
	elseif f7_arg0 == 11 then
		return "aldehydes"
	elseif f7_arg0 == 12 then
		return "benzene"
	elseif f7_arg0 == 13 then
		return "nitriles"
	elseif f7_arg0 == 14 then
		return "bro"
	elseif f7_arg0 == 15 then
		return "allomer"
	elseif f7_arg0 == 16 then
		return "neutrino"
	elseif f7_arg0 == 17 then
		return "sublimation"
	elseif f7_arg0 == 18 then
		return "zwitterion"
	else
		
	end
end

local f0_local7 = function ( f8_arg0, f8_arg1 )
	if f8_arg0 then
		if f8_arg0 == 0 then
			return 0
		else
			return 1
		end
	else
		
	end
end

local f0_local8 = function ( f9_arg0, f9_arg1 )
	if f9_arg0 then
		if f9_arg0 == 0 or f9_arg0 == 1 then
			return 0
		else
			return 1
		end
	else
		
	end
end

local f0_local9 = function ( f10_arg0, f10_arg1 )
	if f10_arg0 then
		if f10_arg0 == 1 then
			return 1
		else
			return 0
		end
	else
		
	end
end

local f0_local10 = function ( f11_arg0, f11_arg1 )
	if f11_arg0 then
		if f11_arg0 == 0 then
			return ""
		else
			return Engine.Localize( Engine.TableLookup( CSV.zmbEscapeCombos.File, CSV.zmbEscapeCombos.Cols.Index, f11_arg0, CSV.zmbEscapeCombos.Cols.Text ) )
		end
	else
		
	end
end

local f0_local11 = function ( f12_arg0, f12_arg1 )
	if f12_arg0 and -1 < f12_arg0 then
		return Engine.Localize( Engine.TableLookup( CSV.zombiePlayerImage.File, CSV.zombiePlayerImage.Cols.Idx, f12_arg0, CSV.zombiePlayerImage.Cols.Name ) )
	else
		return ""
	end
end

local f0_local12 = function ( f13_arg0, f13_arg1 )
	if f13_arg0 and -1 < f13_arg0 then
		return Engine.TableLookup( CSV.zombiePlayerImage.File, CSV.zombiePlayerImage.Cols.Idx, f13_arg0, CSV.zombiePlayerImage.Cols.Icon )
	else
		return ""
	end
end

local f0_local13 = function ( f14_arg0, f14_arg1 )
	if f14_arg0 then
		if f14_arg0 == 0 then
			return ""
		else
			return Engine.TableLookup( CSV.zombieChallengeTable.File, CSV.zombieChallengeTable.Cols.Index, f14_arg0, CSV.zombieChallengeTable.Cols.StrActivate )
		end
	else
		
	end
end

local f0_local14 = function ( f15_arg0, f15_arg1 )
	if f15_arg0 then
		if f15_arg0 == 0 then
			return ""
		else
			return Engine.Localize( Engine.TableLookup( CSV.zombieChallengeTable.File, CSV.zombieChallengeTable.Cols.Index, f15_arg0, CSV.zombieChallengeTable.Cols.StrComplete ) )
		end
	else
		
	end
end

local f0_local15 = function ( f16_arg0, f16_arg1 )
	if f16_arg0 then
		if f16_arg0 == 0 then
			return ""
		else
			return Engine.Localize( Engine.TableLookup( CSV.zombieChallengeTable.File, CSV.zombieChallengeTable.Cols.Index, f16_arg0, CSV.zombieChallengeTable.Cols.StrFail ) )
		end
	else
		
	end
end

local f0_local16 = function ( f17_arg0, f17_arg1 )
	if f17_arg0 then
		if f17_arg0 == 0 then
			return ""
		else
			return Engine.TableLookup( CSV.zombieChallengeTable.File, CSV.zombieChallengeTable.Cols.Index, f17_arg0, CSV.zombieChallengeTable.Cols.Icon )
		end
	else
		
	end
end

local f0_local17 = function ( f18_arg0, f18_arg1 )
	if f18_arg0 then
		if f18_arg0 == 0 then
			return ""
		else
			return Engine.TableLookup( CSV.zombieChallengeTable.File, CSV.zombieChallengeTable.Cols.Index, f18_arg0, CSV.zombieChallengeTable.Cols.UpgradeIcon )
		end
	else
		
	end
end

local f0_local18 = function ( f19_arg0, f19_arg1 )
	if f19_arg0 then
		if f19_arg0 == 0 then
			return ""
		else
			return Engine.Localize( Engine.TableLookup( CSV.zombieChallengeTable.File, CSV.zombieChallengeTable.Cols.Index, f19_arg0, CSV.zombieChallengeTable.Cols.UpgradeText ) )
		end
	else
		
	end
end

local f0_local19 = function ( f20_arg0, f20_arg1 )
	if f20_arg0 then
		if f20_arg0 == 0 then
			return ""
		else
			return Engine.TableLookup( CSV.zombieChallengeTable.File, CSV.zombieChallengeTable.Cols.Index, f20_arg0, CSV.zombieChallengeTable.Cols.SplashStyleIcon )
		end
	else
		
	end
end

local f0_local20 = function ( f21_arg0, f21_arg1 )
	if f21_arg0 then
		if f21_arg0 == 0 then
			return ""
		else
			return Engine.TableLookup( CSV.zombieChallengeTable.File, CSV.zombieChallengeTable.Cols.Index, f21_arg0, CSV.zombieChallengeTable.Cols.Type )
		end
	else
		
	end
end

local f0_local21 = function ( f22_arg0, f22_arg1 )
	if f22_arg0 then
		if f22_arg0 == 0 then
			return "0%"
		else
			return tostring( math.floor( f22_arg0 / Game.GetOmnvar( "ui_intel_progress_max" ) * 100 ) ) .. "%"
		end
	else
		
	end
end

local f0_local22 = function ( f23_arg0, f23_arg1 )
	if f23_arg0 then
		if f23_arg0 == 0 then
			return 0
		else
			return f23_arg0 / Game.GetOmnvar( "ui_intel_progress_max" )
		end
	else
		
	end
end

local f0_local23 = function ( f24_arg0, f24_arg1 )
	local f24_local0 = Game.GetOmnvar( "ui_intel_progress_max" )
	if f24_arg0 then
		if f24_arg0 == 0 then
			return tostring( f24_local0 )
		else
			return tostring( f24_local0 - f24_arg0 )
		end
	else
		
	end
end

local f0_local24 = function ( f25_arg0, f25_arg1 )
	if f25_arg0 then
		if f25_arg0 == 0 then
			return ""
		else
			return Engine.Localize( Engine.TableLookup( CSV.zombieTutorialTable.file, CSV.zombieTutorialTable.cols.bit, f25_arg0, CSV.zombieTutorialTable.cols.text ) )
		end
	else
		
	end
end

local f0_local25 = function ( f26_arg0, f26_arg1 )
	if f26_arg0 then
		if f26_arg0 == 0 then
			return ""
		else
			return Engine.Localize( Engine.TableLookup( CSV.zombieTutorialTable.file, CSV.zombieTutorialTable.cols.bit, f26_arg0, CSV.zombieTutorialTable.cols.title ) )
		end
	else
		
	end
end

local f0_local26 = function ( f27_arg0, f27_arg1 )
	if f27_arg0 then
		if f27_arg0 == 0 then
			return ""
		else
			return Engine.TableLookup( CSV.zombieTutorialTable.file, CSV.zombieTutorialTable.cols.bit, f27_arg0, CSV.zombieTutorialTable.cols.image )
		end
	else
		
	end
end

local f0_local27 = function ( f28_arg0 )
	return function ( f29_arg0, f29_arg1 )
		if Engine.IsBitSet( f29_arg0, f28_arg0 ) then
			return 1
		else
			return 0
		end
	end
	
end

local f0_local28 = function ( f30_arg0 )
	return function ( f31_arg0, f31_arg1 )
		if Engine.IsBitSet( f31_arg0, f30_arg0 ) then
			return 0
		else
			return 1
		end
	end
	
end

local f0_local29 = function ( f32_arg0, f32_arg1 )
	if f32_arg0 then
		if f32_arg0 <= 0 then
			return 0
		elseif f32_arg0 == 1 then
			return 1
		else
			return 0
		end
	else
		
	end
end

local f0_local30 = function ( f33_arg0, f33_arg1 )
	if f33_arg0 then
		if f33_arg0 == 4 then
			return 0
		elseif f33_arg0 == 5 then
			return 1
		else
			return 0
		end
	else
		
	end
end

local f0_local31 = function ( f34_arg0, f34_arg1 )
	if f34_arg0 then
		if f34_arg0 == 2 then
			return 0
		elseif f34_arg0 == 3 then
			return 1
		else
			return 0
		end
	else
		
	end
end

local f0_local32 = function ( f35_arg0, f35_arg1 )
	if f35_arg0 then
		if f35_arg0 == 0 then
			return "specialty_ks_null"
		else
			return Engine.TableLookup( CSV.zombieSouvenirPieceInfo.File, CSV.zombieSouvenirPieceInfo.Cols.Idx, tostring( f35_arg0 ), CSV.zombieSouvenirPieceInfo.Cols.Icon )
		end
	else
		
	end
end

local f0_local33 = function ( f36_arg0, f36_arg1 )
	if f36_arg0 then
		if f36_arg0 == 0 then
			return 0
		else
			return 1
		end
	else
		
	end
end

local f0_local34 = function ( f37_arg0, f37_arg1 )
	if f37_arg0 then
		if f37_arg0 == 0 then
			return 0
		else
			return 1
		end
	else
		
	end
end

local f0_local35 = function ( f38_arg0, f38_arg1 )
	if f38_arg0 then
		if f38_arg0 == 0 then
			return 0
		else
			return 1
		end
	else
		
	end
end

local f0_local36 = function ( f39_arg0, f39_arg1 )
	if f39_arg0 then
		if f39_arg0 == 0 then
			return ""
		else
			return Engine.Localize( Engine.TableLookup( CSV.zombieConsumableItems.File, CSV.zombieConsumableItems.Cols.LootID, tostring( f39_arg0 ), CSV.zombieConsumableItems.Cols.Name ) )
		end
	else
		
	end
end

local f0_local37 = function ( f40_arg0, f40_arg1 )
	if f40_arg0 then
		if f40_arg0 == 0 then
			return ""
		else
			return Engine.TableLookup( CSV.zombieConsumableItems.File, CSV.zombieConsumableItems.Cols.LootID, tostring( f40_arg0 ), CSV.zombieConsumableItems.Cols.Icon )
		end
	else
		
	end
end

local f0_local38 = function ( f41_arg0, f41_arg1 )
	if f41_arg0 then
		if f41_arg0 == 0 then
			return 0
		else
			return 1
		end
	else
		
	end
end

local f0_local39 = function ( f42_arg0, f42_arg1 )
	if f42_arg0 then
		if f42_arg0 == 0 then
			return ""
		else
			return Engine.Localize( Engine.TableLookup( CSV.zombieConsumableItems.File, CSV.zombieConsumableItems.Cols.LootID, tostring( f42_arg0 ), CSV.zombieConsumableItems.Cols.Desc ) )
		end
	else
		
	end
end

local f0_local40 = function ( f43_arg0, f43_arg1 )
	if f43_arg0 then
		if f43_arg0 == 0 then
			return ""
		end
		local f43_local0 = Engine.TableLookup( CSV.zombieConsumableItems.File, CSV.zombieConsumableItems.Cols.LootID, tostring( f43_arg0 ), CSV.zombieConsumableItems.Cols.Type )
		if f43_local0 == "wave" then
			return Engine.Localize( "ZM_CONSUMABLES_WAVES" )
		elseif f43_local0 == "timedactivations" then
			return Engine.Localize( "ZM_CONSUMABLES_SECONDS" )
		elseif f43_local0 == "triggerpassive" then
			return Engine.Localize( "ZM_CONSUMABLES_USES" )
		elseif f43_local0 == "triggeronce" then
			return Engine.Localize( "ZM_CONSUMABLES_USE" )
		elseif f43_local0 == "triggerwait" then
			return Engine.Localize( "ZM_CONSUMABLES_USE" )
		elseif f43_local0 == "triggernow" then
			return Engine.Localize( "ZM_CONSUMABLES_USE" )
		end
	end
end

local f0_local41 = function ( f44_arg0, f44_arg1 )
	if f44_arg0 then
		if f44_arg0 == 0 then
			return ""
		else
			return tostring( Engine.TableLookup( CSV.zombieConsumableItems.File, CSV.zombieConsumableItems.Cols.LootID, tostring( f44_arg0 ), CSV.zombieConsumableItems.Cols.Uses ) )
		end
	else
		
	end
end

local f0_local42 = function ( f45_arg0, f45_arg1 )
	if f45_arg0 then
		if f45_arg0 == 0 then
			return ""
		else
			local f45_local0 = Engine.TableLookup( CSV.zombieConsumableItems.File, CSV.zombieConsumableItems.Cols.LootID, tostring( f45_arg0 ), CSV.zombieConsumableItems.Cols.Time )
			local f45_local1 = Engine.TableLookup( CSV.zombieConsumableItems.File, CSV.zombieConsumableItems.Cols.LootID, tostring( f45_arg0 ), CSV.zombieConsumableItems.Cols.PassiveUses )
			if f45_local0 ~= "0" then
				return f45_local0
			else
				return f45_local1
			end
		end
	else
		
	end
end

local f0_local43 = function ( f46_arg0, f46_arg1 )
	if f46_arg0 then
		if f46_arg0 == 0 then
			return 0
		else
			return 1
		end
	else
		
	end
end

local f0_local44 = function ( f47_arg0, f47_arg1 )
	if f47_arg0 then
		if f47_arg0 < 0 then
			return nil
		else
			return Engine.TableLookup( CSV.zombieConsumableItems.File, CSV.zombieConsumableItems.Cols.Ref, Engine.GetPlayerDataEx( f47_arg1, CoD.StatsGroup.Coop, "zombiePlayerLoadout", "zombie_consumables", f47_arg0 ), CSV.zombieConsumableItems.Cols.Icon )
		end
	else
		
	end
end

local f0_local45 = function ( f48_arg0, f48_arg1 )
	if f48_arg0 then
		if f48_arg0 < 0 then
			return nil
		else
			local f48_local0 = ""
			return Engine.TableLookup( CSV.zombieConsumableItems.File, CSV.zombieConsumableItems.Cols.Ref, Engine.GetPlayerDataEx( f48_arg1, CoD.StatsGroup.Coop, "zombiePlayerLoadout", "zombie_consumables", f48_arg0 ), CSV.zombieConsumableItems.Cols.Icon )
		end
	else
		
	end
end

local f0_local46 = function ( f49_arg0, f49_arg1 )
	if f49_arg0 then
		if f49_arg0 < 0 then
			return nil
		else
			return Engine.TableLookup( CSV.zombieConsumableItems.File, CSV.zombieConsumableItems.Cols.Ref, Engine.GetPlayerDataEx( f49_arg1, CoD.StatsGroup.Coop, "zombiePlayerLoadout", "zombie_consumables", f49_arg0 ), CSV.zombieConsumableItems.Cols.CardBacking )
		end
	else
		
	end
end

local f0_local47 = function ( f50_arg0, f50_arg1 )
	if f50_arg0 then
		if f50_arg0 < 0 then
			return nil
		else
			return Engine.TableLookup( CSV.zombieConsumableItems.File, CSV.zombieConsumableItems.Cols.Ref, Engine.GetPlayerDataEx( f50_arg1, CoD.StatsGroup.Coop, "zombiePlayerLoadout", "zombie_consumables", f50_arg0 ), CSV.zombieConsumableItems.Cols.CardRarity )
		end
	else
		
	end
end

local f0_local48 = function ( f51_arg0, f51_arg1 )
	if f51_arg0 then
		if f51_arg0 < 0 then
			return ""
		end
		local f51_local0 = ""
		local f51_local1 = Engine.GetPlayerDataEx( f51_arg1, CoD.StatsGroup.Coop, "zombiePlayerLoadout", "zombie_consumables", f51_arg0 )
		if f51_local1 == "irish_luck" then
			f51_local0 = Engine.TableLookup( CSV.zombieConsumableItems.File, CSV.zombieConsumableItems.Cols.LootID, Game.GetOmnvar( "zm_ui_irish_luck" ), CSV.zombieConsumableItems.Cols.Name )
		else
			f51_local0 = Engine.TableLookup( CSV.zombieConsumableItems.File, CSV.zombieConsumableItems.Cols.Ref, f51_local1, CSV.zombieConsumableItems.Cols.Name )
		end
		return Engine.Localize( f51_local0 )
	else
		
	end
end

local f0_local49 = function ( f52_arg0, f52_arg1 )
	if f52_arg0 then
		if f52_arg0 < 0 then
			return ""
		else
			return Engine.Localize( Engine.TableLookup( CSV.zombieConsumableItems.File, CSV.zombieConsumableItems.Cols.Ref, Engine.GetPlayerDataEx( f52_arg1, CoD.StatsGroup.Coop, "zombiePlayerLoadout", "zombie_consumables", f52_arg0 ), CSV.zombieConsumableItems.Cols.Name ) )
		end
	else
		
	end
end

local f0_local50 = function ( f53_arg0, f53_arg1 )
	if f53_arg0 then
		if f53_arg0 < 0 then
			return ""
		else
			return Engine.Localize( Engine.TableLookup( CSV.zombieConsumableItems.File, CSV.zombieConsumableItems.Cols.Ref, Engine.GetPlayerDataEx( f53_arg1, CoD.StatsGroup.Coop, "zombiePlayerLoadout", "zombie_consumables", f53_arg0 ), CSV.zombieConsumableItems.Cols.Desc ) )
		end
	else
		
	end
end

local f0_local51 = function ( f54_arg0, f54_arg1 )
	if f54_arg0 then
		if f54_arg0 < 0 then
			return ""
		end
		local f54_local0 = ""
		local f54_local1 = Engine.GetPlayerDataEx( f54_arg1, CoD.StatsGroup.Coop, "zombiePlayerLoadout", "zombie_consumables", f54_arg0 )
		if f54_local1 == "irish_luck" then
			f54_local0 = Engine.TableLookup( CSV.zombieConsumableItems.File, CSV.zombieConsumableItems.Cols.LootID, Game.GetOmnvar( "zm_ui_irish_luck" ), CSV.zombieConsumableItems.Cols.Desc )
		else
			f54_local0 = Engine.TableLookup( CSV.zombieConsumableItems.File, CSV.zombieConsumableItems.Cols.Ref, f54_local1, CSV.zombieConsumableItems.Cols.Desc )
		end
		return Engine.Localize( f54_local0 )
	else
		
	end
end

local f0_local52 = function ( f55_arg0 )
	return function ( f56_arg0, f56_arg1 )
		if Engine.IsBitSet( f56_arg0, f55_arg0 ) then
			return 1
		else
			return 0.1
		end
	end
	
end

local f0_local53 = function ( f57_arg0, f57_arg1 )
	if f57_arg0 then
		if f57_arg0 <= 0.01 then
			return 0
		else
			return 1
		end
	else
		
	end
end

local f0_local54 = function ( f58_arg0, f58_arg1 )
	if f58_arg0 then
		if f58_arg0 <= 1 then
			return 0
		else
			return 1
		end
	else
		
	end
end

local f0_local55 = function ( f59_arg0, f59_arg1 )
	if f59_arg0 then
		return Engine.TableLookup( CSV.zombieConsumableItems.File, CSV.zombieConsumableItems.Cols.Ref, f59_arg0, CSV.zombieConsumableItems.Cols.Icon )
	else
		
	end
end

local f0_local56 = function ( f60_arg0, f60_arg1 )
	if f60_arg0 then
		return Engine.TableLookup( CSV.zombieConsumableItems.File, CSV.zombieConsumableItems.Cols.Ref, f60_arg0, CSV.zombieConsumableItems.Cols.CardBacking )
	else
		
	end
end

local f0_local57 = function ( f61_arg0, f61_arg1 )
	if f61_arg0 then
		return Engine.TableLookup( CSV.zombieConsumableItems.File, CSV.zombieConsumableItems.Cols.Ref, f61_arg0, CSV.zombieConsumableItems.Cols.CardRarity )
	else
		
	end
end

local f0_local58 = function ( f62_arg0, f62_arg1 )
	local f62_local0 = ""
	if f62_arg0 then
		if f62_arg0 == "irish_luck" then
			local f62_local1 = Game.GetOmnvar( "zm_ui_irish_luck" )
			if f62_local1 == -1 then
				f62_local0 = Engine.TableLookup( CSV.zombieConsumableItems.File, CSV.zombieConsumableItems.Cols.Ref, f62_arg0, CSV.zombieConsumableItems.Cols.Name )
			else
				f62_local0 = Engine.TableLookup( CSV.zombieConsumableItems.File, CSV.zombieConsumableItems.Cols.LootID, f62_local1, CSV.zombieConsumableItems.Cols.Name )
			end
		else
			f62_local0 = Engine.TableLookup( CSV.zombieConsumableItems.File, CSV.zombieConsumableItems.Cols.Ref, f62_arg0, CSV.zombieConsumableItems.Cols.Name )
		end
		return Engine.Localize( f62_local0 )
	else
		
	end
end

local f0_local59 = function ( f63_arg0, f63_arg1 )
	local f63_local0 = ""
	if f63_arg0 then
		if f63_arg0 == "irish_luck" then
			local f63_local1 = Game.GetOmnvar( "zm_ui_irish_luck" )
			if f63_local1 == -1 then
				f63_local0 = Engine.TableLookup( CSV.zombieConsumableItems.File, CSV.zombieConsumableItems.Cols.Ref, f63_arg0, CSV.zombieConsumableItems.Cols.Desc )
			else
				f63_local0 = Engine.TableLookup( CSV.zombieConsumableItems.File, CSV.zombieConsumableItems.Cols.LootID, f63_local1, CSV.zombieConsumableItems.Cols.Desc )
			end
		else
			f63_local0 = Engine.TableLookup( CSV.zombieConsumableItems.File, CSV.zombieConsumableItems.Cols.Ref, f63_arg0, CSV.zombieConsumableItems.Cols.Desc )
		end
		return Engine.Localize( f63_local0 )
	else
		
	end
end

local f0_local60 = function ( f64_arg0, f64_arg1 )
	if f64_arg0 then
		if f64_arg0 == 1 then
			return 1
		else
			return 0
		end
	else
		
	end
end

local f0_local61 = function ( f65_arg0, f65_arg1 )
	if f65_arg0 then
		if f65_arg0 == 0 then
			return 1
		else
			return 0
		end
	else
		
	end
end

local f0_local62 = function ( f66_arg0, f66_arg1 )
	if f66_arg0 then
		if f66_arg0 == 1 then
			return 1
		else
			return 0
		end
	else
		
	end
end

local f0_local63 = function ( f67_arg0, f67_arg1 )
	if f67_arg0 then
		if f67_arg0 == 2 then
			return 1
		else
			return 0
		end
	else
		
	end
end

local f0_local64 = function ( f68_arg0, f68_arg1 )
	if f68_arg0 then
		if f68_arg0 == 3 then
			return 1
		else
			return 0
		end
	else
		
	end
end

local f0_local65 = function ( f69_arg0, f69_arg1 )
	if f69_arg0 then
		if f69_arg0 == 4 then
			return 1
		else
			return 0
		end
	else
		
	end
end

local f0_local66 = function ( f70_arg0, f70_arg1 )
	if f70_arg0 then
		if f70_arg0 == 5 then
			return 1
		else
			return 0
		end
	else
		
	end
end

local f0_local67 = function ( f71_arg0, f71_arg1 )
	if f71_arg0 then
		if f71_arg0 == 6 then
			return 1
		else
			return 0
		end
	else
		
	end
end

local f0_local68 = function ( f72_arg0 )
	if f72_arg0 then
		if 0 < f72_arg0 then
			return 1
		else
			return 0
		end
	else
		
	end
end

local f0_local69 = function ( f73_arg0, f73_arg1 )
	if f73_arg0 ~= -1 then
		return Game.GetPlayerName( f73_arg0 )
	else
		
	end
end

local f0_local70 = function ( f74_arg0, f74_arg1 )
	if f74_arg0 then
		if f74_arg0 == -1 then
			return 0
		else
			return 1
		end
	else
		
	end
end

local f0_local71 = function ( f75_arg0, f75_arg1 )
	if f75_arg0 then
		if 0 < f75_arg0 then
			return 1
		else
			return 0
		end
	else
		
	end
end

local f0_local72 = function ( f76_arg0, f76_arg1 )
	if f76_arg0 then
		if 1 < f76_arg0 then
			return 1
		else
			return 0
		end
	else
		
	end
end

local f0_local73 = function ( f77_arg0, f77_arg1 )
	if f77_arg0 then
		if 2 < f77_arg0 then
			return 1
		else
			return 0
		end
	else
		
	end
end

local f0_local74 = function ( f78_arg0, f78_arg1 )
	if f78_arg0 then
		if 0 < f78_arg0 then
			return 1
		else
			return 0
		end
	else
		
	end
end

local f0_local75 = function ( f79_arg0, f79_arg1 )
	if f79_arg0 then
		if 0 < f79_arg0 then
			return 0
		else
			return 1
		end
	else
		
	end
end

local f0_local76 = function ( f80_arg0, f80_arg1 )
	if f80_arg0 then
		if f80_arg0 == 1 then
			return 1
		else
			return 0
		end
	else
		
	end
end

local f0_local77 = function ( f81_arg0, f81_arg1 )
	if f81_arg0 then
		if f81_arg0 == 2 then
			return 1
		else
			return 0
		end
	else
		
	end
end

local f0_local78 = function ( f82_arg0, f82_arg1 )
	if f82_arg0 then
		if f82_arg0 == 3 then
			return 1
		else
			return 0
		end
	else
		
	end
end

local f0_local79 = function ( f83_arg0, f83_arg1 )
	if f83_arg0 then
		if f83_arg0 == 4 then
			return 1
		else
			return 0
		end
	else
		
	end
end

local f0_local80 = function ( f84_arg0, f84_arg1 )
	if f84_arg0 then
		if f84_arg0 == 1 then
			return 1
		else
			return 0
		end
	else
		
	end
end

local f0_local81 = function ( f85_arg0, f85_arg1 )
	if f85_arg0 then
		if f85_arg0 == 2 then
			return 1
		else
			return 0
		end
	else
		
	end
end

local f0_local82 = function ( f86_arg0, f86_arg1 )
	local f86_local0 = 0
	for f86_local1 = 0, 4, 1 do
		if Engine.IsBitSet( f86_arg0, f86_local1 ) then
			f86_local0 = f86_local0 + 1
		end
	end
	return f86_local0
end

local f0_local83 = function ( f87_arg0, f87_arg1 )
	local f87_local0 = 0
	for f87_local1 = 0, 31, 1 do
		if Engine.IsBitSet( f87_arg0, f87_local1 ) then
			f87_local0 = f87_local0 + 1
		end
	end
	return f87_local0
end

local f0_local84 = function ( f88_arg0, f88_arg1 )
	local f88_local0 = 0
	for f88_local1 = 0, 31, 1 do
		if Engine.IsBitSet( f88_arg0, f88_local1 ) then
			f88_local0 = f88_local0 + 1
		end
	end
	return f88_local0
end

local f0_local85 = function ( f89_arg0, f89_arg1 )
	if f89_arg0 then
		if f89_arg0 == 0 then
			return ""
		else
			return Engine.TableLookup( CSV.zombiePowerUpTable.File, CSV.zombiePowerUpTable.Cols.Bit, f89_arg0, CSV.zombiePowerUpTable.Cols.Icon )
		end
	else
		
	end
end

local f0_local86 = function ( f90_arg0, f90_arg1 )
	if f90_arg0 then
		if f90_arg0 == 0 then
			return ""
		else
			return Engine.Localize( Engine.TableLookup( CSV.zombiePowerUpTable.File, CSV.zombiePowerUpTable.Cols.Bit, f90_arg0, CSV.zombiePowerUpTable.Cols.Name ) )
		end
	else
		
	end
end

local f0_local87 = function ( f91_arg0, f91_arg1 )
	if f91_arg0 then
		if f91_arg0 < 0 then
			return -1
		elseif f91_arg0 == 0 then
			return 0
		elseif 0 < f91_arg0 and f91_arg0 < 2 then
			return 1
		elseif f91_arg0 == 2 then
			return 2
		else
			return f91_arg0
		end
	else
		
	end
end

local f0_local88 = function ( f92_arg0, f92_arg1 )
	return tostring( f92_arg0 )
end

local f0_local89 = function ( f93_arg0, f93_arg1 )
	return Engine.TableLookup( CSV.zombiePerksTable.File, CSV.zombiePerksTable.Cols.Bit, f93_arg0, CSV.zombiePerksTable.Cols.Icon )
end

local f0_local90 = function ( f94_arg0, f94_arg1 )
	if f94_arg0 == 0 or 0 < Game.GetOmnvar( "zm_boss_timer" ) then
		return false
	else
		return true
	end
end

local f0_local91 = function ( f95_arg0, f95_arg1 )
	if f95_arg0 then
		if f95_arg0 < 0 then
			return false
		else
			return true
		end
	else
		
	end
end

local f0_local92 = function ( f96_arg0, f96_arg1 )
	if f96_arg0 == 0 then
		return false
	else
		return true
	end
end

local f0_local93 = function ( f97_arg0, f97_arg1 )
	if f97_arg0 then
		if f97_arg0 == -1 then
			return ""
		else
			return Engine.TableLookup( CSV.spacelandSongs.File, CSV.spacelandSongs.Cols.Index, f97_arg0, CSV.spacelandSongs.Cols.Title )
		end
	else
		
	end
end

local f0_local94 = function ( f98_arg0, f98_arg1 )
	if f98_arg0 then
		if f98_arg0 == -1 then
			return ""
		else
			return Engine.TableLookup( CSV.spacelandSongs.File, CSV.spacelandSongs.Cols.Index, f98_arg0, CSV.spacelandSongs.Cols.Artist )
		end
	else
		
	end
end

local f0_local95 = function ( f99_arg0, f99_arg1 )
	local f99_local0 = math.floor( f99_arg0 / 3600 )
	if f99_local0 > 0 then
		local f99_local1 = math.floor( f99_arg0 / 60 - f99_local0 * 60 )
		return Engine.Localize( "LUA_MENU_ZM_TIME_SURVIVED_HOURS_NOMAP", string.format( "%.2d", f99_local0 ), string.format( "%.2d", f99_local1 ), string.format( "%.2d", f99_arg0 - f99_local0 * 60 * 60 - f99_local1 * 60 ) )
	else
		local f99_local1 = math.floor( f99_arg0 / 60 )
		return Engine.Localize( "LUA_MENU_ZM_TIME_SURVIVED_MINUTES_NOMAP", string.format( "%.2d", f99_local1 ), string.format( "%.2d", math.floor( f99_arg0 - f99_local1 * 60 ) ) )
	end
end

local f0_local96 = function ( f100_arg0, f100_arg1 )
	local f100_local0 = math.floor( f100_arg0 / 3600000 % 24 )
	if f100_local0 > 0 then
		return Engine.Localize( "DIRECT_BOSS_FIGHT_HOURS", string.format( "%.2d", f100_local0 ), string.format( "%.2d", math.floor( f100_arg0 / 60000 % 60 ) ), string.format( "%.2d", math.floor( f100_arg0 / 1000 % 60 ) ) )
	else
		return Engine.Localize( "DIRECT_BOSS_FIGHT_MINUTES", string.format( "%.2d", math.floor( f100_arg0 / 60000 % 60 ) ), string.format( "%.2d", math.floor( f100_arg0 / 1000 % 60 ) ) )
	end
end

local f0_local97 = function ( f101_arg0 )
	return function ( f102_arg0, f102_arg1 )
		if Engine.IsBitSet( f102_arg0, f101_arg0 ) then
			return 1
		else
			return 0
		end
	end
	
end

local f0_local98 = function ( f103_arg0 )
	return function ( f104_arg0, f104_arg1 )
		if Engine.IsBitSet( f104_arg0, f103_arg0 ) then
			return 1
		else
			return 0
		end
	end
	
end

local f0_local99 = function ( f105_arg0, f105_arg1 )
	if f105_arg0 then
		if f105_arg0 == 0 then
			return 0
		else
			return 1
		end
	else
		
	end
end

local f0_local100 = function ( f106_arg0, f106_arg1 )
	local f106_local0 = 0
	for f106_local1 = 0, 31, 1 do
		if Engine.IsBitSet( f106_arg0, f106_local1 ) then
			f106_local0 = f106_local0 + 1
		end
	end
	return f106_local0
end

local f0_local101 = function ( f107_arg0, f107_arg1 )
	if Engine.GetDvarString( "ui_mapname" ) == "cp_rave" then
		if f107_arg0 == 1 then
			return "zm_charms_binoculars_hud"
		elseif f107_arg0 == 2 then
			return "zm_charms_shovel_hud"
		elseif f107_arg0 == 3 then
			return "zm_charms_arrowhead_hud"
		elseif f107_arg0 == 4 then
			return "zm_charms_rings_hud"
		elseif f107_arg0 == 5 then
			return "zm_charms_birdhead_hud"
		elseif f107_arg0 == 6 then
			return "zm_charms_ball_hud"
		elseif f107_arg0 == 7 then
			return "zm_charms_fish_hud"
		elseif f107_arg0 == 8 then
			return "zm_charms_frog_hud"
		elseif f107_arg0 == 9 then
			return "zm_charms_pacifier_hud"
		elseif f107_arg0 == 10 then
			return "zm_charms_boots_hud"
		end
	elseif Engine.GetDvarString( "ui_mapname" ) == "cp_disco" then
		if f107_arg0 == 1 then
			return "zm_dlc2_snake_skill_icon_3"
		elseif f107_arg0 == 2 then
			return "zm_dlc2_tiger_skill_icon_3"
		elseif f107_arg0 == 3 then
			return "zm_dlc2_crane_skill_icon_3"
		elseif f107_arg0 == 4 then
			return "zm_dlc2_dragon_skill_icon_3"
		end
	elseif Engine.GetDvarString( "ui_mapname" ) == "cp_town" then
		if f107_arg0 == 1 then
			return "cp_town_trap_part_hypnosis_blueprint"
		elseif f107_arg0 == 2 then
			return "cp_town_trap_part_mindcontrol_blueprint"
		elseif f107_arg0 == 3 then
			return "cp_town_trap_part_seismic_blueprint"
		elseif f107_arg0 == 4 then
			return "cp_town_trap_part_xray_blueprint"
		elseif f107_arg0 == 5 then
			return "cp_town_trap_cannister"
		elseif f107_arg0 == 6 then
			return "cp_town_trap_components"
		elseif f107_arg0 == 7 then
			return "cp_town_trap_fusebox"
		elseif f107_arg0 == 8 then
			return "cp_town_trap_valve"
		elseif f107_arg0 == 9 then
			return "cp_town_trap_lever"
		elseif f107_arg0 == 10 then
			return "cp_town_battery"
		end
	elseif Engine.GetDvarString( "ui_mapname" ) == "cp_final" then
		if f107_arg0 == 1 then
			return "cp_final_puzzle_symbol_1"
		elseif f107_arg0 == 2 then
			return "cp_final_puzzle_symbol_2"
		elseif f107_arg0 == 3 then
			return "cp_final_puzzle_symbol_3"
		elseif f107_arg0 == 4 then
			return "cp_final_puzzle_symbol_4"
		elseif f107_arg0 == 5 then
			return "cp_final_puzzle_symbol_5"
		elseif f107_arg0 == 6 then
			return "cp_final_puzzle_symbol_6"
		elseif f107_arg0 == 7 then
			return "cp_final_puzzle_symbol_7"
		elseif f107_arg0 == 8 then
			return "cp_final_puzzle_symbol_8"
		elseif f107_arg0 == 9 then
			return "cp_final_puzzle_symbol_9"
		elseif f107_arg0 == 10 then
			return "cp_final_puzzle_symbol_10"
		elseif f107_arg0 == 11 then
			return "cp_final_puzzle_symbol_11"
		elseif f107_arg0 == 12 then
			return "cp_final_puzzle_symbol_12"
		end
	end
end

local f0_local102 = function ( f108_arg0, f108_arg1 )
	if f108_arg0 then
		if f108_arg0 == 0 then
			return 0
		else
			return 1
		end
	else
		
	end
end

local f0_local103 = function ( f109_arg0 )
	return function ( f110_arg0, f110_arg1 )
		if Engine.IsBitSet( f110_arg0, f109_arg0 ) then
			return 0.85
		else
			return 0
		end
	end
	
end

local f0_local104 = function ( f111_arg0 )
	return function ( f112_arg0, f112_arg1 )
		if Engine.IsBitSet( f112_arg0, f111_arg0 ) then
			return 0
		else
			return 0.45
		end
	end
	
end

local f0_local105 = function ( f113_arg0, f113_arg1 )
	if f113_arg0 then
		if f113_arg0 < 0 then
			return nil
		elseif f113_arg0 == 1 then
			return "zm_chi_snake"
		elseif f113_arg0 == 2 then
			return "zm_chi_tiger"
		elseif f113_arg0 == 3 then
			return "zm_chi_crane"
		elseif f113_arg0 == 4 then
			return "zm_chi_dragon"
		end
	end
end

local f0_local106 = function ( f114_arg0, f114_arg1 )
	if f114_arg0 then
		if f114_arg0 == 1 then
			return 1
		else
			return 0.7
		end
	else
		
	end
end

local f0_local107 = function ( f115_arg0, f115_arg1 )
	if f115_arg0 then
		if f115_arg0 == 2 then
			return 1
		else
			return 0.7
		end
	else
		
	end
end

local f0_local108 = function ( f116_arg0, f116_arg1 )
	if f116_arg0 then
		if f116_arg0 == 3 then
			return 1
		else
			return 0.7
		end
	else
		
	end
end

local f0_local109 = function ( f117_arg0, f117_arg1 )
	if f117_arg0 then
		if f117_arg0 == 4 then
			return 1
		else
			return 0.7
		end
	else
		
	end
end

local f0_local110 = function ( f118_arg0, f118_arg1 )
	if f118_arg0 then
		if f118_arg0 == 1 then
			return 1
		else
			return 0
		end
	else
		
	end
end

local f0_local111 = function ( f119_arg0, f119_arg1 )
	if f119_arg0 then
		if f119_arg0 == 2 then
			return 1
		else
			return 0
		end
	else
		
	end
end

local f0_local112 = function ( f120_arg0, f120_arg1 )
	if f120_arg0 then
		if f120_arg0 == 3 then
			return 1
		else
			return 0
		end
	else
		
	end
end

local f0_local113 = function ( f121_arg0, f121_arg1 )
	if f121_arg0 then
		if f121_arg0 == 4 then
			return 1
		else
			return 0
		end
	else
		
	end
end

local f0_local114 = function ( f122_arg0, f122_arg1 )
	if f122_arg0 == 3 then
		return true
	else
		return false
	end
end

local f0_local115 = function ( f123_arg0, f123_arg1 )
	if f123_arg0 == 1 then
		return 1
	else
		return 0
	end
end

local f0_local116 = function ( f124_arg0, f124_arg1 )
	if f124_arg0 == 1 then
		return 0.05
	else
		return 0
	end
end

local f0_local117 = function ( f125_arg0, f125_arg1 )
	if f125_arg0 == 1 then
		return 0.15
	else
		return 0
	end
end

local f0_local118 = function ( f126_arg0, f126_arg1 )
	if 0 < f126_arg0 then
		return 1
	else
		return 0
	end
end

local f0_local119 = function ( f127_arg0, f127_arg1 )
	if 0 < f127_arg0 then
		return 0.2
	else
		return 0
	end
end

local f0_local120 = function ( f128_arg0, f128_arg1 )
	if f128_arg0 then
		if f128_arg0 <= 0 then
			return ""
		else
			return Engine.TableLookup( CSV.zombieElements.file, CSV.zombieElements.cols.index, f128_arg0, CSV.zombieElements.cols.icon )
		end
	else
		
	end
end

local f0_local121 = function ( f129_arg0, f129_arg1 )
	if f129_arg0 then
		if f129_arg0 == 0 then
			return ""
		else
			return Engine.Localize( Engine.TableLookup( CSV.zombieElements.file, CSV.zombieElements.cols.index, f129_arg0, CSV.zombieElements.cols.name ) )
		end
	else
		
	end
end

local f0_local122 = function ( f130_arg0, f130_arg1 )
	if f130_arg0 then
		if f130_arg0 == 0 then
			return "0%"
		else
			return tostring( math.floor( f130_arg0 * 100 ) ) .. "%"
		end
	else
		
	end
end

function InitZombieDataSources()
	LOADOUT.InitWeaponLootMasterIDs()
	DataSources.inGame.CP.zombies.playerDamagedBits = LUI.DataSourceFromOmnvar.new( "player_damaged" )
	DataSources.inGame.CP.zombies.playerDamagedFlash = DataSources.inGame.CP.zombies.playerDamagedBits:Filter( "playerDamageFlash", f0_local2 )
	DataSources.inGame.CP.zombies.playerHealthBlood = DataSources.inGame.CP.zombies.playerDamagedBits:Filter( "playerDamageBlood", f0_local3 )
	DataSources.inGame.CP.zombies.playerLastStandFilm = DataSources.inGame.CP.zombies.playerDamagedBits:Filter( "playerLastStandFilm", f0_local4 )
	DataSources.inGame.CP.zombies.craftedWeapon = LUI.DataSourceFromOmnvar.new( "zom_crafted_weapon" )
	DataSources.inGame.CP.zombies.craftedWeaponImage = DataSources.inGame.CP.zombies.craftedWeapon:Filter( "crafted_weapon", f0_local5 )
	DataSources.inGame.CP.zombies.dlc3.skull_cipher_hint_omnvar = LUI.DataSourceFromOmnvar.new( "skulltop_cipher_hint" )
	DataSources.inGame.CP.zombies.dlc3.skull_cipher_hint_omnvar_string = DataSources.inGame.CP.zombies.dlc3.skull_cipher_hint_omnvar:Filter( "skulltop_cipher_hint", f0_local6 )
	DataSources.inGame.CP.zombies.ghost.entanglerProgress = LUI.DataSourceFromOmnvar.new( "zom_entangler_progress_percent" )
	DataSources.inGame.CP.zombies.ghost.entanglerWidgetAlpha = DataSources.inGame.CP.zombies.ghost.entanglerProgress:Filter( "entanglerWidgetAlpha", f0_local7 )
	DataSources.inGame.CP.zombies.ghost.entanglerFlashingActive = DataSources.inGame.CP.zombies.ghost.entanglerProgress:Filter( "entanglerFlashingActive", f0_local8 )
	DataSources.inGame.CP.zombies.ghost.entanglerDeploySCUAlpha = DataSources.inGame.CP.zombies.ghost.entanglerProgress:Filter( "entanglerDeploySCUAlpha", f0_local9 )
	DataSources.inGame.CP.zombies.ghostWaveNumOfTargetsEscaped = LUI.DataSourceFromOmnvar.new( "zm_ui_num_targets_escaped" )
	DataSources.inGame.CP.zombies.ghostWaveTarget1EscapedAlpha = DataSources.inGame.CP.zombies.ghostWaveNumOfTargetsEscaped:Filter( "ghost_target_1_escaped_alpha", f0_local71 )
	DataSources.inGame.CP.zombies.ghostWaveTarget2EscapedAlpha = DataSources.inGame.CP.zombies.ghostWaveNumOfTargetsEscaped:Filter( "ghost_target_2_escaped_alpha", f0_local72 )
	DataSources.inGame.CP.zombies.ghostWaveTarget3EscapedAlpha = DataSources.inGame.CP.zombies.ghostWaveNumOfTargetsEscaped:Filter( "ghost_target_3_escaped_alpha", f0_local73 )
	DataSources.inGame.CP.zombies.showGhostArcadeScores = LUI.DataSourceFromOmnvar.new( "zm_ui_show_ghost_arcade_scores" )
	DataSources.inGame.CP.zombies.ghostArcadeScoresAlpha = DataSources.inGame.CP.zombies.showGhostArcadeScores:Filter( "ghost_arcade_score_alpha", f0_local74 )
	DataSources.inGame.CP.zombies.ghostArcadeInstructionAlpha = DataSources.inGame.CP.zombies.showGhostArcadeScores:Filter( "ghost_arcade_instruction_alpha", f0_local75 )
	DataSources.inGame.CP.zombies.ghostArcadeIsActive = LUI.DataSourceFromOmnvar.new( "zm_ui_player_playing_ghost_arcade" )
	DataSources.inGame.CP.zombies.ghostArcadeMessage = LUI.DataSourceFromOmnvar.new( "zm_ui_ghost_arcade_message" )
	DataSources.inGame.CP.zombies.ghostArcadeObjectiveAlpha = DataSources.inGame.CP.zombies.ghostArcadeMessage:Filter( "ghost_arcade_objective_alpha", f0_local76 )
	DataSources.inGame.CP.zombies.ghostArcadeOneSkullEscapedAlpha = DataSources.inGame.CP.zombies.ghostArcadeMessage:Filter( "ghost_arcade_one_skull_escaped_alpha", f0_local77 )
	DataSources.inGame.CP.zombies.ghostArcadeTwoSkullsEscapedAlpha = DataSources.inGame.CP.zombies.ghostArcadeMessage:Filter( "ghost_arcade_two_skulls_escaped_alpha", f0_local78 )
	DataSources.inGame.CP.zombies.ghostArcadeThreeSkullsEscapedAlpha = DataSources.inGame.CP.zombies.ghostArcadeMessage:Filter( "ghost_arcade_three_skulls_escaped_alpha", f0_local79 )
	DataSources.inGame.CP.zombies.ghostArcadeYouWonAlpha = DataSources.inGame.CP.zombies.showGhostArcadeScores:Filter( "ghost_arcade_you_won_alpha", f0_local80 )
	DataSources.inGame.CP.zombies.ghostArcadeYouFailedAlpha = DataSources.inGame.CP.zombies.showGhostArcadeScores:Filter( "ghost_arcade_you_failed_alpha", f0_local81 )
	DataSources.inGame.CP.zombies.ghostArcadeNumOfCoins = LUI.DataSourceFromOmnvar.new( "zm_num_ghost_n_skull_coin" )
	DataSources.inGame.CP.zombies.ghostArcadeCoin0Alpha = DataSources.inGame.CP.zombies.ghostArcadeNumOfCoins:Filter( "ghost_arcade_coin_0_alpha", f0_local61 )
	DataSources.inGame.CP.zombies.ghostArcadeCoin1Alpha = DataSources.inGame.CP.zombies.ghostArcadeNumOfCoins:Filter( "ghost_arcade_coin_1_alpha", f0_local62 )
	DataSources.inGame.CP.zombies.ghostArcadeCoin2Alpha = DataSources.inGame.CP.zombies.ghostArcadeNumOfCoins:Filter( "ghost_arcade_coin_2_alpha", f0_local63 )
	DataSources.inGame.CP.zombies.ghostArcadeCoin3Alpha = DataSources.inGame.CP.zombies.ghostArcadeNumOfCoins:Filter( "ghost_arcade_coin_3_alpha", f0_local64 )
	DataSources.inGame.CP.zombies.ghostArcadeCoin4Alpha = DataSources.inGame.CP.zombies.ghostArcadeNumOfCoins:Filter( "ghost_arcade_coin_4_alpha", f0_local65 )
	DataSources.inGame.CP.zombies.ghostArcadeCoin5Alpha = DataSources.inGame.CP.zombies.ghostArcadeNumOfCoins:Filter( "ghost_arcade_coin_5_alpha", f0_local66 )
	DataSources.inGame.CP.zombies.ghostArcadeCoin6Alpha = DataSources.inGame.CP.zombies.ghostArcadeNumOfCoins:Filter( "ghost_arcade_coin_6_alpha", f0_local67 )
	DataSources.inGame.CP.zombies.escape.gateScore = LUI.DataSourceFromOmnvar.new( "zom_escape_gate_score" )
	DataSources.inGame.CP.zombies.escape.currentProgress = LUI.DataSourceFromOmnvar.new( "zom_escape_gate_percent" )
	DataSources.inGame.CP.zombies.escape.comboSplash = LUI.DataSourceFromOmnvar.new( "zom_escape_combo_splash" )
	DataSources.inGame.CP.zombies.escape.comboSplashText = DataSources.inGame.CP.zombies.escape.comboSplash:Filter( "zom_escape_combo_splash", f0_local10 )
	DataSources.inGame.CP.zombies.escape.comboMultiplier = LUI.DataSourceFromOmnvar.new( "zom_escape_combo_multiplier" )
	DataSources.inGame.CP.zombies.challenges.challengeActive = LUI.DataSourceFromOmnvar.new( "ui_intel_active_index" )
	DataSources.inGame.CP.zombies.challenges.challengeTitle = LUI.DataSourceFromOmnvar.new( "ui_intel_title" )
	DataSources.inGame.CP.zombies.challenges.challengeTimer = LUI.DataSourceFromOmnvar.new( "ui_intel_timer" )
	DataSources.inGame.CP.zombies.challenges.challengePreChallenge = LUI.DataSourceFromOmnvar.new( "ui_intel_prechallenge" )
	DataSources.inGame.CP.zombies.challenges.challengeMaxProgress = LUI.DataSourceFromOmnvar.new( "ui_intel_progress_max" )
	DataSources.inGame.CP.zombies.challenges.challengeCurrentProgress = LUI.DataSourceFromOmnvar.new( "ui_intel_progress_current" )
	DataSources.inGame.CP.zombies.challenges.challengeTargetPlayer = LUI.DataSourceFromOmnvar.new( "ui_intel_target_player" )
	DataSources.inGame.CP.zombies.challenges.challengeTargetPlayerName = DataSources.inGame.CP.zombies.challenges.challengeTargetPlayer:Filter( "zom_target_player_name", f0_local11 )
	DataSources.inGame.CP.zombies.challenges.challengeTargetPlayerIcon = DataSources.inGame.CP.zombies.challenges.challengeTargetPlayer:Filter( "zom_target_player_icon", f0_local12 )
	DataSources.inGame.CP.zombies.challenges.challengeScalar = LUI.DataSourceFromOmnvar.new( "ui_intel_challenge_scalar" )
	DataSources.inGame.CP.zombies.challenges.challengeActivateText = DataSources.inGame.CP.zombies.challenges.challengeActive:Filter( "zom_challenge_activate_text", f0_local13 )
	DataSources.inGame.CP.zombies.challenges.challengeCompleteText = DataSources.inGame.CP.zombies.challenges.challengeActive:Filter( "zom_challenge_complete_text", f0_local14 )
	DataSources.inGame.CP.zombies.challenges.challengeFailText = DataSources.inGame.CP.zombies.challenges.challengeActive:Filter( "zom_challenge_fail_text", f0_local15 )
	DataSources.inGame.CP.zombies.challenges.challengeIcon = DataSources.inGame.CP.zombies.challenges.challengeActive:Filter( "zom_challenge_icon", f0_local16 )
	DataSources.inGame.CP.zombies.challenges.challengeUpgradeIcon = DataSources.inGame.CP.zombies.challenges.challengeActive:Filter( "zom_challenge_upgrade_icon", f0_local17 )
	DataSources.inGame.CP.zombies.challenges.challengeUpgradeText = DataSources.inGame.CP.zombies.challenges.challengeActive:Filter( "zom_challenge_upgrade_text", f0_local18 )
	DataSources.inGame.CP.zombies.challenges.challengeSplashStyleIcon = DataSources.inGame.CP.zombies.challenges.challengeActive:Filter( "zom_challenge_upgrade_style_icon", f0_local19 )
	DataSources.inGame.CP.zombies.challenges.challengeType = DataSources.inGame.CP.zombies.challenges.challengeActive:Filter( "zom_challenge_type", f0_local20 )
	DataSources.inGame.CP.zombies.challenges.challengeMessageDisplay = LUI.DataSourceFromOmnvar.new( "zm_show_challenge" )
	DataSources.inGame.CP.zombies.challenges.challengeProgressPercent = DataSources.inGame.CP.zombies.challenges.challengeCurrentProgress:Filter( "zom_challenge_progress_percent", f0_local21 )
	DataSources.inGame.CP.zombies.challenges.challengeProgressAmountLeft = DataSources.inGame.CP.zombies.challenges.challengeCurrentProgress:Filter( "zom_challenge_amount_left", f0_local23 )
	DataSources.inGame.CP.zombies.neilProgress = LUI.DataSourceFromOmnvar.new( "zm_neil_progress" )
	DataSources.inGame.CP.zombies.currentChallengeProgress = LUI.DataSourceFromOmnvar.new( "zm_challenge_progress" )
	DataSources.inGame.CP.zombies.challenges.challengeProgressBarFill = DataSources.inGame.CP.zombies.challenges.challengeCurrentProgress:Filter( "zom_challenge_progress_bar_fill", f0_local22 )
	DataSources.inGame.CP.zombies.challenges.queue.activated = LUI.DataSourceFromOmnvar.new( "zm_show_challenge" )
	DataSources.inGame.CP.zombies.challenges.queue.push = DataSources.inGame.CP.zombies.challenges.queue.activated:Filter( "challenge_splash_push", f0_local114 )
	DataSources.inGame.CP.zombies.challenges.challengeSplash = LUI.DataSourceInControllerModel.new( "cg.CP.zombies.challenges.challengeSplash" )
	DataSources.inGame.CP.zombies.timeSurvived = LUI.DataSourceFromOmnvar.new( "zm_time_survived" )
	DataSources.inGame.CP.zombies.timeSurvivedText = DataSources.inGame.CP.zombies.timeSurvived:Filter( "zm_survived_text", f0_local95 )
	DataSources.inGame.CP.zombies.bossSplash = LUI.DataSourceFromOmnvar.new( "zm_boss_splash" )
	DataSources.inGame.CP.zombies.bossTimeP1 = LUI.DataSourceFromOmnvar.new( "zm_boss_time_p1" )
	DataSources.inGame.CP.zombies.bossTimePlayer1 = DataSources.inGame.CP.zombies.bossTimeP1:Filter( "zm_p1_boss_time", f0_local96 )
	DataSources.inGame.CP.zombies.bossTimeP2 = LUI.DataSourceFromOmnvar.new( "zm_boss_time_p2" )
	DataSources.inGame.CP.zombies.bossTimePlayer2 = DataSources.inGame.CP.zombies.bossTimeP2:Filter( "zm_p2_boss_time", f0_local96 )
	DataSources.inGame.CP.zombies.bossTimeP3 = LUI.DataSourceFromOmnvar.new( "zm_boss_time_p3" )
	DataSources.inGame.CP.zombies.bossTimePlayer3 = DataSources.inGame.CP.zombies.bossTimeP3:Filter( "zm_p3_boss_time", f0_local96 )
	DataSources.inGame.CP.zombies.bossTimeP4 = LUI.DataSourceFromOmnvar.new( "zm_boss_time_p4" )
	DataSources.inGame.CP.zombies.bossTimePlayer4 = DataSources.inGame.CP.zombies.bossTimeP4:Filter( "zm_p4_boss_time", f0_local96 )
	DataSources.inGame.CP.zombies.bossTimer = LUI.DataSourceFromOmnvar.new( "zm_boss_timer" )
	DataSources.inGame.CP.zombies.bossTimerText = DataSources.inGame.CP.zombies.bossTimer:Filter( "zm_boss_timer_text", f0_local96 )
	DataSources.inGame.CP.zombies.tutorials.tutorial = LUI.DataSourceFromOmnvar.new( "zm_tutorial_num" )
	DataSources.inGame.CP.zombies.tutorials.tutorialText = DataSources.inGame.CP.zombies.tutorials.tutorial:Filter( "zm_tutorial_text", f0_local24 )
	DataSources.inGame.CP.zombies.tutorials.tutorialTitle = DataSources.inGame.CP.zombies.tutorials.tutorial:Filter( "zm_tutorial_title", f0_local25 )
	DataSources.inGame.CP.zombies.tutorials.tutorialImage = DataSources.inGame.CP.zombies.tutorials.tutorial:Filter( "zm_tutorial_image", f0_local26 )
	DataSources.inGame.CP.zombies.quests.questPieceBits = LUI.DataSourceFromOmnvar.new( "zombie_quest_piece" )
	DataSources.inGame.CP.zombies.quests.inventoryNagAlpha = LUI.DataSourceFromOmnvar.new( "zm_nag_text" )
	DataSources.inGame.CP.zombies.ghost.ghostAfterLifeIconAlpha = DataSources.inGame.CP.zombies.quests.inventoryNagAlpha:Filter( "ghost_afterlife_alpha", f0_local60 )
	DataSources.inGame.CP.zombies.quests.questArkBlueAlpha = DataSources.inGame.CP.zombies.quests.questPieceBits:Filter( "quest_arkblue_alpha", f0_local27( 1 ) )
	DataSources.inGame.CP.zombies.quests.questArkGreenAlpha = DataSources.inGame.CP.zombies.quests.questPieceBits:Filter( "quest_arkgreen_alpha", f0_local27( 2 ) )
	DataSources.inGame.CP.zombies.quests.questArkYellowAlpha = DataSources.inGame.CP.zombies.quests.questPieceBits:Filter( "quest_arkyellow_alpha", f0_local27( 3 ) )
	DataSources.inGame.CP.zombies.quests.questArkRedAlpha = DataSources.inGame.CP.zombies.quests.questPieceBits:Filter( "quest_arkred_alpha", f0_local27( 4 ) )
	DataSources.inGame.CP.zombies.quests.questArkPinkAlpha = DataSources.inGame.CP.zombies.quests.questPieceBits:Filter( "quest_arkpink_alpha", f0_local27( 5 ) )
	DataSources.inGame.CP.zombies.quests.questToothAlpha = DataSources.inGame.CP.zombies.quests.questPieceBits:Filter( "quest_tooth_alpha", f0_local27( 6 ) )
	DataSources.inGame.CP.zombies.quests.questRobotHeadAlpha = DataSources.inGame.CP.zombies.quests.questPieceBits:Filter( "quest_head_alpha", f0_local27( 7 ) )
	DataSources.inGame.CP.zombies.quests.questRobotBatteryAlpha = DataSources.inGame.CP.zombies.quests.questPieceBits:Filter( "quest_battery_alpha", f0_local27( 8 ) )
	DataSources.inGame.CP.zombies.quests.questRobotFloppyAlpha = DataSources.inGame.CP.zombies.quests.questPieceBits:Filter( "quest_floppy_alpha", f0_local27( 9 ) )
	DataSources.inGame.CP.zombies.quests.questWOR1Part1Alpha = DataSources.inGame.CP.zombies.quests.questPieceBits:Filter( "quest_wor1_part1", f0_local27( 10 ) )
	DataSources.inGame.CP.zombies.quests.questWOR1Part2Alpha = DataSources.inGame.CP.zombies.quests.questPieceBits:Filter( "quest_wor1_part2", f0_local27( 11 ) )
	DataSources.inGame.CP.zombies.quests.questWOR1Part3Alpha = DataSources.inGame.CP.zombies.quests.questPieceBits:Filter( "quest_wor1_part3", f0_local27( 12 ) )
	DataSources.inGame.CP.zombies.quests.questWOR2Part1Alpha = DataSources.inGame.CP.zombies.quests.questPieceBits:Filter( "quest_wor2_part1", f0_local27( 13 ) )
	DataSources.inGame.CP.zombies.quests.questWOR2Part2Alpha = DataSources.inGame.CP.zombies.quests.questPieceBits:Filter( "quest_wor2_part2", f0_local27( 14 ) )
	DataSources.inGame.CP.zombies.quests.questWOR2Part3Alpha = DataSources.inGame.CP.zombies.quests.questPieceBits:Filter( "quest_wor2_part3", f0_local27( 15 ) )
	DataSources.inGame.CP.zombies.quests.questWOR3Part1Alpha = DataSources.inGame.CP.zombies.quests.questPieceBits:Filter( "quest_wor3_part1", f0_local27( 16 ) )
	DataSources.inGame.CP.zombies.quests.questWOR3Part2Alpha = DataSources.inGame.CP.zombies.quests.questPieceBits:Filter( "quest_wor3_part2", f0_local27( 17 ) )
	DataSources.inGame.CP.zombies.quests.questWOR3Part3Alpha = DataSources.inGame.CP.zombies.quests.questPieceBits:Filter( "quest_wor3_part3", f0_local27( 18 ) )
	DataSources.inGame.CP.zombies.quests.questWOR3GlassesAlpha = LUI.DataSourceFromOmnvar.new( "zm_quest_dpad_item" )
	DataSources.inGame.CP.zombies.quests.questWOR4Part1Alpha = DataSources.inGame.CP.zombies.quests.questPieceBits:Filter( "quest_wor4_part1", f0_local27( 20 ) )
	DataSources.inGame.CP.zombies.quests.questWOR4Part2Alpha = DataSources.inGame.CP.zombies.quests.questPieceBits:Filter( "quest_wor4_part2", f0_local27( 19 ) )
	DataSources.inGame.CP.zombies.quests.questWOR4Part3Alpha = DataSources.inGame.CP.zombies.quests.questPieceBits:Filter( "quest_wor4_part3", f0_local27( 21 ) )
	DataSources.inGame.CP.zombies.quests.questRecorderPart2Alpha = DataSources.inGame.CP.zombies.quests.questPieceBits:Filter( "quest_recorder_part_2_alpha", f0_local27( 22 ) )
	DataSources.inGame.CP.zombies.quests.questRecorderPart1Alpha = DataSources.inGame.CP.zombies.quests.questPieceBits:Filter( "quest_recorder_part_1_alpha", f0_local27( 23 ) )
	DataSources.inGame.CP.zombies.quests.questRecorderPart3Alpha = DataSources.inGame.CP.zombies.quests.questPieceBits:Filter( "quest_recorder_part_3_alpha", f0_local27( 24 ) )
	DataSources.inGame.CP.zombies.quests.questFuse = LUI.DataSourceFromOmnvar.new( "zm_special_item" )
	DataSources.inGame.CP.zombies.quests.questFuseAlphaFilter = DataSources.inGame.CP.zombies.quests.questFuse:Filter( "zm_quest_fuse_alpha", f0_local29 )
	DataSources.inGame.CP.zombies.quests.questSetiComAlphaFilter = DataSources.inGame.CP.zombies.quests.questFuse:Filter( "zm_quest_seti_alpha", f0_local31 )
	DataSources.inGame.CP.zombies.quests.djToneAlphaFilter = DataSources.inGame.CP.zombies.quests.questFuse:Filter( "zm_dj_tone_alpha", f0_local30 )
	DataSources.inGame.CP.zombies.waveNumberQueue.number = LUI.DataSourceFromOmnvar.new( "zombie_wave_number" )
	DataSources.inGame.CP.zombies.waveNumberQueue.push = DataSources.inGame.CP.zombies.waveNumberQueue.number:Filter( "wavenumber_push", f0_local90 )
	DataSources.inGame.CP.zombies.waveNumberSplash = LUI.DataSourceInControllerModel.new( "cg.CP.zombies.waveNumber" )
	DataSources.inGame.CP.zombies.waveNumber = LUI.DataSourceFromOmnvar.new( "zombie_wave_number" )
	DataSources.inGame.CP.zombies.ticketsDispersedQueue.tickets = LUI.DataSourceFromOmnvar.new( "zm_tickets_dispersed" )
	DataSources.inGame.CP.zombies.ticketsDispersedQueue.push = DataSources.inGame.CP.zombies.ticketsDispersedQueue.tickets:Filter( "ticket_machine_push", f0_local91 )
	DataSources.inGame.CP.zombies.ticketType = LUI.DataSourceInControllerModel.new( "cg.CP.zombies.ticketType" )
	DataSources.inGame.CP.zombies.ticketsDispersed = LUI.DataSourceInControllerModel.new( "cg.CP.zombies.ticketsDispersed" )
	DataSources.inGame.CP.zombies.arcadeGameTicketEarned = LUI.DataSourceFromOmnvar.new( "zombie_arcade_game_ticket_earned" )
	DataSources.inGame.CP.zombies.arcadeGameShotRemaining = LUI.DataSourceFromOmnvar.new( "zombie_arcade_game_shot_remaining" )
	DataSources.inGame.CP.zombies.arcadeGameTime = LUI.DataSourceFromOmnvar.new( "zombie_arcade_game_time" )
	DataSources.inGame.CP.zombies.bball1Time = LUI.DataSourceFromOmnvar.new( "zombie_bball_game_1_time" )
	DataSources.inGame.CP.zombies.bball2Time = LUI.DataSourceFromOmnvar.new( "zombie_bball_game_2_time" )
	DataSources.inGame.CP.zombies.bball3Time = LUI.DataSourceFromOmnvar.new( "zombie_bball_game_3_time" )
	DataSources.inGame.CP.zombies.bball1Score = LUI.DataSourceFromOmnvar.new( "zombie_bball_game_1_score" )
	DataSources.inGame.CP.zombies.bball2Score = LUI.DataSourceFromOmnvar.new( "zombie_bball_game_2_score" )
	DataSources.inGame.CP.zombies.bball3Score = LUI.DataSourceFromOmnvar.new( "zombie_bball_game_3_score" )
	DataSources.inGame.CP.zombies.bball1HiScore = LUI.DataSourceFromOmnvar.new( "zombie_bball_game_1_hiscore" )
	DataSources.inGame.CP.zombies.bball2HiScore = LUI.DataSourceFromOmnvar.new( "zombie_bball_game_2_hiscore" )
	DataSources.inGame.CP.zombies.bball3HiScore = LUI.DataSourceFromOmnvar.new( "zombie_bball_game_3_hiscore" )
	DataSources.inGame.CP.zombies.shootingGallery1WidgetAlpha = LUI.DataSourceFromOmnvar.new( "zombie_shooting_gallery_1_is_active" )
	DataSources.inGame.CP.zombies.shootingGallery2WidgetAlpha = LUI.DataSourceFromOmnvar.new( "zombie_shooting_gallery_2_is_active" )
	DataSources.inGame.CP.zombies.numberOfTicket = LUI.DataSourceFromOmnvar.new( "zombie_number_of_ticket" )
	DataSources.inGame.CP.zombies.songs.songPlayingIndex = LUI.DataSourceFromOmnvar.new( "song_playing" )
	DataSources.inGame.CP.zombies.songs.songPlayingTitle = DataSources.inGame.CP.zombies.songs.songPlayingIndex:Filter( "song_playing_title", f0_local93 )
	DataSources.inGame.CP.zombies.songs.songPlayingArtist = DataSources.inGame.CP.zombies.songs.songPlayingIndex:Filter( "song_playing_artist", f0_local94 )
	DataSources.inGame.CP.zombies.souvenirPieceIndex = LUI.DataSourceFromOmnvar.new( "zombie_souvenir_piece_index" )
	DataSources.inGame.CP.zombies.souvenirPieceIcon = DataSources.inGame.CP.zombies.souvenirPieceIndex:Filter( "souvenir_piece_icon", f0_local32 )
	DataSources.inGame.CP.zombies.souvenirAlpha = DataSources.inGame.CP.zombies.souvenirPieceIndex:Filter( "souvenir_alpha", f0_local33 )
	DataSources.inGame.CP.zombies.lostAndFoundTimer = LUI.DataSourceFromOmnvar.new( "zm_lostandfound_timer" )
	DataSources.inGame.CP.zombies.lostAndFoundTimerAlpha = DataSources.inGame.CP.zombies.lostAndFoundTimer:Filter( "lostandfound_alpha", f0_local34 )
	DataSources.inGame.CP.zombies.lostAndFoundTarget = LUI.DataSourceFromOmnvar.new( "zm_lostandfound_target" )
	DataSources.inGame.CP.zombies.speakerDefenseTimer = LUI.DataSourceFromOmnvar.new( "zm_speaker_defense_timer" )
	DataSources.inGame.CP.zombies.speakerDefenseHealth = LUI.DataSourceFromOmnvar.new( "zm_speaker_defense_health" )
	DataSources.inGame.CP.zombies.speakerDefenseTimerAlpha = DataSources.inGame.CP.zombies.speakerDefenseTimer:Filter( "speaker_defense_alpha", f0_local35 )
	DataSources.inGame.CP.zombies.speakerDefenseTarget = LUI.DataSourceFromOmnvar.new( "zm_speaker_defense_target" )
	DataSources.inGame.CP.zombies.consumableIndex1 = LUI.DataSourceFromOmnvar.new( "zombie_consumable_index_1" )
	DataSources.inGame.CP.zombies.consumableName1 = DataSources.inGame.CP.zombies.consumableIndex1:Filter( "zombie_consumable_name_1", f0_local36 )
	DataSources.inGame.CP.zombies.consumableIcon1 = DataSources.inGame.CP.zombies.consumableIndex1:Filter( "zombie_consumable_icon_1", f0_local37 )
	DataSources.inGame.CP.zombies.consumableAlpha1 = DataSources.inGame.CP.zombies.consumableIndex1:Filter( "zombie_consumable_alpha_1", f0_local38 )
	DataSources.inGame.CP.zombies.consumableDesc1 = DataSources.inGame.CP.zombies.consumableIndex1:Filter( "zombie_consumable_desc_1", f0_local39 )
	DataSources.inGame.CP.zombies.consumableType1 = DataSources.inGame.CP.zombies.consumableIndex1:Filter( "zombie_consumable_type_1", f0_local40 )
	DataSources.inGame.CP.zombies.consumableUses1 = DataSources.inGame.CP.zombies.consumableIndex1:Filter( "zombie_consumable_uses_1", f0_local41 )
	DataSources.inGame.CP.zombies.consumableTime1 = DataSources.inGame.CP.zombies.consumableIndex1:Filter( "zombie_consumable_time_1", f0_local42 )
	DataSources.inGame.CP.zombies.consumablesSlotCount = LUI.DataSourceFromOmnvar.new( "zm_consumables_slot_count" )
	DataSources.inGame.CP.zombies.consumablesRemaining = LUI.DataSourceFromOmnvar.new( "zm_consumables_remaining" )
	DataSources.inGame.CP.zombies.consumablesRemainingAlphaFilter = DataSources.inGame.CP.zombies.consumablesRemaining:Filter( "zombie_consumable_remaining_alpha", f0_local43 )
	DataSources.inGame.CP.zombies.consumableDeckSlotOn = LUI.DataSourceFromOmnvar.new( "zm_consumable_deck_slot_on" )
	DataSources.inGame.CP.zombies.consumableDpadPressed = LUI.DataSourceFromOmnvar.new( "zm_dpad_pressed" )
	DataSources.inGame.CP.zombies.consumableDeckSelectIcon = DataSources.inGame.CP.zombies.consumableDeckSlotOn:Filter( "zombie_consumable_select_icon", f0_local44 )
	DataSources.inGame.CP.zombies.consumableDeckSelectBacking = DataSources.inGame.CP.zombies.consumableDeckSlotOn:Filter( "zombie_consumable_select_backing", f0_local46 )
	DataSources.inGame.CP.zombies.consumableDeckSelectRarity = DataSources.inGame.CP.zombies.consumableDeckSlotOn:Filter( "zombie_consumable_select_rarity", f0_local47 )
	DataSources.inGame.CP.zombies.consumableDeckSelectName = DataSources.inGame.CP.zombies.consumableDeckSlotOn:Filter( "zombie_consumable_select_name", f0_local49 )
	DataSources.inGame.CP.zombies.consumableDeckSelectDesc = DataSources.inGame.CP.zombies.consumableDeckSlotOn:Filter( "zombie_consumable_select_desc", f0_local50 )
	DataSources.inGame.CP.zombies.consumableDeckSelectReady = LUI.DataSourceFromOmnvar.new( "zm_consumable_selection_ready" )
	DataSources.inGame.CP.zombies.consumableSlotUsed = LUI.DataSourceFromOmnvar.new( "zm_fate_card_used" )
	DataSources.inGame.CP.zombies.consumableSlotUsedName = DataSources.inGame.CP.zombies.consumableSlotUsed:Filter( "zombie_consumable_used_name", f0_local48 )
	DataSources.inGame.CP.zombies.consumableSlotUsedDesc = DataSources.inGame.CP.zombies.consumableSlotUsed:Filter( "zombie_consumable_used_desc", f0_local51 )
	DataSources.inGame.CP.zombies.consumableSlotUsedIcon = DataSources.inGame.CP.zombies.consumableSlotUsed:Filter( "zombie_consumable_used_icon", f0_local45 )
	DataSources.inGame.CP.zombies.consumableSlotBits = LUI.DataSourceFromOmnvar.new( "zm_card_selection_count" )
	DataSources.inGame.CP.zombies.consumableSlot1Alpha = DataSources.inGame.CP.zombies.consumableSlotBits:Filter( "consumable_slot_0_alpha", f0_local52( 0 ) )
	DataSources.inGame.CP.zombies.consumableSlot2Alpha = DataSources.inGame.CP.zombies.consumableSlotBits:Filter( "consumable_slot_1_alpha", f0_local52( 1 ) )
	DataSources.inGame.CP.zombies.consumableSlot3Alpha = DataSources.inGame.CP.zombies.consumableSlotBits:Filter( "consumable_slot_2_alpha", f0_local52( 2 ) )
	DataSources.inGame.CP.zombies.consumableSlot4Alpha = DataSources.inGame.CP.zombies.consumableSlotBits:Filter( "consumable_slot_3_alpha", f0_local52( 3 ) )
	DataSources.inGame.CP.zombies.consumableSlot5Alpha = DataSources.inGame.CP.zombies.consumableSlotBits:Filter( "consumable_slot_4_alpha", f0_local52( 4 ) )
	DataSources.inGame.CP.zombies.dpadUpFillPercent = LUI.DataSourceFromOmnvar.new( "zm_dpad_up_fill" )
	DataSources.inGame.CP.zombies.dpadUpAlphaFilter = DataSources.inGame.CP.zombies.dpadUpFillPercent:Filter( "zm_dpad_up_alpha", f0_local53 )
	DataSources.inGame.CP.zombies.dpadUpUses = LUI.DataSourceFromOmnvar.new( "zm_dpad_up_uses" )
	DataSources.inGame.CP.zombies.dpadUpUsesAlphaFilter = DataSources.inGame.CP.zombies.dpadUpUses:Filter( "zm_dpad_up_uses_alpha", f0_local54 )
	DataSources.inGame.CP.zombies.dpadUpActivated = LUI.DataSourceFromOmnvar.new( "zm_dpad_up_activated" )
	DataSources.alwaysLoaded.playerData.CP = LUI.DataSourceFromPlayerData.new( CoD.StatsGroup.Coop, CoD.PlayMode.Aliens )
	DataSources.inGame.CP.zombies.consumableDeckSlot1Ref = DataSources.alwaysLoaded.playerData.CP.zombiePlayerLoadout.zombie_consumables[0]
	DataSources.inGame.CP.zombies.consumableDeckSlot1Icon = DataSources.inGame.CP.zombies.consumableDeckSlot1Ref:Filter( "zombie_deck_slot_1_icon", f0_local55 )
	DataSources.inGame.CP.zombies.consumableDeckSlot1Backing = DataSources.inGame.CP.zombies.consumableDeckSlot1Ref:Filter( "zombie_deck_slot_1_backing", f0_local56 )
	DataSources.inGame.CP.zombies.consumableDeckSlot1Rarity = DataSources.inGame.CP.zombies.consumableDeckSlot1Ref:Filter( "zombie_deck_slot_1_rarity", f0_local57 )
	DataSources.inGame.CP.zombies.consumableDeckSlot1Name = DataSources.inGame.CP.zombies.consumableDeckSlot1Ref:Filter( "zombie_deck_slot_1_name", f0_local58 )
	DataSources.inGame.CP.zombies.consumableDeckSlot1Desc = DataSources.inGame.CP.zombies.consumableDeckSlot1Ref:Filter( "zombie_deck_slot_1_desc", f0_local59 )
	DataSources.inGame.CP.zombies.consumableDeckSlot1FillPercent = LUI.DataSourceFromOmnvar.new( "zm_card1_drain" )
	DataSources.inGame.CP.zombies.consumableDeckSlot1FillingVisible = DataSources.inGame.CP.zombies.consumableDeckSlot1FillPercent:Filter( "zombie_deck_slot_1_filling", f0_local68 )
	DataSources.inGame.CP.zombies.consumableDeckSlot2Ref = DataSources.alwaysLoaded.playerData.CP.zombiePlayerLoadout.zombie_consumables[1]
	DataSources.inGame.CP.zombies.consumableDeckSlot2Icon = DataSources.inGame.CP.zombies.consumableDeckSlot2Ref:Filter( "zombie_deck_slot_2_icon", f0_local55 )
	DataSources.inGame.CP.zombies.consumableDeckSlot2Backing = DataSources.inGame.CP.zombies.consumableDeckSlot2Ref:Filter( "zombie_deck_slot_2_backing", f0_local56 )
	DataSources.inGame.CP.zombies.consumableDeckSlot2Rarity = DataSources.inGame.CP.zombies.consumableDeckSlot2Ref:Filter( "zombie_deck_slot_2_rarity", f0_local57 )
	DataSources.inGame.CP.zombies.consumableDeckSlot2Name = DataSources.inGame.CP.zombies.consumableDeckSlot2Ref:Filter( "zombie_deck_slot_2_name", f0_local58 )
	DataSources.inGame.CP.zombies.consumableDeckSlot2Desc = DataSources.inGame.CP.zombies.consumableDeckSlot2Ref:Filter( "zombie_deck_slot_2_desc", f0_local59 )
	DataSources.inGame.CP.zombies.consumableDeckSlot2FillPercent = LUI.DataSourceFromOmnvar.new( "zm_card2_drain" )
	DataSources.inGame.CP.zombies.consumableDeckSlot2FillingVisible = DataSources.inGame.CP.zombies.consumableDeckSlot2FillPercent:Filter( "zombie_deck_slot_2_filling", f0_local68 )
	DataSources.inGame.CP.zombies.consumableDeckSlot3Ref = DataSources.alwaysLoaded.playerData.CP.zombiePlayerLoadout.zombie_consumables[2]
	DataSources.inGame.CP.zombies.consumableDeckSlot3Icon = DataSources.inGame.CP.zombies.consumableDeckSlot3Ref:Filter( "zombie_deck_slot_3_icon", f0_local55 )
	DataSources.inGame.CP.zombies.consumableDeckSlot3Backing = DataSources.inGame.CP.zombies.consumableDeckSlot3Ref:Filter( "zombie_deck_slot_3_backing", f0_local56 )
	DataSources.inGame.CP.zombies.consumableDeckSlot3Rarity = DataSources.inGame.CP.zombies.consumableDeckSlot3Ref:Filter( "zombie_deck_slot_3_rarity", f0_local57 )
	DataSources.inGame.CP.zombies.consumableDeckSlot3Name = DataSources.inGame.CP.zombies.consumableDeckSlot3Ref:Filter( "zombie_deck_slot_3_name", f0_local58 )
	DataSources.inGame.CP.zombies.consumableDeckSlot3Desc = DataSources.inGame.CP.zombies.consumableDeckSlot3Ref:Filter( "zombie_deck_slot_3_desc", f0_local59 )
	DataSources.inGame.CP.zombies.consumableDeckSlot3FillPercent = LUI.DataSourceFromOmnvar.new( "zm_card3_drain" )
	DataSources.inGame.CP.zombies.consumableDeckSlot3FillingVisible = DataSources.inGame.CP.zombies.consumableDeckSlot3FillPercent:Filter( "zombie_deck_slot_3_filling", f0_local68 )
	DataSources.inGame.CP.zombies.consumableDeckSlot4Ref = DataSources.alwaysLoaded.playerData.CP.zombiePlayerLoadout.zombie_consumables[3]
	DataSources.inGame.CP.zombies.consumableDeckSlot4Icon = DataSources.inGame.CP.zombies.consumableDeckSlot4Ref:Filter( "zombie_deck_slot_4_icon", f0_local55 )
	DataSources.inGame.CP.zombies.consumableDeckSlot4Backing = DataSources.inGame.CP.zombies.consumableDeckSlot4Ref:Filter( "zombie_deck_slot_4_backing", f0_local56 )
	DataSources.inGame.CP.zombies.consumableDeckSlot4Rarity = DataSources.inGame.CP.zombies.consumableDeckSlot4Ref:Filter( "zombie_deck_slot_4_rarity", f0_local57 )
	DataSources.inGame.CP.zombies.consumableDeckSlot4Name = DataSources.inGame.CP.zombies.consumableDeckSlot4Ref:Filter( "zombie_deck_slot_4_name", f0_local58 )
	DataSources.inGame.CP.zombies.consumableDeckSlot4Desc = DataSources.inGame.CP.zombies.consumableDeckSlot4Ref:Filter( "zombie_deck_slot_4_desc", f0_local59 )
	DataSources.inGame.CP.zombies.consumableDeckSlot4FillPercent = LUI.DataSourceFromOmnvar.new( "zm_card4_drain" )
	DataSources.inGame.CP.zombies.consumableDeckSlot4FillingVisible = DataSources.inGame.CP.zombies.consumableDeckSlot4FillPercent:Filter( "zombie_deck_slot_4_filling", f0_local68 )
	DataSources.inGame.CP.zombies.consumableDeckSlot5Ref = DataSources.alwaysLoaded.playerData.CP.zombiePlayerLoadout.zombie_consumables[4]
	DataSources.inGame.CP.zombies.consumableDeckSlot5Icon = DataSources.inGame.CP.zombies.consumableDeckSlot5Ref:Filter( "zombie_deck_slot_5_icon", f0_local55 )
	DataSources.inGame.CP.zombies.consumableDeckSlot5Backing = DataSources.inGame.CP.zombies.consumableDeckSlot5Ref:Filter( "zombie_deck_slot_5_backing", f0_local56 )
	DataSources.inGame.CP.zombies.consumableDeckSlot5Rarity = DataSources.inGame.CP.zombies.consumableDeckSlot5Ref:Filter( "zombie_deck_slot_5_rarity", f0_local57 )
	DataSources.inGame.CP.zombies.consumableDeckSlot5Name = DataSources.inGame.CP.zombies.consumableDeckSlot5Ref:Filter( "zombie_deck_slot_5_name", f0_local58 )
	DataSources.inGame.CP.zombies.consumableDeckSlot5Desc = DataSources.inGame.CP.zombies.consumableDeckSlot5Ref:Filter( "zombie_deck_slot_5_desc", f0_local59 )
	DataSources.inGame.CP.zombies.consumableDeckSlot5FillPercent = LUI.DataSourceFromOmnvar.new( "zm_card5_drain" )
	DataSources.inGame.CP.zombies.consumableDeckSlot5FillingVisible = DataSources.inGame.CP.zombies.consumableDeckSlot5FillPercent:Filter( "zombie_deck_slot_5_filling", f0_local68 )
	DataSources.inGame.CP.zombies.coaster1Ent = LUI.DataSourceFromOmnvar.new( "zm_coaster1_ent" )
	DataSources.inGame.CP.zombies.coaster2Ent = LUI.DataSourceFromOmnvar.new( "zm_coaster2_ent" )
	DataSources.inGame.CP.zombies.coasterScoreP1C1 = LUI.DataSourceFromOmnvar.new( "zm_coaster_score_p1_c1" )
	DataSources.inGame.CP.zombies.coasterScoreP2C1 = LUI.DataSourceFromOmnvar.new( "zm_coaster_score_p2_c1" )
	DataSources.inGame.CP.zombies.coasterScoreP1C2 = LUI.DataSourceFromOmnvar.new( "zm_coaster_score_p1_c2" )
	DataSources.inGame.CP.zombies.coasterScoreP2C2 = LUI.DataSourceFromOmnvar.new( "zm_coaster_score_p2_c2" )
	DataSources.inGame.CP.zombies.coasterHighScoreP1 = LUI.DataSourceFromOmnvar.new( "zm_coaster_hiscore_p1" )
	DataSources.inGame.CP.zombies.coasterHighScoreP2 = LUI.DataSourceFromOmnvar.new( "zm_coaster_hiscore_p2" )
	DataSources.inGame.CP.zombies.coasterHighScoreP3 = LUI.DataSourceFromOmnvar.new( "zm_coaster_hiscore_p3" )
	DataSources.inGame.CP.zombies.coasterHighScoreP4 = LUI.DataSourceFromOmnvar.new( "zm_coaster_hiscore_p4" )
	DataSources.inGame.CP.zombies.coasterPicP1 = LUI.DataSourceFromOmnvar.new( "zm_coaster_pic_p1" )
	DataSources.inGame.CP.zombies.coasterPicP2 = LUI.DataSourceFromOmnvar.new( "zm_coaster_pic_p2" )
	DataSources.inGame.CP.zombies.coasterPicP3 = LUI.DataSourceFromOmnvar.new( "zm_coaster_pic_p3" )
	DataSources.inGame.CP.zombies.coasterPicP4 = LUI.DataSourceFromOmnvar.new( "zm_coaster_pic_p4" )
	DataSources.inGame.CP.zombies.coasterTickets = LUI.DataSourceFromOmnvar.new( "zombie_coaster_ticket_earned" )
	DataSources.inGame.CP.zombies.interactionNotificationCost = LUI.DataSourceFromOmnvar.new( "zm_interaction_cost" )
	DataSources.inGame.CP.zombies.interactionNotificationEnt = LUI.DataSourceFromOmnvar.new( "zm_interaction_ent" )
	DataSources.inGame.CP.zombies.interactionNotificationAmount = LUI.FilteredDataSource.new( DataSources.inGame.CP.zombies.interactionNotificationCost, "zm_interaction_amount", f0_local88 )
	DataSources.inGame.CP.zombies.interactionNotificationAlphaFilter = LUI.FilteredDataSource.new( DataSources.inGame.CP.zombies.interactionNotificationCost, "zm_interaction_cost_alpha", f0_local87 )
	DataSources.inGame.CP.zombies.clownToothArcadePower = LUI.DataSourceFromOmnvar.new( "zombie_arcade_clowntooth_power_1" )
	DataSources.inGame.CP.zombies.clownToothArcadeScore = LUI.DataSourceFromOmnvar.new( "zombie_arcade_clowntooth_score_1" )
	DataSources.inGame.CP.zombies.clownToothAfterlifeArcadePower = LUI.DataSourceFromOmnvar.new( "zombie_arcade_clowntooth_power_2" )
	DataSources.inGame.CP.zombies.clownToothAfterlifeArcadeScore = LUI.DataSourceFromOmnvar.new( "zombie_arcade_clowntooth_score_2" )
	DataSources.inGame.CP.zombies.skeeballArcadePower = LUI.DataSourceFromOmnvar.new( "zombie_arcade_skeeball_power_1" )
	DataSources.inGame.CP.zombies.gameHelper = LUI.DataSourceFromOmnvar.new( "zombie_ca_widget" )
	DataSources.inGame.CP.zombies.bballHelper = LUI.DataSourceFromOmnvar.new( "zombie_bball_widget" )
	DataSources.inGame.CP.zombies.bfpHelper = LUI.DataSourceFromOmnvar.new( "zombie_bfp_widget" )
	DataSources.inGame.CP.zombies.zzHelper = LUI.DataSourceFromOmnvar.new( "zombie_zz_widget" )
	DataSources.inGame.CP.zombies.arcadeHelper = LUI.DataSourceFromOmnvar.new( "zombie_arcade_widget" )
	DataSources.inGame.CP.zombies.arcadeSkeeballScore = LUI.DataSourceFromOmnvar.new( "zombie_arcade_skeeball_score_1" )
	DataSources.inGame.CP.zombies.arcadeSkeeballBalls = LUI.DataSourceFromOmnvar.new( "zombie_arcade_skeeball_balls_1" )
	DataSources.inGame.CP.zombies.inAfterlifeArcade = LUI.DataSourceFromOmnvar.new( "zm_ui_player_in_afterlife_arcade" )
	DataSources.inGame.CP.zombies.afterlifeSkeeballArcadePower = LUI.DataSourceFromOmnvar.new( "zombie_arcade_skeeball_power_2" )
	DataSources.inGame.CP.zombies.afterlifeArcadeSkeeballScore = LUI.DataSourceFromOmnvar.new( "zombie_arcade_skeeball_score_2" )
	DataSources.inGame.CP.zombies.afterlifeArcadeSkeeballBalls = LUI.DataSourceFromOmnvar.new( "zombie_arcade_skeeball_balls_2" )
	DataSources.inGame.CP.zombies.afterlifeSoulPowerEarned = LUI.DataSourceFromOmnvar.new( "zombie_afterlife_soul_power_earned" )
	DataSources.inGame.CP.zombies.afterlifeSoulPowerNeeded = LUI.DataSourceFromOmnvar.new( "zombie_afterlife_soul_power_needed" )
	DataSources.inGame.CP.zombies.afterlifeSoulPowerGoal = LUI.DataSourceFromOmnvar.new( "zombie_afterlife_soul_power_goal" )
	DataSources.inGame.CP.zombies.afterlifeSoulPowerAlpha = DataSources.inGame.CP.zombies.afterlifeSoulPowerNeeded:Filter( "zombie_afterlife_soul_power_alpha", f0_local70 )
	DataSources.inGame.CP.zombies.afterlifeHasSelfReviveToken = LUI.DataSourceFromOmnvar.new( "zombie_afterlife_has_self_revive_token" )
	DataSources.inGame.CP.zombies.afterlifeSelfReviveTokenCount = LUI.DataSourceFromOmnvar.new( "zombie_afterlife_self_revive_count" )
	DataSources.inGame.CP.zombies.clownToothArcadeBalls = LUI.DataSourceFromOmnvar.new( "zombie_arcade_clowntooth_balls" )
	DataSources.inGame.CP.zombies.clownToothAfterlifeBalls = LUI.DataSourceFromOmnvar.new( "zombie_afterlife_clowntooth_balls" )
	DataSources.inGame.CP.zombies.xpReward = LUI.DataSourceFromOmnvar.new( "zom_xp_reward" )
	DataSources.inGame.CP.zombies.xpRewardNotify = LUI.DataSourceFromOmnvar.new( "zom_xp_notify" )
	DataSources.inGame.CP.zombies.arcadeRacingPower = LUI.DataSourceFromOmnvar.new( "zombie_arcade_race_power" )
	DataSources.inGame.CP.zombies.arcadeRacingCountdown = LUI.DataSourceFromOmnvar.new( "zombie_arcade_race_countdown" )
	DataSources.inGame.CP.zombies.afterlifeRacingCountdown = LUI.DataSourceFromOmnvar.new( "zombie_afterlife_race_countdown" )
	DataSources.inGame.CP.zombies.zomCoasterInfo = LUI.DataSourceFromOmnvar.new( "zombie_coasterInfo" )
	DataSources.inGame.CP.zombies.zomPapTimer = LUI.DataSourceFromOmnvar.new( "zombie_papTimer" )
	DataSources.inGame.CP.zombies.venomxTimer = LUI.DataSourceFromOmnvar.new( "zombie_venomxTimer" )
	DataSources.inGame.CP.zombies.countdown = LUI.DataSourceFromOmnvar.new( "zm_ui_timer" )
	DataSources.inGame.CP.zombies.teamDoors = {}
	DataSources.inGame.CP.zombies.teamDoorsBitField = LUI.DataSourceFromOmnvar.new( "zombie_doors_progress" )
	DataSources.inGame.CP.zombies.secureState = LUI.DataSourceFromOmnvar.new( "ui_securing" )
	DataSources.inGame.CP.zombies.secureProgress = LUI.DataSourceFromOmnvar.new( "ui_securing_progress" )
	if Engine.GetDvarString( "ui_mapname" ) ~= "cp_zmb" then
		DataSources.inGame.CP.zombies.quests.harpoonLock1Alpha = DataSources.inGame.CP.zombies.quests.questPieceBits:Filter( "quest_harpoon_lock_1_alpha", f0_local28( 1 ) )
		DataSources.inGame.CP.zombies.quests.harpoonLock2Alpha = DataSources.inGame.CP.zombies.quests.questPieceBits:Filter( "quest_harpoon_lock_2_alpha", f0_local28( 3 ) )
		DataSources.inGame.CP.zombies.quests.harpoonLock3Alpha = DataSources.inGame.CP.zombies.quests.questPieceBits:Filter( "quest_harpoon_lock_3_alpha", f0_local28( 4 ) )
		DataSources.inGame.CP.zombies.questsDLC1.questCompleteBits = LUI.DataSourceFromOmnvar.new( "zm_completed_quest_marks" )
		DataSources.inGame.CP.zombies.questsDLC1.boatQuestCompleteAlphaFilter = DataSources.inGame.CP.zombies.questsDLC1.questCompleteBits:Filter( "quest_complete_boat", f0_local98( 1 ) )
		DataSources.inGame.CP.zombies.questsDLC1.harpoonQuestCompleteAlphaFilter = DataSources.inGame.CP.zombies.questsDLC1.questCompleteBits:Filter( "quest_complete_harpoon", f0_local98( 2 ) )
		DataSources.inGame.CP.zombies.questsDLC1.papQuestCompleteAlphaFilter = DataSources.inGame.CP.zombies.questsDLC1.questCompleteBits:Filter( "quest_complete_pap", f0_local98( 3 ) )
		DataSources.inGame.CP.zombies.questsDLC1.jayQuestCompleteAlphaFilter = DataSources.inGame.CP.zombies.questsDLC1.questCompleteBits:Filter( "quest_complete_jay", f0_local98( 4 ) )
		DataSources.inGame.CP.zombies.questsDLC1.liferayCompleteAlphaFilter = DataSources.inGame.CP.zombies.questsDLC1.questCompleteBits:Filter( "quest_complete_liferay", f0_local98( 5 ) )
		DataSources.inGame.CP.zombies.questsDLC1.chemBeakerPlacedAlphaFilter = DataSources.inGame.CP.zombies.questsDLC1.questCompleteBits:Filter( "quest_complete_beaker_placed", f0_local98( 6 ) )
		DataSources.inGame.CP.zombies.questsDLC1.chemBurnerPlacedAlphaFilter = DataSources.inGame.CP.zombies.questsDLC1.questCompleteBits:Filter( "quest_complete_burner_placed", f0_local98( 7 ) )
		DataSources.inGame.CP.zombies.questsDLC1.chemClampPlacedAlphaFilter = DataSources.inGame.CP.zombies.questsDLC1.questCompleteBits:Filter( "quest_complete_clamp_placed", f0_local98( 8 ) )
		DataSources.inGame.CP.zombies.questsDLC1.charmQuestBits = LUI.DataSourceFromOmnvar.new( "zm_secondary_quest_pieces" )
		DataSources.inGame.CP.zombies.questsDLC1.charmBinocularsAlphaFilter = DataSources.inGame.CP.zombies.questsDLC1.charmQuestBits:Filter( "charm_binoculars_alpha", f0_local27( 1 ) )
		DataSources.inGame.CP.zombies.questsDLC1.charmShovelAlphaFilter = DataSources.inGame.CP.zombies.questsDLC1.charmQuestBits:Filter( "charm_shovel_alpha", f0_local27( 2 ) )
		DataSources.inGame.CP.zombies.questsDLC1.charmArrowAlphaFilter = DataSources.inGame.CP.zombies.questsDLC1.charmQuestBits:Filter( "charm_arrow_alpha", f0_local27( 3 ) )
		DataSources.inGame.CP.zombies.questsDLC1.charmRingAlphaFilter = DataSources.inGame.CP.zombies.questsDLC1.charmQuestBits:Filter( "charm_ring_alpha", f0_local27( 4 ) )
		DataSources.inGame.CP.zombies.questsDLC1.charmBirdheadAlphaFilter = DataSources.inGame.CP.zombies.questsDLC1.charmQuestBits:Filter( "charm_birdhead_alpha", f0_local27( 5 ) )
		DataSources.inGame.CP.zombies.questsDLC1.charmBallAlphaFilter = DataSources.inGame.CP.zombies.questsDLC1.charmQuestBits:Filter( "charm_ball_alpha", f0_local27( 6 ) )
		DataSources.inGame.CP.zombies.questsDLC1.charmFishAlphaFilter = DataSources.inGame.CP.zombies.questsDLC1.charmQuestBits:Filter( "charm_fish_alpha", f0_local27( 7 ) )
		DataSources.inGame.CP.zombies.questsDLC1.charmFrogAlphaFilter = DataSources.inGame.CP.zombies.questsDLC1.charmQuestBits:Filter( "charm_frog_alpha", f0_local27( 8 ) )
		DataSources.inGame.CP.zombies.questsDLC1.charmPacifierAlphaFilter = DataSources.inGame.CP.zombies.questsDLC1.charmQuestBits:Filter( "charm_pacifier_alpha", f0_local27( 9 ) )
		DataSources.inGame.CP.zombies.questsDLC1.charmBootsAlphaFilter = DataSources.inGame.CP.zombies.questsDLC1.charmQuestBits:Filter( "charm_boots_alpha", f0_local27( 10 ) )
		DataSources.inGame.CP.zombies.HUDInventoryDLC1.hudInventory1 = LUI.DataSourceFromOmnvar.new( "zm_hud_inventory_1" )
		DataSources.inGame.CP.zombies.HUDInventoryDLC1.hudInventory1Icon = DataSources.inGame.CP.zombies.HUDInventoryDLC1.hudInventory1:Filter( "zm_hud_inventory_1_Icon", f0_local101 )
		DataSources.inGame.CP.zombies.HUDInventoryDLC1.hudInventory1Alpha = DataSources.inGame.CP.zombies.HUDInventoryDLC1.hudInventory1:Filter( "zm_hud_inventory_1_Alpha", f0_local99 )
		DataSources.inGame.CP.zombies.HUDInventoryDLC1.hudInventory2 = LUI.DataSourceFromOmnvar.new( "zm_hud_inventory_2" )
		DataSources.inGame.CP.zombies.HUDInventoryDLC1.hudInventory2Alpha = DataSources.inGame.CP.zombies.HUDInventoryDLC1.hudInventory2:Filter( "zm_hud_inventory_2_Alpha", f0_local102 )
		local f131_local0 = 32
		DataModel.SetModelValue( DataModel.CreateModel( DataModel.GetGlobalModel(), "cg.CP.zombies.charms.maxCharmCount" ), f131_local0 )
		DataSources.inGame.CP.zombies.charms.maxCharmCount = LUI.DataSourceInGlobalModel.new( "cg.CP.zombies.charms.maxCharmCount" )
		DataSources.inGame.CP.zombies.charms.activeCharmBits = LUI.DataSourceFromOmnvar.new( "zm_charms_active" )
		DataSources.inGame.CP.zombies.charms.activeCharmCount = DataSources.inGame.CP.zombies.charms.activeCharmBits:Filter( "activeCharmCount", f0_local100 )
		DataSources.inGame.CP.zombies.charms.activeCharms = LUI.DataSourceFromList.new( DataSources.inGame.CP.zombies.charms.maxCharmCount )
		DataSources.inGame.CP.zombies.charms.activeCharms.charms = {}
		for f131_local1 = 0, f131_local0 - 1, 1 do
			local f131_local4 = f0_local101( f131_local1 - 1 )
			local f131_local5 = "cg.CP.zombies.charms." .. f131_local1 .. "icon"
			DataModel.SetModelValue( DataModel.CreateModel( DataModel.GetGlobalModel(), f131_local5 ), f131_local4 )
			DataSources.inGame.CP.zombies.charms.activeCharms.charms[f131_local1] = {
				icon = LUI.DataSourceInGlobalModel.new( f131_local5 )
			}
		end
		DataSources.inGame.CP.zombies.charms.activeCharms.MakeDataSourceAtIndex = function ( f132_arg0, f132_arg1, f132_arg2 )
			return DataSources.inGame.CP.zombies.charms.activeCharms.charms[f132_arg1]
		end
		
	end
	local f131_local0 = function ( f133_arg0 )
		return function ( f134_arg0 )
			if Engine.IsBitSet( f134_arg0, f133_arg0 + 4 ) then
				return 5
			elseif Engine.IsBitSet( f134_arg0, f133_arg0 + 3 ) then
				return 4
			elseif Engine.IsBitSet( f134_arg0, f133_arg0 + 2 ) then
				return 3
			elseif Engine.IsBitSet( f134_arg0, f133_arg0 + 1 ) then
				return 2
			elseif Engine.IsBitSet( f134_arg0, f133_arg0 + 0 ) then
				return 1
			else
				return 0
			end
		end
		
	end
	
	if Engine.GetDvarString( "ui_mapname" ) ~= "cp_zmb" then
		DataSources.inGame.CP.zombies.dlc1.raveMode = LUI.DataSourceFromOmnvar.new( "zm_ui_show_general" )
		DataSources.inGame.CP.zombies.dlc1.raveODMode = LUI.DataSourceFromOmnvar.new( "zm_ui_general_two" )
		DataSources.inGame.CP.zombies.dlc1.raveFill = LUI.DataSourceFromOmnvar.new( "zom_general_fill_percent" )
	end
	if Engine.GetDvarString( "ui_mapname" ) == "cp_disco" or Engine.GetDvarString( "ui_mapname" ) == "cp_town" then
		DataSources.inGame.CP.zombies.dlc2.chiStyleIcon = DataSources.inGame.CP.zombies.dlc1.raveMode:Filter( "chi_animal_icon", f0_local105 )
		DataSources.inGame.CP.zombies.dlc2.chiChallengeBits = LUI.DataSourceFromOmnvar.new( "zm_challenges_completed" )
		DataSources.inGame.CP.zombies.dlc2.snake1AlphaFilter = DataSources.inGame.CP.zombies.dlc2.chiChallengeBits:Filter( "snake1_alpha", f0_local103( 1 ) )
		DataSources.inGame.CP.zombies.dlc2.snake2AlphaFilter = DataSources.inGame.CP.zombies.dlc2.chiChallengeBits:Filter( "snake2_alpha", f0_local103( 2 ) )
		DataSources.inGame.CP.zombies.dlc2.snake3AlphaFilter = DataSources.inGame.CP.zombies.dlc2.chiChallengeBits:Filter( "snake3_alpha", f0_local103( 3 ) )
		DataSources.inGame.CP.zombies.dlc2.tiger1AlphaFilter = DataSources.inGame.CP.zombies.dlc2.chiChallengeBits:Filter( "tiger1_alpha", f0_local103( 4 ) )
		DataSources.inGame.CP.zombies.dlc2.tiger2AlphaFilter = DataSources.inGame.CP.zombies.dlc2.chiChallengeBits:Filter( "tiger2_alpha", f0_local103( 5 ) )
		DataSources.inGame.CP.zombies.dlc2.tiger3AlphaFilter = DataSources.inGame.CP.zombies.dlc2.chiChallengeBits:Filter( "tiger3_alpha", f0_local103( 6 ) )
		DataSources.inGame.CP.zombies.dlc2.crane1AlphaFilter = DataSources.inGame.CP.zombies.dlc2.chiChallengeBits:Filter( "crane1_alpha", f0_local103( 7 ) )
		DataSources.inGame.CP.zombies.dlc2.crane2AlphaFilter = DataSources.inGame.CP.zombies.dlc2.chiChallengeBits:Filter( "crane2_alpha", f0_local103( 8 ) )
		DataSources.inGame.CP.zombies.dlc2.crane3AlphaFilter = DataSources.inGame.CP.zombies.dlc2.chiChallengeBits:Filter( "crane3_alpha", f0_local103( 9 ) )
		DataSources.inGame.CP.zombies.dlc2.dragon1AlphaFilter = DataSources.inGame.CP.zombies.dlc2.chiChallengeBits:Filter( "dragon1_alpha", f0_local103( 10 ) )
		DataSources.inGame.CP.zombies.dlc2.dragon2AlphaFilter = DataSources.inGame.CP.zombies.dlc2.chiChallengeBits:Filter( "dragon2_alpha", f0_local103( 11 ) )
		DataSources.inGame.CP.zombies.dlc2.dragon3AlphaFilter = DataSources.inGame.CP.zombies.dlc2.chiChallengeBits:Filter( "dragon3_alpha", f0_local103( 12 ) )
		DataSources.inGame.CP.zombies.dlc2.allStylesAlphaFilter = DataSources.inGame.CP.zombies.dlc2.chiChallengeBits:Filter( "all_styles_alpha", f0_local103( 13 ) )
		DataSources.inGame.CP.zombies.dlc2.snake1BackingAlphaFilter = DataSources.inGame.CP.zombies.dlc2.chiChallengeBits:Filter( "snake1_backing_alpha", f0_local104( 1 ) )
		DataSources.inGame.CP.zombies.dlc2.snake2BackingAlphaFilter = DataSources.inGame.CP.zombies.dlc2.chiChallengeBits:Filter( "snake2_backing_alpha", f0_local104( 2 ) )
		DataSources.inGame.CP.zombies.dlc2.snake3BackingAlphaFilter = DataSources.inGame.CP.zombies.dlc2.chiChallengeBits:Filter( "snake3_backing_alpha", f0_local104( 3 ) )
		DataSources.inGame.CP.zombies.dlc2.tiger1BackingAlphaFilter = DataSources.inGame.CP.zombies.dlc2.chiChallengeBits:Filter( "tiger1_backing_alpha", f0_local104( 4 ) )
		DataSources.inGame.CP.zombies.dlc2.tiger2BackingAlphaFilter = DataSources.inGame.CP.zombies.dlc2.chiChallengeBits:Filter( "tiger2_backing_alpha", f0_local104( 5 ) )
		DataSources.inGame.CP.zombies.dlc2.tiger3BackingAlphaFilter = DataSources.inGame.CP.zombies.dlc2.chiChallengeBits:Filter( "tiger3_backing_alpha", f0_local104( 6 ) )
		DataSources.inGame.CP.zombies.dlc2.crane1BackingAlphaFilter = DataSources.inGame.CP.zombies.dlc2.chiChallengeBits:Filter( "crane1_backing_alpha", f0_local104( 7 ) )
		DataSources.inGame.CP.zombies.dlc2.crane2BackingAlphaFilter = DataSources.inGame.CP.zombies.dlc2.chiChallengeBits:Filter( "crane2_backing_alpha", f0_local104( 8 ) )
		DataSources.inGame.CP.zombies.dlc2.crane3BackingAlphaFilter = DataSources.inGame.CP.zombies.dlc2.chiChallengeBits:Filter( "crane3_backing_alpha", f0_local104( 9 ) )
		DataSources.inGame.CP.zombies.dlc2.dragon1BackingAlphaFilter = DataSources.inGame.CP.zombies.dlc2.chiChallengeBits:Filter( "dragon1_backing_alpha", f0_local104( 10 ) )
		DataSources.inGame.CP.zombies.dlc2.dragon2BackingAlphaFilter = DataSources.inGame.CP.zombies.dlc2.chiChallengeBits:Filter( "dragon2_backing_alpha", f0_local104( 11 ) )
		DataSources.inGame.CP.zombies.dlc2.dragon3BackingAlphaFilter = DataSources.inGame.CP.zombies.dlc2.chiChallengeBits:Filter( "dragon3_backing_alpha", f0_local104( 12 ) )
		DataSources.inGame.CP.zombies.dlc2.chiStyleInvSnakeGlowFilter = DataSources.inGame.CP.zombies.dlc1.raveMode:Filter( "chi_inv_snake_glow", f0_local110 )
		DataSources.inGame.CP.zombies.dlc2.chiStyleInvCraneGlowFilter = DataSources.inGame.CP.zombies.dlc1.raveMode:Filter( "chi_inv_crane_glow", f0_local112 )
		DataSources.inGame.CP.zombies.dlc2.chiStyleInvTigerGlowFilter = DataSources.inGame.CP.zombies.dlc1.raveMode:Filter( "chi_inv_tiger_glow", f0_local111 )
		DataSources.inGame.CP.zombies.dlc2.chiStyleInvDragonGlowFilter = DataSources.inGame.CP.zombies.dlc1.raveMode:Filter( "chi_inv_dragon_glow", f0_local113 )
		DataSources.inGame.CP.zombies.dlc2.chiStyleInvSnakeAlphaFilter = DataSources.inGame.CP.zombies.dlc1.raveMode:Filter( "chi_inv_snake_alpha", f0_local106 )
		DataSources.inGame.CP.zombies.dlc2.chiStyleInvCraneAlphaFilter = DataSources.inGame.CP.zombies.dlc1.raveMode:Filter( "chi_inv_crane_alpha", f0_local108 )
		DataSources.inGame.CP.zombies.dlc2.chiStyleInvTigerAlphaFilter = DataSources.inGame.CP.zombies.dlc1.raveMode:Filter( "chi_inv_tiger_alpha", f0_local107 )
		DataSources.inGame.CP.zombies.dlc2.chiStyleInvDragonAlphaFilter = DataSources.inGame.CP.zombies.dlc1.raveMode:Filter( "chi_inv_dragon_alpha", f0_local109 )
	end
	if Engine.GetDvarString( "ui_mapname" ) == "cp_rave" then
		DataSources.inGame.CP.zombies.challenges.challengeBadgesBits = LUI.DataSourceFromOmnvar.new( "zm_challenges_completed" )
		DataSources.inGame.CP.zombies.challenges.bearBadgeAlphaFilter = DataSources.inGame.CP.zombies.challenges.challengeBadgesBits:Filter( "challenge_badge_bear_alpha", f0_local97( 1 ) )
		DataSources.inGame.CP.zombies.challenges.wolfBadgeAlphaFilter = DataSources.inGame.CP.zombies.challenges.challengeBadgesBits:Filter( "challenge_badge_wolf_alpha", f0_local97( 2 ) )
		DataSources.inGame.CP.zombies.challenges.deerBadgeAlphaFilter = DataSources.inGame.CP.zombies.challenges.challengeBadgesBits:Filter( "challenge_badge_deer_alpha", f0_local97( 3 ) )
		DataSources.inGame.CP.zombies.challenges.owlBadgeAlphaFilter = DataSources.inGame.CP.zombies.challenges.challengeBadgesBits:Filter( "challenge_badge_owl_alpha", f0_local97( 4 ) )
		DataSources.inGame.CP.zombies.challenges.eagleBadgeAlphaFilter = DataSources.inGame.CP.zombies.challenges.challengeBadgesBits:Filter( "challenge_badge_eagle_alpha", f0_local97( 5 ) )
	end
	if Engine.GetDvarString( "ui_mapname" ) == "cp_town" then
		DataSources.inGame.CP.zombies.dlc3.bombFullNuclearCode = LUI.DataSourceFromOmnvar.new( "zm_speaker_defense_timer" )
		DataSources.inGame.CP.zombies.dlc3.bombCounterDisplay = LUI.DataSourceFromOmnvar.new( "zm_ui_dialpad_2" )
		DataSources.inGame.CP.zombies.dlc3.bombCounterDigits = LUI.DataSourceFromOmnvar.new( "zm_ui_dialpad_0" )
		DataSources.inGame.CP.zombies.dlc3.bombCounterDigitsSelected = LUI.DataSourceFromOmnvar.new( "zm_ui_dialpad_3" )
		DataSources.inGame.CP.zombies.dlc3.bombCounterFailedAttempt = LUI.DataSourceFromOmnvar.new( "zm_ui_dialpad_5" )
		DataSources.inGame.CP.zombies.dlc3.bombCodeDisplay = LUI.DataSourceFromOmnvar.new( "zm_ui_dialpad_1" )
		DataSources.inGame.CP.zombies.dlc3.deathRayCannonProgressState = LUI.DataSourceFromOmnvar.new( "zm_ui_num_targets_escaped" )
		DataSources.inGame.CP.zombies.dlc3.elementValueChoice = LUI.DataSourceFromOmnvar.new( "zm_chem_value_choice" )
		DataSources.inGame.CP.zombies.dlc3.elementBadValueChoice = LUI.DataSourceFromOmnvar.new( "zm_chem_bvalue_choice" )
		DataSources.inGame.CP.zombies.dlc3.currentColor = LUI.DataSourceFromOmnvar.new( "zm_chem_current_color" )
		DataSources.inGame.CP.zombies.dlc3.constantLoc1 = LUI.DataSourceFromOmnvar.new( "zm_chem_const_loc_1" )
		DataSources.inGame.CP.zombies.dlc3.constantLoc2 = LUI.DataSourceFromOmnvar.new( "zm_chem_const_loc_2" )
		DataSources.inGame.CP.zombies.dlc3.constantLoc3 = LUI.DataSourceFromOmnvar.new( "zm_chem_const_loc_3" )
		DataSources.inGame.CP.zombies.dlc3.constantLoc4 = LUI.DataSourceFromOmnvar.new( "zm_chem_const_loc_4" )
		DataSources.inGame.CP.zombies.dlc3.constant1Bad = LUI.DataSourceFromOmnvar.new( "zm_chem_const_bad_loc_1" )
		DataSources.inGame.CP.zombies.dlc3.constant1BadAlphaFilter = DataSources.inGame.CP.zombies.dlc3.constant1Bad:Filter( "bad_loc_1_filter", f0_local115 )
		DataSources.inGame.CP.zombies.dlc3.constant2Bad = LUI.DataSourceFromOmnvar.new( "zm_chem_const_bad_loc_2" )
		DataSources.inGame.CP.zombies.dlc3.constant2BadAlphaFilter = DataSources.inGame.CP.zombies.dlc3.constant2Bad:Filter( "bad_loc_2_filter", f0_local115 )
		DataSources.inGame.CP.zombies.dlc3.constant3Bad = LUI.DataSourceFromOmnvar.new( "zm_chem_const_bad_loc_3" )
		DataSources.inGame.CP.zombies.dlc3.constant3BadAlphaFilter = DataSources.inGame.CP.zombies.dlc3.constant3Bad:Filter( "bad_loc_3_filter", f0_local116 )
		DataSources.inGame.CP.zombies.dlc3.constant4Bad = LUI.DataSourceFromOmnvar.new( "zm_chem_const_bad_loc_4" )
		DataSources.inGame.CP.zombies.dlc3.constant4BadAlphaFilter = DataSources.inGame.CP.zombies.dlc3.constant4Bad:Filter( "bad_loc_4_filter", f0_local117 )
		DataSources.inGame.CP.zombies.dlc3.elementIndex = LUI.DataSourceFromOmnvar.new( "zm_chem_element_index" )
		DataSources.inGame.CP.zombies.dlc3.elementIndexAlphaFilter = DataSources.inGame.CP.zombies.dlc3.elementIndex:Filter( "element_index_alpha", f0_local118 )
		DataSources.inGame.CP.zombies.dlc3.elementBackingAlphaFilter = DataSources.inGame.CP.zombies.dlc3.elementIndex:Filter( "element_backing_alpha", f0_local119 )
		DataSources.inGame.CP.zombies.dlc3.elementIndexIconFilter = DataSources.inGame.CP.zombies.dlc3.elementIndex:Filter( "element_index_icon", f0_local120 )
		DataSources.inGame.CP.zombies.dlc3.elementIndexNameFilter = DataSources.inGame.CP.zombies.dlc3.elementIndex:Filter( "element_index_name", f0_local121 )
		DataSources.inGame.CP.zombies.dlc3.colorKeyValue = LUI.DataSourceFromOmnvar.new( "zm_chem_color_key_value" )
		DataSources.inGame.CP.zombies.dlc3.colorKeySlot = LUI.DataSourceFromOmnvar.new( "zm_chem_color_key_slot" )
		DataSources.inGame.CP.zombies.dlc3.colorKeyRand = LUI.DataSourceFromOmnvar.new( "zm_chem_color_key_rnd" )
		DataSources.inGame.CP.zombies.dlc3.colorCorrect = LUI.DataSourceFromOmnvar.new( "zm_chem_correct_color" )
		DataSources.inGame.CP.zombies.dlc3.constantPiValue = LUI.DataSourceFromOmnvar.new( "zm_chem_pi_constant" )
		DataSources.inGame.CP.zombies.dlc3.compoundSlot1Index = LUI.DataSourceFromOmnvar.new( "zm_chem_compound_slot_1_idx" )
		DataSources.inGame.CP.zombies.dlc3.compoundSlot1NameFilter = DataSources.inGame.CP.zombies.dlc3.compoundSlot1Index:Filter( "compound_slot_1_name", f0_local121 )
		DataSources.inGame.CP.zombies.dlc3.compoundSlot1AlphaFilter = DataSources.inGame.CP.zombies.dlc3.compoundSlot1Index:Filter( "compound_slot_1_alpha", f0_local118 )
		DataSources.inGame.CP.zombies.dlc3.compoundSlot2Index = LUI.DataSourceFromOmnvar.new( "zm_chem_compound_slot_2_idx" )
		DataSources.inGame.CP.zombies.dlc3.compoundSlot2NameFilter = DataSources.inGame.CP.zombies.dlc3.compoundSlot2Index:Filter( "compound_slot_2_name", f0_local121 )
		DataSources.inGame.CP.zombies.dlc3.compoundSlot2AlphaFilter = DataSources.inGame.CP.zombies.dlc3.compoundSlot2Index:Filter( "compound_slot_2_alpha", f0_local118 )
		DataSources.inGame.CP.zombies.dlc3.compoundSlot3Index = LUI.DataSourceFromOmnvar.new( "zm_chem_compound_slot_3_idx" )
		DataSources.inGame.CP.zombies.dlc3.compoundSlot3NameFilter = DataSources.inGame.CP.zombies.dlc3.compoundSlot3Index:Filter( "compound_slot_3_name", f0_local121 )
		DataSources.inGame.CP.zombies.dlc3.compoundSlot3AlphaFilter = DataSources.inGame.CP.zombies.dlc3.compoundSlot3Index:Filter( "compound_slot_3_alpha", f0_local118 )
		DataSources.inGame.CP.zombies.dlc3.compoundSlot4Index = LUI.DataSourceFromOmnvar.new( "zm_chem_compound_slot_4_idx" )
		DataSources.inGame.CP.zombies.dlc3.compoundSlot4NameFilter = DataSources.inGame.CP.zombies.dlc3.compoundSlot4Index:Filter( "compound_slot_4_name", f0_local121 )
		DataSources.inGame.CP.zombies.dlc3.compoundSlot4AlphaFilter = DataSources.inGame.CP.zombies.dlc3.compoundSlot4Index:Filter( "compound_slot_4_alpha", f0_local118 )
	end
	DataSources.inGame.CP.zombies.dlc3.vialFill = LUI.DataSourceFromOmnvar.new( "zom_general_fill_percent_2" )
	if Engine.GetDvarString( "ui_mapname" ) == "cp_final" then
		DataSources.inGame.CP.zombies.dlc4.ghostStepFollowLightTimer = LUI.DataSourceFromOmnvar.new( "zom_gns_timer_percent" )
		DataSources.inGame.CP.zombies.dlc4.showGhostStepFollowLightTimer = LUI.DataSourceFromOmnvar.new( "zom_show_gns_timer" )
		DataSources.inGame.CP.zombies.dlc4.floppyCount = LUI.DataSourceFromOmnvar.new( "zm_floppy_count" )
		DataSources.inGame.CP.zombies.dlc4.scrapCount = LUI.DataSourceFromOmnvar.new( "zm_scrap_count" )
		DataSources.inGame.CP.zombies.dlc4.neilState = LUI.DataSourceFromOmnvar.new( "zm_neil_state" )
		DataSources.inGame.CP.zombies.dlc4.venomxState = LUI.DataSourceFromOmnvar.new( "zm_venomx_state" )
		DataSources.inGame.CP.zombies.dlc4.vialFillNumber = DataSources.inGame.CP.zombies.dlc3.vialFill:Filter( "fill_percent_number", f0_local122 )
	end
	DataSources.inGame.CP.zombies.dlc4.mephBattle = LUI.DataSourceFromOmnvar.new( "zm_meph_battle" )
	local f131_local1 = function ( f135_arg0 )
		return f135_arg0 < 5
	end
	
	DataSources.inGame.CP.zombies.teamDoors.kepler = {}
	DataSources.inGame.CP.zombies.teamDoors.moon = {}
	DataSources.inGame.CP.zombies.teamDoors.triton = {}
	DataSources.inGame.CP.zombies.teamDoors.kepler.progress = DataSources.inGame.CP.zombies.teamDoorsBitField:Filter( "keplerDoor", f131_local0( 0 ) )
	DataSources.inGame.CP.zombies.teamDoors.moon.progress = DataSources.inGame.CP.zombies.teamDoorsBitField:Filter( "moonDoor", f131_local0( 10 ) )
	DataSources.inGame.CP.zombies.teamDoors.triton.progress = DataSources.inGame.CP.zombies.teamDoorsBitField:Filter( "tritonDoor", f131_local0( 5 ) )
	DataSources.inGame.CP.zombies.teamDoors.kepler.visible = DataSources.inGame.CP.zombies.teamDoors.kepler.progress:Filter( "keplerVisible", f131_local1 )
	DataSources.inGame.CP.zombies.teamDoors.moon.visible = DataSources.inGame.CP.zombies.teamDoors.moon.progress:Filter( "moonVisible", f131_local1 )
	DataSources.inGame.CP.zombies.teamDoors.triton.visible = DataSources.inGame.CP.zombies.teamDoors.triton.progress:Filter( "tritonVisible", f131_local1 )
	DataSources.inGame.CP.zombies.teamDoors.kepler.backVisible = LUI.AggregateDataSource.new( DataSources.inGame.CP.zombies.teamDoors.kepler.progress, {
		DataSources.inGame.CP.zombies.teamDoors.kepler.visible,
		DataSources.inGame.CP.zombies.teamDoors.triton.visible,
		DataSources.inGame.CP.zombies.teamDoors.moon.visible
	}, "keplerBackVisible", function ( f136_arg0 )
		local f136_local0 = DataSources.inGame.CP.zombies.teamDoors.kepler.visible:GetValue( f136_arg0 )
		local f136_local1 = DataSources.inGame.CP.zombies.teamDoors.moon.visible:GetValue( f136_arg0 )
		local f136_local2 = DataSources.inGame.CP.zombies.teamDoors.triton.visible:GetValue( f136_arg0 )
		local f136_local3 = f136_local0
		local f136_local4
		if f136_local1 then
			f136_local4 = not f136_local2
		else
			f136_local4 = f136_local3 and true
		end
		return f136_local4
	end )
	DataSources.inGame.CP.zombies.teamDoors.moon.backVisible = LUI.AggregateDataSource.new( DataSources.inGame.CP.zombies.teamDoors.moon.progress, {
		DataSources.inGame.CP.zombies.teamDoors.kepler.visible,
		DataSources.inGame.CP.zombies.teamDoors.triton.visible,
		DataSources.inGame.CP.zombies.teamDoors.moon.visible
	}, "moonBackVisible", function ( f137_arg0 )
		local f137_local0 = DataSources.inGame.CP.zombies.teamDoors.kepler.visible:GetValue( f137_arg0 )
		local f137_local1 = DataSources.inGame.CP.zombies.teamDoors.moon.visible:GetValue( f137_arg0 )
		local f137_local2 = DataSources.inGame.CP.zombies.teamDoors.triton.visible:GetValue( f137_arg0 )
		local f137_local3 = f137_local1
		local f137_local4
		if f137_local0 then
			f137_local4 = not f137_local2
		else
			f137_local4 = f137_local3 and true
		end
		return f137_local4
	end )
	DataSources.inGame.CP.zombies.teamDoors.triton.backVisible = LUI.AggregateDataSource.new( DataSources.inGame.CP.zombies.teamDoors.triton.progress, {
		DataSources.inGame.CP.zombies.teamDoors.kepler.visible,
		DataSources.inGame.CP.zombies.teamDoors.triton.visible,
		DataSources.inGame.CP.zombies.teamDoors.moon.visible
	}, "tritonBackVisible", function ( f138_arg0 )
		local f138_local0 = DataSources.inGame.CP.zombies.teamDoors.kepler.visible:GetValue( f138_arg0 )
		local f138_local1 = DataSources.inGame.CP.zombies.teamDoors.moon.visible:GetValue( f138_arg0 )
		local f138_local2 = DataSources.inGame.CP.zombies.teamDoors.triton.visible:GetValue( f138_arg0 )
		local f138_local3
		if f138_local1 then
			f138_local3 = not f138_local0
		else
			f138_local3 = f138_local2 and true
		end
		return f138_local3
	end )
	DataModel.SetModelValue( DataModel.CreateModel( DataModel.GetGlobalModel(), "cg.CP.zombies.cards.maxCardCount" ), 5 )
	DataSources.inGame.CP.zombies.cards.maxCardCount = LUI.DataSourceInGlobalModel.new( "cg.CP.zombies.cards.maxCardCount" )
	DataSources.inGame.CP.zombies.cards.activeCardBits = LUI.DataSourceFromOmnvar.new( "zm_card_fill_display" )
	DataSources.inGame.CP.zombies.cards.activeCardCount = DataSources.inGame.CP.zombies.cards.activeCardBits:Filter( "activeCardCount", f0_local82 )
	DataSources.inGame.CP.zombies.cards.activeCards = LUI.DataSourceFromList.new( DataSources.inGame.CP.zombies.cards.maxCardCount )
	DataSources.inGame.CP.zombies.cards.activeCards.MakeDataSourceAtIndex = function ( f139_arg0, f139_arg1, f139_arg2 )
		local f139_local0 = DataSources.alwaysLoaded.playerData.CP.zombiePlayerLoadout.zombie_consumables[f139_arg1 - 1]
		local f139_local1 = LUI.DataSourceFromOmnvar.new( "zm_card" .. f139_arg1 .. "_drain" )
		return {
			icon = f139_local0:Filter( "icon", f0_local55 ),
			name = f139_local0:Filter( "name", f0_local58 ),
			fill = f139_local1,
			fillVisible = f139_local1:Filter( "fillVisible", f0_local68 )
		}
	end
	
	local f131_local3 = 32
	DataSources.inGame.CP.zombies.perks.muleMunchiesWeapIcon = LUI.DataSourceFromOmnvar.new( "zm_mule_munchies_weapon_icon" )
	DataModel.SetModelValue( DataModel.CreateModel( DataModel.GetGlobalModel(), "cg.CP.zombies.perks.maxPerkCount" ), f131_local3 )
	DataSources.inGame.CP.zombies.perks.maxPerkCount = LUI.DataSourceInGlobalModel.new( "cg.CP.zombies.perks.maxPerkCount" )
	DataSources.inGame.CP.zombies.perks.activePerkBits = LUI.DataSourceFromOmnvar.new( "zm_active_perks" )
	DataSources.inGame.CP.zombies.perks.activePerkCount = DataSources.inGame.CP.zombies.perks.activePerkBits:Filter( "activePerkCount", f0_local83 )
	DataSources.inGame.CP.zombies.perks.activePerks = LUI.DataSourceFromList.new( DataSources.inGame.CP.zombies.perks.maxPerkCount )
	DataSources.inGame.CP.zombies.perks.activePerks.perks = {}
	for f131_local6 = 0, f131_local3 - 1, 1 do
		local f131_local7 = f0_local89( f131_local6 )
		local f131_local8 = "cg.CP.zombies.perks." .. f131_local6 .. "icon"
		DataModel.SetModelValue( DataModel.CreateModel( DataModel.GetGlobalModel(), f131_local8 ), f131_local7 )
		DataSources.inGame.CP.zombies.perks.activePerks.perks[f131_local6] = {
			icon = LUI.DataSourceInGlobalModel.new( f131_local8 )
		}
	end
	DataSources.inGame.CP.zombies.perks.activePerks.MakeDataSourceAtIndex = function ( f140_arg0, f140_arg1, f140_arg2 )
		return DataSources.inGame.CP.zombies.perks.activePerks.perks[f140_arg1]
	end
	
	local f131_local6 = 32
	DataModel.SetModelValue( DataModel.CreateModel( DataModel.GetGlobalModel(), "cg.CP.zombies.powerups.maxPowerupCount" ), f131_local6 )
	DataSources.inGame.CP.zombies.powerups.activePowerupAnimationBits = LUI.DataSourceFromOmnvar.new( "zm_active_powerup_animation" )
	DataSources.inGame.CP.zombies.powerups.maxPowerupCount = LUI.DataSourceInGlobalModel.new( "cg.CP.zombies.powerups.maxPowerupCount" )
	DataSources.inGame.CP.zombies.powerups.activePowerupBits = LUI.DataSourceFromOmnvar.new( "zm_active_powerups" )
	DataSources.inGame.CP.zombies.powerups.activePowerupCount = DataSources.inGame.CP.zombies.powerups.activePowerupBits:Filter( "activePowerupCount", f0_local84 )
	DataSources.inGame.CP.zombies.powerups.activePowerups = LUI.DataSourceFromList.new( DataSources.inGame.CP.zombies.powerups.maxPowerupCount )
	DataSources.inGame.CP.zombies.powerups.activePowerups.powerups = {}
	local f131_local4 = DataSources.inGame.CP.zombies.powerups
	local f131_local5 = "activePowerupName"
	local f131_local9 = LUI.DataSourceFromOmnvar.new( "zm_powerup_activated" )
	f131_local4[f131_local5] = f131_local9:Filter( "activatedPowerupName", f0_local86 )
	f131_local4 = DataSources.inGame.CP.zombies.powerups
	f131_local5 = "activePowerupIcon"
	f131_local9 = LUI.DataSourceFromOmnvar.new( "zm_powerup_activated" )
	f131_local4[f131_local5] = f131_local9:Filter( "activatedPowerupIcon", f0_local85 )
	DataSources.inGame.CP.zombies.powerups.queue.powerupActivated = LUI.DataSourceFromOmnvar.new( "zm_powerup_activated" )
	DataSources.inGame.CP.zombies.powerups.queue.push = DataSources.inGame.CP.zombies.powerups.queue.powerupActivated:Filter( "powerup_activated_push", f0_local92 )
	DataSources.inGame.CP.zombies.powerups.powerupActivated = LUI.DataSourceInControllerModel.new( "cg.CP.zombies.powerUpActivated" )
	for f131_local4 = 0, f131_local6 - 1, 1 do
		local f131_local8 = f0_local85( f131_local4 )
		local f131_local10 = "cg.CP.zombies.powerups." .. f131_local4 .. "icon"
		DataModel.SetModelValue( DataModel.CreateModel( DataModel.GetGlobalModel(), f131_local10 ), f131_local8 )
		DataSources.inGame.CP.zombies.powerups.activePowerups.powerups[f131_local4] = {
			powerIcon = LUI.DataSourceInGlobalModel.new( f131_local10 )
		}
	end
	DataSources.inGame.CP.zombies.powerups.activePowerups.GetDataSourceAtIndex = function ( f141_arg0, f141_arg1, f141_arg2 )
		return DataSources.inGame.CP.zombies.powerups.activePowerups.powerups[f141_arg1]
	end
	
	f131_local4 = 2
	DataSources.inGame.CP.zombies.reviveBars = {}
	for f131_local5 = 1, f131_local4, 1 do
		DataSources.inGame.CP.zombies.reviveBars[f131_local5] = {
			clientNum = LUI.DataSourceFromOmnvar.new( "zm_revive_bar_" .. f131_local5 .. "_target" ),
			progress = LUI.DataSourceFromOmnvar.new( "zm_revive_bar_" .. f131_local5 .. "_progress" )
		}
	end
end

function InitCommonCPDataSources()
	DataSources.alwaysLoaded.playerData.CP = LUI.DataSourceFromPlayerData.new( CoD.StatsGroup.Coop, CoD.PlayMode.Aliens )
	DataSources.inGame.CP.trimmedPlayerCount = DataSources.inGame.playerCount:Filter( "trimmedPlayerCount", f0_local0 )
	DataSources.inGame.CP.CPPlayerCount = DataSources.inGame.playerCount:Filter( "CPPlayerCount", f0_local1 )
	DataSources.inGame.CP.otherPlayers = LUI.DataSourceFromList.new( DataSources.inGame.CP.trimmedPlayerCount )
	DataSources.inGame.CP.playerCharacter = LUI.DataSourceFromOmnvar.new( "zm_player_character" )
	DataSources.inGame.CP.playerStatus = LUI.DataSourceFromOmnvar.new( "zm_player_status" )
	DataSources.inGame.CP.playerPhoto = LUI.DataSourceFromOmnvar.new( "zm_player_photo" )
	DataSources.inGame.CP.zombies.playersCoins = LUI.DataSourceFromOmnvar.new( "zm_players_souvenir_piece_index" )
	local f142_local0 = DataModel.GetGlobalModel()
	local f142_local1 = {}
	local f142_local2 = {}
	local f142_local3 = {}
	for f142_local4 = 0, 3, 1 do
		local f142_local7 = f142_local4
		f142_local1[f142_local7] = LUI.AggregateDataSource.new( DataSources.inGame.CP.playerPhoto, {
			DataSources.inGame.CP.playerCharacter,
			DataSources.inGame.CP.playerStatus
		}, "image." .. tostring( f142_local7 ), function ( f143_arg0 )
			return ZombiesUtils.GetZombiesPlayerPhoto( DataSources.inGame.CP.playerCharacter:GetValue( f143_arg0 ), DataSources.inGame.CP.playerStatus:GetValue( f143_arg0 ), f142_local7 )
		end )
		f142_local2[f142_local7] = DataSources.inGame.CP.zombies.playersCoins:Filter( tostring( f142_local7 ), function ( f144_arg0, f144_arg1 )
			return f0_local32( ZombiesUtils.GetZombiesPlayerCoin( f144_arg0, f142_local7 ), f144_arg1 )
		end )
		f142_local3[f142_local7] = LUI.AggregateDataSource.new( DataSources.inGame.CP.playerPhoto, {
			DataSources.inGame.CP.playerCharacter,
			DataSources.inGame.CP.playerStatus
		}, "bigImage." .. tostring( f142_local7 ), function ( f145_arg0 )
			return ZombiesUtils.GetZombiesBigPhoto( DataSources.inGame.CP.playerCharacter:GetValue( f145_arg0 ), f142_local7 )
		end )
	end
	DataSources.inGame.CP.otherPlayers.MakeDataSourceAtIndex = function ( f146_arg0, f146_arg1, f146_arg2 )
		if DataSources.inGame.currentPlayerClientNum:GetValue( f146_arg2 ) <= f146_arg1 then
			f146_arg1 = f146_arg1 + 1
		end
		local f146_local0 = f142_local1[f146_arg1]
		local f146_local1 = LUI.DataSourceInGlobalModel.new( "cg.player.gamerTag" )
		local f146_local2 = f146_local1:GetDataSourceForSubmodel( f146_arg1 )
		local f146_local3 = LUI.DataSourceInGlobalModel.new( "cg.CP.cash" )
		local f146_local4 = f146_local3:GetDataSourceForSubmodel( f146_arg1 )
		local f146_local5 = LUI.DataSourceInGlobalModel.new( "cg.CP.score" )
		local f146_local6 = f146_local5:GetDataSourceForSubmodel( f146_arg1 )
		local f146_local7 = LUI.DataSourceInGlobalModel.new( "cg.CP.kills" )
		local f146_local8 = f146_local7:GetDataSourceForSubmodel( f146_arg1 )
		local f146_local9 = LUI.DataSourceInGlobalModel.new( "cg.CP.assists" )
		local f146_local10 = f146_local9:GetDataSourceForSubmodel( f146_arg1 )
		local f146_local11 = LUI.DataSourceInGlobalModel.new( "cg.CP.revives" )
		local f146_local12 = f146_local11:GetDataSourceForSubmodel( f146_arg1 )
		local f146_local13 = LUI.DataSourceInGlobalModel.new( "cg.CP.downs" )
		local f146_local14 = f146_local13:GetDataSourceForSubmodel( f146_arg1 )
		local f146_local15 = LUI.DataSourceInGlobalModel.new( "cg.CP.tickets" )
		return {
			cash = f146_local4,
			gamerTag = f146_local2,
			image = f146_local0,
			score = f146_local6,
			kills = f146_local8,
			assists = f146_local10,
			revives = f146_local12,
			downs = f146_local14,
			tickets = f146_local15:GetDataSourceForSubmodel( f146_arg1 ),
			coinImage = f142_local2[f146_arg1]
		}
	end
	
	DataSources.inGame.CP.players = LUI.DataSourceFromList.new( DataSources.inGame.CP.CPPlayerCount )
	DataSources.inGame.CP.players.MakeDataSourceAtIndex = function ( f147_arg0, f147_arg1, f147_arg2 )
		local f147_local0 = f142_local1[f147_arg1]
		local f147_local1 = f142_local3[f147_arg1]
		local f147_local2 = LUI.DataSourceInGlobalModel.new( "cg.player.gamerTag" )
		local f147_local3 = f147_local2:GetDataSourceForSubmodel( f147_arg1 )
		local f147_local4 = LUI.DataSourceInGlobalModel.new( "cg.CP.cash" )
		local f147_local5 = f147_local4:GetDataSourceForSubmodel( f147_arg1 )
		local f147_local6 = LUI.DataSourceInGlobalModel.new( "cg.CP.score" )
		local f147_local7 = f147_local6:GetDataSourceForSubmodel( f147_arg1 )
		local f147_local8 = LUI.DataSourceInGlobalModel.new( "cg.CP.kills" )
		local f147_local9 = f147_local8:GetDataSourceForSubmodel( f147_arg1 )
		local f147_local10 = LUI.DataSourceInGlobalModel.new( "cg.CP.assists" )
		local f147_local11 = f147_local10:GetDataSourceForSubmodel( f147_arg1 )
		local f147_local12 = LUI.DataSourceInGlobalModel.new( "cg.CP.revives" )
		local f147_local13 = f147_local12:GetDataSourceForSubmodel( f147_arg1 )
		local f147_local14 = LUI.DataSourceInGlobalModel.new( "cg.CP.downs" )
		local f147_local15 = f147_local14:GetDataSourceForSubmodel( f147_arg1 )
		local f147_local16 = LUI.DataSourceInGlobalModel.new( "cg.CP.tickets" )
		return {
			cash = f147_local5,
			gamerTag = f147_local3,
			image = f147_local0,
			bigImage = f147_local1,
			score = f147_local7,
			kills = f147_local9,
			assists = f147_local11,
			revives = f147_local13,
			downs = f147_local15,
			tickets = f147_local16:GetDataSourceForSubmodel( f147_arg1 ),
			coinImage = f142_local2[f147_arg1]
		}
	end
	
	DataSources.inGame.CP.currentPlayerCash = DataSources.alwaysLoaded.playerData.CP.alienSession.currency
end

CHEMISTRY_ELEMENTS_INFO = {}
ELEMENTS_LIST = {
	["1"] = {},
	["2"] = {},
	["3"] = {},
	["4"] = {},
	["5"] = {},
	["6"] = {}
}
function InitElementInfo()
	local f148_local0 = CSV.zombieElements.file
	for f148_local1 = 0, Engine.TableGetRowCount( f148_local0 ), 1 do
		local f148_local4 = Engine.TableLookupByRow( f148_local0, f148_local1, CSV.zombieElements.cols.ref )
		if f148_local4 ~= "" then
			local f148_local5 = CSV.ReadRow( CSV.zombieElements, f148_local1 )
			CHEMISTRY_ELEMENTS_INFO[f148_local4] = {
				index = f148_local5.index,
				ref = f148_local5.ref,
				name = f148_local5.name,
				type = f148_local5.type,
				unique = f148_local5.unique,
				icon = f148_local5.icon,
				slot = f148_local5.slot,
				heatA = f148_local5.heatA,
				pressureA = f148_local5.pressureA,
				heatB = f148_local5.heatB,
				pressureB = f148_local5.pressureB,
				heatC = f148_local5.heatC,
				pressureC = f148_local5.pressureC,
				heatD = f148_local5.heatD,
				pressureD = f148_local5.pressureD,
				heatE = f148_local5.heatE,
				pressureE = f148_local5.pressureE,
				heatF = f148_local5.heatF,
				pressureF = f148_local5.pressureF
			}
		end
	end
end

function InitElementList()
	local f149_local0 = CSV.zombieElements.file
	for f149_local1 = 0, Engine.TableGetRowCount( f149_local0 ), 1 do
		local f149_local4 = Engine.TableLookupByRow( f149_local0, f149_local1, CSV.zombieElements.cols.ref )
		local f149_local5 = Engine.TableLookupByRow( f149_local0, f149_local1, CSV.zombieElements.cols.slot )
		if f149_local4 ~= "" and f149_local5 ~= "" then
			local f149_local6 = ELEMENTS_LIST[f149_local5]
			local f149_local7 = CHEMISTRY_ELEMENTS_INFO[f149_local4]
			f149_local7.ref = f149_local4
			f149_local7.slot = f149_local5
			table.insert( f149_local6, f149_local7 )
		end
	end
end

function InitElementDataSources()
	InitElementList()
	DataSources.inGame.CP.zombies.dlc3.elements = LUI.DataSourceFromList.new( 6 )
	DataSources.inGame.CP.zombies.dlc3.elements.MakeDataSourceAtIndex = function ( f151_arg0, f151_arg1, f151_arg2 )
		return DataSources.inGame.CP.zombies.dlc3.elements["slot" .. f151_arg1]
	end
	
	DataSources.inGame.CP.zombies.dlc3.elements:SetCachingEnabled( true )
	for f150_local9, f150_local10 in pairs( ELEMENTS_LIST ) do
		local f150_local11 = "slot" .. tostring( tonumber( f150_local9 ) - 1 )
		DataSources.inGame.CP.zombies.dlc3.elements[f150_local11] = LUI.DataSourceFromList.new( #f150_local10 )
		DataSources.inGame.CP.zombies.dlc3.elements[f150_local11].MakeDataSourceAtIndex = function ( f152_arg0, f152_arg1, f152_arg2 )
			return DataSources.inGame.CP.zombies.dlc3.elements[f150_local11]["element" .. f152_arg1]
		end
		
		local f150_local12 = DataSources.inGame.CP.zombies.dlc3.elements[f150_local11]
		for f150_local8 = 1, #f150_local10, 1 do
			local f150_local3 = f150_local10[f150_local8]
			local f150_local4 = f150_local3.ref
			local f150_local5 = "element" .. f150_local8 - 1
			if not f150_local12[f150_local5] then
				f150_local12[f150_local5] = {}
			end
			local f150_local6 = f150_local12[f150_local5]
			local f150_local7 = "inGame.CP.zombies.dlc3.elements." .. f150_local4
			f150_local6.ref = LUI.DataSourceInGlobalModel.new( f150_local7 .. ".ref", f150_local4 )
			f150_local6.name = LUI.DataSourceInGlobalModel.new( f150_local7 .. ".name", f150_local3.name )
			f150_local6.type = LUI.DataSourceInGlobalModel.new( f150_local7 .. ".type", f150_local3.type )
			f150_local6.unique = LUI.DataSourceInGlobalModel.new( f150_local7 .. ".unique", f150_local3.unique )
			f150_local6.icon = LUI.DataSourceInGlobalModel.new( f150_local7 .. ".icon", f150_local3.icon )
			f150_local6.slot = LUI.DataSourceInGlobalModel.new( f150_local7 .. ".slot", f150_local3.slot )
			f150_local6.heatA = LUI.DataSourceInGlobalModel.new( f150_local7 .. ".heatA", f150_local3.heatA )
			f150_local6.pressureA = LUI.DataSourceInGlobalModel.new( f150_local7 .. ".pressureA", f150_local3.pressureA )
			f150_local6.heatB = LUI.DataSourceInGlobalModel.new( f150_local7 .. ".heatB", f150_local3.heatB )
			f150_local6.pressureB = LUI.DataSourceInGlobalModel.new( f150_local7 .. ".pressureB", f150_local3.pressureB )
			f150_local6.heatC = LUI.DataSourceInGlobalModel.new( f150_local7 .. ".heatC", f150_local3.heatC )
			f150_local6.pressureC = LUI.DataSourceInGlobalModel.new( f150_local7 .. ".pressureC", f150_local3.pressureC )
			f150_local6.heatD = LUI.DataSourceInGlobalModel.new( f150_local7 .. ".heatD", f150_local3.heatD )
			f150_local6.pressureD = LUI.DataSourceInGlobalModel.new( f150_local7 .. ".pressureD", f150_local3.pressureD )
			f150_local6.heatE = LUI.DataSourceInGlobalModel.new( f150_local7 .. ".heatE", f150_local3.heatE )
			f150_local6.pressureE = LUI.DataSourceInGlobalModel.new( f150_local7 .. ".pressureE", f150_local3.pressureE )
			f150_local6.heatF = LUI.DataSourceInGlobalModel.new( f150_local7 .. ".heatF", f150_local3.heatF )
			f150_local6.pressureF = LUI.DataSourceInGlobalModel.new( f150_local7 .. ".pressureF", f150_local3.pressureF )
			CHEMISTRY_ELEMENTS_INFO[f150_local4].index = f150_local8 - 1
		end
	end
end

