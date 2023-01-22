local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.Text )
	assert( f1_arg0.LeftButtonIcon )
	assert( f1_arg0.RightButtonIcon )
	local f1_local0 = 34
	local f1_local1 = CoD.TextSettings.ButtonHelperFont
	f1_arg0.Text:SetFont( f1_local1.Font )
	f1_arg0.LeftButtonIcon:SetFont( f1_local1.Font )
	f1_arg0.RightButtonIcon:SetFont( f1_local1.Font )
	if not Engine.IsConsoleGame() then
		f1_arg0.LeftButtonIcon:SetRGBFromTable( COLORS.white )
		f1_arg0.RightButtonIcon:SetRGBFromTable( COLORS.white )
	end
	f1_arg0.LeftButtonIcon:setText( ToUpperCase( Engine.Localize( "LUA_MENU_PAD_LEFT_SHOULDER_BUTTON" ) ) )
	f1_arg0.LeftButtonIcon:SetLeft( 0 )
	f1_arg0.LeftButtonIcon:SetRight( f1_local0 )
	f1_arg0.Text:setText( ToUpperCase( Engine.Localize( "MPUI_CHANGE_TEAM" ) ) )
	local f1_local2, f1_local3, f1_local4, f1_local5 = GetTextDimensions( f1_arg0.Text:getText(), f1_arg0.Text:GetCurrentFont(), 24 * _1080p )
	f1_arg0.Text:SetLeft( f1_local0 )
	f1_arg0.Text:SetRight( f1_local0 + f1_local4 )
	f1_arg0.RightButtonIcon:setText( ToUpperCase( Engine.Localize( "LUA_MENU_PAD_RIGHT_SHOULDER_BUTTON" ) ) )
	f1_arg0.RightButtonIcon:SetLeft( f1_local0 + f1_local4 )
	f1_arg0.RightButtonIcon:SetRight( f1_local0 * 2 + f1_local4 )
	if Engine.IsPC() and not CONDITIONS.IsGamepadEnabled( f1_arg0 ) then
		f1_arg0.LeftButtonIcon:SetAlpha( 0, 0 )
		f1_arg0.RightButtonIcon:SetAlpha( 0, 0 )
		local f1_local6 = 15
		assert( f1_arg0.ArrowRight )
		assert( f1_arg0.ArrowLeft )
		f1_arg0.ArrowLeft:SetLeft( f1_local0 - f1_local6 )
		f1_arg0.ArrowLeft:SetRight( f1_local0 )
		f1_arg0.ArrowLeft:SetAlpha( 1, 0 )
		f1_arg0.ArrowRight:SetLeft( f1_local4 + f1_local0 )
		f1_arg0.ArrowRight:SetRight( f1_local4 + f1_local0 + f1_local6 )
		f1_arg0.ArrowRight:SetAlpha( 1, 0 )
	end
end

function ChangeTeamOrRole( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 231 * _1080p, 0, 34 * _1080p )
	self.id = "ChangeTeamOrRole"
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local LeftButtonIcon = nil
	
	LeftButtonIcon = LUI.UIText.new()
	LeftButtonIcon.id = "LeftButtonIcon"
	LeftButtonIcon:setText( Engine.Localize( "MENU_NEW" ), 0 )
	LeftButtonIcon:SetFontSize( 24 * _1080p )
	LeftButtonIcon:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	LeftButtonIcon:SetAlignment( LUI.Alignment.Center )
	LeftButtonIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1, _1080p * 43, _1080p * 5, _1080p * 29 )
	self:addElement( LeftButtonIcon )
	self.LeftButtonIcon = LeftButtonIcon
	
	local Text = nil
	
	Text = LUI.UIText.new()
	Text.id = "Text"
	Text:SetRGBFromInt( 8618883, 0 )
	Text:setText( Engine.Localize( "MENU_NEW" ), 0 )
	Text:SetFontSize( 24 * _1080p )
	Text:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Text:SetAlignment( LUI.Alignment.Center )
	Text:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 43, _1080p * 186.5, _1080p * 5, _1080p * 29 )
	self:addElement( Text )
	self.Text = Text
	
	local RightButtonIcon = nil
	
	RightButtonIcon = LUI.UIText.new()
	RightButtonIcon.id = "RightButtonIcon"
	RightButtonIcon:setText( Engine.Localize( "MENU_NEW" ), 0 )
	RightButtonIcon:SetFontSize( 24 * _1080p )
	RightButtonIcon:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	RightButtonIcon:SetAlignment( LUI.Alignment.Center )
	RightButtonIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 186.5, _1080p * 230.5, _1080p * 5, _1080p * 29 )
	self:addElement( RightButtonIcon )
	self.RightButtonIcon = RightButtonIcon
	
	local f2_local6 = nil
	if not CONDITIONS.IsGamepadEnabled( self ) then
		f2_local6 = MenuBuilder.BuildRegisteredType( "ArrowRightClick", {
			controllerIndex = f2_local1
		} )
		f2_local6.id = "ArrowRight"
		f2_local6:SetAlpha( 0, 0 )
		f2_local6:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 230.5, _1080p * 264.5, _1080p * -10, _1080p * 47 )
		self:addElement( f2_local6 )
		self.ArrowRight = f2_local6
	end
	local f2_local7 = nil
	if not CONDITIONS.IsGamepadEnabled( self ) then
		f2_local7 = MenuBuilder.BuildRegisteredType( "ArrowLeftClick", {
			controllerIndex = f2_local1
		} )
		f2_local7.id = "ArrowLeft"
		f2_local7:SetAlpha( 0, 0 )
		f2_local7:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -33, 0, _1080p * -10, _1080p * 47 )
		self:addElement( f2_local7 )
		self.ArrowLeft = f2_local7
	end
	f0_local0( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "ChangeTeamOrRole", ChangeTeamOrRole )
LockTable( _M )
