local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ReticleCrosshairCornerBoxes( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 10 * _1080p, 0, 10 * _1080p )
	self.id = "ReticleCrosshairCornerBoxes"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local BoxTRShadow = nil
	
	BoxTRShadow = LUI.UIImage.new()
	BoxTRShadow.id = "BoxTRShadow"
	BoxTRShadow:SetRGBFromTable( SWATCHES.Reticles.DarkContrast, 0 )
	BoxTRShadow:SetAlpha( 0.5, 0 )
	BoxTRShadow:SetScale( 0.05, 0 )
	BoxTRShadow:setImage( RegisterMaterial( "hud_reticle_plaw_reticle" ), 0 )
	BoxTRShadow:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -1, _1080p * 9, _1080p * -9, _1080p * 1 )
	self:addElement( BoxTRShadow )
	self.BoxTRShadow = BoxTRShadow
	
	local BoxTR = nil
	
	BoxTR = LUI.UIImage.new()
	BoxTR.id = "BoxTR"
	BoxTR:SetAlpha( 0.7, 0 )
	BoxTR:setImage( RegisterMaterial( "hud_reticle_plaw_reticle" ), 0 )
	BoxTR:SetBlendMode( BLEND_MODE.addWithAlpha )
	BoxTR:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -1, _1080p * 9, _1080p * -9, _1080p * 1 )
	self:addElement( BoxTR )
	self.BoxTR = BoxTR
	
	local BoxTLShadow = nil
	
	BoxTLShadow = LUI.UIImage.new()
	BoxTLShadow.id = "BoxTLShadow"
	BoxTLShadow:SetRGBFromTable( SWATCHES.Reticles.DarkContrast, 0 )
	BoxTLShadow:SetAlpha( 0.5, 0 )
	BoxTLShadow:SetZRotation( 90, 0 )
	BoxTLShadow:SetScale( 0.05, 0 )
	BoxTLShadow:setImage( RegisterMaterial( "hud_reticle_plaw_reticle" ), 0 )
	BoxTLShadow:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -9, _1080p * 1, _1080p * -9, _1080p * 1 )
	self:addElement( BoxTLShadow )
	self.BoxTLShadow = BoxTLShadow
	
	local BoxTL = nil
	
	BoxTL = LUI.UIImage.new()
	BoxTL.id = "BoxTL"
	BoxTL:SetAlpha( 0.7, 0 )
	BoxTL:SetZRotation( 90, 0 )
	BoxTL:setImage( RegisterMaterial( "hud_reticle_plaw_reticle" ), 0 )
	BoxTL:SetBlendMode( BLEND_MODE.addWithAlpha )
	BoxTL:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -9, _1080p * 1, _1080p * -9, _1080p * 1 )
	self:addElement( BoxTL )
	self.BoxTL = BoxTL
	
	local BoxBLShadow = nil
	
	BoxBLShadow = LUI.UIImage.new()
	BoxBLShadow.id = "BoxBLShadow"
	BoxBLShadow:SetRGBFromTable( SWATCHES.Reticles.DarkContrast, 0 )
	BoxBLShadow:SetAlpha( 0.5, 0 )
	BoxBLShadow:SetZRotation( 180, 0 )
	BoxBLShadow:SetScale( 0.05, 0 )
	BoxBLShadow:setImage( RegisterMaterial( "hud_reticle_plaw_reticle" ), 0 )
	BoxBLShadow:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * -9, _1080p * 1, _1080p * -1.25, _1080p * 8.75 )
	self:addElement( BoxBLShadow )
	self.BoxBLShadow = BoxBLShadow
	
	local BoxBL = nil
	
	BoxBL = LUI.UIImage.new()
	BoxBL.id = "BoxBL"
	BoxBL:SetAlpha( 0.7, 0 )
	BoxBL:SetZRotation( 180, 0 )
	BoxBL:setImage( RegisterMaterial( "hud_reticle_plaw_reticle" ), 0 )
	BoxBL:SetBlendMode( BLEND_MODE.addWithAlpha )
	BoxBL:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * -9, _1080p * 1, _1080p * -1.25, _1080p * 8.75 )
	self:addElement( BoxBL )
	self.BoxBL = BoxBL
	
	local BoxBRShadow = nil
	
	BoxBRShadow = LUI.UIImage.new()
	BoxBRShadow.id = "BoxBRShadow"
	BoxBRShadow:SetRGBFromTable( SWATCHES.Reticles.DarkContrast, 0 )
	BoxBRShadow:SetAlpha( 0.5, 0 )
	BoxBRShadow:SetZRotation( 270, 0 )
	BoxBRShadow:SetScale( 0.05, 0 )
	BoxBRShadow:setImage( RegisterMaterial( "hud_reticle_plaw_reticle" ), 0 )
	BoxBRShadow:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -1, _1080p * 9, _1080p * -1.25, _1080p * 8.75 )
	self:addElement( BoxBRShadow )
	self.BoxBRShadow = BoxBRShadow
	
	local BoxBR = nil
	
	BoxBR = LUI.UIImage.new()
	BoxBR.id = "BoxBR"
	BoxBR:SetAlpha( 0.7, 0 )
	BoxBR:SetZRotation( 270, 0 )
	BoxBR:setImage( RegisterMaterial( "hud_reticle_plaw_reticle" ), 0 )
	BoxBR:SetBlendMode( BLEND_MODE.addWithAlpha )
	BoxBR:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -1, _1080p * 9, _1080p * -1.25, _1080p * 8.75 )
	self:addElement( BoxBR )
	self.BoxBR = BoxBR
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		BoxTRShadow:RegisterAnimationSequence( "Onfire", {
			{
				function ()
					return self.BoxTRShadow:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * 4, _1080p * 14, _1080p * -14, _1080p * -4, 0 )
				end,
				function ()
					return self.BoxTRShadow:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -1, _1080p * 9, _1080p * -9, _1080p * 1, 200, LUI.EASING.outQuadratic )
				end
			}
		} )
		BoxTR:RegisterAnimationSequence( "Onfire", {
			{
				function ()
					return self.BoxTR:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * 4, _1080p * 14, _1080p * -14, _1080p * -4, 0 )
				end,
				function ()
					return self.BoxTR:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -1, _1080p * 9, _1080p * -9, _1080p * 1, 200, LUI.EASING.outQuadratic )
				end
			}
		} )
		BoxTLShadow:RegisterAnimationSequence( "Onfire", {
			{
				function ()
					return self.BoxTLShadow:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -14, _1080p * -4, _1080p * -14, _1080p * -4, 0 )
				end,
				function ()
					return self.BoxTLShadow:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -9, _1080p * 1, _1080p * -9, _1080p * 1, 200, LUI.EASING.outQuadratic )
				end
			}
		} )
		BoxTL:RegisterAnimationSequence( "Onfire", {
			{
				function ()
					return self.BoxTL:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -14, _1080p * -4, _1080p * -14, _1080p * -4, 0 )
				end,
				function ()
					return self.BoxTL:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -9, _1080p * 1, _1080p * -9, _1080p * 1, 200, LUI.EASING.outQuadratic )
				end
			}
		} )
		BoxBLShadow:RegisterAnimationSequence( "Onfire", {
			{
				function ()
					return self.BoxBLShadow:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * -14, _1080p * -4, _1080p * 3.75, _1080p * 13.75, 0 )
				end,
				function ()
					return self.BoxBLShadow:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * -9, _1080p * 1, _1080p * -1.25, _1080p * 8.75, 200, LUI.EASING.outQuadratic )
				end
			}
		} )
		BoxBL:RegisterAnimationSequence( "Onfire", {
			{
				function ()
					return self.BoxBL:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * -14, _1080p * -4, _1080p * 3.75, _1080p * 13.75, 0 )
				end,
				function ()
					return self.BoxBL:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * -9, _1080p * 1, _1080p * -1.25, _1080p * 8.75, 200, LUI.EASING.outQuadratic )
				end
			}
		} )
		BoxBRShadow:RegisterAnimationSequence( "Onfire", {
			{
				function ()
					return self.BoxBRShadow:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * 4, _1080p * 14, _1080p * 3.75, _1080p * 13.75, 0 )
				end,
				function ()
					return self.BoxBRShadow:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -1, _1080p * 9, _1080p * -1.25, _1080p * 8.75, 200, LUI.EASING.outQuadratic )
				end
			}
		} )
		BoxBR:RegisterAnimationSequence( "Onfire", {
			{
				function ()
					return self.BoxBR:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * 4, _1080p * 14, _1080p * 3.75, _1080p * 13.75, 0 )
				end,
				function ()
					return self.BoxBR:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -1, _1080p * 9, _1080p * -1.25, _1080p * 8.75, 200, LUI.EASING.outQuadratic )
				end
			}
		} )
		self._sequences.Onfire = function ()
			BoxTRShadow:AnimateSequence( "Onfire" )
			BoxTR:AnimateSequence( "Onfire" )
			BoxTLShadow:AnimateSequence( "Onfire" )
			BoxTL:AnimateSequence( "Onfire" )
			BoxBLShadow:AnimateSequence( "Onfire" )
			BoxBL:AnimateSequence( "Onfire" )
			BoxBRShadow:AnimateSequence( "Onfire" )
			BoxBR:AnimateSequence( "Onfire" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.player.currentWeapon.shotCounter:GetModel( f1_local1 ), function ()
		ACTIONS.AnimateSequence( self, "Onfire" )
	end )
	return self
end

MenuBuilder.registerType( "ReticleCrosshairCornerBoxes", ReticleCrosshairCornerBoxes )
LockTable( _M )
