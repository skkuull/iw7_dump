local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ExitPopupAccept( f1_arg0, f1_arg1 )
	local f1_local0 = Engine.GetFirstActiveController()
	Engine.SaveChallengeAsDone( f1_local0, "commonData.registeredToGamebattles" )
	local f1_local1 = Engine.TableLookupGetRowNum( CSV.callingCardUnlockTable.file, CSV.callingCardUnlockTable.cols.ref, "register_gamebattles" )
	if f1_local1 and f1_local1 >= 0 then
		Rewards.SetNew( f1_local0, "callingCard", f1_local1, false )
	end
	ACTIONS.UploadStats( f1_arg0, f1_local0 )
	LUI.FlowManager.RequestLeaveMenu( f1_arg0 )
	OpenGameBattlesLobby( f1_local0 )
end

function ExitPopupCancel( f2_arg0, f2_arg1 )
	Engine.SetDvarBool( "cg_mlg_gamebattles_match", false )
	LUI.FlowManager.RequestLeaveMenu( f2_arg0 )
end

f0_local0 = function ( f3_arg0, f3_arg1, f3_arg2 )
	f3_arg0.TextBoxTitle:setText( Engine.Localize( "PLATFORM_GAMEBATTLES_FIRST_TIME_LOBBY", Engine.MarkLocalized( Lobby.GetGamertag( Engine.GetLocalClientXUID( f3_arg1 ) ) ) ) )
	f3_arg0.Acknowledge:registerEventHandler( "button_down", ExitPopupAccept )
	f3_arg0.CancelButton:registerEventHandler( "button_down", ExitPopupCancel )
	local self = LUI.UIBindButton.new()
	self.id = "GameBattlesFirstTimePopup_id"
	self:registerEventHandler( "button_secondary", ExitPopupCancel )
	f3_arg0:addElement( self )
	if Engine.IsXB3() then
		f3_arg0:removeElement( f3_arg0.ReadTOS )
		f3_arg0.Acknowledge:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 577, _1080p * 609 )
	else
		f3_arg0.ReadTOS:registerEventHandler( "button_action", function ( element, event )
			Engine.ShowWebBrowser( f3_arg1, 0, GAMEBATTLES.MLGPRivacyPolicyURL )
		end )
	end
end

function GameBattlesFirstTimePopup( menu, controller )
	local self = LUI.UIVerticalNavigator.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 900 * _1080p, 0, 650 * _1080p )
	self.id = "GameBattlesFirstTimePopup"
	local f5_local1 = controller and controller.controllerIndex
	if not f5_local1 and not Engine.InFrontend() then
		f5_local1 = self:getRootController()
	end
	assert( f5_local1 )
	local f5_local2 = self
	local TextBoxTitle = nil
	
	TextBoxTitle = LUI.UIText.new()
	TextBoxTitle.id = "TextBoxTitle"
	TextBoxTitle:setText( Engine.Localize( "PLATFORM_GAMEBATTLES_FIRST_TIME_LOBBY" ), 0 )
	TextBoxTitle:SetFontSize( 24 * _1080p )
	TextBoxTitle:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	TextBoxTitle:SetAlignment( LUI.Alignment.Left )
	TextBoxTitle:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 24, _1080p * -24, _1080p * 25, _1080p * 49 )
	self:addElement( TextBoxTitle )
	self.TextBoxTitle = TextBoxTitle
	
	local Acknowledge = nil
	
	Acknowledge = MenuBuilder.BuildRegisteredType( "PopupButton", {
		controllerIndex = f5_local1
	} )
	Acknowledge.id = "Acknowledge"
	Acknowledge.Label:setText( ToUpperCase( Engine.Localize( "MLG_GAMEBATTLES_MLGTOS_ACCEPT" ) ), 0 )
	Acknowledge.Label:SetAlignment( LUI.Alignment.Left )
	Acknowledge:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 542, _1080p * 572 )
	self:addElement( Acknowledge )
	self.Acknowledge = Acknowledge
	
	local CallingCardRegisteredToGamebattles = nil
	
	CallingCardRegisteredToGamebattles = MenuBuilder.BuildRegisteredType( "CallingCardImage", {
		controllerIndex = f5_local1
	} )
	CallingCardRegisteredToGamebattles.id = "CallingCardRegisteredToGamebattles"
	CallingCardRegisteredToGamebattles.CallingCardTexture:setImage( RegisterMaterial( "ui_playercard_696" ), 0 )
	CallingCardRegisteredToGamebattles:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -243, _1080p * 243, _1080p * 317, _1080p * 508 )
	self:addElement( CallingCardRegisteredToGamebattles )
	self.CallingCardRegisteredToGamebattles = CallingCardRegisteredToGamebattles
	
	local ReadTOS = nil
	
	ReadTOS = MenuBuilder.BuildRegisteredType( "PopupButton", {
		controllerIndex = f5_local1
	} )
	ReadTOS.id = "ReadTOS"
	ReadTOS.Label:setText( ToUpperCase( Engine.Localize( "MLG_GAMEBATTLES_MLGTOS_BUTTON" ) ), 0 )
	ReadTOS.Label:SetAlignment( LUI.Alignment.Left )
	ReadTOS:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 577, _1080p * 609 )
	self:addElement( ReadTOS )
	self.ReadTOS = ReadTOS
	
	local CancelButton = nil
	
	CancelButton = MenuBuilder.BuildRegisteredType( "PopupButton", {
		controllerIndex = f5_local1
	} )
	CancelButton.id = "CancelButton"
	CancelButton.Label:setText( ToUpperCase( Engine.Localize( "LUA_MENU_CANCEL" ) ), 0 )
	CancelButton.Label:SetAlignment( LUI.Alignment.Left )
	CancelButton:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 614, _1080p * 646 )
	self:addElement( CancelButton )
	self.CancelButton = CancelButton
	
	f0_local0( self, f5_local1, controller )
	return self
end

MenuBuilder.registerType( "GameBattlesFirstTimePopup", GameBattlesFirstTimePopup )
LockTable( _M )
