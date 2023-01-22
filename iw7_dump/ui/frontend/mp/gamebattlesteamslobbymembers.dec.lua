local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0.LobbyMembersAllies.List:SetGridDataSource( DataSources.alwaysLoaded.activeParty.teamAllies.members )
	f1_arg0.LobbyMembersAxis.List:SetGridDataSource( DataSources.alwaysLoaded.activeParty.teamAxis.members )
	f1_arg0.LobbyMembersCodcasters.List:SetGridDataSource( DataSources.alwaysLoaded.activeParty.teamSpectator.members )
end

function GameBattlesTeamsLobbyMembers( menu, controller )
	local self = LUI.UIVerticalList.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 550 * _1080p, 0, 915 * _1080p )
	self.id = "GameBattlesTeamsLobbyMembers"
	self._animationSets = {}
	self._sequences = {}
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local LobbyMembersAllies = nil
	
	LobbyMembersAllies = MenuBuilder.BuildRegisteredType( "GameBattlesLobbyMembers", {
		controllerIndex = f2_local1
	} )
	LobbyMembersAllies.id = "LobbyMembersAllies"
	LobbyMembersAllies:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 305 )
	self:addElement( LobbyMembersAllies )
	self.LobbyMembersAllies = LobbyMembersAllies
	
	local LobbyMembersAxis = nil
	
	LobbyMembersAxis = MenuBuilder.BuildRegisteredType( "GameBattlesLobbyMembers", {
		controllerIndex = f2_local1
	} )
	LobbyMembersAxis.id = "LobbyMembersAxis"
	LobbyMembersAxis:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 305, _1080p * 610 )
	self:addElement( LobbyMembersAxis )
	self.LobbyMembersAxis = LobbyMembersAxis
	
	local LobbyMembersCodcasters = nil
	
	LobbyMembersCodcasters = MenuBuilder.BuildRegisteredType( "GameBattlesLobbyMembers", {
		controllerIndex = f2_local1
	} )
	LobbyMembersCodcasters.id = "LobbyMembersCodcasters"
	LobbyMembersCodcasters:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 610, _1080p * 915 )
	self:addElement( LobbyMembersCodcasters )
	self.LobbyMembersCodcasters = LobbyMembersCodcasters
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		LobbyMembersAllies:RegisterAnimationSequence( "NoCODCasters", {
			{
				function ()
					return self.LobbyMembersAllies:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -680, _1080p * -130, _1080p * 140, _1080p * 445, 0 )
				end
			}
		} )
		LobbyMembersAxis:RegisterAnimationSequence( "NoCODCasters", {
			{
				function ()
					return self.LobbyMembersAxis:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -680, _1080p * -130, _1080p * 445, _1080p * 750, 0 )
				end
			}
		} )
		LobbyMembersCodcasters:RegisterAnimationSequence( "NoCODCasters", {
			{
				function ()
					return self.LobbyMembersCodcasters:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.NoCODCasters = function ()
			LobbyMembersAllies:AnimateSequence( "NoCODCasters" )
			LobbyMembersAxis:AnimateSequence( "NoCODCasters" )
			LobbyMembersCodcasters:AnimateSequence( "NoCODCasters" )
		end
		
		LobbyMembersAllies:RegisterAnimationSequence( "CODCastersExpected", {
			{
				function ()
					return self.LobbyMembersAllies:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -680, _1080p * -130, _1080p * 54, _1080p * 359, 0 )
				end
			}
		} )
		LobbyMembersAxis:RegisterAnimationSequence( "CODCastersExpected", {
			{
				function ()
					return self.LobbyMembersAxis:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -680, _1080p * -130, _1080p * 359, _1080p * 664, 0 )
				end
			}
		} )
		LobbyMembersCodcasters:RegisterAnimationSequence( "CODCastersExpected", {
			{
				function ()
					return self.LobbyMembersCodcasters:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.LobbyMembersCodcasters:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -680, _1080p * -130, _1080p * 664, _1080p * 969, 0 )
				end
			}
		} )
		self._sequences.CODCastersExpected = function ()
			LobbyMembersAllies:AnimateSequence( "CODCastersExpected" )
			LobbyMembersAxis:AnimateSequence( "CODCastersExpected" )
			LobbyMembersCodcasters:AnimateSequence( "CODCastersExpected" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local0( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "GameBattlesTeamsLobbyMembers", GameBattlesTeamsLobbyMembers )
LockTable( _M )
