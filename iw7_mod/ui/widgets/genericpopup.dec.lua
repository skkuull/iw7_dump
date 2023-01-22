local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function GenericPopup( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 431 * _1080p, 0, 253 * _1080p )
	self.id = "GenericPopup"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromTable( SWATCHES.genericMenu.popupBackground, 0 )
	Background:SetAlpha( 0.85, 0 )
	Background:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -960, _1080p * 960, _1080p * -540, _1080p * 540 )
	self:addElement( Background )
	self.Background = Background
	
	local Box = nil
	
	Box = LUI.UIImage.new()
	Box.id = "Box"
	Box:SetRGBFromTable( SWATCHES.genericMenu.background, 0 )
	self:addElement( Box )
	self.Box = Box
	
	local Border = nil
	
	Border = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	} )
	Border.id = "Border"
	Border:SetRGBFromTable( SWATCHES.genericMenu.border, 0 )
	self:addElement( Border )
	self.Border = Border
	
	return self
end

MenuBuilder.registerType( "GenericPopup", GenericPopup )
LockTable( _M )
