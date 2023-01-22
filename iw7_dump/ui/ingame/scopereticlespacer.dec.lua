local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ScopeReticleSpacer( menu, controller )
	local self = LUI.UIElement.new( CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All ) )
	self.id = "ScopeReticleSpacer"
	if not controller then
		controller = {}
	end
	self:SetupScopeReticleSpacer( controller )
	return self
end

MenuBuilder.registerType( "ScopeReticleSpacer", ScopeReticleSpacer )
LockTable( _M )
