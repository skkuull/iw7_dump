local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
FenceCanCreateEmblem = LUI.Class( LUI.Fence )
FenceCanCreateEmblem.init = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3 )
	f1_arg0._controllerIndex = f1_arg2
	f1_arg0._openingAction = f1_arg3.openingAction
	FenceCanCreateEmblem.super.init( f1_arg0 )
end

FenceCanCreateEmblem.Start = function ( f2_arg0 )
	DebugPrint( "FenceCanCreateEmblem.Start" )
end

FenceCanCreateEmblem.Stop = function ( f3_arg0 )
	DebugPrint( "FenceCanCreateEmblem.Stop" )
	LUI.FlowManager.RequestLeaveMenuByName( "FenceDownloadingEmblems" )
	f3_arg0._openedPopup = false
end

FenceCanCreateEmblem.PostFail = function ( f4_arg0 )
	LUI.FlowManager.RequestPopupMenu( nil, "EmblemSlotLimitReachedPopup", true, f4_arg0._controllerIndex, false )
end

FenceCanCreateEmblem.UpdateState = function ( f5_arg0 )
	local f5_local0 = EmblemEditor.AreEmblemsInitialized()
	if f5_local0 and f5_arg0._openingAction == "edit" then
		f5_arg0._state = LUI.Fence.STATE.pass
	end
	if f5_arg0._state == LUI.Fence.STATE.pass then
		return 
	end
	assert( f5_arg0._state ~= LUI.Fence.STATE.fail )
	f5_arg0._state = LUI.Fence.STATE.block
	local f5_local1 = "frontEnd.MP.conquest.emblemEditor.custom."
	local f5_local2 = LUI.DataSourceInControllerModel.new( f5_local1 .. "downloadFinished" )
	if f5_local0 and f5_local2:GetValue( f5_arg0._controllerIndex ) then
		local f5_local3 = LUI.DataSourceInControllerModel.new( f5_local1 .. "count" )
		local f5_local4 = LUI.DataSourceInControllerModel.new( f5_local1 .. "totalSlots" )
		if f5_local3:GetValue( f5_arg0._controllerIndex ) - 1 < f5_local4:GetValue( f5_arg0._controllerIndex ) then
			f5_arg0._state = LUI.Fence.STATE.pass
		else
			f5_arg0._state = LUI.Fence.STATE.fail
		end
	elseif not f5_arg0._openedPopup then
		local f5_local3 = f5_arg0
		LUI.FlowManager.RequestPopupMenu( nil, "FenceDownloadingEmblems", false, false, false, {
			controllerIndex = f5_arg0._controllerIndex
		}, nil, true, true )
		f5_arg0._openedPopup = true
	end
end

function FenceDownloadingEmblems( f6_arg0, f6_arg1 )
	if not f6_arg1 then
		f6_arg1 = {}
	end
	local f6_local0 = {}
	local f6_local1 = f6_arg1.message
	if not f6_local1 then
		f6_local1 = Engine.Localize( "MP_EMBLEM_EDITOR_DOWNLOADING_EMBLEMS" )
	end
	f6_local0.message = f6_local1
	f6_local0.controllerIndex = f6_arg1.controllerIndex or 0
	return MenuBuilder.BuildRegisteredType( "FenceDialogPopup", f6_local0 )
end

MenuBuilder.registerType( "FenceDownloadingEmblems", FenceDownloadingEmblems )
LUI.Fence.Register( "canCreateEmblem", FenceCanCreateEmblem )
LockTable( _M )
