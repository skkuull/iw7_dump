local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function VerticalMinimalScrollbarSliderArea( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 16 * _1080p, 0, 400 * _1080p )
	self.id = "VerticalMinimalScrollbarSliderArea"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local fixedSizeSlider = nil
	
	fixedSizeSlider = MenuBuilder.BuildRegisteredType( "VerticalMinimalScrollbarSlider", {
		controllerIndex = f1_local1
	} )
	fixedSizeSlider.id = "fixedSizeSlider"
	fixedSizeSlider:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, 0 )
	self:addElement( fixedSizeSlider )
	self.fixedSizeSlider = fixedSizeSlider
	
	return self
end

MenuBuilder.registerType( "VerticalMinimalScrollbarSliderArea", VerticalMinimalScrollbarSliderArea )
LockTable( _M )
