local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ExitPopup( f1_arg0, f1_arg1 )
	LUI.FlowManager.RequestLeaveMenu( f1_arg0 )
end

function Discard( f2_arg0, f2_arg1 )
	LUI.FlowManager.RequestLeaveMenu( f2_arg0 )
	LUI.FlowManager.RequestLeaveMenuByName( "EmblemEditorMenu" )
end

function SaveEmblem( f3_arg0 )
	return function ( f4_arg0, f4_arg1 )
		EmblemEditor.UploadEmblem( f4_arg1.controller, EmblemEditorUtils.SelectedEmblem, f3_arg0:getText() )
		LUI.FlowManager.RequestLeaveMenu( f4_arg0 )
		LUI.FlowManager.RequestLeaveMenuByName( "EmblemEditorMenu" )
	end
	
end

function SaveAndApplyEmblem( f5_arg0 )
	return function ( f6_arg0, f6_arg1 )
		local f6_local0 = EmblemEditor.UploadEmblem( f6_arg1.controller, EmblemEditorUtils.SelectedEmblem, f5_arg0:getText() )
		if f6_local0 then
			EmblemEditor.EquipEmblem( f6_arg1.controller, f6_local0 )
		end
		LUI.FlowManager.RequestLeaveMenu( f6_arg0 )
		LUI.FlowManager.RequestLeaveMenuByName( "EmblemEditorMenu" )
	end
	
end

function UpdateConfirmButton( f7_arg0, f7_arg1 )
	f7_arg0.SaveButton:SetButtonDisabled( false )
end

f0_local0 = function ( f8_arg0, f8_arg1, f8_arg2 )
	local f8_local0 = nil
	f8_arg0.PopupFrame.Title:setText( Engine.Localize( "MP_EMBLEM_EDITOR_SAVE_EMBLEM_POPUP_TITLE" ) )
	f8_arg0.Message:setText( Engine.Localize( "MP_EMBLEM_EDITOR_SAVE_EMBLEM_POPUP_MESSAGE" ), 0 )
	f8_local0 = Engine.Localize( "MP_EMBLEM_EDITOR_DEFAULT_EMBLEM_NAME" )
	local self = f8_arg0.EmblemName.Text
	local f8_local2 = self
	self = self.setText
	if f8_arg2.emblemName ~= nil then
		local f8_local3 = f8_arg2.emblemName
		local f8_local4 = f8_arg2.emblemName
	end
	self( f8_local2, f8_local3 and f8_local4 or f8_local0 )
	f8_arg0.CancelButton:registerEventHandler( "button_down", Discard )
	f8_arg0.SaveButton:registerEventHandler( "button_down", SaveEmblem( f8_arg0.EmblemName.Text ) )
	f8_arg0.SaveAndApplyButton:registerEventHandler( "button_down", SaveAndApplyEmblem( f8_arg0.EmblemName.Text ) )
	self = LUI.UIBindButton.new()
	self.id = "EmblemEditorSavePopup_id"
	self:registerEventHandler( "button_secondary", ExitPopup )
	f8_arg0:addElement( self )
	f8_local2 = f8_arg0.EmblemName.Text:getText()
	local f8_local5 = f8_arg0.SaveButton
	local f8_local6 = f8_local5
	f8_local5 = f8_local5.SetButtonDisabled
	local f8_local7
	if f8_local2 ~= nil and f8_local2 ~= "" then
		f8_local7 = false
	else
		f8_local7 = true
	end
	f8_local5( f8_local6, f8_local7 )
	f8_arg0:registerEventHandler( "emblemName_updated", UpdateConfirmButton )
	f8_arg0.EmblemPreview:SetupEmblem()
end

function EmblemEditorSavePopup( menu, controller )
	local self = LUI.UIVerticalNavigator.new()
	self.id = "EmblemEditorSavePopup"
	local f9_local1 = controller and controller.controllerIndex
	if not f9_local1 and not Engine.InFrontend() then
		f9_local1 = self:getRootController()
	end
	assert( f9_local1 )
	self:playSound( "menu_open" )
	local f9_local2 = self
	local PopupFrame = nil
	
	PopupFrame = MenuBuilder.BuildRegisteredType( "PopupFrame", {
		controllerIndex = f9_local1
	} )
	PopupFrame.id = "PopupFrame"
	PopupFrame.Title:setText( Engine.Localize( "MENU_NEW" ), 0 )
	PopupFrame:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 600, _1080p * 1320, _1080p * 331, _1080p * 860 )
	self:addElement( PopupFrame )
	self.PopupFrame = PopupFrame
	
	local bg = nil
	
	bg = LUI.UIImage.new()
	bg.id = "bg"
	bg:SetAlpha( 0.1, 0 )
	bg:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 600, _1080p * 1320, _1080p * 689.5, _1080p * 739.5 )
	self:addElement( bg )
	self.bg = bg
	
	local BorderBox = nil
	
	BorderBox = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 2,
		borderThicknessRight = _1080p * 2,
		borderThicknessTop = _1080p * 2,
		borderThicknessBottom = _1080p * 2
	} )
	BorderBox.id = "BorderBox"
	BorderBox:SetAlpha( 0.5, 0 )
	BorderBox:SetBorderThicknessLeft( _1080p * 2, 0 )
	BorderBox:SetBorderThicknessRight( _1080p * 2, 0 )
	BorderBox:SetBorderThicknessTop( _1080p * 2, 0 )
	BorderBox:SetBorderThicknessBottom( _1080p * 2, 0 )
	BorderBox:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 600, _1080p * -600, _1080p * 689.5, _1080p * -340.5 )
	self:addElement( BorderBox )
	self.BorderBox = BorderBox
	
	local EmblemName = nil
	
	EmblemName = MenuBuilder.BuildRegisteredType( "EmblemNameTextBox", {
		controllerIndex = f9_local1
	} )
	EmblemName.id = "EmblemName"
	EmblemName:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 600, _1080p * 1320, _1080p * 689.5, _1080p * 739.5 )
	self:addElement( EmblemName )
	self.EmblemName = EmblemName
	
	local TitleLabel = nil
	
	TitleLabel = LUI.UIText.new()
	TitleLabel.id = "TitleLabel"
	TitleLabel:setText( Engine.Localize( "MP_EMBLEM_EDITOR_EMBLEM_TITLE" ), 0 )
	TitleLabel:SetFontSize( 34 * _1080p )
	TitleLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	TitleLabel:SetAlignment( LUI.Alignment.Left )
	TitleLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 600, _1080p * 1270, _1080p * 654.5, _1080p * 688.5 )
	self:addElement( TitleLabel )
	self.TitleLabel = TitleLabel
	
	local Message = nil
	
	Message = LUI.UIText.new()
	Message.id = "Message"
	Message:setText( "MP_EMBLEM_EDITOR_SAVE_POPUP_MESSAGE", 0 )
	Message:SetFontSize( 22 * _1080p )
	Message:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Message:SetAlignment( LUI.Alignment.Center )
	Message:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 625, _1080p * 1298, _1080p * 350.5, _1080p * 372.5 )
	self:addElement( Message )
	self.Message = Message
	
	local EmblemPreview = nil
	
	EmblemPreview = LUI.UIImage.new()
	EmblemPreview.id = "EmblemPreview"
	EmblemPreview:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 830, _1080p * 1090, _1080p * 389, _1080p * 649 )
	self:addElement( EmblemPreview )
	self.EmblemPreview = EmblemPreview
	
	local SaveButton = nil
	
	SaveButton = MenuBuilder.BuildRegisteredType( "PopupButton", {
		controllerIndex = f9_local1
	} )
	SaveButton.id = "SaveButton"
	SaveButton.Label:setText( ToUpperCase( Engine.Localize( "MP_EMBLEM_EDITOR_SAVE" ) ), 0 )
	SaveButton.Label:SetAlignment( LUI.Alignment.Left )
	SaveButton:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -360, _1080p * 360, _1080p * 750, _1080p * 780 )
	self:addElement( SaveButton )
	self.SaveButton = SaveButton
	
	local SaveAndApplyButton = nil
	
	SaveAndApplyButton = MenuBuilder.BuildRegisteredType( "PopupButton", {
		controllerIndex = f9_local1
	} )
	SaveAndApplyButton.id = "SaveAndApplyButton"
	SaveAndApplyButton.Label:setText( ToUpperCase( Engine.Localize( "MP_EMBLEM_EDITOR_SAVE_AND_APPLY" ) ), 0 )
	SaveAndApplyButton.Label:SetAlignment( LUI.Alignment.Left )
	SaveAndApplyButton:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -360, _1080p * 360, _1080p * 790, _1080p * 820 )
	self:addElement( SaveAndApplyButton )
	self.SaveAndApplyButton = SaveAndApplyButton
	
	local CancelButton = nil
	
	CancelButton = MenuBuilder.BuildRegisteredType( "PopupButton", {
		controllerIndex = f9_local1
	} )
	CancelButton.id = "CancelButton"
	CancelButton.Label:setText( ToUpperCase( Engine.Localize( "MP_EMBLEM_EDITOR_DISCARD" ) ), 0 )
	CancelButton.Label:SetAlignment( LUI.Alignment.Left )
	CancelButton:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -360, _1080p * 360, _1080p * 830, _1080p * 860 )
	self:addElement( CancelButton )
	self.CancelButton = CancelButton
	
	CancelButton:addEventHandler( "button_action", function ( f10_arg0, f10_arg1 )
		local f10_local0 = f10_arg1.controller or f9_local1
		ACTIONS.LeaveMenu( self )
	end )
	f0_local0( self, f9_local1, controller )
	return self
end

MenuBuilder.registerType( "EmblemEditorSavePopup", EmblemEditorSavePopup )
LockTable( _M )
