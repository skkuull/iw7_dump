local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1 )
	return function ( f2_arg0, f2_arg1 )
		LiveStreaming.StopVideo()
		LUI.FlowManager.RequestLeaveMenu( f2_arg0 )
		LUI.FlowManager.RequestLeaveMenu( f1_arg0 )
		Engine.SetDvarString( "ui_mapname", "mp_frontier" )
	end
	
end

f0_local1 = function ()
	LiveStreaming.StopVideo()
end

function GetChannelDataSourceAtIndex( f4_arg0 )
	return function ( f5_arg0, f5_arg1, f5_arg2 )
		return {
			vid_type = LUI.DataSourceInGlobalModel.new( f4_arg0 .. ".type" ),
			index = LUI.DataSourceInGlobalModel.new( f4_arg0 .. "." .. f5_arg1 .. ".index" ),
			name = LUI.DataSourceInGlobalModel.new( f4_arg0 .. "." .. f5_arg1 .. ".name" ),
			subtitle = LUI.DataSourceInGlobalModel.new( f4_arg0 .. "." .. f5_arg1 .. ".subtitle" ),
			viewers = LUI.DataSourceInGlobalModel.new( f4_arg0 .. "." .. f5_arg1 .. ".viewers" ),
			status = LUI.DataSourceInGlobalModel.new( f4_arg0 .. "." .. f5_arg1 .. ".status" ),
			channel_id = LUI.DataSourceInGlobalModel.new( f4_arg0 .. "." .. f5_arg1 .. ".channel_id" ),
			image = LUI.DataSourceInGlobalModel.new( f4_arg0 .. "." .. f5_arg1 .. ".image" ),
			description = LUI.DataSourceInGlobalModel.new( f4_arg0 .. "." .. f5_arg1 .. ".description" )
		}
	end
	
end

f0_local2 = function ( f6_arg0, f6_arg1 )
	local f6_local0 = LUI.DataSourceFromList.new( f6_arg0 )
	f6_local0.MakeDataSourceAtIndex = GetChannelDataSourceAtIndex( f6_arg1 )
	return f6_local0
end

local f0_local3 = function ( f7_arg0 )
	f7_arg0.ChannelList:SetGridDataSource( f0_local2( LUI.DataSourceInGlobalModel.new( f7_arg0.modelRootPath .. ".count" ), f7_arg0.modelRootPath ) )
end

local f0_local4 = function ( f8_arg0 )
	if f8_arg0.modelType == 0 then
		f8_arg0.modelType = 1
		f8_arg0.modelRootPath = "mlgcontent.VOD"
	else
		f8_arg0.modelType = 0
		f8_arg0.modelRootPath = "mlgcontent.streams"
	end
	MLGContent.SetContentType( f8_arg0.modelType )
	f0_local3( f8_arg0 )
end

local f0_local5 = function ( f9_arg0, f9_arg1, f9_arg2 )
	f9_arg0.RenderSpace:registerAnimationState( "changeMaterial", {
		material = RegisterMaterial( "cinematic_mp4" )
	} )
	f9_arg0.RenderSpace:animateToState( "changeMaterial", animTime )
	FrontEndScene.CurrentMissionTeam = MissionDirector.InvalidTeamID
	FrontEndScene.SetScene( "MLG_STREAM" )
	Streaming.SetStreamingEnabled( false )
	Engine.SetDvarString( "ui_mapname", "" )
	Engine.StopMusic()
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	f9_arg0:addElement( bindButton )
	f9_arg0.bindButton = bindButton
	
	f9_arg0.bindButton:addEventHandler( "button_secondary", function ( f10_arg0, f10_arg1 )
		LUI.FlowManager.RequestPopupMenu( f9_arg0, "PopupYesNo", true, f10_arg1.controller, false, {
			yesAction = f0_local0( f9_arg0, f9_arg1 ),
			message = "Really?"
		} )
		return true
	end )
	f9_arg0.bindButton:addEventHandler( "button_alt1", function ( f11_arg0, f11_arg1 )
		f0_local4( f9_arg0 )
		return true
	end )
	f9_arg0.bindButton:addEventHandler( "button_shoulderr", function ( f12_arg0, f12_arg1 )
		MLGContent.NextPage( f9_arg0.modelType )
		return true
	end )
	f9_arg0.bindButton:addEventHandler( "button_shoulderl", function ( f13_arg0, f13_arg1 )
		MLGContent.PreviousPage( f9_arg0.modelType )
		return true
	end )
	f9_arg0.modelType = 0
	f9_arg0.modelRootPath = "mlgcontent.streams"
	f0_local3( f9_arg0 )
	MLGContent.SetContentType( f9_arg0.modelType )
	f9_arg0.modelLink = nil
	f9_arg0:addEventHandler( "mlg_channel_selected", function ( f14_arg0, f14_arg1 )
		local f14_local0 = true
		if f9_arg0.modelLink ~= nil then
			f9_arg0:UnsubscribeFromModel( f9_arg0.modelLink )
			f9_arg0.modelLink = nil
		end
		if f14_arg1.channel_id ~= nil then
			local f14_local1 = f9_arg0.modelRootPath .. "." .. tostring( f14_arg1.channel_id )
			local f14_local2 = LUI.DataSourceInGlobalModel.new( f14_local1 )
			f9_arg0.modelLink = f9_arg0:SubscribeToModel( f14_local2:GetModel( f9_arg1 ), function ()
				local f15_local0 = LUI.DataSourceInGlobalModel.new( f14_local1 .. ".name" )
				local f15_local1 = LUI.DataSourceInGlobalModel.new( f14_local1 .. ".channel_id" )
				local f15_local2 = LUI.DataSourceInGlobalModel.new( f14_local1 .. ".subtitle" )
				local f15_local3 = LUI.DataSourceInGlobalModel.new( f14_local1 .. ".status" )
				local f15_local4 = LUI.DataSourceInGlobalModel.new( f14_local1 .. ".viewers" )
				local f15_local5 = LUI.DataSourceInGlobalModel.new( f14_local1 .. ".description" )
				local f15_local6 = f15_local0:GetValue( f9_arg1 )
				local f15_local7 = f15_local1:GetValue( f9_arg1 )
				local f15_local8 = f15_local2:GetValue( f9_arg1 )
				local f15_local9 = f15_local3:GetValue( f9_arg1 )
				local f15_local10 = f15_local4:GetValue( f9_arg1 )
				local f15_local11 = f15_local5:GetValue( f9_arg1 )
				local f15_local12 = nil
				if f15_local9 == -1 then
					f15_local12 = "Offline"
				elseif f15_local9 == 1 then
					f15_local12 = "Online"
				elseif f15_local9 == 2 then
					f15_local12 = "Replay"
				else
					f15_local12 = "???"
				end
				local f15_local13 = ""
				if f15_local9 ~= -1 then
					f15_local13 = "Viewers = " .. tostring( f15_local10 )
				end
				f9_arg0.StreamDetails:setText( "Channel: " .. f15_local6 .. "{" .. tostring( f15_local7 ) .. "} - " .. f15_local8 .. "\nStatus: " .. f15_local12 .. "\n" .. f15_local13 .. "\n" .. f15_local11 )
			end )
		end
		return f14_local0
	end )
	local f9_local1 = f9_arg0
	local f9_local2 = f9_arg0.SubscribeToModel
	local f9_local3 = LUI.DataSourceInGlobalModel.new( "mlgcontent.video.status" )
	f9_local2( f9_local1, f9_local3:GetModel( f9_arg1 ), function ()
		local f16_local0 = LUI.DataSourceInGlobalModel.new( "mlgcontent.video.status" )
		f16_local0 = f16_local0:GetValue( controller )
		local f16_local1 = "Off"
		if f16_local0 ~= nil then
			if f16_local0 == 1 then
				f16_local1 = "Loading"
			elseif f16_local0 == 2 then
				f16_local1 = "Playing"
			end
		end
		f9_arg0.VideoStatus:setText( "Video: " .. f16_local1 )
	end )
	f9_local1 = f9_arg0
	f9_local2 = f9_arg0.SubscribeToModel
	f9_local3 = LUI.DataSourceInGlobalModel.new( "mlgcontent.video.time" )
	f9_local2( f9_local1, f9_local3:GetModel( f9_arg1 ), function ()
		local f17_local0 = tostring
		local f17_local1 = LUI.DataSourceInGlobalModel.new( "mlgcontent.video.time" )
		f17_local0 = f17_local0( f17_local1:GetValue( controller ) )
		f17_local1 = "//"
		local f17_local2 = tostring
		local f17_local3 = LUI.DataSourceInGlobalModel.new( "mlgcontent.video.duration" )
		f17_local0 = f17_local0 .. f17_local1 .. f17_local2( f17_local3:GetValue( controller ) )
		f17_local1 = ""
		f17_local2 = "\nA:"
		f17_local3 = tostring
		local f17_local4 = LUI.DataSourceInGlobalModel.new( "mlgcontent.video.audioTime" )
		f17_local3 = f17_local3( f17_local4:GetValue( controller ) )
		f17_local4 = "-V:"
		local f17_local5 = tostring
		local f17_local6 = LUI.DataSourceInGlobalModel.new( "mlgcontent.video.videoTime" )
		f17_local1 = f17_local2 .. f17_local3 .. f17_local4 .. f17_local5( f17_local6:GetValue( controller ) )
		f17_local2 = "\n"
		f17_local3 = tostring
		f17_local4 = LUI.DataSourceInGlobalModel.new( "mlgcontent.video.widht" )
		f17_local3 = f17_local3( f17_local4:GetValue( controller ) )
		f17_local4 = " X "
		f17_local5 = tostring
		f17_local6 = LUI.DataSourceInGlobalModel.new( "mlgcontent.video.height" )
		f9_arg0.LabelVideoDetails:setText( f17_local0 .. f17_local1 .. f17_local2 .. f17_local3 .. f17_local4 .. f17_local5( f17_local6:GetValue( controller ) ) )
	end )
end

function MLGStreamTest( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "MLGStreamTest"
	local f18_local1 = controller and controller.controllerIndex
	if not f18_local1 and not Engine.InFrontend() then
		f18_local1 = self:getRootController()
	end
	assert( f18_local1 )
	self:playSound( "menu_open" )
	local f18_local2 = self
	local RenderSpace = nil
	
	RenderSpace = LUI.UIImage.new()
	RenderSpace.id = "RenderSpace"
	RenderSpace:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 531.91, _1080p * 1824, _1080p * 54, _1080p * 741 )
	self:addElement( RenderSpace )
	self.RenderSpace = RenderSpace
	
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 2171018, 0 )
	Background:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 531.91, _1080p * 1824, _1080p * 752.66, _1080p * 1026 )
	self:addElement( Background )
	self.Background = Background
	
	local StreamDetails = nil
	
	StreamDetails = LUI.UIText.new()
	StreamDetails.id = "StreamDetails"
	StreamDetails:setText( "", 0 )
	StreamDetails:SetFontSize( 22 * _1080p )
	StreamDetails:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	StreamDetails:SetAlignment( LUI.Alignment.Left )
	StreamDetails:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 531.91, _1080p * 1824, _1080p * 932.07, _1080p * 954.07 )
	self:addElement( StreamDetails )
	self.StreamDetails = StreamDetails
	
	local LabelVideoDetails = nil
	
	LabelVideoDetails = LUI.UIText.new()
	LabelVideoDetails.id = "LabelVideoDetails"
	LabelVideoDetails:setText( "a\na\na", 0 )
	LabelVideoDetails:SetFontSize( 45 * _1080p )
	LabelVideoDetails:SetFont( FONTS.GetFont( FONTS.Dev.File ) )
	LabelVideoDetails:SetAlignment( LUI.Alignment.Left )
	LabelVideoDetails:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 531.91, _1080p * 1824, _1080p * 797.66, _1080p * 842.66 )
	self:addElement( LabelVideoDetails )
	self.LabelVideoDetails = LabelVideoDetails
	
	local ChannelList = nil
	
	ChannelList = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 6,
		controllerIndex = f18_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "MLGStreamChannelRow", {
				controllerIndex = f18_local1
			} )
		end,
		wrapX = true,
		wrapY = true,
		primaryAxis = LUI.DIRECTION.vertical,
		spacingX = _1080p * 32,
		spacingY = _1080p * 32,
		columnWidth = _1080p * 460,
		rowHeight = _1080p * 117,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Middle,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	ChannelList.id = "ChannelList"
	ChannelList:setUseStencil( true )
	ChannelList:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 71.91, _1080p * 531.91, _1080p * 54, _1080p * 916 )
	self:addElement( ChannelList )
	self.ChannelList = ChannelList
	
	local VideoStatus = nil
	
	VideoStatus = LUI.UIText.new()
	VideoStatus.id = "VideoStatus"
	VideoStatus:setText( Engine.Localize( "MENU_NEW" ), 0 )
	VideoStatus:SetFontSize( 45 * _1080p )
	VideoStatus:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	VideoStatus:SetAlignment( LUI.Alignment.Left )
	VideoStatus:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 531.91, _1080p * 1031.91, _1080p * 752.66, _1080p * 797.66 )
	self:addElement( VideoStatus )
	self.VideoStatus = VideoStatus
	
	f0_local5( self, f18_local1, controller )
	return self
end

MenuBuilder.registerType( "MLGStreamTest", MLGStreamTest )
LUI.FlowManager.RegisterStackPopBehaviour( "MLGStreamTest", f0_local1 )
LockTable( _M )
