Cac = Cac or {}
Cac.FirstPassiveIndex = 1
Cac.LastPassiveIndex = 3
Cac.LootIDNoneValue = 0
Cac.qualities = {
	{
		color = SWATCHES.itemRarity.qualityBase,
		image = "icon_item_quality_0"
	},
	{
		color = SWATCHES.itemRarity.quality0,
		image = "icon_item_quality_1"
	},
	{
		color = SWATCHES.itemRarity.quality1,
		image = "icon_item_quality_2"
	},
	{
		color = SWATCHES.itemRarity.quality2,
		image = "icon_item_quality_3"
	},
	{
		color = SWATCHES.itemRarity.quality3,
		image = "icon_item_quality_4"
	}
}
Cac.GetLootQualityString = function ( f1_arg0 )
	if f1_arg0 == Cac.LowestQuality then
		return ""
	else
		return Engine.Localize( "LOOT_MP_QUALITY_" .. tostring( f1_arg0 ) )
	end
end

Cac.GetLootQualityColorSwatch = function ( f2_arg0 )
	local f2_local0 = (f2_arg0 or 0)
	return Cac.qualities[(f2_arg0 or 0) + 1].color
end

Cac.GetLootQualityColor = function ( f3_arg0 )
	return GetIntForColor( Cac.GetLootQualityColorSwatch( f3_arg0 ) )
end

Cac.GetLootQualityImage = function ( f4_arg0 )
	local f4_local0 = (f4_arg0 or 0)
	return Cac.qualities[(f4_arg0 or 0) + 1].image
end

Cac.GetLootQualityFromFile = function ( f5_arg0, f5_arg1, f5_arg2 )
	if f5_arg1.unlockType and f5_arg1.unlockType == "loot" then
		local f5_local0 = Engine.TableLookup( f5_arg0.file, f5_arg0.cols.ref, f5_arg2, f5_arg0.cols.quality )
		if #f5_local0 > 0 then
			local f5_local1 = tonumber( f5_local0 )
			if not f5_local1 then
				f5_local1 = Cac.LowestQuality
			end
			return f5_local1
		end
	end
	return Cac.LowestQuality
end

Cac.GetLootQuip = function ( f6_arg0 )
	return "LOOT_MP_QUIP_" .. tostring( f6_arg0 )
end

Cac.GetFullPathForWeaponVariantTable = function ( f7_arg0 )
	assert( type( f7_arg0 ) == "string" )
	return "mp/loot/weapon/" .. f7_arg0 .. ".csv"
end

Cac.IsDoubleXPActive = function ()
	local f8_local0, f8_local1 = nil
	local f8_local2 = Lobby.IsNotAloneInPrivateParty()
	if IsMlgGameBattlesMatch() then
		return false
	elseif Engine.IsAliensMode() then
		f8_local0 = Engine.GetDvarInt( "online_zombies_xpscale" )
		if Engine.GetDvarInt( "online_zombie_party_xpscale" ) == 2 then
			return f8_local2
		end
	else
		f8_local0 = Engine.GetDvarInt( "online_mp_xpscale" )
		if Engine.GetDvarInt( "online_mp_party_xpscale" ) == 2 then
			return f8_local2
		end
	end
	return f8_local0 == 2
end

Cac.IsDoubleWeaponXPActive = function ()
	local f9_local0, f9_local1 = nil
	local f9_local2 = Lobby.IsNotAloneInPrivateParty()
	if Engine.IsAliensMode() then
		f9_local0 = Engine.GetDvarInt( "online_zombie_weapon_xpscale" )
		if Engine.GetDvarInt( "online_zombie_party_weapon_xpscale" ) == 2 then
			return f9_local2
		end
	else
		f9_local0 = Engine.GetDvarInt( "online_mp_weapon_xpscale" )
		if Engine.GetDvarInt( "online_mp_party_weapon_xpscale" ) == 2 then
			return f9_local2
		end
	end
	return f9_local0 == 2
end

Cac.IsDoubleMissionTeamXPActive = function ()
	local f10_local0 = Engine.GetDvarInt( "online_mp_missionteam_xpscale" )
	local f10_local1 = Lobby.IsNotAloneInPrivateParty()
	local f10_local2 = Engine.GetDvarInt( "online_mp_party_missionteam_xpscale" )
	if Engine.IsAliensMode() then
		f10_local0 = 1
	end
	if f10_local2 == 2 then
		return f10_local1
	else
		return f10_local0 == 2
	end
end

Cac.IsDoubleKeyActive = function ()
	return Engine.GetDvarInt( "online_double_keys" ) > 0
end

Cac.HasDoubleXPToken = function ( f12_arg0 )
	return Loot.IsOwned( f12_arg0, LOOT.DoubleXPTokenID ) > 0
end

Cac.GetPriceColor = function ( f13_arg0, f13_arg1 )
	if f13_arg1 <= DataSources.frontEnd.MP.commerce.craftingCurrency:GetValue( f13_arg0 ) then
		return SWATCHES.MPArmory.weaponPrice
	else
		return SWATCHES.MPArmory.PriceCannotBuy
	end
end

