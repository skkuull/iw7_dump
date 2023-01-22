local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function AmmoCounterBlue( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 50 * _1080p, 0, 16 * _1080p )
	self.id = "AmmoCounterBlue"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local AmmoCounterBase = nil
	
	AmmoCounterBase = MenuBuilder.BuildRegisteredType( "AmmoCounterBase", {
		controllerIndex = f1_local1
	} )
	AmmoCounterBase.id = "AmmoCounterBase"
	AmmoCounterBase:SetScale( 0.5, 0 )
	AmmoCounterBase.AmmoCounterShadow:SetRGBFromInt( 9342606, 0 )
	AmmoCounterBase.AmmoCounterShadow:SetAlpha( 0.6, 0 )
	AmmoCounterBase.AmmoCounterShadow:SetShadowMinDistance( -0.2, 0 )
	AmmoCounterBase.AmmoCounterShadow:SetShadowRGBFromInt( 9342606, 0 )
	AmmoCounterBase:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 139, _1080p * 179, _1080p * 91, _1080p * 107 )
	AmmoCounterBase:SubscribeToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.player.currentWeapon.adsPercent:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			AmmoCounterBase:SetAlpha( Lerp( f2_local0, 0, 0.8 ), 0 )
		end
	end )
	self:addElement( AmmoCounterBase )
	self.AmmoCounterBase = AmmoCounterBase
	
	return self
end

MenuBuilder.registerType( "AmmoCounterBlue", AmmoCounterBlue )
LockTable( _M )
