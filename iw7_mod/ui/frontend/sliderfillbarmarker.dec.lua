local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function SliderFillBarMarker( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 2 * _1080p, 0, 18 * _1080p )
	self.id = "SliderFillBarMarker"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Arrow = nil
	
	Arrow = LUI.UIImage.new()
	Arrow.id = "Arrow"
	Arrow:SetZRotation( 180, 0 )
	Arrow:setImage( RegisterMaterial( "ops_map_icon_triangle" ), 0 )
	Arrow:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * -4, _1080p * 4, _1080p * -8, 0 )
	self:addElement( Arrow )
	self.Arrow = Arrow
	
	local Line = nil
	
	Line = LUI.UIImage.new()
	Line.id = "Line"
	Line:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 2, _1080p * -2 )
	self:addElement( Line )
	self.Line = Line
	
	return self
end

MenuBuilder.registerType( "SliderFillBarMarker", SliderFillBarMarker )
LockTable( _M )
