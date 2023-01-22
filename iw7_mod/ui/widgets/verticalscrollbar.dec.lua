local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function VerticalScrollbar( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 16 * _1080p, 0, 400 * _1080p )
	self.id = "VerticalScrollbar"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local sliderArea = nil
	
	sliderArea = MenuBuilder.BuildRegisteredType( "VerticalScrollbarSliderArea", {
		controllerIndex = f1_local1
	} )
	sliderArea.id = "sliderArea"
	sliderArea:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 20, _1080p * -20 )
	self:addElement( sliderArea )
	self.sliderArea = sliderArea
	
	local startCap = nil
	
	startCap = MenuBuilder.BuildRegisteredType( "VerticalScrollbarStartCap", {
		controllerIndex = f1_local1
	} )
	startCap.id = "startCap"
	startCap:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 20 )
	self:addElement( startCap )
	self.startCap = startCap
	
	local endCap = nil
	
	endCap = MenuBuilder.BuildRegisteredType( "VerticalScrollbarEndCap", {
		controllerIndex = f1_local1
	} )
	endCap.id = "endCap"
	endCap:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -20, 0 )
	self:addElement( endCap )
	self.endCap = endCap
	
	return self
end

MenuBuilder.registerType( "VerticalScrollbar", VerticalScrollbar )
LockTable( _M )
