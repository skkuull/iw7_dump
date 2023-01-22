local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0 )
	return string.rep( "*", string.len( f1_arg0 ) )
end

f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2 )
	f2_arg0._currentEmail = ""
	f2_arg0._currentPassword = ""
	f2_arg0.EmailButton:addEventHandler( "button_action", function ( f3_arg0, f3_arg1 )
		f3_arg0.openedKeyboard = true
		OSK.OpenScreenKeyboard( f2_arg1, Engine.Localize( "CODACCOUNT_CODA_REGISTER_EMAIL" ), f2_arg0._currentEmail, 53, false, false, false, function ( f4_arg0, f4_arg1, f4_arg2 )
			if f4_arg1 then
				f3_arg0.DynamicText:setText( f4_arg1 )
				f2_arg0._currentEmail = f4_arg1
			end
		end, CoD.KeyboardInputTypes.Email )
	end )
	f2_arg0.PasswordButton:addEventHandler( "button_action", function ( f5_arg0, f5_arg1 )
		f5_arg0.openedKeyboard = true
		OSK.OpenScreenKeyboard( f2_arg1, Engine.Localize( "CODACCOUNT_CODA_REGISTER_PASSWORD" ), "", 32, false, false, false, function ( f6_arg0, f6_arg1, f6_arg2 )
			if f6_arg1 then
				f5_arg0.DynamicText:setText( f0_local0( f6_arg1 ) )
				f2_arg0._currentPassword = f6_arg1
			end
		end, CoD.KeyboardInputTypes.Password )
	end )
	f2_arg0.SignInButton:addEventHandler( "button_action", function ( f7_arg0, f7_arg1 )
		CoDAccount.StartAccountRetrivalWithEmail( f2_arg1, f2_arg0._currentEmail, f2_arg0._currentPassword )
		LUI.FlowManager.RequestPopupMenu( f2_arg0, "CODAccountSuccessPopup", true, f2_arg1, false, {
			controllerIndex = f2_arg1
		}, nil, false )
	end )
end

function CODAccountSignIn( menu, controller )
	local self = LUI.UIVerticalNavigator.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 750 * _1080p, 0, 250 * _1080p )
	self.id = "CODAccountSignIn"
	local f8_local1 = controller and controller.controllerIndex
	if not f8_local1 and not Engine.InFrontend() then
		f8_local1 = self:getRootController()
	end
	assert( f8_local1 )
	local f8_local2 = self
	local Text = nil
	
	Text = LUI.UIText.new()
	Text.id = "Text"
	Text:setText( Engine.Localize( "CODACCOUNT_CODA_SIGNIN_TEXT" ), 0 )
	Text:SetFontSize( 22 * _1080p )
	Text:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Text:SetAlignment( LUI.Alignment.Left )
	Text:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 16, _1080p * -16, _1080p * 18, _1080p * 40 )
	self:addElement( Text )
	self.Text = Text
	
	local SignInButton = nil
	
	SignInButton = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f8_local1
	} )
	SignInButton.id = "SignInButton"
	SignInButton.Text:setText( ToUpperCase( Engine.Localize( "CODACCOUNT_CODA_SIGNIN_CONFIRM" ) ), 0 )
	SignInButton:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 16, _1080p * 16, _1080p * 205, _1080p * 235 )
	self:addElement( SignInButton )
	self.SignInButton = SignInButton
	
	local EmailButton = nil
	
	EmailButton = MenuBuilder.BuildRegisteredType( "GenericDualLabelButton", {
		controllerIndex = f8_local1
	} )
	EmailButton.id = "EmailButton"
	EmailButton.Text:setText( ToUpperCase( Engine.Localize( "CODACCOUNT_CODA_REGISTER_EMAIL" ) ), 0 )
	EmailButton.DynamicText:setText( "", 0 )
	EmailButton:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 16, _1080p * 16, _1080p * 135, _1080p * 165 )
	self:addElement( EmailButton )
	self.EmailButton = EmailButton
	
	local PasswordButton = nil
	
	PasswordButton = MenuBuilder.BuildRegisteredType( "GenericDualLabelButton", {
		controllerIndex = f8_local1
	} )
	PasswordButton.id = "PasswordButton"
	PasswordButton.Text:setText( ToUpperCase( Engine.Localize( "CODACCOUNT_CODA_REGISTER_PASSWORD" ) ), 0 )
	PasswordButton.DynamicText:setText( "", 0 )
	PasswordButton:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 16, _1080p * 16, _1080p * 170, _1080p * 200 )
	self:addElement( PasswordButton )
	self.PasswordButton = PasswordButton
	
	SignInButton:addEventHandler( "button_action", function ( f9_arg0, f9_arg1 )
		local f9_local0 = f9_arg1.controller or f8_local1
		ACTIONS.LeaveMenu( self )
	end )
	f0_local1( self, f8_local1, controller )
	return self
end

MenuBuilder.registerType( "CODAccountSignIn", CODAccountSignIn )
LockTable( _M )
