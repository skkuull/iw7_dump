local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = Cac.GetLootQualityColor( f1_arg1.quality )
	f1_arg0.SalvageAmount:setText( "+" .. tostring( f1_arg1.uiamount ), 0 )
	f1_arg0.Sparks:SetRGBFromInt( f1_local0 )
	local f1_local1 = f1_arg0:Wait( f1_arg2 + 200 )
	f1_local1.onComplete = function ()
		f1_arg0.Sparks:SetAlpha( 1 )
		f1_arg0.Sparks:SetScale( -1 )
		f1_arg0.Sparks:SetAlpha( 0, 300, LUI.EASING.outQuadratic )
		f1_arg0.Sparks:SetScale( -0.25, 300, LUI.EASING.outQuadratic )
	end
	
end

f0_local1 = function ( f3_arg0, f3_arg1, f3_arg2 )
	f3_arg0.SetUpBonus = f0_local0
	f3_arg0.SalvageText:SetShadowUOffset( -0 )
	f3_arg0.SalvageText:SetShadowVOffset( -0 )
	f3_arg0.SalvageAmount:SetShadowUOffset( -0 )
	f3_arg0.SalvageAmount:SetShadowVOffset( -0 )
	if IsLanguageOversizedFont() then
		f3_arg0.SalvageText:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 36, _1080p * 58 )
	end
end

function BonusSalvage( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 300 * _1080p, 0, 300 * _1080p )
	self.id = "BonusSalvage"
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local Frame = nil
	
	Frame = LUI.UIImage.new()
	Frame.id = "Frame"
	Frame:setImage( RegisterMaterial( "loot_bonus_salvage_frame" ), 0 )
	Frame:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -164, _1080p * 192, _1080p * -270, _1080p * 270 )
	self:addElement( Frame )
	self.Frame = Frame
	
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:setImage( RegisterMaterial( "loot_bonus_salvage_bg" ), 0 )
	Background:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -166, _1080p * 166, _1080p * -140, _1080p * 140 )
	self:addElement( Background )
	self.Background = Background
	
	local Sparks = nil
	
	Sparks = LUI.UIImage.new()
	Sparks.id = "Sparks"
	Sparks:SetAlpha( 0, 0 )
	Sparks:SetScale( -0.5, 0 )
	Sparks:setImage( RegisterMaterial( "loot_item_card_sparks" ), 0 )
	Sparks:SetUseAA( true )
	Sparks:SetBlendMode( BLEND_MODE.addWithAlpha )
	Sparks:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -512, _1080p * 512, _1080p * -520, _1080p * 504 )
	self:addElement( Sparks )
	self.Sparks = Sparks
	
	local Flare = nil
	
	Flare = MenuBuilder.BuildRegisteredType( "LootItemCardFlare", {
		controllerIndex = f4_local1
	} )
	Flare.id = "Flare"
	Flare:SetAlpha( 0.5, 0 )
	Flare:SetScale( -0.5, 0 )
	Flare:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -256, _1080p * 256, _1080p * -266, _1080p * 246 )
	self:addElement( Flare )
	self.Flare = Flare
	
	local SalvageAmount = nil
	
	SalvageAmount = LUI.UIStyledText.new()
	SalvageAmount.id = "SalvageAmount"
	SalvageAmount:setText( "", 0 )
	SalvageAmount:SetFontSize( 64 * _1080p )
	SalvageAmount:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	SalvageAmount:SetAlignment( LUI.Alignment.Center )
	SalvageAmount:SetShadowMinDistance( -0.01, 0 )
	SalvageAmount:SetShadowMaxDistance( 0.01, 0 )
	SalvageAmount:SetShadowRGBFromInt( 0, 0 )
	SalvageAmount:SetDecodeLetterLength( 25 )
	SalvageAmount:SetDecodeMaxRandChars( 3 )
	SalvageAmount:SetDecodeUpdatesPerLetter( 4 )
	SalvageAmount:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -94, _1080p * -30 )
	self:addElement( SalvageAmount )
	self.SalvageAmount = SalvageAmount
	
	local SalvageIcon = nil
	
	SalvageIcon = LUI.UIImage.new()
	SalvageIcon.id = "SalvageIcon"
	SalvageIcon:setImage( RegisterMaterial( "currency_parts_icon_large" ), 0 )
	SalvageIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 86, _1080p * 214, _1080p * 76, _1080p * 204 )
	self:addElement( SalvageIcon )
	self.SalvageIcon = SalvageIcon
	
	local SalvageText = nil
	
	SalvageText = LUI.UIStyledText.new()
	SalvageText.id = "SalvageText"
	SalvageText:setText( ToUpperCase( Engine.Localize( "PATCH_MENU_SALVAGE_BONUS" ) ), 0 )
	SalvageText:SetFontSize( 22 * _1080p )
	SalvageText:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	SalvageText:SetAlignment( LUI.Alignment.Center )
	SalvageText:SetShadowMinDistance( -0.01, 0 )
	SalvageText:SetShadowMaxDistance( 0.01, 0 )
	SalvageText:SetShadowRGBFromInt( 0, 0 )
	SalvageText:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 36, _1080p * 58 )
	self:addElement( SalvageText )
	self.SalvageText = SalvageText
	
	f0_local1( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "BonusSalvage", BonusSalvage )
LockTable( _M )
