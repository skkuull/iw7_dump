local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
FenceShaderUpload = LUI.Class( LUI.Fence )
FenceShaderUpload.init = function ( f1_arg0 )
	FenceShaderUpload.super.init( f1_arg0 )
end

FenceShaderUpload.Start = function ( f2_arg0 )
	DebugPrint( "FenceShaderUpload.Start" )
end

FenceShaderUpload.Stop = function ( f3_arg0 )
	DebugPrint( "FenceShaderUpload.Stop" )
	LUI.FlowManager.RequestLeaveMenuByName( "ShaderUploadDialog", true )
	LUI.FlowManager.RequestLeaveMenuByName( "CancelShaderUploadDialog", true )
	LUI.FlowManager.RequestLeaveMenuByName( "BadDisplayDriverPopup", true )
	LUI.FlowManager.RequestLeaveMenuByName( "BadDisplayDriverConfirmationPopup", true )
end

FenceShaderUpload.UpdateState = function ( f4_arg0 )
	if f4_arg0._state == LUI.Fence.STATE.pass then
		return 
	end
	assert( f4_arg0._state ~= LUI.Fence.STATE.fail )
	local f4_local0 = Engine.DisplayDriverMeetsMinVer
	if f4_local0 then
		f4_local0 = not Engine.DisplayDriverMeetsMinVer()
	end
	if f4_local0 and not Engine.GetDvarBool( "r_ignoreBadDisplayDriver" ) then
		f4_arg0._state = LUI.Fence.STATE.block
		if not LUI.FlowManager.IsInStack( "BadDisplayDriverPopup" ) then
			LUI.FlowManager.RequestPopupMenu( nil, "BadDisplayDriverPopup", false, false, false, {}, nil, true, true )
		end
		return 
	elseif ShaderUpload and not Engine.GetDvarBool( "r_preloadShadersFrontendSkip" ) and not f4_arg0._didStart then
		f4_arg0._didStart = true
		if not ShaderUpload.Start() then
			Engine.SetDvarBool( "r_preloadShadersFrontendSkip", true )
		end
	end
	if not ShaderUpload or not ShaderUpload.IsWorkAvailable() or Engine.GetDvarBool( "r_preloadShadersFrontendSkip" ) then
		f4_arg0._state = LUI.Fence.STATE.pass
		return 
	end
	f4_arg0._state = LUI.Fence.STATE.block
	LUI.FlowManager.RequestPopupMenu( nil, "ShaderUploadDialog", false, false, false, {
		onCancelUpload = function ()
			Engine.SetDvarBool( "r_preloadShadersFrontendSkip", true )
		end
	}, nil, true, true )
end

function ShaderUploadDialog( f6_arg0, f6_arg1 )
	assert( f6_arg1 )
	assert( f6_arg1.onCancelUpload )
	local f6_local0 = MenuBuilder.BuildRegisteredType( "FenceDialogPopupWithProgress", {
		controllerIndex = f6_arg1.controllerIndex,
		message = Engine.Localize( "PLATFORM_UI_SHADER_FRONTEND_PRELOAD_WAIT" ),
		onCancel = function ()
			LUI.FlowManager.RequestPopupMenu( nil, "CancelShaderUploadDialog", false, false, false, {
				onCancelUpload = f6_arg1.onCancelUpload
			}, nil, true, true )
		end
	} )
	local self = LUI.UITimer.new( nil, {
		interval = 200,
		event = "update_bar"
	} )
	self.id = "timer"
	f6_local0:addElement( self )
	assert( f6_local0.SetProgress )
	self:registerEventHandler( "update_bar", function ( element, event )
		f6_local0:SetProgress( ShaderUpload.GetPercentComplete() )
	end )
	return f6_local0
end

MenuBuilder.registerType( "ShaderUploadDialog", ShaderUploadDialog )
function CancelShaderUploadDialog( f9_arg0, f9_arg1 )
	assert( f9_arg1 )
	assert( f9_arg1.onCancelUpload )
	local f9_local0 = MenuBuilder.BuildRegisteredType( "PopupYesNo", {
		title = Engine.Localize( "MENU_WARNING" ),
		message = Engine.Localize( "PLATFORM_UI_SHADER_FRONTEND_PRELOAD_SKIP" ),
		yesLabel = Engine.Localize( "PLATFORM_UI_SHADER_FRONTEND_PRELOAD_SKIP_CONFIRM" ),
		yesAction = function ( f10_arg0, f10_arg1 )
			ShaderUpload.Stop()
			f9_arg1.onCancelUpload()
		end,
		noLabel = Engine.Localize( "PLATFORM_UI_SHADER_FRONTEND_PRELOAD_SKIP_CANCEL" )
	} )
	f9_local0.id = "CancelShaderUploadDialog"
	return f9_local0
end

MenuBuilder.registerType( "CancelShaderUploadDialog", CancelShaderUploadDialog )
function BadDisplayDriverPopup()
	local f11_local0 = {
		cancelClosesPopup = false,
		buttonsClosePopup = false,
		title = Engine.Localize( "PLATFORM_UI_DISPLAY_DRIVER_UPDATE_TITLE" )
	}
	if Engine.GetDvarBool( "r_amdGPU" ) then
		f11_local0.message = Engine.Localize( "PLATFORM_UI_DISPLAY_DRIVER_UPDATE_MESSAGE_AMD", Engine.GetDvarString( "r_amdMinRadeonSoftwareRevReqString" ) )
	else
		f11_local0.message = Engine.Localize( "PLATFORM_UI_DISPLAY_DRIVER_UPDATE_MESSAGE_NVIDIA", Engine.GetDvarString( "r_nvidiaMinDriverRevReqString" ) )
	end
	f11_local0.buttons = {}
	table.insert( f11_local0.buttons, {
		label = Engine.Localize( "LUA_MENU_EXIT_GAME" ),
		action = function ()
			Engine.Quit()
		end
	} )
	table.insert( f11_local0.buttons, {
		label = Engine.Localize( "LUA_MENU_CONTINUE" ),
		action = function ()
			LUI.FlowManager.RequestPopupMenu( nil, "BadDisplayDriverConfirmationPopup", false, false, false, {}, nil, true, true )
		end
	} )
	local f11_local1 = MenuBuilder.BuildRegisteredType( "PopupMessageAndButtons", f11_local0 )
	f11_local1.id = "BadDisplayDriverPopup"
	return f11_local1
end

MenuBuilder.registerType( "BadDisplayDriverPopup", BadDisplayDriverPopup )
function BadDisplayDriverConfirmationPopup()
	local f14_local0 = MenuBuilder.BuildRegisteredType( "PopupYesNo", {
		cancelClosesPopup = false,
		title = Engine.Localize( "MENU_WARNING" ),
		message = Engine.Localize( "PLATFORM_UI_DISPLAY_DRIVER_UPDATE_MESSAGE_WARNING" ),
		yesAction = function ()
			Engine.SetDvarBool( "r_ignoreBadDisplayDriver", true )
			LUI.FlowManager.RequestLeaveMenuByName( "BadDisplayDriverConfirmationPopup", true )
			LUI.FlowManager.RequestLeaveMenuByName( "BadDisplayDriverPopup", true )
		end
	} )
	f14_local0.id = "BadDisplayDriverConfirmationPopup"
	return f14_local0
end

MenuBuilder.registerType( "BadDisplayDriverConfirmationPopup", BadDisplayDriverConfirmationPopup )
LUI.Fence.Register( "shaderUpload", FenceShaderUpload )
LockTable( _M )
