local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ReticleThunderstorm( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 17 * _1080p, 0, 10 * _1080p )
	self.id = "ReticleThunderstorm"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local ScopeReticleSpacer = nil
	
	ScopeReticleSpacer = MenuBuilder.BuildRegisteredType( "ScopeReticleSpacer", {
		minSizeADS = 1,
		maxSizeADS = 5,
		minSizeHip = 20,
		maxSizeHip = 60,
		controllerIndex = f1_local1
	} )
	ScopeReticleSpacer.id = "ScopeReticleSpacer"
	ScopeReticleSpacer:SetAlpha( 0, 0 )
	self:addElement( ScopeReticleSpacer )
	self.ScopeReticleSpacer = ScopeReticleSpacer
	
	local ReticleThunderstormBase = nil
	
	ReticleThunderstormBase = MenuBuilder.BuildRegisteredType( "ReticleThunderstormBase", {
		controllerIndex = f1_local1
	} )
	ReticleThunderstormBase.id = "ReticleThunderstormBase"
	ReticleThunderstormBase:SetRGBFromTable( SWATCHES.Reticles.Yellow, 0 )
	ReticleThunderstormBase.BRNotchShadow:SetRGBFromInt( 16763400, 0 )
	ReticleThunderstormBase.BLNotchShadow:SetRGBFromInt( 16763400, 0 )
	ReticleThunderstormBase.TRNotchShadow:SetRGBFromInt( 16763400, 0 )
	ReticleThunderstormBase.TLNotchShadow:SetRGBFromInt( 16763400, 0 )
	ReticleThunderstormBase:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -8.5, _1080p * 8.5, _1080p * -5, _1080p * 5 )
	ReticleThunderstormBase:SubscribeToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.player.currentWeapon.adsPercent:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			ReticleThunderstormBase:SetAlpha( Add( f2_local0, -0.2 ), 0 )
		end
	end )
	self:addElement( ReticleThunderstormBase )
	self.ReticleThunderstormBase = ReticleThunderstormBase
	
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "ReticleThunderstormBase",
		sequenceName = "Flicker",
		elementPath = "ReticleThunderstormBase"
	} )
	return self
end

MenuBuilder.registerType( "ReticleThunderstorm", ReticleThunderstorm )
LockTable( _M )
