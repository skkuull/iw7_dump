local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function TabsSpacer( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 4 * _1080p, 0, 30 * _1080p )
	self.id = "TabsSpacer"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local GradientDownTop = nil
	
	GradientDownTop = LUI.UIImage.new()
	GradientDownTop.id = "GradientDownTop"
	GradientDownTop:SetRGBFromTable( SWATCHES.genericButton.backgroundFocus, 0 )
	GradientDownTop:SetAlpha( 0.25, 0 )
	GradientDownTop:setImage( RegisterMaterial( "widg_gradient_bottom_to_top" ), 0 )
	GradientDownTop:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, _1080p * -3 )
	self:addElement( GradientDownTop )
	self.GradientDownTop = GradientDownTop
	
	local Line = nil
	
	Line = LUI.UIImage.new()
	Line.id = "Line"
	Line:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -2, _1080p * 2, _1080p * -12, _1080p * 12 )
	self:addElement( Line )
	self.Line = Line
	
	return self
end

MenuBuilder.registerType( "TabsSpacer", TabsSpacer )
LockTable( _M )
