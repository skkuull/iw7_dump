local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function FramedRigItem( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 126 * _1080p, 0, 92 * _1080p )
	self.id = "FramedRigItem"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Backer = nil
	
	Backer = LUI.UIImage.new()
	Backer.id = "Backer"
	Backer:SetRGBFromInt( 0, 0 )
	Backer:SetAlpha( 0.5, 0 )
	Backer:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 126, 0, _1080p * 93 )
	self:addElement( Backer )
	self.Backer = Backer
	
	local Image0 = nil
	
	Image0 = LUI.UIImage.new()
	Image0.id = "Image0"
	Image0:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 22 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local GenericBorderFrame0 = nil
	
	GenericBorderFrame0 = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	} )
	GenericBorderFrame0.id = "GenericBorderFrame0"
	GenericBorderFrame0:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -72, 0 )
	self:addElement( GenericBorderFrame0 )
	self.GenericBorderFrame0 = GenericBorderFrame0
	
	local Label0 = nil
	
	Label0 = LUI.UIText.new()
	Label0.id = "Label0"
	Label0:SetRGBFromInt( 0, 0 )
	Label0:setText( Engine.Localize( "MENU_NEW" ), 0 )
	Label0:SetFontSize( 19 * _1080p )
	Label0:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	Label0:SetAlignment( LUI.Alignment.Center )
	Label0:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 1.5, _1080p * 20.5 )
	self:addElement( Label0 )
	self.Label0 = Label0
	
	local Image1 = nil
	
	Image1 = LUI.UIImage.new()
	Image1.id = "Image1"
	Image1:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 30, _1080p * -30, _1080p * 38, _1080p * -17 )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	return self
end

MenuBuilder.registerType( "FramedRigItem", FramedRigItem )
LockTable( _M )
