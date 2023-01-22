local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ReticleBa50Cal( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1 * _1080p, 0, 1 * _1080p )
	self.id = "ReticleBa50Cal"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Snpr = nil
	
	Snpr = LUI.UIImage.new()
	Snpr.id = "Snpr"
	Snpr:setImage( RegisterMaterial( "hud_reticle_snpr_ba50cal" ), 0 )
	Snpr:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -175.25, _1080p * 174.75, _1080p * -174.75, _1080p * 175.25 )
	Snpr:BindAlphaToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_local1 ) )
	self:addElement( Snpr )
	self.Snpr = Snpr
	
	return self
end

MenuBuilder.registerType( "ReticleBa50Cal", ReticleBa50Cal )
LockTable( _M )
