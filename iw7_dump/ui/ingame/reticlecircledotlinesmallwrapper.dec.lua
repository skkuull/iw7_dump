local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ReticleCircleDotLineSmallWrapper( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 64 * _1080p, 0, 64 * _1080p )
	self.id = "ReticleCircleDotLineSmallWrapper"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local ReticleCircleDotLineSmall = nil
	
	ReticleCircleDotLineSmall = MenuBuilder.BuildRegisteredType( "ReticleCircleDotLineSmall", {
		controllerIndex = f1_local1
	} )
	ReticleCircleDotLineSmall.id = "ReticleCircleDotLineSmall"
	ReticleCircleDotLineSmall:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * 32, _1080p * -32, _1080p * 32 )
	ReticleCircleDotLineSmall:SubscribeToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.player.currentWeapon.adsPercent:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			ReticleCircleDotLineSmall:SetAlpha( Lerp( f2_local0, -2.5, 1 ), 0 )
		end
	end )
	self:addElement( ReticleCircleDotLineSmall )
	self.ReticleCircleDotLineSmall = ReticleCircleDotLineSmall
	
	return self
end

MenuBuilder.registerType( "ReticleCircleDotLineSmallWrapper", ReticleCircleDotLineSmallWrapper )
LockTable( _M )
