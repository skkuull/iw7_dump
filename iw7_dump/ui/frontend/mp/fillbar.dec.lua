local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function fillbar( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 60 * _1080p, 0, 36 * _1080p )
	self.id = "fillbar"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local left = nil
	
	left = LUI.UIImage.new()
	left.id = "left"
	left:setImage( RegisterMaterial( "challenges_progress_hori_left" ), 0 )
	left:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 24, 0, 0 )
	self:addElement( left )
	self.left = left
	
	local center = nil
	
	center = LUI.UIImage.new()
	center.id = "center"
	center:setImage( RegisterMaterial( "challenges_progress_hori_center" ), 0 )
	center:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 24, _1080p * -24, 0, _1080p * 36 )
	self:addElement( center )
	self.center = center
	
	local right = nil
	
	right = LUI.UIImage.new()
	right.id = "right"
	right:setImage( RegisterMaterial( "challenges_progress_hori_right" ), 0 )
	right:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -24, 0, 0, 0 )
	self:addElement( right )
	self.right = right
	
	return self
end

MenuBuilder.registerType( "fillbar", fillbar )
LockTable( _M )
