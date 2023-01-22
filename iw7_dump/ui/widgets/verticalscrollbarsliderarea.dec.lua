local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function VerticalScrollbarSliderArea( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 16 * _1080p, 0, 300 * _1080p )
	self.id = "VerticalScrollbarSliderArea"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local background = nil
	
	background = LUI.UIImage.new()
	background.id = "background"
	background:SetRGBFromInt( 0, 0 )
	background:SetAlpha( 0.2, 0 )
	self:addElement( background )
	self.background = background
	
	local slider = nil
	
	slider = MenuBuilder.BuildRegisteredType( "VerticalScrollbarSlider", {
		controllerIndex = f1_local1
	} )
	slider.id = "slider"
	slider:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 40, _1080p * 90 )
	self:addElement( slider )
	self.slider = slider
	
	return self
end

MenuBuilder.registerType( "VerticalScrollbarSliderArea", VerticalScrollbarSliderArea )
LockTable( _M )
