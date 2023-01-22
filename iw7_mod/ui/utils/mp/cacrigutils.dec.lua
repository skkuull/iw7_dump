Cac = Cac or {}
Cac.superNoneValue = "none"
Cac.rigNoneValue = "archetype_assault"
Cac.traitNoneValue = "specialty_null"
Cac.esportsDefaultHeads = {
	archetype_assault = 4,
	archetype_heavy = 12,
	archetype_scout = 28,
	archetype_assassin = 57,
	archetype_engineer = 46,
	archetype_sniper = 27
}
Cac.esportsDefaultBodies = {
	archetype_assault = 18,
	archetype_heavy = 5,
	archetype_scout = 1,
	archetype_assassin = 28,
	archetype_engineer = 39,
	archetype_sniper = 31
}
Cac.noneSuper = {
	archetype_assault = "super_claw",
	archetype_heavy = "super_steeldragon",
	archetype_scout = "super_armmgs",
	archetype_assassin = "super_atomizer",
	archetype_engineer = "super_blackholegun",
	archetype_sniper = "super_penetrationrailgun"
}
Cac.CustomizationTypes = {
	HEAD = "head",
	BODY = "body",
	GESTURE = "gesture"
}
Cac.RigLootTypes = {
	Head = "rig_head",
	Body = "rig_body"
}
Cac.RigEmoteTypes = {
	Gesture = "gesture",
	Taunt = "taunt"
}
Cac.RigArchetypes = {
	Human = "allRigsButC6"
}
Cac.rigVariantCount = 1
Cac.noDraftedRigIndex = -1
Cac.noDraftedSuperIndex = -1
Cac.noDraftedTraitIndex = -1
Cac.noDraftedWeaponIndex = -1
Cac.GetRigIcon = function ( f1_arg0 )
	return Engine.TableLookup( CSV.battleRigs.file, CSV.battleRigs.cols.ref, f1_arg0, CSV.battleRigs.cols.icon )
end

Cac.GetRigManufacturersImage = function ( f2_arg0 )
	return Engine.TableLookup( CSV.battleRigs.file, CSV.battleRigs.cols.ref, f2_arg0, CSV.battleRigs.cols.manufacturersImage )
end

Cac.GetRigHeadshot = function ( f3_arg0 )
	return Engine.TableLookup( CSV.battleRigs.file, CSV.battleRigs.cols.ref, f3_arg0, CSV.battleRigs.cols.headshot )
end

Cac.GetRigPortrait = function ( f4_arg0 )
	return Engine.TableLookup( CSV.battleRigs.file, CSV.battleRigs.cols.ref, f4_arg0, CSV.battleRigs.cols.portrait )
end

Cac.GetSuperImage = function ( f5_arg0 )
	return Engine.TableLookup( CSV.supers.file, CSV.supers.cols.ref, f5_arg0, CSV.supers.cols.uiImageSmall )
end

Cac.GetSuperFullImage = function ( f6_arg0 )
	return Engine.TableLookup( CSV.supers.file, CSV.supers.cols.ref, f6_arg0, CSV.supers.cols.uiImageLarge )
end

Cac.GetSuperManufacturersImage = function ( f7_arg0 )
	return Engine.TableLookup( CSV.supers.file, CSV.supers.cols.ref, f7_arg0, CSV.supers.cols.manufacturersImage )
end

Cac.GetSuperName = function ( f8_arg0 )
	return Engine.Localize( Engine.TableLookup( CSV.supers.file, CSV.supers.cols.ref, f8_arg0, CSV.supers.cols.uiName ) )
end

Cac.GetSuperDesc = function ( f9_arg0 )
	return Engine.Localize( Engine.TableLookup( CSV.supers.file, CSV.supers.cols.ref, f9_arg0, CSV.supers.cols.uiDesc ) )
end

Cac.GetSuperRig = function ( f10_arg0 )
	return Engine.TableLookup( CSV.supers.file, CSV.supers.cols.ref, f10_arg0, CSV.supers.cols.rigRef )
end

Cac.GetSuperIndex = function ( f11_arg0 )
	return tonumber( Engine.TableLookup( CSV.supers.file, CSV.supers.cols.ref, f11_arg0, CSV.supers.cols.index ) )
end

Cac.GetRigName = function ( f12_arg0 )
	return Engine.Localize( Engine.TableLookup( CSV.battleRigs.file, CSV.battleRigs.cols.ref, f12_arg0, CSV.battleRigs.cols.name ) )
end

Cac.GetRigDesc = function ( f13_arg0 )
	return Engine.Localize( Engine.TableLookup( CSV.battleRigs.file, CSV.battleRigs.cols.ref, f13_arg0, CSV.battleRigs.cols.desc ) )
end

Cac.GetRigBaseBodyModel = function ( f14_arg0 )
	return tonumber( Engine.TableLookup( CSV.battleRigs.file, CSV.battleRigs.cols.ref, f14_arg0, CSV.battleRigs.cols.baseBodyModel ) )
end

Cac.GetRigBaseHeadModel = function ( f15_arg0 )
	return tonumber( Engine.TableLookup( CSV.battleRigs.file, CSV.battleRigs.cols.ref, f15_arg0, CSV.battleRigs.cols.baseHeadModel ) )
end

Cac.GetRigFrontEndIdleAnim = function ( f16_arg0 )
	return Engine.TableLookup( CSV.battleRigs.file, CSV.battleRigs.cols.ref, f16_arg0, CSV.battleRigs.cols.defaultFrontEndAnim )
end

Cac.GetRigFrontEndProfileAnim = function ( f17_arg0 )
	return Engine.TableLookup( CSV.battleRigs.file, CSV.battleRigs.cols.ref, f17_arg0, CSV.battleRigs.cols.frontEndProfileAnim )
end

Cac.GetRigFrontEndCustomizationIdleAnim = function ( f18_arg0 )
	return Engine.TableLookup( CSV.battleRigs.file, CSV.battleRigs.cols.ref, f18_arg0, CSV.battleRigs.cols.customizationIdleAnim )
end

Cac.GetRigFrontEndCustomizationArmsDownIdleAnim = function ( f19_arg0 )
	return Engine.TableLookup( CSV.battleRigs.file, CSV.battleRigs.cols.ref, f19_arg0, CSV.battleRigs.cols.customizationArmsDownIdle )
end

Cac.GetCustomizationCSV = function ( f20_arg0 )
	if f20_arg0 == Cac.CustomizationTypes.HEAD then
		return CSV.heads
	elseif f20_arg0 == Cac.CustomizationTypes.BODY then
		return CSV.bodies
	elseif f20_arg0 == Cac.CustomizationTypes.GESTURE then
		return CSV.gestures
	else
		error( "Unexpected customization type" )
	end
end

Cac.GetCustomizationLootCSV = function ( f21_arg0 )
	if f21_arg0 == Cac.CustomizationTypes.HEAD then
		return CSV.cosmeticRigsLootMaster
	elseif f21_arg0 == Cac.CustomizationTypes.BODY then
		return CSV.cosmeticRigsLootMaster
	elseif f21_arg0 == Cac.CustomizationTypes.GESTURE then
		return CSV.cosmeticEmotesLootMaster
	else
		error( "Unexpected customization type" )
	end
end

Cac.GetRigFrontEndLobbyMemberAnim = function ( f22_arg0 )
	return Engine.TableLookup( CSV.battleRigs.file, CSV.battleRigs.cols.ref, f22_arg0, CSV.battleRigs.cols.lobbyMemberAnim )
end

Cac.GetRigFrontEndTauntTransitionAnims = function ( f23_arg0 )
	local f23_local0 = Engine.TableLookupGetRowNum( CSV.battleRigs.file, CSV.battleRigs.cols.ref, f23_arg0 )
	return Engine.TableLookupByRow( CSV.battleRigs.file, f23_local0, CSV.battleRigs.cols.transitionToTauntAnim ), Engine.TableLookupByRow( CSV.battleRigs.file, f23_local0, CSV.battleRigs.cols.transitionFromTauntAnim )
end

Cac.GetRigOffset = function ( f24_arg0 )
	return LUI.Split( Engine.TableLookup( CSV.battleRigs.file, CSV.battleRigs.cols.index, f24_arg0, CSV.battleRigs.cols.modelOffset ), " " )
end

Cac.GetRigBootupBink = function ( f25_arg0 )
	return Engine.TableLookup( CSV.battleRigs.file, CSV.battleRigs.cols.ref, f25_arg0, CSV.battleRigs.cols.bootupBink )
end

Cac.GetRigCapacityBink = function ( f26_arg0 )
	return Engine.TableLookup( CSV.battleRigs.file, CSV.battleRigs.cols.ref, f26_arg0, CSV.battleRigs.cols.capacityBink )
end

Cac.GetRigCapacityCommanderMessage = function ( f27_arg0 )
	return Engine.TableLookup( CSV.battleRigs.file, CSV.battleRigs.cols.ref, f27_arg0, CSV.battleRigs.cols.capacityCommanderMessage )
end

Cac.SetPlayedCapacityBink = function ( f28_arg0, f28_arg1 )
	Engine.SetPlayerDataEx( f28_arg1, CoD.StatsGroup.Ranked, "hasSeenCapacityVideo", Cac.GetRigIndex( f28_arg0 ), true )
end

Cac.HasPlayedCapacityBink = function ( f29_arg0, f29_arg1 )
	return Engine.GetPlayerDataEx( f29_arg1, CoD.StatsGroup.Ranked, "hasSeenCapacityVideo", Cac.GetRigIndex( f29_arg0 ) )
end

Cac.PlayFirstRigCapacityBink = function ( f30_arg0, f30_arg1 )
	if Onboarding then
		Onboarding:AdvanceFlow( Onboarding.RigTutorial, "RIG_VIDEO" )
	end
	if CONDITIONS.IsPublicMatch() and not Cac.HasPlayedCapacityBink( f30_arg0, f30_arg1 ) and Engine.InFrontend() then
		Cac.PlayRigCapacityBink( f30_arg0, true, f30_arg1 )
		Cac.SetPlayedCapacityBink( f30_arg0, f30_arg1 )
	end
end

Cac.PlayRigCapacityBink = function ( f31_arg0, f31_arg1, f31_arg2 )
	LUI.FlowManager.RequestPopupMenu( nil, "MPFullScreenVideoOverlay", false, f31_arg2, false, {
		videoRef = Cac.GetRigCapacityBink( f31_arg0 ),
		allowSkip = f31_arg1
	} )
end

Cac.IsRigInUse = function ( f32_arg0 )
	local f32_local0
	if f32_arg0 == "" or f32_arg0 == "none" then
		f32_local0 = false
	else
		f32_local0 = true
	end
	return f32_local0
end

Cac.GetRigRefFromIndex = function ( f33_arg0 )
	assert( type( f33_arg0 ) == "number" )
	assert( f33_arg0 >= 0 )
	for f33_local3, f33_local4 in pairs( RIG_LIST ) do
		if f33_local4.index == f33_arg0 then
			return f33_local3
		end
	end
end

Cac.GetRigIndex = function ( f34_arg0 )
	if Engine.InFrontend() then
		return RIG_LIST[f34_arg0].index
	else
		Cac.GetRigTableIndex( f34_arg0 )
	end
end

Cac.GetRigTableIndex = function ( f35_arg0 )
	return tonumber( Engine.TableLookup( CSV.battleRigs.file, CSV.battleRigs.cols.ref, f35_arg0, CSV.battleRigs.cols.index ) )
end

Cac.GetRigVariantName = function ()
	return "Master"
end

Cac.GetRigVariantImage = function ()
	return "weapon_variable_zoom"
end

Cac.GetRigVariantRef = function ()
	return "variant_master"
end

Cac.GetRigTrait = function ( f39_arg0 )
	return Engine.Localize( Engine.TableLookup( CSV.battleRigs.file, CSV.battleRigs.cols.ref, f39_arg0, CSV.battleRigs.cols.trait ) )
end

Cac.GetTraitRig = function ( f40_arg0 )
	return Engine.TableLookup( CSV.menuRigPerks.file, CSV.menuRigPerks.cols.ref, f40_arg0, CSV.menuRigPerks.cols.rig )
end

Cac.GetRigAffinity = function ( f41_arg0 )
	return Engine.TableLookup( CSV.battleRigs.file, CSV.battleRigs.cols.ref, f41_arg0, CSV.battleRigs.cols.weaponAffinity )
end

Cac.GetRigMovementSpeed = function ( f42_arg0 )
	return Engine.TableLookup( CSV.battleRigs.file, CSV.battleRigs.cols.ref, f42_arg0, CSV.battleRigs.cols.movementSpeed )
end

Cac.GetRigLiftType = function ( f43_arg0 )
	return Engine.TableLookup( CSV.battleRigs.file, CSV.battleRigs.cols.ref, f43_arg0, CSV.battleRigs.cols.liftType )
end

Cac.GetPreferencesForRig = function ( f44_arg0, f44_arg1, f44_arg2 )
	local f44_local0 = f44_arg0:GetCountValue( f44_arg2 )
	for f44_local1 = 0, f44_local0 - 1, 1 do
		local f44_local4 = f44_arg0[f44_local1]
		if f44_local4.archetype:GetValue( f44_arg2 ) == f44_arg1 then
			return f44_local4
		end
	end
	assert( false, "Cac.GetPreferencesForRig rigRef not found in playerdata rig preferences." )
end

Cac.UpdateRigPreferences = function ( f45_arg0, f45_arg1, f45_arg2 )
	local f45_local0 = f45_arg1.archetypePerk:GetValue( f45_arg2 )
	local f45_local1 = f45_arg1.archetypeSuper:GetValue( f45_arg2 )
	if not Cac.IsSuperUnlocked( f45_local1, f45_arg2 ) then
		for f45_local5, f45_local6 in pairs( Cac.GetSupersForRig( f45_arg0 ) ) do
			if f45_local5 ~= f45_local1 and Cac.IsSuperUnlocked( f45_local5, f45_arg2 ) then
				f45_local1 = f45_local5
				break
			end
		end
	end
	if not Cac.IsTraitUnlocked( f45_local0, f45_arg2 ) then
		for f45_local5, f45_local6 in pairs( Cac.GetTraitsForRig( f45_arg0 ) ) do
			if f45_local5 ~= f45_local0 and Cac.IsTraitUnlocked( f45_local5, f45_arg2 ) then
				f45_local0 = f45_local5
				break
			end
		end
	end
	f45_arg1.archetypePerk:SetValue( f45_arg2, f45_local0 )
	f45_arg1.archetypeSuper:SetValue( f45_arg2, f45_local1 )
end

Cac.ApplyRigPreferences = function ( f46_arg0, f46_arg1, f46_arg2, f46_arg3 )
	local f46_local0 = f46_arg1.archetypePerk:GetValue( f46_arg3 )
	local f46_local1 = f46_arg1.archetypeSuper:GetValue( f46_arg3 )
	f46_arg2.archetypePerk.ref:SetValue( f46_arg3, f46_local0 )
	f46_arg2.archetypeSuper.ref:SetValue( f46_arg3, f46_local1 )
end

Cac.ApplyRigCustomizations = function ( f47_arg0, f47_arg1, f47_arg2 )
	f47_arg1.head.ref:SetValue( f47_arg2, f47_arg0.head.ref:GetValue( f47_arg2 ) )
	f47_arg1.body.ref:SetValue( f47_arg2, f47_arg0.body.ref:GetValue( f47_arg2 ) )
end

Cac.GetSuperRowList = function ()
	return SUPER_ROW_LIST
end

Cac.BuildSuperRowList = function ()
	local f49_local0 = {}
	local f49_local1 = CSV.supers
	local f49_local2 = f49_local1.file
	for f49_local3 = 1, Engine.TableGetRowCount( f49_local2 ), 1 do
		local f49_local6 = CSV.ReadRow( {
			file = f49_local2,
			cols = f49_local1.cols
		}, f49_local3 )
		local f49_local7 = f49_local6.ref
		if f49_local7 ~= "" then
			f49_local0[f49_local7] = {
				row = f49_local3,
				ref = f49_local7,
				rigRef = f49_local6.rigRef,
				image = f49_local6.uiImageSmall,
				fullImage = f49_local6.uiImageLarge,
				superName = Engine.Localize( f49_local6.uiName ),
				desc = Engine.Localize( f49_local6.uiDesc )
			}
		end
	end
	return f49_local0
end

Cac.GetRigSupersDataSource = function ( f50_arg0 )
	local f50_local0 = RIG_LIST[f50_arg0].supers
	local f50_local1 = {}
	for f50_local6, f50_local7 in pairs( f50_local0 ) do
		local f50_local8 = "super" .. f50_local7.index
		if not f50_local1[f50_local8] then
			f50_local1[f50_local8] = {}
		end
		local f50_local5 = "frontEnd.MP.CAC.rig." .. f50_arg0 .. ".supers." .. f50_local6 .. ".supers"
		f50_local1[f50_local8].superName = LUI.DataSourceInGlobalModel.new( f50_local5 .. ".superName", Engine.Localize( f50_local7.name ) )
		f50_local1[f50_local8].desc = LUI.DataSourceInGlobalModel.new( f50_local5 .. ".desc", Engine.Localize( f50_local7.desc ) )
		f50_local1[f50_local8].image = LUI.DataSourceInGlobalModel.new( f50_local5 .. ".image", f50_local7.image )
		f50_local1[f50_local8].fullImage = LUI.DataSourceInGlobalModel.new( f50_local5 .. ".fullImage", f50_local7.fullImage )
		f50_local1[f50_local8].manufacturersImage = LUI.DataSourceInGlobalModel.new( f50_local5 .. ".manufacturersImage", f50_local7.manufacturersImage )
		f50_local1[f50_local8].ref = LUI.DataSourceInGlobalModel.new( f50_local5 .. ".ref", f50_local6 )
	end
	f50_local2 = LUI.DataSourceFromList.new( CountTableKeys( RIG_LIST[f50_arg0].supers ) )
	f50_local2.MakeDataSourceAtIndex = function ( f51_arg0, f51_arg1, f51_arg2 )
		return f50_local1["super" .. f51_arg1]
	end
	
	f50_local2:SetCachingEnabled( true )
	return f50_local2
end

Cac.GetRigSuperIndex = function ( f52_arg0, f52_arg1 )
	assert( RIG_LIST[f52_arg0] )
	assert( RIG_LIST[f52_arg0].supers[f52_arg1] )
	return RIG_LIST[f52_arg0].supers[f52_arg1].index
end

Cac.GetTraitsForRig = function ( f53_arg0 )
	assert( RIG_LIST[f53_arg0] )
	return RIG_LIST[f53_arg0].perks
end

Cac.GetSupersForRig = function ( f54_arg0 )
	assert( RIG_LIST[f54_arg0] )
	return RIG_LIST[f54_arg0].supers
end

Cac.IsSuperInUse = function ( f55_arg0 )
	local f55_local0
	if f55_arg0 == Cac.superNoneValue or f55_arg0 == "" then
		f55_local0 = false
	else
		f55_local0 = true
	end
	return f55_local0
end

Cac.IsSuperUnlocked = function ( f56_arg0, f56_arg1 )
	return Engine.IsUnlocked( f56_arg1, "super", f56_arg0 )
end

Cac.IsTraitUnlocked = function ( f57_arg0, f57_arg1 )
	return Engine.IsUnlocked( f57_arg1, "trait", f57_arg0 )
end

Cac.GetItemRigPackageUnlockRank = function ( f58_arg0, f58_arg1 )
	local f58_local0 = LUI.Split( Engine.TableLookup( f58_arg1.file, f58_arg1.cols.ref, f58_arg0, f58_arg1.cols.rigPackage ), ":" )
	local f58_local1 = f58_local0[2]
	assert( f58_local1 )
	return Cac.GetRigPackageUnlockRank( f58_local1 )
end

Cac.GetRigPackageUnlockRank = function ( f59_arg0 )
	return Rank.GetRankFromRankDisplay( Engine.TableLookup( CSV.rigPackageUnlockTable.file, CSV.rigPackageUnlockTable.cols.ref, f59_arg0, CSV.rigPackageUnlockTable.cols.unlockRank ) )
end

Cac.GetRigItemCardData = function ( f60_arg0 )
	local f60_local0 = Cac.GetItemRigPackageUnlockRank( f60_arg0, CSV.rigUnlockTable )
	return {
		name = Cac.GetRigName( f60_arg0 ),
		image = Cac.GetRigIcon( f60_arg0 ),
		desc = Cac.GetRigDesc( f60_arg0 ),
		title = Engine.Localize( "LUA_MENU_MP_ITEM_CARD_TITLE_RIG" ),
		rank = Rank.GetRankDisplay( f60_local0 ),
		rankIcon = Rank.GetRankIcon( f60_local0, 0 ),
		rankName = Rank.GetShortRank( f60_local0 )
	}
end

Cac.GetRigSuperItemCardData = function ( f61_arg0 )
	local f61_local0 = Cac.GetItemRigPackageUnlockRank( f61_arg0, CSV.rigSuperUnlockTable )
	local f61_local1 = Cac.GetSuperRig( f61_arg0 )
	return {
		name = Cac.GetSuperName( f61_arg0 ),
		image = Cac.GetSuperImage( f61_arg0 ),
		desc = Cac.GetSuperDesc( f61_arg0 ),
		rigName = Cac.GetRigName( f61_local1 ),
		title = Engine.Localize( "LUA_MENU_MP_ITEM_CARD_TITLE_SUPER", Cac.GetRigName( f61_local1 ) ),
		rank = Rank.GetRankDisplay( f61_local0 ),
		rankIcon = Rank.GetRankIcon( f61_local0, 0 ),
		rankName = Rank.GetShortRank( f61_local0 )
	}
end

Cac.GetRigTraitItemCardData = function ( f62_arg0 )
	local f62_local0 = Cac.GetItemRigPackageUnlockRank( f62_arg0, CSV.rigTraitUnlockTable )
	local f62_local1 = Cac.GetTraitRig( f62_arg0 )
	return {
		name = Cac.GetPerkName( f62_arg0 ),
		image = Cac.GetPerkFullImage( f62_arg0 ),
		desc = Cac.GetPerkDesc( f62_arg0 ),
		rigName = Cac.GetRigName( f62_local1 ),
		title = Engine.Localize( "LUA_MENU_MP_ITEM_CARD_TITLE_TRAIT", Cac.GetRigName( f62_local1 ) ),
		rank = Rank.GetRankDisplay( f62_local0 ),
		rankIcon = Rank.GetRankIcon( f62_local0, 0 ),
		rankName = Rank.GetShortRank( f62_local0 )
	}
end

Cac.RequestAndSetRig = function ( f63_arg0, f63_arg1, f63_arg2, f63_arg3 )
	local f63_local0 = Engine.TableLookup( CSV.bodies.file, CSV.bodies.cols.ref, f63_arg2, CSV.bodies.cols.model )
	local f63_local1 = Engine.TableLookup( CSV.heads.file, CSV.heads.cols.ref, f63_arg1, CSV.heads.cols.model )
	if f63_local0 and f63_local0 ~= "" then
		Streaming.RequestBodyModels( {
			f63_local0
		} )
	end
	if f63_local1 and f63_local1 ~= "" then
		Streaming.RequestHeadModels( {
			f63_local1
		} )
	end
	FrontEndScene.SetCharacterModels( FrontEndScene.ClientCharacters.Customization, f63_local0, f63_local1 )
	FrontEndScene.SetCustomizationWeaponForSuper( FrontEndScene.ClientCharacters.Customization, f63_arg3, f63_arg0 )
	FrontEndScene.PlayCustomizationIdle( FrontEndScene.ClientCharacters.Customization, f63_arg0 )
	local f63_local2 = Cac.GetRigOffset( Cac.GetRigTableIndex( f63_arg0 ) )
	ClientCharacter.SetCharacterOffset( FrontEndScene.ClientCharacters.Customization, tonumber( f63_local2[1] ), tonumber( f63_local2[2] ), tonumber( f63_local2[3] ) )
end

Cac.GetRigEquippedFilter = function ( f64_arg0 )
	return function ( f65_arg0, f65_arg1 )
		return f64_arg0:GetValue( f65_arg1 ) == f65_arg0
	end
	
end

Cac.RigMenuFocusFunction = function ( f66_arg0, f66_arg1, f66_arg2, f66_arg3 )
	return function ( f67_arg0, f67_arg1, f67_arg2, f67_arg3 )
		local f67_local0 = f66_arg0.RigTabs.Tabs:GetTabManagerDataSource()
		f67_local0 = f67_local0:GetCountValue( f66_arg3 )
		local f67_local1 = f66_arg0.RigTabs.Tabs:GetCurrentTabIndex()
		local f67_local2 = 1
		local f67_local3 = nil
		if not f67_local1 then
			f67_local1 = 0
		else
			if f67_local1 == f67_local0 - 1 then
				f67_local2 = nil
			else
				f67_local2 = f67_local1 + 1
			end
			if f67_local1 == 0 then
				f67_local3 = nil
			else
				f67_local3 = f67_local1 - 1
			end
		end
		if f67_local1 then
			local f67_local4 = f66_arg0.RigTabs.Tabs:GetTabManagerDataSource()
			f66_arg0.RigDetailsLeft:SetDataSource( f67_local4:GetDataSourceAtIndex( f67_local1, f66_arg3 ), f66_arg3 )
			f66_arg0.RigDetailsLeft.RigNumber:setText( string.format( "%02d", f67_local1 + 1 ) )
			f66_arg0.RigDetailsLeft:SetAlpha( 1, 0 )
			ACTIONS.AnimateSequence( f66_arg0.RigDetailsLeft, "Focused" )
			f66_arg0.FrameLeftHor:SetLeft( _1080p * 119, 200, LUI.EASING.outBack )
			f66_arg0.FrameLeftHor:SetRight( _1080p * 129, 200, LUI.EASING.outBack )
			f66_arg0.FrameLeftVert:SetLeft( _1080p * 129, 200, LUI.EASING.outBack )
			f66_arg0.FrameLeftVert:SetRight( _1080p * 130, 200, LUI.EASING.outBack )
		else
			f66_arg0.RigDetailsLeft:SetAlpha( 0, 0 )
			f66_arg0.FrameLeftHor:SetLeft( _1080p * 85.5, 200, LUI.EASING.inBack )
			f66_arg0.FrameLeftHor:SetRight( _1080p * 95.5, 200, LUI.EASING.inBack )
			f66_arg0.FrameLeftVert:SetLeft( _1080p * 95.5, 200, LUI.EASING.inBack )
			f66_arg0.FrameLeftVert:SetRight( _1080p * 96.5, 200, LUI.EASING.inBack )
		end
		if f67_local2 then
			local f67_local4 = f66_arg0.RigTabs.Tabs:GetTabManagerDataSource()
			f66_arg0.RigDetailsRight:SetDataSource( f67_local4:GetDataSourceAtIndex( f67_local2, f66_arg3 ), f66_arg3 )
			f66_arg0.RigDetailsRight.RigNumber:setText( string.format( "%02d", f67_local2 + 1 ) )
			f66_arg0.RigDetailsRight:SetAlpha( 1, 0 )
			ACTIONS.AnimateSequence( f66_arg0.RigDetailsRight, "NotFocused" )
			f66_arg0.FrameRightHor:SetLeft( _1080p * -119, 200, LUI.EASING.outBack )
			f66_arg0.FrameRightHor:SetRight( _1080p * -129, 200, LUI.EASING.outBack )
			f66_arg0.FrameRightVert:SetLeft( _1080p * -129, 200, LUI.EASING.outBack )
			f66_arg0.FrameRightVert:SetRight( _1080p * -130, 200, LUI.EASING.outBack )
			f66_arg0.RigDetailsGradientR:SetLeft( _1080p * -129, 200, LUI.EASING.outBack )
			f66_arg0.RigDetailsGradientR:SetRight( _1080p * -39, 200, LUI.EASING.outBack )
			f66_arg0.RigDetailsGradientR:SetAlpha( _1080p * 0.4, 200, LUI.EASING.outBack )
		else
			f66_arg0.RigDetailsRight:SetAlpha( 0, 0 )
			f66_arg0.FrameRightHor:SetLeft( _1080p * -85.5, 200, LUI.EASING.inBack )
			f66_arg0.FrameRightHor:SetRight( _1080p * -95.5, 200, LUI.EASING.inBack )
			f66_arg0.FrameRightVert:SetLeft( _1080p * -95.5, 200, LUI.EASING.inBack )
			f66_arg0.FrameRightVert:SetRight( _1080p * -96.5, 200, LUI.EASING.inBack )
			f66_arg0.RigDetailsGradientR:SetLeft( _1080p * -95.5, 200, LUI.EASING.inBack )
			f66_arg0.RigDetailsGradientR:SetRight( _1080p * -5.5, 200, LUI.EASING.inBack )
			f66_arg0.RigDetailsGradientR:SetAlpha( _1080p * 0, 200, LUI.EASING.inBack )
		end
		Cac.RequestAndSetRig( f66_arg1, f66_arg2.head:GetValue( f66_arg3 ), f66_arg2.body:GetValue( f66_arg3 ), f66_arg2.archetypeSuper:GetValue( f66_arg3 ) )
	end
	
end

local f0_local0 = function ( f68_arg0, f68_arg1, f68_arg2 )
	return function ( f69_arg0, f69_arg1 )
		local f69_local0 = f68_arg0.ref:GetValue( f69_arg1 )
		local f69_local1 = f68_arg1.rigRef:GetValue( f69_arg1 )
		local f69_local2 = nil
		if f69_local0 == f69_local1 then
			f69_local2 = f68_arg1.archetypePerk.ref:GetValue( f69_arg1 )
		else
			f69_local2 = f69_arg0
		end
		return f69_local2
	end
	
end

local f0_local1 = function ( f70_arg0, f70_arg1, f70_arg2 )
	return function ( f71_arg0, f71_arg1 )
		local f71_local0 = f70_arg0.ref:GetValue( f71_arg1 )
		local f71_local1 = f70_arg1.rigRef:GetValue( f71_arg1 )
		local f71_local2 = nil
		if f71_local0 == f71_local1 then
			f71_local2 = f70_arg1.archetypeSuper.ref:GetValue( f71_arg1 )
		else
			f71_local2 = f71_arg0
		end
		return f71_local2
	end
	
end

local f0_local2 = function ( f72_arg0, f72_arg1, f72_arg2, f72_arg3 )
	local f72_local0 = f72_arg0.rigRef:GetValue( f72_arg3 )
	local f72_local1 = f72_arg2.ref:GetValue( f72_arg3 )
	local f72_local2, f72_local3, f72_local4, f72_local5, f72_local6 = nil
	local f72_local7 = Cac.GetPreferencesForRig( f72_arg1.archetypePreferences, f72_local1, f72_arg3 )
	local f72_local8 = f72_local7.archetypePerk:Filter( f72_local1 .. "setupPerk", f0_local0( f72_arg2, f72_arg0, f72_arg3 ) )
	local f72_local9 = f72_local7.archetypeSuper:Filter( f72_local1 .. "setupSuper", f0_local1( f72_arg2, f72_arg0, f72_arg3 ) )
	return {
		archetypePerk = {
			ref = f72_local8,
			icon = f72_local8:Filter( "image", Cac.GetPerkImage ),
			name = f72_local8:Filter( "name", Cac.GetPerkName ),
			desc = f72_local8:Filter( "desc", Cac.GetPerkDesc ),
			manufacturersImage = f72_local8:Filter( "manufacturersImage", Cac.GetTraitManufacturersImage )
		},
		archetypeSuper = {
			ref = f72_local9,
			icon = f72_local9:Filter( "image", Cac.GetSuperImage ),
			name = f72_local9:Filter( "name", Cac.GetSuperName ),
			desc = f72_local9:Filter( "desc", Cac.GetSuperDesc ),
			manufacturersImage = f72_local9:Filter( "manufacturersImage", Cac.GetSuperManufacturersImage )
		},
		rigPreferences = f72_local7
	}
end

local f0_local3 = function ( f73_arg0, f73_arg1 )
	return function ( f74_arg0, f74_arg1 )
		local f74_local0
		if f74_arg0 == f73_arg0 then
			f74_local0 = not f73_arg1
		else
			f74_local0 = false
		end
		return f74_local0
	end
	
end

local f0_local4 = function ( f75_arg0 )
	local f75_local0
	if f75_arg0 then
		f75_local0 = 1
		if not f75_local0 then
		
		else
			return f75_local0
		end
	end
	f75_local0 = 0
end

local f0_local5 = function ( f76_arg0, f76_arg1, f76_arg2 )
	return function ( f77_arg0, f77_arg1, f77_arg2 )
		assert( f77_arg1.superName )
		assert( f77_arg1.desc )
		assert( f77_arg1.image )
		assert( f77_arg1.fullImage )
		assert( f77_arg1.manufacturersImage )
		assert( f77_arg1.ref )
		local f77_local0 = f77_arg1.ref:GetValue( f77_arg2 )
		local f77_local1 = f76_arg0 .. "." .. f77_local0
		local f77_local2 = Cac.IsSuperUnlocked( f77_local0, f77_arg2 )
		local f77_local3 = Cac.IsUnlockedEsports( Engine.IsUnlocked( f77_arg2, "pro_super", f77_local0, true ) )
		if f77_local2 then
			f77_local2 = f77_local3
		end
		local f77_local4 = LUI.DataSourceInGlobalModel.new( f77_local1 .. ".unlocked", f77_local2 )
		local f77_local5 = LUI.DataSourceInGlobalModel.new( f77_local1 .. ".isDisabled", not f77_local2 )
		local f77_local6 = f76_arg1:Filter( "isEquipped" .. f77_local0, f0_local3( f77_local0, not f77_local2 ) )
		return {
			rigSuper = {
				rigRef = f76_arg2,
				ref = f77_arg1.ref,
				name = f77_arg1.superName,
				icon = f77_arg1.image,
				fullImage = f77_arg1.fullImage,
				manufacturersImage = f77_arg1.manufacturersImage,
				desc = f77_arg1.desc,
				isUnlocked = f77_local4,
				isDisabled = f77_local5,
				isEquipped = f77_local6,
				isEquippedAlpha = f77_local6:Filter( "isEquippedAlpha", f0_local4 )
			}
		}
	end
	
end

local f0_local6 = function ( f78_arg0, f78_arg1 )
	return function ( f79_arg0, f79_arg1 )
		local f79_local0
		if f79_arg0 == f78_arg0 then
			f79_local0 = not f78_arg1
		else
			f79_local0 = false
		end
		return f79_local0
	end
	
end

local f0_local7 = function ( f80_arg0 )
	local f80_local0
	if f80_arg0 then
		f80_local0 = 1
		if not f80_local0 then
		
		else
			return f80_local0
		end
	end
	f80_local0 = 0
end

local f0_local8 = function ( f81_arg0, f81_arg1, f81_arg2 )
	return function ( f82_arg0, f82_arg1, f82_arg2 )
		assert( f82_arg1.name )
		assert( f82_arg1.desc )
		assert( f82_arg1.image )
		assert( f82_arg1.fullImage )
		assert( f82_arg1.manufacturersImage )
		assert( f82_arg1.ref )
		local f82_local0 = f82_arg1.ref:GetValue( f82_arg2 )
		local f82_local1 = f81_arg0 .. "." .. f82_local0
		local f82_local2 = Engine.IsUnlocked( f82_arg2, "trait", f82_local0 )
		local f82_local3 = Cac.IsUnlockedEsports( Engine.IsUnlocked( f82_arg2, "pro_trait", f82_local0, true ) )
		if f82_local2 then
			f82_local2 = f82_local3
		end
		local f82_local4 = LUI.DataSourceInGlobalModel.new( f82_local1 .. ".unlocked", f82_local2 )
		local f82_local5 = LUI.DataSourceInGlobalModel.new( f82_local1 .. ".isDisabled", not f82_local2 )
		local f82_local6 = f81_arg1:Filter( "isEquipped" .. f82_local0, f0_local6( f82_local0, not f82_local2 ) )
		return {
			rigPerk = {
				rigRef = f81_arg2,
				ref = f82_arg1.ref,
				name = f82_arg1.name,
				icon = f82_arg1.image,
				fullImage = f82_arg1.fullImage,
				manufacturersImage = f82_arg1.manufacturersImage,
				desc = f82_arg1.desc,
				isUnlocked = f82_local4,
				isDisabled = f82_local5,
				isEquipped = f82_local6,
				isEquippedAlpha = f82_local6:Filter( "isEquippedAlpha", f0_local7 )
			}
		}
	end
	
end

local f0_local9 = function ( f83_arg0, f83_arg1, f83_arg2, f83_arg3 )
	assert( f83_arg3 )
	return function ( f84_arg0, f84_arg1 )
		assert( f84_arg1.ref )
		local f84_local0 = f84_arg1.ref:GetValue( f83_arg3 )
		local f84_local1 = LUI.ShallowCopy( f84_arg1 )
		local f84_local2 = f83_arg0 .. ".rig." .. f84_local0
		local f84_local3 = Engine.IsUnlocked( f83_arg3, "rig", f84_local0 )
		local f84_local4 = Cac.IsUnlockedEsports( Engine.IsUnlocked( f83_arg3, "pro_rig", f84_local0, true ) )
		if f84_local3 then
			f84_local3 = f84_local4
		end
		local f84_local5 = LUI.DataSourceInGlobalModel.new( f84_local2 .. ".isUnlocked", f84_local3 )
		local f84_local6 = LUI.DataSourceInGlobalModel.new( f84_local2 .. ".isDisabled", not f84_local3 )
		local f84_local7 = f83_arg1.rigRef:Filter( "isEquipped" .. f84_local0, Cac.GetRigEquippedFilter( f84_arg1.ref ) )
		local f84_local8 = Cac.GetPreferencesForRig( f83_arg2.archetypePreferences, f84_local0, f83_arg3 )
		assert( f84_local8 )
		local f84_local9 = f84_local8.archetypePerk
		local f84_local10 = f84_local8.archetypeSuper
		local f84_local11 = f84_arg1.rigPerks:Decorate( f0_local8( f83_arg0, f84_local9, f84_arg1.ref ) )
		f84_local11:SetCachingEnabled( true )
		f84_local11.GetDefaultFocusIndex = function ()
			local f85_local0 = f83_arg1.rigRef:GetValue( f83_arg3 )
			local f85_local1 = f84_local9:GetValue( f83_arg3 )
			if f85_local1 ~= Cac.traitNoneValue then
				return Cac.GetRigPerkIndex( f85_local0, f85_local1 )
			else
				
			end
		end
		
		f84_local1.decoratedRigPerks = f84_local11
		local f84_local12 = f84_arg1.supers:Decorate( f0_local5( f83_arg0, f84_local10, f84_arg1.ref ) )
		f84_local12:SetCachingEnabled( true )
		f84_local12.GetDefaultFocusIndex = function ()
			local f86_local0 = f83_arg1.rigRef:GetValue( f83_arg3 )
			local f86_local1 = f84_local10:GetValue( f83_arg3 )
			if f86_local1 ~= Cac.superNoneValue then
				return Cac.GetRigSuperIndex( f86_local0, f86_local1 )
			else
				
			end
		end
		
		f84_local1.decoratedSupers = f84_local12
		f84_local1.isUnlocked = f84_local5
		f84_local1.isDisabled = f84_local6
		f84_local1.isEquipped = f84_local7
		f84_local1.setupInfo = f0_local2( f83_arg1, f83_arg2, f84_arg1, f83_arg3 )
		return {
			rig = f84_local1
		}
	end
	
end

Cac.GetRigSelectDataSources = function ( f87_arg0, f87_arg1, f87_arg2, f87_arg3 )
	local f87_local0 = DataSources.frontEnd.MP.CAC.rigs:Decorate( f0_local9( f87_arg0, f87_arg1, f87_arg2, f87_arg3 ) )
	f87_local0:SetCachingEnabled( true )
	f87_local0.GetDefaultFocusIndex = function ()
		local f88_local0 = f87_arg1.rigRef:GetValue( f87_arg3 )
		assert( f88_local0 and #f88_local0 > 0 )
		return Cac.GetRigIndex( f88_local0 )
	end
	
	return f87_local0
end

Cac.GetRigPackageTrait = function ( f89_arg0 )
	return Engine.TableLookup( CSV.rigTraitUnlockTable.file, CSV.rigTraitUnlockTable.cols.rigPackage, "rigPackage:" .. f89_arg0, CSV.rigTraitUnlockTable.cols.ref )
end

Cac.GetRigPackageSuper = function ( f90_arg0 )
	return Engine.TableLookup( CSV.rigSuperUnlockTable.file, CSV.rigSuperUnlockTable.cols.rigPackage, "rigPackage:" .. f90_arg0, CSV.rigSuperUnlockTable.cols.ref )
end

Cac.GetRigPackageRig = function ( f91_arg0 )
	return Engine.TableLookup( CSV.rigUnlockTable.file, CSV.rigUnlockTable.cols.rigPackage, "rigPackage:" .. f91_arg0, CSV.rigUnlockTable.cols.ref )
end

Cac.GetRigPackageUnlocks = function ( f92_arg0, f92_arg1, f92_arg2, f92_arg3 )
	local f92_local0 = {}
	local f92_local1 = Cac.GetRigPackageTrait( f92_arg1 )
	if f92_local1 ~= "" then
		table.insert( f92_local0, {
			type = "trait",
			item = f92_local1,
			level = f92_arg2
		} )
		if f92_arg3 == true then
			Cac.SetNewUnlock( f92_arg0, "trait", f92_local1 )
		end
	end
	local f92_local2 = Cac.GetRigPackageRig( f92_arg1 )
	if f92_local2 ~= "" then
		table.insert( f92_local0, {
			type = "rig",
			item = f92_local2,
			level = f92_arg2
		} )
		if f92_arg3 == true then
			Cac.SetNewUnlock( f92_arg0, "rig", f92_local2 )
		end
	end
	local f92_local3 = Cac.GetRigPackageSuper( f92_arg1 )
	if f92_local3 ~= "" then
		table.insert( f92_local0, {
			type = "super",
			item = f92_local3,
			level = f92_arg2
		} )
		if f92_arg3 == true then
			Cac.SetNewUnlock( f92_arg0, "super", f92_local3 )
		end
	end
	return f92_local0
end

Cac.SetNewUnlock = function ( f93_arg0, f93_arg1, f93_arg2 )
	local f93_local0 = nil
	if f93_arg1 == "trait" then
		f93_local0 = Engine.TableLookupGetRowNum( CSV.rigTraitUnlockTable.file, CSV.rigTraitUnlockTable.cols.ref, f93_arg2 )
	elseif f93_arg1 == "super" then
		f93_local0 = Engine.TableLookupGetRowNum( CSV.rigSuperUnlockTable.file, CSV.rigSuperUnlockTable.cols.ref, f93_arg2 )
	elseif f93_arg1 == "rig" then
		f93_local0 = Engine.TableLookupGetRowNum( CSV.rigUnlockTable.file, CSV.rigUnlockTable.cols.ref, f93_arg2 )
	else
		assert( false )
	end
	if f93_local0 ~= nil then
		Rewards.SetNew( f93_arg0, f93_arg1, f93_local0 )
	end
end

Cac.GetRigSuperStreamer = function ()
	local f94_local0 = {}
	local f94_local1 = Engine.TableGetRowCount( CSV.supers.file )
	for self = 0, f94_local1 - 1, 1 do
		local f94_local5 = Engine.TableLookupByRow( CSV.supers.file, self, CSV.supers.cols.uiImageLarge )
		if #f94_local5 > 0 then
			table.insert( f94_local0, RegisterMaterial( f94_local5 ) )
		end
	end
	local self = LUI.UIElement.new()
	self.id = "RigSuperStreamer"
	self:SetupImageStreamer( f94_local0 )
	return self
end

Cac.IsTauntLocked = function ( f95_arg0, f95_arg1 )
	assert( f95_arg0 )
	assert( f95_arg1 )
	local f95_local0 = false
	local f95_local1 = Engine.TableLookup( CSV.taunts.file, CSV.taunts.cols.ref, f95_arg1, CSV.taunts.cols.unlockType )
	if f95_local1 == "loot" then
		local f95_local2 = Engine.TableLookup( CSV.cosmeticEmotesLootMaster.file, CSV.cosmeticEmotesLootMaster.cols.ref, f95_arg1, CSV.cosmeticEmotesLootMaster.cols.index )
		if f95_local2 ~= nil and #f95_local2 > 0 then
			f95_local0 = Loot.IsOwned( f95_arg0, tonumber( f95_local2 ) ) < 1
		end
	elseif f95_local1 == "unlock" then
		f95_local0 = not Engine.IsUnlocked( f95_arg0, "taunt", f95_arg1 )
	end
	return f95_local0
end

Cac.GetAltTauntAnim = function ( f96_arg0, f96_arg1, f96_arg2 )
	local f96_local0 = Engine.TableLookup( CSV.taunts.file, CSV.taunts.cols.index, f96_arg0, CSV.taunts.cols.altAnimRigRefs )
	if f96_local0 and #f96_local0 > 0 and string.find( f96_local0, f96_arg1 ) then
		local f96_local1 = CSV.taunts.cols.altAnim
		if f96_arg2 then
			f96_local1 = CSV.taunts.cols.altPreviewAnim
		end
		local f96_local2 = Engine.TableLookup( CSV.taunts.file, CSV.taunts.cols.index, f96_arg0, f96_local1 )
		if f96_local2 and #f96_local2 > 0 then
			return f96_local2
		end
	end
	return nil
end

Cac.HasRigItemBeenDrafted = function ( f97_arg0, f97_arg1 )
	return not Engine.IsXUIDInvalid( LoadoutDrafting.GetPlayerXUIDWithRig( f97_arg0, Cac.GetRigTableIndex( f97_arg1 ) ) )
end

Cac.GetSuperStats = function ( f98_arg0 )
	local f98_local0 = {}
	for f98_local1 = 0, Engine.TableGetRowCount( CSV.supers.file ), 1 do
		local f98_local4 = CSV.ReadRow( CSV.supers, f98_local1 )
		if tonumber( f98_local4.index ) ~= nil and 0 < tonumber( f98_local4.index ) then
			local f98_local5 = {
				ref = f98_local4.ref,
				name = Engine.Localize( f98_local4.uiName ),
				image = f98_local4.uiImageSmall,
				uses = Engine.GetPlayerDataEx( f98_arg0, CoD.StatsGroup.Ranked, "superStats", f98_local4.ref, "uses" ),
				kills = Engine.GetPlayerDataEx( f98_arg0, CoD.StatsGroup.Ranked, "superStats", f98_local4.ref, "kills" )
			}
			local f98_local6 = f98_local4.rigRef
			if f98_local0[f98_local6] == nil then
				f98_local0[f98_local6] = {}
			end
			table.insert( f98_local0[f98_local6], f98_local5 )
		end
	end
	for f98_local7, f98_local4 in pairs( f98_local0 ) do
		table.sort( f98_local4, function ( f99_arg0, f99_arg1 )
			return f99_arg1.kills < f99_arg0.kills
		end )
	end
	return f98_local0
end

Cac.GetRigStats = function ( f100_arg0 )
	local f100_local0 = {}
	local f100_local1 = Cac.GetSuperStats( f100_arg0 )
	for f100_local2 = 0, Engine.TableGetRowCount( CSV.battleRigs.file ), 1 do
		local f100_local5 = CSV.ReadRow( CSV.battleRigs, f100_local2 )
		if f100_local5 ~= nil and f100_local5.ref ~= "" then
			local f100_local6 = {
				ref = f100_local5.ref,
				name = Engine.Localize( f100_local5.name ),
				image = f100_local5.headshot,
				kills = Engine.GetPlayerDataEx( f100_arg0, CoD.StatsGroup.Ranked, "archetypeStats", f100_local5.ref, "kills" ),
				deaths = Engine.GetPlayerDataEx( f100_arg0, CoD.StatsGroup.Ranked, "archetypeStats", f100_local5.ref, "deaths" ),
				superStats = f100_local1[f100_local5.ref],
				kdr = f100_local6.kills / (f100_local6.deaths and f100_local6.deaths or 1)
			}
			table.insert( f100_local0, f100_local6 )
		end
	end
	table.sort( f100_local0, function ( f101_arg0, f101_arg1 )
		return f101_arg1.kills < f101_arg0.kills
	end )
	return f100_local0
end

Cac.IsHeroItem = function ( f102_arg0, f102_arg1 )
	local f102_local0 = CSV.cosmeticHeroesLootMaster
	local f102_local1 = ""
	local f102_local2 = ""
	if f102_arg0 == Cac.CustomizationTypes.HEAD then
		f102_local2 = Engine.TableLookup( f102_local0.file, f102_local0.cols.headModel, f102_arg1, f102_local0.cols.bodyModel )
	elseif f102_arg0 == Cac.CustomizationTypes.BODY then
		f102_local1 = Engine.TableLookup( f102_local0.file, f102_local0.cols.bodyModel, f102_arg1, f102_local0.cols.headModel )
	end
	local f102_local3
	if #f102_local1 <= 0 and #f102_local2 <= 0 then
		f102_local3 = false
	else
		f102_local3 = true
	end
	return f102_local3
end

Cac.IsCustomizationItemUnlocked = function ( f103_arg0, f103_arg1, f103_arg2 )
	local f103_local0 = Cac.GetCustomizationCSV( f103_arg1 )
	local f103_local1 = Cac.GetCustomizationLootCSV( f103_arg1 )
	local f103_local2 = Engine.TableLookup( f103_local0.file, f103_local0.cols.index, f103_arg2, f103_local0.cols.unlockType )
	if IsSystemLink() and f103_arg1 == Cac.CustomizationTypes.GESTURE then
		local f103_local3 = Engine.TableLookup( f103_local0.file, f103_local0.cols.index, f103_arg2, f103_local0.cols.ref )
		local f103_local4 = Engine.TableLookup( f103_local0.file, f103_local0.cols.index, f103_arg2, f103_local0.cols.hideUnlessUnlocked ) == "1"
		local f103_local5 = Engine.TableLookup( f103_local1.file, f103_local1.cols.ref, f103_local3, f103_local1.cols.index )
		if f103_local4 then
			if f103_local5 and #f103_local5 > 0 then
				return Loot.IsOwned( f103_arg0, tonumber( f103_local5 ) ) > 0
			else
				return true
			end
		else
			return true
		end
	elseif f103_local2 == "loot" then
		local f103_local3 = nil
		if f103_arg1 == Cac.CustomizationTypes.HEAD or f103_arg1 == Cac.CustomizationTypes.BODY then
			f103_local3 = Engine.TableLookup( f103_local0.file, f103_local0.cols.index, f103_arg2, f103_local0.cols.model )
		elseif f103_arg1 == Cac.CustomizationTypes.GESTURE then
			f103_local3 = Engine.TableLookup( f103_local0.file, f103_local0.cols.index, f103_arg2, f103_local0.cols.ref )
		else
			error( "Unexpected customizationType" )
		end
		local f103_local4 = Engine.TableLookup( f103_local1.file, f103_local1.cols.ref, f103_local3, f103_local1.cols.index )
		if f103_local4 and #f103_local4 > 0 then
			return Loot.IsOwned( f103_arg0, tonumber( f103_local4 ) ) > 0
		else
			return true
		end
	elseif f103_local2 == "unlock" then
		local f103_local3 = Engine.TableLookup( f103_local0.file, f103_local0.cols.index, f103_arg2, f103_local0.cols.ref )
		local f103_local4 = true
		local f103_local5 = false
		if f103_arg1 == Cac.CustomizationTypes.HEAD or f103_arg1 == Cac.CustomizationTypes.BODY then
			f103_local4 = Cac.IsUnlockedEsports( Engine.IsUnlocked( f103_arg0, "pro_" .. f103_arg1, f103_local3, true ) )
			f103_local5 = Cac.IsHeroItem( f103_arg1, Engine.TableLookup( f103_local0.file, f103_local0.cols.index, f103_arg2, f103_local0.cols.model ) )
		end
		return Engine.IsUnlocked( f103_arg0, f103_arg1, f103_local3, f103_local5 ) and f103_local4
	else
		
	end
end

local f0_local10 = function ( f104_arg0, f104_arg1 )
	local f104_local0 = Cac.GetCustomizationCSV( f104_arg1 )
	for f104_local1 = 0, Engine.TableGetRowCount( f104_local0.file ), 1 do
		if not (Engine.TableLookupByRow( f104_local0.file, f104_local1, f104_local0.cols.releaseKillswitch ) == "1") then
			local f104_local4 = Engine.TableLookupByRow( f104_local0.file, f104_local1, f104_local0.cols.index )
			local f104_local5 = Engine.TableLookupByRow( f104_local0.file, f104_local1, f104_local0.cols.rigRef )
			local f104_local6 = f104_local5 == f104_arg0
			local f104_local7 = f104_local5 == "allRigs"
			local f104_local8
			if f104_local5 == "archetype_scout" or f104_local5 ~= "allRigsButC6" then
				f104_local8 = false
			else
				f104_local8 = true
			end
			if (f104_local6 or f104_local7 or f104_local8) and Engine.TableLookupByRow( f104_local0.file, f104_local1, f104_local0.cols.uiCategory ) == "default" then
				return Engine.TableLookupByRow( f104_local0.file, f104_local1, f104_local0.cols.model )
			end
		end
	end
end

Cac.GetCompatibleHeadAndBody = function ( f105_arg0, f105_arg1, f105_arg2, f105_arg3 )
	local f105_local0 = GetSquadMemberDataSource()
	local f105_local1 = Cac.GetPreferencesForRig( f105_local0.archetypePreferences, f105_arg1, f105_arg0 )
	local f105_local2 = f105_local1.head:GetValue( f105_arg0 )
	local f105_local3 = f105_local1.body:GetValue( f105_arg0 )
	local f105_local4 = Engine.TableLookup( CSV.heads.file, CSV.heads.cols.ref, f105_local2, CSV.heads.cols.model )
	local f105_local5 = Engine.TableLookup( CSV.bodies.file, CSV.bodies.cols.ref, f105_local3, CSV.bodies.cols.model )
	local f105_local6 = f105_arg2 or f105_local4
	local f105_local7 = f105_arg3 or f105_local5
	local f105_local8 = CSV.cosmeticHeroesLootMaster
	local f105_local9 = Engine.TableLookup( f105_local8.file, f105_local8.cols.headModel, f105_local6, f105_local8.cols.bodyModel )
	local f105_local10 = Engine.TableLookup( f105_local8.file, f105_local8.cols.bodyModel, f105_local7, f105_local8.cols.headModel )
	local f105_local11 = #f105_local9 > 0
	local f105_local12 = #f105_local10 > 0
	if (f105_local12 and f105_local6 ~= f105_local10) or f105_local11 and f105_local7 ~= f105_local9 then
		local f105_local13 = assert
		local f105_local14
		if f105_arg3 then
			f105_local14 = not f105_arg2
		else
			f105_local14 = true
		end
		f105_local13( f105_local14 )
		if f105_arg3 then
			if f105_local12 then
				f105_local6 = f105_local10
			else
				f105_local6 = f0_local10( f105_arg1, Cac.CustomizationTypes.HEAD )
			end
		elseif f105_local11 then
			f105_local7 = f105_local9
		else
			f105_local7 = f0_local10( f105_arg1, Cac.CustomizationTypes.BODY )
		end
	end
	assert( f105_local6 )
	assert( f105_local7 )
	return f105_local6, f105_local7
end

