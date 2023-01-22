local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function GenericBorderWithNodes( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 50 * _1080p, 0, 50 * _1080p )
	self.id = "GenericBorderWithNodes"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Border = nil
	
	Border = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	} )
	Border.id = "Border"
	Border:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 1, _1080p * -1, _1080p * 1, _1080p * -1 )
	self:addElement( Border )
	self.Border = Border
	
	local CornerNodes = nil
	
	CornerNodes = MenuBuilder.BuildRegisteredType( "GenericFrameCornerNodes", {
		controllerIndex = f1_local1
	} )
	CornerNodes.id = "CornerNodes"
	CornerNodes:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( CornerNodes )
	self.CornerNodes = CornerNodes
	
	return self
end

MenuBuilder.registerType( "GenericBorderWithNodes", GenericBorderWithNodes )
LockTable( _M )
