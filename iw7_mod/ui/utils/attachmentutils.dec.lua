Cac = Cac or {}
Cac.attachmentCount = 6
Cac.SPAttachmentCount = 3
Cac.attachmentNoneValue = "none"
Cac.overkillRef = "OVERKILL"
Cac.opticsIndex = 0
Cac.akimboRef = "akimbo"
Cac.AttachmentCategories = {
	optics = "optics",
	attachments = "attachments"
}
Cac.GetAttachmentEmptyString = function ( f1_arg0 )
	local f1_local0 = {
		"SCOPE",
		"ATTACH 1",
		"ATTACH 2",
		"ATTACH 3"
	}
	return f1_local0[f1_arg0 + 1]
end

Cac.GetAttachmentImage = function ( f2_arg0 )
	return Engine.TableLookup( CSV.attachments.file, CSV.attachments.cols.ref, f2_arg0, CSV.attachments.cols.image )
end

Cac.GetAttachmentFullImage = function ( f3_arg0 )
	return Engine.TableLookup( CSV.attachments.file, CSV.attachments.cols.ref, f3_arg0, CSV.attachments.cols.fullImage )
end

Cac.GetAttachmentGroup = function ( f4_arg0 )
	return Engine.TableLookup( CSV.attachments.file, CSV.attachments.cols.ref, f4_arg0, CSV.attachments.cols.group )
end

Cac.GetAttachmentBaseRef = function ( f5_arg0 )
	return Engine.TableLookup( CSV.attachments.file, CSV.attachments.cols.ref, f5_arg0, CSV.attachments.cols.baseRef )
end

Cac.GetAttachmentRefInternal = function ( f6_arg0, f6_arg1, f6_arg2 )
	if f6_arg1 == nil or f6_arg1 == "none" then
		return f6_arg0
	end
	local f6_local0 = f6_arg0
	local f6_local1 = ""
	local f6_local2 = 0
	repeat
		f6_local2 = f6_local2 + 1
		f6_local1 = Engine.TableLookupByRow( f6_arg2.file, f6_arg2.rows.attachRef, f6_local2 )
	until f6_local1 == f6_arg0 or f6_local1 == ""
	if f6_local1 == f6_arg0 then
		local f6_local3 = Engine.TableLookup( f6_arg2.file, f6_arg2.cols.weapOrClass, f6_arg1, f6_local2 )
		if f6_local3 == "" then
			f6_local3 = Engine.TableLookup( f6_arg2.file, f6_arg2.cols.weapOrClass, Cac.GetWeaponClass( f6_arg1 ), f6_local2 )
		end
		if f6_local3 ~= "" then
			f6_local0 = f6_local3
		end
	end
	return f6_local0
end

Cac.GetAttachmentRefFor3DModel = function ( f7_arg0, f7_arg1 )
	if Engine.IsAliensMode() then
		local f7_local0 = Cac.GetAttachmentRefInternal( f7_arg0, f7_arg1, CSV.CPAttachmentMap )
		if f7_local0 and f7_local0 ~= f7_arg0 then
			return f7_local0
		end
	end
	return Cac.GetAttachmentRefInternal( f7_arg0, f7_arg1, CSV.attachmentMap )
end

Cac.GetAttachmentRef = function ( f8_arg0, f8_arg1 )
	return Cac.GetAttachmentRefInternal( f8_arg0, f8_arg1, CSV.attachmentMap )
end

Cac.GetUniqueAttachmentRef = function ( f9_arg0, f9_arg1, f9_arg2, f9_arg3, f9_arg4, f9_arg5 )
	local f9_local0 = nil
	local f9_local1
	if f9_arg5 then
		f9_local1 = Cac.GetAttachmentRefFor3DModel
		if not f9_local1 then
		
		else
			f9_local0 = f9_local1( f9_arg0, f9_arg3 )
			if f9_local0 ~= f9_arg0 then
				return f9_local0
			elseif f9_arg4 then
				f9_local0 = Cac.GetAttachmentRef( f9_arg0, f9_arg4 )
				if f9_local0 ~= f9_arg0 then
					return f9_local0
				end
			end
			local f9_local2 = LUI.Split( f9_arg3, "_" )
			if #f9_local2 > 3 then
				f9_local0 = f9_local1( f9_arg0, f9_local2[1] .. "_" .. f9_local2[2] .. "_" .. f9_local2[3] )
				if f9_local0 ~= f9_arg0 then
					return f9_local0
				end
			end
			f9_local0 = f9_local1( f9_arg0, f9_arg1 )
			if f9_local0 ~= f9_arg0 then
				return f9_local0
			else
				f9_local0 = f9_local1( f9_arg0, Engine.TableLookup( CSV.weapons.file, CSV.weapons.cols.ref, f9_arg1, CSV.weapons.cols.class ) )
				if f9_local0 ~= f9_arg0 then
					return f9_local0
				else
					return f9_arg0
				end
			end
		end
	end
	f9_local1 = Cac.GetAttachmentRef
end

Cac.GetAttachmentName = function ( f10_arg0 )
	return Engine.Localize( Engine.TableLookup( CSV.attachments.file, CSV.attachments.cols.ref, f10_arg0, CSV.attachments.cols.name ) )
end

Cac.GetOpticAttachmentName = function ( f11_arg0 )
	if f11_arg0 == Cac.attachmentNoneValue then
		return Engine.Localize( "LUA_MENU_NO_ATTACHMENT_OPTIC" )
	else
		return Engine.Localize( Engine.TableLookup( CSV.attachments.file, CSV.attachments.cols.ref, f11_arg0, CSV.attachments.cols.name ) )
	end
end

Cac.GetAttachmentNameWithWeapon = function ( f12_arg0, f12_arg1 )
	if f12_arg1 and f12_arg1 ~= "none" then
		f12_arg0 = Cac.GetAttachmentUniqueRef( f12_arg0, f12_arg1 )
	end
	return Engine.Localize( Engine.TableLookup( CSV.attachments.file, CSV.attachments.cols.ref, f12_arg0, CSV.attachments.cols.name ) )
end

Cac.GetAttachmentDesc = function ( f13_arg0 )
	return Engine.Localize( Engine.TableLookup( CSV.attachments.file, CSV.attachments.cols.ref, f13_arg0, CSV.attachments.cols.desc ) )
end

Cac.GetOpticAttachmentDesc = function ( f14_arg0 )
	if f14_arg0 == Cac.attachmentNoneValue then
		return Engine.Localize( "LUA_MENU_NO_ATTACHMENT_OPTIC" )
	else
		return Engine.Localize( Engine.TableLookup( CSV.attachments.file, CSV.attachments.cols.ref, f14_arg0, CSV.attachments.cols.desc ) )
	end
end

Cac.GetAttachmentDescWithWeapon = function ( f15_arg0 )
	if weapon and weapon ~= "none" then
		f15_arg0 = Cac.GetAttachmentUniqueRef( f15_arg0, weapon )
	end
	return Engine.Localize( Engine.TableLookup( CSV.attachments.file, CSV.attachments.cols.ref, f15_arg0, CSV.attachments.cols.desc ) )
end

Cac.GetAttachmentStatAccuracy = function ( f16_arg0 )
	return tonumber( Engine.TableLookup( CSV.attachments.file, CSV.attachments.cols.ref, f16_arg0, CSV.attachments.cols.acc ) )
end

Cac.ClearAttachment = function ( f17_arg0, f17_arg1, f17_arg2 )
	local f17_local0 = f17_arg2.ref
	local f17_local1 = f17_arg2.index
	if f17_local1 > 0 then
		local f17_local2 = nil
		if Engine.IsAliensMode() then
			f17_local2 = Cac.attachmentCount
		elseif Engine.IsSingleplayer() then
			f17_local2 = Cac.SPAttachmentCount
		elseif f17_arg2.weaponIndex == 0 then
			f17_local2 = Cac.attachmentCount
		else
			f17_local2 = Cac.attachmentCount - 1
		end
		for f17_local3 = f17_local1, f17_local2 - 2, 1 do
			local f17_local6 = f17_arg1.attachment[f17_local3 + 1]
			f17_local0:SetValue( f17_arg0, f17_local6:GetValue( f17_arg0 ) )
			f17_local0 = f17_local6
		end
	end
	Cac.ClearAttachmentInternal( f17_arg0, f17_local0 )
end

Cac.ClearAttachmentInternal = function ( f18_arg0, f18_arg1 )
	f18_arg1:SetValue( f18_arg0, "none" )
end

Cac.ClearAllAttachments = function ( f19_arg0, f19_arg1 )
	for f19_local3, f19_local4 in pairs( f19_arg0.attachments ) do
		Cac.ClearAttachmentInternal( f19_arg1, f19_local4 )
	end
end

Cac.ClearLootBlockedAttachments = function ( f20_arg0, f20_arg1, f20_arg2, f20_arg3 )
	local f20_local0 = Cac.GetWeaponRowList()
	local f20_local1 = f20_arg1.weapon.baseWeaponRef:GetValue( f20_arg3 )
	local f20_local2 = Cac.GetWeaponClass( f20_local1 )
	local f20_local3 = f20_local0[f20_local2][f20_local1].allowableAttachments
	local f20_local4 = {
		f20_arg0.attachments.attachmentSlotOne,
		f20_arg0.attachments.attachmentSlotTwo,
		f20_arg0.attachments.attachmentSlotThree,
		f20_arg0.attachments.attachmentSlotFour,
		f20_arg0.attachments.attachmentSlotFive,
		f20_arg0.attachments.attachmentSlotSix
	}
	for f20_local5 = #f20_local4, 1, -1 do
		local f20_local8 = f20_local4[f20_local5]
		local f20_local9 = f20_local8.ref:GetValue( f20_arg3 )
		local f20_local10 = Cac.GetAttachmentCategory( f20_local9 )
		f20_local9 = Cac.GetAttachmentRef( f20_local9, f20_local1 )
		if f20_local0[f20_local2][f20_local1] and LUI.IsItemInArray( f20_local3, f20_local9 ) then
			local f20_local11 = false
			if f20_arg2 and Cac.BaseLootID < f20_arg2 then
				local f20_local12 = LOADOUT.GetWeaponLootOverrideData( Cac.GetLootRef( f20_arg2 ) )
				f20_local11 = LUI.IsItemInArray( f20_local12.blockedAttachments, f20_local9 ) or LUI.IsItemInArray( f20_local12.blockedAttachmentCategories, f20_local10 ) or LUI.IsItemInArray( f20_local12.blockedAttachments, Cac.GetAttachmentBaseRef( f20_local9 ) )
			end
			if f20_local11 then
				Cac.ClearAttachment( f20_arg3, f20_arg0, f20_local8 )
			end
		end
	end
end

Cac.ClearReticle = function ( f21_arg0, f21_arg1 )
	if Engine.IsCoreMode() then
		f21_arg0.reticle:SetValue( f21_arg1, Cac.ReticleNoneValue )
	elseif Engine.IsAliensMode() then
		f21_arg0.reticleInfo.ref:SetValue( f21_arg1, Cac.ReticleNoneValue )
	end
end

Cac.SetAttachmentDataSource = function ( f22_arg0, f22_arg1, f22_arg2 )
	f22_arg1:SetValue( f22_arg0, f22_arg2 )
end

Cac.GetAttachmentStatDamage = function ( f23_arg0 )
	return tonumber( Engine.TableLookup( CSV.attachments.file, CSV.attachments.cols.ref, f23_arg0, CSV.attachments.cols.dam ) )
end

Cac.GetAttachmentStatRange = function ( f24_arg0 )
	return tonumber( Engine.TableLookup( CSV.attachments.file, CSV.attachments.cols.ref, f24_arg0, CSV.attachments.cols.rng ) )
end

Cac.GetAttachmentStatFireRate = function ( f25_arg0 )
	return tonumber( Engine.TableLookup( CSV.attachments.file, CSV.attachments.cols.ref, f25_arg0, CSV.attachments.cols.rof ) )
end

Cac.GetAttachmentStatMobility = function ( f26_arg0 )
	return tonumber( Engine.TableLookup( CSV.attachments.file, CSV.attachments.cols.ref, f26_arg0, CSV.attachments.cols.mob ) )
end

Cac.GetAttachmentCategory = function ( f27_arg0 )
	return Engine.TableLookup( CSV.attachments.file, CSV.attachments.cols.ref, f27_arg0, CSV.attachments.cols.group )
end

Cac.GetAttachmentSlotName = function ( f28_arg0, f28_arg1 )
	if f28_arg0 == "optics" then
		return Engine.Localize( "LUA_MENU_OPTIC" )
	else
		return Engine.Localize( "LUA_MENU_ATTACHMENT_X", f28_arg1 )
	end
end

Cac.GetAttachmentSlotDataSourceByEquippedRef = function ( f29_arg0, f29_arg1, f29_arg2 )
	if Engine.IsMultiplayer() then
		f29_arg2 = Cac.GetAttachmentBaseRef( f29_arg2 )
	end
	if f29_arg1.attachments.attachmentSlotOne:GetValue( f29_arg0 ) == f29_arg2 then
		return f29_arg1.attachments.attachmentSlotOne
	elseif f29_arg1.attachments.attachmentSlotTwo:GetValue( f29_arg0 ) == f29_arg2 then
		return f29_arg1.attachments.attachmentSlotTwo
	elseif f29_arg1.attachments.attachmentSlotThree:GetValue( f29_arg0 ) == f29_arg2 then
		return f29_arg1.attachments.attachmentSlotThree
	elseif Engine.IsMultiplayer() and f29_arg1.attachments.attachmentSlotFour:GetValue( f29_arg0 ) == f29_arg2 then
		return f29_arg1.attachments.attachmentSlotFour
	elseif Engine.IsMultiplayer() and f29_arg1.attachments.attachmentSlotFive:GetValue( f29_arg0 ) == f29_arg2 then
		return f29_arg1.attachments.attachmentSlotFive
	elseif (Engine.IsAliensMode() or Engine.IsMultiplayer() and f29_arg1.slot:GetValue( f29_arg0 ) == 0) and f29_arg1.attachments.attachmentSlotSix:GetValue( f29_arg0 ) == f29_arg2 then
		return f29_arg1.attachments.attachmentSlotSix
	else
		return nil
	end
end

Cac.IsAttachmentValid = function ( f30_arg0, f30_arg1 )
	local f30_local0
	if f30_arg0 == "none" or f30_arg0 == "" or f30_arg1 == "none" or f30_arg1 == "" then
		f30_local0 = false
	else
		f30_local0 = true
	end
	return f30_local0
end

Cac.IsAttachmentSlotInUse = function ( f31_arg0 )
	local f31_local0
	if f31_arg0 == "none" or f31_arg0 == "" then
		f31_local0 = false
	else
		f31_local0 = true
	end
	return f31_local0
end

Cac.GetCategorizedAttachmentList = function ( f32_arg0, f32_arg1 )
	local f32_local0 = {}
	local f32_local1 = Cac.GetWeaponRowList()
	for f32_local2 = 1, Engine.TableGetRowCount( CSV.attachments.file ), 1 do
		local f32_local5 = CSV.ReadRow( CSV.attachments, f32_local2 )
		local f32_local6 = f32_local5.ref
		if Cac.IsAttachmentValid( f32_local6, f32_local5.group ) then
			local f32_local7 = f32_arg0.weapon:GetValue( f32_arg1 )
			local f32_local8 = Cac.GetWeaponClass( f32_local7 )
			local f32_local9 = true
			if Engine.IsSingleplayer() then
				local f32_local10 = f32_local5.unique
				if f32_local10 then
					f32_local10 = f32_local5.unique ~= ""
				end
				if (f32_local5.baseRef == "rof" or f32_local5.baseRef == "grip") and not f32_local10 then
					if Engine.WeaponUsesEnergyBullets( f32_local7 ) then
						if f32_local5.isEnergy and tonumber( f32_local5.isEnergy ) == 0 then
							f32_local9 = false
						end
					elseif f32_local5.isEnergy and tonumber( f32_local5.isEnergy ) == 1 then
						f32_local9 = false
					end
				end
			end
			if f32_local1[f32_local8][f32_local7] and f32_local9 and LUI.IsItemInArray( f32_local1[f32_local8][f32_local7].allowableAttachments, f32_local6 ) then
				local f32_local11 = Engine.IsMultiplayer() and f32_arg0.lootItemID:GetValue( f32_arg1 ) or Cac.BaseLootID
				local f32_local12 = false
				if f32_local11 and Cac.BaseLootID < f32_local11 then
					local f32_local13 = LOADOUT.GetWeaponLootOverrideData( Cac.GetLootRef( f32_local11 ) )
					local f32_local14 = Cac.GetAttachmentBaseRef( f32_local6 )
					f32_local12 = LUI.IsItemInArray( f32_local13.blockedAttachments, f32_local6 ) or LUI.IsItemInArray( f32_local13.blockedAttachmentCategories, group ) or LUI.IsItemInArray( f32_local13.blockedAttachments, f32_local14 )
					local f32_local15 = Cac.GetUniqueAttachmentRef( f32_local14, f32_local7, f32_local7, Cac.GetWeaponModelName( f32_local7, f32_local7, Cac.GetWeaponQuality( f32_local11 ), f32_arg0.variantID:GetValue( f32_arg1 ) ), nil, false )
					if f32_local15 and f32_local15 ~= f32_local14 then
						f32_local5 = CSV.ReadRow( CSV.attachments, Engine.TableLookupGetRowNum( CSV.attachments.file, CSV.attachments.cols.ref, f32_local15 ) )
					end
				end
				if not f32_local12 then
					local f32_local16 = Cac.GetAdjustedAttachmentCategory( f32_local5.group )
					local f32_local13 = f32_local0[f32_local16]
					if not f32_local13 then
						f32_local13 = {}
					end
					f32_local0[f32_local16] = f32_local13
					f32_local13 = f32_local0[f32_local16]
					local f32_local14 = f32_local0[f32_local16].attachments
					if not f32_local14 then
						f32_local14 = {}
					end
					f32_local13.attachments = f32_local14
					table.insert( f32_local0[f32_local16].attachments, f32_local5 )
					f32_local0[f32_local16].attachmentCount = f32_local0[f32_local16].attachmentCount and f32_local0[f32_local16].attachmentCount + 1 or 1
				end
			end
		end
	end
	return f32_local0
end

Cac.GetUnlockAttachmentListByCategory = function ( f33_arg0 )
	local f33_local0 = {}
	local f33_local1 = Cac.GetWeaponRowList()
	local f33_local2 = Cac.GetWeaponClass( f33_arg0 )
	if f33_local1[f33_local2][f33_arg0] then
		for f33_local6, f33_local7 in ipairs( f33_local1[f33_local2][f33_arg0].allowableAttachments ) do
			local f33_local8 = Cac.GetAdjustedAttachmentCategory( Cac.GetAttachmentGroup( f33_local7 ) )
			f33_local0[f33_local8] = f33_local0[f33_local8] or {}
			f33_local0[f33_local8].attachments = f33_local0[f33_local8].attachments or {}
			table.insert( f33_local0[f33_local8].attachments, f33_arg0 .. "+" .. f33_local7 )
			f33_local0[f33_local8].attachmentCount = f33_local0[f33_local8].attachmentCount and f33_local0[f33_local8].attachmentCount + 1 or 1
		end
	end
	return f33_local0
end

Cac.DoesWeaponHaveAttachmentsByCategory = function ( f34_arg0, f34_arg1, f34_arg2, f34_arg3 )
	local f34_local0 = Cac.GetWeaponClass( f34_arg0 )
	local f34_local1 = Cac.GetWeaponRowList()
	local f34_local2 = nil
	if f34_arg1 and Cac.BaseLootID < f34_arg1 then
		f34_local2 = LOADOUT.GetWeaponLootOverrideData( Cac.GetLootRef( f34_arg1 ) )
	end
	if f34_local1[f34_local0] and f34_local1[f34_local0][f34_arg0] then
		for f34_local7, f34_local8 in ipairs( f34_local1[f34_local0][f34_arg0].allowableAttachments ) do
			local f34_local9 = Cac.GetAttachmentCategory( f34_local8 )
			local f34_local6 = false
			if f34_local2 and LUI.IsItemInArray( f34_local2.blockedAttachmentCategories, f34_local9 ) then
				f34_local6 = true
			end
			if not f34_local6 and not (f34_local2 and LUI.IsItemInArray( f34_local2.blockedAttachments, f34_local8 )) and Cac.GetAdjustedAttachmentCategory( f34_local9 ) == f34_arg3 then
				return true
			end
		end
	end
	return false
end

Cac.GetCategoryBySlotIndex = function ( f35_arg0 )
	local f35_local0
	if f35_arg0 == 0 then
		f35_local0 = Cac.AttachmentCategories.optics
		if not f35_local0 then
		
		else
			return f35_local0
		end
	end
	f35_local0 = Cac.AttachmentCategories.attachments
end

Cac.GetAdjustedAttachmentCategory = function ( f36_arg0 )
	local f36_local0
	if f36_arg0 == "rail" then
		f36_local0 = Cac.AttachmentCategories.optics
		if not f36_local0 then
		
		else
			return f36_local0
		end
	end
	f36_local0 = Cac.AttachmentCategories.attachments
end

Cac.GetAttachmentStatSum = function ( f37_arg0, f37_arg1, f37_arg2 )
	local f37_local0 = 0
	for f37_local1 = 1, #f37_arg0, 1 do
		f37_local0 = f37_local0 + f37_arg0[f37_local1].stats[f37_arg1]:GetValue( f37_arg2 )
	end
	return f37_local0
end

Cac.IsCPAttachmentSlotUnlocked = function ( f38_arg0, f38_arg1, f38_arg2 )
	return Engine.IsUnlocked( f38_arg2, Cac.GetWeaponClassAttachUnlockTablePrefix( Cac.GetWeaponClass( f38_arg1 ) ) .. "Cpslotattach", f38_arg1 .. "+" .. f38_arg0, true )
end

Cac.IsAttachmentUnlocked = function ( f39_arg0, f39_arg1, f39_arg2 )
	return Engine.IsUnlocked( f39_arg2, Cac.GetWeaponClassAttachUnlockTablePrefix( Cac.GetWeaponClass( f39_arg1 ) ) .. "Attach", f39_arg1 .. "+" .. f39_arg0 )
end

Cac.IsAttachmentEsportsUnlocked = function ( f40_arg0, f40_arg1, f40_arg2 )
	return Engine.IsUnlocked( f40_arg2, "pro_" .. Cac.GetWeaponClassAttachUnlockTablePrefix( Cac.GetWeaponClass( f40_arg1 ) ) .. "Attach", f40_arg1 .. "+" .. f40_arg0, true )
end

Cac.GetAttachmentUnlockText = function ( f41_arg0, f41_arg1, f41_arg2, f41_arg3 )
	local f41_local0 = Cac.GetWeaponClass( f41_arg1 )
	local f41_local1 = Cac.GetAttachmentUnlockTable( f41_arg1 )
	local f41_local2 = f41_arg1 .. "+" .. f41_arg0
	if f41_arg3 then
		return Engine.Localize( "MP_FRONTEND_ONLY_NOT_AVAILABLE_IN_CWL" )
	else
		return Engine.Localize( Engine.TableLookup( f41_local1, CSV.attachmentUnlockTable.cols.weaponAttachRef, f41_local2, CSV.attachmentUnlockTable.cols.ui_text ), Engine.TableLookup( f41_local1, CSV.attachmentUnlockTable.cols.weaponAttachRef, f41_local2, CSV.attachmentUnlockTable.cols.ui_text_var1 ), Engine.TableLookup( f41_local1, CSV.attachmentUnlockTable.cols.weaponAttachRef, f41_local2, CSV.attachmentUnlockTable.cols.ui_text_var2 ) )
	end
end

Cac.GetAttachmentItemCardData = function ( f42_arg0 )
	local f42_local0, f42_local1 = UNLOCK.SplitCompoundUnlockRef( f42_arg0 )
	local f42_local2 = Cac.GetAttachmentRef( f42_local1, f42_local0 )
	return {
		name = Cac.GetAttachmentName( f42_local2 ),
		desc = Cac.GetAttachmentDesc( f42_local2 ),
		image = Cac.GetAttachmentImage( f42_local2 ),
		weaponName = Cac.GetWeaponName( f42_local0 ),
		weaponImage = Cac.GetWeaponImage( f42_local0 ),
		weaponLevel = 1 + Cac.GetAttachmentUnlockLevel( f42_local0, f42_local1 ),
		title = Engine.Localize( "LUA_MENU_MP_ITEM_CARD_TITLE_WEAPON_UPGRADE" )
	}
end

Cac.GetAttachmentUnlockTable = function ( f43_arg0 )
	return CSV.attachmentUnlockTable.fileRoot .. Cac.GetWeaponClassAttachUnlockTablePrefix( Cac.GetWeaponClass( f43_arg0 ) ) .. CSV.attachmentUnlockTable.fileSuffix
end

Cac.GetAttachmentUnlockLevel = function ( f44_arg0, f44_arg1 )
	return Engine.TableLookup( Cac.GetAttachmentUnlockTable( f44_arg0 ), CSV.attachmentUnlockTable.cols.weaponAttachRef, f44_arg0 .. "+" .. f44_arg1, CSV.attachmentUnlockTable.cols.unlockRank )
end

Cac.AreAttachmentsCompatible = function ( f45_arg0, f45_arg1 )
	local f45_local0 = Engine.TableLookupGetRowNum( AttachmentComboTable.File, AttachmentComboTable.Cols.Ref, f45_arg1 )
	local f45_local1 = true
	if f45_arg1 ~= "none" and f45_arg0 ~= "none" and Engine.TableLookup( AttachmentComboTable.File, AttachmentComboTable.Cols.Ref, f45_arg0, f45_local0 ) == "no" then
		f45_local1 = false
	end
	return f45_local1
end

Cac.GetOpticRefForWeapon = function ( f46_arg0, f46_arg1, f46_arg2 )
	if f46_arg1 == "iw7_m1" and f46_arg2 == 3 and (f46_arg0 == "none" or f46_arg0 == "oscope" or f46_arg0 == "vzscope") then
		return "none"
	elseif f46_arg0 == "none" then
		return Engine.TableLookup( CSV.weapons.file, CSV.weapons.cols.ref, f46_arg1, CSV.weapons.cols.defaultOpticRef )
	else
		return f46_arg0
	end
end

Cac.HasReticleData = function ( f47_arg0, f47_arg1, f47_arg2 )
	return CountTableKeys( LOADOUT.GetAvailableReticleData( Cac.GetOpticRefForWeapon( f47_arg0, f47_arg1, f47_arg2 ) ) ) > 1
end

