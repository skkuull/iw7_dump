local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:SubscribeToModel( DataSources.inGame.player.currentWeapon.shotCounter:GetModel( f1_arg1 ), function ( f2_arg0 )
		local f2_local0 = math.random( 1, 4 )
		local f2_local1 = math.random( 1, 7 )
		ACTIONS.AnimateSequenceByElement( f1_arg0, {
			elementName = "Firework" .. f2_local1,
			sequenceName = "Boom" .. f2_local0,
			elementName = "Firework" .. f2_local1
		} )
	end )
end

function Reticle50Small( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 128 * _1080p, 0, 128 * _1080p )
	self.id = "Reticle50Small"
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local Firework7 = nil
	
	Firework7 = MenuBuilder.BuildRegisteredType( "Reticle50b", {
		controllerIndex = f3_local1
	} )
	Firework7.id = "Firework7"
	Firework7:SetScale( -0.6, 0 )
	Firework7:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 64, _1080p * 192, _1080p * 7, _1080p * 135 )
	Firework7:BindAlphaToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f3_local1 ) )
	self:addElement( Firework7 )
	self.Firework7 = Firework7
	
	local Firework6 = nil
	
	Firework6 = MenuBuilder.BuildRegisteredType( "Reticle50b", {
		controllerIndex = f3_local1
	} )
	Firework6.id = "Firework6"
	Firework6:SetScale( -0.6, 0 )
	Firework6:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -67, _1080p * 61, _1080p * -42, _1080p * 86 )
	Firework6:BindAlphaToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f3_local1 ) )
	self:addElement( Firework6 )
	self.Firework6 = Firework6
	
	local Firework5 = nil
	
	Firework5 = MenuBuilder.BuildRegisteredType( "Reticle50b", {
		controllerIndex = f3_local1
	} )
	Firework5.id = "Firework5"
	Firework5:SetScale( -0.5, 0 )
	Firework5:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -57.6, _1080p * 70.4, _1080p * 57.5, _1080p * 185.5 )
	Firework5:BindAlphaToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f3_local1 ) )
	self:addElement( Firework5 )
	self.Firework5 = Firework5
	
	local Firework4 = nil
	
	Firework4 = MenuBuilder.BuildRegisteredType( "Reticle50b", {
		controllerIndex = f3_local1
	} )
	Firework4.id = "Firework4"
	Firework4:SetScale( -0.6, 0 )
	Firework4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 32.8, _1080p * 160.8, _1080p * 58.2, _1080p * 186.2 )
	Firework4:BindAlphaToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f3_local1 ) )
	self:addElement( Firework4 )
	self.Firework4 = Firework4
	
	local Firework3 = nil
	
	Firework3 = MenuBuilder.BuildRegisteredType( "Reticle50b", {
		controllerIndex = f3_local1
	} )
	Firework3.id = "Firework3"
	Firework3:SetScale( -0.7, 0 )
	Firework3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -12.2, _1080p * 115.8, _1080p * -64, _1080p * 64 )
	Firework3:BindAlphaToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f3_local1 ) )
	self:addElement( Firework3 )
	self.Firework3 = Firework3
	
	local Firework2 = nil
	
	Firework2 = MenuBuilder.BuildRegisteredType( "Reticle50b", {
		controllerIndex = f3_local1
	} )
	Firework2.id = "Firework2"
	Firework2:SetScale( -0.4, 0 )
	Firework2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 56.2, _1080p * 184.2, _1080p * -38.4, _1080p * 89.6 )
	Firework2:BindAlphaToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f3_local1 ) )
	self:addElement( Firework2 )
	self.Firework2 = Firework2
	
	local Firework1 = nil
	
	Firework1 = MenuBuilder.BuildRegisteredType( "Reticle50b", {
		controllerIndex = f3_local1
	} )
	Firework1.id = "Firework1"
	Firework1:SetScale( -0.2, 0 )
	Firework1:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 128, _1080p * 1, _1080p * 129 )
	Firework1:SubscribeToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f3_local1 ), function ()
		local f4_local0 = DataSources.inGame.player.currentWeapon.adsPercent:GetValue( f3_local1 )
		if f4_local0 ~= nil then
			Firework1:SetAlpha( Lerp( f4_local0, 0, 0.6 ), 0 )
		end
	end )
	self:addElement( Firework1 )
	self.Firework1 = Firework1
	
	local MidRingS = nil
	
	MidRingS = LUI.UIImage.new()
	MidRingS.id = "MidRingS"
	MidRingS:SetRGBFromInt( 16721351, 0 )
	MidRingS:setImage( RegisterMaterial( "hud_reticle_circle_outline_small" ), 0 )
	MidRingS:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -6.4, _1080p * 6.4, _1080p * -6.4, _1080p * 6.4 )
	MidRingS:SubscribeToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f3_local1 ), function ()
		local f5_local0 = DataSources.inGame.player.currentWeapon.adsPercent:GetValue( f3_local1 )
		if f5_local0 ~= nil then
			MidRingS:SetAlpha( Lerp( f5_local0, 0.2, 0.6 ), 0 )
		end
	end )
	self:addElement( MidRingS )
	self.MidRingS = MidRingS
	
	local MidRing = nil
	
	MidRing = LUI.UIImage.new()
	MidRing.id = "MidRing"
	MidRing:SetRGBFromInt( 16721351, 0 )
	MidRing:setImage( RegisterMaterial( "hud_reticle_circle_outline_small" ), 0 )
	MidRing:SetBlendMode( BLEND_MODE.addWithAlpha )
	MidRing:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -7, _1080p * 7, _1080p * -7, _1080p * 7 )
	MidRing:SubscribeToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f3_local1 ), function ()
		local f6_local0 = DataSources.inGame.player.currentWeapon.adsPercent:GetValue( f3_local1 )
		if f6_local0 ~= nil then
			MidRing:SetAlpha( Lerp( f6_local0, 0.2, 0.6 ), 0 )
		end
	end )
	self:addElement( MidRing )
	self.MidRing = MidRing
	
	local InnerRing = nil
	
	InnerRing = LUI.UIImage.new()
	InnerRing.id = "InnerRing"
	InnerRing:SetRGBFromInt( 2687034, 0 )
	InnerRing:setImage( RegisterMaterial( "hud_reticle_circle_outline_small" ), 0 )
	InnerRing:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -5, _1080p * 5, _1080p * -5, _1080p * 5 )
	InnerRing:SubscribeToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f3_local1 ), function ()
		local f7_local0 = DataSources.inGame.player.currentWeapon.adsPercent:GetValue( f3_local1 )
		if f7_local0 ~= nil then
			InnerRing:SetAlpha( Lerp( f7_local0, 0.2, 0.8 ), 0 )
		end
	end )
	self:addElement( InnerRing )
	self.InnerRing = InnerRing
	
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "Reticle50Small", Reticle50Small )
LockTable( _M )
