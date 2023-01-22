local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function LobbyMissionMatchPrep( menu, controller )
	local self = LUI.UIHorizontalNavigator.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 800 * _1080p )
	self.id = "LobbyMissionMatchPrep"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local LobbyMissionButtons = nil
	
	LobbyMissionButtons = MenuBuilder.BuildRegisteredType( "LobbyMissionButtons", {
		controllerIndex = f1_local1
	} )
	LobbyMissionButtons.id = "LobbyMissionButtons"
	LobbyMissionButtons:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 53, _1080p * 653, _1080p * 69, _1080p * 400 )
	self:addElement( LobbyMissionButtons )
	self.LobbyMissionButtons = LobbyMissionButtons
	
	local LobbyMembers = nil
	
	LobbyMembers = MenuBuilder.BuildRegisteredType( "LobbyMembers", {
		controllerIndex = f1_local1
	} )
	LobbyMembers.id = "LobbyMembers"
	LobbyMembers:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -700, 0, _1080p * 59, _1080p * 703 )
	self:addElement( LobbyMembers )
	self.LobbyMembers = LobbyMembers
	
	return self
end

MenuBuilder.registerType( "LobbyMissionMatchPrep", LobbyMissionMatchPrep )
LockTable( _M )
