local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function GreenDotHip( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 10 * _1080p, 0, 10 * _1080p )
	self.id = "GreenDotHip"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local RedDot = nil
	
	RedDot = MenuBuilder.BuildRegisteredType( "RedDot", {
		controllerIndex = f1_local1
	} )
	RedDot.id = "RedDot"
	RedDot.DotShadow:SetRGBFromTable( SWATCHES.Reticles.BrightGreen, 0 )
	RedDot.Dot:SetRGBFromTable( SWATCHES.Reticles.BrightGreen, 0 )
	RedDot:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -3, _1080p * 3, _1080p * -3, _1080p * 3 )
	self:addElement( RedDot )
	self.RedDot = RedDot
	
	return self
end

MenuBuilder.registerType( "GreenDotHip", GreenDotHip )
LockTable( _M )
