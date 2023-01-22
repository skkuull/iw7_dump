local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function GenericBoxWithBorders( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 100 * _1080p, 0, 100 * _1080p )
	self.id = "GenericBoxWithBorders"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Fill = nil
	
	Fill = LUI.UIImage.new()
	Fill.id = "Fill"
	Fill:SetUseAA( true )
	self:addElement( Fill )
	self.Fill = Fill
	
	local Stroke = nil
	
	Stroke = MenuBuilder.BuildRegisteredType( "GenericBorderFrame", {
		controllerIndex = f1_local1
	} )
	Stroke.id = "Stroke"
	Stroke.Left:SetRight( _1080p * 1, 0 )
	Stroke.Right:SetLeft( _1080p * -1, 0 )
	Stroke.Top:SetBottom( _1080p * 1, 0 )
	Stroke.Bottom:SetTop( _1080p * -1, 0 )
	Stroke:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( Stroke )
	self.Stroke = Stroke
	
	return self
end

MenuBuilder.registerType( "GenericBoxWithBorders", GenericBoxWithBorders )
LockTable( _M )
