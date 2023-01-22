local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0 )
	if f1_arg0.ImageChan ~= nil then
		f1_arg0:removeElement( f1_arg0.ImageChan )
		f1_arg0.ImageChan = nil
	end
end

f0_local1 = function ( f2_arg0, f2_arg1 )
	local ImageChan = nil
	
	ImageChan = LUI.UIImage.new()
	ImageChan.id = "ImageChan"
	ImageChan:setImage( RegisterMaterial( f2_arg1 ), 0 )
	ImageChan:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 208, 0, _1080p * 117 )
	f2_arg0:addElement( ImageChan )
	f2_arg0.ImageChan = ImageChan
	
end

function PostLoadFunc( f3_arg0, f3_arg1 )
	f3_arg0.channelID = -1
	f3_arg0:SubscribeToModelThroughElement( f3_arg0, "name", function ()
		local f4_local0 = f3_arg0
		local f4_local1 = f3_arg0:GetDataSource()
		f4_local0.channelID = f4_local1.index:GetValue( f3_arg1 )
		f4_local0 = f3_arg0:GetDataSource()
		f4_local0 = f4_local0.name:GetValue( f3_arg1 )
		if f4_local0 ~= nil then
			f3_arg0.Button.Text:setText( tostring( f4_local0 ) )
		end
	end )
	f3_arg0.Subtitle:SubscribeToModelThroughElement( f3_arg0, "subtitle", function ()
		local f5_local0 = f3_arg0:GetDataSource()
		f5_local0 = f5_local0.subtitle:GetValue( f3_arg1 )
		if f5_local0 ~= nil then
			f3_arg0.Subtitle:setText( tostring( f5_local0 ) )
		end
	end )
	f3_arg0.channel_ID = -1
	f3_arg0.vid_type = -1
	f3_arg0:SubscribeToModelThroughElement( f3_arg0, "channel_id", function ()
		local f6_local0 = f3_arg0:GetDataSource()
		f6_local0 = f6_local0.channel_id:GetValue( f3_arg1 )
		if f6_local0 ~= nil then
			f3_arg0.channel_ID = f6_local0
		else
			f3_arg0.channel_ID = -1
		end
		local f6_local1 = f3_arg0:GetDataSource()
		f6_local0 = f6_local1.vid_type:GetValue( f3_arg1 )
		if f6_local0 ~= nil then
			f3_arg0.vid_type = f6_local0
		else
			f3_arg0.vid_type = -1
		end
	end )
	f3_arg0.Button:addEventHandler( "button_action", function ( f7_arg0, f7_arg1 )
		if f3_arg0.channel_ID ~= -1 then
			MLGContent.Stream( f3_arg0.vid_type, f3_arg0.channel_ID )
		end
	end )
	f3_arg0.ImageChan = nil
	f3_arg0:SubscribeToModelThroughElement( f3_arg0, "image", function ()
		local f8_local0 = f3_arg0:GetDataSource()
		f8_local0 = f8_local0.image:GetValue( f3_arg1 )
		f0_local0( f3_arg0 )
		if f8_local0 ~= nil and f8_local0 ~= -1 then
			f0_local1( f3_arg0, "mlg_channel_viewer" .. tostring( f8_local0 ) )
		end
	end )
	f3_arg0.Button:addEventHandler( "button_over", function ( f9_arg0, f9_arg1 )
		f3_arg0:dispatchEventToRoot( {
			name = "mlg_channel_selected",
			immediate = true,
			channel_id = f3_arg0.channelID
		} )
	end )
end

function MLGStreamChannelRow( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 460 * _1080p, 0, 117 * _1080p )
	self.id = "MLGStreamChannelRow"
	local f10_local1 = controller and controller.controllerIndex
	if not f10_local1 and not Engine.InFrontend() then
		f10_local1 = self:getRootController()
	end
	assert( f10_local1 )
	local f10_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 0, 0 )
	Background:SetAlpha( 0.55, 0 )
	Background:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 460, 0, _1080p * 117 )
	self:addElement( Background )
	self.Background = Background
	
	local Subtitle = nil
	
	Subtitle = LUI.UIText.new()
	Subtitle.id = "Subtitle"
	Subtitle:setText( Engine.Localize( "MENU_NEW" ), 0 )
	Subtitle:SetFontSize( 28 * _1080p )
	Subtitle:SetFont( FONTS.GetFont( FONTS.Dev.File ) )
	Subtitle:SetAlignment( LUI.Alignment.Left )
	Subtitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 208, _1080p * 460, 0, _1080p * 28 )
	self:addElement( Subtitle )
	self.Subtitle = Subtitle
	
	local Button = nil
	
	Button = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f10_local1
	} )
	Button.id = "Button"
	Button.Text:setText( ToUpperCase( Engine.Localize( "MENU_NEW" ) ), 0 )
	Button:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 210, _1080p * 502, _1080p * 87, _1080p * 117 )
	self:addElement( Button )
	self.Button = Button
	
	PostLoadFunc( self, f10_local1, controller )
	return self
end

MenuBuilder.registerType( "MLGStreamChannelRow", MLGStreamChannelRow )
LockTable( _M )
