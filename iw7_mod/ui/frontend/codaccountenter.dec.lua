local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	Engine.SetPlayerDataEx( f1_arg1, CoD.StatsGroup.Common, "CODAccountSignupRequest", true )
	f1_arg0.ConnectButton:addEventHandler( "button_action", function ( f2_arg0, f2_arg1 )
		LUI.FlowManager.RequestPopupMenu( f1_arg0, "CODAccountSignInPopup", true, f1_arg1, true, {
			controllerIndex = f1_arg1
		}, nil, false )
	end )
	f1_arg0.NewAccountButton:addEventHandler( "button_action", function ( f3_arg0, f3_arg1 )
		LUI.FlowManager.RequestAddMenu( "CODAccountRegistration", true, f1_arg1, true, {} )
	end )
end

function CODAccountEnter( menu, controller )
	local self = LUI.UIVerticalNavigator.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 750 * _1080p, 0, 250 * _1080p )
	self.id = "CODAccountEnter"
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local Text = nil
	
	Text = LUI.UIText.new()
	Text.id = "Text"
	Text:setText( Engine.Localize( "CODACCOUNT_CODA_MARKETING" ), 0 )
	Text:SetFontSize( 22 * _1080p )
	Text:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Text:SetAlignment( LUI.Alignment.Left )
	Text:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 16, _1080p * -16, _1080p * 18, _1080p * 40 )
	self:addElement( Text )
	self.Text = Text
	
	local ConnectButton = nil
	
	ConnectButton = MenuBuilder.BuildRegisteredType( "PopupButton", {
		controllerIndex = f4_local1
	} )
	ConnectButton.id = "ConnectButton"
	ConnectButton.Label:setText( ToUpperCase( Engine.Localize( "CODACCOUNT_CODA_SIGNIN_CONFIRM" ) ), 0 )
	ConnectButton.Label:SetAlignment( LUI.Alignment.Left )
	ConnectButton:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 16, _1080p * -16, _1080p * 135, _1080p * 165 )
	self:addElement( ConnectButton )
	self.ConnectButton = ConnectButton
	
	local NewAccountButton = nil
	
	NewAccountButton = MenuBuilder.BuildRegisteredType( "PopupButton", {
		controllerIndex = f4_local1
	} )
	NewAccountButton.id = "NewAccountButton"
	NewAccountButton.Label:setText( ToUpperCase( Engine.Localize( "CODACCOUNT_CODA_CREATE_ACCOUNT" ) ), 0 )
	NewAccountButton.Label:SetAlignment( LUI.Alignment.Left )
	NewAccountButton:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 16, _1080p * -16, _1080p * 170, _1080p * 200 )
	self:addElement( NewAccountButton )
	self.NewAccountButton = NewAccountButton
	
	local SkipButton = nil
	
	SkipButton = MenuBuilder.BuildRegisteredType( "PopupButton", {
		controllerIndex = f4_local1
	} )
	SkipButton.id = "SkipButton"
	SkipButton.Label:setText( ToUpperCase( Engine.Localize( "CODACCOUNT_CODA_SKIP" ) ), 0 )
	SkipButton.Label:SetAlignment( LUI.Alignment.Left )
	SkipButton:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 16, _1080p * -16, _1080p * 205, _1080p * 235 )
	self:addElement( SkipButton )
	self.SkipButton = SkipButton
	
	SkipButton:addEventHandler( "button_action", function ( f5_arg0, f5_arg1 )
		local f5_local0 = f5_arg1.controller or f4_local1
		ACTIONS.LeaveMenu( self )
	end )
	f0_local0( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "CODAccountEnter", CODAccountEnter )
LockTable( _M )
