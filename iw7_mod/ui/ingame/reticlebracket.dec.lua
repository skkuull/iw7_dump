local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ReticleBracket( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 12 * _1080p, 0, 4 * _1080p )
	self.id = "ReticleBracket"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local ScopeReticleSpacer = nil
	
	ScopeReticleSpacer = MenuBuilder.BuildRegisteredType( "ScopeReticleSpacer", {
		minSizeADS = 4,
		maxSizeADS = 4,
		minSizeHip = 10,
		maxSizeHip = 20,
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
	ReticleBracketBase:SetScale( 0.3, 0 )
	ReticleBracketBase:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * -3, _1080p * 3 )
	self:addElement( ReticleBracketBase )
	self.ReticleBracketBase = ReticleBracketBase
	
	return self
end

MenuBuilder.registerType( "ReticleBracket", ReticleBracket )
LockTable( _M )
