local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function RigCustomizationButton( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 640 * _1080p, 0, 111 * _1080p )
	self.id = "RigCustomizationButton"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local f1_local3 = nil
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() and CONDITIONS.IsMultiplayer( self ) then
		f1_local3 = LUI.UIBlur.new()
		f1_local3.id = "BlurGradTopMP"
		f1_local3:SetRGBFromInt( 4210752, 0 )
		f1_local3:setImage( RegisterMaterial( "widg_gradient_left_to_right" ), 0 )
		f1_local3:SetBlurStrength( 2.75, 0 )
		f1_local3:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 640, _1080p * 55, _1080p * -111 )
		self:addElement( f1_local3 )
		self.BlurGradTopMP = f1_local3
	end
	local DesctiptionAnchor = nil
	
	DesctiptionAnchor = LUI.UIImage.new()
	DesctiptionAnchor.id = "DesctiptionAnchor"
	DesctiptionAnchor:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 4, _1080p * 62, _1080p * 91 )
	self:addElement( DesctiptionAnchor )
	self.DesctiptionAnchor = DesctiptionAnchor
	
	local DescriptionText = nil
	
	DescriptionText = LUI.UIText.new()
	DescriptionText.id = "DescriptionText"
	DescriptionText:setText( "agahahaha", 0 )
	DescriptionText:SetFontSize( 24 * _1080p )
	DescriptionText:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	DescriptionText:SetAlignment( LUI.Alignment.Left )
	DescriptionText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 11, _1080p * 593, _1080p * 62.5, _1080p * 86.5 )
	self:addElement( DescriptionText )
	self.DescriptionText = DescriptionText
	
	local ItemName = nil
	
	ItemName = LUI.UIStyledText.new()
	ItemName.id = "ItemName"
	ItemName:setText( Engine.Localize( "MENU_NEW" ), 0 )
	ItemName:SetFontSize( 36 * _1080p )
	ItemName:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	ItemName:SetAlignment( LUI.Alignment.Left )
	ItemName:SetDecodeLetterLength( 25 )
	ItemName:SetDecodeMaxRandChars( 3 )
	ItemName:SetDecodeUpdatesPerLetter( 4 )
	ItemName:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 12, _1080p * 436, _1080p * 9, _1080p * 45 )
	self:addElement( ItemName )
	self.ItemName = ItemName
	
	return self
end

MenuBuilder.registerType( "RigCustomizationButton", RigCustomizationButton )
LockTable( _M )
