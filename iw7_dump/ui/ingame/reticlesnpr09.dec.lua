local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ReticleSnpr09( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 2 * _1080p, 0, 2 * _1080p )
	self.id = "ReticleSnpr09"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local LineConveyorL = nil
	
	LineConveyorL = MenuBuilder.BuildRegisteredType( "LineConveyor", {
		controllerIndex = f1_local1
	} )
	LineConveyorL.id = "LineConveyorL"
	LineConveyorL:SetRGBFromInt( 16766208, 0 )
	LineConveyorL:SetYRotation( 180, 0 )
	LineConveyorL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -159, _1080p * -95, _1080p * -3.5, _1080p * -1 )
	LineConveyorL:BindAlphaToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_local1 ) )
	self:addElement( LineConveyorL )
	self.LineConveyorL = LineConveyorL
	
	local LineConveyorR = nil
	
	LineConveyorR = MenuBuilder.BuildRegisteredType( "LineConveyor", {
		controllerIndex = f1_local1
	} )
	LineConveyorR.id = "LineConveyorR"
	LineConveyorR:SetRGBFromInt( 16766208, 0 )
	LineConveyorR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 95, _1080p * 159, _1080p * -3.5, _1080p * -1 )
	LineConveyorR:BindAlphaToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_local1 ) )
	self:addElement( LineConveyorR )
	self.LineConveyorR = LineConveyorR
	
	local Image = nil
	
	Image = LUI.UIImage.new()
	Image.id = "Image"
	Image:SetRGBFromInt( 16766208, 0 )
	Image:setImage( RegisterMaterial( "hud_reticle_sniper17" ), 0 )
	Image:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -257, _1080p * 255, _1080p * -256, _1080p * 256 )
	Image:BindAlphaToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_local1 ) )
	self:addElement( Image )
	self.Image = Image
	
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

MenuBuilder.registerType( "ReticleSnpr09", ReticleSnpr09 )
LockTable( _M )
