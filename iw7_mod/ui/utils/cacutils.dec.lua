Cac = {
	GetPrestigeLevel = function ( f1_arg0 )
		if Engine.IsAliensMode() then
			return DataSources.alwaysLoaded.CP.ranked.progression.prestige:GetValue( f1_arg0 )
		else
			return DataSources.alwaysLoaded.MP.ranked.progression.prestige:GetValue( f1_arg0 )
		end
	end,
	ValidateAllPlayersPrivateSquadMembers = function ()
		
	end,
	ValidateAllPlayersPublicSquadMembers = function ()
		
	end,
	GetUnlockText = function ( f4_arg0, f4_arg1 )
		if f4_arg0.cols.ui_text == nil or f4_arg0.cols.ui_text_var1 == nil or f4_arg0.cols.ui_text_var2 == nil or f4_arg0.file == nil or f4_arg0.cols.ref == nil then
			DebugPrint( "WARNING: Attempting to get unlock text with an invalid unlockTable or ref." )
			return ""
		else
			local f4_local0 = f4_arg0.file
			if CONDITIONS.UseLoadoutRestrictions() and f4_arg0.esportsRef and not Engine.IsUnlocked( Engine.GetFirstActiveController(), f4_arg0.esportsRef, f4_arg1, true ) then
				return Engine.Localize( "MP_FRONTEND_ONLY_NOT_AVAILABLE_IN_CWL" )
			else
				local f4_local1 = Engine.TableLookup( f4_local0, f4_arg0.cols.ref, f4_arg1, f4_arg0.cols.ui_text )
				local f4_local2 = Engine.TableLookup( f4_local0, f4_arg0.cols.ref, f4_arg1, f4_arg0.cols.ui_text_var1 )
				local f4_local3 = Engine.TableLookup( f4_local0, f4_arg0.cols.ref, f4_arg1, f4_arg0.cols.ui_text_var2 )
				if f4_local1 ~= "" then
					return Engine.Localize( f4_local1, f4_local2, f4_local3 )
				else
					return ""
				end
			end
		end
	end
}
function ComputeMatchRulesDefaultClassesSlot( f5_arg0, f5_arg1 )
	if f5_arg0 == "axis" then
		return f5_arg1 + 6
	else
		return f5_arg1
	end
end

function ComputeScoreboardSlot( f6_arg0, f6_arg1 )
	if f6_arg0 == "none" then
		return 0 + f6_arg1
	elseif f6_arg0 == "neutral" then
		return 24 + f6_arg1
	elseif f6_arg0 == "allies" then
		return 48 + f6_arg1
	elseif f6_arg0 == "axis" then
		return 72 + f6_arg1
	elseif f6_arg0 == "multiteam" then
		return 96 + f6_arg1
	else
		return 0
	end
end

Cac.GetCosmeticAttachmentName = function ( f7_arg0 )
	return Engine.TableLookup( CSV.cosmeticAttachmentTable.file, CSV.cosmeticAttachmentTable.cols.ref, f7_arg0, CSV.cosmeticAttachmentTable.cols.name )
end

Cac.GetCosmeticAttachmentUnlockType = function ( f8_arg0 )
	return Engine.TableLookup( CSV.cosmeticAttachmentTable.file, CSV.cosmeticAttachmentTable.cols.ref, f8_arg0, CSV.cosmeticAttachmentTable.cols.unlockType )
end

Cac.GetCosmeticAttachmentIcon = function ( f9_arg0 )
	return Engine.TableLookup( CSV.cosmeticAttachmentTable.file, CSV.cosmeticAttachmentTable.cols.ref, f9_arg0, CSV.cosmeticAttachmentTable.cols.icon )
end

Cac.GetCosmeticAttachmentCategory = function ( f10_arg0 )
	return Engine.TableLookup( CSV.cosmeticAttachmentTable.file, CSV.cosmeticAttachmentTable.cols.ref, f10_arg0, CSV.cosmeticAttachmentTable.cols.category )
end

