local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PulseArray( menu, controller )
	local self = LUI.UIElement.new()
	self:SetupPulseArray()
	return self
end

MenuBuilder.registerType( "PulseArray", PulseArray )
LockTable( _M )
