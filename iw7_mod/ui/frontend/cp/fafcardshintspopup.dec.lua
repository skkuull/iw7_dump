local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1 )
	LUI.FlowManager.RequestLeaveMenu( f1_arg0 )
end

f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2 )
	assert( f2_arg0.Hint4CardImage )
	local self = LUI.UIBindButton.new()
	self.id = "DismissFAFCardsHintsPopup_id"
	self:registerEventHandler( "button_secondary", f0_local0 )
	f2_arg0:addElement( self )
	f2_arg0.Hint4CardImage:SetButtonDisabled( true )
end

function FAFCardsHintsPopup( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "FAFCardsHintsPopup"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	self:playSound( "menu_open" )
	local f3_local2 = self
	local Darkener = nil
	
	Darkener = LUI.UIImage.new()
	Darkener.id = "Darkener"
	Darkener:SetRGBFromTable( SWATCHES.genericMenu.blackBackground, 0 )
	Darkener:SetAlpha( 0.8, 0 )
	Darkener:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -1000, _1080p * 1000, _1080p * -1000, _1080p * 1000 )
	self:addElement( Darkener )
	self.Darkener = Darkener
	
	local OKButton = nil
	
	OKButton = MenuBuilder.BuildRegisteredType( "PopupButton", {
		controllerIndex = f3_local1
	} )
	OKButton.id = "OKButton"
	OKButton.Label:setText( ToUpperCase( Engine.Localize( "MENU_OK" ) ), 0 )
	OKButton.Label:SetAlignment( LUI.Alignment.Center )
	OKButton:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -200, _1080p * 200, _1080p * 835.26, _1080p * 865.26 )
	self:addElement( OKButton )
	self.OKButton = OKButton
	
	local Hint1Image = nil
	
	Hint1Image = MenuBuilder.BuildRegisteredType( "FAFCardsDisplay", {
		controllerIndex = f3_local1
	} )
	Hint1Image.id = "Hint1Image"
	Hint1Image:SetScale( -0.25, 0 )
	Hint1Image:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 144.8, _1080p * 505.8, _1080p * 296.13, _1080p * 561.13 )
	self:addElement( Hint1Image )
	self.Hint1Image = Hint1Image
	
	local Hint1Title = nil
	
	Hint1Title = LUI.UIStyledText.new()
	Hint1Title.id = "Hint1Title"
	Hint1Title:SetRGBFromTable( SWATCHES.Zombies.menuHeader, 0 )
	Hint1Title:setText( Engine.Localize( "LUA_MENU_ZM_BUILD_DECK" ), 0 )
	Hint1Title:SetFontSize( 32 * _1080p )
	Hint1Title:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Hint1Title:SetAlignment( LUI.Alignment.Center )
	Hint1Title:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -794.11, _1080p * -499.32, _1080p * 540, _1080p * 572 )
	self:addElement( Hint1Title )
	self.Hint1Title = Hint1Title
	
	local Hint1Description = nil
	
	Hint1Description = LUI.UIText.new()
	Hint1Description.id = "Hint1Description"
	Hint1Description:setText( Engine.Localize( "LUA_MENU_ZM_BUILD_DECK_DESC" ), 0 )
	Hint1Description:SetFontSize( 30 * _1080p )
	Hint1Description:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Hint1Description:SetAlignment( LUI.Alignment.Center )
	Hint1Description:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -794.11, _1080p * -499.32, _1080p * 616.5, _1080p * 646.5 )
	self:addElement( Hint1Description )
	self.Hint1Description = Hint1Description
	
	local Hint2Image = nil
	
	Hint2Image = LUI.UIImage.new()
	Hint2Image.id = "Hint2Image"
	Hint2Image:setImage( RegisterMaterial( "cp_faf_zombie_head" ), 0 )
	Hint2Image:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -462.29, _1080p * -134.29, _1080p * 199.5, _1080p * 527.5 )
	self:addElement( Hint2Image )
	self.Hint2Image = Hint2Image
	
	local Hint2Title = nil
	
	Hint2Title = LUI.UIStyledText.new()
	Hint2Title.id = "Hint2Title"
	Hint2Title:SetRGBFromTable( SWATCHES.Zombies.menuHeader, 0 )
	Hint2Title:setText( Engine.Localize( "LUA_MENU_ZM_EARN_POINTS" ), 0 )
	Hint2Title:SetFontSize( 32 * _1080p )
	Hint2Title:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Hint2Title:SetAlignment( LUI.Alignment.Center )
	Hint2Title:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -460.11, _1080p * -165.32, _1080p * 540, _1080p * 572 )
	self:addElement( Hint2Title )
	self.Hint2Title = Hint2Title
	
	local Hint2Description = nil
	
	Hint2Description = LUI.UIText.new()
	Hint2Description.id = "Hint2Description"
	Hint2Description:setText( Engine.Localize( "LUA_MENU_ZM_EARN_POINTS_DESC" ), 0 )
	Hint2Description:SetFontSize( 30 * _1080p )
	Hint2Description:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Hint2Description:SetAlignment( LUI.Alignment.Center )
	Hint2Description:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -460.11, _1080p * -165.32, _1080p * 616.5, _1080p * 646.5 )
	self:addElement( Hint2Description )
	self.Hint2Description = Hint2Description
	
	local Triangle = nil
	
	Triangle = LUI.UIImage.new()
	Triangle.id = "Triangle"
	Triangle:SetRGBFromInt( 2434341, 0 )
	Triangle:SetZRotation( 180, 0 )
	Triangle:setImage( RegisterMaterial( "zm_wc_triangle" ), 0 )
	Triangle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 791, _1080p * 1129, _1080p * 260.5, _1080p * 598.5 )
	self:addElement( Triangle )
	self.Triangle = Triangle
	
	local glowRing = nil
	
	glowRing = LUI.UIImage.new()
	glowRing.id = "glowRing"
	glowRing:SetScale( 0.26, 0 )
	glowRing:setImage( RegisterMaterial( "zm_wc_card_glow_ring" ), 0 )
	glowRing:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 871.23, _1080p * 1048.78, _1080p * 305.23, _1080p * 482.78 )
	self:addElement( glowRing )
	self.glowRing = glowRing
	
	local Hint3Image = nil
	
	Hint3Image = LUI.UIImage.new()
	Hint3Image.id = "Hint3Image"
	Hint3Image:setImage( RegisterMaterial( "zm_wc_devil_head" ), 0 )
	Hint3Image:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -128, _1080p * 128, _1080p * 275, _1080p * 531 )
	self:addElement( Hint3Image )
	self.Hint3Image = Hint3Image
	
	local Hint3Title = nil
	
	Hint3Title = LUI.UIStyledText.new()
	Hint3Title.id = "Hint3Title"
	Hint3Title:SetRGBFromTable( SWATCHES.Zombies.menuHeader, 0 )
	Hint3Title:setText( Engine.Localize( "LUA_MENU_ZM_FILL_METER" ), 0 )
	Hint3Title:SetFontSize( 32 * _1080p )
	Hint3Title:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Hint3Title:SetAlignment( LUI.Alignment.Center )
	Hint3Title:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -143.79, _1080p * 151, _1080p * 540, _1080p * 572 )
	self:addElement( Hint3Title )
	self.Hint3Title = Hint3Title
	
	local Hint3Description = nil
	
	Hint3Description = LUI.UIText.new()
	Hint3Description.id = "Hint3Description"
	Hint3Description:setText( Engine.Localize( "LUA_MENU_ZM_FILL_METER_DESC" ), 0 )
	Hint3Description:SetFontSize( 30 * _1080p )
	Hint3Description:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Hint3Description:SetAlignment( LUI.Alignment.Center )
	Hint3Description:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -141.79, _1080p * 153, _1080p * 616.5, _1080p * 646.5 )
	self:addElement( Hint3Description )
	self.Hint3Description = Hint3Description
	
	local Hint4ImageFire = nil
	
	Hint4ImageFire = LUI.UIImage.new()
	Hint4ImageFire.id = "Hint4ImageFire"
	Hint4ImageFire:SetScale( -0.3, 0 )
	Hint4ImageFire:setImage( RegisterMaterial( "cp_faf_card_backing_flames" ), 0 )
	Hint4ImageFire:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 192, _1080p * 448, _1080p * 126.63, _1080p * 382.63 )
	self:addElement( Hint4ImageFire )
	self.Hint4ImageFire = Hint4ImageFire
	
	local Hint4CardImage = nil
	
	Hint4CardImage = MenuBuilder.BuildRegisteredType( "fortuneCardSlotButtton", {
		controllerIndex = f3_local1
	} )
	Hint4CardImage.id = "Hint4CardImage"
	Hint4CardImage:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1203.11, _1080p * 1368.11, _1080p * 302.13, _1080p * 523.63 )
	Hint4CardImage:SubscribeToModel( DataSources.frontEnd.CP.fortuneCards.cardSlot4Backing:GetModel( f3_local1 ), function ()
		local f4_local0 = DataSources.frontEnd.CP.fortuneCards.cardSlot4Backing:GetValue( f3_local1 )
		if f4_local0 ~= nil then
			Hint4CardImage.base:setImage( RegisterMaterial( f4_local0 ), 0 )
		end
	end )
	Hint4CardImage:SubscribeToModel( DataSources.frontEnd.CP.fortuneCards.cardSlot4Icon:GetModel( f3_local1 ), function ()
		local f5_local0 = DataSources.frontEnd.CP.fortuneCards.cardSlot4Icon:GetValue( f3_local1 )
		if f5_local0 ~= nil then
			Hint4CardImage.CardIcon:setImage( RegisterMaterial( f5_local0 ), 0 )
		end
	end )
	Hint4CardImage:SubscribeToModel( DataSources.frontEnd.CP.fortuneCards.cardSlot4Name:GetModel( f3_local1 ), function ()
		local f6_local0 = DataSources.frontEnd.CP.fortuneCards.cardSlot4Name:GetValue( f3_local1 )
		if f6_local0 ~= nil then
			Hint4CardImage.CardName:setText( f6_local0, 0 )
		end
	end )
	self:addElement( Hint4CardImage )
	self.Hint4CardImage = Hint4CardImage
	
	local Hint4Title = nil
	
	Hint4Title = LUI.UIStyledText.new()
	Hint4Title.id = "Hint4Title"
	Hint4Title:SetRGBFromTable( SWATCHES.Zombies.menuHeader, 0 )
	Hint4Title:setText( Engine.Localize( "LUA_MENU_ZM_ACTIVATE_CARD" ), 0 )
	Hint4Title:SetFontSize( 32 * _1080p )
	Hint4Title:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Hint4Title:SetAlignment( LUI.Alignment.Center )
	Hint4Title:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 175.21, _1080p * 470, _1080p * 540, _1080p * 572 )
	self:addElement( Hint4Title )
	self.Hint4Title = Hint4Title
	
	local f3_local19 = nil
	if CONDITIONS.IsGamepadEnabled( self ) then
		f3_local19 = LUI.UIText.new()
		f3_local19.id = "Hint4DescriptionConsole"
		f3_local19:setText( Engine.Localize( "LUA_MENU_ZM_ACTIVATE_CARD_DESC" ), 0 )
		f3_local19:SetFontSize( 30 * _1080p )
		f3_local19:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
		f3_local19:SetAlignment( LUI.Alignment.Center )
		f3_local19:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 178.21, _1080p * 473, _1080p * 616.5, _1080p * 646.5 )
		self:addElement( f3_local19 )
		self.Hint4DescriptionConsole = f3_local19
	end
	local f3_local20 = nil
	if not CONDITIONS.IsGamepadEnabled( self ) then
		f3_local20 = LUI.UIText.new()
		f3_local20.id = "Hint4DescriptionPC"
		f3_local20:setText( Engine.Localize( "LUA_MENU_ZM_ACTIVATE_CARD_DESC_PC" ), 0 )
		f3_local20:SetFontSize( 30 * _1080p )
		f3_local20:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
		f3_local20:SetAlignment( LUI.Alignment.Center )
		f3_local20:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 178.21, _1080p * 473, _1080p * 616.5, _1080p * 646.5 )
		self:addElement( f3_local20 )
		self.Hint4DescriptionPC = f3_local20
	end
	local Hint5Image = nil
	
	Hint5Image = LUI.UIImage.new()
	Hint5Image.id = "Hint5Image"
	Hint5Image:setImage( RegisterMaterial( "zm_wc_devil_head_sad" ), 0 )
	Hint5Image:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 507, _1080p * 763, _1080p * 294.13, _1080p * 550.13 )
	self:addElement( Hint5Image )
	self.Hint5Image = Hint5Image
	
	local Hint5Title = nil
	
	Hint5Title = LUI.UIStyledText.new()
	Hint5Title.id = "Hint5Title"
	Hint5Title:SetRGBFromTable( SWATCHES.Zombies.menuHeader, 0 )
	Hint5Title:setText( Engine.Localize( "LUA_MENU_ZM_RUN_OUT_OF_CARDS" ), 0 )
	Hint5Title:SetFontSize( 32 * _1080p )
	Hint5Title:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Hint5Title:SetAlignment( LUI.Alignment.Center )
	Hint5Title:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 496.21, _1080p * 791, _1080p * 540, _1080p * 572 )
	self:addElement( Hint5Title )
	self.Hint5Title = Hint5Title
	
	local Hint5Description = nil
	
	Hint5Description = LUI.UIText.new()
	Hint5Description.id = "Hint5Description"
	Hint5Description:setText( Engine.Localize( "LUA_MENU_ZM_RUN_OUT_OF_CARDS_DESC" ), 0 )
	Hint5Description:SetFontSize( 30 * _1080p )
	Hint5Description:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Hint5Description:SetAlignment( LUI.Alignment.Center )
	Hint5Description:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 496.21, _1080p * 791, _1080p * 616.5, _1080p * 646.5 )
	self:addElement( Hint5Description )
	self.Hint5Description = Hint5Description
	
	local CPMenuTitle = nil
	
	CPMenuTitle = MenuBuilder.BuildRegisteredType( "CPMenuTitle", {
		controllerIndex = f3_local1
	} )
	CPMenuTitle.id = "CPMenuTitle"
	CPMenuTitle.MenuTitle:setText( Engine.Localize( "LUA_MENU_ZM_WONDER_CARDS" ), 0 )
	CPMenuTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
	self:addElement( CPMenuTitle )
	self.CPMenuTitle = CPMenuTitle
	
	local GradLineTop = nil
	
	GradLineTop = LUI.UIImage.new()
	GradLineTop.id = "GradLineTop"
	GradLineTop:SetRGBFromTable( SWATCHES.Zombies.menuHeader, 0 )
	GradLineTop:SetAlpha( 0.65, 0 )
	GradLineTop:setImage( RegisterMaterial( "wdg_gradient_dual" ), 0 )
	GradLineTop:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -1000, _1080p * 1000, _1080p * 527, _1080p * 528 )
	self:addElement( GradLineTop )
	self.GradLineTop = GradLineTop
	
	local GradLineBottom = nil
	
	GradLineBottom = LUI.UIImage.new()
	GradLineBottom.id = "GradLineBottom"
	GradLineBottom:SetRGBFromTable( SWATCHES.Zombies.menuHeader, 0 )
	GradLineBottom:SetAlpha( 0.65, 0 )
	GradLineBottom:setImage( RegisterMaterial( "wdg_gradient_dual" ), 0 )
	GradLineBottom:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -1000, _1080p * 1000, _1080p * 613, _1080p * 614 )
	self:addElement( GradLineBottom )
	self.GradLineBottom = GradLineBottom
	
	local GradLineWhiteTop1 = nil
	
	GradLineWhiteTop1 = LUI.UIImage.new()
	GradLineWhiteTop1.id = "GradLineWhiteTop1"
	GradLineWhiteTop1:setImage( RegisterMaterial( "wdg_gradient_dual" ), 0 )
	GradLineWhiteTop1:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -825, _1080p * -475, _1080p * 533, _1080p * 535 )
	self:addElement( GradLineWhiteTop1 )
	self.GradLineWhiteTop1 = GradLineWhiteTop1
	
	local GradLineWhiteTop2 = nil
	
	GradLineWhiteTop2 = LUI.UIImage.new()
	GradLineWhiteTop2.id = "GradLineWhiteTop2"
	GradLineWhiteTop2:setImage( RegisterMaterial( "wdg_gradient_dual" ), 0 )
	GradLineWhiteTop2:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -495, _1080p * -145, _1080p * 533, _1080p * 535 )
	self:addElement( GradLineWhiteTop2 )
	self.GradLineWhiteTop2 = GradLineWhiteTop2
	
	local GradLineWhiteTop3 = nil
	
	GradLineWhiteTop3 = LUI.UIImage.new()
	GradLineWhiteTop3.id = "GradLineWhiteTop3"
	GradLineWhiteTop3:setImage( RegisterMaterial( "wdg_gradient_dual" ), 0 )
	GradLineWhiteTop3:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -175, _1080p * 175, _1080p * 533, _1080p * 535 )
	self:addElement( GradLineWhiteTop3 )
	self.GradLineWhiteTop3 = GradLineWhiteTop3
	
	local GradLineWhiteTop4 = nil
	
	GradLineWhiteTop4 = LUI.UIImage.new()
	GradLineWhiteTop4.id = "GradLineWhiteTop4"
	GradLineWhiteTop4:setImage( RegisterMaterial( "wdg_gradient_dual" ), 0 )
	GradLineWhiteTop4:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 145, _1080p * 495, _1080p * 533, _1080p * 535 )
	self:addElement( GradLineWhiteTop4 )
	self.GradLineWhiteTop4 = GradLineWhiteTop4
	
	local GradLineWhiteTop5 = nil
	
	GradLineWhiteTop5 = LUI.UIImage.new()
	GradLineWhiteTop5.id = "GradLineWhiteTop5"
	GradLineWhiteTop5:setImage( RegisterMaterial( "wdg_gradient_dual" ), 0 )
	GradLineWhiteTop5:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 460, _1080p * 810, _1080p * 533, _1080p * 535 )
	self:addElement( GradLineWhiteTop5 )
	self.GradLineWhiteTop5 = GradLineWhiteTop5
	
	local GradLineWhiteBottom1 = nil
	
	GradLineWhiteBottom1 = LUI.UIImage.new()
	GradLineWhiteBottom1.id = "GradLineWhiteBottom1"
	GradLineWhiteBottom1:setImage( RegisterMaterial( "wdg_gradient_dual" ), 0 )
	GradLineWhiteBottom1:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -825, _1080p * -475, _1080p * 608, _1080p * 610 )
	self:addElement( GradLineWhiteBottom1 )
	self.GradLineWhiteBottom1 = GradLineWhiteBottom1
	
	local GradLineWhiteBottom2 = nil
	
	GradLineWhiteBottom2 = LUI.UIImage.new()
	GradLineWhiteBottom2.id = "GradLineWhiteBottom2"
	GradLineWhiteBottom2:setImage( RegisterMaterial( "wdg_gradient_dual" ), 0 )
	GradLineWhiteBottom2:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -495, _1080p * -145, _1080p * 608, _1080p * 610 )
	self:addElement( GradLineWhiteBottom2 )
	self.GradLineWhiteBottom2 = GradLineWhiteBottom2
	
	local GradLineWhiteBottom3 = nil
	
	GradLineWhiteBottom3 = LUI.UIImage.new()
	GradLineWhiteBottom3.id = "GradLineWhiteBottom3"
	GradLineWhiteBottom3:setImage( RegisterMaterial( "wdg_gradient_dual" ), 0 )
	GradLineWhiteBottom3:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -175, _1080p * 175, _1080p * 608, _1080p * 610 )
	self:addElement( GradLineWhiteBottom3 )
	self.GradLineWhiteBottom3 = GradLineWhiteBottom3
	
	local GradLineWhiteBottom4 = nil
	
	GradLineWhiteBottom4 = LUI.UIImage.new()
	GradLineWhiteBottom4.id = "GradLineWhiteBottom4"
	GradLineWhiteBottom4:setImage( RegisterMaterial( "wdg_gradient_dual" ), 0 )
	GradLineWhiteBottom4:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 145, _1080p * 495, _1080p * 608, _1080p * 610 )
	self:addElement( GradLineWhiteBottom4 )
	self.GradLineWhiteBottom4 = GradLineWhiteBottom4
	
	local GradLineWhiteBottom5 = nil
	
	GradLineWhiteBottom5 = LUI.UIImage.new()
	GradLineWhiteBottom5.id = "GradLineWhiteBottom5"
	GradLineWhiteBottom5:setImage( RegisterMaterial( "wdg_gradient_dual" ), 0 )
	GradLineWhiteBottom5:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 460, _1080p * 810, _1080p * 608, _1080p * 610 )
	self:addElement( GradLineWhiteBottom5 )
	self.GradLineWhiteBottom5 = GradLineWhiteBottom5
	
	self._animationSets.DefaultAnimationSet = function ()
		Hint1Image:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Hint1Image:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Hint1Image:SetAlpha( 0, 100 )
				end,
				function ()
					return self.Hint1Image:SetAlpha( 1, 400, LUI.EASING.outQuadratic )
				end
			}
		} )
		Hint2Image:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Hint2Image:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Hint2Image:SetAlpha( 0, 300 )
				end,
				function ()
					return self.Hint2Image:SetAlpha( 1, 400, LUI.EASING.outQuadratic )
				end
			}
		} )
		Triangle:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Triangle:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Triangle:SetAlpha( 0, 500 )
				end,
				function ()
					return self.Triangle:SetAlpha( 1, 400, LUI.EASING.outQuadratic )
				end
			}
		} )
		glowRing:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.glowRing:SetAlpha( 0, 0 )
				end,
				function ()
					return self.glowRing:SetAlpha( 0, 500 )
				end,
				function ()
					return self.glowRing:SetAlpha( 1, 400, LUI.EASING.outQuadratic )
				end
			}
		} )
		Hint3Image:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Hint3Image:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Hint3Image:SetAlpha( 0, 500 )
				end,
				function ()
					return self.Hint3Image:SetAlpha( 1, 400, LUI.EASING.outQuadratic )
				end
			}
		} )
		Hint4ImageFire:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Hint4ImageFire:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Hint4ImageFire:SetAlpha( 0, 1070 )
				end,
				function ()
					return self.Hint4ImageFire:SetAlpha( 1, 90, LUI.EASING.outQuadratic )
				end
			}
		} )
		Hint4CardImage:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Hint4CardImage:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Hint4CardImage:SetAlpha( 0, 700 )
				end,
				function ()
					return self.Hint4CardImage:SetAlpha( 1, 370, LUI.EASING.inQuadratic )
				end
			}
		} )
		Hint5Image:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Hint5Image:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Hint5Image:SetAlpha( 0, 900 )
				end,
				function ()
					return self.Hint5Image:SetAlpha( 1, 430, LUI.EASING.outQuadratic )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			Hint1Image:AnimateSequence( "DefaultSequence" )
			Hint2Image:AnimateSequence( "DefaultSequence" )
			Triangle:AnimateSequence( "DefaultSequence" )
			glowRing:AnimateSequence( "DefaultSequence" )
			Hint3Image:AnimateSequence( "DefaultSequence" )
			Hint4ImageFire:AnimateSequence( "DefaultSequence" )
			Hint4CardImage:AnimateSequence( "DefaultSequence" )
			Hint5Image:AnimateSequence( "DefaultSequence" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	OKButton:addEventHandler( "button_action", function ( f33_arg0, f33_arg1 )
		local f33_local0 = f33_arg1.controller or f3_local1
		ACTIONS.LeaveMenu( self )
	end )
	Hint4CardImage:addEventHandler( "button_action", function ( f34_arg0, f34_arg1 )
		ACTIONS.OpenCardFourSelectMenu( self, self.Hint4CardImage, f34_arg1.controller or f3_local1 )
	end )
	f0_local1( self, f3_local1, controller )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	return self
end

MenuBuilder.registerType( "FAFCardsHintsPopup", FAFCardsHintsPopup )
LockTable( _M )
