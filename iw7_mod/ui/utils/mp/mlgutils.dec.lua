MLG = MLG or {}
MLG.GetRulesVersionNumber = function ()
	local f1_local0 = MatchRules.GetData( "mlgVersion" )
	if f1_local0 == nil or f1_local0 == "" then
		f1_local0 = "0.0.0"
	end
	return Engine.MarkLocalized( f1_local0 )
end

MLG.IsFeatureAvailable = function ()
	local f2_local0 = Engine.GetDvarBool( "systemlink" )
	if not f2_local0 then
		f2_local0 = IsPrivateMatch and IsPrivateMatch()
	end
	if f2_local0 then
		f2_local0 = not Engine.IsAliensMode()
	end
	if f2_local0 then
		f2_local0 = Engine.GetDvarBool( "using_mlg" )
	end
	return f2_local0
end

MLG.CanIAdjustMLGSettings = function ()
	if not MLG.IsFeatureAvailable() then
		return false
	end
	local f3_local0 = Engine.GetDvarBool( "systemlink" )
	if not f3_local0 then
		f3_local0 = Lobby.IsGameHost()
	end
	return f3_local0
end

MLG.AreMLGRulesEnabled = function ()
	if not MLG.IsFeatureAvailable() then
		return false
	end
	local f4_local0 = Engine.GetDvarBool( "systemlink" )
	if Engine.GetDvarBool( "xblive_competitionmatch" ) == nil then
		Engine.Exec( "set xblive_competitionmatch 0" )
	end
	return Lobby.IsUsingMLGRules()
end

MLG.SetUsingMLGRules = function ( f5_arg0 )
	Engine.SetDvarBool( "xblive_competitionmatch", f5_arg0 )
	Lobby.SetUsingMLGRules( f5_arg0 )
	if (Engine.SplitscreenPlayerCount() > 1) or CoD.IsUsingAspectRatio( 1.33 ) then
		for f5_local0 = 0, Engine.GetMaxControllerCount() - 1, 1 do
			LobbyMember.SelectedMember_SetLocalMemberMLGSpectator( false, f5_local0 )
		end
	end
end

MLG.ToggleMLGRules = function ( f6_arg0 )
	if MLG.CanIAdjustMLGSettings() then
		if not MLG.AreMLGRulesEnabled() then
			if Engine.TableLookup( GameTypesTable.File, GameTypesTable.Cols.Ref, Engine.GetDvarString( "ui_gametype" ), GameTypesTable.Cols.MLG ) == "1" and MatchRules.HasMLGRecipeAvailable() then
				MLG.SetUsingMLGRules( true )
				MatchRules.LoadMLGRecipe()
			elseif not Engine.UserCanPlayOnline( f6_arg0 ) then
				LUI.FlowManager.RequestPopupMenu( self, "mlg_error_no_rules_available_offline", false, f6_arg0, false )
			else
				LUI.FlowManager.RequestPopupMenu( self, "mlg_error_no_rules_available", false, f6_arg0, false )
			end
		else
			MLG.SetUsingMLGRules( false )
			MatchRules.LoadMatchRulesDataDefault()
		end
	end
end

MLG.Refresh = function ( f7_arg0 )
	local f7_local0 = MLG.AreMLGRulesEnabled()
	f7_arg0.properties = f7_arg0.properties or {}
	if f7_arg0.properties.cacheMLGenabled ~= f7_local0 then
		local f7_local1 = "mlg_"
		local f7_local2
		if f7_local0 then
			f7_local2 = "enabled"
			if not f7_local2 then
			
			else
				f7_arg0:dispatchEventToRoot( {
					name = f7_local1 .. f7_local2,
					immediate = true
				} )
				MLG.SetButtonHelper( f7_arg0, f7_local0 )
				f7_arg0.properties.cacheMLGenabled = f7_local0
			end
		end
		f7_local2 = "disabled"
	end
end

MLG.SetButtonHelper = function ( f8_arg0, f8_arg1 )
	local f8_local0 = ""
	if MLG.CanIAdjustMLGSettings() then
		if f8_arg1 then
			f8_local0 = Engine.Localize( "PATCH_MENU_DISABLE_MLG_RULES" )
		else
			f8_local0 = Engine.Localize( "PATCH_MENU_ENABLE_MLG_RULES" )
		end
	end
	f8_arg0:processEvent( {
		name = "add_button_helper_text",
		button_ref = "button_start",
		helper_text = f8_local0,
		side = "right",
		clickable = true
	} )
end

MLG.Toggle = function ( f9_arg0, f9_arg1 )
	if MLG.CanIAdjustMLGSettings() then
		MLG.ToggleMLGRules( f9_arg1.controller )
	end
	MLG.Refresh( f9_arg0 )
end

MLG.Hide = function ( f10_arg0 )
	f10_arg0:processEvent( {
		name = "mlg_disabled"
	} )
	f10_arg0:processEvent( {
		name = "add_button_helper_text",
		button_ref = "button_start",
		helper_text = "",
		side = "right"
	} )
end

MLG.ShoutcasterProfileVarBool = function ( f11_arg0, f11_arg1 )
	local f11_local0 = MLG.GetMLGSettings( f11_arg0 )
	if f11_local0 ~= nil and f11_local0[f11_arg1] ~= nil and f11_local0[f11_arg1]:get() == 1 then
		return true
	else
		return false
	end
end

MLG.ShoutcasterProfileVarValue = function ( f12_arg0, f12_arg1 )
	local f12_local0 = MLG.GetMLGSettings( f12_arg0 )
	if f12_local0 ~= nil and f12_local0[f12_arg1] ~= nil then
		return f12_local0[f12_arg1]:get()
	else
		return nil
	end
end

MLG.SetShoutcasterProfileVarValue = function ( f13_arg0, f13_arg1, f13_arg2 )
	local f13_local0 = MLG.GetMLGSettings( f13_arg0 )
	if f13_local0 ~= nil and f13_local0[f13_arg1] ~= nil then
		f13_local0[f13_arg1]:set( f13_arg2 )
	end
	Engine.Exec( "updategamerprofile" )
end

MLG.XrayEnemy = 2
MLG.XrayBoth = 0
MLG.XrayNone = 3
MLG.GetXrayModeByShoutcasterValue = function ( f14_arg0 )
	local f14_local0 = MLG.XrayNone
	if f14_arg0 == 0 then
		f14_local0 = MLG.XrayEnemy
	elseif f14_arg0 == 1 then
		f14_local0 = MLG.XrayBoth
	elseif f14_arg0 == 2 then
		f14_local0 = MLG.XrayNone
	end
	return f14_local0
end

