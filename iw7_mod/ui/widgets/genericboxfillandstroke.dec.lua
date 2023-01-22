local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function GenericBoxFillAndStroke( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 100 * _1080p, 0, 100 * _1080p )
	self.id = "GenericBoxFillAndStroke"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Fill = nil
	
	Fill = LUI.UIImage.new()
	Fill.id = "Fill"
	Fill:setImage( RegisterMaterial( "ui_default_white" ), 0 )
	Fill:SetUseAA( true )
	self:addElement( Fill )
	self.Fill = Fill
	
	local Stroke = nil
	
	Stroke = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	} )
	Stroke.id = "Stroke"
	self:addElement( Stroke )
	self.Stroke = Stroke
	
	return self
end

MenuBuilder.registerType( "GenericBoxFillAndStroke", GenericBoxFillAndStroke )
LockTable( _M )
