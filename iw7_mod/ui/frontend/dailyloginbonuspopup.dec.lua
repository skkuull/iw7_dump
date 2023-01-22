local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg2 )
	assert( f1_arg2.item0Count )
	assert( f1_arg2.item1Count )
	assert( f1_arg2.item2Count )
	assert( f1_arg2.item3Count )
	assert( f1_arg2.item0Image )
	assert( f1_arg2.item1Image )
	assert( f1_arg2.item2Image )
	assert( f1_arg2.item3Image )
	f1_arg0.Item0:setText( f1_arg2.item0Count )
	f1_arg0.Item1:setText( f1_arg2.item1Count )
	f1_arg0.Item2:setText( f1_arg2.item2Count )
	f1_arg0.Item3:setText( f1_arg2.item3Count )
	if f1_arg2.item0Image ~= "" then
		if f1_arg2.item0ImageIsWide then
			f1_arg0.Item0IconWide:setImage( RegisterMaterial( f1_arg2.item0Image ), 0 )
			ACTIONS.AnimateSequence( f1_arg0, "Item0_Wide" )
		else
			f1_arg0.Item0Icon:setImage( RegisterMaterial( f1_arg2.item0Image ), 0 )
		end
	end
	if f1_arg2.item1Image ~= "" then
		if f1_arg2.item1ImageIsWide then
			f1_arg0.Item1IconWide:setImage( RegisterMaterial( f1_arg2.item1Image ), 0 )
			ACTIONS.AnimateSequence( f1_arg0, "Item1_Wide" )
		else
			f1_arg0.Item1Icon:setImage( RegisterMaterial( f1_arg2.item1Image ), 0 )
		end
	end
	if f1_arg2.item2Image ~= "" then
		if f1_arg2.item2ImageIsWide then
			f1_arg0.Item2IconWide:setImage( RegisterMaterial( f1_arg2.item2Image ), 0 )
			ACTIONS.AnimateSequence( f1_arg0, "Item2_Wide" )
		else
			f1_arg0.Item2Icon:setImage( RegisterMaterial( f1_arg2.item2Image ), 0 )
		end
	end
	if f1_arg2.item3Image ~= "" then
		if f1_arg2.item3ImageIsWide then
			f1_arg0.Item3IconWide:setImage( RegisterMaterial( f1_arg2.item3Image ), 0 )
			ACTIONS.AnimateSequence( f1_arg0, "Item3_Wide" )
		else
			f1_arg0.Item3Icon:setImage( RegisterMaterial( f1_arg2.item3Image ), 0 )
		end
	end
	if f1_arg2.item0Count <= 0 then
		ACTIONS.AnimateSequence( f1_arg0, "Item0_Off" )
	end
	if f1_arg2.item1Count <= 0 then
		ACTIONS.AnimateSequence( f1_arg0, "Item1_Off" )
	end
	if f1_arg2.isVIP > 0 then
		if f1_arg2.item2Count <= 0 then
			ACTIONS.AnimateSequence( f1_arg0, "Item2_Off" )
		end
		if f1_arg2.item3Count <= 0 then
			ACTIONS.AnimateSequence( f1_arg0, "Item3_Off" )
		end
	else
		ACTIONS.AnimateSequence( f1_arg0, "NoSeasonPass" )
	end
	Engine.PlaySound( "ui_iw7_daily_popup" )
end

function DailyLoginBonusPopup( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "DailyLoginBonusPopup"
	self._animationSets = {}
	self._sequences = {}
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	self:playSound( "menu_open" )
	local f2_local2 = self
	local DarkenBackground = nil
	
	DarkenBackground = LUI.UIImage.new()
	DarkenBackground.id = "DarkenBackground"
	DarkenBackground:SetRGBFromInt( 0, 0 )
	DarkenBackground:SetAlpha( 0.85, 0 )
	self:addElement( DarkenBackground )
	self.DarkenBackground = DarkenBackground
	
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:setImage( RegisterMaterial( "image_motd_mp_generic2" ), 0 )
	Background:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 316, _1080p * -316, _1080p * 103, _1080p * -177 )
	self:addElement( Background )
	self.Background = Background
	
	local BodyBackground = nil
	
	BodyBackground = LUI.UIImage.new()
	BodyBackground.id = "BodyBackground"
	BodyBackground:SetRGBFromTable( SWATCHES.HUD.background, 0 )
	BodyBackground:SetAlpha( 0.85, 0 )
	BodyBackground:setImage( RegisterMaterial( "widg_gradient_left_to_right" ), 0 )
	BodyBackground:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 316, _1080p * -316, _1080p * 103, _1080p * -177 )
	self:addElement( BodyBackground )
	self.BodyBackground = BodyBackground
	
	local Item0Backer = nil
	
	Item0Backer = LUI.UIImage.new()
	Item0Backer.id = "Item0Backer"
	Item0Backer:setImage( RegisterMaterial( "daily_popup_standard" ), 0 )
	Item0Backer:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 439, _1080p * 695, _1080p * 350.2, _1080p * 606.2 )
	self:addElement( Item0Backer )
	self.Item0Backer = Item0Backer
	
	local Item0 = nil
	
	Item0 = LUI.UIText.new()
	Item0.id = "Item0"
	Item0:setText( "+1", 0 )
	Item0:SetFontSize( 28 * _1080p )
	Item0:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	Item0:SetAlignment( LUI.Alignment.Center )
	Item0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 517.5, _1080p * 616.5, _1080p * 553.01, _1080p * 581.01 )
	self:addElement( Item0 )
	self.Item0 = Item0
	
	local Item0Icon = nil
	
	Item0Icon = LUI.UIImage.new()
	Item0Icon.id = "Item0Icon"
	Item0Icon:setImage( RegisterMaterial( "currency_parts_icon_large" ), 0 )
	Item0Icon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 517, _1080p * 617, _1080p * 428.2, _1080p * 528.2 )
	self:addElement( Item0Icon )
	self.Item0Icon = Item0Icon
	
	local Item1Backer = nil
	
	Item1Backer = LUI.UIImage.new()
	Item1Backer.id = "Item1Backer"
	Item1Backer:setImage( RegisterMaterial( "daily_popup_standard" ), 0 )
	Item1Backer:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 679.5, _1080p * 935.5, _1080p * 350.2, _1080p * 606.2 )
	self:addElement( Item1Backer )
	self.Item1Backer = Item1Backer
	
	local Item1 = nil
	
	Item1 = LUI.UIText.new()
	Item1.id = "Item1"
	Item1:setText( "+1", 0 )
	Item1:SetFontSize( 28 * _1080p )
	Item1:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	Item1:SetAlignment( LUI.Alignment.Center )
	Item1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 759.5, _1080p * 855.5, _1080p * 553.01, _1080p * 581.01 )
	self:addElement( Item1 )
	self.Item1 = Item1
	
	local Item1Icon = nil
	
	Item1Icon = LUI.UIImage.new()
	Item1Icon.id = "Item1Icon"
	Item1Icon:setImage( RegisterMaterial( "icon_currency_keys" ), 0 )
	Item1Icon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 757.5, _1080p * 857.5, _1080p * 428.2, _1080p * 528.2 )
	self:addElement( Item1Icon )
	self.Item1Icon = Item1Icon
	
	local TitleBandAlpha = nil
	
	TitleBandAlpha = LUI.UIImage.new()
	TitleBandAlpha.id = "TitleBandAlpha"
	TitleBandAlpha:SetRGBFromTable( SWATCHES.genericMenu.title, 0 )
	TitleBandAlpha:SetAlpha( 0.2, 0 )
	TitleBandAlpha:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 316, _1080p * -316, _1080p * 113, _1080p * 193 )
	self:addElement( TitleBandAlpha )
	self.TitleBandAlpha = TitleBandAlpha
	
	local TitleBandTop = nil
	
	TitleBandTop = LUI.UIImage.new()
	TitleBandTop.id = "TitleBandTop"
	TitleBandTop:SetRGBFromTable( SWATCHES.CAC.yellowLight, 0 )
	TitleBandTop:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 316, _1080p * -316, _1080p * 103, _1080p * 113 )
	self:addElement( TitleBandTop )
	self.TitleBandTop = TitleBandTop
	
	local LoginMessage = nil
	
	LoginMessage = LUI.UIStyledText.new()
	LoginMessage.id = "LoginMessage"
	LoginMessage:setText( LocalizeString( Engine.Localize( "LUA_MENU_MP_DAILY_LOGIN_MESSAGE" ) ), 0 )
	LoginMessage:SetFontSize( 22 * _1080p )
	LoginMessage:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	LoginMessage:SetAlignment( LUI.Alignment.Left )
	LoginMessage:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 457.5, _1080p * 949, _1080p * 245, _1080p * 267 )
	self:addElement( LoginMessage )
	self.LoginMessage = LoginMessage
	
	local Title = nil
	
	Title = LUI.UIStyledText.new()
	Title.id = "Title"
	Title:setText( LocalizeString( Engine.Localize( "LUA_MENU_MP_DAILY_LOGIN_TITLE" ) ), 0 )
	Title:SetFontSize( 60 * _1080p )
	Title:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	Title:SetAlignment( LUI.Alignment.Left )
	Title:SetShadowMinDistance( -0.2, 0 )
	Title:SetShadowMaxDistance( 0.2, 0 )
	Title:SetShadowRGBFromInt( 0, 0 )
	Title:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 356.5, _1080p * 1561, _1080p * 123, _1080p * 183 )
	self:addElement( Title )
	self.Title = Title
	
	local GameLogoShadow = nil
	
	GameLogoShadow = LUI.UIImage.new()
	GameLogoShadow.id = "GameLogoShadow"
	GameLogoShadow:SetRGBFromTable( SWATCHES.HUD.background, 0 )
	GameLogoShadow:SetAlpha( 0.9, 0 )
	GameLogoShadow:SetScale( -0.45, 0 )
	GameLogoShadow:setImage( RegisterMaterial( "hud_glow" ), 0 )
	GameLogoShadow:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 622, _1080p * 1914, _1080p * 323.2, _1080p * 1176.5 )
	self:addElement( GameLogoShadow )
	self.GameLogoShadow = GameLogoShadow
	
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f2_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetRGBFromTable( SWATCHES.HUD.normal, 0 )
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 316, _1080p * -316, _1080p * -178, _1080p * -128 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local Divider = nil
	
	Divider = LUI.UIImage.new()
	Divider.id = "Divider"
	Divider:setImage( RegisterMaterial( "daily_popup_divider" ), 0 )
	Divider:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 671.25, _1080p * 703.25, _1080p * 357.2, _1080p * 613.2 )
	self:addElement( Divider )
	self.Divider = Divider
	
	local Item2Backer = nil
	
	Item2Backer = LUI.UIImage.new()
	Item2Backer.id = "Item2Backer"
	Item2Backer:setImage( RegisterMaterial( "daily_popup_season_pass" ), 0 )
	Item2Backer:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 439, _1080p * 695, _1080p * 598.58, _1080p * 854.58 )
	self:addElement( Item2Backer )
	self.Item2Backer = Item2Backer
	
	local Item2Icon = nil
	
	Item2Icon = LUI.UIImage.new()
	Item2Icon.id = "Item2Icon"
	Item2Icon:setImage( RegisterMaterial( "currency_parts_icon_large" ), 0 )
	Item2Icon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 517, _1080p * 617, _1080p * 676.58, _1080p * 776.58 )
	self:addElement( Item2Icon )
	self.Item2Icon = Item2Icon
	
	local Item2 = nil
	
	Item2 = LUI.UIText.new()
	Item2.id = "Item2"
	Item2:setText( "+1", 0 )
	Item2:SetFontSize( 28 * _1080p )
	Item2:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	Item2:SetAlignment( LUI.Alignment.Center )
	Item2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 517, _1080p * 616.5, _1080p * 801.39, _1080p * 829.39 )
	self:addElement( Item2 )
	self.Item2 = Item2
	
	local Item3Backer = nil
	
	Item3Backer = LUI.UIImage.new()
	Item3Backer.id = "Item3Backer"
	Item3Backer:setImage( RegisterMaterial( "daily_popup_season_pass" ), 0 )
	Item3Backer:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 679.5, _1080p * 935.5, _1080p * 598.58, _1080p * 854.58 )
	self:addElement( Item3Backer )
	self.Item3Backer = Item3Backer
	
	local Item3 = nil
	
	Item3 = LUI.UIText.new()
	Item3.id = "Item3"
	Item3:setText( "+1", 0 )
	Item3:SetFontSize( 28 * _1080p )
	Item3:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	Item3:SetAlignment( LUI.Alignment.Center )
	Item3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 757.5, _1080p * 857.5, _1080p * 801.39, _1080p * 829.39 )
	self:addElement( Item3 )
	self.Item3 = Item3
	
	local Item3Icon = nil
	
	Item3Icon = LUI.UIImage.new()
	Item3Icon.id = "Item3Icon"
	Item3Icon:setImage( RegisterMaterial( "icon_currency_keys" ), 0 )
	Item3Icon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 757.5, _1080p * 857.5, _1080p * 676.58, _1080p * 776.58 )
	self:addElement( Item3Icon )
	self.Item3Icon = Item3Icon
	
	local DividerTop = nil
	
	DividerTop = LUI.UIImage.new()
	DividerTop.id = "DividerTop"
	DividerTop:setImage( RegisterMaterial( "daily_popup_divider" ), 0 )
	DividerTop:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 671.25, _1080p * 703.25, _1080p * 605.89, _1080p * 861.89 )
	self:addElement( DividerTop )
	self.DividerTop = DividerTop
	
	local LoginBonus1 = nil
	
	LoginBonus1 = LUI.UIStyledText.new()
	LoginBonus1.id = "LoginBonus1"
	LoginBonus1:SetRGBFromInt( 0, 0 )
	LoginBonus1:setText( Engine.Localize( "LUA_MENU_MP_DAILY_LOGIN_BONUS" ), 0 )
	LoginBonus1:SetFontSize( 22 * _1080p )
	LoginBonus1:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	LoginBonus1:SetAlignment( LUI.Alignment.Center )
	LoginBonus1:SetStartupDelay( 1000 )
	LoginBonus1:SetLineHoldTime( 500 )
	LoginBonus1:SetAnimMoveTime( 250 )
	LoginBonus1:SetEndDelay( 1000 )
	LoginBonus1:SetCrossfadeTime( 500 )
	LoginBonus1:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	LoginBonus1:SetMaxVisibleLines( 1 )
	LoginBonus1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 476.75, _1080p * 656.75, _1080p * 388.01, _1080p * 410.01 )
	self:addElement( LoginBonus1 )
	self.LoginBonus1 = LoginBonus1
	
	local LoginBonus2 = nil
	
	LoginBonus2 = LUI.UIStyledText.new()
	LoginBonus2.id = "LoginBonus2"
	LoginBonus2:SetRGBFromInt( 0, 0 )
	LoginBonus2:setText( Engine.Localize( "LUA_MENU_MP_DAILY_LOGIN_BONUS" ), 0 )
	LoginBonus2:SetFontSize( 22 * _1080p )
	LoginBonus2:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	LoginBonus2:SetAlignment( LUI.Alignment.Center )
	LoginBonus2:SetStartupDelay( 1000 )
	LoginBonus2:SetLineHoldTime( 500 )
	LoginBonus2:SetAnimMoveTime( 250 )
	LoginBonus2:SetEndDelay( 1000 )
	LoginBonus2:SetCrossfadeTime( 500 )
	LoginBonus2:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	LoginBonus2:SetMaxVisibleLines( 1 )
	LoginBonus2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 717.5, _1080p * 897.5, _1080p * 388.01, _1080p * 410.01 )
	self:addElement( LoginBonus2 )
	self.LoginBonus2 = LoginBonus2
	
	local SeasonPass1 = nil
	
	SeasonPass1 = LUI.UIStyledText.new()
	SeasonPass1.id = "SeasonPass1"
	SeasonPass1:SetRGBFromInt( 0, 0 )
	SeasonPass1:setText( Engine.Localize( "LUA_MENU_MP_DAILY_LOGIN_SEASON_PASS" ), 0 )
	SeasonPass1:SetFontSize( 22 * _1080p )
	SeasonPass1:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	SeasonPass1:SetAlignment( LUI.Alignment.Center )
	SeasonPass1:SetStartupDelay( 1000 )
	SeasonPass1:SetLineHoldTime( 500 )
	SeasonPass1:SetAnimMoveTime( 250 )
	SeasonPass1:SetEndDelay( 1000 )
	SeasonPass1:SetCrossfadeTime( 500 )
	SeasonPass1:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	SeasonPass1:SetMaxVisibleLines( 1 )
	SeasonPass1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 476.75, _1080p * 656.75, _1080p * 637.5, _1080p * 659.5 )
	self:addElement( SeasonPass1 )
	self.SeasonPass1 = SeasonPass1
	
	local SeasonPass2 = nil
	
	SeasonPass2 = LUI.UIStyledText.new()
	SeasonPass2.id = "SeasonPass2"
	SeasonPass2:SetRGBFromInt( 0, 0 )
	SeasonPass2:setText( Engine.Localize( "LUA_MENU_MP_DAILY_LOGIN_SEASON_PASS" ), 0 )
	SeasonPass2:SetFontSize( 22 * _1080p )
	SeasonPass2:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	SeasonPass2:SetAlignment( LUI.Alignment.Center )
	SeasonPass2:SetStartupDelay( 1000 )
	SeasonPass2:SetLineHoldTime( 500 )
	SeasonPass2:SetAnimMoveTime( 250 )
	SeasonPass2:SetEndDelay( 1000 )
	SeasonPass2:SetCrossfadeTime( 500 )
	SeasonPass2:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	SeasonPass2:SetMaxVisibleLines( 1 )
	SeasonPass2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 716.5, _1080p * 896.5, _1080p * 637.5, _1080p * 659.5 )
	self:addElement( SeasonPass2 )
	self.SeasonPass2 = SeasonPass2
	
	local Item0IconWide = nil
	
	Item0IconWide = LUI.UIImage.new()
	Item0IconWide.id = "Item0IconWide"
	Item0IconWide:SetAlpha( 0, 0 )
	Item0IconWide:setImage( RegisterMaterial( "armory_loot_crate_common" ), 0 )
	Item0IconWide:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 471, _1080p * 663, _1080p * 432.2, _1080p * 528.2 )
	self:addElement( Item0IconWide )
	self.Item0IconWide = Item0IconWide
	
	local Item1IconWide = nil
	
	Item1IconWide = LUI.UIImage.new()
	Item1IconWide.id = "Item1IconWide"
	Item1IconWide:SetAlpha( 0, 0 )
	Item1IconWide:setImage( RegisterMaterial( "armory_loot_crate_common" ), 0 )
	Item1IconWide:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 710.5, _1080p * 902.5, _1080p * 432.2, _1080p * 528.2 )
	self:addElement( Item1IconWide )
	self.Item1IconWide = Item1IconWide
	
	local Item2IconWide = nil
	
	Item2IconWide = LUI.UIImage.new()
	Item2IconWide.id = "Item2IconWide"
	Item2IconWide:SetAlpha( 0, 0 )
	Item2IconWide:setImage( RegisterMaterial( "armory_loot_crate_common" ), 0 )
	Item2IconWide:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 471, _1080p * 663, _1080p * 685.89, _1080p * 781.89 )
	self:addElement( Item2IconWide )
	self.Item2IconWide = Item2IconWide
	
	local Item3IconWide = nil
	
	Item3IconWide = LUI.UIImage.new()
	Item3IconWide.id = "Item3IconWide"
	Item3IconWide:SetAlpha( 0, 0 )
	Item3IconWide:setImage( RegisterMaterial( "armory_loot_crate_common" ), 0 )
	Item3IconWide:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 711.5, _1080p * 903.5, _1080p * 685.89, _1080p * 781.89 )
	self:addElement( Item3IconWide )
	self.Item3IconWide = Item3IconWide
	
	local GameLogo = nil
	
	GameLogo = LUI.UIImage.new()
	GameLogo.id = "GameLogo"
	GameLogo:SetAlpha( 0.9, 0 )
	GameLogo:SetScale( -0.5, 0 )
	GameLogo:setImage( RegisterMaterial( "cod_splash_logo_1" ), 0 )
	GameLogo:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 746, _1080p * 1770, _1080p * 659.5, _1080p * 915.5 )
	self:addElement( GameLogo )
	self.GameLogo = GameLogo
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Item0Backer:RegisterAnimationSequence( "Item0Only", {
			{
				function ()
					return self.Item0Backer:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Item0Backer:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 551.5, _1080p * 807.5, _1080p * 315.08, _1080p * 571.08, 0 )
				end
			}
		} )
		Item0:RegisterAnimationSequence( "Item0Only", {
			{
				function ()
					return self.Item0:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Item0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 630, _1080p * 729, _1080p * 517.89, _1080p * 545.89, 0 )
				end
			}
		} )
		Item1Backer:RegisterAnimationSequence( "Item0Only", {
			{
				function ()
					return self.Item1Backer:SetAlpha( 0, 0 )
				end
			}
		} )
		Item1:RegisterAnimationSequence( "Item0Only", {
			{
				function ()
					return self.Item1:SetAlpha( 0, 0 )
				end
			}
		} )
		Item1Icon:RegisterAnimationSequence( "Item0Only", {
			{
				function ()
					return self.Item1Icon:SetAlpha( 0, 0 )
				end
			}
		} )
		Divider:RegisterAnimationSequence( "Item0Only", {
			{
				function ()
					return self.Divider:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Item0Only = function ()
			Item0Backer:AnimateSequence( "Item0Only" )
			Item0:AnimateSequence( "Item0Only" )
			Item1Backer:AnimateSequence( "Item0Only" )
			Item1:AnimateSequence( "Item0Only" )
			Item1Icon:AnimateSequence( "Item0Only" )
			Divider:AnimateSequence( "Item0Only" )
		end
		
		Item0Backer:RegisterAnimationSequence( "Item1Only", {
			{
				function ()
					return self.Item0Backer:SetAlpha( 0, 0 )
				end
			}
		} )
		Item0:RegisterAnimationSequence( "Item1Only", {
			{
				function ()
					return self.Item0:SetAlpha( 0, 0 )
				end
			}
		} )
		Item1Backer:RegisterAnimationSequence( "Item1Only", {
			{
				function ()
					return self.Item1Backer:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Item1Backer:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 548.25, _1080p * 804.25, _1080p * 317.19, _1080p * 573.19, 0 )
				end
			}
		} )
		Item1:RegisterAnimationSequence( "Item1Only", {
			{
				function ()
					return self.Item1:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Item1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 628.25, _1080p * 724.25, _1080p * 520, _1080p * 548, 0 )
				end
			}
		} )
		Item1Icon:RegisterAnimationSequence( "Item1Only", {
			{
				function ()
					return self.Item1Icon:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Item1Icon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 626.25, _1080p * 726.25, _1080p * 395.19, _1080p * 495.19, 0 )
				end
			}
		} )
		Divider:RegisterAnimationSequence( "Item1Only", {
			{
				function ()
					return self.Divider:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Item1Only = function ()
			Item0Backer:AnimateSequence( "Item1Only" )
			Item0:AnimateSequence( "Item1Only" )
			Item1Backer:AnimateSequence( "Item1Only" )
			Item1:AnimateSequence( "Item1Only" )
			Item1Icon:AnimateSequence( "Item1Only" )
			Divider:AnimateSequence( "Item1Only" )
		end
		
		Item0Backer:RegisterAnimationSequence( "BothItems", {
			{
				function ()
					return self.Item0Backer:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Item0Backer:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 438.75, _1080p * 694.75, _1080p * 317.2, _1080p * 573.2, 0 )
				end
			}
		} )
		Item0:RegisterAnimationSequence( "BothItems", {
			{
				function ()
					return self.Item0:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Item0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 517.25, _1080p * 616.25, _1080p * 520.01, _1080p * 548.01, 0 )
				end
			}
		} )
		Item0Icon:RegisterAnimationSequence( "BothItems", {
			{
				function ()
					return self.Item0Icon:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Item0Icon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 516.75, _1080p * 616.75, _1080p * 395.2, _1080p * 495.2, 0 )
				end
			}
		} )
		Item1Backer:RegisterAnimationSequence( "BothItems", {
			{
				function ()
					return self.Item1Backer:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Item1Backer:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 679.25, _1080p * 935.25, _1080p * 317.2, _1080p * 573.2, 0 )
				end
			}
		} )
		Item1:RegisterAnimationSequence( "BothItems", {
			{
				function ()
					return self.Item1:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Item1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 759.25, _1080p * 855.25, _1080p * 520.01, _1080p * 548.01, 0 )
				end
			}
		} )
		Item1Icon:RegisterAnimationSequence( "BothItems", {
			{
				function ()
					return self.Item1Icon:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Item1Icon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 757.25, _1080p * 857.25, _1080p * 395.2, _1080p * 495.2, 0 )
				end
			}
		} )
		Divider:RegisterAnimationSequence( "BothItems", {
			{
				function ()
					return self.Divider:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.BothItems = function ()
			Item0Backer:AnimateSequence( "BothItems" )
			Item0:AnimateSequence( "BothItems" )
			Item0Icon:AnimateSequence( "BothItems" )
			Item1Backer:AnimateSequence( "BothItems" )
			Item1:AnimateSequence( "BothItems" )
			Item1Icon:AnimateSequence( "BothItems" )
			Divider:AnimateSequence( "BothItems" )
		end
		
		Item0Backer:RegisterAnimationSequence( "Item0_Off", {
			{
				function ()
					return self.Item0Backer:SetAlpha( 0, 0 )
				end
			}
		} )
		Item0:RegisterAnimationSequence( "Item0_Off", {
			{
				function ()
					return self.Item0:SetAlpha( 0, 0 )
				end
			}
		} )
		Item0Icon:RegisterAnimationSequence( "Item0_Off", {
			{
				function ()
					return self.Item0Icon:SetAlpha( 0, 0 )
				end
			}
		} )
		LoginBonus1:RegisterAnimationSequence( "Item0_Off", {
			{
				function ()
					return self.LoginBonus1:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Item0_Off = function ()
			Item0Backer:AnimateSequence( "Item0_Off" )
			Item0:AnimateSequence( "Item0_Off" )
			Item0Icon:AnimateSequence( "Item0_Off" )
			LoginBonus1:AnimateSequence( "Item0_Off" )
		end
		
		Item1Backer:RegisterAnimationSequence( "Item1_Off", {
			{
				function ()
					return self.Item1Backer:SetAlpha( 0, 0 )
				end
			}
		} )
		Item1:RegisterAnimationSequence( "Item1_Off", {
			{
				function ()
					return self.Item1:SetAlpha( 0, 0 )
				end
			}
		} )
		Item1Icon:RegisterAnimationSequence( "Item1_Off", {
			{
				function ()
					return self.Item1Icon:SetAlpha( 0, 0 )
				end
			}
		} )
		Divider:RegisterAnimationSequence( "Item1_Off", {
			{
				function ()
					return self.Divider:SetAlpha( 0, 0 )
				end
			}
		} )
		LoginBonus2:RegisterAnimationSequence( "Item1_Off", {
			{
				function ()
					return self.LoginBonus2:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Item1_Off = function ()
			Item1Backer:AnimateSequence( "Item1_Off" )
			Item1:AnimateSequence( "Item1_Off" )
			Item1Icon:AnimateSequence( "Item1_Off" )
			Divider:AnimateSequence( "Item1_Off" )
			LoginBonus2:AnimateSequence( "Item1_Off" )
		end
		
		Item2Backer:RegisterAnimationSequence( "Item2_Off", {
			{
				function ()
					return self.Item2Backer:SetAlpha( 0, 0 )
				end
			}
		} )
		Item2Icon:RegisterAnimationSequence( "Item2_Off", {
			{
				function ()
					return self.Item2Icon:SetAlpha( 0, 0 )
				end
			}
		} )
		Item2:RegisterAnimationSequence( "Item2_Off", {
			{
				function ()
					return self.Item2:SetAlpha( 0, 0 )
				end
			}
		} )
		SeasonPass1:RegisterAnimationSequence( "Item2_Off", {
			{
				function ()
					return self.SeasonPass1:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Item2_Off = function ()
			Item2Backer:AnimateSequence( "Item2_Off" )
			Item2Icon:AnimateSequence( "Item2_Off" )
			Item2:AnimateSequence( "Item2_Off" )
			SeasonPass1:AnimateSequence( "Item2_Off" )
		end
		
		Item3Backer:RegisterAnimationSequence( "Item3_Off", {
			{
				function ()
					return self.Item3Backer:SetAlpha( 0, 0 )
				end
			}
		} )
		Item3:RegisterAnimationSequence( "Item3_Off", {
			{
				function ()
					return self.Item3:SetAlpha( 0, 0 )
				end
			}
		} )
		Item3Icon:RegisterAnimationSequence( "Item3_Off", {
			{
				function ()
					return self.Item3Icon:SetAlpha( 0, 0 )
				end
			}
		} )
		DividerTop:RegisterAnimationSequence( "Item3_Off", {
			{
				function ()
					return self.DividerTop:SetAlpha( 0, 0 )
				end
			}
		} )
		SeasonPass2:RegisterAnimationSequence( "Item3_Off", {
			{
				function ()
					return self.SeasonPass2:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Item3_Off = function ()
			Item3Backer:AnimateSequence( "Item3_Off" )
			Item3:AnimateSequence( "Item3_Off" )
			Item3Icon:AnimateSequence( "Item3_Off" )
			DividerTop:AnimateSequence( "Item3_Off" )
			SeasonPass2:AnimateSequence( "Item3_Off" )
		end
		
		Item2Backer:RegisterAnimationSequence( "NoSeasonPass", {
			{
				function ()
					return self.Item2Backer:SetAlpha( 0, 0 )
				end
			}
		} )
		Item2Icon:RegisterAnimationSequence( "NoSeasonPass", {
			{
				function ()
					return self.Item2Icon:SetAlpha( 0, 0 )
				end
			}
		} )
		Item2:RegisterAnimationSequence( "NoSeasonPass", {
			{
				function ()
					return self.Item2:SetAlpha( 0, 0 )
				end
			}
		} )
		Item3Backer:RegisterAnimationSequence( "NoSeasonPass", {
			{
				function ()
					return self.Item3Backer:SetAlpha( 0, 0 )
				end
			}
		} )
		Item3:RegisterAnimationSequence( "NoSeasonPass", {
			{
				function ()
					return self.Item3:SetAlpha( 0, 0 )
				end
			}
		} )
		Item3Icon:RegisterAnimationSequence( "NoSeasonPass", {
			{
				function ()
					return self.Item3Icon:SetAlpha( 0, 0 )
				end
			}
		} )
		DividerTop:RegisterAnimationSequence( "NoSeasonPass", {
			{
				function ()
					return self.DividerTop:SetAlpha( 0, 0 )
				end
			}
		} )
		SeasonPass1:RegisterAnimationSequence( "NoSeasonPass", {
			{
				function ()
					return self.SeasonPass1:SetAlpha( 0, 0 )
				end
			}
		} )
		SeasonPass2:RegisterAnimationSequence( "NoSeasonPass", {
			{
				function ()
					return self.SeasonPass2:SetAlpha( 0, 0 )
				end
			}
		} )
		Item3IconWide:RegisterAnimationSequence( "NoSeasonPass", {
			{
				function ()
					return self.Item3IconWide:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.NoSeasonPass = function ()
			Item2Backer:AnimateSequence( "NoSeasonPass" )
			Item2Icon:AnimateSequence( "NoSeasonPass" )
			Item2:AnimateSequence( "NoSeasonPass" )
			Item3Backer:AnimateSequence( "NoSeasonPass" )
			Item3:AnimateSequence( "NoSeasonPass" )
			Item3Icon:AnimateSequence( "NoSeasonPass" )
			DividerTop:AnimateSequence( "NoSeasonPass" )
			SeasonPass1:AnimateSequence( "NoSeasonPass" )
			SeasonPass2:AnimateSequence( "NoSeasonPass" )
			Item3IconWide:AnimateSequence( "NoSeasonPass" )
		end
		
		Item0Icon:RegisterAnimationSequence( "Item0_Wide", {
			{
				function ()
					return self.Item0Icon:SetAlpha( 0, 0 )
				end
			}
		} )
		Item0IconWide:RegisterAnimationSequence( "Item0_Wide", {
			{
				function ()
					return self.Item0IconWide:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.Item0_Wide = function ()
			Item0Icon:AnimateSequence( "Item0_Wide" )
			Item0IconWide:AnimateSequence( "Item0_Wide" )
		end
		
		Item1Icon:RegisterAnimationSequence( "Item1_Wide", {
			{
				function ()
					return self.Item1Icon:SetAlpha( 0, 0 )
				end
			}
		} )
		Item1IconWide:RegisterAnimationSequence( "Item1_Wide", {
			{
				function ()
					return self.Item1IconWide:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.Item1_Wide = function ()
			Item1Icon:AnimateSequence( "Item1_Wide" )
			Item1IconWide:AnimateSequence( "Item1_Wide" )
		end
		
		Item2Icon:RegisterAnimationSequence( "Item2_Wide", {
			{
				function ()
					return self.Item2Icon:SetAlpha( 0, 0 )
				end
			}
		} )
		Item2IconWide:RegisterAnimationSequence( "Item2_Wide", {
			{
				function ()
					return self.Item2IconWide:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.Item2_Wide = function ()
			Item2Icon:AnimateSequence( "Item2_Wide" )
			Item2IconWide:AnimateSequence( "Item2_Wide" )
		end
		
		Item3Icon:RegisterAnimationSequence( "Item3_Wide", {
			{
				function ()
					return self.Item3Icon:SetAlpha( 0, 0 )
				end
			}
		} )
		Item3IconWide:RegisterAnimationSequence( "Item3_Wide", {
			{
				function ()
					return self.Item3IconWide:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.Item3_Wide = function ()
			Item3Icon:AnimateSequence( "Item3_Wide" )
			Item3IconWide:AnimateSequence( "Item3_Wide" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self.addButtonHelperFunction = function ( f83_arg0, f83_arg1 )
		f83_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			clickable = true
		} )
	end
	
	self:addEventHandler( "menu_create", self.addButtonHelperFunction )
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	self.bindButton:addEventHandler( "button_secondary", function ( f84_arg0, f84_arg1 )
		local f84_local0 = f84_arg1.controller or f2_local1
		ACTIONS.LeaveMenu( self )
	end )
	f0_local0( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "DailyLoginBonusPopup", DailyLoginBonusPopup )
LockTable( _M )
