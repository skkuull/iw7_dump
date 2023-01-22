local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
MenuBuilder.registerType( "test", function ()
	local self = LUI.UIElement.new( {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0
	} )
	self.id = "testMenu"
	self:addElement( MenuBuilder.BuildRegisteredType( "generic_back_button" ) )
	return self
end )
LockTable( _M )
