local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ExitPopup( f1_arg0, f1_arg1 )
	Engine.SetDvarBool( "cg_mlg_gamebattles_match", false )
	LUI.FlowManager.RequestLeaveMenu( f1_arg0 )
end

f0_local0 = function ( f2_arg0, f2_arg1, f2_arg2 )
	local f2_local0 = DataSources.frontEnd.primaryPlayerUserName:GetValue( f2_arg1 )
	if f2_local0 == nil or f2_local0 == "" then
		f2_local0 = ToUpperCase( Engine.Localize( "XBOXLIVE_NOTSIGNEDIN" ), 0 )
	else
		f2_local0 = Engine.MarkLocalized( f2_local0 )
	end
	f2_arg0.TextBoxTitle:setText( Engine.LocalizeLong( "PLATFORM_GAMEBATTLES_REGISTER_POPUP", f2_local0 ) )
	f2_arg0.PopupButton:registerEventHandler( "button_down", ExitPopup )
	local self = LUI.UIBindButton.new()
	self.id = "GameBattlesUnregisteredUserPopup_id"
	self:registerEventHandler( "button_secondary", ExitPopup )
	f2_arg0:addElement( self )
end

function GameBattlesUnregisteredUserPopup( menu, controller )
	local self = LUI.UIVerticalNavigator.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 800 * _1080p, 0, 659 * _1080p )
	self.id = "GameBattlesUnregisteredUserPopup"
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local TextBoxTitle = nil
	
	TextBoxTitle = LUI.UIText.new()
	TextBoxTitle.id = "TextBoxTitle"
	TextBoxTitle:setText( Engine.Localize( "PLATFORM_GAMEBATTLES_REGISTER_POPUP" ), 0 )
	TextBoxTitle:SetFontSize( 24 * _1080p )
	TextBoxTitle:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	TextBoxTitle:SetAlignment( LUI.Alignment.Left )
	TextBoxTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 23, _1080p * 768.5, _1080p * 28.5, _1080p * 52.5 )
	self:addElement( TextBoxTitle )
	self.TextBoxTitle = TextBoxTitle
	
	local PopupButton = nil
	
	PopupButton = MenuBuilder.BuildRegisteredType( "PopupButton", {
		controllerIndex = f3_local1
	} )
	PopupButton.id = "PopupButton"
	PopupButton.Label:setText( ToUpperCase( Engine.Localize( "MENU_EXIT" ) ), 0 )
	PopupButton.Label:SetAlignment( LUI.Alignment.Left )
	PopupButton:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 800, _1080p * 625, _1080p * 655 )
	self:addElement( PopupButton )
	self.PopupButton = PopupButton
	
	local CallingCardRegisteredToGamebattles = nil
	
	CallingCardRegisteredToGamebattles = MenuBuilder.BuildRegisteredType( "CallingCardImage", {
		controllerIndex = f3_local1
	} )
	CallingCardRegisteredToGamebattles.id = "CallingCardRegisteredToGamebattles"
	CallingCardRegisteredToGamebattles.CallingCardTexture:setImage( RegisterMaterial( "ui_playercard_696" ), 0 )
	CallingCardRegisteredToGamebattles:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 157, _1080p * 643, _1080p * 399, _1080p * 590 )
	self:addElement( CallingCardRegisteredToGamebattles )
	self.CallingCardRegisteredToGamebattles = CallingCardRegisteredToGamebattles
	
	f0_local0( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "GameBattlesUnregisteredUserPopup", GameBattlesUnregisteredUserPopup )
LockTable( _M )
