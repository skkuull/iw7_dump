local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1 )
	f1_arg0.vid_type = MLGContent.GetContentType()
	return f1_arg0.vid_type
end

f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2 )
	f2_arg0.channelIndex = -1
	f2_arg0.vid_type = -1
	f2_arg0.tabChanged = false
	f2_arg0:SubscribeToModelThroughElement( f2_arg0, "name", function ()
		local f3_local0 = f2_arg0.channelIndex
		local f3_local1 = f2_arg0
		local f3_local2 = f2_arg0:GetDataSource()
		f3_local1.channelIndex = f3_local2.index:GetValue( f2_arg1 )
		MLGContent.NotifyItemIDChanged( f3_local0, f2_arg0.channelIndex )
		f3_local1 = f2_arg0:GetDataSource()
		f3_local1 = f3_local1.name:GetValue( f2_arg1 )
		if f3_local1 ~= nil then
			f2_arg0.Name:setText( tostring( f3_local1 ) )
		end
	end )
	f2_arg0.Subtitle:SubscribeToModelThroughElement( f2_arg0, "subtitle", function ()
		local f4_local0 = f2_arg0:GetDataSource()
		f4_local0 = f4_local0.subtitle:GetValue( f2_arg1 )
		if f4_local0 ~= nil then
			f2_arg0.Subtitle:setText( tostring( f4_local0 ) )
		end
	end )
	f2_arg0.channel_ID = -1
	f2_arg0:SubscribeToModelThroughElement( f2_arg0, "channel_id", function ()
		local f5_local0 = f2_arg0:GetDataSource()
		f5_local0 = f5_local0.channel_id:GetValue( f2_arg1 )
		if f5_local0 ~= nil then
			f2_arg0.channel_ID = f5_local0
		else
			f2_arg0.channel_ID = -1
		end
	end )
	f2_arg0:addEventHandler( "button_action", function ( f6_arg0, f6_arg1 )
		if f2_arg0.channel_ID ~= -1 then
			MLGContent.Stream( f2_arg0.vid_type, f2_arg0.channel_ID )
			f2_arg0:dispatchEventToRoot( {
				name = "codtv_video_selected",
				controller = f2_arg1,
				immediate = true,
				video_type = f2_arg0.vid_type,
				index = f2_arg0.channel_ID
			} )
		end
	end )
	f2_arg0:SubscribeToModelThroughElement( f2_arg0, "image", function ()
		local f7_local0 = f2_arg0:GetDataSource()
		f7_local0 = f7_local0.image:GetValue( f2_arg1 )
		if f7_local0 ~= nil and f7_local0 ~= -1 then
			f2_arg0.Image:setImage( RegisterMaterial( "mlg_channel_viewer" .. tostring( f7_local0 ) ), 0 )
		end
	end )
	f2_arg0:SubscribeToModelThroughElement( f2_arg0, "viewers", function ()
		local f8_local0 = f0_local0( f2_arg0, f2_arg1 )
		local f8_local1 = f2_arg0:GetDataSource()
		f8_local1 = f8_local1.viewers:GetValue( f2_arg1 )
		if f8_local1 ~= nil then
			if f2_arg0.vid_type == CODTV.VIDEO_TYPE.STREAM then
				f2_arg0.ViewsLabel:setText( "" )
			elseif f8_local1 > 0 then
				f2_arg0.ViewsLabel:setText( Engine.Localize( "CODTV_VIEWS", f8_local1 ) )
			else
				f2_arg0.ViewsLabel:setText( Engine.Localize( "" ) )
			end
		end
	end )
	f2_arg0:SubscribeToModelThroughElement( f2_arg0, "last_updated", function ()
		local f9_local0 = f2_arg0:GetDataSource()
		f9_local0 = f9_local0.last_updated:GetValue( f2_arg1 )
		if f9_local0 ~= nil then
			f2_arg0.DateLabel:setText( f9_local0 )
		end
	end )
	f2_arg0:SubscribeToModelThroughElement( f2_arg0, "length", function ()
		local f10_local0 = f2_arg0:GetDataSource()
		f10_local0 = f10_local0.length:GetValue( f2_arg1 )
		if f10_local0 ~= nil and f0_local0( f2_arg0, f2_arg1 ) == CODTV.VIDEO_TYPE.VOD then
			f2_arg0.DurationBG:SetAlpha( 0.6 )
			f2_arg0.DurationLabel:SetAlpha( 1 )
			f2_arg0.DurationLabel:setText( f10_local0 )
		else
			f2_arg0.DurationBG:SetAlpha( 0 )
			f2_arg0.DurationLabel:SetAlpha( 0 )
		end
	end )
	f2_arg0:SubscribeToModelThroughElement( f2_arg0, "status", function ()
		local f11_local0 = f0_local0( f2_arg0, f2_arg1 )
		if f2_arg0.vid_type == CODTV.VIDEO_TYPE.STREAM then
			local f11_local1 = f2_arg0:GetDataSource()
			if f11_local1.status:GetValue( f2_arg1 ) == 1 then
				f2_arg0.LiveLabel:setText( Engine.Localize( "CODTV_LIVE" ), 0 )
				f2_arg0.LiveIcon:SetRGBFromInt( 16318464, 0 )
			else
				f2_arg0.LiveIcon:SetRGBFromInt( 16776960, 0 )
				f2_arg0.LiveLabel:setText( Engine.Localize( "CODTV_REBROADCAST" ), 0 )
			end
		end
	end )
	f2_arg0:addEventHandler( "button_over", function ( f12_arg0, f12_arg1 )
		local f12_local0 = f0_local0( f2_arg0, f12_arg1.controller or f2_arg1 )
		if f2_arg0.vid_type == CODTV.VIDEO_TYPE.STREAM then
			ACTIONS.AnimateSequence( f2_arg0, "ButtonOverStream" )
		else
			ACTIONS.AnimateSequence( f2_arg0, "ButtonOverVOD" )
		end
		f2_arg0.tabChanged = false
	end )
	f2_arg0:addEventHandler( "button_up", function ( f13_arg0, f13_arg1 )
		local f13_local0 = f13_arg1.controller or f2_arg1
		if f2_arg0.vid_type == CODTV.VIDEO_TYPE.STREAM then
			if f2_arg0.tabChanged then
				ACTIONS.AnimateSequence( f2_arg0, "ButtonResetStream" )
			else
				ACTIONS.AnimateSequence( f2_arg0, "ButtonUpStream" )
			end
		else
			if f2_arg0.tabChanged then
				ACTIONS.AnimateSequence( f2_arg0, "ButtonResetVOD" )
			else
				ACTIONS.AnimateSequence( f2_arg0, "ButtonUpVOD" )
			end
			f2_arg0.tabChanged = false
		end
	end )
	f2_arg0:addEventHandler( "codtv_tab_changed", function ( f14_arg0, f14_arg1 )
		f2_arg0.channelIndex = -1
		f2_arg0.tabChanged = true
	end )
end

function CODTvButton( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 300 * _1080p, 0, 145 * _1080p )
	self.id = "CODTvButton"
	self._animationSets = {}
	self._sequences = {}
	local f15_local1 = controller and controller.controllerIndex
	if not f15_local1 and not Engine.InFrontend() then
		f15_local1 = self:getRootController()
	end
	assert( f15_local1 )
	local f15_local2 = self
	local GenericItemBackground = nil
	
	GenericItemBackground = MenuBuilder.BuildRegisteredType( "GenericItemBackground", {
		controllerIndex = f15_local1
	} )
	GenericItemBackground.id = "GenericItemBackground"
	GenericItemBackground:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 24, 0 )
	self:addElement( GenericItemBackground )
	self.GenericItemBackground = GenericItemBackground
	
	local DropShadow = nil
	
	DropShadow = LUI.UIImage.new()
	DropShadow.id = "DropShadow"
	DropShadow:SetRGBFromInt( 0, 0 )
	DropShadow:SetAlpha( 0.3, 0 )
	DropShadow:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
	DropShadow:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, 0, _1080p * 4 )
	self:addElement( DropShadow )
	self.DropShadow = DropShadow
	
	local Image = nil
	
	Image = LUI.UIImage.new()
	Image.id = "Image"
	Image:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 208, _1080p * 28, _1080p * 145 )
	self:addElement( Image )
	self.Image = Image
	
	local GenericButtonSelection = nil
	
	GenericButtonSelection = MenuBuilder.BuildRegisteredType( "GenericButtonSelection", {
		controllerIndex = f15_local1
	} )
	GenericButtonSelection.id = "GenericButtonSelection"
	GenericButtonSelection:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 24, _1080p * 2 )
	self:addElement( GenericButtonSelection )
	self.GenericButtonSelection = GenericButtonSelection
	
	local TitleBackground = nil
	
	TitleBackground = MenuBuilder.BuildRegisteredType( "GenericListButtonBackground", {
		controllerIndex = f15_local1
	} )
	TitleBackground.id = "TitleBackground"
	TitleBackground.DropShadow:SetAlpha( 0, 0 )
	TitleBackground:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 24 )
	self:addElement( TitleBackground )
	self.TitleBackground = TitleBackground
	
	local Name = nil
	
	Name = LUI.UIStyledText.new()
	Name.id = "Name"
	Name:SetRGBFromTable( SWATCHES.genericButton.textFocus, 0 )
	Name:setText( "Item Name", 0 )
	Name:SetFontSize( 19 * _1080p )
	Name:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Name:SetAlignment( LUI.Alignment.Right )
	Name:SetStartupDelay( 2000 )
	Name:SetLineHoldTime( 400 )
	Name:SetAnimMoveTime( 300 )
	Name:SetEndDelay( 1500 )
	Name:SetCrossfadeTime( 750 )
	Name:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	Name:SetMaxVisibleLines( 1 )
	Name:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -287, _1080p * -13, _1080p * 2.5, _1080p * 21.5 )
	self:addElement( Name )
	self.Name = Name
	
	local SubtitleBG = nil
	
	SubtitleBG = LUI.UIImage.new()
	SubtitleBG.id = "SubtitleBG"
	SubtitleBG:SetAlpha( 0, 0 )
	SubtitleBG:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 262.19, _1080p * 476.5, _1080p * 43.5, _1080p * 64.5 )
	self:addElement( SubtitleBG )
	self.SubtitleBG = SubtitleBG
	
	local Subtitle = nil
	
	Subtitle = LUI.UIStyledText.new()
	Subtitle.id = "Subtitle"
	Subtitle:SetRGBFromInt( 0, 0 )
	Subtitle:SetAlpha( 0, 0 )
	Subtitle:setText( "STREAMER NAME", 0 )
	Subtitle:SetFontSize( 18 * _1080p )
	Subtitle:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Subtitle:SetAlignment( LUI.Alignment.Left )
	Subtitle:SetStartupDelay( 2000 )
	Subtitle:SetLineHoldTime( 400 )
	Subtitle:SetAnimMoveTime( 300 )
	Subtitle:SetEndDelay( 1500 )
	Subtitle:SetCrossfadeTime( 750 )
	Subtitle:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	Subtitle:SetMaxVisibleLines( 1 )
	Subtitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 267.76, _1080p * 466.5, _1080p * 44, _1080p * 62 )
	self:addElement( Subtitle )
	self.Subtitle = Subtitle
	
	local SubtitleInfoCap = nil
	
	SubtitleInfoCap = LUI.UIImage.new()
	SubtitleInfoCap.id = "SubtitleInfoCap"
	SubtitleInfoCap:SetRGBFromInt( 14277081, 0 )
	SubtitleInfoCap:SetAlpha( 0, 0 )
	SubtitleInfoCap:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 255, _1080p * 258, _1080p * 43.5, _1080p * 72.5 )
	self:addElement( SubtitleInfoCap )
	self.SubtitleInfoCap = SubtitleInfoCap
	
	local ViewsLabel = nil
	
	ViewsLabel = LUI.UIText.new()
	ViewsLabel.id = "ViewsLabel"
	ViewsLabel:SetAlpha( 0, 0 )
	ViewsLabel:setText( Engine.Localize( "CODTV_VIEWERS" ), 0 )
	ViewsLabel:SetFontSize( 18 * _1080p )
	ViewsLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ViewsLabel:SetAlignment( LUI.Alignment.Left )
	ViewsLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 262.19, _1080p * 476.5, _1080p * 95, _1080p * 113 )
	self:addElement( ViewsLabel )
	self.ViewsLabel = ViewsLabel
	
	local LiveIcon = nil
	
	LiveIcon = LUI.UIImage.new()
	LiveIcon.id = "LiveIcon"
	LiveIcon:SetRGBFromInt( 16318464, 0 )
	LiveIcon:SetAlpha( 0, 0 )
	LiveIcon:setImage( RegisterMaterial( "widg_circle_small" ), 0 )
	LiveIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 262.19, _1080p * 270.19, _1080p * 77.5, _1080p * 85.5 )
	self:addElement( LiveIcon )
	self.LiveIcon = LiveIcon
	
	local LiveLabel = nil
	
	LiveLabel = LUI.UIText.new()
	LiveLabel.id = "LiveLabel"
	LiveLabel:SetAlpha( 0, 0 )
	LiveLabel:setText( Engine.Localize( "CODTV_LIVE" ), 0 )
	LiveLabel:SetFontSize( 18 * _1080p )
	LiveLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	LiveLabel:SetAlignment( LUI.Alignment.Left )
	LiveLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 275, _1080p * 476.5, _1080p * 72.5, _1080p * 90.5 )
	self:addElement( LiveLabel )
	self.LiveLabel = LiveLabel
	
	local DateLabel = nil
	
	DateLabel = LUI.UIText.new()
	DateLabel.id = "DateLabel"
	DateLabel:SetRGBFromInt( 0, 0 )
	DateLabel:SetAlpha( 0, 0 )
	DateLabel:setText( "", 0 )
	DateLabel:SetFontSize( 18 * _1080p )
	DateLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	DateLabel:SetAlignment( LUI.Alignment.Left )
	DateLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 267.76, _1080p * 466.5, _1080p * 44, _1080p * 62 )
	self:addElement( DateLabel )
	self.DateLabel = DateLabel
	
	local DurationBG = nil
	
	DurationBG = LUI.UIImage.new()
	DurationBG.id = "DurationBG"
	DurationBG:SetRGBFromInt( 0, 0 )
	DurationBG:SetAlpha( 0, 0 )
	DurationBG:SetBlendMode( BLEND_MODE.replace )
	DurationBG:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 149, _1080p * 208, _1080p * 122, _1080p * 145 )
	self:addElement( DurationBG )
	self.DurationBG = DurationBG
	
	local DurationLabel = nil
	
	DurationLabel = LUI.UIText.new()
	DurationLabel.id = "DurationLabel"
	DurationLabel:SetAlpha( 0, 0 )
	DurationLabel:setText( "09:52:10", 0 )
	DurationLabel:SetFontSize( 16 * _1080p )
	DurationLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	DurationLabel:SetAlignment( LUI.Alignment.Center )
	DurationLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 156.5, _1080p * 200.5, _1080p * 125.5, _1080p * 141.5 )
	self:addElement( DurationLabel )
	self.DurationLabel = DurationLabel
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		GenericItemBackground:RegisterAnimationSequence( "ButtonOverStream", {
			{
				function ()
					return self.GenericItemBackground:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 24, 0, 0 )
				end,
				function ()
					return self.GenericItemBackground:SetAnchorsAndPosition( 0, 0, 0, 0, 0, _1080p * 200, _1080p * 24, 0, 150 )
				end
			}
		} )
		DropShadow:RegisterAnimationSequence( "ButtonOverStream", {
			{
				function ()
					return self.DropShadow:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, 0, _1080p * 4, 0 )
				end,
				function ()
					return self.DropShadow:SetAnchorsAndPosition( 0, 0, 1, 0, 0, _1080p * 200, 0, _1080p * 4, 150 )
				end
			}
		} )
		GenericButtonSelection:RegisterAnimationSequence( "ButtonOverStream", {
			{
				function ()
					return self.GenericButtonSelection:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 24, _1080p * 2, 0 )
				end,
				function ()
					return self.GenericButtonSelection:SetAnchorsAndPosition( 0, 0, 0, 0, 0, _1080p * 200, _1080p * 24, _1080p * 2, 150 )
				end
			}
		} )
		TitleBackground:RegisterAnimationSequence( "ButtonOverStream", {
			{
				function ()
					return self.TitleBackground:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 24, 0 )
				end,
				function ()
					return self.TitleBackground:SetAnchorsAndPosition( 0, 0, 0, 1, 0, _1080p * 200, 0, _1080p * 24, 150 )
				end
			}
		} )
		Name:RegisterAnimationSequence( "ButtonOverStream", {
			{
				function ()
					return self.Name:SetRGBFromInt( 0, 0 )
				end
			},
			{
				function ()
					return self.Name:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -287, 0, _1080p * 2.5, _1080p * 21.5, 0 )
				end,
				function ()
					return self.Name:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -287, _1080p * 187, _1080p * 2.5, _1080p * 21.5, 150 )
				end
			}
		} )
		SubtitleBG:RegisterAnimationSequence( "ButtonOverStream", {
			{
				function ()
					return self.SubtitleBG:SetAlpha( 0, 0 )
				end,
				function ()
					return self.SubtitleBG:SetAlpha( 0, 80 )
				end,
				function ()
					return self.SubtitleBG:SetAlpha( 1, 70 )
				end
			},
			{
				function ()
					return self.SubtitleBG:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 262.19, _1080p * 266.5, _1080p * 43.5, _1080p * 64.5, 0 )
				end,
				function ()
					return self.SubtitleBG:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 262.19, _1080p * 476.5, _1080p * 43.5, _1080p * 64.5, 150 )
				end
			}
		} )
		Subtitle:RegisterAnimationSequence( "ButtonOverStream", {
			{
				function ()
					return self.Subtitle:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Subtitle:SetAlpha( 0, 80 )
				end,
				function ()
					return self.Subtitle:SetAlpha( 1, 70 )
				end
			}
		} )
		SubtitleInfoCap:RegisterAnimationSequence( "ButtonOverStream", {
			{
				function ()
					return self.SubtitleInfoCap:SetAlpha( 0, 0 )
				end,
				function ()
					return self.SubtitleInfoCap:SetAlpha( 1, 150 )
				end
			}
		} )
		ViewsLabel:RegisterAnimationSequence( "ButtonOverStream", {
			{
				function ()
					return self.ViewsLabel:SetAlpha( 0, 80 )
				end,
				function ()
					return self.ViewsLabel:SetAlpha( 1, 70 )
				end
			},
			{
				function ()
					return self.ViewsLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 262.19, _1080p * 476.5, _1080p * 95, _1080p * 113, 0 )
				end
			}
		} )
		LiveIcon:RegisterAnimationSequence( "ButtonOverStream", {
			{
				function ()
					return self.LiveIcon:SetAlpha( 0, 0 )
				end,
				function ()
					return self.LiveIcon:SetAlpha( 0, 80 )
				end,
				function ()
					return self.LiveIcon:SetAlpha( 1, 70 )
				end
			}
		} )
		LiveLabel:RegisterAnimationSequence( "ButtonOverStream", {
			{
				function ()
					return self.LiveLabel:SetAlpha( 0, 0 )
				end,
				function ()
					return self.LiveLabel:SetAlpha( 0, 80 )
				end,
				function ()
					return self.LiveLabel:SetAlpha( 1, 70 )
				end
			}
		} )
		self._sequences.ButtonOverStream = function ()
			GenericItemBackground:AnimateSequence( "ButtonOverStream" )
			DropShadow:AnimateSequence( "ButtonOverStream" )
			GenericButtonSelection:AnimateSequence( "ButtonOverStream" )
			TitleBackground:AnimateSequence( "ButtonOverStream" )
			Name:AnimateSequence( "ButtonOverStream" )
			SubtitleBG:AnimateSequence( "ButtonOverStream" )
			Subtitle:AnimateSequence( "ButtonOverStream" )
			SubtitleInfoCap:AnimateSequence( "ButtonOverStream" )
			ViewsLabel:AnimateSequence( "ButtonOverStream" )
			LiveIcon:AnimateSequence( "ButtonOverStream" )
			LiveLabel:AnimateSequence( "ButtonOverStream" )
		end
		
		GenericItemBackground:RegisterAnimationSequence( "ButtonUpStream", {
			{
				function ()
					return self.GenericItemBackground:SetAnchorsAndPosition( 0, 0, 0, 0, 0, _1080p * 200, _1080p * 24, 0, 0 )
				end,
				function ()
					return self.GenericItemBackground:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 24, 0, 150 )
				end
			}
		} )
		DropShadow:RegisterAnimationSequence( "ButtonUpStream", {
			{
				function ()
					return self.DropShadow:SetAnchorsAndPosition( 0, 0, 1, 0, 0, _1080p * 200, 0, _1080p * 4, 0 )
				end,
				function ()
					return self.DropShadow:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, 0, _1080p * 4, 150 )
				end
			}
		} )
		GenericButtonSelection:RegisterAnimationSequence( "ButtonUpStream", {
			{
				function ()
					return self.GenericButtonSelection:SetAnchorsAndPosition( 0, 0, 0, 0, 0, _1080p * 200, _1080p * 24, _1080p * 2, 0 )
				end,
				function ()
					return self.GenericButtonSelection:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 24, _1080p * 2, 150 )
				end
			}
		} )
		TitleBackground:RegisterAnimationSequence( "ButtonUpStream", {
			{
				function ()
					return self.TitleBackground:SetAnchorsAndPosition( 0, 0, 0, 1, 0, _1080p * 200, 0, _1080p * 24, 0 )
				end,
				function ()
					return self.TitleBackground:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 24, 150 )
				end
			}
		} )
		Name:RegisterAnimationSequence( "ButtonUpStream", {
			{
				function ()
					return self.Name:SetRGBFromTable( SWATCHES.genericButton.textFocus, 0 )
				end
			},
			{
				function ()
					return self.Name:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -287, _1080p * 187, _1080p * 2.5, _1080p * 21.5, 0 )
				end,
				function ()
					return self.Name:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -287, _1080p * -13, _1080p * 2.5, _1080p * 21.5, 150 )
				end
			}
		} )
		SubtitleBG:RegisterAnimationSequence( "ButtonUpStream", {
			{
				function ()
					return self.SubtitleBG:SetAlpha( 1, 0 )
				end,
				function ()
					return self.SubtitleBG:SetAlpha( 0, 150 )
				end
			},
			{
				function ()
					return self.SubtitleBG:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 262.19, _1080p * 476.5, _1080p * 43.5, _1080p * 64.5, 0 )
				end,
				function ()
					return self.SubtitleBG:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 262.19, _1080p * 276.5, _1080p * 43.5, _1080p * 64.5, 150 )
				end
			}
		} )
		Subtitle:RegisterAnimationSequence( "ButtonUpStream", {
			{
				function ()
					return self.Subtitle:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Subtitle:SetAlpha( 0, 80 )
				end
			}
		} )
		SubtitleInfoCap:RegisterAnimationSequence( "ButtonUpStream", {
			{
				function ()
					return self.SubtitleInfoCap:SetAlpha( 1, 0 )
				end,
				function ()
					return self.SubtitleInfoCap:SetAlpha( 0, 150 )
				end
			}
		} )
		ViewsLabel:RegisterAnimationSequence( "ButtonUpStream", {
			{
				function ()
					return self.ViewsLabel:SetAlpha( 1, 0 )
				end,
				function ()
					return self.ViewsLabel:SetAlpha( 0, 150 )
				end
			},
			{
				function ()
					return self.ViewsLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 262.19, _1080p * 476.5, _1080p * 95, _1080p * 113, 0 )
				end
			}
		} )
		LiveIcon:RegisterAnimationSequence( "ButtonUpStream", {
			{
				function ()
					return self.LiveIcon:SetAlpha( 1, 0 )
				end,
				function ()
					return self.LiveIcon:SetAlpha( 0, 150 )
				end
			}
		} )
		LiveLabel:RegisterAnimationSequence( "ButtonUpStream", {
			{
				function ()
					return self.LiveLabel:SetAlpha( 1, 0 )
				end,
				function ()
					return self.LiveLabel:SetAlpha( 0, 150 )
				end
			}
		} )
		DateLabel:RegisterAnimationSequence( "ButtonUpStream", {
			{
				function ()
					return self.DateLabel:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.ButtonUpStream = function ()
			GenericItemBackground:AnimateSequence( "ButtonUpStream" )
			DropShadow:AnimateSequence( "ButtonUpStream" )
			GenericButtonSelection:AnimateSequence( "ButtonUpStream" )
			TitleBackground:AnimateSequence( "ButtonUpStream" )
			Name:AnimateSequence( "ButtonUpStream" )
			SubtitleBG:AnimateSequence( "ButtonUpStream" )
			Subtitle:AnimateSequence( "ButtonUpStream" )
			SubtitleInfoCap:AnimateSequence( "ButtonUpStream" )
			ViewsLabel:AnimateSequence( "ButtonUpStream" )
			LiveIcon:AnimateSequence( "ButtonUpStream" )
			LiveLabel:AnimateSequence( "ButtonUpStream" )
			DateLabel:AnimateSequence( "ButtonUpStream" )
		end
		
		GenericItemBackground:RegisterAnimationSequence( "ButtonOverVOD", {
			{
				function ()
					return self.GenericItemBackground:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 24, 0, 0 )
				end,
				function ()
					return self.GenericItemBackground:SetAnchorsAndPosition( 0, 0, 0, 0, 0, _1080p * 200, _1080p * 24, 0, 150 )
				end
			}
		} )
		DropShadow:RegisterAnimationSequence( "ButtonOverVOD", {
			{
				function ()
					return self.DropShadow:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, 0, _1080p * 4, 0 )
				end,
				function ()
					return self.DropShadow:SetAnchorsAndPosition( 0, 0, 1, 0, 0, _1080p * 200, 0, _1080p * 4, 150 )
				end
			}
		} )
		GenericButtonSelection:RegisterAnimationSequence( "ButtonOverVOD", {
			{
				function ()
					return self.GenericButtonSelection:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 24, _1080p * 2, 0 )
				end,
				function ()
					return self.GenericButtonSelection:SetAnchorsAndPosition( 0, 0, 0, 0, 0, _1080p * 200, _1080p * 24, _1080p * 2, 150 )
				end
			}
		} )
		TitleBackground:RegisterAnimationSequence( "ButtonOverVOD", {
			{
				function ()
					return self.TitleBackground:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 24, 0 )
				end,
				function ()
					return self.TitleBackground:SetAnchorsAndPosition( 0, 0, 0, 1, 0, _1080p * 200, 0, _1080p * 24, 150 )
				end
			}
		} )
		Name:RegisterAnimationSequence( "ButtonOverVOD", {
			{
				function ()
					return self.Name:SetRGBFromInt( 0, 0 )
				end
			},
			{
				function ()
					return self.Name:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -287, 0, _1080p * 2.5, _1080p * 21.5, 0 )
				end,
				function ()
					return self.Name:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -287, _1080p * 187, _1080p * 2.5, _1080p * 21.5, 150 )
				end
			}
		} )
		SubtitleBG:RegisterAnimationSequence( "ButtonOverVOD", {
			{
				function ()
					return self.SubtitleBG:SetAlpha( 0, 0 )
				end,
				function ()
					return self.SubtitleBG:SetAlpha( 0, 80 )
				end,
				function ()
					return self.SubtitleBG:SetAlpha( 1, 70 )
				end
			},
			{
				function ()
					return self.SubtitleBG:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 262.19, _1080p * 266.5, _1080p * 43.5, _1080p * 64.5, 0 )
				end,
				function ()
					return self.SubtitleBG:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 262.19, _1080p * 476.5, _1080p * 43.5, _1080p * 64.5, 150 )
				end
			}
		} )
		SubtitleInfoCap:RegisterAnimationSequence( "ButtonOverVOD", {
			{
				function ()
					return self.SubtitleInfoCap:SetAlpha( 0, 0 )
				end,
				function ()
					return self.SubtitleInfoCap:SetAlpha( 1, 150 )
				end
			}
		} )
		ViewsLabel:RegisterAnimationSequence( "ButtonOverVOD", {
			{
				function ()
					return self.ViewsLabel:SetAlpha( 0, 0 )
				end,
				function ()
					return self.ViewsLabel:SetAlpha( 0, 80 )
				end,
				function ()
					return self.ViewsLabel:SetAlpha( 1, 70 )
				end
			},
			{
				function ()
					return self.ViewsLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 262.19, _1080p * 476.5, _1080p * 72.5, _1080p * 90.5, 0 )
				end,
				function ()
					return self.ViewsLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 262.19, _1080p * 476.5, _1080p * 72.5, _1080p * 90.5, 150 )
				end
			}
		} )
		DateLabel:RegisterAnimationSequence( "ButtonOverVOD", {
			{
				function ()
					return self.DateLabel:SetAlpha( 0, 0 )
				end,
				function ()
					return self.DateLabel:SetAlpha( 0, 80 )
				end,
				function ()
					return self.DateLabel:SetAlpha( 1, 70 )
				end
			}
		} )
		self._sequences.ButtonOverVOD = function ()
			GenericItemBackground:AnimateSequence( "ButtonOverVOD" )
			DropShadow:AnimateSequence( "ButtonOverVOD" )
			GenericButtonSelection:AnimateSequence( "ButtonOverVOD" )
			TitleBackground:AnimateSequence( "ButtonOverVOD" )
			Name:AnimateSequence( "ButtonOverVOD" )
			SubtitleBG:AnimateSequence( "ButtonOverVOD" )
			SubtitleInfoCap:AnimateSequence( "ButtonOverVOD" )
			ViewsLabel:AnimateSequence( "ButtonOverVOD" )
			DateLabel:AnimateSequence( "ButtonOverVOD" )
		end
		
		GenericItemBackground:RegisterAnimationSequence( "ButtonUpVOD", {
			{
				function ()
					return self.GenericItemBackground:SetAnchorsAndPosition( 0, 0, 0, 0, 0, _1080p * 200, _1080p * 24, 0, 0 )
				end,
				function ()
					return self.GenericItemBackground:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 24, 0, 150 )
				end
			}
		} )
		DropShadow:RegisterAnimationSequence( "ButtonUpVOD", {
			{
				function ()
					return self.DropShadow:SetAnchorsAndPosition( 0, 0, 1, 0, 0, _1080p * 200, 0, _1080p * 4, 0 )
				end,
				function ()
					return self.DropShadow:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, 0, _1080p * 4, 150 )
				end
			}
		} )
		GenericButtonSelection:RegisterAnimationSequence( "ButtonUpVOD", {
			{
				function ()
					return self.GenericButtonSelection:SetAnchorsAndPosition( 0, 0, 0, 0, 0, _1080p * 200, _1080p * 24, _1080p * 2, 0 )
				end,
				function ()
					return self.GenericButtonSelection:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 24, _1080p * 2, 150 )
				end
			}
		} )
		TitleBackground:RegisterAnimationSequence( "ButtonUpVOD", {
			{
				function ()
					return self.TitleBackground:SetAnchorsAndPosition( 0, 0, 0, 1, 0, _1080p * 200, 0, _1080p * 24, 0 )
				end,
				function ()
					return self.TitleBackground:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 24, 150 )
				end
			}
		} )
		Name:RegisterAnimationSequence( "ButtonUpVOD", {
			{
				function ()
					return self.Name:SetRGBFromTable( SWATCHES.genericButton.textFocus, 0 )
				end
			},
			{
				function ()
					return self.Name:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -287, _1080p * 187, _1080p * 2.5, _1080p * 21.5, 0 )
				end,
				function ()
					return self.Name:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -287, _1080p * -13, _1080p * 2.5, _1080p * 21.5, 150 )
				end
			}
		} )
		SubtitleBG:RegisterAnimationSequence( "ButtonUpVOD", {
			{
				function ()
					return self.SubtitleBG:SetAlpha( 1, 0 )
				end,
				function ()
					return self.SubtitleBG:SetAlpha( 0, 150 )
				end
			},
			{
				function ()
					return self.SubtitleBG:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 262.19, _1080p * 476.5, _1080p * 43.5, _1080p * 64.5, 0 )
				end,
				function ()
					return self.SubtitleBG:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 262.19, _1080p * 276.5, _1080p * 43.5, _1080p * 64.5, 150 )
				end
			}
		} )
		SubtitleInfoCap:RegisterAnimationSequence( "ButtonUpVOD", {
			{
				function ()
					return self.SubtitleInfoCap:SetAlpha( 1, 0 )
				end,
				function ()
					return self.SubtitleInfoCap:SetAlpha( 0, 150 )
				end
			}
		} )
		ViewsLabel:RegisterAnimationSequence( "ButtonUpVOD", {
			{
				function ()
					return self.ViewsLabel:SetAlpha( 1, 0 )
				end,
				function ()
					return self.ViewsLabel:SetAlpha( 0, 80 )
				end
			},
			{
				function ()
					return self.ViewsLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 262.19, _1080p * 476.5, _1080p * 72.5, _1080p * 90.5, 0 )
				end
			}
		} )
		LiveIcon:RegisterAnimationSequence( "ButtonUpVOD", {
			{
				function ()
					return self.LiveIcon:SetAlpha( 0, 0 )
				end
			}
		} )
		LiveLabel:RegisterAnimationSequence( "ButtonUpVOD", {
			{
				function ()
					return self.LiveLabel:SetAlpha( 0, 0 )
				end
			}
		} )
		DateLabel:RegisterAnimationSequence( "ButtonUpVOD", {
			{
				function ()
					return self.DateLabel:SetAlpha( 1, 0 )
				end,
				function ()
					return self.DateLabel:SetAlpha( 0, 80 )
				end
			}
		} )
		self._sequences.ButtonUpVOD = function ()
			GenericItemBackground:AnimateSequence( "ButtonUpVOD" )
			DropShadow:AnimateSequence( "ButtonUpVOD" )
			GenericButtonSelection:AnimateSequence( "ButtonUpVOD" )
			TitleBackground:AnimateSequence( "ButtonUpVOD" )
			Name:AnimateSequence( "ButtonUpVOD" )
			SubtitleBG:AnimateSequence( "ButtonUpVOD" )
			SubtitleInfoCap:AnimateSequence( "ButtonUpVOD" )
			ViewsLabel:AnimateSequence( "ButtonUpVOD" )
			LiveIcon:AnimateSequence( "ButtonUpVOD" )
			LiveLabel:AnimateSequence( "ButtonUpVOD" )
			DateLabel:AnimateSequence( "ButtonUpVOD" )
		end
		
		GenericItemBackground:RegisterAnimationSequence( "ButtonResetVOD", {
			{
				function ()
					return self.GenericItemBackground:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 24, 0, 0 )
				end
			}
		} )
		DropShadow:RegisterAnimationSequence( "ButtonResetVOD", {
			{
				function ()
					return self.DropShadow:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, 0, _1080p * 4, 0 )
				end
			}
		} )
		GenericButtonSelection:RegisterAnimationSequence( "ButtonResetVOD", {
			{
				function ()
					return self.GenericButtonSelection:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 24, _1080p * 2, 0 )
				end
			}
		} )
		TitleBackground:RegisterAnimationSequence( "ButtonResetVOD", {
			{
				function ()
					return self.TitleBackground:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 24, 0 )
				end
			}
		} )
		Name:RegisterAnimationSequence( "ButtonResetVOD", {
			{
				function ()
					return self.Name:SetRGBFromTable( SWATCHES.genericButton.textFocus, 0 )
				end
			},
			{
				function ()
					return self.Name:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -287, _1080p * -13, _1080p * 2.5, _1080p * 21.5, 0 )
				end
			}
		} )
		SubtitleBG:RegisterAnimationSequence( "ButtonResetVOD", {
			{
				function ()
					return self.SubtitleBG:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.SubtitleBG:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 262.19, _1080p * 276.5, _1080p * 43.5, _1080p * 64.5, 0 )
				end
			}
		} )
		Subtitle:RegisterAnimationSequence( "ButtonResetVOD", {
			{
				function ()
					return self.Subtitle:SetAlpha( 0, 0 )
				end
			}
		} )
		SubtitleInfoCap:RegisterAnimationSequence( "ButtonResetVOD", {
			{
				function ()
					return self.SubtitleInfoCap:SetAlpha( 0, 0 )
				end
			}
		} )
		ViewsLabel:RegisterAnimationSequence( "ButtonResetVOD", {
			{
				function ()
					return self.ViewsLabel:SetAlpha( 0, 0 )
				end
			}
		} )
		LiveIcon:RegisterAnimationSequence( "ButtonResetVOD", {
			{
				function ()
					return self.LiveIcon:SetAlpha( 0, 0 )
				end
			}
		} )
		LiveLabel:RegisterAnimationSequence( "ButtonResetVOD", {
			{
				function ()
					return self.LiveLabel:SetAlpha( 0, 0 )
				end
			}
		} )
		DateLabel:RegisterAnimationSequence( "ButtonResetVOD", {
			{
				function ()
					return self.DateLabel:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.ButtonResetVOD = function ()
			GenericItemBackground:AnimateSequence( "ButtonResetVOD" )
			DropShadow:AnimateSequence( "ButtonResetVOD" )
			GenericButtonSelection:AnimateSequence( "ButtonResetVOD" )
			TitleBackground:AnimateSequence( "ButtonResetVOD" )
			Name:AnimateSequence( "ButtonResetVOD" )
			SubtitleBG:AnimateSequence( "ButtonResetVOD" )
			Subtitle:AnimateSequence( "ButtonResetVOD" )
			SubtitleInfoCap:AnimateSequence( "ButtonResetVOD" )
			ViewsLabel:AnimateSequence( "ButtonResetVOD" )
			LiveIcon:AnimateSequence( "ButtonResetVOD" )
			LiveLabel:AnimateSequence( "ButtonResetVOD" )
			DateLabel:AnimateSequence( "ButtonResetVOD" )
		end
		
		GenericItemBackground:RegisterAnimationSequence( "ButtonResetStream", {
			{
				function ()
					return self.GenericItemBackground:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 24, 0, 0 )
				end
			}
		} )
		DropShadow:RegisterAnimationSequence( "ButtonResetStream", {
			{
				function ()
					return self.DropShadow:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, 0, _1080p * 4, 0 )
				end
			}
		} )
		GenericButtonSelection:RegisterAnimationSequence( "ButtonResetStream", {
			{
				function ()
					return self.GenericButtonSelection:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 24, _1080p * 2, 0 )
				end
			}
		} )
		TitleBackground:RegisterAnimationSequence( "ButtonResetStream", {
			{
				function ()
					return self.TitleBackground:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 24, 0 )
				end
			}
		} )
		Name:RegisterAnimationSequence( "ButtonResetStream", {
			{
				function ()
					return self.Name:SetRGBFromTable( SWATCHES.genericButton.textFocus, 0 )
				end
			},
			{
				function ()
					return self.Name:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -287, _1080p * -13, _1080p * 2.5, _1080p * 21.5, 0 )
				end
			}
		} )
		SubtitleBG:RegisterAnimationSequence( "ButtonResetStream", {
			{
				function ()
					return self.SubtitleBG:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.SubtitleBG:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 262.19, _1080p * 276.5, _1080p * 43.5, _1080p * 64.5, 0 )
				end
			}
		} )
		Subtitle:RegisterAnimationSequence( "ButtonResetStream", {
			{
				function ()
					return self.Subtitle:SetAlpha( 0, 0 )
				end
			}
		} )
		SubtitleInfoCap:RegisterAnimationSequence( "ButtonResetStream", {
			{
				function ()
					return self.SubtitleInfoCap:SetAlpha( 0, 0 )
				end
			}
		} )
		ViewsLabel:RegisterAnimationSequence( "ButtonResetStream", {
			{
				function ()
					return self.ViewsLabel:SetAlpha( 0, 0 )
				end
			}
		} )
		LiveIcon:RegisterAnimationSequence( "ButtonResetStream", {
			{
				function ()
					return self.LiveIcon:SetAlpha( 0, 0 )
				end
			}
		} )
		LiveLabel:RegisterAnimationSequence( "ButtonResetStream", {
			{
				function ()
					return self.LiveLabel:SetAlpha( 0, 0 )
				end
			}
		} )
		DateLabel:RegisterAnimationSequence( "ButtonResetStream", {
			{
				function ()
					return self.DateLabel:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.ButtonResetStream = function ()
			GenericItemBackground:AnimateSequence( "ButtonResetStream" )
			DropShadow:AnimateSequence( "ButtonResetStream" )
			GenericButtonSelection:AnimateSequence( "ButtonResetStream" )
			TitleBackground:AnimateSequence( "ButtonResetStream" )
			Name:AnimateSequence( "ButtonResetStream" )
			SubtitleBG:AnimateSequence( "ButtonResetStream" )
			Subtitle:AnimateSequence( "ButtonResetStream" )
			SubtitleInfoCap:AnimateSequence( "ButtonResetStream" )
			ViewsLabel:AnimateSequence( "ButtonResetStream" )
			LiveIcon:AnimateSequence( "ButtonResetStream" )
			LiveLabel:AnimateSequence( "ButtonResetStream" )
			DateLabel:AnimateSequence( "ButtonResetStream" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local1( self, f15_local1, controller )
	return self
end

MenuBuilder.registerType( "CODTvButton", CODTvButton )
LockTable( _M )
