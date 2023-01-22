local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function GenericReticleCrosshairs( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 32 * _1080p, 0, 32 * _1080p )
	self.id = "GenericReticleCrosshairs"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local rightLine = nil
	
	rightLine = LUI.UIImage.new()
	rightLine.id = "rightLine"
	rightLine:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -10, 0, _1080p * -0.5, _1080p * 0.5 )
	self:addElement( rightLine )
	self.rightLine = rightLine
	
	local leftLine = nil
	
	leftLine = LUI.UIImage.new()
	leftLine.id = "leftLine"
	leftLine:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, 0, _1080p * 10, _1080p * -0.5, _1080p * 0.5 )
	self:addElement( leftLine )
	self.leftLine = leftLine
	
	local bottomLine = nil
	
	bottomLine = LUI.UIImage.new()
	bottomLine.id = "bottomLine"
	bottomLine:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -0.5, _1080p * 0.5, _1080p * -10, 0 )
	self:addElement( bottomLine )
	self.bottomLine = bottomLine
	
	local topLine = nil
	
	topLine = LUI.UIImage.new()
	topLine.id = "topLine"
	topLine:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -0.5, _1080p * 0.5, 0, _1080p * 10 )
	self:addElement( topLine )
	self.topLine = topLine
	
	return self
end

MenuBuilder.registerType( "GenericReticleCrosshairs", GenericReticleCrosshairs )
LockTable( _M )
