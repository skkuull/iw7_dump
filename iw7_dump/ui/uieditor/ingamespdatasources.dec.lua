local f0_local0 = function ( f1_arg0, f1_arg1 )
	local f1_local0 = 0
	for f1_local1 = 0, 4, 1 do
		if Engine.IsBitSet( f1_arg0, f1_local1 ) then
			f1_local0 = f1_local0 + 1
		end
	end
	return f1_local0
end

local f0_local1 = function ( f2_arg0, f2_arg1 )
	local f2_local0 = 0
	for f2_local1 = 0, 6, 1 do
		if Engine.IsBitSet( f2_arg0, f2_local1 ) then
			f2_local0 = f2_local0 + 1
		end
	end
	return f2_local0
end

function InitSPInGameDataSources()
	if not Engine.IsMultiplayer() then
		DataSources.inGame.SP.base = LUI.DataSourceInControllerModel.new( "cg.SP" )
		local f3_local0 = Engine.GetDvarString( "ui_mapname" )
		if f3_local0 == "titan" then
			InitTitanDataSources()
		end
		if f3_local0 == "europa" then
			InitEuropaDataSources()
		end
		if f3_local0 == "heist" then
			InitHeistDataSources()
		end
		if f3_local0 == "sa_assassination" then
			InitAssassinationDataSources()
		end
		if f3_local0 == "sa_wounded" then
			InitWoundedDataSources()
		end
		InitRogueAsteroidDataSources()
		InitCommonSPHUDDataSources()
		if Engine.TableLookup( CSV.levels.file, CSV.levels.cols.name, f3_local0, CSV.levels.cols.isShipCrib ) == "1" then
			InitShipCribDataSources()
		end
		if f3_local0 == "yard" then
			InitShipCribEpilogueSources()
		end
		InitShipLogDataSources()
		InitDPadDataSources()
		InitEuropaDataSources()
		InitPearlHarborDataSources()
		InitHeistDataSources()
		InitHeistSpaceDataSources()
		InitMarsDataSources()
		InitContextualGaugeDataSources()
		InitMissionCountdownDataSources()
		InitDeathHintDataSources()
		InitEquipmentDataSource()
		InitWeaponDataSource()
		InitSPPowersDataSources()
		InitSPLoadoutInGameDataSources()
		InitJackalDataSources()
	end
end

function InitEuropaDataSources()
	DataSources.inGame.SP.chyron = LUI.DataSourceFromOmnvar.new( "ui_chyron" )
	DataSources.inGame.SP.europaSelfDestruct = LUI.DataSourceFromOmnvar.new( "ui_europa_selfdestruct" )
	DataSources.inGame.SP.europa.haloDropState = LUI.DataSourceFromOmnvar.new( "ui_europa_halo_drop_state" )
	DataSources.inGame.SP.europa.haloDropAltitude = LUI.DataSourceFromOmnvar.new( "ui_europa_halo_drop_altitude" )
	DataSources.inGame.SP.europa.haloDropTemp = LUI.DataSourceFromOmnvar.new( "ui_europa_halo_drop_temp" )
	DataSources.inGame.SP.europa.haloDropActive = DataSources.inGame.SP.europa.haloDropState:Filter( "active", function ( f5_arg0 )
		return 0 < f5_arg0
	end )
	DataSources.inGame.SP.europa.showBoostMeter = LUI.DataSourceFromOmnvar.new( "ui_hud_heist_boost" )
	DataSources.inGame.SP.europa.boostEnergy = LUI.DataSourceFromOmnvar.new( "ui_hud_heist_boost_amount" )
end

local f0_local2 = function ( f6_arg0 )
	local f6_local0 = DataSources.inGame.player.currentWeapon.clipAmmoMax:GetValue( f6_arg0 )
	if DataSources.inGame.player.currentWeapon.name:GetValue( f6_arg0 ) == "apc_target_designator" then
		return math.min( f6_local0, 6 )
	else
		return 0
	end
end

function InitHeistDataSources()
	DataSources.inGame.SP.heist.showBoostMeter = LUI.DataSourceFromOmnvar.new( "ui_hud_heist_boost" )
	DataSources.inGame.SP.heist.boostEnergy = LUI.DataSourceFromOmnvar.new( "ui_hud_heist_boost_amount" )
end

local f0_local3 = function ( f8_arg0 )
	return function ( f9_arg0 )
		local f9_local0 = DataSources.inGame.SP.titan.c12Count:GetValue( f9_arg0 )
		local f9_local1 = DataSources.inGame.SP.titan.c12.missileCharge:GetValue( f9_arg0 )
		local f9_local2 = DataSources.inGame.player.currentWeapon.clipAmmoRight:GetValue( f9_arg0 )
		local f9_local3 = 1 + f8_arg0
		if f9_local2 and f9_local3 == f9_local2 + 1 then
			return f9_local1
		elseif f9_local2 and f9_local2 + 1 < f9_local3 then
			return 0
		else
			return 1
		end
	end
	
end

local f0_local4 = function ( f10_arg0, f10_arg1 )
	return f10_arg0 == C12LockState.TARGETED
end

local f0_local5 = function ( f11_arg0, f11_arg1 )
	if f11_arg0 < 1 then
		return Engine.Localize( "TITAN_C12_MISSILE_PERCENT", math.floor( f11_arg0 * 100 + 0.5 ) )
	else
		return ToUpperCase( Engine.Localize( "TITAN_C12_MISSILE_READY" ) )
	end
end

local f0_local6 = function ( f12_arg0, f12_arg1 )
	return f12_arg0 == 1
end

local f0_local7 = function ( f13_arg0 )
	local f13_local0 = 0
	local f13_local1 = DataSources.inGame.SP.titan.c12Count:GetValue( f13_arg0 )
	for f13_local2 = 0, f13_local1 - 1, 1 do
		local f13_local5 = DataSources.inGame.SP.titan.c12:GetDataSourceAtIndex( f13_local2, f13_arg0 )
		if f13_local5.lockState:GetValue( f13_arg0 ) == C12LockState.TARGETABLE then
			f13_local0 = f13_local0 + 1
		end
	end
	return f13_local0
end

function InitTitanDataSources()
	local f14_local0 = 6
	DataSources.inGame.SP.titan.c12Base = LUI.DataSourceInControllerModel.new( "cg.player.c12" )
	DataSources.inGame.SP.titan.c12Count = LUI.AggregateDataSource.new( DataSources.inGame.SP.titan.c12Base, {
		DataSources.inGame.player.currentWeapon.clipAmmoMax,
		DataSources.inGame.player.currentWeapon.name
	}, "count", f0_local2 )
	DataSources.inGame.SP.titan.c12 = LUI.DataSourceFromList.new( DataSources.inGame.SP.titan.c12Count )
	DataSources.inGame.SP.titan.c12.missileCharge = LUI.DataSourceFromOmnvar.new( "ui_c12_missile_recharge" )
	DataSources.inGame.SP.titan.c12.missiles = {}
	for f14_local1 = 0, f14_local0 - 1, 1 do
		local f14_local4 = Mirror( f14_local1, 0, f14_local0 - 1 )
		local f14_local5 = LUI.DataSourceFromOmnvar.new( "ui_reticles_" .. f14_local4 .. "_lock_state" )
		local f14_local6 = LUI.AggregateDataSource.new( DataSources.inGame.SP.titan.c12Base, {
			DataSources.inGame.SP.titan.c12.missileCharge,
			DataSources.inGame.player.currentWeapon.clipAmmoRight,
			DataSources.inGame.SP.titan.c12Count
		}, "missileCharge." .. f14_local4, f0_local3( f14_local4 ) )
		DataSources.inGame.SP.titan.c12.missiles[f14_local1] = {
			targetEntity = LUI.DataSourceFromOmnvar.new( "ui_reticles_" .. f14_local4 .. "_target_ent" ),
			lockState = f14_local5,
			missileCharge = f14_local6,
			missileFired = f14_local5:Filter( "missileFired", f0_local4 ),
			progressText = f14_local6:Filter( "progressText", f0_local5 ),
			missileReady = f14_local6:Filter( "missileReady", f0_local6 )
		}
	end
	DataSources.inGame.SP.titan.c12.MakeDataSourceAtIndex = function ( f15_arg0, f15_arg1 )
		return DataSources.inGame.SP.titan.c12.missiles[LUI.clamp( f15_arg1, 0, f14_local0 - 1 )]
	end
	
	local f14_local1 = {}
	for f14_local2 = 0, f14_local0 - 1, 1 do
		local f14_local5 = DataSources.inGame.SP.titan.c12.missiles[f14_local2]
		assert( f14_local5 and f14_local5.lockState )
		table.insert( f14_local1, f14_local5.lockState )
	end
	DataSources.inGame.HUD.overlay.lockedTargets = LUI.AggregateDataSource.new( DataSources.inGame.HUD.base, f14_local1, "overlay.lockedTargets", f0_local7 )
end

local f0_local8 = function ( f16_arg0, f16_arg1 )
	if f16_arg0 == "iw7_jackal_support_designator" then
		return true
	else
		return false
	end
end

function InitPearlHarborDataSources()
	DataSources.inGame.SP.pearlHarbor.jackalStreakEquipped = DataSources.inGame.SP.dPad.action1.name:Filter( "ui_jackal_equipped", f0_local8 )
	DataSources.inGame.SP.pearlHarbor.jackalReady = LUI.DataSourceFromOmnvar.new( "ui_jackal_cooldown_done" )
	DataSources.inGame.SP.pearlHarbor.jackalCooldown = LUI.DataSourceFromOmnvar.new( "ui_jackal_meter" )
	DataSources.inGame.SP.pearlHarbor.jackalTargetsLocked = LUI.DataSourceFromOmnvar.new( "ui_active_targets" )
	DataSources.inGame.SP.pearlHarbor.hvtSelfDestruct = LUI.DataSourceFromOmnvar.new( "ui_hvt_selfdestruct" )
	DataSources.inGame.SP.pearlHarbor.hvtSelfDestructTimer = LUI.DataSourceFromOmnvar.new( "ui_hvt_selfdestruct_timer" )
end

local f0_local9 = function ( f18_arg0, f18_arg1 )
	local f18_local0 = SWATCHES.HUD.normal
	if f18_arg0 then
		f18_local0 = SWATCHES.HUD.highlight
	end
	return GetIntForColor( f18_local0 )
end

local f0_local10 = function ( f19_arg0 )
	return function ( f20_arg0, f20_arg1 )
		if Engine.IsBitSet( f20_arg0, f19_arg0 ) then
			return 1
		else
			return 0
		end
	end
	
end

local f0_local11 = function ( f21_arg0, f21_arg1 )
	return f21_arg0 ~= 0
end

function InitHeistSpaceDataSources()
	local f22_local0 = 21
	DataSources.inGame.SP.heistSpace.olympusMonsCaptainScreen = LUI.DataSourceFromOmnvar.new( "ui_olympus_mons_captain_screen" )
	DataSources.inGame.SP.heistSpace.olympusMonsDamageStateBits = LUI.DataSourceFromOmnvar.new( "ui_olympus_mons_damage_state" )
	DataSources.inGame.SP.heistSpace.olympusMonsDistance = LUI.DataSourceFromOmnvar.new( "ui_olympus_mons_distance" )
	DataSources.inGame.SP.heistSpace.olympusMonsOverlay = LUI.DataSourceFromOmnvar.new( "ui_olympus_mons_overlay" )
	DataSources.inGame.SP.heistSpace.olympusMonsOverlayShow = DataSources.inGame.SP.heistSpace.olympusMonsOverlay:Filter( "mons_overlay_show", f0_local11 )
	DataSources.inGame.SP.heistSpace.olympusMonsWeaponStatus = LUI.DataSourceFromOmnvar.new( "ui_olympus_mons_weapon_status" )
	DataSources.inGame.SP.heistSpace.olympusMonsHaveTarget = LUI.DataSourceFromOmnvar.new( "ui_olympus_mons_have_target" )
	DataSources.inGame.SP.heistSpace.olympusMonsReticleColor = DataSources.inGame.SP.heistSpace.olympusMonsHaveTarget:Filter( "mons_reticle_color", f0_local9 )
	DataSources.inGame.SP.heistSpace.olympusMonsOutOfRange = LUI.DataSourceFromOmnvar.new( "ui_olympus_mons_out_of_range" )
	for f22_local1 = 1, f22_local0, 1 do
		DataSources.inGame.SP.heistSpace["olympusMonsDamageStateLoc" .. f22_local1 .. "Alpha"] = DataSources.inGame.SP.heistSpace.olympusMonsDamageStateBits:Filter( "mons_damage_loc_" .. f22_local1 .. "_alpha", f0_local10( f22_local1 - 1 ) )
	end
end

function InitAssassinationDataSources()
	DataSources.inGame.SP.assassination.disguiseShow = LUI.DataSourceFromOmnvar.new( "ui_hud_disguise" )
end

function InitWoundedDataSources()
	DataSources.inGame.SP.wounded.lifeSupportState = LUI.DataSourceFromOmnvar.new( "ui_ship_assault_life_support" )
	DataSources.inGame.SP.wounded.lifeSupportHackReadyShow = DataSources.inGame.SP.wounded.lifeSupportState:Filter( "life_support_hack_ready_show", function ( f25_arg0 )
		return f25_arg0 == 1
	end )
	DataSources.inGame.SP.wounded.lifeSupportDisabledShow = DataSources.inGame.SP.wounded.lifeSupportState:Filter( "life_support_disabled_show", function ( f26_arg0 )
		return 1 < f26_arg0
	end )
end

function InitRogueAsteroidDataSources()
	DataSources.inGame.SP.rogueAsteroid.temperature = LUI.DataSourceFromOmnvar.new( "ui_rogue_asteroid_temperature" )
end

function InitMostWantedDataSources()
	local f28_local0 = {}
	local f28_local1 = Engine.TableGetRowCount( CSV.mostWanted.file )
	for f28_local2 = 0, f28_local1 - 1, 1 do
		local f28_local5 = CSV.ReadRow( CSV.mostWanted, f28_local2 )
		local f28_local6 = "cg.SP.mostWantedCards." .. f28_local2
		f28_local0[f28_local2 + 1] = {
			rank = LUI.DataSourceInGlobalModel.new( f28_local6 .. ".rank", f28_local5.rank ),
			name = LUI.DataSourceInGlobalModel.new( f28_local6 .. ".name", f28_local5.name ),
			image = LUI.DataSourceInGlobalModel.new( f28_local6 .. ".image", f28_local5.image ),
			age = LUI.DataSourceInGlobalModel.new( f28_local6 .. ".age", f28_local5.age ),
			homeWorld = LUI.DataSourceInGlobalModel.new( f28_local6 .. ".homeWorld", f28_local5.homeWorld ),
			branch = LUI.DataSourceInGlobalModel.new( f28_local6 .. ".branch", f28_local5.branch ),
			vessel = LUI.DataSourceInGlobalModel.new( f28_local6 .. ".vessel", f28_local5.vessel ),
			awards = LUI.DataSourceInGlobalModel.new( f28_local6 .. ".awards", f28_local5.awards ),
			bio = LUI.DataSourceInGlobalModel.new( f28_local6 .. ".bio", f28_local5.bio ),
			state = DataSources.inGame.SP.shipCrib.mostWantedDataState[f28_local5.identifier],
			identifier = LUI.DataSourceInGlobalModel.new( f28_local6 .. ".identifier", f28_local5.identifier ),
			bioIntel1 = LUI.DataSourceInGlobalModel.new( f28_local6 .. ".bioIntel1", f28_local5.bioIntel1 ),
			bioIntel2 = LUI.DataSourceInGlobalModel.new( f28_local6 .. ".bioIntel2", f28_local5.bioIntel2 ),
			bioIntel3 = LUI.DataSourceInGlobalModel.new( f28_local6 .. ".bioIntel3", f28_local5.bioIntel3 ),
			bioIntel4 = LUI.DataSourceInGlobalModel.new( f28_local6 .. ".bioIntel4", f28_local5.bioIntel4 ),
			bioIntelUnlocked = LUI.DataSourceInGlobalModel.new( f28_local6 .. ".bioIntelUnlocked", f28_local5.bioIntelUnlocked ),
			bioIntelLocked = LUI.DataSourceInGlobalModel.new( f28_local6 .. ".bioIntelLocked", f28_local5.bioIntelLocked )
		}
	end
	DataSources.inGame.SP.shipCrib.mostWantedList = LUI.DataSourceFromList.new( f28_local1 )
	DataSources.inGame.SP.shipCrib.mostWantedList.MakeDataSourceAtIndex = function ( f29_arg0, f29_arg1, f29_arg2 )
		if f28_local0[f29_arg1 + 1].state:GetValue( f29_arg2 ) == ShipCribUtils.MostWantedStates.LOCKED then
			f28_local0[f29_arg1 + 1].image:SetValue( f29_arg2, "most_wanted_portrait_unknown" )
		else
			f28_local0[f29_arg1 + 1].image:SetValue( f29_arg2, "most_wanted_portrait_" .. f28_local0[f29_arg1 + 1].identifier:GetValue( f29_arg2 ) )
		end
		return f28_local0[f29_arg1 + 1]
	end
	
	DataSources.inGame.SP.shipCrib.mostWantedBoard = LUI.DataSourceFromOmnvar.new( "ui_most_wanted_board_ent" )
	DataSources.inGame.SP.shipCrib.mostWantedBoardTag = LUI.DataSourceFromOmnvar.new( "ui_most_wanted_board_current_tag" )
end

function InitShipCribDataSources()
	DataSources.inGame.SP.shipCrib.mostWantedDataState = DataSources.alwaysLoaded.playerData.SP.spData.wantedBoardDataState
	DataSources.inGame.SP.shipCrib.dropshipTargetLock = LUI.DataSourceFromOmnvar.new( "ui_sc_dropship_lock" )
	DataSources.inGame.SP.shipCrib.tempMenuCounter = LUI.DataSourceFromOmnvar.new( "ui_temp_menu_counter" )
	DataSources.inGame.SP.shipCrib.capopsMissionMenuCounter = LUI.DataSourceFromOmnvar.new( "ui_capops_pc" )
	DataSources.inGame.SP.shipCrib.capopsIsAudio = LUI.DataSourceFromOmnvar.new( "ui_capops_is_audio" )
	DataSources.inGame.SP.shipCrib.capopsMediaTime = LUI.DataSourceFromOmnvar.new( "ui_capops_playback_bar" )
	InitMostWantedDataSources()
end

function InitShipCribEpilogueSources()
	DataSources.inGame.SP.shipCrib.epilogueLinesShow = LUI.DataSourceFromOmnvar.new( "ui_epilogue_lines" )
	DataSources.inGame.SP.shipCrib.epilogueLines.line1 = LUI.DataSourceFromOmnvar.new( "ui_epilogue_line1" )
	DataSources.inGame.SP.shipCrib.epilogueLines.line2 = LUI.DataSourceFromOmnvar.new( "ui_epilogue_line2" )
	DataSources.inGame.SP.shipCrib.epilogueLines.line3 = LUI.DataSourceFromOmnvar.new( "ui_epilogue_line3" )
	DataSources.inGame.SP.shipCrib.epilogueLines.line4 = LUI.DataSourceFromOmnvar.new( "ui_epilogue_line4" )
	DataSources.inGame.SP.shipCrib.mostWantedDataState = DataSources.alwaysLoaded.playerData.SP.spData.wantedBoardDataState
	DataSources.inGame.SP.shipCrib.dropshipTargetLock = LUI.DataSourceFromOmnvar.new( "ui_sc_dropship_lock" )
	DataSources.inGame.SP.shipCrib.tempMenuCounter = LUI.DataSourceFromOmnvar.new( "ui_temp_menu_counter" )
	DataSources.inGame.SP.shipCrib.capopsMissionMenuCounter = LUI.DataSourceFromOmnvar.new( "ui_capops_pc" )
	DataSources.inGame.SP.shipCrib.capopsIsAudio = LUI.DataSourceFromOmnvar.new( "ui_capops_is_audio" )
	DataSources.inGame.SP.shipCrib.capopsMediaTime = LUI.DataSourceFromOmnvar.new( "ui_capops_playback_bar" )
end

local f0_local12 = function ( f32_arg0, f32_arg1 )
	if f32_arg0 == "mars_killstreak" then
		return true
	else
		return false
	end
end

function InitMarsDataSources()
	DataSources.inGame.SP.mars.marsRemoteMissileState = LUI.DataSourceFromOmnvar.new( "ui_mars_remote_missile_state" )
	DataSources.inGame.SP.mars.marsRemoteMissileActive = DataSources.inGame.SP.mars.marsRemoteMissileState:Filter( "active", function ( f34_arg0 )
		return 0 < f34_arg0
	end )
	DataSources.inGame.SP.mars.marsRemoteMissileEquipped = DataSources.inGame.SP.dPad.action1.name:Filter( "ui_mars_remote_missile_equipped", f0_local12 )
	DataSources.inGame.SP.mars.marsRemoteMissileReady = LUI.DataSourceFromOmnvar.new( "ui_jackal_cooldown_done" )
	DataSources.inGame.SP.mars.marsRemoteMissileCooldown = LUI.DataSourceFromOmnvar.new( "ui_jackal_meter" )
end

function InitShipLogDataSources()
	DataSources.inGame.SP.shipLog.showShipLog = LUI.DataSourceFromOmnvar.new( "ui_shiplog" )
	DataSources.inGame.SP.shipLog.text = LUI.DataSourceFromOmnvar.new( "ui_shiplog_text" )
	DataSources.inGame.SP.shipLog.pageNumText = LUI.DataSourceFromOmnvar.new( "ui_shiplog_page_num_text" )
end

local f0_local13 = function ( f36_arg0, f36_arg1 )
	return f36_arg0 ~= 0
end

local f0_local14 = function ( f37_arg0 )
	local f37_local0 = DataSources.inGame.SP.helmetMeterOxygen:GetValue( f37_arg0 )
	local f37_local1 = DataSources.inGame.SP.helmetMeterTemperature:GetValue( f37_arg0 )
	if f37_local0 <= 30 or f37_local1 > 250 or f37_local1 < -250 or DataSources.inGame.SP.helmetMeterPressure:GetValue( f37_arg0 ) < 5 or DataSources.inGame.SP.helmetMetersForceVisible:GetValue( f37_arg0 ) then
		return 1
	else
		return 0
	end
end

local f0_local15 = function ( f38_arg0, f38_arg1 )
	local f38_local0 = f38_arg0
	local f38_local1 = 0
	return (LUI.clamp( f38_local0, -250, 250 ) + 250) / 500
end

local f0_local16 = function ( f39_arg0, f39_arg1 )
	return LUI.clamp( f39_arg0, 0, 10 )
end

local f0_local17 = {
	Off = 0,
	General = 1,
	Warning = 2,
	Critical = 3
}
local f0_local18 = function ( f40_arg0, f40_arg1 )
	local f40_local0 = SWATCHES.PIP.PIPMessageUndefined
	if f40_arg0 == f0_local17.General then
		f40_local0 = SWATCHES.PIP.PIPMessageGeneral
	elseif f40_arg0 == f0_local17.Warning then
		f40_local0 = SWATCHES.PIP.PIPMessageWarning
	elseif f40_arg0 == f0_local17.Critical then
		f40_local0 = SWATCHES.PIP.PIPMessageCritical
	end
	return GetIntForColor( f40_local0 )
end

local f0_local19 = function ( f41_arg0, f41_arg1 )
	return f41_arg0 ~= 0
end

local f0_local20 = function ( f42_arg0 )
	return tostring( DataSources.inGame.SP.curretLootRooms:GetValue( f42_arg0 ) ) .. "/" .. tostring( DataSources.inGame.SP.totalLootRooms:GetValue( f42_arg0 ) )
end

function InitSPPowersDataSources()
	local f43_local0 = DataSources.inGame.player.primaryStoredPower
	local f43_local1 = DataSources.inGame.player.secondaryStoredPower
	f43_local0.base = LUI.DataSourceInControllerModel.new( "cg.player.primaryStoredPower" )
	f43_local0.id = LUI.DataSourceFromOmnvar.new( "ui_power_id_stored" )
	f43_local0.numCharges = LUI.DataSourceFromOmnvar.new( "ui_power_stored_num_charges" )
	f43_local0.rechargeProgress = LUI.DataSourceFromOmnvar.new( "ui_power_stored_recharge" )
	f43_local0.consumption = LUI.DataSourceFromOmnvar.new( "ui_power_stored_consume" )
	f43_local0.icon = DataSources.inGame.player.primaryStoredPower.id:Filter( "icon", PowerDataSourceHelpers.PowerIconFilter )
	f43_local0.iconAlpha = DataSources.inGame.player.primaryStoredPower.id:Filter( "iconAlpha", PowerDataSourceHelpers.PowerIconAlphaFilter )
	f43_local0.name = DataSources.inGame.player.primaryStoredPower.id:Filter( "name", PowerDataSourceHelpers.PowerNameFilter )
	f43_local0.reference = DataSources.inGame.player.primaryStoredPower.id:Filter( "reference", PowerDataSourceHelpers.PowerReferenceFilter )
	f43_local0.type = DataSources.inGame.player.primaryStoredPower.id:Filter( "type", PowerDataSourceHelpers.PowerTypeFilter )
	f43_local0.lowPower = DataSources.inGame.player.primaryStoredPower.id:Filter( "lowPower", PowerDataSourceHelpers.PowerLowThresholdFilter )
	f43_local0.powerDisabled = LUI.DataSourceFromOmnvar.new( "ui_power_stored_disabled" )
	if Engine.IsCoreMode() then
		f43_local0.powerChargingState = LUI.DataSourceFromOmnvar.new( "ui_power_primary_stored_state" )
	else
		f43_local0.powerChargingState = LUI.DataSourceInGlobalModel.new( "cg.SP.power.primary.stored.defaultState", 0 )
	end
	local f43_local2 = {
		f43_local0.numCharges,
		f43_local0.rechargeProgress,
		f43_local0.consumption,
		f43_local0.type
	}
	table.insert( f43_local2, f43_local0.powerDisabled )
	f43_local0.color = LUI.AggregateDataSource.new( f43_local0.base, f43_local2, "color", function ( f44_arg0 )
		return PowerDataSourceHelpers.PowerColorFilterHelper( f43_local0, SWATCHES.powers.active, f44_arg0 )
	end )
	f43_local0.iconColor = LUI.AggregateDataSource.new( f43_local0.base, f43_local2, "iconColor", function ( f45_arg0 )
		return PowerDataSourceHelpers.PowerColorFilterHelper( f43_local0, SWATCHES.HUD.stable, f45_arg0 )
	end )
	f43_local0.buttonColor = LUI.AggregateDataSource.new( f43_local0.base, f43_local2, "buttonColor", function ( f46_arg0 )
		return PowerDataSourceHelpers.PowerButtonColorFilter( f43_local0, SWATCHES.HUD.stable, f46_arg0 )
	end )
	f43_local0.numAlpha = LUI.AggregateDataSource.new( f43_local0.base, f43_local2, "numAlpha", function ( f47_arg0 )
		return PowerDataSourceHelpers.NumberAlphaFilter( f43_local0, f47_arg0 )
	end )
	f43_local1.base = LUI.DataSourceInControllerModel.new( "cg.player.secondaryStoredPower" )
	f43_local1.id = LUI.DataSourceFromOmnvar.new( "ui_power_id_secondary_stored" )
	f43_local1.numCharges = LUI.DataSourceFromOmnvar.new( "ui_power_secondary_stored_num_charges" )
	f43_local1.icon = DataSources.inGame.player.secondaryStoredPower.id:Filter( "icon", PowerDataSourceHelpers.PowerIconFilter )
	f43_local1.iconAlpha = DataSources.inGame.player.secondaryStoredPower.id:Filter( "iconAlpha", PowerDataSourceHelpers.PowerIconAlphaFilter )
	f43_local1.name = DataSources.inGame.player.secondaryStoredPower.id:Filter( "name", PowerDataSourceHelpers.PowerNameFilter )
	f43_local1.reference = DataSources.inGame.player.secondaryStoredPower.id:Filter( "reference", PowerDataSourceHelpers.PowerReferenceFilter )
	if Engine.IsCoreMode() then
		f43_local1.powerChargingState = LUI.DataSourceFromOmnvar.new( "ui_power_secondary_stored_state" )
	else
		f43_local1.powerChargingState = LUI.DataSourceInGlobalModel.new( "cg.SP.power.secondary.stored.defaultState", 0 )
	end
	f43_local1.consumptionOnmvar = LUI.DataSourceFromOmnvar.new( "ui_power_secondary_stored_consume" )
	f43_local1.consumption = LUI.AggregateDataSource.new( f43_local1.base, {
		f43_local1.consumptionOnmvar,
		f43_local1.reference,
		DataSources.inGame.player.ShieldIsDeployed
	}, "consumptionState", function ( f48_arg0 )
		return PowerDataSourceHelpers.PowerConsumptionFilter( f43_local1, f48_arg0 )
	end )
	f43_local1.rechargeOmnvar = LUI.DataSourceFromOmnvar.new( "ui_power_secondary_stored_recharge" )
	f43_local1.rechargeProgress = LUI.AggregateDataSource.new( f43_local1.base, {
		f43_local1.rechargeOmnvar,
		f43_local1.reference,
		DataSources.inGame.player.shieldEnergy,
		DataSources.inGame.player.maxShieldEnergy
	}, "rechargeProgress", function ( f49_arg0 )
		return PowerDataSourceHelpers.PowerChargeFilter( f43_local1, f49_arg0 )
	end )
	f43_local1.type = DataSources.inGame.player.secondaryStoredPower.id:Filter( "type", PowerDataSourceHelpers.PowerTypeFilter )
	f43_local1.lowPower = DataSources.inGame.player.secondaryStoredPower.id:Filter( "lowPower", PowerDataSourceHelpers.PowerLowThresholdFilter )
	f43_local1.powerDisabledOnvmar = LUI.DataSourceFromOmnvar.new( "ui_power_secondary_stored_disabled" )
	f43_local1.powerDisabled = LUI.AggregateDataSource.new( f43_local1.base, {
		f43_local1.powerDisabledOnvmar,
		f43_local1.reference,
		DataSources.inGame.player.shieldCanDeploy
	}, "powerIsDisabled", function ( f50_arg0 )
		return PowerDataSourceHelpers.PowerDisabledFilter( f43_local1, f50_arg0 )
	end )
	local f43_local3 = {
		f43_local1.id,
		f43_local1.powerDisabled,
		f43_local1.numCharges,
		f43_local1.rechargeProgress,
		f43_local1.consumption,
		f43_local1.type,
		f43_local1.reference,
		DataSources.inGame.player.shieldEnergy,
		DataSources.inGame.player.maxShieldEnergy
	}
	table.insert( f43_local3, f43_local1.powerDisabled )
	f43_local1.color = LUI.AggregateDataSource.new( f43_local1.base, f43_local3, "color", function ( f51_arg0 )
		return PowerDataSourceHelpers.PowerColorFilterHelper( f43_local1, SWATCHES.HUD.stable, f51_arg0 )
	end )
	f43_local1.iconColor = LUI.AggregateDataSource.new( f43_local1.base, f43_local3, "iconColor", function ( f52_arg0 )
		return PowerDataSourceHelpers.PowerColorFilterHelper( f43_local1, SWATCHES.HUD.stable, f52_arg0 )
	end )
	f43_local1.buttonColor = LUI.AggregateDataSource.new( f43_local1.base, f43_local3, "buttonColor", function ( f53_arg0 )
		return PowerDataSourceHelpers.PowerButtonColorFilter( f43_local1, SWATCHES.HUD.stable, f53_arg0 )
	end )
	f43_local1.numAlpha = LUI.AggregateDataSource.new( f43_local1.base, f43_local3, "numAlpha", function ( f54_arg0 )
		return PowerDataSourceHelpers.NumberAlphaFilter( f43_local1, f54_arg0 )
	end )
end

function InitCommonSPHUDDataSources()
	DataSources.alwaysLoaded.playerData.SP = LUI.DataSourceFromPlayerData.new( CoD.ProgressionBlob.Gold, CoD.PlayMode.SP )
	DataSources.inGame.SP.activeHUD = LUI.DataSourceFromOmnvar.new( "ui_active_hud" )
	DataSources.inGame.SP.opsMap.active = LUI.DataSourceInControllerModel.new( "cg.SP.opsMap.active" )
	DataSources.inGame.SP.deadQuote = LUI.DataSourceInControllerModel.new( "cg.SP.deadQuote" )
	DataSources.inGame.SP.weaponScanned = LUI.DataSourceFromOmnvar.new( "ui_weapon_scanned" )
	DataSources.inGame.SP.weaponScannedUnique = LUI.DataSourceFromOmnvar.new( "ui_weapon_scanned_unique" )
	DataSources.inGame.SP.showTemperatureGauge = LUI.DataSourceFromOmnvar.new( "ui_show_temperature_gauge" )
	DataSources.inGame.SP.helmetState = LUI.DataSourceFromOmnvar.new( "ui_helmet_state" )
	DataSources.inGame.SP.helmetMeterOxygen = LUI.DataSourceFromOmnvar.new( "ui_helmet_meter_oxygen" )
	DataSources.inGame.SP.helmetMeterTemperature = LUI.DataSourceFromOmnvar.new( "ui_helmet_meter_temperature" )
	DataSources.inGame.SP.helmetMeterTemperatureFill = DataSources.inGame.SP.helmetMeterTemperature:Filter( "fill", f0_local15 )
	DataSources.inGame.SP.helmetMeterPressure = LUI.DataSourceFromOmnvar.new( "ui_helmet_meter_pressure" )
	DataSources.inGame.SP.helmetMeterPressureFill = DataSources.inGame.SP.helmetMeterPressure:Filter( "fill", f0_local16 )
	DataSources.inGame.SP.helmetMetersForceVisible = LUI.DataSourceFromOmnvar.new( "ui_helmet_meter_forceVisible" )
	DataSources.inGame.SP.helmetMeters = LUI.DataSourceInControllerModel.new( "cg.SP.helmetMeters" )
	DataSources.inGame.SP.helmetMetersAlpha = LUI.AggregateDataSource.new( DataSources.inGame.SP.helmetMeters, {
		DataSources.inGame.SP.helmetMeterOxygen,
		DataSources.inGame.SP.helmetMeterTemperature,
		DataSources.inGame.SP.helmetMeterPressure,
		DataSources.inGame.SP.helmetMetersForceVisible
	}, "helmetMetersAlpha", f0_local14 )
	DataSources.inGame.SP.filesAcquired = LUI.DataSourceFromOmnvar.new( "ui_files_acquired" )
	DataSources.inGame.SP.lootUnlocked = LUI.DataSourceFromOmnvar.new( "ui_loot_unlocked" )
	DataSources.inGame.SP.showPIP = LUI.DataSourceFromOmnvar.new( "ui_show_pip" )
	DataSources.inGame.SP.showBink = LUI.DataSourceFromOmnvar.new( "ui_show_bink" )
	DataSources.inGame.SP.showCompass = LUI.DataSourceFromOmnvar.new( "ui_show_compass" )
	DataSources.inGame.SP.pipMessageTextTop = LUI.DataSourceFromOmnvar.new( "ui_pip_message_text_top" )
	DataSources.inGame.SP.pipMessageTextBottom = LUI.DataSourceFromOmnvar.new( "ui_pip_message_text_bottom" )
	DataSources.inGame.SP.pipMessageType = LUI.DataSourceFromOmnvar.new( "ui_pip_message_type" )
	DataSources.inGame.SP.pipMessageColor = DataSources.inGame.SP.pipMessageType:Filter( "pipMessageColor", f0_local18 )
	DataSources.inGame.SP.showARElement = LUI.DataSourceFromOmnvar.new( "ui_show_ar_elem" )
	DataSources.inGame.SP.showIntelWaypoint = LUI.DataSourceFromOmnvar.new( "ui_sp_intel_messaging_ent" )
	DataSources.inGame.SP.textARElement = LUI.DataSourceFromOmnvar.new( "ui_ar_object_text" )
	DataSources.inGame.SP.savingCheckpoint = LUI.DataSourceInGlobalModel.new( "cg.sp.savingCheckpoint" )
	DataSources.inGame.SP.savingCheckpointSucceeded = LUI.DataSourceInGlobalModel.new( "cg.sp.savingCheckpointSucceeded" )
	DataSources.inGame.SP.storedEquipmentShow = LUI.DataSourceFromOmnvar.new( "ui_power_stored_show" )
	DataSources.inGame.SP.secondaryStoredEquipmentShow = LUI.DataSourceFromOmnvar.new( "ui_power_secondary_stored_show" )
	DataSources.inGame.SP.levelTransition = LUI.DataSourceFromOmnvar.new( "ui_level_transition" )
	DataSources.inGame.SP.levelTransitionActive = DataSources.inGame.SP.levelTransition:Filter( "levelTransitionActive", function ( f56_arg0 )
		return 0 < f56_arg0
	end )
	DataSources.inGame.SP.radio = LUI.DataSourceFromOmnvar.new( "ui_hud_radio" )
	DataSources.inGame.SP.hackingTime = LUI.DataSourceFromOmnvar.new( "ui_hacking_time" )
	DataSources.inGame.SP.hackingState = LUI.DataSourceFromOmnvar.new( "ui_hacking_state" )
	DataSources.inGame.SP.showHack = DataSources.inGame.SP.hackingTime:Filter( "showHack", f0_local13 )
	DataSources.inGame.SP.SPFluffMessage = LUI.DataSourceFromOmnvar.new( "ui_sp_fluff_messaging" )
	DataSources.inGame.SP.SPFluffMessageContext = LUI.DataSourceFromOmnvar.new( "ui_sp_fluff_messaging_context" )
	DataSources.inGame.SP.SPMessageBodyText = LUI.DataSourceFromOmnvar.new( "ui_sp_intel_messaging_text" )
	DataSources.inGame.SP.SPMessageHeaderText = LUI.DataSourceFromOmnvar.new( "ui_sp_intel_messaging_header" )
	DataSources.inGame.SP.SPMessageImageIndex = LUI.DataSourceFromOmnvar.new( "ui_sp_intel_messaging_image_index" )
	DataSources.inGame.SP.SPIntelMessage = LUI.DataSourceFromOmnvar.new( "ui_sp_intel_messaging" )
	DataSources.inGame.SP.showIntelMessage = DataSources.inGame.SP.SPIntelMessage:Filter( "showIntelMessage", f0_local19 )
	DataSources.inGame.SP.intelImage = LUI.DataSourceInGlobalModel.new( "inGame.SP.CAC.IntelWidget", Engine.TableLookupByRow( CSV.IntelMessage.file, Game.GetOmnvar( "ui_sp_intel_messaging_image_index" ), CSV.IntelMessage.cols.image ) )
	DataSources.inGame.SP.abilityPrimaryVisibility = LUI.DataSourceFromOmnvar.new( "ui_hud_ability_primary" )
	DataSources.inGame.SP.abilitySecondaryVisibility = LUI.DataSourceFromOmnvar.new( "ui_hud_ability_secondary" )
	DataSources.inGame.SP.player.getToCoverState = LUI.DataSourceFromOmnvar.new( "ui_gettocover_state" )
	DataSources.inGame.SP.player.getToCoverText = LUI.DataSourceFromOmnvar.new( "ui_gettocover_text" )
	DataSources.inGame.SP.hudTintColor = LUI.DataSourceFromOmnvar.new( "ui_hud_tint_color_int" )
	DataSources.inGame.SP.textCapopsReport = LUI.DataSourceFromOmnvar.new( "ui_capops_report_text" )
	DataSources.inGame.SP.textCapopsPersonnel = LUI.DataSourceFromOmnvar.new( "ui_capops_personnel_text" )
	DataSources.inGame.SP.inVR = LUI.DataSourceFromOmnvar.new( "ui_in_vr" )
	DataSources.inGame.SP.totalLootRooms = LUI.DataSourceFromOmnvar.new( "ui_total_loot_rooms" )
	DataSources.inGame.SP.curretLootRooms = LUI.DataSourceFromOmnvar.new( "ui_current_loot_rooms" )
	DataSources.inGame.SP.lootRoomsFraction = LUI.AggregateDataSource.new( DataSources.inGame.SP.base, {
		DataSources.inGame.SP.totalLootRooms,
		DataSources.inGame.SP.curretLootRooms
	}, "lootRoomsFraction", f0_local20 )
	DataSources.inGame.SP.showHackingTerminal = LUI.DataSourceFromOmnvar.new( "ui_inworld_terminal_on" )
	DataSources.inGame.SP.startHackingTerminal = LUI.DataSourceFromOmnvar.new( "ui_inworld_terminal_hack" )
	DataSources.inGame.SP.inSpace = LUI.DataSourceFromOmnvar.new( "ui_hud_in_space" )
	DataSources.inGame.SP.shipCrib.loadoutTutIndex = LUI.DataSourceFromOmnvar.new( "ui_loadout_tut_index" )
	DataSources.inGame.SP.loadoutDisableInput = LUI.DataSourceFromOmnvar.new( "ui_loadouts_menu_disabled" )
	DataSources.inGame.SP.loadoutTutString = LUI.DataSourceFromOmnvar.new( "ui_loadout_tut_string" )
end

local f0_local21 = 1
local f0_local22 = 1
local f0_local23 = function ( f57_arg0 )
	for f57_local0 = 1, Game.GetActionSlotCount(), 1 do
		local f57_local3 = DataSources.inGame.SP.dPad
		local f57_local4 = "action"
		f57_local3 = f57_local3["action" .. f57_local0].material:GetValue( f57_arg0 )
		if f57_local3 and f57_local3 ~= "" then
			return true
		end
	end
	return false
end

local f0_local24 = function ( f58_arg0 )
	if Game.GetOmnvar( "ui_hide_dpad_hud" ) then
		return 0
	end
	for f58_local0 = 1, Game.GetActionSlotCount(), 1 do
		local f58_local3 = DataSources.inGame.SP.dPad
		local f58_local4 = "action"
		if f58_local3["action" .. f58_local0].isActive:GetValue( f58_arg0 ) then
			return f0_local21
		end
	end
	return f0_local22
end

local f0_local25 = function ( f59_arg0, f59_arg1 )
	if Game.GetOmnvar( "ui_hide_dpad_hud" ) then
		return 0
	else
		local f59_local0
		if f59_arg0 then
			f59_local0 = 1
			if not f59_local0 then
			
			else
				return f59_local0
			end
		end
	end
	f59_local0 = 0.25
end

function InitDPadDataSources()
	local f60_local0 = {}
	local f60_local1 = {}
	for f60_local2 = 1, Game.GetActionSlotCount(), 1 do
		local f60_local5 = f60_local2
		DataSources.inGame.SP.dPad["action" .. f60_local5] = {}
		DataSources.inGame.SP.dPad["action" .. f60_local5].base = LUI.DataSourceInControllerModel.new( "cg.SP.dPadActions" .. f60_local5 - 1 )
		DataSources.inGame.SP.dPad["action" .. f60_local5].name = LUI.DataSourceInControllerModel.new( "cg.SP.dPadActions.name." .. f60_local5 - 1 )
		DataSources.inGame.SP.dPad["action" .. f60_local5].isActive = LUI.DataSourceInControllerModel.new( "cg.SP.dPadActions.isActive." .. f60_local5 - 1 )
		DataSources.inGame.SP.dPad["action" .. f60_local5].material = LUI.DataSourceInControllerModel.new( "cg.SP.dPadActions.material." .. f60_local5 - 1 )
		local f60_local6 = function ( f61_arg0 )
			local f61_local0 = DataSources.inGame.SP.dPad
			local f61_local1 = "action"
			f61_local0 = f61_local0["action" .. f60_local5].material:GetValue( f61_arg0 )
			if not f61_local0 or f61_local0 == "" then
				return 0
			else
				return 1
			end
		end
		
		local f60_local7 = DataSources.inGame.SP.dPad["action" .. f60_local5]
		local f60_local8 = LUI.AggregateDataSource.new
		local f60_local9 = DataSources.inGame.SP.dPad
		local f60_local10 = "action"
		f60_local9 = f60_local9["action" .. f60_local5].base
		f60_local10 = {}
		local f60_local11 = DataSources.inGame.SP.dPad
		local f60_local12 = "action"
		f60_local11 = f60_local11["action" .. f60_local5].isActive
		f60_local12 = DataSources.inGame.SP.dPad
		local f60_local13 = "action"
		f60_local12 = f60_local12["action" .. f60_local5].material
		f60_local10[1] = f60_local11
		f60_local10[2] = f60_local12
		f60_local7.alpha = f60_local8( f60_local9, f60_local10, "alpha", f60_local6 )
		DataSources.inGame.SP.dPad["action" .. f60_local5].ammo = LUI.DataSourceInControllerModel.new( "cg.SP.dPadActions.ammo." .. f60_local5 - 1 )
		f60_local7 = function ( f62_arg0 )
			local f62_local0 = DataSources.inGame.SP.dPad
			local f62_local1 = "action"
			f62_local0 = f62_local0["action" .. f60_local5].ammo:GetValue( f62_arg0 )
			f62_local1 = DataSources.inGame.SP.dPad
			local f62_local2 = "action"
			f62_local1 = f62_local1["action" .. f60_local5].alpha:GetValue( f62_arg0 )
			if f62_local0 == -1 then
				f62_local2 = 0
				if not f62_local2 then
				
				else
					return f62_local2
				end
			end
			f62_local2 = f62_local1
		end
		
		f60_local8 = DataSources.inGame.SP.dPad["action" .. f60_local5]
		f60_local9 = LUI.AggregateDataSource.new
		f60_local10 = DataSources.inGame.SP.dPad
		f60_local11 = "action"
		f60_local10 = f60_local10["action" .. f60_local5].base
		f60_local11 = {}
		f60_local12 = DataSources.inGame.SP.dPad
		f60_local13 = "action"
		f60_local12 = f60_local12["action" .. f60_local5].ammo
		f60_local13 = DataSources.inGame.SP.dPad
		local f60_local14 = "action"
		f60_local13 = f60_local13["action" .. f60_local5].alpha
		f60_local11[1] = f60_local12
		f60_local11[2] = f60_local13
		f60_local8.ammoAlpha = f60_local9( f60_local10, f60_local11, "ammoAlpha", f60_local7 )
		f60_local8 = table.insert
		f60_local9 = f60_local0
		f60_local10 = DataSources.inGame.SP.dPad
		f60_local11 = "action"
		f60_local8( f60_local9, f60_local10["action" .. f60_local5].isActive )
		f60_local8 = table.insert
		f60_local9 = f60_local1
		f60_local10 = DataSources.inGame.SP.dPad
		f60_local11 = "action"
		f60_local8( f60_local9, f60_local10["action" .. f60_local5].material )
	end
	DataSources.inGame.SP.dPad.inUse = LUI.AggregateDataSource.new( DataSources.inGame.SP.base, f60_local1, "dPadinUse", f0_local23 )
	DataSources.inGame.SP.dPad.containerAlpha = DataSources.inGame.SP.dPad.inUse:Filter( "cg.SP.dPadContainerAlpha", f0_local25 )
	DataSources.inGame.SP.dPad.backgroundAlpha = LUI.AggregateDataSource.new( DataSources.inGame.SP.base, f60_local0, "dPadBackgroundAlpha", f0_local24 )
end

function InitContextualGaugeDataSources()
	DataSources.inGame.SP.contextualGauges.fill = LUI.DataSourceFromOmnvar.new( "ui_warning_gauge_fill" )
	DataSources.inGame.SP.contextualGauges.gaugeName = LUI.DataSourceFromOmnvar.new( "ui_warning_gauge_name" )
end

function MissionCountdownShowFilter( f64_arg0, f64_arg1 )
	local f64_local0
	if Game.GetTime() >= f64_arg0 or DataSources.inGame.SP.missionCountdown.missionText:GetValue( f64_arg1 ) == "none" or DataSources.inGame.SP.hackEthanControlOverlay:GetValue( f64_arg1 ) == nil or DataSources.inGame.SP.hackEthanControlOverlay:GetValue( f64_arg1 ) ~= 0 then
		f64_local0 = false
	else
		f64_local0 = true
	end
	return f64_local0
end

function InitMissionCountdownDataSources()
	DataSources.inGame.SP.missionCountdown.missionText = LUI.DataSourceFromOmnvar.new( "ui_countdown_mission_text" )
	DataSources.inGame.SP.missionCountdown.timer = LUI.DataSourceFromOmnvar.new( "ui_countdown_timer" )
	DataSources.inGame.SP.missionCountdown.show = DataSources.inGame.SP.missionCountdown.timer:Filter( "cg.SP.missionCountdownShow", MissionCountdownShowFilter )
end

local f0_local26 = function ( f66_arg0, f66_arg1 )
	if f66_arg0 then
		return Engine.TableLookup( CSV.deathHints.file, CSV.deathHints.cols.index, tostring( f66_arg0 ), CSV.deathHints.cols.icon )
	else
		
	end
end

local f0_local27 = function ( f67_arg0, f67_arg1 )
	if Engine.TableLookup( CSV.deathHints.file, CSV.deathHints.cols.index, tostring( f67_arg0 ), CSV.deathHints.cols.icon ) == "" then
		return 0
	else
		return 1
	end
end

local f0_local28 = function ( f68_arg0, f68_arg1 )
	if f68_arg0 == 0 then
		return ""
	elseif f68_arg0 ~= nil then
		return Engine.Localize( Engine.TableLookup( CSV.deathHints.file, CSV.deathHints.cols.index, tostring( f68_arg0 ), CSV.deathHints.cols.text ) )
	else
		
	end
end

function InitDeathHintDataSources()
	DataSources.inGame.SP.deathHint.id = LUI.DataSourceFromOmnvar.new( "ui_death_hint" )
	DataSources.inGame.SP.deathHint.deathIcon = DataSources.inGame.SP.deathHint.id:Filter( "deathIcon", f0_local26 )
	DataSources.inGame.SP.deathHint.deathQuote = DataSources.inGame.SP.deathHint.id:Filter( "deathQuote", f0_local28 )
	DataSources.inGame.SP.deathHint.deathIconAlpha = DataSources.inGame.SP.deathHint.id:Filter( "deathIconAlpha", f0_local27 )
end

function InitEquipmentDataSource()
	DataSources.inGame.SP.hackTargeting = LUI.DataSourceFromOmnvar.new( "ui_hack_targeting" )
	DataSources.inGame.SP.hackTargetingStatus = LUI.DataSourceFromOmnvar.new( "ui_hack_targeting_status" )
	DataSources.inGame.SP.hackTargetingPing = LUI.DataSourceFromOmnvar.new( "ui_hack_targeting_ping" )
	DataSources.inGame.SP.hackTargetingDamage = LUI.DataSourceFromOmnvar.new( "ui_hack_targeting_damage" )
	DataSources.inGame.SP.hackControlOverlay = LUI.DataSourceFromOmnvar.new( "ui_hack_control_overlay" )
	DataSources.inGame.SP.hackControlOutro = LUI.DataSourceFromOmnvar.new( "ui_hack_control_outro" )
	DataSources.inGame.SP.hackControlRobotType = LUI.DataSourceFromOmnvar.new( "ui_hack_control_robot_type" )
	DataSources.inGame.SP.hackControlSignalFailing = LUI.DataSourceFromOmnvar.new( "ui_hack_control_signal_failing" )
	DataSources.inGame.SP.hackControlSelfDestruct = LUI.DataSourceFromOmnvar.new( "ui_hack_control_selfdestruct" )
	DataSources.inGame.SP.hackControlSelfDestructTimer = LUI.DataSourceFromOmnvar.new( "ui_hack_control_selfdestruct_timer" )
	DataSources.inGame.SP.hackControlSelfDestructShowTimer = LUI.DataSourceFromOmnvar.new( "ui_hack_control_selfdestruct_show_timer" )
	DataSources.inGame.SP.hackTargetEntity = LUI.DataSourceFromOmnvar.new( "ui_hack_target_entity" )
	DataSources.inGame.SP.hackEthanControlOverlay = LUI.DataSourceFromOmnvar.new( "ui_hack_ethan_overlay" )
	DataSources.inGame.SP.hackEthanOverlayGlitchState = LUI.DataSourceFromOmnvar.new( "ui_hack_ethan_overlay_glitch_state" )
	DataSources.inGame.SP.offhandShieldInUse = LUI.DataSourceFromOmnvar.new( "ui_offhandshield_in_use" )
	local f70_local0 = 5
	local f70_local1 = 20
	DataModel.SetModelValue( DataModel.CreateModel( DataModel.GetGlobalModel(), "cg.SP.droneInfo.maxDroneCount" ), f70_local0 )
	DataSources.inGame.SP.droneInfo.maxDroneCount = LUI.DataSourceInGlobalModel.new( "cg.SP.droneInfo.maxDroneCount" )
	DataSources.inGame.SP.droneInfo.activeDroneBits = LUI.DataSourceFromOmnvar.new( "ui_supdrone_bits" )
	DataSources.inGame.SP.droneInfo.activeDroneCount = DataSources.inGame.SP.droneInfo.activeDroneBits:Filter( "activeDroneCount", f0_local0 )
	DataSources.inGame.SP.droneInfo.activeDrones = LUI.DataSourceFromList.new( DataSources.inGame.SP.droneInfo.maxDroneCount )
	DataSources.inGame.SP.droneInfo.activeDrones.drones = {}
	DataSources.inGame.SP.droneInfo.trophyActive = LUI.DataSourceFromOmnvar.new( "ui_supdrone_trophyactive" )
	for f70_local2 = 0, f70_local0 - 1, 1 do
		local f70_local5 = LUI.DataSourceFromOmnvar.new( "ui_supdrone_ammo_" .. f70_local2 )
		DataSources.inGame.SP.droneInfo.activeDrones.drones[f70_local2] = {
			ammoCount = f70_local5,
			ammoBarPercent = f70_local5:Filter( "ammoBarPercent", function ( f71_arg0 )
				return f71_arg0 / f70_local1
			end
			 ),
			state = LUI.DataSourceFromOmnvar.new( "ui_supdrone_state_" .. f70_local2 )
		}
	end
	DataSources.inGame.SP.droneInfo.activeDrones.MakeDataSourceAtIndex = function ( f72_arg0, f72_arg1, f72_arg2 )
		return DataSources.inGame.SP.droneInfo.activeDrones.drones[f72_arg1 - 1]
	end
	
	local f70_local2 = 8
	DataSources.inGame.SP.fragReticles = {}
	for f70_local3 = 0, f70_local2 - 1, 1 do
		local f70_local7 = Mirror( f70_local3, 0, f70_local2 - 1 )
		DataSources.inGame.SP.fragReticles[f70_local3] = {
			targetEntity = LUI.DataSourceFromOmnvar.new( "ui_reticles_" .. f70_local7 .. "_target_ent" ),
			state = LUI.DataSourceFromOmnvar.new( "ui_reticles_" .. f70_local7 .. "_lock_state" )
		}
	end
	DataSources.inGame.SP.MakeDataSourceAtIndex = function ( f73_arg0, f73_arg1 )
		return DataSources.inGame.SP.fragReticles[LUI.clamp( f73_arg1, 0, f70_local2 - 1 )]
	end
	
end

function InitWeaponDataSource()
	DataSources.inGame.SP.lockonADS = LUI.DataSourceFromOmnvar.new( "ui_lockon_ads" )
end

local f0_local29 = function ( f75_arg0, f75_arg1 )
	local f75_local0
	if f75_arg0 then
		f75_local0 = 1
		if not f75_local0 then
		
		else
			return f75_local0
		end
	end
	f75_local0 = 0
end

local f0_local30 = function ( f76_arg0, f76_arg1 )
	return math.ceil( f76_arg0 / 2 )
end

local f0_local31 = function ( f77_arg0, f77_arg1 )
	return math.floor( f77_arg0 / 2 )
end

local f0_local32 = function ( f78_arg0 )
	return function ( f79_arg0, f79_arg1 )
		local f79_local0
		if f79_arg0 < f78_arg0 then
			f79_local0 = 0.2
			if not f79_local0 then
			
			else
				return f79_local0
			end
		end
		f79_local0 = 1
	end
	
end

local f0_local33 = function ( f80_arg0 )
	local f80_local0 = DataSources.inGame.jackal
	local f80_local1 = f80_local0.thrustPercent:GetValue( f80_arg0 )
	local f80_local2 = f80_local0.minStartThrustPercent:GetValue( f80_arg0 )
	local f80_local3
	if f80_local1 == nil or f80_local2 == nil or f80_local1 >= f80_local2 then
		f80_local3 = false
	else
		f80_local3 = true
	end
	local f80_local4
	if f80_local3 then
		f80_local4 = SWATCHES.jackal.thrustBarWarning
		if not f80_local4 then
		
		else
			return GetIntForColor( f80_local4 )
		end
	end
	f80_local4 = SWATCHES.jackal.thrustBarStable
end

local f0_local34 = function ( f81_arg0 )
	local f81_local0 = DataSources.inGame.jackal
	local f81_local1 = f81_local0.thrustPercent:GetValue( f81_arg0 )
	local f81_local2 = f81_local0.minStartThrustPercent:GetValue( f81_arg0 )
	local f81_local3
	if f81_local1 == nil or f81_local2 == nil or f81_local1 >= f81_local2 then
		f81_local3 = false
	else
		f81_local3 = true
	end
	return f81_local3
end

local f0_local35 = function ( f82_arg0 )
	local f82_local0 = DataSources.inGame.jackal
	local f82_local1 = f82_local0.isThrusting:GetValue( f82_arg0 )
	local f82_local2 = f82_local0.isThrustRecharging:GetValue( f82_arg0 )
	local f82_local3 = ""
	if f82_local1 and not f82_local2 then
		f82_local3 = Engine.Localize( "JACKAL_THRUSTERS_ENGAGED" )
	elseif f82_local2 and not f82_local1 then
		f82_local3 = Engine.Localize( "JACKAL_THRUSTERS_RECHARGING" )
	end
	return f82_local3
end

local f0_local36 = function ( f83_arg0 )
	local f83_local0 = DataSources.inGame.jackal
	local f83_local1 = f83_local0.thrustPercent:GetValue( f83_arg0 )
	local f83_local2 = f83_local0.minStartThrustPercent:GetValue( f83_arg0 )
	local f83_local3
	if f83_local1 == nil or f83_local2 == nil or f83_local1 >= f83_local2 then
		f83_local3 = false
	else
		f83_local3 = true
	end
	local f83_local4
	if f83_local3 then
		f83_local4 = SWATCHES.jackal.thrustBarWarning
		if not f83_local4 then
		
		else
			return GetIntForColor( f83_local4 )
		end
	end
	f83_local4 = SWATCHES.jackal.thrustBarStable
end

local f0_local37 = function ( f84_arg0, f84_arg1 )
	local f84_local0 = false
	if f84_arg0 then
		f84_local0 = true
	end
	return f84_local0
end

local f0_local38 = function ( f85_arg0, f85_arg1 )
	local f85_local0 = false
	if f85_arg0 then
		f85_local0 = true
	end
	return f85_local0
end

local f0_local39 = function ( f86_arg0, f86_arg1 )
	local f86_local0 = false
	if f86_arg0 == JackalBoosterStates.Ready then
		f86_local0 = true
	elseif f86_arg0 == JackalBoosterStates.Primed then
		f86_local0 = true
	elseif f86_arg0 == JackalBoosterStates.Priming then
		f86_local0 = true
	elseif f86_arg0 == JackalBoosterStates.Engaged then
		f86_local0 = true
	elseif f86_arg0 == JackalBoosterStates.Damaged then
		f86_local0 = true
	end
	return f86_local0
end

local f0_local40 = function ( f87_arg0, f87_arg1 )
	local f87_local0 = false
	if f87_arg0 then
		f87_local0 = true
	end
	return f87_local0
end

local f0_local41 = function ( f88_arg0, f88_arg1 )
	local f88_local0 = false
	if f88_arg0 then
		f88_local0 = true
	end
	return f88_local0
end

local f0_local42 = function ( f89_arg0, f89_arg1 )
	local f89_local0 = false
	if f89_arg0 == JackalFlareStates.NotReady then
		f89_local0 = true
	end
	return f89_local0
end

local f0_local43 = function ( f90_arg0, f90_arg1 )
	local f90_local0
	if f90_arg0 == 1 then
		f90_local0 = SWATCHES.jackal.lockOnMeterFill
		if not f90_local0 then
		
		else
			return GetIntForColor( f90_local0 )
		end
	end
	f90_local0 = SWATCHES.jackal.stable
end

local f0_local44 = Engine.GetDvarFloat( "spaceshipLockOnBlinkAmount" ) or 12
local f0_local45 = function ( f91_arg0, f91_arg1 )
	if f91_arg0 == 1 then
		return 1
	elseif f91_arg0 == 0 then
		return 0.6
	else
		return 0.75 * (1 + math.sin( f0_local44 * (math.pow( f91_arg0 + 1, 3 ) - 1) + math.pi / 2 ))
	end
end

local f0_local46 = function ( f92_arg0, f92_arg1 )
	return f92_arg0 == 1
end

local f0_local47 = function ( f93_arg0 )
	local f93_local0 = nil
	if f93_arg0 == "spaceship_30mm_projectile" then
		f93_local0 = "JACKAL_30MM"
	elseif f93_arg0 == "spaceship_cannon_projectile" then
		f93_local0 = "JACKAL_50MM"
	end
	return f93_local0
end

function UpdateBoosterState( f94_arg0 )
	if Game.GetOmnvar( "ui_jackal_atmo_launch" ) then
		if Game.GetOmnvar( "ui_jackal_atmo_launch_damage" ) then
			return JackalBoosterStates.Damaged
		else
			return JackalBoosterStates.Engaged
		end
	elseif Game.GetOmnvar( "ui_jackal_boosters_charging" ) then
		local f94_local0 = Game.GetOmnvar( "ui_jackal_booster_charge" )
		if f94_local0 >= 1 then
			return JackalBoosterStates.Primed
		elseif f94_local0 > 0 then
			return JackalBoosterStates.Priming
		else
			return JackalBoosterStates.Ready
		end
	else
		return JackalBoosterStates.Off
	end
end

local f0_local48 = function ( f95_arg0 )
	if DataSources.inGame.jackal.flaresRecharging:GetValue( f95_arg0 ) then
		return JackalFlareStates.NotReady
	else
		return JackalFlareStates.Ready
	end
end

local f0_local49 = function ( f96_arg0 )
	return function ( f97_arg0, f97_arg1 )
		return Engine.GetShipCalloutText( f97_arg1, f96_arg0 )
	end
	
end

local f0_local50 = function ( f98_arg0, f98_arg1 )
	local f98_local0 = Game.GetTeamForEntity( f98_arg0 )
	if f98_local0 == Teams.allies then
		return GetIntForColor( SWATCHES.Callouts.teamAllies )
	elseif f98_local0 == Teams.axis then
		return GetIntForColor( SWATCHES.Callouts.teamAxis )
	else
		return GetIntForColor( SWATCHES.Callouts.teamFree )
	end
end

local f0_local51 = {
	Regular = 0,
	HandScanner = 1,
	Warning = 2,
	IncomingMissile = 3
}
local f0_local52 = function ( f99_arg0, f99_arg1 )
	return f99_arg0 == f0_local51.HandScanner
end

local f0_local53 = function ( f100_arg0, f100_arg1 )
	return f100_arg0 == f0_local51.Warning
end

local f0_local54 = function ( f101_arg0, f101_arg1 )
	return f101_arg0 == f0_local51.IncomingMissile
end

local f0_local55 = function ( f102_arg0 )
	local f102_local0 = DataSources.inGame.jackal.specialistAdsMask:GetValue( f102_arg0 )
	if DataSources.inGame.jackal.missileLockTargetNoLead:GetValue( f102_arg0 ) then
		return 0
	else
		return f102_local0
	end
end

local f0_local56 = function ( f103_arg0, f103_arg1 )
	local f103_local0 = Engine.Localize( "JACKAL_MODE_LAUNCH" )
	if f103_arg0 == 1 then
		f103_local0 = Engine.Localize( "JACKAL_MODE_ATMOS" )
	elseif f103_arg0 == 5 then
		f103_local0 = Engine.Localize( "JACKAL_MODE_SPACE" )
	end
	return f103_local0
end

function InitJackalDataSources()
	DataSources.inGame.jackal.base = LUI.DataSourceInControllerModel.new( "cg.jackal" )
	DataSources.inGame.jackal.entity = LUI.DataSourceFromOmnvar.new( "ui_jackal_entity" )
	DataSources.inGame.jackal.isThrusting = LUI.DataSourceInControllerModel.new( "cg.jackal.isThrusting" )
	DataSources.inGame.jackal.thrustPercent = LUI.DataSourceInControllerModel.new( "cg.jackal.thrustPercent" )
	DataSources.inGame.jackal.isThrustRecharging = LUI.DataSourceInControllerModel.new( "cg.jackal.isThrustRecharging" )
	DataSources.inGame.jackal.minStartThrustPercent = LUI.DataSourceInControllerModel.new( "cg.jackal.minStartThrustPercent" )
	DataSources.inGame.jackal.empenergy = LUI.DataSourceFromOmnvar.new( "ui_jackal_emp_energy" )
	DataSources.inGame.jackal.empalpha = LUI.DataSourceFromOmnvar.new( "ui_jackal_emp_alpha" )
	DataSources.inGame.jackal.empdepletedalpha = LUI.DataSourceFromOmnvar.new( "ui_jackal_emp_depleted_alpha" )
	DataSources.inGame.jackal.empMinEnergyAlpha = LUI.DataSourceFromOmnvar.new( "ui_jackal_min_charge_alpha" )
	DataSources.inGame.jackal.flaresRecharging = LUI.DataSourceFromOmnvar.new( "ui_jackal_flares_recharging" )
	DataSources.inGame.jackal.flaresReady = LUI.DataSourceFromOmnvar.new( "ui_jackal_flares_ready" )
	DataSources.inGame.jackal.missileIncoming = LUI.DataSourceFromOmnvar.new( "ui_jackal_missile_incoming" )
	DataSources.inGame.jackal.mode = LUI.DataSourceInControllerModel.new( "cg.jackal.mode" )
	DataSources.inGame.jackal.roll = LUI.DataSourceInControllerModel.new( "cg.jackal.roll" )
	DataSources.inGame.jackal.isFiring = LUI.DataSourceFromOmnvar.new( "ui_jackal_firing" )
	DataSources.inGame.jackal.missleLockPercent = LUI.DataSourceInControllerModel.new( "cg.jackal.missleLockPercent" )
	DataSources.inGame.jackal.missileLockTargetTag = LUI.DataSourceInControllerModel.new( "cg.jackal.missileLockTargetTag" )
	DataSources.inGame.jackal.missileLockTarget = LUI.DataSourceInControllerModel.new( "cg.jackal.missileLockTarget" )
	DataSources.inGame.jackal.missileLockTargetNoLead = LUI.DataSourceInControllerModel.new( "cg.jackal.missileLockTargetNoLead" )
	DataSources.inGame.jackal.aimTrackPercent = LUI.DataSourceInControllerModel.new( "cg.jackal.aimTrackPercent" )
	DataSources.inGame.jackal.specialistAds = LUI.DataSourceFromOmnvar.new( "ui_jackal_specialist_ads" )
	DataSources.inGame.jackal.specialistAdsMask = LUI.DataSourceFromOmnvar.new( "ui_jackal_specialist_ads_mask" )
	DataSources.inGame.jackal.specialistFlareEmpty = LUI.DataSourceFromOmnvar.new( "ui_jackal_flares_empty_specialist" )
	DataSources.inGame.jackal.specialistFlareRecharge = LUI.DataSourceFromOmnvar.new( "ui_jackal_flares_recharge_specialist" )
	DataSources.inGame.jackal.specialistFlareUse = LUI.DataSourceFromOmnvar.new( "ui_jackal_flares_use_specialist" )
	DataSources.inGame.jackal.missileLockTargetLeadAlpha = LUI.AggregateDataSource.new( DataSources.inGame.jackal.base, {
		DataSources.inGame.jackal.specialistAdsMask,
		DataSources.inGame.jackal.missileLockTargetNoLead
	}, "missileLockTargetLeadAlpha", f0_local55 )
	DataSources.inGame.jackal.bootup = LUI.DataSourceFromOmnvar.new( "ui_jackal_bootup" )
	DataSources.inGame.jackal.shutdown = LUI.DataSourceFromOmnvar.new( "ui_jackal_hud_shutdown" )
	DataSources.inGame.jackal.autopilot = LUI.DataSourceFromOmnvar.new( "ui_jackal_autopilot" )
	DataSources.inGame.jackal.lockOnColor = DataSources.inGame.jackal.missleLockPercent:Filter( "lockOnColor", f0_local43 )
	DataSources.inGame.jackal.lockOnBlinkAlpha = DataSources.inGame.jackal.missleLockPercent:Filter( "lockOnBlinkAlpha", f0_local45 )
	DataSources.inGame.jackal.lockedOnTarget = DataSources.inGame.jackal.missleLockPercent:Filter( "lockedOnTarget", f0_local46 )
	DataSources.inGame.jackal.noGunsModeActive = LUI.DataSourceInControllerModel.new( "cg.jackal.noGunsModeActive" )
	DataSources.inGame.jackal.cockpitScreensNoboot = LUI.DataSourceFromOmnvar.new( "ui_jackal_cockpit_screens_noboot" )
	DataSources.inGame.jackal.cockpitScreens = LUI.DataSourceFromOmnvar.new( "ui_jackal_cockpit_screens" )
	DataSources.inGame.jackal.cockpitScreensToDisplay = LUI.DataSourceFromOmnvar.new( "ui_jackal_cockpit_display" )
	DataSources.inGame.jackal.displayCockpitScanner = DataSources.inGame.jackal.cockpitScreensToDisplay:Filter( "displayCockpitScanner", f0_local52 )
	DataSources.inGame.jackal.displayCockpitWarnings = DataSources.inGame.jackal.cockpitScreensToDisplay:Filter( "displayCockpitWarnings", f0_local53 )
	DataSources.inGame.jackal.displayCockpitIncomingMissile = DataSources.inGame.jackal.cockpitScreensToDisplay:Filter( "displayCockpitIncomingMissile", f0_local54 )
	DataSources.inGame.jackal.inDogfight = LUI.DataSourceFromOmnvar.new( "ui_jackal_dogfight" )
	DataSources.inGame.jackal.lockBroke = LUI.DataSourceFromOmnvar.new( "ui_jackal_lock_broke" )
	DataSources.inGame.jackal.deathQuote = LUI.DataSourceFromOmnvar.new( "ui_jackal_deathquote" )
	DataSources.inGame.jackal.lowHealth = LUI.DataSourceFromOmnvar.new( "ui_jackal_low_health" )
	DataSources.inGame.jackal.criticalHealth = LUI.DataSourceFromOmnvar.new( "ui_jackal_critical_health" )
	DataSources.inGame.jackal.takingDamage = LUI.DataSourceFromOmnvar.new( "ui_jackal_taking_damage" )
	local f104_local0 = {
		DataSources.inGame.jackal.isThrusting,
		DataSources.inGame.jackal.isThrustRecharging
	}
	local f104_local1 = {
		DataSources.inGame.jackal.thrustPercent,
		DataSources.inGame.jackal.minStartThrustPercent
	}
	DataSources.inGame.jackal.thrustLabelText = LUI.AggregateDataSource.new( DataSources.inGame.jackal.base, f104_local0, "thrustLabelText", f0_local35 )
	DataSources.inGame.jackal.thrustFillColor = LUI.AggregateDataSource.new( DataSources.inGame.jackal.base, f104_local1, "thrustFillColor", f0_local33 )
	DataSources.inGame.jackal.thrustLabelColor = LUI.AggregateDataSource.new( DataSources.inGame.jackal.base, f104_local1, "thrustLabelColor", f0_local36 )
	DataSources.inGame.jackal.thrustersBelowThreshold = LUI.AggregateDataSource.new( DataSources.inGame.jackal.base, f104_local1, "thrustersBelowThreshold", f0_local34 )
	DataSources.inGame.jackal.atmoLaunch = LUI.DataSourceFromOmnvar.new( "ui_jackal_atmo_launch" )
	DataSources.inGame.jackal.atmoLaunchDamaged = LUI.DataSourceFromOmnvar.new( "ui_jackal_atmo_launch_damage" )
	DataSources.inGame.jackal.atmoLaunchCountdown = LUI.DataSourceFromOmnvar.new( "ui_jackal_atmo_launch_countdown" )
	DataSources.inGame.jackal.boosterCharge = LUI.DataSourceFromOmnvar.new( "ui_jackal_booster_charge" )
	DataSources.inGame.jackal.boostersCharging = LUI.DataSourceFromOmnvar.new( "ui_jackal_boosters_charging" )
	DataSources.inGame.jackal.boosterState = LUI.AggregateDataSource.new( DataSources.inGame.jackal.base, {
		DataSources.inGame.jackal.boosterCharge,
		DataSources.inGame.jackal.boostersCharging,
		DataSources.inGame.jackal.atmoLaunch,
		DataSources.inGame.jackal.atmoLaunchDamaged
	}, "boosterState", UpdateBoosterState )
	DataSources.inGame.jackal.flaresState = LUI.AggregateDataSource.new( DataSources.inGame.jackal.base, {
		DataSources.inGame.jackal.flaresRecharging,
		DataSources.inGame.jackal.flaresReady
	}, "flaresState", f0_local48 )
	DataSources.inGame.jackal.weapon = LUI.DataSourceFromOmnvar.new( "ui_jackal_current_weapon" )
	DataSources.inGame.jackal.weaponName = DataSources.inGame.jackal.weapon:Filter( "weaponName", f0_local47 )
	DataSources.inGame.jackal.equippedPrimaryIndex = LUI.DataSourceFromOmnvar.new( "ui_jackal_equipped_primary_index" )
	DataSources.inGame.jackal.equippedPrimary = DataSources.inGame.jackal.equippedPrimaryIndex:Filter( "primaryName", Cac.GetJackalWeaponNameFromIndex )
	DataSources.inGame.jackal.equippedSecondaryIndex = LUI.DataSourceFromOmnvar.new( "ui_jackal_equipped_secondary_index" )
	DataSources.inGame.jackal.equippedSecondary = DataSources.inGame.jackal.equippedSecondaryIndex:Filter( "secondaryName", Cac.GetJackalWeaponNameFromIndex )
	DataSources.inGame.jackal.showHorizon = LUI.DataSourceFromOmnvar.new( "ui_jackal_show_horizon" )
	DataSources.inGame.jackal.weaponDisplayTemp = LUI.DataSourceFromOmnvar.new( "ui_jackal_weapon_display_temp" )
	DataSources.inGame.jackal.weaponSecondary = LUI.DataSourceFromOmnvar.new( "ui_jackal_weapon_secondary" )
	DataSources.inGame.jackal.weaponOverheat = LUI.DataSourceFromOmnvar.new( "ui_jackal_weapon_overheat" )
	DataSources.inGame.jackal.barrelTempPrimaryL = LUI.DataSourceFromOmnvar.new( "ui_jackal_barrel_temp_primary_L" )
	DataSources.inGame.jackal.barrelTempPrimaryR = LUI.DataSourceFromOmnvar.new( "ui_jackal_barrel_temp_primary_R" )
	DataSources.inGame.jackal.barrelTempSecondaryL = LUI.DataSourceFromOmnvar.new( "ui_jackal_barrel_temp_secondary_L" )
	DataSources.inGame.jackal.barrelTempSecondaryR = LUI.DataSourceFromOmnvar.new( "ui_jackal_barrel_temp_secondary_R" )
	DataSources.inGame.jackal.barrelWarnPrimaryL = LUI.DataSourceFromOmnvar.new( "ui_jackal_barrel_warn_primary_L" )
	DataSources.inGame.jackal.barrelWarnPrimaryR = LUI.DataSourceFromOmnvar.new( "ui_jackal_barrel_warn_primary_R" )
	DataSources.inGame.jackal.barrelWarnSecondaryL = LUI.DataSourceFromOmnvar.new( "ui_jackal_barrel_warn_secondary_L" )
	DataSources.inGame.jackal.barrelWarnSecondaryR = LUI.DataSourceFromOmnvar.new( "ui_jackal_barrel_warn_secondary_R" )
	DataSources.inGame.jackal.barrelOverheatPrimaryL = LUI.DataSourceFromOmnvar.new( "ui_jackal_barrel_overheat_primary_L" )
	DataSources.inGame.jackal.barrelOverheatPrimaryR = LUI.DataSourceFromOmnvar.new( "ui_jackal_barrel_overheat_primary_R" )
	DataSources.inGame.jackal.barrelOverheatSecondaryL = LUI.DataSourceFromOmnvar.new( "ui_jackal_barrel_overheat_secondary_L" )
	DataSources.inGame.jackal.barrelOverheatSecondaryR = LUI.DataSourceFromOmnvar.new( "ui_jackal_barrel_overheat_secondary_R" )
	DataSources.inGame.jackal.missiles.active = LUI.DataSourceFromOmnvar.new( "ui_jackal_missile" )
	DataSources.inGame.jackal.missiles.count = LUI.DataSourceFromOmnvar.new( "ui_jackal_missile_count" )
	DataSources.inGame.jackal.missiles.emptyShot = LUI.DataSourceFromOmnvar.new( "ui_jackal_missile_empty" )
	DataSources.inGame.jackal.missiles.alpha = DataSources.inGame.jackal.missiles.active:Filter( "alpha", f0_local29 )
	DataSources.inGame.jackal.missiles.left.count = DataSources.inGame.jackal.missiles.count:Filter( "leftCount", f0_local30 )
	DataSources.inGame.jackal.missiles.right.count = DataSources.inGame.jackal.missiles.count:Filter( "rightCount", f0_local31 )
	DataSources.inGame.jackal.missiles.maxCount = LUI.DataSourceFromOmnvar.new( "ui_jackal_missile_total" )
	DataSources.inGame.jackal.missiles.leftMaxCount = DataSources.inGame.jackal.missiles.maxCount:Filter( "leftMaxCount", f0_local30 )
	DataSources.inGame.jackal.missiles.rightMaxCount = DataSources.inGame.jackal.missiles.maxCount:Filter( "rightNaxCount", f0_local31 )
	DataSources.inGame.jackal.mapboundarywarning = LUI.DataSourceFromOmnvar.new( "ui_jackal_boundary_warning" )
	DataSources.inGame.jackal.enemyLockonAquiring = LUI.DataSourceFromOmnvar.new( "ui_jackal_enemy_lockon_aquiring" )
	DataSources.inGame.jackal.enemyLockonActive = LUI.DataSourceFromOmnvar.new( "ui_jackal_enemy_lockon_active" )
	DataSources.inGame.jackal.enemyLockonIsfiring = LUI.DataSourceFromOmnvar.new( "ui_jackal_enemy_lockon_isfiring" )
	DataSources.inGame.jackal.enemyLockonStrength = LUI.DataSourceFromOmnvar.new( "ui_jackal_enemy_lockon_strength" )
	DataSources.inGame.jackal.enemyLockonUiScale = LUI.DataSourceFromOmnvar.new( "ui_jackal_enemy_lockon_ui_scale" )
	DataSources.inGame.jackal.enemyLockonUiAlpha = LUI.DataSourceFromOmnvar.new( "ui_jackal_enemy_lockon_ui_alpha" )
	DataSources.inGame.jackal.enemyLockonMissile = LUI.DataSourceFromOmnvar.new( "ui_jackal_enemy_lockon_missile" )
	DataSources.inGame.jackal.enemyLockonX1 = LUI.DataSourceFromOmnvar.new( "ui_jackal_enemy_lockon_x1" )
	DataSources.inGame.jackal.enemyLockonY1 = LUI.DataSourceFromOmnvar.new( "ui_jackal_enemy_lockon_y1" )
	DataSources.inGame.jackal.enemyLockonRotX = LUI.DataSourceFromOmnvar.new( "ui_jackal_enemy_lockon_rot_x" )
	DataSources.inGame.jackal.enemyLockonRotY = LUI.DataSourceFromOmnvar.new( "ui_jackal_enemy_lockon_rot_y" )
	DataSources.inGame.jackal.enemyLockonRotZ = LUI.DataSourceFromOmnvar.new( "ui_jackal_enemy_lockon_rot_z" )
	DataSources.inGame.jackal.missiles.left.list = LUI.DataSourceFromList.new( DataSources.inGame.jackal.missiles.leftMaxCount )
	DataSources.inGame.jackal.missiles.left.list.MakeDataSourceAtIndex = function ( f105_arg0, f105_arg1, f105_arg2 )
		f105_arg1 = f105_arg1 + 1
		return {
			alpha = DataSources.inGame.jackal.missiles.left.count:Filter( "missileAlpha" .. f105_arg1 * 2, f0_local32( f105_arg1 ) )
		}
	end
	
	DataSources.inGame.jackal.missiles.right.list = LUI.DataSourceFromList.new( DataSources.inGame.jackal.missiles.rightMaxCount )
	DataSources.inGame.jackal.missiles.right.list.MakeDataSourceAtIndex = function ( f106_arg0, f106_arg1, f106_arg2 )
		f106_arg1 = f106_arg1 + 1
		return {
			alpha = DataSources.inGame.jackal.missiles.right.count:Filter( "missileAlpha" .. f106_arg1 + f106_arg1 - 1, f0_local32( f106_arg1 ) )
		}
	end
	
	DataSources.inGame.jackal.calloutsActive = LUI.DataSourceFromOmnvar.new( "ui_jackal_callouts_enabled" )
	local f104_local2 = Engine.GetMaxShipCallouts()
	DataSources.inGame.jackal.shipCallouts = {}
	for f104_local3 = 0, f104_local2 - 1, 1 do
		local f104_local6 = LUI.DataSourceFromOmnvar.new( "ui_jackal_ship_callout_changed_" .. f104_local3 )
		DataSources.inGame.jackal.shipCallouts[f104_local3 + 1] = {
			changed = f104_local6,
			name = f104_local6:Filter( "name", f0_local49( f104_local3 ) ),
			color = f104_local6:Filter( "color", f0_local50 ),
			distance = LUI.DataSourceInControllerModel.new( "cg.jackal.calloutDistance." .. f104_local3 )
		}
	end
	DataSources.inGame.jackal.jackalWarning.autopilotpush = DataSources.inGame.jackal.autopilot:FilterTo( DataSources.inGame.jackal.base, "jackalWarning.autopilotpush", f0_local38 )
	DataSources.inGame.jackal.jackalWarning.boosterpush = DataSources.inGame.jackal.boosterState:FilterTo( DataSources.inGame.jackal.base, "jackalWarning.boosterpush", f0_local39 )
	DataSources.inGame.jackal.jackalWarning.missilepush = DataSources.inGame.jackal.missileIncoming:FilterTo( DataSources.inGame.jackal.base, "jackalWarning.missilepush", f0_local37 )
	DataSources.inGame.jackal.jackalWarning.leavingareapush = DataSources.inGame.jackal.mapboundarywarning:FilterTo( DataSources.inGame.jackal.base, "jackalWarning.leavingareapush", f0_local40 )
	DataSources.inGame.jackal.jackalWarning.weaponoverheatpush = DataSources.inGame.jackal.weaponOverheat:FilterTo( DataSources.inGame.jackal.base, "jackalWarning.weaponoverheatpush", f0_local41 )
	DataSources.inGame.jackal.jackalWarning.flarespush = DataSources.inGame.jackal.flaresState:FilterTo( DataSources.inGame.jackal.base, "jackalWarning.flarespush", f0_local42 )
	DataSources.inGame.jackal.launchState = LUI.DataSourceFromOmnvar.new( "ui_jackal_launch_state" )
	DataSources.inGame.jackal.launchStateModeText = DataSources.inGame.jackal.launchState:Filter( "launchStateModeText", f0_local56 )
	DataSources.inGame.jackal.launchFuel = LUI.DataSourceFromOmnvar.new( "ui_jackal_launch_fuel" )
	DataSources.inGame.jackal.launchGForce = LUI.DataSourceFromOmnvar.new( "ui_jackal_launch_gforce" )
	DataSources.inGame.jackal.launchPitch = LUI.DataSourceFromOmnvar.new( "ui_jackal_launch_pitch" )
	DataSources.inGame.jackal.launchAltitude = LUI.DataSourceFromOmnvar.new( "ui_jackal_launch_alt" )
	DataSources.inGame.jackal.launchSpeed = LUI.DataSourceFromOmnvar.new( "ui_jackal_launch_speed" )
	local f104_local3 = 6
	DataModel.SetModelValue( DataModel.CreateModel( DataModel.GetGlobalModel(), "cg.jackal.maxJackalObjectives" ), f104_local3 )
	DataSources.inGame.jackal.maxJackalObjectives = LUI.DataSourceInGlobalModel.new( "cg.jackal.maxJackalObjectives" )
	DataSources.inGame.jackal.activeJackalObjectiveBits = LUI.DataSourceFromOmnvar.new( "ui_jackal_objective_bits" )
	DataSources.inGame.jackal.activeJackalObjectiveCount = DataSources.inGame.jackal.activeJackalObjectiveBits:Filter( "activeJackalObjectiveCount", f0_local1 )
	DataSources.inGame.jackal.activeJackalObjectives = LUI.DataSourceFromList.new( DataSources.inGame.jackal.activeJackalObjectiveCount )
	DataSources.inGame.jackal.activeJackalObjectives.objectives = {}
	DataSources.inGame.jackal.jackalObjectivesEnabled = DataSources.inGame.jackal.activeJackalObjectiveBits:Filter( "objectiveActive", function ( f107_arg0, f107_arg1 )
		if 0 < f107_arg0 then
			return 1
		else
			return 0
		end
	end )
	for f104_local4 = 0, f104_local3 - 1, 1 do
		DataSources.inGame.jackal.activeJackalObjectives.objectives[f104_local4] = {
			string = LUI.DataSourceFromOmnvar.new( "ui_jackal_objective_string_" .. f104_local4 ),
			state = LUI.DataSourceFromOmnvar.new( "ui_jackal_objective_state_" .. f104_local4 ),
			maxKills = LUI.DataSourceFromOmnvar.new( "ui_jackal_objective_maxkills_" .. f104_local4 ),
			kills = LUI.DataSourceFromOmnvar.new( "ui_jackal_objective_kills_" .. f104_local4 )
		}
	end
	DataSources.inGame.jackal.activeJackalObjectives.MakeDataSourceAtIndex = function ( f108_arg0, f108_arg1, f108_arg2 )
		return DataSources.inGame.jackal.activeJackalObjectives.objectives[f108_arg1 - 1]
	end
	
end

