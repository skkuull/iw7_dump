local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function GenericItemInfoBG( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 950 * _1080p, 0, 140 * _1080p )
	self.id = "GenericItemInfoBG"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local f1_local3 = nil
	if Engine.InFrontend() then
		f1_local3 = LUI.UIImage.new()
		f1_local3.id = "DropShadow"
		f1_local3:SetRGBFromInt( 0, 0 )
		f1_local3:SetAlpha( 0.3, 0 )
		f1_local3:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
		f1_local3:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, 0, _1080p * 4 )
		self:addElement( f1_local3 )
		self.DropShadow = f1_local3
	end
	local f1_local4 = nil
	if Engine.InFrontend() then
		f1_local4 = LUI.UIBlur.new()
		f1_local4.id = "Blur"
		f1_local4:SetRGBFromInt( 6710886, 0 )
		f1_local4:SetBlurStrength( 2.75, 0 )
		self:addElement( f1_local4 )
		self.Blur = f1_local4
	end
	local WhiteOverlay = nil
	
	WhiteOverlay = LUI.UIImage.new()
	WhiteOverlay.id = "WhiteOverlay"
	WhiteOverlay:SetAlpha( 0.5, 0 )
	WhiteOverlay:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 6, 0, _1080p * 66, 0 )
	self:addElement( WhiteOverlay )
	self.WhiteOverlay = WhiteOverlay
	
	local DarkOverlay = nil
	
	DarkOverlay = LUI.UIImage.new()
	DarkOverlay.id = "DarkOverlay"
	DarkOverlay:SetRGBFromInt( 0, 0 )
	DarkOverlay:SetAlpha( 0.6, 0 )
	DarkOverlay:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 6, 0, 0, _1080p * 66 )
	self:addElement( DarkOverlay )
	self.DarkOverlay = DarkOverlay
	
	local DarkTab = nil
	
	DarkTab = LUI.UIImage.new()
	DarkTab.id = "DarkTab"
	DarkTab:SetRGBFromInt( 0, 0 )
	DarkTab:SetAlpha( 0.6, 0 )
	DarkTab:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 6, 0, 0 )
	self:addElement( DarkTab )
	self.DarkTab = DarkTab
	
	local Node = nil
	
	Node = LUI.UIImage.new()
	Node.id = "Node"
	Node:SetRGBFromInt( 14277081, 0 )
	Node:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 15, 0, _1080p * 4 )
	self:addElement( Node )
	self.Node = Node
	
	return self
end

MenuBuilder.registerType( "GenericItemInfoBG", GenericItemInfoBG )
LockTable( _M )
