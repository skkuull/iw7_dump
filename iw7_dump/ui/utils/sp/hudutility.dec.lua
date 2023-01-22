if not HudUtility then
	HudUtility = {}
end
HudUtility.hud_state_on = {
	alpha = 1
}
HudUtility.hud_state_off = {
	alpha = 0
}
HudUtility.WristPCScreens = {
	Off = 0,
	Standby = 1,
	Jackal = 2,
	RobotHack = 3,
	C12 = 4,
	Hacking = 5,
	Shield = 6,
	TerminalHack = 7
}
HudUtility.HudMenuFilter = function ( f1_arg0 )
	return function ( f2_arg0, f2_arg1 )
		assert( f2_arg0.properties.HudMenuName, f2_arg0.id .. " is missing self.properties.HideEventName" )
		if f2_arg1.menu == f2_arg0.properties.HudMenuName or f2_arg0.properties.HudMenuName2 and f2_arg1.menu == f2_arg0.properties.HudMenuName2 then
			f1_arg0( f2_arg0, f2_arg1 )
		elseif not EventCatcher.isDirectDispatchEventType( f2_arg1.name ) then
			f2_arg0:dispatchEventToChildren( f2_arg1 )
		end
	end
	
end

HudUtility.ShowHudNoFilter = function ( f3_arg0 )
	if f3_arg0.hidden or f3_arg0.hidden == nil then
		f3_arg0.hidden = false
		f3_arg0.hideTimer = 0
		f3_arg0:animateToState( "hud_on", 500 )
	end
end

HudUtility.ShowHud = HudUtility.HudMenuFilter( HudUtility.ShowHudNoFilter )
HudUtility.HideHudNoFilter = function ( f4_arg0 )
	if not f4_arg0.hidden then
		f4_arg0.hidden = true
		if Engine.GetDvarBool( "hideHudFast" ) then
			f4_arg0:animateToState( "hud_off", 0 )
		else
			local f4_local0 = 8000
			if f4_arg0.properties.HudMenuName == "Ammo" then
				f4_local0 = Engine.GetDvarFloat( "hud_fade_ammodisplay" ) * 1000
			elseif f4_arg0.properties.HudMenuName == "Stance" then
				f4_local0 = Engine.GetDvarFloat( "hud_fade_stance" ) * 1000
			elseif f4_arg0.properties.HudMenuName == "Offhand" then
				f4_local0 = Engine.GetDvarFloat( "hud_fade_offhand" ) * 1000
			end
			f4_arg0.hideTimer = f4_local0
		end
	end
end

HudUtility.HideHud = HudUtility.HudMenuFilter( HudUtility.HideHudNoFilter )
HudUtility.HideTimer = function ( f5_arg0, f5_arg1 )
	if f5_arg0.hideTimer and f5_arg0.hideTimer > 0 then
		f5_arg0.hideTimer = f5_arg0.hideTimer - f5_arg1.timeElapsed
		if f5_arg0.hideTimer <= 0 then
			f5_arg0:animateToState( "hud_off", 500 )
		end
	end
end

HudUtility.CorruptSaveDataRepairForSP = function ( f6_arg0 )
	Engine.DeleteProfile( f6_arg0 )
	Engine.WriteProfile( f6_arg0 )
	Engine.Exec( "savegame_writelastcommittedsave" )
end

