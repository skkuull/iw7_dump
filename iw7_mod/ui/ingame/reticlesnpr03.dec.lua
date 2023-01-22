local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ReticleSnpr03( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 2 * _1080p, 0, 2 * _1080p )
	self.id = "ReticleSnpr03"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Maroon = nil
	
	Maroon = LUI.UIImage.new()
	Maroon.id = "Maroon"
	Maroon:SetRGBFromInt( 16766208, 0 )
	Maroon:setImage( RegisterMaterial( "hud_reticle_sniper11" ), 0 )
	Maroon:SetUseAA( true )
	Maroon:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -161, _1080p * 160, _1080p * -160, _1080p * 160 )
	Maroon:BindAlphaToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_local1 ) )
	self:addElement( Maroon )
	self.Maroon = Maroon
	
	local LineConveyorR = nil
	
	LineConveyorR = MenuBuilder.BuildRegisteredType( "LineConveyor", {
		controllerIndex = f1_local1
	} )
	LineConveyorR.id = "LineConveyorR"
	LineConveyorR:SetRGBFromTable( SWATCHES.Reticles.Orange, 0 )
	LineConveyorR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 70, _1080p * 134, _1080p * -1, _1080p * 0.5 )
	LineConveyorR:BindAlphaToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_local1 ) )
	self:addElement( LineConveyorR )
	self.LineConveyorR = LineConveyorR
	
	local LineConveyorL = nil
	
	LineConveyorL = MenuBuilder.BuildRegisteredType( "LineConveyor", {
		controllerIndex = f1_local1
	} )
	LineConveyorL.id = "LineConveyorL"
	LineConveyorL:SetRGBFromTable( SWATCHES.Reticles.Orange, 0 )
	LineConveyorL:SetYRotation( 180, 0 )
	LineConveyorL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -135, _1080p * -71, _1080p * -1, _1080p * 0.5 )
	LineConveyorL:BindAlphaToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_local1 ) )
	self:addElement( LineConveyorL )
	self.LineConveyorL = LineConveyorL
	
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "LineConveyorL",
		sequenceName = "Cycle2",
		elementPath = "LineConveyorL"
	} )
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "LineConveyorR",
		sequenceName = "Cycle2",
		elementPath = "LineConveyorR"
	} )
	return self
end

MenuBuilder.registerType( "ReticleSnpr03", ReticleSnpr03 )
LockTable( _M )
