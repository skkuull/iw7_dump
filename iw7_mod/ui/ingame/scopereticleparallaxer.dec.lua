local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ScopeReticleParallaxer( menu, controller )
	local self = LUI.UIElement.new( CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All ) )
	self.id = "ScopeReticleParallaxer"
	if not controller then
		controller = {}
	end
	self:SetupScopeReticleParallaxer( controller )
	return self
end

MenuBuilder.registerType( "ScopeReticleParallaxer", ScopeReticleParallaxer )
LockTable( _M )
