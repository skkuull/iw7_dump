local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = {
	"PLATFORM_EULA_1",
	"PLATFORM_EULA_2",
	"PLATFORM_EULA_3",
	"PLATFORM_EULA_4",
	"PLATFORM_EULA_5",
	"PLATFORM_EULA_6",
	"PLATFORM_EULA_7",
	"PLATFORM_EULA_8"
}
if Engine.IsPS4() then
	if IsAmericaSKU() then
		table.insert( f0_local0, "PLATFORM_EULA_ADDENDUM_AMERICA_1" )
	elseif IsEuropeSKU() and not IsLanguageArabic() then
		table.insert( f0_local0, "PLATFORM_EULA_ADDENDUM_EUROPE_1" )
	end
end
f0_local1 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0.currentEULAIndex = 1
	f1_arg0.EULAPagedText:setText( LocalizeLongString( f0_local0[1] ), 0 )
	assert( f1_arg0.AcceptButton )
	f1_arg0.AcceptButton:addEventHandler( "button_action", function ( f2_arg0, f2_arg1 )
		Engine.ExecNow( "profile_SetAcceptedEULA" )
		LUI.FlowManager.RequestLeaveMenu( f1_arg0, true )
	end )
	assert( f1_arg0.DeclineButton )
	f1_arg0.DeclineButton:addEventHandler( "button_action", function ( f3_arg0, f3_arg1 )
		LUI.FlowManager.RequestLeaveMenu( f1_arg0, true )
	end )
	f1_arg0.EULAPagedText:addEventHandler( "next_page_fail", function ( f4_arg0, f4_arg1 )
		if f1_arg0.currentEULAIndex < #f0_local0 then
			f1_arg0.currentEULAIndex = f1_arg0.currentEULAIndex + 1
			f1_arg0.EULAPagedText:setText( LocalizeLongString( f0_local0[f1_arg0.currentEULAIndex] ), 0 )
		end
	end )
	f1_arg0.EULAPagedText:addEventHandler( "prev_page_fail", function ( f5_arg0, f5_arg1 )
		if f1_arg0.currentEULAIndex > 1 then
			f1_arg0.currentEULAIndex = f1_arg0.currentEULAIndex - 1
			f1_arg0.EULAPagedText:setText( LocalizeLongString( f0_local0[f1_arg0.currentEULAIndex] ), 0 )
			f1_arg0.EULAPagedText:SetPage( f1_arg0.EULAPagedText:GetNumPages( f1_arg0.EULAPagedText ) )
		end
	end )
end

function EULAPopup( menu, controller )
	local self = LUI.UIVerticalNavigator.new()
	self.id = "EULAPopup"
	local f6_local1 = controller and controller.controllerIndex
	if not f6_local1 and not Engine.InFrontend() then
		f6_local1 = self:getRootController()
	end
	assert( f6_local1 )
	self:playSound( "menu_open" )
	local f6_local2 = self
	local f6_local3 = nil
	if CONDITIONS.IsSingleplayer( self ) then
		f6_local3 = LUI.UIImage.new()
		f6_local3.id = "BackgroundImage"
		f6_local3:setImage( RegisterMaterial( "sp_frontend_bink_background" ), 0 )
		self:addElement( f6_local3 )
		self.BackgroundImage = f6_local3
	end
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 0, 0 )
	Background:SetAlpha( 0.8, 0 )
	Background:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 371, _1080p * -371, _1080p * 164, _1080p * -296 )
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
	BackgroundBorder:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 371, _1080p * -371, _1080p * 164, _1080p * -296 )
	self:addElement( BackgroundBorder )
	self.BackgroundBorder = BackgroundBorder
	
	local AcceptButton = nil
	
	AcceptButton = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f6_local1
	} )
	AcceptButton.id = "AcceptButton"
	AcceptButton.Text:setText( ToUpperCase( Engine.Localize( "LUA_MENU_ACCEPT" ) ), 0 )
	AcceptButton:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 710, _1080p * 1210, _1080p * 840, _1080p * 870 )
	self:addElement( AcceptButton )
	self.AcceptButton = AcceptButton
	
	local DeclineButton = nil
	
	DeclineButton = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f6_local1
	} )
	DeclineButton.id = "DeclineButton"
	DeclineButton.Text:setText( ToUpperCase( Engine.Localize( "LUA_MENU_DECLINE" ) ), 0 )
	DeclineButton:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 710, _1080p * 1210, _1080p * 880, _1080p * 910 )
	self:addElement( DeclineButton )
	self.DeclineButton = DeclineButton
	
	local EULAPagedText = nil
	
	EULAPagedText = LUI.UIPagedText.new()
	EULAPagedText.id = "EULAPagedText"
	EULAPagedText:setText( "PLATFORM_EULA", 0 )
	EULAPagedText:SetFontSize( 30 * _1080p )
	EULAPagedText:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	EULAPagedText:SetAlignment( LUI.Alignment.Left )
	EULAPagedText:SetTextPageHeight( 550 * _1080p )
	EULAPagedText:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 427, _1080p * -459, _1080p * 200, _1080p * -850 )
	self:addElement( EULAPagedText )
	self.EULAPagedText = EULAPagedText
	
	local EULAButtonHelperBar = nil
	
	EULAButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f6_local1
	} )
	EULAButtonHelperBar.id = "EULAButtonHelperBar"
	EULAButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( EULAButtonHelperBar )
	self.EULAButtonHelperBar = EULAButtonHelperBar
	
	local f6_local10 = nil
	if CONDITIONS.IsXboxLive( self ) then
		f6_local10 = MenuBuilder.BuildRegisteredType( "PlayerLogIn", {
			controllerIndex = f6_local1
		} )
		f6_local10.id = "Gamertag"
		f6_local10:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 116, _1080p * 585, _1080p * 964.5, _1080p * 993.5 )
		self:addElement( f6_local10 )
		self.Gamertag = f6_local10
	end
	self.addButtonHelperFunction = function ( f7_arg0, f7_arg1 )
		f7_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_SELECT" ),
			button_ref = "button_primary",
			side = "left",
			clickable = true
		} )
		f7_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_NEXT_PAGE" ),
			button_ref = "button_shoulderr",
			side = "right",
			priority = 1,
			clickable = true
		} )
		f7_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_PREV_PAGE" ),
			button_ref = "button_shoulderl",
			side = "right",
			priority = 2,
			clickable = true
		} )
	end
	
	self:addEventHandler( "menu_create", self.addButtonHelperFunction )
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	self.bindButton:addEventHandler( "button_shoulderr", function ( f8_arg0, f8_arg1 )
		local f8_local0 = f8_arg1.controller or f6_local1
		ACTIONS.NextPage( self )
	end )
	self.bindButton:addEventHandler( "button_shoulderl", function ( f9_arg0, f9_arg1 )
		local f9_local0 = f9_arg1.controller or f6_local1
		ACTIONS.PrevPage( self )
	end )
	f0_local1( self, f6_local1, controller )
	return self
end

MenuBuilder.registerType( "EULAPopup", EULAPopup )
LockTable( _M )
