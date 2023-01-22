local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function GenericFillBar( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 200 * _1080p, 0, 30 * _1080p )
	self.id = "GenericFillBar"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Fill = nil
	
	Fill = LUI.UIImage.new()
	Fill.id = "Fill"
	Fill:SetRGBFromInt( 8553090, 0 )
	Fill:SetAnchorsAndPosition( 0, 1, 0, 0, 0, 0, 0, 0 )
	self:addElement( Fill )
	self.Fill = Fill
	
	local FillBorder = nil
	
	FillBorder = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 2,
		borderThicknessRight = _1080p * 2,
		borderThicknessTop = _1080p * 2,
		borderThicknessBottom = _1080p * 2
	} )
	FillBorder.id = "FillBorder"
	FillBorder:SetAlpha( 0.5, 0 )
	FillBorder:SetBorderThicknessLeft( _1080p * 2, 0 )
	FillBorder:SetBorderThicknessRight( _1080p * 2, 0 )
	FillBorder:SetBorderThicknessTop( _1080p * 2, 0 )
	FillBorder:SetBorderThicknessBottom( _1080p * 2, 0 )
	FillBorder:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -1, _1080p * 1, _1080p * -1, _1080p * 1 )
	self:addElement( FillBorder )
	self.FillBorder = FillBorder
	
	return self
end

MenuBuilder.registerType( "GenericFillBar", GenericFillBar )
LockTable( _M )
