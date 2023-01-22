local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.BonusText )
	local f1_local0 = f1_arg0.BonusText
	f1_local0:SetShadowUOffset( -0 )
	f1_local0:SetShadowVOffset( -0 )
end

function LootItemCardMk2Bonus( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 400 * _1080p, 0, 25 * _1080p )
	self.id = "LootItemCardMk2Bonus"
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local Blur = nil
	
	Blur = LUI.UIBlur.new()
	Blur.id = "Blur"
	Blur:SetRGBFromInt( 12566463, 0 )
	Blur:SetBlurStrength( 2.75, 0 )
	self:addElement( Blur )
	self.Blur = Blur
	
	local Gradient = nil
	
	Gradient = LUI.UIImage.new()
	Gradient.id = "Gradient"
	Gradient:SetAlpha( 0.3, 0 )
	Gradient:setImage( RegisterMaterial( "wdg_gradient_dual" ), 0 )
	self:addElement( Gradient )
	self.Gradient = Gradient
	
	local BonusText = nil
	
	BonusText = LUI.UIStyledText.new()
	BonusText.id = "BonusText"
	BonusText:SetRGBFromTable( SWATCHES.Popups.highlight, 0 )
	BonusText:setText( Engine.Localize( "LUA_MENU_MP_MK2_BONUS" ), 0 )
	BonusText:SetFontSize( 20 * _1080p )
	BonusText:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	BonusText:SetAlignment( LUI.Alignment.Center )
	BonusText:SetStartupDelay( 1250 )
	BonusText:SetLineHoldTime( 400 )
	BonusText:SetAnimMoveTime( 300 )
	BonusText:SetEndDelay( 1000 )
	BonusText:SetCrossfadeTime( 500 )
	BonusText:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	BonusText:SetMaxVisibleLines( 1 )
	BonusText:SetShadowMinDistance( -0.2, 0 )
	BonusText:SetShadowMaxDistance( 0.2, 0 )
	BonusText:SetShadowRGBFromInt( 0, 0 )
	BonusText:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 10, _1080p * -10, _1080p * -10, _1080p * 10 )
	self:addElement( BonusText )
	self.BonusText = BonusText
	
	PostLoadFunc( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "LootItemCardMk2Bonus", LootItemCardMk2Bonus )
LockTable( _M )
