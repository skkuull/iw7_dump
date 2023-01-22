local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function GenericCheckBox( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 16 * _1080p, 0, 16 * _1080p )
	self.id = "GenericCheckBox"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Frame = nil
	
	Frame = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	} )
	Frame.id = "Frame"
	self:addElement( Frame )
	self.Frame = Frame
	
	local Fill = nil
	
	Fill = LUI.UIImage.new()
	Fill.id = "Fill"
	Fill:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 3, _1080p * -3, _1080p * 3, _1080p * -3 )
	self:addElement( Fill )
	self.Fill = Fill
	
	return self
end

MenuBuilder.registerType( "GenericCheckBox", GenericCheckBox )
LockTable( _M )
