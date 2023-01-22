local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "frontEnd.MP.CAC.weaponSelect"
f0_local1 = "frontEnd.MP.CAC.weaponSelectTab"
f0_local2 = "frontEnd.MP.CAC.weaponSelectStats"
local f0_local3 = "frontEnd.weapon.levelInfo"
local f0_local4 = 200
local f0_local5 = 200
local f0_local6 = {
	Left = 0,
	Right = 1,
	Up = 2,
	Down = 3
}
function PopFunc()
	ClientWeapon.SetWeaponVisible( 1, false )
	ClientWeapon.SetWeaponVisible( 2, false )
	ClientWeapon.SetWeaponRotation( 0, 0, 0, 0 )
	ClientWeapon.SetWeaponRotation( 1, 0, 0, 0 )
	ClientWeapon.SetWeaponRotation( 2, 0, 0, 0 )
	Streaming.SetStreamingEnabled( false )
	if Engine.IsDevelopmentBuild() and not f0_local3 then
		f0_local3 = "frontEnd.weapon.levelInfo"
	end
	WipeGlobalModelsAtPath( f0_local0 )
	WipeGlobalModelsAtPath( f0_local1 )
	WipeGlobalModelsAtPath( f0_local2 )
	WipeGlobalModelsAtPath( f0_local3 )
end

function SetupPassiveDataSource( f2_arg0, f2_arg1, f2_arg2, f2_arg3 )
	local f2_local0 = f2_arg3[f2_arg1 + 1]
	assert( f2_local0 )
	return {
		passive = {
			name = f2_arg0:GetDataSourceForSubmodel( "name", Engine.Localize( f2_local0.name:GetValue( f2_arg2 ) ) ),
			desc = f2_arg0:GetDataSourceForSubmodel( "weaponDesc", Engine.Localize( f2_local0.weaponDesc:GetValue( f2_arg2 ) ) ),
			image = f2_local0.image
		}
	}
end

function SetupFireModeDataSource( f3_arg0, f3_arg1, f3_arg2, f3_arg3 )
	local f3_local0 = f3_arg3[f3_arg1 + 1]
	assert( f3_local0 )
	return {
		fireMode = {
			name = f3_arg0:GetDataSourceForSubmodel( "name", Engine.Localize( f3_local0.name:GetValue( f3_arg2 ) ) ),
			icon = f3_local0.image
		}
	}
end

local f0_local7 = function ( f4_arg0, f4_arg1, f4_arg2, f4_arg3 )
	return f4_arg1 == f4_arg2.weapon:GetValue( f4_arg3 )
end

local f0_local8 = function ( f5_arg0 )
	local f5_local0
	if f5_arg0 then
		f5_local0 = 1
		if not f5_local0 then
		
		else
			return f5_local0
		end
	end
	f5_local0 = 0
end

local f0_local9 = function ( f6_arg0, f6_arg1 )
	return function ( f7_arg0 )
		local f7_local0
		if f6_arg0:GetValue( f7_arg0 ) then
			f7_local0 = f6_arg1:GetValue( f7_arg0 )
		else
			f7_local0 = true
		end
		return f7_local0
	end
	
end

local f0_local10 = function ( f8_arg0, f8_arg1, f8_arg2 )
	return function ( f9_arg0 )
		local f9_local0 = Cac.CanAffordItem( f8_arg1, f8_arg0.pointCost, f9_arg0 )
		local f9_local1 = f8_arg2:GetValue( f9_arg0 )
		local f9_local2
		if not Cac.DoesWeaponCostPoint( f8_arg0.weapon:GetValue( f9_arg0 ) ) then
			f9_local2 = not f9_local0
		else
			f9_local2 = false
		end
		return f9_local2
	end
	
end

local f0_local11 = function ( f10_arg0, f10_arg1, f10_arg2 )
	local f10_local0 = f10_arg0.slot:GetValue( f10_arg2 )
	local f10_local1 = assert
	local f10_local2
	if f10_local0 ~= 0 and f10_local0 ~= 1 then
		f10_local2 = false
	else
		f10_local2 = true
	end
	f10_local1( f10_local2 )
	if f10_arg1.overkill.used:GetValue( f10_arg2 ) then
		f10_local2 = Cac.PrimaryWeaponSlot
		if not f10_local2 then
		
		else
			return f10_local2, f10_local0
		end
	end
	f10_local2 = f10_local0
end

function GetBaseWeaponDecorator( f11_arg0 )
	return function ( f12_arg0, f12_arg1, f12_arg2 )
		assert( f12_arg1.name )
		assert( f12_arg1.image )
		local f12_local0 = f11_arg0.weaponDataSource
		local f12_local1 = f11_arg0.loadoutDataSource
		local f12_local2 = f12_arg1.ref:GetValue( f12_arg2 )
		local f12_local3 = Cac.IsBaseWeaponUnlocked( f12_local2, f12_arg2 ) and Cac.IsUnlockedEsports( Engine.IsUnlocked( f12_arg2, "pro_weapon", f12_local2, true ) )
		local f12_local4 = LUI.DataSourceInGlobalModel.new( f0_local1 .. ".base." .. f12_local2 .. ".unlocked", f12_local3 )
		local f12_local5 = LUI.DataSourceInGlobalModel.new( f0_local1 .. ".base." .. f12_local2 .. ".lootUnlocked", f12_local3 and not CONDITIONS.UseLoadoutRestrictions() )
		local f12_local6 = LUI.DataSourceInGlobalModel.new( f0_local1 .. ".base." .. f12_local2 .. ".scanned", nil )
		local f12_local7 = LUI.AggregateDataSource.new( f12_arg1.ref, {
			f12_local4,
			f12_local1.pointCount,
			f12_local0.weapon
		}, "disabledByPointCount", f0_local10( f12_local0, f12_local1, f12_local4 ) )
		local f12_local8 = LUI.AggregateDataSource.new( f12_arg1.ref, {
			f12_local4,
			f12_local7
		}, "disabled", f0_local9( f12_local4, f12_local7 ) )
		local f12_local9 = f0_local7( f11_arg0, f12_local2, f12_local0, f12_arg2 )
		local f12_local10 = LUI.DataSourceInGlobalModel.new( f0_local1 .. ".base." .. f12_local2 .. ".equipped", f12_local9 )
		local f12_local11 = f12_local10:Filter( "equippedAlpha", f0_local8 )
		local f12_local12 = Engine.GetDvarInt( "ui_playtestWeaponLevel" )
		if f12_local12 and f12_local12 ~= 0 then
			DataSources.alwaysLoaded.playerData.MP.common.sharedProgression.weaponLevel[f12_local2].mpXP:SetValue( f12_arg2, Cac.GetWeaponRankMaxXP( f12_local12 ) )
		end
		local f12_local13 = Cac.LowestQuality
		local f12_local14, f12_local15 = false
		if f12_local9 then
			local f12_local16 = f12_local0.weapon:GetValue( f12_arg2 )
			f12_local15 = f12_local0.lootItemID:GetValue( f12_arg2 )
			f12_local13 = Cac.GetWeaponQuality( f12_local15 )
			f12_local14 = Cac.IsLootIDMk2( f12_local15 )
		end
		local f12_local16 = LUI.DataSourceInGlobalModel.new( f0_local1 .. ".base." .. f12_local2 .. ".quality", f12_local13 )
		local f12_local17 = f12_local16:Filter( "color", Cac.GetLootQualityColor )
		local f12_local18 = f12_local16:Filter( "image", Cac.GetLootQualityImage )
		local f12_local19 = LUI.DataSourceInGlobalModel.new( f0_local1 .. ".base." .. f12_local2 .. ".isMk2", f12_local14 )
		local f12_local20 = LUI.DataSourceFromList.new( f12_local0.pointCost:GetCountValue( f12_arg2 ) )
		f12_local20.MakeDataSourceAtIndex = function ( f13_arg0, f13_arg1, f13_arg2 )
			return {
				isActive = f12_local10
			}
		end
		
		local f12_local21 = {}
		local f12_local22 = Cac.GetWeaponLevelData( f12_local2, f12_arg2 )
		local f12_local23 = Cac.GetFireModesForWeapon( f12_arg1.ref:GetValue( f12_arg2 ) )
		local f12_local24 = LUI.DataSourceFromList.new( #f12_local23 )
		f12_local24.MakeDataSourceAtIndex = function ( f14_arg0, f14_arg1, f14_arg2 )
			return SetupFireModeDataSource( LUI.DataSourceInGlobalModel.new( f0_local1 .. ".base." .. f12_local2 .. ".fireMode" .. f14_arg1, f14_arg1 ), f14_arg1, f14_arg2, f12_local23 )
		end
		
		local f12_local25 = f0_local1 .. ".loot." .. f12_local2 .. "."
		f12_local21[1] = {
			weapon = {
				ref = f12_arg1.ref,
				name = f12_arg1.name,
				image = f12_arg1.image,
				fullImage = f12_arg1.fullImage,
				desc = f12_arg1.desc,
				isUnlocked = f12_local4,
				isItemUnlocked = f12_local3,
				isScanned = f12_local6,
				isDisabled = f12_local8,
				isDisabledByPointCount = f12_local7,
				quality = LUI.DataSourceInGlobalModel.new( f12_local25 .. "quality", 0 ),
				qualityString = LUI.DataSourceInGlobalModel.new( f12_local25 .. "qualityString", "" ),
				qualityColor = LUI.DataSourceInGlobalModel.new( f12_local25 .. "qualityColor", Cac.GetLootQualityColor( Cac.LowestQuality ) ),
				qualityImage = LUI.DataSourceInGlobalModel.new( f12_local25 .. "qualityImage", Cac.GetLootQualityImage( Cac.LowestQuality ) ),
				passives = LUI.DataSourceFromList.new( 0 ),
				fireModes = f12_local24,
				baseWeaponRef = f12_arg1.ref,
				variantID = LUI.DataSourceInGlobalModel.new( f12_local25 .. "variantID", -1 ),
				equipped = f12_local10,
				equippedAlpha = f12_local11,
				pointCost = f12_local20,
				isLoot = LUI.DataSourceInGlobalModel.new( f12_local25 .. "isLoot", false ),
				variantIndex = LUI.DataSourceInGlobalModel.new( f12_local25 .. "variantIndex", 0 ),
				lootItemID = Cac.LootIDNoneValue,
				isMk2 = LUI.DataSourceInGlobalModel.new( f12_local25 .. "isMk2", false ),
				displayOrder = 0
			}
		}
		local f12_local26 = LOADOUT.GetWeaponLootVariantData( f12_local2 )
		if f12_local26 then
			for f12_local40, f12_local41 in ipairs( f12_local26.rows ) do
				local f12_local42 = CSV.ReadRow( {
					file = f12_local26.file,
					cols = CSV.weaponLoot.cols
				}, f12_local41 )
				local f12_local43 = f0_local1 .. ".loot." .. f12_local42.ref .. "."
				local f12_local44 = Engine.Localize( f12_local42.displayName )
				local f12_local45 = Cac.GetLootWeaponQuality( f12_local42.ref )
				local f12_local46 = Cac.GetLootQualityString( f12_local45 )
				local f12_local47 = Cac.GetLootQualityColor( f12_local45 )
				local f12_local48 = Cac.GetLootQualityImage( f12_local45 )
				local f12_local49 = Cac.IsWeaponRefMk2( f12_local42.ref )
				local f12_local34 = nil
				if LOADOUT.GetWeaponLootOverrideData( f12_local42.ref ) then
					local f12_local30 = LOADOUT.GetWeaponLootOverrideData( f12_local42.ref )
					if f12_local30.desc then
						f12_local30 = LUI.DataSourceInGlobalModel.new
						local f12_local31 = f12_local43 .. "desc"
						local f12_local32 = Engine.Localize
						local f12_local33 = LOADOUT.GetWeaponLootOverrideData( f12_local42.ref )
						f12_local34 = f12_local30( f12_local31, f12_local32( f12_local33.desc ) )
					else
						f12_local34 = f12_arg1.desc
					end
				end
				f12_local34 = f12_arg1.desc
			end
			table.sort( f12_local21, function ( f17_arg0, f17_arg1 )
				return tonumber( f17_arg0.weapon.displayOrder ) < tonumber( f17_arg1.weapon.displayOrder )
			end )
		end
		for f12_local40, f12_local41 in ipairs( f12_local21 ) do
			f12_local41.sortedIndex = f12_local40 - 1
		end
		f12_local28 = LUI.DataSourceFromList.new( #f12_local21 )
		f12_local28.GetDataSourceAtIndex = function ( f18_arg0, f18_arg1 )
			return f12_local21[f18_arg1 + 1]
		end
		
		f12_local28.GetDataSourceFromVariantIndex = function ( f19_arg0, f19_arg1, f19_arg2 )
			for f19_local0 = 1, #f12_local21, 1 do
				if f12_local21[f19_local0].weapon.variantIndex:GetValue( f19_arg2 ) == f19_arg1 then
					return f12_local21[f19_local0]
				end
			end
			return nil
		end
		
		f12_local28.GetDefaultFocusIndex = function ()
			local f20_local0 = Cac.GetEquippedWeaponRef( f12_local0, f12_arg2 )
			assert( f20_local0 and #f20_local0 > 0 )
			for f20_local4, f20_local5 in ipairs( f12_local21 ) do
				if f20_local5.weapon.ref:GetValue( f12_arg2 ) == f20_local0 then
					return f20_local4 - 1
				end
			end
			return nil
		end
		
		return {
			variants = f12_local28,
			isUnlocked = f12_local4,
			isScanned = f12_local6,
			isDisabled = f12_local8,
			equipped = f12_local10,
			equippedAlpha = f12_local11,
			equippedQuality = f12_local16,
			equippedQualityColor = f12_local17,
			equippedQualityImage = f12_local18,
			equippedWeaponLootID = f12_local15,
			baseWeaponRef = f12_local2,
			isItemUnlocked = f12_local3,
			pointCost = f12_local20,
			weaponLevel = LUI.DataSourceInGlobalModel.new( f12_local25 .. "level", f12_local22.currentLevel ),
			isMk2 = f12_local19
		}
	end
	
end

local f0_local12 = function ( f21_arg0, f21_arg1 )
	assert( f21_arg0.weaponModel )
	local f21_local0 = 1800
	local f21_local1 = 800
	local f21_local2 = nil
	local f21_local3 = {}
	if f21_arg1 == f0_local6.Right then
		f21_local3.left = _1080p * (f21_arg0.weaponModel.basePosition.left + f21_local0)
		f21_local3.right = _1080p * (f21_arg0.weaponModel.basePosition.right + f21_local0)
		f21_local3.top = _1080p * f21_arg0.weaponModel.basePosition.top
		f21_local3.bottom = _1080p * f21_arg0.weaponModel.basePosition.bottom
		f21_local3.snapLeft = -f21_local3.left
		f21_local3.snapRight = -f21_local3.right
		f21_local3.snapTop = f21_local3.top
		f21_local3.snapBottom = f21_local3.bottom
		f21_local2 = f0_local5
	elseif f21_arg1 == f0_local6.Left then
		f21_local3.left = _1080p * (f21_arg0.weaponModel.basePosition.left - f21_local0)
		f21_local3.right = _1080p * (f21_arg0.weaponModel.basePosition.right - f21_local0)
		f21_local3.top = _1080p * f21_arg0.weaponModel.basePosition.top
		f21_local3.bottom = _1080p * f21_arg0.weaponModel.basePosition.bottom
		f21_local3.snapLeft = -f21_local3.left
		f21_local3.snapRight = -f21_local3.right
		f21_local3.snapTop = f21_local3.top
		f21_local3.snapBottom = f21_local3.bottom
		f21_local2 = f0_local5
	elseif f21_arg1 == f0_local6.Down then
		f21_local3.left = _1080p * f21_arg0.weaponModel.basePosition.left
		f21_local3.right = _1080p * f21_arg0.weaponModel.basePosition.right
		f21_local3.top = _1080p * (f21_arg0.weaponModel.basePosition.top + f21_local1)
		f21_local3.bottom = _1080p * (f21_arg0.weaponModel.basePosition.bottom + f21_local1)
		f21_local3.snapLeft = f21_local3.left
		f21_local3.snapRight = f21_local3.right
		f21_local3.snapTop = _1080p * (f21_arg0.weaponModel.basePosition.top - f21_local1)
		f21_local3.snapBottom = _1080p * (f21_arg0.weaponModel.basePosition.bottom - f21_local1)
		f21_local2 = f0_local4
	elseif f21_arg1 == f0_local6.Up then
		f21_local3.left = _1080p * f21_arg0.weaponModel.basePosition.left
		f21_local3.right = _1080p * f21_arg0.weaponModel.basePosition.right
		f21_local3.top = _1080p * (f21_arg0.weaponModel.basePosition.top - f21_local1)
		f21_local3.bottom = _1080p * (f21_arg0.weaponModel.basePosition.bottom - f21_local1)
		f21_local3.snapLeft = f21_local3.left
		f21_local3.snapRight = f21_local3.right
		f21_local3.snapTop = _1080p * (f21_arg0.weaponModel.basePosition.top + f21_local1)
		f21_local3.snapBottom = _1080p * (f21_arg0.weaponModel.basePosition.bottom + f21_local1)
		f21_local2 = f0_local4
	else
		DebugPrint( "ERROR: GetScrollPositionForWeapon scrolling on unknown button - defaulting to base position" )
		f21_local3.left = _1080p * f21_arg0.weaponModel.basePosition.left
		f21_local3.right = _1080p * f21_arg0.weaponModel.basePosition.right
		f21_local3.top = _1080p * f21_arg0.weaponModel.basePosition.top
		f21_local3.bottom = _1080p * f21_arg0.weaponModel.basePosition.bottom
		f21_local3.snapLeft = f21_local3.left
		f21_local3.snapRight = f21_local3.right
		f21_local3.snapTop = f21_local3.top
		f21_local3.snapBottom = f21_local3.bottom
		f21_local2 = 0
	end
	return {
		position = f21_local3,
		length = f21_local2
	}
end

local f0_local13 = function ( f22_arg0, f22_arg1, f22_arg2 )
	assert( f22_arg0.Weapons )
	local f22_local0 = f22_arg0.Weapons:GetDataSource()
	local f22_local1 = f22_local0.weapon
	local f22_local2 = Cac.GetCompleteWeaponModelName( f22_local1.baseWeaponRef:GetValue( f22_arg1 ), f22_local1.ref:GetValue( f22_arg1 ), f22_local1.quality:GetValue( f22_arg1 ), f22_local1.variantID:GetValue( f22_arg1 ), Cac.CamoNoneValue )
	local f22_local3 = f22_arg0.weaponModel
	if f22_arg0._currentWeaponModel then
		local f22_local4 = f0_local12( f22_arg0, f22_arg2 )
		local f22_local5 = f22_local4.position
		local f22_local6 = f22_local4.length
		local f22_local7 = function ()
			assert( f22_arg0._nextWeaponModel )
			f22_arg0._currentWeaponModel = f22_arg0._nextWeaponModel
			f22_arg0._nextWeaponModel = nil
			f22_arg0.weaponModel:SetWeaponModel( f22_arg0._currentWeaponModel )
			f22_arg0.weaponModel:SetAnchorsAndPosition( 0, 0, 0, 1, f22_local5.snapLeft, f22_local5.snapRight, f22_local5.snapTop, f22_local5.snapBottom, 0 )
			f22_arg0.weaponModel:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * f22_local3.basePosition.left, _1080p * f22_local3.basePosition.right, _1080p * f22_local3.basePosition.top, _1080p * f22_local3.basePosition.bottom, f22_local6 )
		end
		
		f22_arg0._nextWeaponModel = f22_local2
		assert( f22_arg0._nextWeaponModel )
		local f22_local8 = function ()
			if Streaming.HasWeaponViewModels( {
				f22_arg0._nextWeaponModel
			}, f22_arg1 ) then
				f22_local7()
			else
				local f24_local0 = nil
				local f24_local1 = function ()
					if f22_arg0._nextWeaponModel then
						if Streaming.HasWeaponViewModels( {
							f22_arg0._nextWeaponModel
						}, f22_arg1 ) then
							f22_local7()
						else
							local f25_local0 = f22_arg0:Wait( 100 )
							f25_local0.onComplete = f24_local0
						end
					end
				end
				
				f24_local1()
			end
		end
		
		local f22_local9 = f22_arg0.weaponModel:SetAnchorsAndPosition( 0, 0, 0, 1, f22_local5.left, f22_local5.right, f22_local5.top, f22_local5.bottom, f22_local6 )
		if f22_local6 > 0 then
			f22_local9.onComplete = f22_local8
		else
			f22_local8()
		end
	else
		f22_arg0.weaponModel:SetWeaponModel( f22_local2 )
		f22_arg0._currentWeaponModel = f22_local2
		f22_arg0._nextWeaponModel = nil
	end
end

function Mark2BonusTextHelper( f26_arg0, f26_arg1 )
	local f26_local0 = Cac.GetWeaponMk2BonusString
	local f26_local1 = f26_arg1
	local f26_local2 = f26_arg0.BaseWeapons:GetDataSource()
	f26_local0 = f26_local0( f26_local1, f26_local2.baseWeaponRef )
	assert( f26_arg0.WeaponDetails )
	assert( f26_arg0.WeaponDetails.MK2BonusText )
	assert( f26_arg0.WeaponDetails.MK2BonusText.BonusText )
	f26_arg0.WeaponDetails.MK2BonusText.BonusText:setText( f26_local0 )
end

function PreLoadFunc( f27_arg0, f27_arg1, f27_arg2 )
	FrontEndScene.SetTeamAndScene( "weapon_select", f27_arg1 )
end

function PostLoadFunc( f28_arg0, f28_arg1, f28_arg2 )
	assert( f28_arg2 )
	if CONDITIONS.IsPublicMatch( f28_arg0 ) then
		assert( f28_arg0.WeaponLevel )
	end
	assert( f28_arg0.Weapons )
	assert( f28_arg0.FireModes )
	Streaming.SetStreamingEnabled( true )
	if Engine.IsDevelopmentBuild() then
		if not f28_arg2.squadMemberDataSource then
			DebugPrint( "WARNING: Missing \"statsGroupDataSource\" option for WeaponSelect menu. Only OK after a MyChanges." )
			f28_arg2.squadMemberDataSource = DataSources.alwaysLoaded.playerData.MP.rankedloadouts.squadMembers
		end
		local f28_local0 = GetCACPlayerDataDataSource( f28_arg2.squadMemberDataSource )
		if not f28_arg2.weaponDataSource then
			DebugPrint( "WARNING: Missing \"weaponDataSource\" option for WeaponSelect menu. Only OK after a MyChanges." )
			local f28_local1 = f28_local0.loadouts:GetDataSourceAtIndex( 0 )
			f28_arg2.weaponDataSource = f28_local1.weaponSlotOne
		end
		if not f28_arg2.loadoutDataSource then
			DebugPrint( "WARNING: Missing \"loadoutDataSource\" option for WeaponSelect menu. Only OK after a MyChanges." )
			f28_arg2.loadoutDataSource = f28_local0.loadouts:GetDataSourceAtIndex( 0 )
		end
	end
	assert( f28_arg2.weaponDataSource )
	assert( f28_arg2.loadoutDataSource )
	assert( f28_arg2.squadMemberDataSource )
	f28_arg0.weaponDataSource = f28_arg2.weaponDataSource
	f28_arg0.loadoutDataSource = f28_arg2.loadoutDataSource
	f28_arg0.statsGroupDataSource = GetCACPlayerDataDataSource( f28_arg2.squadMemberDataSource )
	local f28_local0, f28_local1 = f0_local11( f28_arg0.weaponDataSource, f28_arg0.loadoutDataSource, f28_arg1 )
	if f28_local1 == Cac.PrimaryWeaponSlot then
		f28_arg0.MenuTitle.MenuTitle:setText( ToUpperCase( Engine.Localize( "LUA_MENU_TITLE_PRIMARY_WEAPON" ) ), 0 )
	elseif f28_local1 == Cac.SecondaryWeaponSlot then
		f28_arg0.MenuTitle.MenuTitle:setText( ToUpperCase( Engine.Localize( "LUA_MENU_TITLE_SECONDARY_WEAPON" ) ), 0 )
	end
	local f28_local2 = f28_arg0.loadoutDataSource.name:GetValue( f28_arg1 )
	f28_arg0.MenuTitle.MenuBreadcrumbs:setText( CoD.GetBreadcrumbCreateAClass(), 0 )
	local f28_local3 = {}
	if f28_arg0.loadoutDataSource.overkill.used:GetValue( f28_arg1 ) then
		local f28_local4 = nil
		if f28_local1 == Cac.SecondaryWeaponSlot then
			f28_local4 = f28_arg0.loadoutDataSource.weaponSlotOne.weapon:GetValue( f28_arg1 )
		else
			f28_local4 = f28_arg0.loadoutDataSource.weaponSlotTwo.weapon:GetValue( f28_arg1 )
		end
		f28_local3.filterOut = function ( f29_arg0 )
			return f29_arg0 == f28_local4
		end
		
	end
	local f28_local4 = LOADOUT.MakeBaseWeaponsListDataSource( f0_local0 .. ".baseWeapons", Cac.GetWeaponClasses( f28_local0 ), Cac.GetWeaponRowList(), f28_local3 )
	local f28_local5 = f28_local4:Decorate( Cac.GetWeaponTabDecorator( f28_arg0.weaponDataSource, f28_arg0.loadoutDataSource, GetBaseWeaponDecorator( f28_arg0 ), f0_local1 ) )
	f28_local5:SetCachingEnabled( true )
	f28_local5.GetDefaultFocusIndex = function ( f30_arg0 )
		local f30_local0 = f28_arg0.weaponDataSource.weapon:GetValue( f28_arg1 )
		local f30_local1 = Cac.GetEquippedWeaponClass( f28_arg0.weaponDataSource, f28_arg1 )
		if f30_local0 == "iw7_fists" then
			local f30_local2 = LUI.FlowManager.GetScopedData( f28_arg0 )
			return f30_local2.lastSelectedTabIndex and f30_local2.lastSelectedTabIndex or 0
		elseif Cac.IsWeaponInRowList( f30_local0 ) then
			return Cac.GetWeaponClassIndex( f30_local1 ) - 1
		else
			
		end
	end
	
	local f28_local6 = {
		weaponRef = LUI.DataSourceInGlobalModel.new( f0_local2 .. ".baseWeaponRef", f28_arg0.weaponDataSource.weapon:GetValue( f28_arg1 ) ),
		weaponLootID = LUI.DataSourceInGlobalModel.new( f0_local2 .. ".weaponLootID", f28_arg0.weaponDataSource.lootItemID:GetValue( f28_arg1 ) ),
		attachmentOneRef = LUI.DataSourceInGlobalModel.new( f0_local2 .. ".attachment0", "none" ),
		attachmentTwoRef = LUI.DataSourceInGlobalModel.new( f0_local2 .. ".attachment1", "none" ),
		attachmentThreeRef = LUI.DataSourceInGlobalModel.new( f0_local2 .. ".attachment2", "none" ),
		attachmentFourRef = LUI.DataSourceInGlobalModel.new( f0_local2 .. ".attachment3", "none" ),
		attachmentFiveRef = LUI.DataSourceInGlobalModel.new( f0_local2 .. ".attachment4", "none" )
	}
	if f28_arg0.weaponDataSource.slot:GetValue( f28_arg1 ) == 0 then
		f28_local6.attachmentSixRef = LUI.DataSourceInGlobalModel.new( f0_local2 .. ".attachment5", "none" )
	end
	local f28_local7 = {
		tabs = f28_local5,
		points = f28_arg2.loadoutDataSource.points,
		pointCountText = f28_arg2.loadoutDataSource.pointCountText,
		selectedWeapon = f28_local6
	}
	f28_arg0:SetDataSource( f28_local7, f28_arg1 )
	f28_arg0:SubscribeToModelThroughElement( f28_arg0.Weapons, "weapon.baseWeaponRef", function ( f31_arg0 )
		local f31_local0 = f28_arg0.Weapons:GetDataSource()
		local f31_local1 = f31_local0.weapon.ref:GetValue( f28_arg1 )
		local f31_local2 = Cac.GetLootWeaponID( f31_local1 )
		local f31_local3 = f28_arg0:GetDataSource()
		if not f31_local2 or f31_local2 == "" then
			f31_local2 = 0
		end
		f31_local3.selectedWeapon.weaponLootID:SetValue( f28_arg1, tonumber( f31_local2 ) )
		local f31_local4 = f31_local0.weapon.baseWeaponRef:GetValue( f28_arg1 )
		if CONDITIONS.IsPublicMatch( f28_arg0 ) then
			local f31_local5 = f28_arg0.WeaponLevel:GetDataSource()
			f31_local5.weaponRef:SetValue( f28_arg1, f31_local4 )
		end
		f28_local7.selectedWeapon.weaponRef:SetValue( f28_arg1, f31_local4 )
		ClientWeapon.SetWeaponRotation( 0, 0, 0, 0 )
		ClientWeapon.SetWeaponRotation( 1, 0, 0, 0 )
		ClientWeapon.SetWeaponRotation( 2, 0, 0, 0 )
		local f31_local5 = f28_arg0.BaseWeapons:GetFocusPositionIndex()
		local f31_local6 = f28_arg0.Weapons:GetFocusPositionIndex()
		local f31_local7 = f28_arg0.Tabs.Tabs:GetCurrentTabIndex()
		local f31_local8 = LUI.FlowManager.GetScopedData( f28_arg0 )
		f31_local8.lastSelectedTabIndex = f31_local7
		local f31_local9
		if f28_arg0._baseWeaponIndex == f31_local5 and f28_arg0._tabIndex == f31_local7 and f28_arg0._weaponIndex == f31_local6 then
			f31_local9 = false
		else
			f31_local9 = true
		end
		if f31_local9 then
			local f31_local10, f31_local11 = false
			if f28_arg0._baseWeaponIndex == f31_local5 and f28_arg0._tabIndex == f31_local7 and f28_arg0._weaponIndex ~= f31_local6 then
				f31_local10 = true
				if f28_arg0._weaponIndex < f31_local6 then
					f31_local11 = f0_local6.Left
				else
					f31_local11 = f0_local6.Right
				end
			end
			f28_arg0._baseWeaponIndex = f31_local5
			f28_arg0._weaponIndex = f31_local6
			f28_arg0._tabIndex = f31_local7
			if f31_local10 then
				f0_local13( f28_arg0, f28_arg1, f31_local11 )
			else
				local f31_local12 = Cac.GetCompleteWeaponModelName( f31_local4, f31_local1, f31_local0.weapon.quality:GetValue( f28_arg1 ), f31_local0.weapon.variantID:GetValue( f28_arg1 ), Cac.CamoNoneValue )
				f28_arg0.weaponModel:SetWeaponModel( f31_local12 )
				f28_arg0._currentWeaponModel = f31_local12
				local f31_local13 = f28_arg0.weaponModel.basePosition
				f28_arg0.weaponModel:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * f31_local13.left, _1080p * f31_local13.right, _1080p * f31_local13.top, _1080p * f31_local13.bottom, 0 )
			end
		end
	end )
	if CONDITIONS.IsPublicMatch() then
		f28_arg0:SubscribeToDataSourceThroughElement( f28_arg0.BaseWeapons, nil, function ()
			local f32_local0 = f28_arg0.BaseWeapons:GetDataSource()
			if f28_arg0.ChallengeProgress:SetupWeaponChallenge( f32_local0.baseWeaponRef, f28_arg1 ) then
				f28_arg0.FireModes:SetAlpha( 0, 0 )
				f28_arg0.StatsPanel:SetAlpha( 0, 0 )
				if f28_arg0.WeaponLevel then
					f28_arg0.WeaponLevel:SetAlpha( 0, 0 )
				end
				f28_arg0.Darkener:SetAlpha( 0, 0 )
			else
				f28_arg0.FireModes:SetAlpha( 1, 0 )
				f28_arg0.StatsPanel:SetAlpha( 1, 0 )
				if f28_arg0.WeaponLevel then
					f28_arg0.WeaponLevel:SetAlpha( 1, 0 )
				end
				f28_arg0.Darkener:SetAlpha( 1, 0 )
			end
		end )
	end
	if CONDITIONS.IsPublicMatch( f28_arg0 ) then
		f0_local3 = f28_arg0.WeaponLevel.modelPath
	end
	f28_arg0.FireModes:SetDataSourceThroughElement( f28_arg0.Weapons, "weapon.fireModes" )
	f28_arg0.currentYaw = 0
	f28_arg0.currentPitch = 0
	ClientWeapon.SetWeaponRotation( 0, 0, 0, 0 )
	ClientWeapon.SetWeaponRotation( 1, 0, 0, 0 )
	ClientWeapon.SetWeaponRotation( 2, 0, 0, 0 )
	if Engine.IsConsoleGame() then
		f28_arg0:AddButtonHelperTextToElement( f28_arg0, {
			helper_text = Engine.Localize( "LUA_MENU_ROTATE" ),
			button_ref = "button_stickr_updown_noswap",
			priority = 10,
			side = "left",
			clickable = false
		} )
	end
	if Engine.IsPC() then
		f28_arg0:addEventHandler( "left_arrow_clicked", function ( f33_arg0, f33_arg1 )
			f28_arg0.Weapons:FocusNextElement( f28_arg0.Weapons, "left", FocusType.Gamepad, "gamepad", f28_arg1 )
		end )
		f28_arg0:addEventHandler( "right_arrow_clicked", function ( f34_arg0, f34_arg1 )
			f28_arg0.Weapons:FocusNextElement( f28_arg0.Weapons, "right", FocusType.Gamepad, "gamepad", f28_arg1 )
		end )
		f28_arg0.bindButton:addEventHandler( "button_primary", function ( f35_arg0, f35_arg1 )
			local f35_local0 = f35_arg1.controller or f28_arg1
			local f35_local1 = f28_arg0.Weapons:GetVisibleChildInFocus()
			if f35_local1 and not f35_local1:IsDisabled() then
				f35_local1:processEvent( {
					name = "button_action",
					controller = f35_local0
				} )
			end
		end )
	end
	f28_arg0:addEventHandler( "update_stream_requests", function ( f36_arg0, f36_arg1 )
		local f36_local0 = f36_arg1.gridIndex
		local f36_local1 = f28_arg0.Weapons:GetGridDataSource()
		local f36_local2 = f36_local1:GetCountValue( f28_arg1 )
		local f36_local3 = {}
		for f36_local4 = f36_local0 - 1, f36_local0 + 1, 1 do
			if f36_local4 >= 0 and f36_local4 < f36_local2 then
				local f36_local7 = f36_local1:GetDataSourceFromVariantIndex( f36_local4, f28_arg1 )
				if f36_local7 ~= nil then
					local f36_local8 = f36_local7.weapon
					local f36_local9 = Cac.GetCompleteWeaponModelName( f36_local8.baseWeaponRef:GetValue( f28_arg1 ), f36_local8.ref:GetValue( f28_arg1 ), f36_local8.quality:GetValue( f28_arg1 ), f36_local8.variantID:GetValue( f28_arg1 ), Cac.CamoNoneValue )
					if not LUI.IsItemInArray( f36_local3, f36_local9 ) then
						table.insert( f36_local3, f36_local9 )
					end
				end
			end
		end
		if #f36_local3 > 0 then
			Streaming.RequestWeaponViewModels( f36_local3, f28_arg1 )
		end
	end )
	f28_arg0:addEventHandler( "pip_mouse_select", function ( f37_arg0, f37_arg1 )
		local f37_local0 = f37_arg1.pip:GetDataSource()
		f28_arg0.Weapons:SetFocusedPosition( {
			x = f37_local0.sortedIndex,
			y = 0
		}, false )
	end )
	local f28_local8 = MenuBuilder.BuildRegisteredType( "LobbyStatus", {
		controllerIndex = f28_arg1
	} )
	f28_local8:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -800, _1080p * -40, _1080p * -114, _1080p * -80 )
	f28_local8:Minimize()
	f28_arg0:addElement( f28_local8 )
	
	local weaponModel = LUI.UIWeaponModel.new( {
		controllerIndex = f28_arg1,
		clientWeaponIndex = 0,
		basePosition = {
			1198.5 * _1080p,
			565 * _1080p
		}
	} )
	weaponModel.basePosition = {
		left = -301.5,
		right = 778.5,
		top = 340,
		bottom = 790
	}
	weaponModel:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * weaponModel.basePosition.left, _1080p * weaponModel.basePosition.right, _1080p * weaponModel.basePosition.top, _1080p * weaponModel.basePosition.bottom )
	weaponModel.id = "weaponModel"
	f28_arg0:addElement( weaponModel )
	f28_arg0.weaponModel = weaponModel
	
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		local f28_local10 = f28_arg0.ArrowLeft
		local f28_local11 = {}
		f28_local10.initialRect = f28_arg0.ArrowLeft:getLocalRect()
		f28_local10 = f28_arg0.ArrowRight
		f28_local11 = {}
		f28_local10.initialRect = f28_arg0.ArrowRight:getLocalRect()
		f28_arg0:addEventHandler( "resized_pips", function ()
			local f38_local0 = f28_arg0.WeaponsPips:getNumChildren()
			if f38_local0 <= 1 then
				f28_arg0.ArrowLeft:SetAlpha( 0, 0 )
				f28_arg0.ArrowRight:SetAlpha( 0, 0 )
			else
				f28_arg0.ArrowLeft:SetAlpha( 1, 0 )
				f28_arg0.ArrowRight:SetAlpha( 1, 0 )
				local f38_local1 = {}
				local f38_local2 = f28_arg0.WeaponsPips:getLastChild()
				f38_local1 = f38_local2:getLocalRect()
				local f38_local3 = (10 + f38_local1[3] - f38_local1[1]) * (f38_local0 - 5) * 0.5
				local f38_local4 = {}
				f38_local4 = f28_arg0.ArrowLeft:GetAnchorData()
				local f38_local5 = {}
				f38_local5 = f28_arg0.ArrowRight:GetAnchorData()
				f28_arg0.ArrowLeft:SetAnchorsAndPosition( f38_local4[1], f38_local4[3], f38_local4[2], f38_local4[4], f28_arg0.ArrowLeft.initialRect[1] - f38_local3, f28_arg0.ArrowLeft.initialRect[3] - f38_local3, f28_arg0.ArrowLeft.initialRect[2], f28_arg0.ArrowLeft.initialRect[4] )
				f28_arg0.ArrowRight:SetAnchorsAndPosition( f38_local5[1], f38_local5[3], f38_local5[2], f38_local5[4], f28_arg0.ArrowRight.initialRect[1] + f38_local3, f28_arg0.ArrowRight.initialRect[3] + f38_local3, f28_arg0.ArrowRight.initialRect[2], f28_arg0.ArrowRight.initialRect[4] )
			end
		end )
	end
	if CONDITIONS.IsDraftEnabled( f28_arg0 ) then
		assert( f28_arg0.LoadoutDraftTimer )
		Cac.SetupLoadoutDraftTimerRefresh( f28_arg0.LoadoutDraftTimer )
	end
	f28_arg0:SubscribeToDataSourceThroughElement( f28_arg0.BaseWeapons, nil, function ()
		Mark2BonusTextHelper( f28_arg0, f28_arg1 )
	end )
	f28_arg0:SubscribeToDataSourceThroughElement( f28_arg0.Weapons, nil, function ()
		Mark2BonusTextHelper( f28_arg0, f28_arg1 )
	end )
end

function WeaponSelect( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "WeaponSelect"
	self._animationSets = {}
	self._sequences = {}
	local f41_local1 = controller and controller.controllerIndex
	if not f41_local1 and not Engine.InFrontend() then
		f41_local1 = self:getRootController()
	end
	assert( f41_local1 )
	PreLoadFunc( self, f41_local1, controller )
	self:playSound( "menu_open" )
	local f41_local2 = self
	local Darkener = nil
	
	Darkener = LUI.UIImage.new()
	Darkener.id = "Darkener"
	Darkener:SetRGBFromInt( 0, 0 )
	Darkener:SetAlpha( 0.5, 0 )
	Darkener:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -1507, 0, _1080p * -224, _1080p * -115 )
	self:addElement( Darkener )
	self.Darkener = Darkener
	
	local Tabs = nil
	
	Tabs = MenuBuilder.BuildRegisteredType( "WeaponSelectTabsBar", {
		controllerIndex = f41_local1
	} )
	Tabs.id = "Tabs"
	Tabs.Tabs:SetTabManagerDataSourceThroughElement( self, "tabs" )
	Tabs:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 145, _1080p * 185 )
	self:addElement( Tabs )
	self.Tabs = Tabs
	
	local f41_local5 = nil
	if Engine.InFrontend() then
		f41_local5 = LUI.UIImage.new()
		f41_local5.id = "DropShadow"
		f41_local5:SetRGBFromInt( 0, 0 )
		f41_local5:SetAlpha( 0.3, 0 )
		f41_local5:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
		f41_local5:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -1507, 0, _1080p * -224, _1080p * -220 )
		self:addElement( f41_local5 )
		self.DropShadow = f41_local5
	end
	local LootPipBacker = nil
	
	LootPipBacker = LUI.UIBlur.new()
	LootPipBacker.id = "LootPipBacker"
	LootPipBacker:SetRGBFromInt( 10921638, 0 )
	LootPipBacker:SetBlurStrength( 2.75, 0 )
	LootPipBacker:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 413, 0, _1080p * -273, _1080p * -224 )
	self:addElement( LootPipBacker )
	self.LootPipBacker = LootPipBacker
	
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f41_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local ListAnchor = nil
	
	ListAnchor = LUI.UIImage.new()
	ListAnchor.id = "ListAnchor"
	ListAnchor:SetRGBFromInt( 6710886, 0 )
	ListAnchor:SetAlpha( 0.6, 0 )
	ListAnchor:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 147, _1080p * 397, _1080p * 914, _1080p * 938 )
	self:addElement( ListAnchor )
	self.ListAnchor = ListAnchor
	
	local BaseWeapons = nil
	
	BaseWeapons = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 5,
		controllerIndex = f41_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "BaseWeapon", {
				controllerIndex = f41_local1
			} )
		end,
		wrapX = false,
		wrapY = false,
		spacingX = _1080p * 6,
		spacingY = _1080p * 6,
		columnWidth = _1080p * 250,
		rowHeight = _1080p * 133.2,
		scrollingThresholdX = 1,
		scrollingThresholdY = 0,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	BaseWeapons.id = "BaseWeapons"
	BaseWeapons:setUseStencil( true )
	BaseWeapons:SetGridDataSourceThroughElement( Tabs.Tabs, "baseWeapons" )
	BaseWeapons:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 147, _1080p * 397, _1080p * 216, _1080p * 906 )
	self:addElement( BaseWeapons )
	self.BaseWeapons = BaseWeapons
	
	local Weapons = nil
	
	Weapons = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 1,
		controllerIndex = f41_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "Weapon", {
				controllerIndex = f41_local1
			} )
		end,
		wrapX = false,
		wrapY = false,
		primaryAxis = LUI.DIRECTION.vertical,
		spacingX = _1080p * 0,
		spacingY = _1080p * 0,
		columnWidth = _1080p * 1000,
		rowHeight = _1080p * 450,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Center,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 2800
	} )
	Weapons.id = "Weapons"
	Weapons:setUseStencil( true )
	Weapons:SetGridDataSourceThroughElement( BaseWeapons, "variants" )
	Weapons:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * -301.5, _1080p * 778.5, _1080p * 340, _1080p * 790 )
	self:addElement( Weapons )
	self.Weapons = Weapons
	
	local WeaponDetails = nil
	WeaponDetails = MenuBuilder.BuildRegisteredType( "WeaponDetails", {
		controllerIndex = f41_local1
	} )
	WeaponDetails.id = "WeaponDetails"
	WeaponDetails:SetDataSourceThroughElement( Weapons, nil )
	if Engine.IsMultiplayer() then
		WeaponDetails.Passives.Grid:SetLeft( _1080p * 0, 0 )
	end
	WeaponDetails:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 413, 0, _1080p * 216, _1080p * 666 )
	self:addElement( WeaponDetails )
	self.WeaponDetails = WeaponDetails
	
	local BaseWeaponsScrollbar = nil
	
	BaseWeaponsScrollbar = MenuBuilder.BuildRegisteredType( "VerticalMinimalScrollbar", {
		controllerIndex = f41_local1
	} )
	BaseWeaponsScrollbar.id = "BaseWeaponsScrollbar"
	BaseWeaponsScrollbar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 147, _1080p * 216, _1080p * 906 )
	self:addElement( BaseWeaponsScrollbar )
	self.BaseWeaponsScrollbar = BaseWeaponsScrollbar
	
	local f41_local13 = nil
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		f41_local13 = LUI.Pips.new( {
			spacing = _1080p * 10,
			direction = LUI.DIRECTION.horizontal,
			alignment = LUI.Alignment.Center,
			buildPip = function ()
				return MenuBuilder.BuildRegisteredType( "WeaponPip", {
					controllerIndex = f41_local1
				} )
			end,
			controllerIndex = f41_local1
		} )
		f41_local13.id = "WeaponsPips"
		f41_local13:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 1037.5, _1080p * -602.5, _1080p * -273, _1080p * -225 )
		self:addElement( f41_local13 )
		self.WeaponsPips = f41_local13
	end
	local ArrowRight = nil
	
	ArrowRight = MenuBuilder.BuildRegisteredType( "ArrowRight", {
		controllerIndex = f41_local1
	} )
	ArrowRight.id = "ArrowRight"
	ArrowRight:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -597.5, _1080p * -563.5, _1080p * 797.5, _1080p * 865.5 )
	self:addElement( ArrowRight )
	self.ArrowRight = ArrowRight
	
	local ArrowLeft = nil
	
	ArrowLeft = MenuBuilder.BuildRegisteredType( "ArrowLeft", {
		controllerIndex = f41_local1
	} )
	ArrowLeft.id = "ArrowLeft"
	ArrowLeft:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 998.5, _1080p * 1032.5, _1080p * 797.5, _1080p * 865.5 )
	self:addElement( ArrowLeft )
	self.ArrowLeft = ArrowLeft
	
	local f41_local16 = nil
	if CONDITIONS.IsPublicMatch( self ) then
		f41_local16 = MenuBuilder.BuildRegisteredType( "LevelInfo", {
			controllerIndex = f41_local1
		} )
		f41_local16.id = "WeaponLevel"
		f41_local16:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -396, _1080p * -96, _1080p * -212.5, _1080p * -126.5 )
		self:addElement( f41_local16 )
		self.WeaponLevel = f41_local16
	end
	local StatsPanel = nil
	
	StatsPanel = MenuBuilder.BuildRegisteredType( "WeaponStatsPanel", {
		controllerIndex = f41_local1
	} )
	StatsPanel.id = "StatsPanel"
	StatsPanel:SetDataSourceThroughElement( self, "selectedWeapon" )
	StatsPanel:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 425.5, _1080p * 820.5, _1080p * -212.5, _1080p * -126.5 )
	self:addElement( StatsPanel )
	self.StatsPanel = StatsPanel
	
	local MenuTitle = nil
	
	MenuTitle = MenuBuilder.BuildRegisteredType( "MenuTitle", {
		controllerIndex = f41_local1
	} )
	MenuTitle.id = "MenuTitle"
	MenuTitle.MenuTitle:setText( ToUpperCase( Engine.Localize( "MENU_NEW" ) ), 0 )
	MenuTitle.MenuBreadcrumbs:setText( ToUpperCase( Engine.Localize( "MENU_MULTIPLAYER" ) ), 0 )
	MenuTitle.Icon:SetTop( _1080p * -28.5, 0 )
	MenuTitle.Icon:SetBottom( _1080p * 61.5, 0 )
	MenuTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1096, _1080p * 54, _1080p * 134 )
	self:addElement( MenuTitle )
	self.MenuTitle = MenuTitle
	
	local ArrowUp = nil
	
	ArrowUp = MenuBuilder.BuildRegisteredType( "ArrowUp", {
		controllerIndex = f41_local1
	} )
	ArrowUp.id = "ArrowUp"
	ArrowUp:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 344.5, _1080p * 364.5, _1080p * 907, _1080p * 947 )
	self:addElement( ArrowUp )
	self.ArrowUp = ArrowUp
	
	local ArrowDown = nil
	
	ArrowDown = MenuBuilder.BuildRegisteredType( "ArrowDown", {
		controllerIndex = f41_local1
	} )
	ArrowDown.id = "ArrowDown"
	ArrowDown:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 179.5, _1080p * 199.5, _1080p * 906, _1080p * 946 )
	self:addElement( ArrowDown )
	self.ArrowDown = ArrowDown
	
	local ListCount = nil
	
	ListCount = LUI.UIText.new()
	ListCount.id = "ListCount"
	ListCount:setText( "1/15", 0 )
	ListCount:SetFontSize( 24 * _1080p )
	ListCount:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ListCount:SetAlignment( LUI.Alignment.Center )
	ListCount:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 199.5, _1080p * 344.5, _1080p * 914, _1080p * 938 )
	self:addElement( ListCount )
	self.ListCount = ListCount
	
	local FireModes = nil
	
	FireModes = MenuBuilder.BuildRegisteredType( "FireModes", {
		controllerIndex = f41_local1
	} )
	FireModes.id = "FireModes"
	FireModes:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -930, _1080p * -555, _1080p * -216, _1080p * -177 )
	self:addElement( FireModes )
	self.FireModes = FireModes
	
	local SocialFeed = nil
	
	SocialFeed = MenuBuilder.BuildRegisteredType( "SocialFeed", {
		controllerIndex = f41_local1
	} )
	SocialFeed.id = "SocialFeed"
	SocialFeed:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -115, _1080p * -85 )
	self:addElement( SocialFeed )
	self.SocialFeed = SocialFeed
	
	local MissionTeamInfo = nil
	
	MissionTeamInfo = MenuBuilder.BuildRegisteredType( "MissionTeamInfo", {
		controllerIndex = f41_local1
	} )
	MissionTeamInfo.id = "MissionTeamInfo"
	MissionTeamInfo:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -700, 0, _1080p * 54, _1080p * 142 )
	self:addElement( MissionTeamInfo )
	self.MissionTeamInfo = MissionTeamInfo
	
	local WeaponRotator = nil
	
	WeaponRotator = MenuBuilder.BuildRegisteredType( "WeaponRotator", {
		controllerIndex = f41_local1
	} )
	WeaponRotator.id = "WeaponRotator"
	WeaponRotator:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 413, 0, _1080p * 357, _1080p * 790 )
	self:addElement( WeaponRotator )
	self.WeaponRotator = WeaponRotator
	
	local f41_local26 = nil
	if CONDITIONS.IsPublicMatch( self ) then
		f41_local26 = MenuBuilder.BuildRegisteredType( "CRMMain", {
			controllerIndex = f41_local1
		} )
		f41_local26.id = "CRMMain"
		f41_local26:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 136, _1080p * 447, _1080p * 745, _1080p * 1069 )
		self:addElement( f41_local26 )
		self.CRMMain = f41_local26
	end
	local f41_local27 = nil
	if CONDITIONS.IsDraftEnabled( self ) then
		f41_local27 = MenuBuilder.BuildRegisteredType( "LoadoutDraftTimer", {
			controllerIndex = f41_local1
		} )
		f41_local27.id = "LoadoutDraftTimer"
		f41_local27:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -150, _1080p * 150, 0, _1080p * 64 )
		self:addElement( f41_local27 )
		self.LoadoutDraftTimer = f41_local27
	end
	local f41_local28 = nil
	if CONDITIONS.IsPublicMatch( self ) then
		f41_local28 = MenuBuilder.BuildRegisteredType( "ChallengeProgressWithRadialBar", {
			controllerIndex = f41_local1
		} )
		f41_local28.id = "ChallengeProgress"
		f41_local28:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 413, _1080p * -122, _1080p * -263, _1080p * -81 )
		self:addElement( f41_local28 )
		self.ChallengeProgress = f41_local28
	end
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Darkener:RegisterAnimationSequence( "MenuOpen", {
			{
				function ()
					return self.Darkener:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -1184, 0, _1080p * -224, _1080p * -115, 0 )
				end,
				function ()
					return self.Darkener:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -1507, 0, _1080p * -224, _1080p * -115, 300, LUI.EASING.outQuadratic )
				end
			}
		} )
		LootPipBacker:RegisterAnimationSequence( "MenuOpen", {
			{
				function ()
					return self.LootPipBacker:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 736, 0, _1080p * -273, _1080p * -224, 0 )
				end,
				function ()
					return self.LootPipBacker:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 413, 0, _1080p * -273, _1080p * -224, 300, LUI.EASING.outQuadratic )
				end
			}
		} )
		StatsPanel:RegisterAnimationSequence( "MenuOpen", {
			{
				function ()
					return self.StatsPanel:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 746, _1080p * 1141, _1080p * -212.5, _1080p * -126.5, 0 )
				end,
				function ()
					return self.StatsPanel:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 425.5, _1080p * 820.5, _1080p * -212.5, _1080p * -126.5, 300, LUI.EASING.outQuadratic )
				end
			}
		} )
		FireModes:RegisterAnimationSequence( "MenuOpen", {
			{
				function ()
					return self.FireModes:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -773.5, _1080p * -398.5, _1080p * -213, _1080p * -174, 0 )
				end,
				function ()
					return self.FireModes:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -930, _1080p * -555, _1080p * -213, _1080p * -174, 300, LUI.EASING.outQuadratic )
				end
			}
		} )
		self._sequences.MenuOpen = function ()
			Darkener:AnimateSequence( "MenuOpen" )
			LootPipBacker:AnimateSequence( "MenuOpen" )
			StatsPanel:AnimateSequence( "MenuOpen" )
			FireModes:AnimateSequence( "MenuOpen" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	BaseWeapons:addEventHandler( "gain_focus", function ( f56_arg0, f56_arg1 )
		ACTIONS.GainFocus( self, "Weapons", f56_arg1.controller or f41_local1 )
	end )
	BaseWeapons:addEventHandler( "lose_focus", function ( f57_arg0, f57_arg1 )
		ACTIONS.LoseFocus( self, "Weapons", f57_arg1.controller or f41_local1 )
	end )
	WeaponDetails:SetDataSourceThroughElement( Weapons, nil )
	StatsPanel:SetDataSourceThroughElement( self, "selectedWeapon" )
	local f41_local29 = LUI.UIScrollbar.new
	local bindButton = {
		direction = LUI.DIRECTION.vertical,
		eventListener = BaseWeaponsScrollbar,
		startCap = BaseWeaponsScrollbar.startCap,
		endCap = BaseWeaponsScrollbar.endCap
	}
	local f41_local31 = BaseWeaponsScrollbar.sliderArea
	if f41_local31 then
		f41_local31 = BaseWeaponsScrollbar.sliderArea.slider
	end
	bindButton.slider = f41_local31
	f41_local31 = BaseWeaponsScrollbar.sliderArea
	if f41_local31 then
		f41_local31 = BaseWeaponsScrollbar.sliderArea.fixedSizeSlider
	end
	bindButton.fixedSizeSlider = f41_local31
	BaseWeapons:AddScrollbar( f41_local29( bindButton ) )
	BaseWeapons:AddArrow( ArrowUp )
	BaseWeapons:AddArrow( ArrowDown )
	BaseWeapons:AddItemNumbers( ListCount )
	Weapons:AddScrollbar( f41_local13 )
	Weapons:AddArrow( ArrowLeft )
	Weapons:AddArrow( ArrowRight )
	self.addButtonHelperFunction = function ( f58_arg0, f58_arg1 )
		f58_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			priority = 10,
			clickable = true
		} )
		f58_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_SELECT" ),
			button_ref = "button_primary",
			side = "left",
			priority = -10,
			clickable = true
		} )
	end
	
	self:addEventHandler( "menu_create", self.addButtonHelperFunction )
	
	bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	self.bindButton:addEventHandler( "button_secondary", function ( f59_arg0, f59_arg1 )
		local f59_local0 = f59_arg1.controller or f41_local1
		ACTIONS.LeaveMenu( self )
		return true
	end )
	PostLoadFunc( self, f41_local1, controller )
	ACTIONS.AnimateSequence( self, "MenuOpen" )
	if CONDITIONS.IsPublicMatch( self ) then
		ACTIONS.AnimateSequenceByElement( self, {
			elementName = "CRMMain",
			sequenceName = "Minimize",
			elementPath = "CRMMain"
		} )
	end
	return self
end

MenuBuilder.registerType( "WeaponSelect", WeaponSelect )
LUI.FlowManager.RegisterStackPopBehaviour( "WeaponSelect", PopFunc )
LockTable( _M )
