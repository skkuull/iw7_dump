local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
LUI.JackalCallDownOverlay = LUI.Class( LUI.HUD )
LUI.JackalCallDownOverlay.init = function ( f1_arg0, f1_arg1 )
	LUI.JackalCallDownOverlay.super.init( f1_arg0, f1_arg1 )
	f1_arg0.id = "JackalCallDownOverlay"
	local f1_local0 = 0
	local f1_local1 = 0
	f1_arg0.connection = f1_arg0:AddWidget( "JackalConnectionStatus", {
		scalable = true,
		shakeable = true,
		rightAnchor = false,
		leftAnchor = true,
		topAnchor = true,
		bottomAnchor = false,
		horizontalOffset = 60,
		verticalOffset = 40,
		useFullscreenHUDMask = true,
		curvedX = f1_local0,
		curvedY = f1_local1
	} )
	f1_arg0.connection:SetYRotation( 20 )
	f1_arg0.schematic = f1_arg0:AddWidget( "JackalSchematic", {
		scalable = true,
		shakeable = true,
		rightAnchor = false,
		leftAnchor = true,
		topAnchor = true,
		bottomAnchor = false,
		horizontalOffset = 60,
		verticalOffset = 90,
		useFullscreenHUDMask = true,
		curvedX = f1_local0,
		curvedY = f1_local1
	} )
	f1_arg0.schematic:SetYRotation( 20 )
	f1_arg0.logo = f1_arg0:AddWidget( "JackalLogo", {
		scalable = true,
		shakeable = true,
		rightAnchor = true,
		leftAnchor = false,
		topAnchor = false,
		bottomAnchor = true,
		horizontalOffset = 50,
		verticalOffset = 50,
		useFullscreenHUDMask = true,
		curvedX = f1_local0,
		curvedY = f1_local1
	} )
	f1_arg0.targets = f1_arg0:AddWidget( "JackalTargets", {
		scalable = true,
		shakeable = true,
		rightAnchor = true,
		leftAnchor = false,
		topAnchor = true,
		bottomAnchor = false,
		horizontalOffset = 80,
		verticalOffset = 180,
		useFullscreenHUDMask = true,
		curvedX = f1_local0,
		curvedY = f1_local1
	} )
	f1_arg0.targets:SetYRotation( -20 )
	f1_arg0.printout = f1_arg0:AddWidget( "jackalPrintoutWindow", {
		scalable = true,
		shakeable = true,
		rightAnchor = true,
		leftAnchor = false,
		topAnchor = true,
		bottomAnchor = false,
		horizontalOffset = 80,
		verticalOffset = 215,
		useFullscreenHUDMask = true,
		curvedX = f1_local0,
		curvedY = f1_local1
	} )
	f1_arg0.printout:SetYRotation( -20 )
	f1_arg0:SubscribeToModel( DataSources.inGame.HUD.overlay.jackalCallDownActive:GetModel( f1_arg0.controllerIndex ), function ()
		LUI.HUD.UpdateWidgetsVisibility( f1_arg0 )
	end )
end

LUI.JackalCallDownOverlay.GetToggleWidgets = function ( f3_arg0 )
	local f3_local0 = {}
	local f3_local1 = false
	if not DataSources.inGame.HUD.overlay.jackalCallDownActive:GetValue( f3_arg0.controllerIndex ) then
		f3_local1 = true
	end
	local f3_local2 = {
		off = "snap",
		on = "snap",
		[f3_arg0.connection] = {
			off = "shutdown",
			on = "snap"
		},
		[f3_arg0.schematic] = {
			off = "shutdown",
			on = "snap"
		},
		[f3_arg0.logo] = {
			off = "shutdown",
			on = "snap"
		}
	}
	if Engine.IsSingleplayer() then
		f3_local2[f3_arg0.targets] = {
			off = "shutdown",
			on = "snap"
		}
		f3_local2[f3_arg0.printout] = {
			off = "shutdown",
			on = "snap"
		}
	end
	return f3_local0, f3_local1, f3_local2
end

LockTable( _M )
