local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	Onboarding:AdvanceFlow( Onboarding.Quartermaster, "INTRO" )
	if not CONDITIONS.AreCODPointsEnabled() then
		assert( f1_arg0.EarningKeysBody )
		f1_arg0.EarningKeysBody:setText( Engine.Localize( "MP_FRONTEND_ONLY_TUTORIAL_POPUP_KEYS_DESC_NO_POINTS" ) )
		assert( f1_arg0.SupplyDropBody )
		f1_arg0.SupplyDropBody:setText( Engine.Localize( "MP_FRONTEND_ONLY_TUTORIAL_POPUP_DROPS_DESC_NO_POINTS" ) )
	end
end

function QuartermasterTutorialPopup( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "QuartermasterTutorialPopup"
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
	
	local tempBG = nil
	
	tempBG = LUI.UIImage.new()
	tempBG.id = "tempBG"
	tempBG:setImage( RegisterMaterial( "image_motd_main1" ), 0 )
	tempBG:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 316, _1080p * -316, _1080p * 103, _1080p * -177 )
	self:addElement( tempBG )
	self.tempBG = tempBG
	
	local ButtonHelperBar0 = nil
	
	ButtonHelperBar0 = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f2_local1
	} )
	ButtonHelperBar0.id = "ButtonHelperBar0"
	ButtonHelperBar0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 316, _1080p * 1604, _1080p * 905, _1080p * 977 )
	self:addElement( ButtonHelperBar0 )
	self.ButtonHelperBar0 = ButtonHelperBar0
	
	local TitleBandAlpha = nil
	
	TitleBandAlpha = LUI.UIImage.new()
	TitleBandAlpha.id = "TitleBandAlpha"
	TitleBandAlpha:SetRGBFromTable( SWATCHES.genericMenu.title, 0 )
	TitleBandAlpha:SetAlpha( 0.2, 0 )
	TitleBandAlpha:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 316, _1080p * -316, _1080p * 115, _1080p * 195 )
	self:addElement( TitleBandAlpha )
	self.TitleBandAlpha = TitleBandAlpha
	
	local TitleBandTop = nil
	
	TitleBandTop = LUI.UIImage.new()
	TitleBandTop.id = "TitleBandTop"
	TitleBandTop:SetRGBFromTable( SWATCHES.CAC.yellowLight, 0 )
	TitleBandTop:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 316, _1080p * -316, _1080p * 105, _1080p * 115 )
	self:addElement( TitleBandTop )
	self.TitleBandTop = TitleBandTop
	
	local HeaderText = nil
	
	HeaderText = LUI.UIStyledText.new()
	HeaderText.id = "HeaderText"
	HeaderText:SetRGBFromTable( SWATCHES.genericMenu.title, 0 )
	HeaderText:setText( Engine.Localize( "MP_FRONTEND_ONLY_TUTORIAL_POPUP_TITLE" ), 0 )
	HeaderText:SetFontSize( 60 * _1080p )
	HeaderText:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	HeaderText:SetAlignment( LUI.Alignment.Left )
	HeaderText:SetShadowMinDistance( -0.2, 0 )
	HeaderText:SetShadowMaxDistance( 0.22, 0 )
	HeaderText:SetShadowRGBFromInt( 0, 0 )
	HeaderText:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 349, _1080p * -371, _1080p * 125, _1080p * 185 )
	self:addElement( HeaderText )
	self.HeaderText = HeaderText
	
	local KeyBgTop = nil
	
	KeyBgTop = LUI.UIImage.new()
	KeyBgTop.id = "KeyBgTop"
	KeyBgTop:SetRGBFromTable( SWATCHES.HUD.background, 0 )
	KeyBgTop:SetAlpha( 0.4, 0 )
	KeyBgTop:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 346, _1080p * -1194, _1080p * 255, _1080p * -560 )
	self:addElement( KeyBgTop )
	self.KeyBgTop = KeyBgTop
	
	local KeyBgBot = nil
	
	KeyBgBot = LUI.UIImage.new()
	KeyBgBot.id = "KeyBgBot"
	KeyBgBot:SetRGBFromTable( SWATCHES.HUD.background, 0 )
	KeyBgBot:SetAlpha( 0.4, 0 )
	KeyBgBot:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 346, _1080p * -1194, _1080p * 523, _1080p * -205 )
	self:addElement( KeyBgBot )
	self.KeyBgBot = KeyBgBot
	
	local f2_local11 = nil
	if Engine.InFrontend() then
		f2_local11 = MenuBuilder.BuildRegisteredType( "GenericListButtonBackground", {
			controllerIndex = f2_local1
		} )
		f2_local11.id = "KeyTitleBg"
		f2_local11.DropShadow:SetAlpha( 0, 0 )
		f2_local11:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 346, _1080p * -1194, _1080p * 231, _1080p * 255 )
		self:addElement( f2_local11 )
		self.KeyTitleBg = f2_local11
	end
	local KeyTitle = nil
	
	KeyTitle = LUI.UIText.new()
	KeyTitle.id = "KeyTitle"
	KeyTitle:SetRGBFromInt( 14277081, 0 )
	KeyTitle:setText( ToUpperCase( Engine.Localize( "MP_FRONTEND_ONLY_TUTORIAL_POPUP_KEYS" ) ), 0 )
	KeyTitle:SetFontSize( 19 * _1080p )
	KeyTitle:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	KeyTitle:SetAlignment( LUI.Alignment.Left )
	KeyTitle:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 357, _1080p * -1202, _1080p * 233.5, _1080p * 252.5 )
	self:addElement( KeyTitle )
	self.KeyTitle = KeyTitle
	
	local IconKey = nil
	
	IconKey = LUI.UIImage.new()
	IconKey.id = "IconKey"
	IconKey:SetScale( -0.15, 0 )
	IconKey:setImage( RegisterMaterial( "icon_currency_keys" ), 0 )
	IconKey:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 402, _1080p * -1390, _1080p * 316.42, _1080p * -635.58 )
	self:addElement( IconKey )
	self.IconKey = IconKey
	
	local f2_local14 = nil
	if CONDITIONS.AreCODPointsEnabled( self ) then
		f2_local14 = LUI.UIImage.new()
		f2_local14.id = "IconCodPts"
		f2_local14:SetScale( -0.4, 0 )
		f2_local14:setImage( RegisterMaterial( "currency_cod_points_icon" ), 0 )
		f2_local14:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 517, _1080p * -1275, _1080p * 316.42, _1080p * -635.58 )
		self:addElement( f2_local14 )
		self.IconCodPts = f2_local14
	end
	local EarningKeysBody = nil
	
	EarningKeysBody = LUI.UIStyledText.new()
	EarningKeysBody.id = "EarningKeysBody"
	EarningKeysBody:SetRGBFromTable( SWATCHES.genericMenu.title, 0 )
	EarningKeysBody:setText( Engine.Localize( "MP_FRONTEND_ONLY_TUTORIAL_POPUP_KEYS_DESC" ), 0 )
	EarningKeysBody:SetFontSize( 24 * _1080p )
	EarningKeysBody:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	EarningKeysBody:SetAlignment( LUI.Alignment.Center )
	EarningKeysBody:SetShadowMinDistance( -0.2, 0 )
	EarningKeysBody:SetShadowMaxDistance( 0.2, 0 )
	EarningKeysBody:SetShadowRGBFromInt( 0, 0 )
	EarningKeysBody:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 368, _1080p * -1217, _1080p * 566, _1080p * 590 )
	self:addElement( EarningKeysBody )
	self.EarningKeysBody = EarningKeysBody
	
	local SupplyDropBgTop = nil
	
	SupplyDropBgTop = LUI.UIImage.new()
	SupplyDropBgTop.id = "SupplyDropBgTop"
	SupplyDropBgTop:SetRGBFromTable( SWATCHES.HUD.background, 0 )
	SupplyDropBgTop:SetAlpha( 0.4, 0 )
	SupplyDropBgTop:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 770, _1080p * -770, _1080p * 255, _1080p * -560 )
	self:addElement( SupplyDropBgTop )
	self.SupplyDropBgTop = SupplyDropBgTop
	
	local SupplyDropBgBot = nil
	
	SupplyDropBgBot = LUI.UIImage.new()
	SupplyDropBgBot.id = "SupplyDropBgBot"
	SupplyDropBgBot:SetRGBFromTable( SWATCHES.HUD.background, 0 )
	SupplyDropBgBot:SetAlpha( 0.4, 0 )
	SupplyDropBgBot:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 770, _1080p * -770, _1080p * 523, _1080p * -205 )
	self:addElement( SupplyDropBgBot )
	self.SupplyDropBgBot = SupplyDropBgBot
	
	local SupplyDropTitleBg = nil
	
	SupplyDropTitleBg = MenuBuilder.BuildRegisteredType( "GenericListButtonBackground", {
		controllerIndex = f2_local1
	} )
	SupplyDropTitleBg.id = "SupplyDropTitleBg"
	SupplyDropTitleBg.DropShadow:SetAlpha( 0, 0 )
	SupplyDropTitleBg:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 770, _1080p * -770, _1080p * 231, _1080p * 255 )
	self:addElement( SupplyDropTitleBg )
	self.SupplyDropTitleBg = SupplyDropTitleBg
	
	local SupplyDropTitle = nil
	
	SupplyDropTitle = LUI.UIText.new()
	SupplyDropTitle.id = "SupplyDropTitle"
	SupplyDropTitle:SetRGBFromInt( 14277081, 0 )
	SupplyDropTitle:setText( Engine.Localize( "MP_FRONTEND_ONLY_TUTORIAL_POPUP_DROPS" ), 0 )
	SupplyDropTitle:SetFontSize( 19 * _1080p )
	SupplyDropTitle:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	SupplyDropTitle:SetAlignment( LUI.Alignment.Left )
	SupplyDropTitle:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 781, _1080p * -778, _1080p * 233.5, _1080p * 252.5 )
	self:addElement( SupplyDropTitle )
	self.SupplyDropTitle = SupplyDropTitle
	
	local IconCrate = nil
	
	IconCrate = LUI.UIImage.new()
	IconCrate.id = "IconCrate"
	IconCrate:SetScale( -0.2, 0 )
	IconCrate:setImage( RegisterMaterial( "armory_loot_crate_rare" ), 0 )
	IconCrate:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 701, _1080p * -707, _1080p * 267, _1080p * -557 )
	self:addElement( IconCrate )
	self.IconCrate = IconCrate
	
	local SupplyDropBody = nil
	
	SupplyDropBody = LUI.UIStyledText.new()
	SupplyDropBody.id = "SupplyDropBody"
	SupplyDropBody:SetRGBFromTable( SWATCHES.genericMenu.title, 0 )
	SupplyDropBody:setText( Engine.Localize( "MP_FRONTEND_ONLY_TUTORIAL_POPUP_DROPS_DESC" ), 0 )
	SupplyDropBody:SetFontSize( 24 * _1080p )
	SupplyDropBody:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	SupplyDropBody:SetAlignment( LUI.Alignment.Center )
	SupplyDropBody:SetShadowMinDistance( -0.2, 0 )
	SupplyDropBody:SetShadowMaxDistance( 0.2, 0 )
	SupplyDropBody:SetShadowRGBFromInt( 0, 0 )
	SupplyDropBody:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 792, _1080p * -793, _1080p * 566, _1080p * 590 )
	self:addElement( SupplyDropBody )
	self.SupplyDropBody = SupplyDropBody
	
	local CraftingBgTop = nil
	
	CraftingBgTop = LUI.UIImage.new()
	CraftingBgTop.id = "CraftingBgTop"
	CraftingBgTop:SetRGBFromTable( SWATCHES.HUD.background, 0 )
	CraftingBgTop:SetAlpha( 0.4, 0 )
	CraftingBgTop:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 1194, _1080p * -346, _1080p * 255, _1080p * -560 )
	self:addElement( CraftingBgTop )
	self.CraftingBgTop = CraftingBgTop
	
	local CraftingBgBot = nil
	
	CraftingBgBot = LUI.UIImage.new()
	CraftingBgBot.id = "CraftingBgBot"
	CraftingBgBot:SetRGBFromTable( SWATCHES.HUD.background, 0 )
	CraftingBgBot:SetAlpha( 0.4, 0 )
	CraftingBgBot:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 1194, _1080p * -346, _1080p * 523, _1080p * -205 )
	self:addElement( CraftingBgBot )
	self.CraftingBgBot = CraftingBgBot
	
	local CraftingTitleBg = nil
	
	CraftingTitleBg = MenuBuilder.BuildRegisteredType( "GenericListButtonBackground", {
		controllerIndex = f2_local1
	} )
	CraftingTitleBg.id = "CraftingTitleBg"
	CraftingTitleBg.DropShadow:SetAlpha( 0, 0 )
	CraftingTitleBg:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 1194, _1080p * -346, _1080p * 231, _1080p * 255 )
	self:addElement( CraftingTitleBg )
	self.CraftingTitleBg = CraftingTitleBg
	
	local CraftingTitle = nil
	
	CraftingTitle = LUI.UIText.new()
	CraftingTitle.id = "CraftingTitle"
	CraftingTitle:SetRGBFromInt( 14277081, 0 )
	CraftingTitle:setText( Engine.Localize( "MP_FRONTEND_ONLY_TUTORIAL_POPUP_CRAFTING" ), 0 )
	CraftingTitle:SetFontSize( 19 * _1080p )
	CraftingTitle:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	CraftingTitle:SetAlignment( LUI.Alignment.Left )
	CraftingTitle:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 1205, _1080p * -354, _1080p * 233.5, _1080p * 252.5 )
	self:addElement( CraftingTitle )
	self.CraftingTitle = CraftingTitle
	
	local IconCrateCopy0 = nil
	
	IconCrateCopy0 = LUI.UIImage.new()
	IconCrateCopy0.id = "IconCrateCopy0"
	IconCrateCopy0:SetScale( 0.1, 0 )
	IconCrateCopy0:setImage( RegisterMaterial( "currency_parts_icon_large" ), 0 )
	IconCrateCopy0:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 1318.5, _1080p * -473.5, _1080p * 316.42, _1080p * -635.58 )
	self:addElement( IconCrateCopy0 )
	self.IconCrateCopy0 = IconCrateCopy0
	
	local CraftingBody = nil
	
	CraftingBody = LUI.UIStyledText.new()
	CraftingBody.id = "CraftingBody"
	CraftingBody:SetRGBFromTable( SWATCHES.genericMenu.title, 0 )
	CraftingBody:setText( Engine.Localize( "MP_FRONTEND_ONLY_TUTORIAL_POPUP_CRAFTING_DESC" ), 0 )
	CraftingBody:SetFontSize( 24 * _1080p )
	CraftingBody:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	CraftingBody:SetAlignment( LUI.Alignment.Center )
	CraftingBody:SetShadowMinDistance( -0.2, 0 )
	CraftingBody:SetShadowMaxDistance( 0.2, 0 )
	CraftingBody:SetShadowRGBFromInt( 0, 0 )
	CraftingBody:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 1216, _1080p * -369, _1080p * 566, _1080p * 590 )
	self:addElement( CraftingBody )
	self.CraftingBody = CraftingBody
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		IconKey:RegisterAnimationSequence( "CODPointsDisabled", {
			{
				function ()
					return self.IconKey:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 471.5, _1080p * -1320.5, _1080p * 316.42, _1080p * -635.58, 0 )
				end
			}
		} )
		self._sequences.CODPointsDisabled = function ()
			IconKey:AnimateSequence( "CODPointsDisabled" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	if not CONDITIONS.AreCODPointsEnabled( self ) then
		ACTIONS.AnimateSequence( self, "CODPointsDisabled" )
	end
	self.addButtonHelperFunction = function ( f7_arg0, f7_arg1 )
		f7_arg0:AddButtonHelperText( {
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
	
	self.bindButton:addEventHandler( "button_secondary", function ( f8_arg0, f8_arg1 )
		local f8_local0 = f8_arg1.controller or f2_local1
		ACTIONS.LeaveMenu( self )
	end )
	f0_local0( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "QuartermasterTutorialPopup", QuartermasterTutorialPopup )
LockTable( _M )
