LUI.InWorldManager = LUI.Class( LUI.UIElement )
LUI.InWorldManager.init = function ( f1_arg0, f1_arg1 )
	LUI.UIElement.init( f1_arg0 )
	f1_arg0.id = "InWorldManager"
	f1_arg0._controllerIndex = f1_arg1
end

LUI.InWorldManager.ShouldBeVisible = function ( f2_arg0 )
	local f2_local0
	if not Engine.InFrontend() then
		f2_local0 = Game.IsInitialized()
	else
		f2_local0 = false
	end
	return f2_local0
end

LUI.InWorldManager.StartFinalKillcam = function ( f3_arg0 )
	f3_arg0.FinalKillcam = {}
	if f3_arg0.playerNameplates.entitySpawnerEnemy then
		f3_arg0.FinalKillcam.enemyNameplateSpawnAngle = f3_arg0.playerNameplates.entitySpawnerEnemy:GetSpawnAngle()
		f3_arg0.FinalKillcam.enemyNameplateSpawnDistance = f3_arg0.playerNameplates.entitySpawnerEnemy:GetSpawnDistance()
		f3_arg0.FinalKillcam.enemyNameplateSpawnEntityFilter = f3_arg0.playerNameplates.entitySpawnerEnemy:GetEntityFilter()
		f3_arg0.playerNameplates.entitySpawnerEnemy:SetSpawnAngle( 360 )
		f3_arg0.playerNameplates.entitySpawnerEnemy:SetSpawnDistance( 3000 )
		f3_arg0.playerNameplates.entitySpawnerEnemy:SetEntityFilter( LUI.UIElementOnEntitySpawner.FILTER.enemies )
	end
end

LUI.InWorldManager.EndFinalKillcam = function ( f4_arg0 )
	assert( f4_arg0.FinalKillcam )
	if f4_arg0.playerNameplates.entitySpawnerEnemy then
		f4_arg0.playerNameplates.entitySpawnerEnemy:SetSpawnAngle( f4_arg0.FinalKillcam.enemyNameplateSpawnAngle )
		f4_arg0.playerNameplates.entitySpawnerEnemy:SetSpawnDistance( f4_arg0.FinalKillcam.enemyNameplateSpawnDistance )
		f4_arg0.playerNameplates.entitySpawnerEnemy:SetEntityFilter( f4_arg0.FinalKillcam.enemyNameplateSpawnEntityFilter )
	end
end

LUI.InWorldManager.UpdateWidgetsVisibility = function ( f5_arg0, f5_arg1 )
	assert( f5_arg0.playerNameplates )
	local f5_local0 = LUI.UIRoot.GetRootForControllerIndex( f5_arg1 )
	local f5_local1 = Game.GetOmnvar( "ui_hide_hud" ) == true
	local f5_local2 = DataSources.inGame.player.inKillCam:GetValue( f5_arg1 )
	local f5_local3 = DataSources.inGame.HUD.overlay.locationSelectorActive:GetValue( f5_arg1 )
	local f5_local4 = Game.GetOmnvar( "ui_match_start_countdown" ) > 0
	local f5_local5 = Game.GetOmnvar( "ui_out_of_bounds_countdown" ) > 0
	local f5_local6 = LUI.ScoreboardLayer:GetInstance()
	f5_local6 = f5_local6:IsShowingScoreboard()
	local f5_local7 = CODCASTER.IsCODCaster()
	local f5_local8 = Game.IsEmpJammed()
	local f5_local9 = GameX.IsHardcoreMode()
	local f5_local10 = AnyActiveMenusInStack( f5_local0 )
	local f5_local11 = Game.GetOmnvar( "ui_session_state" ) ~= "playing"
	local f5_local12 = DataSources.inGame.MP.spectating.isSpectating:GetValue( f5_arg1 ) and not f5_local7
	local f5_local13 = Game.GetOmnvar( "ui_killstreak_connection" )
	local f5_local14 = Game.GetOmnvar( "ui_using_killstreak_remote" )
	local f5_local15
	if f5_local13 ~= KillstreakConnectionState.CONNECTING and f5_local13 ~= KillstreakConnectionState.CONNECTED then
		f5_local15 = false
	else
		f5_local15 = true
	end
	if f5_local1 then
		f5_arg0.playerNameplates:SetAlpha( 0 )
	elseif f5_local10 then
		f5_arg0.playerNameplates:SetAlpha( 0 )
	elseif f5_local6 then
		f5_arg0.playerNameplates:SetAlpha( 0 )
	elseif f5_local2 then
		f5_arg0.playerNameplates:SetAlpha( 1 )
	elseif f5_local7 then
		f5_arg0.playerNameplates:SetAlpha( MLG.ShoutcasterProfileVarBool( f5_arg0._controllerIndex, "shoutcaster_qs_playernameplates" ) and 1 or 0 )
	elseif f5_local5 then
		f5_arg0.playerNameplates:SetAlpha( 0 )
	elseif f5_local3 then
		f5_arg0.playerNameplates:SetAlpha( 0 )
	elseif f5_local15 then
		f5_arg0.playerNameplates:SetAlpha( 0 )
	elseif f5_local14 then
		f5_arg0.playerNameplates:SetAlpha( 1 )
	elseif f5_local12 then
		f5_arg0.playerNameplates:SetAlpha( 1 )
	elseif f5_local9 then
		f5_arg0.playerNameplates:SetAlpha( 1 )
	elseif f5_local11 then
		f5_arg0.playerNameplates:SetAlpha( 0 )
	elseif f5_local8 then
		f5_arg0.playerNameplates:SetAlpha( 1 )
	elseif f5_local4 then
		f5_arg0.playerNameplates:SetAlpha( 1 )
	else
		f5_arg0.playerNameplates:SetAlpha( 1 )
	end
end

LUI.InWorldManager.MPRegisterUpdateWidgetVisibilityHandlers = function ( f6_arg0, f6_arg1 )
	local f6_local0 = function ()
		LUI.InWorldManager.UpdateWidgetsVisibility( f6_arg0, f6_arg1 )
	end
	
	f6_arg0:registerEventHandler( "playerstate_client_changed", f6_local0 )
	f6_arg0:registerEventHandler( "weapon_change", f6_local0 )
	f6_arg0:registerEventHandler( "empty_menu_stack", f6_local0 )
	f6_arg0:registerEventHandler( "non_empty_menu_stack", f6_local0 )
	f6_arg0:registerOmnvarHandler( "ui_ads_minimap", f6_local0 )
	f6_arg0:registerOmnvarHandler( "ui_hide_hud", f6_local0 )
	f6_arg0:registerOmnvarHandler( "ui_killstreak_connection", f6_local0 )
	f6_arg0:registerOmnvarHandler( "ui_match_start_countdown", f6_local0 )
	f6_arg0:registerOmnvarHandler( "ui_minijackal_controls", f6_local0 )
	f6_arg0:registerOmnvarHandler( "ui_out_of_bounds_countdown", f6_local0 )
	f6_arg0:registerOmnvarHandler( "ui_predator_missile", f6_local0 )
	f6_arg0:registerOmnvarHandler( "ui_session_state", f6_local0 )
	f6_arg0:registerOmnvarHandler( "ui_show_hardcore_minimap", f6_local0 )
	f6_arg0:registerOmnvarHandler( "ui_using_killstreak_remote", f6_local0 )
	f6_arg0:registerOmnvarHandler( "ui_venom_controls", f6_local0 )
	f6_arg0:registerOmnvarHandler( "post_game_state", f6_local0 )
	f6_arg0:SubscribeToModel( DataSources.inGame.HUD.overlay.locationSelectorActive:GetModel( f6_arg1 ), function ()
		LUI.InWorldManager.UpdateWidgetsVisibility( f6_arg0, f6_arg1 )
	end )
	f6_arg0:SubscribeToModel( DataSources.inGame.player.inADS:GetModel( f6_arg1 ), function ()
		LUI.InWorldManager.UpdateWidgetsVisibility( f6_arg0, f6_arg1 )
	end )
	f6_arg0:SubscribeToModel( DataSources.inGame.HUD.isScoreboardOpen:GetModel( f6_arg1 ), function ()
		LUI.InWorldManager.UpdateWidgetsVisibility( f6_arg0, f6_arg1 )
	end )
end

LUI.InWorldManager.InitLayer = function ( f11_arg0 )
	f11_arg0.scopeReticleManager = MenuBuilder.BuildRegisteredType( "ScopeReticleManager" )
	f11_arg0:addElement( f11_arg0.scopeReticleManager )
	if Engine.IsMultiplayer() then
		f11_arg0.blurProcessing = MenuBuilder.BuildRegisteredType( "blurProcessing" )
		f11_arg0:addElement( f11_arg0.blurProcessing )
	end
	if Engine.IsSingleplayer() then
		if Game.GetOmnvar( "ui_jackal_load_ui" ) == true then
			f11_arg0:addElement( MenuBuilder.BuildRegisteredType( "JackalInteriorScreens", {
				controllerIndex = f11_arg0._controllerIndex
			} ) )
		end
		f11_arg0:addElement( MenuBuilder.BuildRegisteredType( "WristPCScreens", {
			controllerIndex = f11_arg0._controllerIndex
		} ) )
		if not (Engine.TableLookup( CSV.levels.file, CSV.levels.cols.name, Game.GetMapName(), CSV.levels.cols.isShipCrib ) == "1") and Game.GetMapName() ~= "vr_firing_range" then
			f11_arg0:addElement( MenuBuilder.BuildRegisteredType( "OlympusMonsCaptainScreen", {
				controllerIndex = f11_arg0._controllerIndex
			} ) )
		end
	elseif Engine.IsAliensMode() then
		f11_arg0.clownToothArcadeScoreboard = MenuBuilder.BuildRegisteredType( "clown_tooth_score_arcade", {
			controllerIndex = f11_arg0._controllerIndex
		} )
		f11_arg0:addElement( f11_arg0.clownToothArcadeScoreboard )
		f11_arg0.clownToothAfterlifeArcadeScoreboard = MenuBuilder.BuildRegisteredType( "clown_tooth_score_arcade_afterlife", {
			controllerIndex = f11_arg0._controllerIndex
		} )
		f11_arg0:addElement( f11_arg0.clownToothAfterlifeArcadeScoreboard )
		f11_arg0.bballScoreboard = MenuBuilder.BuildRegisteredType( "bball_scoreboard", {
			controllerIndex = f11_arg0._controllerIndex
		} )
		f11_arg0:addElement( f11_arg0.bballScoreboard )
		f11_arg0.bballTwoScoreboard = MenuBuilder.BuildRegisteredType( "bballTwoScoreboard", {
			controllerIndex = f11_arg0._controllerIndex
		} )
		f11_arg0:addElement( f11_arg0.bballTwoScoreboard )
		f11_arg0.bballThreeScoreboard = MenuBuilder.BuildRegisteredType( "bballThreeScoreboard", {
			controllerIndex = f11_arg0._controllerIndex
		} )
		f11_arg0:addElement( f11_arg0.bballThreeScoreboard )
		f11_arg0.skeeballArcadeScoreboard = MenuBuilder.BuildRegisteredType( "skeeballScoreboardArcade", {
			controllerIndex = f11_arg0._controllerIndex
		} )
		f11_arg0:addElement( f11_arg0.skeeballArcadeScoreboard )
		f11_arg0.skeeballAfterlifeArcadeScoreboard = MenuBuilder.BuildRegisteredType( "skeeballScoreboardAfterlife", {
			controllerIndex = f11_arg0._controllerIndex
		} )
		f11_arg0:addElement( f11_arg0.skeeballAfterlifeArcadeScoreboard )
		f11_arg0.coasterhighscorep1 = MenuBuilder.BuildRegisteredType( "ZomCoasterHighScore", {
			controllerIndex = f11_arg0._controllerIndex
		} )
		f11_arg0:addElement( f11_arg0.coasterhighscorep1 )
		f11_arg0.coasterhighscorep2 = MenuBuilder.BuildRegisteredType( "ZomCoasterHighScore2", {
			controllerIndex = f11_arg0._controllerIndex
		} )
		f11_arg0:addElement( f11_arg0.coasterhighscorep2 )
		f11_arg0.coasterhighscorep3 = MenuBuilder.BuildRegisteredType( "ZomCoasterHighScore3", {
			controllerIndex = f11_arg0._controllerIndex
		} )
		f11_arg0:addElement( f11_arg0.coasterhighscorep3 )
		f11_arg0.coasterhighscorep4 = MenuBuilder.BuildRegisteredType( "ZomCoasterHighScore4", {
			controllerIndex = f11_arg0._controllerIndex
		} )
		f11_arg0:addElement( f11_arg0.coasterhighscorep4 )
		f11_arg0.ghostArcadeGameCabinet = MenuBuilder.BuildRegisteredType( "ghostArcadeGameCabinet", {
			controllerIndex = f11_arg0._controllerIndex
		} )
		f11_arg0:addElement( f11_arg0.ghostArcadeGameCabinet )
		f11_arg0.zomCoasterInfo = MenuBuilder.BuildRegisteredType( "zomCoasterInfo", {
			controllerIndex = f11_arg0._controllerIndex
		} )
		f11_arg0:addElement( f11_arg0.zomCoasterInfo )
		f11_arg0.phoneNumberPad = MenuBuilder.BuildRegisteredType( "PhoneNumberPad", {
			controllerIndex = f11_arg0._controllerIndex
		} )
		f11_arg0:addElement( f11_arg0.phoneNumberPad )
		if Engine.GetDvarString( "ui_mapname" ) == "cp_final" then
			f11_arg0.venomx_timer1 = MenuBuilder.BuildRegisteredType( "venomxTimerContainer1", {
				controllerIndex = f11_arg0._controllerIndex
			} )
			f11_arg0:addElement( f11_arg0.venomx_timer1 )
			f11_arg0.venomx_timer2 = MenuBuilder.BuildRegisteredType( "venomxTimerContainer2", {
				controllerIndex = f11_arg0._controllerIndex
			} )
			f11_arg0:addElement( f11_arg0.venomx_timer2 )
			f11_arg0.venomx_timer3 = MenuBuilder.BuildRegisteredType( "venomxTimerContainer3", {
				controllerIndex = f11_arg0._controllerIndex
			} )
			f11_arg0:addElement( f11_arg0.venomx_timer3 )
			f11_arg0.venomx_timer4 = MenuBuilder.BuildRegisteredType( "venomxTimerContainer4", {
				controllerIndex = f11_arg0._controllerIndex
			} )
			f11_arg0:addElement( f11_arg0.venomx_timer4 )
			f11_arg0.emp_timer1 = MenuBuilder.BuildRegisteredType( "empContainer", {
				controllerIndex = f11_arg0._controllerIndex
			} )
			f11_arg0:addElement( f11_arg0.emp_timer1 )
			f11_arg0.alaTimer = MenuBuilder.BuildRegisteredType( "ZMALATimer", {
				controllerIndex = f11_arg0._controllerIndex
			} )
			f11_arg0:addElement( f11_arg0.alaTimer )
		end
		if Engine.GetDvarString( "ui_mapname" ) == "cp_town" then
			for f11_local0 = 1, 6, 1 do
				f11_arg0["blackboard" .. f11_local0] = MenuBuilder.BuildRegisteredType( "blackboard1", {
					controllerIndex = f11_arg0._controllerIndex
				} )
				f11_arg0["blackboard" .. f11_local0]:SetupBlackboard( f11_local0 )
				f11_arg0:addElement( f11_arg0["blackboard" .. f11_local0] )
			end
			f11_arg0.constant1 = MenuBuilder.BuildRegisteredType( "constant1", {
				controllerIndex = f11_arg0._controllerIndex
			} )
			f11_arg0:addElement( f11_arg0.constant1 )
			f11_arg0.constant2 = MenuBuilder.BuildRegisteredType( "constant2", {
				controllerIndex = f11_arg0._controllerIndex
			} )
			f11_arg0:addElement( f11_arg0.constant2 )
			f11_arg0.constant3 = MenuBuilder.BuildRegisteredType( "constant3", {
				controllerIndex = f11_arg0._controllerIndex
			} )
			f11_arg0:addElement( f11_arg0.constant3 )
			f11_arg0.constant4 = MenuBuilder.BuildRegisteredType( "constant4", {
				controllerIndex = f11_arg0._controllerIndex
			} )
			f11_arg0:addElement( f11_arg0.constant4 )
			f11_arg0.labScreen = MenuBuilder.BuildRegisteredType( "labScreen", {
				controllerIndex = f11_arg0._controllerIndex
			} )
			f11_arg0:addElement( f11_arg0.labScreen )
			f11_arg0.heatPressureEq = MenuBuilder.BuildRegisteredType( "heatPressureEq", {
				controllerIndex = f11_arg0._controllerIndex
			} )
			f11_arg0:addElement( f11_arg0.heatPressureEq )
			f11_arg0.constantEye = MenuBuilder.BuildRegisteredType( "constantEye", {
				controllerIndex = f11_arg0._controllerIndex
			} )
			f11_arg0:addElement( f11_arg0.constantEye )
			f11_arg0.constantPi = MenuBuilder.BuildRegisteredType( "constantPi", {
				controllerIndex = f11_arg0._controllerIndex
			} )
			f11_arg0:addElement( f11_arg0.constantPi )
			f11_arg0.eyeEquation = MenuBuilder.BuildRegisteredType( "eyeEquationContainer", {
				controllerIndex = f11_arg0._controllerIndex
			} )
			f11_arg0:addElement( f11_arg0.eyeEquation )
			f11_arg0.compoundSlot1 = MenuBuilder.BuildRegisteredType( "compoundSlot1", {
				controllerIndex = f11_arg0._controllerIndex
			} )
			f11_arg0:addElement( f11_arg0.compoundSlot1 )
			f11_arg0.compoundSlot2 = MenuBuilder.BuildRegisteredType( "compoundSlot2", {
				controllerIndex = f11_arg0._controllerIndex
			} )
			f11_arg0:addElement( f11_arg0.compoundSlot2 )
			f11_arg0.compoundSlot3 = MenuBuilder.BuildRegisteredType( "compoundSlot3", {
				controllerIndex = f11_arg0._controllerIndex
			} )
			f11_arg0:addElement( f11_arg0.compoundSlot3 )
			f11_arg0.compoundSlot4 = MenuBuilder.BuildRegisteredType( "compoundSlot4", {
				controllerIndex = f11_arg0._controllerIndex
			} )
			f11_arg0:addElement( f11_arg0.compoundSlot4 )
			f11_arg0.skulltop_hint = MenuBuilder.BuildRegisteredType( "skulltop_hint", {
				controllerIndex = f11_arg0._controllerIndex
			} )
			f11_arg0:addElement( f11_arg0.skulltop_hint )
		end
	elseif Engine.IsCoreMode() then
		f11_arg0.playerNameplates = MenuBuilder.BuildRegisteredType( "PlayerNameplates", {
			controllerIndex = f11_arg0._controllerIndex
		} )
		f11_arg0:addElement( f11_arg0.playerNameplates )
		f11_arg0:MPRegisterUpdateWidgetVisibilityHandlers( f11_arg0._controllerIndex )
	end
	f11_arg0:SetUseGameClock( true )
end

LUI.InWorldManager.ClearLayer = function ( f12_arg0, f12_arg1 )
	if f12_arg0.scopeReticleManager then
		f12_arg0.scopeReticleManager:closeTree()
		f12_arg0.scopeReticleManager = nil
	end
	f12_arg0:closeChildren()
end

