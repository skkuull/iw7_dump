local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
FenceSignIn = LUI.Class( LUI.Fence )
FenceSignIn.ACCOUNT_PICKER_STATE = {
	inactive = 1,
	picking = 2
}
FenceSignIn.init = function ( f1_arg0 )
	LUI.Fence.init( f1_arg0 )
	f1_arg0._perController = {}
	for f1_local0 = 0, Engine.GetMaxControllerCount() - 1, 1 do
		f1_arg0._perController[f1_local0] = {
			accountPickerState = FenceSignIn.ACCOUNT_PICKER_STATE.inactive
		}
	end
end

FenceSignIn.Start = function ( f2_arg0 )
	DebugPrint( "FenceSignIn.Start" )
end

FenceSignIn.Stop = function ( f3_arg0 )
	DebugPrint( "FenceSignIn.Stop" )
end

FenceSignIn.PostFail = function ( f4_arg0 )
	if f4_arg0._state == LUI.Fence.STATE.fail then
		LUI.FlowManager.RequestPopupMenu( nil, "popup_signin_error", false, false, false, {}, nil, false, true )
	end
end

FenceSignIn.OnBackOut = function ( f5_arg0 )
	Engine.EnableSplitscreenControls( "FenceSignIn.OnBackOut" )
end

FenceSignIn.UpdateState = function ( f6_arg0 )
	assert( f6_arg0._state ~= LUI.Fence.STATE.fail )
	f6_arg0._state = LUI.Fence.STATE.pass
	if Engine.IsShowingAccountPicker() then
		f6_arg0._state = LUI.Fence.STATE.block
		return 
	end
	for f6_local0 = 0, Engine.GetMaxControllerCount() - 1, 1 do
		if Engine.HasActiveLocalClient( f6_local0 ) and not Engine.IsUserSignedIn( f6_local0 ) then
			local f6_local3 = assert
			local f6_local4 = Engine.IsXB3()
			if not f6_local4 then
				f6_local4 = Engine.IsPCApp()
			end
			f6_local3( f6_local4 )
			if f6_arg0._perController[f6_local0].accountPickerState == FenceSignIn.ACCOUNT_PICKER_STATE.inactive then
				f6_arg0._state = LUI.Fence.STATE.block
				f6_arg0._perController[f6_local0].accountPickerState = FenceSignIn.ACCOUNT_PICKER_STATE.picking
				Engine.ShowAccountPicker( f6_local0, false )
				return 
			end
		end
	end
	local f6_local0 = 0
	local f6_local1 = 0
	for f6_local2 = 0, Engine.GetMaxControllerCount() - 1, 1 do
		if Engine.HasActiveLocalClient( f6_local2 ) and Engine.IsUserSignedIn( f6_local2 ) then
			f6_local0 = f6_local0 + 1
			if not Engine.IsUserAGuest( f6_local2 ) then
				f6_local1 = f6_local1 + 1
			end
		end
	end
	local f6_local2 = false
	if Engine.GetDvarBool( "systemlink" ) and Engine.IsPS4() and f6_local0 > 0 then
		f6_local2 = true
	end
	if f6_local0 > 0 and f6_local1 > 0 then
		f6_local2 = true
	end
	if f6_local2 then
		for f6_local5 = 0, Engine.GetMaxControllerCount() - 1, 1 do
			if Engine.HasActiveLocalClient( f6_local5 ) and not Engine.IsUserSignedIn( f6_local5 ) then
				Engine.MakeLocalClientInactive( f6_local5 )
				f6_arg0._perController[f6_local5].accountPickerState = FenceSignIn.ACCOUNT_PICKER_STATE.inactive
			end
		end
	else
		f6_arg0._state = LUI.Fence.STATE.fail
	end
end

function PopupSignInError( f7_arg0, f7_arg1 )
	local f7_local0 = "LUA_MENU_PROFILE_FORCE_SP"
	if Engine.IsPS4() then
		f7_local0 = "PLATFORM_NOT_SIGNED_IN"
	end
	if Engine.IsMultiplayer() then
		f7_local0 = "XBOXLIVE_MUSTLOGIN"
	end
	local f7_local1 = MenuBuilder.buildItems( {
		type = "generic_confirmation_popup",
		properties = {
			popup_title = Engine.Localize( "MENU_NOTICE" ),
			message_text = Engine.Localize( f7_local0 )
		}
	} )
	f7_local1.id = "popup_signin_error"
	return f7_local1
end

MenuBuilder.registerType( "popup_signin_error", PopupSignInError )
LUI.Fence.Register( "signIn", FenceSignIn )
LockTable( _M )
