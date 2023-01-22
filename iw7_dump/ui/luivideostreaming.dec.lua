local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ()
	Engine.StopMusic()
	Engine.PlayStreamingVideo( "http://sceerd.dl.playstation.net/sceerd/sceavplayer/streaming02.mp4" )
	local self = LUI.UIElement.new( {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0
	} )
	self.id = "videoStreamingMenu"
	local f1_local1 = LUI.UIImage.new( {
		material = RegisterMaterial( "cinematic_mp4" ),
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		top = 100,
		bottom = 360,
		left = 100,
		right = 640
	} )
	f1_local1.id = "cinematic"
	self:addElement( f1_local1 )
	self:addElement( MenuBuilder.BuildRegisteredType( "generic_back_button" ) )
	return self
end

f0_local1 = function ()
	Engine.StopStreamingVideo()
end

MenuBuilder.registerType( "VideoStreaming", f0_local0 )
LUI.FlowManager.RegisterStackPopBehaviour( "VideoStreaming", f0_local1 )
LockTable( _M )
