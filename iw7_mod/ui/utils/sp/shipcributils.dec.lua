if not ShipCribUtils then
	ShipCribUtils = {}
end
ShipCribUtils.MostWantedStates = {
	VIEWED = "viewed",
	LOCKED = "locked",
	OBTAINED = "obtained",
	INTELOBTAINED_1 = "intelObtained_1",
	INTELVIEWED_1 = "intelViewed_1",
	INTELOBTAINED_2 = "intelObtained_2",
	INTELVIEWED_2 = "intelViewed_2",
	INTELOBTAINED_3 = "intelObtained_3",
	INTELVIEWED_3 = "intelViewed_3",
	INTELOBTAINED_4 = "intelObtained_4",
	INTELVIEWED_4 = "intelViewed_4"
}
ShipCribUtils.MostWantedSpecialCards = {
	RIAH = "riah",
	SALEN_KOCH = "salenKoch"
}
ShipCribUtils.CapCompStates = {
	LOCKED = "locked",
	OPEN = "open",
	KIA = "kia",
	READ = "read"
}
ShipCribUtils.UpdateTargetName = function ( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = f1_arg0:GetDataSource()
	f1_local0 = f1_local0.name:GetValue( f1_arg2 )
	local f1_local1 = f1_arg0:GetDataSource()
	f1_local1 = f1_local1.state:GetValue( f1_arg2 )
	if f1_local0 ~= nil then
		local f1_local2 = f1_arg0:GetDataSource()
		if f1_local1 == ShipCribUtils.MostWantedStates.LOCKED and f1_local2.identifier:GetValue( f1_arg2 ) == ShipCribUtils.MostWantedSpecialCards.SALEN_KOCH then
			f1_arg1:setText( ToUpperCase( Engine.Localize( "MOSTWANTED_UNKNOWN" ) ), 0 )
		else
			f1_arg1:setText( ToUpperCase( Engine.Localize( f1_local0 ) ), 0 )
		end
	end
end

ShipCribUtils.UpdateVesselName = function ( f2_arg0, f2_arg1, f2_arg2 )
	local f2_local0 = f2_arg0:GetDataSource()
	f2_local0 = f2_local0.vessel:GetValue( f2_arg2 )
	local f2_local1 = f2_arg0:GetDataSource()
	f2_local1 = f2_local1.state:GetValue( f2_arg2 )
	if f2_local0 ~= nil then
		f2_arg1:setText( ToUpperCase( Engine.Localize( "MOSTWANTED_LABEL_VESSEL", Engine.Localize( f2_local0 ) ) ), 0 )
	end
end

ShipCribUtils.CapCompBuildTabData = function ( f3_arg0, f3_arg1, f3_arg2 )
	local f3_local0 = {}
	for f3_local1 = 0, Engine.TableGetRowCount( f3_arg0.file ) - 1, 1 do
		local f3_local4 = CSV.ReadRow( f3_arg0, f3_local1 )
		if f3_arg1[f3_local4.ref]:GetValue( f3_arg2 ) ~= ShipCribUtils.CapCompStates.LOCKED then
			table.insert( f3_local0, f3_local4 )
		end
	end
	return f3_local0
end

ShipCribUtils.GetSelectedMission = function ()
	if Engine.GetDvarBool( "missionSelected" ) then
		local f4_local0 = Game.GetOmnvar( "ui_opsmap_selected_mission" )
		if f4_local0 and f4_local0 ~= "none" then
			return f4_local0
		end
	end
	return ""
end

ShipCribUtils.IsSelectedMissionJackal = function ()
	return string.match( ShipCribUtils.GetSelectedMission(), "^ja_" )
end

