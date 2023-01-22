local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = f1_arg2.itemName
	local f1_local1 = f1_arg2.itemUnlockLevel
	local f1_local2 = f1_arg2.confirmAction
	f1_arg0.Message:setText( Engine.Localize( Engine.Localize( "PRESTIGE_PERMANENTT_UNLOCKS_CONFIRM", f1_local0 ) ) )
	if f1_local1 then
		f1_arg0.PermanentUnlockItemUnlockInfo.UnlockDesc:setText( Engine.Localize( "PRESTIGE_UNLOCKS_AT", Rank.GetRankDisplay( f1_local1 ) ) )
	else
		f1_arg0.PermanentUnlockItemUnlockInfo.UnlockDesc:setText( "" )
		f1_arg0.PermanentUnlockItemUnlockInfo:SetAlpha( 0 )
	end
	f1_arg0.YesButton:addEventHandler( "button_action", function ( f2_arg0, f2_arg1 )
		f1_local2()
		ACTIONS.LeaveMenu( f1_arg0 )
	end )
	f1_arg0.NoButton:addEventHandler( "button_action", function ( f3_arg0, f3_arg1 )
		ACTIONS.LeaveMenu( f1_arg0 )
	end )
end

function EnterPermanentUnlockWidget( menu, controller )
	local self = LUI.UIVerticalNavigator.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 600 * _1080p, 0, 200 * _1080p )
	self.id = "EnterPermanentUnlockWidget"
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local NoButton = nil
	
	NoButton = MenuBuilder.BuildRegisteredType( "PopupButton", {
		controllerIndex = f4_local1
	} )
	NoButton.id = "NoButton"
	NoButton.Label:setText( ToUpperCase( Engine.Localize( "MENU_NO" ) ), 0 )
	NoButton.Label:SetAlignment( LUI.Alignment.Left )
	NoButton:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 600, _1080p * 170, _1080p * 200 )
	self:addElement( NoButton )
	self.NoButton = NoButton
	
	local YesButton = nil
	
	YesButton = MenuBuilder.BuildRegisteredType( "PopupButton", {
		controllerIndex = f4_local1
	} )
	YesButton.id = "YesButton"
	YesButton.Label:setText( ToUpperCase( Engine.Localize( "MENU_YES" ) ), 0 )
	YesButton.Label:SetAlignment( LUI.Alignment.Left )
	YesButton:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 600, _1080p * 134, _1080p * 164 )
	self:addElement( YesButton )
	self.YesButton = YesButton
	
	local Message = nil
	
	Message = LUI.UIText.new()
	Message.id = "Message"
	Message:setText( Engine.Localize( "PRESTIGE_PERMANENTT_UNLOCKS_CONFIRM" ), 0 )
	Message:SetFontSize( 24 * _1080p )
	Message:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Message:SetAlignment( LUI.Alignment.Left )
	Message:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 17, _1080p * 587, _1080p * 14, _1080p * 38 )
	self:addElement( Message )
	self.Message = Message
	
	local PermanentUnlockItemUnlockInfo = nil
	
	PermanentUnlockItemUnlockInfo = MenuBuilder.BuildRegisteredType( "PermanentUnlockItemUnlockInfo", {
		controllerIndex = f4_local1
	} )
	PermanentUnlockItemUnlockInfo.id = "PermanentUnlockItemUnlockInfo"
	PermanentUnlockItemUnlockInfo.UnlockDesc:setText( "", 0 )
	PermanentUnlockItemUnlockInfo:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 17, _1080p * 579, _1080p * 73, _1080p * 105 )
	self:addElement( PermanentUnlockItemUnlockInfo )
	self.PermanentUnlockItemUnlockInfo = PermanentUnlockItemUnlockInfo
	
	f0_local0( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "EnterPermanentUnlockWidget", EnterPermanentUnlockWidget )
LockTable( _M )
