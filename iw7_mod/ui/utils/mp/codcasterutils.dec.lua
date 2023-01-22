CODCASTER = CODCASTER or {}
CODCASTER.CanCODCast = function ()
	if Engine.GetDvarBool( "splitscreen" ) then
		return false
	else
		return Engine.GetDvarBool( "com_codcasterEnabled" ) and (Engine.GetDvarBool( "com_devCodcasterEnabled" ) or Engine.GetDvarBool( "lui_codcaster_enabled" ))
	end
end

CODCASTER.SetCODCastingEnabled = function ( f2_arg0 )
	Engine.SetDvarBool( "com_codcasterEnabled", f2_arg0 )
end

CODCASTER.IsCODCaster = function ()
	return MLG.IsMLGSpectator()
end

CODCASTER.IsCustomTeamIdentity = function ( f4_arg0 )
	return MLG.ShoutcasterProfileVarValue( f4_arg0, "shoutcaster_fe_team_identity" ) == 1
end

local f0_local0 = function ( f5_arg0, f5_arg1 )
	local f5_local0 = assert
	local f5_local1
	if f5_arg1 ~= 1 and f5_arg1 ~= 2 then
		f5_local1 = false
	else
		f5_local1 = true
	end
	f5_local0( f5_local1 )
	f5_local0 = CODCASTER.IsCustomTeamIdentity( f5_arg0 )
	f5_local1 = ""
	if f5_local0 then
		f5_local1 = MLG.ShoutcasterProfileVarValue( f5_arg0, "shoutcaster_fe_team" .. f5_arg1 .. "_name" )
		if f5_local1 == "MENU_FACTION_UNSA_SHORT" or f5_local1 == "MENU_FACTION_SDF_SHORT" then
			f5_local1 = Engine.Localize( f5_local1 )
			MLG.SetShoutcasterProfileVarValue( f5_arg0, "shoutcaster_fe_team" .. f5_arg1 .. "_name", f5_local1 )
		end
	end
	if f5_local1 == "" then
		if f5_arg1 == 1 then
			return Engine.Localize( "MENU_FACTION_UNSA_SHORT" )
		else
			return Engine.Localize( "MENU_FACTION_SDF_SHORT" )
		end
	else
		return f5_local1
	end
end

local f0_local1 = function ( f6_arg0, f6_arg1 )
	local f6_local0 = assert
	local f6_local1
	if f6_arg1 ~= 1 and f6_arg1 ~= 2 then
		f6_local1 = false
	else
		f6_local1 = true
	end
	f6_local0( f6_local1 )
	f6_local0 = CODCASTER.IsCustomTeamIdentity( f6_arg0 )
	f6_local1 = nil
	local f6_local2
	if f6_arg1 == 1 then
		f6_local2 = 2
		if not f6_local2 then
		
		else
			local f6_local3 = nil
			if f6_local0 then
				f6_local1 = Engine.TableLookupByRow( CSV.teamLogoTable.file, MLG.ShoutcasterProfileVarValue( f6_arg0, "shoutcaster_fe_team" .. f6_arg1 .. "_icon" ), CSV.teamLogoTable.cols.logoMaterial )
			end
			if f6_local1 == nil then
				f6_local1 = Engine.TableLookupByRow( CSV.teamLogoTable.file, f6_arg1 - 1, CSV.teamLogoTable.cols.logoMaterial )
			elseif f6_local1 == "" then
				local f6_local4 = MLG.ShoutcasterProfileVarValue( f6_arg0, "shoutcaster_fe_team" .. f6_local2 .. "_icon" )
				f6_local3 = f6_arg1 - 1
				if f6_local3 == f6_local4 then
					if f6_local3 == 0 then
						local f6_local5 = 1
					end
					f6_local3 = f6_local5 or 0
				end
				f6_local1 = Engine.TableLookupByRow( CSV.teamLogoTable.file, f6_local3, CSV.teamLogoTable.cols.logoMaterial )
			end
			return f6_local1
		end
	end
	f6_local2 = 1
end

CODCASTER.GetTeamColor = function ( f7_arg0, f7_arg1 )
	local f7_local0 = assert
	local f7_local1
	if f7_arg1 ~= 1 and f7_arg1 ~= 2 then
		f7_local1 = false
	else
		f7_local1 = true
	end
	f7_local0( f7_local1 )
	f7_local0 = CODCASTER.IsCustomTeamIdentity( f7_arg0 )
	f7_local1 = 0
	if f7_local0 then
		f7_local1 = MLG.ShoutcasterProfileVarValue( f7_arg0, "shoutcaster_fe_team" .. f7_arg1 .. "_color" )
	end
	if f7_local1 == 0 then
		if f7_arg1 == 1 then
			f7_local1 = GetIntForColor( SWATCHES.HUD.friendlyTeam )
		else
			f7_local1 = GetIntForColor( SWATCHES.HUD.enemyTeam )
		end
	end
	return f7_local1
end

CODCASTER.GetTeamDarkColor = function ( f8_arg0, f8_arg1 )
	local f8_local0 = assert
	local f8_local1
	if f8_arg1 ~= 1 and f8_arg1 ~= 2 then
		f8_local1 = false
	else
		f8_local1 = true
	end
	f8_local0( f8_local1 )
	f8_local0 = GetColorTableFromIntColor( CODCASTER.GetTeamColor( f8_arg0, f8_arg1 ) )
	f8_local1 = 4
	f8_local0.r = f8_local0.r / f8_local1
	f8_local0.g = f8_local0.g / f8_local1
	f8_local0.b = f8_local0.b / f8_local1
	return GetIntForColor( f8_local0 )
end

CODCASTER.ResizeTeamNameText = function ( f9_arg0, f9_arg1, f9_arg2 )
	local f9_local0 = f9_arg2 or 45
	local f9_local1 = f9_arg0:getText()
	local f9_local2 = f9_arg0:GetCurrentFont()
	local f9_local3, f9_local4, f9_local5, f9_local6 = GetTextDimensions( f9_local1, f9_local2, f9_local0 * _1080p )
	local f9_local7, f9_local8, f9_local9, f9_local10 = f9_arg0:getLocalRect()
	local f9_local11 = f9_local9 - f9_local7
	local f9_local12 = f9_arg1 / _1080p
	local f9_local13 = 5
	while f9_local11 < f9_local5 do
		f9_local0 = f9_local0 - f9_local13
		f9_local12 = f9_local12 + f9_local13
		f9_arg0:SetTop( _1080p * f9_local12, 0 )
		f9_local3, f9_local4, f9_local5, f9_local6 = GetTextDimensions( f9_local1, f9_local2, f9_local0 * _1080p )
	end
end

CODCASTER.GetTeamName = function ( f10_arg0, f10_arg1 )
	return f0_local0( f10_arg0, f10_arg1 )
end

CODCASTER.GetTeam1Name = function ( f11_arg0 )
	return f0_local0( f11_arg0, 1 )
end

CODCASTER.GetTeam2Name = function ( f12_arg0 )
	return f0_local0( f12_arg0, 2 )
end

CODCASTER.GetTeamLogoMaterial = function ( f13_arg0, f13_arg1 )
	return f0_local1( f13_arg0, f13_arg1 )
end

CODCASTER.GetTeam1LogoMaterial = function ( f14_arg0 )
	return f0_local1( f14_arg0, 1 )
end

CODCASTER.GetTeam2LogoMaterial = function ( f15_arg0 )
	return f0_local1( f15_arg0, 2 )
end

CODCASTER.GetTeam1Color = function ( f16_arg0 )
	return CODCASTER.GetTeamColor( f16_arg0, 1 )
end

CODCASTER.GetTeam2Color = function ( f17_arg0 )
	return CODCASTER.GetTeamColor( f17_arg0, 2 )
end

CODCASTER.GetTeam1DarkColor = function ( f18_arg0 )
	return CODCASTER.GetTeamDarkColor( f18_arg0, 1 )
end

CODCASTER.GetTeam2DarkColor = function ( f19_arg0 )
	return CODCASTER.GetTeamDarkColor( f19_arg0, 2 )
end

CODCASTER.GetProTeamAlias = function ( f20_arg0, f20_arg1 )
	local f20_local0 = Engine.TableLookupByRow( CSV.teamLogoTable.file, f20_arg1, CSV.teamLogoTable.cols.teamAlias )
	if f20_local0 == "" then
		f20_local0 = Engine.TableLookupByRow( CSV.teamLogoTable.file, f20_arg1, CSV.teamLogoTable.cols.teamName )
	end
	return Engine.Localize( f20_local0 )
end

CODCASTER.InitToolbarButton = function ( f21_arg0, f21_arg1, f21_arg2, f21_arg3 )
	local f21_local0 = FONTS.GetFont( FONTS.MainMedium.File )
	local f21_local1 = 16 * _1080p
	local f21_local2 = f21_arg0.ButtonText
	local f21_local3 = f21_arg0.ButtonIcon
	f21_local3:setText( f21_arg1 )
	f21_local2:setText( f21_arg2 )
	local f21_local4, f21_local5, f21_local6, f21_local7 = GetTextDimensions( f21_arg2, f21_local0, f21_local1 )
	local f21_local8 = f21_local6 - f21_local4
	local f21_local9 = 52
	local f21_local10 = 0
	local f21_local11 = 0
	if Engine.IsPC() then
		if 0 == Engine.IsGamepadEnabled() then
			f21_local3:SetRGBFromTable( SWATCHES.genericButton.highlight, 0 )
			local f21_local12, f21_local13, f21_local14, f21_local15 = GetTextDimensions( f21_arg1, f21_local0, 20 * _1080p )
			f21_local9 = f21_local14 - f21_local12
		else
			f21_local3:SetRGBFromTable( SWATCHES.HUD.normal )
			if f21_arg3 then
				f21_local9 = 16
			else
				f21_local9 = 12
			end
		end
		f21_local10 = 10
		f21_local11 = 20
		f21_local3:SetLeft( 0 )
		f21_local3:SetRight( f21_local9 )
		f21_local2:SetLeft( f21_local9 + f21_local10 )
		f21_local2:SetRight( f21_local9 + f21_local10 + f21_local8 + f21_local11 )
	end
	local f21_local16 = f21_local8 + f21_local9 + f21_local10 + f21_local11
	f21_arg0:SetLeft( 0 )
	f21_arg0:SetRight( f21_local16 )
end

CODCASTER.CreateCODCasterSettingsButton = function ( f22_arg0, f22_arg1 )
	if f22_arg0.Codcaster == nil then
		f22_arg0:removeElement( f22_arg0.ButtonDescription )
		if Engine.GetDvarBool( "systemlink" ) == true then
			local Codcaster = MenuBuilder.BuildRegisteredType( "MenuButton", {
				controllerIndex = f22_arg1
			} )
			Codcaster.id = "Codcaster"
			Codcaster.buttonDescription = Engine.Localize( "CODCASTER_EDIT_SETTINGS_TOOL_TIP" )
			Codcaster.Text:setText( ToUpperCase( Engine.Localize( "CODCASTER_CAPS" ) ), 0 )
			Codcaster:SetAnchorsAndPosition( 0, 0, 0, 1, 0, _1080p * -50, 0, _1080p * 30 )
			f22_arg0:addElement( Codcaster )
			f22_arg0.Codcaster = Codcaster
			
		else
			local Codcaster = MenuBuilder.BuildRegisteredType( "GenericButton", {
				controllerIndex = f22_arg1
			} )
			Codcaster.id = "Codcaster"
			Codcaster.buttonDescription = Engine.Localize( "CODCASTER_EDIT_SETTINGS_TOOL_TIP" )
			Codcaster.Text:setText( ToUpperCase( Engine.Localize( "CODCASTER_CAPS" ) ), 0 )
			Codcaster:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 160, _1080p * 190 )
			f22_arg0:addElement( Codcaster )
			f22_arg0.Codcaster = Codcaster
		end
		f22_arg0.Codcaster:addEventHandler( "button_action", function ( f23_arg0, f23_arg1 )
			LUI.FlowManager.RequestAddMenu( "CodcasterSetup", true, f23_arg1.controller or f22_arg1, false )
		end )
		f22_arg0:addElement( f22_arg0.ButtonDescription )
	end
end

CODCASTER.DestroyCODCasterSettingsButton = function ( f24_arg0, f24_arg1 )
	if f24_arg0.Codcaster ~= nil then
		f24_arg0.Codcaster:close()
		f24_arg0.Codcaster = nil
	end
end

CODCASTER.AddPlayerListColumn = function ( f25_arg0, f25_arg1, f25_arg2, f25_arg3, f25_arg4, f25_arg5 )
	local f25_local0 = nil
	f25_local0 = MenuBuilder.BuildRegisteredType( "CodCasterTextField", {
		controllerIndex = f25_arg2
	} )
	f25_local0.id = "newColumn" .. f25_arg3
	f25_local0:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * f25_arg1, _1080p * (f25_arg1 + f25_arg4), 0, 0 )
	f25_local0.Field:SetTop( _1080p * -10, 0 )
	f25_local0.Field:SetBottom( _1080p * 10, 0 )
	f25_local0.Field:SetAlignment( LUI.Alignment.Center )
	f25_local0.Field:setText( f25_arg3, 0 )
	f25_arg0:addElement( f25_local0 )
	f25_arg0.newColumns[f25_arg5] = f25_local0
	return f25_arg1 + f25_arg4
end

function SetupRatioColumn( f26_arg0, f26_arg1, f26_arg2, f26_arg3 )
	local f26_local0 = f26_arg3.deaths
	if f26_local0 == 0 then
		f26_local0 = 1
	end
	f26_arg1.Field:setText( string.format( "%.2f", f26_arg3.kills / f26_local0 ), 0 )
end

function SetupExtraScore0Column( f27_arg0, f27_arg1, f27_arg2, f27_arg3 )
	f27_arg1.Field:setText( f27_arg3.extraScore0, 0 )
end

function SetupUplinksColumn( f28_arg0, f28_arg1, f28_arg2, f28_arg3 )
	f28_arg1.Field:setText( f28_arg3.extraScore0 * MatchRules.GetData( "ballData", "scoreCarry" ) + f28_arg3.extraScore1 * MatchRules.GetData( "ballData", "scoreThrow" ), 0 )
end

function SetupTimeColumn( f29_arg0, f29_arg1, f29_arg2, f29_arg3 )
	local f29_local0 = f29_arg3.extraScore0
	local f29_local1 = string.format( "%.2d:%.2d", f29_local0 / 60 % 60, f29_local0 % 60 )
	if f29_local0 < 600 then
		f29_local1 = string.sub( f29_local1, 2 )
	end
	f29_arg1.Field:setText( f29_local1, 0 )
end

CODCASTER.fixedColumnsWidth = 340
CODCASTER.extraColumnsWidths = {
	92,
	48,
	75
}
CODCASTER.columnSettingImageName = 1
CODCASTER.columnSettingDefaultValue = 2
CODCASTER.columnSettingSetupFunction = 3
CODCASTER.fastDecodeLetterLength = 5
CODCASTER.fastDecodeMaxRandChars = 3
CODCASTER.fastDecodeUpdatesPerLetter = 4
CODCASTER.gameModeColumnSettings = {}
CODCASTER.gameModeColumnSettings.war = {
	"gamemode_team_deathmatch_small",
	"0.00",
	SetupRatioColumn
}
CODCASTER.gameModeColumnSettings.front = {
	"gamemode_frontline_small",
	"0.00",
	SetupRatioColumn
}
CODCASTER.gameModeColumnSettings.dom = {
	"gamemode_domination_small",
	"0.00",
	SetupExtraScore0Column
}
CODCASTER.gameModeColumnSettings.sd = {
	"gamemode_search_n_destroy_small",
	"0",
	SetupExtraScore0Column
}
CODCASTER.gameModeColumnSettings.conf = {
	"gamemode_kill_confirmed_small",
	"0.00",
	SetupRatioColumn
}
CODCASTER.gameModeColumnSettings.dm = {
	"gamemode_free_for_all_small",
	"0.00",
	SetupRatioColumn
}
CODCASTER.gameModeColumnSettings.koth = {
	"gamemode_hardpoint_small",
	":00",
	SetupTimeColumn
}
CODCASTER.gameModeColumnSettings.tdef = {
	"gamemode_team_defender_small",
	"0",
	SetupTimeColumn
}
CODCASTER.gameModeColumnSettings.ball = {
	"gamemode_uplink_small",
	"0",
	SetupUplinksColumn
}
CODCASTER.gameModeColumnSettings.dd = {
	"gamemode_demolition_small",
	"0",
	SetupExtraScore0Column
}
CODCASTER.gameModeColumnSettings.ctf = {
	"gamemode_capture_the_flag_small",
	"0",
	SetupExtraScore0Column
}
CODCASTER.gameModeColumnSettings.sr = {
	"gamemode_search_n_rescue_small",
	"0",
	SetupExtraScore0Column
}
CODCASTER.gameModeColumnSettings.siege = {
	"gamemode_reinforce_small",
	"0",
	SetupExtraScore0Column
}
CODCASTER.gameModeColumnSettings.grind = {
	"gamemode_grind_small",
	"0",
	SetupExtraScore0Column
}
CODCASTER.gameModeColumnSettings.mp_zomb = {
	"gamemode_contagion_small",
	"0",
	SetupExtraScore0Column
}
CODCASTER.gameModeColumnSettings.infect = {
	"gamemode_infected_small",
	"0",
	SetupTimeColumn
}
CODCASTER.gameModeColumnSettings.gun = {
	"gamemode_gun_game_small",
	"0",
	SetupExtraScore0Column
}
CODCASTER.gameModeColumnSettings.grnd = {
	"gamemode_drop_zone_small",
	"0",
	SetupTimeColumn
}
