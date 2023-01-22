local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.WinButton )
	assert( f1_arg0.WinButtonComplete )
	assert( f1_arg0.WinButtonTier1 )
	assert( f1_arg0.WinButtonTier2 )
	assert( f1_arg0.WinButtonTier3 )
	assert( f1_arg0.LoseButton )
	assert( f1_arg0.LoseButtonComplete )
	assert( f1_arg0.LoseButtonTier1 )
	assert( f1_arg0.LoseButtonTier2 )
	assert( f1_arg0.LoseButtonTier3 )
	assert( f1_arg0.PlayButton )
	if f1_arg2.winAction then
		f1_arg0.WinButton:addEventHandler( "button_action", f1_arg2.winAction )
	end
	if f1_arg2.winCompleteAction then
		f1_arg0.WinButtonComplete:addEventHandler( "button_action", f1_arg2.winCompleteAction )
	end
	if f1_arg2.winTier1Action then
		f1_arg0.WinButtonTier1:addEventHandler( "button_action", f1_arg2.winTier1Action )
	end
	if f1_arg2.winTier2Action then
		f1_arg0.WinButtonTier2:addEventHandler( "button_action", f1_arg2.winTier2Action )
	end
	if f1_arg2.winTier3Action then
		f1_arg0.WinButtonTier3:addEventHandler( "button_action", f1_arg2.winTier3Action )
	end
	if f1_arg2.loseAction then
		f1_arg0.LoseButton:addEventHandler( "button_action", f1_arg2.loseAction )
	end
	if f1_arg2.loseCompleteAction then
		f1_arg0.LoseButtonComplete:addEventHandler( "button_action", f1_arg2.loseCompleteAction )
	end
	if f1_arg2.loseTier1Action then
		f1_arg0.LoseButtonTier1:addEventHandler( "button_action", f1_arg2.loseTier1Action )
	end
	if f1_arg2.loseTier2Action then
		f1_arg0.LoseButtonTier2:addEventHandler( "button_action", f1_arg2.loseTier2Action )
	end
	if f1_arg2.loseTier3Action then
		f1_arg0.LoseButtonTier3:addEventHandler( "button_action", f1_arg2.loseTier3Action )
	end
	if f1_arg2.playAction then
		f1_arg0.PlayButton:addEventHandler( "button_action", f1_arg2.playAction )
	end
end

function MatchSimOutcomeSelectorPopup( menu, controller )
	local self = LUI.UIVerticalNavigator.new()
	self.id = "MatchSimOutcomeSelectorPopup"
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	self:playSound( "menu_open" )
	local f2_local2 = self
	local GenericPopup = nil
	
	GenericPopup = MenuBuilder.BuildRegisteredType( "GenericPopup", {
		controllerIndex = f2_local1
	} )
	GenericPopup.id = "GenericPopup"
	GenericPopup:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -300, _1080p * 300, _1080p * -339.5, _1080p * 339.5 )
	self:addElement( GenericPopup )
	self.GenericPopup = GenericPopup
	
	local PointsFull = nil
	
	PointsFull = LUI.UIText.new()
	PointsFull.id = "PointsFull"
	PointsFull:setText( "Choose a match condition", 0 )
	PointsFull:SetFontSize( 36 * _1080p )
	PointsFull:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	PointsFull:SetAlignment( LUI.Alignment.Center )
	PointsFull:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -300, _1080p * 300, _1080p * -298, _1080p * -262 )
	self:addElement( PointsFull )
	self.PointsFull = PointsFull
	
	local WinButton = nil
	
	WinButton = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f2_local1
	} )
	WinButton.id = "WinButton"
	WinButton.Text:setText( "Win Game - Fail Mission", 0 )
	WinButton:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -215.5, _1080p * 215.5, _1080p * -215, _1080p * -172 )
	self:addElement( WinButton )
	self.WinButton = WinButton
	
	local WinButtonComplete = nil
	
	WinButtonComplete = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f2_local1
	} )
	WinButtonComplete.id = "WinButtonComplete"
	WinButtonComplete.Text:setText( "Win Game - Complete Mission", 0 )
	WinButtonComplete:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -215.5, _1080p * 215.5, _1080p * -172, _1080p * -129 )
	self:addElement( WinButtonComplete )
	self.WinButtonComplete = WinButtonComplete
	
	local WinButtonTier1 = nil
	
	WinButtonTier1 = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f2_local1
	} )
	WinButtonTier1.id = "WinButtonTier1"
	WinButtonTier1.Text:setText( "Win Game - Bronze", 0 )
	WinButtonTier1:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -215.5, _1080p * 215.5, _1080p * -129, _1080p * -86 )
	self:addElement( WinButtonTier1 )
	self.WinButtonTier1 = WinButtonTier1
	
	local WinButtonTier2 = nil
	
	WinButtonTier2 = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f2_local1
	} )
	WinButtonTier2.id = "WinButtonTier2"
	WinButtonTier2.Text:setText( "Win Game - Silver", 0 )
	WinButtonTier2:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -215.5, _1080p * 215.5, _1080p * -86, _1080p * -43 )
	self:addElement( WinButtonTier2 )
	self.WinButtonTier2 = WinButtonTier2
	
	local WinButtonTier3 = nil
	
	WinButtonTier3 = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f2_local1
	} )
	WinButtonTier3.id = "WinButtonTier3"
	WinButtonTier3.Text:setText( "Win Game - Gold", 0 )
	WinButtonTier3:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -215.5, _1080p * 215.5, _1080p * -43, 0 )
	self:addElement( WinButtonTier3 )
	self.WinButtonTier3 = WinButtonTier3
	
	local LoseButton = nil
	
	LoseButton = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f2_local1
	} )
	LoseButton.id = "LoseButton"
	LoseButton.Text:setText( "Lose Game - Fail Mission", 0 )
	LoseButton:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -215.5, _1080p * 215.5, 0, _1080p * 43 )
	self:addElement( LoseButton )
	self.LoseButton = LoseButton
	
	local LoseButtonComplete = nil
	
	LoseButtonComplete = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f2_local1
	} )
	LoseButtonComplete.id = "LoseButtonComplete"
	LoseButtonComplete.Text:setText( "Lose Game - Complete Mission", 0 )
	LoseButtonComplete:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -215.5, _1080p * 215.5, _1080p * 43, _1080p * 86 )
	self:addElement( LoseButtonComplete )
	self.LoseButtonComplete = LoseButtonComplete
	
	local LoseButtonTier1 = nil
	
	LoseButtonTier1 = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f2_local1
	} )
	LoseButtonTier1.id = "LoseButtonTier1"
	LoseButtonTier1.Text:setText( "Lose Game - Bronze", 0 )
	LoseButtonTier1:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -215.5, _1080p * 215.5, _1080p * 86, _1080p * 129 )
	self:addElement( LoseButtonTier1 )
	self.LoseButtonTier1 = LoseButtonTier1
	
	local LoseButtonTier2 = nil
	
	LoseButtonTier2 = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f2_local1
	} )
	LoseButtonTier2.id = "LoseButtonTier2"
	LoseButtonTier2.Text:setText( "Lose Game - Silver", 0 )
	LoseButtonTier2:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -215.5, _1080p * 215.5, _1080p * 129, _1080p * 172 )
	self:addElement( LoseButtonTier2 )
	self.LoseButtonTier2 = LoseButtonTier2
	
	local LoseButtonTier3 = nil
	
	LoseButtonTier3 = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f2_local1
	} )
	LoseButtonTier3.id = "LoseButtonTier3"
	LoseButtonTier3.Text:setText( "Lose Game - Gold", 0 )
	LoseButtonTier3:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -215.5, _1080p * 215.5, _1080p * 172, _1080p * 215 )
	self:addElement( LoseButtonTier3 )
	self.LoseButtonTier3 = LoseButtonTier3
	
	local PlayButton = nil
	
	PlayButton = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f2_local1
	} )
	PlayButton.id = "PlayButton"
	PlayButton.Text:setText( "Play Game with Bots", 0 )
	PlayButton:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -215.5, _1080p * 215.5, _1080p * 215, _1080p * 258 )
	self:addElement( PlayButton )
	self.PlayButton = PlayButton
	
	WinButton:addEventHandler( "button_action", function ( f3_arg0, f3_arg1 )
		local f3_local0 = f3_arg1.controller or f2_local1
		ACTIONS.LeaveMenu( self )
	end )
	WinButtonComplete:addEventHandler( "button_action", function ( f4_arg0, f4_arg1 )
		local f4_local0 = f4_arg1.controller or f2_local1
		ACTIONS.LeaveMenu( self )
	end )
	WinButtonTier1:addEventHandler( "button_action", function ( f5_arg0, f5_arg1 )
		local f5_local0 = f5_arg1.controller or f2_local1
		ACTIONS.LeaveMenu( self )
	end )
	WinButtonTier2:addEventHandler( "button_action", function ( f6_arg0, f6_arg1 )
		local f6_local0 = f6_arg1.controller or f2_local1
		ACTIONS.LeaveMenu( self )
	end )
	WinButtonTier3:addEventHandler( "button_action", function ( f7_arg0, f7_arg1 )
		local f7_local0 = f7_arg1.controller or f2_local1
		ACTIONS.LeaveMenu( self )
	end )
	LoseButton:addEventHandler( "button_action", function ( f8_arg0, f8_arg1 )
		local f8_local0 = f8_arg1.controller or f2_local1
		ACTIONS.LeaveMenu( self )
	end )
	LoseButtonComplete:addEventHandler( "button_action", function ( f9_arg0, f9_arg1 )
		local f9_local0 = f9_arg1.controller or f2_local1
		ACTIONS.LeaveMenu( self )
	end )
	LoseButtonTier1:addEventHandler( "button_action", function ( f10_arg0, f10_arg1 )
		local f10_local0 = f10_arg1.controller or f2_local1
		ACTIONS.LeaveMenu( self )
	end )
	LoseButtonTier2:addEventHandler( "button_action", function ( f11_arg0, f11_arg1 )
		local f11_local0 = f11_arg1.controller or f2_local1
		ACTIONS.LeaveMenu( self )
	end )
	LoseButtonTier3:addEventHandler( "button_action", function ( f12_arg0, f12_arg1 )
		local f12_local0 = f12_arg1.controller or f2_local1
		ACTIONS.LeaveMenu( self )
	end )
	PlayButton:addEventHandler( "button_action", function ( f13_arg0, f13_arg1 )
		local f13_local0 = f13_arg1.controller or f2_local1
		ACTIONS.LeaveMenu( self )
	end )
	self.addButtonHelperFunction = function ( f14_arg0, f14_arg1 )
		f14_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			clickable = true
		} )
	end
	
	self:addEventHandler( "menu_create", self.addButtonHelperFunction )
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	self.bindButton:addEventHandler( "button_secondary", function ( f15_arg0, f15_arg1 )
		local f15_local0 = f15_arg1.controller or f2_local1
		ACTIONS.LeaveMenu( self )
	end )
	f0_local0( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "MatchSimOutcomeSelectorPopup", MatchSimOutcomeSelectorPopup )
LockTable( _M )
