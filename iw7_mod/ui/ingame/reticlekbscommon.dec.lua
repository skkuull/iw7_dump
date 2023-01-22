local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ReticleKBSCommon( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 344 * _1080p, 0, 256 * _1080p )
	self.id = "ReticleKBSCommon"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local KBSs = nil
	
	KBSs = LUI.UIImage.new()
	KBSs.id = "KBSs"
	KBSs:SetRGBFromInt( 39424, 0 )
	KBSs:SetAlpha( 0.4, 0 )
	KBSs:setImage( RegisterMaterial( "hud_reticle_kbs_sniper_common" ), 0 )
	KBSs:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -173, _1080p * 172, _1080p * -33, _1080p * 140 )
	self:addElement( KBSs )
	self.KBSs = KBSs
	
	local KBS = nil
	
	KBS = LUI.UIImage.new()
	KBS.id = "KBS"
	KBS:SetRGBFromInt( 13369088, 0 )
	KBS:SetAlpha( 0.6, 0 )
	KBS:setImage( RegisterMaterial( "hud_reticle_kbs_sniper_common" ), 0 )
	KBS:SetBlendMode( BLEND_MODE.addWithAlpha )
	KBS:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -173, _1080p * 172, _1080p * -33, _1080p * 139 )
	self:addElement( KBS )
	self.KBS = KBS
	
	return self
end

MenuBuilder.registerType( "ReticleKBSCommon", ReticleKBSCommon )
LockTable( _M )
