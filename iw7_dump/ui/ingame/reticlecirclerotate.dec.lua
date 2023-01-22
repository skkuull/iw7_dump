local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ReticleCircleRotate( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 20 * _1080p, 0, 20 * _1080p )
	self.id = "ReticleCircleRotate"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local ScopeReticleSpacer = nil
	
	ScopeReticleSpacer = MenuBuilder.BuildRegisteredType( "ScopeReticleSpacer", {
		minSizeADS = 19,
		maxSizeADS = 19,
		minSizeHip = 8,
		maxSizeHip = 8,
		adjustLeft = true,
		adjustRight = true,
		adjustTop = true,
		adjustBottom = true,
		controllerIndex = f1_local1
	} )
	ScopeReticleSpacer.id = "ScopeReticleSpacer"
	ScopeReticleSpacer:SetAlpha( 0, 0 )
	self:addElement( ScopeReticleSpacer )
	self.ScopeReticleSpacer = ScopeReticleSpacer
	
	local circleFill = nil
	
	circleFill = LUI.UIImage.new()
	circleFill.id = "circleFill"
	circleFill:SetScale( -0.05, 0 )
	circleFill:setImage( RegisterMaterial( "hud_reticle_circle_fill" ), 0 )
	circleFill:SubscribeToModel( DataSources.inGame.player.currentWeapon.charge:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.player.currentWeapon.charge:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			circleFill:SetAlpha( Add( Multiply( f2_local0, 2 ), -1.5 ), 0 )
		end
	end )
	self:addElement( circleFill )
	self.circleFill = circleFill
	
	local centerReticle = nil
	
	centerReticle = LUI.UIImage.new()
	centerReticle.id = "centerReticle"
	centerReticle:setImage( RegisterMaterial( "hud_reticle_circle_notch_dot" ), 0 )
	self:addElement( centerReticle )
	self.centerReticle = centerReticle
	
	local outerCircle = nil
	
	outerCircle = MenuBuilder.BuildRegisteredType( "ReticleCircleNotched", {
		controllerIndex = f1_local1
	} )
	outerCircle.id = "outerCircle"
	outerCircle:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	outerCircle:SubscribeToModel( DataSources.inGame.player.currentWeapon.charge:GetModel( f1_local1 ), function ()
		local f3_local0 = DataSources.inGame.player.currentWeapon.charge:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			outerCircle:SetZRotation( Multiply( f3_local0, 100 ), 0 )
		end
	end )
	outerCircle:SubscribeToModel( DataSources.inGame.player.currentWeapon.charge:GetModel( f1_local1 ), function ()
		local f4_local0 = DataSources.inGame.player.currentWeapon.charge:GetValue( f1_local1 )
		if f4_local0 ~= nil then
			outerCircle:SetScale( Lerp( f4_local0, 2.2, 0 ), 0 )
		end
	end )
	self:addElement( outerCircle )
	self.outerCircle = outerCircle
	
	local centerReticleCopy0 = nil
	
	centerReticleCopy0 = LUI.UIImage.new()
	centerReticleCopy0.id = "centerReticleCopy0"
	centerReticleCopy0:setImage( RegisterMaterial( "hud_reticle_circle_notch_dot" ), 0 )
	centerReticleCopy0:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -1, _1080p * 1, _1080p * -1, _1080p * 1 )
	self:addElement( centerReticleCopy0 )
	self.centerReticleCopy0 = centerReticleCopy0
	
	return self
end

MenuBuilder.registerType( "ReticleCircleRotate", ReticleCircleRotate )
LockTable( _M )
