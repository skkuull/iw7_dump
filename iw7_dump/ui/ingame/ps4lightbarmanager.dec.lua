LUI.PS4LightbarManager = LUI.Class( LUI.UIElement )
LightbarColors = {
	SWATCHES.Zombies.fateCardLightBar,
	SWATCHES.superMeter.superMeterFillBright
}
local f0_local0 = function ( f1_arg0 )
	return function ()
		if Game.GetOmnvar( "lb_gsc_controlled" ) then
			Engine.LightBarSetColor( f1_arg0, LightbarColors[math.max( math.min( Game.GetOmnvar( "lb_color" ), #LightbarColors ), 1 )], 0, Game.GetOmnvar( "lb_pulse_time" ) > 0 )
		else
			Engine.LightBarReset( f1_arg0 )
		end
	end
	
end

LUI.PS4LightbarManager.init = function ( f3_arg0, f3_arg1 )
	LUI.UIElement.init( f3_arg0 )
	f3_arg0.id = "PS4LightbarManager"
	f3_arg0._controllerIndex = f3_arg1
	local f3_local0 = f0_local0( f3_arg1 )
	f3_arg0:registerOmnvarHandler( "lb_gsc_controlled", f3_local0 )
	f3_arg0:registerOmnvarHandler( "lb_color", f3_local0 )
	f3_arg0:registerOmnvarHandler( "lb_pulse_time", f3_local0 )
end

LUI.PS4LightbarManager.ShouldBeVisible = function ( f4_arg0 )
	return false
end

LUI.PS4LightbarManager.InitLayer = function ( f5_arg0 )
	
end

LUI.PS4LightbarManager.ClearLayer = function ( f6_arg0, f6_arg1 )
	f6_arg0:closeChildren()
end

