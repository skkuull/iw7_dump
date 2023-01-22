local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PermanentUnlocksDescription( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 700 * _1080p, 0, 550 * _1080p )
	self.id = "PermanentUnlocksDescription"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Blur = nil
	
	Blur = LUI.UIBlur.new()
	Blur.id = "Blur"
	Blur:SetRGBFromInt( 12566463, 0 )
	Blur:SetUseAA( true )
	Blur:SetBlurStrength( 2.75, 0 )
	Blur:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 700, _1080p * -700, _1080p * -245, _1080p * 43 )
	self:addElement( Blur )
	self.Blur = Blur
	
	local DescriptionBackground = nil
	
	DescriptionBackground = LUI.UIImage.new()
	DescriptionBackground.id = "DescriptionBackground"
	DescriptionBackground:SetRGBFromInt( 0, 0 )
	DescriptionBackground:SetAlpha( 0.5, 0 )
	DescriptionBackground:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 700, _1080p * 318, _1080p * 550 )
	self:addElement( DescriptionBackground )
	self.DescriptionBackground = DescriptionBackground
	
	local TitleBackground = nil
	
	TitleBackground = LUI.UIImage.new()
	TitleBackground.id = "TitleBackground"
	TitleBackground:SetRGBFromInt( 0, 0 )
	TitleBackground:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 700, 0, _1080p * 30 )
	self:addElement( TitleBackground )
	self.TitleBackground = TitleBackground
	
	local Title = nil
	
	Title = LUI.UIText.new()
	Title.id = "Title"
	Title:setText( ToUpperCase( Engine.Localize( "PRESTIGE_PERMANENT_UNLOCKS" ) ), 0 )
	Title:SetFontSize( 28 * _1080p )
	Title:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Title:SetAlignment( LUI.Alignment.Left )
	Title:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 14, _1080p * 688, _1080p * 2, _1080p * 30 )
	self:addElement( Title )
	self.Title = Title
	
	local Icon = nil
	
	Icon = LUI.UIImage.new()
	Icon.id = "Icon"
	Icon:setImage( RegisterMaterial( "icon_prestige_unlocktoken" ), 0 )
	Icon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 219.5, _1080p * 475.5, _1080p * 47, _1080p * 303 )
	self:addElement( Icon )
	self.Icon = Icon
	
	local StyledDescription = nil
	
	StyledDescription = LUI.UIStyledText.new()
	StyledDescription.id = "StyledDescription"
	StyledDescription:setText( Engine.Localize( "PRESTIGE_PERMANENT_UNLOCKS_DESC" ), 0 )
	StyledDescription:SetFontSize( 24 * _1080p )
	StyledDescription:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	StyledDescription:SetAlignment( LUI.Alignment.Left )
	StyledDescription:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 14, _1080p * 688, _1080p * 328, _1080p * 352 )
	self:addElement( StyledDescription )
	self.StyledDescription = StyledDescription
	
	local Image = nil
	
	Image = LUI.UIImage.new()
	Image.id = "Image"
	Image:SetAlpha( 0.5, 0 )
	Image:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 700, _1080p * 318, _1080p * 321 )
	self:addElement( Image )
	self.Image = Image
	
	return self
end

MenuBuilder.registerType( "PermanentUnlocksDescription", PermanentUnlocksDescription )
LockTable( _M )
