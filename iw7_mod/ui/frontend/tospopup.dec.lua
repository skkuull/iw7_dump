local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1 )
	local f1_local0 = nil
	if f1_arg0 < 10 then
		f1_local0 = f1_arg1 .. "00" .. f1_arg0
	elseif f1_arg0 < 100 then
		f1_local0 = f1_arg1 .. "0" .. f1_arg0
	else
		f1_local0 = f1_arg1 .. f1_arg0
	end
	return f1_local0
end

f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2 )
	local f2_local0 = f2_arg2.TOSHeaderText
	local f2_local1 = f2_arg2.TOSBaseString
	local f2_local2 = f2_arg2.TOSEnglishPageCount
	local f2_local3 = f2_arg2.TOSOtherPageCount
	local f2_local4 = nil
	if IsLanguageEnglish() then
		f2_local4 = f2_local2
	else
		f2_local4 = f2_local3
	end
	f2_arg0.currentTOSIndex = 1
	f2_arg0.TOSHeaderText:setText( Engine.Localize( f2_local0 ), 0 )
	f2_arg0.TOSPagedText:setText( LocalizeLongString( f0_local0( f2_arg0.currentTOSIndex, f2_local1 ) ), 0 )
	f2_arg0.PageNumberLabel:setText( Engine.Localize( "CODACCOUNT_CODA_AGREEMENT_PAGES", f2_arg0.currentTOSIndex, f2_local4 ), 0 )
	f2_arg0.TOSPagedText:addEventHandler( "next_page_fail", function ( f3_arg0, f3_arg1 )
		if f2_arg0.currentTOSIndex < f2_local4 then
			f2_arg0.currentTOSIndex = f2_arg0.currentTOSIndex + 1
			f2_arg0.TOSPagedText:setText( LocalizeLongString( f0_local0( f2_arg0.currentTOSIndex, f2_local1 ) ), 0 )
			f2_arg0.PageNumberLabel:setText( Engine.Localize( "CODACCOUNT_CODA_AGREEMENT_PAGES", f2_arg0.currentTOSIndex, f2_local4 ), 0 )
		end
	end )
	f2_arg0.TOSPagedText:addEventHandler( "prev_page_fail", function ( f4_arg0, f4_arg1 )
		if f2_arg0.currentTOSIndex > 1 then
			f2_arg0.currentTOSIndex = f2_arg0.currentTOSIndex - 1
			f2_arg0.TOSPagedText:setText( LocalizeLongString( f0_local0( f2_arg0.currentTOSIndex, f2_local1 ) ), 0 )
			f2_arg0.TOSPagedText:SetPage( f2_arg0.TOSPagedText:GetNumPages( f2_arg0.TOSPagedText ) )
			f2_arg0.PageNumberLabel:setText( Engine.Localize( "CODACCOUNT_CODA_AGREEMENT_PAGES", f2_arg0.currentTOSIndex, f2_local4 ), 0 )
		end
	end )
end

function TOSPopup( menu, controller )
	local self = LUI.UIVerticalNavigator.new()
	self.id = "TOSPopup"
	local f5_local1 = controller and controller.controllerIndex
	if not f5_local1 and not Engine.InFrontend() then
		f5_local1 = self:getRootController()
	end
	assert( f5_local1 )
	self:playSound( "menu_open" )
	local f5_local2 = self
	local BackgroundImage = nil
	
	BackgroundImage = LUI.UIImage.new()
	BackgroundImage.id = "BackgroundImage"
	BackgroundImage:SetRGBFromInt( 0, 0 )
	self:addElement( BackgroundImage )
	self.BackgroundImage = BackgroundImage
	
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 0, 0 )
	Background:SetAlpha( 0.8, 0 )
	Background:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 371, _1080p * -371, _1080p * 230, _1080p * -230 )
	self:addElement( Background )
	self.Background = Background
	
	local BackgroundBorder = nil
	
	BackgroundBorder = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 2
	} )
	BackgroundBorder.id = "BackgroundBorder"
	BackgroundBorder:SetAlpha( 0.25, 0 )
	BackgroundBorder:SetBorderThicknessBottom( _1080p * 2, 0 )
	BackgroundBorder:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 371, _1080p * -371, _1080p * 230, _1080p * -230 )
	self:addElement( BackgroundBorder )
	self.BackgroundBorder = BackgroundBorder
	
	local TOSPagedText = nil
	
	TOSPagedText = LUI.UIPagedText.new()
	TOSPagedText.id = "TOSPagedText"
	TOSPagedText:setText( "PLATFORM_EULA", 0 )
	TOSPagedText:SetFontSize( 30 * _1080p )
	TOSPagedText:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	TOSPagedText:SetAlignment( LUI.Alignment.Left )
	TOSPagedText:SetTextPageHeight( 550 * _1080p )
	TOSPagedText:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 427, _1080p * -459, _1080p * 266, _1080p * -784 )
	self:addElement( TOSPagedText )
	self.TOSPagedText = TOSPagedText
	
	local TOSButtonHelperBar = nil
	
	TOSButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f5_local1
	} )
	TOSButtonHelperBar.id = "TOSButtonHelperBar"
	TOSButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( TOSButtonHelperBar )
	self.TOSButtonHelperBar = TOSButtonHelperBar
	
	local PageNumberLabel = nil
	
	PageNumberLabel = LUI.UIText.new()
	PageNumberLabel.id = "PageNumberLabel"
	PageNumberLabel:setText( Engine.Localize( "CODACCOUNT_CODA_AGREEMENT_PAGES" ), 0 )
	PageNumberLabel:SetFontSize( 24 * _1080p )
	PageNumberLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	PageNumberLabel:SetAlignment( LUI.Alignment.Center )
	PageNumberLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 787, _1080p * 1101, _1080p * 862.5, _1080p * 886.5 )
	self:addElement( PageNumberLabel )
	self.PageNumberLabel = PageNumberLabel
	
	local TOSHeader = nil
	
	TOSHeader = LUI.UIImage.new()
	TOSHeader.id = "TOSHeader"
	TOSHeader:SetRGBFromInt( 5723991, 0 )
	TOSHeader:SetAlpha( 0.4, 0 )
	TOSHeader:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 371, _1080p * 1549, _1080p * 161.5, _1080p * 231.5 )
	self:addElement( TOSHeader )
	self.TOSHeader = TOSHeader
	
	local TOSHeaderGradient = nil
	
	TOSHeaderGradient = LUI.UIImage.new()
	TOSHeaderGradient.id = "TOSHeaderGradient"
	TOSHeaderGradient:SetRGBFromInt( 0, 0 )
	TOSHeaderGradient:SetAlpha( 0.4, 0 )
	TOSHeaderGradient:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 371, _1080p * 1549, _1080p * 161.5, _1080p * 231.5 )
	self:addElement( TOSHeaderGradient )
	self.TOSHeaderGradient = TOSHeaderGradient
	
	local TOSHeaderText = nil
	
	TOSHeaderText = LUI.UIText.new()
	TOSHeaderText.id = "TOSHeaderText"
	TOSHeaderText:setText( Engine.Localize( "CODACCOUNT_CODA_TOS_CAPS" ), 0 )
	TOSHeaderText:SetFontSize( 38 * _1080p )
	TOSHeaderText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	TOSHeaderText:SetAlignment( LUI.Alignment.Center )
	TOSHeaderText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 654, _1080p * 1234, _1080p * 177.5, _1080p * 215.5 )
	self:addElement( TOSHeaderText )
	self.TOSHeaderText = TOSHeaderText
	
	self.addButtonHelperFunction = function ( f6_arg0, f6_arg1 )
		f6_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_NEXT_PAGE" ),
			button_ref = "button_shoulderr",
			side = "right",
			priority = 1,
			clickable = true
		} )
		f6_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_PREV_PAGE" ),
			button_ref = "button_shoulderl",
			side = "right",
			priority = 2,
			clickable = true
		} )
		f6_arg0:AddButtonHelperText( {
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
	
	self.bindButton:addEventHandler( "button_shoulderr", function ( f7_arg0, f7_arg1 )
		local f7_local0 = f7_arg1.controller or f5_local1
		ACTIONS.NextPage( self )
	end )
	self.bindButton:addEventHandler( "button_shoulderl", function ( f8_arg0, f8_arg1 )
		local f8_local0 = f8_arg1.controller or f5_local1
		ACTIONS.PrevPage( self )
	end )
	self.bindButton:addEventHandler( "button_secondary", function ( f9_arg0, f9_arg1 )
		local f9_local0 = f9_arg1.controller or f5_local1
		ACTIONS.LeaveMenu( self )
	end )
	f0_local1( self, f5_local1, controller )
	return self
end

MenuBuilder.registerType( "TOSPopup", TOSPopup )
LockTable( _M )
