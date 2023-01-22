local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "frontEnd.MP.conquest.Headquarters"
f0_local1 = function ( f1_arg0 )
	f1_arg0.HeadquartersCombatRecordButton.navigation = {
		right = f1_arg0.HeadquartersLeaderboardButton,
		down = f1_arg0.HeadquartersPrestigeButton
	}
	f1_arg0.HeadquartersPrestigeButton.navigation = {
		right = f1_arg0.HeadquartersHonorsButton,
		down = f1_arg0.HeadquartersPermanentUnlockStoreButton,
		up = f1_arg0.HeadquartersCombatRecordButton
	}
	f1_arg0.HeadquartersPermanentUnlockStoreButton.navigation = {
		right = f1_arg0.HeadquartersClassicWeaponUnlockButton,
		up = f1_arg0.HeadquartersPrestigeButton
	}
	f1_arg0.HeadquartersClassicWeaponUnlockButton.navigation = {
		left = f1_arg0.HeadquartersPermanentUnlockStoreButton,
		up = f1_arg0.HeadquartersHonorsButton
	}
	f1_arg0.HeadquartersHonorsButton.navigation = {
		left = f1_arg0.HeadquartersPrestigeButton,
		up = f1_arg0.HeadquartersLeaderboardButton,
		down = f1_arg0.HeadquartersClassicWeaponUnlockButton
	}
	f1_arg0.HeadquartersLeaderboardButton.navigation = {
		left = f1_arg0.HeadquartersCombatRecordButton,
		down = f1_arg0.HeadquartersHonorsButton
	}
end

f0_local2 = function ( f2_arg0 )
	f2_arg0.HeadquartersCombatRecordButton.navigation = {
		right = f2_arg0.HeadquartersPrestigeButton
	}
	f2_arg0.HeadquartersPrestigeButton.navigation = {
		left = f2_arg0.HeadquartersCombatRecordButton,
		right = f2_arg0.HeadquartersClassicWeaponUnlockButton
	}
	f2_arg0.HeadquartersPermanentUnlockStoreButton.navigation = {
		left = f2_arg0.HeadquartersClassicWeaponUnlockButton
	}
end

function PostLoadFunc( f3_arg0, f3_arg1 )
	if not Engine.IsAliensMode() then
		ACTIONS.AnimateSequence( f3_arg0, "MPLayout" )
		f0_local1( f3_arg0 )
	else
		ACTIONS.AnimateSequence( f3_arg0, "CPLayout" )
		f0_local2( f3_arg0 )
	end
	f3_arg0:addEventHandler( "prestige_completed", function ( f4_arg0, f4_arg1 )
		if f4_arg1.newPrestige == 1 then
			local f4_local0 = 4
			local f4_local1 = Engine.TableLookup( CSV.missionTeams.file, CSV.missionTeams.cols.index, f4_local0, CSV.missionTeams.cols.killswitch )
			local f4_local2
			if #f4_local1 > 0 then
				f4_local2 = Engine.GetDvarBool( f4_local1 )
			else
				f4_local2 = false
			end
			if f4_local2 then
				return 
			end
			f3_arg0:dispatchEventToCurrentMenu( {
				name = "show_commander_message",
				eventID = "ba_team_unlocked",
				teamOverride = f4_local0
			} )
		end
	end )
end

function HeadquartersBarracks( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 773 * _1080p )
	self.id = "HeadquartersBarracks"
	self._animationSets = {}
	self._sequences = {}
	local f5_local1 = controller and controller.controllerIndex
	if not f5_local1 and not Engine.InFrontend() then
		f5_local1 = self:getRootController()
	end
	assert( f5_local1 )
	local f5_local2 = self
	local HeadquartersCombatRecordButton = nil
	
	HeadquartersCombatRecordButton = MenuBuilder.BuildRegisteredType( "HeadquartersCombatRecordButton", {
		controllerIndex = f5_local1
	} )
	HeadquartersCombatRecordButton.id = "HeadquartersCombatRecordButton"
	HeadquartersCombatRecordButton:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 349.5, _1080p * 849.5, 0, _1080p * 300 )
	self:addElement( HeadquartersCombatRecordButton )
	self.HeadquartersCombatRecordButton = HeadquartersCombatRecordButton
	
	local HeadquartersPrestigeButton = nil
	
	HeadquartersPrestigeButton = MenuBuilder.BuildRegisteredType( "HeadquartersPrestigeButton", {
		controllerIndex = f5_local1
	} )
	HeadquartersPrestigeButton.id = "HeadquartersPrestigeButton"
	HeadquartersPrestigeButton:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 349.5, _1080p * 849.5, _1080p * 323, _1080p * 623 )
	self:addElement( HeadquartersPrestigeButton )
	self.HeadquartersPrestigeButton = HeadquartersPrestigeButton
	
	local HeadquartersPermanentUnlockStoreButton = nil
	
	HeadquartersPermanentUnlockStoreButton = MenuBuilder.BuildRegisteredType( "HeadquartersPermanentUnlockStoreButton", {
		controllerIndex = f5_local1
	} )
	HeadquartersPermanentUnlockStoreButton.id = "HeadquartersPermanentUnlockStoreButton"
	HeadquartersPermanentUnlockStoreButton:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 349.5, _1080p * 849.5, _1080p * 623, _1080p * 818 )
	self:addElement( HeadquartersPermanentUnlockStoreButton )
	self.HeadquartersPermanentUnlockStoreButton = HeadquartersPermanentUnlockStoreButton
	
	local f5_local6 = nil
	if not CONDITIONS.IsThirdGameMode( self ) then
		f5_local6 = MenuBuilder.BuildRegisteredType( "HeadquartersClassicWeaponUnlockButton", {
			controllerIndex = f5_local1
		} )
		f5_local6.id = "HeadquartersClassicWeaponUnlockButton"
		f5_local6:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 860.29, _1080p * 1360.29, _1080p * 623, _1080p * 818 )
		self:addElement( f5_local6 )
		self.HeadquartersClassicWeaponUnlockButton = f5_local6
	end
	local f5_local7 = nil
	if CONDITIONS.IsCoreMultiplayer( self ) then
		f5_local7 = MenuBuilder.BuildRegisteredType( "HeadquartersHonorsButton", {
			controllerIndex = f5_local1
		} )
		f5_local7.id = "HeadquartersHonorsButton"
		f5_local7:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 924, _1080p * 1424, _1080p * 283, _1080p * 533 )
		self:addElement( f5_local7 )
		self.HeadquartersHonorsButton = f5_local7
	end
	local f5_local8 = nil
	if CONDITIONS.IsCoreMultiplayer( self ) then
		f5_local8 = MenuBuilder.BuildRegisteredType( "HeadquartersMissionTeamWidget", {
			controllerIndex = f5_local1
		} )
		f5_local8.id = "HeadquartersMissionTeamWidget"
		f5_local8:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -700, 0, _1080p * 33, _1080p * 753 )
		self:addElement( f5_local8 )
		self.HeadquartersMissionTeamWidget = f5_local8
	end
	local HeadquartersLeaderboardButton = nil
	
	HeadquartersLeaderboardButton = MenuBuilder.BuildRegisteredType( "HeadquartersLeaderboardButton", {
		controllerIndex = f5_local1
	} )
	HeadquartersLeaderboardButton.id = "HeadquartersLeaderboardButton"
	HeadquartersLeaderboardButton:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 860.29, _1080p * 1358.29, _1080p * 33, _1080p * 283 )
	self:addElement( HeadquartersLeaderboardButton )
	self.HeadquartersLeaderboardButton = HeadquartersLeaderboardButton
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		HeadquartersPermanentUnlockStoreButton:RegisterAnimationSequence( "CPLayout", {
			{
				function ()
					return self.HeadquartersPermanentUnlockStoreButton:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1136, _1080p * 1636, _1080p * 236.5, _1080p * 536.5, 0 )
				end
			}
		} )
		self._sequences.CPLayout = function ()
			HeadquartersPermanentUnlockStoreButton:AnimateSequence( "CPLayout" )
		end
		
		HeadquartersCombatRecordButton:RegisterAnimationSequence( "MPLayout", {
			{
				function ()
					return self.HeadquartersCombatRecordButton:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, _1080p * 33.5, _1080p * 283.5, 0 )
				end
			}
		} )
		HeadquartersPrestigeButton:RegisterAnimationSequence( "MPLayout", {
			{
				function ()
					return self.HeadquartersPrestigeButton:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, _1080p * 309.5, _1080p * 559.5, 0 )
				end
			}
		} )
		HeadquartersPermanentUnlockStoreButton:RegisterAnimationSequence( "MPLayout", {
			{
				function ()
					return self.HeadquartersPermanentUnlockStoreButton:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, _1080p * 578, _1080p * 773, 0 )
				end
			}
		} )
		if not CONDITIONS.IsThirdGameMode( self ) then
			f5_local6:RegisterAnimationSequence( "MPLayout", {
				{
					function ()
						return self.HeadquartersClassicWeaponUnlockButton:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 524.29, _1080p * 1024.29, _1080p * 578, _1080p * 773, 0 )
					end
				}
			} )
		end
		if CONDITIONS.IsCoreMultiplayer( self ) then
			f5_local7:RegisterAnimationSequence( "MPLayout", {
				{
					function ()
						return self.HeadquartersHonorsButton:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 524.29, _1080p * 1024.29, _1080p * 309.5, _1080p * 559.5, 0 )
					end
				}
			} )
		end
		if CONDITIONS.IsCoreMultiplayer( self ) then
			f5_local8:RegisterAnimationSequence( "MPLayout", {
				{
					function ()
						return self.HeadquartersMissionTeamWidget:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -850, _1080p * -150, _1080p * 33.5, _1080p * 753.5, 0 )
					end
				}
			} )
		end
		HeadquartersLeaderboardButton:RegisterAnimationSequence( "MPLayout", {
			{
				function ()
					return self.HeadquartersLeaderboardButton:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 524.29, _1080p * 1022.29, _1080p * 33.5, _1080p * 283.5, 0 )
				end
			}
		} )
		self._sequences.MPLayout = function ()
			HeadquartersCombatRecordButton:AnimateSequence( "MPLayout" )
			HeadquartersPrestigeButton:AnimateSequence( "MPLayout" )
			HeadquartersPermanentUnlockStoreButton:AnimateSequence( "MPLayout" )
			if not CONDITIONS.IsThirdGameMode( self ) then
				f5_local6:AnimateSequence( "MPLayout" )
			end
			if CONDITIONS.IsCoreMultiplayer( self ) then
				f5_local7:AnimateSequence( "MPLayout" )
			end
			if CONDITIONS.IsCoreMultiplayer( self ) then
				f5_local8:AnimateSequence( "MPLayout" )
			end
			HeadquartersLeaderboardButton:AnimateSequence( "MPLayout" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	HeadquartersCombatRecordButton:addEventHandler( "button_action", function ( f18_arg0, f18_arg1 )
		local f18_local0 = f18_arg1.controller or f5_local1
		if not CONDITIONS.IsCombatRecordKillswitched( self ) then
			ACTIONS.OpenMenu( "HeadquartersCombatRecord", true, f18_local0 )
		end
	end )
	if CONDITIONS.IsCoreMultiplayer( self ) then
		f5_local7:addEventHandler( "button_action", function ( f19_arg0, f19_arg1 )
			ACTIONS.OpenMenu( "MedalsMenu", true, f19_arg1.controller or f5_local1 )
		end )
	end
	HeadquartersLeaderboardButton:addEventHandler( "button_action", function ( f20_arg0, f20_arg1 )
		local f20_local0 = f20_arg1.controller or f5_local1
		if CONDITIONS.IsMPLeaderboardsAllowed( self ) then
			ACTIONS.OpenMenu( "LeaderboardSelectMenu", true, f20_local0 )
		end
	end )
	PostLoadFunc( self, f5_local1, controller )
	return self
end

MenuBuilder.registerType( "HeadquartersBarracks", HeadquartersBarracks )
LockTable( _M )
