local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "frontEnd.mp.missions.lobby"
function PopFunc( f1_arg0, f1_arg1 )
	WipeGlobalModelsAtPath( f0_local0 )
end

function LobbyMissionButtons( menu, controller )
	local self = LUI.UIVerticalNavigator.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 600 * _1080p, 0, 643 * _1080p )
	self.id = "LobbyMissionButtons"
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local LobbyMissionVerticalLayout = nil
	
	LobbyMissionVerticalLayout = MenuBuilder.BuildRegisteredType( "LobbyMissionVerticalLayout", {
		controllerIndex = f2_local1
	} )
	LobbyMissionVerticalLayout.id = "LobbyMissionVerticalLayout"
	LobbyMissionVerticalLayout:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 600, 0, _1080p * 564 )
	self:addElement( LobbyMissionVerticalLayout )
	self.LobbyMissionVerticalLayout = LobbyMissionVerticalLayout
	
	local CRMMain = nil
	
	CRMMain = MenuBuilder.BuildRegisteredType( "CRMMain", {
		controllerIndex = f2_local1
	} )
	CRMMain.id = "CRMMain"
	CRMMain:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 6, _1080p * 317, _1080p * 529, _1080p * 723 )
	self:addElement( CRMMain )
	self.CRMMain = CRMMain
	
	if CONDITIONS.AreContractsEnabled( self ) then
		ACTIONS.AnimateSequenceByElement( self, {
			elementName = "CRMMain",
			sequenceName = "Minimize",
			elementPath = "CRMMain"
		} )
	end
	return self
end

MenuBuilder.registerType( "LobbyMissionButtons", LobbyMissionButtons )
LUI.FlowManager.RegisterStackPopBehaviour( "LobbyMissionButtons", PopFunc )
LockTable( _M )
