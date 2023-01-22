local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
LUI.OverlayHUD = LUI.Class( LUI.UIElement )
LUI.OverlayHUD.init = function ( f1_arg0, f1_arg1 )
	LUI.OverlayHUD.super.init( f1_arg0, {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0
	} )
	f1_arg0.id = "OverlayHUD"
	assert( f1_arg1 )
	f1_arg0.controllerIndex = f1_arg1 or f1_arg0:getRootController()
	f1_arg0.overlays = {}
	f1_arg0:registerOmnvarHandler( "ui_session_state", LUI.OverlayHUD.UpdateOverlays )
	f1_arg0:registerEventHandler( "weapon_change", LUI.OverlayHUD.UpdateOverlays )
	f1_arg0:registerEventHandler( "playerstate_client_changed", LUI.OverlayHUD.UpdateOverlays )
	f1_arg0:registerEventHandler( "level_load", function ( element, event )
		element:UpdateOverlays( {
			forceCloseOverlays = true
		} )
	end )
end

LUI.OverlayHUD.RefreshOnDataSourceChange = function ( f3_arg0, f3_arg1 )
	f3_arg0:SubscribeToModel( f3_arg1:GetModel( f3_arg0:getRootController() ), function ()
		f3_arg0:UpdateOverlays()
	end )
end

LUI.OverlayHUD.GetToggleOverlays = function ( f5_arg0 )
	return {}
end

LUI.OverlayHUD.UpdateOverlays = function ( f6_arg0, f6_arg1 )
	local f6_local0, f6_local1 = nil
	if f6_arg1 and f6_arg1.forceCloseOverlays then
		f6_local1 = 0
		f6_local0 = {}
	else
		f6_local0, f6_local1 = f6_arg0:GetToggleOverlays()
		if not f6_local1 then
			f6_local1 = 0
		end
	end
	for f6_local5, f6_local6 in pairs( f6_local0 ) do
		if not f6_arg0.overlays[f6_local5] then
			f6_arg0.overlays[f6_local5] = f6_local6.new( f6_arg0.controllerIndex )
			f6_arg0.overlays[f6_local5].closeCount = 0
			f6_arg0.overlays[f6_local5].closing = false
			f6_arg0:addElement( f6_arg0.overlays[f6_local5] )
		else
			f6_arg0.overlays[f6_local5].closing = false
		end
	end
	for f6_local5, f6_local6 in pairs( f6_arg0.overlays ) do
		if not f6_local0[f6_local5] and not f6_local6.closing then
			if f6_local1 > 0 then
				f6_local6.closing = true
				f6_local6.closeCount = f6_local6.closeCount + 1
				local f6_local7 = f6_local6.closeCount
				local f6_local8 = f6_local5
				local f6_local9 = f6_local6
				local f6_local10 = f6_local6:Wait( f6_local1 )
				f6_local10.onComplete = function ()
					if f6_local9.closing and f6_local9.closeCount == f6_local7 then
						f6_local9:closeTree()
						f6_arg0.overlays[f6_local8] = nil
					end
				end
				
			else
				f6_local6:closeTree()
				f6_arg0.overlays[f6_local5] = nil
			end
		end
	end
end

LockTable( _M )
