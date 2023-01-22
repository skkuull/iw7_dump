local f0_local0 = Game.GetMapName()
local f0_local1 = Engine.TableLookup( CSV.levels.file, CSV.levels.cols.name, Game.GetMapName(), CSV.levels.cols.isShipCrib ) == "1"
if f0_local1 or f0_local0 == "vr_firing_range" or f0_local0 == "shipcrib_epilogue" then
	require( "inGame.sp.CapOpsIntel" )
	require( "inGame.sp.CapOpsIntelDetails" )
	require( "inGame.sp.CapOpsPersonnel" )
	require( "inGame.sp.CapOpsPersonnelButton" )
	require( "inGame.sp.CapOpsPersonnelDetails" )
	require( "inGame.sp.CapOpsReport" )
	require( "inGame.sp.CapOpsReportButton" )
	require( "inGame.sp.CapOpsReportDetails" )
	require( "inGame.sp.CapOpsTab" )
	require( "inGame.sp.CaptainsComputerMenu" )
	require( "inGame.sp.CaptainsComputerMenuTitle" )
	require( "inGame.sp.FramedJackalItem" )
	require( "inGame.sp.FramedJackalItems" )
	require( "inGame.sp.FramedJackalLoadoutLivery" )
	require( "inGame.sp.FramedPowers" )
	require( "inGame.sp.MissionPopup" )
	require( "inGame.sp.MissionPopupAuthorize" )
	require( "inGame.sp.MissionPopupContent" )
	require( "inGame.sp.MissionPopupFrame" )
	require( "inGame.sp.MissionPopupSubtitle" )
	require( "inGame.sp.MissionPopupSuccess" )
	require( "inGame.sp.MissionPopupTitle" )
	require( "inGame.sp.MostWantedCardsBoard" )
	require( "inGame.sp.MostWantedCardsBoardPopup" )
	require( "inGame.sp.mostWantedCardsBoardWidget" )
	require( "inGame.sp.MostWantedHoverInfo" )
	require( "inGame.sp.OpsMap" )
	require( "inGame.sp.OpsMapContent" )
	require( "inGame.sp.PowerSelectButton" )
	require( "inGame.sp.SPAttachmentSelect" )
	require( "inGame.sp.SPLoadout" )
	require( "inGame.sp.SPLoadouts" )
	require( "inGame.sp.SPPowerSelect" )
	require( "inGame.sp.SPWeaponSelect" )
	require( "utils.mp.CACLootUtils" )
	require( "utils.sp.ShipCribUtils" )
	require( "widgets.CaCButtonBaseImage" )
	require( "widgets.CACItemHeader" )
	require( "widgets.CACItemHeaderBackground" )
	require( "widgets.CACItemHeaderSteakBackground" )
	require( "widgets.CACItemHeaderStreak" )
	require( "widgets.CaCSelectedMessage" )
	require( "widgets.FramedAttachment" )
	require( "widgets.FramedAttachments" )
	require( "widgets.FramedWeapon" )
	require( "widgets.ItemCardBigImage" )
	require( "widgets.ItemCardDescription" )
	require( "widgets.ItemCardFooter" )
	require( "widgets.ItemCardHeader" )
	require( "widgets.ItemCardHeaderBackground" )
	require( "widgets.ItemCardLongImage" )
	require( "widgets.ItemCardName" )
	require( "widgets.ItemCardWeaponStatsBar" )
	require( "widgets.ItemCardWeaponStatsPanel" )
	require( "widgets.LoadoutSelectHeader" )
	require( "widgets.sp.OpsMapIconJA" )
	require( "widgets.sp.OpsMapIconML" )
	require( "widgets.sp.OpsMapIconSA" )
	require( "widgets.OpticsIcon" )
	require( "widgets.PowerButton" )
	require( "widgets.PowerDetails" )
	require( "widgets.sp.FramedAttachmentsSP" )
	require( "widgets.sp.FramedWeaponSP" )
	require( "widgets.WeaponButton" )
	require( "widgets.WeaponStatsBar" )
	require( "widgets.WeaponStatsProgressBar" )
end
if not f0_local1 then
	require( "inGame.sp.DropshipArtificialHorizon" )
	require( "inGame.sp.DropshipCenterReticle" )
	require( "inGame.sp.DropshipCenterReticleTriangle" )
	require( "inGame.sp.DropshipFlightStatusBar" )
	require( "inGame.sp.DropshipFlightStatusCritical" )
	require( "inGame.sp.DropshipFlightStatusSystemIntegrity" )
	require( "inGame.sp.DropshipFlightStatusWarningLeft" )
	require( "inGame.sp.DropshipFlightStatusWarningRight" )
	require( "inGame.sp.DropshipOverlay" )
	require( "inGame.sp.DropshipVerticalBarLeft" )
	require( "inGame.sp.DropshipVerticalBarLeftBox" )
	require( "inGame.sp.DropshipVerticalBarRight" )
	require( "inGame.sp.DropshipVerticalBarRightBox" )
	require( "inGame.sp.EthanHackControlOverlay" )
	require( "inGame.sp.HackControlTargetMarker" )
	require( "inGame.sp.HackTargetMarker" )
	require( "inGame.sp.HaloDropOverlay" )
	require( "inGame.sp.HaloDropOverlayMain" )
	require( "inGame.sp.HaloDropBotInfoBox" )
	require( "inGame.sp.HaloDropScreenElements" )
	require( "inGame.sp.HaloDropSideMeter" )
	require( "inGame.sp.HaloDropSideMeterLeft" )
	require( "inGame.sp.HaloDropSideMeters" )
	require( "inGame.sp.HaloDropHorizon" )
	require( "inGame.sp.HaloDropDotBackground" )
	require( "inGame.sp.HaloDropPrepareSteps" )
	require( "inGame.sp.MarsRemoteMissileCenterAccent" )
	require( "inGame.sp.MarsRemoteMissileConnectionStatus" )
	require( "inGame.sp.MarsRemoteMissileMain" )
	require( "inGame.sp.MarsRemoteMissileOverlay" )
	require( "inGame.sp.MarsRemoteMissileReticle" )
	require( "inGame.sp.MarsRemoteMissileReticles" )
	require( "inGame.sp.MarsRemoteMissileStatus" )
	require( "inGame.sp.MarsRemoteMissileTargetInfo" )
	require( "inGame.sp.MarsRemoteMissileTargetWindow" )
	require( "inGame.sp.MarsRemoteMissileTransitionWindow" )
	require( "inGame.sp.MarsRemoteMissleHintText" )
	require( "inGame.sp.JackalCallDownReticles" )
	require( "inGame.sp.EngineMeterWidget" )
	require( "inGame.sp.FlightRecordHud" )
	require( "inGame.sp.MissionCountdown" )
	require( "inGame.sp.JackalMissionTimer" )
	require( "inGame.sp.OlympusMonsCaptainScreen" )
	require( "inGame.sp.OlympusMonsDamageState" )
	require( "inGame.sp.OlympusMonsFSparGauge" )
	require( "inGame.sp.OlympusMonsRadarTargeting" )
	require( "inGame.sp.ThreatMeter" )
	require( "inGame.sp.HackControlFrame" )
	require( "inGame.sp.RadarTargeting" )
	require( "inGame.sp.DropshipOverlayContainer" )
	require( "inGame.sp.C12Reticles" )
	require( "inGame.sp.C12Overlay" )
	require( "inGame.sp.C12Missile" )
	require( "inGame.sp.C12Missiles" )
	require( "inGame.sp.C12Reticle" )
	require( "inGame.sp.C12ConnectionStatus" )
	require( "inGame.sp.C12Logo" )
	require( "inGame.sp.C12Mode" )
	require( "inGame.sp.C12Schematic" )
	require( "inGame.sp.C12TargetWindow" )
	require( "inGame.sp.EthanHackBackgroundGrid" )
	require( "inGame.sp.EthanHackBoxGrid" )
	require( "inGame.sp.EthanHackCountdownTimer" )
	require( "inGame.sp.EthanHackOverlay" )
	require( "inGame.sp.EthanHackReticle" )
	require( "inGame.sp.JackalOffscreenIndicatorUrgent" )
	require( "inGame.sp.JackalOffscreenIndicatorPoint" )
	require( "inGame.sp.PriorityFlyingTargetAceIndicator" )
	require( "inGame.sp.OffscreenIncomingMissileIndicator" )
	require( "inGame.sp.JackalShipCallout_allyJackalUnloc" )
	require( "inGame.sp.HackControlMidElements" )
	require( "inGame.sp.HackControlCrosshairLarge" )
	require( "inGame.sp.HackControlTransitionElements" )
	require( "inGame.sp.AnnotationOffscreenEnemyIndicator" )
	if f0_local0 == "europa" then
		require( "inGame.sp.EuropaChyron" )
		require( "inGame.sp.EuropaSelfDestruct" )
		require( "inGame.sp.HeistFakeBoostMeter" )
	elseif f0_local0 == "heistspace" then
		require( "inGame.sp.OM130Overlay" )
		require( "inGame.sp.OM130ControlOverlay" )
	elseif f0_local0 == "heist" then
		require( "inGame.sp.HeistFakeBoostMeter" )
	elseif f0_local0 == "phstreets" or f0_local0 == "phparade" or f0_local0 == "phspace" then
		require( "inGame.sp.JackalGridOverlay" )
		require( "inGame.sp.JackalConnectionStatus" )
		require( "inGame.sp.JackalSchematic" )
		require( "inGame.sp.JackalLogo" )
		require( "inGame.sp.JackalTargets" )
		require( "inGame.sp.jackalPrintoutWindow" )
		require( "inGame.JackalCallDownOverlay" )
		require( "inGame.sp.JackalStatus" )
		require( "inGame.sp.JackalStatusContainer" )
	end
end
require( "inGame.sp.RobotHackTargetingOverlay" )
require( "inGame.sp.HackTargetingOverlay" )
require( "inGame.sp.HackDamageFeedback" )
require( "inGame.sp.HackingDetailsPanel" )
require( "inGame.sp.HackTargetingReticle" )
require( "inGame.sp.HackTargetingReticleAccent" )
require( "inGame.sp.HackingC6Panel" )
require( "inGame.sp.C12PrintoutWindow" )
require( "inGame.sp.OverlayPrintoutFrame" )
require( "inGame.sp.HackTargetingMarker" )
require( "inGame.sp.HackTargetingMarkerFrame" )
require( "inGame.sp.RobotHackControlOverlay" )
require( "inGame.sp.HackControlOverlay" )
require( "inGame.sp.HackControlConnectionStatus" )
require( "inGame.sp.HackControlReticle" )
require( "inGame.sp.HackControlSignalFailing" )
require( "inGame.sp.HackControlSelfDestruct" )
require( "inGame.sp.HVTSelfDestructTimer" )
require( "inGame.HackControlScreenElements" )
require( "inGame.HackVideoFeed" )
require( "inGame.HackVideoFeedFrame" )
require( "inGame.HackControlGrid" )
require( "inGame.sp.RobotHackReticles" )
require( "inGame.sp.SPARCallout" )
require( "inGame.sp.SPARCalloutFrame" )
require( "uiEditor.InGameSPDataSources" )
require( "uiEditor.SPLoadoutDataSources" )
require( "inGame.sp.DroneList" )
require( "inGame.sp.DroneWidgetAmmoBar" )
require( "inGame.sp.DroneWidgetBackground" )
require( "inGame.sp.DroneWidgetInfo" )
require( "inGame.sp.DroneWidget" )
require( "inGame.sp.DroneReticleKillMsg" )
require( "inGame.sp.DroneReticleCorner" )
require( "inGame.sp.DroneReticle" )
require( "inGame.sp.DroneReticles" )
require( "inGame.sp.FlashFade" )
require( "inGame.sp.Vehicle" )
require( "inGame.sp.SPHUD" )
require( "inGame.sp.SPOverlayHUD" )
require( "inGame.sp.PreGame" )
require( "utils.sp.HUDUtility" )
require( "utils.sp.JackalEquipUtils" )
require( "utils.sp.SPSharedUtils" )
require( "inGame.sp.FragReticle" )
require( "inGame.sp.FragReticles" )
require( "inGame.sp.LockonTargets" )
require( "inGame.sp.SPWeaponInfoContainer" )
require( "inGame.sp.WristPCScreens" )
require( "inGame.sp.SimpleScriptButton" )
require( "inGame.sp.WeaponCharge" )
require( "inGame.sp.JackalPipGlitch" )
require( "inGame.sp.BinkWindow" )
require( "inGame.sp.ContextualGauge" )
require( "inGame.sp.DeathHint" )
require( "inGame.sp.DPad" )
require( "inGame.sp.DPadContainer" )
require( "inGame.sp.HackingHud" )
require( "inGame.sp.HelmetMeterBase" )
require( "inGame.sp.HelmetMeters" )
require( "inGame.sp.LevelTransition" )
require( "inGame.sp.MinimizedInteractiveObjects" )
require( "inGame.sp.MiscMessage" )
require( "inGame.sp.PipScanlines" )
require( "inGame.sp.PipStatic" )
require( "inGame.sp.PipText" )
require( "inGame.sp.PipTopRight" )
require( "inGame.sp.PipTopRightFrame" )
require( "inGame.sp.PlayerStoredAbilities" )
require( "inGame.sp.RadioTransmitter" )
require( "inGame.sp.ShipAssaultMinimap" )
require( "inGame.sp.ShipAssaultPip" )
require( "inGame.sp.SPPlayerAbilities" )
require( "inGame.sp.SPWeaponInfo" )
require( "inGame.sp.SubtitlesLayer" )
require( "inGame.sp.HandScan" )
require( "inGame.sp.OnMIssionRankings" )
require( "inGame.sp.VRManager" )
require( "inGame.sp.VRPauseMenu" )
require( "inGame.sp.WristPCHackingScreen" )
require( "inGame.sp.WristPCShieldMeterScreen" )
require( "inGame.sp.WristPCShieldCaution" )
require( "inGame.sp.WristPCShieldMeter" )
require( "widgets.WeaponCompare" )
require( "inGame.sp.PauseCurrentStats" )
require( "inGame.sp.PauseInventory" )
require( "inGame.sp.ShipAssaultShipLog" )
require( "inGame.sp.LoungeTVMenuButton" )
require( "inGame.sp.WeaponScanned" )
require( "inGame.sp.LoungeTVMenuThumbnail" )
require( "inGame.sp.LoungeHud" )
require( "inGame.sp.LoungeTVMenuList" )
require( "inGame.sp.SPPauseMenu" )
require( "inGame.sp.SPLoadoutPerkGrid" )
require( "inGame.sp.SPPerkButton" )
require( "inGame.sp.WristPcDefaultScreen" )
require( "inGame.sp.FluffMessages" )
require( "inGame.sp.PlayerStoredAbilitiesSecondary" )
require( "inGame.sp.PlayerStoredAbilitiesPrimary" )
require( "inGame.sp.SPPlayerAbilitiesPrimary" )
require( "inGame.sp.SPPlayerAbilitiesSecondary" )
require( "inGame.sp.IntelMessage" )
require( "inGame.sp.IntelMessageHint" )
require( "inGame.sp.IntelMessageHeader" )
require( "inGame.sp.IntelMessageImage" )
require( "inGame.sp.GetToCover" )
require( "widgets.FireModes" )
require( "widgets.FireMode" )
require( "inGame.PlayerEquipmentBase" )
require( "inGame.PlayerEquipment" )
require( "inGame.PlayerEquipmentCharges" )
require( "inGame.sp.HelmetOverlay" )
require( "inGame.sp.FillIndicator" )
require( "inGame.sp.CheckpointReached" )
require( "inGame.sp.WristPcJackalScreen" )
require( "widgets.ItemCard" )
require( "inGame.sp.BinkSkipPrompt" )
require( "inGame.sp.BinkSkipPromptLayer" )
require( "inGame.sp.BinkWindowFrame" )
require( "inGame.sp.CapOpsIntelButtonWrapper" )
require( "inGame.sp.CapOpsReportButtonWrapper" )
require( "inGame.sp.CapopsTechyB" )
require( "inGame.sp.CapOpsTechyC" )
require( "inGame.sp.CapOpsTextFeed" )
require( "inGame.sp.ContextualHelmetMeters" )
require( "inGame.sp.CountdownTimer" )
require( "inGame.sp.DisguiseSideBars" )
require( "inGame.sp.EpilogueLines" )
require( "inGame.sp.EquipmentUpgraded" )
require( "inGame.sp.EquipmentUpgradedHeader" )
require( "inGame.sp.EquipmentUpgradedImage" )
require( "inGame.sp.EquipmentUpgradedMessage" )
require( "inGame.sp.EthanHackAmmoCounter" )
require( "inGame.sp.EuropaChyronBracket" )
require( "inGame.sp.FluffHeaderRight" )
require( "inGame.sp.HackTerminal" )
require( "inGame.sp.HackTerminalWrapper1" )
require( "inGame.sp.HackTerminalWrapper2" )
require( "inGame.sp.HaloDropObjective" )
require( "inGame.sp.IntelAARMessage" )
require( "inGame.sp.IntelItemUnlock" )
require( "inGame.sp.IntelMessageHeaderAAR" )
require( "inGame.sp.JackalCenterReticleFireAlphaTesting" )
require( "inGame.sp.JackalDecal" )
require( "inGame.sp.JackalDecalDetails" )
require( "inGame.sp.JackalDecalSelect" )
require( "inGame.sp.JackalDroneMarker" )
require( "inGame.sp.JackalDroneMarkerAnim" )
require( "inGame.sp.JackalDroneMarkerText" )
require( "inGame.sp.JackalEnemyLockonShip" )
require( "inGame.sp.JackalEnemyLockonShipandReticule" )
require( "inGame.sp.JackalEnemyLockonShipAnimation" )
require( "inGame.sp.JackalEnemyLockonWarning" )
require( "inGame.sp.JackalEquipDetails" )
require( "inGame.sp.JackalEquipSelect" )
require( "inGame.sp.JackalFlightStatusAutopilot" )
require( "inGame.sp.JackalFlightStatusBar" )
require( "inGame.sp.JackalFlightStatusMode" )
require( "inGame.sp.JackalInteriorGpsUi" )
require( "inGame.sp.JackalInteriorScreenLaptop" )
require( "inGame.sp.JackalInteriorScreenMain" )
require( "inGame.sp.JackalInteriorScreenShipInfo" )
require( "inGame.sp.JackalInteriorWarningUi" )
require( "inGame.sp.JackalLaunchOverlayDiagram" )
require( "inGame.sp.JackalLaunchOverlayFuelGauge" )
require( "inGame.sp.JackalObjectiveListTopBar" )
require( "inGame.sp.JackalOverheatOverlay" )
require( "inGame.sp.JackalSchematicReadyBox" )
require( "inGame.sp.JackalSelectButton" )
require( "inGame.sp.JackalShipCallout_allyCapitalShip" )
require( "inGame.sp.JackalShipCallout_allyJackal" )
require( "inGame.sp.JackalShipCallout_enemyAce" )
require( "inGame.sp.JackalShipCallout_enemyAceDogfight" )
require( "inGame.sp.JackalShipCallout_enemyCapitalShip" )
require( "inGame.sp.JackalShipCallout_enemyDogFight" )
require( "inGame.sp.JackalShipCallout_enemyJackal" )
require( "inGame.sp.JackalTargetAimRate" )
require( "inGame.sp.jackalTargetAimRatePieces" )
require( "inGame.sp.JackalTargetIndicator" )
require( "inGame.sp.JackalTargetLockonLeadReticle" )
require( "inGame.sp.JackalTargetLockonLeadReticleCenter" )
require( "inGame.sp.LifeSupportDisabled" )
require( "inGame.sp.LifeSupportHackReady" )
require( "inGame.sp.LoadoutTutorialText" )
require( "inGame.sp.LockonTarget" )
require( "inGame.sp.MessageBackground" )
require( "inGame.sp.MiscMessageBG" )
require( "inGame.sp.OlympusMonsDistanceToShipyard" )
require( "inGame.sp.OpsmapTutorial" )
require( "inGame.sp.PriorityFlyingTargetIndicator" )
require( "inGame.sp.SPHUDFrame" )
require( "inGame.sp.SPOxygenMeter" )
require( "inGame.sp.SPPauseMissionObjective" )
require( "inGame.sp.SPPlayerAbilityFrame" )
require( "inGame.sp.SPTemperatureMeter" )
require( "inGame.sp.SPWeaponInfoAmmoBar" )
require( "inGame.sp.SPWeaponInfoDesc" )
require( "inGame.sp.TargetInfo" )
require( "inGame.sp.WeaponScannedUnique" )
require( "inGame.sp.WeaponScannedUniqueWidget" )
require( "inGame.sp.WristPCTerminalHack" )
require( "inGame.TutorialMessage" )
require( "widgets.ItemCardMaskedBigImage" )
require( "widgets.MenuTitle" )
require( "widgets.ShowcaseLock" )
require( "widgets.sp.MissionPopupReward" )
require( "widgets.sp.MissionPopupRewards" )
require( "widgets.sp.MissionPopupRewardsWrapper" )
require( "widgets.VirtualKeyboard" )