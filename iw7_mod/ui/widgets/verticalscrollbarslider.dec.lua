local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function VerticalScrollbarSlider( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 16 * _1080p, 0, 50 * _1080p )
	self.id = "VerticalScrollbarSlider"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local slider = nil
	
	slider = LUI.UIImage.new()
	slider.id = "slider"
	slider:SetAlpha( 0.8, 0 )
	self:addElement( slider )
	self.slider = slider
	
	return self
end

MenuBuilder.registerType( "VerticalScrollbarSlider", VerticalScrollbarSlider )
LockTable( _M )
