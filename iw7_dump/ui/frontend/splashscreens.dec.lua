local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
SplashList = {
	{
		video = "startup"
	}
}
function SplashScreens()
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
	self.id = "splashScreens"
	self.nextSplashNum = 1
	local f1_local1 = LUI.UIImage.new( {
		material = RegisterMaterial( "sp_frontend_bink_background" ),
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0,
		alpha = 0
	} )
	f1_local1:SetAlpha( 1, 2000 )
	f1_local1.id = "background"
	self:addElement( f1_local1 )
	
	local blackBackground = LUI.UIImage.new()
	blackBackground:SetRGBFromInt( 0 )
	blackBackground:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	blackBackground.id = "blackBackground"
	self:addElement( blackBackground )
	self.blackBackground = blackBackground
	
	local f1_local3 = self:Wait( 250 )
	f1_local3.onComplete = function ()
		blackBackground:SetAlpha( 0 )
	end
	
	local f1_local4 = LUI.UIImage.new( {
		material = RegisterMaterial( "cinematic" ),
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0
	} )
	f1_local4.id = "display"
	self:addElement( f1_local4 )
	local f1_local5 = LUI.UITimer.new( nil, {
		interval = 100,
		event = "refresh_video"
	} )
	f1_local5.id = "timer"
	self:addElement( f1_local5 )
	self:registerEventHandler( "refresh_video", function ( element, event )
		if not Engine.IsVideoFinished() then
			return 
		else
			PlayNext( element )
		end
	end )
	PlayNext( self )
	self:registerEventHandler( "gamepad_button", function ( element, event )
		if event.down then
			element.blackBackground:SetAlpha( 0 )
			PlayNext( element )
		end
	end )
	self:registerEventHandler( "mousedown", function ( element, event )
		element.blackBackground:SetAlpha( 0 )
		PlayNext( element )
	end )
	return self
end

function PlayNext( f6_arg0 )
	assert( f6_arg0.nextSplashNum )
	local f6_local0 = SplashList[f6_arg0.nextSplashNum]
	if f6_local0 then
		assert( f6_local0.video )
		Engine.PlayMenuVideo( f6_local0.video )
		f6_arg0.nextSplashNum = f6_arg0.nextSplashNum + 1
	else
		Engine.StopMenuVideo()
		LUI.FlowManager.RequestLeaveMenu( f6_arg0, true, true )
		OpenTitleScreen()
	end
end

MenuBuilder.registerType( "splash_screens", SplashScreens )
LockTable( _M )
