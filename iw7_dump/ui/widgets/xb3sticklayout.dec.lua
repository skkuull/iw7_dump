local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function XB3StickLayout( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 512 * _1080p, 0, 512 * _1080p )
	self.id = "XB3StickLayout"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local ControllerImage = nil
	
	ControllerImage = LUI.UIImage.new()
	ControllerImage.id = "ControllerImage"
	ControllerImage:setImage( RegisterMaterial( "cont" ), 0 )
	ControllerImage:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 512, _1080p * 25.84, _1080p * 537.84 )
	self:addElement( ControllerImage )
	self.ControllerImage = ControllerImage
	
	local Arrows = nil
	
	Arrows = LUI.UIImage.new()
	Arrows.id = "Arrows"
	Arrows:SetZRotation( -5, 0 )
	Arrows:setImage( RegisterMaterial( "cont_lines_stick" ), 0 )
	Arrows:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -33, _1080p * 479, _1080p * 281.84, _1080p * 409.84 )
	self:addElement( Arrows )
	self.Arrows = Arrows
	
	local LeftStickLayoutDirections = nil
	
	LeftStickLayoutDirections = MenuBuilder.BuildRegisteredType( "StickLayoutDirections", {
		controllerIndex = f1_local1
	} )
	LeftStickLayoutDirections.id = "LeftStickLayoutDirections"
	LeftStickLayoutDirections:SetDataSourceThroughElement( self, "left" )
	LeftStickLayoutDirections:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -247, _1080p * -47, _1080p * 171, _1080p * 421 )
	self:addElement( LeftStickLayoutDirections )
	self.LeftStickLayoutDirections = LeftStickLayoutDirections
	
	local RightStickLayoutDirections = nil
	
	RightStickLayoutDirections = MenuBuilder.BuildRegisteredType( "StickLayoutDirections", {
		controllerIndex = f1_local1
	} )
	RightStickLayoutDirections.id = "RightStickLayoutDirections"
	RightStickLayoutDirections:SetDataSourceThroughElement( self, "right" )
	RightStickLayoutDirections:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 532, _1080p * 732, _1080p * 281.84, _1080p * 531.84 )
	self:addElement( RightStickLayoutDirections )
	self.RightStickLayoutDirections = RightStickLayoutDirections
	
	LeftStickLayoutDirections:SetDataSourceThroughElement( self, "left" )
	RightStickLayoutDirections:SetDataSourceThroughElement( self, "right" )
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "LeftStickLayoutDirections",
		sequenceName = "ArrowsOnRight",
		elementPath = "LeftStickLayoutDirections"
	} )
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "RightStickLayoutDirections",
		sequenceName = "ArrowsOnLeft",
		elementPath = "RightStickLayoutDirections"
	} )
	return self
end

MenuBuilder.registerType( "XB3StickLayout", XB3StickLayout )
LockTable( _M )
