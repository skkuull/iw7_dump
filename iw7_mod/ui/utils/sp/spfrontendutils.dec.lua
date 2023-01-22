SPFrontEndUtils = SPFrontEndUtils or {}
SPCaptainMissionDataTable = {
	"yardReport",
	"marsReport",
	"heistReport",
	"prisonerReport",
	"rogueReport",
	"titanReport",
	"europaReport",
	"moon_portReport",
	"pearlharborReport",
	"sa_assassinationReport",
	"sa_empambushReport",
	"sa_vipsReport",
	"sa_woundedReport",
	"sa_moonReport",
	"ja_spacestationReport",
	"ja_asteroidReport",
	"ja_miningReport",
	"ja_titanReport",
	"ja_wreckageReport"
}
SPCaptainAudioDataTable = {
	"audiologOmar",
	"audiologBrooks",
	"audiologKash",
	"audiologSalter",
	"audiologBoats",
	"audiologGator",
	"audiologGator2",
	"audiologDrops",
	"audiologMac",
	"audiologAlders",
	"audiologRaines",
	"audiologReyes",
	"audiologEthan",
	"audiologFerran",
	"audiologFerran2",
	"audiologGibson",
	"audiologGriff",
	"audiologGriff2",
	"kotchVideo",
	"newsVideo1",
	"newsVideo2",
	"newsVideo3",
	"newsVideo4",
	"newsVideo5",
	"newsVideo6",
	"hvtUpdate1",
	"hvtUpdate2",
	"hvtUpdate3",
	"hvtUpdate4"
}
SPCaptainPersonnelDataTable = {
	"personnelReyes1",
	"personnelReyes2",
	"personnelSalter1",
	"personnelSalter2",
	"personnelOmar1",
	"personnelOmar2",
	"personnelEthan1",
	"personnelEthan2",
	"personnelMac1",
	"personnelMac2",
	"personnelGator1",
	"personnelGator2",
	"personnelFerran1",
	"personnelFerran2",
	"personnelAirboss1",
	"personnelAirboss2",
	"personnelGriff1",
	"personnelGriff2",
	"personnelBrooks1",
	"personnelBrooks2",
	"personnelKashima1",
	"personnelKashima2",
	"personnelBoats",
	"personnelDO1",
	"personnelDO2",
	"personnelKloos",
	"personnelBoggs1",
	"personnelBoggs2",
	"personnelComms1",
	"personnelComms2",
	"personnelAlder",
	"personnelJack1",
	"personnelJack2",
	"personnelChaplain1",
	"personnelKotch1",
	"personnelKotch2",
	"personnelHVT1",
	"personnelHVT2",
	"personnelHVT3",
	"personnelHVT4"
}
MissionsTable = {
	"yard",
	"mars",
	"heist",
	"prisoner",
	"rogue",
	"titan",
	"europa",
	"moon_port",
	"pearlharbor",
	"sa_assassination",
	"sa_empambush",
	"sa_vips",
	"sa_wounded",
	"sa_moon",
	"ja_spacestation",
	"ja_asteroid",
	"ja_mining",
	"ja_titan",
	"ja_wreckage"
}
SideMissionsTable = {
	"sa_assassination",
	"sa_empambush",
	"sa_vips",
	"sa_wounded",
	"sa_moon"
}
NewsReelsTable = {
	"newsVideo1",
	"newsVideo2",
	"newsVideo3",
	"newsVideo4",
	"newsVideo5",
	"newsVideo6",
	"newsVideo7"
}
WantedCardsStart = {
	"salenKoch",
	"riah"
}
SPFrontEndUtils.MissionBasedProgressionSet = function ( f1_arg0, f1_arg1 )
	local f1_local0 = LUI.DataSourceFromPlayerData.new( CoD.ProgressionBlob.Gold, CoD.PlayMode.SP )
	local f1_local1 = f1_local0.spData
	for f1_local2 = 1, #MissionsTable, 1 do
		f1_local1.opsmapMissionStateData[MissionsTable[f1_local2]]:SetValue( f1_arg1, Cac.spMissionStates.LOCKED )
	end
	for f1_local2 = 1, #SPCaptainMissionDataTable, 1 do
		f1_local1.captainComputerMissionState[SPCaptainMissionDataTable[f1_local2]]:SetValue( f1_arg1, Cac.spComputerStates.LOCKED )
	end
	for f1_local2 = 1, #SPCaptainAudioDataTable, 1 do
		f1_local1.captainComputerAudioState[SPCaptainAudioDataTable[f1_local2]]:SetValue( f1_arg1, Cac.spComputerStates.LOCKED )
	end
	for f1_local2 = 1, #SPCaptainPersonnelDataTable, 1 do
		f1_local1.captainComputerPersonnelState[SPCaptainPersonnelDataTable[f1_local2]]:SetValue( f1_arg1, Cac.spComputerStates.LOCKED )
	end
	for f1_local2 = 1, #NewsReelsTable, 1 do
		f1_local1.scNewsReels[NewsReelsTable[f1_local2]]:SetValue( f1_arg1, Cac.spNewsReelStates.LOCKED )
	end
	f1_local1.wantedBoardDataState.salenKoch:SetValue( f1_arg1, "intelObtained_1" )
	f1_local1.wantedBoardDataState.riah:SetValue( f1_arg1, "intelObtained_1" )
	f1_local1.currentLoadout.levelCreated:SetValue( f1_arg1, 1024 )
	f1_local1.lastWeaponPreload:SetValue( f1_arg1, "nodata" )
	if f1_arg0 == "europa" then
		f1_local1.lastCompletedMission:SetValue( f1_arg1, "europa" )
		f1_local1.scPrisonerFirstPlay:SetValue( f1_arg1, 1 )
		f1_local1.scTitanFirstPlay:SetValue( f1_arg1, 0 )
		f1_local1.scTaughtOpsmap:SetValue( f1_arg1, 0 )
	elseif f1_arg0 == "phparade" then
		f1_local1.lastCompletedMission:SetValue( f1_arg1, "europa" )
		f1_local1.scPrisonerFirstPlay:SetValue( f1_arg1, 1 )
		f1_local1.scTitanFirstPlay:SetValue( f1_arg1, 0 )
		f1_local1.scTaughtOpsmap:SetValue( f1_arg1, 0 )
	elseif f1_arg0 == "phstreets" then
		f1_local1.lastCompletedMission:SetValue( f1_arg1, "phparade" )
		f1_local1.scPrisonerFirstPlay:SetValue( f1_arg1, 1 )
		f1_local1.scTitanFirstPlay:SetValue( f1_arg1, 0 )
		f1_local1.scTaughtOpsmap:SetValue( f1_arg1, 0 )
	elseif f1_arg0 == "phspace" then
		f1_local1.lastCompletedMission:SetValue( f1_arg1, "phstreets" )
		f1_local1.scPrisonerFirstPlay:SetValue( f1_arg1, 1 )
		f1_local1.scTitanFirstPlay:SetValue( f1_arg1, 0 )
		f1_local1.scTaughtOpsmap:SetValue( f1_arg1, 0 )
	elseif f1_arg0 == "shipcrib_moon" then
		f1_local1.lastCompletedMission:SetValue( f1_arg1, "phspace" )
		f1_local1.scPrisonerFirstPlay:SetValue( f1_arg1, 1 )
		f1_local1.scTitanFirstPlay:SetValue( f1_arg1, 0 )
		f1_local1.scTaughtOpsmap:SetValue( f1_arg1, 0 )
	elseif f1_arg0 == "moon_port" then
		f1_local1.lastCompletedMission:SetValue( f1_arg1, "shipcrib_moon" )
		f1_local1.scPrisonerFirstPlay:SetValue( f1_arg1, 1 )
		f1_local1.scTitanFirstPlay:SetValue( f1_arg1, 0 )
		f1_local1.scTaughtOpsmap:SetValue( f1_arg1, 0 )
	elseif f1_arg0 == "moonjackal" then
		f1_local1.lastCompletedMission:SetValue( f1_arg1, "moon_port" )
		f1_local1.scPrisonerFirstPlay:SetValue( f1_arg1, 1 )
		f1_local1.scTitanFirstPlay:SetValue( f1_arg1, 0 )
		f1_local1.scTaughtOpsmap:SetValue( f1_arg1, 0 )
	elseif f1_arg0 == "sa_moon" then
		f1_local1.lastCompletedMission:SetValue( f1_arg1, "moonjackal" )
		f1_local1.scPrisonerFirstPlay:SetValue( f1_arg1, 1 )
		f1_local1.scTitanFirstPlay:SetValue( f1_arg1, 0 )
		f1_local1.scTaughtOpsmap:SetValue( f1_arg1, 0 )
	elseif f1_arg0 == "shipcrib_europa" then
		f1_local1.lastCompletedMission:SetValue( f1_arg1, "sa_moon" )
		f1_local1.scPrisonerFirstPlay:SetValue( f1_arg1, 1 )
		f1_local1.scTitanFirstPlay:SetValue( f1_arg1, 0 )
		f1_local1.scTaughtOpsmap:SetValue( f1_arg1, 0 )
	elseif f1_arg0 == "shipcrib_titan" then
		f1_local1.lastCompletedMission:SetValue( f1_arg1, "sa_assassination" )
		for f1_local2 = 1, #SideMissionsTable, 1 do
			if f1_local1.missionStateData[SideMissionsTable[f1_local2]]:GetValue( f1_arg1 ) == "complete" then
				f1_local1.lastCompletedMission:SetValue( f1_arg1, SideMissionsTable[f1_local2] )
				break
			end
		end
		f1_local1.scPrisonerFirstPlay:SetValue( f1_arg1, 1 )
		f1_local1.scTitanFirstPlay:SetValue( f1_arg1, 0 )
		f1_local1.scTaughtOpsmap:SetValue( f1_arg1, 0 )
		f1_local1.scNewsReels.newsVideo1:SetValue( f1_arg1, Cac.spNewsReelStates.OPEN )
	elseif f1_arg0 == "titan" then
		f1_local1.lastCompletedMission:SetValue( f1_arg1, "shipcrib_titan" )
		f1_local1.scPrisonerFirstPlay:SetValue( f1_arg1, 1 )
	elseif f1_arg0 == "titanjackal" then
		f1_local1.lastCompletedMission:SetValue( f1_arg1, "titan" )
		f1_local1.scPrisonerFirstPlay:SetValue( f1_arg1, 1 )
	elseif f1_arg0 == "shipcrib_rogue" then
		f1_local1.lastCompletedMission:SetValue( f1_arg1, "titanjackal" )
		f1_local1.scPrisonerFirstPlay:SetValue( f1_arg1, 1 )
		f1_local1.scNewsReels.newsVideo1:SetValue( f1_arg1, Cac.spNewsReelStates.OPEN )
		f1_local1.scNewsReels.newsVideo2:SetValue( f1_arg1, Cac.spNewsReelStates.OPEN )
	elseif f1_arg0 == "rogue_dropship" then
		f1_local1.lastCompletedMission:SetValue( f1_arg1, "shipcrib_rogue" )
		f1_local1.scPrisonerFirstPlay:SetValue( f1_arg1, 1 )
	elseif f1_arg0 == "rogue" then
		f1_local1.lastCompletedMission:SetValue( f1_arg1, "rogue_dropship" )
		f1_local1.scPrisonerFirstPlay:SetValue( f1_arg1, 1 )
	elseif f1_arg0 == "shipcrib_prisoner" then
		f1_local1.lastCompletedMission:SetValue( f1_arg1, "rogue" )
		f1_local1.scPrisonerFirstPlay:SetValue( f1_arg1, 1 )
		f1_local1.scNewsReels.newsVideo1:SetValue( f1_arg1, Cac.spNewsReelStates.WATCHED )
		f1_local1.scNewsReels.newsVideo2:SetValue( f1_arg1, Cac.spNewsReelStates.WATCHED )
		f1_local1.scNewsReels.newsVideo3:SetValue( f1_arg1, Cac.spNewsReelStates.WATCHED )
		if f1_local1.missionStateData.ja_spacestation:GetValue( f1_arg1 ) == "complete" and f1_local1.missionStateData.ja_wreckage:GetValue( f1_arg1 ) == "complete" and f1_local1.missionStateData.ja_asteroid:GetValue( f1_arg1 ) == "complete" and f1_local1.missionStateData.ja_titan:GetValue( f1_arg1 ) == "complete" then
			f1_local1.opsmapMissionStateData.ja_mining:SetValue( f1_arg1, Cac.spMissionStates.INCOMPLETE )
		end
	elseif f1_arg0 == "prisoner" then
		f1_local1.lastCompletedMission:SetValue( f1_arg1, "shipcrib_prisoner" )
	elseif f1_arg0 == "heist" then
		f1_local1.lastCompletedMission:SetValue( f1_arg1, "prisoner" )
	elseif f1_arg0 == "heistspace" then
		f1_local1.lastCompletedMission:SetValue( f1_arg1, "heist" )
	elseif f1_arg0 == "marscrash" then
		f1_local1.lastCompletedMission:SetValue( f1_arg1, "heistspace" )
	elseif f1_arg0 == "marscrib" then
		f1_local1.lastCompletedMission:SetValue( f1_arg1, "marscrash" )
	elseif f1_arg0 == "marsbase" then
		f1_local1.lastCompletedMission:SetValue( f1_arg1, "marscrib" )
	elseif f1_arg0 == "yard" then
		f1_local1.lastCompletedMission:SetValue( f1_arg1, "marsbase" )
	elseif f1_arg0 == "shipcrib_epilogue" then
		f1_local1.lastCompletedMission:SetValue( f1_arg1, "yard" )
	elseif f1_arg0 == "sa_assassination" then
		f1_local1.lastCompletedMission:SetValue( f1_arg1, "shipcrib_titan" )
	elseif f1_arg0 == "sa_empambush" then
		f1_local1.lastCompletedMission:SetValue( f1_arg1, "shipcrib_titan" )
	elseif f1_arg0 == "sa_vips" then
		f1_local1.lastCompletedMission:SetValue( f1_arg1, "shipcrib_titan" )
	elseif f1_arg0 == "sa_wounded" then
		f1_local1.lastCompletedMission:SetValue( f1_arg1, "shipcrib_titan" )
	elseif f1_arg0 == "ja_asteroid" then
		f1_local1.lastCompletedMission:SetValue( f1_arg1, "shipcrib_titan" )
	elseif f1_arg0 == "ja_mining" then
		f1_local1.lastCompletedMission:SetValue( f1_arg1, "shipcrib_titan" )
	elseif f1_arg0 == "ja_spacestation" then
		f1_local1.lastCompletedMission:SetValue( f1_arg1, "shipcrib_titan" )
	elseif f1_arg0 == "ja_titan" then
		f1_local1.lastCompletedMission:SetValue( f1_arg1, "shipcrib_titan" )
	elseif f1_arg0 == "ja_wreckage" then
		f1_local1.lastCompletedMission:SetValue( f1_arg1, "shipcrib_titan" )
	end
end

