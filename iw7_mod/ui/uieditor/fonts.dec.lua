local f0_local0 = GetCurrentLanguage()
local f0_local1
if f0_local0 ~= "LANGUAGE_JAPANESE_FULL" and f0_local0 ~= "LANGUAGE_JAPANESE_PARTIAL" then
	f0_local1 = false
else
	f0_local1 = true
end
local f0_local2 = f0_local0 == "LANGUAGE_SIMPLIFIED_CHINESE"
local f0_local3 = f0_local0 == "LANGUAGE_TRADITIONAL_CHINESE"
local f0_local4 = f0_local0 == "LANGUAGE_ARABIC"
local f0_local5 = f0_local0 == "LANGUAGE_KOREAN"
local f0_local6
if f0_local0 ~= "LANGUAGE_POLISH_FULL" and f0_local0 ~= "LANGUAGE_POLISH_PARTIAL" then
	f0_local6 = false
else
	f0_local6 = true
end
local f0_local7
if f0_local0 ~= "LANGUAGE_RUSSIAN_FULL" and f0_local0 ~= "LANGUAGE_RUSSIAN_PARTIAL" then
	f0_local7 = false
else
	f0_local7 = true
end
FONTS = {
	MainCondensed = {
		File = "fonts/blender_pro_book.ttf"
	},
	MainMedium = {
		File = "fonts/blender_pro_medium.ttf"
	},
	MainExtended = {
		File = "fonts/blender_pro_heavy.ttf"
	},
	MainBold = {
		File = "fonts/blender_pro_bold.ttf"
	},
	Dev = {
		File = "fonts/fira_mono_regular.ttf"
	},
	Digital = {
		File = "fonts/iw6_digital.ttf"
	},
	ZmClean = {
		File = "fonts/zm_clean.otf"
	},
	EquipmentFont = {
		File = "fonts/ChangelingNeo-Regular.ttf"
	}
}
if f0_local1 then
	FONTS.MainCondensed.File = "fonts/n019043jap.ttf"
	FONTS.MainMedium.File = "fonts/n019043jap.ttf"
	FONTS.MainExtended.File = "fonts/n019043jap.ttf"
	FONTS.MainBold.File = "fonts/n019043jap.ttf"
	FONTS.ZmClean.File = "fonts/n019043jap.ttf"
elseif f0_local2 then
	FONTS.MainCondensed.File = "fonts/n019043chs.ttf"
	FONTS.MainMedium.File = "fonts/n019043chs.ttf"
	FONTS.MainExtended.File = "fonts/n019043chs.ttf"
	FONTS.MainBold.File = "fonts/n019043chs.ttf"
	FONTS.ZmClean.File = "fonts/n019043chs.ttf"
elseif f0_local3 then
	FONTS.MainCondensed.File = "fonts/n019043cht.ttf"
	FONTS.MainMedium.File = "fonts/n019043cht.ttf"
	FONTS.MainExtended.File = "fonts/n019043cht.ttf"
	FONTS.MainBold.File = "fonts/n019043cht.ttf"
	FONTS.ZmClean.File = "fonts/n019043cht.ttf"
elseif f0_local4 then
	FONTS.MainCondensed.File = "fonts/FrutigerLTArabic.ttf"
	FONTS.MainMedium.File = "fonts/FrutigerLTArabic.ttf"
	FONTS.MainExtended.File = "fonts/FrutigerLTArabic.ttf"
	FONTS.MainBold.File = "fonts/FrutigerLTArabic.ttf"
	FONTS.ZmClean.File = "fonts/FrutigerLTArabic.ttf"
elseif f0_local5 then
	FONTS.MainCondensed.File = "fonts/n019003h.ttf"
	FONTS.MainMedium.File = "fonts/n019003h.ttf"
	FONTS.MainExtended.File = "fonts/n019003h.ttf"
	FONTS.MainBold.File = "fonts/n019003h.ttf"
	FONTS.ZmClean.File = "fonts/n019003h.ttf"
elseif f0_local6 then
	FONTS.ZmClean.File = "fonts/CCDuskTillDawnRisenCYR.otf"
elseif f0_local7 then
	FONTS.ZmClean.File = "fonts/CCDuskTillDawnRisenCYR.otf"
end
function PreCacheGlyphs()
	local f1_local0 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz 0123456789[]_-/*+?!.,;:{}'\""
	local f1_local1 = FONTS.GetFont( FONTS.MainBold.File )
	local f1_local2 = FONTS.GetFont( FONTS.MainCondensed.File )
	local f1_local3 = FONTS.GetFont( FONTS.MainExtended.File )
	local f1_local4 = FONTS.GetFont( FONTS.MainMedium.File )
	local f1_local5 = FONTS.GetFont( FONTS.EquipmentFont.File )
	local f1_local6 = FONTS.GetFont( FONTS.Digital.File )
	local f1_local7 = {}
	if not Engine.InFrontend() then
		if Engine.IsSingleplayer() then
			f1_local7 = {
				{
					font = f1_local2,
					size = 24 * _1080p
				},
				{
					font = f1_local2,
					size = 30 * _1080p
				},
				{
					font = f1_local2,
					size = 64 * _1080p
				},
				{
					font = f1_local1,
					size = 12 * _1080p
				},
				{
					font = f1_local1,
					size = 18 * _1080p
				},
				{
					font = f1_local1,
					size = 24 * _1080p
				},
				{
					font = f1_local1,
					size = 30 * _1080p
				},
				{
					font = f1_local1,
					size = 36 * _1080p
				},
				{
					font = f1_local1,
					size = 64 * _1080p
				},
				{
					font = f1_local3,
					size = 18 * _1080p
				},
				{
					font = f1_local3,
					size = 22 * _1080p
				},
				{
					font = f1_local3,
					size = 38 * _1080p
				},
				{
					font = f1_local3,
					size = 50 * _1080p
				},
				{
					font = f1_local3,
					size = 64 * _1080p
				},
				{
					font = f1_local4,
					size = 16 * _1080p
				},
				{
					font = f1_local4,
					size = 22 * _1080p
				},
				{
					font = f1_local4,
					size = 32 * _1080p
				},
				{
					font = f1_local4,
					size = 38 * _1080p
				},
				{
					font = f1_local4,
					size = 64 * _1080p
				},
				{
					font = f1_local5,
					size = 64 * _1080p
				}
			}
		elseif Engine.IsCoreMode() then
			f1_local7 = {
				{
					font = f1_local1,
					size = 24 * _1080p
				},
				{
					font = f1_local1,
					size = 26 * _1080p
				},
				{
					font = f1_local1,
					size = 30 * _1080p
				},
				{
					font = f1_local1,
					size = 38 * _1080p
				},
				{
					font = f1_local1,
					size = 48 * _1080p
				},
				{
					font = f1_local1,
					size = 64 * _1080p
				},
				{
					font = f1_local2,
					size = 50 * _1080p
				},
				{
					font = f1_local2,
					size = 64 * _1080p
				},
				{
					font = f1_local3,
					size = 26 * _1080p
				},
				{
					font = f1_local3,
					size = 38 * _1080p
				},
				{
					font = f1_local3,
					size = 50 * _1080p
				},
				{
					font = f1_local3,
					size = 64 * _1080p
				},
				{
					font = f1_local4,
					size = 16 * _1080p
				},
				{
					font = f1_local4,
					size = 18 * _1080p
				},
				{
					font = f1_local4,
					size = 19 * _1080p
				},
				{
					font = f1_local4,
					size = 20 * _1080p
				},
				{
					font = f1_local4,
					size = 22 * _1080p
				},
				{
					font = f1_local4,
					size = 24 * _1080p
				},
				{
					font = f1_local4,
					size = 26 * _1080p
				},
				{
					font = f1_local4,
					size = 32 * _1080p
				},
				{
					font = f1_local4,
					size = 38 * _1080p
				},
				{
					font = f1_local4,
					size = 64 * _1080p
				},
				{
					font = f1_local5,
					size = 64 * _1080p
				}
			}
		elseif Engine.IsAliensMode() then
			local f1_local8 = FONTS.GetFont( FONTS.ZmClean.File )
			f1_local7 = {
				{
					font = f1_local1,
					size = 24 * _1080p
				},
				{
					font = f1_local1,
					size = 30 * _1080p
				},
				{
					font = f1_local1,
					size = 38 * _1080p
				},
				{
					font = f1_local1,
					size = 64 * _1080p
				},
				{
					font = f1_local6,
					size = 22 * _1080p
				},
				{
					font = f1_local6,
					size = 38 * _1080p
				},
				{
					font = f1_local6,
					size = 64 * _1080p
				},
				{
					font = f1_local3,
					size = 24 * _1080p
				},
				{
					font = f1_local3,
					size = 26 * _1080p
				},
				{
					font = f1_local3,
					size = 32 * _1080p
				},
				{
					font = f1_local3,
					size = 64 * _1080p
				},
				{
					font = f1_local5,
					size = 64 * _1080p
				},
				{
					font = f1_local4,
					size = 18 * _1080p
				},
				{
					font = f1_local4,
					size = 22 * _1080p
				},
				{
					font = f1_local4,
					size = 26 * _1080p
				},
				{
					font = f1_local4,
					size = 32 * _1080p
				},
				{
					font = f1_local4,
					size = 38 * _1080p
				},
				{
					font = f1_local4,
					size = 64 * _1080p
				},
				{
					font = f1_local8,
					size = 16 * _1080p
				},
				{
					font = f1_local8,
					size = 30 * _1080p
				},
				{
					font = f1_local8,
					size = 50 * _1080p
				},
				{
					font = f1_local8,
					size = 64 * _1080p
				}
			}
		end
	end
	Engine.ResetFontsPrecache()
	for f1_local8 = 1, #f1_local7, 1 do
		Engine.PreCacheGlyphs( f1_local7[f1_local8].font, f1_local7[f1_local8].size, f1_local0 )
	end
end

FONTS.GetFont = function ( f2_arg0 )
	return RegisterFont( f2_arg0 )
end

FONTS.GetFontAtSize = FONTS.GetFont
