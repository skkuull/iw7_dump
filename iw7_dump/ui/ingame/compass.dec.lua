local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function Compass( f1_arg0, f1_arg1 )
	local f1_local0 = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		material = RegisterMaterial( "compass_tickertape" )
	}
	if not f1_arg1 then
		f1_arg1 = {}
	end
	f1_arg1.stretch = f1_arg1.stretch or 0.85
	local self = LUI.UIElement.new( f1_local0 )
	self.id = "Compass"
	self:setupCompass( f1_arg1.stretch )
	return self
end

MenuBuilder.registerType( "Compass", Compass )
LockTable( _M )
