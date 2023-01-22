local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0 )
	f1_arg0.SetData = function ( f2_arg0, f2_arg1 )
		assert( f2_arg1.numWins )
		assert( f2_arg1.currentWinStreak )
		assert( f2_arg1.kdRatio )
		assert( f2_arg1.winLossRatio )
		f2_arg0.Wins.Value:setText( f2_arg1.numWins )
		f2_arg0.Streak.Value:setText( f2_arg1.currentWinStreak )
		f2_arg0.KD.Value:setText( string.format( "%.3f", f2_arg1.kdRatio ) )
		f2_arg0.WinLoss.Value:setText( string.format( "%.3f", f2_arg1.winLossRatio ) )
	end
	
end

function LobbyMemberStats( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 418 * _1080p, 0, 132 * _1080p )
	self.id = "LobbyMemberStats"
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local Wins = nil
	
	Wins = MenuBuilder.BuildRegisteredType( "LobbyMemberStat", {
		controllerIndex = f3_local1
	} )
	Wins.id = "Wins"
	Wins.Title:setText( Engine.Localize( "LUA_MENU_WINS" ), 0 )
	Wins:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 30 )
	self:addElement( Wins )
	self.Wins = Wins
	
	local Streak = nil
	
	Streak = MenuBuilder.BuildRegisteredType( "LobbyMemberStat", {
		controllerIndex = f3_local1
	} )
	Streak.id = "Streak"
	Streak.Title:setText( Engine.Localize( "MP_FRONTEND_ONLY_WIN_STREAK" ), 0 )
	Streak:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 34, _1080p * 64 )
	self:addElement( Streak )
	self.Streak = Streak
	
	local WinLoss = nil
	
	WinLoss = MenuBuilder.BuildRegisteredType( "LobbyMemberStat", {
		controllerIndex = f3_local1
	} )
	WinLoss.id = "WinLoss"
	WinLoss.Title:setText( Engine.Localize( "MENU_WLRATIO" ), 0 )
	WinLoss:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 68, _1080p * 98 )
	self:addElement( WinLoss )
	self.WinLoss = WinLoss
	
	local KD = nil
	
	KD = MenuBuilder.BuildRegisteredType( "LobbyMemberStat", {
		controllerIndex = f3_local1
	} )
	KD.id = "KD"
	KD.Title:setText( Engine.Localize( "LUA_MENU_KD_RATIO" ), 0 )
	KD:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 102, _1080p * 132 )
	self:addElement( KD )
	self.KD = KD
	
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "LobbyMemberStats", LobbyMemberStats )
LockTable( _M )
