local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function CyanDot( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 8 * _1080p, 0, 8 * _1080p )
	self.id = "CyanDot"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local CyanDot = nil
	
	CyanDot = MenuBuilder.BuildRegisteredType( "RedDot", {
		controllerIndex = f1_local1
	} )
	CyanDot.id = "CyanDot"
	CyanDot.DotShadow:SetRGBFromTable( SWATCHES.Reticles.VibrantTeal, 0 )
	CyanDot.Dot:SetRGBFromTable( SWATCHES.Reticles.AzureBlue, 0 )
	CyanDot.DotHighlight:SetRGBFromTable( SWATCHES.Reticles.LightCyan, 0 )
	CyanDot:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -3, _1080p * 3, _1080p * -3, _1080p * 3 )
	self:addElement( CyanDot )
	self.CyanDot = CyanDot
	
	return self
end

MenuBuilder.registerType( "CyanDot", CyanDot )
LockTable( _M )
