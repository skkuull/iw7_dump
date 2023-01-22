local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ReticleSnpr14( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 712 * _1080p, 0, 712 * _1080p )
	self.id = "ReticleSnpr14"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Tiks = nil
	
	Tiks = LUI.UIImage.new()
	Tiks.id = "Tiks"
	Tiks:SetRGBFromInt( 0, 0 )
	Tiks:setImage( RegisterMaterial( "hud_reticle_sniper14b" ), 0 )
	Tiks:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -33, _1080p * 33, _1080p * -33, _1080p * 33 )
	Tiks:BindAlphaToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_local1 ) )
	self:addElement( Tiks )
	self.Tiks = Tiks
	
	local ImageS = nil
	
	ImageS = LUI.UIImage.new()
	ImageS.id = "ImageS"
	ImageS:setImage( RegisterMaterial( "hud_reticle_sniper14c" ), 0 )
	ImageS:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 161, _1080p * -161, _1080p * 161, _1080p * -161 )
	ImageS:SubscribeToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.player.currentWeapon.adsPercent:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			ImageS:SetAlpha( Lerp( f2_local0, 0, 0.6 ), 0 )
		end
	end )
	self:addElement( ImageS )
	self.ImageS = ImageS
	
	local Image = nil
	
	Image = LUI.UIImage.new()
	Image.id = "Image"
	Image:setImage( RegisterMaterial( "hud_reticle_sniper14c" ), 0 )
	Image:SetBlendMode( BLEND_MODE.addWithAlpha )
	Image:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 161, _1080p * -161, _1080p * 161, _1080p * -161 )
	Image:SubscribeToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_local1 ), function ()
		local f3_local0 = DataSources.inGame.player.currentWeapon.adsPercent:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			Image:SetAlpha( Lerp( f3_local0, 0, 0.6 ), 0 )
		end
	end )
	self:addElement( Image )
	self.Image = Image
	
	return self
end

MenuBuilder.registerType( "ReticleSnpr14", ReticleSnpr14 )
LockTable( _M )
