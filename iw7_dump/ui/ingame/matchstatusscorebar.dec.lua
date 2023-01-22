local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function MatchStatusScoreBar( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 100 * _1080p, 0, 8 * _1080p )
	self.id = "MatchStatusScoreBar"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 0, 0 )
	Background:SetAlpha( 0.6, 0 )
	Background:SetUseAA( true )
	self:addElement( Background )
	self.Background = Background
	
	local Fill = nil
	
	Fill = LUI.UIImage.new()
	Fill.id = "Fill"
	Fill:SetZRotation( 180, 0 )
	Fill:setImage( RegisterMaterial( "widg_gradient_left_to_right_opaque" ), 0 )
	Fill:SetUseAA( true )
	Fill:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 2, _1080p * -2, 0, _1080p * -1 )
	self:addElement( Fill )
	self.Fill = Fill
	
	local Frame = nil
	
	Frame = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 2,
		borderThicknessRight = _1080p * 2,
		borderThicknessTop = _1080p * 0,
		borderThicknessBottom = _1080p * 1
	} )
	Frame.id = "Frame"
	Frame:SetBorderThicknessLeft( _1080p * 2, 0 )
	Frame:SetBorderThicknessRight( _1080p * 2, 0 )
	Frame:SetBorderThicknessTop( _1080p * 0, 0 )
	self:addElement( Frame )
	self.Frame = Frame
	
	return self
end

MenuBuilder.registerType( "MatchStatusScoreBar", MatchStatusScoreBar )
LockTable( _M )
