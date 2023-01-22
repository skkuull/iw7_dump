local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function BlueDot( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 10 * _1080p, 0, 10 * _1080p )
	self.id = "BlueDot"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local BlueDot = nil
	
	BlueDot = MenuBuilder.BuildRegisteredType( "RedDot", {
		controllerIndex = f1_local1
	} )
	BlueDot.id = "BlueDot"
	BlueDot.DotShadow:SetRGBFromTable( SWATCHES.Reticles.Blue, 0 )
	BlueDot.Dot:SetRGBFromTable( SWATCHES.Reticles.Blue, 0 )
	BlueDot.DotHighlight:SetRGBFromTable( SWATCHES.Reticles.Periwinkle, 0 )
	BlueDot:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( BlueDot )
	self.BlueDot = BlueDot
	
	return self
end

MenuBuilder.registerType( "BlueDot", BlueDot )
LockTable( _M )
