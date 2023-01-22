AAR = {
	Layout = {
		TitleBarHeight = 33,
		SubTitleBarHeight = 31,
		SubTitleBannerWidth = 180,
		SubTitleCapWidth = 20,
		FooterHeight = 38,
		Width = 800,
		Height = 490
	},
	Scoreboard = {
		Layout = {
			Height = 614
		},
		NumRows = 18
	},
	Arrow = {
		Width = 32,
		Height = 64
	},
	Progress = {
		Layout = {
			Height = 453
		}
	},
	NumUnlocksPerPage = 3,
	Swatch = {
		title = SWATCHES.text.primaryText,
		title_2 = SWATCHES.text.secondaryText,
		background = COLORS.grey36,
		background_2 = COLORS.grey56,
		background_3 = COLORS.grey102,
		background_4 = {
			r = 0.12,
			g = 0.12,
			b = 0.12
		},
		background_5 = COLORS.veryDarkCyan,
		trim = COLORS.grey102,
		subtext = COLORS.grey102,
		colorpop = SWATCHES.highlight.frontEnd,
		progressborder = COLORS.white,
		header_text = COLORS.white,
		spacer_1 = COLORS.grey51,
		friendly = COLORS.cyan,
		enemy = COLORS.orange,
		border = SWATCHES.window.borderColor
	},
	TIME_TO_FILL_XP_BAR_MS = 2500,
	UnlockTypes = {
		ALIEN = "alien",
		BACKGROUND = "background",
		BODY = "body",
		CALLING_CARD = "callingCard",
		CAMO = "camo",
		CHALLENGE = "challenge",
		CONSUMABLE = "ZombieConsumable",
		FEATURE = "feature",
		HEAD = "head",
		PATCH = "patch",
		PERK = "perk",
		POWER = "power",
		RIG = "rig",
		TRAIT = "trait",
		SUPER = "super",
		STREAK = "killstreak",
		WEAPON = "weapon",
		CP_WEAPON = "CPWeapon",
		FATE_CARD = "fateCard",
		FATE_DECK_SIZE = "fatedecksize",
		PICK_10 = "pick10",
		ASSAULTATTACH = "assaultAttach",
		DMRATTACH = "dmrAttach",
		LMGATTACH = "lmgAttach",
		MELEEATTACH = "meleeAttach",
		PISTOLATTACH = "pistolAttach",
		PROJECTILEATTACH = "projectileAttach",
		SHOTGUNATTACH = "shotgunAttach",
		SMGATTACH = "smgAttach",
		SNIPERATTACH = "sniperAttach",
		CLASSICATTACH = "classicAttach",
		MTXP = "missionTeamXP"
	}
}
AwardsTable = {
	File = "mp/awardTable.csv",
	Cols = {
		Ref = 1,
		Icon = 2,
		Name = 3,
		Desc = 4
	}
}
FactionTable = {
	File = "mp/factionTable.csv",
	Cols = {
		Ref = 0,
		ColorRed = 14,
		ColorGreen = 15,
		ColorBlue = 16
	}
}
AAR.GetFactionColorRed = function ( f1_arg0 )
	return Engine.TableLookup( FactionTable.File, FactionTable.Cols.Ref, f1_arg0, FactionTable.Cols.ColorRed )
end

AAR.GetFactionColorGreen = function ( f2_arg0 )
	return Engine.TableLookup( FactionTable.File, FactionTable.Cols.Ref, f2_arg0, FactionTable.Cols.ColorGreen )
end

AAR.GetFactionColorBlue = function ( f3_arg0 )
	return Engine.TableLookup( FactionTable.File, FactionTable.Cols.Ref, f3_arg0, FactionTable.Cols.ColorBlue )
end

AAR.GetRoundSquadMember = function ( f4_arg0 )
	return Engine.GetPlayerDataEx( f4_arg0, CoD.StatsGroup.Common, "round", "squadMemberIndex" )
end

AAR.GetRoundMatchXP = function ( f5_arg0 )
	return Engine.GetPlayerDataEx( f5_arg0, CoD.StatsGroup.Common, "round", "matchXp" ) or 0
end

AAR.GetRoundMiscXP = function ( f6_arg0 )
	return Engine.GetPlayerDataEx( f6_arg0, CoD.StatsGroup.Common, "round", "miscXp" ) or 0
end

AAR.GetRoundScoreXP = function ( f7_arg0 )
	return Engine.GetPlayerDataEx( f7_arg0, CoD.StatsGroup.Common, "round", "scoreXp" ) or 0
end

AAR.GetRoundChallengeXP = function ( f8_arg0 )
	return Engine.GetPlayerDataEx( f8_arg0, CoD.StatsGroup.Common, "round", "challengeXp" ) or 0
end

AAR.IsAttachmentUnlockType = function ( f9_arg0 )
	local f9_local0
	if f9_arg0 ~= AAR.UnlockTypes.ASSAULTATTACH and f9_arg0 ~= AAR.UnlockTypes.DMRATTACH and f9_arg0 ~= AAR.UnlockTypes.LMGATTACH and f9_arg0 ~= AAR.UnlockTypes.MELEEATTACH and f9_arg0 ~= AAR.UnlockTypes.PISTOLATTACH and f9_arg0 ~= AAR.UnlockTypes.PROJECTILEATTACH and f9_arg0 ~= AAR.UnlockTypes.SHOTGUNATTACH and f9_arg0 ~= AAR.UnlockTypes.SMGATTACH and f9_arg0 ~= AAR.UnlockTypes.SNIPERATTACH and f9_arg0 ~= AAR.UnlockTypes.CLASSICATTACH then
		f9_local0 = false
	else
		f9_local0 = true
	end
	return f9_local0
end

AAR.GetRoundDoubleXP = function ( f10_arg0 )
	return Engine.GetPlayerDataEx( f10_arg0, CoD.StatsGroup.Common, "common_entitlement_xp" ) or 0
end

AAR.GetRoundClanXP = function ( f11_arg0 )
	return Engine.GetPlayerDataEx( f11_arg0, CoD.StatsGroup.Common, "common_clan_wars_xp" ) or 0
end

AAR.GetTotalUnlockPoints = function ( f12_arg0 )
	return 0 or 0
end

AAR.GetRoundTotalXP = function ( f13_arg0 )
	return Engine.GetPlayerDataEx( f13_arg0, CoD.StatsGroup.Common, "round", "totalXp" ) or 0
end

AAR.GetCareerExperienceForSquadMember = function ( f14_arg0, f14_arg1 )
	return Engine.GetPlayerDataEx( f14_arg0, CoD.StatsGroup.Ranked, "progression", "playerLevel", "xp" ) or 0
end

AAR.GetNumAwards = function ( f15_arg0 )
	return Engine.GetPlayerDataEx( f15_arg0, CoD.StatsGroup.Common, "round", "awardCount" )
end

AAR.GetAccolade = function ( f16_arg0, f16_arg1 )
	return Engine.GetPlayerDataEx( f16_arg0, CoD.StatsGroup.Common, "round", "awards", f16_arg1, "award" )
end

AAR.GetAwardIcon = function ( f17_arg0 )
	return Engine.TableLookup( AwardsTable.File, AwardsTable.Cols.Ref, f17_arg0, AwardsTable.Cols.Icon )
end

AAR.GetAwardName = function ( f18_arg0 )
	return Engine.TableLookup( AwardsTable.File, AwardsTable.Cols.Ref, f18_arg0, AwardsTable.Cols.Name )
end

AAR.GetAwardDesc = function ( f19_arg0 )
	return Engine.TableLookup( AwardsTable.File, AwardsTable.Cols.Ref, f19_arg0, AwardsTable.Cols.Desc )
end

AAR.AreChaosStats = function ( f20_arg0 )
	if not Engine.IsAliensMode() then
		return false
	elseif f20_arg0 == "mugger" then
		return true
	else
		return false
	end
end

AAR.shouldShowRepair = function ()
	return false
end

