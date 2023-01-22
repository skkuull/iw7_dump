local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.Image )
	f1_arg0.addButtonHelperFunction = function ( f2_arg0, f2_arg1 )
		f2_arg0:AddButtonHelperText( {
			helper_text = ToUpperCase( Engine.Localize( "LUA_MENU_BUY_NOW" ) ),
			button_ref = "button_primary",
			side = "left",
			clickable = true
		} )
		f2_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			clickable = true
		} )
	end
	
	f1_arg0:addEventHandler( "menu_create", f1_arg0.addButtonHelperFunction )
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	f1_arg0:addElement( bindButton )
	f1_arg0.bindButton = bindButton
	
	f1_arg0.bindButton:addEventHandler( "button_secondary", function ( f3_arg0, f3_arg1 )
		local f3_local0 = f3_arg1.controller or f1_arg1
		ACTIONS.LeaveMenu( f1_arg0 )
	end )
	f1_arg0.bindButton:addEventHandler( "button_primary", function ( f4_arg0, f4_arg1 )
		if CONDITIONS.IsPS4() then
			Commerce.ShowFirstPartyStore( f1_arg1 )
		elseif CONDITIONS.IsXboxOne() then
			LUI.FlowManager.RequestPopupMenu( nil, "ShowUpsellXboxStore", false, false, false, {}, nil, false, true )
		end
	end )
	if Engine.IsAliensMode() then
		f1_arg0.Image:setImage( RegisterMaterial( "image_motd_zombies4" ), 0 )
	else
		f1_arg0.Image:setImage( RegisterMaterial( "image_motd_mp_generic2" ), 0 )
	end
end

function TrialFullWindow( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "TrialFullWindow"
	local f5_local1 = controller and controller.controllerIndex
	if not f5_local1 and not Engine.InFrontend() then
		f5_local1 = self:getRootController()
	end
	assert( f5_local1 )
	local f5_local2 = self
	local DarkenBackground = nil
	
	DarkenBackground = LUI.UIImage.new()
	DarkenBackground.id = "DarkenBackground"
	DarkenBackground:SetRGBFromInt( 0, 0 )
	DarkenBackground:SetAlpha( 0.85, 0 )
	self:addElement( DarkenBackground )
	self.DarkenBackground = DarkenBackground
	
	local Image = nil
	
	Image = LUI.UIImage.new()
	Image.id = "Image"
	Image:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 316, _1080p * -316, _1080p * 103, _1080p * -177 )
	self:addElement( Image )
	self.Image = Image
	
	local BodyBackground = nil
	
	BodyBackground = LUI.UIImage.new()
	BodyBackground.id = "BodyBackground"
	BodyBackground:SetRGBFromTable( SWATCHES.HUD.background, 0 )
	BodyBackground:SetAlpha( 0.85, 0 )
	BodyBackground:setImage( RegisterMaterial( "widg_gradient_left_to_right" ), 0 )
	BodyBackground:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 316, _1080p * -420, _1080p * 103, _1080p * -173 )
	self:addElement( BodyBackground )
	self.BodyBackground = BodyBackground
	
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f5_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetRGBFromTable( SWATCHES.HUD.normal, 0 )
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 316, _1080p * -316, _1080p * -178, _1080p * -128 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local TitleBandAlpha = nil
	
	TitleBandAlpha = LUI.UIImage.new()
	TitleBandAlpha.id = "TitleBandAlpha"
	TitleBandAlpha:SetRGBFromTable( SWATCHES.genericMenu.title, 0 )
	TitleBandAlpha:SetAlpha( 0.2, 0 )
	TitleBandAlpha:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 316, _1080p * -316, _1080p * 102, _1080p * 182 )
	self:addElement( TitleBandAlpha )
	self.TitleBandAlpha = TitleBandAlpha
	
	local TitleBandTop = nil
	
	TitleBandTop = LUI.UIImage.new()
	TitleBandTop.id = "TitleBandTop"
	TitleBandTop:SetRGBFromTable( SWATCHES.CAC.yellowLight, 0 )
	TitleBandTop:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 316, _1080p * -316, _1080p * 92, _1080p * 102 )
	self:addElement( TitleBandTop )
	self.TitleBandTop = TitleBandTop
	
	local GameLogoShadow = nil
	
	GameLogoShadow = LUI.UIImage.new()
	GameLogoShadow.id = "GameLogoShadow"
	GameLogoShadow:SetRGBFromTable( SWATCHES.HUD.background, 0 )
	GameLogoShadow:SetAlpha( 0.9, 0 )
	GameLogoShadow:SetScale( -0.4, 0 )
	GameLogoShadow:setImage( RegisterMaterial( "hud_glow" ), 0 )
	GameLogoShadow:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 634, _1080p * 1926, _1080p * 363.2, _1080p * 1216.5 )
	self:addElement( GameLogoShadow )
	self.GameLogoShadow = GameLogoShadow
	
	local GameLogo = nil
	
	GameLogo = LUI.UIImage.new()
	GameLogo.id = "GameLogo"
	GameLogo:SetAlpha( 0.9, 0 )
	GameLogo:SetScale( -0.5, 0 )
	GameLogo:setImage( RegisterMaterial( "cod_splash_logo_1" ), 0 )
	GameLogo:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 746, _1080p * 1770, _1080p * 659.5, _1080p * 915.5 )
	self:addElement( GameLogo )
	self.GameLogo = GameLogo
	
	local HeaderText = nil
	
	HeaderText = LUI.UIStyledText.new()
	HeaderText.id = "HeaderText"
	HeaderText:SetRGBFromTable( SWATCHES.genericMenu.title, 0 )
	HeaderText:setText( Engine.Localize( "LUA_MENU_TRIAL_POPUP_HEADER" ), 0 )
	HeaderText:SetFontSize( 60 * _1080p )
	HeaderText:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	HeaderText:SetAlignment( LUI.Alignment.Left )
	HeaderText:SetShadowMinDistance( -0.2, 0 )
	HeaderText:SetShadowMaxDistance( 0.2, 0 )
	HeaderText:SetShadowRGBFromInt( 0, 0 )
	HeaderText:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 372, _1080p * 363, _1080p * 112, _1080p * 172 )
	self:addElement( HeaderText )
	self.HeaderText = HeaderText
	
	local BodyText = nil
	
	BodyText = LUI.UIStyledText.new()
	BodyText.id = "BodyText"
	BodyText:SetRGBFromInt( 13750996, 0 )
	BodyText:setText( Engine.Localize( "LUA_MENU_TRIAL_POPUP_MSG" ), 0 )
	BodyText:SetFontSize( 24 * _1080p )
	BodyText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	BodyText:SetAlignment( LUI.Alignment.Left )
	BodyText:SetShadowMinDistance( -0.2, 0 )
	BodyText:SetShadowMaxDistance( 0.2, 0 )
	BodyText:SetShadowRGBFromInt( 0, 0 )
	BodyText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 375.5, _1080p * 937.5, _1080p * 204, _1080p * 228 )
	self:addElement( BodyText )
	self.BodyText = BodyText
	
	f0_local0( self, f5_local1, controller )
	return self
end

MenuBuilder.registerType( "TrialFullWindow", TrialFullWindow )
LockTable( _M )
