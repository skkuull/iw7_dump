CSV = {
	ReadRow = function ( f1_arg0, f1_arg1 )
		assert( f1_arg0.file )
		assert( f1_arg0.cols )
		local f1_local0 = {}
		for f1_local4, f1_local5 in pairs( f1_arg0.cols ) do
			f1_local0[f1_local4] = Engine.TableLookupByRow( f1_arg0.file, f1_arg1, f1_local5 )
		end
		return f1_local0
	end,
	levels = {
		file = "sp/levels.csv",
		cols = {
			ref = 0,
			name = 1,
			string = 2,
			isShipCrib = 3,
			desc = 4,
			image = 5,
			completedRef = 6
		}
	},
	CPLevels = {
		file = "cp/zombies/levels.csv",
		cols = {
			index = 0,
			ref = 1,
			introBink = 2
		}
	},
	streaks = {
		file = "mp/killstreakTable.csv",
		cols = {
			index = 0,
			ref = 1,
			name = 2,
			desc = 3,
			kills = 4,
			supportCost = 5,
			earnedHint = 6,
			sound = 7,
			earnedDialog = 8,
			alliesDialog = 9,
			enemyDialog = 10,
			enemyUseDialog = 11,
			weapon = 12,
			score = 13,
			icon = 14,
			overheadIcon = 15,
			dPadIcon = 16,
			unearnedIcon = 17,
			allTeamStreak = 18,
			showInMenus = 19,
			fullImage = 20,
			smallImage = 21,
			streakType = 22,
			extraRecordType = 23
		}
	},
	streakLootMaster = {
		file = "mp/loot/iw7_killstreak_loot_master.csv",
		cols = {
			index = 0,
			ref = 1,
			quality = 2,
			salvageReturned = 3,
			cost = 4,
			salvageIndex = 5,
			baseStreak = 6,
			passive1 = 7,
			passive2 = 8,
			passive3 = 9,
			displayName = 10,
			displayImage = 11,
			overrideDesc = 12,
			license = 16,
			pointsCost = 17,
			pointsCostWithPersist = 18,
			suffix = 19,
			displayImageSmall = 20
		}
	},
	cosmeticLootMaster = {
		file = "mp/loot/iw7_cosmetic_loot_master.csv",
		cols = {
			index = 0,
			ref = 1,
			quality = 2,
			type = 3,
			salvageReturned = 4,
			cost = 5,
			salvageIndex = 6,
			category = 7
		}
	},
	cosmeticCallingCardsLootMaster = {
		file = "mp/loot/iw7_cosmetic_calling_cards_loot_master.csv",
		cols = {
			index = 0,
			ref = 1,
			quality = 2,
			type = 3,
			salvageReturned = 4,
			cost = 5,
			salvageIndex = 6,
			category = 7,
			mk2 = 8,
			displayImage = 10,
			displayName = 11,
			license = 12
		}
	},
	cosmeticEmblemsLootMaster = {
		file = "mp/loot/iw7_cosmetic_emblems_loot_master.csv",
		cols = {
			index = 0,
			ref = 1,
			quality = 2,
			type = 3,
			salvageReturned = 4,
			cost = 5,
			salvageIndex = 6,
			category = 7,
			mk2 = 8,
			displayImage = 10,
			displayName = 11,
			license = 12
		}
	},
	cosmeticEmotesLootMaster = {
		file = "mp/loot/iw7_cosmetic_emotes_loot_master.csv",
		cols = {
			index = 0,
			ref = 1,
			quality = 2,
			type = 3,
			salvageReturned = 4,
			cost = 5,
			salvageIndex = 6,
			category = 7,
			mk2 = 8,
			displayImage = 10,
			displayName = 11,
			license = 12
		}
	},
	cosmeticRigsLootMaster = {
		file = "mp/loot/iw7_cosmetic_rigs_loot_master.csv",
		cols = {
			index = 0,
			ref = 1,
			quality = 2,
			type = 3,
			salvageReturned = 4,
			cost = 5,
			salvageIndex = 6,
			category = 7,
			mk2 = 8,
			displayImage = 10,
			displayName = 11,
			license = 12
		}
	},
	cosmeticHeroesLootMaster = {
		file = "mp/loot/iw7_cosmetic_heroes_loot_master.csv",
		cols = {
			index = 0,
			ref = 1,
			quality = 2,
			type = 3,
			salvageReturned = 4,
			cost = 5,
			salvageIndex = 6,
			category = 7,
			mk2 = 8,
			displayImage = 10,
			displayName = 11,
			license = 12,
			headModel = 13,
			bodyModel = 14,
			gender = 15
		}
	},
	cosmeticReticlesLootMaster = {
		file = "mp/loot/iw7_cosmetic_reticles_loot_master.csv",
		cols = {
			index = 0,
			ref = 1,
			quality = 2,
			type = 3,
			salvageReturned = 4,
			cost = 5,
			salvageIndex = 6,
			category = 7,
			mk2 = 8,
			displayImage = 10,
			displayName = 11,
			license = 12
		}
	},
	cosmeticFictionLootMaster = {
		file = "mp/loot/iw7_cosmetic_fiction_loot_master.csv",
		cols = {
			index = 0,
			ref = 1,
			quality = 2,
			type = 3,
			salvageReturned = 4,
			cost = 5,
			salvageIndex = 6,
			category = 7,
			mk2 = 8,
			displayImage = 10,
			displayName = 11,
			license = 12
		}
	},
	cosmeticCamosLootMaster = {
		file = "mp/loot/iw7_cosmetic_camos_loot_master.csv",
		cols = {
			index = 0,
			ref = 1,
			quality = 2,
			type = 3,
			salvageReturned = 4,
			cost = 5,
			salvageIndex = 6,
			category = 7,
			mk2 = 8,
			displayImage = 10,
			displayName = 11,
			license = 12
		}
	},
	cosmeticAttachmentsLootMaster = {
		file = "mp/loot/iw7_cosmetic_attachments_loot_master.csv",
		cols = {
			index = 0,
			ref = 1,
			quality = 2,
			type = 3,
			salvageReturned = 4,
			cost = 5,
			salvageIndex = 6,
			category = 7,
			mk2 = 8,
			displayImage = 10,
			displayName = 11,
			license = 12
		}
	},
	MPpowers = {
		file = "mp/powerTable.csv",
		cols = {
			index = 0,
			ref = 1,
			name = 2,
			desc = 3,
			image = 4,
			imageLarge = 5,
			cooldownTime = 6,
			maxCharges = 7,
			lowPower = 14,
			uiType = 15,
			extraRecordType = 17
		}
	}
}
if Engine.GetDvarString( "ui_mapname" ) == "cp_disco" then
	CSV.CPPowers = {
		file = "cp/zombies/disco_powerTable.csv",
		cols = {
			index = 0,
			ref = 1,
			name = 2,
			desc = 3,
			image = 4,
			imageLarge = 5,
			cooldownTime = 6,
			maxCharges = 7,
			uiType = 14,
			lowPower = 15
		}
	}
else
	CSV.CPPowers = {
		file = "cp/zombies/zombies_powerTable.csv",
		cols = {
			index = 0,
			ref = 1,
			name = 2,
			desc = 3,
			image = 4,
			imageLarge = 5,
			cooldownTime = 6,
			maxCharges = 7,
			uiType = 14,
			lowPower = 15
		}
	}
end
CSV.SPPowers = {
	file = "sp/powerTable.csv",
	cols = {
		index = 0,
		ref = 1,
		name = 2,
		desc = 3,
		image = 4,
		imageLarge = 5,
		cooldownTime = 6,
		maxCharges = 7,
		slot = 8,
		uiType = 9,
		lowPower = 10,
		upgradeOneCost = 11,
		upgradeTwoCost = 12,
		unlockDescText = 13,
		smallRender = 14,
		showInMenus = 15,
		upgradeOneText = 16,
		upgradeTwoText = 17,
		isSpecialistOnly = 18
	}
}
CSV.powerLootMaster = {
	file = "mp/loot/iw7_power_loot_master.csv",
	cols = {
		index = 0,
		ref = 1,
		quality = 2,
		type = 3,
		salvageReturned = 4,
		cost = 5,
		salvageIndex = 6,
		basePower = 7,
		passive1 = 8,
		passive2 = 9,
		passive3 = 10,
		displayName = 11,
		displayImage = 12,
		license = 13
	}
}
CSV.lootCrate = {
	file = "mp/loot/iw7_loot_crate_loot_master.csv",
	cols = {
		index = 0,
		ref = 1,
		demonwareID = 2,
		cost = 3,
		premiumCost = 4,
		CODPointsSKU = 5,
		displayName = 6,
		displayImage = 7,
		displayDesc = 8,
		maxPurchasable = 9,
		trackerID = 10,
		isBribeCrate = 11,
		salvageCost = 12,
		containsBribes = 13,
		quality = 14
	}
}
CSV.lootMaster = {
	file = "mp/loot/iw7_loot_master.csv",
	cols = {
		startIndex = 0,
		endIndex = 1,
		file = 2
	}
}
CSV.lootMissionSetMaster = {
	file = "mp/loot/iw7_loot_mission_set_master.csv",
	cols = {
		index = 0,
		name = 1,
		image = 2,
		desc = 3,
		MTXP = 4
	}
}
CSV.lootFile = {
	cols = {
		index = 0,
		name = 1
	}
}
CSV.storeCategories = {
	file = "mp/ingamestore/igs_categories.csv",
	cols = {
		ref = 0,
		string = 1,
		category = 2,
		first_party = 3,
		itemsFirstColumn = 4,
		itemsLastColumn = 9
	}
}
CSV.storeItems = {
	file = "mp/ingamestore/igs_items.csv",
	cols = {
		ref = 0,
		string = 1,
		XB3ItemID = 2,
		steamItemID = 3,
		PS4ItemID = 4,
		consumable = 5,
		firstParty = 6,
		entitlement = 7,
		image = 8,
		UWPItemID = 9,
		desc = 10,
		CPPrice = 11,
		should_exchange = 12
	}
}
CSV.hitMarkers = {
	file = "hitMarkers.csv",
	cols = {
		index = 0,
		ref = 1,
		material = 2,
		headShotMaterial = 3,
		scale = 4
	}
}
CSV.hitMarkerIcons = {
	file = Engine.IsAliensMode() and "cp/hitMarkerIcons.csv" or "mp/hitMarkerIcons.csv",
	cols = {
		index = 0,
		ref = 1,
		material = 2
	}
}
CSV.deathHints = {
	file = "sp/death_hints.csv",
	cols = {
		index = 0,
		text = 1,
		icon = 2
	}
}
CSV.mostWanted = {
	file = "sp/mostwanted.csv",
	cols = {
		index = 0,
		rank = 1,
		name = 2,
		image = 3,
		age = 4,
		homeWorld = 5,
		branch = 6,
		vessel = 7,
		awards = 8,
		bio = 9,
		identifier = 10,
		bioIntel1 = 11,
		bioIntel2 = 12,
		bioIntel3 = 13,
		bioIntel4 = 14,
		bioIntelUnlocked = 15,
		bioIntelLocked = 16
	}
}
CSV.warningMessages = {
	file = "hudwarnings.csv",
	cols = {
		index = 0,
		ref = 1,
		text = 2,
		material = 3,
		color = 4,
		flashRate = 5
	}
}
CSV.zombieSouvenirPieceInfo = {
	File = "scripts/cp/maps/" .. Engine.GetDvarString( "ui_mapname" ) .. "/" .. Engine.GetDvarString( "ui_mapname" ) .. "_crafting.csv",
	Cols = {
		Idx = 0,
		Icon = 2
	}
}
CSV.zombieConsumableItems = {
	File = "cp/loot/iw7_zombiefatefortune_loot_master.csv",
	Combo_File = "cp/cp_consumables_combos.csv",
	file = "cp/loot/iw7_zombiefatefortune_loot_master.csv",
	cols = {
		index = 0,
		ref = 1,
		quality = 2,
		inventoryType = 3,
		name = 4,
		desc = 5,
		type = 6,
		uses = 7,
		time = 8,
		passiveUses = 9,
		icon = 10,
		cost = 11,
		altDesc = 12,
		reqiredMapPack = 13,
		durationPassiveString = 14,
		slot = 15,
		shippable = 20,
		cardBacking = 21,
		cardRarity = 22,
		multiPack = 23,
		multiPackAmount = 24
	},
	Cols = {
		LootID = 0,
		Ref = 1,
		Quality = 2,
		InventoryType = 3,
		Name = 4,
		Desc = 5,
		Type = 6,
		Uses = 7,
		Time = 8,
		PassiveUses = 9,
		Icon = 10,
		Cost = 11,
		AltDesc = 12,
		ReqiredMapPack = 13,
		DurationPassiveString = 14,
		Slot = 15,
		Shippable = 20,
		CardBacking = 21,
		CardRarity = 22,
		MultiPack = 23,
		MultiPackAmount = 24
	},
	MaxComboGroup = 10,
	MaxItems = 50,
	typeTimedActivations = "timedactivations",
	typeWave = "wave",
	typeTriggerOnce = "triggeronce",
	typeTriggerPassive = "triggerpassive",
	typeTriggerWait = "triggerwait",
	typeTriggerNow = "triggernow"
}
CSV.zombiePlayerImage = {
	File = "cp/zombies/" .. Engine.GetDvarString( "ui_mapname" ) .. "_playercash_images.csv",
	Cols = {
		Idx = 0,
		Icon = 1,
		BigImage = 6,
		Name = 7
	}
}
CSV.zombiePerksTable = {
	File = "cp/zombies/zombie_perks_bit_mask_table.csv",
	Cols = {
		Bit = 0,
		Ref = 1,
		Icon = 2
	}
}
CSV.zombiePowerUpTable = {
	File = "cp/zombies/" .. Engine.GetDvarString( "ui_mapname" ) .. "_loot.csv",
	Cols = {
		Bit = 1,
		Ref = 2,
		Icon = 4,
		Name = 5
	}
}
CSV.zombieChallengeTable = {
	File = "cp/zombies/" .. Engine.GetDvarString( "ui_mapname" ) .. "_challenges.csv",
	Cols = {
		Index = 0,
		Ref = 1,
		Cycle = 2,
		StrActivate = 3,
		StrComplete = 4,
		StrFail = 5,
		preChallengeText = 7,
		Type = 10,
		Icon = 11,
		UpgradeIcon = 12,
		UpgradeText = 13,
		SplashStyleIcon = 14
	}
}
CSV.zmbEscapeProgress = {
	File = "scripts/cp/maps/cp_zmb/cp_zmb_escape.csv",
	Cols = {
		Index = 0,
		ScoreGoal = 1
	}
}
CSV.zmbEscapeCombos = {
	File = "cp/zombies/cp_zmb_escape_combos.csv",
	Cols = {
		Index = 0,
		Text = 2
	}
}
if Engine.GetDvarString( "ui_mapname" ) == "cp_rave" then
	CSV.spacelandSongs = {
		File = "cp/zombies/cp_rave_music_genre.csv",
		Cols = {
			Index = 0,
			Title = 6,
			Artist = 7
		}
	}
else
	CSV.spacelandSongs = {
		File = "cp/zombies/cp_zmb_music_genre.csv",
		Cols = {
			Index = 0,
			Title = 6,
			Artist = 7
		}
	}
end
CSV.zombieTutorialTable = {
	file = "cp/zombies/cp_zmb_tutorial.csv",
	cols = {
		bit = 0,
		ref = 1,
		text = 2,
		image = 3,
		title = 4,
		slot = 5
	}
}
CSV.zombieSplashTable = {
	file = "cp/zombies/zombie_splashtable.csv",
	cols = {
		ref = 0,
		name = 1,
		desc = 2,
		icon = 3,
		sound = 4,
		type = 5,
		displayLocation = 6,
		notifyScript = 7,
		iconClass = 8
	}
}
CSV.zombieElements = {
	file = "cp/zombies/elements.csv",
	cols = {
		index = 0,
		ref = 1,
		name = 2,
		type = 3,
		unique = 4,
		icon = 5,
		model = 6,
		slot = 7,
		heatA = 8,
		pressureA = 9,
		heatB = 10,
		pressureB = 11,
		heatC = 12,
		pressureC = 13,
		heatD = 14,
		pressureD = 15,
		heatE = 16,
		pressureE = 17,
		heatF = 18,
		pressureF = 19,
		bheatA = 20,
		bpressureA = 21,
		bheatB = 22,
		bpressureB = 23,
		bheatC = 24,
		bpressureC = 25,
		bheatD = 26,
		bpressureD = 27,
		bheatE = 28,
		bpressureE = 29,
		bheatF = 30,
		bpressureF = 31
	}
}
CSV.passives = {
	file = "mp/passivetable.csv",
	cols = {
		index = 0,
		ref = 1,
		name = 2,
		image = 3,
		weaponDesc = 4,
		streakDesc = 5,
		equipDesc = 6,
		abilityDesc = 7,
		CPDesc = 15,
		statAccuracy = 16,
		statDamage = 17,
		statRange = 18,
		statFireRate = 19,
		statMobility = 20,
		quality = 21
	}
}
CSV.fireModes = {
	file = "mp/firemodetable.csv",
	cols = {
		index = 0,
		ref = 1,
		name = 2,
		image = 3
	}
}
CSV.MPWeapons = {
	file = "mp/statsTable.csv",
	cols = {
		index = 0,
		class = 1,
		menuClass = 2,
		name = 3,
		ref = 4,
		asset = 5,
		image = 6,
		desc = 7,
		defaultAttachments = 9,
		attachFirst = 10,
		attachLast = 29,
		statAccuracy = 30,
		statDamage = 31,
		statRange = 32,
		statFireRate = 33,
		statMobility = 34,
		fullImage = 35,
		BWImage = 36,
		profileImage = 37,
		displayOrder = 41,
		maxRank = 42,
		showInCP = 43,
		fireMode1 = 45,
		fireMode2 = 46,
		cpDisplayOrder = 47,
		canUseCosmetic = 48,
		defaultOpticRef = 49,
		postLaunch = 51
	}
}
CSV.SPWeapons = {
	file = "sp/weapontable.csv",
	cols = {
		index = 0,
		ref = 1,
		name = 2,
		desc = 3,
		image = 4,
		menuClass = 5,
		fullImage = 6,
		displayOrder = 7,
		statAccuracy = 8,
		statDamage = 9,
		statRange = 10,
		statFireRate = 11,
		statMobility = 12,
		attachFirst = 13,
		attachLast = 33,
		cost = 34,
		specialFeatures = 35,
		fireMode1 = 36,
		fireMode2 = 37,
		isHiddenWhenLocked = 38,
		isEnergyWeapon = 39
	}
}
CSV.jackalWeapons = {
	file = "sp/jackalweapontable.csv",
	cols = {
		index = 0,
		ref = 1,
		name = 2,
		desc = 3,
		image = 4,
		fullImage = 5,
		type = 6,
		unlockText = 7
	}
}
CSV.jackalUpgrades = {
	file = "sp/jackalupgradetable.csv",
	cols = {
		index = 0,
		ref = 1,
		name = 2,
		desc = 3,
		image = 4,
		fullImage = 5,
		unlockText = 6
	}
}
CSV.jackalDecals = {
	file = "sp/jackaldecaltable.csv",
	cols = {
		index = 0,
		ref = 1,
		name = 2,
		desc = 3,
		image = 4,
		fullImage = 5,
		unlockText = 6
	}
}
CSV.weaponLootMaster = {
	file = "mp/loot/iw7_weapon_loot_master.csv",
	cols = {
		index = 0,
		ref = 1,
		variantTable = 2,
		salvageReturned = 3,
		cost = 4,
		salvageIndex = 5,
		quality = 6,
		category = 7,
		mk2 = 8,
		shippable = 9,
		missionTeam = 10,
		teamLevel = 11,
		license = 12,
		RnGDisplayLevel = 13,
		sublicense = 14
	}
}
CSV.weaponLoot = {
	file = nil,
	cols = {
		index = 0,
		ref = 1,
		baseWeapon = 2,
		asset = 3,
		quality = 4,
		passive1 = 5,
		passive2 = 6,
		passive3 = 7,
		displayName = 10,
		displayImage = 11,
		statAccuracy = 12,
		statDamage = 13,
		statRange = 14,
		statFireRate = 15,
		statMobility = 16,
		blockedAttachments = 17,
		blockedAttachmentCategories = 18,
		desc = 19,
		coopAsset = 20,
		fireMode1 = 24,
		fireMode2 = 25,
		uiRender = 26,
		suffix = 27,
		displayOrder = 28
	}
}
CSV.pick10Slots = {
	file = "mp/pick10Slots.csv",
	cols = {
		ref = 0,
		locRef = 1,
		image = 2,
		desc = 3,
		permUnlockRef = 4,
		permUnlockName = 5
	}
}
CSV.menuPerks = {
	file = "mp/menuPerks.csv",
	cols = {
		index = 0,
		slot = 1,
		ref = 2
	}
}
CSV.menuPowers = {
	file = "mp/menuPowers.csv",
	cols = {
		index = 0,
		rig = 1,
		slot = 2,
		ref = 3,
		itemType = 4
	}
}
CSV.menuRigPerks = {
	file = "mp/menuRigPerks.csv",
	cols = {
		index = 0,
		rig = 1,
		ref = 2
	}
}
CSV.battleRigs = {
	file = "mp/battleRigTable.csv",
	cols = {
		index = 0,
		ref = 1,
		portrait = 2,
		name = 3,
		desc = 4,
		super = 5,
		trait = 6,
		weaponAffinity = 7,
		movementSpeed = 8,
		liftType = 9,
		icon = 10,
		headshot = 11,
		baseBodyModel = 12,
		baseHeadModel = 13,
		codcasterIcon = 14,
		defaultFrontEndAnim = 15,
		frontEndProfileAnim = 16,
		manufacturersImage = 17,
		bootupBink = 18,
		capacityBink = 19,
		capacityCommanderMessage = 20,
		customizationIdleAnim = 21,
		transitionToTauntAnim = 22,
		transitionFromTauntAnim = 23,
		customizationArmsDownIdle = 24,
		tauntGunIn = 25,
		tauntGunOut = 26,
		lobbyMemberAnim = 27,
		modelOffset = 28
	}
}
CSV.perks = {
	file = "mp/perktable.csv",
	cols = {
		index = 0,
		ref = 1,
		name = 2,
		image = 3,
		desc = 4,
		fullImage = 12,
		manufacturersImage = 13
	}
}
CSV.SPPerks = {
	file = "sp/perktable.csv",
	cols = {
		index = 0,
		ref = 1,
		name = 2,
		image = 3,
		desc = 4,
		fullImage = 12,
		lockedDesc = 13,
		type = 14
	}
}
CSV.MPWeaponClasses = {
	file = "mp/weaponClassTable.csv",
	cols = {
		index = 0,
		ref = 1,
		slot = 2,
		name = 3,
		pluralName = 4,
		showInMenus = 5,
		unlockTablePrefix = 6,
		showInCP = 7,
		image = 8,
		showInArmory = 9
	}
}
CSV.SPWeaponClasses = {
	file = "sp/weaponClassTable.csv",
	cols = {
		index = 0,
		ref = 1,
		slot = 2,
		name = 3,
		pluralName = 4,
		showInMenus = 5
	}
}
CSV.SPAttachments = {
	file = "sp/attachmentTable.csv",
	cols = {
		index = 0,
		group = 2,
		name = 3,
		ref = 4,
		baseRef = 5,
		image = 6,
		desc = 7,
		isEnergy = 10,
		unique = 13,
		acc = 14,
		dam = 15,
		rng = 16,
		rof = 17,
		mob = 18,
		fullImage = 20
	}
}
CSV.MPAttachments = {
	file = "mp/attachmentTable.csv",
	cols = {
		index = 0,
		group = 2,
		name = 3,
		ref = 4,
		baseRef = 5,
		image = 6,
		desc = 7,
		reticles = 11,
		perk = 12,
		slot = 13,
		acc = 14,
		dam = 15,
		rng = 16,
		rof = 17,
		mob = 18,
		botDifficulty = 19,
		fullImage = 20
	}
}
CSV.SPAttachmentMap = {
	file = "sp/attachmentmap.csv",
	rows = {
		attachRef = 0
	},
	cols = {
		weapOrClass = 0
	}
}
CSV.MPAttachmentMap = {
	file = "mp/attachmentmap.csv",
	rows = {
		attachRef = 0
	},
	cols = {
		weapOrClass = 0
	}
}
CSV.CPAttachmentMap = {
	file = "cp/zombies/zombie_attachmentmap.csv",
	rows = {
		attachRef = 0
	},
	cols = {
		weapOrClass = 0
	}
}
CSV.supers = {
	file = "mp/supertable.csv",
	cols = {
		ref = 0,
		offhandWeapon = 1,
		cooldown = 2,
		scoreModifier = 3,
		duration = 4,
		maxActivations = 5,
		uiName = 6,
		uiDesc = 7,
		uiImageSmall = 8,
		uiImageLarge = 9,
		weaponModel = 10,
		rigRef = 16,
		manufacturersImage = 19,
		rigIdleAnim = 20,
		frontEndWeaponModel = 21,
		customizationWeaponModel = 22,
		index = 23
	}
}
CSV.hitLocationUITable = {
	file = "mp/hitLocationUITable.csv",
	cols = {
		index = 0,
		luiRef = 1,
		bitMask = 2
	}
}
CSV.mapCallouts = {
	filePath = "mp/map_callouts/",
	cols = {
		index = 0,
		ref = 1,
		localizeRef = 2,
		type = 3,
		team = 4
	}
}
CSV.challengeCategories = {
	file = "mp/challengeCategories.csv",
	altFile = "cp/meritCategories.csv",
	cols = {
		index = 0,
		ref = 1,
		localizeRef = 2,
		desc = 3,
		image = 4
	}
}
CSV.challengeSubCategories = {
	file = "mp/challengeSubCategories.csv",
	altFile = "cp/meritSubCategories.csv",
	cols = {
		index = 0,
		ref = 1,
		localizeRef = 2,
		desc = 3,
		image = 4,
		category = 5
	}
}
CSV.allChallengesTable = {
	file = "mp/allChallengesTable.csv",
	altFile = "cp/allMeritsTable.csv",
	maxTiers = 8,
	numTierCols = 3,
	cols = {
		ref = 0,
		name = 1,
		desc = 2,
		image = 3,
		subCategory = 6,
		displayParam = 8,
		paramScale = 9,
		tiers = {
			targetStart = 10,
			xpStart = 11,
			scoreStart = 12
		}
	}
}
CSV.camoTable = {
	file = "mp/camoTable.csv",
	cols = {
		index = 0,
		ref = 1,
		type = 2,
		targetMaterial = 3,
		tint = 4,
		atlasDims = 5,
		name = 6,
		image = 7,
		weaponIndex = 8,
		botValid = 9,
		desc = 10,
		category = 11,
		unlockType = 12,
		menuOrder = 13,
		showInMenus = 14,
		hideIfLocked = 15,
		atlasFrameOverride = 16,
		customUnlockString = 17
	}
}
CSV.menuCamos = {
	file = "mp/menuCamos.csv",
	cols = {
		index = 0,
		weaponRef = 1
	}
}
CSV.intelChallenges = {
	file = "mp/intelChallenges.csv",
	cols = {
		id = 0,
		ref = 1,
		unitIDs = 2,
		teamDefault = 3,
		starterTeam = 4,
		target1 = 5,
		reward1 = 6,
		target2 = 7,
		reward2 = 8,
		target3 = 9,
		reward3 = 10,
		target4 = 11,
		reward4 = 12,
		uidesc = 13,
		uiGenericDesc = 14,
		uiSingularDesc = 15,
		uiPluralDesc = 16,
		unitMeasure = 17,
		unlocks = {
			{
				category = 18,
				item = 19
			},
			{
				category = 20,
				item = 21
			},
			{
				category = 22,
				item = 23
			}
		},
		killSwitch = 24
	}
}
CSV.reticles = {
	file = "mp/reticletable.csv",
	cols = {
		index = 0,
		ref = 1,
		name = 2,
		desc = 3,
		image = 4,
		showInMenus = 6,
		type = 7,
		category = 8,
		menuOrder = 9,
		unlockType = 10,
		hideIfLocked = 11,
		customUnlockString = 12
	}
}
CSV.opticTypeMap = {
	file = "mp/optictypemap.csv",
	cols = {
		optic = 0,
		type = 1
	}
}
CSV.cosmeticAttachmentTable = {
	file = "mp/cosmeticattachmenttable.csv",
	cols = {
		ref = 0,
		name = 1,
		desc = 2,
		unlockType = 3,
		image = 4,
		category = 5,
		menuOrder = 6,
		customUnlockString = 7,
		hideIfLockedString = 8
	}
}
CSV.scoreEventTable = {
	file = "mp/score_event_table.csv",
	cols = {
		ref = 0,
		text = 1
	},
	xpCols = {
		dm = 4,
		war = 5,
		sd = 6,
		dom = 7,
		conf = 8,
		sr = 9,
		grind = 10,
		ball = 11,
		infect = 12,
		aliens = 13,
		gun = 14,
		grnd = 15,
		siege = 16,
		koth = 17,
		mpZomb = 18,
		ctf = 19,
		dd = 20,
		tdef = 21,
		front = 22
	}
}
CSV.gameTypesTable = {
	file = "mp/gametypesTable.csv",
	cols = {
		ref = 0,
		name = 1,
		desc = 2,
		image = 3,
		teamChoice = 4,
		classChoice = 5,
		category = 6,
		squads = 7,
		wargameName = 8,
		objectiveHintAttackers = 9,
		objectiveHintDefenders = 10,
		MLG = 11,
		hardcoreImage = 13
	}
}
CSV.mpMapTable = {
	file = "mp/mapInfo.csv",
	cols = {
		ref = 0,
		name = 1,
		caps = 2,
		loadingFluffText = 3,
		zoomFactorForCroppedMode = 4,
		minimapHeightForCroppedMode = 5,
		minimapWidthForCroppedMode = 6,
		minimapShouldRotateForCodCaster = 7
	}
}
CSV.weaponRankTable = {
	file = "mp/weaponRankTable.csv",
	cols = {
		rankId = 0,
		minXP = 1,
		xpToNext = 2,
		maxXP = 3
	}
}
CSV.cosmeticAttachmentUnlockTable = {
	file = "mp/" .. Engine.GetUnlockedDir() .. "/cosmeticAttachmentUnlocks.csv",
	cols = {
		ref = 0,
		ui_text = 1,
		ui_text_var1 = 2,
		ui_text_var2 = 3
	}
}
CSV.attachmentUnlockTable = {
	fileRoot = "mp/" .. Engine.GetUnlockedDir() .. "/",
	fileSuffix = "attachUnlocks.csv",
	cols = {
		weaponAttachRef = 0,
		ui_text = 1,
		ui_text_var1 = 2,
		ui_text_var2 = 3,
		unlockRank = 7
	}
}
CSV.loadoutUnlockTable = {
	file = "mp/" .. Engine.GetUnlockedDir() .. "/featureUnlocks.csv",
	cols = {
		ref = 0,
		ui_text = 1,
		ui_text_var1 = 2,
		ui_text_var2 = 3
	}
}
CSV.rigUnlockTable = {
	file = "mp/" .. Engine.GetUnlockedDir() .. "/rigUnlocks.csv",
	esportsFile = "mp/" .. Engine.GetUnlockedDir() .. "/pro_rigUnlocks.csv",
	esportsRef = "pro_rig",
	cols = {
		ref = 0,
		ui_text = 1,
		ui_text_var1 = 2,
		ui_text_var2 = 3,
		rigPackage = 5
	}
}
CSV.rigTraitUnlockTable = {
	file = "mp/" .. Engine.GetUnlockedDir() .. "/traitUnlocks.csv",
	esportsFile = "mp/" .. Engine.GetUnlockedDir() .. "/pro_traitUnlocks.csv",
	esportsRef = "pro_trait",
	cols = {
		ref = 0,
		ui_text = 1,
		ui_text_var1 = 2,
		ui_text_var2 = 3,
		rigPackage = 5
	}
}
CSV.rigSuperUnlockTable = {
	file = "mp/" .. Engine.GetUnlockedDir() .. "/superUnlocks.csv",
	esportsFile = "mp/" .. Engine.GetUnlockedDir() .. "/pro_superUnlocks.csv",
	esportsRef = "pro_super",
	cols = {
		ref = 0,
		ui_text = 1,
		ui_text_var1 = 2,
		ui_text_var2 = 3,
		rigPackage = 5
	}
}
CSV.rigPackageUnlockTable = {
	file = "mp/" .. Engine.GetUnlockedDir() .. "/rigPackageUnlocks.csv",
	cols = {
		ref = 0,
		ui_text = 1,
		ui_text_var1 = 2,
		ui_text_var2 = 3,
		unlockRank = 2
	}
}
CSV.headUnlockTable = {
	file = "mp/" .. Engine.GetUnlockedDir() .. "/headUnlocks.csv",
	esportsFile = "mp/" .. Engine.GetUnlockedDir() .. "/pro_headUnlocks.csv",
	esportsRef = "pro_head",
	cols = {
		ref = 0,
		ui_text = 1,
		ui_text_var1 = 2,
		ui_text_var2 = 3,
		rigPackage = 5
	}
}
CSV.bodyUnlockTable = {
	file = "mp/" .. Engine.GetUnlockedDir() .. "/bodyUnlocks.csv",
	esportsFile = "mp/" .. Engine.GetUnlockedDir() .. "/pro_bodyUnlocks.csv",
	esportsRef = "pro_body",
	cols = {
		ref = 0,
		ui_text = 1,
		ui_text_var1 = 2,
		ui_text_var2 = 3,
		rigPackage = 5
	}
}
CSV.rigPackages = {
	file = "mp/menuRigPackages.csv",
	cols = {
		ref = 0,
		name = 1,
		desc = 2,
		image = 3,
		unlockItem = 4,
		archetype = 5,
		superRef = 6,
		traitRef = 7
	}
}
CSV.fateCardUnlockTable = {
	file = "mp/" .. Engine.GetUnlockedDir() .. "/fateCardUnlocks.csv",
	cols = {
		ref = 0,
		ui_text = 1,
		ui_text_var1 = 2,
		ui_text_var2 = 3,
		unlockRank = 2
	}
}
CSV.fateDeckSizeUnlockTable = {
	file = "mp/" .. Engine.GetUnlockedDir() .. "/fatedecksizeunlocks.csv",
	cols = {
		ref = 0,
		ui_text = 1,
		ui_text_var1 = 2,
		ui_text_var2 = 3,
		unlockRank = 2
	}
}
CSV.weaponBuildUpgrades = {
	file = "cp/weaponBuildUpgrades.csv",
	cols = {
		index = 0,
		ref = 1,
		name = 2,
		image = 3,
		desc = 4
	}
}
CSV.streakUnlockTable = {
	file = "mp/" .. Engine.GetUnlockedDir() .. "/killstreakUnlocks.csv",
	esportsFile = "mp/" .. Engine.GetUnlockedDir() .. "/pro_killstreakUnlocks.csv",
	esportsRef = "pro_killstreak",
	cols = {
		ref = 0,
		ui_text = 1,
		ui_text_var1 = 2,
		ui_text_var2 = 3,
		unlockRank = 7
	}
}
CSV.perkUnlockTable = {
	file = "mp/" .. Engine.GetUnlockedDir() .. "/perkUnlocks.csv",
	esportsFile = "mp/" .. Engine.GetUnlockedDir() .. "/pro_perkUnlocks.csv",
	esportsRef = "pro_perk",
	cols = {
		ref = 0,
		ui_text = 1,
		ui_text_var1 = 2,
		ui_text_var2 = 3,
		unlockRank = 7
	}
}
CSV.pick10UnlockTable = {
	file = "mp/" .. Engine.GetUnlockedDir() .. "/pick10Unlocks.csv",
	esportsFile = "mp/" .. Engine.GetUnlockedDir() .. "/pro_pick10Unlocks.csv",
	esportsRef = "pro_pick10",
	cols = {
		ref = 0,
		ui_text = 1,
		ui_text_var1 = 2,
		ui_text_var2 = 3,
		unlockRank = 7
	}
}
CSV.challengeUnlockTable = {
	file = "mp/" .. Engine.GetUnlockedDir() .. "/challengeUnlocks.csv",
	cols = {
		ref = 0,
		ui_text = 1,
		ui_text_var1 = 2,
		ui_text_var2 = 3
	}
}
CSV.powerUnlockTable = {
	file = "mp/" .. Engine.GetUnlockedDir() .. "/powerUnlocks.csv",
	esportsFile = "mp/" .. Engine.GetUnlockedDir() .. "/pro_powerUnlocks.csv",
	esportsRef = "pro_power",
	cols = {
		ref = 0,
		ui_text = 1,
		ui_text_var1 = 2,
		ui_text_var2 = 3,
		unlockRank = 7
	}
}
CSV.weaponUnlockTable = {
	file = "mp/" .. Engine.GetUnlockedDir() .. "/weaponUnlocks.csv",
	esportsFile = "mp/" .. Engine.GetUnlockedDir() .. "/pro_weaponUnlocks.csv",
	esportsRef = "pro_weapon",
	cols = {
		ref = 0,
		ui_text = 1,
		ui_text_var1 = 2,
		ui_text_var2 = 3,
		unlockRank = 7
	}
}
CSV.zomWeaponUnlockTable = {
	file = "mp/" .. Engine.GetUnlockedDir() .. "/cpweaponunlocks.csv",
	cols = {
		ref = 0,
		ui_text = 1,
		ui_text_var1 = 2,
		ui_text_var2 = 3,
		unlockRank = 7
	}
}
CSV.fateDeckSizeUnlockTable = {
	file = "mp/" .. Engine.GetUnlockedDir() .. "/fatedecksizeunlocks.csv",
	cols = {
		ref = 0,
		ui_text = 1,
		ui_text_var1 = 2,
		ui_text_var2 = 3,
		unlockRank = 7
	}
}
CSV.cardUnlockTable = {
	file = "mp/" .. Engine.GetUnlockedDir() .. "/fatecardunlocks.csv",
	cols = {
		ref = 0,
		ui_text = 1,
		ui_text_var1 = 2,
		ui_text_var2 = 3,
		unlockRank = 7
	}
}
CSV.missionTeamUnlockTable = {
	file = "mp/" .. Engine.GetUnlockedDir() .. "/missionTeamUnlocks.csv",
	cols = {
		index = 0,
		ui_text = 1,
		ui_text_var1 = 2,
		ui_text_var2 = 3,
		unlockRank = 7
	}
}
CSV.callingCardUnlockTable = {
	file = "mp/" .. Engine.GetUnlockedDir() .. "/callingCardUnlocks.csv",
	cols = {
		ref = 0,
		unlockRank = 7
	}
}
CSV.teamLogoTable = {
	file = "mp/teamLogoTable.csv",
	cols = {
		index = 0,
		teamName = 1,
		teamAlias = 2,
		logoMaterial = 3
	}
}
CSV.codcasterKeyboardShortcuts = {
	file = "mp/codcasterkeyboardshortcuts.csv",
	cols = {
		index = 0,
		keyString = 1,
		keyText = 2
	}
}
CSV.mlgAnnouncementTable = {
	file = "mp/mlg_codcaster_announcements.csv",
	cols = {
		stringRef = 0,
		priority = 1,
		type = 2,
		displayTime = 3,
		parametertype = 4
	}
}
CSV.splashTable = {
	file = "mp/splashtable.csv",
	cols = {
		ref = 0,
		name = 1,
		desc = 2,
		icon = 3,
		sound = 4,
		type = 5,
		displayLocation = 6,
		notifyScript = 7,
		headerStringParam = 8,
		useRectangleImage = 9,
		useRectangleBacking = 10,
		useHexDisplay = 11,
		altDisplayStart = 12
	},
	altDisplayCols = {
		desc = 12,
		icon = 13,
		sound = 14
	},
	altDisplayColumnCount = 3
}
CSV.awardTable = {
	file = "mp/awardtable.csv",
	cols = {
		id = 0,
		ref = 1,
		icon = 2,
		category = 3,
		title = 4,
		desc = 5,
		notifyDuringMatch = 9,
		xpScoreEvent = 10,
		showInMenus = 12
	}
}
CSV.MPRank = {
	file = "mp/ranktable.csv",
	cols = {
		index = 0,
		rank = 1,
		minXP = 2,
		XPToNext = 3,
		shortRank = 4,
		fullyRank = 5,
		icon = 6,
		maxXP = 7,
		level = 13,
		displayLevel = 14,
		featureUnlocked = 15,
		inGameRank = 16,
		unlockString = 17
	}
}
CSV.CPRank = {
	file = "cp/zombies/rankTable.csv",
	cols = {
		index = 0,
		rank = 1,
		minXP = 2,
		XPToNext = 3,
		shortRank = 4,
		fullyRank = 5,
		icon = 6,
		maxXP = 7,
		level = 13,
		displayLevel = 14,
		featureUnlocked = 15,
		inGameRank = 16,
		unlockString = 17
	}
}
CSV.MPRankIcons = {
	file = "mp/rankicontable.csv",
	cols = {
		index = 0,
		standard = 1,
		firstPrestige = 2,
		lastPrestige = 11
	}
}
CSV.MPRankBigIcons = {
	file = "mp/rankbigicontable.csv",
	cols = {
		index = 0,
		standard = 1,
		firstPrestige = 2,
		lastPrestige = 11
	}
}
CSV.CPRankIcons = {
	file = "cp/zombies/rankIconTable.csv",
	cols = {
		index = 0,
		standard = 1,
		firstPrestige = 2,
		lastPrestige = 11
	}
}
CSV.armoryCategories = {
	file = "mp/armoryCategories.csv",
	cols = {
		index = 0,
		ref = 1,
		name = 2
	}
}
CSV.missionTeams = {
	file = "mp/iw7_mission_teams.csv",
	cols = {
		index = 0,
		name = 1,
		desc = 2,
		image = 3,
		challengeTier1 = 4,
		challengeTier2 = 5,
		challengeTier3 = 6,
		challengeTier4 = 7,
		factionVOAbbrev = 8,
		missionTeamCommanderVOAbbrev = 9,
		commanderName = 10,
		commanderImage = 11,
		headquarters = 12,
		commanderHeadshot = 13,
		imageGrayscale = 14,
		color = 15,
		movie = 16,
		introBink = 17,
		music = 18,
		killswitch = 19,
		popupBackground = 20,
		contractImage = 21
	}
}
CSV.missionTeamRanks = {
	file = "mp/missionTeamRankTable.csv",
	cols = {
		level = 0,
		xpToNextLevel = {
			1,
			2,
			3,
			4,
			5
		}
	}
}
CSV.missionTeamTiers = {
	file = "mp/missionTeamTierTable.csv",
	cols = {
		slots = 0,
		requiredLevel = 1
	}
}
CSV.mpErrorMessages = {
	file = "mp/errorMessages.csv",
	cols = {
		stringRef = 0
	}
}
CSV.mpMiscMessages = {
	file = "mp/miscMessages.csv",
	cols = {
		ref = 0,
		stringRef = 1,
		icon = 2,
		sound = 3,
		displayTime = 4
	}
}
CSV.buttonLayouts = {
	file = "buttonLayouts.csv",
	cols = {
		index = 0,
		cfg = 1,
		name = 2,
		leftStick = 3,
		rightStick = 4,
		leftTrigger = 5,
		leftTriggerSP = 6,
		rightTrigger = 7,
		rightTriggerSP = 8,
		leftShoulder = 9,
		leftShoulderSP = 10,
		rightShoulder = 11,
		rightShoulderSP = 12,
		primary = 13,
		secondary = 14,
		altOne = 15,
		altTwo = 16,
		dPad = 17,
		start = 18,
		startCP = 19,
		select = 20,
		selectSP = 21,
		selectCP = 22
	}
}
CSV.stickLayouts = {
	file = "stickLayouts.csv",
	cols = {
		index = 0,
		cfg = 1,
		name = 2,
		leftUp = 3,
		leftDown = 4,
		leftLeft = 5,
		leftRight = 6,
		leftButton = 7,
		rightUp = 8,
		rightDown = 9,
		rightLeft = 10,
		rightRight = 11,
		rightButton = 12,
		swapStickButtons = 13
	}
}
CSV.callingCards = {
	file = "mp/callingCards.csv",
	cols = {
		index = 0,
		texture = 1,
		category = 2,
		categoryID = 3,
		challenge = 4,
		isMasterCard = 5,
		cardName = 6,
		lootID = 7,
		isShippable = 8,
		unlockID = 9,
		hideIfLocked = 10
	}
}
CSV.consumableLootMaster = {
	file = "mp/loot/iw7_consumable_loot_master.csv",
	cols = {
		index = 0,
		ref = 1,
		quality = 2,
		type = 3,
		salvageReturned = 4,
		cost = 5,
		salvageIndex = 6,
		UICategory = 7,
		displayName = 8,
		license = 9,
		displayImage = 11,
		amount = 12
	}
}
CSV.DLCLootMaster = {
	file = "mp/loot/iw7_dlc_loot_master.csv",
	cols = {
		index = 0,
		ref = 1,
		quality = 2,
		type = 3,
		amount = 4,
		salvageIndex = 5,
		PS4ID = 6,
		XB1ID = 7,
		steamID = 8,
		steamData = 8
	}
}
CSV.currencyLootMaster = {
	file = "mp/loot/iw7_currency_loot_master.csv",
	cols = {
		index = 0,
		ref = 1,
		currencyID = 2,
		type = 3
	}
}
CSV.currencyPackLootMaster = {
	file = "mp/loot/iw7_currency_pack_loot_master.csv",
	cols = {
		index = 0,
		ref = 1,
		quality = 2,
		currencyType = 3,
		currencyIndex = 4,
		amount = 5,
		displayName = 6,
		displayImage = 7,
		uiamount = 8,
		isQuartermasterCipher = 9
	}
}
CSV.carePackageLootMaster = {
	file = "mp/loot/iw7_care_packages_loot_master.csv",
	cols = {
		index = 0,
		ref = 1,
		quality = 2,
		type = 3,
		salvageReturned = 4,
		cost = 5,
		salvageIndex = 6,
		UICategory = 7,
		mk2 = 8
	}
}
CSV.bodies = {
	file = "mp/cac/bodies.csv",
	cols = {
		index = 0,
		model = 1,
		name = 2,
		hideUnlessUnlocked = 7,
		customUnlockString = 8,
		rigRef = 12,
		uiImage = 13,
		ref = 14,
		uiCategory = 15,
		challenge = 16,
		challengeTier = 17,
		unlockType = 18,
		unlockTextParam = 19,
		displayOrder = 20,
		releaseKillswitch = 21
	}
}
CSV.heads = {
	file = "mp/cac/heads.csv",
	cols = {
		index = 0,
		model = 1,
		name = 2,
		category = 3,
		useHelmet = 4,
		entitlement = 5,
		hideUnlessUnlocked = 6,
		customUnlockString = 7,
		disableRandom = 8,
		default = 9,
		rigRef = 10,
		uiImage = 11,
		ref = 12,
		uiCategory = 13,
		challenge = 14,
		challengeTier = 15,
		unlockType = 16,
		unlockTextParam = 17,
		displayOrder = 18,
		releaseKillswitch = 19
	}
}
CSV.gestures = {
	file = "mp/gestureTable.csv",
	cols = {
		ref = 0,
		gestureData = 1,
		name = 2,
		customUnlockString = 3,
		uiImage = 4,
		hideUnlessUnlocked = 5,
		rigRef = 6,
		releaseKillswitch = 7,
		index = 8,
		previewAnim = 9,
		unlockType = 10,
		fullImage = 11,
		howToUnlock = 12
	}
}
CSV.taunts = {
	file = "mp/cac/taunts.csv",
	cols = {
		index = 0,
		ref = 1,
		name = 2,
		customUnlockString = 3,
		hideUnlessUnlocked = 4,
		rigRef = 5,
		uiImage = 6,
		releaseKillswitch = 7,
		previewAnim = 8,
		anim = 9,
		unlockType = 10,
		howToUnlock = 11,
		useGunIdle = 12,
		altAnimRigRefs = 13,
		altPreviewAnim = 14,
		altAnim = 15,
		isSupportingAnim = 16,
		secondPlaceAnim = 17,
		thirdPlaceAnim = 18,
		cancelPercent = 19,
		comboPercent = 20,
		animFrameCount = 21
	}
}
CSV.commanderMessage = {
	file = "mp/commanderMessages.csv",
	cols = {
		eventID = 0,
		useCommanderImage = 1,
		sequenceLength = 2,
		priority = 3,
		aliasBase = 4
	}
}
CSV.miscKillcam = {
	file = "mp/miscKillcamItems.csv",
	cols = {
		index = 0,
		weapon = 1,
		image = 2,
		text = 3
	}
}
CSV.weaponOffsets = {
	file = nil,
	cols = {
		modelName = 0,
		xOffset = 1,
		yOffset = 2,
		zOffset = 3,
		xRotationCenter = 4,
		yRotationCenter = 5,
		zRotationCenter = 6,
		xDefaultAngle = 7,
		yDefaultAngle = 8,
		zDefaultAngle = 9
	}
}
CSV.emblemSets = {
	file = "mp/emblemsOrBackings.csv",
	cols = {
		type = 0,
		id = 1,
		sortkey = 2,
		image = 3,
		description = 4,
		cost = 5,
		unlockLvl = 6,
		unlockPLvl = 7,
		unclassifyAt = 8,
		categoryA = 9,
		icontype = 10,
		outlineSize = 11,
		isShippable = 12
	}
}
CSV.emblemLayers = {
	file = "mp/emblemCategoriesOrLayers.csv",
	cols = {
		type = 0,
		cost = 1,
		unlockLevel = 2,
		unlockPLevel = 3
	}
}
if Engine.IsSingleplayer() then
	CSV.scrapUnlocks = {
		file = "sp/scrap_unlocks.csv",
		cols = {
			ref = 0,
			name = 1,
			scrapCost = 3
		}
	}
end
CSV.progressionUnlocks = {
	file = "sp/progression_unlocks.csv",
	cols = {
		ref = 0,
		scrapReward = 1,
		primary = 2,
		secondary = 3,
		weapon_optional = 4,
		offhand = 5,
		item = 6,
		equip_upgrades = 7,
		suit = 8,
		jackal_primaries = 9,
		jackal_secondaries = 10,
		jackal_upgrade = 11,
		jackal_decal = 12,
		ace_pilots = 13,
		mission_weapons = 14
	}
}
CSV.OpsMap = {
	file = "sp/opsmap_poi.csv",
	cols = {
		index = 0,
		name = 1,
		orbits = 2,
		image = 3,
		imageCloseUp = 4,
		imageComplete = 5,
		imageCompleteCloseUp = 6,
		r = 7,
		theta = 8,
		z = 9,
		scale = 10,
		category = 11,
		focusRadius = 12,
		snapCursor = 13,
		map = 14,
		description = 15,
		descriptionCompleted = 16,
		displayName = 17,
		showNameWhen = 18,
		fluffImage = 19,
		fluff1 = 20,
		fluff2 = 21,
		fluff3 = 22,
		fluff4 = 23,
		fluff5 = 24,
		rewardWeapons = 25,
		rewardPerks = 26,
		rewardJackal = 27,
		rewardScrap = 28,
		rewardMostWanted = 29,
		missionName = 30,
		missionTarget = 31,
		autoZoomValue = 32,
		autoZoomX = 33,
		autoZoomY = 34,
		domZoneImage = 35,
		domScale = 36
	}
}
CSV.IntelMessage = {
	file = "sp/intel_widget.csv",
	cols = {
		index = 0,
		identifier = 1,
		heading = 2,
		body = 3,
		image = 4
	}
}
CSV.CapCompAAR = {
	file = "sp/capcomp_aar.csv",
	cols = {
		index = 0,
		ref = 1,
		title = 2,
		subtitle = 3,
		brief = 4,
		details = 5,
		repImage = 6
	}
}
CSV.CapCompIntel = {
	file = "sp/capcomp_intel.csv",
	cols = {
		index = 0,
		ref = 1,
		title = 2,
		subtitle = 3,
		contentType = 4,
		contentName = 5,
		repImage = 6,
		idImage = 7
	}
}
CSV.CapCompPersonnel = {
	file = "sp/capcomp_personnel.csv",
	cols = {
		index = 0,
		ref = 1,
		charName = 2,
		subtitle = 3,
		headImage = 4,
		data1 = 5,
		data2 = 6,
		data3 = 7,
		data4 = 8,
		bioText = 9,
		idImage = 10
	}
}
CSV.FactionTable = {
	file = "mp/factionTable.csv",
	cols = {
		ref = 0,
		name = 1,
		shortName = 2,
		eliminated = 3,
		forfeited = 4,
		factionIcon = 5,
		factionHudIcon = 6,
		splashSound = 20
	}
}
CSV.camoChallengeMap = {
	file = "mp/camochallengemap.csv",
	cols = {
		weaponRef = 0,
		camoRef = 1,
		challengeRef = 2,
		challengeTier = 3,
		altUnlockString = 4
	}
}
CSV.reticleChallengeMap = {
	file = "mp/reticlechallengemap.csv",
	cols = {
		opticRef = 0,
		reticleRef = 1,
		challengeRef = 2,
		challengeTier = 3,
		altUnlockString = 4
	}
}
CSV.weaponChallengeMap = {
	file = "mp/weaponchallengemap.csv",
	cols = {
		weaponRef = 0,
		challengeRef = 1
	}
}
CSV.defaultClassTable = {
	file = "mp/classTable.csv",
	cols = {
		itemRef = 0,
		class1 = 1,
		class2 = 2,
		class3 = 3,
		class4 = 4,
		class5 = 5
	}
}
CSV.weaponPrestigeTable = {
	file = "mp/weaponprestigerewards.csv",
	cols = {
		prestigeLevel = 0,
		rewardType = 1,
		rewardString = 2
	}
}
CSV.prestigeRewards = {
	file = "mp/prestigeRewards.csv",
	cols = {
		ref = 0,
		prestigeLevel = 1,
		rewardType = 2,
		rewardName = 3,
		rewardNameParam = 4
	}
}
CSV.prestigeExtrasUnlocks = {
	file = "mp/unlocks/prestigeExtrasUnlocks.csv",
	cols = {
		ref = 0
	}
}
CSV.proDefaults = {
	file = "mp/unlocks/pro_defaults.csv",
	cols = {
		itemType = 0,
		itemRef = 1,
		rigRef = 2
	}
}
CSV.classicWeapons = {
	file = "mp/menuClassicWeapons.csv",
	cols = {
		weaponRef = 0,
		name = 1,
		desc = 2
	}
}
CSV.quartermasterAnims = {
	file = nil,
	cols = {
		anim = 0,
		audio = 1,
		audioDelay = 2
	}
}
CSV.patches = {
	file = "mp/cac/patches.csv",
	cols = {
		idx = 0,
		texture = 1,
		lootID = 7,
		usesUnlocks = 12
	}
}
CSV.weapons = {}
CSV.weaponClasses = {}
CSV.attachments = {}
CSV.movementKeyBindings = {
	file = "keyBindingsMovement.csv",
	cols = {
		index = 0,
		identifier = 1,
		stringID = 2,
		action = 3,
		showForSP = 4,
		showForMP = 5,
		showForCP = 6
	}
}
CSV.actionKeyBindings = {
	file = "keyBindingsAction.csv",
	cols = {
		index = 0,
		identifier = 1,
		stringID = 2,
		action = 3,
		showForSP = 4,
		showForMP = 5,
		showForCP = 6
	}
}
CSV.lookKeyBindings = {
	file = "keyBindingsLook.csv",
	cols = {
		index = 0,
		identifier = 1,
		stringID = 2,
		action = 3,
		showForSP = 4,
		showForMP = 5,
		showForCP = 6
	}
}
CSV.chatKeyBindings = {
	file = "keyBindingsChat.csv",
	cols = {
		index = 0,
		identifier = 1,
		stringID = 2,
		action = 3,
		showForSP = 4,
		showForMP = 5,
		showForCP = 6
	}
}
CSV.announcerVoiceDataTable = {
	file = "mp/announcervoicedata.csv",
	cols = {
		index = 0,
		name = 1,
		preview = 2
	}
}
CSV.contractChallenges = {
	file = "mp/contractChallenges.csv",
	cols = {
		index = 0,
		ref = 1,
		team = 2,
		target = 3,
		desc = 4,
		killSwitch = 5
	}
}
CSV.contractCalendar = {
	file = "mp/contractCalendar.csv",
	cols = {
		week = 0,
		team0 = 1,
		team1 = 2,
		rewardStream0 = 3,
		rewardStream1 = 4,
		cycleTag = 5,
		pack0123 = 10,
		pack012 = 11,
		pack013 = 12,
		pack023 = 13,
		pack01 = 14,
		pack02 = 15,
		pack03 = 16,
		pack0 = 17,
		pack01234 = 18,
		pack0124 = 19,
		pack0134 = 20,
		pack0234 = 21,
		pack014 = 22,
		pack024 = 23,
		pack034 = 24,
		pack04 = 25
	}
}
CSV.UpdateCSVsByGameMode = function ( f2_arg0 )
	if f2_arg0 == CoD.PlayMode.SP then
		CSV.weapons = CSV.SPWeapons
		CSV.weaponClasses = CSV.SPWeaponClasses
		CSV.attachments = CSV.SPAttachments
		CSV.powers = CSV.SPPowers
		CSV.attachmentMap = CSV.SPAttachmentMap
	end
	if f2_arg0 == CoD.PlayMode.Core or f2_arg0 == CoD.PlayMode.Aliens then
		CSV.weapons = CSV.MPWeapons
		CSV.weaponClasses = CSV.MPWeaponClasses
		CSV.attachments = CSV.MPAttachments
		CSV.attachmentMap = CSV.MPAttachmentMap
	end
	if f2_arg0 == CoD.PlayMode.Core then
		CSV.powers = CSV.MPpowers
		CSV.allChallengesTable.file = "mp/allChallengesTable.csv"
		CSV.allChallengesTable.altFile = "cp/allMeritsTable.csv"
		CSV.challengeCategories.file = "mp/challengeCategories.csv"
		CSV.challengeCategories.altFile = "cp/meritCategories.csv"
		CSV.challengeSubCategories.file = "mp/challengeSubCategories.csv"
		CSV.challengeSubCategories.altFile = "cp/meritSubCategories.csv"
		CSV.weaponChallengeMap.file = "mp/weaponchallengemap.csv"
		CSV.rankIcons = CSV.MPRankIcons
		CSV.rank = CSV.MPRank
		CSV.contractCalendar.file = "mp/contractCalendar.csv"
		CSV.contractChallenges.file = "mp/contractChallenges.csv"
		CSV.lootMissionSetMaster.file = "mp/loot/iw7_loot_mission_set_master.csv"
		CSV.missionTeams.file = "mp/iw7_mission_teams.csv"
	end
	if f2_arg0 == CoD.PlayMode.Aliens then
		CSV.powers = CSV.CPPowers
		CSV.rankIcons = CSV.CPRankIcons
		CSV.rank = CSV.CPRank
		if Engine.IsAliensMode() and Engine.GetDvarString( "ui_gametype" ) == "zombie" then
			if Engine.GetDvarString( "ui_mapname" ) == "cp_disco" then
				CSV.powers.file = "cp/zombies/disco_powerTable.csv"
			else
				CSV.powers.file = "cp/zombies/zombie_powerTable.csv"
			end
			CSV.allChallengesTable.file = "cp/allMeritsTable.csv"
			CSV.allChallengesTable.altFile = "mp/allChallengesTable.csv"
			CSV.challengeCategories.file = "cp/meritCategories.csv"
			CSV.challengeCategories.altFile = "mp/challengeCategories.csv"
			CSV.challengeSubCategories.file = "cp/meritSubCategories.csv"
			CSV.challengeSubCategories.altFile = "mp/challengeSubCategories.csv"
			CSV.weaponChallengeMap.file = "cp/weaponchallengemapCP.csv"
			CSV.contractCalendar.file = "cp/contractCalendarZM.csv"
			CSV.contractChallenges.file = "cp/contractChallengesZM.csv"
			CSV.lootMissionSetMaster.file = "cp/loot/iw7_zombie_loot_contract_set.csv"
			CSV.missionTeams.file = "cp/iw7_zombie_map_contracts.csv"
		else
			CSV.powers.file = "cp/cp_powerTable.csv"
		end
	end
end

