local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
LUI.FlowManager.RegisterFenceGroup( "CODTvMenu", {
	"codtv"
} )
f0_local0 = "frontEnd.streams"
f0_local1 = "mlgcontent.streams"
f0_local2 = "mlgcontent.VOD"
local f0_local3 = {
	"CODTV_NO_STREAMS",
	"CODTV_NO_VODS"
}
local f0_local4 = nil
local f0_local5 = function ()
	local f1_local0 = LiveStreaming.StopVideo()
	MLGContent.TakeOverCinematic( false )
	MLGContent.DisallowImageFetch()
	Engine.SetDvarString( "ui_mapname", "mp_frontier" )
	return f1_local0
end

local f0_local6 = function ( f2_arg0, f2_arg1, f2_arg2 )
	if f2_arg0.StreamDescription then
		local f2_local0 = f2_arg0.ButtonList:GetDataSource()
		f2_local0 = f2_local0.description:GetValue( f2_arg1 )
		if f2_local0 == nil or f2_local0 == "" then
			if f2_arg2 == CODTV.VIDEO_TYPE.STREAM then
				local f2_local1 = f2_arg0.ButtonList:GetDataSource()
				f2_local1 = f2_local1.subtitle:GetValue( f2_arg1 )
				if f2_local1 ~= nil then
					f2_local0 = tostring( f2_local1 )
				end
			else
				f2_local0 = ""
			end
		end
		f2_arg0.StreamDescription:setText( f2_local0 )
	end
	local f2_local0 = f2_arg0.ButtonList:GetDataSource()
	f2_local0 = f2_local0.name:GetValue( f2_arg1 )
	f2_arg0.DetailsName:setText( ToUpperCase( f2_local0 ) )
	f2_arg0.CODTvFullscreenVideoInfos.VideoTitle:setText( ToUpperCase( f2_local0 ) )
	f2_arg0.DetailsStrip:SetAlpha( 1 )
end

local f0_local7 = function ( menu, controller )
	local timer = LUI.UITimer.new( nil, {
		interval = 3000,
		event = "hideButtonHelperAction",
		disposable = false,
		broadcastToRoot = false,
		stopped = false,
		controllerIndex = controller
	} )
	menu:addElement( timer )
	menu.timer = timer
	
end

local f0_local8 = function ( menu, controller )
	local leaveMenuTimer = LUI.UITimer.new( nil, {
		interval = 200,
		event = "leaveCODTVMenuAction",
		disposable = false,
		broadcastToRoot = false,
		stopped = false,
		controllerIndex = controller
	} )
	menu:addElement( leaveMenuTimer )
	menu.leaveMenuTimer = leaveMenuTimer
	
end

local f0_local9 = function ( f5_arg0, f5_arg1 )
	local f5_local0 = DataSources.frontEnd.MP.codtv.vodCount:GetValue( f5_arg1 )
	local f5_local1
	if f5_arg0.playingVideoType == CODTV.VIDEO_TYPE.VOD then
		f5_local1 = f5_arg0._autoplayVODs
		if f5_local1 then
			if f5_arg0._playingStreamIndex + 1 >= f5_local0 then
				f5_local1 = false
			else
				f5_local1 = true
			end
		end
	else
		f5_local1 = false
	end
	return f5_local1
end

local f0_local10 = function ( f6_arg0, f6_arg1 )
	if f6_arg0.videosInfosDisplayTimer ~= nil then
		f6_arg0.videosInfosDisplayTimer:close()
		f6_arg0.videosInfosDisplayTimer = nil
	end
	local videosInfosDisplayTimer = LUI.UITimer.new( nil, {
		interval = 3000,
		event = "hideVideosInfos",
		disposable = false,
		broadcastToRoot = false,
		stopped = false,
		controllerIndex = f6_arg1
	} )
	f6_arg0:addElement( videosInfosDisplayTimer )
	f6_arg0.videosInfosDisplayTimer = videosInfosDisplayTimer
	
end

local f0_local11 = function ( f7_arg0, f7_arg1 )
	if f0_local9( f7_arg0, f7_arg1 ) then
		MLGContent.Stream( CODTV.VIDEO_TYPE.VOD, f7_arg0._playingStreamIndex + 1 )
		f7_arg0._playingStreamIndex = f7_arg0._playingStreamIndex + 1
		f7_arg0._streamIndexPerType[CODTV.VIDEO_TYPE.VOD + 1] = f7_arg0._playingStreamIndex
		f7_arg0.ButtonList:SetFocusedPosition( {
			x = 0,
			y = f7_arg0._playingStreamIndex
		}, false, true )
		local f7_local0 = LUI.DataSourceInGlobalModel.new( f0_local2 .. "." .. f7_arg0._playingStreamIndex .. ".name" )
		f7_local0 = f7_local0:GetValue( f7_arg1 )
		f7_arg0.DetailsName:setText( ToUpperCase( f7_local0 ) )
		f7_arg0.DetailsStrip:SetAlpha( 1 )
		if f7_arg0.StreamDescription then
			local f7_local1 = LUI.DataSourceInGlobalModel.new( f0_local2 .. "." .. f7_arg0._playingStreamIndex .. ".description" )
			f7_local1 = f7_local1:GetValue( f7_arg1 )
			if f7_local1 == nil then
				f7_local1 = ""
			end
			f7_arg0.StreamDescription:setText( f7_local1 )
		end
		f7_arg0.CODTvFullscreenVideoInfos.VideoTitle:setText( ToUpperCase( f7_local0 ) )
		return true
	else
		return false
	end
end

local f0_local12 = function ( f8_arg0, f8_arg1 )
	if not f0_local11( f8_arg0, f8_arg1 ) then
		f8_arg0.CODTvStatusWidget:SetAlpha( 0 )
		ACTIONS.AnimateSequence( f8_arg0, "ShowWatermark" )
	end
end

local f0_local13 = function ( f9_arg0, f9_arg1, f9_arg2 )
	if f9_arg2 == CODTV.VIDEO_STATUS.LOADING then
		ACTIONS.AnimateSequence( f9_arg0, "ShowSpinner" )
		f9_arg0.CODTvStatusWidget:SetAlpha( 0 )
		f9_arg0.WatermarkHeader:SetAlpha( 0 )
	elseif f9_arg2 == CODTV.VIDEO_STATUS.PLAYING then
		ACTIONS.AnimateSequence( f9_arg0, "HideSpinner" )
		if f9_arg0._isFullScreen then
			if f9_arg0._isButtonListVisible then
				ACTIONS.AnimateSequence( f9_arg0, "HideButtonList" )
				ACTIONS.LoseFocus( f9_arg0, "ButtonList", f9_arg1 )
				f0_local7( f9_arg0, f9_arg1 )
				f9_arg0._isButtonListVisible = false
			end
			ACTIONS.AnimateSequence( f9_arg0, "ShowFullScreenVideosInfos" )
			f0_local10( f9_arg0, f9_arg1 )
		end
	elseif f9_arg2 == CODTV.VIDEO_STATUS.ERROR then
		f9_arg0.WatermarkHeader:SetAlpha( 0 )
		ACTIONS.AnimateSequence( f9_arg0, "HideSpinner" )
		ACTIONS.AnimateSequence( f9_arg0, "ShowStatus" )
	elseif f9_arg2 == CODTV.VIDEO_STATUS.FINISHED and f9_arg0._currentStatus == CODTV.VIDEO_STATUS.PLAYING then
		f0_local12( f9_arg0, f9_arg1 )
	end
	f9_arg0._currentStatus = f9_arg2
end

local f0_local14 = function ( f10_arg0 )
	if f10_arg0.timer ~= nil then
		f10_arg0.timer:close()
		f10_arg0.timer = nil
	end
end

local f0_local15 = function ( f11_arg0, f11_arg1 )
	if f11_arg0._buttonHelperVisible then
		ACTIONS.AnimateSequence( f11_arg0, "HideButtonHelper" )
		f0_local14( f11_arg0 )
		f11_arg0._buttonHelperVisible = false
	end
end

local f0_local16 = function ( f12_arg0 )
	if not f12_arg0._buttonHelperVisible then
		ACTIONS.AnimateSequence( f12_arg0, "ShowButtonHelper" )
		f12_arg0._buttonHelperVisible = true
	end
end

local f0_local17 = function ( f13_arg0, f13_arg1 )
	ACTIONS.AnimateSequence( f13_arg0, "Fullscreen" )
	ACTIONS.AnimateSequence( f13_arg0, "HideButtonList" )
	f13_arg0._isFullScreen = true
	f13_arg0._isButtonListVisible = false
	f13_arg0.Tabs.Tabs:DisableAll()
	ACTIONS.LoseFocus( f13_arg0, "ButtonList", f13_arg1 )
	f13_arg0:AddButtonHelperTextToElement( f13_arg0.ButtonHelperBar, {
		helper_text = Engine.Localize( "CODTV_SHOW_MENU" ),
		button_ref = "button_left_trigger",
		side = "left",
		clickable = true,
		priority = 1000
	} )
	f0_local7( f13_arg0, f13_arg1 )
end

local f0_local18 = function ( f14_arg0, f14_arg1 )
	ACTIONS.AnimateSequence( f14_arg0, "NonFullScreen" )
	local f14_local0 = f14_arg0._streamIndexPerType[f14_arg0._modelType + 1]
	if f14_arg0._isButtonListVisible == false then
		ACTIONS.AnimateSequence( f14_arg0, "ShowButtonList" )
		ACTIONS.GainFocus( f14_arg0, "ButtonList", f14_arg1 )
	end
	if f14_arg0.timer == nil then
		f0_local16( f14_arg0 )
	end
	f0_local14( f14_arg0 )
	f14_arg0.Tabs.Tabs:EnableAll()
	f14_arg0._isFullScreen = false
	f14_arg0._isButtonListVisible = true
	f14_arg0:RemoveButtonHelperTextFromElement( f14_arg0.ButtonHelperBar, "button_left_trigger", "left" )
	if f14_arg0.videosInfosDisplayTimer ~= nil then
		f14_arg0.videosInfosDisplayTimer:close()
		f14_arg0.videosInfosDisplayTimer = nil
	end
	f14_arg0.CODTvFullscreenVideoInfos:SetAlpha( 0 )
	f14_arg0._streamIndexPerType[f14_arg0._modelType + 1] = f14_local0
	f14_arg0.ButtonList:SetFocusedPosition( {
		x = 0,
		y = f14_arg0._streamIndexPerType[f14_arg0._modelType + 1]
	}, false, true )
end

local f0_local19 = function ( f15_arg0, f15_arg1 )
	if f15_arg0._isFullScreen then
		if f15_arg0._isButtonListVisible then
			ACTIONS.AnimateSequence( f15_arg0, "HideButtonList" )
			ACTIONS.LoseFocus( f15_arg0, "ButtonList", f15_arg1 )
			f15_arg0._isButtonListVisible = false
			f15_arg0.Tabs.Tabs:DisableAll()
			f0_local7( f15_arg0, f15_arg1 )
		else
			local f15_local0 = f15_arg0._streamIndexPerType[f15_arg0._modelType + 1]
			ACTIONS.AnimateSequence( f15_arg0, "ShowButtonList" )
			ACTIONS.GainFocus( f15_arg0, "ButtonList", f15_arg1 )
			f15_arg0._isButtonListVisible = true
			f15_arg0.Tabs.Tabs:EnableAll()
			if f15_arg0.timer == nil then
				f0_local16( f15_arg0 )
			end
			f0_local14( f15_arg0 )
			f15_arg0._streamIndexPerType[f15_arg0._modelType + 1] = f15_local0
			f15_arg0.ButtonList:SetFocusedPosition( {
				x = 0,
				y = f15_arg0._streamIndexPerType[f15_arg0._modelType + 1]
			}, false, true )
		end
	end
end

local f0_local20 = function ( menu, controller )
	local enterMenuTimer = LUI.UITimer.new( nil, {
		interval = 2000,
		event = "enterMenuTimerDone",
		disposable = false,
		broadcastToRoot = false,
		stopped = false,
		controllerIndex = controller
	} )
	menu:addElement( enterMenuTimer )
	menu.enterMenuTimer = enterMenuTimer
	
	menu.disableAllInputForMenu = true
end

local f0_local21 = function ()
	if f0_local4 ~= true then
		f0_local5()
	end
	WipeGlobalModelsAtPath( f0_local0 )
end

local f0_local22 = function ( f18_arg0, f18_arg1 )
	f18_arg0:RemoveButtonHelperTextFromElement( f18_arg0.ButtonHelperBar, "button_alt2", "left" )
	local f18_local0 = nil
	if f18_arg0._autoplayVODs then
		f18_local0 = Engine.Localize( "LUA_MENU_ON" )
	else
		f18_local0 = Engine.Localize( "LUA_MENU_OFF" )
	end
	f18_arg0:AddButtonHelperTextToElement( f18_arg0.ButtonHelperBar, {
		helper_text = Engine.Localize( "CODTV_AUTOPLAY", f18_local0 ),
		button_ref = "button_alt2",
		side = "left",
		clickable = true,
		priority = 500
	} )
end

local f0_local23 = function ( f19_arg0, f19_arg1 )
	local f19_local0
	if f19_arg1 then
		f19_local0 = 1
		if not f19_local0 then
		
		else
			f19_arg0.PageArrowLeft:SetAlpha( f19_local0 )
			f19_arg0.PageArrowRight:SetAlpha( f19_local0 )
			f19_arg0.ListPage:SetAlpha( f19_local0 )
		end
	end
	f19_local0 = 0
end

local f0_local24 = function ( f20_arg0, f20_arg1, f20_arg2 )
	Engine.SetPlayerDataEx( f20_arg1, CoD.StatsGroup.Ranked, "lastViewedCODTV", tonumber( Engine.GetCurrentEpochTime() ) )
	f0_local20( f20_arg0, f20_arg1 )
	f0_local4 = false
	ACTIONS.AnimateSequence( f20_arg0, "DefaultSequence" )
	f20_arg0._buttonHelperVisible = true
	MLGContent.TakeOverCinematic( true )
	MLGContent.AllowImageFetch()
	Engine.StopMenuVideo()
	f20_arg0.StreamImage:setImage( RegisterMaterial( "cinematic_mp4" ), 0 )
	FrontEndScene.CurrentMissionTeam = MissionDirector.InvalidTeamID
	FrontEndScene.SetScene( "mlg.tv" )
	Streaming.SetStreamingEnabled( false )
	Engine.SetDvarString( "ui_mapname", "" )
	Engine.StopMusic()
	f20_arg0:addEventHandler( "menu_close", function ( f21_arg0, f21_arg1 )
		ACTIONS.UploadStats( f21_arg0, f20_arg1 )
	end )
	local f20_local0 = LUI.DataSourceInGlobalModel.new( "mlgcontent.connected" )
	f20_arg0:SubscribeToModel( f20_local0:GetModel( f20_arg1 ), function ()
		if f20_local0:GetValue( f20_arg1 ) then
			f20_arg0.StreamImage:setImage( RegisterMaterial( "cinematic_mp4" ), 0 )
			MLGContent.TakeOverCinematic( true )
			MLGContent.AllowImageFetch()
		else
			MLGContent.TakeOverCinematic( false )
			f20_arg0.StreamImage:setImage( RegisterMaterial( "black" ), 0 )
			MLGContent.DisallowImageFetch()
		end
	end )
	f20_arg0._vodPageCount = 0
	f20_arg0._streamIndexPerType = {
		0,
		0
	}
	f20_arg0._currentStreamIndex = -1
	local f20_local1 = {
		{
			name = "CODTV_LIVE",
			modelRootPath = f0_local1,
			modelType = CODTV.VIDEO_TYPE.STREAM
		},
		{
			name = "CODTV_VOD",
			modelRootPath = f0_local2,
			modelType = CODTV.VIDEO_TYPE.VOD
		}
	}
	local f20_local2 = {}
	local f20_local3 = 2
	for f20_local4 = 1, 2, 1 do
		f20_local2[#f20_local2 + 1] = {
			name = Engine.Localize( f20_local1[f20_local4].name ),
			modelType = f20_local1[f20_local4].modelType,
			modelRootPath = f20_local1[f20_local4].modelRootPath
		}
	end
	local f20_local4 = LUI.DataSourceFromList.new( #f20_local2 )
	f20_local4.MakeDataSourceAtIndex = function ( f23_arg0, f23_arg1, f23_arg2 )
		return {
			name = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".tabName." .. f23_arg1, f20_local2[f23_arg1 + 1].name ),
			focusFunction = function ()
				f20_arg0._modelType = f20_local2[f23_arg1 + 1].modelType
				MLGContent.SetContentType( f20_arg0._modelType )
				local f24_local0 = f20_local2[f23_arg1 + 1].modelRootPath
				local f24_local1 = LUI.DataSourceFromList.new( LUI.DataSourceInGlobalModel.new( f24_local0 .. ".count" ) )
				f24_local1.MakeDataSourceAtIndex = function ( f25_arg0, f25_arg1 )
					return {
						subtitle = LUI.DataSourceInGlobalModel.new( f24_local0 .. "." .. f25_arg1 .. ".subtitle" ),
						description = LUI.DataSourceInGlobalModel.new( f24_local0 .. "." .. f25_arg1 .. ".description" ),
						name = LUI.DataSourceInGlobalModel.new( f24_local0 .. "." .. f25_arg1 .. ".name" ),
						image = LUI.DataSourceInGlobalModel.new( f24_local0 .. "." .. f25_arg1 .. ".image" ),
						index = LUI.DataSourceInGlobalModel.new( f24_local0 .. "." .. f25_arg1 .. ".index" ),
						channel_id = LUI.DataSourceInGlobalModel.new( f24_local0 .. "." .. f25_arg1 .. ".channel_id" ),
						viewers = LUI.DataSourceInGlobalModel.new( f24_local0 .. "." .. f25_arg1 .. ".viewers" ),
						last_updated = LUI.DataSourceInGlobalModel.new( f24_local0 .. "." .. f25_arg1 .. ".last_updated" ),
						length = LUI.DataSourceInGlobalModel.new( f24_local0 .. "." .. f25_arg1 .. ".length" ),
						status = LUI.DataSourceInGlobalModel.new( f24_local0 .. "." .. f25_arg1 .. ".status" )
					}
				end
				
				f20_arg0._modelRootPath = f24_local0
				f24_local1.GetDefaultFocusIndex = function ()
					return 0
				end
				
				local f24_local2 = f20_arg0._streamIndexPerType[f20_arg0._modelType + 1]
				f20_arg0:dispatchEventToChildren( {
					name = "codtv_tab_changed"
				} )
				f20_arg0.ButtonList:SetGridDataSource( f24_local1, f20_arg0._modelRootPath )
				local f24_local3 = 0
				if f20_arg0._modelType == CODTV.VIDEO_TYPE.STREAM then
					local f24_local4 = DataSources.frontEnd.MP.codtv.streamCount:GetValue( f23_arg2 )
					if f24_local4 ~= nil then
						f24_local3 = f24_local4
					end
				elseif f20_arg0._modelType == CODTV.VIDEO_TYPE.VOD then
					local f24_local4 = DataSources.frontEnd.MP.codtv.vodCount:GetValue( f23_arg2 )
					if f24_local4 ~= nil then
						f24_local3 = f24_local4 + f20_arg0._vodPageCount
					end
				end
				local f24_local4 = f0_local23
				local f24_local5 = f20_arg0
				local f24_local6
				if f20_arg0._modelType ~= CODTV.VIDEO_TYPE.VOD or f20_arg0._vodPageCount <= 1 then
					f24_local6 = false
				else
					f24_local6 = true
				end
				f24_local4( f24_local5, f24_local6 )
				if f24_local3 == 0 then
					ACTIONS.AnimateSequence( f20_arg0, "NoStreamsAvailable" )
					f20_arg0.NoVideosLabel:setText( Engine.Localize( f0_local3[f20_arg0._modelType + 1] ) )
				else
					ACTIONS.AnimateSequence( f20_arg0, "StreamsAvailable" )
					ACTIONS.GainFocus( f20_arg0, "ButtonList", f23_arg2 )
					f20_arg0._streamIndexPerType[f20_arg0._modelType + 1] = f24_local2
					f20_arg0.ButtonList:SetFocusedPosition( {
						x = 0,
						y = f20_arg0._streamIndexPerType[f20_arg0._modelType + 1]
					}, false, true )
				end
			end
			
		}
	end
	
	f20_arg0.Tabs.Tabs:SetTabManagerDataSource( f20_local4, f20_arg1 )
	local f20_local5 = LUI.DataSourceInGlobalModel.new( "mlgcontent.video.status" )
	local f20_local6 = function ()
		local f27_local0 = f20_local5:GetValue( f20_arg1 )
		if f27_local0 ~= nil then
			f0_local13( f20_arg0, f20_arg1, f27_local0 )
		end
	end
	
	local f20_local7 = DataSources.frontEnd.MP.codtv.streamCount:GetValue( f20_arg1 )
	local f20_local8 = DataSources.frontEnd.MP.codtv.vodCount:GetValue( f20_arg1 )
	if f20_local7 ~= nil and f20_local7 == 0 and f20_local8 ~= nil and f20_local8 > 0 then
		f20_arg0.Tabs.Tabs:FocusTab( 1, FocusType.MenuFlow )
	end
	f20_arg0:SubscribeToModel( f20_local5:GetModel( f20_arg1 ), f20_local6 )
	f20_arg0:SubscribeToModelThroughElement( f20_arg0.ButtonList, "description", function ()
		if f20_arg0._currentStreamIndex == -1 then
			local f28_local0 = f20_arg0.ButtonList:GetDataSource()
			f28_local0 = f28_local0.channel_id:GetValue( f20_arg1 )
			local f28_local1 = MLGContent.GetContentType()
			f20_arg0.playingVideoType = f28_local1
			MLGContent.Stream( f28_local1, f28_local0 )
			f0_local6( f20_arg0, f20_arg1, f28_local1 )
			f20_arg0._playingStreamIndex = f28_local0
		end
		local f28_local0 = f20_arg0.ButtonList:GetDataSource()
		f28_local0 = f28_local0.index:GetValue( f20_arg1 )
		f20_arg0._currentStreamIndex = f28_local0
		f20_arg0._streamIndexPerType[f20_arg0._modelType + 1] = f28_local0
	end )
	local f20_local9 = LUI.DataSourceInGlobalModel.new( "mlgcontent.video.time" )
	local f20_local10 = LUI.DataSourceInGlobalModel.new( "mlgcontent.video.duration" )
	local f20_local11 = LUI.DataSourceInGlobalModel.new( "mlgcontent.video.timeSeconds" )
	local f20_local12 = LUI.DataSourceInGlobalModel.new( "mlgcontent.video.durationSeconds" )
	f20_arg0:SubscribeToModel( f20_local9:GetModel( f20_arg1 ), function ()
		local f29_local0 = f20_local9:GetValue( f20_arg1 )
		local f29_local1 = f20_local10:GetValue( f20_arg1 )
		local f29_local2 = f20_local11:GetValue( f20_arg1 )
		local f29_local3 = f20_local12:GetValue( f20_arg1 )
		if f20_arg0.playingVideoType == CODTV.VIDEO_TYPE.VOD and f29_local0 ~= nil and f29_local1 ~= nil and f20_local5:GetValue( f20_arg1 ) == CODTV.VIDEO_STATUS.PLAYING then
			f20_arg0.CODTvProgressBar.TimeLabel:setText( f29_local0 .. " / " .. f29_local1 )
			f20_arg0.CODTvProgressBar:UpdateProgress( f29_local2, f29_local3 - 1 )
			f20_arg0.CODTvProgressBar:SetAlpha( 1 )
		else
			f20_arg0.CODTvProgressBar:SetAlpha( 0 )
			f20_arg0.CODTvProgressBar:ResetProgress()
		end
	end )
	f20_arg0.bindButton:addEventHandler( "button_alt1", function ( f30_arg0, f30_arg1 )
		if f20_arg0._isFullScreen then
			f0_local18( f20_arg0, f20_arg1 )
		else
			f0_local17( f20_arg0, f20_arg1 )
		end
	end )
	f20_arg0.bindButton:addEventHandler( "button_left_trigger", function ( f31_arg0, f31_arg1 )
		f0_local19( f20_arg0, f20_arg1 )
	end )
	ACTIONS.AnimateSequence( f20_arg0.PageArrowRight, "NotBlocked" )
	f20_arg0.bindButton:addEventHandler( "button_right", function ( f32_arg0, f32_arg1 )
		if f20_arg0._vodPageCount > 1 then
			MLGContent.NextPage( f20_arg0._modelType )
			ACTIONS.AnimateSequence( f20_arg0.PageArrowRight, "MovedRight" )
		end
	end )
	ACTIONS.AnimateSequence( f20_arg0.PageArrowLeft, "NotBlocked" )
	f20_arg0.bindButton:addEventHandler( "button_left", function ( f33_arg0, f33_arg1 )
		if f20_arg0._vodPageCount > 1 then
			MLGContent.PreviousPage( f20_arg0._modelType )
			ACTIONS.AnimateSequence( f20_arg0.PageArrowLeft, "MovedLeft" )
		end
	end )
	local f20_local13 = LUI.DataSourceInGlobalModel.new( "mlgcontent.VOD.page" )
	local f20_local14 = LUI.DataSourceInGlobalModel.new( "mlgcontent.VOD.pagecount" )
	local f20_local15 = function ()
		local f34_local0 = f20_local13:GetValue( f20_arg1 )
		local f34_local1 = f20_local14:GetValue( f20_arg1 )
		if f34_local0 ~= nil and f34_local1 ~= nil and f34_local1 > 1 then
			f20_arg0.ListPage:setText( f34_local0 .. "/" .. f34_local1 )
			f20_arg0._vodPageCount = f34_local1
		else
			f20_arg0.ListPage:setText( "" )
			f20_arg0._vodPageCount = 0
		end
		local f34_local2 = f0_local23
		local f34_local3 = f20_arg0
		local f34_local4
		if f20_arg0._modelType ~= CODTV.VIDEO_TYPE.VOD or f20_arg0._vodPageCount <= 0 then
			f34_local4 = false
		else
			f34_local4 = true
		end
		f34_local2( f34_local3, f34_local4 )
	end
	
	f20_arg0:SubscribeToModel( f20_local13:GetModel( f20_arg1 ), f20_local15 )
	f20_arg0:SubscribeToModel( f20_local14:GetModel( f20_arg1 ), f20_local15 )
	f20_arg0.bindButton:addEventHandler( "button_secondary", function ( f35_arg0, f35_arg1 )
		if f20_arg0._isFullScreen then
			f0_local18( f20_arg0, f20_arg1 )
		else
			f20_arg0.StreamImage:setImage( RegisterMaterial( "black" ), 0 )
			f0_local4 = f0_local5()
			f0_local8( f20_arg0, f20_arg1 )
		end
	end )
	f20_arg0._autoplayVODs = false
	f0_local22( f20_arg0, f20_arg1 )
	f20_arg0.bindButton:addEventHandler( "button_alt2", function ( f36_arg0, f36_arg1 )
		f20_arg0._autoplayVODs = not f20_arg0._autoplayVODs
		f0_local22( f20_arg0, f20_arg1 )
	end )
	f20_arg0:addEventHandler( "gamepad_button", function ( f37_arg0, f37_arg1 )
		if f20_arg0.leaveMenuTimer ~= nil or f20_arg0.disableAllInputForMenu then
			return true
		elseif not f20_arg0._buttonHelperVisible then
			f0_local16( f20_arg0 )
			f0_local7( f20_arg0, f20_arg1 )
			return true
		elseif f20_arg0._isButtonListVisible then
			return false
		elseif f20_arg0._isFullScreen then
			local f37_local0
			if f37_arg1.button == "alt1" or f37_arg1.button == "left_trigger" or f37_arg1.button == "secondary" or f37_arg1.button == "alt2" or f37_arg1.button == "button_right" or f37_arg1.button == "button_left" then
				f37_local0 = false
			else
				f37_local0 = true
			end
			return f37_local0
		else
			
		end
	end )
	f20_arg0:addEventHandler( "codtv_video_selected", function ( f38_arg0, f38_arg1 )
		f20_arg0.playingVideoType = f38_arg1.video_type
		f0_local6( f20_arg0, f20_arg1, f20_arg0.playingVideoType )
		f20_arg0._playingStreamIndex = f38_arg1.index
	end )
	f20_arg0:dispatchEventToChildren( {
		name = "tab_disable_blur"
	} )
	f20_arg0._isFullScreen = false
	f20_arg0._isButtonListVisible = true
	f20_arg0:registerEventHandler( "hideButtonHelperAction", f0_local15 )
	local f20_local16 = 0
	f20_arg0:registerEventHandler( "leaveCODTVMenuAction", function ()
		if f20_arg0.leaveMenuTimer ~= nil then
			f20_arg0.leaveMenuTimer:close()
			f20_arg0.leaveMenuTimer = nil
		end
		if f0_local4 then
			ACTIONS.LeaveMenu( f20_arg0 )
			return 
		end
		f0_local4 = f0_local5()
		f20_local16 = f20_local16 + 1
		if f20_local16 < 10 then
			f0_local8( f20_arg0, f20_arg1 )
		else
			ACTIONS.LeaveMenu( f20_arg0 )
		end
	end )
	f20_arg0:registerEventHandler( "hideVideosInfos", function ()
		if f20_arg0.videosInfosDisplayTimer ~= nil then
			f20_arg0.videosInfosDisplayTimer:close()
			f20_arg0.videosInfosDisplayTimer = nil
		end
		ACTIONS.AnimateSequence( f20_arg0, "HideFullScreenVideoInfos" )
	end )
	f20_arg0.CODTvMenuTitle.MenuBreadcrumbs:setText( ToUpperCase( Engine.Localize( "MENU_MULTIPLAYER" ), 0 ) )
	f20_arg0:registerEventHandler( "enterMenuTimerDone", function ()
		f20_arg0.disableAllInputForMenu = false
		if f20_arg0.enterMenuTimer ~= nil then
			f20_arg0.enterMenuTimer:close()
			f20_arg0.enterMenuTimer = nil
		end
	end )
end

function CODTvMenu( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "CODTvMenu"
	self._animationSets = {}
	self._sequences = {}
	local f42_local1 = controller and controller.controllerIndex
	if not f42_local1 and not Engine.InFrontend() then
		f42_local1 = self:getRootController()
	end
	assert( f42_local1 )
	self:playSound( "menu_open" )
	local f42_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 10987431, 0 )
	Background:setImage( RegisterMaterial( "image_motd_main" ), 0 )
	self:addElement( Background )
	self.Background = Background
	
	local Darkener = nil
	
	Darkener = LUI.UIImage.new()
	Darkener.id = "Darkener"
	Darkener:SetRGBFromInt( 0, 0 )
	Darkener:SetAlpha( 0.5, 0 )
	self:addElement( Darkener )
	self.Darkener = Darkener
	
	local CODTvMenuTitle = nil
	
	CODTvMenuTitle = MenuBuilder.BuildRegisteredType( "CODTvMenuTitle", {
		controllerIndex = f42_local1
	} )
	CODTvMenuTitle.id = "CODTvMenuTitle"
	CODTvMenuTitle.MenuBreadcrumbs:setText( "", 0 )
	CODTvMenuTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
	self:addElement( CODTvMenuTitle )
	self.CODTvMenuTitle = CODTvMenuTitle
	
	local StreamBG = nil
	
	StreamBG = LUI.UIImage.new()
	StreamBG.id = "StreamBG"
	StreamBG:SetRGBFromInt( 4605510, 0 )
	StreamBG:SetAlpha( 0.8, 0 )
	StreamBG:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 735, _1080p * 1824, _1080p * 204.5, _1080p * 816 )
	self:addElement( StreamBG )
	self.StreamBG = StreamBG
	
	local DescriptionBackground = nil
	
	DescriptionBackground = LUI.UIImage.new()
	DescriptionBackground.id = "DescriptionBackground"
	DescriptionBackground:SetRGBFromInt( 7697781, 0 )
	DescriptionBackground:SetAlpha( 0.8, 0 )
	DescriptionBackground:setImage( RegisterMaterial( "widg_gradient_bottom_to_top_opaque" ), 0 )
	DescriptionBackground:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 735, _1080p * 1824, _1080p * 816, _1080p * 979 )
	self:addElement( DescriptionBackground )
	self.DescriptionBackground = DescriptionBackground
	
	local DetailsStrip = nil
	
	DetailsStrip = LUI.UIImage.new()
	DetailsStrip.id = "DetailsStrip"
	DetailsStrip:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 767.5, _1080p * 770, _1080p * 825.16, _1080p * 853.16 )
	self:addElement( DetailsStrip )
	self.DetailsStrip = DetailsStrip
	
	local DetailsName = nil
	
	DetailsName = LUI.UIText.new()
	DetailsName.id = "DetailsName"
	DetailsName:setText( "", 0 )
	DetailsName:SetFontSize( 28 * _1080p )
	DetailsName:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	DetailsName:SetAlignment( LUI.Alignment.Left )
	DetailsName:SetOptOutRightToLeftAlignmentFlip( true )
	DetailsName:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 776.25, _1080p * 1791.5, _1080p * 825.16, _1080p * 853.16 )
	self:addElement( DetailsName )
	self.DetailsName = DetailsName
	
	local f42_local10 = nil
	if not CONDITIONS.IsArabic( self ) then
		f42_local10 = LUI.UIStyledText.new()
		f42_local10.id = "StreamDescription"
		f42_local10:setText( "", 0 )
		f42_local10:SetFontSize( 26 * _1080p )
		f42_local10:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
		f42_local10:SetAlignment( LUI.Alignment.Left )
		f42_local10:SetOptOutRightToLeftAlignmentFlip( true )
		f42_local10:SetStartupDelay( 3000 )
		f42_local10:SetLineHoldTime( 3000 )
		f42_local10:SetAnimMoveTime( 150 )
		f42_local10:SetEndDelay( 8000 )
		f42_local10:SetCrossfadeTime( 400 )
		f42_local10:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollV )
		f42_local10:SetMaxVisibleLines( 4 )
		f42_local10:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 776.25, _1080p * 1782.75, _1080p * 861.08, _1080p * 887.08 )
		self:addElement( f42_local10 )
		self.StreamDescription = f42_local10
	end
	local StreamImageBG = nil
	
	StreamImageBG = LUI.UIImage.new()
	StreamImageBG.id = "StreamImageBG"
	StreamImageBG:SetRGBFromInt( 0, 0 )
	StreamImageBG:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 61.4, _1080p * 1909.72, _1080p * 18, _1080p * 1057.68 )
	self:addElement( StreamImageBG )
	self.StreamImageBG = StreamImageBG
	
	local StreamImage = nil
	
	StreamImage = LUI.UIImage.new()
	StreamImage.id = "StreamImage"
	StreamImage:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 61.4, _1080p * 1909.72, _1080p * 18, _1080p * 1057.68 )
	self:addElement( StreamImage )
	self.StreamImage = StreamImage
	
	local Scrollbar = nil
	
	Scrollbar = MenuBuilder.BuildRegisteredType( "VerticalMinimalScrollbar", {
		controllerIndex = f42_local1
	} )
	Scrollbar.id = "Scrollbar"
	Scrollbar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 147, _1080p * 200, _1080p * 953.5 )
	self:addElement( Scrollbar )
	self.Scrollbar = Scrollbar
	
	local CODTvProgressBar = nil
	
	CODTvProgressBar = MenuBuilder.BuildRegisteredType( "CODTvProgressBar", {
		controllerIndex = f42_local1
	} )
	CODTvProgressBar.id = "CODTvProgressBar"
	CODTvProgressBar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 767.5, _1080p * 1791.5, _1080p * 801, _1080p * 816 )
	self:addElement( CODTvProgressBar )
	self.CODTvProgressBar = CODTvProgressBar
	
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f42_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local ButtonList = nil
	
	ButtonList = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 5,
		controllerIndex = f42_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "CODTvButton", {
				controllerIndex = f42_local1
			} )
		end,
		wrapX = false,
		wrapY = false,
		spacingX = _1080p * 6,
		spacingY = _1080p * 6,
		columnWidth = _1080p * 300,
		rowHeight = _1080p * 145,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	ButtonList.id = "ButtonList"
	ButtonList:setUseStencil( true )
	ButtonList:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 147, _1080p * 447, _1080p * 204.5, _1080p * 953.5 )
	self:addElement( ButtonList )
	self.ButtonList = ButtonList
	
	local ArrowUp = nil
	
	ArrowUp = MenuBuilder.BuildRegisteredType( "ArrowUp", {
		controllerIndex = f42_local1
	} )
	ArrowUp.id = "ArrowUp"
	ArrowUp:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 369.5, _1080p * 389.5, _1080p * 960, _1080p * 1000 )
	self:addElement( ArrowUp )
	self.ArrowUp = ArrowUp
	
	local ArrowDown = nil
	
	ArrowDown = MenuBuilder.BuildRegisteredType( "ArrowDown", {
		controllerIndex = f42_local1
	} )
	ArrowDown.id = "ArrowDown"
	ArrowDown:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 204.5, _1080p * 224.5, _1080p * 960, _1080p * 1000 )
	self:addElement( ArrowDown )
	self.ArrowDown = ArrowDown
	
	local ListCount = nil
	
	ListCount = LUI.UIText.new()
	ListCount.id = "ListCount"
	ListCount:setText( "1/15", 0 )
	ListCount:SetFontSize( 24 * _1080p )
	ListCount:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ListCount:SetAlignment( LUI.Alignment.Center )
	ListCount:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 224.5, _1080p * 369.5, _1080p * 968, _1080p * 992 )
	self:addElement( ListCount )
	self.ListCount = ListCount
	
	local NoVideosBackground = nil
	
	NoVideosBackground = LUI.UIImage.new()
	NoVideosBackground.id = "NoVideosBackground"
	NoVideosBackground:SetRGBFromInt( 4605510, 0 )
	NoVideosBackground:SetAlpha( 0, 0 )
	NoVideosBackground:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 625, _1080p * 204.5, _1080p * 960 )
	self:addElement( NoVideosBackground )
	self.NoVideosBackground = NoVideosBackground
	
	local NoVideosLabel = nil
	
	NoVideosLabel = LUI.UIText.new()
	NoVideosLabel.id = "NoVideosLabel"
	NoVideosLabel:SetAlpha( 0, 0 )
	NoVideosLabel:setText( Engine.Localize( "CODTV_NO_STREAMS" ), 0 )
	NoVideosLabel:SetFontSize( 45 * _1080p )
	NoVideosLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	NoVideosLabel:SetAlignment( LUI.Alignment.Left )
	NoVideosLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 147, _1080p * 600, _1080p * 495, _1080p * 540 )
	self:addElement( NoVideosLabel )
	self.NoVideosLabel = NoVideosLabel
	
	local Tabs = nil
	
	Tabs = MenuBuilder.BuildRegisteredType( "SubMenuTabsBar", {
		controllerIndex = f42_local1
	} )
	Tabs.id = "Tabs"
	Tabs:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 134, _1080p * 174 )
	self:addElement( Tabs )
	self.Tabs = Tabs
	
	local CODTvStatusWidget = nil
	
	CODTvStatusWidget = MenuBuilder.BuildRegisteredType( "CODTvStatusWidget", {
		controllerIndex = f42_local1
	} )
	CODTvStatusWidget.id = "CODTvStatusWidget"
	CODTvStatusWidget:SetAlpha( 0, 0 )
	CODTvStatusWidget:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 933.38, _1080p * 1634.38, _1080p * 446, _1080p * 634 )
	self:addElement( CODTvStatusWidget )
	self.CODTvStatusWidget = CODTvStatusWidget
	
	local Spinner = nil
	
	Spinner = MenuBuilder.BuildRegisteredType( "Spinner", {
		controllerIndex = f42_local1
	} )
	Spinner.id = "Spinner"
	Spinner:SetAlpha( 0, 0 )
	Spinner:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1215.5, _1080p * 1343.5, _1080p * 476, _1080p * 604 )
	self:addElement( Spinner )
	self.Spinner = Spinner
	
	local WatermarkHeader = nil
	
	WatermarkHeader = LUI.UIText.new()
	WatermarkHeader.id = "WatermarkHeader"
	WatermarkHeader:SetAlpha( 0, 0 )
	WatermarkHeader:setText( Engine.Localize( "CODTV_MLGTV_LOGO" ), 0 )
	WatermarkHeader:SetFontSize( 50 * _1080p )
	WatermarkHeader:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	WatermarkHeader:SetAlignment( LUI.Alignment.Center )
	WatermarkHeader:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1033.88, _1080p * 1533.88, _1080p * 485.25, _1080p * 535.25 )
	self:addElement( WatermarkHeader )
	self.WatermarkHeader = WatermarkHeader
	
	local CODTvFullscreenVideoInfos = nil
	
	CODTvFullscreenVideoInfos = MenuBuilder.BuildRegisteredType( "CODTvFullscreenVideoInfos", {
		controllerIndex = f42_local1
	} )
	CODTvFullscreenVideoInfos.id = "CODTvFullscreenVideoInfos"
	CODTvFullscreenVideoInfos:SetAlpha( 0, 0 )
	CODTvFullscreenVideoInfos:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1015, _1080p * 1920, _1080p * 811.08, _1080p * 911.08 )
	self:addElement( CODTvFullscreenVideoInfos )
	self.CODTvFullscreenVideoInfos = CODTvFullscreenVideoInfos
	
	local ListPage = nil
	
	ListPage = LUI.UIText.new()
	ListPage.id = "ListPage"
	ListPage:setText( "1/15", 0 )
	ListPage:SetFontSize( 24 * _1080p )
	ListPage:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ListPage:SetAlignment( LUI.Alignment.Center )
	ListPage:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 224.5, _1080p * 369.5, _1080p * 173, _1080p * 197 )
	self:addElement( ListPage )
	self.ListPage = ListPage
	
	local PageArrowRight = nil
	
	PageArrowRight = MenuBuilder.BuildRegisteredType( "ArrowRight", {
		controllerIndex = f42_local1
	} )
	PageArrowRight.id = "PageArrowRight"
	PageArrowRight:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 369.5, _1080p * 389.5, _1080p * 166, _1080p * 206 )
	self:addElement( PageArrowRight )
	self.PageArrowRight = PageArrowRight
	
	local PageArrowLeft = nil
	
	PageArrowLeft = MenuBuilder.BuildRegisteredType( "ArrowLeft", {
		controllerIndex = f42_local1
	} )
	PageArrowLeft.id = "PageArrowLeft"
	PageArrowLeft:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 204.5, _1080p * 224.5, _1080p * 166, _1080p * 206 )
	self:addElement( PageArrowLeft )
	self.PageArrowLeft = PageArrowLeft
	
	self._animationSets.DefaultAnimationSet = function ()
		CODTvMenuTitle:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.CODTvMenuTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134, 0 )
				end
			}
		} )
		StreamBG:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.StreamBG:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 735, _1080p * 1824, _1080p * 204.5, _1080p * 816, 0 )
				end
			}
		} )
		DetailsStrip:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.DetailsStrip:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.DetailsStrip:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 767.5, _1080p * 770, _1080p * 827.16, _1080p * 855.16, 0 )
				end
			}
		} )
		DetailsName:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.DetailsName:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 776.25, _1080p * 1791.5, _1080p * 827.16, _1080p * 855.16, 0 )
				end
			}
		} )
		if not CONDITIONS.IsArabic( self ) then
			f42_local10:RegisterAnimationSequence( "DefaultSequence", {
				{
					function ()
						return self.StreamDescription:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 776.25, _1080p * 1782.75, _1080p * 861.08, _1080p * 887.08, 0 )
					end
				}
			} )
		end
		StreamImageBG:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.StreamImageBG:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 767.5, _1080p * 1791.5, _1080p * 225, _1080p * 801, 0 )
				end
			}
		} )
		StreamImage:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.StreamImage:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 767.5, _1080p * 1791.5, _1080p * 225, _1080p * 801, 0 )
				end
			}
		} )
		Scrollbar:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Scrollbar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 147, _1080p * 200, _1080p * 953.5, 0 )
				end
			}
		} )
		CODTvProgressBar:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.CODTvProgressBar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 767.5, _1080p * 1791.5, _1080p * 801, _1080p * 816, 0 )
				end
			}
		} )
		ButtonList:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.ButtonList:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 147, _1080p * 647, _1080p * 204.5, _1080p * 953.5, 0 )
				end
			}
		} )
		ArrowUp:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.ArrowUp:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 369.5, _1080p * 389.5, _1080p * 960, _1080p * 1000, 0 )
				end
			}
		} )
		ArrowDown:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.ArrowDown:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 204.5, _1080p * 224.5, _1080p * 960, _1080p * 1000, 0 )
				end
			}
		} )
		ListCount:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.ListCount:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 224.5, _1080p * 369.5, _1080p * 968, _1080p * 992, 0 )
				end
			}
		} )
		Tabs:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Tabs:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 132, _1080p * 172, 0 )
				end
			}
		} )
		CODTvStatusWidget:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.CODTvStatusWidget:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.CODTvStatusWidget:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 933.38, _1080p * 1634.38, _1080p * 446, _1080p * 634, 0 )
				end
			}
		} )
		Spinner:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Spinner:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1215.5, _1080p * 1343.5, _1080p * 476, _1080p * 604, 0 )
				end
			}
		} )
		WatermarkHeader:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.WatermarkHeader:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1033.88, _1080p * 1533.88, _1080p * 485.25, _1080p * 535.25, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			CODTvMenuTitle:AnimateSequence( "DefaultSequence" )
			StreamBG:AnimateSequence( "DefaultSequence" )
			DetailsStrip:AnimateSequence( "DefaultSequence" )
			DetailsName:AnimateSequence( "DefaultSequence" )
			if not CONDITIONS.IsArabic( self ) then
				f42_local10:AnimateSequence( "DefaultSequence" )
			end
			StreamImageBG:AnimateSequence( "DefaultSequence" )
			StreamImage:AnimateSequence( "DefaultSequence" )
			Scrollbar:AnimateSequence( "DefaultSequence" )
			CODTvProgressBar:AnimateSequence( "DefaultSequence" )
			ButtonList:AnimateSequence( "DefaultSequence" )
			ArrowUp:AnimateSequence( "DefaultSequence" )
			ArrowDown:AnimateSequence( "DefaultSequence" )
			ListCount:AnimateSequence( "DefaultSequence" )
			Tabs:AnimateSequence( "DefaultSequence" )
			CODTvStatusWidget:AnimateSequence( "DefaultSequence" )
			Spinner:AnimateSequence( "DefaultSequence" )
			WatermarkHeader:AnimateSequence( "DefaultSequence" )
		end
		
		CODTvMenuTitle:RegisterAnimationSequence( "Fullscreen", {
			{
				function ()
					return self.CODTvMenuTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134, 0 )
				end,
				function ()
					return self.CODTvMenuTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * -288, _1080p * -208, 250 )
				end
			}
		} )
		StreamBG:RegisterAnimationSequence( "Fullscreen", {
			{
				function ()
					return self.StreamBG:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.StreamBG:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 735, _1080p * 1824, _1080p * 204.5, _1080p * 816, 0 )
				end
			}
		} )
		DescriptionBackground:RegisterAnimationSequence( "Fullscreen", {
			{
				function ()
					return self.DescriptionBackground:SetAlpha( 0, 0 )
				end
			}
		} )
		DetailsStrip:RegisterAnimationSequence( "Fullscreen", {
			{
				function ()
					return self.DetailsStrip:SetAlpha( 0, 0 )
				end
			}
		} )
		DetailsName:RegisterAnimationSequence( "Fullscreen", {
			{
				function ()
					return self.DetailsName:SetAlpha( 0, 0 )
				end
			}
		} )
		if not CONDITIONS.IsArabic( self ) then
			f42_local10:RegisterAnimationSequence( "Fullscreen", {
				{
					function ()
						return self.StreamDescription:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		StreamImageBG:RegisterAnimationSequence( "Fullscreen", {
			{
				function ()
					return self.StreamImageBG:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 767.5, _1080p * -128.5, _1080p * 225, _1080p * -279, 0 )
				end,
				function ()
					return self.StreamImageBG:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0, 250 )
				end
			}
		} )
		StreamImage:RegisterAnimationSequence( "Fullscreen", {
			{
				function ()
					return self.StreamImage:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 767.5, _1080p * -128.5, _1080p * 225, _1080p * -279, 0 )
				end,
				function ()
					return self.StreamImage:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0, 250 )
				end
			}
		} )
		CODTvProgressBar:RegisterAnimationSequence( "Fullscreen", {
			{
				function ()
					return self.CODTvProgressBar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 767.5, _1080p * 1791.5, _1080p * 801, _1080p * 816, 0 )
				end,
				function ()
					return self.CODTvProgressBar:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1920, _1080p * 1065, _1080p * 1080, 250 )
				end
			}
		} )
		Tabs:RegisterAnimationSequence( "Fullscreen", {
			{
				function ()
					return self.Tabs:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 145, _1080p * 185, 0 )
				end,
				function ()
					return self.Tabs:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * -190, _1080p * -150, 250 )
				end
			}
		} )
		CODTvStatusWidget:RegisterAnimationSequence( "Fullscreen", {
			{
				function ()
					return self.CODTvStatusWidget:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 933.38, _1080p * 1634.38, _1080p * 446, _1080p * 634, 0 )
				end,
				function ()
					return self.CODTvStatusWidget:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 609.5, _1080p * 1310.5, _1080p * 446, _1080p * 634, 250 )
				end
			}
		} )
		Spinner:RegisterAnimationSequence( "Fullscreen", {
			{
				function ()
					return self.Spinner:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1215.5, _1080p * 1343.5, _1080p * 476, _1080p * 604, 0 )
				end,
				function ()
					return self.Spinner:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 896, _1080p * 1024, _1080p * 476, _1080p * 604, 250 )
				end
			}
		} )
		WatermarkHeader:RegisterAnimationSequence( "Fullscreen", {
			{
				function ()
					return self.WatermarkHeader:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1033.88, _1080p * 1533.88, _1080p * 485.25, _1080p * 535.25, 0 )
				end,
				function ()
					return self.WatermarkHeader:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 710, _1080p * 1210, _1080p * 485.25, _1080p * 535.25, 250 )
				end
			}
		} )
		self._sequences.Fullscreen = function ()
			CODTvMenuTitle:AnimateSequence( "Fullscreen" )
			StreamBG:AnimateSequence( "Fullscreen" )
			DescriptionBackground:AnimateSequence( "Fullscreen" )
			DetailsStrip:AnimateSequence( "Fullscreen" )
			DetailsName:AnimateSequence( "Fullscreen" )
			if not CONDITIONS.IsArabic( self ) then
				f42_local10:AnimateSequence( "Fullscreen" )
			end
			StreamImageBG:AnimateSequence( "Fullscreen" )
			StreamImage:AnimateSequence( "Fullscreen" )
			CODTvProgressBar:AnimateSequence( "Fullscreen" )
			Tabs:AnimateSequence( "Fullscreen" )
			CODTvStatusWidget:AnimateSequence( "Fullscreen" )
			Spinner:AnimateSequence( "Fullscreen" )
			WatermarkHeader:AnimateSequence( "Fullscreen" )
		end
		
		CODTvMenuTitle:RegisterAnimationSequence( "NonFullScreen", {
			{
				function ()
					return self.CODTvMenuTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * -195, _1080p * -115, 0 )
				end,
				function ()
					return self.CODTvMenuTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134, 250 )
				end
			}
		} )
		StreamBG:RegisterAnimationSequence( "NonFullScreen", {
			{
				function ()
					return self.StreamBG:SetAlpha( 0, 0 )
				end,
				function ()
					return self.StreamBG:SetAlpha( 0.8, 250 )
				end
			},
			{
				function ()
					return self.StreamBG:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 735, _1080p * 1824, _1080p * 204.5, _1080p * 816, 250 )
				end
			}
		} )
		DescriptionBackground:RegisterAnimationSequence( "NonFullScreen", {
			{
				function ()
					return self.DescriptionBackground:SetAlpha( 0, 160 )
				end,
				function ()
					return self.DescriptionBackground:SetAlpha( 0.8, 90 )
				end
			}
		} )
		DetailsStrip:RegisterAnimationSequence( "NonFullScreen", {
			{
				function ()
					return self.DetailsStrip:SetAlpha( 0, 160 )
				end,
				function ()
					return self.DetailsStrip:SetAlpha( 1, 90 )
				end
			}
		} )
		DetailsName:RegisterAnimationSequence( "NonFullScreen", {
			{
				function ()
					return self.DetailsName:SetAlpha( 0, 160 )
				end,
				function ()
					return self.DetailsName:SetAlpha( 1, 90 )
				end
			}
		} )
		if not CONDITIONS.IsArabic( self ) then
			f42_local10:RegisterAnimationSequence( "NonFullScreen", {
				{
					function ()
						return self.StreamDescription:SetAlpha( 0, 160 )
					end,
					function ()
						return self.StreamDescription:SetAlpha( 1, 90 )
					end
				}
			} )
		end
		StreamImageBG:RegisterAnimationSequence( "NonFullScreen", {
			{
				function ()
					return self.StreamImageBG:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0, 0 )
				end,
				function ()
					return self.StreamImageBG:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 767.5, _1080p * -128.5, _1080p * 225, _1080p * -279, 250 )
				end
			}
		} )
		StreamImage:RegisterAnimationSequence( "NonFullScreen", {
			{
				function ()
					return self.StreamImage:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0, 0 )
				end,
				function ()
					return self.StreamImage:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 767.5, _1080p * -128.5, _1080p * 225, _1080p * -279, 250 )
				end
			}
		} )
		CODTvProgressBar:RegisterAnimationSequence( "NonFullScreen", {
			{
				function ()
					return self.CODTvProgressBar:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1920, _1080p * 1065, _1080p * 1080, 0 )
				end,
				function ()
					return self.CODTvProgressBar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 767.5, _1080p * 1791.5, _1080p * 801, _1080p * 816, 250 )
				end
			}
		} )
		Tabs:RegisterAnimationSequence( "NonFullScreen", {
			{
				function ()
					return self.Tabs:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * -40, 0, 0 )
				end,
				function ()
					return self.Tabs:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 145, _1080p * 185, 250 )
				end
			}
		} )
		CODTvStatusWidget:RegisterAnimationSequence( "NonFullScreen", {
			{
				function ()
					return self.CODTvStatusWidget:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 609.5, _1080p * 1310.5, _1080p * 446, _1080p * 634, 0 )
				end,
				function ()
					return self.CODTvStatusWidget:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 929, _1080p * 1630, _1080p * 446, _1080p * 634, 250 )
				end
			}
		} )
		Spinner:RegisterAnimationSequence( "NonFullScreen", {
			{
				function ()
					return self.Spinner:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 896, _1080p * 1024, _1080p * 476, _1080p * 604, 0 )
				end,
				function ()
					return self.Spinner:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1215.5, _1080p * 1343.5, _1080p * 476, _1080p * 604, 250 )
				end
			}
		} )
		WatermarkHeader:RegisterAnimationSequence( "NonFullScreen", {
			{
				function ()
					return self.WatermarkHeader:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 710, _1080p * 1210, _1080p * 515, _1080p * 565, 0 )
				end,
				function ()
					return self.WatermarkHeader:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1033.88, _1080p * 1533.88, _1080p * 485.25, _1080p * 535.25, 250 )
				end
			}
		} )
		self._sequences.NonFullScreen = function ()
			CODTvMenuTitle:AnimateSequence( "NonFullScreen" )
			StreamBG:AnimateSequence( "NonFullScreen" )
			DescriptionBackground:AnimateSequence( "NonFullScreen" )
			DetailsStrip:AnimateSequence( "NonFullScreen" )
			DetailsName:AnimateSequence( "NonFullScreen" )
			if not CONDITIONS.IsArabic( self ) then
				f42_local10:AnimateSequence( "NonFullScreen" )
			end
			StreamImageBG:AnimateSequence( "NonFullScreen" )
			StreamImage:AnimateSequence( "NonFullScreen" )
			CODTvProgressBar:AnimateSequence( "NonFullScreen" )
			Tabs:AnimateSequence( "NonFullScreen" )
			CODTvStatusWidget:AnimateSequence( "NonFullScreen" )
			Spinner:AnimateSequence( "NonFullScreen" )
			WatermarkHeader:AnimateSequence( "NonFullScreen" )
		end
		
		Scrollbar:RegisterAnimationSequence( "HideButtonList", {
			{
				function ()
					return self.Scrollbar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 147, _1080p * 211, _1080p * 964.5, 0 )
				end,
				function ()
					return self.Scrollbar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -517, _1080p * -500, _1080p * 211, _1080p * 964.5, 250 )
				end
			}
		} )
		ButtonList:RegisterAnimationSequence( "HideButtonList", {
			{
				function ()
					return self.ButtonList:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 147, _1080p * 647, _1080p * 215.5, _1080p * 964.5, 0 )
				end,
				function ()
					return self.ButtonList:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -500, 0, _1080p * 215.5, _1080p * 964.5, 250 )
				end
			}
		} )
		ArrowUp:RegisterAnimationSequence( "HideButtonList", {
			{
				function ()
					return self.ArrowUp:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 369.5, _1080p * 389.5, _1080p * 971, _1080p * 1011, 0 )
				end,
				function ()
					return self.ArrowUp:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -277.5, _1080p * -257.5, _1080p * 971, _1080p * 1011, 250 )
				end
			}
		} )
		ArrowDown:RegisterAnimationSequence( "HideButtonList", {
			{
				function ()
					return self.ArrowDown:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 204.5, _1080p * 224.5, _1080p * 971, _1080p * 1011, 0 )
				end,
				function ()
					return self.ArrowDown:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -442.5, _1080p * -422.5, _1080p * 971, _1080p * 1011, 250 )
				end
			}
		} )
		ListCount:RegisterAnimationSequence( "HideButtonList", {
			{
				function ()
					return self.ListCount:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 224.5, _1080p * 369.5, _1080p * 979, _1080p * 1003, 0 )
				end,
				function ()
					return self.ListCount:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -422.5, _1080p * -277.5, _1080p * 979, _1080p * 1003, 250 )
				end
			}
		} )
		NoVideosBackground:RegisterAnimationSequence( "HideButtonList", {
			{
				function ()
					return self.NoVideosBackground:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 625, _1080p * 204.5, _1080p * 960, 0 )
				end,
				function ()
					return self.NoVideosBackground:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -510, _1080p * -15, _1080p * 204.5, _1080p * 960, 250 )
				end
			}
		} )
		NoVideosLabel:RegisterAnimationSequence( "HideButtonList", {
			{
				function ()
					return self.NoVideosLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 147, _1080p * 600, _1080p * 495, _1080p * 540, 0 )
				end,
				function ()
					return self.NoVideosLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -493, _1080p * -40, _1080p * 495, _1080p * 540, 250 )
				end
			}
		} )
		Tabs:RegisterAnimationSequence( "HideButtonList", {
			{
				function ()
					return self.Tabs:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 145, _1080p * 185, 0 )
				end,
				function ()
					return self.Tabs:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * -15, _1080p * -15, _1080p * -59, _1080p * -19, 250 )
				end
			}
		} )
		ListPage:RegisterAnimationSequence( "HideButtonList", {
			{
				function ()
					return self.ListPage:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 224.5, _1080p * 369.5, _1080p * 173, _1080p * 197, 0 )
				end,
				function ()
					return self.ListPage:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -440.5, _1080p * -295.5, _1080p * 173, _1080p * 197, 250 )
				end
			}
		} )
		PageArrowRight:RegisterAnimationSequence( "HideButtonList", {
			{
				function ()
					return self.PageArrowRight:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 369.5, _1080p * 389.5, _1080p * 166, _1080p * 226, 0 )
				end,
				function ()
					return self.PageArrowRight:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -338.5, _1080p * -313.5, _1080p * 166, _1080p * 204, 250 )
				end
			}
		} )
		PageArrowLeft:RegisterAnimationSequence( "HideButtonList", {
			{
				function ()
					return self.PageArrowLeft:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 204.5, _1080p * 224.5, _1080p * 166, _1080p * 206, 0 )
				end,
				function ()
					return self.PageArrowLeft:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -422.5, _1080p * -397.5, _1080p * 166, _1080p * 204, 250 )
				end
			}
		} )
		self._sequences.HideButtonList = function ()
			Scrollbar:AnimateSequence( "HideButtonList" )
			ButtonList:AnimateSequence( "HideButtonList" )
			ArrowUp:AnimateSequence( "HideButtonList" )
			ArrowDown:AnimateSequence( "HideButtonList" )
			ListCount:AnimateSequence( "HideButtonList" )
			NoVideosBackground:AnimateSequence( "HideButtonList" )
			NoVideosLabel:AnimateSequence( "HideButtonList" )
			Tabs:AnimateSequence( "HideButtonList" )
			ListPage:AnimateSequence( "HideButtonList" )
			PageArrowRight:AnimateSequence( "HideButtonList" )
			PageArrowLeft:AnimateSequence( "HideButtonList" )
		end
		
		Scrollbar:RegisterAnimationSequence( "ShowButtonList", {
			{
				function ()
					return self.Scrollbar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -517, _1080p * -500, _1080p * 200, _1080p * 953.5, 0 )
				end,
				function ()
					return self.Scrollbar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 147, _1080p * 200, _1080p * 953.5, 250 )
				end
			}
		} )
		ButtonList:RegisterAnimationSequence( "ShowButtonList", {
			{
				function ()
					return self.ButtonList:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -500, 0, _1080p * 204.5, _1080p * 953.5, 0 )
				end,
				function ()
					return self.ButtonList:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 147, _1080p * 647, _1080p * 204.5, _1080p * 953.5, 250 )
				end
			}
		} )
		ArrowUp:RegisterAnimationSequence( "ShowButtonList", {
			{
				function ()
					return self.ArrowUp:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -277.5, _1080p * -257.5, _1080p * 960, _1080p * 1000, 0 )
				end,
				function ()
					return self.ArrowUp:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 369.5, _1080p * 389.5, _1080p * 960, _1080p * 1000, 250 )
				end
			}
		} )
		ArrowDown:RegisterAnimationSequence( "ShowButtonList", {
			{
				function ()
					return self.ArrowDown:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -442.5, _1080p * -422.5, _1080p * 960, _1080p * 1000, 0 )
				end,
				function ()
					return self.ArrowDown:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 204.5, _1080p * 224.5, _1080p * 960, _1080p * 1000, 250 )
				end
			}
		} )
		ListCount:RegisterAnimationSequence( "ShowButtonList", {
			{
				function ()
					return self.ListCount:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -422.5, _1080p * -277.5, _1080p * 968, _1080p * 992, 0 )
				end,
				function ()
					return self.ListCount:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 224.5, _1080p * 369.5, _1080p * 968, _1080p * 992, 250 )
				end
			}
		} )
		NoVideosBackground:RegisterAnimationSequence( "ShowButtonList", {
			{
				function ()
					return self.NoVideosBackground:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -511, _1080p * -16, _1080p * 204.5, _1080p * 960, 0 )
				end,
				function ()
					return self.NoVideosBackground:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 625, _1080p * 204.5, _1080p * 960, 250 )
				end
			}
		} )
		NoVideosLabel:RegisterAnimationSequence( "ShowButtonList", {
			{
				function ()
					return self.NoVideosLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -494, _1080p * -41, _1080p * 495, _1080p * 540, 0 )
				end,
				function ()
					return self.NoVideosLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 147, _1080p * 600, _1080p * 495, _1080p * 540, 250 )
				end
			}
		} )
		Tabs:RegisterAnimationSequence( "ShowButtonList", {
			{
				function ()
					return self.Tabs:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * -132, _1080p * -92, 0 )
				end,
				function ()
					return self.Tabs:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 132, _1080p * 172, 250 )
				end
			}
		} )
		ListPage:RegisterAnimationSequence( "ShowButtonList", {
			{
				function ()
					return self.ListPage:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -450.5, _1080p * -305.5, _1080p * 173, _1080p * 197, 0 )
				end,
				function ()
					return self.ListPage:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 224.5, _1080p * 369.5, _1080p * 173, _1080p * 197, 250 )
				end
			}
		} )
		PageArrowRight:RegisterAnimationSequence( "ShowButtonList", {
			{
				function ()
					return self.PageArrowRight:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -348.5, _1080p * -323.5, _1080p * 166, _1080p * 204, 0 )
				end,
				function ()
					return self.PageArrowRight:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 369.5, _1080p * 389.5, _1080p * 166, _1080p * 206, 250 )
				end
			}
		} )
		PageArrowLeft:RegisterAnimationSequence( "ShowButtonList", {
			{
				function ()
					return self.PageArrowLeft:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -432.5, _1080p * -407.5, _1080p * 166, _1080p * 204, 0 )
				end,
				function ()
					return self.PageArrowLeft:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 204.5, _1080p * 224.5, _1080p * 166, _1080p * 206, 250 )
				end
			}
		} )
		self._sequences.ShowButtonList = function ()
			Scrollbar:AnimateSequence( "ShowButtonList" )
			ButtonList:AnimateSequence( "ShowButtonList" )
			ArrowUp:AnimateSequence( "ShowButtonList" )
			ArrowDown:AnimateSequence( "ShowButtonList" )
			ListCount:AnimateSequence( "ShowButtonList" )
			NoVideosBackground:AnimateSequence( "ShowButtonList" )
			NoVideosLabel:AnimateSequence( "ShowButtonList" )
			Tabs:AnimateSequence( "ShowButtonList" )
			ListPage:AnimateSequence( "ShowButtonList" )
			PageArrowRight:AnimateSequence( "ShowButtonList" )
			PageArrowLeft:AnimateSequence( "ShowButtonList" )
		end
		
		Spinner:RegisterAnimationSequence( "ShowSpinner", {
			{
				function ()
					return self.Spinner:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Spinner:SetAlpha( 1, 150 )
				end
			}
		} )
		self._sequences.ShowSpinner = function ()
			Spinner:AnimateSequence( "ShowSpinner" )
		end
		
		Spinner:RegisterAnimationSequence( "HideSpinner", {
			{
				function ()
					return self.Spinner:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Spinner:SetAlpha( 0, 150 )
				end
			}
		} )
		self._sequences.HideSpinner = function ()
			Spinner:AnimateSequence( "HideSpinner" )
		end
		
		ButtonHelperBar:RegisterAnimationSequence( "HideButtonHelper", {
			{
				function ()
					return self.ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0, 0 )
				end,
				function ()
					return self.ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, 0, _1080p * 85, 250 )
				end
			}
		} )
		self._sequences.HideButtonHelper = function ()
			ButtonHelperBar:AnimateSequence( "HideButtonHelper" )
		end
		
		ButtonHelperBar:RegisterAnimationSequence( "ShowButtonHelper", {
			{
				function ()
					return self.ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, 0, _1080p * 85, 0 )
				end,
				function ()
					return self.ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0, 250 )
				end
			}
		} )
		self._sequences.ShowButtonHelper = function ()
			ButtonHelperBar:AnimateSequence( "ShowButtonHelper" )
		end
		
		Scrollbar:RegisterAnimationSequence( "NoStreamsAvailable", {
			{
				function ()
					return self.Scrollbar:SetAlpha( 0, 0 )
				end
			}
		} )
		ButtonList:RegisterAnimationSequence( "NoStreamsAvailable", {
			{
				function ()
					return self.ButtonList:SetAlpha( 0, 0 )
				end
			}
		} )
		ArrowUp:RegisterAnimationSequence( "NoStreamsAvailable", {
			{
				function ()
					return self.ArrowUp:SetAlpha( 0, 0 )
				end
			}
		} )
		ArrowDown:RegisterAnimationSequence( "NoStreamsAvailable", {
			{
				function ()
					return self.ArrowDown:SetAlpha( 0, 0 )
				end
			}
		} )
		ListCount:RegisterAnimationSequence( "NoStreamsAvailable", {
			{
				function ()
					return self.ListCount:SetAlpha( 0, 0 )
				end
			}
		} )
		NoVideosBackground:RegisterAnimationSequence( "NoStreamsAvailable", {
			{
				function ()
					return self.NoVideosBackground:SetAlpha( 0.8, 0 )
				end
			}
		} )
		NoVideosLabel:RegisterAnimationSequence( "NoStreamsAvailable", {
			{
				function ()
					return self.NoVideosLabel:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.NoStreamsAvailable = function ()
			Scrollbar:AnimateSequence( "NoStreamsAvailable" )
			ButtonList:AnimateSequence( "NoStreamsAvailable" )
			ArrowUp:AnimateSequence( "NoStreamsAvailable" )
			ArrowDown:AnimateSequence( "NoStreamsAvailable" )
			ListCount:AnimateSequence( "NoStreamsAvailable" )
			NoVideosBackground:AnimateSequence( "NoStreamsAvailable" )
			NoVideosLabel:AnimateSequence( "NoStreamsAvailable" )
		end
		
		Scrollbar:RegisterAnimationSequence( "StreamsAvailable", {
			{
				function ()
					return self.Scrollbar:SetAlpha( 1, 0 )
				end
			}
		} )
		ButtonList:RegisterAnimationSequence( "StreamsAvailable", {
			{
				function ()
					return self.ButtonList:SetAlpha( 1, 0 )
				end
			}
		} )
		ArrowUp:RegisterAnimationSequence( "StreamsAvailable", {
			{
				function ()
					return self.ArrowUp:SetAlpha( 1, 0 )
				end
			}
		} )
		ArrowDown:RegisterAnimationSequence( "StreamsAvailable", {
			{
				function ()
					return self.ArrowDown:SetAlpha( 1, 0 )
				end
			}
		} )
		ListCount:RegisterAnimationSequence( "StreamsAvailable", {
			{
				function ()
					return self.ListCount:SetAlpha( 1, 0 )
				end
			}
		} )
		NoVideosBackground:RegisterAnimationSequence( "StreamsAvailable", {
			{
				function ()
					return self.NoVideosBackground:SetAlpha( 0, 0 )
				end
			}
		} )
		NoVideosLabel:RegisterAnimationSequence( "StreamsAvailable", {
			{
				function ()
					return self.NoVideosLabel:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.StreamsAvailable = function ()
			Scrollbar:AnimateSequence( "StreamsAvailable" )
			ButtonList:AnimateSequence( "StreamsAvailable" )
			ArrowUp:AnimateSequence( "StreamsAvailable" )
			ArrowDown:AnimateSequence( "StreamsAvailable" )
			ListCount:AnimateSequence( "StreamsAvailable" )
			NoVideosBackground:AnimateSequence( "StreamsAvailable" )
			NoVideosLabel:AnimateSequence( "StreamsAvailable" )
		end
		
		CODTvStatusWidget:RegisterAnimationSequence( "ShowStatus", {
			{
				function ()
					return self.CODTvStatusWidget:SetAlpha( 0, 150 )
				end,
				function ()
					return self.CODTvStatusWidget:SetAlpha( 1, 150 )
				end
			}
		} )
		WatermarkHeader:RegisterAnimationSequence( "ShowStatus", {
			{
				function ()
					return self.WatermarkHeader:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.ShowStatus = function ()
			CODTvStatusWidget:AnimateSequence( "ShowStatus" )
			WatermarkHeader:AnimateSequence( "ShowStatus" )
		end
		
		CODTvStatusWidget:RegisterAnimationSequence( "ShowWatermark", {
			{
				function ()
					return self.CODTvStatusWidget:SetAlpha( 0, 0 )
				end
			}
		} )
		WatermarkHeader:RegisterAnimationSequence( "ShowWatermark", {
			{
				function ()
					return self.WatermarkHeader:SetAlpha( 0, 150 )
				end,
				function ()
					return self.WatermarkHeader:SetAlpha( 0.8, 150 )
				end
			}
		} )
		self._sequences.ShowWatermark = function ()
			CODTvStatusWidget:AnimateSequence( "ShowWatermark" )
			WatermarkHeader:AnimateSequence( "ShowWatermark" )
		end
		
		CODTvFullscreenVideoInfos:RegisterAnimationSequence( "ShowFullScreenVideosInfos", {
			{
				function ()
					return self.CODTvFullscreenVideoInfos:SetAlpha( 0, 0 )
				end,
				function ()
					return self.CODTvFullscreenVideoInfos:SetAlpha( 1, 200 )
				end
			},
			{
				function ()
					return self.CODTvFullscreenVideoInfos:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1920, _1080p * 2825, _1080p * 618, _1080p * 718, 0 )
				end,
				function ()
					return self.CODTvFullscreenVideoInfos:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1015, _1080p * 1920, _1080p * 618, _1080p * 718, 200 )
				end
			}
		} )
		self._sequences.ShowFullScreenVideosInfos = function ()
			CODTvFullscreenVideoInfos:AnimateSequence( "ShowFullScreenVideosInfos" )
		end
		
		CODTvFullscreenVideoInfos:RegisterAnimationSequence( "HideFullScreenVideoInfos", {
			{
				function ()
					return self.CODTvFullscreenVideoInfos:SetAlpha( 1, 0 )
				end,
				function ()
					return self.CODTvFullscreenVideoInfos:SetAlpha( 0, 200 )
				end
			},
			{
				function ()
					return self.CODTvFullscreenVideoInfos:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1015, _1080p * 1920, _1080p * 618, _1080p * 718, 0 )
				end,
				function ()
					return self.CODTvFullscreenVideoInfos:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1920, _1080p * 2825, _1080p * 618, _1080p * 718, 200 )
				end
			}
		} )
		self._sequences.HideFullScreenVideoInfos = function ()
			CODTvFullscreenVideoInfos:AnimateSequence( "HideFullScreenVideoInfos" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	local f42_local30 = LUI.UIScrollbar.new
	local bindButton = {
		direction = LUI.DIRECTION.vertical,
		eventListener = Scrollbar,
		startCap = Scrollbar.startCap,
		endCap = Scrollbar.endCap
	}
	local f42_local32 = Scrollbar.sliderArea
	if f42_local32 then
		f42_local32 = Scrollbar.sliderArea.slider
	end
	bindButton.slider = f42_local32
	f42_local32 = Scrollbar.sliderArea
	if f42_local32 then
		f42_local32 = Scrollbar.sliderArea.fixedSizeSlider
	end
	bindButton.fixedSizeSlider = f42_local32
	ButtonList:AddScrollbar( f42_local30( bindButton ) )
	ButtonList:AddArrow( ArrowUp )
	ButtonList:AddArrow( ArrowDown )
	ButtonList:AddItemNumbers( ListCount )
	self.addButtonHelperFunction = function ( f208_arg0, f208_arg1 )
		f208_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_SELECT" ),
			button_ref = "button_primary",
			side = "left",
			priority = 1,
			clickable = true
		} )
		f208_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			priority = 1,
			clickable = true
		} )
		f208_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "CODTV_FULLSCREEN_TOGGLE" ),
			button_ref = "button_alt1",
			side = "left",
			priority = 1,
			clickable = true
		} )
	end
	
	self:addEventHandler( "menu_create", self.addButtonHelperFunction )
	
	bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	self:addEventHandler( "menu_create", function ( f209_arg0, f209_arg1 )
		local f209_local0 = f209_arg1.controller or f42_local1
		ACTIONS.AnimateSequenceByElement( self, {
			elementName = "Tabs",
			sequenceName = "NoBlur",
			elementPath = "Tabs"
		} )
	end )
	f0_local24( self, f42_local1, controller )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	return self
end

MenuBuilder.registerType( "CODTvMenu", CODTvMenu )
LUI.FlowManager.RegisterStackPopBehaviour( "CODTvMenu", f0_local21 )
LockTable( _M )
