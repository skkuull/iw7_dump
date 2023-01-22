function LocalizeString( f1_arg0 )
	return Engine.Localize( f1_arg0 )
end

function LocalizeLongString( f2_arg0 )
	return Engine.LocalizeLong( f2_arg0 )
end

function LocalizeIntoString( f3_arg0, f3_arg1 )
	return Engine.Localize( f3_arg1, f3_arg0 )
end

function ToString( f4_arg0 )
	return tostring( f4_arg0 )
end

function MarkLocalized( f5_arg0 )
	return Engine.MarkLocalized( f5_arg0 )
end

function AddPercentSymbol( f6_arg0 )
	return f6_arg0 .. "%"
end

function Add( f7_arg0, f7_arg1 )
	return f7_arg0 + f7_arg1
end

function Subtract( f8_arg0, f8_arg1 )
	return f8_arg0 - f8_arg1
end

function Divide( f9_arg0, f9_arg1 )
	assert( f9_arg1 ~= 0 )
	return f9_arg0 / f9_arg1
end

function Multiply( f10_arg0, f10_arg1 )
	return f10_arg0 * f10_arg1
end

function Clamp( f11_arg0, f11_arg1, f11_arg2 )
	return LUI.clamp( f11_arg0, f11_arg1, f11_arg2 )
end

function Mirror( f12_arg0, f12_arg1, f12_arg2 )
	return f12_arg1 + f12_arg2 - f12_arg0
end

function MillisecondsToCountdownString( f13_arg0 )
	return Engine.FormatDuration( tonumber( f13_arg0 ) )
end

function ToUpperCase( f14_arg0 )
	return Engine.ToUpperCase( f14_arg0 )
end

function Not( f15_arg0 )
	return not f15_arg0
end

function Lerp( f16_arg0, f16_arg1, f16_arg2 )
	return LUI.Lerp( f16_arg1, f16_arg2, f16_arg0 )
end

function GetWeaponUnlockText( f17_arg0 )
	if Engine.IsAliensMode() then
		return Cac.GetUnlockText( CSV.zomWeaponUnlockTable, f17_arg0 )
	else
		return Cac.GetUnlockText( CSV.weaponUnlockTable, f17_arg0 )
	end
end

function GetDeckSlotUnlockText( f18_arg0 )
	return Cac.GetUnlockText( CSV.fateDeckSizeUnlockTable, f18_arg0 )
end

function GetCardUnlockText( f19_arg0 )
	return Cac.GetUnlockText( CSV.cardUnlockTable, f19_arg0 )
end

function GetPowerUnlockText( f20_arg0 )
	if Engine.IsSingleplayer() then
		return Engine.Localize( Engine.TableLookup( CSV.powers.file, CSV.powers.cols.ref, f20_arg0, CSV.powers.cols.unlockDescText ) )
	else
		return Cac.GetUnlockText( CSV.powerUnlockTable, f20_arg0 )
	end
end

function GetPerkUnlockText( f21_arg0 )
	return Cac.GetUnlockText( CSV.perkUnlockTable, f21_arg0 )
end

function GetRigUnlockText( f22_arg0 )
	return Cac.GetUnlockText( CSV.rigUnlockTable, f22_arg0 )
end

function GetSuperUnlockText( f23_arg0 )
	return Cac.GetUnlockText( CSV.rigSuperUnlockTable, f23_arg0 )
end

function GetTraitUnlockText( f24_arg0 )
	return Cac.GetUnlockText( CSV.rigTraitUnlockTable, f24_arg0 )
end

function GetStreakUnlockText( f25_arg0 )
	return Cac.GetUnlockText( CSV.streakUnlockTable, f25_arg0 )
end

function GetPick10UnlockText( f26_arg0 )
	return Cac.GetUnlockText( CSV.pick10UnlockTable, f26_arg0 )
end

function GetLoadoutUnlockText( f27_arg0 )
	return Cac.GetUnlockText( CSV.loadoutUnlockTable, "loadoutslot" .. f27_arg0 )
end

function GetChallengeUnlockText( f28_arg0 )
	return Cac.GetUnlockText( CSV.challengeUnlockTable, f28_arg0 )
end

function SubtractForSplitscreen( f29_arg0, f29_arg1 )
	return CONDITIONS.IsSplitscreen() and f29_arg0 - f29_arg1 or f29_arg0
end

