FrontEndScene = FrontEndScene or {}
FrontEndScene.ClientCharacters = {
	Self = 0,
	Customization = 1,
	LobbyMember = 2,
	Profile = 3,
	quarterMaster = 4,
	LootBox = 5
}
FrontEndScene.NumWeaponModels = 3
FrontEndScene.CurrentMissionTeam = MissionDirector.InvalidTeamID
FrontEndScene.SetCharacterModels = function ( f1_arg0, f1_arg1, f1_arg2 )
	if f1_arg2 and f1_arg2 ~= "" then
		ClientCharacter.SetCharacterModels( f1_arg0, f1_arg1, f1_arg2 )
		FrontEndScene.PlayFacialIdleAnim( f1_arg0 )
	else
		ClientCharacter.SetCharacterModels( f1_arg0, f1_arg1 )
	end
end

FrontEndScene.SetCharacterModelsByIndex = function ( f2_arg0, f2_arg1, f2_arg2 )
	FrontEndScene.SetCharacterModels( f2_arg0, Engine.TableLookup( CSV.bodies.file, CSV.bodies.cols.index, f2_arg1, CSV.bodies.cols.model ), Engine.TableLookup( CSV.heads.file, CSV.heads.cols.index, f2_arg2, CSV.heads.cols.model ) )
end

FrontEndScene.SetCharacterToRig = function ( f3_arg0, f3_arg1, f3_arg2, f3_arg3 )
	local f3_local0, f3_local1 = nil
	if f3_arg2 then
		local f3_local2 = Cac.GetPreferencesForRig( f3_arg2, f3_arg1, f3_arg3 )
		f3_local0 = Engine.TableLookup( CSV.bodies.file, CSV.bodies.cols.ref, f3_local2.body:GetValue( f3_arg3 ), CSV.bodies.cols.index )
		f3_local1 = Engine.TableLookup( CSV.heads.file, CSV.heads.cols.ref, f3_local2.head:GetValue( f3_arg3 ), CSV.heads.cols.index )
	end
	if not f3_local0 then
		f3_local0 = Cac.GetRigBaseBodyModel( f3_arg1 )
	end
	if not f3_local1 then
		f3_local1 = Cac.GetRigBaseHeadModel( f3_arg1 )
	end
	FrontEndScene.SetCharacterModels( f3_arg0, Engine.TableLookup( CSV.bodies.file, CSV.bodies.cols.index, f3_local0, CSV.bodies.cols.model ), Engine.TableLookup( CSV.heads.file, CSV.heads.cols.index, f3_local1, CSV.heads.cols.model ) )
	local f3_local3 = Cac.GetRigOffset( Cac.GetRigTableIndex( f3_arg1 ) )
	ClientCharacter.SetCharacterOffset( f3_arg0, tonumber( f3_local3[1] ), tonumber( f3_local3[2] ), tonumber( f3_local3[3] ) )
	local f3_local4 = Cac.GetRigFrontEndIdleAnim( f3_arg1 )
	if f3_local4 and f3_local4 ~= "" then
		ClientCharacter.PlayCharacterAnim( f3_arg0, f3_local4 )
	end
end

FrontEndScene.SetCharacterVisible = function ( f4_arg0, f4_arg1 )
	ClientCharacter.SetCharacterVisible( f4_arg0, f4_arg1 )
end

FrontEndScene.GetWeaponModelOffset = function ( f5_arg0 )
	local f5_local0 = Engine.IsAliensMode() and "cp/frontEndWeaponModelData.csv" or "mp/frontEndWeaponModelData.csv"
	local f5_local1 = LUI.Split( f5_arg0, "+" )
	local f5_local2 = Engine.TableLookupGetRowNum( f5_local0, CSV.weaponOffsets.cols.modelName, f5_local1[1] )
	if f5_local2 and f5_local2 > -1 then
		return tonumber( Engine.TableLookupByRow( f5_local0, f5_local2, CSV.weaponOffsets.cols.xOffset ) ), tonumber( Engine.TableLookupByRow( f5_local0, f5_local2, CSV.weaponOffsets.cols.yOffset ) ), tonumber( Engine.TableLookupByRow( f5_local0, f5_local2, CSV.weaponOffsets.cols.zOffset ) ), tonumber( Engine.TableLookupByRow( f5_local0, f5_local2, CSV.weaponOffsets.cols.xRotationCenter ) ), tonumber( Engine.TableLookupByRow( f5_local0, f5_local2, CSV.weaponOffsets.cols.yRotationCenter ) ), tonumber( Engine.TableLookupByRow( f5_local0, f5_local2, CSV.weaponOffsets.cols.zRotationCenter ) ), tonumber( Engine.TableLookupByRow( f5_local0, f5_local2, CSV.weaponOffsets.cols.xDefaultAngle ) ), tonumber( Engine.TableLookupByRow( f5_local0, f5_local2, CSV.weaponOffsets.cols.yDefaultAngle ) ), tonumber( Engine.TableLookupByRow( f5_local0, f5_local2, CSV.weaponOffsets.cols.zDefaultAngle ) )
	else
		return 0, 0, 0, 0, 0, 0, 0, 0, 0
	end
end

FrontEndScene.SetWeaponModel = function ( f6_arg0, f6_arg1, f6_arg2 )
	if f6_arg2 then
		local f6_local0, f6_local1, f6_local2, f6_local3, f6_local4, f6_local5, f6_local6, f6_local7, f6_local8 = FrontEndScene.GetWeaponModelOffset( f6_arg1 )
		ClientWeapon.SetWeaponOffset( f6_arg0, f6_local0, f6_local1, f6_local2 )
		ClientWeapon.SetWeaponRotationCenter( f6_arg0, f6_local3, f6_local4, f6_local5 )
		ClientWeapon.SetWeaponDefaultAngles( f6_arg0, f6_local6, f6_local7, f6_local8 )
	end
	ClientWeapon.SetWeaponModel( f6_arg0, f6_arg1 )
end

FrontEndScene.SetScene = function ( f7_arg0 )
	Engine.SetFrontEndSceneSection( f7_arg0, FrontEndScene.CurrentMissionTeam )
end

FrontEndScene.SetTeamAndScene = function ( f8_arg0, f8_arg1 )
	if IsPublicMatch() and Engine.IsCoreMode() then
		FrontEndScene.CurrentMissionTeam = MissionDirector.GetActiveMissionTeam( f8_arg1 )
	else
		FrontEndScene.CurrentMissionTeam = MissionDirector.InvalidTeamID
	end
	FrontEndScene.SetScene( f8_arg0 )
end

FrontEndScene.HideWeaponModels = function ()
	for f9_local0 = 0, FrontEndScene.NumWeaponModels - 1, 1 do
		ClientWeapon.SetWeaponVisible( f9_local0, false )
	end
end

FrontEndScene.PlayIdleForSuper = function ( f10_arg0, f10_arg1, f10_arg2 )
	if f10_arg1 == Cac.superNoneValue then
		f10_arg1 = Cac.noneSuper[f10_arg2]
	end
	local f10_local0 = Engine.TableLookup( CSV.supers.file, CSV.supers.cols.ref, f10_arg1, CSV.supers.cols.rigIdleAnim )
	if ClientCharacter.IsUsingModel( f10_arg0, "mp_warfighter_body_mco" ) then
		f10_local0 = f10_local0 .. "_omar"
	end
	if f10_local0 and f10_local0 ~= "" then
		ClientCharacter.PlayCharacterAnim( f10_arg0, f10_local0 )
	else
		DebugPrint( "ERROR: FrontEndScene.PlayIdleForSuper - Unable to find idle anim for super " .. f10_arg1 )
	end
end

FrontEndScene.PlayFacialIdleAnim = function ( f11_arg0 )
	local f11_local0 = "iw7_mp_frontend_facial_loop01"
	if ClientCharacter.IsUsingModel( f11_arg0, "mp_synaptic_ethan_body" ) then
		f11_local0 = f11_local0 .. "_eth3n"
	end
	if f11_local0 and f11_local0 ~= "" then
		ClientCharacter.PlayCharacterFacialAnim( f11_arg0, f11_local0 )
	else
		DebugPrint( "ERROR: FrontEndScene.PlayFacialIdle - Unable to find idle anim for face " )
	end
end

FrontEndScene.SetWeaponForSuper = function ( f12_arg0, f12_arg1, f12_arg2 )
	if f12_arg1 == Cac.superNoneValue then
		f12_arg1 = Cac.noneSuper[f12_arg2]
	end
	local f12_local0 = Engine.TableLookup( CSV.supers.file, CSV.supers.cols.ref, f12_arg1, CSV.supers.cols.frontEndWeaponModel )
	if f12_local0 and f12_local0 ~= "" then
		ClientCharacter.SetCharacterAkimbo( f12_arg0, false )
		ClientCharacter.SetCharacterWeapons( f12_arg0, f12_local0 )
		ClientCharacter.SetCharacterWeaponVisible( f12_arg0, true )
	else
		ClientCharacter.SetCharacterWeapons( f12_arg0, nil )
	end
end

FrontEndScene.SetCustomizationWeaponForSuper = function ( f13_arg0, f13_arg1, f13_arg2 )
	if f13_arg1 == Cac.superNoneValue then
		f13_arg1 = Cac.noneSuper[f13_arg2]
	end
	local f13_local0 = Engine.TableLookup( CSV.supers.file, CSV.supers.cols.ref, f13_arg1, CSV.supers.cols.customizationWeaponModel )
	if f13_local0 and f13_local0 ~= "" then
		ClientCharacter.SetCharacterAkimbo( f13_arg0, false )
		ClientCharacter.SetCharacterWeapons( f13_arg0, f13_local0 )
	else
		ClientCharacter.SetCharacterWeapons( f13_arg0, nil )
	end
end

FrontEndScene.PlayQuarterMasterAnim = function ( f14_arg0, f14_arg1, f14_arg2, f14_arg3, f14_arg4 )
	assert( f14_arg0 )
	if f14_arg2 and f14_arg2 ~= "" then
		ClientCharacter.PlayCharacterAnim( FrontEndScene.ClientCharacters.quarterMaster, f14_arg2, 0.2 )
		ClientCharacter.QueueCharacterAnim( FrontEndScene.ClientCharacters.quarterMaster, "iw7_mp_quartermaster_idle_01", 0.2 )
	end
	if f14_arg3 and f14_arg3 ~= "" then
		if f14_arg4 and f14_arg4 > 0 then
			local f14_local0 = f14_arg0:Wait( f14_arg4 )
			f14_local0.onComplete = function ()
				f14_arg0.lastQuartermasterSoundID = Engine.PlaySound( f14_arg3 )
			end
			
		else
			f14_arg0.lastQuartermasterSoundID = Engine.PlaySound( f14_arg3 )
		end
	end
end

FrontEndScene.PlayQuarterMasterRandomAnim = function ( f16_arg0, f16_arg1 )
	local f16_local0 = Engine.TableGetRowCount( f16_arg1 )
	if f16_local0 > 0 then
		local f16_local1 = math.random( 0, f16_local0 - 1 )
		FrontEndScene.PlayQuarterMasterAnim( f16_arg0, FrontEndScene.ClientCharacters.quarterMaster, Engine.TableLookupByRow( f16_arg1, f16_local1, CSV.quartermasterAnims.cols.anim ), Engine.TableLookupByRow( f16_arg1, f16_local1, CSV.quartermasterAnims.cols.audio ), tonumber( Engine.TableLookupByRow( f16_arg1, f16_local1, CSV.quartermasterAnims.cols.audioDelay ) ) )
	end
end

FrontEndScene.PlayQuarterMasterQualityReaction = function ( f17_arg0, f17_arg1 )
	local f17_local0 = tonumber( f17_arg1 )
	if f17_local0 >= 4 then
		FrontEndScene.PlayQuarterMasterRandomAnim( f17_arg0, ARMORY.QuartermasterFiles.ItemReactions.Epic )
	elseif f17_local0 == 3 then
		FrontEndScene.PlayQuarterMasterRandomAnim( f17_arg0, ARMORY.QuartermasterFiles.ItemReactions.Legendary )
	elseif f17_local0 == 2 then
		FrontEndScene.PlayQuarterMasterRandomAnim( f17_arg0, ARMORY.QuartermasterFiles.ItemReactions.Rare )
	else
		FrontEndScene.PlayQuarterMasterRandomAnim( f17_arg0, ARMORY.QuartermasterFiles.ItemReactions.Common )
	end
end

FrontEndScene.PlayCustomizationIdle = function ( f18_arg0, f18_arg1 )
	ClientCharacter.PlayCharacterAnim( f18_arg0, Cac.GetRigFrontEndCustomizationIdleAnim( f18_arg1 ), 0 )
end

FrontEndScene.OpenLootBoxSequence = function ( f19_arg0 )
	local f19_local0 = tostring( f19_arg0 )
	if f19_local0 then
		if f19_local0 == "CommonCrate" then
			FrontEndScene.SetCharacterModels( FrontEndScene.ClientCharacters.LootBox, "container_lootbox" )
		elseif f19_local0 == "EnlistedCrate" then
			FrontEndScene.SetCharacterModels( FrontEndScene.ClientCharacters.LootBox, "container_lootbox_rare" )
		end
	end
	ClientCharacter.SetCharacterVisible( FrontEndScene.ClientCharacters.LootBox, false )
	ClientCharacter.PlayCharacterAnim( FrontEndScene.ClientCharacters.LootBox, "iw7_mp_loot_crate_raise", 0 )
	ClientCharacter.SetCharacterVisible( FrontEndScene.ClientCharacters.LootBox, true )
	ClientCharacter.QueueCharacterAnim( FrontEndScene.ClientCharacters.LootBox, "iw7_mp_loot_crate_open", 0.2 )
	ClientCharacter.QueueCharacterAnim( FrontEndScene.ClientCharacters.LootBox, "iw7_mp_loot_crate_1f_loop_open", 0.2 )
end

FrontEndScene.CloseLootBoxSequence = function ()
	ClientCharacter.PlayCharacterAnim( FrontEndScene.ClientCharacters.LootBox, "iw7_mp_loot_crate_close", 0.2 )
	ClientCharacter.QueueCharacterAnim( FrontEndScene.ClientCharacters.LootBox, "iw7_mp_loot_crate_lower", 0.2 )
	ClientCharacter.QueueCharacterAnim( FrontEndScene.ClientCharacters.LootBox, "IW7_mp_loot_crate_lower_loop", 0.2 )
end

FrontEndScene.PlayQuartermasterGreeting = function ( f21_arg0, f21_arg1, f21_arg2 )
	if CONDITIONS.IsEventCrateAllowed() then
		FrontEndScene.PlayQuarterMasterRandomAnim( f21_arg0, "mp/quartermasterGreeting_special.csv" )
		return 
	elseif f21_arg1 >= 30 or f21_arg2 >= 200 then
		FrontEndScene.PlayQuarterMasterRandomAnim( f21_arg0, "mp/quartermasterGreeting_super_pos.csv" )
	elseif f21_arg1 >= 10 then
		FrontEndScene.PlayQuarterMasterRandomAnim( f21_arg0, "mp/quartermasterGreeting_pos.csv" )
	else
		FrontEndScene.PlayQuarterMasterRandomAnim( f21_arg0, "mp/quartermasterGreeting_neg.csv" )
	end
end

