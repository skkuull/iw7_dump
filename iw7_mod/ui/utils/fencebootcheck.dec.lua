local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
FenceBootCheck = LUI.Class( LUI.Fence )
FenceBootCheck.init = function ( f1_arg0 )
	LUI.Fence.init( f1_arg0 )
end

FenceBootCheck.Start = function ( f2_arg0 )
	DebugPrint( "FenceBootCheck.Start" )
	Engine.BootCheckActivate()
end

FenceBootCheck.Stop = function ( f3_arg0 )
	DebugPrint( "FenceBootCheck.Stop" )
end

FenceBootCheck.UpdateState = function ( f4_arg0 )
	f4_arg0._state = LUI.Fence.STATE.block
	if Engine.BootCheckIsBlocking() then
		if Engine.BootCheckIsCorruptSaveDataDetected() then
			if Engine.GetDvarBool( "unattended" ) then
				Engine.BootCheckCorruptSaveDataDialogClosed()
			elseif not LUI.FlowManager.IsInStack( "bootcheck_corrupt_savedata_error_popup" ) then
				LUI.FlowManager.RequestPopupMenu( nil, "bootcheck_corrupt_savedata_error_popup", false, false, false, {}, nil, true, true )
			end
		end
	else
		f4_arg0._state = LUI.Fence.STATE.pass
	end
end

function bootcheck_corrupt_savedata_error_popup()
	local f5_local0 = MenuBuilder.BuildRegisteredType( "PopupOK", {
		title = Engine.Localize( "MENU_CORRUPT_SAVEDATA_TITLE" ),
		message = Engine.Localize( "MENU_CORRUPT_SAVEDATA_MESSAGE" ),
		action = function ()
			Engine.BootCheckCorruptSaveDataDialogClosed()
		end
	} )
	f5_local0.id = "bootcheck_corrupt_savedata_error_popup"
	return f5_local0
end

MenuBuilder.registerType( "bootcheck_corrupt_savedata_error_popup", bootcheck_corrupt_savedata_error_popup )
LUI.Fence.Register( "bootCheck", FenceBootCheck )
LockTable( _M )
