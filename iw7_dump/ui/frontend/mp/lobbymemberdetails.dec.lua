local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function LobbyMemberDetails( menu, controller )
	local self = LUI.UIHorizontalNavigator.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 418 * _1080p, 0, 500 * _1080p )
	self.id = "LobbyMemberDetails"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local PlayerCard = nil
	
	PlayerCard = MenuBuilder.BuildRegisteredType( "SmallPlayerCard", {
		controllerIndex = f1_local1
	} )
	PlayerCard.id = "PlayerCard"
	PlayerCard:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 119 )
	self:addElement( PlayerCard )
	self.PlayerCard = PlayerCard
	
	local Stats = nil
	
	Stats = MenuBuilder.BuildRegisteredType( "LobbyMemberStats", {
		controllerIndex = f1_local1
	} )
	Stats.id = "Stats"
	Stats:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 123, _1080p * 255 )
	self:addElement( Stats )
	self.Stats = Stats
	
	local KDHistory = nil
	
	KDHistory = MenuBuilder.BuildRegisteredType( "LobbyMemberKDHistory", {
		controllerIndex = f1_local1
	} )
	KDHistory.id = "KDHistory"
	KDHistory:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 418, _1080p * 259, _1080p * 499 )
	self:addElement( KDHistory )
	self.KDHistory = KDHistory
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		self._sequences.ShowCluster = function ()
			
		end
		
		self._sequences.HideCluster = function ()
			
		end
		
		PlayerCard:RegisterAnimationSequence( "LobbyMembersHL", {
			{
				function ()
					return self.PlayerCard:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1406, _1080p * 1824, _1080p * 767, _1080p * 886, 119 )
				end
			}
		} )
		self._sequences.LobbyMembersHL = function ()
			PlayerCard:AnimateSequence( "LobbyMembersHL" )
		end
		
		PlayerCard:RegisterAnimationSequence( "MainHL", {
			{
				function ()
					return self.PlayerCard:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 2506.95, _1080p * 2924.95, _1080p * 767, _1080p * 886, 119 )
				end
			}
		} )
		self._sequences.MainHL = function ()
			PlayerCard:AnimateSequence( "MainHL" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	return self
end

MenuBuilder.registerType( "LobbyMemberDetails", LobbyMemberDetails )
LockTable( _M )
