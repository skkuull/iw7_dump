local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function HackVideoFeed( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "HackVideoFeed"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Glitch = nil
	
	Glitch = LUI.UIImage.new()
	Glitch.id = "Glitch"
	Glitch:SetDotPitchEnabled( true )
	Glitch:SetDotPitchX( 52, 0 )
	Glitch:SetDotPitchY( 43, 0 )
	Glitch:SetDotPitchContrast( 0.4, 0 )
	Glitch:SetDotPitchMode( 0 )
	Glitch:setImage( RegisterMaterial( "hud_glitch" ), 0 )
	self:addElement( Glitch )
	self.Glitch = Glitch
	
	return self
end

MenuBuilder.registerType( "HackVideoFeed", HackVideoFeed )
LockTable( _M )
