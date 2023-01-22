local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PS4VitaStickLayout( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 512 * _1080p, 0, 512 * _1080p )
	self.id = "PS4VitaStickLayout"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local ControllerImage = nil
	
	ControllerImage = LUI.UIImage.new()
	ControllerImage.id = "ControllerImage"
	ControllerImage:setImage( RegisterMaterial( "cont_vita" ), 0 )
	ControllerImage:SetUseAA( true )
	ControllerImage:SetBlendMode( BLEND_MODE.addWithAlpha )
	ControllerImage:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 603, _1080p * 25, _1080p * 537 )
	self:addElement( ControllerImage )
	self.ControllerImage = ControllerImage
	
	local Arrows = nil
	
	Arrows = LUI.UIImage.new()
	Arrows.id = "Arrows"
	Arrows:setImage( RegisterMaterial( "cont_lines_stick_vita" ), 0 )
	Arrows:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -15, _1080p * 621, _1080p * 283, _1080p * 411 )
	self:addElement( Arrows )
	self.Arrows = Arrows
	
	local LeftStickLayoutDirections = nil
	
	LeftStickLayoutDirections = MenuBuilder.BuildRegisteredType( "StickLayoutDirections", {
		controllerIndex = f1_local1
	} )
	LeftStickLayoutDirections.id = "LeftStickLayoutDirections"
	LeftStickLayoutDirections:SetDataSourceThroughElement( self, "left" )
	LeftStickLayoutDirections:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -221, _1080p * -20, _1080p * 285, _1080p * 535 )
	self:addElement( LeftStickLayoutDirections )
	self.LeftStickLayoutDirections = LeftStickLayoutDirections
	
	local RightStickLayoutDirections = nil
	
	RightStickLayoutDirections = MenuBuilder.BuildRegisteredType( "StickLayoutDirections", {
		controllerIndex = f1_local1
	} )
	RightStickLayoutDirections.id = "RightStickLayoutDirections"
	RightStickLayoutDirections:SetDataSourceThroughElement( self, "right" )
	RightStickLayoutDirections:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 618, _1080p * 819, _1080p * 285, _1080p * 535 )
	self:addElement( RightStickLayoutDirections )
	self.RightStickLayoutDirections = RightStickLayoutDirections
	
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "RightStickLayoutDirections",
		sequenceName = "ArrowsOnLeft",
		elementPath = "RightStickLayoutDirections"
	} )
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "LeftStickLayoutDirections",
		sequenceName = "ArrowsOnRight",
		elementPath = "LeftStickLayoutDirections"
	} )
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "LeftStickLayoutDirections",
		sequenceName = "HideStickButtonPromptsForVita",
		elementPath = "LeftStickLayoutDirections"
	} )
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "RightStickLayoutDirections",
		sequenceName = "HideStickButtonPromptsForVita",
		elementPath = "RightStickLayoutDirections"
	} )
	LeftStickLayoutDirections:SetDataSourceThroughElement( self, "left" )
	RightStickLayoutDirections:SetDataSourceThroughElement( self, "right" )
	return self
end

MenuBuilder.registerType( "PS4VitaStickLayout", PS4VitaStickLayout )
LockTable( _M )
