Cac = Cac or {}
if Engine.InFrontend() then
	Cac.Weapons = {
		weapon_assault = {
			"iw7_ar57",
			"iw7_ake",
			"iw7_m4",
			"iw7_acr"
		},
		weapon_smg = {
			"iw7_erad",
			"iw7_crb",
			"iw7_ripper",
			"iw7_ump45"
		},
		weapon_lmg = {
			"iw7_ameli"
		},
		weapon_dmr = {
			"iw7_m1"
		},
		weapon_sniper = {
			"iw7_kbs",
			"iw7_m8",
			"iw7_cheytac"
		},
		weapon_shotgun = {
			"iw7_devastator",
			"iw7_spas",
			"iw7_sonic"
		},
		weapon_riot = {
			"iw6_riotshield"
		},
		weapon_pistol = {
			"iw7_nrg",
			"iw7_g18",
			"iw7_emc"
		},
		weapon_projectile = {
			"iw7_glprox",
			"iw7_chargeshot"
		},
		weapon_knife = {},
		weapon_primarydemo = {
			"iw7_glprox"
		},
		weapon_primarymedic = {},
		weapon_primaryreaper = {
			"iw7_reaperblade"
		},
		weapon_beam = {
			"iw7_steeldragon"
		},
		weapon_rail = {
			"iw7_railgun"
		}
	}
	Cac.Perks = {
		ability_speed = {
			"specialty_fastsprintrecovery",
			"specialty_fastreload",
			"specialty_lightweight",
			"specialty_teleport",
			"specialty_stalker"
		},
		ability_handling = {
			"specialty_pitcher",
			"specialty_sprintreload",
			"specialty_quickswap",
			"specialty_bulletaccuracy",
			"specialty_quickdraw"
		},
		ability_stealth = {
			"specialty_silentkill",
			"specialty_blindeye",
			"specialty_quieter",
			"specialty_incog",
			"specialty_gpsjammer"
		},
		ability_awareness = {
			"specialty_paint",
			"specialty_scavenger",
			"specialty_detectexplosive",
			"specialty_selectivehearing",
			"specialty_comexp"
		},
		ability_resistance = {
			"specialty_battleslide",
			"specialty_regenfaster",
			"specialty_reducedsway",
			"specialty_stun_resistance",
			"specialty_blastshield"
		},
		ability_equipment = {
			"specialty_extra_equipment",
			"specialty_extra_deadly",
			"specialty_extraammo",
			"specialty_extra_attachment",
			"specialty_chain_reaction"
		},
		ability_elite = {
			"specialty_gambler",
			"specialty_hardline",
			"specialty_boom",
			"specialty_twoprimaries",
			"specialty_deadeye"
		}
	}
	Cac.Streaks = {
		streaktype_assault = {
			Streaks = {
				"uplink",
				"ims",
				"guard_dog",
				"sentry",
				"drone_hive",
				"helicopter",
				"ball_drone_backup",
				"vanguard",
				"airdrop_juggernaut_maniac",
				"airdrop_juggernaut",
				"heli_pilot",
				"odin_assault"
			},
			Caps = "LUA_MENU_ASSAULT"
		},
		streaktype_support = {
			Streaks = {
				"uplink_support",
				"deployable_ammo",
				"deployable_vest",
				"aa_launcher",
				"ball_drone_radar",
				"recon_agent",
				"jammer",
				"air_superiority",
				"heli_sniper",
				"uav_3dping",
				"airdrop_juggernaut_recon",
				"odin_support"
			},
			Caps = "PATCH_MENU_SUPPORT_CAPS"
		},
		streaktype_specialist = {
			Streaks = {
				Cac.Perks
			},
			Caps = "PATCH_MENU_SPECIALIST_CAPS"
		}
	}
	AttachmentComboTable = {
		File = "mp/attachmentCombos.csv",
		Cols = {
			Ref = 0
		}
	}
end
Cac.Abilities = {
	Types = {
		Speed = 0,
		Handling = 1,
		Stealth = 2,
		Awareness = 3,
		Resistance = 4,
		Equipment = 5,
		Elite = 6
	},
	Refs = {
		None = "ability_null",
		Speed = "ability_speed",
		Handling = "ability_handling",
		Stealth = "ability_stealth",
		Awareness = "ability_awareness",
		Resistance = "ability_resistance",
		Equipment = "ability_equipment",
		Elite = "ability_elite"
	},
	Settings = {
		minSlotsUnlocked = 2,
		maxSlotsUnlocked = 5,
		defaultSlotDistribution = 0,
		GrabBagCapacity = 8,
		SpecialistCapacity = 8,
		AbilitiesNumCategories = 7,
		AbilitiesPerCategory = 5,
		SpecialistAbilityCount = 3
	}
}
Cac.Indices = {
	Weapons = {
		Primary = 0,
		Secondary = 1
	},
	Power = {
		Primary = 0,
		Secondary = 1
	}
}
StatsTable = {
	File = "mp/StatsTable.csv",
	Cols = {
		WeaponRef = 4,
		WeaponClass = 2,
		WeaponName = 3,
		WeaponCount = 5,
		WeaponImage = 6,
		WeaponDesc = 7,
		WeaponAttachFirst = 10,
		WeaponAttachLast = 29,
		WeaponAcc = 30,
		WeaponDam = 31,
		WeaponRng = 32,
		WeaponRof = 33,
		WeaponMob = 34,
		WeaponFullImage = 35,
		WeaponBWImage = 36,
		WeaponProfileImage = 37
	}
}
AttachmentTable = {
	File = "mp/attachmentTable.csv",
	Cols = {
		Group = 2,
		Ref = 4,
		BaseRef = 5,
		Name = 3,
		Image = 6,
		Desc = 7,
		Reticles = 11,
		Perk = 12,
		Slot = 13,
		Acc = 14,
		Dam = 15,
		Rng = 16,
		Rof = 17,
		Mob = 18,
		BotDifficulty = 19,
		ImageFull = 20
	}
}
AttachmentMap = {
	File = "mp/attachmentmap.csv",
	Rows = {
		AttachRef = 0
	},
	Cols = {
		WeapOrClass = 0
	}
}
PerkTable = {
	File = "mp/perkTable.csv",
	Cols = {
		Index = 0,
		Ref = 1,
		Name = 2,
		Image = 3,
		Desc = 4,
		Slot = 5,
		Count = 6,
		Type = 7,
		Upgrade = 8,
		UpgradeName = 9,
		Cost = 10
	}
}
PowerTable = {
	File = "mp/powerTable.csv",
	Cols = {
		Index = 0,
		Ref = 1,
		Name = 2,
		Desc = 3,
		Image = 4,
		ImageLarge = 5
	}
}
CamoTable = {
	File = "mp/camoTable.csv",
	ColIndexNone = 0,
	Cols = {
		Index = 0,
		Ref = 1,
		Type = 2,
		TargetMaterial = 3,
		Tint = 4,
		AtlasDims = 5,
		Name = 6,
		Image = 7,
		WeapIndex = 8,
		DLC = 9
	},
	GoldRef = "gold",
	GlobalList = {
		clan01 = 1,
		clan02 = 2
	}
}
ReticleTable = {
	File = "mp/reticleTable.csv",
	Cols = {
		Index = 0,
		Ref = 1,
		Name = 2,
		Desc = 3,
		Image = 4,
		WeapIndex = 5
	}
}
KillstreakTable = {
	File = "mp/killstreakTable.csv",
	Cols = {
		Index = 0,
		Ref = 1,
		Name = 2,
		Desc = 3,
		Kills = 4,
		EarnedHint = 5,
		Sound = 6,
		EarnedDialog = 7,
		AlliesDialog = 8,
		EnemyDialog = 9,
		EnemyUseDialog = 10,
		Weapon = 11,
		Score = 12,
		Icon = 13,
		OverheadIcon = 14,
		DPadIcon = 15,
		UnearnedIcon = 16,
		AllTeamStreak = 17
	}
}
GameTypesTable = {
	File = "mp/gametypesTable.csv",
	Cols = {
		Ref = 0,
		Name = 1,
		Desc = 2,
		Image = 3,
		TeamChoice = 4,
		ClassChoice = 5,
		Category = 6,
		Squads = 7,
		WargameName = 8,
		ObjectiveHintAttackers = 9,
		ObjectiveHintDefenders = 10,
		MLG = 11
	}
}
PatchesTable = {
	File = "mp/cac/patches.csv",
	Cols = {
		Ref = 0,
		Image = 1,
		Name = 2,
		Quip = 3,
		CardImage = 4,
		Category = 5,
		CategoryName = 6,
		Entitlement = 7,
		HideUnlessUnlocked = 8,
		CustomUnlockString = 9,
		DLCPack = 10
	}
}
FactionTable = {
	File = "mp/factionTable.csv",
	Cols = {
		Ref = 0,
		Name = 1,
		ShortName = 2,
		Eliminated = 3,
		Forfeited = 4,
		FactionIcon = 5,
		FactionHudIcon = 6
	}
}
PassiveTable = {
	File = "mp/passivetable.csv",
	Cols = {
		LootID = 0,
		Ref = 1,
		Name = 2,
		Icon = 3,
		Desc = 4,
		WeaponName = 5
	}
}
if Engine.InFrontend() then
	function syncXP( f1_arg0, f1_arg1 )
		
	end
	
	Cac.GetWeaponFullImage = function ( f2_arg0 )
		return Engine.TableLookup( StatsTable.File, StatsTable.Cols.WeaponRef, f2_arg0, StatsTable.Cols.WeaponFullImage )
	end
	
	Cac.GetCamoName = function ( f3_arg0 )
		return Engine.Localize( "@" .. Engine.TableLookup( CamoTable.File, CamoTable.Cols.Ref, f3_arg0, CamoTable.Cols.Name ) )
	end
	
	Cac.GetCamoIndex = function ( f4_arg0 )
		return Engine.TableLookup( CamoTable.File, CamoTable.Cols.Ref, f4_arg0, CamoTable.Cols.Index )
	end
	
	Cac.GetCamoWeaponIndex = function ( f5_arg0 )
		return Engine.TableLookup( CamoTable.File, CamoTable.Cols.Ref, f5_arg0, CamoTable.Cols.WeapIndex )
	end
	
	Cac.GetReticleName = function ( f6_arg0 )
		return Engine.Localize( "@" .. Engine.TableLookup( ReticleTable.File, ReticleTable.Cols.Ref, f6_arg0, ReticleTable.Cols.Name ) )
	end
	
end
Cac.GetAttachmentUniqueRef = function ( f7_arg0, f7_arg1 )
	local f7_local0 = f7_arg0
	local f7_local1 = ""
	local f7_local2 = 0
	repeat
		f7_local2 = f7_local2 + 1
		f7_local1 = Engine.TableLookupByRow( AttachmentMap.File, AttachmentMap.Rows.AttachRef, f7_local2 )
	until f7_local1 == f7_arg0 or f7_local1 == ""
	if f7_local1 == f7_arg0 then
		local f7_local3 = Engine.TableLookup( AttachmentMap.File, AttachmentMap.Cols.WeapOrClass, f7_arg1, f7_local2 )
		if f7_local3 == "" then
			f7_local3 = Engine.TableLookup( AttachmentMap.File, AttachmentMap.Cols.WeapOrClass, Cac.GetWeaponClass( f7_arg1 ), f7_local2 )
		end
		if f7_local3 ~= "" then
			f7_local0 = f7_local3
		end
	end
	return f7_local0
end

Cac.GetStreakName = function ( f8_arg0 )
	return Engine.Localize( Engine.TableLookup( KillstreakTable.File, KillstreakTable.Cols.Ref, f8_arg0, KillstreakTable.Cols.Name ) )
end

Cac.GetStreakDesc = function ( f9_arg0 )
	return Engine.Localize( Engine.TableLookup( KillstreakTable.File, KillstreakTable.Cols.Ref, f9_arg0, KillstreakTable.Cols.Desc ) )
end

Cac.GetCamoImage = function ( f10_arg0 )
	return Engine.TableLookup( CamoTable.File, CamoTable.Cols.Ref, f10_arg0, CamoTable.Cols.Image )
end

Cac.GetReticleImage = function ( f11_arg0 )
	return Engine.TableLookup( ReticleTable.File, ReticleTable.Cols.Ref, f11_arg0, ReticleTable.Cols.Image )
end

Cac.GetAbilityRef = function ( f12_arg0 )
	
end

Cac.GetAbilitySlotRef = function ( f13_arg0, f13_arg1 )
	
end

Cac.GetPassiveTableProperty = function ( f14_arg0, f14_arg1 )
	return Engine.TableLookup( PassiveTable.File, PassiveTable.Cols.Ref, f14_arg0, f14_arg1 )
end

