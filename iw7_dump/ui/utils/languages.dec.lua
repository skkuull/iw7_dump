local f0_local0 = {
	[0] = "LANGUAGE_ENGLISH"
}
local f0_local1 = "LANGUAGE_ENGLISH_SAFE"
local f0_local2 = "LANGUAGE_FRENCH"
local f0_local3 = "LANGUAGE_GERMAN"
local f0_local4 = "LANGUAGE_ITALIAN"
local f0_local5 = "LANGUAGE_SPANISH"
local f0_local6 = "LANGUAGE_RUSSIAN_FULL"
local f0_local7 = "LANGUAGE_RUSSIAN_PARTIAL"
local f0_local8 = "LANGUAGE_POLISH_FULL"
local f0_local9 = "LANGUAGE_POLISH_PARTIAL"
local f0_local10 = "LANGUAGE_KOREAN"
local f0_local11 = "LANGUAGE_JAPANESE_FULL"
local f0_local12 = "LANGUAGE_JAPANESE_PARTIAL"
local f0_local13 = "LANGUAGE_SIMPLIFIED_CHINESE"
local f0_local14 = "LANGUAGE_TRADITIONAL_CHINESE"
local f0_local15 = "LANGUAGE_ARABIC"
local f0_local16 = "LANGUAGE_CZECH"
local f0_local17 = "LANGUAGE_SPANISHNA"
local f0_local18 = "LANGUAGE_PORTUGUESE"
local f0_local19 = "MAX_LANGUAGES"
f0_local0[1] = f0_local1
f0_local0[2] = f0_local2
f0_local0[3] = f0_local3
f0_local0[4] = f0_local4
f0_local0[5] = f0_local5
f0_local0[6] = f0_local6
f0_local0[7] = f0_local7
f0_local0[8] = f0_local8
f0_local0[9] = f0_local9
f0_local0[10] = f0_local10
f0_local0[11] = f0_local11
f0_local0[12] = f0_local12
f0_local0[13] = f0_local13
f0_local0[14] = f0_local14
f0_local0[15] = f0_local15
f0_local0[16] = f0_local16
f0_local0[17] = f0_local17
f0_local0[18] = f0_local18
f0_local0[19] = f0_local19
Languages = f0_local0
LanguageInfo = {
	LANGUAGE_ENGLISH = {
		name = "LANGUAGE_SELECT_ENGLISH"
	},
	LANGUAGE_ENGLISH_SAFE = {
		name = "LANGUAGE_SELECT_ENGLISH"
	},
	LANGUAGE_FRENCH = {
		name = "LANGUAGE_SELECT_FRENCH"
	},
	LANGUAGE_GERMAN = {
		name = "LANGUAGE_SELECT_GERMAN"
	},
	LANGUAGE_ITALIAN = {
		name = "LANGUAGE_SELECT_ITALIAN"
	},
	LANGUAGE_SPANISH = {
		name = "LANGUAGE_SELECT_SPANISH"
	},
	LANGUAGE_RUSSIAN_FULL = {
		name = "LANGUAGE_SELECT_RUSSIAN"
	},
	LANGUAGE_RUSSIAN_PARTIAL = {
		name = "LANGUAGE_SELECT_PARTIAL"
	},
	LANGUAGE_POLISH_FULL = {
		name = "LANGUAGE_SELECT_POLISH"
	},
	LANGUAGE_POLISH_PARTIAL = {
		name = "LANGUAGE_SELECT_PARTIAL"
	},
	LANGUAGE_KOREAN = {
		name = "LANGUAGE_SELECT_KOREAN"
	},
	LANGUAGE_JAPANESE_FULL = {
		name = "LANGUAGE_SELECT_JAPANESE"
	},
	LANGUAGE_JAPANESE_PARTIAL = {
		name = "LANGUAGE_SELECT_PARTIAL"
	},
	LANGUAGE_SIMPLIFIED_CHINESE = {
		name = "LANGUAGE_SELECT_SIMPLIFIED_CHINESE"
	},
	LANGUAGE_TRADITIONAL_CHINESE = {
		name = "LANGUAGE_SELECT_TRADITIONAL_CHINESE"
	},
	LANGUAGE_ARABIC = {
		name = "LANGUAGE_SELECT_ARABIC"
	},
	LANGUAGE_SPANISHNA = {
		name = "LANGUAGE_SELECT_SPANISHNA"
	},
	LANGUAGE_PORTUGUESE = {
		name = "LANGUAGE_SELECT_PORTUGUESE"
	}
}
PS4Region = {
	PS4_REGION_SCEA_EN_FR = 0,
	PS4_REGION_SIEA_EN_ES = 1,
	PS4_REGION_SIEA_EN_PT = 2,
	PS4_REGION_SIEE_EN_FR = 3,
	PS4_REGION_SIEE_EN_DE = 4,
	PS4_REGION_SIEE_ES_IT = 5,
	PS4_REGION_SIEE_RU = 6,
	PS4_REGION_SIEE_PL = 7,
	PS4_REGION_SIEE_EN_AR = 8,
	PS4_REGION_SIEJ_JP = 9,
	PS4_REGION_SIEK_EN_KO = 10
}
function GetCurrentLanguage()
	local f1_local0 = Languages[Engine.GetCurrentLanguage()]
	assert( f1_local0 )
	return f1_local0
end

function GetLanguageDisplayName( f2_arg0 )
	local f2_local0 = Languages[f2_arg0]
	assert( f2_local0 )
	return LanguageInfo[f2_local0].name
end

function GetLanguageCode( f3_arg0 )
	for f3_local0 = 0, #Languages, 1 do
		if Languages[f3_local0] == f3_arg0 then
			return f3_local0
		end
	end
end

function IsLanguageEnglish()
	local f4_local0 = GetCurrentLanguage()
	local f4_local1
	if f4_local0 ~= "LANGUAGE_ENGLISH" and f4_local0 ~= "LANGUAGE_ENGLISH_SAFE" then
		f4_local1 = false
	else
		f4_local1 = true
	end
	return f4_local1
end

function IsLanguageRightToLeft( f5_arg0 )
	return f5_arg0 == "LANGUAGE_ARABIC"
end

function IsLanguagePolish()
	local f6_local0 = GetCurrentLanguage()
	local f6_local1
	if f6_local0 ~= "LANGUAGE_POLISH_FULL" and f6_local0 ~= "LANGUAGE_POLISH_PARTIAL" then
		f6_local1 = false
	else
		f6_local1 = true
	end
	return f6_local1
end

function IsLanguageJapanese()
	local f7_local0 = GetCurrentLanguage()
	local f7_local1
	if f7_local0 ~= "LANGUAGE_JAPANESE_FULL" and f7_local0 ~= "LANGUAGE_JAPANESE_PARTIAL" then
		f7_local1 = false
	else
		f7_local1 = true
	end
	return f7_local1
end

function IsLanguageChinese()
	local f8_local0 = GetCurrentLanguage()
	local f8_local1
	if f8_local0 ~= "LANGUAGE_SIMPLIFIED_CHINESE" and f8_local0 ~= "LANGUAGE_TRADITIONAL_CHINESE" then
		f8_local1 = false
	else
		f8_local1 = true
	end
	return f8_local1
end

function IsLanguageArabic()
	return GetCurrentLanguage() == "LANGUAGE_ARABIC"
end

function IsLanguageRussian()
	local f10_local0 = GetCurrentLanguage()
	local f10_local1
	if f10_local0 ~= "LANGUAGE_RUSSIAN_FULL" and f10_local0 ~= "LANGUAGE_RUSSIAN_PARTIAL" then
		f10_local1 = false
	else
		f10_local1 = true
	end
	return f10_local1
end

function IsLanguageGerman()
	return GetCurrentLanguage() == "LANGUAGE_GERMAN"
end

function IsLanguageKorean()
	return GetCurrentLanguage() == "LANGUAGE_KOREAN"
end

function IsLanguageItalian()
	return GetCurrentLanguage() == "LANGUAGE_ITALIAN"
end

function IsLanguageOversizedFont()
	local f14_local0 = IsLanguageChinese()
	if not f14_local0 then
		f14_local0 = IsLanguageJapanese()
		if not f14_local0 then
			f14_local0 = IsLanguageRussian()
		end
	end
	return f14_local0
end

function IsLanguageSubtitleOnByDefault()
	return not IsLanguageEnglish()
end

function IsLanguageNonLocalizeAudio()
	local f16_local0 = GetCurrentLanguage()
	local f16_local1 = IsLanguageArabic()
	if not f16_local1 then
		f16_local1 = IsLanguageChinese()
		if not f16_local1 then
			if f16_local0 ~= "LANGUAGE_KOREAN" and f16_local0 ~= "LANGUAGE_JAPANESE_PARTIAL" then
				f16_local1 = false
			else
				f16_local1 = true
			end
		end
	end
	return f16_local1
end

function IsArabicSKU()
	local f17_local0 = GetCurrentLanguage()
	local f17_local1
	if f17_local0 ~= "LANGUAGE_ARABIC" and f17_local0 ~= "LANGUAGE_ENGLISH_SAFE" then
		f17_local1 = false
	else
		f17_local1 = true
	end
	return f17_local1
end

function IsEuropeSKU()
	assert( Engine.IsPS4() )
	if not Engine.IsPS4() then
		return false
	end
	local f18_local0 = Commerce.GetPS4Region()
	local f18_local1
	if f18_local0 ~= PS4Region.PS4_REGION_SIEE_EN_FR and f18_local0 ~= PS4Region.PS4_REGION_SIEE_EN_DE and f18_local0 ~= PS4Region.PS4_REGION_SIEE_ES_IT and f18_local0 ~= PS4Region.PS4_REGION_SIEE_RU and f18_local0 ~= PS4Region.PS4_REGION_SIEE_PL and f18_local0 ~= PS4Region.PS4_REGION_SIEE_EN_AR then
		f18_local1 = false
	else
		f18_local1 = true
	end
	return f18_local1
end

function IsAmericaSKU()
	assert( Engine.IsPS4() )
	if not Engine.IsPS4() then
		return false
	end
	local f19_local0 = Commerce.GetPS4Region()
	local f19_local1
	if f19_local0 ~= PS4Region.PS4_REGION_SCEA_EN_FR and f19_local0 ~= PS4Region.PS4_REGION_SIEA_EN_ES and f19_local0 ~= PS4Region.PS4_REGION_SIEA_EN_PT then
		f19_local1 = false
	else
		f19_local1 = true
	end
	return f19_local1
end

