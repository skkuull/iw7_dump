local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function AARGraphicBacker( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 93 * _1080p, 0, 166 * _1080p )
	self.id = "AARGraphicBacker"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local backer = nil
	
	backer = LUI.UIImage.new()
	backer.id = "backer"
	backer:setImage( RegisterMaterial( "aar_graphic_back_left" ), 0 )
	backer:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 32, 0, _1080p * 168 )
	self:addElement( backer )
	self.backer = backer
	
	local backerCopy0 = nil
	
	backerCopy0 = LUI.UIImage.new()
	backerCopy0.id = "backerCopy0"
	backerCopy0:setImage( RegisterMaterial( "aar_graphic_back_center" ), 0 )
	backerCopy0:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 32, _1080p * -29, 0, _1080p * 168 )
	self:addElement( backerCopy0 )
	self.backerCopy0 = backerCopy0
	
	local backerCopy1 = nil
	
	backerCopy1 = LUI.UIImage.new()
	backerCopy1.id = "backerCopy1"
	backerCopy1:setImage( RegisterMaterial( "aar_graphic_back_right" ), 0 )
	backerCopy1:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -29, _1080p * 3, 0, _1080p * 168 )
	self:addElement( backerCopy1 )
	self.backerCopy1 = backerCopy1
	
	return self
end

MenuBuilder.registerType( "AARGraphicBacker", AARGraphicBacker )
LockTable( _M )
