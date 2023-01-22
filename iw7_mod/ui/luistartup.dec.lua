local f0_local0 = function ( f1_arg0 )
	Engine.MeasureResourceEventStart( f1_arg0, "requires" )
	require( f1_arg0 )
	Engine.MeasureResourceEventEnd( f1_arg0, "requires" )
end

DebugPrint( "Running LUIStartup.lua" )
f0_local0( "requires.AlwaysLoaded" )
if Engine.InFrontend() then
	f0_local0( "requires.FrontEnd" )
	f0_local0( "requires.frontEnd.CP" )
	f0_local0( "requires.frontEnd.SP" )
	f0_local0( "requires.frontEnd.MP" )
else
	f0_local0( "requires.InGame" )
	if Engine.IsAliensMode() then
		f0_local0( "requires.ingame.CP" )
		if Engine.IsLocalServerPaused() then
			Engine.Unpause()
		end
	elseif not Engine.IsMultiplayer() then
		f0_local0( "requires.ingame.SP" )
	elseif not Engine.IsAliensMode() and Engine.IsMultiplayer() then
		f0_local0( "requires.ingame.MP" )
	end
end
if Engine.GetDvarBool( "fastfile_loadDevelopment" ) then
	f0_local0( "requires.Development" )
end
local f0_local1 = getmetatable( _G )
if not f0_local1 then
	f0_local1 = {}
	setmetatable( _G, f0_local1 )
end
f0_local1.__newindex = function ( f2_arg0, f2_arg1, f2_arg2 )
	error( "LUI Error: Tried to create global variable " .. f2_arg1, 2 )
end

