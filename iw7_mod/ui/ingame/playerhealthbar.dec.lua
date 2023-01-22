local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PlayerHealthbar( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 100 * _1080p, 0, 12 * _1080p )
	self.id = "PlayerHealthbar"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local BGFill = nil
	
	BGFill = LUI.UIImage.new()
	BGFill.id = "BGFill"
	BGFill:SetRGBFromTable( SWATCHES.HUD.background, 0 )
	BGFill:SetAlpha( 0.35, 0 )
	BGFill:SetAnchorsAndPosition( 1, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( BGFill )
	self.BGFill = BGFill
	
	local Fill = nil
	
	Fill = LUI.UIImage.new()
	Fill.id = "Fill"
	Fill:SetAnchorsAndPosition( 0, 1, 0, 0, 0, 0, 0, 0 )
	self:addElement( Fill )
	self.Fill = Fill
	
	local Frame = nil
	
	Frame = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 2,
		borderThicknessRight = _1080p * 2,
		borderThicknessTop = _1080p * 2,
		borderThicknessBottom = _1080p * 2
	} )
	Frame.id = "Frame"
	Frame:SetRGBFromTable( SWATCHES.HUD.background, 0 )
	Frame:SetAlpha( 0.6, 0 )
	Frame:SetBorderThicknessLeft( _1080p * 2, 0 )
	Frame:SetBorderThicknessRight( _1080p * 2, 0 )
	Frame:SetBorderThicknessTop( _1080p * 2, 0 )
	Frame:SetBorderThicknessBottom( _1080p * 2, 0 )
	self:addElement( Frame )
	self.Frame = Frame
	
	return self
end

MenuBuilder.registerType( "PlayerHealthbar", PlayerHealthbar )
LockTable( _M )
