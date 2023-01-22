local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function RigPackageItemDetails( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 800 * _1080p, 0, 143 * _1080p )
	self.id = "RigPackageItemDetails"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Title = nil
	
	Title = LUI.UIStyledText.new()
	Title.id = "Title"
	Title:SetRGBFromTable( SWATCHES.CAC.subPopupText, 0 )
	Title:setText( ToUpperCase( "SUPER" ), 0 )
	Title:SetFontSize( 24 * _1080p )
	Title:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Title:SetAlignment( LUI.Alignment.Left )
	Title:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 250.5, _1080p * -22.5, 0, _1080p * 24 )
	self:addElement( Title )
	self.Title = Title
	
	local Name = nil
	
	Name = LUI.UIStyledText.new()
	Name.id = "Name"
	Name:SetRGBFromTable( SWATCHES.CAC.abilityText, 0 )
	Name:setText( ToUpperCase( "COMBAT FOCUS" ), 0 )
	Name:SetFontSize( 28 * _1080p )
	Name:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Name:SetAlignment( LUI.Alignment.Left )
	Name:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 250.5, _1080p * -22.5, _1080p * 24.5, _1080p * 52.5 )
	self:addElement( Name )
	self.Name = Name
	
	local Desc = nil
	
	Desc = LUI.UIStyledText.new()
	Desc.id = "Desc"
	Desc:setText( Engine.Localize( "MENU_NEW" ), 0 )
	Desc:SetFontSize( 20 * _1080p )
	Desc:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Desc:SetAlignment( LUI.Alignment.Left )
	Desc:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 250.5, _1080p * -22.5, _1080p * 54, _1080p * 74 )
	self:addElement( Desc )
	self.Desc = Desc
	
	local SuperBacker = nil
	
	SuperBacker = LUI.UIImage.new()
	SuperBacker.id = "SuperBacker"
	SuperBacker:SetRGBFromTable( SWATCHES.CAC.attachShade, 0 )
	SuperBacker:SetAlpha( 0.4, 0 )
	SuperBacker:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 230, 0, _1080p * 143 )
	self:addElement( SuperBacker )
	self.SuperBacker = SuperBacker
	
	local SuperBackerGradient = nil
	
	SuperBackerGradient = LUI.UIImage.new()
	SuperBackerGradient.id = "SuperBackerGradient"
	SuperBackerGradient:SetRGBFromInt( 0, 0 )
	SuperBackerGradient:SetAlpha( 0.4, 0 )
	SuperBackerGradient:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
	SuperBackerGradient:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 230, 0, _1080p * 143 )
	self:addElement( SuperBackerGradient )
	self.SuperBackerGradient = SuperBackerGradient
	
	local SuperTab = nil
	
	SuperTab = LUI.UIImage.new()
	SuperTab.id = "SuperTab"
	SuperTab:SetRGBFromTable( SWATCHES.genericButton.listButtonDefault, 0 )
	SuperTab:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 15, 0, _1080p * 3 )
	self:addElement( SuperTab )
	self.SuperTab = SuperTab
	
	local Image = nil
	
	Image = LUI.UIImage.new()
	Image.id = "Image"
	Image:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 43.5, _1080p * 186.5, 0, _1080p * 143 )
	self:addElement( Image )
	self.Image = Image
	
	return self
end

MenuBuilder.registerType( "RigPackageItemDetails", RigPackageItemDetails )
LockTable( _M )
