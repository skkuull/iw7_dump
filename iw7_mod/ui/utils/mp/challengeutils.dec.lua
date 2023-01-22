Challenge = Challenge or {}
Challenge.PopuplateCategoryInfo = function ( f1_arg0 )
	for f1_local4, f1_local5 in pairs( CHALLENGE_CATEGORIES_LIST ) do
		if f1_local5.topChallenges == nil then
			local f1_local3 = Challenge.GetCategoryInfo( f1_local4, f1_arg0 )
			f1_local5.totalProgress = f1_local3.progress
			f1_local5.topChallenges = f1_local3.topChallenges
		end
	end
end

Challenge.GetCategoryInfo = function ( f2_arg0, f2_arg1 )
	local f2_local0 = 0
	local f2_local1 = 0
	local f2_local2 = {}
	for f2_local14, f2_local15 in pairs( CHALLENGE_CATEGORIES_LIST[f2_arg0].subCategories ) do
		local f2_local16 = CHALLENGE_CATEGORIES_LIST[f2_arg0].subCategories[f2_local14].ref
		for f2_local9, f2_local10 in ipairs( {
			CSV.allChallengesTable.file,
			CSV.allChallengesTable.altFile
		} ) do
			for f2_local8 = 0, Engine.TableGetRowCount( f2_local10 ), 1 do
				local f2_local6 = Engine.TableLookupByRow( f2_local10, f2_local8, CSV.allChallengesTable.cols.ref )
				if f2_local6 ~= "" and Engine.TableLookupByRow( f2_local10, f2_local8, CSV.allChallengesTable.cols.subCategory ) == f2_local16 then
					local f2_local7 = CallingCardUtils.GetChallengeEntry( f2_local6, f2_arg1, f2_local10 )
					if not f2_local7.isMasterChallenge then
						if f2_local7.isCompleted then
							f2_local1 = f2_local1 + 1
						else
							f2_local2[#f2_local2 + 1] = {
								ref = f2_local6,
								progress = f2_local7.currentProgressPercent,
								allChallengesTable = f2_local10
							}
						end
						f2_local0 = f2_local0 + 1
					end
				end
			end
		end
	end
	table.sort( f2_local2, function ( f3_arg0, f3_arg1 )
		return f3_arg1.progress < f3_arg0.progress
	end )
	f2_local3 = f2_local1 / math.max( f2_local0, 1 )
	f2_local4 = {}
	for f2_local5 = 1, 3, 1 do
		if f2_local2[f2_local5] then
			table.insert( f2_local4, f2_local2[f2_local5] )
		end
	end
	return {
		progress = f2_local3,
		topChallenges = f2_local4
	}
end

Challenge.GetCategoryRefFromIndex = function ( f4_arg0 )
	assert( type( f4_arg0 ) == "number" )
	assert( f4_arg0 >= 0 )
	for f4_local3, f4_local4 in pairs( CHALLENGE_CATEGORIES_LIST ) do
		if f4_local4.index == f4_arg0 then
			return f4_local3
		end
	end
end

Challenge.GetCategoryName = function ( f5_arg0 )
	return CHALLENGE_CATEGORIES_LIST[f5_arg0].name
end

Challenge.GetCategoryDesc = function ( f6_arg0 )
	return CHALLENGE_CATEGORIES_LIST[f6_arg0].desc
end

Challenge.GetCategoryIndex = function ( f7_arg0 )
	return CHALLENGE_CATEGORIES_LIST[f7_arg0].index
end

Challenge.GetLocalizedUnlockString = function ( f8_arg0 )
	return Engine.Localize( Engine.TableLookup( CSV.challengeUnlockTable.file, CSV.challengeUnlockTable.cols.ref, f8_arg0, CSV.challengeUnlockTable.cols.ui_text ), Engine.TableLookup( CSV.challengeUnlockTable.file, CSV.challengeUnlockTable.cols.ref, f8_arg0, CSV.challengeUnlockTable.cols.ui_text_var1 ) )
end

Challenge.GetPersonalizationItemChallengeData = function ( f9_arg0, f9_arg1, f9_arg2, f9_arg3, f9_arg4 )
	if not f9_arg2 then
		f9_arg2 = {}
	end
	if f9_arg2[f9_arg1] then
		return f9_arg2[f9_arg1]
	end
	local f9_local0 = CSV.ReadRow( {
		file = f9_arg3.file,
		cols = {
			challengeRef = f9_arg3.cols.challengeRef,
			challengeTier = f9_arg3.cols.challengeTier,
			altUnlockString = f9_arg3.cols.altUnlockString
		}
	}, Engine.TableLookupMultipleKeysGetRowNum( f9_arg3.file, {
		{
			col = f9_arg3.cols.equipmentRef,
			key = f9_arg0
		},
		{
			col = f9_arg3.cols.itemRef,
			key = f9_arg1
		}
	} ) )
	local f9_local1 = f9_local0.challengeRef
	local f9_local2 = f9_local0.challengeTier
	local f9_local3 = f9_local0.altUnlockString and f9_local0.altUnlockString or nil
	f9_arg2[f9_arg1] = {}
	if f9_local1 and f9_local1 ~= "" then
		local f9_local4 = nil
		for f9_local8, f9_local9 in ipairs( {
			CSV.allChallengesTable.file,
			CSV.allChallengesTable.altFile
		} ) do
			f9_local4 = CSV.ReadRow( {
				file = f9_local9,
				cols = {
					ref = CSV.allChallengesTable.cols.ref,
					name = CSV.allChallengesTable.cols.name,
					desc = CSV.allChallengesTable.cols.desc,
					currentTierMax = CSV.allChallengesTable.cols.tiers.targetStart + CSV.allChallengesTable.numTierCols * f9_local2
				}
			}, Engine.TableLookupGetRowNum( f9_local9, CSV.allChallengesTable.cols.ref, f9_local1 ) )
			if f9_local4 and f9_local4.currentTierMax ~= "" then
				break
			end
		end
		assert( f9_local4.currentTierMax ~= "", "ERROR: " .. f9_arg3.file .. " is trying to get data for invalid challenge " .. f9_local1 .. " tier index " .. f9_local2 .. " in " .. CSV.allChallengesTable.file .. " or " .. CSV.allChallengesTable.altFile )
		f9_arg2[f9_arg1].ref = f9_local1
		f9_arg2[f9_arg1].tierIndex = tonumber( f9_local2 )
		f9_arg2[f9_arg1].desc = Engine.Localize( f9_local4.desc, f9_local4.currentTierMax )
		f9_arg2[f9_arg1].currentTierMax = tonumber( f9_local4.currentTierMax )
		f9_arg2[f9_arg1].currentProgress = math.min( f9_arg2[f9_arg1].currentTierMax, Engine.GetPlayerDataEx( f9_arg4, CoD.StatsGroup.Ranked, "challengeProgress", f9_local1 ) )
		f9_arg2[f9_arg1].altUnlockString = f9_local3
	end
	return f9_arg2[f9_arg1]
end

Challenge.GetWeaponUnlockChallengeData = function ( f10_arg0, f10_arg1 )
	local f10_local0 = {}
	local f10_local1 = Engine.TableLookup( CSV.weaponChallengeMap.file, CSV.weaponChallengeMap.cols.weaponRef, f10_arg0, CSV.weaponChallengeMap.cols.challengeRef )
	if f10_local1 and f10_local1 ~= "" then
		local f10_local2 = Engine.TableLookupGetRowNum( CSV.allChallengesTable.file, CSV.allChallengesTable.cols.ref, f10_local1 )
		assert( f10_local2 ~= -1, "Missing weapon entry for '" .. f10_local1 .. "' in " .. CSV.allChallengesTable.file )
		f10_local0 = CSV.ReadRow( {
			file = CSV.allChallengesTable.file,
			cols = {
				ref = CSV.allChallengesTable.cols.ref,
				name = CSV.allChallengesTable.cols.name,
				desc = CSV.allChallengesTable.cols.desc,
				target = CSV.allChallengesTable.cols.tiers.targetStart
			}
		}, f10_local2 )
		f10_local0.localizedDesc = Engine.Localize( f10_local0.desc, f10_local0.target )
		f10_local0.challengeProgress = Engine.GetPlayerDataEx( f10_arg1, CoD.StatsGroup.Ranked, "challengeProgress", f10_local1 )
	end
	return f10_local0
end

Challenge.GetLocalizedChallengeDesc = function ( f11_arg0, f11_arg1, f11_arg2 )
	local f11_local0 = f11_arg2 or CSV.allChallengesTable.file
	local f11_local1 = Engine.TableLookup( f11_local0, CSV.allChallengesTable.cols.ref, f11_arg0, CSV.allChallengesTable.cols.desc )
	if f11_local1 == nil or f11_local1 == "" then
		f11_local1 = Engine.TableLookup( CSV.allChallengesTable.altFile, CSV.allChallengesTable.cols.ref, f11_arg0, CSV.allChallengesTable.cols.name )
	end
	local f11_local2 = Engine.TableLookup( f11_local0, CSV.allChallengesTable.cols.ref, f11_arg0, CSV.allChallengesTable.cols.displayParam )
	if not f11_local2 or f11_local2 == "" then
		f11_local2 = f11_arg1
	end
	if f11_local1 and f11_local1 ~= "" then
		if f11_local2 then
			return Engine.Localize( f11_local1, f11_local2 )
		else
			return Engine.Localize( f11_local1 )
		end
	else
		assert( false, "Unable to get localized description for challengeRef " .. f11_arg0 )
		return ""
	end
end

