local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
function CODTVFencePopup( f1_arg0, f1_arg1 )
	local f1_local0 = assert
	local f1_local1 = f1_arg1
	local f1_local2 = f1_arg1.onCancel
	if f1_local2 then
		f1_local2 = f1_local1 and f1_arg1.callingFence
	end
	f1_local0( f1_local2 )
	f1_local2 = MenuBuilder.buildItems( {
		type = "live_dialog_text_box",
		properties = {
			message = Engine.Localize( "CODTV_FENCE_TEXT" ),
			cancel_func = f1_arg1.onCancel
		}
	} )
	f1_local2.id = "CODTVFencePopup"
	f1_local2.fence = f1_arg1.callingFence
	return f1_local2
end

MenuBuilder.registerType( "CODTVFencePopup", CODTVFencePopup )
