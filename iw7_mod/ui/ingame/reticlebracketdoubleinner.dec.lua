local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ReticleBracketDoubleInner( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 20 * _1080p, 0, 10 * _1080p )
	self.id = "ReticleBracketDoubleInner"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local ScopeReticleSpacer = nil
	
	ScopeReticleSpacer = MenuBuilder.BuildRegisteredType( "ScopeReticleSpacer", {
		minSizeADS = 23,
		maxSizeADS = 23,
		minSizeHip = 20,
		maxSizeHip = 32,
		adjustLeft = true,
		adjustRight = true,
		controllerIndex = f1_local1
	} )
	ScopeReticleSpacer.id = "ScopeReticleSpacer"
	ScopeReticleSpacer:SetAlpha( 0, 0 )
	self:addElement( ScopeReticleSpacer )
	self.ScopeReticleSpacer = ScopeReticleSpacer
	
	local ReticleBracketBase = nil
	
	ReticleBracketBase = MenuBuilder.BuildRegisteredType( "ReticleBracketBase", {
		controllerIndex = f1_local1
	} )
	ReticleBracketBase.id = "ReticleBracketBase"
	ReticleBracketBase:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( ReticleBracketBase )
	self.ReticleBracketBase = ReticleBracketBase
	
	return self
end

MenuBuilder.registerType( "ReticleBracketDoubleInner", ReticleBracketDoubleInner )
LockTable( _M )
