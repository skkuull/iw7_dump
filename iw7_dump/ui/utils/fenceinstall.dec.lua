local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
FenceInstall = LUI.Class( LUI.Fence )
FenceInstall.init = function ( f1_arg0, f1_arg1 )
	assert( type( f1_arg1 ) == "string" )
	FenceInstall.super.init( f1_arg0 )
	f1_arg0._packageName = f1_arg1
end

FenceInstall.Start = function ( f2_arg0 )
	assert( f2_arg0._packageName )
	DebugPrint( "FenceInstall.Start" )
end

FenceInstall.Stop = function ( f3_arg0 )
	DebugPrint( "FenceInstall.Stop" )
	LUI.FlowManager.RequestLeaveMenuByName( "FenceStreamingInstall", true )
	f3_arg0._openedPopup = false
end

FenceInstall.UpdateState = function ( f4_arg0 )
	if f4_arg0._state == LUI.Fence.STATE.pass then
		return 
	end
	assert( f4_arg0._state ~= LUI.Fence.STATE.fail )
	f4_arg0._state = LUI.Fence.STATE.block
	local f4_local0, f4_local1 = Engine.StreamingCheckInstall()
	if f4_local0 == 1 and f4_local1 == 0 then
		f4_arg0._state = LUI.Fence.STATE.pass
	elseif not f4_arg0._openedPopup then
		local f4_local2 = f4_arg0
		LUI.FlowManager.RequestPopupMenu( nil, "FenceStreamingInstall", false, false, false, {
			onCancel = function ()
				f4_local2._state = LUI.Fence.STATE.fail
			end
		}, nil, true, true )
		f4_arg0._openedPopup = true
	end
end

function FenceStreamingInstall( f6_arg0, f6_arg1 )
	assert( f6_arg1 )
	f6_arg1.message = Engine.Localize( "MENU_STREAMING_INSTALL_IN_PROGRESS" )
	local f6_local0 = MenuBuilder.BuildRegisteredType( "FenceDialogPopupWithProgress", f6_arg1 )
	local self = LUI.UITimer.new( nil, {
		interval = 200,
		event = "update_streaming_bar"
	} )
	self.id = "timer"
	f6_local0:addElement( self )
	assert( f6_local0.SetProgress )
	self:registerEventHandler( "update_streaming_bar", function ( element, event )
		local f7_local0, f7_local1 = Engine.StreamingCheckInstall()
		f6_local0:SetProgress( f7_local0 )
	end )
	return f6_local0
end

MenuBuilder.registerType( "FenceStreamingInstall", FenceStreamingInstall )
FenceMPInstall = LUI.Class( FenceInstall )
FenceMPInstall.init = function ( f8_arg0 )
	FenceMPInstall.super.init( f8_arg0, "mp" )
end

LUI.Fence.Register( "mpInstall", FenceMPInstall )
FenceSPInstall = LUI.Class( FenceInstall )
FenceSPInstall.init = function ( f9_arg0 )
	FenceSPInstall.super.init( f9_arg0, "sp" )
end

LUI.Fence.Register( "spInstall", FenceSPInstall )
LockTable( _M )
