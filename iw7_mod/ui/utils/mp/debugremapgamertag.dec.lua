local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
f0_local0 = {
	["2 Dev 927329"] = "Bravo",
	["2 Dev 29180491"] = "Charlie",
	["2 Dev 45507"] = "Delta",
	["2 Dev 750926582"] = "Echo",
	["2 Dev 43738"] = "Foxtrot",
	["2 Dev 7640948"] = "Golf",
	["2 Dev 8696594"] = "Hotel",
	["2 Dev 02194"] = "India",
	["2 Dev 92585695"] = "Juliet",
	["2 Dev 5279266"] = "Kilo",
	["2 Dev 1988955"] = "Lima",
	["2 Dev 09914598"] = "Mike",
	["2 Dev 892997300"] = "November",
	["2 Dev 63375004"] = "Oscar",
	["2 Dev 65411"] = "Papa",
	["2 Dev 39361"] = "Quebec",
	["2 Dev 3455"] = "Romeo",
	["2 Dev 6796805"] = "Sierra",
	["2 Dev 0363700"] = "wallace kit"
}
function GetRemappedGamerTag( f1_arg0 )
	if Engine.IsXB3() then
		local f1_local0 = f0_local0[f1_arg0]
		if f1_local0 ~= nil then
			return f1_local0
		end
	end
	return f1_arg0
end

