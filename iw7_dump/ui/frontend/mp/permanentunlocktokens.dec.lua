local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0.StyledText:setText( ToUpperCase( Engine.Localize( "PRESTIGE_PERMANENT_UNLOCKS_TOKEN_COUNT", Prestige.GetPermanentUnlockTokenCount( f1_arg1 ) ) ) )
	f1_arg0:registerEventHandler( "update_token_count", function ( element, event )
		if event.tokenType == "classic" then
			f1_arg0.StyledText:setText( ToUpperCase( Engine.Localize( "PRESTIGE_CLASSIC_WEAPON_UNLOCKS_TOKEN_COUNT", Prestige.GetClassicWeaponUnlockTokenCount( f1_arg1 ) ) ) )
		else
			f1_arg0.StyledText:setText( ToUpperCase( Engine.Localize( "PRESTIGE_PERMANENT_UNLOCKS_TOKEN_COUNT", Prestige.GetPermanentUnlockTokenCount( f1_arg1 ) ) ) )
		end
	end )
end

function PermanentUnlockTokens( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 605 * _1080p, 0, 45 * _1080p )
	self.id = "PermanentUnlockTokens"
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local Blur = nil
	
	Blur = LUI.UIBlur.new()
	Blur.id = "Blur"
	Blur:SetRGBFromTable( SWATCHES.CAC.performanceHeader, 0 )
	Blur:SetBlurStrength( 1.5, 0 )
	self:addElement( Blur )
	self.Blur = Blur
	
	local StyledText = nil
	
	StyledText = LUI.UIStyledText.new()
	StyledText.id = "StyledText"
	StyledText:SetAlpha( 0.8, 0 )
	StyledText:setText( ToUpperCase( Engine.Localize( "PRESTIGE_PERMANENT_UNLOCKS_TOKEN_COUNT" ) ), 0 )
	StyledText:SetFontSize( 30 * _1080p )
	StyledText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	StyledText:SetAlignment( LUI.Alignment.Left )
	StyledText:SetStartupDelay( 1000 )
	StyledText:SetLineHoldTime( 500 )
	StyledText:SetAnimMoveTime( 250 )
	StyledText:SetEndDelay( 1000 )
	StyledText:SetCrossfadeTime( 500 )
	StyledText:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	StyledText:SetMaxVisibleLines( 1 )
	StyledText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 54, _1080p * 570, _1080p * 7.5, _1080p * 37.5 )
	self:addElement( StyledText )
	self.StyledText = StyledText
	
	local TopLine = nil
	
	TopLine = LUI.UIImage.new()
	TopLine.id = "TopLine"
	TopLine:SetAlpha( 0.4, 0 )
	TopLine:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 2 )
	self:addElement( TopLine )
	self.TopLine = TopLine
	
	local BottomLine = nil
	
	BottomLine = LUI.UIImage.new()
	BottomLine.id = "BottomLine"
	BottomLine:SetAlpha( 0.4, 0 )
	BottomLine:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -2, 0 )
	self:addElement( BottomLine )
	self.BottomLine = BottomLine
	
	local Image = nil
	
	Image = LUI.UIImage.new()
	Image.id = "Image"
	Image:setImage( RegisterMaterial( "icon_prestige_unlocktoken" ), 0 )
	Image:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -15, _1080p * 39, _1080p * -4.5, _1080p * 49.5 )
	self:addElement( Image )
	self.Image = Image
	
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "PermanentUnlockTokens", PermanentUnlockTokens )
LockTable( _M )
