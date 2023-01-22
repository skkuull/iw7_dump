function ModuleInaccessible( f1_arg0 )
	assert( not _G[f1_arg0] )
	_G[f1_arg0] = setmetatable( {}, {
		__index = function ( f2_arg0, f2_arg1 )
			return function ()
				assert( false, "Functions from the " .. f1_arg0 .. " module are not allowed to be called from this scope." )
			end
			
		end
	} )
end

if Engine then
	Engine.UsingSplitscreenUpscaling = Engine.UsingSplitscreenUpscaling or function ()
		return false
	end
	
	Engine.IsXenonDevTitle = Engine.IsXenonDevTitle or function ()
		return false
	end
	
end
if Game then
	Game.IsSpectatorCameraActive = Game.IsSpectatorCameraActive or function ()
		return false
	end
	
	Game.StartBlur = Game.StartBlur or function ()
		
	end
	
	Game.GetLastMLGSpectateTeam = Game.GetLastMLGSpectateTeam or function ()
		return Teams.allies
	end
	
else
	ModuleInaccessible( "Game" )
end
if Friends then
	
else
	ModuleInaccessible( "Friends" )
end
if Leaderboards then
	
else
	ModuleInaccessible( "Leaderboards" )
end
if Lobby then
	
else
	ModuleInaccessible( "Lobby" )
end
if LobbyMember then
	
else
	ModuleInaccessible( "LobbyMember" )
end
if Playlist then
	
else
	ModuleInaccessible( "Playlist" )
end
if CharacterScene then
	
else
	ModuleInaccessible( "CharacterScene" )
end
MLG = MLG or {}
Customization = Customization or {}
MatchRules = MatchRules or {}
