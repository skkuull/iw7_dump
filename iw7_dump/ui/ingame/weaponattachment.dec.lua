local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
f0_local0 = function ()
	if Game.InKillCam() then
		if Game.IsCinematicCameraActive() then
			return false
		elseif Game.IsKillCamEntityActive() then
			return false
		end
	elseif Game.IsSpectatorCameraActive() then
		return false
	end
	return true
end

function blurTargetChanged( f2_arg0, f2_arg1 )
	if f0_local0() then
		Game.StartBlur( Game.GetOmnvar( "blur_target" ), Game.GetOmnvar( "blur_duration_ms" ) )
	else
		Game.StartBlur( 0, 0 )
	end
end

function blurClientChanged( f3_arg0, f3_arg1 )
	if f0_local0() then
		Game.StartBlur( Game.GetOmnvar( "blur_target" ), 0 )
	else
		Game.StartBlur( 0, 0 )
	end
end

function blurProcessing()
	local self = LUI.UIElement.new()
	self.id = "blurUpdater"
	self:registerOmnvarHandler( "blur_target", blurTargetChanged )
	self:registerEventHandler( "playerstate_client_changed", blurClientChanged )
	self:registerEventHandler( "camera_client_changed", blurClientChanged )
	return self
end

MenuBuilder.registerType( "blurProcessing", blurProcessing )
LockTable( _M )
