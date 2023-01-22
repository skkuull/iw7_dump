local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
FenceStore = LUI.Class( LUI.Fence )
FenceStore.init = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0.super:init( f1_arg1, f1_arg2 )
	f1_arg0._controllerIndex = f1_arg2
	assert( f1_arg0._controllerIndex )
end

FenceStore.Start = function ( f2_arg0 )
	DebugPrint( "FenceStore.Start" )
	if Commerce.HasStoreData() == false then
		assert( f2_arg0._controllerIndex )
		Commerce.SetFeaturedItem( f2_arg0._controllerIndex, 0, "vip" )
		Commerce.SetFeaturedItem( f2_arg0._controllerIndex, 1, "bronzevc" )
		Commerce.SetFeaturedItem( f2_arg0._controllerIndex, 2, "silvervc" )
		Commerce.SetFeaturedItem( f2_arg0._controllerIndex, 3, "goldvc" )
		Commerce.SetFeaturedItem( f2_arg0._controllerIndex, 4, "platinumvc" )
		Commerce.SetFeaturedItem( f2_arg0._controllerIndex, 5, "diamondvc" )
		Commerce.GetStoreInfo( f2_arg0._controllerIndex, STORE.GetStoreProductString() )
	end
end

FenceStore.Stop = function ( f3_arg0 )
	DebugPrint( "FenceStore.Stop" )
	LUI.FlowManager.RequestLeaveMenuByName( "store_inprogress_popup", true )
	f3_arg0._openedPopup = false
end

FenceStore.UpdateState = function ( f4_arg0 )
	assert( f4_arg0._state ~= LUI.Fence.STATE.fail )
	if f4_arg0._state == LUI.Fence.STATE.pass then
		return 
	elseif Commerce.HasStoreData() then
		f4_arg0._state = LUI.Fence.STATE.pass
	elseif Commerce.HasError() then
		f4_arg0._state = LUI.Fence.STATE.fail
	else
		f4_arg0._state = LUI.Fence.STATE.block
		Engine.ClearLastErrorCode()
	end
	if f4_arg0._state == LUI.Fence.STATE.block and not f4_arg0._openedPopup then
		f4_arg0:ShowInProgressPopup()
	end
end

FenceStore.PostFail = function ( f5_arg0 )
	if f5_arg0._state == LUI.Fence.STATE.fail then
		if not Commerce.HasEmptyStore() then
			LUI.FlowManager.RequestPopupMenu( nil, "generic_error_popup", false, false, false, {
				message = Engine.Localize( "MP_FRONTEND_ONLY_STORE_UNAVAILABLE", Engine.GetLastErrorCode() )
			}, nil, false, true )
		end
		Engine.ClearLastErrorCode()
	end
end

FenceStore.ShowInProgressPopup = function ( f6_arg0 )
	LUI.FlowManager.RequestPopupMenu( nil, "store_inprogress_popup", false, false, false, {
		message = Engine.Localize( "MENU_FETCHING_STORE_INFO" )
	}, nil, true, true )
	f6_arg0._openedPopup = true
end

LUI.Fence.Register( "store", FenceStore )
LockTable( _M )
