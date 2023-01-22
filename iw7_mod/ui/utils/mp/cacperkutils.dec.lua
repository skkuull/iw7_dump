Cac = Cac or {}
Cac.perkNoneValue = "specialty_null"
Cac.GetPerkImage = function ( f1_arg0 )
	return Engine.TableLookup( CSV.perks.file, CSV.perks.cols.ref, f1_arg0, CSV.perks.cols.image )
end

Cac.GetPerkFullImage = function ( f2_arg0 )
	return Engine.TableLookup( CSV.perks.file, CSV.perks.cols.ref, f2_arg0, CSV.perks.cols.fullImage )
end

Cac.GetTraitManufacturersImage = function ( f3_arg0 )
	return Engine.TableLookup( CSV.perks.file, CSV.perks.cols.ref, f3_arg0, CSV.perks.cols.manufacturersImage )
end

Cac.GetPerkName = function ( f4_arg0 )
	return Engine.Localize( Engine.TableLookup( CSV.perks.file, CSV.perks.cols.ref, f4_arg0, CSV.perks.cols.name ) )
end

Cac.GetPerkIndex = function ( f5_arg0 )
	return tonumber( Engine.TableLookup( CSV.perks.file, CSV.perks.cols.ref, f5_arg0, CSV.perks.cols.index ) )
end

Cac.GetPerkDesc = function ( f6_arg0 )
	return Engine.Localize( Engine.TableLookup( CSV.perks.file, CSV.perks.cols.ref, f6_arg0, CSV.perks.cols.desc ) )
end

Cac.IsPerkInUse = function ( f7_arg0 )
	local f7_local0
	if f7_arg0 == Cac.perkNoneValue or f7_arg0 == "" then
		f7_local0 = false
	else
		f7_local0 = true
	end
	return f7_local0
end

Cac.IsPerkSlotInUse = function ( f8_arg0, f8_arg1 )
	return Cac.IsPerkInUse( f8_arg1.perk:GetValue( f8_arg0 ) ), Cac.IsPerkInUse( f8_arg1.extraPerk:GetValue( f8_arg0 ) )
end

Cac.GetPerkSlot = function ( f9_arg0, f9_arg1 )
	local f9_local0 = nil
	if f9_arg1 == 0 then
		f9_local0 = f9_arg0.perkSlotOne
	elseif f9_arg1 == 1 then
		f9_local0 = f9_arg0.perkSlotTwo
	else
		f9_local0 = f9_arg0.perkSlotThree
	end
	return f9_local0
end

Cac.GetNumPerksEquipped = function ( f10_arg0, f10_arg1 )
	local f10_local0 = f10_arg1.perk:GetValue( f10_arg0 )
	if Cac.IsPerkInUse( f10_arg1.extraPerk:GetValue( f10_arg0 ) ) then
		return 2
	elseif Cac.IsPerkInUse( f10_local0 ) then
		return 1
	else
		return 0
	end
end

Cac.GetPerkSlotDataSourceByEquippedRef = function ( f11_arg0, f11_arg1, f11_arg2 )
	if f11_arg1.perkSlotOne.perk:GetValue( f11_arg0 ) == f11_arg2 then
		return f11_arg1.perkSlotOne, false
	elseif f11_arg1.perkSlotOne.extraPerk:GetValue( f11_arg0 ) == f11_arg2 then
		return f11_arg1.perkSlotOne, true
	elseif f11_arg1.perkSlotTwo.perk:GetValue( f11_arg0 ) == f11_arg2 then
		return f11_arg1.perkSlotTwo, false
	elseif f11_arg1.perkSlotTwo.extraPerk:GetValue( f11_arg0 ) == f11_arg2 then
		return f11_arg1.perkSlotTwo, true
	elseif f11_arg1.perkSlotThree.perk:GetValue( f11_arg0 ) == f11_arg2 then
		return f11_arg1.perkSlotThree, false
	elseif f11_arg1.perkSlotThree.extraPerk:GetValue( f11_arg0 ) == f11_arg2 then
		return f11_arg1.perkSlotThree, true
	else
		return nil, false
	end
end

Cac.GetPerkSlotDataSourceByIndex = function ( f12_arg0, f12_arg1, f12_arg2 )
	local f12_local0 = {
		f12_arg1.perkSlotOne,
		f12_arg1.perkSlotTwo,
		f12_arg1.perkSlotThree
	}
	assert( f12_arg2 < #f12_local0 )
	return f12_local0[f12_arg2 + 1]
end

Cac.GetPerkSlotName = function ( f13_arg0 )
	local f13_local0 = {
		"LUA_MENU_MP_PERK_SLOT_ONE_SHORT_CAPS",
		"LUA_MENU_MP_PERK_SLOT_TWO_SHORT_CAPS",
		"LUA_MENU_MP_PERK_SLOT_THREE_SHORT_CAPS"
	}
	assert( f13_arg0 < #f13_local0 )
	return Engine.Localize( f13_local0[f13_arg0 + 1] )
end

Cac.GetPerkSlotNumber = function ( f14_arg0 )
	return Engine.TableLookup( CSV.menuPerks.file, CSV.menuPerks.cols.ref, f14_arg0, CSV.menuPerks.cols.slot )
end

Cac.GetRigPerkIndex = function ( f15_arg0, f15_arg1 )
	assert( RIG_LIST[f15_arg0] )
	assert( RIG_LIST[f15_arg0].perks[f15_arg1] )
	return RIG_LIST[f15_arg0].perks[f15_arg1].index
end

Cac.IsPerkUnlocked = function ( f16_arg0, f16_arg1 )
	return Engine.IsUnlocked( f16_arg1, "perk", f16_arg0 )
end

Cac.GetPerkSlotColor = function ( f17_arg0 )
	local f17_local0 = {
		SWATCHES.CAC.perkSlotOne,
		SWATCHES.CAC.perkSlotTwo,
		SWATCHES.CAC.perkSlotThree
	}
	assert( f17_arg0 < #f17_local0 )
	return GetIntForColor( f17_local0[f17_arg0 + 1] )
end

Cac.GetNonePerkInfoDataSource = function ()
	local f18_local0 = "frontEnd.MP.CAC." .. Cac.perkNoneValue
	return {
		ref = LUI.DataSourceInGlobalModel.new( f18_local0 .. "ref", Cac.perkNoneValue ),
		desc = LUI.DataSourceInGlobalModel.new( f18_local0 .. "desc", Cac.GetPerkDesc( Cac.perkNoneValue ) ),
		name = LUI.DataSourceInGlobalModel.new( f18_local0 .. "name", Cac.GetPerkImage( Cac.perkNoneValue ) ),
		image = LUI.DataSourceInGlobalModel.new( f18_local0 .. "image", Cac.GetPerkDesc( Cac.perkNoneValue ) )
	}
end

Cac.ClearPerk = function ( f19_arg0, f19_arg1 )
	f19_arg1:SetValue( f19_arg0, Cac.perkNoneValue )
end

Cac.GetPerkUnlockRank = function ( f20_arg0 )
	return Engine.TableLookup( CSV.perkUnlockTable.file, CSV.perkUnlockTable.cols.ref, f20_arg0, CSV.perkUnlockTable.cols.unlockRank )
end

Cac.GetPerkItemCardData = function ( f21_arg0 )
	local f21_local0 = Cac.GetPerkUnlockRank( f21_arg0 )
	return {
		name = Cac.GetPerkName( f21_arg0 ),
		image = Cac.GetPerkFullImage( f21_arg0 ),
		desc = Cac.GetPerkDesc( f21_arg0 ),
		title = Engine.Localize( "LUA_MENU_MP_ITEM_CARD_TITLE_PERK", Cac.GetPerkSlotNumber( f21_arg0 ) ),
		rank = Rank.GetRankDisplay( f21_local0 ),
		rankIcon = Rank.GetRankIcon( f21_local0, 0 ),
		rankName = Rank.GetShortRank( f21_local0 )
	}
end

