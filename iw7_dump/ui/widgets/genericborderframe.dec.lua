local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function GenericBorderFrame( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 16 * _1080p, 0, 16 * _1080p )
	self.id = "GenericBorderFrame"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Left = nil
	
	Left = LUI.UIImage.new()
	Left.id = "Left"
	Left:setImage( RegisterMaterial( "ui_default_white" ), 0 )
	Left:SetUseAA( true )
	Left:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 1, _1080p * 1, _1080p * -1 )
	self:addElement( Left )
	self.Left = Left
	
	local Right = nil
	
	Right = LUI.UIImage.new()
	Right.id = "Right"
	Right:setImage( RegisterMaterial( "ui_default_white" ), 0 )
	Right:SetUseAA( true )
	Right:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -1, 0, _1080p * 1, _1080p * -1 )
	self:addElement( Right )
	self.Right = Right
	
	local Top = nil
	
	Top = LUI.UIImage.new()
	Top.id = "Top"
	Top:setImage( RegisterMaterial( "ui_default_white" ), 0 )
	Top:SetUseAA( true )
	Top:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 1 )
	self:addElement( Top )
	self.Top = Top
	
	local Bottom = nil
	
	Bottom = LUI.UIImage.new()
	Bottom.id = "Bottom"
	Bottom:setImage( RegisterMaterial( "ui_default_white" ), 0 )
	Bottom:SetUseAA( true )
	Bottom:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -1, 0 )
	self:addElement( Bottom )
	self.Bottom = Bottom
	
	return self
end

MenuBuilder.registerType( "GenericBorderFrame", GenericBorderFrame )
LockTable( _M )
