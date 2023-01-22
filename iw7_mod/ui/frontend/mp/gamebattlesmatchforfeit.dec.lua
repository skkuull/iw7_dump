local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ExitPopup( f1_arg0, f1_arg1 )
	MLG.ResetGameBattleSchedule( f1_arg1.controller )
	LUI.FlowManager.RequestLeaveMenu( f1_arg0 )
end

f0_local0 = function ( f2_arg0, f2_arg1, f2_arg2 )
	f2_arg0.DateLabel:setText( f2_arg2.currentDateTime )
	f2_arg0.MyTeamLabel:setText( f2_arg2.winningTeamName .. " [" .. f2_arg2.winningTeamId .. "]" )
	f2_arg0.ForfeitInfo:setText( Engine.Localize( "MLG_GAMEBATTLES_FORFEIT_TEAM_ABSENT", f2_arg2.forfeitTeamName .. " [" .. f2_arg2.forfeitTeamId .. "]", f2_arg2.matchID ) )
	local self = LUI.UIBindButton.new()
	self.id = "GameBattlesMatchForfeit_id"
	self:registerEventHandler( "button_secondary", ExitPopup )
	f2_arg0:addElement( self )
	f2_arg0.PopupButton:addEventHandler( "button_down", ExitPopup )
end

function GameBattlesMatchForfeit( menu, controller )
	local self = LUI.UIVerticalNavigator.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 800 * _1080p, 0, 388 * _1080p )
	self.id = "GameBattlesMatchForfeit"
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local ForfeitInfo = nil
	
	ForfeitInfo = LUI.UIText.new()
	ForfeitInfo.id = "ForfeitInfo"
	ForfeitInfo:setText( Engine.Localize( "MLG_GAMEBATTLES_FORFEIT_TEAM_ABSENT" ), 0 )
	ForfeitInfo:SetFontSize( 24 * _1080p )
	ForfeitInfo:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ForfeitInfo:SetAlignment( LUI.Alignment.Left )
	ForfeitInfo:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 28.5, _1080p * 781, _1080p * 136, _1080p * 160 )
	self:addElement( ForfeitInfo )
	self.ForfeitInfo = ForfeitInfo
	
	local DateLabel = nil
	
	DateLabel = LUI.UIText.new()
	DateLabel.id = "DateLabel"
	DateLabel:setText( "11/30/2016 16:32", 0 )
	DateLabel:SetFontSize( 45 * _1080p )
	DateLabel:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	DateLabel:SetAlignment( LUI.Alignment.Center )
	DateLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 28.5, _1080p * 781, _1080p * 20.5, _1080p * 65.5 )
	self:addElement( DateLabel )
	self.DateLabel = DateLabel
	
	local MyTeamLabel = nil
	
	MyTeamLabel = LUI.UIText.new()
	MyTeamLabel.id = "MyTeamLabel"
	MyTeamLabel:setText( "TEAM SOLOMID", 0 )
	MyTeamLabel:SetFontSize( 30 * _1080p )
	MyTeamLabel:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	MyTeamLabel:SetAlignment( LUI.Alignment.Center )
	MyTeamLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 19, _1080p * 781, _1080p * 73.5, _1080p * 103.5 )
	self:addElement( MyTeamLabel )
	self.MyTeamLabel = MyTeamLabel
	
	local PopupButton = nil
	
	PopupButton = MenuBuilder.BuildRegisteredType( "PopupButton", {
		controllerIndex = f3_local1
	} )
	PopupButton.id = "PopupButton"
	PopupButton.Label:setText( ToUpperCase( Engine.Localize( "MENU_CONTINUE" ) ), 0 )
	PopupButton.Label:SetAlignment( LUI.Alignment.Left )
	PopupButton:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 28.5, _1080p * 428.5, _1080p * 336, _1080p * 366 )
	self:addElement( PopupButton )
	self.PopupButton = PopupButton
	
	f0_local0( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "GameBattlesMatchForfeit", GameBattlesMatchForfeit )
LockTable( _M )
