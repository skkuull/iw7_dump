local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ReticleAlienHead( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 128 * _1080p, 0, 128 * _1080p )
	self.id = "ReticleAlienHead"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Image = nil
	
	Image = LUI.UIImage.new()
	Image.id = "Image"
	Image:SetRGBFromInt( 0, 0 )
	Image:setImage( RegisterMaterial( "hud_reticle_alien_head" ), 0 )
	Image:SetUseAA( true )
	Image:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -23, _1080p * 23, _1080p * -23, _1080p * 23 )
	Image:SubscribeToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.player.currentWeapon.adsPercent:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			Image:SetAlpha( Lerp( f2_local0, 0.3, 0.6 ), 0 )
		end
	end )
	Image:SubscribeToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_local1 ), function ()
		local f3_local0 = DataSources.inGame.player.currentWeapon.adsPercent:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			Image:SetScale( Lerp( f3_local0, 0, 0.8 ), 0 )
		end
	end )
	self:addElement( Image )
	self.Image = Image
	
	local RedDot = nil
	
	RedDot = MenuBuilder.BuildRegisteredType( "RedDot", {
		controllerIndex = f1_local1
	} )
	RedDot.id = "RedDot"
	RedDot:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -4, _1080p * 4, _1080p * -4, _1080p * 4 )
	self:addElement( RedDot )
	self.RedDot = RedDot
	
	return self
end

MenuBuilder.registerType( "ReticleAlienHead", ReticleAlienHead )
LockTable( _M )
