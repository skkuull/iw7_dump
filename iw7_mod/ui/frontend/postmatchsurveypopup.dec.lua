local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.Button1 )
	assert( f1_arg0.Button2 )
	assert( f1_arg0.Button3 )
	f1_arg0.buttonOrder = f1_arg2.buttonOrder
	f1_arg0.isQuitter = f1_arg2.isQuitter
	f1_arg0.Button1.Label:setText( f1_arg2.label1 )
	f1_arg0.Button1:addEventHandler( "button_action", function ( f2_arg0, f2_arg1 )
		f1_arg2.action1( f2_arg1.controller, f1_arg2.buttonOrder, f1_arg2.isQuitter )
		ACTIONS.LeaveMenu( f1_arg0 )
	end )
	f1_arg0.Button2.Label:setText( f1_arg2.label2 )
	f1_arg0.Button2:addEventHandler( "button_action", function ( f3_arg0, f3_arg1 )
		f1_arg2.action2( f3_arg1.controller, f1_arg2.buttonOrder, f1_arg2.isQuitter )
		ACTIONS.LeaveMenu( f1_arg0 )
	end )
	f1_arg0.Button3.Label:setText( f1_arg2.label3 )
	f1_arg0.Button3:addEventHandler( "button_action", function ( f4_arg0, f4_arg1 )
		f1_arg2.action3( f4_arg1.controller, f1_arg2.buttonOrder, f1_arg2.isQuitter )
		ACTIONS.LeaveMenu( f1_arg0 )
	end )
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	f1_arg0:addElement( bindButton )
	f1_arg0.bindButton = bindButton
	
	f1_arg0.bindButton:addEventHandler( "button_secondary", function ( f5_arg0, f5_arg1 )
		SURVEY.PostGameSurveyBackButtonPressed( f5_arg1.controller or f1_arg1, f1_arg0.buttonOrder, f1_arg0.isQuitter )
		ACTIONS.LeaveMenu( f1_arg0 )
	end )
end

function PostMatchSurveyPopup( menu, controller )
	local self = LUI.UIVerticalNavigator.new()
	self.id = "PostMatchSurveyPopup"
	local f6_local1 = controller and controller.controllerIndex
	if not f6_local1 and not Engine.InFrontend() then
		f6_local1 = self:getRootController()
	end
	assert( f6_local1 )
	self:playSound( "menu_open" )
	local f6_local2 = self
	local PopupFrame = nil
	
	PopupFrame = MenuBuilder.BuildRegisteredType( "PopupFrame", {
		controllerIndex = f6_local1
	} )
	PopupFrame.id = "PopupFrame"
	PopupFrame.Title:setText( Engine.Localize( "LUA_MENU_SURVEY_POST_MATCH_TITLE" ), 0 )
	PopupFrame:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -450, _1080p * 450, _1080p * -100, _1080p * 140 )
	self:addElement( PopupFrame )
	self.PopupFrame = PopupFrame
	
	local Button1 = nil
	
	Button1 = MenuBuilder.BuildRegisteredType( "PopupButton", {
		controllerIndex = f6_local1
	} )
	Button1.id = "Button1"
	Button1.Label:setText( ToUpperCase( "" ), 0 )
	Button1.Label:SetAlignment( LUI.Alignment.Left )
	Button1:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -450, _1080p * 450, _1080p * 578, _1080p * 608 )
	self:addElement( Button1 )
	self.Button1 = Button1
	
	local Button2 = nil
	
	Button2 = MenuBuilder.BuildRegisteredType( "PopupButton", {
		controllerIndex = f6_local1
	} )
	Button2.id = "Button2"
	Button2.Label:setText( ToUpperCase( "" ), 0 )
	Button2.Label:SetAlignment( LUI.Alignment.Left )
	Button2:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -450, _1080p * 450, _1080p * 614, _1080p * 644 )
	self:addElement( Button2 )
	self.Button2 = Button2
	
	local Button3 = nil
	
	Button3 = MenuBuilder.BuildRegisteredType( "PopupButton", {
		controllerIndex = f6_local1
	} )
	Button3.id = "Button3"
	Button3.Label:setText( ToUpperCase( "" ), 0 )
	Button3.Label:SetAlignment( LUI.Alignment.Left )
	Button3:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -450, _1080p * 450, _1080p * 650, _1080p * 680 )
	self:addElement( Button3 )
	self.Button3 = Button3
	
	local Message = nil
	
	Message = LUI.UIText.new()
	Message.id = "Message"
	Message:setText( Engine.Localize( "LUA_MENU_SURVEY_POST_MATCH_MESSAGE" ), 0 )
	Message:SetFontSize( 24 * _1080p )
	Message:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Message:SetAlignment( LUI.Alignment.Left )
	Message:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -400, _1080p * 400, _1080p * 465, _1080p * 489 )
	self:addElement( Message )
	self.Message = Message
	
	f0_local0( self, f6_local1, controller )
	return self
end

MenuBuilder.registerType( "PostMatchSurveyPopup", PostMatchSurveyPopup )
LockTable( _M )
