CallingCardUtils = {
	GetCallingCardDataSources = function ( f1_arg0, f1_arg1 )
		if CallingCardUtils.GetCardIsShippable( f1_arg1 ) ~= "TRUE" then
			return nil
		end
		local f1_local0 = CSV.ReadRow( CSV.callingCards, Engine.TableLookupGetRowNum( CSV.callingCards.file, CSV.callingCards.cols.index, tostring( f1_arg1 ) ) )
		local f1_local1 = Cac.LowestQuality
		local f1_local2 = f1_local0.lootID
		if f1_local2 ~= "" then
			f1_local1 = tonumber( Engine.TableLookup( CSV.cosmeticCallingCardsLootMaster.file, CSV.cosmeticCallingCardsLootMaster.cols.index, f1_local2, CSV.cosmeticCallingCardsLootMaster.cols.quality ) )
		end
		local f1_local3 = LUI.DataSourceInGlobalModel.new( f1_arg0 .. ".challenge", f1_local0.challenge )
		return {
			index = LUI.DataSourceInGlobalModel.new( f1_arg0 .. ".index", f1_local0.index ),
			texture = LUI.DataSourceInGlobalModel.new( f1_arg0 .. ".texture", CallingCardUtils.GetCardTexture( f1_arg1 ) ),
			category = LUI.DataSourceInGlobalModel.new( f1_arg0 .. ".category", CallingCardUtils.GetCardChallengeCategoryStringFromID( f1_arg1, f1_local0.categoryID, f1_local0.challenge ) ),
			categoryID = LUI.DataSourceInGlobalModel.new( f1_arg0 .. ".categoryID", f1_local0.categoryID ),
			quality = LUI.DataSourceInGlobalModel.new( f1_arg0 .. ".quality", f1_local1 ),
			challenge = f1_local3,
			challengeInfoAlpha = f1_local3:Filter( "alpha", CallingCardUtils.GetCardChallengeInfoAlpha ),
			isMasterCard = LUI.DataSourceInGlobalModel.new( f1_arg0 .. ".isMasterCard", f1_local0.isMasterCard ),
			hideIfLocked = LUI.DataSourceInGlobalModel.new( f1_arg0 .. ".hideIfLocked", f1_local0.hideIfLocked == "1" )
		}
	end,
	GetCardIDByRow = function ( f2_arg0 )
		return Engine.TableLookupByRow( CSV.callingCards.file, f2_arg0, CSV.callingCards.cols.index )
	end,
	GetCardTexture = function ( f3_arg0 )
		if f3_arg0 == "" then
			return Engine.TableLookup( CSV.callingCards.file, CSV.callingCards.cols.index, tostring( 0 ), CSV.callingCards.cols.texture )
		elseif CallingCardUtils.GetCardIsShippable( f3_arg0 ) == "TRUE" then
			return Engine.TableLookup( CSV.callingCards.file, CSV.callingCards.cols.index, f3_arg0, CSV.callingCards.cols.texture )
		else
			return Engine.TableLookup( CSV.callingCards.file, CSV.callingCards.cols.index, tostring( tonumber( f3_arg0 ) % 10 ), CSV.callingCards.cols.texture )
		end
	end,
	GetCardCategoryName = function ( f4_arg0 )
		return Engine.Localize( Engine.TableLookup( CSV.callingCards.file, CSV.callingCards.cols.index, f4_arg0, CSV.callingCards.cols.category ) )
	end,
	GetCardCategoryID = function ( f5_arg0 )
		return Engine.TableLookup( CSV.callingCards.file, CSV.callingCards.cols.index, f5_arg0, CSV.callingCards.cols.categoryID )
	end,
	GetCardChallenge = function ( f6_arg0 )
		return Engine.TableLookup( CSV.callingCards.file, CSV.callingCards.cols.index, f6_arg0, CSV.callingCards.cols.challenge )
	end,
	GetCardIsMasterCard = function ( f7_arg0 )
		return Engine.TableLookup( CSV.callingCards.file, CSV.callingCards.cols.index, f7_arg0, CSV.callingCards.cols.isMasterCard )
	end,
	GetCardChallengeName = function ( f8_arg0 )
		local f8_local0 = Engine.TableLookup( CSV.allChallengesTable.file, CSV.allChallengesTable.cols.ref, f8_arg0, CSV.allChallengesTable.cols.name )
		if f8_local0 == nil or f8_local0 == "" then
			f8_local0 = Engine.TableLookup( CSV.allChallengesTable.altFile, CSV.allChallengesTable.cols.ref, f8_arg0, CSV.allChallengesTable.cols.name )
		end
		return Engine.Localize( f8_local0 )
	end,
	GetCardChallengeDesc = function ( f9_arg0, f9_arg1, f9_arg2 )
		return Challenge.GetLocalizedChallengeDesc( f9_arg0, f9_arg1, f9_arg2 )
	end,
	GetChallengeCardTexture = function ( f10_arg0 )
		local f10_local0 = Engine.TableLookup( CSV.allChallengesTable.file, CSV.allChallengesTable.cols.ref, f10_arg0, CSV.allChallengesTable.cols.name )
		if f10_local0 == nil or f10_local0 == "" then
			f10_local0 = Engine.TableLookup( CSV.allChallengesTable.altFile, CSV.allChallengesTable.cols.ref, f10_arg0, CSV.allChallengesTable.cols.name )
		end
		return Engine.Localize( f10_local0 )
	end,
	GetCardChallengeTier = function ( f11_arg0, f11_arg1 )
		if f11_arg0 == nil or f11_arg0 == "" then
			return ""
		else
			local f11_local0 = CallingCardUtils.GetChallengeEntry( f11_arg0, f11_arg1 )
			return f11_local0.currentTierLabel
		end
	end,
	GetCardChallengeInfoAlpha = function ( f12_arg0, f12_arg1 )
		if f12_arg0 == nil or f12_arg0 == "" then
			return 0
		else
			return 1
		end
	end,
	GetCardChallengeCategoryRef = function ( f13_arg0, f13_arg1 )
		local f13_local0 = f13_arg0.categoryID:GetValue( f13_arg1 )
		if f13_local0 == nil or f13_local0 == "" then
			local f13_local1 = CallingCardUtils.GetCardChallengeSubCategoryRef( f13_arg0, f13_arg1 )
			f13_local0 = Engine.TableLookup( CSV.challengeSubCategories.file, CSV.challengeSubCategories.cols.ref, f13_local1, CSV.challengeSubCategories.cols.category )
			if f13_local0 == nil or f13_local0 == "" then
				f13_local0 = Engine.TableLookup( CSV.challengeSubCategories.altFile, CSV.challengeSubCategories.cols.ref, f13_local1, CSV.challengeSubCategories.cols.category )
			end
			local f13_local2 = Engine.TableLookup( CSV.challengeCategories.file, CSV.challengeCategories.cols.ref, f13_local0, CSV.challengeCategories.cols.localizeRef )
			if f13_local2 == nil or f13_local2 == "" then
				f13_local2 = Engine.TableLookup( CSV.challengeCategories.altFile, CSV.challengeCategories.cols.ref, f13_local0, CSV.challengeCategories.cols.localizeRef )
			end
			f13_arg0.category:SetValue( f13_arg1, Engine.Localize( f13_local2 ) )
		end
		return f13_local0
	end,
	GetCardChallengeCategoryRefByCardID = function ( f14_arg0, f14_arg1 )
		local f14_local0 = CallingCardUtils.GetCardCategoryID( f14_arg0 )
		if f14_local0 == nil or f14_local0 == "" then
			local f14_local1 = CallingCardUtils.GetCardChallengeSubCategoryRefByChallenge( CallingCardUtils.GetCardChallenge( f14_arg0 ), f14_arg1 )
			f14_local0 = Engine.TableLookup( CSV.challengeSubCategories.file, CSV.challengeSubCategories.cols.ref, f14_local1, CSV.challengeSubCategories.cols.category )
			if f14_local0 == nil or f14_local0 == "" then
				f14_local0 = Engine.TableLookup( CSV.challengeSubCategories.altFile, CSV.challengeSubCategories.cols.ref, f14_local1, CSV.challengeSubCategories.cols.category )
			end
		end
		return f14_local0
	end,
	GetCardChallengeSubCategoryRefByChallenge = function ( f15_arg0, f15_arg1 )
		if f15_arg0 == nil or f15_arg0 == "" then
			return nil
		end
		local f15_local0 = Engine.TableLookup( CSV.allChallengesTable.file, CSV.allChallengesTable.cols.ref, f15_arg0, CSV.allChallengesTable.cols.subCategory )
		if f15_local0 == nil or f15_local0 == "" then
			f15_local0 = Engine.TableLookup( CSV.allChallengesTable.altFile, CSV.allChallengesTable.cols.ref, f15_arg0, CSV.allChallengesTable.cols.subCategory )
		end
		return f15_local0
	end,
	GetCardChallengeSubCategoryRef = function ( f16_arg0, f16_arg1 )
		local f16_local0 = f16_arg0.challenge:GetValue( f16_arg1 )
		if f16_local0 == nil or f16_local0 == "" then
			return nil
		end
		local f16_local1 = Engine.TableLookup( CSV.allChallengesTable.file, CSV.allChallengesTable.cols.ref, f16_local0, CSV.allChallengesTable.cols.subCategory )
		if f16_local1 == nil or f16_local1 == "" then
			f16_local1 = Engine.TableLookup( CSV.allChallengesTable.altFile, CSV.allChallengesTable.cols.ref, f16_local0, CSV.allChallengesTable.cols.subCategory )
		end
		return f16_local1
	end,
	GetCardChallengeSubCategoryFromID = function ( f17_arg0, f17_arg1 )
		if f17_arg0 and f17_arg0 ~= "" then
			local f17_local0 = Engine.TableLookup( CSV.allChallengesTable.file, CSV.allChallengesTable.cols.ref, f17_arg0, CSV.allChallengesTable.cols.subCategory )
			if f17_local0 == nil or f17_local0 == "" then
				f17_local0 = Engine.TableLookup( CSV.allChallengesTable.altFile, CSV.allChallengesTable.cols.ref, f17_arg0, CSV.allChallengesTable.cols.subCategory )
			end
			return f17_local0
		else
			
		end
	end,
	GetCardChallengeCategoryFromID = function ( f18_arg0, f18_arg1, f18_arg2 )
		if f18_arg0 == nil or f18_arg0 == "" then
			local f18_local0 = CallingCardUtils.GetCardChallengeSubCategoryFromID( f18_arg1, f18_arg2 )
			f18_arg0 = Engine.TableLookup( CSV.challengeSubCategories.file, CSV.challengeSubCategories.cols.ref, f18_local0, CSV.challengeSubCategories.cols.category )
			if f18_arg0 == nil or f18_arg0 == "" then
				f18_arg0 = Engine.TableLookup( CSV.challengeSubCategories.altFile, CSV.challengeSubCategories.cols.ref, f18_local0, CSV.challengeSubCategories.cols.category )
			end
		end
		return f18_arg0
	end,
	GetCardChallengeCategoryStringFromID = function ( f19_arg0, f19_arg1, f19_arg2, f19_arg3 )
		if f19_arg1 == nil or f19_arg1 == "" then
			local f19_local0 = CallingCardUtils.GetCardChallengeSubCategoryFromID( f19_arg2, f19_arg3 )
			f19_arg1 = Engine.TableLookup( CSV.challengeSubCategories.file, CSV.challengeSubCategories.cols.ref, f19_local0, CSV.challengeSubCategories.cols.category )
			if f19_arg1 == nil or f19_arg1 == "" then
				f19_arg1 = Engine.TableLookup( CSV.challengeSubCategories.altFile, CSV.challengeSubCategories.cols.ref, f19_local0, CSV.challengeSubCategories.cols.category )
			end
			local f19_local1 = Engine.TableLookup( CSV.challengeCategories.file, CSV.challengeCategories.cols.ref, f19_arg1, CSV.challengeCategories.cols.localizeRef )
			if f19_local1 == nil or f19_local1 == "" then
				f19_local1 = Engine.TableLookup( CSV.challengeCategories.altFile, CSV.challengeCategories.cols.ref, f19_arg1, CSV.challengeCategories.cols.localizeRef )
			end
			return Engine.Localize( f19_local1 )
		else
			return CallingCardUtils.GetCardCategoryName( f19_arg0 )
		end
	end,
	BuildChallengeEntriesDataSources = function ( f20_arg0, f20_arg1, f20_arg2, f20_arg3 )
		local f20_local0, f20_local1 = CallingCardUtils.LoadChallengeEntries( f20_arg0, f20_arg2, f20_arg3 )
		local f20_local2 = {}
		local f20_local3 = function ( f21_arg0 )
			local f21_local0 = f21_arg0.ref
			local f21_local1 = f20_arg1 .. ".current." .. f21_local0
			local f21_local2 = f21_arg0.image
			if f21_local2 == nil or f21_local2 == "" then
				f21_local2 = CallingCardUtils.GetCardTexture( Engine.TableLookup( CSV.callingCards.file, CSV.callingCards.cols.challenge, f21_local0, CSV.callingCards.cols.index ) )
			end
			return {
				name = LUI.DataSourceInGlobalModel.new( f21_local1 .. ".name", f21_arg0.name ),
				desc = LUI.DataSourceInGlobalModel.new( f21_local1 .. ".desc", f21_arg0.desc ),
				image = LUI.DataSourceInGlobalModel.new( f21_local1 .. ".image", f21_local2 ),
				ref = LUI.DataSourceInGlobalModel.new( f21_local1 .. ".ref", f21_local0 ),
				tierCount = LUI.DataSourceInGlobalModel.new( f21_local1 .. ".tierCount", f21_arg0.tierCount ),
				isCompleted = LUI.DataSourceInGlobalModel.new( f21_local1 .. ".isCompleted", f21_arg0.isCompleted ),
				isCompletedAlpha = LUI.DataSourceInGlobalModel.new( f21_local1 .. ".isCompletedAlpha", f21_arg0.isCompleted and 1 or 0 ),
				currentTier = LUI.DataSourceInGlobalModel.new( f21_local1 .. ".currentTier", f21_arg0.currentTier ),
				currentTierLabel = LUI.DataSourceInGlobalModel.new( f21_local1 .. ".currentTierLabel", f21_arg0.currentTierLabel ),
				currentProgress = LUI.DataSourceInGlobalModel.new( f21_local1 .. ".currentProgress", f21_arg0.currentProgress ),
				currentProgressPercent = LUI.DataSourceInGlobalModel.new( f21_local1 .. ".currentProgressPercent", f21_arg0.currentProgressPercent ),
				currentTierMax = LUI.DataSourceInGlobalModel.new( f21_local1 .. ".currentTierMax", f21_arg0.currentTierMax ),
				currentTierXP = LUI.DataSourceInGlobalModel.new( f21_local1 .. ".currentTierXP", f21_arg0.currentTierXP ),
				currentTierScore = LUI.DataSourceInGlobalModel.new( f21_local1 .. ".currentTierScore", f21_arg0.currentTierScore ),
				isHiddenChallenge = LUI.DataSourceInGlobalModel.new( f21_local1 .. ".isHiddenChallenge", f21_arg0.isHiddenChallenge ),
				isSecretZombiesMerit = LUI.DataSourceInGlobalModel.new( f21_local1 .. ".isSecretZombiesMerit", f21_arg0.isSecretZombiesMerit )
			}
		end
		
		f20_local2.entries = LUI.DataSourceFromList.new( CountTableKeys( f20_local0 ) )
		f20_local2.entries:SetCachingEnabled( true )
		f20_local2.entries.MakeDataSourceAtIndex = function ( f22_arg0, f22_arg1, f22_arg2 )
			return f20_local3( f20_local0[f22_arg1] )
		end
		
		if f20_arg2 and f20_local1 ~= nil then
			f20_local2.masterChallenge = f20_local3( f20_local1 )
		end
		return f20_local2
	end,
	LoadChallengeEntries = function ( f23_arg0, f23_arg1, f23_arg2 )
		local f23_local0 = {}
		local f23_local1 = {
			CSV.allChallengesTable.file,
			CSV.allChallengesTable.altFile
		}
		local f23_local2 = 0
		local f23_local3 = nil
		for f23_local10, f23_local11 in ipairs( f23_local1 ) do
			for f23_local9 = 0, Engine.TableGetRowCount( f23_local11 ), 1 do
				local f23_local7 = Engine.TableLookupByRow( f23_local11, f23_local9, CSV.allChallengesTable.cols.ref )
				if f23_local7 ~= "" and Engine.TableLookupByRow( f23_local11, f23_local9, CSV.allChallengesTable.cols.subCategory ) == f23_arg0 then
					local f23_local8 = CallingCardUtils.GetChallengeEntry( f23_local7, f23_arg2, f23_local11 )
					if f23_local8.isMasterChallenge and f23_arg1 then
						f23_local3 = f23_local8
					else
						f23_local0[f23_local2] = f23_local8
						f23_local2 = f23_local2 + 1
					end
				end
			end
		end
		return f23_local0, f23_local3
	end,
	GetChallengeEntry = function ( f24_arg0, f24_arg1, f24_arg2, f24_arg3 )
		local f24_local0 = nil
		local f24_local1 = f24_arg2 or CSV.allChallengesTable.file
		local f24_local2
		if Engine.IsAliensMode() or f24_local1 ~= CSV.allChallengesTable.file then
			f24_local2 = Engine.IsAliensMode()
			if f24_local2 then
				if f24_local1 == CSV.allChallengesTable.file then
					f24_local2 = false
				else
					f24_local2 = true
				end
			end
		else
			f24_local2 = true
		end
		if f24_local2 then
			f24_local0 = Engine.GetPlayerDataEx( f24_arg1, CoD.StatsGroup.Ranked, "challengeState", f24_arg0 )
		else
			f24_local0 = Engine.GetPlayerDataEx( f24_arg1, CoD.StatsGroup.Coop, "meritState", f24_arg0 )
		end
		local f24_local3 = {
			name = Engine.TableLookup( f24_local1, CSV.allChallengesTable.cols.ref, f24_arg0, CSV.allChallengesTable.cols.name ),
			ref = f24_arg0
		}
		local f24_local4 = {}
		local f24_local5 = 0
		for f24_local6 = 0, CSV.allChallengesTable.maxTiers, 1 do
			local f24_local9 = Engine.TableLookup( f24_local1, CSV.allChallengesTable.cols.ref, f24_arg0, CSV.allChallengesTable.cols.tiers.targetStart + CSV.allChallengesTable.numTierCols * f24_local6 )
			local f24_local10 = Engine.TableLookup( f24_local1, CSV.allChallengesTable.cols.ref, f24_arg0, CSV.allChallengesTable.cols.tiers.xpStart + CSV.allChallengesTable.numTierCols * f24_local6 )
			local f24_local11 = Engine.TableLookup( f24_local1, CSV.allChallengesTable.cols.ref, f24_arg0, CSV.allChallengesTable.cols.tiers.scoreStart + CSV.allChallengesTable.numTierCols * f24_local6 )
			if f24_local9 and f24_local10 and f24_local11 and f24_local9 ~= "" and f24_local10 ~= "" and f24_local11 ~= "" then
			
			else
				f24_local5 = f24_local6
				break
			end
			f24_local4[f24_local6] = {}
			f24_local4[f24_local6].target = f24_local9
			f24_local4[f24_local6].xp = f24_local10
			f24_local4[f24_local6].score = f24_local11
		end
		assert( f24_local5 > 0, "Failed to get challenge data for " .. f24_arg0 )
		local f24_local6 = f24_local5 <= f24_local0
		local f24_local7 = nil
		if f24_arg3 and f24_local4[f24_arg3] then
			f24_local7 = f24_arg3
		else
			if f24_local6 then
				local f24_local12 = f24_local5 - 1
			end
			f24_local7 = f24_local12 or f24_local0
		end
		local f24_local8 = f24_local4[f24_local7]
		f24_local3.isUnlocked = Engine.IsUnlocked( f24_arg1, "challenge", f24_arg0 )
		f24_local3.image = Engine.TableLookup( CSV.callingCards.file, CSV.callingCards.cols.challenge, f24_arg0, CSV.callingCards.cols.texture )
		f24_local3.tierCount = f24_local5
		local f24_local13
		if f24_local6 then
			f24_local13 = f24_local5 - 1
			if not f24_local13 then
			
			else
				f24_local3.currentTier = f24_local13
				f24_local3.isCompleted = f24_local6
				f24_local3.currentTierLabel = Engine.Localize( "LUA_MENU_MP_CHALLENGE_TIER_LABEL", tostring( f24_local3.currentTier + 1 ), tostring( f24_local5 ) )
				f24_local3.currentTierMax = f24_local8.target
				if f24_local2 then
					if f24_local6 then
						f24_local13 = f24_local3.currentTierMax
						if not f24_local13 then
						
						else
							f24_local3.currentProgress = f24_local13
						end
					end
					f24_local13 = Engine.GetPlayerDataEx( f24_arg1, CoD.StatsGroup.Ranked, "challengeProgress", f24_arg0 )
				else
					if f24_local6 then
						f24_local13 = f24_local3.currentTierMax
						if not f24_local13 then
						
						else
							f24_local3.currentProgress = f24_local13
						end
					end
					f24_local13 = Engine.GetPlayerDataEx( f24_arg1, CoD.StatsGroup.Coop, "meritProgress", f24_arg0 )
				end
				if f24_local6 then
					f24_local13 = 1
					if not f24_local13 then
					
					else
						f24_local3.currentProgressPercent = f24_local13
						f24_local3.currentTierXP = f24_local8.xp
						f24_local3.currentTierScore = f24_local8.score
						f24_local13 = Engine.TableLookup( f24_local1, CSV.allChallengesTable.cols.ref, f24_arg0, CSV.allChallengesTable.cols.paramScale )
						if f24_local13 and f24_local13 ~= "" then
							f24_local13 = tonumber( f24_local13 )
							f24_local3.currentTierMax = math.floor( f24_local3.currentTierMax / f24_local13 )
							f24_local3.currentProgress = math.floor( f24_local3.currentProgress / f24_local13 )
						end
						if f24_local3.isUnlocked then
							f24_local3.desc = CallingCardUtils.GetCardChallengeDesc( f24_arg0, f24_local3.currentTierMax, f24_local1 )
						else
							f24_local3.desc = Cac.GetUnlockText( CSV.challengeUnlockTable, f24_arg0 )
						end
						f24_local3.isMasterChallenge = CallingCardUtils.GetCardIsMasterCard( Engine.TableLookup( CSV.callingCards.file, CSV.callingCards.cols.challenge, f24_arg0, CSV.callingCards.cols.index ) ) == "TRUE"
						f24_local3.isHiddenChallenge = false
						f24_local3.isSecretZombiesMerit = false
						local f24_local10 = Engine.TableLookup( f24_local1, CSV.allChallengesTable.cols.ref, f24_arg0, CSV.allChallengesTable.cols.subCategory )
						if not f24_local6 and (f24_local10 == "darkops" or f24_local10 == "secret" or f24_local10 == "dc") then
							f24_local3.tierCount = 1
							f24_local3.currentTier = 0
							f24_local3.currentTierMax = 1
							f24_local3.currentProgress = 0
							f24_local3.currentProgressPercent = 0
							if f24_local10 ~= "dc" then
								f24_local3.currentTierLabel = Engine.Localize( "LUA_MENU_MP_CHALLENGE_TIER_LABEL", 1, "?" )
								f24_local3.name = "LUA_MENU_MP_HIDDEN_UNLOCK_CRITERIA"
								f24_local3.desc = Engine.Localize( "LUA_MENU_MP_HIDDEN_UNLOCK_CRITERIA" )
								f24_local3.currentTierXP = "???"
								f24_local3.currentTierScore = "???"
							end
							f24_local3.image = "widg_disabled"
							f24_local3.isHiddenChallenge = true
							if f24_local10 == "secret" or f24_local10 == "dc" then
								f24_local3.isSecretZombiesMerit = true
							end
						end
						return f24_local3
					end
				end
				f24_local13 = f24_local3.currentProgress / f24_local3.currentTierMax
			end
		end
		f24_local13 = f24_local0
	end,
	GetChallengeSubcatName = function ( f25_arg0 )
		local f25_local0 = Engine.TableLookup( CSV.challengeSubCategories.file, CSV.challengeSubCategories.cols.ref, f25_arg0, CSV.challengeSubCategories.cols.localizeRef )
		if f25_local0 == nil or f25_local0 == "" then
			f25_local0 = Engine.TableLookup( CSV.challengeSubCategories.altFile, CSV.challengeSubCategories.cols.ref, f25_arg0, CSV.challengeSubCategories.cols.localizeRef )
		end
		assert( f25_local0 )
		return Engine.Localize( f25_local0 )
	end,
	GetCardIsShippable = function ( f26_arg0 )
		return Engine.TableLookup( CSV.callingCards.file, CSV.callingCards.cols.index, f26_arg0, CSV.callingCards.cols.isShippable )
	end,
	GetCardHideIfLocked = function ( f27_arg0 )
		return Engine.TableLookup( CSV.callingCards.file, CSV.callingCards.cols.index, f27_arg0, CSV.callingCards.cols.hideIfLocked ) == "1"
	end,
	HasAnyNewLootCards = function ( f28_arg0 )
		local f28_local0 = Engine.TableGetRowCount( CSV.callingCards.file )
		for f28_local1 = 0, f28_local0, 1 do
			local f28_local4 = Engine.TableLookupByRow( CSV.callingCards.file, f28_local1, CSV.callingCards.cols.lootID )
			if f28_local4 and f28_local4 ~= "" and Loot.IsNew( f28_arg0, tonumber( f28_local4 ) ) then
				return true
			end
		end
		return false
	end,
	HasNewLootCardsByCategory = function ( f29_arg0, f29_arg1 )
		local f29_local0 = Engine.TableGetRowCount( CSV.callingCards.file )
		for f29_local1 = 0, f29_local0, 1 do
			if Engine.TableLookupByRow( CSV.callingCards.file, f29_local1, CSV.callingCards.cols.categoryID ) == f29_arg1 then
				local f29_local4 = Engine.TableLookupByRow( CSV.callingCards.file, f29_local1, CSV.callingCards.cols.lootID )
				if f29_local4 and f29_local4 ~= "" and Loot.IsNew( f29_arg0, tonumber( f29_local4 ) ) then
					return true
				end
			end
		end
		return false
	end,
	SetupCallingCardSelectionButtonHandlers = function ( f30_arg0, f30_arg1 )
		f30_arg0:addEventHandler( "button_action", function ( f31_arg0, f31_arg1 )
			local f31_local0 = f31_arg1.controller
			assert( f31_local0 )
			local f31_local1 = f30_arg0:GetDataSource()
			if f31_local1 and f31_local1.challengeInfo.isCompleted:GetValue( f31_local0 ) then
				Playercard.SetPlayercardBackground( f31_local0, f31_local1.index:GetValue( f31_local0 ) )
				Playercard.SaveChanges( f31_local0 )
			end
		end )
		f30_arg0:addEventHandler( "button_up", function ( f32_arg0, f32_arg1 )
			local f32_local0 = f32_arg1.controller or f30_arg1
			local f32_local1 = f30_arg0:GetDataSource()
			if f32_local1 then
				local f32_local2 = f32_local1.challengeInfo.isCompleted:GetValue( f32_local0 )
				local f32_local3 = f32_local1.challengeInfo.isSecretZombiesMerit:GetValue( f32_local0 )
				if f32_local2 then
					ACTIONS.AnimateSequence( f30_arg0, "ButtonUp" )
				elseif f32_local3 and Engine.IsCoreMode() then
					ACTIONS.AnimateSequence( f30_arg0, "ButtonUpDisabledCP" )
				else
					ACTIONS.AnimateSequence( f30_arg0, "ButtonUpDisabled" )
				end
			end
			if f30_arg0.newItemRow then
				Rewards.ClearNew( f32_local0, "callingCard", f30_arg0.newItemRow )
				f30_arg0.NewIcon:SetAlpha( 0, 0.2 )
				f30_arg0.newItemRow = nil
				f30_arg0:dispatchEventToCurrentMenu( {
					name = "update_progression_item_new"
				} )
			end
			if f30_arg0.newItemLootID then
				Loot.ClearNew( f32_local0, f30_arg0.newItemLootID )
				f30_arg0.NewIcon:SetAlpha( 0, 0.2 )
				f30_arg0.newItemLootID = nil
				f30_arg0:dispatchEventToCurrentMenu( {
					name = "update_loot_item_new"
				} )
			end
		end )
		f30_arg0:SubscribeToModelThroughElement( f30_arg0, "challengeInfo.tierCount", function ()
			local f33_local0 = f30_arg0:GetDataSource()
			if f33_local0.challengeInfo.tierCount:GetValue( f30_arg1 ) ~= nil then
				f30_arg0.ProgressBar:SetAlpha( 1, 0 )
			end
		end )
		f30_arg0:SubscribeToModelThroughElement( f30_arg0, "categoryID", function ()
			local f34_local0 = f30_arg0:GetDataSource()
			local f34_local1 = false
			local f34_local2 = f34_local0.categoryID:GetValue( f30_arg1 )
			if f34_local0.challengeInfo.isSecretZombiesMerit then
				f34_local1 = f34_local0.challengeInfo.isSecretZombiesMerit:GetValue( f30_arg1 )
			end
			if f34_local1 then
				f30_arg0.CallingCardTexture:SetAlpha( 0 )
			else
				f30_arg0.CallingCardTexture:SetAlpha( 1 )
			end
		end )
		f30_arg0:SubscribeToModelThroughElement( f30_arg0, "quality", function ()
			assert( f30_arg0.QualityIcon )
			local f35_local0 = f30_arg0:GetDataSource()
			if f35_local0 then
				local f35_local1 = Cac.LowestQuality
				if f35_local0.challengeInfo.isCompleted:GetValue( f30_arg1 ) then
					f35_local1 = f35_local0.quality:GetValue( f30_arg1 )
				end
				f30_arg0.QualityIcon:SetDisplayQuality( f35_local1 )
			end
		end )
		f30_arg0:SubscribeToDataSourceThroughElement( f30_arg0, nil, function ()
			local f36_local0 = f30_arg0:GetDataSource()
			assert( f36_local0 )
			f30_arg0.newItemRow = nil
			f30_arg0.newItemLootID = nil
			local f36_local1 = false
			local f36_local2 = Engine.TableLookup( CSV.callingCards.file, CSV.callingCards.cols.index, f36_local0.index:GetValue( f30_arg1 ), CSV.callingCards.cols.unlockID )
			if f36_local2 and f36_local2 ~= "" then
				local f36_local3 = Engine.TableLookupGetRowNum( CSV.callingCardUnlockTable.file, CSV.callingCardUnlockTable.cols.ref, f36_local2 )
				if f36_local3 ~= -1 and Rewards.IsNew( f30_arg1, "callingCard", f36_local3 ) then
					f30_arg0.newItemRow = f36_local3
					f36_local1 = true
				end
			end
			if not f36_local1 then
				local f36_local3 = Engine.TableLookup( CSV.callingCards.file, CSV.callingCards.cols.index, f36_local0.index:GetValue( f30_arg1 ), CSV.callingCards.cols.lootID )
				if f36_local3 and f36_local3 ~= "" and Loot.IsNew( f30_arg1, f36_local3 ) then
					f30_arg0.newItemLootID = f36_local3
					f36_local1 = true
				end
			end
			if f36_local1 then
				f30_arg0.NewIcon:SetAlpha( 1, 0 )
			else
				f30_arg0.NewIcon:SetAlpha( 0, 0 )
			end
		end )
	end
}
